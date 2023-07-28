Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83235EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 21:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564F010E79A;
	Fri, 28 Jul 2023 21:52:21 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D3010E79A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690581140; x=1722117140;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GQM2Ip/evoY3LUB4WHUDWTAgEw9PtnFK2CXxZtJEq6w=;
 b=fgp9bkIXBu3MI6blh1T2L/RMf9LscOM3C3TTligBo9Ujs5tYLI9DEVpg
 A3NF1rynuRrgiDfMCWwwMSaUQa1UsvQardNkWVCWpx2z6sqeaf7om7Qpr
 JusUpdl3CZGqCW64s4uvamotDiGb2ZvOSa6KLtBY2IxbVqGlbS62B6QsP
 YsbwzxK3ehkqWn6DmABNLDCt1tVYXrTcCauuPJyP4sBUZHQJ9Rqwvh4Kt
 t1km3dNW9EF56mc5DJZhsr9MwJQNBOcM9TJLj+bZKoIycTGdNZ1ZXaaPZ
 Z3ioatB/kdRBwN7vp4srbsCkJ2b1Z4j2rc/zo5TGpaW352W2xcRyFAn/7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="368702472"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="368702472"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 14:52:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="704717592"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="704717592"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 14:52:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 14:52:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 14:52:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 14:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMqKf2BfSLZ4f6eGj2PBJQMyNiDNkraQ3v4uLjXvrV3SXBnkgmc1Zy0C+kQ6w82wSkHAtJCEcBzZ/bme228w5lXX7edMGiA+NbFmQA8UMLMX5jiFZ/meDQl9hg7CZx0RXnMK0C2LtImC/Yd7DoK9DRZUvho1amM1h+iy8jVpQCJsv29RRYXCn/5EEdK5VdSBDMARgr4rsbbRQdkesN0FcSLd13INJeqzwA5Q/TGpPpE2g8Ajt3Rj2ZGZkxo5WsKkaHuKI25BrrL3BQMEs70TPG/Ggeguzhnvs80i8ps7a8K1m4ax29GE9REaHBL65hTw92IZo+hWBf5EtAQRBaEE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhMicEmHjQfc5lZ7Jvs2D++ZT909DmRBi8bPBuFmzWc=;
 b=oMTCtmJc24f24BejMcMCfpBoar4gzZBTEp35cD3OoShr+p2IZON1dhwLdClGHJuizo74yIYpf3Wzx1LZtGkDYLKtbWZHJNyzt4mKsqu8D04sedK5w/IwzUeDchyvdjGHs2HiwIPdPyFbL+W9fjwPi9C8gmtiv1/tC+smj1Ukh69nlkDqE6UJAYxpHEsGA7t6bQ9ZHuCSq+8wCT4s5nVIrA8dBV2lQo0JJAoKU96iiwDA0Yd1yIbXWUWMpkSXydGZ/mfNcHhCAV0km8MEnL42SSbF3de67+C9qIh0JaRLgz70U7sYDAto3jgnWAIvWov2MQ08P8/CDVZccbkKzDEhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 21:52:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 21:52:16 +0000
Date: Fri, 28 Jul 2023 14:52:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <dixp76lhdeksd5smquqwibnheklsxo3lkt3tfjm46reg5umvv4@p2by55jbwumb>
References: <20230727213745.430938-1-rodrigo.vivi@intel.com>
 <20230728212642.GM138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230728212642.GM138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:a03:167::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 0714bcca-a415-4e63-7e90-08db8fb4e81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c65Ps8ySdJ9k8BVd4uCkEDD/zD37gbo5N14/1O9OLfySU89iyksQAxf3N0zj0988YD/FFlzUAxq35YMwKX5TyX2qKovxhaTJQtZl56bej80oS/OlcrxAAYbhAJnn2KFAxcAuWIuz/DpiLroqCUMrkP4khhx2X9/GaQe4AG8ZjmmdeCVaPsA64W+jGS9dqhD6ph4FpB7xqYxOtEC925ati0LnCM/eeO36wiEosoZus5QJigl266noeKZzQ3nCLrVbJHmG06UnBIYGCwOlC6i87tcexQadC+vzYIr9hhU+xyyqWq0Qh+/sn/+L4E02i3FU/j+8ExUJdqtfWxgPVFLYQyh4yKZ9cHVT/TQI/K2XsbaIkD9zpjajTTYYWuF9hPrdH6ZnmsOv47GNLjvccZnuuEAm2pG8V2aPey6GI63KBUkEZq+aVVgiR9RpluvSwnFMKXqWYXF23rUHLKdiJMPKda/PmN7xF5SKfwK1zdp6eWalWzbSl/4YWGdLQerwi57gKzhyQMHcpZZFknj/yxFRBFUYpqDS/PNWoAqlpNTU+CXFISPHkabwWeq70QkTs7jUHDLT6bIqyl4AjH0ALfiO4/mvRawHCLX1Apb0PUp92pIzmMipf1Dct1iR7JlIWc02
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(2906002)(6486002)(6666004)(38100700002)(5660300002)(186003)(86362001)(83380400001)(33716001)(41300700001)(66556008)(6862004)(316002)(26005)(8936002)(6506007)(966005)(66946007)(6512007)(6636002)(478600001)(66476007)(82960400001)(9686003)(8676002)(4326008)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j4T6b/CAaw25G5YNZMXMnXbCPcse7SK7tE8c6mPFd1H2YKhOgEL9ogvFjc7c?=
 =?us-ascii?Q?CkxcSIs3pF29DiRVWMGHWKG4+YvgS2kUjLL3SioCPYFBhHgHjeKfPdWflk8Y?=
 =?us-ascii?Q?usZ/gUEWlIoHWiN9OfgggZZxQFXlq84gj1js0b/bcuFv2b35XM1PTsONgxVr?=
 =?us-ascii?Q?g9gI1SYOMBUdmhpwZT5mTzF4iJj0BrBe2Wk46OarbXFgA4kh7vw0ZZ61oWk/?=
 =?us-ascii?Q?oRXSp4WQzWJtP+PaLIDpP2aqUju0TO+u4v+I8HRaP3ZWkTDTNcKUMA7sB5hS?=
 =?us-ascii?Q?72zSfqEpnIqQpQ+1YcBaAm6/QoICzT2DIdDr67WnRBVpgMbyHp1dOa2gm0lK?=
 =?us-ascii?Q?lT3Z/9MWCJHnHKHSHtefs/YDRswVO/fYW50N5qF40G7eLe1Fdjfxh6BtuA7r?=
 =?us-ascii?Q?FgULC2OPZak4m6RxJaiC5nFOmua3RK2WUVQ7zB5fxiFJ1gPGia+4oGSiaDEB?=
 =?us-ascii?Q?nZvlfSv3U5PjkqWnwm0biJTf9bdKoA3P6/wYb2z19XeJsvtdVZmXEHCfJm6Q?=
 =?us-ascii?Q?9KyW1tiKbdWGs++NET6LK4EORfe0I9GYCjpNkePEdYh8lItuzrOc1TrerSbk?=
 =?us-ascii?Q?7YC7FE/B07vs9J/KG/w8VxrMVXmUM59IHWCFpMopvBhUlXhTMM0ty7aTimKt?=
 =?us-ascii?Q?9eW8eH/EfQbn4M3XWNTcopzX4YtMBBgNz/Kxxi2LYSSXhLg3o/dxp6d0GsMm?=
 =?us-ascii?Q?LQwQ+8D+8FH+e3nA23OrAZZK5EciJawoKFpsRhUl7efwzstE9n48E+TprM5c?=
 =?us-ascii?Q?tgxbTAI+BoUFbRDqlhAwIuo+L7beC5xwTGXYr8gm3o/Exw9z8vUOLvV4uTR4?=
 =?us-ascii?Q?usQRh8dSpPaYMIEC90Miehnx8Jm/EaVZZsN3eDL4RvBHpkS3x6eJHJW9dAMk?=
 =?us-ascii?Q?/up5gJZaHUUa/Y48OEXdbhYnsdqb7kG/EzEAybCAPoO95jESIh/kzSazd7JX?=
 =?us-ascii?Q?jrD5aTp4ZiJs/5HDTouw7xIhYz//MF2PQa6YquCOcZAhUz+sYlkHdTdCk28f?=
 =?us-ascii?Q?RrvigzAEQpVx1u5q9n5KUGunOpe0b0JFS+BxnU77bW0WzzakUQ3c4ZzTs9jY?=
 =?us-ascii?Q?0QTXg/No7WD+s805JEFIlOHbEntU/IBnDMGOHCqLcBy369yAA0UyR04dNz35?=
 =?us-ascii?Q?kIBoqBzJbUS7Lk+Vop1ga5d0MWDt7DRBfQl+HUV+rFE+WDOi1LH7i19IUVJ8?=
 =?us-ascii?Q?0HfP0XK3tM6F8/X3WCAjFm6UIR3dO5JE7q57kkUaLejO93OmzQQQrxa3xzS6?=
 =?us-ascii?Q?PP+fP/K2Q4Ld78c9FmI3BWDQbGsh3AW3oDQ9gYZ4cSVW3dpKQvK36DftVyrq?=
 =?us-ascii?Q?vFy4+S4iU2h6bIeJasO6ctPW+vamiiirIImYCTwrFeTGdFN+hQ772z5VZxrV?=
 =?us-ascii?Q?7pxs2yPlX3Bi8YdEm7Sf43mRGXo9kt/2eTDNxcrbXBBpIS9XUp9USX9MHK9Z?=
 =?us-ascii?Q?PNQQTTuDvMoP8X7OZjVGdabMzj4+e36qxQ2Kikikfdtqw84oRDSDdfLDEKnd?=
 =?us-ascii?Q?I8QcxxsFAu403yVescWhCiYZ+b3hlwCaPBoLRfgie5INTDH65P0VItd2foyQ?=
 =?us-ascii?Q?afH4cp3rrv5F4dwYwvsHB67sU6uuLy1Dud82qynTn7q5rRoikepUijlaHM81?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0714bcca-a415-4e63-7e90-08db8fb4e81a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 21:52:15.8483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRyS9cBiguQBUSaWAU+z6cdw7wL6JjJrL+ewenqX3Hr/i+HuDBixeSIH5CAbfg9fs0vYgyB1doKg/cklZxc4STYrYTM9JtfLtpkhm6iN5/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix and clarify PAT Index selection.
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 02:26:42PM -0700, Matt Roper wrote:
>On Thu, Jul 27, 2023 at 05:37:45PM -0400, Rodrigo Vivi wrote:
>> PAT selection here in the Xe driver had inherited a lot
>> of history from i915 and ended up with some strange cases
>> like doing logical 'or' with 0, or even unnecessarily selecting
>> pat_index = 7, instead of simply opting for the 0.
>>
>> XXX: More work needs to be done in MTL and PVC for the right
>> selection, starting from the fact that pat_index = 2 is now the
>> uncached and pat_index = 3 is WB with some kind of coherence.
>>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.h      | 24 ++++++++++++++++++++----
>>  drivers/gpu/drm/xe/xe_migrate.c |  4 ++--
>>  drivers/gpu/drm/xe/xe_pt.c      | 10 +++++-----
>>  3 files changed, 27 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index b29750a47d23..8c80c0784010 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -37,10 +37,26 @@
>>  #define XE_BO_INTERNAL_TEST		BIT(30)
>>  #define XE_BO_INTERNAL_64K		BIT(31)
>>
>> -#define PPAT_UNCACHED                   GENMASK_ULL(4, 3)
>> -#define PPAT_CACHED_PDE                 0
>> -#define PPAT_CACHED                     BIT_ULL(7)
>> -#define PPAT_DISPLAY_ELLC               BIT_ULL(4)
>> +/*
>> + * PAT Index Mechanism
>> + *
>> + * Some bits encoded in the page table entries and directories,
>> + * are put together to form the "PAT_INDEX". The value of
>> + * PAT Index points to some cache options such as:
>> + *
>> + *   PAT_INDEX = 0 --> WB Cache
>> + *   PAT_INDEX = 1 --> WC Cache
>> + *   PAT_INDEX = 2 --> WT Cache
>> + *   PAT_INDEX = 3 --> Uncached
>> + *   (The full per-platform table can be found at xe_pat.c)
>> + *
>> + * The bits that form the PAT index for PPGTT are:
>> + *   PTE     - [62][ 7][4][3]
>> + *   PDE/PDP - [62][12][4][3]
>> + */
>> +#define PPAT_INDEX			(BIT_ULL(62) | BIT_ULL(7) | BIT_ULL(4) | BIT_ULL(3))
>> +#define PPAT_WT				BIT_ULL(4) /* PAT_INDEX = 2 */
>> +#define PPAT_UNCACHED			GENMASK_ULL(4, 3) /* PAT_INDEX = 3 */
>
>Which index corresponds to what behavior is platform-specific and will
>likely change with every major hardware change.  We should eliminate
>things like PPAT_WT or PPAT_UNCACHED completely.  If there's a
>platform-specific PAT index which is used internally by the driver in a
>bunch of places (e.g., "give me fully uncached behavior") we should
>cache that index in something like xe_gt->pat_uc.  It can't be a
>driver-wide constant.
>
>Generally the PAT selection is either going to come from userspace (and
>winds up getting passed all the way down to the pte/pde encoding
>functions), or we're working with some kernel-allocated buffer (like a
>GuC CTB or a golden LRC) and the exact characteristics that make sense
>need to be selected on a platform-by-platform basis at init time.
>
>>
>>  #define XE_PTE_SHIFT			12
>>  #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index aad76a6a8094..5d33ee1aa3a0 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -257,7 +257,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>
>>  		level = 2;
>>  		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>> -		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
>> +		flags = XE_PAGE_RW | XE_PAGE_PRESENT |
>
>Although a constant PPAT_CACHED isn't correct, it also isn't correct to
>just leave the PAT index as 0 either since that will result in different
>behavior on different platforms.
>
>>  			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
>>
>>  		/*
>> @@ -465,7 +465,7 @@ static void emit_pte(struct xe_migrate *m,
>>  				addr += vram_region_gpu_offset(bo->ttm.resource);
>>  				addr |= XE_PPGTT_PTE_DM;
>>  			}
>> -			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
>> +			addr |= XE_PAGE_PRESENT | XE_PAGE_RW;
>>  			bb->cs[bb->len++] = lower_32_bits(addr);
>>  			bb->cs[bb->len++] = upper_32_bits(addr);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 3129fdb0551c..20f2d1139e8c 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -65,10 +65,10 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>  	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>>
>> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
>> +	/* FIXME: the PPAT handling is incorrect for MTL and PVC */
>>
>>  	if (level != XE_CACHE_NONE)
>
>The important thing to accomplish for these encoding functions is to
>eliminate these symbolic values like XE_CACHE_NONE completely.

humn... kind of. Let me point people in this thread to the other one I
was reviewing: 
https://patchwork.freedesktop.org/series/120614/ and
https://patchwork.freedesktop.org/series/121354/


I think the XE_CACHE_NONE (or maybe a better name, UC) would be the
platform-agnostic to select the behavior desired by *kernel* uses of the
indexes.

so everywhere where it's needed (either for ppgtt, but mostly ggtt) we'd
have:

	pat_idx = xe_pat_get_index(xe, cache);

where cache is one of the platform-agnostic values. I'm using xe here
rather than gt since AFAIK this would be a per device behavior, not per
gt.

xe_pat.c implements xe_pat_get_index(). Basically during init it caches
the values of each platform-agnostic values. More or less like we
already do for mocs, but could just be an array.

	pte |= vm->pte_encode_pat(xe, pat_idx);

This vfunc is what gets that index and returns the right bits to encode
in the pte. The bits are already different per platform and if using
ggtt vs ppgtt. That's why I think it deserves to be a vfunc we can set
during init.

>Eventually we should just take the PAT index as a parameter and encode
>it directly without trying to interpret what it means.  The upper layers
>of the code (and/or userspace) are the ones responsible for selecting
>which index is actually appropriate.

I don't think we should try to interpret what comes from userspace
neither. But for kernel uses we need something like what we have for
mocs, to get the desired behavior.

Lucas De Marchi

>
>
>Matt
>
>> -		pde |= PPAT_CACHED_PDE;
>> +		pde &= ~PPAT_INDEX;
>>  	else
>>  		pde |= PPAT_UNCACHED;
>>
>> @@ -86,17 +86,17 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>  	if (unlikely(vma && xe_vma_is_null(vma)))
>>  		pte |= XE_PTE_NULL;
>>
>> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
>> +	/* FIXME: the PPAT handling is incorrect for MTL and PVC */
>>
>>  	switch (cache) {
>>  	case XE_CACHE_NONE:
>>  		pte |= PPAT_UNCACHED;
>>  		break;
>>  	case XE_CACHE_WT:
>> -		pte |= PPAT_DISPLAY_ELLC;
>> +		pte |= PPAT_WT;
>>  		break;
>>  	default:
>> -		pte |= PPAT_CACHED;
>> +		pte &= ~PPAT_INDEX;
>>  		break;
>>  	}
>>
>> --
>> 2.41.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
