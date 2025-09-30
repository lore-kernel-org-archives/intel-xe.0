Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8023CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 05:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863DB10E4C1;
	Tue, 30 Sep 2025 05:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GI853mGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C915D10E4C1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 05:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759208683; x=1790744683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mOE2EddvkpRKETk5FmaMk5+DJ/XrDpWvc7dyeQgLr2Y=;
 b=GI853mGDCsREO9A+K8CoBdn57ytwMEJpd6+trNWY+ADHQuX2IsHBlB7M
 kHaaPn2Yi9UArMfD0C7B1B6IoxC6JCek25sxGs3pwqcAGP7Foby26dWlb
 yjxOItcwV47XTYlhl3DoZi5Oz+ZRXdwQws6ROe5LpLvjzzvkTFb3sy3VY
 FXxgRaiRVXIa0G+OwZhCwIhpjUUUX4Vg84Oh+NzJuow22qkC7rtjRBWN2
 RJOp19zY+B0SHBd2zvj0684xbeZRojY804m1ZzY6/nIV4VhaF5IaxA3Wk
 Cio7jFgOGBW+EhpWpIB11pCec+jl3VjKdH0EXkJkIxbbERZbFPjb8y7LR g==;
X-CSE-ConnectionGUID: iTFYkfajQ8qxfiEHF+yVeQ==
X-CSE-MsgGUID: IkS9yCIpQtCbNjz+H+huJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="79105637"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="79105637"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 22:04:43 -0700
X-CSE-ConnectionGUID: dD4qLDsRTIeUZVxlyHEtDA==
X-CSE-MsgGUID: TY90wE8SSkK0bSRQECRJMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="177672484"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 22:04:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 22:04:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 22:04:42 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 22:04:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGJ4XjOVNfAd7GbvR2tZ4jWGexFGlXJi91ZXU129WPuWWwGdEQqWxqiYFBsTG/MsL3XgA35r3GuCChkefyOAiBIl2RtxlH8cbxUZyhxVpQ1U2gCypEQ+acn8qGQW7r32p+X0OqtHfFUoZJkS7+e9M0mHr6+TYgekBPti+ujJbrqJdiM1UsG/N8wybXy8jPI6d98qV+38G6ohn27kVHqIddOREoKHO5k2UTWpPQvPJ/BbqmxuoJ6B3ZRZNFVaN+LvXiiue6ye1w9rXq1BzmMIeBJv9KvYUI/C52RdSsjTCefgRW8KJLtDQvrdGcbmDyJNyfYewioYBW5akz/Qm7WzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD49LqJBrkgCYMLygm8RWe1EUMT4XvL3QlyGhV3mPEE=;
 b=cJQwWeUnOEwHOFjhDTWRQ8rxpsElIUIVG3ZgviWn6XQohsT1iGfVLYBdPW/b6zobUj0AGxqFBB8iVXzMvGs6EcDOGgjTL6X4jY4vhlKWFjPXEDllnlDGesVE9+O+J5HXsdJBm5xZItPk2L+BKSeN70CBcrRWR34SDCdczVqxwEZOaBknajEt2hdS/Zqo+LsSIINK3xhzzQTxDoMdZJtIQ1j3waVq4bo4cKKqXLPm+OqsKloX0G8mdQdUZwKg/32gJ6B31BvrPCnh0cb6E6RSDwlOiIMa5O2AhFhI9LV3AEkO4nig+hSUMXIHhiNCQMMYFv7o0+i7Aaqe34CBcFObqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 05:04:40 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 05:04:40 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary
 GT is disabled
Thread-Topic: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary
 GT is disabled
Thread-Index: AQHcLna4YtohRulY80CFQI9utytB2bSk9YQQgAW8zoCAAH7n4A==
Date: Tue, 30 Sep 2025 05:04:40 +0000
Message-ID: <SJ1PR11MB6204FE23C2E49E378DE08B1C811AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-32-matthew.d.roper@intel.com>
 <SJ1PR11MB6204A152184AE9D2C4A0C5D2811EA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <20250929212549.GF10167@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250929212549.GF10167@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB6214:EE_
x-ms-office365-filtering-correlation-id: 0f1b2a02-0dfb-416c-7606-08ddffdedc7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?d6gqBjX6T/RyrPzWmCW+Xu2fCSQuyh28wO9YcT1jngDceE83yVnkEq5fopnB?=
 =?us-ascii?Q?wh74yNzyXhnp2uinZShqaEz0ubRh2ur1cINEu/u/hwo5604UpqAKJNhC7urW?=
 =?us-ascii?Q?B8gk9Z2CFAIP7lS6FPX7qcuowDb9T2BbnooAvwMaHstHHoatjtJEY1e52x1o?=
 =?us-ascii?Q?ZKDbsLVYx+VjJofCRfAfN+jmVPP37931799CjSoHVvSCBu8Wl3W8x0BlYydF?=
 =?us-ascii?Q?7k1Lq3tFeVAcS37sggIC3S46jebNfCJXSAaU2l+/gZapUpPS1m9ATpkfAH+w?=
 =?us-ascii?Q?Jd0oaKlz2eumkDO94OpYdNONJfAuoh2Ttjp+mRW3s+wGQLrEdYYOorggXZKC?=
 =?us-ascii?Q?KzfGldrHNDSAIvoy1TFm5yslpUo5B+IwvRxKwnQc62/NbmlA3ubkYmLrc1lp?=
 =?us-ascii?Q?lmHLrdf8XEmiSCwcTGN5TMyLl0LY5dPf4OfZZ1Unb3vxLRS39hLODAJ68uWE?=
 =?us-ascii?Q?a+YvhtcwdCaCB8KVu8qlj1NpslxeftXRRiaSCrJ0910178FqSAeBcBeaO/Gp?=
 =?us-ascii?Q?lCtpXr/uT/xokEDHCq5TXXeYjy/52euNDqMWtRr9a+opfEMhYJZ0jmd3APgl?=
 =?us-ascii?Q?AJBXWAFQ9hJoVV+ZzYjWAwwzlad1QhuPExj6R9DQrpG1RBV2KEEKN58qKAKD?=
 =?us-ascii?Q?IJfaH/wBaUPbUGXRAAavXngizbY+otdvy98IxEftnYzMAg6VUpObuRTAcTG/?=
 =?us-ascii?Q?ZelbA3dc1Ad6WMKn30/bNKufXavK7TieSh8gGsnpCpFHOe2m1skpEaccjtqw?=
 =?us-ascii?Q?xrsuhJCozHdEN5aAm3JIL3TTEf8quIf5aNXr+VeQERmUsw51dZYbJ0J+y8Fe?=
 =?us-ascii?Q?AeSDxseZ8WCakunoO0DegOkMjs9sz7M/tCHwU45qegr/2mA3sVNupASfRpY4?=
 =?us-ascii?Q?QI9LIzfi+sERm7J9tuN1dlIC/uajvZLzoORxBxjnLZG1hQF6lA4a+oDgWc97?=
 =?us-ascii?Q?zhqRtDxEgfbmbY0h2y6xDJKJ8ngq1zwFMaFEe64EGNpPho3E3qUUCfW4YT5F?=
 =?us-ascii?Q?0dI7Ry2UXnE9mwoTTpFFBs3GGOJ+99lk7b2YJQi65tgcRZCtfRlFPss4Ek1U?=
 =?us-ascii?Q?6GuLFddmz7rrIAnw6zhVMpKWhc7K44ghatRKyRNdSmiPdxrcK0Tgk9F0SJza?=
 =?us-ascii?Q?g6CgK26f/miko3bku1pV/1N6GzuJa3DSFffGBE5Buk99VoCz9JUUiSIeeZmH?=
 =?us-ascii?Q?t0vPBId3L9cJyT5X+WTgHNxFNBT0P/OX+d3VOvPG8M/R0IZHp/WYPjwhC50l?=
 =?us-ascii?Q?bbXkUduwhYtc8llhczaOQfRD8UdOexx8BdNjxl//9IRhbuIlRUIRwvpTQFjY?=
 =?us-ascii?Q?xDM2OLPMXAD4eKYYaCAxfaVCgE84G+XKtX6ZHjBak9LMq7wIfIGlOC+zsJ0n?=
 =?us-ascii?Q?3I5k+8p1Z8wCotsj8I5Uo5NgRReY6tdvM69iTa5nh5MfPdTfsj8I6mC+aV5W?=
 =?us-ascii?Q?+OFzOQG4GS0Ov28ClBFFNh2ahMXYxQqxClfHB7peLjvSlOIpuyardl58obII?=
 =?us-ascii?Q?fqSfhUfySIPV/PPfygulFrpEXjLa0eUsDrWe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iL0IaTTnydTUegRlfO/It7AYJ712Phcrzcp2B4MutwQVXNobrXk/XgrAPdyb?=
 =?us-ascii?Q?HR23Jr62U4iKagSbWu8i441iOBFqanNBBbBo3gYDzG2+E/DthDAQlvqpHfZc?=
 =?us-ascii?Q?5WyRTnGHCHJP26fV8GEkGSk1qI5qztC47MkbnjiHdAd+v7bJemNNab3bXgRj?=
 =?us-ascii?Q?FBZZjMeGH1PWmqrjwpLqlPa8jUFDRzCm9SFQTWXddk/yNsJlepmNj5Na4D5H?=
 =?us-ascii?Q?6LGRAcvWrA2zmjLhqRCi3xL9X0G+Yep16285izObv/3g2XVr045W6TS0WgKj?=
 =?us-ascii?Q?xZdkt1ycKynSpO4/nNIOixGy4I0bQLZ5TzqKAsFawWH3RHucq4btd9y1Yfnt?=
 =?us-ascii?Q?f9M9i6teskpgTl+H0Rac3DRdwVNgvPpl3jQKKOM0n960mhRZyLWXgHLewjvN?=
 =?us-ascii?Q?8QyzYCiJD0irYcLUQQjEycDiRZS1LkabIyXeLsaaHmLCr32T+pjie0f8SjFD?=
 =?us-ascii?Q?q/NdwqHa7kDWv7n4uFAawSIS54/RcCdOag8OEO+uaYMItQAes8RDosmykQT1?=
 =?us-ascii?Q?nU4YNK8KGs/cbOK0ME1cVqWVfrrWeisDDMEq0mv2xtY4ILQXxCQgBjK/Q8ua?=
 =?us-ascii?Q?VbkYSbcwN+duf4JgKfRBbfdYsargrJ1sHsNTKs7XpI4jCKhltQ/CHTPCbtKo?=
 =?us-ascii?Q?1Xf52pb7z5fYwy3uG9tZleCozcekqddQlMFLkbvwIFxRKZQB/YYNu9/pqpjq?=
 =?us-ascii?Q?PsFaQzfLI/52cfxJtji2Gq9/vs+khLvhylyPqBMB8ByZIWJV1KZfKRe7Xd0g?=
 =?us-ascii?Q?aTPh75ZLvD2TU2QK3hishtMsVmk3RrLPmKFZJA5lMjADMmbcIjUnVXF7A7ek?=
 =?us-ascii?Q?BsADoCa03V8twHIGIacuHjEN3x44/yJCL7vECbFTK/qpsDaaF+w/wrFBfnHj?=
 =?us-ascii?Q?Wyk1mFhjwN3pw1iXbuV6cqLW6CTgthN6zZxXdMQmsgm0aH4Re0J/SOKgBKk4?=
 =?us-ascii?Q?DJIX2unMxb8zM2f9jRyXD6bbMHcJL9oKK5ycUtnqqUl5HkzLsnMbOZyGNlwD?=
 =?us-ascii?Q?KK90/UsGy6DDKLxeyd5gss8nOaE7JG4B398UxPdwh80qLWE4+Jr/LohAZBAP?=
 =?us-ascii?Q?wPeyDTq4qEkkFzhmfCOHPmS7eTarikqlPfF0vhAzj3PxECmkvn/KW2yPtLdd?=
 =?us-ascii?Q?FLaYymvmW0fMcCshYDnNHzMVrqfzEFjiKNHAOgnu+6rNoVK5vq94gnrWh07D?=
 =?us-ascii?Q?3Ti3cbw5svaetKj2k/61z93Q4PsyrAoRFEwwKG09wAE7SE5GanwevuDilKl5?=
 =?us-ascii?Q?lh5x5fkG7txwAVCn5/G+SNOIuVF2OEAkYtlXH8F+xyzyA2hpXGZwV6PvuQkl?=
 =?us-ascii?Q?DVHWVvJzpL7TCj5mlCOrpcOEyFKp14UrEbBuS8c9ZQt2TLrqTYkVeETRyikW?=
 =?us-ascii?Q?9sTtyyurI5u4+/rCnb8/krif0SoAI8ueNw1XEUU3bdPJgtmxLpyH4FEjiT1V?=
 =?us-ascii?Q?5Vi2eH7MtAEVkhhjmAWGXZ162WwQEIMEeXxS+ZukWlyvfQK3X1vuuWFS7ALk?=
 =?us-ascii?Q?BmNbXt03IeX8K/qkzjhBoKfcoewNnqjkzPdHviIcrQutEKdQrRJvCBRnJPsl?=
 =?us-ascii?Q?cih41Fq70eaUqxunUnKfTRDJdN+/qAXpLHuCrWNLYhyaXP4Ld1lAKqL0HnxN?=
 =?us-ascii?Q?pe6SYj7TCLFjwybfrWBX/O2jw5E8hstADKvXGEm6Ezlg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1b2a02-0dfb-416c-7606-08ddffdedc7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 05:04:40.3074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uorF/wlRJV3nwRRh0o1UmvROaopUxJvKfInZef5p7on3ZizYDP0p8O5cpZaLQ2At67aeM1wM/s4/lMDxwQoriU54uURJE63nz4IQIltb9rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
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
> Sent: 30 September 2025 02:56
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if prim=
ary
> GT is disabled
>=20
> On Thu, Sep 25, 2025 at 10:50:18PM -0700, Upadhyay, Tejas wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Matt Roper
> > > Sent: 26 September 2025 05:17
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Subject: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if
> > > primary GT is disabled
> > >
> > > If the primary GT is disabled via configfs, GT-side L2 and TD cache
> > > flushes are unnecessary since nothing is using/filling these caches.
> >
> > Is it because PPC/render engine is on primary GT only? And its going to=
 be
> same way always!
>=20
> The device cache that we're flushing here (sometimes called L2, sometimes
> called L3, depending on what document you're looking at) is part of the
> primary GT.  If we've disabled the primary GT via configfs, then nothing =
inside
> that GT (RCS, CCS, BCS, etc.) is active or doing any memory accesses (no =
reads
> or writes), so the cache usually[*] shouldn't be getting used or require =
any
> explicit flushing.
>=20
> We also simply can't access the registers (0xb404 and 0xb418) if the prim=
ary
> GT is disabled.
>=20
> [*] The "usually" here does get derailed a bit by certain workarounds lik=
e
> Wa_16023588340, which cause CPU writes to VRAM through the BAR to get
> cached in the device cache, even if the GT itself is sitting unused.
> That aspect of the workaround is only relevant to dgpu platforms though, =
and
> I don't think we expect to allow the primary GT to be disabled on dgpu's
> anytime soon due the extra reliance on BCS engines for VRAM operations on=
 a
> dgpu.  On an igpu platform there's no VRAM, so no CPU writes filling the
> device cache, etc.
>=20

In that case on xe, we don't handle l2/td flush for non-dgfx, (in xe3+ its =
handled by HW). So primary gt null check here not required probably!

Tejas
>=20
> Matt
>=20
> >
> > Tejas
> > >
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c index 09f8a66c9728..bf99792e772c
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -1061,6 +1061,8 @@ void xe_device_l2_flush(struct xe_device *xe)
> > >  	unsigned int fw_ref;
> > >
> > >  	gt =3D xe_root_mmio_gt(xe);
> > > +	if (!gt)
> > > +		return;
> > >
> > >  	if (!XE_GT_WA(gt, 16023588340))
> > >  		return;
> > > @@ -1106,6 +1108,9 @@ void xe_device_td_flush(struct xe_device *xe)
> > >  		return;
> > >
> > >  	root_gt =3D xe_root_mmio_gt(xe);
> > > +	if (!root_gt)
> > > +		return;
> > > +
> > >  	if (XE_GT_WA(root_gt, 16023588340)) {
> > >  		/* A transient flush is not sufficient: flush the L2 */
> > >  		xe_device_l2_flush(xe);
> > > --
> > > 2.51.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
