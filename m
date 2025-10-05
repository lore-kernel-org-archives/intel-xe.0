Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C84CAC5B8
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 06:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE1610E03E;
	Sun,  5 Oct 2025 06:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTg9aGzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CEE10E03E
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 06:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759645356; x=1791181356;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cihOQ+cTDExKhyM9z8g4JSYbA/WaquEMt8R+ubLIScw=;
 b=nTg9aGzs3ES/YLQpn9QTJkDBgJc1xpCvaUl7N5eXH9an3kb1kwmc0rdz
 cBbjD0jqecR9a/7n9O6FMUa081jFoevF2LSY8pFH6SoQmcbwVQEnX3zj9
 ix1D91pUdGoZZuAPC9MRKmcaWJrAlHBwhihzepdCtBkkf/lb1PTNp+aHW
 nDvUGZEUPhJtfpouPeNzgdHzN9BUZKipN0szVhpdE9ICIohi/hRmtGK4R
 Y1loB/sbeHjboXexzpXnIeYsYtl/egUFqJxZmSpAPDANQPh7QJLZlCEa3
 eJNL48eJr6RHku/Il0TDXbZRtO+Mk9HF5iW9Vh02lkbLESscVVMHiy73R g==;
X-CSE-ConnectionGUID: aJZ2oF40TiCI9YoozpXeNw==
X-CSE-MsgGUID: agbKzddyQ+qd94uTvPB6Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="61068175"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="61068175"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 23:22:36 -0700
X-CSE-ConnectionGUID: 1w5wQAqXTlCxn7T5cSNRTw==
X-CSE-MsgGUID: XXpcSOPIS+irjLDXnfIBnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="180045506"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 23:22:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 23:22:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 23:22:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 23:22:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPJgj1y/+LMXOwVrzQ3hiKKSZpmnyT6K7wIvuAdzpp68yFroD6JpZd2GqhQjb//8lFIKX8NJO8MwJUHBr1ejmsiLGWuuWWcMyl+MCVLSUyttiB1RidqQQx1xMJ6MhGXTP62fDjKj5d+miOOB3IgdGcJ0wPlE7/3MlZwAW1EcF3mSmwzCPKZVKI7qQzSOo9J9//4olrHL9jU62zmNGda9pXbFoIuFFqLJi1N69LBxfPWxGMf9jh0eLxaXxputRpOYgQ+Ll/vBi2BOOKcD2f5flGWT6YR9RWdzliFeKC1gj7nI4NBOh1ifih4iIAB/gzIS23Ny+yGBahqX6m0KDDhrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIemc2hv4FRdTyTzbj2IfciDHUNwgnAzSxPgA8rzdtg=;
 b=jXY7nN6fs9XWiQzUKBa1lzipmslY6TLsCEpQx0CmLjO/ocMmyucYLmfUtm1u4LDJ6AeskSaW4zUUJa912eHinJHlAFKcfSncCgV14MurzR4JlBBr4a2ettkYl2bbLTSZhrFXYe6f20psQ5/H4rtvWR4rhNZITjJigrqwUJmJXIQZ0Eoe/4yEHaBKgwfz7CJjG8aYd9NPOD6ZLcoHbfTz5x/prlP8ldSIJDvCkz0Z8ctwIArKx3uPY4KJWGaxZOJSrdYtHlghs1NL2n5/r638WMCYfOwAeAdZ7o8ETYWn317p9A1sZFi9jSNcLkS7d0jvTLCQqTwVpR+97+lzFpobDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 06:22:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 06:22:26 +0000
Date: Sat, 4 Oct 2025 23:22:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 18/34] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
Message-ID: <aOIOn/qZOOOmsUrJ@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-19-matthew.brost@intel.com>
 <f3805b48-f9b2-4b56-90ab-c62bacb86784@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f3805b48-f9b2-4b56-90ab-c62bacb86784@intel.com>
X-ClientProxiedBy: MW4PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:303:86::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: da252276-3d1e-4f55-2801-08de03d78d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lumLDSDgNMIoEeAW8kbwDdns9A4a3dYCD6uVgD7qswwxouHbGS7UPXYNjL85?=
 =?us-ascii?Q?TteVduJwGxwwhcNGPcWcrj+qMZB0aB3zdNmo3KuyaeEU30OQe51jcKZ3pNWB?=
 =?us-ascii?Q?qIOA2PXRVqX7mJoRIjpIrwRqnUbSa5Fiwi6KVacVs4v0jyc9btixtDpaOQpp?=
 =?us-ascii?Q?tjcjwixKYfX9XQ95tSgo73a9ddz583g29QhWHo53ihF8/TbzWwpHieuhXqlo?=
 =?us-ascii?Q?Z2+zdF/gXB1VdUI0LisaadvqD+jD9o6eIxkUJ64MOWP356dst5xxJ3aghgND?=
 =?us-ascii?Q?ditS7IYRyTqP6AWNJnsoMtT7jmG5Ct5rx87M8t/exf5bfwhgbdE9EYTGrEF6?=
 =?us-ascii?Q?7BBaJ9XcEQ7WBWn9/cNeirYsD6WOXwaP/+WvZwXxGwL/sbII/F6UL5+euYUb?=
 =?us-ascii?Q?eEvKqRbhk7uCf0OtCyyMvW9nQU7gnIQKeR7Mew+s5aywdp/xmK2Cqr7GJiO+?=
 =?us-ascii?Q?ua9xSAEXwPh8b4JEKeeKyJNfcWreee99iuSrJRP4TjUESk7aLUYKPJVLDGfy?=
 =?us-ascii?Q?ZL3BiUuohQ0Wa1NWcbB8dq5MxZHL90l4AsJXEnyADirSBbV1nRMQoEau/U4d?=
 =?us-ascii?Q?AubqGcxnIETlJGv3Rw8EAEmUEHL0Sgs/zPn89dCzGHTO7YyIOLQsIZ6NxRBn?=
 =?us-ascii?Q?IRVRs/z7DvmYTEYVGScC5GhRIpPZlyyVmrlEqJco1FukQx8UcHLjUrGvZGJt?=
 =?us-ascii?Q?9Ur+a9XMMLUkXIIZxnyKquv/geavgGqpMWfoJefiXdE9JZdsOERnnla+HcPv?=
 =?us-ascii?Q?bMmsvWzBYNqAChl3E0uIa7LpiCbUU6KsCWcziOl3xw7YcXrQzhj1W1VsEeLX?=
 =?us-ascii?Q?zujIgGt1sTo80s/An+xW00Ca3qraB/5F1mX3NERtZ9H7RRwQA/MLFUANFLRz?=
 =?us-ascii?Q?Vm7y487dfAT/pZkuqYI4BKsr2PM5TLDldN5Yr8zAmgGAJ4WswwjbzGvcjdnQ?=
 =?us-ascii?Q?6E6L4lRNy772L+5gUCb/VG7vf8QGnTZx2tXKgH3ScFdF0YvNfuqJJ9ieAEJX?=
 =?us-ascii?Q?12lI7FuGu4edp18UiG2hs8lFpsudHWG6LnSLYkpwTMoT/HIXawVUoYHmWWjE?=
 =?us-ascii?Q?iiaId7Y0pbXsxqVUosyV1COqiv2iQHjNsHyAEKuDEPlpCvLC3Isj+MS2soYw?=
 =?us-ascii?Q?WjzYzoxHfC0rfOzJWWcuFNTmuHqSoW6Tv6jimVOMFtuEMXsuJ6P9ZTwtnOPE?=
 =?us-ascii?Q?I/r0RnJsAfVOAur5CC5uarGTQR8/Ef2aKA5ZFq5HJ+GNl/qfpfHedbuYarB2?=
 =?us-ascii?Q?KhxYmKv0YIfthWTlez5fja315eNZXOt5sro1HfshVoYtYI8umv5hZ3uzHRJk?=
 =?us-ascii?Q?NsVjE3EYUtkjn5+dCFBHdpoS9REeLJGvTUgyHlgwQHcLQMIr6x0oq4s/hh8l?=
 =?us-ascii?Q?H5I5N941jDdpIbyICVYN9cKWLuuvpva7xw1b0mrqKTXYHkDu2K/pU75moRXv?=
 =?us-ascii?Q?qysyW+Tx0pW0ckGpIVS2Q8mNg5FOBrvb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?px6ee1mq3u2MXItKFd+eGS4TXbiYlvLBpS+KUsKWeLobhg+7FxMxRHZpD/JC?=
 =?us-ascii?Q?PQCY6Nd8At0HTOUSiNFhf7G/xxFTVmD9CdJ975UZckCpePhsdoLKKQMyfSDq?=
 =?us-ascii?Q?wzXHhqiwbCy4A5/jSK8GDAu6RcWT1pCLxKT11j+XQqgWC44FHv1OvYiIGtQH?=
 =?us-ascii?Q?3aIPmuSIQTnaycwXzFzp/7YcdT7Bj1bzgW0/h29ga0oAT/NY31bYeCD85Y/H?=
 =?us-ascii?Q?SriFjEixb5XDieERGw+gISdAEtk/dy2mTNHRKtPjDxLfebkHziIdpK2A6FFP?=
 =?us-ascii?Q?vaIFebuN3vksylLAr3Bjk9N7kCwH/eZ9N5sz1dv95zDYBZhD/tJnHd9BLJgS?=
 =?us-ascii?Q?1g8a/5Vr3aO9ZSlxZvQP3Ow2YsSdPepTYoH40UyUBKxhFUIBf+MmTHtgYksG?=
 =?us-ascii?Q?KyjBRPU90rAe0jjp08tExlUzY91rEGCIXmeL+SfrwIhm55m+N6BztT7wO6Qy?=
 =?us-ascii?Q?rcWIfJ2bQu1pjfYU3GHfZPPbnzNO4BxgyJS9XY7J+Mzb/fpUPjxmFAyP44QF?=
 =?us-ascii?Q?A2PkaaumKE6Z6WrZP/lsI5HzWIVfM4i4V3ZX1DRQNBR6xe/PKKlVs+bfwLWu?=
 =?us-ascii?Q?dgPE77Ijlh4np9V1i9Fb4gGeM1IhHERAm7270H073XNWNc31H3qjlM8K99Ns?=
 =?us-ascii?Q?JaiI8nTuMD9EGYFHZv++NfMAcBNV2oBv7crXohG7Ro6xnELzpQivC7e50V+X?=
 =?us-ascii?Q?p5ec8+X7SCogOqoDLwRayIvggvnBtGw/RsrPZ8BnckeW/RqmiQkQxXzi00VD?=
 =?us-ascii?Q?oMYwFIZxJih+RWy0WeTTsLZa/Qk/g6btSos6wu11uNTEyIpp79I4igCsIoEs?=
 =?us-ascii?Q?HoVR475OFh1+mWMfYCRcxZxJI8hWDGj6jtS+qhJZqKVOQPm2TLcN1YRRzSbr?=
 =?us-ascii?Q?XTmwGYxyMolOtKMGZTV3JhU7ANT5DKG1m86vlvww4j5JfJzmEReE31CbWZ/p?=
 =?us-ascii?Q?8oX7J4P7m59tukwnuD9jayrQl9Wm8AiggHEPT7wn6moF5LbV/3fXNdHWXJVl?=
 =?us-ascii?Q?TUxonot2yhxSmiCKWjIOJlV9mADsH1mAIgEOS1MvlwFwZJIoNr4lJc8BRpy6?=
 =?us-ascii?Q?qWXFpTjkXqCWJIH+uOdFRnYkvdzJbbct234FkrSBhBdxuKcoQzw0+V2KXh05?=
 =?us-ascii?Q?jo6HSy8OapMkK1HFUaJ3MMpAI4+pFibpz4uCKRmo4mrjHvsHXbuqW+pbPkQ1?=
 =?us-ascii?Q?IuVj/ojeofNs0YQw5nSLOrOlVzwJ6EWFpBriLcC0/kxrCFLYxutGw8CShSc6?=
 =?us-ascii?Q?Qr54TTUVyGA8a6QIpR6Lxa/o6CIjpVa2oj9fH/MAy69Gm+XH41sIYk/HPCRo?=
 =?us-ascii?Q?HRz/+YRzPD1Cd1x+qo17A7x+Rwqx39MHZAhs5M3jHS24S8dcdAPSla37muhS?=
 =?us-ascii?Q?OiagGjFk1O2w0gKb8guYXoZZeglkKsIn4gMGZ3JvJ0IuYtWam2LKzCfyuyuY?=
 =?us-ascii?Q?qGaN2ZT56leubGMM46tr97A9g6hAKXoWhwai5uhYB1lYY/C1m+SKcv0RtW2k?=
 =?us-ascii?Q?05mBeaDLscrzvEzlaPnaNegJLrnkv0vR/p6AVYrW8yHT7mz7V8f0F2O7VTKp?=
 =?us-ascii?Q?SAUgDmqFUpwIPljvM4GtIXALzhYB5E+oAlsnFm+gCnYg6+lKkzgCPd0Ba8UM?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da252276-3d1e-4f55-2801-08de03d78d77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 06:22:26.1516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ynyN46xZCju//ql1vDOuC3MXB/ZRENC7mzue1V3qZx4KPTmTju3TKI5afOxYiu2kGG4okhm7huzCrs1tqhFJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
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

On Fri, Oct 03, 2025 at 04:38:44PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > If VF post-migration recovery is in progress, the recovery flow will
> > rebuild all GuC submission state.  In this case, exit all waiters to
> > ensure that submission queue scheduling can also be paused. Avoid taking
> > any adverse actions after aborting the wait.
> > 
> > v3:
> >  - Don't block in preempt fence work queue as this can interfere with VF
> >    post-migration work queue scheduling leading to deadlock (Testing)
> >  - Use xe_gt_recovery_inprogress (Michal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  3 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c    | 79 ++++++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_preempt_fence.c | 11 ++++
> >  3 files changed, 73 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 6ba8b5703ff2..e8fd2fe98076 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -741,6 +741,9 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
> >  	    !gt->sriov.vf.migration.recovery_teardown) {
> >  		gt->sriov.vf.migration.recovery_queued = true;
> >  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> > +		smp_wmb();	/* Ensure above write visable before wake */
> 
> shouldn't this be in separate fixup patch ?
> 

No, this is waking up GuC backend.

> > +
> > +		wake_up_all(&gt->uc.guc.ct.wq);
> 
> shouldn't this be wrapped into some CT level helper ?
> 

Sure.

> >  
> >  		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> >  		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index b82976f031e5..9320fe9fbb29 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -27,7 +27,6 @@
> >  #include "xe_gt.h"
> >  #include "xe_gt_clock.h"
> >  #include "xe_gt_printk.h"
> > -#include "xe_gt_sriov_vf.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_capture.h"
> >  #include "xe_guc_ct.h"
> > @@ -984,6 +983,9 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> >  	return (WQ_SIZE - q->guc->wqi_tail);
> >  }
> >  
> > +#define vf_recovery(guc)	\
> > +	xe_gt_recovery_inprogress(guc_to_gt(guc))
> 
> use static inline helper instead
> 

Done.

> > +
> >  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
> >  {
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > @@ -993,7 +995,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
> >  
> >  #define AVAILABLE_SPACE \
> >  	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
> > -	if (wqi_size > AVAILABLE_SPACE) {
> > +	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
> >  try_again:
> >  		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
> >  		if (wqi_size > AVAILABLE_SPACE) {
> > @@ -1192,9 +1194,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >  	ret = wait_event_timeout(guc->ct.wq,
> >  				 (!exec_queue_pending_enable(q) &&
> >  				  !exec_queue_pending_disable(q)) ||
> > -					 xe_guc_read_stopped(guc),
> > +					 xe_guc_read_stopped(guc) ||
> > +					 vf_recovery(guc),
> >  				 HZ * 5);
> > -	if (!ret) {
> > +	if (!ret && !vf_recovery(guc)) {
> >  		struct xe_gpu_scheduler *sched = &q->guc->sched;
> >  
> >  		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> > @@ -1297,6 +1300,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  	bool wedged = false;
> >  
> >  	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> > +
> > +	if (vf_recovery(guc))
> > +		return;
> > +
> >  	trace_xe_exec_queue_lr_cleanup(q);
> >  
> >  	if (!exec_queue_killed(q))
> > @@ -1329,7 +1336,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  		 */
> >  		ret = wait_event_timeout(guc->ct.wq,
> >  					 !exec_queue_pending_disable(q) ||
> > -					 xe_guc_read_stopped(guc), HZ * 5);
> > +					 xe_guc_read_stopped(guc) ||
> > +					 vf_recovery(guc), HZ * 5);
> > +		if (vf_recovery(guc))
> > +			return;
> > +
> >  		if (!ret) {
> >  			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
> >  				   q->guc->id);
> > @@ -1419,8 +1430,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
> >  
> >  	ret = wait_event_timeout(guc->ct.wq,
> >  				 !exec_queue_pending_enable(q) ||
> > -				 xe_guc_read_stopped(guc), HZ * 5);
> > -	if (!ret || xe_guc_read_stopped(guc)) {
> > +				 xe_guc_read_stopped(guc) ||
> > +				 vf_recovery(guc), HZ * 5);
> > +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
> >  		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> >  		set_exec_queue_banned(q);
> >  		xe_gt_reset_async(q->gt);
> > @@ -1491,7 +1503,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	 * list so job can be freed and kick scheduler ensuring free job is not
> >  	 * lost.
> >  	 */
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> > +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
> > +	    vf_recovery(guc))
> >  		return DRM_GPU_SCHED_STAT_NO_HANG;
> >  
> >  	/* Kill the run_job entry point */
> > @@ -1543,7 +1556,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  			ret = wait_event_timeout(guc->ct.wq,
> >  						 (!exec_queue_pending_enable(q) &&
> >  						  !exec_queue_pending_disable(q)) ||
> > -						 xe_guc_read_stopped(guc), HZ * 5);
> > +						 xe_guc_read_stopped(guc) ||
> > +						 vf_recovery(guc), HZ * 5);
> > +			if (vf_recovery(guc))
> > +				goto handle_vf_resume;
> >  			if (!ret || xe_guc_read_stopped(guc))
> >  				goto trigger_reset;
> >  
> > @@ -1568,7 +1584,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  		smp_rmb();
> >  		ret = wait_event_timeout(guc->ct.wq,
> >  					 !exec_queue_pending_disable(q) ||
> > -					 xe_guc_read_stopped(guc), HZ * 5);
> > +					 xe_guc_read_stopped(guc) ||
> > +					 vf_recovery(guc), HZ * 5);
> > +		if (vf_recovery(guc))
> > +			goto handle_vf_resume;
> >  		if (!ret || xe_guc_read_stopped(guc)) {
> >  trigger_reset:
> >  			if (!ret)
> > @@ -1673,6 +1692,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	 * some thought, do this in a follow up.
> >  	 */
> >  	xe_sched_submission_start(sched);
> > +handle_vf_resume:
> >  	return DRM_GPU_SCHED_STAT_NO_HANG;
> >  }
> >  
> > @@ -1769,11 +1789,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> >  
> >  static void __suspend_fence_signal(struct xe_exec_queue *q)
> >  {
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +
> >  	if (!q->guc->suspend_pending)
> >  		return;
> >  
> >  	WRITE_ONCE(q->guc->suspend_pending, false);
> > -	wake_up(&q->guc->suspend_wait);
> > +	if (IS_SRIOV_VF(xe))
> > +		wake_up_all(&guc->ct.wq);
> 
> so now for the all VFs (without recovery) there is now no need to wakeup suspend_wait?
> 

Yes. VF use &guc->ct.wq (a global wait queue) vs. q->guc->suspend_wait)
(dedicated wait queue). This allows a single wake up call in
vf_start_migration_recovery.

> > +	else
> > +		wake_up(&q->guc->suspend_wait);
> >  }
> >  
> >  static void suspend_fence_signal(struct xe_exec_queue *q)
> > @@ -1794,8 +1820,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >  
> >  	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
> >  	    exec_queue_enabled(q)) {
> > -		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
> > -			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
> > +		wait_event(guc->ct.wq, vf_recovery(guc) ||
> > +			   ((q->guc->resume_time != RESUME_PENDING ||
> > +			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
> >  
> >  		if (!xe_guc_read_stopped(guc)) {
> >  			s64 since_resume_ms =
> > @@ -1922,7 +1949,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  
> >  	q->entity = &ge->entity;
> >  
> > -	if (xe_guc_read_stopped(guc))
> > +	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
> >  		xe_sched_stop(sched);
> >  
> >  	mutex_unlock(&guc->submission_state.lock);
> > @@ -2068,6 +2095,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> >  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >  {
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> >  	int ret;
> >  
> >  	/*
> > @@ -2075,11 +2103,22 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >  	 * suspend_pending upon kill but to be paranoid but races in which
> >  	 * suspend_pending is set after kill also check kill here.
> >  	 */
> > -	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> > -					       !READ_ONCE(q->guc->suspend_pending) ||
> > -					       exec_queue_killed(q) ||
> > -					       xe_guc_read_stopped(guc),
> > -					       HZ * 5);
> > +	if (IS_SRIOV_VF(xe))
> > +		ret = wait_event_interruptible_timeout(guc->ct.wq,
> > +						       !READ_ONCE(q->guc->suspend_pending) ||
> > +						       exec_queue_killed(q) ||
> > +						       xe_guc_read_stopped(guc) ||
> > +						       vf_recovery(guc),
> > +						       HZ * 5);
> > +	else
> > +		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> > +						       !READ_ONCE(q->guc->suspend_pending) ||
> > +						       exec_queue_killed(q) ||
> > +						       xe_guc_read_stopped(guc),
> > +						       HZ * 5);
> > +
> > +	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> > +		return -EAGAIN;
> >  
> >  	if (!ret) {
> >  		xe_gt_warn(guc_to_gt(guc),
> > @@ -2187,7 +2226,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >  {
> >  	int ret;
> >  
> > -	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
> > +	if (WARN_ON_ONCE(vf_recovery(guc)))
> 
> xe_gt_WARN_ONCE is available for use

Done.

> >  		return 0;
> >  
> >  	if (!guc->submission_state.initialized)
> > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > index 83fbeea5aa20..7f587ca3947d 100644
> > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > @@ -8,6 +8,8 @@
> >  #include <linux/slab.h>
> >  
> >  #include "xe_exec_queue.h"
> > +#include "xe_gt_printk.h"
> > +#include "xe_guc_exec_queue_types.h"
> >  #include "xe_vm.h"
> >  
> >  static void preempt_fence_work_func(struct work_struct *w)
> > @@ -22,6 +24,15 @@ static void preempt_fence_work_func(struct work_struct *w)
> >  	} else if (!q->ops->reset_status(q)) {
> >  		int err = q->ops->suspend_wait(q);
> >  
> > +		if (err == -EAGAIN) {
> > +			xe_gt_dbg(q->gt, "PREEMPT FENCE RETRY guc_id=%d",
> > +				  q->guc->id);
> > +			queue_work(q->vm->xe->preempt_fence_wq,
> > +				   &pfence->preempt_work);
> > +			dma_fence_end_signalling(cookie);
> > +			return;
> 
> I'm not sure this chunk matches "wakeup GuC backend" commit description
> 

This should be in the following patch. Will move the code.

Matt

> > +		}
> > +
> >  		if (err)
> >  			dma_fence_set_error(&pfence->base, err);
> >  	} else {
> 
