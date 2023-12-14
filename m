Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628E3C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 23:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCDC10E2F9;
	Thu, 14 Dec 2023 23:38:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA6610E2F9
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 23:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702597113; x=1734133113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tJIAZ1e/trpLJaq+tuEC75JGOo+xieQNkiINDbdCzyo=;
 b=EWV0afe9msBuv4ovvUM+B9AyeSaSL68ORHIrC7wlnMnGr81TnPizIroQ
 JtkmduddNrx2JqNaCiBzqznUhH4r4vxB6GvvZUDMVG7f8l+6WRmb/GpGl
 fToD1o1s0fHZu3J+1pkNXJQyBhRb0Ox40wNvoElEq7Mv8rKZImlxDQvHe
 jQFCbIM2Yg1dDIRYpC6MR2OfK0nnGMk5p+yGiREES1ojCTPlUvlFZLsMP
 seHvaIbb9/Ri3BI9cB7BNutWRWnwydBsPzpfxFDD2FnGn2XqYZfDRZKun
 LxW58KWEsjxqBnrhGw36jwZ9+aMfPR+snKPi7vid5oVSVCzZzl9TcaWfy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459524465"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="459524465"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 15:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="774553835"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; d="scan'208";a="774553835"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 15:38:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 15:38:32 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 15:38:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 15:38:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW+beoDMQ3FbHO5cjdjqCm8QwYYQDNXThQVmb33SPogzIq/tnhjIWkQzGinYjEWMsyN/RT+bW/hayqLSTuv087zepVV6WvKMkhxX79G58BcfEQr/M204tLs0GNnOp0OY+S98wK3v/VOuN5BSQDda9couXQszJuJG/Dfj1GvEFJ5wbzcjBeXG66TmmcV+/0ndO69zFqidzAuTkyaBBqqEKMorb2Fa7HhyT/1HeRvBIFd1D1z1KOBpGgSPydXLMbB12u2fsje1gymDQJnTfRzKP1fY2Ib2+z8KfngNW2MKzMQCd49ptnFoojbjq3lNyFuSzzgF489t4zHpLw1oO84B1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7+IbB/2tGc/am7/dzCiEgFz/8KfuN1jEjgBXzWk1jo=;
 b=ZH5/grnpUQ6iHlVLSXn+lmdnTBBILt8RogdCpHXwF7RFxveaErjBDQz5ywUGNAsjwJVC3LoWAwWGGN4PSblxFpMazBVzCeuyurm9p0KY20N0dZxPTSKYFB5WmTrLSvGwPaWIPzJ/ZsjNYKO4NN77RCFXHgL4qvB9OJcDK7W8B++CVM1jZioddZ9AanKi51SoqP4ZmP6vZSB/MV9JqFRCcItucsE+5ybH9OwLf498kibd2zJNQAyaQ4bUtmz1AhbJ85+GLenUOFQFeONSZpm6LGHlmhnIWCz5f8P5UKIAhPWfSKpcyy6mZPQsKDBTRrxOSBPR0GD5YuhqCye5VDil+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.38; Thu, 14 Dec
 2023 23:38:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 23:38:30 +0000
Date: Thu, 14 Dec 2023 17:38:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 7/8] drm/xe: Re-sort GT register header
Message-ID: <x4dwbndxjmiaqmyp7rvainmyo2swkg3w3cggf6nxr2wmtrscyk@55oypj7u3faw>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
 <20231214184659.2249559-17-matthew.d.roper@intel.com>
 <ucxhzqlhaiyshaau2ywdgm5d4iwmo6yrsul2qwqmc4l66ox4jo@hq2bmv375cyn>
 <20231214231159.GV1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231214231159.GV1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2f5d8c-7f30-4ee6-eec4-08dbfcfdc702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5oiZD00HhMoo9M9SA0x9D3UKinWMv9WFNeJuUiF2z85vXR6XzWtuWPHc5SMrn5xL1SWtnfhj3UMz3QCynfPn6grVf3P5/amdGtdOmA14n7SzSZZZNE42i7FC+ArIuXdPjKZU7S6LiYkIQuesTa0H1pmCKrR7dvzsVxA2vWCDg4pl1+GvrZtpa8G39CpvXMRPtad4+8MJB/P1wIbPWsX0V/FLAmvZgLTt4e+lSIzQM6bZE2RKOyBYa3ukC9Z5BTBKCBbyUbZMJn+S2ETqSJldFZ9bri2gAtvgzoKtdRLTvRcGDRcg6wRFqFByN0mIocKpFtRe4OI2kQa/O62A1/kTW4cl3Srf4qQ/Bg7gnzsNjzh4ib5ITcSDt7sflq+Nstc2BF9kvfvhwNBvxbqB1zJV+9UyI5vS6iDs79axhs1CYOu6BZ0NOHch627uyuCCCJMdztmKEODoPFWBlib1o9RH9Z2rRfxeRuU8Wfg0MChUjqFtlzC2oWCV8ypYSyZj4VlYwYRUwg3vJbcmL2KU04zQEnXzccVEpUMHeH1sVdj+Ad55h6x0ujHi06JTjb6xdqj+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(366004)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(86362001)(82960400001)(41300700001)(6666004)(478600001)(6506007)(66946007)(6636002)(66556008)(66476007)(26005)(9686003)(6512007)(33716001)(38100700002)(83380400001)(2906002)(6486002)(316002)(5660300002)(8936002)(6862004)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T79FB3/172sI9P2+U3+nxyE0cToQEuWEiWZxghwdMoaT6Sw9Pgr9WrUbLhi/?=
 =?us-ascii?Q?5fXZWrxj7UhVuWxnCoYLsQqWQjl6ggwj786eL0au3d8rUdz6xkkAZj7njf5Y?=
 =?us-ascii?Q?R9snEE6FbegwuRMy8GnxuHTnzXWxYqVtl2rI/MO+lfE0sVPypQwd/2o2n+z3?=
 =?us-ascii?Q?8axb6I8j3m9bFFCIwQF1CMlLjxe5BWDRpQgrtw6PO7pzZwACIPRrVILHuBDl?=
 =?us-ascii?Q?rhkr9UFsgDn7p7mDwKRT2sXO6g0lwB6RClI4zaCqpu3Mp+QgFImWPQ4wtGJW?=
 =?us-ascii?Q?p5LrA9bndPzPA4jQ38Ojbq93oan90fRQ3bjfxdVk+mAZF2kQFe0OvEQPaLwN?=
 =?us-ascii?Q?XyCKjE779pQwtugk/GTG/OJv8gZJelemSf7Mcg+te9mOhz+n8QstAhe1n36e?=
 =?us-ascii?Q?c/vLcl97+AWMDXIJ3DBt8VJPTSLHcyaPDobZrEKugpT8504F5QJtEi3HpWs8?=
 =?us-ascii?Q?k/3h2fm1PMD5rbHuUGlSCz/AAEkuDoHFLzkkCrDM8zE8ulHU6DOlWOAQOEjH?=
 =?us-ascii?Q?aVhrNQt+YyQVE0HaMi5pFh898CRXi5/9fmk1lzxf9yWqRaxKWlj5SzOE8Gth?=
 =?us-ascii?Q?KtgkL5AoaWJup2zIQYhjrWIkcmASCV1lVPfLdy4OZtGGnB35AIAI8HTp7o6c?=
 =?us-ascii?Q?zMixCLFr4KgTjqp9Q483S2xTknIJewOd4YCZVFy6Hd7JEpWSdD2uKgpbDDY3?=
 =?us-ascii?Q?vxUpOfa1eXstuMLWN4TRy1nmQ5YrFx2XfFu64PKYeKunlKzUTTtsI7dKSnh+?=
 =?us-ascii?Q?PWtgV2CT5T6tpztAZcJ59ZkXsVZmd1iZqnX9uxztwzeiCtz4beZATKaCdBpJ?=
 =?us-ascii?Q?H+nFNdJlDPYmnDrEzdo6qhWmrfbZMJhCClQs2Yclp9ySP4XzQpckXGsFutb7?=
 =?us-ascii?Q?Kg3KLYjecZSI9jgeKT3yuiPr9c8UAipmweJGUaoXT+PsVoRHI8CV3WVXSh0a?=
 =?us-ascii?Q?64sqIMtgSSkBPthF7eLbTI/hu0+c3sBe2XhsnXfQ7ZAtzaddSF6hzFgxC9/q?=
 =?us-ascii?Q?Q5TL2NcP/HAKKsPrTs8jK+ski2Xmh+O6+SGeH5XNnFR+RAEcavE2+HSMYokq?=
 =?us-ascii?Q?X+A+XpTn+lwWu4UOMz9/E33Iq6GHJevPTPB7yzg1TH1gzTRcpY+p1GtgmIo7?=
 =?us-ascii?Q?7G1VsJ9FZA+s9AMRpwTy6dJw8FMrVvKD2yab7aK8GtrZGm7dkBkUxE47I3dl?=
 =?us-ascii?Q?iGoaGy1Bm5acWPSrGkuUMtsqTuPn+YIjybahYIQEssdmfsn/f/q2N2UzYkSE?=
 =?us-ascii?Q?m66HemvINE1jcpnKd/90+iuNBmP86S0SHwyz8yigZsSeSHq8+MWiV9ye4kwN?=
 =?us-ascii?Q?JEPwGxT2B6pPRTCbAGtsKfMDbrZJ5hVqiUIlVOatlInrsrlpn89wc0fbdWT+?=
 =?us-ascii?Q?j5vjPJ7GgM1HJgfrM9LgLZ9MkFNo8PeyH5ft4U+fD2Q2nsvxycZAwwrI6it9?=
 =?us-ascii?Q?WU4sSw4I/Du9Y60yjn695KOtbnmAdkmNLvQZ53sr6akXZql+Us6oIhZzv2Oo?=
 =?us-ascii?Q?ObRJR2owUT4JR1vwENH4psWILgIQz4IQi93GdVn7PnUmuK6furQxqkNRq/ya?=
 =?us-ascii?Q?VDlt2ln3W6b7lQTKzjM2BMW7FLkpJx1gL+JADlsJjVcAHKNPYEg0nBEoHLBQ?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2f5d8c-7f30-4ee6-eec4-08dbfcfdc702
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 23:38:30.0813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVYlrXZR/TCtyrXyi6IWCdBChmBGv+SvvA5ni6ObpmV0mJ3ZZfAro3Lf5Ne7VGTGC/729uBv7ZyE3gzUH7aRNMiHw5GaAwpxlxEPa8Ky1CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Thu, Dec 14, 2023 at 03:11:59PM -0800, Matt Roper wrote:
>On Thu, Dec 14, 2023 at 04:21:04PM -0600, Lucas De Marchi wrote:
>> On Thu, Dec 14, 2023 at 10:47:07AM -0800, Matt Roper wrote:
>> > Keeping the register definitions sorted will make it easy to find
>> > existing definitions and prevent accidental introduction of duplicate
>> > definitions.
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h | 58 ++++++++++++++--------------
>> > 1 file changed, 29 insertions(+), 29 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index 2c48de2076a6..d152f0da9d97 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -42,11 +42,6 @@
>> > #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
>> > #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
>> >
>> > -/* L3 Cache Control */
>> > -#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
>> > -#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
>> > -#define LNCFCMOCS_REG_COUNT			32
>> > -
>> > #define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
>> > #define MTL_MCR_SELECTOR			XE_REG(0xfd4)
>> > #define SF_MCR_SELECTOR				XE_REG(0xfd8)
>> > @@ -102,6 +97,12 @@
>> > #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>> > #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>> >
>> > +#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>> > +
>> > +#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>> > +#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>> > +#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
>> > +
>> > #define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
>> > #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
>> >
>> > @@ -109,12 +110,6 @@
>> > #define   FLSH_IGNORES_PSD			REG_BIT(10)
>> > #define   FD_END_COLLECT			REG_BIT(5)
>> >
>> > -#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>> > -#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>> > -#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
>> > -
>> > -#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>> > -
>> > #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>> > #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>> >
>> > @@ -162,13 +157,14 @@
>>
>> missing a hunk to fix MIRROR_FUSE3 vs XEHP_FUSE4
>>
>> > #define   CCS_EN_MASK				REG_GENMASK(19, 16)
>> > #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>> >
>> > -#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
>> > -#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
>> > -#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>> > -
>> > #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
>> > #define   XELP_EU_MASK				REG_GENMASK(7, 0)
>> > #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
>> > +
>> > +#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
>> > +#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
>> > +#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>> > +
>> > #define XEHP_GT_COMPUTE_DSS_ENABLE		XE_REG(0x9144)
>> > #define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		XE_REG(0x9148)
>> > #define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
>> > @@ -284,6 +280,11 @@
>> > #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
>> > #define   XEHPC_OVRLSCCC			REG_BIT(0)
>> >
>> > +/* L3 Cache Control */
>> > +#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
>> > +#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
>> > +#define LNCFCMOCS_REG_COUNT			32
>> > +
>> > #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>> > #define   XEHP_LNESPARE				REG_BIT(19)
>> >
>> > @@ -360,13 +361,13 @@
>> > #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
>> > #define   DISABLE_DOP_GATING			REG_BIT(0)
>> >
>> > +#define RT_CTRL					XE_REG_MCR(0xe530)
>> > +#define   DIS_NULL_QUERY			REG_BIT(10)
>> > +
>> > #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
>> > #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
>> > #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
>> >
>> > -#define RT_CTRL					XE_REG_MCR(0xe530)
>> > -#define   DIS_NULL_QUERY			REG_BIT(10)
>> > -
>> > #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>> > #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>> > #define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
>> > @@ -423,11 +424,14 @@
>> >
>> > #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
>> >
>> > +#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
>> > +#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
>> > #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
>> > #define   ENGINE1_MASK				REG_GENMASK(31, 16)
>> > #define   ENGINE0_MASK				REG_GENMASK(15, 0)
>> > -
>> > #define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
>> > +#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
>> > +#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
>> >
>> > #define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
>> > #define   INTR_DATA_VALID			REG_BIT(31)
>> > @@ -437,10 +441,6 @@
>> > #define   OTHER_GUC_INSTANCE			0
>> > #define   OTHER_GSC_INSTANCE			6
>> >
>> > -#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
>> > -#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
>> > -#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
>> > -#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
>> > #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
>> > #define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
>> > #define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
>> > @@ -462,12 +462,6 @@
>> > #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>> > #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>> >
>> > -#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>> > -#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>> > -#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
>> > -#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>> > -#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>> > -
>> > #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>> > #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> > #define   PROCHOT_MASK				REG_BIT(0)
>> > @@ -480,4 +474,10 @@
>> > #define   POWER_LIMIT_2_MASK			REG_BIT(11)
>> > #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>> >
>> > +#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
>> > +#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
>> > +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
>> > +#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>> > +#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>>
>> these and the ones above (everything after GT0_PERF_LIMIT_REASONS) are
>> misplaced too. They should come before GT_INTR_DW. Other than that:
>>
>>
>> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Just to clarify, you mean GT0_PERF_LIMIT_REASONS and
>MTL_MEDIA_PERF_LIMIT_REASONS need to move up earlier, right?  The PVC_*
>stuff here at the end has the highest offsets (0x281xxx) as far as I can
>see, so it should stay at the very end of the file I think.

yeah... right.

Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>>
>> > +
>> > #endif
>> > --
>> > 2.43.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
