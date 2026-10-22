Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559BF606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TDmhuwp5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1868510E055;
	Thu, 22 Oct 2026 16:57:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1A110E055;
 Thu, 22 Oct 2026 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792688229; x=1824224229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iFqQ+xf2BDXDrRh4odCIrJcfFpHosoZAYX37N0/Kpcg=;
 b=TDmhuwp5O19j9aJoBBD4aV/bVohq6mM6Nn8nX4XKoFNB9uPwU9b/QARV
 XpK7W++04MDF8/Ha+ns5bJkm43l8AgfM2XncX87j8qtkrPjG7IF09JND4
 QRut/zCOpT/Tu3Q3ANJlxtrjlP7Xf8zk6Rd2ImTtL8PlRcPzzSbNHXvfD
 Hjo19oYMv/0zKS4dvIPGgb33oUFJ/YSnYK+xBQNkOwpLI7zxellJk9nux
 oigYHAuHMR7l/t9x1Mz8oN4cXIaCNS9iCM8eY5ah5Atl1psoYgM9NopyT
 IScR+qNv1zHzRu3PIXPlmVv3YYa4vtE9C979vwwcyQpmJZY6+WJ17Bgwp A==;
X-CSE-ConnectionGUID: p6cNrhr+QN6tGUMDUrP/pw==
X-CSE-MsgGUID: fQntzjT7SlCYskO42pbQJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1343008"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1343008"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:57:09 -0700
X-CSE-ConnectionGUID: Yb6kmLTsQQGeuMqSVbAoWA==
X-CSE-MsgGUID: Pz7dFMeTRbOw2+wvglQWag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3326458"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 09:57:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:57:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 09:57:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 09:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXYUSf6bDAe1or0YWIvAZj1bDum9ouwx+48byswpUkr/oU//59E+/3Lha6yFRPZYqW7+wEtV0Zst45vrvV7SsHMQDl9SqK6nwoI7ABz/mF3717LF28dvX6mBh9FX3e53C3+CG7unU4D63NuGKXso97i2Fq3oJKaXTg1xAhPqkRqTTcHtmx5Opi/d7sjwksC+xqtdXd37v/D7LyD2AKcTEoSXU8u8MTfB7tD7OoEso7YGhnOjE6TMPh7tCH0YbXQFlRyAWlZuOjCtqa+1FgjsG3pXnCvYXI5muRobppmC2IUd0qzD2ATu65orCxlV47jz4i3gfXy9AHniELcRJR9Wjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m66yWao6YvNCNwEUByM7cPbZZZvsrhAW3ujhKNe+jg4=;
 b=Ce1XBPUtQpqzpkywUan4MedTxgM4mrtRu35Z0gzV3+96U+EVoSYyi2NWpNs3cANULh6kHK3NbchXGv/NeQ+OVMqO/Ws331kvs534iqXrmIjp3lLv0ltoi1WywvU21G9KLGzm3UuEE/AOQ7RVKjTFqM3jgSm7/SP98wlaB9UTUa2sw2aM9wnN9tbbIOKLe0MwXWG05ILjSqtpJGr158FSwKKbXTBPsDwRmmEWBUF5Cx+97D/pm561K/SiNlMrJijw0FewoNw47GLP9nKkHXgZehk8K9OgYORUiymlJXU1oqSNOoW9AM/A7fsGlKhMcqzh0hzoL47HPRh9A1aO2+dUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB5829.namprd11.prod.outlook.com
 (2603:10b6:510:140::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 16:57:00 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Thu, 22 Oct 2026
 16:57:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Topic: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
Thread-Index: AQHdRmJ8mY+S5reF1kSEMNM7vWLURbb/CI8AgAieuICAAlRFgIAABEXw
Date: Thu, 22 Oct 2026 16:56:59 +0000
Message-ID: <DS4PPFE901A304F7B16147A0402F2D1CD01E3652@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-4-suraj.kandpal@intel.com>
 <BYAPR11MB37839CAA76DDB9487E2B50BDB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
 <DS4PPFE901A304F44A3DDE4BCCEDD9ED758E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <BYAPR11MB37839B7B483C8F26087C2A2BB2652@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB37839B7B483C8F26087C2A2BB2652@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB5829:EE_
x-ms-office365-filtering-correlation-id: 4affdc81-0f0c-49a1-8df4-08df305d7d24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|23010399003|38070700021|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|261021121427099003|6133799003|261021135927099003;
x-microsoft-antispam-message-info: hL77e7OkTrqmHBTo8DGtym1Bil8oDyc4mGDcXTJj2HD5KyvapKMKiInfsOVW+eHFvsJO8Mp1eIxgQKO98wc4lKcuPN0oqxDggwkI99nlQec2wm0JDNk+QMDPx5LoamKzfmnqvmKqHs5ou0TJYL6jMQ4cDQTr5V8fLvQWwkFLcfD+03NfoAszsp7g7rVcCZRK1xN0VRuOkycJ1YRADp/pgMJmYjhvw5/ZqQGEx81AE9DzlacPNBZ+DFoFVT5DEMYZq4CFqeYzbjt5D8m1mZPc6ry3Jx71kJDYnz8kwiuG2p7caAgWwII16HCbwlXlf1ce8NYN0KHdeY2IOw8qzML3vf388WvjLpifWGckevquf0+634BtWRHhnUSucznYs3QJHfYwoex7xVNptVWJ8xHvPGC6BS50mGQFCu5mzFDxzE9y7jN69MzyhHe4TsloNjuHx+4NI1LzPfVxPeYiTfO4jXNJRGTQhfkL7dDsXq7wiB2YgFUuB8Xha8KpwWYQKyXgsrJFBXIuB9DFA/9ggzLpO1PMO7SwHFPlDJyPHO6Izfdt3fUc8CPF4kE4hUjgguWGiOLtRNs45dylxgD4CGAblPiMsOiVqZHQEJqMXrkgbgjkYwwfldFB/qYHobpeHtg7aL5PUBT88VyovmSYhVMOYWdLU6sh7JHqrwPop3wb/auduT3FcSDtiQ8yMPU44tQStVNyn/UGlWJsrck+bEChEofn0B2b4w4YvDelMgvWcl0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(261021121427099003)(6133799003)(261021135927099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WMZcBvBJk/xFwK6j5msewdVD4y7oUrdwfiTq2MhsvQa0ttjY0t2Ff7wHYpOu?=
 =?us-ascii?Q?jjOwd/GjhZNHS8ifN/zUpDFL9ahTFOGuYHXZUqc0mikP7oW06jPWYZLGDakL?=
 =?us-ascii?Q?sZLMyDvmLZ4AUpnlD1wtyjhfNnFbqL7xKYO8qhBZeXJstK6U+3zSgtF4uuP+?=
 =?us-ascii?Q?hDcJN858HOTx3nXZ+Arlnb8MwNf/+F0fuvMm5L39fSb07aU6Riev3yG4Vd0D?=
 =?us-ascii?Q?5AYO7mfkrnO2jN19liyVu+DBSEiP2EuiMstIc7IhaPCP13T2aKawCxbnHyll?=
 =?us-ascii?Q?M7z6E13pyoCUHnE1xzHVfIKcrz91TzZeREguWlq9dW1uPGZ5bXvI9UoinEbP?=
 =?us-ascii?Q?ggPqqvTU4/FOscGdeeDlvgnYz6namnq97M14jE8y89vHGutu/owGUuiGi83w?=
 =?us-ascii?Q?2OTvOCxU28K3D8Al/j53WNNPI/043jyYjbxvI0tqQRA/yHcJEMHirSs5Gl+Y?=
 =?us-ascii?Q?iWrdVlmRGZgNHezrzAsgJ7y5FeTaVrKu2m3gxenf/R71ufO0hQc8UsNSYxia?=
 =?us-ascii?Q?JssQT0YuogF7Dujj/fme9OlQlu5G20yPSA8o61G863nOsZ7GOwstGst75YKy?=
 =?us-ascii?Q?ToJsLGRfogqgFnFWk4RMfkRgtJDHxb/pPYlO3PqVjTolxJN6EcN/BD+3vszy?=
 =?us-ascii?Q?/CWVGY6apLGjWpMO6mz/Qv/DSAtk3hhxFxuuClzNqH4iJUcVjiwGVC+0oTjn?=
 =?us-ascii?Q?Kb0fNSy8wks2KfMfXUO1cZMCrmKuaJrBr4mbm9IpGOfNHgDYsiKqMj5QYbu6?=
 =?us-ascii?Q?i1p3sBzhPYtYP7ZhJxu4oOtCkXe/PEedP4zbh4OYvhDCu2+Ex0hoxWISzV3t?=
 =?us-ascii?Q?cuOjaRVcZLAXJ5DQTvYQYOEh+8tjNC8DvMNgc/CKVYl5LtLdOD1LVMxuKeC4?=
 =?us-ascii?Q?vd1YnnwoW467fdEIrUgzH0H/MtIjUdxUlnoVT3VF1695GHKLerG0voF6/Pkz?=
 =?us-ascii?Q?rNhOpqmwgFickKyGRB67iTBPtIaxe/DcbB8a8LEEndLoMBiAWrChd0kyAcwh?=
 =?us-ascii?Q?1jkduIhVRggRT6mhgIu/e0clkPs8bc7YFMZsxWf3zntsbkkR592kiuG1ydEu?=
 =?us-ascii?Q?Ic5odzIew2knGtYbR75KZLdQapIeDAAwTyMOzTIK+Rp13kj6Y1pAta2tKT/P?=
 =?us-ascii?Q?NR1KHVtlgi76DhzuWyjr7eMVFthCWZt5j8VXExpL9nsNTpAgR7WcLLXVMqfb?=
 =?us-ascii?Q?8H3U0cKfDddOrmEjxjG+fLr3yKsU+jwG/WkDxbtyfSd5oWeV3XV+CgBaMPH/?=
 =?us-ascii?Q?9cSDvoowM9jUNkTgZ6BUiGhCKVIL5N5YHaeq1G1f2gbKlxCkoFTURLGR/1/h?=
 =?us-ascii?Q?n4CNmD+XpjqGECq4JL+6JpkOF06zIW8Qz4Enw+xSSoNDgyPbExxDIF6Hq54G?=
 =?us-ascii?Q?ohOnE660mUn65XmPLzwrRJtl3KRnljD16OHrYaXR3Tc7VjHY/sEGC8/1SGrA?=
 =?us-ascii?Q?kUOwEz8c6XIrLiRdmPUXKjVuHvLmvUrYGWKPQIiyzobERcl6iXhi3eJENp/Q?=
 =?us-ascii?Q?Pu4ooVgxihb7ikSsCpEx6KkjbylHAAc3sI0jjH4GgMHE94xyPKaDrEDm0Ixs?=
 =?us-ascii?Q?+20jOk+YFgvR7gHRcxTeRTPjshE+OH+R3elzSwjpnixcB13xNfbffVsaRteL?=
 =?us-ascii?Q?r4jctNGRebAihitTUmHGAZMzwc07tzbAp3WkGaG8Xl22bgqoqIBbT55m+5tA?=
 =?us-ascii?Q?Eh5AjsSfWuRaC3yLqWGluJ2DrYALGWZZZGahlmhjrVO+O8S7agWzX/3Sf415?=
 =?us-ascii?Q?NeUPgReC0zFYrsBnGrlWNY99SSi1rybhsXMfEUKIqTOpoR+0C5jfzBPy1fIL?=
x-ms-exchange-antispam-messagedata-1: eCKEiNetZlTjUw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: C3Ap5HTVzbe0g5mTazT5mgGQBsBb2IF3rSGGBjiuqqM91nCjpKOQUlA/7c4EoQNz6rziYc3K22+oi5k1qnbV5Hlq8aR9x+E1fGYMq208UdrON2KUJ4xH18Rx0TRuQzgqef5j509ac6g0x1yof683WUn+sK6TQlfSxDhT4iYmHfZbOefQBEC6WMO0DJvY+3m64wot8NxI+y04LqszblitX9dTISsQlJMFDHHJNvkMOu96UzOjCkzk78QU9EIixZWc9HStD5a2pC5wV7o9CEKzzKad1nXTboVsSV7YBsRKEieyb7OGKqjapmU8zVGj3bD0ENPfflC/AgLvSKVgJkyqTQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4affdc81-0f0c-49a1-8df4-08df305d7d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 16:56:59.9356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waKXVU/ovzz9I0uHhBvZYptdXaGsWzMRl0SshNvgHWTX21kZBP+ZVXIWBTpxwsQ6ezkJPkjRR1vnwq6Tr/XnVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Sent: 22 October 2026 22:11
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>
> Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: 21 October 2026 10:39
> > To: Golani, Mitulkumar Ajitkumar
> > <mitulkumar.ajitkumar.golani@intel.com>;
> > intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>
> > Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
> >
> >
> >
> > > -----Original Message-----
> > > From: Golani, Mitulkumar Ajitkumar
> > > <mitulkumar.ajitkumar.golani@intel.com>
> > > Sent: 15 October 2026 22:59
> > > To: Kandpal, Suraj <suraj.kandpal@intel.com>;
> > > intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Subject: RE: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for
> > > MST
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On
> > > > Behalf Of Suraj Kandpal
> > > > Sent: 17 September 2026 10:37
> > > > To: intel-xe@lists.freedesktop.org;
> > > > intel-gfx@lists.freedesktop.org
> > > > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > > > <arun.r.murthy@intel.com>; Kandpal, Suraj
> > > > <suraj.kandpal@intel.com>
> > > > Subject: [PATCH v4 03/10] drm/i915/dp_mst: Limit M/N ratio for MST
> > > >
> > > > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > >
> > > > The hardware does not support DisplayPort configurations where the
> > > > ceiling of the Link M/Link N ratio exceeds the limit. Enforce this
> > > > constraint for MST as well.
> > > >
> > > > The compute config path needs no change: MST goes through
> > > > intel_dp_compute_config_limits() too, so the link config filter
> > > > set up there already excludes the configurations violating the
> > > > ratio limit, and MST fails there if none is left.
> > > >
> > > > What is still missing is pruning such modes, so add the check to
> > > > mst_connector_mode_valid_ctx(), reusing the helper the SST
> > > > mode_valid uses. It walks the link configurations and only rejects
> > > > the mode if none of them can satisfy the ratio, rather than
> > > > evaluating it at a single link
> > > rate.
> > > >
> > > > v2:
> > > > -Drop the checks in the MST link config helpers, redundant now
> > > > that the constraint is applied while computing the link config limi=
ts.
> > > > (Imre) -Share the mode_valid helper with SST instead of evaluating
> > > > the ratio at one link rate, since the link symbol clock is not
> > > > monotonic in the link rate and there is no single best case
> configuration.
> > > > v3:
> > > > -Now that intel_dp_mode_valid_m_n checks for all configs just call
> > > > that
> > > > (Sashiko)
> > > >
> > > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > index 0c362784afe4..823fe99ca0a1 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > @@ -1565,6 +1565,11 @@ mst_connector_mode_valid_ctx(struct
> > > > drm_connector *_connector,
> > > >  					   min_link_bpp_x16,
> > > >  					   bw_overhead_flags);
> > > >
> > > > +	if (!intel_dp_mode_valid_m_n(intel_dp, mode->clock)) {
> > > > +		*status =3D MODE_CLOCK_HIGH;
> > > > +		return 0;
> > > > +	}
> > >
> > > Since MST appears to use only the max_bw_config for link
> > > configuration, should the M/N ratio check in mode_valid also be
> > > performed against that configuration's max_link_clock? Currently,
> > > intel_dp_mode_valid_m_n accepts the mode if any allowed config
> > > passes
> > the ratio check.
> > >
> > > For example, on DG2 with a UHBR10 MST link, could a ~1.3 GHz stream
> > > pass the check using HBR3 but later fail during config computation
> > > because MST uses UHBR10, which does not satisfy the ratio limit? If
> > > so, should the validation use the same link configuration that MST
> > > will
> > actually use?
> >
> > Lets start with DG2 does not have UHBR to begin with.
> > Also compute doesn't actually use max_bw_config. MST goes through
> > intel_dp_compute_config_limits() too, so configs that fail the ratio
> > are already filtered out and it picks from what's left. In your
> > example it'd just use HBR3 instead of failing (DG2 has no UHBR anyway).
> > For mode_valid I didn't want to check only max_bw_config, since the
> > symbol clock isn't monotonic in link rate and a lower rate can pass
> > where the max one fails.
> > If something slips through, compute still does the exact check.
> >
> > Regards,
> > Suraj Kandpal
>=20
> Could we double-check the MST path here ?
>=20
> My understanding is that DG2 supports UHBR, and
> intel_dp_compute_config_limits pins link_config_filter to the max-BW conf=
ig
> for MST before the M/N ratio filtering runs.
> If that config fails the ratio check, would the stream be rejected rather=
 than
> falling back to HBR3 ?
>=20
> Also, since mst_stream_compute_link_config uses the same max-BW config
> for port_clock, should mode_valid check the ratio against that config as =
well,
> rather than accepting the mode based on any allowed config?
>=20

What would you propose as a fix for this.

Regards,
Suraj Kandpal

> >
> > >
> > > > +
> > > >  	/*
> > > >  	 * TODO:
> > > >  	 * - Also check if compression would allow for the mode
> > > > --
> > > > 2.34.1

