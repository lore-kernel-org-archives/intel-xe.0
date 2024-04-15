Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCCAC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 20:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19501127E5;
	Mon, 15 Apr 2024 20:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gG8GmWOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203901127E5
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713213699; x=1744749699;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vTll7Ht7fOmSHSzssSb+THtzobt8e0VxnEfjFJwXt5g=;
 b=gG8GmWOg/CKYR8V4OTFrRGnZAhUw55lNelxPmzCOzt8ZkF04VbC52o6G
 lMmJDUukp1ogDH8hM4smcxHklJpLKVsUAiMCErtu4OlfpZTX+hhFXIl3s
 rofM4TIGWNRoQk0t3qdAfNq1ax7ioh/eHx9TTvSBsuii2Mi6PaDpBPcSX
 K756k4CCgDoGIYAqxxbEoL757ceqVyBBhcfMQuRS2CcqDQhzGSnReiPRT
 ovPJsfXSpWstMpLqvqqDSpBGpemj9vbKbr3wjdi2Tmntz2ep7uJD1BCZ5
 86MK5zEjZq9unZilBuXkaETpR57+3bhrK3ih/HdGok5ghsbiQa/EMhjB7 A==;
X-CSE-ConnectionGUID: 1kYY1VpkRq6AhuQP+6eLpg==
X-CSE-MsgGUID: CJ6a0VMcR8m+ndr4C4aPyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8748098"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8748098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 13:41:39 -0700
X-CSE-ConnectionGUID: ZVTaXnevTG2NVYhZdknRsA==
X-CSE-MsgGUID: 2Krx5+OfTbOpl1ImU1AEFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22027907"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 13:41:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 13:41:38 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 13:41:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 13:41:38 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 13:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6ZLkLvbI1RicpLjqLI3mfsmiksx/j+E9EQknn0qip0mdesOJwPsVHDObklwRba/S+GQundumeC48uFGE8253HtQx6aB91M7E9QUUDquXQ72kINHlz2NgJ6p2ZRVdetEOxXqcTafMlO5ubRku8Ni514xGGyW4ermwpRGlYJwrEqc2ehw88tkxusiKaZA0h6LSSsw0AL5SYeR9pCeznni4zYNwSlIutv2FDcA93G/GHB0aHTdwVNw9vnpW/QpOpFXStd73EBtsUssAFsSg/eEl3W4BZTuEpd6HUjs7GVnC+ZffRd0aeCLf8mSHyPwyRPP0KZ1+DjcjBJ6v0TNeI01fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++3mg2n6hhegD/qvrJSo5nJq0k72O7JEb0qBikanzC4=;
 b=Z8afZlsi9sx1sbtGvEB/TJIvU2p5dXrgNi7pfafmt/NyG3DEoWOOSuC5aJEwF0f+HAkwszyQ4VtgTgKyqkUiyoHk/EsEKhQGXhrUX9PLFP91GZiDTZXbdRWXMW6M2ktSCRpyEwckFLK5RnefI3CzPNomMtLbAjfz9T+mMuUaDptIBguaPuHEOEzRU5iCS/t4FBdQ4B+bKA134L3QVheEEQ5elPD5l3zeheuHWYsheiDLwcndKyJVWi7g/TiLko9Eqe9ylE4Vvz+sQYgBGiKIk5XJhq+nOYAKZJ2dn49J1bsZQZag2ULsdFfox60xhbar8X5Y5Sm5PzSaNlP+wceQTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:133::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28; Mon, 15 Apr
 2024 20:41:34 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 20:41:34 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison, 
 John C" <john.c.harrison@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Topic: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Index: AQHaj2dxZPppdwTCZUelWMQC388cILFpuDsAgAADl4CAAAt+oIAAAREAgAACT4A=
Date: Mon, 15 Apr 2024 20:41:34 +0000
Message-ID: <CH0PR11MB54440A904094FD4CFC89749AE5092@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
 <dde80e98a80b9fcfbd46c9dab4ef9bc27bc108f1.camel@intel.com>
 <Zh2Dlx9hhQTTcuD9@DUT025-TGLU.fm.intel.com>
 <CH0PR11MB5444382EEBFD7D79F6CB7763E5092@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zh2OIMAqvo310IZr@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zh2OIMAqvo310IZr@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7383:EE_
x-ms-office365-filtering-correlation-id: 4fadf961-dd55-41f0-be7e-08dc5d8c7089
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: arwXebsGTTAek/qxbTJzT/P1xz4SaX1bk4kP3zVwTdQe8tYgguxVwtu4OQDbuNLi4l4Nml6OoB7rNVd2+P7uor+Kiz3MKq1+eCJUY/XUiAwLKa9UZSBysK37w82S2s7fRPZKdyrAWaEQF9P0WIC32rdzDs8WGYJ7bxxX4tCTr/1BxdIyAlJtLUS6r92F7ONOON+Q/SUyD8GLLmXz8qhL4HKcRknfVtoKyL0rcWag2ugcpdHogJ95hf/fHguhX6LVyBs09F8P0fLC+o4AJ6QKqo/cyvfS13KTb9ZaxevCY009KwbETX102yrXOXIB/9OGyj/NEUTR/mnRcB14eHjF2LtCDAT+++LTij8xtUCyQ4yxS620Fc9NjT9bZT7ebV839mEW9t97pF/sypvcga8SLOafggyWjv2mIg/7dnBCt2cpRlPH/pgwLgSjCNsmCcCFke77w9KdV4QzdyVy2vfLFeEa/fdL3i0mxcnwU1dK0zPcCBknO2Wo2PLv+KyUBbt8zx3w8H225PFIA9PA6PM3ApAwtJ5d4mLYqDAfy9NU+kK38R6xm4X/cLlfppwJlOuLbmPBOvOyG+gGmSzlnJCGL7eil65u1LAd5fqlqB+Hv7CAh6/yImEpcD2yupbBjLcdDyeG7D8zPyE0Uy/P10txJkx1/1SDE39p9J/iZWRaJy82LsCATZv2dSQDsEP0tLXwgtvPaUuKhXqMhXcdaQJKFYWbiCo4tQPoEZNTH9fN+xw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gtZsCFngBXEpa+t95oCrKJ7NHiYyTlZTJEKyxmJ7inB0jO0zGDX22jwXpW?=
 =?iso-8859-1?Q?BlS1U50kz2/pUEk+DGEAvJNuCg4t7Tf2geWKR7T4i3k2oyyzYXu9LcXFNk?=
 =?iso-8859-1?Q?5rwahE5ZGZTTQE4Ff+mFN4TP3rNPWwGeAyIfderqew8e6UEYG/Kgzy2u/U?=
 =?iso-8859-1?Q?ZsPwVaCWFrGlPLgplNTe7/ahKN6aPLCAaFng05o6AGYhTjKyh5Jjg+CdnR?=
 =?iso-8859-1?Q?zubuKoM6stKUlijudbY6cRGWO9LtHtZ68rzcQAWP2kVqMzquZiv9lX18Uw?=
 =?iso-8859-1?Q?S+2+yNHGc5RTulQCDx3PaEQ34XxOtkO5igoJ78kwXDK/VNkqeyBE+ywNa3?=
 =?iso-8859-1?Q?6lFP2LWaFI5E8X7t5eLPABzjpsRpfcKvwyQsNIAONPNGBPZcIpJ2Bz+Mav?=
 =?iso-8859-1?Q?oE67w5P3lI/aqhW5e3I5mDQV15A7UY2bSGI33SSE4wdSh9ZgPDNjnjHqSL?=
 =?iso-8859-1?Q?4vIUWOWw11ffGis746EShr4jBbDMgDx8jH5+NTGTgyRxeqI6QBmrtYjp4K?=
 =?iso-8859-1?Q?kg3J9Ghxby14QRHoKhWndH4rxCX4yBnBmv9xJBRrVdHQCShBjB9Mmyt/uL?=
 =?iso-8859-1?Q?chFyz3/WU7qwHFg2Hw1gEJusXAryk4l/v36DjwP/VWb5w6DEITanA3+Zk/?=
 =?iso-8859-1?Q?0zUpuWRSmD/HYCAXgjA8mdkWiPjDrLGCW2yivx8m0PxtnvD85V712ueHlF?=
 =?iso-8859-1?Q?B6odWzSnsvSQy83BIJalEaixPIBFhTq9jrPT5RsM1AiU6eUY/8f4W77GUs?=
 =?iso-8859-1?Q?MgeU+ozVeTl9rMDwE6YHFxqRGV4MwR+cRBhC3ggLgOBpLPEeLOG2H//008?=
 =?iso-8859-1?Q?ogCnucqoGPsx8LXwShAFawveuygitmnwFFsH+Ef51DVrL/u5LaOPj7vqhX?=
 =?iso-8859-1?Q?mEI3wtCYfB+ZdUFca3wqwq3zCu8NSKpMU5CBHRv4cK2Q0K/otOLmMlcGW7?=
 =?iso-8859-1?Q?yVBsIQW99anD5tK8l1mCr71HhXIuu8s9m6NOhTpuegiV5dB8K1sMprXZ5N?=
 =?iso-8859-1?Q?JBQ+2PKo1xE4WxvlmNSZtPpwt22yTUvBvOgiAJwYWMyFwZNknCuHR+PEs2?=
 =?iso-8859-1?Q?QxFNsdTJ75OK/ujgwslnlmZJtHmXfU0NniyihC/almckLWfjrl1Q6ZR+NV?=
 =?iso-8859-1?Q?eo8uHzUDGFuBiw646y1nFm80NBBZcxwpf1WZDfnMZCQgr9epsP26jwiG+X?=
 =?iso-8859-1?Q?zR/uWlp47dvRLKbEuGFNJ/oxDICq8gnbrHmK/qUqDGl1HkmsllRx+dJ3sX?=
 =?iso-8859-1?Q?VHeiJz80Nh8ta/Trf2RVE4eri2+Gqw/MQy9LOvBWm9FBCvD609KfpbZtuh?=
 =?iso-8859-1?Q?N/HGSmLWZNg6HdDMCLDeAdOX+++vKFU93NMlWGK2a9Fg0a2gcD1i8k0OBS?=
 =?iso-8859-1?Q?1xszYrqquQi3uGt8fCNgcRA1pd90gKw8+dMCYh46Q+2flY8jtm4VK/1Wmz?=
 =?iso-8859-1?Q?EqzRK2T8VrgDQEtsg3xc/u2N6/B/SwyYdlUj8EMO3Ks/AXY9wW7v4y7VhE?=
 =?iso-8859-1?Q?Nv+Q8olqByDpEQJLD0M5xhqzIbSfJv4sUwRMf9gmG510dMgUqSE3gr534c?=
 =?iso-8859-1?Q?5EUZPYAgibipew8NLkJmAC0hhHZqMCX1yifGT2/o/Z2w2syBaXTAMqmnSp?=
 =?iso-8859-1?Q?3K3jun38L3pegViUOJkFuC1Dy/I89U0Zc7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fadf961-dd55-41f0-be7e-08dc5d8c7089
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 20:41:34.4407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWlS2S44aX18rCr8Mo3xxtu4Sd9CNhodF4hcfKZfFMxxeoZY6/qzuqHU8R+UkHNWJLxTvCL25o1EkaAvCjwZQZpRUnUReARuCVqiW9tP6uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Monday, April 15, 2024 1:29 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: Summers, Stuart <stuart.summers@intel.com>; intel-xe@lists.freedesktop.=
org; Harrison, John C <john.c.harrison@intel.com>; Vishwanathapura, Niranja=
na <niranjana.vishwanathapura@intel.com>; Gupta, saurabhg <saurabhg.gupta@i=
ntel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; Welty, Brian <bria=
n.welty@intel.com>
Subject: Re: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function defin=
itions
>=20
> On Mon, Apr 15, 2024 at 02:26:38PM -0600, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>=20
> > Sent: Monday, April 15, 2024 12:44 PM
> > To: Summers, Stuart <stuart.summers@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@i=
ntel.com>; Harrison, John C <john.c.harrison@intel.com>; Vishwanathapura, N=
iranjana <niranjana.vishwanathapura@intel.com>; Gupta, saurabhg <saurabhg.g=
upta@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; Welty, Brian=
 <brian.welty@intel.com>
> > Subject: Re: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function d=
efinitions
> > >=20
> > > On Mon, Apr 15, 2024 at 01:31:32PM -0600, Summers, Stuart wrote:
> > > > On Mon, 2024-04-15 at 11:46 -0700, Jonathan Cavitt wrote:
> > > > > Add defintions for the functions xe_lrc_set_ring_tail and
> > > > > xe_lrc_ring_tail to match the definitions for xe_lrc_set_ring_hea=
d
> > > > > and
> > > > > xe_lrc_ring_head, respectively, except tarting the lrc tail.
> > > > >=20
> > > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.co=
m>
> > > > > CC: Brian Welty <brian.welty@intel.com>
> > > > > CC: Matt Roper <matthew.d.roper@intel.com>
> > > > > ---
> > > > > =A0drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++++
> > > > > =A0drivers/gpu/drm/xe/xe_lrc.h |=A0 2 ++
> > > > > =A02 files changed, 12 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > index 615bbc372ac62..e91ecbcceba5c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > @@ -834,6 +834,16 @@ void xe_lrc_finish(struct xe_lrc *lrc)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0xe_bo_put(lrc->bo);
> > > > > =A0}
> > > > > =A0
> > > > > +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
> > > > > +{
> > > > > +=A0=A0=A0=A0=A0=A0=A0xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, ta=
il);
> > > > > +}
> > > > > +
> > > > > +u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
> > > > > +{
> > > > > +=A0=A0=A0=A0=A0=A0=A0return xe_lrc_read_ctx_reg(lrc, CTX_RING_TA=
IL) & TAIL_ADDR;
> > > > > +}
> > > > > +
> > > > > =A0void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
> > > > > =A0{
> > > >=20
> > > > I see lower in xe_lrc.c we're doing this (xe_lrc_snapshot_capture):
> > > > snapshot->tail.memory =3D xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> > > >=20
> > > > Should we change this call to use the new wrapper also?
> > > >=20
> > >=20
> > > Yea. Also xe_guc_submit.c sets the LRC tail. It should be updated to =
use
> > > the helper too.
> >=20
> > Please list all of the places where you would like me to use xe_lrc_set=
_ring_tail
> > and xe_lrc_ring_tail, and I will have those ready for the next revision=
.
> > -Jonathan Cavitt
> >=20
>=20
> grep is your friend...
>=20
> mbrost@lstrano-desk:xe$ grep CTX_RING_TAIL *.c *.h
> xe_execlist.c:  xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> xe_guc_submit.c:                xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, =
lrc->ring.tail);
> xe_lrc.c:       xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
> xe_lrc.c:       snapshot->tail.memory =3D xe_lrc_read_ctx_reg(lrc, CTX_RI=
NG_TAIL);

And in the snapshot case, we're sure we want to use xe_lrc_ring_tail instea=
d of
the current raw call?  Because xe_lrc_ring_tail performs a bitwise AND on t=
he
result, which we might not want.
Granted, I don't know why we wouldn't want it, but that's still a point of =
contention
that may come up in post-review.
-Jonathan Cavitt

>=20
> Matt
>=20
> > >=20
> > > Matt
> > >=20
> > > > Thanks,
> > > > Stuart
> > > >=20
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, =
head);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h
> > > > > b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > index d32fa31faa2cf..f355b0eeb5658 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > @@ -24,6 +24,8 @@ void xe_lrc_finish(struct xe_lrc *lrc);
> > > > > =A0size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class
> > > > > class);
> > > > > =A0u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
> > > > > =A0
> > > > > +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
> > > > > +u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
> > > > > =A0void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
> > > > > =A0u32 xe_lrc_ring_head(struct xe_lrc *lrc);
> > > > > =A0u32 xe_lrc_ring_space(struct xe_lrc *lrc);
> > > >=20
> > >=20
>=20
