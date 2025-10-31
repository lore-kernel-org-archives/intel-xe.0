Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B5CCCF9EB
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 05:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E7610E18A;
	Fri, 31 Oct 2025 05:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sc+kLfZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8023F10E18A
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 05:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761889052; x=1793425052;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4S+0bWCzEsgWyMO84oLwfM4pqp6KTQA6ot245NbanAA=;
 b=Sc+kLfZF2/Hi67NJijSbeEfvzCrGrqL2+tQhk0CFLCr9Df4rN08GTRH/
 TdmmIGC1cjEwdFqPAwk8tyj/TlhvHuwlDWucdHenuNpKyfUjWxaa19mUN
 P+KoZSgc6zfQWHqlxRJgoZWbOnZc+kA0DjxdJm6c8X5jd5/+Fa4OjiYhr
 bpILOQzkcma+32Q9/ug/Sd+k+qrH+EDhKLfFtvzJqvlg0c/CnwHcHgVTS
 bWrtn32PI8ybBKrlHCUE6apg7IEyMOGKcpzJrZ2svKWmhqw4ujxYAG0r4
 v8QTwo0wN/WT5/CDq7LdYt5OZ/QXfftSlVjP6KCvKWSer0XFZInJDZr5z A==;
X-CSE-ConnectionGUID: WpnNx2N1QzK2J4IlZRsHPA==
X-CSE-MsgGUID: obgTbaseR86HlJ1SUgRTwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66656896"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="66656896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 22:37:32 -0700
X-CSE-ConnectionGUID: Ps0opM2NSCK79xXRX0nDIQ==
X-CSE-MsgGUID: L10XEZEiR/eQlkay2dg+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="191294483"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 22:37:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 22:37:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 22:37:31 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 22:37:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3CaU2HtxLvxn9jjmA/F6NBsHxg6Mw1P/DgoHkb/3GBZiB+e6ihAOD+g8XNp2J3yQw2VU6NitX/R31eIn9hv+lXObSuKPTT9tGAEJ9SSGdfwivQmAXOwTRxBQST+6vTpLQ9R7XraJBd6az1jfKtDNyaUBnmkGlUIJ7bVOuN9irvuxulgeLQnL9Mr+2K0CSlFacTzOzOXzW9pXo2/drNR0AkPshDkN7N3uksKuzDoFPbWwRbopGIfySNdHKAv2IEzArcfEyNHnOb/aDGazdHnD9guE6pbXi8IFdsF702QUwdfvUPJ7vO1z2g0s9BxHin9fAcMxjJ2u9x7o2KerATdQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S+0bWCzEsgWyMO84oLwfM4pqp6KTQA6ot245NbanAA=;
 b=Xa96ES76xmkpCQySMDLhs1n9ILjUgml3i7WtrdD1pcHO5Rq/bTf4qDw3uBQjO0X7yZsSBQmG4Ls1XFA40vz+wT6NX+qg203GvL52Vwy+VcnXWT+NGKNHVjXdbc4nOYkKgyltw0LorDZKiQP27IFWGGa3idV7xHhyAx7pSaHJ1YxZdicCEQV3be8zV/Ri6FWsqg48lnkPQLw26hgyFlFtDj2y1hA9q5OGsUnWO3ezR2cRLTobwNcXuAsGQATvTFQ1Cz8anVa6DJAILPXyVJdQ2kYoFNppDaPif5LwLEnDY80zn7DUD/1LIsn8Peq7ib8LVvN16W04LmTvH/VSqKKtSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 05:37:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Fri, 31 Oct 2025
 05:37:24 +0000
Date: Fri, 31 Oct 2025 00:37:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 17/17] drm/xe/pf: Add documentation for sriov_admin
 attributes
Message-ID: <xhw2kh5ic6tlct25gknkv2myo2ur3i6w4xouupf267k7ksqsl6@fvpqfxj53nor>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
 <20251030222348.186658-18-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251030222348.186658-18-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: ddade8f4-e8fb-41c0-19b0-08de183f91fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QGn42qiQIrCwNe3F4otm9tNyy73g2Ld14QxdDaPPGiJhfTPVp4MXqxZsRMPf?=
 =?us-ascii?Q?Tz1FTpY4jWMbiV9KkxnvYtmF5mk+CLhqMzJrdejHm/puHTzDCRroEUiG0VWX?=
 =?us-ascii?Q?n5HF6ETw+Tg6J2RzYVt+/a7f7WIkGRy+5Jkop8rS/clqzhF+TOHEaNIc7h1l?=
 =?us-ascii?Q?ZABlo2cBFZOgB6FI+/mD5hExalzzL7NaiLBXUBEh8Ly/8IQJOzoEoyomEkuz?=
 =?us-ascii?Q?JJJ4XVDtLAAXhVvflVqOGkiPYoIC0Mv4UWo7Qhq3VREh3nkIirMmkiFTo+8M?=
 =?us-ascii?Q?9XrVc7GmrXvgbUj4jDs622JNmaimy9VITpOhOICeQYxq9lW+1lipp0wRSMyG?=
 =?us-ascii?Q?nM1OGXfJppG0FjiGuBBRyhfh2eeEUxHXalkocfMnQyF3HdCTS7z7DOvNk6eE?=
 =?us-ascii?Q?Sa+O4QUt6WUl1sB3/OVu/EzdpcHlytV5VKsUg9x8EdVr05oVKJmkFOed0HQg?=
 =?us-ascii?Q?4RPlIBIh9Oaou64woXbGLBHPcpA2vIkeumudJN+LetD5/slU9EOHjX0J6PLp?=
 =?us-ascii?Q?1VjQk/m8hKHdIEtQFy18/vhkYNXNIN+FJIUax6euybi7rUzZc5XweYkuMV3k?=
 =?us-ascii?Q?MX2tM5XQoy/e2gPPj1WAeDYPfICqy6pdM8KZvSmPJ23SWqq/E7kJtK5JomM6?=
 =?us-ascii?Q?BXpLcUpGd6Ck2wdxxtKUbr4TVGQSHccho1EvwXxMZoPlpKdbkuOEiPwYo/hu?=
 =?us-ascii?Q?ovcgHCfRPyfcGJF6kXMgN5kEB5h7TyqKmCUWn3SSUXVBKQFBtPbzWU4e9H9N?=
 =?us-ascii?Q?mZ6+s4pnzebASX//1JslJJhMPSqb8wFMdLT1dLeoA5DYKJYYJPLSnkYa2Y0R?=
 =?us-ascii?Q?lH5rYsNYNJrOJKZh7wilB7KqQKL627Z6myZ0O2u56DhmxTwdqYWUkmMXH70F?=
 =?us-ascii?Q?jBpEexdS5GMkCfyvaBw9FwozfqfKKuj+cuff5vRM1ojsWzT1f5SyBzXepKBY?=
 =?us-ascii?Q?Qatg1fIy0cbM8Vj7SMEYvwa0rjB3QSGlaF4FP0SevyNSpgihT9GRQzKxfcfv?=
 =?us-ascii?Q?IxexlyuykAr+1oXw6APVNI8T4Qvrfw9OOwMlcitsHpOsyQM3NmRQxmd+klr6?=
 =?us-ascii?Q?0bd/uPJbD7TZr9Jl1fIHRwzudW5jT8umr1P+1dXwrTh5MmKbbFUcsgA3bV5C?=
 =?us-ascii?Q?cJTbe8yCAtDvi2Pgm4G1mtvgdxU0k6bGME9bieVqdzkenJCqdlN/X3gST4Yh?=
 =?us-ascii?Q?ALOC1fJw4HYW9ae3LZaaDJi32wsSz0H/uPjFw3DFImvHZLBDfX1PYG+IK/3b?=
 =?us-ascii?Q?6p74NYT3nE49Uq6Hkhp+goRVHOvLdl9FSf29bi8CxDk/3cnYRXtwY7XT3uRU?=
 =?us-ascii?Q?iv45BA18nbzTLAsxpJoSE8ne0yc5R0uhub8guU2sB/RAG7oLagnGpVYrzaw6?=
 =?us-ascii?Q?XAJMjFusy2gnYToyvGZLnnhYbBRiQ1g6VYkIRq3xLQZLlzPa2lycYikaYE/h?=
 =?us-ascii?Q?bHIavtwbfSu9Cp+BpmdMkpx1la6o9/Ff?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VOgTzrBnD7RntEMgJ61TVT3FMBQGImZFTuHPp4whFwUjYCqvpfaq6SjgFDYC?=
 =?us-ascii?Q?rMkpoPBrfxamd8fYfJC9LDZBRf/L+jT9vS6maJd/X5rnjeLEmHUQmxYDyV6g?=
 =?us-ascii?Q?aut0wDhs1F5Gk+bQ8TI2bcDr0GoHKkyUmhCF+zh0oHSkr6NAUlp0P06jZq/M?=
 =?us-ascii?Q?siJLf87xTTqw/sPRiYbfCQDw9kIaZrEHhsiEzUA3CtaktzjLoAHgwCjYs7IR?=
 =?us-ascii?Q?a8zEdeZ0r4WXnrHfxat5OCVy6MmxyriuuYbV3n991h0NIIhfDiVmb1PdXQoY?=
 =?us-ascii?Q?UmrTRE6aueVdYOANSbeT8faM7a+Mpzz5zYZDUZpZP7X8xYIqZxN6PP4ksUSb?=
 =?us-ascii?Q?vBjiZrxQTE3Yxg26sxx/5xNBJfwhF5Te3d0PATyv+WKCYhA5t5v9J0LfPVCB?=
 =?us-ascii?Q?4zqqLDvQ9lAWbwaBvKYGDPEhIlVvTAU0B/GFoTM/8+yXz9QE4GAW5EptTXuE?=
 =?us-ascii?Q?Tn7mF+dfpSgPJoLgH/UJA1qKJSQXt3tFC3eYHQQ7+UtF5vlUjmriHlnbDCb8?=
 =?us-ascii?Q?O41FRLDY5DR5LQ2bv3eUZP5P7WN3fcH3+iYQM4UuPBQQ05660tFUuUvjHw96?=
 =?us-ascii?Q?ycvmByBvTAr8nuDVT8daHwZJzChnjaVOCZy+CDRt964H1ztee4uwYVtwatzS?=
 =?us-ascii?Q?0zoYe6qzRbRIPa9wgloIeVfd7iBReGyc7thrcXs0MfdjM5RxemNt37ECV3n1?=
 =?us-ascii?Q?lo+3qv1w9oxm92GA/IX7EJ+Aw91639QPkv6AHh/JdSJA0SJwhgY/mTmt+uDG?=
 =?us-ascii?Q?K1Whniy1kSP+vHPXdeCeqIQ/OB9+kuLzNedBYpDM96JvTE9vH1+MJhPjsRS1?=
 =?us-ascii?Q?JM9edctajtwzCOcWNnQ5MmqTkdB/xG/jnMFnER9Ykn9WrMCL6KPUFD4iNJBE?=
 =?us-ascii?Q?pV0Ed2qdUndRasjX7ICo7WXy+oksyP34fx7+vLFWY1TUEAz/NWfvaya4pU/U?=
 =?us-ascii?Q?J0HuMQRJ2CUfkqSWyDftkiRIkBVSYbsB2WDpmdAsGA/ZfMk0lljjpvLpeouE?=
 =?us-ascii?Q?ql2EOQGqs88JewBaPA5OJWn/HldMoX/D1EJomSZvswxX2zuWqDQfEtp4KAsw?=
 =?us-ascii?Q?gQvoIdkScvAxbk0EN16Eo7azmT2WiKTkmS2qRKJZ7qY3KD6ZwMChtkBWWqsE?=
 =?us-ascii?Q?0TGvNX2bkn7iGmcRPwWf0NRyxL83mufYyFdHBx8nN/WC0oIsOP1Q6jEKt5yu?=
 =?us-ascii?Q?OlM/0q0wCqqntq39r9apwt6cGw4+tdON8f6KYw5CRHs/+yPJJ+OVmaixCgAY?=
 =?us-ascii?Q?A0ZlHQf0LO9Q2KG/qRCziEZwhbVwaRCsLLB6yrJ749NXyhmc2//stnxaZXq5?=
 =?us-ascii?Q?ykawtNb/hUcrUwuCQeB9LMZ3CHhk7uLukdeRJCAbUQfx+M6XBKPwUdtsb8Qs?=
 =?us-ascii?Q?sQgz3HzFun6PNx0rJ8r9JpL1Lwg5hQ6vDB9ly7o9K5OKGVp9MJpdUuBSTnx3?=
 =?us-ascii?Q?A5tjQ0GqWuAQ9y0vmMHGW4iCj7DrTwfAMs57yVdYMuui5ZT96NXA4JyoESki?=
 =?us-ascii?Q?u+eA84fnQkk15+kxyxWX+UlSyGJ3dQEIJI6hxuYaGDXCI6bnvHsIMoe7ZZpk?=
 =?us-ascii?Q?yJroghWgcUx21aVdnm3PZmpgD6FxP7skKuBAZ0ZFm8RWtJ8nJOiEEvqApFMc?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddade8f4-e8fb-41c0-19b0-08de183f91fa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 05:37:24.5893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6xLCXlymkI5KSaDiomDbIqxOcWFL/hX/GwbyVrD8fQl6DFDPF7hx+DSr5Kc9IZUjQ2nwOFi7j1j55CWFyIPebwJ84rv2uHcNVx1Wa1G/hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 30, 2025 at 11:23:48PM +0100, Michal Wajdeczko wrote:
>Add initial documentation for all recently added Xe driver
>specific SR-IOV sysfs files located under device/sriov_admin.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks,
Lucas De Marchi
