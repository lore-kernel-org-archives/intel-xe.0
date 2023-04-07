Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08096C77B61
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 14:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A2B10E03D;
	Fri,  7 Apr 2023 14:50:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12B310E03D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680879011; x=1712415011;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=TxqRXmhRzs58S2dw3IP/sLjwFnhUkgqw++Ps/YHRMEk=;
 b=W4vr0VWTeOVzSUI1FbdMfVewma3/gaqhp7zK4Rj7omqR9IAcWskMmccA
 sRGaL5O0MlIeT1Mkj/r+hPAnGMKfdJqRkJGWPLJe2Gdey7bW5qXGfPKR+
 0vdglBee98i8XAJXKU8kfDH+RmuPCv3GAZtTVhPqYbLgOgJZtqgkyw6WD
 c7+U0EDST5Zh3C9Ler1e+nw5axujCy0etIWM+DV30vHqd9uiIMz8JFbsf
 3+x37o2ec7NBwN5NZweleNXhZbZWK+zP5LvjS2Nxkzrrq+W1ZCiHfEAmk
 zAefO9XCbpXL9m5GkTZtHaje5aDzwBh/AT+NwXfOA6InFwCLiNOUQNvQn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="340489734"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="340489734"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 07:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="664908490"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; d="scan'208";a="664908490"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 07 Apr 2023 07:50:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 07:50:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 07:50:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 07:50:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW646NWl6n+Wi6BlrpQ91Ku54UXf6P8oHC1yMJy4VY7JttBpAl96VFRWQXWoLB9E1LxLxSE/xQ0z663FUVzypoY9xD4nMscDTO523p+UHC5a/nb+X1PS+MPSdVLdj5FtItMfdBY/t9JU3NB3CvCajMsQ2mIIKJEYAcSsDmNlNvdxOBpTjXQtsXxIHmtsdrawKUZWOyX0gagpzKgkqb9c0nA87X8YIw9B0GemZBrmzs7RSrpnKJNYHnaCwea6H4qVzUTqSPp6IqNlzHuE7MwcvL9+NY0UDu6jHUqUGiCPfaxP7rgjusR/8CzM0plP8FBvHxWwIlt+829H3sB04To7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/BNALTQmNo17Fg3GwpFIf3OQWAVObHzmr3PyscFHHQ=;
 b=Pdm1Ad1eCKC+4S1TOpnONbXH96BKpasYGPbqOTETzIQJ+FdAAueepKySbvZvRNy5F6T61olB17WWKYV9890X3MyGDbB0KmyltIouH2TXD2J0BNpVVqVEvofAKnuUOuDsV8TG9C3XxfOrTQAIdx0zwswv+dnUkkbxkOl/U7/PWq98iGVoakS7oFLYVftq0UmsA6CS18Orsi2Ta2pCCLPOTlL9+bTQZoVxY9U5QBUS4Lj1RIDXsN5z0PTu5lYn/NrzDIiZPQug9MOXXO7ptv8R6tjSDLsBR0gHCK0eD+iPNu+douPJqmTBUOU9U1QRJO6uR4bC8OHiCb4NHWvuFYjIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Fri, 7 Apr
 2023 14:50:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 14:50:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 7 Apr 2023 10:50:01 -0400
Message-ID: <20230407145001.1764161-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0174.namprd05.prod.outlook.com
 (2603:10b6:a03:339::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b808471-675f-4dd9-e1cb-08db3777611e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2wpQ0KLGfuFfG8jFieYuCAvBoR96dDlv7Xt3v5hxfA7oUvt0jQpzCj6KbOHLxYzY4WGQfxdSNr9W1pH/p5MEQibj9exZiNwmEfMmvoWX0GVWg/vQoeaJ18StPlLBKkRx6+aZemfm2P7TfF3NBBx1ZYW50XOfC1/VwRScAKmuOFQEMaCs9MP4xLWzjEd8f03EJ2rjUmwT152lKHnHW82Ch+PRMA1JzqSoS6h1m6Srsg+K1QHoQzEU2csoxeNq43b2UBk9jw8zIT2HqGvYMEJj9VkXwNJJ2bwQbrVCBAEnABqJw6CWDycPHFG+hfCes0GMKRJqG067i7OSvVJzT3gO3N0Yz5/Qx6fW6mopAvl2P+w87cX/GwqJANUjnz1Spnm7D3Ph34AN4iOqXi2iK8sO0a0N+jaWNB3Y/uSmOqWX6HXlSju31IvltDKxjwtAUGtAUwoakmjLwh8TNpDHJ+FeXLTKTxvF5DNY6UI9caWVFLS1aKdDMNSyrxr8luie8uqbIuTRLvrhM0GWSB9Uy9VoAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199021)(86362001)(36756003)(316002)(41300700001)(8676002)(66946007)(66476007)(66556008)(6916009)(6486002)(966005)(4326008)(54906003)(478600001)(5660300002)(2906002)(8936002)(44832011)(15650500001)(82960400001)(38100700002)(186003)(6666004)(6512007)(6506007)(107886003)(1076003)(26005)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zBam/cEWXFMVfqJ6t3RNuFNSHtJp2WJb7KYcj0U1mrrTRXlzePIpFvwzVBcu?=
 =?us-ascii?Q?ISz0wiEEvL1Y2Y22XroNW/io5A/ZnFtAS2gO1/gwEXN4ux0kZaTv9qEtsOab?=
 =?us-ascii?Q?YP4U8Y0JwLhVblJq/Wu3sklyVoMf2BaP7uMGafhKG/POx3jTZyDyHsO7R6Fv?=
 =?us-ascii?Q?w5Qz3Qvh2x8SSWCPYE6CWRUcdLsmlzV0jVARA75csaY85fbKDgR3oEfwls7X?=
 =?us-ascii?Q?6w8VFf9qFLwCUpfCS70//JdpekJa4rRkVaNY5S6dqIArNy/L3OAXkEvP8YiO?=
 =?us-ascii?Q?zRxPONyy8iunwg/2oT6hpOnsmPxtWm7C1KTsuQZry8xT8922salvIIIa4ZDZ?=
 =?us-ascii?Q?Iyzs2uFypdIS+fBnyocDPomd7yG/gkHR318Y+Du8hSuHecuU30tafdSQJDdo?=
 =?us-ascii?Q?Rs0NeOccA2EHLJA+ar/tz924Lmdus74+FYqS2sF/SYT8htuonvlwSq1RUfmu?=
 =?us-ascii?Q?6axIDtHDgXwEmBK+KR8btqn3C/RZeK92vIyL/o64z6XtrupDMZQdc7nAm8zl?=
 =?us-ascii?Q?Al+JgJLrz1/DoH0j6ckN4eZNUPR0ys7BZvMs1O5LRBxiO4BeZe18AfhUWSSj?=
 =?us-ascii?Q?EQabg20QBKGQczcBC86LKgAnBKiv73Z45aPpmE077gDwtnp8TlBoxtbFX9gE?=
 =?us-ascii?Q?Vk/NfQQr1QR+izHPl5AqWKvJ7FezYGgBes6nhtbSBVbCkqYt2wx/bRZ/Eafg?=
 =?us-ascii?Q?1yfJAq6eVMf+6+4y4xDROel0wrUx/llXhDAnW/qXBjs4HXYmYF7mQtcN3WuK?=
 =?us-ascii?Q?r99fSIHJ2pCbOlcjZiuLiDLnSmOkybLsKkOeCKuhbXo1MRdNG852BJ8cjsZP?=
 =?us-ascii?Q?YB+tsirAbJqm/tB+7uNzxjfbNsOQhPGda4inuCqi1MB4EdgpLWt2lt2O5MaR?=
 =?us-ascii?Q?yHNQGDJePMtuTSPyZ2eFF39L01QqpnMp2xmPaY3z/hc4aRnO0ak0yEJahttm?=
 =?us-ascii?Q?lN/4udU/+EH/Wa2ALtAysyCRMcF29HsBpzWiDQmmjEu/TI1J0a9vFARCNmJz?=
 =?us-ascii?Q?qWpnpktWsdaa85soDTb9pI2LnOEy4qGp0oXxHtreoy94f2tJxFsox7mzyX4q?=
 =?us-ascii?Q?o9vug9WIIrR1bAISnSHyMAh6q0QdlPIAqlRnsTlSi3+iMtUhsnkceDSuwJB8?=
 =?us-ascii?Q?6KiVfUQ1thQAqj8u+jWXU1OJJe89t81uWo3GCrTIhu1VrP4y+fuFFgqk65mQ?=
 =?us-ascii?Q?GWbLXo4yCd8gwNaX0ytff09dRM7/5xiylJiyGtoH0OWUKCM4Z6nu3wzaYR63?=
 =?us-ascii?Q?ux7/edM2p8G1ecWZWek16D3mNMyWiMpL6BTqutt1VNUYOHZfQvAJb0PqDXs5?=
 =?us-ascii?Q?Gmosj3rEb4PTbToD2vbm8ty0vrPCFSSCXcnSZoYX5j0vFc/O3MKyvEbknrmR?=
 =?us-ascii?Q?fxh7ndbw3O1OECjkNkg34w9+3EaVbyWJcxihZr1rFckJAS5YuT9wx59Q3qIe?=
 =?us-ascii?Q?alFiuLuU72jFOjaY+MWplf4j4+5LnJqcLdGwgxrEf76AgZzK0d5UdGFTv0Cq?=
 =?us-ascii?Q?5BzhQiOBN1moHZZ8SRUo/cGWsJWKjuFGMNgvsb6Fm9OhrGJ+UBXggeqMNbZR?=
 =?us-ascii?Q?Ho1j1mq5kZTVzXjq2oyJO0dm/AlD+9gU9CQfyqMV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b808471-675f-4dd9-e1cb-08db3777611e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 14:50:07.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7mJOjoSnn09fDtkBG/kjVLDa9MhyHw1Rc7DQsc9N37W+dbX3y3RKpGiYRH2UMbwp0icvKV5/rgsd+OWOj1pOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI] drm/xe: fix suspend-resume for dgfx
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

From: Matthew Auld <matthew.auld@intel.com>

This stopped working now that TTM treats moving a pinned object through
ttm_bo_validate() as an error, for the general case. Add some new
routines to handle the new special casing needed for suspend-resume.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Tested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 129 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h       |   3 +
 drivers/gpu/drm/xe/xe_bo_evict.c |   8 +-
 3 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c7f175a149be..3ab404e33fae 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -696,6 +696,135 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 }
 
+/**
+ * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
+ * @bo: The buffer object to move.
+ *
+ * On successful completion, the object memory will be moved to sytem memory.
+ * This function blocks until the object has been fully moved.
+ *
+ * This is needed to for special handling of pinned VRAM object during
+ * suspend-resume.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_bo_evict_pinned(struct xe_bo *bo)
+{
+	struct ttm_place place = {
+		.mem_type = XE_PL_TT,
+	};
+	struct ttm_placement placement = {
+		.placement = &place,
+		.num_placement = 1,
+	};
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+	};
+	struct ttm_resource *new_mem;
+	int ret;
+
+	xe_bo_assert_held(bo);
+
+	if (WARN_ON(!bo->ttm.resource))
+		return -EINVAL;
+
+	if (WARN_ON(!xe_bo_is_pinned(bo)))
+		return -EINVAL;
+
+	if (WARN_ON(!xe_bo_is_vram(bo)))
+		return -EINVAL;
+
+	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
+	if (ret)
+		return ret;
+
+	if (!bo->ttm.ttm) {
+		bo->ttm.ttm = xe_ttm_tt_create(&bo->ttm, 0);
+		if (!bo->ttm.ttm) {
+			ret = -ENOMEM;
+			goto err_res_free;
+		}
+	}
+
+	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
+	if (ret)
+		goto err_res_free;
+
+	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
+	if (ret)
+		goto err_res_free;
+
+	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
+	if (ret)
+		goto err_res_free;
+
+	dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+			      false, MAX_SCHEDULE_TIMEOUT);
+
+	return 0;
+
+err_res_free:
+	ttm_resource_free(&bo->ttm, &new_mem);
+	return ret;
+}
+
+/**
+ * xe_bo_restore_pinned() - Restore a pinned VRAM object
+ * @bo: The buffer object to move.
+ *
+ * On successful completion, the object memory will be moved back to VRAM.
+ * This function blocks until the object has been fully moved.
+ *
+ * This is needed to for special handling of pinned VRAM object during
+ * suspend-resume.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_bo_restore_pinned(struct xe_bo *bo)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+	};
+	struct ttm_resource *new_mem;
+	int ret;
+
+	xe_bo_assert_held(bo);
+
+	if (WARN_ON(!bo->ttm.resource))
+		return -EINVAL;
+
+	if (WARN_ON(!xe_bo_is_pinned(bo)))
+		return -EINVAL;
+
+	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
+		return -EINVAL;
+
+	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
+	if (ret)
+		return ret;
+
+	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
+	if (ret)
+		goto err_res_free;
+
+	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
+	if (ret)
+		goto err_res_free;
+
+	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
+	if (ret)
+		goto err_res_free;
+
+	dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+			      false, MAX_SCHEDULE_TIMEOUT);
+
+	return 0;
+
+err_res_free:
+	ttm_resource_free(&bo->ttm, &new_mem);
+	return ret;
+}
+
 static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 				       unsigned long page_offset)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index dd58edcb9398..effa9d0cf0f6 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -231,6 +231,9 @@ bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
 int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
 
+int xe_bo_evict_pinned(struct xe_bo *bo);
+int xe_bo_restore_pinned(struct xe_bo *bo);
+
 extern struct ttm_device_funcs xe_ttm_funcs;
 
 int xe_gem_create_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index bbf89a58cdf5..6642c5f52009 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -63,7 +63,7 @@ int xe_bo_evict_all(struct xe_device *xe)
 		spin_unlock(&xe->pinned.lock);
 
 		xe_bo_lock(bo, &ww, 0, false);
-		ret = xe_bo_evict(bo, true);
+		ret = xe_bo_evict_pinned(bo);
 		xe_bo_unlock(bo, &ww);
 		xe_bo_put(bo);
 		if (ret) {
@@ -97,7 +97,7 @@ int xe_bo_evict_all(struct xe_device *xe)
 		spin_unlock(&xe->pinned.lock);
 
 		xe_bo_lock(bo, &ww, 0, false);
-		ret = xe_bo_evict(bo, true);
+		ret = xe_bo_evict_pinned(bo);
 		xe_bo_unlock(bo, &ww);
 		xe_bo_put(bo);
 		if (ret)
@@ -141,7 +141,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		spin_unlock(&xe->pinned.lock);
 
 		xe_bo_lock(bo, &ww, 0, false);
-		ret = xe_bo_validate(bo, NULL, false);
+		ret = xe_bo_restore_pinned(bo);
 		xe_bo_unlock(bo, &ww);
 		if (ret) {
 			xe_bo_put(bo);
@@ -205,7 +205,7 @@ int xe_bo_restore_user(struct xe_device *xe)
 		spin_unlock(&xe->pinned.lock);
 
 		xe_bo_lock(bo, &ww, 0, false);
-		ret = xe_bo_validate(bo, NULL, false);
+		ret = xe_bo_restore_pinned(bo);
 		xe_bo_unlock(bo, &ww);
 		xe_bo_put(bo);
 		if (ret) {
-- 
2.39.2

