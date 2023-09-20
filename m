Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A72C04FF3
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B1A10E53F;
	Wed, 20 Sep 2023 19:30:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B7310E53F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238238; x=1726774238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Y5H7mKc357y+8WwrdetOn4lFr6dkHwD87lKERbO+50o=;
 b=U086lYezEJSqOpEYuqdV7oFcH9HHEaWqAlo97PVgu77Me1XUp6tdIfvQ
 zrVn9NdRKX3SgmrYdaug7WdJg1nztIBzxCmgeC5/RcPox3h5Van9sMkIk
 DCgoDj5yvbbS+jfI8MnkU9ZNwxUg5UGNlmuqGE5Oli0ZM5kdNktSJxrXx
 NAjmx4JmD6mfAd5ZPnT0VJEjLeghEq6EJWpv+9tpMJkBSrr7tZEiD6954
 grhaIivY9cRBOgpyyzN/OlgwX5JlGGj21xGaVHDtcC0R3s+0ya4MOA8b3
 SwJHv0kN//R5VSFOrUWn6fxA8NZbR/KOzoFgtS0SiLUl6OR9Lc+QyrKJu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701360"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701360"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498773"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498773"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asoHUxykD43kXdRSRCti9Ozn+zbeVN0MLASA4FRPNY+jbBJeb/cwb0gthbje4F3r9qqGjRduczj99Vl7+KGXM3AcJpD7HYPHShe2rOIrX+NAjMuvqWne2jn5ojcr2XjjKxSunel36A6FGYbN7d9wM8biB9Ycz24y+QKzco+gkz1c5AT1g9z6y+LWPxJUNKT/mAPUSd5wQNfZUzCmVr/pjfzjdlJsCJnm05rVhXuXxRMlMa7PltFrNuFzpAhGcfKDzupJ2NRGn3WTP3h3tYQkwQJR0PRzaPExhiSCIkmbTd8/ei5qGFmBUtA4H0fK3/w0Ipv366R1ZE+490WYf0tvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vkIzHd7VKmdFK+3tYQKKCwzn3iU1bkVvhyCA20CawU=;
 b=SW5WmMwaei3iGtCkHDLTuMCuShih4N2FtotfFD0NPJVlvej3P8k8qxTtgux2ZzK+SHJzR7NtxPuzKnVcmdu2RJYL4Fn1h7J4YhyCY/oqGFGf55EZYegAHDlJgfu2KwqXd5t2rsX5hXmsJu5lnfmlyD8pOK61m8cQdtPEZMSCw0GaLXoB/lsdZcA5gadLOkvLbcIaRYZCRZdTBs0mthqewPeGUwCYnnskVYtv2TZdUtuhq734mArLTK7ZWAK4jmwp44E/P7Ue3yLS3RFVpdqDzX/2sL4Y3liQBZCxZXQ2TomMgEtsFYdtXUVXsJnKRsxd5mSrSO+/hF5E/LG0r5ma0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:31 -0400
Message-ID: <20230920192940.135004-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0270.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca7d19b-134f-411b-d85a-08dbba100b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BRT033uVGNejT7cOzjEXIX+z2bn16bH0ay3UJFeeuBkQGJSK3jhHwkQwDgJFhTPvCRWlOtEoefmMW5AJT2bx7kwL+63yD/MZ7oaFPODkWbbBIBmEY6oYY3uPUQWvesIBbQTsl/pE2BHv5uhBzfqb7jeeJALBVd2l/pARa9GVt0pNMMeg8FCgnrdLgbcTrC38MUlx5dUV4/6eSQWWPRFNz3dvpijvJC9+CmOledMUo48wRWHLMSkmoSbHtcCGqE/7azzYKVqKDh4ekSuWeKWyjjhZfJ1c7pa3yE/9eGUt/aqmgvse5KJxdLgseEM8MtkJaI7x/xWVz564ouZaTUHqhx1gTK83K/VNRSnaaF8FIamUWiWZ/xYPa+4cpSfOgHKUdbafjw8/ZwMP29uO6+XhBlNrjoaEfrbqCyFnsmvanf6jEBkGnS1oQY9yFKbFcfUarY1fchL5jmlGRFXMTm3yJP7fxXsM7RR0m5ohshsyOJrZePBfUZTGVeB19ojqEIrMNkkLvBeopoVUrHSA8TU416nl903R5TLTHusnRqec3t38RB5EP1wSJC2s275Y2Cr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XEKmth3BIUDJ7hgskek4rCQdN4F12VoMhksE1NY6/6rjU8oE5Y3Es4+IMEZn?=
 =?us-ascii?Q?SKvI30ReyFqQNASh31EsVh6u3t7qKH3Brs/Y0Slq7hKpkowZpJyIfXSGf8Zw?=
 =?us-ascii?Q?MRurQ39UWmTruVYXHuMP/H1/85TOadFFD0h4QDcnUwrtNM5h2SaZ+Vt+7vzB?=
 =?us-ascii?Q?OfepY5dtLKSGRa8b6jKc16rCosBqcTflAFNJogvhC07ux8FVWrp5wpV0xIqa?=
 =?us-ascii?Q?Q+Zwk7edyAxN0WsONuRYLUTr6yRjs0lrja0rUYzou/S7GISHKYao7zqGtiyU?=
 =?us-ascii?Q?NikASaKDxeSG+mqTuWmtwdhi/blxyl/2Slb2WH/aw342Rndqw4jORfl0RUvk?=
 =?us-ascii?Q?sTCiVKGvMKQuxlQyeti560fCoB04WS8H2M7ugH+2xT0ULqPDqDVXHHufCvoX?=
 =?us-ascii?Q?S1xiBCB6gF0XNp86YeluueK+9rwEr1Nk+UCcK6OBX/HNj6ZCzfVT1aZeayVP?=
 =?us-ascii?Q?QliTpsc60s/RbPzKHzveo0aNkLUq2QR1aMZQ1ZLt4wJyerl1g0vkR2rqGTSc?=
 =?us-ascii?Q?44o0EPhIUBaMYTTJ8qdC4Kz3u1nqQ5Ly6GmBP9nS7uUKzLXFdiMEPV3mGbu+?=
 =?us-ascii?Q?5GijtFtf3mIynyzGTaHnDyrZW3kzy8wrFibYVBEgpKhumgSWmtMaluErM//S?=
 =?us-ascii?Q?pay+b1gn854jAhVDqMVqvhhcT9E52LJIP+Qky/avcd1QpUfvmZ5psrL7C2sg?=
 =?us-ascii?Q?DUM2hK/6L6vIwzw+2CB9KkSwZPIt47Oad8pyMk/tgE3iGVcL2iBDvWN5jPyY?=
 =?us-ascii?Q?o9OZ3EsRBka9o3XAu45yykwwGyHHHpPFeZ78DZMAoRe4ROeRyQq3DyOLHnxk?=
 =?us-ascii?Q?A2vUcQswOxN7eOsG+maz9lqpRopi5/K1YncaxLUegDz7lxoKrpVIWDrNZvJd?=
 =?us-ascii?Q?KNei6XQ9sZvzv2QXI/kMwXxTSf5e7PKO7J+iRRaBHCO1g2aAyybeVMyQ+YFL?=
 =?us-ascii?Q?ie53i5jBxLgDzrT573rQwpEwtxVowezzF7Bkr6ZKjYMOkbkM2+MjEqetnDVj?=
 =?us-ascii?Q?6FH5U6nOuwshLzytnqahIPKnFoKqFDfbGJ36UFLj88BynNVn1ZpsDDxORSX3?=
 =?us-ascii?Q?xnUDm7FLHIO+x0iWPs5pb+Oh1F8nb2R09ZAj0qfW7cI/Y8DbeV1tBMzOFYiT?=
 =?us-ascii?Q?8kibGkpGfzs0JsJjJST+kR+99XUyiudt/EEwRaZ6u4iBji6v5xL/ZDNwaim0?=
 =?us-ascii?Q?R9pBK21pqsHYbLZTRLRC1UIyHEJzgvHO/d8iA/djRhPUQGfwCfMhPvWT3+3p?=
 =?us-ascii?Q?myB4twsZHvhl9IIswtJEPRTRbVmZbuxWPt3SY+Go1PnL93IFFdd3/cjeRH8Y?=
 =?us-ascii?Q?9eZ4sZ9ImaqQn1N3TGCmxe5/mCY30WPMl43bDEW2p2Q9DzpPjMntvMpR1Lrc?=
 =?us-ascii?Q?9CdY1aGrEmnhf17xohmns6kLNHZVxJ598fTFCVQ8ptvb+xVJ3jQjT3ewitdH?=
 =?us-ascii?Q?cFG3ZEnnuf6UJ0rjagz3AxBcscl8IlhlNim3E5MI62QWDkUxW4G5u5WZQHlb?=
 =?us-ascii?Q?qIiotbZ4QIVg6xqupLphJLHtL7HdY84f+rWvDdTQR6lINjPYLBzDDdwfU/Ue?=
 =?us-ascii?Q?RCoF8DolOxnM7tEW9kLA/wZWXxXH+aNtmwrONYnM1qRMDPZhwSD0cNw9jGu5?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca7d19b-134f-411b-d85a-08dbba100b12
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:27.4184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoXJE13Fw1tQ3derpAzZh0m3diqBVA74RdZkIuOcBadAs1Kab1x6hKiphRbF1ZG+nHrrkGtldenAczNsDZGOFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 11/20] drm/xe/uapi: Use common
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

