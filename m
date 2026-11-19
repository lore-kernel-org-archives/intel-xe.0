Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C81606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WMxK2/DM;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XJqRimRG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EBC1126ED;
	Thu, 19 Nov 2026 19:45:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0D61126ED
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 19:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795117548; x=1826653548;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TvVABykN/x5DiOapJoSpl24c4BjXxd2PbYTPzAJnJco=;
 b=WMxK2/DMvDE2Oms3SyP/WzQMzic4sY5LKHm0Dy6nv0KMaba3/I+ycSTn
 IgBsNoVYLXVf1eZ9vEonNpNjqojwT/MPbju1bi6s+GFDugTPYD58cPpWA
 6lvUPvEd8xr5AJ5uWV6Yr8NtWQcd5q43GaYFNbsZDhgjhbd3WYt/hMQeN
 lnGJM2prjm+jmrVVEifR/1Kv/fzEl68P/0sbzO2k1Q2xwlmibunPRFqWf
 +kkHbI1Cn9gFyWltm/0DwkzSQk3LoDfFPtn/I0xdGdo9Q9M2SDoxN7aIu
 jYk+BZJGu0nkaDo4Qi2MnP0lE402Ct2K/R42Nd6mVeNMQzwHiSI6Wtun+ g==;
X-CSE-ConnectionGUID: 4hy5PXTRRqyqBOQcpC6Agw==
X-CSE-MsgGUID: zHmHFQK7SayFVTa8sw9BUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3992499"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3992499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 11:45:47 -0800
X-CSE-ConnectionGUID: p1t4Jyu4QfGk1OpNxv1h3Q==
X-CSE-MsgGUID: ECrAZYe5QtGiakw71nDlmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10872080"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 11:45:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:45:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 11:45:46 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 11:45:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU1VUUJ0zAQk7x212v0TCCbXa/aAj71aw3IOyKv+9NRIhP6yYutpHkwKILy105fk1uLbIfBJoznC2TFeWyKgCp9vKomDagaCRJ28vjONuNlWvvBsRzyprMiWOHV5uNfp0y3Ik2cbQuyN8I5XbpBQJ7fEIq38gvVBf/x75J0QdrY5bOiBQaI0tPpY3Dpw2fmGEPpZK4j9ZWtX7mK3Vq6mldGXidT4B1BgJtDBI/6nXZkVO8uVSM2H5QbUQx96oEftAB6+6TSppfn05klMOFB8jFzFWu7pAC1dqaVurytqRrycwwMdH743pumHRNsxAlM6m/v6SP0HT185NdKWAkGi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5fgbrB7ZwE+vqNbznBkyYyX1pH/2uINwhn7y037+i0=;
 b=Yks5U7DMMGd5LXkv6GOkPmCZyjL/z42+wsLNpuQW1w7o0KjmOfsoNjJ8hvD5DVzCcasZ1v6hpXO8YGiMdr+fcfCucRiTfmJQVf40HDN4ek9H7pyAncESSMXW50UF8MChSo+kalnaA6E0aa/q0tUACJ92yWFB38oKwW72NTx3TjbiWgnCuShbn27vVff3szBtm/DxokMNKwpYqeFR/W+WEoL+kUjtsEHpy3Ld+NowcBJ5AH6L05kO0USLouKrGmndbJ/WM49xLuDkndvFayB058Sv7yEpaKiKhclC07n7ydUtU1keoYfVtqFNn+sFFy+TLm+s+4+8nYN0LsdbI6LX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5fgbrB7ZwE+vqNbznBkyYyX1pH/2uINwhn7y037+i0=;
 b=XJqRimRGzc6cNmeWnF+Q09cVFwwmHCAbTgRuoI8WxUgiq1kbw3Xvb0qJ59ch9kJhXwl1PU45tuUBr6z/JkRbi4J4wQieOxxbvjIyyshHF5RuQVCmypePMLk5Lb0ja/v3VQtNWfTjk0wPPdaKIBgDGBuptir/Zi9cXgFPSgvKgVs=
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 19:44:43 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 19:44:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Charles, Daniel" <daniel.charles@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>, "Yao, Jia" <jia.yao@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v6 4/4] drm/xe: Synchronously wait for queue kill on FD
 close
Thread-Topic: [PATCH v6 4/4] drm/xe: Synchronously wait for queue kill on FD
 close
Thread-Index: AQHdeE6ZzQ6GoeV2JkmolvOoClAFdLc1y+cw
Date: Thu, 19 Nov 2026 19:44:43 +0000
Message-ID: <CH0PR11MB5395A49ED452058A43C425BDE5792@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261119174621.1311154-1-daniel.charles@intel.com>
 <20261119174621.1311154-5-daniel.charles@intel.com>
In-Reply-To: <20261119174621.1311154-5-daniel.charles@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|MN2PR11MB4726:EE_
x-ms-office365-filtering-correlation-id: be9b4bc8-973a-4ecf-356b-08df46758f07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|38070700021|10067099003|56012099006|11063799006|261021121427099003|261021123027099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003|6133799003;
x-microsoft-antispam-message-info: 4eseujzCqHmydLhlQxLlSJiKgLnYC11uLeRW0QVWHxXaATYotR4r2m62pxQADMK7PW+zdoMEpsyKapfqpeUoJb1lut0ST1kw/7MoFVMr8A9lql0rLMiRoalswdmyLGLhAqoeS9XCyQLn/xLvzYYAj3lj188ceoCR+mvlPIgcojPYmkDR20GrftMnPfbzQSC2mBNB6wThQWUXy6PdiKhmRHDBtknfjyQv/nZWXuJ2Rru2ASo8M6JDSp28mRLho4uiGeGfPLpNbX00LxGJtHStROGL4z5KINpwg7p6i9aLgkWkOAr/3mAnDO0Wo1mvtjK3QhjdiG6bxYUGggpBoaLwT/fBVrq+44UTkEzjiPwpRtnLhUep+UcWCWzgFx1Tfsnr5tDS7E0L1mgC6DwP46dHuG0JHecRtCemQ+diYBg8wZwgq4aG5GRBKj1k4klJ93L5OziigPDC/0ROjLDedEw04OcjPedWFqiMpriWakjCgHOKZiHLh6lF4/0t4KGb2lkRxyXio3Fg/Dlp/J14FVk2vBTKAx6RuXRFK2xXW3NpTyEEC9NR/pS3PiwondlNJepa4WDnkMldV//plgEn5oWvlsj6mufyran0YWRF3G8qDQTRvvjnWrWWIg41qMBh34+oJ6i0GGtGd1dKoA4QTybyqLcfRgo1RtXMGyR6ujX8aAcejQ9Sq8uGvJm3UjNVDGcY/zzx75D0FR1ZaxkTzrqhchXvi2s3ppMOiDk02Wvyzsk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LJzNGcggLgKa+T4DgjFVz+cIPFgFejncX3QOKyTaA4Ec8/enDLwS5Crp9w5k?=
 =?us-ascii?Q?j/J9prPZ6LVmMDK0tQrpBQ+Pw0Pdyprl7UGPTeyQc0s2R4XRPSQvgbwsBAOr?=
 =?us-ascii?Q?PpUHyki6Q37OR05Jji9Ierx3BqTqG57DLLuI2fVUUC9RaSR6Yj28O+CPfMfq?=
 =?us-ascii?Q?3t5wCVCuLXBWhVxyq1zttClmkYGhjzWTn+xfqkUR9131afdzMtrS4DAJ2PZu?=
 =?us-ascii?Q?p373euNQJq0KAchv93M4lsxRHKbhrKk7/eTscOwpazMDh006hX9Si2GsO+er?=
 =?us-ascii?Q?8DIzbjRywdo9BbURZSQzZnW/TyzWq/zbYCeAAvdgPAZxyQc3Ffy9S/PoezxH?=
 =?us-ascii?Q?c9gRSQ3OI+y/mr+hq5VXxO7Ep/UtN0mbixjSNmfhdzSID7jthneUNLH4qz7d?=
 =?us-ascii?Q?oJCDw0jDkfQSBZN9fw8Jo2ztSwkPTFEp+WB7FI0ODlfth1oenzBEnqJmXlbN?=
 =?us-ascii?Q?dadyyPrwfWbJtSevRSVEuJWkOXggnJwgaBh2RY4Ave3hzvl7kcYAp4siqbJb?=
 =?us-ascii?Q?yCKq5KZ2R4JLt0web8ADUEFzYwi5gJ9MntbDv7gP0UK69cON9Q1Vt2wnmHPu?=
 =?us-ascii?Q?WtJIwMRczM8hMyeIuS7Z2z+3nnZC+c4LWGKbvZl5MgczSVD/1DXgsMj2j87o?=
 =?us-ascii?Q?Ku7ViGMjUR0+DQrJ4yWpVSwJSGVcvik1tA9iiBSYX2uSc0S4idXRvWqubrOj?=
 =?us-ascii?Q?BWQ23i6GZYE+hknNkEorUl5bxq4MhbETmSFyxVXCmNgIzcs93vOx7vlv8U05?=
 =?us-ascii?Q?ZWXyj0b0mhJIMZbzAplttHiP1UMOTqYB/9zUGNNANI6fDOu9hOX4uiGD+wxP?=
 =?us-ascii?Q?7FjWihlnXsVtsOXPfXDmJzONMCmGNnKJbU/KV47HzKVmJug/6Mpqhc7PqSv5?=
 =?us-ascii?Q?ilMjvkdTFi+EIjkWHWqTm5Y1lgFh1Tv1dJUxmoeqdDBvF/8R8TmH2/ab8Muw?=
 =?us-ascii?Q?H5It2Pgwmxmcd0zWNEJiEQXI6u9mtwfqInyYfAlzGLJgfRF4tCXqgntgV8eS?=
 =?us-ascii?Q?BRn+OnUY8oMKilGom+jXgC4DSe8AKklgV9QuEtfm2GpzsSlEdEdWGOOA3HUt?=
 =?us-ascii?Q?RTBcTH2vlmTneyeEuqetxliunF8pSwFYatPlEHybzrD1xNM5x9NzOeq6Ieaz?=
 =?us-ascii?Q?LBHKQuLRpfMEFmidCyF96W3fNSRM9QaLuFtlHmVYDL5c8GMZTwXbqwGd+rx0?=
 =?us-ascii?Q?JzEZN9Vb1hMjpBVyy8Rk6hOTPiqTiyeUKSjCPrXDDZWE/ZjA3lxsL0kDfiYs?=
 =?us-ascii?Q?9h5RzGAhyNUReQLykDyGu7xY/Qn1r2PhVjLHpJoef3gqaAFLk9m0gA6g0h3J?=
 =?us-ascii?Q?+xqcGU8tKuoDonQKyjWPVkB3yYDe8q9+HcQdUCMdW73DR6B7ernzztViZn54?=
 =?us-ascii?Q?X3Fo4UJjuaqgjAc8JL5HSw2owuhOOjyKhRROwt9PhZRnDBXLrnt5UmtE1Y/N?=
 =?us-ascii?Q?cdY48Wx7iLWAfS1JWnxSocYkfktrRgag+lb5jJ5yBiaOSuaBLktE1OgzZ1s8?=
 =?us-ascii?Q?Q6kyP0mskTLUEdVs1+qTFGjG373ndvy5Wo8b5lG4cW9RQ45ZIkiIEmN8AGJh?=
 =?us-ascii?Q?XebliWvZxv3v7VltQArrYP/w960+CEE2zNLcQFpcxBMx9aDYK6+k3lcTBhzn?=
 =?us-ascii?Q?0XXybb8ew3wExtdpVsXiPiNAwySkY1nXLrHzNKzTZikFC/328tanXmJSwYiO?=
 =?us-ascii?Q?d0cOYc7gSJW6SjE3dWoLt4UREY/H4U88dn03Hc1dBjMOUtxIIKeI5V9VxBba?=
 =?us-ascii?Q?wNK99K553w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qb/5kWwnmJtFTGiKflkNgxcBPPomfKHB5MO44JU9CFSko3+55uvkgXAhx1o2EEvQDaZ23X3D1R9ECmoGjAS01typXKCmUX6AhOX/ejDMNJwuyxzav0bjCJckYolYEwZ7qyrjS821LMTWAVWr6nbmvETUag+c7wQFX7mXIBHUxAjFnmefpvwXcdRbyBOehQPUTgVizKDgQ1YvbXdVml9nJ8YKC5odJUGiQfHKMYDgShPjUMEn5VMdv2Zl1sMXWfurVzw7BpA3DaRG57jHil+M/rCQ7bvRP6ap6ge4tmvuKQVATITbvEsn36N8ZgU5MXpz2sh37SRhSMGHuVS0F01Qeg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9b4bc8-973a-4ecf-356b-08df46758f07
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 19:44:43.4559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SubIPxCYKO4VJSFr4XaEYccX6U02bENEUqzVBSRG+TylMqlvgR+X8OMz2LT1XocwP1IEv3FJqc6bpDRwO2ld3BRm6iPF8C3Tau6L59DBuqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
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

-----Original Message-----
From: Charles, Daniel <daniel.charles@intel.com>=20
Sent: Thursday, November 19, 2026 9:46 AM
To: intel-xe@lists.freedesktop.org
Cc: Wang, X <x.wang@intel.com>; Yao, Jia <jia.yao@intel.com>; Brost, Matthe=
w <matthew.brost@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; =
Charles, Daniel <daniel.charles@intel.com>
Subject: [PATCH v6 4/4] drm/xe: Synchronously wait for queue kill on FD clo=
se
>=20
> GuC may still schedule contexts while FD close tears down their page
> tables, producing CAT errors and engine resets. Split FD close into
> two passes: kill every queue, then wait for each queue before dropping
> its reference.
>=20
> Require the KILL handler to acknowledge processing before accepting a
> single scheduling-state snapshot. For multi-queue groups, all members
> wait for the primary KILL acknowledgement and scheduling state on the
> primary state waitqueue.
>=20
> The wait also exits on GuC submission stop, VF recovery, or wedge. On
> timeout, request a GT reset asynchronously; the wait does not establish
> hardware quiescence on those paths.
>=20
> v2:
>  - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
>  - Drop the flush_work() loop (Matt B)
>  - Use xe_assert() for the killed-queue check (Matt B)
>  - Merge the put loop into the kill_sync loop (Matt B)
> v3:
>  - Wait on a dedicated kill_wq instead of waking ct.wq on every
>    scheduling-disable SCHED_DONE (CI)
> v5: Rewrote the description for the primary KILL acknowledgement and
> per-queue state waitqueue.
>=20
> Assisted-by: LLM
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c               |  5 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c           | 13 ++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h           |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h     |  2 +
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  6 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 47 ++++++++++++++++++++
>  6 files changed, 74 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index f5a581d39c96..cc27a1604d59 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -194,8 +194,13 @@ static void xe_file_close(struct drm_device *dev, st=
ruct drm_file *file)
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  		xe_exec_queue_kill(q);
> +	}
> +
> +	xa_for_each(&xef->exec_queue.xa, idx, q) {
> +		xe_exec_queue_kill_sync(q);
>  		xe_exec_queue_put(q);
>  	}
> +
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index ddd9e38aa80b..00941a9853b5 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1662,6 +1662,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>  }
> =20
> +/**
> + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
> + * @q: The exec queue
> + *
> + * This function waits for the backend to finish stopping the queue afte=
r
> + * xe_exec_queue_kill(). It is safe to call multiple times.
> + */
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	if (q->ops->kill_sync)
> +		q->ops->kill_sync(q);
> +}
> +
>  /**
>   * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
>   * @dev: DRM device
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_e=
xec_queue.h
> index d48775ef6baf..b7079c35e822 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -120,6 +120,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
> =20
>  void xe_exec_queue_kill(struct xe_exec_queue *q);
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q);
> =20
>  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/x=
e/xe_exec_queue_types.h
> index 44a41ddc7a05..611d348145a6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -296,6 +296,8 @@ struct xe_exec_queue_ops {
>  	void (*reinit_kernel)(struct xe_exec_queue *q);
>  	/** @kill: Kill inflight submissions for backend */
>  	void (*kill)(struct xe_exec_queue *q);
> +	/** @kill_sync: Wait for the backend to stop queue scheduling */
> +	void (*kill_sync)(struct xe_exec_queue *q);
>  	/** @fini: Undoes the init() for submission backend */
>  	void (*fini)(struct xe_exec_queue *q);
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/d=
rm/xe/xe_guc_exec_queue_types.h
> index 3f5b1950a248..cb0e460f4762 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -54,6 +54,12 @@ struct xe_guc_exec_queue {
>  	wait_queue_head_t suspend_wait;
>  	/** @state_wq: wait queue for scheduling enable/disable state changes *=
/
>  	wait_queue_head_t state_wq;
> +	/**
> +	 * @kill_processed: KILL handler has drained earlier submission work an=
d
> +	 * issued any required disable. Published with release semantics and
> +	 * never cleared by repeated kill requests.
> +	 */
> +	bool kill_processed;

This solution to Sashiko-bot's previous concerns about guc_exec_queue_kill_=
sync()
returning prematurely before GuC scheduling is actually disabled might be a=
 bit
over-engineered, IMO.  I think it would've been sufficient to just reverse =
the order that
clear_exec_queue_enabled() and set_exec_queue_pending_disable() are called =
in
disable_scheduling(), instead of adding the kill_processed Boolean.

-Jonathan Cavitt

>  	/**
>  	 * @suspend_pending: a suspend of the exec_queue is pending.
>  	 * Protected by @sched.msg_lock.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 671852b56210..ec308b06c1be 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2104,6 +2104,9 @@ static void __guc_exec_queue_process_msg_kill(struc=
t xe_sched_msg *msg,
>  	if (!kref_read(&q->refcount) || !bound || exec_queue_wedged(q))
>  		return;
> =20
> +	if (READ_ONCE(q->guc->kill_processed))
> +		return;
> +
>  	ret =3D wait_event_timeout(q->guc->state_wq,
>  				 (!exec_queue_pending_enable(q) &&
>  				  !exec_queue_pending_disable(q)) ||
> @@ -2122,6 +2125,10 @@ static void __guc_exec_queue_process_msg_kill(stru=
ct xe_sched_msg *msg,
> =20
>  	if (exec_queue_enabled(q))
>  		disable_scheduling(q, true);
> +
> +	/* Publish only after disable_scheduling() has established pending stat=
e. */
> +	smp_store_release(&q->guc->kill_processed, true);
> +	wake_up_all(&q->guc->state_wq);
>  }
> =20
>  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> @@ -2351,6 +2358,45 @@ static void guc_exec_queue_kill(struct xe_exec_que=
ue *q)
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
> =20
> +static bool guc_exec_queue_kill_complete(struct xe_exec_queue *primary)
> +{
> +	unsigned int state;
> +
> +	/*
> +	 * Pair with the primary KILL handler's release so earlier submission
> +	 * work has finished and any required DISABLE has been issued.
> +	 */
> +	if (!smp_load_acquire(&primary->guc->kill_processed))
> +		return false;
> +
> +	state =3D atomic_read(&primary->guc->state);
> +
> +	return !(state & (EXEC_QUEUE_STATE_ENABLED |
> +			  EXEC_QUEUE_STATE_PENDING_DISABLE |
> +			  EXEC_QUEUE_STATE_PENDING_ENABLE));
> +}
> +
> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +	struct xe_guc *guc =3D exec_queue_to_guc(primary);
> +	long ret;
> +
> +	xe_assert(guc_to_xe(guc), exec_queue_killed(q));
> +
> +	/* FD close has already killed every primary before waiting on any memb=
er. */
> +	ret =3D wait_event_timeout(primary->guc->state_wq,
> +				 guc_exec_queue_kill_complete(primary) ||
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc) ||
> +				 exec_queue_wedged(primary), HZ * 5);
> +	if (!ret) {
> +		xe_gt_warn(q->gt, "Queue kill failed to respond, guc_id=3D%d\n",
> +			   primary->guc->id);
> +		xe_gt_reset_async(q->gt);
> +	}
> +}
> +
>  static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sc=
hed_msg *msg,
>  				   u32 opcode)
>  {
> @@ -2829,6 +2875,7 @@ static const struct xe_exec_queue_ops guc_exec_queu=
e_ops =3D {
>  	.init =3D guc_exec_queue_init,
>  	.reinit_kernel =3D guc_exec_queue_reinit_kernel,
>  	.kill =3D guc_exec_queue_kill,
> +	.kill_sync =3D guc_exec_queue_kill_sync,
>  	.fini =3D guc_exec_queue_fini,
>  	.destroy =3D guc_exec_queue_destroy,
>  	.set_priority =3D guc_exec_queue_set_priority,
> --=20
> 2.43.0
>=20
>=20
