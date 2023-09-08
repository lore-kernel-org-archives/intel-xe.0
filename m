Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69480EEB570
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6410E94B;
	Fri,  8 Sep 2023 20:33:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F4F10E949
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 20:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694205194; x=1725741194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6kMw4oBUsr2JhBCwZprlnAdIk4keeUg2Kvz+ndlTsEE=;
 b=eTYvijOsuO0aDixmW009KEQfICXpeH6SUAZ30JqhEysZgFG6lYr/94Sy
 /ssmpxCkubZXzIwOPyyc9BKejPgx+T9D/Ops9X1O/+OhrYvrvLPxg4qlF
 NTW6vxQtJyeJGj7Hk9ss7OtgjXByYLqEw0fg7RSzPIgGRjQFtG7jlw7m7
 TsdxTbJ8cFG5RIi8kA6MjUwA670eCHGa35hkFm3UGlr89OTjjRH4I8t6H
 2mMjIG/qD2dehaHz4rbk2B3eMHK4SYbuQ4ytKmCDJs156p8tT404xjQmg
 xSMksggX9fM/+gkuShVe26wZkUYJOeP1VZLzhRqRIQFRWX5h3t05Akg8S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357205364"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="357205364"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 13:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="832780867"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="832780867"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 13:33:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:33:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 13:33:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 13:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNLYCrxg39sM02ZrlnQjLVHNmMyPB0DwCF7wyBAjljKQsBQtJE0YCawYFDtM+qu9v+Q7qmwRaSH11iPNsLcpuBMbgEE3QxGymUs1h+OjTUVGN8gJKPVWX8U68Bn+eueam9FIwS8nRcZK3wTFejrE23M41abIMUr9E2Yy0Fo30UcBOPU9QdB5ynvmEtcObS71XDb0Qm6PA8Y1v1KlUMjWrLJkCzwMeYlKYs988yw2eBpHDAA1hQV0HqdosAaiGtOe5Er0CUbDnUMcOeK1zui7M2K4Uds76kgJir1TkHI+8P+/b1ld4ifOzH3sj55xftodKO+TUP1yAz7cpzDyjT+bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpM5NPQTSnxp4Fy5BgnI14o3Jg7etmHk9PPTMUiYo5s=;
 b=c5J7F47XVMFqpYAiHfw31NPzXpdnAVSP4Pw9913clbCydorTLlXZZ1HzgLyPY3Ihzsplqqcq09V6hVs/WBaqAEIarGssFIECX7bT+tydzx8CQKRAH1IGTrmMuqgsgVFa0oW1uizPcVOFksCGwVjsNK3W9AK+KkkriWKusd7UUXjKysux3TlzKQEA3WjcHT3F1ag2B1TqR6pZIX1kc5OiMiZtnaHlOJPxLyoTcPsc8Qr2q4ZsZ+8WLZiF0A1DmD2zd8Lu5KjCVyLbw0C0FvEvUmQxsFMT34oUI60xPjzGoaWb8e2kEzZNHhBvmWh6EXcJfNBZDZyVDHeZ/MZGnO2t9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 20:33:11 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 20:33:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 16:32:58 -0400
Message-ID: <20230908203302.449041-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908203302.449041-1-rodrigo.vivi@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0015.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::20) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 4005cc6e-b62f-4bf4-c502-08dbb0aad151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hYriN2eMF4JjZkRCCbblQjE8f+1Sic6tkcUQYtecSvDnODz+eXu00/EmWVIbZUFFVEQHGrd7Qw6GR1k5HGLhQox6BXIwkDuWZFqDIhPdGNxsZYpybEJtjBazzH/aU2n+CPdzC8jx0a+aOC0/i544Wpayev07lL2A9naPBxKZUUrW6lVz7ZO5NZR8e9VU4JVZwgUb15AcWxKF3WVjPy2pvJkHSZ+rouyKU9ZSoBqyesEPuSvo4syyqJwRCyuyc96+oe5qKkdPkBgm5/TDQs/NfBkgJ88FpaxOfU3W32+9xqZHRoZ1cyKXdCEnthDLknBIuW243qiM3BExhtFUEfpqboJ2vSYHFSzWg1rBqNn2EGVJxXxSqVlVpHyoi+6yKkiR6ZGfCH4DuHxNoV4Kh2SSXT/bokRiZxbfVJfRFEsehzxoRDqGI2fmPjAxDEnfGQUoVYd4T9xoomHTkCcpgtpt4WxRkh6Q3YQDIChSIofwk73mSOrVyY7VyCmeEnDDbGvw1TVkxIOx9s4VJCr55/+xf5saFkAkWh2JEgvE8Q2ruuFZmGqaUGfTFwPk9Qtvnfh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(6666004)(6486002)(6506007)(6512007)(36756003)(82960400001)(38100700002)(86362001)(2616005)(1076003)(26005)(66574015)(41300700001)(83380400001)(478600001)(5660300002)(8936002)(4326008)(8676002)(44832011)(2906002)(66946007)(316002)(54906003)(6916009)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVM1dVBhSXp4VmNrcC9uQ0JUdjRDaHRMWjQwbmpHei9FcjhkV2MzTnFCUld6?=
 =?utf-8?B?LzU0S1VTRDVpSDdGTTBYeGQvZ20xNHZ3ZHlneHVQcnd1cWhYY002NW0vZmtC?=
 =?utf-8?B?a0hQRTFSNHJSVXNkNHdJeUhMVTlTdloyVnRVSElmTGRsWlNGYXVONFRMbUlW?=
 =?utf-8?B?MDE2RkE1TVBQN2ZLbWsrZThWaUltUGcvamsvNjhvWkVkYllPOVpVcTBxY1pN?=
 =?utf-8?B?V1ZoTm5JMXVZMDNUN1h2TktBQ0laQlpzY0ZuWG9WRTJGSFRzUW9KUlJlRkgx?=
 =?utf-8?B?Zm1MeWNpNktOeTZlOXFRclB6eDl5YzVCMjdoKzVvVURPTnhSWlVCNldjZkZx?=
 =?utf-8?B?a3FndEs0dWQ0K2UxUEc2NUxSMXNpZGpLbHBMTEIrTmZ1RWxZek9JR0xFZW5u?=
 =?utf-8?B?UWUvSVRtdDUrWU42a0YzUmhNeUZFSVFidDFYd1llck5vVmFmcFJDb0h4bUFy?=
 =?utf-8?B?YmE0THA3eDduVkcvaktPeUlnUVA1Uk1lMWZZbWpNRDBuMC9qU1IxOWJ0M3h6?=
 =?utf-8?B?YzhJdVJCbTNBS0c5QmhjYkY2YnluRDJCeHR0aC9zQ0s4YjBvUE1FaDBjQzBT?=
 =?utf-8?B?VnZOMXJwSVl3c1FnREFJdUIvKzJrQ05uZFk5ZFJsNndYNzZxZitmbW5uVndS?=
 =?utf-8?B?WkZkTjliMWtTNDZDOU9aSVZRcVlWNFlJR3RXa0IxazR1YUNxQ1pYZFZFUnRm?=
 =?utf-8?B?ejRNdVRnQXhEZFdtcVdqejExN2lrdUVHOU1vVGJhTjlEeXVhNzJuRCtLV3Ay?=
 =?utf-8?B?bFIzNk5wMDhja2NkR3hERUF6ZXlvUE84dHkvcjJhM0VHcFdwME5WNUhBVGhD?=
 =?utf-8?B?dFphZnlGYWRhZU9rK3ZzazMzL2Z6VGpvczFsQWY3ZFFicTdobzdMQzR1SktV?=
 =?utf-8?B?dDJNdGJEMGFqMU1kbVphSm1YTnBCd0NXVVpadS9PY1J3L2NLNnNwc3BCS2ZY?=
 =?utf-8?B?Yjh3N1I5cEd6OHRrK2R4MTRMMlI0NXBINWhsZ2tlaFBWVDlOaHkrU2NBQlVI?=
 =?utf-8?B?cE5UVXEyb2hoVG54Ky9JOVlYMmk2YXJVd09RV0l2NkQvUnpWdHJTcmJtQVAz?=
 =?utf-8?B?dWQxQ0JTVU1SM09HUWRxTlN2ZGlnTlhwQlZYV1pXQ3VhV3JHQkZtdk5rNzdO?=
 =?utf-8?B?bGl1R29YaTd2ZmkxK3RFak0yZ3ZXWDBQN21QeldKQVlBWTNDcGgxRlByTTI4?=
 =?utf-8?B?cGo2ZmZlZzY0cE1rcVJEMFBzOGcvZDhPMmg0WFNxWmZ2OWROaUdMN1VRa3dp?=
 =?utf-8?B?MFNxYk8yckMzZHNwUjk4ZEVqNmI3b01lRlB2a0c1bGNReFVkVDdjbitRS1JV?=
 =?utf-8?B?UjFqdjJSMVpncGNMcGpCSlVwM21nWU1PR2dnZ3phZEpHQklFL0lzb0xLMEpN?=
 =?utf-8?B?QVgwTTNNMkxxT0FldSt0aTcrbGdqVEdZZjA1djMzbXZrT1k2WUhIV1g0WGdl?=
 =?utf-8?B?MEowT2hCZlBMdTBsOExYTmZlRS90UnBBVEZyWUtZSUttSFRSWFppZVlmS3lS?=
 =?utf-8?B?TGRBMmlRUFl6RElVSXRublA5NFhqWTQzQ3dmQktuZlVHYTllQ1QvcFNzcGth?=
 =?utf-8?B?eDg1S3ZVTFozVVN1eWU3TEMzMDM0c0MwL29mYVptTUJjN3ZXVXRrTC9JZDFF?=
 =?utf-8?B?bmFuRUxNdSttV0U0cWRPREFyek9hcG9Vb0R0bmhIZEJ5eGlBUlRGWG5RSG8w?=
 =?utf-8?B?cSt2MWxOaEljWTZiMUtYbXZhTnl6dEpUdjBwNkIxaU52L0hTeGJFelNReURn?=
 =?utf-8?B?UTJSZm9XQVk5K09yTEEwdVEwRTBWQnhjNGRsdmFnNjNJQXlnSHVTUy9wYkdX?=
 =?utf-8?B?N0VEb3pBMi9RZ2U1Um9RU1VDUkoyVitzK1dlVXZQcUtIeEJidTIrT2FXMnJ1?=
 =?utf-8?B?ZHIvckRRSG1CcGhXRVJxZWtPME1PU0NrdUdML0l6MEVGaHU5c052WDdtRGF1?=
 =?utf-8?B?Ny9OaE9FQ1JKTUR1QlhpQ3E3cEQ0MW1qaGUyTHpOamNHTHpuY1dEK21adVNj?=
 =?utf-8?B?VURFdXp5Tzc4RUJlQmpVSE5RZlB6ajV4TDJxU1p3NnQ0dUY4cmdoMkNXUGtI?=
 =?utf-8?B?c3BKRkZiZzVyMklPNkpQaTVDT2ZhODZBMmNKcDY0RTJ5N3p2T2daQTExS1di?=
 =?utf-8?Q?XhaagXHXYf805Zl3/S+0iIi3q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4005cc6e-b62f-4bf4-c502-08dbb0aad151
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:33:10.8883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqTSPaKXrTMAsszOXs4CjCM5KdigVoMEEOhrKVj+LlB26ZLzPsKn46lQh6q1DmnVeYDagMYBqfJ6zwCZp5ulXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 1/5] drm/xe: Kill
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This extension is currently not used and it is not aligned with
the error handling on async VM_BIND. Let's remove it and along with
that, since it was the only extension for the vm_create, remove VM
extension entirely.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 129 +------------------------------------
 include/uapi/drm/xe_drm.h  |  41 +-----------
 2 files changed, 4 insertions(+), 166 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1d9aa5c40659..9cc69696a8ee 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1368,37 +1368,6 @@ static void flush_async_ops(struct xe_vm *vm)
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
-		XE_WARN_ON("Copy to user failed");
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
@@ -1884,91 +1853,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
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
-	struct drm_xe_ext_vm_set_property ext;
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
@@ -1985,6 +1869,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
+	if (XE_IOCTL_DBG(xe, args->extensions))
+		return -EINVAL;
+
 	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
 		args->flags |= DRM_XE_VM_CREATE_SCRATCH_PAGE;
 
@@ -2027,14 +1914,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
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
@@ -2947,8 +2826,6 @@ static void xe_vma_op_work_func(struct work_struct *w)
 				vm_set_async_error(vm, err);
 				up_write(&vm->lock);
 
-				if (vm->async_ops.error_capture.addr)
-					vm_error_capture(vm, err, 0, 0, 0);
 				break;
 			}
 			up_write(&vm->lock);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 00d5cb4ef85e..51c4ef5dee6d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -480,42 +480,6 @@ struct drm_xe_gem_mmap_offset {
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
-/** struct drm_xe_ext_vm_set_property - VM set property extension */
-struct drm_xe_ext_vm_set_property {
-	/** @base: base user extension */
-	struct xe_user_extension base;
-
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -600,10 +564,7 @@ struct drm_xe_vm_bind_op {
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

