Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75106FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 20:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328FA10E0DB;
	Tue, 28 Apr 2026 20:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYgGkcAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9009410ED4A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 20:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777409750; x=1808945750;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PEHkOvRYBJTLXD7foqtI2eJkrg49yRwooVZe/XPuqnc=;
 b=IYgGkcAy3A9xVdxnbCsdH8Zl3/jRJBrwwEvS05b/ylAkq+ZcHc9QExbn
 YjEpaSX6Qq8EVsc4g8NshUkId7I+AMREYxEjvv95X997CdxbS/RJHfPuJ
 BKbrK+kpV/uq8eCG6cO9oQtaLIinL0VKLdISLEk/+DvM3khxbV/PmXoms
 Hjf0pvho4VJkjBV3BGGoxkc7wsYTEVBT+MlaHbzlDDTXjxt5VUOZE8gA9
 c0Nw3D6qeloTyy2BhRBeoibT+G0JmlG/7A042wttZpP91YVmrgtH01XPO
 Y3MstdYgFsUfbs7Zp1M1NWQe+B7y/HQ1z5XgFAv2y0xT63W22/A3i6/Nw w==;
X-CSE-ConnectionGUID: D8Fw9h7lQiqmn4roeWi/NA==
X-CSE-MsgGUID: x+eO45OARnSlD0ua6tYmGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89421406"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89421406"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 13:55:49 -0700
X-CSE-ConnectionGUID: O1E6uekrRdSN2hFwJb9saw==
X-CSE-MsgGUID: e3tt6FVHR0qgIGkM9PrdYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="231419096"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 13:55:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 13:55:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 13:55:48 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 13:55:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWy6aqbj+PaAzc5LfaBJkakqxPL3Fq0nWH+uQrAW8i7sqk+/xfEWZ/dfs0EG4ItbIWxGsERIcDx2Zt+CJMiTEbFxfB6HC/LGh8PzkkNFHGo4XDB6ZU3Q2t9z1axvgIL4jrFk7Jevxggxc1mEMCKJjb+DuilNNZ/SNnzTTdKe1eyNapdSDnQ7b9nM0MO7k1MmIEsDTdpcyRloMMTtcdcFv0Uo0gTt8gfqcpkRe/L0vBl0TFoSpz0eExKNEj3+8boF9+nvkYxO4SfNzgbyDgH69OIRgf0qIBkWDreJ8mf/9kDLHbnDOcuMhRWnyjZBhD83IzMpvtV6pRkJljg1o4jTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Bd8t76izKxcaJPpRlqVBtXlP/SAYlldeOz2EJGkpJ0=;
 b=jJM5uWmq5zXUguuV3V9Erg2PpRL0M2+o8pf5fY9qUj/SXki6ILLBg3xxpL/XjIfgzGEsWJhpKeZqw+GAqEKSJt0cPtjYDUz8GDUPhcE9FeW7lAsBR/wxsKCdHBvrbPu10q7a9/0lM8iYL/jNDN64KIi4xFDpac6NyXr9y+HpIzVVcUX7LECPRTNWbepxHjEAK2xta24ntyUEJW89aOH6MgTnZ0xWtxwgz4x/41yoT3KFBJc4QvmapOX06uc6fR6pcA8n16ThxNvrC5R1jcY6bN7YobtBm7wYy7cygYwO0Jh5P9jGpdj+Q2y5BRHsDIGdt7fjkBbfI4310KJ5AKqfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 20:55:46 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 20:55:45 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH] drm/xe/mcr: Remove unused
 xe_gt_mcr_steering_info_to_dss_id()
In-Reply-To: <20260422155025.3660484-1-shuicheng.lin@intel.com>
References: <20260422155025.3660484-1-shuicheng.lin@intel.com>
Date: Tue, 28 Apr 2026 17:55:41 -0300
Message-ID: <871pfypzxu.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c42cfdb-7e51-434c-da15-08dea56884dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: qpGuSMmcy5OtGUw6SblLafVotGSyw5jkPXGwJcu5T6VNcTK/m++N8dC6ez9N9TNTsOMM+Eh5THjps+qS8PKhFHVnuNOennedYBN3W2oiZqq1/tByEm4dfXPO5bXDkNF2A1ER7953AfIczjblhjRrUSG/8+zxb1lzDnDRjs7JsF5fd/JXg0SSJyF8vDoe6bGdODBjjCpxPQJrFkgkXG7cuIsiM6+c7Ep/WCymuaf/c0vDyDD1iUotV6aLpFGFOPPbgUjeeRTu/5GVz3CnOh/rnuk7x9FeQRk9zqop62AWJixLmupMavNQ0hZj+ugcVOvTp6HntkzgF/DJeNJ7rwRFi1rLDzA6QH/k+GPbtroqjYV6YfAd1Rxypz6XPlAcWhQbvXZAKDiaY3fwkqSpH4AU4M7pXUJLumcAX2eggNBHTs6gA3mVy/NJTL5iIF2x/fxelM3duAN73WDt3uwqkwk0fBzvvvdBL9zQdIVRTuR8R4YZyOyTlbTJJmk4XIScHzz+d28NUmqr4rW2Y/xJYyaMKWjBNRuqg+bM737bzgIwijv3paeVVtEK31ypZNzOAgETaI0klOKnnvmrglN4EC/vtjdEGptZ8wjl02c5w9f9B49wcPM/Ae1laZ++6ksyRhax9g8POomr+AGpfn8rUNaWV1mJwF2xdcY1K1mRqkRpNnO/u+AgcDIrj5nNuPUGnw+xVvHs+R/rqXkUpPCDi45c8ta/S6Eg4Md6qZC4FZmv9EA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JBP0vICPuuZZ9Ot9EneYKm4hK008ckKcbNWIVAIrM1NiRQwU/b02urCr20/?=
 =?us-ascii?Q?mgtURitpaAfMJlunz1F8NpH3ZqehnOOMjdhGBLsxyrYkCs3KeGOOBPtRhHPe?=
 =?us-ascii?Q?V0FZKdY3U1YOyUPR0gWGvu/xGFHlH8Ap9itXAhn/sXqApZUSV5y0/cw7uh5x?=
 =?us-ascii?Q?kXTbRFU/wSZMobGLi4eDKxP8V769icNX8rFeGjNGtKQaWSkDOwtdTJ6719GG?=
 =?us-ascii?Q?droQqNAonRrINQFWt9pNSrYk0HJCywVLuVtgvjpfFWYVAwRtsa4wi+NL+qgk?=
 =?us-ascii?Q?+iLPJcXSPpJ59OipchgL+NhmzoizP1LoS1WT29u7BWZQ9eugLQbSNf4CMpHO?=
 =?us-ascii?Q?uH1v0aGVA12/mZQ9bcH6FdwT5Ms/BZk7vPfcj6/ucbwsZXD+6eZM3LuJoQFn?=
 =?us-ascii?Q?ksO/l/pf+rsQTcQGy3CiqIsh7EgsQUEpww8AtEv7VpqpYcknuQs4lOmmejNQ?=
 =?us-ascii?Q?UdBmP4F890pNjagcs5tLABtCG70tnLMjLGmpXEvf7PKMg2oie968Z2cCKkwk?=
 =?us-ascii?Q?iWo9MmocbMk7uCQ27XgyIVN8mQImlUCl2PTJtgwgTnSvvGvA+xnvV+IbaBPc?=
 =?us-ascii?Q?M8WXnKedXHgbShm9o2jQouVzZX897fWrwoL0+n51S4tYariKRdfbHjh1gZij?=
 =?us-ascii?Q?t6ohBZLkSEgPHautkyUjtjkymrJ5EoSCcAajZOoe1K9TwnZAFqQrRPz3DgIZ?=
 =?us-ascii?Q?WmcTFk4P1zQNApzgoMUhPfIo4r36pDfhm3jmNJieKQImThz2abIL0xNOhm8+?=
 =?us-ascii?Q?iydyR5xXLptBpPvICYEyTxHrWowt0tIeD938+9+ZE0TSA+ZMwdZA/n18lbyj?=
 =?us-ascii?Q?PJm61O7QvHtxNfJ0OPEE1MmUcqqohShcuGE1CF3O56uRaSi7lb7LMwmaWfKn?=
 =?us-ascii?Q?QbowUwVfRaxyezvsBeMtOocpBXlTeYmmPz9ecFYeVXpfxpoBL08GuE3xAZqF?=
 =?us-ascii?Q?W7dxq3taqlS/bXPUdG+/0WbEDsWsgoUz4zrsXszqNmIvev9O9fnVdw67ZhIt?=
 =?us-ascii?Q?Sf+oJCwEnTQxtUyjXATXbBPnEnFlPPEJ4xhuGQvu+A9DBBwmkMDV9qeSZSF7?=
 =?us-ascii?Q?zezoMouGJDP5Uyh/Hw2wmTyp8rvSHG3+fOX4DyrchxnsCUo7BuTgVDR/xC0x?=
 =?us-ascii?Q?E+mnneTfRskK7iAZ9XPkMn6iFnKZ2/elvp3VudLlO3bCBYCz9cCJ7UbzTWO4?=
 =?us-ascii?Q?BHtOF1CzfnF/yax7AZZixecuk8yXxAi/HU/YrBIR8qid3dFfCg8sz1JjrwNp?=
 =?us-ascii?Q?2mDc/KzTskTQHOWNZU1bp3nCR5Kli0Vr/TV/2YO5THMACItqNakNJONen2KK?=
 =?us-ascii?Q?46LKEH4WGpJ3hEd+rJHC1ZctVefFK2wh5quIetxf4HBDDJTVU/F07X8SlHNO?=
 =?us-ascii?Q?CV8lvJNBRT8JqyXQv61PdX/5MTlBetxJRMZmCX/kCAmU0iqyUdYJMp+9Ly3T?=
 =?us-ascii?Q?TUNzSZNN7wjeZZ93oQUc5GRQyoGueIu9RGJO/HkNwP9M9ppQhaCtye4Rne/g?=
 =?us-ascii?Q?KBFyIM6hAihcjyq1U3LRL4lFwLsko+iIjQJ3SCDub8TpCwG/DwnuKi7BmRjT?=
 =?us-ascii?Q?su5gfKoUx+gX328q0OV17SDWsuPKNzjw0Uba03lMCixuW4zSdYcLdZcUy2zD?=
 =?us-ascii?Q?FPO8qP9OeurFd1EMM7SiIL+6b1SWCDOfuWoUtP6TGSERU6kDcga5+vA5FGEy?=
 =?us-ascii?Q?rvGvSS3/hLyNZ/qjAbOUfC/8zmwoEC03B9c+XYWQ8H9yImo92NNYT9w5avqQ?=
 =?us-ascii?Q?Jdp/GgdDSA=3D=3D?=
X-Exchange-RoutingPolicyChecked: qTSJ44Cj32+5p27+OGmsKBCY5UonHQ8yyELEgwit9cNpN+zYxGEn3QmXahlXHab8Mmft/M7hgSxqltg5nSYAMZfUUCw+rdqDOiikT5wXtHsaS+HYCXbq2VHr3QHesQaVq23gLtBrBsVNYrxw5vh5jORP2gQzkKdPt2YKWg8lSQxJNucl0kqUvvALY50gFKLIwtbwtpVj6aR4VWCBvRjwJ7OmoObhNxbrcI9ET91tLYnIvFAqH3rJXpYwYdJ89c4GMTTsM15Z2O1Hk3enAsmFZvNLb2IWFmvBEVuh4T4LBQ78HP1kyaN6fFTqebJJKgL1rLuE1fO//zzjKyrIWECgpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c42cfdb-7e51-434c-da15-08dea56884dd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 20:55:45.9035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtTI2BH6A1C7NsFeHlRIshOb3trqB9zkjzFPicYymQEQQHVfIBci0PytmecQjePpgrBHFrNwkV5L32072KYy+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
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

Shuicheng Lin <shuicheng.lin@intel.com> writes:

> The function xe_gt_mcr_steering_info_to_dss_id() has had no callers
> since commit fa597710be6e ("drm/xe/guc: Cache DSS info when creating
> capture register list") which removed the only call site in
> xe_guc_capture.c. Remove the dead function and its declaration.
>
> No functional change.
>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 13 -------------
>  drivers/gpu/drm/xe/xe_gt_mcr.h |  1 -
>  2 files changed, 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 7c6f039c880d..4bbe052d6d68 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -430,19 +430,6 @@ void xe_gt_mcr_get_dss_steering(const struct xe_gt *gt, unsigned int dss, u16 *g
>  	*instance = dss % gt->steering_dss_per_grp;
>  }
>  
> -/**
> - * xe_gt_mcr_steering_info_to_dss_id - Get DSS ID from group/instance steering
> - * @gt: GT structure
> - * @group: steering group ID
> - * @instance: steering instance ID
> - *
> - * Return: the converted DSS id.
> - */
> -u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance)
> -{
> -	return group * dss_per_group(gt) + instance;
> -}
> -
>  static void init_steering_dss(struct xe_gt *gt)
>  {
>  	gt->steering_dss_per_grp = dss_per_group(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 283a1c9770e2..2be9419b8acc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -33,7 +33,6 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_mcr_get_dss_steering(const struct xe_gt *gt,
>  				unsigned int dss, u16 *group, u16 *instance);
> -u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance);
>  
>  /*
>   * Loop over each DSS and determine the group and instance IDs that
> -- 
> 2.43.0
