Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4CACA0FE9
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 12:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A2B10E64B;
	Tue, 26 Aug 2025 12:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOlH8M6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C33C10E64B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756212158; x=1787748158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j2PnWHarhPBKWdNSOD7bdnYnnDB65t3Ombg7cEdB7sI=;
 b=fOlH8M6y119ICJ/qQyguy3Ih2AWkMEhGFyuqh1Kg+YR+gTN3O8NrV3Yh
 BxarC3H3rpny6pIhIeBoI2ZNsVUKhHuPDS3h5p7mDvDEa47uK5LH5J0Id
 TEnX9Mzs5s/Q9dTCyhxprLNzTendm7WTM0L8YZQQCHBtjo7wvvP+FbbVb
 xkrn4AMzWyI/HsFKYrGNtZjo+loUz+veu67h+SRLZC/VvWK22OKDFuDh0
 /O8yvZW5Er/CHb52b098zhG86WIHPzRPUGmeSWc0lUosSl0epkf5yUgoC
 ad6iwd1gr1NlBeZTqLkhB/72/16NtvhAZ8PIIwxYMszYG3zQJSBtBiW6Q Q==;
X-CSE-ConnectionGUID: NzM8CJxRQhOZGisBjcjABQ==
X-CSE-MsgGUID: tLJYvPKST2qTelNWXCpmdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61080416"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61080416"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 05:42:38 -0700
X-CSE-ConnectionGUID: kE/G7wlmTUGnRec97WPx+w==
X-CSE-MsgGUID: oxBiIB3jQiKBoPKbUKBB3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170389425"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 05:42:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 05:42:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 05:42:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 05:42:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWxZwocebgX9sEPn0b8KENtp4AxUknzGedOshccx535DTs+lSQaLu1B1ekRZ6TlAeN/wbZds72uSzQlNzScEdnFvxgzI3VqS3mwHhZFJJgSI9hVO7YIyAa84hXWd0k4ZEDcgJSxO96pS/NcNKOzuz10x5097CHjORTcuVMVZBPFoIQkuAIC0ZMdmyYEcGUGKRbAISPwnEMT+RF2JwH7T18QGhdLzrjQ9levtZwBAhJjCI//sCWivzFxrQtPRZeP02yzp6jYFALiIvU7B9fADX98zcykLeH2WQ3hk1ZzYBBp+KM6EgvT4vpafvHZGQYp8noe7uNV5FcbJsCpSEG9XUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJCXfgfqigcBSIRN/5TX2GelvP0daMRGMSPY+8hQc5Y=;
 b=yuTNIH2mOw9FmUGTbyMzke1sclz1xnQkxCGXKz2dgQxLWHJSUw2y/Zb8CytjBCDSzdZ7FmgNyIr/ylnOVwyQrU6MQZYD8atTl09Qk93UtHC1hjcASo6Ue/zZ/Neo7BVwEbPmbN0o25SMJy4iR5n1KoUdj1omWUNVYy/oSd9bhJGcPyiz+H5DEjHskviyayofdjl08pBKQAqoNy65kQZreFBEi6wXrd1ArygCClvR9KX+tLgtB0j+azICgBJqi2BWotOqjrAcsHOwi+X/FZ85PXAiz+XOJqj2Fh+kY1bbbAKG926V7yvjvFkPENPwY3Wi/BtO4x0GzRbwhYZ73RazVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB8517.namprd11.prod.outlook.com (2603:10b6:610:1ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 12:42:35 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 12:42:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v2] drm/xe: Don't trigger rebind on initial dma-buf
 validation
Thread-Topic: [PATCH v2] drm/xe: Don't trigger rebind on initial dma-buf
 validation
Thread-Index: AQHcFdUAE7NaV3gD5UqRW5y35TaTyrR04AtQ
Date: Tue, 26 Aug 2025 12:42:35 +0000
Message-ID: <SJ1PR11MB6204470799EBD120443C18D08139A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250825152841.3837378-1-matthew.brost@intel.com>
In-Reply-To: <20250825152841.3837378-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB8517:EE_
x-ms-office365-filtering-correlation-id: 43f62746-9b23-4d6a-69d8-08dde49e087e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?I7Cd9eCmj1ii48KlFZR59y/kf+lgUYtWZl+YenrCmCa1SpRrEf2EI2Yj3b1k?=
 =?us-ascii?Q?9DvlNXMBCaW8/hfvdJf5K9IkyFfXDOnca9bBA38Y43uUkdmVgwocdNnAxC9m?=
 =?us-ascii?Q?TrjnQ/u3uJ4BB+cHgDw8Ug2UfuiyZCL3fnZRw3qjRvo+VCmmDmDzkfxZNXMJ?=
 =?us-ascii?Q?cpE3JwPwfhZo/yaJN3RGUOoZCAG02KfevvCETPRzKbp0zyuNXeBMiTB4aXcd?=
 =?us-ascii?Q?2d+Ig33fQQuPWbDI07rd8n+T0OTyYTSRzwG3KgNzIdI8N9/cRzTC3b7yezMo?=
 =?us-ascii?Q?V12N0Q7Km0uryk/IIy9X85l0HjwU8Q/VU1VGiXWuxWu1UPk0mEWJROB9Y8MG?=
 =?us-ascii?Q?WdJVD5WhkXf0iDTDb5bqQXTjbgzYyWbg/CkpVL3OXcTZc+/nOmXvXdikpkFO?=
 =?us-ascii?Q?hqhmaEFs3HyAmjVyfc0OZKSzHBUTRVZKxOsqr89DUTYLeOHAU6Gi7Id50Vdp?=
 =?us-ascii?Q?K04J4zQKOB9OCUxZ6U6DnpBXlnSH3rkGVVlZK8gbTInaFJlyFdTIj/jgM0Z6?=
 =?us-ascii?Q?UTFbrQ3+hgPGOIpzIvpZhuHpgVAttfgnjr3G+sPqoBVNEEYo6Fw3X5i0OJrE?=
 =?us-ascii?Q?n1/OMQQItH8l+dR9anhyDF09wdLwGmosHE9xGocvbLO0KKoOtkhhscmfofCj?=
 =?us-ascii?Q?IGuKjipLunJevw4nYhd8wbo5kGpMtqD8CdmJW/XTZAjX0RJ+Fbtj5JpbuH6m?=
 =?us-ascii?Q?7VqiVZ0ZFiXPzQAJc7pi0MRhSZ7mHkBUp/LX6JKpWj9fTwfiHUhqzKzGOrwd?=
 =?us-ascii?Q?rq07/gqoTYGAFf+EHAl0USGupO6Mu7DW8h3BYHvZQZPpF6xLOCWe8xUikj/i?=
 =?us-ascii?Q?lSpHKYmItxFoTqCNeDiiU/1fnJMRIgkqtzIQfQ1MRw3oCGUh3sGWwsUnEjMY?=
 =?us-ascii?Q?r3HIcfrw4TZrcrv2GqE8wfi4EIap9V1jt39iWR5xp0b7c8dbNbCy3HzJxH5e?=
 =?us-ascii?Q?i1qRM+Y2RXv2bbco2arjETBGQES9yGAb87DLM94POYYj8crl43GLea2nxGzO?=
 =?us-ascii?Q?ImQpFY/+CkMeGTk93c2ojGl8eLj/8qheV6IiiKftaj6A1aj2+WzT5SLW7nRL?=
 =?us-ascii?Q?TTy4Fsf/1SH6wnVhxfW1tRvt2VYjYdXlP/aW+KYQ0wQjwiLrIj90XDwXZTie?=
 =?us-ascii?Q?NYkuWXbccqRkmgucV6ub35fTL3nz6HwK8AcjCCpgs7m2qnNmlmsnL3rS5C4T?=
 =?us-ascii?Q?cyzAY1ALv0+5wgwPRLnBQfblEkmzbGrAmDqRw6fwT+TCBWZTIF3wNNE3im23?=
 =?us-ascii?Q?waTXwM6smPjpn5eFjdE9qXXrwWYn3DXcCY2j6UscAl3KhJYx4XtvKF1CorJC?=
 =?us-ascii?Q?UGQAPUKUH4FV4oouoZUZDMdj5JqX9xqFSyrX502zcZP9tIkO/nmx7Dh5o/E8?=
 =?us-ascii?Q?BRBykMzB6fDIm/MXYiQ4STWMYt9IBVVtfLIz7ABmUCvjg+fICVZS1wWCIgk6?=
 =?us-ascii?Q?O1AbZuZ+h58UH8SZjaG+8X32Bo1RFkpY/10VJTLKwh8blTHGu4mTKPyopy+4?=
 =?us-ascii?Q?hcAu++7fFn62a+Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RNrRP3SGhkvQRIcZir2dhLP4bY1BCMOCJ622UoBow1RxA5SE244IUJwuu7Gr?=
 =?us-ascii?Q?Gh3ZMT+PMn98magcMV5DneqNFN/mWpEyKfoKxAn7X2D2S/rGV7DKoJDgoiGF?=
 =?us-ascii?Q?ETMdQ6CxnkSRyyrhdDa77vXpM2QYrXvGsyask46OAAvcH5cBUcNo9FK+pmc+?=
 =?us-ascii?Q?XJ2kx98VoyyWqSZ+zG0AIgHIZ/6AzhpfRV1B8xYx+mjkO5z+XfXI1iFqYFn7?=
 =?us-ascii?Q?q8YHSFk5t7dzKyxbhNJznCWdalta0FBoWd0F9CqIViE8D0UIFq842ybIu4up?=
 =?us-ascii?Q?2m66W6EMhSh74ijdCKchUr0iWro4brutXhssIpSDRSz2gjQ6kuB08xHzBSZL?=
 =?us-ascii?Q?SOvpWz/QrA6qCAsJnjT6CZCHJuxJGPnWQOYgnROB5sZ0okf5pO7atU5A3bww?=
 =?us-ascii?Q?NtMpLBtrD5121rBmnL/lO11E1JpQW0xxEV+6HfcGVkmghksaa7Lygjd7W19n?=
 =?us-ascii?Q?TTyiIBPPWI4CgkpTT7QIc0GJy2pMcdrV9X0cd3zyruENOIFCW8G90JSj0Ji3?=
 =?us-ascii?Q?ZEwEoBiXAJYtU5+1YYLNRoDH4XDCEVmb6Ezv1fJ83eXmfNUPxMjz6vTu2i+w?=
 =?us-ascii?Q?T5MUmcQXWHhHJv8jxsipl5/yJ4nB9JM/CiXrDBDhdr8gyj4AgXpwPiB6L82y?=
 =?us-ascii?Q?42oiW8+zkVyp3SnyHqDFZWAkfInkTSFsVNIaaWXLfeMlz9DsEIDB8nDOsFkC?=
 =?us-ascii?Q?uMHTaJ5RX28JpJMZCIJHeSFdwX1Z4n6yLtyoGlzdBATiHwu9D76n2ZMg1vkm?=
 =?us-ascii?Q?PA1gsMFNEqIgJLSC+A2EzsqwgFovlwfoDjB1DIJx4NnWGXwy97xVccSZFCk4?=
 =?us-ascii?Q?GIb+kQ+RSauLo+PtUUGt8tjGJMx6Iey06u8MEdfe0wPbZKV3ocT/E66ub6g3?=
 =?us-ascii?Q?KtAy10R4dH2IL2VqmgfWFLu9BX/gn3UVVUgBL27dDRKi7ukgSsGjHWf06+M1?=
 =?us-ascii?Q?pcT3xkpK/i5ly2yqZ4Qz00GLdyxVLJdoRAW85zcToKn5J+TXdq38dlr4ZByf?=
 =?us-ascii?Q?xJGjON4ReAtXz2Ljohlt2fFv7iSR1KMWWSkvS8HbMcEoAF0gBj6eJJvPeQSw?=
 =?us-ascii?Q?lUatzpj1hMMS/RLcAikbpqMaRDVEdHFi6pZFlh1gMZHllQWv88FESI1ucQ7W?=
 =?us-ascii?Q?QKHe1whCagFSHGQ4otk4x38HD2CROR28HAxoh+eie5F2BoOgllu61ktnkUht?=
 =?us-ascii?Q?TfL+WQvLywMqxBGmMI+EOI8O/pxV32GmrCtJQV8qz42EiGPDX0iEkM41//Wp?=
 =?us-ascii?Q?H7ExiacDyHQhx4oQRK+F9oWH1bL9IOK/CQVJYKNka0ekrFsuW8FNUrAOwZTw?=
 =?us-ascii?Q?Q/0D/KZwP87FlorPSdQMC/ZdZMBWgU86osegkWjvmhkVKhlRef1n2XKihpvU?=
 =?us-ascii?Q?pxmrN8uwH49xRmgbfFW8qYi1RZzZ82o3YiOmAgmvfMNn+FJI5EXgDFqayAYo?=
 =?us-ascii?Q?t9IgRdrfYChcN1Mm7yoBiDudnd3N19ek9wN1wV1FLY9FtEIXecwMCxv9Hlk1?=
 =?us-ascii?Q?OK0e+PVmxm7uNN2cmNdD/5DYJDBmPZ+MXOBib8rhVkz85/Dii0Yjv+saR2xY?=
 =?us-ascii?Q?7tOMOdxyS5XZn4tI+MWdpQcI4ydnJeAQoVKJBJycrsJUJx5aPt7UI6xLuiko?=
 =?us-ascii?Q?PoEg8zUiogDTHgTDEE0w1jRE5YN6y8nbiZZHUPsKv8/B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f62746-9b23-4d6a-69d8-08dde49e087e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 12:42:35.4788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KeFhq4LpuRiDlx+KCT9pyBOiPNblFCT/MZcMpuHPZSQxFfrYgsO9c4uZ6YCHmdui9lZviM7rA1Pokbd+bNhzJLE1ggLbay/XHjGVOGbdP+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8517
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: 25 August 2025 20:59
> To: intel-xe@lists.freedesktop.org
> Cc: thomas.hellstrom@linux.intel.com; Auld, Matthew
> <matthew.auld@intel.com>
> Subject: [PATCH v2] drm/xe: Don't trigger rebind on initial dma-buf valid=
ation
>=20
> On the first validate of an imported dma-buf (initial bind), the device h=
as no
> GPU mappings, so a rebind is unnecessary. Rebinding here is harmful in mu=
lti-
> GPU setups and for VMs using preempt-fence mode, as it would evict in-fli=
ght
> GPU work.
>=20
> v2:
>  - Drop dma_buf_validated, check for XE_PL_SYSTEM (Thomas)
>=20
> Signed-off-by: Matthee Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c inde=
x
> 6fea39842e1e..a0630e120cd2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -816,7 +816,8 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
>  	}
>=20
>  	if (ttm_bo->type =3D=3D ttm_bo_type_sg) {
> -		ret =3D xe_bo_move_notify(bo, ctx);
> +		if (new_mem->mem_type =3D=3D XE_PL_SYSTEM)
> +			ret =3D xe_bo_move_notify(bo, ctx);

Yes this looks now correct, move notify should be called only when it moves=
 sg to other. LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  		if (!ret)
>  			ret =3D xe_bo_move_dmabuf(ttm_bo, new_mem);
>  		return ret;
> --
> 2.34.1

