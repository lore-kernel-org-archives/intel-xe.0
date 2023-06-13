Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A405C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 08:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527410E353;
	Tue, 13 Jun 2023 08:37:38 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3110E353
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 08:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686645456; x=1718181456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x37CvBqC3p47r0+W9ftR15UbvchOzj4Fyx0NoJRRl08=;
 b=PSnRjViInxXbAyMOmYsDrmUZgnm5KO7UFLV2KSd53YB5OQR8x9609Mba
 1s12xP6sgz/1Uur8H4/EIPjIFoWoo5y8LGqGBAGC6fEmGAPwhqIOZXFWl
 +mV4TT+GVomfyg4qoLLroWl/ugD5lpKtpuLcV1lFHNXTQuv7W4OZS8Zu4
 PMhzrQ+S3lKySrgObx1nWvFAaa59i56D/M/mYM81h7t8iTLVOgYYLKath
 RCWEByePQMjzccNFXSRzOf6Ce5V09I2/kY37saE0RiGE884qZ6TdKZYJI
 6DBb8+EKBk1TdsPho8dR5/0nNQqsGcJo75bqzxo189DcBaPqJ0/7ovEkE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="386661199"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="386661199"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="824300680"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="824300680"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2023 01:37:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 01:37:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 01:37:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 01:37:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 01:37:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXEzk27yRv5rEGXFKiALLzi/YFeoKjZ1r6i8lWU4iHSw4xj4qaBSBSX3qL+4AapGBxZiSpJMPuD8bEobuHr48bTzwY5ZKsh3JM1RTIa1Pk2qMG/cYW7eeodb3n+ruZHEPjjiZ4EKnViwRMD13rCJwTkNCvlGNDqXtb0gumd3IrIJyDf6MBiZXVnv+j3gG6fmvXGHYLLXzmdVh0QajVac3J7eSTk4HnJKdicLtX6EqBLKfKxBdz6Q2B6S6BCnfbE0u4WXFCmLFF6yFYHAv1Br5mVi2vtxQV9MxzZD7GUylH86VGp777n8kbWRcmmHNbVl4sMiFTpMmDuajiiTVjPASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2dyDOrn4nHqJk4+TqqSrePziAK3NhejakUzAOIJOMA=;
 b=BLc70ET8dmZ49nTkYZoyBtZdmWab3APsZFUQ7b4bxc/RCKV7yUt8zS2FFeLOi0PGbSGVQZzrxCk8XDlwe71yzNrGusFcP2oEXzEBS2x1xwZq5vfGunOj6kMi2Uri9D2SeNdysZX33ne1MfyI+3faXrGqlcKJ0WPRBm6OjN8psmdBhHtwb/wi2Wkuq8RcOGDGJAdsJ1ZGTaTXeKgB7GlZozRjd+SHfglI9cX5QKsKEhAvhOanqYn3VozFWwnBjhIipcjDgHE149obkyziotPy0jw73tBTSzIKQO18z91ho98LcRJ8Iy0RoaywcQRKydmSiwdlPwv7RweQ1WYFRNm69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 08:37:26 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%6]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 08:37:25 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/1] drm/xe: Report tile count from device
 query api.
Thread-Index: AQHZmFuqLHh/vACXIU+8q43jJBmKMq9+MReAgACPkhCAAOsbgIAADM6AgAi6duA=
Date: Tue, 13 Jun 2023 08:37:25 +0000
Message-ID: <MW4PR11MB70567FCE9E551E73BADDCA11B355A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606094929.2989914-1-himal.prasad.ghimiray@intel.com>
 <20230606195555.GH5433@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB705690A2A21050E31CBF545CB353A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <20230607183115.GN5433@mdroper-desk1.amr.corp.intel.com>
 <87edmnm6a6.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87edmnm6a6.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|IA1PR11MB6291:EE_
x-ms-office365-filtering-correlation-id: 1f951f55-85a7-4288-8ac5-08db6be96a5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HPXaUH2Oqf/8gXqGZlyPOBobsyDczSBfS6ZhsbNd6zbhUc7bVPc2yCmDtDvtVvNoj19S1thK1w53Z4wlBmLIpvN9OJHrfWdZhOvR6jEY22eladpcCcrSAQBRzwblp3YkszXF6S2zXIsmTFjMxmNbNHtqckXg05NCeo+s0QiMS7kTUJtT5eO8gDFU8wMG9tYXcj+2AyRWUQjFS3vs7SDrnX9qvA7ULC47kvpQK2wg0Dgl8GoAu8rqNiSBGmTo6cWQ1q7F5ZOpyFiZJKDH0TZPvel1ah0WQwbcez8PMAkAuW5HDPgLX0cQ7FMJZULVLoY0dewerIMFvvCHyWtttkFvpyt67Y8d+oqQn8By5zhsfB4txUa93N2OQGGfeDUiQwNBDomBKThie9IXRZpNhOq4WPqz58Ic6EqIw8XAyF4SvR8oWKCObqaBur+LMylNkRYAAiDSvoOKE4rR/1vDkC6tzOGhCTm4qqDVukj5sNNTBm5P5iN0W+Kf+bhoznRwY85sSFjpAnj0tfLQBWK+mpOxO/odwhapDc1zVJMcd4KER/tMoKdNZUl45YCAa1/tg3Yi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(52536014)(8676002)(6862004)(64756008)(76116006)(316002)(66476007)(66946007)(4326008)(6636002)(66446008)(66556008)(2906002)(8936002)(41300700001)(966005)(5660300002)(7696005)(71200400001)(9686003)(26005)(53546011)(186003)(66899021)(6506007)(83380400001)(38070700005)(478600001)(82960400001)(55016003)(122000001)(38100700002)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HbacGJExvzya0JYiDv0DLfPNJklVRg8TLo2BMXCUyQfZTUPkDlqGLUSaATAk?=
 =?us-ascii?Q?DhrYnHKyYgo2Uhd0XErjbwG1+gbrOnlaueTlNnjtgFAy63HU/e6T9qYJQCb6?=
 =?us-ascii?Q?2eIoJMuztLUOYf9byYjiZIagHRPsZHg5VqYDt2h2t5hVf1P9SA+O01Sq5qFo?=
 =?us-ascii?Q?KrBPY422FymFNmCAmdYpj3pbD9wREIbYZ6/UlcKiPWURVkA4wJF38oLyoR1k?=
 =?us-ascii?Q?ppKFJntMl3at7OHYDQRfkRWsCjUyBDPBKqDh/VEF16CbbcAXYPi4lgvR+g3D?=
 =?us-ascii?Q?G5Zef4F0Pdp4n5AVfjZMGjqmRJm/SoWS98L+JhrL7S1U9KsL/A92TwfQ2PF7?=
 =?us-ascii?Q?3EdzMUgqrTJzZxk0ETFInCLy9PwaPg/JGdPT50x5DzQAX/tRADUVKIjLcZwt?=
 =?us-ascii?Q?x1phus4+mo4HVHLy4s0rVvOQ3Qsb0ZYgjaJMqy3u4ZexCrZfRvpetoRDCHeU?=
 =?us-ascii?Q?fi2s8InnVIfOxzXKZwObVv/in5Nbc5xPAoowWV3LKQXGgg0ZCdX/40tIcp2i?=
 =?us-ascii?Q?Uh4vCSkoGr6SzSnhdzo/+1jw3LUT88RXSly9+p/PzCais0I2wUwufmGHFkhy?=
 =?us-ascii?Q?ZipcrPCZTpIDxS1XLPIZAM9PPkXZ0ST63h+W9CPhTi7pCiaa5217hEzORYmX?=
 =?us-ascii?Q?7cMozeF4znGkZCgwdkUKHs35MlKyI9Z41oyG/a13iXmJtSxsykDSdK0FdAsu?=
 =?us-ascii?Q?AOKOnF1EbZSEM64bYX8PTHPIWZG6d9dK2B/miI4Nu+wswn60H+osJ8XFy4wd?=
 =?us-ascii?Q?hpiqtLbHDmFMaQKtv0yUrvVe8NYsEJ5I1efZLu9ZoBxXS/srCfv0MyxqaS9B?=
 =?us-ascii?Q?zgoztK1ZtQ4jIqpk7gtKW3pQy5/O23xA1C8Ehp0bUPZlWpSv4oXHo5saRJhv?=
 =?us-ascii?Q?C+u+7GO3ffyRiDWnIywaFaFbgRbQrkCRoxZSuTXxUEhJIyn6ZE+N9/cSZYKg?=
 =?us-ascii?Q?xuczOviQU04xoFNVLCXcmthzA9XSxYNwk6avqdj5MmGNUHQ99ofpULwdtfG/?=
 =?us-ascii?Q?VOFeaxea69PzOdEFovhVOdUgbHcIgzaTPqqBz+qSFYktqc2LKRzrxieZisoH?=
 =?us-ascii?Q?oe9IPeSd0Q7D9nslBSjQzsXBW72PYR+ldJTkbADV9TkwyrzXlFMptK9NfE9o?=
 =?us-ascii?Q?O9tTVrHJxrvzLsTCFSFRQTSjHNIoX9W2TUX2sQVrTm5+JsZwijnS5FziVAEV?=
 =?us-ascii?Q?fgLXxhlXryKy3ig5toBboCUnzbM0UYFYr/4wBfwdwKW8/INAr7yKRTqALlf8?=
 =?us-ascii?Q?4RtQ879pe5yDaoL9PLUePhhGfVWVf+VOsCCMwOPniuzeFNTFkleLakjJiGor?=
 =?us-ascii?Q?3tUtyuiGPUD6oVHrqxS5ohtUGe1gq6NX9yoqo7SHwke6AePEnHIviiEmlJSp?=
 =?us-ascii?Q?2jHBEzhUU0AHE3auR5co0qDVJBRRRiPfyo0HkAXrMafwj7POivq9x0X2yz1r?=
 =?us-ascii?Q?AfUK3oUabxAmU5liGer4vLcWGda8EwNjJd45+vyNMt3pCexdx4OtOdqyV0Vy?=
 =?us-ascii?Q?PX1rmVc6JFg+0D1fHI3M/jyxCLYsFFl7WPv70dRYkrOxmhHFA6/iw54sftRH?=
 =?us-ascii?Q?pN2iFBdzt1Z+7fkDpNaXrUxutPMB2s9dAjW5T1xL3rCzrv30Pm0AEhqy/iz9?=
 =?us-ascii?Q?1A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f951f55-85a7-4288-8ac5-08db6be96a5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 08:37:25.8897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WfNF0ll+AbOrY0dP0HyhKrOc6ZBa073zyH/Yby7xAMp2fRGiAVC/KuRzOmMspkj5j63YWkCCE2klbBuLEsH7+tYsCCpWs1YHC12BONW8ozo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Report tile count from device
 query api.
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
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 08 June 2023 00:47
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Report tile count from device
> query api.
>=20
> On Wed, 07 Jun 2023 11:31:15 -0700, Matt Roper wrote:
> >
> > On Wed, Jun 07, 2023 at 04:49:09AM +0000, Ghimiray, Himal Prasad wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > > Sent: 07 June 2023 01:26
> > > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Dugast, Francois
> > > > <francois.dugast@intel.com>
> > > > Subject: Re: [PATCH 1/1] drm/xe: Report tile count from device quer=
y
> api.
> > > >
> > > > On Tue, Jun 06, 2023 at 03:19:29PM +0530, Himal Prasad Ghimiray
> wrote:
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > >
> > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > <himal.prasad.ghimiray@intel.com>
> > > >
> > > > Does userspace actually need this reported in the device query?
> > > > It seems more likely that they're going to need a tile-based equiva=
lent of
> 'drm_xe_query_gt'
> > > > that returns not only the tile count, but also further details
> > > > about each tile.  If that's the case, then also adding this count
> > > > as an extra field to the device-level query seems redundant (and
> > > > the existing GT count seems like it's probably redundant as well).
> > > Hi Matt,
> > >
> > > From userspace  perspective the requirement is to know number of
> > > tiles supported by device and agreed 'drm_xe_query_tile' should provi=
de
> this info along with other details.
> > > Can you please provide your inputs on what other details can be part =
of
> tile query ?
> >
> > It's really something that would need to be discussed and agreed upon
> > with the userspace teams, but I imagine details about VRAM might be
> > something they'd want to receive via such a query.
> >
> > > >
> > > > Are there patches for any of the userspace components yet that
> > > > show how/when they'd use this?
> > > https://patchwork.freedesktop.org/series/118927/ exposes per tile vra=
m
> addr_range via sysfs.
> > > While writing IGT to test this sysfs entry, I came across the require=
ment.
> IGT patches are WIP.
> > >
> > > Just a thought, will it makes sense to expose number of tiles device
> supports by sysfs ?
> > > Something like: <device-properties>/number_tiles
>=20
> In i915 e.g. the number of gt's was never exposed, userland would just co=
unt
> the number of gt/gtN directories in sysfs to get number of gt's (see how =
this
> is done in IGT). So something like that is possible for tiles too (see em=
ail
> thread "Re: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> size"), though like Matt says needs discussion with UMD teams to see whic=
h
> particular option to go with.

Thanks Ashutosh,=20
For the time being I will count the tiles on the basis of sysfs entries.=20
Once we conclude on the tile query uapi will make required changes in IGT=20
>=20
> Sometimes I think we should put whatever we can in sysfs and minimize
> things exposed via the query ioctl. Though again not sure about the
> tradeoff's of one way vs another.
>=20
> Ashutosh
>=20
> > > IMO this info should be available to userspace even without making an=
y
> code changes .
> > > There may be other such potential candidates which can fall under
> device-properties.
> >
> > That's really something that we need guidance on from the userspace
> > teams (mesa, media, compute, etc.).  It's hard for us kernel
> > developers to really know exactly what the best uapi would be for
> userspace.
> > That's part of why the DRM subsystem requires that any uapi change
> > proposed for i915 or Xe can't be added to the driver until the
> > corresponding userspace patches have also been developed and fully
> > reviewed.  We don't want to write UAPI that winds up not really
> > meeting userspace's needs and then be stuck supporting that broken uapi
> forever.
> >
> >
> > Matt
> >
> > >
> > > Himal
> > > >
> > > >
> > > > Matt
> > > >
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_query.c | 1 +
> > > > >  include/uapi/drm/xe_drm.h     | 3 ++-
> > > > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > > > b/drivers/gpu/drm/xe/xe_query.c index c4165fa3428e..54efbefd663f
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > > @@ -197,6 +197,7 @@ static int query_config(struct xe_device
> > > > > *xe, struct
> > > > drm_xe_device_query *query)
> > > > >			hweight_long(xe->info.mem_region_mask);
> > > > >		config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =3D
> > > > >			xe_engine_device_get_max_priority(xe);
> > > > > +	config->info[XE_QUERY_CONFIG_TILE_COUNT] =3D
> > > > > +xe->info.tile_count;
> > > > >
> > > > >		if (copy_to_user(query_ptr, config, size)) {
> > > > >			kfree(config);
> > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > >b/include/uapi/drm/xe_drm.h  index 0ebc50beb5e5..8e552aa55037
> > > > >100644
> > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > @@ -185,7 +185,8 @@ struct drm_xe_query_config {
> > > > >  #define XE_QUERY_CONFIG_GT_COUNT		4
> > > > >  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> > > > >  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > > > > -#define XE_QUERY_CONFIG_NUM_PARAM
> > > >	XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
> > > > > +#define XE_QUERY_CONFIG_TILE_COUNT		7
> > > > > +#define XE_QUERY_CONFIG_NUM_PARAM
> > > >	XE_QUERY_CONFIG_TILE_COUNT + 1
> > > > >		__u64 info[];
> > > > >  };
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
> > > >
> > > > --
> > > > Matt Roper
> > > > Graphics Software Engineer
> > > > Linux GPU Platform Enablement
> > > > Intel Corporation
> >
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
