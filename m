Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09725CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 20:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE77A10E979;
	Fri,  3 Oct 2025 20:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ij6qfCyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF85A10E979
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759523408; x=1791059408;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PrZUeV24e1jrXXKJ/5a8oQK5w4DQkuoSxZPeFjmyH1I=;
 b=ij6qfCyhFmQHsBIRysSMMj7qPTKpqR3jiRZJ8S0dhbXQ9F7NO28T60lk
 2CB2Fve5k0m1b3MxtE4aP7ZMrLEO6J/MrGdHIPkWg5vJKK8dZdncr4hLH
 lUp12KAmUk1lkpGD6FEK1RkHMY7btlxZa6Ix5sBEH5RxcXIN52dPD0yrP
 +y2wTG6raXt7/q93qoQzSUa7EaruT/YmNrxLMG3aci/lvaJfDRnhVtdu3
 UKIvg2AmTPGkpIUMU1H+cPqbMPuKbGMtEx9s4TCtEMdDEryCoji1NFoPO
 Q/ylkTsMOpJ2Y5BIkvK4OeRiim/lWYbK1KxcpR/qU1l5r2ltb6N9PXhzq g==;
X-CSE-ConnectionGUID: xREMB8fsRdmoPzPn4jPT1w==
X-CSE-MsgGUID: HMb/KRn7ReWohYzFktyreQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="64426301"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="64426301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:30:07 -0700
X-CSE-ConnectionGUID: F1PCYqE1QRawQ5znYItrFA==
X-CSE-MsgGUID: e2aYPpZTREOOe+QKM+HS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="179797767"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:30:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 13:30:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 13:30:06 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 13:30:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUyPpirvP6Q8FrMUpaJ/ZIXM9TrV97i/EMrfeyjnPSpSpdAOj/bcSvH3I1mmMjuKNybGIKxLzwa5l07NZ1oed0qRz58va8fJqYvh0W6E+x9ymFA9AkatenIUiiD+kMKRKcOoWoTTNNVdEf8aANjv7nvDCEqauCcQb/wWEIoJx2HBa/rK/hKr9cVrmlOxoksjgk8fWb6722CeVgDnBlCDiN1K5UebsKryqf9UtYOSdNglru0BYSJsCfYUTgye670HLKyKmY8Luw/z0fc+XBkBdRnzEp4g6U+fsoNE5tyH3Vzdn6BZ0iTj2SzGGHRAKapI5Q1ZeFJZUiX9lmDy/y71lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kY0VFg+66xQZuxGGqsDHvIJ9jtddCy4ZpPKuowX1/H0=;
 b=eJrDq7at3SungCBf7nnJVO5PiXFFc05NxBSxDY3a0G4Olp5++186lpyD/c9kibpO4znTRLQE6LBvRfE2zFRaAcK7Au04nv0XABq6/ZOSO1kIOoYgLRdlocBuwx8B4rs7iMIOL/aymCmrY2yU5wwPSmBgLztqzfbo6wK+EXy9iWpngMZHIUZB3X5wk3/YL3lTaJwVCX7uI6A9KdXxEdTpe4as9QFDLQUkZ2ofFTwnYeUUWa9FGG+G+vIwR4sUUj3O9Ue0hYqXcSNAsXbIH4n3SDxhvan/D06CuhLZY4Uh4QTX7+6QXVmTdf7qVaiLcMhBTK7PvpmdroKkpV9A5+ptEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5452.namprd11.prod.outlook.com (2603:10b6:408:101::16)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 20:30:04 +0000
Received: from BN9PR11MB5452.namprd11.prod.outlook.com
 ([fe80::d38e:6977:b814:3adf]) by BN9PR11MB5452.namprd11.prod.outlook.com
 ([fe80::d38e:6977:b814:3adf%3]) with mapi id 15.20.9160.019; Fri, 3 Oct 2025
 20:30:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Make the late-initialization really late
Thread-Topic: [PATCH] drm/xe/pf: Make the late-initialization really late
Thread-Index: AQHcNJwoKY5+2imjB0yzy3xG5NoKg7Sw359A
Date: Fri, 3 Oct 2025 20:30:04 +0000
Message-ID: <BN9PR11MB5452873F8287FB991FF2C451E5E4A@BN9PR11MB5452.namprd11.prod.outlook.com>
References: <20251003192940.545-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251003192940.545-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5452:EE_|CH3PR11MB8210:EE_
x-ms-office365-filtering-correlation-id: b07ae0a1-33ad-477b-e505-08de02bba2b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oBBE5wXuW7Hwf+TPd2LvBCyBwumPgmZXhTQ+faOmlQG1B0wXx6onHs32iFAJ?=
 =?us-ascii?Q?srS5rSyvlsfd+8wVpRp6HHKRgBg42kwJq9tOGLsL7CVAbTJcNMt6o11qa5jL?=
 =?us-ascii?Q?Cw2yBApWKW7Pzk6Z+ImarZfsNMoQJ9fmAzyVDYoedW4OWfVK/QStN30HckmZ?=
 =?us-ascii?Q?VqaQNmGUmrxbcWC4Akv8rlwqQCVWkJ8/4EFY5dWXCyAQj9K8s3WylfXsCZNU?=
 =?us-ascii?Q?TbSzJfv32E5Oqwq9+yzw2Tvyik9PA+R3Qhw9juNWCMOhS4DkWoVsq+TPf4gH?=
 =?us-ascii?Q?9H2tqDVVez32Ar/UDyRzFoH1qvZqloOxUJ9RGGALIxL/5U6hzPTAXpDvcaQ7?=
 =?us-ascii?Q?G6K1J6tkua99fkL54yrPuqZQYMAXaOnUEoXRj+2f+iSpEVVYE9FzUam3bPLw?=
 =?us-ascii?Q?RNtqpdqYnnVBxbOvEC4Jk0/akQ765IsQoxK21d77BOkC2sgj8YPdpslwRZ8m?=
 =?us-ascii?Q?8icFoSkWs4xHGR9Fg8Zz3CBU3kYSDxybYEEiwN0PSVQyvJbcqZMIKwWpIqa9?=
 =?us-ascii?Q?UAVEumY56fuUOYuEGUioQm8UL9+GrHcGBqqksU2a2ufvMtScbfw6dhIJ7qu7?=
 =?us-ascii?Q?kVhQCgeQEc2sbqm51II6Dy51Awrz7kDHznkBcP50Y9Z7sRPKO3fSwLbZp0zE?=
 =?us-ascii?Q?wazAPWQpnw2EiDARDyzhXpeqwaByowFxt3yDc93uNBQo7wfeaEMy+JRolSlJ?=
 =?us-ascii?Q?u8xl+GNZ6ZyWe1iEkDSts2+LFNndY4+Y0oHPN28T+6/B0FFmYhVyAvY/TfEZ?=
 =?us-ascii?Q?g3zpVKwNkXwlAwm0r0IlhAI/jdxWDXiG1VzqshdfYzMBrkSJlLDEcSWLFUVF?=
 =?us-ascii?Q?P7zX3ZoHQHjAqrXKHgmSNOp6Wppbyqw+1i11RC8UOgbuCS8OJh7vVRHQ/LCU?=
 =?us-ascii?Q?i199w8xlAQ/MrRjtqQb6iPDfejeGkeOQP7GFZKp5Du6QqVXfwyZIorQbst99?=
 =?us-ascii?Q?/g4Sz2zMmeXMoviOc//aMnCb6Q92yzePkHtim1ql5t+PB5z5ya5A9dlBtTo8?=
 =?us-ascii?Q?dMrXjvEa3HEOvY8T07RQ64A5TX7ao/fiTK5JIc6YE7XhWEWanSM8RVMswcqq?=
 =?us-ascii?Q?cOoDuMSIa150d6hoPSdc0SWIF4pnPQXgrPsqoFcHLnw/FIQOpYzwP7VvJ3kn?=
 =?us-ascii?Q?x7i+8zC1r8NxDqKZ9t4iHIwldnvlB7Rudqs/iYJDnsilScspnJFc+biRQc83?=
 =?us-ascii?Q?dmzki9JYWy+1km+yNuGImdhjSH6iDyPZ2sqtJjZV/FUQex5GP+tGfAroPC+Q?=
 =?us-ascii?Q?OVDD0Ew/FtfOWZ5d2QWSvrENp2+xttPSkcvICAXAJ0MoE26xIjEKawOrUXiU?=
 =?us-ascii?Q?MxtKcnWDOgZr9aY9S5I/ZE4SrxtFKzzI82LPnhinOxsBc4h+3egeNQZYwJH1?=
 =?us-ascii?Q?gSIDALtk/hul3B7BGck2/qIoYeSh1wtNimqxgKRY5oWgnj0mUiZMiTdmBO1A?=
 =?us-ascii?Q?btlBNHxe4mwr5vVfmDzxn8VatQTTpju5jk5+6ADlY3fDOtnXgfvKd6uj9Rrd?=
 =?us-ascii?Q?MFye1QB1dMu70VHjdfT9/IrSvQICKiGcBzd2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5452.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SVxMjKQOugwHFrc2DRkXqufs2Madi5sQCDW7abQKmI2gBo9ZLgD94op6QnrR?=
 =?us-ascii?Q?Ni2Og3XKYUm7zhqZkDvPtC8p4fSHBVBwSpqe+j9D66LkJ0HaOwPZG91OZ6Cx?=
 =?us-ascii?Q?bOU8/Br1ezrzbOUCHGvGQrTQ4n/7ZzJRa4QAI4FpTft8bwWwbxzZEx1vUY0+?=
 =?us-ascii?Q?VmAXBRWEboffzHmZdFvDMkGc9mXAUsr6ZxTUZCFTVM28ZApA8Z5B5glT8o1T?=
 =?us-ascii?Q?v1bSnd0nZVEW9uRtxtFhcLr0NB/sqszec/sma3EL5PKH18S9mLBzecAXcTPU?=
 =?us-ascii?Q?b4Cs9Bm9DcbsaeKgPWjUgL2Hq+DytTio3zyxXp0UspQQkov6gqoh2FPtbCcE?=
 =?us-ascii?Q?+lYs7Gl9sZNCOaFT6g0qp3QvmhBR2rmkfjwEFtJR9zhsiUwBJeG2G3qqehmi?=
 =?us-ascii?Q?gQHc+JZJK6Ev23TPEiEUoGVkeI33lnYXJvELi4Nwl7+goKQH8jt3vlnceToT?=
 =?us-ascii?Q?5qsT6WhUCSZbLdynZ6VXCbJAuhY4Cm8AXeKtV3/nn0/niaowP6UNevQ0GFKB?=
 =?us-ascii?Q?SY+RKxW+2lDn0ln6no5LXATkzZ0X11Xrbbwv8jdQnpT7t/ywxDg/NTgTd4WK?=
 =?us-ascii?Q?5vlOM5puBJJEFV8/d4CIt9nqevEGrhpcNxuL6iCQi1G/tAOno0krxZgA1dz8?=
 =?us-ascii?Q?TkzAYAQkZlCgvINgft/pIk+2L9LWawxqNif3i1Gsv1g5AsKrGK+s6Og/Wybf?=
 =?us-ascii?Q?Ay7a0jfT4aYHcd4bxWiRdxVYVmS/X4nbsHUIfP80ighbghFZjIJ1a2eCXiSU?=
 =?us-ascii?Q?yEERbH3BLLZuM4sl+kFBEL3DpiPaGUHfItJxOrUNUAMP+rh2fcEWvGpDcKXJ?=
 =?us-ascii?Q?GH8w64yXMI0bsSbv9pPdwpYWAn1gB0l1CzQ8xe9vOaXTSaDlvw3aFRo/Rl+Z?=
 =?us-ascii?Q?2hlGL0PMJyA9tM1TgTNxxiic9uT/guZBzC0bdT1hIui4vtCFRfWOIa662Zxt?=
 =?us-ascii?Q?r4W+JzouECOWiOazxnvjZctZSj0ch9ry7PiqF+FoSz55f0spXSWUmCTWqDvQ?=
 =?us-ascii?Q?ZLJS+hc7ErvMvVOdyg5Pw/z7mvIvbbWAcAOK98ZKhVUIyvNnbzyctesCaRIL?=
 =?us-ascii?Q?uR4ySyHdL8u+YFTwhXacIQTJeaHZzxCr35KMiYcM+4vp/PG5EouzZGrzEkuf?=
 =?us-ascii?Q?wrXMN/9CiXnJw/xChe1Dnn7+Z5qTsYaxlDFZnL4z8/C/VRE//t4u3xQbNvso?=
 =?us-ascii?Q?bq4bD2VmlneUmr1ZX5jdwTpMSltMfxBDNgUeI8PpDvvIHuSV6P3cpsGvxESU?=
 =?us-ascii?Q?JOhdtUn0xTaBjtwKE8xX6eunStXGKn6tphB5efFH1MSk6Tp8nng1zw2qS5Me?=
 =?us-ascii?Q?EzFKYDbmerwl90ugH5hHu5rGTASXewQx6b+L6QtOtCeA5gUj+BUfKXVGvUE/?=
 =?us-ascii?Q?SJH591d9wO+h6j4fhoc9928dAVPAsasuIByDFh9mS0pFbmY74jnmLizaxB0Q?=
 =?us-ascii?Q?xSI9bqFSqf3xjr4CggkpExUkhWUsjJH48Mwanw3qX1V4W4TZisc8cRxjoJPE?=
 =?us-ascii?Q?fHWcWv4IiQY5IcXrpQEnpfakk+2T2Tg3zHa9XsOzYR1pcyAaTCsex9U3KwOs?=
 =?us-ascii?Q?hWMJt2NkdUIVurg9UdyffS3mq9wt7TYVqkUBIAxu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5452.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07ae0a1-33ad-477b-e505-08de02bba2b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 20:30:04.4982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6WvzA2qL3ntVd6/ClzaO20hR4KFNRb4Rvlljb+WUNDY0oBXoNZ1qzUydbTIvWmO9gY8FbQ0YLnDIzrza2hsOgNTXExA2CAD2I5M/n0P7Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Friday, October 3, 2025 12:30 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Make the late-initialization really late
>=20
> While the late PF per-GT initialization is done quite late in the
> single GT initialization flow, in case of multi-GT platforms, it
> may still be done before other GT early initialization. That leads
> to some issues during unwind, when there are cross-GT dependencies,
> like resource cleanup that is shared by both GTs, but the other GT
> may already be sanitized or disabled.
>=20
> The following errors could be observed when trying to unload the PF
> driver with some LMEM/VRAM already provisioned for few VFs:
>=20
>  [ ] xe 0000:03:00.0: DEVRES REL ffff88814708f240 fini_config (16 bytes)
>  [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=3D2=
 index=3D1 pte=3D0x0
>  [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=
=3D2 err=3D-19
>  [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=3D0 addr=3D=
53a470000
>  [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=3D1 addr=3D=
53a4b0000
>  [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=
=3D2 err=3D-19
>  [ ] xe 0000:03:00.0: [drm] PF: LMTT0 invalidation failed (-ENODEV)
>  [ ] xe 0000:03:00.0: [drm:lmtt_write_pte [xe]] PF: LMTT: WRITE level=3D2=
 index=3D2 pte=3D0x0
>  [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=
=3D2 err=3D-19
>  [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=3D0 addr=3D=
539b70000
>  [ ] xe 0000:03:00.0: [drm:lmtt_pt_free [xe]] PF: LMTT: level=3D1 addr=3D=
539bf0000
>  [ ] xe 0000:03:00.0: [drm:lmtt_invalidate_hw [xe]] PF: LMTT: num_fences=
=3D2 err=3D-19
>  [ ] xe 0000:03:00.0: [drm] PF: LMTT0 invalidation failed (-ENODEV)
>=20
> Move all PF per-GT late initialization to the already defined late
> SR-IOV initialization function to allow proper order of the cleanup
> actions.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_gt.c       |  4 +---
>  drivers/gpu/drm/xe/xe_sriov.c    |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_pf.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h |  1 +
>  4 files changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b77572a19548..8fc3a6929d6c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -573,10 +573,8 @@ static int gt_init_with_all_forcewake(struct xe_gt *=
gt)
>  	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
>  		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
> =20
> -	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> -		xe_gt_sriov_pf_init(gt);
> +	if (IS_SRIOV_PF(gt_to_xe(gt)))
>  		xe_gt_sriov_pf_init_hw(gt);
> -	}
> =20
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.=
c
> index 7d2d6de2aabf..ea411944609b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -167,6 +167,8 @@ const char *xe_sriov_function_name(unsigned int n, ch=
ar *buf, size_t size)
>   */
>  int xe_sriov_init_late(struct xe_device *xe)
>  {
> +	if (IS_SRIOV_PF(xe))
> +		return xe_sriov_pf_init_late(xe);
>  	if (IS_SRIOV_VF(xe))
>  		return xe_sriov_vf_init_late(xe);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sri=
ov_pf.c
> index 4698348c010a..2814f29f1093 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -103,6 +103,31 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>  	return 0;
>  }
> =20
> +/**
> + * xe_sriov_pf_init_late() - Late initialization of the SR-IOV PF.
> + * @xe: the &xe_device to initialize
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_init_late(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		err =3D xe_gt_sriov_pf_init(gt);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_sriov_pf_wait_ready() - Wait until PF is ready to operate.
>   * @xe: the &xe_device to test
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sri=
ov_pf.h
> index e6cf930ecde4..3d5437fc5b63 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -15,6 +15,7 @@ struct xe_device;
>  #ifdef CONFIG_PCI_IOV
>  bool xe_sriov_pf_readiness(struct xe_device *xe);
>  int xe_sriov_pf_init_early(struct xe_device *xe);
> +int xe_sriov_pf_init_late(struct xe_device *xe);
>  int xe_sriov_pf_wait_ready(struct xe_device *xe);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_prin=
ter *p);
>  #else
> --=20
> 2.47.1
>=20
>=20
