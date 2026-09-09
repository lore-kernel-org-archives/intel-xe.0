Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AC2C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 19:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EBE10E1F0;
	Wed,  9 Sep 2026 19:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2S03WaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF0610E1F0
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 19:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788981228; x=1820517228;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MOc9ImkiSJDOZETH3TY7Yay/W275gyrKcF4Qu5KSaYk=;
 b=C2S03WaO0kQsf65Bey5o7rTaXqr+s7j/+Sd3fgpXdSQqgfNlDa7t1hZp
 G2nI6t2buSCWNUQyVnBwwNsl3jD7aPF5ucopYNrr6ZW21uXvdnRA+zzan
 nXxUKeCI8ZqTvKBd3wRJGoWyAZdP74ri7CIF1p+ZUAFmiDw6RCSr6cFez
 uRy2PWIiv6NKp1HWRe+gPWc3Y4RHPyub9Bwd6Pj448esP64WUfg71oDnd
 kdU2cHaXHcGLy+f9asWshEx8CV5fEyJRCiUGH3OwsOffKF7ce78/KVq3P
 8ZGK0ByQ9Tl414+5utcOYlyl8cAUdCJEvQsyHZf1LufladF/zJukvHDZZ w==;
X-CSE-ConnectionGUID: wRpS3VJxTSWevszFK4jg9Q==
X-CSE-MsgGUID: amGr+PX1Sya/sO0kPba+ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89290402"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89290402"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 12:13:44 -0700
X-CSE-ConnectionGUID: v0ERvFleTZKbOIfOovpT3Q==
X-CSE-MsgGUID: OLiU/ESXRNW4Gg2RIaGJmQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 12:13:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 12:13:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 12:13:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 12:13:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfD+CdsFEOthpLwVZyPzc0jyiel/eSed7JHCr7XgcMFCxN7JfoqGQ4mKiNQDn00WVNipU/JHNsMSDBwSvaI3JKqKCaZGJylXd8J9paEXd/YJlrYQFDudB6N4+ecjx60lNLkfgLjOkZzbJdC6yQkSpIe4oJg6sJhT1/7YExPTVl+O8uua5J1XvT/3dZ5NA39XAL+j3V80xpVXeYjG4cTKBkwrwUGUBZcxn06pRmvhCvUcPSqt3m+0YIQG2mAgkvnpLLJIUgc8eNe7ok3MAiVDhLDYDsHOuLDMLyKyrFnqVVCo3wHJ0DJmfRF+oHdZJtLNg5A6OhWAmS3pUptxb9TstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iELBttrbnlZeP02nL8l9ftfFSdRzvHAxoy1UcWpVyGk=;
 b=D9sUkvcUhKYjtsUJI0Ps1e2GJGpR/YZ7af/GHFzceEsRLU3V1xa1dCUN15QnEHnmVjiLaRWDi8ayo+Sty0GJ590hMs11lm1JAGVPb0wGKl/V09S41ce9Qa/+9t5xK09bA9PLAHtvZzpXISQLKUnna3mPCd7t0WJsAjKSgAWzAriu6uOjKLewjdsn8zyz7xaIM9sBxm7egYBYG3u8nLsC+YSZRq2ZnFnMRMm5hcy0xdlr5CEGQTab51kQIc3vNwejBWVr7APpTdz514DI6iwvDqxgeAASe24JRxHFBX50lUkADaEky0Bd4kDjlpV/hRtiv2TpPEcat6MP1CP1J/RQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB5898.namprd11.prod.outlook.com (2603:10b6:806:229::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 19:13:41 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 19:13:41 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/tests: Fix subplatform selection
In-Reply-To: <20260905200157.3164-3-michal.wajdeczko@intel.com>
References: <20260905200157.3164-1-michal.wajdeczko@intel.com>
 <20260905200157.3164-3-michal.wajdeczko@intel.com>
Date: Wed, 9 Sep 2026 16:13:35 -0300
Message-ID: <87ik4ejl0g.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: 93972368-5628-4a40-557e-08df0ea67581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 9H4F/ora2BdwCMLvesy4cKDs9HeKmB1LvJiiQ82pTnkB3eiFUra1Ld+74ui5qgJN20gGggjYM/+Nxv01jIwHqPeYF3l1cp6oMSWH+a4WUkbAQHOMi7ztdvefFJZ0LlzBAccyEGbVcgdoAGXzlW171h5du2BXd7Kw11aovG0DjfMmF45eHgCXYLIV5i4JkQBZ4bFkybYS7htVpPv0k/r9ti+9rf6fI6D5a3MqnEJmHaQAsPcAB/YjBfiC+z8ONI08uPOgcNoi1eFfk53oDwMjnLpLZ8BFt57fwdf0YaAEKFAuLmE1vLWmZwGzRKsyY7j3BJ8GF04jaA4kotAhNL9rXihmz4EnT50EXlKxnnYVGQ8+a/5s1BdSrELuuWdAYg8WkJtokmURqpMWKcdJ6tvFbXRD33d7YsU8OnN0Bil7C91dbQbdjDxqlB53oX2EUU1shf6OHAIIg2z9sYTdX+qvGJiAP/mAfM0hqUJ8NMih9ti/aT6Y8bs3dJvwuRsvGHs63K1DE2bf9YHJR7XXYeeov+8/JzVpY//krMOHs7STHdD7Q2QWtlN9E+QWU+eHJ5Vr2FfcEh9CLeoJyuJ1HouLHEM6p93y17IRd85OxidUk05ph13Dt8TEeaHoX3aThR3JXMg6g7TpTTL/6Cuz5a8TY6mb47WH7+rwq0tIVH9Kt7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?839D/GTlY2GHn2MfQDfPOTLex7W+kkUokcAzBdZvUSsvD0xlQHuGIqKcjlpp?=
 =?us-ascii?Q?gvkxveYXot6HEfkyTJ0kuUgxmA8IMqGg+ydCr4sUT1Im4UnQlgJi4Nnaf8Dj?=
 =?us-ascii?Q?J1QM+c1OjI9KanNQq2buY2itbd0o38mBofjh/VJB6pLr3Mc5CcsnaK3iUoIw?=
 =?us-ascii?Q?N+hR7DQEgLxj+bZp/wZQzWeAQi7+7N9NJRjgltxUTiw0+coSpCqgEm9fRFvN?=
 =?us-ascii?Q?DDspbBne1qD9eDjOhr8dbmR1SukHAYq+5wR38ioLPwRu+gRGxfV2zwGVjdG4?=
 =?us-ascii?Q?N8zFaVd3lcGJ3fiPBgGLhAfu3kgjkCsH7RnQE7a0gPx4jnY4bZ62ZSTtA9H2?=
 =?us-ascii?Q?Cp0p30G5VYciYICEXQdGpPKjKKwSB1m46jK0Vn6vOBUoqLj5GsGJKnZkPlEU?=
 =?us-ascii?Q?WYtH+n5ZllpTykiVNXX5BusXCO0jJ7JW0zchUfkMHYYY73BIc1p+iEGxqM/6?=
 =?us-ascii?Q?jw1ROzMOxpXSPjQxlsm6BCG7jpYMPlJG+JB5OVrOituT27nwr7UoaCMF3vlj?=
 =?us-ascii?Q?Fr7M7KQ476cQroPRy7LZS2VGy/YuvKkwf4/Dg6rxbrIfAOAPLdxMm9TV4opp?=
 =?us-ascii?Q?Su4GdfNwojCiDbtjXt3Paz+UkNhoXxxGNaUVLxRBMhCSgFUvCjd8VmXrVI36?=
 =?us-ascii?Q?/PlnlRSwxVpzgw3zWUhA/1JjaX+TFl326mf+Y5wlp0ZJ826h5ApzOYG3sUct?=
 =?us-ascii?Q?nOHSPv7SEBmTQA3QGqaf3mdSh1pnlMFn+o8aNl3uAOR0472LD4NxfDyfJsSi?=
 =?us-ascii?Q?X0waHvX/H9WaG1zhokVZUQeIXrOpicBQAYkJcTCmh1GVHKL+gdtWxPipOEKD?=
 =?us-ascii?Q?XFqanmRtvNCIWJFgK8a4cC/sZcUU9I43dubKpJW7dyCxIutKl2dIHuNJCwac?=
 =?us-ascii?Q?VAEKyrs6Thq2Cj1z3NHjoZaDuK5/WQnzItIn69W/iPp9l213S57yVxFifZIB?=
 =?us-ascii?Q?wTFGaw1FBCBh55Tajv/LPtWfszApn2Gug/DlHyi1/Nj3zQ59E9nb828f3Zdl?=
 =?us-ascii?Q?9cIZLfFr6Bl7NdxMumSdxAmPfev8Qpn6zoWNLZpwbShXzk11YWoAvd3hZhLR?=
 =?us-ascii?Q?U7Cd038ROm/GcZxdLulz8ewpUZVb4Wpv9a5jya/mC+bgDEBHeFO5+UhbfDTM?=
 =?us-ascii?Q?tH8m/x6Gvug3r1WhvMqn7I7uF/ArQ9Bp6tOXV+nH1D2nsEYFZk37QHHXz7kj?=
 =?us-ascii?Q?UdZCI9V/Gk63lCb0jgCs0ZZWNP8ZJb/WWNlwZ+yg/a35fWXq7S4IgRzoC/nS?=
 =?us-ascii?Q?OSP85L2aAOzlcsgvRedLqbgkERuPvX0FlAezizk6yfSDgP5dM5wIA4ijPcPb?=
 =?us-ascii?Q?mrzA7hS67cpaqAIa/iKnXA9IPMkvJVbnIr9GZWuAHMkI4ks6LrUBiGZuXoz5?=
 =?us-ascii?Q?pbwUwKQj2JMr/zzqv5xubP0DVGY2Gn6ad116OGGvRus4cAxu92lEKYxQG16H?=
 =?us-ascii?Q?tdRPsxtPQ9lW/XPam8eHgtTs2q1lIJjdBpZDn1+lKPRy6SwEYpOngjOS8nTg?=
 =?us-ascii?Q?72qZJJnqWwkBlCpCBnH7jktNTIv8V2SwEosFoTA8agFddMDkNOO4lJZdgn8A?=
 =?us-ascii?Q?7odWhBz0Vl4fFPaTOxBI5mMA6c51avvfJALSlheZ7sCmYGn+LB9MLt3hcYq5?=
 =?us-ascii?Q?7O4X5DcP2TWRy1sFyVQyIXNdjRWJrcY6TMabWNrw6QMPIlq1nAJCpiMOwmup?=
 =?us-ascii?Q?XgXTtuSJ0bYP3cD8ijGBF8gpQTWMSDY0ET4GCQT5gUUlxSueWfgjN6XWNLBO?=
 =?us-ascii?Q?I2VP8T0ybA=3D=3D?=
X-Exchange-RoutingPolicyChecked: A4kjWxHtfrd4CC08yAyBXdtfyDLSZFvrpNBYHRYqiLtPgsvETR1KEkFKg1go2efYlqwAZfB/QPrUFgqGd1gdHnA7UPZrbXgy7xksuI4fOkKDGP2rOZZZlqtAlnMQpuH4N6QyeWmkyz4oNvYkSjH2z617BBUfFErnwXoRCagux+5hGgsCOglujthMl3FjNvWKoo2V+Q6fA4hZi/3dg1SpuN+jgVrrpTo4LPX5GhgW/2ipjmJ+ZSY/DwnwnfTxr0Lnt3kSrh1d+E8QyTeFLXYVSpFoLWT6l47omSkfL0Hg9TnhjCQ9vMMvALCxqZrgHkagQeQMqgBHyo9cyw/d5CyYAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93972368-5628-4a40-557e-08df0ea67581
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 19:13:40.9730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utEzlyV7bvu9X4/BHAdVEw1ILxXyw/0TZtaJSObtbIdK9wSR5Mn68Tpd66YOVGzGVhmTP2k/kDDR4e3MI/2UXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> If a test does not specify subplatform details about the fake device
> it wants to create, our helper may select a sentinel of the subplatform
> descriptors list instead of the first available subplatform.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index a82cab7a2b86..8ab4270cf5d8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -364,13 +364,23 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	if (!ent->device)
>  		return -ENODEV;
>  
> +	if (data->subplatform == XE_SUBPLATFORM_NONE) {
> +		subplatform_desc = NULL;
> +		goto done;
> +	}
> +
> +	if (data->subplatform == XE_SUBPLATFORM_UNINITIALIZED) {

I guess here as well, subplatform_desc will be either NULL or the first
one, but if we add a comment in patch #1, I think we don't need to
repeat ourselves.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

On a side note, orthogonal to this patch: I wonder if it is okay to match
no subplatform when the device descriptor defines a list of
subplatforms.  The current behavior is that find_subplatform() returns
NULL and doesn't complain.

--
Gustavo Sousa

> +		subplatform_desc = desc->subplatforms;
> +		goto done;
> +	}
> +
>  	for (subplatform_desc = desc->subplatforms;
>  	     subplatform_desc && subplatform_desc->subplatform;
>  	     subplatform_desc++)
>  		if (subplatform_desc->subplatform == data->subplatform)
>  			break;
>  
> -	if (data->subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
> +	if (!subplatform_desc || !subplatform_desc->subplatform)
>  		return -ENODEV;
>  
>  done:
> -- 
> 2.47.1
