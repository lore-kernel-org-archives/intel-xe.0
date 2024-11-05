Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58788D3610E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 19:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4D410E428;
	Tue,  5 Nov 2024 19:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiOlhwSG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE03210E428
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730835024; x=1762371024;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SCjeIVKsJxkZv6aEMc5Vt6WarU7hA/RYqa4BCPDljBg=;
 b=DiOlhwSG5504ssXX5/zrd53G0SGe8HdP+KmzWo3Pp9qYRhWKHSFZk9Vs
 aUXlKP7SDpoKfFhDjqvt0BwzuNvagDwsOsh8xJKzUhvm2GOrHMrOgZrrv
 j8JUq5RPoTn1rfMIgnq2joGTw5WUpvgYlrYp8/m+GB/BhAoBwGss89j2u
 HcT4TRUm9E44Ji1bJOnJ2Gcgo8r7ay6GmS6EcDa5P6PDV7PZeu2pU+MxN
 L2hPNOOweOxc9eHSRRyHgGLOLIWheExB3EyCZLlCu+YA3HiLPFGCB+Ep+
 gnyz9cTe8R+9RsrVtrx0Rp868aUHU3zDEIAmmJdVd8u5J3Ae/2OSKmdpW A==;
X-CSE-ConnectionGUID: 5J4MQTjfSvKAFaT4nrVlNQ==
X-CSE-MsgGUID: U3hKe9scRza+mZ2VcQ6NqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30777875"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30777875"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 11:30:24 -0800
X-CSE-ConnectionGUID: 8a/2aSjhT7CofuiXUtPlyQ==
X-CSE-MsgGUID: 9Lahu543QhyQVDqCCYkY2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="88090989"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 11:30:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 11:30:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 11:30:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 11:30:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpmAmcFBAO7pqss8BuHpXtEojXLKKdOR5VJ0xpmGZXZ5J8tgbBPTP5JFB0w1vuYQnB4cSOk02Y2M6Qm/7mlmfzdOr/J1noX3zFhxZrfb3V+PTdZsCeRxkcaBjTpVI1OEMkSFcrOav5w+eTRvVJKoupIMa6iMVrs540gp79btxE9GVkeRIeMkocMyD4ZAA9WL5HRpoxvtS3LrqTWa5eiddEjrMq7bYYCVowYT5npU4Wdhtioa92oFV0QrNudMvLqsGsMA9tQnHle1ZwnrdUqm9cv8ViWBMLpUdExHGf3kRKJwfyvrKPYXteFwfVrbdzYLRsBbk5kkXX/O418uaVwyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdxjSFb7U/I4aruHdCqwo4SoIEFGVdmbZVoWy/T6SA8=;
 b=aJ5g5jC5ZZWOHtEm9eyBnTLs6DZZzv5s6jF3A2y/6EHSY8ID0YwgyIfAeXVzLrILRM4AAsy8gkz3TLBRJ4JoEDtmC9r8EKQTlf7kAaOfRuluhG059ZXt2cBLIsCxLt4GjOHBkRdQTsxjm7gtLLE+IuoydO4puL8kcYah6h4OreQCEfcnjQ5537Dr4/gttz8CKT2IL80+ClfvIvNlDbIykqgTSbXn8y5Y9jMaUIsNU01FimM80udZ/KbwKxIlSMQVaPKnpRLoRtrPBgOPpnp9lK0i6gfZICQr9WIqU3tJ3hCf5kPEo/9ywKgOunHzEQAHFVjX7IwSlrWTva5YjMZTZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 19:30:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 19:30:13 +0000
Date: Tue, 5 Nov 2024 11:30:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe/guc: Log content of the failed G2H message
Message-ID: <ZypyZAL5m5auJBLw@lstrano-desk.jf.intel.com>
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
 <20241105173032.1947-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105173032.1947-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9ff371-5f4b-40d6-25b3-08dcfdd044e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D1olJRmMJaQlDyBNT3HJym0zNEeu3U7oueR+qBiR3oy0BQBC0BaQlH60d5s9?=
 =?us-ascii?Q?0UzY0PElGheM3ewlbgQh1vDKCRLpRyJubxSpljopod5JjAEXEavdRc9tYTHu?=
 =?us-ascii?Q?kJLi8O+2579ZhuPZh3z3HG/xqA+I2tLY5zZQR+Au8xSvj9Qqm0Sf06RR8LL6?=
 =?us-ascii?Q?Xa+f4FPh4req/nVKJ9EAkxSFirqi1YR5h02i/v4eTPGZxt50gLnuDQT5zaqu?=
 =?us-ascii?Q?xZIjyrjQWRflzv7av2qMXevL509YhM5pV/z7ZvEGRlYZ5ojX4V+ir64gzqNb?=
 =?us-ascii?Q?6IrAlae/fqM2sDnJ+wD0Ygf1tPXn7Rp4ieLhCMk61YtORi5URX0zLD98cR6Z?=
 =?us-ascii?Q?JVYMGssQ7TOVq/PUws/ZhOJc/eNwhe0zDsDFb8MexMcdknmHErv8//1Vf3fP?=
 =?us-ascii?Q?PN3vKTZazmeHtzp/1092pxWZrVuYe8gZZiyb++hogtEEqtf/0J9gfyiPOi78?=
 =?us-ascii?Q?FoqADyaTCWRLRwvPazqrEhT+zJz2WdDMCI1m7i3FaShxuVyOGaLxFdyiLdZ6?=
 =?us-ascii?Q?EClEmHWWf7qZO64Z5gz478/peI8MtVxJrdoJpU/HyiwgdyARkrzAxkVATRaT?=
 =?us-ascii?Q?gcc/cjiSrSNAc13Mn7GyqaOts8x6qutFjXF7ALnV7HNfNk4JPg0kLwe2BPPJ?=
 =?us-ascii?Q?i7JOoG011LYHDnkBEspF4gZt9B9WXKA51BpnTElz9h0qBrS5lGmtCSPHBlg4?=
 =?us-ascii?Q?EvT7oumC38gA5KKolOab/WlpGxWyZQ4AKDjNcqrYU83+ZcYeIPO46FA4ix2v?=
 =?us-ascii?Q?wH8+eD2eumlvEau+u/zEUSaGGP/UyNKHxMn5FWg9TsFs2ZmOyDWDF1N+BrO4?=
 =?us-ascii?Q?2yLf08Dvbrfbj3bqApb10T7m2JS1+LKu9fj9E0rN3bynrySOc2IhdGC/Duf/?=
 =?us-ascii?Q?OxGfgbqpqZcnSeJiCIAqRw4jxWnjXgSH1XAKX/EQpY2vuzabHr9wFQW9SQx2?=
 =?us-ascii?Q?DoR5MY3yNTf9bEbyK/NwbdnEhiMPEApn1C0tJZK8LHRKmp1vTBGJRRqM6yZ/?=
 =?us-ascii?Q?6FkEX96L9NS+BWLiP6El/qmChQdnahOuo7XoxLZ56V/LGhF6LO1+X3V2kMeW?=
 =?us-ascii?Q?clRcpfVZgy57Uq0x4uu8QOKgPWpY69w0IMECaVOOBQyTbBTYxc7Q8nnEQKbC?=
 =?us-ascii?Q?g7p1WEJBx6WyNOoTfJbc+rsIncCrVX1PegF7KBtoBw4e7Rudbbapde1bA9CH?=
 =?us-ascii?Q?nuvD2wiDCxqiSGo98L3VvoY7O1+JriP3MV4RQokkoc1mY6S+zzr0Sj0JjWaZ?=
 =?us-ascii?Q?NWhuEUPrSiNG+oZmWnVImB15R96AaI25DnAFIMxRNaadt1AnTeKC1Lxalgyv?=
 =?us-ascii?Q?WdMdEAfKi9KlIbtjnHZHkHSA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LjpnM69K43/TxzCNBVtd8DI4FlVoG4cTFtzPev7uiziy3qSp8LcGxWEBIbY/?=
 =?us-ascii?Q?hzvBejo7+wGJcy5YA6w7lIg7XPU2brZyJkx3vEJhZZAw8KcohE74vX4vKPXM?=
 =?us-ascii?Q?UdFYgTbyLbjiL/4BnwDgO+PlUW7EBOA44Xi6fnbFcXFGvnMnvnFhJfP7a6Bz?=
 =?us-ascii?Q?oLLDjSLgBd0uYqFPhM6SbPhh8ZjyJ+vWx2XY3ReVZ7PA8go57xe2Ah/VpT9Z?=
 =?us-ascii?Q?1dxkPG5Bfve8YuTjN5O7nFtz/zqWQjbbCutsSQdpqlRJm1ka0pfeH74Euq+E?=
 =?us-ascii?Q?oinxyPRWupQ/0Am+ROU2FKeq8rU0Bw3/M7vyHlOk5Q3vIYbwgnC5JWQmCzHI?=
 =?us-ascii?Q?eL64m4bNAkyCvn4aA7K1MTfTrvtLEfPj8y5gROMJMHFEqdrRIrXl58m4RpF3?=
 =?us-ascii?Q?QuASvXys3kcwePY2Pxp9JCrWCEouLBX/ZSwr7lNOVRyRN3KlYYLk2PQjMTxf?=
 =?us-ascii?Q?57BlZvFN20hcCIoKQ89yP1aa7LM65899XiyKW5e0KHfDwPP+Y4nFpojQS3VM?=
 =?us-ascii?Q?1A8J+jkjuduyOhxzly0JmDsUO8gAnBheSlllbfk6JaQKo/nCyLj31kU6ULel?=
 =?us-ascii?Q?0FcmD+H6badSTq21nEGFIZNEInqJGKa7TSkTLCR/iYSCALBBWV1pP+itSyjE?=
 =?us-ascii?Q?zjUzQjHjX3OAEsykOsKiOeqRP9GyzHmCdpU03gBodZ14ezIORvoZVeaog4Ow?=
 =?us-ascii?Q?EyoR9y1RHn/JoiLgWcmQ3yYAQSiwBEXMq8E9UryubVoU5JdPnkbL5EhAIOtG?=
 =?us-ascii?Q?Z4tqwoexS9Sr86uL1oVMY6FjyztbCasaRFvAF1Yuj/MKT4n5D9xA74lZc/dl?=
 =?us-ascii?Q?MNQx39CkFfCWnfbtXbZ1HI5g0VPNnQc43Y9118onEatCgFZpEkD4/GCUlgZe?=
 =?us-ascii?Q?CQDwWWXWmIeklQnpVKIFVJA7nz6GQjK5lLsVhbqa0oSD3eb13bhxwfW+VhAp?=
 =?us-ascii?Q?IGodGHXuNWPKchHfaI9S/Q2Ngz/u7ecKCnrpfi1uUxGiGO7MlE7SpwsDN8gv?=
 =?us-ascii?Q?2yyMwUsdSp/RPud8lKSmI07Pzsq1AFsDXAU9aEdNcXrZdJCRzxIpdVu6W5TY?=
 =?us-ascii?Q?NK8XrcC49l4fVpKOabgFb2Au1hnE4iK05Q5K37ycKRFkiEYLCyQm3Q74Hv46?=
 =?us-ascii?Q?I7qwxoPZrS88AaCXeqahGBxNHWX4JQHm3HuiNp3bMWIkmXYhDX2MShnqR5Vt?=
 =?us-ascii?Q?8GOqqYTdRQwDmd/DAbfORN+MlQQAFNFjGp7/qXXyT2NLnss+5tg5BXUvBl9x?=
 =?us-ascii?Q?Ew5Dx7VfM6qFXDeSmfufSKbhZDJEX0yPH8fQtknZpnVKFQSdCXqugGBSD7HI?=
 =?us-ascii?Q?PNoKQDmeVXTi/DF7soH3mpowQmGv1LCJNZ5HgwZ87okYOiFDfoXOvXvr3r8n?=
 =?us-ascii?Q?PvVcMjH8b8z1qT5B9m6/NTNRFc745CHZnFSgGc4fPSdeSsTRGSo8aKPnJ7Fq?=
 =?us-ascii?Q?NSN77KNpLMRfab7CGS04bocQF9HZ5trdD59KEnbyPV9i26iqo8Z/RWnEtT7s?=
 =?us-ascii?Q?mC/4jstwQaCIh2pkIs7wg6iyh9LQ+lrOhzQbpKH56k8patIHx91kBNv+zBDi?=
 =?us-ascii?Q?YFBIrqmWzcPTsh3loNIJbal+2jAHPPp9lb9vwedL+lXVZdr7IdQGOJgG59PP?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9ff371-5f4b-40d6-25b3-08dcfdd044e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:30:13.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kw7jt62UOm/rIpqnUAiEYrLvTXpOvnTG3wUYVvAGoCOZ/Foq/oQAHd7FlJ1uAZGnwhMVAxBhbAxQ+ktzHg4HVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

On Tue, Nov 05, 2024 at 06:30:29PM +0100, Michal Wajdeczko wrote:
> We are already logging an error once we failed to process a G2H
> message, but then it's quite hard to extract the content of the
> broken G2H message from the captured snapshot. Extend our error
> log with the raw hexdump of the G2H message.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 550eeed43903..63bd91963eb1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1299,8 +1299,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	}
>  
>  	if (ret) {
> -		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
> -			  action, ERR_PTR(ret));
> +		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
> +			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>  		CT_DEAD(ct, NULL, PROCESS_FAILED);
>  	}
>  
> -- 
> 2.43.0
> 
