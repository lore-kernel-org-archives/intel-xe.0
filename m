Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76782C77B6F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 16:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5038110E105;
	Tue, 11 Apr 2023 16:23:25 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998F810E105
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681230204; x=1712766204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DL4btsggJFVUyCKFaUdxhT4y0RqtqfO48v+dfTaUTPo=;
 b=BqIWc1h9FHgutY8TtuhLdyyjiiYrBXMGjIyiy/F/jfQvcEg05/0OHftD
 av7Af10gzsxurGG2h7murcKFyqmWpZG1oK0s20r956nQ4Ic5FFZdH3KU3
 4s9Mh5c7HWUEULeLcSL5oH9c2E5K9cddLJQmcE/zkVkYfF+QLUmC8RzIq
 M+9ghD6UQoA15i5PlyBSit14dE3jhWWf0Z54dsnFpv6amm9MHxeYRSNk3
 VNBjdoTCNp4mJRo/M2/MdEOzmMIrlMU0FVncXCGlkPzp0HNjtzDYT/nHx
 BbDoFpi/qe0eNeAURu0sqbK4KjH8uNZiasdtM8scedSzatkuIIeIotvh9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327769140"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="327769140"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 09:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="721246169"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="721246169"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 11 Apr 2023 09:23:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 09:23:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 09:23:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 09:23:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqaDP+bNYWCsZxgIXg9Yx846bUniEhg7Rtl/yvmC0lvpETNspniNkfasX6pmFsxzOn0sORVA35S14DahEBkLbTYBSTMoBifhEgjOto6gN4rUylKxstTPJDwkeSiBxXeJ1g6reL3/KCvTh4wDMH8kfdQ0UZuXKmQF0FhPnFGpRyHAodeMrOY7t2gkNi1YTEuDPFHDxmX1z+2ahcIxSPgaabTc7eIRsk7ps5K0x4I9XCT6kC3NCWT4NkSSTiT923G9uvd9tWWamupbFFGr+SH+wCT6+ZbznVu6jmyglKD8lXEi1J0phJWMXLxypZXfB1vlBhVWidFValatXvtT2ANaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxQq6Y7R91bk99xcnOm27q8RDHhbeBXeg/oHcSVWNDk=;
 b=T3tpNDyOrqrb4jJKLc5hzekhruDfQlCnIri9IQY2gPHqPeydWY5bsLd/JaYBnoGUwnVsdJv/uF5R3rnMh7Dccdy+ETM6mHEovcvmvcGYr9EWb7zl3S5Pu4QHHtbYbiRXDfC17MWtHD7RIqj1hMEIQk9ENPUVA665ctSm8MZFTLc6qIwCTEyRot0cVhCdMWEYMuizHY9PZyNcgN4TgWreg7D2uJ7sZOkTD/vTugiOc4RiK5TOtEk9hbiSje0vknjZtN52ObRmUJoui6VGkBVzGcfaFAtaEGmcaWVB7jr3qjzQvYaceltphlgITARwfEZwDcO6/Yxmj6lPB8iBVXMtjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2SPRMB0011.namprd11.prod.outlook.com (2603:10b6:a03:4f2::15)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 16:23:03 +0000
Received: from SJ2SPRMB0011.namprd11.prod.outlook.com
 ([fe80::3d20:2a50:2d79:574c]) by SJ2SPRMB0011.namprd11.prod.outlook.com
 ([fe80::3d20:2a50:2d79:574c%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 16:23:03 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
Thread-Index: AQHZa9b631j58/XoZkKNWuSaEhtm9q8k31AAgAACKQCAAWjqQA==
Date: Tue, 11 Apr 2023 16:23:02 +0000
Message-ID: <SJ2SPRMB0011023861F6CB95DBF1A334F89A9@SJ2SPRMB0011.namprd11.prod.outlook.com>
References: <20230410180504.2706189-1-anusha.srivatsa@intel.com>
 <20230410183726.r7hsj55yuqaouuyq@ldmartin-desk2.lan>
 <20230410184510.GV4085390@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230410184510.GV4085390@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2SPRMB0011:EE_|DS0PR11MB8020:EE_
x-ms-office365-filtering-correlation-id: dd705d1e-4258-48a0-eea9-08db3aa90626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BGXKjdxEjnwIyWF+2LhbEhHptx+pPaufUUGKia876pqmitVdhgc/OE4Y2NaktfLNf74kzew2pIBNyFYic9TvVfFJP4AB6viXBxM76O2mtZ8g5Mz6RSVVIE2m62JCQ/toTcK6WA0IAVjLG2V0kXRijOYoZc0WisilRM6F2nYvgjt+kLJlOdE4S33/yy+HPJVlmMIQY+oZtk1xzW+SdjfLXuvs2XEBglB+eX9BaGfnnnTjZXQcBvDHqwmh5V+82mew7xr0a238mA6mzGZfJN3c+kMDZm2Y0zz4TYrD0ETfwYYKBbBwu9r0lNWnJbWBPY1fLml8pvAY+kv3DTd57JSK7pSUqNI8aBigSGCXKS99johQYM0WfEeDMCpZtRuDnV2uulqGZuVwOq0/WzhjLolixcBwtix10djD8a/3N7p0wCaVaTp+cb+rdeG2esFJvmXMfVBRTRQ7MAI+JM03Ulm58mHdforUP4WxGslKLBD0W/cHVG26KrUiwYT1WXSCEO2d1jSGGrjAgJHLtsU/SujdZqAk/MB3vWRPPOfMZ5K/KM8JfabZEbEO/1DIU+YGFuWizL3lPuvG024LwVfqoVn3ZeLErFs00jmL9bKhEj4WhutIU6leUhrBqj5WvSZRLP4G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2SPRMB0011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(71200400001)(478600001)(7696005)(83380400001)(55016003)(86362001)(33656002)(82960400001)(122000001)(38070700005)(38100700002)(2906002)(9686003)(53546011)(110136005)(26005)(316002)(6636002)(6506007)(186003)(66476007)(64756008)(8676002)(66556008)(52536014)(8936002)(41300700001)(4326008)(5660300002)(66446008)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zattm4Qw8vN7MgZxH1ieMgLECFJv3T7XSfMF251AAoXfj6Zvs2dTufvfiF+V?=
 =?us-ascii?Q?N6t3e3zQsqggwi7tlGJF8NA/npxCoRKYostbHI8YTyA8prTbGEy5rUFYVUSK?=
 =?us-ascii?Q?oLb0A+nks7u7gIfxGWWdr7FkVul95JEOfjTeeWEuQVXPl7tqxmxCUKbR6x/M?=
 =?us-ascii?Q?DGAVYAM3hnuUwWbiUjWHBbZj+h5l0BMburjVPvOmhfhLjfr1qLAnSMjssLkF?=
 =?us-ascii?Q?Jqc2QDeN2XbtxjnrclFzeXSLq9x6mhJNuWlzyXN2+4LQacVCCyqR/dGFxG/I?=
 =?us-ascii?Q?N8athcIDCvYNUH1j68l+on0808oPAywQtUAYWIQMuJAcniRPYzSE9bUp6rU3?=
 =?us-ascii?Q?Po9k6Y/dFYnDwZBJwj0OS68x4vG+EQerCywsQM8AKZu8STGCR4SMHoeKAQ+H?=
 =?us-ascii?Q?NliNzQ69hhetixIqUqa0hkT4TLhStk/r+j59uth/AKnWopjJe+gd7VFitZ/N?=
 =?us-ascii?Q?W0hQ2zPvwdC3O/ht8r6yFSs/3Uzc1W58nE1KYcsnY26lzVov17pEVSYroDD2?=
 =?us-ascii?Q?FaPtyvvZ671i28fOZ6CSG5P6WQCAeg0pTM0tO+yP+jTozgL19jYkb4D5/LB3?=
 =?us-ascii?Q?mXYMIIeWbbEVJHxc9MQi4NsdnMZMLQsF8PgnyO5tzC91nINnB8NmVy1mJE5f?=
 =?us-ascii?Q?6NniDjH/pjP77ACob7mCIpMNjLq0nzlu0cNQaamzy3+Xfw5UKZwcVAdYz0c7?=
 =?us-ascii?Q?CEm/AULsCyjdMMOJ5Rsi7krmmSNjxRQJcOhSEAn84TP/a8zB7leFUymVvWqJ?=
 =?us-ascii?Q?f0IQ5bHeSiJJTa3zruQiRLUCZQKZxwhe25ioYxdDAyWgCxfNtXNmcHyhlYHD?=
 =?us-ascii?Q?3lk3eGV1+L7WlqsgbGvkfPdlYUFN+UfYwLFslPCJvDrD+oVl6l5ueBNvEnQo?=
 =?us-ascii?Q?mE2+dqMUiCyO9Q6a2DLCpWmGsJaVUzEBGP8R8NbN9RbEX2MBSzk24tIkI7AK?=
 =?us-ascii?Q?FPWs4C/rs/41pe6IhgpMGUhRsD/VfYCauM48zTN1/2ONAmXiC2L5aQnrvCUC?=
 =?us-ascii?Q?muXdWPzi7HjtxdxZzunqiSk7i7fZRchpbzlAMvSW+lwPltocwmhXjINH6Ajo?=
 =?us-ascii?Q?RFKVTROE2NLGyokjSZ6QZFpB2pe+2IGa8GnYonWjWMl48Nts3H5pOhBOD7Sz?=
 =?us-ascii?Q?shY4MK/ha+UiCRkMApaQ/ZisB8cQ7g+ObRkXgXieUEcGBPkAdEDBjxCnB9ce?=
 =?us-ascii?Q?lpKE8YmGBM67HIDd4ZK4jC+PJdRIi+ERdi5vCATjtShT+i/bOABRhu8HcHK+?=
 =?us-ascii?Q?FI4HTVADPMEVpWNyPhnzFlL1RVE00LkEIICxa9rD5daZ+wLRus9aV7EtxFEs?=
 =?us-ascii?Q?cSfeVIXdz5ZirlGNkapIk+Ek16cmuLj9GxAoiIkLuS97JultJT95yX5YWoOO?=
 =?us-ascii?Q?fPWjuUssh8TjxF4B3LxoYvtGiEltD0Z1oxZBr0tW6+8w8MyqbOryVdwe9JcP?=
 =?us-ascii?Q?8aoH4F+MVb9kNfg4ejqFzVrVzplIzsHHteKjg5X7kxU+Ig2N3sMi9GDMwAo2?=
 =?us-ascii?Q?i9Z3JPr690j/ji5yIbq/rFGJcsVB0yEZto+WGUhfFk4b03xQ6269S5u5fsbS?=
 =?us-ascii?Q?lyvxbAoMGOQrysjZqdYwBq87DmuZWaXCEY7io+++JucQuyVQ7ktTHFBf3xwg?=
 =?us-ascii?Q?FQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2SPRMB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd705d1e-4258-48a0-eea9-08db3aa90626
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 16:23:02.9793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uMDEiMbZf7aIO+1SposRC7p5m2a/WZlQoxYKBOP6LJiQHtOm9LfOxYuLQEiUIal1fRIbwqJmmRV40u825XCNCCJ/MSq37vSTcOdH2bvOsak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Monday, April 10, 2023 11:45 AM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>
> Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
>=20
> On Mon, Apr 10, 2023 at 11:37:26AM -0700, Lucas De Marchi wrote:
> > On Mon, Apr 10, 2023 at 11:05:04AM -0700, Anusha Srivatsa wrote:
> > > Add missing device info for Rocketlake.
> > >
> > > v2: Also add abox_mask to the device info(lucas)
> > > v3: rebase
> > >
> > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
> > > ---
> > > drivers/gpu/drm/xe/xe_display.c | 11 +++++++++++
> > > drivers/gpu/drm/xe/xe_pci.c     |  8 ++++++++
> > > 2 files changed, 19 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_display.c
> > > b/drivers/gpu/drm/xe/xe_display.c index 5fab5b9fbde0..44697c0f7fb5
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_display.c
> > > +++ b/drivers/gpu/drm/xe/xe_display.c
> > > @@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *xe)
> > > 	case XE_DG1:
> > > 		xe->info.display =3D (struct xe_device_display_info) {
> GEN12_DISPLAY };
> > > 		break;
> > > +	case XE_ROCKETLAKE:
> > > +		xe->info.display =3D (struct xe_device_display_info) {
> > > +			GEN12_DISPLAY,
> > > +			.abox_mask =3D BIT(0),
> > > +			.has_hti =3D 1,
> > > +			.has_psr_hw_tracking =3D 0,
> > > +			.cpu_transcoder_mask =3D
> > > +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> > > +				BIT(TRANSCODER_C),
> > > +		};
> > > +		break;
> > > 	case XE_ALDERLAKE_S:
> > > 		xe->info.display =3D (struct xe_device_display_info) {
> > > 			GEN12_DISPLAY,
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > b/drivers/gpu/drm/xe/xe_pci.c index b92d8b5a391e..a81427019d02
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -179,6 +179,13 @@ static const struct xe_device_desc tgl_desc =3D =
{
> > > 	.require_force_probe =3D true,
> > > };
> > >
> > > +static const struct xe_device_desc rkl_desc =3D {
> > > +	.graphics =3D &graphics_xelp,
> > > +	.media =3D &media_xem,
> >
> > now it will have VCS2 as a possible engine. Not sure if the fusing
> > will handle this correctly or if we should create a different
> > xe_media_desc for rkl.  Matt?
>=20
> We should double check to be sure, but in theory the fuse readout should =
handle
> this properly.

Hmm went ahead with the assumption that the fusing will handle the engines =
properly. I will add a check in read_media_fuses()

Thanks,
Anusha=20
>=20
> Matt
>=20
> >
> > Lucas De Marchi
> >
> > > +	PLATFORM(XE_ROCKETLAKE),
> > > +	.require_force_probe =3D true,
> > > +};
> > > +
> > > static const struct xe_device_desc adl_s_desc =3D {
> > > 	.graphics =3D &graphics_xelp,
> > > 	.media =3D &media_xem,
> > > @@ -301,6 +308,7 @@ static struct gmdid_map media_ip_map[] =3D {  */
> > > static const struct pci_device_id pciidlist[] =3D {
> > > 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> > > +	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
> > > 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> > > 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> > > 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> > > --
> > > 2.25.1
> > >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
