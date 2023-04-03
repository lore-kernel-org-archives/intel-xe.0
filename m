Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6254C761AF
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 17:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9784B10E00A;
	Mon,  3 Apr 2023 17:44:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9CF10E00A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680543878; x=1712079878;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1/eMQivkASvuLQWQW7PGaaVHAqT6p3fReMzjqag+BOk=;
 b=kCN3WEDDABjOihouAfBqEP1MmsgB5c8H0MrMvQDx4+A21xulQrWYp4nz
 fwpLyIfEjXV6qqnJVzhW4Ee70WueqgTXqnUNFAyHNdaDn2Cthkux25Csq
 URVGi6BFsUmp5cWch7rj81i9imXoLFkMQsZ0St4ejIf+/cyMXIuEeY40e
 M9SiVYh9ErunrbUEAvCuNNwrfyxhS8EOBk7TBhh9tmS2EccomnShD6Fmq
 j6JyJbAcMohYXnH4GTmdcsA5sj1+XxfNjl7WRX7+r5i4RfixgBJ20rijp
 PdpO7zAkN4q/1CERrCeN1n8DuIFTeZoAmEw/u/DTKgU41DHgGXamxUs4c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369779700"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="369779700"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="679558188"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="679558188"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 03 Apr 2023 10:44:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 10:44:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 10:44:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 10:44:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fue5kGXej1hJfWsF5RqL145s12vjwXjoRyPsP+8VoseafRd+BVp5RcwZGwsHMoFrGhc2kw7Qq2bYk6gK4v2Vb+3Ac5IEinKZ9+mNXuGXv28viKExOmQ0eh/ch+cuAocC9RiidaqR93IMg/LDg3OcMOk6xdI8LjnTWZj7TzcF7aH9amPcSEHx8XqWUkYfRFfGG9O7ZkBlyfgaG3VQrzEYa+F0bdWeiS81nC6rXXqiVr1GiqJPJa+0/eGyqBW6HXbLvx2ab1mji9nVac8p3/lzyEGoSwzzRhFWOGm4l2IFx56p9kkWLvZhzp6gXlVBKskvsGvuWKKTkMXVJ9773zuSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unRTVv3ENFzaVp2W+nyOtC6j8nU+0CV5AmwJrl6Hhzg=;
 b=b/mw6h+Skc07N6evlzIM4Ua7nIyGjEyQMj2WCdc5wM9InCKhnTRdTrXPuGGye1UiZJipNNiVZys4B8kBwGdOaNKzjkg5LU5XXJ4VtkHxjAzQPl6xDI0qzbuGuV4od0MgDx3vHECF9Z6WwsfIyVEFQAt9pJNlFfq04q7NAFrRjishJWaHWpXJYIw/QJauDZxRjqDzgRFM3+QCBmgzYa5lQOSabKJrNhcrTEZJSWJetVPp/3RpfRHWoBWCFkUr4leIucO5PvNCDpWPjR+F7IeEmujN2XfwhQUMgih2OEHRq0XKsyTP4ufEYrIANDrCa+YvM3Nn0osAQqr65161VNtlHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 3 Apr
 2023 17:44:34 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::50a8:a719:92da:370a]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::50a8:a719:92da:370a%5]) with mapi id 15.20.6222.033; Mon, 3 Apr 2023
 17:44:34 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2] drm/xe: Fix platform order
Thread-Index: AQHZZCXWsKxHXjKPbEasMKKAM401/K8Z3xwQ
Date: Mon, 3 Apr 2023 17:44:33 +0000
Message-ID: <SJ2PR11MB771597DDC3E40C1C09D770F9F8929@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230331230902.1603294-1-lucas.demarchi@intel.com>
In-Reply-To: <20230331230902.1603294-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|IA1PR11MB6444:EE_
x-ms-office365-filtering-correlation-id: b8830ba3-874c-4b5d-1700-08db346b1622
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gfK7rqTUudJpg+yLVtZJE9tklULigq8RYkwzFGK0Wr9M1dTXnLIwQpuzGi92ndB7uSFjA3qAe2klt/7P84UU92MjzGyJnfVbEt4gdUq6xN5gNe2mx4NoQ6etRxW7hS9ndM6W7V5vg8IInqJwjV+JroTOhN9CdOkbAMIr9TSvlhqhkHFfueyiZGmbe68XJp1qtVQZcU8ZSO/vx5Czjbk3ojVTaWE66GmCwTXnXOMjhLw63pB2aNe3jJ4c46eiiT9DHz49GB00Ir7SJslczG/GKKPXi10F2zdQAzqgcNFgI5fmAwUphvMzrvdUQKg7/2JfRMJ1XW1cM9XPAddhWGdyLo7/1CI6tzOOhTpQldcixf+prIJJpti+zX7E82xf6++BwwgaIuktojdSp0M7ukCM8CxqlLX2c0fl84l809zi9SYzytnqgX+wTYIoX1eYEpMmZtDhCQlk++GhCTMBXKlVVlCr7nBk0/5gq0NU5QMaJryNsUTtEoXxCze2TI6E7CKvNko1bedNe0oTJ+WV6aZML00o4ZkCxOeKuHdiAM+cy7w5t3i6fOdWgbMnNQeSMxEtY8U5Ld8sKgf6misskVLi3GdWe4u8Y8yPM8GOeqvm41BF3QSzFRLHwTHaBO3tEweR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199021)(38070700005)(71200400001)(5660300002)(478600001)(107886003)(55016003)(53546011)(66476007)(76116006)(66946007)(4326008)(64756008)(26005)(52536014)(41300700001)(186003)(82960400001)(122000001)(8936002)(7696005)(83380400001)(8676002)(66446008)(66556008)(6506007)(110136005)(9686003)(316002)(38100700002)(86362001)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aarcHLOsvdF9kfJsTd0JkA670oDRnw5h5QwXvcAlKZsDfh2VQyhNRMuwJLyf?=
 =?us-ascii?Q?NTQZ2M5EDjkhj+2oYc9dl0gHTqWhJKTV5drLh8OMeirsBoYPJMjhQ1lKaeZ1?=
 =?us-ascii?Q?T3UhoUiXFNtzC/E/iwvlPogtcKtPfYqZ4RW6XkE20fZUGX3S7ze7Goadp0Yw?=
 =?us-ascii?Q?v3LXbrbM7OpAK8QFj33Ur1/nj3ANxcrJ7gfFdVGNI9MdkssKj1zgmvuZL/mU?=
 =?us-ascii?Q?cJ3yrsDE1kswFlaHjNR8TP9gtMR2Zzhdn8yFsKk3Pvt8uS67BLbfstwYx137?=
 =?us-ascii?Q?Sakp+vh/rgrI1p9YEPtwMJp4MUAoNtlsAoyP5eqDoAVKsB61w1b2QRxXyb4T?=
 =?us-ascii?Q?Pp7UIUBxvqITcykyI10m1Q9kFwCt332gpf45JkufEMjkuJg7HCLbmSTN7AOz?=
 =?us-ascii?Q?S2QKNb6jyJEPcbCzssGSOQ/jMJ2DtO4rxeaesU1NiSLj/M/NHhHmZYsYGY7K?=
 =?us-ascii?Q?JSCE5sBonzekQd37/80FvMhyjagKt+yFtD5s0jyKX5njzApLwqy10VWhD2Q2?=
 =?us-ascii?Q?KQrwIsb7hJ3e/ucCoakRR7Ahr6OvXMqeC6HByczHvb8n0xA1r2U0MUEBcbKT?=
 =?us-ascii?Q?IIhNA70lXHe4p/vXIUtxKcODr/3wkVGQOEn4U3nJmwss92QjCbkU1PfHxCsS?=
 =?us-ascii?Q?8cdwcnE/UDc2tcU9OQXfbLN0zDD8R27MbUrXukNnV13wPrRq7KKTH8WrxyqV?=
 =?us-ascii?Q?bxAGz479qtBi2KM5/JoHr5kms15d3byVtijyGKdK2OG+xNHhFE0yQQlDnQuV?=
 =?us-ascii?Q?CthQlkdAl5Nl3u5m+iHKdYDPL/3MQYi+kHg7AQkNc4BzCVlY3f0Vd2/Y5LvU?=
 =?us-ascii?Q?zbMesmxRFGDvCTM/H9bm+RBXwnfeqglMsQFaG09xptpvRPtDZ0oXgkpQpBr6?=
 =?us-ascii?Q?Jvy8s+C8jsmqa6wVZrJznESytwOD2cxB773HK1aH62Q0uTwP0sBogwshooDd?=
 =?us-ascii?Q?bxUL1Q0Y4qeGgyAmpntg4txf4EO6Bbo755eFEcS1qeKaZa+XcV82pggXlNsH?=
 =?us-ascii?Q?4jYjc5ms1KdbWYQWVFIn8SR/3zTJyjce6pKt8on9Uti1y8tB8lOZucu+jWDv?=
 =?us-ascii?Q?dFYj6c2EmRwsAFppbsrQn76JxFTm0PEL9/TKC7qo2NISRLp62CD0gOgISznV?=
 =?us-ascii?Q?1LnS2u6la5ra9e3MN18/tpOB8EdHsjQPcfMzFW8fvnwnqhiedIJSfaJhoVDs?=
 =?us-ascii?Q?s+4oWPOLnLigp87ApdRvUowVIBOklwKu40svlIDi/rf37T+eD5LvLLkaI7yy?=
 =?us-ascii?Q?a1OnOTbgbz/OaVvKde2OfJ4azpVVkFAUHnrrDcHSQ8DQxiHl85Y8Hh7fzG1K?=
 =?us-ascii?Q?n+jOplq5c+NvjRLgRzpylmZAm02RO7oUpLmJxo5hT9RmdpamZjpqryXN4tbd?=
 =?us-ascii?Q?OZK3NwrURUPkSnw61KFq0/tIdnHfn7SAB4gEnV2OmRpCGfKWED+TLaSBGFrw?=
 =?us-ascii?Q?vKLZubjO6fHVjYMgWmIfu/duvjQ8/dmTJLpIqXo5p1NMqedn52II+1acGtID?=
 =?us-ascii?Q?bOzaXFIfF27RH1/wqVuPod1/w807MEXyFjuwh1rKsrFcNqH1Hw8bHUXohmRf?=
 =?us-ascii?Q?Yn+7/dN9A3lHeLkFFt8v9Wls7qksLdcsqa2zjo1Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7715.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8830ba3-874c-4b5d-1700-08db346b1622
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 17:44:34.0387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bFDPJNLLXOEBT2JgG+cIDglYA4X9v/Q7dtL5/CQoatzvxQKcjH62QTt4u0HmNS1dwnpeqE4+n4Gwvf1o0etXPZe8sEZUsJJNTyefPCm3k60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Fix platform order
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, March 31, 2023 4:09 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Srivatsa, Anusha
> <anusha.srivatsa@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH v2] drm/xe: Fix platform order
>=20
> Platform order in enum xe_platform started to be used by some parts of th=
e
> code, like the GuC/HuC firmware loading logic. The order itself is not ve=
ry
> important, but it's better to follow a convention: as was documented in t=
he
> comment above the enum, reorder the platforms by graphics version. While =
at
> it, remove the gen terminology.
>=20
> v2:
>   - Use "graphics version" instead of chronological order (Matt Roper)
>   - Also change pciidlist to follow the same order
>   - Remove "gen" from comments around enum xe_platform
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c            |  4 ++--
>  drivers/gpu/drm/xe/xe_platform_types.h | 12 +++++++-----
>  drivers/gpu/drm/xe/xe_uc_fw.c          |  4 ++--
>  3 files changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> 91fed9d3105e..1844cff8fba8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -286,11 +286,11 @@ __diag_pop();
>   */
>  static const struct pci_device_id pciidlist[] =3D {
>  	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> +	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> +	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>  	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
> -	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> -	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>  	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>  	{ }
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h
> b/drivers/gpu/drm/xe/xe_platform_types.h
> index 72612c832e88..80c19bffe79c 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -6,27 +6,29 @@
>  #ifndef _XE_PLATFORM_INFO_TYPES_H_
>  #define _XE_PLATFORM_INFO_TYPES_H_
>=20
> -/* Keep in gen based order, and chronological order within a gen */
> +/*
> + * Keep this in graphics version based order and chronological order
> +within a
> + * version
> + */
>  enum xe_platform {
>  	XE_PLATFORM_UNINITIALIZED =3D 0,
> -	/* gen12 */
>  	XE_TIGERLAKE,
>  	XE_ROCKETLAKE,
> +	XE_ALDERLAKE_S,
> +	XE_ALDERLAKE_P,
>  	XE_DG1,
>  	XE_DG2,
>  	XE_PVC,
> -	XE_ALDERLAKE_S,
> -	XE_ALDERLAKE_P,
>  	XE_METEORLAKE,
>  };

For chronological order, shouldn't it be TGL,RKL, DG1, ADLS and ADLP?

Anusha=20
>  enum xe_subplatform {
>  	XE_SUBPLATFORM_UNINITIALIZED =3D 0,
>  	XE_SUBPLATFORM_NONE,
> +	XE_SUBPLATFORM_ADLP_RPLU,
>  	XE_SUBPLATFORM_DG2_G10,
>  	XE_SUBPLATFORM_DG2_G11,
>  	XE_SUBPLATFORM_DG2_G12,
> -	XE_SUBPLATFORM_ADLP_RPLU,
>  };
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.=
c
> index e2c982b37e87..d1d2e6f0820d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -43,11 +43,11 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw
> *uc_fw)
>   */
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>  	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
> -	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> -	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
>  	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>  	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
>  	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
> +	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> +	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
>  	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
>=20
>  #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
> --
> 2.39.0

