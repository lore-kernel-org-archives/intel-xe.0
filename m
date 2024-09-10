Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80E4EDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EFF10E8CE;
	Tue, 10 Sep 2024 18:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5yCLw3r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CA110E8CE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991873; x=1757527873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XiMzsjFVTXk+lWymPdhnmGlMqvTVDBRxJmtTFd6XYWU=;
 b=U5yCLw3r3kg5mjB7AS+T3Kcnb/YIZIk34S69Jwlj0E0X1FNvRPUM2/Ao
 j7kbjqvDwQTuZiXSQZotVU+uvFUn+XTwjJm4WNurPxvw1XwOKDU7Sg0+9
 yTeARZaLrU61pxtyR+/n0O0zhuBe3fWaultfJBUmH4pXOYV2OFgf3Gh8t
 IqyW1Rekv72H3ubjg0oYHuFQSKHoWwC/VV7jFTwmvhiPJpc0fhSGclbUf
 MHWbWq3oRPUuLbiV2V2uXDBeGZb3J3KG3xZb45Lqg04ypPfddyNAc+50A
 lYFB4Ud40ErE2Dxs7qPx7qmWWVqDCZefJMUNg0hqhvkadLS8+H1xXUhK7 g==;
X-CSE-ConnectionGUID: c4PjgiHATK2nHpkun3oTaQ==
X-CSE-MsgGUID: bUAVRibaTC2aoCdOi5bcZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13462306"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="13462306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:11:12 -0700
X-CSE-ConnectionGUID: OCHJ1/4URmCg86182PNNPQ==
X-CSE-MsgGUID: XgcZmNFYTw+e6GBWW2ZFcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="72088414"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:11:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:11:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzJKmfBz2UR8x9bKnOfJNa7lp7rc0fKYPFE5LhJ6ycNLa+glyzKqKJ4AVDOBhk4MDtxGL7qb9gYOJDWEafditneuIUdVHbDnd6ovsyjJPelvefYanmzL+tB2+KiLYj2VUqpcP+NaFNoGTDTFa4jOYEGiE0rIJi0WvSTr7pGsGU+HPRTUCNhcS1edP53ZRng3wMKATZZZa/ZYYVpdC4GY6b1JiNoZcxheqjzQsbcp5xDGtRcZUJmOm0Ax7U8LwIs9gD5jS0MP12+rLHGuBmR+1ygm7EHHxpYyCvEhiU+fprwzZJolnQc+MzPR+wetS/A7oAZd9ErVCuttDein7rY3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcI26heuSdF4StRH3Izb7xMgJlIdfJ+wXriyL661sxY=;
 b=IM9jS0PaHcfj9+hC3m0tfwzrFvHffsOQQgdKk2ulMO07orbEeUlj3ysTE47XGb33dEMHSPrhDH1t4DRJT7KH1kb9R9n/9AoIUsd5tTRb/t4miVmtY71IqVl/F+OJkyCZIrTjwqk+agTIQIR0K8wwyVGZyqCKXa3bmx4mmgF+HJu75QuZMDWOw2hG8qo3sF5BQayzpeKW3+YXW/Qi1hiQ9l/Fe/vZX9pEFY8tCR1xvc84UG0XDYsdQXf0AatJpUvvfBADDLWEskBgkxnjbzKYmKu3FWELxziz6MUB7p9sh4Y/8M85dmkT3PI6SreCZt5Mc0A9azsF1MZXq9uQwjLH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:11:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:11:09 +0000
Date: Tue, 10 Sep 2024 14:11:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 25/43] drm/xe/mcr: Convert register access to use
 xe_mmio
Message-ID: <ZuCLuLRwzB-F-_KK@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-70-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-70-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:303:8e::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: d71adffa-701a-4525-0033-08dcd1c3f0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q9LdZM5AMlfVW543KiJq1pLdSiHdQFgomjlWk+fVeGUXEXL6rHElzSHKWAK8?=
 =?us-ascii?Q?3A2W3wi4aReemDdR+IflkyTY3OVP0p7KPvlsqpiAuu9b/M69BVpVdC1PozTF?=
 =?us-ascii?Q?XbCMn42zoadhyopiYlZGqQBVX3DZf+LVDFValP8Ktfbkqc6yiQo6XNSjxwRJ?=
 =?us-ascii?Q?qkrPkM6wKzHrdDgz2Z1aBKZFVmbCR1uUZWRCLU5OSBSGW+haba2gZ+bMt/H3?=
 =?us-ascii?Q?qGXRUCMqhZwxkSO+dvJTaEGE2F1MVdIxcQ81R6yGHfUzGdvo/HnF4+NyRKTH?=
 =?us-ascii?Q?ojFnaqEnfdrKD/n4dyVaz7XXGQJxGM3Slsnf8JRCesCTA9usS30Vpiq30jGg?=
 =?us-ascii?Q?o4T/pT5tkz5F4+v8Qb7qEAs/UhP+z2n6U4NmdrVd225I8ou7ajB9CIZuGurm?=
 =?us-ascii?Q?/WmoAQUZFnqDY5StMPdfwDSKZ7ho2hKJ8C0KQQtnrAU176OodVRBvzBUFElW?=
 =?us-ascii?Q?1Wkn8IKFtGY3sWNceczKLWjBBkW9MzdYdf0AcuidEkyx0og6FpgtPWgl69Ir?=
 =?us-ascii?Q?FfAgJEFsAk0tkBOh0rMTit3m5JZWsYbG92OiezbPWuD/3GKbl8D3YHqerJKO?=
 =?us-ascii?Q?kJALbI4E6QUvra3Ei7BBvi+WFFpoFtC8N//pU4wP6hhAe6tnWhpsRd5vxsQM?=
 =?us-ascii?Q?wD4BNab9X70RILJ4efa5Ze9wWcpyWGjHh92FvURQmjSBofhwRLUJlEizxQTX?=
 =?us-ascii?Q?kcekMjZInpE9ySMd6COKQSpf5PqIIfWGaNPYJAzCbV+MyZvQLbEnV8F/eJF1?=
 =?us-ascii?Q?tsnq8wOLkraX3yzgCVlhTP/dL/GPdNxByUQgZhHauhMF9NYU6YjJ6mt0yWt7?=
 =?us-ascii?Q?CNTCT9OJWRR3eKyj2oECbLv9pj0l2/ZxpCb92x8AAy/y/M2Py6cUdQ/T6hlu?=
 =?us-ascii?Q?2JS0Js7/aTBj69ncp/QDQSFgE/tODA6gBRjVX4f9v6dO4ODTdqaEnpmi/1U1?=
 =?us-ascii?Q?/Xy/JXbedYoDsRneiSD3hPDBHy3zU2Xfnuts9BrSuU99218W10aCabaY4SP3?=
 =?us-ascii?Q?IjORXAFncfCbBNcv9CYIfzCFdTbucFXHtTID8sdNgEEACZPm0J0ReRO/U3x7?=
 =?us-ascii?Q?d/ODalfnVK+/uye5XswPIXb7If5mR80UTp0xfQYdhz+YFI43Ri0CHhCeaPqr?=
 =?us-ascii?Q?oJfzKy/FPcv7G/Pxu/AXc00kYqTkqoUGk4uhlfihCBCResZvmuljt6jX9iUx?=
 =?us-ascii?Q?RqFVZrZR+LU5PFTjnNssTU06QRdFA0TVFw15yvIRgbyObYEshlNiRhJagAI1?=
 =?us-ascii?Q?F3kzWLID6w8XNcmoo6hgx4Z0TFAVTnPO4g8GmOqydnqvS7ZdynR34eCZO3mb?=
 =?us-ascii?Q?dYQVHsAKdxkUtl7XY+wcnSJTxDvlBeMhUZj3kiudjsD86A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jA6BqV3cS8fWDnKGZpZyxy8lSD67zJQGp5SIBKv/XhaM2beZJbdGKkvnkFKO?=
 =?us-ascii?Q?7yjn0s6UXmGH5ZXk+XzpxAqTkXPNB9G7XS6zZN0bSc2S2Ab6gUPNIM6YdvT3?=
 =?us-ascii?Q?+QjOt9VGNOHF73GYIEYt9S7ApdwT4t9AJhMDKPSKibJmU6vLecquClaAKsLO?=
 =?us-ascii?Q?i9SppdfI+8KZ/5lz5EfxYl1YdyUbJk+byGZEFcuFTXEtNmUOss7Up+vNwNba?=
 =?us-ascii?Q?uvKPh5S2dbq1H4CQUdX7AvJ4/Eg6miI2dM+PBzSvubCHeawtwIHBg001Arus?=
 =?us-ascii?Q?L3nP4OC54fHkpjIktuaOfS8/BK3z8gGNClZjbhZKP3asy1RvVOigavbmVNZq?=
 =?us-ascii?Q?lYwWst1haTf03g8LZG/EVTmjNaNibyDTOOJLnaQXaby2pklcTuILsa/OYvEt?=
 =?us-ascii?Q?eFsVK9oMiEgMYqkqkwRp2scMqO0+q8MgoHege32veY1h9hVWzIp2rE/g/10u?=
 =?us-ascii?Q?4Gwn9svK96/RyhL/O+CSAVzbNgG6vlBJjfE7H+VE0V5dzCRLU7TmT4pbwLpQ?=
 =?us-ascii?Q?VWUpDEYiDdR+jm5w3iPoo5GsCjQYVC1E6uTIBOkkjiooOECjJTT0voqvV5ld?=
 =?us-ascii?Q?V6WCyQt33nRnIhZ0AU+BeZQ2j0/9hda39SH6fUwWGf/AF+84iN/apD4qhB3y?=
 =?us-ascii?Q?mrTA2OEcystvRhmcnZqZT4foxekZu1+WeaM7+Liqy4iUKyHlwj2QEWdtX8OZ?=
 =?us-ascii?Q?ADmVT1CY4Wp9ZMhwAuTdJKjOV3Kl7Vyvevi0KpDpO4U8SHu8T3Yk53NcnIsA?=
 =?us-ascii?Q?4lePLuvzzRw1XUVnTqQLN81Bg52vH0q8ewYSG8mr9x7ybsc4vvDGvX/zHaa8?=
 =?us-ascii?Q?YwU2aoxiatevr+3guhLRhFkcZ4CvlTwtAqhBqOFXpsCIzGjRqoRPbkqigcn3?=
 =?us-ascii?Q?JY+DtfbtR2Watue8Hxpk3DrY1be9f+WT6vK4yRBGauGiTLMiB1uM01oGv69l?=
 =?us-ascii?Q?AD1HDdnvaCdabW78ZcCvInmHXHTQ97mYFSE+ko1xa2jEkn1mt326t9ZDBkzu?=
 =?us-ascii?Q?QQl4KBpvLVEpyM+/akoXG2hj0FOyExTbS3GfQKNiyDLljhsuF9KE+HPSsays?=
 =?us-ascii?Q?yUsAeDcZ4VH3sgn9gn54uSVdmaQR8TDW0W82/AV1N7LWsJ6jHSkAYWp9d2jx?=
 =?us-ascii?Q?34sApgQ89aHfqCIFjsYphnsvLeJs0oup7H0CJaFWi2lmc3WjsPWHYzpx9vWg?=
 =?us-ascii?Q?H/xY2NgDZKrRhSDOLTOKQMhjMAQ97BVRYnyt3F2p/nAO85hH1ZuYAttra/TW?=
 =?us-ascii?Q?PAQdGQ0WY+MQIhY4VjosVEbQJYZ8/3qDxUBHEK8T0hKel1Y05albxPnyP96x?=
 =?us-ascii?Q?9acsMtxYo2D29kMUMCSebZdQaXf+2SgfjYOKdWm5FFsSOXngCzJUp4ZqRc9h?=
 =?us-ascii?Q?GZkN4gBRPTBVxo+PvOxzUSx53X+5Nn9Eq1OuyZxOJaYySHFBiVIYjW8xqyzp?=
 =?us-ascii?Q?+jcM8BqxjTj3Vg3X2c8O95Cwq8qrDfSq9FT7NYBLxcxTHttfPamykrW55lAv?=
 =?us-ascii?Q?8x86FnmjddtFw7Un4t/Dv/eJ/+Gmieg3aB/QW6DhZKsWYuGxDBjGoqmZj3Lv?=
 =?us-ascii?Q?ysPd4efVGxEgFKcmg3zJwB4qmkmTnQ9hJCvGeHSM7hiJFTXWXvnRIEkJ0FNW?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d71adffa-701a-4525-0033-08dcd1c3f0d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:11:08.9539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amSdGdpy2J9LOKfckSYQORXZSXe1e9/0NJEZZ1VzfefbDZCHkU5UQ2E/hO2vZseJlmkmR+OdjBx31M/GRrE16A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Fri, Sep 06, 2024 at 05:08:14PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 39 ++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 7d7bd0be6233..2671ce6b1a76 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -239,11 +239,13 @@ static const struct xe_mmio_range xe2lpm_instance0_steering_table[] = {
>  
>  static void init_steering_l3bank(struct xe_gt *gt)
>  {
> +	struct xe_mmio *mmio = &gt->mmio;
> +
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>  		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
> -						xe_mmio_read32(gt, MIRROR_FUSE3));
> +						xe_mmio_read32(mmio, MIRROR_FUSE3));
>  		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
> -					      xe_mmio_read32(gt, XEHP_FUSE4));
> +					      xe_mmio_read32(mmio, XEHP_FUSE4));
>  
>  		/*
>  		 * Group selects mslice, instance selects bank within mslice.
> @@ -254,7 +256,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  			bank_mask & BIT(0) ? 0 : 2;
>  	} else if (gt_to_xe(gt)->info.platform == XE_DG2) {
>  		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
> -						xe_mmio_read32(gt, MIRROR_FUSE3));
> +						xe_mmio_read32(mmio, MIRROR_FUSE3));
>  		u32 bank = __ffs(mslice_mask) * 8;
>  
>  		/*
> @@ -266,7 +268,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  		gt->steering[L3BANK].instance_target = bank & 0x3;
>  	} else {
>  		u32 fuse = REG_FIELD_GET(L3BANK_MASK,
> -					 ~xe_mmio_read32(gt, MIRROR_FUSE3));
> +					 ~xe_mmio_read32(mmio, MIRROR_FUSE3));
>  
>  		gt->steering[L3BANK].group_target = 0;	/* unused */
>  		gt->steering[L3BANK].instance_target = __ffs(fuse);
> @@ -276,7 +278,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  static void init_steering_mslice(struct xe_gt *gt)
>  {
>  	u32 mask = REG_FIELD_GET(MEML3_EN_MASK,
> -				 xe_mmio_read32(gt, MIRROR_FUSE3));
> +				 xe_mmio_read32(&gt->mmio, MIRROR_FUSE3));
>  
>  	/*
>  	 * mslice registers are valid (not terminated) if either the meml3
> @@ -380,7 +382,7 @@ static void init_steering_oaddrm(struct xe_gt *gt)
>  static void init_steering_sqidi_psmi(struct xe_gt *gt)
>  {
>  	u32 mask = REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
> -				 xe_mmio_read32(gt, MIRROR_FUSE3));
> +				 xe_mmio_read32(&gt->mmio, MIRROR_FUSE3));
>  	u32 select = __ffs(mask);
>  
>  	gt->steering[SQIDI_PSMI].group_target = select >> 1;
> @@ -494,8 +496,8 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>  		u32 steer_val = REG_FIELD_PREP(MCR_SLICE_MASK, 0) |
>  			REG_FIELD_PREP(MCR_SUBSLICE_MASK, 2);
>  
> -		xe_mmio_write32(gt, MCFG_MCR_SELECTOR, steer_val);
> -		xe_mmio_write32(gt, SF_MCR_SELECTOR, steer_val);
> +		xe_mmio_write32(&gt->mmio, MCFG_MCR_SELECTOR, steer_val);
> +		xe_mmio_write32(&gt->mmio, SF_MCR_SELECTOR, steer_val);

what's your threashold on the places that deserve
struct xe_mmio *mmio = &gt->mmio; ?

3+?

But no strong opinion on anything different. Just curiosity.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  		/*
>  		 * For GAM registers, all reads should be directed to instance 1
>  		 * (unicast reads against other instances are not allowed),
> @@ -533,7 +535,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  			continue;
>  
>  		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
> -			if (xe_mmio_in_range(gt, &gt->steering[type].ranges[i], reg)) {
> +			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
>  				*group = gt->steering[type].group_target;
>  				*instance = gt->steering[type].instance_target;
>  				return true;
> @@ -544,7 +546,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  	implicit_ranges = gt->steering[IMPLICIT_STEERING].ranges;
>  	if (implicit_ranges)
>  		for (int i = 0; implicit_ranges[i].end > 0; i++)
> -			if (xe_mmio_in_range(gt, &implicit_ranges[i], reg))
> +			if (xe_mmio_in_range(&gt->mmio, &implicit_ranges[i], reg))
>  				return false;
>  
>  	/*
> @@ -579,7 +581,7 @@ static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
>  	 * when a read to the relevant register returns 1.
>  	 */
>  	if (GRAPHICS_VERx100(xe) >= 1270)
> -		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
> +		ret = xe_mmio_wait32(&gt->mmio, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
>  				     true);
>  
>  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
> @@ -589,7 +591,7 @@ static void mcr_unlock(struct xe_gt *gt) __releases(&gt->mcr_lock)
>  {
>  	/* Release hardware semaphore - this is done by writing 1 to the register */
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
> -		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
> +		xe_mmio_write32(&gt->mmio, STEER_SEMAPHORE, 0x1);
>  
>  	spin_unlock(&gt->mcr_lock);
>  }
> @@ -603,6 +605,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
>  				u8 rw_flag, int group, int instance, u32 value)
>  {
>  	const struct xe_reg reg = to_xe_reg(reg_mcr);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_reg steer_reg;
>  	u32 steer_val, val = 0;
>  
> @@ -635,12 +638,12 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
>  	if (rw_flag == MCR_OP_READ)
>  		steer_val |= MCR_MULTICAST;
>  
> -	xe_mmio_write32(gt, steer_reg, steer_val);
> +	xe_mmio_write32(mmio, steer_reg, steer_val);
>  
>  	if (rw_flag == MCR_OP_READ)
> -		val = xe_mmio_read32(gt, reg);
> +		val = xe_mmio_read32(mmio, reg);
>  	else
> -		xe_mmio_write32(gt, reg, value);
> +		xe_mmio_write32(mmio, reg, value);
>  
>  	/*
>  	 * If we turned off the multicast bit (during a write) we're required
> @@ -649,7 +652,7 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
>  	 * operation.
>  	 */
>  	if (rw_flag == MCR_OP_WRITE)
> -		xe_mmio_write32(gt, steer_reg, MCR_MULTICAST);
> +		xe_mmio_write32(mmio, steer_reg, MCR_MULTICAST);
>  
>  	return val;
>  }
> @@ -684,7 +687,7 @@ u32 xe_gt_mcr_unicast_read_any(struct xe_gt *gt, struct xe_reg_mcr reg_mcr)
>  					   group, instance, 0);
>  		mcr_unlock(gt);
>  	} else {
> -		val = xe_mmio_read32(gt, reg);
> +		val = xe_mmio_read32(&gt->mmio, reg);
>  	}
>  
>  	return val;
> @@ -757,7 +760,7 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
>  	 * to touch the steering register.
>  	 */
>  	mcr_lock(gt);
> -	xe_mmio_write32(gt, reg, value);
> +	xe_mmio_write32(&gt->mmio, reg, value);
>  	mcr_unlock(gt);
>  }
>  
> -- 
> 2.45.2
> 
