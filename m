Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CB1C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 15:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D94110EB1C;
	Thu, 22 Aug 2024 15:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiB5L//E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37110EB1C
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724339127; x=1755875127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VX666fIiijIZo8Wj6FkQFaJ/0ppQzR1Zq8Zkc6tGAQQ=;
 b=ZiB5L//EcQ1fYTt5RJxl5Cuy2FcuPZ1ARVzsNN1+HCOLymZhOOZ0OxAI
 H7eJHKkKCeI8rYVlDvhmZmGzpDnwPMA8ud9Lgcc1VdMdCtWBFBZblZzTM
 ioFblpfQNRU/Cr0y9ClEGy4TV94sfz3fmpWy4VeuDL2tZQ119Y6fpApDg
 c6NRNAHUs30W/nMCC2PjfAX6+iUedHKXRczx+7hMPLf1zyCNRO3Sz2wKP
 eaTaZv0kXGnN7tDZz/nghR5xadXWiaIEI4NZC8XctTfoJJ/v3OG3Wz7G7
 VrzrviVrd0Mj1VTpKF5zHXh8PVFpqWRGfPbR72ElJxpu0Djf6n3s0/SEe Q==;
X-CSE-ConnectionGUID: 38q3tVWOQS+6wMLz0Gzlcg==
X-CSE-MsgGUID: EtXzW1MTTiaTQ9R/1I7shw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22922806"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22922806"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 08:05:26 -0700
X-CSE-ConnectionGUID: OnDWbBXJQNSJ5zVCoD+tPw==
X-CSE-MsgGUID: V+Y36BXqR52KrjhIzk6KHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="84649505"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 08:05:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 08:05:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 08:05:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 08:05:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 08:05:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gii4tiG1EqqiVT59EBB+xtRZELMoVEoPnXnZ2y2KyqTFGJZd1L4OgfSkWWf4LpchSlXul+0Hl3zxpTRCb/BWGYe0ERLAWizJ00Tb9iShdLxn9azXHVHZw0kxJYVc5tRsNW+SOvqngwy2sqXM8ZIhCHbT5Qe3krHFJk8YwOMZlcO49EegPkteuOi4NvRiqfW9ZU7F4LzAi0uOS6n/8VzIgvjgBElwKHbnnMUyxylAHPjf4cerhhrTDfFrYaF+IJa5a4cjL4Ng0sAD5wroDyh7d2se4Zo1OBIJNfUT5pIjZGBqPQxFLN5iCzlt0lpfJgPS3pUH8MHwPfeOewwePfOaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqfNAzvEFuthsKSoAqTf6bvyok2I9OegRswVpql8x68=;
 b=mh4OtRKlPAB7rG/IzzOxnk8sXEMktWZ06p+wtuqUOqrU3f3HoQIChdGf6HtfJg0Pv6/DJm58TgnxAXi4aY6WYWRsY9KfXIAqv6j493GTSt+G8PWYiceeY6/r5zoHj46IkV2w547ejHwQWyXIEJk2FLwR9PQF0rPFPL+G5+0zJAYuEgXG3UwfAMqddBxIkcnHxoNmlZZC+wYG+laJ8LONFTMihwQ8dRqgQySnS4sWvWhRXYQyHJabsR5oCYWVQ5bfuHVefc05OIrhgkX+hK6q/eZeqypzlmK7OVXIkiTyienL+kauofHfbUeX4glkkPcpdCupkERfF0ZEUbYa9Z6vMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 15:05:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 15:05:20 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Levi, Ilia" <ilia.levi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Avizrat, Yaron" <yaron.avizrat@intel.com>
Subject: RE: [PATCH 2/5] drm/xe: memirq infra changes for msix
Thread-Topic: [PATCH 2/5] drm/xe: memirq infra changes for msix
Thread-Index: AQHa9JR56MeUAQ+dfkmlv/z6KBiAM7IzWPiw
Date: Thu, 22 Aug 2024 15:05:20 +0000
Message-ID: <CH0PR11MB54446E568A32395A79DD835EE58F2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240822130815.1355437-1-ilia.levi@intel.com>
 <20240822130815.1355437-3-ilia.levi@intel.com>
In-Reply-To: <20240822130815.1355437-3-ilia.levi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW3PR11MB4555:EE_
x-ms-office365-filtering-correlation-id: 16c368fa-a982-419c-7087-08dcc2bbd75e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8kkL2dw4QpxyfA0rekGAudJ+0rhls3E9fk8VIsBHQnil7ae/wSPLWqoZLBTM?=
 =?us-ascii?Q?6qXKo6jbn4Ri/ytXJ+zz5LzPH3mnKYn9oyBVbVaLBZFHr/pLAyUUFJSjMOK9?=
 =?us-ascii?Q?ZJQ3qyDYKccthZRKUhikY0m72ScLsHOkKm9pCUpgjgN3Cr9qC8N+HWYzMo8v?=
 =?us-ascii?Q?elj3FNPiuhIb8B4oxy3aVGYkbOreoPrzQ9s8T/FmQ9Qjll+BhtecLyUx9GaN?=
 =?us-ascii?Q?WVojMfsYz5/bZEHKGXWXMDBaUm7UJDwcly/s4ke4biOmekGXRjuB7pwedJTM?=
 =?us-ascii?Q?JQo0dz9N1vrnb1l/L6XWIWqRj/ZZ6Uat8k0YXgAJjc9Uyn6M3LINouGEKjOP?=
 =?us-ascii?Q?2NH43mL7yIJiR5+XticQbASs26+wREpuwA0Rf2sfI8TXVeh+OotF4HRyvpdu?=
 =?us-ascii?Q?xovXVIO6amNppHPMTyNRP4NgINr9iSfFS5vDAJF9l7qgyG38b16ABNgDT0iX?=
 =?us-ascii?Q?2YGQ57wneuJveEwlTmJp7seBxBJ2qDpex87mCSGxIC6SSNG7yXhfry5uYjGU?=
 =?us-ascii?Q?c71ehH162gJf/q6PB0AGUOgoaYQvNGcgPCUANWQEEi13r+wWDagTBloZOWGb?=
 =?us-ascii?Q?LWUoygn7br6T4jyMci//yxKZM+iXH4Ju6bg3/qmih0AykNCcDJdRazpG49Nt?=
 =?us-ascii?Q?XjMpupKwt1UNYG+i4LmcBmhLA2NZDCumnny+Tskz0gxLNfsXSk32+uNkropd?=
 =?us-ascii?Q?NcUj89Ky/5ZI5Wuf/gWagpC1FD2EgqlpwgCaxyJPhF/YZnXTGOOtSuw3t+T7?=
 =?us-ascii?Q?E2laOjqvBGDgfjGMg4DMCplNBN24MqIeRAMYwtvUtPTrNKNS45YO3IElJkov?=
 =?us-ascii?Q?lXJEH3R+X6kgvkzELCLun1LN3rnARIuXosbDdmmwwfoT6EoWvhw5LLjsg3Bb?=
 =?us-ascii?Q?4WtLZxs6Y4R4x4pFtfbkDwmgOJaI37vXue9wKoS+rsVcfVuHoZoKOLOz/xN/?=
 =?us-ascii?Q?Rtso6Iu99perKcbsA4JIzeUeTspNXKCXfLa0MKJDt+vL0z116gbOdibiiWfm?=
 =?us-ascii?Q?wI8ylPu0SvBbxL+yFIL0XFLohBMGJuGGUoscbthleTo1Du2q6H9nYZiorhrk?=
 =?us-ascii?Q?iFeyYkt2+nVUe6s9fEyZu2/3KVx3ZkVoNAndrvcpdiFlYhxi6wbQA9WjTAUZ?=
 =?us-ascii?Q?rnt5isKTdWvW0D2t0SrHP9Qp0xEWzpHGyZPhQCFEjd+TVL70H/+L8mT+A18r?=
 =?us-ascii?Q?03G71Kr8aBw92vxBVnLawSNv1JszRR3E0fQBWIW6QZGDzMXSUpP56M3nW0NV?=
 =?us-ascii?Q?mFzguID+8mtoMqEuNKYkjygtokzMAYn035c/+gvZ6Jw3PWo345Bw73rsGPsX?=
 =?us-ascii?Q?ACwtxneMwUXmmcYZQ62G0FnzjLkfZP3FCJXkq9J5XADBBUEbmdOGLCjydh88?=
 =?us-ascii?Q?vThbNifZV5YhAwWn/siSj3ZaI1PtMADbmayjIe52srIrx6xnEA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tD7nXvRV6+skfr4H9ajrZIEqN8gKtNI/fsA3KrEAdfhS0SAvtgxNiv9i7AII?=
 =?us-ascii?Q?yDkbEcIsB+yGBoBXzHp81UTFl1SMyxatHmP9SrBdtohQiUuFDhiTE5YRqs3z?=
 =?us-ascii?Q?nh2FCNT+/A0hrFeQKXUfvhKaTy/buu0fUbMoVUbd+NtJkO702VTvc8ij6/V7?=
 =?us-ascii?Q?cwK9eGW7YyuWp92tAM95t/aaYvmY8EEzahcPOkPEHPDqgPSajWBEivfH8vIF?=
 =?us-ascii?Q?wCqvmPExu/TotbItfne5+RGwNaA2jgDpGV6z6HqoHp4lRDyUPykE9Vs53iOV?=
 =?us-ascii?Q?+ULxplDUaARnOalUpQwl26lk/cC4SeRU5tlRZEB/kwg9JpTXm2pJ+KCcw4IS?=
 =?us-ascii?Q?IKWDJH80NjPOru2bko0EgWQxV6isuWcC5wWxDulDh2yZ9GWGQnT1Vsnz7NjG?=
 =?us-ascii?Q?iRSAQNYSLzCtQNL4xB5Bf2yw51tFTkxCSRl1lLJfjU7yxKR8N9FkJ1HFaKlc?=
 =?us-ascii?Q?vtE5OpFPXLiIoL/oq6RwUoJVIcmYXLXT5TVGrNp7BlFOYyKxuwO6Rdiqwk8h?=
 =?us-ascii?Q?o/3R7J5BlXuxG2EHcHekdzYjaQ3LcEStmQfSuBJ7atrKZa0NpVefHnK0tyyA?=
 =?us-ascii?Q?q1PCY4Rt0RfehMn+Y9Qxynp5pf92//M5518SFJkVfCG+gOMp9EwGL52bNOnx?=
 =?us-ascii?Q?BIxVl1Sbgho98GOwzOFHgJzLpIGhqqrOOL8i/DFno0cArmIu0LolAmx1aOLV?=
 =?us-ascii?Q?4pVjZFzdWGwiCgrFOpdkcqSM3axtvp2HCh7MEefna6deJbPtRXjFp/cqRpWh?=
 =?us-ascii?Q?6e574EgwWLFL0IwS7kE1FTcVHztZTxuP3PcdzFki2QEtIdlGBpSBDyN7nvEU?=
 =?us-ascii?Q?ngV/R5h9nESA2jkQPEvOV3h52MKo3yQKtoJ+ruI8/gUvCeX6xdkOOPmiv2Vb?=
 =?us-ascii?Q?U/e1bVp8L6qRMBe3En+unzGJuPMj5JEJmfOVo992M064k/MvC3ujoG5+/cSQ?=
 =?us-ascii?Q?BgcIOrJTeSJv+ZfC9ygS9uJuqXtnu2rqj2SskG7ErGVLwrZB4601/bESl7Df?=
 =?us-ascii?Q?1TEAfCav52G8J6wc+gYEgucrhXutZjnjQw/lm5guFWRnsQMQLOhp3/KeFDWs?=
 =?us-ascii?Q?yzwmBt/VMrBEpehMtAgQaKvbXv1mwvAxisaLZUnxUO6J+JgTEdJqgEuDxZo1?=
 =?us-ascii?Q?zCgcZdg7p7F0tNCkVDjHEUlMIuazH8zm9/AeoZq1Jaj91bG80MtwXyAcKFgS?=
 =?us-ascii?Q?h+OIsn1WnpsrwRcMToS+V/ec9pG6tqpwoGjsEiJ9G5QkDijWgmD8zSk3ggjy?=
 =?us-ascii?Q?Zj71Ih/94HTtwG3nU6NSdeq5nNJ1cSDioR2thQhsYhcgUjUeRjE22p21vGZ2?=
 =?us-ascii?Q?GyAuBM1uFobbg2jCE+8r1jM/xz+dJsFiWvYcTNvak48QCGr+7KeULHP2v6ew?=
 =?us-ascii?Q?FBsXNhNr8M8t0YvEpxlMcIvwK+TW1kKDf1lpckfR3CmjulVxxGyQyX8+skOQ?=
 =?us-ascii?Q?MiQvJav1JxaTHLWnZ0ZSFLkJ3xwt0GV0AYZ+NsIyTI2siE1DXqEnKHlSeTjz?=
 =?us-ascii?Q?Hkspr3mKa7lkU1wPujDLW4Nc4/SWVqGE0QkZtu4b0wpUSnjxB3EPLBDm/glk?=
 =?us-ascii?Q?tn2hhuWG8pPSUEdJA/SthdUVZIkAZQYngJJGSwUm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c368fa-a982-419c-7087-08dcc2bbd75e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 15:05:20.7595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U9rZhb5TtIA0a43rc6D/D2vPu2+xbwf4MZ2uCh86br43T11dMiYZlQ5AqXrv2/lSTLiWrL1rvH91L1Iq7r9K+nQi8SyWhG/7Pxd1+59QuEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ilia L=
evi
Sent: Thursday, August 22, 2024 6:08 AM
To: intel-xe@lists.freedesktop.org
Cc: Levi, Ilia <ilia.levi@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@i=
ntel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>=
; Elbaz, Koby <koby.elbaz@intel.com>; Avizrat, Yaron <yaron.avizrat@intel.c=
om>
Subject: [PATCH 2/5] drm/xe: memirq infra changes for msix
>=20
> When using MSI-X, hw engines report interrupt status and source to engine
> instance 0. We pass a flag to memirq initialization routine for this case=
.
>=20
> For this scenario, in order to differentiate between the engines, we need
> to pass different status/source pointers in the lrc.
>=20
> The requirements on those pointers are:
> - Interrupt status should be 4KiB aligned
> - Interrupt source should be 64 bytes aligned
>=20
> To accommodate this, we duplicate the current memirq page layout -
> allocating a page for each engine instance and pass this page in the lrc.
> Note that the same page can be reused for different engine types.
> For example, an lrc executing on ccs #x will have pointers to page #x,
> and an lrc executing on bcs #x will have the same pointers. Thus, to
> locate the proper page, the pointer accessors were modified to receive
> the hw engine.
>=20
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c          |  4 +--
>  drivers/gpu/drm/xe/xe_memirq.c       | 49 +++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_memirq.h       |  7 ++--
>  drivers/gpu/drm/xe/xe_memirq_types.h |  6 ++--
>  5 files changed, 44 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 623e4a977ba3..c4f8bfd08b09 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -661,7 +661,7 @@ int xe_device_probe(struct xe_device *xe)
>  		if (err)
>  			return err;
>  		if (IS_SRIOV_VF(xe)) {
> -			err =3D xe_memirq_init(&tile->memirq);
> +			err =3D xe_memirq_init(&tile->memirq, false);

We don't seem to set reports_to_e0 to True at any point in this patch
series.  Are we expecting to add support for this override in some
future update?

>  			if (err)
>  				return err;
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index e70857325429..30e65991d5bb 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -613,9 +613,9 @@ static void set_memory_based_intr(u32 *regs, struct x=
e_hw_engine *hwe)
>  	regs[CTX_LRI_INT_REPORT_PTR] =3D MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS=
(2) |
>  				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
>  	regs[CTX_INT_STATUS_REPORT_REG] =3D RING_INT_STATUS_RPT_PTR(0).addr;
> -	regs[CTX_INT_STATUS_REPORT_PTR] =3D xe_memirq_status_ptr(memirq);
> +	regs[CTX_INT_STATUS_REPORT_PTR] =3D xe_memirq_status_ptr(memirq, hwe);
>  	regs[CTX_INT_SRC_REPORT_REG] =3D RING_INT_SRC_RPT_PTR(0).addr;
> -	regs[CTX_INT_SRC_REPORT_PTR] =3D xe_memirq_source_ptr(memirq);
> +	regs[CTX_INT_SRC_REPORT_PTR] =3D xe_memirq_source_ptr(memirq, hwe);
>  }
> =20
>  static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index 0db0726b76f3..a1d4bc3f9e42 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -112,18 +112,18 @@ static void __release_xe_bo(struct drm_device *drm,=
 void *arg)
>  	xe_bo_unpin_map_no_vm(bo);
>  }
> =20
> -static int memirq_alloc_pages(struct xe_memirq *memirq)
> +static int memirq_alloc_pages(struct xe_memirq *memirq, size_t bo_size)
>  {
>  	struct xe_device *xe =3D memirq_to_xe(memirq);
>  	struct xe_tile *tile =3D memirq_to_tile(memirq);
>  	struct xe_bo *bo;
>  	int err;
> =20
> -	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET, SZ_64));
> -	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET, SZ_4K));
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET(0), SZ_64));
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET(0), SZ_4K));
> =20
>  	/* XXX: convert to managed bo */
> -	bo =3D xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> +	bo =3D xe_bo_create_pin_map(xe, tile, NULL, bo_size,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_FLAG_SYSTEM |
>  				  XE_BO_FLAG_GGTT |
> @@ -138,11 +138,11 @@ static int memirq_alloc_pages(struct xe_memirq *mem=
irq)
>  	memirq_assert(memirq, !xe_bo_is_vram(bo));
>  	memirq_assert(memirq, !memirq->bo);
> =20
> -	iosys_map_memset(&bo->vmap, 0, 0, SZ_4K);
> +	iosys_map_memset(&bo->vmap, 0, 0, bo_size);
> =20
>  	memirq->bo =3D bo;
> -	memirq->source =3D IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OF=
FSET);
> -	memirq->status =3D IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OF=
FSET);
> +	memirq->source =3D IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OF=
FSET(0));
> +	memirq->status =3D IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OF=
FSET(0));
>  	memirq->mask =3D IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFS=
ET);
> =20
>  	memirq_assert(memirq, !memirq->source.is_iomem);
> @@ -150,7 +150,7 @@ static int memirq_alloc_pages(struct xe_memirq *memir=
q)
>  	memirq_assert(memirq, !memirq->mask.is_iomem);
> =20
>  	memirq_debug(memirq, "page offsets: source %#x status %#x\n",
> -		     xe_memirq_source_ptr(memirq), xe_memirq_status_ptr(memirq));
> +		     xe_memirq_source_ptr(memirq, NULL), xe_memirq_status_ptr(memirq, =
NULL));
> =20
>  	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
> =20
> @@ -170,6 +170,7 @@ static void memirq_set_enable(struct xe_memirq *memir=
q, bool enable)
>  /**
>   * xe_memirq_init - Initialize data used by `Memory Based Interrupts`_.
>   * @memirq: the &xe_memirq to initialize
> + * @reports_to_e0: Does the HW report status and source to engine instan=
ce 0?

You may want to remark that this overrides other behavior.  Something like:

"""
 * @reports_to_e0: Override flag that forces HW to report status and source
 *			to engine instance 0 always.
"""

>   *
>   * Allocate `Interrupt Source Report Page`_ and `Interrupt Status Report=
 Page`_
>   * used by `Memory Based Interrupts`_.
> @@ -181,15 +182,19 @@ static void memirq_set_enable(struct xe_memirq *mem=
irq, bool enable)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_memirq_init(struct xe_memirq *memirq)
> +int xe_memirq_init(struct xe_memirq *memirq, bool reports_to_e0)
>  {
>  	struct xe_device *xe =3D memirq_to_xe(memirq);
> +	size_t bo_size;
>  	int err;
> =20
>  	if (!xe_device_has_memirq(xe))
>  		return 0;
> =20
> -	err =3D memirq_alloc_pages(memirq);
> +	memirq->reports_to_e0 =3D reports_to_e0;
> +	bo_size =3D reports_to_e0 ? XE_HW_ENGINE_MAX_INSTANCE * SZ_4K : SZ_4K;
> +
> +	err =3D memirq_alloc_pages(memirq, bo_size);
>  	if (unlikely(err))
>  		return err;
> =20
> @@ -202,35 +207,47 @@ int xe_memirq_init(struct xe_memirq *memirq)
>  /**
>   * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Rep=
ort Page`_.
>   * @memirq: the &xe_memirq to query
> + * @hwe: the hw engine for which we want the report page
>   *
>   * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the `Interrupt Source Report Page`_.
>   */
> -u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
> +u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *=
hwe)
>  {
> +	u16 instance =3D 0;
> +
> +	if (memirq->reports_to_e0 && hwe)
> +		instance =3D hwe->instance;

Maybe I'm missing something, but shouldn't this check on
memirq be inverted?  Because we're currently using the
provided hwe instance when memirq expects to report to
engine 0.

More specifically, shouldn't the check be:

"""
if (!memirq->reports_to_e0 && hwe)
	instance =3D hwe->instance;
"""
?

> +
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
> =20
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET;
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
>  }
> =20
>  /**
>   * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Rep=
ort Page`_.
>   * @memirq: the &xe_memirq to query
> + * @hwe: the hw engine for which we want the report page
>   *
>   * Shall be called when `Memory Based Interrupts`_ are used
>   * and xe_memirq_init() didn't fail.
>   *
>   * Return: GGTT's offset of the `Interrupt Status Report Page`_.
>   */
> -u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
> +u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *=
hwe)
>  {
> +	u16 instance =3D 0;
> +
> +	if (memirq->reports_to_e0 && hwe)
> +		instance =3D hwe->instance;

See above note.

> +
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
> =20
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET;
> +	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
>  }
> =20
>  /**
> @@ -273,8 +290,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, stru=
ct xe_guc *guc)
>  	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>  	memirq_assert(memirq, memirq->bo);
> =20
> -	source =3D xe_memirq_source_ptr(memirq) + offset;
> -	status =3D xe_memirq_status_ptr(memirq) + offset * SZ_16;
> +	source =3D xe_memirq_source_ptr(memirq, NULL) + offset;
> +	status =3D xe_memirq_status_ptr(memirq, NULL) + offset * SZ_16;
> =20
>  	err =3D xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_SOURCE_ADDR_KEY,
>  				source);
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memir=
q.h
> index 2d40d03c3095..98e2b61ef973 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -10,11 +10,12 @@
> =20
>  struct xe_guc;
>  struct xe_memirq;
> +struct xe_hw_engine;
> =20
> -int xe_memirq_init(struct xe_memirq *memirq);
> +int xe_memirq_init(struct xe_memirq *memirq, bool reports_to_e0);
> =20
> -u32 xe_memirq_source_ptr(struct xe_memirq *memirq);
> -u32 xe_memirq_status_ptr(struct xe_memirq *memirq);
> +u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *=
hwe);
> +u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *=
hwe);
>  u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
> =20
>  void xe_memirq_reset(struct xe_memirq *memirq);
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe=
_memirq_types.h
> index 625b6b8736cc..078a1500c918 100644
> --- a/drivers/gpu/drm/xe/xe_memirq_types.h
> +++ b/drivers/gpu/drm/xe/xe_memirq_types.h
> @@ -11,9 +11,9 @@
>  struct xe_bo;
> =20
>  /* ISR */
> -#define XE_MEMIRQ_STATUS_OFFSET		0x0
> +#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
>  /* IIR */
> -#define XE_MEMIRQ_SOURCE_OFFSET		0x400
> +#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
>  /* IMR */
>  #define XE_MEMIRQ_ENABLE_OFFSET		0x440
> =20
> @@ -25,6 +25,7 @@ struct xe_bo;
>   * @status: iosys pointer to `Interrupt Status Report Page`_.
>   * @mask: iosys pointer to Interrupt Enable Mask.
>   * @enabled: internal flag used to control processing of the interrupts.
> + * @reports_to_e0: configuration parameter (see xe_memirq_init)
>   */
>  struct xe_memirq {
>  	struct xe_bo *bo;
> @@ -32,6 +33,7 @@ struct xe_memirq {
>  	struct iosys_map status;
>  	struct iosys_map mask;
>  	bool enabled;
> +	bool reports_to_e0;

It might be worthwhile in some future update to compress these
Boolean flags into a binary mask, but that probably shouldn't be
a part of this series.
-Jonathan Cavitt

>  };
> =20
>  #endif
> --=20
> 2.43.2
>=20
>=20
