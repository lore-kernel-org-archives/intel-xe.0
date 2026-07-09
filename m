Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5642C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 20:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF34310F691;
	Thu,  9 Jul 2026 20:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBjhiJ83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237410F691
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783629386; x=1815165386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bK+pstnLVNYNALb3teplCjG3TrXWTV0WCuOGO7gUcwg=;
 b=dBjhiJ83cj3xb53C/luWQN56GAk7J1X7WtGoEmZ7qgw462HMS8xtlkFz
 CS+NUvYz20RAlqlAbjBUgUrAQoYB7kUoqoANzFg+Qy6mRTjQPbMevMJcI
 /iB4K0tg9QQnllmLhPeMGEAk//amOmADvKMwGlw0+nbJdmKgnkbUYcY4j
 23rOiWmZfzu0nTlVEWGQqO0ENBdtrJpeZyCILLe3dZHCrYoU5pg8mfDL8
 qJyq5odW+t/zwRAbQV6S2WP240pWQYZP+lNxmy0Mw0o61mR4FpJdtbGvP
 fMVReIO7UFt0dwcjXdecGgr+oLjjTr0VE7WST1Ha4RU9Zo+Ve4SsSZe/E Q==;
X-CSE-ConnectionGUID: RI6GZ2vQTMeUzSowf8nBNQ==
X-CSE-MsgGUID: XJ/liUfxQCaDR/vxJO9Vow==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84110042"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84110042"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:36:25 -0700
X-CSE-ConnectionGUID: ulfdtd4nQHmmegeqd8Xkng==
X-CSE-MsgGUID: hoPM1+TyTHuASYAk3OEf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258993667"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:36:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:36:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 13:36:24 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWXS2qdXKRe/tjPnIE2dPVZR9wz8iGXYX6Ow5GHJKozR1sTAm2DND8sV2ycnETAyL6jk1zI4NsKjIIUpC9wEUhM+BXZt/vKsqlZMhS4fUN8N00S2U+MRr1ul7fIsl0hpYlOpma1ZaSbT24fIHYx+1E1uYM0e7PXIHcEih4nXKIzAooGRcEmgXejlYKcNA/3UizLInnpu0rElbo/SoTDr0HUIuJa3/TxB1qrXR0cLPOwq/Pw+G6awLQEPEncTwgenMgRdvpF3Di+k3i1RAPSt1WcmF/LOYY2H8rtkIBXccQd76KzEhxTSgz68z+vWZcnd77XWHTC4lgaIBY9VM7dvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fj5JJDOo2mdGCKqp5ieOjznHAy0TpfCTzKOE5j8YryY=;
 b=xgKfcELyrCRdJaQYjEjHMn/n08yPJHlXzLyVgOxAL86keX6/f+YBgMCvioCj+8X702h9qwkfBPRm8wna2hduExAQDrfAFZAC+oSSWWMGA96/8CrYKKXIxIRZmfEXt2HzdyLdz1ISNaLfwIyG3YYFpangksZK2ITOAdRQVRVG4DEp9P1ceQYUSlD8RlpUEbFxGUsQh4mHOC4+CmqVR9w8mMLc1SS8OYspS6oXotBfYm5V6tqUkp+LyryZ86UzyC0iVcLM3KLvF5IHcWxJyFowviITuA8avDCb08jWLnCnf7LxDPWdRDCJJugNu9oGWPMydCflaawjbMfuh7pdKYwJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB6688.namprd11.prod.outlook.com (2603:10b6:806:25b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 20:36:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 20:36:17 +0000
Date: Thu, 9 Jul 2026 13:36:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/guc: wait killably for suspend and ban
 queue on timeout
Message-ID: <alAGPmGuKrIXN23Z@gsse-cloud1.jf.intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-10-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260701050730.1776476-10-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 496501aa-acfc-4e18-8239-08deddf9b9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|6133799003|56012099006|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Jmg6CSmmWDAa+fgakybUbOLVpLNN1WuHJgpAfIe1M4OD7bE3ErFFwuSTg2HcXRNDcZwOD7pd3cNcBqTHRUMRmcUHDlxf8ldcR8Jf25LCcT8vlpFdRdJMDvBUVcoBj/n0ZnAcCWhCMS/4Upfs6uMq70qIJDxjLntRBYih8WLR0oVNV0WlfqrL/P3HsknP5+ujU5GwGIibe9dPb/yufDrzPIIHgxeQooDzb13yKqQay3LDq5VTGejMqx1/VS+uJAZvCtqxkyLIyxI3LzAXxU3bifbNtXucQ2vKL7BN/q/Ir76pD0Bhh8YftyJTUvvG7gSFHcfWI8QVRjinLjCiezYW8zS/uWayMRRrLYIxrYacfViRPSdcXgzVS24WS9vbl0tYw11DleO/YXZWdrBETait3dtKG9jxA7+HFZEuGEChRtOlZ//ApsL0rJ/C9BZ53qJh57uJBH7kJZ/Q/hQI3z2K/lag4m2JR9rKrWt6YfPspDw703BwS+wSPY7V0VRgqlMzmCgermawqzhxEE3SxR3BdscOx+Dbjyhh0+ObSXEy14ZUBEDoGLXUgezL7SgkYpKHMh5kIkPugG4ByHUZ1KYzRUjnwJDqV+w6rsGdbQS86gIO8EC3imh7TE4OopGratJ8/V9z8ypJne7Nh9VdZlxw4ZUGTz/dyO+18ENfRLjpa7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(6133799003)(56012099006)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RXbVeATswaQocR7B8OUwUjemKWLp14P8+PIMWPmLCAQFHopVjjZgKOXEarEU?=
 =?us-ascii?Q?UeqRlh34OtUYWdfELenRiXzRn5jjCRz4MCAGtIjBxFKrC7N5O9sot/aFYSzK?=
 =?us-ascii?Q?ShGSVl7GcedlcPQl5Dlr1s/s235tdSYwL9Y6GuXua+a8futsE37jcicxzdSJ?=
 =?us-ascii?Q?d9waQ6JdhJXS2fNS+v+jtvx8G4d/dbgFCM1ImuXCwhhYGX+qU7XA2kSZqADG?=
 =?us-ascii?Q?dfAXe2CSkpWL4lRMyxvp7z56kOVK/1zu9PCdcOjwiRC4jwqhbL0CDoKmyiXm?=
 =?us-ascii?Q?VTsI9L2Z7sA17pjCQVQMcti66O3tLDUpsXwGxqEAhydqpvFkx9vBFtk1GWC+?=
 =?us-ascii?Q?fRMyvV5kIotnhxL2WfAW+CL3sjzQl9mrX7vh+YAj5s3mXOULcht52CWpJgQP?=
 =?us-ascii?Q?Wz1vZRyN8nooKx5pqx1m6OwzBywqtzEETFrpGmriUWCMu+4LjL3nZbKo1/o3?=
 =?us-ascii?Q?qd93qjeF0PYcBjB3CAN4/kKyePu9mAUsqhzPl1NRx/xL1oI1g8ncTRRYBVco?=
 =?us-ascii?Q?RTUw4jbj0lzhT1BY/udU0tt122Hcl81hIAvDqSFDB1G28OezzcoRPOkqqPv9?=
 =?us-ascii?Q?iHamxy6mKn0whnJAjJD4H70ObBsG6+RTl4hHO4h2RYLiRCMLEyTShyYJpN/Y?=
 =?us-ascii?Q?B1H/zzufoFi6E1PPBlLUB0OCtuOPfoMTGLlEbHi2nP3Ti4JDqu4K295Ei+hv?=
 =?us-ascii?Q?2NFEU7tP5ZCl9J0WRvB72oy/ex6ZxHYQ4GqgfQiWfHTToneqrQata/SXLyU3?=
 =?us-ascii?Q?yRzTGvtlR0FlmEUpIOq417/eaOYYLO5eRQCgU2CZBpeTUH09aiH+xASlk1Gz?=
 =?us-ascii?Q?dYQ9WokIGPFk3IAkJQNrxvT9NDZA7zR0kovRN27GSG5JWRgY7TVTtqX+WOht?=
 =?us-ascii?Q?lsU+F7f7oDNEmsghp9fUd3xykMhHKbCkPqi9fmf1h+d/pflLLAKXk67kqFCH?=
 =?us-ascii?Q?EaGgNYIHb5iPBn6e6aq+HKC07XBCywPj6odnq1t7gG2Mu8njfcjdVBPGrt5r?=
 =?us-ascii?Q?qE4ckA657aoOsrBMwUYY9tob74DLSlk7PEPQPKppkVlCqAznLlWFSrzLpP7y?=
 =?us-ascii?Q?2s/RapHDMy1Q6Y/2X+7rIBssa51KV3bM7CcfBhffq0texsRjpNpZaW5BiI/o?=
 =?us-ascii?Q?uZsdvS5R6nKLMSPbAHtX2UTGlHnsacncNITM3Q3uUvWbLfygkNkOenjqMVkt?=
 =?us-ascii?Q?dmwqRS2KgkA8ai+Jt1eJ0JMuc8Bv5f6Vu9SS7xs0GnxcrBLBCsH9jegavwEp?=
 =?us-ascii?Q?zW1/E5TYvg1Tn0Z294iQrQ8fuU9MEssP59+8CPRLrpcQcqkSDplmU01HRWdv?=
 =?us-ascii?Q?WJ/HUiV2AF4a38jt08R22Yg47wqZFE7yhVdV2JhSdkGHuSeCkquAYPJjLlbZ?=
 =?us-ascii?Q?+PdbVD+dWIf8qVYYqqkGdQCT4qamJbBBCh40NOcmLh93boLCXMA98KNMqlFH?=
 =?us-ascii?Q?fYaZSsKuyAZYtRU/3BZV6HsxxlTjDHFWLAJCyeLqlMZLIXMhIPp3NQk8PNoH?=
 =?us-ascii?Q?k56bloyz1CwIv1gnZ1+BqMtIRY3oTdoEEdolae/Pu0Gk4oWKoAj4BnZqfiHY?=
 =?us-ascii?Q?veSMZHuwxJZIZSBwJNHmTINArFr7WKyZUcwXCBviyZVn1hvidY1YKvh48z4e?=
 =?us-ascii?Q?sIm718x8w8ylK/GnkVOZxpqrqpD/yrvwIH0i+Lbdr+5gxCiBQpRcC9QvKsXH?=
 =?us-ascii?Q?Z1Fb+ymncSLIXO/89raY+J96gavxQTzo7Sz/ThnRzkYUu4Gol0S+w7jR+fNp?=
 =?us-ascii?Q?CGMQ8JafrHOpDl6ZO+jufmE/T/bh4x0=3D?=
X-Exchange-RoutingPolicyChecked: skYSsVStSuNzVKOI+B4jZExH8HSTgOJeUzM74HJk8K5fib9W6zNxUcUZfJfcTkifCydNZvwJX9nJFqycR5/Vqv3MRaTSeUN7uDWM0uuqSzjAVokMzO/kqmdwTlhNwh4IJwHlNjvlZ8CQ1rKNgq9sHl10w4LxYvUPXulwtd4H2pvziE8MPXvTsLrEnmWG66VMUVvpqSZ0tnCLka5jfbBzz7qSPOqxUgt7xtFTWjugwX5xpYto0zAkuxAFBanIuwzbtoDJBgQ8qZoSNLC7aUCiTamV+EHBRS/32uScKSRQ/21rRoxfzNmSHIBvbNbqnU5vG1Vkfe5ly59U8jzhJwtfPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 496501aa-acfc-4e18-8239-08deddf9b9fd
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:36:17.3764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +51ZPXvMLtyXTwUoL3Tv//YxMF0ca/LsR1ApVOru3O+JfzviaIVDIiEFFMe6gAtKMFSJFThwqjUf6+MxzcBRhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6688
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

On Tue, Jun 30, 2026 at 10:07:31PM -0700, Niranjana Vishwanathapura wrote:
> Harden guc_exec_queue_suspend_wait():
> 
>  - Wait killably rather than interruptibly. Once a suspend has been
>    issued it must be waited to completion (or timeout); an arbitrary
>    non-fatal signal must not abandon an in-flight suspend, otherwise the
>    wait reports a spurious failure while the suspend is still pending.
>    Only a fatal signal aborts, in which case the dying task tears the
>    queue down (clearing suspend_pending), so no stuck state persists.
> 
>  - On timeout, ban the queue and trigger cleanup rather than leaving it
>    suspended forever. Clearing suspend_pending via __suspend_fence_signal()
>    lets a subsequent resume() proceed without tripping the
>    !suspend_pending assert.
> 
> v2: Add comment about -ERESTARTSYS in suspend_wait
> 

This doesn't actually help per my comments in patch #2 given sigkill on
one process doesn't mean another processes queues are being torn down.

I'd drop this patch as I dont see this buying us anything.

Matt

> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 39 ++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9458bf477fa6..3d9bdc22c89f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2195,22 +2195,41 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	 xe_guc_read_stopped(guc))
>  
>  retry:
> +	/*
> +	 * Wait killably rather than interruptibly: once a suspend has been
> +	 * issued it must be waited to completion (or timeout), otherwise an
> +	 * arbitrary (non-fatal) signal would abandon an in-flight suspend and
> +	 * the wait would report a spurious failure while suspend_pending is
> +	 * still set. Only a fatal signal aborts here; in that case the dying
> +	 * task tears the queue down (clearing suspend_pending), so no stuck
> +	 * state persists.
> +	 */
>  	if (IS_SRIOV_VF(xe))
> -		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
> -						       vf_recovery(guc),
> -						       HZ * 5);
> +		ret = wait_event_killable_timeout(guc->ct.wq, WAIT_COND ||
> +						  vf_recovery(guc), HZ * 5);
>  	else
> -		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> -						       WAIT_COND, HZ * 5);
> +		ret = wait_event_killable_timeout(q->guc->suspend_wait,
> +						  WAIT_COND, HZ * 5);
>  
>  	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
>  		return -EAGAIN;
>  
>  	if (!ret) {
>  		xe_gt_warn(guc_to_gt(guc),
> -			   "Suspend fence, guc_id=%d, failed to respond",
> +			   "Suspend fence, guc_id=%d, failed to respond, banning queue",
>  			   q->guc->id);
> -		/* XXX: Trigger GT reset? */
> +		/*
> +		 * The GuC failed to respond to the suspend within the timeout.
> +		 * This is not recoverable for this context, so ban it rather
> +		 * than leave it suspended forever (unmarked). Clearing
> +		 * suspend_pending lets a subsequent resume() proceed without
> +		 * tripping the !suspend_pending assert (the RESUME message is
> +		 * dropped for a banned queue), and triggering cleanup tears the
> +		 * context down.
> +		 */
> +		set_exec_queue_banned(q);
> +		__suspend_fence_signal(q);
> +		xe_guc_exec_queue_trigger_cleanup(q);
>  		return -ETIME;
>  	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
>  		/* Corner case on RESFIX DONE where vf_recovery() changes */
> @@ -2219,6 +2238,12 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  
>  #undef WAIT_COND
>  
> +	/*
> +	 * ret < 0 (-ERESTARTSYS): aborted by a fatal signal. The queue is not
> +	 * banned - the failure is in the waiter, not the queue. The suspend is
> +	 * not confirmed complete, so suspend_pending may still be set; callers
> +	 * must not resume() on this error without re-confirming the suspend.
> +	 */
>  	return ret < 0 ? ret : 0;
>  }
>  
> -- 
> 2.43.0
> 
