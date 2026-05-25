Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8615CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFA210E3B7;
	Mon, 25 May 2026 18:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTbO6dKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1966310E3B7
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779734765; x=1811270765;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SPgISNiSvIi2fHirvPb7RfMSA9aYb+L3KiKMuIZpnbA=;
 b=ZTbO6dKCwRqGHzpUs+bGrWY34YOF58AvWS4UdLRHsQUNWxWBdbzBI3a7
 CMRupENuY/8krIaZC4ckVsTPPZRj/cIkXP/1Sq0Pj7Uv42qnN5Nkq4JH0
 pqP0HhX9vre0bVSkfHvDiZs8Sdd0ELL5Lkpcm2pKCyiyRSl0WaRCH07zA
 NZwn8ER+R7XgQhIbQE9FFWeE8S5siW/qD0ll4zPxqlAF4GVJu+DO3gMkt
 AKGRcVhuZgRIAD6W0edzlJNply+pwA/xEJUXBFpQ6FQESROLZUWuObxGt
 z72stbg+Y+V641s6uyykt6yGunpew/Vtv8rNnA4suctGO5igYjnr44+6v A==;
X-CSE-ConnectionGUID: T4p6QR9ARsKc4MROXnXf+g==
X-CSE-MsgGUID: rwOjpV0KSjuzSrkBYtjfmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84177356"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="84177356"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:46:05 -0700
X-CSE-ConnectionGUID: SvV93e8sQFKdbZY5jfW20w==
X-CSE-MsgGUID: 4BAuDM4kRrm1GCXGaqO1OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="238654411"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:46:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:46:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 11:46:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:46:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjEcfiHHzUnlZbLfUY44n/AUKu6EPBhwSqEIFLjoO/bLLafdkMAHZ/niW4Rp2UsQnA8JmfTpUJgtrHG1oqpgqUPSlAkCIV297XIO6jvW6tFW5yz/hW2d7NZlLOr+L1LSF66Y4Z2Eu8Cy96fsLLueTIyGWXSvJUpskEN6Hmz+fnjKsB7xPXtPAqH2RbDOXNR4ryQE/7Y80D/dHev1vxWgYPDQZlnIfn2UVWy0npB6soJcxn7SWwoqPl7Um5qviqtzqaf1BJhAKd47G6hXm7q+DbJInA3luw6AYFSI7O+bDMG4pRpZq/nHvAzEiPhXM2OO92kHy1fxWdc7TojJkdvLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=digceb4MYOPWHdINRK5+GRWZUwJ7uTynFHaIYRYT4P4=;
 b=S0AN+1NTFRSt9yKQggXg/DT2TGOW8trPMvCyCbbWAm9U6LuRqtOs50F5FF0HEaUzzW5Rfxe8xInt8DcOcsJjH0ZGEwtoaozBYMI02X8hxsDnV0OvFMzIApnNi3N19xixLhHyQkgAHJHDhBUn9Wkc03Hz/gznoms7pbbP4VnLkBxZqSwg/EstYic62n/rubMkyJNe7NnqBE5MR8GoR8GJMU2cGqWp4wFLDT3As/ETF19hqYDVuU0Nzlc6PgobnYeO/QISVwuvYJNSolup8xmXKRi/DOZ2fFPs+7+HaFRPCp+wde2u3tT9P0NZuBiHUPxous3kdKAfpasJbtqSoEV/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 18:46:01 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 18:46:01 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/6] drm/xe: Drop unused param from xe_device_create()
In-Reply-To: <20260525160529.15890-2-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-2-michal.wajdeczko@intel.com>
Date: Mon, 25 May 2026 15:45:57 -0300
Message-ID: <878q97iaze.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bed6af5-0b65-4606-3b54-08deba8dde22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xxwxv3A/rRvrbO22rp8ht+arwLSezvAXWp0J+GsTO1aI2oNSI/3QZHj0QIaJvnrrpzvQFrH5vBmNog2NOHUTuJ2J/Bkm3blqUTBnLWm2RbymDtAsqmc+kgFNyZlCWIrhJwfHY+YqAaCNsoksAJocKzrerZwaoJWUzlg4pCcBWo0z/RYXEM9NmnbbabXq+BPO3jLz9xuY5FZ64F1vMmNsPLUdsPgBu6AZ4wUk5KpSScY/iMojBO4DBCf4Y+AGSN4D3jNdkjlDf0sOtr5r07hNTizE+j3YdRukIVGkzh7kcGaLLhY4SBE8VJSb4krB2q5Lbu4X72U94y9lhUN20X6OQTay0UEiD5tSj1eboTEJa/O1EEFB16LZ+kmGX28Vx6M2ecMFV8FAkZzFYdqLzWwNqqwSFTBEQMFTFal2gcx9LsL2PrUDAMS6kMYV7Ko5hUjEgnrZe7JBSczAEyoOMtB6skrrnMK0yrNmHuTdEIXF5qLpL3nyAwsuaDAx1eD0s0W5Kf07Af8eyCNzxD5gQ24N49mu3qgsI4xGeoIQdgK06u567jVcBXqUmG/L8EsCnv4YGQMgZ7x/DhPb1jz0UsihCN9t2GJziU4CWRJKTmqqJqFu9pGezDC928Mp89ZQPQ7KHUXNiKpj3Lq9xAdOVctz1fe2QMtGD0tYWXocLzgQGDNQfk5AOVem+xYYvxxiZqzj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VuEQ9AYdkdhFELmtEWlVnd34FN1Gjuym++FISEMZt7p5mjrMCIudPylv8Hn6?=
 =?us-ascii?Q?udWzX+EVkOUM21RESzhz+hY85pyu2UhV9+HM+85EMNH9f5GWyyyp5GaiVJWx?=
 =?us-ascii?Q?pSVGg1l4gLmnoSUNRxBUAph/Hkd06brmIh3Tq11IrcxyPxjHVHffwgUTBq+n?=
 =?us-ascii?Q?OYRG2iv2BfivVZ20dFz5OT5+ovK2eH7Ptzdh47zgdbvFoLLiAGGZj2+1uQTw?=
 =?us-ascii?Q?ONVY35im3xqJnFlw0+mDBydkjV7WAGYVr3Knz+ffMiojD+twpfa5W7enIGjc?=
 =?us-ascii?Q?33O9onOdlZ2QgKQPV4azHZawOH8ThPfkLHPOhUqJCrpt9zSMhWKHiCRxJZsX?=
 =?us-ascii?Q?CcqdW4yrB5Au7bUH4GgxF+UPO62jETgDtfVNvY5ETCPQBn7pJqrvCjHs/rih?=
 =?us-ascii?Q?6hIY+DdCoceDbENLCG/sJaY7LWmhDfD7G6Gt2NW+x05cLWg4S71WjwEcb1Wa?=
 =?us-ascii?Q?1pEyseNoiAocb//MRpjQRnlsKxCjlEnwAv1l1oBS/HIXp7fRtzWtIBX+inHZ?=
 =?us-ascii?Q?+Ker0YLdLdWRK9Agn78RFhYT+xTtWKKBnUDTaYJ/qgcWFPbOeBqZKJ1v8O7u?=
 =?us-ascii?Q?MTi+dEt+kW5X/woBvtM5LirgtFmju0iPTThAqHknhKMuKEG4IT2/SHhOj5F4?=
 =?us-ascii?Q?og/ktgJ2j9u2yjbcteWfc+MdtMs6YIpqKm9CxVVH1AmhyL6+HpFeAmjEo0c1?=
 =?us-ascii?Q?+0nV2pH1NH8pTx9BQ9pr6mRerywVuM6jYKWd1jT5AGXsPbepP/eG7x01iaaT?=
 =?us-ascii?Q?cFB+pLibYryYXhkYpBifsGbkkxtlqAO/vut5HZHcKVeAZv6QGlKrbO1bZjA/?=
 =?us-ascii?Q?jBfgIrFxwIoB0Hs7iAASbDLUE3Bc+8Mq1twdObmQ6d2CR8jzdrXYJVH975E8?=
 =?us-ascii?Q?TH7yLNaoZz3Ndjk6NqbjHgjbkbQVOZJ/p5cAYd0vgmAmNDxTlJeqkafbKBUD?=
 =?us-ascii?Q?USPQ38SMWZ8Dg4Ejejv+DVk9uvQXMGbSc2TPVEkEF1cfe3gCfCVf21WgsT9P?=
 =?us-ascii?Q?qeaqgT3suvpVZtS0+5Mz4DMiIPDDsaP+KKseyKnKJ34lwzehYqAzMf1/glVe?=
 =?us-ascii?Q?58sHoOvYbpfw15HUamwPPUAswkqIo0VC61FPz6JyW/m5uf1kbn3vdEBL7Xmw?=
 =?us-ascii?Q?LSOUf6DA/o6Bq9NIXZq0Z6jKDS0dgc2ez3X8BYRF6jCrmBL1poqSYmm98ADt?=
 =?us-ascii?Q?rArE+r5tVnhNyUH5sga8L0ncRIeBlBkt2DZyrGvh4RUy/yOB8LNNad/Mww8e?=
 =?us-ascii?Q?kXtu98PHioRXZi3wYkuqAx1Yz+snbusp5kRj+awmd6zojKPAtHkAVmmdDs5N?=
 =?us-ascii?Q?3mtC9k1kzC2mm/IHY4cI4aYzVem+utD/yrGez1v2dG+mU4rp/CRezmG5r5ro?=
 =?us-ascii?Q?8cRC+7BWKXwTlbw52yfutVs/pr9mAZVkQ9x6a/NzfnDtlyn86akA7QqmKj1S?=
 =?us-ascii?Q?yZW8Vun7GLuj69qSzFXVgGdPqoEpZcibg8lbc+lGAZGTzjZB7i3tkPD1W6r8?=
 =?us-ascii?Q?tWwugL0CBpO9gpmRKq9pSFQg06u7PJtu166LCMPxzWEQUcCfS/ebELm0uLd3?=
 =?us-ascii?Q?F6wVMp9T+N/UmGxbuzy1MD+ox2sz/Mk0opaEFaUfwJ5qjZej3khGms0919oE?=
 =?us-ascii?Q?dzTi2CtJ/1ycgcA/lWj0xXwFwo0btZvYrr1EVBetCeAgeSm4A/IIQ+CyrjJ6?=
 =?us-ascii?Q?F9QlW2je4gp5ZSiorJ0N+S53NbXGa3cCd+vMnjFEYwu12vz0JMgkUb7fqr5M?=
 =?us-ascii?Q?CTPSrzlJmg=3D=3D?=
X-Exchange-RoutingPolicyChecked: DQjq0lq0rGiDLhif+3KqGCZAi7Bhio4zCaLwWJj26bRN1v0WKMCdTVxW9PuT3mvy+VGKviGvPfmgR5jpj+lr7bzhH2ouvG5gQi5OIPJTtFx6p//DbxIUhp9hJscbtBwycIhaEU+tNi6qQsdzhlScTSJAPFIG84Q8Yg4PH1dFpwtrqM+v1bGPdh9aXS+VIxCo5A9otVtH5nX/PN0YpsYPq0Yzf2GsXn8HmPFTcEJxW/prjUgjK1U5EgsCOA054H9rf2SeTve/4p7yD8QG/dhnO3z5Z22/kTsnVP00BQfExwo0KxqrN4ZVftOoLEAM6aQgBRWl56cVHby3+rNvtIhuzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bed6af5-0b65-4606-3b54-08deba8dde22
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:46:01.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIC5xcBsDiuIEp6vJ93HJlRy2jNkjn1kCbDiTsEZuTEFATQ0uzkInuXpqUW95Asmr3mhKa4ApVLOueRf3x2DFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> We never used or need anything from the struct pci_device_id there.
> And while around, add simple kernel-doc for this function.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 11 +++++++++--
>  drivers/gpu/drm/xe/xe_device.h |  3 +--
>  drivers/gpu/drm/xe/xe_pci.c    |  2 +-
>  3 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 576095cf0952..3f063e5530bb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -475,8 +475,15 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> -struct xe_device *xe_device_create(struct pci_dev *pdev,
> -				   const struct pci_device_id *ent)
> +/**
> + * xe_device_create() - Create a new &xe_device instance
> + * @pdev: the parent &pci_dev
> + *
> + * Allocate and initialize a device managed Xe device structure.
> + *
> + * Return: pointer to new &xe_device on success, or ERR_PTR on failure.
> + */
> +struct xe_device *xe_device_create(struct pci_dev *pdev)
>  {
>  	const struct drm_driver *driver = &regular_driver;
>  	struct xe_device *xe;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 355d69dc8f54..27cd2329b99f 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -43,8 +43,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  	return container_of(ttm, struct xe_device, ttm);
>  }
>  
> -struct xe_device *xe_device_create(struct pci_dev *pdev,
> -				   const struct pci_device_id *ent);
> +struct xe_device *xe_device_create(struct pci_dev *pdev);
>  int xe_device_probe_early(struct xe_device *xe);
>  int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e2a1232c4fbf..c2bf9f0c325b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1092,7 +1092,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> -	xe = xe_device_create(pdev, ent);
> +	xe = xe_device_create(pdev);
>  	if (IS_ERR(xe))
>  		return PTR_ERR(xe);
>  
> -- 
> 2.47.1
