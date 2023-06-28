Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C45EB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 14:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F0710E0A8;
	Wed, 28 Jun 2023 14:40:39 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135CF10E0A8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687963237; x=1719499237;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZPKvznrvDw4omv4rm3mTZ4zjv/ugjpJjEFDjqfH6QjI=;
 b=myTGT0uXEmjFB5JpV/GpC/p8GUit+tzaM/xO8YIuI5l4vMtGdf/5pO8P
 rOd+FAnuKyU+q0Y3zAt+yO4wPcp13mM05MA5eDGwVouVX3rAR5EIu9hL/
 TsEXfMBrdO5VuwKX9lH7hO6yfPIKiP2ojh2g4cvEQFn8+HI82A02zsPl+
 p2YmLX/uzYiqcUM7DSd9074Okt8ChP/h1p1HztSruyxqplyfmaoOCJM6N
 8ytBtTTnvtAlaGJ1uKVnl40lR4KkMN+VnQ2cSzfweC1BMXG4r83a0fW55
 7SIrFuxVv3f4Cn9ylewkTA6v59TY+N9LxfHXgocVOeLUtYHBT2/zY1fCl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361903347"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="361903347"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963617869"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="963617869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2023 07:40:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 07:40:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 07:40:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 07:40:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWTXMJF0VKJ8znTIx6DsZjEpPhAkE/hvFj7bKgxOLJ6nHPMagUKtufr9CtOENz2nceAFVsj3/9L8G90bRcB61aEmwpoaE98KwfbSo/rXT+qB+kiQkD9ZDvmEOitjmuePjhjgThq9f30hZQHYHPtQDz+V8cD3oK/9CRWeCvzNl2sKQiRF9QPZcoHVjxhwXrGBpvOhlMEsqP6Q8C/yaZg2xDCrYcTh1PXBd1u7PRDYiTkYs1d3mlka4p+meTDGu/WEIbrOGo+LI4DQKEN8eJiaRK/dMYRyro1wUOwCenPD+VOB7vFmVGbCJtgplkqy1rM8ixjG1bb2UdghIh3zaci/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTH4q/DKmmC2COBZ4kdgyQL8USsibp8dFwbmYI2rOKo=;
 b=EYKky0KCt84tJLne5pIcvucxnM9sfd/qmCHG0TXIBhbmTk2BL2xW6IIl4kP6zUdnJ3aP2r7Yjwyd4xm7xPe2yA9VSuvAzkVtrpK2+HjnDMXbhP6YPUjqZ8QVftG6IbPow8G7r1dqWm+yMkWH3ecq+XngnSysobfUEErDfNReF6yKjN92+qBEcVgYkNqYQqRoSdyzcvNAWzSioUPJ7PlxUwngA4SrjcWpVRYmYDjFQgSz7G+6oIW8QF4YX9+3teCsAIHaDc1mU2rpvKYHbsv1QdvHPA8/umZNKpr1KJ0g50QAP+Xt8pCk6BmieF8LqzdReweq08WldwA5XpVDCw0Q+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 14:40:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 14:40:22 +0000
Date: Wed, 28 Jun 2023 11:40:17 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <7uk5b7b2rn5bdv6vky6ah6ew75kbmo6ibdaiubxcigmu45ck6n@hfl5upo3tk3i>
References: <20230627102223.260893-1-jani.nikula@intel.com>
 <20230627102223.260893-5-jani.nikula@intel.com>
 <mrvl5amrsemu2nqk3btjxskligvhk5hdpm7c3uzqww23pyo6w6@d5riz6lr2w4r>
 <87y1k4scj6.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87y1k4scj6.fsf@intel.com>
X-ClientProxiedBy: BY5PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c04b1e-efb4-4055-ff5e-08db77e59a23
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLj1JxdsR/vWPlB36J18I31+wMyglTAv1ZL3VY2NPlniEXC1eW9a57HWC4iYkn8sPeu4S4OhEU4jthsZGd2d3tJpsC4yUfHjXp12yZTTd/IRFLgSJNgWOJMXjLxoJZZEGv8XIoMH/vNuiPpGcd3uI1piKsOVDjO5lg6jQfUbxgnjBCLoJoy2QKVXzPPX9eLoxItMJPywBBC597zFoEzOqJrlGu2q2toz9CTzmiQ6RsHlTxDN4HW98mckY4/fjZCUbWVB/HKzbeNgnZgPq7Kw55DnFkQ8TplwFUfepVH5kebWp9zsYYZx1ZzqcQDG4p7taRpzjR6EsMeaAC1T4W2s5tFeQtgkgScpIgwPAMOUgiFCJMu5bLdchUfiU6ks32BKVVDx8WLjVuJTD0vKMk6KI231tKLbYzzuhaUvvURs2lIdmNSRy2hwwm4kpHgWkNmFlt+Mv+mKuC+M0v5olzQc3i/5Knz1WGGUhot1wrJELe1wsATKi3fc+kgBmrg6G5oGyyOaK+LkFEnrJg5J+k4k/HzMxGFLKnWEchFEJa0WcPCC1sG9cTFa6PTBpVxJu9GP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(6512007)(26005)(66556008)(66476007)(5660300002)(33716001)(6862004)(86362001)(8936002)(41300700001)(4326008)(316002)(8676002)(6636002)(82960400001)(66946007)(38100700002)(6506007)(6486002)(9686003)(186003)(2906002)(83380400001)(6666004)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UdK6UbdeKJKR4HdeBa+ZYWU/cUozwnibd+D4WYA8ZPwCYiYLBXR7uekL4o5w?=
 =?us-ascii?Q?xa+7l0OsbINPFzIwk8TlPHAGSrjDOjtk+u9JMqQvKtNjz44ESnODBIRUBHGC?=
 =?us-ascii?Q?52gDoRbS2KH/Iv8cgedqr9oi3MmNCgXL3ZWS7oq2NFjRWi0fL6bt3ZtEzMy8?=
 =?us-ascii?Q?Y+IYJabOaEjOTS4Fv0U6T7Lm5M7zDa4jRA8+j7Aj1269rK+OYCJUxqSalE8A?=
 =?us-ascii?Q?ZQJ0bMCLyUxBhSpQJPv6Ywrfyt45ErJq+meTRPc9DsJ5i2RgCv/Hxp8XNUZ1?=
 =?us-ascii?Q?jM7jsLYgM3NPwPKS9IqKs5gcY7hgpZdvRGnTvLe9mx+H4VQxE5U7Ls0KIP9V?=
 =?us-ascii?Q?PHCMmt/7Be7/GWWJOoXSePAoeYbiFcEFM5qGw8nAUU5lQOLEKm6m1sxDMdHd?=
 =?us-ascii?Q?T0yndq93R8Vvtqy/Ni5FjoGIgjnyHN0WoeL9aGLM3DxNyHRuboW478dr4Q79?=
 =?us-ascii?Q?Sw987osn6CpfJKc91tQZg146UItq/ngYi7aCneG3v6aOz/Ar/ut8RQXTFjjx?=
 =?us-ascii?Q?IhViVRqNTQLyEv1tGV6X6L8L+rjeRPhHb+z1IVN/78aQCeKcvitQa6OnaTtW?=
 =?us-ascii?Q?Ytge4GOzl1/uUrm0+jBVhUnNxcvnCBER/qs07FqoKZVRDbAV3eMCGRhhAr16?=
 =?us-ascii?Q?96NgoJN+G2/YFw6g90t1riqZUQj8vbNup+BZ0fZ4tj+te6OaIpPpIlH1JiXY?=
 =?us-ascii?Q?J1VONJog6zurvO6mTxGsZjiS1sqtQrgvtsiA7ZY9zYbpRJR38jcPZ3WESZ/B?=
 =?us-ascii?Q?uDh2kDwNdPbIxNfEzSuRmw1LhdGC/wCQ9+u8stAYOGPrBIm+1TNV+++ZMkuh?=
 =?us-ascii?Q?lQRezsvr+yYxSZxZaevA0lOg9JhPXVO6eQZOPH+ZaY3uxlpICrSexBu6/EgL?=
 =?us-ascii?Q?NPUn8O1iuZh8Bq6gNUiCcSuE42SqEuvAtyKpdqhfsR0lISmdhptrKgxKd61t?=
 =?us-ascii?Q?0Pm9C1kdxtSAjqKFyhFjxg8j2RP7SR5G1swH+IXtv9OCYC1KdCmBZhTxEBnv?=
 =?us-ascii?Q?4ZCItSgLMDaKccMX+OZoent/OpjPHn9W4H3OUQs2t8scMi+ViEH29TjQwd4P?=
 =?us-ascii?Q?UlS5V9/vwg54aQ336Ctut6KqCaPm1cH8++MvXdexeD4ilHIcs7wcOI4h4TRK?=
 =?us-ascii?Q?6HyQ/RheAuE5DDj22ROpQGnJp3fdDyXrotMK2PmyPs/vcKKvVIbX544l/nL0?=
 =?us-ascii?Q?0bDKA40S8DmYm7v/y8YQvykaKHchdJROhXb1y5vTmZ7IEstxKEfvj/0fD00P?=
 =?us-ascii?Q?thEZyWlE45nnD9drdUuKt3wYBDeW1D3VHKzmBOMye86a6qtVJli/j1CoApby?=
 =?us-ascii?Q?3i2pZh3K2reRE4xp/qrrcfVwTj64bmoBIVTXIyLzbYRUPCj1h8P9yTkeEViJ?=
 =?us-ascii?Q?k20ASeHzOj85kSrVQw5mSB3Py6lNO4T0sS8XmBP08YuyxMdgtJsyz+oRhKeX?=
 =?us-ascii?Q?qBRLren3bn0aoVBoO2nlQs7bNWgRsUE2WAB5paxl9NNxwC1uYJbaAUdOWfIE?=
 =?us-ascii?Q?Jnd5PuCNNPeDPYIIPCWROjdXGZeRrKNIiz1UA5yUlHODqdIV06s+upne7Crr?=
 =?us-ascii?Q?nSeqi4dq8R3FH/SMtrjA/wUECa3Ccd2Ztngdtg4fFq+ZmF8mIhH0htg4+nSp?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c04b1e-efb4-4055-ff5e-08db77e59a23
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 14:40:22.3617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWouQNj7pKCGcKBErlIhLemILG815nkGqDxWDnL0cI07QRM29ArB5WHNhJIH6q7HQihcp5PZMfJRiddiFOanSI/bc46Y1MJCEfqFrQQdMuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
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

On Wed, Jun 28, 2023 at 02:36:45AM +0300, Jani Nikula wrote:
>On Tue, 27 Jun 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Tue, Jun 27, 2023 at 01:22:22PM +0300, Jani Nikula wrote:
>>>Add raw_reg_* accessors and use them.
>>>
>>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>---
>>> .../drm/xe/compat-i915-headers/intel_uncore.h | 24 +++++++++++++++++++
>>> drivers/gpu/drm/xe/display/ext/i915_irq.c     | 15 ++----------
>>> 2 files changed, 26 insertions(+), 13 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>>index 652654b5481d..a46dca558366 100644
>>>--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>>@@ -140,4 +140,28 @@ static inline void intel_uncore_write_notrace(struct intel_uncore *uncore,
>>> 	xe_mmio_write32(__compat_uncore_to_gt(uncore), reg, val);
>>> }
>>>
>>>+static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
>>>+{
>>>+	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>>>+
>>>+	return xe_device_get_root_tile(xe)->mmio.regs;
>>>+}
>>>+
>>>+/*
>>>+ * The raw_reg_{read,write} macros are intended as a micro-optimization for
>>>+ * interrupt handlers so that the pointer indirection on uncore->regs can
>>>+ * be computed once (and presumably cached in a register) instead of generating
>>>+ * extra load instructions for each MMIO access.
>>>+ *
>>>+ * Given that these macros are only intended for non-GSI interrupt registers
>>>+ * (and the goal is to avoid extra instructions generated by the compiler),
>>>+ * these macros do not account for uncore->gsi_offset.  Any caller that needs
>>>+ * to use these macros on a GSI register is responsible for adding the
>>>+ * appropriate GSI offset to the 'base' parameter.
>>>+ */
>>>+#define raw_reg_read(base, reg) \
>>
>> it's more a "map" rather than a "base". Currently it bypasses any
>> forcewake, gsi and it's also hidden from tracing.
>>
>> As a micro-optimization I wonder if there are numbers anywhere to
>> justify them.  As for the *move* being done here from
>> xe/display/ext/i915_irq.c to xe/compat-i915-headers/intel_uncore.h, I'm
>> ok with it. But why are we converting it to a macro rather than the
>> inline function?  That would mean it also silently ignores any steering
>> needed, adding to the list above of things ignored, since there is no
>> type check anymore.
>
>100% copy-paste from i915.

ok, series is then


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>BR,
>Jani.
>
>
>>
>> Lucas De Marchi
>>
>>>+	readl(base + i915_mmio_reg_offset(reg))
>>>+#define raw_reg_write(base, reg, value) \
>>>+	writel(value, base + i915_mmio_reg_offset(reg))
>>>+
>>> #endif /* __INTEL_UNCORE_H__ */
>>>diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>>>index 6235ff9dec36..157403d1d8fe 100644
>>>--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
>>>+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>>>@@ -35,8 +35,10 @@
>>> #include <drm/drm_drv.h>
>>>
>>> #include "i915_drv.h"
>>>+#include "i915_irq.h"
>>> #include "i915_reg.h"
>>> #include "icl_dsi_regs.h"
>>>+#include "intel_clock_gating.h"
>>> #include "intel_display_trace.h"
>>> #include "intel_display_types.h"
>>> #include "intel_dp_aux.h"
>>>@@ -48,19 +50,6 @@
>>> #include "intel_psr_regs.h"
>>> #include "intel_uncore.h"
>>>
>>>-static u32 raw_reg_read(void __iomem *base, i915_reg_t reg)
>>>-{
>>>-	return readl(base + reg.reg);
>>>-}
>>>-
>>>-static void raw_reg_write(void __iomem *base, i915_reg_t reg, u32 value)
>>>-{
>>>-	writel(value, base + reg.reg);
>>>-}
>>>-
>>>-#include "i915_irq.h"
>>>-#include "intel_clock_gating.h"
>>>-
>>> static void gen3_irq_reset(struct xe_device *dev_priv, i915_reg_t imr,
>>> 		    i915_reg_t iir, i915_reg_t ier)
>>> {
>>>--
>>>2.39.2
>>>
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
