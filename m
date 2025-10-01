Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E9CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 06:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBF610E66E;
	Wed,  1 Oct 2025 06:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3vWARUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461C210E66E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 06:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759300947; x=1790836947;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fq4Wy3CUrQ55aM2liY4p68gf/7vaTSDTVtN0U23wpjU=;
 b=l3vWARUerxZqXapJtp8Pe9wURkQ7CcpPUIUpLPEbKvcI+1OhRaq0+vVA
 GkXH3Ye93oPraGLGsn/E4rqrwCphp9O9UuxLakgkZ0CCDNUsmBQnc9Qpq
 8TscumjCT16lSHzyA6yfwPqzc3a/W49QEaPVs5bMKMCmKdbtdgWBkkM1W
 IHszc4r894jzIieJTJ/FiEAEH4WykrRqv/+NZJqNGv8cc67KRyz+p7YUl
 v84PsMWn8toqie2MS4hRURaD/DRrE9IdGbMILAbNxgklBMFdpldbPviZ3
 E/52Fvp7MHqID3ampbpxnp6wpBvt0cNWO3LpAZajDk8avL/bAaVO6d5HC g==;
X-CSE-ConnectionGUID: 75ZD2TZiQtmKdehl/6z3WQ==
X-CSE-MsgGUID: I5Zpa2+9Q2KdLeNSTyHEtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61674469"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61674469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:42:27 -0700
X-CSE-ConnectionGUID: 51nSeMvBSOirqDEEPADH5Q==
X-CSE-MsgGUID: 5gV/cf1ZTK2luKk4My5V0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="215850999"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:42:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 23:42:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 23:42:25 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 23:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M10GEKyF72IyhWArQFymLQl+k62Kndvg/HIUCDMQgTYXp9a8x4xMGYlwAAnvMF4axC5B31xS+QHPFnzNDgCQwq/6wsauEADDGSLVT4WjH7d0zICVTeBMc4ZRchHneiSKYEKO4tfHCxhPJAIkag1Fk+CvuLi9UwbC6QTbLjTARXT8kl9eXlF8M+1o4QIXtBvoK3JqoCaTuzZrueW1b5iNGKn4H4hTxT8e10xTHHPRiG12ha3+xILsofEKT0Vrzv2MK2aJOQa6XcnACSu5EhFvNf/Xk/LcY63ZQre5XEFj0876rz2Rz3PQyWWnOWvxHvP2yUA09fONxZF50e3SH1Tcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejSoABRbb4iLInRNadNEv93gkc8wpVMCGHXm+labzJw=;
 b=PS9FWKyoMAOv27pqWxaODwrdnpAapJxP1+nl3TTnfcUvkgttdOBU94/Gq9pxY+7LI8w0eVCq6fzQDSWdayoPxYnPGA4iMM4kH3rRxl6YaMPmqZFrxL/C4mGpsI/Dt03jKxu0vwZp64qQzSEIA7X6NW2EZS9x0nXvSyUjPRPJ4VLfH6za+RzGD7bWEevPR5IbyvQxP2a20h1VBvae4qb7fB5FUVFuWQLKY6kzgekqmmr/Ir/qg5A9KIao53WOzsPF6fnGtZ7zCSHRCTF/mqpmfkNWUpFbnEwAT0IooqXDSENmp24D9ed90yoLBRIXeqq56NRqBRH6J3068+/Q71+lJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB9474.namprd11.prod.outlook.com (2603:10b6:8:265::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:42:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:42:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v3 10/23] drm/xe/query: Report hwconfig size as 0 if
 primary GT is disabled
Thread-Topic: [PATCH v3 10/23] drm/xe/query: Report hwconfig size as 0 if
 primary GT is disabled
Thread-Index: AQHcMl7vR9UPNq978k+smXi9LKFn8LSs2C3A
Date: Wed, 1 Oct 2025 06:42:18 +0000
Message-ID: <SJ1PR11MB6204C7061F9367389AAC4F8281E6A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-35-matthew.d.roper@intel.com>
In-Reply-To: <20250930225618.140071-35-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB9474:EE_
x-ms-office365-filtering-correlation-id: c3eff435-652d-45d8-b0e4-08de00b5aab6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PCHT7wObxmnecIPD2zde+AswrDuQMkFW7tquEU0apf9wV4X07SD2WztqySRg?=
 =?us-ascii?Q?8pP0J5hgzu/yKxNFy0H43qEw1rHZTYAz8tnHmUyBAjX1JKcigr+/ivCdm5+U?=
 =?us-ascii?Q?0uXnljry9W2QIGikvlQhn3unw73m7xGUnulQy++S5zPwZwlartXOQ+s/UcVz?=
 =?us-ascii?Q?JOSa9zdfyTU0lQ5ckYblHkdCxvFj4BfUfJa5TwYG2r2gviOpKf4kDjCwCyMS?=
 =?us-ascii?Q?G7Cyo0nw8CYcoF0t6SDM73zr8gKAU11tLFfH48+6Gxgtg4KnGkc1JQGVmRrO?=
 =?us-ascii?Q?zZf5WxeAC3mK+qBKeeqGrQ0pc7ruN0XSGdzn6IznFGY96CtUf/4bJwyU5sdA?=
 =?us-ascii?Q?+yv+l6OD8mwWFjnuQijBvCqARIGqc6hUEIGtvFAhc1mtthf43LoPDxLACEYb?=
 =?us-ascii?Q?6C4g8oImnxbZiwXMHa8U1FyOOOM7WqbF5pz+7wJ5DlYVQea0VGL91Ik++wUv?=
 =?us-ascii?Q?FW8FuTd+38dumav1oHzU/15U0kOo5+7f01HkF0mIJdyJvIa4GYTzNu5M9s48?=
 =?us-ascii?Q?VkuaIlqckzCytbs+LhcBTf3K7iDmMBi995Y6/WuOGMOzTI4bywDLFMq9sK/p?=
 =?us-ascii?Q?5ptZM2lpg/oitBBUqblftzvOUGZPKd0ZaqMww5qjGjHgTDDMFwztUfPi9Zt1?=
 =?us-ascii?Q?G22ie6MqqiIhEZPNOrdOatzH47icHa4l4ZLHkOK0iDMx/OA6VdL3vqJX0XoY?=
 =?us-ascii?Q?z72xcobQAdfxzaRzUoQl5M4PagaBjITDw71bIV4mpycVqbJ04DHC1dWE1Ls6?=
 =?us-ascii?Q?85mOnXJngaZwOjJ840a2GEd0bIdkfOKZN1PLLklxK3KbaGOlW38YikxQWPFX?=
 =?us-ascii?Q?ToGDrV1+r3SuC9RR0ivq1GDoiI8gSMOcDlfaoO9SqQtTz5ip7qp3yWECxAmf?=
 =?us-ascii?Q?/qRjQYri7ng7MxnffY4utOJ/rBvPxeeyi477Sj0S6CzavA25PjbouY0UaMtp?=
 =?us-ascii?Q?DNqNL5iLgZMKEZ9uZIdgiFtJmhmfKHlp4Pnf11YuMh/hKfki/6j8Jshmsar2?=
 =?us-ascii?Q?Ue31JEjhTLPePl2mtQBIdyzOMTbM4UoCs2p2Fr3IZNQbLac+WOJmwQ05hOUN?=
 =?us-ascii?Q?mk6sZBAt290Xp7W1vYAFm4r/zo9QIsQm5/dbK3OKKwYt3oUqlSw/LKNHiTnW?=
 =?us-ascii?Q?vbKz3TMwKml4gve1hWXs1YnktFocYmob4z+Ln4AUate2c4yeJKbpydta4XAP?=
 =?us-ascii?Q?S5tNbMRj5Yv79d+lMbomFNmQRlpF+lYinhxOUsNgDOT0iMUkClsddK6xC51t?=
 =?us-ascii?Q?o0vFltq8jU16fc5XtYVzvAsdo7JanZSWKL+C+7BzI5srbmKBw6wy6vULEArv?=
 =?us-ascii?Q?U17f7fJbgmi+n3UkIcewpZ4h5mOCe72EiuyMBX2JEQL8HFD20//ZHmRrqLK0?=
 =?us-ascii?Q?imsRgymqMCODjVFDvvH10NFOHdAhALShhF0Yxz6ZSPopUiKJc8k2Uo7ZeNK9?=
 =?us-ascii?Q?iKcV6E+oXvKudNaNxFpC07CLXGXUpOi/RG8E949zxkfXfR3TD3vamM5Nsnco?=
 =?us-ascii?Q?XWsXlwX84mUIJxPtAvXhI0kaf/NjPsTfk/PK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?73RyeOzWyH6o0W0c9PdBgUwtUTVm/cfeAxBeYianJO4DTw2Cs+dohnLBw1wm?=
 =?us-ascii?Q?OITIDLBWwMu/qUlSOlm0Y8JiN7k/tKyXzZMQtKjmJzQCU2nxCz50KBfvmZEw?=
 =?us-ascii?Q?mniJfFLLY2ShyPlZi2MsSQwAdkAZA4+gRRcnDOgNFcRR71+icXUptG2peX2W?=
 =?us-ascii?Q?Uy/PdbZdNAwu69ZF/7oStnuUGojCqHdl8VPdMRePkL6KeYaY3yvzr+3F1AbU?=
 =?us-ascii?Q?VVNBQhl/UqWaWOLb/+4J77EkSwVnHGEp88pm3SHRgEegG19Zd75WeM15rawj?=
 =?us-ascii?Q?ImiGCPJScMp8sLBEwIeqEcCCDJ6GvY9iz9zYH4EjOnaAUqLEgZDOIDoRk61E?=
 =?us-ascii?Q?d6qXeurrZrfgTL4Nbn1cR8Ffy7vpIyd4Jx0g1ivmzYucl5THYRj91boaTrkB?=
 =?us-ascii?Q?Bm6KtU3bzhZAgFqakvuc6jlEaEe9g6rveDK04INd+vICODNab/9TNN7EJB+n?=
 =?us-ascii?Q?mxXI5LeRAXWy5H36PBprXpypOj93VwxltIQYfYzKxOJ93E+SpxmUbYxIRwQP?=
 =?us-ascii?Q?9QH+69WJA/2hARf5VAZxbeRLof8t1lbLUPNcNA7iNQioPenv1fxTaYL82Rip?=
 =?us-ascii?Q?cUdjiWHUtA6KSdnRz5ujGDNREqmAqmAE8z5swkjpVmaKB/TyO6g0p3YFVmln?=
 =?us-ascii?Q?0QdT2OZ64ICJOj91FHhKslE11BoSPjNl8CsFQSnwK219Ko498z9sIkq9eUxv?=
 =?us-ascii?Q?q/H5yTV7UwDvQXEWAk3JOWLHBQsMoH6+RppoO+V5ywvaEOKCQo+8JNuFfRfI?=
 =?us-ascii?Q?6jrfduaqFft6gtMb7//W94vUfXErzSQ2/8XwNbP+8PTHCFxECAiK0WeFa9hj?=
 =?us-ascii?Q?ezyjPtCr0UhSywdJh6gH3xjugWkWrekhbubHFPpvJMcZtTttaXn43OhcT9rO?=
 =?us-ascii?Q?FQF1gI3+w9vL7jUL4NLFNTvMJ1LFAzhtfPNmEn8xsb28fSj4NJ2nnmpbY2A+?=
 =?us-ascii?Q?fcvvZR/weZ/QsoaJ4dScRk3iRmT3gEUdD9pFusA5JrYX+g7k/LsZnofryuM8?=
 =?us-ascii?Q?82ERaeBdFiMqU2V21tT0dOx6+/y01ZrFMzYvi6HcQh/MxJBnBjtHDryypCAD?=
 =?us-ascii?Q?7+ISLCXq6la5c4bNlGwZjAIdEg/0H9lMH0brG5JHXt4ERfy9BKuJfA+29YnZ?=
 =?us-ascii?Q?clYKx2oro4koCIDUvSrP/6bHPZ5/YjiAY6W+mpW5x/Sz+HJgn3/6wUXo7ACl?=
 =?us-ascii?Q?qV3y2s4D/vrQ2cHg9GRy7UpIh1Zjr8K4S2ewohMxr1DBNJqU3kwww70FbVKy?=
 =?us-ascii?Q?AJ5zv2pZ0SEy/fw8yNNCpOvzsh8SIt9o6x3uELcPIF00LdWSWSqhx5XRu58T?=
 =?us-ascii?Q?57cPw7D+c/liZpWZNUkA505PZUiDQt4MotgEnCkUBSIfc1/aTmJMorwJX1Zf?=
 =?us-ascii?Q?Ldn4OciCuKlt2spfkmvqYER5fGlK5zeXa71RPqbeEOfAHo3SEAeMwmUAgEsW?=
 =?us-ascii?Q?mBDtcFES0E0RUFwmRs3JqDWDphhd4+BdZcx7x29qo2K/GfJfq8mRf3WUEeuf?=
 =?us-ascii?Q?E44wqSvQWuzbZofu7jJjypkOalSobzsOET9YdjZFKHSrNy4sffQbzijfU4uD?=
 =?us-ascii?Q?cpTtDGCsPaO3ShQxDYCtt0P3QRsr6l2XYOqyHjQs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3eff435-652d-45d8-b0e4-08de00b5aab6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 06:42:18.6027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hJMTZm/V7RZDfZL6X5g9rFRspCpFkxHecwnsJQcG6MCxeJjfAN7kzmg7YkpyJtULUD2m85mjuq16UZpk1hCYLzOaJUB8+5iS2htbMs9oP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9474
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: 01 October 2025 04:26
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH v3 10/23] drm/xe/query: Report hwconfig size as 0 if prim=
ary
> GT is disabled
>=20
> The hwconfig table is part of the primary GT's GuC firmware.  If the prim=
ary GT
> is disabled, the hwconfig is unavailable and should be reported to usersp=
ace as
> having size 0.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.=
c
> index 2e9ff33ed2fe..1c0915e2cc16 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -436,7 +436,7 @@ static int query_hwconfig(struct xe_device *xe,
>  			  struct drm_xe_device_query *query)  {
>  	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> -	size_t size =3D xe_guc_hwconfig_size(&gt->uc.guc);
> +	size_t size =3D gt ? xe_guc_hwconfig_size(&gt->uc.guc) : 0;

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  	void __user *query_ptr =3D u64_to_user_ptr(query->data);
>  	void *hwconfig;
>=20
> --
> 2.51.0

