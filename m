Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A0CC83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 14:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C01710E26C;
	Tue,  1 Jul 2025 14:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgkhW/2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5411E10E26C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751378730; x=1782914730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MqwlOc3kSiq5ocFlwHBuuAWksbtxFiPXKZ9dKMlax5A=;
 b=VgkhW/2S6xHcJfp1Ec5k0ZhqhFYoe9uuBuq0/g1ByatdKrdPDuKXgINZ
 HU4xzrRVbIS/fN9OWz1aQX9YJuoUP2FyhqAj4R1HwWv+gykoJ4Hj/ecee
 YBL7rG+HxxKan5mFUmFB2/J/nlDZmpe+4EcJI4C0SFQs9SgoucnzozBh3
 twN9v7mHlc/lg3JIjnTxRDz/ZpuWv2DgxzDWVhAM0qnGKf389vAXaYbSq
 F3s3HUsxAJMr19AJTHr2L8jfG/UXLTSDiaFNZKRcDjzKBvrKVateIopEE
 kcYgbkk1afR+7rPdPWEAzzQsb7fWEItFf0AGqEZyBJ6klJVFP5qfQ3Je9 A==;
X-CSE-ConnectionGUID: IP7olbw2QHyJjHDPeSxkvA==
X-CSE-MsgGUID: CvVGLrQMR965Iv7Wh1xLdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53367540"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53367540"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:05:30 -0700
X-CSE-ConnectionGUID: /SxIQZy2RN+Idkdkr9gvTw==
X-CSE-MsgGUID: C6NxEQMcTSmnTT7HkkEbpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153191435"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:05:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 07:05:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 07:05:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 07:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQckpM+1MAo/AMQrRhaVF5jBk/QAWTMVY9Tq+AtokK0vp/HYhWGm08fQv6oMpSv+WuLoeFSpdOyLB5sqftmd19eGR0/YA2xsYPq/ZZgl7ylOooSoAgkBWI5bT8WvR4tFIYsgVETLpwBXybAzIR29FxuqsbAajw71igUcbn3F2BJ41xrptYzFTE87wwj0u+vaeSO1NdZyMXK9qbXBBuLn2TYFRP5riy+eRnPUwA1JGXynSDJmiXjvLluBU9SBdjAC4CkLwgi9EM9FRQ08vsEmSrujGTBUXyZcgNOPm5zpXunZ2g1NDbG0r+m+/QK+2bODap66F0t5Z3APlpmRmORF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uac4ICMJlpVUvwdN3WCU2ai2nYyq0kW53qQYYy5x+U0=;
 b=ROkAFf4mQXbYax40PC/nVbmzP0VYX3oqXEMz7azjFJjVhmm6zhQXtuzkQUQjaaEQilRKfSIEp7k8IwYS+RYhPGm/HoiR1CXkjV2o1lexDSQcboRZLklFhtxrl45P6OGJDw9gCCth8xb30Lzp5ax6DYoHFre/Tbt8QEzjjhFHCOlr47a6yXbbZabYKRZVcdgTUjeZEosAF2CP9En9nb/IX6SfdxgzrN9CRrpLUH6w6m2RVXxSTnYDfzSvm6SyvPv0XgX5MUvLL6j6g6MsP4tfRXXm+g8Rhs5d6G8j95Mnd/iSq3WhWepfSL2TC0wowH2oC2ybG5P/qoaYQW3JzD0OGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.33; Tue, 1 Jul
 2025 14:05:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 14:05:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3.1 6/6] drm/xe/xe_query: Use separate iterator while
 filling GT list
Thread-Topic: [PATCH v3.1 6/6] drm/xe/xe_query: Use separate iterator while
 filling GT list
Thread-Index: AQHb6gyK8VqbMg+XCkyyDion4SMH4LQdTVYg
Date: Tue, 1 Jul 2025 14:05:21 +0000
Message-ID: <CH0PR11MB5444E988699B21C04D87C324E541A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250630173438.2342706-14-matthew.d.roper@intel.com>
 <20250630221515.2361053-2-matthew.d.roper@intel.com>
In-Reply-To: <20250630221515.2361053-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN0PR11MB5961:EE_
x-ms-office365-filtering-correlation-id: 6933dc83-9e19-41f6-2eba-08ddb8a8519b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Odb31p18MQHVuAlIx/WiAoKBn8rOkkzGV+/9ZaoTK3EgryV1/Unttg7t+BHp?=
 =?us-ascii?Q?OgT2JIDFaiFt/nWti39ADWddRCwYLvuOxXTKIfsTMfVaSpZCCK7umm4CP3hW?=
 =?us-ascii?Q?jM+7WPM1jVqGkE9e98+x6p/nec+mxZiwnEtwpE7Sud2xOxzCeN996pYiQBE4?=
 =?us-ascii?Q?JCnEewGqn165wo++/FYpWjRcGUQmeQ4vzIlBXbucmQ1VxRzKkRaPL3F+Xvrn?=
 =?us-ascii?Q?leoiw5oKxyBYpg1t5kBDXFZ5Q/JxohgiSz29VEb85BFSxFU9cUsKYAevlAos?=
 =?us-ascii?Q?Futln+jRaycLlK2Mcd4HyUadxzTGgu5jN/yM1ozZ8m3pKURoh2S94zCaMg3y?=
 =?us-ascii?Q?JPpijZfTvi4j/zTrQHAiyElX3u9M1XX56QTRL8Pmo60HGNT1c3nLSSL/uvKo?=
 =?us-ascii?Q?ZogvKDNfeLoK7boDqfGaESkUwUAZC4KQ6W4HwAVchliqXYk+INVUqYYnky15?=
 =?us-ascii?Q?S6kLv8MI3TQldM0dvssnYKWjLdCDXA43wRxaDh9Vz8PBtGeKNdcTh6hMMZ4v?=
 =?us-ascii?Q?bva7ehFRb6oJqMtyzBiGHV+1cwfaGpVkenPcI6mB1gHhUPD+QeY8UMtEtqly?=
 =?us-ascii?Q?z262acZCRoisu0yeh4Xbl32w9GnpvRLD/Zn9wVvCk2HMF/34DCOvQlgFh+Vm?=
 =?us-ascii?Q?9ECF27jEiLk2RjaD6RkQ3rEm85ZVXP4LpGuhecPdJUFWo99EW1n8FTjyQEvX?=
 =?us-ascii?Q?LtyJV9Na9lf2avqOOCeShiki5iEXJ/7/lAp26tDmNr3gvpv5/gRNCsjdX7mv?=
 =?us-ascii?Q?wbp0HkAOm7zj6IwMpcjvXFEmOj9T6ckGiQIy/GFcfLqtvY+uTrwynPoKQdFj?=
 =?us-ascii?Q?drRAKelsh5lPJfjZQ3aFZ+3kc4o5mikMtNZ3JowRU9V3NvvVtH5n7iIsXSen?=
 =?us-ascii?Q?HrOkD2iJ818aE7Pp10iYCft6ldg+67SJ/yBx9to9ZiQyQVOZ4zYJ8JxOmNr1?=
 =?us-ascii?Q?uKld51xESiycZuAhKpMFkl+G+VAgeNO0X57gk+iFbGRiw3a7QvLfLg7KS8lH?=
 =?us-ascii?Q?SZpY7sB1ByFu9uuqeSZXlHlWksiW9wZm1OgBA3JNSV7aKpqaHcEZKfxvgdjL?=
 =?us-ascii?Q?zTp/AlIkaIqSuuwRWsntk5pz46ktpOTncfB1Om5z4f+q6GLQxidOtsdZwSV6?=
 =?us-ascii?Q?0CUxEE5LxC8RlMEEJeArWxnzBoH06kHx9/j1xL/WWiHiULFDRlZiToSeEn/1?=
 =?us-ascii?Q?tQoteSRga9jJMB8VZ2wsGJF7+Pd3Bz+qjWH6F0O7BAyOV7UAzh+Ta5QEzASz?=
 =?us-ascii?Q?O5wa+Jx0xc0tgz+4eyZOa9aqEf8NuV67aMEYzjE1yuMLRjMht9Pue0IrqIqq?=
 =?us-ascii?Q?cdLrAiGQA4uH+2VYUeZwLqUNWUA4nQ4G+LOsBZq3AjaBHB3TM7KS5dvQpJea?=
 =?us-ascii?Q?5+bPS3F0EN+bPppZgTWVtoUMYOhnBBmMA1ckfQSJrRQ+dXH3ToDTlZXkLq/7?=
 =?us-ascii?Q?Jl7j/oTTErVgsVFNWc/z6XKKc4l3GJy1e8Bhc0bOvtjpyP3uIu5R8A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9fkm40CgP9sA3bDzQjtC7f8bTvnLWr88+1mYfN2504OqdA++xLxPExLzRTk4?=
 =?us-ascii?Q?zspfT3iuwMxRbZOYb5pT/WUWvGHhp9N71rhtIxycFHmbBerkUUNE8lZnTdFK?=
 =?us-ascii?Q?WGRT8jOmJ8dG17d8+BV9HNWPVPP3uQACnLbpmtqvS7n+tlXtwmswhy6GA7VN?=
 =?us-ascii?Q?P2ATUgn2bcxZkZ5ZJLX0Dnk0d/Jf/+mv2woQUXDhxJNkTCGi4TOTKQWRObTr?=
 =?us-ascii?Q?OLD+dNUujekBMizDy6x019JDpTz3eqcSrd8WcFuofabqG8c5lAC0SUKVDO8A?=
 =?us-ascii?Q?q9lD+FJ2rXyViOC1JQHTPd+/plPoQ7aYJWATLAcx/WlyhqwE97a5eM6VAhSh?=
 =?us-ascii?Q?gcMfstwltUTthe/4Txcxm2JFyYfEIqXujDrPHhQps8S4gpOCkIiP92slkkmN?=
 =?us-ascii?Q?bgUNVipjCCdi1eHMUMybkZOp5f/nlov4WEuSoiiAyRrPdw72CXn7b6edoh7r?=
 =?us-ascii?Q?dqs6oxH8TLr72y6WBqUlHDIhQGtQDwqvINhg/hLHeEqCvA8Boan0ZnjJn3Mf?=
 =?us-ascii?Q?2V1XA5Vwh3ryWZWOFIudGYfcIRWa+KLSs/MYK8F4PgZVQr/uHK32XOxPZa1M?=
 =?us-ascii?Q?d20PfeWTeAR37Bh7nAETj74A/A+auL2eOpqvekElfCvaK9eERAhyQMrhvyxe?=
 =?us-ascii?Q?pWNgmyhhjJEGa1XzJhJzGBb5YMq0Jl1xq5NKwD4vveen+zO/WsRwnaOSEeY+?=
 =?us-ascii?Q?JTu2rNM2ri2BdB0o+a1MZg3iMMdinMMb+8COKGy9AqMUwX2Vl8Xq8LdaxyRx?=
 =?us-ascii?Q?iFE6hWlXNoYRjKUjLPtATZ6KObPBSmlhj9W1kGr4EVewRztI8IjBMoEXFkAW?=
 =?us-ascii?Q?S3b4/N2MII/8U1CNWF3hddhttcVnxxcvhgB5zUViibi4MSiV+mzQize70O0U?=
 =?us-ascii?Q?EP29jIbi4IjFEkhH3L3iopt9oBLbeOuZBovT8wi9DEs/49suEW77Y8uF/OE5?=
 =?us-ascii?Q?j50NPh0i7JKStjsIjjOqQ2iONc5XxEFZtnMQxbsfQcgH1oc+mvyHQQj9w+/H?=
 =?us-ascii?Q?E3Tgkm0mhIospPc+meKnorbq2OdzaSaJBdxcrBFWLU9+5EKbHNHuzZS0Tu2p?=
 =?us-ascii?Q?DurEem1cWweeKzc0TS4HzKvvREW4ZlplMrACqGkYv16ZxTdHZ2UBHWUO7dJz?=
 =?us-ascii?Q?BBByeJT62RAaHC3dmXV3ynVARXTgkSAtnGfeqkG5DhWNBRvBIWN9QXzieI1I?=
 =?us-ascii?Q?gwWlFwoGkfrXLXQ+7xXWeJcda8c5ppHUx+6mNVKzO6LaEY+Y50Vs204iXe9N?=
 =?us-ascii?Q?WP67eI9Ga2ERr1vp8Sny1S9Y2k49A4UHweJZhEfGOeWlEhLRJRcbvt7fXtXl?=
 =?us-ascii?Q?mTggWAlBfiiWWnI4VM0G4GIFlrEblvN5GlKjiV/8zoFwLWMhURak7NQeE1q6?=
 =?us-ascii?Q?ZbkwiobsmzmQqwCwOF9YfxEulVfmgUmo7Kox6GcmJtQuuqry7Oe6yVqVWqlO?=
 =?us-ascii?Q?ypKCIa0fyk8OenQrqL12dB8eY2Q/6onjdSXpQ+bU8tCOQvXdy8xdz30oShqd?=
 =?us-ascii?Q?1YSqCxx2jVGb5WyfEJStmQjp0XlNhi/1atYvsJHhZJcSLYbTqjWNIhdpvwNH?=
 =?us-ascii?Q?wK4+9STy61qBmu8psNPwCloQqD/qgbwOd2rJskaCVRXNgrtAPCXCM7gFTMb3?=
 =?us-ascii?Q?Be7jKa2J8BxjOaPP8bBWVGd7qdHkoq6oX25X5atEpB2r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6933dc83-9e19-41f6-2eba-08ddb8a8519b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 14:05:21.9067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h78OEzhKsHpd+sxLncDqnuCNhwx64mf0IexlrmqVv5h6UuhNtZwPgdFo2GVMmrO4IKS/rt8gwXOKeB/XX1RMrrlktL4E2dbS7hnal1IlOWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
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
From: Roper, Matthew D <matthew.d.roper@intel.com>=20
Sent: Monday, June 30, 2025 3:15 PM
To: intel-xe@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Cavitt, Jonathan <jonatha=
n.cavitt@intel.com>
Subject: [PATCH v3.1 6/6] drm/xe/xe_query: Use separate iterator while fill=
ing GT list
>=20
> The 'id' value updated by for_each_gt() is the uapi GT ID of the GTs
> being iterated over, and may skip over values if a GT is not present on
> the device.  Use a separate iterator for GT list array assignments to
> ensure that the array will be filled properly on future platforms where
> index in the GT query list may not match the uapi ID.
>=20
> v2:
>  - Include the missing increment of the iterator.  (Jonathan)
>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

This is just to prevent the query ioctl from changing its behavior
after the update, yes?

If that's the case:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_query.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.=
c
> index e615b0916217..d517ec9ddcbf 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -368,6 +368,7 @@ static int query_gt_list(struct xe_device *xe, struct=
 drm_xe_device_query *query
>  	struct drm_xe_query_gt_list __user *query_ptr =3D
>  		u64_to_user_ptr(query->data);
>  	struct drm_xe_query_gt_list *gt_list;
> +	int iter =3D 0;
>  	u8 id;
> =20
>  	if (query->size =3D=3D 0) {
> @@ -385,12 +386,12 @@ static int query_gt_list(struct xe_device *xe, stru=
ct drm_xe_device_query *query
> =20
>  	for_each_gt(gt, xe, id) {
>  		if (xe_gt_is_media_type(gt))
> -			gt_list->gt_list[id].type =3D DRM_XE_QUERY_GT_TYPE_MEDIA;
> +			gt_list->gt_list[iter].type =3D DRM_XE_QUERY_GT_TYPE_MEDIA;
>  		else
> -			gt_list->gt_list[id].type =3D DRM_XE_QUERY_GT_TYPE_MAIN;
> -		gt_list->gt_list[id].tile_id =3D gt_to_tile(gt)->id;
> -		gt_list->gt_list[id].gt_id =3D gt->info.id;
> -		gt_list->gt_list[id].reference_clock =3D gt->info.reference_clock;
> +			gt_list->gt_list[iter].type =3D DRM_XE_QUERY_GT_TYPE_MAIN;
> +		gt_list->gt_list[iter].tile_id =3D gt_to_tile(gt)->id;
> +		gt_list->gt_list[iter].gt_id =3D gt->info.id;
> +		gt_list->gt_list[iter].reference_clock =3D gt->info.reference_clock;
>  		/*
>  		 * The mem_regions indexes in the mask below need to
>  		 * directly identify the struct
> @@ -406,19 +407,21 @@ static int query_gt_list(struct xe_device *xe, stru=
ct drm_xe_device_query *query
>  		 * assumption.
>  		 */
>  		if (!IS_DGFX(xe))
> -			gt_list->gt_list[id].near_mem_regions =3D 0x1;
> +			gt_list->gt_list[iter].near_mem_regions =3D 0x1;
>  		else
> -			gt_list->gt_list[id].near_mem_regions =3D
> +			gt_list->gt_list[iter].near_mem_regions =3D
>  				BIT(gt_to_tile(gt)->id) << 1;
> -		gt_list->gt_list[id].far_mem_regions =3D xe->info.mem_region_mask ^
> -			gt_list->gt_list[id].near_mem_regions;
> +		gt_list->gt_list[iter].far_mem_regions =3D xe->info.mem_region_mask ^
> +			gt_list->gt_list[iter].near_mem_regions;
> =20
> -		gt_list->gt_list[id].ip_ver_major =3D
> +		gt_list->gt_list[iter].ip_ver_major =3D
>  			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
> -		gt_list->gt_list[id].ip_ver_minor =3D
> +		gt_list->gt_list[iter].ip_ver_minor =3D
>  			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
> -		gt_list->gt_list[id].ip_ver_rev =3D
> +		gt_list->gt_list[iter].ip_ver_rev =3D
>  			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
> +
> +		iter++;
>  	}
> =20
>  	if (copy_to_user(query_ptr, gt_list, size)) {
> --=20
> 2.49.0
>=20
>=20
