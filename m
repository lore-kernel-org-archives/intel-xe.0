Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CD6C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 13:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C1A10E13A;
	Tue,  6 Jun 2023 13:21:12 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5192B10E13A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686057671; x=1717593671;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1ZJXw4n9RbaFgUvyNK775GcaixeNod6G7jCpStTzkDk=;
 b=FGAH+C6UKdEWWkSsNglFBcbqJw0pIbBykeq60aG7KSd3b7SmlVec4GFk
 2pFq+yYHRHcOrf6SZHemLRCSGrcvl2r0wdKKxxum7/Dr7TVJRO8dKC7xT
 N7f3gB0k2jEqQBT4W3IqKOGFJ5BtE/x0YcoZOwrIn9f98AFmT8cZ0PuRR
 P3b7oCP/To52dcneTtFMwzc2f8h6Un44v1l8kUe76+cp5BSRdn4R1fEPz
 +a3oTx4uwvOMi54t73jFrqT8efhPovRyCXryMDnSdL45lUpQKQDWlKxvE
 TGWwxEVYfPIAJxdG7QIrVI7PJWRPaaTiFWU+RMcIWNSeRerej6Ln92O10 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341312374"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341312374"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="659526282"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="659526282"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 06:11:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:11:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 06:11:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 06:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlGYUQLyGzD4U9RP5mrqMaJNOb2WttSLs6qGzHsiq3RYOUTAsF37lM071AS2HTKO1I0l1z0ZUw67v60/TDZVp+J8WHnSAMLFC2cY0uiMgHW+g4LhdSJk1IJLAp/PZnlzzGlCjlJkZ/+q0o8F5mGD1pI+UeiLlUFP2/hKOMbKZ7OltbshnPqz8BuoCdUIg4UdopveWtZIOB2CCKh3XYd3i9PuCWRytQAAWr3BO+D46+i/yFqpLLYkcv624HLpCmEPm41ksZTn/puN3QNoMIItWQ/YoAx6nIdyHEkNyP9o+2qtKBmmNyHoWoFd5/e4U3Se+CIX9ny2V+3pO/qp/vquMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S88PL7lhOR5wQABP4Abid0rko8TbPOT4hGrkzORDa6g=;
 b=HUHLX48vImxhZZr8nr03V0lVBYZrggEATwQMvrgtuXb+azx4ATMPhGpTPBn6ue4Nsv/4V2YB9oIWQxOVHc9DxVWmmZsQLi6MxAUk3hQdgj6qwyAg/+zKzG0QVYaYtXKieLps6pAFCMie+HGid+TGBC2C3Sl3bHOUODH9T1jBIm2w916fOh7ouu2j7+wg/UFlyARPoKRsitqZ4yIhOYtrpVRIvVR44Z3f7akb3JIImbdU044QdfNVUGtxG2l/WG7yPfKhKJrwR1Yxm1ef6+FK2mQPKK+zHgpVa1hnOaDv3aROP5WRCX774PeP+YnmNsiqjJ7TC2tXI3xcCfpVhE6rsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Tue, 6 Jun 2023 13:11:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 13:11:32 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcndoX+xMJhwEqU0lzS0RGA9K99pBLQgAASFICAAAWnoIAAA9EA
Date: Tue, 6 Jun 2023 13:11:32 +0000
Message-ID: <MW4PR11MB70567C5690AAF98A0C8FC5DDB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DM4PR11MB6165:EE_
x-ms-office365-filtering-correlation-id: 8bbc565a-874b-4b6e-458d-08db668f8c45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: euW5JL0M7BwU+WfMxAXHuOUEmknQ2TC+M25et1yYz/c91auvKBhyRdcFkICLF3VH80taR+aYYjCUObx6/irJVgBQNpTliji7Indqnhzu/ehjQYsTlzhq9vsyJ+9oiXLfXlzSS8yUVD5pK6nCiS/mIGjcP5FrATwKoJxp3clvdpJP5oSHI0V2BmwlwhEUwyF13E+AX1KA5+wahnjWLLGdd1anSwNlXEU38XzL5h8w+2314esyLsRBS0008zeJLfJvkIL2OHhpFEKwpx4mWnFlqejxOZ33SGWVuJZ8D4iEsoWyiOk4Rv5oQs1YW/Xi2iN+zCd8W3XPKmw6vkvijwr1PvX/g66M1rzV0lHnXktfHKn+p4r4p+BDDfoD+KUena0D4D9wTeF3iczl8lqk8SF7JZHa+1W3IwjTUPmFzDp/UBYaCv19mzXPincMKHyX6TXGO7agiruMsZSct5tsbaFejJuiUDBAbCqPmkGf/gthL6aUm5f2tscXcAKxNA6fQVyysWSqSr1Mv+BnwnxbEaQn/TOo3fBcmjqw7JmjVby0A/YGMPoxtO5/f0aoWQeWSMRtLXbDzsbuxKrvqn9Y6sWFo/XVVW/OtY8GCgq6mAW8aqZrg0SpILFehGfsvUfsdaEk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(83380400001)(186003)(2906002)(2940100002)(33656002)(86362001)(38070700005)(38100700002)(82960400001)(122000001)(55016003)(316002)(41300700001)(52536014)(6506007)(5660300002)(8676002)(8936002)(110136005)(478600001)(7696005)(71200400001)(64756008)(66556008)(66476007)(76116006)(66946007)(53546011)(9686003)(26005)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jz5BgDgfWRwBL+TR2deU/8FTF8AJpgG/cOm7XqY24SODYJnyCuFXBZbOVXrq?=
 =?us-ascii?Q?KvfyLrISWM9DKJA3Gq0HSdu1YJVvT9+94JUGEYrhSaKq8th2L97IoRrsX5lI?=
 =?us-ascii?Q?o9TK1F8fnpETdX0tIKmjCrARJLiPy5pY+qpQ/6ngukY34apg3WaQx5radx5y?=
 =?us-ascii?Q?67W0GUYT4qJbfNLjARHMBcfQwzBZUGo6BVaNJdtnjnj0iQcMZXDGyasklHUv?=
 =?us-ascii?Q?MWhdOvcAjNjqfQM2GTVmywHqC/KorcFyX22G8xXnbp9KEEftuiOdJ3uSEMOf?=
 =?us-ascii?Q?YisHuW5g3XEfLKL/DYMeyMjxhPOZMI0J6idFpGfpI5frHSfzit4qHrOURS/D?=
 =?us-ascii?Q?knoR5s1VMuoYIF9w0IbbUDfadEPHQWbqW9VQ5PK/xbNs6kI5YA4vQAzxXypf?=
 =?us-ascii?Q?zTxXYgd8eiQYUUiDCvz5w5FipAf419pRlzUSUEoQTp6r3YAI711yWqqZasOf?=
 =?us-ascii?Q?fwY0Ezm3trj/e/OCisHp3/HmH5mTkcu4YRNPnvVyj6I8n7PymuaeGgigTz1i?=
 =?us-ascii?Q?syKQgTdEWLi0MIjDQ/Kz03C6dnIeA0pDCOSDOIrraZFuWhQl7Syzu+Kjzq2c?=
 =?us-ascii?Q?DoW2ZIpTr4bNfAHFKAPTID7QSwP3Y6BmP0iweWujjUtBFyCqa8QRXAwbR2fX?=
 =?us-ascii?Q?qJzybwjz9SvZGspyQD9r4kZK7QbX4+LuI9D/bfRMrSHfGR6WqFaC2ciPfW8U?=
 =?us-ascii?Q?/BLmZC7IaYaI/gUK5OvV/4l9wSvtHpTVE1pH15pfQBZydixI9H5eu2lmqI9Q?=
 =?us-ascii?Q?cqEvQS16cCACR5m6el3GklhagCFbtMzAO3M8KdHI2bIjYnS2uXHLmNLtCbhd?=
 =?us-ascii?Q?HBj0f+iOvcSbv2rfwQWTaesVNtgSxRmyswo/69sjk21UhPVFZYFHE5W9GACt?=
 =?us-ascii?Q?lzTFY5LUGpMRzNxEQZ/jvusGEoSaGlcYVDDbK2L9ZbIoroYh2dDh/T/Rkp23?=
 =?us-ascii?Q?XLkKgfqPYSZkKT9KsAFCZWIQ+s3Z0rdUcEpqn2aHri9QmxYINOYuPhgV46aL?=
 =?us-ascii?Q?WjvDCsgv1xWxJXza2oaW8g0Kf01KXrSeA60qlzcoWEVi8M6fG6WckF2wWuEm?=
 =?us-ascii?Q?IbmmestgZ8rsqy4ghz0EUWal0xFPJQuDyqdQm0b4/g/Uf8yGIHg1Ev3U5rAa?=
 =?us-ascii?Q?TIAxuXZX5DGpqcCk0Yje/lQR26qyjJ1ZBBavDTNp7WS+l7RqqFkKa8gJgNjo?=
 =?us-ascii?Q?vhEeCmlk29ha4dbUNMNRiH7EhsVqEbwwsWuMh7ZHuWvJylUuPqBxFYEr3Mr4?=
 =?us-ascii?Q?nOqYCJF2ahuw00NRHn4RmbSG1N3HxnDU4wQtWX8/fhbmD/rzPnNUASf5MG+j?=
 =?us-ascii?Q?5Y9FUP9WFEhoA8iczlsUW3/nClCWNihycaNwEaTiDtZtd4CVAJJbTMIxv1IN?=
 =?us-ascii?Q?1gHZDFTeq3BJD14IqmRlvjuOt9mGIqt6zeSBq6CxtzviWtrOE7aoL00GcBWW?=
 =?us-ascii?Q?RGgflga2FvcRbEsZBG8vcI3Vq5vSRQmWAFUhBvQEF3b1xGH6CAfKtOiv2Zz1?=
 =?us-ascii?Q?juC4LP/juz5df7zlen6kGmxASyP12oIixnEts+PUxfVK/1SGcsKj5y13rKmr?=
 =?us-ascii?Q?twEgVYylQPX/3b+zISoserGAxLlfTNhfnI1CTenCHoCEZcXTeH4g/X28/TXs?=
 =?us-ascii?Q?CQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbc565a-874b-4b6e-458d-08db668f8c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 13:11:32.2207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9jQTh3QiALUB+aZ5LW4f2e7ir5PhmqGuLjwgSXK0NmImhFOPvY0DM+1Y0230y/FjuSDszRkCIJR9afTiEbPoBsC0CcMizqTPAtDsNr59OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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
> From: Ghimiray, Himal Prasad
> Sent: 06 June 2023 18:28
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per=
 tile
> memory size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Sent: 06 June 2023 18:06
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > per tile memory size
> >
> >
> >
> > > -----Original Message-----
> > > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > Sent: Tuesday, June 6, 2023 5:07 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > report per tile memory size
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
> > > > Of Tejas Upadhyay
> > > > Sent: 06 June 2023 16:43
> > > > To: intel-xe@lists.freedesktop.org
> > > > Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > > > per tile memory size
> > > >
> > > > Add sysfs entry to read per tile physical memory including stolen
> > memory.
> > > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
> > > >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > > >  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> > > > ++++++++++++++++++++++++++++
> > > >  3 files changed, 53 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index db61da4d6212..7b5443aebd00 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -107,6 +107,11 @@ struct xe_tile {
> > > >
> > > >  	/** @mem: memory management info for tile */
> > > >  	struct {
> > > > +		/**
> > > > +		 * @actual_physical_mem: Track actual LMEM size
> > > > +		 * including stolen mem for tile
> > > > +		 */
> > > > +		resource_size_t actual_physical_mem;
> > > >  		/**
> > > >  		 * @vram: VRAM info for tile.
> > > >  		 *
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > b/drivers/gpu/drm/xe/xe_mmio.c index 475b14fe4356..86a7c65c301f
> > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > >  		if (err)
> > > >  			return err;
> > > >
> > > > +		tile->mem.actual_physical_mem =3D tile_size;
> > > >  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> > > tile_offset;
> > > >  		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > index 821bd49de277..d48c599e8cc1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_type =
=3D {
> > > >  	.sysfs_ops =3D &kobj_sysfs_ops,
> > > >  };
> > > >
> > > > +typedef ssize_t (*show)(struct device *dev, struct
> > > > +device_attribute *attr, char *buf);
> > > > +
> > > > +struct xe_ext_attr {
> > > > +	struct device_attribute attr;
> > > > +	show xe_show;
> > > > +};
> > > > +
> > > > +	static ssize_t
> > > > +xe_sysfs_show(struct device *dev, struct device_attribute *attr,
> > > > +char
> > > > +*buf) {
> > > > +	ssize_t value;
> > > > +	struct xe_ext_attr *ea =3D container_of(attr, struct xe_ext_attr,
> > > > +attr);
> > > > +
> > > > +	value =3D ea->xe_show(dev, attr, buf);
> > > > +
> > > > +	return value;
> > > > +}
> > > > +
> > > > +	static ssize_t
> > > > +addr_range_show(struct device *kdev, struct device_attribute
> > > > +*attr, char *buf) {
> > > > +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> > > > +
> > > > +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
> > > > }
> > > > +
> > > > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > > > +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name, 0444,
> > > > +xe_sysfs_show, NULL), _show}
> > > > +
> > > > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > > > +
> > > > +static const struct attribute *addr_range_attrs[] =3D {
> > > > +	&dev_attr_addr_range.attr.attr,
> > > > +	NULL
> > > > +};
> > > > +
> > > >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
> > > >  	struct xe_tile *tile =3D arg;
> > > > @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
> > > >
> > > >  	tile->sysfs =3D &kg->base;
> > > >
> > > > +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> > > > +		drm_err(&tile_to_xe(tile)->drm,
> > > > +			"Setting up sysfs to read total physical memory per
> > > > tile failed\n");
> > > > +		goto err_object;
> > > Will do kobject_put and return 0. Which is wrong.
> > > Better to do kobject_put and return err here.
> >
> > I don't think I have any action to do based on error, clean up was
> > already done. Am I missing something here?
>=20
> In case of sysfs creation failure, you goto err_object do the cleanup and
> return 0.
> Should you be returning 0 incase of sysfs creation failure ?
> >
> > Thanks,
> > Tejas
> > > > +	}
> > > > +
> > > >  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> > > > tile_sysfs_fini, tile);
> > > >  	if (err)
> > > >  		return err;
> > > >
> > > > +	if (0) {
Doesn't make sense if disabled for default. Move to sysfs creation failure.
> > > > +err_object:
> > > > +		kobject_put(&kg->base);
> > > > +	}
> > > >  	return 0;
> > > >  }
> > > > --
> > > > 2.25.1

