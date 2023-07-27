Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09796C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 11:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A0210E56F;
	Thu, 27 Jul 2023 11:34:42 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A6C10E57F
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690457680; x=1721993680;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3/HN2DejlEhU9eAXyEmQTJ6nxcSRX3/PU+Y8PWAsdlM=;
 b=G2LhWT4eja2wquS2Xve2/O8MuenA3+5ispDiRAvi8y/f9SqgF6z5PE4Y
 Cf2lVoJ3dJII8KajnktlcNgPRXUXkAlSFb9XSi9EeYH5TwWpz8ePCcot3
 bcjAVSHehLpWuyDa5wSGd7OLKhLJCPRVXCW67uSylWixZ31vw9oD0eBGl
 B2a0hSX/KyJ9cmlNk/c5sVoZWxP6lyup68Ll1wigz4t4rsvQH9uSEAYq7
 Bnpocpg4ihJ9RZyhywzkacKrVnoIowwGFQTttbwJZYxxnZ2uAXoaC+6H3
 imKursvKKvpq1fTF4I8R8f/wxCAdLhRRogzJ38Z3zHoMDB5RY3TKxbMNQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358287639"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="358287639"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 04:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="730234387"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="730234387"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2023 04:34:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 04:34:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 04:34:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 04:34:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 04:34:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzEAK4cwGGLGvMn+U0O36AG4dWRwEXMiMk2WXXAflD3VrLIWMkVldL2PpuMJ8y2JJBQk3Cs4kMhsopPibPwJnUpKEMxiCy5tztKMYk593Vfvwc5bGgmed7Md1CEusGky8Fm2a6qi/fmMhNUe0a5Z7MuVkDJ45QvuJdBsweaUhp0M9ukXLcbtRpaKYmyWf/Hjxm2HPlOf8lNcvWCwpmlCK4IGOL167UXFInA+kOSrT4mkqmLVZIK50fzoTgsSjNGDl2mBOqO0f+ZrDyw70FHvFzPnyQpwRIIZqBK/+JIx1EetxeVN0tYVbfO+aFEpuiVnbdbXT45/LRI8MSGLFaF9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gizgW1UO1P8P9m1j6/3yIVVXcgdHVpsFsVUy7x/wIEg=;
 b=QG8g/7tTUMUHi7gdiEz7fcU3ZLz4kiq79m1x76Oz7UfSTp/HqS1UpJpzDigpf9LqT3L7r5QSgQJpNYWnKoUdXfgAwzIVWMNx3n8Jgb7n2tkdxTuY2nFD0+mTZmQ0T/8ZgjVVZgFdYAB0ZpInDIbyAVL25oEgrBELR+tNd8npUgrbrmI7UGqiBrUd7eoeHpYNxMDLmCnDPiyZkXa7YNIiaZDuCvZ6HhwsuFjNN805NEcBNfQAlp0qgyKk0EZ7X9WQ9BM2er9JL7TPGq2BF4UEatt4vA9m269Qs+68oVDtDfRrJj8daUrucrGfXYpxHpWq4SpFo1Ut4nIp2jCR6G3d5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 27 Jul
 2023 11:34:36 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::18de:a383:8dc0:3cb6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::18de:a383:8dc0:3cb6%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:34:36 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 5/5] drm/xe: Ensure memory eviction on s2idle.
Thread-Index: AQHZv0UUiYi59PB5nkiRATMp5ntA4a/Nfe0w
Date: Thu, 27 Jul 2023 11:34:35 +0000
Message-ID: <CY5PR11MB6211A092E371B1AB2BE6CED69501A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230725221159.354618-1-rodrigo.vivi@intel.com>
 <20230725221159.354618-5-rodrigo.vivi@intel.com>
In-Reply-To: <20230725221159.354618-5-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MW4PR11MB5821:EE_
x-ms-office365-filtering-correlation-id: 6ffe04b1-047e-477e-b6dd-08db8e957486
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wHvCdMeCWGm2EENK8H9iHmZDFBwu7yvzoqW3LT0bssfQEwOPja82QljBh9OCHYBq1FEILsIehoOdEkQU3QVGzdLeTsqEy2qyn+9HfkGXgbfM6U5h6OWwp9rmLLEy3ShRNjYQwrxiBbgd/wiSv+NxRzJyE2iKfzliBOztSjjwmP8BJKMIPlyfKOLtV8LIfp+4OazrzvDBO5382/Kb5GQO3oXNh7i3WKLxUtRYMPwWbk81+h4HK/mKI2LoCaViTfm5Qbl0gSagQp/kg0i/oe3ANZuUA7prc2Fo7+dtHY4hn4pujONpmMfPMMEikVk5SjQcx6f436bjskpXJNuVUTdZd0pQijFto74hv6IjmR5BAEWDD9+cXGkX701Skcg83BDKPxBR8bYhsTL0zQEChNADIVwuyHnJBv47Tp5qozXxql+KbreqPRcl+DxSuD5DTRAozcoEEFtkqoK8u0xFi2he0uMnGD/NnCxDANhyxTSHhudzvXusvIUnBAL3HHoKgSV5AwTWNKijZlAWydX7IPwcK+pidrhPUJEDEo6QjHZFmfKN10wNSt5YmMeKu6S3KLPTDg3w5bAw4eo79B9FwoB9ZoRD5JZbKxtvsGsbHLZqlBmeUw1s/b+hR1/6D2vwjD6c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(38100700002)(6506007)(53546011)(186003)(86362001)(26005)(71200400001)(83380400001)(82960400001)(122000001)(38070700005)(9686003)(7696005)(66446008)(64756008)(66476007)(316002)(76116006)(66946007)(8936002)(478600001)(41300700001)(5660300002)(55016003)(8676002)(110136005)(52536014)(2906002)(33656002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ag002l6uDfV5OJjwf99GHPlX3B5s/TlSm2qLeA7ne4T1nA0mqMRR0kq5BaJQ?=
 =?us-ascii?Q?UtQQgHvM9VTIH9k2A4Xehs/T/3LDjOUpDb3UmgDIeaAL0x/kzfn6I5KUkCha?=
 =?us-ascii?Q?9S71NzEeqPa/NF/Dqp6uuX9cY2cvELv+c9PA9drlM5qBGZjSL6A7biou7YVK?=
 =?us-ascii?Q?xqj2J9EPOS38Kn3nAALGNl4WTh+Ikx5xZGMJIlDBkNUaMyASmT3g+DOq0Iqr?=
 =?us-ascii?Q?FFav6cocZ1orBo3dT1Y7zKfJimZFE0yWTNtDiVHdbc6LRS+gNsrk8BPYIU1U?=
 =?us-ascii?Q?QSehas8u6CGvZVZzKU0dqH+Cw9sAVnUyx46O1DWtwaEy2CI6G31m+LnsGNu9?=
 =?us-ascii?Q?Ja6Nljvju2UmGGhLdMBFagsRHGVklAtFCwBZJMUuwY4D2ctXlidweH3VbKzI?=
 =?us-ascii?Q?LR/LnKyhvC1kzGMYv3H4hP9ON7FnkI9JHSBc3Z0WrmR4Gfjtvfe/HSpGzm7w?=
 =?us-ascii?Q?/+EnpQP1I6XJXJyiIC3MpCHl9I472gCSiAwNAVOdb6wb1r3RzAphcX2lO2FT?=
 =?us-ascii?Q?lytSbSaKG+fWfWQmjryBL/94YrRdiztk2PeZd+clA+IBzrJwYWqIh4pMXLAT?=
 =?us-ascii?Q?3gJ4uT76CBwVc3HCHZ5vI2vao6MJuRlodsvCTkc4o3R2ZcXlK6yPmo4P6/GA?=
 =?us-ascii?Q?1pdK7limA+q6QohW8bl8u8TWElwRJ7SYaWVjJT0Iitl7lM1Wi7/C9PlGKX1J?=
 =?us-ascii?Q?+DZIMYQlvurR+YfgyH4fLNHcrGGTWlrEtnYjmEeCpQUclAYqrNJ+Io6HHmMZ?=
 =?us-ascii?Q?6tLwjNcINb9D+/zJDKRtL3ZUlXpGTjVZo9EHCy6+yrJ9dG+Z29RFyycx7Ry3?=
 =?us-ascii?Q?SLfqSmH15La0AEQQ9Ble16HAM7CxPynTpC5jZaoauoLq/fkG9Ie31cJrurxl?=
 =?us-ascii?Q?qVn9fy4dPR8SFJ/ouoSFCU0FGDQ0uhwlLKPCh4v9nInhfDKZpICSn6yYXHgs?=
 =?us-ascii?Q?G6R753xJDpqv2xMlg398ygbb1kT2ZIOgx7Hz1w7+3xrTKF3yPMuTRxD+xbXG?=
 =?us-ascii?Q?d39ZqWXTicv6MukhvM6jGQfpfvBwWHeGM+apC96C45z9KRFEtv42kgaYxkC8?=
 =?us-ascii?Q?EK2Yb7kH81WJbWv7jCQZLohsoNYjveiXnIpAxup7HPDlpEIJq6sI8ws5bwqk?=
 =?us-ascii?Q?92fNs7J4mmdtpIDT6rRrCYnByM5tvU+hkA/PV08uoaadcHsuqonTolgOXaeT?=
 =?us-ascii?Q?giTgcGvbuK1CYrHbWx1nBOZi7wnumNevmMcCCxfUPTkiKOzwy0MXe7ZEra55?=
 =?us-ascii?Q?hXtnBpSIKYNt+0+9kChTE+fHlnMrpVHNvgkpoDdpFpg7wZXXttYCZFoN+N0N?=
 =?us-ascii?Q?bfkrIDqzAng98n3n9qhwt6mvVE/ZfCJVzAIos5CjsAiAiRrowQwil+pae+n1?=
 =?us-ascii?Q?sfyV+ojTzoYK3iooXWbLe21/t8UA84ZJdvIos1sdm+hr5v25ZLfRmx7P2ySO?=
 =?us-ascii?Q?c2CpMbBPm+9xeoRQOrnQtZiX1Fmw1z/ezKF8kHura9ow7Nuw/YABOqrDMaae?=
 =?us-ascii?Q?3Fnlz71H4yy/IqG0p+JhUplOAp+JcUaIaRWjIpWk+qx/KRs9sLZ1mnp4wkMr?=
 =?us-ascii?Q?B8v4O5oD+CVWUEzCluiIP6Mlf5eqUt0qzaC+zIbT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffe04b1-047e-477e-b6dd-08db8e957486
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 11:34:35.8837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2bu9dIPMpGIdML3Me0eoE631TSv+Tt7UoTlVocDZWNokE7HcwXZFSatyjL9eyTm/4oUsFWvjxRDjEDUu+IQVA8ZaFjB6/U/aMswZgH9W64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe: Ensure memory eviction on s2idle.
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
> Subject: [PATCH 5/5] drm/xe: Ensure memory eviction on s2idle.
>=20
> On discrete cards we cannot allow the pci subsystem to skip the regular
> suspend and we need to unblock the d3cold.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 54 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_pm.c  | 11 ++++++++
>  2 files changed, 43 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 06759afb4224..ec4ec769a5cc 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -31,6 +31,28 @@ enum toggle_d3cold {
>  	D3COLD_ENABLE,
>  };
>=20
> +static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold
> +toggle) {
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	struct pci_dev *root_pdev;
> +
> +	if (!xe->d3cold.capable)
> +		return;
> +
> +	root_pdev =3D pcie_find_root_port(pdev);
> +	if (!root_pdev)
> +		return;
> +
> +	switch (toggle) {
> +	case D3COLD_DISABLE:
> +		pci_d3cold_disable(root_pdev);
> +		break;
> +	case D3COLD_ENABLE:
> +		pci_d3cold_enable(root_pdev);
> +		break;
> +	}
> +}
> +
>  struct xe_subplatform_desc {
>  	enum xe_subplatform subplatform;
>  	const char *name;
> @@ -725,6 +747,13 @@ static int xe_pci_suspend(struct device *dev)
>  	if (err)
>  		return err;
>=20
> +	/*
> +	 * Enabling D3Cold is needed for S2Idle/S0ix.
> +	 * It is save to allow here since xe_pm_suspend has evicted
> +	 * the local memory and the direct complete optimization is disabled.
> +	 */
> +	d3cold_toggle(pdev, D3COLD_ENABLE);
> +
>  	pci_save_state(pdev);
>  	pci_disable_device(pdev);
>=20
> @@ -740,6 +769,9 @@ static int xe_pci_resume(struct device *dev)
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>  	int err;
>=20
> +	/* Give back the D3Cold decision to the runtime P M*/
> +	d3cold_toggle(pdev, D3COLD_DISABLE);
> +
>  	err =3D pci_set_power_state(pdev, PCI_D0);
>  	if (err)
>  		return err;
> @@ -759,28 +791,6 @@ static int xe_pci_resume(struct device *dev)
>  	return 0;
>  }
>=20
> -static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggl=
e)
> -{
> -	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> -	struct pci_dev *root_pdev;
> -
> -	if (!xe->d3cold.capable)
> -		return;
> -
> -	root_pdev =3D pcie_find_root_port(pdev);
> -	if (!root_pdev)
> -		return;
> -
> -	switch (toggle) {
> -	case D3COLD_DISABLE:
> -		pci_d3cold_disable(root_pdev);
> -		break;
> -	case D3COLD_ENABLE:
> -		pci_d3cold_enable(root_pdev);
> -		break;
> -	}
> -}
> -
>  static int xe_pci_runtime_suspend(struct device *dev)  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev); diff --git
> a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
> 67ca7cb7e8dd..8bb8e154e5f8 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -139,6 +139,17 @@ static void xe_pm_runtime_init(struct xe_device
> *xe)  {
>  	struct device *dev =3D xe->drm.dev;
>=20
> +	/*
> +	 * Disable the system suspend direct complete optimization.
> +	 * We need to ensure that the regular device suspend/resume
> functions
> +	 * are called since our runtime_pm cannot guarantee local memory
> +	 * eviction for d3cold.
> +	 * TODO: Check HDA audio dependencies claimed by i915, and then
> enforce
> +	 *       this option to integrated graphics as well.
> +	 */
> +	if (IS_DGFX(xe))
> +		dev_pm_set_driver_flags(dev,
> DPM_FLAG_NO_DIRECT_COMPLETE);
> +
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_set_autosuspend_delay(dev, 1000);
>  	pm_runtime_set_active(dev);
> --
> 2.41.0

