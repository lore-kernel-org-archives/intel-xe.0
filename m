Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1C3C87FD1
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 14:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6211910E523;
	Mon,  4 Aug 2025 14:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4nd7Qqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3975810E523
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754316125; x=1785852125;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wwesrZ/Vk/2MZQhvhSHxisuR8KCVBek9dqgRdWrgP8M=;
 b=V4nd7Qqez7JtauOk1JMuRtfTDRbtLRSQNzb5O4XVgmJxQfEg69AQ5jH8
 xPvMZPIO6V0paNegJihzX1DGl6+Za7z5ULcN8qL9E2h18rdSUUvMhEeQe
 a+SnYrklLFa3ZhSh4cQeXnS7T6bhJQ8m5VJoDDOLIhmhOw0+zHoZBl3dd
 IfKz1+mC389YPLKikekJWkp3HmeZJx+qluEywmZrdUqfgS7hTbr3nrZPm
 BnHVQOZYx4Kv2PdHMtaAjN5X8z6B6b4gXOMbSuYH0Wc3kqCobuHaMIA+U
 dX/DUPOj4IYIyNNTXhEPi2m01D99akb9QkvqzhtcrNH4q2mk237GhZ3qB A==;
X-CSE-ConnectionGUID: Pk3jxF/8ThyNikJVWTg6/w==
X-CSE-MsgGUID: sFn5P0BWQNekxVr7CInk3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56450405"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="56450405"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 07:02:03 -0700
X-CSE-ConnectionGUID: XQfVcgnnQwucgk0qZMOoaQ==
X-CSE-MsgGUID: Hyfb25sxQ4WrE2K35DeWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164496235"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 07:02:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 07:02:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 07:02:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 4 Aug 2025 07:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWTl2IMQOGc/6U8C+D+Wo0tYneH/2xyhiTVKQUY2fjEcXPg2WKI/V08ipSoGriRIFQMLubcevxVJVEBKZjOUF78N+4qJF7mDvfx5/U9tGGL0LYHLsd1j8xR2Ucfd0mnpFnFiyAyOF6zngNAQe4d54E9vR4nJEBvsK1zX4SSjQXtASuCpRet4yunYExWhX6toupe9C/QkugL3DeARF8LgtDim9Ci9AA/8wSrnMTPkBbpVoZp4sQIX5/TwK9g98eOFcd0tspj3s4RXzziTpIMrJa0k2dMnlEZr7j70m0JGFKjtVkpHVvD7xHCOD9Y37y7jFIqfdVRiIzEmtIu3EwT/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYH49Abpd0fPe6RW7ueW5nZ2Bu/iBCaYIy/9yOrNV14=;
 b=YybjtSyeM+a01VQVphWDX/9938OZ/OLTZ0mrgT0sKRig3RvWm4e4YSwjDp+nZGxCwMrvPvO+Qb/NqjdYvMYIinttLST3fYr5w5sArr/Kw4ftipsrft/aEUT+j6syUoWl9LQxzmg7XA9R01prN+40bFr7FSQWdAYDCrcxvtCiynbDR4ma7sKkD6wAAUmJ3/S8m1ovLraHtms5oUtKIiocvbqH4M5jKejT1RxC4OOtxEg/+mevJn5X+DkqZhYNyExmyYk+33h8Ik/bKjjclnuvkNqR2fc3C+CyfNUqPau2x7a3R6skpOFj3iu+rb6D5yZilscm5njjEOGxbTZ1imQkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV8PR11MB8698.namprd11.prod.outlook.com (2603:10b6:408:205::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 14:01:57 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 14:01:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v9 6/8] drm/xe/vf: Post migration, repopulate ring area
 for pending request
Thread-Topic: [PATCH v9 6/8] drm/xe/vf: Post migration, repopulate ring area
 for pending request
Thread-Index: AQHcA1sKC/g1gCY3eUm8CfRFAw1bGbRSidHA
Date: Mon, 4 Aug 2025 14:01:56 +0000
Message-ID: <CH0PR11MB5444F081154E2F1786F9194EE523A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250802031045.1127138-1-tomasz.lis@intel.com>
 <20250802031045.1127138-7-tomasz.lis@intel.com>
In-Reply-To: <20250802031045.1127138-7-tomasz.lis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV8PR11MB8698:EE_
x-ms-office365-filtering-correlation-id: 11b83302-d729-4c73-d32d-08ddd35f7963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qDfscx6e4lO0CoF48jyM1WsyDbp3FxKt1U5iC1i3C+gki28oRaNKVRfbOCpE?=
 =?us-ascii?Q?rwDgfffDAQQF7YT+ycK+Y4i+SWkC7qC4b0Ey0LcHctop6IQTBKsguRM6hT2j?=
 =?us-ascii?Q?II8aMvWb9QbMHePv/OA5g9lbJnZt0cqXh0A5oTeMtDMdMRwW/iO4CDFuLxE8?=
 =?us-ascii?Q?/hCpxqf7itGD2G1uKrWyaIYDKdaOwx8uYnjXuf8e2Hg+uNSoDDRagjy5HgdG?=
 =?us-ascii?Q?01Wq9CXgmdvXHHCwXsB7cV666UsDWQINWSToeDa86NrWeM1CMc6OxduHXyVJ?=
 =?us-ascii?Q?6W9JjC+Rn/xAGOrXaUecCbZgLhdr/uz1kD/9cTsnG6I37AdtqFC16H9bVz5F?=
 =?us-ascii?Q?Cb7K7jWEJNlU1qyIQTFNvZa0hKTlhvLXNHrMKCTJacI292sdI8qiSXFCrQIT?=
 =?us-ascii?Q?jWZ370eMZ5Jt02hfJm4kkL816Go5G1hFCeHMry/HJ/lg3uemOnfYP3VSqQi5?=
 =?us-ascii?Q?k9+D2k2qKMg2F6LwUy4mlc3p/pVYyH3dfh3GUkYUgtLslJVCgCahK/jaKuaL?=
 =?us-ascii?Q?fPNGVifN2P1CAJuxlg9ekn9VVIpdvlwyDdQkOsb45+AsSyXwBXjYUmKNxk+4?=
 =?us-ascii?Q?feFDAfCbHScf4iGJesY3Qm8gIJ49wKsjo4KP8Hhr7rVi23yqf+NXWxnYMYzx?=
 =?us-ascii?Q?tXhTKz1BjvYNomxFrv7FzqlgyFLyhGENF8ufaXb2EmO8OgBwLrNQc0DBTGxo?=
 =?us-ascii?Q?QrwIRDsyX7iMb62NXBcESU1rt8jowjXiSSMrgbU4T3k9to4f5sFzqywx/1IE?=
 =?us-ascii?Q?iol9k6PlsfGPzfcl9zL5iBWXGkfEo90cC97hCIgqPihRMzqgLY+lbDHSTt1s?=
 =?us-ascii?Q?txWooTOMClcXBy7swP8WJXDNdBLMi42qBjB5oC/1FgzcyaJVke+Fjpd9GptT?=
 =?us-ascii?Q?g/hEV9TpO0Bz5gT66+/meoJ38v9BOsyVDL+x1iveZQc3XNYtzZNDulucKctu?=
 =?us-ascii?Q?RY/tnkQJvxQ8CjKtss/3R72bxmx1fEhZAwR8CLSph/mgSrqQ6VfU4Ejqkzj4?=
 =?us-ascii?Q?8mzlXnJ7yejr9Dtx5ExqGroaEPulXyMlx9DO9sTTSFsYSfjJTviON9pyRBwV?=
 =?us-ascii?Q?OAg/MHF7sKk3uBD5LNSPNiltpChO3DVbXWBMZ+PueLFgcCr/egspAXB/fkf3?=
 =?us-ascii?Q?zysZxNK6o4U/u7osU1B/XYOlEGiRd1Vw0RVxoAFTQiNk1hjCvyhHpWEUms1M?=
 =?us-ascii?Q?roK6ZeQ0dSn3kuLOtFCiyDB0IyEkQArnAPv6zHPZMVqBodklX4c1nC5VFbNU?=
 =?us-ascii?Q?nN7916X9b/E2QnH3Kq+U6zsbigXk11/PGMAmkxzZHcl9ja2nyFnCZpNOvkb+?=
 =?us-ascii?Q?y767mlyMIEwMGwK3WqRvbq4ucdnvnFRPxTyeekQ3awslPbOFLx/UKUtBxez6?=
 =?us-ascii?Q?/7+ahEFqL0TyZTc8XqAWP0wSSm/+oADQ2HZ/rRzFWIVIRRUAaqzybOSHBVqT?=
 =?us-ascii?Q?Gb+c4/0poscVcK4w6kud2EdX0v16vhD73iQ0EKY2aKIVE656xO05WoclCGqp?=
 =?us-ascii?Q?PFlFzNXiPwg2eTo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N1A8rEtJCIxkHgl+mlO9DPcAx/ihlpByG0M7/eXY+Oib1QtBwWX3jFSfJgb6?=
 =?us-ascii?Q?CNy02bDW9ck+FJ04VdZfKd8O+aAwEDBUsrtg+Bhc4POz+bciQCKAByfAiXxo?=
 =?us-ascii?Q?z2IaYb7zxCNKL81mgvBYb5CVjkJDFjHflO+CpqiPDXHYTnc+jvhw9KcDVzXa?=
 =?us-ascii?Q?miywKQwEHm+zubLCmQme9kKp71OLlcKPpkGn38MOzG2pufNPpYfqEmcrK1G6?=
 =?us-ascii?Q?w2vhzEXtvE72MFzl8o8UCObTsvhCPD4aGDFLUgxVxxNFF1IxRUW51dUHzlkw?=
 =?us-ascii?Q?2slR0s1qLVVO5HPZR4CVFLULuO3UyHWKS6/KtnSTUIwUd1694Fz+/b+oyIGU?=
 =?us-ascii?Q?BwomXJJdTjSgRC0N4cd6Rg7hjRQvTcCwMfDx1jTwaeIpCaG3sZ4dxZXjfP4j?=
 =?us-ascii?Q?XxhjrqsrL1f6hLan9lJDTout55t3YoEhhUNx31m2NVAPV8X6UDoiRkw/0ssC?=
 =?us-ascii?Q?djfPzwwYxVrSRbYGeEjKIEQp2LWs/slnP9aMHnfZnTESUGZ86ieHdEGbrx6a?=
 =?us-ascii?Q?U9cqH/irEBv+3GtZPh6f5LkXY+l8mx67KERfVrgt98olLQaabhFns+oHRK/p?=
 =?us-ascii?Q?oSK5jhLtuC/+vOLqA+/QUW5WVqJhtpTQ8Jue7BxbZ+xO9LP7CfSiTdklViX2?=
 =?us-ascii?Q?JQX7NH+qHO7Ov+bPvpTW2VU95t016ZiiYSmJCLbYjIms5/jnb574NfBWHvS7?=
 =?us-ascii?Q?tFdQJtJAC4yhupC3aEzqNZVbEzTJaLGaB8cf9qZsg1hXmadLtjRp5wgIq8ZW?=
 =?us-ascii?Q?BkIi9cX5bYe7x+mT7ZYbXjRPGoV0IZP30Hez/3QVD3MvH30PVFqlEhf2fUEn?=
 =?us-ascii?Q?rNCmY+2W+sNUzt4qJr4kssgEZ0YhpbsJ2nr8b3YgUkuuRN8I3o6Wbl+vgwFf?=
 =?us-ascii?Q?Zz1dapt5VL4KNXlJn3plnnvlL4AAhBfTpJ7MzvYmShfV3Ib/c3SCVsNF3B15?=
 =?us-ascii?Q?YoQsD67DVcOBHrIMhiZiiqZy24mt+8jxkfI1olfIvN6RH7qFqZLz5OkBl2IA?=
 =?us-ascii?Q?AJcnEfphsOzImOCpdZXC666INHbIRU9kqytdHDs0pV+IViffws9OiixfLwI7?=
 =?us-ascii?Q?Zf9XxxOmSYjr2wcvq2/fkI1z2+tvh+C80DeLLKv+VVV8b7/B5eWK14HfY7S7?=
 =?us-ascii?Q?fb+a8zFVdkmatsYUKXXqNy+JkJb70aKQ6R7vOZ4bP3BdwWeULU2Dg5Ng1oIu?=
 =?us-ascii?Q?UJin/FiriZIutCcEY02WfW261mIUUi0w7mo/jqMMYFMhp7TdEWNYdrwNsUif?=
 =?us-ascii?Q?n9xxRY8MOeIjmQ/M8vWQduB5804xSIne7qhOHuXZ5s1wW8r2/CFR8kic3Jsq?=
 =?us-ascii?Q?r2+qCdxbhU9tppMN7JQSXziWrouRI1yZHJ09SB+lIGT+nui9Ty2tGQN8ODBP?=
 =?us-ascii?Q?19+zIh2J1B7LiI9jxDhY7idFrxY/gPscTQ168lRJQai76d3OVCw20+JQKKlN?=
 =?us-ascii?Q?369D6YWJSL55d/F5Cyd6bPRvigj9l5sN9cxwpLN747gdF19uuW40WYz8/Exa?=
 =?us-ascii?Q?0EC9tirjzrJBN1QmTgVmkeat1iRtmAMOGsNwkJaMZag2FP02U24vtHaoWTZb?=
 =?us-ascii?Q?m5QtW7jZrunjZyGoiYUh+/g93t//ajlXCOd+LBxjx33SmecvY5oKIgJ7mdOw?=
 =?us-ascii?Q?RqF9vrB2Rhqtz/a8pRUd9m7kqz+EUZcFqM0c4QRpwJ90?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b83302-d729-4c73-d32d-08ddd35f7963
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 14:01:56.8355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyCJ/sd48SPK/XUEzBzu/rlpUOw116X5rQdAQlAcSNsfdFd/PtK9Kajb0vsgeq3PhaYICGyuIaKvmFpVVcdo0RRsthmlbzApAxAcaoBunQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8698
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
From: Lis, Tomasz <tomasz.lis@intel.com>=20
Sent: Friday, August 1, 2025 8:11 PM
To: intel-xe@lists.freedesktop.org
Cc: Winiarski, Michal <michal.winiarski@intel.com>; Wajdeczko, Michal <Mich=
al.Wajdeczko@intel.com>; Piorkowski, Piotr <piotr.piorkowski@intel.com>; Br=
ost, Matthew <matthew.brost@intel.com>; De Marchi, Lucas <lucas.demarchi@in=
tel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: [PATCH v9 6/8] drm/xe/vf: Post migration, repopulate ring area for=
 pending request
>=20
> The commands within ring area allocated for a request may contain
> references to GGTT. These references require update after VF
> migration, in order to continue any preempted LRCs, or jobs which
> were emitted to the ring but not sent to GuC yet.
>=20
> This change calls the emit function again for all such jobs,
> as part of post-migration recovery.
>=20
> v2: Moved few functions to better files
> v3: Take job_list_lock
> v4: Rephrased comments
>=20
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
>  5 files changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 0beb6388acb0..05a1bd6b55bf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1092,3 +1092,27 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_=
exec_queue *q, void *scratch)
>  		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
>  	}
>  }
> +
> +/**
> + * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests p=
ending on given queue.
> + * @q: the &xe_exec_queue struct instance
> + */
> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> +	struct xe_sched_job *job;
> +
> +	/*
> +	 * This routine is used within VF migration recovery. This means
> +	 * using the lock here introduces a restriction: we cannot wait
> +	 * for any GFX HW response while the lock is taken.
> +	 */
> +	spin_lock(&sched->base.job_list_lock);
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +		if (xe_sched_job_is_error(job))
> +			continue;
> +
> +		q->ring_ops->emit_job(job);
> +	}
> +	spin_unlock(&sched->base.job_list_lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_e=
xec_queue.h
> index da720197929b..0ffc0cb03aa6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -92,4 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queu=
e *q);
> =20
>  void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *s=
cratch);
> =20
> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 452fb6e63f31..f32ddd9bf48b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -781,6 +781,30 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job=
)
>  	return fence;
>  }
> =20
> +/**
> + * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
> + * on all queues under a guc.
> + * @guc: the &xe_guc struct instance
> + */
> +void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	/*
> +	 * This routine is used within VF migration recovery. This means
> +	 * using the lock here introduces a restriction: we cannot wait
> +	 * for any GFX HW response while the lock is taken.
> +	 */
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		if (exec_queue_killed_or_banned_or_wedged(q))
> +			continue;
> +		xe_exec_queue_jobs_ring_restore(q);
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job =3D to_xe_sched_job(drm_job);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_g=
uc_submit.h
> index 9a2718c81d43..92a6f0ade615 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -34,6 +34,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct x=
e_guc *guc, u32 *msg,
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg=
, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> =20
> +void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
> +
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>  void
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sri=
ov_vf.c
> index 43ac73e432d4..a219395c15de 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -284,7 +284,7 @@ static int gt_vf_post_migration_fixups(struct xe_gt *=
gt)
>  		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>  		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>  		xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		/* FIXME: add the recovery steps */
> +		xe_guc_jobs_ring_rebase(&gt->uc.guc);
>  		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>  	}
> =20
> --=20
> 2.25.1
>=20
>=20
