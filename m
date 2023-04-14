Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7969C77B72
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 19:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF9210EE63;
	Fri, 14 Apr 2023 19:04:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE3910EE63
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681499063; x=1713035063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yM9mrdtxmOIAgBeFeQN589PPTdkN0hzfjogxysuo1/A=;
 b=Vtre4JAZYZYImDbFuOqX8Se20Cgup0CgPmXqHFQk4TiZ1n3vM0Bu02oj
 619nXl49JZLz7Dinjyc1xWQrdWLMdh/FsAMUQUe52e92qV/31xp7JbTRm
 zOzOTZL7v8GeRm8HnqtxhAIsbEE5FtxibkWPopGebCA5b0PhuEzhrXjFf
 gCLoXTyCW13feHGSFGRPf+beTnXtzlrE06H3mliXW5NF81xQfxSkUk+AT
 kIrNXeh9jKPEksrJ7VDoaUs+a7qpTKQht7qzVe5iT0+1PIVPJqs61/nTg
 uikbHMYU3sOHRfiWmQRAvDlN0FCBKw6xD1h1tElvDXzG2Ha6nQUQOW2XJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344547028"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="344547028"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 12:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="814002340"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="814002340"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 14 Apr 2023 12:04:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 12:04:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 12:04:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 12:04:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8x0Uy0UnbKubpg+wnmx1XvP+h+rSkcvINDKzxkrTiK4FLBz9WxrEY6pUCqj2M5TvpUBCMo4vHyFWEWnyMv60iOM1RJm6AVpp3qco6CGXzFMktqoc9Ir5Z30+0/8dxpcK9El/XJoBnnRW0TVAJehnfcfroRvvc6cLa/mIkmGvmWin6yRX8mYaNa58Pbrl7IZKJS6BphJLk/tovr2HAW+f4J8B93fXmDFLGNk5rwcDGRQtFWEvQrytUyj4FjynZlWaphjMP+aToqbQy2lt++4iyt6E0NzOBCZGw1xhbAm72UCFePnvaF8eFrFjzkfTQaq9NN+j/caUfn8E4rOzmgtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnA2uz2Q8imMLxXRITKttRhWKSIotp9cwUjrdfviAzU=;
 b=OZ2yxic02+iPMDrtsDXhB38A/+j1l+eiK1aIYyP2v9yvt1Mq5n+Z+lLcyh81eDM7NeDoSqJtEOIk5Itj4kDSnp1nZkEHH+Syvblk9SGxJcaTaSVF6hHDd7Iy70XUOl2+2x2Fb3589I2YNNzTc2QJFMNMaolzGfOU/PCQebJv64dvJMzJ7dDEJkfNW6v7TpSZwE6TX1F+2mfJ5WkphQFb08EYjysNJBjrXg/OKMb1yfLxsOMMQCvuDrkaqAfK/LFXW+RvWuJ8amwXs81+yOfy7Q9CotSy64KW1/78ZW1A8SFvqRdv/M0f7goy+c4o8GmE1JMMLL9WyhlX8wOS4wtwHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7262.namprd11.prod.outlook.com (2603:10b6:8:13c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Fri, 14 Apr
 2023 19:04:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 19:04:17 +0000
Date: Fri, 14 Apr 2023 12:04:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <bhl6gkkbxnospxl6lehp6rlqawiexvmqjwpmwnnj6jtpkncvpx@liortet3chsi>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: a89326c7-79f6-400d-4c02-08db3d1b0ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ddz2ykWGjUEfK/39wjQWa1cVin+NUKCLOZ5kV+BmQAOcWISiGizd6dcOfdzJf9YvR24hRzHq/3JFUZ3x1eehv/PM6eqp5xLXLP+cIhruUYDy1EA3oDYm5/tWxtFAJ3JoBg4M8mxhAB5H894NWTb4v/U7Kj8Gb8lR0K2Lr5qGmZVWdTlAFZz2GSOVFdo8xWGv3vtksUDXo3Ec6W4F3YlBUbbWgyLYZvH0pBTsgUmHrgPdFH9wn7L4GR+8DFt1Pb3ka++dP6mXwTh8MDXRYdUG5568TL7p3SU4luNUHyYGXEPl/lwNBS0N1MohWt5gnDhfJWD18KTp2zX78bKM3g+Isk4eRyGsFCI7kw+KtxyJejPxe/Yx66YeFgAlxE8+AJU/O6lMzQREwH3rT+odARE08JXT2K3Yg0gzIkMhmuVMgam9zvGEUwg8lztfHSdTc6n3Z1LuRr3EdgdOkQc8mI3pY7Mb+t4rTgUTDdiCuWSeK1YDpgqq/VyDidZijW4j6MvltVCHB4JNdSK89Z/xhAyK1Fag+Ba+5mhjKnC5VnBed9ZNJrdypkyVyyDQbrVhmol
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(66556008)(8676002)(4326008)(66476007)(66946007)(2906002)(6486002)(41300700001)(86362001)(5660300002)(6862004)(8936002)(316002)(478600001)(6636002)(83380400001)(6506007)(6512007)(9686003)(26005)(186003)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NsbFLOTpwa9xKqCW/+NNwwNpTvj7aluhwgEZOuMOgL+hIzI9f3Q9g1QReBnf?=
 =?us-ascii?Q?k1Upzwujc/XxgZLKTWdclxoJ9yAQrT69l8eWyopLNaA4fqO1oN7y73M6QuS9?=
 =?us-ascii?Q?edjPoX4himV0wxFY1yKlmrEwHAW2kVbHpE7R+7JtUNcCtPwhxtfNEv6S9Yt9?=
 =?us-ascii?Q?n+owyZBhyAUj2nkzwGpTwIeiYr4Bb1zfAvNaZMT6PUFvnKqhn3xuPPGAScR8?=
 =?us-ascii?Q?zEA9NcbOTKGEEfz1PMo89p76FOI/mrJ0DpCjAp5PxW+k6k2QFG4QjlM4/4p6?=
 =?us-ascii?Q?PzD1N1Bbui6OVuAcj5yABXsSHBBr21gJK+0ZvdX+n/3W7qzasqB9I1Ekq9EN?=
 =?us-ascii?Q?twPoDOrsAlHMQo230MGQ7aN5rdvEA931UOgyYmhA1oA0tUi62miyR3wx+iXh?=
 =?us-ascii?Q?WDQ5jxLq+VDQG3N0vlGfN5tkpGG+piLhPnXps910G73TTZSM8K4C3ZO6w81M?=
 =?us-ascii?Q?m3ibi3OnEIDz5ViVTeyDHNnYemDHSiIeLXv4tlKM7/fq0Y5uanptd+T61uRe?=
 =?us-ascii?Q?Fukz6tUffmm8X02FqRL9bOtqQTUDSdcJ9sPGHV59rAcFoTMpGZ1FrajO90uQ?=
 =?us-ascii?Q?G4nDc4no/d6eTTWkxmuk+i23NwlvuWeu4C1cJ85df/RIY921Y2Z8W9J0Om2v?=
 =?us-ascii?Q?SJJcXRMmcAeyyLWpNCFta+AssgnZAgUrymXkXLfaWDGy5gjftgRUuSTzoAPy?=
 =?us-ascii?Q?RdTVbiEQvYM+awPbjYM4GqSb0V63obRAd9HRPk9suO4spJtkow5xkbAiRgbG?=
 =?us-ascii?Q?bzfpsLbNV4gOTYDuutMmCkRlnw+NnY56DrClfFEbalwCdo2pOGMVGBg+NCQH?=
 =?us-ascii?Q?1/2wjfej8KEnOyfFy2k1wZhchkTQ86EvVwDUu9j3HJqO+vFqO3aY6w7injZE?=
 =?us-ascii?Q?4wX3jxJat5z1jwEolNLBTk58UB1G87kzAlTRyV4GCV3RPUgDzWVI1GJxZEHl?=
 =?us-ascii?Q?l2B8c8Pllr/5JHxJhhWH9O+xShoYQsOPwR4lOr0KdM4F70E/2aXdjL9C5kGV?=
 =?us-ascii?Q?9kq0TRAh3h7T7zx0rb/AixwcdAEUVhM1Umm72iyyk0LQA1crCH1sDHPmI2Yj?=
 =?us-ascii?Q?emPTpi5WXMpuKk6RplMTduuJIglaM98+UHAFOi3TQUEkVx3mKZZplXGxw+fh?=
 =?us-ascii?Q?fDxC7q58gZWTCNnFrweizlusGR7pUF5XBa4CXbE731qnbf6oS3Lj6x9W2UUn?=
 =?us-ascii?Q?A1FNIHZp1f/q3ZfbY77hLYhYfQ4xsIrvXP1YPfJsC0xYiGMu6ddoVRg8VU2F?=
 =?us-ascii?Q?iDC289dGDNiAZep9a6mshDx4PrQpSi+k1eMCAI7tjSfzrGjUoMLAukU8UW1B?=
 =?us-ascii?Q?Dp7xegG4GTTumMTubibfDX84Mg0TYkdNOV2ilC4l2ZyUkauDg1pLrPtjIy1j?=
 =?us-ascii?Q?LYm8f4syniSr/cNcM/AYtMuG2vOf7fvEzJeI3W8r+s6r/HMG3jRFHssrwrb5?=
 =?us-ascii?Q?tBBw+c8f07MW8sTA50H6awcxlFLBRQQKwkliF+pizkNQF+7+Jsyb2ns3HU7O?=
 =?us-ascii?Q?ghQAqe8JI8pfUD/paArqtt8ntrMgfmv8yI0kiZgH9EtACet1CJwRvCOuEcrJ?=
 =?us-ascii?Q?VhkmPUParTiih8NVPF9zRnn2Vr9xYodoVBynLPPBBLWwWgmWxSKGJ01/KIBO?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a89326c7-79f6-400d-4c02-08db3d1b0ba4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 19:04:17.4922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Fsj7RFBEhf/JiOBMleRKYqFofidHm2+pDHK2vjqLJnElzPRdlmsKxTU8RkDr/goCKldppdqXp4Vi/hKFovM637+I9C8zBExWcRVaMaP5C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7262
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/8] drm/xe/irq: Cleanup media GT
 interrupt flow
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

On Wed, Apr 12, 2023 at 03:52:41PM -0700, Matt Roper wrote:
>Although platforms like MTL have media exposed as a separate GT, it's
>important to recognize that this second GT is *not* a tile as we see in
>platforms like PVC.  The interrupt registers (including the ones related
>to GT interrupts) reside in the SGunit so there's only a single instance
>on the entire platform; they are not replicated per-GT.  Thus all media
>interrupts are delivered together with the interrupts for the primary
>GT.
>
>v2:
> - Also update reset & postinstall routines to skip media GT.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_irq.c | 79 ++++++++++++++++++++++++++++++-------
> 1 file changed, 65 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 13f9f220bca0..7e78eecba62a 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -232,7 +232,40 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
> 	}
> }
>
>-static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
>+static struct xe_gt *find_media_gt(struct xe_device *xe)
>+{
>+	struct xe_gt *gt;
>+	int id;
>+
>+	for_each_gt(gt, xe, id)
>+		if (xe_gt_is_media_type(gt))
>+			return gt;
>+
>+	drm_WARN_ONCE(&xe->drm, 1, "Cannot find media GT for interrupt handling\n");
>+	return xe_device_get_gt(xe, 0);
>+}
>+
>+static struct xe_gt *pick_engine_gt(struct xe_gt *full_gt,
>+				    enum xe_engine_class class,
>+				    unsigned int instance)
>+{
>+	struct xe_device *xe = gt_to_xe(full_gt);
>+
>+	if (MEDIA_VER(xe) < 13)
>+		return full_gt;
>+
>+	if (class == XE_ENGINE_CLASS_VIDEO_DECODE ||
>+	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
>+		return find_media_gt(xe);
>+
>+	if (class == XE_ENGINE_CLASS_OTHER &&
>+	    instance == OTHER_MEDIA_GUC_INSTANCE)
>+		return find_media_gt(xe);
>+
>+	return full_gt;
>+}
>+
>+static void gt_irq_handler(struct xe_device *xe, struct xe_gt *full_gt,
> 			   u32 master_ctl, long unsigned int *intr_dw,
> 			   u32 *identity)
> {
>@@ -241,27 +274,33 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> 	enum xe_engine_class class;
> 	struct xe_hw_engine *hwe;
>
>+	/*
>+	 * Media GT interrupts are delivered on the primary GT.  This function
>+	 * should never be called on the media GT itself.
>+	 */
>+	drm_WARN_ON_ONCE(&xe->drm, xe_gt_is_media_type(full_gt));
>+
> 	spin_lock(&xe->irq.lock);
>
> 	for (bank = 0; bank < 2; bank++) {
> 		if (!(master_ctl & GT_DW_IRQ(bank)))
> 			continue;
>
>-		if (!xe_gt_is_media_type(gt)) {
>-			intr_dw[bank] =
>-				xe_mmio_read32(gt, GT_INTR_DW(bank).reg);
>-			for_each_set_bit(bit, intr_dw + bank, 32)
>-				identity[bit] = gt_engine_identity(xe, gt,
>-								   bank, bit);
>-			xe_mmio_write32(gt, GT_INTR_DW(bank).reg,
>-					intr_dw[bank]);
>-		}
>+		intr_dw[bank] = xe_mmio_read32(full_gt, GT_INTR_DW(bank).reg);
>+		for_each_set_bit(bit, intr_dw + bank, 32)
>+			identity[bit] = gt_engine_identity(xe, full_gt,
>+							   bank, bit);
>+		xe_mmio_write32(full_gt, GT_INTR_DW(bank).reg, intr_dw[bank]);
>
> 		for_each_set_bit(bit, intr_dw + bank, 32) {
>+			struct xe_gt *gt;
>+
> 			class = INTR_ENGINE_CLASS(identity[bit]);
> 			instance = INTR_ENGINE_INSTANCE(identity[bit]);
> 			intr_vec = INTR_ENGINE_INTR(identity[bit]);
>
>+			gt = pick_engine_gt(full_gt, class, instance);
>+
> 			if (class == XE_ENGINE_CLASS_OTHER) {
> 				gt_other_irq_handler(gt, instance, intr_vec);
> 				continue;
>@@ -369,11 +408,17 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 	}
>
> 	for_each_gt(gt, xe, id) {
>+		/*
>+		 * The media GT isn't a tile, so its interrupts are delivered
>+		 * as part of the primary GT's flow.
>+		 */
>+		if (xe_gt_is_media_type(gt))
>+			continue;

so it seems your classification for GT vs Tile is: does it have
interrupts routed through it? Or... this gt doensn't have local vram =>
it doesn't process the interrupts.

>+
> 		if ((master_tile_ctl & DG1_MSTR_TILE(gt->info.vram_id)) == 0)
> 			continue;

this check actually differentiates it by "does this GT have local vram",
and making the vram_id match the bits in DG1_MSTR_TILE.

I'm actually thinking if the mistake was not making the SAMedia a gt
instead of just attaching its engines to the GT matching its local
vram_id.  It would then also mean we wouldn't have to do the whole dance
in xe_pci.c with main gt, remote gt, media gt.

It may be too late for changing that though and we would also need to
change other places like the mmio handling and GuC. But I'm thinking it
would make to a cleaner code as it seems we are adusting several parts
of the code that we wouldn't really need if we didn't consider it as a
separate gt and just used "a tile is a gt" like it used to be.

IMO a slightly less confusing change in this irq handling would be:

	unsigned long done_tile = 0;

	for_each_gt(gt, xe, id) {
		if (__test_and_set_bit(gt->info.vram_id, &done_tile))
			continue;

because then it's clear: if a gt points to the same tile, as per
xe_pci.c, we don't want to process interrupts again since it was already
done by the previous loop.

>
>-		if (!xe_gt_is_media_type(gt))
>-			master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
>+		master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
>
> 		/*
> 		 * We might be in irq handler just when PCIe DPC is initiated
>@@ -386,8 +431,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 			return IRQ_HANDLED;
> 		}
>
>-		if (!xe_gt_is_media_type(gt))
>-			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
>+		xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
>+
> 		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>
> 		/*
>@@ -473,6 +518,9 @@ static void xe_irq_reset(struct xe_device *xe)
> 	u8 id;
>
> 	for_each_gt(gt, xe, id) {
>+		if (xe_gt_is_media_type(gt))
>+			continue;

ditto


And it also seems to have a wrong layering here as in dg1_irq_reset()
we do:

	if (gt->info.id == 0)
		dg1_intr_disable(gt_to_xe(gt));

that is unrelated to this commit though.

Lucas De Marchi

>+
> 		if (GRAPHICS_VERx100(xe) >= 1210)
> 			dg1_irq_reset(gt);
> 		else
>@@ -486,6 +534,9 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>
>+	if (xe_gt_is_media_type(gt))
>+		return;
>+
> 	if (GRAPHICS_VERx100(xe) >= 1210)
> 		dg1_irq_postinstall(xe, gt);
> 	else
>-- 
>2.39.2
>
