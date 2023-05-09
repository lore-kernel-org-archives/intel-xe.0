Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3199EC77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 03:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3F910E0B8;
	Tue,  9 May 2023 03:20:31 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DD210E0B8
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 03:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683602429; x=1715138429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+C8UnYAt6Oyf5twdiCy0AiVEWQbLqWd6WrEeIzea27k=;
 b=UHoMJgt/7dLTADXdCtQI9Uw9MFO33djewBt502mvTFXvwaQx0A5O3LY9
 /z4pEzqrZ3k88c4h0e14KiOaBD1NivtTBfUxJnUjXB92Pj0B7zKPZAfPI
 BRDJMHGlBK7uI4muFlsrUbwSYMZpVNX4ZM2pQjTmXEt9ODCxTUozKL/L5
 V44Q7gTdQt1D7X9Jc1+7Vb4DIa9r1nEgdwi/KqWOOuH32wfdNmQPvmwcy
 sXmNprVK+R+GIMITJB2EZxnbWlU8InrfAxHps84gBlt7Glh2lrNQ4Ge4c
 Ppitp5QTDX4kwZjQTKU/q+RIwYdEroa1uFeaQM2DePF+zItdxl0bNZsGz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377896218"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377896218"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 20:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="701667840"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="701667840"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 08 May 2023 20:20:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 20:20:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 20:20:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 20:20:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 20:20:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJvFJV2LEhRbJC3c1BHLJ9+2jRZMH//5nB1mveD2y5+JeY9I8GGeF25AEw9Y9f7t4cCj8+5hBEFJNMNSFZtxdh98GITBjy2wJnUrHQcDgbXA3OY9rQr6qTzbWgjACOCYI5ppHNaxYPkNcwes/fm7sPHXeSi2SkzApbZ0JbbWcdySbkt9fkXYNgm4FfnpcAjMfBdpDqBlGhW5DWPWplfM0GNr4SB/TzDvRYsrObkV9m/Is1L7DHqfzYJFoZv7DcsfQ75GlB6nN4dFZIg02l9neQf9ejeerftbVuoOiQsXMw9l1bPUsp5v0GBHH6eU5XXNIK9PA03QqNfhKaIZawPABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBdIJkgJgebUcXY1XkK98BKefbh7PJyVdcRO3+2aqt4=;
 b=KiBlOYTpasSUtnYTposV6xTm5ZxXHMEwKA2v/jU2yEhUx9+8Sl1vce6ddyF8CowyvG4Kq4MPqfQqsEZFhCDP/4HzQU3pMbOYJSSG+CHmFCOiRzSFzwf+aV22TJ84gZSdFizvdq0EJFF8iO1cHar7YKoAx4o0YB+7JVDtnhlUcd5EFto9jehVZC6aJR7yE0I6zJwTDU3ONRpc7tvBWOXFfoh1QQKU3d7U76JElZOVqGPVv+QiSIcaED1EXqniJ6u3Bow0zSrPGBFFgVn5lWH16FoG8DNY+iBc7dAF5lnEIkZJV5z80jXX8z+jd6f2JzT2/kqRjT042xehlw/z2NP2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CY8PR11MB6937.namprd11.prod.outlook.com (2603:10b6:930:5b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 03:20:25 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 03:20:25 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe/pm: WARN_ON() on unbounded pcie parent
 bridge device
Thread-Index: AQHZgY5Z229IhyFr6EyJp+hvUpwc0a9QngKAgACofoA=
Date: Tue, 9 May 2023 03:20:25 +0000
Message-ID: <CY5PR11MB621101BF5C5C5B3F769B530595769@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230508091734.1938204-1-anshuman.gupta@intel.com>
 <ZFkt+7SAlhL/T5gt@intel.com>
In-Reply-To: <ZFkt+7SAlhL/T5gt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CY8PR11MB6937:EE_
x-ms-office365-filtering-correlation-id: 1e14d2c5-42b9-44c0-6ba7-08db503c54f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f67pBKuSLaUED4ZxsjK8P2EKsnhLSFU6LbIjgTsBzc/19j0QkXiAgRcuHTTmvOrOvCm2jJDEdIX9pftrJKFLS+7z6l2zujAzdDVqS+VbzAnFwYvWCFphw8ozPYFsB8urNR0bRoPmfZseLxCYAUTKR0wMhfl85QcVpXSDdE1hlMCD8xo2MazUNsEKtR4iYWlIMTZEMX+P8XfV7gzu9C/Me+6fEfulvdvrGdp7v2xM9eyM9AmHKtQqd+dy1QS3IWZ06TJMiFdamW9I7G6NSfC6pL/z12XeO5m9OqQ/L5GL9PtyAnszOy/N/BDvmM4lnaZD/gGtssQMAOlRMpK0pbYmGQNjTFu8uNB7byglgh5IhevgDBGfKojGINe3cKBbohX/R3nBOWTnY05gbSNs1Z+fyaqRMD5C3TUwuAHXSH0mMJWRUeJhU3uxdAG1pgK+FScjRRthvosKfpUV9dkI7I7DZJDIaVJSTIauVNxWjcHCaLTHBl3C02+so447aM+0HChrk+mh7fcT1Dnai1aOGX4DKZ+aNhdVIUiOVmWwZo4tOT9SLcsz+hVLkeGmQoDCZ0kOZxd0zS7e8fXFSDsCwVAg/J0RpDMLoCNwm04L5KF+fGVAaYOxtioZwgdrBSdlXusC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(52536014)(5660300002)(478600001)(7696005)(71200400001)(41300700001)(8676002)(6862004)(316002)(8936002)(6506007)(9686003)(64756008)(6636002)(4326008)(66556008)(66446008)(66476007)(66946007)(76116006)(53546011)(26005)(2906002)(83380400001)(186003)(122000001)(82960400001)(55016003)(38070700005)(33656002)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eJzqH9EcGAQbW7hSCzdbckQZKWPjCDQ9ASdjj201twwoTxClVHSzI6uu6w9Y?=
 =?us-ascii?Q?ZGNJYiyAB7yObYY3ZkHpMfWnnJzD9Gvq/2XcI0Nw3yx/UOBXhSbsYDaCMkWk?=
 =?us-ascii?Q?pJ+PBwGNSE7MywWLGXWiX8C1P1zHtGGdhcmoZ6H/a4hZeHZ1LaRg/ScCR8FQ?=
 =?us-ascii?Q?gPHlQQik6TtJJP/ruVmJdYRG9BkXzJ1/z/9CL1tDT0+FGOhE+/uO5Jhmrvfl?=
 =?us-ascii?Q?jF6rR5wDe7XWJvmrY9Cipng1S6qCQca2o5RYWhc0s7mQAFHztUNRWWpMIQpu?=
 =?us-ascii?Q?nZjn0GOhiWHVpwLYkMbWylVmjLw0FakP97J4SWTuSAPTEcMw43KLXPJaBfKK?=
 =?us-ascii?Q?PIj1pbXeC5QJWrdBxfnCfCkr1lr87g1eJSVqVw04G+ZIiTqV8wHWx2YQfqag?=
 =?us-ascii?Q?5/BDGkY+uH9RsKKny3vbSmP/BWZRl4ha3G3nWmFgd+72NTcB+UCAxPyt3Ayn?=
 =?us-ascii?Q?+253RvkX46FnZtfBgiS67Z0pzDEidB2Vjr2Ht9L/pv4i5ZPmVlF51lgvYGfY?=
 =?us-ascii?Q?/h9ajhIupHgyezrnBM1exGbsk2LFZuJYEH6HOTFK/iYfHZNjS9YNCOdJUMHL?=
 =?us-ascii?Q?K1Tps9eyG1eGD5PmKos/5swciC2sPakUmWuYt7dC07BW51K/yc8mh5KqlytO?=
 =?us-ascii?Q?EUWTmEl64zj0JvGo48jtrywR8FhEcE00Prvbg07InyYS+tjLS6sRrz9YoDBu?=
 =?us-ascii?Q?n9rpqY2Bjc7PdvUnUwOW1290ZqycvqE18RVbYVb94p1ClctJMFuOVqEN+eXF?=
 =?us-ascii?Q?WIs++52DlTASXn51nVp/aGIuF/3Dr/MP6tNo41MT9MzMq2VrDtrFWAQvEY4i?=
 =?us-ascii?Q?wCLPRNBsC5fOhHdDucAfJL/HnzvhZG5kPpMtxz2kl6i+Auyp4I1z/6YkGGvH?=
 =?us-ascii?Q?OMOo0kceMG0QIhLBRjv66jjRxKhnLj0QKye3cefXtIdKtTOOqUgFSOynXHw5?=
 =?us-ascii?Q?cegmTqf0hOGlHCO94aNOzimoAHldR4KEMdKsKslxs8FYej4yBDuxBIkkAyN5?=
 =?us-ascii?Q?E4kzmYEmJOT230hPUag/ATchchXjJsMmuTIZEvBx0IJ7EymihlOup4o4YmiN?=
 =?us-ascii?Q?TEV46ztSkL8I0drYY3f6ES6TsxRiY9+Y3qS0XqOpGF67gXOLvK8SNwbrZO0+?=
 =?us-ascii?Q?gSpLqMZ5dS4Am3q/wFavXceRS51svTQ3C+aYi247iXBuMt2+lUfK2Hx1nXvz?=
 =?us-ascii?Q?ytiDnPim4o8DluMZJZbCTzGgMWohMjyqWjDHkVMlLONBzxLjTRedR3gl77zk?=
 =?us-ascii?Q?4x33SIk/D4C6/xzyhnkHAC5HR+iqEwua2cMzzJ616LHjQfysI61lUZF8c1xe?=
 =?us-ascii?Q?7XZn9JNgqymzJflHPc9I9Pax8RPdsSwHjKkHXozy687HtvTVVAw68u+OOi7/?=
 =?us-ascii?Q?xJmmmzEo9jaWbqyh1T6q3pf8eAM/sYbE9eBIa9wUHRmB987y5QuO2SuPVM2v?=
 =?us-ascii?Q?ot05o0PE5NXh703aZzJRa/Yn081btNpZay3wgRBDUXFaWsE3ULQY0MWNTTk9?=
 =?us-ascii?Q?o/bTclUHccoB2onm8GdyacGcq1llrbiPAnda3B3rvgsGkWzOXsiW3FYkMiGp?=
 =?us-ascii?Q?jEiChGcj+pt3czDrlOgwOVxJ1bHEwq60llvxJSvA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e14d2c5-42b9-44c0-6ba7-08db503c54f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 03:20:25.6775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sOjMAtu/AqBGbCiMEcuT69beR1X4BHt4nZxS+D4DZR7Aq5AyLrk5If6Tu1CMmOTddKYmG0Lzqs/XRU0jER2tbiSSYLSLqn/r22iIl1r7qHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6937
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: WARN_ON() on unbounded pcie
 parent bridge device
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Monday, May 8, 2023 10:45 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: WARN_ON() on unbounded pcie
> parent bridge device
>=20
> On Mon, May 08, 2023 at 02:47:34PM +0530, Anshuman Gupta wrote:
> > Intel Discrete GFX cards gfx may have multiple PCIe endpoints, they
> > connects to root port via pcie upstream switch port(USP) and virtual
> > pcie switch port(VSP), sometimes VSP pcie devices doesn't bind to
> > pcieport driver. Without pcieport driver pcie PM comes without any
> > warranty and with unbounded VSP gfx card won't transition to low power
> > pcie device and link state therefore assert drm_WARN_ON() on
> unbounded
> > VSP.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 19ead642442e..dc0d5cb4950b 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -667,12 +667,24 @@ static void xe_pci_shutdown(struct pci_dev
> *pdev)
> >  	xe_device_shutdown(pdev_to_xe_device(pdev));
> >  }
> >
> > +static void xe_assert_on_unbounded_bridge(struct pci_dev *pdev) {
> > +	struct pci_dev *bridge =3D pci_upstream_bridge(pdev);
> > +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> > +
> > +	if (!bridge)
> > +		return;
> > +
> > +	drm_WARN_ON(&xe->drm, !bridge->driver); }
> > +
> >  #ifdef CONFIG_PM_SLEEP
> >  static int xe_pci_suspend(struct device *dev)  {
> >  	struct pci_dev *pdev =3D to_pci_dev(dev);
> >  	int err;
> >
> > +	xe_assert_on_unbounded_bridge(pdev);
>=20
> besides warning, shouldn't we block the suspend at all?
> returning from this point...
If that is desired then, we shall check this in xe probe and initializes th=
e PM OPS with NULL rather then failing suspend ?
Br,
Anshuman Gupta.=20
>=20
> >  	err =3D xe_pm_suspend(pdev_to_xe_device(pdev));
> >  	if (err)
> >  		return err;
> > @@ -718,6 +730,7 @@ static int xe_pci_runtime_suspend(struct device
> *dev)
> >  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> >  	int err;
> >
> > +	xe_assert_on_unbounded_bridge(pdev);
> >  	err =3D xe_pm_runtime_suspend(xe);
> >  	if (err)
> >  		return err;
> > --
> > 2.38.0
> >
