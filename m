Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE920CFC527
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 09:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B581F10E3F9;
	Mon, 14 Oct 2024 09:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XO2x8fqy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62A910E3F9
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728898037; x=1760434037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2QULs/8CtgGYeDEEG4QxpDcrriEnflPfjhjWGJ48his=;
 b=XO2x8fqy2yt66bIgX94b6RUeOEVUJX/Mt8Oq0Jff3O/Uh42ZIiWf7XeQ
 HMoF8f8yPwsoi8fmQUyOnKt48bvji6hIGjcQVTh80naVYqVxgDxVW4vvN
 F1j7HHAddpDwcc9wtC35YsGeopynsi9cvhDzTDmET/3vi3LOzTwnG6z0a
 bw3nU46bdNDhQ/PnOx7ydXp1VWmtcztm91S4DmTr4prQQbqa0ZoHWBldF
 20rURYUceOx/s8LJGE5TxaPW8h2GXLC75YZ7ORatXMYYEPhA6Ziwob4VV
 QoRTF57kW9eX59tFpFl0OGB70EYmiLfwHFCZW/a/hQ8JoHhG4gHwgThvp w==;
X-CSE-ConnectionGUID: ZQFrwTBKTPmbasB9/rat3g==
X-CSE-MsgGUID: CeS89LOtRv6/XU9uSJ/XpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28364066"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="28364066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 02:27:17 -0700
X-CSE-ConnectionGUID: yuuNvWouTG+DNuIOaNPkaw==
X-CSE-MsgGUID: FtIvETnLRfmroeDNLGPNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="114967597"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 02:27:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 02:27:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 02:27:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 02:27:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 02:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTf0We0qiUEPdPI4sVLi9Ney0qHEXtmsYjY/bEuvzojR9YQz+2MwDL1EhbQEA/iYPPgZBcsAyYJLrIzT7b8Csv0BxxdqI4WUl0uYiiqL/7cmBMDjsquHukU03THnw1XU6tqfdZsV196VOu9kOYZGmG7lMxgwze0KeDwSBLZWC5TcAjcKgfA8kqQlNK9z8Jv4fSYQ3cHQj9Y7MrubF3maFoDTfMugTnLdG+PkhCPHhAkHywDVxYtdKeTt0yRHnhdT0NRycrMaFiNjwlyiqMLH7i/YrTTEF9lYlfZOO4tvwfY643PT05FBJ48esCbGZE9o5062wZy0ClZY8NmZNq2q8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsltxjEJ8DouJcMY1HL/nyjRgyJqTGZpy8AWhvw7fLQ=;
 b=qQI7meuWcFjGHCQevK3RbTe4U8cfyk2S1zgy/wjTNVGumOFO2bq6dT+dxUxSXaZDDeAvYlShMbPSa4mPs/9HmbhTnZnbgJQl9DC84oLWnssosmvoWnlFLTvL2cJcYIy2VUCqEl3OfN3BLQYFtISFKYKFce0uhvoW0OkaI8U4Xf6AEQCDru/vjfX9EQdu43mhaVK7EFK4NYXcTZ8wPRLxvyyFOnmqNQ7eAlLebKFu02O/E63OB0JkKZZ9tp9uza2L8H6qTRtwJksM9fEBgcI+DfmVWNiaTSb0n2zWJHGkb5YCxocLDAWpauC1WiijaERaeZsKnG+v9H9fhcnNyeTeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 09:27:14 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:27:14 +0000
Date: Mon, 14 Oct 2024 11:27:07 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
Message-ID: <Zwzj4N466Z3uZryR@fdugast-desk>
References: <20241011115715.3486872-1-nirmoy.das@intel.com>
 <20241011115715.3486872-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241011115715.3486872-2-nirmoy.das@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR06CA0039.eurprd06.prod.outlook.com
 (2603:10a6:10:120::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: bb04f6ec-7c1f-4064-8b9b-08dcec326375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tcAZxNIegGB2V5kHmCcWCJc3TK3kDaeKFBXrw7izYaINjZ5JKiDj4E01i2dD?=
 =?us-ascii?Q?CXm9A/fxAVogcXPfEKj5CGHCGG1Yi1B7O1NTW5EX44qxzrXI+lfGrNmKBNt2?=
 =?us-ascii?Q?tGvfmTxj1VEXKiDenw79nKQfh5uqmMR82KPxMv6S8ADg+ginMy/2XiMNZ6yk?=
 =?us-ascii?Q?MZ6ItlLCmZ7NWijPBN+9ZGRrJHnSkhvQsOJNi//3oMcKCPmYsRRN/3dOnzjc?=
 =?us-ascii?Q?ocDBlnbM5AYtT5e5ZYVQ4BNZCsr00R5ZAHdzp5Y5IHeonrugHHFf/bVewi4J?=
 =?us-ascii?Q?nST+Ny9qg+tBDZ2bHfsud5Xv+rL3Uqp5AbYDk42XlRP/5IQBRCL2ehg1MTQN?=
 =?us-ascii?Q?CAW8w0Rj26Qi1DCM2gawh9xUW3ifwJlOFCnky1xpELIoHLMC/K3YVo7gh29Y?=
 =?us-ascii?Q?FEhudwLUrylApzIyOtAvjL7lOC17Xw/xEFgkCaJirTgduiuBtCn9l4o7EHPg?=
 =?us-ascii?Q?LppctUfe6FGHNAGuKVdz0JvdupfQKau7oPRiq11ikKqYObXYU7NPVaxhtXI9?=
 =?us-ascii?Q?6Z3VPkqnYxuEJMRwfPA8LLOQPc4TcuD9hBAgphHR4oEKUgqwTwLpzSeps+cA?=
 =?us-ascii?Q?pXzJO7ScQkTXYpEZAWxqNWs5xMDDcZ7/qbKLKOJYcpKtxJFedSJ9sTOZbz5G?=
 =?us-ascii?Q?JI99RcuVkS4Ic3zO05O1FnKCL1ZO+spnOqj5BqO+4EpiR+Lw3bNukRRTGcRw?=
 =?us-ascii?Q?bhMyAwapC8q3QEEavAwzAEb/BnE3P42HjbeOTFlC7Fq6o6pudVcdinrdNS+t?=
 =?us-ascii?Q?hvt0rpiJnk2MWQAcC9jV1Xx9pnCX3ItKA1Sxfx4PLItqXun15sNdv2eQrWbK?=
 =?us-ascii?Q?+erf+nCHKJonciBkdPcYsQXjmwl2D4MzCna1Kg2hH0Bw7Tr3NDtQ/cOf/m5m?=
 =?us-ascii?Q?JqZ3CErvtjxLk9ANLQiZleQo8oB+CUctW2p+i3Xrdg3u4sW9TCOtP+7Qm9Px?=
 =?us-ascii?Q?Z38JMrG/e0kWsjfv8UKavieTrfOKnCDJYRPqyJ9+EAHjax6mlMNCZry1PsRC?=
 =?us-ascii?Q?I9XVzLmGpbd49HoruANNINSz1AnB2OXUVTySAC+nNh/c2oOxDvmplPUlttL5?=
 =?us-ascii?Q?J8HdB8Rod8U9C+350gkbcAWnqS/T7JaVx0xjcFwqjG/Qgk8tFis1OTbCr3Dr?=
 =?us-ascii?Q?PKNNevnzI44DP3hSRYK+NyLr/DjvgKtz9ktNd9I5aYqNF3ITZeU5lvJJsTdI?=
 =?us-ascii?Q?aVdN8zVkz2W1XY5k6pLTJj10Lw3NdHXJCYexvmGfbdflCN775oO4dg18y6w?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?76EN5mi3Vsb5+YHLas/pScsh9s9pavoRe05kDiXzdcgEb7rwqeA/QUbZ5P6m?=
 =?us-ascii?Q?yPVF+gq8a2FjqJMc625pMdk17aIQXnvleFMerKF3ui5qzcJN1jxVzmu2uS+p?=
 =?us-ascii?Q?reBzy/M0QDBnuNUdSeHmRUGxLhO8phoFPgLVMZM7+8v+fIywnvlk/Usn0N6i?=
 =?us-ascii?Q?r7+9IQPmLo0QA/GZLw07mW0kVm1+xY3HqxnYnFjJiPGuR7hxmcZQpUpMgYcE?=
 =?us-ascii?Q?tvcApkMEIHDIsrFJA2vXZdBqEri//6U3V/BE/4AKyGUtUfZQQSwSNZp3uusT?=
 =?us-ascii?Q?KrZMRetuoZ3Y4zLCtTkZ4ONyIeqTrP5LvPRj8OiF8Xs2agvNP+Juw6PIgwIB?=
 =?us-ascii?Q?a5rX9pvPJssElH9qd9IfBIW7jDqdPv0NAs0s/4/pIO8yJ+4Ntiq5BalZWn2T?=
 =?us-ascii?Q?h7rsgrKj/7Z8sasFsAiEs1TeAuyiqZV4vaz2UwUGx7cHXFH8rYOd7xORS1yD?=
 =?us-ascii?Q?ehw24WJlr1KQ2eVLY5aeU1NRqeuZRqmW1BjLB96dEC5KhW0RkqTKUhH4r7p9?=
 =?us-ascii?Q?OlGC3uA/mg7pfWZyspiQWTY1e4TyG7+kLfTdPaVSsPkA3jYD0HMNXdsnC4h+?=
 =?us-ascii?Q?et5povHq74GEEGD4jeoEHXsy5Op0oLVWCiMVmIhElAjq8OrJSdn6X5Ae2Prl?=
 =?us-ascii?Q?vfHVKrqUhue4RteVQezgLxKD/nH4H1yw7nlFYjMppLOgBG5U+PEXtyl0ZVhu?=
 =?us-ascii?Q?t8RIkcG7vj9ddz1t2u+9Xy+uhImBI8QKMB5K39mHuncF/rBfhoEufbketbQ0?=
 =?us-ascii?Q?iZzlLsteA3ysWUPRjKCE5S0UwXKem7PryDCWUYqK1Rt4IpN6RTP6/fEqzn5z?=
 =?us-ascii?Q?RSIvS8SsFFe2ew9ckP44C0X1wDlHAA1bRsQgoi3w/Mi88+sSLI5Qy+PgUgwK?=
 =?us-ascii?Q?fH+utmp2h4SR7b/BJcUkLDNqZRNjANRCPGssY9d4Mz/lsfE98Jng49xSypcE?=
 =?us-ascii?Q?gsX4gMpWrr4HKT/nwVJBn88z+c2nlMSc8fzT0nWz0E7R3SIXdx31R8le4wdf?=
 =?us-ascii?Q?21/Qr6CA/w9qIRDnC6pIcD5Xe05jVZLEBcaPd0b7du1cApJjtHUK0UIeHdDg?=
 =?us-ascii?Q?Fzj0xghDRW7dda9tT7lE9ncUV/kc4A0y+cOxFHalOVZQ7qTXdAw+gCwaIm2h?=
 =?us-ascii?Q?xxXq1Vu52VhBJVhuiyEU/NkWsPqxJgZfQ3n/InJCLNsY1B/xPgjxbLG3QmRN?=
 =?us-ascii?Q?22ijEBTueVNh+UjO+9uOIiyA49UYk4dK0DOn0ig4SLxJnsdShoq0d4E977O6?=
 =?us-ascii?Q?ucb63afqE5nxrHaf912meKCWdsiZe/CO3awiVLZuIbWatAwDsjLe0l6bhwaA?=
 =?us-ascii?Q?lcPPCFK7a3nTLxzxMREu98DITUC5Fmk+BQ/+1wcaAt3CL5cz4czeqp4pizJm?=
 =?us-ascii?Q?QG17YD7tLBwSiNbdexXuFHrQkHS0j4+TtzGKzV6c1nOJQkOEMfKmTtracLjw?=
 =?us-ascii?Q?aBZSvKH/F6/oAJR20BXadqOtG2Ycb1zrtZqrFOj90i+h52UOgNChtpXhJ1Xm?=
 =?us-ascii?Q?N/9WriwgN8rmS98ObtzzzTX6ZlZ1sXc6RU3sPYo9O17mHWdXkF9JEpqP3StA?=
 =?us-ascii?Q?V/BiH/GqC8zHRbB9tae28itCCchhKUVFzUGNGtSYh08DBYS7Q+MWJWmKz2Wd?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb04f6ec-7c1f-4064-8b9b-08dcec326375
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 09:27:14.1933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILaoH8mlQkLXYXk+PRaXa0s6eSuZgFXxHaYDizmq9tuQZlYJT9RUCln43qIUg7m5rHYabmWY8RBNTLP0dbJ55mag86LkKRp7msAV5LgbdAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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

On Fri, Oct 11, 2024 at 01:57:15PM +0200, Nirmoy Das wrote:
> This shouldn't happen but seen this while debugging ufence timeout
> issue time to time so log it to isolate this particular case.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sync.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 6a2e4dd41d56..41758f528d7c 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
>  			XE_WARN_ON("Copy to user failed");
>  		kthread_unuse_mm(ufence->mm);
>  		mmput(ufence->mm);
> +	} else {
> +		XE_WARN_ON("mmget_not_zero() failed");
>  	}
>  
>  	wake_up_all(&ufence->xe->ufence_wq);
> -- 
> 2.46.0
> 
