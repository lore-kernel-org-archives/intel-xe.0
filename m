Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94124CCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 05:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD8910E294;
	Thu, 16 Oct 2025 05:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXhbBdAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA4E10E294
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 05:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760592811; x=1792128811;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8jACPSLeVh4k+HGlaJiCAKtKSC3vX2E6KWKD5RvyOD8=;
 b=BXhbBdAajA+pLS89KuKsU6v4sA2tTf2/ylo5HCMqWpqokgnQaeqqzolG
 IU2ftdtuiyh3K474IGAXxiwbae+sRr9QsjF8XuoOFtg0LxLvbNlw3jK7x
 EI6eHVvkxie2bwwmBbi9+jPqs9nv2NQAxHF4gwxBHW9nIWJumqnNyEYIb
 1L0xqs1+S0tMqsVt+yk/22+GxuslWkjyeCzydQeqGs4zWETvzqBvy/hcc
 dS966kde3425xDHBq/capOxEhkVzQP9tG2qpPSGpVh9zrhoRw3CpPtcxm
 n9ZgVDYhoELrp8dbqSN2m1kKGu4kQau8yhApCLN6cN9QEAe4eODfVUeRn w==;
X-CSE-ConnectionGUID: dQeF1SdVRSmGwiwhtRtAgA==
X-CSE-MsgGUID: NuvQESQBQgW+infAatfsQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="50342555"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="50342555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 22:33:30 -0700
X-CSE-ConnectionGUID: 0KtisnfzRRaXtnuRhpG+AA==
X-CSE-MsgGUID: aYSuzpYfSRe0W7W9gdB2XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="187452359"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 22:33:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 22:33:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 22:33:28 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 22:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mws1pDQHAgoNqienDRT556JPC7Naq9JYXdmM6CUY8DnPwpbxA9qIKU1zhKps4bKIpDvJbDd8hraE8VVyfVX/YnWHGfNmNIBNO3yzFbByWrzO4tSOfeDbgnFIH4KNpiCzH2aGlH3cYgwN8Qz669AfX+EVOyUkAWYDzi5iZod+4Z+osQ/RsPwDQZCYz5NVy189ODjLScDFPj9WP0bTPMITP6RBrlt1kEUD4eISpN2NjpUCZMZPd/xqJ9IQD7f0lY1j0j8Fu45R01fD98HJ87aPLaTho0VmzOVadit5llBXz4rGCqWdArcV5QDA+4qPg749xBhWJ/xyoUDwAvNU0r776w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uum+nHOe+gsbgdBtOBdmpPEkr6m1KUmpdMY3FPHVhCY=;
 b=ujikpZLzgrTXhn3NfPrkI2zNneDO711s1922wqSyG8jYvWENIIUB3KEO2/tWtEMCJVBR3h2BKMSXRCvw9ZtpT0FbhAPwWhl23Lw3eVfQG3h16eGAuEGGSPR3JSuUHQzcNIYOPoCghUgHD1hwbQikHxcPYVUUmq1ilycBNCFlQC4F+u9kIYQY2p3ZvdlnDEbY8UjMdPwOdvVclWa1H8zTiC9y9qn3yGNJiRXmEWgoUN5tSqB+ORnSW7M1GVqE8gTjmGYIUV4SkJf7zYLX+5ECjulxD2dC4hu/QzAKT/V9r1HVICaw7Cmvn/9y3Lc0PMACL2WqEwyX4f8dlHSblKyv2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 05:33:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 05:33:18 +0000
Date: Thu, 16 Oct 2025 00:33:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, S A Muqthyar Ahmed
 <syed.abdul.muqthyar.ahmed@intel.com>
Subject: Re: [PATCH v2 19/22] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Message-ID: <2c4yb7mcc5r2nbnnb2ncg2kmjhl2vp62da5u3gafh7lz7uudyk@nkeqesrnpbqy>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-19-b9189b3056a2@intel.com>
 <20251016000742.GM5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016000742.GM5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: d390c0a7-88d2-48cd-dc02-08de0c7582a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SmHm6AqXjsuBgInNOy8M7uhp4BGm3MM65lqEtoAe+yznQgsGig44ha6l0Tqa?=
 =?us-ascii?Q?Q83Qitb3IwODG+NDX3FwjdwWYbMVkVoOPkuxNGFTcrGITTNcTOj3FbkjlBwn?=
 =?us-ascii?Q?eia4sEyupkUpm1VedQSznf30Tor22ADgz+KsSVAwIIvcTreOnXkoX9i3MnTi?=
 =?us-ascii?Q?kIjwD3Io6beTRiwi4gYHKcU3N2fFPT6Uoju2i38onZp4Ah9rAuPdKy1QcEf1?=
 =?us-ascii?Q?vJbRVROM7W9XZBNaDRJs5DmfWHzQsbnEVujfbeQJvK6ZawF2UVg5m1KAh+aP?=
 =?us-ascii?Q?ixRb3lnCAcQ0uaMLfUIdF5lghfSx9Ja3VZZAoxJIzUlA9CRPu8V0VDX9HeYa?=
 =?us-ascii?Q?WHVhnchxmPIJw+iyCSW9z8bCBABhVyd/utHzu03lJJ5rgYC7MeFHxz6UWWKE?=
 =?us-ascii?Q?t96VD/uO8qzLbZQx19blvri0/lT+DY9i5Gf7VK0Jsf0o+Mi/0dSd3/4NUd8t?=
 =?us-ascii?Q?r7TLFvFC/0b7lkZ0FXfKdJ/8MkE9aik0pgSjVhUtNltzajwCPJZ7IiQKg6qY?=
 =?us-ascii?Q?tQOvEX6+dKYNJFLAvdWXAqR1vkIjLmLV670+KOmDEY/LNXgzI7suJpTvMpdL?=
 =?us-ascii?Q?lpyXXL7x2e4woMZCpjLFQToCCrNYuvXojwDefcFmTajxDJlEiparOmiKlbqI?=
 =?us-ascii?Q?FxU6hsPeuPdwCnnSryU26Zul6Ni6mXR7byVLcDUC97K8ofJ76tl1VYH7ITJd?=
 =?us-ascii?Q?zJch4YMWpIPTXwkch9ABSTI2KOOxFQF7+5nRdvE1UhvJ0BPNgrYvnRD491P1?=
 =?us-ascii?Q?620EiB3Bn7En+lbSkwKPeZMtVfGz1mlQjgrKLhrCQziVzzKUWS0RqAjTs5XF?=
 =?us-ascii?Q?p9j1rD6cQB9vnphGtUitOBaLGVsQ26yF/k1Z9pJkNh3N1pOmia53hfNgpfrT?=
 =?us-ascii?Q?DHq7+Ch8tQx4rwXmhmEU/sNGIXv0nKRYEc0lVjAYRqDqji2z/9xhXaJk0AU0?=
 =?us-ascii?Q?owwLKYyAhYPtx3AeaYX5inW56qEERKbC9pSVoFgGXGDoH8vNxxKN26uOKQT0?=
 =?us-ascii?Q?L9D37DvSS1z5ZWwFYN3ZuoKVHmPBlI1sYowxVbM5ykVoXn3jAQlLx8Op6wPy?=
 =?us-ascii?Q?x8xtMT5xAZSOTQuzHDcQS5Pj37mKVtGQTa1Bb2D77Q2tjsnLKfdzXkCVv0i7?=
 =?us-ascii?Q?+56anU05VsB4fEedSSAhHEIc4u1g/mplJoSeklVQE4aEN2d+Y/3Da2UnyBNs?=
 =?us-ascii?Q?rFe8rQh0hH4sq7ldc4vcoeB01kgkGOXwt+102pf7WuBh2T4HqsYLHnSFybsU?=
 =?us-ascii?Q?xcZNDzoxwp5lBrCGGJhae1cX6pRTYBbCXGjCmL81BYmeP1gwoOxEcfH0i+Bp?=
 =?us-ascii?Q?A91Ue/BBwG5hx0Ew3p92KfmOsaOruTrNAs0KH7E8cX6oHunWUEQVp5wjmiT7?=
 =?us-ascii?Q?vFT6iKAjHXb/33Q/3IDd81cnbAruo+qQ+qt5bFCzGt5DmX6BOJJ9NSed1hpK?=
 =?us-ascii?Q?0oWtKRBNsTjEMYzIH42tnLYP89xAsWVo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Q2EDXYqF9KEXy5i6/TeQ0XYEvk+B6wdNtuQLpafFTxWLFSTsZy4wWlJkZe4?=
 =?us-ascii?Q?9kwRjuYZZnp3+MHFFmvHkAUqIlO5ISDtdMBadnSiOrEFo8z/dUouHqRlNEhI?=
 =?us-ascii?Q?4d1kb6BiafyNTlx/xrlkd1Rz7zR67uCFKHKV6VXCci29LUkW8/v/i2Ak+br+?=
 =?us-ascii?Q?zlTFL+LMwpKCaqlAhm0CVwQHIWagdxxhrRokMTpIY6tyPioE0Q27olEY+Zcl?=
 =?us-ascii?Q?jM49Jkx4aCkAC8JQUQ3EN6ea6/U8DusGeqkwDO9F+yjGzN9wUR3jP2btQ82Z?=
 =?us-ascii?Q?BTcGgWIGlPoH2v4ZP41kzcLRiPoxmKTQXBv+q4u9y/tKJUJmNzE4zLqHB5+z?=
 =?us-ascii?Q?PJtW30+V9qZYU7WZHaR5YGWNFMY3wc93sTX3DU8crfDhIa/uDbmftwGykj1L?=
 =?us-ascii?Q?IEJHl7bD6nNsR0VjiHMuMNSXPVU4A/7XR0TxcVK11aIWm3c9zQr1r4BpI8fN?=
 =?us-ascii?Q?nNHwZdNNk2wBzICwlQplCYh5gfKGKRC7OTj52GXg0ZRBSPkoZDmr691zYKzI?=
 =?us-ascii?Q?dQEDdPMqGCjCHlQ6XucJqAUBVf4b3oBwO7qc4FiUHb+QlDosCPrv8f0T5ZQL?=
 =?us-ascii?Q?rWq+UCD5iJuNsCq+PscStC3GLqAbsNTpvnbtoih9vw5JKM21uLrTZ/4HpXha?=
 =?us-ascii?Q?WlgUwTE2M24xvPwYzESGeufTaMxBM8Vs6KWTWl5AN8FRw9rozHJwoNDTjlha?=
 =?us-ascii?Q?SKoLelkMWTcxnxvCSU3pWUrO7jocjb5k7kvtP3z/zM0SIO7FYBToMEV4MsPJ?=
 =?us-ascii?Q?vSomKMt4n+mX303cnulgjDcezciZi6lVMGhzLLJXw7ivQupJd1+8EFuISTge?=
 =?us-ascii?Q?OIB/LKQMWkOQ055d7Px1ADUVswtMaWRH77gVSLcHDgWPnneO69Hx60VS8zd/?=
 =?us-ascii?Q?bxdWDcY4GQc9G2e+z/WyhvR5E5Pl6CxQqC4V3mxzeV4DDgUSZJj1dLxMBUpH?=
 =?us-ascii?Q?bhNBhkkVEvaIY8mGhHncYBfSnXWASzcIiWK80AwIsaZPoaREJ4g+v1nKWyJ0?=
 =?us-ascii?Q?mB8Do08pD390xjflTRHKWoLCWQ1bD9JhCss3HvMiMqkCZ36OjKO503VU1rNi?=
 =?us-ascii?Q?EDmz3P6OlOhTL1OwyLIDFmvNMf4da1O4/qfPy7vff5KlSWnmr9BE6eXTogK7?=
 =?us-ascii?Q?iFEr2KCLfUQl9/IlBtapVqOvEM08jGvRjU1nEj44TXFpo3k1yavZEoc3R5Ca?=
 =?us-ascii?Q?XfF2znZsw7+23Nvx1LPVq3D60TEICqUFU/l9btUOwwNVTK3NLS6dwg+wStxp?=
 =?us-ascii?Q?JrW6FzfI+ZSxA+0yy/Xo8hzd0YtjwUQJwxROrQ1gfU+Ot/ntCe9SGurLoIGK?=
 =?us-ascii?Q?vqOpqK4JnVd8L2ecH3JSLRZ3UTdhNkdBRnw27VIjS5DtFpApu5WX+F/H271i?=
 =?us-ascii?Q?de/aZNFdtFsAsLFTt0FVB/vKczFwEd2Z6EmDdRCreWLCJ4gMe0saumyAfPco?=
 =?us-ascii?Q?5K/dtW75hTZZJ7kRJ22dZbkn+8AQaSZNHdYfh2O5L8y/fADYp1QskQM7QRus?=
 =?us-ascii?Q?DVkQVKVu0Vj0VsnIgUnFoYkYefYVFEkUtBUAiiaRiDkux0xppa9RpKUd5Vcq?=
 =?us-ascii?Q?0b//pKncuo9Oq54QPj96g74F95S/r4wd0H9uy3HJfvMi2cY5ykWk6kE3505b?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d390c0a7-88d2-48cd-dc02-08de0c7582a5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 05:33:17.9385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOXjx17+Eb9GOxa5BTHs+nwgYLZ3YUXtoZCI30bBQureL8gRgTgjZuLi6UT5Y6xbMJdKOTk7QfENDqD1SpoRkDRJXFsnE6XACXpTvsNC3gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8686
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

On Wed, Oct 15, 2025 at 05:07:42PM -0700, Matt Roper wrote:
>On Wed, Oct 15, 2025 at 03:06:34PM -0700, Lucas De Marchi wrote:
>> Current implementation of compute walker has dependency on GPU/SW Stack
>> which requires SW/UMD to wait for event from KMD to indicate
>> PIPE_CONTROL interrupt was done. This created latency on SW stack.
>>
>> This feature adds support to generate completion interrupt from GPGPU
>> walker which does not support MSIx and avoid software using Pipe control
>> drain/idle latency.
>>
>> Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2: Rebase on split mask per engine class
>> ---
>>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
>>  drivers/gpu/drm/xe/xe_irq.c           | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> index 7c2a3a1401424..9c46b5fb81412 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> @@ -82,6 +82,7 @@
>>  #define   GSC_ER_COMPLETE			REG_BIT(5)
>>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>> +#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
>>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>>
>>  /* irqs for OTHER_KCR_INSTANCE */
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 103804546b280..ac5524cbe4b9a 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -149,6 +149,12 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>>  	if (xe_device_uc_enabled(xe)) {
>>  		common_mask = GT_RENDER_USER_INTERRUPT |
>>  			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
>> +
>> +		/* Enable Compute Walker Interrupt for non-MSIX platforms */
>> +		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe)) {
>> +			rcs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
>> +			ccs_mask |= GT_COMPUTE_WALKER_INTERRUPT;
>> +		}
>
>It probably doesn't matter since our execlist support isn't functional
>and we only really support GuC-based submission, but technically
>shouldn't this be outside the 'uc_enabled' check so that we'd also get
>these interrupts if we tried to use execlist submission?
>
>BTW, is there more support for this coming in future patches?  Without
>MSI-X, what's the mechanism by which userspace finds out this interrupt
>has fired?  We're unmasking/enabling the interrupt here, but I don't see
>how anything happens once the interrupts start showing up.

Himal / Syed: any detail missing here?

Yes, AFAIU we are still missing the change in the irq handler to get the
notification and the mechanism on exec queue creation for registration.

Lucas De Marchi
>
>
>Matt
>
>>  	} else {
>>  		common_mask = GT_RENDER_USER_INTERRUPT |
>>  			      GT_CS_MASTER_ERROR_INTERRUPT |
>>
>> --
>> 2.51.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
