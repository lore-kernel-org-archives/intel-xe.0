Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B916C001DB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 15:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E47510E19F;
	Tue, 15 Aug 2023 15:35:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B962210E194
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 15:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692113719; x=1723649719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KVjpfjhV0bpSukq1AYX18R2s1GWVnDocfQJgaxGKE/0=;
 b=KAZK7x8c9NBKqDiBdv8u9m/xOnM33ywKoIkldkhcP/ucdndeft23UbfX
 jy4ewzBFXFhbWDXOEYmFxxth9L3EaYWreSck4vBDXS5+mfYR6qdBEO9vj
 g95LD6fEWNjhZwGMUxK4IaHGJgp4EINMk6Z1vKKtv0OC0bGdANPYPI8Jl
 dvwTl2aK9J0H81zhBCyZyg9qi5WG4DrJwGphVp9e1aK8Xtp+wRwmSorxS
 oh3I70R8A3oqRJe1m/bJec76crCeYx6KBd77zSFTc3BfYGUTK6nai9A76
 qOpAt9tSl/5WoOyYJgxMYTOTpGYX7xGL5XHKGQvknuo7Rc4Q1HjBOaCKv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="351895533"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="351895533"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 08:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727405933"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="727405933"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 15 Aug 2023 08:35:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 08:35:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 08:35:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 08:35:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 08:35:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pgs1mArD+l+nlNxq2B2ZdCr4BsHbv+j9/VktlK04ZV93xu5oiA0M5+MtridnEEhzaPrd9SbI1r1lqONGo8OY0poDTuRP/5GdLzmi+4q+LeDneEIKZV2Yn4zttqLfxSuuldzgenoBqE0rt0AXM/BVCZOGLVVSBG5tFo292eUc5GjkgiOY+qBMLyUaTaraRBOEB0w2iV4ZvNtE6dDzyjiMbLwc+WWLztuAVw06cLgjKW/3VrlkFuUKPxBWeiKM+64B+8yFE5caui3hL5DtwmIamrSktKgPegaumduBIvnj4L8J69rxKKqJRqsM0irlnCdFxiuMz7ONdHMDwmteuUHU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKJi7z3t38NYZAdsO7YgXqDbZXc9jJmBGR8c1ForJjA=;
 b=BLkJfdv+3w8rIW8P31Z92oArsBgh2Bfz4LGajAzPjjk604r95jGXCDKomFyXqwSxqCEUIOaiTE4/bkZR6hUZgnQ53bYrpiE8IimdsguU7miTlZ3b1uaOZofblbXdUoWLSmrKqUcu1ya5Sboj4T0JjPLpkrh/zNyMMwru/T2jTEUQjiOtokN/jwvqPPVQCb/DjGY1mXfjKtx2wIGLDQYeT99Epc5/8Gym0LrQ0KOFlDpxMP0cepgc94SUbck2H/cGfFcS4lUj+6dZKiiTyOXngps2RcEtZvP8Xg0lVXar+yl21/7JqQZcUSBSe5B9vwA+DaUvfZDpz5FHWBkOKErUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 15:34:59 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 15:34:59 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [RFC 0/3] drm/xe: Add drm client infra to track client stats
Thread-Index: AQHZysny6FgFmzdnI0yH8dkTTzTrpK/rhihw
Date: Tue, 15 Aug 2023 15:34:59 +0000
Message-ID: <SJ1PR11MB62049700C18C686A610BF2F78114A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7312:EE_
x-ms-office365-filtering-correlation-id: eb8a895e-d02f-474d-3ceb-08db9da52f3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RPwHpmD3KB4WrsPaZU/NrNf48YIlFPrM7tgChqy0YQlIzYBoDFS3Rkvh0E0JHxmRrs+RZO2kPBGQ4ItM3GgJ7DgnTB7CY/6UACTcSszvvAxBeweEokiLYxUofxolERp36pXr5cjRy7IE6wNL24IdDS5sbIIQCxjXPItkOCmRl4FxXXBae4GeiKX9PfZNX6DPv3OB4zAjEVn2hGJEmBr7hoV/rx0mxtAH4VlmSvAbWajGzm9aiOU5ggGofCXoEre5gbcTvwwoqy+rHeLmZ4v3TFErLdaRINI6qRAZWx6RrHZEeSkU6vx3NAwgGb/j9jeI9/xOAAVUt/BEl5FRWQvCdPtEiZths4/WVzHrYzUic/q/VZ97NviIIfooV+RSxCgUE8nnCBxmwhHJTPovBqYlKQbTK+NuFG4AUmXn3xT2GFqQI55WlcttMsdgnMPTafqYbK2wWLaBbEJiErPjFzsZercHLVVUFd0wJ8RQHKQWVFh+vYcDVN7aC8KPHDxe6dZLwtYJnhS7NFg3CV/VjRJwGVaK+ojdaFp9wagLj74l0BiOY3A5+ZGxUZcq+Ex9YsgyASfD6m9l8ZQ9rrjkhzYe7mbo9C3aGLjwd+R5j8bSd3ksUU0QbkPsIYnYgJUqY3Bq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(1800799009)(186009)(451199024)(478600001)(38100700002)(122000001)(53546011)(86362001)(52536014)(5660300002)(2906002)(33656002)(38070700005)(8676002)(8936002)(6506007)(107886003)(82960400001)(71200400001)(7696005)(9686003)(55016003)(6916009)(4326008)(83380400001)(66476007)(66556008)(316002)(66446008)(64756008)(41300700001)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fl9ZQJKUXMMgnaX2sIeuxaF4PtutIjxyv5+hCs1642gGCzoSWsB6xEK9hNiC?=
 =?us-ascii?Q?az6ay1re+1gS66r1UqXjOGeqam2Vu2OtkUhFKUYAQJ8r/bhcTS+qYKUmrn16?=
 =?us-ascii?Q?rEmOiB7vO62NZFIopKTBf07yeTqw0UHOHPAgCQrfkMFifc43+qTbKSVajMzD?=
 =?us-ascii?Q?2Zw1vvScyetcoSBNBzigDco3nKVTFyX+BufN3Ss1X08s/DauZYm8PGCi2ctd?=
 =?us-ascii?Q?Qp7DBhmA9lolVAhWvxNQnBTXIk94ejtq9VCA25kwFsvwfgXR6p+NGhz9rueU?=
 =?us-ascii?Q?bnsjRoTS+Vlk0eI/pqSaU3HeqwNouUF0wG5UwWb4RKaPbRF+occKH3sNa2UK?=
 =?us-ascii?Q?6WN54KxO741shNen4yB/mp7ntmYg/IpXBZsLNIliq2r1E3GbZPNDIgs5jizx?=
 =?us-ascii?Q?t/oyYpLZ38mgXytBw496CpS2bI3imbtVprQqv5gnX5JyvzDHn9D57otQRO5b?=
 =?us-ascii?Q?hlT6MHG0+LfnJM/k9nMZJSoPSH4htycnPy/Cc4ZbTZ+TerIvNRB8DkL4cqNQ?=
 =?us-ascii?Q?L4PFLi7n4Rb4zvoI8ZjrWBOpe+apw/8B2EdKZThdcT1UiQv+cKzOcRcQEk0K?=
 =?us-ascii?Q?YXpYx2CY7rqfrTlXhlsNveIyAG/f1Kb4IXW8z/hQkHO/lzsvCC7ugLKDZMqm?=
 =?us-ascii?Q?M3Ci3WN5SL4xkdO4lZJpWqkCvFO1Jle5Is4cRo+spYJWom8ox0RB1BO1XL/6?=
 =?us-ascii?Q?otL2Z8agfjhDs8O5US7W8lMDbm3LuaVWPEuZnpI5A0cwlJwyjM0/k6Nd45KK?=
 =?us-ascii?Q?zHmWVclMBlmzsrBMVoBXbkwlR9PA+gsgGQ/UIPENGAHL4yunBGwK25XEW01l?=
 =?us-ascii?Q?S1Mi00udFzPslgUm+1Tes/76mBOdONWQT2qdJjl95u+ZyTA2S4Ez89mTEkbU?=
 =?us-ascii?Q?h56dJDFnKQ+YmuxL4PiqSmpBNYeDihFZhbEL4yFvdo/4aF4a81mrxl+VjAaK?=
 =?us-ascii?Q?gT6wj+oTt/w/whHdFWiX/vQ/k+ycn4/DUzMV9R7sfWWLkFVS7YhIKeIStSFk?=
 =?us-ascii?Q?XoSm2oPqrFYqfcvPE1UG6rrVkNxQ4WScn8j+GIMHA8k+AiOf7BpSwBqXcQe+?=
 =?us-ascii?Q?gt7Qa5/11U/NpmQNanAvYizWewGRx9pcQl2ZUluHMWLl5VaFSkhkXSi1m+d3?=
 =?us-ascii?Q?u0JTlzNov5MyNU734GSfz3JlQdAquejrQK1+ghqgxwwrhrfpHgZQk2Nj3TWA?=
 =?us-ascii?Q?TlU47hCSQhCq2ma1Nkdy+iISGhxtmzRuy9XcHxWIF36zaPO8y/H81rbo45rq?=
 =?us-ascii?Q?XWC6lut3m9B4aTQlw1rk5A7XeW9KS9QDL2XFjceYjA70YeSzUyHpjJg87JwN?=
 =?us-ascii?Q?oP2iALBwwCpBmX9qE/pVooj/1afDfSVesqZmIB9MUQda+sA5UVz0zL3lhY48?=
 =?us-ascii?Q?WGUTgs0G3v+d1E0w5RwjPX6AtpPW6fOveUDZ8RhmQFO6YBqEk701rSrLcMsZ?=
 =?us-ascii?Q?jbThne+ocPHYDFPZLx3v4iNG8BTcdptpJTYUpofPC7o0n4MS4z35tEKAshhd?=
 =?us-ascii?Q?LEq4tt4Fj4DCBXOfuB+Sp9k6WY+gU/BNbxN8Oq5hTv7aJbJfkFTS9YHBV218?=
 =?us-ascii?Q?4xBsF3PUTT6dsW02YfFxFOZZMyztP9+7yDL7y4/R1+IdKGo7HsJr9XfV6HuP?=
 =?us-ascii?Q?eFnf4njjWRude6NCSuwc6uQKj8xzB5iUOQxKjQUuDpEA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8a895e-d02f-474d-3ceb-08db9da52f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 15:34:59.0665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8imOxh/YT+dpG//UAT4jQK0xOlI3izijRV/3Ym11Q3sc2xcduZwEPdfYZFeYOzAlVh8ia0dBfIOcDHEo+FOtZVYz3tKbhS0LfospmHbUuqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 0/3] drm/xe: Add drm client infra to track
 client stats
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

Can we have reviews on this please, sending RFC here to get initial review =
comments to avoid last moment restructuring if required!

Thanks,
Tejas

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Wednesday, August 9, 2023 7:38 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [RFC 0/3] drm/xe: Add drm client infra to track client stats
>=20
> This series adds below in corrosponding patch no.:
> 1. drm-client infrastructure to identify each client and its related stat=
s 2.
> Interface drm core fdinfo API to drm client infra 3. Adds API for trackin=
g per
> client buffer offects
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>=20
> Tejas Upadhyay (3):
>   drm/xe: Add drm-client infrastructure
>   drm/xe: Interface xe drm client with fdinfo interface
>   drm/xe: Add tracking support for bos per client
>=20
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_bo.c           |  5 ++
>  drivers/gpu/drm/xe/xe_bo_types.h     | 10 ++++
>  drivers/gpu/drm/xe/xe_device.c       | 14 +++++-
>  drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_drm_client.c   | 71
> ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_drm_client.h   | 71
> ++++++++++++++++++++++++++++
>  7 files changed, 174 insertions(+), 1 deletion(-)  create mode 100644
> drivers/gpu/drm/xe/xe_drm_client.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h
>=20
> --
> 2.25.1

