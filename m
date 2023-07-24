Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE41C001DE
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 08:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298CF10E282;
	Mon, 24 Jul 2023 08:35:37 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0C610E078
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 08:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690187735; x=1721723735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/QE1K9qwXA4f1J9cenp+w2tgnJinT/yFF2MDnDhDyqk=;
 b=YxacoxFrQ8RgznsG641TTsvMTeBf+Ub6K5zqiQYpdTD2Xrdih054zCqB
 tY04LV8HRXdDMYO0IPS6Pk1lmx1T/UZFpURrZfipbyMfsp1SRHOT22+fm
 h9TNB8J+gIqLlhfn4WqQ8OXIAPupYC6pcYQRrfoyFgUK2Vg5j0DVS1/+i
 I0nWd3liBMaN9fNjIig9YlCuVhIRNT6KrE6Q08dKv5e6WO1qaRI25z6kX
 N7yOfxwA8bXk7NbGT7xyNDZau2D1FDnToCQ0hqGzSEHEFE7Oh8jvft03w
 OBiRbOSjkRuRgMHw6hhdiSITokQ+3ikoccLpmHUQqoYynuvBZNaCehTmK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="370983930"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="370983930"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790886179"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="790886179"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 01:35:19 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 01:35:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 01:35:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 01:35:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQ/4lWARoCI0GoKdf/KgOvxg2WiBq8KXguriDsClw46LnndDQ6P1yu3zz5nPgeswTrX2j+GpEItVmG4p0+D17HbKvlwf/XtnmwIrWY0KinpJehF40YEaHrslTHNXJzzUJgoZJ37xTQSO50nCyKwhTkGNDKN6UE7cNztgFs8VxYw4pTGRl8GmEdVnshR2BMdbCSrZwCoH2warXIIU7izyT6+sxY8Qi6YYbiGJggsdYBt9mGX7M6FlekJMAEUL/LgicRViNkqLSUVMyfjCEwRitjVL3Cdfg299am6XMAnTGFAjjqYh+CCt8znNpz9XWqfD3ok/8pU7/RmfJzNNdo9c8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSk301lOUWEOYz22mqA+pSLLJDeuSqKg4+gVZni3ylI=;
 b=PdntbeGUVx4moKjQPNGNdczmvhowlgsFhvmRCa5xnZTLKn4YTYGN5yR51JuZ9ko50BPC5z6sNMD3EO2YWcXJQ66KBI4/CNm3HDOnz4mg6D3M5/e/9lCb9V/IZiPqBMaRYRGaKQ1H3/6ZkQ9xE0IFxePBBRT5v8nVYeQyFljNi4xFy6RIcRYH/5hhlJK2CiUPM0wogdMKP2uv4E39ouWmTxbW8H34qPky0DrrRxW9jK0JpyD40jDKAzE2zhBi1lU987HDH9/IRM6V8Y3OGMxHWIWyyB0isfdlqdh4HequWjTcB0NBt4D2/HBm3JOrdfHBhAkwD0PBPeT1bAR8xs/pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5473.namprd11.prod.outlook.com (2603:10b6:610:d4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 08:35:16 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 08:35:16 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt reset
 fails
Thread-Index: AQHZuXucPRVq6L6MtEOjArEWQCTWnK/AMveAgAAa/NCAAo6ugIAFw0hQ
Date: Mon, 24 Jul 2023 08:35:16 +0000
Message-ID: <MW4PR11MB70564E4F15524C4DACA655FBB302A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
 <20230718133216.3079521-2-himal.prasad.ghimiray@intel.com>
 <20230718235250.GL138014@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB7056C4F7A20F8995CC5D3207B339A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <ZLlhp1t9q9BeHRJ+@intel.com>
In-Reply-To: <ZLlhp1t9q9BeHRJ+@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|CH0PR11MB5473:EE_
x-ms-office365-filtering-correlation-id: db8e4cb6-a687-492a-e0fe-08db8c20e836
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fk3yDVlzaicL9eRjlLWaDRhMt95leO2otLzjAgfcneqiOt8bnTEMyllWP04PPZ+LBTleiAXq/ksmnTYDhuJYqqHAAcTfosSgoUJAfIGImiHA+D4hMAY0OahhB7UGv7zVDpsZdyWiVZBPMK11UpBbiqQ1SP8I6WegGDC98dl2jIlCwgVYGQYqCbo2scyF2h4KBc57iAyj5OVIrTziymkOz7oMUOrtWLDQAAgfnj5aW1/93NHYczIraRdLPqs9j7wADje8PRtkw/PKF6YvH1KeTnbNwjA4sGebmex9Qcr1E+M5HlrIAB4jjz61R0gQzcrJRL7QeEbxIFGXi/UK2n5PshmkKyf5TSIAMCab3exgrDhOi6aI2icz0KN3pdwyiKOTH4/EmvWb4uq5p9wXlGo2zBKIXja812+vmoDb9l4Kc7zgG3eCfcbTs/7Oi8KDeNC7NjHajIb6Uur4iuQ1MWwidsQBHJ0+kUJdYHhHIP1xxLNIomPIBcP0FEe3pz8/hWftNvfc4IXbNJ7jUyRRfQEH31XckqWhuLfuur3H1izeq4gJ8CazqQwsIShf5d9f+QHxGCUANCHAS3b6sKzcM6akidx51vL+pyOcoDlV6pnk9Y4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(122000001)(6506007)(26005)(186003)(52536014)(5660300002)(6862004)(8936002)(8676002)(2906002)(38100700002)(55016003)(82960400001)(53546011)(86362001)(9686003)(7696005)(966005)(38070700005)(33656002)(66476007)(64756008)(66556008)(66446008)(66946007)(76116006)(83380400001)(54906003)(478600001)(71200400001)(41300700001)(6636002)(4326008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VUh5hLt1fBC6D0vo7x/OG5YDs7XJGO1tu6jZ9XPWzVgMaPFTQSRS3DETUNrx?=
 =?us-ascii?Q?kFGK/RhDGyEcgBmG+sNZEFwYw37nPjkHqVnU4J++SfNUhBN5JAtnw+RbeGkD?=
 =?us-ascii?Q?qyx0SbWtosPmjUCoj6fjFihAEqPQPb+gqmRLer5pQw+C67+j8Sdwd11MFGYC?=
 =?us-ascii?Q?83txGxD6Z29ub3NpmboYH3ZxtkhRe5iK4sVbnocF58o/MKbo4E9vqEYIxR1I?=
 =?us-ascii?Q?ALg+6UxpytPFL+dXfT8VoBmMKbxfAiE2wlm/UWi3nIHNdMWNIIsMkBcCDShk?=
 =?us-ascii?Q?mHV7ULS04rWqJgLcBLKivWHvKragvjbKOZaNGdCsH6rF2Y8fsEB1MSdgbqVR?=
 =?us-ascii?Q?Cw0JVC7AN9pHRqnO6vmOFPs0BMr9Tz4YU7zTjvbI6Psr041/YczASfj09nNG?=
 =?us-ascii?Q?O31YPvrpwKHi83SmlnQ0tnSryeT3xm2OQpJry/iKvdWazDPLjasj6844mLJh?=
 =?us-ascii?Q?Nl3BQhLOZM6aTnIC5E/rfPkN/h+V5ka4gMibF9Gnc01J2QLpWYZYAdU0w6sl?=
 =?us-ascii?Q?4EsUPh9iMfCj0IAwPft/I3urT32toA3A7fgyUvfoAiiB8vQaxnSlq24TBtV5?=
 =?us-ascii?Q?DbBoraXvnWlgQ8ngOJcSQhnhCY75HCTg9oAsg342hNyhDckuHbnJM4k8oMuv?=
 =?us-ascii?Q?Sllo/lcIiPR1Em0IOxqQ+i/K722HAR76uuVLybH9ZyyhON++/bA8BXg473Fm?=
 =?us-ascii?Q?3FKsulO0F4aESTZ+lA/l6M8RaKKYH7Zbsxrz3b6ttTahOW+8CZYhmaFrEA2t?=
 =?us-ascii?Q?X4LmlHex8oNXM7l1M6DXShcVUDCCZghoHY2uqT51DipxwDc1HYFQkTJOjnl/?=
 =?us-ascii?Q?UwNTvIszeg8M7Pn/7xtEF6/E1mQw40YTrgcZ3y6HMMZ4xS/WDn2ddYP3k+dR?=
 =?us-ascii?Q?hF3UxuIbAW95DA1aCsEBHIAFlUGxEhhgf11dvEgIHlccsUqwd/U/wGbJyXnr?=
 =?us-ascii?Q?PZSE5xarTCU7Zqd6RJZgupbv2IpkEZbP1u7v8B18sSAnFjcMiT8l/a0/G21H?=
 =?us-ascii?Q?JL1e/yocWg9gLvnYFVMVavZlZcrgj0/k9PINHMaIgh+XyLbplLORRUm1yysg?=
 =?us-ascii?Q?sxsxXrZPEsIDr9Z9OFI67WT93k0oNiZ7G5vpTcCP8jcVebR+uEWHC+v9zKbu?=
 =?us-ascii?Q?0LAyuDkUz7kQviQhhnbZH4fZ6tueqk5CiV6s+l2a/mu4Qav1bQ1+NlA5r9uC?=
 =?us-ascii?Q?qlAZxu9g278FrQc0l0NtXf13wXULB+hGP/zt8+svnbWjdvYsOqCJaBPFjY0I?=
 =?us-ascii?Q?R7qYKBqblZweEHwu6qRdDKj6x1vA0E4K4Cv+3K8E5+WzoFj4mMY2VW6dG0k7?=
 =?us-ascii?Q?tdrQyJnRnp1QkSeD+v47I1tbWIcLXIuSpMcuVPtHOUPdFpDxnImU4vF/llH9?=
 =?us-ascii?Q?wbAYfjy1hSgIssTs3rcjBivBUo+k4aw8Ac+mR7hL0QLF0dTFnU79fquMyH0j?=
 =?us-ascii?Q?WEzO2llqwTBEkqptlBy/hyDyLbasFTCHsN/f0d2aeuCn+thtufl0y9ElTIGZ?=
 =?us-ascii?Q?rWqRM4d+t0v4J9QS/3PM1V1lB8jzgwDpQnP4RiAJljV7t5OHqjjoo5fWj0jw?=
 =?us-ascii?Q?DzXeSQReVUC3QuqVkY/eAMgto+CV4IlY6MZeK7pCwfhnnfboamxnGjBEiuku?=
 =?us-ascii?Q?sg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8e4cb6-a687-492a-e0fe-08db8c20e836
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 08:35:16.5415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wj/5OVsB7opxGupeA5FhtTI70JO+W/ulQ7CT02C3BvyaJVxP/C48j9tibcWOJdrSHnn4IHSVbQ+I2CtoIKJQqzMQ0qIWVjudGquinb5/9xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5473
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt
 reset fails
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: 20 July 2023 22:03
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; intel-
> xe@lists.freedesktop.org; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>
> Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt r=
eset
> fails
>=20
> On Wed, Jul 19, 2023 at 01:51:37AM +0000, Ghimiray, Himal Prasad wrote:
> > Hi Matt,
> >
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: 19 July 2023 05:23
> > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo
> > > <rodrigo.vivi@intel.com>
> > > Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when
> > > gt reset fails
> > >
> > > On Tue, Jul 18, 2023 at 07:02:15PM +0530, Himal Prasad Ghimiray wrote=
:
> > > > Send uevent in case of gt reset failure. This intimation can be
> > > > used by userspace monitoring tool to do the device level
> > > > reset/reboot when GT reset fails. udevadm can be used to monitor th=
e
> uevents.
> > >
> > > This seems a bit questionable.  In theory a GT reset shouldn't fail;
> > > if it does it either means we've either got a major software bug or
> > > a really catastrophic hardware failure.  Letting the kernel driver
> > > just blindly move forward after reporting a uevent doesn't seem like
> > > a proper response to a huge problem like that.  Relying on userspace =
to
> pick up the pieces seems insufficient.
> > >
> > > Right now the return code from gt_reset() is just ignored and no
> > > meaningful action is taken within the driver.  It seems like we
> > > should at least be putting the device into some kind of 'unusable'
> > > state (similar to i915's 'wedged') so that other parts of the driver
> > > know that everything is completely broken and that they should stop
> trying to use the device (or some subset of the device).
> > > We could also potentially attempt recovery ourselves by escalating
> > > to a DriverFLR.
> >
> > Agreed. These feature needs to be there in the driver.
>=20
> indeed. one possibility is to remove the drm card but keep the pci up wai=
ting
> for the reset. Another is to 'wedge' like i915.
>=20
> >
> > >
> > > I'm not sure why any userspace would ever care about the specific
> > > condition of "gt reset failed" --- it seems like it would pretty
> > > much only care about the device being in one of three states and
> > > wouldn't care about the driver- internal details about how/why it's
> > > in one of
> > > those:
> > >
> > >  * Everything is good; can use device as normal
> > >  * Device partially broken; it's no longer possible to use these
> > >    specific GTs, engines, etc., but other units should still function=
 as
> > >    expected.
> > >  * Absolutely everything is broken and nothing works.  You _might_ be
> > >    able to unload the driver, issue a PCI FLR, and reload the driver,
> > >    but otherwise all hope is lost and the device cannot be used anymo=
re.
> > >
> > > Even if we decide that some uevent is appropriate here, this is new
> > > uapi and will need a real userspace consumer too.  The fact that we
> > > can watch any uevents raised by the device with udevadm doesn't seem
> > > like it would be sufficient for that purpose; that doesn't feel much
> > > different than claiming 'cat' as the userspace consumer of a sysfs no=
de or
> something.
> > > What we really need for new uapi is a meaningful top-to-bottom
> > > solution that gives us confidence that we have an appropriate and
> > > maintainable interface defined.
> >
> > https://spec.oneapi.io/level-
> zero/latest/sysman/api.html#_CPPv441ZES_EVENT_TYPE_FLAG_DEVICE_RES
> ET_REQUIRED is the consumer for this uapi.
> > The application can register for events
> ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED with Sysman and start
> listening to this event.
> > Then Sysman would send
> ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED event to application,
> incase sysman recieves uevent "RESET_FAILED=3D1" or "RESET_REQUIRED=3D1"
> or if Sysman detects a repair have occurred.
> >
> > Then after getting ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED event
> application could query zesDeviceGetState  to get the reason of RESET. An=
d
> Sysman would tell the reason of reset as :
> > ZES_RESET_REASON_FLAG_WEDGED: Sysman would try to create a context
> and
> > if context creation fails due to EIO error, then device is determined
> > to be wedged and reset reason is declared as WEDGED
> >
> > And sysman triggers a SBR to reset the device.
>=20
> yeap, this is already good by itself, even independent of that mode.
>=20
> But we need to think about the possibility of removing the drm card above=
.
> Maybe it would be better to add the uevent at the pci level rather then t=
he
> drm.
> And maybe with a general device_status=3D variable.

Sure. Sounds logical. Will be uploading new patch for using pcie kobj inste=
ad of drm and will be going ahead with=20
DEVICE_STATUS=3D"NEEDS_RESET" RESET_FAILED=3Dgt_id.=20
Thanks Joonas for the offline inputs.
>=20
> +Joonas
>=20
> >
> > BR
> > Himal
> > >
> > >
> > > Matt
> > >
> > > >
> > > > v2:
> > > > -Add NULL check for xe_gt_hw_engine return(Aravind) -Arrange
> > > > variables in Christmas tree order(Tejas) -Check
> > > > GUC_GSC_OTHER_CLASS(Tejas)
> > > >
> > > > v3:
> > > > - Rebase
> > > > - Remove notification for engine reset failure (Rodrigo)
> > > >
> > > > v4
> > > > - Rectify the comments in header file.
> > > >
> > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > Signed-off-by: Himal Prasad
> > > > Ghimiray<himal.prasad.ghimiray@intel.com>
> > > > Signed-off-by: Himal Prasad Ghimiray
> > > > <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
> > > > include/uapi/drm/xe_drm.h  |  8 ++++++++
> > > >  2 files changed, 26 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > b/drivers/gpu/drm/xe/xe_gt.c index a21d44bfe9e8..1db4d610f2fd
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -8,6 +8,7 @@
> > > >  #include <linux/minmax.h>
> > > >
> > > >  #include <drm/drm_managed.h>
> > > > +#include <drm/xe_drm.h>
> > > >
> > > >  #include "regs/xe_gt_regs.h"
> > > >  #include "xe_bb.h"
> > > > @@ -500,6 +501,20 @@ static int do_gt_restart(struct xe_gt *gt)
> > > >  	return 0;
> > > >  }
> > > >
> > > > +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id=
) {
> > > > +	char *reset_event[5];
> > > > +
> > > > +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> > > > +	reset_event[1] =3D "RESET_ENABLED=3D1";
> > > > +	reset_event[2] =3D "RESET_UNIT=3Dgt";
> > > > +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%d", id);
> > > > +	reset_event[4] =3D NULL;
> > > > +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE,
> > > > +reset_event);
> > > > +
> > > > +	kfree(reset_event[3]);
> > > > +}
> > > > +
> > > >  static int gt_reset(struct xe_gt *gt)  {
> > > >  	int err;
> > > > @@ -549,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
> > > >  	xe_device_mem_access_put(gt_to_xe(gt));
> > > >  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> > > >
> > > > +	/* Notify userspace about gt reset failure */
> > > > +	xe_uevent_gt_reset_failure(gt_to_xe(gt), gt->info.id);
> > > > +
> > > >  	return err;
> > > >  }
> > > >
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 347351a8f618..c28bb54812e5 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -16,6 +16,14 @@ extern "C" {
> > > >   * subject to backwards-compatibility constraints.
> > > >   */
> > > >
> > > > +/*
> > > > + * Uevents generated by xe on it's device node.
> > > > + *
> > > > + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to
> > > > +reset
> > > > + * gt fails. The value supplied with the event is always 1.
> > > > + */
> > > > +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> > > > +
> > > >  /**
> > > >   * struct xe_user_extension - Base class for defining a chain of
> extensions
> > > >   *
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
