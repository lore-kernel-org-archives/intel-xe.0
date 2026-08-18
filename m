Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1937C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 20:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774BF10E067;
	Tue, 18 Aug 2026 20:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfSFagYc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B90B10E067
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 20:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787086404; x=1818622404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WAWcFx+S2rE/AqO8yTziIRYANiFj7owTbaL1d3meE6c=;
 b=lfSFagYcHBJ/3pIP6h4x52Tt+hlkOxyasTJEHtCUmkN66k7qRdkCVnGF
 7995R+XXsUSRF1clRBWybrlteooG86iinibUfN0shPO+UStMGgODRQ9jZ
 AV4nliUqtDorsBIG0wnYTBLB7tA1G3vLQ32oQ96nB5z43uLiQpRmEVe+l
 pkikJqcY/dZVVz6ZusM7xznJiyz/cdKDhuBNYF1Rfe/ObmugtIMUN0gcS
 O7C7bZJll8CoYpF27r7jtyu+VzS2UNeNavuBWafN/IIe4rb14kVaYWW2o
 s3qiI8PgF2wsGETwpjWgBBfp/C99eMftA8jtNmTmoHwencTc7+PFUeKZf g==;
X-CSE-ConnectionGUID: 9X2NWogoTdOvwpWTLpqxxw==
X-CSE-MsgGUID: DD5/gxXjQcSwjwwc6x7BiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105125053"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="105125053"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 13:53:23 -0700
X-CSE-ConnectionGUID: ePwevk5cQ82F3dootwRIHw==
X-CSE-MsgGUID: oCEHwkvCSnGIAcfRzlOxUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="261123956"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 13:53:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 13:53:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 13:53:22 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 13:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2LYKoVu3lwYvyfhid6y2Pmcr4bVaQnCvHBIdBlRxnyWRYXr5VYP0uBIerOH43pg6KQ59EwjsESUZ5j6ovIhi1CHBvsQY6Apn5hXRa329smshcUwv8SD3iJ7uujYYVnLgCYVvq5fXBfWfOQsLKuUfuoVBW9Ryo/lzX71+VqSQ4Sivu+gIWFOAgLt2IVsvK/vDqY21xFzNOjZg5G3BsPk8mOuqTRbqEzmSsRDnvU759sL2Ld5w8d2rM1C69qtVuoMwqjkFYCSDWs/DyopIn4gADStG+sZ0uYcBVJ7bIMIY0LJRNFlpiidpwGbUBUHpWCni2I+NSSOacwAlAKx2wQlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDmVusWeRVdXCPNhtOcnkGrIwyV72qVFsrOe30rW7ng=;
 b=ti4/evPgUI49nFBKcqp9hwp8MMjtNtbBWNgaLdlWKj+tQbme1RZqAsgjdpMZ5qHMjzcwAkWOg7tLBJBJcMa+6TOT5f/oP/YqGJpuLp1bkzqfXZfpkcjp0aPTHvv9ryhOlfar9f+nTDZiT6ttXbyJn9Kd7UIIr27ic9aVkMKds/wBkv3MW9Nn1ddXM/v6hipF1tjF69r+I5PZcKuoCMhs3NMmOt7kE9CjU9mChCxcaeTgW7I+FeA4DUAYe0f+d94CyKSrTDBQ1KjpyPRmfHQeCeV7J4LSQg9J5pTriRUqpbxH88urdkPJHIDlhMn/OixvrFM045K+wclTM5ZxSEqA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 20:53:18 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0315.014; Tue, 18 Aug 2026
 20:53:18 +0000
Date: Tue, 18 Aug 2026 13:53:15 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoTGO2iyIgHK-QMd@nvishwa1-desk>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: a6aa639d-07d3-4166-d75f-08defd6abb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TIJHV1+hL5tUOuPFTN6kaHa+W1BiEb/k6vho5S/N6V2AHea1Uv7fSuxpbt7YJ1MGMlxSFvQT+v3Nh3bTA5WBOgmhMFtd1WxTHRdkt2d8Xt8NWIlBwR44hK68QYmo5CMfA9Y3e8XvXKmuTRdmOiqEeUpGGMS8nbD/B2U7+klqzwTChgZxSfTZIil4rGFyQ/IfUZI513CLLpHICFiE0BLsZ5smjBbx5ioAQpJWVeV4HOd7kHzZuUbkFfIcPH/q8rWqpIzlIVqYnUF9nqaF6pVck1TnnNmKZVDsnGP+ECxsn8nz125cOG452WnT04gvzcqgDPMtxfNB43XBrjyQOi7KQn0UHZNV7dPx1qH0JnM7St/NjYbAUnlHg0r2xGgAkRuk7zRBvUS1OO6yqhnFgfTXlLso3FEoqnN5BVysIrMAwf9UmoVTN+Q7Qnat/2dNcCaRKPgR2MQp41b11q9z88IuTYTMQYvw1ITfT/pMzD7ylCnmJWnEn1h1gdFVxVqLkR9hEIikSDb+u0ptqP97GcBVWW3Who+TZD4Q2+20Cqd1YumofnTOLQHRQT/+zBYPVD2nbnIIo1x1XIwV843sdRiSBOa9b+y/NdJ87cNPfE/1JFXLhQSmGp7Pubupb3j8+m/bD9/IjyjuTrepBbXNoMVrgwCRUQsCfysKEF2vB02/qMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SmUwu+gbMO9vQxiEPw72jDhMWVfSkqaTOcqY5/hhnYIOWYB126wpwT+NenfN?=
 =?us-ascii?Q?zhnqTFkb2/inTtEld2SG4fwIVYgf/vhKOIZvEag6RRI2pJ/CFPXeh6Kfak3J?=
 =?us-ascii?Q?QRybPbqnr/4KIDKo5rVJsr1FiOxU/+fWJwlW1MQEcgETWc3FE8C8K3IXbVah?=
 =?us-ascii?Q?uYqNxhWYX8ah99WCjeIhDPsD2YW4mI2q018B/J4j1BOTV0FzimQZn9QpPUxx?=
 =?us-ascii?Q?q+aCjp5UaTGg55mw8sTM9pUy5lGSNs+yZ/X/r0VbevjeTFp9PymgEiQZCP9k?=
 =?us-ascii?Q?J7Q2GTfHe8NUFtS29EK/8AuLZ+fyPca5+a/3qfoI+oko3VeiaukjuNwKdaQf?=
 =?us-ascii?Q?LpVgBR5X0P5JfvGyey9V+WVOAQKTGGETw3J9kXlxXg2sDqZodTbn59pE921C?=
 =?us-ascii?Q?laOlkqME55uC+GXczZsHcdLX5ZlVnaMd26e1i2gwgKbovfsIwbEtqwwv8nUI?=
 =?us-ascii?Q?sir5RdACTNJ2+sM9jcvqMVhxCEVpuDWfpwLBlBiLVSys3yH5OkpVk7RT9Iko?=
 =?us-ascii?Q?h5HPuOj+Fh98vm5Ivo9fGUxnmR58g5Ef/QIzt8aYyahfbofXc0NKOFwL1fXP?=
 =?us-ascii?Q?tBddfWjdWRVm/VcCsDzQ7KBSw3o/RUYBMGF5vZSF1MloKJ72XtGpdunws9WX?=
 =?us-ascii?Q?k1elau8bkQV4Ub1bhfUeh59gy1wO+U02kOk+UaG98Ey46GiF/Wt96gENilkw?=
 =?us-ascii?Q?0FdH0Q7x1rXY0pt/157jJhu6exnXVkZxiiF6qBmNiyAegdQwUDIwpckKlqsk?=
 =?us-ascii?Q?MYwNhFPhjZYtqrxs1u8MBfKOekuTb8GGqCv19DSQprOKIrVFV5W5xh95XoM0?=
 =?us-ascii?Q?rdOEyTO5nYBcrNwAJYc8+9hHibe6PH1dOMQ5Zym0aiWQJSXzxkyb9D0zUNsP?=
 =?us-ascii?Q?RSJW6ftoo/T9NC/sj8z+CZGunjDlD31WhOqURRNfk2r+3DKvcOcot4thwgyG?=
 =?us-ascii?Q?NNEbcdSFy6JC4ip7oUtKtGhSIUGIof545OUGQXIPa0TvbmNHakDLpNp4guCt?=
 =?us-ascii?Q?iLeo3GfgtPnxQyrDl5g1vs7E0J9HTlWmSGlX7FFGFGqzheRTG8t6E/843MCf?=
 =?us-ascii?Q?g0ZRyNfr394iCkXKpTYjv1Di1zzhPm8SwMO7mc1EeHdE7enuku1sNyfx5l/V?=
 =?us-ascii?Q?IPcLoGSCld34b1tBXKazgCHcP9v6pHSGSlpdq27P1ECF3LVqzyOV9tD34WgG?=
 =?us-ascii?Q?95AaEIZ1uz7O+l08MfbfV7CqGc1pVkcNBlMuCyk+7Lxty5pYsGJXvBdzD1QF?=
 =?us-ascii?Q?Ws8S6T2IiucAug2FNwp586u6igEKOBF9RB6CiOVndY1acAYrwFxhl1ov0YAL?=
 =?us-ascii?Q?Y1HV6EgJwHmYEqBEalOoTGRdHvuhikAHJdqIe3RWJQzFVz9/Q826haJVnG0x?=
 =?us-ascii?Q?wsnfW6FshDIXoTRZhfnKQE2JOnsnpOSZShJta4Y+ibg1gLs5EvvmvPwXSRxS?=
 =?us-ascii?Q?gI4bF9IddqqITnrZ/jSNm42Vx4W8eOR50JFrXeYTERaBLRYOpgi4L6jR2lqA?=
 =?us-ascii?Q?qUl06ghKO/KrfEi9d3sJcEdVGpEX+h9hm0OKpGdfUj8CDsejkmFltnZ5B4Jt?=
 =?us-ascii?Q?9DqnFHYaPbaZAvha5BlvsrnsqIR/GPYA59Nw2PSSY/rQR0otwfNJdAhw4rjh?=
 =?us-ascii?Q?inOmaFn7gjfeF5Abt6uS+Ysw5ccQUBM8BPhC+S8A/HaKF8RfUAX3BZLgk+Ie?=
 =?us-ascii?Q?khPGKAVbrbHvmhmiXh0MvysD9NNUZhakg246FaVwCkkEPRnPU6irWQgEa/fm?=
 =?us-ascii?Q?+tQ/zrX8sQUik0Z7u0TfK/wfpRLh91Y5bXlRYVI4rCAnYcEyGgH3?=
X-Exchange-RoutingPolicyChecked: Yr7TpMpI9zMJC+k1pHU3mPvgSrsrWgH/4PKJorJBc93JVzXwWEWkubTzWQLNzH1loIUk6vsUGDDCeZKB/JD9029lEBZtVRpOPYIlWwUodVcqq63uWfnks3guhx/KJW7nI9qwnwE4cmt8zD9c4qyfu1nq5e3/3zeSkwWVbZ709Y/KrlrxM3SvYiDUW8IbBmVTtIfcBZp5iuONqqAqqQU5DPckK2YZV1+5nc28Yrqff6znCYYSqSblXWPO8Oexw3JyCqB3Swv9FHOZYdIsYoDMqvlrH5vRHQtaytoUmlAUk3pYVLVTLbuqRPEaINNAL+pZOygxBknKGlkgvQ5tUo8Jdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6aa639d-07d3-4166-d75f-08defd6abb5d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:53:18.7013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ai7yNsPQDTq9PLEzLinOWkNo0RnLPB4FrZuqp3c8g8PgX97wx+/AdV1QBms2BzNk5MxBYh7DRy0B8cWqsBmI7v/bwVeA/grgOAiBt0ObsyjpPM+H9mK+epJUonhH3QxN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:
>q->guc->suspend_pending is accessed without any common lock.
>__suspend_fence_signal(), called from guc_exec_queue_kill() and the
>suspend-timeout ban path, clears the flag asynchronously. Meanwhile
>handle_sched_done(), guc_exec_queue_stop() and
>__guc_exec_queue_process_msg_suspend() check the flag and then call
>suspend_fence_signal(), which asserts that it is still set.
>
>As the check and suspend_fence_signal() are not atomic, the clear can
>land in between and trip the xe_gt_assert(q->guc->suspend_pending).
>
>The flag is already set and read under the per-queue msg_lock
>(xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
>lock to the clear paths (kill and ban) and to the three check-then-act
>sites so the check and the signal are atomic with respect to the clear.
>In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
>wrapped, since the other branch waits. In handle_sched_done() the flag is
>snapshotted under the lock and deregister_exec_queue() is kept outside it.
>
>v2: Document that sched->msg_lock also protects
>    guc->suspend_pending, which indicates a suspend message is in
>    flight, in addition to the sched->msgs list (Niranjana)
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
> drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
> drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
> 3 files changed, 32 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>index 63d9bf92583c..78ef2e8ded4f 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>@@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
> 	const struct xe_sched_backend_ops	*ops;
> 	/** @msgs: list of messages to be processed in @work_process_msg */
> 	struct list_head			msgs;
>-	/** @msg_lock: Message lock */
>+	/**
>+	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
>+	 * suspend message is in flight) of exec queues on this scheduler.
>+	 */
> 	spinlock_t				msg_lock;
> 	/** @work_process_msg: processes messages */
> 	struct work_struct		work_process_msg;
>diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>index d27826b36649..74b711abe257 100644
>--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>@@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
> 	u16 id;
> 	/** @suspend_wait: wait queue used to wait on pending suspends */
> 	wait_queue_head_t suspend_wait;
>-	/** @suspend_pending: a suspend of the exec_queue is pending */
>+	/**
>+	 * @suspend_pending: a suspend of the exec_queue is pending.
>+	 * Protected by @sched.msg_lock.
>+	 */
> 	bool suspend_pending;
> 	/**
> 	 * @suspend_count: Reference count of active suspend requests. The
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 9036f89dff7d..c565c1d32d3a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> 			set_exec_queue_suspended(q);
> 			disable_scheduling(q, false);
> 		}
>-	} else if (q->guc->suspend_pending) {
>-		set_exec_queue_suspended(q);
>-		suspend_fence_signal(q);
>+	} else {
>+		xe_sched_msg_lock(&q->guc->sched);
>+		if (q->guc->suspend_pending) {
>+			set_exec_queue_suspended(q);
>+			suspend_fence_signal(q);
>+		}
>+		xe_sched_msg_unlock(&q->guc->sched);
> 	}
> }
>
>@@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> {
> 	trace_xe_exec_queue_kill(q);
> 	set_exec_queue_killed(q);
>+	xe_sched_msg_lock(&q->guc->sched);
> 	__suspend_fence_signal(q);
>+	xe_sched_msg_unlock(&q->guc->sched);
> 	xe_guc_exec_queue_trigger_cleanup(q);
> }
>
>@@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
> 	 */
> 	if (xe_exec_queue_is_multi_queue(q)) {
> 		set_exec_queue_group_banned(q);
>+		xe_sched_msg_lock(&q->guc->sched);
> 		__suspend_fence_signal(q);
>+		xe_sched_msg_unlock(&q->guc->sched);
> 		xe_guc_exec_queue_group_trigger_cleanup(q);
> 	} else {
> 		set_exec_queue_banned(q);
>+		xe_sched_msg_lock(&q->guc->sched);
> 		__suspend_fence_signal(q);
>+		xe_sched_msg_unlock(&q->guc->sched);
> 		xe_guc_exec_queue_trigger_cleanup(q);
> 	}
> }
>@@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> 		if (exec_queue_destroyed(q))
> 			do_destroy = true;
> 	}
>+	xe_sched_msg_lock(sched);
> 	if (q->guc->suspend_pending) {
> 		set_exec_queue_suspended(q);
> 		suspend_fence_signal(q);
> 	}
>+	xe_sched_msg_unlock(sched);
> 	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
> 		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
> 		   EXEC_QUEUE_STATE_SUSPENDED,
>@@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> 		smp_wmb();
> 		wake_up_all(&guc->ct.wq);
> 	} else {
>+		bool was_pending;
>+
> 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>
>-		if (q->guc->suspend_pending) {
>+		xe_sched_msg_lock(&q->guc->sched);
>+		was_pending = q->guc->suspend_pending;
>+		if (was_pending) {
> 			clear_exec_queue_pending_disable(q);
> 			suspend_fence_signal(q);
>-		} else {
>+		}
>+		xe_sched_msg_unlock(&q->guc->sched);
>+
>+		if (!was_pending) {
> 			if (exec_queue_banned(q)) {
> 				smp_wmb();
> 				wake_up_all(&guc->ct.wq);
>-- 
>2.53.0
>
