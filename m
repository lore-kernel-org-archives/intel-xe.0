Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EB3C636D6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 17:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4B010E1D8;
	Fri, 17 Feb 2023 17:16:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C0710E1D8
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676654179; x=1708190179;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=d4N+ORIqAkLbs15RuKL8xFvAP59DUMTSDD2XbYwHG/4=;
 b=ZJS3gqJrkQN6GSkh/R0LQ56uCZUTivmNBpVoud9NjsMNv6T0wmQchToj
 d9H6glu0C2jRxxKmVGuNyMEjfIxhw7BLm1VH/hu651Dx4lvbqv3sBDY7v
 FNGTu4VCEqxfIqeBi5SpI7a6IWkSJVfsv0ISViZsOlJQNmKg39+7tqfu1
 /5nn7E2N7vTt9cYF/I6x+S5FbcOqxu/RMyigZT/w1v5pYmiwk04JbcE2I
 anfVt1ScH6yEHEpY1DiuVasdw+UHml37fDn5mM+a+Zt0eMJtdqRB0QVLF
 XAN6dIGswKz7EQcYDJmyagiKiGvBbi52YGvBIMA38tZyu1OZCxPuejt7c g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="359487596"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="359487596"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 09:16:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="700966359"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="700966359"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 17 Feb 2023 09:16:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 09:16:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 09:16:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 09:16:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqAODDIc9TwKNOgL9aZ5CjIdhuPan+Hu9D1f3PH9jT/TBFzjFDCPnG3Z+nXdfovBW0iKMAapsBXMtqVYL8nGH95SJIv0L85Ba0x+h4Mbh5z5xO8Z1Bsjmj28Q9wIRhnOSNUDSUjlfU+wfuwAeAmzdun3DnByKSTOvriLsi76fXRqZ2r6gxKwI3QR56moqtzTFjxtjkGT41hDSfJqtK51q3HH8SHLlRhSiXYLUE5V1bxr4CjE0l9Nybi/1vfYtb6jP8kDel1bt2yvJhlHy6hvF7no7eDM8ajtFia60Fld+wIdbV/jg1I79JwcLfeVzGF0E/Dle+wNVNwDbqtJvTi6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3GcRSWQtee9h5nvdYGOThExGVthNERTqCFXNUSxe44=;
 b=e/nyVRuMvwjVqhVpfMKETT9Znwa7/ctQoOttI6VeMqFzpN0PPfrlc9CkpZ8HSfkIItaOfVOFvzkN62k5wp49MEy/UdHKd4pFkvN/nHKmQ1YGt0uPal3wwwFfDldyhJ8NKFNXUgBu7HI+d1LTgjXHjuI7ir4+XaBFNj7PKlSeJ0IUyvmJADOiMwBm6msrkIDfg8jrAb3oQSA+DsIZI2Igc6vLHeOiBt1Efhl4ffI6uwvRyv43OXKMbxum7BMjL8gqbD9/Fe22+03j7puarcqNBpx77fo+YTZA0eTixFZfhCNF6gOg4pmHXJ6bX7CsBT9W7yG0hR2VQ4qBMKT7i1h6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 17:16:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 17:16:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 17 Feb 2023 12:15:35 -0500
Message-ID: <20230217171535.65749-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3bbb50-08a4-426e-ea2b-08db110aaa02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5hvLPp6s7k8grMHv/lgwhyker3L9dIFVgalVaAqJZO5FfR9BwGubYeGHOc5eFZKnhBtQBY8zw3RcFLq3hkPB03ggnbuuUq+3uOkrrEmqgt6w6hJIUrXN5i2VuS4qcEMSY5sLkr8+u0piZND/Z381J+CJHHWAwHo44wjfbQRb60HRlGUIbCBnMeR6wdrwS+ryUx3+HTq9xLkLDi92jqVZLH/z7L0YdWkk+yL5Ub5qSXTWTUaedvrMz19FBOKjiv1++p13ZdJ0QDaVndQ8kuSFts8P7/FtISlWqTk/Yl1GLqnyiZgSJvsE1YEnvCgu3HwrdzJTGOQZaTRjkES1qYT7xsrs23OTjD9Wf496egjXkP8aLVX9+rDB8oaa1mfmn1PrwJl9UQ/BcMDJdzv4a4spMxEs8GUEB6kKeAHHQp879m7jtj/WwurhaKdaoGEF9C9ONqLSTantccnCWZUoONgdgcuPgIruSbTsDA/y+blHUXqqcpwCpwNM2dM4UFmnCnQ6AkarCZI7h1uIJ+2NuuUPRIDdFm6gwlvGIhZXbDnH3OkV05amdN/YF1bYeuZsVVStDh3XlPN8cn7qOX9GD0lKBOdS9CT9nKCs/dYm9oQWOigwmqDtLpGEH53VG69OcBpm8ISzirH+h07kfKB5+Mbdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199018)(6506007)(6512007)(1076003)(186003)(26005)(36756003)(6666004)(107886003)(66476007)(4326008)(66946007)(83380400001)(8676002)(6916009)(66556008)(316002)(86362001)(41300700001)(6486002)(5660300002)(478600001)(54906003)(2906002)(8936002)(82960400001)(38100700002)(44832011)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G1JprjG4bZdQ/RBXYlUKAuipNzkf5wev/brRt6oFo/TjzeBbXZZlPUa+goPc?=
 =?us-ascii?Q?loMyh5nDgOgP1Onto6WHsrs1+8D5gyrZESnb68Fe90pu3uKMNt21ClQKynz3?=
 =?us-ascii?Q?JZWHKCILs+44hgRJAn0akZVNFMPwVzsmEM9uhwh9RFUy0LlzXvq6c5dhSw09?=
 =?us-ascii?Q?gS1E5Vg20PjKuhPcotkKySxmxPkRNGBuMXZY2bZiJMInrECZvotDqSYp4pgR?=
 =?us-ascii?Q?K8b5B0AmEDiZnDmWbzdVmw7kGNIfqu4bpa9CuPj09LL05r8MiFgccFcPKX0g?=
 =?us-ascii?Q?elrLYy3to7UY66YleR7ps57/HtOpELd3BDx4DbNwXzutPMBABG8vrpp7PP5k?=
 =?us-ascii?Q?0aGW2DUhvPWTzXYma6vZ9yv2Wydy8NDYnbEQzzcJ4yS5vTEu8s02nmbAoGxA?=
 =?us-ascii?Q?6qLryK2zcaaiWAW/Bu8znzF60pzyvhpPcif5CgTOoPGldo967oCnAE6NdGGZ?=
 =?us-ascii?Q?m/H6NPor5U4GnOSbmaIfY8rFscjCpnVzik1covaVVhZ5klUuKbkxIEPSx09y?=
 =?us-ascii?Q?yhQ1N/90+yo7qGJNOEhVolLiRL1lELSzhdU6Ky9D1zktFBSWqRPJl9yKFWQO?=
 =?us-ascii?Q?nqQfcYo4fE5BWUWF9iq7WsXhbXwGfQaEfjk3Ptv/GHPh0xQIxiIcAQmjSyXT?=
 =?us-ascii?Q?z0CFxp2INY5h3b42D0UlUMo+mOKsw4L/RtjaEmDUgsJEf4ZTrV/Ms8BKd8Hx?=
 =?us-ascii?Q?ryibrwGq7Lr2qbjv9MaegApdNFgCRJTMUaHbajYcwO++6QHZ8Wioj/1lsvJO?=
 =?us-ascii?Q?zs3l+4/NnhmOWP6Pku+uOtPC9noAY/qFAnugiNVuaLJl4GW2l5pliGsH5xG9?=
 =?us-ascii?Q?AF7ThnMlyzUG02GKM04VM+3Mhno7lCOQqfRCBakBY61ZMB9WIh9zMB/w2mg6?=
 =?us-ascii?Q?1Gt7vnXO1lWRlvxpGs4qs0F6zScbcv1IxzHyhUfcONXbhNwQJHJf7Ba5Fwei?=
 =?us-ascii?Q?EyoiQ5GxPVEkps+PgsaA0C6uTM3rvhV/CJmVEss+8SCGT1CsSoY9o05VsAGR?=
 =?us-ascii?Q?wAMkCPVZX68a1FHi3UYpfpbwt81T2zRJv1OcYqPIcwk99prhwhNUek9NuOZx?=
 =?us-ascii?Q?9+mbgCV8orSCkz3lPCMMFr/y9PuhLrWPNuUs8haY4wng+DXXIdFvzSvzdJy4?=
 =?us-ascii?Q?0g6WAJ7/dxPG6ZEYJPRYp5R0dCxL5jc6DTYVZQnHKuODg6txlPOkMkgm08mY?=
 =?us-ascii?Q?gdNG5b2JPjFusOGshauUnSL2FI7QuKSvvVmVxuvu8tpg8h1dmvRBM8Sl6H0L?=
 =?us-ascii?Q?O85QoedR7lEqKl7LtcksZT94SPyJb9k59uIUTjFn/JBEcJpnPQxVgTH5v8ne?=
 =?us-ascii?Q?VX0P8YJ/9Cz+4i1QjA/CDDUIL7/8x4aWBpp3YYrYxDruIm7Oi2HzVHXVft7f?=
 =?us-ascii?Q?xdKjDXf2JskT2JFZMTPvVMpggzzn1cPjYzBE4qqmtKMF2Q0OHfmTsWt2Ue84?=
 =?us-ascii?Q?xAn27bxymyQ7Bio+tQqobq5N/iyx2bwWDKLRtLcBYFpdKWgTXBRj8YgUjUHy?=
 =?us-ascii?Q?CBcrD1mfPykSrAxSvPYBdg2I2JyY3yprwnUsrvRiOPtCafixJILNzTGP9LkG?=
 =?us-ascii?Q?j25ydbHzQ1Y3OqfZTuatJ1MWMs6FWGIpCQWDxNfBjuBf3lGvwCWlLp7t/bQ1?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3bbb50-08a4-426e-ea2b-08db110aaa02
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 17:16:10.5700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dj/kltYNIiq6sBH9QSVRsIFAe4ixgvYhFRVi77BFhjYVbgfc2SXqtMjOM9kSNZ8DD6GQ+M6DYodV6BJ6Of+wwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Remove unseless xe_force_wake_prune.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

(!(gt->info.engine_mask & BIT(i))) cases are already
handled in the init function. And these masks are not
modified between the init and the prune.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 15 ---------------
 drivers/gpu/drm/xe/xe_force_wake.h |  2 --
 drivers/gpu/drm/xe/xe_gt.c         |  2 --
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index d2080e6fbe10..5bd87118ac73 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -100,21 +100,6 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	}
 }
 
-void xe_force_wake_prune(struct xe_gt *gt, struct xe_force_wake *fw)
-{
-	int i, j;
-
-	/* Call after fuses have been read, prune domains that are fused off */
-
-	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j)
-		if (!(gt->info.engine_mask & BIT(i)))
-			fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j].reg_ctl = 0;
-
-	for (i = XE_HW_ENGINE_VECS0, j =0; i <= XE_HW_ENGINE_VECS3; ++i, ++j)
-		if (!(gt->info.engine_mask & BIT(i)))
-			fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j].reg_ctl = 0;
-}
-
 static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 {
 	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | domain->val);
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 5adb8daa3b71..7c534cdd5fe9 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,6 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-void xe_force_wake_prune(struct  xe_gt *gt,
-			 struct xe_force_wake *fw);
 int xe_force_wake_get(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 20dbc08d3685..c17279653561 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -602,8 +602,6 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	xe_force_wake_prune(gt, gt_to_fw(gt));
-
 	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 	if (err)
 		return err;
-- 
2.39.1

