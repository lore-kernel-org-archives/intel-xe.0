Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17027C761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 22:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671F210E29C;
	Fri, 31 Mar 2023 22:08:44 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58BF10E29C
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 22:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680300521; x=1711836521;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A2eeund4bekEHMe1cABFiLcWuAxmNh3/vP8+YLg6H6s=;
 b=QLqzCUcplMBWoBVMXZsXHzMFysSIvtSVTY42Lcw/exB4B/YnWrH/Jy6V
 cB1wy/fEVksFw3HJV3Q8G/6uweabFVd0zsZwlGK9D832n9HKFhXzrBS/0
 4b6Lu77sncuPQBeBtVUMducvrdov5AxmNIt8CkFsTpgm3ZP34qxw6l0do
 GW5Kx72lgdRaM8ZCnIZ2R/T1EZczJsEkjPZipEjM9cQaSZIFz6UcZuLHW
 GHvio5HMFo3mn7iJ32xkbBbtLG6FTjKDpoNzyloxQte4pYJ3JmuPdpLVi
 LZnU94VPCEJM6fuW0MVUaq/c29Rvna7qZ9h3iltbbBznqyPerKRnbGEha Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321220851"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321220851"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 15:08:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="931334862"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="931334862"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2023 15:08:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 15:08:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 15:08:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 15:08:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0QtY+QbyZLW6Z4FxVwu8JfRR4hgEIXE5smS6aw5kYPSW1ofvr77G97iUpqb2sn58rxMXkvcBK/MZcLX0IzKOwzOnawL1WJ7rHegDiciiEVR0uBUi07QrjDAT8egDJEvgsv2T3ibqefpT6M/1zZKbJFhofuKEPJGaw/WqFrHsp0vBnK1lLh7FvQOnk+iGaL+bW8c2GvHKsIUwiazJCkZTKulO2U9GNHoufNcw/f4+MSvNIsnZt37WzGNRZQuLsip+XHawDazCc5x9qD4AkC6WdvXJoI73AiNMP11JCAaFETXFcfetXXORmBkQu2Dk1qNN45V9REfF+XCyAHHR5XteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDrF+ekWA4ARFqQrwe1VxY6BhKLUWrxz1K9PvRkKg+c=;
 b=UA8BSkK2Ew6t+x6THHgxoy2N8rM10ez16smOv/S9PCm2kzJC0aaYqjMTrbLxxzRiQ2XYcwTvT5gPIalfID34AJZbkCpN1Ut3GFZE9lC9zXGLF1LnkbxJDTq+kYpSuphVRYjd8DmvyTQkNpIYB0AkajlSNbKt7rOj02QtTJDECiDM3iUatk2OYxJtJLO9fpNLn3/tEjswkZNzyL3UzjeLRODvRbqUtr+PouoOtxj3N+8IH7S5/FTfcYHN5cGBazjVAaCSmU+vXRQkPAsy1Y9ndLJobzUwtQG7ggnxp8uc2g4iciQ0hOAoR1jrqY1uBP5bwl6rViy5xnGURERWdSI73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BY1PR11MB8056.namprd11.prod.outlook.com (2603:10b6:a03:533::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Fri, 31 Mar
 2023 22:08:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 22:08:32 +0000
Date: Fri, 31 Mar 2023 15:08:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230331220829.pthvki5m75mqkppk@ldmartin-desk2.lan>
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
 <20230330182405.43993-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230330182405.43993-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY5PR16CA0024.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BY1PR11MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: a96d05f7-7d45-4e03-3ab1-08db323476f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/ZlJSukv04+UyBgbYpI9tMxlsmVNY7ydvzWGNBiKP+dcrfMN3OVDDCU3zu3Nm8M1lO9Jw6sfG6aUmDQbDbAzDmd3ECfc1l6DggSB7FUENFsKUU6XeYJmZJSXjyHcnlUwRMxDrBOuUHfPt/BRzgy6o3cw2/tkSXOPmraYCPM7qcSvLUexBvJYQF0el7aTdIvFRUWhPHYUuM0iSFZq6OQZo52vkev4F4/xxZv6MpxLhW/IYc3SltuKVQ+KWcAHx9DQt5qH0+j0S+Dkx4z8aTzNI11jRsFk3Nw/Oy3a3Z7AMFHX9iTfryX4g7QY9H/vUizvCvATcjBKpTuTthSf5hoYoGKlFLwLMcTeEg4Bi7WU20lGghEEMzQqyX2K2P0UM6zt2G5MkhwaXYzkT9kWA0z8U/xve3lsMVEBuxFfR0TY96O0W+hKUWxdC9kEkFV+6gm7b590j23Ar7mQ0VXo+hKdZ9SA8IvC+A/vU32ryh/nhRUJKaZUh1HwUlrVi6EeulFOdF6bEw5PFxn/o/gk5m/ViovssEQxTJnlTy1FqK4RzPLkuNGU662W0eBxGS9f+H0/SGQaktqsaB1vcQHZpQDlmn3eUQyc8ASTpaKqnSpqbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(2906002)(38100700002)(41300700001)(82960400001)(5660300002)(86362001)(8936002)(4326008)(36756003)(6862004)(6666004)(83380400001)(6486002)(9686003)(186003)(6512007)(1076003)(8676002)(478600001)(26005)(6506007)(66476007)(66556008)(66946007)(316002)(6636002)(37363002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nczg8120ik8YriozJngEbEY574ZRMU/Idk9PcIm8/KoVjAcmYSpG1IywKYWQ?=
 =?us-ascii?Q?CLikSXfRnWTVQJZJ3jKIfNommUphfQeKn8LOp/4XnC/eH1Clzjpdm67MTt1q?=
 =?us-ascii?Q?iJjkPxkQzWiXptAagry3yxzswYFxsZxcbsNYqUWji4BsInIWfJ3MLUPW85NW?=
 =?us-ascii?Q?N3c66AHfw+8WHMYp+64unSOwWeSve8EYgfdljpYlIosX46UAOQJUxZdTsmHr?=
 =?us-ascii?Q?q3S+pYqqXocAA4ehsnil7/j2uQiEfEBr2SQAqbo1Kn3OZ6oSpMPXDhEzBo+e?=
 =?us-ascii?Q?tYEYB9+YvNps6LOLwfVMEgpMWr9g2kkdbjDj2+8uM2TEZ7CmH3rkR7QygLId?=
 =?us-ascii?Q?JSvK7VPUBLICzh0ThA+unpkjvaDK7pFVI0svlJC5uCqSFos5t9kQC3Iug3oE?=
 =?us-ascii?Q?W/Qy2zaiPMjQ5+noRjQr9MdXGqhPWdaIbfXywa34fK7MGWJ0yPyLbQ3F9ZiN?=
 =?us-ascii?Q?i5Id3Gc46DkWSUT1mq0uQDohuHUemWz98mg21rS8Tx4sediWHqzy9pjA8y0c?=
 =?us-ascii?Q?lQHxxxetbi5IHRw7IitpGBMsqdelSodWpFz/zmjmYeZ5vLKhy1pn0zqvIlfw?=
 =?us-ascii?Q?iEeRbaqWST01PstTwvjn2jPpLqd4C93A+QahCrhLUAdYLBJC/7PBU0R3LN9q?=
 =?us-ascii?Q?zv7rtVQ+x49DJ37ZEaLiQzBG79+RxA6I9b23RdCVGId+PYZk3zYPVSb4dApI?=
 =?us-ascii?Q?rM1iOZQEX01AkbAw8IctmPkjp5fDic3y3IJjeL5IELzXgnXKSZaELF8oG7sp?=
 =?us-ascii?Q?GYncg8iLqxf/pRdQSETP9BNu1V/Co9yNWwgMBp2DijO/wJaY41S6H6AdZoHm?=
 =?us-ascii?Q?raUFBbDSgUiiRRFcMZiciQ29WeA9YR9/FkHO3eDM4HE7EkYXCCf/HLbdP2Lb?=
 =?us-ascii?Q?b7/c9J97UlNf+41gCHLITysXeQBC3nn12s94ZHjDk0QLuO3ELkDUoDPETbwn?=
 =?us-ascii?Q?rBZfNLDDE2PDycZkL53M2VuknZZqzhk322IJevN4UXtZWzExuVMEQxGiyNYN?=
 =?us-ascii?Q?FJyftbpORHlz1SdgY/MVnTxBxrpoIV0nK3aFaww/tis4xw6MwyueMwKhZdJk?=
 =?us-ascii?Q?Db9PGnWsSnofDmgPKalFdP0Rg9iZK9/j4RYLe5kwvU98m3ZRbV58P0wh55zn?=
 =?us-ascii?Q?Q6DDH0Y3gEJY4HCWcMBQ11TsAQcnAuLNHsO7kPDYk+aFtU3qxP7WSuGawvaI?=
 =?us-ascii?Q?w4R0HJ1FSZwqqEK93VPN0QPpME0/xxoUiTlHGSy203+5JkjLBuof5YKJpnNq?=
 =?us-ascii?Q?fNcG9rwukvL3ATFPwPoVgiCPE7tuANUfxDxm5p179B4J3cBNOuaiqQFYDrpT?=
 =?us-ascii?Q?VE5lomp78bWlTPNGQT886bFk5sP11LZaAL1CiLsbmq6qJmd9l9ga8EA51SY/?=
 =?us-ascii?Q?EVt/vFDXAqmB2gfWUaBQwFnykXcNSnWqHLi5Q9I6/ycGjl2ZWFcZuO9TRr+L?=
 =?us-ascii?Q?zNGptyRng4L4NCj7jILO0xm45hjstaue08548pfzP3uU616cqLh9RlynENfO?=
 =?us-ascii?Q?z/P7h2QvS3+9jLJewxS/oElz8dEZEA0c3IFgfTZv4tiNMm5aPCCu99WrPWx5?=
 =?us-ascii?Q?pnW/4vltP9F+XwOLCSApmQ3oFfN1XdMpFd9Cdutwrh73hPhsZJvLkUFvTHoe?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a96d05f7-7d45-4e03-3ab1-08db323476f7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 22:08:32.1291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFWeeMqKB5NsLuTq6eK1webjLI+PtJAKkzV4iydlvHyhq7Zvmh02FNkt14hboyaNavXCm5LKpsAAP5/xs8caqfHTLbRP6UZ7iW6yzl2VlRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8056
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/8] drm/xe/irq: Add helpers to find
 ISR/IIR/IMR/IER registers
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

On Thu, Mar 30, 2023 at 11:23:59AM -0700, Matt Roper wrote:
>For cases where IRQ_INIT and IRQ_RESET are used, the relevant interrupt
>registers are always consecutive and ordered ISR, IMR, IIR, IER.  Adding
>helpers to look these up from a base offset will let us eliminate some
>of the CPP pasting and simplify other upcoming patches.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_reg_defs.h |  8 ++++++++
> drivers/gpu/drm/xe/regs/xe_regs.h     | 11 ++---------
> drivers/gpu/drm/xe/xe_irq.c           | 24 ++++++++++++------------
> 3 files changed, 22 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>index b5c25e31b889..7ff3aa9322af 100644
>--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>@@ -8,4 +8,12 @@
>
> #include "compat-i915-headers/i915_reg_defs.h"
>
>+/*
>+ * Interrupt registers for a unit are always consecutive and ordered
>+ * ISR, IMR, IIR, IER.
>+ */
>+#define IMR(offset)				_MMIO(offset + 0x4)
>+#define IIR(offset)				_MMIO(offset + 0x8)
>+#define IER(offset)				_MMIO(offset + 0xc)

since this is only to ever be used while handling the irqs in xe_irq.c,
wouldn't it be better o make it local to them local to that file?

My worry is that xe_reg_defs.h is the one file included by the world,
directly or indirectly and these IMR/IIR/IER short macros, although nice
would be poluting the "namespace".


>+
> #endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index c1c829c23df1..ffe5d726e196 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -76,15 +76,8 @@
>
> #define SOFTWARE_FLAGS_SPR33			_MMIO(0x4f084)
>
>-#define GEN8_PCU_ISR				_MMIO(0x444e0)
>-#define GEN8_PCU_IMR				_MMIO(0x444e4)
>-#define GEN8_PCU_IIR				_MMIO(0x444e8)
>-#define GEN8_PCU_IER				_MMIO(0x444ec)
>-
>-#define GEN11_GU_MISC_ISR			_MMIO(0x444f0)
>-#define GEN11_GU_MISC_IMR			_MMIO(0x444f4)
>-#define GEN11_GU_MISC_IIR			_MMIO(0x444f8)
>-#define GEN11_GU_MISC_IER			_MMIO(0x444fc)
>+#define PCU_IRQ_REGS				0x444e0
>+#define GU_MISC_IRQ_REGS			0x444f0

we now have:

	*_BASE	
	*_OFFSET
	*_REGS

to refer to the plain u32 value. Should we consolidate in just one?
Maybe _OFFSET  would be one that could be applied both when it's a
"base", in the sense of HW unit, and when it's "the start of similar
registers".

otherwise the simplication and avoiding the macro pasting looks pretty
good and a little bit more grep-able.

thanks
Lucas De Marchi

> #define   GEN11_GU_MISC_GSE			(1 << 27)
>
> #define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index d8fde8caff1e..74d7d999a383 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -48,9 +48,9 @@ static void irq_init(struct xe_gt *gt,
> }
> #define IRQ_INIT(gt, type, imr_val, ier_val) \
> 	irq_init((gt), \
>-		 type##IMR, imr_val, \
>-		 type##IER, ier_val, \
>-		 type##IIR)
>+		 IMR(type), imr_val, \
>+		 IER(type), ier_val, \
>+		 IIR(type))
>
> static void irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
> 			   i915_reg_t ier)
>@@ -67,7 +67,7 @@ static void irq_reset(struct xe_gt *gt, i915_reg_t imr, i915_reg_t iir,
> 	xe_mmio_read32(gt, iir.reg);
> }
> #define IRQ_RESET(gt, type) \
>-	irq_reset((gt), type##IMR, type##IIR, type##IER)
>+	irq_reset((gt), IMR(type), IIR(type), IER(type))
>
> static u32 gen11_intr_disable(struct xe_gt *gt)
> {
>@@ -90,9 +90,9 @@ gen11_gu_misc_irq_ack(struct xe_gt *gt, const u32 master_ctl)
> 	if (!(master_ctl & GEN11_GU_MISC_IRQ))
> 		return 0;
>
>-	iir = xe_mmio_read32(gt, GEN11_GU_MISC_IIR.reg);
>+	iir = xe_mmio_read32(gt, IIR(GU_MISC_IRQ_REGS).reg);
> 	if (likely(iir))
>-		xe_mmio_write32(gt, GEN11_GU_MISC_IIR.reg, iir);
>+		xe_mmio_write32(gt, IIR(GU_MISC_IRQ_REGS).reg, iir);
>
> 	return iir;
> }
>@@ -173,7 +173,7 @@ static void gen11_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>
> 	gen11_gt_irq_postinstall(xe, gt);
>
>-	IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
>+	IRQ_INIT(gt, GU_MISC_IRQ_REGS, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
>
> 	gen11_intr_enable(gt, true);
> }
>@@ -336,7 +336,7 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> {
> 	gen11_gt_irq_postinstall(xe, gt);
>
>-	IRQ_INIT(gt, GEN11_GU_MISC_, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
>+	IRQ_INIT(gt, GU_MISC_IRQ_REGS, ~GEN11_GU_MISC_GSE, GEN11_GU_MISC_GSE);
>
> 	if (gt->info.id == XE_GT0)
> 		dg1_intr_enable(xe, true);
>@@ -441,8 +441,8 @@ static void gen11_irq_reset(struct xe_gt *gt)
>
> 	gen11_gt_irq_reset(gt);
>
>-	IRQ_RESET(gt, GEN11_GU_MISC_);
>-	IRQ_RESET(gt, GEN8_PCU_);
>+	IRQ_RESET(gt, GU_MISC_IRQ_REGS);
>+	IRQ_RESET(gt, PCU_IRQ_REGS);
> }
>
> static void dg1_irq_reset(struct xe_gt *gt)
>@@ -452,8 +452,8 @@ static void dg1_irq_reset(struct xe_gt *gt)
>
> 	gen11_gt_irq_reset(gt);
>
>-	IRQ_RESET(gt, GEN11_GU_MISC_);
>-	IRQ_RESET(gt, GEN8_PCU_);
>+	IRQ_RESET(gt, GU_MISC_IRQ_REGS);
>+	IRQ_RESET(gt, PCU_IRQ_REGS);
> }
>
> static void xe_irq_reset(struct xe_device *xe)
>-- 
>2.39.2
>
