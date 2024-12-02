Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57826E69E95
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 21:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D40010E0E2;
	Mon,  2 Dec 2024 21:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGLpTab4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F234B10E0E2
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733173887; x=1764709887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wWMabtdokmxyeO672m6AsQIWKnA80zky7tKase9u004=;
 b=nGLpTab47aMZCaWYaOnGztkIoBON5PMmmYsCIa4Zyc0EaF1pm8mVX5MC
 oSe3VRZ6XEn9A6TXPASDTPNhM0EodhazOnKiGahTp2vlTxUpVLAInmOoy
 Xy+Quxu3Mwpc8QURYisUWMFDQKDHFKjVxM8jZRslM3vhhDqwIlzsdY6Or
 bgmIrFEUZ2bqI9NNJd2Hv10Siqf8fDMea1KqLH79+rDdnNIgiVLbxHtzr
 0QntQb9Mk2MjmKVGjXYxghFl9Bjxy9JneBHrO61zAWjEhHu0kzlXMZVaT
 eBwVXCYFRE6eApEgVjVtpVMtq10SClyGt0cQfY2kJcgCn6kgPKNsrkZxm Q==;
X-CSE-ConnectionGUID: h8QIxRXTQ1OKm9G9IzU65A==
X-CSE-MsgGUID: tBRBkHU1RnSiKisVTqbLSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44398814"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="44398814"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 13:11:26 -0800
X-CSE-ConnectionGUID: ivy4gNZBT7Okl82ZjWYDfQ==
X-CSE-MsgGUID: HjVO67JHSkSEK0ylNLhqjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="124059692"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 13:11:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 13:11:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 13:11:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 13:11:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUZTuQhdRlqQb8MLEc85jHoLA0EQYlHyUOoPDx929O1I6sRiflQ2vSMuWcihVXBDpqkS21DyygV3ZY/OjLePwAMBaxVwkGWmwHzIiw9YAHLzplzTVxpZgiZeGUAXFZpsmIgdMo4UvkcRK5a9yK6YpYTvZxrpx6PQUe3dtSgyF3RZu9eDyQLen2ApCXh/wp+XB93Gg8/OUBmAWgOQgDlFX1fE/P4Fu26ZsAMWytLQrvWcUDQwRHaE6kSUjMhiMlxdZARp2HQTc8vRk8zt34s3lXZHe76eqWcU9FXQEVyXyAocMfJpUuvUb162L6eh6vxjdca69dkbVaG2Tdnil6qRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b9N06lyrodCXwX6PjiamGXz88A+IQuNQDCcA6CrAnQ=;
 b=wv2FZv5LSMGw1ysQRGqHSZ7vWZbGAgt9bMDwMwts/A4WovFF+ZWM1QswkqVzN/FMMyUyUlhusAgkTHaYnSspE9BQ40TC6+RYgUe0CIKamuo7buVN+IsAvdBYMawfADd2ld+XrwdUO+RLYny0KxrDI2WqVaBn2F+96Ry1cDv152tTmE5Nw+Me2P6AgVkKsqh7wJvbRRmsfKGdu25Aww0kqYdNqoiymsXS/sRfGrug2CZuxiifOmnW/yfIC3T0KQdahF0WK/b6RjhwqbkFtxiUgEFOWZRd838fy6bd5r7YMaDRC6lVfvX3OEWCVbBHEQorsYk0QlpArzGDJd7SbOqSWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Mon, 2 Dec
 2024 21:11:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 21:11:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Harrison, John
 C" <john.c.harrison@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Thread-Topic: [PATCH v3] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Thread-Index: AQHbPQmPITnRNbTJZUeIZ9jJ+h2B0rLTeMsAgAAJqOA=
Date: Mon, 2 Dec 2024 21:11:21 +0000
Message-ID: <CH0PR11MB544416674720232DB8B7B8ABE5352@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241122180826.7075-1-jonathan.cavitt@intel.com>
 <85ttbl3jvv.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85ttbl3jvv.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB6670:EE_
x-ms-office365-filtering-correlation-id: 77ee65b9-88cc-4423-6346-08dd1315df27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?tWL8IytuU20S+3cVR2ZZhTBrCzfv9qOaFMCDKd8BmnqZ7OjNJtWfwW4BIl71?=
 =?us-ascii?Q?i6cR6SDSSbmXL4hgDvzXEFfKpoYNyhr/fEedIF5Ap2+zgVLPQbXB5gti/M4m?=
 =?us-ascii?Q?fQD5J8S+VmrpnTn+JCfqODxY/QfsxjuLCLWSu8AI3/4HbBjg8H2WybMYhhN+?=
 =?us-ascii?Q?ltUM+TSVzKhl2iaFHt4JhGPaROrIKEm4Yc1Kn7rOYK6ajCpuHCQPnUGJlaZX?=
 =?us-ascii?Q?HjlpqJFPw2Q/nrZO+O9fd2sagHDtIkNkVGIbEF3H0DObqvqHjZE5uotLPses?=
 =?us-ascii?Q?UjhY2wfUnw+VQSjCKjkmE2ytvnf+yWYOr+ch0elBa7Q5TzuvQW8UJy65vz9F?=
 =?us-ascii?Q?WgpebXz3BlAQm2YqC+XeFZV3sAU8PTMCmaiV7waKkwZfO4a8SpnTlagixYjH?=
 =?us-ascii?Q?i0bZxvSTxvhS4QbzKfb2KoS9eg/ie7N/S2eT88uhwF2GQHobCwxQqlAP9dED?=
 =?us-ascii?Q?4NVgbjdg0g0SGJQYALJvDRMiMgu1zKnBdM2OS6rNAjDv0TIdrtrDR2ovOPg/?=
 =?us-ascii?Q?sq8e6UX3e5C/DQxWRQH08IHLM9uzQukYfkaTu6t1zY5h9OkCJgyEAQTFGcV3?=
 =?us-ascii?Q?+YCEiYhSpbE85GEVd72fTqvYj+tZZTLb1dFD4bEO3QWXJokR4LkFmxJmGE44?=
 =?us-ascii?Q?t36ZHLtjdq0CmLOYLxLnWR2tOinP8z0lmB2IlWh7OuouTHsrthtlNY3Q6jre?=
 =?us-ascii?Q?qiT1HI+7eTILXvCuKuYWHZ3H3HJAjvMn2uzf2q661PjcILZXUZ/DhvvJTo6c?=
 =?us-ascii?Q?GoxXJV/pIGQjcNwTWeJaFen8JRlWXlZqwmt/eGeecAwRbKZhsCE1/nsorEjW?=
 =?us-ascii?Q?tBbEAsKWYIB3ufu3iFlwrTu0sZxg+5VKqNTDjVYDuX3QuyLCpMD0VyjDEow+?=
 =?us-ascii?Q?NmSmGyHcXQmWJeAauDp4RNb5C98yZSNzA0CNhMyLvOoJ/IfrcVVQnHe5mpN6?=
 =?us-ascii?Q?x6hOwE8Up7yHvpUIPjZ8WEaQLhooZgk5dlNT6x5nupzum81c7jWQPI+LbGtz?=
 =?us-ascii?Q?ebQ5yrGhJehT0HgJvPkQSnhaHHM/7qNyN//ICN+vD0R4VXPhIaUIkg4496N9?=
 =?us-ascii?Q?cx5xgWaFUR343jMkdgB6+rPnXfy8JwYYqYeKw2+et2FfmkLJbGLRZGijZCzN?=
 =?us-ascii?Q?CBAWHk6A9BQCaUtWFRFBob/QjTk2rKjISb7HfQG/MKq8xolf8YCjhqGDaIVb?=
 =?us-ascii?Q?QuA9dkGHO0kGPsgH8gYsv0vZ/UhHEmWqcy+DamX3Si1P8O8cjyy8huhDzRV6?=
 =?us-ascii?Q?cM86ggdsmpXKIek771/s8j3e77r6rDGZYCigix8b+lqMEC4ZEcRBZKkFfwDx?=
 =?us-ascii?Q?tevBXnDVoprcJy2jtxNPOGG57si1v0j/MPshgRNl8pF4pjqW0DqHZ94ZHe09?=
 =?us-ascii?Q?ax4ABPE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uwsqsRKzGWNGCFoNcTe1oQ1TZooDlQvWNdU8mj3DByrhxtOimVce9ORUVHoG?=
 =?us-ascii?Q?GzqjH2nglpa7AwFpatPCttzYHrJz4WBzpQ2BIJqxE08JZSvVvOqqAQoLEq3t?=
 =?us-ascii?Q?pRyO3TyzvrVPE5e9dQDCi8VLvwtfWLCGK+1fTDoId2A0P5RXTa35thDbuVKo?=
 =?us-ascii?Q?QjA2syFnjvHDlT7iI3iyYh91mQU7Mt9oH/zFrzNafUFR8s2lgIG4nUR1zDKI?=
 =?us-ascii?Q?ZOAPOiIwm7drpAV2061uD3tXFIfjGeeAbbXwscef7Bv+e5UXWBC/VZ6s7eNi?=
 =?us-ascii?Q?llDIn7U5W+opXv2189WoDWAwiSsY84iKU74Ne7dJr7r4Q5+o6/8DLi7hZBlY?=
 =?us-ascii?Q?Mvmi9laxCSjqglGBtOK5zHP/PVrnJOajU6Cj022EBV45KIxBah7YaduNCWB2?=
 =?us-ascii?Q?9FLl96wqRNB6mcoKYtJCPbFUgI6wp38EXACIXwh1a4BBA1jM+5l1+ObDc1pj?=
 =?us-ascii?Q?t3tdQZz5Fg81mD1kg27v04vbA3qP/W9dSmufWezaYJLdKfBXcewstw4nf+RI?=
 =?us-ascii?Q?ZNcv9IRDkK7eZc77/keZkSMZ6hJazBo3ANhAc5tHUbCx5Jj0SUUYkNP6+qJ1?=
 =?us-ascii?Q?9ZA7opRx2/welrbeEyuKcf+KkLWi0E0g3Re4w/gxpb4XaUtel2Moc2WZSpEw?=
 =?us-ascii?Q?oPZ2Iuog2dZQpahDABCofbB4KakFOVFhmjEVmvgXNaP0YQ0mg6s4Id+nur6L?=
 =?us-ascii?Q?0LyJpRTXomvmYiWAtZ8Iz4dPH5kKtG3YGhH9dROJwBxrQP/sm7eix6XXkjQ1?=
 =?us-ascii?Q?4/CHLBc38SUBXWVVjrGDdGLHB701Iq/ytksArrQHV/PwUjn3sKRA79ZdovLj?=
 =?us-ascii?Q?UCEEgnGvbQdqGg+2QuB0MFEV98rXnscfz48SKQ9EjjkSdvV85QWuXA+JDU9f?=
 =?us-ascii?Q?UvBqfCm9vAM/MzziQifIcG98cj1YnqaLN+k9Fi8lEiaCIbJp8hmaAZnl/Bdc?=
 =?us-ascii?Q?VtbVe3eWnEkpk4rOIdhzin/l1zOaNyfIirtKs7GoIhrXMRqxcdmWhzwyRbCN?=
 =?us-ascii?Q?0LuVwoSH6ti4MRVKoBKhpziGVP86Aif1pdsOoMPSYHVpcaaRktlBLhl0bCFB?=
 =?us-ascii?Q?zB265b0xHGiqlY/UYrqmAF+hKBbTWoZNFttUjTNPa2CgAcRPKHGy5+qr/QBH?=
 =?us-ascii?Q?YceUpz4Z/AALflAY75+cWehjhXIDEJ9IW+mrgVT4k68kYQkED91RAqk+tXzX?=
 =?us-ascii?Q?5BPsGKD+txfnJ789reYt7ky1qt3QmIjSJZoy6wnk5guo1mmeXba7d05BQmVv?=
 =?us-ascii?Q?HpIlnXklHOephgnadiKqpA4FOXxgrklDkgVdZUHTzttFkfWhlT/X5QzfIe5H?=
 =?us-ascii?Q?ZLXeyjK1KGuvt5m0I1mNQdw2dmmlJjPeWTyUV6E7xeqOZRaxRa0gGJuxrX3o?=
 =?us-ascii?Q?FRxO8n0rM1lPmUZxJ8Vy+gPu6zQPrhGx+kp+CmurWaETTtVtghYIyF1EXZ74?=
 =?us-ascii?Q?/JJO4h0hj4kleT0VD3Yvn9N9UDh7GDdmC1a3vB4tjVmsX3eyCQBF2Qj1kJuV?=
 =?us-ascii?Q?bhHfT+5ybXlCOdyQo9e9V1yhbnJq1CrhTfq8IQSHoiPqW2VPYk74UxxEFlVF?=
 =?us-ascii?Q?RXOiQGkg5plaEHZdo2YhDdpexDl6RIeyt9W4wWSw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ee65b9-88cc-4423-6346-08dd1315df27
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 21:11:21.5550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0cWzke6yxJzRqF51hkQIcFAhU1o68JK0Qwt64z8JQwTPFAUXs0o+OQU3dInfQLY1yz4WWpXBtVd8/jEe3ESVeZm/SlndNMRFQd3SbrtCbUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6670
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
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Monday, December 2, 2024 12:33 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.=
ramappa@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Roper, Ma=
tthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel=
.com>
Subject: Re: [PATCH v3] drm/xe/xe_guc_ads: Add nonpriv registers to write l=
ist
>=20
> On Fri, 22 Nov 2024 10:08:26 -0800, Jonathan Cavitt wrote:
> >
> > When performing a guc_mmio_regset_write, we add all the registers in th=
e
> > reg_sr list to the save/restore list, but do not do the same for the
> > nonpriv registers.  Add them in.
> >
> > v2:
> > - Add all NONPRIV registers to avoid undefined behavior (Harrison)
> > - s/whitelist/nonpriv
> >
> > v3:
> > - Rebase
> >
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: Lucas de Marchi <lucas.demarchi@intel.com>
> > CC: Matt Roper <matthew.d.roper@intel.com>
> > CC: John Harrison <john.c.harrison@intel.com>
> > CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_gu=
c_ads.c
> > index 943146e5b460..b0afb89d9d90 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -243,6 +243,8 @@ static size_t calculate_regset_size(struct xe_gt *g=
t)
> >		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
> >			count++;
> >
> > +	count +=3D RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
> > +
> >	count +=3D ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> >
> >	if (XE_WA(gt, 1607983814))
> > @@ -727,6 +729,11 @@ static unsigned int guc_mmio_regset_write(struct x=
e_guc_ads *ads,
> >	xa_for_each(&hwe->reg_sr.xa, idx, entry)
> >		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
> >
> > +	for (i =3D 0; i < RING_MAX_NONPRIV_SLOTS; i++)
> > +		guc_mmio_regset_write_one(ads, regset_map,
> > +					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
> > +					  count++);
> > +
>=20
> What about the EU_PERF_CNTL registers which were there in the original
> patch? Those are not needed?

It turned out they weren't.  At least not for this use case.
They might be needed later for a different issue, but right now we aren't
observing any issues caused by their absence.
-Jonathan Cavitt

>=20
> >	for (e =3D extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
> >		if (e->skip)
> >			continue;
> > --
> > 2.43.0
> >
>=20
