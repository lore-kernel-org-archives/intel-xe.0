Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2AEC4167D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 09:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0710E2D4;
	Mon, 13 Nov 2023 09:25:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4250610E31C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 09:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699867540; x=1731403540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xeqzmpju93YSGPT2QgPAnzZOGAo3Lp8875RH6KnzbbM=;
 b=FNXkmmWqf0kVyQiNPWWnI1nhYpZ0ZkgOudX/Gr8d6cXJQm/ywRQGAH1y
 6K4XILvxD7q+UfoOoAUfH++coPclktHnd4GHPo4Ajg/YBW5yBAMT1a7Ac
 FnH2ZJL4NJvGBkb3XuXrk/7dvK1jw2sL662506IfIlNCX8foqZJB+LunO
 QWYoxY+T3NDZWoUbUsv7+XIntiujm1EevxvjNLc50JiuSXGILb6HsuoqW
 pjlceOnJmvKUFdKkizyZ5fNBe/KPpRSJ9NvyVmui8Iw/JSb54+sOJb/bO
 yQXbVZLsNiOPdVAuu7Z0gAYbkMF5hnTPgF4UlMf8MNN839SkLmhdZ5Tj4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="380793050"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="380793050"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 01:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="830187292"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="830187292"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 01:25:38 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 01:25:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 01:25:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 01:25:37 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 01:25:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cux6dmvQg2LDrmR9x3nGfsJ1wXCEt8Vh5/agWT4yLso6v8LXyQdMGFfIc5Xl9CiDGTDHBSCnnce/wO3hj/WJslls+fAFITV36N2WVK8xJ8qIEbl9jiGZrkL6nhec0V6ZSMSQRFapdeKxfKcwqUe5axw++MXa9JyZmjZ7LRkUFG4A/XrDrayktbudQ8os/LPY/lgHK1XABrvXxuICuOklJ2wXwBreAoTx4SYI45PNZ/UHzIckTLKJcJ5lcxkAoWrati3kJxw/WbSQhD9HjJygPf0hgjVp69oBEnZDLUh28RmxL7vWdfu0kiY6gtZ3VBK+v5YLR17iAnvxHXZsIVCwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuvDh+E3OGHICppT9+1mWxwhvoUAju6tWJeGDYqoSLk=;
 b=mqakO2Gf5Mvr/68sGp0tIbn+Zjb/3gaeLEx42nvS3/oaVarDnjHg1kiFacQackFC1xTXQpxhuZYoKJyEXL+t1KAcjxCTRP6mw5HSKQqmXzkFowvToNlTiev663PikllHRAxhPJrDaBRHPHXFGdEwnyBY735/KGnF0sDDR4YDqpnsXEnloktMM4EZpxsK/n1zdze81pXMX3zMVfMBPdv/58yMv1SVsGHDzYkRhB58nwhv7dcU5f7rBvMrKk/vKAF/KzWJH/RAJOPwIIug6sP62vLexVNnzsdyVk3Ivox5Kxkfox844/KgA9O7N9lEV3+1yYjJ6JBqadxPckeIhOhggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL3PR11MB6482.namprd11.prod.outlook.com (2603:10b6:208:3bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 09:25:34 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 09:25:33 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
Thread-Index: AQHaEkndZNZQuguXukGO93j6s7OngLBwdVCAgAAeMoCAB2yYkA==
Date: Mon, 13 Nov 2023 09:25:32 +0000
Message-ID: <SJ1PR11MB620469365FF57B12D288DB7E81B3A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231108135418.3049168-1-tejas.upadhyay@intel.com>
 <20231108135418.3049168-2-tejas.upadhyay@intel.com>
 <a4701efa-eab1-4a65-94ce-2c08107db9d1@intel.com>
 <vnyr2nbirfddf5yh4q7lskbwrq4hk7v3ngosrazuwiioaufsml@qckippjlrtvb>
In-Reply-To: <vnyr2nbirfddf5yh4q7lskbwrq4hk7v3ngosrazuwiioaufsml@qckippjlrtvb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL3PR11MB6482:EE_
x-ms-office365-filtering-correlation-id: 7d5b2dfc-2245-452c-35cd-08dbe42a7c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iKyudt06o/zyMdLtFn9Rhx8ACPFMikvJm1F4VrYoB6uhFXiGiDa7pBawRAYDauXWwljiy4Iv3OX7VgcyU0SR9x9/nwNylK1XDZy//J3n5/OmmE3zhicUQgJxkpwsm6DNykimwGjoZv0MSgVXzYrn2l8R0EH+0LDolhBT+628w3+6PshmoS6MH0uLLh1vnDGQFjgBA4bcdF/WW7v7egDeqSy71jru0K6ZeUrwvC+5CrBCciHogwozIGGiPJXdEwkurAnfOpQK8Vdvnc/Gc8XMsNTBj7XFH9oX4oZuShAWAyhUj7mqE1UiMlSSK5LdGZrIexlMiw4QtPPIpV8uwY8Z8UgKYmG9IVh28oDKj81QwRbnDp6fT3Y+lXJh1yT/ikmHqre47fVYRVXqBTSpUw2nQk7aL2Sf5XQEEIfrxOBi3m+SMss/gdJ11dFxcLFH3IrMzk1Bgqu/V2GLViqR+os/xpzKl+4YHJjF9an9qyWMqN1nKBfbK+nHOOvxZqqIS5xD/QuJ/VYPMf96yo7syYKAtub7uC3FPeOoNHaQfRc2SxC7QhFDCi1ed65cc+RU8gQlrMDwJB9oQZzfFnkSNvCtySOYWh4IbmtGKWkaRHx+/dqIfVUCUm4JzFx9mmw3gZZ1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38100700002)(6636002)(316002)(86362001)(33656002)(110136005)(76116006)(66446008)(66476007)(66556008)(66946007)(82960400001)(122000001)(64756008)(478600001)(52536014)(5660300002)(2906002)(26005)(9686003)(7696005)(6506007)(53546011)(41300700001)(8936002)(8676002)(71200400001)(83380400001)(4326008)(55236004)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sIpvkR6Y3UmeoD6wgNuZiHu+nkDFN36TDbu+VoMQkLl/kzpC8fxaGUmCY9qS?=
 =?us-ascii?Q?0I9m7AwyzmWhiDzPl1i9rWRb9Xdr9VOwysL/cJpXLpEIewTDv6VSbErkms3/?=
 =?us-ascii?Q?63KWPaH/nzQYRQy8m12/YBxEgn8pHPpQoRwfSzOO/Ud63yq25lCVHMCpR0qW?=
 =?us-ascii?Q?OPmG6CTBNrEdfoYQogLVl0003pIgQ3NGhAPZLUZ6C2M+nX2y/Xv3gCA4Uy8Q?=
 =?us-ascii?Q?yp7zpJKE/kPYxjuHzGn+EvesMFlAQXo8DYYbYe4poC4TsiBUuWDj/hSWtxP6?=
 =?us-ascii?Q?AOaCpTM7TDdGtzWVNNfzuGBRZl+7k7YMXNimzOI5b0/lHTb65kAjEYw9CqPv?=
 =?us-ascii?Q?tRGYLwgJw+nHuOf0rgYSVkyj9HTl7qtS0eyk4gNwU43f7rUWgPnh8icGEgsz?=
 =?us-ascii?Q?NwspNLdlKnUzn5K7W3QP0LINwt8NnSeMx458b7UXIONnbAPDan89MfX0CnGz?=
 =?us-ascii?Q?k1zFPLG9t6qqcU6p0d4D5b+/dW4R9/JKlrybNqvAJ5Y+KY0bDRy7cPmMppp/?=
 =?us-ascii?Q?iOA62IETYZbuUZWLphZDNoXGLX/FZFkEbTVt2IAaWBOmF0GWtVxAhptCrlhM?=
 =?us-ascii?Q?jOIKqs82v2T3HB+NLlqIm+tDrFFldRMnF1XgCRx5CCRgiOj+6804fhwCkGqe?=
 =?us-ascii?Q?vHEPeyhvVzYC+zJ/UswvbNkMU0m2q+sbu67dy7nUuypAibOyFos6dB0LBrPC?=
 =?us-ascii?Q?A3w2tJoXERBR9PJvOzkdj1hQz2iX0qJtb0kz6olvcYYWXRJ9jEneQyIMNf05?=
 =?us-ascii?Q?6cBc5OTvdwJUVVWfacEO1/H67PohxCkIbr89kr8kAGS89IoMyCCByx3pxD5l?=
 =?us-ascii?Q?zXPuK/KqOFyFOVKGzjVhDYLoS13PB0uP/lDOZ3Q94eEOpA9wPtVBWNoZlVuH?=
 =?us-ascii?Q?aiGpGX/rGUuptMHodTj/s1eSyCvNGpLVGjjHJAlFQmiPP/OqSrwx2M0BFc8y?=
 =?us-ascii?Q?nUef8j5UZehk9Rkz8bWPgQazXSehgZZZRwrhLp3ZdzylHqL3xhgisFOyx+FC?=
 =?us-ascii?Q?RjxOkHbBzA+NBx2L/xihWc10aBte1DZfIuCF3AWcOdys2y0UzdaZtBee+u5T?=
 =?us-ascii?Q?NRUij37jVGMl+9aMEfdLkTEmBNyfhcWIn47V6v7NuIo3M6f2p9lwixIsDS0T?=
 =?us-ascii?Q?wnOf4PKE3ahQy4oocyDc7iyr56LXU35sj/5p2MSQB2GBWEn+e4/JAWY11Bam?=
 =?us-ascii?Q?rvmcmcpPiO6ahHlwEbIVsSkQxcR85+JNdEE1cnjPMHdxrd3o3JEyg/O2gjUH?=
 =?us-ascii?Q?0jyMdXzAmygMUtXo93ENCBjVlU4/OCDtpD7GDopbbHhovu9121Do+9AUSxPU?=
 =?us-ascii?Q?5RruCOMevAzgrrYX6qjf4KcqkiZrIsFAsdA9r7AY4mT9p6nUb+4itT3qTxl4?=
 =?us-ascii?Q?oP36rtCuenWvJSPNmRUqNm7/aqQUQT2qaGH6jXmsGZ9yxneEAJguPwt6qzY1?=
 =?us-ascii?Q?/4ENFufXg8JLj+/uGTroDChUlj0GMeC6KMXgHKtOsSlDfVk7WXX1cTkiAiLZ?=
 =?us-ascii?Q?GswHzFAFXbzZmFolp+qjbC7YuNv5t+LejTSmJSzaZZxO0FMmnofOQJvnl2OG?=
 =?us-ascii?Q?n3Hm8ejB+cOdeEmvJtcrxhFkFrQzohUGu1zZHZse?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5b2dfc-2245-452c-35cd-08dbe42a7c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 09:25:32.7927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PnqjjHvQ9SmoRju5nNPQBkdfUoT6LTVoAtc7TUjzl0LfNIcBDoKIzBiNQ2N9gVFsXZn2zJBtpcxIkUNJSYOoByMX3pnWmO8L4d5ZiHnZrbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6482
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, November 8, 2023 9:26 PM
> To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ats-m: Expose uid for ATS-M vi=
a
> sysfs
>=20
> On Wed, Nov 08, 2023 at 03:07:45PM +0100, Michal Wajdeczko wrote:
> >
> >
> >On 08.11.2023 14:54, Tejas Upadhyay wrote:
> >> This patch exports uid to the userspace via sysfs.
> >> For example, uid can be read by:
> >> cat /sys/class/drm/cardX/device/csc_unique_id
> >>
> >> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> >>  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> >>  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> >> drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
> >>  drivers/gpu/drm/xe/xe_pci.c          |  3 +++
> >>  5 files changed, 42 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> >> b/drivers/gpu/drm/xe/regs/xe_regs.h
> >> index a646d13af03a..1b8de9b8daf1 100644
> >> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> >> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> >> @@ -70,6 +70,9 @@
> >>  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> >>  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> >>
> >> +#define DEVUID_LWORD				XE_REG(0x102008)
> >> +#define DEVUID_HWORD				XE_REG(0x10200C)
> >> +
> >>  #define GGC					XE_REG(0x108040)
> >>  #define   GMS_MASK				REG_GENMASK(15, 8)
> >>  #define   GGMS_MASK				REG_GENMASK(7, 6)
> >> diff --git a/drivers/gpu/drm/xe/xe_device.c
> >> b/drivers/gpu/drm/xe/xe_device.c index 515cdf599fab..266e0d5d7159
> >> 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.c
> >> +++ b/drivers/gpu/drm/xe/xe_device.c
> >> @@ -344,6 +344,15 @@ static void xe_device_sanitize(struct drm_device
> *drm, void *arg)
> >>  		xe_gt_sanitize(gt);
> >>  }
> >>
> >> +static void xe_read_dev_uid(struct xe_device *xe) {
> >> +	if (xe->info.has_uid) {
> >> +		struct xe_gt *mmio =3D xe_root_mmio_gt(xe);
> >> +
> >> +		xe->info.uid  =3D xe_mmio_read64_2x32(mmio,
> DEVUID_LWORD);
> >> +	}
> >> +}
> >> +
> >>  int xe_device_probe(struct xe_device *xe)  {
> >>  	struct xe_tile *tile;
> >> @@ -368,6 +377,8 @@ int xe_device_probe(struct xe_device *xe)
> >>  	if (err)
> >>  		return err;
> >>
> >> +	xe_read_dev_uid(xe);
> >
> >as this function updates xe->info then maybe it should be a part of
> >xe_info_init() ?
>=20
> or not update info at all

It cant be done, as I think we need MMIO to get initialized before we read =
those piece of regs. So xe_device_probe below mmio init looks to be right s=
pot.

>=20
> >
> >> +
> >>  	err =3D drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> >>  	if (err)
> >>  		return err;
> >> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> index 99113a5a2b84..66f69eada76f 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >> @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev,
> >> struct device_attribute *attr,
> >>
> >>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> >>
> >> +static ssize_t csc_unique_id_show(struct device *dev,
> >> +				  struct device_attribute *attr,
> >> +				  char *buf)
> >> +{
> >> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> >> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> >> +
> >> +	return sysfs_emit(buf, "%llx\n", xe->info.uid);
> >
> >%#llx
> >
> >otherwise there will be no 0x prefix so could be treated as decimal
> >
> >> +}
> >> +
> >> +static DEVICE_ATTR_RO(csc_unique_id);
> >
> >what's "csc" ?
> >
> >in patch you use different names:
> > - csc_unique_id
> > - UID
> > - devuid
>=20
> Agreed. Besides that, the documentation and commit message need to
> answer the *why*, not only how.
>=20
> Why is this being exported, and what's userspace supposed to do with it.
> Btw, what's the accompanying userspace to use it.
>=20
> Why is this in sysfs rather than a query? Is this something to be used by=
 a
> sysadmin for something rather than the app using the device?
>=20
> Why is this special to ats-m? Bspec shows nothing for the register you ar=
e
> adding.
>=20
> Lucas De Marchi

Ok, agreed, I can add more information in commit message about this as well=
 as make consistent naming.

Thanks,
Tejas
>=20
> >
> >
> >> +
> >>  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> >> {
> >>  	struct xe_device *xe =3D arg;
> >>
> >>  	sysfs_remove_file(&xe->drm.dev->kobj,
> >> &dev_attr_vram_d3cold_threshold.attr);
> >> +	sysfs_remove_file(&xe->drm.dev->kobj,
> >> +&dev_attr_csc_unique_id.attr);
> >>  }
> >>
> >>  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14 @@
> >> void xe_device_sysfs_init(struct xe_device *xe)
> >>  		return;
> >>  	}
> >>
> >> +	if (xe->info.has_uid) {
> >> +		ret =3D sysfs_create_file(&dev->kobj,
> &dev_attr_csc_unique_id.attr);
> >> +		if (ret) {
> >> +			drm_warn(&xe->drm, "UID sysfs setup failed\n");
> >
> >if you really want to print warn then maybe also include %pe to help
> >diagnose why it failed
> >
> >> +			return;
> >> +		}
> >> +	}
> >> +
> >>  	ret =3D drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
> xe);
> >>  	if (ret)
> >>  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> diff
> >> --git a/drivers/gpu/drm/xe/xe_device_types.h
> >> b/drivers/gpu/drm/xe/xe_device_types.h
> >> index 4119ef03fb7e..1cc8488f8c86 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -238,6 +238,8 @@ struct xe_device {
> >>  		u8 vm_max_level;
> >>  		/** @va_bits: Maximum bits of a virtual address */
> >>  		u8 va_bits;
> >> +		/** @uid: device uid, used for generating uuid */
> >> +		u64 uid;
> >>
> >>  		/** @is_dgfx: is discrete device */
> >>  		u8 is_dgfx:1;
> >> @@ -261,6 +263,8 @@ struct xe_device {
> >>  		u8 supports_mmio_ext:1;
> >>  		/** @has_heci_gscfi: device has heci gscfi */
> >>  		u8 has_heci_gscfi:1;
> >> +		/** @has_uid: device has uid, used for generating uuid */
> >> +		u8 has_uid:1;
> >
> >IMO introduction of has_uid capability flag should be done in separate
> >patch than sysfs and uid changes
> >
> >>
> >>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >>  		struct {
> >> diff --git a/drivers/gpu/drm/xe/xe_pci.c
> >> b/drivers/gpu/drm/xe/xe_pci.c index 2fae45b9d88e..4d91ad049e59
> 100644
> >> --- a/drivers/gpu/drm/xe/xe_pci.c
> >> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >> @@ -60,6 +60,7 @@ struct xe_device_desc {
> >>  	u8 has_heci_gscfi:1;
> >>
> >>  	u8 has_llc:1;
> >> +	u8 has_uid;
> >>  	u8 bypass_mtcfg:1;
> >>  	u8 supports_mmio_ext:1;
> >>  };
> >> @@ -298,6 +299,7 @@ static const struct xe_device_desc ats_m_desc =3D =
{
> >>
> >>  	DG2_FEATURES,
> >>  	.has_display =3D false,
> >> +	.has_uid =3D true,
> >>  };
> >>
> >>  static const struct xe_device_desc dg2_desc =3D { @@ -577,6 +579,7 @@
> >> static int xe_info_init(struct xe_device *xe,
> >>  	xe->info.graphics_name =3D graphics_desc->name;
> >>  	xe->info.media_name =3D media_desc ? media_desc->name : "none";
> >>  	xe->info.has_llc =3D desc->has_llc;
> >> +	xe->info.has_uid =3D desc->has_uid;
> >>  	xe->info.bypass_mtcfg =3D desc->bypass_mtcfg;
> >>  	xe->info.supports_mmio_ext =3D desc->supports_mmio_ext;
> >>  	xe->info.tile_mmio_ext_size =3D graphics_desc->tile_mmio_ext_size;
