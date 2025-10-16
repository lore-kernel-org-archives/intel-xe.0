Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07B6CCD1A2
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 20:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4AD10E35A;
	Thu, 16 Oct 2025 20:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHC9eWZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AE610E358
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 20:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760646167; x=1792182167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AfJp3J7l+1fi9vGSZ9d27IgYwMTCDL8kljvUIkN8r94=;
 b=XHC9eWZ2DUbxPwUUxgz8MWnpLjUVSznZJPbSTuy/JIZchdP3yR8W7zMA
 dcjaOpUWjqZie5tu8iEZWAlR2pbcFRHbxpBtWLdoBRhAlN24VlzjrETec
 6rfMxjCnj5CATsom/d0gCFi+X6J1Za9yZmKQauMUPsiqiwN3qjUYrMtwM
 94C3NGSi6CI+nm29LPs8kbfoyTlzhepj05WDu4Znx+k8tc4KQWfG6hQ4z
 WSS923F/bqI4OJYhqedIQKKP9+l8VOBpFNp8JJugxRdec8AwDqU4wX1uA
 HFwutuEKewvw8Qye3seDnfITyH5IgtYr3IFD663CpirXW+AYDUfl/Jj89 A==;
X-CSE-ConnectionGUID: ZZl2QmEuTgKxbFvewSyAPw==
X-CSE-MsgGUID: W486LbfsQimFdl1rmUZ5Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="63000143"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="63000143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:22:47 -0700
X-CSE-ConnectionGUID: VL9B6218SK2puU1iwmXh7g==
X-CSE-MsgGUID: jZnc+QkSSxqxK0DxJiSoPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="213134948"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 13:22:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 13:22:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 13:22:47 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 13:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmfEXip1MLTcv6EF1B+KOZTkPx2IPTV/a/bK8/ek7qylETKZo9RICJQ/R8Bp5ZJZVocRO3urjiacRy8FJ1eLOs7ui28LVBlAbauokb/PW/pYAY8TKFDgPjS2XbzGRzyO/oe7ixt/fc5QOYWa2Y36ePA1TvwSGL9ckNoxanZHrdy4lCiovtV9Hz7Ez7hKJZBY4M48xHKjQqsMw4RS3jxBT/oaG//ftTDr1iHDGfApk3OOzbpP/T05lGpA2+R7aKNDvSwqO9Md/dd4aS5eurL+4qM9dKi52iA8qR5pp6/QBwPruYZs3zrWDCNLbbPymtgkFUs5LR8YAU0QE7zJd4a9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hGDDCjyF5ZnQMjGNBIe8m/HSTlCm7DyQEA+U8p/jf4=;
 b=cyLLIyEEbd61p5nMwNQPEBEszN74xLbJEd04476rPetzE6OhjvVztw6rsVDepT4keSryZ8NLmLJyrrtsz5K8E/Ofb0aaOyLk3mWckftvtbWeC1gaBUZ9MA3KrB0d8QBH1ddKvl/1CFrJgm7ShSdbQu2FyB/Vl7IyHmIiggitrggAp0qvLe4GQeKUSjKK9Q0zmB2kjIVtoL42c5xLQx6I6gU9gunds0Mkb5WddYwFHlEKzgZQcfheeAH5w39Nr58MAKyIjFrkTfKPJ0l3ivDzFFG2F4fTN9YDjtqZWr4qcVlz0bkX01w2rKXEZf6jY1XrsaLak66vea4OF1z5/nwuPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 20:22:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 20:22:39 +0000
Date: Thu, 16 Oct 2025 15:22:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Tejas
 Upadhyay" <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 21/22] drm/xe/xe3p_xpc: Setup PAT table
Message-ID: <ad2ckis4rlb3ya7rgyypzlvwaer7274osjtih2fpfs3jw24drk@pb2h2kzpipye>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-21-b9189b3056a2@intel.com>
 <aPEBiG3TlCvqDi2Y@bvivekan-mobl1>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aPEBiG3TlCvqDi2Y@bvivekan-mobl1>
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: d344a359-bb71-4852-e8a3-08de0cf1c0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u+7h+xUSSGi9DVupD2jHkPgcG6kuYl13P+zbq3Q6KWmWo0U27e/lcO8Ucp5Y?=
 =?us-ascii?Q?jrnt2GT8C+pINQS1lSpkBzU8Uv44kBRDtwx4R7q7OfkNmVHkMdGlDqKx2jHc?=
 =?us-ascii?Q?Fxmj9GsQanK1ERf5DgSLExeFR28kTd+QcWZU7O6k8OUZ9z0NK8kb6tpsUsaC?=
 =?us-ascii?Q?06JRcG5leW/ih+qs5LhAGIG76yUgMhHvEwy549fiXlptTVsXk0iIoPoCxFK7?=
 =?us-ascii?Q?U6Wxm6ZjBrMlp9ck+gmbaJME5D/QTdrPe5ZOFGnM3kzpwxI/l/PQkDCABBPd?=
 =?us-ascii?Q?5+SWv8wUdmDtecxhCYRI8WEcs+sR0fjyj2PHTW3zJ5Qeis9a7q84sOboV++H?=
 =?us-ascii?Q?/E7Yh/agon64XGbM8jKrhb+Aunpk//6M2G2ghtcS1azdhRkxXlBnE7jY6sIh?=
 =?us-ascii?Q?+H6e/RHUBtt+nrRVuTr9bM3q0llNPzK3ILNtARNkshQpdiLYwCFEfTN1jSck?=
 =?us-ascii?Q?LxtZjDEJ100bwhay/umNFTImfQAzQSe1K/hKOqbzsM2d/AkzS6ie0BT6wVZm?=
 =?us-ascii?Q?yFbCl0lEx13kRF7cF6M2TE/veRZcYGZDHC3Z1c5tCRLT4vLJsDPOE5bkCOzV?=
 =?us-ascii?Q?DCu3CH5xPOz4dFwB1ya/aSN4EWBxwVX1gkWK0OP2/AXJuSaTNMNlneGkjqaf?=
 =?us-ascii?Q?UGXuoyiBl/Qh/RpMxOHVy9YXs5Eq7OMzVIg3NA/4vphXmWGMYH8dmJZxU6m3?=
 =?us-ascii?Q?Q+f+o7lLRGZ2g2n0EtXqjqgcKdM7DFGy8m/45yyyRofNDm6SRs6xZOK3NZn+?=
 =?us-ascii?Q?6o107ft7UAn5l8YCaOYPRc674w4+v7IgKu0cACyM23v9RuivYQ/tPXRLZluV?=
 =?us-ascii?Q?qWzddVtWuXmW1lfIbhUKXWTiZLNm0QjeW6ZofaDQF299wzJfOf+Ao/kvRsPk?=
 =?us-ascii?Q?GqhpIeqcVoQFcpv/ODip4RQ60An+faaxrMgmlDQ4eBPxz30/5SioF8vbA1uj?=
 =?us-ascii?Q?BNuxRB90h16cyjSra98JZuM64FfmgVsxVucWgWVmwcIA8cphxSb5AqtI5uCE?=
 =?us-ascii?Q?Af/qjreyqzs9V7cXoFji5iOhtNgwDvnkPFbxZCXUCSleLs4CNlXU4FHr8SA/?=
 =?us-ascii?Q?OUXscGLASIgG9VGokjd2pfBLlAJGtYF79tyANdq3yHL+ajWklrP2LnI570Ad?=
 =?us-ascii?Q?Q9Hvi3mews8cEKMSXNhfq5IpDiWDR7lS+R0J59LaGzM9mH5tOQy9eQ06pjP1?=
 =?us-ascii?Q?7Mhq/hw341KSZk0uxQ7W4SfR+YzV35Mnn82/0OgosP1TrtMkiDwvydpOal83?=
 =?us-ascii?Q?JLc+fX88gLkl7okHr8CJPJnhxvVR4dJUVNEbayWZO7I0qjr6wt+4tcN5S6TI?=
 =?us-ascii?Q?B4Mt//y5XO2QlSLGiRGtxF133ErufgZ/te8Zdi5GyEe4TzwE5f4zD4fsJaxh?=
 =?us-ascii?Q?dpXca1u4Lm9uIzM73IPcGkrYlkdm6CK8/VLkHIEtw3amrzlf6hjtSaABY6WP?=
 =?us-ascii?Q?eHqzu6ECTRFeh4gpDofCqxwyfC0ZL3cR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h/7DYD8Th6KTr7ZLbJ7pUMjbpxAx6VPN3eJcxKHGzEd8DAXIuD7LceCPuLWf?=
 =?us-ascii?Q?YRxwIl/DE6fDqT/FRZNTUBFknrFeAaBttQxU9QDJHfSCNnaEjN7LHx3lcPoh?=
 =?us-ascii?Q?cqXOrXw9zOSDI1EfnV9i7ZBwslJ697rtXUEIpeUGn6BC8nns2QQJPpKqCafZ?=
 =?us-ascii?Q?jJ8GR8gNAEiIsqaoYqlSc3/joMY4lAcG/vPjTrPCNM9Z8j4Dvin0tix/pNh1?=
 =?us-ascii?Q?W4yizD8pfEQ0Z3mJ2AD5Fa8puCGNXu1I19RiFk9LnK8Zsc/v1IgsJE1BR+xi?=
 =?us-ascii?Q?e0EYpc6oHh1qqbXmCYX4VgwAegf7MJnRIcYr4mfct9CXlVFpSsgFGKyF+yem?=
 =?us-ascii?Q?nF3q1SyoSEHu+6flmoC5Oe1G9Di0DvbDaTTTZFfoFCRs9SYmZQskcicHQFa1?=
 =?us-ascii?Q?2HNdZiN8WiRuamzOa67phVanHKiOnjCzhm0kvowvj8EWRI4NrtRL0bxE1wkd?=
 =?us-ascii?Q?LHq8gNF3kVOglHJLZDNWBRQxewSaZyMUNwVkjjsOw5Or7N+OU2tlMNxjl//+?=
 =?us-ascii?Q?rk0S2Bd+Z9mxTG5YZkOpqDZpWmfEBuH2RD+gBexIIkiJa73y156R/yIHNOj7?=
 =?us-ascii?Q?/ua1xi6wSYWbDqKzO2GMWQfrZDyPaFkrdJmTAbJFUR4H7jTGukoBsYIPEC+V?=
 =?us-ascii?Q?/3anmVvmgvVupCB+g8+q/bShd0cqgHH4HXtXStxNvQTU6NMoKMbv/j4rWUti?=
 =?us-ascii?Q?EG3Ztb0l1Jqkzt6WNFi4CKOhaYR37S/A9AY4wPW3eV8EdImtHqoDswOedLMJ?=
 =?us-ascii?Q?GRxmxjYicGxou3ktzhEnjDjUmkFzmpMiK3TlPaJtTi2Zmp9G3C9z18eXuOh2?=
 =?us-ascii?Q?uuwoZSYN0LVV473MO5ZsCqFjAat4nKuxvHFAz+psqpRa4G4CAA24XRm2Rx+Y?=
 =?us-ascii?Q?/zEz16qkjjdHevw2m+EU9OKOURrIGqNyU1SUqtkI5bFbjCh/uRxeirUBN9tF?=
 =?us-ascii?Q?tYBEpJ3zU4jEz/Xinn2YCXUd6BcNqyGyUV0A17EeVyf6+jBsx8YCBHMa67RQ?=
 =?us-ascii?Q?0aqIIa6ffYYjr9L3NjUgDZrd5v4L7GHNtd6/tmyLgzeGaxEk6rByYLKD4Luv?=
 =?us-ascii?Q?SLovvuISFLIX/StSIDmRGHKTuzxJ5/6ZKakJgCeXFR6wjM8br5ey9UzGAhFa?=
 =?us-ascii?Q?L0uLbg1o3+C0eizn+or/7ZIJpIQNDdSNFHXjYd5B8HuU/SYheM7Tc+FMMZtz?=
 =?us-ascii?Q?DHbwnImpQ0O9Fs/WRcEfdAmv9dBJgngBLIBu+O1wgCv7Mr7jjmVz+Ptx5jsO?=
 =?us-ascii?Q?rdEskDBkvkT5P0ETXHku2XpuikSbkbj5gFggHtzMcJUdl55pYbe/A/9DbNJC?=
 =?us-ascii?Q?7w127SwUCp72+CkCUmd1KxNu7khOXcCaGsiVnF55WCkBSFRxUtA/MUO9skoa?=
 =?us-ascii?Q?3QZQbLnlf8TnpDsVnIwmEzS5ynAdsl+W4W5+M9sZFySxcHusRGAkrRXwWjvd?=
 =?us-ascii?Q?Q5KEdwuWw1JpZDiHF3KOFJcCpyf3NrOneJv0XMCyM9oFPs+GkPhjE60ArYXc?=
 =?us-ascii?Q?ZncbkRiqfVxREn8JTq0cRKEE7GPXqtNxdoQuRDWCs87On7DVYlMgMxgfr18S?=
 =?us-ascii?Q?2wS8dKwYiiXBEznnVkW5s945T6RFOarGCbhfmFcHH7l1pqqystjiaspF2bFe?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d344a359-bb71-4852-e8a3-08de0cf1c0ea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 20:22:39.8216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCUafq/ynkToM4oj6i3I/57oiKlW0V/aunHNs9Xc7cP4DSDcXkQbLntMiSEC2xkPbbJqM4Sc/FYTw8azRmCCDUygaqhkrJlqXEN9yoF1CDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
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

On Thu, Oct 16, 2025 at 08:00:32PM +0530, Vivekanandan, Balasubramani wrote:
>On 15.10.2025 15:06, Lucas De Marchi wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> Xe3p_XPC IP requires a new PAT table; note that this table has one fewer
>> column than the Xe2/Xe3 tables since compression is not supported.
>> There's also no "WT" entry (which we wouldn't have used on a platform
>> without display anyway).
>>
>> Bspec: 71582
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 95 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 6e48ff84ad0a0..7649b554942aa 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -154,6 +154,41 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
>>  static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
>>  static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
>>
>> +/*
>> + * Xe3p_XPC PAT table uses the same layout as Xe2/Xe3, except that there's no
>> + * option for compression.  Also note that the "L3" and "L4" register fields
>> + * actually control L2 and L3 cache respectively on this platform.
>> + */
>> +#define XE3P_XPC_PAT(no_promote, l3clos, l3_policy, l4_policy, __coh_mode) \
>> +	XE2_PAT(no_promote, 0, l3clos, l3_policy, l4_policy, __coh_mode)
>> +
>> +static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );
>> +static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );
>> +
>> +static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
>> +	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),
>> +	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),
>> +	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),
>> +	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),
>> +	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),
>> +	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),
>> +	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),
>> +	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),
>> +	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),
>> +	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),
>> +	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),
>> +	/* 11..22 are reserved; leave set to all 0's */
>> +	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),
>> +	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),
>> +	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),
>> +	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),
>> +	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),
>> +	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),
>> +	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),
>> +	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),
>> +	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),
>> +};
>> +
>>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>>  {
>>  	WARN_ON(pat_index >= xe->pat.n_entries);
>> @@ -380,9 +415,68 @@ static const struct xe_pat_ops xe2_pat_ops = {
>>  	.dump = xe2_dump,
>>  };
>>
>> +static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	unsigned int fw_ref;
>> +	u32 pat;
>> +	int i;
>> +
>> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (!fw_ref)
>> +		return -ETIMEDOUT;
>> +
>> +	drm_printf(p, "PAT table:\n");
>> +
>> +	for (i = 0; i < xe->pat.n_entries; i++) {
>> +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
>> +
>> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
>> +			   !!(pat & XE2_NO_PROMOTE),
>> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
>> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
>> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
>> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
>> +			   pat);
>> +	}
>> +
>> +	/*
>> +	 * Also print PTA_MODE, which describes how the hardware accesses
>> +	 * PPGTT entries.
>> +	 */
>> +	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
>> +
>> +	drm_printf(p, "Page Table Access:\n");
>> +	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
>> +		   !!(pat & XE2_NO_PROMOTE),
>> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
>> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
>> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
>> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
>> +		   pat);
>
>< Resending what was already sent to v1 by mistake. >
>
>For completeness, we can print the _PTA_ATS register also.
>Outside that, patch LGTM.

but that would be in a separate patch, right? We already have this:

	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
		...
		xe->pat.pat_ats = &xe2_pat_ats;

which will cause us to write to it and thus we should also add the dump
in the xe2_dump()  for completeness.

>
>Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

thanks
Lucas De Marchi

>
>> +
>> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +	return 0;
>> +}
>> +
>> +static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>> +	.program_graphics = program_pat_mcr,
>> +	.program_media = program_pat,
>> +	.dump = xe3p_xpc_dump,
>> +};
>> +
>>  void xe_pat_init_early(struct xe_device *xe)
>>  {
>> -	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>> +	if (GRAPHICS_VERx100(xe) == 3511) {
>> +		xe->pat.ops = &xe3p_xpc_pat_ops;
>> +		xe->pat.table = xe3p_xpc_pat_table;
>> +		xe->pat.pat_ats = &xe3p_xpc_pat_ats;
>> +		xe->pat.pat_pta = &xe3p_xpc_pat_pta;
>> +		xe->pat.n_entries = ARRAY_SIZE(xe3p_xpc_pat_table);
>> +		xe->pat.idx[XE_CACHE_NONE] = 3;
>> +		xe->pat.idx[XE_CACHE_WT] = 3;	/* N/A (no display); use UC */
>> +		xe->pat.idx[XE_CACHE_WB] = 2;
>> +	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
>>  		xe->pat.ops = &xe2_pat_ops;
>>  		xe->pat.table = xe2_pat_table;
>>  		xe->pat.pat_ats = &xe2_pat_ats;
>>
>> --
>> 2.51.0
>>
