Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EC5CD5BD1
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA86010E3D0;
	Tue, 19 Sep 2023 14:26:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE3210E3CE;
 Tue, 19 Sep 2023 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133585; x=1726669585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OX9lCMorT2by6X+JohvemJZrPnEkv2+tU0qb4VcoaQ4=;
 b=KTxkmwbu8+L+XcVkg+S24Nys6OZFOAurbyz16wjRVvqbY5ySrLVx1n2a
 QVyXD9OPMEzBz17qTsg60vhrngMiBBnc1rLCs4K040jjtjmdjtSUt5qnV
 HnlwXWGtxmhhAZJV81j+o3WdUoOs0hK6fF8+9b87ar236wij66tO05U5B
 QQoFbA92KIMz3q14hHGPJOZzD6CVMBQKzm943r+pmM/e4MX9muagwpx94
 YjckJNaM0BLuGoRLhM4XSLHAWC/GtLDnKkqqmIlJoHltpTukaZm6uOSaD
 x6C7GrDp9jvTm+RPdiQdjk0bB0VHu42VJltYFH8TuVM9kHkwEIm7s5EEb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786038"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786038"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319637"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319637"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcGrDSPeIizAHNlaf7yHRqaOwg5kumGtiBGexIl+geELyb5BpU4RyRejN1l9HDxh72VsYkaPVcy7QIHrwcb1h3kkoVr6fCJ5wII7+WZt0joMnPBceBhBQOP/l9HLDaoT00579EOD/9IR1WY/y3aYNqXS6PopBKImCrPuHvSlrdoOrh25Q4nydM32ktpYAr+XfqjjvV4hPCObI+k+RM0Dc30lx7UIb9qKE7p9wmZGe3hlOEV77KyrR2t2B5+a5B/YbiAeeo0KquUwHBCHeVSKaIYhnYVu/+fhKbk/i9YE/VY0bvjxpqaOqAYEBik7Nu/4Z1vteIF+G2S2LpxcJe4RNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/hqZHaX7HyiTcxosoQVXl55/tgHlxz7iDdFbDuS3eA=;
 b=eZvCioBjMYF5+Vsc79CgSZL7jGrelZI3pTksMInp34EZX8iJWOo0U1P1zrMKvXAOV8ZAD/LYeV27jAGXLy4h3l2cRhP/KxFDp2zGXIuzQqk2ePK35JT2BLscHTNEzaLWEVSeSP28OVFRpyMprRYJ6btgbpKvuZpkjJVBG3L+SegbH0VYxe+EH/TspgKfDeNJ7PXEXwycrk8KcEO2vptslJKCJ4AdwtLPByvlbetmN7V9KoVjRVr6w0Bv7T3s7VBPeXoUw4a1youlOlXnFCLlFqXuKcVurx0muVhMK6XrmYpf2iZcpLYkkDtLcHSMmytsVszfsn+yvuceah1S/Svcpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:25:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:51 -0400
Message-ID: <20230919142000.91363-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8141aa-f20e-45d5-3fb3-08dbb91c57b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldEmatbQffJUeH9ysWPStmONzf75YW4081Fg5foaY5YdCUrdjUgptMKJIFRJnsk+0FauvnTcOYDGHDImqhbclUNEE5OJOszzyK5Mq4HnlRwkaEMiO7ZHT7q3d7idcjxkJRDE/ekA9iHitXulhj9ZWZr/Fq7n1uato32ElwSxvER9JmlEWCa/zKhhEXkcFfrQtuLoZJpr/SxhxjUUcnDWh/lvOscjVEqL8mRHDV3PRY1hih5b+LFCgDo20nMMNNUeGB4yPxz0IcEeMGT0iJUjp0bOGfOpqBWtGXt3f42jiSxSz3sUlYEWS4dpMQ507vUlJgoXp6Q6jw9n9yM9tA0kRizFlRoU02C4eXDse5ZqZO6Ca5t/JuqFJSGwseFYAgAqctiup0OQaKML/besSerK9ykLcVNjuzHfH1y3W2y4H+mQ2sWJTpREkxlCAsYhWxzNHu7yhRfu5fGDrJxJB5n7EsxjpVokVHVMk+6aE2+MFXAWgq0chuAGz3s44tMRN/ez1TazQARYmjLFdzleimkxI+g2wDmfv8YbK4FGPQ/BE1hK+W/3Rw2sMZIJmqC69dQR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(450100002)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(38100700002)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ci5LMwVtCQo28heq0ON21taO4XmGDNXRhlecM70Ghr2xivQrXM854Lyy4P13?=
 =?us-ascii?Q?K1JyqR3DUMfuztr1mkJwDCwyQvDtYjW5GQ67SxVsUgKhfi2abd0yCZT75L4V?=
 =?us-ascii?Q?xSMkC5O/+oz3+Pvuww3usfp9iNJLUsMw+uF/peUfUyZrflO7LzomEu4XZORK?=
 =?us-ascii?Q?WRdMm4zbu9wDT51VnT6Zm0emrWH5trOmdPYopvtKkRu/yiU4P9Lc86TF/X5r?=
 =?us-ascii?Q?gyx2323uGbEKTdV3aCM3ET3W5HmFTUpSoThzszLKShFlkk/pUBJ73H7sHa6c?=
 =?us-ascii?Q?/aptqGyXQmdjlNDOJDYZlufy3gjWKJZWCMbvh+RrkUWGN876Uatts7lxfhGg?=
 =?us-ascii?Q?Wx1EEtfy4eJCPiDle5qfrhob99TAHfi85KO/8lzMvYlZUIVuYq4Tvw4iwBT9?=
 =?us-ascii?Q?BLCou6smhNl0+LlBhyaORrt19PZV+bDHwRxxdto8PJ8gyLDsAi0lkAeEbYj2?=
 =?us-ascii?Q?HdZ5s+LaeayT5zvRM4DrTK/VWyF15KffUvETupbt/Ox2GMpb75mm64sFU6dV?=
 =?us-ascii?Q?3pLnm5jBJ123NnS8jl1XSjVgfqi0jxcRPp3uD72OCyZtVphun416QiZwuJvk?=
 =?us-ascii?Q?km3pYzlTldu0t/Dd6LbSiDoRM/kqhgtz3v+x+veaEhi8VHR4H2mcgx68QrKb?=
 =?us-ascii?Q?72gyp3dCEtSGqfmTgTZ4YUKJSIC3LplZVXCtlkotc9w6tEPyEBIprHMgIB9i?=
 =?us-ascii?Q?Reogz8/8jX5gnCsj+z46Y8Omup2bTtLGxcCxcRQzjHbQsf3HUOqC+udZpmLh?=
 =?us-ascii?Q?Jywl8UpajBKE8dnZyZIgT2KjNYH13dOkY4OPbQmuBU9t0LakJiQosNa4nPiO?=
 =?us-ascii?Q?cfRN+EzxM0kENSqzAVZ0t3b4ADUcUu71bLFsQxMCQC8AgUUghU9n5iGU2Atg?=
 =?us-ascii?Q?occ9UfASctwGVcSJHTvg6HhUUeZuecQC5E332E1nSom985qa2ntce/DAfXwT?=
 =?us-ascii?Q?kj3fsh1uB2wcztxo+T/x/LF+jsYmuEl6hiq7eeuJP30qoYCfCog562Usj9XI?=
 =?us-ascii?Q?+BbLboDmGd9XsBi/rdEn92qA0HWO3qpnPs8wSmSmuQ3VZWrQ1U/xotcpMfXp?=
 =?us-ascii?Q?3z2PLEo5GHvnOuxJNQVfvMV08NJMT3HKkyeCwriDb3ur9dutxN2+w3YNyiOH?=
 =?us-ascii?Q?mNaI3/3LyFCrE9+E9/56HU0/dVK1EWgAsK1+PJ8TyR8n++coh9227tu3wQFd?=
 =?us-ascii?Q?QJwaa1ofrvf+mOliv1qh8SYZGfuf9EA/bB3PGmOM0RpAaqF4RitnIGn0U9zL?=
 =?us-ascii?Q?y9CYytyFE/ZRdSfCf0q+MzUJprnn/IxDoC2IE35uXXqSgRlbvud5fsFPBTfq?=
 =?us-ascii?Q?fGik2bVLo/pNkLJcaJhS4zUzKoeF0pSScYR9fE8YhLFQI6magkOYKoMfrsqW?=
 =?us-ascii?Q?wQM4LIWrcUZ56ybEGaZHpSsIsaAQvqdQ+sIItkIA+BcptVvfi/LZ80S7mHVh?=
 =?us-ascii?Q?mP/HB7PtFILCB7fPp566CtG3jw5rVT7ibR8obhH87WTSPEtpkImShU+UbOJg?=
 =?us-ascii?Q?XZPCnHFNm7a84rccqpYn4jGFFfNLn5dpVdvL4SQuZ9gBq5uNAZHADJuatZIw?=
 =?us-ascii?Q?hKGwShPwgDUM6mdX0gu8LSzthAYITXdzLy4LTiSDU+n1zyYv8gkNo2Yd5OF0?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8141aa-f20e-45d5-3fb3-08dbb91c57b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:58.6618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvz00ckCIUZnQtc8NDpzzQkkL0jUzFLhdC41pO7Jskvrg7siBI/mdlv0GhVuq+pU2A8tL7y8R5YTQEs6K1G6Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 08/16] drm-uapi/xe: Use common
 drm_xe_ext_set_property extension
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Use common drm_xe_ext_set_property extension")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h     | 21 +++------------------
 tests/intel/xe_exec_reset.c   | 10 +++++-----
 tests/intel/xe_exec_threads.c |  4 ++--
 tests/intel/xe_vm.c           |  2 +-
 4 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index a9060bcf8..66acf49c4 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -572,12 +572,11 @@ struct drm_xe_vm_bind_op_error_capture {
 	__u64 size;
 };
 
-/** struct drm_xe_ext_vm_set_property - VM set property extension */
-struct drm_xe_ext_vm_set_property {
+/** struct drm_xe_ext_set_property - XE set property extension */
+struct drm_xe_ext_set_property {
 	/** @base: base user extension */
 	struct xe_user_extension base;
 
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @property: property to set */
 	__u32 property;
 
@@ -593,6 +592,7 @@ struct drm_xe_ext_vm_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
+#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -757,21 +757,6 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_ext_exec_queue_set_property - exec queue set property extension */
-struct drm_xe_ext_exec_queue_set_property {
-	/** @base: base user extension */
-	struct xe_user_extension base;
-
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @value: property value */
-	__u64 value;
-};
-
 /**
  * struct drm_xe_exec_queue_set_property - exec queue set property
  *
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 68e17cc98..ca8d7cc13 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -185,13 +185,13 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property job_timeout = {
+		struct drm_xe_ext_set_property job_timeout = {
 			.base.next_extension = 0,
 			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 			.property = XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT,
 			.value = 50,
 		};
-		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
+		struct drm_xe_ext_set_property preempt_timeout = {
 			.base.next_extension = 0,
 			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
@@ -372,13 +372,13 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property job_timeout = {
+		struct drm_xe_ext_set_property job_timeout = {
 			.base.next_extension = 0,
 			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 			.property = XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT,
 			.value = 50,
 		};
-		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
+		struct drm_xe_ext_set_property preempt_timeout = {
 			.base.next_extension = 0,
 			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
@@ -540,7 +540,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	memset(data, 0, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
+		struct drm_xe_ext_set_property preempt_timeout = {
 			.base.next_extension = 0,
 			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 306d8113d..b22c9c052 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -518,7 +518,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
+		struct drm_xe_ext_set_property preempt_timeout = {
 			.base.next_extension = 0,
 			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
@@ -1054,7 +1054,7 @@ static void threads(int fd, int flags)
 	pthread_cond_init(&cond, 0);
 
 	if (flags & SHARED_VM) {
-		struct drm_xe_ext_vm_set_property ext = {
+		struct drm_xe_ext_set_property ext = {
 			.base.next_extension = 0,
 			.base.name = XE_VM_EXTENSION_SET_PROPERTY,
 			.property =
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index f96305851..75e7a384b 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -404,7 +404,7 @@ static void vm_async_ops_err(int fd, bool destroy)
 	};
 #define N_BINDS		32
 	struct drm_xe_vm_bind_op_error_capture capture = {};
-	struct drm_xe_ext_vm_set_property ext = {
+	struct drm_xe_ext_set_property ext = {
 		.base.next_extension = 0,
 		.base.name = XE_VM_EXTENSION_SET_PROPERTY,
 		.property = XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
-- 
2.41.0

