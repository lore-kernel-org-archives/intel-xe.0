Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E702E7D0AD
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 21:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D112D10E61B;
	Thu, 21 Sep 2023 21:08:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ED110E61A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 21:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695330501; x=1726866501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lokh0oODTXh+GjXG0edNLeXRPRfDG35yxuA0b/NyhWU=;
 b=M06clN+7sK+6YU4DvIStU3HQfDQYIXymYdhcZk2DnMUcsZEsS4LNsv/A
 dmkaPrSohr3jD19qCwm8O3QmsrK3rLT0LT1dp7dD3pd3kToWAmvDe3xSS
 NgUXQSD2f0cwS0v3JV6CJiajE2sIRrjqKwFaSprHwNuCh9jbOleW2U8g+
 wEVoxlzhjZ9yY8O20LDhobTrxyLZ1FX2RqIc28jf2vGYWM0PcoSmEulIe
 +Ol1Rxirvdi8Md38Y1sA7WmV6qg8YABCvOz5JL/HqdCWiLoBa23ZPh3SS
 xleOBB0fMRSlL8vwb7Z2cEvbCJZON0a5AhCgBR/Lt/pQE22SeDhe30uU/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="360042632"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="360042632"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 14:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="994251223"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="994251223"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 14:08:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 14:08:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 14:08:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 14:08:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB4wzU2xsHXJhyhMabKbn9jX0U4oQPjiusMrv2vMS3+yPA94KlV2Q+wGnq+uxaapEZ91wAoSV3/r41wL9na/2yRvPy2A0FbxhwhNgT/s3+/xZsCz7Fjt8iwkS0aZQJlKTir4k6rK273mK+jO7Jd3Nk+YPny9bmtVAVhOnQFaj+WBrHNDktfILxB7INO5sOLU/PyGGYG5jiwlgT5eh7Lbwn5wUunzIH5IDhYB1Wr01vX8Am+oH7qk3qJdJAOphJnM+N77LpNNrPFcWpztKwFKY7IwUCJ9xyTNnKzsAVtGX96JCd/7poNw5h2LLvTpsx/bQqYUJ6TA+4AFvS0/Tkaw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK2MsYtyvyODDQxVewXifKbK9wgoreS5Uve5q0pA0Lo=;
 b=Ie8VWaCSQLQcBXxag5e+VHbTx20LeiAi8HXxnzOpWAlZoVEZauZ4ubO97UmPH/a/rdfG3IBosx7icJDxK1pYk2UazFVtoRxk01IxlrBqHCzd1XqDS8xwaqUcIEDy16N+djrpXSKS4fpaOkKwPT5GFSCSyEqSvzqIqgF4/rXPEdK5GbHKY0MVLsY63A4zWGB+W2PU8deBDS2kCJJKAytR8IoAOPORcPxaKn6uKltbeHPFSQjHulC67AmBxk97TkLtGcUmAHhMKTdN6yYIy2ZPr1gPG/hJu7w2bz49/4mm5dL/magnXPDrccR48OaKoddQV7bMCHIFkJvem3IdX9Y/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 21:08:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 21:08:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 21 Sep 2023 17:07:59 -0400
Message-ID: <20230921210800.170275-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921210800.170275-1-rodrigo.vivi@intel.com>
References: <20230921210800.170275-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 9042abb3-bead-482f-2857-08dbbae6dfa4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uc0aue3qyVg/JAWksrzlkZalM81curR3+NqCrWdYNbUfUDMeSpy/StnFKUcOZ+DEj30ZkR3XKX5T1Keg2DifleuI0rPCaTCMdVIapeIgUlOWkAt2rAJmm74zZL5lPKNGRKothfyittG/OmoKQPzbPmU45BRfkVwe3ncgykMdaruZ9M2KLlIdXhCXt6M/9UqsMTi4ismke25pJFL8J3bTQgILmfxlQ0cho2VcwSz9wX6Hio/rBxYJn7+ccit5T3AVVnNjtzrPpXMHqxMstrSloG+ziiTHAx3MK5sUishgCEOoZv/WV+jGGOSkmAA0/FYfLB/eoFR9zLFdZYNYe1zg9pJG2Yg5zP1NG9TYQLkRUj5kQMp1i304vP4io0IgS+qItFo6s73IQfi525/GHdL8fNggCisECEpYoBQDDg4JKOOodqe1A0YBMsOMcuPi6Bjri8KHGVg5q92zTkXuViN3NM4u61aYryb93pTdju/q70mmyaLHQ6nKKRq7Wc110P0LiS1ON4AjyMJb+CAu42IWbV7rVmvRexiPHu7wOvvPYjkmrrbN1mHIUYG7CO6GInUJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(1800799009)(186009)(451199024)(478600001)(2616005)(1076003)(83380400001)(36756003)(107886003)(82960400001)(38100700002)(26005)(86362001)(6486002)(6666004)(6512007)(6506007)(316002)(41300700001)(4326008)(6916009)(5660300002)(66556008)(54906003)(66476007)(8676002)(66946007)(2906002)(8936002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?87lYHi6bON4nckDqbCydXj2EaKF7hZ5iaAu0FKhSSUvh5ZMW9Qpu3cAGh5+6?=
 =?us-ascii?Q?a53KccH0rgy7ywLOKRm4ssjv8mziRtojSZojMRwe6Galy6lMPYStxZHkfNuC?=
 =?us-ascii?Q?GVyJzD1LdkX0XbeUrmA8cnjqwJc3w+jBbfZ+dnBX7/5uwflQxMVlTGd4Jd+S?=
 =?us-ascii?Q?wvn9UwUO7zh4wrfq4U2ZaG+JCWgQKnP1vE083+BHWTgvs1Ct7tDIwaBJoGbL?=
 =?us-ascii?Q?38VvoCVLH96ISYSwn/OgiJgFXRhK7vewguiA8XKNHQmdqxXV7QKfL6/t3e8c?=
 =?us-ascii?Q?AYSuElZVmM3ji3xHVlTuX/muTQP7BX61fmJztN/6ctYnILnvq9so3BYfv1cn?=
 =?us-ascii?Q?gIcf1+YcZyZhrPLFD5lMTmYl3gA1r/7pn/u1xM0kdtg6KuaWjVEW4wzQinvx?=
 =?us-ascii?Q?ZYHVXgmfAi5EkTG1OP9EmYj5CcEtM2FK7Kcn3SZa/GEjMinyL3dPc/GSAFb5?=
 =?us-ascii?Q?mbiswocqk55EPzLR9b9Vyv//Vb6+GY0QQWQ7CLu5W5tIvQMWeI5HLAYNvL+R?=
 =?us-ascii?Q?r3osL5f0RCTHNkR6VoepzAZ7VhMrMjlhslANH34uY2BJ3mymABaU+LiTvONI?=
 =?us-ascii?Q?txAFdFfTxfPStEJzQeF/COtM5aRjR26b3TNvJYDEZwOGVMn7t8W4Z2sI0O01?=
 =?us-ascii?Q?cA6BHSshAhEQgXEs7lwCRYm9Tkmcv/NG1eRFPAb/FeCYwTV8nMPvVpl0lDLE?=
 =?us-ascii?Q?9G2u2F6PCee0BvjTRE9aozWrdvkh0w8MyXpY14h8SDCgkfHNnrC9MJHeDxMm?=
 =?us-ascii?Q?o3SK6yo0TTKgmA3rIxMs2r1naow27oH229z+4SOKpt5qyPwZ68xOR/XzNI27?=
 =?us-ascii?Q?yhB9O2WcV5HcEmNa6fZdqXjxLSrQGTFFxCyktP/CZMZ4ciSIryvVCaZAdDst?=
 =?us-ascii?Q?1uuOXmqLGZNCXPGPQ8mJ4fXmE7FJ1kYzGKp0+XNAopCH/CkjavJwC7rGyx50?=
 =?us-ascii?Q?sgLaRRjmdW2IwK+17jww4Pl2l+yMp7QJ0Y5sk6x5RLsFrfKPCZ2KvOoCIVug?=
 =?us-ascii?Q?lNpwqFatZXhUt9tVmjbkYCqUi+Qu/pULjkS5D9QHyq/qHs/IVky4OmVCDPMU?=
 =?us-ascii?Q?Gm2EIWfzje317xqjXLSwI+U8z79oCXbZXXtvWFSPkF39N9wDxldBpPyKYjfS?=
 =?us-ascii?Q?eigBV+MD7U4qWqw9mAUDkBGI3f35SQ2AU8MfDWi1B/wgHjAGdhhmbmIpCp77?=
 =?us-ascii?Q?UsCul3vp34SSZrE+avkevs+Mpp8TVL69GrgTNPNpb05Gx9zJTVygZFpwM5RK?=
 =?us-ascii?Q?DLKWTG4S+AGhPQ+PFPJAf8n4VubCpJBk+XJ55hFQi6wudIF6bA3Y7kH+S2Zp?=
 =?us-ascii?Q?tEQCu5KsNjdT1XcOM6P3QiigzqF5j9PicLM5Mm5Ye25LWdwH26tPZnU0wnYi?=
 =?us-ascii?Q?6w85d7zUcm3E72Jk5GyGbtvL9oc71a00VLX2HfRetfPFU6DVDEtiZj7aVLj4?=
 =?us-ascii?Q?QzcLYIoxtwfzcRXggKqXiGpGgR/r4UcJWBWZ85R2a2DketNbkoShIuCzVZmA?=
 =?us-ascii?Q?tZhoAz0jidI3SxutP7kQ3xhr0SXCCaJblpcIcS0YN0N6m+atXkdbxs0nLslr?=
 =?us-ascii?Q?eJpb/7h+cUeuYEBz3BPfdLYtPVVa1GU6B3kNS1SjHNa3TPuOLJSGuXF6HWhX?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9042abb3-bead-482f-2857-08dbbae6dfa4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 21:08:17.2249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3P4aC9fMpbKgTARJyIGuVhfr60EEe9Zzl6wa1AF9Mv4gj7mSefdm7h6vMnciyEmbPmqaCZ94UfonlQsMyHTYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 2/3] drm/xe: change old msi irq api to a new one
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
Cc: Ohad Sharabi <osharabi@habana.ai>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

As a preparation for msix support, changing for new msi irq api
which supports both msi and msix.

Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
[Rebase fixes by Rodrigo]
---
 drivers/gpu/drm/xe/xe_irq.c | 38 ++++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pci.c |  3 ---
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index f98aa1f06c8f..6052c944acda 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -566,23 +566,24 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int irq = pdev->irq;
+	int irq;
 
 	if (!xe->irq.enabled)
 		return;
 
 	xe->irq.enabled = false;
 	xe_irq_reset(xe);
+
+	irq = pci_irq_vector(pdev, 0);
 	free_irq(irq, xe);
-	if (pdev->msi_enabled)
-		pci_disable_msi(pdev);
+	pci_free_irq_vectors(pdev);
 }
 
 int xe_irq_install(struct xe_device *xe)
 {
-	int irq = to_pci_dev(xe->drm.dev)->irq;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	irq_handler_t irq_handler;
-	int err;
+	int err, irq;
 
 	irq_handler = xe_irq_handler(xe);
 	if (!irq_handler) {
@@ -592,16 +593,35 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_reset(xe);
 
-	err = request_irq(irq, irq_handler,
-			  IRQF_SHARED, DRIVER_NAME, xe);
-	if (err < 0)
+	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+	if (err < 0) {
+		drm_err(&xe->drm, "MSI: Failed to enable support %d\n", err);
 		return err;
+	}
+
+	irq = pci_irq_vector(pdev, 0);
+	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
+	if (err < 0) {
+		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+		goto free_pci_irq_vectors;
+	}
 
 	xe->irq.enabled = true;
 
 	xe_irq_postinstall(xe);
 
-	return drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
+	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
+	if (err)
+		goto free_irq_handler;
+
+	return 0;
+
+free_irq_handler:
+	free_irq(irq, xe);
+free_pci_irq_vectors:
+	pci_free_irq_vectors(pdev);
+
+	return err;
 }
 
 void xe_irq_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dc233a1226bd..a11163b89a3f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -694,9 +694,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	if (pci_enable_msi(pdev) < 0)
-		drm_dbg(&xe->drm, "can't enable MSI");
-
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
 		goto err_pci_disable;
-- 
2.41.0

