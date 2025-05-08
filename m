Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A00CC3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 14:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E98810E92F;
	Thu,  8 May 2025 14:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/aqiNPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CF910E92D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 14:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746716169; x=1778252169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/mOzv/B0QRZjl/9Aa9s8e8bL/0Lo4tuCXBgsNyXGOc4=;
 b=g/aqiNPnlKxNmVRbjMQwNETyn1dGcI5YgsDFTgblr/uB4uA6NZL+OTCm
 VEjKItDyDmLzlwvF/h7pAH9+bXmo+f1wrs5Po3wf18XiKhTHyIoBadW24
 OBNNLUOgmefEuWmRC7Kp5Xhgl07ko4x1E2PMlWKql0L7/gIJBQ1qa3opz
 pW7ufSfdtN9nt7eojJaVZu3PoRYsCtyj+nWt5XvO94h6sR/9V2Cr/RLxb
 JaEjaYPEl3z5nVrgqnM3gofVc46BJcSbL8IkGzeAf1G5BbLpTYEeFBpfo
 G9NO4uD9qR1Cw/7r5BUx8+YdK/bSELDudRe1rO3hZjhA8qpyMhJBOCbPq w==;
X-CSE-ConnectionGUID: fUWAgsSsR5i6qPCnKM5hYw==
X-CSE-MsgGUID: yg9+mTv4QpajgwTSy41JKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48372815"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="48372815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 07:56:09 -0700
X-CSE-ConnectionGUID: jlTr831aRGSrBWd32ZJT+g==
X-CSE-MsgGUID: W/hhoxmuRiqvyNx4bFyPJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="167267964"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 07:56:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 07:56:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 07:56:09 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 07:56:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD2QLzE0gmx+9QhW6mPMc6mhqiZOw1IG0aSplRIHpdiX5zHLt4BnF0gMiNRHhXEJ5a6a42PC+/ptrN6YPp8t39M1DdcnJhSm4XKqMnqjq1rFAexQUvO58O37ZdDgJwnUl9wwH8MqgtrirXcvS6w8gOuoslvlVMoNRQSCBoPoNoZ7QBCgbAp6ffVmvOhZl9/to5FsK4k/8jznEqQiL49E8tVWO5riFdjOQseFNEwlLRh0KmNpA9Ro47fXEKvK9ijZPlhHtBqPhM0H7eb5isTnhN0re+jlHaCjS534egEO1htcX/t3xnajFBZ2lP6jJH5CJ4dYmdHEdOAHxr1AO/kjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEh0VqdiDIOnKnszrH7vTsVAGvvypKDa4vc23CuiHX0=;
 b=HvFE+GYb6OUJ2/CqxV0ih69AQebvdVpB9Jqyw/ZgG5WeGVs0vG2Tv3RA1kUjGASU6U4jtLyUGzWdMr85G+rniPsq9tt8UtiemmQGjamvBCUbh3m/VTKcyQZQexfsshYmkfPX/Bi21TUr0XDVroT34a8gmtr9Ea8LbrfqP0HclVX7kt42ELtuLRR+07E2JLcPuckkjqqHnpcGdkiA7MB2NJ0kz4yNEroanj2qCBgiyUhLmrVd8pNzdUhNTO9uB8tqT3iFVaekikpG3yicbZ9l2BCiHlcGJ1shKC0t8v1od4CDcawT55TuqV2cS9W1TbaDQ+nQIoNy2wDZQBBWoOkQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Thu, 8 May
 2025 14:55:36 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0%3]) with mapi id 15.20.8699.012; Thu, 8 May 2025
 14:55:36 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Lahtinen, Joonas" <joonas.lahtinen@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe/ptl: Disable null query for anyhit shader
Thread-Topic: [PATCH] drm/xe/ptl: Disable null query for anyhit shader
Thread-Index: AQHbv0p4Q5p/+TR5LEuWWQqiwz9vZbPHL1wAgABkPQCAASN88A==
Date: Thu, 8 May 2025 14:55:35 +0000
Message-ID: <SJ0PR11MB58677F33126A35C158DD6203D08BA@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <20250507124437.2651331-1-nitin.r.gote@intel.com>
 <174662582054.2473.12369854211740990391@intel.com>
 <20250507194906.GH5080@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250507194906.GH5080@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5867:EE_|PH0PR11MB5064:EE_
x-ms-office365-filtering-correlation-id: 4aa7bd81-a913-464c-6477-08dd8e4063c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?pnJQ+QgB+xTBR8If51KAtwiDXrCDBXV5Nj46Z/pzD2CONaRc1J5nDdwas8?=
 =?iso-8859-1?Q?N5kkh4/uZhb25OQtM3eAyCEfD3yAQZkOcZsNqiLuGr4WRNJWHxyH51tHaU?=
 =?iso-8859-1?Q?mEmlPtPjjidyERynQNez6ZrILK8VS1LeSQ+vo0kuaZvJnJTpi3iH1jd19H?=
 =?iso-8859-1?Q?2RnpUaKHzwddlv9Ojzx+J0StGZb0YCNoYDv9iPgId1S482M1WdXvCCBcXy?=
 =?iso-8859-1?Q?NEv+h7o4HnCpAjk9Va5y5YNiinQRvlSJYU6g9ur36hLB+1o2VWwU+/1Kaf?=
 =?iso-8859-1?Q?jkM6RZJoxhLK68H3ibCzlGzqFtfWk/7qIFkseqHr+zKFI4yzs3wUG9+FBV?=
 =?iso-8859-1?Q?RqS3OzRTHbDDv5nahLwjNoiwz6mt3SPs3nBslPNR1Nx/NY8pFGlQQoCIly?=
 =?iso-8859-1?Q?Wz1S4ENsD6iux6bFUNg/+Sz+UJD7o6BjL1kVaj8EsOXomvN+tCqS9djHF2?=
 =?iso-8859-1?Q?8Qnk9gIbHj9OFYtVjI6oLFBlKtEbIAGoJselNGnPN/lFIexbieQLXu0FXQ?=
 =?iso-8859-1?Q?t+NePETGRfx0ifT15/JhAVRrSXaVFVTXUP7c54Pci3KvZMZrAiB0hsVrdh?=
 =?iso-8859-1?Q?XBUrT73GqdMnRVC8cEV3kv8BMdxHYkF/wFwe9fyCp3PGAaIAhqq/uLOrUj?=
 =?iso-8859-1?Q?n3rv9YhuHSBKAszPmN81EjwKXnufUr4Lx8+/PMqf6F1UOF0IAKHgssJ76E?=
 =?iso-8859-1?Q?h1MZ46+mBhBaVAtVdsPoH9QrBUwqa2w2deMVQx9hvgfE7L/MSedG34O2BT?=
 =?iso-8859-1?Q?iYLKy/lUSDmQf0rL7P9GQtuIKA0wwVXCXJlpvrbQpTC9n93Cnks7Wa2IUR?=
 =?iso-8859-1?Q?xcTMaEjGPADVeb7LMUcCl83/PMD7SosztizukPSXhRP3ufxKEm4HE26klt?=
 =?iso-8859-1?Q?RHC6MIuFB6r1/gXhIdZhmflbzyEQM0vK/FiDxIW+a4Sb3LXtxGgqoNSuoU?=
 =?iso-8859-1?Q?JttGfR8rfKDZnVsUaQkTUd0rxlWtH2z3Z4/tcV+vJ1igVkS94RxxYGCheW?=
 =?iso-8859-1?Q?0Tg2ytzX9ZU76q4qL4fFfX3OMhiILOR/DESTxr4w49CjmlLwiYnaiYWTX+?=
 =?iso-8859-1?Q?udQhBoPFXkntFQRjQqphDp6G0WUsWk1aKIpibWEffXMLoPjUeG2YEHtzkw?=
 =?iso-8859-1?Q?RcBPhMsHzGcwH9k1PwBsstPLcmaXc0lr4Lpg7jOlblMpfriIiDkT1vYJWw?=
 =?iso-8859-1?Q?bmSc41dIj5ic4Rldoz+pHGv0vl06sdJtfQbsm7YvSuxq+Q6MfYrWxisfB6?=
 =?iso-8859-1?Q?9wPV5R9rkquyN10BUpBdxR2qfhG3rqbgGnuPLP+5mK3z8ldyWM6qrL9uuf?=
 =?iso-8859-1?Q?NrqjOtYU4uAXImiGgivur3oTOCZ/3Yrh+eC4nH/RqKi8d7c3xQx5SbBh28?=
 =?iso-8859-1?Q?Yj4LiRwcuVDUWiJWF9/bVxDulIVWABOLCYhcgVi+V5UtrbGWW8dBYU4KLX?=
 =?iso-8859-1?Q?6fWkJQ6E/AXg4oLe2dSoDHJafxVKVn/Q3zUZPEehb2fPfCJpQtX7nuajYJ?=
 =?iso-8859-1?Q?EjMpyuCpdGnQ7TQCRJOw6/gcs7C2wjbCQNEGjKnRevCA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5867.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Yp++akP+n9TySo4momfQJykl8ffW1Lf/GvoSay+VmgaBlLyHu/VQyccEIk?=
 =?iso-8859-1?Q?oVYohBsecCWtDzubamHUL4xg2C+v3XyDu6s4PpmCoxq6rmrJhXDkt11fiw?=
 =?iso-8859-1?Q?nUBN43in39u1MWFNps/0OxkwbO70kf07exa0JVqHr/RAIuACl47XT+QAJO?=
 =?iso-8859-1?Q?3S6QzcvjxjFOLeutgGwrGeqgUe+91jvib/e+o2oGj0ZA757XoSLgrabPvq?=
 =?iso-8859-1?Q?pdpBZi6ltCZuSvzKHUFyKhiVKKQaWsGqFiRZJid1aFloSFGYPJSDBbzR0e?=
 =?iso-8859-1?Q?UrSrAkyIY+2jp109aOMCmOlw0S1kkgRBVG4jQ1j991VTqT7ot8jn2ZKWgg?=
 =?iso-8859-1?Q?Nrpl3ghaUeuVjRMUu6ghATCi0Ieav3gfPg9FfvZCQlnvT+3PTnZ8dC+KCF?=
 =?iso-8859-1?Q?e53BxgV2uwl1iuAKS3zuZITpoCpttGaRJnGfFSWx9/Zvj1qYuGMcjkVQOv?=
 =?iso-8859-1?Q?+oE6xxJRaAypmVauq9Vp3PqVbZ6wAfctcckKYoE8FoQ0G3xRGdEk6xqOG0?=
 =?iso-8859-1?Q?7tqf+6QCYLjsD/5F3P3yhitJkLkqjhZFXojU6/2JetvG7L6KxcLmWrpQ6s?=
 =?iso-8859-1?Q?PMfts3HBeTpzoQhe/bYTDG3cBlluriEuWP3lJvkBMqR9Wleorijxva2NkX?=
 =?iso-8859-1?Q?usTbwk4He4XL4EKECuZ2L9qtCoJywSphr2cPiuX+v3EQ8KHiUPVVWIPhxY?=
 =?iso-8859-1?Q?cMpKTaGBgi8fipbTTp+O1Pm9BoS5PhBiCY9sy3c9zPcsgwHX7drk1JSez9?=
 =?iso-8859-1?Q?VIq9VnAjaDUX7mceaUTuAeivQEuqVPSgOJ60utQiyEnbA0NzxUkZ+sneW2?=
 =?iso-8859-1?Q?OgiIODC6NqBuznRsGS9nP3Hn02IUT+9tIxzVSM7j8zKknaJFIGD4zenS8A?=
 =?iso-8859-1?Q?MX3YjLcUITR7LeeFtlvHu4tzVoPfogNkvk8En1fAXtrbnCEW9bVjJ6DRYh?=
 =?iso-8859-1?Q?D4WhqX1lSVU6bQuZU5tOoyf8m9U5/g+Hf6sZ/a8NjXWJYaBAj+3Odg3JPU?=
 =?iso-8859-1?Q?ZOYsBA30ZllUXAKoTTs1u8CLcaKdgTXN6nr68nZW8W3woyHRpNZSoCPqvm?=
 =?iso-8859-1?Q?Jdd/XZH6oIHUYq90jxOdPR6eWhtFGyHtaEhUOwVLi3NUKWQGi5ek+YdTpC?=
 =?iso-8859-1?Q?pfTrJd5DRGAzxxgBxmj2qWEf/PowyFsCXsy9rZv2JtPMXoFvt0owzOptKL?=
 =?iso-8859-1?Q?rg6iH/j/Yi2vLOC/Grqknh++zJYY++zhL45XAfQ/oeF7d8V1dmpKWVen9g?=
 =?iso-8859-1?Q?gwf0Ag2+ausWZdtScTzOdzzqiHGUabJ3yEhZYSbLT8czStQ37/N8KXqOaP?=
 =?iso-8859-1?Q?8n92hmvmiYbhOAhA8SOoHn23FVzGEtWPGMZfvK91+W6azW5eVDbh5/4Hc5?=
 =?iso-8859-1?Q?Up/fNulXNqZyXAOdkmPHlugi4jvXs3ufjBs/pPscJXqLRWr/HvkQfZ2PeH?=
 =?iso-8859-1?Q?6DbTrWYf7sqpaccp/pFnBiEmPrHOI9z9CBZBnYdQWDNFRkNCVO6iyFZhEs?=
 =?iso-8859-1?Q?vGKavROS+CnYwWR85SZ3YtF0KyWkLfGmNgB3FwMJBivUfoJnIeuJ0yD7sb?=
 =?iso-8859-1?Q?iIv6fA9cTzOQl+4NoBWK4QzDxwhqzYFHs8jB4n0rE3Kh8xcoUXUURgyd0w?=
 =?iso-8859-1?Q?XaaNeBiCkqZP4jwbYrKIvt0boOYBd4vF/c?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa7bd81-a913-464c-6477-08dd8e4063c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 14:55:35.9392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rjoWoMlyIkyByuFZNDGng/KrLNg0B2hKDjQxClgFPL4SkUZKcsevU5tHPdEEcEqkTAIUcRlpLrUVDbxAyzvUZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5064
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

Hi Matt,

> On Wed, May 07, 2025 at 10:50:20AM -0300, Gustavo Sousa wrote:
> > Quoting Nitin Gote (2025-05-07 09:44:37-03:00)
> > >For PTL, disable null query for anyhit shader as it currently does
> > >not bring any performance benefits.
> > >Quite the contrary, disabling the mechanism brings a small but
> > >consistent perf uplift.
> > >
> > >Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> >
> > This seems to match the requirements for Xe3 according to the
> > description of RT_CTL. So
>=20
> Doesn't the description (on bspec 57496) indicate that it applies to ever=
ything Xe2
> and beyond?  I don't see anything there about Xe3 specifically.  In that =
case
> something like GRAPHICS_VERSION_RANGE(2000,
> XE_RTP_END_VERSION_UNDEFINED) would be more accurate reflection of that
> note.
>=20
> But that bspec page also indicates that '1' is already the hardware defau=
lt value
> on all such platforms, so this patch doesn't seem necessary if the spec i=
s correct.
>=20

You are right.
I read the=A0register and found out that the=A0default value is 1. So, this=
 patch might not be required.
I will check with the=A0HW team.

Thank you Matt and Gustavo for the=A0review.

- Nitin

>=20
> Matt
>=20
> >
> > Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >
> > However, we usually have entries in Bspec 72161 for this kind of stuff.
> > Could we get that page updated with a proper entry for this tuning,
> > please?
> >
> > Also, I would use "drm/xe/xe3:" in the commit subject, since this is
> > applicable to the Xe3 IP and not necessarily specific to the platform.
> >
> > --
> > Gustavo Sousa
> >
> > >---
> > > drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
> > > 1 file changed, 5 insertions(+)
> > >
> > >diff --git a/drivers/gpu/drm/xe/xe_tuning.c
> > >b/drivers/gpu/drm/xe/xe_tuning.c index 49ddbda7cdef..6f2f3428b12e
> > >100644
> > >--- a/drivers/gpu/drm/xe/xe_tuning.c
> > >+++ b/drivers/gpu/drm/xe/xe_tuning.c
> > >@@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[=
] =3D {
> > >                        ENGINE_CLASS(RENDER)),
> > >           XE_RTP_ACTIONS(SET(SAMPLER_MODE,
> INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> > >         },
> > >+        { XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader")=
,
> > >+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> > >+                       FUNC(xe_rtp_match_first_render_or_compute)),
> > >+          XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> > >+        },
> > > };
> > >
> > > static const struct xe_rtp_entry_sr lrc_tunings[] =3D {
> > >--
> > >2.25.1
> > >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
