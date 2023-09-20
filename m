Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093F6C04FF3
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDD110E549;
	Wed, 20 Sep 2023 19:31:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F9B10E549
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238280; x=1726774280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ahFecBNFRNgoMKeibNLFH3rqgwLjjP7RYUpcByv+Mpc=;
 b=W3j/cyn5AGs6k90W3H/83aJ2X7IR9q/UyqdZfk1gbFLsGwwRBZsLWaK1
 zDIRVNreb0335sa/TnJbPMZjuRKL0dE/Z/5eSTcCVzmVJ2l1FUFXKtbR8
 /fY8AMLm+OSO/15f8437kPEtEvwDeHSCCwDc/IfT9fyi6I7WnmnWjE0Yh
 FBskU/O+BQVgSJY8ArJmqwzogE5FG144YApc4/uPts2BHW7Rnd0hbKnRy
 8OmBKW3SjigQ6OC86wsS3llAVECqyDp9LZgjpWMKc16xLb/GF3g1E875C
 e+nRJ8ofQVpI/U4I9SvnMzTBuxRW2F0Vu+kBwEdL4hpVzlPhR0T2nZ/JK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359701432"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359701432"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870498872"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="870498872"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oeuad/55IE5Hl/FLJnPL0bygSXNVwrfILhbiAVl8zqcPG2PUAvy5HQNsb87Ga/F0DvNoQtR7OUbTbkJRsMauzxL3WC11K92w5lX6KExO9JcQEeWNBfwxM1xC1uUkWjorucn6LZ86D6hJ7I4MO4dd0C4VJpN4NmZqqlFIpcFy76/weHF8ZMVyJxt1EZLdopcZs/Ickez78O56LiAToq6w+twBxkQ6GnsFhVTuBSBXNYcDCX7nKe9si3+YFvWsFHKfhJUFLYsVZvgbFUJpxbvR1E8d+Xd45gBOaxEmLQM+gy9Zpszs0dJr+iczuXj5kYChJ/KbOTH+UtQq7v+tBrFewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCkPZYFnKWjNf4BQ595ASlznuyHgGJzxxDXAWsdJ95k=;
 b=RP5rzcxK5VHjRRBExJUTGsrk6cLgEUybmlKMtoBDxbareb3A7Gzm9ZYvXq0PrbEe78RopADmtvMG9xOdzctJPjy3+kmTs86silmIpe7O3NaoNfr3DmsDFN7il4OQ43zfu/yWP86xna8qsJ9uYHyGu3xxTUlO3EohdyrBlqcvsM7wOWp9DiBrEPFG3mCl+RYrefjl+A0q7fKUqa9kZqAQcOXzsNfoyK1CCZPE59eokixHK1Uf9z1l9kI+Ktrj1bjDhsbS0GOA8LQpoIg27ZL/SOcrbD5aht94A02e0aDzLuLyVgSYFAozKXepgxzY3YdoWvt7Xauyu+46bauP6fs1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:32 -0400
Message-ID: <20230920192940.135004-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: eca295ab-f2fe-4ecb-5447-08dbba100d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oua1iCe5Ijw9mm5MxLE0F42Mg5CEdS1fXJeI1WEvFiA5SxwVq4iZQob+rNGyOJpj9oGtB81Q7dRznYRz7VDwunwkrjs4X6nWVY51aofjUWn8BCeutA+Y7iH9/6Pl9Gf7tFEWweLx77ncEU4sOlasveknvYSdTyLM5O6ENReIBRCAu1mvEuqqWHePVJP3HEHJx+zmC4T5O6VL234SzZ/tjGIo5DLGoAV0j6l0Id/I+1ihjS24mm4IMYK4YGiGPeqQwcPN1AJV3zvUNlXWxxN7a8ps4E/DVxBBkEh4Y9XhMxyCm2lealZkD/pE8pwYGh2CpGaDPHshK55mYmqET1DEdwafJsisrb9+kl01fECFDvJwgDNnTFFvC7yMEjRrFG2jDookzC1MMA8425SW+AIZeHEPkUJr5AZ/bn2Ugp1ybiLWBrq6xZM2TZsaKnfijkNnmsa4B0w+ATuORAnU0SLKkaCHsgTC8iPDkZaYCG61MkyI9j352tV35YseTtIrqX2q+rU/c/m/Bzl0GVUQvZrCt2FE1hMFsmBrFEJhDuWmwfAtXML1x6wzAvgbXfHL2bOv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(83380400001)(38100700002)(86362001)(66574015)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anl3Q1dPWG9vUFJISDk2T1YzSmJPQ0t3cXpzQ2VNKzAwT3NSb3F6K2o5bjhH?=
 =?utf-8?B?R0ZjbHFVTWgyQTBiTno2WUs1TnlSMDE2QzZCZGdVWWc4T1U3Q05ydlp0YkVZ?=
 =?utf-8?B?NjZuRU0yUGRub29jZ3MrUW1Lams4TmJGbFVtT0dNWjBIR3NLWUQrRjVlWTN1?=
 =?utf-8?B?Zkk1SWN5V05xakNJY1RyUk5SSE9vbFd1S1R4ejdHZXh2cXkrTUhTMjBrRmhk?=
 =?utf-8?B?Nmd3eXEwT2d3MmVJTlFmNGowRERROHpEbi9PVk1LaTVDTFk1Z0xIM1VuNEh6?=
 =?utf-8?B?Qit6dCt6VGFFc0xLaDFna0hLSU95NVFxbmVWbHd2UHZGRnluaWZVSWhHUDVu?=
 =?utf-8?B?Rk9iTWk4ZkNxQmtBb2J2MzBpZm9zVUlOTUxtWG5KUXJENDEwUDBLN01uSm4z?=
 =?utf-8?B?dVFRczhrRUtIZ21UNkpIKzR0R0lEbzBkK2FHWjQveHVMcUxWZHZaWkN0a3Ev?=
 =?utf-8?B?SWp0SnBTMU5mNnFIUTl6dWxzV2dYSzNJb2JYelF4cTQ3dEE0WktmejZsL3gr?=
 =?utf-8?B?SERTTG1wVDJ5bUN6M1k0aUtKd0pOVDFDUWdnMnNhNGNPY2wwY0ZqNjhWTmNy?=
 =?utf-8?B?VlBNWkpwbHkvZjhIdXFuRXlFVTNhSXNMeE1WSFAyOC9pQ0pHOVB2UkNvTGZs?=
 =?utf-8?B?YjRhVUNiRTREV0hJaXdtSENEV0loVE00cm9vMWhidGpvbU1MQ2xQMTlucVRJ?=
 =?utf-8?B?RU9rcDhaNjVuWi9iNHIwck1ja0dHdDM5ZnZSVHVyVHZPWVVsV01BS0d5ZS9D?=
 =?utf-8?B?RGlQV3MzcHgwelhjai9yRzZVRzZUM3Y5Vnp6R2gram9hU0UvVTlYYmo3VFpG?=
 =?utf-8?B?a1IwamdBVEhpRjltSjJ6YWlMZWRNeWRQT3N0Q3dpUXc0b0V1K1dwSXpMT0tY?=
 =?utf-8?B?dDJ1NHRrcVFLV3l4N1d4bjVYY05kaEk5eHJ2aEUzblRLQTcrYUtnRjd0RHNC?=
 =?utf-8?B?M010VkpuM0VVL3lKdlo0SjEzK2s0VFlhS0lZVGFVa2JZSSs2Y0J0QzNwbGcw?=
 =?utf-8?B?OWZhQVpnR1JNTzRad1VXWU84RkF0ZUFZTUhrNm5McjlXaXFkN0gvcUxMdGt4?=
 =?utf-8?B?cGdOVDF4S2orSlVCT2RDUk5aZnJPczliODhMZnVYcjRiM2VZaUdIc0NRVjBO?=
 =?utf-8?B?L3BXRGx2Ym9iOW9CQzRtMDQrT09aNERQWTNPeHNMaE00dUVQSmNMTWV4Mmw4?=
 =?utf-8?B?K0JhN3IwTm9Ub0tnN2pHMzJVQy9zZHdZdnBzTGVYUTR3akk0SmdLUVBFTU83?=
 =?utf-8?B?VXltM1B6TTlDUmw5QjZrYk5jNDBMZHdvaVo4RzVwWXFyVDR5Q0xVbzdpNzd4?=
 =?utf-8?B?WXZlbThTd2Q4dWZMN0treHVJOEdUUUh3UVNXeGFkMVZWcFFsTlZ4V0YvSnRO?=
 =?utf-8?B?bnhMWTN0c09UcE9FVUFwNlRUUUJOTldGTVRtV2E2bWlHeTJocGZUOGRiL1ZO?=
 =?utf-8?B?SWNlMmduVXBSZVgzRGVoKzZRNmFvVm93SE9wcFdEcUJCU1BsRmFSUDBObGR6?=
 =?utf-8?B?bFZ5Sjh6SHQ0TFVGWTlSMUZZM251MlBVSkpLQUVhdDNYdStkVjZidkFSUkhH?=
 =?utf-8?B?b2FvaDBIWnVONXFKWkoyNlhWeFZBMmhNS213NWIvV2xlMG5YQnR5K3ozOTlu?=
 =?utf-8?B?SFhtVDdjZ3VRblNpdS84bjJUZDI4aW1Jcmd3WGhpQ0VzRzAvM0FLUVdiNTZV?=
 =?utf-8?B?dXJTNmtDT01Fc21LN1haZzZ5Y3hLSVdyNnFUNC80bEFHVFV3a0NwSnRZMEJ6?=
 =?utf-8?B?dXRyQlBUaUlPdHhVanBTemZyd3d6SmVaQTJzU21DTG5MdjdsM29UT2t6QXVx?=
 =?utf-8?B?U2JjckltYXhMamczOWpBYnBNUU9uTjZuTk9vbXUrazJ3Q2JYc0hNd2RkaUJ3?=
 =?utf-8?B?d3lCbDNFN3RIN0xteUdFeXV1VDNKYXZrUnQ3bWo2MVUrOFpRbnpyUmRyUWpj?=
 =?utf-8?B?QzhLZFlqRmx3QS9PS1ZBaDdCNnlwMlRUVkdLYlJOVjREb2dZTnBCd3VlbDhk?=
 =?utf-8?B?RjJNa0phMmlxbXJldHh6REZHUytFdSthSnI4bUhZOU5GUm5qZHhqSmxGQjlV?=
 =?utf-8?B?aEx2cGtlVFhHM2xORXpHSERURzdDSWQzMi9rMFI2Zkt1NmFTSUw2aUFPOUR0?=
 =?utf-8?B?eENDalRCOEVJVnMwOFg4SDArMkExVVVOREdvTWpwWUtBYTFlZ09xaW9XWkpB?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eca295ab-f2fe-4ecb-5447-08dbba100d51
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:31.0692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8i55SPf77Y1+XuWnLdzFUQwa61HxBNCFOnHcGjEltlGe4FmlPYNY6vXAKT20QjHgxginUePgDIbDDDqPP29ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 12/20] drm/xe: Kill
 XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
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

This extension is currently not used and it is not aligned with
the error handling on async VM_BIND. Let's remove it and along with
that, since it was the only extension for the vm_create, remove VM
extension entirely.

v2: rebase on top of the removal of drm_xe_ext_exec_queue_set_property

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 129 +------------------------------------
 include/uapi/drm/xe_drm.h  |  23 +------
 2 files changed, 4 insertions(+), 148 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 33a02aca8971..f392ed428254 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1390,37 +1390,6 @@ static void flush_async_ops(struct xe_vm *vm)
 	flush_work(&vm->async_ops.work);
 }
 
-static void vm_error_capture(struct xe_vm *vm, int err,
-			     u32 op, u64 addr, u64 size)
-{
-	struct drm_xe_vm_bind_op_error_capture capture;
-	u64 __user *address =
-		u64_to_user_ptr(vm->async_ops.error_capture.addr);
-	bool in_kthread = !current->mm;
-
-	capture.error = err;
-	capture.op = op;
-	capture.addr = addr;
-	capture.size = size;
-
-	if (in_kthread) {
-		if (!mmget_not_zero(vm->async_ops.error_capture.mm))
-			goto mm_closed;
-		kthread_use_mm(vm->async_ops.error_capture.mm);
-	}
-
-	if (copy_to_user(address, &capture, sizeof(capture)))
-		drm_warn(&vm->xe->drm, "Copy to user failed");
-
-	if (in_kthread) {
-		kthread_unuse_mm(vm->async_ops.error_capture.mm);
-		mmput(vm->async_ops.error_capture.mm);
-	}
-
-mm_closed:
-	wake_up_all(&vm->async_ops.error_capture.wq);
-}
-
 static void xe_vm_close(struct xe_vm *vm)
 {
 	down_write(&vm->lock);
@@ -1904,91 +1873,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int vm_set_error_capture_address(struct xe_device *xe, struct xe_vm *vm,
-					u64 value)
-{
-	if (XE_IOCTL_DBG(xe, !value))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !(vm->flags & XE_VM_FLAG_ASYNC_BIND_OPS)))
-		return -EOPNOTSUPP;
-
-	if (XE_IOCTL_DBG(xe, vm->async_ops.error_capture.addr))
-		return -EOPNOTSUPP;
-
-	vm->async_ops.error_capture.mm = current->mm;
-	vm->async_ops.error_capture.addr = value;
-	init_waitqueue_head(&vm->async_ops.error_capture.wq);
-
-	return 0;
-}
-
-typedef int (*xe_vm_set_property_fn)(struct xe_device *xe, struct xe_vm *vm,
-				     u64 value);
-
-static const xe_vm_set_property_fn vm_set_property_funcs[] = {
-	[XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS] =
-		vm_set_error_capture_address,
-};
-
-static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
-				    u64 extension)
-{
-	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_set_property ext;
-	int err;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(xe, ext.property >=
-			 ARRAY_SIZE(vm_set_property_funcs)) ||
-	    XE_IOCTL_DBG(xe, ext.pad) ||
-	    XE_IOCTL_DBG(xe, ext.reserved[0] || ext.reserved[1]))
-		return -EINVAL;
-
-	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
-}
-
-typedef int (*xe_vm_user_extension_fn)(struct xe_device *xe, struct xe_vm *vm,
-				       u64 extension);
-
-static const xe_vm_set_property_fn vm_user_extension_funcs[] = {
-	[XE_VM_EXTENSION_SET_PROPERTY] = vm_user_ext_set_property,
-};
-
-#define MAX_USER_EXTENSIONS	16
-static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
-			      u64 extensions, int ext_number)
-{
-	u64 __user *address = u64_to_user_ptr(extensions);
-	struct xe_user_extension ext;
-	int err;
-
-	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
-		return -E2BIG;
-
-	err = __copy_from_user(&ext, address, sizeof(ext));
-	if (XE_IOCTL_DBG(xe, err))
-		return -EFAULT;
-
-	if (XE_IOCTL_DBG(xe, ext.pad) ||
-	    XE_IOCTL_DBG(xe, ext.name >=
-			 ARRAY_SIZE(vm_user_extension_funcs)))
-		return -EINVAL;
-
-	err = vm_user_extension_funcs[ext.name](xe, vm, extensions);
-	if (XE_IOCTL_DBG(xe, err))
-		return err;
-
-	if (ext.next_extension)
-		return vm_user_extensions(xe, vm, ext.next_extension,
-					  ++ext_number);
-
-	return 0;
-}
-
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
 				    DRM_XE_VM_CREATE_ASYNC_BIND_OPS | \
@@ -2005,6 +1889,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
+	if (XE_IOCTL_DBG(xe, args->extensions))
+		return -EINVAL;
+
 	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
 		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
 
@@ -2047,14 +1934,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	if (args->extensions) {
-		err = vm_user_extensions(xe, vm, args->extensions, 0);
-		if (XE_IOCTL_DBG(xe, err)) {
-			xe_vm_close_and_put(vm);
-			return err;
-		}
-	}
-
 	mutex_lock(&xef->vm.lock);
 	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->vm.lock);
@@ -2950,8 +2829,6 @@ static void xe_vma_op_work_func(struct work_struct *w)
 				vm_set_async_error(vm, err);
 				up_write(&vm->lock);
 
-				if (vm->async_ops.error_capture.addr)
-					vm_error_capture(vm, err, 0, 0, 0);
 				break;
 			}
 			up_write(&vm->lock);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8be3b25928bd..817fdb762758 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -555,23 +555,6 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/**
- * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
- */
-struct drm_xe_vm_bind_op_error_capture {
-	/** @error: errno that occurred */
-	__s32 error;
-
-	/** @op: operation that encounter an error */
-	__u32 op;
-
-	/** @addr: address of bind op */
-	__u64 addr;
-
-	/** @size: size of bind */
-	__u64 size;
-};
-
 /** struct drm_xe_ext_set_property - XE set property extension */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
@@ -592,7 +575,6 @@ struct drm_xe_ext_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -677,10 +659,7 @@ struct drm_xe_vm_bind_op {
 	 * practice the bind op is good and will complete.
 	 *
 	 * If this flag is set and doesn't return an error, the bind op can
-	 * still fail and recovery is needed. If configured, the bind op that
-	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
-	 * Once the user sees the error (via a ufence +
-	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
+	 * still fail and recovery is needed. It should free memory
 	 * via non-async unbinds, and then restart all queued async binds op via
 	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
 	 * VM.
-- 
2.41.0

