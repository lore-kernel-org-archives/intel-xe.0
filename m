Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B81C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 16:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CE210E92C;
	Fri, 12 Apr 2024 16:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGm0Jk9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651AE10E7B7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712941105; x=1744477105;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xLYKU5TpEuv+koFBbMhJt4XT8bmZWXc1xkPdzzYs5as=;
 b=bGm0Jk9OCBtNXgriVpGuIj3Bc/PRrS/asr6ESprFnF3jBI6jislhRWkh
 TMqY5mzHwDuqpCZfXn78cAaTF4Hhxez3fDZDHPYqI5wQoY8RHlZ9LDuJa
 6rcP1VnZoCnoz5s2Kd75WU27rX6qfr+4Ulnx2XevYmOvnIujVS6FZ0RvZ
 sAD1RHMIaYnDPVfPGqJWo0PlzYHhGuRTq7xOn0OXKOd1tOjWFHwF6Yetb
 vJ1OYtV3upqq/GGbChc0i2sKmfyGy1xgNKBMjlu3Gse4N1t6ueUAcNoWY
 8gXgO+cy1c4LlnOvT4Tdjm3NjqeeHtr4vjIjX3XqX8gWqBzEGFokqnbvv w==;
X-CSE-ConnectionGUID: 4CfiaFNeSsGFfgyXzu6QUw==
X-CSE-MsgGUID: BP2H8/slRruSfhucWp18Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19009104"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="19009104"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 09:58:25 -0700
X-CSE-ConnectionGUID: l2hDFepOR3+cxfGrt/oSIQ==
X-CSE-MsgGUID: f7TD8dSfRVG+VgNakNxzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="52432673"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 09:58:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 09:58:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 09:58:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 09:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHhqxlokj/Ue/rhMD7YYu8sbtEghNOYklin6J9+7FQVBeFINIYK1CobqQORLa2i0Dom3oKI3m2ejJmx12dWEo5hROnVhbVkFxaUe8CAGVXjJGsAw4ll1LnnCsG96UnLqkDlEqlG53OaBu6mUH+4NqIY1PbeEABgVp5lD5kdcJPUv8opZVaNWkxUK6uz5mIzpKSro7nTGcFx2LtEUgwFCerLVUg8ic40aDG/IpDGUezJ3LlC5pCp80E/oiIX6IgwsddS18S2E19olIlykFqjI7nemkXFtPYPw3TLZiCixSQc5QIUMu0OmDM46nmoHfQda5PmKwrzigCTocmRtoYPUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxW3l/PhRQfMI85rIzLVPPTZo2woJ3Egi7cTPmn7B8Y=;
 b=J4aJwUt9Xh8frYLK7AnO+/ckfnYiimRnzX1PI39aPodqX9oM0pIU3+Ji1DKnfMlchEIGdx7HneKzAbVdwsHBggzDKyi4PeYGjdyrchThXirlpDJFrEFSIEsELnTtdtsYION5hEk7VR7PCJHALN7nj7yRbfzckuzsc16jrw7xq1zbF2+EqD0/JM2zvWGCy0eC8ib7M9pzqGeRzJxxiDMB8JFez2eDVMLOEC+/o1WDw2Pjm7mVOdHLsNNiooJTZltYz6vHbxATcStbvBR6fCBJrmXF2kRbFcqpKft3lkH63k/PAAEy2atJ3+4Johlj6vpl8Xt7wCsyePEvRl6yNeJqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 16:58:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 16:58:21 +0000
Date: Fri, 12 Apr 2024 11:58:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 7/7] drm/xe/pm: Capture errors and handle them
Message-ID: <ub2u2jq47h5uy7zydrmoewdad644qf5eo6finfz4mfpwa4orm3@22uzbbikjtkw>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-8-himal.prasad.ghimiray@intel.com>
 <7ioxhkpm4jidj5m4hcc5jsatfk333d4sgso7o5bl2pqmq5xxyc@36dmyunxbviy>
 <5a419e94-cb1d-42d4-9584-29c842c7cca6@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a419e94-cb1d-42d4-9584-29c842c7cca6@intel.com>
X-ClientProxiedBy: SJ0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b30406-728b-4b56-5061-08dc5b11c225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3pZ1NXQt6psZz+3RtQtlFTImdbECUn4tSvqg3qOqCXeU5zXZ1afcfca3ncZfliMaykiWJcj3tcOFvicwjmxlfsPsQOPL49+2iz5cdsrh5bU4oEqfBwYRcDeXXda+n23lnSKu4OMFkVcG2INnRnSI1mCqJxNjIruaVs8gC1ECgedLBU1ga7jmMa/84JWdv0wIYlRohbFbFi49SZ2DQY96BEkvJI8oE+SlV0wJVottXqALznAzXdyDpgsSV1jZW4+D8hwJ2vZYCtdyOCN3y5s7ql1pGAPLbAMo8IvSTphm5QqXsoXFltfzwaAlnFKsDzRL3dCmMTCR9RgMmNBcUqrGXDMfWLvIg2UmTFnni96PN3EORAgY8l2+VktmbYrFElwsKuLF//TcnO6XLOew1uJly3MfhRc2sD1J7AqFldYkAq2tE7bgW0+awIoKd1gfrp/gMOVi8csRi+InOZwckp8Nxq3NZKxE0OFZZnXoEVolbtVyUwZOSJr3qd8pNx2muDPjKin2pWjB0xAjQaILR0nYZ2vnQpKJpdxlcgtH019qRJaP5Blt9/4suumYxjq/ANEeVG2Jvw03r6JCuMBHWsnPH13bRPWgfFjQjKl/c0WDmmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dALbM4x0C9+j9N9wGdcOZCy0bKYpeB65E3Z5ktHUrQxa3fJFpkU2sWlmQQ?=
 =?iso-8859-1?Q?chg7hRoU+9FiZk2pu1Y+N3vbFCqTgP0sN+3G3fsWC1AS7uH1d3PRHovbjr?=
 =?iso-8859-1?Q?s3BVTxxICfPykfkQ8gBtAVCBldiBg5D7TayS35cldpkcBSJyXJAYF6iajM?=
 =?iso-8859-1?Q?CkoXxZlDdys/0kUbtdedOVdmkwRpG7BRQNtq8aEm7MXVL1TkmpgsNdCa6O?=
 =?iso-8859-1?Q?U4uxW5nwVft5vXcny9hXj/hlWMaUHO0k856JwdOH4pCrwUCqfgoPqMUqt/?=
 =?iso-8859-1?Q?wqd+n3zzWA5I2x6dzp6ofvW2prl+khejtgG+JPUOwzxuc5EO2H90PFE/YJ?=
 =?iso-8859-1?Q?Hpko3BPH2P6aA+eTVSsu4Z8KmXO/gBsd2XMmT7DY2foGUOyFg83nDhVMhN?=
 =?iso-8859-1?Q?+WlCMfiqJEe8p3oywviNdKVV12ctlBop8ydgOW2WqOvyGR28E6J8WCrVU8?=
 =?iso-8859-1?Q?+itE/s6RWiEQjMI+mWW4dVYhJBtsm/q9ey6gWJp/82AiR723BapYVm/qZt?=
 =?iso-8859-1?Q?ji7GgtPx6eqE/nYrsXrm1SkH5hTgnmY9ftt41cX/jCGqJorX95yxjZxl5X?=
 =?iso-8859-1?Q?/1bDBrfHLgwaC1ZMBtlFn0X6FAIVTbGHJ/wpLr71MwfbYQxu57fooNY+R6?=
 =?iso-8859-1?Q?rvNAB13Tqw/YRLe57lAYvsKd1gDuNZKF0CnFoqGhCNx0m1uxWDdd4kXGAS?=
 =?iso-8859-1?Q?PLToef2Fjmbnh0pcO469aQNy+EqQlhmgEz1ofMJ0e0RBWuwaFxTy1aQnFe?=
 =?iso-8859-1?Q?ot76QBPXPcz/r8WimIw91++qn/ZZ6BkXh5oHOkAFTnIPz97jiAIcPbVgIl?=
 =?iso-8859-1?Q?ufr0YErj7Hyx0VPSFLl6YT4vI1YHbonIAuyY7FG+TOr5l11gPlZOxbib5C?=
 =?iso-8859-1?Q?HtBYkbB3GbMLNOfYMLyJS8NmN6HKH6OCBVodM8Ma21L/BBfUZHOvu6Haut?=
 =?iso-8859-1?Q?aJn/9y5+a93Gli3SjNDB3EAtvcrFcVnRMnWFbtp4GsRf0eeZIC/CdGgWjB?=
 =?iso-8859-1?Q?sjwm+5/WtgJs1bDRA8vK6DlTkqj9i1RwGhvyaUuyAGA0cfzlUroO+KWjoD?=
 =?iso-8859-1?Q?ZcX27NUxIdFLU9/CoNBxZj8uUuwYjiBEJsRgQt1HsWGlbqyUKl/o+lEnpf?=
 =?iso-8859-1?Q?i4BSvA+c7jCx50GyJtabYdOAOG9QTbLQ8h4kn6VSjZ8jgFXODTwD2X/JSV?=
 =?iso-8859-1?Q?pkvsIPqeBLQBbj4d8idoBEKF51vwuu1DNbcXXSRAt57RnXh3On9D1rMZpk?=
 =?iso-8859-1?Q?SE/pUoSrCD/hDHOS5LW2HyeqxfyWnUzCOv3CN5vxQNcaAvd7d0W+TWwfPY?=
 =?iso-8859-1?Q?nqdZgOr2axPXKZDHTbWis+55rqgqYGz3hzbVb0z+LrTiJnIyRvYaPnykET?=
 =?iso-8859-1?Q?+8amMNBbZUV+plN19DOvI7UeW5Ol3qF8/wSUe6y+4FhRm41PD+fYYAbDXc?=
 =?iso-8859-1?Q?7BllfyQPCUQWvSWea6A0j/FRFtPaPmX+VInalmU76iunuXYwY8V7EgELGz?=
 =?iso-8859-1?Q?DREQsu4KHSAtm6gduF5bsxEHlVb4rI6FxqH9le21tA8FiYpp0PrKXUNXIJ?=
 =?iso-8859-1?Q?RZdTBB+3ci8uqa05YcK6UIFgrqbILJtP13fVRnj7s4zeBZ+skYecjBREJj?=
 =?iso-8859-1?Q?RRXZvYEorOPP8BlXTbOQTB80r3UbEs5Xev2K3E1mMSESwKoPz3Ht8buA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b30406-728b-4b56-5061-08dc5b11c225
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 16:58:21.0703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTt422IOhEPhJ8SgJw87LPVqabOO7Ff+zYnAQdXGJ9wezORZbJ2+lLnoKDs8W/jYwt4A6nmyor3PFlDzjVdzWmhFd34DiHfkK6zDxLsqwQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 12, 2024 at 10:01:20PM +0530, Ghimiray, Himal Prasad wrote:
>
>On 12-04-2024 19:12, Lucas De Marchi wrote:
>>On Fri, Apr 12, 2024 at 01:32:45PM +0530, Himal Prasad Ghimiray wrote:
>>>xe_pm_init may encounter failures for various reasons, such as a failure
>>>in initializing drmm_mutex, or when dealing with a d3cold-capable device
>>>for vram_threshold sysfs creation and setting default threshold.
>>>Presently, all these potential failures are disregarded.
>>>
>>>Move d3cold.lock initialization to xe_pm_init_early and cause driver
>>>abort if mutex initialization has failed.
>>>
>>>Warn about failure to create and setting default threshold.
>>>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
>>>drivers/gpu/drm/xe/xe_device_sysfs.h |  2 +-
>>>drivers/gpu/drm/xe/xe_pm.c           | 34 +++++++++++++++++++++++-----
>>>drivers/gpu/drm/xe/xe_pm.h           |  2 +-
>>>4 files changed, 34 insertions(+), 16 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c 
>>>b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>index e47c8ad1bb17..21677b8cd977 100644
>>>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>@@ -76,18 +76,14 @@ static void xe_device_sysfs_fini(struct 
>>>drm_device *drm, void *arg)
>>>    sysfs_remove_file(&xe->drm.dev->kobj, 
>>>&dev_attr_vram_d3cold_threshold.attr);
>>>}
>>>
>>>-void xe_device_sysfs_init(struct xe_device *xe)
>>>+int xe_device_sysfs_init(struct xe_device *xe)
>>>{
>>>    struct device *dev = xe->drm.dev;
>>>    int ret;
>>>
>>>    ret = sysfs_create_file(&dev->kobj, 
>>>&dev_attr_vram_d3cold_threshold.attr);
>>>-    if (ret) {
>>>-        drm_warn(&xe->drm, "Failed to create sysfs file\n");
>>>-        return;
>>>-    }
>>>-
>>>-    ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
>>>    if (ret)
>>>-        drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>>>+        return ret;
>>>+
>>>+    return drmm_add_action_or_reset(&xe->drm, 
>>>xe_device_sysfs_fini, xe);
>>>}
>>>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h 
>>>b/drivers/gpu/drm/xe/xe_device_sysfs.h
>>>index 38b240684bee..f9e83d8bd2c7 100644
>>>--- a/drivers/gpu/drm/xe/xe_device_sysfs.h
>>>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
>>>@@ -8,6 +8,6 @@
>>>
>>>struct xe_device;
>>>
>>>-void xe_device_sysfs_init(struct xe_device *xe);
>>>+int xe_device_sysfs_init(struct xe_device *xe);
>>>
>>>#endif
>>>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>index f1fc83845c01..f4d9441720b4 100644
>>>--- a/drivers/gpu/drm/xe/xe_pm.c
>>>+++ b/drivers/gpu/drm/xe/xe_pm.c
>>>@@ -208,10 +208,25 @@ static void xe_pm_runtime_init(struct 
>>>xe_device *xe)
>>>    pm_runtime_put(dev);
>>>}
>>>
>>>-void xe_pm_init_early(struct xe_device *xe)
>>>+int xe_pm_init_early(struct xe_device *xe)
>>>{
>>>+    int err;
>>>+
>>>    INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>>>-    drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>>>+
>>>+    err = drmm_mutex_init(&xe->drm, 
>>>&xe->mem_access.vram_userfault.lock);
>>>+    if (err)
>>>+        return err;
>>>+
>>>+    /* Currently d3cold.lock will be used only with GuC */
>>
>>it's cheaper to just initialize it regardless so this can be simpler
>>
>>int xe_pm_init_early(struct xe_device *xe)
>>{
>>    int err;
>>
>>    INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>>
>>    if ((err = drmm_mutex_init(&xe->drm, 
>>&xe->mem_access.vram_userfault.lock) ||
>>        (err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock)))
>>        return err;
>Looks clean. Will prefer using this.
>>
>>    return 0;
>>}
>>
>>or keep the err assignment separate, doesn't matter much. But
>>when we mix success and failure for a return-early style it makes
>>it harder to read.
>>
>>>
>>>/**
>>>@@ -219,20 +234,27 @@ void xe_pm_init_early(struct xe_device *xe)
>>> * @xe: xe device instance
>>> *
>>> * This component is responsible for System and Device sleep states.
>>>+ *
>>
>>wrong line
>>
>>> */
>>>void xe_pm_init(struct xe_device *xe)
>>>{
>>>+    int err;
>>>+
>>>    /* For now suspend/resume is only allowed with GuC */
>>>    if (!xe_device_uc_enabled(xe))
>>>        return;
>>>
>>>-    drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>>>-
>>>    xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>>>
>>>    if (xe->d3cold.capable) {
>>>-        xe_device_sysfs_init(xe);
>>>-        xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>>>+        err = xe_device_sysfs_init(xe);
>>
>>apparently not because of this patch, but why do we call a function
>>named xe_device_sysfs_init() iff xe->d3cold.capable? And from within
>>xe_pm. That seems totally misplaced. +Rodrigo
>>
>>>+        if (err)
>>>+            drm_warn(&xe->drm,
>>>+                 "Sysfs create for user to set vram threshold 
>>>failed\n");
>>
>>just warning?
>
>If I propagate xe_pm_int errors to xe_pci.c, it exhibits unexpected 
>behavior. The PCI module throws errors as anticipated, but when I 
>remove the xe module with "module -r xe", it doesn't properly clean up 
>the "/sys/class/drm/card*" directory. Subsequently, upon reloading, it 
>complains about existing sysfs entries and fails to load. This 
>behavior aligns with the issue described in 
>https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1352.

Ok, it seems xe_pci.c is not ready yet to handle the propagated error.
Please add a comment above and in the commit message about this, so we
remember to fix it later when xe_pci.c is fixed.

/*
  * FIXME: Just warn on error for now since caller is not completely
  * ready to handle the fallout.
  */

thanks
Lucas De Marchi
