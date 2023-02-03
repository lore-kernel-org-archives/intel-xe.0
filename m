Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC98C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB9C10E09C;
	Fri,  3 Feb 2023 20:25:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A0A10E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455937; x=1706991937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=olmJVQs6Fj0bOEWwGX+Ub1OL1Mgz44D9aLSrI+AHs34=;
 b=ki8nPLcfYPdF4i/QonprbqXTti12/8M6EXa2ZR/q64gSHGM8pqvfTox8
 8z9CYITu0tVeUC9LMLxx+4bLtymi9n6Ch0G5VsNP0Ecj9+KKYXJeQqePi
 TzAiq7k1lkHZGCIxMgDTPRH0P+Qk9UXQ0NpksuiIECnXO+Qt4v6Q3yD+g
 AvThCX2rUbKEob4+4XzA4ZoIXQdX5MqfB1KUMe8UDjYPSPxX1vBkRVdhe
 /dwLEU3WrS8f2PHh44SfmkgPqY8fqp5ZL9l0R/+jyqlw6ZLc7WIfPJz4B
 XgySx8fiKvABYAuJjEJIGzmKtTe8vZqdWkMvFx+OaYLN7D73TI3VI7ksj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415059308"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="415059308"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659206851"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="659206851"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 03 Feb 2023 12:25:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:14 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0a9LRdwagWect3aZXKjnPX9WRg0zYpvY/yefO22b2Sm9RVelncF/mpKmVsDjMlgZc48xGwsv+8UE0zBCI8rS+9xiMM5Vd+inDtCcg5ObZ44j8AgsWP8DCC+cE5LtfMsue3sXKUc/ipQmHgvI/GBIe+NSVYmk4hGkbFfKbiA/K/FdLvGdTiSLl9bmHHllMLfUuqkde5iKpxDZoltHdJa3kZkKnqsHkBZSITgBZk1GfEX7IKEvPAZUfMG4sxdn02hsq3YjoAeagf6fJ91S6+Qawhzab2224uAWslsGcXYwJWYj3jq11AohSX4MGNLJyi1Wjeh3wWRHOsH/m9c6WgCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpGDgdTLDF59X0M4NFi/3taCMK6lyNkDW0M+CxI+33s=;
 b=MJK1CS6/qPKnGKYXQIrErVnpPj73Ox1YBuhOLAe1NBcbDeDTw2BqqCPOOr7fYfq1ppwojBMvRsOBOvKIkbKwBDAkU/W+6WW+OrhFurvC1P39aHFiackwwXjuCNRRD5BxBgYSqlMYkLK7dOTTotuqBGreWZhLsxNVNwY2lVML54OcSQnrzTEbxEzrlHdFNJSoxWrBmlZzAjF7+RcYuLaqClObe4XHLNmTyRSM5mKHKMhqUPuNzEdvzGkci0cZkOE7T4J858PQ/359ZoACTRxp/QS5Nyh+A9rHnVZlKuNu87LUVk/dIqTSkXf5CrmddlwGrgtlDOgegL1jZf6qa4gyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:25:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:01 -0500
Message-ID: <20230203202409.577032-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: ca72244c-7404-4c91-4038-08db0624bd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A02cvM60sSSf+tuJe2/CPE9ECiMTQ/QATDElt/lHzFOSk6j86LJvHJ4nUvWQSa6Y26E3w5DFtDWTI7mX1gODvYmMulL/LEgwc2UxcjzkgW9OfWO7L6SAXSC5SMzdumBubKVCOahCccvsJQGhAWN+9gb0brKg/k261BINgnTc5jsEBnKNLnBTHiUE3lhsgxQA7M6sP9Ber+XOP5z5LXIP4HyEDBYXFAmAN50HTzrxqxI2RQdeDMxcndzBdslTdrjmCJvOw4L8TGQ8ilZeyHTCF/hP18LLoCK02QO/TqIomd6ryr4Hwf4L4eyijrwXvw61M4jgbPFu5Z6lzXpmDH0btI0WBxrhCPAYHekLnklBnTp8yApqHfN4oxY5A7QLhXDi8BKr8XH/sYkKZQclgPENBjpl9P92tAOyOtilD9d67TUnigHjC5uM05aJUXf8MxfwrLkOStnxDmhBTcRghAiSXYmxklK94ERowOUMK3zIN5tV5tRVC/3ckcmKNyW1n5+ION8rofIisIaNYVusPljSSczq1viDJ7snMbNVYkQ4c0TG6oEjgchht1JlR7RLZThzvuPKj2DfGHTiUHa1nzYHeyRRoefM9ocHrc+HyKjfZFQCB1GBFPcjJtFxQ2IGXTYNa8gO50C7TV7K+QQKfc7GDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6666004)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SAbHCIhxfdJI+DmHH3TDHtcdI1x/0EuJmKM5q+1JStpoUo3AeMteUvnNEHt0?=
 =?us-ascii?Q?FXSLwwNOsc/0AkRJ1E+cueiYbTg1AKA5JselkiudT4MOpIhZIhqBL+BOnIKb?=
 =?us-ascii?Q?9hwqWgqa9R3CC8l8YtJog1F0D5bms+RNpwb4Aw3fI223uAs1aL/QNVFgXeeV?=
 =?us-ascii?Q?hTJw0WMICBMkiHiLLZlAqxoUMlRhsl0fz3sXZwLDjJoyjbQvB0uRehL3YSNN?=
 =?us-ascii?Q?I6GqmmLYvdCKJZNEbXJ/ANT0/olHjD1h0hDoO14VtrbSrwF36q291+WEDnz0?=
 =?us-ascii?Q?s5SQThH1SKxpYnCiW/5LHBeCq/O8BxMdAQLYTu1Aw0S5yqa7GV3ImxqBmgNM?=
 =?us-ascii?Q?kYCoJ/uTQsDkbHF+TYU1euc5l/Tp3yQ7JGFcUpLPhvv96NikrsZY2y71k3tK?=
 =?us-ascii?Q?6CM9IeR3tDUa8AQgZSTiD/mqTeMKGSiBTpinYXoeVi+uoy3T1+uJbV4JPFx0?=
 =?us-ascii?Q?ePBcANtV5smEuR5hya7zPZzCNnAQMbJCqZSKJbvPt2CiuTN1QgKPbdGLYCcB?=
 =?us-ascii?Q?HbYjGjgVhYT24jQELCXgI83J6t840IxsdadGIEW7xPLeO+4NjxB0XWqVf8Mf?=
 =?us-ascii?Q?wplYtGAoD9F7uXvEFqhdMrQ1cw1E44nk/lE3RffqtN3HwoI0xlX1V9tuzaV5?=
 =?us-ascii?Q?YLAydCrXWY2qYJC/Arcz1Gr3cMOVAqTC1CaXI26wOmll61W+IT8VpOZHJPGU?=
 =?us-ascii?Q?ypitzE/Fhhmfm8cbgs7t1lNE0YWh+Sm05+dS8aEgI0FSr+YLwvQsKHwHcL1B?=
 =?us-ascii?Q?CLYK0p+A3cCcRChpqiq8BtcfBp64Cptfu6ilAYi21Js1PQu7h0JMPcAkZvuc?=
 =?us-ascii?Q?gVUmZDpFXB2ULXl2D2Rqv0P1Q4ieg5MwZtKxthNAmYVdLrbX0unNpRAE4kd9?=
 =?us-ascii?Q?yoFPLUDXc2Q76FBdktjzlIpCSZ1BaiArUXrjjkgx/+b5UzI6uMxRZD0rP2QN?=
 =?us-ascii?Q?tqYRvFB6IOftB9nIKt8jadr3USPVJj4oZOOML1DZiyHJ2eaxCaBxYGIFsYaz?=
 =?us-ascii?Q?W3H4+HuPwy/GsaWHScoXs5ZoUjYrv+EvOXzdaAVoiHB5EhgNY+K5UcHuE9wx?=
 =?us-ascii?Q?m6V0eCCdBNr8/DMceZf+ZarjSoRpKNb7zBX4YQwCS5NWN4Ho0BHxHcPfCLZr?=
 =?us-ascii?Q?J6okovwyUcaB90FytITLAIs1G8rr3h+PyZ9hEQ0a5VKtmC4uv9CwBzb41Avx?=
 =?us-ascii?Q?bRCiy5RUCDyiM5u43XV5+qVOMfvYRalw7ADe58BIy5azEMo/ZD7t3WdvvrlW?=
 =?us-ascii?Q?nt1U518Fr1YRGi8NVFjWujDJIG8yb4ZRA1DxF+cefcYX+QxKwlBQ21e4i7rE?=
 =?us-ascii?Q?zTkvsBap+GceDrzK8jLr5ywbU8rgRarFVubiuOXnZmSP6l+9Si2n8mR5+brK?=
 =?us-ascii?Q?rxLG+KZkvyfW8Bfax0pi+iKhm5m4j/PP1B/8xv+7ufNpojyIfx6jDf5APhSw?=
 =?us-ascii?Q?hWpF9XBLJt4JSPikhipBWrLAaCIAYs3eJglpC3TrIHFwFcA4DHNXlCdVg6JU?=
 =?us-ascii?Q?x3A1cCiU2exhxgXRv0ZAMq/LiUyzFH3d3HuNjk7X/5EzAeHjXKfpjiB0TFek?=
 =?us-ascii?Q?HO1vyfm4/nvEiaDldnlM/ghaekcBQLWYuVvl1+hvYaMh6D+MM83/uvoO2kGH?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca72244c-7404-4c91-4038-08db0624bd68
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:07.2184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYKZNyku9Oc+8ElM1SQkJ+lGym1J0LeH2utq2RlsGy4LxodWr9PWUbCVE4KeW80t9jgEQQHLuINXlN0qv/iwDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 14/22] drm/xe: Propagate error from bind
 operations to async fence
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

If an bind operation fails we need to report it via the async fence.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ca2f7d084ceb..1bc680cdc249 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1583,6 +1583,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 
 struct async_op_fence {
 	struct dma_fence fence;
+	struct dma_fence *wait_fence;
 	struct dma_fence_cb cb;
 	struct xe_vm *vm;
 	wait_queue_head_t wq;
@@ -1610,8 +1611,10 @@ static void async_op_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	struct async_op_fence *afence =
 		container_of(cb, struct async_op_fence, cb);
 
+	afence->fence.error = afence->wait_fence->error;
 	dma_fence_signal(&afence->fence);
 	xe_vm_put(afence->vm);
+	dma_fence_put(afence->wait_fence);
 	dma_fence_put(&afence->fence);
 }
 
@@ -1627,13 +1630,17 @@ static void add_async_op_fence_cb(struct xe_vm *vm,
 		wake_up_all(&afence->wq);
 	}
 
+	afence->wait_fence = dma_fence_get(fence);
 	afence->vm = xe_vm_get(vm);
 	dma_fence_get(&afence->fence);
 	ret = dma_fence_add_callback(fence, &afence->cb, async_op_fence_cb);
-	if (ret == -ENOENT)
+	if (ret == -ENOENT) {
+		afence->fence.error = afence->wait_fence->error;
 		dma_fence_signal(&afence->fence);
+	}
 	if (ret) {
 		xe_vm_put(vm);
+		dma_fence_put(afence->wait_fence);
 		dma_fence_put(&afence->fence);
 	}
 	XE_WARN_ON(ret && ret != -ENOENT);
-- 
2.39.1

