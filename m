Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F33CC41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 03:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884C110E00A;
	Fri, 22 Dec 2023 03:54:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63FE10E00A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 03:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703217285; x=1734753285;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ORhjAsdGZZY40Ec4CAwu/LnntCwvdqBPJeBzAqVXrUc=;
 b=PdxO4GaqJ7GKqxHWl0CwIvNTpp5jiVxNuv/rJKaRot0r158OgnOZ3dG6
 kxoV7RWwR4CHe9cT3ykPIWjHUQasIByta4uDaW6tLMwHc2HjoPbwB0jvo
 iduTO6UtJo2RUeYtSaKiQImduuDPHw9hCarV96uBBzDilcJ7IfyHDQ294
 zTKoIk76buk9GoslbTqEQMp4Tsg0gQYHOfYwBdx6gl7bYeKgZQ/43l4NL
 trNFOw+FJ8NINGbx43t2GMV9PAv/FSKexm8o/1d/XIrDMi2FzaipKPnpe
 OsRP7PxvDKZCXDxYLMSY5EvERMUwPtbOGo9mkQl9d8ehoHyIbrLoJOYo2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2909140"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2909140"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 19:54:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="842830327"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="842830327"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 19:54:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 19:54:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 19:54:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 19:54:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQ8Fhpc1QxIHBhOL7JZhpNVrPg5ZidRf6E0OGXNT9nO0GSrDsinZjAdoa4lPzDY2SmsTqY75dlJ6Qx5OLs/Bn0qVx10XtnsFhVXKzvyAEYH8ExND15nrc5GyoKBEzdSwed4gZEQ0/4yZlWYC4kvIQ1htNTpFDNyQakHo+JNTqtBAhAMNKE5pNryaUkkTuFZyCpiWqXl6BE8lr15Ttxc88v61prtZCiR4X6qG7gDj9ViY47gd74KiZtDrLJdC5obBZb8xHz4omstvBM2qB70h+R8oq/+tHOMUiNcgdDRjOTyMeBUTym3XeqeA+TTID+pxFBjt1zhCP94n7DiYVe1UBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsKfDHqQIaZmVHfL2o5fz6d7QvHxklRXLHABrj8bNhE=;
 b=av5AGX63G68ZpgG1Mv1i3yc5d6IO4MtWik5rhDiMWymAPnQYpp9E/uIuM9A4CCB9d/sYgOnlOaG5NG+oWFPM6JUCET5FPxsrO/98aREgwHMQkOTlajcGqfPYVhmydDcWG59ma3MkmOsa6QXUhnx+fH6Vg95i1YBju78+X+ZyNInZy0reJeYA51ns069uZvh7YOGogmc3YhAi66nHitVdJUcq7/lKUqo5cr09B0WpKYmAexYfgrjVYEjdXEH4zIIrTq9dy9eH1FMlIDezwm1iXBVnV+niHUB8jtjAtE9DhoZWdsMa2/mI+csKRcXnBchxQw+7PQfrzCUKjK28d1SO5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Fri, 22 Dec
 2023 03:54:39 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 03:54:39 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
Thread-Topic: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
Thread-Index: AQHaMmEdvc+gcMFRRkiW4YPcLby7OrCyRAKggAAIjQCAAmMcYA==
Date: Fri, 22 Dec 2023 03:54:39 +0000
Message-ID: <CY5PR11MB621181B9E996D771F64604269594A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211D392383C6898707C44D89596A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZYMHPHBxI10qqM5K@intel.com>
In-Reply-To: <ZYMHPHBxI10qqM5K@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MW4PR11MB6886:EE_
x-ms-office365-filtering-correlation-id: 467593cc-85e9-4c96-c871-08dc02a1b8a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kL/TfkUXAasfXUxZtAH6O1jcjYCl3dxWV0msz3PeCPMeQ7xma3ToI2SpaxDQGv1WztCRy+EgGVjlbq5lS2WchWMtSUQVuy0aPbTLEGiqIcfxQk7qlq+9yzXi7x6gFjaVsWA715SNyk3pKxNRsE2jznbgfou1UM1MiFaNeybnxyVNK8WqAyLR+g7yz23tw6zoFAshG89RYtZp0cqpo1jIiCJI/drEUuz4mbX6H8KFxP/AUCZnq36uflGoQQSZTPpwhqu9CdCk58PmN8N45//1JMiwUrRQ2CUelKgWeeY7LT+hMS5c1yUxlqq0SqBowOc2PrLYv6QlEWEH35hPpwtWkNhVAeImyXyVIxdBd5HVQUoNzsBrmXbX9v2CC45u/NSmsuXXixbjz7miAxemWvPgknDhwWa2y4PtA+Or2Kmyo/L7zNJpa7Ie/3TsffoRFCxk+BuwCfTDeaOg3Kedki6dXIetgLkoRB0jy1zkBdZXbkZ3kjCb7PTHSlarQsR0o/G7mVQHpPUqpbU1rQc7wv0e+QW/wYWAfEKTDNXT85H1y8Ic1M8yCblyIR0q0tYnBQgTcw6/942EyfPEIzLGMq+qNvj9/L/EbsFnRbUVVIWh5WOSCeEAnogcAYyaH48n6dQj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(4326008)(6862004)(8936002)(8676002)(52536014)(5660300002)(2906002)(478600001)(6506007)(7696005)(9686003)(53546011)(66946007)(76116006)(66556008)(54906003)(64756008)(66446008)(66476007)(6636002)(316002)(122000001)(41300700001)(38070700009)(83380400001)(38100700002)(82960400001)(26005)(71200400001)(55016003)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6XDLPTj+gaR3uRc2sTxg8ArehYa//o/T1TIMGlXhF0PfoDz11ESWNqeRbxhB?=
 =?us-ascii?Q?LqKbHEgYjz6zmKAkx5BBZS6RHIorUDd9PgDP7+vavVhMH6t03mdb9W7FAn3n?=
 =?us-ascii?Q?ZV+n06T3RRUd6JIdWwA49PX6wK6JbzJG+BCEBEnfZ8OYornBQXu5500dL8YD?=
 =?us-ascii?Q?Ui+Jpx5qBCaTNW95YZpj82aW7O7V6cpTWIpWD3ThnxVhsW0q3fkVa5Tnt+bV?=
 =?us-ascii?Q?Lu/hmwHn6heVSBHrSGtTyckoPsbuJ8puJAILwxq3hOZOAazi5/+sYxIcxuLP?=
 =?us-ascii?Q?bZ8+fLNnp+yYFkOK+iGd0kXRydi75VNdaQ8J98yXrDvJU9WhJw1YHvq3VI1o?=
 =?us-ascii?Q?tUFHKMpWtC8/SSTO7ot93EE8RhIDfe6nBppXC4FZzQ98gss504lmuBBquZT8?=
 =?us-ascii?Q?E7U4U0ROnzecQJdWcdGG7vBuHRob1vOQaG8dKCA30aRPj8vwmzGPgKAe/VJn?=
 =?us-ascii?Q?/9IdEqHBYrFyonipZukbRCk9QUWnIjaRz5zTvf8uaOee/s05wObYm33O5Qb9?=
 =?us-ascii?Q?bVUJDjfJ8SwJohdik93Z+lpC85ojs9k5EVgXfLyeBidIZutA5ep0ESuBDlIw?=
 =?us-ascii?Q?QecDUCkJ7uNWu8rsBr4k7kSd2c6nkMVS51delm/AhyO7m3hCPJjthJB0s0ef?=
 =?us-ascii?Q?obIc257OAxtHLIHBm6bOMNJZlRxJkmjWOaHX51NcY5/yooolk0ykQKYYz7Gq?=
 =?us-ascii?Q?h8T4uURSiD2nQuYR99V5fqwivYZumNV2FtroGBaghs8WRwoaJCY0Op6mL0hp?=
 =?us-ascii?Q?wmGBOUm30QR0iMCQ/RUdnAOr4+v3JzzFk6XYQQupMqap3C5alWu6oza43Jf4?=
 =?us-ascii?Q?MxrWUK0LXj/v75JL5V087kEOpeE1tS8QKr4fB4MH1XXn19N4NvREvyy4gGCo?=
 =?us-ascii?Q?6aCxn4Pu7gqt68QF5szHj6jPWUcnRa97Z1JUym/O92jMlZ5SHxPxXZowOX1a?=
 =?us-ascii?Q?z4JdfKa6YD2qh8jMak1OeNsFhsXwMuRDWGvOje8Y1OCKm3KZzsRxBiL4XEUc?=
 =?us-ascii?Q?AYgmZ3eke9RMOok8nS5WvfBKNZn8777bJxzSXvV+4yOlew3v5lu2PgYILncr?=
 =?us-ascii?Q?8EOdlSkQtPolWa3md/vmPcKa2LWbj5LtFPx7WCoMccM6WbK1dTI4oLCmWRgU?=
 =?us-ascii?Q?3DrbCC6hlxbVtFDXYltL5FLXkPSM7z3oLY8xqEvnCBMyymICsT0x1NQJ9NXZ?=
 =?us-ascii?Q?ORJisTDDO5z9NHCjrtQ5ugLnTEi5pso4rcisKNxaLsZQ2/U4yZ2xGLuz2g7e?=
 =?us-ascii?Q?t/hYq0KDOBx0wyk6nJ2lXDLOr/Wj7Q93gpcrKCiLcEiLWxcSAo8l1NADf6vs?=
 =?us-ascii?Q?SWwEddyon0o0QQ39E8FEE7YAncAK0bvdt3FobFP+xqJ0bHfxYJ4KRM/ihLQK?=
 =?us-ascii?Q?5wK99c+KvP+Sag7kuLeGm+9puDUdNleUl/M0odY1bu27L7sLgpxOBIOR4HwC?=
 =?us-ascii?Q?C5tW+/8gDnLqu6fCwY3OYKZ1wAQ1FFnWtprZjnarSBA35hVKVwBhGyOPMe3G?=
 =?us-ascii?Q?jMeodS/MFbCQavc7ZOLyvino694U+D0gRQX8tn1LupZ93c/tu19HkEAm6wFD?=
 =?us-ascii?Q?vCUr46Ki5pLYmYZtIlCNJCzoF9bKAqPIiauJRlUt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467593cc-85e9-4c96-c871-08dc02a1b8a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 03:54:39.0547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hi7LjGMy5EfYHLQVqU6GYfVNZFvPqlrJOPwqsWXuE6fYto1iSJ/nBCS5nZHEwb7PjgIRAmxjn7xUmjeFe3NZKfamuf+k/4XoOtFx5YAsCk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, December 20, 2023 8:55 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
>=20
> On Wed, Dec 20, 2023 at 09:56:22AM -0500, Gupta, Anshuman wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Sujaritha Sundaresan
> > > Sent: Tuesday, December 19, 2023 3:37 PM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi,
> > > Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
> > >
> > > Add vram frequency sysfs attributes under the below hierarchy;
> > >
> > > /device/tile#/memory/freq0
> > > 			|-rp0_freq
> > > 			|-rpn_freq
> > Hi Rodrigo rp0/rpn for hdm frequency seems confusing.
>=20
> oh! indeed!
> the 'R' makes no sense there beucase it has nothing to do with Render.
>=20
> > How about {max,min}_freq ?
>=20
> but I'm afraid min and max would be seen as configuration instead of the =
fixed
> fused 'Points'?!
>=20
> with this in mind, maybe simply p0_freq and pn_freq ? which aligns with t=
he
> pcode mailbox definitions below?
IMO let's not contaminate sys fs with pcode because it does not align with =
future platforms.
>=20
> However, on a second thought since we don't have min and max settings for
> this anyway, min and max aligns with everything else... we just make clea=
r in
> the doc that it is read/informational only.
Agree with above, make a clear explanation in doc that is not a configurati=
on.
Thanks,
Anshuman Gupta.=20
>=20
> > Thanks,
> > Anshuman Gupta.
> > >
> > > v2: Drop "vram" from attribute names (Rodrigo)
> > >
> > > v3: Add documentation for new sysfs (Riana)
> > >     Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
> > >
> > > v4: Create sysfs under tile#/freq0 after removal of
> > >     physical_memsize attrbute
> > >
> > > v5: Revert back to creating sysfs under tile#/memory/freq0
> > >     Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
> > >
> > > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
> > > drivers/gpu/drm/xe/xe_tile_sysfs.c | 86
> > > ++++++++++++++++++++++++++++++
> > >  2 files changed, 94 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > index 5935cfe30204..4076a4e9daf3 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > @@ -42,6 +42,14 @@
> > >  #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
> > > point format */
> > >  #define	    POWER_SETUP_I1_DATA_MASK
> > > 	REG_GENMASK(15, 0)
> > >
> > > +#define   PCODE_FREQUENCY_CONFIG		0x6e
> > > +/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> > > +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> > > +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> > > +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> > > +/* PCODE_FREQUENCY_CONFIG param2 */
> > > +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> > > +
> > >  struct pcode_err_decode {
> > >  	int errno;
> > >  	const char *str;
> > > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > index 0f8d3e7fce46..1d34912e6184 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > @@ -7,9 +7,21 @@
> > >  #include <linux/sysfs.h>
> > >  #include <drm/drm_managed.h>
> > >
> > > +#include "xe_gt_types.h"
> > > +#include "xe_pcode.h"
> > > +#include "xe_pcode_api.h"
> > >  #include "xe_tile.h"
> > >  #include "xe_tile_sysfs.h"
> > >
> > > +/**
> > > + * DOC: Xe Tile sysfs
> > > + *
> > > + * Provides sysfs entries for frequency in tile
> > > + *
> > > + * device/tile#/memory/freq0/rp0_freq - The Render Performance 0
> > > +level, which
> > > is the maximum one.
> > > + * device/tile#/memory/freq0/rpn_freq - The Render Performance N
> > > + level,
> > > which is the minimal one.
> > > + */
> > > +
> > >  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
> > >  	kfree(kobj);
> > > @@ -20,6 +32,65 @@ static const struct kobj_type
> xe_tile_sysfs_kobj_type =3D {
> > >  	.sysfs_ops =3D &kobj_sysfs_ops,
> > >  };
> > >
> > > +static ssize_t rp0_freq_show(struct device *kdev, struct device_attr=
ibute
> *attr,
> > > +			     char *buf)
> > > +{
> > > +	struct kobject *kobj =3D &kdev->kobj;
> > > +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
> > > +	struct xe_gt *gt =3D tile->primary_gt;
> > > +	u32 val, mbox;
> > > +	int err;
> > > +
> > > +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND,
> > > PCODE_FREQUENCY_CONFIG)
> > > +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> > > PCODE_MBOX_FC_SC_READ_FUSED_P0)
> > > +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> > > PCODE_MBOX_DOMAIN_HBM);
> > > +
> > > +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> > > +	val *=3D 50;
> > > +
> > > +	return sysfs_emit(buf, "%u\n", val); } static
> > > +DEVICE_ATTR_RO(rp0_freq);
> > > +
> > > +static ssize_t rpn_freq_show(struct device *kdev, struct device_attr=
ibute
> *attr,
> > > +			     char *buf)
> > > +{
> > > +	struct kobject *kobj =3D &kdev->kobj;
> > > +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
> > > +	struct xe_gt *gt =3D tile->primary_gt;
> > > +	u32 val, mbox;
> > > +	int err;
> > > +
> > > +	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND,
> > > PCODE_FREQUENCY_CONFIG)
> > > +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> > > PCODE_MBOX_FC_SC_READ_FUSED_PN)
> > > +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> > > PCODE_MBOX_DOMAIN_HBM);
> > > +
> > > +	err =3D xe_pcode_read(gt, mbox, &val, NULL);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> > > +	val *=3D 50;
> > > +
> > > +	return sysfs_emit(buf, "%u\n", val); } static
> > > +DEVICE_ATTR_RO(rpn_freq);
> > > +
> > > +static struct attribute *freq_attrs[] =3D {
> > > +	&dev_attr_rp0_freq.attr,
> > > +	&dev_attr_rpn_freq.attr,
> > > +	NULL
> > > +};
> > > +
> > > +static const struct attribute_group freq_group_attrs =3D {
> > > +	.name =3D "freq0",
> > > +	.attrs =3D freq_attrs,
> > > +};
> > > +
> > >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
> > >  	struct xe_tile *tile =3D arg;
> > > @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
> > >  	struct xe_device *xe =3D tile_to_xe(tile);
> > >  	struct device *dev =3D xe->drm.dev;
> > >  	struct kobj_tile *kt;
> > > +	struct kobject *kobj;
> > >  	int err;
> > >
> > >  	kt =3D kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 @@ void
> > > xe_tile_sysfs_init(struct xe_tile *tile)
> > >
> > >  	tile->sysfs =3D &kt->base;
> > >
> > > +	if (xe->info.platform =3D=3D XE_PVC) {
> > > +		kobj =3D kobject_create_and_add("memory", tile->sysfs);
> > > +		if (!kobj)
> > > +			drm_warn(&xe->drm, "%s failed, err: %d\n",
> __func__, -
> > > ENOMEM);
> > > +	}
> > > +
> > > +	if (kobj && xe->info.platform =3D=3D XE_PVC) {
> > > +		err =3D sysfs_create_group(kobj, &freq_group_attrs);
> > > +		if (err) {
> > > +			drm_warn(&xe->drm, "failed to register vram freq
> sysfs,
> > > err: %d\n", err);
> > > +			return;
> > > +		}
> > > +	}
> > > +
> > >  	err =3D drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> > >  	if (err)
> > >  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
> > > err: %d\n",
> > > --
> > > 2.25.1
> >
