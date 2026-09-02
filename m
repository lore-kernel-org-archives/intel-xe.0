Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBFEC624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1417E10F30A;
	Wed,  2 Sep 2026 17:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="impLyv+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A9A10F302
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 17:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788371815; x=1819907815;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ig7KoYRzmyQL1J2XzQ7WQoJvuf9GIYPoUBsBu34m01o=;
 b=impLyv+lUcHqt2Wv2uYvfa42ZFkmW7HU10SOOO3UUqNMWs72XiEsrvls
 kmCfNtxVbh2UnZrKMbwcvR1Xv3rKIBuyABjv5L+U6viYX01W0OK4y6OFe
 +Ki8ugDe0cNQE+CxNgub3cPM+du8K1gaLq7v4jO9MOIOobNMhIl7sxKHR
 wR7gwOZwYjlehC5nGde9Ctr4HM7dXJV0C/S0lS6qkShNXmuqaRyKQxglG
 eNAhacRfxJXAEL+MijCep3bLMf8W8bzAYtKm8zgvXOKSSSjivyc6idxyY
 6EilAOt/dm+bHDs01+D8cYu9jN5LzfDZs16Dy02i4PKIByGzlCiymDUt8 A==;
X-CSE-ConnectionGUID: Xi4cZng8RJKiiukqLffF1A==
X-CSE-MsgGUID: XOsbtRWnQtWgwYS+8FbWLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99503518"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="99503518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:55 -0700
X-CSE-ConnectionGUID: Iu7dP4PRSWuUBzpViA1tuw==
X-CSE-MsgGUID: p8rHvaepTbOF+JdNAihTFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="307686884"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:56:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 10:56:53 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 10:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owEa4VIfZ1IwPNHGvynhJbBqlAygd++34WFGIM8NhNQsLmM0flOgc1NYt+0K0/AkF7IPhcqOHVkBqXaARnOnC12mQwkxR0gsUARRd+MwDJbwcAAe/x02cw5WJyH/sQvZJkaXUYKT8B0/61tpFtk6huGYQcSOhVo1T5AtFIfzyUdTkEBQetq6bdl/4aoWmr/26Ak70Hr6d9Jc2UNVjajk+9rR52aVSXJcwvTHg9px8RLXGq7eLHtxSigKXPsVvvw2bjBm5pN0RiyECmrrKCwa+GUmZ/oDIfKOlXnIH8a8jHFeiwsZmtd5Hqxs8mtLqa685o9PewT0edgWS0IZ7KvllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy5qqr0H1vgxhR+cD+5ZpXsHOuPDoLSRRrQWbP21kDg=;
 b=GWeQB8LMM2g3r3kBdKsRlC8C3vLTRtNohZpaSzG71dNx7oznkmc0FS7Sogovc7wBt/hdnCKLJn84+R8tNiCZcR3N13YZS8aD3Xd1Ebz4lUL9NSkjImMG3kv93YRxEl7qJW/5n3AI4woQ5gD6qysUf0GteTIIY2QmjcvWOQ9RXZOqCbKUJPn9Ij4Q3s178yODxNqiJXn4M3pUFZm1cfrkrgQ5KFEbFtuH5rwQ70NutKO92HVb65lgROkEeAfrDExXz0QAfRN1QCFgXCw2xUyLaMD3IG1MIwuKwC+EIHPfw0p2xWaOyVUYfTuJflTlB8aNmmM/qiHHk0oCIpzssMOIDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SA3PR11MB9487.namprd11.prod.outlook.com (2603:10b6:806:47e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 17:56:51 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 17:56:51 +0000
Date: Wed, 2 Sep 2026 13:56:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe: Introduce xe_wedge
Message-ID: <aphjXJkXap4nZHou@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
 <20260831042633.1760474-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831042633.1760474-4-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SA3PR11MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: d65e4bf2-678b-4b98-ebc3-08df091b90ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|13003099007|10067099003|4143699003|11063799006|56012099006|6133799003|22082099003|18002099003|18092099006;
X-Microsoft-Antispam-Message-Info: Xn5dmsmkm9RmKdDsVyl7DPo39KzBDyHNet/hpGUJet9wmrB5cmsU5V18YI51xSGx3Pm46BINKNyZq2q/7Z2I4Uf5Ta7hbnmy9Mu5b/vmzlLJcbO1MLtDiiMurQpBDaF7sFs8KDyrmoy/e1tqhKp/5Myl9GytITzkX4HQrKSc9VP4XzANx5CW04EFW5o50W00BRXYHhwL24P93TGYG/K9peit7cgEimDDdK7saYBsfyWV+vfy2zSrFZOvxwohGrWBsq1yFskXvRemh6w2YvTGVTuxr+0CcyW64HkpdfdSx9llxC+NCM78HMu4J/DkOftochvBzLY4DWGtFpV86eEJ5Q4/NKxjMMAJ2FBzrxeifC4t0HojmmB+Y9GFnriMXyfFaFqHY/T2B6rjD6uCvlwVR6vkeBBPeilkDW5+VU3NXCfHO0CaPjxoWt6DUBacTgbjOFPdi0rnM0xJIHWtWXHG+EYi6lJGl0+4yLa+x0cIUd0O4bTb28NfOTpE1NB5m119igWPvoEBvz9HW2/Z45n7NR2/dt8OaEohB+sCOKafmBPSsV9IfDn10ekST0v+D2LE06g1oHWrYZPS98SHY75ieOEntV8TV60AUgdXWEcmSZYaHh/oP1kJtKJ141dwo+9S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(13003099007)(10067099003)(4143699003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(18092099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?17eFgMeTl4LTGi9OmIK2HBj9xu5tqjtOJrjISpjww7sBqf5zKIJdzbZeTb?=
 =?iso-8859-1?Q?UY/tYUsyquN38nzg9c3cw8VmAH/v57PZzOOMdGctpu47AuvdG6h9q/2gqr?=
 =?iso-8859-1?Q?Fo76ajjt5i8bqvSHm78AA/JQcDzxFTRzCchoxiuN+YxsolxF/HMOSOn4as?=
 =?iso-8859-1?Q?1mlZyAHRtFt9jZZzS+2j9zec9ULEgBjFqF7hkYhrlUFf91yO91fOh1dCdN?=
 =?iso-8859-1?Q?UHW0KYhTA2s4mYMh91iHMCoJ05dOAKfsu5qW9oBhJ3bVy+SxCL1ETLISCn?=
 =?iso-8859-1?Q?dPALr7c4BvsgVgfQ7R7lByNKbMP4HnfCtPhwKU/ry8X1o6QVRfUganMri5?=
 =?iso-8859-1?Q?Q3gpPANg6I1Q74G2SNmLsyFaULm9/vQ0y6CwD9rI43tWf4LmsUKDXxLuad?=
 =?iso-8859-1?Q?Zn55jLV2ozjFT3rVef9nNcZlFW23yq24h+vtNfYO8rQ74eSYa+YbcGxySK?=
 =?iso-8859-1?Q?k49x5rzYu1FwyAEoCyh8hMygQSU1xhZOIfJpMj9IjxfQ8WGDaxHFUYXnnu?=
 =?iso-8859-1?Q?wzOOCnt8qFOd9OF7eQdggUWxskCd1r7Nbs3P4L+gJf/R+fgGNbg67oE/Qv?=
 =?iso-8859-1?Q?bCfFEAxozicPJGEgdLuYE7zf87TziQm5Vjgqk1r9AH/8Ax6xqIJI51GvlK?=
 =?iso-8859-1?Q?BrpFOJ3OvmX/YRo/gWxHxVdCcgGKLNOPjl7pdm7fT/ozGeGVlY3XDiQj53?=
 =?iso-8859-1?Q?3061vWjnOVWAb7QwPoVJchJrV3LZQpijWYPOO1MCNRB49thqiIbuKAFHTK?=
 =?iso-8859-1?Q?HN+mlLwT9AX0VNwJWy9zvIJ1nSdkrNIvstzuwM4/NXaxoH/jTOrYcl4O8Z?=
 =?iso-8859-1?Q?bdI3ICdmDZUefMJ7INywth+wBkeMawQybl2MnHAAmhr7C3N4P/185us5Tc?=
 =?iso-8859-1?Q?Otvpjd5kNV5WzCpwtaDkW8uSHbNMmkj2liBo/qixZfjAOScfQP6+tPh3kP?=
 =?iso-8859-1?Q?EBzhPAUDk5tfLWkGqdkxsHYMzEUv76Of1RmEAoyzh2CxOnBQ7PNk5kUhCw?=
 =?iso-8859-1?Q?DGKiZU3qbuH6qr9argZDX+qJlnHRZJpvYyR4Wbj2hQAE40lVuoL11/nd6x?=
 =?iso-8859-1?Q?xfY7Qa2KdzsVjizI0a+fLnD6/Y7IiJaYORh11nBxOSzHMEI4HzUGGOb1h7?=
 =?iso-8859-1?Q?NrlGteSe0Favh2OZZzLnioffTj2hXjiEUGTXl9pmdn5jZg0koEWq85v8Yy?=
 =?iso-8859-1?Q?kKxESWhNo9shqPSJiR0j3vaeokShgcfRTcg4LkFcPbWyoTeEckafjOzFA/?=
 =?iso-8859-1?Q?TsCESXqBOKNCUhqTak61beeGEAY2ZG1qyUa0Io8ZDPpjbcPoNDAqXVFRpR?=
 =?iso-8859-1?Q?nmJrK/kvn/+FdTPK6cBsRqW74oRPzuKT2tkhIrr/03hs3D7NE/v6JJw905?=
 =?iso-8859-1?Q?KrwEuELD75+btJuNm+15GCXvaiTdBzb8nZlQx11Oo2BfjzvZRprkbEQv6Q?=
 =?iso-8859-1?Q?6+jV82VbKptynjrPJH12WZqkdh58dSfK0dUyMVbYVb+WXKEcrY9QFt/cxx?=
 =?iso-8859-1?Q?Mrz/DJj0CZydgi4mkHZ4OHdtQx/i0vSufdwQkP7KNg5D+dWuLdIflNui4w?=
 =?iso-8859-1?Q?M2yxZ1QghSnrJ4yKWa4ey553sJ8MnZmQruTYpEYLTIlbo8ph4SQXzPsvbX?=
 =?iso-8859-1?Q?65Iv97LsmH5eSdLXlUOxVxVuCXIdi3SHUsAx/Qb7t8eNGbZ9fK+uwYvx60?=
 =?iso-8859-1?Q?badoaOGOwAwa/6k73Dov/bPLjlHzUKh/AP8OGZBBWkgE5l4L+0XIUsjmuJ?=
 =?iso-8859-1?Q?AwVpW/T22LV62BY540ehnLQk73OvnsOsSlk6odI/ieCA/coVvYAVmWCs0G?=
 =?iso-8859-1?Q?9Vi4fFhl+A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 4tOzn6gs+EQ7RiNFCAQNFAYW0fBMOa7Eccg+ixFzVHPpVjRSVhjxlaW3B4hl3VOkzeGOk+OZmEb93TxgLU82FpFVHZa5ktZV8eCn1HdNPeeN0QdPpwy4HIRNskByvOgQd8/WYFGfQP1mPzbASTmtVjPdRfcj5eDDL7Iw07uDKUN7iMnKoUMyO2WDT34h4oWxefpdBrwRthz46fjAGXdaNGxaC5ewjYmSms9tjjPYTnwq36fsmzI/3f3zYFU3LpuX1A6+OLIEckyBV491r109oNtP/ebKnh3bi3vUx1wjq5QXAHDSJMRsXk3XxzzsS36GwNq/904MqDCIhksUjXipMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d65e4bf2-678b-4b98-ebc3-08df091b90ad
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 17:56:51.0621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTbU+yU7Zfn49hUpCVBSAoex0h1xpHwRFfzapHsBtY0cgpobmTOXLviytIH2Nu6vqCnfl34doV9jyzp9ymcsEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9487
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

On Mon, Aug 31, 2026 at 09:55:51AM +0530, Raag Jadav wrote:
> Consolidate wedging implementation into a dedicated xe_wedge component
> for better maintainability.
> 
> No functional impact.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  Documentation/gpu/xe/xe_device.rst |   2 +-
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_device.c     | 186 +-----------------------
>  drivers/gpu/drm/xe/xe_device.h     |  11 +-
>  drivers/gpu/drm/xe/xe_wedge.c      | 219 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wedge.h      |  20 +++
>  6 files changed, 243 insertions(+), 196 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
>  create mode 100644 drivers/gpu/drm/xe/xe_wedge.h
> 
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> index d3a022362ade..8baed81580c9 100644
> --- a/Documentation/gpu/xe/xe_device.rst
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -6,7 +6,7 @@
>  Xe Device Wedging
>  ==================
>  
> -.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
>     :doc: Xe Device Wedging
>  
>  ====================
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index adc2de37e768..c739a50b6896 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -152,6 +152,7 @@ xe-y += xe_bb.o \
>  	xe_vsec.o \
>  	xe_wa.o \
>  	xe_wait_user_fence.o \
> +	xe_wedge.o \
>  	xe_wopcm.o
>  
>  xe-$(CONFIG_I2C)	+= xe_i2c.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 49e3f6f66588..d3a7034fac01 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -829,10 +829,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	 */
>  	assert_lmem_ready(xe);
>  
> -	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> -			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> -	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> -		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
> +	xe_device_wedged_init_early(xe);
>  
>  	err = xe_device_vram_alloc(xe);
>  	if (err)
> @@ -924,25 +921,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
>  	}
>  }
>  
> -static void wedged_work(struct work_struct *work);
> -
> -static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> -{
> -	struct xe_device *xe = arg;
> -
> -	disable_work_sync(&xe->wedged.work);
> -
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> -}
> -
> -static int xe_device_wedged_init(struct xe_device *xe)
> -{
> -	INIT_WORK(&xe->wedged.work, wedged_work);
> -
> -	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> -}
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
>  {
> @@ -1405,168 +1383,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>  }
>  
> -/**
> - * DOC: Xe Device Wedging
> - *
> - * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> - * When device is in wedged state, every IOCTL will be blocked and GT cannot
> - * be used. The conditions under which the driver declares the device wedged
> - * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> - * default recovery method for a wedged state is rebind/bus-reset.
> - *
> - * Another recovery method is vendor-specific. Below are the cases that send
> - * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> - *
> - * Case: Firmware Flash
> - * --------------------
> - *
> - * Identification Hint
> - * +++++++++++++++++++
> - *
> - * ``WEDGED=vendor-specific`` drm device wedged uevent with
> - * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> - * admin/userspace consumer about the need for a firmware flash.
> - *
> - * Recovery Procedure
> - * ++++++++++++++++++
> - *
> - * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> - * the below steps
> - *
> - * - Check Runtime Survivability mode sysfs.
> - *   If enabled, firmware flash is required to recover the device.
> - *
> - *   /sys/bus/pci/devices/<device>/survivability_mode
> - *
> - * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> - *   firmware and restore device to normal operation.
> - */
> -
> -/**
> - * xe_device_set_wedged_method - Set wedged recovery method
> - * @xe: xe device instance
> - * @method: recovery method to set
> - *
> - * Set wedged recovery method to be sent in drm wedged uevent.
> - */
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> -{
> -	xe->wedged.method = method;
> -}
> -
> -static void wedged_work(struct work_struct *work)
> -{
> -	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> -
> -	/*
> -	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> -	 * hangs, so wedge the device with 'none' recovery method and have
> -	 * it available to the user for debugging.
> -	 */
> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -	/* If no wedge recovery method is set, use default */
> -	else if (!xe->wedged.method)
> -		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -					    DRM_WEDGE_RECOVERY_BUS_RESET);
> -
> -	/* Notify userspace of wedged device */
> -	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> -}
> -
> -#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> -#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> -
> -/**
> - * xe_device_declare_wedged - Declare device wedged
> - * @xe: xe device instance
> - *
> - * This is a final state that can only be cleared with the recovery method
> - * specified in the drm wedged uevent. The method can be set using
> - * xe_device_set_wedged_method before declaring the device as wedged. If no method
> - * is set, reprobe (unbind/re-bind) will be sent by default.
> - *
> - * In this state every IOCTL will be blocked so the GT cannot be used.
> - * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure. Userspace will be notified of this state
> - * through device wedged uevent.
> - * If xe.wedged module parameter is set to 2, this function will be called
> - * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> - * snapshot capture. In this mode, GT reset won't be attempted so the state of
> - * the issue is preserved for further debugging.
> - */
> -void xe_device_declare_wedged(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	u8 id;
> -
> -	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> -		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> -		return;
> -	}
> -
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		xe_pm_runtime_get_noresume(xe);
> -
> -		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> -		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> -			    "For recovery procedure, refer to %s\n"
> -			    "Please file a _new_ bug report at %s\n",
> -			    WEDGED_URL, XE_BUG_URL);
> -
> -		for_each_gt(gt, xe, id)
> -			xe_gt_declare_wedged(gt);
> -
> -		schedule_work(&xe->wedged.work);
> -	}
> -}
> -
> -/**
> - * xe_device_validate_wedged_mode - Check if given mode is supported
> - * @xe: the &xe_device
> - * @mode: requested mode to validate
> - *
> - * Check whether the provided wedged mode is supported.
> - *
> - * Return: 0 if mode is supported, error code otherwise.
> - */
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> -{
> -	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> -		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> -		return -EINVAL;
> -	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> -		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> -		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
> -			mode, xe_wedged_mode_to_string(mode),
> -			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> -		return -EPERM;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_wedged_mode_to_string - Convert enum value to string.
> - * @mode: the &xe_wedged_mode to convert
> - *
> - * Returns: wedged mode as a user friendly string.
> - */
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> -{
> -	switch (mode) {
> -	case XE_WEDGED_MODE_NEVER:
> -		return "never";
> -	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> -		return "upon-critical-error";
> -	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> -		return "upon-any-hang-no-reset";
> -	default:
> -		return "<invalid>";
> -	}
> -}
> -
>  /**
>   * xe_device_asid_to_vm() - Find VM from ASID
>   * @xe: the &xe_device
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 6c4cfaebc44a..c984972bd0f8 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -11,6 +11,7 @@
>  #include "xe_device_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_sriov.h"
> +#include "xe_wedge.h"

We should avoid chained .h includes.
_types.h are okay... I don't know what this sriov is doing here :/

Could you please remove the this xe_wedge.h include and move that to the
individual users?

>  
>  struct xe_vm;
>  
> @@ -207,11 +208,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
>  void xe_device_l2_flush(struct xe_device *xe);
>  
> -static inline bool xe_device_wedged(struct xe_device *xe)
> -{
> -	return atomic_read(&xe->wedged.flag);
> -}
> -
>  #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>  static inline bool xe_debug_page_size_supported(struct xe_device *xe)
>  {
> @@ -260,11 +256,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
>  }
>  #endif
>  
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> -void xe_device_declare_wedged(struct xe_device *xe);
> -int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> -const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
> -
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
>  
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> new file mode 100644
> index 000000000000..92973133a6f6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_defaults.h"
> +#include "xe_device_types.h"
> +#include "xe_gt.h"
> +#include "xe_log.h"
> +#include "xe_module.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +
> +/**
> + * DOC: Xe Device Wedging
> + *
> + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot
> + * be used. The conditions under which the driver declares the device wedged
> + * depend on the wedge mode configuration (see &enum xe_wedged_mode). The
> + * default recovery method for a wedged state is rebind/bus-reset.
> + *
> + * Another recovery method is vendor-specific. Below are the cases that send
> + * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> + *
> + * Case: Firmware Flash
> + * --------------------
> + *
> + * Identification Hint
> + * +++++++++++++++++++
> + *
> + * ``WEDGED=vendor-specific`` drm device wedged uevent with
> + * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
> + * admin/userspace consumer about the need for a firmware flash.
> + *
> + * Recovery Procedure
> + * ++++++++++++++++++
> + *
> + * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
> + * the below steps
> + *
> + * - Check Runtime Survivability mode sysfs.
> + *   If enabled, firmware flash is required to recover the device.
> + *
> + *   /sys/bus/pci/devices/<device>/survivability_mode
> + *
> + * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
> + *   firmware and restore device to normal operation.
> + */
> +
> +/**
> + * xe_device_set_wedged_method() - Set wedge recovery method
> + * @xe: xe device instance
> + * @method: recovery method to set
> + *
> + * Set wedge recovery method to be sent in drm wedged uevent.
> + */
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> +{
> +	xe->wedged.method = method;
> +}
> +
> +/**
> + * xe_device_wedged() - Check for wedged device
> + * @xe: xe device instance
> + *
> + * Returns: %true if device is wedged, %false otherwise.
> + */
> +bool xe_device_wedged(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->wedged.flag);
> +}
> +
> +static void wedge_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> +
> +	/*
> +	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
> +	 * hangs, so wedge the device with 'none' recovery method and have
> +	 * it available to the user for debugging.
> +	 */
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> +	/* If no wedge recovery method is set, use default */
> +	else if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> +					    DRM_WEDGE_RECOVERY_BUS_RESET);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}
> +
> +#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
> +#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
> +
> +/**
> + * xe_device_declare_wedged() - Declare device wedged
> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with the recovery method
> + * specified in the drm wedged uevent. The method can be set using
> + * xe_device_set_wedged_method() before declaring the device as wedged.
> + * If no method is set, rebind/bus-reset will be sent by default.
> + *
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt reset
> + * failure or guc loading failure. Userspace will be notified of this state
> + * through device wedged uevent.
> + * If xe.wedged module parameter is set to 2, this function will be called
> + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> + * the issue is preserved for further debugging.
> + *
> + * Since the wedge handling is done as part of worker thread, this is safe for
> + * atomic callers.
> + */
> +void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
> +		xe_dbg(xe, "Wedged mode is forcibly disabled\n");
> +		return;
> +	}
> +
> +	if (atomic_xchg(&xe->wedged.flag, 1))
> +		return;
> +
> +	xe->needs_flr_on_fini = true;
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
> +	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> +			"For recovery procedure, refer to %s\n"
> +			"Please file a _new_ bug report at %s\n",
> +			WEDGED_URL, XE_BUG_URL);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
> +
> +	schedule_work(&xe->wedged.work);
> +}
> +
> +static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
> +{
> +	switch (mode) {
> +	case XE_WEDGED_MODE_NEVER:
> +		return "never";
> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> +		return "upon-critical-error";
> +	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> +		return "upon-any-hang-no-reset";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> +
> +/**
> + * xe_device_validate_wedged_mode() - Check if given mode is supported
> + * @xe: the &xe_device
> + * @mode: requested mode to validate
> + *
> + * Check whether the provided wedged mode is supported.
> + *
> + * Return: 0 if mode is supported, error code otherwise.
> + */
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> +{
> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
> +		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
> +		xe_dbg(xe, "wedged_mode: (%u) %s mode is not supported for %s\n",
> +		       mode, wedge_mode_to_string(mode),
> +		       xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_device_wedged_init_early() - Set wedge mode passed as module parameter
> + * @xe: xe device instance
> + */
> +void xe_device_wedged_init_early(struct xe_device *xe)
> +{
> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
> +	xe_dbg(xe, "wedged_mode: setting mode (%u) %s\n",
> +	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
> +}
> +
> +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	disable_work_sync(&xe->wedged.work);
> +
> +	if (atomic_read(&xe->wedged.flag))
> +		xe_pm_runtime_put(xe);
> +}
> +
> +/**
> + * xe_device_wedged_init() - Initialize wedge
> + * @xe: xe device instance
> + */
> +int xe_device_wedged_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedge_work);
> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> new file mode 100644
> index 000000000000..c6f16b10ea69
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_WEDGE_H_
> +#define _XE_WEDGE_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +
> +void xe_device_declare_wedged(struct xe_device *xe);
> +bool xe_device_wedged(struct xe_device *xe);
> +void xe_device_wedged_init_early(struct xe_device *xe);
> +int xe_device_wedged_init(struct xe_device *xe);
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);

As I told in the other review, please respect the component namespace:

xe_wedge_ not xe_device anymore...

> +
> +#endif
> -- 
> 2.43.0
> 
