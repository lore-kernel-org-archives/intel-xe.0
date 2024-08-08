Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04994C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87CA10E03D;
	Thu,  8 Aug 2024 03:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0TyB06U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57BE10E03D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723088745; x=1754624745;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rsWVysFY9eYpNuRXXtrgW0lshLLVfNZ5i7Z/4UZP1Yc=;
 b=O0TyB06Up01RFXmWAqr0tz2lBDRvpgVSmgjI5rhyC2/fU2ZNQo1lsELs
 vZTJq3flBFW59bHpO+dKJTfc+clYmOE7h9Kc00CWxl/T6LmaCvtcMWB3U
 5AA4B87PGFAu9QFm2EU0q5fw+4gl2wkIrq75zeAZ2Q+46F8/1RQdtjz2e
 sE+HecLW0OgoGpiJ/3mFm7paZQGf9rWj950uvL2lpy8V+XoGz5ZAbvt0o
 jj/1VZWdg+kj37rSwE7P6BGIUHqQ1uXdxkGuzFplvZmj0bOkYNMqw32nQ
 yt2MwzjGpy0XPn2bSpGe3xGSMmZd//d8ydgx9qOD/RZ5vGqPzssOJOHMx Q==;
X-CSE-ConnectionGUID: J1p7B8X0TDiM62MlcRZVLA==
X-CSE-MsgGUID: f6gAD+FwQCKlPP09egw80Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32584046"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="32584046"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:45:45 -0700
X-CSE-ConnectionGUID: h4HgWyN+QHaBoSVsrsZKyw==
X-CSE-MsgGUID: 7G976JPBQBijCAwmo+xe4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61189546"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:45:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:45:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:45:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:45:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juEgrY8qvRypaxykuVtfxIzvMkUS83shx4GMf+JNr6x+sc+hUkwlyU3Vc7wAIzBLUld/IbeP3BkSfhhDpbMdv8a3TYz0n4oPgx9AehcmUa5GM1VB3a2+QPt6ovC7u6FQ5b9phgrODQIZtG4TaHql1uBR47NVXJoncWmqYr8SZmZ72O6FegyBrDrS8hA2ccRu7cnXfrI6DsmCac+ifMy1/yiNiNzxd+ccrqKFz7WvToSfd+uCkpHDwGl1BCaNEAxerW6geoOs938HUBxPXWd5RuKbq80XRMgLVZVXe9ay8NATonGNPiMaRV46vWDv5pALAMiIZhl0DMFEGHXRKSmHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkSqdO1vh+K6NBHzbyO2NfDA3QLaBQPinKpVtG9FrUo=;
 b=dmFA3P8L+RJ/A/4lRZFORHU5BtHwbovT59ecHINJhAsxuNUj4GNGA1Y1boSydnQ3FPouak+uv0lkPTkpT/Qxfg8PU7du6zK4kUkL9GD0UWywiMnEcH/LWgt/Y+Qj5wx3rtT1BasjqKE1KnHgHO7HHeZDaDmAtGPVHWXp6rzEd3TILAro82asWcFEaKxHekVZl7yO9F5KXconnZpY9sGkvKbKvbH4Okmgf9h+r7yal8SYVuYpEVQVa9hd6jvbTepWF0puXYi3suBrF+6fucoLlMm6ACW9ESE+YEKYk2MXGJMStCTkS9REHzeRhGu/CsaJj+fLg6joMzbhHDQ6pkQZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 03:45:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:45:36 +0000
Date: Thu, 8 Aug 2024 03:44:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 10/13] drm/xe/guc_submit: Allow calling
 guc_exec_queue_resume with pending resume
Message-ID: <ZrQ/EU2pnJr0ElpW@DUT025-TGLU.fm.intel.com>
References: <20240806192739.1076344-1-francois.dugast@intel.com>
 <20240806192739.1076344-11-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240806192739.1076344-11-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 915b27c0-fb9c-4187-4bca-08dcb75c9049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zcLfZrnNLAdEdR8GzqsVhh8dJI5ne72yFwbiNdsT1cEwBU2uTll0SXRMNuFS?=
 =?us-ascii?Q?8mrP9KWt+P0rWrt5DsFR8bsNN6zSDiwxs2HgU1BC72/7lr82MxcXAupgEs0y?=
 =?us-ascii?Q?+JZfQhS5DKGqeYncXxGJK9NBjGdV/vRvjoH3McqM1HpWuRrTegQ9xyihsx++?=
 =?us-ascii?Q?Um8TBzOYg8a6vEwH7bE9IasQazFqRFFH86UWZI+cPCawPW82XipDCgqjlacd?=
 =?us-ascii?Q?jJLe4G+uNuXYdnx2sy0qhC9rykh21RpA5GDUE3knhJBCRraEJ7yt0ibqT+zy?=
 =?us-ascii?Q?UXhyfJihpBDFQPKE1eLYvE8BIqm0xpRhRHpTLDrRH7sviLouZzgGFQra6u7B?=
 =?us-ascii?Q?MiJnHEebkexkmnF6TkSR5v6oVa1YkdO/ZTaZeagxpxcdfVcTcNM/anQX/C5B?=
 =?us-ascii?Q?XRo5Q26D4RvyTzC6Cc3lBFpbcQ7N8AuVC/a/O7NeoucPenO9Stdj9L6lWNnD?=
 =?us-ascii?Q?vWUHxaU2SdyJTwhbdglt9a55QAUTEIIX/bJp0UVLlrEpwEoKSeTA15ZW7TS8?=
 =?us-ascii?Q?Gt6/DtaPxLhT8to51ToDgsXVUlGHUCJ7TqPQnIC/X4LpyOo2qlarqfACc9Zs?=
 =?us-ascii?Q?CkaGGvYaKsnHm6AnBAzUuuab/7ijwvhxgfMEDbJeN89fy6QWB4JZK5/KnfFZ?=
 =?us-ascii?Q?RBwlqSQIEU/nml+1bzpMTEL3DfEiw5/kVDdfho4nmvEyE/CEdc16V9Y3vFIP?=
 =?us-ascii?Q?fIw1s8kVR48PZAO2yhEbmhGFChURgnLA+tB+IWRS6W69puSbelqEIFROLdPK?=
 =?us-ascii?Q?CyIDY6khGTKnWzlTs3t4OsQWJCi8lj6kStN99NwuUQMUqIfL+gOp4vsfbuaf?=
 =?us-ascii?Q?/EJ8yBxMbUIDkBrRv0TIkgrLvHSPtUrYebpEwv3FVXvXusoelin8Sq2q4uOM?=
 =?us-ascii?Q?6e7zS66qbeGzWFInOxuMOqb8cxXkeYMW5TMtGyZkI0ifTOar8kCHevzlU5JY?=
 =?us-ascii?Q?TdkmOPp/TiTPGGEKOY4oXLnZtv129ooI9LOWjWdKjdEZMXYsONgaHoMDwK/U?=
 =?us-ascii?Q?SXnes8kH1rZ32hubUhcS9n4tQClU+sKzVqvFOLzCC6Uqj4ZLcli03GgA/JXM?=
 =?us-ascii?Q?gTgBxcY8MJ3pHR0C7s3DZPp8s/G7F/a4AlwTQMxNQLXTU3KeDU70tQb3Og4Q?=
 =?us-ascii?Q?3lJtB6V67rLA4nSohRBfMfJMz8ClwozHmyLNpipVEzReS5fbSe04SLk4rFtj?=
 =?us-ascii?Q?AnqeAiCuky+GJ9dndAi+XgcmAoQ3+u/i6G6FSP5UerG0ZbeyF4BZeP9OaESq?=
 =?us-ascii?Q?RKcv8dVxXbCXKkmiGp9vCllvLZNulOU15c18dgzQ5u4pnn9TlPSTxdw26/Pp?=
 =?us-ascii?Q?TfoXAZIlG2zsTCI4qYNNp77Qo/JJ99HYbxKNqlwk1wT9aw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n86UGXXjfH+OPnhiwejtPHzc7V5Tr8E7NEAtIu0xDqv6MsR1DdmvEECdoPTz?=
 =?us-ascii?Q?KCo70Vav8P7pyOoHzWGAW5IcBU01tgHHklnVyWmHuk0dNbGNkXQcC1aKqgJe?=
 =?us-ascii?Q?JI0RBclbdnv36o5+rmlwwUhGdDdZoktEB8Tzuo51fVzoBNDtkto70clac1c0?=
 =?us-ascii?Q?NVfGP9LT1grx5tr6j3MOX09uNqrk3a8j7PpjqC936LhrFglzVq35DniBU9d+?=
 =?us-ascii?Q?Zdx0fgw8N8kkbHYcjbqxs1VlBcDVCB+Od4SRIeiogtzvSB3whiNHEZuOn6a9?=
 =?us-ascii?Q?uGCahWSmHtlyWk7/9lNlWX/Lg5NIyUoo8JWJLLWj1+BicqItLaiZ/Ss5aewJ?=
 =?us-ascii?Q?v9Q09vroBp7uqH8hw1WDiroLxm+aNpCDGDONl0pfjHgX1GipfafkaWJdzzbU?=
 =?us-ascii?Q?3cdWqmhPZmPyfhqpzdmC2sdJF73C8mIqe5NYAR3Ux//r7zQ+Ag4RJK4adtat?=
 =?us-ascii?Q?P/ejIscz5vWBRMKHjIkrP7M7GuW3KD9UWp2jE7AzxryRCg+vXTKPlDnsVQJm?=
 =?us-ascii?Q?wtqV9onI1/S268oxIjNJRAcWAbDHiN4DCGlCOjGCmwkUq5NDvZqERb4QwVRj?=
 =?us-ascii?Q?8Kza9Em9G8FmaCcOu27/7GjU2koS6Vb2RTGC7QYIYPcUzU7Mr0FGQZv+p1ry?=
 =?us-ascii?Q?CxVCFbVGS7twGE3tT+RdlFmUlCwQjVliKKsh1q9pz8IfMt1wL4u3wmexYB/A?=
 =?us-ascii?Q?lzQvuf6bVlXRMoBMpk1FqnsyvhZvIy86Yx9YDw/UVbgYQSOKttxLRCkl7QvQ?=
 =?us-ascii?Q?PlSeS5K/A9UcczjFQ+5Vo0+JacLnP3aT74S+ZQLgPIWcYfAsjFA1/uw7K8xw?=
 =?us-ascii?Q?K9FRIbwxpU8jjl5Yuy6Bp5sRSykaUQL7iYMbjRThUrL5n1MThQXNWDqO+oc+?=
 =?us-ascii?Q?/lDeJpMGNG4v8+4N/mt1QUVJDlvB26OVrvcdaaeCsvrfG7bn6FuaqbU9dalh?=
 =?us-ascii?Q?5DGrYJDTSF7d3Vx6nqAwODd2NpWfVBQF853SMurrlx3nGE5IEisn/yrMaesO?=
 =?us-ascii?Q?2G9rnmAdfWnhyD56E/rCsa1vjCcIDSsSikyRHDlDijVGgHXkpbCCensq2BtO?=
 =?us-ascii?Q?DUEp7C3nKmrYEveYsSp6quvo+gKp+7qltkPHaQuXoCLk3Sb84PE7Pmy4pWcP?=
 =?us-ascii?Q?rLryUCl5e4Xe/Hz561EKpfMCePcGJTUuqXGlFU/u3uXZ3S24eyRs+qtzT3uC?=
 =?us-ascii?Q?Co53i9UzqEPTQ3YaS7KiFcOOKX9kwYKeq6S7RxKlSMl828zGTsGSZcbD1tvn?=
 =?us-ascii?Q?0VBcHYuGAckvTY205ibVmFl6g3OqyQlDsp1LKgb5wmfm9JIkw5igLqxzXE5a?=
 =?us-ascii?Q?aWpZjTT2mat5/FkYpl1A3g7Uaa4r6C6OjcvEG4jkhQZUsSN7cD20UD22DyMZ?=
 =?us-ascii?Q?2Yh94hvuLywkL6eL2K6lVFUL8Lus2lteHgs+8FGcOHae+pDsPJmSVAjim932?=
 =?us-ascii?Q?ZVB69xmP2kvvAEzEk0q2hVwviQdngesU7ys7D0QXl1fwckbXlqLtl5zKjU0J?=
 =?us-ascii?Q?SXxVNkqn3gXYnBGCCyAhCXZdC1WMJpyfhtX9Mf2L0QKHurA2uJ3IwziSHUXf?=
 =?us-ascii?Q?c3keFYOQzhg9EkXz7bthf1f+fkAemC080DIBulTkE3FsUr8bJAU0dioilXlt?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 915b27c0-fb9c-4187-4bca-08dcb75c9049
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:45:36.6285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUTbIhDd73iKUSztHT5GCJyUosfLZCoq4T4JwVvWkCo+9ehQsltcvcyAVc7Ju7rMyK1OnvedpBTmdMbO1+40bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7717
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

On Tue, Aug 06, 2024 at 09:27:08PM +0200, Francois Dugast wrote:
> Make it safe to have multiple calls to guc_exec_queue_resume() for the
> same exec queue. This allows the use of this function from a context where
> knowledge about prior calls is missing. In this case the function does
> nothing but at least it does not fail on assert.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 50013e1e7455..782561b21d24 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1623,10 +1623,9 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  {
>  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
>  
> -	xe_assert(xe, !q->guc->suspend_pending);

I think the existing assert is correct. We certainly don't want to call
resume until suspend_wait returns (sets q->guc->suspend_pending ==
false). 

I think if we want to make this safe to be called multiple times we need
a new function 'guc_exec_queue_try_add_msg'. This function would check the
msg->link link under lock for empty and if empty add the message. It is
harmless for __guc_exec_queue_process_msg_resume to be called multple
times, it is not harmless to use the list twice.

Matt

> +	if (q->guc->suspend_pending)
> +		return;
>  
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
> -- 
> 2.43.0
> 
