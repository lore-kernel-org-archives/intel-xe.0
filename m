Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C63C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 04:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C2710E060;
	Fri, 19 May 2023 04:58:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F96D10E060
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 04:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684472309; x=1716008309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aJKyQbFI+GekdKP58LGG65fJO5J6kPvBaX1oa+vzw9c=;
 b=NhXGAu5Nldm4ZrFt4J840J8sN1ZoXIvSUM6Kq5NEbPAW1EoCAQ01tZdC
 7buuNfzgnBwWIKFWasceSdoN7E4lSnh9BhviPpErRRM0aLt/vqyfNNkFZ
 dvHWZiqOFJFL1KHJkrvoYnHOA0i9NBfjyRbH7cbeD/f/n2zwa22HzG4iX
 ZzeZHr2pI9ykz74q41UmKMFv1gMMtAna6RQKWyjOiLOhjT24i1X9w+0fF
 db2JUOTRpzRbibMp/O2iQei8K6rUGMQKegUeYFIzoBr0UVuDkwMjdMrZN
 HUGvH7waNXAhG8yhN63IqIk7GC7nJGA3UbrhFJfQc6xBdUKPmg3BOj1+Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="417973860"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="417973860"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 21:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="735369096"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="735369096"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 18 May 2023 21:58:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 21:58:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 21:58:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 21:58:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 21:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngLSPTRDNCA8ykFuQgA7tVRx08Cg7NWTMwj3ttYe8AzumNGJmyiZWp7QHQ7oDGyHIisd0ByFFc22FYgpzBSsk3sLTbe6ypq2k0zg7e4CxbOlDRS5jjiYPLmno7Hu3BJsJZCX2y/l0AVZRMw0yhV2EiWkGo90tMsw3woEnHWyAfzBU5LFuxvYDxFxsKdDyA9pabydSkxK3WfyI/qfjtNhvgfPjst6G3+v9jYOFjl1qqH+/svUxDj6ZXFNHj55TNeSMDa1j8SXtSNM8tkjbaN9QfLo7i5gmCmUnOWuXCFC6dgzBb8fsgH2Jf4FyLWpygGstLcNDfe8Un3C7T9g0j6TTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYb6I+ETtUWYhRZtqE+3G1IdzagE794k7yciLx1g7Ww=;
 b=GE2BQG+WX2jpVOKqB/XDHHA/P6E7DnXGoLYMZqvx6wPS+Zmb8NNMdxJ9+5QTV+FEfGkt6+FAnThZ1apjEYoUjo0mJhtlkhv2kd1US/PAoG8nL4dMOnXTDEmM0y8AGH8h8EOGSl5DTXI2P0ioE/ag3g2BMOvyXhY8ZugHOogVCQsFKgVvC2EbyVJyHPnWKzOe5CqIB16WcKTZ0rUcM282VgDpf5U+n5Sy49/xl9E/HmtsJ8c2Zhm8+dlS7U9G3ARzZnhnc3xHv/nRWwv6EbjAE75F8HpXkSjMEHjrePulJHocVmCsP9Oq9CdZwwYvxDI9PBsNSZxwyzpJpq6W5O5lPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 04:58:23 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%3]) with mapi id 15.20.6411.017; Fri, 19 May 2023
 04:58:22 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded pcie
 parent bridge
Thread-Index: AQHZiWaH8HSiXGAqsk+DpGWAyki5Na9gRL2AgADCqcA=
Date: Fri, 19 May 2023 04:58:22 +0000
Message-ID: <CY5PR11MB62114CA59A4467B41F30FB4E957C9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230518085259.4083944-1-anshuman.gupta@intel.com>
 <ZGZcO/R7yYtIQjOj@rdvivi-mobl4>
In-Reply-To: <ZGZcO/R7yYtIQjOj@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA0PR11MB4640:EE_
x-ms-office365-filtering-correlation-id: 1ac4f223-a69e-41ba-44b1-08db5825ac0f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9KZ1uio/PaUT9diNUMqUt2VE8ODluSq8hA3/+g9Bve26gNGZHXhyvJOUheoCX8Y2zhKtFZRUgbdejgYui1LLx82ypaUuRuYnPEedlnih+c/1CYWckUWE5oqdITWAtnGkTgQtQJIUIZl+6OQQKzw7TAvYkYQ5zjWNKCSNpk3PuVTfIYes6ft0TtYK8q409f6obEByrmzbKO23a0zWATCsFEOkMy/wOMbE+6AbDtdD4XTMRhKZpfivlNfniBAcTV/Lmfgs6VxoInGp8umsn5llKqwfEbZL8mADLFgiv8ggQNCqAzotF/l0S+im9OZbQQW9fg+m3VhopXx0faz4XVVGvquOZJBVaLVt5xAr9yL0STNGIR9jVUy77q1nT7RCHlYnzGV6yh5bSDWxb9T00LVeFUG5M2JhN+g5hKCNzGRAIJj5xS6TPr+Jf0HVp2xNTeTIapqNLzghHHTkNn3ivwZwdSC1lkbyvQerbQJPf58tmtBg5v5AixtqJKvSVuxbeONnhPEUnrIExaqxo4/Vhmud/H/e79Qgx9wlv8YWvxVehg4lKL4uKqQeZvbgUMwBpfYJVIVNRraoIBDwVczx0aJ3F4HrkW1We+q5+PfNgTuGKjyxcCZ/++InICYo1ciDPUHG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(7696005)(71200400001)(41300700001)(9686003)(53546011)(38100700002)(107886003)(26005)(6506007)(52536014)(5660300002)(83380400001)(186003)(38070700005)(2906002)(33656002)(86362001)(122000001)(8676002)(8936002)(55016003)(478600001)(82960400001)(76116006)(66446008)(6916009)(4326008)(64756008)(66946007)(66556008)(54906003)(66476007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vf0KopBJ4LeyYmXwjuawSi9s9BcsXDgxKHLXOEHiyKhooCIt+ZIGWOOhDQsv?=
 =?us-ascii?Q?S/Un/OTbTwsoA9ZpauBREhFsumVzt1hwkZQclcjGmMBybMLcH7rVDZydSUGx?=
 =?us-ascii?Q?A3cWMEvUI8lPV7mhddZbZtQABVxbkJwCrDR11V8tcXUKjHN+js7iqiEaWWXP?=
 =?us-ascii?Q?48LUi/tnh2RGGg82h+gsSqoAl6uk43aHUlLvfL3flEakQKDPH/f/bpqpD7o9?=
 =?us-ascii?Q?x/5eQ8K23tygVLZQNYNyqr+bNS9kf/Cth64oPp4qZTKPa4qwQRUU0YpsdRB5?=
 =?us-ascii?Q?it535lPC0rsrwHHi96EJJGRElF4+YcPQCNAMlXiLbnWSTeJQa7iGoQSntWRX?=
 =?us-ascii?Q?kXAYTJ7edUCoWOVb6QJS3RzTWnwt+yfeBtLcnXfNqfgrF0LhTmACpOWxwK3o?=
 =?us-ascii?Q?IVdFw0os6gayNC/fF1T2Xpty5bFQtQCld8POWx1eNj5E7ayMfJ2+nlNSkO9Y?=
 =?us-ascii?Q?7KQckZ+v6hhZCizaT/jJeCFzux7lrukQliL0zE1voEJSZv2We2tgO3/lElVD?=
 =?us-ascii?Q?d06EBPuS+H8oMFY9BZ41i10BleWKId9GT1k5WKmp5/lIT+jNuHrpzar3XyN1?=
 =?us-ascii?Q?F78XOOI/pXDH4Njw4TMtWwc/Hov7GR4bwa447CLTDhDdCOdw1FD4JID4VNlG?=
 =?us-ascii?Q?9/2HOBrmNaumu1jkqhZFiTSNL2lFH/7YagRF56HZ+BdJvR7c1A26MH0nGrNV?=
 =?us-ascii?Q?fRQQuzYMK6e/IGZLRZvdJ9QK5DxN87m2sULMYXOazYXxQIQV1axkTm5qEtg9?=
 =?us-ascii?Q?wYv+KOiieL7mixwljNC+WRaI/WvKBNQmiLg1MQAN5xSdWbWTftYd4IsMcBbt?=
 =?us-ascii?Q?rqIBO4LWG6vbLUOY3itDBkaAwTS6MCn6qcGjmxeedQCguPylsTfPx7D8G+aN?=
 =?us-ascii?Q?lNFRGRFqucS5hnkYzyYhEHMiGvSl2FrkYWLnXcnNfo+WA+pcBtBWyi/G/62G?=
 =?us-ascii?Q?YEqg1xE13aizvK7xcH2eKMGsdzcwXKlVqWaoCQgYzfjF1wSPf8DHrgRmK+uI?=
 =?us-ascii?Q?sab1/0vdm+bOlQRGomQrBQvGu1oE50ylcfOCCcmxLsHjzakXCY2zwSB4CU6f?=
 =?us-ascii?Q?rHZlosjn3E+L0kTzOeT45wuKDWFeUWQl0ebUaX2HC7JQFerBYNNkVv12M33R?=
 =?us-ascii?Q?OqJ8aazvzgyaFIpUvHiMjE7ByfuQwjtwyOavox6Dnyz3fhg82eAFqZLp35sZ?=
 =?us-ascii?Q?rlvSaIJn7cFr/HaNTsow9cr4tDysMJT3zrFINdSr9fp+DHfPTgJd4LrQ1E8F?=
 =?us-ascii?Q?ycZ1Uiou15w9FXns2SsG272iFuGVnNu5H9ui3Fa3z/SEnneQJmBSGh5vhZRJ?=
 =?us-ascii?Q?RN1UP+/zqDa67MgWiRlnC7Xhsi0pmKKTbku2IL0t854VbeS6mt0hX1ZWdcyw?=
 =?us-ascii?Q?1z8b1DlpU9Z3tX+BKUy24buiqLCzQDUfFDdyVzMbqAyPBDl12sRyDK8NUaTo?=
 =?us-ascii?Q?Uz6XpcVlCh18NagQuopaK6nQSbL4xc21fFhbkjuRb1yDVcpiDhZIO62CgFEz?=
 =?us-ascii?Q?t2VY0s5PKg6JYR+PBFSf0QoZQiGvcIWgo9kPZfUpEr8y9o3xIJTwDjlzSicc?=
 =?us-ascii?Q?WtUGwbS7f2GWbq/eWIW2YIw8/pX1797w5bfLKWa2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac4f223-a69e-41ba-44b1-08db5825ac0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 04:58:22.6665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eFV0s+G7Wy2iYIrEgyLBN/npMGBn4boO6W81HwjhQArq9gyHpZ8uGp+42s5q2q3U+m5NWtgAmLrVx9asn8vGdhjeEQtfZS06EO0Q4FHVLL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: Thursday, May 18, 2023 10:41 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>;=
 Vivi,
> Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-xe] [PATCH v3] drm/xe/pm: Disable PM on unbounded
> pcie parent bridge
>=20
> On Thu, May 18, 2023 at 02:22:59PM +0530, Anshuman Gupta wrote:
> > Intel Discrete GFX cards gfx may have multiple PCIe endpoints, they
> > connects to root port via pcie upstream switch port(USP) and virtual
> > pcie switch port(VSP), sometimes VSP pcie devices doesn't bind to
> > pcieport driver. Without pcieport driver, pcie PM comes without any
> > warranty and with unbounded VSP gfx card won't transition to low power
> > pcie device and link state therefore assert dev_warn on unbounded VSP
> > and disable xe driver PM support.
> >
> > v2:
> > - Disable Xe PCI PM support. [Rodrigo]
> > v3:
> > - Changed subject and Rebase.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index e789a50a1310..e09d76b7755a 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -603,6 +603,19 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >  	pci_set_drvdata(pdev, NULL);
> >  }
> >
> > +static void xe_pci_unbounded_bridge_disable_pm(struct pci_dev *pdev)
> > +{
> > +	struct pci_dev *bridge =3D pci_upstream_bridge(pdev);
> > +
> > +	if (!bridge)
> > +		return;
> > +
> > +	if (!bridge->driver) {
> > +		dev_warn(&pdev->dev, "unbounded parent pci bridge,
> device won't support any PM support.\n");
> > +		pdev->driver->driver.pm =3D NULL;
> > +	}
> > +}
>=20
> what about having this function as part of xe_pm.c and then call it
> xe_pm_assert_bounded_bridge() ?!
Thanks for review comment.
AFAIU  this is pci related stuff so I have kept in to this file.
If it is ok to call  pci_upstream_bridge() in xe_pm.c ,  I will move this t=
o xe_pm.c
>=20
> > +
> >  static int xe_pci_probe(struct pci_dev *pdev, const struct
> > pci_device_id *ent)  {
> >  	const struct xe_device_desc *desc =3D (const void *)ent->driver_data;
> > @@ -628,10 +641,13 @@ static int xe_pci_probe(struct pci_dev *pdev,
> const struct pci_device_id *ent)
> >  		return -ENODEV;
> >  	}
> >
> > +
> >  	err =3D xe_display_driver_probe_defer(pdev);
> >  	if (err)
> >  		return err;
> >
> > +	xe_pci_unbounded_bridge_disable_pm(pdev);
>=20
> Probably the safest place to call this is at xe_register_pci_driver right=
 before
> registering it, no?!
> possible?
We need instance of pci_dev pdev to get the bridge device, xe_register_pci_=
driver does not have pdev.
xe_register_pci_driver will not be called per pcie device.
Br,
Anshuman
>=20
> > +
> >  	xe =3D xe_device_create(pdev, ent);
> >  	if (IS_ERR(xe))
> >  		return PTR_ERR(xe);
> > --
> > 2.38.0
> >
