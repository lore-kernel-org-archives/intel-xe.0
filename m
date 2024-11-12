Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2DDD42BB3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 17:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E3310E60F;
	Tue, 12 Nov 2024 17:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHM91rKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD71610E614
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731432456; x=1762968456;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YwVKeBpGVG4TiJCeEgFW7dkfrBIgrWzVrW0iy6yAqJM=;
 b=KHM91rKj+LjituJKh/85py6mcZWmthbtWDuclzbXCHXf4TGofRcbklme
 Ftz7jBDyJ05h7Za1u0U/Y9MHl8yBM8BPQpEGT5HQLBBJX+wxfXUNSKByj
 21rtYOzztUps1Cdwxs3+h1JTFDIohiseqBtj0wJALIPahkEg47vMa+t8p
 hwhzdzDoOP23+nBfPSSrDUkDymBOZvOWpsYzb2FGxRtZRZHdAXIY7w/2g
 fgQbNEHQViBROorDn3BrremiZ/NR1b/AJPWLwCwBi3s+Gw2UCyL8L91IO
 D9XdamhAV1xLdFPVqU4Zvw3JukK+fU0MNJDbzGcwcDh9jCaAYDLVihlPN A==;
X-CSE-ConnectionGUID: HgHC0GtYR8adf/txZ+QBTg==
X-CSE-MsgGUID: Gnwls1ztQI+O563we6jGTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18894903"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="18894903"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 09:27:36 -0800
X-CSE-ConnectionGUID: oUoLx28BQ96Ldwk22S3dnQ==
X-CSE-MsgGUID: j/0N0i0JSBmllmB0wsdk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87730670"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 09:27:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 09:27:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 09:27:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 09:27:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udvtRXZNfgzx3aARL+O0fF4e7PtMor8tSvrcSCWphnDyNM5T0ujNi3dwQrqlMrTzlIpmunXujFnwadNfYcmGIgF2AbYKrcEk+S3aRZMfnYbUQQWoz1OIydaBz2fglzFJGL6oivhx3Q+cNT4J04ZgvAYpJwO1SspMUuFKRlpmDCtKhoF0nOBCa2Hs63q65dFoaE+60e+rWcMSzt868handL4LppBeLJANaj/YQNn4eCntGLTEYkh66v2k4ae2M0ih14Zolobxh2zBJJfzpoblf73fG9oAd5ive1XsWFtxnug5Yij7X/Ez1CFnJoCisIjpW6hCXrbAQjR1cr/MKE93qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5ldRiU3CAwishTKi0KLCoIXxAtXGBnCLixa53PfxMQ=;
 b=kcTvqIAeOTSzzBHjJPH+VvOGkv27U16rcocyGY+4oV683QSJEWiVfcwnQ5Qn5369MtsrzTF+30oQkGglVZcUgvB381WFPZeMbndj6ec7GxQde17/pmSI/d3GxdlZk68lfIGTWTYFZ8otQvWAEZuKZ58ka8kx0ynI4V1gVpb9tivVMxJ05HLsVPKRdGyOIjdfRBeM1QgGkLQ+Bs6XQUQl6ZoioVI+l+DmDtxjtEilBe01Uf1d7TETQGS5kSBVVPNRgMW982qsr+cN9C4K1ShOASHsKBzUh8OPo4B1WH3Y/NtDVA7EPuxs/7ePkUB3bpN3Flo8DZLHCRaz6Q3UvC8URQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 17:27:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 17:27:32 +0000
Date: Tue, 12 Nov 2024 09:28:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Ignore GGTT TLB inval errors during GT reset
Message-ID: <ZzOQJa7w2nMSHypW@lstrano-desk.jf.intel.com>
References: <20241112162934.1119772-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241112162934.1119772-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR04CA0225.namprd04.prod.outlook.com
 (2603:10b6:303:87::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a60715-1490-4173-c62c-08dd033f4a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oYuBeV489gzqLmpwcHvk6Zuq/LiR9+mzgj482IQmwZuwY9OyPLPwdApCG/F+?=
 =?us-ascii?Q?n0JLUPEPgKqajC7SwWHyYx/U715cA31ueyZU+7QkrZtWRlvd0A2tHP9xMDxH?=
 =?us-ascii?Q?XiNH5/i5eRr4Tb6OBX257g0Tf1I4enN4ND3ng9oMZyQbp9Y2yazek4/SYhAc?=
 =?us-ascii?Q?MbQOlpDUhz32uTZQBH+9nPPvaGq9GdR56qlSQsdDYa886G64aNPNFtedCzkb?=
 =?us-ascii?Q?qum4i7vF7aqqJCqRg4tnPBFcDtU2pcUQFMcaxYBhqyjVHhcdKHMFYyRx9zBJ?=
 =?us-ascii?Q?DzAcXZPeeOK30M+yWGYXQayu46dyRETlUpMvp3CqtOVg5jyYCEFu1kVhbDha?=
 =?us-ascii?Q?oIDOB8N2uq9IchGUPmVViGHFf9N5VJWyApENoArZXizcskhQ1Jfw+FWMP5jV?=
 =?us-ascii?Q?ERhXiOigelV2bdOiWbb1s3vUm65LiqCMsHZdbgeBOd18O331UfYANsVH6Qtt?=
 =?us-ascii?Q?pZ3sDfMuYJ6Rj+WTb+XAerry6XZzK04uheAgvXOaG+1F1mBcBsB6HcMYM0g/?=
 =?us-ascii?Q?+TuJ8MvJ2ofvpV1kQqeCbrzhWktcNoQHDChMZGok/1RxRCqSyZ7Jwv1SDqFn?=
 =?us-ascii?Q?My8XrZkL8/J5hGaDTgLaQORJY0N68nX4gfScly4WcjAK1J8ZkUtSPNnGIcn3?=
 =?us-ascii?Q?HIMkNgpgBTxZO9OueJRHStnUmllP9LGBM1uuCSGiNDzqq7JxXqpWa/j1lpGG?=
 =?us-ascii?Q?JdPsBSknU16zLr/6UG6IdYctpI0XjYLcCTQ23+CAbrxtziEpPJrqJSW/18Ys?=
 =?us-ascii?Q?O3+GNA63kov8apsxNLkIvVFkv8PJyEpmYFQfAcwxZaLdFrTspU9tsGEbCOx0?=
 =?us-ascii?Q?0Dw/1FLAOWnPt8lK7ZP6puf7iCHp6Zr6J3X/lGooOu60H8PsLD8DZyQLVQfo?=
 =?us-ascii?Q?P6ebVt1rzSDzfvFzJqPZuXgRrY8LeEkaRl6haAXoRkd3518YjqA64SSECunv?=
 =?us-ascii?Q?JzIkvia3E5vaibHlScwSKnLDGXE2lB60OjKC88O4VOW81M/ltqvoPg4HGgey?=
 =?us-ascii?Q?cbr+XAJ4TnXlKBJpR6rmqU3KhBc08g06oiLyRIXpSykazASNa9Yt0nD4EIH1?=
 =?us-ascii?Q?qxgzCoJZYUbAfOKi6roVTDnmNksPy1wLqxjtf7iAaamSMWHR4yvlWUYubSJH?=
 =?us-ascii?Q?dKyfldeVx1KpgK6w/K79kBSb+48Ugej0HylKCmtsxfH6fJ2mLvBGtQLxRpcQ?=
 =?us-ascii?Q?rzDMeHfWFqchaM3i4X10mFFeskfzdxu0uNgCZF63Mo8GA4FwVSzjyX9TQWqZ?=
 =?us-ascii?Q?8Z2YxvWCLJslxNdllOvM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PMskpzVXK+ycXoYuSnWhhMtdJkHqGhrTXXvrnyJiRRiBTIeJA0axK2Y2oUas?=
 =?us-ascii?Q?IoFu8jqIn70x9nkhSXxSlOtNIUPXt5epPy9akj551GgGua8tZs73SvjtUWJf?=
 =?us-ascii?Q?eF8eANjm2+o7VMpmia4Hp3IwfOKK+EEvCrMxwcRQv6pJTjbJWOxUMUAQoQh3?=
 =?us-ascii?Q?ZbJ2bDZLxdAxEiinj5Vu8jfJhuO6mxKfWOa6XBYRhz0/IUSOv1BYoRe53/Nw?=
 =?us-ascii?Q?ooDfchc6v/kwRJ62L4nAuhA9LQETWZ6jT5dGlZ9F0uHJ8zbHqwy90VQSsdKn?=
 =?us-ascii?Q?3W7uK9TnyrhNQpgYscb13WLaOoWU8JrrL7ppywIVBEMygLT9eHDJv+kt32hf?=
 =?us-ascii?Q?d76eAjn/vDNII1a3R0HBxygXZTo+gdCFxYKoeZPXpv0UG/sVYpUVl1bl9eGV?=
 =?us-ascii?Q?Mq6nxF02T23DczU/fFSXAyQPrNvFBj/yYg6COXWGpxepG8S/sxRsIqr3R51y?=
 =?us-ascii?Q?g/aC3NaIvSuAwVrSI19nq4jyUdT/afpITiXbruJWhlNEyzEmYSSSIy51vbxU?=
 =?us-ascii?Q?0JnsbGA3gTHU/HRYcVjlXyrbDPmjFPMxw8ukAwmqOt7/r2miQlkmdkbVSXkz?=
 =?us-ascii?Q?8mNHrq24t4tNa/cU1W4EW5eUJQgd/yYOOKzQyQgPONptG5qylTHjRG/OYGKh?=
 =?us-ascii?Q?nfL2oRylPFcKRw9YgXt+1U2wcT45AtonXQ917tdvik4B9G6+0qaLtMngrRTU?=
 =?us-ascii?Q?H5kxN142lxz8qvhHt5Yl9hQ9IZQ9IDdeoJA+uMGXtk6mAZ4AdTzODHzIdLp3?=
 =?us-ascii?Q?elC3WiVcWaGEIJKKBuagXvCOEof8gOUSVekfLxvt2wXtGUSs7vHu4SK9KYWt?=
 =?us-ascii?Q?VJ0iV6hrnTUEibJsCX9ycaTJIG37v8+oxr8wQKGVXX/o1/5uspkJd6CYG9WV?=
 =?us-ascii?Q?I+u19v7bU0hUYmED5qWy1KeMwAYdjQejsFDMFjNxBQ37uUzbAd8Vwc34i4Gv?=
 =?us-ascii?Q?+ac4db3l2qQXUNdg5hvAltve5zsjHxTjLDj/qo26Y4OWZ5x2VXrrm51hSPw0?=
 =?us-ascii?Q?KMuyfmdrHMGoqhCQoANbeE9HqCpOJPlVidt9ZoSwBWhDXqxNWkiV+Y7sfCQz?=
 =?us-ascii?Q?/dEMfVbShMTOQS6cp4vWtBptsrTY20a41rqeEhpRffNTZozrv/zyS1h3vsxR?=
 =?us-ascii?Q?v26tGTdXmlZJCD0Ie28BYLwY1zelsDGQHz2t40Nt7SuhAcZGdEhCvGkLg3SY?=
 =?us-ascii?Q?KnQ4vStaYUodeSHCRuZufr4A9iHx4xaGJ5N6Gmg3P0ySjGUNIU4BG0Lelj81?=
 =?us-ascii?Q?M+oBaZeGIoHgtm/eIMsHfX/NrRnAOQJzxXY0Ze6TRn110fXgyt+GyyN+uu5B?=
 =?us-ascii?Q?meVgQkq3nu8BNmDyto/AFT9GZ01Dn1HrmAhnCX1vyOL/oDCSN1NnsZUQBwF6?=
 =?us-ascii?Q?G+ZhZ5aFTMExkOx4W63FBAQG0DIyANQUQWK2wUNa3Z9+DtyTLYkv/PR4ZUEY?=
 =?us-ascii?Q?M6YJ4kqITGz2EL0N7HqeZwx9sPK1yUPpQPMbJT0KK34vSrHZZBltuD/indIg?=
 =?us-ascii?Q?eUbkQrAPwoRUvd6ZKQIWC80K8Ksye96OX6TX8kMyqC0rYr1XF5QbtsI/MjxC?=
 =?us-ascii?Q?9zQj6BOXzFHuF84R15lK6UPzDdq1jSDDAYH9Gn6NZy8rWu3EJlHxcR6qPgv8?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a60715-1490-4173-c62c-08dd033f4a68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:27:32.4407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH+GHQ2yMt84EpLfZ6nW02X8L8hGBCeiBVfDaznH+klOtakosFNwYZ/FHWcj+16EGGYd6EiWbfCi/vTFfDMwmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
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

On Tue, Nov 12, 2024 at 05:29:34PM +0100, Nirmoy Das wrote:
> During GT reset, GGTT TLB invalidations may fail. This is acceptable
> as the reset will clear GGTT caches. Suppress only -ECANCELED other
> return codes are still unexpected error.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3389
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 3cb228c773cd..acd6ec535ef9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -253,9 +253,14 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>  		0,  /* seqno, replaced in send_tlb_invalidation */
>  		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
>  	};
> +	int ret;
> +
> +	ret = send_tlb_invalidation(&gt->uc.guc, fence, action,
> +				    ARRAY_SIZE(action));

Add a comment along the lines of '-ECANCELED indicates the CT is stopped
for a GT reset in which the TLB caches should be nuked'.

Otherwise LGTM.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	if (ret == -ECANCELED)
> +		return 0;
>  
> -	return send_tlb_invalidation(&gt->uc.guc, fence, action,
> -				     ARRAY_SIZE(action));
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.46.0
> 
