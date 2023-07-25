Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A960EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063F210E39E;
	Tue, 25 Jul 2023 20:18:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B8E10E39E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 20:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690316289; x=1721852289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NTAXE0bY7eCl+CdtlwMKLRTU3nvkQkzlOgSdTrkIfFA=;
 b=UEUQ52qWXPdssjUFJHRUUYzx1V3x6OS2QM3NBuvOhwXD0pvL+/EzA1El
 /7gzU0zH3ogibP5C2EbfZ3faEnN5GmuNVqwInL4hZx7Kf5rW4xWWFWpC3
 zvuukqJfdqIDHPAggeJpiLrbz+EoTcBen6fhDKcD93E5ED/Hqe6jPrGwZ
 uxAqJkBYN+KZcMxp7qfy/eefltakW3NBEHYCXLOjQ5en+5a04Vdw3Vzh4
 lPm6GZCQn8PyVNcpjjeOqDyoKUrnFQsuvyefHKsZhGQOoOk3qkUyBkbhR
 aI802j11l9j81JV/1Paokg+JXkkeyJT5LN5ONqUWmI1qP+ohHEHHbezCm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370508481"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="370508481"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796266529"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="796266529"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2023 13:18:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:18:08 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 13:18:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 13:18:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 13:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iri/CG18BqXXxDTs8aC85B6Ms3j0JCFAgXxx4Chdn5e0hJ0zPoHB9ceOyBjSo5UKWHYa3uMQLGbfDkYdOLuXOUL1hbIH5ydXKnlEWWywc9MoXKwUabwFv+TxaqOTYgOY0uhlUkoFl2QE+RedFaqmVR2ie6BfxQhHBr02Mi0eGs2z4Xsz10OXi+SeQZhzanmRxkz1OSnNDAwnU0Ra/qP4LsZX1BWbDkRLAiEMPT/Jpiu1fUsicnhUm25YKjEcGMZkcKeX/FWXKaGKRymxp1eah60OvjFg6Z14jb+e9sNG9ASQ1S1WWLngqLlFT5XZJ1u4Z3DoRuyAjyktRMJEgbqdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrIks3W7cVSnUH66R4mHkVOReN3roYQd5tyRyOVCM00=;
 b=k9vzS2dlTEZ1ehxZxUy7oDnKYVBUbpFMDNAv6QEOFGcaEGqvEOWCkNJtGLNRUNODukCK60B2jLjdu6AIpA4x4dfrPEF9D+kniaxb6KASj9vvjo2dbzDxFatzDiOL8M8Y2NWBlz0PJYTASJuzwBlCfS1xxuRbvJMCZ0FWMmRGaOyBdz3HtdGoi38fjQWjUQ91Vnoll3/qiO8NfOS6OAaY11HIdoTGXqfFjQeaV7OPc/jD726/WDAKP1vxbeQlVQV7aYp7JsGFkOgA5VL+7Qn9pG6hQKmosb+m6VVWeLodj++MMJYxNtJ9t8hq8C9CMfB//zz0/DwUcoTEdkr8QviNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4531.namprd11.prod.outlook.com (2603:10b6:5:2a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 20:18:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 20:18:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 16:17:58 -0400
Message-ID: <20230725201758.329342-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
References: <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0049.namprd08.prod.outlook.com
 (2603:10b6:a03:117::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4531:EE_
X-MS-Office365-Filtering-Correlation-Id: 38096494-74cf-47c9-c226-08db8d4c4170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qaYSxhqol6ftXqlP4vImu1l/scw6XiueUrxHGTq2sRTHDDJkQZY78QZHjlicw8gOk/7NpTFGLWJlrK2xwVVXR0ovKY0M6V4JZi0SCnphUnGn7cg5tVxl5+AFF8YXoKGHJqG4/35sWiUhcvZFgduTEZtuh7YdnOaoTLzda5tCdaIlDs8hE4krfEP/sMm/weUhE5mV8I46oW3HDthuMy5+M36HAPVB7Pc0OCS0x280q3LoozT2pMWXJ5lpH8QJnP4SSmCWr7mOn9wCXsYq5eibiF3ABovc3TN0zAyJbaBViPehT9gjICYSFTzS/PXU1uvmEGHmR67jTH02CuAvtGuosX5zR1Qji82+PpgSNABoz/4nMgQSsPGZUHWit/Ih+rGoOCLVFss7cUXClllsdsOW+6nNimKRDZAdTm4bFYnrrHALdqkktPfGOekmE/W1kirEBdcBKaeGQF/I1JpBpH/bP/blIs8VCnnsIpTUqXDjsNYqMyscYIGgLocx5AVSYHk3BcYosmkYndQgk5yO43s23xP/HayMZ175SmrUT8nxOc/EHh+yMp2PNRMKPOmCa9/E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(4326008)(6486002)(478600001)(38100700002)(86362001)(6666004)(66556008)(66476007)(82960400001)(54906003)(66946007)(6916009)(6512007)(316002)(41300700001)(83380400001)(2906002)(2616005)(36756003)(107886003)(8676002)(8936002)(186003)(44832011)(6506007)(1076003)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q07oFlqIlOByX9tR3V3m+u3rNsooIV1x0WWZmXTtmAU8uCYWls91ZTnowi6W?=
 =?us-ascii?Q?IryMTSRob7nqKzVXVBZc92RZ3TwZSazruQ1EXMqcOL1hbwvdJBFMILBct9dF?=
 =?us-ascii?Q?0dcdceH8GXkDt77uNnGvvTdQ0rvsv5/7/X1N0Sjopf8mArp7iYO2JQixUVJw?=
 =?us-ascii?Q?SqtZLWtSnOPUqPcz6XC+x86dRK+4qo/j944a5By40A/8V7ic8gUN9RPJsYPL?=
 =?us-ascii?Q?nLDSZCOmC3TjT48I+UtAPrYCOjCMQ2O1i4eTvf2rHJQb3fjhWmYFKpxm45a7?=
 =?us-ascii?Q?mqo2xHdy4NFXw38XOONCad35ixe6Zpq7M8oBNA/z6LYSq5apcbm1dXSolUmX?=
 =?us-ascii?Q?MhdZt7I4bAhcOtJBZn7vn9mF6l8SWRGDUMFUTYB3eIkncWbPiQVOUsYu+AqZ?=
 =?us-ascii?Q?wFoYBqEmgSchXWb/yc/2F3jxEQonnfAo/R/dGHSU/VHUXxt0dcTb9fhM3iDJ?=
 =?us-ascii?Q?gyjI2kqPag99mgedOD7lnjxYVUVwjyQ43UL3Nbx7+5QIdQJlcxsk7X8yJJM8?=
 =?us-ascii?Q?BZx97aWI5KAoyKyNpZxGlkaSUW0vK9nJEHGt4Vzs6VtiXgvMJTIvwG186bN8?=
 =?us-ascii?Q?q17viwWp+IvsDTF5yIA1v4acuBIVJnGAUevZwJVh2cXR1ADGYH5jRCha5RMG?=
 =?us-ascii?Q?1WJjFXTtmaDHWP5ySip+otWMDDEjDBNWbMaObm2FSCa9EWe4BwRjHkrg7jEJ?=
 =?us-ascii?Q?JA2eWS1BbVDD9xWPCwkvd/i+IJZvhNHUtyA+l21dxDYN6sifNnXAO8MX/8a8?=
 =?us-ascii?Q?WW/1PdDC6i4tkysKmzjhGUC3P1sq+DCu+3EYlzO94UfXm/adIaOEQfLWUA1G?=
 =?us-ascii?Q?ZMpfMrtIS20FsHc7xUDJqZrFasSTVj+ziQLD26/uBESaVqMaX4BUqohT9iPW?=
 =?us-ascii?Q?v76slT3zC5KZzsDianybxe07PD6LeoHAft4SdKfbboEQPB6gOHUA84VX5pZG?=
 =?us-ascii?Q?+RKmDuz6cwdkj2mWvNpdikMPQtg2LRCLBpnFJGORHvhvncs5RA5/80hgJ1nb?=
 =?us-ascii?Q?m40TEUszUgaswrL93lw6+C+td7q/7OMXmOxP8iu//5oRmr1Fh+0NJrQORs3Z?=
 =?us-ascii?Q?XJSnXaZ3L5nuh4EFV2CwKjPb1v1/vRWSFmOyzYlnoq3IwL61nennlq8FSJ47?=
 =?us-ascii?Q?uAyk4vGk4RAOELP2kxTyXnT3G7ylFnFeefeQIFge0X9RfkLcTUpHKCqtoa97?=
 =?us-ascii?Q?DXN7ZvgmD4A+LZ/DP6Vl8RGTyZy4LYF+2D/8Vz6vdLn/IplpEQL+Djc6uMJz?=
 =?us-ascii?Q?k8ozNQ85LCA6sWDNsoU4SxfPwyIGkzTLtiEd76c9awV0qdFz90fyJaMmpkzB?=
 =?us-ascii?Q?I9NBCprhTkP7/TJRq4r873INqPfD8suRiPoHxWhtxBTgnjZIUrue6ah7SAxG?=
 =?us-ascii?Q?t9wT1ocSCUFmdYYbSqFN9knbS9KOcJ7Ey0U8jHWUO26srpBnUDwIchstTwCk?=
 =?us-ascii?Q?HcnpxJUZlyhC1FdNeqiN/tMDDY0SVYhfHy7WdRvZB28h4Ubjfq2AGEPQ8EY2?=
 =?us-ascii?Q?XpdDYXDLGMjdTmkY2IOIwVJOk7Yl2JDYPPURQJ8oHBFDTXyUB8Rt4NqvkL54?=
 =?us-ascii?Q?ivX2Ou4rI2oy/LQ7YRjjeugr+t9rqWkUgFXa/EGb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38096494-74cf-47c9-c226-08db8d4c4170
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 20:18:06.1459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dypEV0Q+JEMhQDZ5OlnY3PeZdYYubT+Rx++EmAZAziS3inj3khRULL9R8hGK6qFbG3kbltRF8WGSPA3kr5U6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4531
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context bug
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We cannot have spin locks around xe_irq_reset, since it will
call the intel_display_power_is_enabled() function, and
that needs a mutex lock. Hence causing the undesired
"[ BUG: Invalid wait context ]"

We cannot convert i915's power domain lock to spin lock
due to the nested dependency of non-atomic context waits.

So, let's move the xe_irq_reset functions from the
critical area, while still ensuring that we are protecting
the irq.enabled and ensuring the right serialization
in the irq handlers.

v2: On the first version, I had missed the fact that
irq.enabled is checked on the xe/display glue layer,
and that i915 display code is actually using the irq
spin lock properly. So, this got changed to a version
suggested by Matthew Auld, along with introducing
the lockdep_assert_held at the display glue code.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c |  1 +
 drivers/gpu/drm/xe/xe_irq.c               | 32 ++++++++++++++++++-----
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index fbb0e99143f6..ac435f7f854b 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -107,6 +107,7 @@ void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
 
 bool intel_irqs_enabled(struct xe_device *xe)
 {
+	lockdep_assert_held(&xe->irq.lock);
 	return xe->irq.enabled;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index eae190cb0969..d6b001f6a3c5 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -309,6 +309,13 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 	unsigned long intr_dw[2];
 	u32 identity[32];
 
+	spin_lock_irq(&xe->irq.lock);
+	if (!xe->irq.enabled) {
+		spin_unlock_irq(&xe->irq.lock);
+		return IRQ_NONE;
+	}
+	spin_unlock_irq(&xe->irq.lock);
+
 	master_ctl = xelp_intr_disable(xe);
 	if (!master_ctl) {
 		xelp_intr_enable(xe, false);
@@ -371,6 +378,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 
 	/* TODO: This really shouldn't be copied+pasted */
 
+	spin_lock_irq(&xe->irq.lock);
+	if (!xe->irq.enabled) {
+		spin_unlock_irq(&xe->irq.lock);
+		return IRQ_NONE;
+	}
+	spin_unlock_irq(&xe->irq.lock);
+
 	master_tile_ctl = dg1_intr_disable(xe);
 	if (!master_tile_ctl) {
 		dg1_intr_enable(xe, false);
@@ -574,10 +588,14 @@ void xe_irq_shutdown(struct xe_device *xe)
 
 void xe_irq_suspend(struct xe_device *xe)
 {
+	int irq = to_pci_dev(xe->drm.dev)->irq;
+
 	spin_lock_irq(&xe->irq.lock);
-	xe->irq.enabled = false;
-	xe_irq_reset(xe);
+	xe->irq.enabled = false; /* no new irqs */
 	spin_unlock_irq(&xe->irq.lock);
+
+	synchronize_irq(irq); /* flush irqs */
+	xe_irq_reset(xe); /* turn irqs off */
 }
 
 void xe_irq_resume(struct xe_device *xe)
@@ -585,13 +603,15 @@ void xe_irq_resume(struct xe_device *xe)
 	struct xe_gt *gt;
 	int id;
 
-	spin_lock_irq(&xe->irq.lock);
+	/*
+	 * lock not needed:
+	 * 1. no irq will arrive before the postinstall
+	 * 2. display is not yet resumed
+	 */
 	xe->irq.enabled = true;
 	xe_irq_reset(xe);
-	xe_irq_postinstall(xe);
+	xe_irq_postinstall(xe); /* turn irqs on */
 
 	for_each_gt(gt, xe, id)
 		xe_irq_enable_hwe(gt);
-
-	spin_unlock_irq(&xe->irq.lock);
 }
-- 
2.41.0

