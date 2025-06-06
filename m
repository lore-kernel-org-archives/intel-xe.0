Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322DEC5B555
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 14:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE2B10EAC2;
	Fri,  6 Jun 2025 14:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M65tCd71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B60410EAC2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749219354; x=1780755354;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zirWKHXWK4N1dzORWTLMajwUbwlfH6TwmyuaoOMWIEo=;
 b=M65tCd71Qe/w7hEym35u7Br0lYtitGnu7f6Xv2c7FkMaCrJJGtgVPmI6
 +OY+JjEFFsrCOFK9v5UIqd9UPJuho86325idY/t/js5QSzftfIaoqBJ0B
 c90LkXKqhODXQfAdywqosoXcUrp2p1Ua0IGWpj9UPzfHoDwJ56a+GvxgO
 SrPmD+PvW4HC3W6FCl8J+YE5cJvmctgLFVVRNClwLvkErXfPVg0eas7fG
 JFb8QnMbORmW5znG4B4y/pEOSJXCxGworEnDa3S5zyGqvrTFUHUdtLHLO
 ZMJJoGej23r8wO+Did998lpCgnToyW/eDNWEZFoc8LZrgWJQfe4SsthTP g==;
X-CSE-ConnectionGUID: Ozy8vherQSq4vk8jXVM9yg==
X-CSE-MsgGUID: CcToXloaR0CUPOUeaxCzhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="50482934"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="50482934"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 07:15:54 -0700
X-CSE-ConnectionGUID: BPd1NlqeT4WmBb1uoOR7Ww==
X-CSE-MsgGUID: ZEV5uOxZT4aG4ILQR+bqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="150999743"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 07:15:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 07:15:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 07:15:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.75)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 07:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJQ0SctXIOM134tYtGvE322/YtwKF/sNgkCbIgHPo8lyJNmUskAxEa3a2Fv85r8VZA/J6KmQXSvboyOwgmMHL+YLJv5/8PlMsDGZx45JtMnqwoAEiIxWSdoDssOaqKONJzrr6gJXMyPREC8xOvMnGQTl7lFQ/1HnrZWVFIPKt8FkIg+F+dU7uDI0tntvokqxHgNuUy+FXnBa5qpS7GsxG6NCoqP38FQ+RNltM3ZpOY2KKqLCav+hb8dHD2wH+RgNWgPV43ZXTsf3U7adV0e6PA2/FhNuqDVmsPFoFRF7C7wOCUZylDss0io88LcxZLd4LvtowElqM/eewFW/g2IRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cv0YWwHFYOAMIpibhEEA7S2mQfNKvuUEu9F4R9k0Rk=;
 b=Kgi6Rd9ps2GUZXGAKPW8iIMGsG+BXxkVcvwiOv3NURUCA1rZmtZ8XQMesKTjEoeqhR42eLZtfcrsxAv/vv18Fw5p05kQKlX+RvqmNR88/kDDPBb8968t4X3STh7+G1AbJTx1wSoAW3HmqQcuxaxTCh3fBle18tKbUmT4AMC4WA0lCoM1IcZgclgiEPAuBd7aQK6Mnp5vxHP21hhBLgE+eXJlSCIh9kgo72zFkNMIWNbpYP1mY7oEgqMZB1Ji8gWg5YNyHTv8obnPO6Ghbar93lcVE/kjiyjB06ZpIG3E+io/1I7i3hjZxMdFNK6wihk0x3vbfQg3yHhVepLV2nVdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 14:15:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 14:15:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Fix early wedge on GuC load failure
Thread-Topic: [PATCH] drm/xe: Fix early wedge on GuC load failure
Thread-Index: AQHb1mhuDSjt7p/MoUqOvpZmZk9BALP2K7Rg
Date: Fri, 6 Jun 2025 14:15:49 +0000
Message-ID: <CH0PR11MB54449E47E24B5C978F0BD0C9E56EA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250605222256.804888-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250605222256.804888-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB6805:EE_
x-ms-office365-filtering-correlation-id: f0a49606-d069-4f5e-38cd-08dda504a386
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lxZNz/Tzb1QHGCP/IEorM/bFKJTRT8xfExHjnjQYCPejJNCD39JzVRbifNzS?=
 =?us-ascii?Q?IPmJvsZmoRS/Mc8Ob7xz3sB2+j5s1DvCKPGEYAYZ/Ky2PxQ01FvYDFpahRLe?=
 =?us-ascii?Q?BC2qiStfxni+/sYmpdGFonb76lPf+P3lwzyCen6HH0GGYxyQzOsTHpaMu+kj?=
 =?us-ascii?Q?gcrH6v+nXoga+qcCTg5MY0OkTG6+mWTuCGInki2xmyl3jw88Y1jxcwExFcU0?=
 =?us-ascii?Q?NELn+Cvj95+NAODG4WmpEzhzPlLxZ1K8yr9QaSsWvpu8IQX70N9oP35K2VZN?=
 =?us-ascii?Q?OBeJJ274OnddggDi04laorQrfvH/m3QzoqJWET1mSqtpYrRXbJjPW/G3g/gv?=
 =?us-ascii?Q?dnCO3XG3l3YKYfb5neU9DVs1+6mHAFW4rVCZWD2BY4+pdsldw6TIPQqmJzsx?=
 =?us-ascii?Q?dsr9394T4DAIACnn4phnFMvi/C60OQECiFiFp5DuwcIICeVF/or51oT8yXat?=
 =?us-ascii?Q?lIe4MvvJXQxCnMYvH8kff7y/TuQw0VsdaaHb7ymd09o/biSr07dX60I9qQpU?=
 =?us-ascii?Q?kT4XfnLP+G9vSZfsL9gyzFdaGW452Su0jPzD/5q/Dc8le9EU0ffi+7YA1pPT?=
 =?us-ascii?Q?ZL0MNy4j+rnAWCx8rutQ5E3YneIsqGy+h9JFlMqA30NGLeWXYv7n3C0bb5KK?=
 =?us-ascii?Q?Z9uyMkHYRgFyWByjIyoItnELGxzO39096WlgNO9QZ905zpwHWjM8r1AJ7MSR?=
 =?us-ascii?Q?traGqyGgF7XtglZp12MOtlHTdOPS9twgIV5AWFqEiWoq6q/evf2xeaIfT6oB?=
 =?us-ascii?Q?uPM99kuCRW9dOdHptW5EE6gDvJavyHBsi9k5A0BUJXpSxoUxqwHMvtcqZvE/?=
 =?us-ascii?Q?bqhjXzEcPzH4w6A4DdSpIlwkJXtEOa1M56jWKAgoOSB4v/ArZLF9eeP7FkdY?=
 =?us-ascii?Q?batQBrLIm8wRj4lvXeGDwvXWorPi0HxhLUKolomyMx+TAO9esh3bP1+n7dTo?=
 =?us-ascii?Q?l/mRyLd2XjZgJMBFtOhBetotAGUmkTzhwtc10tyc0WLsm9zxGlZ4t5ZO/UN6?=
 =?us-ascii?Q?QNHq6O29VN+xXZXWWOFTKtqGQUYUjnGOLAangWNJAKnQduxCBLPKoAhxt6+E?=
 =?us-ascii?Q?KRCdV3NBDTJoFOh6gPYQcVEJ494QCSSS0HOraul4TLBU4xcNelfSc2P96GRv?=
 =?us-ascii?Q?tumlbpRx50Cc0/+Ik1r8uGyUGm7GHUralp5mmZTExVXFvYLKOH/PX3hVaD9f?=
 =?us-ascii?Q?wjYaZtvlR13G43whkZkP21o2QHzgalj1nmxBxvmlnbbE71uJGYpgw3eKrqxK?=
 =?us-ascii?Q?tSbCCfo5pxjLmpoEW4Erd2r+VPkBkkv/ik81n1dr7fH4aeJxVmqrbkv1GlJ3?=
 =?us-ascii?Q?d3zZXy/IHtI1tX5ZjHR09ODtAynzrgqOWi4QB6j1QrP7azQealPunx8p7T30?=
 =?us-ascii?Q?zedt72+l+voMKOXVNHWUAp01sEnZHLA6KWGey7rqSeOaHDWhjpqtWho4TWnt?=
 =?us-ascii?Q?3XrnR12KU2EL62K6g+ruYzBbdGdvOq2sYxVupvViKZyaJb4yY7/gGhZoPzXg?=
 =?us-ascii?Q?lhNT8Bdb7tP6EM0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MM0XbNHKGQmU3ozhEpXfc3oqv78IVoUrvOKnx3K2BLpJntKyX6lwjWSPDAR3?=
 =?us-ascii?Q?8n7gBJJQ4Szkw4torxqlToYBnKqrERrI8bt7SEkR7Zp2TOb6JgyrTnLhuGyY?=
 =?us-ascii?Q?+ZmkGMGmcG3tWgvY9qRAsQespdXEFnKQB29Jg8lwzeuFWFteXzTpVJJV9Gy6?=
 =?us-ascii?Q?E4yl40EJQbT+UpUH9qE8UFNUk78+GNcLgWfJP0Br5QgnfWQmsY3ACdNuaa5V?=
 =?us-ascii?Q?q7w+b+W6vLQAxEDA+ZWuMPeu73qe1G8+63Us/cN00G3Q4CdDpqC0UTvHehDD?=
 =?us-ascii?Q?LIMHlt2L8kiaVhkasIPWS9JpmmwHngEwrPymC4RDhXxZBjuPMHOI5gidACtN?=
 =?us-ascii?Q?rSPo1psmFG97dKADvwGcDfBEQ0eTBA4mK6WJzNc29w4Acpeep4d7a5nrdDJD?=
 =?us-ascii?Q?IA4gKNMDI6kB3R0BoI6enie2jcqoJXldBxsoSuyvjfIz4Oq8rFp+dI3CzDBK?=
 =?us-ascii?Q?dBTlDrNIPn7FFNtjVToZHhB2b3JpwoW6D46zVH+WcbrAqAuCPtSvPN+g/x15?=
 =?us-ascii?Q?jXACL6kU767kLWgf2nUFBoFATFrWi53y4i2iwXiZd3uxebcJ7/RBY5yy3T64?=
 =?us-ascii?Q?ZOxKE958nvPKq9LpjX/uXtKglofMKu0srsPy6JTzu2LUytkWTEc6JzmkG00w?=
 =?us-ascii?Q?4OetzUaEkSJyyEcHesm0/+BHb7D+uguFDVpd1W27ge5hOfdm5AAQtnr//Y1r?=
 =?us-ascii?Q?EhZz+TJr8S0M16Fkc56Xpvc1aVDyvVF8x2lCaS55ka+bNDDV2MGMzgsL/FgW?=
 =?us-ascii?Q?PXmdaLjNOsP9bqe5pV1lZ68guEGcBge+p8j9LKCnjOColIa7guGePJtMPdCv?=
 =?us-ascii?Q?VXuxseGsuQYQG3YjJEkuSU736yCT0x64AnxXjK0SNJqTR4tSsIx6hDM6QVlc?=
 =?us-ascii?Q?Z5mb0M2QQuIorQzao1bebqWiw+8t4CtDDtrCTKPEF+OI2hi7o3CkOpAxEt3R?=
 =?us-ascii?Q?eT7ILThq0tfPtWrM+zQG6AcG1uWp/NZRdfwy8/1PAQnLhtvkEemudql2MUti?=
 =?us-ascii?Q?HRh//lbii82p/aMl6bDGUoiix8AIc7eIm9EMTEo7RSMHdrSyorxo69pSUmNk?=
 =?us-ascii?Q?m/nxcE3IYWH0Jhy7zUKucjG+HfZ66VHdSLaN+/RKtyEFIoKsQKviC3l9xLJy?=
 =?us-ascii?Q?g5k2VwMjdUtJtUQ6Zc0rSyWYJzkF+4xbJTsWDIau21qyG7qbmapQapJykqrA?=
 =?us-ascii?Q?6u2rjks84ocJKTsO1sWf+PVvIZe9YnMF1AU4HLBPX49dxmkuKPAGpvH8cfGk?=
 =?us-ascii?Q?TIoEp1d4vuvzWHA5hKL26YsP0AwDm+0W3a3U2kA6PkZnIliYktWbTGLGKUi5?=
 =?us-ascii?Q?xf+Qbb2rzklwpEI9Y1salKOVAg9Qxaa48UDrCpZJiCXe1LnvEENR89AMOLy9?=
 =?us-ascii?Q?qFGr/BVShhyUOVbgCsO9t8wSdR7lDUjoYUqM0YDT8uyfVfyCF2P8sy41lqRT?=
 =?us-ascii?Q?SD0Wg7siZv+Yy/b9GwlB5T9shfT2vmbGylR4XRihzIMjKUTgwhO2LioYtWhM?=
 =?us-ascii?Q?X4O3wykD8AW698L6VcTNIur9wcowv3yBa7AipB4hfhPnhoyMy4XZDbEDb/dj?=
 =?us-ascii?Q?1TKIL3kjvscBCcQZO5XfkLc6nY17bvHevySmcOty?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a49606-d069-4f5e-38cd-08dda504a386
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 14:15:49.8109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8j7lvxOcZhiwkaaffw8cw6QJckgqH1GIrKPa9loRTW7lSnce3Fq5LQd2TIvg0AyzN5BsSVgMNe1S4f6trgvS6R55EmEpUpq+Rmeho3r3dBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
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

-----Original Message-----
From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>=20
Sent: Thursday, June 5, 2025 3:23 PM
To: intel-xe@lists.freedesktop.org
Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Vivi, Rodrig=
o <rodrigo.vivi@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Cavit=
t, Jonathan <jonathan.cavitt@intel.com>; De Marchi, Lucas <lucas.demarchi@i=
ntel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>
Subject: [PATCH] drm/xe: Fix early wedge on GuC load failure
>=20
> When the GuC fails to load we declare the device wedged. However, the
> very first GuC load attempt on GT0 (from xe_gt_init_hwconfig) is done
> before the GT1 GuC objects are initialized, so things go bad when the
> wedge code attempts to cleanup GT1. To fix this, check the initialization
> status in the functions called during wedge.
>=20
> Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>=20
> Note that this patch depends on another fix in the same area:
> 	1e1981b16bb1 ("drm/xe: Fix taking invalid lock on wedge")
>=20
> which however was merged without a fixes tag. Not sure if we need to
> propagate that one through fixes manually before this one, or if we can
> just fix it when this one fails to build in the fixes tree.
>=20
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 7 +++++--
>  drivers/gpu/drm/xe/xe_guc_ct.h              | 5 +++++
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 3 +++
>  4 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/dr=
m/xe/xe_gt_tlb_invalidation.c
> index 084cbdeba8ea..e1362e608146 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -137,6 +137,14 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>  	struct xe_gt_tlb_invalidation_fence *fence, *next;
>  	int pending_seqno;
> =20
> +	/*
> +	 * we can get here before the CTs are even initialized if we're wedging
> +	 * very early, in which case there are not going to be any pending
> +	 * fences so we can bail immediately.
> +	 */
> +	if (!xe_guc_ct_initialized(&gt->uc.guc.ct))
> +		return;
> +
>  	/*
>  	 * CT channel is already disabled at this point. No new TLB requests ca=
n
>  	 * appear.
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 822f4c33f730..e303fec18174 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -517,6 +517,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
>   */
>  void xe_guc_ct_stop(struct xe_guc_ct *ct)
>  {
> +	if (!xe_guc_ct_initialized(ct))
> +		return;
> +
>  	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
>  	stop_g2h_handler(ct);
>  }
> @@ -788,7 +791,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct,=
 const u32 *action,
>  	u16 seqno;
>  	int ret;
> =20
> -	xe_gt_assert(gt, ct->state !=3D XE_GUC_CT_STATE_NOT_INITIALIZED);
> +	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>  	xe_gt_assert(gt, !g2h_len || !g2h_fence);
>  	xe_gt_assert(gt, !num_g2h || !g2h_fence);
>  	xe_gt_assert(gt, !g2h_len || num_g2h);
> @@ -1424,7 +1427,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg,=
 bool fast_path)
>  	u32 action;
>  	u32 *hxg;
> =20
> -	xe_gt_assert(gt, ct->state !=3D XE_GUC_CT_STATE_NOT_INITIALIZED);
> +	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>  	lockdep_assert_held(&ct->fast_lock);
> =20
>  	if (ct->state =3D=3D XE_GUC_CT_STATE_DISABLED)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_c=
t.h
> index 5649bda82823..99c5dec446f2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -24,6 +24,11 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_=
printer *p, bool want_ctb)
> =20
>  void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_s=
hift);
> =20
> +static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
> +{
> +	return ct->state !=3D XE_GUC_CT_STATE_NOT_INITIALIZED;
> +}
> +
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
>  	return ct->state =3D=3D XE_GUC_CT_STATE_ENABLED;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 26acc3d91e68..408eeeb78a0b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1765,6 +1765,9 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  {
>  	int ret;
> =20
> +	if (!guc->submission_state.initialized)
> +		return 0;
> +

This change here seems like a bit of an outlier compared to the CT checks a=
bove, but
given the purpose of this patch is to prevent us from attempting to reset/c=
leanup
uninitialized GuC components on wedge, I'd say this is correct here.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>  	/*
>  	 * Using an atomic here rather than submission_state.lock as this
>  	 * function can be called while holding the CT lock (engine reset
> --=20
> 2.43.0
>=20
>=20
