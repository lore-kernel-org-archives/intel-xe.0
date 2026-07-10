Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D61C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 04:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F7D10E133;
	Fri, 10 Jul 2026 04:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkoWEgps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9F710E133
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 04:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783656846; x=1815192846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0dPxso+Fl9cktpt2wcMEZzqZAivhYQuwjehA7D4V5fk=;
 b=LkoWEgps/fUzuLPfm0we6luqSWSY2W2bHDhQItL8PyA9szMf6eMd3FPu
 GwFMHxUpYoMTxu1b/9nqJEeiKIWl8OLbrLLrAoaR+5gOI3Dt4tx5me37H
 S/+OmitJ0JRo6wave6FdFjm12G4lldYZG82FUrL8tOSgfzAJmWKsAYMcj
 c6+SIOVU6LH+DI8Hd9xTCazW31zyYGngoFki8yL5HEAsgCATL2D5e+7qN
 Xwzvd+Yvbr5L35VBlASYp74q4qkKUg9Sr9L0+pcQN5yfmCM/dmrrN2xGY
 5EoDH4w+T9otNgpJ2zteS7ygnB+6wT3KE2pe4eHt11CwC2yw852HhR0Jo g==;
X-CSE-ConnectionGUID: tDrxOmJySN+A0iCtsOXxMw==
X-CSE-MsgGUID: 3T6598UzSAuxPCH/oDE5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84453858"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84453858"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:14:05 -0700
X-CSE-ConnectionGUID: NDJzJznpSla+GtyjMzmWHQ==
X-CSE-MsgGUID: TB8bpISnRgGUA1CyjUPVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="256707646"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:14:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 21:14:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 21:14:04 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 21:14:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEj2UCA34qHc+f4qaKhqpXnqN0YzDWOQUHpXZtEONnAM0bxhWQUaTJ/F9wopkhPU0zkSp3S2957lwFZFm6C5zMfr52WkZO12BWWU2iBXFxcuxzkDoc0PBaZf0V/Wqa0iYzK8Y2ydPQjMzAuULqN5S0dMvShgdiziFY6knlDGm2CDeIyT3PAaDSC4GTx6PPOERuH6ezWYZOVtuW6Ev5qz8m2Bvav7a8E2ZL2wYFUDXX4Dx4Al8i6xC8pSl0zu8SmlH0LovA7m85To7BVNtP1vEqBZpDNDZfhkv8gWU4f2sg8slxMn4R2I63Fk5EKzGpLqr4yifSMdZqeZfra7nGvkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWujTPJ+N04wU79qXTUbNOyTcyGBo1VHFHMcaEGqibw=;
 b=QQXok49hZ0qqdnUB2e5j1x+LK1lFMSl74ydKToR1/IohTtpK6cpxMvFqW/ikV98XLOSUOmFMeAL3aQsK3uLygwFVz5HC5N8GrX/iaPUocsfuX3d7/sRY3QokTHO98j3j7iZfrvQIOOj3F45MmgBjv+fRjAi50MOVasFWHse4p72Ib0G94UgpUUC9PUuiXL4EwUcy9ThkzsVZg/9SMwWkq/pPrIMdMrDDAHquY4+crK3N1Cr9KDJvmUM72DmSzu1lc3lntnxLT1aSNNYD718kLNT5MmabhsEi2BqoqZPydSjttz0sd1AisXqja0Q1ylHXlrkbeLF7pVXpRvpOMzmvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 04:14:02 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 04:14:02 +0000
Date: Thu, 9 Jul 2026 21:13:59 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/hw_engine_group: propagate suspend
 failures during mode switch
Message-ID: <alBxh-pgi1XDTPwW@nvishwa1-desk>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-9-niranjana.vishwanathapura@intel.com>
 <alACfMCbLyNwiq4m@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <alACfMCbLyNwiq4m@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::33) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA1PR11MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 5729d867-c0de-405a-c238-08dede39ac73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: 4ZHjA+TTIVXDfCtleFYjEC+DSfFzY61rfj0GmZKKhZ/oWN0eGiMIesJk+AMc6XR+MF/diaV/6Pn6Toox7pfhpwB2iSFdJSi1Fcp3ZjUuuCN+2lfDIFlRE3yE/a92ev/pxrlfuWXkNgvz30vp+cH/fXrE+V5zOi3H9QIktESTZ6O8yooi/dhgH8oNpoZIFPxNqtISVHiYmoIhJBP6BaOELDdY7e6vvZBmk3M5q1q74K8wQffF4jjSoHYWWiqpxXBhzkEl6hGenhOJ9N1r5sAE+5eHGoiXoppWL4dw9qoR4OFNQrwc349w28wNss3RzKxGUDb0+7oaGbvis58/f0YZLZf1rLt/UyhjLzv1MNrNBwvUnpj3YVw5WZVieW9OLpW/vaklqkl2+/bIRy/ovOa3VMAxrUVFnCY20fV/tJT016IsXx8Va2/qePAanBEz7DECrkq3mxRl2Y9ZwsmfnuFTiDB91lxxVt9L7alaUdlyO52XEfCARgNUUiSp47RdSv7NPi/yE+v3kuzqiChXok6KxSGTophRjjjyBsMGl2pO9UQ2021IO31mvIqz5zj3ncJe4sKXFBYS+CcdIavryRyS0uN7M679FZIDtle29kcIGtydsyRk0i5lqmrPNCUwl9gXyR66/FmKRU6IAyYapk51wFxFHhX1P7mg+vl8yXg70SU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FjHnFylvcBrYLEeemRwjJQ4MhUvViTKT6I0oQlr7U/H2YKRSABMA7Cpvnfei?=
 =?us-ascii?Q?4kj49e/iszX3S3LdgH+35qc9tjIjEkYvP/5rmxNq7X02GIDAw+vosectPV+/?=
 =?us-ascii?Q?DMEj6wINFfPnBPXnnenYwHhBdSaiYe8I2tqKbhItNFvpgpBfGh2tBH5rgG63?=
 =?us-ascii?Q?Vto7+wh+bAVVT5mGaK4MsRrz31BAqvQ2HBJuLH12pdjosa3xd+RTjiJXayCu?=
 =?us-ascii?Q?aUm0R5dKhke3PFB6dg51Xyuf2yD/I8AKWw8ox0wJKFrRlMR2NceW/LiUBP0n?=
 =?us-ascii?Q?3Yc02HXOEPvbrU5jc7lmcyF/qxkJZMEy+K7B/+1K1PubALt/YhuF2izI581r?=
 =?us-ascii?Q?BLXjbkIFhGeYhdNICCX08ptrYeyRRJWCVxfhDR7k1vXMrRtaRKes7CSDfS1T?=
 =?us-ascii?Q?bwBGWbbrTXoFT+FkksPYqmjq6IA8wOBn8Fr13xL1iSXmrrsM97/xe6XmJzJW?=
 =?us-ascii?Q?hVBOZuDwP1kJ4GhcUG484XFsOfmDKABdnkGi1javS0NDtOPjeNvLIXZlegu1?=
 =?us-ascii?Q?Qk3z1aXVg1+9qlQSMpFhFHaqFD1Ei/dmNAn5TaYiMdBp9CPp4Trbcb3og0GF?=
 =?us-ascii?Q?bZm6x1MbMoujd1kXbS8jXw8fDU4e5/SVpgYcZR5W7wzCm8QcX6odOfPB5nbQ?=
 =?us-ascii?Q?6zsr2aJ9KVkrAFLgJB3GepIcp3CyijI/tPmL6QCSfo0DolO4CKKhXLKgrGdM?=
 =?us-ascii?Q?Ht3wYDRZ2u77CEfVKI4PG1CWi3CFxSeWQ+xCPTkV2eA4T8EjKjcsmlan1Zrk?=
 =?us-ascii?Q?7RAh/XsjfGzVwmVRmnYKM+7Y3w8rRGBD05YGmBBFQTyy3FBt+SqOlN4s45XY?=
 =?us-ascii?Q?+jNCMUtLpibe60JYqd8mwxesa1f8NmauYnAtGhd6gqe34V0qL1ds+9PzLyvB?=
 =?us-ascii?Q?tB1SZoA2T6aoXTf2Kf4KqLPfE33Z4x2zqzPqSPHFGFzcky6Sf1CvjsnPWvQh?=
 =?us-ascii?Q?wqfhs4FpkqqUiQ+jVHRTlG5I6Xy20LM7aY+4JhgQL+7m5f7M1w13YR6c4sTC?=
 =?us-ascii?Q?vqt8Nv2wBB0CU+ZBBrYrsa53RyfZH/xrPXlidLWmh4nQ1Qu80seHJXVw7Gpx?=
 =?us-ascii?Q?MlpSfgLb1HK97/5KgcfEbM/HpzOIZRBU1OR6RIS3R5sl6eAt1zTsEVI1e7kT?=
 =?us-ascii?Q?ixKIVuBlJHcyN+BIamd/jEAW2XFr0KLmJL/PTYll2oZpi7HikmTnw4bMkjEH?=
 =?us-ascii?Q?1H1BUs82reRnLyS2+rwxLHAuTWyDt3XrgyGmb0/mWwFK1rRAOJV2O99jcLuA?=
 =?us-ascii?Q?2NCn0a84eFY6JfinwBvfc+xoLhIpz0bfvBHXOubyQumA1JLyRGXNwfhtZEyv?=
 =?us-ascii?Q?VuT85LXumuxOXwPHcRXWLrfp+6oGR+Fl56ZGrOlas1Oxftj/PHWhrunD9TBb?=
 =?us-ascii?Q?KV3l+UsrA06CQJtKpNZA79eGzdOX/EiSzn03cREHtf1VOjBFJIPKAhn4tihY?=
 =?us-ascii?Q?QMimew/7b+2Ppx5mz96xNQI+UDipbG4RfgUtpd344UL5+hrKgpFCUIJAvhMp?=
 =?us-ascii?Q?O8wH28xY0eyJe2+X8iGx+6beQQI6+kz8Bx8wlDH0ONMKiru8Pvp+vLigpwv/?=
 =?us-ascii?Q?+5gEV/deyhjUR7ROG+215KOdBO4o2ZhTyO8uiK2Fqyp4M4u7mpv/9zSBZvIX?=
 =?us-ascii?Q?5wRZoHwy1bx+PkhLWNSDgaJ1bzaSi6Tq24Sl6k2TQF6QAqo3GtPRE5+5VPcM?=
 =?us-ascii?Q?ziOlGP7w9gfUOv1OH70woVkH63lpuAod5AUeIGayOA67/kFyUhy9LTR9md5U?=
 =?us-ascii?Q?4MzFxQMWvJrVx6Fy2oLV8xlpPj8t+XhqavOQDbGCeTHb6yBqQ4xb?=
X-Exchange-RoutingPolicyChecked: dudVEm/fPYiCPrymeNcepPy8vRppqx9nJINkh24/MpV5oGgBq5Ip+GIDuw5fYy3Mj1id2exZ8LfUzHST5iwnpElTYONJrbqAYwR2iRttTKFivuSVLT5ZueMtx4HD9L1vobLfdtiIc3Itw+ZqiQ1YhY0qMgpVreIyLO+RoTsY6Ia/WPgDMbHFKxYt0tcqpiiv5p6RG+f2DLPzUPTyywcuTGkJiVzKT+8z6wYxvqbmxFT2QhxirT9Hs4WsYfCkxPAR8PSOoo2iZO8aKeaHwnkJKmESwSRqH1lAbrq/bcTs4V8+fpU07CI10oZU7VJoz/WDQAN87pM/xAsG55037EBV1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5729d867-c0de-405a-c238-08dede39ac73
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 04:14:02.2579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkxADBT8relNLdv1eKz2VzwE8GXxK5eqqyXgnr0+L2CNy8abK0Wpu+0U+RSLDu6WGaO/0nZKXRsEoH6FcsNfv/thHaZx8FWGr1A0QhG5VUxPZe79bAvtkr5Q4FKlguTY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
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

On Thu, Jul 09, 2026 at 01:20:12PM -0700, Matthew Brost wrote:
>On Tue, Jun 30, 2026 at 10:07:30PM -0700, Niranjana Vishwanathapura wrote:
>> The hw engine group fault-mode switch suspends all faulting LR queues
>> but ignored the suspend()/suspend_wait() return value. A suspend() can
>> fail (e.g. the queue is killed/banned/wedged), leaving the queue
>> un-suspended, so silently continuing could later resume a queue that was
>> never suspended.
>>
>> Propagate the failure instead: in xe_hw_engine_group_add_exec_queue()
>> bail out if suspend() fails, and in
>> xe_hw_engine_group_suspend_faulting_lr_jobs() undo the partial suspend
>> via a new err_resume path that resumes the sibling queues already
>> suspended in this call. Record per-queue success with lr.suspended so
>> only queues that were actually suspended are waited on and resumed, and
>> skip the cleanup resume() when suspend_wait() failed or the queue was
>> reset/killed/banned/wedged (its suspend may not have completed, so
>> resuming would trip the !suspend_pending assert in the resume path;
>> teardown resolves its state instead).
>>
>> Gate the group resume worker (hw_engine_group_resume_lr_jobs_func()) on
>> lr.suspended for the same reason, so it only resumes queues that were
>> actually suspended.
>>
>> Assisted-by: Github-Copilot:Claude-opus-4.8
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 76 ++++++++++++++++++++++++-
>>  1 file changed, 73 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
>> index 02cf32ae5aa9..84851929c16f 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
>> @@ -34,6 +34,15 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
>>  		if (!xe_vm_in_fault_mode(q->vm))
>>  			continue;
>>
>> +		/*
>> +		 * Only resume queues that were actually suspended. A queue whose
>> +		 * suspend() failed (e.g. killed/banned/wedged) was never
>> +		 * suspended, so it must not be resumed.
>> +		 */
>> +		if (!READ_ONCE(q->lr.suspended))
>> +			continue;
>> +
>> +		WRITE_ONCE(q->lr.suspended, false);
>>  		q->ops->resume(q);
>>  	}
>>
>> @@ -140,7 +149,18 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
>>  		return err;
>>
>>  	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
>> -		q->ops->suspend(q);
>> +		/*
>> +		 * suspend() can fail (e.g. killed/banned/wedged), leaving the
>> +		 * queue un-suspended. Propagate the failure so the queue is not
>> +		 * added; on failure nothing was suspended, so there is nothing to
>> +		 * undo. Only record the queue as suspended (and later resume it)
>> +		 * once suspend() has succeeded.
>> +		 */
>> +		err = q->ops->suspend(q);
>> +		if (err)
>> +			goto err_suspend;
>> +
>> +		WRITE_ONCE(q->lr.suspended, true);
>>  		err = q->ops->suspend_wait(q);
>>  		if (err)
>>  			goto err_suspend;
>> @@ -216,8 +236,20 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>>  			return -EAGAIN;
>>
>>  		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
>> +		/*
>> +		 * suspend() can fail (e.g. killed/banned/wedged), leaving the
>> +		 * queue un-suspended. Propagate the failure, but first undo the
>> +		 * partial suspend by resuming the sibling queues already
>> +		 * suspended in this call (see err_resume). Record per-queue that
>> +		 * the suspend succeeded so only those queues are later waited on
>> +		 * and resumed.
>> +		 */
>> +		err = q->ops->suspend(q);
>> +		if (err)
>> +			goto err_resume;
>
>
>This is not right. I think what you want here is:
>
>err = q->ops->suspend(q);
>if (err)
>        continue;
>
>A killed, banned, or wedged job should not abort the entire suspend
>flow and propagate an error back through the user IOCTL. The "group" is
>a cross-process concept (i.e., a global concept), so a queue tearing
>down in one process should not affect submissions from another process.
>
>I'm pretty sure you could trivially cause a compositor exec IOCTL to
>fail by running applications that page-fault and hang, or by killing
>them with Ctrl-C. Under the right conditions, the compositor could then
>see an error from its exec IOCTL while trying to render a frame.
>

Ok got it, will 'continue' if suspend() returns error here.

>> +
>> +		WRITE_ONCE(q->lr.suspended, true);
>>  		need_resume = true;
>> -		q->ops->suspend(q);
>>  		gt = q->gt;
>>  	}
>>
>> @@ -225,9 +257,13 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>>  		if (!xe_vm_in_fault_mode(q->vm))
>>  			continue;
>>
>> +		/* Only wait on queues that were actually suspended above. */
>> +		if (!READ_ONCE(q->lr.suspended))
>> +			continue;
>> +
>>  		err = q->ops->suspend_wait(q);
>>  		if (err)
>> -			return err;
>> +			goto err_resume;
>>  	}
>>
>>  	if (gt) {
>> @@ -240,6 +276,40 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>>  		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>>
>>  	return 0;
>> +
>> +err_resume:
>> +	/*
>> +	 * A suspend()/suspend_wait() failed partway through the mode switch.
>> +	 * Resume the sibling queues that were already suspended in this call so
>> +	 * they are not left suspended forever.
>> +	 *
>> +	 * resume() requires the suspend to have completed (suspend_pending
>> +	 * cleared) or it trips the !suspend_pending assert. So skip the resume
>> +	 * when either:
>> +	 *  - suspend_wait() fails: the suspend did not complete (timeout, VF
>
>VF recovery is a non-issue given page faults are not enabled on VFs which
>can migrate. Don't bring that up here as if that needs to be handled
>this code would have to look different, or mentiond VF recovery doesn't
>need to be considered.

Ok, will update comment here.

>
>> +	 *    recovery, interrupt), so suspend_pending may still be set; or
>
>IRQs are a valid concern and this part doesn't look right.
>
>> +	 *  - reset_status() is true: the queue was reset/killed/banned/wedged.
>> +	 *    suspend_wait() can return success in this case via its killed/
>> +	 *    stopped wait condition while suspend_pending is still set, and the
>> +	 *    queue is being torn down anyway, so its state is resolved by
>> +	 *    teardown rather than by a resume here.
>> +	 * In either case leave the queue marked suspended.
>> +	 */
>> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
>> +		if (!xe_vm_in_fault_mode(q->vm))
>> +			continue;
>> +
>> +		if (!READ_ONCE(q->lr.suspended))
>> +			continue;
>> +
>> +		if (q->ops->suspend_wait(q) || q->ops->reset_status(q))
>
>-ERESTARTSYS on this process doesn't mean a different processes queues
>are bad. I believe what we need to here is suspend_wait_no_irq(q) to
>recover any suspended queues back to the resume state. Yes, ctrl-c /
>process kill will have block but I don't see any other option to
>maintain balance.
>
>So I'd write this like:
>
>if (q->ops->reset_status(q))
>	continue;
>
>q->ops->suspend_wait_no_irq(q);
>
>Or feel free to a no_irq argument to suspend_wait.
>

Ok, will add a q->ops->suspend_wait_blocking() to be called from
the error path here which will just use wait_event() variant (the
non-interruptible variant) and will not include vf_recovery()
check also. So, it will be absolute wait in the error path.
Is that fine?

Niranjana

>Matt
>
>> +			continue;
>> +
>> +		WRITE_ONCE(q->lr.suspended, false);
>> +		q->ops->resume(q);
>> +	}
>> +
>> +	return err;
>>  }
>>
>>  /**
>> --
>> 2.43.0
>>
