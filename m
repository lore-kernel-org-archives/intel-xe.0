Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F080C7EE2C
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 06:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA9010E6B0;
	Thu, 25 May 2023 06:41:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAD810E6B0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684996887; x=1716532887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YYHZ06ejRn23409ubZSlpqTLdtzUs1H9oYBocpFtDac=;
 b=ahyVJJ/c2+MnXISIWPeKldkqEnI4cQlJN4nUyscUwfngWveEwNFXXg4C
 99Z/UXwuJbUaIAdOiPg9N7fQgippXCIFEzi01dxGcjo+6WJ7cZJkUScTq
 Pmo1T/MKcV6dqRxNkEVD8MNqbnZV7FNIhoGsFSX0nzYePY64GZAXSel0T
 Zp7OCKSQyOT1O3w7QQbgGEcSh38Te1itGgMeZIcf4bKVnEE+yTFdW8AB5
 20IHoxQ2XrlA0Im9Ru7QOZQEGssaQNHaAk0lV+g53j3MxINQTq3GfENy6
 6IqH6z7Oj/C4zgx10Tw1CByIr89zjzhx//yb9jiubgCb+15iPN2gKvu+g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="352643301"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="352643301"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 23:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698862524"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="698862524"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 24 May 2023 23:40:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 23:40:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 23:40:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 23:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8iikUSrhpUaKj7qE4ArNFlvZ7OMifeP/EfD6Ezw6r0dZl/ZdsPTOBFH2I19GshlI69HDP87IjKGb8TMUOsCDTj1hgdeOUbtza2FwUGUc0yiY3rPfFU2F9kyx5kk59c5CP9ka3KP4Tc31rEd7SZUZYT76doLA5pzAcH44fQqrCeOKcXvMzTH3afddDqs/2owtPWhOZxxec69IJw1N6A0NeyA8lZsGLumEfKq5DybR703bTgyCuyNXaGHUd73L1qNVqAkBVnIUGrvQQTk0TmsmvvarLB+0KxVM6nTT4V+HQAp87yrKPQP8WeGN9mXIsdLlDtHp3FMGlmjisCXPIzhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQuyhdNfNvG6kvJETYidtzkY5bnpZ9J0PnmpDqNgAz4=;
 b=oLW10BVOK2/rZyko0b0hDgPWu073yxzFjCJvqQnF0P2/zJtKunz0O0B0JXhqBmqWH5A5TAtZw0+P0m9si5uxTmWx2rjtrI85s4ez95hRBSS8+NIdTvxst065PGnTHhHRtWzJXgxtOoTddpbIpBQIrUja2065YCouteqmFPoopEXYD5qY8e9wgcO16jbRW73brlP2JwZuOvfGg2WEqKXj5sOMCMoZFrjEg2V3A3G0Vp7f//LhuEl/TdPT6A3JVEow+QhWKZ4PSNG8wGBUjesFPf/vDl9xr37s1p/bej0KnR2ZiBcB9+JZaGrb5tTR4oWfT/KXj91/09seahatycRJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 06:40:35 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 06:40:34 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [PATCH v4] drm/xe/pm: Disable PM on unbounded pcie parent bridge
Thread-Index: AQHZjh+CTnYUKkjEtEyVOoP0BssxJq9pY2aAgAEnSTA=
Date: Thu, 25 May 2023 06:40:34 +0000
Message-ID: <CY5PR11MB621198BAC189A87C87E4F35095469@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230524090653.1192566-1-anshuman.gupta@intel.com>
 <ZG4KkAo1PwJfvzpx@rdvivi-mobl4>
In-Reply-To: <ZG4KkAo1PwJfvzpx@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB6263:EE_
x-ms-office365-filtering-correlation-id: 56e6981f-d030-4998-1ca5-08db5ceaf15c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1tceiGvZZpojduW4uAD8nuJ16eM4sydahQpak3wNmG8VE1alnHfh1j3uOE2QmY79HDNf+UVlVcESsAqzyaiiNuP+LzdRW+itn1xSJJsYeLRorDcAqkyFRtLezWi4AjI/0ORhqDVQ/57Ta58Ypo+k4TJW78Q9VbUHgEeHGhwTak3iKXg4uivAqQHKhY7Ev+assHmdgk3GbO+6pAhRTmvK7dm7CuabUUvqOzH7xiyeTg18JoRWMwhKDN6lQlY5MJwxgiPGY4W6p5M7tPwk191aSs0u9tzN4D3DN0JCX5oNnHVhGL/qI7OuxRewHkM/MxAk8V00rWfjLqeRTcCI9hCJYwODGj7VmBT2pMoT62Xe0xR9LDkdSbX8hXOUUMwhtx96eyJ72GzMRYwGWyE+hzOSG3LNwdnsEF8aXhIVTrpvfNDw9BqmX8/T1IU9206LNkMXyGi66vxQ7YCsNjq8/CNfR5qkm4F1IOzgtQNqB3VBFWF05nliAm4iJRcexz7gMZIEjZxoILCnFQyk3neBTiBaHL0dM3AkLaLdcCRk/QWyMsx/9JJsjRR8GL8dlyMkR6b1ZKMqsIPk2tsCzLdZ6YVSz8HL9Yekahc0p2PoW+4Gu5l0IL+uuydVHMuMTenzcV5N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(33656002)(38070700005)(86362001)(54906003)(4326008)(316002)(6916009)(66446008)(64756008)(76116006)(66946007)(66556008)(66476007)(478600001)(7696005)(71200400001)(55016003)(8936002)(8676002)(5660300002)(41300700001)(52536014)(2906002)(38100700002)(122000001)(82960400001)(9686003)(6506007)(26005)(107886003)(53546011)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ScAAQdwTVCYrElzjGUI6n+fZhLpX9KBG6JKB2z6q8tFM68YMU78SMY9/cfp5?=
 =?us-ascii?Q?Qzg80PiPU8mlUWSJTrJR28GGbMJ7c6YBun6ocezaSV5COvOvXlqUL89IfsR6?=
 =?us-ascii?Q?nW2EjEaz1kbM5aYD514KvwHvIpRcCGl6fNybssGwwkyuTleGRQqodua94c5l?=
 =?us-ascii?Q?7RZu2LAjjSAu29dq5JW9+Z3Zr3i87zZCrHZgMGQNmtorEPE8/XbGnC5H409W?=
 =?us-ascii?Q?IhabJWN9JAKw0I35O9B/l3h97E+Sl3vJOtp+jtt/9v4nxZ/JqXGNYQG0HQpg?=
 =?us-ascii?Q?YjL/S3bOKRMGFY7mC1kA89tsD4tztJgTJDyxsk0sHEh7C34LHLyu5N3jC4RZ?=
 =?us-ascii?Q?wBJ6s32UZ3AlLpJuETyM5fP5pjgtJadIxtfPGnJso0cMy+OoSTWqceSAmIu6?=
 =?us-ascii?Q?9+hdnbMmBTRwqf01HGdvOvIRnz20NpOJyRul3MvK7SegnpWjLK0ldIKR3ixU?=
 =?us-ascii?Q?YNvIVjYEdvhV6vzheyi9hv/zvFav+/BbrcDUUgSxrna5BBvLIucf2UFhLxto?=
 =?us-ascii?Q?78itAgpnvkBlXOFrDbZJHnvjVt8J93ibTw70QKKwOJVIUUTJIxtnfQhT4i21?=
 =?us-ascii?Q?NO8WJMWKmSUFPTz5X2qTOnLNEiwIJz7V7EJVRajJK/03uuLedCX8Vs/5SfZQ?=
 =?us-ascii?Q?KtjxU/EELYrKPvhlWKS8w6rR1pA9faWu5z2FXxgsM5Qh3egwf2eMIcl+aWSW?=
 =?us-ascii?Q?xsh68oufLvmOtznJVqCQuYrHVcSkFI7OsMhHKE67ZSMnO2IKc69DNJJmIzEy?=
 =?us-ascii?Q?zLVAhAt4nre3lgXLdS9QIn9wp240Alu/xCP8/DQB8o5bbubxHF+hZ+qYU/cD?=
 =?us-ascii?Q?tqN3M7xS4XA0f3Ql7TPPC9lRq7Pn2c8qXVpD57oqmkKT8c/tCBPx11O8Qlyg?=
 =?us-ascii?Q?UAc+sdxyto+4iCu8ylMPYjENDaQaSO5w6ERqJdqCyG0BqVl3U76ViY6azclD?=
 =?us-ascii?Q?utg3HdJpeYAYxng1AAwsmptakkKBa4Clt3kZa/zpjeYRMNszCfWNjE66vtW8?=
 =?us-ascii?Q?m/uKqy4TPXmAEw9wIRaJsytoGP/3jGcTiUQSGmCkoIJrOHxF/t3qO0X3K3fW?=
 =?us-ascii?Q?nIVA8Sr9Fxqnm3zH82UlYkFSTzJt9nVrwWwVKvAqnLSCtfOxakEqIz9Ws+d8?=
 =?us-ascii?Q?s/5EGYVTOcTEqzv6VJWYp4202BmQckdw8LU2e00pLDjRiFIoaXqQ+iWTYJlX?=
 =?us-ascii?Q?f+JfV5PT10csCcE4/VWewedd/V6Tj2ffba4IuUQxKp92EuwL8bO83Zf13I0p?=
 =?us-ascii?Q?QeMVI4EoJ7M38CZlBkRCiAvgA9X50sP0dQj7Uj0vJxXQEPzOKGmqVnH3MeHR?=
 =?us-ascii?Q?Fd1tbGaDKgs0aqzldbT0ld5lLJP80zOeass/WSn70bpVEv3RvQNsUBMML1Tu?=
 =?us-ascii?Q?q5NF0dl0KDUFd84kZ/BQUVmJVx/M0kBNY17hu8w5c7QKDAy8lra0MvYVSHoH?=
 =?us-ascii?Q?3l//pOJZuJK4DSHRwKGT2JB2g+GMqzvLjt+JI578GJfdHZWjD4D0smd+QUdd?=
 =?us-ascii?Q?6jtW6bgA9kr15T55T20fg8Jcj0//ML4OTsVe3Sp7PDlsv9P/AHbFJTgmg8cd?=
 =?us-ascii?Q?dXIjda7MGBQQynVTT1G/l9LsSN/DB1Ic3j/szSnO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e6981f-d030-4998-1ca5-08db5ceaf15c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 06:40:34.4267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3qjmGr4VmcAl7lEuPVZySxZyU/qa7UYGe+P/GHNIkNozc308Cv2+2mXUrtaualhz/D1C0vP+Uw+69rGlx5R8UCXxZOa0RrO4pXbX7Y3fFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4] drm/xe/pm: Disable PM on unbounded pcie
 parent bridge
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: Wednesday, May 24, 2023 6:31 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>;
> Nilawar, Badal <badal.nilawar@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>
> Subject: Re: [PATCH v4] drm/xe/pm: Disable PM on unbounded pcie parent
> bridge
>=20
> On Wed, May 24, 2023 at 02:36:53PM +0530, Anshuman Gupta wrote:
> > Intel Discrete GFX cards gfx may have multiple PCIe endpoints, they
> > connects to root port via pcie upstream switch port(USP) and virtual
> > pcie switch port(VSP), sometimes VSP pcie devices doesn't bind to
> > pcieport driver. Without pcieport driver, pcie PM comes without any
> > warranty and with unbounded VSP gfx card won't transition to low power
> > pcie Device and Link states therefore assert drm_warn on unbounded VSP
> > and disable xe driver PM support.
> >
> > v2:
> > - Disable Xe PCI PM support. [Rodrigo]
> > v3:
> > - Changed subject and Rebase.
> > v4:
> > -
> %s/xe_pci_unbounded_bridge_disable_pm/xe_assert_on_unbounded_bri
> dge.
> >   [Rodrigo]
> > - Use device_set_pm_not_required() instead of dev_pm_ops NULL
> assignment.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> (we should probably do something very similar on i915 for dg2/dg1 no?!)
Thanks for review, sure I will float a similar patch for i915 as well.
Thanks,
Anshuman Gupta.
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c |  1 +
> >  drivers/gpu/drm/xe/xe_pm.c  | 14 ++++++++++++++
> > drivers/gpu/drm/xe/xe_pm.h  |  1 +
> >  3 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 2d0d50dcd396..45bd23b879b9 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -636,6 +636,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const
> struct pci_device_id *ent)
> >  	if (IS_ERR(xe))
> >  		return PTR_ERR(xe);
> >
> > +	xe_pm_assert_unbounded_bridge(xe);
> >  	subplatform_desc =3D find_subplatform(xe, desc);
> >
> >  	err =3D xe_info_init(xe, desc, subplatform_desc); diff --git
> > a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
> > b7b57f10ba25..c7901f379aee 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -225,3 +225,17 @@ int xe_pm_runtime_get_if_active(struct
> xe_device *xe)
> >  	WARN_ON(pm_runtime_suspended(xe->drm.dev));
> >  	return pm_runtime_get_if_active(xe->drm.dev, true);  }
> > +
> > +void xe_pm_assert_unbounded_bridge(struct xe_device *xe) {
> > +	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> > +	struct pci_dev *bridge =3D pci_upstream_bridge(pdev);
> > +
> > +	if (!bridge)
> > +		return;
> > +
> > +	if (!bridge->driver) {
> > +		drm_warn(&xe->drm, "unbounded parent pci bridge, device
> won't support any PM support.\n");
> > +		device_set_pm_not_required(&pdev->dev);
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index 6a885585f653..8418ee6faac5 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -21,5 +21,6 @@ int xe_pm_runtime_get(struct xe_device *xe);  int
> > xe_pm_runtime_put(struct xe_device *xe);  bool
> > xe_pm_runtime_resume_if_suspended(struct xe_device *xe);  int
> > xe_pm_runtime_get_if_active(struct xe_device *xe);
> > +void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> >
> >  #endif
> > --
> > 2.38.0
> >
