Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35764CCD194
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 18:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70710E66C;
	Tue, 14 Oct 2025 18:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GM361TA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D51110E68E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760465180; x=1792001180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tdAoiUU7mnT4XtzeLOIV6rhaABdB3eN2I+K9IMcWBjE=;
 b=GM361TA0ZeUALCpG/lhWGFTboBKsy46v108TRS/v5BvWrUTnfrxJy855
 BENclvXMCkOX5p6nHWIUMM5Pc+z0wQ63sxWvBGDgm8JBuig2H52Oed9uY
 ZbMMGQ2bJeEJcn6CtORDR7l1aV4/GRttfzxohRRGxiEvDeeqM5CR60ybs
 nBCdw7311a0RviAW/2kgtJPk22c4LZE2QeHuoijkA25wGwFCdfx+cpmkC
 B9bSOCSsKRwNxSOpPHh1NurzodBAqs/nsV0VYQpZtXcDte8Hgo8g/D8R2
 rYnpGswMeU7klp2WhDUdwsmgIIeHMjH0fix8uuJpYrAu2lIMynBIUNFMy w==;
X-CSE-ConnectionGUID: 5v6OM4X6Rmi9udpB+HGQhw==
X-CSE-MsgGUID: EDGilaxAQbyOEBvTb6ZvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73234255"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="73234255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:06:19 -0700
X-CSE-ConnectionGUID: ZqYeNpF2QcGiOSXB8vhpKg==
X-CSE-MsgGUID: z5UUn3JrTbmM9DyNSsDDqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181500998"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:06:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:06:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 11:06:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIQkLxGB2/K16znLKEnLoRQRb7sQrqTdAZv9nOoNMjzmdmTburJrm9Bne5Tbkp5oGk1YtDvNq8K2qCkq2aQXahN36VVMVQj3xR0eATGvchfeJNxfPHHul5fawfBgKEe0xNREBsPEGOyTABN8T4y2tIeanCP2LPe69/PtatwA7GhYvmn7hU9Xvt31IQ+7IQlDmTv95dn8IrK4s1qbv8tSn4/awX649leM5fKQ92gAv17jZT2/3Cxp4ly/+taFmNGmrbljArXwfhhUyJJPF/5ImJuwn8ScS0YPH3d4jn6op6CNPD4RmGc1SosR8xGUpaZ7KHSy4GI4A8as2+tTI6+y8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud9dgAEHBI6ydJILvV0qzg4P6Tguscimt5ChweU2bTA=;
 b=ucUlIIHR5KqKOtc1a4ifYJSceeMO0o8oB4/Q6KAMq6hcdfIY4Jo17jhrjQYnrrTy2IxWsYEicg9GYVPRsWQs1QreFjEVfAxUi+QIFzJDix7IBq5RnUDJWCLBBrZsBQiDKAI1kUzgCwaY/TAvFf8I1Mi4NWK3JS4gYGbDX5pWnTOlStVDtZGvdItY+ncQg3ni8dd3lv73Vcr13ScAHhE9hbmtjWCTGrtWYcucg7aPkatphASa18K/ItRprp8AfNawBYHlImXwJ7MTG4h86P/OfXbTOAXLGQrPQDSCG08sQlXLBsPLmC1o2aMXfAfRsT+bg9qWT/F27l7r1LDkkdBHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB8084.namprd11.prod.outlook.com (2603:10b6:8:158::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 18:06:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 18:06:15 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 7/7] drm/xe/tests: Use any available GT for testing
Thread-Topic: [PATCH v3 7/7] drm/xe/tests: Use any available GT for testing
Thread-Index: AQHcPSpU0DoW4sYl5kKGlxZv181NbbTB6/WAgAABCVA=
Date: Tue, 14 Oct 2025 18:06:15 +0000
Message-ID: <CH0PR11MB5444CEEF9D123E89FD5B0FABE5EBA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
 <20251014164758.125598-16-jonathan.cavitt@intel.com>
 <d8982e34-7f5f-4c82-b7f7-523007378a3c@intel.com>
In-Reply-To: <d8982e34-7f5f-4c82-b7f7-523007378a3c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB8084:EE_
x-ms-office365-filtering-correlation-id: 20906230-0fe8-43d9-d536-08de0b4c5dbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yfrb7Ds7h6xE7KHl50KgDM4liI5i6Nb6/1fbW3mQj4PgFrD0feMhiZqAY5gt?=
 =?us-ascii?Q?aqUo87QAouD+IGYJit9MJhkC4wvl1awtMc4Fd+0kdEjHvj3S+SkAPJam9f19?=
 =?us-ascii?Q?5eN4I9XqtT0G4rDoNQpxqKsTI2VqxixgPpSGBRFyIc9CRyiwlVuwrwdFK9bH?=
 =?us-ascii?Q?Scfhjo57KUsfW9SiymQQLFVlkSFpibDMTe33JvjH7j/GiDktvzhziazbsuC5?=
 =?us-ascii?Q?jYt9E0XqT/2cQ5b0bczrBPn5momw5H2mNPdREfxQtYJTExe3eB5aMucs5Jq6?=
 =?us-ascii?Q?hn9KVCB/+TXqHEscsLbPQOHn1tmngvIv29TfzqzeBiHCLI7+u6Et0C8PScc/?=
 =?us-ascii?Q?hbHr5hMuy9efhhR/Ucxejs9hpa34DaK5vuJMHDBVHmyfT7PAN2k4EVFGDW8V?=
 =?us-ascii?Q?Y6Z+Sti0F2Yszj027nAnfC8WDOVwGq+4JwCy0kuL8wK1mXQfXV5bgTtYfF1Y?=
 =?us-ascii?Q?eLNNVVBBE5lcPa3E+eJqswfvazAJfZ7iOfGtwr9f8T4GhGhoJxBWbekdbXKL?=
 =?us-ascii?Q?ETa20hkMWT9Z+wt+WQiv099TtkPX9NPZePZF1mIoCc/4gx3TQ0mVn495SWfV?=
 =?us-ascii?Q?pNq8SzoAAMv+GCOFxgEgiEV7+txZWjvl6JWVDk8rzGMTiT/+BKeR1rjCAXxt?=
 =?us-ascii?Q?VLZVbDEfeTHxDmmuCBgdoOZBMmzfHBU12Q5u61bHm6oR3gR0Vlj1PtFB7LDq?=
 =?us-ascii?Q?nlKQ6oQ08TbNzBAHyE8Y02dxrpEpt+o3vvAXA6AARg6zzlZECWbaxH4jlky2?=
 =?us-ascii?Q?qdVZwjOAdJj7+Hpg3QNC1A7L0804sq5ENEGiRPlW35JKF+dyoiMoh4R8jcnZ?=
 =?us-ascii?Q?eesywh2lKlef+7iU1gL090d50UFocpyHJnVnEZZTin7jIL1bbHCGm+AdJn/a?=
 =?us-ascii?Q?xIhb+GIWcZK5y4/7xau4AM7t92/PMDV8mFGuFFyKdJIY26VU8lTZJZvLNl9g?=
 =?us-ascii?Q?yIz2770rmPeVm/rpFAfaBQOcH08DQOAQCfTL+8knVu4PCsA5ZKQVsPhzWkDK?=
 =?us-ascii?Q?zA5PBMvjRFV96RtvAXU/SedBL320X0ONW2VmQfYcb2zSgujkiHuQw5guGcR1?=
 =?us-ascii?Q?ARxEHBNQA2t1lZcwKoX+tiEJKqal9T3livJja42xgNZBJzmFZXw36aTJgnsX?=
 =?us-ascii?Q?B4y0Bzi7iTOfFLA/likG+i/ywLyrRU0P6GQsHam/6jGsJA4CzbceQXUgde6D?=
 =?us-ascii?Q?GG/Jwq6bZcGujW2ax7Q377cer0a9Nt2WOXR6Hx4L7pbx5dD1qzroCWjeY6eh?=
 =?us-ascii?Q?hk1wuOu+2ltbKjFkV4fa9Pb0UyUH3R75PIx6QZr2LBUCHaLxkVEpstwiCzrg?=
 =?us-ascii?Q?7b88dEiyiaZXH1/oDjmVoMELOOP6RtmH5s43DFVPAOhy40gX7uH2RrjWJznI?=
 =?us-ascii?Q?vXJ60+vyaXAO2fpBtPOa/qoIiJrpj2ulJ+8m1LhhF0cGjs+TaK4cQKV3mnML?=
 =?us-ascii?Q?nLadJKn/G8676DdzMIZd039SmloISYvjXNY8hmu+EJP0OHKYowWC8+QakH3n?=
 =?us-ascii?Q?McAqPYWFgdVVLKPPxiCnFb6cPQ9KABlyzYCM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cvVxMqqu+ofqziSldFJ5n0sLwWvCB8gqG66FG4aSyM/sMQ4tyrjsOCZae0IY?=
 =?us-ascii?Q?o+KRI0eebof65bwKOjhAQQlOhuWcdZ8HrXL9vfUEx0i73b5TqSaDm7e6v2Wc?=
 =?us-ascii?Q?ce8jTBUKaaeyP4g6VmbN/dZtwpUJVYA/E414imHIywmPrEZCEdHambNGrtJR?=
 =?us-ascii?Q?sdnjbsh5/bY3R1fzgcuZsQCfd5RBY9pcIeWCmehYIlRVJpYeM8NCBj96d03J?=
 =?us-ascii?Q?cEbZsdQiX5c2/i/R0rQxGw700cM23SH9lgvsZcircd48MNH89nVwaPHB1BFw?=
 =?us-ascii?Q?DlbfN0cFQrHZ+V9pAeyQi6PT9XYbflkXJokDarOCyDcqj+nIHMg9xq1JK8+u?=
 =?us-ascii?Q?YbNOzmP4V/LNGhtUpsxw96KlPxo8DY4poDdN3+/DlIMXV3M7Am4bDxnSeFDP?=
 =?us-ascii?Q?3jfVW21qiItD0PAGZuNG55zqXjnpvPu3baSA0qrkJckndIRATeKWEOeTOiFk?=
 =?us-ascii?Q?3s/Nzkgm2/yngPb2Y/ZP44Hm3KO8+U+z5mRJCdah5dmZz0JWGKh/6ySs1JTY?=
 =?us-ascii?Q?+IAk7YspQMydqsWagQRIfiteQ1BdqGuf9TS5/bS5UvuPhx7WSHMSpqBwvwZD?=
 =?us-ascii?Q?UQsoV9x70O3TA2TpbhtcjjZjp90xvCChxVyM1OHAZ0pgAtjn+ugOWu/41skj?=
 =?us-ascii?Q?DgU4eKavYqjHLyJBpDlKWqe0OPmoB3M7I5sAnwPvSB9jtTt3h5kmhsKO4I34?=
 =?us-ascii?Q?Vg97ecbvDAKNKzC5xkyTtilxPyv8Nx00tipbc2fDKtEM2Wg0PSuKQD9hZ3ui?=
 =?us-ascii?Q?rDOQUU8M3duX9tNW8yUxY1EZytG0GvD5riPWrdjM7doFaPXpZzVURG3c7cYA?=
 =?us-ascii?Q?JU2J7skJbL+MFI7KhYET4/ggmmjvY/B2yzt4aoWDRNSvXtIcgBl+PGVwprBb?=
 =?us-ascii?Q?I1l7EpqJxr6SoQgB0Sy8q37la2KKRGj2QjF7YMLx7Tw+BCayvPAphOetqwF3?=
 =?us-ascii?Q?/Car1uBu6u4U0mhk6v0wvL9NDn+lWICupHj8BQhmoRnYSwyPwOuoneF892Ms?=
 =?us-ascii?Q?lDcQahi3fpM5itQMirxjXJKH45wHNaeLLdjYHuKAo9vsZ2k1lwkK+IN7ld6D?=
 =?us-ascii?Q?CZkVz27zvPKqUzCSjnE1ZCuRMhxiIFaxoRdQ9NX6+OGxBpVyN5iMRwE6Akhg?=
 =?us-ascii?Q?YntkAWrSkxsIxw2ELrbgw+GJA98g1eWDNE58FLwpCagElrn2tLUrau2HzW8o?=
 =?us-ascii?Q?lsMdHzQXDw9SD+/bZanIoA9ssE3FyRrQUKJm0/xWiaEzbusIYv7FRVz/Fczb?=
 =?us-ascii?Q?C2Mu1GSJ0zv0ocLV0IYP1nUA8j+Eaq0J+tSzz4Dityu8wKtUh34NlWo0ByUI?=
 =?us-ascii?Q?XPN+Xa4FimeTQKEVz9gA0nFG/BVxh/JsZT+CCvhHiZkHtdRHatws0qszNmeA?=
 =?us-ascii?Q?DtYIZYl1AJIEfSFoXiqPFmzarie9+phQA98MtjPDGE0LhbVSW/7jIQ8rmaPz?=
 =?us-ascii?Q?Sgn65utRmGMmWI/007GhRVekCLkdADfZL9gF0L0wCmFZLgEnEFfMCh9jIqLu?=
 =?us-ascii?Q?uNuNVnk141SDUv76lL3NkeCieQ7NcJe28fp5pzUPl3ZENG6qbrIidAiNua3Y?=
 =?us-ascii?Q?8y6xTLVk9Ym9iEyK+SrfIXSRkJJoAVq5oWcc9P1Csv8aumpkIJFYpdfDD4XJ?=
 =?us-ascii?Q?mXHlYeSTsmdY7UDBWUHmn8vqEEMetnAvpjftm88NxXnX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20906230-0fe8-43d9-d536-08de0b4c5dbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 18:06:15.0502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHkky2UcOqP958SRcNr67h1eFTwE8PsfolDtL3Wzk5jHFqbPQSZS2IuIfTXhYjIovQVCQRI+L1WhB8rxJnZrs1m75PDyfH3FgQAZwNiItzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8084
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
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Tuesday, October 14, 2025 10:51 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.c=
om>; Roper, Matthew D <matthew.d.roper@intel.com>; Vivi, Rodrigo <rodrigo.v=
ivi@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 7/7] drm/xe/tests: Use any available GT for testing
>=20
> On 10/14/2025 6:48 PM, Jonathan Cavitt wrote:
> > The xe kunit test code expects GT0 to always be available as a part of
> > the test setup.  However, these tests are generally able to run the tes=
ts
> > using whatever GT is available, even if GT0 itself is unavailable.  Of
> > course, if GT0 is unavailable, then the system itself is likely in a
> > non-functional state, but this might change in the future.
>=20
> in kunit we build our fake-Xe-device by ourselves so we *know* that GT0
> is part of that xe, we were just using existing helper to get it, and
> equally it could be:
>=20
> 	gt =3D xe_device_primary_gt(xe)
>=20
> as suggested in 1/7 or direct access as:
>=20
> 	gt =3D xe->tile[0].primary_gt;
>=20
> but the latter should avoided as the idea was to use as much as possible
> of the original driver code

Maybe instead we can just use xe_root_mmio_gt?

>=20
> if your tool is still unhappy, instead of adding yet another helper like
> xe_device_get_any_gt() maybe add some (redundant IMO) checks like:
>=20
> 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt)

You mean KUNIT_ASSERT_NOT_NULL?
-Jonathan Cavitt

>=20
> and maybe just one in xe_kunit_helper_xe_device_test_init() will be suffi=
cient:
>=20
> 	xe =3D xe_kunit_helper_alloc_xe_device(test, dev);
> 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>=20
> 	err =3D xe_pci_fake_device_init(xe);
> 	KUNIT_ASSERT_EQ(test, err, 0);
>=20
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe->tile[0].primary_gt);=20
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe_device_get_gt(xe, 0));=20
>=20
>=20
> >=20
> > Add a helper function that returns the first available GT, asserting th=
at
> > at least one exists.  Then, use that helper to return the GT for use in
> > the kunit tests.
> >=20
> > Note that since the helper function is only used for the kunit tests,
> > it's existence in xe_device.h is also predicated on the kunit tests
> > being enabled.  Additionally, the helper function is logically identica=
l
> > to xe_device_lookup_gt(xe, 0) when that gt is available.
> >=20
> > v2: Reword commit message (Michal)
> >=20
> > v3: Add xe_device_get_any_gt helper function and use that instead
> > (jcavitt)
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  2 +-
> >  drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  2 +-
> >  drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  2 +-
> >  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  2 +-
> >  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  8 +++----
> >  drivers/gpu/drm/xe/xe_device.h                | 22 +++++++++++++++++++
> >  6 files changed, 30 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/=
drm/xe/tests/xe_guc_buf_kunit.c
> > index 592dfce21add..656574e6cfb0 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> > @@ -63,7 +63,7 @@ static int guc_buf_test_init(struct kunit *test)
> >  	xe_kunit_helper_xe_device_test_init(test);
> > =20
> >  	ggtt =3D xe_device_get_root_tile(test->priv)->mem.ggtt;
> > -	guc =3D &xe_device_lookup_gt(test->priv, 0)->uc.guc;
> > +	guc =3D &xe_device_get_any_gt(test->priv)->uc.guc;
> > =20
> >  	KUNIT_ASSERT_EQ(test, 0,
> >  			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gp=
u/drm/xe/tests/xe_guc_db_mgr_test.c
> > index 5afdf7887098..e3330099e970 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
> > @@ -13,7 +13,7 @@ static int guc_dbm_test_init(struct kunit *test)
> >  	struct xe_guc_db_mgr *dbm;
> > =20
> >  	xe_kunit_helper_xe_device_test_init(test);
> > -	dbm =3D &xe_device_lookup_gt(test->priv, 0)->uc.guc.dbm;
> > +	dbm =3D &xe_device_get_any_gt(test->priv)->uc.guc.dbm;
> > =20
> >  	mutex_init(dbm_mutex(dbm));
> >  	test->priv =3D dbm;
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/d=
rm/xe/tests/xe_guc_g2g_test.c
> > index 3e77f501e27f..2a4429101c6d 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> > @@ -355,7 +355,7 @@ static void g2g_distribute(struct kunit *test, stru=
ct xe_device *xe, struct xe_b
> >  	struct xe_gt *root_gt, *gt;
> >  	int i;
> > =20
> > -	root_gt =3D xe_device_lookup_gt(xe, 0);
> > +	root_gt =3D xe_device_get_any_gt(xe);
> >  	root_gt->uc.guc.g2g.bo =3D bo;
> >  	root_gt->uc.guc.g2g.owned =3D true;
> >  	kunit_info(test, "[%d.%d] Assigned 0x%p\n", gt_to_tile(root_gt)->id, =
root_gt->info.id, bo);
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gp=
u/drm/xe/tests/xe_guc_id_mgr_test.c
> > index 8b29db38d394..ee30a1939eb0 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > @@ -13,7 +13,7 @@ static int guc_id_mgr_test_init(struct kunit *test)
> >  	struct xe_guc_id_mgr *idm;
> > =20
> >  	xe_kunit_helper_xe_device_test_init(test);
> > -	idm =3D &xe_device_lookup_gt(test->priv, 0)->uc.guc.submission_state.=
idm;
> > +	idm =3D &xe_device_get_any_gt(test->priv)->uc.guc.submission_state.id=
m;
> > =20
> >  	mutex_init(idm_mutex(idm));
> >  	test->priv =3D idm;
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu=
/drm/xe/tests/xe_guc_relay_test.c
> > index a891b1e0644e..8577a721cf42 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
> > @@ -38,7 +38,7 @@ static int relay_test_init(struct kunit *test)
> >  	xe =3D test->priv;
> >  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> > =20
> > -	relay =3D &xe_device_lookup_gt(xe, 0)->uc.guc.relay;
> > +	relay =3D &xe_device_get_any_gt(xe)->uc.guc.relay;
> >  	kunit_activate_static_stub(test, relay_get_totalvfs,
> >  				   replacement_relay_get_totalvfs);
> > =20
> > @@ -476,7 +476,7 @@ static struct kunit_suite vf_relay_suite =3D {
> >  static void xe_drops_guc2pf_if_not_ready(struct kunit *test)
> >  {
> >  	struct xe_device *xe =3D test->priv;
> > -	struct xe_guc_relay *relay =3D &xe_device_lookup_gt(xe, 0)->uc.guc.re=
lay;
> > +	struct xe_guc_relay *relay =3D &xe_device_get_any_gt(xe)->uc.guc.rela=
y;
> >  	const u32 *msg =3D test_guc2pf;
> >  	u32 len =3D GUC2PF_RELAY_FROM_VF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MI=
N_LEN;
> > =20
> > @@ -486,7 +486,7 @@ static void xe_drops_guc2pf_if_not_ready(struct kun=
it *test)
> >  static void xe_drops_guc2vf_if_not_ready(struct kunit *test)
> >  {
> >  	struct xe_device *xe =3D test->priv;
> > -	struct xe_guc_relay *relay =3D &xe_device_lookup_gt(xe, 0)->uc.guc.re=
lay;
> > +	struct xe_guc_relay *relay =3D &xe_device_get_any_gt(xe)->uc.guc.rela=
y;
> >  	const u32 *msg =3D test_guc2vf;
> >  	u32 len =3D GUC2VF_RELAY_FROM_PF_EVENT_MSG_MIN_LEN + GUC_RELAY_MSG_MI=
N_LEN;
> > =20
> > @@ -496,7 +496,7 @@ static void xe_drops_guc2vf_if_not_ready(struct kun=
it *test)
> >  static void xe_rejects_send_if_not_ready(struct kunit *test)
> >  {
> >  	struct xe_device *xe =3D test->priv;
> > -	struct xe_guc_relay *relay =3D &xe_device_lookup_gt(xe, 0)->uc.guc.re=
lay;
> > +	struct xe_guc_relay *relay =3D &xe_device_get_any_gt(xe)->uc.guc.rela=
y;
> >  	u32 msg[GUC_RELAY_MSG_MIN_LEN];
> >  	u32 len =3D ARRAY_SIZE(msg);
> > =20
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_dev=
ice.h
> > index af9476879454..56fe0be86b37 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -150,6 +150,28 @@ static inline bool xe_device_uc_enabled(struct xe_=
device *xe)
> >  	for_each_gt((gt__), (tile__)->xe, (id__)) \
> >  		for_each_if((gt__)->tile =3D=3D (tile__))
> > =20
> > +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > +/**
> > + * xe_device_get_any_gt() - Returns any valid GT, asserting one exists
> > + * @xe: The XE device to search
> > + *
> > + * Returns a pointer to the first available xe_gt struct.  If no such =
gt exists,
> > + * then the system should not be functional at all, but just in case t=
hat changes,
> > + * assert the returned GT is not NULL.
> > + */
> > +static inline struct xe_gt *xe_device_get_any_gt(struct xe_device *xe)
> > +{
> > +	struct xe_gt *gt =3D NULL;
> > +	int i;
> > +
> > +	for_each_gt(gt, xe, i)
> > +		break;
> > +
> > +	xe_assert(xe, gt);
> > +	return gt;
> > +}
> > +#endif
> > +
> >  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> >  {
> >  	return &gt->pm.fw;
>=20
>=20
