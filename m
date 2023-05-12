Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539FFC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298C710E22A;
	Fri, 12 May 2023 18:03:45 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDA010E23B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914622; x=1715450622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=g4gSAppomOhCTa+9s3EqJhY4Fv0iZg1G/mdHUBFPRAc=;
 b=NW7EGaKBx6WBlej8/8dqxs6Eq7hoGmFO72tIY5efV0r3kZeUt3wcndyT
 mvA0pJ3qON9wSKmZUcBL3bqcw55Gq1Ubxkv3k6IOcUoPv7WLrnrU5ihQo
 bfUIHWzaPQZX8NzxNDYttJZupQGqoSf4CgP00QPyzooEEgs1Sgv3nmD7n
 RaXw3WUhgP4ZMr3+vsiztCp0tbHLZEkrATZeQUCmVVr8TxM+LtpdSxMsN
 9ZNcZHoc1xFq4V3fN26yILMv1wEpdAJXDusEI28O4PDerjHpalpbvNpdG
 j3TdrjGlI6nS5AQiqd21Le5/L4Ra93q4w4hQ5OZ6Vh5XGPyJuQpNlANec w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331219485"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="331219485"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769887786"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="769887786"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 12 May 2023 11:03:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:03:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTd6ujs39kIzEU+cXF7ucuGV3QCvjhIfZamiSff/at26iR+PJR0lgFkuEPeXtf7TbtMkwjj7r8RVzekLNlRQxqNWE7eQzXNq9eXDAhQ8d3tuq67EM92YEkER0cVaiLaGQI+L7Js+fZ9NgYUuV9epBWQNWCGvxEdheKSHQK96nN0vRpJjpt2fBv6S86qCG2dwTnyJza7OPZO6HTw8nf6gIZLuu+vBGKFaZOJq00tjaWv8ZmwmJz6nOEEivCKcItWNwvIbwnjI3z1FquaR9gAZB/vxUR32zqDhj+UOWellaHw5D+wy8BLw/ih5mcry/yayo3UbF7KoiK+LEOo5qKZhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVRITewhD7KMR1XML6Oblg3kZz6wV3DOJ+CbV/oBUak=;
 b=fMRmqDBpnQJ+pzMhUarDHo2rXa1q1X9IIIMwp9l85c9icIe+gQnOpx/3Km/4p81+HautBrzEHzcEkZCKwVfdY15tJEtdwkZinRK6+vxOWAJTdaksKZegn6pxzwdIZp25vPx+ROC7OQnaQQ5fA5G26n9q9f7KScGi6IBSZM+fmg0tfbt0WkvZbwXHf8FqLvCNKQlcrnoVu9dDsgVHWkG6FEdO7NM/FN6VdyKu83nyYb31P3HTRSnaCCDGcGJGPdEGcltPOE/LR+mmNFKt7W9eFBNuEGUihWzriFE/JKWuy3yZZDsEmN9nl0VZCgVSc2il4oXmTqZPzt7KdcR72WBIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 18:03:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:03:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 12 May 2023 14:03:07 -0400
Message-ID: <20230512180313.1765011-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3c23eb-f2fd-44f2-b98e-08db53132e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KKrQd+hlvi5AVsLmvsMHNTHtfLcu4ho3ux7NCpq9KQ2ARuHY/enZPy/2FzA5nPH8S2ZSt6V4CmvCX+NJIuonFsfof9GeptFxeYyIR1/rBzgLkp4DxhoSlytpGbNlLfldL197Hrq9xqHR9HKvkxUc6qG8a9Dim1h6r1FdAXZkzmrndv2jXp6GQ0Rf/UzGzmmrd3kkPtapXs0Gd8ZZUPOhVWexMsA8qhnvfdG4VVHT5QzhB3MIR/vOqzplBcek2LFiCl4eRul2Sfa1+L07MfcAZRMnhRGKt9RDBtlFO8+xjsGW2NXJdRxfgYNlQUwT0Ttjp31V/5U/7YvVojdpGoTMn5dhDKZsAkHB/X58T6yZFtLYDdEabwGVFyei/Gu/Scd78dKEGN7E5oDaaei9yjucdBWOGe7oP1EFz8j+va4VAi6mAUQvb6eWB4orCOeTRzGiXZj7SlB5ENAo2iR/Rmny0GOlCl6tpdHS77ljErxY5CHvcFVsa8zvMX+f80vuQ3R+BKGbyoyIj4deVMdR+BnO5twly3MXvQt5rRGBPAceeIYzSM64VtDfAJrr3012N6eW3xLhxazseXd8dYGtpynVSyKf7tIKygVDWB+eC9LLBQa0smkyw0alPgG8KIhwqPZ7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6486002)(316002)(6666004)(41300700001)(36756003)(478600001)(86362001)(66556008)(6916009)(66946007)(66476007)(6512007)(1076003)(6506007)(186003)(26005)(2616005)(83380400001)(4326008)(38100700002)(82960400001)(5660300002)(8676002)(44832011)(8936002)(2906002)(107886003)(192303002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7dm3j2A+RxOhyYxNHTSI6h5NlBqsdg0T3R/G/1FW5M09ky7aTp1Kr/oQB3mB?=
 =?us-ascii?Q?3eXbG4q+v+I4vC5QVhurz/ychvXf7LvAAgh5Yd5h8wlXSLfeChntovz1JV/Z?=
 =?us-ascii?Q?Y5f0b+6rgxZy1o48bl7K2e1qXR5VMne8JaeylH1IJwsBLqFvTMxzbLUVoaQe?=
 =?us-ascii?Q?bzigs1O4/C90jnELj31LcDNpTVGli9eAjbCCD/FNohePzG2jnAti28oHujEC?=
 =?us-ascii?Q?ycoUk3oEURQDkTgOqXy6MRLNJuXgC2+lTq5AbGINZsO8Sq6+DyawVTMoZE1O?=
 =?us-ascii?Q?Gxft/hmckKn9YAIrEu8kb8dXqkH6a+gejz6ZHL9mSdHPpFLyCR5MyaZ0HF0T?=
 =?us-ascii?Q?QJrJr/GApTCYU8CNP8cBeE+36JNUVcLG7tyhVTR9ZekQqKp+gnjoKj5yR9Am?=
 =?us-ascii?Q?vbpO7so8xADR20/LFMlov0ztpyZ8vrXtfwH/Yn8xHDvtuzPsM0YnkbA8xBDe?=
 =?us-ascii?Q?uQiXO6GB/oj08sJHWO8IDTK8Tq4kndI6Z6ruEKDJYjuLVO6SdDUxvMx+ujD5?=
 =?us-ascii?Q?hbTe4D74Wy0ebNnBPi/gFafzb+8O3Z7qWr+6eMjRCaT0RnedhVaQJPpcHud6?=
 =?us-ascii?Q?oUEu6nJlU1GBYpdtpBstrcAcfacYsIKOlrAKJ43nU9I/+ugCZfdSx113XI5W?=
 =?us-ascii?Q?+1h6QL0YU+btuH6yKt6wkQQo3r6lp3HO4zf9S4FBsp/ws+UxM5aXQ86U6fT7?=
 =?us-ascii?Q?7ybBFUv8ve5InxkJj9bntwwxpZPYS5Md4oATyykV1HMbH1GnUCnDWO/yep2N?=
 =?us-ascii?Q?TlfZdOwWj5Eo+EW5g+ErfmSykUIJDDnxiubbAPcrRcOyPTtLvr/e0hezguK1?=
 =?us-ascii?Q?/Cujcb+HBmv9hlFCZKq9ygE6sWxWuR40mNjWamQ2hi4Y5/r+oZUQuLV7RIDD?=
 =?us-ascii?Q?55thL/PmtQLx/E7dAcKPf0F+PymDpz5nF8nQGi4U6mbQaTx2Mk80A/ikqHKq?=
 =?us-ascii?Q?I7O0+GZgF/z/O+85Ad5GwCk9pjIFSHq+FtnfiEf09x7d856Jqc7nzHPvM0SY?=
 =?us-ascii?Q?RwtgFsdxFuCTkXJar4SJ10a//XJwRKvqb4xf65E5Gnj/Wzi7SDMDiAFALCfl?=
 =?us-ascii?Q?HgtHeL5fnGooiE13ktQ/Ydjn8JQFEFnP7JBHyMfo0IgAH/9koL054IBPluUr?=
 =?us-ascii?Q?Xp3MvC1h+SVHM/piOMloE+ZyaOs/MpNyOOWovzTfQIS11kkSAkKh5ztFwisq?=
 =?us-ascii?Q?mDuHaozIWaKUD8QcuWQx5qFTs4nVbFyNr0pCfZYtm/4kWmgenGmF07cQ+7rN?=
 =?us-ascii?Q?UPCr+iG3ahtYU1RZqbkYWoWjmjtjLTzGzW6XnZmUV6/9DspEHaUggWjJnTE8?=
 =?us-ascii?Q?XaYys8C7aBArhhrbdej6MmSvZFQmfPK0U/5hW/O3IFluQdcv6JOEEC58rnwH?=
 =?us-ascii?Q?G2x/yoi/moXz+rjZp6p1fN3iYeAtAf2V6qtPBeKS30lBN41Y7eEqmb1piAVF?=
 =?us-ascii?Q?218qm1EwxwmDe9RevQtFSvoQKZghx2MZ2Kqo5oMjKi3PiRM8uw1A3Z5yy6mU?=
 =?us-ascii?Q?uc1F3+KQEaKnX/2KWYQfulYVP9Sga18JPbbh6T1UCcq9WsLZ9mqDtuUFvgNi?=
 =?us-ascii?Q?txprWmRXlfhW8/UZez419qtFCdf61R4GvLE/PEaK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3c23eb-f2fd-44f2-b98e-08db53132e72
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:03:25.6436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hv3M1MdSpwKGgBA9GqpJA54oaxHw+U3jjGIiCgauKoLEqiDRko0t/7Em8ykS75eRrjKm5vgYNOTo7W5cmrzVGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 1/7] DUMMY Revert "drm/xe/display: Dont call
 intel_display_power_is_enabled from irq install/remove"
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

just to get the needed fixup on top.
should be removed on the next clean-up rebase.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 50 ++++++++++++++++++-----
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index afde97b6faa6..2317e60cc682 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -1007,20 +1007,34 @@ void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
 	enum pipe pipe;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
-	enum transcoder trans;
 
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
 	intel_uncore_write(&dev_priv->uncore, GEN11_DISPLAY_INT_CTL, 0);
 
-	for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
-		intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IMR(trans), 0xffffffff);
-		intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IIR(trans), 0xffffffff);
+	if (DISPLAY_VER(dev_priv) >= 12) {
+		enum transcoder trans;
+
+		for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
+			enum intel_display_power_domain domain;
+
+			domain = POWER_DOMAIN_TRANSCODER(trans);
+			if (!intel_display_power_is_enabled(dev_priv, domain))
+				continue;
+
+			intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IMR(trans), 0xffffffff);
+			intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IIR(trans), 0xffffffff);
+		}
+	} else {
+		intel_uncore_write(dev_priv, EDP_PSR_IMR, 0xffffffff);
+		intel_uncore_write(dev_priv, EDP_PSR_IIR, 0xffffffff);
 	}
 
 	for_each_pipe(dev_priv, pipe)
-		GEN8_IRQ_RESET_NDX(dev_priv, DE_PIPE, pipe);
+		if (intel_display_power_is_enabled(dev_priv,
+						   POWER_DOMAIN_PIPE(pipe)))
+			GEN8_IRQ_RESET_NDX(dev_priv, DE_PIPE, pipe);
 
 	GEN3_IRQ_RESET(dev_priv, GEN8_DE_PORT_);
 	GEN3_IRQ_RESET(dev_priv, GEN8_DE_MISC_);
@@ -1280,7 +1294,6 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	u32 de_misc_masked = GEN8_DE_EDP_PSR;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
-	enum transcoder trans;
 	enum pipe pipe;
 
 	if (!HAS_DISPLAY(dev_priv))
@@ -1310,15 +1323,30 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	else if (IS_BROADWELL(dev_priv))
 		de_port_enables |= BDW_DE_PORT_HOTPLUG_MASK;
 
-	for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask)
-		gen3_assert_iir_is_zero(dev_priv, TRANS_PSR_IIR(trans));
+	if (DISPLAY_VER(dev_priv) >= 12) {
+		enum transcoder trans;
+
+		for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
+			enum intel_display_power_domain domain;
+
+			domain = POWER_DOMAIN_TRANSCODER(trans);
+			if (!intel_display_power_is_enabled(dev_priv, domain))
+				continue;
+
+			gen3_assert_iir_is_zero(dev_priv, TRANS_PSR_IIR(trans));
+		}
+	} else {
+		gen3_assert_iir_is_zero(dev_priv, EDP_PSR_IIR);
+	}
 
 	for_each_pipe(dev_priv, pipe) {
 		dev_priv->de_irq_mask[pipe] = ~de_pipe_masked;
 
-		GEN8_IRQ_INIT_NDX(dev_priv, DE_PIPE, pipe,
-				  dev_priv->de_irq_mask[pipe],
-				  de_pipe_enables);
+		if (intel_display_power_is_enabled(dev_priv,
+				POWER_DOMAIN_PIPE(pipe)))
+			GEN8_IRQ_INIT_NDX(dev_priv, DE_PIPE, pipe,
+					  dev_priv->de_irq_mask[pipe],
+					  de_pipe_enables);
 	}
 
 	GEN3_IRQ_INIT(dev_priv, GEN8_DE_PORT_, ~de_port_masked, de_port_enables);
-- 
2.39.2

