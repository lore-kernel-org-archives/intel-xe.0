Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614D4C04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3601D10E546;
	Wed, 20 Sep 2023 19:31:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E77110E54D
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238286; x=1726774286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XFrE/ov/5VekkmztXCgODCUKG/nbLxxhH2g3HLY4pUQ=;
 b=AVfpmubrTdWrsjzzXxq4Cbi9wQRydV9lBpYoKoycOiylZB/Dx4nCwnTP
 BZcrDXDQuM1aBiIMUpjf6fP0j/GHL6hJWmHgWf3OAUrVg8Ulrc8+TwzwV
 /Lmrh77c9yi2yTRF7yp4vFyXuwzN2/jjuyDIwwC/wIWFypl12u/WpJkjl
 zGfp5Xv0It1AKRT7Hqq6ucnvRCSBugUR7h0raYCRu4gFPi+WN/6/WVnT8
 T87Clar6hAxh1HGhBS226MmtVTNsYgMRdx8GALlb6kNBhbomzp8KDlnEU
 oV2A467sx/jrT78TjRThP9np7pmQfhasCe8PUCWnKG3xznYt50u28HiCu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701497"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701497"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870499031"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870499031"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:31:13 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:31:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:31:12 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZOF2FWkFnwHdfMwI3sG2YU3BvzhBqEGyVvyWsk7gCvOp+qWQRGq2sZTJw8PSFHuRGcciVVupPUvj4uAbPb7nwhyyMTxjxJHhvCulJ1pLgY2cb5D/4n28x3qYZHI+eMPryfp3J5zuz7PhmIyvM0ndvC2RaNleBeyZr3Sh0ACrk490aXSjwx/4d5fqY6n0iFATM2htRz1FeRab3tn7mRWRcI2vJ8wg6C4ZqEtfL6YDVdp7WsSNKZPqo8hGmnUwbd/26/1t0Mss6d9YvYKjc9cbR4rMCTZylqtUIMdUcToIEADwhtjeGKoqwGmU9iFVLLvjRXuyDPLptAQYa7+wX/zYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z9buJ6DANsm+Ebklm0aJfcCMr7Auy8645g61uWwdPI=;
 b=B/yKQURfWIQAB2X8MifMSrRwXTnKLDhrYQjeebZ8oQf/X2/YMhV/k3jttIaXfsVIHNPhn33H16r9j8WZWuUMw+hwLtSBeccleuRgY9ShBNfzIYpBfjvHTFTPcaFlQse+gnW9REf+zofvTX2qVAmHRzW4ABbabpCBtuAPT+Ut9lwFF5Dlg7t1STURP1gesUGLlvRYGzpf6r/ZAiYzcYRpudIzEbnIpVX7/wbkV147ThIj2q92UYFLZ5LwrRz691Xr2R5h+pRm2n/XvA8TcKrGMSe0ILEyiGegC5vKIWQqtPfV8gT+OhuQCto8zxmXJNPDBziiGm1d+YearWtSe/RTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:39 -0400
Message-ID: <20230920192940.135004-20-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: 0553c6f6-2f16-465f-99bb-08dbba101d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzpu6IqNUMt55yXRQYREKAkpZRZzVP40nkkWSWr6qf3E5uAI7Kb7DPJSjXkqsqykeNyKAOPkVWNigN8mxVm/ZpFjZ1MF1PM+QEkiJwxTfsCSpj3i1GeUAFHwWexY2Fc9SOiI1sgkDu37PZSWOCcFmukkdrjjVFkwiVZr1x2neBykH+IGCFpwwj6HG3IbOFiZsoMw2zm/MGzDOUDWI8zXlQC+MWHQGF3qGzo/7kNqAQTorzas5K7f/C3+0gr9/3Sth66v+I+ZoWiJSnewnOIQrWQMJwabQeD9OXEMWK9JtVbBNc8OhDxI0q61ovTIhJrXHpB31klnJ4x9MWwiueawDoyJgRD1SqYRdk12WjYpMO6elgF9mQ+6viX6AtVjRCMa0mzUpn7PCinvXkT5cF4Sds3iuKxlMGT64W0mncWBJrAPIClbUSzg/qOSPnD/SscmpavK97LRplBZgSaYlCHZLL2b+Rg69uqhChBr5hA9grmwcmWwZrjylp9ou5cBZEs1DXIMIBTC//q+CTjLbJT7qM25Nt4K6jLg2PFn+EEZ+pNPdKu4xoaVb3gTpxYgS0qo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(186009)(1800799009)(451199024)(6666004)(6512007)(6486002)(6506007)(86362001)(41300700001)(54906003)(66476007)(66946007)(6916009)(316002)(478600001)(66556008)(38100700002)(82960400001)(107886003)(1076003)(8936002)(8676002)(4326008)(36756003)(26005)(44832011)(5660300002)(83380400001)(2616005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUUw+etfV+GHdnuYHin6IstTzdl9eK5eyGMWx4Y/PC7wWw5K1UnouyMESV++?=
 =?us-ascii?Q?oitFPmIVlzJOyZb84TBFub9PaUF6JVCMhIkKyULvmOHDbmEZHrcq3q8aJyUJ?=
 =?us-ascii?Q?0RPPHvp9ieZg5oW4o0ptSi5MQh97yNV1iHweMRNr0utBn3Nl+5QxxhFKLz+W?=
 =?us-ascii?Q?Zisc69Q/9C++spc3WXtNaYdMctryOmMXhOEbbkAHFVQpMostZMtUo4TsqX28?=
 =?us-ascii?Q?ZCcGhuph3QhIO3ynWReoTUkjUA1eHLJkMKbfRngfAdoiwua3flrjjYsBCtBC?=
 =?us-ascii?Q?iwAb9Du/XNjbrWu2tWGxwFCj+QWB2XfbMubK1/jjJ3g43w3baYcxHrI/dLan?=
 =?us-ascii?Q?R4A7dlXXvVGH7in9db2o3vDUg7Ai6LFChYGbckLOkUa3Kot1UGF4gC9ABgZH?=
 =?us-ascii?Q?CIL/O5sWnRh2iLeAxuxn+aPNeKB8k3Eg8YlnHtbUSNpBfOn+GgTwAJCrZDgr?=
 =?us-ascii?Q?aaML30+ilQv/jvYP2SsagG8wKtBK/A+aNvAo2MayZv2Y1BJapFrVn60tbTrg?=
 =?us-ascii?Q?gAIgK+LBZuVLhldbsz5Pbqnb1gEM1coO70mi3tzTxNpuFFGw7GQNl9pFL1Tx?=
 =?us-ascii?Q?RP3wanY4naVyTpMHlLsvSISskVLxyhvUWCZCdpjkQ+8TOtyJc/o2hQtOqEKV?=
 =?us-ascii?Q?EXjvfPRRNWvAzHttq5AADbpnUSeSJ96bNZwdlGCqEpc+2MXfcBn8teIXa+gp?=
 =?us-ascii?Q?cPHBb0VA5KRz8AzUYcm1Fm60Ah+f7jT7hmXWlVAkPHMaSVdmSixUzqk1spoy?=
 =?us-ascii?Q?n1krrZTYtKeoKf3hx31bt9hN2eJG2RsNUxYmKrG056sNewtGh6j4Ziz5xsHB?=
 =?us-ascii?Q?a54QLytPL5VHSwqveC98U/IxkArXsHAV607mLt5svnD0IA24DEktnwp1B6Vv?=
 =?us-ascii?Q?OfjHUyBczVZXb8vJsSV/OV0wP8j/LMF7LZO0JjAz8mHHaDQg8FpjkYijNcZx?=
 =?us-ascii?Q?cv0u6zJTrrIPd2W74EAFaUXC7kYxiFVs01X+7nyDG4js+bKCF033tBqu2BbU?=
 =?us-ascii?Q?q7ab9pMfHzBTYWEOeiPkx8i59ibUL5NpOtthucArjRLZsaT/wodigrydr9nz?=
 =?us-ascii?Q?GUINAgeuqpiArXTnzCBPH6lyk8csdMT+rY89Jahr5O39ioZ51A6VvWhFRICY?=
 =?us-ascii?Q?9JImUj/ZyYbZzI/mTaazSX3S67i7Lc1YgKXPuj5hf2CyYncqmN4grUMovOn8?=
 =?us-ascii?Q?WefGg+mV98bllCCIYTC5NucNlV9nou9Jxs09aSMFw/NgZszhFEHjGp+kfAM5?=
 =?us-ascii?Q?Va1XYa0hxYkNEe2ClCMh2m2g8+q+BegHagzHUJEdSlMlkoPuZ33HJqNbrR5N?=
 =?us-ascii?Q?s3AgbzntYRlR3v6tUW57vYQi9kb2k6wbYtnCDIpw8e52EIia+1o0G5KUtQby?=
 =?us-ascii?Q?cVOoFnRLAMqRMZWwAF/dtDj/wsiBsNjHiuECUbrAOX7/R7831NvdzRNl+lkj?=
 =?us-ascii?Q?rDJ2aPhEuGsnupbsct//XLm4tkSVYpQmUuNWZBGrYt8FPeGW0zHNyuZRIP6W?=
 =?us-ascii?Q?lCP/dCMRu6CS32V+xVqKjvLB421nncHN/R4KfU9g+hgvpqZ64rhLRfnlE3Ou?=
 =?us-ascii?Q?g3qvhiDoPDoLuPXQYL0q2NPJbWT5NT80EepnuApCtIj31iRTw4UEMKBgaYRP?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0553c6f6-2f16-465f-99bb-08dbba101d8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:58.3982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBuJpNt1ByZtL4aEQOVENZS06Q8ZC1K1gFee+gF8RMNcz0ig5c6mNYyrQcmGwok16a7TsOoGKVr02cSpu4KDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference Clock
 updates
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

First of all, let's remove the duplication.
But also, let's rename it to remove the word 'frequency'
out of it. In general, the first thing people think of frequency
is the frequency in which the GTs are operating to execute the
GPU instructions.

While this frequency here is a crystal reference clock frequency
which is the base of everything else, and in this case of this
uAPI it is used to calculate a better and precise timestamp.

Cc: Matt Roper <matthew.d.roper@intel.com>
Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c |  5 ++---
 include/uapi/drm/xe_drm.h     | 10 ++++------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a27b10583f5a..8184df4abde1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -149,7 +149,7 @@ query_cs_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	resp.cs_frequency = gt->info.clock_freq;
+	resp.cs_reference_clock = gt->info.clock_freq;
 
 	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -167,7 +167,7 @@ query_cs_cycles(struct xe_device *xe,
 	resp.width = 36;
 
 	/* Only write to the output fields of user query */
-	if (put_user(resp.cs_frequency, &query_ptr->cs_frequency))
+	if (put_user(resp.cs_reference_clock, &query_ptr->cs_reference_clock))
 		return -EFAULT;
 
 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
@@ -380,7 +380,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		else
 			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
 		gt_list->gt_list[id].gt_id = gt->info.id;
-		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
 			gt_list->gt_list[id].native_mem_regions = 0x1;
 		else
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 45ec20c2765d..5156bac84f20 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -248,8 +248,8 @@ struct drm_xe_query_mem_region {
  * relevant GPU timestamp. clockid is used to return the specific CPU
  * timestamp.
  *
- * The query returns the command streamer cycles and the frequency that can
- * be used to calculate the command streamer timestamp. In addition the
+ * The query returns the command streamer cycles and the reference clock that
+ * can be used to calculate the command streamer timestamp. In addition the
  * query returns a set of cpu timestamps that indicate when the command
  * streamer cycle count was captured.
  */
@@ -266,8 +266,8 @@ struct drm_xe_query_cs_cycles {
 	 */
 	__u64 cs_cycles;
 
-	/** Frequency of the cs cycles in Hz. */
-	__u64 cs_frequency;
+	/** Reference Clock of the cs cycles in Hz. */
+	__u64 cs_reference_clock;
 
 	/**
 	 * CPU timestamp in ns. The timestamp is captured before reading the
@@ -381,8 +381,6 @@ struct drm_xe_query_gt {
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-	/** @clock_freq: A clock frequency for timestamp */
-	__u32 clock_freq;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
-- 
2.41.0

