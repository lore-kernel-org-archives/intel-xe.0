Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E427AC76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 23:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD20110E1C8;
	Mon,  3 Apr 2023 23:11:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECB610E1C8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680563495; x=1712099495;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9+Wm4mNDca8FpfBIJztavGG/aPb41u4ZfcAxlva3G7A=;
 b=WPqSpsEURUyGItyzEE5qTnF9Q9ht4ZKD8Quim35f4PZZqbOGiEFuZ3K4
 ensSi4mO7M4Pz7LlCaDIdJLbNi3NChuW6IQch1yIJMhxH5VYgwopX4kby
 jnEAYPytq0JEzvTtEds93ZfSbX0MMlNZlhjBhGrM3fpQxBGwClgy9KyOI
 PxwyLfPI9/8+rX+0T5PaPR2nfe9OaNnZ8OryCrAHcGxDpl4yAkiGr+iJw
 ZXZlXznNsCQWOhwEkPGCrO1XJDHS2ND9RRXC5YZ8II/6OVK9EcSfppB4G
 p3RIB3T3wj1EMkN5aUTKrbmqvNa58R2qTQtwbukGDKE8ScwpLJpLuLn4E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339528601"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="339528601"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 16:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="810002260"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="810002260"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 03 Apr 2023 16:11:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 16:11:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 16:11:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 16:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA0uu3UgKquNhBGkpXtLjzwXT/8ngSpVOQCRnPLEHVxXSmOqRUeLr91ZJRW3TcehmO0Q0RDq0XeOpugdNTEI89uTme60NvETXeoQ6pq24QvldONZxNPhvIXEwdpqfjV5J6ldrcSa2xtNe73f6reaJevyHzmZlYprXjoVPYvMK8Hk4PanxY3N3dinWtEXmm8+eMTzT4/yY0Lhze4vwOHDA6VaQ5IBmkXx2KJ5H/1f95kyOUjjsnT7Xj9+dGmtFRswvPWJTshfpkqR5ENXfMfvjKRLu9iRt0yyoeLHBuKT7QCdLDxb6k2d4QbCsQJvwqegSvsXfpD/Er6Zr2mg7IAJWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL5XHpjmkPKLJjlgX9ATIPuJ0de9WKK5A4q+1hEE1vg=;
 b=kC2Shsab7m2xFhopN27tpZVQB/aS+3KVjrjGQQW0YKJdynksoUgM9M6sSf86MpBOUguiQgy3JbG3IlVZ8BbM6yO3G5SRHhQdMQgXkdlDR3RIKHVDbT+b0a2RnOzdBkGh586f5lTjKyQ8yq+viQZDEvb9Rkc2HlRWA3ctkCSLMJR2oWoyDAcERS2Q4ZUCL/39cIpBOBgqFaW6/DsJB/91VsYvwZckdsPaeWzN3hqSmXrAVfcDBw910ZS/P0MD3rdoyCYmuiesHMvtnWpFF+DdUkktqzIUbcJY2hkSiGxOlrYNcWh6MdfqU+PbM7LXZbo2NQ7FnGfKZZZaVy+XcaQWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.30; Mon, 3 Apr 2023 23:11:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 23:11:28 +0000
Date: Mon, 3 Apr 2023 16:11:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230403231125.GC4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230401085151.1786204-1-lucas.demarchi@intel.com>
 <20230401085151.1786204-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230401085151.1786204-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR08CA0050.namprd08.prod.outlook.com
 (2603:10b6:a03:117::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d52897-7006-4683-e1a8-08db3498c140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4vcMXOR3jiGI7bpkgKqzMdEZ1OFpBZqNSdlkJUKdTVRcvpB2lmfj8BMQZjWeqaYY0D/Z67CGd9HLGjtxj2twRkdUDm+abNfIZIDcxzTPy0mh0B/Y8d4mYBoowX95UY5quqpSUos1Ozf0BE+7x1+3RIo0HTAufYS49HrgV2wHd8b793s3m9DAlSQsz2CKUl8Nl96EglczcfIFU2kZz4f7l/ljcIWkiV2jlvhVAJvFkEXxGs1SZWk0UV600mM+xpl3NqjtAi9AmDS4OeDXk9Legn+nKADJA+MXu17NkfT9VdPMrCYloxDhJMp1hptXSPFTUOqdv5Os0DCXGaH3Xioj32IPR/sXYSa1FKhiLrxR1fanrHeLoaPehjMbdNmHosm4CLrGcBQxzsGU3SqvYBZvQDFx01BP4ELqL4dBPjuRkzruhWC0ySNNEpOraOhrsT6u2XXyz10R0QahypGqGmGH0L++nwUllXRs0tGlcu4hkJj8lDrcXBd7JZ1UCT4yH23q5MwvrHUXdp2Ms9qWhmGuJiFZQzu8JUiIqQBPxyTNjJv01Wh/YRuchJKLN7SEpVd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199021)(4326008)(8676002)(6636002)(6486002)(66946007)(66556008)(66476007)(316002)(6512007)(1076003)(6506007)(26005)(83380400001)(38100700002)(186003)(5660300002)(41300700001)(6862004)(478600001)(6666004)(8936002)(86362001)(2906002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4cmAqM/npki8LPg7IZl+zuPvZyz1BgpbDTDmb8+no2EdGj2T5csTrvM23NOr?=
 =?us-ascii?Q?vygroZZ1iylI10kb6V/FdX8aX+hNNX1uUX6Rc2T+wpRtQQJvuDz3zXL/z1fd?=
 =?us-ascii?Q?z2QpdJBzxwCn/9yEsh5cJbH4YJxWVrzLCa9kdfQdqx3arhAYkG3I5NnSZooR?=
 =?us-ascii?Q?VrrfzXOpib8gjytcVJguqsMm0U0hvkv/XLojNsFD3ZVjY9F/gsxmihY8ueo/?=
 =?us-ascii?Q?cKnFnCtD3onY5ytlvIVIwdesLO6WeGQh07QhVFBjJbqEtFoYAMPao9wJ+c0x?=
 =?us-ascii?Q?zaHZdQOSNL0ml5/zxX+G3KWFvE6nWvvYxe4oUq2JyZ1k71Y6gUwAn0Xztdwj?=
 =?us-ascii?Q?1qVpAPZd98nd+XOC3ud7kWMSEk+EWQIeTvGj/YKdUJ1B2j3nTh3tnvJEa/M7?=
 =?us-ascii?Q?Wxo0YYE+S74B2D2+bdTn4KUcFk0Z+XcLuPzY9ZjMGrC0yjntQfyN9+M5Nspa?=
 =?us-ascii?Q?D7K74oAauMrj11+T/GpLvKXNFVHEYD1LnYnXkMxkgIbVdnHQKq4poc2kCibx?=
 =?us-ascii?Q?BtCkc/2RzmgasPPgSdSDa70GhpKYaadHjo4qGXEyn6EcjgJk055oopk7AvrC?=
 =?us-ascii?Q?DHoxWENwqUkOPTLrWH1D6q9KA7ZCksGvXl40GihAP6qNnjcCbMxTMsH1nDoq?=
 =?us-ascii?Q?qpyDyc0QtCGjP8uEtdvaKnH3XedStDhv4CxvG/UBMf+YYj4pshGy+MJzMHWL?=
 =?us-ascii?Q?gnR/uASnSinEj4TR+BC8/ux6hZW8ctd5RcUEsoMPKunL2/2FSQRp5LZErjJ8?=
 =?us-ascii?Q?VmlWTctLtDJ26IOB6U1IWvX1+9Qsv050MLg11ov3EOQNU6MmhtiDDyE9x+Kx?=
 =?us-ascii?Q?VSB4S5+TPOq3ZzwUXgeHlIRhC2cPYh8j0/v9VFZJHmT6ci7X0b1/ERZkEfYa?=
 =?us-ascii?Q?eDrnxlxQ+q9YeX9w5bqMxFjCO3FdU99E7KIr04FZZYgX0H2hyXp/WYHkaBGX?=
 =?us-ascii?Q?G1fwT/KYPZS2jULoL3IjyjffaGNoGQ+yEqw4V2IkSqrkHmPZy0hCTrfVYpni?=
 =?us-ascii?Q?H9Nrd7ifz+5fadJrDsN8ThyNXR7Ht+qc5CCEscKYZIT0WzpQ7U+ZMtNK+Tda?=
 =?us-ascii?Q?fbqmc2qQweeWYnLYAj6ADLTuqnFb1PRvXOINMyHrRLQHXvPMOx56MsQF0sZn?=
 =?us-ascii?Q?VPne4pThKO2n0kErPmMz4kv6roduMKVq6C7krPp6RtfV9Uq/AthHehhCFqj9?=
 =?us-ascii?Q?LhrQbMzXUpnoHMSWgcvAsipHiTtI/tzuxSCEasw4O0zhZc3ME17vumehFusP?=
 =?us-ascii?Q?I+PHKDQ7hZULakrmjjCt/Rns97x3ocSNiN+Zv/GojLL2zqiOaW1NjQsTsWZL?=
 =?us-ascii?Q?i29vB6p2Nrv1rtDLtEqhfwOJ0LjnDV0ILVJir8fWEUIOi2NpfeOcjL0R9Qea?=
 =?us-ascii?Q?E5WJ4w38S8gVgs3w6fDqnSieUvnMXN2XNGxvpQJrN0cSw7pQK/8o+V2sna4O?=
 =?us-ascii?Q?PhOXDrTkBAeoq7F+gDX6aTSn8jSiKd++ejHnEoOovutd+eQ0iWnZXiqoHFSR?=
 =?us-ascii?Q?IaKX7i2lvk6WASggV+9FMZpdd2OQaSHRId7vrvMNELWiMmU4PlENCR8dtaY9?=
 =?us-ascii?Q?EKLpKU/R56WH7L6o4heMXeiJ5OOjxc2dlKj+NtHsAyTKkWBdtj9FvuNbAWEB?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d52897-7006-4683-e1a8-08db3498c140
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 23:11:28.6987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7zk9MgOgGCODOSsNLkl6N8lKNRc86WX6qR/XG0vtLL7yYMraZTccM1PrPbpFoksobmgE1rRd6Vo5uzyFf8qDH9Jn8BJsFxiUmjuCOlhZ0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/7] drm/xe/reg_sr: Save errors for kunit
 integration
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 01:51:49AM -0700, Lucas De Marchi wrote:
> When there's an entry that is dropped when xe_reg_sr_add(), there's
> not much we can do other than reporting the error - it's for certain a
> driver issue or conflicting workarounds/tunings. Save the number of
> errors to be used later by kunit to report where it happens.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Does xe_reg_sr ever get allocated on the stack on with a non-zeroed
allocation?  I didn't think it did (it looks like they're always part of
the original xe_device allocation which was kzalloc'd), but I see
xe_reg_sr_init() explicitly zeroing the sr->pool substructure so it made
me second-guess myself.

Assuming I'm reading correctly that we never have an xe_reg_sr that
wasn't zeroed at allocation,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c       | 8 ++++++++
>  drivers/gpu/drm/xe/xe_reg_sr_types.h | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 9eaf1be27886..83f29aeb9250 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -84,6 +84,13 @@ static bool compatible_entries(const struct xe_reg_sr_entry *e1,
>  	return true;
>  }
>  
> +static void reg_sr_inc_error(struct xe_reg_sr *sr)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +	sr->errors++;
> +#endif
> +}
> +
>  int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>  		  const struct xe_reg_sr_entry *e)
>  {
> @@ -121,6 +128,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>  	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s): ret=%d\n",
>  		  idx, e->clr_bits, e->set_bits,
>  		  str_yes_no(e->masked_reg), ret);
> +	reg_sr_inc_error(sr);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> index 3d2257891005..91469784fd90 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> @@ -32,6 +32,10 @@ struct xe_reg_sr {
>  	} pool;
>  	struct xarray xa;
>  	const char *name;
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +	unsigned int errors;
> +#endif
>  };
>  
>  #endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
