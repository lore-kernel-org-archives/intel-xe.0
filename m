Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A49C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 23:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B7A10E2EB;
	Thu, 14 Dec 2023 23:12:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B4D10E2EB
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702595528; x=1734131528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rj7wUj5QJur/0V/QWSFxAVy4chf8jCVMBosDxcIyuHM=;
 b=ZF5BTGXoknIYDa/X5YFW5OCIEaRAAqNFTz3B7J647g/j3gEGttYhaxlW
 uhCPJzetw1ofLV56jRz+rXA4DUbeNaa9RiQohUz4WAOHhP4+QoX2f4agv
 OvdskWXjIqdQGG4nOJxetP7pUPWG+QxX0ixDg94e4340IQv8nerOqMC+k
 ilAQcOEVtx31TMQpnriwuRDEozYitu2F8s03veRa5hpbniaC0P6kxHFLy
 xPxJt1s/rnJPk95lBjrRhZKBbyv/fhQ/jpas3Cy6aG8cJt1FhuTbJ7dAx
 Wh1im33jLnByzYaG6exDj++XNaNNLZQ4DYvI3Ia6XeIS1jKigiBVawwTu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459521285"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="459521285"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 15:12:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803486006"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="803486006"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 15:12:08 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 15:12:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 15:12:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 15:12:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjBFI6x4E/nzWAJ2FR5uK/MHYf5Zr6Tj5HIHMKplXanjAdGVLIjpk3RJdJ1H2z7k8Y3o/pqhWHT3euNYFswWBav7y64O5dfw6J6SzsQPlYTl395CFC5B78wjTnRQCiwdNnjsXn1akY88SSkzKYZ9Gii+2ooCWJFVCQ2h1XOXBynJ3E1fWFHFGIzkXgduOOrBTf/UHfAYCl11Nvh8o+uq/yy+z6qt7JRjMVKKD++VgbIQdGksrv5HS/YgGaMn0Z4WkdwF2m8Q2SV/nvVEIj2B65KcgZxMCYtsWy8KeDl6NbHag4wGX4SX+Oq8ToVe/QST7YZXLQePZlroxtpOC0q1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgGyFYCMZBClBAhL7toLHbMmheb1UMBd8yXJHlJZCG8=;
 b=lWDUpKqIOH6FqJx1PmlMM0cRX1f4Mc3BxGaDLEvqZOnv6lnyWZSajPbaN6dqQYo7qoLrqCq85+LsEdck+M61O2lXrIYAshVR8nl9bX6JP5prTC5jQafKzr/U/509zzCg+4BQiu1LKAATleVFdpfnW+5BThZ1TGZGwsMWGocNGDejjnYhiFlb1LGUpb3CE2ytcOjlgLWq89pat2GY1ads9b6KKQcjlXFy93sRdRt4ZVl6iOI+QBRYyYY4wroQ8T7hCYXXaqAEse/cM+zUVDn05nS8xJ/0WZnFYjjZkAtD6GmAFXpQGnYBrawOcMwflgsmqUUFkIatp8MPOSeIrWXHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 23:12:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 23:12:04 +0000
Date: Thu, 14 Dec 2023 15:11:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 7/8] drm/xe: Re-sort GT register header
Message-ID: <20231214231159.GV1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-17-matthew.d.roper@intel.com>
 <ucxhzqlhaiyshaau2ywdgm5d4iwmo6yrsul2qwqmc4l66ox4jo@hq2bmv375cyn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ucxhzqlhaiyshaau2ywdgm5d4iwmo6yrsul2qwqmc4l66ox4jo@hq2bmv375cyn>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5330:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f680c2-bd18-42b1-b6f3-08dbfcfa15ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xu7EozZGA96BALlN0y4Ku6Bt43T4fiZbFmiFLexM6nO3/K6/zKfr0zpfgl+x0lzh67SiMvH9i34pdS9OsKhc6Y8jcitQbTOlZ1KMxogZdjKUah13r1ndQ6QwFXRJ+VXjxQdVtfwKP0Hb3WJ2/rDKPYIJhDGuWGqys1yrMEmCy979tGqWQwlXPxE1I4HPYNGQ4Gtn3Os5RUOqip4AFQ10AIF6NAtkUzyjNjrXmRDZlB9KJvcMj9KEiMbMW5eM2A4CKhAo+Q9Nn1Uu5/pQTTIieVdmDaRpBk7GaF7RuicSSTYNX70FJo+8mKtjfEonCOLpuKTRXZVAy0JJxpV1oEjI9lGnUEcWNhM/n7d+0tGeiDyFyC5PlRC6WMMzCJ8gH9O0r+RCh+7kfNdnVqcBwB7VwFXBfX5s/Nqju+XZujaFHULMvxAjIwMhffNE3G66SqMLtnU9uDIlzFptAv7uLGtUQ991sv1enyOvO9yKVYG4cQbnQMcR+9nXKlBKJ6WrzZbNlC0iCw0aVvXjw90QsWdWiw1EZ/3mq8fPSF5Fc5GJCFR3L3HNPIGwASAgN2OhGUKe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6666004)(478600001)(6486002)(82960400001)(38100700002)(26005)(83380400001)(1076003)(6512007)(6506007)(5660300002)(2906002)(8676002)(33656002)(6862004)(41300700001)(8936002)(4326008)(86362001)(66556008)(6636002)(316002)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uWcvgX1tpIkpUcN9KYv0Idfj1w1zQ28ANTuW0qgHrCSQ3lBZK3hx8wnmgovf?=
 =?us-ascii?Q?jzXraygsbeaN68DTWvQAPDVlMikDphtkmDMUZ1sFLxfrg7kalSS078FLG8Yx?=
 =?us-ascii?Q?cqMil12hLHblISUfrJ6GMUV/6m21PSkVbSZrH9xadjfesbPO3X1zCmjFZ+sh?=
 =?us-ascii?Q?sQ2dIeVzDdMeZky6c5OkkAS+IzLfUJsOtWdgoggyKC4XH8o+W0+CRvPNokXh?=
 =?us-ascii?Q?CSWs7T6gq0JnP4vPl2mVsm6lGKzJUwspo913jAGNqX0f0fzz83oVHPSWgPIG?=
 =?us-ascii?Q?tIpk39KVG3jNwoDERSBk+Xc6RxcAF5vVZ2DJ59dI0WJpS+fUlD2m27G1WmsS?=
 =?us-ascii?Q?q54quttZn7HrArEn4CE1tNJO4CQzDyuHVN2v11a4VP8JfQawctaavouQwSoQ?=
 =?us-ascii?Q?pRM1CCceWiDIsmp/67gDeEhKmolhzB0O5GgT4TmXbm/U15Bj7p3p7GsL46oq?=
 =?us-ascii?Q?rr+IctlBEC9rmltEdLgicTq9UyYhgS5+xprDT2hZ/rjaLOaNujzb4k/clzvN?=
 =?us-ascii?Q?E3wAyQbc/94WocrAW+nFltHobDgUsy0aS0jxtXCGjj5FrrYu+KwWG0/VEas+?=
 =?us-ascii?Q?HMyTLG5tzVjwmLVWo1ZYE85bbSYRCIHW15L5ennqOr57DwIdRHiDnT8ATRJi?=
 =?us-ascii?Q?B6d2JMrptF4n0lpkzEd1G/DRHPInCICgEc7JoKPOqsEQKr1UkpM4KNcV6KQi?=
 =?us-ascii?Q?1u2ZMliaBxa/yAtg9wB+TASk1kA/Gxv7ARZjzuPBYZe7yeaoeRUtpvPHF5GV?=
 =?us-ascii?Q?tCCBwsyAveBUi0hsVYo037shDcei+/SZGZjZvbsfor9OOyrDfhQk+cmlssAq?=
 =?us-ascii?Q?a//km58NIbyfv5BiItxaq2pX9aQTD7HtFAgdLTc+aSL/8oHtvgHtC0Mu8k1f?=
 =?us-ascii?Q?yypyYP6xrt8gCnn8tlI5Ny6CLYo4Qlyr3Ea0TsQlZBERHEh9D27qaGdgDOE2?=
 =?us-ascii?Q?ScxNRYWUBitvjB8euioOIguVBWVc8qCfR+A1QdUlUfPUqphnQAVBbfe6tTYN?=
 =?us-ascii?Q?nxJufZa+Vf4KGOaUSxHhnnV4iAdI+FZOVH7cjLxlydmx7cuaHdsmGZ+B9nzc?=
 =?us-ascii?Q?ioonUIuWr0Ip2Ty/AkA5Cu4/DIBpCYDhV994bKfI7y6eIjqA1lxHuTK/RQSs?=
 =?us-ascii?Q?7VGSKf2NQTrpw+D0m/YYS9cCVBFWn/wUpjBKk0uqFS3bcauR0ah6M2ynI/H8?=
 =?us-ascii?Q?3Q0pFloKh+8iqKaqJlJYcHXzGtIn+/7uylQOvoDOI71xrmbQhA2ormyL2yGW?=
 =?us-ascii?Q?W3tLkmUElhFg8YQ2MGB7QwdjzU7e+bJFzMi8tmXhOLCZBJp94HocBIovmbpg?=
 =?us-ascii?Q?lZx1f2zGsylep40UwQFxZR3PnR+MKdu/ePdWPdEy/tDKvQRbEWOgQ4dGBH+m?=
 =?us-ascii?Q?5qLUe86PJTNcGFHoVLqzzy1ZVj2DZt9I/TrgQEKzV1q5ikV7MhzWFong+LLi?=
 =?us-ascii?Q?tg/Yws3MNxU7liX4IK5r8OKWJbVWGXpE59QBoH1ibVrxR9uOMCQhBxblLup1?=
 =?us-ascii?Q?UkNoErBWPRqSldHNhZrzx750RPuupz4cqW76q0/7081aFT4RsOWsFVwp6ivQ?=
 =?us-ascii?Q?BHzlqaK8c1glQBPcUAdcwlCbRtZvQQkBr49SoIpk0UOGhoHwNJnobmiyyomq?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f680c2-bd18-42b1-b6f3-08dbfcfa15ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 23:12:04.4775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ54sqMo5Pdedv6NsZozqY5GyrKqmjvtgdwlnrqFfUFOFtObwfLySmrKdTqMNxT2I/LKhJhDQCJki/59ckoLeLHyYUc50x8KQTi/BUe+v8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5330
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

On Thu, Dec 14, 2023 at 04:21:04PM -0600, Lucas De Marchi wrote:
> On Thu, Dec 14, 2023 at 10:47:07AM -0800, Matt Roper wrote:
> > Keeping the register definitions sorted will make it easy to find
> > existing definitions and prevent accidental introduction of duplicate
> > definitions.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h | 58 ++++++++++++++--------------
> > 1 file changed, 29 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 2c48de2076a6..d152f0da9d97 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -42,11 +42,6 @@
> > #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
> > #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
> > 
> > -/* L3 Cache Control */
> > -#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
> > -#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
> > -#define LNCFCMOCS_REG_COUNT			32
> > -
> > #define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
> > #define MTL_MCR_SELECTOR			XE_REG(0xfd4)
> > #define SF_MCR_SELECTOR				XE_REG(0xfd8)
> > @@ -102,6 +97,12 @@
> > #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
> > #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
> > 
> > +#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
> > +
> > +#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
> > +#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> > +#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
> > +
> > #define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
> > #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
> > 
> > @@ -109,12 +110,6 @@
> > #define   FLSH_IGNORES_PSD			REG_BIT(10)
> > #define   FD_END_COLLECT			REG_BIT(5)
> > 
> > -#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
> > -#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> > -#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
> > -
> > -#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
> > -
> > #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
> > #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> > 
> > @@ -162,13 +157,14 @@
> 
> missing a hunk to fix MIRROR_FUSE3 vs XEHP_FUSE4
> 
> > #define   CCS_EN_MASK				REG_GENMASK(19, 16)
> > #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
> > 
> > -#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
> > -#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
> > -#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
> > -
> > #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
> > #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> > #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
> > +
> > +#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
> > +#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
> > +#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
> > +
> > #define XEHP_GT_COMPUTE_DSS_ENABLE		XE_REG(0x9144)
> > #define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		XE_REG(0x9148)
> > #define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
> > @@ -284,6 +280,11 @@
> > #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
> > #define   XEHPC_OVRLSCCC			REG_BIT(0)
> > 
> > +/* L3 Cache Control */
> > +#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
> > +#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
> > +#define LNCFCMOCS_REG_COUNT			32
> > +
> > #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
> > #define   XEHP_LNESPARE				REG_BIT(19)
> > 
> > @@ -360,13 +361,13 @@
> > #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
> > #define   DISABLE_DOP_GATING			REG_BIT(0)
> > 
> > +#define RT_CTRL					XE_REG_MCR(0xe530)
> > +#define   DIS_NULL_QUERY			REG_BIT(10)
> > +
> > #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
> > #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
> > #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
> > 
> > -#define RT_CTRL					XE_REG_MCR(0xe530)
> > -#define   DIS_NULL_QUERY			REG_BIT(10)
> > -
> > #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
> > #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> > #define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
> > @@ -423,11 +424,14 @@
> > 
> > #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
> > 
> > +#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
> > +#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
> > #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
> > #define   ENGINE1_MASK				REG_GENMASK(31, 16)
> > #define   ENGINE0_MASK				REG_GENMASK(15, 0)
> > -
> > #define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
> > +#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
> > +#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
> > 
> > #define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
> > #define   INTR_DATA_VALID			REG_BIT(31)
> > @@ -437,10 +441,6 @@
> > #define   OTHER_GUC_INSTANCE			0
> > #define   OTHER_GSC_INSTANCE			6
> > 
> > -#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
> > -#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
> > -#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
> > -#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
> > #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
> > #define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
> > #define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
> > @@ -462,12 +462,6 @@
> > #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> > #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
> > 
> > -#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
> > -#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> > -#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> > -#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
> > -#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> > -
> > #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> > #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> > #define   PROCHOT_MASK				REG_BIT(0)
> > @@ -480,4 +474,10 @@
> > #define   POWER_LIMIT_2_MASK			REG_BIT(11)
> > #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> > 
> > +#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
> > +#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> > +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> > +#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
> > +#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> 
> these and the ones above (everything after GT0_PERF_LIMIT_REASONS) are
> misplaced too. They should come before GT_INTR_DW. Other than that:
> 
> 
> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Just to clarify, you mean GT0_PERF_LIMIT_REASONS and
MTL_MEDIA_PERF_LIMIT_REASONS need to move up earlier, right?  The PVC_*
stuff here at the end has the highest offsets (0x281xxx) as far as I can
see, so it should stay at the very end of the file I think.


Matt

> 
> Lucas De Marchi
> 
> 
> > +
> > #endif
> > -- 
> > 2.43.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
