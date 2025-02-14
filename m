Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146F7C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 22:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E3E10E08B;
	Fri, 14 Feb 2025 22:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+qy/83x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54EA10E032
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 22:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739571643; x=1771107643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pw26z3f355jQ9nGOdr676OFx5IcK++KOCoOOewazUOQ=;
 b=K+qy/83xixfzlrC1NZTI4ErihItBIqtG84v660F8E0+DO4n4s/KVcmc8
 Ki9aQy/QCTvJaMV5hm0/9a+Hw3t4JEpo06Q+g3kW8a/p40eId31fgt09M
 iON12PRA4orrUtsfMZIRW3aITsb/Ke0FjmjCo/4LMR2WrIZneP2N2DfSu
 gGPHWirgOE53U/TaNLPzpCl/J9jaAFSwBpRe+66b8jaqf+IlesynO/XWN
 Oi29cM3DBb3q3dzNNmw/gg2cdOYAAn/jpOXKTQf/vNP6wIG+FZ6BS1zPw
 aPK1cBLPbeoBaS47bvw9MVA4WT7qGv3+eD0VeL7+cjLqo1BZbOcXU/1sf A==;
X-CSE-ConnectionGUID: xmswDpaMSDm6sgV3LHCVOA==
X-CSE-MsgGUID: fIItIuEiRm6aQhN9iMbilQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51763958"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51763958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 14:20:42 -0800
X-CSE-ConnectionGUID: PjQPFJ/mQQST2nNGmaVxGA==
X-CSE-MsgGUID: CFfb+rGBReiSxildTelbog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144494993"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 14:20:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 14:20:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 14:20:42 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 14:20:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8glcC92iKHunxldQSfpUhOw0M5G6eCKDiumqYuOz9Axp5JaNELPY0fJeRYKnFW3gSvALYmOeCe51vgK9DINXhvaXUX2Duh39mrs/9Wi+0VHIQq7boA1IVYSCuLF507nG0wyigsdRx7aL2O5mAswepM95ntqB19xogGgcpEzJUji4ruNoQJX/qmX7VNpdxdqlmyCIZ0+bT9oBqAyOaBEcTXJntzYDyzFVKzUVQkwJeJRGislG9e49/RPUVMzD3u9+3/OZAb7UvggDdgb5C7HRBruCp9VWVXF6bebesOJdgZfqbqcN9ZoBbbGwPSJTcWYkHv7xDkZWgSZLIHte9lzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmgNV3jkjqk0iZqyqEBJVSpcAUYCL2v40e8fVhluE+k=;
 b=xRC13pZAPFrVeIMGbnuni1DIsQQtd+1l+pW0YQw34cuypdJeHCJGw+jKcbVruZQJX1JfUCWK2NVlVSmFsfEFo5S6WqqrMDxuGEDkw53IoKhm58cIGuK8U0BnXc2V/Hf7eDCXCfNwftEY79KEo+sjumcQ3m7tQcue9Wf4xnN5LJIO+wjS6sRgcR2vb9VzRCddT3/SSWzkIEQwtf0HaWA5EzrE8AoRId0+N7O2QaPbJNdf+da2Ya+vOfE1TSa135z42roRoypRsXPLjXjSzKoDTOBoymCom9ENlq3Mmrm80SZqCHWI8BlcQQFFZS75R7Mc01w5qXu3MxdffBB34ReFCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 22:20:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 22:20:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 7/9] drm/xe: Stop ignoring errors from xe_heci_gsc_init()
Thread-Topic: [PATCH 7/9] drm/xe: Stop ignoring errors from xe_heci_gsc_init()
Thread-Index: AQHbfybU/DCZFtLB/Ey6Afvf4f4XILNHXRQA
Date: Fri, 14 Feb 2025 22:20:03 +0000
Message-ID: <CH0PR11MB5444CD17FD9E6E368326505AE5FE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
 <20250214212313.1767562-8-lucas.demarchi@intel.com>
In-Reply-To: <20250214212313.1767562-8-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: 3145c8b6-9e63-45ae-e5a5-08dd4d45bada
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?cXNmlvlcJJYeoP6AOuZql9qcyXnXXucOg0RSH/OvdeRpbilaYgkZLNu95YGy?=
 =?us-ascii?Q?3lO6xLLRbZINAJvfxlxSWIPuY93KARqhOII8lcQdSNMVgzlNdN9RaJ2CWa9x?=
 =?us-ascii?Q?/tyKie60/zqjJr7TQpCwVrg7hwlse5KFob58bP8o7YqcMVdmRRERNEiOJgmR?=
 =?us-ascii?Q?YCyuYap1mP/o1EJBwwzV2zEj/ww0SWz6NJ93Hs1kSjopU/p0h1Ifb8AqAN93?=
 =?us-ascii?Q?6aagQHcCXgW5MEsvaogNrevUgg5M+7+U5qt5NGXaaFMUFnCsHqjMhJMEQd3m?=
 =?us-ascii?Q?93C4feiA7GwNAH04toUzd5a7pNmnw443Zj2BGdmHO4hIKutH/Kh6yWpGcKlj?=
 =?us-ascii?Q?/aPnDsUSouciSqDRNwLwFTIQr5z5bhdLURbkBggSTVRcBQEBm9XDGIP9pfLv?=
 =?us-ascii?Q?5gO6PmZSsar6J2U3LYoV4XpEqPP6RfXv8xVtuk8pXO51SaLUsmjDjn/WaX+D?=
 =?us-ascii?Q?LLhdmm0Gogd+f0j2swipJdgSzGGo9PXm7e5vRyh9SE3E18V9PdFMf1HNlL8w?=
 =?us-ascii?Q?ob+YkDt8WgqJocZ2KSCPeQpDvSmJs9q1Jk5aHTACR4lnk15F99sbd2+L+um1?=
 =?us-ascii?Q?Z8pRL302hsDQBwsFse+dQMF8kajAAexgV5ZyQnfPKXuIaRwQaUTiblc/YmWe?=
 =?us-ascii?Q?KScpEhkDA878XrqXMlNiUIgoXm/HVj5OBsdFH8MYb9D5XHBRyulitBfVzTGA?=
 =?us-ascii?Q?Fvdx0mmNi6CyL9O/GQBLqtX7MRITln+7nSTHSHF9ZsoArS6s7fLiatMUmYQH?=
 =?us-ascii?Q?U7Mo0VZTQAgGzeiqUYd4z3XIwDfrX1KykYkBE63LGpKPe0awrWNkZhqGSPO2?=
 =?us-ascii?Q?6PpgaB4/K0iQpPM+hnZnfAbstVYb53vk22FUlMnQZepaifdKWhad4UOx7jPp?=
 =?us-ascii?Q?NXc0JIQ6uz1GaBHla6SivTRrANSd0J5INYVnLnhhUNbueXwXc99K2rVO8Lnm?=
 =?us-ascii?Q?Vim9IoSkFQloFYVwzG+9PoLQqqAZNGmpnxiZR+8+ly7neAWEiv1Gn41Lonbg?=
 =?us-ascii?Q?/VHrnWag1HIFu/WwjNCXF9WD+VOzby03Wfn+Odowq4uhPXFkvO0gMzmWE1gM?=
 =?us-ascii?Q?YqtSnnPShumDQgR9yd9DMFRfXxwwbBgzsy6UXbXtLlyAl0YCxtmcVQVTTVRg?=
 =?us-ascii?Q?0cd+HswxWsWJRCb63gU2RJS21uK7ymwKdZIWkRZE227pIHLSbbHS5RCeR9Lq?=
 =?us-ascii?Q?Lvv7Upg7O7g+YfzBtdTOSElvJkoDKrDKr2MB6ZVKydggOQcpfZ/TgqL9qZJc?=
 =?us-ascii?Q?2G1IEly0YFpsAU01CQ4IbnIexBCNMpIBaZWHrHmO+XtVo2bBM9TzY0ncZsQw?=
 =?us-ascii?Q?FPr+PmVL0uuf6eN4gaPShx60tk2ugtvtc/o/GV5vPEHwJoBHLJnjL6VNV+CK?=
 =?us-ascii?Q?wB1kBk4EQ1zAOEWupe5US+MTKdv/HWT6qTLeqAOWauOeH8ox/kb3B0rERHaV?=
 =?us-ascii?Q?ttaR6bZAqdWU1MEoFujJWweZqEkkTJa6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q2I6PO6Xnerf+LwBFb76WVKXKwxzNdz5Gtl4Se9zrt7aLF4eH1FwMkGPC2vq?=
 =?us-ascii?Q?9NNGkmZdimEQ2nmWiJDGezeKG+s7/dJ6v00fyw43rKul85CwII6P/9d1RTWQ?=
 =?us-ascii?Q?Xejcne2/04rs7bCtalN7492Yuo5Cfq8YbwgRyWDZlMqqUwyDMYTNbfddnwXy?=
 =?us-ascii?Q?4eCWCl/Vakjm2+I0XUTg0gGEyQCFLT2211b0IfuMD96x19QmOsaiZ6iijtBB?=
 =?us-ascii?Q?L6Qvu3zxFy4/xhPaLReif2dHsjpWrHkr75diWLH33+wwhMU7lgV8tt900JTJ?=
 =?us-ascii?Q?dHKb0qnxtmtCPzYPa7618wTH8TTCEwvQZ+IYnPr0QOV/wtLxby5FlfYiOJNR?=
 =?us-ascii?Q?WBBuq7HjkjthmXftsbG1xhUO5JnDkCyMn+zFMI3/50hrrIZRiQAgn/A+aJK1?=
 =?us-ascii?Q?2YatBiyeSEAFSGiBJrxdpUEFK6pxvawX9WQG8MDPBhoRpM5EEA/T78nhvKIJ?=
 =?us-ascii?Q?UxxCtI04hC9MtOKE5dBwVlWt9U+VfsyzJfCB1AabUNsisbcUZisbTa71H3Jd?=
 =?us-ascii?Q?ffpN1JtrGZHNyL0aI3A7nK0RKArkr/NGc3mIK3zB58hgfehiOhr+ekK2Bxzn?=
 =?us-ascii?Q?HtqJC67BAn2o6wKLOVOl7FlDEL/BIyPqGng9GV+9qGwAswk58UlSkZbxAp7P?=
 =?us-ascii?Q?JWlMqiOoY/LO0KKZ6JUiYtrxNQOY1D1WX55GduqXzsDvt6mGAWjgA56QRWjz?=
 =?us-ascii?Q?MCW+0APenM/yygu0WjKb+2PxaQyaZh9Su58Ll4qrQ3OWmsa/JYk1mQfRxWxj?=
 =?us-ascii?Q?zYwxh9rddpRDGBGJMCGvSRZ8gfYsSG4qvKmWd5lbdfI+lVZwG58sQjfgND8l?=
 =?us-ascii?Q?N1VkpzRGZOEF1QtGQ3LW+wANaxX/9YU9772s9aZcPB3HNi+kCv/pl6WswTOo?=
 =?us-ascii?Q?coKnPUH5Qg8u/jAEtieXBp8xPVKT8WfrN6XEmMDt7ywvFPvgSc7kaJ+sS1wX?=
 =?us-ascii?Q?m6oXa/dYOO0fGcrwaHVXIl6tXA34rSMmhFOtdTDXyZMT+3UQ9W1/rIU082DX?=
 =?us-ascii?Q?Rh4z04mYulg7JQgUCIk2a9XSJ7h56kSsIyePekdLKOcX+G00hWRdlOSepafb?=
 =?us-ascii?Q?GptlqzftUXduBuMtOxKR+Ho6D4i4rvRtNwSQz9qYytTWD8I6HA8ywRk4yUV8?=
 =?us-ascii?Q?pTBSfA9RAJHcYV19HNdwsLFPKnGzOXyiTFURsh5AB5j886F2balT5O4XQe2N?=
 =?us-ascii?Q?saRHN6R8eS0X8dQxHt3kv96D9HHvLmBuyquqNURuUF9JqcuzYzwYoHzLRji6?=
 =?us-ascii?Q?tSZuO1J+IMlQWQGL3p+jRVrp+Dyb7gpdFcM4XYgx7ZYxIKXY/7Q8dg+1EyNp?=
 =?us-ascii?Q?PZEC1xevn3sxrY8UapeYj7WrIHgGDNQalYdZL1HQQcAwh+MCwrA269z/aWgi?=
 =?us-ascii?Q?DwJhQQKLAzJut8FdtSh00fhi5XEF2rB3xiGNLBtplSVth1/HKJWCXh8MVqVu?=
 =?us-ascii?Q?30uh6GAl5Q0rH5mGXxrcXyDaIJ+ln8c8XyEa0wcubqOGKzmqCGfK6FMCX2gS?=
 =?us-ascii?Q?2UaI/ZHgzGDOLmviORnljpHw2mIlMrdi0ygnwY5EVuq1wlNJa8U0Y7OIB0VD?=
 =?us-ascii?Q?VlMSsV7DWOhT2radszdWqhznGvZcUMbRPN4DNH0i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3145c8b6-9e63-45ae-e5a5-08dd4d45bada
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 22:20:03.9049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhLxw+Hejc+dJfmgQugAclgDD6GDtqKUJQ2Y3LRYesU/t53Aiyqm87bdlAiU4dS/eqe58itgEaRf+PklMr2OxyWSNDerrwsJz3+paxJ+LxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Friday, February 14, 2025 1:23 PM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Tauro, Riana <riana.tauro@=
intel.com>; Usyskin, Alexander <alexander.usyskin@intel.com>
Subject: [PATCH 7/9] drm/xe: Stop ignoring errors from xe_heci_gsc_init()
>=20
> Do not ignore errors from xe_heci_gsc_init(). For example, it shouldn't
> be fine to report successfully entering survivability mode when there's
> no communication with gsc working. The driver should also not be
> half-initialized in the normal case neither.
>=20
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c             |  6 ++--
>  drivers/gpu/drm/xe/xe_heci_gsc.c           | 35 +++++++++-------------
>  drivers/gpu/drm/xe/xe_heci_gsc.h           |  3 +-
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  5 ++--
>  4 files changed, 21 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 782ad564d0ba4..4af4b526a2801 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -851,7 +851,9 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
> =20
> -	xe_heci_gsc_init(xe);
> +	err =3D xe_heci_gsc_init(xe);
> +	if (err)
> +		return err;
> =20
>  	err =3D xe_oa_init(xe);
>  	if (err)
> @@ -903,8 +905,6 @@ void xe_device_remove(struct xe_device *xe)
>  	xe_display_unregister(xe);
> =20
>  	drm_dev_unplug(&xe->drm);
> -
> -	xe_heci_gsc_fini(xe);
>  }
> =20
>  void xe_device_shutdown(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_hec=
i_gsc.c
> index 992ee47abcdb7..3ea325d3db99d 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -89,12 +89,9 @@ static void heci_gsc_release_dev(struct device *dev)
>  	kfree(adev);
>  }
> =20
> -void xe_heci_gsc_fini(struct xe_device *xe)
> +static void xe_heci_gsc_fini(void *arg)
>  {
> -	struct xe_heci_gsc *heci_gsc =3D &xe->heci_gsc;
> -
> -	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
> -		return;
> +	struct xe_heci_gsc *heci_gsc =3D arg;
> =20
>  	if (heci_gsc->adev) {
>  		struct auxiliary_device *aux_dev =3D &heci_gsc->adev->aux_dev;
> @@ -106,6 +103,7 @@ void xe_heci_gsc_fini(struct xe_device *xe)
> =20
>  	if (heci_gsc->irq >=3D 0)
>  		irq_free_desc(heci_gsc->irq);
> +
>  	heci_gsc->irq =3D -1;
>  }
> =20
> @@ -172,14 +170,14 @@ static int heci_gsc_add_device(struct xe_device *xe=
, const struct heci_gsc_def *
>  	return ret;
>  }
> =20
> -void xe_heci_gsc_init(struct xe_device *xe)
> +int xe_heci_gsc_init(struct xe_device *xe)
>  {
>  	struct xe_heci_gsc *heci_gsc =3D &xe->heci_gsc;
>  	const struct heci_gsc_def *def;
>  	int ret;
> =20
>  	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
> -		return;
> +		return 0;
> =20
>  	heci_gsc->irq =3D -1;
> =20
> @@ -191,29 +189,24 @@ void xe_heci_gsc_init(struct xe_device *xe)
>  		def =3D &heci_gsc_def_dg2;
>  	} else if (xe->info.platform =3D=3D XE_DG1) {
>  		def =3D &heci_gsc_def_dg1;
> -	} else {
> -		drm_warn_once(&xe->drm, "Unknown platform\n");
> -		return;
>  	}
> =20
> -	if (!def->name) {
> -		drm_warn_once(&xe->drm, "HECI is not implemented!\n");
> -		return;
> +	if (!def || !def->name) {
> +		drm_warn(&xe->drm, "HECI is not implemented!\n");
> +		return 0;
>  	}
> =20
> +	ret =3D devm_add_action_or_reset(xe->drm.dev, xe_heci_gsc_fini, heci_gs=
c);
> +	if (ret)
> +		return ret;
> +
>  	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
>  		ret =3D heci_gsc_irq_setup(xe);
>  		if (ret)
> -			goto fail;
> +			return ret;
>  	}
> =20
> -	ret =3D heci_gsc_add_device(xe, def);
> -	if (ret)
> -		goto fail;
> -
> -	return;
> -fail:
> -	xe_heci_gsc_fini(xe);
> +	return heci_gsc_add_device(xe, def);
>  }
> =20
>  void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.h b/drivers/gpu/drm/xe/xe_hec=
i_gsc.h
> index 48b3b18380453..745eb6783942d 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.h
> @@ -33,8 +33,7 @@ struct xe_heci_gsc {
>  	int irq;
>  };
> =20
> -void xe_heci_gsc_init(struct xe_device *xe);
> -void xe_heci_gsc_fini(struct xe_device *xe);
> +int xe_heci_gsc_init(struct xe_device *xe);
>  void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir);
>  void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index 7ba02e085b5b1..d939ce70e6fa8 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -134,7 +134,6 @@ static void xe_survivability_mode_fini(void *arg)
>  	struct device *dev =3D &pdev->dev;
> =20
>  	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> -	xe_heci_gsc_fini(xe);
>  }
> =20
>  static int enable_survivability_mode(struct pci_dev *pdev)
> @@ -156,7 +155,9 @@ static int enable_survivability_mode(struct pci_dev *=
pdev)
>  	if (ret)
>  		return ret;
> =20
> -	xe_heci_gsc_init(xe);
> +	ret =3D xe_heci_gsc_init(xe);
> +	if (ret)
> +		return ret;
> =20
>  	xe_vsec_init(xe);
> =20
> --=20
> 2.48.1
>=20
>=20
