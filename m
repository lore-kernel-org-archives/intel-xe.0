Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99782C36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 22:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C0310E058;
	Wed,  9 Apr 2025 22:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXGWQkQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAC210E058
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744237367; x=1775773367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KTllFMNz9rXP/98fDnSudJm1Li47Yz75o1mje6IOCiM=;
 b=cXGWQkQYJ5rrm0oiTVFnit58boDb3XCZHBfiy8aEfjOOWvHyRGDCxCXP
 u8/UkcfSC3/6t+5DR7cP6MLgrBQ+m5d6fuqkP5Fug1+/cP8PmuSz95Tbl
 q5jJbafYbt0d1aaJg2b20ncbhBbR/CbttunUS8pjtDKMckuL+rCwzPY8J
 cJTbToneuhFWrMnVUaNwXwShume/ebdfYkd3eki5BtQ/2HhUXrzWTMxVW
 vWK940Ql8PbcVHkHanhoSFD8Hm8qqBPwyQpFCHINwoPs6JIibgnnx9S+X
 v0/v/QIXVrnXjr5u51A+QWrdADGQjT31P5R6/BPeh1gJwh46OPcEQvSCH A==;
X-CSE-ConnectionGUID: 60rcOTkBT0uN9/k1lM5M1g==
X-CSE-MsgGUID: p1B6evg2SnSgKm2I6SDrcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44979390"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="44979390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 15:22:47 -0700
X-CSE-ConnectionGUID: vVCOSFKxRRml/k2mHzArKQ==
X-CSE-MsgGUID: 6VNct/nsReSNbFZk76UWpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="129665272"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 15:22:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 15:22:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 15:22:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 15:22:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jY7qGW4u2dR/WNr3SgBz8XCiyTTu73p3JHXIqAyTedu9mh/nSHt3Pz7iAQHwYf9Wg5w+0SSz0ydCGpexGGIogRFawcTUH9nHn7li68zGTvComwUZT8odrRe5TvTA7wW4ErU/xYQf/d0QIbBV4RB+EocIWHxdDSfGHUX+kxOcaq8o89cV6/aFqJEaGxgjDNH4QXGI3HjUdqzIUHI8+MSjCrronJe35LrqB7QJFoAbpHoovg3mz66Zc7hEyaA4Hq2U2BrP+uJMQWqWF6qmRORndLSgPa0nkGX9fNSXiQsRuWB5YhJSygvsgQ9AY8/u6Hs/rGXexXG6eJ831VSD9VuRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwVybGI06Naru9q6wkxTWeSQRCHanR+zjvxKlwcCVFI=;
 b=r7rM6onHR4OrNnh3r3whtCdhekE+V7dGN52k3AbsWdYnmHM4RsVneQH/ayqeR0TXFg970N2rbur/IjGsDF0LvLY+JUd0q+W5Z/A726Z0rfMIs0nvI2lZCQmOuRgW2AfIAJgTrtsy/egnU7RJ0b7V0ROCuutZv8cUQHNDauldjzAjgy8e3ncTnpluolRKQi1RH9y3RPnzYJV4DuDwzMdhvfiH+Usm+UWEPeMtQC4yt6K2lXd8FDOpTYzhJb/aIDYL4DGLKNRR409gLekn0PNaRQSCTKiyc8rH1l2uc+63fWPnsmw17RnFwfxITeTK+T+lNPVvEZuVLFCRbEJd3zExQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 22:22:02 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 22:22:02 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH v5] drm/xe: remove unused LE_COS
Thread-Topic: [PATCH v5] drm/xe: remove unused LE_COS
Thread-Index: AQHbpk54+X+Rh8xKuEiXk/jGEcSpj7Ob7jFA
Date: Wed, 9 Apr 2025 22:22:02 +0000
Message-ID: <DM4PR11MB545698951D6422604F91D9B7EAB42@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
 <20250405171539.599850-1-shuicheng.lin@intel.com>
In-Reply-To: <20250405171539.599850-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB5825:EE_
x-ms-office365-filtering-correlation-id: 1c6e795f-b26d-4bcc-9ab6-08dd77b4f3c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nZR2USzaCQAV3TXT+rLxs6UWkmF4VQYIaHz+UfcPjFbPa2IN63IxZNIszxrQ?=
 =?us-ascii?Q?fL8JbQM3P5ReWqskueKyZx8oJbW1QMS6yF1c6/lINXxZeyzm7kM57wZwIl0P?=
 =?us-ascii?Q?BulVl7lwtw1wHxVdxFqga3EAxzGUoX0FfbxuLZcTU7yc956SYEiKMB/X2slM?=
 =?us-ascii?Q?mXwM1v6wfpgdDsaJG4Sd/62ZQ7Ioo2Au2QZkoq3rlf1vlspi/1uzSdx401+X?=
 =?us-ascii?Q?JzUEDfavwiM3YVw85u6PsJdgBtQ1Hj9YlOfIs8i3hbSLpVWbur9cYhq1tx9i?=
 =?us-ascii?Q?jD8K0Cg51E783DAq607y8vP8UD6tFKyKY5ZRXJ1A3U7vnvOJfCWY+kU3+s7Q?=
 =?us-ascii?Q?+6EX++GKQ1ijcSQzgg5kxmunQ5yAi2WPaYU0BD11SsnHWokmY/GcET+sD64J?=
 =?us-ascii?Q?vUaMQQCm2SD4RP40DZz2jryQmAm+7w3DycyYJ2vvTZh1AxYWS1xFRtDDzflR?=
 =?us-ascii?Q?ZCE8sEVBXUZiu4H6e9Za3WLYDmPJhSg0qfwMRgxhMa0Q/ZpXf6/lWXh/LB6t?=
 =?us-ascii?Q?bNV9aKWJ+Gd2JBNKhyKEjXpkf/OE0HJKpFRKjmzmkIJGrLskBhE8X/0CjIsn?=
 =?us-ascii?Q?rkJE+2nnKDxymtICue4lUCPEfQF/v50BrXPrj+0BCf+iPc5rCNrCqrndznrK?=
 =?us-ascii?Q?9rcv39Ev5VQxPqm9QoaDohER297wf/6hwAPW4IYRFFmLEYHLioQYwUACAlU8?=
 =?us-ascii?Q?CrVwJ48pLqp3hqvNo8D0+4yc32zj+/CSuljQy2Akti4y2nvG5SOvQPfz2/wd?=
 =?us-ascii?Q?nrmSgdvI3WQJgsw7Jfla8/o7BGlayxh02xaqfP7mIRSQLLyPzg9a0mXBHOoX?=
 =?us-ascii?Q?uaMJCC8AyegHAEHnvNQ5csAdBeJxj6Q479FjEKQvet44t7G3oHOFZaXRGnly?=
 =?us-ascii?Q?ZxFQzSNFsKdBea0vBxigJyfwGV9lyLU6f52q2aimus3DHAeFpL4GQvFEOBEX?=
 =?us-ascii?Q?qVlQJusiguZNXyfXWY4nfMgwc/bOm4zAbrpDqhhUB3h5CZUJ2Wy+f6J3h/ZG?=
 =?us-ascii?Q?5Q8/7u0p4zBAw2ZveC+YRiVFf799GNfgKjXipsCgrnvfc8nTiCYxn6ApYNBW?=
 =?us-ascii?Q?1uykgKq6CX/ay9K/yRcIxZAJatBAC9TKShgXGiLxI5pQhWYiGFEMqrni4GmK?=
 =?us-ascii?Q?l7uSgo0KRsQxe2AU/xieqhszQV3rvk1B5OPDUMBlY/SO6dFMCH7OqNwbDbMG?=
 =?us-ascii?Q?xrGlksb/h8ZbC1XC2jXHeQMz4ID77MISG5CZ0/Ws4vzEtpsMIZdH3tV/FAaV?=
 =?us-ascii?Q?dLWjmmyyCxe698XJWuD/rFsXTMChywaOIJnTvfycyofK+fR6ePpnzsz+DX2t?=
 =?us-ascii?Q?sqwVOt2cylI2XB9iGuXU9M0J3U5SWbAMGC5rod2Ftojo4TerhKmIXDSkmCLR?=
 =?us-ascii?Q?A/c9CFVlY8grKmq2pN5LjDqCZsDyBZXAesJXSXaTNmFXCYFhr8/hZaLtKvsM?=
 =?us-ascii?Q?X2+8DWZS0WCn2HwsJReUJObAwJ2OzCa5qtlpfOhyf+QamWlDOv47zfe+yB4y?=
 =?us-ascii?Q?a0fjPQ35PU64Kws=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cRdoQgUQq6I4zfJr4QgOs9VYDTDdbEO/fv1F5PQI/SzqoqHFbuJ71qhwJdvd?=
 =?us-ascii?Q?clTlQAdIHRwKETdWkgdRYrI2+KQqHtm9E3SWvJM24d//8qcdKQ2lASC/3vM5?=
 =?us-ascii?Q?9VFlTR8BNGxDbQ9NOeBmXL4BowGJ7V7vajXyo+987xYXg3FHttZwWcgKgjYz?=
 =?us-ascii?Q?B2miAtMImmrcDXnlqEPNM5R8gSA0Vffjb9oKp9hyDrlAoZyPasQwnamnXb24?=
 =?us-ascii?Q?bpaaDusgfVuZsnQGOyHh17ghxTfp5AiETw25kuOZS7zMsqfaEcj9+dJtymWH?=
 =?us-ascii?Q?O/dtc5dcusc3L3iMuujqssUwFGETfsJ06nQSHKyvImxUdQ+UWuRk8ZbeSKOK?=
 =?us-ascii?Q?Z+Zofb+wfYIBRS5xvc4LvG1U72YZMyl4dYdOED8DYC522WMw8fsooLKoi4uK?=
 =?us-ascii?Q?6S8ZXp1g9SDT/+UR9LrdZ0z3sySvs+SYifXsFPo/Rk37HvY9whUY5lQzEL8A?=
 =?us-ascii?Q?8OTYxKRCV9CUlvNPlBik3rGQdPDAIcgQSISVToje2crwJOh1SrEK96W7Sp2a?=
 =?us-ascii?Q?UA4qU2or71DB1BKblBqHgcXWDZwNXbEsVfelEzflqgoch6fb3NKO4XMd/XaN?=
 =?us-ascii?Q?L9DnuVKeSnjphxtav/IkAw08roucWRizWacEcyE5aRBl0JG3ElHVzxbxVz64?=
 =?us-ascii?Q?5igfNCnoZDX21FHDRo40vs7/Igr1ecJv926UalMjSr1qknJiQbwDCEv0dh92?=
 =?us-ascii?Q?1OszSGEr3y1gPf5Ni9miZdb0GUSk9nm+5xJ5BUNPhyvRrsAstOWTsx6Ij3Vc?=
 =?us-ascii?Q?NW2N799cvh4DB4cLQUM1Kzol32rnqYzao19BmdxQNiHiyLFzifJsm7j0tQqW?=
 =?us-ascii?Q?Dvm7oN1UVpaYQmL1LbnNdkmqmoVgfL/KZJbJWha+rn+YDpzbCBTGvFgiNlDb?=
 =?us-ascii?Q?DWdW0eVdOFvB0a19d71gfWQEpC5wrh7pMJ4eaSgXZQ1K/NE4BhSkiccRK4Dd?=
 =?us-ascii?Q?lhFum7P3PZOTighR9Rfe+wbxwaYa5vY0BR7rNP+piVciWxYA2Kleb5Mtl3ys?=
 =?us-ascii?Q?QFDoEj7klteBC/WzMM5ZJ230bZIEnqM+HH+Fuhy6KqzFSvspnDI7JHTnCstI?=
 =?us-ascii?Q?RxBu4JP0OgM/gzSp0j/771qPAqyuxbNyMvU6KR0gvfsLtiv2phOwW33qdi+Y?=
 =?us-ascii?Q?fX0y8kBgigs1WW2I3M/xzPPjRFyASlbZ7gfSUXilhz7ykXq2iSjv+UctN8gA?=
 =?us-ascii?Q?SwDOvc6zgrzeNteajhXEs5LZ3JcPf4sf7/V5Gb0vQqC98GG9Rkze5SCZfE3f?=
 =?us-ascii?Q?N/CPePoEUlh2vTlFqaN0OZ04oxBs58ask8hL1X37PUiReFvR4fZxOg5rwmiu?=
 =?us-ascii?Q?/WXBu3q/YzIVM4XacWzam5eaGsoa/6HB5Ucp15mWfAyTjcXieQlba3IlmA4H?=
 =?us-ascii?Q?G7od63qEhFiPtwLNvE5TysrgcdYSNmHqNeEIFbgJVzgsplqKadKVF36juSr6?=
 =?us-ascii?Q?HJK9yRTwVoWdyWoCiPhDgLwIJoKMmAwuFl2o7FQCu+/UferODXWF+Clfvi23?=
 =?us-ascii?Q?6J3wk0Rnd3LIicUY1FMq+2fIwDDZuh6DIg6Y/fRNs27tPrfBLOu3Jie0bIjf?=
 =?us-ascii?Q?V86EeysmHwlrkBVu2BPdnCQIfzr6ChimRLX8o/LgIQuRpwFBX/H8mpyFPSgq?=
 =?us-ascii?Q?oDlTdTCxvZeY2VWapIl0XFOzPcL4grmYxsvcAH/Ulig4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6e795f-b26d-4bcc-9ab6-08dd77b4f3c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 22:22:02.3904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGp8u51e5wTkcK+9e0M4j9E91J0ZkwBzTtWfImPx6w1ku0dt96bF6MABL7yrqdPjjh1eydEOvKzofkWPu/c0zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
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

Hi maintainers,
Could you please help merge it?

Best Regards
Shuicheng

On Sat, April 5, 2025 10:16 AM, Lin, Shuicheng wrote:
> The LE_COS definition missed passing the value parameter to
> REG_FIELD_PREP. This didn't cause build errors because the entire macro w=
as
> unused.
> The value for this field is universally "0" for every MOCS entry on the o=
ld Xe_LP
> platforms, and the whole field has been removed from Xe_HP onward. Just
> delete the line so that we don't have an unused definition.
>=20
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 58f4218c2569..cbb9f7cbcfc0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -62,7 +62,6 @@
>  #define   LE_SSE_MASK				REG_GENMASK(18, 17)
>  #define   LE_SSE(value)
> 	REG_FIELD_PREP(LE_SSE_MASK, value)
>  #define   LE_COS_MASK				REG_GENMASK(16,
> 15)
> -#define   LE_COS(value)
> 	REG_FIELD_PREP(LE_COS_MASK)
>  #define   LE_SCF_MASK				REG_BIT(14)
>  #define   LE_SCF(value)
> 	REG_FIELD_PREP(LE_SCF_MASK, value)
>  #define   LE_PFM_MASK				REG_GENMASK(13,
> 11)
> --
> 2.25.1

