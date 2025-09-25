Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82180CAC5B1
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 16:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ACB10E981;
	Thu, 25 Sep 2025 16:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaWvBoYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550310E981
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758816751; x=1790352751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JSweH5umBHde/R1agUl/JfbuIyn5Vap6D0IfT3zs4Qw=;
 b=eaWvBoYveaClVouFz/AgQEJElaqOJhk9S0mIaaNJNpxp9+RmbbwW8x22
 hsIo+5He1y2t6evIRp/sCh2fzy/aAdHeWIwE8+MkTP/80LlZchyIuHf53
 OYuFPk7xJSMNmUDserJ+GPbTVmuFbKJTz9pX/gKYRogk1a2H+Qy5wmOgj
 SV05ehEzfULvbSXvdw8vPgRm+a7lh+vwUVdCjplcoMBGMh7dbWNTq9TWV
 12njrzwFVcHGiaXGOCOksnaImqn5ckJLyzksRmU+40W2GREq46TpTuxPp
 cDAVfiKS6A5QmYOHWlk46U1yDarVIHDXz23sx478xCGIZ9rXHEkRGLO0h Q==;
X-CSE-ConnectionGUID: GuSwG2YMRsWzu6Ux/K11wg==
X-CSE-MsgGUID: V4XQq7v1QKWmJ8OOZk5+5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72502935"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="72502935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:12:31 -0700
X-CSE-ConnectionGUID: HbWNFQjLQDSHUPeOx2hFzg==
X-CSE-MsgGUID: hbfzBg6lRK6ty7BBJFo9Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176499499"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:12:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 09:12:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 09:12:29 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 09:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXRq24ReqWTURpB7EhgfGjgi5Ck/lsv8o52ycg/V2shpUTbwy2ISY2I1LlAV/cMYJIRZF8FhjVvW+5ZgT6SlycWAOzl4Wulq2UchZE6HXIQnEh2/afWCS6cR3xSJJw0Az/IRkuRauxpe5tinpoxTAI9EowSjwFxBUY2FfY3uDNIuq9JTN+S1XXNh4nuJVGTqZ6I+g3J653WXG47BLxXzVpRPmi/TWZPKu9vcD+qPKgIp7FjvaL3Ibs50JyfE2f3wZDw7PINlk9cnhOOOGL5TBQHaOSmwuH3qIMwU9DlWr99lasUybqICBlWS2zNDxPtleZCdLDAlBtFwmYaOUmCHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDfT16D/4nKKQ7hUe0bARnxshwojB0zqjwp6e3moJ7Y=;
 b=Q75/+Eweprg83/uMAj6DFIzZVeqsVTCyXXtyA04gF8h5XOf1begyvdHj6kZ7XE4dRxIf8EIkx/lMMFnV65Qlg00AJ2D4YKfAMfcaSUZofxydlDXzEAl2PxaEZwZXRLl9Le8/T3WYZnOkAiMDGthXPRK0kmuGd6D51B5ZBUuWN5nPLaM61QSaCE6wMpLyX/f06Y64HZD2WHLMl0dL2BurLQWT0EgO1KQn6fjCJqP7boYg8oaRRbiiWFNspvqO0zffoF3WKGannrmR/pHa1Aif+TJ4VGrjrdldg4x9GQWOywno+0HrvH3CQcMu/xEcKgbAb7HOS2Ee/b8R0TZgcBIo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 16:12:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 16:12:27 +0000
Date: Thu, 25 Sep 2025 09:12:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/34] drm/xe: Don't change LRC ring head on job
 resubmission
Message-ID: <aNVp6DZoXFtxNvbY@lstrano-desk.jf.intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-9-matthew.brost@intel.com>
 <5b02fbb7-371d-46fb-8d94-0b834d0995d0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5b02fbb7-371d-46fb-8d94-0b834d0995d0@intel.com>
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b135ed1-2eb8-4757-b6e5-08ddfc4e5218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EKuEoaBt6HD2d2B6rU3AcZmntZKgOhDGqgwjZxnjgGPDgC4+3Jrwgwm09hjW?=
 =?us-ascii?Q?1081doRY4ywM/9B4iZj3FiqLLHiXoUHWYjr9svmKny1MQI5wxvPXYWMeVRcD?=
 =?us-ascii?Q?+BNv6B3s+Ekr3smdGerO1M60FUySsheMFUL5p5aC702d9AL3uV7CMMNF6cr1?=
 =?us-ascii?Q?rtOHMKLADMeEYTYxaj8xIUmCoZspZ7EBBrOhf3cYOQrpt7FeOq0SSUXwJP0Y?=
 =?us-ascii?Q?SW1T1+yOxCyaqCjNyuL6VUQZISa6QMeA78/AzEWHN/p/sxaQCLJ1U1D4hgTI?=
 =?us-ascii?Q?ESSZD64xvj+5JTVLbGuoM3igQbTWWWwQTihWCndrqViMdn6YcdqDTh4Ot+/h?=
 =?us-ascii?Q?VcVReVLDWv/bg0JriDlr+lgP5l4WKn1dC72urGnEZmTyGteOeHogLQcuXMLG?=
 =?us-ascii?Q?IA2n/aFpPSqHyZqINIveJS05KgRh7C5EQD3zQ0w7PPs/sLbGRM/0xHfB6M3N?=
 =?us-ascii?Q?NqFfUM9DbCzubvLLNBDNN4YFFXOglo6ZGYqX6H+e6UG8PcMBBP5fkhg3lovH?=
 =?us-ascii?Q?zxXQ0+gCNzC12c+6TLl8m9Tx3Y5sHd09enmsmJvZjK54HmVw9bPsewDGT9D3?=
 =?us-ascii?Q?pN+ZSHQygK3QLgyz+a76AbFLHF5rX/woUnT5r1KdeHG447dyCD8GJKzQaGzx?=
 =?us-ascii?Q?Y4mFNDmp3ABqyHpyvQYDlfbLNldoHWmv2P5bAG5pYahACXvFDbIZ/t5bjrqR?=
 =?us-ascii?Q?1Mj267AMpFZUCDJn/Qh1yFyLuhP+GX2JYmQOfHHIsXGMJ1uz/X8TQ7FCbJ8z?=
 =?us-ascii?Q?i41l9I/mmNTxc6RVv1Ts4engJhxGWkWRhM61bdhvDxfUuwV8yJGBrN2KCD4b?=
 =?us-ascii?Q?gTGEsrWfW548NrTgnjyYATitC6e6WE42r388DkL4R0Xs1/seomrQ55w/7dxE?=
 =?us-ascii?Q?MO4tZYrjNm+vHOVdLGNGL3x9ylT+AvWzSQylvDhRFzN0uv9LaE62ad5VO0Rl?=
 =?us-ascii?Q?srhCR/fjlxcbYcRfHTgbBPtrr/s55ladCVEbZXAzmsWkVLCKTgd6FopfTi0x?=
 =?us-ascii?Q?nsBYFcPtsrwg+cdKRKgSqFGDF+aWxM695YG99NhRT0q0xcWxzrkidiVTkVuC?=
 =?us-ascii?Q?Xyc/irz1bjBAJhj/RzNoYFme0G2Yt/CsKIW/w/tso8IRNNzp+wbZkXl5ZbR0?=
 =?us-ascii?Q?06HDCk8LM0pjV9rtcqi1DMVKf2fBzZnYDIT1uMSkKBEYhlbab1TZgdOt1l2D?=
 =?us-ascii?Q?h8nfbnPFzjfKFDtEbvrXyeb/0a+RmzuPVLgI/ERrTrzPd4UDAmEgWISnJt2T?=
 =?us-ascii?Q?y6E6HoG7a5NzqPHDq64U1w6/WfkcliuPwHmoY+6CtT8YzBJP48xDrsDEG60C?=
 =?us-ascii?Q?OgGfjMz6y8hn3qsl1/6CLFiJR0/5fovGHxKiorX4SUHD1kUL3hXcILWM6Ydf?=
 =?us-ascii?Q?3AwvbAMSfC3h/yFK0fe5ceE9GmwhHo+yNwDLXDq+thDxt+d9n4L6bCAsTmcT?=
 =?us-ascii?Q?/gjSeNQfn/4HCt44lXaP4tS9tAc4+ncH81a0FGkD8747NNMXtQc3Jg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E6VypfQ2eZ6tjVSyBMwVh1/piDecQVtCqPz9Y1k8krM5xrzjJDbefwj0KaWz?=
 =?us-ascii?Q?n/5/O8bDKYyBBxlBuhNSjybZgWQS3bsdlqr7/EYLHcBG4L/SM/n0zZi6k/Zz?=
 =?us-ascii?Q?A402nr4fovTYDDTD52EGghlaKZT609lKKSzBMH0+9LQbNZXfkFUEElMD6fU4?=
 =?us-ascii?Q?ZGfPkinFyKWq4AA6j4B/x6AMqs1fO+F99LC3LwoydERGjsC8hLTYyVEHkNRT?=
 =?us-ascii?Q?VBi2NbErjqa6IiSNK4aPkQ2oPhJzVpBO3vKdTjNtye5DYdGvUS4RmA2UF85y?=
 =?us-ascii?Q?zaxiYz3LSRzXNSh90N/tY/1Un7ACWaeQg4a/c7FMVpYaJmZLlyvABB8oYGx7?=
 =?us-ascii?Q?WkaF9QyAh1e7j1n0VilfdhiMaaNurFzYRhEGDGWiwl8fL8PzzaWSfcPZST2e?=
 =?us-ascii?Q?Z8uZwFBq6PEJ5RSDlEhIsNRZtbcIC1XRyrydR8M5Ngthqw3ajayqo6aTCYAS?=
 =?us-ascii?Q?dhFBtsd2sB/PZUopEcWfF9nNghx0ymNhh6dJYgrNz60MgtidYSbpPm0WTP1U?=
 =?us-ascii?Q?SEjQRTagRvxF+Wy4RrsQE8il+CbIJPhZUzCkO/Zxr60bFHMZhA6rRgmHS2dM?=
 =?us-ascii?Q?w/3k0NdkiiU9QHkh2VVwscNgh1xOG1IVsa+nre0rqchcSKuczoGXFwennupx?=
 =?us-ascii?Q?lX8WEpIDwU15mCm2z+1pl6FqKW6HRBRDJ/ZIvR72s9peHKDj9FnuO6khj4ci?=
 =?us-ascii?Q?4mEVevlkdAYHkO4X7vSt3C4wYwaTqJRhFlhbPDwC3xRSCh5kqTqJaVvKRoO+?=
 =?us-ascii?Q?/s1+wL+oJZyzz+Ra4tD3ilBlCHda8kpxmKHizeyZqfFpkYVxWrFjhMfR0jPu?=
 =?us-ascii?Q?8DU4mp0rfB3N1F0tt6ohPAWSdiiIEDXPpM2b97WJjKXzF3vyHQuvxLZ071u+?=
 =?us-ascii?Q?eRS4dj02Orml2nIx99snM69r3TdIxNKZMTCdTpiEmGvzujb5sJXMkUhEtSDh?=
 =?us-ascii?Q?Wvhw8f5rhXp0G+nAwCB2Gk1bS6hXi1VQ/Mxa/oI7pb0I0+4TKDGyqeclEKtq?=
 =?us-ascii?Q?Bkqf3Dvkt28TJeyfwN0bzx2auZXCyfyYPpWKzx2IyCevLB6IBt3P7FdmIqJD?=
 =?us-ascii?Q?Jwzokop1jaTmquFoO/xS6CBfyNHFo5S+uG+zzabzKm9OOD81Rovuj8eEvLhi?=
 =?us-ascii?Q?CnAvrVxv13TI8XRVJgql4QVygsVSvoC+sxMcKyb86VTtoFB19mFBit/o7wxH?=
 =?us-ascii?Q?a34wnOw1W31pAgKgLXBqmUub9WzzNpAhUqDQEaG0KHRJhVJEPpBswm1/DNuS?=
 =?us-ascii?Q?JblFiAs7oqK4ssbE0g+3nzTlw01o6K5VbeYubmi8/d3F0WNshVyqNDvmh1mr?=
 =?us-ascii?Q?J48ng7LzpQKjtquCK7x/2mlA5Jfv0jpQxfp+0L60HWEbaqABuzubRzIOddeq?=
 =?us-ascii?Q?VS2SA4lAdCC218mI6w3fPNvM63oHs7i3jGs8136B2/i6rrawZOmXYv28hctu?=
 =?us-ascii?Q?s7DClmM1A/9Kd6DPts5EBpm/u+3nLdHk0cxivIthgbnRrYP/t7J4j+ba6s+C?=
 =?us-ascii?Q?jDGBt4sijlhiqub2K2Ik7P5mBpEbU2+X5y5HaTB/dDNVArYzxPcryfVlegvV?=
 =?us-ascii?Q?goxKcBFw9oDve3D4qEuPGgd9sN36Z9q3v2WMb9tAWgPDLywo68C3WVcLG3Ll?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b135ed1-2eb8-4757-b6e5-08ddfc4e5218
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 16:12:27.3106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3X0/n+7iZT9QlAsd8Ip3fR22G+qH2yDl0kjbCbz8Cod6VUpOM4BMgFTDs//HQbYG9lkoDfztlg+oAcLRdk2Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
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

On Wed, Sep 24, 2025 at 05:14:57PM +0200, Lis, Tomasz wrote:
> 
> On 9/24/2025 3:15 AM, Matthew Brost wrote:
> > Now that we save the job's head during submission, it's no longer
> > necessary to adjust the LRC ring head during resubmission. Instead, a
> > software-based adjustment of the tail will overwrite the old jobs in
> > place. For some odd reason, adjusting the LRC ring head didn't work on
> > parallel queues, which was causing issues in our CI.
> > 
> > v6:
> >   - Also set LRC tail to head so queue is idle coming out of reset
> 
> This is complex.. if the job got preempted, then not touching the head makes
> 
> sense. But what if the queue was removed by reset? Are the problematic
> 
> commands NOP'ed so that we really can leave the head?
> 
> Setting tails looks ok.
> 

So this case is a bit different than VF restore. If a job has started
but not completed across GT reset, we just ban the queue unless it is
KMD migration queue so preempted jobs are a non issue. KMD jobs could
potentially have been preempted but copy jobs are simple copies which
would be fine to run twice.

Also coming out of GT reset the queues are not registered with GuC as
this point so I believe it is fine to move KMD own LRC tail back the
original position of the job which we resubmiting.

TL;DR after some thought I believe this patch is correct.

Matt

> -Tomasz
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 3a534d93505f..70306f902ba5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> >   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> > +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
> >   		int i;
> >   		trace_xe_exec_queue_resubmit(q);
> > -		for (i = 0; i < q->width; ++i)
> > -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> > +		if (job) {
> > +			for (i = 0; i < q->width; ++i) {
> > +				q->lrc[i]->ring.tail = job->ptrs[i].head;
> > +				xe_lrc_set_ring_tail(q->lrc[i],
> > +						     xe_lrc_ring_head(q->lrc[i]));
> > +			}
> > +		}
> >   		xe_sched_resubmit_jobs(sched);
> >   	}
