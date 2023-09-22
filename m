Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6830CD4F4F
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 10:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAAC10E649;
	Fri, 22 Sep 2023 10:13:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D860F10E64B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695377634; x=1726913634;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5OG4YHjiZpmS2goXCjowM55qS4hON1TiiNdLdL964mI=;
 b=bWuld8jeZk7+OQ2CA9rL51ExcicACOjycAts4uZpaZObzZM44RjI8nP4
 uKZAOdnZHX18sdBvGZQVaYBmR3hapDiFfCMzqiGUR6RX2qeBeKSacRj1n
 xtNsX1osZCGlS3O/5tC2gS4z8D9Dx5j8Y/inuEbuQzQwR389IC1JqSuh9
 bNrjij9XKD8meKywxpYg4BFzSr5SobsrqeHnj4D1PwgRbHMB5/eD1U6Iw
 vByV5NB836cyet1TaIQgigHGtRaFGWqF9nXV5KFBoYkqLGrB8qk6bvXiW
 aDGxoQORPYghRyYPd2ZLf1wIkrR6wOZ/OBb+Ra1k/TNPqdDF4tsHE1Drs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383541814"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="383541814"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 03:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697121509"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697121509"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 03:13:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 03:13:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 03:13:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 03:13:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 03:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RowEYJ241hfsJ6Bk+RlQKkoa+9fDCYJDjGn78kzFOv3Kjng+PhyccUqPK+h4bjkjZqgfL4Xk/WycNhO8O59Mh+LFYrNWv1KsmIHwo3uO2JvSC6ok2mDjVdlSMBNY61Kr1SuBk0h6dLTqvq+SAM+yM3R+HJcNcx6nLLt/LStbPso6aIn3yLjr+WDSgy4Xm1pGYyAa2YanO9dsFp6tcoQASv1tPLKrZyyiw3zXpFv1PRCz1jHOIu3naDPP3HbFFMzWbJfbDdlIxcNmh9F6DNBtgi++z+fnVw48RjXv972AttJAm1tkBZ6WYhuESFse5gSWCfDNqTdrjJr6mxpXa8A+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74VvbZqBollOsq2ZAdhw7WDiaRr5yTd9KUpGS7dh1S4=;
 b=jA49gX33LUmk4I2w61tcCjJ9nOWz89AkwMyYWq5KC3flBNrskJ0Y1sxXWfMCwVp8gGJqq+Zt6DelAEsA73Ki7oNcw9iB5OgM9Cxsdps0z5Gfnl8Vdrcn+pGVyuasySz/kx7iDnKJFFqxIv8hzWz+tmol/VzSpOSmHSRzeNKd+2vNMrQd9CYllrbZ4JVY33kZcAwCU6oFEsXm15oU2PGnSh42LWRSF8yIzrwggVFk5FF43nP7VcS6szkyNoI2Jlt8OxrD4yATrMX2JrbG80m+wgI7oo/UxOpI7DX9UI51MOoNoDDenasctmM84MyOhutUR+E699utDtyy6k4tlya1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV8PR11MB8511.namprd11.prod.outlook.com (2603:10b6:408:1ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 10:13:51 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::88b:6fa5:dca0:2419%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 10:13:51 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 0/3] Remove Stubs in HDCP code
Thread-Index: AQHZ7S8zq/8ZS9BOe06NTXwAZBWE5rAmlEoAgAAL47A=
Date: Fri, 22 Sep 2023 10:13:50 +0000
Message-ID: <SN7PR11MB6750B24EB719051DFCA46B1AE3FFA@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230922082909.334085-1-suraj.kandpal@intel.com>
 <87r0mqo8s3.fsf@intel.com>
In-Reply-To: <87r0mqo8s3.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV8PR11MB8511:EE_
x-ms-office365-filtering-correlation-id: 62dd97f7-7634-4e72-2334-08dbbb549e1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: txTaN9+Q/5gXsHQV/zNtmcERFSOI3DdgNJSWlBb6tAdeOcpPejITITdC37vipyMISSYOdW7BExnflxAPQsHf5XWFcjpsrznURXMsziR0aULTpI+W1OjXxcH4UZpsC/gK7JVUnBXAoLKbZDdC5xDNzq1GibFNeHzHZnDOFLy1rNSIpZTKAbmbAWXY//tF1RgfHhNKBTsXcjn6av+6adVcBypZ+0H+dSD+4f3OhIkmi+2PjHjpq+/SMXEeyWkIo2WwZBmBuKDyVUTvgKJBjnF6XB92KgVsgg4qByXNXjCFiYgTjQY3gOmjshw7aaDUmBOT0kj54Cfj6skijelxFg5H2T5hQ7cVlOfPBs0D79gV7fLstoOhrvixLq3sziOQszk3nI6IwL6UJqbYxvS9h8FZ4juj8rUjR3qF7f5VF39eKQtTIAQfHezM/SBsHrj8aR7ttfWO3WClfOyTZUs5ijENh+fnOsIylkbZ9jk1ZqvyeSPn9qbdXRpYdotSMxiJ/GduK8U7Puj0rtg8Uyq4hfQ+1EuO+awXgtCDGuUZa256nf5Kq85VAUzZ3uHdTvzpD/l9CZvkpZkLMBDLNoOfmrAj/54c1UrhgV1EQBgW/TOh49Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199024)(186009)(1800799009)(66556008)(2906002)(83380400001)(38100700002)(38070700005)(9686003)(86362001)(6506007)(71200400001)(7696005)(33656002)(478600001)(26005)(8936002)(8676002)(66446008)(5660300002)(66476007)(41300700001)(55016003)(316002)(122000001)(52536014)(82960400001)(66946007)(76116006)(110136005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z2w+GZE4M1GY8JHGnIA5iaEAKTu62MiCM+dLHEGbr/Kg3oodrwfaa+Cgeeiq?=
 =?us-ascii?Q?+4xkYzCjxaSYUu5RrHgAeTNakgHT2WM9pDNN/4PXGE6I5l3Jciij4X0R6eoZ?=
 =?us-ascii?Q?dLXfd98FYdSmbA5zMnujG6QFpuySeIjoIh2n7NBKzWql1kioSzIsFTG6U/Af?=
 =?us-ascii?Q?kZFypd8vznWRgnStXEKfPlmofWzRH5PuVl0NOZRO4/LzunNuDqFuvx/Q3YLL?=
 =?us-ascii?Q?sKl0yHuwimnvszAAKvcymM5MjMkdN/xoHsZguakBCFT8gK3kH1XBZEa2MZZ5?=
 =?us-ascii?Q?VL7PnuEraCZbzdyuw/Rlhe4+j9KBa04kUN7lSnxg0aQAIU010ya4qa4sbRL5?=
 =?us-ascii?Q?bxZ79F++JGP0jlwAt2rAA7ZCwYnUATRWeF3EsscpImC/rt9AlXSkpNJB7nPJ?=
 =?us-ascii?Q?8en/FYqHpn6SxVjah+gxu3CrVo6If0Em0XoUjEY8hl0BhsjO9xx9D5SBR+GI?=
 =?us-ascii?Q?5u7flWw78Lt0QZQf6xddFfUweT01evTiqmCUvLXzQol+6B9llct/VXiTfMWc?=
 =?us-ascii?Q?Bjh3xymmmJV0paCvD+yReAX7kcS0enf4QYFJPClZIWmuWxRixDvHBcworXUK?=
 =?us-ascii?Q?Hr7x/+ojPOMOAxIcdRSJIkTpU6lHZ7/BThgjRfbuzfow6O+d7y8FTACDH3XG?=
 =?us-ascii?Q?AFtWEy/7HUw5Nu/er00Yj/Vn6p35YTiYjI93vw2x7BJZgLbwRjxw3X4JzSED?=
 =?us-ascii?Q?jEKt37z46ukRDiQ9lfEniVHtTN2UhR1huTS12WN++UXKGCxjqA2w1pW+gbBh?=
 =?us-ascii?Q?vpMzFkhXrh/EfoGo2hR6fUiEbOBLTfa40SDz9NlkXBXud9Kte6+oXK2rEL1X?=
 =?us-ascii?Q?k3CsAfDu0V0NW6xb7wMf/CVFt/Gq4dbqGMGX620P83roQDzGuODShMbRwg8H?=
 =?us-ascii?Q?wu2WJvbdHvGBwYMk1I4ZAkQuluQHxC1ObR2q4cPpQziX/lcpq9eP4dfZG0yU?=
 =?us-ascii?Q?Ei+yV8/FbY7HNwDS6SjcrzMy8IH2e43fZt5QxpEuiuN9z2FmmGp0x0y+/JFd?=
 =?us-ascii?Q?pxCeHByw99sKDjQ4wpQ5tQexkdpPvJrNjMB9KjWuOEMpEx6c/x4xNHK0Uuos?=
 =?us-ascii?Q?XwLe4VKGF2ua+H2FOEVpoW9c8vRdagL7EqMoZPNsbk95iqpqHeVhRdsheGjo?=
 =?us-ascii?Q?0qUaYtpi9URo/kht3OwTNMGQAsmMAXHgbLbLOcblHPfudC+pGnBu87a5TXw+?=
 =?us-ascii?Q?UO/DrTZP7X1yb85jUpiaYeATUDVgbuZDYojIpU9AfauoVIrTug6Q1FADgyKV?=
 =?us-ascii?Q?p0jh3gfdMldmqCQB+UBZYopUGsa71cQ8DADdJhQiWThJ4Hyvt9R4vbcRM6X+?=
 =?us-ascii?Q?Efajh1QMaWhEgqRXtG26DnFEZ4drZ6lYRT4BBSQDfCR4D+jiIvpoXvDHsF6V?=
 =?us-ascii?Q?kV7FWMOCfpEoaeIGI6aqSEsk8OMNGdw7/6Hl1jDqDWupZP+Y47Jza0rDn/Rt?=
 =?us-ascii?Q?sPjCO3JRKdlfUik6AC06tC6PauEgiEBATikDpNjy0S/p5idMVLvTaKbY3p0H?=
 =?us-ascii?Q?gKIG94VDBPwcw/zRlU3A2IPrj32hCXWnPdUgLyxXYmgFboDHF3dwZ2Jd7ZjV?=
 =?us-ascii?Q?RscyWWzobb7TY4fEJYzK6AlcF+0aDt2xHCdFANIe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dd97f7-7634-4e72-2334-08dbbb549e1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 10:13:50.7209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9LO6Iz4WYRZ6fCrtYibKoiBkObDANU2SoQ8PSUJ7yyMKFeXWZseihnhlYeWBOihOif+dP1pYxgZSwhsEO/lAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8511
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] Remove Stubs in HDCP code
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

> Subject: Re: [Intel-xe] [PATCH 0/3] Remove Stubs in HDCP code
>=20
> On Fri, 22 Sep 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > This patch series aims to remove stubs from code in HDCP code.
> > Patches 1 & 2 are just added so no rebase issue is created later and
> > for buildbility patch 3 is what we actually aim to merge.
> > Patch 1 brings HDCP code in par with current i915 state (removes stub).
> > Patch 2 is i915 refactor which has been already floated.
> > (https://patchwork.freedesktop.org/series/123955/)
>=20
> This should probably not be merged before the upstream change has been
> merged, so a) we can be sure we don't need to rehash this, and b) we can
> reference the upstream commit with git cherry-pick -x.

Hi Jani,
Yes that was the idea, floated these patches to get it reviewed and will me=
rge it once
The upstream changes have been merged

Regards,
Suraj Kandpal
>=20
> BR,
> Jani.
>=20
> > Patch 3 adds the definition of intel_hdcp_gsc_check_status in Xe.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >
> > Suraj Kandpal (3):
> >   drm/i915/hdcp: Remove i915 check stubs
> >   drm/i915/hdcp: Move checks for gsc health status
> >   drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe
> >
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     | 13 +------------
> >  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
> > drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
> >  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      |  5 +++++
> >  4 files changed, 21 insertions(+), 12 deletions(-)
>=20
> --
> Jani Nikula, Intel
