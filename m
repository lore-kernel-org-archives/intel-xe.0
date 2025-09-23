Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB95CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 12:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C34310E124;
	Tue, 23 Sep 2025 12:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gShxj00Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DDA10E124
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 12:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758632286; x=1790168286;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xgvygQUuNwkC7IT9FG1ONjOaM5VNzX2O6sdALcs4Pa8=;
 b=gShxj00QZitZDIVdT+Y96Sfew65nM/e3/tx4fTcN4i8sjKIZc308o25c
 nxDZFBe8YEbWfTvGD2YR7CCDblAnfCrEyNzdQ/WYxApPLRtxd3jYW+SkH
 NKJbueuyUVnw1mUHGXMrsqAuvHhBhduEj9bov900BCnjDlF0SrzkDVX0b
 BFMZ9R0PZzUZogK4gCPXd46PuhKQdHIkOLDPPDJ8S1Q8uv22QwrO+R75J
 Y85mzTPWAKvo6Lngxt+ADrAJJBihrwaNwaeN0jdaYi/poQiw56yJcd6Kt
 jn7YU1UORtYfqw/Y6JyWeOs2iEFIcGbz1MQJ9mlvdu4nCWvA60+iOTaPZ Q==;
X-CSE-ConnectionGUID: HWuO8MZ0TA2mHHPSQo0Ycg==
X-CSE-MsgGUID: eWRU/FD7RiGdKrHRs/lrag==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78515704"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="78515704"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 05:58:05 -0700
X-CSE-ConnectionGUID: rQ8GuaJ4THysuGTdTnIbJg==
X-CSE-MsgGUID: HD/abvVjSNiVQW0XQjhpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="177538702"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 05:58:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 05:58:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 05:58:05 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 05:58:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLR3K2e9qer9B31iKy9hn1HmAcMJsiFOlbZ45Mns/CCTSJQfwM07QdsmJ305fWDK0L5nbHjHn0yftgdh4VqclHmWIiYSV7h4ErebwA+7vOjdLQfLw/nVzRiydtpsixSf5UWvJVXTCihk0wReQZmzY82kVtYc+SvjZJW04C925vOsTQmNBI1zwB5ly9+29FxsQyVvRXA7nNKJsM43DNP5FwxduzVj7+U/odhDbHFd78/cs0jB8WbhREhg0DnuNaesmmLDtRWhzuKSl4ys//zs6d7sh0CznGLAHyanADQZzlm6NfMsUa5cFYS/ti4U42eh4eC1UbRr6pnNGu6h3VvcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tX1/Eu7P5WxE4i7ThOSZeJfUXWQfAEWV2+nP1KMFKy4=;
 b=FUlK2dg+gcOsDpOsjNI8MmVyUIpRPLJiudJuiP3V5g623JVzRrr2RsBrxgKlMCkyFori12OmDxZ8FOmHFRx4ZOTTqJ+X+k58F22LuktEWe3pa7NgcFc196hhlSQE2aqUttFZHvcXD8M694s/dJxwM2cjpKRU3NV5bCrHeNcoWqWYFuEwvwNgUG6/aeZ8fFaHCGDmUbXeII90O6/KXzDfxxfrUtcFEv26RsFs3YK8yf1D6rpQuu/gj/rAR6SYJCHfwyve4IKCobQ4zcnq6o+mZ+cgeSJeGzSesSRfEBJ2PyPBBNdzFWuIwVWXfD+Q9hZ+y+6Bfipr+ze7chQ0zlv/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 12:58:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 12:58:01 +0000
Date: Tue, 23 Sep 2025 08:57:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe/psmi: Do not return NULL
Message-ID: <aNKZVSf0q0NgNPZF@intel.com>
References: <20250922221133.109921-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250922221133.109921-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: ac356f1f-2e0b-4cf8-3770-08ddfaa0d391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IcAweit2EHMz4pAOTbp+UCFS7AZlP5Ve7WS8meH4i4cMTAED+D1NREplxbuE?=
 =?us-ascii?Q?C/zN1Nwk/LVwTaXxmnFAGkhrC/q1b8FR5gMTDlDH+2NRyTsDX+6cxILO8Obo?=
 =?us-ascii?Q?owU+/81RURXmxck247qLK+maooL3UdsEI4clVLO3wenkcyVxZrocOR+sJgy2?=
 =?us-ascii?Q?xcEA4mg+USQOEcjVq9qY43pd/rQiKwC+8qMQKl+l0kJv7d0K4AAZM1ClQcqk?=
 =?us-ascii?Q?hv6+ZnEXZHgDk+rGsdo69fr6QOz7xfkPlui3dapm5gvbpwdGLc9753o9GvVf?=
 =?us-ascii?Q?2sFHoZzm0HBL8q5gWKzLZdt/tgHOdES4pjv/lA6YLn5rqeGezA7FP0Zd1sCQ?=
 =?us-ascii?Q?0qoGMxBgZIcHcXe24cB6lWBB8emxJhgD/TM8xGxcJwY8N/lu9okCGaVfMFCO?=
 =?us-ascii?Q?Rzm7iWuQQdiLpGbAn3XnikzJCB/J1jd8KqYgJ2OrfUxrtpk/A7q85xQowjaG?=
 =?us-ascii?Q?cArd/nTRIROIWOBjwkeF2EusFeCWQW8R7H8Tg2rl496wXjoa8fXU8HjyxsCd?=
 =?us-ascii?Q?lHJzMoLNfmzMTokn/nh3QIGPa+qRTLQRp2Kyo1KywJHhTW/lRGj/E2L//7bN?=
 =?us-ascii?Q?iYzCtsLDeDoLgTmcGe2h5NmHlCpUn8xNENPj0FWec0RC1bHxQPbLgmj1PAFH?=
 =?us-ascii?Q?ZkB4OYARRjorr5Y/auJJIOv5iMM2S1sndeJCKhLyOzK6ijheDo1wNFDn23AC?=
 =?us-ascii?Q?+/fctoz6Nsm5u88bI+r/qRS9iWQ8JqqPpu3eZYfC5Wd1vdxP5VohnWU1La/B?=
 =?us-ascii?Q?PTFw07byE9ntRCYekIxuPSP1EK7SXeu9GQv+NKEBSnLKs0KtIgWLitDsfnfe?=
 =?us-ascii?Q?7vEcrW3vYNFdBX1drDeBWgppFPib4c4rpNnDXA41aNUv4+IGou30Lkt375Qd?=
 =?us-ascii?Q?yb6zcoFi+3nRLOKrSO1+WisCiOBMXETyK3G8F7EzgzFe+VvgF5LhQct4/FRw?=
 =?us-ascii?Q?iZShLzyu5k+AGVAfRKZh+M91JC4YY4348JExSnJ5HnVEn1GdTzpJYcl3u05N?=
 =?us-ascii?Q?cxW8Vj+/UQ1sG5Y9oRC9CiTMwNelPCbI+urKiobCnZoRLKBZ6vPrInsKOucT?=
 =?us-ascii?Q?RJihtLNHGh5GmOptUqaqF6UVZFYyzvpx1WKBQlXtsBJ/VFdT23/1GcabsyCZ?=
 =?us-ascii?Q?V/vcMoMQw8xNTRjb5YQq7Fi98XnBovZNQTG17gPLl0ZDEi4ylevzpONnMWDD?=
 =?us-ascii?Q?CVtQwrAIgKdL92yMywVq3lvR5j5+28NP+76aJMc+kZIdu3aAkixgZCxedC60?=
 =?us-ascii?Q?Q2leJZwjKoyVoWtqfBfCAKYCZamt48zehG7CEFZP2PafB3vq0UTXq0HsORjp?=
 =?us-ascii?Q?d2UXe/gg++NNRWzsTXK+4yCwFpGY/sH+Oqw8HNNaTE9xr6BcaBCx/OZnednS?=
 =?us-ascii?Q?oE23EeMRJOULs3clEF3ZAj7XiuQk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QKU979jBViSUkpP3RXGOX4aEs2tkf3++s0+TAIHa6YWeVV9mJtTMzX3NSImS?=
 =?us-ascii?Q?7Z8fZeLu7SC+h0E1ftaVekpryXGxKlvu5dxS0R6znEsuHU/WFxJReJ34fC8b?=
 =?us-ascii?Q?9GNpTJ9veglmCTps72O54+yOYGFMjJzmTn5+t9MfJso5wxUFnRYrGloDAfAx?=
 =?us-ascii?Q?bFsUxBwfMRiJ1w/TFsZcnP+GiI43RsddxDisYbYu8HzWALaNKx5lU0fObxPe?=
 =?us-ascii?Q?q7tJleL4wkjUSytdPeJ4YnupDArsAaqbZNdrf4BfqKWX92WCBsUfYIRmvWaC?=
 =?us-ascii?Q?Fs6/I1JVFRrUcvPCxeOJM3AzGsW3o8AUm13ny1tSk1u8ug7sz9qMn+a/c0Eu?=
 =?us-ascii?Q?xz3vCuN7aFB1O8QF+IwflzV2U6kPW0soeAT85UInStNyfxHJ3r+kD85f+2ZB?=
 =?us-ascii?Q?FQqTzhNqK+CA0P64bppxT34xqYkeWxrTB8nlxrJ3XjljtdQ5rcXcMw9CU7vh?=
 =?us-ascii?Q?BLNqqqHPvexBu7n7bojG6III6YrtwvsGnaUbjNWuCwFEZqJX/lBPhnH15v9O?=
 =?us-ascii?Q?aX5PvfbgkeNrlRXuq5xK0Smtn1YKHa/82l9Od+YWjo89EoFgUAV9me2a4FBb?=
 =?us-ascii?Q?lpw4bg2GY7RbKJCyRIZS9qWsyfUiCP5mlbacoQvpkm2BIgSQzahfr+EU7er1?=
 =?us-ascii?Q?6p8CzUOQ4jRLdWWJbgO4/eJ5TVXvHcF01RlPmDl3Xtoh88nJAeJhkjxzQ/hJ?=
 =?us-ascii?Q?3hLKgamgLmGA0oFNvXrIX00e/dY6PIBKVU7ESkU24Z0P39wQt7sanOd6ctBf?=
 =?us-ascii?Q?oT1fkeqnsZAzheFyspVQkHsfoMpcJUPWelF5JfaFBfvltFn/ScbVya1DG4Mh?=
 =?us-ascii?Q?zoL9g61+jOf/xaKM1PXqTp7FWVZXzMaeeFy+yiOGCOiJPmY+aAnMqJ4Pe7iN?=
 =?us-ascii?Q?xY2RLQ72RrPaX//1YbXwrQ64J84qjuWO3ylts0ZmL/TudTPgqlVBchgmsxp9?=
 =?us-ascii?Q?EujOhOdNOM/8v7gam4NKqjQcroJYjH+OFREi6Btyj1mgPdKwC6/2hEx/tUZT?=
 =?us-ascii?Q?b16YdyOchn1K0PnDmriixFIxkwvQpS7TCMYiVSI9rJLMP8csROWNFS3Hx7Vw?=
 =?us-ascii?Q?whllu01xCRjzM43OE/fj5lUx17bKSw2I/p0BjAj1C52MjAX45XV1j9aZ6MQM?=
 =?us-ascii?Q?OnnK9PVZyEktxF93xCd8m9A+hkJjwDIUXJHsPxyzvRAyjVXLG1YX4kPRzO0w?=
 =?us-ascii?Q?MRO6OoaTJm+66U2TqDUR997OIyMQl6u9nco4BwXBpnn2sXATb3sNf+FSlF7Y?=
 =?us-ascii?Q?I8Fula7o8l2a8hSLdAdyrU5sj+lliMtE5m7z+bMNUdhyIksLzAreBDjatIsK?=
 =?us-ascii?Q?clJUvz6+8CNyje2hTE0xifjbqWp/Tw1jfNlGTfsHNF9x/l6viC5V+VaBUrEP?=
 =?us-ascii?Q?qyt4g7AsKfPEPx9lnSabVWQ3PfkTYvTrBQnd6iyS9ocNOMWsoieVsCRYi1uE?=
 =?us-ascii?Q?9kiUjIZHjaWmgI507bjVDhPl7/WHJtcPkAhlMVYctcG1ug6tZQH55SHl1co/?=
 =?us-ascii?Q?iCau0hGcw0r6MC5sfM2PZHh9bXqNsdy/Yj0JNkApqGyPVqTQBR1Jyh1dELKN?=
 =?us-ascii?Q?HtefQfns2VgR6qOzq4uZfUeIlUx/iN4p6W0RcnmlkTZvIeV1+i9xiNX0w0hm?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac356f1f-2e0b-4cf8-3770-08ddfaa0d391
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 12:58:01.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3ahqGOY20QofVMQbVQWhgSjHxd4+mF/1VoV+GSH0+xiDZwWQ7jghjtaHqUzp0d4XCcvAK5aqKzKponP030JeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
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

On Mon, Sep 22, 2025 at 03:11:34PM -0700, Lucas De Marchi wrote:
> The checks for id and bo_size are impossible conditions. If they were
> possible, then the caller should not be using IS_ERR(). Just replace
> them with asserts which should be compiled out when not debugging and
> at the same time prevent other refactors to break this assumption.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/aK1nZjyAF0s7bnHg@stanley.mountain
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_psmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
> index 45d142191d600..6a54e38b81ba9 100644
> --- a/drivers/gpu/drm/xe/xe_psmi.c
> +++ b/drivers/gpu/drm/xe/xe_psmi.c
> @@ -70,8 +70,8 @@ static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
>  {
>  	struct xe_tile *tile;
>  
> -	if (!id || !bo_size)
> -		return NULL;
> +	xe_assert(xe, id);
> +	xe_assert(xe, bo_size);
>  
>  	tile = &xe->tiles[id - 1];
>  
> -- 
> 2.50.1
> 
