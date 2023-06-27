Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BF4EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 16:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6C210E308;
	Tue, 27 Jun 2023 16:04:40 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596CA10E308
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687881878; x=1719417878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7WL6q8lcnvKEsRz3anQHjtXMPeHaCLwwawOs6mZeTUc=;
 b=L3TD8APi0fyBkszMs+SSy03rZoLuhp8kc4j4YJ3o54kBfNwF4Div6KUU
 dHGpo+qOUaqp/LGB4ANbaanpwB1H8xkqhwii4d4ax/4gPyWMvTAtmVNb5
 F1Z9GCinTWTjFquvryHumhDe6P13IIOYl8WGETgIF2Qmzvq0dlTgftm+L
 Xf0SdXUqn/zQhsxlF0Db53jxccYJH2Rwl0ZFnK2gwkXqNPnvVcWzJxpP7
 IRtlB0nsyzrFMw3B8+dOybFlegbujJqTPYXCJGu/bYX87h8yS/b/9cJa5
 mm6DuoS1BEltLw0Fx/wiwzkIQgpdYJk4chzKNzD4Rt/Ubi2Kj6Y0Leh7e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361649011"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="361649011"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 09:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="806547592"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="806547592"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jun 2023 09:03:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 09:03:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 09:03:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 09:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/JKfokr2jQWi3S03HUi9wPpYFz/WskR3kk8B95lv+1MreVAxpV0v2bAepxlAHQrJgsrL6k9QLrav7CCg7GreKyRhs63gmCj+PYd5T+Ore5ZnX+9xlU7AgbDkwGozPo7kv0AcRFKo4dO5NPezR+JL09TfRCbW50PKxhTMBq9u5c09/vWpETGB0ZN2Sph6nEeMdMcSLzcUUEvmnI15OfjHJbkEn+hDWQGSPDwH8fsHx38xAx+TCwF9Xgmk3E8QYIgqxsIcyT6Y71gdJltLRnhEOIWcTxLcNW/oPWKNirZeH3cBmIC8S045WxXMXdmTqo3zWSiYDj99TIV/nk6t3cu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1d5qaG15TLNIUhk5Z9c5ApFe63UAGBwRdCH5qpINVk=;
 b=FhQF3Uofgd14DXlPWWr4sJ25XwZBArH7cwkuKQ//rVyJ89WTW8aa59AlNtd1c/fe5RJ/FS2KAk8g88EFd4qGg1124BoTOgx7RcWwbAc7RAABpA1XRNoyqr4ZIT7RaihqYlYahISHh7UMg7wvNp/PtRx+yjzwRj36TWO29InlGF/1c8d0b404+STrdS0ZfXCZjl8vyiMeoA2N9CVWgwfd2ltnQQcWLOynHaHqcSZs1ViMSIsEGtcxVl8rzCs9ok569DlYRgJSvlbJ7zOWMV6fzSEwIKTvVAPCkEfxlgIPPCYxWDjn8yalJhsjoXY0Aqqx9V3b13bAhD60krkRKPgGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Tue, 27 Jun
 2023 16:03:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 16:03:35 +0000
Date: Tue, 27 Jun 2023 13:03:30 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <mrvl5amrsemu2nqk3btjxskligvhk5hdpm7c3uzqww23pyo6w6@d5riz6lr2w4r>
References: <20230627102223.260893-1-jani.nikula@intel.com>
 <20230627102223.260893-5-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230627102223.260893-5-jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR17CA0054.namprd17.prod.outlook.com
 (2603:10b6:a03:167::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 906acb12-e786-49a5-c3c1-08db77280fe1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yl3N1+bFMw7fKt4Ny5gy6wgcBoz8r8swZBPM5O7mwQWz8Y92v7j/Mby+yeOJHQHoEPJYDvitIYpMVsKH8mNm7MED71sUCpqWBafVBG8dIqW9wLouEt3cW2BlhWJnwX1NKEt48sTbf9NAohVpPhKZSafP+0Zpxt/aDznvgn32roc2DMn6V0hL6M5rg2onAz80x5qH1Fv2vqq2fgCvVGV1naq2X+mTMms3RYi6qZvTzjMPKIi55PxT5YxxE+AQClIj3FvPztrYPc0OPa/TJUh2PKFpZACjDcZ3CJU65rKKV5//wt5huNKdgkqfCpGVRqBMa+4q4Nu/01jd/zkOIMiBLXmTFsbSrdXeRDMO8trzq14gjoDAJrNWI/zzMw1bRh8giOrK4uz2YZ6SdtEjf5HHUxQ3JJttEDsnu4KneeKfp2e5Yzz43XL55KBEGJKr1E4nutGKeUOVyO61/I3Pzzf8oW44+BVR2fjwyv4wjJDi4Nuqgx2GOXLt47tFdOm28NWwzz7qoqVoPiG2jnFsMDPDC+ViROk687xxOBznYz/nE2z7RrwcSsZFDi6IXy8deq3w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199021)(316002)(66556008)(66946007)(6636002)(66476007)(4326008)(478600001)(6862004)(8936002)(8676002)(5660300002)(86362001)(41300700001)(6486002)(2906002)(33716001)(9686003)(186003)(6506007)(6512007)(6666004)(82960400001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uysx1GnGuSXzHY7izDuLkqLndW6NIb8cBj0IXvX9hDZa7zlEZERM3RcoAtUx?=
 =?us-ascii?Q?OsFFdIYwwRq9TBmtu85Qf3jz8zg0wovg/QCjQ9ZHXMjjmXW6iQbh7+LSmhcs?=
 =?us-ascii?Q?b8V/NjFHhOypAanedyeHvPVYx+tu1TnK5PMxU0peeCbO+N47cDvoVanP8cKL?=
 =?us-ascii?Q?x7o+CEBYhdm6oefKrKUnpUvctkdQeQ/TcGeEQXnGALlgd56jB6PGWZNOZzWp?=
 =?us-ascii?Q?/BGJQwDIVqreLh+EqUhqHBesEelkhH2etV2+RRDnuWROQVG3kcqMsvnHsuyC?=
 =?us-ascii?Q?XyChS639Ovp2GAZ0Ikc38Cj0/rZiNXt0C5WOapaUuH54bKLRJNQ/N/TweSbt?=
 =?us-ascii?Q?la++xB8AR3noYVGLiThRyklFwPV39b11TYCCRsMp1KU+zmKcH4Wf3taVDx15?=
 =?us-ascii?Q?fJw+ZM8pCGa0qIsr5+mbHBvVGVvGeM1K4fQ0EVWJqvOBBpIGpY1zi3zmHOHO?=
 =?us-ascii?Q?EtjLMdoX29RLWNOgYrY4Zc1BBByTZNLR+zit/PGgw2kX1DMRLZ267QL8QryU?=
 =?us-ascii?Q?giOzWNkyCVm99Vpom0FzXv3h1kzLj4tcevHCkMBVGScKIEkDOKRtTZs7v9cQ?=
 =?us-ascii?Q?JWcAZAmpWzFhOk8SZIAtaiM5Jz7gVNQz1snD7qYii8B0iNwGFKoU7W+CfQ6f?=
 =?us-ascii?Q?WpvLmVtha1Y4ho2Mz+zfP5DF5N2L0nPz8CH3guwvmcVapSaVdNW/1DW+/K7e?=
 =?us-ascii?Q?BiZU0HNxxjVR+mb8Arl4xL0IxACq2cQC1478vUC+opwMPlj1Uce+qClHslaL?=
 =?us-ascii?Q?nkV/5kQtQnXytoeuZ1bVIQDsCy5fyRNHLpOGheQih1coASoLE6DwQ/I85YL+?=
 =?us-ascii?Q?Ix8WYPlOpGxs4RaiaVDXD0PMfafg54ee1qvRwJxSuXf7Rhr6ziIqJGhoeN+Q?=
 =?us-ascii?Q?GgxPzaHS9VhgaRTjsBg5T9RncQTJEGwd8AyEa7ahCqpU6/x6t3hbD6LTh72R?=
 =?us-ascii?Q?x+qyfywWEKYv/+e+uoBm3eaK0/lA00jjXdZT/ut1m4RE5b5gqsG2DsXlYCaZ?=
 =?us-ascii?Q?Dxjjwl07F8KxU6eEt1gnvNFTbVmfntuuWS4lgcXyKn4aY6HkGm17j6KB3Do1?=
 =?us-ascii?Q?s2k3bHr0oBh1IXZ0ftpCCtU7JQ8zgcKLLVZpCodgMFUt5Bzhu/GJnpNf2E7M?=
 =?us-ascii?Q?hDsc/Ap9dakvzubKXMwTtTDCc+Z4TRumAgy6EVHrgrRPARLxJVxDHIjMUEcV?=
 =?us-ascii?Q?/AM4DJfEdF0nFdTwKt1C0GMHLxiogHVXa6ZFbMvt5KBc/ireyo7gMcvzQIJr?=
 =?us-ascii?Q?2OlSlXXQjX/4TZ1ZU6NSPjV5tOFXTSp6DVTURBHdKzGgFxoEl7yNzUQgWiSg?=
 =?us-ascii?Q?5wJbQZSEcGklqXKWxWiKX4dar+SxThJr8lKDCfYAu+3qLMqxgWxtP2VYvrpr?=
 =?us-ascii?Q?kU2NWIZiK9RuYx0OtoRwovMD9ego917uMyBfrhuiKQbcDW/WIxiS3b9ACDh/?=
 =?us-ascii?Q?Xpv8poqB08rjtIM/EzAMisK5DIXQvXMpSrJgkGJFlzp1krnJXdPsnWs305CN?=
 =?us-ascii?Q?pdhbvltlwMrHAptW2hv8Gl/cmFzD4yUPBsK9kErbSbduBedJGRgvTXPYldAX?=
 =?us-ascii?Q?JgaiPzgJzXt5E2uVnXU265t89g20S1zv8g6K0W8AIW0pp4IaKr3Y9Rw7Wb82?=
 =?us-ascii?Q?PcHedmq7+Kv6TepRS0Q8cFr5efdsFantbONVpVD4TjPPk9sNuM1e5+fUJ7EV?=
 =?us-ascii?Q?wdkwjw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 906acb12-e786-49a5-c3c1-08db77280fe1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 16:03:35.5778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7eG+n1tnoKEVMWjtmDim9T+nbVAtbB2wP87xV217pgL56w5lYraIPqUOSNRegRLbMZwYLlefP9UlcR9h3X2JRzTzrAvGoVrriAQsAb9j9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/5] fixup! drm/xe/display: Implement display
 support
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

On Tue, Jun 27, 2023 at 01:22:22PM +0300, Jani Nikula wrote:
>Add raw_reg_* accessors and use them.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> .../drm/xe/compat-i915-headers/intel_uncore.h | 24 +++++++++++++++++++
> drivers/gpu/drm/xe/display/ext/i915_irq.c     | 15 ++----------
> 2 files changed, 26 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>index 652654b5481d..a46dca558366 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>@@ -140,4 +140,28 @@ static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
> 	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
> }
>
>+static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
>+{
>+	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>+
>+	return xe_device_get_root_tile(xe)->mmio.regs;
>+}
>+
>+/*
>+ * The raw_reg_{read,write} macros are intended as a micro-optimization for
>+ * interrupt handlers so that the pointer indirection on uncore->regs can
>+ * be computed once (and presumably cached in a register) instead of generating
>+ * extra load instructions for each MMIO access.
>+ *
>+ * Given that these macros are only intended for non-GSI interrupt registers
>+ * (and the goal is to avoid extra instructions generated by the compiler),
>+ * these macros do not account for uncore->gsi_offset.  Any caller that needs
>+ * to use these macros on a GSI register is responsible for adding the
>+ * appropriate GSI offset to the 'base' parameter.
>+ */
>+#define raw_reg_read(base, reg) \

it's more a "map" rather than a "base". Currently it bypasses any
forcewake, gsi and it's also hidden from tracing.

As a micro-optimization I wonder if there are numbers anywhere to
justify them.  As for the *move* being done here from
xe/display/ext/i915_irq.c to xe/compat-i915-headers/intel_uncore.h, I'm
ok with it. But why are we converting it to a macro rather than the
inline function?  That would mean it also silently ignores any steering
needed, adding to the list above of things ignored, since there is no
type check anymore.

Lucas De Marchi

>+	readl(base + i915_mmio_reg_offset(reg))
>+#define raw_reg_write(base, reg, value) \
>+	writel(value, base + i915_mmio_reg_offset(reg))
>+
> #endif /* __INTEL_UNCORE_H__ */
>diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>index 6235ff9dec36..157403d1d8fe 100644
>--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
>+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>@@ -35,8 +35,10 @@
> #include <drm/drm_drv.h>
>
> #include "i915_drv.h"
>+#include "i915_irq.h"
> #include "i915_reg.h"
> #include "icl_dsi_regs.h"
>+#include "intel_clock_gating.h"
> #include "intel_display_trace.h"
> #include "intel_display_types.h"
> #include "intel_dp_aux.h"
>@@ -48,19 +50,6 @@
> #include "intel_psr_regs.h"
> #include "intel_uncore.h"
>
>-static u32 raw_reg_read(void __iomem *base, i915_reg_t reg)
>-{
>-	return readl(base + reg.reg);
>-}
>-
>-static void raw_reg_write(void __iomem *base, i915_reg_t reg, u32 value)
>-{
>-	writel(value, base + reg.reg);
>-}
>-
>-#include "i915_irq.h"
>-#include "intel_clock_gating.h"
>-
> static void gen3_irq_reset(struct xe_device *dev_priv, i915_reg_t imr,
> 		    i915_reg_t iir, i915_reg_t ier)
> {
>-- 
>2.39.2
>
