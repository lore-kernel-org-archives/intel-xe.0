Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C26EF070F
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 06:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFFF10E335;
	Mon,  9 Feb 2026 06:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHVEagVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B335610E335
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 06:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770619247; x=1802155247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0magRyj9jCctxi48AjadZvjh70RBqyxd6irV1Oot8pw=;
 b=FHVEagVfwhvLvF9wLakqm7qC/cV4EzF2+r9B9P/wmxAPgVUndYEHrJJc
 OtWwl6nhQ2BByjkcrMYAMflJU9niMFuDMkqy8YrTXaD7G5DzjKGcILTYY
 EIAgT11awBHByIwAj3eQueSiMJuiuoLTRNrF1HkgxwkUnpdaLkI1c7nUL
 CASLoTP7cUTX2xZm1kBc5kWTilRGWh0nqd8/npbKtmqPhlkxQJDsH9X25
 yQ8RfTQqE1Crzl5fI+hQimY83/E0uAkH0O1gLDZqJvYC5UulQqDxq+nLz
 R1i7kLWj1fBz7MXiNlkzK/dphkr1kMfRLrdfDzNeR3FFPPArw9Un8bnSe g==;
X-CSE-ConnectionGUID: m5kPkbtlRs+dgQe4noc6vA==
X-CSE-MsgGUID: NXYpD5TdTemLJJh+meRa/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71626960"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71626960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 22:40:46 -0800
X-CSE-ConnectionGUID: Wbr7MtIHSM25EHK4/6Gj6Q==
X-CSE-MsgGUID: +WzksZWORGGqQm8prTvcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211303101"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 22:40:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 22:40:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 8 Feb 2026 22:40:45 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 22:40:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWJunCZaHggwB2uRcoLla1/ORbqGZq0TbVm255SFUIaTnOYag3D4tvfzMxcuCQ9o/umbLHibnUGB94ue8F4kpMGkG2ob803WKlsWiJ3P4TvfUk7lqalJvejgn+aHTFEW/bKvv3c5cCppRcli/NjDfROBGnjZXrmwCUtPKyWwBvkVp1lK5x08m9ZLe7E7G1SVXdIsJ3Xi+/Lnoxqq/3fntJPYiqcH4ibg7+0mfq5yDNxv2G0vezyIYo5FCC8oFWym4Kra8gs0x0Q1xuU4myH5/1o4sfiMAA1EIC56P/7GzNk9Cu8ZznDnZ9ouPLC76zwgplm9lohvEIJ/wswmoMswCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNURmc4rKSOy9Gu/3YVqFf+QQDULJYnyi5hb2wJVoBw=;
 b=SQC42EkPmZ+gfiwp3bEvArUGu91mOP1qscFERJrjqLmkf4A1Hxh/uG4oZVvcarfP4TLxkSSSF8dBwuCOi4mpEnXNQ/E39SDwny5eM+zvU6FxaA494IW2Tkb7Y0UFdTEFFIIx4agUtED+mr9PWDaRqTEnElYY9dIRy7pzyNv4tTnqGtyj9nORKKeT91zjKGdUQNJt4qEz6CxSb/YpqyB69zVkb60LPL6wzcdtY1DHJUfK4PAhNH43vOLaElD+VHII9OEymiEHEDaK25QVCb+Y2YoEeFesVfu4Kq5WjVaXiVDXeP0kgccXyH1eCpi8ubZup/jEev1XnPeykPepNrWvyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18)
 by IA1PR11MB8830.namprd11.prod.outlook.com (2603:10b6:208:599::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 06:40:43 +0000
Received: from IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925]) by IA3PR11MB8987.namprd11.prod.outlook.com
 ([fe80::f91f:4301:96d7:1925%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 06:40:43 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe2_hpg: Apply Wa_14024997852
Thread-Topic: [PATCH] drm/xe/xe2_hpg: Apply Wa_14024997852
Thread-Index: AQHcll1+xNUJoG5bn0etonk5jK2SiLV579bA
Date: Mon, 9 Feb 2026 06:40:42 +0000
Message-ID: <IA3PR11MB8987F1ABCA16270C3B041202D065A@IA3PR11MB8987.namprd11.prod.outlook.com>
References: <20260205050818.2180756-1-arvind.yadav@intel.com>
In-Reply-To: <20260205050818.2180756-1-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8987:EE_|IA1PR11MB8830:EE_
x-ms-office365-filtering-correlation-id: 9e8e08df-97f0-4cde-09ef-08de67a625da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ngmDiKw8zZ+mhRD2s4JwBbIevZGwu1SyXIgVr7k8ia8OMea+8iNR6sul8N66?=
 =?us-ascii?Q?33w2jVJ6eK2uDzaXrQ0UeAAzqz2RqkfbHMKl8G1OrrMlKpx0Mg297gCDjqF1?=
 =?us-ascii?Q?7i4oN/Oag9S7MRrsrhZj5sEqLRAszNMqSLO28KhKyj7o/+E+uFXrLc+InZ0N?=
 =?us-ascii?Q?R8g/YA44Coc4OKvoLvmdgoULt5XHK3Mi7rovc3amVjFul7l9L3cRdEFsQQDK?=
 =?us-ascii?Q?ohGVIpE2IO6hQZlXy4GhPn/J5+wsIR3RmAy42HPysDFka1Quee3ePH1I3Xvw?=
 =?us-ascii?Q?PRCNdLlB79Wi+MWsBmeqhP9K29CJrX2ACLqpFquW0xkx/Xkp+23zzF+7KQY0?=
 =?us-ascii?Q?VR/pOYrY3+ySrLqt2XHpNsQDWeItlY57C52XZYDdbGtKCmMgt3bKglnmDrvb?=
 =?us-ascii?Q?nBL2j7WkgH34AHCT+9H1XJxF8mqLUQtjQAQI+eDVmzWJTmyAsRieUokAMZp1?=
 =?us-ascii?Q?K9vLS4fyBN3ra2fTK1A8sHRjOq45wyd9VSBuzpI2vGaBObtDpCkQ5RrdQHj8?=
 =?us-ascii?Q?Okhy+ay8pGgG3JhgZQBJS2iNxlOWA2emvS4k0hF4A9jhoGgOfAdAwq62xBIa?=
 =?us-ascii?Q?6yG5LljivGb618Oukx/IC9jdlUARbNNBAOfNFHBgRxovRa6fKWaTcE8FN9Eq?=
 =?us-ascii?Q?oWccVtydw2rOLdZzGnINMMjcbo3x1VfWr9IqF8P7hQZdi1YQKTTkogqKN7o3?=
 =?us-ascii?Q?O9OBZGPCa9IpyrwF0KayS4YG/fNC3Fw2LratI+mLMJcMIOGnlpcmJShUkBte?=
 =?us-ascii?Q?f+JvSAUy2xt9eKxHPUoV1/PMISP7njpR2KJItZxI4b7mWKsaommDkBysQWYS?=
 =?us-ascii?Q?+3LuYLQ/iStUCpzc1LWrD4xjipFlqoxjXEAY+0SAlY/zFUvAkg6Ve7/p4ZDt?=
 =?us-ascii?Q?Z55etO46xnoN/TJWj1fnDYFt4NKIyABh8kozNbfoqPxTRnKVUUlMUN/A3QAO?=
 =?us-ascii?Q?b5Yph56hjWt9LfdPAYHSVtj5hlBcwHG/e8dhLNd/q/KrvJ3ZQeGjibITzhJ0?=
 =?us-ascii?Q?cXdxVonBsrN1MoH0yor3yvl2JmLypqNXbP78aM3LUUC5nrUjbfTQMjmOqK+K?=
 =?us-ascii?Q?+rHJb7OwLeQ0KSjAUB+GKGltf5aEIhYFlyDBZr4E5k7ZEf/f8Z9M3KxPpyil?=
 =?us-ascii?Q?eQqef12YDW1NrUWo8Vq3VD5+dIAHSljbYAzoZvnE7CGrH/3r3Hh8Zz5NTAYU?=
 =?us-ascii?Q?jsbAE756e6NX26jBR0IdYVSzct7sr9P1sDTXvBWobQKlxvMMpMNDZqt9S/NA?=
 =?us-ascii?Q?Y/ACeK3gIvMmCT0RbKtW5DDjGaPIs/gAjwq5kwgV01WIeVKMLYxQbk6WyLAX?=
 =?us-ascii?Q?6crmyps9dIHMvP6QWGf8qcFSOp5x9U0gzvXZsAukHELmLUaeYO2b4LuR5y5h?=
 =?us-ascii?Q?C/Qb3iUkL9/q7jdDc1jU28ckZq/UiqgPdtnbqiNHuKmmWI0//o1Vl5rA8SMI?=
 =?us-ascii?Q?42irhF9YuGwVIen6wdGlNodJVtwdyG7xsWK1KgcHluQP7NPK36pznNBPS4HX?=
 =?us-ascii?Q?PwYiKXc2RqjQxAay6HepBhovUu02szG6sKQBkxlKTX+wtE1V6duaYyEhTM0h?=
 =?us-ascii?Q?G3Qq/to9fCDrIohkGDpqMV2GExGZ8K/pHpk6O64KIbyrTir6cteee7nflQq3?=
 =?us-ascii?Q?CveYBhcSBahRl93U4WY3veA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB8987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TnZWVb/UW6SWMwBT2FuB23IXXj275Kvh4RTplBzQaoiMtj2Gobdh2OBVikSD?=
 =?us-ascii?Q?gKLtDtXFbmQdHEBH7zcOLFXah0ZOoalrY72mreYHPg+DVWd7qE9KfyOicO77?=
 =?us-ascii?Q?x/Z066Uet7AQQNYX4Tf4s6XDufreK5g5DP8gh6Ywq5aLwe0bHbFGlF6yxZyf?=
 =?us-ascii?Q?/AGPKD4faYoo8MbqcURMH8YdMTW5bxqcY37HAuPS3ukHt23sJ6lrYg88aD+x?=
 =?us-ascii?Q?SnopsBFg0dP9GGOfIg/HR+MoakcOIqkdJ8MjQkyKMbH7eKYHoePDnlCkwQch?=
 =?us-ascii?Q?bwjtacXNTLWfvfuLTD4oLuv5rK5bMwAaGgNVRtPaBaEjXM+FZ8ChrbdW7zUN?=
 =?us-ascii?Q?WAd1RvfVyPolw6HhN3mIfCYFIdYLhHrEcGdWly9Qb6tMaSoPYXViu9M/swmx?=
 =?us-ascii?Q?uRVDHckzIlO3ek5VVk1T5xmqqbPgeFupw5K/KD9tWvixwZeHzLfq0r0pyP/Z?=
 =?us-ascii?Q?BlOcOgtGUniJuhns8WuLO2YZY/UlGoOIKv4ieifhCJ1vk1x3iS9mqwhn5rqB?=
 =?us-ascii?Q?tDEHffKGhNaUh6Cwf5LoF9wRVtCWcem4PRZMDngGLQmHJx2u4Xqo7SOgmcrD?=
 =?us-ascii?Q?AIb/Qaa+Hxz9fr9ZQjPVYTyKAAHWcUHw8fqVXyc7fl6GOD4i7WQ3q9gen6v4?=
 =?us-ascii?Q?/ks/IkkK2Yx0jkP5Fdb0s29N1ikV7RtHPPFOCs/CLCZiGT1GJbNwrWdctw3D?=
 =?us-ascii?Q?UUETtWe+jYQWomwa+0rDRsYpaX5co4CAxS25TZ1MuZkO5oUZ8G0aAIESXR47?=
 =?us-ascii?Q?fU/6zL/poo/DDnTA7HqPjSIyO+JFCsG4yrHagPilYq6ffmscq6AkSSi03BQJ?=
 =?us-ascii?Q?VSVl4FhgajzRd7IQ1CwCpsTDZle7yOc42yXmqVRmpE6Q+wQWJr+Sw9OJZbiD?=
 =?us-ascii?Q?vcALcsDlQKI6RAk1ft1uV86XnYhqdhpEI25GK072Aq/QNQgGEbkVfVo/un7/?=
 =?us-ascii?Q?Sdjk71sgRAnLwBBF0zHLPvMW2sBj81yVFEAP9D0/ltL9Mt/OyeG+kiouSiAD?=
 =?us-ascii?Q?/5pjB/4jljlrEQ0WXHn3Le/okCOcFYCr36s9ovtG1UL+LjiaX93JvCnGU5HL?=
 =?us-ascii?Q?dXo4GwubGe/YilemyB4NvLqmwLL54YZEvgIfvV7SS3h4U/xv9T74pqjQLBNG?=
 =?us-ascii?Q?+Rj4R+sLlaRl7Epy55aliDNEkaJNcESK7nE3nvmKhi/QEKacdDHwZS0u2N/l?=
 =?us-ascii?Q?t9+WVkdbkI4RyLZ4w6YjXsT40k6WNK4+LcSYz0qEdXeK8xiXZauN6dI86TRD?=
 =?us-ascii?Q?XTmvypRG9dbZuKHehuPqSUrcyOJiT0NFkBCqVAYKYGilS+EyM/xL91n+KLNo?=
 =?us-ascii?Q?6dcuAJrexwBbJJQkUwEwrdzMSgSS7/ZgswpCLn995mSB9SYPZuABx42vELFe?=
 =?us-ascii?Q?AIs2ANRXiyqEfxGNrdsdNYmzoOaI/bTYN72C6HNheotGfug1xH/lnjicO1/w?=
 =?us-ascii?Q?jBFwRMwFhysUpRvxHlqUk8fuWSAbtXNbQ11mZkONILJvrxEGW0M66ljF/7/5?=
 =?us-ascii?Q?dOQyJeOuj+GmSPqvPZ6ZPpdC4Nic/Wz2qhk4ZGJf4hzFRn3QfJHyeINXMfkP?=
 =?us-ascii?Q?on9jW7r8vcl9mvNX56XXNXYlEGy/HoTqUuA6d45NXSVBT/UvxtsRJxQ8UbCl?=
 =?us-ascii?Q?iYzX3ogli6aFXZZtkdIH63aGawX8FvZsttLMfnTg/l5EnCAdu4/kh9e9xNyV?=
 =?us-ascii?Q?ZLdPLdfi807Tal/eFDU+LHEuIGZPpef5pC/xOr4BFFyanuoBLeWzucgfDawW?=
 =?us-ascii?Q?1N8IakewKA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8e08df-97f0-4cde-09ef-08de67a625da
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 06:40:42.9938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpW+0k4S3TMPlC/2SJBlOfogHu66FYEcMXMZp8eUC9j6JBMTY7xe/iETi0KFSnh4J5NmwI/S84lo9TEvNzFUUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8830
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

Hi,

> -----Original Message-----
> From: Yadav, Arvind <arvind.yadav@intel.com>
> Sent: Thursday, February 5, 2026 10:38 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/xe2_hpg: Apply Wa_14024997852
>=20
> Applied Wa_14024997852 to Graphics version 20.02
>=20
> Cc: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 1e8d61ac581b..2f838c99596f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -874,6 +874,17 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1,
> DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
>  	},
>=20
> +	{ XE_RTP_NAME("14024997852"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),

I see as per the WA details, also need to set Bit 31 of FF_MODE, for TE aut=
ostrip disable.
Could you please recheck?

- Nitin

> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},

> +
>  	/* Xe3_LPG */
>  	{ XE_RTP_NAME("14021490052"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> --
> 2.43.0

