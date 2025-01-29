Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2723DC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 21:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1E110E139;
	Wed, 29 Jan 2025 21:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkR6MyOn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FADB10E139
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738184508; x=1769720508;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SLxm8JTTDRHKoT2MT2SFBfZosyA1vQBEDC8qRXoxY0c=;
 b=SkR6MyOne48kDdC+Y/nXqWVeNh5GMtrOuvQnibzdzo0rNJuIvAb9t2ge
 t3uBrBFm/X9n/KgjmdlzIndoT96hcNcxZFcslEH67us39UQ0jNpjewMK6
 ynw2gpjglLAjBJ+FeACY0+QyqU8hTrADhAXeG83Wkm0MmJ5wUvmyLRP1p
 nY3fs/5E63TErSvJecj0bkX/Pxz23I9E/XVapL85KVdt1WFbGCwDH/hwH
 tUl8qKPRKZhUh+UaZu3kpo0yDExAJLEIq8y2fASqLt1J+N4qAjsUdHOI6
 WFXFc9SyiyXg1Bj62G/RStueB+Nzp++J5/wA1luzlHs4FaK9L95NX1U3V g==;
X-CSE-ConnectionGUID: UMD/5KDTQBmDEXEvXgEN3A==
X-CSE-MsgGUID: qaiahghBRxOHk0Gb3IjOCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38423771"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38423771"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 13:01:48 -0800
X-CSE-ConnectionGUID: c6ivsYehQlOZ2NbM2hLE3A==
X-CSE-MsgGUID: CpffoBGaRYKY1bC7mz2XZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="114174171"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 13:01:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 13:01:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 13:01:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 13:01:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5RSUS2nzFxvX/4iG/0t9plyuBgo8P1JDRLXa+ul4D5N+L+mjMA7X3wQEZz5pClXwTqly1XjXUJlQCt+pexAnRwXBgPG20Np10ER0veqGhbdKkFXXFbDrpLhzg/Xx4JRvpXzhhBvxiWSqaNUNVlpTJ1nzvrNGyE4QrPZlkyuaevdg9UBzoCm+priAwUu4cGvoRrkSyh1zH61S10e+yPQFG79nJUums8OXCNy50QuYapE/1OebWYk3iGFxF5xhzvi4rxwlty8yDJRxq9RFVAOcqi5K1UqyWUCrUyHfM/1MRm7/BSgCvlzFnVK02caKfUOZV0movalh3h8XsakFstyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jD4ctFImKBZRTUT363PC6MZPctc8ZJ3w4NUh5mHsHk=;
 b=DqVd7mv+5yI8ew/+EBIcUORbRN4cEYgJN4edEIEjyf0LLLCCC0zj5/PXGaCkv9dvwzSl2AwiMHnIzBavd1JFo2tHq+gnrSru4iW1RPxDE/BTaesw+lrCnkZcivPhoo4N3o6TpjgcS0Sm6m4kAdYAxo4t9ZPLE/yR3fJEDLSetEul2cOPKtM1KIPeqw/cn8UBkCcpjujhTRA7JePgzxdpeFcPOjekwzmFxFMQRL+y6JfPW2BhfiHv24Uq5+LlDRcM3oGTJl006bk5W7efBLGXAgmXiXEe1ow0VCAniuhml6pbxy1Q0b+lZLQHq48EznCPrT6ZS1sy9lkaqyBfwnxPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 21:01:38 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%7]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 21:01:38 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Thread-Topic: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Thread-Index: AQHbcdDwWsXYR1fC1E6Ijdb1YBQM2rMs0nOAgAFkXtA=
Date: Wed, 29 Jan 2025 21:01:38 +0000
Message-ID: <MN2PR11MB47285CC53C87B37B279D7C4092EE2@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-2-oak.zeng@intel.com>
 <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
In-Reply-To: <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|CH3PR11MB8468:EE_
x-ms-office365-filtering-correlation-id: 12e96ff0-80b4-44a1-2d01-08dd40a81fa5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XH6o//BGtM5+4DvFRAt3v/yglcf6lIXAVmb/Io9Ry8OhNB0jyZon068i+uUW?=
 =?us-ascii?Q?M3NIzv52yClGV9HxsbxlrJfA9NJVEg/BqZW4Gj2KdtPmpeAvnlYilOF+d23b?=
 =?us-ascii?Q?dHMj3hGJXyq/a7AZFKPBt3Qto6+fRbUQqPTpGSqmnWPkpEGPT3kfk+8MXNYJ?=
 =?us-ascii?Q?+jFvcmX/7QwhUph+0CN8umCl55YZEpteMvqIAVwrkKe4PXrV8jpmxnqAmupN?=
 =?us-ascii?Q?XXft7yOOtuUQSYepVCUdp9sIhqBQqsNqRhAsJZQISEo9WxPhKdfrvS7Ax51b?=
 =?us-ascii?Q?EYnHGQV9dZBOl/iEFL/SHEvTB8ACnX3HoDxvQNOhKlY6z1FqWKr5IJgSz1ZR?=
 =?us-ascii?Q?2jD3XtMIJz09/7BKciVNYCXsVjkxl/cC7ha7tYwAPo9AbrQQZGDB0s72KpXo?=
 =?us-ascii?Q?cfj36RPbY7P2dxbZfm2hTdQeIlOkh2mfvc5+ggc8KRN6ySgSjh+ZkVwheXq/?=
 =?us-ascii?Q?3caWCm7MxETVauU1jUq1Gy1DoCw92f1DdW5lFZ2nOIS6S0em0y1ED+OdvFxl?=
 =?us-ascii?Q?yMCYlHEctY6yK0IsZoEMuvGX4d81WjfJt9srx/EdlJkUg/G3nx5v9DQpyCA4?=
 =?us-ascii?Q?WoOO3ZkIbnxgmv9lR5EIAHPPGFKLqMhU8U/woFdeA1nWLxd/H2D2B9cEyRMj?=
 =?us-ascii?Q?c7GIcOH4KvcRVjsyfaPc+X2/Dkr4jxax4WOtz/Ii5HtZWj2ZzTA1gXXfXpKB?=
 =?us-ascii?Q?BkEKElqts6lad+uqFKjtyxdxHqst8B58XZXqwuZ+RmApRu/1i+QqSVY1w0A8?=
 =?us-ascii?Q?k/Ld4akFrVbFqYcyhv5kmBo0/RyARoZwVqO2jvohSWRBxH17peIFkPYYT1VI?=
 =?us-ascii?Q?TmQmiIV2Lh12wi5rVxjauQZhfXfk2jcGTdZe1e4eRMF+UL0wLQRvBhj/q+E4?=
 =?us-ascii?Q?yOg7G1X50IzJ12G+asAhW1Kn+fC+ktnRdsQF2uw6XOPwdMeZlLGEbskp1YZS?=
 =?us-ascii?Q?qsJHe7RW5OXU0graHatl3Oqsx5qSfiku+PkE04XzDGk2oZjP2RAdpYg0/4ZJ?=
 =?us-ascii?Q?/W1BE6d+pbZHJhTZvZgq23i+VMEQ5L86O1Cvd35pur09WiK6h6b/8UEkbige?=
 =?us-ascii?Q?UCpzGReLwbPKGnAEe+gzTq8PmftazUVpzSKX5vv+3/8uHScgk2SE7l+b92Vl?=
 =?us-ascii?Q?pN+x0MMfIBiIY2u7j8eOIfBge5KiYH8ZueiL1J8VWGchFX9Zzk58W4ZmSuiH?=
 =?us-ascii?Q?kMhiMF627FP3H/IMu6GgDzB5qQ8CiAU1rqwBUb9z+Dz7ZAixXXoH2U1vZp6J?=
 =?us-ascii?Q?nPS2ZmWieQCyoNeOTRCrhAT38JBuTAXVXLi7ugrWbB+fn35go/KgEOCSpikX?=
 =?us-ascii?Q?1U8N+e7o8xVASkYTXeAb7j5RK4DO2F07gIywZUloJ3CiP3wyyiGEV2edXZxO?=
 =?us-ascii?Q?17/h/HlQ1XG4PlmZoDwTvBhe5FwIqRR8CHUXqa0Q3q78BafYBmnX8K9vaKlT?=
 =?us-ascii?Q?8eJUx9m7hGUNvRHNKQiiHhB2b+hCeJnN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8dfxAxt+BYyHw+Jt0OCzG0Kydkm2cYfPEvYsJ72Jq0RAAu3uPB5ckVGiRP5a?=
 =?us-ascii?Q?Yn31ySVdjTZxLRt89ymowSlRx412RSylrAiXPpMwOqou1h93eprQpwPM08Hb?=
 =?us-ascii?Q?wi9Y/BTH82apWa/jQOdmZF8KoPvurGESRyhL9nvAW6/ThHbhdT20TC4U8Hp0?=
 =?us-ascii?Q?xt7Wc2r4KKA9JeLqTMX/R6A4Us5tVa94JpL3nJVG3zzn1tXyClUVJZDAUtV8?=
 =?us-ascii?Q?qPya5Fdv5Pl5NILegKu9nCQ9rMPJvac7xTcOf24/UEppcRS9o9An59f9rYH+?=
 =?us-ascii?Q?7uxbDTQStFwDHWcJgPRSaVmgE/3U8xhbyk+mFgMtXwhpa/I4xhjETIMVpL1x?=
 =?us-ascii?Q?YtQgWwPlUA7Uozoj84/C9mIqz/fmFlmcIg05LsWJ/EfNPb98IegeF9IKOp1z?=
 =?us-ascii?Q?O/UnneMKhEBytI+CF9IrAp4l7OWMpMB35OLaKtdmrEpmfC6wD0w8WxWagd+c?=
 =?us-ascii?Q?B9vgV9swNYYQkMJ3yA+8viBTB9Tlk2CO675jaP/IdKIX0jEFzDlNbJ21mZ8U?=
 =?us-ascii?Q?cR3tskMujShPc+BOKGYHZPmL4bgFF2ke7vxT+UpGlHD52/ACKGm7TjMNK91P?=
 =?us-ascii?Q?xN1sN6WjtOekK2ZC7slySLvlqMtaBrsXKxLo96zGi3KdoT0ixPhtOCsrX949?=
 =?us-ascii?Q?K69mYiHjTd2+0PoSZi6/LjDCEjWUQkYkNdRx9ZEUgOkidDS3xd+ePOKgV8K+?=
 =?us-ascii?Q?WpbEYFVffXD92Xqwp/r20KMdBdCIa96daEJU8yrZfdsKxY5iOfGhlDEyVKA2?=
 =?us-ascii?Q?QJVnLMto5GPK0ncdXj2wfgwL30jAyIzSA4G3d8PFlTUBMDrBLuzJ933Qxxv0?=
 =?us-ascii?Q?mcIpoX37yUbvbaix50FK0Elb5CFuSu9EL6L0uBqPQrCrfCU8aa6sSnY2ni5S?=
 =?us-ascii?Q?d5Lwl0ZpAK3nLm8YgNj+tHz9RbrvvQhGX2bEs5ogH31gZCZbNfFtN2PdZ2nE?=
 =?us-ascii?Q?bCB7pnPwJh6NUCCUhKvVA9FlVbhc2MYkOaXfz0zJyiv7ONUZXA8GRgPnx7oX?=
 =?us-ascii?Q?szJnK1fdQGhlu/ymKW8fHVv4ivu8D3H8cPtiYMV+a/G+HRDCQ5a5jwt4dffm?=
 =?us-ascii?Q?pe/BWsaUfxb2ksyOI/Lf1CQ8LjH7q0HnTEp8mJlqWBdGNRhD+/f7OjB0C2B/?=
 =?us-ascii?Q?RE4odg1rxPEV9z81vuVoCmc4tDKkhFVifvc7sqFu9taBCLURqnAuyJEknV7W?=
 =?us-ascii?Q?d5rBkB5wMYSDDxki21AOcWWvEgaAWfgNJCu43bEXKl6oIG3+kai8I8tBerOk?=
 =?us-ascii?Q?2jGvTV/Rt/tqezuW0d/wrMJxblnFBGMw0L46nu1ohG3bnlFwwzIjqVKq6j/y?=
 =?us-ascii?Q?ItOMW+Jxy2IELdiome6rPSyYF2LtvjRMstYuGf3iScIrTQfKcJ6uZw0GxUGn?=
 =?us-ascii?Q?ty3Bz8a2hsVVmbM+HsVKuHl4R+V2UgvqZRdfLyUOszoSQ9eMUpSIppGZ5VCl?=
 =?us-ascii?Q?/wJ2PYWYP3eLnLpwevqh53zl64FL5fc+J6iINrQpjsfzIrQr3Q6AYFIY/9FH?=
 =?us-ascii?Q?9mUQZLjZ7WyYyRYBREZbXia8xUD/BfVIAXCRSm+cyB+CDhmC00ma78kWCcgE?=
 =?us-ascii?Q?F/ejl7FIC3DQuVXxm8Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e96ff0-80b4-44a1-2d01-08dd40a81fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 21:01:38.6036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 36PhI4u69floeICe6KLrVyzZ+5HrPSmPZRdVVuBYai4L2tjVYFI96BIThd8KpZF5BLj5u3Jn+y20+k7zUqqLNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8468
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: January 28, 2025 6:19 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; joonas.lahtinen@linux.intel.com;
> Thomas.Hellstrom@linux.intel.com
> Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
>=20
> On Tue, Jan 28, 2025 at 05:21:44PM -0500, Oak Zeng wrote:
> > When a vm runs under fault mode, if scratch page is enabled, we
> need
> > to clear the scratch page mapping before vm_bind for the vm_bind
> > address range. Under fault mode, we depend on recoverable page
> fault
> > to establish mapping in page table. If scratch page is not cleared,
> > GPU access of address won't cause page fault because it always hits
> > the existing scratch page mapping.
> >
> > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > immediate bind can overwrite the scratch page mapping.
> >
> > So far only is xe2 and xe3 products are allowed to enable scratch
> page
> > under fault mode. On other platform we don't allow scratch page
> under
> > fault mode, so no need of such clearing.
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 32
> ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> b/drivers/gpu/drm/xe/xe_vm.c
> > index 690330352d4c..196d347c6ac0 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -38,6 +38,7 @@
> >  #include "xe_trace_bo.h"
> >  #include "xe_wa.h"
> >  #include "xe_hmm.h"
> > +#include "i915_drv.h"
> >
> >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> >  {
> > @@ -2917,6 +2918,34 @@ static int
> xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo
> *bo,
> >  	return 0;
> >  }
> >
> > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_device
> *xe,
> > +					      struct xe_vm *vm, u32
> bind_flags)
> > +{
> > +	if (!xe_vm_in_fault_mode(vm))
> > +		return false;
> > +
> > +	if (!xe_vm_has_scratch(vm))
> > +		return false;
> > +
> > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > +		return false;
> > +
> > +	if (!(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) ||
> IS_PANTHERLAKE(xe)))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static void __xe_vm_clear_scratch_pages(struct xe_device *xe,
> struct xe_vm *vm,
> > +					u64 start, u64 end)
> > +{
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +
> > +	for_each_tile(tile, xe, id)
> > +		xe_pt_zap_range(tile, vm, start, end);
> > +}
> > +
> >  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct
> drm_file *file)
> >  {
> >  	struct xe_device *xe =3D to_xe_device(dev);
> > @@ -3062,6 +3091,9 @@ int xe_vm_bind_ioctl(struct drm_device
> *dev, void *data, struct drm_file *file)
> >  		u32 prefetch_region =3D
> bind_ops[i].prefetch_mem_region_instance;
> >  		u16 pat_index =3D bind_ops[i].pat_index;
> >
> > +		if (__xe_vm_needs_clear_scratch_pages(xe, vm,
> flags))
> > +			__xe_vm_clear_scratch_pages(xe, vm, addr,
> addr + range);
>=20
> A few things...
>=20
> - I believe this is only needed for bind user operations or internal MAP
>   GPU VMA operations.

Did you mean this is only needed for user bind, but not for internal map?

> - I believe a TLB invalidation will be required.

My understanding is, NULL pte won't be cached in TLB, so TLB invalidation i=
s not needed.=20

> - I don't think calling zap PTEs range works here, given how the scratch
>   tables are set up (i.e., new PTEs need to be created pointing to an
>   invalid state).

You are right.=20

I didn't realize that using xe_pt_walk_shared to walk and zap PTEs has a li=
mitation:
For the virtual address range we want to zap, all the page tables has to be=
 already
exist. This interface doesn't create new page tables. Even though xe_pt_wal=
k_shared
takes a range parameter (addr, end), range parameter can't be arbitrary.

Today only [xe_vma_start, xe_vma_end) is used to specify the xe_pt_walk_sha=
red
Walking range. Arbitrary range won't work as you pointed out. To me this is=
 a small
Interface design issue. If you agree, I can re-parameterize xe_pt_walk_shar=
ed to take
VMA vs addr/end. This way people won't make the same mistake in the future.

Anyway, I will follow the direction you give below to rework this series.

Oak

> - This series appears to be untested based on the points above.
>=20
> Therefore, instead of this series, I believe you will need to fully
> update the bind pipeline to process MAP GPU VMA operations here.
>=20
> So roughly...
>=20
> - Maybe include a bit in xe_vma_op_map that specifies "invalidate on
>   bind," set in vm_bind_ioctl_ops_create, since this will need to be
>   wired throughout the bind pipeline.
> - Don't validate backing memory in this case.
> - Ensure that xe_vma_ops_incr_pt_update_ops is called in this case
> for
>   MAP operations, forcing entry into the xe_pt.c backend.
> - Update xe_pt_stage_bind_walk with a variable that indicates
> clearing
>   the PTE. Instead of calling pte_encode_vma in
> xe_pt_stage_bind_entry,
>   set this variable for PT bind operations derived from MAP operations
>   that meet the "invalidate on bind" condition.
> - Ensure needs_invalidation is set in struct
> xe_vm_pgtable_update_ops if
>   a MAP operation is included that meets the "invalidate on bind"
>   condition.
> - Set the VMA tile_invalidated in addition to tile_present for MAP
>   operations that meet the "invalidate on bind" condition.
>=20
> I might be missing some implementation details mentioned above,
> but this
> should provide you with some direction.
>=20
> Lastly, and perhaps most importantly, please test this using an IGT
> and
> include the results in the next post.
>=20
> Matt
>=20
> > +
> >  		ops[i] =3D vm_bind_ioctl_ops_create(vm, bos[i],
> obj_offset,
> >  						  addr, range, op, flags,
> >  						  prefetch_region,
> pat_index);
> > --
> > 2.26.3
> >
