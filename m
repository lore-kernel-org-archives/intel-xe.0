Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D98BC48285
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E176A10FE63;
	Fri, 26 Jan 2024 20:32:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8300410FE64
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301140; x=1737837140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AKjoVzFlUTZAbTBEyOd0rmS3waGegGqIG0WJgSp7KvA=;
 b=iiyp9+w4yNWS8881CDS3/J+1/CjVg9MdIXNljZU9Xx8kOlazRkF22qxL
 JUZTDt5pLWjEPvQorAbgaHoDCRW7eiKRW/1vOJqvVUGn4cR83FPnG2HeP
 K8PLB7JYUIX0VQoqYbb+0JTVnx49Uik2UjC/Lyiy7yQCcrIOfKF7RF3Jj
 3a8ZPHz3CE0wqUHwvu9dKyZZCK0hoR7fNlyvJc47ZIz5x4NnsvuzdqXTV
 sy/88Z08ovqfHOk11aeUeVr/kN30t/1ZPw5OuPfk20cmx8XiYOa/Cwcon
 kMKrCHKKnkVmzL65VVcHTJT+dW9ORFb+JQsF8aIETNYKXtKDod4En9jvW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="16095072"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="16095072"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:32:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2727557"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:32:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:32:19 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:32:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkc6NqF9ruN7theJa+k3OHCh4CZWkzIWBwYcLCtkiFhXLaRcLNaPqWX1FdRJr3HoOz7KzJhvSOeaUz+HTlhiKEsAO8+dT3KWolXQ+qxtQoSB2VCxj2RyyKmxyeNsNgZCooebpmTs27MhlYbFYEZya+CHCCmH9cYMkWCtvn3Xp5xu5PuqYACSHoD6B1C8aCSzCzK/M2lsRiqR2OGJ6kCZ0tFkPhxhLEEbBvS/HlwkZRCegH7KfcTe8BQjstcSK8w95ZDPACn7BBL5Mtx8+PEncTqn2ckuHjwaVEl6gb+PjwdNFoZ+OUasHa0jnIfEnWbSmH+Em2rYb8R7u5SXwyft5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhKBISjR2cwWokhmT1ew9Tai1Q1nIU5MKO3xY5JQiEU=;
 b=iwHH9fcs6AAStHvNwkiMh8vg+GToA3A2/btuoLDExa5OOPn/0njubFgFiLu7KBn5TxDOxwAE6liiBICQwFes2nIe7qyLcLIGQ0CYAnrqatbSu9tLw5+5tetJLzw29FLrzl3wAIwXML4Otnne4P92Ftd5YjgFkhiXPEamWJkRDvOtKeEm0GqZtoeBak8LCIzMG4OwLw18w72Uudd2MFHcfMFrTN1AliJZAU+zhF/CB8aSnI3L70OnkOyqTfxEQV5X9cvAQ/oUXbYsob9hUj2BzfPINGATx6ecwFOOR5edsTBYA7JH3I9OImOLXaIc8PGWNqz43PAnQZoSb4ROo7G7hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Fri, 26 Jan
 2024 20:32:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:32:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 28/34] drm/xe: Remove mem_access from suspend and resume
 functions
Date: Fri, 26 Jan 2024 15:30:37 -0500
Message-ID: <20240126203044.1104705-29-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f44cfa-09e7-452d-90a0-08dc1eade2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 15qHOMyZ3bCmsCcK2/RMDiwMkDqqMBhmNPr4rDibSgk2gaXNpoPmvT41CGrq+t7k2sEX69alPETY5zoahPpCmFPSWWJwmAGoaUO5A8soxdYWCDHsEo7tLnPP5rsSlCaOInIHxC/4zwyhRwcvu8zpY1ELQHz7yHMPQWUauzS6NAJAup7xYsiO+DTGTXkzh2YzWswQC3mxcTbwJeP4gmu8hxT5Z+F/Z6IhqBMtlyWl9jGOngsvdZ4x3+TpBCFwXmpbSaL+rC6RlxGiWnyrj0y2RRZMLhY/TW3N+bNMfQ0HJrNJQEgG0Ax6GEfoWYjoOIdWu8nGa9bVpmAT/lKahdtiKDNglROZ6tz/u06pNsi9S1Kz6kMDwvCKQH6Gr9euwaXJ+J8Xs1ys7qQz6w0nbmr2b+/P1Uq5eKTaxUOVf0J/zM8DuU+p8TLkR6j8GJO6Adc6cYlHI6G8Ny7tuAGeAU8bYKaGvnVtPFaYAVCmcNHDGkCCFT4olEgjHGlmOUECBRlmrrVCnm+ghAERaaHv/Nh8GgtS5fmu7LayNCaTsk2ZWnbcOOwOWkT9Vivcja9UU1z0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(41300700001)(66556008)(6512007)(2616005)(107886003)(26005)(38100700002)(8936002)(6506007)(1076003)(15650500001)(5660300002)(4326008)(8676002)(66946007)(44832011)(66476007)(2906002)(6486002)(478600001)(6666004)(316002)(6916009)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D1j2tbP/dfCL11DIYKr37yun7tkvEPJhVNHOVEvCwMOMza9r+qPoxWHfeMs6?=
 =?us-ascii?Q?3mlzCjMMIeCAfe5JaHBHAqpVFh6Mj0k3u2RZb+Wc8orpdwcgFaN/tXgi55Ow?=
 =?us-ascii?Q?ElFoeQlctVx4CR5OCU2Ze/rcXeGzVMrw6pqeyR4VsOtCtlWyBdIKMqE99JHR?=
 =?us-ascii?Q?MpT6RPEpDbejVHM1ftgkEvuvvY4XK6xzXQnztpaD7VZgQU8orqfr2xUWvbnv?=
 =?us-ascii?Q?vr1Oe50N+0GPYHvPIFFsIQL41+l6ZeuB7xVUq2xfBkUWeTJiNslfVpVkLrpD?=
 =?us-ascii?Q?Iu2ftwxUFIOTGaC490AvAk36qH7c/3ZUw7L5HkqtpcbWZashLaqs8ney7uM9?=
 =?us-ascii?Q?iQAPxwHyIXDU2IFn4WswZBPDQLqoqphYV6Oy7pJnBvTs64XrMCRJznvsZujR?=
 =?us-ascii?Q?ZyP9R9qmjVOkyoRyLaMCUxY+caCzA0Cxp3gNoRB6AvcZ9xN/i2+c7dvJJDAM?=
 =?us-ascii?Q?hG0HSUdmm3g8Po929SAtYiJQ2Hqo32ZAY6u7f3n3zx5Yss/4gt+8wDt5iVaS?=
 =?us-ascii?Q?nkQU8vMH/3T2trKgjs+LwOXPB+9hAwPxWaN2plNKEg4xqYZW+9tOJymoeXkf?=
 =?us-ascii?Q?4QLDNLlHVqGTVA7DjbCS0mphAZ7C6N8oIKUqBA77UDXxZgvt0A3+p1sbIc78?=
 =?us-ascii?Q?3M8ynmxH3nK1Cy8S+WQ1FFazkchoPeK645dFkpdcCuC90OoQZakfgSmsvUnf?=
 =?us-ascii?Q?a+cZ4nZnqhYMbgrRugh90N+otjQ8Xwhft7E7K6fgcEpoPtkMrNXm4PYfrZAO?=
 =?us-ascii?Q?BmoyX/irJh/u3A5dnK4ZRCVZ/PSUbnpYxe84XHJK+zFNi01eRsf7QJxTOQti?=
 =?us-ascii?Q?d+AOoaJXw0WQC2NPvVJJSYtDpMERa/InBreV1vGTI2n3mfJYjMLc+uhDE4C9?=
 =?us-ascii?Q?0FaCOTPBW0TxQ6LRMLq6ZKWx7SnXK3hl6SVyuh1amUOV/TUzzfHaaBYxRfoV?=
 =?us-ascii?Q?XgQAJ+cJYQ2rNr+rO67q8sd7LjTNFKRANnJEb4ldC3HrGUn5HJGpJVaFWVcx?=
 =?us-ascii?Q?RrDpbq+iWnK60YDF41DGWzZcUso/QgRNmgcPNzoWtCmO29zjw8bvlqSs78Zt?=
 =?us-ascii?Q?1m1RuYE6Uvvv3LmoXuGfY0bmeSVYZg7z+6KYpAXs48/oVxs9K2HJ8qFYiTlk?=
 =?us-ascii?Q?LEvWzbG4YdHn5Ziy36PhZ/XwP15K9xaE+W97PaMMeqF3I9bZG4cm5GDfVMyc?=
 =?us-ascii?Q?qbIKvCU/AlPHga69fp4OQjFw8bgumE0DGofgHfTBZxyUG5XbPwTSzw/dIAxq?=
 =?us-ascii?Q?/sOKO+BDwqQ1bXkOGXHEN3695Dlm/4AWZp4kHu8H+SCvKYJVb1SD84VfDe80?=
 =?us-ascii?Q?ZzDGoWYDRc9Pptyzr80hZANHcnKrFQL1HeFlpwkVYvNGTLaarvLWhQnxLTld?=
 =?us-ascii?Q?Oe19kmKvKh2bI3RFBnOa/bE26No/6XZFtk5T+luHJuVaN1xk8Hsv8JNbqu9u?=
 =?us-ascii?Q?DSodQfOCwooAqyO4TixVUiLxczNWKGc2Nq4qNbJjSsf8MtF57ev1Lk73q8NB?=
 =?us-ascii?Q?tpKYDs9q/pa8lO/DcQltzteryr4CWBa8lIvoia8n3cM7VoN1esdJLC87o3n5?=
 =?us-ascii?Q?4SN0N6ttPgDq1ZWKPj/KYaklmyezpLcuk+auoVJRWOeliQ77MN/4EThVoPuF?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f44cfa-09e7-452d-90a0-08dc1eade2ef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:32:16.5982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKabi60PHxhQpWeFrLxozrx9g8mqrGVC62sM2U7AebNqYBACecFWdwN5MxdIUKeZD6u2MI1eapJ5kqsD7jSWWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

At these points, we are sure that device is awake in D0.
Likely in the middle of the transition, but awake. So,
these extra protections are useless. Let's remove it and
continue with the killing of xe_device_mem_access.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c6c4292c21f5..9565ab9807bb 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -684,13 +684,11 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	xe_device_mem_access_get(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	xe_uc_stop_prepare(&gt->uc);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -699,7 +697,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -709,7 +706,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
 
 	return 0;
@@ -717,7 +713,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -727,7 +722,6 @@ int xe_gt_resume(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -737,7 +731,6 @@ int xe_gt_resume(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
 
 	return 0;
@@ -745,7 +738,6 @@ int xe_gt_resume(struct xe_gt *gt)
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
-- 
2.43.0

