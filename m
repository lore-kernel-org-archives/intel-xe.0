Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A91CC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 10:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF9810E410;
	Wed, 29 May 2024 10:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZIpZXr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8303710E49C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716980170; x=1748516170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3M7K6mVVGbPl6LULELlJBfCvpfnyICfxL9mqZglgmtQ=;
 b=iZIpZXr0sj2bKGFkUBLZQ2dxMfeNFbuErYjegwz6c8n4nKYeB7aBuU6B
 0Co8kSe5ijmtV54nGrstQhLqTth2ma86Uw0b5+0gYGiwYsSH7WmS1RB8j
 0X9P7x9vH4u0omgoB7Nhnr6+jxWA8N0Pd8DCpZVBFV1oS/4HcyCFAHBFo
 hCbSl5HM/PmGfyx7puCzNPRt03IiWCaV7RUDrHflUKtsrHuy8Q00ze7xL
 z7gto6PDIPf7UDIWSp3a2Y2PiY2KT56Fv6IMOESnNyrZX8QW62eRk2Tjw
 WDcZ/1S0A+3l0Q3oknXzbLQQDqwxJD9WvrA+ZknbU/veQRjz/MTybGmlf g==;
X-CSE-ConnectionGUID: HzvdCN3ISDy2EXVpv13wzA==
X-CSE-MsgGUID: cIjNGR36RciQUW7x1b1dOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13224203"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13224203"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 03:56:09 -0700
X-CSE-ConnectionGUID: 28GAwg0aSVCGG9dyuTfrFg==
X-CSE-MsgGUID: n7+E6djiR4qF8WAjgiDW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35481996"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 03:56:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 03:56:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 03:56:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 03:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmdYjs425YySX6TrHMDNEEkUAUVNHzeW17MBBQuZxAB0KqNpLM0Y7F/TvTYa6P1ts0ns5WLDAYYJ90lF6w8qiuLXjfYe12WKcs0RQILuM6ucAm3FcJzAzTI3PH0GJ6jNArGbcKLcGMu6dY3vSK/FArIXEWaVXp7MXlTI8OjdcbF3h4aZr61oqxXl8A7NW0sFB9yB60l4loYH10so5oWn6x2NbxFClAt8z9umfzWUPKlDveLaWPIF4zHjXONDgVML/lnfoinMiwDMs+P7WorSTqohvJh5pz6VPkG6SRERlvB46NsssbLKRKZ7auIUdbePX23Oq1bFdpsyOChYVBg3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ht0mt6q/7lMHrho1aKAkmQh4Mj1srIWBYR3KMDI3bg=;
 b=amlSfk6qaGhprWabUsGQvrpZgEq4FxFOCZiRa4k3Gwm0IhX7ATygOlcY7V1ZyaIjuqpB6q/q0oI7suBbgbzTE08ZlGASlpprN2KjGyT1Vx4eLfWFluXsOerSvoJgwsm6IvqeE+oEICVpRmrmehE+xA0w1yE8KsyH1a6cnsLkaMwHjRd0x+Z77NZYHvMm8K6T0FiIjHLhLdHVFT4fIi/Y9byZM7RLfEcYYyAaEg4Dalk+jE94/jjiWqLL0NtAcqju1Kg9ubemIsb67tCS0dCXsVg+UPj7RRpAs1jIqtCITvX3sc+kEj90ywKhJy8yEnlAWdiU35b9PZO4UOsS1XZIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 10:56:06 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 10:56:06 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Topic: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Index: AQHaraQkIbgiNoBS90KzjpdH8HAyj7GtSzuAgADGzUA=
Date: Wed, 29 May 2024 10:56:06 +0000
Message-ID: <SJ1PR11MB6204CAAB3D71FE762116755981F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
 <20240528230331.GK4990@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240528230331.GK4990@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4768:EE_
x-ms-office365-filtering-correlation-id: 58526f24-e39e-4116-f196-08dc7fcdf0c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?8TUPt/ftYstqYBYj2X3L81eEdVCDioBDxgLnmBtxbHk12vkHJoJdEi1yWDfI?=
 =?us-ascii?Q?teFW1gxG5wKVjLQEyGwQpZ6SoC0EAnhQPFrEFJoZjnmUL2qcDvGfWgt+itm4?=
 =?us-ascii?Q?MbqZL0R+UFfBy1pKa2azQbMr9fEZI6TQ4CbHGVcxOZkltt8ABZ1YU3Y7bzXk?=
 =?us-ascii?Q?9dqOpbcKbf5euILWUg2EmehPzrtskAXGOw2qeP45g7YXONpnqFDwaBLXSHt4?=
 =?us-ascii?Q?5bJ8HO0q4dhD62UpD+gbNoxzJEEXJDOo2hQyOwsxPXephTOIj7oIqLxnMUOv?=
 =?us-ascii?Q?Ubl/lWmRDxxQdI7xY3Q2jAqfVooLct1AgX1aRSB8TZU3zxgG8w/jgTwW6RAT?=
 =?us-ascii?Q?gl/aWxCKNUx0YhUpgCRJUeldWx7BF++Pf8fR3jpfYg49KqSHyiESOCuU+6J7?=
 =?us-ascii?Q?j/FzOs51eM2ef5CuKYP9KqSS9pALpHqz5MFZPj7fJfpWTe0cPWmxd1yexdTv?=
 =?us-ascii?Q?WtzOQLgILbG1RPAxfZUAsYKzpziALZ0zCINFwKia6hJ+4CkvS0ipWtydaFaQ?=
 =?us-ascii?Q?nldrfMrHic9pHnlpr5yytP1AjrgyKDE5iCKNPNRqBBV0fsUA2ToS3XLkaiJA?=
 =?us-ascii?Q?/0YYLKXQsTyqmyAGqlFwBoFqSIV2ER4oPqOSANZsMAMi3GaxMLNtJFu0NFZR?=
 =?us-ascii?Q?bekfXHnQJfnI1C4cWnLZZlk86GGngEj3PWHIsOdFm3I0XRTHz1+FVB0fGKc5?=
 =?us-ascii?Q?bfe4HmZEX5I7ptT/brwU7Upk618lJDOYQKmExbSK9Vnbll1cEjr46XMrdJap?=
 =?us-ascii?Q?8R4jeKmBkbIvi8Wrw1lR4J6anuZzKLwNyv4BL6lHopoEnHpPG4ZohSqP0Cjk?=
 =?us-ascii?Q?vsfaSdWcDEjqJnxdowyOJi30qREZ5S69/q1/nzbfqCaGpA3/IFvbY08W6Tfm?=
 =?us-ascii?Q?5Us7aOTDzfIFZh0VPb9a2i/tu1neoGQg6l0Sy+OjLuCCs6C0KwAkJs0jM42v?=
 =?us-ascii?Q?MFtfrVKu+NRdPvR7zHinfwgnlV/ZgffgY3XiIEWb5ewPSj9C8L3SThPGTftt?=
 =?us-ascii?Q?5arZ63/Ksz1XX0G/1dhWjWNfLy+dFUZy1JBPr6zPc3RBns5wKv8X3N0OzSrK?=
 =?us-ascii?Q?VIVttHP4Yxrf8ceuRhaumnXC7IHEa4NqsI66sQ7nsfD4Li5NBSaemFqfim17?=
 =?us-ascii?Q?LfHnpRahVpQQ8OT+MyjjPJLqck/tgRnWMRBgnQmhGSpZxxGgrsMB80qpvhdC?=
 =?us-ascii?Q?6K2ozbDTXzvhKA/f5mOvDcWr4v9LYUMQgJAjFczriOmz69Am8buTeT7CEGTF?=
 =?us-ascii?Q?sDsHbGL5zWQ7LF/XdSaEpDOEcICxqQ28sJx0w1RUtktD87xhZfENj2Qyqb9w?=
 =?us-ascii?Q?O1mfCSAktYwblWLkugRmHCpvtMwjmWcDOfvE/5hja2hdBw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TAExIy6/UXzFpQsi8VoF1gDLlAjDmhWm5sm57twcfXXlIjMc74Tk8NtpFOI1?=
 =?us-ascii?Q?Al2cdusrM3XbR8gy5s1+m7xDD1wsSG36L/TZcV7yGG3abf6b++0XFRhe/5Wh?=
 =?us-ascii?Q?poDjJHsEhaaLb6XsSDEXcH5JJGGRsF5B8JuzBDRTFnnltXixUdF6L36Y2k2w?=
 =?us-ascii?Q?KD3ozrTZuuCRYikbqJWWCLa965LB3BwTYkBtba8dvniEl1JMXPmDK98JGmoc?=
 =?us-ascii?Q?iIpr5uNQv5iG2SRe9phOVjFSYiksNq4JwECFyGnb+ilwFPZO4nhn60zxzEjr?=
 =?us-ascii?Q?XCKCLsYPiGVwSiDflC62Pz2D5qg8ir2Eos/iqJzob6dKf8ZksFHAYPZfNyAS?=
 =?us-ascii?Q?lkAhXqczGLGwsnk7tt6T2x/mCu/pgUftHAHe6DKPBzE+VGck0st6pjjjf9hH?=
 =?us-ascii?Q?HstjGprw9HxZNlzhmWpKavNK10jIqY1X6U/sdsy3jugGdPybHthmLKweoUUA?=
 =?us-ascii?Q?m2qMopYBfimlMkRjltWxoJ3D7nZEbG2P8My87NftKnlh+kBFKsBy8kpXMRzm?=
 =?us-ascii?Q?QF5Io3lFKQPhp3zasows/GPUto3bTdTtAny50MX6C5RWxpR7+IszXNV/hz4A?=
 =?us-ascii?Q?ACtLTmfDc9WfzcluLxYH9zqXyRcVcSFCAHWftbwrHh5uysMQ12G4bIcRrpge?=
 =?us-ascii?Q?P5z5iWr6NZIRIxYrvgPWruwjKMRN/w1bhi9SwV5GI6km481r6iRvZsG4qO9M?=
 =?us-ascii?Q?x8yQp4cGeeN2PZOYiflZTITHAmHz3dZpHlw4F1xPF/jLwUqVwY3RckBF5pH/?=
 =?us-ascii?Q?LZMs+N6WBnD6CDAiXaZl9hG0CgIUiaCq6+sA/mospxbnWF+dbMKDKXR5436R?=
 =?us-ascii?Q?7jCsE4FAGDMhSn5WYcDQqwdWxwLjE4ythqK/F9Opj7KOubcETS4jmxyu4PY2?=
 =?us-ascii?Q?spXtyJzOrlAZ7KBLRK7vlHmZmHKWhuM/x82yCNJL+JKS3DjisM50AAlfTU4Y?=
 =?us-ascii?Q?E3g7pbNYAz62LAvybd7UnvYoA7xwDbJGtY/j4RY/5I5X+pDicvjIfLbwULiw?=
 =?us-ascii?Q?YbfUEMkgbHHIjfYXTMraFBnbBETITmlF8zCcrCpIW8LMUyL8OzedWJVGsS4z?=
 =?us-ascii?Q?4jGIXYPl9jXEfRYTMtasThXDi+mXeUzGnCmM2A5ps10/aqw6R5ncDZNQVWJW?=
 =?us-ascii?Q?Rz0RJEOTT5cf9JQhmOQ3vlZwJ+0J7xD6+rRVBBX7OaqKSILnGBlvRHhYmVUH?=
 =?us-ascii?Q?7MlvokWoxxMkmPHEIg8BBbuBQeyyZc/cl0uv1ocRGaxKtjHuh62XttdB2Ruu?=
 =?us-ascii?Q?HkK0TtKhhzbwYlEQucImF4nCVr98yAijOmWkX64IJU0seT6ZrwKVuRERdD1g?=
 =?us-ascii?Q?0YSjM33SuCEkl0Ujm596/xIizt4eN0OxRzWu5G3YVQp7bf/Ah/mnSppBvzab?=
 =?us-ascii?Q?UBRlvPj9lBYCRLwta7b3+2sDDfYMnCPNUIusK6X41Bh+XMiKkkurai2gouJ8?=
 =?us-ascii?Q?4U797mU2io/PP7HnxYrpeSF/KmvHEfwo+Ih09tINVc3Hqs9FRtyqRS4JM9mK?=
 =?us-ascii?Q?5suVCTbOI9ZwqAiE5fEpqft9h+WXLDveHOhLbJExelZChk78Ueit4RjANKdv?=
 =?us-ascii?Q?G+HXRkKTDrezQGGTBO/4XX5XwiuTVgDoP7Ic34jU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58526f24-e39e-4116-f196-08dc7fcdf0c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 10:56:06.3633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RmkhObolg0igLgfnW0J7gu3dKAyzbJY5XxQPMPvNf5jgHnpVlZz2+3HuVNpWeMCinWhFkv78vnm3up9DMT+FwAh1grMajbeTfxhElo4vM1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, May 29, 2024 4:34 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
>=20
> On Fri, May 24, 2024 at 12:02:28PM +0530, Tejas Upadhyay wrote:
> > Wa_15015404425 applies to xe2_lpm all steppings
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
> >  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > index 722fb6dbb72e..07c8a23bd7c2 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > @@ -42,6 +42,7 @@
> >  #define STOLEN_RESERVED				XE_REG(0x1082c0)
> >  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9,
> 7)
> >
> > +#define MEDIA_DUMMY_REG
> 	XE_REG(0x138000)
>=20
> The workaround description recommended using 0x130030 as the target
> offset.  Is there a reason you're using 0x138000 (which is a real RP_STAT=
E_CAP
> register that you'll probably be clobbering if you write to it)?
>=20
> >  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
> >
> >  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > b/drivers/gpu/drm/xe/xe_mmio.c index ff7a7cf99530..e1dc87078387
> 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
> >  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);  }
> >
> > +static void mmio_flush_pending_writes(struct xe_gt *gt) {
> > +	struct xe_device *xe =3D gt_to_xe(gt);
> > +
> > +	if (!(xe->info.platform =3D=3D XE_LUNARLAKE))
> > +		return;
>=20
> This workaround is a bit strange; it's tagged as only applying to Xe2_LPM=
, but
> the description indicates that it actually lies within the SoC fabric.  O=
ur usual
> graphics/media workaround database doesn't always capture SoC
> workarounds very well...have you confirmed that this applies to all SoC
> steppings (which is different from the graphics/media steppings)?

I checked on device that I had and it applies on below device :
graphics_verx100 2004
media_verx100 2000
stepping G:B0 M:B0 D:** B:**
is_dgfx no
platform 10
subplatform 0
devid 0x64a0
revid 4
tile_count 1
vm_max_level 4
force_execlist no
has_flat_ccs yes
has_usm yes
skip_guc_pc no
gt0 force wake 0
gt0 engine_mask 0x400203
gt1 force wake 0
gt1 engine_mask 0x40400

Thanks,
Tejas
>=20
> > +
> > +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) =3D=3D 20) {
>=20
> The description also notes that we need to apply this workaround before
> issuing a "read to Gfx GTTMMADR BAR."  So even though this is tagged as
> Xe2_LPM (probably because they didn't have a good way to express SoC
> details in our usual workaround database), it sounds like this workaround=
 is
> probably needed for any reads through the PCI BAR, not just the ones
> targetting media offsets.  In fact from the description it sounds like it=
 would
> also probably apply to any reads of the GSM through the GTTMMADR BAR as
> well, not just the registers.
>=20
> > +		int itr =3D 4;
> > +		/* 4 dummy writes */
> > +		while (itr--)
> > +			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
> > +	}
> > +}
> > +
> >  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)  {
> >  	struct xe_tile *tile =3D gt_to_tile(gt); @@ -479,6 +494,9 @@ u32
> > xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >  	struct xe_tile *tile =3D gt_to_tile(gt);
> >  	u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
> >
> > +	/* Wa_15015404425 */
> > +	mmio_flush_pending_writes(gt);
>=20
> There aren't a whole lot of them, but technically 8-bit and 16-bit reads
> probably need this workaround as well.
>=20
>=20
> Matt
>=20
> > +
> >  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +
> > addr);  }
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
