Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D10C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 15:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892AA10E1D5;
	Fri,  4 Sep 2026 15:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqEGNw1T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D8510E1D5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 15:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788535152; x=1820071152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7Tvml4uDnjEB5LERIghQLS+iHi/TWO0WJAAbNzgS3MQ=;
 b=HqEGNw1TmZd/mdpmlxZEU6zl8IjFZur0meuTffzsiwRd5PhHf2Eig5Xu
 h2RpqQQW9zAfNucfxNF4B3lfFBHN9gddbvH5KLsp3a1gDrFSdm0tFatdx
 Hp9QautHjhHZDpKX7++PNx1tP9uVLr8bBGheyv7Dcpnoc0pIH8W+46MLI
 xIx5UAfDiJH12WddKdOQqiOa5IpYvwGxgSB7Z8g658GhoW9Yo6ZWoEFyz
 Zi86vB+Bm1tMm5Tfe0V4SWmzKnC9Ib4cmMqRbLLp8uBGHHzStZxqAosBe
 BoWKFxGcPC/HdaCdIovO+eCoBLdKfMPckVAL87xdqc4NUYH7V9He4Lmb3 g==;
X-CSE-ConnectionGUID: R4lohWacQaie3saPvWYhRg==
X-CSE-MsgGUID: j+YT2CfgS5aFuK9MWGN24w==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99370014"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="99370014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:19:11 -0700
X-CSE-ConnectionGUID: jbR/kJSNSRiKCxh1e7WxBw==
X-CSE-MsgGUID: xcORzrUAQ0uxep1rOXvbvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="270593222"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:19:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 08:19:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 08:19:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 08:19:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maEQF41jBy5DfitEjrD+ca/bGKSYqYG2WQaGExzSjlaNX1RIb0g8t73qW3MXL/+H9p0r6J77Er9QL25kAzayLxyC6Zp9fwMty5wiogA9YQI/5/fI1VKgCdDsfWN+9bpJ8MQ6wnB2T+j/chaqjWTQFQR24ChLORQZcZLOT6nvPMCQdFGPJU6LEtgRtBjR3ErWwv9rGcs3blPrJL3XiFt5gSizTYF1nCVfDcMrBrgaGkNzwkSsxh3bU2bULJ547hNthvrAwojN6/7NHGhR6gOwe3L5Cq/RSmOgfruTYUJH4oB5pryxmMf4Ycl6yylEV9VYgq0aNKIFJMazAaLKEfgVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpx+6JKAnsQtWRi9AKjzGeyb4uMKOGJzr01GjMHZoMk=;
 b=PIjAynY5JMZPH+PlRJAU32Nn2NppK7cf8d8c4ojnhLPaSQN0Yt1g/3DMFtiYJ7pdtFKV2NKnr2XV2A/sHUpxeWYFSPaIg9+yszFfmAPFzSnXnFjK3eZyZk9WAPaXdLhyOk7+PS6G6NIHt2w5jGRbPrQebqwghKnW7Wv5x/DEY3sp3dCQXG9N9Vgn71LBSriEEE28jHA/yJQQ9vidopZnXRVAJa14f8AxQM4G0akyGPzkUGZKwGLqk6YLWo0HxubwIXvk8wp2GBZTVGJDZG+K7RefFoRbrYVnP7VVr8ZzINQzWSUOE1TCZjH9pjrfGibVj2uubB/BtXn8Arm4SKLWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CO1PR11MB4961.namprd11.prod.outlook.com
 (2603:10b6:303:93::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:19:07 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 15:19:07 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v8 1/2] drm/xe/sysctrl: Add helper to query application
 status
Thread-Topic: [PATCH v8 1/2] drm/xe/sysctrl: Add helper to query application
 status
Thread-Index: AQHdPHRGBeLsBi5UHEyAf54NZeTfs7a+h0Zw
Date: Fri, 4 Sep 2026 15:19:07 +0000
Message-ID: <CH3PR11MB04614946668821D655E04261D9C1B52@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260904134935.674507-4-anoop.c.vijay@intel.com>
 <20260904134935.674507-5-anoop.c.vijay@intel.com>
In-Reply-To: <20260904134935.674507-5-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CO1PR11MB4961:EE_
x-ms-office365-filtering-correlation-id: 66629971-5457-4286-34ec-08df0a97dd38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|6133799003|10067099003|3023799007|56012099006|4143699003|5023799004|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: Kx6/OAUVG2dJsOaPxQJZ+kCmnOt9vesTVDJRIyhSX1fQjNsSfq3dekmQTF8QnuDS4cSaZ7Sz/cetoXQFYoPYDGFBOvSu4w5OW9S/VV+ZQNgP708YSi43IVeB/g4LrSOAWrNQ8C0XvoGhk5w9Z6vA8s5LINehif5yxozuuOaMdCi5Pz/iih2kHbin9hbcCuLIXCOVEdm0aky9ML/rXZ9A/wX9QluC7ixSK3pC567M/1xa8FOG3C1whZHzFAIwSuWAT3/6if1A8uQn1OtRVFYGoIDAcE9s/jAYH5kTDxZMGAhrWsBbTIYH1b7iuMFBm2EnM8GZs2AdiJ8y5gVVt2i6E5cIvg98LbYo2e/6G/69wEiWvbOGd7wNVCqqT0J8G+af0ZlXCul/p4ZTJfGvatC5vMtintfi+ZVZr01Sk2fvPxnNtnsnJqFWO4RCGW4RvycivIWy5EQfmZcQvkegGs5+Ph8WeYJgt4yF4esKrwAqc1bcfM8YYvqw3bk1ASIslZCcVtOLrVUilMk2/LAUEGme8jjptxJi1YxatN/GfdZQ8TQMtDIUClbRIQNq5xMdBLwnlsnlrIlaetqXNSdhrNLvv+yk8hP6wQTehJVHqIBSHSSvOPj8Aarb2gKBni7QaDu+mGj2vXHCE3mKY56ANneWZAe5saI9Lq0aP0jOjov7ccBJYOoVwmGid/wJzGnUFw+fQdo40EClLt4xf679xBPifzW3JMoCgp0UJ9XhT4omhuM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(6133799003)(10067099003)(3023799007)(56012099006)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aqYQ0WX1+IXv6yH3Jjk69/8mArxuF334EncfwaHhJPzd9pUGFYtnxKNcrSiM?=
 =?us-ascii?Q?4jBPlFa5BLwJRPH+flwpqk13m+Pl0KF455LtVSd7ObfZaKDjTwbbU4PdlgBA?=
 =?us-ascii?Q?8D5yYiQMXCH004Eoo8Zpv3v388Ji4cxrPYD+bjtoVUq139SZR5bSO8Oss9ai?=
 =?us-ascii?Q?NB/mbMP891EgOBRejGFyLS8tKzsPaGjWldWbw4T2jOCqHfl00zv+t0Es+Pcq?=
 =?us-ascii?Q?W/qpi9SiuaUAcw/2eip0snDLWzi1DP/R2F5tky8Wvx1Zg9JJlyj+bKoJ1Al6?=
 =?us-ascii?Q?kkZ79XuBm0M5dBen8gKdW9SqQVewkefRuwqsW6Eq65oaDELEIRtEDgyWZSh1?=
 =?us-ascii?Q?/NlnnHBysa3W8/OpsANoaCNuZbuMyQp5uUhdqqGut4DF8UDTUyfWleSRaQV6?=
 =?us-ascii?Q?MrmFwzy9e3U2rflZ5XEjYwLXEYamwKlXhRjKSoUGemKsykXke41o/PFJGB4K?=
 =?us-ascii?Q?C6QHPMTMA4TW8UfPD5s4tSc2R8R5fwY2PBiso1J8SuC0YPlG2TYC0CA1cRry?=
 =?us-ascii?Q?hMiHt7qJtc47AWkMaSpCVWYhtZbPrqJZ78fKRJIoHAv+yJb81/3yZ+Yt8HyW?=
 =?us-ascii?Q?nDFqsrU4TbHNxFZdWSqWauDNNhGsQvb3klQiyMkNFG3ivB7T2IxI69ZIXkzP?=
 =?us-ascii?Q?1pBtygzuSTcNJFq0xsRmQ2WS/VY5EQ7oCstPz4eGPggDIrBUaqW4RykBHZHX?=
 =?us-ascii?Q?kqGfKmq3BJ8f6ve4I4BSYWiCBnQRnS48drOhm6qbl+JB13sUx4dXMUoOUWoV?=
 =?us-ascii?Q?HfMJq3Q0vx9Y+QLmydOQPDph5LloU7QBI8hHTPpMsXV+GRxwQGfWufm2HYPm?=
 =?us-ascii?Q?NC1xtdGXgMBiqPXEqgL82FdF6hZ+P7FFicSnhr3nAyD7sGJlBVWw5FJYJ3iP?=
 =?us-ascii?Q?uOgsNUk3+L2uZeyxycLYB1ngb7mmVK0Z5nL3fzeuKLqpTZNK9ddHXvqpG73t?=
 =?us-ascii?Q?kUc81mpxpK+rHU58JLnXISHk11hmCVeOEywF5buUX+Wm1RN0omtcecrHy/bP?=
 =?us-ascii?Q?4zj2+6MKzjqDTnsIszHvHBVLfMtbzA/xPZWF7UmXractZBQ244zZHJF27DN4?=
 =?us-ascii?Q?FenW1383tNROO01nMkbtUQo1GluAxFrsdn5aAXB7GBJ6oNfMf4ugT/i01YD7?=
 =?us-ascii?Q?NMedbuOee1JF5ICJdKTYYyXH92ykita3G5QEyUbCRsj9Uu61BVG28gHalTNM?=
 =?us-ascii?Q?3LuB6PB/mNo6PZY0PIhAkDEEJUdLbTphEyGvhtedlgWuZBamX7liFT+80v3K?=
 =?us-ascii?Q?YBym0wDmE7DTIFZOaP2EYgcvtegs1j4iJR40kXlsnScPYKGrAfvMstDUSLio?=
 =?us-ascii?Q?CThrYvKFmLx0+FRZ89Un7qgCovwGHqnMrUwi86km5xgiEEvjuIsYnmJbnyWO?=
 =?us-ascii?Q?26G0l3DtI5B4VppLP5FCu9LFfyLc/fJNMcEb/YrgG3kAWHsq/TqcNXBnN9BY?=
 =?us-ascii?Q?Qgy3vJaSKo+NkjwtgGYLNIK9f2vnUHMcYR60L+zenuQkZiD8aS3aQHbLxCNq?=
 =?us-ascii?Q?lIv4lmJ7/0lNtukx4qee+ciVqUNheM3i58FrIH0ltmU0tTKrz9AHxtGwwtWe?=
 =?us-ascii?Q?7REYI/zvch5MtXFUPhYvuLK4tix5Le25orJSXZ8vUOKmebhHf7yizEQxvC5V?=
 =?us-ascii?Q?ymHa1aZ1goYobg+c2QXoxcAZA1JPdbGS0THV0RSUmJ0MW5d7AELSyFY/27kW?=
 =?us-ascii?Q?BARV7vmcvlZQEktrnP78GrV7rhi01fPysOgMsTKUmZbcGmj4zj81Ial6M1G3?=
 =?us-ascii?Q?e53fQlE7rQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kMgxkoAV+TR36Csv0z3yXBidUFjs7n3+f/QoFNwHHWnWwZs19I62Z1MwfukxgFpkwG4m62+ASN1xlSSBcrpwXVOuRTxJoCFgaX1MT5T3mZg6AgQlzY2mtL1TPFAuii8mbRqE4ZSB4dfnWiE5WQI5azsi+DtdF9BvAbxlmxI6jHvWs836e5Sg/6I4x/Ld5npPxRxUzuLMqN+SnaQEANd0CcwaP1oRhpyLonIPYkSJG+Z5uxs1ZYj7bZYqyiKs093nndnR/1aga1p47wqZTOchgb14QYF1An2JY95xBNKabLKKLUEi4HSf2bE6lV0XZCzy3VRwRdUraDox00Tx3FrBRg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66629971-5457-4286-34ec-08df0a97dd38
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 15:19:07.7282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 737C+lzDIu1K24jfMh6vbnflVQi84JdzNJJ4CniC9zd9lIYEQH71bOsSVKAfFhTF0V+cuTS3m4eYcFuJ56kNFIYEgEqp3IFq6HfRpQ1mnEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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

>-----Original Message-----
>From: Vijay, Anoop C <anoop.c.vijay@intel.com>
>Sent: Friday, September 4, 2026 9:50 AM
>To: intel-xe@lists.freedesktop.org
>Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
>Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
><riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
>Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
><michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V, Moham=
ed
>Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
><kam.nasim@intel.com>; Vijay, Anoop C <anoop.c.vijay@intel.com>
>Subject: [PATCH v8 1/2] drm/xe/sysctrl: Add helper to query application st=
atus
>
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add xe_sysctrl_check_app_status() to query the state of a System
>Controller application using get_app_status_by_id mailbox command.
>
>The helper maps xe_sysctrl_app_id values to firmware application
>IDs and returns the reported application state. Add a convenience
>wrapper to check diag firmware application readiness.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v2: (Badal)
>- Return SysCtrl firmware application states instead of errno for
>  application lifecycle conditions
>
>v3: (Riana, Badal)
>- Replace string-based app identifiers with enum xe_sysctrl_app_id
>- Use get_app_status_by_id (opcode 0x05)
>- Move mailbox definitions to xe_sysctrl_mailbox_types.h
>- Return enum xe_sysctrl_fw_status consistently
>- Map communication failures to COMM_FAILURE
>- Add INITIALIZED state and status helpers
>- Fix Diagnostics typo
>
>v4: (Anshuman)
>- Make xe_sysctrl_check_app_status() internal
>- Remove unused app identifier
>
>v5: (Anshuman)
>- Rename OOBMSM status helper to use xe_sysctrl_* prefix
>- Remove xe_is_diag_fw_ready() helper
>
>v6: (Riana)
>- Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
>  header packing
>- Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
>- Use hex constant for application ID
>- Move oCode application readiness helper to a separate patch
>- Add xe_sysctrl_is_diag_fw_ready() helper.
>
>v7: (Umesh)
>- Clarify xe_sysctrl_is_diag_fw_ready() comment for sysctrl-less platforms
>- Move XE_SYSCTRL_APP_RESP_* flags and enum xe_sysctrl_app_id to
>xe_sysctrl.c
>
>v8: (Umesh, Rodrigo, Mike)
>- Drop XE_SYSCTRL_FIRMWARE_APP_NOTSUPP handling
>- Simplify diag readiness helpers to a single
>  XE_SYSCTRL_FIRMWARE_APP_INITIALIZED check
>---
> drivers/gpu/drm/xe/xe_sysctrl.c               | 73 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 45 ++++++++++++
> 3 files changed, 119 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysct=
rl.c
>index 62ccc9be71b4..3b7fa2c9c333 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -13,9 +13,11 @@
> #include "xe_device.h"
> #include "xe_mmio.h"
> #include "xe_pm.h"
>+#include "xe_printk.h"
> #include "xe_soc_remapper.h"
> #include "xe_sysctrl.h"
> #include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
> #include "xe_sysctrl_types.h"
>
> /**
>@@ -29,6 +31,20 @@
>  * This module provides initialization and support code for interacting
>  * with System Controller through the mailbox interface.
>  */
>+
>+/* Application status flags reported in xe_sysctrl_app_status_resp.flags =
*/
>+#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
>+#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
>+#define XE_SYSCTRL_APP_RESP_INITIALIZED	BIT(2)
>+
>+/*
>+ * Known System Controller application identifiers, keyed by firmware
>+ * application ID.
>+ */
>+enum xe_sysctrl_app_id {
>+	XE_SYSCTRL_APP_DIAG	=3D 0x0D,
>+};

Curious as to why this is defined here (rather than the header where app_id=
 is defined)?

>+
> static void sysctrl_fini(void *arg)
> {
> 	struct xe_device *xe =3D arg;
>@@ -125,3 +141,60 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>
> 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> }
>+
>+static enum xe_sysctrl_fw_status
>+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id
>app_id)
>+{
>+	struct xe_sysctrl_app_status_req req =3D {};
>+	struct xe_sysctrl_app_status_resp resp =3D {};
>+	struct xe_sysctrl_mailbox_command cmd =3D {};
>+	size_t out_len =3D 0;
>+	u32 flags;
>+	int ret;
>+
>+	req.app_id =3D (u8)app_id;

Is app_id different for different requests? =20

Or is this done because the size is fixed? (rather than using the enumerati=
on)?... ahh I do see the __packed usage, so
this make sense.

This looks reasonable to me.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

>+
>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE,
>XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>+				  &req, sizeof(req), &resp, sizeof(resp));
>+
>+	ret =3D xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>+	if (ret)
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+
>+	if (out_len !=3D sizeof(resp)) {
>+		xe_err(xe, "sysctrl: unexpected get app status response length
>%zu (expected %zu)\n",
>+		       out_len, sizeof(resp));
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+	}
>+
>+	flags =3D resp.flags;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>+		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>+		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>+
>+	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>+}
>+
>+/**
>+ * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initia=
lized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if diag firmware has reached the initialized state, indic=
ating
>+ * it is ready to handle requests.
>+ *
>+ * Callers must only invoke this on platforms where System Controller is
>+ * present (xe->info.has_sysctrl).
>+ *
>+ * Return: true if diag firmware is initialized, false otherwise
>+ */
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>+{
>+	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG) =3D=3D
>+	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysct=
rl.h
>index 090dffb6d55f..8dc576796890 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> int xe_sysctrl_init(struct xe_device *xe);
> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_sysctrl_pm_resume(struct xe_device *xe);
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>index 66e7cbcc3f91..c236e5377f30 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -14,9 +14,11 @@
>  * enum xe_sysctrl_group - System Controller command groups
>  *
>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>+ * @XE_SYSCTRL_GROUP_CORE: Core group
>  */
> enum xe_sysctrl_group {
> 	XE_SYSCTRL_GROUP_GFSP			=3D 0x01,
>+	XE_SYSCTRL_GROUP_CORE			=3D 0xFF,
> };
>
> /**
>@@ -42,6 +44,49 @@ enum xe_sysctrl_gfsp_cmd {
> 	XE_SYSCTRL_CMD_SET_HEALTH		=3D 0x0C,
> };
>
>+/**
>+ * enum xe_sysctrl_core_cmd - Commands supported by Core group
>+ *
>+ * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status
>by ID
>+ */
>+enum xe_sysctrl_core_cmd {
>+	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		=3D 0x05,
>+};
>+
>+/**
>+ * struct xe_sysctrl_app_status_req - Get application status request
>+ *
>+ * @app_id: Application ID for which to retrieve status
>+ */
>+struct xe_sysctrl_app_status_req {
>+	u8 app_id;
>+} __packed;
>+
>+/**
>+ * struct xe_sysctrl_app_status_resp - Get application status response
>+ * @flags: Application status flags interpreted by
>xe_sysctrl_check_app_status()
>+ */
>+struct xe_sysctrl_app_status_resp {
>+	u32 flags;
>+} __packed;
>+
>+/**
>+ * enum xe_sysctrl_fw_status - System Controller firmware application
>lifecycle states
>+ *
>+ * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by
>firmware
>+ * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but
>has not yet booted
>+ * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-
>boot init pending
>+ * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>+ * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System
>Controller firmware failed
>+ */
>+enum xe_sysctrl_fw_status {
>+	XE_SYSCTRL_FIRMWARE_APP_INVALID,
>+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>+	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>+	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>+};
>+
> /**
>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>  */
>--
>2.43.0

