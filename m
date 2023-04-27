Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4AEC77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 21:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E410F10E148;
	Thu, 27 Apr 2023 21:21:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1465510E148
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 21:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682630517; x=1714166517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oVsYhsJb6XP7Jv0wAR3PpmomaudRgAc0u8Q/5Al2kR0=;
 b=jvcWNH3kzhEf3Sti/ZOmjRdbXfGmCT4Yiq580sNxBC7tC3BHLRgBLaf6
 W04jZxMV8ny8bofCgVEaQYxKG+ghxyaBdAF3N/Fv31HfudmP94siBqfu5
 bD56jFRXhsS46DI2482R4muoBnsQbdjSYHXHngYxHFHnQ4zy1NoZKFbNH
 cehLa030Fv52fnxPlyldn4WPDXnznvMA3g5dbDmyBfl/whZPF79pMbAq9
 /j6phfQ+v3dLZqXCGNy+ZcVPema8wAmfQKm8WrtDwR96tJAG5QKjfyj4i
 xBpKccmSt7yWdQcR9HygfNk7mWiNHlF0UtQguXmh+si2NaJOk0cFGJK9w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336583354"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="336583354"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 14:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806114142"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="806114142"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2023 14:21:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 14:21:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 14:21:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 14:21:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 14:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=behTIwizrwwIIORKXPehzQLelT7uR0zh+N2GUUEP09MY4594fMChbO/OkrPktOpNEv4nsgpjTqwNbKHMSky4X7G6+qKQLD0paFVj0udg8qKYHo6XcdG0FBFESGMfuVH1gjTN3MBGxQuNTtDAFhXHnh2Ohm4VzM+jbVtbwTyZCdmidsaaMA/vVuBtE2X196M7SnoCH8abkwH5zMKmns9+oIGTvmN085kDRPezXhQWSNxoXPK0BRJYkA13FCh/U2gcZd0EVEZ3ci9igyBtUUk/VtufSc4rEjLK5J6BwSHUDCqevdTAAm4qRpRbJAWvou5sttMJeCsIjdVEk3IKN1YgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE/gr6hgg5pQ/2gyZLLsiGKrInc3aXtDXfRQK1sMMWA=;
 b=ZHtrvXgZAPQXcEa62vwevyotOYrB8uQk/7LGnqZJ/2xsV6TwG0JxBvnkR1gQ/Vf6Y2npMWjcyvRxNSyTELK11tyfThGzqgnACbEcUCGLOhE8TEesQZcDLjz1meeTKGjChkUp8eHJSnNohSDBM6wBPioB6Xte2mU0NQYOctCv8p5pLi3oyjihcNJVrr00pT052bFsC8oEF7VbJfqm30uu9Qxgiyk4juZJmO25tT5gCeL94o5oM56KKlhkLZKlRtDeqmQSoSTUQno5k2g1h5yU+VWSBQSVwuJDGLNjQXPIX+gG+TKyA+pUpCY9Hruh4GAjgXClsqso1UGJVlalno0KQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12)
 by PH7PR11MB8009.namprd11.prod.outlook.com (2603:10b6:510:248::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Thu, 27 Apr
 2023 21:21:51 +0000
Received: from BY5PR11MB4226.namprd11.prod.outlook.com
 ([fe80::c7fa:f42a:e213:8324]) by BY5PR11MB4226.namprd11.prod.outlook.com
 ([fe80::c7fa:f42a:e213:8324%7]) with mapi id 15.20.6340.021; Thu, 27 Apr 2023
 21:21:51 +0000
Date: Thu, 27 Apr 2023 14:21:48 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>
Message-ID: <ZErnbDIuNQT/nMme@msatwood-mobl>
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
 <20230426213242.1315119-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230426213242.1315119-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::41) To BY5PR11MB4226.namprd11.prod.outlook.com
 (2603:10b6:a03:1bf::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:EE_|PH7PR11MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: eef1e13c-94d7-4b1c-c974-08db47656afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3iVbO+l6blf5DXuRA+YZ3yL4AMzjtJP9xorCsk7QYbn2bCCLC69MCmBR9zRXpsCjMwfQsw/uFgXlpbH5QNnYsjX/K5i2chLjQW5TSaNMlyXmaz3+vwimKLiVMGghpLXOmZOxajw2UEhqkM0Okn7pwBTMOmbx+p87nlI5DTf45RCd9vcp2pfTpC+HA7uFM93V2ac37uIvpLm5JFFiAMptwT9n8Z1qrvLI+orO37W0IQiqpKdU7e9PGbWwhxKbSNn0Rn/8OfsXe2xw3ZwgcLZwJCbSiBDEnfQKMGCQHRXmTIsnrkFtJacuZdctckXWspNshHKvJbNGpNh7yn85+GCCWmMRoUzsIqNbODvccaOvj6cp45m4KTDhZl3h4+zK1tjFpUxk0b5RzuhHvWTwSlXRzdvSTSPNNudvEVqppYUp9bRAx0x+KovNBnjgMO5Q+jG3679SLthFnChWolSY1GG1bs8oKlBieYRtN3d6IyaYJLpQVWAE512mU+7TfDIv2W9DfFzOSwOeuRbS4fSXy7SH9qfsrqFtkl0P54G8rY3xhrUyMbRAuDDdtGQsU+HKg5D0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(6636002)(54906003)(478600001)(86362001)(38100700002)(33716001)(30864003)(8676002)(2906002)(8936002)(4326008)(66476007)(66556008)(316002)(66946007)(5660300002)(107886003)(82960400001)(41300700001)(26005)(6512007)(186003)(9686003)(6506007)(83380400001)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzhUS1ErRE1UbDhKQVZvN3pxTFdnajcwSnlQelhFQ3BLcG0yTkZrYWhEN0RZ?=
 =?utf-8?B?dEhDZXhIR1ZNcVp0ZURGbnZSOXFnV0xrTmdsMkxaV09WUUREOVYzdXVyd2Ro?=
 =?utf-8?B?VWF0c0d2NUhROWFLTUREWnpUWCtCc01ORlZpZm4rOFphWCtFUGRYOW1VNEJM?=
 =?utf-8?B?UTI0bldjNzA0ZDBJeldvb2hFTzA2R3J3UTQyaUt0dWd1UmZFSnJGT00zd0hm?=
 =?utf-8?B?N2dsYWNVbnJxSStDeG80d1plaDE3akNWbnQxaDdTY0RYSmEvNWRVWUE2QnhW?=
 =?utf-8?B?YXZjbGwyVkZZemZvQkpaRkFTNVlzdGdoNDIxL0hKTUZCSWxNbE1DbDBMT0tx?=
 =?utf-8?B?NlF5OWZHZExSYk5CYnlFMlp1WlJ1c2M2bnc0WlVnL1pmQnBRSUZNQ051THpW?=
 =?utf-8?B?NVZoT28zenlzMnErU0traEhORmZXSmxSYkhhZUUvTHY4djJMWmFhZjlsV3FZ?=
 =?utf-8?B?SXUyZ24reEZPdEcwMTA3QmFJb3ZTNHBpdWlRbU8ybklUTWM4RlBjdDBkdVc2?=
 =?utf-8?B?SlhvMVZkdlI5dzZkbm9Hd1VqODRVL2JLTEQ5aXdndk43VlRpVWJSd1FOVXhU?=
 =?utf-8?B?Y1Q1c1hOOStSTk1yTkJFbHBDMUJtRG40akVLOWFBaFJyNTJWZjlXUTlWV3pK?=
 =?utf-8?B?TnNleExqd0RTMnZHM21GLy9GRWpsL2ZXcGcwR043YjV3Y2FuSjhjdmg3SXBW?=
 =?utf-8?B?WXoyNUtoRStEQmg2OHQvNlRheGNkQXVxejUrUHlWeXNYcFRObjFIVDZRaDhp?=
 =?utf-8?B?ZndnTGMydmpHOFN0M2NRMDNpY1g2bzFGb0svcllCRXVlcFpST2V1OVhxbE1r?=
 =?utf-8?B?bjBrbG1SK0ZWMG8ra1BtM0hXeXFyWmxleHRTS1Mvc0Nmand4Vk9uZXVYN3Zr?=
 =?utf-8?B?UGk5U0pDOWlaRlhiU3dGK1lsZnVwUGwxbzdoRGszTGZzYkFERDltTytnRWN1?=
 =?utf-8?B?WXBETnhvUldPbXRFM29BY2Y1dUFDWVJqS25YSmtseEVBdkhiV3BPdENmOXJD?=
 =?utf-8?B?WUQ3bVp5K2hpYkxkdU9NT0pCNjlGMmRIbnFBcnR6K053N1FtL2RNWGNyMmpo?=
 =?utf-8?B?OUEzVFBGRE1LNjFDam1qWnFzcmtWMDVmODFnZXFqaGVmdlFzemlUN1lkVWFa?=
 =?utf-8?B?VWxkWFN2M0hTbDVjaVloNjZ0MGN1QzlUSkd4WlljUlliaTlxNnFXdFRKZ3pH?=
 =?utf-8?B?MU05TlI2b2ZtVlZIWmV3RS9aelZxMXJxZUJvTXVIdkxTMzlvWURSZThFVGNx?=
 =?utf-8?B?WnFXMzM1RVQ2SGtCdlZHYjJEOFBUempQSUtWTHlwZ3ZOU2h0VXRZNUxUSzlF?=
 =?utf-8?B?Zmk4a1JQbzNZVHZTYmd2d053ejNKL1FtS1NaZDQxek1OVWFUWHFlNVpicFd6?=
 =?utf-8?B?MTFERHBKdjRkd0VOYkR1Q2pobkR6RTRZTG9Rb0pWN2tFaElUOHBVeWp4bk1v?=
 =?utf-8?B?VXdwMlpaVkphOFMrV1BKSXp2UnR6UkpJemZZcHkreUh6bUtZYzd6TDJwNWxR?=
 =?utf-8?B?L1NaaVduMEV4b3QxciszVHhlS240TjlmeWVWbmMwRFRSd0hna3ZFVWFBSHFs?=
 =?utf-8?B?L1p5VHdIdnRDSEU3bXgybzJCZWVJYXJKL3N4TytUM25lOC83QnpDQ2g2djhC?=
 =?utf-8?B?Vm1UZmErUmhkamxEMEZPdldpcy9lTGNXUSthQVh4dG9heTJmcFJ3RkQ5Slo5?=
 =?utf-8?B?emo4YkZkV3RKWTZTaFBZTlV4VXd6VTVCbHg2TlpCazJWK05JZjFBcUhFdGJZ?=
 =?utf-8?B?eXU3MUZBNVdGV0dFc3BqTkNPWFRycHdJRnpYMGJiOUI0RGs0Y3h0eS9oMjVJ?=
 =?utf-8?B?MVU2L1NUU05GcUYvT3BrTjBGYWo2Y2ttQ0EwUU5WZisrNU5MS3B4QXJOYnVn?=
 =?utf-8?B?TWN0V3JBcUtTalQ2SE9MTTh6eURLTWx2YitKSkl4K2hZSFNOQVc0WnNXR1Y0?=
 =?utf-8?B?V3h6eTVWNERCK3FVOTdJVnRJM3l0c2lZQlV5MnB4WWlsRXJwVUgvT2xzTVlB?=
 =?utf-8?B?MDkvMXpsR1UvQ2VjMkIrSTRlVDhHQjh1NXJtQ3hLUjcxelJoOFZjWWx1elQ4?=
 =?utf-8?B?cm1PU1ByTTBqL0M1YjYrYXlrcmVaNXF2Tm9UcFRWOEt0QitTVmluaFVNZTlj?=
 =?utf-8?B?eUZkY0hYTGtOdGJ1YlQ5cEpTNzYzb3pBNXpaU3IyK0dWd1N4bzhwVjdJUzR4?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eef1e13c-94d7-4b1c-c974-08db47656afa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 21:21:51.7825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9wb6dG9No5HzHvq7HCJAfdf1PD44qXsp/K8vyCE1Q/QxY2Xt9aLgeSDZrQ3im5avKoih9LIqXTWXz3yvDuNJsZiaQcEPE6JIrG7BuRL/pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8009
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/17] drm/xe: Use REG_FIELD/REG_BIT for
 all regs/*.h
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 02:32:35PM -0700, Lucas De Marchi wrote:
> Convert the macro declarations to the equivalent GENMASK and
> and bitfield prep for all registers.
> 
> v2 (Matt Roper):
>   - Fix wrong conversion of RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
>   - Reorder fields of XEHP_SLICE_UNIT_LEVEL_CLKGATE for consistency
>   - Simplify CTC_SOURCE_* by only defining CTC_SOURCE_DIVIDE_LOGIC
>     as REG_BIT(0)
> 
With rebase,
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 24 +++++-----
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 57 +++++++++++-------------
>  drivers/gpu/drm/xe/regs/xe_regs.h        | 12 +++--
>  drivers/gpu/drm/xe/xe_gt_clock.c         | 19 ++++----
>  4 files changed, 50 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index bfcb0e9a6d4c..938055f75492 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -22,7 +22,7 @@
>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>  
>  #define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
> -#define   RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
> +#define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>  
>  #define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
> @@ -54,7 +54,7 @@
>  #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>  
>  #define RING_MODE(base)				_MMIO((base) + 0x29c)
> -#define   GFX_DISABLE_LEGACY_MODE		(1 << 3)
> +#define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>  
>  #define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
>  
> @@ -68,17 +68,17 @@
>  
>  #define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
>  #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 0)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 1)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 2)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 3)
>  #define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
> -#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
> -#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	REG_GENMASK(1, 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_1		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_4		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 1)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_16	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 2)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_64	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 3)
>  #define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
>  						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
>  						 RING_FORCE_TO_NONPRIV_DENY)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 1cb63d747c6f..0d8dcdccdaa3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -9,15 +9,13 @@
>  #include "regs/xe_reg_defs.h"
>  
>  /* RPM unit config (Gen8+) */
> -#define RPM_CONFIG0				_MMIO(0xd00)
> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK	(0x7 << RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT)
> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ	0
> +#define RPM_CONFIG0					_MMIO(0xd00)
> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ		0
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ	1
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ	2
> -#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ	3
> -#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT	1
> -#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK	(0x3 << RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT)
> +#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ		3
> +#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>  
>  #define FORCEWAKE_ACK_MEDIA_VDBOX(n)		_MMIO(0xd50 + (n) * 4)
>  #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		_MMIO(0xd70 + (n) * 4)
> @@ -39,15 +37,15 @@
>  #define MCR_SELECTOR				_MMIO(0xfdc)
>  #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
>  #define   MCR_MULTICAST				REG_BIT(31)
> -#define   MCR_SLICE(slice)			(((slice) & 0xf) << 27)
> -#define   MCR_SLICE_MASK			MCR_SLICE(0xf)
> -#define   MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
> -#define   MCR_SUBSLICE_MASK			MCR_SUBSLICE(0x7)
> +#define   MCR_SLICE_MASK			REG_GENMASK(30, 27)
> +#define   MCR_SLICE(slice)			REG_FIELD_PREP(MCR_SLICE_MASK, slice)
> +#define   MCR_SUBSLICE_MASK			REG_GENMASK(26, 24)
> +#define   MCR_SUBSLICE(subslice)		REG_FIELD_PREP(MCR_SUBSLICE_MASK, subslice)
>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
>  #define FF_SLICE_CS_CHICKEN1			_MMIO(0x20e0)
> -#define   FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
> +#define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>  
>  #define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
>  #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
> @@ -59,12 +57,12 @@
>  #define PS_INVOCATION_COUNT			_MMIO(0x2348)
>  
>  #define CS_CHICKEN1				_MMIO(0x2580)
> -#define   PREEMPT_3D_OBJECT_LEVEL		(1 << 0)
>  #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
>  #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
>  #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
>  #define   PREEMPT_GPGPU_COMMAND_LEVEL		PREEMPT_GPGPU_LEVEL(1, 0)
>  #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
> +#define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>  
>  #define GLOBAL_MOCS(i)				_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
>  #define GFX_CCS_AUX_NV				_MMIO(0x4208)
> @@ -131,19 +129,18 @@
>  
>  #define	MIRROR_FUSE3				_MMIO(0x9118)
>  #define   L3BANK_PAIR_COUNT			4
> -#define   L3BANK_MASK				0x0F
> +#define   L3BANK_MASK				REG_GENMASK(3, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>  #define   MAX_MSLICES				4
> -#define   MEML3_EN_MASK				0x0F
> +#define   MEML3_EN_MASK				REG_GENMASK(3, 0)
>  
>  /* Fuse readout registers for GT */
>  #define XEHP_FUSE4				_MMIO(0x9114)
>  #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>  
>  #define GT_VEBOX_VDBOX_DISABLE			_MMIO(0x9140)
> -#define   GT_VDBOX_DISABLE_MASK			0xff
> -#define   GT_VEBOX_DISABLE_SHIFT		16
> -#define   GT_VEBOX_DISABLE_MASK			(0x0f << GT_VEBOX_DISABLE_SHIFT)
> +#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
> +#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>  
>  #define XELP_EU_ENABLE				_MMIO(0x9134)	/* "_DISABLE" on Xe_LP */
>  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> @@ -203,12 +200,12 @@
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
>  #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
> -#define   SARBUNIT_CLKGATE_DIS			(1 << 5)
> -#define   RCCUNIT_CLKGATE_DIS			(1 << 7)
> -#define   MSCUNIT_CLKGATE_DIS			(1 << 10)
> -#define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
> -#define   L3_CLKGATE_DIS			REG_BIT(16)
>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
> +#define   L3_CLKGATE_DIS			REG_BIT(16)
> +#define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
> +#define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
> +#define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
> +#define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
>  
>  #define UNSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x94e4)
>  #define   VSUNIT_CLKGATE2_DIS			REG_BIT(19)
> @@ -224,7 +221,7 @@
>  #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
>  
>  #define DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
> -#define   DFR_DISABLE				(1 << 9)
> +#define   DFR_DISABLE				REG_BIT(9)
>  
>  #define RPNSWREQ				_MMIO(0xa008)
>  #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
> @@ -232,20 +229,16 @@
>  #define RC_STATE				_MMIO(0xa094)
>  
>  #define PMINTRMSK				_MMIO(0xa168)
> -#define   PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
> -#define   ARAT_EXPIRED_INTRMSK			(1 << 9)
> +#define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
> +#define   ARAT_EXPIRED_INTRMSK			REG_BIT(9)
>  
>  #define FORCEWAKE_GT				_MMIO(0xa188)
>  
>  #define PG_ENABLE				_MMIO(0xa210)
>  
> -/* GPM unit config (Gen9+) */
>  #define CTC_MODE				_MMIO(0xa26c)
> -#define   CTC_SOURCE_PARAMETER_MASK		1
> -#define   CTC_SOURCE_CRYSTAL_CLOCK		0
> -#define   CTC_SOURCE_DIVIDE_LOGIC		1
> -#define   CTC_SHIFT_PARAMETER_SHIFT		1
> -#define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
> +#define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
> +#define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>  
>  #define FORCEWAKE_RENDER			_MMIO(0xa278)
>  #define FORCEWAKE_MEDIA_VDBOX(n)		_MMIO(0xa540 + (n) * 4)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index e6b81bcff91f..da1d5aa6cdb7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -37,10 +37,10 @@
>  #define XEHPC_BCS7_RING_BASE			0x3ec000
>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>  #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
> -#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
> -#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
> +#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
> +#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> -#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
> +#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>  
>  #define FF_THREAD_MODE				_MMIO(0x20a0)
>  #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
> @@ -90,10 +90,8 @@
>  #define   DG1_MSTR_TILE(t)			REG_BIT(t)
>  
>  #define TIMESTAMP_OVERRIDE					_MMIO(0x44074)
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT		0
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		0x3ff
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
> -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>  
>  #define GGC					_MMIO(0x108040)
>  #define   GMS_MASK				REG_GENMASK(15, 8)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 1b7d00284535..49625d49bdcc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -17,13 +17,12 @@ static u32 read_reference_ts_freq(struct xe_gt *gt)
>  	u32 ts_override = xe_mmio_read32(gt, TIMESTAMP_OVERRIDE.reg);
>  	u32 base_freq, frac_freq;
>  
> -	base_freq = ((ts_override & TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK) >>
> -		     TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT) + 1;
> +	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> +				  ts_override) + 1;
>  	base_freq *= 1000000;
>  
> -	frac_freq = ((ts_override &
> -		      TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK) >>
> -		     TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT);
> +	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
> +				  ts_override);
>  	frac_freq = 1000000 / (frac_freq + 1);
>  
>  	return base_freq + frac_freq;
> @@ -35,9 +34,8 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  	const u32 f24_mhz = 24000000;
>  	const u32 f25_mhz = 25000000;
>  	const u32 f38_4_mhz = 38400000;
> -	u32 crystal_clock =
> -		(rpm_config_reg & RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
> -		RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
> +	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
> +					  rpm_config_reg);
>  
>  	switch (crystal_clock) {
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ :
> @@ -62,7 +60,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  	/* Assuming gen11+ so assert this assumption is correct */
>  	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
>  
> -	if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
> +	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
>  		freq = read_reference_ts_freq(gt);
>  	} else {
>  		u32 c0 = xe_mmio_read32(gt, RPM_CONFIG0.reg);
> @@ -74,8 +72,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  		 * register increments from this frequency (it might
>  		 * increment only every few clock cycle).
>  		 */
> -		freq >>= 3 - ((c0 & RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> -			      RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
> +		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>  	}
>  
>  	gt->info.clock_freq = freq;
> -- 
> 2.40.1
> 
