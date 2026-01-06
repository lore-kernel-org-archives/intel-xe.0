Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E355DCE9D7D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 16:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A266B10E0BD;
	Tue,  6 Jan 2026 16:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJypNRAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E8B10E51C
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 16:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767717722; x=1799253722;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wn2KOWFSJTRIIVD4Sj3st/+OTtGGuwrDmLJBuv0IJkI=;
 b=gJypNRAch//LqNNjdaMh7q3REahKk1MJysb7S9kCNUhq4j1y2Gq4fTRf
 qpQ7k1Frax1AzV9IWrZuvE3YGUDHGLIiQvzZ1bmWxhEkLjEEteijzuo/P
 d49lFGmbzziVi73cOqGFtFECSRFjw7z76VV2bNK6ArIyReQ8GLzAkzRs6
 S+A588GN0ZZ6DYt4sTkkmdq3A5wObnyhJBA0B9PBUgkwsjOxlyrADOKKx
 s0t6qe4lt2jVZ8pDvqxNa30wnld/4AZOV4DVHNkNpwmQBqM5JuMMEcIIL
 1BjoE0O1FktDIq0A3b4UtPyvj2Z3bxDuc16ECJZC8wh5MstID9OUxtE5b Q==;
X-CSE-ConnectionGUID: 612z5Jv+Q6qYILvv42Tm5Q==
X-CSE-MsgGUID: r4Txon3YTXyprmavIJ7gYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69158334"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69158334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:42:01 -0800
X-CSE-ConnectionGUID: kJBWAItuRj+CLLm+iTjItw==
X-CSE-MsgGUID: KYtUrBLPQJCyF8CIyfhEWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="203642945"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:42:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 08:42:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 08:42:00 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 08:42:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YD19zKBtQP6DwwZNcevnsI+EEMxtxTuXwPHQhJJfxAiGmeyl/ddbuihF1qmfUvQGvxAz2MWbNc/PZfDHM1V03CRVsBm/UhsSHVvwak8iFOO8NlvxaxcRlrLyz031/HTWO7xcpmq2W58xZztLZmqnL2dZ6+pO2zsxs+VdDnG6A3VfrT7N92jifseJMYKOuYQpRTPzTWgweJY2v6aCJfPshTPqZkkrgzp13wtUUWovNC+sG4qZO3/OOPvBnR8g38JGYKLyVFHEKJ7opr28fniX+xjdgRDfHSrgq+oz9Q/WflwQ1nfwrJW3MD9L+blQIQnngmFdkyXA6BuOZA124DPyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnHxvTGEPqKMPnI4e0DntoQFXaMeNkTxLo6QCUYRqcI=;
 b=okklvfcFevtSMIGvYQIi5XEIfidP6xh82NgnEJb/0qv34c5R9ywOx0ARSqUZQcIZhe1M+u57l8rDLPFQc56/HkRcc6UYwohSQim9Bi0ROYxvIZXIuOUnAEd4iqXnGm7BeeiUEhfk4f+Kkhnk9ijaHlGDM8Z2yBpFOFARK4oeeEm1JYRvHoS3313GMSkMexD+QvAPWSH5eY2ICzB2RrqNjSMs4QhOTl3VTufuItQXR8mrflqHEng0kIhlBnQyrMApPtUBAN34LqgVQozvOjMzC4RyMknP+EToonCFOw/gPtS4OgjNL/HLhJhnGSsfnCN624AKDTWlW605jWwy82dxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF0DADD6EFE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 16:41:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 16:41:58 +0000
Date: Tue, 6 Jan 2026 08:41:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Fix page reclaim entry handling for large
 pages
Message-ID: <aV07VAFD8K8YaGlV@lstrano-desk.jf.intel.com>
References: <20260105233351.3753716-6-brian3.nguyen@intel.com>
 <20260105233351.3753716-9-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105233351.3753716-9-brian3.nguyen@intel.com>
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF0DADD6EFE:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c47bcb-012c-4728-84d9-08de4d428268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fPMDRyX2rc2mNNJNoN8kT08AAdVACRPMdIY+S0+4ZaBU9A9yKcYCetCqz7km?=
 =?us-ascii?Q?u+MxPnrNOTgVBzfr4OEmMir8jJ3M0WRvaIslHZjA5fpDyNLOdG8Eco0trTCA?=
 =?us-ascii?Q?muLZC92k18q7Q/vijmQJOJEo0x5/uNxWhXMfs7esj2IAHcNLIoZRzFOiQZvr?=
 =?us-ascii?Q?ygFucfHpGd6Zhhg6dEbAIaYvsYhe/a+mk+sILXQrC8+iRafiK9wmSFKZpIPC?=
 =?us-ascii?Q?x79EoNiRS5N8bA7DN5RfyQBGD7ILoP0FNe68JSGDzOIjJBHvqUeE1w6scpAj?=
 =?us-ascii?Q?1yp1zLo7hKkdILIFSxo0rCNI1QzZDVmd5+FmKY0C6VF8/ovS/krS/qvn0QAU?=
 =?us-ascii?Q?6XF8yJfalmwSg88weiYhu3hUTvGObctioxxJ3e2028z3HiFRJJEtPp/zoIpA?=
 =?us-ascii?Q?0FyYBfqVOyUGzSKVsjQS4iKzMy7CmRsl2J5zbrsNWBYoZ/2IEABYwZTZRVd3?=
 =?us-ascii?Q?2JpQbSh3BNKBHJU8YaWBv8oy5M5bMgsSKIMarFoO+PAZd59Dt2X/64HWeYDi?=
 =?us-ascii?Q?QBIfNAtLEmbjGPVY2F/diKVX3fCw6FUTK2CrTHBcZdVXTXNBu9I9BJE5+HJL?=
 =?us-ascii?Q?WtBWJI9T4URz/6WjtmGGJZw7px2D6Td22OTJiRGnFDfNSS2mBffM9ZvFFHBd?=
 =?us-ascii?Q?xeSen5Z51QpgaXf5H4YqHlvl+PzXwDXUeEc0U8WG400XBh7re+yr2gJ9tad/?=
 =?us-ascii?Q?PBi/AIKRB1T/LTz6/fvm4MyxD+4cCPijwnExf53UxmpFgvFcumx9tcHArvuj?=
 =?us-ascii?Q?6LSzpWChIkTrcQ9wLnu09S2nPMreScx00nBgLc6PejUz/bviVIKaPo8HkSsC?=
 =?us-ascii?Q?wK34qlYO4YCgbaUaG6uVOtdBHMdi9popAXwHaT5RJuRNdbsmoENncWEqbJMK?=
 =?us-ascii?Q?5OiPgYXqgN8oYyAfAS9wKTDQrW+SNHbspQzlk7Gle56ZYQVS7C5TAkM+xIeR?=
 =?us-ascii?Q?WBbxgN5Jx27xTeez9P4pRdm0uYJVdA1mbkCYh+D7/JhwPdTs+ozN4kyfEMBL?=
 =?us-ascii?Q?DoCjIT2cMnArq6rMOLV5fIp4V0LTN+/b3FqImorvxT6aXIzJymla9NK4/EHW?=
 =?us-ascii?Q?fgrgV0H08C01Vmeca9eQwWVGAjzFHtvE3MCKJGpxmqu+OA8OXbJ79yjhh08u?=
 =?us-ascii?Q?SDsE1pc06JiZQpRy92BR6hYLNasjUKs5UcfOzhmxPcb2GCBy2rfOM6bfb1bG?=
 =?us-ascii?Q?NVizPm+MpnV8EmfTpKmCJji3UpGfPwYnDor2gfzpjpZ6+f47xKtT6q9SW34G?=
 =?us-ascii?Q?3ZNFm19EmXW7fp/j0yUTMfipM+oiGIpVCYNcdTJVNontmUr/NE5wXYgIHVcA?=
 =?us-ascii?Q?nJREKA2O3bl3tToVXFBEQgs1TY3QnKlmpZwLaHEZvi93HfZBacsn/boqchBQ?=
 =?us-ascii?Q?R7cxB5mQ35zg1Qm3aCg203UAcNY6funE7ovWjfhG1QPfYVIR8nwrwAe0dNKj?=
 =?us-ascii?Q?OmOT7sdPsJQ5V+ge08hTftw1tLbozQSl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UgeM+QnxctzHVIILi5DU7AmaSH/KsFGzUNMMhfYC8TgH+8uaEzmQ7QngPYqv?=
 =?us-ascii?Q?OZR2vEsz/599G7x0RrO7rkb14BjAAOHDVPZL/Eeh5Pi7YQbWzeWYS6cQ3m7T?=
 =?us-ascii?Q?f+gKMIqElUXcK65n8TMT/mQaqsKBNcLr2+Qdja8FoXEWtmAs4pWGEnPJZpxx?=
 =?us-ascii?Q?SXo/6p9HjFpR72aQD0SoIshx5PAB8w9fcu50Mp53o0Reo3O2fmEAxQo9zZB6?=
 =?us-ascii?Q?/GLbZk3HOoxmXjp9UU8ucRTdK12eatAHl6bKGnpZCN9OyFz8cHQrdw8XvTQW?=
 =?us-ascii?Q?uucIAl8KXzFjfPHuMxsiTMTdLWeIZuLMOt+ShxJRiuwsAg8uF2nL1WPJpjoi?=
 =?us-ascii?Q?8NLWhIz25FhewZqzYKSOKaPMue0Ikeh68+/PCX7Vky01hJp5kmdtE5+BGbrB?=
 =?us-ascii?Q?aAgDGkOeGT3SKyFnUvNE/Rzw+sUEfw99lplT8/xBFvxufpCGTMtb3yrFwtKR?=
 =?us-ascii?Q?ZsqFLRrSjOv0BsTz2URGM8FdFc9a8nRIlcKrbpjAZ6WBWeNEZ/OqN1RLdT6U?=
 =?us-ascii?Q?6Fgwg1bU5IBTXpBHhXTZ1jsLK9kve8WKnHDe3PQsFIexO5lA1fivDM11PQSW?=
 =?us-ascii?Q?jV5ktRJMrjwQNTqemvSdF/fn8p4rIuxKKmirfOsvCM3iQbCjvCZ4IQdWRM4B?=
 =?us-ascii?Q?uQu8yEv0nDvPeDMIZSPjgTQ/7rZSdJFMpP8iP/HNylDMIOBIcv3d+uI/8pPO?=
 =?us-ascii?Q?fR9w7/IAvbYl2pXuFNd+5wiDCausgjmsvLkIydGyqXfy3JcnUpwJY/e3FIH9?=
 =?us-ascii?Q?RYwHkZir+FQbXZDmCKmDib45S4G+snT89NneoQZv8gy2M5Hh3UgXGCwX4Vnk?=
 =?us-ascii?Q?9Hjy6QSUypfleezW1/zF1yTKLIkPQLtMF6DmLwDucER+HGqhgaP03W4mU5RH?=
 =?us-ascii?Q?RKVckzJBm2ALX1oSsyZ+DKSn7RjkalorYu5PN5J0u3vOS4RNV3yr/QN9H2jc?=
 =?us-ascii?Q?DbC6s4MQHGGdLMqPKT/Y/CVRyEX941+HfYGyLOumSItpPwKaPahf8jdYj89m?=
 =?us-ascii?Q?JcHCCMo/iANAMzxHZcgr8A8nJ5hqvcZaryAZe0O5M3tJ0PbFV7mEaFM08h8n?=
 =?us-ascii?Q?7w2FhBhP/norjzZ4hvI9BfFDQVGWDDZR+3uiZbbio1mnmUHoSMJTIXL35Uz/?=
 =?us-ascii?Q?Fad2tJrmGbqnLRgGeArnQ+3rBqDRGsHq6V1/wjHiOYZn2qi+1Zj51DSQFGLO?=
 =?us-ascii?Q?9KOqhbapfHYAvJWSt8SF/T6UD7inQ6sVjqnA0wB0P4q31wnsdxUvLpmeW9Mq?=
 =?us-ascii?Q?R2XrbWWuEJrUBOiala/scbpXS1pWuNIxjuN7NsG4ghOcjJfi/qtXTEl88B/s?=
 =?us-ascii?Q?9eRvss1uL+RiyjosPDgEsKSjcB7M7wecmpnryK6VwCJlsJqAfj3Yu+/v9dc/?=
 =?us-ascii?Q?aHyJaIRcjZTLowfs4BnJIEM2H7LuGc6Ryf7e5zWOYEQFK9WUS2dK1gPxiPeR?=
 =?us-ascii?Q?3KtPlA7WcnVxc0C/wipD90FbH1vewqpj6tZHmtM0B7Y8/fUiUO6SCbEx5JRg?=
 =?us-ascii?Q?4pZk1ywfzr67H3ba1mQEa8xRxkvvaG8r4A6R4/MAmEyYGAljyBeuejt9RZtX?=
 =?us-ascii?Q?S4Z1T7R+l5CfU3a6wDODAChTAGFtid/QEunlyT++zwJ7S/PSNivRekTjzrNi?=
 =?us-ascii?Q?858NuQQEQcDyu3QgcnFse6sQ+OIrWbTZfrGf2hUjtp58WjXdW+/BkYwxuec4?=
 =?us-ascii?Q?JvCOx5fWcbqOCjTN7uvhKCKF7RfktT/lahYByIxg/vegCKskB5SUZ6R4bFk5?=
 =?us-ascii?Q?ppsnrayoog=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c47bcb-012c-4728-84d9-08de4d428268
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 16:41:58.5851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYy27OpUO46VG5YUzicDDRYMHqN8B3easHHY7BahFlsZ24amtIqZoYpgB6kGiirJ3HShSSMIGWpOtgpPIQuuaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0DADD6EFE
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

On Tue, Jan 06, 2026 at 07:33:55AM +0800, Brian Nguyen wrote:
> For 64KB pages, XE_PTE_PS64 is defined for all consecutive 4KB pages and
> are all considered leaf nodes, so existing check was falsely adding
> multiple 64KB pages to PRL.
> 
> For larger entries such as 2MB PDE, the check for pte->base.children is
> insufficient since this array is always  defined for page directory,
> level 1 and above, so perform a check on the entry itself pointing to
> the correct page.
> 
> For unmaps, if the range is properly covered by the page full directory,
> page walker may finish without walking to the leaf nodes.
> 
> For example, a 1G range can be fully covered by 512 2MB pages if
> alignment allows. In this case, the page walker will walk until
> it reaches this corresponding directory which can correlate to the 1GB
> range. Page walker will simply complete its walk and the individual 2MB
> PDE leaves won't get accessed.
> 
> In this case, PRL invalidation is also required, so add a check to see if
> pt entry cover the entire range since the walker will complete the walk.
> 
> There are possible race conditions that will cause driver to read a pte
> that hasn't been written to yet. The 2 scenarios are:
>  - Another issued TLB invalidation such as from userptr or MMU notifier.
>  - Dependencies on original bind that has yet to be executed with an
>    unbind on that job.
> 
> The expectation is these race conditions are likely rare cases so simply
> perform a fallback to full PPC flush invalidation instead.
> 
> v2:
>  - Reword commit and updated zero-pte handling. (Matthew B)
> 
> Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 50 +++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 2752a5a48a97..668a981696f9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1576,12 +1576,6 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
>  	return false;
>  }
>  
> -/* Huge 2MB leaf lives directly in a level-1 table and has no children */
> -static bool is_2m_pte(struct xe_pt *pte)
> -{
> -	return pte->level == 1 && !pte->base.children;
> -}
> -
>  /* page_size = 2^(reclamation_size + XE_PTE_SHIFT) */
>  #define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
>  ({									\
> @@ -1594,7 +1588,8 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  				  u64 pte, struct xe_pt *xe_child)
>  {
>  	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> -	u64 phys_page = (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
> +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> +	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
>  	int num_entries = prl->num_entries;
>  	u32 reclamation_size;
>  
> @@ -1613,10 +1608,13 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  	 */
>  	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
> +		xe_tile_assert(tile, phys_addr % SZ_4K == 0);
>  	} else if (xe_child->level == 0) {
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
> -	} else if (is_2m_pte(xe_child)) {
> +		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
> +	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
> +		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
>  	} else {
>  		xe_page_reclaim_list_abort(tile->primary_gt, prl,
>  					   "unsupported PTE level=%u pte=%#llx",
> @@ -1647,20 +1645,39 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	struct xe_pt_stage_unbind_walk *xe_walk =
>  		container_of(walk, typeof(*xe_walk), base);
>  	struct xe_device *xe = tile_to_xe(xe_walk->tile);
> +	pgoff_t first = xe_pt_offset(addr, xe_child->level, walk);
>  
>  	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
>  	/* Check for leaf node */
>  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> -	    !xe_child->base.children) {
> +	    (!xe_child->base.children || !xe_child->base.children[first])) {
>  		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> -		pgoff_t first = xe_pt_offset(addr, 0, walk);
> -		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> +		pgoff_t count = xe_pt_num_entries(addr, next, xe_child->level, walk);
>  
>  		for (pgoff_t i = 0; i < count; i++) {
>  			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
>  			int ret;
>  
> +			/*
> +			 * In rare scenarios, pte may not be written yet due to racy conditions.
> +			 * In such cases, invalidate the PRL and fallback to full PPC invalidation.
> +			 */
> +			if (!pte) {
> +				xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> +							   "found zero pte at addr=%#llx", addr);
> +				break;
> +			}
> +
> +			/* Ensure it is a defined page */
> +			xe_tile_assert(xe_walk->tile,
> +				       xe_child->level == 0 ||
> +				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> +
> +			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
> +			if (pte & XE_PTE_PS64)
> +				i += 15; /* Skip other 15 consecutive 4K pages in the 64K page */
> +
>  			/* Account for NULL terminated entry on end (-1) */
>  			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
>  				ret = generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> @@ -1677,9 +1694,14 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		}
>  	}
>  
> -	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
> -	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
> -	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
> +	/*
> +	 * If aborting page walk early or page walk finishes,
> +	 * invalidate PRL since PTE may be dropped from this abort
> +	 */
> +	if ((xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) ||
> +	     xe_pt_covers(addr, next, xe_child->level, &xe_walk->base)) &&
> +	    xe_walk->prl && level > 1 && (xe_child->base.children &&
> +	    xe_child->base.children[first]) && xe_child->num_live != 0) {

This is pretty confusing if statement. I'm not really following the
'xe_child->base.children[first]' check. At minimum can the comment above
this if statement perhaps explain all the condition here?

Matt 

>  		xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
>  					   "kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
>  					   level, addr, next, xe_child->num_live);
> -- 
> 2.52.0
> 
