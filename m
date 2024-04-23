Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A681C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 03:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5243510F501;
	Tue, 23 Apr 2024 03:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAkwpSos";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827010F501
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 03:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713843150; x=1745379150;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JPdUhAdMbCeew4bXlZPHyo4W5hZb2Qb1mJOGRSnLuTk=;
 b=KAkwpSos5ArxjNwGwLQGo+xdPkVmPw54sxzkrO/zpXHxH2nkBYIRq+YZ
 tL0wYk5APRNHoZU4xtH8Imj0Ljyy79sTIjThVD3Do3TE0lXhXx3FyIiJW
 w663z+8BTK2FL7wd0TNdWfYuev4HXhhejSOWiS5gUCTxgE+frGunFbFKQ
 TAAkJR+ayuDpGVz8aYN6wNVGast3qxeMMVnmkPlFN8F5rH6asSb1IXebi
 in5uynneI6lOyt6Hkp4eWyDBR4kB1KM8YRkO5R6WHmZZvMOCssp1XfYTV
 f54FxPI3jjaMFN0hOABpG3RvpNL96kIX/VzSxxcbqRmJ60MY4pkPtd0jH g==;
X-CSE-ConnectionGUID: DslxOpTGTr+YQz1mE0ENKw==
X-CSE-MsgGUID: KCMK68LnT0a66K+uNqG0sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9576866"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9576866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:32:30 -0700
X-CSE-ConnectionGUID: 4Dp6WjAkRyKVeSgAx6D8KA==
X-CSE-MsgGUID: F1iakF1lSzOITz6vyO5MEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28882709"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 20:32:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:32:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:32:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 20:32:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 20:32:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qct+pmwGikJZkuBYMd7ylvAxa4idZ63PHEWisKdLbLYGfAL9mvtn0ZuSscw+5Xo1HFd35BhOcP+kv4S4aQ+2uPU639XB2o6fStnGfAO1W3HJ0tY3Af7lWarUMwsBLby7mqByHjeYWZIZLR8aSjHqHWaW61gN0Pzkx7siGed1WdKic52vMveVMWTMcVTau81MS2QWnP0gNRAF5S3X5k/cy2R1rLQ25wmvH99o+km5Vruw6dmVE/wAgwbAc32qUYDMbCVUpygaXWrIgKHWpIONhAjiBJCYKYBvV3/smZgpfcR3ooKvEVUnVp3sRUKcNXcL09zzCxZllo2Z3HRE+K3cLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9j+Zl0ApWwZBC/9JTV6DpbJxuYf43qmC67E4p+T6+g=;
 b=XtBY4qifyx6Wx1Vg8A7hBCm7HAZHqFIh30KQzQbXXCcpc3j96OsQORGShieO2TFJpl5TVGCYajBVpXpWzLue/s45ssNQoLWiJ5qV/Y2sguHTjn7GOPdtRaS0HDQzmdugjv/HrTVlJij85cnvBDfB5gXrIa5PyvyPRC18ooj8GXCy41yieFek8oloeTz4YQYKd2TGxvJX2gImpWO/fWMJcK3oTJZZzoQI3ygODimHzaLkQOdaLVEoHwgfuRe00MKj79ExFj43H8gl7ocl3m4t84B9D5GNm8VsTozYT0ea3IbLVhywHao/olNWd0dRAhy7NRGwYoSot602IcrRDX4Inw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 03:32:27 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 03:32:27 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 03/13] drm/xe: Move migrate to prefetch to
 op_lock_and_prep function
Thread-Topic: [PATCH 03/13] drm/xe: Move migrate to prefetch to
 op_lock_and_prep function
Thread-Index: AQHaiwmiIx9LRT85vUqUHit7j/MI87FudSJQgAGbIYCABTb/IA==
Date: Tue, 23 Apr 2024 03:32:26 +0000
Message-ID: <SA1PR11MB6991A4D464D9559ADE79E3A892112@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-4-matthew.brost@intel.com>
 <SA1PR11MB699182390BCE532BD3E5939A920E2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZiLLl1GhRKmVsHrE@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZiLLl1GhRKmVsHrE@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB8414:EE_
x-ms-office365-filtering-correlation-id: 192f41f5-ed0b-41a2-a0fc-08dc6345ff86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?l6MF5KipTQSTB/RL9zOqpD+jKt0fEu4TNx+P91rDFGLAAe1FqynlOHh2K4Dc?=
 =?us-ascii?Q?KKrrl4byxtySZJAtbF6O1/yfpSxJnTkLZFCmt7uobtuI2l+an85AmvJuovD0?=
 =?us-ascii?Q?zW1vZXbN0egB1DfP21XBm8UTmv71dinEygz1X/+0w/hue3bEN0iE2cCxQk3D?=
 =?us-ascii?Q?mE0RYoOi2EsWjzOcmBrB5LXemrR2rewCeW/ySvZ2tnUfMz9ahbe5kF55bm8i?=
 =?us-ascii?Q?UjRVci9qQqWV+cnx/ms2TeLs11EUuBJIsFrU3pdtUZV9jt1r4LrO+YzFaCP+?=
 =?us-ascii?Q?hvrItnlSTh1Ix1txUuidDYkLu7j6yhFvYoKqyjGHLPWDdnLZIpFDBWgSunXG?=
 =?us-ascii?Q?tfFHNogW2r1R9+wT3ziNclzN+sy7dA4VDCSahFIDBcYJrlXTzOpV1/2PAys3?=
 =?us-ascii?Q?z10RwT2K9Xfwdf3cf5WrhBtu6dO5g3Wey9hrAj4CAad7oSG2h5t5sY/ha6yN?=
 =?us-ascii?Q?hXPk9PmC9oGHiwwFXyGDbhzHGuNEd04s9yLXlGsXjqK9aD1OsW001pyGHoVz?=
 =?us-ascii?Q?AxUyrKifLHI+IjqMk9rld9cfRZDxC1CVIy2BJfqgDmOFjJn5A+g/GtD/99px?=
 =?us-ascii?Q?m/9TPBgfOwfx5dMY5Jl8/Oo2L0pGA2a5Ry/+TURQtyTdph2VfFJTo8XL1hiJ?=
 =?us-ascii?Q?57cQXltY3Ljqr5Bghktc3FAuSN4WBITSVJIvCaDclrbxXWSJe/qE3Tf3iA8j?=
 =?us-ascii?Q?7DfpR3gd9tO7GWerfcP3F75y2od+/YzLBpAt+Wxn8XpDnM3bmm0gZfh2pT2W?=
 =?us-ascii?Q?tXmCMUyf308nRzLNHRMrBG5qRDLPHHZ1FSTdDtT7+gCxvKBzPW5ayw2SUhW4?=
 =?us-ascii?Q?nr67B9czSw9codTU/f90dwosbixOPmtJi5hgXZeXxTyRXR+VrPj51Hx+hU5A?=
 =?us-ascii?Q?cmRA7VxELIhdq2lt/Y+I4DwzePy8StPTi7DT1PENvAyDGxy8OH3PsDkCxL61?=
 =?us-ascii?Q?ncSEtD2ArDTT2Kp/RdfFpeOmXBYMleOr8N7j7rhD1+s5mUi6xEbMMQ9bbx9E?=
 =?us-ascii?Q?cAmtxDsNmc6LJ6E+2M56FJxfx9dPK2kT5nRuytc0nMRnvJUqpRUqtnZuWPuR?=
 =?us-ascii?Q?yjUMIqKvT1duhk1dNniVlwcBcx94ZFmDnzz40kFjS0e9NWvOa0QbJEJeTeX8?=
 =?us-ascii?Q?7pS8rAtp0N1hcY/anb8N9X9HXkW9VymSyK96CwuDpKaUdRxK5N/UEfiqs6Rc?=
 =?us-ascii?Q?fChP60iCbDGf7vhJsN1xxR2KOtlBaKjG8GYdWYsh6TuENciepSWI59t276Bn?=
 =?us-ascii?Q?U1kI05+s8OsH6f5DUHEwddc0Cy6Xs43DzbbBtCTpew=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r1g0ycjuSRT+1hfgKcRqhcNe99vkq11yKPlBI/QCc0WKpjk/eSQRJLEjX+7J?=
 =?us-ascii?Q?lbLRHrWEvRXvkUuupbImEbnZSyDrWIvZX2JmCVLhbGSYZIgnL59NVUFM5I9j?=
 =?us-ascii?Q?mMU7SOZ3jDpyzewFuFlK3C0MumH3cFppoVsbKetvGLdMzhy+dpH2PL5VwaIy?=
 =?us-ascii?Q?km0gFsrB0ocxFR5oAqxZrkgP+t4EPfowf6pSzIVWo+dUkq6ez7H2S9yFjjcf?=
 =?us-ascii?Q?gUPGkGivfW8M4bykOuPBouaPDIV2uxgkqifE9OgLQXyq/2HLFQtgY9IYZrfL?=
 =?us-ascii?Q?b/qnpzD7ztDRZg5g4dobMdk5MAXQBXUfU0wY9kZOp4w7KHxzzghMeT3bsNYU?=
 =?us-ascii?Q?eWpvgsUZJj5CiLwGITWQCT1KEt6mMBdPczLgT5J5ygHCWzub6QKEn9DaCuPz?=
 =?us-ascii?Q?lcYxQfovcU5D4ItCiyZcnBQ32L7pn1Pdmfxvum2h19pJFEFxnPU91kjOO4wN?=
 =?us-ascii?Q?xT3pwLPevq4fPRCf23lHDv2TeD/Fd1yyVOWjXtd+i+cUkUwQFmRT02+5uIAV?=
 =?us-ascii?Q?VAzwcAx/DIc2ZU99IZHrt7fV6eOUxy6hz1n9iTKVA5PhuWL/dENRK/QFD8PQ?=
 =?us-ascii?Q?6RT1Q0qoPjU9mdkc8wsPnWd/MmYq/+enoML55r8vwv/7e/rr66H/w+1Vsk6B?=
 =?us-ascii?Q?tXKtNYi2I3UfpC8MJ9aa3HJ2HW9l+R+CjYbJlMVoo3qdGdsgl70sTydNvY6F?=
 =?us-ascii?Q?+2aGx3EYUe3GB14fjWHb1qH15FJmDsfgXuUJzzJ7L23oNiU96J3Dp6JeAO7w?=
 =?us-ascii?Q?uYaxZL1wrQQvzfWwDtpd6LnV+sDxvnOT2zV6cXgaVOgPqtA23aY2trjBi7Wb?=
 =?us-ascii?Q?0759OAM49Gz/NHNZx+S9VjHfhxdR3ZRR8VDfWLB4Z6odr8HsYXvMdYDBFPdQ?=
 =?us-ascii?Q?NMOwq+4ldLn2pyWZmZv5IhiJFPFQBFgfFSAUf51YoXz0Jaa0kL4mOlLQmBpo?=
 =?us-ascii?Q?lRNRaGIqjubSP0LIqWTIYwlpoSg3kT/cls95a021asNev5RW4dSKpt+un78A?=
 =?us-ascii?Q?fL9vLd0Iu8W9ioaoVqZ69i33esPQQGBYya7OY0dv+6QI8Gq102jPkxeN0Dse?=
 =?us-ascii?Q?Un5++Eo9t4j8occ9RdFsObLc/BqZ/tnFXcHTmQnhysPVY9IKLVsC7mmL+9hY?=
 =?us-ascii?Q?swdpnJg3Bv+34Bru1CpGZ/G2O6YAcjYApG5YtXKLr5MiqWP+4WVatLFUUsD9?=
 =?us-ascii?Q?6T9bJoiwSUfKOYNkpXDd2HQQ96bAHXtBQiKBmwUy8LjcTKlhvI3/H+o6FNHb?=
 =?us-ascii?Q?6uKxpvka1xhGfSgqNZ0d6yzZnvUTx4XqMLtkJC0EYz9HvZFuZ/862C3NS1Ng?=
 =?us-ascii?Q?2H4JdkZbYamEAPxliTluw608W5Y3O+NpW32k4dT7uS2kA6tAd1XC3DsHIapf?=
 =?us-ascii?Q?APJEJ6yN144P04lbJu1+GSVClorSgXjYeS3ufDSa73rg2osG4qZjA7pYtVW6?=
 =?us-ascii?Q?0fMvKA75tKkt+Hc/INHw4uzIpUnSwuwockigWnqtkU9pOpdDZQjWFI/99ZOG?=
 =?us-ascii?Q?wZ7NpqllRkj5HlKDENZIcSxz8fmuO2oHbvYTvVdoEv7PaCMZ3bSu+kLiLANc?=
 =?us-ascii?Q?1xPdEl08ITEpNElgc5I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192f41f5-ed0b-41a2-a0fc-08dc6345ff86
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 03:32:27.0093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7zXFPRNunQotGaY+XPEj4c8NB/cOfPHpAmUj1YkqigpMtU4UZSF2n4MtlSP3YzNaiSzD0OUcjCO3rRIH2mWaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
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
> Sent: Friday, April 19, 2024 3:53 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 03/13] drm/xe: Move migrate to prefetch to
> op_lock_and_prep function
>=20
> On Thu, Apr 18, 2024 at 01:27:13PM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, April 10, 2024 1:41 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > > <oak.zeng@intel.com>
> > > Subject: [PATCH 03/13] drm/xe: Move migrate to prefetch to
> > > op_lock_and_prep function
> > >
> > > All non-binding operations in VM bind IOCTL should be in the lock and
> > > prepare step rather than the execution step. Move prefetch to conform
> to
> > > this pattern.
> > >
> > > v2:
> > >  - Rebase
> > >  - New function names (Oak)
> > >  - Update stale comment (Oak)
> > >
> > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 30 +++++++++++++++---------------
> > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 84c6b10b4b78..2c0521573154 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2039,20 +2039,10 @@ static const u32 region_to_mem_type[] =3D {
> > >
> > >  static struct dma_fence *
> > >  xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > > -	       struct xe_exec_queue *q, u32 region,
> > > -	       struct xe_sync_entry *syncs, u32 num_syncs,
> > > -	       bool first_op, bool last_op)
> > > +	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > > +	       u32 num_syncs, bool first_op, bool last_op)
> >
> >
> > I am wondering, do you still need this function? The original prefetch
> function is migration + vm_bind. Now you moved the migration to
> lock_and_prepare step, only vm bind left...
> >
> > Even if you keep this function, we should change the name... it is not =
a
> prefetch anymore...
> >
>=20
> I'd rather leave as is for the following reasons:
>=20
> 1. The code is slightly different and skip the bind under certain conditi=
ons
> 2. It still implements the prefetch op so name applies
> 3. This is just a staging patch and this function gets deleted once a
> version of [1] is merged, I'd rather not squabble / nit pick code that
> is temporary. The goal to not regress behavior while making progress
> towards [1].


Yah, I eventually found this function is deleted in below series... Patch i=
s:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>
>=20
> Matt
>=20
> [1] https://patchwork.freedesktop.org/patch/582024/?series=3D125608&rev=
=3D5
>=20
> > Oak
> >
> > >  {
> > >  	struct xe_exec_queue *wait_exec_queue =3D
> > > to_wait_exec_queue(vm, q);
> > > -	int err;
> > > -
> > > -	xe_assert(vm->xe, region < ARRAY_SIZE(region_to_mem_type));
> > > -
> > > -	if (!xe_vma_has_no_bo(vma)) {
> > > -		err =3D xe_bo_migrate(xe_vma_bo(vma),
> > > region_to_mem_type[region]);
> > > -		if (err)
> > > -			return ERR_PTR(err);
> > > -	}
> > >
> > >  	if (vma->tile_mask !=3D (vma->tile_present & ~vma->tile_invalidated=
))
> > > {
> > >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > > num_syncs,
> > > @@ -2592,8 +2582,7 @@ static struct dma_fence *op_execute(struct
> xe_vm
> > > *vm, struct xe_vma *vma,
> > >  				     op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > >  	case DRM_GPUVA_OP_PREFETCH:
> > > -		fence =3D xe_vm_prefetch(vm, vma, op->q, op-
> > > >prefetch.region,
> > > -				       op->syncs, op->num_syncs,
> > > +		fence =3D xe_vm_prefetch(vm, vma, op->q, op->syncs, op-
> > > >num_syncs,
> > >  				       op->flags & XE_VMA_OP_FIRST,
> > >  				       op->flags & XE_VMA_OP_LAST);
> > >  		break;
> > > @@ -2823,9 +2812,20 @@ static int op_lock_and_prep(struct drm_exec
> > > *exec, struct xe_vm *vm,
> > >  					    false);
> > >  		break;
> > >  	case DRM_GPUVA_OP_PREFETCH:
> > > +	{
> > > +		struct xe_vma *vma =3D gpuva_to_vma(op->base.prefetch.va);
> > > +		u32 region =3D op->prefetch.region;
> > > +
> > > +		xe_assert(vm->xe, region <=3D
> > > ARRAY_SIZE(region_to_mem_type));
> > > +
> > >  		err =3D vma_lock_and_validate(exec,
> > > -					    gpuva_to_vma(op-
> > > >base.prefetch.va), true);
> > > +					    gpuva_to_vma(op-
> > > >base.prefetch.va),
> > > +					    false);
> > > +		if (!err && !xe_vma_has_no_bo(vma))
> > > +			err =3D xe_bo_migrate(xe_vma_bo(vma),
> > > +					    region_to_mem_type[region]);
> > >  		break;
> > > +	}
> > >  	default:
> > >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > >  	}
> > > --
> > > 2.34.1
> >
