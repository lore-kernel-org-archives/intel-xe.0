Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7C6C52D73
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 23:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794DB10E82D;
	Thu,  8 Aug 2024 23:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1ktZpG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534A710E82A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 23:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723159617; x=1754695617;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dktgo7wnSYiFxnezm70O2d/IpswiNsGl/PfjUB+YPZ0=;
 b=V1ktZpG2CAC0IF6GkugDJnyW/XqMB5cX/sQ04LKpeW+Mw5w1sXiuig5J
 lcaGawa6NVzKS7q2mKrv4FGJUJncxOhCGDZ0hoLMqeUVf36Q8wtrzdUVl
 MLOCjQjpTnxMoXlPyhY5A5hHaMxwr8Y8v2scrFP7UdPUZTdwHFKCiYn4j
 0wqJGmBDOP5hjg0j2jrq0Vv2aVQspwhJP2M007nn34BLKaEectzNlf/94
 xpIf8xg7VLf25s4BkusDwQs9j1sjPJCX9hG9i4tluaD8FKjsj/vYZeOSQ
 Kj0gBevg7WidybOMei34tvdxzRKgvP63y+FBfrgB3O05VWUY+CpIxVNUD A==;
X-CSE-ConnectionGUID: zHnMGygsRqGIHmSl8I0n+Q==
X-CSE-MsgGUID: FruUSeJnR9uCTy2Y84J83g==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20978382"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="20978382"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 16:26:57 -0700
X-CSE-ConnectionGUID: 5Y4xQsTAQNyoFWXAN7sWhA==
X-CSE-MsgGUID: Gc9obPZ3SW+h4ZPzuT9AkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57341068"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 16:26:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:26:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:26:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 16:26:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 16:26:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYeX/wxhEV6InMDigoWhv9sFdh4lLf1lcZgMyisMqlHyuIeMUSAEm6PpIWYthSex2KQtljhJZFyAZpd0rQFc3hT23sMGTYONxIJDgehiaYHoPISCPN9Le7lPTMC6nXUZVui0JN9pc3lcNtx4l3TL/aQyOGTe3XZUqU1/8yAeq0Ag/F2cwy/yBZvcRkV1349oq2UDeDm5dySXozm82/h0uTGoQxBdRtFzjZE+WaE8fqO/pKJaJ53uVTN30S05pXs8ELjg1p7RrLVLS/oY6QsgfAq59ESHol96RvdIGdakvHOH3elFUmBN2v3e89sMPiBX6s7hFA8Jn1TlTYXIUbTtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XR7AKrwpxGZZZiz3iP0DCJl1EoyprS67Tw+jc+jBvM=;
 b=xHyefPsw+0sPs+G2hffmlI1pmrzhvKyEDFeXTQxhxnf4pGhRJPDQNCb4AVk6sQA9MgYlx2ZO4bMrTQQvwdNqruC4HOBj6crP/YmipdTwUsFWPdfhnDngwQzFC+zCwMEVvA07R1x/XH0d6JbZQ8BWLo/y8N+fok/F6lfan4feNS7QvLPoJFFkTLCUpBVXGoEk8N40hjbnw1FNi+VXUOPUAFIO2kzoUx0rYc0y8I4mfFayxRDmE+4q+Xmf2BjqBGNbwBgdQobr9nUziUh0rE9MgANxJSRHP3u9zK9rSwzg59l8rSLHujFhts3dLUc3Auu8MAhv5x1OTmUmcG/4LVw5BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 23:26:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 23:26:53 +0000
Date: Thu, 8 Aug 2024 23:25:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>, "Lionel
 Landwerlin" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 4/8] drm/xe/oa: Add input fence dependencies
Message-ID: <ZrVT68nl31d1wfZh@DUT025-TGLU.fm.intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808174139.4027534-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0dd5db-0220-42e4-3355-08dcb801963a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gfILK4NLoiam2mALmCJ5TeKq4e/S0RXDZfaIr6pjFXdGZmw9zbMnWZDcGNik?=
 =?us-ascii?Q?m1EFEepsziPdsOdyIZ8etJSjJ8P+DFsASQOqv4vLmqDn6q5N6t0wVq+JAa7O?=
 =?us-ascii?Q?CG1T5a1cUdsx7BFcwXiXVcT+EF3tqtnv2cFkodrS92U0jvdNBvZp5TXrsEMK?=
 =?us-ascii?Q?/7HVNJPDm6Hk8w3jFpd2V0GUMmwEtncEVN0vsHXmAM/Go1mHNhuCsMm58Ujo?=
 =?us-ascii?Q?PAYsj8KuOBXcPw104O8HYzKwduX+yL7sgWyJlzzGPO4ap2lhTcUqkcsGMQmf?=
 =?us-ascii?Q?60KglcMTSNuEvwjnCsUbef1hZG0zOGVd2bkdawr9auEjzCYYjluKd/M+HYmp?=
 =?us-ascii?Q?Vtcc6DIDWHzG03mDEHc9EQ//YnbELMLyFnCPNtUqHTduTnCewlsBbcpuSi9y?=
 =?us-ascii?Q?n+L90k2bWnVxVekr23aJGsXEgvNW5WNDiYggWLUwC17gU93r4Pp6kwfITWZ1?=
 =?us-ascii?Q?tdWv634PStVUp0J97j/VbMDW/XhxIAFFZgX39RBGqWz9O7/aIpgJqz9Fryea?=
 =?us-ascii?Q?QTWBrNE5Mv2v56nWo5P8mdufzDykRBLUY67g9wHb7LmioPNdy8xZB/9qKu12?=
 =?us-ascii?Q?FuA2WlL7TbIGN9jnT22g82Rfb3EntJCFH/p0iY9z2TJNXkuv3fMcxgTww1uv?=
 =?us-ascii?Q?BOdLnE9+yoUW4qVg4D57k7w/25mgiptkBSqQTYEYVzEERS+J0n4S855WFp8X?=
 =?us-ascii?Q?Y+tiVgM9BRQLm8X4eC8FFGI4VPg71YIaVXl/TtV0roxJ6Ec/vQ/10MoHb6ai?=
 =?us-ascii?Q?6l3Ob5iur6dTSYhqQdHzUSuYNwdCWB1KTlSe/Bmp2ybRkSiW02aSa01lLPqC?=
 =?us-ascii?Q?Aiz1RkcGFBBDuoOT78LgE8cOc93vsIGDOsc3+7xAgfYTi+Na3SzkoOUMzw+N?=
 =?us-ascii?Q?nt0QeD6nyunZGyu0uUZb2cU0dJM65v9cYsV8N4DAlEwIbQ83NEEv/nwelpoB?=
 =?us-ascii?Q?kkmWqoAMyWyZ2ws4Eh5tIgdO6DKykM9T3HzCiGc5ZzXPdWWK3M/xG3Wru1xs?=
 =?us-ascii?Q?XgyZ9dUe6mUhY2oV4/rLJMyMjPLRlbcU9nD1lK/G9aH8vManW5iK/AHilpFt?=
 =?us-ascii?Q?x35e19DUpG79A3z0nZXAQNiXWCMiOVYlOYhVJrthcYDHyX6xMQk+mlE58aSS?=
 =?us-ascii?Q?zPY9TJKpGTPc83P8oqSF0tBoHVjmcPvYKDjq7xZ1WbpRU4XlGZMkkE+qDPW5?=
 =?us-ascii?Q?bGE+rIzFLK69XEkQ0xu4zWaPex+Y53xIJWQ9X5nrtt7LCQe7PGTOF9tAQBOX?=
 =?us-ascii?Q?zvLYLg0mub3Ol/nRFuvNTdYxjZvEYapSD1FveDAH2luBZBhTAYOFhrmu//NB?=
 =?us-ascii?Q?hJM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qNKcPaAHNNzB14pebQuIOU3sBPF3fbj/mfNu4ndRQTzBACktBNBWeHh1tcWv?=
 =?us-ascii?Q?LK4ePOMGNjBPZ15xr32a1TekPORGvey7WJ6euZEe5/92DHcWKmHkVgk2JToS?=
 =?us-ascii?Q?vK6LV2G+pjaJOauIso35dDJaAscxjZIEM0hdZ6wq9656b0/xrfvvJUf0cbh7?=
 =?us-ascii?Q?oUuM67C1bG1qLLmAjuwspWz/mFbFOo0G23vlMkXiEGDMa21cpli64pIz1816?=
 =?us-ascii?Q?g8Wl8ueqfByBJoLCYCPUzixl+VWI87FxALUoMxPNL8IIlLL3ECR3mMNn9nco?=
 =?us-ascii?Q?dpE2gjqpxSe2Rjj63ciBPyJ2aGBvC5TMCErLzdeeoCg+MMZ4e8aW69tdp5pR?=
 =?us-ascii?Q?pkbtbPnUx7RlMs0OjJk4+IyRD3kcNGBLtFcum2PKK7RDECNg+DYZohcS0SgT?=
 =?us-ascii?Q?umvxcSSwCpaUCH5jstgWZk39b5bH92f9GSlw74VNcXfW/4hznteiE5S9xS44?=
 =?us-ascii?Q?gczIOMMwOX5CGq1XUMs4DE8t0whQh6cJP6v0aHZZnvKLbEWp5vyMxPDAVWHR?=
 =?us-ascii?Q?U7b1HFf2f7RmYQHX/eXYmhlHbjfIyIlwhnhdO/4eTD5zs8EsSZC4wKsvDyBe?=
 =?us-ascii?Q?aS5v0liALkew6yj36EPYb69wRf2qr/HUj/Qj4yGXyCPYZB0zSvE7z0e5Aypr?=
 =?us-ascii?Q?TQcEBvJthPzKUr8QX2tcuuw/hw2RkanNN0KdQt5TRtQmhHK3rbVJIDzDKr/X?=
 =?us-ascii?Q?KAs98RpSKjbm4UCiUunmQUG78L+HulxfHC4F0zmEhBiKWldJHcXvlnnoFGnJ?=
 =?us-ascii?Q?EnRUDamUXOjVZ2YAukQRo376BBBDqQTG9mw9pOjAeTr2dKwZyWFAEwkarm23?=
 =?us-ascii?Q?ImpgfDiTJA5j3zD9Rfssr36kCoGLT+fS+37i8hWVlEoqEZ1T5USJQUd+J8YK?=
 =?us-ascii?Q?C4gtE9JAKpOC7nTWmjJ72gQCs2iNcXug9CDdsFUEQsNtwQbsRikdKAlyrWmK?=
 =?us-ascii?Q?LWZ/u5gIVUkwoLFeSBw34Cgqk2obkL58vlm22UgMj/H57ukVWceuXpRYukOK?=
 =?us-ascii?Q?cpNC1WRA7tVrZaOQm894rOEpX3MfAXrFxaCvE7T/ppSIY0I1JeHelZtIbW79?=
 =?us-ascii?Q?RfJb3NfXskP9t6Y47oU3IUojonyrHvMqUBxTpMWQW05qHy5wLRbXpLxBAPqz?=
 =?us-ascii?Q?YDTUFTEnSOtGfrPMrLbkfjy6jmD3icWT3vrxvgmKWyUXQrwlcaQcaHqcuCi4?=
 =?us-ascii?Q?3ePkqTM+q0pben+RuoJl8Bim1GYELS4NNHGvy54i6jBaZ5K4fSOh+CIR3Jkr?=
 =?us-ascii?Q?ILiAwqARpA6LoCq3JA5LZSD/wSjK6dURTey+3e/J7wprl1axUV9oalfoVjoh?=
 =?us-ascii?Q?CLfCXSMqZhNuJHtTluqPt2s7s96EzyBXV8vAICV9HrRMyNJ+rlWv+Ci8d4b1?=
 =?us-ascii?Q?lqhpNuEr0pt1Tz2kL3KoMeXubKL5SQ7G2YHq+I10imc2ktnhmeu+KZI6cWe9?=
 =?us-ascii?Q?7OL+oVscUBcHZQOZtXPKcMAnJNBvatZA/e+siAtVIrVgsLqy97+bpygyC2PH?=
 =?us-ascii?Q?Ra7fRlXURerlv2NyG5v+0bBX6wzIiXOc+uoImOjCnXJJx/YkZwbQ3YvLe57I?=
 =?us-ascii?Q?A5oJUaohRMO8d3LTlqyzFvH0fY1AieZfBagajDbMS+OxU5LrGnKE8kTk4/AI?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0dd5db-0220-42e4-3355-08dcb801963a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 23:26:53.5643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2WQl2INmn7ZAPBCxmmxKIHv2RsYLzGadkG4MU36htg02h889ffRhkBfRB0qfomaPje5D1/v7yvNQDJFBOPavQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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

On Thu, Aug 08, 2024 at 10:41:35AM -0700, Ashutosh Dixit wrote:
> Add input fence dependencies which will make OA configuration wait till
> these dependencies are met (till input fences signal).
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index ba8f2e9d95b7f..416e031ac454b 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -578,10 +578,10 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
>  }
>  
>  static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb,
> -			   struct dma_fence **fence)
> +			   bool add_deps, struct dma_fence **fence)

Bools are highly frowned upon [1] (one of many example of this). How
about passing in 'stream->num_syncs' or 0?

i.e. s/bool add_deps/u32 num_syncs/

Maybe even add stream->syncs as argument then too.

Matt

[1] https://patchwork.freedesktop.org/patch/607408/?series=135265&rev=6#comment_1103868

>  {
>  	struct xe_sched_job *job;
> -	int err = 0;
> +	int i, err = 0;
>  
>  	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
>  	job = xe_bb_create_job(stream->k_exec_q, bb);
> @@ -590,9 +590,23 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb,
>  		goto exit;
>  	}
>  
> +	if (add_deps) {
> +		for (i = 0; i < stream->num_syncs && !err; i++)
> +			err = xe_sync_entry_add_deps(&stream->syncs[i], job);
> +		if (err) {
> +			drm_dbg(&stream->oa->xe->drm, "xe_sync_entry_add_deps err %d\n", err);
> +			goto err_put_job;
> +		}
> +	}
> +
>  	xe_sched_job_arm(job);
>  	*fence = dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
> +
> +	return 0;
> +
> +err_put_job:
> +	xe_sched_job_put(job);
>  exit:
>  	return err;
>  }
> @@ -670,7 +684,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
>  
>  	xe_oa_store_flex(stream, lrc, bb, flex, count);
>  
> -	err = xe_oa_submit_bb(stream, bb, &fence);
> +	err = xe_oa_submit_bb(stream, bb, false, &fence);
>  	xe_bb_free(bb, fence);
>  	dma_fence_put(fence);
>  exit:
> @@ -691,7 +705,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>  
>  	write_cs_mi_lri(bb, reg_lri, 1);
>  
> -	err = xe_oa_submit_bb(stream, bb, &fence);
> +	err = xe_oa_submit_bb(stream, bb, false, &fence);
>  	xe_bb_free(bb, fence);
>  	dma_fence_put(fence);
>  exit:
> @@ -971,7 +985,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
>  		goto exit;
>  	}
>  
> -	err = xe_oa_submit_bb(stream, oa_bo->bb, &fence);
> +	err = xe_oa_submit_bb(stream, oa_bo->bb, true, &fence);
>  	if (err)
>  		goto exit;
>  
> -- 
> 2.41.0
> 
