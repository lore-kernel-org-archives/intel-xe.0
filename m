Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E94D5E399
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 03:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC3910E135;
	Sun, 10 Nov 2024 03:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EO+oqetz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC4210E135
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Nov 2024 03:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731210638; x=1762746638;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CHzBs0ECCgJqciud4EAfz+5S9YOUWFthpp3Oprxd1jA=;
 b=EO+oqetz8HG9GBCgaifnnIwWv0jaJw/0oVegM09YDA+SlZZJr7f2Y9hL
 Hz4mwpEcsxBYQQzbVdyyJRjetvnFu+Dh3Ec/vbo3q2zbXkuN+hebaVxIe
 gdy4ZV+s6FwV7iCiGxSBQqiLWbmPVYloaAvUVOZgMlRM74dveTjtNmqr/
 ooq6V5geGmnApy6Z4SUJUBGCIC/o7/YnZ02VxkXas2/VFFb0CFB9t0WiA
 dUh94ADH0OmL6NG4fZgGtfCe/yJ7LObcZUhJt/m1S0OHvga6UOrY5DB5B
 WgC5pZmfMB94Z2OkRtDsqTHbCKPT/sLZALE9lRX7iRAh+Rlzbi0G7OL7m A==;
X-CSE-ConnectionGUID: TYhBYV3UTBmgKDx/sbJkGw==
X-CSE-MsgGUID: /XtKO41ZQuGFQkMEbl9NUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30905229"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30905229"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 19:50:37 -0800
X-CSE-ConnectionGUID: mWeFpTeLQqS89LbrqAAvYA==
X-CSE-MsgGUID: H78G0lomSYWGM+Ir3TI8FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; d="scan'208";a="86624305"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2024 19:50:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 9 Nov 2024 19:50:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 9 Nov 2024 19:50:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 9 Nov 2024 19:50:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/v5UIJnwurV0Rv1xwfBtcXoVtMjBg1RLLDPy0nvZ7OK/eahVZKgv0xDg4SYjM2dsVCruG5gMfB7fz8tlpAHDsOAd6F2DtLf4E8ecXbp7/k2hv1zlvoHmTQo6XO0QaxT7nepSRgNsh6geIYZWV7PJ+KHl6wbg5DcOq1P+OjI+iy6PXT9fDr1/kTmAtVrY+GlY0tmAXNi+5qqZNGv38rUyEawtB3VIPmYoxvJTjamo14OS8jU46RNLkFh7Lm8upvB9tvK/j7pGbXHwi4FYJFnfbLdTSfLEnWdGRG3ESZHw2DIkjtxIRZ/2N1FaK/6c6AJktUxhhg1buPK195zEsFhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqmYStoGg+4KKzH0S8nW0nCgMFqQGjvwTXjhNPezig8=;
 b=AhpPMYljxJPaYwAI+QoaEXhjztkou6YxZd9ddNu5JCE4Axyxz1x91IR1akJgWmdyWPY9TGJzbm01WAAXyXquJcv3cvghSnqk86vLxtPk+VyeOiIeHY+77qs7LCj5YkYkxehhI7DHIfp4aEdlkI4WNwyhVWWSx1KLFdtBO5uxSfudYI9nqRF8yMKME+BTaN9TPCWXJ4gtLtQCs7Wmw8bPPxSdKLMflCft9b1B/dP57MurNEme++JDwn5pxJYrs53ctOq/gaf68gegtaSstxEfWTqaGRhdwDL8Lk5afdPZZOmdETew7u8Yz9yKzrDa0fAY1fa0ex+dKQM3x1rAO0fgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6501.namprd11.prod.outlook.com (2603:10b6:8:88::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.22; Sun, 10 Nov 2024 03:50:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8137.019; Sun, 10 Nov 2024
 03:50:28 +0000
Date: Sat, 9 Nov 2024 19:51:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4] drm/xe/ufence: Signal ufence faster when possible
Message-ID: <ZzAtpNKoOGusN0VW@lstrano-desk.jf.intel.com>
References: <20241018152958.1975994-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241018152958.1975994-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR03CA0330.namprd03.prod.outlook.com
 (2603:10b6:303:dd::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f4b417-4a7a-451f-61f1-08dd013ad0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hpUthygEpElNSWdlqMx+tzfwWP04bhw/eu3J4b0+hzwqO0/9ArGsAWpgXk/w?=
 =?us-ascii?Q?WQB+P2uwn+8nQHhYWwjoVmm6DABcjP5Rb0gjJqAICPUsBsIaggdtEQUK2jcH?=
 =?us-ascii?Q?icNI+hd8cFTHgAfpqP3wqtqZy7Gi9uVchoWUj0m7OUNY/FWme6L7dkhPX/9u?=
 =?us-ascii?Q?YRtWkfbh/tgLRUgtsLkzy+Qp6h9n3vUyvrGnj0QGONu4Hu+q3uGvQItmWCBN?=
 =?us-ascii?Q?rWv/jqTbGR7BCkhLsFe9P5PihCbkERyNpsTrbeJt7qH3wrMo1Ps0RHyZ/Y0G?=
 =?us-ascii?Q?DGipg8YMk/yfS+DSl/ZBsA5rjf3YrKpvPrZTdg4CrjnRSBlz4xgULv3FknlZ?=
 =?us-ascii?Q?V2+nbM15t3ktbbNhhVBmeOOJtfsb+O/6ZFvj7L0PwRhDx5xx3wmqHbQgyhHh?=
 =?us-ascii?Q?HJ+LgCSFoPj4Zy5st1ZSf6cSa9lXmF2V3J1u7jLQsYytFFfHx6vlPfDBZQm9?=
 =?us-ascii?Q?GRZohAC/CrIHrOimoMsted505V4CDOFBeFmnbQZSUEbmyUVTDXjgjm+k/efu?=
 =?us-ascii?Q?HYBhghcok5gNZ/HebzZRMODPVUkGy5OUVsCi+kMaEK9K9E71KKihNmMcudUS?=
 =?us-ascii?Q?PY7xjkdMeRYct0beuaeeI3QncqgVBeoVEwUrydLEcsryWvvX/hSt+f/mbWnT?=
 =?us-ascii?Q?CvCdb6JR9wPnaSaE655oIKh1wOFSANus5ISa6l9Eg7Q49h/Cq0MmbAh9LbRD?=
 =?us-ascii?Q?nWEYVD9j0eyFXCI9r63Bswj3SSzVvmglbSZhxACUSLFD+bX9vGnREPhiFnIx?=
 =?us-ascii?Q?TqL53sOV9jFkEH90ACQDP2+B0mqnWXbkftdNjVkJiVRpWVRpFp6OS/Ta5v4/?=
 =?us-ascii?Q?97BynWGshatJaNf2I1eklgC4cAequSb6e2a96O+4K+jRFw3dW9JE/Q9URbXr?=
 =?us-ascii?Q?uQGOImFRJ2rFEB7wqmV/82d/Ri61fSBjXGi5ERM5NXm2iOUxYUEZXG6eF5Ts?=
 =?us-ascii?Q?8xF2dkdwOotkrw3vzgBNwNz2bVqq3xfdwF47ibYwZNjtZu18TqQ/eqSbMExw?=
 =?us-ascii?Q?64KH19AhTK/NZvyOzjSkxBEqo4jOEaES3/m+2P70ZphaNJZYaAiWIZFmW6eo?=
 =?us-ascii?Q?dz/1BKTdM0pqc5uESFmFgtReLb7OAU/v1leWmsM7vM9LUtJ77BWpW8aCRHyE?=
 =?us-ascii?Q?g9OELpZlsGZ78IAWmWM/BtHsQ10/hMNKd//gTSB22DUYy17XP3Ii9Z1Br1U/?=
 =?us-ascii?Q?0AEySgsGxcfC4t4f8qV8vGvqz9q3yLd/1lcDcbr/9Jw0Hfmbje6Lhm/4FTwD?=
 =?us-ascii?Q?tgzZHAU1sqa67YxepMeg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KK1Hxz741e1NdB8QRMxNQGFJqBJec7Tfw2Wq63ch3c766ZEAi49ctPI4m4Pd?=
 =?us-ascii?Q?I74irpfyN4qa8YceiU7hNCR3g5NYMt1ifw7GePjAMpGXYBKnQBgnT9nZwoOa?=
 =?us-ascii?Q?lHRPC8i17mUJqILqnyLnIByjvf5ZGiV+MKuaYP7bwjKWWycsO5V7Jzms34/N?=
 =?us-ascii?Q?SJZq1F+ygONLYaKJRswJcKPs60wyXARA6MZ0c/uxmN5GMivAHmJlO8ivKvMS?=
 =?us-ascii?Q?FIQHq+VlTVwbmGfLPRhFUw8KTPaM4dL064A6tFc7lNAhfpFd1/x3SY1aDsk3?=
 =?us-ascii?Q?KNIO/huDrqtmYxxvvb4mDaIFldainHTyopLkzdHDkbZHOnhyzyBH2m6Pl2eN?=
 =?us-ascii?Q?+8/23WabIpKhsFFGVkSR58TBHQEwTX9EW70M9pHdpHhAdwvPmq4Zhn9jLebR?=
 =?us-ascii?Q?p5BhMMJvq+Uu8wi6Q9ZFTYcFBCTbVCNnv4+NdkrMfOiaRQmo2ZI9GNn7rulg?=
 =?us-ascii?Q?FlStwg7NYLrb8RVUesEtB92f1oZ2cbwCGxhpgUVIo3KpXhSZQ4b3l++qhaPl?=
 =?us-ascii?Q?pmLdTr/bak0W0IvFFKv4Oekod6bdMzsCZSvXxwPls2Nv5wW1KM7DrV03qj45?=
 =?us-ascii?Q?2OWT1m0bNDEgfgycblSvCpsCjGMBUvAx5mM2egrQji+IaxJsSNLgbCUtD+Ph?=
 =?us-ascii?Q?8dComhdu3DYxGqCTQWDiLfH5ZrYH4pFQr9bK+N0zD69L3n8J4tDYXf/j0KjE?=
 =?us-ascii?Q?Dc6EGpJYI97F4X1XMFbh6fXNkaujo3FpHzhomxFIEv/+rSPw485xwk7UFSoe?=
 =?us-ascii?Q?PAGX5SdrpzvPlojqzp0tioGPeLM8jF768XiWNAgUDeIBnh+9KWAI02u+01JB?=
 =?us-ascii?Q?ZxtQRo3CtyXuliFthNMs+ol5yHsAui6dEf9r8t8DdzFG0Ob+VsCK6hqScIPj?=
 =?us-ascii?Q?5l5rIy+UsA9e+x/ZgOyIpkm6DBcAIfn5aHQjXjBS+B0YSwp6ad30UyYO+z0Z?=
 =?us-ascii?Q?gkGn9Tuw3qGn/aoau76mWH1SCGV4zrT+vuehwXb0X3opjXypN5kL3ZMM8tRh?=
 =?us-ascii?Q?bm5gY8AH0t3vJs30A34g74xIy3y68p9tHMOF1syN4UDDzZOBwfq0fid2dQIz?=
 =?us-ascii?Q?evbcNEoxEYfLTSkiQjcMdOE8TOQVtPakQfTqdSOaNcvlXULCBPc9hWYXEfAk?=
 =?us-ascii?Q?x1d7C8A8D0fvUBMf/HuVfayFRf/F0CO6lonPTxRAe3/XjHQlhlfWPn+wtJGk?=
 =?us-ascii?Q?f8YzDfv2rWULWHMx4fewQItQs1aA0fI4wyG7vQNMSivTzFECz8e8QQ00KMtF?=
 =?us-ascii?Q?mshhGGcMnxqkuJWvcgf6EWczZMjfnsu8l8+PC08sMFPn6In2yqc1Y2+xWJ32?=
 =?us-ascii?Q?u6Gt0sUP8TIrgx4pFfHq7o4/h8V6V1IAoGWOANHa4ZciX32yhLMJzX9y22Ly?=
 =?us-ascii?Q?RETST+kFL1ESy8uEYnsEwpeplQOz9WIBj7UhyECpK2oUUweP0v8PDZVp8/ne?=
 =?us-ascii?Q?mkSa6W7hhsUWZCAaYnZlJYabSkQelJ91JUMCavx4TTJfNtUyFGFZXFfzj3on?=
 =?us-ascii?Q?GdmA7L7HJTGNuPPX8X74Ujxeib6Pg0Wi3W5JWTOJJx0Z9n0R4nMh+gXXEAPR?=
 =?us-ascii?Q?sL47TLui/C7ZGazEX/QRhJ5tcojpqCLIdbyKBeLyaN+ckyhskDnAkoimry7A?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f4b417-4a7a-451f-61f1-08dd013ad0f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2024 03:50:28.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/BN4IoJJ4TR+ev4ERoJjDQ1636HKEWDNP9GCF/ZR3c4aJYtfIpef78qmA5/tGEKBFYmIZdDzDzlnwIo7Dr41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6501
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

On Fri, Oct 18, 2024 at 05:29:58PM +0200, Nirmoy Das wrote:
> When the backing fence is already signaled, the ufence can be
> immediately signaled without queuing in the ordered work queue.
> This should also reduce load from the xe ordered_wq and won't
> block signaling a ufence which doesn't require any serialization.
> 
> v2: fix system_wq typo
> v3: signal immediately instead of queuing in system_wq (Matt B)
> v4: revert back to v2 of using workqueue because of locking issue
>     and remote viewing a different mm struct.
>     Use Xe's unordered_wq which should be less congested than global
>     one.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index a90480c6aecf..7a1558c7ce09 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -92,18 +92,27 @@ static void user_fence_worker(struct work_struct *w)
>  	user_fence_put(ufence);
>  }
>  
> -static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
> +static void kick_ufence_ordered(struct xe_user_fence *ufence,
> +				struct dma_fence *fence)
>  {
>  	INIT_WORK(&ufence->worker, user_fence_worker);
>  	queue_work(ufence->xe->ordered_wq, &ufence->worker);
>  	dma_fence_put(fence);
>  }
>  
> +static void kick_ufence_unordered(struct xe_user_fence *ufence,
> +				  struct dma_fence *fence)
> +{
> +	INIT_WORK(&ufence->worker, user_fence_worker);
> +	queue_work(ufence->xe->unordered_wq, &ufence->worker);

This doesn't work, if this has been merged it needs to be reverted.

Consider the case when a user requests two user fence writes to same
address in the fashion of a seqno (i.e. 2nd write is one more the value
of the first). If we use an unordered work queue, the 2nd write could
pass the first resulting in the seqno being incorrect.

Matt

> +	dma_fence_put(fence);
> +}
> +
>  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  {
>  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
>  
> -	kick_ufence(ufence, fence);
> +	kick_ufence_ordered(ufence, fence);
>  }
>  
>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> @@ -239,7 +248,16 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
>  					     user_fence_cb);
>  		if (err == -ENOENT) {
> -			kick_ufence(sync->ufence, fence);
> +			/*
> +			 * use unordered_wq to schedule it faster and to keep
> +			 * the ordered_wq less loaded as serialization is not
> +			 * needed for when the fence is already signaled.
> +			 *
> +			 * This needs to be done with a wq here to avoid locking
> +			 * issue when a ufence addr is backed by a bo and also
> +			 * tsk->mm needs to null to call kthread_use_mm().
> +			 */
> +			kick_ufence_unordered(sync->ufence, fence);
>  		} else if (err) {
>  			XE_WARN_ON("failed to add user fence");
>  			user_fence_put(sync->ufence);
> -- 
> 2.46.0
> 
