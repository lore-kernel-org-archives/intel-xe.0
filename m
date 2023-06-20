Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9C4EB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jun 2023 21:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E1210E073;
	Tue, 20 Jun 2023 21:28:11 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9627410E073
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jun 2023 21:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687296489; x=1718832489;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3YrOCimx966FU63QrtMubA36mggeLnRl62/5cA+/JYQ=;
 b=O4zwPUb8HEX9awCWP2mXsT5w/qthg+QWzfGgYcPrAZ4A4rbn+1jNFKuW
 y0VfnOMadNUUnb88tLyZ7HDbzSAtEkQ3qOaCNi1X0MBq5V5P7pswC4TJM
 5DAhHyBqyknFPibFflWU9ChFvqyIUr6XHDpM4lUCoDVFcYjN12M2dSLeZ
 gOoFphPRXRX+gvrVDwdBhORAoszj2kfuzbu0A3v0vmfrf3ayQIK6kZAH/
 JQP3adQTpJv6/krIaLKFIhrqcVAbh1PKx3QzbpENJN3gb0FPmrBMs/Ny5
 IjibDCQv0Jqd2jeG6eGLUrxxq2OZ696crj5lLT+SeWBcyXGSsW40YMWrJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="357483743"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="357483743"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 14:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838371315"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; d="scan'208";a="838371315"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 20 Jun 2023 14:27:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 14:27:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 14:27:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 14:27:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 14:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0m9gPr1KSEaIwVPJRP09C8v5uHRl44hcVcYe71g4/6Qtku+1ZmyASOlKY1W8yNCttdar4ugVBDuwvS3kjs0L4hLmPKlnpdFOaqZyulhi1XA2THtm5H/97LM+tRLLTOQ54Y9BsazRquiiuuIgsO5+KPPj52ubw1FXnUrCQsVOJ0fwZVEpG4Ww6XSq9tzSPf6DvofEW7ToPJlHS5YyFVyU368chsqsslMexR01mOCBhBgYzMN2vJUOFeAY9ar8+Rkt446NPFeVvln2jHXUkcHhiXqu/C248XZtn8e7MN2pXe130802zt/TPbunvrmO37Hj69ZasmidRXtoUCSu7g5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzeZM2rilym+F2RaNm55dHfg+JX1fHemU4CweJrgE6Q=;
 b=OLb7zUtleF2CTnJtJh7b3IcSWGrVjLgPGr6yiu6VgVtV8jSRVNvDn11uvwFHURdLt8BnrKJBc64TsimlF7rijM16BGSfXsgX3sR6B+SmTA9n1mE3o3HvZ34UeukunAb5VcsuP5lZex9jJteaYs1N6Tylz9ntM+9Lgp36p1QmyWAw7lhra116v+UvRBtzJTUj9Vkk0av18RYaMpXliIDznDKV2+sIMCWIvKLoVmpXyyjsvzWllxiyeFbq6Pf8tJUFzrFVdokKVMX3h5vKimO84VZBXrWnZ+gBztv0sdbIaogvUfZsbFpW4girr+NcaTGa45MHF74CDB8QOjKbjCqn7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8181.namprd11.prod.outlook.com (2603:10b6:8:159::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 21:27:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 21:27:53 +0000
Date: Tue, 20 Jun 2023 14:27:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Message-ID: <p7zjd7pktccivhdosyrteoixzrkqqiawzcjluhfujwo35qpisl@zol4cc6pxhjp>
References: <20230620193229.1698372-1-radhakrishna.sripada@intel.com>
 <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230620193229.1698372-3-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 374eda08-ef63-4454-bc8f-08db71d534f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuowzoOHBL5kzisS8Q4t39Hotl7oR/3iNnuHg3al9yiKnl+6/Iv5NNOBPckRFQTZtOADnpbkQA8m2VHdc9gRY54xF+PI5eabDGlvjJncCHBJKZ2QtBs7v+VODilSaSTaCQMcjj+UZB2pxzSaHpdI9FeuhNilZOKxU2IjEu6BcO8qEcwgI3NwjTfG6ANWWo8OQUK2JdkVVLUkRArpiiJqh8i4+bW5gw7lGZsBXeoc1ECoWZcY2GYpgC0U8AR9cAVUxbL6w4pnMLrfFQpd/8yTU/EXv3uHri51tE1lor4NYhwMtxWRnLvgkmohVWkQN60dxSUfMr8kDzAX1IYNXFRC1eX5DVdbOHG7AmskjjBdb52notER1D38iS5TFzrDL37t/DzB3ZzNaBq6gLwQ5NMVVWdowRQHP/6BSrwilGmafPbYBlCVqo5rABccy63QLzH/E2JJeiGjJEJp98Si6p8AZMLY3n/kYl9lhBmC44fAesWPUUC11K/vf1XxqE9L87VMTNJIdafh3tBoDpqoAAs4BZrgTCb+gyYJLN7bQC1AgYWGG7t9t9NQLGhfCQqq+dzr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(4326008)(478600001)(6636002)(6506007)(6486002)(6512007)(9686003)(26005)(107886003)(186003)(2906002)(8936002)(8676002)(41300700001)(66556008)(66946007)(66476007)(316002)(5660300002)(6862004)(38100700002)(86362001)(83380400001)(82960400001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YlGfDUd1moSpZN6yKDOzIc2GWVZ8/tT+guEaCq/r1aP7jNICdNxOGg9Gf2Kd?=
 =?us-ascii?Q?PxyLlBF+tpv3E0EYW1nnRZ865ivDoy/i3BoBo0rlYKZpGAewPN3x/EQ3eZor?=
 =?us-ascii?Q?zrggpIB1pAsgvmdC1+MYTkgH91Be+BdCJDfxk/F5/oT0S+kSC9W/l38qQ4bP?=
 =?us-ascii?Q?qWn2OSRFkHmoLzV7CaMV7JAaXkBU8S8LbbVAiikddoLSRAZCq9JAEqhiU4Oe?=
 =?us-ascii?Q?Dp42vstlFACPoeqwzAAmzDAS+2NANcI493XgCJx9zasOWFfGmcEqqJWnSHtN?=
 =?us-ascii?Q?AIpPn2dTN29LX1+a395M48V8QLnBKCGva5/XixP37tfreiwKp3lrdCNe7uZp?=
 =?us-ascii?Q?MQyEGeOWHl3eEXll0b7bhRc96UDVfAApeau9Q5iLvUwwsVrICg5lfWeU4NhD?=
 =?us-ascii?Q?aV+GW+GYyVf78peiDqienXPRKhkUVgE2my294clqxzabmbVzf+x1kCgfZXNp?=
 =?us-ascii?Q?o1U+0RpEXR0WEMGla4u+yx0xluBzE9pruMRiZjOmwKb7/NdeCjUXrvvweh87?=
 =?us-ascii?Q?hPIvJomqdS2ougwaoQn4L2bxg0IVVhjqF2ClOAQsN2ty0ZEubzB1rxLmRWRL?=
 =?us-ascii?Q?Lmk1EZ6SXH/IpTV6Z4soVTVQJNg/I72wig/lNt/qkHpIEJuRN9n7iiqB5yNW?=
 =?us-ascii?Q?V3NTFL5Nh5Zfs4VZwVpk8GYhHCqzz34xhKcaePbGtk+DQVs2YBw9aCN4lv0T?=
 =?us-ascii?Q?qyY0OSlxQtGvIlojIR9QRG2c7r4BSOu38VMx/qTtHUNMO/f06BpAMW/UelfE?=
 =?us-ascii?Q?Cx+V9N4hBrDFfRRtd9y5/P17wyzUThZfn8vL+bDP3TIC+O1qWKLP03AvAvmH?=
 =?us-ascii?Q?ENz4glXhXN0SM0ynKhM2suBc5AdLcOTVlI9hyorp4iaNFmlw/xGMCbUV3FSF?=
 =?us-ascii?Q?tbv/pFJzOuXL4LHgVTUtLRg6Ar1PD4BXRbzMALT55NQMBVKDUZhigQBHESJD?=
 =?us-ascii?Q?EpydrxIA0zJ6fb0dnNQxtS+idKAYmZiFBg610JYG3sr+zG8MelzoiAiFb5DW?=
 =?us-ascii?Q?VpVx6prBJ7WScZZsOUua6CLJKTe8AQPzEa+a6smlZYTCqJK+q9Dctjt4ISpQ?=
 =?us-ascii?Q?GoMIQfMRN5OPLF8RfOmbtbiodYVEAXFsY+L7qjOXFLWCiJvh5mEF9osaFsh/?=
 =?us-ascii?Q?tStJXMVG42pEBkqtXbCyLYFQViAcbVRxgZW95ocZAuTKKKaiHSSo3z55MjCR?=
 =?us-ascii?Q?VoU2U2TRXQDB31fWde8Q441yDQ5fxRtv+6tycY/GFAUMulzUQZfs4Yzm1JtS?=
 =?us-ascii?Q?AD0RZHHPtj6pUPXGM3p1CsmJa9Zf2kB01FGIIpifLgre+egPf98K+/3TvSHC?=
 =?us-ascii?Q?ZuwFWaWY73ivIg2wOm/DaoH5R/SMgXLmALBfMrr4isbBfDH4DhX6Phu6uWGd?=
 =?us-ascii?Q?nKPczyLF87s9v8LY6OYg9WLvrqvc+IFJqr/0X9i/j9IJ9kmI64KTQrPCZokl?=
 =?us-ascii?Q?KPcRGrc+2/kcFdvYyngdy7Z2vmgQr7xyciPGxkAk8tACkWosD+2C33Js+/AA?=
 =?us-ascii?Q?NufS99Ma/YVwgTZI9V4WN3PidJYXflrAF+ngJKL+ArzfoWw43SCRIvlM8C27?=
 =?us-ascii?Q?v9dBeJO5TXlUC2GWAXdgDoV5MOK/2GAuUkUtNOhOGFmPf9ErLauYmXS9ZHly?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 374eda08-ef63-4454-bc8f-08db71d534f3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 21:27:53.6046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6X8BNJeYxfHV6uzBbeJ8F8rlB75oZ8ojNCjqjWwpZC2QftF4st68SSWmBi0Ihe88I+a82AQuXA/h3T+5TOawec2qu348vlU4Y3NZ2pV/YOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8181
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Add reg read/write trace
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 12:32:29PM -0700, Radhakrishna Sripada wrote:
>This will help debug register read/writes and provide
>a way to trace all the mmio transactions.
>
>In order to avoid spam from xe_mmio_wait32,
>xe_mmio_read32_notrace is introduced and used.

feedback given before was to avoid the exported _notrace stuff. If there
was a justification for it somewhere I probably lost it. Could you
clarify? If I understand the above paragraph correctly, it's due to
the fact the xe_mmio_wait32() reads the register multiple times...
why would we want to avoid the "spam"? If we are reading it multiple
times, the trace should show it instead of hiding.  If we demonstrate
there is an actual impact, then xe_mmio_wait32() should be adjusted, not
the rest of the shim layer in intel_uncore.h

>
>v2: Do not use inline for the function declarations.(MattR)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> .../drm/xe/compat-i915-headers/intel_uncore.h |  8 +-
> drivers/gpu/drm/xe/xe_mmio.c                  | 80 ++++++++++++++++++-
> drivers/gpu/drm/xe/xe_mmio.h                  |  5 ++
> drivers/gpu/drm/xe/xe_trace.h                 | 26 ++++++
> 4 files changed, 111 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>index fae6213d26f1..036f3b963a84 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>@@ -113,7 +113,7 @@ static inline u32 intel_uncore_read_fw(struct fake_uncore *uncore,
> {
> 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>
>-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);

how would you even know that intel_uncore_read_fw() is non-traceable?
ditto for all the other functions in this header.


Lucas De Marchi

> }
>
> static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
>@@ -121,7 +121,7 @@ static inline void intel_uncore_write_fw(struct fake_uncore *uncore,
> {
> 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>
>-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
> }
>
> static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
>@@ -129,7 +129,7 @@ static inline u32 intel_uncore_read_notrace(struct fake_uncore *uncore,
> {
> 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>
>-	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg);
>+	return xe_mmio_read32_notrace(__fake_uncore_to_gt(uncore), reg);
> }
>
> static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
>@@ -137,7 +137,7 @@ static inline void intel_uncore_write_notrace(struct fake_uncore *uncore,
> {
> 	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>
>-	xe_mmio_write32(__fake_uncore_to_gt(uncore), reg, val);
>+	xe_mmio_write32_notrace(__fake_uncore_to_gt(uncore), reg, val);
> }
>
> #endif /* __INTEL_UNCORE_H__ */
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 78c7f839f783..ef2192a2d060 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -19,6 +19,7 @@
> #include "xe_gt_mcr.h"
> #include "xe_macros.h"
> #include "xe_module.h"
>+#include "xe_trace.h"
>
> #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> #define TILE_COUNT		REG_GENMASK(15, 8)
>@@ -429,7 +430,7 @@ static const struct xe_reg mmio_read_whitelist[] = {
> 	RING_TIMESTAMP(RENDER_RING_BASE),
> };
>
>-u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
>
>@@ -439,6 +440,31 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> 	return readb(tile->mmio.regs + reg.addr);
> }
>
>+u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	u8 val;
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	val = readb(tile->mmio.regs + reg.addr);
>+
>+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>+
>+	return val;
>+}
>+
>+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	writel(val, tile->mmio.regs + reg.addr);
>+}
>+
> void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
>@@ -446,10 +472,12 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> 	if (reg.addr < gt->mmio.adj_limit)
> 		reg.addr += gt->mmio.adj_offset;
>
>+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
>+
> 	writel(val, tile->mmio.regs + reg.addr);
> }
>
>-u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
>
>@@ -459,6 +487,21 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> 	return readl(tile->mmio.regs + reg.addr);
> }
>
>+u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	u32 val;
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	val = readl(tile->mmio.regs + reg.addr);
>+
>+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>+
>+	return val;
>+}
>+
> u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> {
> 	u32 old, reg_val;
>@@ -470,6 +513,16 @@ u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
> 	return old;
> }
>
>+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	writeq(val, tile->mmio.regs + reg.addr);
>+}
>+
> void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
>@@ -477,10 +530,12 @@ void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val)
> 	if (reg.addr < gt->mmio.adj_limit)
> 		reg.addr += gt->mmio.adj_offset;
>
>+	trace_xe_reg_rw(true, &reg, val, sizeof(val));
>+
> 	writeq(val, tile->mmio.regs + reg.addr);
> }
>
>-u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg)
> {
> 	struct xe_tile *tile = gt_to_tile(gt);
>
>@@ -490,6 +545,21 @@ u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> 	return readq(tile->mmio.regs + reg.addr);
> }
>
>+u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>+{
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	u64 val;
>+
>+	if (reg.addr < gt->mmio.adj_limit)
>+		reg.addr += gt->mmio.adj_offset;
>+
>+	val = readq(tile->mmio.regs + reg.addr);
>+
>+	trace_xe_reg_rw(false, &reg, val, sizeof(val));
>+
>+	return val;
>+}
>+
> int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
> 			       u32 mask, u32 eval)
> {
>@@ -511,7 +581,7 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask,
> 	u32 read;
>
> 	for (;;) {
>-		read = xe_mmio_read32(gt, reg);
>+		read = xe_mmio_read32_notrace(gt, reg);
> 		if ((read & mask) == val) {
> 			ret = 0;
> 			break;
>@@ -531,6 +601,8 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 val, u32 mask,
> 		wait <<= 1;
> 	}
>
>+	trace_xe_reg_rw(false, &reg, read, sizeof(read));
>+
> 	if (out_val)
> 		*out_val = read;
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index c06fcac2cc5b..02364ba9dda2 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -20,11 +20,16 @@ struct xe_device;
> #define GEN12_LMEM_BAR		2
>
> int xe_mmio_init(struct xe_device *xe);
>+u8 xe_mmio_read8_notrace(struct xe_gt *gt, struct xe_reg reg);
> u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
>+void xe_mmio_write32_notrace(struct xe_gt *gt, struct xe_reg reg, u32 val);
> void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>+u32 xe_mmio_read32_notrace(struct xe_gt *gt, struct xe_reg reg);
> u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg);
> u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set);
>+void xe_mmio_write64_notrace(struct xe_gt *gt, struct xe_reg reg, u64 val);
> void xe_mmio_write64(struct xe_gt *gt, struct xe_reg reg, u64 val);
>+u64 xe_mmio_read64_notrace(struct xe_gt *gt, struct xe_reg reg);
> u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg);
> int xe_mmio_write32_and_verify(struct xe_gt *gt, struct xe_reg reg, u32 val,
> 			       u32 mask, u32 eval);
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 2f8eb7ebe9a7..a5d514c190a2 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -12,6 +12,7 @@
> #include <linux/tracepoint.h>
> #include <linux/types.h>
>
>+#include "regs/xe_reg_defs.h"
> #include "xe_bo_types.h"
> #include "xe_engine_types.h"
> #include "xe_gt_tlb_invalidation_types.h"
>@@ -507,6 +508,31 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
> 	     TP_ARGS(vm)
> );
>
>+TRACE_EVENT(xe_reg_rw,
>+	    TP_PROTO(bool write, struct xe_reg *reg, u64 val, int len),
>+	    TP_ARGS(write, reg, val, len),
>+
>+	    TP_STRUCT__entry(
>+		    __field(u64, val)
>+		    __field(struct xe_reg *, reg)
>+		    __field(u16, write)
>+		    __field(u16, len)
>+		    ),
>+
>+	    TP_fast_assign(
>+		   __entry->val = (u64)val;
>+		   __entry->reg = reg;
>+		   __entry->write = write;
>+		   __entry->len = len;
>+		),
>+
>+	    TP_printk("%s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
>+		      __entry->write ? "write" : "read",
>+		      __entry->reg->addr, __entry->len,
>+		      (u32)(__entry->val & 0xffffffff),
>+		      (u32)(__entry->val >> 32))
>+);
>+
> TRACE_EVENT(xe_guc_ct_h2g_flow_control,
> 	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> 	    TP_ARGS(_head, _tail, size, space, len),
>-- 
>2.34.1
>
