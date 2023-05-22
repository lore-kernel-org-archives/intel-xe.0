Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75398C77B75
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 16:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9D610E36F;
	Mon, 22 May 2023 16:31:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5840310E367
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684773097; x=1716309097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2o4GYaEG2gMReinOD4crVbmoW6YS7wwlJIlCBKlOoSA=;
 b=FEYKUWEsGANqsa1eE5qEXVBWKxcZIIcc7xDJU+A0hi99QIqGfu+MgndE
 Kx33CXzAfkBgaiKjM8UusOLvPpfGd7WGqNM4355Wla3dh+Z0Lt3QFr5Fi
 gbHKKZcv2mdk+oPF1JkgFeRPdcZ7lqumGJotj6s5nT56LmqSnO3lDEw9P
 jFLHFJPU9GMMn6L3S0S15QjcWyz0Ts9bI/s0jcJTB33RRqCmt8PbvsU1Q
 h18Bna+xcghfeCCtvr322TS3+/PlAX3M+yV/oBxLE3JXzKds8PK+mpY+r
 MKPW40H3vi+UxRH0OAHtpajHg74kwHkb1K2XH/YiW2WLeUSD33gHCiIfo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="381206037"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="381206037"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 09:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="877814500"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="877814500"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 22 May 2023 09:28:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 09:28:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 09:28:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 09:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RItMYONNOG7Mls5dHJXk7nKdq2DRzNvLiNTrvSLgYCkJxhhielwGvlWczxHoHrybzuk63vlFe0QAZ5QAPaGEpKpT/QWV+6NEwwS1dqRFOjIKPV4B9CryK5LX+yhGVvq04IhwYAI5x+til6Lazy1QTxVJP005+hcuhGDJl3nm2+Z+L3BW8fyDOTOSVu27vLoGDCbhkOgBAtCqFOQEWDtU+VX0ZXxbd6aHIFX6cWMjU/mKd1dBAxRPxnTmansr41oLXpGVoZSqqlsf06BdEot9agp74h+7f/i1s9gxd8TUoiM7begSgQyuX2f6EIxMXgHdnUlKf6i+T2aVfj5f+4ujKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDHxzq53yigD1Jw1vLWBAhMIo3L5tIrC2/XB7hLCJjI=;
 b=QpvjsMmF4N41L4oKNhUa2X4M4G6Nn1Ko8quWBTKnH21TJv7pK9BpSeWIb8nA5jCcxpI/TfmHSfUSkVKoegVh6HEdpLWl6cZImqccxjh0i22pLvOO7T6jpjIA/gsS7DvI3vgFUmnNURyom2P9RGcEDpxBf1/jn2br28vtRBOHvHVPSRqwtohhzFMJ7FnvxF00ntgFPihJjIgQ5SzLNv/d26EBTWrNWQ76U8Cr1TVBUyfzq85lDvPdIjTlD4WvZADrHz2GaxvM9aGyz1phaPkGKCHf4bfLpvYFuFp80OZqLd8btyw72gc8W4nCCfNxjCAHCm+FjzyTudi9K22XIRXSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 16:28:21 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%3]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 16:28:21 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded pcie
 parent bridge
Thread-Index: AQHZiWaH8HSiXGAqsk+DpGWAyki5Na9gRL2AgADCqcCABXkfUA==
Date: Mon, 22 May 2023 16:28:20 +0000
Message-ID: <CY5PR11MB62114870D153E9E36BB3035A95439@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230518085259.4083944-1-anshuman.gupta@intel.com>
 <ZGZcO/R7yYtIQjOj@rdvivi-mobl4>
 <CY5PR11MB62114CA59A4467B41F30FB4E957C9@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB62114CA59A4467B41F30FB4E957C9@CY5PR11MB6211.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB6447:EE_
x-ms-office365-filtering-correlation-id: 9d6db0ae-d32d-4e40-0c9b-08db5ae18e99
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qoOOP9/T0A+bcOKG2HZDbdzrgK71pkgTcRlR4sLoAfOjoupsRq8GMxbY4wpVpV8ued/ed5RIF0ECsC/lpVBxMdeEoDoNrbRPr6/qwRDKLLntEepZPLp96FU8bR6bX7CqwlgEdxEz5x27h0d4usv6a00iteab6Y9k9CoFRq1GkoWmVNekO71sxXsLit+cL6MOYfIpG6kWV5OxfhWLbD0igzrpMpTkFnTUYWH9xZRvPitjKmNheNxBLUcdK8ZKd+HLwbReVfhuHK+iwM0qQbNzx1OAIrQTY5UgBeJIluBtbkm+xKy1HV4axNMRQqHN98XJRL0xhvVaKxJ6RPV7QF0jqZvQRtyDigSHI345juoAXGU9Ur23jirAXTOXPKjF5WitKeH/On/9m1sum7B3ENMenD3CD4y9KPERmmr34Ol3sK192qPV88jIIxu407uuKukihtCYZqq9pHp7epdEDdWgkeuW+LgZmKGuLeYHj9/uvyAWD8yn1JIMszpOlOiKSgXYZg5Xj+7FD6lc/cerQe8Tf7VmHSgtqQeNQ4eiCaAXflh3uxojT+zLHOeIufmjJpXO/WNq1kA+ITwtrwQTi1Xk8bk2lEODB7s22ne39G98jbxVRT79zKr+yIkGpA4i/US7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199021)(52536014)(5660300002)(8676002)(8936002)(33656002)(83380400001)(2906002)(82960400001)(186003)(122000001)(38100700002)(38070700005)(86362001)(55016003)(107886003)(6506007)(26005)(9686003)(53546011)(54906003)(71200400001)(316002)(478600001)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(76116006)(66946007)(7696005)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?490Yx2XAZbyX1cyT+MrAYCVbuLsZHO2rWE/y0qFws48baUV69VhmHaNBGlJq?=
 =?us-ascii?Q?vKN8iTx8krRbp2dFRvpDJnHak9ljIn9YThu9AlyFn5fBzswsO63Jgl27Cy5P?=
 =?us-ascii?Q?yT1G/7H5fjD3XO+5UE5jPiRcO/L/7P1Sx0y/RbSTgvE7lMHyBBR0ce4maRDl?=
 =?us-ascii?Q?9PGjmRXP2/B9jP/0xjqPiymK0N9+LvWwSOljPyurGvhzElX2zA8jI6VNQ455?=
 =?us-ascii?Q?41dAvrMREhFMcdU2CmQe6Q/SrEukcrFKcduCzKw8rqqofyzfIQQBmdzpLImT?=
 =?us-ascii?Q?nPykYVnAbc0bzoH3s8eDDnFHJEaaihC+vThazLhFNxBRAtgAZ0F2HzB+89j9?=
 =?us-ascii?Q?NcIuGFpk0xXajYv3zTSm9woSvxUjSP4OJ6cgS7MSCve6WAuzLKnRVR1Vhe3d?=
 =?us-ascii?Q?6vO+9JfNDssdTq74zPtY3A/SflQMiuhOduUmS0QAQHP2Lp+DArGYPCweeDNU?=
 =?us-ascii?Q?C1PaSkkME35fPt6c/LVaBwV53efY/avevgZKFyTPfy0x/50urwM8P++tNlmK?=
 =?us-ascii?Q?S+ke2rpaSCD+sZgBIcw8nFJPptGylpbySVovw0i8bCXqYJwuNVe5GYPafKl6?=
 =?us-ascii?Q?B5hmCXd9DBKYXg/d9iaQRpkYozeuzZggi2OgqetpaoUf1XR/jk8d0WAvLcqD?=
 =?us-ascii?Q?fJp0lNM1bt7ncmaYbqk9c5rOuEmbIuYed6MUsWz0T/Cdxkan9wYRkbCzrYLT?=
 =?us-ascii?Q?fbtdPbSSqoxCC7KI74PSPZRqmYFmZW4OJtNWcwpeywGBwporH5zuUtk/Iky1?=
 =?us-ascii?Q?G0Ze+lQS7FLu3IhgzInPdBd+f6sal9zAwjEpMFLyeb8mckoB5T5t0ZqDzD7u?=
 =?us-ascii?Q?2N3z+zIjf255k9xIxLuTMcOHu4zu9+A4F4xVVMUEuaH8HslMT2bxqVv1/j9p?=
 =?us-ascii?Q?xXimSvu5pvjyLkD1WMaiUlUjdw7XlPiBzDv8UW3TjIPEDKzfl5o9F/ruhiD7?=
 =?us-ascii?Q?h7eUDGhXVrmadpaTEK90QrLcfT6yio7aV3XKN8HtdAJSXs/0Y7CqhjALBn+p?=
 =?us-ascii?Q?wDBTRiibzU9fGWk3Q+DlNaa5gI9nTc9c5/AMLuDhCxIRgQBCLZ7tyfdXAzDR?=
 =?us-ascii?Q?uviDWyCc7de/e4GUZ/KqmB0o0t9iLQRBksFKQ3Msyw35zPssWcHh+HZUNzem?=
 =?us-ascii?Q?Zcn84jH9e6GrI7crXPDLKRUfLOkoZLeI0LXIhU6vtXccvSrv6WJ+pVb75AYf?=
 =?us-ascii?Q?RgO45Ftv/0gV+YIuYi9tifioUtBWvIOWEK+4qIxtI1dz8WQj1+1sIC5dBmT9?=
 =?us-ascii?Q?K/xbzin+pS0H7UPycj1VZoeziedARyqcnxtSfy5qGpnFTcBtzF0upmRht+70?=
 =?us-ascii?Q?danE4bg7rXeDySvGwsTBLlLkOyGBd3vXP+2IyKeuwmGXWye+P1eAkhGKT4vX?=
 =?us-ascii?Q?yN5EXXNpjj1AJ80y4Gvohv52Q2FG4SsVJaHymPnozkxrgta91eVTzIsYPqIl?=
 =?us-ascii?Q?gVnxWvzj0bsHlOVDPGZH5MN3oivpmqt3W1gY8TcMbsvjEWyYuvbPNqKlC/Ci?=
 =?us-ascii?Q?tuLC6VF6ayM835yj2GxrQI/p+xY+Ah2Ogsdw3+uOydK2zSxbTr1+Dshvg4A9?=
 =?us-ascii?Q?vtQiqsfNB8LXPyK+K5C0rasYa7eGoeLaLPyYIhf1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6db0ae-d32d-4e40-0c9b-08db5ae18e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 16:28:20.9465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjTZB7ZAOL7tbtNR5khaJe9cacHJnl/AhHeyfDQADa7oMoADzv+9mqvUzt5ERs3Por2UUfUEupePEC5MyWJw+Hk+YB08wmyr9/iN/wWww8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded pcie
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Gupta, Anshuman
> Sent: Friday, May 19, 2023 10:28 AM
> To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Cc: intel-xe@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>;=
 Vivi,
> Rodrigo <rodrigo.vivi@intel.com>
> Subject: RE: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded
> pcie parent bridge
>=20
>=20
>=20
> > -----Original Message-----
> > From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > Sent: Thursday, May 18, 2023 10:41 PM
> > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Nikula, Jani
> > <jani.nikula@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded
> > pcie parent bridge
> >
> > On Thu, May 18, 2023 at 02:22:59PM +0530, Anshuman Gupta wrote:
> > > Intel Discrete GFX cards gfx may have multiple PCIe endpoints, they
> > > connects to root port via pcie upstream switch port(USP) and virtual
> > > pcie switch port(VSP), sometimes VSP pcie devices doesn't bind to
> > > pcieport driver. Without pcieport driver, pcie PM comes without any
> > > warranty and with unbounded VSP gfx card won't transition to low
> > > power pcie device and link state therefore assert dev_warn on
> > > unbounded VSP and disable xe driver PM support.
> > >
> > > v2:
> > > - Disable Xe PCI PM support. [Rodrigo]
> > > v3:
> > > - Changed subject and Rebase.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pci.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > b/drivers/gpu/drm/xe/xe_pci.c index e789a50a1310..e09d76b7755a
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -603,6 +603,19 @@ static void xe_pci_remove(struct pci_dev *pdev)
> > >  	pci_set_drvdata(pdev, NULL);
> > >  }
> > >
> >
/snip
> > Probably the safest place to call this is at xe_register_pci_driver
> > right before registering it, no?!
> > possible?
Hi Rodrigo ,
For safety purpose  how about to use device_set_pm_not_required()
I had already tested it locally, above helper removed device PM support.
Br,
Anshuman Gupta.
> We need instance of pci_dev pdev to get the bridge device,
> xe_register_pci_driver does not have pdev.
> xe_register_pci_driver will not be called per pcie device.
> Br,
> Anshuman
> >
> > > +
> > >  	xe =3D xe_device_create(pdev, ent);
> > >  	if (IS_ERR(xe))
> > >  		return PTR_ERR(xe);
> > > --
> > > 2.38.0
> > >
