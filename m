Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E90FC71155
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 05:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8996B10E467;
	Tue, 17 Jun 2025 05:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dofvo4n5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14CA10E467
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 05:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750136858; x=1781672858;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Yqy+8Bu9WMDOQqFNmsP3MszXgxMqucSG0TiApmQggi4=;
 b=dofvo4n5zq4jZTd7hbYt6U+m4pbu5w8HxPnNaoqH+HkCbe1zsbnLkGm4
 7njU3TtGAc3iOdQ/IUiHpKnFNZeD3URUg3WEdPeNK2pQYolC8+K8ndQFa
 v2fPvHQwthoMn9dJBU7Fzel+BPjpUVNlPZrsvoOzw/8TaOxRrzkSE7GGV
 fOEUO+YcVB/Bm7eC+5HeHpc9FTGymK3qw/1CgnA0BRjGEQieKFbA7WC73
 eTR8iAoFCSF+UCGesDCbY10yuzScZuEgRERTDeU+851zVBHndTBhSq0ii
 PUL4lnDYxSzJ/DftbwlAfvv5vBSn/SYt/JanmdDqWfJOWHoVYabQL3G/k g==;
X-CSE-ConnectionGUID: 8ZVjvN6fSgCfxuzMEybMwQ==
X-CSE-MsgGUID: U4Kw1dNCQRWwdpJPVSEGrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56101117"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="56101117"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 22:07:30 -0700
X-CSE-ConnectionGUID: xEE0tH6YTo6bGozC5ZqSKg==
X-CSE-MsgGUID: IlePX43PQNWs1BvvmWzyOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="153966515"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 22:07:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 22:07:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 22:07:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 22:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFBFy9RfH7BLZo44iEUGRtnv4Aa7EpYZcTd8gzoMxt4kxZFzKI4BC2OUKYGgd2/6xFC6RtCdkfBe4U9e5LgGm6D7rnruMGCUz2JoTgYBC64QZqe2qv1yNblzgSo74XiZBrSvmDOznAAldcO2uljZnmXdX5IEgF16/4ZGekZ4FX6Fx00tkh5EDdWQLzTWEK6iVzXNcZ7YspMs8uYpdMgfvcv7tuNc5W2eZLK+IZE0Lqb7k31lkbOgCxmcH8dvU3JNAWqDrSosTfyC4n+fllDSN8DhqZqJn0e+qz/StQNuM9cAuNCqqoIreshMLK6BqnJAOKsJet0dLKVMAohkkYTFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbOW56+n247Qnaslt56s8k3uK3qeX0MDU2GM4Zv2NrE=;
 b=q4lhbRH4az9OiSC1B21U3UuBzjvxGea5cgN8APfI7dCgx12f9Uwr2aJDpbdSJ9DcTFbxvbsH1BbWyFpJW/mo1L4BGT88QINC6ooFUh9Zmh1GwZ2gQSchtY6SwNSvR210ZfWpjzjzxlIKvKpaERs7io5l1UvdxVE5cH9tRWEIg8UvRdTpqHioZ8zi6vmaJ0zEmUf6DA+GGCxH+kdQ8zTV8PXGEZSsnGFczBvshmiwLJm62lB17HP++3Zz8XT8XCyEttOKsYJAWdG/e7yEnTmPCtyo6Og0Jz4b6J3eZn8SmVbl2Xzxc/Kom7pWOgmExNO6xPLgxl0ABtP/K5AE5Y8Cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB7519.namprd11.prod.outlook.com
 (2603:10b6:a03:4c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 05:07:21 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 05:07:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Topic: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and B
Thread-Index: AQHb3JniEvCDxlpTY02mQFyxzTgU8rQFeNtAgAB9voCAANqpAA==
Date: Tue, 17 Jun 2025 05:07:20 +0000
Message-ID: <DM3PPF208195D8D168DBEF7523422288F50E373A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
 <20250613193146.3549862-9-dnyaneshwar.bhadane@intel.com>
 <DM3PPF208195D8DF1F76C172386940583D7E370A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <IA1PR11MB6266B72FDB377689AA1E741AE270A@IA1PR11MB6266.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6266B72FDB377689AA1E741AE270A@IA1PR11MB6266.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB7519:EE_
x-ms-office365-filtering-correlation-id: cbe5c5da-5d5d-43eb-2026-08ddad5cd6d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qJYfAgGeYesCytdhuA/ETWy/8303olfu3lpgVFC3k9x7zTfJsh8hewFvT5es?=
 =?us-ascii?Q?hRUbB7Tn2zkv16omIO8m/4n95mllh1QSzZPuH4CctwMPGEv1ahJdXLDevUgF?=
 =?us-ascii?Q?NGWhvjNWQG+YAuzbnevWDA5kAHws3yW/FsdQ3H2Qz8Ih9fp50SYMpVSXvDMY?=
 =?us-ascii?Q?HHOkEf3xU8V5ZvZQqhqTHRTgFoBomxCueCCQaIQZsIfKNy0Os8n2flTaeu9M?=
 =?us-ascii?Q?Yz3dSOEiv43ttkfuRo9th/gUbRUN9135FcioamUDFdJED59AA0vWLc1syqbB?=
 =?us-ascii?Q?EjG11RvQ5Jla14Hpx8g6KeLUOPWc+xkyive6SO2L7laWF7KDPfEzfxhhpRlI?=
 =?us-ascii?Q?MJUc4afB0vIroElh9dQWCToxReCZ7FWYPgJRh2/tBrsAeY5ZX2Zuyzx1thSu?=
 =?us-ascii?Q?2dcObEUQpAW5r6F7QlxNOKxIPQF3bAHJ1YWb5c1kKNxKcpsBQSyWqMRb0BD8?=
 =?us-ascii?Q?MRphj65rVtO9nGkeljGe6TF7AvJBoTRyK4peJ7qRwJHjpXeMPedU8+/hCRMd?=
 =?us-ascii?Q?h880HlcvYlA67YGojQxhjkmibotLMPjCtLPOi/rAu6rIKfGVSYbwnmhRd18j?=
 =?us-ascii?Q?eLPmMmypNhch5crK1WG5yGtsZ2gjbmUej1fICrYP3+W11dOKol5Y7YH/xACw?=
 =?us-ascii?Q?Og3gVxI0sqWWSmwKVOfh4A3tHMo842m0awxOpjkJy1m/Y5F9IzufBMCU2Pep?=
 =?us-ascii?Q?XbTR5pQAAZZj8Gl0SMzs9SQCVnE5HXBQNo8jYVo0HHBosWyYssJEdX9MzfKW?=
 =?us-ascii?Q?mRuIVZVCrcDOXVV5TxcIZFpxeAsPyEfgP4Y+T/fQfBTL6nM/4t+Vw96fZnig?=
 =?us-ascii?Q?r086p86HziCXzyi/DWP+fMDiBd2xQdy6uEjG8q9aWW+L30yYyFxVo1vTLMco?=
 =?us-ascii?Q?rm7XneSjHvU3zz9Sgg28rAV7y/QwxwcqCuucqEXnWUZHjmQQD6Q+gwfZp3SS?=
 =?us-ascii?Q?riO62uBt2PjABoiDs4jB3kr3XsnPtE/aeIlQM6neSN+jI8T7n0gtMCdiEQHj?=
 =?us-ascii?Q?vlef9dFzWRH6urO+Fzvmih+mYoezeens1RI4SLT0HGHVmYTF9J6JiSVeK2f6?=
 =?us-ascii?Q?FcD9p+1I2mIjZj5F6+FPVb6o2aQ2Rw8Rvn4XdPp8V3eM6Oe5Cu7TJk83SoyF?=
 =?us-ascii?Q?AaeblmTE+/LuXDKQBKRzKXzWwxjR5Foidr5V1HUX3P0L7QdMPBCDHoVoNMD3?=
 =?us-ascii?Q?4deS7BIC3C4qGpsgttDjXUITDV4K/URvY9C8yU7Ek46YuobE5FW4lBSPDfON?=
 =?us-ascii?Q?XgdKcpvDnlAo3n4AQkfYATBUqM+/36sXK+rQD8/hZP4ts2p4kjEDzZ+f/xwB?=
 =?us-ascii?Q?qVAU3v8ruz++w3iXlqfg5wgQ61tcXg1NIVw3bZYep9Kjk3YId+lwht3cie6g?=
 =?us-ascii?Q?y0kM2mq5mXCXDXT26F//MqCURbLlB7jFl/akNdH3aX4+/t3UmRtvtjcofCgf?=
 =?us-ascii?Q?BQHqPjztIprIc8poG/J5XkFIagKCAlQC3LZswmxidqGXwTTJeN5CzQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MtR0ze3i+ve87EvFfT4LfKkwvnZp/tWgUCn1pMC2lTeEEm7bD1oQhNXdbxVa?=
 =?us-ascii?Q?hepPJRdKLD2dlR4z5ETZ5I/XSEQQveyHp/fxIVPBMNQCuOhg6NkxYhJDqMf7?=
 =?us-ascii?Q?P/Qu1U7BTxGcJ3fCjHPPsZKltdhhO5BjcQUA+Jba/rKqQNFG0Vg7ZV3VVXmf?=
 =?us-ascii?Q?BnDpD4eGzeBOB34CGnhOePWgSlBbFCRq+H7C8i3xwak3lGWNI4cdfMEm1Cv6?=
 =?us-ascii?Q?cbDdJChYwtwKKSawgWoxDpuNOTjRh1P0CWiJuNPRoN/aKULzwSiuDtHT/FOX?=
 =?us-ascii?Q?0ua8gBs0/XAK2R8e28JCYzrTFIiF1qqm4APBEpH7iSyfsoYrk+9anir7CHpK?=
 =?us-ascii?Q?Q2d9WKzePfRait4mEeQNcID/1YcTQBz4zMV2NtRGjS3OhmQKLnLEf7vdp/Q5?=
 =?us-ascii?Q?AkNb5SZw/NHYzrCIuJCn14TkMf3A3kmE4gS96R0+Rw7BdOuw1vIJOIXKNfVQ?=
 =?us-ascii?Q?xZTRKWYFMWGQVeoGtwl6WazQy8RouXO/9yeRYmAtZC70oQbDPOB8dgB7Trp2?=
 =?us-ascii?Q?+J5cr1hedJ5fZPeyKASah/ynCQq5fagQJ7k7GoFvmxyDlANFalN5VE1bWB+n?=
 =?us-ascii?Q?Rizir8XB1L+rKjSHkX+8d11OCUl6YEF/JFiTnI/75gGTaEUvP1KR0r3AM456?=
 =?us-ascii?Q?DJ3kS38p/I4d14W0W62fw9TvK+LZqKsTBti89DjNI9nKJdGRmVX1x1tNBFDM?=
 =?us-ascii?Q?C5YFnG5QIrpHmGlOwA3J62jl6rpa/B/k/7oY0GAZmqPPrLBo8h9Q9bP+7F3S?=
 =?us-ascii?Q?vaAEzyppv4mLW6sQYkjNzuOU3qpCW26XP09URXhKWpqeg5IIYJ2Qn6qQQg1T?=
 =?us-ascii?Q?g88miErYsVpWcgsdWk6V4inngPprTE5BBAC2xQpWZ0xrdEDtJGrf9mBy3elG?=
 =?us-ascii?Q?hTw18+6o1pfitle9hGmdcjC3begjYxZmu0aAR+A+97pk0C/fiH8VeZnPk0mJ?=
 =?us-ascii?Q?rOYpkb/BZQCoP7qG3TgWt7wyHN6uiisTZtbWvAN0ussoWuQvQ/sd9Ims4Fcj?=
 =?us-ascii?Q?fS+d9GI5FhBKFtQ9GwvLxPIcyXkkLlL9LNBCUH989iyXT0UkHgrwt4yS5fWD?=
 =?us-ascii?Q?pkrwIiOmwxh3/g49gufJZ3A8yCs6HCtzEFc4yAyLCv4SvIyi2eELG4DiWCtq?=
 =?us-ascii?Q?2CNWh/W2bwYkPMKag2EbYoLovBhFe9kXvVFa/8itBm5rPCCIn2z9vXzexXfi?=
 =?us-ascii?Q?lcDoqVb8hP/ISe7Fp+HBXxqq4FAYE99dptdirj3jO9W51Emp+/53R+2jF3vh?=
 =?us-ascii?Q?T1vPV89lFD0fkuYeYn531vjBIdDOErrs44hShiEV9poSxpRi13gt5fHhR6fc?=
 =?us-ascii?Q?KQ5zx4LqRkYjZxwIbobYmI5sBb/kpuQVWwb7lIVEaNmFiP4TAzWSbkELkGpd?=
 =?us-ascii?Q?UPMoHK+sCOzwgUi3UisPEEwYiOpJddFPauPM+d/nxjGCL/orWOl0BS68q3H1?=
 =?us-ascii?Q?vbuy1dx7TprFZE2SmJV8tKsikF1/HCGE4uBD9Npf2z42oib2GxqfxAmirNJ3?=
 =?us-ascii?Q?3qPZlyeb6olFeSA9ndcqBfCe2VPsYzXcGtoOC1T8N38lMCtVhsWHlRpQANZ9?=
 =?us-ascii?Q?M7DjlydvoE0U5nKdLFDGDEdwgbWmQ0SjNmNwqOcI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe5c5da-5d5d-43eb-2026-08ddad5cd6d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 05:07:20.8973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: skeKNvw2CisElREYecEpsO0s3SUj1aUsKliXThzCH+/T2ICXQXJaZhPdXqBByySqNIT6aqeGTNVtwMCgu12E+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
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
> From: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Sent: Monday, June 16, 2025 9:31 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org
> Subject: RE: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A and=
 B
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: Monday, June 16, 2025 2:09 PM
> > To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> > Subject: RE: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A
> > and B
> >
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Dnyaneshwar Bhadane
> > > Sent: Saturday, June 14, 2025 1:02 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> > > Subject: [PATCH v6 8/9] drm/i915/wcl: C10 phy connected to port A
> > > and B
> > >
> > > WCL added a c10 phy connected to port B. PTL code is currently
> > > restricting c10 to phy_a only.
> > >
> > > PTL doesn't have a PHY connected to PORT B; as such,there will never
> > > be a case where PTL uses PHY B.
> > > WCL uses PORT A and B with the C10 PHY.Reusing the condition for WCL
> > > and extending it for PORT B should not cause any issues for PTL.
> > >
> > > -v2: Reuse and extend PTL condition for WCL (Matt)
> >
> > Add the bspec reference here
> >
> > >
> > > Signed-off-by: Dnyaneshwar Bhadane
> <dnyaneshwar.bhadane@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_cx0_phy.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > index 83c8df9dbc0c..ed8e640b96b0 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> > > @@ -39,7 +39,13 @@ bool intel_encoder_is_c10phy(struct intel_encoder
> > > *encoder)
> > >  	struct intel_display *display =3D to_intel_display(encoder);
> > >  	enum phy phy =3D intel_encoder_to_phy(encoder);
> > >
> > > -	if (display->platform.pantherlake && phy =3D=3D PHY_A)
> > > +	/* PTL doesn't have a PHY connected to PORT B; as such,
> > > +	 * there will never be a case where PTL uses PHY B.
> > > +	 * WCL uses PORT A and B with the C10 PHY.
> > > +	 * Reusing the condition for WCL and extending it for PORT B
> > > +	 * should not cause any issues for PTL.
> > > +	 */
> > > +	if (display->platform.pantherlake && phy < PHY_C)
> >
> > Just because PTL does not have PHY connected to  Port B does not mean
> > the code wont come here it seemed like this is the check That made
> > sure we go to c10 PHY and with this it will go for c10 phy when port
> > becomes port B
>=20
> This would be case ever. No,
> PTL don't have PHY connected with Port B so this would never be a case ev=
er.
> Specs: 72571
>=20
> As you could see similar condition is also extended for lunar lake which =
has
> the don't have PHY connected with port B,
>=20
> Dnyaneshwar,
>=20
>=20
> >
> > Regards,
> > Suraj Kandpal
> > >  		return true;
> > >
> > >  	if ((display->platform.lunarlake || display->platform.meteorlake)

Got if that is the case you can merge the condition with this check since i=
t basically does the same thing.
I would get it if you are holding out to see if the wcl platform check come=
s in but in that case I would say
Wait till that comes in and merge that change.
Add the Bspec reference in patch before merging

With the above fixed

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> > > && phy < PHY_C)
> > > --
> > > 2.34.1

