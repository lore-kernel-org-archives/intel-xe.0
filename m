Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B65C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 20:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ADB10E403;
	Wed, 17 Jul 2024 20:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSzIUoDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4A310E403
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 20:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721247549; x=1752783549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b7hSwwFrRIsZWXaXUEcwiYUleMJCyXpMov3yQ3Ms4+Q=;
 b=gSzIUoDgC2j5SxYvWl7Fd6oFsc86THc3q0Q6OnuL4GvA26yTOj67iOED
 o/O++xaMrMd2kXtEtYHcQ4y++i29ZQPz0rlrOVI1NaEdetKbY+1F0GdsW
 0DTZ4oUpiCCznfP39NdbFRLPPvwyo4sjXKF1NUSuYYiSvuoI7MrIWUIxi
 yakENQHUiSSWdCgzj+dO2v0BiaWSGDpJEBjxRpfRvEaiuRytk4PJWHRQR
 Jhiv6qOo2UlsgmocX/Zy+6URyr4nibpzj9U1D8vaWedTIMhRXdELq+FNn
 L63VoVW2e2z4qByLjgmUHSimK2DkSvyomUyfd0pFXXevvuptukLOVoblx Q==;
X-CSE-ConnectionGUID: CdoIHycCRaKYcFiRgN2MXg==
X-CSE-MsgGUID: +oJ6FdpORoqKGZt5r/A0kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18588446"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18588446"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 13:19:08 -0700
X-CSE-ConnectionGUID: fnMS1HF9Rj6aX84QqqCSZQ==
X-CSE-MsgGUID: wgDMSfYHSsmc7WXhHDVMvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54844303"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 13:19:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:19:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 13:19:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 13:19:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 13:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGHsRbp+LBR5W4dd6HpHJljBvCgxY8kjgnBny1un+YHfBRDlA5RaeoGD2ZNku/3qjmpFKHC201tNnMMPn762UUWya/ScJ+sFm33JMBFXKdgeL2zv1iyIGH3TDOyhsb/fECUujf9O8j8phF5FtifsqOmWYq2jCDZ5+FYrerEpQCAHBC1teiQMJFr2Z2bSU4G0ZCs4VvpaeSfDqpYzTbEDctSXeePuJd1fk4izcrFwLci8P/AqCPU/0aK2EcxJzAn/etq69FsksGkUyzzNjHxJpfLvlpnk4V+ldF/yqfzwOM9krNQtDOQtdsgIx/2/sLS9rxOKQkE7eO/SJcBgVCyLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ8bw3nXnQnTG9UBTIABB0F2mmtGYfKcDclTHUy7+jE=;
 b=Lxx8IC3w01k7t8u7YIvqNL5f84A6v8gDSzNEviUSdTApaspcQL8jrv/ORo5JHJCmOWW+r8BMCrb4zFygKG+gWi7cf6iPz7QipuxhPk6bRk3wnk1fA1UWeYhfgtEyWLPNlRiR++wuI0vfbjSn1r9uDvUdnXOeWt5Ly6Mwa410GrgZkj1sKLplpKEHs1efqzIv6lx+ibScYM+NYx7p5DXRzUiUnsSKVWQigOzeVtfa2JQogi96J9H6/Rchzw78c2us2IiYMKoelI2u4nEm+xH8diXvlS9ecz6wh+ZTSTBnNtcbT9L9miDhaa3fbYkMiVCW3EBnoHc0h3pDVh3iIZYq1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Wed, 17 Jul
 2024 20:19:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 20:19:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2 7/7] drm/xe/tests: Skip xe_mocs live tests on VF device
Thread-Topic: [PATCH v2 7/7] drm/xe/tests: Skip xe_mocs live tests on VF device
Thread-Index: AQHa2ILiFaa/qUdYtEOz5QVlGwo/grH7W+SQ
Date: Wed, 17 Jul 2024 20:19:00 +0000
Message-ID: <CH0PR11MB54449E43D585B48570A29475E5A32@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-8-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-8-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4803:EE_
x-ms-office365-filtering-correlation-id: 5a7612a4-5bed-4b59-8fb1-08dca69db1be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?QtG5coku23GplwdqZHyvMwcfn22d+3VrRFKNL1XmiwuHxi9zk3myJgORFqHb?=
 =?us-ascii?Q?rpch34btuaBu7akuIMLtNH7inc5xrC8ZwD7g+9YdW9gpHXTuTmFOiZmHWHDb?=
 =?us-ascii?Q?BksBMxiRR5EJZtgqLqYLITxWF0FTDH3vCupQ5FzbgtCaafHsTL9nHveFH8/u?=
 =?us-ascii?Q?x7XZwJCDPBr7d+t3QX85mpiTXZI/Y8arJeXgyzfnjXGUilzKGcn/TEQl/O/B?=
 =?us-ascii?Q?JTLNG4s7ADNXEZfYDXVgS/IbpHl3kCsNltFYTFbtv8roPscWvt0M+zSe5yH3?=
 =?us-ascii?Q?lmlQnC8+dattNcNss2xoyyLujVejwhh2+bbHhe5+2286GM1gxvNTC+XLmE+r?=
 =?us-ascii?Q?n9MvFOIzZYVgkQ+22qNSo7A/N1YW20JzCtBGx3DBJQyC97o2zm0uB7VdA5qH?=
 =?us-ascii?Q?KGfADdfvW9BNc3TsBuapGVq3kSaeaqh4ysDWaeSv0s9ybRff2FLxS1ASe0OP?=
 =?us-ascii?Q?WMVpmslc7o/6aYyf0+b41DPC6n2M+R1V+WNHQ9tdCSedvUXXqaPQg/ijzm+Z?=
 =?us-ascii?Q?+KUpqOPBnzxcFSgcc+zsOq2sa1ElMlT9mIsE+JgY/1x2ifXb5rSyl80fqVOS?=
 =?us-ascii?Q?nBrpfJtdLJXGsVWqmO62GaiHOignNSK3bFjXnZfcrqyRDuUdhrpS0+RR8jHc?=
 =?us-ascii?Q?Lw2+dXpLYDoFZYo0rQ6cUA26DSLQX+rfbX+fN2O/vUxW8RQfBbA7uwR8gVQD?=
 =?us-ascii?Q?iTO5nijf66vSHs3v1kvMyH9QYIA6pBUN4i/fY8QUjazz3wVsHeBwpETH7yXE?=
 =?us-ascii?Q?ZpSjJZTNXstVCcnnXZi6CZDcf5dRjkTN3GOI0SXm78bXCNOlV3vGxmPEXsLE?=
 =?us-ascii?Q?aCLqkA8czoe/eHDNVSx08zJ7zmfIbNBGwRUc9FJj7Gp5OXnWJmLFv/jzLL2T?=
 =?us-ascii?Q?GSCf9b9h0Sq99QxdpqF7usGKr/W59tQcT+Qf/D7XBYSk0ez77+DM1AR4XnMq?=
 =?us-ascii?Q?UbU2OvGIMWEx1PQK2MyeAiNrkPkrgp9I+NAm+TaMsT5FNlfJgK03bEAQhMaH?=
 =?us-ascii?Q?U7nDz1fK5tSzUHYpWG0cCUwOVUthwcrcjZPz48JTkR+jkVuIf2d9z50CXPW0?=
 =?us-ascii?Q?ZwoXM8P6i5QMnWhvYTEhsFS/pQxYI2nAaCGOVgaE4vbJsjUNzG3Wd4qBFSWN?=
 =?us-ascii?Q?pnGaft5wSBCuK9S1Y9x4lMz5JCnXjhkF5i226EcWWBU/Ebi1qjV+dLpdLQng?=
 =?us-ascii?Q?0DJkUQQxfQAMWe5pINTNr+paPK8naXbSJqabX3jhuke8u+VUftsHwQe6DOij?=
 =?us-ascii?Q?xBzRMxHUFawScDaUwhkspkElMI6JLSaQeNf+MKRcGUcfRqrvLPdFUCOYjarx?=
 =?us-ascii?Q?zB9sk0TUaQo6KCgEs5chtuLfOH4G+VVSBQ2oGTpFKUx91OKvUOoV19Ywa2ld?=
 =?us-ascii?Q?69z/dln1RXHL0fImIcqYZjy4vdm6VWk/d0h4twyKMvErbz/CNg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fE7XkRYZAuNy99QCLUsbYLo+uOGbo9bXgYaoACvd/zBqpDLVb6HNWZesUc1i?=
 =?us-ascii?Q?tccD2V/m5AbZ/vSXQCznyynBkZ5ukFYODDN9Q5JpFfUco74bosUVrfR+SO7L?=
 =?us-ascii?Q?2fZ43cwH+o49Mh3yKi10hd17uQOJ2k0e3e8Ly9yqYfn1AG5RtO/Dx+bF+cq0?=
 =?us-ascii?Q?0fr0rFQDws2awCTIznwHGXLiCg7pUK8mOQqyr9f+QPyidYfRodxUlLwdEGuy?=
 =?us-ascii?Q?8alMn8hnbLixVnaJI78szR5BNy/ZphEmHXR/YK2K/ppkspXwVx1396lywDZu?=
 =?us-ascii?Q?bUZyBCfqScFg4a8v5mkIn007I/TSkdM++ZwIcDEGg/QGSC/XVzXEazPDLyyJ?=
 =?us-ascii?Q?LpOIRJ1HvhZPlltv1RuiEfniNQsFfWA7UghHwz7BH82T3U57zQPvmoNLtOhB?=
 =?us-ascii?Q?QUpeljs7rNAnACY/PQs/UjtV15jwnit738sNj96fimCVTyhsaQyfmhB4UXAH?=
 =?us-ascii?Q?HcO2+ZyhzxtQ3HiuncST+bBzQp+/qSplqVswRJv7Y9TUIPeJ8vrlAt5ZuCGi?=
 =?us-ascii?Q?kPdQ4KbTjehm44yHPGyThdxGJJUr9q1i5Ksa3Tg9oSyMJ/muu/aJmg+/tQnf?=
 =?us-ascii?Q?lfu9ojQ9gL1vxT6YzTSE/5PcptF6CIsgJgc0aXZ+czUI3zkH+UVh+WchCsoz?=
 =?us-ascii?Q?gSOnhgCFcFUFTbRaTFyJo70P9Yd5471km9kChDyanNcY1NdLOVfhlm0HkGQ0?=
 =?us-ascii?Q?PW0RH8wmf5aPOR6LBjM4g+hzsrQXaHjZ+zvhQNXzSQWoQnqjwKnlZFmOPvVP?=
 =?us-ascii?Q?Dc6IwvqpgDqajRAlzkczpQh3PNQBrirGSBRF7edie0q9ASfu+5VY66TuRS2B?=
 =?us-ascii?Q?xMLEPFysJAR0hu8/eN61EAlq4cnKQh8yJKGBf1M2crKYkBHedzSP07uoA7Af?=
 =?us-ascii?Q?cZBqV/eLL+EWnXAM5eAcW9VgSz1ADCXW42FXuoaT0X+T87mrQMMx6RSPuURQ?=
 =?us-ascii?Q?PL1Jrfr5czfcNy8JDvXtayYppOjMvy1nCxtjaajVtnrcDkxWlzXh7/R4sgBu?=
 =?us-ascii?Q?YAcS/i0+7hq8gsJNCnm4IiqvDKbmCMX58VeXoMpzKmVUSNt8gm3jqyHB/opC?=
 =?us-ascii?Q?k/IjEDaWjhGutbKlWLWVHjazTeX06rX5pblV5KJQed7D77M8dd/0PfHaUqNK?=
 =?us-ascii?Q?QI3px4WegEfoRKtk2gpGcR7XQjp/9eLWfRDOZ0QDHuZkAWGSopDrS+Iv6FCO?=
 =?us-ascii?Q?xrUYe5oIggIzBl7Hx40wpACY1gFRbA3xXf7FwHn5cXYTcQJmzMSiSiAHClrC?=
 =?us-ascii?Q?+i8ReP29Po1pQyA/29e48OSscewJFElOowfR1NSavw4FVxZ8IHNWDDxz2bAt?=
 =?us-ascii?Q?7GEw90nBU/KZEhipCEZ0thsIeKgEMQ1swdtD4+HgEWpY3GNQRXIRr/eKkTQ5?=
 =?us-ascii?Q?mmHfgOqzIUgMtMnKaC3/ZMA0RKWbITQrvjb6caOEDYEBer5woguzLXdrpU55?=
 =?us-ascii?Q?tOQPcs6mdBn0pnOicHt+6LRSaENUeWwiJ0iOEZ913JAsmta2X04mobfHDmrl?=
 =?us-ascii?Q?ozE8RTmoKjP3knACeJvDAy4nSUEXpSs0U3LenjK0VPSUD1ZBTW2P53b+Ru36?=
 =?us-ascii?Q?wfpiWe5p39icGhWt6tbuQw2blO3BM3H5YhvolyI7wsUKjGRZIS6ZfbYcilJR?=
 =?us-ascii?Q?3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7612a4-5bed-4b59-8fb1-08dca69db1be
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 20:19:00.1688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BNiRPyrnjNfK2v69TcPNTbXiqfO5U42+nRFBEEbNFBT/PRomMB24q5s/+vaVeaz9eTXQ0vCaGjNjUdWRswBQkKlFdW+lArMac5s9ac9Pa0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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
Sent: Wednesday, July 17, 2024 12:52 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 7/7] drm/xe/tests: Skip xe_mocs live tests on VF device
>=20
> There is no point to run those tests on VFs devices as they can't
> access any of the MOCS registers. Skip testing on the VF device.
>=20
>   [ ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_mocs (=
1 subtest) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   [ ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D xe_live_mocs_kerne=
l_kunit  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   [ ] [PASSED] 0000:4d:00.0
>   [ ] [SKIPPED] 0000:4d:00.1
>   [ ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] xe_live_mocs_kernel_k=
unit =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   [ ] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PA=
SSED] xe_mocs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/test=
s/xe_mocs.c
> index 19554019b255..79be73b4a02b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -138,6 +138,9 @@ static void xe_live_mocs_kernel_kunit(struct kunit *t=
est)
>  {
>  	struct xe_device *xe =3D test->priv;
> =20
> +	if (IS_SRIOV_VF(xe))
> +		kunit_skip(test, "this test is N/A for VF");
> +
>  	mocs_kernel_test_run_device(xe);
>  }
> =20
> @@ -180,6 +183,9 @@ static void xe_live_mocs_reset_kunit(struct kunit *te=
st)
>  {
>  	struct xe_device *xe =3D test->priv;
> =20
> +	if (IS_SRIOV_VF(xe))
> +		kunit_skip(test, "this test is N/A for VF");
> +
>  	mocs_reset_test_run_device(xe);
>  }
> =20
> --=20
> 2.43.0
>=20
>=20
