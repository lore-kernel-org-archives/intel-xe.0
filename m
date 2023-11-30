Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE05C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 22:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E2D10E059;
	Thu, 30 Nov 2023 22:56:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D555D10E059
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701384987; x=1732920987;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qRK3v7bmeaLoiQRp6jtiNBxqi7Nu1fcwkPOcSSlKJ4o=;
 b=ZPbvcS3HuuXmCHPn/qtC1BtDmeW0DkamIiP0JSJ2Xpprmo6DqU/8FBfG
 bziW3RfXlI1bWGvNIiKCVjOy+39r/h7nECEkRzTCd4qz2ut6G4cXteYkG
 zSXYX/uoBEVj+uGsfuV7B8vL6cpbSiPegN/Pth2O2EORZIvH7Fj9PpO5R
 nXrqYI6UvWQ5Ji4HVMmDniN/uIZyYYpRdyWDK5Hgl4qyMrnmAVOm/+GoB
 xsSC7cjjo3ss/5wXxVt3tcQiYV46/gKVyr4EwWEw3iHe9WUqaqJoQjWdt
 nFTrhR/K9mORdpewqAGRRQTcteH5yG8vUmNA9LbygPTFxiHySt/MEFvme g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="397294218"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="397294218"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 14:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="860360144"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="860360144"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 14:56:26 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 14:56:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 14:56:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 14:56:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 14:56:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EV0iHq4WiRKeeB+Q9n2eIiihzE8K/jNqV2ZkEJ08kUJ5CMQMq6sorF/ofBJavg2QGI3vp+2PIpobj8a9DjwF/exYNUDdy/bSwEOPCelL9owq1RUJY/mAm1kO+MsjsIdD3SWEo15x0AAVhWxbKMn9UTCiSfvVUhNAA1cKvfAaz8X+X0kxompl3JI2X0JkJZROYSd04XfuCUglvf/fQ8HlOcPEpduPe0+HkfaVXWIwDaWfnipf9S8IuAnncUZtbXApNYfFr5SeDuEIRvYdbGFVSTxYYO4zawHVpYFlmScgOrw/ylDDtq0q7Ts/0bCV5iyIY/l+0AOSBvNrCPSviM2Dbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWR7rH1VBjByD+KmlErsfuHQtDHdV/fRzJkCaQOrRC4=;
 b=CgdmI7bGuXxKr1RnrHVIrYV1f28SzSPgLwtoTAy2fjatj2OvozEgE6mGkJ0nqmzliuu9c/vFSaCxe4RchThHeuvVvEr1jF/M1i1Yo+W0BKMVlYuvByNjrtgo0ZpnM0mBvDzzx+YCdgILvV3+Kr4uKG7Y0E1PYTLqOa6Ya9IvVTn/BsKgdqR+aFCKmv3Fmmf8aa27oLoqnvJHJ335N9tnSbKPQiMUhM4cjhWM0QpQ6W/xuldpQMraNL3rbDyCHbzMmEtbj+wKERbKPzmYcKiePu6QZIEmETNoE6HrNoLBE5r6GTcBgPfOCRetIs1FDaH7IpdzwlaS00xj2AiNGyA/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Thu, 30 Nov
 2023 22:56:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 22:56:18 +0000
Date: Thu, 30 Nov 2023 14:56:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231130225615.GC1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231115143838.2081-1-michal.wajdeczko@intel.com>
 <20231115143838.2081-2-michal.wajdeczko@intel.com>
 <lkmhdvb53r2uks2ikjzx7f4ajeest25kjzz6ozpqy5llhrjeyv@57xn7aoxwzfm>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lkmhdvb53r2uks2ikjzx7f4ajeest25kjzz6ozpqy5llhrjeyv@57xn7aoxwzfm>
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: da77850a-522e-46dc-10d3-08dbf1f79012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lgp7OfpyuZXT8noTJjmA8C+4Id0XG8oJKfI0uO98Z72fc8B6a/kWiSkfhhi45rEWNCdLzPmX02XPIs3Syp3BKq4A5LEfOcBPrvnSOi+T42nZe3PWtoCxIHaY+1NpEqEKExNEP0LQu30Q60UYuwdCiJNZlgsMu7O+TEhETIn/up4Rr85Qo1+h41kxloCAgx8OOApyr1l/pw6NLTbFzpWBjjIUoTISAIuPifBDDf/YMa1A2MhK8IE2QzBrDIfyhI0K4SGTErYRgGF1DVV7P6WaFpdw3fgC8nvajFsYNONR7qhEobmguaaXl4qZcbTyk5E91YqxXEzCtB9FOq2SIrInOlDcob8+f4PoSz7zmlprNEcOntZZXEeyR7YMUt7ieYX8wAz6F0m59I3248mREgD6zjW7+nYXwUT1//WNN564JNe8lEcuJdlZq+HH7skZJOKPyAkA9LQuwLvK7eEVQEUoaXV/hALlnl/xhdqKXKGXlN/zj+yk8Bpwyr/5GnXyDeyawQvdVj8X5guey+d1j5ZRQRJGBzGWSRvjLcO++ae+ID+yHcn8/ubKo8PDZPXmLu2e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(41300700001)(26005)(33656002)(1076003)(86362001)(83380400001)(2906002)(5660300002)(82960400001)(66476007)(6512007)(6862004)(478600001)(6506007)(8936002)(6666004)(8676002)(4326008)(316002)(66946007)(6636002)(66556008)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ggx5pjKugWphJ3MHGxdYxSt9Tan8BpOJN3ef/j0uVAniq9qLIf8I2EhrO8s7?=
 =?us-ascii?Q?u3188lUflBgQ1wwp5lG4Wmz583z+tU+2Lkzy1vf9iGSNI1eliQOO6nieo9ep?=
 =?us-ascii?Q?R5JrKgdRu9r9ULN6CILTC/qtuiPdqh8ckpgvXUce7Qj5SscisNJPLn/ZLUDg?=
 =?us-ascii?Q?s//eU3xENHnIbWx7jC9LDuEv2K2Z7/u1QXQKrYDWIJ5EgXYRWjKp3zROlE2A?=
 =?us-ascii?Q?g1xuS1iiF+qz8Lqm/I/CGF9/sQRk43rrrNUKs0bcUx0wvKmlPZFk2uOBMHd/?=
 =?us-ascii?Q?g4qaO+aZH2UIW84YOo4pAea2/xyApL2stSvpaLvo34pKSIetObdL/863mkR9?=
 =?us-ascii?Q?reLWsh9SA7qFVhAKVe1QRKCCcBF4ohj+VJ+Jc005OFKiqQ8iE+ZcNkNGOOl3?=
 =?us-ascii?Q?OW0acOoc5MifqMBuWpgfBmEhHy5b3C/lPaK2lGb3qf8jjgH913vcfJCwtVVb?=
 =?us-ascii?Q?tUJr+e/GJA87lO5iLNxoIzB8ulB4LkhTq2sXNCLR5PXwqaR7ka9tJqbVjUCU?=
 =?us-ascii?Q?/+riEcENgEXSrjSloodHKVkT+/W0jkDyqL9d7GpwCtiY8x7D+BQc5PEDrOjU?=
 =?us-ascii?Q?n+ufq5+oTruZFpSVlltcHUvuGqQQXoWShBTX5ihKaQSNmbRQY5fucyvo2BXU?=
 =?us-ascii?Q?wwpvJaxRTQj1yMSHpZNpy4hY5jJkDmjwod5izipMTyL1L81RNPuYrlcx2A2Y?=
 =?us-ascii?Q?5S0NkxPWhr14naLoXAZ69SmBr6AnK8hhlBlLyhqJspcCukbm1Nu3PKhrhTJs?=
 =?us-ascii?Q?Vi6dVfSof5IUr+X0SEBVqwlyTadthDXU7WgPWu1jss+9rMttpqSVQXRi/Mfl?=
 =?us-ascii?Q?BG+tMYX+vw1ojPt/reYVVqTHwAZKaqVBlB6tFqVw+K7C/AnaQd8fwLENcM0p?=
 =?us-ascii?Q?nqmt0k/x9/c6S23ZAa6l8tDWa2P8PAyXwvbkT9Jy/eGZbKZa7Sdvj2exWZc4?=
 =?us-ascii?Q?Ylila0ZUY/VtlhKf/nujhpzanpW1ev4mWx9huKXoYjf6V7zdU80g0ryOFZU2?=
 =?us-ascii?Q?om+EA4Bi3L1+Df3EQbHypiNDbRrxgmRAjgD73cw715mlTx5gFxaYXLu159sn?=
 =?us-ascii?Q?Q7qsEuvGmuyESWbh58qgKOaQWdQQpNxnvdWTyPPSJn705FezNnfdEoJjJ4og?=
 =?us-ascii?Q?wu203PNbpNR63YupnixdHEWnnZ16YsdBn78ZuCh1j7/5n3XUyB/w1oaT1tLn?=
 =?us-ascii?Q?ma9wa8SHSvVinc+ZJQLSkfY6mBjtGQLePZ6/V3kL9c5Sm+9/zqnzWGHdy/qM?=
 =?us-ascii?Q?MWoGtbWGTgjVDDddD6UQqxsI2NtJSzXv1TeyPzmOnLLrdqNvduonRcpQR2EU?=
 =?us-ascii?Q?FX/LptbUCKCGqp0s1/m9E6JpihC1E5CmsAeyvAn8JiS9FXHTT4FMWPOd7Rev?=
 =?us-ascii?Q?dUhQcQV0lII3Zs9TjjMjABiACiXmv/wiFF5VY6VoXzw4x8sB1v5garlbOKz0?=
 =?us-ascii?Q?r1kLuThmCMBJSCyz5Lfk9Haizd8Y+JCAb7lcVfe7bAbUclNDjfW9VjDV0c2c?=
 =?us-ascii?Q?I7Ie61Bf7B3aaOcW33CWNK1iPVBpxjidQ43NsojZriy5rscbV8AGGLNGHiCz?=
 =?us-ascii?Q?iSslXw/NZml09Fvuzub9rPR2BVSVVdYW8bjgN7GaWAivUM8v9LpndxjCgq1c?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da77850a-522e-46dc-10d3-08dbf1f79012
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 22:56:18.0476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CEbnxcg9+EB2T/e2LSvAg0GB03oa0Yyjl5B+Izpgmj0Tga3SHomzhdmPA1UUtk33FRpX8th3LW6c6lQTCz1UCVlpnHrPOqcGimF7a3YNFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Use dedicated function to read
 engine fuse registers
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

On Wed, Nov 29, 2023 at 09:02:51AM -0600, Lucas De Marchi wrote:
> On Wed, Nov 15, 2023 at 03:38:36PM +0100, Michal Wajdeczko wrote:
> > These registers are not directly exposed to VFs, use function that
> > will provide required data also when running as a VF.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_hw_engine.c | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index e831e63c5e48..1cf26c3c15c5 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -496,7 +496,7 @@ static void read_media_fuses(struct xe_gt *gt)
> > 
> > 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > 
> > -	media_fuse = xe_mmio_read32(gt, GT_VEBOX_VDBOX_DISABLE);
> > +	media_fuse = xe_mmio_fuse_read32(gt, GT_VEBOX_VDBOX_DISABLE);
> 
> I'm not sure about this approach as it's not really clear which register
> should or should not use this variant. For someone reading the code it
> will be very confusing. We already have the mcr variant... what if one
> of those registers is also MCR?
> 
> As an alternative, we could annotate the registers on their definition
> like we do for masked registers, and just tread them differently on the
> normal functions when in VF mode. See the first struct inside struct
> xe_reg. On register definition we would pass it as XE_REG_OPTION_XXXXXX
> 
> +Matt Roper
> 
> I'm unsure what's the best approach here without seeing the VF
> implementation. Just want to kickstart a discussion.

I don't think fuse registers are something that would ever be multicast
since they're "higher level" in the hardware design and not down inside
of specific hardware subunits.

I do like the idea of XE_REG_OPTION_XXXXXX since once you mark the
register that way once, any future code that accesses the same register
will automatically do the right thing, even if the person adding new
code isn't aware of the SRIOV-specific details.


Matt

> 
> Lucas De Marchi
> 
> 
> > 
> > 	/*
> > 	 * Pre-Xe_HP platforms had register bits representing absent engines,
> > @@ -541,7 +541,7 @@ static void read_copy_fuses(struct xe_gt *gt)
> > 
> > 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > 
> > -	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
> > +	bcs_mask = xe_mmio_fuse_read32(gt, MIRROR_FUSE3);
> > 	bcs_mask = REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
> > 
> > 	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
> > @@ -588,7 +588,7 @@ static void read_compute_fuses_from_reg(struct xe_gt *gt)
> > 	struct xe_device *xe = gt_to_xe(gt);
> > 	u32 ccs_mask;
> > 
> > -	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
> > +	ccs_mask = xe_mmio_fuse_read32(gt, XEHP_FUSE4);
> > 	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
> > 
> > 	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
> > -- 
> > 2.25.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
