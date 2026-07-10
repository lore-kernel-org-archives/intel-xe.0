Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CA7C44501
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 08:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5552810F801;
	Fri, 10 Jul 2026 08:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxD9U4BB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B466910F801
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783670459; x=1815206459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=scdsOPuz1NMfNiG/mQ8F57fJNQLB95DkkOCgjEzxGik=;
 b=bxD9U4BBVQFp2bAGkpiGjnJIOfVdtE2Mzz1kGAfrBSNWcirPPqJbLxKI
 nHAw2Er8uEBtVp78Eaq5j5TEIZkGpMFRJ/Mws7H0JBYoVqp6X+TVxb3j5
 EA4SjGw9HT/UsvR+dDV6deCHtV3SXbeeuxeCPFdCSM29kE3BeCk1VLbZI
 6H1RX0ZvkcD30B5qHQTSTjocUjhe0Ub+9kZzDG+0ogRMLmfoHo7GMqqII
 lrYfWpvwhCPoyH5++aEJ0i8SOvkckbJ3KnQ0/TyBPXegaw4t38EgwdDyu
 7aLDTlLh8n3eDZYZZu5oWwqgdvlftNnzAjshIPbf8ExuS8ARgvPkPCH4g w==;
X-CSE-ConnectionGUID: vmaHpV6lT22DbbPm0VZNHA==
X-CSE-MsgGUID: rONEJ/YYQySEcjZDxM1auA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84386852"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84386852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 01:00:58 -0700
X-CSE-ConnectionGUID: EuWsM6X7R1KqGuTGBMcwyA==
X-CSE-MsgGUID: h+pmYnEhRH2e5wwJmJS+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248451575"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 01:00:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 01:00:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 01:00:57 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 01:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDEhTLHjTXM+0SRO8SqmUDe/q2mOqXQagIXu/i89nqu0MB1UEITIzYPjqRwTNU32Adunnz+MfabAw/xD43wOKsVV1D+jLkLtb7NiRMzfxbqIp1Xn1sqF53XbFGaX/4hzDRE8xp9WEvLlQLM9NbFRqn5tXKJ9KIStPtjfs5ziOzaHCof+dfo2pUTA67KLRWbhPQBOJCMDhHU0q3VgYCl4iIjJ5W8xmJcCipK0hzZPvXRCxiqoMyWZOrx77JMXfBJI6UkdU7JhRS7/Je7DbOmG2Ou8ueJ3kN0sgJV3x9YtInwIDuojASPf0kNP6tgP9hVDX5rburQx5NDe2umnEJxE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e21WcbFS7ndy6pw/ulFxf9PEGQolXzsJ73EzaCwBLGs=;
 b=k6Q9q4vu3/WAH8v0lVYVzEh5vyVIJeUWmpg//F1aI2Ez5joI2gCdVpbMVU4A6qW1GSZc7S6tvY0zvY8g29l6PTeekX3t8mqd6V4fKOLF271XjSj+LWUcdt3GdMTW0ZM9JHhBpSZYiI82q51UnMXklUaO94yQJPUDRiYFknt0klOw2WBUF6tLowZkfF3+MYkzVakdOHzMwt+EJT81JbNHC/sYkikvA0Qs3s+lFALKIp9TvgZYoKRYIepfN0FiJWADGZf0NtyosXfVbhbb4QWl+BGT2K981GtirzT5Uls3IGTWbsibttsAQYgg53ywNXQeX2um+qoCBCsQVuhylFIW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by CH8PR11MB9506.namprd11.prod.outlook.com (2603:10b6:610:2bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Fri, 10 Jul
 2026 08:00:54 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 08:00:54 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, Christian Koenig
 <christian.koenig@amd.com>
Subject: RE: [PATCH v5 0/2] Fix UAF on dma-buf import attach failure
Thread-Topic: [PATCH v5 0/2] Fix UAF on dma-buf import attach failure
Thread-Index: AQHdDrUxY9lPWzDBLUeznxjDs8p39bZmVapQ
Date: Fri, 10 Jul 2026 08:00:54 +0000
Message-ID: <SA3PR11MB8118F8E8998DF7C104E7CC5AD0FD2@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260708091512.205482-4-nitin.r.gote@intel.com>
In-Reply-To: <20260708091512.205482-4-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|CH8PR11MB9506:EE_
x-ms-office365-filtering-correlation-id: 936ad047-18d2-4734-adff-08dede595e0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|38070700021|18002099003|22082099003|11063799006|56012099006;
x-microsoft-antispam-message-info: YWADnnhaVLg65UXU4CiRWSo1aZXBn62yn+5zZ17AktjJl1SBfqjl5pwkpsUW31UMlwvfyeCSyfP53ZWEx9/Ysy+xFUiRaPj33nfA3wm8gcqBoQ7WgHSMJk5/R6o0rjv/edqV/zES2wrwVuLUJ/WcxN+ZDjG6ad+HVFibZc4V9OkkL30CbuzYqCSeTpAN701jWQVqPySuEVWQsCI4KXla27YETBhLOb5L6kq7LlmtA7rNWFngDLEvrsY54ZNF/k4AALtA+p4kJI+jt83JrOl7ROe/Wg6N6Gx86Brnp3jXrf5QjV3GXb/rYD8HeK9NMUSagZdYyvxPVL/P81Qm00i7AMj5+jm7BTrf55CIVfY7uuJtDTCtmihvoFxRhEV6zWi+YtN+45IwbSJzdva2Qsz5j3vgfVPcOpubD4g9zXKYghX5em5k5t99pDkd/pzb/S/ZHg7uCTxDVLfzUQvFiWpchMr3TqcSg/tBgzLXy2mrE3uj8vmsTDvRONoSNQdJlwbGDHT8T51usPGNM/PmhppbII3pVP6oSM20ZDDgdV1JimrTbTly88LfcLpZBexbKHhHfKTpXizpMIJMixAaITrMQnXsjIsQKOSBHKaJ9MlBspMGPvaFWIxw+6pTB2/YSQA9BSGKfI2gMJ85AZSJwqkk9KcKlpFBDd0bQKOSH5Txib8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?B+gm/NSuH7If7QxmUCVv+YkX/XNMb1gQBXzTp9PeYyf65hxBDO6iiu8qaw?=
 =?iso-8859-1?Q?454LQMYjUAGUT2SM18Py/3uRBrxVPnDsJs5OiHWTpHkmUOrEosxjz3kKWA?=
 =?iso-8859-1?Q?ZM+QaFte81GsGTp0ppt9Pwh3Bx3WvAPxAopBKyvlByIeGSOuLWp0gBJNXG?=
 =?iso-8859-1?Q?qgU5M5YDMe3dSYhdXoru0QpHeqp5PLSI985oBncLxeAPwtKmpu7nhs9IzY?=
 =?iso-8859-1?Q?/98TelSiRYiO/1rglRog4C02+bgG4HZIULgJc63XjjS7nLQYwSYe5V0Bm+?=
 =?iso-8859-1?Q?/PYUcUPnOmX+EnYWxPGIYAJtvT6jIM9CAXL6M3QG+5GnNpkK6I2AzWTaF9?=
 =?iso-8859-1?Q?Ojn0XU6SE+GjbEp/MQemqGIbwSzlr8UJITQvzb/WRoF6lVOeuMpdDVMs49?=
 =?iso-8859-1?Q?jQvsx5xsaA/4N7126bUzGk8G8L5zxTGX/AMidoXCCz8a8kwZpRrmZmN8Oi?=
 =?iso-8859-1?Q?6aHGUbSP/rNLui8LFUgSEjE5Zo/qBTI4k7fiw93VK4Bh15TGvxsPjHOLBj?=
 =?iso-8859-1?Q?SaLjkmVKIf4Thqes2RJgqwhOs2BIzhKB8Fl1WddPpM05tz0SK+GWDCxuAG?=
 =?iso-8859-1?Q?1/b4jAJGYaLblFl2uC087aP/ohKwj3/7ux8VrSkHiQyV2gwnEtq2MJ+Cjf?=
 =?iso-8859-1?Q?duznpBjyf5u0GleeUiSN0Z/LatZAXHlJn74qSMAeU+AFY4RWy8747R5cv7?=
 =?iso-8859-1?Q?nYi5/IUnDPu5tKRQxE1fVfMcoLBvjo9dXSAeGHh0EQs97GF7nZtWkFcknD?=
 =?iso-8859-1?Q?0KjFGhKkqs/P38VtAtb3vwdjTUlQOD4owR3T9t95L575VQK+2JHBwBFECq?=
 =?iso-8859-1?Q?a8OxRt6S5N1rcDMjY0mW+kUIZTpAlsoBml9TcIlW2wAnzIYi6aaycV4Z8F?=
 =?iso-8859-1?Q?jDwaEfuUWMLZG5939Km15Wa44ZTMzQo0JKSkwrfN5SMBYWD6YqDW0pWpT9?=
 =?iso-8859-1?Q?26qyahC3kn8ayLmN+EslJeOlSN0uJsZUff480Eng9KVDZPXaHGlCuDTThw?=
 =?iso-8859-1?Q?TqxL33KXnX6xwXTjTkzSj95T2ghKZnd8AGnO9lFPjxEOXNyTd5wT6szEZh?=
 =?iso-8859-1?Q?b+ryuxnEgKPTEaZ/GQp1yjp3s+Bh3WSUY/pz//9F5k7VhD+bR4tgQ3jQCn?=
 =?iso-8859-1?Q?TuLhxT81Sm9HzXU79qcH0s+jrclJe0/+u1Jp0QRkO+shI54bc6qEV1eHBJ?=
 =?iso-8859-1?Q?iA7ZGbsA/CEiMJcNa4Kcd/8sdb53fmbaLskezkHIIRoCd6NlSiE3XLNQ/d?=
 =?iso-8859-1?Q?FJs9Bv0Kv3DWMtVPAmelIItQuejbn3w++MkeEtzekeWMVe/vGWktNBGzFN?=
 =?iso-8859-1?Q?9H7vk5S8AY7S9dWtiIuMX7FqTz1cheKlMZ8JWQHtOTx9nj/J92iYFefj+w?=
 =?iso-8859-1?Q?vQ1cPxYQTNWr7EPzINJPSSYGnHmq/yERYSW30QQPmPk+IZ0YKiW/o2z9iT?=
 =?iso-8859-1?Q?52rOCAunJif2Qk+Lxb6BXfPrlhKy/+bnWReNdS6akWm+M5V4WcZKPewkdT?=
 =?iso-8859-1?Q?LSCfFgE9VZ82wQaaDevkstJHd3Xr5oQgnwChFUoRxYkn9JYk2F2Y1c6ZSZ?=
 =?iso-8859-1?Q?PPsYJ7Vug+O7i4YHEUM8kS+RoPC7TY5ToHN+2qlWVtVM15xAgfedwSPtKq?=
 =?iso-8859-1?Q?wmfXwQjtCzpkI7pnqkjQhy5TtoVfMKKxroGpy1JhenzPDOfg4vyJ6vgOv6?=
 =?iso-8859-1?Q?LQ1qAN7dyMJbzqWKDuq0qTVew0zTw6ApSDyZG0n5s5fp+Xmeb7l5BiCc8y?=
 =?iso-8859-1?Q?nixUpfew82hxiSYILYnvzfka3DddFpInczHqPEEx5ApcTUfvMhw04LzIVG?=
 =?iso-8859-1?Q?iZLL2qfHZg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q/KANVL1IvvBCtsWNa8B92fxrnM6gMAt7/8g2/ojhBv+hQHi4J2CiuLONO7OnF5KzsPpxmNUAAD9cwqZDiKzq0MzQPz9iQ/ofjbrnEd7PVNYKlvPmsDSugH6se2hM5qLYQWhtC9/FqVXQch6FtOqcFwtaRqUWk9XFJQLW7OkHQSqPVrq11JjiliNR2nuzyHr/+lqRAypf76rmogGhDErx8V829W6dzYxW/Ugarpra1s4xGrN7Hk76dt6TmO8IguAT6JscX53ogdfXLW2Pd7IhEuc+72Ak+zNGdLDrd0MdscppsYVQeLOzi8pORKqivTxIADsciulzjcldE8FY/hqlA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936ad047-18d2-4734-adff-08dede595e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 08:00:54.4638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvIPuHmbTqIwjcz0kSnRf2D7AeOgvSm6o0BX8KqXCbnNZfX5lmja0ttXmf+NulPkXENm8jrtbQuGcpKXkmQMlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9506
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

Hi,

Please drop this series - both patches:

  [PATCH v5 1/2] drm/ttm: Fix UAF on dma-buf attach failure for sg BOs
  [PATCH v5 2/2] drm/xe: Keep imported sg BOs off LRU until dma-buf
                 attach succeeds

These addressed the UAFs  (patch 1 the TTM delayed-delete path,=20
patch 2 the xe LRU-walker path) and were getting increasingly complex.=20
Patch 2 also regressed in CI BAT: the empty placement (num_placement=3D0) t=
ook the ttm_bo_pipeline_gutting() path,
which creates a ghost BO that outlives the exporter and hit the same UAF in=
 dma_resv_copy_fences() during delayed delete.

Following Thomas' review and the approach he suggested (discussed offline),=
 we're going with
a simpler root-cause fix in xe instead: hold a dma-buf reference for the
whole lifetime of the imported BO, so the shared resv can never be freed
while the BO still references it. This closes all the paths at once and
drops the need for the TTM change and the LRU/placement handling.

I'll send the replacement as a separate patch:
  drm/xe: Hold a dma-buf reference for imported Bos

Thank you,
Nitin

> -----Original Message-----
> From: Gote, Nitin R <nitin.r.gote@intel.com>
> Sent: Wednesday, July 8, 2026 2:45 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>
> Subject: [PATCH v5 0/2] Fix UAF on dma-buf import attach failure
>=20
> This series fixes a use-after-free that can happen when importing a dma-b=
uf and
> dma_buf_dynamic_attach() fails.
>=20
> The imported BO is created as ttm_bo_type_sg with bo->base.resv pointing =
at the
> exporter's dma_buf->resv before the attach is attempted. If the attach fa=
ils, the
> importer holds no attachment and no dma-buf reference, yet the BO still p=
oints at
> the exporter's resv. Once the exporter is freed, a later dma_resv_lock(bo=
-
> >base.resv) can hit freed memory:
>=20
>   Oops: general protection fault, probably for non-canonical address
>         0x6b6b6b6b6b6b6b9c
>   Workqueue: ttm ttm_bo_delayed_delete [ttm]
>   RIP: 0010:mutex_can_spin_on_owner+0x3f/0xc0
>=20
> There are two places where the stale resv can be reached:
>=20
> Patch 1 fixes the TTM delayed-delete path. Failed sg imports now individu=
alize
> bo->base.resv to the private _resv, keyed on import_attach, while success=
ful
> imports keep the shared exporter resv for normal dma-buf cleanup.
>=20
> Patch 2 fixes the xe LRU-walker path raised during review. xe was creatin=
g
> imported sg BOs with a ttm_resource before attach succeeded, making them
> visible to LRU walkers. An LRU walker could then take a BO reference and =
lock
> bo->base.resv before the TTM release path could individualize it. xe now =
creates
> imported sg BOs with empty initial placement, keeping bo->resource NULL a=
nd
> off the LRU until after a successful attach.
>=20
> v5:
>  - Add drm/xe patch to keep imported sg BOs off the LRU before attach
>    succeeds; the TTM fix alone is not sufficient for xe if the BO is
>    already LRU-visible. (Thomas)
>    v4 patch:
>    https://patchwork.freedesktop.org/patch/736663/?series=3D169129&rev=3D=
2
>   - Patch 1 (drm/ttm) carries Christian's Reviewed-by from v4.
>=20
> v4:
>  - Moved import_attach check to after dma_resv_copy_fences() so fences
>    are copied before returning for successful imports (Thomas).
>  - Removed exporter-alive claim from commit message (Thomas).
>=20
> v3:
>  - Dropped the xe-side reordering approach since importer_priv must be
>    valid when dma_buf_dynamic_attach() publishes the attachment.
>  - Per Christian's suggestion on the v1 thread, keyed the check on
>    import_attach rather than removing the sg guard entirely.
>  - Fixes both xe and amdgpu in a single TTM patch.
>=20
> Nitin Gote (2):
>   drm/ttm: Fix UAF on dma-buf attach failure for sg BOs
>   drm/xe: Keep imported sg BOs off LRU until dma-buf attach succeeds
>=20
>  drivers/gpu/drm/ttm/ttm_bo.c | 24 ++++++++++------
>  drivers/gpu/drm/xe/xe_bo.c   | 53 ++++++++++++++++++++++++++----------
>  2 files changed, 54 insertions(+), 23 deletions(-)
>=20
> --
> 2.50.1

