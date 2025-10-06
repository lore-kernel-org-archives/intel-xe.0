Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C57CCCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 17:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1357E10E0FF;
	Mon,  6 Oct 2025 17:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfHVxhaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA34510E0FF
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 17:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759770224; x=1791306224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pCi8DYBY7Cp7bv/aBeTaDyRSetNjHYXrIHjSPPPLuDg=;
 b=BfHVxhaaACT/vb6Mwtn7m+ibviZIGwsX0uBly7ZhZ8yZMNCs//I6SrjX
 a7wOlC1C7rntJYiPg5YTL8xfkYm+Uyr1m3mxJxy1SVlqu5onCAOw8n02s
 cZhgx0Ps4MqPl2SacQw2MD3PdGO64U3nenJoznkOCCXVkvdp8+VDwj75v
 1GM3HyDKXESzLTMNJRAZZUjcuEscMUvXdoTNmtnEtWsl2KD/alM8forix
 Mak60DIp9hsK5N4qsVkIw5JkA0+sxtIHg1FP9y4052sF6tidJMy+ivU9h
 1HI46u232cYRJdmk3q+LVrf6GJ9izU7enAAMHw2gwdSowkyhIweDmrphQ Q==;
X-CSE-ConnectionGUID: lhTYDELmRxi2cpwM3H5y6Q==
X-CSE-MsgGUID: V5s9RRANRBK71qs2arFkqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65797101"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="65797101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 10:03:44 -0700
X-CSE-ConnectionGUID: mSqfZyhCTYSq89BFWj1HyQ==
X-CSE-MsgGUID: 2A1HKMSzSAi6RlEoSt7oeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179867853"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 10:03:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 10:03:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 10:03:43 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 10:03:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5VzTY1vgh5O1OGgMuscauzBAZU8X+9JACd3AsGclb8bFRbdAK0vRZnRmqB1EsQYHWm3lVff3JAqamcNtOGPShyjjKEUpayeUFVkVMyk1YxvMtfU7KpNT7JHn5kzUJtM8DhP8H0PbKluJWyjmijwORhTiBv9UWysQAbDyNAHrYt2MUon4GfCizXjmmUWmCmh04ylDv+uJfTajRWR8rrRgyl+O9qj0uzSHnzj9kk5xbdbsYqOB1M3ruWDqgscsI83WfYECGrkpkS9Tttxf5tJjdCz8s19LwS6MOIP8m9GYbwpxg02ByXHEA5IeTt6vJMMPuRPXGiP3NH4VKSscNXFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2KnbB2wnAuR7SkoitiB3gZRf1iMxuictaf/bEcsFII=;
 b=zUFGx03KTUVRPOyTD48i2ZSaNbALnXyUIx3th8jU9qtIxGUv8oLuOoXpfenaF+3Ty3pNvyCVGfz1HiHIIgwdoXjsaZvOVL5KFw7uEnCgRbHzH7IMOOwa7b92by/CVEB8SqYrglmrAqHD7aOxPBP41cq1iknH3BC8XaA1CmeemmW54sK4USp1NhBJUyxFGHEP5UasxAOX9OPSCjvLxe0ACTktDj4ahP7oCjt3tZh7bMos/+e1uWew2HKuHDih1fr9l5x9W8PLX+5ShpSiMT+N/IqJYqQwrVEJDYTK+GGE26Wg0bJ9iOe3sPy3pPOpHC8IvCAmzhtOCeTSgqk4QU8v0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Mon, 6 Oct
 2025 17:03:32 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 17:03:32 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gote, Nitin R"
 <nitin.r.gote@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Fix copyright and function naming in
 xe_ttm_vram_mgr
Thread-Topic: [PATCH] drm/xe: Fix copyright and function naming in
 xe_ttm_vram_mgr
Thread-Index: AQHcNMLHh33Qlgclfk6Q3yUnAYEY9LS020CAgAB9LoCAAAN24A==
Date: Mon, 6 Oct 2025 17:03:32 +0000
Message-ID: <DM4PR11MB54565D54961E7F19539D7B2DEAE3A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251004000425.2489291-2-shuicheng.lin@intel.com>
 <IA3PR11MB89874C1D695708E22C0C525CD0E3A@IA3PR11MB8987.namprd11.prod.outlook.com>
 <aOPywRsc9aw_p3-1@intel.com>
In-Reply-To: <aOPywRsc9aw_p3-1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH3PPF4EB9556A6:EE_
x-ms-office365-filtering-correlation-id: e025cae0-5386-4ca0-3d15-08de04fa4787
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ivAYLCDkIY4+MyHXP582IgXl8COwQ8E5+J3rrftpV4WbJBYNBx+XYusF0j09?=
 =?us-ascii?Q?/i8COVsMFlurMEj23DPCJkwiGSfbeSkIHp8eAm/ZUvZYR7liBhNEaBqMPe8D?=
 =?us-ascii?Q?za+gxZ5DC5JlE2OGORzN3LDSVuswtdNi0c0ZcSXLduxxGJPRm0qHWrEqm488?=
 =?us-ascii?Q?cvnpfholWQFmSFOYGEh2rSN/ygcECaMMXdZRDYwKGuBlGuOpayia5+Wlykhz?=
 =?us-ascii?Q?NKpW3RppCxSZXigEIL+T6EXo8MZT3QVBYe33flq/6OySGPIehKZypqca82ov?=
 =?us-ascii?Q?QLyFd/sJXzNIdSrP5vvjb0f9Vo3BUJn38EMfQwICts5nsQBO/O9TwAU7bZwQ?=
 =?us-ascii?Q?qQHsxMbnsVMhtDhniGfydFlJ5JHhgcYOwJ4OYo3tT3HA864Lu5K470xb4Eiz?=
 =?us-ascii?Q?1jAGIieiC47CrcbWqIUiQShV1aTo1FivSaUK871GQAvUE74Rbw07e9FdgvDp?=
 =?us-ascii?Q?qp7BwMX3bv8u943lmmIIjRCDQ0gGD/MeNJHZr1KqT/JmoGhwcCjaf2DbbuJ6?=
 =?us-ascii?Q?34m1DJuDYrtphEQDEsefbx/Z4dfO1DgDahn9Y7eFey9NkqyWeXNF0EJH+QkE?=
 =?us-ascii?Q?3ObvwDwlyTXRKD+buWyVEL2RuQoa+D8JAVNlkVxi6p/X1BY+YAhbSM6KFamj?=
 =?us-ascii?Q?7KEfb3KF/CANc6Gj9ilvAEXluthhP0vRwWP+wHEDlQoeBiss7z520gl6IxuO?=
 =?us-ascii?Q?HRZcSyScEwoS/aqKbtThA0l/s29fmsfICEdWnAyJZIBu4V5ogEoQ46Sz+Znk?=
 =?us-ascii?Q?YNp+9ZxKUy8ZMxKj41tHxRD6FYEdFA/2YFfBMwlIupHmebpaG4KmbmauZOAQ?=
 =?us-ascii?Q?PS9MVlATakGJmQFNJPRzxxUv86/H3ZLTujTej9Xr4RhzYLu2PYmuInhe8MQg?=
 =?us-ascii?Q?YhHIoJ2POJfqlO2uFhR05NArAo0C1KudiXpHBsOHhQfqSSoojxjJZlIfIl0B?=
 =?us-ascii?Q?GH+3R5R9Szk4g7PJiZewrE8j8VmrC+nmGXtNlW0XlHGaIdZDhcI+ZPfxx0Ne?=
 =?us-ascii?Q?TCMiFK7vdpqdtumEwbH0WyDfo2zi//ikTx5Y8A7NCGHeRskubtMOPkZ39S2D?=
 =?us-ascii?Q?MgzYIWNj2IakhD96mJ+kfaSycrdAfuH+XJ6/Rb5SxnP3xB5WlsrS4hijBIb8?=
 =?us-ascii?Q?e/7c1qJneKeSvn2PxOOgWnGEfZQJRncmGWpvLZnNPCnY5wKVHlt19hJNTute?=
 =?us-ascii?Q?MvcL8e1/PkyWThCeM+KhFJ4Xek9tx/Adyyei/hcJpBNrEQBuIC70mnhGil24?=
 =?us-ascii?Q?KK86DTuzuoUtZ4BHkMyeDsxjB4P6TXj76VDJSI3hdtYmyFjdlTSuV5a6Rtv0?=
 =?us-ascii?Q?axvBbPgkJr1M5Hj/CknRI0Sgsr6Rqmird9XTMnQUdxtjv7uZd9f/Ms5aC4D8?=
 =?us-ascii?Q?udWzVc6eb4DnBbYUVxbrBn7VyXm4PZC7y4xkva95xvCXHV87tChgD75fOvEd?=
 =?us-ascii?Q?VaYoRpcMK3YBjnAYNGwJjrMLpsZsM+VdAUOLvpodzorYl8jtg/iRnLWYjVdT?=
 =?us-ascii?Q?QPaoPI4rX88A/1bDSgb/lhJJc+50U1HJUSiG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6B3ncICXvAozH6cJcBhxxKTK9m+YkrteHe8hcCbzSIgDb+HCfhVOGh33Lplc?=
 =?us-ascii?Q?//+Bcwfl0BdFRk4HuebCbwgIgi2zho4VVMgh2Tc5dVo44GhnalWTnqVHY3HA?=
 =?us-ascii?Q?t7OGyWFfxSnHkNGX8UswElSXh8jtwQV8Hl5Q5Ztyq1aN78vRVcotHE7XhUr1?=
 =?us-ascii?Q?fMWiuMiYcBDBIn/XHM6xh/CtS6jNIRzpTcfvgL24T6rqmMZBfGCNHMYiPwu1?=
 =?us-ascii?Q?zaPfe2dXYfcVlgbHRyJrhgrXvfKCNvJ2KHFBrCVOGRsUsXSCjKoTcLSEznst?=
 =?us-ascii?Q?uftflvum03OirPyc5AWFwtz3mHwmgDatYHRDMo3I6j+yiDymB510Yowywx8p?=
 =?us-ascii?Q?XTSIU9PgmiPyXfjvt0O4dchDsYfXtubgVU/pViIr2XQLvBekcbieL3e8OKx+?=
 =?us-ascii?Q?i6Z0Q3ghjh6dssYmC/JywygRMnxaP08NnxEQlB3Nx9XzFK79FKWEClqsUq8c?=
 =?us-ascii?Q?tR6xxUrok7viUU6hwy6kMDfEU2KPYnsR4+yqtjFnOfT8l1SeKqocAo1CE6hj?=
 =?us-ascii?Q?UgQMoIg+YhZdaI8sdApN1ZM5xm7lsawrVF6eM3lwlrV+oKDDTdYwR7fUgMdg?=
 =?us-ascii?Q?KTwSVk9oHBDlBrIjmSK/ROLjXIsspoi11BECf6bsjUym+/hSL8XhK+JtTsdt?=
 =?us-ascii?Q?LWW8CTOnalyfjiUALbIfjmaRYuPpiLWltHB4xDNRBz3uClzMsOjU5+iDBPlr?=
 =?us-ascii?Q?fWTEUnl1zX/5ohHTKUJlcrpM3sAJXJxUOva2qdoMrCu3UsUP7VY+biZa4hRq?=
 =?us-ascii?Q?6EgN2eSyt39CvllrAK2u+eXwkBmpUt0/TXudsXITiAZoCZ1idPDogFCcKiQM?=
 =?us-ascii?Q?hhCgGN/QAbWsPCYbrjQxVQqu/CKVfSkbVCqjwC7/fUr13EYAxQklg6/zL7vx?=
 =?us-ascii?Q?w6DM+4wFrS863AQqHTL6mGMx3kSu/0RT3ytbkMMMo0MBKohKzthWmL+MycHe?=
 =?us-ascii?Q?J/uquHubQaywM3hvkXAvT5tJksZfSdaZI4BM+zJl1MEB97uaf0UjTGkeocU2?=
 =?us-ascii?Q?dHLdCS9ywwgmDBtlPaVvdpChbvY5i5Cuti614tFfpUcU/NzENdjxUHOS3GtJ?=
 =?us-ascii?Q?8glhCOMP7HBdnqjbP4zJakX9+ei575C+HzPFd6jl4Ari9fyIxaQzXW06YHgr?=
 =?us-ascii?Q?5ARbaVFVCVYusoqSXMnTTICiiQws51lu7eVPJpuyf59+14wbQm5bSu43pi2p?=
 =?us-ascii?Q?iSLYGx03rYf/ENWXZQV47du0Mj9PFW+bAS6nckktn7NwAGPvJR0a3gK7Y4lS?=
 =?us-ascii?Q?iqO+S2fXBevNzU1q/SleBTWMUAgwOsGARVgfBfhoRS3msDs62f103QJP0q1v?=
 =?us-ascii?Q?lWKQ0xuLmSMK9q4XJk1RIlHeoYxLS79eEQq/tPQHY6tiEVht/EqOE2NF5WSP?=
 =?us-ascii?Q?hBsY615A4Rbw9tjxs9zwbIdU16ztgHmrnKF8IRweePDEMcLGQhuUp3tDLbrO?=
 =?us-ascii?Q?Shz8FtWbJsZVGmrv1MvUb6TkpfK1zww/rohYplQq6ptYq3K61pxON5SxNUqU?=
 =?us-ascii?Q?0ZdZ9YutHgpSjKnS9uI1Yi81eccwaYJL5o+KwLsCyQuD3SKBi7IBKW6rBv4c?=
 =?us-ascii?Q?VIklkizFqbWjUUq6qKicYDFkVRWauVKSABqMA/ND?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e025cae0-5386-4ca0-3d15-08de04fa4787
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 17:03:32.1187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GiEbYpD+u81oxkI6IVvkxfkozZEl2bHMMbRUys9Sa037YVUYcoaPPteFI2bi8mN+tQsJyK5xa5A2crTr1giiLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
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

On Mon, Oct 6, 2025 9:48 AM Rodrigo Vivi wrote:
> On Mon, Oct 06, 2025 at 09:19:59AM +0000, Gote, Nitin R wrote:
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Shuicheng Lin
> > > Sent: Saturday, October 4, 2025 5:34 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>
> > > Subject: [PATCH] drm/xe: Fix copyright and function naming in
> > > xe_ttm_vram_mgr
> > >
> > > - Correct copyright year from "2002" to "2022".
>=20
> patch pushed to drm-xe-next. Thanks
>=20
> apparently we still have 2 more occurrences:
>=20
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c: * Copyright (C) 2021-2002 Red
> Hat
> drivers/gpu/drm/xe/xe_ttm_sys_mgr.c: * Copyright (C) 2021-2002 Red Hat
>=20

Thanks Rodrigo.
Will you take care of it, or would you like me to handle it as well? Thanks=
.

Shuicheng

> > > - Rename ttm_vram_mgr_fini() to xe_ttm_vram_mgr_fini() to avoid
> > >   confusion with generic TTM helpers.
> > >
> > > No functional changes intended.
> > >
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index 9175b4a2214b..9f70802fce92 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > @@ -1,7 +1,7 @@
> > >  // SPDX-License-Identifier: MIT
> > >  /*
> > >   * Copyright (c) 2021-2022 Intel Corporation
> > > - * Copyright (C) 2021-2002 Red Hat
> > > + * Copyright (C) 2021-2022 Red Hat
> > >   */
> > >
> > >  #include <drm/drm_managed.h>
> > > @@ -284,7 +284,7 @@ static const struct ttm_resource_manager_func
> > > xe_ttm_vram_mgr_func =3D {
> > >  	.debug	=3D xe_ttm_vram_mgr_debug
> > >  };
> > >
> > > -static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> > > +static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
> > >  {
> > >  	struct xe_device *xe =3D to_xe_device(dev);
> > >  	struct xe_ttm_vram_mgr *mgr =3D arg; @@ -335,7 +335,7 @@ int
> > > __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr
> > > *mgr,
> > >  	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
> > >  	ttm_resource_manager_set_used(&mgr->manager, true);
> > >
> > > -	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini,
> mgr);
> > > +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_vram_mgr_fini,
> > > mgr);
> >
> > LGTM,
> > Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
> >
> > Nitin
> > >  }
> > >
> > >  /**
> > > --
> > > 2.49.0
> >
