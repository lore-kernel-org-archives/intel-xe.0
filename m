Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B08F531C4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 19:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C6010E51D;
	Mon, 13 Apr 2026 19:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2zBn5nK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E92810E51D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 19:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776107325; x=1807643325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vu2AIiQ4s3ZjoDN2dluVkaI1hZQG/Mp3XFQzxbdxCrE=;
 b=B2zBn5nKhAj1bo0bKU0Qm8cJGZ1YMo0Q7KpLjZUytNBkhCVLaDJWJWE1
 sY1YW8d+OwstwDfL2xGTFW6Ejg2y4tWo5sE0dhQExqb75YfAqzlSfFnys
 W1E+/xkeacDa8Aa4r+ExUIwGFtce2phaOxxH0X7LxvwUTqNQwa0ow2rRC
 olsWr1EM3F/naY5uLiFZDzFklGIcdSLrTPQM1n3/+Or/tqCJ/N2jtXvSh
 ku9C+bKSuQJmxPCK9256fgKSV1TjtRevmXu/qha3C1a7RD435O6ZFFUvf
 n7xZB9XhGjEkYEBWiiDntvagmCZJ2OR/mbIZmWohHM2SyxmkJ23/iactm w==;
X-CSE-ConnectionGUID: ztywbldjQgarD/SyOMKfRQ==
X-CSE-MsgGUID: GU1ctHdMTbOLjXqeRddR4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76761644"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="76761644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 12:08:45 -0700
X-CSE-ConnectionGUID: H4RL6PS6TxyHLT4jTdkbiw==
X-CSE-MsgGUID: RynfuEUtSrWktqBEFp5MYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="267858760"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 12:08:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:08:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 12:08:44 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKk63yXl6YqBwynA78MvhOqdCJyc6VEVj6EWInGj4eBLO+zk1ixzdBpGzhm1P475ZO82uO2/KUTQnw5eVfdogpLFsopxXSeQYLfsO0VPV1eFRsTypiDRhnk7rTapGnejl+64uBkSdh7060Vut0FB9ppV8ihHxgmlM1Lxhz1JSV9wcHdUfJQU57+6L+u9qliOnx4dN+cmllTTZxzHqx13yC6bZzHbqRFetny6/p33kHI5pzITaQQicol71pj9ERYMZxqBsfN7pOfLEz+UsG3M0X5yuceaCykLWO4L4npE8slDpHiL+KYdOTQe0PNxtA/nc/a8oHhVs9YXhM7uwkTWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dufhQdNbdiOJc9GZ1QRhAMbKUNFzbUX2J+It5YERAv0=;
 b=DRMo0R36+BRDmN5xKUWT5HZh5EjZg8z0ng52ii74KtWfV/ue1bktL4Xlx49P43rkrjdJlwZldEeyNtQBg/2XuSMFVK5L/SIZmHPG7ygkebIEFCVIfEWBWUs38yYPeymvWCUQh0lcBC3VDys98vb7ioPHudv0PudnkK45aJis5zzSCQ1nCcGmeG7TXo6+m6mWIiQ06JiJmDy3elcQ8j/rqkb1a2UCbew1QYZ9qasJpwKBklMLjJif8xO0PUiRrHWQVXAAukG4QfJW3QQ5vhEeWfSD45RxvdSpeKJeU3rTXE9jm2NVtYDsusLZKRYwhjBTHNa8lYRK1/0vBy9Hv5eNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 19:08:39 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 19:08:39 +0000
Date: Mon, 13 Apr 2026 12:08:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job
 timestamp for multi-queue
Message-ID: <ad0_NDinPNhR4zkZ@nvishwa1-desk>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-11-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bea8a5-e22d-4e28-aed7-08de9990121e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: dQCVncGC3y5U+R6vanExR86SvA3cBiZ20S2Kbol4ReNnPCi3m1USotjL+alSeoJKS0Na6iQ/90V0t+K5iBR+Vztjm9RVWC+v7dIW+iixB3x0P4rwBHAV0zD9EX0ci01WI+w/EiSSkCf8ccb2YWQaggsAJcJI+XizHk8u2+6HhyBUKKENIKoy4rrTAEZ06atDdCPTFb2nCZT+swfrE7vd8Y4RFbBjAhHOmV6vxlMMKLvZUB0fGw5O+ck20iXrzUkV4MDHFCvgMQuicmxk8ezQuzC45pehSqwhjTWDnoKg7tQtV8e2uIjNN4Z8HUmmq2SRMKn21LT0C5LiKYad+XNuhaA0Sv257FRnjdZGah4mXB0RyllzQVzxuuIoxCpol18LX3qvz0ixhDT0VBdySMzMmN46GEOjc49NCTKR1K+06sBXMKJmv5QTGjcP7xLIKFmD7qKWghsTLplej/BFbgw0hyu9WEjhZqYsTlYKqXMmZSz1hHdKceVoB9fd0bVsyQ3FcnKk2R7aAAguUBEzWZR/FjyIFJ+uIqrNySN4jq9zBjj1KJopCM7hylh/vZusITrsQW7/TpyPeYUn4FZFX+yV1nSNzBHxT85XnlPRMoNI9LTGMaCUDItWb2CkKF/CNxRoo5f7HhKnAG6gYhPmEjwmQFDGIyxgDD3vE65yNPjaUpVuHivIY+oeIHUKrLZFM/BafhjmvZ1X0+LbZWR5jqSgeq5xr4/LCEoxyN7CRaiCHw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ohajdv81rt/u/J38zLmpMCFdPxkNoGjp0ivhDL99MwmifjTWFOAOCz4Oi7a?=
 =?us-ascii?Q?BBPMtsgA9rk/EIsFv5f+WhJ0HHT6/Vk8us82ztU89gBQ8D13ynWT6Yln+Jsj?=
 =?us-ascii?Q?J5bZmnJ52mNtppfrk+pQznPqITiecpxkU3qPYnMaTmEyt/XQoGptS2E3koh5?=
 =?us-ascii?Q?e9Aws+L+0y4budUfDKpfLa63n1RVrWQP0ikQgpzETW7d+70yFqmpkCMEN/q8?=
 =?us-ascii?Q?msKm+1Mh4GhgThLeCflRZE27nwu/2ues6DCZKLMzZNWtdRbeF5r4roSBWIA1?=
 =?us-ascii?Q?YbujsZRr1Cy6SOOe1+M+MuNerZ9L8UzcH9FeEpvWYUN8ToInClOQjq+iHayp?=
 =?us-ascii?Q?qbbckmSjB4r+9CWaR+k8f3x5ibmQhn4lS/etPS+qCC3ZATcH6AF3/dNy/Lbw?=
 =?us-ascii?Q?5FtJCEcStBhfIiA0pNKwzxTz65vJiHGWJoMb97sjx3u+HYYcM5nTxipndUhO?=
 =?us-ascii?Q?V/9n/yWlu778RWhD4bN/0DEXgwzwOQFeX7mwG7dKYk4Xtnx+m3all8J/sZBC?=
 =?us-ascii?Q?kdZxK8uvf3LEo6MrTkuIYAH3sCnohasBBCnGNne3nBnB8YKTiT2hVDJPvPXk?=
 =?us-ascii?Q?3JwawsLOVhWrqXmN93vd2E1E1ewsDH8cLQuuDFfBmgYEJxBiUl2VI6Jf7PjE?=
 =?us-ascii?Q?0jOoHOrsGVipvei1MT9FRu19QEfKGBBPWt3zhXpsu84wz8QD7WBWRZWHPs+g?=
 =?us-ascii?Q?WNJ1ZpRGtwJVVliWdrRoFULOeMJOvxBb6sqCcIoO2cbe8+S96zAfcQ6Hlz/J?=
 =?us-ascii?Q?4+S/YXwcbh2GfaY9+GnkUqC7iYDUg6UdfaJd0ntaNzyBtbBa8FMeFfnKDBJF?=
 =?us-ascii?Q?YP1OJ5kRdXzwdx6zsl2hoJq6BKFOxT15jZ6QSLwQli0R6E4+e4b/St5wwkhf?=
 =?us-ascii?Q?X51En1apRGx6SSjx4ICjFZ8Tf7suQ0pMPdXv2s7Gj/YG9C3aB8SQGOIpuaD8?=
 =?us-ascii?Q?D+64dy7YrFkdaLCuF7LG0YcLhmhTfzhrzYYgWwPWPCDuWChM7QRDH7oQzlvi?=
 =?us-ascii?Q?jPkPKH48duAYKSDEvcKSKoZAArVz/ycZY2zxakr4sHqdztFElmGChRehOmXV?=
 =?us-ascii?Q?sJW2pR19A9hOY/hofiTpc+pmHuJ9yvnYVDcrcJZeivmZHfkCfWtEjIx8pugO?=
 =?us-ascii?Q?1Jf+fliRmxpmLGoXdlIUKL/4MuvWuRzqgwGmeBf60Zy6Wqd1B4Ks5AEmUaZg?=
 =?us-ascii?Q?mDGVgrvpONvhDD+G4IwmqulXeWx69GbdbY414jp+FHOtjNL1GzDtPppiIkHW?=
 =?us-ascii?Q?z388C9SAdiv6HTH1SmUSdzlNqjHowr8tKkJwVe29xhP7BPgKt1tp16mnOHAk?=
 =?us-ascii?Q?TfwSIBlDgEpJOh8Ksvsxu2yBhxJL/CiHdFKop3xP1+V5rvFpAI4EV6/Uu0zW?=
 =?us-ascii?Q?4V7CAyX5GTcV0p9f6mQBza0B7YpcGT9Unffg2GRqqL5oBIsLbWbWfUovR8bU?=
 =?us-ascii?Q?Ou5AOvaxy/2RQI6+yLCosMFWfeb2mzVjnO+KBpP3FbLgzO46GNBkbnmIk59U?=
 =?us-ascii?Q?0v0XPNg5aHXGsjps9xgq5i7hSBHS14E1deUsC86SKN2JhtT/3GqZjkYYnym4?=
 =?us-ascii?Q?62QkLoow2SmD/FGUrmQQkCpCFADDRvazBRoRUF2WMY7AtFUa2FawsR4esQDY?=
 =?us-ascii?Q?M91txp7hmJ3lpDQam6jK4mxFTSZAS7vISYJWONgWztZ/ELOvVzDoveHPnm52?=
 =?us-ascii?Q?RHIGkkYlGyBX8SOnPk3qLkyW0VRQYksmdJyC6m+gYr2GIR/3xwrMqiZojwgT?=
 =?us-ascii?Q?hSfCrALH5apqIsBSPxupqGu/tHSLYTluzttjbB73P28lDg/0+DUa?=
X-Exchange-RoutingPolicyChecked: H0rhZobopHyspNJLy/kRp3l36i+zViGEheAsLfofTOzW+c1VYjW8VvymMkSb0ntnEcrFpcPAefvNIxUWBWOncvAU+sWsHRaJ9T6k9HWx3gtif9J8Qqsa33Y8F44UrwJMroJpbJiLaQoB/tKjrpzPPyWF5QAPw90OJ7vUahXPMgGkB/VqajndWtbB09FRhgOTxod1vrl7YKUhkR3dGKRvcKNpHkgaaALk9lYtiBLP13E3nDalx8UR/fQUMEhNhcDm5o15Ua3W4a3sjkwD/QGF/UNFJkK6wc39aMCkVJcuy3I5hutFdAcpbVfFlfLSLTdUcFWaw1hIp3/rt26wixpNYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bea8a5-e22d-4e28-aed7-08de9990121e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 19:08:39.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wv/3QzkqdHpmymjYYBLsOl2h7mi1MwdPR/cb92eQFqN8+C/g0EVN0mAZeUHh9Ie/a6m7rCWtyxgzo7HRilwLJ7wAUeMEJwRJiS3LCGJpDgxvkjTjhPLQU+9XboiAchu6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
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

On Thu, Apr 09, 2026 at 01:37:19PM -0700, Umesh Nerlige Ramappa wrote:
>Each queue in a multi queue group has a dedicated timestamp counter. Use
>this QUEUE TIMESTAMP register to capture the start timestamp for the
>job.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>index cfeb4fc7d217..0eea37c0b4b2 100644
>--- a/drivers/gpu/drm/xe/xe_ring_ops.c
>+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>@@ -269,8 +269,12 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
> static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
> 			       u32 *dw, int i)
> {
>+	const struct xe_reg reg = lrc->multi_queue.valid ?

Use xe_lrc_is_multi_queue() instead.

Otherwise, patch LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>+				   RING_QUEUE_TIMESTAMP(0) :
>+				   RING_CTX_TIMESTAMP(0);
>+
> 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>-	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>+	dw[i++] = reg.addr;
> 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> 	dw[i++] = 0;
>
>@@ -281,7 +285,7 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
> 	if (IS_SRIOV_VF(xe)) {
> 		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
> 			MI_SRM_ADD_CS_OFFSET;
>-		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>+		dw[i++] = reg.addr;
> 		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> 		dw[i++] = 0;
> 	}
>-- 
>2.43.0
>
