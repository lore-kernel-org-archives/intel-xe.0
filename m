Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63126E7717D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EE410E0FF;
	Thu, 12 Dec 2024 03:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWfdLwdK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B265F10E0FF
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733973038; x=1765509038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ASdjDJbn5ccgj3A+f4/6ifcl5gAsNb4I/XyanjfMGfE=;
 b=SWfdLwdK8ASmJrlXXwTZwQGhhWWGPoWgMlBjngqBS64TBH4Wv2FTqnTA
 Ktp/463oilO0bAqRCnR797pLEoc6OmGLd+WBMlTqakMIAM+7VWWBIRtjJ
 L1BW06sgGZk2QAZHzmyEmDZQ6XIivIEHGADU7COUT4P5SJKXAHSZ2/pYu
 GXxRdicOUK7O8F7p30UWEGFJ1xYRWlN6oO8xTy6KZ9DKwSpfKWp8iMmxz
 f8NEjB1aT5RBH2/1MFASiPaAP2O+V+gFVJTJEpIzuuqa34F87bkkqGAad
 DDHKY0jWBk2F+YEY/29tClslTdeeoeqtDrNHDgovJeq4/2ac79q2ogvH/ Q==;
X-CSE-ConnectionGUID: ZbgOradoT4GUbsOUGzdtng==
X-CSE-MsgGUID: QrBE19EzTy6WsogZlzag0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45387595"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45387595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:10:37 -0800
X-CSE-ConnectionGUID: k9gwouNWTKW79tciHGxz4Q==
X-CSE-MsgGUID: oDd2ChPyRMOnfbEm6YFW4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="95838312"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:10:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:10:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:10:36 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:10:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szDiJEiBa5o3zCyt555BJl+KfuVccPHcb/wiGI/oZFtsbQg+fYi/C1Hy6IXeuEI39YBMry8dmQAWpsZoZ4e+D+TWi+guS4MZEyTDml5QSixzlcLOWt1xcH/l9mejDG+MoZG2aW6fwqzLbxl6rpwzBSi7fSYNviCAC65WSM9Q62NBBa7OA8f0zA7Aw1Sk/biaycBjUCc5n39vFtWDDmLwaOzBzT1KuHLS16AUizX0E9qvsf1wDudTDoUqU+3ZYm8Q1dQNcxlSRKJ3+ddi19yFUoUUFsWaumHybESQ7sbEJ31HlJxNNgJZ4CV9fKB52STW7ZS6dJsPOgmLD/i1UreoEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38Uyx7v72/nXyialgNyq+3rqMMK5WizNvqxlPUeLfog=;
 b=Tc/OfWv5eRhnAJN00bpUczh0bk27q/lnWdseOjmy3f6QON28WJkq6fUDyfcAgoslyRqIb+/XYxf1rej6tRF9stZeElp6Lomk8wi6c/AXr3YKcQZdDNGWS4qFH3Pp0q49sVNWyQwnudnUH9wyQU0HpKOHlDBd2mny25sdgd2c6K8qbrpUHqFWiRzw4m0i2H6ef6l8eKXEGjNu4bgcpJ39kmhIqKHm5OmJ47tyl7zNV0Oi7CoCqgqAYcFV/qjtSXQtItdMy7J/+HKmBXOagSNhqg7AehOWV4wxPS80s+kzO6EAkv3XX/S9NKN/EYQ9ROLsHiOrBm02pcXsv2Shq0SF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7785.namprd11.prod.outlook.com (2603:10b6:8:f1::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15; Thu, 12 Dec 2024 03:10:34 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:10:34 +0000
Date: Wed, 11 Dec 2024 19:11:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/13] drm/xe/sa: Tidy up coding style in init()
Message-ID: <Z1pUU1Z9LxjiHMUv@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::39) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ca8569-c2bd-42a9-d502-08dd1a5a8b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YJxt0h5LGUG32LNMqaxWexZH4PEDbbmEG5gFRbqQq18VHWbed2vPBEOXXQXY?=
 =?us-ascii?Q?HAAJjtt4w7GxANO5b+DajAY8b7WCOJqpnEu5oh2GQjwiC8/QJOM3QvzgBOiO?=
 =?us-ascii?Q?FfWp3VwmLs4YjYFOoX3UJHsJxwdn6uI01wVnmIqS8ARn9ADBUdZvYK6pgeC3?=
 =?us-ascii?Q?wTAIMtsp5tbzPQDeN8sLcNw7lyBL7ch1Y0F3QCP69dvataV44hHTpZX+kj3i?=
 =?us-ascii?Q?ILURUA7X4RXNvp2GfVFJq7CTFj4eQLqGewjyLijOxQhpK8XfODUod479wMM/?=
 =?us-ascii?Q?ZLl4uRU9LKC9yGcV8VzqI5nCNYQz/0qsSqVLM3TeW7N5PgY1hdK5RHBilxMR?=
 =?us-ascii?Q?fFlCEHpkpGds+2GcQCD87SJxdFbrK7BS4yFqyBV1fsf9VmGDuVbwuLKPLH0i?=
 =?us-ascii?Q?GjUdJ6OalVkFjXc9Af+EVLSUyOzhxYDMqSdgNQ27fnKX92oZjt5TtdsuRtk8?=
 =?us-ascii?Q?1bt30bKMWGrDnbZlbHWXUE6eelj9kDfrpr2NI5hpAd8zPgqqGJL/8oNhMC20?=
 =?us-ascii?Q?jNRRkdrVYNa6pDU7GCLZyit8RaSGd8Bj3SOWpHrYWh3lug0lzPP8tzwS9O3O?=
 =?us-ascii?Q?Dn+YuXJe1MoKCk+ABIzMSiYc/nz/qI/jIxq/yd/DuJ4q71pLgmk+09Sx7p2v?=
 =?us-ascii?Q?3BwSTtXsgCO4yPdZjdDg0ug40n92vyfK1/9G6s25N3Y7Zx6eZtU8Prm/+yHp?=
 =?us-ascii?Q?fmUsFFlkwg8g6+AxDbXp3WMwi0QSisvl07j/jlnBzC9waXsOdNeJWA9D2TRa?=
 =?us-ascii?Q?kEiqy+0tR6GO85866lizzD+1omjcZZXvWsM/f2fEWLxwk6CJWTNh+7f9AHSx?=
 =?us-ascii?Q?KP5UEa951STNcEZQH2e/9WdTDzs6G4jGyhNNzEAtoTcsqUcSxf+oCk6NVhid?=
 =?us-ascii?Q?nF5ClpsfoKYL2gJAyP5f+KcQt1i+RcVeY77wKuK53OVA9wZXQZdH9QAOfVO3?=
 =?us-ascii?Q?amV+fya8WM5N39ibfQrPXuJshOrSzTj4pKlFdu0xR1TpzSrGFu65pCdFnhHp?=
 =?us-ascii?Q?6SoHI0lmjrt5SGC1OPk/YfJdZyyGTYQHJxCCPamqpbtdAXkkcBzhg6th7WUn?=
 =?us-ascii?Q?zHJPPEjEIhYIqKJ1iUIVzbVG4r9W+YRRc9uRK6NXuaWVi08w2fcw1iPjTQ5W?=
 =?us-ascii?Q?J6EnEkW1VjGxIjuMcBlN37lkKOTHN8AJXd2D9r4h8VHR4rptICMu9w5EYzz4?=
 =?us-ascii?Q?w7wJpAnORYTofQgmfmOVraEZmNwCVwi8suS5awXIHqXYS3iTa5vDvSlF4gTG?=
 =?us-ascii?Q?MjU1l3TAEOsIO/wYBct9z4aPkWvRdHNFlfNSQT63qagJNrYjwfHVOeV4i2TW?=
 =?us-ascii?Q?UxAH64haMMha3gcBCsnrAVeGntr53gP0Byl3vbxUfjVpjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OhNJQ7SDS8aFjXM6VMRd+It/8SCAycoQD74zGmS/S/j3JhhVLCVqgxw+tC0f?=
 =?us-ascii?Q?iOFc3iSy0wrvTu/DDyCyzlct3cI9/qEHfAHMl7IgFblOPNJFxZckeV/Vl3T9?=
 =?us-ascii?Q?WxDj928HS83dAFOu9dpcYPJBdcEagimrpIOsNLNj5fJNszS5hKpMiuZEJ4Id?=
 =?us-ascii?Q?f0pSnJyx839GYgpmGDTSYRvuTcLK63t8hssaXHmyS38kh/Gw0b69jfYvGVX2?=
 =?us-ascii?Q?xCujN1wwnkLtZbvx/kU0ocNq4BxPahVPPsSQyfcBZXtmGyqjmAAI769Z7QFU?=
 =?us-ascii?Q?JAVlj0+Q6zTmuEjGduLlaCgOtpQy3v+H+eKJL2yn5Uu+WTRuXfEwPHCVfTdw?=
 =?us-ascii?Q?b8W/1AElw5YYGWP6GOEGQIAGCCZRmXWQ3/krS95Hp3KovavUh0nX9GWgbeec?=
 =?us-ascii?Q?S4yB49QyOv8qFRduXk/htLa11UrKgO62yf9iyCrLyXyRnLNS9iUNjnivieLV?=
 =?us-ascii?Q?+jDqWk7L1XMtY5d8tGuuMbsX6Dpm7xdyOycixzG7YYJ1o00RjWvQC8CYSX3t?=
 =?us-ascii?Q?xzuGRL/Eh3brKtUcv7gELRA/GltbopYjeFupoxLrEuLqqJf+8zZ8ONd1HY8D?=
 =?us-ascii?Q?RhQEjFqy/9i5B+s+5DRHiveNsuirSGy8Cw7eYXov4Onm76Uj+eNQds4/nvz1?=
 =?us-ascii?Q?wYWaXN3C5XVUGA9FZGpqvIraq5bJ44fYvzRIDnHjDDxWCkB4lt+SpK0Bg1Wa?=
 =?us-ascii?Q?TjyVAGNJZhQFxPuYepRFGkF7vJwCfm8iVz+FNdCpsAP+/4Ts+K+QJYrQ75Kd?=
 =?us-ascii?Q?wVtOH2SJBncDU3q2NlHD1y0+b3rXdX/ZYgeET9D9tZlNdC1a7sn7YDB0huQW?=
 =?us-ascii?Q?xvESyZHT5JIcehc6w5knTA367SACS5kJMoCbF2sfp1ZclYfQzvj9Nxt0qLVk?=
 =?us-ascii?Q?p4KtFgSX9cNi/kk9UNC5hC9PV//+0V5j9KAAjeMXJIM/oXoZOxI6hD01lWEy?=
 =?us-ascii?Q?ELIEcBDz1vJykPFdFUCJSBcO/tXVu1K6lX1YtZgMUTGOPBigreV/536Q3Qch?=
 =?us-ascii?Q?jI4pEnKjaKFyFQGe1Mybn432egmeaD+yKh07huYifFr2OaoLV9IOjoblRM1Q?=
 =?us-ascii?Q?eR6usTYVBK8ElGwVXF0D5PJHhzqa8Ea4D+CVU+BMFAuEGF1NGLpY748+9e/b?=
 =?us-ascii?Q?yTB/BAnIyt7ryAwDKbk7c9Z4NhmY5JrPKb4376Fakj7o6IZmOSIxgzX2l71H?=
 =?us-ascii?Q?xcv2V+ljg/DqBPxlOpkBStQxwTtc8P9QPmn0tB71lZS+KkoQSQVn0IE8FTId?=
 =?us-ascii?Q?GOcWYTwpriy0x/bYjCKtrC21vBejAZIJlM8cAaJssHBi5M3mdHLK0FoSU/PF?=
 =?us-ascii?Q?pHgkDJb/ty9YORgygh/qNT2qbKwYzES2sMqwLVGDGaaXw6UfPTsVjaKGyEVt?=
 =?us-ascii?Q?2maCizaFYQ/zPdDmqEMlPOGi8HLGnmrt5ZaAsh4zKSO21r69YQ4gkFAAwmBL?=
 =?us-ascii?Q?APCmtl98SuqEimEyIcpokPRf9PYh8RvsZPWW+pQyF4uIKBOC1TiVzauFf/Yr?=
 =?us-ascii?Q?BKcfHz2sT8nw6h2jN9PvnysnXjhoxp8wO1YbmktO37DeAb812+pE52cNymi/?=
 =?us-ascii?Q?NZKGOgEi1pPjvTm7MiwKcqu5bBZVL0kecW9JMdV2PQ9nIMIoFVgZzbGb/I4X?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ca8569-c2bd-42a9-d502-08dd1a5a8b31
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:10:34.2307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0MvtEDSB21hizGE3lRFtmdyJknLC0EvKf1eI16glc1c0givPyR0iTIeaiY1cXyFrpCF26zsa/gtWUWyIBEasw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7785
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

On Thu, Dec 12, 2024 at 02:01:34AM +0100, Michal Wajdeczko wrote:
> There is no need to use tile_to_xe() since we already got the xe.
> And we should keep all variable declarations together, no need for
> separate sa_manager declaration.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sa.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 94d22371af84..704332ef795f 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -35,13 +35,12 @@ static void sa_bo_manager_fini_bo(void *arg)
>  struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
>  	u32 managed_size = size - SZ_4K;
>  	struct xe_bo *bo;
>  	int ret;
>  
> -	struct xe_sa_manager *sa_manager = drmm_kzalloc(&tile_to_xe(tile)->drm,
> -							sizeof(*sa_manager),
> -							GFP_KERNEL);
> +	sa_manager = drmm_kzalloc(&xe->drm, sizeof(*sa_manager), GFP_KERNEL);
>  	if (!sa_manager)
>  		return ERR_PTR(-ENOMEM);
>  
> -- 
> 2.47.1
> 
