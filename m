Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B927C8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 21:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B91B10E793;
	Wed,  2 Jul 2025 21:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvEZ0QTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2893410E793
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 21:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751493475; x=1783029475;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LySNYdzr+RhTUkyzlL+Jka7u1ujk7tCHN+7EEXIDXCU=;
 b=YvEZ0QTCOq+TEVZ5SikMv/Vk29sHuihUvzUYdUj409G+UBpm/NViIy6C
 q4Xl5+UE8Gq3xg2MeA5tJbwQH8ngs/NQsoWFmZWlaBOg015kX4hCLkmMO
 Tr56mqTKUDA4GGAYBoVCYFLiinmF4NJSdAmHBGooGfGdyPUhUhBnHCQMJ
 vRh7Evhk5nIEDppJVEYQOB7I1xryPK+MHICur2h7MULcAGC9XH0E0o5km
 t+nk/oLU3glwd8XUJiA24rDPOqSiv2jB63J90JnVt7z9LRwgDTJpMXPN8
 WeIeaNJWmIUGOr9fy8q97iTD3k9dl+WLbKGIegujf4SnTCa9ctrBgs23z A==;
X-CSE-ConnectionGUID: mJ8D4o3+TziquvuiNtDCqw==
X-CSE-MsgGUID: A162KYJdScG3UDqrMKsNYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64051984"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64051984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:57:54 -0700
X-CSE-ConnectionGUID: 1NDCQAMxSSyHae9Ri19mdA==
X-CSE-MsgGUID: 9yrPaNqrQS+OpP35cRkCiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154550225"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:57:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:57:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:57:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t37N2s3rYEQfUO36yQxpP9X26Dp3oVECpsXxszrLV1nJtQJ7FNMTjkWKFnM4x+D/vRqTqDMubZdLdjXn99Z8pfA0plTh2qXrK2Zk5B3I3TpmdyvFd36RAOJWvPBImqhlp4Fn0zH+4xjgMQ2RYxIRQqcBnn0BgirJbnMxV/ezDwfvKRag72VMB+C9PgtKSL4O+LGldK6D/SG0c9xZ2RC5cVQge60OvXSmDfPF8PGJ8GtwrHkLGfEvTT0f/7jQqQkaj6li12S9iOcy6E64XvWdz8h0iMAz8ODtktGu7MO6F0FQDSDDMYhlMGKvHD21ZXxAuWB2xrxkgbMLH3xK5zoqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqEQS57QWInAK6wody9MslLuS+1Vdtf7P0lFhCty/oM=;
 b=cqNaErmHjc//xn5R9IctkpqDcetFdAsGwfwxiSn+Hhba4jAa6VtPHyc+9NH4aLA0/Yre2Dxn9SDk4Brrdwk5HwWshC6wvYabN0HO661QLWwQw7de2REBp1KiQzmsimshxvQLTX3BINzOZhTAQEurx1hqj12UVwVwIbEQYLwcu0Rz90/Pe0rOkK0+9IfUPXqd2LRRQCoHHAnlchMq2gHb/aPzaL1qHZP5Yg68T2i/LTzowr4OxNivQTTpW28vIO+1bs7jPJzlzwMBx+1em/SwgUsPAwYYblMLsZrErX+QUdIQ64oNnWBSEMFkmuOTLXx3uyygjR9dQ7+MKXPudOqQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 21:57:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 2 Jul 2025
 21:57:36 +0000
Date: Wed, 2 Jul 2025 16:57:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 1/6] drm/xe: add xe_device_wa infrastructure
Message-ID: <svdso2kdn3bgu5gu43lbwj7bnzqd6hsbqzmbxpuydvqocvwjan@pj4pyj36kir4>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
 <20250702193036.1417416-2-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250702193036.1417416-2-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: be0885d3-9f36-4c71-918b-08ddb9b374a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4SQjH4X2r2HhSaAj/mjVintR/rZkx9cjvpQiwpp46OtDdm3W+wR1zZxQLuLv?=
 =?us-ascii?Q?8uEVxVNBMB5k7OppEPfSa2ZorAWZ7CK1WbCEACj6orCXZXj/V+6pJ5afOHlP?=
 =?us-ascii?Q?I1rCkxQtcChWySEwJqU2Psh6/xVEVNR2SXZ/T85NSPDveQH/xbeBdBqnnMZD?=
 =?us-ascii?Q?7JBYTsdmA007DnMirYfgUOLbSCVCXbcHTc1oT4ioj0AZ9noxRoZ1l29r1c9z?=
 =?us-ascii?Q?dgk40pGYVbJAMh6QgRMPr1aLn2IO5OlpmBgXOowVmOsBWXZDOL09X5KLAwdT?=
 =?us-ascii?Q?MC1u9iFjIPHSoahg5T1oxE6y89HNn1Nz+SsKkX6GUf0nOFFNo2y+k0AI5pf8?=
 =?us-ascii?Q?PF4Q2B8g8t+l275LzjioH8WiLeJDNWxylnBJXyS4/wH8CpTcfXaDQXDSuhwt?=
 =?us-ascii?Q?yPDJc2x3y5cUYqY+usVSb2JmMcCdjhd5yyOrwUIMV4ApyytDJhlmF86H9Jkn?=
 =?us-ascii?Q?djR72cMk0R4mU2tkQVBE1RvXxBvBc4bCSVOnO0ewGvUz2aS6hDNV4eFtHn/Y?=
 =?us-ascii?Q?USHwoUty/6tN/VunuzS0uO9DIzdN0dbEg2hQFa26d7WqnLR+AapogTei0Axb?=
 =?us-ascii?Q?vzRxGcEci86c3oqSPdk8cvGhsWQwZIrYdnhWAzhT0K80xPWudue8ukW4kyxF?=
 =?us-ascii?Q?kZ1Acafg9KHxRMhyChOJIxyj4wtr6UtWsHJiqQB84qlmicXlaPFyFCJkxv3n?=
 =?us-ascii?Q?fdPWiBBNLVFDqTVwEQJuyt8P0JzQjO7cT+FekKvQzoGa7w1rMNrF4OCVziaz?=
 =?us-ascii?Q?JFiaE27oC+/K3/4ngaYtSrqU0DKiYWv7PAChsHb/5YqCsF6J0TIg56cK9IDL?=
 =?us-ascii?Q?GxbfpKYCEdiMT7VaayY28TskLSLdEyNJGrBwmYoM1S6oUJ7lI7v1quhRMxjH?=
 =?us-ascii?Q?L3rL0SJcgtdWiVzhDz+j3PZ3KtrwT7i+KTDTaumzQ04t754hzO5FMt7O2v9O?=
 =?us-ascii?Q?azBS8K8E/Bd3dmgI/3KH1t/p9MGX/qUXx90NkxoHd0A19g3dHbzgWw3k6lua?=
 =?us-ascii?Q?zpPcBOjLFolSwbxcuUDR/zF9e6MVQwkhSZxDZnb/xSxDOmBRwcAHNuQsunJb?=
 =?us-ascii?Q?yqDv7W58nvMNkx+mRM04fS7EBE2FaMdnBkAWjuXeWxJvzknCVKy8bOBHb2uZ?=
 =?us-ascii?Q?Au55RVmhitcPEdV8yRjY5vHOOHTJDW31boO5sDFFhn3ALjxzL7mWvcfLvUyK?=
 =?us-ascii?Q?gzwiyre21KMp9ZD+tH0s+J15SqIcm95FdlKMUJRsh6JHmgsr8hVdBwescUAn?=
 =?us-ascii?Q?nq9jAru5dJkWRr7x8D/JgbqCgUYTHjsak+/TNwVSAIazIvJXDnVoFSMWdgT2?=
 =?us-ascii?Q?O8s5/rLrQUHF4HvWHSkpTAn2s7eBiK7u9LdaCdtAck/FIBeotuKXrO7mYsRM?=
 =?us-ascii?Q?OzhGGwinvzEDRkXZLpWY7GwOvlCUo7ipVcMAGZ8dYS+GMf6TsuiekYO/Drpn?=
 =?us-ascii?Q?upXn5AS7UJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qeeZtCoDg+73Y4ryUMX14T86/H0ddE1/Dps6+BnIleugKJlw3lTTzytNJOa2?=
 =?us-ascii?Q?UjLhT92hhRRVmMfZ2MldPPHTOmMtyoIfzGmalMEPpKEu28ACe3tJGhSTGeL1?=
 =?us-ascii?Q?DOPdvEI4oSc5u2V6ujCPYw6XksOrk+XWrfhpywcmh3Gnx4TDSFLsPKgyh7bP?=
 =?us-ascii?Q?AVN6gy5dKB2fnCexdZFUsA0v5QuMI2gvT+4Bsk6pVecZlaH5JvogQ6v7xcH7?=
 =?us-ascii?Q?EYjzjtN5soJb6RdhcRXTszsvd6NCLNIyrqHHh/+ynvI00ogLmGZOAiGz6hbT?=
 =?us-ascii?Q?WCj3D5mHouLv2Y47P1LvuR/NA85oBA/Ph/M2iEX9Md5YWZr7Ky0Lgww1Kafa?=
 =?us-ascii?Q?HnK8a4QYLedMvOOZocP67Gqwy2dJpTcRkzI9EwPH2LTIOelL/Rt+O5np3Tez?=
 =?us-ascii?Q?eWhv7iXDFbx5+i28N3YO6htC7pEkSu1Uoz203x8b+cp4qg3Xx0PEQTFWWhRn?=
 =?us-ascii?Q?5Ci12UvSmBO7idwFmS+8TvuCd2kvV5h/e7ODbsEkVL4SyHme5HNF9mRvcWIL?=
 =?us-ascii?Q?eFHzofRNySHTqmSMfruVlnwVYXlQsXy5QbjTn6lV1E56mHy2x/yD5XQMMEJf?=
 =?us-ascii?Q?2c2x+HyKcNMVDFUh4cK+DIOXvTAAOFfjRjefDMj4KRY+UAsMU9FG3T9PAklo?=
 =?us-ascii?Q?gpdIse4WP2KLCKSDwXmSGyy5ArJKtRFvE8TwvKD7EPQaYIxlFHB4VyYdlBqU?=
 =?us-ascii?Q?To10+/KiwewgQb1PTAUbWbykDX01D1ZxKxV8Hkbia1xBHl2nwk3fT8H1p+YC?=
 =?us-ascii?Q?LjszOd4FpqA3NFRdTuylsV7c6PxlZ+rlq8EYTlcwJeOSO0isRibjsdbvJUCL?=
 =?us-ascii?Q?tptis+62YdVk0+1ipVZGQ/rknNz5iEFGwudWwEOmRQ4jQZ3Tsy4oVOGPj0VA?=
 =?us-ascii?Q?Vs0bhyuEHsFmlcw6BpuCA9v8D63W4DacN2hm/8JkbEMR4Q3JCP2QQPpEdD7E?=
 =?us-ascii?Q?Km67AsmY9RbcwkjLwJf7GxdQ9RXXriDrqgk3vIsYKXRsAA4qaiHwIiTFobDu?=
 =?us-ascii?Q?7RfQmnLPsTZBh7c+q6qfoitw54NENYAXlef6OuJ9XYWacbuyYDXVbtWJBWlB?=
 =?us-ascii?Q?inX9cNSnifvz11DpYmW+wkw35I3qIuLOEwGAuuYmR/vyTbeiCV6LfJSps/Al?=
 =?us-ascii?Q?qSeKmy4wkYTZXEjRD/nM5gTfJABgXE3JRo4W3ihBV1ZfdhV5fspeXYO/ZpSM?=
 =?us-ascii?Q?s5lyI+73DVVCLmrzfGqG5/GUu0JJ8LgfwuDSU9RZVRFrc8E0xnstFpMwBAkR?=
 =?us-ascii?Q?8w4An/8ArnT/Me8WWjELeJT4vwT0rq90s5s5daWgWW7HBOq+iXnQupCBiUac?=
 =?us-ascii?Q?hVbuO9PcfAoFfBpfQ2q6cmSlESxPMpR+3nwZbiwiQ9r6VrwjbNIoPg7DuEPu?=
 =?us-ascii?Q?9+c/g5oQHdMvWK3UZd0yqcm2SJ8Ra6gHMspnhetr+dD4rlVXp2lKS1qTsYGE?=
 =?us-ascii?Q?gPZ0Pv7MuELHBtSNWX9XT0FRJEZdnnA3wRyVrJbb8m0cV2Y0CrjQUvnXhDy9?=
 =?us-ascii?Q?ActmFmAh13I4gJBjzhdI6vIGMDVfvLC/KU86BiM9iMEArRhx3ighQviuVMYh?=
 =?us-ascii?Q?bwwv/zdVd6BfRAaDrr1gi1leavXjR0aCArarP5KILyWOs3Z6hGonQnkFaiTm?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be0885d3-9f36-4c71-918b-08ddb9b374a0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:57:36.5107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cta5aNONdZ9V5c62uZYorTIHFlillKml0WVfX64roMS8CeNMYCMw5mo2Ime9cYLBPSFDyHatDlmvtV5nxz9M5G6VnaJJdGIi1OATRvhHXhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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

On Wed, Jul 02, 2025 at 12:30:31PM -0700, Matt Atwood wrote:
>There are some workarounds that must be applied before gt init,
>wa_150154044425 for example. Instead of sprinkling them conditionally
>throughout the driver as we did for i915 generate an oob.rules file
>reusing the RTP infrastructure to make these easier to track.
>
>v2: rename xe_soc_wa to xe_device_wa
>v5: derive prefix from argument rather then hard coding the values.
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/Makefile               | 11 ++++++-
> drivers/gpu/drm/xe/xe_device_wa_oob.rules |  0
> drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 38 ++++++++++++++++++-----
> 3 files changed, 41 insertions(+), 8 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 1d97e5b63f4e..48d4aa9d4ecc 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -21,6 +21,15 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> 		 $(src)/xe_wa_oob.rules
> 	$(call cmd,wa_oob)
>
>+generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
>+quiet_cmd_device_wa_oob = GEN     $(notdir $(generated_device_oob))
>+      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
>+$(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
>+		 $(src)/xe_device_wa_oob.rules
>+	$(call cmd,device_wa_oob)
>+
>+
>+

drop these several newlines.

> # Please keep these build lists sorted!
>
> # core driver code
>@@ -340,4 +349,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
> 	$(call if_changed_dep,hdrtest)
>
> uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
>-$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
>+$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
>diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>new file mode 100644
>index 000000000000..e69de29bb2d1
>diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>index ed9183599e31..341840926f60 100644
>--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c

All the changes in this files should be a prep commit: they can be done
regardless of having device_wa_oob

>@@ -18,8 +18,8 @@
> 	" *\n" \
> 	" * This file was generated from rules: %s\n" \
> 	" */\n" \
>-	"#ifndef _GENERATED_XE_WA_OOB_\n" \
>-	"#define _GENERATED_XE_WA_OOB_\n" \
>+	"#ifndef _GENERATED_%s_\n" \
>+	"#define _GENERATED_%s_\n" \
> 	"\n" \
> 	"enum {\n"
>
>@@ -52,7 +52,7 @@ static char *strip(char *line, size_t linelen)
> }
>
> #define MAX_LINE_LEN 4096
>-static int parse(FILE *input, FILE *csource, FILE *cheader)
>+static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
> {
> 	char line[MAX_LINE_LEN + 1];
> 	char *name, *prev_name = NULL, *rules;
>@@ -96,7 +96,7 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
> 		}
>
> 		if (name) {
>-			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
>+			fprintf(cheader, "\t%s_%s = %u,\n", prefix, name, idx);
>
> 			/* Close previous entry before starting a new one */
> 			if (idx)
>@@ -118,7 +118,26 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
> 	if (idx)
> 		fprintf(csource, ") },\n");
>
>-	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
>+	fprintf(cheader, "\t_%s_COUNT = %u\n", prefix, idx);
>+
>+	return 0;
>+}
>+
>+static int fn_to_prefix(const char *fn, char *prefix, size_t size)
>+{
>+	if (!strncpy(prefix, fn, size - 1))
>+		return -ENAMETOOLONG;

I didn't suggest using strncpy(). If you do, then you need to adjust the
error handling. There are 2 problems here:

1) strncpy() doesn't return NULL on error. See CAVEATS section
    in strncpy(3) or strlcpy(3) that also documents strncpy and its
    return value:


    strcpy(3)
    strcat(3)
    strncpy(3)
    strncat(3)
           The dst pointer, which is useless.

2) prefix is on the stack in the caller, so it doesn't necessarily
    ends with '\0'. So even if you copied at most size - 1, the last
    char may not be 0 and you will have an infinity loop below.

Those 2 could be fixed by doing this instead:

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 341840926f602..ed550dca5f439 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -125,7 +125,7 @@ static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
  
  static int fn_to_prefix(const char *fn, char *prefix, size_t size)
  {
-	if (!strncpy(prefix, fn, size - 1))
+	if (strlcpy(prefix, basename(fn), size) >= size)
  		return -ENAMETOOLONG;
  
  	for (char *p = prefix; *p; p++) {
@@ -168,8 +168,10 @@ int main(int argc, const char *argv[])
  		return 1;
  	}
  
-	if (fn_to_prefix(basename(args[ARGS_CHEADER].fn), prefix, sizeof(prefix)) < 0)
+	if (fn_to_prefix(args[ARGS_CHEADER].fn, prefix, sizeof(prefix)) < 0) {
+		fprintf(stderr, "ERROR: invalid header name: %s\n", args[ARGS_CHEADER].fn);
  		return 1;
+	}
  
  	for (int i = 0; i < _ARGS_COUNT; i++) {
  		args[i].f = fopen(args[i].fn, args[i].mode);

did you find any issue with strlcpy? I think it's available on all
toolchains, but maybe we need the workaround by including tools/include/linux/string.h
I tried the diff above locally and it worked for me though.

Lucas De Marchi

>+
>+	for (char *p = prefix; *p; p++) {
>+		switch (*p) {
>+		case '.':
>+			*p = '\0';
>+			return 0;
>+		default:
>+			*p = toupper(*p);
>+			break;
>+		}
>+	}
>
> 	return 0;
> }
>@@ -141,6 +160,7 @@ int main(int argc, const char *argv[])
> 		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
> 	};
> 	int ret = 1;
>+	char prefix[128];
>
> 	if (argc < 3) {
> 		fprintf(stderr, "ERROR: wrong arguments\n");
>@@ -148,6 +168,9 @@ int main(int argc, const char *argv[])
> 		return 1;
> 	}
>
>+	if (fn_to_prefix(basename(args[ARGS_CHEADER].fn), prefix, sizeof(prefix)) < 0)
>+		return 1;
>+
> 	for (int i = 0; i < _ARGS_COUNT; i++) {
> 		args[i].f = fopen(args[i].fn, args[i].mode);
> 		if (!args[i].f) {
>@@ -157,9 +180,10 @@ int main(int argc, const char *argv[])
> 		}
> 	}
>
>-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
>+	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
>+
> 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
>-		    args[ARGS_CHEADER].f);
>+		    args[ARGS_CHEADER].f, prefix);
> 	if (!ret)
> 		fprintf(args[ARGS_CHEADER].f, FOOTER);
>
>-- 
>2.49.0
>
