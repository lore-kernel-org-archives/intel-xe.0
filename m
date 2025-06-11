Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B59C61CE7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 09:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EA010E5F7;
	Wed, 11 Jun 2025 09:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGcGM2c4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BA010E361
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 09:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749633482; x=1781169482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MzcdjuiTXXlLzuvrW5qpBzx0VMKAV7f0Bo7e/FMGJX4=;
 b=WGcGM2c4X408Jtqz8HwoYnxMg4Fjg/SXS+J4syD/iDVyuls2dE0vvUx8
 xzs3o06YqNAt3LEsqNxhqKKr/e1xcKJGPE4EgsZ7tEpq5SvR9I81PlMcB
 7hxU+i9iCZz5IB3hv37EOaruSdIA23h+ny8oZDluwxIxuUCxj82YO73Z7
 dfVZORWJU/EmOR94Fj9v5vjDQdc/vHxnPqN+s7IFyqZ5hZwwwGu5WrGd5
 VkItDDBOi+B3lDyDY/6fp+cXJe28qVXQEohldUnQr9BO04/QvnIYwuqZY
 RBK7unJXGNHhsoFp/q1b8QTeh5MzHgCf50IpCDfjijCqAdpjEwaCbiMol g==;
X-CSE-ConnectionGUID: fgvQjbhnRfOPU9/Iwu4ClQ==
X-CSE-MsgGUID: SOjsaWTuToqdnaCEOrIheQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="77174103"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="77174103"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 02:18:01 -0700
X-CSE-ConnectionGUID: aLr/DX0dQ32cM2JIOb6o/A==
X-CSE-MsgGUID: 5EEKwh+5Rby8BUryglIh5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="152133962"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 02:18:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 02:18:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 02:18:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.59)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 02:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTpLSfGwiczrYCagKN9gHNDoDVmcvTXuX38PLZKy/OzDQY4x7kX6mrFMinbNx3ARLgQ7XrMjlND7s9VaWoWJF01fg1vu+ZKjWp7sifMgpm8AKDaZ4uS05ILyShl8ev07HvepYzN1vIhL2l29qXhI6+lwDfh8RlGdqHsF7kEfsq4gQ8vA+YhipArIc1XueidYsiXnemLMcHI4u7FNQGprhgJGhPKY2OVTqjQ2hOjjK7X3a9t4xzwpE2qpqyQ+t47RjMLIdf7clWzbB1V8IwsMSOfbe6RT9jQ8ly5CQq2BJhGxKEqqJoNIf2rTj34RGnMel/rXQi06f6dlUKXNhFk19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erYhmhIKTJuv2TCdFU7wH7kOSLNdTkcYYBr5zQSgOQo=;
 b=jRZ6kXXShtegzI1LF15qtocPYLkak/mZirflQOR52PKboi3diTnwpkZipqB9Kzc2UvvCi7pc4YJc5ZPAedZ2qzeCwQOdYRL0UFURQiy21MbjxbKcqPATS5KTAK4xV9/e/geTBnCvO90SQDDZGJYQN5sYCr6RvsJxHWIDa9X8GH3QMUbJ8gvJTOTKxJkwvFHRrfuqNW28iasXSpHmiK105tya1yjKpMLeUjzIAIfIGpzvtwtvb7nKvAFI3FtPkoNDEcwoQlGHgVGYpE1482J7k0/PJcerML7Rn7sjmwL8As12MsvjciwVwoEtrsu2TJqm4+qXcooCC/3lnp1nAdnZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by LV3PR11MB8532.namprd11.prod.outlook.com (2603:10b6:408:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 09:17:56 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 09:17:56 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Yao, Jia"
 <jia.yao@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nguyen, Brian3" <brian3.nguyen@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>
Subject: RE: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Thread-Topic: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Thread-Index: AQHbzyTKjZp0+ejw2Eqx1TL7iEh27rPmy0YAgBb4jkA=
Date: Wed, 11 Jun 2025 09:17:56 +0000
Message-ID: <DM4PR11MB5456F18EC221141CB3388FE6EA75A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250523150418.168362-1-jia.yao@intel.com>
 <20250527163050.287042-1-jia.yao@intel.com>
 <aDYDsozeWc+kpEfV@lstrano-desk.jf.intel.com>
In-Reply-To: <aDYDsozeWc+kpEfV@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|LV3PR11MB8532:EE_
x-ms-office365-filtering-correlation-id: 6a9cf662-2680-4266-10fc-08dda8c8da5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5pWAHMOi8ByHIPzbKrjx1R7DEeFQPoKn2kowQw9pe1+65bXp7LsOhlJHAWUL?=
 =?us-ascii?Q?Cn82yJkPn5fvqfnrTw0ztBP5A7+IscBW6F5hbbO+pyQ/NJXgDmNKde3ifRZy?=
 =?us-ascii?Q?dcAPpcHDkQZQ9UtNriMU2IVasC8gbdObsSIMO4EQBmXkeqL7TWi7BDHSPrfH?=
 =?us-ascii?Q?XIGvMzhP1CrF8f1lpgzYQ5V6NdINhHvHTxOpbp8ML3CgVvoERD/6STF7x8cj?=
 =?us-ascii?Q?svznmZHxM+vsyWFHo/+cKsutr7+Y9kAP6IxxoC1oecPmTvYnsZkvXYxyrt2/?=
 =?us-ascii?Q?yrXtCXpW2OHJ2Px2YBfcBfVQilityPFWh5DN34K8hR0Zi9MWuNdHT19ytCKe?=
 =?us-ascii?Q?8AuTMAmWA4Q49oQxSD+PrGd/Ep6Kqq/GXX5ggg406IbVSgf8vfKex9/m/c34?=
 =?us-ascii?Q?0AJ+AqdrSNbyA6k1X/r1U3X88p3grrXVzwn7BBU06OOjPjSk15XZbdFDmUe8?=
 =?us-ascii?Q?n+/7ckODpK+E/kreIOMnHsuzWxNuzKKj66fN+eQ3LvU8UbXLIWCobwaWdPCj?=
 =?us-ascii?Q?WKXo7cHMf60pyfZ33O1upVhYctw0fFvvt/lOebsy3ZzsPpDqQwSAlszkl6m5?=
 =?us-ascii?Q?a6GcacWSgEUEcAyIlPLePIWkra+AcX5ru5UillrSIlQl6C0ZTTbCGmad5tW4?=
 =?us-ascii?Q?b0uUAD6ucpUHhVY+ge/zdjw0zO32Q8rBKx3z1zBJJWWmHAd6v+GU7kGa53ao?=
 =?us-ascii?Q?83UbAuBBguNNxrl0vnm5z1PxQJaDNMVEPACks/UGsvoVFllOg970hUDgG1OH?=
 =?us-ascii?Q?QqUt+n9l3UTjdfNXzZqEWmHdbZ6JPwYjAzObqVpREH0HgC24LCkdcbnqpbQf?=
 =?us-ascii?Q?rp/u26GqofY/B6Yf+/J8D5VO1OF7yoHGdb2VJ+8f4KPqeF8CLpw3E8F6Egxk?=
 =?us-ascii?Q?ZB2pnyMoDpb6o9sQ0uEbgedQN1xJqlJlC8Ds4uCtindrNn3YQ1ANjqmxH+Dy?=
 =?us-ascii?Q?pnM91CUjn9esdNEgTS2weVTWkJ37RBVeymDap5r/z6FKCmU5V/K6U8kvQk6u?=
 =?us-ascii?Q?AAyRHgNnvytMWJFYw6FCwwUVdo3ZCKwHJN/nt7XqIiwl57ECFCm4u1VE5th7?=
 =?us-ascii?Q?n4IrP2bKS/0q4YrLmnm8MIEqxKzo5me3fBxj+E7trsqmCdRWzsnyk3VwZBrt?=
 =?us-ascii?Q?4yJ9DjakvUbUI/jKFm1MV/Icsznt53ef+jB1HvAQluVkh2tn5LnAONUftjG3?=
 =?us-ascii?Q?Kxb19xr4DGvtjWl8OT3db1r887RvASkkvL+m6K0n6rpJM0n1Dajwm6aQIkBG?=
 =?us-ascii?Q?XB4x0H0yeCgkMCums9K3fkpHV2NWN8ZMH4uNfKzSdWk0BzdsMKeY7f0Peiar?=
 =?us-ascii?Q?Crju8vB46n8YaIowM2i5ZyiwJ96G6LbXH96BPK1zBLI907fORKJHioELvQ2D?=
 =?us-ascii?Q?JNf++1as2dbBn+syFFyj98hHy6ER7lxZgfVXMgiiriTEfNuGN+O7Tc5j7qbw?=
 =?us-ascii?Q?LebaPFiV0hpMVxqywL2vFyBhPnN5sONJN/op4aKGaFOix0jBL6/wkw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+GSjju/IVLfnOZGVzWjY2gGILlM6k9kWGXh0gZrpm7CZm5csfdgFTXafhb3/?=
 =?us-ascii?Q?m5w+Ei+zPztvlakMs/gcEk7X+B1axCKZWyUqzzsf0Yr/titJmXrz/ft/CSGk?=
 =?us-ascii?Q?PVRO5DeIMCSQ7SXI1kxJCB8jJ+jD9NGPlLhfJY9u+IXBaoUT9xWJpEh4ybc/?=
 =?us-ascii?Q?62DfRTkwWy6fZZRMsN5RJibyeV1ieJmCbu3m0r26msj5VVpueE6K6DD5Qirp?=
 =?us-ascii?Q?Y10tH5d0NqiodOQRXv2ZWgh8iCeQCLJSpQTyb4iTDI9xAVMsjrsG5lKlMc7L?=
 =?us-ascii?Q?/NFM2MCR3Dh8P3AF9kyvkgqMRMaIj1lrRBAvSttbP0r9V4P/cwIAu2JDt/Cm?=
 =?us-ascii?Q?dPsWd5KsLlwH2EVBTriyykhuMnR18NSFmdfnKNY4l6Y4Q5SbHWrWzRAhMJpZ?=
 =?us-ascii?Q?gPQAo7FUliy3YNj/pLwUOtPytfSgY3TKqCTXLXzqmileIEf74etWt71nuPQC?=
 =?us-ascii?Q?oWcWzSW0iFUpguXSt3XH0gAKpQWlUT3M83iEi4QjQTre7tAOr5NVwcU6HYOf?=
 =?us-ascii?Q?PRnj7ohHb3vHimldQklnJKidDTglTkjIRkxGJxxc5wlgvSRe1/cQXjme6SiE?=
 =?us-ascii?Q?Yl88uTDC6HEBL3NODEJap3V+SEwfv3GWlmwfGUttV0hDwTmzveTStc+5ttON?=
 =?us-ascii?Q?1jERvbg8jD0UbNMFIYJ1UQn6UCIaxivagUhXWmQd1hgV61+gsivl4wr/ZgpA?=
 =?us-ascii?Q?Dymasyqlcal/rUXCEeIYLsYrqSztE+rjKdIMCN3d6vsu57/KPe+vYIHgzkP2?=
 =?us-ascii?Q?B5zXo4/KokL+L62qE4jj2vT4dHW9+ET7tmjNWV5G1Mdohx+DwVddva2ML/PT?=
 =?us-ascii?Q?FzOylQyMxOrSVjvnMwGRcE4ApDPK0eBN4O18CJIMTW8HPDIK5WKbP/fzTvxx?=
 =?us-ascii?Q?Ll5ItdGd3YAjcQpe1MmkDwiMwatina5QjAzC1E4xUbbt7ueOsV7z8s28DpDb?=
 =?us-ascii?Q?9GbCuS5MojPgGrs51wDnx2yb9H2m3hnI3GGhoge0iu8L6ye5IvVWDUwrLwGC?=
 =?us-ascii?Q?bMKFhGgEWKV4TRQd8hTNXJu2rupE8EV5vp2e7bWFOXwA6wqnS0luwyeQBtDN?=
 =?us-ascii?Q?v0ckdqXL0xNgpDHuFAhRYQabFjr9CsPspkQenX03ZZCwi+FFTV+WOA9lIsRq?=
 =?us-ascii?Q?Y2PI6c2lXZhhl0R3KVJim4zuxQZ2J77qZ/QvApBK6fgKJ24NRnWywwdB49Gl?=
 =?us-ascii?Q?rZuoGcMjtGAdY0k7mbMQPcyECxDyoDTSgm/rdGVHoSreUAb/lBAAavgLOp7t?=
 =?us-ascii?Q?nmbt3EIpp0hhbnCewzHwhWfdxDvrqO7l465JT9m13ZzPAnRE5rHBs0NEag3i?=
 =?us-ascii?Q?jICXT3JsBRC673Kez/6UqguQSGjrfctnidMGjAaXIgidlzL21TTQ3Pxj7Ulu?=
 =?us-ascii?Q?Bb72889T4mytVbZOpTjNFc3ERhIDLbvq8SoPjzSCS9nmKm01uXV9tGzruzZ9?=
 =?us-ascii?Q?18fH42cfvZH9JMB0NtGUy2SDxd+1apGyhBAEbhoxuhyzWRBRvypsXV43R+Ti?=
 =?us-ascii?Q?c7OOby+uFTwVaGoSnFl6bAenXOoVO+XJAyrB2+ebO8PGm8XoXh88bHKrLbhG?=
 =?us-ascii?Q?CcbGpC07oyDRMS/8OJGd7wtPxMYkUGRyf1fOq/qdtLHwYI6PWX/RRKP0U32e?=
 =?us-ascii?Q?v5SjAotLR1Bfy8rfQ2A0a53Dlu7okrsAZ2ZI5Djw/8Z7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9cf662-2680-4266-10fc-08dda8c8da5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 09:17:56.6559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kg8T0lw2+Dov15ElfT7mTfR0jwoMGo8LKoz/kVNr092ZTkR4K9WtAcqvbKnBZlH09h1P9uYfjwnxUIu9X8i82A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8532
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

Hi maintainers:
Just to avoid this patch be missed, could you please help review and merge =
it?
Thanks.

Best Regards
Shuicheng

On Wed, May 28, 2025 2:26 AM Brost, Matthew wrote:
> On Tue, May 27, 2025 at 04:30:50PM +0000, Jia Yao wrote:
> > According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE=
.
> > The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
> > condition 2 * x + 1 <=3D 0x3FE must be satisfied. Therefore, the maximu=
m
> > valid value for x is 0x1FE, not 0x1FF.
> >
> > v2
> >  - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew &
> > Patelczyk, Maciej)
> >
> > Bspec: 60246
> >
> > Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM
> > support")
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Thanks for the fix:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
> > Cc: Alex Zuo <alex.zuo@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > Signed-off-by: Jia Yao <jia.yao@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c index 8f8e9fdfb2a8..1ede50780a14
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
> >  	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> >  	/*
> >  	 * MI_STORE_DATA_IMM command is used to update page table. Each
> > -	 * instruction can update maximumly 0x1ff pte entries. To update
> > -	 * n (n <=3D 0x1ff) pte entries, we need:
> > +	 * instruction can update maximumly 0x1fe pte entries. To update
> > +	 * n (n <=3D 0x1fe) pte entries, we need:
> >  	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
> >  	 * 2 dword for the page table's physical location
> >  	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
> >  	 */
> > -	num_dword =3D (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
> > +	num_dword =3D (1 + 2) * DIV_U64_ROUND_UP(entries,
> MAX_PTE_PER_SDI);
> >  	num_dword +=3D entries * 2;
> >
> >  	return num_dword;
> > @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct
> > xe_migrate *m,
> >
> >  	ptes =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> >  	while (ptes) {
> > -		u32 chunk =3D min(0x1ffU, ptes);
> > +		u32 chunk =3D min(MAX_PTE_PER_SDI, ptes);
> >
> >  		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> MI_SDI_NUM_QW(chunk);
> >  		bb->cs[bb->len++] =3D pt_offset;
> > --
> > 2.34.1
> >
