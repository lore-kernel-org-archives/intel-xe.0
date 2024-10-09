Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DE4CF0441
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 05:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27A010E104;
	Wed,  9 Oct 2024 05:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmHzG5it";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED89710E104
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 05:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728450433; x=1759986433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xX9M2PTuVkGBXRHKt555rKFtG2Syssj5CdHPQpkWjG0=;
 b=UmHzG5itBPy8WfQVlsrUNLqEvQI7dUBlrR9Nm8ePykjCNm05fzxhca/h
 rOfs/4Ft4hsjqkcdNUDfM8MvRSvMyv3TdoWTg7Gepvy3+4knBYXuzb+7k
 5Lp5ZTcyOqM4C+c43NGK6XaJ1W7//kx5mOs05F748Y88pAB4LSRaMJj85
 OP2tnnxMdqs1jBLguTkaUejLw/IBXQ9IQjnsw50jwF3Qfq6k2XQSFqyk0
 kpc8UgCwtc+DyCXT5gqo8I62Wq1ZkSRhe8AfzAzBC5TmDfyNu4mwA7KK9
 MjS73ZxoXE1Ht8iVR3DD8qTiyj/DOLPDVYdu6QA+No2XTl7qCChRgQcwO g==;
X-CSE-ConnectionGUID: cXRFE3NyQ9GZVVeIaaWjvQ==
X-CSE-MsgGUID: Gl+o9yDFSyujlnq9g6cgaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31507949"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="31507949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 22:07:12 -0700
X-CSE-ConnectionGUID: CDMCXO0eQya/YirYHn/wfw==
X-CSE-MsgGUID: a66StaG/Qu2QofPKbAE0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76085895"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 22:07:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 22:07:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 22:07:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 22:07:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 22:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v39B12ARm9qai1rVFYV0OyZT9p2bGtxHmlpSI0baQBmtlSp9kXCyRX0By8W17hUUxemZ8EREfZ6i0aCTEN/sPrxNpFXrWX29VVMFgedojG9v0A4PEdpuSw36ALMwmP61o22c//zlKlABbOTy7Tu8TfEkZMw8WKAZjmuhPiMPOhX2Yyr/RtwvCnt43CKbpOkQYz8QuNShh/e1jxbBu7/o/wNUI6RBuyuUWoUFDTRpQKU/L3tAbtFs4WsP9Q/FWQX4iqgwdrO7FGi/Buw75+Jm86LVUHHRp72nsq6Lw6Jk6vBJHXfnq1cOctBGTNVjP3gAD4Aoh64h46wox4UFOnQIMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxdYo4iCLwYpPoVrmlcDbek3dGjiApb+58FUqrYsJSM=;
 b=lLd0MX1Sx3qMoY9VG1TVd9y6jhY3FFhs7hSi9kqvV/VZrvcpi+ZBDCXShlnFbsRkbuOjB7wFRcqFyAk2LhDshpL1pK51wEMWc1s5YmaKivVidEPMv+JhFehT6nSZpyWpQ2EmpuLWYOoPWkHhLmc+OIi3vuClYTO/USvMvwzUP3ESeOjWDtj2Yg2LUWH9ukDqFLGLWC7llZIvs//URRZJ84Wqs2tM0F2gWaxkz7KFyQq92JAfX4m9K5OlNM95cgG/U3SfMM0gzcouCzufotMar0SVRz3DpKyUsvofdox2/sEBZiFQO56TPekhPTa3KK/uWlwOac6a7GnPqvZTLV3Btg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA2PR11MB4923.namprd11.prod.outlook.com (2603:10b6:806:fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 05:07:09 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%2]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 05:07:09 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Zhang, Rui" <rui.zhang@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, "Pandruvada, Srinivas"
 <srinivas.pandruvada@intel.com>
Subject: RE: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline timer
 during lapic timer shutdown
Thread-Topic: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline
 timer during lapic timer shutdown
Thread-Index: AQHbGL4zJHvzhxw9MkaEh9LFuxO9n7J9HxcAgAC+ovA=
Date: Wed, 9 Oct 2024 05:07:08 +0000
Message-ID: <SJ1PR11MB6129963997F130842352E589B97F2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20241007135242.3028131-1-karthik.poosa@intel.com>
 <ZwVtFJzWMUrTwg5C@intel.com>
In-Reply-To: <ZwVtFJzWMUrTwg5C@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SA2PR11MB4923:EE_
x-ms-office365-filtering-correlation-id: efac4202-5bd4-4a7f-4e93-08dce8203a03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?mPH4Uo0wmyMCfH5kf6DCB2XYX+7HoYCE+0LAMk/1AHbiykOlyg8B66NU07i8?=
 =?us-ascii?Q?zR44Sx1mGu10sDS6bqApzsbHCBH4m3ENOsYp94XFjOuLw6nWaxKJ5PmgHtQu?=
 =?us-ascii?Q?jheN8ZOebaNt6yX0q1qCa0QwNCK8EBrq0GZRA9Swir2EV8L2X80O5PQVgrGr?=
 =?us-ascii?Q?2hC4g6GM9GLQBLf2BcMxrkTq8LH6OLJ9Vobmg9DKNGb25SAzFY91cJH8i9WE?=
 =?us-ascii?Q?WLf4vu10eS7wAr0oKpNVIG06jefxSX5S9e6ImGdGd3zsCX+0jrVXyiftsw3m?=
 =?us-ascii?Q?sXavMt2tRZdXQM42X0PZs+cY7zfzYavhAARfUVe9OwTeURtEoEv2v+NjU4ja?=
 =?us-ascii?Q?LXYC+8JzEYjkda1bXRbrY6odjKLtH3n7D8Yztv/MiARS7HtwN9Y3n8AyaftA?=
 =?us-ascii?Q?ywXVJOAH20lCQutArAIAadWgaP62SW++HUuugHqkxqByZZOuzgWa7hixfaFe?=
 =?us-ascii?Q?DPGDSzr+9b4VQdN/P50eI0YUrVUkhZeKpNtp32J3ja3BLtO4HaUhE2Rfku2e?=
 =?us-ascii?Q?r7Cr2sctF9espn3hFLy1LfJndnmZsC8MZz27GkARLsCWKXysaMaDj9WUtQni?=
 =?us-ascii?Q?3s2Et43d7ExpiGs2kMPhBzKopp+ohaq3vMtzRaDihPKq9TH5uFN6wr+LwO8V?=
 =?us-ascii?Q?QFopumASPrGD1aK2hXcsuK+dC7GX55R2zaPi9Co0vKFhDH7glzpdHAviV6lh?=
 =?us-ascii?Q?xq8PdV0c54L/ZsFFPi/3JH4ByWQGWrnSQZiWKGFPkYUDAfnwHQIvVTq/46Hn?=
 =?us-ascii?Q?dJNdIoP+tG/6YGesqoqSL6EOJl4ARxRNdGnetCjYPdwEneTFTvd7+TmTrjvX?=
 =?us-ascii?Q?Pvit0xQbN3mXLsyqtPHbhNMryAU0irEDbxdJgKsSikEY11kaA5xh3X9b1H7W?=
 =?us-ascii?Q?0VuYF6Z8aXbBLkZiLUFVtG4w3aNhtB0+wuxsYsYitM9cJ+NrCsFpp+hOQfvm?=
 =?us-ascii?Q?MPMHia2t2oJMxlhL5CzRge4g9qik5dik0pDacaKgKuDM1IUkDJ3xDBQjZred?=
 =?us-ascii?Q?KE8f41bxnm6IlXYP4d8sOgfStfNcOQHBRpf0ij3yyxhABeeBoKJhQVbH4F7w?=
 =?us-ascii?Q?/SWFXFIOYHsjO+5N/6LgLbBejLA0AcxZj4ZHvMi6MGCHCyS3BaBBBS4QQwll?=
 =?us-ascii?Q?8XX8Jve7Vh9k/U9/iFq2xcDtJKsaEQEpeYucOd+BGkYpy8AP6MRAh1ati9aZ?=
 =?us-ascii?Q?ZHvX5RDKL6/Vm+FjQQAHUhOfEyIsuf7mjIPh4UbTXjxE/JHlhA9WNIdH56T7?=
 =?us-ascii?Q?TYajPnwhoczNeRIFuNknHKzWjFvXuoCPyCKyONrvF3viXeEgwgkBSLcc3jsH?=
 =?us-ascii?Q?I/Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kyq7KQmgRAgQ4c1fgQnt4qO8V7V818IgwhgbXh5rYT92+BJ5TuG/0E2fsdwZ?=
 =?us-ascii?Q?2KoL8DLuznwm6toHat5HqY0A5Mz5nmfS/TlwagMgT2GJo12D/s5ny8SjOr7I?=
 =?us-ascii?Q?7OhqLgm68tSG11RL+TDN/J+TNl4Z1YdeV4Qgu0iO/n1UcptkIPrPjrnKrinA?=
 =?us-ascii?Q?h/wqvFKCDs3gU4vHV7ux6vTGBIa4p3SOfSanH0sGK3M07y9KvixqzWWpWaxU?=
 =?us-ascii?Q?je1wrC9npaoVIdZXuCDnS0zkmDnndSw4COYzvaTXe2Ktaq+RKLnpP+LMpaTi?=
 =?us-ascii?Q?oeza4lX6fyfjY/Dpq8hQ0EPbsD8r2rkGOCNEEyPX4ebcXtyZkp4fvkUzxSvg?=
 =?us-ascii?Q?AxhmwxPAmwdVurnENCtUmV+fbSbykOrnm8PjFS3VcJiQXFHH70uFKPwmqFwv?=
 =?us-ascii?Q?rz8K0A43n0nhY5ehxl3bksJPCenpGbmw4TbI/cmhiokgmV0Xzm+PFj79VnJh?=
 =?us-ascii?Q?+pmoAfL9F5nH8YYZJXh5po5qV6djq54HfFoXy85gptxwxzPgYnoYvnTp3XC2?=
 =?us-ascii?Q?TepZpCq9K+Kgocys9NVq1wylBzTZ5o0cxI5uPdOSd5K1Ez0Fn/LUaZN8qWOd?=
 =?us-ascii?Q?SNDey6co6zciuJQAOxt+RblNf7g1/JiYrBtd6WZweVnmHt6fDg9nx27/vW3b?=
 =?us-ascii?Q?OcOBn7I9MokJpqHzUxCS5g5WkgkP7NwTtk9iv3TPtyWoC6lAFH2jo17D/4TM?=
 =?us-ascii?Q?/nMhsKv6QQ4QWb9yKZh6J/971MDkktrlOZRqNX1/oBAIB++Io1/HFyj3649Y?=
 =?us-ascii?Q?RjxP+TkD9U128E/noR9eoQ0KsymaEORv00KI5jeVcw/1H4QWMAQ1LYyHww8I?=
 =?us-ascii?Q?TtgF/DHiMsfB9tC3S+H8r6VqJSXYfY/XBglsP6+K1CXYlSyf+aQmWeNmo152?=
 =?us-ascii?Q?0FPolpjo+93bKgaIwvWXB3/8dXhJFicYOcuOOZJyp6V7nxc0yVsUS0SnI7d1?=
 =?us-ascii?Q?nHKuD5LBNZ1hxO3utvgbyi+gAMMSw97Q8vqYJbJIMg4tj5WfdNmX8RjJ2Dmc?=
 =?us-ascii?Q?FXg+150ie0gHKDS2z5b4Ur57M+uAnmmpyHrTid80lb+f2v7QQpB9+HMmrkCr?=
 =?us-ascii?Q?PJCHVSqxLN+TuC3O/o3x34Gbs1B5ypq6PHiFg2LbqoOJO9tk1JY1bPakGfYr?=
 =?us-ascii?Q?0AdDEvJbscAb5/sXlfOaOAwHpkaJyAYAC1jwLtwtcEf0GL6M1UWEttQRIgOt?=
 =?us-ascii?Q?IxmTvGNsSBbdZceXMJzT16ez0R3qDjb/5BAM66lFK4wLOdPLi1OkbypjXI0g?=
 =?us-ascii?Q?QQkh6dTbGRbUgGsfZVuMEMY+pgp+Sc1JHfy8ABPHjBwdpBoP3I09gvI1pzWm?=
 =?us-ascii?Q?GRxTTkR2mTJvAG0AzkMEW89FyIaPKoqoJSblT9hXy8kG5a3zUakkdfIhntGf?=
 =?us-ascii?Q?jXc1DDHmZ2ywfoRsObKsZRgEOfJKi7HHyncDHR4dfAMOVGqyXxkC9LWskbxs?=
 =?us-ascii?Q?iANbz8/FNBnQeZtwDRHl7l0eyw0uioFptWSfEUh95uSXRG6xqMrQFivQqTV6?=
 =?us-ascii?Q?N2nEVm+ZoW1x53d5CVxnxxShvFcu26aIK9qjXGsRUNomfRqii/3antRGFe2U?=
 =?us-ascii?Q?DIBkdxF5RpRDbOCoh+rArtVtkPosnXx2EXvTnb5vnpKKgY/zEgTp3OqLHt04?=
 =?us-ascii?Q?TA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efac4202-5bd4-4a7f-4e93-08dce8203a03
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 05:07:08.9276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fF3FhDnw0NfIaxyudlCrKW8BdDl8tDOaYfIDuCg9mBO1wy01OrxjzxJYNA2o6w6r7NZt/LzTgXutDzk0lrSK7xkbV3mfEBZlVvSpgXnayL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4923
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

Hello Rodrigo,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodr=
igo
> Vivi
> Sent: Tuesday, October 8, 2024 11:04 PM
> To: Poosa, Karthik <karthik.poosa@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> Zhang, Rui <rui.zhang@intel.com>; Saarinen, Jani <jani.saarinen@intel.com=
>;
> Pandruvada, Srinivas <srinivas.pandruvada@intel.com>
> Subject: Re: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline
> timer during lapic timer shutdown
>=20
> On Mon, Oct 07, 2024 at 07:22:42PM +0530, Karthik Poosa wrote:
> > From: Zhang Rui <rui.zhang@intel.com>
> >
> > This is a core-for-CI patch for
> > https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com
> > /
> >
> > According to Intel SDM, for the local APIC timer, 1. "The
> > initial-count register is a read-write register. A write of 0 to
> >    the initial-count register effectively stops the local APIC timer, i=
n
> >    both one-shot and periodic mode."
> > 2. "In TSC deadline mode, writes to the initial-count register are
> >    ignored; and current-count register always reads 0. Instead, timer
> >    behavior is controlled using the IA32_TSC_DEADLINE MSR."
> >    "In TSC-deadline mode, writing 0 to the IA32_TSC_DEADLINE MSR disarm=
s
> >    the local-APIC timer."
> >
> > Current code in lapic_timer_shutdown() writes 0 to the initial-count
> > register. This stops the local APIC timer for one-shot and periodic
> > mode only. In TSC deadline mode, the timer is not properly stopped.
> >
> > Some CPUs are affected by this and they are woke up by the armed timer
> > in s2idle in TSC deadline mode.
> >
> > Stop the TSC deadline timer in lapic_timer_shutdown() by writing 0 to
> > MSR_IA32_TSC_DEADLINE.
> >
> > Fixes: 279f1461432c ("x86: apic: Use tsc deadline for oneshot when
> > available")
> > Link:
> > https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com
> > /
>=20
> The problem I see here is that this seems stalled. No review there. Is th=
at
> merged in some branch and moving upstream and to stable?
>=20
> Cc: Zhang Rui <rui.zhang@intel.com>
>=20
> > References:
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12344
>=20
> The right reference link we should have in this topic/core-for-CI patch
> is: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2766
> showing the why we need the patch.
>=20
> https://drm.pages.freedesktop.org/maintainer-tools/committer/core-for-
> CI.html
>=20

Pitching in because I helped Karthik prepare the patch. The document says

"New commits always need an associated gitlab issue for tracking purposes. =
.... Reference the issue with
References: tag. "

That is why References: tag has the gitlab issue to track the patch's event=
ual removal.=20

Ack to rest of the comments.

Regards

Chaitanya



> But was this really confirmed?
>=20
> Anyway, I'm hesitant here mostly because I don't believe we should add th=
is
> patch if that is not getting propagated to Linus and/or stable trees.
>=20
> > Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> >
> > ---
> >  arch/x86/kernel/apic/apic.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> > index 6513c53c9459..d1006531729a 100644
> > --- a/arch/x86/kernel/apic/apic.c
> > +++ b/arch/x86/kernel/apic/apic.c
> > @@ -441,6 +441,10 @@ static int lapic_timer_shutdown(struct
> clock_event_device *evt)
> >  	v |=3D (APIC_LVT_MASKED | LOCAL_TIMER_VECTOR);
> >  	apic_write(APIC_LVTT, v);
> >  	apic_write(APIC_TMICT, 0);
> > +
> > +	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
> > +		wrmsrl(MSR_IA32_TSC_DEADLINE, 0);
> > +
> >  	return 0;
> >  }
> >
> > --
> > 2.25.1
> >
