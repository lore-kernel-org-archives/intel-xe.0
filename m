Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B9DC7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D39710E239;
	Fri, 12 May 2023 18:03:59 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD1E10E22A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914637; x=1715450637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IPx0lZmChmXVqK6+Gmf6okTgLClEDN+RFIGWPY3nY30=;
 b=RimHZiaTs0w2QdUUkvYf7+euT0QUDvym20qDPf61XhlFVZxC/y4L8a4m
 rd0LeJcnkKnU8LMqtwPvnUKcW0sJybvMfAl4rPlZSoqGlGGxzgK5U8H4H
 5WvC7NMBsIc+fSI3DpuPZiWs5mZwF9nnDy4UowmQrUmUmTUwjtE61EWO6
 2NdvCTJMAteQZkeTUhE4S9ePwkfbA1Ggwb7KlXc9ySRndDUQ1uCR7+j1h
 +jD/R55hRFcyEyrm9TJBdb4DNZv0dHpP3jQkFP3eW4TUSXGtKxUyd/rAH
 puNVLcXPlwxqjC55u5jxrn88XPtlOq3lKcqBsFxB+lLvv/TAGBxxSnPP2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414227822"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="414227822"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="700262263"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="700262263"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 12 May 2023 11:03:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:03:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:03:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:03:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqcCTV7BT/uoOOZcl5jBBxed7EnWf8IP0E0/HhZiAiCYPIH26ERktbw2JpAL8HEvAEa0WZWcXZXT43/z80+N9soOEv0VFsNcvSb+i2bRDbzcWBqpEJUA1fnTlPpIAwT6TqQZ+C6wezG72NWXZjhuVfa03vDURfNPpTJ97Yc0lJQtiZlM1yiSadghOVAq9WV1BBJK1qq5OVxZcFcHhVhKcOJRq1t5x3jrRJzAznrYUhuCce8TvBLzFJKYywLhqlZ1ToTx9etiTgJBsPQDQx32VNtd3tvCEEDBfAaA+irynoUishFWrWfDzHxvSJI61bqlUDp8ZQthSD4HLkYd9MEIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXnRbBySe1DW7hm1c/v/dUw0CwyQ2EO/Mxr1rCZsYqU=;
 b=KgJXLILbqWCnOkYcxllcZ+Wg3S7lEErsApDS6Q9XT3HHJauzhgCzieW4ionWVBCYIdV8jIYlGLLPWmsuUbzTtv4xkBLbkA4boRUeMTAa9x0dJJTeGyBxgFIS+3JqLz+jQR6lmrmQyURAI+o0jSlSFOMMrSoPeQqI4BeJSatQNLuVrX77u2+IagqpQWfmXb0R+XLDjX7gK6YXQQ0py3XSrHWjf1HXnyTY3i80/ERA2ZR9b1BFfnrSWP9TjWkoZj5Lx6nOU7Mf5CxKc1P+cQE26Gqy99Odsqoilk8wS+qxdbe/8tWu99ZcyZtF/rUxHGp8j5WIbxGymaUGH69VHzbFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8502.namprd11.prod.outlook.com (2603:10b6:510:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 18:03:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:03:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 12 May 2023 14:03:13 -0400
Message-ID: <20230512180313.1765011-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:180::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 54115002-0937-45d7-c2df-08db53133fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +057wrIUc7iiotnbq+R98vnpRPKpLZLJLAFmbF/nh1loxQrtS4pXGmbjDHHY6peYoF31Z7fKA0d87nvwjt0Ezdm+YfQ2A4sVt71ZaOmgwcgbnHA16c3870e3ozewm0Y6xJoxxIcdVJR5i+p/NRoztKZN6O7Uax7bvKr2Hd7WEbAmwkOPPGiwd0Uxm9VmalXUMRFQOA3SQ159NiVppXZ4INc7trxI3OXe1+9TsZuECXNEA1n3YNB4MDrxip13NK5kkQcBBMHFYBx4qfAtqR7LcQyO6/tK8iosfZSTcOFjj++Of1eVFB21yvAzodF3I2TLE7PyrHfOcXkV4Pk6saMI5a6UggPTNX/ag09IjyCbKa8IPgJQlugZmwtXGZo7AdaQe3ibygvRuqw6nSS3/RoOe134HiljiPcFY4wHEj+aGxg2dgczUNzepgjrFq15l3XFnh0tJe9aRswqgg35HPhn2/wGm3ofJ0ubtrJPGHAthunISVpZKPi0vXE2rg5vK4jZv3Ic1iH34v6MqkbNsdC3mFoXJd6APM1Va5p/uwsZ/8TKablJZFa3tXUfFe+l4GN7VKpcOaODBCjRt7rP+4bniv26eWpkfPcs+6NtSsuUN3ZbHMTj+YlXA+wXeR0BInFV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6486002)(54906003)(316002)(6666004)(41300700001)(36756003)(478600001)(86362001)(66556008)(6916009)(66946007)(66476007)(6512007)(1076003)(6506007)(186003)(26005)(2616005)(83380400001)(4326008)(38100700002)(82960400001)(5660300002)(8676002)(44832011)(8936002)(2906002)(192303002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SucqATYcjhMzu5lSzs4SSZGZShzFMf0NZBuU6arhIIsjqi7yZuEuZjwVfLWp?=
 =?us-ascii?Q?Bx3jlUiz7O9QH9JTVNTtJCZ923HfJlAGI/Te2SU8+ToPdU+NsfUMMfahlJ3/?=
 =?us-ascii?Q?uLJYcZxJEUqJG55LGtxHpn2tJ4d5oFtmYtMDNXT6ySjTr7KTaNuMnfiyfFaf?=
 =?us-ascii?Q?J5Gm6zCJgMuqjKqi4yfIuApewDJvL9Ov45AFFJ/gziinunJo8pB7d8xU3Osf?=
 =?us-ascii?Q?271nxM/C+Rw6m4hMur9Rna4UJ8qy/vC9udm/bzab87BQViQQ42m9QKxGbhjZ?=
 =?us-ascii?Q?4G27ElGYQX85CapTw/+Jvbrj9i5Sa+Qix4tDK8f0cX11B6f2ChIO1S8CFtbq?=
 =?us-ascii?Q?+6iZKFdg71XaMybc2BuQVCwmFUla/6WSgE/k6BBXc9u9fivsjRYY5W1m+TTU?=
 =?us-ascii?Q?ig4SenliocYu5/1g9APuNNW9L3EaYV+et73duA+M5Jgu24OWy2LTANvDQ71U?=
 =?us-ascii?Q?JuQEdcYZo0+OPlu6JtXNa1uOD8EprBvpbOMnU0IUey0EvtS1/VDhQ+R2Q2q1?=
 =?us-ascii?Q?US8/fx2HalTj7L6rTQF3uoMxN3AyNx5DFxQAPS24mum47osR9i89Z+2w7siO?=
 =?us-ascii?Q?4YKjeX+n21OmA8YNpec6yhClja0QDs2Gb2/EoHyj28aY0Kz/lUlsF0lshF4Z?=
 =?us-ascii?Q?qlQB/2EiFOHTbhk4ti1BR+k/SlPOqe+GixI/fNdFIEDW+XY8Fj6zkOY/Dzx7?=
 =?us-ascii?Q?2CyTxzfcwr+UhzY7QlYhqnH6CpGTVcmhvNljai5TYBj3nhyTfEVeJsP0xZei?=
 =?us-ascii?Q?DmJxw1aSsql9g+cjxaON/hIzUQM7UEvKUkcTsHgNwc1gQvhn9mPT4tgLUFW/?=
 =?us-ascii?Q?lAy9VrkMilxgFzNFdnt/w6Hqz3dsinBaamM8lyEZltcsms9wwJqC+wBz6bc/?=
 =?us-ascii?Q?/roD6qKdjFEQyd8gI8Xf5dKi4297haw5hVJ/ovZmBLQhAWDxEaWgsGNZ+H/b?=
 =?us-ascii?Q?rCErJE9wzZ2q2f0ytvgA+T24m0EH8k3fuN6H2eASP/fzn5L0F8sWaq6Y0fG9?=
 =?us-ascii?Q?vDCX1UjXM6mXZqTMSHKfThoBcMBE8oJVEXPSsUYs7K8tnQJ25aqvPk41mAJV?=
 =?us-ascii?Q?xbeW88xMVXAPAsr0kF/hGNAKshOYvEIDkDGYnU8YMRRAYSZ2vVGhR7DzKOIs?=
 =?us-ascii?Q?Au+pomHUxb/V9VKzGXUnf68ON6yRDPdbyPn6V/5b7JjunOlcQm5mIKPtTJHO?=
 =?us-ascii?Q?TAU++PZ1E+PR+Ifsqme9BRvGdgJm9c+QDoOf/GFxmoj/Q/1yt1WyUdsrOMDa?=
 =?us-ascii?Q?1rCuJy+Fvl1FLcEk4Zd7wbODvDyq1ncKAI1Lj5AZbm+4BJg2CeSKw7ln0p3d?=
 =?us-ascii?Q?fV/xkCgE9Lbu28uP7sLqTYJkyOmtJs6uEeBd3sm+vz32QO/yefaIocJleU9H?=
 =?us-ascii?Q?tnVVjyFNKvJH064PLgMkdtBKfQVa2lzZaP8Z8G4fN6rQp4zN0/ENjtUITIM9?=
 =?us-ascii?Q?kgiXVn+I5zugh81c7szHt7EQ+6Rp2t7xdFXX0y4hDzvCAtXXf/gPMWZZYCLV?=
 =?us-ascii?Q?5JaAO3OVjrc5yg8QLn1jhgENa4WjDGeVOCwc4IKf1jH4i/9hvztF5vdvfaBG?=
 =?us-ascii?Q?rZrcHorlnAeqQrN9nu5+nRZ0mr3o1oU3YEA6BuhofOVEoFon1LZD+kf7gpIY?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54115002-0937-45d7-c2df-08db53133fa0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:03:54.4456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPeSIIt6GVBIrClrDEp8eED6aZt/pbxtBUi9M/xfLd8cxPu0EoZUdh/ZBCZXsweuX0l96gooUwmXJFjyaCnOVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8502
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 7/7] drm/xe/display: Dont call
 intel_display_power_is_enabled from irq install/remove
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Just assume all power domains are enabled, since we use the INIT domain
when suspending/resuming.

Not taking a mutex inside a spinlock makes suspend/resume work again.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 50 +++++------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index e9dfe3658ca1..afde97b6faa6 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -1007,34 +1007,20 @@ void gen11_display_irq_reset(struct drm_i915_private *dev_priv)
 	enum pipe pipe;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
+	enum transcoder trans;
 
 	if (!HAS_DISPLAY(dev_priv))
 		return;
 
 	intel_uncore_write(&dev_priv->uncore, GEN11_DISPLAY_INT_CTL, 0);
 
-	if (DISPLAY_VER(dev_priv) >= 12) {
-		enum transcoder trans;
-
-		for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
-			enum intel_display_power_domain domain;
-
-			domain = POWER_DOMAIN_TRANSCODER(trans);
-			if (!intel_display_power_is_enabled(dev_priv, domain))
-				continue;
-
-			intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IMR(trans), 0xffffffff);
-			intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IIR(trans), 0xffffffff);
-		}
-	} else {
-		intel_uncore_write(&dev_priv->uncore, EDP_PSR_IMR, 0xffffffff);
-		intel_uncore_write(&dev_priv->uncore, EDP_PSR_IIR, 0xffffffff);
+	for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
+		intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IMR(trans), 0xffffffff);
+		intel_uncore_write(&dev_priv->uncore, TRANS_PSR_IIR(trans), 0xffffffff);
 	}
 
 	for_each_pipe(dev_priv, pipe)
-		if (intel_display_power_is_enabled(dev_priv,
-						   POWER_DOMAIN_PIPE(pipe)))
-			GEN8_IRQ_RESET_NDX(dev_priv, DE_PIPE, pipe);
+		GEN8_IRQ_RESET_NDX(dev_priv, DE_PIPE, pipe);
 
 	GEN3_IRQ_RESET(dev_priv, GEN8_DE_PORT_);
 	GEN3_IRQ_RESET(dev_priv, GEN8_DE_MISC_);
@@ -1294,6 +1280,7 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	u32 de_misc_masked = GEN8_DE_EDP_PSR;
 	u32 trans_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
+	enum transcoder trans;
 	enum pipe pipe;
 
 	if (!HAS_DISPLAY(dev_priv))
@@ -1323,30 +1310,15 @@ static void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
 	else if (IS_BROADWELL(dev_priv))
 		de_port_enables |= BDW_DE_PORT_HOTPLUG_MASK;
 
-	if (DISPLAY_VER(dev_priv) >= 12) {
-		enum transcoder trans;
-
-		for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask) {
-			enum intel_display_power_domain domain;
-
-			domain = POWER_DOMAIN_TRANSCODER(trans);
-			if (!intel_display_power_is_enabled(dev_priv, domain))
-				continue;
-
-			gen3_assert_iir_is_zero(dev_priv, TRANS_PSR_IIR(trans));
-		}
-	} else {
-		gen3_assert_iir_is_zero(dev_priv, EDP_PSR_IIR);
-	}
+	for_each_cpu_transcoder_masked(dev_priv, trans, trans_mask)
+		gen3_assert_iir_is_zero(dev_priv, TRANS_PSR_IIR(trans));
 
 	for_each_pipe(dev_priv, pipe) {
 		dev_priv->de_irq_mask[pipe] = ~de_pipe_masked;
 
-		if (intel_display_power_is_enabled(dev_priv,
-				POWER_DOMAIN_PIPE(pipe)))
-			GEN8_IRQ_INIT_NDX(dev_priv, DE_PIPE, pipe,
-					  dev_priv->de_irq_mask[pipe],
-					  de_pipe_enables);
+		GEN8_IRQ_INIT_NDX(dev_priv, DE_PIPE, pipe,
+				  dev_priv->de_irq_mask[pipe],
+				  de_pipe_enables);
 	}
 
 	GEN3_IRQ_INIT(dev_priv, GEN8_DE_PORT_, ~de_port_masked, de_port_enables);
-- 
2.39.2

