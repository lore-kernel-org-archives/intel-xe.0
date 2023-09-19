Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83F9CD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7069110E3C2;
	Tue, 19 Sep 2023 14:26:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B5210E3CF
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133585; x=1726669585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fuUMtd4++MSlTnC+6kbV1F39HSU1O+xPqJY/YD7jwhg=;
 b=boj8frY4Mmf9T6GolqSmM6RbQ/eIHhEAy7f7A7qiOy7mSOO2WOmT6Srg
 tQMCfBQoeYI7pUXel0ph7xBZ1RpOqFF/dzt+8lsURnKHqNPWSIMs8Bsd3
 oCAN+cG//O6a0FgvlyColk5TD92D7GeZDjrRGatrp4/q5pHrxlSqkHrIp
 fevip/MyWgkM1Z9Z+BbFKzOapxisBrDSExGhaoepWEvduEkbRSPhIBXNW
 mUIUiDA8WXPFgVtrFWZTyN2bwn+QaPneaGj3cjj2QuAaPdxMwNK9FE8iz
 OD/YjhGVyeXnOM7R2Fiq5iiTj19mHS45BQLmlWx3hoYYzabCFxVnAstcS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278880"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278880"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="775574754"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="775574754"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgrxjBG0ZUTeGIiTCZZSoWTdMatPyx3+CEP9oauDS7kMxbfz2O4klKEH4pVoEgXPyThmdTgPsxguTMQS6O9ToA6oIsJfY/ekQEQXx83Lwl/RNaI2DDxtz0oAAURrJE8ORq+OLwnERAgJP64RK0T0fQOvhpOo/7OaMn+euQ6ai5Mh6nt4n91uxsBAVPanBifgyGRmyDc5YL9zoDqNn8o/wOAn6ukImgQsb4L7c5CAMGKy1X+8k+6FaxVNWCaXpyjXhnSHi0sFXXHZzzTam5uUfYShsD279rnIzy9OBirR02OFaCppOboHaE60JJL0MYBbK3Me7fJK9kz4ciGoPOko7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJCFPXxuj3621oFkjcyNXcZac7JK2gDKF9un/996kVo=;
 b=SZzsz2Nv7qdIwwhf5NF9Jg3zjGKYZ36LNj7DNpFMhDm63Cw5R6ScmEgNIrVllGI/aH20o0oJJWD4oX3rdcwEwrH1oaQFnuyIgMVSgeR8/gfehw5zLRdC5az4dlY5GgK27SFMaeLwdWEpzTgDUa5PwddxpzN8A/pthGfczn3YneFWvqOAzHwEwqoykk4vPQUyFKpoiHz4eyQf72NDkqFGw4acV0NJnqwC1S9jwlTJd+wUPckEWg5Bo5QDOg4dKKoNipa385enXFYOhPVa5BzP1Njo2EzxopcwJF8GSeYFKNAI5I83Prhi6l2Bov88pwznmcRGSye5uHYdgyTrTrIOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:58 -0400
Message-ID: <20230919142504.91652-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3ff214-fcee-439f-086a-08dbb91c6501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdG8A7P29Q0B2bFyFl+Atg01H7Z3fuR2JThEcnPRpvMjo8HO4Iv1vjf4yoUv9YPcK5XxE+zbiSH3K9FJpko3PAra/aSv4Kx9d3r8Ya2WFcpZdw7PT5qwQ4FJOKqNtJOEaNahDaKNB4PQk0vvhk6MoBrfknv2QuinowZ0+UVHx4bgSw9a9ECmzQImuFSnkaIlF5Ia8Lg+iAyfh1njlcdeBrKEDJAbpzXrzBMqxwh18yaYyqQ5oK3dj7tQRNoHagKfwgxY69THCsr6R9HXBSvpibQsdQbNtb4YHV78W0cpNRlTNpcjD+wvNrpqOMsBQj2AWM6c7Kznm83wJRM93rSsvbSEpqgJZTPAz9lNnK9WcMatjBjWD9WxuACJp22CR5e/iMrgxb3/iutLaQI6o+ekVZXffGBc5dSFxW3PicY5o2VwUryt29/5Pbzkf6I1XJ5mkY9Jap5I8+exxJIePZ/9JUNMufhFMeU1dQcGmmNQYHSbDYO9rO/bmc5oZVuQaJXsFTzLJOK2mAQJJC7dQyOsSFaLOINcKm6/Rf61xFZ3JBc6c9vzX8S+auvM2cdnj2cC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MWruLDNBQkGdeW2z69qQUPr+eTTxigWHSflo/Ot3muvL0qRs69kzj4k0knru?=
 =?us-ascii?Q?7jJTd/imy34UCdoTmZxWi0d1dNfftnwJW2PwgfbQMANED1eMU++qWMyHYmf3?=
 =?us-ascii?Q?Ry/LmjwZfKh/1qotq7RhFR/LSD0scWVA0sg3gvItPqs8Al/4nMONW9o5tOve?=
 =?us-ascii?Q?azkU6wtuEOpvLIGI025ifCG2SJblBRzScSvthAGWu9aiC35+WoMkb+RFHrnd?=
 =?us-ascii?Q?jXPnrS29ijXnKRJQokLkzG9Dr3gxQtxPLe55JeRw3y3IoLUk9UcPZigucRiO?=
 =?us-ascii?Q?gc7Qs2YRuWXjlNIGJaS2RyEmzZg7vIfOrS0DDQRZtX5UcadbOXIr1sS8DPpn?=
 =?us-ascii?Q?l0FZLEhTVOM4pL+TgtckeQc4VSC/ubFo5IthHCg8HHB0dhuCupnkEUW4rPlg?=
 =?us-ascii?Q?z0c3FCHXtcOOrv/4k3yhN0b0n55o7MzoXpoSCGybF8SQgR/0bZ0vBSZRJXCO?=
 =?us-ascii?Q?USpDq1DfKlyStp0XcWwwPd22x0NL+jrDN2Z8i46q6moE+7lwZFslXbtMU3Uq?=
 =?us-ascii?Q?iXMANC/WtDIz+L+SZGlKKDbXuTsx3iwXxL4uGejFnWPiek5moa1Tw0Ix0WHG?=
 =?us-ascii?Q?r+RjkAuBHmZQmc/zHtiUjzp0l8oF41T/j1KtxJYgTyxDQB0tGb1IYaqVIUTs?=
 =?us-ascii?Q?FvPCcrU9f/kx+GxEsHJHl/mG3D5ufJvEY+mYYMJ1NcH312qPzQ+9cv8uO6OR?=
 =?us-ascii?Q?8KYiiPZM93y23oFarRRJQhHVmUPsV7B4N1qTNiDHHXBf7tZAwt0ZojMKrZul?=
 =?us-ascii?Q?r0OGhYKDUvcHe/PdhbxrUIZrgRtM2i36+nWZ7GYMqnVkRCSCrcSVR4LTSzVf?=
 =?us-ascii?Q?CH4eE9Spe1O6+PXOlRr81S31kdWxQbX8sVMISWBr+k55JPd/lKQ5HU2V4HjL?=
 =?us-ascii?Q?xGPfp6kJ7KODddHGzC74elQweoc4W3e2kL72qWCpdr9sci64IS8Dw4t8LKGA?=
 =?us-ascii?Q?TuBWiZwAX4Rh+Tk0zT5J9xVp7FHSzCF/VLFrLf9FJl8BcKh3pNOJBCp7xN+Z?=
 =?us-ascii?Q?GQFkd0QjeR8+ZcrT2TdQkUzQ2GJz9DIJwLzFvIhVbpI5tgwYbq9JQb/r8fy1?=
 =?us-ascii?Q?FzziymMzlaA/EUuFNs1RE9GDEHw4GwSDQhbEd3IQhugTGqCiEQHH4X6HMj6Y?=
 =?us-ascii?Q?rMbhMUfA9mTuwdVj/yFZRLs7BNHWHPWyIxgD4rAiPoK9LzakNJkpB8ZLbO1X?=
 =?us-ascii?Q?R/K+pbOuKGJUfGE4HA9kYMpaRO3VT6mcBohM45TgLCUBLOCXkmkmTTWJ9ZCu?=
 =?us-ascii?Q?0eS/GRyrUvRU/gAmm8uU46HzH8XBasW2cetWJiTrb7LLTlj/T0GN5QeMmePj?=
 =?us-ascii?Q?GGXVNSxlxWREpp/Vz4/rVzHFO2fkLj+0/x+N+qrwUqywgbzQk31+uS8tpe4I?=
 =?us-ascii?Q?W6zvx6T3kW100Wd6PJkLMLyt+N2CkwRu4z2Er4tUKMNCUCZF0TnaqyXjjMeH?=
 =?us-ascii?Q?6e9zC1k8kgHBl8URXkOCc3fqrp+bicOTuD8bI/tPcYAgaQI2E/aM7Acb+DHB?=
 =?us-ascii?Q?Xs01zLP9b7beB5uK8KoSw7gju8adV1JgzdP8zaXJorBDXDBzze3j+GaZM4dv?=
 =?us-ascii?Q?r2tvGVPAG3vBVtpWgz1kwAHCfhbUdPKLB6Cm3q/3CM2OcwG4Uo6o14DyBseT?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3ff214-fcee-439f-086a-08dbb91c6501
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:21.0943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APKT9UVxIRmk8ziWnOGxgBSss4H6r5yjVh8rJsD4ywwJ6jP0nYvOKTQtGkfgJ9SL4d/+E/fmHGfJDvTM+i50Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 11/17] drm/xe/uapi: Use common
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

There really is no difference between 'struct drm_xe_ext_vm_set_property'
and 'struct drm_xe_ext_exec_queue_set_property', they are extensions which
specify a <property, value> pair. Replace the two extensions with a single
common 'struct drm_xe_ext_set_property' extension. The rationale is that
rather than have each XE module (including future modules) invent their own
property/value extensions, all XE modules use a common set_property
extension when possible.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         |  2 +-
 include/uapi/drm/xe_drm.h          | 21 +++------------------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index f70332986c73..411ba38cb2b8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -418,7 +418,7 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    bool create)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_exec_queue_set_property ext;
+	struct drm_xe_ext_set_property ext;
 	int err;
 	u32 idx;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2af331cf2d35..33a02aca8971 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1935,7 +1935,7 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
 				    u64 extension)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_vm_set_property ext;
+	struct drm_xe_ext_set_property ext;
 	int err;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index fb7c3a8ac572..8be3b25928bd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
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
-- 
2.41.0

