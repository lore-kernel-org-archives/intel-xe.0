Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195A1C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 00:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC70F10E30C;
	Fri, 15 Dec 2023 00:48:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11EF10E30C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 00:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702601304; x=1734137304;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LZIp2L8f79RqfBejCvaar0Vmu4PTJpWUtZvD6ac6/T8=;
 b=UCCD3kVIzjiMJXOA9Wo5oEJV8A5+14+uxqapHHfzBgmd0ddaiT07fMJX
 gGOWGJvvKkAcNBwuloSJkaCqu37AagxGyD58ah8QwLIoVEBMJ647KXiuQ
 DnA3YTqi3z94bAohM//ln4MEJ8WJmqcBTkxHO1q1DYwMJzZFlpLMcS5P8
 xQk6wiLM8vGdSy8n3/yBdZNVs1a8qty0M9TFdwzDhGS+KcsPYI9DAxenj
 FTrGbT6kWBGOsZQAgTM65/wF4njzCGAV4vUtDsHUiAzCFOiDtBEg7s2BI
 xFY7QRIW4Fk+pgxy2qc+ghsXY5XhYDvmusXzPN75B9ijSIP0coAUMuo/o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459531642"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="459531642"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 16:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="774571102"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="774571102"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 16:48:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 16:48:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 16:48:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 16:48:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rfuougi9KD1PoljTlYl5Q1zE0M6SXuU9V75+dS05tXQ3z+14CZpF3zAAapEWrtjsnfiPTY862G2pTysapajJ+0cnFgkc9d5hspRCvLw5nVvueZ5uTZ3z5wSg3dLqIUzCAAtk2VnjQ6JBJASjiPU6gsIaFg7JJ9m4WfrxvvBMKg7IOtCdDNj4LpfbKbhHg/eh+sNm44uIQKLpX+jyw/cSpqpMTELpaBLSKvtOuValwrQ3jG6UP7o/yQZI9L2U6PQjDyk60WWXrB+CfSM01U8KOfxXe4zchQJbZtvu4K9T4Sx0ZeEJK59m2UO1F4q/fImhFwpG0w3kchxI6KyttbmRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vd2rJE/zwYa2+PGwsuu6ni/u0GfZwAt51zES8hSgVTs=;
 b=VmVEq6eLF8h8GagsJeRKAAzVKkairTS3NsBGxA8cFw6nYPn7L/flNH4C7p5YkPw05nyVc4KqbKoq04U+sDbXMH/hAmdA8+dAubhsni89L0VCQKxW9RwhZwN4CdaoBcWKvt5G3ZpC2Y3wZxBPXiX1BauUDP/pHMEY8r20yyo/E/mEtjU4FAWcVbdj12v93fDz8FB59pJ1O4w+wmMyJyR6gQV4ZrFTYhTau/UpKP0737scZdmaP2K+KOXYBvlyC5HWKexQb+pQ1cX5EO3G3QC/fg5kAdne254Gc9Pw7/lsv7je/q7xB+HGhAHFXFu+cTZ51+nJGAckFy56H4iA0lqxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 00:48:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 00:48:15 +0000
Date: Thu, 14 Dec 2023 19:48:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Enable W=1 warnings by default
Message-ID: <ZXuiTCekgfRNBlKO@intel.com>
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
 <20231214213954.3223263-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214213954.3223263-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: be4aa0bc-43af-4dc5-d3e7-08dbfd0785da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3PIx/g4tkYvGwncF0F2igeygEnO8V2nSYUWyXPsOg/y3isC2LQnxViM/ThN44gF/L2D+CKXDrCv7bU5r5WEcyOQtaC2pKs5BTL3lO+lEr9UlZUM2KiZl0oFVAkvWLkvgalo0xkVHmZu/jmmR7NrEAE/KwkolZsJgVd9NW5DNsjIhVDeH4G8//+RkRNoXHXy7/MsHS1qit8Tn4ZsXf9kybrMeXjkfpIwfFbl3ZJwN+QMM9wp0pcTkrmcdrY6Lm9fH3J4meeUQq3HLv7uH3cWxrlUY0BZBAo2n8jARnPySu9MVIicPDBtWnMaAr+hi7p4wZvU61qHVylIqY+W2UbyAYc7FRtKo5/01KJ1jZOMbCWPZw5sj3wOCpboyM0d1RgpEtmwpRknYd3NylZCW2coiLtOJ8z12h1zOH38CzEoKOlWskdnRyb9HzTM9mStKd+7aXQlNJ3Iq72qoctvv1im5rHYMG/8aoUbVOzV3Iaei/2GkN6h/8PCqUVmZjuf7ukf68oqhm/Zzv4rNdRFwtzRJoDzIHOTg2uFnHhQAxTJBnaO9fzjBVCotZDck9GV9ofASY3IOaFiGRCp4zflxfwFnr4KnmPrnw6RbtEB7F3FNKvdNMoIajMnW+SKfPVNhqyRf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2616005)(41300700001)(83380400001)(26005)(6636002)(5660300002)(66946007)(8676002)(2906002)(8936002)(36756003)(86362001)(82960400001)(6506007)(6512007)(6486002)(37006003)(66556008)(66476007)(4326008)(6862004)(6666004)(316002)(44832011)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVI4TTdkMXVBaUlWQVMvRXdIVzdCbTlaVXZWY2xsREJrbjdpekVyMDhFSXBm?=
 =?utf-8?B?SllYYzFwUERjQW44Uk96c0JyQVVEOVA3WWUzbDJnUytIbHZ5azJ5WC9zWHpL?=
 =?utf-8?B?dTNNU1dnSnJYdjI2allmTmFyUFZseG13MEpxU3doSWVmdFVkQ3BwRXIxeHhj?=
 =?utf-8?B?T0dpSkxUbktyVW5tWnRnaWtrYk1KU0ZLWjBEaEQyUkdQOFJ4VWdTV29qUDQy?=
 =?utf-8?B?Y0xGaUxtMzQwelJXV1pMcVFTWnMwUDN5ZXJLM3ZqcUhDSndzN0lnYURoa09m?=
 =?utf-8?B?cThKOXpYSmlaNitXY2hDaDlmZi9HZWdTQWhUcTBoNVE5eWxJdzhwRGZzb01R?=
 =?utf-8?B?RXVyREdTYWs4TTRwb3BwZ3ordUhiNnNyYUNJMCtSc3BlL3UvV2xHK1h0a1Y0?=
 =?utf-8?B?UUc4U3UzM1NVY2tzckFVNFF2ZjNUOXAvZHBxQXB0d1B2ODZDUnhwbSszcWZO?=
 =?utf-8?B?TWpUWmtDd05reWVLRWF4U1kxRHFwckxTeW9HN2NGdmpJMDhJVlZDSmd1czVK?=
 =?utf-8?B?RC9oRmxtTzZjN010VjViY3hvWVAzVXJlU1JLeUFGeHpjTG8rN0JFQjUyeDhn?=
 =?utf-8?B?RTlDMXdtdjIrR3BWQkpKdGFyVzFOMTQrbWVldkVFWUpaSkhQUWhaRjNESkV4?=
 =?utf-8?B?aVFaV0ZnZE8vZzMxcStNOTZVNlAyVFhxZ0pLOWNnRDM0VjdJU3RLWGlja09Z?=
 =?utf-8?B?WUsvalhnTC9ETlB1TjV2Qm0yV29XS0k2THBYODJtbWZ0eGN4d1VjdnpYWnhL?=
 =?utf-8?B?aVR3UVVZQkV6bzliU0xwd3VFeStWb3V3a2xCcU91N3dROUFsQytscURBY2Q2?=
 =?utf-8?B?RG1lTGJ3OXRQdmdwckNmanQ3VkdvWTdaSW5XSUxTazcxSy91OU9tQVBuaXQy?=
 =?utf-8?B?OG03Z3VJMEdEL2VvUHcyVzBic2loc29XRC9iNlhBTDRNZkxOWGE3ZWY2eWVW?=
 =?utf-8?B?aUdiU0RNa1dpWm9QWngxUE9ZamdJVUJ0VDd5S3J0RVlzNDVXT0NrMElXKzhq?=
 =?utf-8?B?QlRhMmZYaFJPQTQzR0lmRkRBNjBrT1lXS3VrVjI0UzQvVnZBMmRUUm1aOVBQ?=
 =?utf-8?B?eDJJZFNXR2JiTGViMjJPWmNWb2s3bTdrVjdxeE91QVJWb2pXWkdHY0lVeEMy?=
 =?utf-8?B?cWRqVEIxZmYzVGplNnlhYnJ4TWd0K2dtTjkyaGI2ZHByaklRQ1VFV3JHT2kz?=
 =?utf-8?B?Q3V0YTVMV2hFYjNxUHVyY1pLMkNta2c1QWtwY09hcE5XNXpIY3RRZSs2WE1x?=
 =?utf-8?B?MzdsSWE0V3FZeVk5emVVMGsyWFRPV1E0TGtuMmh4M3hoSVZZbG1EOC9TUUpo?=
 =?utf-8?B?T2IrTWZmem91bTZDOTZBdHNFeHlEd1pYWk1yOFV2bURmUkJlQjRSSTlSU0Ev?=
 =?utf-8?B?c0U4L08yWGRJOU9hVWNNTi9BcEpvNGVXNDZpcGhNbTZpTVAyTHJFMkl1ank4?=
 =?utf-8?B?N3ZKZm5BVDdvN3NtbUZZN2FXK2FyTjRZQlI1akg3WVgvbjRBc2ZlTkwrRG1E?=
 =?utf-8?B?TXlPNFFpbENFTEVJV1dzWUM1NnUxL0pod1hLeFpPcEdCRWdOMmVvbDRsZkRB?=
 =?utf-8?B?NjRlMklhaC9TajNCVERRWHZnamRYeU9OTzV2U2dTaHM2SmQrQXZTS2c4V2NW?=
 =?utf-8?B?aUFncGdoSW04UmhBVnVFcjkxK2QzRjVuQkdISjZ3Um1QelcveE9ZbVBzUHhH?=
 =?utf-8?B?MTZRb0QwbDZuNU1ITlY3c1ZlRTVwRi8zNzVPekF4RGNSRHdESFNEbGRCekEx?=
 =?utf-8?B?VjI2K1AzYTllbWZ1WE5XNEZPc0JleXQ3TTNjWFA2TldWYTFXTWNTcktQcW1Y?=
 =?utf-8?B?ZTNKNFJmNW04WEJreXNCSnlWM3VDaHI4ZUYxaWZXODBvNG9udk5LYXZEK0hv?=
 =?utf-8?B?WFlNL0gyNFhJRnkvTGZXbWFOcWRlSHlQSXJ1NERFU1c2Zmk2MS85clZhYlRa?=
 =?utf-8?B?RGlMOU1kT0J0NlVVM1lZZCtxdlRBakxnWVpqa0Q3YUhqbGxoSEY4RGd2WktN?=
 =?utf-8?B?UGV6YW1CaENmN3JGcDJ0bkxWa0NHc3BJSXQ2V1ROVWhtNWVGNVZ4YmQwVmNr?=
 =?utf-8?B?WVZTdWZ2OTJhY1NRS1A0R05kWkoxZFZNUWhBbTJvUFBEak1NSUpvbG81SjRG?=
 =?utf-8?B?VFNrWnBPWDZCS3VSOHVLUXlrcmxMSElMZTVUbFR6SkRSVWN2SXFsTWpSYUcv?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be4aa0bc-43af-4dc5-d3e7-08dbfd0785da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 00:48:15.7974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhcyXtVd7njiOz2EXmigIzGO76XEJAjtmLVyig27NCq0X8iAtn7CxtkTTg+hlwdJtLMqw78qyrkKGl+mSUzWXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 01:39:54PM -0800, Lucas De Marchi wrote:
> Like done in commit 2250c7ead8ad ("drm/i915: enable W=1 warnings by default")
> for i915, enable W=1 warnings by default in xe.

I'm afraid we might have one more case before we can enable it:

drivers/gpu/drm/xe/display/ext/i915_utils.c:18:5: warning: no previous prototype for ‘__i915_inject_probe_error’ [-Wmissing-prototypes]
   18 | int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 47 ++++++++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f4ae063a7005..6790c049d89e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -3,25 +3,34 @@
>  # Makefile for the drm device driver.  This driver provides support for the
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>  
> -# Add a set of useful warning flags and enable -Werror for CI to prevent
> -# trivial mistakes from creeping in. We have to do this piecemeal as we reject
> -# any patch that isn't warning clean, so turning on -Wall -Wextra (or W=1) we
> -# need to filter out dubious warnings.  Still it is our interest
> -# to keep running locally with W=1 C=1 until we are completely clean.
> -#
> -# Note the danger in using -Wall -Wextra is that when CI updates gcc we
> -# will most likely get a sudden build breakage... Hopefully we will fix
> -# new warnings before CI updates!
> -subdir-ccflags-y := -Wall -Wextra
> -subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
> -subdir-ccflags-y += $(call cc-disable-warning, type-limits)
> -subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
> -subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
> -# clang warnings
> -subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
> -subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
> -subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
> -subdir-ccflags-y += $(call cc-disable-warning, frame-address)
> +# Unconditionally enable W=1 warnings locally
> +# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> +subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
> +subdir-ccflags-y += -Wmissing-declarations
> +subdir-ccflags-y += $(call cc-option, -Wrestrict)
> +subdir-ccflags-y += -Wmissing-format-attribute
> +subdir-ccflags-y += -Wmissing-prototypes
> +subdir-ccflags-y += -Wold-style-definition
> +subdir-ccflags-y += -Wmissing-include-dirs
> +subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> +subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> +subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> +subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> +# The following turn off the warnings enabled by -Wextra
> +ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-missing-field-initializers
> +subdir-ccflags-y += -Wno-type-limits
> +subdir-ccflags-y += -Wno-shift-negative-value
> +endif
> +ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-sign-compare
> +endif
> +# --- end copy-paste
> +
> +# Enable -Werror in CI and development
>  subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>  
>  subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
> -- 
> 2.40.1
> 
