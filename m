Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58DBC04FFE
	for <intel-xe@archiver.kernel.org>; Sat, 18 May 2024 02:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C4A10E00B;
	Sat, 18 May 2024 02:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVnioF+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790810E00B
 for <intel-xe@lists.freedesktop.org>; Sat, 18 May 2024 02:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716000183; x=1747536183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2GRcpVNhHkv4pakU6SBrCr0QU+9fUcP/QyqUz19P5CQ=;
 b=OVnioF+CmVmBeJPoSu+Lp8F+eFaXi0VM293qr/3fK+61EiMlRC6BlkuQ
 9FC55Qa6UJ2RFSwV/Pf1gAE1udC99U+/ALKJg+x1gyNzI2lc8Ol0Q8Qsu
 jXZ3TDvkPiueWniEIbyelX+VyUWtmIczt9aAZHQCEe3s8xYhrJyyyV+ff
 NYJ/loaLPLrNnysGrio86Yt2Zw2FpGGXiohX1bMrAHE8NmQjhkX979/Ts
 oK5Ym3PH4Pzq3p/PkguYTMd+lXHvT9ivqRVKkEsRlAdXxfNWz04dkFVPF
 2ADNGr7A73WWQbMgE0dZ70Fy70W1Fl82MkvPEHFzGX2dygMvbeGrFmG4P Q==;
X-CSE-ConnectionGUID: pwVI9lciT/Wr7xaHhyJWAQ==
X-CSE-MsgGUID: beW+EGqVQA+TavOyo3OfNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12047981"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="12047981"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 19:43:02 -0700
X-CSE-ConnectionGUID: /FwQRO2BT5mAesJJukDvaQ==
X-CSE-MsgGUID: IL7AtTn2R4yx+KmEDcu/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="32097169"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 19:43:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:43:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 19:43:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 19:43:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 19:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKJ5hGYEcetG81hMDiHwjiC01oulWN01PSNlCXyTYPJfANSSUCYK3XvDwRg9UuaC4d1eTIeRVuGLGy9nFlSXFXdmuvZHciCPkpyLebwL1IgVemuwBjvOlqLP4emPSufsYxdeJCpIS9iDSXucX/qaSMHf8VPcPPzor91dwrt35P3rjauuqm0RaevhNKVJPitMuwiLj1ATtcIvkZe87tCdrCdhoO1X4b1uoNW2SN8qX5jF4DNbA1BxGkapv0WRHzdj25Pl7RzQx1E1kA9Hj9SqLMBYZrGW9WHR4uV2935Zy18piCCPXJ+tXr3J6rVSuEXEtdea/N7au++mAjJ3LFBV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJC2Pd4kfmLSs1tD29sEqlXjiNMR6r1D437pc2rK+Ps=;
 b=g4vraHqWvwB9Ias4WTqbVE/VPwc7ydjryZoB+qaUyHpUCwljKXsrijBBMihPlFMHQjJ9oPzKy4WA3gEOFNyC3BSb+85FyTKdPU2s2pYiiwCcHqL3vLUb0N600qx1QbsCgmtbZXzBmkjr3J7OI+WMcMVnhpxkwj8KQN/qF889xPEM0hoAU2DhdnNVRIR1Jz4aTSt7gY0JRBv8a1WG5FNB7LqLzpojludBfxrAvwkfIbGe+3N3/ujdxaQ7C+gq+dFkE97RPE1YFiZLLGh3WrpCyDrrxaQMoS0AHCBx6mp7IF2b9IQZ8vJ1gS3oGA9G5K53bzerKpUe4/ZBIKWMmJ7nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA1PR11MB5875.namprd11.prod.outlook.com (2603:10b6:806:238::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Sat, 18 May
 2024 02:42:59 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7544.052; Sat, 18 May 2024
 02:42:59 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH v2 1/6] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Thread-Topic: [PATCH v2 1/6] drm/xe:
 s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
Thread-Index: AQHapmBvkqIP9+mNekSM9fzhMVntg7GcTTQQ
Date: Sat, 18 May 2024 02:42:59 +0000
Message-ID: <SA1PR11MB6991043564FFE0DAAEB9599D92EF2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240515004010.100091-1-matthew.brost@intel.com>
 <20240515004010.100091-2-matthew.brost@intel.com>
In-Reply-To: <20240515004010.100091-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA1PR11MB5875:EE_
x-ms-office365-filtering-correlation-id: ca0a48d5-4413-4509-cda6-08dc76e43b2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?dQKnoVXa9bOGACzvkig6N+0vN/zvhIaNzOK8NjqjyHG6PEHtNoa963qKZg2b?=
 =?us-ascii?Q?RD7mWBg6GQP0zZZlJJIzpTNyHZ99YfkMzSERMYOfTvl1+mH3g5Flvagi7xih?=
 =?us-ascii?Q?P90FaTsEkkFKRUgNRMYcnIgxzW0NGrLTGVHUiS4zaye/dYG6YXTOAcTPv7MH?=
 =?us-ascii?Q?6gV4C/EUmBjooXzADRwYsM+2y7l0gjCCc4fLQo9+o3xe6QOPknDaFBT5sw9n?=
 =?us-ascii?Q?yP0spaZjNQgZSXHSFRh2VJblOUYoqBsd0aGSv9C5jOPWOAI2b+iuSESA2esO?=
 =?us-ascii?Q?JeGzQer/mkIsFX5EcBnsfrEWtViZo+kIRbYLAZ2X9fZiEDlP8+5jxFTtLsP7?=
 =?us-ascii?Q?OD/gK8n7r6JtCuHgiPpKmw49l/MQfCOsknnPCfD7nVSrkmpqA8DCF4IurXXn?=
 =?us-ascii?Q?06ceAl0KbhaRD3DPXD73y5Ysejjdfoh1ulfDnNV/va1dokwoDiMo+xmlKqUv?=
 =?us-ascii?Q?NCaBQINbjNQbsfeyWFAqynPLtzM42n1ra3XF6h/SkrMaswtQAHRyehF2z1iK?=
 =?us-ascii?Q?RYcR9QRO6wi2XJeyNFTdkLKvk79oCnjnwd3SSZVD+Rt8aP07UJ4IxmdIUoUq?=
 =?us-ascii?Q?ZfZCbL0UJyt61Hve7TjMt3WM7Mdmo0LK7twAn3nwgIcGJNXr1+OHzrGw+F/Q?=
 =?us-ascii?Q?OsnGbfg11OCMPJwN7Z8SwEE9fFjSbXAmDD8AvBLy7GSIQKUCfXCMfhYgcBMk?=
 =?us-ascii?Q?IhozrnHjrH3C0iCHB1abbx+NcY4bTZNMdcceqPOJ9E8lLhLG4TAmjRGMA73l?=
 =?us-ascii?Q?5jMfwimzxl3MgvWOLuMdn/3chMFY00sWDNtjIX3xvrPmnHhv82M9ctr/zAoj?=
 =?us-ascii?Q?YFRPFiOi99mIoWKLhEEV29lbEMgi0UJno/Mt0bAizs4lCt2sg9zb+sha5GQf?=
 =?us-ascii?Q?Lh/6UM+4kWZ8HwAt7wf76sJgB9crWGlmM2bGQl2D523hSua+/anOYphL6/Rt?=
 =?us-ascii?Q?xdPi3bJdktIqF78UTh6/eeN2hBDxj9Inra5+KPqVBrYmFoKjQW1G9jqNYNC/?=
 =?us-ascii?Q?sGjxx5GZqauZdoFhqk016ctExFq+yLdVxAmJEL4rCsoA6djB2vpDWCyS5WIM?=
 =?us-ascii?Q?+gEeJXgO7nc69IP6xVBdMbBdaSw3Q1l+b6yvafiSrW84dHMJEY1xsJAbQQkq?=
 =?us-ascii?Q?dSacPoQ4IPm1uBUpuq9LsClKgOag7ZugiffyBTRQj/eH1tesxqpDDF/cjUUV?=
 =?us-ascii?Q?merkN4sy9zzYihR60/fiiacHmArZ+hpX2a178kLbkRbDFRvNMPbTQOWRI6hS?=
 =?us-ascii?Q?QHqW7ScDKI1YqEK1UUq1l1PDdg1ALYVRF5AZtd4SDIri5kyrzYb+pG3Uk5tm?=
 =?us-ascii?Q?ecELkZJmBSfRcFrus/9DHl2RPvjpgOKRIJF+sxx8OyJSZg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4m14gqo1P77J0gKtS8J9WAD4K2WSV+bqbSCTyxzFmIjt4vwDfQeOr8aPktLh?=
 =?us-ascii?Q?ZBjudHBXflX5ugiwKUo9pCNsZm1xzg2U+Si3LgrE7SSFXam0a09rV2yZW/zL?=
 =?us-ascii?Q?wx1GwKH7jFOjdivCrqtPbdV+fR4IqI/RIoMsOarBJXm+9CHGifjkmJPEWWHE?=
 =?us-ascii?Q?07uht+7axmsqBNw4eAGB2kzXN6PMuPgjzmxdGVHI8TbD+tK96ioY6cHNsUT6?=
 =?us-ascii?Q?uBg1Xa85YjjyUKQS7l5PV+KYfsM5C3J0HiHm1bh1wog8tzUbr8QVhdJLx3nE?=
 =?us-ascii?Q?u/1pJsByLQPx/VM5lUM69KqQq/uiIhwdW+awS2RTwRhZsEwr+gQU59t/FMp7?=
 =?us-ascii?Q?U4n1VPlquT64BBNFHtWMGDfwLwKmGD00FQKGaTOQymEGf2CgJApTUcou8nvp?=
 =?us-ascii?Q?tVGrr1TKyDLokIsEshBLHoaSOk/THwWN4ngcRj0wNaX0fPnpNBBht6YFOd5f?=
 =?us-ascii?Q?9KpNha0LI3QlQ9qzexC4z/AH266YdL7uxuqDrCaPhfEly/xr9pk+b/9bwnVp?=
 =?us-ascii?Q?hPcU55C/A2+4i0R3ZMihpQXwFpSKRTaDktYHZtZo9pMxLiyRcpp3N4BD4GI5?=
 =?us-ascii?Q?xxQ5S5MhZJnkvjx0viBEE8J9auyoNLwf6NPllwxlZIRKQw/LPMEHZuKWuRfd?=
 =?us-ascii?Q?TwvXFR9zUyTf1P48DTFVLQBRfO75ONdnT9Q2AXBtiLPkxrYZhkUI1xMcBeMb?=
 =?us-ascii?Q?EEXHSIIaLrsFzQPMzFUzVoGJOrYiMZFBhl0VyU2Zf1W8YydGMM5w4Tvg1Ikw?=
 =?us-ascii?Q?isHdhQ7s5TtcaA8Gabx+KBx3eSTQAr0zwSmlhi5ooAY/MDJL/D2/u6xycYll?=
 =?us-ascii?Q?P3RYSN0GqunvFdR+pooWIWHyLQYXgleNJNQXeMfxFwmq+/kDEtAgd7Jwuuyo?=
 =?us-ascii?Q?fjpe46P/zr3satcC/LT03h5AlUNwZb+K/AXiY+Bpzki4+nZItwszQPWFbpqJ?=
 =?us-ascii?Q?YwA0x8qyOwRocLPCYn9BbcF8JBA37g7/Wyo3nWQnpa45bifxJW9EtdjDHtJu?=
 =?us-ascii?Q?LTGIdT3jpO/gDSy0Ff6FX9dSA3DVAZ1i18PGr/PJx/b+CunaAg7gSTQe8691?=
 =?us-ascii?Q?Joe9TRFHSS0+tt6GulcaJCPDIb6hTjHjYSTaw4ua8WNmvhEeQT1HZbscenKP?=
 =?us-ascii?Q?PL372lbJO23b9pmTvW02QU3v2QFVoO8gXb4e3NpZZajkwK9bRioHRxxmqmiH?=
 =?us-ascii?Q?Af6DRqaYfYAIlwfhjs8i6h4n47hLgIdB9Dght3NRPziBKxpY3PiQ27HT4xPd?=
 =?us-ascii?Q?aVcej6AX5bzVbrh/4Pm8RhjSdITGrCXT2CM04gz9HGLJ7eKHDtcSSOZoUuE9?=
 =?us-ascii?Q?Fpc0DIX+J9+Em4xBfxLj4tCEjyXxcqVakb23rCUgld62E7q6M61DIsa9IQYC?=
 =?us-ascii?Q?fnCd8J0t1b9miU6WQX/bSNM6A4sXixYhKW9n1ZyhWJ1sHJnsqzTwd9KTbAOd?=
 =?us-ascii?Q?fhLC6WhHR0/EGSzzQbDi/MATwCRTGYPaKywDTaE789nIMqL4gchoevdDWVVG?=
 =?us-ascii?Q?Uf5cCHDrILuDx+uJm74tp0lg4M4wH0ynkONELMr9OVB3cHTDwuph/55Elp0T?=
 =?us-ascii?Q?gfnbXNzwE3pt643WyQ3s18AlAyT96NDNhW5vnyLG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0a48d5-4413-4509-cda6-08dc76e43b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2024 02:42:59.7060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7PahsYWM1t4I6cjfWBGfzTzZjnfDyi9o7SBLf0+jjRxAkeLd9G+mWm3bl3+WFPEAwd38PigvYngFqPBPCMM2Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5875
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Tuesday, May 14, 2024 8:40 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v2 1/6] drm/xe:
> s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
>=20
> Engine is old nomenclature, replace with exec queue.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 9 ++++-----
>  drivers/gpu/drm/xe/xe_migrate.h | 2 +-
>  2 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index bacb23de411b..eb52185662f2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -84,15 +84,14 @@ struct xe_migrate {
>  #define MAX_PTE_PER_SDI 0x1FE
>=20
>  /**
> - * xe_tile_migrate_engine() - Get this tile's migrate engine.
> + * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
>   * @tile: The tile.
>   *
> - * Returns the default migrate engine of this tile.
> - * TODO: Perhaps this function is slightly misplaced, and even unneeded?
> + * Returns the default migrate exec queue of this tile.
>   *
> - * Return: The default migrate engine
> + * Return: The default migrate exec queue
>   */
> -struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
> +struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
>  {
>  	return tile->migrate->q;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index 951f19318ea4..a5bcaafe4a99 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -106,5 +106,5 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>=20
>  void xe_migrate_wait(struct xe_migrate *m);
>=20
> -struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
> +struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);

From this patch, it seems function xe_tile_migrate_engine is not used any w=
here in driver?

Oak

>  #endif
> --
> 2.34.1

