Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53311C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 21:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2A310E4BD;
	Wed, 26 Jul 2023 21:31:03 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595C410E4BD
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690407061; x=1721943061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eGXjKf0z4YxKauo+KLvUabl+V0KSJYKRbDQg2fvJ7jY=;
 b=gx6CPRl1sLAH89sClKtfkR1xfiYsvz9VTVzvmKw0HzZLGpLcf8VkhIIm
 o6CPLwRd2j3beaonjTvU6odaQ6JEBTWVOSzSd9YdMbnvj1HuVZVqJTe/w
 jRtxGrozb41hEVemwDpwPI8zTW3w0VA7psAHsT0jQidjpnnFP19Adi4ee
 u02jFaFBUuya+2bJ43qWaWVs6/iTQjmvi9dsXytSCf96BGRiS0ZktVksJ
 vf3m6QZpEFbIMLNDv3o2aL1qBiGdLFHsqmq+TNE0LUNbztCv9kVM0Pbvv
 YNlrPk80tGcuOfuQ9HBFNhmq5i0UUD81sM+sIkHxWPFx+lJY3Bc7QWFTv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348413672"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="348413672"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 14:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="816841714"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="816841714"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2023 14:31:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:31:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:30:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 14:30:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 14:30:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kesEUNr+qwgsmHsNe3TFQEgDUCYjJrP/50P43nJPnisBfWC/wzzl95Ear3LMYGbklXppxsZnIc6lsa45AbPPdMLaPDa+jnSbH56+goCqUbBcKVZIsjzBEAoVgnqyPWZZiLsbzwwbCd1hq3M85TZx6IztEx1RWj4HuKzFnlz20vWjtOpxRzqgmLFSad1SjJTT7BWmG0viuIom4JE0zpAm7AmZb8EH/ld3hc6xeJTq0So/pLZTbbRDXSQoYv8Nt27TELHBUz6Y+TP4l1B0JZXdi0xV8cq8JNKVtrGuj6rOl62H4VG9WjCoocVSA4VRAmi5muIJavw5tLGtm+cc9tUFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJudGW6iOkQNEfWYVjPRsFCPq1dyM6WDbKLt6QnQvyU=;
 b=nfOPHF2T+c2aqKTM9kqban864ov4YU+BPuTGZgezMbpK3z7Bg0ZUZX2FizGaBZg22tmPFdq+5/QiDq0nf5946cuDkOsIH044RBjgL0LngnPQJjBcDRG/V4Zc4mOlWOMD3+aE92B8hNiSpNl9F7n86fXlf3Dn+Ej/wVwo/f/tVMjCvS1dFH7g6RwWFXffKdf2IpoyRXiNB0h7OGesEulKyIq8nTVqV6CWX6gixuRudGcMOmmKpd1Iad16CtnckmaQPS7ZdGzc2XiAvfQzMJ1pDPwimhu4LLKEENtj+GhU1U01O+4zu5mu6rvD3P6LbJODvhl+yLwWxGtvrrIS/+PZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 21:30:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 21:30:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 17:30:42 -0400
Message-ID: <20230726213042.394720-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <ZMFW6AkUQCWNGdpl@intel.com>
References: <ZMFW6AkUQCWNGdpl@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ccc68e-ba69-4f3f-178e-08db8e1f9488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxZThpjZzDwlt6ap01k706OFUgyd4V6qUXFLBm7vWBY/l+W1V9Wq2pGAErWDFqwDP0niZLekXhFkB96ZQgQWy2BALgqYZ4J51MwIY2ihiRhYK0erlLbtRfppSQOT/yAVW6hX1fLo4vwUgS64y6ychcIFe99QqTldwzQZmLkb1sT5NF0czXeu4jrEzphBf9vC8kJdGhbA7RI43bZkOVo1DgaKPBpEREP1gYRa62ZoP00pKFggDZO5QMZfF/NgJTZDU/9xbqWVJUM3B2LMLvNqSLgGtSo1tBPf7+4QzG51xZfXQ4Zcas2Y46lKmHv1s8bhAqJcxIlHAIzLcFbElaOwMdVpeUvPa3YK0S6PZg+OKdxlTdp8s1GMTVG8ejoMUQ9d9QuNidF8hNo7/RZorjjApzpxRAKbeznHtC2wvYT15c3waRNcElahq7y+uXthiRdYJjRWCrydf3EuekWVMberBI0hbqx6CHuK3MQAn/IdhXfDRxWPKIeLAQGYi275at/Tfebp6525jSWU+hipnIoPAnJytaHVOmS8t0b7knTKiEfTMgRoAwFGOVR59TqOweky09J1QfZG4bhgkMtx2g5LyotltrxhdpgwuVAD5QIKpZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(2906002)(82960400001)(478600001)(36756003)(6486002)(6666004)(6916009)(66556008)(66476007)(66946007)(44832011)(4326008)(54906003)(38100700002)(316002)(8676002)(186003)(5660300002)(86362001)(6506007)(1076003)(83380400001)(26005)(2616005)(8936002)(6512007)(966005)(41300700001)(107886003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Pzqz3mTjiNAGhNOBrGZI9W5oQj/yznVSmLY0LfLfuVbFlMv3OR2njCy1Wt5?=
 =?us-ascii?Q?rvoaZkiaUzDRKrsv91axPuLB74xnYIyQZ0Y2gZ+mTFX7J4zJ5q44eeTOLA55?=
 =?us-ascii?Q?zQTmokl9UoEVVGct0mv20LrN61LXBJn5RIf0k7qlin2oy0Xb+PRdm9Nq96rB?=
 =?us-ascii?Q?SXBmMpqH01+IY8aAzdTHJRcSEP7LfILaiampifQlk9Mz8AZuwwEy8DiU8vM0?=
 =?us-ascii?Q?JXqhfuB9hmCovLSNMg47SDXK0mHAGmaeMjWIZI58sbhDpRSC05XpPjFPSKRF?=
 =?us-ascii?Q?zIBRF7YdzzznXrkPQZMMEdTEwjsJpKJmAKlCI5z0LTSjlkIQsdvwaRpWqNyb?=
 =?us-ascii?Q?cw+iI2E3E8Fhs/3DEuzA+stkGNiSE1KEC30vv6Mp+vXGBHurDJZEkLA6Jhl0?=
 =?us-ascii?Q?YEalyaqCg8PjkKq+DlRv2zOyjtki4F4XrQK53R7DErDCUpMACcCKNwEVbG0Z?=
 =?us-ascii?Q?l/xWqQ791KOalxeqj9ISVsIKILiYKgz7lgCYKo+yZXAIs0nBiT9Mr+GesQoU?=
 =?us-ascii?Q?YCqPho8dkd1swlz33BmcyyslJALij8WpYDrrJeghQdO80W8kpPdlRtyyPwdu?=
 =?us-ascii?Q?pxeL60P3fnadR6mrmdKUONLzOa8Bq/U/bPKIsv2HN+JOwe/tYXLmm8YkJCAG?=
 =?us-ascii?Q?L6OY7bxNVMHftQ1TxB32Y+ivinzEYZEqkQFGJ81IpO9UvpwSu/SK/eEDK6EB?=
 =?us-ascii?Q?hTdMJxpEsWaCDVN2nCntJwG39KCXBXDUaPCI1BoT8ickZSMgrkM6s44Z7eUc?=
 =?us-ascii?Q?X5s7S7zQhU/ye5U4je1TgLIZmKExwGeHfwCt+5/Nv+xwi3Dgh2JHuwkwzv4b?=
 =?us-ascii?Q?yASQKREQFqIwRmdi4bH99AONGuOlCLbBtRGrTLSp3wlQEiW3pBmPAIcWH0ou?=
 =?us-ascii?Q?JQpJBFerRhSwej8vjqS3ZSQMUavaNirZMHN7PmRP/9bG5m9jr1dbTuat6Jq3?=
 =?us-ascii?Q?pCAsdLO+8MUIyqvVee4bfqZvqIa4ToIgiZL/7kCSG1vCjzauAPuvc4k5ip18?=
 =?us-ascii?Q?expNBZBMBKAp5591wBkS943PQqZiS6rlqTFKIz2YOrmv5yqEHoM6hPZzLZnT?=
 =?us-ascii?Q?AHF50FCVSuZFeVzclhFQnfXF2egKVd95EqCr9b+HGshWhO56xq6RNgUnX7qI?=
 =?us-ascii?Q?jYMBoZcyUAZvCsoe6BResHW8oWNKKqm8GwZgddum0pcAOppPIFxTBuGHfukX?=
 =?us-ascii?Q?E5gOqSuFdbYYm0NNF/50R1pQPFw+l+FU2NJ6A7CbZhnw0Su8Zo/BpHkbXiQO?=
 =?us-ascii?Q?gTzNyhDYVbdtQW8N0xNEM5HRADKiHsoEZGqknQfYuipdqw2N7WsGapXD0TpY?=
 =?us-ascii?Q?d4dckjm9EUkzUMi5r1k1O5gS2UhMTJ8iO7qSdeJ6hgoXQMkw+UOe9HtAmgQ8?=
 =?us-ascii?Q?aufCfCUG05whtC9c9CB63ERXAKgLGRRCRERvxplokVoLrC5lrUOhlJg95IhS?=
 =?us-ascii?Q?DQIt/2nuE0QBI9Hu6sd7DONsWMoKov/nHAYOsp7Kw0RaVS9rIBed40Bs8H02?=
 =?us-ascii?Q?BsDeOJV9JZsNbiqzGWKNmdbKDJieg9ChQnhFOQetg0J0xrxlaTBGSzzsRKI8?=
 =?us-ascii?Q?A39tJ5rlQ2xYOweIpYzmehwsXDR/vmtvx6qRP7dtzKbXfJQGlzUkRKDF0slD?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ccc68e-ba69-4f3f-178e-08db8e1f9488
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 21:30:49.4110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs3zH98ysCTm4WcMbXz2HdJki2d2HlOKwY7UdqiwgFu/bwkI08BurLY8htFnoHoveP0h3TYXy79l0NcuGypBZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
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
suggested by Matthew Auld.

v3: do not use lockdep_assert for display glue.
    do not save restore irq from inside IRQ or we can
    get bogus irq restore warnings

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/463
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 11 ++++++++
 drivers/gpu/drm/xe/xe_irq.c               | 32 ++++++++++++++++++-----
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index fbb0e99143f6..df543f1cbfba 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -107,6 +107,17 @@ void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
 
 bool intel_irqs_enabled(struct xe_device *xe)
 {
+	/*
+	 * XXX: i915 has a racy handling of the irq.enabled, since it doesn't
+	 * lock its transitions. Because of that, the irq.enabled sometimes
+	 * is not read with the irq.lock in place.
+	 * However, the most critical cases like vblank and page flips are
+	 * properly using the locks.
+	 * We cannot take the lock in here or run any kind of assert because
+	 * of i915 inconsistency.
+	 * But at this point the xe irq is better protected against races,
+	 * although the full solution would be protecting the i915 side.
+	 */
 	return xe->irq.enabled;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index eae190cb0969..2022a5643e01 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -309,6 +309,13 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 	unsigned long intr_dw[2];
 	u32 identity[32];
 
+	spin_lock(&xe->irq.lock);
+	if (!xe->irq.enabled) {
+		spin_unlock(&xe->irq.lock);
+		return IRQ_NONE;
+	}
+	spin_unlock(&xe->irq.lock);
+
 	master_ctl = xelp_intr_disable(xe);
 	if (!master_ctl) {
 		xelp_intr_enable(xe, false);
@@ -371,6 +378,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 
 	/* TODO: This really shouldn't be copied+pasted */
 
+	spin_lock(&xe->irq.lock);
+	if (!xe->irq.enabled) {
+		spin_unlock(&xe->irq.lock);
+		return IRQ_NONE;
+	}
+	spin_unlock(&xe->irq.lock);
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

