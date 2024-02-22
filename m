Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49468C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 06:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5E410E879;
	Thu, 22 Feb 2024 06:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xw/T7qza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F90A10E879
 for <Intel-Xe@lists.freedesktop.org>; Thu, 22 Feb 2024 06:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708582723; x=1740118723;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XBAyCUTudw5bD4G83FLnPATgeqlHEdU+IZjD/NyVu70=;
 b=Xw/T7qzaBTYZejoSj/PjRg2DjIyz7I/f4kNV5I/iajyKQJPMOaLTBBEt
 VS12SzTUlGGANAhmflKcOZpYBzdhKnxB3wndpjJUFpWWiZYNOclvJv3PR
 c3ZdqEmS68jTIjp8YxIf1cl8HhUmqDFQU3IYivWc7VwGK3/BU5vVVaLc8
 hKWsakxp7aA3V/WF6r9Tw0zW/n0aj3LeCXGEKMmcwMFnoP+rLPOALjqG8
 lAyVKwjhWNArzEQ9/lz5tRKNyTnk7fk5PP5v8Mo+eCscjoZog4JCcejZ9
 kUN+vt4OD2DDq9Etl7JsstN1QDR+y/Oh9fe6I7aUqY7QM0yxwEegwgRLX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25247931"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="25247931"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 22:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10064588"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 22:18:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 22:18:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 22:18:40 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 22:18:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUnUQPkYEAmVLQQJ7biDDoxu83EwB/FdyF0qhl+NYJnfxvrQZb8apetdAIM424xyXugRt3rW0i7wwDwGnkfujVCEmvUPwz7gLKcrdv8MxXlGqSvahLAdH/em45ynHEaXRPYWQwbOFdk711ciRFT+P0/eKW23mU1/QUMj15UNAiP6c8DzXFT2yBWjDhUGC3wCeCPE7nW0lGtnpZ3seNTFWShL38Z02GBEgooloznRKkR32Fv2SlUxik0ibZ4R2slNMvVtp0HocHHa6qZswGLrlbzuEukestR6zfda3e7wL0hnqYZqU4l+ufo87rUvQjT+TjRebQKtFQMY+uy/CkP/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx4FhIg2oTcY0evdPy0nZAIULBC1tKYCQehTd9q8AOQ=;
 b=RhJZhXt6NzxRLEsEnrsAqH+1iLJi5VYyDy40ZuYZgs53RiqQe9nZT0weggUyJbwmcNUnoezvraywWgWoifllDfmTB5UGYNixW8AyoJ2qdyt3TBSXCfFbaO/dxjmoy/1y/I7+Psi/dOTGFDxRzNxLgZpjbQBfN7m1LlfyZN4+oOxk4M7qiOeqBb9D2wyneRAHd13UDW4QYihR2i1QrSMJVldpmwaHI+St4vWYslzGw7sF7bqvIETBDvyRUgG1GFW7pStMyHbK8S/9B+4h31jcEuNGQ9pXqZThMiuhmw3jHaKy3EaY6P3+aMzMvY2zqNN+CuDtISDBA274c/9td5hOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 06:18:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 06:18:39 +0000
Date: Thu, 22 Feb 2024 00:18:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: Re: [PATCH 2/2] drm/xe/guc: Port over the slow GuC loading
 support from i915
Message-ID: <6smnkqguwdz6do2bgmniokp6hdh4ay3xpclcdfspgb34ccnlzj@xzhjcmf5f677>
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
 <20240206201153.2773996-3-John.C.Harrison@Intel.com>
 <4ec5q2znrsevf3ihnzv6vvcztufpioxlwmy6342k7mam2tkq5l@6istqc7flazw>
 <b0a3b750-ffee-4735-8342-036f010eefa4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a3b750-ffee-4735-8342-036f010eefa4@intel.com>
X-ClientProxiedBy: BY3PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:a03:255::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b63fe7-73ca-489a-f0fc-08dc336e1bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZPIPi9ciEH5cRSzy7juf1UsVzF6IG3THPjtzrdtHlv/0tvBLB5DXj7brjs1z24/R8BAA1A8X7iVpn2rQugHouulf2o0XGU2C+3qPkFI1TQloUrc19WPr248pFoIqQmkEl5GhxTVkEmijirWRngBWxTIGGZaCOxLW+W9txIRmxoGGWQt+QgV+2zMvUDoGm71QPcSVdD6boy1lESPMnEAM1C+VMnPB9dvrO5IUpTthbU11o4PxMofNeLUQ47tSb7ZZoELf2O8LBv86dxSmW5FvgvGgJlRb6fazVloU989gIaO8AUSYndXLtIntpv/pKyb03YyXS6eRATCQjxsgjfE5sHN/MrOmQBUhBcdMZdSHtMd+At09sT/zfOlaMy0fU5Lf6iilkU1Y9iClHQB2JA7R+r8D0HppSQjOO6mqcKBRBU+oyvRyvYDu2BqiZc+0nr0kmyyqdugH8GlUHe/4uAXVs72PprKE8E9DMcWboW2fgecfm6A7p0WrsF+YyOHS6MMobM8ntplsOise8v7vVeJxP/DV3peiddT8M8Ubov0iZFx392MKWEWnH/dHHITdJdbd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qRkp4a61g6PYN03CqxDnUgxnsoEuSpqtiB4keqT4idsC2B1Dh39QBDKZUn?=
 =?iso-8859-1?Q?5QY6tovYIorE8rcOhyMKqna9BIOvRN3wobny4+BK0L96AveIbBeDN2SNWY?=
 =?iso-8859-1?Q?ZK1Q2HaM4G8H1+iBZbdl8IxOQA4YzU+F3zzvYOS1D+n/mbOMZt55eVkyUO?=
 =?iso-8859-1?Q?azq6EzSJtn+jriEqpAdMzp45mjB9smy07i4GoyHGUMnMZZL46pXc0PbWQU?=
 =?iso-8859-1?Q?4rwUDdoHFD0eLXFfdzhJayD6HXMCbH7/GXxAhQIi3kCffnDWO5SbJOGnYo?=
 =?iso-8859-1?Q?oGi7lyAyR8Ual//pS/DtRHNmjz4jT42QxSjMmhXMtS8etgJdcewoQUzM7L?=
 =?iso-8859-1?Q?kWx8FPbc1DftnJB0VSFNQxOJLGrnEmubMrLEQwIyPozTn2AZhh9DduAB3+?=
 =?iso-8859-1?Q?W0Q/brmJ5G0mA5DZX7wBopSQGXK3+D31xhaCHZRhjRXaNlTJXeXh5RA82C?=
 =?iso-8859-1?Q?mqPXjISIAwa5SU45EyizrMtGf3pZ1ANqGM0GxI7dqy7RfwR/b2veo+o4/k?=
 =?iso-8859-1?Q?HiKZS7n4jVXjrpGJ8nER20JkDCjciybCZqaWjJ+dZjPHbhVHMFsv+9KEF7?=
 =?iso-8859-1?Q?Vr+xD7DHN6pP2GpTryiCfd/Ot4Be4OvlJQQenewfCnLk/hBcI/FPfjGH16?=
 =?iso-8859-1?Q?XF9k20F66RcdzK4R8jHY7Oga9ZligFqQkeToa082iK3+EvvykeLVFH/X5q?=
 =?iso-8859-1?Q?MeBOo/nrO61bMkkcx7BpOvcMgV3pPF8twY+vFz8urtaIcaQkEk04e0S+Vf?=
 =?iso-8859-1?Q?mAoD9BuJ9HxV8MwmVm3+PvQDmxlqevE9teZlImfeC+r+HFfCrA8/FzK8tQ?=
 =?iso-8859-1?Q?PKcKQDCGDZsGmgMRB9SzM9dHTycLEiEsvt4aRWNa2zJK/ZCV1WkKqWtZmv?=
 =?iso-8859-1?Q?+2UAQFzqjybF06ZXqqw7JSy94eacZjNDoGaeIBfVt61ODleDINRYbqcsfb?=
 =?iso-8859-1?Q?VDQP52XkfqF8n7RVE8W29qr6JbteGUNe9QRZ3Gq7QhaAmW/RhQm7wYCpjI?=
 =?iso-8859-1?Q?EEr7dfZ5FmZ3OpVRpoIkebIUcC9RMZ/xRdG84medY+oECoj4r2bbqQ6HVy?=
 =?iso-8859-1?Q?NVxDh50Yh+A0ctlkVaZp9OGTViRjdhKD1BukI5DjLImavlFY2oL2/YUDZm?=
 =?iso-8859-1?Q?A/LRYejjEhN5+Q7GLglLxVq2iVaNoRwSH0aHJykepPzYfWvlfb2puDc+Q3?=
 =?iso-8859-1?Q?0OI2sd/BBlTIw6/gvvCDotVPA1+WQ6MXnpl8ZBMbfWAQW5uZMhFnu+3kXt?=
 =?iso-8859-1?Q?bfyPOZ+jMiVVVBVrBT6+JuoAAYDwMNwf6KgAx0ICyx6dW1BzbIKhfAnMRF?=
 =?iso-8859-1?Q?J0pVHrWm2mY9Em67pflca0BXc8lidKVGNMm0kX/qObqxbzre7MeFB3xzgL?=
 =?iso-8859-1?Q?caEdjZBtgzKlthxsmk+WRY27pXs7X72AfBxFf0hILF2Wcuf/X2hPFxRkdG?=
 =?iso-8859-1?Q?P+t+hM68rKFzDsguF4y9Ftekc5iYQZWnTLvwmC+/yptEIoWunhlYsqZntC?=
 =?iso-8859-1?Q?RMeJ4UOU9SNSjW4dHgru3L6FGD9EnlV5AL57kgmr6B3lh1Y9qZG4P8mcQT?=
 =?iso-8859-1?Q?qR7t2ql/dkHpXwlaIyJC+NSGTo1x3KhvmUbWOq55t9ZShSQq1hXT9NIc0n?=
 =?iso-8859-1?Q?aZzv+Marul44dh4aj/mn5t5XJqaV7hAOcrXM4YiIsNqAFnnQe2+vMCOQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b63fe7-73ca-489a-f0fc-08dc336e1bf4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 06:18:38.9681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/LrXQZQcd4iU3jLc/Wy6hou+YAV6kOcFc527fChdekWeMbWdqpqHKUC7aKjjpq2rdw0qh0pJsCwkMMfawDLxi4P9tqmMBUMvyTUjVeuK/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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

On Tue, Feb 06, 2024 at 05:51:24PM -0800, John Harrison wrote:
>On 2/6/2024 13:36, Lucas De Marchi wrote:
>>On Tue, Feb 06, 2024 at 12:11:51PM -0800, John.C.Harrison@Intel.com 
>>wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>GuC loading can take longer than it is supposed to for various
>>>reasons. So add in the code to cope with that and to report it when it
>>>happens. There are also many different reasons why GuC loading can
>>>fail, so add in the code for checking for those and for reporting
>>>issues in a meaningful manner rather than just hitting a timeout and
>>>saying 'fail: status = %x'.
>>>
>>>Also, remove the 'FIXME' comment about an i915 bug that has never been
>>>applicable to Xe!
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
>>>drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>drivers/gpu/drm/xe/xe_guc.c             | 197 +++++++++++++++++++-----
>>>drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
>>>4 files changed, 214 insertions(+), 43 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>>b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>index ec83551bf9c0..d0b5fed6876f 100644
>>>--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>@@ -7,8 +7,12 @@
>>>#define _ABI_GUC_ERRORS_ABI_H
>>>
>>>enum xe_guc_response_status {
>>>-    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>-    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>+    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>>>+    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>>>+    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>>>+    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>>>+    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>>>+    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>>>};
>>>
>>>enum xe_guc_load_status {
>>>@@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>    XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>>    XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>>    XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>>    XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>>    XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>>    XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>>>@@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>    XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>>>};
>>>
>>>+enum xe_bootrom_load_status {
>>>+    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>>>+    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>>>+    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>>>+    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>>>+    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>>>+    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>>>+    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>>>+    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>>>+    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>>>+    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>>>+    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>>>+    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>>>+};
>>>+
>>>#endif
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>index 92320bbc9d3d..a30e179e662e 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>@@ -40,6 +40,8 @@
>>>#define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>#define   GS_MIA_IN_RESET            REG_BIT(0)
>>>
>>>+#define GUC_HEADER_INFO                XE_REG(0xc014)
>>>+
>>>#define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>#define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>#define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>index 868208a39829..82514d395704 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>@@ -16,6 +16,7 @@
>>>#include "xe_device.h"
>>>#include "xe_force_wake.h"
>>>#include "xe_gt.h"
>>>+#include "xe_gt_freq.h"
>>>#include "xe_guc_ads.h"
>>>#include "xe_guc_ct.h"
>>>#include "xe_guc_hwconfig.h"
>>>@@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>    return 0;
>>>}
>>>
>>>+/*
>>>+ * Read the GuC status register (GUC_STATUS) and store it in the
>>>+ * specified location; then return a boolean indicating whether
>>>+ * the value matches either completion or a known failure code.
>>>+ *
>>>+ * This is used for polling the GuC status in an xe_wait_for()
>>>+ * loop below.
>>>+ */
>>>+static inline bool guc_load_done(struct xe_gt *gt, u32 *status, 
>>>bool *success)
>>
>>bogus inline
>>
>>>+{
>>>+    u32 val = xe_mmio_read32(gt, GUC_STATUS);
>>>+    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
>>>+    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
>>>+
>>>+    *status = val;
>>>+    switch (uk_val) {
>>>+    case XE_GUC_LOAD_STATUS_READY:
>>>+        *success = true;
>>>+        return true;
>>>+
>>>+    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>>+    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>>+    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>>+    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>>+    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>>+    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>+    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>>+    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>>+    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>+        *success = false;
>>>+        return true;
>>>+    }
>>>+
>>>+    switch (br_val) {
>>>+    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>+    case XE_BOOTROM_STATUS_RSA_FAILED:
>>>+    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>>+    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>>+    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>>+    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>>+    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>>+    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>>+    case XE_BOOTROM_STATUS_EXCEPTION:
>>>+    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>+        *success = false;
>>>+        return true;
>>>+    }
>>>+
>>>+    return false;
>>>+}
>>>+
>>>+/*
>>>+ * Wait for the GuC to start up.
>>>+ *
>>>+ * Measurements indicate this should take no more than 20ms 
>>>(assuming the GT
>>>+ * clock is at maximum frequency). However, thermal throttling 
>>>and other issues
>>>+ * can prevent the clock hitting max and thus making the load 
>>>take significantly
>>>+ * longer. Indeed, if the GT is clamped to minimum frequency then 
>>>the load times
>>>+ * can be in the seconds range. As, there is a limit on how long 
>>>an individual
>>>+ * usleep_range() can wait for, the wait is wrapped in a loop. 
>>>The loop count
>>>+ * is increased for debug builds so that problems can be detected 
>>>and analysed.
>>>+ * For release builds, the timeout is kept short so that user's 
>>>don't wait
>>>+ * forever to find out there is a problem. In either case, if the 
>>>load took longer
>>>+ * than is reasonable even with some 'sensible' throttling, then 
>>>flag a warning
>>>+ * because something is not right.
>>>+ *
>>>+ * Note that the only reason an end user should hit the timeout 
>>>is in case of
>>>+ * extreme thermal throttling. And a system that is that hot 
>>>during boot is
>>>+ * probably dead anyway!
>>>+ */
>>>+#if defined(CONFIG_DRM_XE_DEBUG)
>>>+#define GUC_LOAD_RETRY_LIMIT    20
>>>+#else
>>>+#define GUC_LOAD_RETRY_LIMIT    3
>>
>>why? so developers don't reproduce the issues happening on normal
>>system?
>Not sure I follow.
>
>For CI runs, we want to cope with as much as possible. Anything above 
>the limit below will be flagged as a CI failure, but if a load were to 
>take 4 seconds then having the driver actually complete the load and 
>keep going to run further testing is better than it aborting the load 
>and killing the entire CI run. Especially given Xe's current penchant 
>for causing kernel panics if something fails to start correctly.
>
>Whereas, for end users, we want a timeout that is short enough for 
>them to not reach for the power button because their system has hung. 
>As noted, the load should never be in the seconds range unless 
>something is really badly wrong. But that's still not something we 
>want to force on an end user.
>
>
>>>+#endif
>>>+#define GUC_LOAD_TIME_WARN      200
>>>+
>>>static int guc_wait_ucode(struct xe_guc *guc)
>>>{
>>>-    struct xe_device *xe = guc_to_xe(guc);
>>>+    struct xe_gt *gt = guc_to_gt(guc);
>>>+    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>>+    ktime_t before, after, delta;
>>>+    bool success;
>>>    u32 status;
>>>-    int ret;
>>>+    int ret, count;
>>>+    u64 delta_ms;
>>>+    u32 before_freq;
>>>+
>>>+    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>>+    before = ktime_get();
>>>+    for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
>>>+        ret = xe_wait_for(guc_load_done(gt, &status, &success), 
>>>1000 * 1000);
>>
>>this will need to be rewritten without this function rather than ported
>>over from i915.
>>
>Re-written how?

probably adding a variant of xe_mmio_wait32() that check fields register
fields. Or that receives a function pointer.

+Rodrigo as AFAIR was involved in the discussion in the past and had
agreed on not extending xe_macros.h with something like that.

>
>>>+        if (!ret || !success)
>>>+            break;
>>>+
>>>+        xe_gt_dbg(gt, "load still in progress, count = %d, freq = 
>>>%dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>>>+              count, xe_guc_pc_get_act_freq(guc_pc),
>>>+              xe_guc_pc_get_act_freq(guc_pc), status,
>>>+              REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>>+              REG_FIELD_GET(GS_UKERNEL_MASK, status));
>>>+    }
>>>+    after = ktime_get();
>>>+    delta = ktime_sub(after, before);
>>>+    delta_ms = ktime_to_ms(delta);
>>>+    if (ret || !success) {
>>>+        u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>>+        u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>>+
>>>+        xe_gt_info(gt, "load failed: status = 0x%08X, time = 
>>>%lldms, freq = %dMHz (req %dMHz), ret = %d\n",
>>>+               status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>>>+               xe_guc_pc_get_act_freq(guc_pc), ret);
>>>+        xe_gt_info(gt, "load failed: status: Reset = %d, BootROM 
>>>= 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>>>+               REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>+               bootrom, ukernel,
>>>+               REG_FIELD_GET(GS_MIA_MASK, status),
>>>+               REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>>+
>>>+        switch (bootrom) {
>>>+        case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>+            xe_gt_info(gt, "invalid key requested, header = 0x%08X\n",
>>>+                   xe_mmio_read32(gt, GUC_HEADER_INFO));
>>>+            ret = -ENOEXEC;
>>>+            break;
>>>
>>>-    /*
>>>-     * Wait for the GuC to start up.
>>>-     * NB: Docs recommend not using the interrupt for completion.
>>>-     * Measurements indicate this should take no more than 20ms
>>>-     * (assuming the GT clock is at maximum frequency). So, a
>>>-     * timeout here indicates that the GuC has failed and is unusable.
>>>-     * (Higher levels of the driver may decide to reset the GuC and
>>>-     * attempt the ucode load again if this happens.)
>>>-     *
>>>-     * FIXME: There is a known (but exceedingly unlikely) race 
>>>condition
>>>-     * where the asynchronous frequency management code could reduce
>>>-     * the GT clock while a GuC reload is in progress (during a full
>>>-     * GT reset). A fix is in progress but there are complex locking
>>>-     * issues to be resolved. In the meantime bump the timeout to
>>>-     * 200ms. Even at slowest clock, this should be sufficient. And
>>>-     * in the working case, a larger timeout makes no difference.
>>>-     */
>>>-    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>>>-                 FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>>>-                 200000, &status, false);
>>>+        case XE_BOOTROM_STATUS_RSA_FAILED:
>>>+            xe_gt_info(gt, "firmware signature verification failed\n");
>>>+            ret = -ENOEXEC;
>>>+            break;
>>>
>>>-    if (ret) {
>>>-        struct drm_device *drm = &xe->drm;
>>>-
>>>-        drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>>>-        drm_info(drm, "GuC load failed: status: Reset = %d, 
>>>BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 
>>>0x%02X\n",
>>>-             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>-             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>>-             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>>-             REG_FIELD_GET(GS_MIA_MASK, status),
>>>-             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>>-
>>>-        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>>>-            drm_info(drm, "GuC firmware signature verification 
>>>failed\n");
>>>+        case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>+            xe_gt_info(gt, "firmware production part check failure\n");
>>>            ret = -ENOEXEC;
>>>+            break;
>>>        }
>>>
>>>-        if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>>>-            XE_GUC_LOAD_STATUS_EXCEPTION) {
>>>-            drm_info(drm, "GuC firmware exception. EIP: %#x\n",
>>>-                 xe_mmio_read32(guc_to_gt(guc),
>>>-                        SOFT_SCRATCH(13)));
>>>+        switch (ukernel) {
>>>+        case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>+            xe_gt_info(gt, "firmware exception. EIP: %#x\n",
>>>+                   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>>>            ret = -ENXIO;
>>>+            break;
>>>+
>>>+        case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>+            xe_gt_info(gt, "illegal register in save/restore 
>>>workaround list\n");
>>>+            ret = -EPERM;
>>>+            break;
>>>+
>>>+        case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>>>+            xe_gt_info(gt, "still extracting hwconfig table.\n");
>>>+            ret = -ETIMEDOUT;
>>>+            break;
>>>        }
>>>+
>>>+        /* Uncommon/unexpected error, see earlier status code 
>>>print for details */
>>>+        if (ret == 0)
>>>+            ret = -ENXIO;
>>>+    } else if (delta_ms > GUC_LOAD_TIME_WARN) {
>>>+        xe_gt_warn(gt, "excessive init time: %lldms! [status = 
>>>0x%08X, count = %d, ret = %d]\n",
>>>+               delta_ms, status, count, ret);
>>>+        xe_gt_warn(gt, "excessive init time: [freq = %dMHz, 
>>>before = %dMHz, perf_limit_reasons = 0x%08X]\n",
>>>+               xe_guc_pc_get_act_freq(guc_pc), before_freq,
>>>+               xe_read_perf_limit_reasons(gt));
>>>    } else {
>>>-        drm_dbg(&xe->drm, "GuC successfully loaded");
>>>+        xe_gt_dbg(gt, "init took %lldms, freq = %dMHz, before = 
>>>%dMHz, status = 0x%08X, count = %d, ret = %d\n",
>>>+              delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>>>+              before_freq, status, count, ret);
>>>    }
>>>
>>>    return ret;
>>>diff --git a/drivers/gpu/drm/xe/xe_macros.h 
>>>b/drivers/gpu/drm/xe/xe_macros.h
>>>index daf56c846d03..eac8f2c9fba5 100644
>>>--- a/drivers/gpu/drm/xe/xe_macros.h
>>>+++ b/drivers/gpu/drm/xe/xe_macros.h
>>>@@ -15,4 +15,36 @@
>>>                "Ioctl argument check failed at %s:%d: %s", \
>>>                __FILE__, __LINE__, #cond), 1))
>>>
>>>+/*
>>>+ * xe_wait_for - magic wait macro
>>>+ *
>>>+ * Macro to help avoid open coding check/wait/timeout patterns. 
>>>Note that it's
>>>+ * important that we check the condition again after having timed 
>>>out, since the
>>>+ * timeout could be due to preemption or similar and we've never 
>>>had a chance to
>>>+ * check the condition before the timeout.
>>>+ */
>>>+#define xe_wait_for(COND, US) ({ \
>>
>>we don't want an wait for on arbitrary condition. At most we wait on a
>>register to become something, and for that we already have
>>xe_mmio_wait32().
>Except that function is insufficient in this situation. What we need 
>to wait on is a status enum register, not a bitfield flag. Some values 
>are intermediate steps, some are fatal end conditions, one is a 
>successful end condition. Simply waiting for a single value is 
>useless. And expanding out the macro to have the wait loop inline in 
>the GuC code is against the kernel coding principle of using helpers 
>for anything that could sensibly be a helper function.

not in xe_macros.h, not re-inventing the timeout handling that is in
xe_mmio_wait32().  You are still waiting on a register. It's just the
condition check is different. Why have one in xe_macros.h and the other
in xe_mmio.h?

Lucas De Marchi

>
>John.
>
>>
>>Lucas De Marchi
>>
>>>+    const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * 
>>>(US)); \
>>>+    long wait__ = 10; /* recommended min for usleep is 10 us */    \
>>>+    int ret__;                            \
>>>+    might_sleep();                            \
>>>+    for (;;) {                            \
>>>+        const bool expired__ = ktime_after(ktime_get_raw(), end__); \
>>>+        /* Guarantee COND check prior to timeout */        \
>>>+        barrier();                        \
>>>+        if (COND) {                        \
>>>+            ret__ = 0;                    \
>>>+            break;                        \
>>>+        }                            \
>>>+        if (expired__) {                    \
>>>+            ret__ = -ETIMEDOUT;                \
>>>+            break;                        \
>>>+        }                            \
>>>+        usleep_range(wait__, wait__ * 2);            \
>>>+        if (wait__ < (1000))                    \
>>>+            wait__ <<= 1;                    \
>>>+    }                                \
>>>+    ret__;                                \
>>>+})
>>>+
>>>#endif
>>>-- 
>>>2.43.0
>>>
>
