Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90AAC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 14:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8642E10E78B;
	Fri, 16 Aug 2024 14:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HII+SdhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B451610E78B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723816854; x=1755352854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9morrfzu7qIK+p2RJ25kvnZdRgqvS7I1AjfTyY0rjH8=;
 b=HII+SdhSCQIx47laYP5w21jg23oeJZvRHzuA8+ZR4/+lOm4PQi3B7kgb
 KiKcmKt9hYapXtAZWlGhhBUOOCFTsLJM5o+EH0TeQBFc1ONnwX+9TvHyP
 o3Dh7S56g0BT0Xgyrv9H4Z6ezAlfQa+wxpEBgDDSWSL2PLquAerEC4uCt
 ek3lMTCVsOOnqVHI2rL7yRmMYnG5Y/L9OeXvl8rxloJ/dP6clT+FNPSeC
 K66PeNI4BE50fKhnjb/+O+2b0BeLzOpGTYmm19D8wjpDmntKZmvTfUcLC
 NgS0eDr3qnkHgbvhpRDsiTePlqq/7jJOOjQ/sJSYl2FqN3zbHSiOxRfUD g==;
X-CSE-ConnectionGUID: UXTwLws6SguRTURxUFq/hw==
X-CSE-MsgGUID: w/9eqd7DSq2sleEVcJl7nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="47515510"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="47515510"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:00:54 -0700
X-CSE-ConnectionGUID: PeSZHTtsSkmLSITxzG0ktg==
X-CSE-MsgGUID: WKpaFX5gQ7+y7kk4yiG0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="90458244"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 07:00:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 07:00:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 07:00:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 07:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/1Mcn0VUQQV3HAQD9pCkJpTqbIEM6/w3HQDiiOA+s0YulsEUJWfnq+6fSXDLDTVKGl7Ew+DVGHmw4qohu//TROctMjoa37DOi/SFR0XH7iwj+YJS09CYf9ZHVpsifWxVif8yF2CfPx514UJ8PbuaI/1y/dp2++AlerKRkBQA8V+JZ1uxMzP4JawpDgkqZ8MjE7TJcpTnY7THZf9J3WbTCTGAbLlLznHtIFXuXgCftKJn8J7LuJMcg8LQ2xmmHTIzbRIJgo8I0Hrg4qQfxBrH+mvlEd1thL6VZJGo9CocH4+SvP2m1aVOqxY7ZgWq/+LbY3cQ7u4BXgHugA42BhQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P98/RZRpvgZJ8Vi8fFU4pbT2gXK4wL7YkESbCj7HNoo=;
 b=HUDFLdXEpoMEDVVVhusnjBs7BPFN4tmTjQIA033vOaoet+sXTeEU+qrquy05gvwEnUhnNDjMEHFeL6YrEP574v1sVtcGgmi6/ew9rIWNIIvZi/cZ7EbZZR2ls9hkmzrJ+NATPcRPKB/IfwBbE1R5nzOYR9psncKUbKskhALup45jb55IrWCo21CbE1G50WD8+bgQ0zB8OdBWfzxJLZiRMsi/7zt7uuR4sQCTCdomQiUUHk4Z94gng+oJ4fXH/OUMk2Dq6XnjSrP1m5ZkIDJUdpet2GaZAHyDna72vW01UWbTaj3dShZGBqyFP18uHcF4zRoooiMCP1xjT5xRP9uEAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 14:00:48 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 14:00:48 +0000
Date: Fri, 16 Aug 2024 10:00:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <apoorva.singh@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
Message-ID: <Zr9bjsY8zcnciW0M@intel.com>
References: <20240816080355.897256-1-apoorva.singh@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240816080355.897256-1-apoorva.singh@intel.com>
X-ClientProxiedBy: BYAPR02CA0040.namprd02.prod.outlook.com
 (2603:10b6:a03:54::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: e7333d3d-308b-4335-4153-08dcbdfbd4d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ne1R2fsBymLAeDaG0I0/NNzUP6uRfPSrIpZVRBSGc4LR1xpU7qVniC0oHmh1?=
 =?us-ascii?Q?fM83g/V6VogmWI85tPnbjnbpcxqJLCib+e2DyuldoNxOZuzUITwDxDwbGiT3?=
 =?us-ascii?Q?YSmiOBzvc/i3dHPBkyLUBz3VKy7oCd0y8TIjawIW6+0h8vDgwVs7nQQHN0i8?=
 =?us-ascii?Q?2tXdUQ3GR6sIu/rDPx3s07fg/U2EGJm5nST82biRTIcF1S3eFl8J8nTo6uiz?=
 =?us-ascii?Q?hFmbFo8w6fiUgKq2lOpvRGaSYTTyA741cW/RMyoP/lO71eTnDfPds7RTNDPS?=
 =?us-ascii?Q?vwLkKAty2mHxsFAcyCwFwDi9GdWKkYH5LcyRXzeaRjxNHqmr5gvGuNNHgegD?=
 =?us-ascii?Q?MzSmik56sjaeu54ReX6zqhoLzTmP9vznmn3gAtY1UoheECG/antR9DuoCUoI?=
 =?us-ascii?Q?4OYrEU7fHr1aj5Tcgu4Wo4f58Uv2kM8jRxCCSd64MMxzmKhsSlvMILKCwFpP?=
 =?us-ascii?Q?f5X2hC5/7mrnWe2t3BJbwdSpwbdgRrGBaCGVHCdq+VpiojOpeIEb/1ZcutYW?=
 =?us-ascii?Q?7/MbRa+redKqkefKaojLYwQg1Eb8bxrHps578c5yoplk3XJKth4j8G1J7vlg?=
 =?us-ascii?Q?rdqm14SysAMxDATnAuGSukx4eyQD2gA07m6ZPzE8T5+bBKjNVjjiuVVHtwgB?=
 =?us-ascii?Q?2f0C7/gVU9abvyqLqft/kcoai9cK/ydbTd2RrH06E1xR6HliyaV/e57SgqDN?=
 =?us-ascii?Q?JDxrwqqMj7QKbiaAgE8K3D7jjYWNDLAWtu+dWZx7kvHuGSh7J4T+8JXX4y3R?=
 =?us-ascii?Q?qKYYFDjS8Mbu3FQEcWzeHEqQpQsNSnWlI4xrk4mA3f+6qKzVxXaYHuDFOdN6?=
 =?us-ascii?Q?CNXiWQ14A/QjeeGkd1sSDbiEHDEVKX+CTh9ahKTuDGZTfIrLSjvDG07v+O2X?=
 =?us-ascii?Q?zYp8BfHV2kEHIxkXFaqTx5ONEjbR8mkO0P7KII785EtKc7Jxocm2mQDVj+RL?=
 =?us-ascii?Q?O6rV+/ljCcrYtqAo6GnqERM7LVnlO5ATFPSlpmZ/fiuXDvJ/k70b4Hs9CmYv?=
 =?us-ascii?Q?C1YSZT11wHeQeW6eA0lkJqyJ1N/tsTuvHgiOMwmIF1mdQKqYc6G1wIHKH0eP?=
 =?us-ascii?Q?9yok6yYgfDLApYhSmK0IOoinIDAz6shD2eNg7VRfu9b0ouNYhF6BjkqHP3Wy?=
 =?us-ascii?Q?48kHy3NPDW0kqEsVNnKgIclv592n1QBBP/haRwPYUYbjjnVrgTyOFoiMVksW?=
 =?us-ascii?Q?XTM+hpCCJXHvVh9laXr4FGvtvBVz1HHHGVt3s//zAsosbMp3dl8yQGqaVd+J?=
 =?us-ascii?Q?z/OUv4it6obJyDzpCn8stsdCXhXnmsuFvbypMurrXdsSC1S3DeQCteFZ0Ulp?=
 =?us-ascii?Q?3anMQ8iObdYsIiMyrcTv29O7JlaQu2uk5HDZZzsAHaxEEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xAi9XqArSGYoBnwN+GfpaRwLVx2IQhQfU479+wQ/tCaGY4M9AzNnhssH6l4G?=
 =?us-ascii?Q?7e7+BfZYvqNtXZYTED1yoVepb+L3Z2JtjTlUSZfNRZSYVhqYoPxNAzhXQ8ZS?=
 =?us-ascii?Q?BG/4VTZgHSkEpXEmm8tUlZEzeqMMErB5exCcWZR1ZUVCxlofiBCBYHm535HC?=
 =?us-ascii?Q?J/Ek0j1nVHH9kacN+LjORjMNbHuqBlQf5N/Gw8AHoiabU/+jGzW8o4CHboew?=
 =?us-ascii?Q?Lb3DIOFC6hKdKhEeg/fsgjmZNEI74bJ6FUMUJoypTgA45tq0J+vdd87m9HCz?=
 =?us-ascii?Q?DsfsybTAG96xE5P/gVUOPgyiKCr6HIOZQuKJYGuxjL8AhUxllWRO+qecB6c0?=
 =?us-ascii?Q?2l/iFFPT4VpCRspQfu+ek+hFJtoomLxf9UIJtBdDIV9Fa5G8sxQoj+GLn33S?=
 =?us-ascii?Q?WkePc+xZcwbQaM/PWd5l7BmyJWWuJplMZM029527M+aFe3CqQyxyRFJL6FmG?=
 =?us-ascii?Q?VJZ0aaPo1CKyWb27vVF8RBjEPfDyahG1ntPU9YENWuR6fnQgTMy/i0g+MElQ?=
 =?us-ascii?Q?GHIaG0miThCvcxMBCIz6ldKabI3xRDnvMONbymH4996xjOTm5yp1jIruQLed?=
 =?us-ascii?Q?ZVb1uxix4bl/P431rZ2p8c5gx0qX7uYeBcYdkadGbDDpQNSj2xaSMVDY9kzY?=
 =?us-ascii?Q?4uRIOBjaUFK3jmHGy/Z292Y2yd+IVFGGrUThuMlfJwPny1XJs8Hcz9Nw9ZD4?=
 =?us-ascii?Q?8bmN6DZ5yWFkpAx/pRNVvmoJO0TQ2ShhQkduexdoUKGMqbNH2d/WTrPWw41N?=
 =?us-ascii?Q?2qnMBVmsDTzfx+ud1/+W4u78YmITCkiYUtzclqTI2QHRJOHi8qpwvbOfTWbT?=
 =?us-ascii?Q?AHcRr06K220j1iI7qki4EGGcH0O5PJzL52q7WoYox7V1DZmvoAIxMo4OUfyK?=
 =?us-ascii?Q?bvEjE/hKmMI/nKKPrPrpo7NG0DhG19f5qAHRB2UCLLV7XSes6xI+RTwAURnc?=
 =?us-ascii?Q?nFhrreIeazgsij18iNiIXhlGR0mea5HE/FUmAHSAjraCNBtc+qHvX9s28OdR?=
 =?us-ascii?Q?3jHi0DzKYUO/VdJ9zunDQvgZxGE3T8hu6UJ357REQ10N6mldPjUSX+wre1OH?=
 =?us-ascii?Q?tou7PbTWDtAnc0Xnqx8zYheBqbHLnEy/A/Cak+uw07v+802Nrj62enC67Jv5?=
 =?us-ascii?Q?xWTA5suQX9k/Gjko9PnoAJWiQCrGKF9QyBqNJUWaPBUcO8y5N/0AHQfYGU4d?=
 =?us-ascii?Q?QnqtOGlDNZJMa8VY4mqLBsLtPPH3zVLZGwIkoIdmUW1uNjxWJGXcmpnA/1mw?=
 =?us-ascii?Q?3yr1p/QQDQedIwzhbq9j6Np7fkqmt1NlOgTR5qO5U3wZcknmEFb87cYIg6Xg?=
 =?us-ascii?Q?wuiIjOv+8J5/LEP0xCneyu78C/4a6xHG8pwpETgLdPBoLlrzavsj+JW5OQg4?=
 =?us-ascii?Q?ux19bPptdWE8e95YYu3Wo5VTdi+dVLW4TKW5GX6b9qjN67kpytsexg2JMglS?=
 =?us-ascii?Q?D84vXkX8MruPlYqycnA+jJzd955G8Su+PPd8POukM8TC84UTUMCPdvg6ESvG?=
 =?us-ascii?Q?XW6cPuKqZJLtGcREDxgRkHOQjj2s9Zhvh8dl5Wl6n5bVHXAx1Q2V1r7MiqSS?=
 =?us-ascii?Q?3R1l5q4Sx/7LCeeLLfI4DovWlhfdxLcP3Pnhbzfx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7333d3d-308b-4335-4153-08dcbdfbd4d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 14:00:48.7724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUSjxEafe3fJYaHIILZt6RFZ3sZdWmy46EErF5oDjkqEXQ+lZ6uG1BMKOHbKVlZ9N2/BZq9R115D0RVYhyAzQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
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

On Fri, Aug 16, 2024 at 01:33:55PM +0530, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>
> 
> - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
>   its already been taken care of in xe_lrc_init().

I'm afraid this is not a good reason.
This snapshot capture is coming from other places and apparently
with risks of paths where bo was already freed?!

why is this check bothering you so much?

> 
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 974a9cd8c379..aec7db39c061 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (!snapshot)
>  		return NULL;
>  
> -	if (lrc->bo && lrc->bo->vm)
> +	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>  
>  	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> -- 
> 2.34.1
> 
