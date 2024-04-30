Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D3C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 18:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC2C112E51;
	Tue, 30 Apr 2024 18:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edYhVaw4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5EE112E51
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714503013; x=1746039013;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9/J8Rj7QufwdJCxT8FJ+5Xh9+1hKkGsvhPfEDXOy8us=;
 b=edYhVaw4fP4YaaVubD+ps6JUFYyDwKYae4XbyWOEexWpUteosbqyQYCR
 tt53sXFDeSbSL/fUYZWFifIn7UqK8HCF5NOCSwWs4eClQpzj+dA+cz5up
 kaB45MutnobO+AmpbJXYFlaCRG8IhuRZq9pQL95dNJjiyMJDY7gheS6xw
 0u07Cu/MgKErdjou+Gk3iFo8Vg8Qjp2UTm8Qytkfm5QaoYFTyiNLRBnFO
 tiB36uU65Y0KkfDBv41mDimvpwdTrJ1F2HSwfOKOGCXEBfTKQ5EcgqBOx
 FtMcfy8MPil/NY7w9jqIxYY4g0uDRQX/R1c0luAxTiK+g/fuizhHDArQ1 Q==;
X-CSE-ConnectionGUID: HLXqNku0Sx+fPs15zgwYmQ==
X-CSE-MsgGUID: b8TPHr6CQuyLoYYcP3GyKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10449742"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10449742"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 11:50:13 -0700
X-CSE-ConnectionGUID: B7iMAV4/QmKsCdQu7Gp7Pw==
X-CSE-MsgGUID: XMAeFV2hQZ2z9Mjyy9EljQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26558535"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 11:50:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 11:50:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 11:50:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 11:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3SlhFekSZV6ZTVVOin9rqy+ThTozzXq1zqKRaIUMEeOCLuw0Lirg2BUTszHRR0USUddxSYSR7it4oylLcVnQH10uNUth7EfKEDazpZFLnp+SvWR1g8SVsXxsOx6Q7MI6D28SoSjHHoORhyNBxJ0bKNI17PP05ZMSBmP8FpF4nQ45WlpyRk4aFlXB028MHJK5oKSyayM6i6IESsSIgps9oG9cEzwD7+T8kafr5dhuu8mNXQH5BWeOzTPVlRU4C/gEJrm93n0nlRBC885teaW0ys0V6KUNMpeJAH9ExCZM/TiE2EBiH/oNr6IWrnyJCPEJGzzZYbj6KlF10Uar4eqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8ULz8FtMWgFRTu4rEpBOrz3qIZ3jEFGQCwMVwPpoGk=;
 b=G0cAVe33jYHEhOsQdzamwUspQuvvLmA1zNcdJghKxvTZ1zrlw5ncrLaXVQjkT4JdYROcZXx5ZEXhZ5j8mEVMvbhkWc67dIQeuYUvMaWhoEjgcHni9+QULZagw9LxZEnd3QO7MKCwte+9lWy8emDgJMQNLAz5zzQjw0NO6ywBuxfb0VEj36lq+lgjJz7MeJAQbun6Vs7ObU/e5UBtwUoBt0na8KgmIm1hJuutQDaSqsHtYLTzdelCVQUW7UEbEISUOp6aelnaMOqykOPxDj0Itj9P/sa908paXytUedxOQRTZQqsp14ZHZO8CfJijgaOyK2UFoHcjZJOSIajD6URyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 18:50:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Tue, 30 Apr 2024
 18:50:10 +0000
Date: Tue, 30 Apr 2024 18:49:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: skip error capture when exec queue is killed
Message-ID: <ZjE9V1cxQL/az2mS@DUT025-TGLU.fm.intel.com>
References: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 1edf3fc3-eee8-477e-81d0-08dc69465cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OXKkSC1YLgWLHnDKpAMnhu6ZH3kNaMlZ4YzevEHi5wTc6PVXM6dNm0zqd5Af?=
 =?us-ascii?Q?4SxKMtUgr3Rtq26lIWTMO/fbDNX4e1bev+gEMDrOwQ7kpRjFYenl3WqUTuSO?=
 =?us-ascii?Q?XIg/CWc9bxaokiVd2qnkf55BjLVhmD/Wunzyv/y5LSN62uR5snc61qMuOsuN?=
 =?us-ascii?Q?54qAL9VgtT+XIHySM1erHWy3cfTwuB+kEGljMU6PJ7TXcKUGs7qzP1Qu8YFI?=
 =?us-ascii?Q?bZW28EvJ9aG48o9UJaAQ0dUcxABxIkVQaZ8SFMn+0jjJSCT6ge5q5/Q7uQh/?=
 =?us-ascii?Q?mK96jX7oql1Q4pz5/V8A8ntOezp0/2lqIGBaXHBd/G9yyYaPMe4UmguA4Qnt?=
 =?us-ascii?Q?0Nry50db9XiF9TRTdg017RxQmUSolOHLc2vwdSjKzNFeSXOV8ZiPuyXuEWGl?=
 =?us-ascii?Q?l6fXQD8oClSVmVhKKwa8QH9umt/UERpnmXK3EJm0zhTtfKgAVaxkwbtQmeub?=
 =?us-ascii?Q?HoAFY20BoFU7RXnQfF3NJ8lerp2fP//OSE81460ILJqwGxHpOuaY3+kqp8yX?=
 =?us-ascii?Q?09mRq3GRnS68AwOdBbogRjV8UZrVwFOxfxPWuQ32HEQ1aI85KAr01n6pE5ZM?=
 =?us-ascii?Q?Cuos8X6oUBTcoZAqh6UU9WROi/aSjJhAaU04G/MHBAHyPbe8Ap68N3ecHQmE?=
 =?us-ascii?Q?NUqlXWKzfXebeb0rH4taY0x6mxo9tio9n+EUA+Spy8lAKgGpiR4WfuMwifau?=
 =?us-ascii?Q?/SmfRxm2Xtbgn2/SGZD84+FjuGyoNWZqN1lyo+ijZtN6eBpgF1ACVO27MoOn?=
 =?us-ascii?Q?e2WLpjWIA39KQbhPCDyps8H1/Cn+tGy+UVLmxcTLEV4sFEZO+SBZRCgKB0Cw?=
 =?us-ascii?Q?AXG6ngEcqPHhS0RgGPzaMjMxFQM0x/A6bbENEh5yvSMs0+8S9/VQNHvCxswu?=
 =?us-ascii?Q?fCxwbv1ljBWC+96Ni7HXzi3Me0DC7khp/r3PzL4PwLQE+swerLB68LCo+1nV?=
 =?us-ascii?Q?1I9Ci7k+x47uUXxYREkCyXW7sfL05I+b7GCvCCoOKp3cmvwuUFlxRrwdgV0Y?=
 =?us-ascii?Q?+ddhICANdKFXXCTCx0xqPfBT8vfQedfz+RID1gFgNrH8Zyxw1NF2qxnhhPBs?=
 =?us-ascii?Q?Z2QxC67h5UbhswsrAoIJ4oC32tBCyzg8WHjEUs6jZNFInd0EyjAD+emyhnhK?=
 =?us-ascii?Q?rCHTe0sewBjhqZ5U0ZgnMSqAuRp08d8TwH+uGNKZIdp+Ly6X3HsW1wUSyt4c?=
 =?us-ascii?Q?IJf5RM4/LF8QujDlTIMXYSOq0xiBjYtfNRWPskCgphhZWxJSYt2qwyxUrdwp?=
 =?us-ascii?Q?iYq/fTbR0/0c4jVGSu1nEyte3wJtqpP13cx5VpRkGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nnssH+6OMMJ55rNvMMxLtEjoYkALsW+5uqnF1wPS6E30N/l2ZXPhhv9Tn3Mq?=
 =?us-ascii?Q?1wctgUqYysktgKh5tl2aXOqMcKA+RYbPb2B9pWm+qKxA1/ph9RT5Woo/rt5C?=
 =?us-ascii?Q?LJ6SouAsug736Xky8ezIhgWyxBGjEs9JJEiCOokG+4HSLc81OJozqck45mKE?=
 =?us-ascii?Q?/QIl+CeEf0QbERJMcpTfI1R6kFoeeWZiV2lQ+PQ9lz60e4NrvCrxcYcDxTQ5?=
 =?us-ascii?Q?gX1XDwNEpYFCtWC0whX8KiXPQsEJxvSeLCAuFwJ1B60JryH1Q9Z4oo7F5u36?=
 =?us-ascii?Q?gHyEvUxkQ+PwL8jr1QiNz1ntEdgV9n0OQsuNeyKR9HVBjai6QkFsjtqn2hAT?=
 =?us-ascii?Q?bTgq2jUrPqJmyvUnXfNCIDPWYd0B/Q08/+RstIws1IiiTVPVPlWtenGmgiBx?=
 =?us-ascii?Q?ULxKi2qi+OqgacIgL5ZYCZ+lLqN+TCAS4PY1S5vbQ80CoRaSn9uv8jXPzloj?=
 =?us-ascii?Q?pDDf9+iH2JNR/t/CHlALIBgFO35Uk1DcF975PzeuwCXQC0CFnwTnHN4U2C5u?=
 =?us-ascii?Q?0/9EehRM5ZkKz/disMHihpBeG5pNu7sdWtdAnVKW+j+Ui96MZivyyHw42lIy?=
 =?us-ascii?Q?yAbu+VTo3Flj0DTEp6un+UTxVFpSkRn5n6Eh/Vl7MGqnjElfyU9NTxtolrSz?=
 =?us-ascii?Q?/t7mGCoyBWALvoUFwhjPWtz2OCUWuDaqKFQZOki7qRDsh27Crv7qsAwIrCOa?=
 =?us-ascii?Q?ufVCTm6RKEKPSlnrYg3bVm438QeGvQUAf1x0m1OzQFqm6l5aBkGqeIAiXoVw?=
 =?us-ascii?Q?MlJtGpbkpM8y6da4nZC+xS8Z9RKljO+hVvjgUtZlBsb36fbDphpiQw930OsP?=
 =?us-ascii?Q?p41Kzn/HjLMZgY7gsmx3f0rD5+3Wy1L/pg0l6VZUQic6JXo3pY9jndhK7vCM?=
 =?us-ascii?Q?G59QJZEypBDvQbcoPbKTMrsoLX23IA3eYxoDK/qCWYa2IhDgpPI71tbkSdKc?=
 =?us-ascii?Q?pqzElL9wD8NAYKpQczZ/7PVy6K/WmzOjTegj5TKjBeZjqopkXYwqUY+m8AZY?=
 =?us-ascii?Q?LmLu4GUxu0snSMK3Nh6toyE/Ud4n5RGS/LBsRfl6y5J2Qirra8BOl6KvRJH2?=
 =?us-ascii?Q?sa2s/hR10sTpyqFB5D7dlTtO70dyMQ0HE7X2iZcuighP84XNq8V53NhD4iIl?=
 =?us-ascii?Q?+rvXOCRO8IthOp3WGeldOSdC9h8dUouu1MPpSQZXF8Ph33bSYyu/TwbAy0fi?=
 =?us-ascii?Q?w59CPxjQujkh+pqTX1mdwFEVAY+MfeeVMjn+6SDEwvVd3wE6ADK77dv+IHan?=
 =?us-ascii?Q?RJQWixOxOOBBiEw6VzORf+i6N0KMG9vXp1Js1xnjJUePMK8F+eISEm+SXmW4?=
 =?us-ascii?Q?Elcvn4jLy0jdct0eY77/CcsCgxO9pcPxMkXFwGFNULg1fpnrV3/khavggCDo?=
 =?us-ascii?Q?gEY/8axfd1hfg18TeWWrC61UCqmj6U3gEE03/wmRlrj4CAQATIpOuGmOYE8Z?=
 =?us-ascii?Q?hNte+jwa/gf3BMdlhCGEIThCSlJUOoyNnD/LFM+syFGdOOa2jzYrI/waRLUn?=
 =?us-ascii?Q?Te6SgUGjEJpi82OAHJZ5qhh0cGAeGCIeSQPbU5ZPJ/6xEkLKvr+54/3zZqdY?=
 =?us-ascii?Q?LikUFXWliVtFcgds4bIcuudeP3XOso5VxPnTPi7P4Q3SXnbKgKyjNLHp0H80?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edf3fc3-eee8-477e-81d0-08dc69465cab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 18:50:10.4239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3vTglmEH01SA0SsCYiGg/SzUNG74OEY/H3fMrEhQRie+q3kseg6i6GKrIp7Cjk5vVUv2SpPsVHhxbaNhX0sZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
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

On Thu, Apr 25, 2024 at 05:59:31PM +0530, Tejas Upadhyay wrote:
> When user closes exec queue soon after job submission,
> we are generating error coredump. Instead check if
> exec queue is killed during job timeout then skip
> error coredump capture, just free the job and return
> proper scheduler state.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 93e1ee183e4a..376a2c04e899 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -971,7 +971,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * TDR has fired before free job worker. Common if exec queue
>  	 * immediately closed after last fence signaled.
>  	 */
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> +	if (exec_queue_killed(q) || 
> +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
>  		guc_exec_queue_free_job(drm_job);
>  
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
> -- 
> 2.25.1
> 
