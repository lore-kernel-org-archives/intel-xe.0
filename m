Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CD0E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 15:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F5C10F11B;
	Fri,  6 Dec 2024 15:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqHKz0GC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EC210F11B
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733498386; x=1765034386;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AyYGv2bnkd88jNJsS7/SWquYKiLTa7cJiGdSbAF/OJA=;
 b=QqHKz0GChyUZEZ5TTXKw39+oIdBVHmvMQWtcMEMK0LvoWUvlbbNn3sHo
 Bqqd/dJpmaoluY1ZBh68Jrtwic3HR4lNU1qkOw8eevg1MPwoKa975ecCX
 2Fg38cV8H9V2NB31ALzTOhO9RSNTh6jvfpAntapZtpl9UCRPd6PYAMkc8
 C5Z7LWr7OVYN7d7RngjaeDJMBL3/bzh90/w0HpWixmyBk5aEEDPCdA7bd
 I58h3RBJfmst0B73iqWAPT0IMB5EnBTGp0FwcB68kOfqPPU6VcN4bc1vo
 5sPUWD5gOBpGmdswIKYEgnxcEK+w+hlYVmz/XjfMZnf7fnpBZqr1WGyY1 Q==;
X-CSE-ConnectionGUID: dGP5SJkTQgeGf84v8h32HQ==
X-CSE-MsgGUID: EAAM+sUxRLGDl+gAcaRNcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="34092867"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="34092867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 07:19:35 -0800
X-CSE-ConnectionGUID: izoN2pIWREO4vrLROClxwQ==
X-CSE-MsgGUID: XaTelmuqQ0uxHyfz8LsGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="94288278"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 07:19:36 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 07:19:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 07:19:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 07:19:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEmzJWPzKLSKL+iDgi+9ZREOkuC5jMn1wrDKGk1VNiv12YP7/hEkKPCdLgO2Jgdm+dVA1Q08svQSCusuOgROP0p9m9ojaQK8sHCgCYb7CZLMImOq2KpnS+KkrKykoQwZCCQ2l7mr1E1sQ6tju4bacXaa/J5HllAMhgNuPT1dvROBF+qvmTuZhez5SuXbl6GIlklXBjSsNW1SrlhoMADSVP8n0+n7U8D8pNQB7URcqmA2hkGd0nYGKdse7sSKjdx+a2euNkwMhFlsWl2ckagw9suwoWiaBQSvMtVNyNakGAuO22Hv9kIsd/iczSXe2fESKYUO+RfoxrQcZtRG4nR8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bAhj3p+WcsJ/j5rWGgf1KpTlyjFWzEhyMf32qOPj+0=;
 b=il+Buv+0snlaO1R3n0cUowkLRvaj71L9e7fj5ylD9VPk3j8+Gx6HHtpUT0lz1FvQJI5jrmXuSjbDU5AVpZXQaXiWuHxDbzpIWvjO0DLEsYCCrzv6FoXN/1Ynk2Vku+HUKhO9XI3aowRjTjHUVXxtSYzmcpoV1RkhjOE3ceZnTq71Z9RhYzaGvWDWWbcSsozdcdtR5y/KuttscFHNWJMxfVFVVclHCp/j8T28GyAnAnLqjZXQkArpnZ4pMbmPObnl/OAhPo1s/OfgkaleBVNIsXeL8eGDHguk/C8VO1yYMJH1TzOFrjwoGgb8bWa7bVW/zsSJVO7EJuum42h5pgFwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by CY8PR11MB7060.namprd11.prod.outlook.com (2603:10b6:930:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 15:19:30 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%7]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 15:19:30 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>
Subject: RE: [PATCH] drm/xe: Avoid evicting object of the same vm in none
 fault mode
Thread-Topic: [PATCH] drm/xe: Avoid evicting object of the same vm in none
 fault mode
Thread-Index: AQHbRSfsNgkrFyjwzkmwR2WUy9x3eLLZUMgAgAAH1IA=
Date: Fri, 6 Dec 2024 15:19:30 +0000
Message-ID: <MN2PR11MB4728D59473D4DFD67330171092312@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20241203021929.1919730-1-oak.zeng@intel.com>
 <Z1MOINf2yX2x6jli@intel.com>
In-Reply-To: <Z1MOINf2yX2x6jli@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|CY8PR11MB7060:EE_
x-ms-office365-filtering-correlation-id: 56911e0c-32ec-4eaa-0ca2-08dd1609619b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?mlAlqUC8XfunHzVHEkeqcIYo2Sy5vb7trFjoKf+KG2B9AngOv4XKKkbwtG?=
 =?iso-8859-1?Q?p55U00jUEUS61mG3HiFIy8KnfcMnItS+vmq5PnLCuszyaoXzvFKaQovlDy?=
 =?iso-8859-1?Q?UXSdmQUsEpxbzUwcj1lGQktU9+ewyENmmx+n7a2GhIZQL2Tt/FN/zbL6g9?=
 =?iso-8859-1?Q?YMD4bF0smZ0UOg2SkD8PZa1rEPpxxTczS/eguuGv0i97mE0/FmYW6np0oc?=
 =?iso-8859-1?Q?xOvVX+OcvKtDTP/LHOOiJU8H7KEoF50pza6VlXf9uyjqVuBILNj3EWK8LS?=
 =?iso-8859-1?Q?CqzCvWIVS394xhzkm5Z5p3DN2Fsoco6gDmX20B84KRyqMYAhXSyeOgn2T2?=
 =?iso-8859-1?Q?SMQl8IJ+1aCOu9kOv26/tDbB1Hc+IPPyl8wRfjDtBBbgBqx2NyF5NrMcFW?=
 =?iso-8859-1?Q?hhEdFNu+XEGayfT2b28z+91HmIrSgVp9lbDdOQVQmpNpO9ZGjvGEvndavi?=
 =?iso-8859-1?Q?LvduWnRBEq4t2coyxyPwk6eja6AYOkfRLPAyHMkVYHr6qSpDPdAuSmu/Th?=
 =?iso-8859-1?Q?x8RhHGuicM0lwmGL5n5Uz8NaJYAKrGX0hY3dI25pWKKb/kOKIbaIPyZHWO?=
 =?iso-8859-1?Q?MAOSD/fCWFlfU32J4cleH5TPSaWUCEei+sweMKDMAP0KO5hq2TYKcY3hQx?=
 =?iso-8859-1?Q?vaxHleLII2ysh+IE08vTNU2uKd+7wbHnRtR8RRDTwBZZIGyIOLGX/+BZ+u?=
 =?iso-8859-1?Q?ZEdHTfDOVYeuCVSVIcMhlO4rlexCfsLtK+SBubxwPwjzoiu/AVJ2z4KnFv?=
 =?iso-8859-1?Q?koI59sSWvH31UF465LVjqFNQeZEXMn+H+E54YVEpRCFFulIHlQJ7NinEv4?=
 =?iso-8859-1?Q?GeORlxrAKbaz/cghfL2pyIIm6cRaL52vFaxKIApHQcBXPoVqavEaY5t4XU?=
 =?iso-8859-1?Q?IGGgTF+lRfJDlOS0QE3heXPfynZiMYwf91Eha3AEV3usblyWOCrYe7ldmY?=
 =?iso-8859-1?Q?yW0OYFZHTzi7xpC0rr4t84z30bPgGkDWnWmzWfuIaylQX2SJ9xGXR5gSbk?=
 =?iso-8859-1?Q?b2CBcctNYtAS+3m3dVHRUGCccNz5Yy/0/yCLjGXRro1zQ3Y9GRj5FNlaf8?=
 =?iso-8859-1?Q?w/uGkaheP/7wcdalmxUcyu7B8LhRxJ8J1h/PHKbrw00Tnz8+IZemK6lRIi?=
 =?iso-8859-1?Q?IvCdK11LAEKoS7IN5L6m4TAgU4F/Y0qzKYWupS6d4NuMkxHV+wBJcuOH4E?=
 =?iso-8859-1?Q?FBtz2sGjjj4+qYpXbcecvFpICdPZsi5YvguVTq4YfwPg2TTugZUIctie+z?=
 =?iso-8859-1?Q?9Y8tl6MBUDWEp16Ijzp/gFUl1U+FjGUguylFbcXBwgQ0soQV+LzsBxYxIk?=
 =?iso-8859-1?Q?PBIUdjTmQK791kYHsv6FELVKKU6Ig+pQjjqi1jU9ElFaCe9++gy10eo+Ru?=
 =?iso-8859-1?Q?9MaNibdPU6PGnEJ1ERJBQwknsEx51/h1/GI/+sFuTIL9IyFWH4KWmheiXs?=
 =?iso-8859-1?Q?lNM4aJ3aHicuZM462+ygP8VxSmjBQ0UpbseWAw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CCLloZc/LeZzus64gJK6YEJ/LcltL3b/mDyLUwgg0UFmFnCYIKKyZ03rb3?=
 =?iso-8859-1?Q?ZHBpmuNLK0i2/HDWSl+3nQt3B1dmXfp0YD+J6o3capnUeTeDmfaf3BDYwn?=
 =?iso-8859-1?Q?XT+wT/2MPKH7IcVwLAhZi3VsFn0Htcc48pQ1r8tLMlO/4EdHE5CxlPSQYM?=
 =?iso-8859-1?Q?snZhzmRXHWXObCVX0XT0kBHZECfi16J8uveWuEp74DyDLBIyW9KCLxvBv3?=
 =?iso-8859-1?Q?f3l9ksR8R3tcxek+LKZXxL3IuBbZyQ+Ec0YppZrahXizDQymol1YQUOGlr?=
 =?iso-8859-1?Q?EN5h35wAdfSLkLaouPyQQwro4NVaMNr8MS4KdDpF6R1Az0tHEQ7CX2d/n6?=
 =?iso-8859-1?Q?DEql2LO8ZHUz5jPey0s6+HUFjYkl6/5G1/x7zmnCgRmjRn8KMvsrqQJPwR?=
 =?iso-8859-1?Q?QJA1V9GSrm+fnzUM70TU+Qu5qOa35KSToQKoE5Ikix93L9QXjyzVDYpFAA?=
 =?iso-8859-1?Q?DBH/E8jGM84+Hxa/sJY0dnR1WFNTLcfb8pnF0CzNHtJEEwVxq6tS5EGRET?=
 =?iso-8859-1?Q?Mrj7NYsVWoQBJqal3MQcQ43csYWjYj55kFQ8tWfB7P7YiyHWarxaISX7xb?=
 =?iso-8859-1?Q?D4brAZUGhjHwx818ZgtLwOsMQ6Fc4snDA2KFHGkzhMe1ye4PkRLnwX+pYf?=
 =?iso-8859-1?Q?jwtbtolI2Pi9mzX3ecZ/HLJim1C+8VoJWLnVK4Qy8ibhkwrE4cudMufFBE?=
 =?iso-8859-1?Q?4l1kAYZ5xH6wtwv38tiBBZGAP6EEehUCwCJV1LHKlVu1tamFQLIPKHalAI?=
 =?iso-8859-1?Q?lKArEMSAhr6iLWuQj16F8Fc7bREChw12ceBTO6KA94rvXRj/v8qHAzlgak?=
 =?iso-8859-1?Q?ynhZp3XX0H5hFoygGD+cmHi6wH8ZgfNtnjrzS81V7afZ/ha3R1bEUxPxYK?=
 =?iso-8859-1?Q?qBGgk2fVu3aP13J66CS0OZQim5pYyBrpTXn65jBODcjM2hAAmSTVzRZX1v?=
 =?iso-8859-1?Q?fhTJCJJeBausu3qFENS7f9kW5pfteatl8fi2lXBrc1zncX/8DFv/ez1KIb?=
 =?iso-8859-1?Q?Tvl4S3/ohgDox3kdtA3gW5dObgjwskjJhbW0ZEONDT3Ba7w7+aqT5NkM/P?=
 =?iso-8859-1?Q?5lgZmg3aa88AFiIGtMbEXBf7PtuOiW3/m0k+/JOT9noqNn+QhDpMyB9dYH?=
 =?iso-8859-1?Q?YquJgUbevCnLAvR0VtiK3zRgTM/2al98gp8ywo6gvVdgF30479Zz7m3maw?=
 =?iso-8859-1?Q?SPlqcQCxmJc9U2nTM3EovWtCrM5qt58+HI4XIxnFsTjhzloL+uFr4VTN41?=
 =?iso-8859-1?Q?9YE70fN4QLQbLZxpCYl9QXYIjvSFwhjGvv96CLfjGCL73EpmTfGWpjg50p?=
 =?iso-8859-1?Q?JtmrPRBSzlZIKFaEYfbNqXaX5Pgx0RYNg8DHtFra85d1NU5M4fqdVGKWBh?=
 =?iso-8859-1?Q?/eKh6kj9VqmG+zw5Adx4PsPyyhGkjVnfJsBEqsqNynuBT+IAskOtX8VVl9?=
 =?iso-8859-1?Q?gJZtZnjU+sEEYFT2Sj4Zb3HV7LtWp2elGWJtvCl5McK/xEr56d3105NGyV?=
 =?iso-8859-1?Q?wm4zH2rmyiH2DSOWp9UKQJRIVQmEuWP2KCcWoycpgwt9GGMoHl9LXACopd?=
 =?iso-8859-1?Q?N6URj4+wQEdswQUkOhiMsF2REERmpE+HLVtcHgo76dJCcRORIpz3MQfoaC?=
 =?iso-8859-1?Q?ynEbp2aCW3Nck=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56911e0c-32ec-4eaa-0ca2-08dd1609619b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 15:19:30.4448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ExqiSQoEARxhyrlykfdSCFPLN8jGi4JSwbeAZs0P36OBNwqh6xCHGRpvu+Sx7R9uvNKTxCqFCWs3zIs9zxdN6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7060
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

Hi Rodrigo,

> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: December 6, 2024 9:46 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org;
> Thomas.Hellstrom@linux.intel.com
> Subject: Re: [PATCH] drm/xe: Avoid evicting object of the same vm in
> none fault mode
>=20
> On Mon, Dec 02, 2024 at 09:19:29PM -0500, Oak Zeng wrote:
> > BO validation during vm_bind could trigger memory eviction when
> > system runs under memory pressure. Right now we blindly evict
> > BOs of all VMs. This scheme has a problem when system runs in
> > none recoverable page fault mode: even though the vm_bind could
> > be successful by evicting BOs, the later the rebinding of the
> > evicted BOs would fail. So it is better to report an out-of-
> > memory failure at vm_bind time than at time of rebinding where
> > xekmd currently doesn't have a good mechanism to report error
> > to user space.
> >
> > This patch implemented a scheme to only evict objects of other
> > VMs during vm_bind time. Object of the same VM will skip eviction.
> > If we failed to find enough memory for vm_bind, we report error
> > to user space at vm_bind time.
> >
> > This scheme is not needed for recoverable page fault mode under
> > what we can dynamically fault-in pages on demand.
> >
> > v1: Use xe_vm_in_preempt_fence_mode instead of stack variable
> (Thomas)
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Suggested-by: Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> b/drivers/gpu/drm/xe/xe_vm.c
> > index 2492750505d69..016fedae5d554 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2359,13 +2359,15 @@ static int vma_lock_and_validate(struct
> drm_exec *exec, struct xe_vma *vma,
> >  				 bool validate)
> >  {
> >  	struct xe_bo *bo =3D xe_vma_bo(vma);
> > +	struct xe_vm *vm =3D xe_vma_vm(vma);
>=20
> for single usage like below we should avoid variable declaration,
> specially in
> this case where you do have line space left there... then it gets even
> clear
> that the only change in the patch is
>=20
> - true
> + !xe_vm_in_preempt_fence_mode(vm)

Are you suggesting to remove above line "+	struct xe_vm *vm =3D xe_vma_vm(v=
ma);"?

Vm variable is used twice below, not single.

If I remove vm variable, then below I should write:

Xe_bo_validate(bo, xe_vma_vm(vma), !xe_vm_in_preempt_fence_mode(xe_vma_vm(v=
ma)));

Is this what you are suggesting?

Oak

>=20
> >  	int err =3D 0;
> >
> >  	if (bo) {
> >  		if (!bo->vm)
> >  			err =3D drm_exec_lock_obj(exec, &bo-
> >ttm.base);
> >  		if (!err && validate)
> > -			err =3D xe_bo_validate(bo, xe_vma_vm(vma),
> true);
> > +			err =3D xe_bo_validate(bo, vm,
> > +
> 	     !xe_vm_in_preempt_fence_mode(vm));
> >  	}
> >
> >  	return err;
> > --
> > 2.26.3
> >
