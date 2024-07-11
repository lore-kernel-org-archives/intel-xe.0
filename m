Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21762C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E654110EB15;
	Thu, 11 Jul 2024 17:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyu0NJ4W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E07310EB07
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717964; x=1752253964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bCA8+HKOAWPYNCxU5FhI2jmkiYmtNbHCkX4uolgrjxU=;
 b=hyu0NJ4WZzasewG51Ex4buIZIGYjjfd22xppiIPJA/1Ey5qbR6VdLEm5
 KmTsQjCghUNOF20YUDumzXi3lEivvxgq7aamyxkQW/6FM1rsZXHcupuVj
 yooIijSUy4tO4PGApigx1na2mQpNSohlrK+zxu6NHRA2GD0/CSeQ3PYjQ
 l6ZidUErjdsVwGq3cg6UG30+ok4ZNTdRQxlIrnGKgQQKU/aN6hGrywJoM
 6wrwBTNCb1tPLoEOR+OVjbFv605OGk3Mfbrx4iEdfZ5CY+RdoTq01LgCz
 cHmwIZzOs4Cei3OWt+3X2YWkxn7ihWq3SRyrYUMEk17GGQr3np6kxw4H9 Q==;
X-CSE-ConnectionGUID: BZF2Ztm6SU+HNKY0i7fDaQ==
X-CSE-MsgGUID: X8RJqtYkTFeuxe2gTjy2dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17827704"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="17827704"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:34 -0700
X-CSE-ConnectionGUID: BMAxyJfVS8++M4OiJcTWFA==
X-CSE-MsgGUID: K740l/gtTPCDC/XZLvc7aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="71835405"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO2EQiwk+JS9KxSbL21bV1Y1pvZCHY5joGnOgGzxvhxV6bBAFniJ5kM8oMnvin37cDe01ENQOsrkdRvWtKsgYkdb0czXpHPW0+c4gcY8cleF5Qw/ZNQqSgzTZwNEhXuzsjlVC+QytGnFE7BCj6hmNFWNgcwtlURi6OjFPul866CVsuwOCgqu6tKSpi+RxBZatrhaNk6G3ViaNKYfeQMoVrMF7RiIiUha2eh3ZirOgjgG/H10Zwg6EubVOixi2v0c18YyctBoUoTJ4lxPmn0kJ9hOvymN05QRSPKUoP85q0oJlI4+iwK0UUTY9bX8ILUhsoq5WYAep9WljmHmRnDQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKOUdXfKtriV1bd91nc5ePbC3yqGHJNIb4RGfO3uEoU=;
 b=HbkueHHWrCtuoDfBD/a3SuOihsboHgmBhdCnU7YYDdclUkTi99SyJRSOgFloJvOMJfhAYp8Wj5FQMKv2OZZOwKxD0APhGFZ8vbsuavSHhkHUisp+/kXnojwB5T83EYdV+Jw67vRHX+G+udqD0O4N7N8pulmzwGw25YzMH0tGof+c+hEoo6Wl3MR3T3rpQM+IdUSc50yEvE0GHOGePfebVaO9WbSdndl1NVB7+mev60pQ02o3s0FfhnAB9ZEUyhXK/nnWMOnDT7jjsFSn29Bep4KzXiUEgqv23YkYAjdS0s2BZ+6RxJLSHDHfgkKISYjPxoubvzVEyqEQ0bH4DIv8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Thu, 11 Jul 2024 17:12:27 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [PATCH 07/12] drm/xe: Limit drm_mm_node_allocated access to
 xe_ggtt_node
Date: Thu, 11 Jul 2024 13:11:50 -0400
Message-ID: <20240711171155.173717-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0074.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::15) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 0744b464-22fa-4e85-a7e7-08dca1cca396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LUSiXJLzpVRhMl6XhhUw7k71PJ2cL5FZa/zo/2sgOSN/dg5cvkhT/VM3gi/D?=
 =?us-ascii?Q?GhN1mtHP6DXkJgdROwuqYJlg/RX8qHSpFlZI2VbDbgYx+qIwYoXFqZjSSYXl?=
 =?us-ascii?Q?5biWranI6FbKVmE4MfyIGC+l5ysOKsO+7HohKBo1MKk4ZMlg4JI2Fkv+7hyr?=
 =?us-ascii?Q?UraID9CrAkhO8ie1hjDldBq9wAXVvas6m1N5v8iZ4IHiwf770MQ2w1f2+Q9l?=
 =?us-ascii?Q?XJ8QqWagMEv4vwpjQ0Zx5E3+tq9DZAOctrWACMayrKCIsp0S35onOTSzr+RK?=
 =?us-ascii?Q?1swlO0BC81CBoaQVJR2xaPif3u8Bxp8F0+nuQjdYW7WKaGkIxn4NA3cEML1G?=
 =?us-ascii?Q?n9iYcNqyns+XGDwp9sQ3qX7I5h7ch9u+k+gbSEArYT7KzyzMPAVoQi6Qe5SO?=
 =?us-ascii?Q?S5d3Q7bQz73tVFboiMALEce2U3vzFfVXhgExeoPEOlVd8pkHC4tsIgJ9bWSp?=
 =?us-ascii?Q?NHQwrX9wYaegmkjq/08oMFIXbl1LUg6b0cr6W8m74ddzK986VLKVL7EzRT2B?=
 =?us-ascii?Q?DcmbtOH+Sgd2Ah9PBhtrI7jwFckh7YnGGWbXGZgR+zQSgWpWI4adDdfQtSE7?=
 =?us-ascii?Q?huSDisLTbDzV3jNCBWW+MeUwSjv+zKPx0fyV907Dj55lOHh+pA8kHRAnBEp4?=
 =?us-ascii?Q?DUPpOLy1Z/74AVvE/gb36Gu47wU70BaqVQ+A11JPprdh1ppn1eGmsySJPs8H?=
 =?us-ascii?Q?dHiP8wNQgxIZBafMfYY9QMGD7hoVm0WnZn9+AEB55S67OKyrb5TDm0U+wpmc?=
 =?us-ascii?Q?NDKoE0r1fMPvjhP6u+lB5ZiFOkVcpYAm8l1eZWRY49ArM2MMyK3+97sVVFu5?=
 =?us-ascii?Q?pwQJOYaouia8mjXuocc4SOSAkO+Uhdz8XkUGv9eIrqhV/Y2cSeCFYBN9Hgm7?=
 =?us-ascii?Q?kVlxyk0kQy7SJOTrs/H2QV6w7uA0xQpcwUlnyLUR7FYNfSwI+tym1iE692Kt?=
 =?us-ascii?Q?2s6HsKunPpjbzprGxTFj3mi4vUB2h/ETVZqZWYJPPAzhYYTkwU91zgNbK12t?=
 =?us-ascii?Q?t0VkIxKvIuUgt3EGCs+I05Okb2bYBo1DyTj/3etYIQr8mSbVt/bWjcBfHDpl?=
 =?us-ascii?Q?ub3uAVnQghO4Jx/gexKElAjxIy/1qrB0ntaP3Uj3L9dmTQL4wKPGI+MGNyjN?=
 =?us-ascii?Q?6A3uKTxN1mokisioBh+clmenRxHpFDx0Af5KzdQMVEX4jkCHNe3au8aTTvtq?=
 =?us-ascii?Q?86iit6PFere6E1JUXt93fl5aEO2C8Q17d9CDjaY9G+jYPioFUWBCAuxEIbOT?=
 =?us-ascii?Q?F9WizUGM3skk3mkUj4TwMHvwFQ69uvDvJ11eLnwubu7dam91ZZO2ICRAFpHI?=
 =?us-ascii?Q?6M/bbAdKcsWE9DNOk2USsTmT6Ava0PGF+du0sYIBMvBjhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jeuS0yZ1fX/K5gohWnGrPBh3L5CB3m4UgGCuEe9LPsAQuVg1skGc390ZDqei?=
 =?us-ascii?Q?2Rv6P+DTTCPnT687mlppayDfXiVJix11Dh9EY9IW1H98aCvyyt6SxAzSnoBt?=
 =?us-ascii?Q?RUglfJr+hsMDc0pxr1+p6zzm/rQuthVgUmxC0XQ+jzePoQq3MIDjTh2LsifY?=
 =?us-ascii?Q?vyyF4HEWHzmdf3xxNV0LTV66Nai4Xr1haX3o5QX55mkS5/GT4OAbCyD+ObX2?=
 =?us-ascii?Q?exkKFZW018BXrAFfxtTM2YCqysspivWK8AJVLsBAYk4qMoG5Zqvxk4wg4qP3?=
 =?us-ascii?Q?FC+LjYFwzS5Cm3WCc6IP7IN9rVApD5zHQZ/cr5ZwU0tJsHy9fpCGSvjjUoO8?=
 =?us-ascii?Q?0B7x9TahzkB9ET4IGVr6/l44FXsmpbKQqcgLo4NN156xpFfZ4s7RqdfC0oL5?=
 =?us-ascii?Q?IeYEBjY3cHjnfT4dakbFXhWuPpnXTUbj8bfyDwb86Eu0y0vPdKi/cjjTHwmE?=
 =?us-ascii?Q?C/19JCRa+fDWlZ7L/ir1yQOhvamHan3EDkkQWe/EY2RLfn0vr1hWD5uapk1T?=
 =?us-ascii?Q?Ci2Alw8S05C6qr4fckgfMPoJy3L5WDQtdQA8bnf29G5Z437x1CrIJeQq80/P?=
 =?us-ascii?Q?x/6HYCYz5NOi1KypI8pIA4lwC/GtsAKJIxa5VQNpkbkZv1Kv4CA55KKLwi46?=
 =?us-ascii?Q?XbNUG1t6wm+lpLgNOINIkDgVfUX5Cy60TFRSIy1xSbDvXachiG0wfogUU95E?=
 =?us-ascii?Q?VADhYF3YALdwyhRZTnwuWaVxJ0QWgijVUFNLDBP1zHudpARcRdV0RY1tH1Ra?=
 =?us-ascii?Q?1JZALlZuT3WlqStrQjkzDGkxoED6M+Ba6LqIbK+wtXVcOCIVTvfnnqJJ1OCi?=
 =?us-ascii?Q?bP2gZ+6I6t/WHYxJmpm58cd2PfsKU1qaH6aS6OSkGwPPiO/f+S42VGMpRR9D?=
 =?us-ascii?Q?bxiFM86C82FnDJA43+M7t+cb2eqStWsfuy64ie7XLpdxnM3oyxTDrG+i5OYt?=
 =?us-ascii?Q?viEwqU6ClpITSFFpqs/MS79NTSQOT6/vKNUefquaE/Wd2vmEU04aA9A5eTrg?=
 =?us-ascii?Q?4GNv/MRPvU5NrQLV25pDiFHl1/HBDFdFH+tGiQvOQVBdlTZheol8o2W8SQh4?=
 =?us-ascii?Q?saOqAIhnfKiqQltTcxGxg7UZisppHTDUBGh9yykn9Ltu01YVBjZ/6XgyVOcV?=
 =?us-ascii?Q?K6gtMqzImb9DDI1u+1ItAo1s625lATjYYoMWAG718KwbsbIwO6p5G66udCQJ?=
 =?us-ascii?Q?6TymjatszMtpezZ8DpsJft+937fb4U9qGSGM/m054uAPgdwWB+4Ln1DPhY7l?=
 =?us-ascii?Q?VUadNOMIlnf1QQPRJoJ+r+3LsLR98kuLWc9lVkHlEeO1wYLIBD1FCoGa2mAu?=
 =?us-ascii?Q?RIZpmyNXZ39ShHEXiMixxysiT+COOwLY2dNusrvNUkvryZSmdSq//Wu4TrqR?=
 =?us-ascii?Q?dd6ba/KZu4Acax3920QaaD2LY7Bq9K6TwumecoAY+VKHyZ+bn3LiG5WrP2V6?=
 =?us-ascii?Q?KpUqOcWTW9flALvSroal9BysFXH1aMVt2jmSQOsERUUo8ottIuMh39nS8Yoo?=
 =?us-ascii?Q?VZm4kCaWYbW5Q+IUW7AmNrJ3xSVPBnp1n2G5heZPCAmDewdgpgthkJ34MNDB?=
 =?us-ascii?Q?Wf5Nv87vOOjM0ruv3tU4o/mYx5KrMzfdMLRYf2vkbSkskRDIo5KQel1f6YA0?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0744b464-22fa-4e85-a7e7-08dca1cca396
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:27.1230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4PVDclV/aRU2bFscYtcZd0i/7eCwWkvWCO5xt5HEtX4t24aoJ/MozK+X2ZtKuYN1JrL1vq2Twyl7hIWu5AdRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Continue with the encapsulation of drm_mm_node inside xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 ++++++------
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index db74c3395ef8..de4930b67a29 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -323,7 +323,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
+	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
 		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 3ab29588a068..67337bfeb81e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -477,6 +477,17 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_node_allocated - Check if node is allocated
+ * @node: the &xe_ggtt_node to be inspected
+ *
+ * Return: True if allocated, False otherwise.
+ */
+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
+{
+	return drm_mm_node_allocated(&node->base);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 5147930357de..f816b3c0732b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -23,6 +23,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index dfa71bcd0f56..efaf188290ea 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -235,7 +235,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (drm_mm_node_allocated(&config->ggtt_region.base)) {
+	if (xe_ggtt_node_allocated(&config->ggtt_region)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
 		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
 		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
@@ -376,7 +376,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-	if (drm_mm_node_allocated(&node->base)) {
+	if (xe_ggtt_node_allocated(node)) {
 		/*
 		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
@@ -406,14 +406,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	size = round_up(size, alignment);
 
-	if (drm_mm_node_allocated(&node->base)) {
+	if (xe_ggtt_node_allocated(node)) {
 		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
 		if (unlikely(err))
 			return err;
 
 		pf_release_ggtt(tile, node);
 	}
-	xe_gt_assert(gt, !drm_mm_node_allocated(&node->base));
+	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
 
 	if (!size)
 		return 0;
@@ -439,7 +439,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 	struct xe_ggtt_node *node = &config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
-	return drm_mm_node_allocated(&node->base) ? node->base.size : 0;
+	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
 }
 
 /**
@@ -2021,7 +2021,7 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!drm_mm_node_allocated(&config->ggtt_region.base))
+		if (!xe_ggtt_node_allocated(&config->ggtt_region))
 			continue;
 
 		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.45.2

