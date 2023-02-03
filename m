Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9488BC05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C0710E09C;
	Fri,  3 Feb 2023 20:25:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD84010E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455933; x=1706991933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DnjN66k818lb659JwrG+HlWDhTSMrVLvYO1q6m1wJBU=;
 b=C8mcC9RgPWH2X24dNmAk0gQhkVV98n7a6GBBZbPp73ztSGvTrlbcnrpx
 aOLtmPcuKjPwYLrysvvO0GiVU/6HRxvTOe+zUaETFgfsS0D4Zu+4l3zM0
 UFqibBF+wZhTRANeaICuux6CpwI0QPd4k3Yu2F4rGhBvEaK0YL0dbQWfZ
 60GQveSJRUvlf4UUWUaTeFTZVhPtmyFa4nnrGJ3SpNQLwOKC7rAtTDrsX
 y/wiXvZNntlsezDJG1NzQhfvfUP+yqQxsy+OaEKcnzVoGj8q2vXGdqKfj
 VB5B7rv7W0cgQN6BG3s9+aOMTw1be6CHvIB/Z3dx6x3h/HY+hamVaOE2f g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="326544664"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="326544664"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643370132"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="643370132"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 12:25:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiyK0XfsTvisnP/HNt3O7yQKH3TFX02BGV3wOdHNxFs1REi5mIXCRIg+o6pMERkgdglvgtcS+4OfoZMOy+VSpBiGKeosD3f9J8YLeA0nS+ceH2H1QoDa6WTyIBMTP9NvJOSud0+1Ymhm5sJQvjFJmhk9lG41ZgtKWe3W5swKz4+nlHbF2My8MVMfnvWFJnsOJXuYAt0EjbszbbB0ybcNOYQEOKvBoTPCOMThuBrVonuiWl5INdCpqsRq6aV1Ah579eje73MfnxmrSyxHYzu2YdEoXLuad8jWr8ywqfJ3ftsZrFkURWr+5J4K8XanmG3O2ahH87Kshxr+zxr+iAswPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqKx+n/b3Yc4eyNJhVq7cghK1dwL4cw4ga+syV6olY8=;
 b=gzFLoq8/XpDY5ULSEwYy27s1iTvLVbEBZukiOVsfMEc0GhAc5zbOfiwdcGso2finz29k6JHRmd18QndO5Qydpty0Mq5qI5jqYWr5K3zOhGTfSLeh+RSX/p6rilMNs6Cj3ec5UGONBGgdMoefg2GFQD/VeW6x6FNTzT9vE1gPxgeO67Dngo0mOOt3TDcBk9ObV1+bMgr1G01HGrLozRnOk+AkH45LvZg24jq9euIRiWtyRpxJl72lcwLTAErPAugUtUgH+IIiEvR4JFhTAuhUwJLjdOaChDdlvMo2rqK4UADfcg4ihWDsXj3rtGfMxZxz+XOv0B2iVS6yzIGwG5kKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:25:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:06 -0500
Message-ID: <20230203202409.577032-20-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2c2d1b-9565-40bb-aa7b-08db0624c9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFCShYLvf6ns/Q6P/GJ94FUgQ3ZDKKQmzQRJihTJq003ODkyNBlVcpuUzdI5g2J5AoMTf7Mh4W3L8arAi2q2I7hvBk3jesNbmAqYI8k0yMaU8gwL1kxf6waLlLcudnCbw4qA4Abyyba5OhJ3NegXAnSG9CC1rIEAfnxpv95Mt5xD1pB4gYcivLre5NYNeNjWHGCyMxuFYIij5b5+GRWXijhTK32dJCiNy1nnvoS107LOOYjkskuHOLSaLUYD2wOrb72SvP+Ugyv8QqxXtlSarc+GoiW2Kq7nZsu7fT+2LIbhwxKVkdkahclWCi/u4FDpEhZnIyG66mkB6jbtyBnvhTAWcDBAwvHtTgDFt7wrejfFg/S69ACP6ceElGq4F96cy9o792171xlpfQ9U7xHoqtowDJ2w4JJNH8+OTYJtJoFo1C8oawtBuoAgV8q13bE28imGvMLhGS3RgM3cFsP8CEu+usA4fyY6DDNIU61qa21ywwjaFSJw9AZkQZYFU4rQSTF8cIbOT8nA7wCr1wgfqh9dSDzDIBQ4E1/yhLj2T8PVvBQIsM/3R4zEs4O0Q+UEIWkHF47sQhFWKWi59Vsg/8fyM1mS9Py4MAxigRYbqvXfFqOJAJUr8VPBDPY1VcBNnSRjvulHSif9OVcCJKaIGhwm00vDYJa58Aw1LkL2u57qtd70p5ol4ut2Zy0BwyJ2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002)(14773001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4fV5wjypKOCt2RO0kE3kqaYRXEDfwCBZBeJUTgyAxx3WlRl3e2ezQVungY3N?=
 =?us-ascii?Q?1unwtRcwY2BBFQLVR3Gk8tpc+gkFvoBq7J5ibNZJDXZi+CY/0oJnE3JiQA0b?=
 =?us-ascii?Q?58yowKZSttQeseQnNqwKDccbJfkkQwqHtzliaqwkKfP3sZcfKlwsUAmli2Bm?=
 =?us-ascii?Q?qf28x0TFNR+1F1w2u9Yg5OSHFIkQt2uDRyABoAtA3dLF9bnjdlrVuTAyYxWr?=
 =?us-ascii?Q?Fr7SL89AEJADAVdTMQx2yz1CSTCBR/xgTO2M+MQcWKf2/+QMisLSoP4A1mhB?=
 =?us-ascii?Q?0yEN1h/s8/x233dSoETzsH5HrJEsSCkJVVvqpL95Wpi+LdtJzG1dPwcKcB1k?=
 =?us-ascii?Q?J0tBY/wUdRPmPz+5q6ORv9dKiggXcHNIIR5hEZx8ajdMRrIrKE47OMuR0n3O?=
 =?us-ascii?Q?HQz2YPgkSzctJ1yomen3m5gX8Ljps/kUKuxxYkMXNA5ynBUO8CwU+4XNfQQc?=
 =?us-ascii?Q?sy9SDTCeKxxQ5UgWn++I4hxlUj9IB2g2bFS+I22EUJF3+yJKB5wxMzXiJLB7?=
 =?us-ascii?Q?kOATgS0UDQcp9eOwzI5bAuj0UlfUqO7Ex83s7TRTxLnorZVNvcKyilCj53dn?=
 =?us-ascii?Q?qqIwOEF5FNsP3iSrQ4EjeHNq6qVXZbXS8clLUm2vkrOlqMeLv6fOG3msmzKE?=
 =?us-ascii?Q?0Bk2O37r7bM8I5MLk8+/CrpGy2Nw0JiuwMfJz0HSTr9l/QhiJjGoxnN5Fn9p?=
 =?us-ascii?Q?UsqNcUmA00kmiVPI4BVmIGf6HziR56568K3xWLseMovizZXaaO/QnWpjSFtN?=
 =?us-ascii?Q?3r4hrhFgfBdaNCfIGxHCUjmQ6l6r/6dMajZCCku0wkWJ/t6KyDwR1FDcK+3G?=
 =?us-ascii?Q?efTGAzwi4U+DaWops9n5OgPbOuPCsANclxMswZnm9snyWoFyftjLBuKo79RK?=
 =?us-ascii?Q?bbZlvXMHGveOLpTy0kZ/NuPuWUyr6rdFWjNspf3jp4s23ZxpmqA1Xu+24FbC?=
 =?us-ascii?Q?taeOgp4pSQnQtBLnsumoSHNq+VSDzNKCT/vNqitEtbT1kAK6tRQWCXaQ/IAD?=
 =?us-ascii?Q?e6cV95gN6MTTKbqjfy0om4PKlyfHUJVk1X1NO6KTEBogeeW0l//0Yvn7tbYk?=
 =?us-ascii?Q?9eZI6AyackDBA3NAqodh3DkfV2XH0ftzW8tkC2ux0fg6bLo77ee7KwRGIQMc?=
 =?us-ascii?Q?Z8+ZUEKviYZAJbPDd18s2scacA1cC/uV5KlyCSTF49i0sMxgF2MmaMQ+RFJO?=
 =?us-ascii?Q?h60WcSafMhcJkXHfYZ7JHg8wxc2dWpCAfPeFYBRfXARmLoqf/KKtCsuz1+s2?=
 =?us-ascii?Q?f9oCH5RiXM64xlR/ITRQ/BWi2vyokNWhRES6XVUfmjOjEtnzb/SmZ01uD108?=
 =?us-ascii?Q?2nKsBvsN1KQ0NkBdFM8gp9ZI4/4JJf99MRSnM7WMyG49gAaIiCbjNbvrMQ86?=
 =?us-ascii?Q?HUPgkeADK3vB36FoafmZ/zW6/rrPo6BJ0qRaN7n5n5V3/1Smy1T3w0bBduzp?=
 =?us-ascii?Q?aUyI4c4gLKdJrn8CO7r06BUIikDcmxYhOdwI0EtGaA/8XrCWg88CUZwu6W4w?=
 =?us-ascii?Q?fi/+X1sI4QH6OIgyHBI0HTcAiuSa4WUqrQnKfHlcZg9jIb2ikw6Gkxw2F8Wi?=
 =?us-ascii?Q?zVn3oaRwngU9XNXY0nJ++5/txmPzSAWoDp7ee0uhYXo0WCpr++dqGI9YvRYg?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2c2d1b-9565-40bb-aa7b-08db0624c9f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:28.2441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtxqY7vO0iWN9IXsb0jvqCMt3N6I2WWAzTCgzFt7NQ7Jx2TRGNUhGr9knlHzfg1sMO0kgExSh84prTnx2Sbf6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 19/22] drm/xe: Signal invalidation fence
 immediately if CT send fails
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

This means we are in the middle of a GT reset and no need to do TLB
invalidation so just signal invalidation fence immediately.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 23 +++++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index f6a2dd26cad4..2521c8a65690 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -69,6 +69,15 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	return 0;
 }
 
+static void
+invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
+{
+	trace_xe_gt_tlb_invalidation_fence_signal(fence);
+	list_del(&fence->link);
+	dma_fence_signal(&fence->base);
+	dma_fence_put(&fence->base);
+}
+
 /**
  * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
  * @gt: graphics tile
@@ -83,11 +92,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 
 	mutex_lock(&gt->uc.guc.ct.lock);
 	list_for_each_entry_safe(fence, next,
-				 &gt->tlb_invalidation.pending_fences, link) {
-		list_del(&fence->link);
-		dma_fence_signal(&fence->base);
-		dma_fence_put(&fence->base);
-	}
+				 &gt->tlb_invalidation.pending_fences, link)
+		invalidation_fence_signal(fence);
 	mutex_unlock(&gt->uc.guc.ct.lock);
 }
 
@@ -130,6 +136,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	}
 	if (!ret)
 		ret = seqno;
+	if (ret < 0 && fence)
+		invalidation_fence_signal(fence);
 	mutex_unlock(&guc->ct.lock);
 
 	return ret;
@@ -321,16 +329,13 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (fence)
 		trace_xe_gt_tlb_invalidation_fence_recv(fence);
 	if (fence && tlb_invalidation_seqno_past(gt, fence->seqno)) {
-		trace_xe_gt_tlb_invalidation_fence_signal(fence);
-		list_del(&fence->link);
+		invalidation_fence_signal(fence);
 		if (!list_empty(&gt->tlb_invalidation.pending_fences))
 			mod_delayed_work(system_wq,
 					 &gt->tlb_invalidation.fence_tdr,
 					 TLB_TIMEOUT);
 		else
 			cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
-		dma_fence_signal(&fence->base);
-		dma_fence_put(&fence->base);
 	}
 
 	return 0;
-- 
2.39.1

