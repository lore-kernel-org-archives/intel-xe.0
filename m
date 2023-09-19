Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC9DCD5BC9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B3A10E3C5;
	Tue, 19 Sep 2023 14:26:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBCA10E3C3
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133582; x=1726669582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QULVrm3IG2oLZHvKDU7m1e3m0srDDDS/tnyN7gdxVtQ=;
 b=HNeUJPOJIbNTa3rd0WZTnb33ezeFpx5BsIpvN8i1ILQD+40y8aY6Lrt0
 sV5QAEtIwzIRppW+sJtlhtCwDVBThd96vu+ycENecvg4rBhp10BHlt5iS
 4IDv6eYNiBso0Ld+kWjT7GZgLEfRhjtD1qiW1b5Agyf+Ralfejs7jell8
 oF9WrtKPZaYbrCgeAsPRdUdAwZLEWYBIaBsAiI4TfrfgaDyBthCdnTsIq
 J/V0GjQ+zmMdveKa00QDyJqSMhSqx/X3PAqmiD0OIH8x7yOqxbW1umOnP
 D8BBOPq5BpHk73qj8qNj2R5db4F/o7BAUdGw5wgeCH1/x/SgJ+jj5Slcu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278854"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="775574716"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="775574716"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oON1HVA4J9cJTZ4vn0kxH59ou1lxD337hX6wKlMcwkQQR18v2zBtuRLIetzJBHzwvFlDusu/RuACBCExb9m09u3JzoDa2I9wNO7A7EZftWJ38sOydb9F2GOKh/uiLw998NiaC7HNYMhb0nhdBcD3I4rLejMulsGNY3F6ruCztb6MPfSlVokiLZ8fFsawJ6M9rvaXKq7zkNyE3w54geO4XKa1L0paNhWIL8oLj3BMyARLDiXnLwUrOEU1WZJNMtbKN//vsNENEvx7IJMluanZsI1O2XztjTcsQ8WrlU5vd0n39y/GySyhlGZe6qGhoPeSz1zpwiP413oVOaCW/lwgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aev34/yiF8jC0BIrnz9DqwI4Z2bLA7tA5l/xnX8KMdc=;
 b=YJQiBRWXwOdRIGxffOkIcoIDtReFJnP9XOAs1akzviTXMS45LIwZURoan03Wy4uHVEeut65SnOQv1wbYH0CUw7+mM5gRAykVl+i/ht9BPyFEyIiTLlshZ6VZbn+OL/XUV16UndHNT3kJVJYkyFe+y1RZ67ewAJS/33oGBItavztLHBLciFgj5/Awn5Be8dJFK6wWReVc3gyYHJPOmfE0Yjpm48RysjKUjbVB4xJGqRtO1GCWRynEF4E5B2SpMrHnCOzLKPfZ+/9TLuJtbCqHYheDFr88PKTLPomhHLDn3EmcorPExgOYAOqeAxHnqmcde7TWW60EFn4683lG+86WmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:17 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:57 -0400
Message-ID: <20230919142504.91652-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd19dc7-8a9f-4305-b538-08dbb91c62aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQE1C37e+oDiOwr27TWUlLrLxcAtYdKDaoqSSOD9gdWJG/Y+/9nNA1IsRJCf1WZit0Xrnh+hYbEuhCCCWvJZmW7YwDYKZUMBFsDbLBtpOZiuAqzkAmgBUx7gh3j99MHRiA6nBAlTQYOCKQhV7n2LjUjW5kWLMw5ZRfqDzISfi8dFYdsKEHAEnXVgj+JyF0wKvekEpig7q7sL3kcTm1AkJtFrccYJ+KLmkW8duJFykqqVs+0IqaSfi5ofnrRU6iw706Ce4LgAID4GSbGXb9n7j3QEteXWsjS5qDTRQDdnELEGPMZcUqY5S9xk40zhrPS3fv4vyT25e+NuCz6JUM9YJfPd0sTkQCPys4UPoncYjsSvWKy1/qUWkgJQpzOR3MRPm+6ak074TaK5DUiWrjYe8fDzT3sZ2gRA+JGhS8Vc8nOQItOnywzcFjUzdlxgJji8p8rC7I86o8ojsbzt2h4n9wR5fHpA/SxvVsv5+RUbXQH2dn+qJ7HRSCTCbik59pz+sEAuJKmcXwv054RtDtt1D3l0Qr40wL7HqD64lGdfPUceKn4SrQVZRf2TZq8boYC1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U7sev45ybczdk6p7/JEZJYSDyMqKMLYe9Qjhvkgw8P2s4l+m3vD1hmEXMlDg?=
 =?us-ascii?Q?G/zI8SFnqmBApEmQIu8aCvuPyGAiGOl0mUDPL+aYjAKlTo2NB9lcJdvsfzDT?=
 =?us-ascii?Q?lQnmfhqBxnYo9OMxTlPyRB01vRLyJOz0sH6+OcS79WErpJTksEH6DIYctq/v?=
 =?us-ascii?Q?oBT0mUGUcjyin2vzZQb2uamMUYl8h+ZzvfFDc/YLmiBMM4L48LiEp66Di+fq?=
 =?us-ascii?Q?mK0YflsdkzmLF9nUFtUwQb20W8FtyhGf5YR6HPe8hSAzl1KDsinMRVESqz5g?=
 =?us-ascii?Q?0rUPPOJzdpApFvBmAvEYU5Qp0ha/MQoeRUvZwsTspGU+muA5yShGnayVOnzg?=
 =?us-ascii?Q?A5Lk6yU/Af0EROgkC9kSyo8P1DqcwlX+qbU04XdyWxDOpDwGz4vvW0QEQeze?=
 =?us-ascii?Q?rqx+J3MGxReiiR+ajwEQ6uT7qMJO11+X1ZvSYFl8tVpf9cqSWe3KF6GZ2ejK?=
 =?us-ascii?Q?ksM1I4jFbR0pRFR59qcwhznSNFVKvU5xILs5DF60GbbWv/F3ZnyqoHR/3Iuo?=
 =?us-ascii?Q?VGqVTecqkGKoYXKagcTApGFCYYFKe0QkKcKE3kaZFUeZTqw9kzh5SCOpb5NY?=
 =?us-ascii?Q?RfKJiDoj65/KME3UR4QmbFFA82bwnoTq5rX3B419a/7KjvWMMvrOULQ/TCD3?=
 =?us-ascii?Q?+Xvh+DvZ/v1wbL6LdfRKGOdzdti26OmvrJZyRGxb8MHodhC9uIY1csZfXDi1?=
 =?us-ascii?Q?hvAKPEMsXuTZ30faJCFTFtc3VNSaDs6jyHEV5DcCzfU5vaSRFE3vbpK82sgG?=
 =?us-ascii?Q?U+YWyRXDCkTIUtqOFY4kFOGd9jeiDfj/Kf0C7L+S5RI0+naBmljO4YTFKU9j?=
 =?us-ascii?Q?HpP/Wv5XSKVmGxG1xWqexM2k5WJ2uAyMPg6e8xLUxJVbGdteaxI9obRzAd/N?=
 =?us-ascii?Q?E3Uxn0BhwViPMifhvj5xIO9vAUbfxdnPlXP/CI0r1s0LdMlJ/w2zxG4NUrXc?=
 =?us-ascii?Q?eKWyaHxu1phVT+8boRzS893jD4nbVkn8nuWOnX29K7gEkyU1EpFhI56dsR57?=
 =?us-ascii?Q?57bK6kfQUByUHTzhsebcvEa+4mZy7iVNETehC2e+cTOUJ+0flEz63nxAWgt5?=
 =?us-ascii?Q?I9tCKijlekxb+A9g0XjyxHAa2PeGvjATZwha3A9XWnmNFOIOn5obJleBofHk?=
 =?us-ascii?Q?GfIGeT1lX9+OnzzIDUaHfT/1aBx8EjMYj22am2RP087v6hTP1wFlFqEHiMq2?=
 =?us-ascii?Q?N/wCcuFcwklJll/FbRnuP9CITFTE1riARNhkUmNJVhVNShf7RXJ7uNTHWy0T?=
 =?us-ascii?Q?vyMRfxO9AFVW9fhX8fNaMMYQ+zQdYPTutivgKJQnf6BMwG7Nwwsljrnu4V44?=
 =?us-ascii?Q?1B4CV0lHShRkukIgAYRc0VupyOXT65Ft46ebRnaR1nLgH8hdGuvdEBzbT7Fs?=
 =?us-ascii?Q?qhgBnjymmFr5B/hUEzLxjKvYIFc+d/XAOj8upHhlbFlJb73HxaGKwfiklXqK?=
 =?us-ascii?Q?n9gPenaWW8pEYm7gaX+cZZ6gg3GgOafDQodNd3ucYJjgrdeus/QW5u+I6EkG?=
 =?us-ascii?Q?kanslsIpr0Sv2AX5Oivkbd7cKIersvE+leEKunzy90UflheFbVlO48rgcaKX?=
 =?us-ascii?Q?CKqIL4XVUNo341lm+4uRGdHZwRy8bqHPTIXzmRyKEfMaz8MaCgZHMgX0NSr+?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd19dc7-8a9f-4305-b538-08dbb91c62aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:17.0901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqT3S4r7CXF3G6h4txkxtxvg5KiPj/l7MbDWIqbpmzUfeLZDljM+ZFOFKSV0huIA9noHYrk5D4PIQYffAV6iGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 10/17] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Functionality of XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE deprecated in a
previous patch, drop from uAPI. The property is just simply inherented
from the VM.

v2:
 - Update commit message (Niranjana)

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  7 -------
 include/uapi/drm/xe_drm.h          | 19 ++++++-------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 170d9d9c48d2..f70332986c73 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -320,12 +320,6 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
 	return q->ops->set_preempt_timeout(q, value);
 }
 
-static int exec_queue_set_compute_mode(struct xe_device *xe, struct xe_exec_queue *q,
-				       u64 value, bool create)
-{
-	return 0;
-}
-
 static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 value, bool create)
 {
@@ -411,7 +405,6 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
 	[XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
-	[XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE] = exec_queue_set_compute_mode,
 	[XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
 	[XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
 	[XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e39d66a65c89..fb7c3a8ac572 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -784,21 +784,14 @@ struct drm_xe_exec_queue_set_property {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
 
-#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
+#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-	/*
-	 * Long running or ULLS engine mode. DMA fences not allowed in this
-	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
-	 * as a sanity check the UMD knows what it is doing. Can only be set at
-	 * engine create time.
-	 */
-#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
-#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
-#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
+#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
 	/** @property: property to set */
 	__u32 property;
 
-- 
2.41.0

