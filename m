Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12667C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AAB10E708;
	Mon,  7 Sep 2026 09:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fR47LFpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E599F10E708;
 Mon,  7 Sep 2026 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788771876; x=1820307876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DcmDMdkise9MAKHPYFFfyyWOTR5yCVE6ofEaxi8uVkM=;
 b=fR47LFpx7pNbymkf/o+FFC3cQu6Fy4Ysj7a4Zvk7buA8HEyt+n7q1qO5
 B/U5dBCptNpnSgVZqtoGOhEK9iE5dhHn1vUJHEUQgkRkmcCTQ7GrIVvDK
 eWDAlO06YFamvWXqyHRF+bVkAm3q+3xAVMFWcxMrktgxTHSnKJUdW3w6d
 1bTq44jM/rhRJQ7gcwqdJikLii6fDlb9AXzm7A+faTEnI7uf0EnzYyEPf
 e0BY3DnmD4mboK0FjsTHx1X9PZSQi6D4hkaSMv1i7vSyWYv70JTvjsaru
 Bm/2nzYF+SG/zrs3j54nYNevAX42QsnyQbYHkXh7j5y5MZ3GbhKatSCY0 g==;
X-CSE-ConnectionGUID: Rshn4rDMQdGQUYT4FxFUEQ==
X-CSE-MsgGUID: 8HcbshaXQ8OQGUVcD7pU4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106540397"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="106540397"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:04:31 -0700
X-CSE-ConnectionGUID: 1tdH3P5KThis6RGtxUevBQ==
X-CSE-MsgGUID: z1Gb7D5XQUW4GSVpmhViLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308890663"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:04:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:04:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 02:04:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 02:04:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/7pqjIY3g4vCT/b7EvmFfJTsfrN2nl6c6eTAQSo4DJTMjHPadllpwjtYTZjJ1SoG43HMkJZoIUr9gNda4SAIJjaBSJYh/RbcYu+EyVQW484FaIA61DypYEukGKs8WG2W3l+zwkczFuBKQd+pRLZVaLlR4L1IbFipakaBQK9zn+58e2TET8gpIInQ1AXEyrv+egSFRxFBNeJbd/94MnXtcU3UPbetQ+5Yp+zuCc+moiv0nr4Hh63bwj1jNxuOobp3thmyT80F5Hfk0td41f1Y6nvTK2n4wPLpWlK1XG2WBH9nJFsyv8Qhzdvx3LiCPMPvENhjiQ911GNbawzLUy+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to/yCyHrBQKbC52bSq3GCChn2NQVwaAvE+lX799wlAY=;
 b=rh7zzOywc6JcNlqMFJkXWpVd/QAK1ab0v00AvhZCzbYtiRKUy2t6zoeGTkGAAR+pD44EMhFvRt2nyaFSS8qGuTMS33mT7Tg3lLjvzRQ+Mf8KcbaFKue8v3AqtgigKpP0kWJL0Brglrxsw0zxOdGtcF12lPznDHNXwOtkIOMK2xxwySGXxAxomqRFSRDqlpKcJqyQJpP2qHwXmD56WDBohTxd0QqDn4ud1eoXWRq9hmc7elf3WsXyYRfIbVGf18R+tQeaty/RihA/42ap4E2Ui/5uLCs2oEM8BHxm+cWmwVPSIwa1Q6NrxqFk2h5DswZAehF35EnQNVw1DkqGFI/7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7771.namprd11.prod.outlook.com
 (2603:10b6:610:125::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:04:26 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:04:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHcph3FXUtOQAt/DEKboKxA7pyVubaQNaoAgAmTgNCAKjkxAIAAAPKw
Date: Mon, 7 Sep 2026 09:04:25 +0000
Message-ID: <DS4PPFE901A304F07A531CDD56120EB9BA5E3B22@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260225061110.385441-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307A07B980ED412AAFDBCE2BAD32@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DS4PPFE901A304FB98A4EA3E8BBA006864EE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <IA0PR11MB730774BFA9F655401274EE7DBAB22@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB730774BFA9F655401274EE7DBAB22@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7771:EE_
x-ms-office365-filtering-correlation-id: 06f5c5e1-0296-4aa2-b418-08df0cbf0449
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|38070700021|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: sbM4ix5/9gZdW5TvnLXc4gZZTtZmSTqR0treTJJ4vuUrXDAlIH9EuJwNTs4GoadUkqg0AgfdM3lCUz9y/Y43x7SOKr2ZKl7OAwi0VNRIkQhRWhABkOu4a5BuUZrO96gr238E0MIDJBd6WGlDqtOQ6hVUKNwx5XiyHFpq/Du0ShKESPXQ0WQVI5YPK+2t5PH/zgn/Ro362zTnFHCBFJkMTWX6rgqRfqnBY/tA4RWZRZ3pea/xeXzL/n1d8yGvL8rSaPkJaEys6oFdY88o4DkgADf2tl2JMeVbGvyPrQmbzGn+qCJ1XGGRDpIddUovcFibt54CdQ35wbC7iDhj6GYfVE1m5mdZlwmoWuMakuDzcRTQfB1Qlm1cWIDoUbvgeXsPWt2vygeXZDbrvZZABpQ3DzMXWeuejOxEWtjKk2UVbrGBTHHdhEtKf25RzxqgMqKIfA1a4f8o527Vd7Ewpzhx4A4tjbZjWVnMJLDK8uaNOatHWU6Xdb+d5DbJb6G+5xJhHLl1tD1dMsYLHGE1EmVbsdbO621+ghxEbCBH5bsPaMdTWo79WtglQ732MFftO8F3SAfa1i0vRYgnST/aUdY7Wpb459wCHqN+AIuaMCC4cCE6I8l4kx/8wh/6tipqgydhzU9Drd2fx1887e/+0v2nSi3wvHvRFL8HDM/1zaEQ5Yo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P9Yp7iNOeNM1OzQiq1NHHDHxm+dFvQXtnx4LBJr91ldGnNAw/Qld/J+JjMCL?=
 =?us-ascii?Q?NYL8iyXxNMOfvk0HapU6djwgjdNOgBnT7heaLhn6LXnmATK+DdWYlLIa3X/I?=
 =?us-ascii?Q?/vmxd2Pwr2495DWWbkN+uyUHlrNILjUBhTnPptNk5s+iaecY6byqpGxxu3sl?=
 =?us-ascii?Q?0dXrJQJVtTjhaQp09tlUUlcZ8TVO8DUhc8qQNGpA98rDyd9niPzTfI3e82T1?=
 =?us-ascii?Q?XL4YKvEzQ7zwm1y+8HFam8FswbMlwb9ps0wNl1cK+UZ6sRhis3WNndy/zUNY?=
 =?us-ascii?Q?i6l/CqWZKS7AZ//cMcRvphTmZw1h6wD4AuL43roAfdemIeERm8GLSA/uFost?=
 =?us-ascii?Q?2qq8kcs2inVoDpTk0lrHCwoFlQ/KPgWCpi/DivXYr/V45MstAp072Acr8BfT?=
 =?us-ascii?Q?YXl5v5WsnKCsAauf5XqTBaXgJ665JKig3BaC+47BuzCGTQUw/Vy5Fy1vEGVM?=
 =?us-ascii?Q?LCRK8U9L76p0/wiGsboTN1TS+ME4cWhX4aOsG+QpOo/w117uKUZO8j192Snr?=
 =?us-ascii?Q?hkSA0GAhYPiWht8pe8A6Zitcqx5xwMRllf0QQVH/sI9VcBCd/j3K/U3Z8kXy?=
 =?us-ascii?Q?u2s4NXSk73uKCG70Lk9syUwsLqBBjhZDMbPPZLh9gwF7PkZxtx/3fPKljMcl?=
 =?us-ascii?Q?pR0URjC8T+Xi54L0wf/Hy+qcNHJrUwqswz2J+Gltqr648cbWWMaplrODvr2h?=
 =?us-ascii?Q?He+er2KN/JtVotn+WoC/aRViF3Rm21KyV52+d7M3IMFAb0mj4zDdOMQK8n5R?=
 =?us-ascii?Q?DP8Z1zBcyLuowD69pFuKlhGfADPZcpVRPTp7J4BYXbdstUhi+ApkjEUEuE9D?=
 =?us-ascii?Q?YFegS9odXLwiJ2bUBmUBxrD7SYoS6fboCO97efXy7MXXYuyRd/Zll6bMbtzO?=
 =?us-ascii?Q?6Ge8u8bRxVsuXBATbkL/UJ4NTWaTJABb6Qq7P++a8Z2asQrT3h0wybGuGLdn?=
 =?us-ascii?Q?OTFR5MR5bZ1RWO21iRvD9TQG8SRdQY4YodRVrQ8NX/updPJQxCfb+QWoy434?=
 =?us-ascii?Q?2WxkPmPsJBS6DI6EdHFPuAJH5sxdLD4iDv4vrYavP7TkpdnMAB41lugroHYJ?=
 =?us-ascii?Q?qlXtPYHNRRiB2LnBEzqwxd1NfWoUqIoCLreg3nlJdhi0fNLgnhxKk+TQp2o1?=
 =?us-ascii?Q?dwO4Nj47MUoRD/5GnMoQeS4GBhNkrx0OeYCGA0xjgnINQoYbXI8l8n+LFSfc?=
 =?us-ascii?Q?1QXwi84bJRWDFatEYCTeIQHrdyCHUYOFz+mt3s6R5illyh7U7pBZkDdg1L2d?=
 =?us-ascii?Q?T44lhtuvwFHwlO028ifK5c3Htsw809ewxMFpmQNqfarBUbRU0/1qy4UFAco5?=
 =?us-ascii?Q?ikUYpNMKr1TfunRIuUp6iIsb5thAuiZUHgZaox46U/wdnoPdHhv3HoyxgsWY?=
 =?us-ascii?Q?reW+Yl0CRoD7/hYjJ/ZNtOcadIKeJQzrNA2mWX+U1kv1+d2ejd6e1hOkrw8D?=
 =?us-ascii?Q?o5h75FIfJDvB9GhcYTaBiMRWDxTHiKVZIXzc/xVrCKTUpP6ANVdBBaYinyeL?=
 =?us-ascii?Q?VkeMccTQr2uU3REioL22Lyq3R+nLDF1Tt1vad6IiK6gAc/3ygBpDpAajuqhy?=
 =?us-ascii?Q?OFoTSkSfyTS1ZHnuWoEIdp9Y+M+iQNdFuZzSBhxxJZP6ItzjjArZOSjfyRZ1?=
 =?us-ascii?Q?gGXVlqfp6MiW9AurwU/xEuJwRjVf/9/1ixMPk0w7L7dMQdM1EL1gdULThIQo?=
 =?us-ascii?Q?UL5dL+DVO5AEZJloH+0TzvjlwDgn+zR56iv7JDUGWv1CN0HxMoNa88JEK7KG?=
 =?us-ascii?Q?0ra4KMFZ9A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wKh6NYgilwoOqMkkXNzOrto0clTNHpRahlwNYb++gSy0pikX7q0YI/nh8zTKJz7BydI4TuWPRNR0wwFZtqoaQQkluNFinxbf15bdISjPUJlGqH8XnP2Q3mxuRohmMMJDMNaQbbjE5p3QkK3eDyPsrshGouLeYonIoRSHrQmK3Ro6Eia16qDihaRyknmCa9myLx4Kd/dETc3Ya/TfeciHU8o4i/Gj3BGp7xxuG9cp+qF9Lo6HpjK8IqwjVu+GRW0ry5PCKXFI3fTOVzwnB6Y0sgxi5DpGgkBCXlcF/GUaCCDg+WDmeE4DnATD04fV4JXqkn+U0YwKWYU+E6ZSCsQSUQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f5c5e1-0296-4aa2-b418-08df0cbf0449
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 09:04:25.9972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pv1TS6hVx5dgCirxb5DSN6f/Ao8ej85BmPI09B00Tk6gYxzd1AkiT/pPJHb2ze35jGJFLHeSZstxaY6ey0+XmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7771
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

> Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: Tuesday, August 11, 2026 5:47 PM
> > To: Murthy, Arun R <arun.r.murthy@intel.com>;
> > intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Deak, Imre <imre.deak@intel.com>; Nikula, Jani
> > <jani.nikula@intel.com>; ville.syrjala@linux.intel.com
> > Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
> >
> > > Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for
> > > eDP
> > >
> > >
> > > -----Original Message-----
> > > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > > Sent: 25 February 2026 11:41
> > > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > > Cc: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> > > <suraj.kandpal@intel.com>; Nikula, Jani <jani.nikula@intel.com>;
> > > ville.syrjala@linux.intel.com; Murthy, Arun R
> > > <arun.r.murthy@intel.com>
> > > Subject: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
> > >
> > > Its observed that on AUX_CH failure, even if the retry is increased
> > > to 1000, it does not succeed. Either the command might be wrong or
> > > sink in an unknown/sleep state can cause this. So try waking the sink
> device.
> > > Before reading the DPCD caps wake the sink for eDP.
> > >
> > > v2: Use poll_timeout_us (Jani N)
> > >     Add the reason, why this change is required (Ville)
> > > v3: Wake sink only for eDP
> > >     Remove the dpcd probe set to true/false in wake_sink (Imre)
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
> > > Closes:
> > > https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> >
> > I think this reply messed up something in patchwork have a look.
> > Moreover its not building anymore.
> >
> Ok
>=20
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c | 34
> > > +++++++++++++++++++++++++ drivers/gpu/drm/i915/display/intel_dp.h |
> > > +++++++++++++++++++++++++ 1
> > > +
> > >  2 files changed, 35 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > > b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 025e906b63a9..38ea4aad74de 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -4705,6 +4705,38 @@ intel_edp_set_sink_rates(struct intel_dp
> > *intel_dp)
> > >  	intel_edp_set_data_override_rates(intel_dp);
> > >  }
> > >
> > > +/* Spec says to try for 3 times, its doubled to add the software ove=
rhead */
> > > +#define AUX_CH_WAKE_RETRY	6
> > > +
> > > +void intel_dp_wake_sink(struct intel_dp *intel_dp) {
> >
> > Should this be renamed to intel_edp_wake_sink now that its used only
> > for eDP Also I think this function can be made static now.
> >
> Done!
>=20
> > > +	u8 value =3D 0;
> > > +	int ret =3D 0;
> > > +
> > > +	/*
> > > +	 * Wake the sink device
> > > +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing
> > > 0x02
> > > +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it
> > > up
> > > +	 */
> > > +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_readb(&intel_dp->aux,
> > > DP_SET_POWER, &value),
> >
> > So we have recently switched from using drm_dp_dpcd_read/writeb to
> > drm_dp_dpcd_read/write_byte I think you can have a look at usage and
> > Replace it with that function here.
> > Check https://lore.kernel.org/r/20250324-drm-rework-dpcd-access-v4-1-
> > e80ff89593df@oss.qualcomm.com to see what that was required.
> >
> The existing functions readb/writeb are still supported!

Yes but we are moving away from them and using read/write_byte instead.

>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
> > Regards,
> > Suraj Kandpal
> >
> > > +			      ret > 0,
> > > +			      1000, AUX_CH_WAKE_RETRY * 1000, true);
> > > +
> > > +	/*
> > > +	 * If sink is in D3 then it may not respond to the AUX tx so
> > > +	 * wake it up to D3_AUX_ON state
> > > +	 * If the above poll_timeout_us fails, try waking the sink.
> > > +	 */
> > > +	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {
> > > +		/* After setting to D0 need a min of 1ms to wake(Spec DP2.1
> > > sec 2.3.1.2) */
> > > +		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> > > +				   DP_SET_POWER_D0);
> > > +		fsleep(1000);
> > > +		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> > > +				   DP_SET_POWER_D3_AUX_ON);
> > > +	}
> > > +}
> > > +
> > >  static bool
> > >  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct
> > > intel_connector
> > > *connector)  { @@ -4713,6 +4745,8 @@ intel_edp_init_dpcd(struct
> > > intel_dp *intel_dp, struct intel_connector *connector
> > >  	/* this function is meant to be called only once */
> > >  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> > >
> > > +	intel_dp_wake_sink(intel_dp);
> > > +
> > >  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
> > >  		return false;
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> > > b/drivers/gpu/drm/i915/display/intel_dp.h
> > > index b0bbd5981f57..3f16077c0cc7 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > > @@ -232,6 +232,7 @@ bool intel_dp_dotclk_valid(struct intel_display
> > > *display,  bool intel_dp_joiner_candidate_valid(struct
> > > intel_connector *connector,
> > >  				     int hdisplay,
> > >  				     int num_joined_pipes);
> > > +void intel_dp_wake_sink(struct intel_dp *intel_dp);
> > >
> > >  #define for_each_joiner_candidate(__connector, __mode,
> > > __num_joined_pipes) \
> > >  	for ((__num_joined_pipes) =3D 1; (__num_joined_pipes) <=3D
> > > (I915_MAX_PIPES); (__num_joined_pipes)++) \
> > > --
> > > 2.25.1

