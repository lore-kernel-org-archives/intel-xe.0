Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6969CCE79AC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 09:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B2B10E473;
	Wed, 20 Sep 2023 09:28:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C0610E473
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695202092; x=1726738092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bq3c8+WAqG6/EDLrSZhuYVZ4A7ISnWlTY5b3uVaAAaY=;
 b=XKFW8djcMO3W13AMl/g86dYIn22gZqSH5k+8DHLCZqV+Qc/CjBxjXRGr
 Eoax4i3o/4Jc3Kl8uQ4HMQpUjsy1r9ZvgB7vbNki5eFkZTf2mtMaaj43u
 szW8D8TY991iS60NVvj4vl+irljiOY/Bm+yOieCwXYOFU9ijPg516DJ4x
 SP2XBDgSfCCP+FLGjoJg5QgA+b0ttLOxFRE/PVvHxzRvIgoX0ZKj0QCPR
 G/LuRb0Fj/9ix/vLJinYcpEvASkNcvmZJ6lYu9IFDBWUGSFdOVhvUPrWw
 UI6hCRmK0na6ZKw3m+bdenW4iFJAsg0Z1UGUu1hpiO1nkIUPyLQEK/NSs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="384018055"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="384018055"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077362791"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="1077362791"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 02:27:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 02:27:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 02:27:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 02:27:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 02:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkGWBilRe0q/MqbYYmsO3KQoOWMbHj/aN3T6P2erTasGfUEPKdCcic0xawLVXwkSuGQiTSon8WHalur87a/Dc+6U6frL9DwQKtNCpAi0lTJiGSHG/kfz39t1EPRt6twhPUfF6Ss81BMH8DVNVoa2R0y/AIjPKk20eJMu9U/NG68AY+4vv++fTAY72zHQI0R7RE2aoNEx6wbictSHUwsAV7UznnvhofzduxWh16etJBZXf/8XC8xXoXboNAYWH6onBkxISgGTFKg3A/9zKtwyOZZeFFv72c35uromQGikCh99WC53PLCF2dkBQpVWidy4+SpIwbYCgNhmluNd41bDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqH3shk0jCZCqdKewD158iwVkyj5i2CGwH65pIJMB3U=;
 b=cZiHmNEp3FL3aH4VWUumVPbaC4UV0aDE88KOp+fiEAC3EkJIWMS+HUne3VFcrqp1mOrSxElUpGQ4G9QwNyy3ReQclK6GKxe0SSKDJWe9xWfqzXaLYfuE7/CtFNxfsTzY4jWy8HhFXLxSBzqt4jTxoPvJhT03w8LF95hzIj8RrIKkkziu/F/LztUdXPRffF+D52hQPo1y17qw7dUD3geXicCQ4sCOw76ao3fIuLwBTe9gkzZ0/CgLBEAaoRu53XgSCCXgvb4xMZBtgyMaU58mk4wAU/GT99S/cCBCPFXf40eIU2v0jHf7bkmynIOXZXB6ccl/ISNGItqelJXvwJbkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SN7PR11MB7974.namprd11.prod.outlook.com (2603:10b6:806:2e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 09:27:51 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::42bc:8d57:e26f:ecd4%3]) with mapi id 15.20.6813.017; Wed, 20 Sep 2023
 09:27:50 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/3] drm/i915/display: Add a wrapper function for vga
 decode setup
Thread-Index: AQHZ6lXdE3pXiUZGhECQ/xLo9zYC+bAh8rqAgAGB30A=
Date: Wed, 20 Sep 2023 09:27:50 +0000
Message-ID: <DM4PR11MB6360319C6B46C839DE39F0FAF4F9A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230918173711.625930-1-uma.shankar@intel.com>
 <20230918173711.625930-2-uma.shankar@intel.com> <87jzsmtq68.fsf@intel.com>
In-Reply-To: <87jzsmtq68.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SN7PR11MB7974:EE_
x-ms-office365-filtering-correlation-id: ee060d68-578c-4b6d-d1a2-08dbb9bbdbf9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yJS2bs/nJAzJ1dKCOfED2vNjqiU9mjIQaVsAx/2KLJZtb79Y5eb2QGBjleDHXrcFP+4QXbcu4HWPlKL+3OR2lvE+CyXq0zcoW8KcVG8gaoLavkU2VhZxVbtwnW2xLSxeqB7yeH/8YIdIEVOQjVdyHrNb17HU9Vum0fBWVugYSk9P4HSQ2bSL8fJtBhXdioHs7QS5xYNqqZo1KGqaVRyppp/fBlViMKZyHfEVgLJwEd8i/LdgnLxm6sPoh1vLz2XQGsCOAN+VOFE0yh3pr23p2QhsTy9p4UjKoSQdZNQJxJ353xgzageiuQ40oiiHyRNHwH0BgsX2dqfqdEmujADCCmd1RjjGHNlxcAv5iosyrVSlLnu8oUqCBM2/t1WOS+0U/taIkoOpPsQEuunrVLmqWTcSClkDllP1BIZVY/+lbEdhWRCpl4LYV5C6EqatjB0IcpB17f6Aygv6hiGCRmyiZv4Fot0+zuEVsbWOELxdnmeBpfdAKp2fFmdzMGGtDouHnn9x7sJZQSOc1nIegUBy+TeduASM49+EWNCYqlICbLN9zgaDDtAdOjzEWpFv8C+fNysb2Dnn6fTue+3Yzsx41UePfDNYrpZeewUgKRxg4wGsw8m1WwaduqC08CJENevL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(186009)(1800799009)(451199024)(9686003)(53546011)(71200400001)(7696005)(6506007)(122000001)(86362001)(82960400001)(38100700002)(33656002)(38070700005)(26005)(107886003)(2906002)(55016003)(478600001)(83380400001)(52536014)(5660300002)(8676002)(4326008)(8936002)(316002)(66446008)(64756008)(76116006)(66946007)(66556008)(66476007)(110136005)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YRrNcC/Dp5K3UnKkTozBaArJShuMZL6a4b8rqfCOdauH0pdyOoTnbFU+DDMT?=
 =?us-ascii?Q?izUqBVFdW1NcGdMH/bN/j8HkdaY+5K88qWzN7suEarSDZnP6A8zD6bvASVTo?=
 =?us-ascii?Q?A/E/Sjo7GSmD6kIfnO5NIbiuak+mXwaLdOgztzbC0fOAHKgL8p1/lPTdLqud?=
 =?us-ascii?Q?WHeniMh5LOaGPw5JMqLtM8dxLecQbtlmgefXwOGllzf8158/eYXwpSpt+UlA?=
 =?us-ascii?Q?heWDxHEr0pBAi6RnpzyPBbECR6T7peqN3IW0BwFN3ZC+B1KsRHN47ZE0JLXn?=
 =?us-ascii?Q?gFhDeJo7Oi6iAIuo+ITQb5/sEqjFQk6xLVYVaby6zG4nwn7FcCr7nvUeIi9T?=
 =?us-ascii?Q?fYFQ8ydh8WDz4KW06sFyOLKpE3T21Lf2aQ2xjibrbEE3YLnIFI3n3Jb6W6NF?=
 =?us-ascii?Q?YrUDNkwPfFWmcw9hB1qp4RcKcUoXMDA+SlzEJb6zl91Ip/88lgn2njbQRLus?=
 =?us-ascii?Q?9WzZxCQy1rC3l8Ui8ZgV1KZJwBPbHBnUUp+IBtHvtbTYP0H6mQOtfvLvXp7+?=
 =?us-ascii?Q?f7/FCqijOyk71yAz2PxaUDSI6NNddKDOkAb/ghGL5QJOQYA3V3kTBMyiCf3w?=
 =?us-ascii?Q?qc8SW+8P/qLY0ZyEYfGxmobitdVRIymQQjtCek4cGaqJBcIpA1m9+qP2ehru?=
 =?us-ascii?Q?A1Iyncfbm69rXzD0/TVVBsK8/tSXvLB2XKKL8ItHlnbAhh+xOJykrw6bAAcu?=
 =?us-ascii?Q?N0OFExdpWXosSY/CzBu0941V5x79ZzUdx82cdel1xmTTwl1ErT6w+aaMywoM?=
 =?us-ascii?Q?GAzN+ZxVSBAQ17AdpVSbKapilnjoTkh7Mc0OcxWso+76LE5kMZx9giYf66sR?=
 =?us-ascii?Q?LdP4kBnlWhAu4PV4OhnNHuvf5qsXeEnpKHB8qWoF1rCdS1WG/yPHw9FUjzbx?=
 =?us-ascii?Q?mMUMAjedX7EHiDESzKXNu6GXuwew+PvJVKL0Dj0jf9Jkt0kua2K+mf/gnvAL?=
 =?us-ascii?Q?KXFTlexGaSTUgYY2/eyzzLVyuLa823JbogbZepdx8sqvFLOA9IPymtoSEAZw?=
 =?us-ascii?Q?H3+e9cMnSDaioQZRctZcNlDKVA52JJCpzIVO6OTtbTDEBZz5vqvTTErSbDpH?=
 =?us-ascii?Q?3uj5VVz+gd1HNTuBdWzvIKppU/WEfDsgp9Hn1qg/0jRM0Ullxg21nnJ6mldp?=
 =?us-ascii?Q?UtAN39uFFMb//Z2NWOImVmNXOfkCoyXLLhn3wUimXwZG/6xsFq/ZAfxPuVo+?=
 =?us-ascii?Q?IlcENIZwLfv87nVF1QZ87HvRG/OoFNHXs7FeI15NY9RUUP7OQvbmDTwMwo/+?=
 =?us-ascii?Q?h4/pZxT+EZP28/FWfZG4ZKb+OdzeCF6oCaTevTzvHgWEORz3wU9rkWo2Sfmt?=
 =?us-ascii?Q?0awrqZm45xNlBGegNkNuCcWmet2PabvB+Asfw3/wNLR3QH/mTicGdaT5flPb?=
 =?us-ascii?Q?w7OjhTJUq39Le3YnIf9mg0bs44RkRTMA6dkEfHo2lEPfL5P1gV4UOoRsFXUc?=
 =?us-ascii?Q?pixszpmpeFbIs/CcjG7ZuGU6A+E9tTkDskYE1gf69rtOoUeqiN1Nw2pIATOl?=
 =?us-ascii?Q?gR13xN1YEmDHX+smU55RK2L4Of+pDO9Z3Tvc3M9NRF0uHf6WgiR0S+h0/QqC?=
 =?us-ascii?Q?imtwsUspUPgHiO9Tfxo/2zQnsEMRzFW0h4cFV/m7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee060d68-578c-4b6d-d1a2-08dbb9bbdbf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 09:27:50.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xS62COtTlxEin8Ok/QdKk/zOMF6iv2G98GAd7fHOKJp4EU0UCcoWFSUSi0Ta4Y1GOMculGxSRGQXtLF8YOyPPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7974
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/i915/display: Add a wrapper function
 for vga decode setup
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



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Tuesday, September 19, 2023 3:56 PM
> To: Shankar, Uma <uma.shankar@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Shankar, Um=
a
> <uma.shankar@intel.com>
> Subject: Re: [PATCH 1/3] drm/i915/display: Add a wrapper function for vga
> decode setup
>=20
> On Mon, 18 Sep 2023, Uma Shankar <uma.shankar@intel.com> wrote:
> > Some of the VGA functionality is not needed by the proposed Intel Xe
> > driver. Adding a wrapper function for VGA decode setup.
>=20
> If you want to do this, it should be sent to intel-gfx and i915 first, th=
en backported
> to drm-xe-next.

Sure Jani, will do the same.

Regards,
Uma Shankar

> BR,
> Jani.
>=20
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/soc/intel_gmch.c | 14 ++++++++++++++
> > drivers/gpu/drm/i915/soc/intel_gmch.h |  1 +
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c
> > b/drivers/gpu/drm/i915/soc/intel_gmch.c
> > index 49c7fb16e934..818f0b7f62a2 100644
> > --- a/drivers/gpu/drm/i915/soc/intel_gmch.c
> > +++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
> > @@ -12,6 +12,7 @@
> >  #include "i915_drv.h"
> >  #include "intel_gmch.h"
> >  #include "intel_pci_config.h"
> > +#include <linux/vgaarb.h>
> >
> >  static void intel_gmch_bridge_release(struct drm_device *dev, void
> > *bridge)  { @@ -167,3 +168,16 @@ int intel_gmch_vga_set_state(struct
> > drm_i915_private *i915, bool enable_decode)
> >
> >  	return 0;
> >  }
> > +
> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
> > +enable_decode) {
> > +	struct drm_i915_private *i915 =3D pdev_to_i915(pdev);
> > +
> > +	intel_gmch_vga_set_state(i915, enable_decode);
> > +
> > +	if (enable_decode)
> > +		return VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
> > +		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
> > +	else
> > +		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM; }
> > diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.h
> > b/drivers/gpu/drm/i915/soc/intel_gmch.h
> > index d0133eedc720..88db1653ffc9 100644
> > --- a/drivers/gpu/drm/i915/soc/intel_gmch.h
> > +++ b/drivers/gpu/drm/i915/soc/intel_gmch.h
> > @@ -14,5 +14,6 @@ int intel_gmch_bridge_setup(struct drm_i915_private
> > *i915);  void intel_gmch_bar_setup(struct drm_i915_private *i915);
> > void intel_gmch_bar_teardown(struct drm_i915_private *i915);  int
> > intel_gmch_vga_set_state(struct drm_i915_private *i915, bool
> > enable_decode);
> > +unsigned int intel_gmch_vga_set_decode(struct pci_dev *pdev, bool
> > +enable_decode);
> >
> >  #endif /* __INTEL_GMCH_H__ */
>=20
> --
> Jani Nikula, Intel
