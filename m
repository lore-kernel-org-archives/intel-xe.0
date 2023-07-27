Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16471C001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 11:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB5910E56D;
	Thu, 27 Jul 2023 11:43:01 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5F710E56D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690458180; x=1721994180;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hZpx0ndDbuMBbEgDYbkT7WIGdNNli4gOllO72x/PTsM=;
 b=NWlMUAVVVoB/ms1yT+7jVE2mogZ7ZgIcTm4rOH7FEwVabFLHLNYXDOIQ
 J7V33Ulc5EpHXF++6ImVvfztaM/6WtcuPMAjO7t/DPzfBAe3fgoZH0l42
 v2WX32803XEnwDs23+IPfUQaMDjbpKj7vi8Vegf6PqpB/htGqhA26ORYa
 8DuCVpSP/xF4WEchG89eYCPy2p/Qissute7Ndavc8sSmxlxdHHlAZJxG9
 GmQuMK74bULsBtHglC4n56ZlPY9hjPSKWK33mrAsFG7jrzwuMsfuqJY0H
 LVb0TamogbunmRpIe7EdkuAxSX7OlFR24Rwy3+aMwaTMvhwMBRCAYGsp9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353183342"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="353183342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 04:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="850809214"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="850809214"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 27 Jul 2023 04:42:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 04:42:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 04:42:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 04:42:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 04:42:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eo/HNFQr2zp/7ZwrhjdQHvQvz1HqF+7O6Ww6XaFqfC4sCMGEbtymEG9dp1by2CxeErt/w0B3dXOTLI9l/CkaESPrkMvu0zAnsOX74D9DCZrbMW4UREggULrp+GTEJ2tT8V/kQkDR8XHniYm12CAQdj+sdeKngj2mBShK9H01CHHuAqC1mtcNGzwFiZVFDD+xVLiosDDNvid126K2qUbPnOou3aMAvxWoKR+LYufYpTEbILCeDqJmogKajzAcNgZxweIFAVI6wuWZW/ZN7y3GvSYUCqy0U35CtUtCC4YReG0NI/cHDgvJB2LI+CJT91/S8t00Gewo9Rd+EAvzrn9E/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MZzZ0h+2cnxYlTI+aserIszX3EnVPiJ8XjCfqp2eFU=;
 b=NsilzaD6vqLmVqra3i9rkhVc51oZn45gblZtqXmOm04zM+sXBcAxkKV7YLyF+e+KcCzkBTIRhqWgN4uSOVPuCeJ0oR/cHAm+6CcNWZs5WGGSooSSypF21m4PZMHPfIoOvxMyktQ8FijSRQutRhG7ZGEOpHDiFIVZ8y1E5Tyv97TIfGLM2E/oLD28mvy2u2yGp/vUfoPohSf7Lg+ASnULcb+/bIgsIhDd3uPuwkT4StXDUHvlSC7b8sef2CO9an0KWJvZEzSDZRg1f543PyLKR3VsLQjK41co28dNRsNlBL73eRLHC21EowDlOQgtyB8H7oDYXiLXmGMTOgShByEFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 27 Jul
 2023 11:42:52 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::18de:a383:8dc0:3cb6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::18de:a383:8dc0:3cb6%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:42:52 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/5] drm/xe: Only set PCI d3cold_allowed when we are
 really allowing.
Thread-Index: AQHZv0UL+jwKv/wP10edBf65q3+rWq/NgE3Q
Date: Thu, 27 Jul 2023 11:42:51 +0000
Message-ID: <CY5PR11MB6211D9E8DB763C0724DAA0B59501A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230725221159.354618-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230725221159.354618-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|IA1PR11MB6417:EE_
x-ms-office365-filtering-correlation-id: ce58d59c-49e0-4c56-fc19-08db8e969c35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z7vyHDT1nCv9E2+wzP6och2QIPzKNL2nbWjFRk2TD8Vu2gUEITmNlgXHodhJvhDxmxwEIqSzoKiX1Sg/palTiKG2kghj+JQn0XOItkDAH+IN/VEoxPqLLd5T3FMvwAsmZh4bRm4NzxFf7XClQ/eJpa/gNFYBJ7GL7bD3X85H597rBz/9iBNPI1eCrK45MEW9iCQOWcLn0PactaUgrN9IokDGX7mwj/2OdHL98pTD+FjWhKdnNEL8EXvG2vQtLe/tTr8QsLsZPMFfmE1nlfyNCs7o5NSse9TNoyami/xxu8PVjg3L4rYFM/lfuokdN38Um/9NwLtFvwzKvzT5p07CADs/inFNxb7gyL1T8Ppf0aoMqf43Ar5CQbY7NFlOACxfbny4wpwmP7nxYy+V/xhmZHV92KqIfY4TIdgNfmQTCAqkXGnRyVNF6fgFC6hGOD63nieFNflJBeJANKnCX71suXqayr1ltBuQQwmrQfWYQpWBT7GdSBNLJ8H13ffjuxLQrUbwd3ZQyecDZ3LEvXFpc9kJDOb0/qVT5/Jhygh3F6HlMf1QPXi9NOD/uPOUnrxvJbXFv9gZZoLpjMhnN5YE2XMgy6yuuB3VX8YX9MImFiU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(2906002)(83380400001)(122000001)(38070700005)(86362001)(82960400001)(33656002)(38100700002)(55016003)(186003)(316002)(66476007)(64756008)(71200400001)(76116006)(66556008)(66946007)(66446008)(110136005)(53546011)(41300700001)(6506007)(26005)(478600001)(9686003)(7696005)(8676002)(8936002)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?89PhlofSjF7xLVnxTLhHBJilJdMw74/hk7tBjsTU3Hgrf/gX35xR2VJh0lpd?=
 =?us-ascii?Q?Ro0KcyhoD8WlefXbrH53GGrtXRzKFlmy+6pKg+j0EspvlSKE4mTlEPrR8wdm?=
 =?us-ascii?Q?GANTjQl5GKykbi6I4CjjPyKyvhwcrAVNfcYwrqMloElVTGlUCAprhEXS2SFF?=
 =?us-ascii?Q?JN+72oFj2UpJraDGFkba9jvTB7SIR+DbQAM4PWBDmjtHgnAjdnjVuP88QwHC?=
 =?us-ascii?Q?BafFkmDUlUVlnJgo8X6jD8ZLwZTXfRlF1qwrli9/aNZ1D5e/N8tOcjjFkwZF?=
 =?us-ascii?Q?opgf+6bMjMsVzX+um6rJHVulRAust88wjg9fNA/cj2dyZmD5Le60jqb2+ZV1?=
 =?us-ascii?Q?h6BKs8GCIGodHrZyQOfVF9JXWrbC1rIlN/q0H8LjN6Tke2X8wJ+eUq8bCXaK?=
 =?us-ascii?Q?rN9FJuW7vuQbUm+Nu+YqpO9aWIqltoXZ3y9WfOKA+zQDcR2sK6jua4QT0x/U?=
 =?us-ascii?Q?DPCe5vdeaV03uX1uTdMWjYoed9gKnubMycuDFRvkzPD0uDptiPa5URHj6zsI?=
 =?us-ascii?Q?xCJOoFeiorhs7EIdzvBBsJrPU3TRPud8OlNXHVR0c818uPMgYURyftsg5qFW?=
 =?us-ascii?Q?N1jWNmhXpoFjudeHMPutt5rbt6d4RUr+VKE91RHBDFPgQA3mlz26SGETE12p?=
 =?us-ascii?Q?HsA5ypk6Vc3DkjyFH5zZzlkZrfTFo+DH4m//FZxkreswxlqzzKYw1Y3bf/6M?=
 =?us-ascii?Q?pVqZAjEdTVZpTc/jHtzXAZjSamXcvtxBxSR4fs/bF0/JaQ1zXcu/zEUOqyia?=
 =?us-ascii?Q?5tgRSs5z271EzEoHQacK6czocjPsp0K8OGbVtkFwRvxgDFehKDYY98IHDgWE?=
 =?us-ascii?Q?PMrPxzuionJ4V9OO6Xz4rtvswpnojqrCBg5NgCREJxzMMlflkgZqRiaWt1DJ?=
 =?us-ascii?Q?S1huBz1yqOOqNMYAEP0kr7PB+K6U0RqCKV0nLxuTujgfYfAg74jBkkU9jt3U?=
 =?us-ascii?Q?vXehWd98gNDBqlV6AeI+PAtcD96R0tjxvEl4dW2x4FSjqvwOg0cay8CopW4L?=
 =?us-ascii?Q?VQs5QkTqjjqbhxgfPQO9lmx4MkUt1mkMmYbGRCO1Hrsx52eoeasC1iohc8Ru?=
 =?us-ascii?Q?uB9pvhmE8pzBIQWfl1Gx9oGFYosDmQ6iDfTmHyerTsCymlwg4cOrS2kTLXVC?=
 =?us-ascii?Q?fDIWMrzc9VWo8IN0ktjuYb9NxcEOg/b7rnCnhmHBiYFB2d9Nz940LK7E6wS7?=
 =?us-ascii?Q?1dcont8Egwz/wWLoxWFAc5n/X4rbEMWDlFBxO7nBg2ViIvZPHHDFqjJtxaTx?=
 =?us-ascii?Q?Rrm6+GtHM7jeI3uXGlEiKHAlRYqRYzaNy8LjEZIiEHPRDw2otH8rT28sq7Jq?=
 =?us-ascii?Q?n+1G/bTADmvtVJmK3L+kkvbyvsh8lDtYKeR0sSUfZa41SFFhtEPeHFfc9SXs?=
 =?us-ascii?Q?6+OKTqtlo8Gclf93208hsboMQjrol3gm4zq138011l9YLfl/1X9SkVHCy1vY?=
 =?us-ascii?Q?vbOtdWmsP9IhZP45Jk3aj7hhQB6g7NRVXC1jBSo8ce5pFqltaSxieWp+zlK3?=
 =?us-ascii?Q?z/6toCC7SnnFTnflfr0+te+w/MHKbxgEbbdp7pIuLZEGtVtQklyaxK7oU+nb?=
 =?us-ascii?Q?jpiEKEViLBSc2hp6b+MdcWay+qZq1C1IZbrzHJSr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce58d59c-49e0-4c56-fc19-08db8e969c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 11:42:51.9515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UQCsIYm8XnVNYfFs1p7ij6EtrqPY3EqF6wyRCuwS3LWTh6zIrQkY4G4rzVJE4ciaH2hgugk+L+WeFZSkaVtpXwYNh03HxpwUNdAqNebEpxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Only set PCI d3cold_allowed when
 we are really allowing.
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, July 26, 2023 3:42 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH 1/5] drm/xe: Only set PCI d3cold_allowed when we are
> really allowing.
>=20
> First of all it was strange to see:
> if (allowed) {
> ...
> } else {
>    D3COLD_ENABLE
> }
>=20
> But besides this misalignment, let's also use the pci d3cold_allowed usef=
ul to
> us and know that we are not really allowing d3cold.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78df43c20cd2..0c4051f4f746 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -794,6 +794,7 @@ static int xe_pci_runtime_suspend(struct device
> *dev)
>  	pci_save_state(pdev);
>=20
>  	if (xe->d3cold.allowed) {
> +		d3cold_toggle(pdev, D3COLD_ENABLE);
>  		pci_disable_device(pdev);
>  		pci_ignore_hotplug(pdev);
>  		pci_set_power_state(pdev, PCI_D3cold); @@ -823,8 +824,6
> @@ static int xe_pci_runtime_resume(struct device *dev)
>  			return err;
>=20
>  		pci_set_master(pdev);
> -	} else {
> -		d3cold_toggle(pdev, D3COLD_ENABLE);
>  	}
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
>  	return xe_pm_runtime_resume(xe);
> --
> 2.41.0

