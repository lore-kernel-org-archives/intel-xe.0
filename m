Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA4C7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 10:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E51810E9F4;
	Thu, 19 Jun 2025 10:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyegdsWu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FD610E9F4
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Jun 2025 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750328813; x=1781864813;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7KUAXAKSJv9uecCzcKcGHHKQSROvDht+h4S76knGh+8=;
 b=VyegdsWuIGJe1fYPumc4AIm7rWET3R7Gk4mZmBmAUCUiJsZQ0ImUuMFB
 kHjfxBAuPsZcWNZMwKf1Jv9k33/TosHa/tpN19zf5PtCA7pwwWk8MR5Ag
 XVe3YiLE70jF7h3hupC6UaiHsCKjp/Zaq17POblmAI3hki14W/43NAtLe
 FU9Pn9aMeSmkPiSI5XNNMisOMjfMxffUg3eCyNzCoO9dZUBAnZxTy280y
 kW8GByMp8I3nwSZinOv1HJNiiJE7C6XLbD2e33Cfs9d+oImXm4eJnjZ9x
 Rbi0wGLWSG+DhXx34Tzm3LVDLTSG6J78VEXcSKCI7itdeusTP3jIwbOCS w==;
X-CSE-ConnectionGUID: jvCr6TMZRju/iyv0Hn1/3A==
X-CSE-MsgGUID: nXklCgfsTDm2BojTCkUmfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="62848625"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="62848625"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 03:26:52 -0700
X-CSE-ConnectionGUID: 4kR1421pTg6Vni7sqGlvRA==
X-CSE-MsgGUID: 6wc9+yHeS5CMHK6EJTiM2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="150707499"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 03:26:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 03:26:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 03:26:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 03:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmUOZwJglVCBmGJw2swb21onIg6mBuueRvtb79AllwBNQSX95/55QUPLUeXHfeTxEzBiiv7466rqvdFgmVsP5oZJreHvgFVqUnxTqvJQKX3CKjiL5WG5GqZfS4FuW8XTmEUjiKjd5sc892qP2p9UCdfWV73/ekkhECQHBZmXpfupZkC7YKj8hRq1geZHureQoUTBpI3x2lXwexqMNreBFjhocmmHoIj5ZK4ymx5p5jCyhHKn+AOj59Z7c/u//nPv4gmPVunR1E1O4k5W7IxJ3FWhzVsDRH0vwDkS1y5xhEcRC1+wvSrWmvASK56J6n3IfrVWUbjQgVdZbJs3n1uvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d3PE8Cqs6IF8rC/myFMlnN0Z++l8xGc5wEIL0yx3xw=;
 b=v/2H8JOaw2LhWKRODIoUDEBqpA0wLczEgRWZp9LhIMHw9X/vBwAMR8rRA7y2GVFp2feeJZf3jxPgH5/E8rM9X5gkeHmI0GmUj2mELom7bbTpOxnG36SIwEI+CsotdBUfSj2G/Iseq4+L/rwtvp69rW91M8tQOG7wbHvVGgWqM9rWy9yt+YlxA/maUUGt37mvyRAapx0VUf5MMwH/kIWKozXbRP0uVd4q2kXMN5mPh/VeU1mKl3967MFn/KaA+OiWq5UZsFi9wZOPxhtiKXWBtf4ZZ29LuqqxJkruMmr9O4wLm2n/EikTN2PfTjXYhhPS1pWf0xVjuda7W4FoKeDfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 10:26:21 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8857.021; Thu, 19 Jun 2025
 10:26:21 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v1] drm/xe/vf: Make multi-GT migration less error prone
Thread-Topic: [PATCH v1] drm/xe/vf: Make multi-GT migration less error prone
Thread-Index: AQHb3Jd0WMwwKkwxbkKEGRkqPrT7X7QKOYaA
Date: Thu, 19 Jun 2025 10:26:20 +0000
Message-ID: <LV3PR11MB8695984CF012DE8A62830632F97DA@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250613191450.1955691-1-tomasz.lis@intel.com>
In-Reply-To: <20250613191450.1955691-1-tomasz.lis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CH0PR11MB5249:EE_
x-ms-office365-filtering-correlation-id: 65d50127-4ddf-4597-c29c-08ddaf1bbc05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PHFU8ZMIKcfONqsnKlbJX4vByrFAQtZW7bPxRox+wwWQh0iQIU6bKaczoA1Z?=
 =?us-ascii?Q?uktfOhG1dPDxUGgQCt6MlgMtwjGkxsvHkN7Tpd+Js++VtpUSapRLH7OB/x8Y?=
 =?us-ascii?Q?HQ/oVgbabEUfNCcYhha7fgoO2atbd72xh802xvIkBY5MJ/dIA+Luqd9IosFY?=
 =?us-ascii?Q?pGpX5nacvBwnznT58lIYusAC1fZy9JVWN2XL3ZwbOfmLyWfmSI+WRe9CZANK?=
 =?us-ascii?Q?fJy+bI2puSfA3621eKBf6eUAmzA50ZPNXgRnfaGoXdArTqdbHk6fr5PeL0Kq?=
 =?us-ascii?Q?TWwy7WTFeqs/9oiaPsLnkAkgTKf3zSMW86KW7L4ZLx4pL0QVNNvaTci3R9GX?=
 =?us-ascii?Q?MrHuXOEU0MR1oMj3soNe9FONfH6lO1wzCoYTsbugD5ZPo2XJnwFa1mr9BKE0?=
 =?us-ascii?Q?mZ1cVstslMZr/T1VqC4hmsOrUcibPsrzMtzBkgQSmvqjefxzUCwfMA5Aj4YM?=
 =?us-ascii?Q?onaTt9zeCTyCt0/KJwSNl9y6SmFnFIlNbaQXdFtOqLn9QwmEMc/30pColw1J?=
 =?us-ascii?Q?UMP6yoZRmdRCdrkFCA2EdcHiF5tT0uQl2wlgPcrZ/X7xBFW5KEs1dPHQof8p?=
 =?us-ascii?Q?oe+D2LEl99O3E0DWKrcWiqIieZtsiglwYDDbtSA/t03HVnXOEqp0R29NV+R/?=
 =?us-ascii?Q?f9WiCcuMen3xjT6wUzOpyavgMjke+8tiI5gStWOX5jl42VavV9XaODNClWsu?=
 =?us-ascii?Q?Sc4ZyJCNPzCqfgYzs+qLQ03gfXcz9ooX0RJgpgx3cQDy+1JnbyjmKG2fFeNk?=
 =?us-ascii?Q?8/gIrDUIwuvEQ/uF6+ni0MuesZYuhTWZb9juVGwkmM5RrO7nCXlD/E57Met/?=
 =?us-ascii?Q?gw44iM/xE3qbK+2s/PeRiF4j8MN5Jef7zga2gKtgSQuW8QPXlVnoGdK0szL0?=
 =?us-ascii?Q?Sz5XbGJsBQ8rJ2oK+/Yfp+1l3TEt0g14IHwKamaqGKSQo0n7pPizC6SmrDwq?=
 =?us-ascii?Q?rX2Aps1KUp3F+UYNheLdq6KWLlx8b07jMsiXCX5ss3BlK5QN7hX5wUps/UeQ?=
 =?us-ascii?Q?BD23wyjLVHKBCPU5uoXBqbilXiQxPIEeM+TFR1UMqrUZr0u2wts+zlMkldsF?=
 =?us-ascii?Q?p4jHBhKUVqfP9wMPKjoxnnnw2LWOXHVn4Rh84AhwzBS+D3cy4Jb/kuPJIgtF?=
 =?us-ascii?Q?WyRDNH9D2aoJ0s5EyDHcvhPCCSC5ciAoD9lytzJeXRfd7rY7gLuPEN8SjFpk?=
 =?us-ascii?Q?g2VEyqwZWg5PViYCQjvfRzgwhGE5rrFbp5eqQGqQ1LUeSM/7h9TTdcLakLVg?=
 =?us-ascii?Q?ic89Buckg3bnKwWR1uPBBnUaBRtuHvlpZyA+ogzqAyIV6rm4yAehVyrIUqIR?=
 =?us-ascii?Q?oqHLCJckSFRsWXSM1lGk7ZSOboqPRTTNpaF1GdwbecWjB5l0qtcoCL0OBjM8?=
 =?us-ascii?Q?X3vllO6GurQaBxecuQWB3HlVQNpz+hm2XR7GUC9kNgv5hzNy3nIHTlyMFowd?=
 =?us-ascii?Q?8saB4RBg175p+0iZSSZcaBtZB113qT+VdCTF83bqKJdJa/9nBahAEN4s7MNc?=
 =?us-ascii?Q?oLguZs202RTiloc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rvL/E+TtW3YSm+fA2ONPbCsbgRHE214yFHlrYX2qX+39H+2r27PHe0aKvp0P?=
 =?us-ascii?Q?WvJ6WRaVY333CfVWAOqZyVN5nGaqmGnPqCzYPwgTlxlp9RHJcODJh453DY9W?=
 =?us-ascii?Q?zympaariaIySaKkpiym8PPjV5aDpx0ZXy9WTmuaAFmgM6HjRh16VS6AdhQyS?=
 =?us-ascii?Q?oGLhbyak1dWDdhBuZ2RDoP+KlKz49C6AXBYfH+jq9aNmIrcw0ECfMnFc3MLn?=
 =?us-ascii?Q?7LBQ/3L72Gm+IobzH/Clsa3bfZSHAC9BpUQZq8K7df5Mj8UB8WW1NtgbkE+Z?=
 =?us-ascii?Q?/V3iwYZyt9APOi/3E28Crj2ZPRbGKogUUTibBjDtigbt+Dp1mMX2sZUvSAHP?=
 =?us-ascii?Q?41h1t/XFlmz4BWnprZHQAj+8zF+TQs8EiwJjAON63pSwujvvenhSFH6AHsd7?=
 =?us-ascii?Q?FXfT2wFKwUCU/l291Fxp6jVihP/kl8FJq1EWJpnOY3GoUG+ujU867uUujMrt?=
 =?us-ascii?Q?3KrMFLRaEzZh+7KRGa3VDbXR74iEkOn5Em73n0PAfJZe83PmO2iLIZyACmx6?=
 =?us-ascii?Q?DyCVehpxNe+HvTG896+Bv2zXPV4IfYtBUESG1gbrjdVMeeJaMQHkJS0a0phz?=
 =?us-ascii?Q?ketznSk+J0yHhibOstBfm8JIRtpzkRaxrWfRQWuki3lZdhHEjFfSytAYHYTd?=
 =?us-ascii?Q?2iFUesgrU8ZACyyaZB2yozq7SNMS5V5K5hYR3zLw3KdFs3opOaLqtWt5ulwA?=
 =?us-ascii?Q?nEmQ1LF3ebzGjNKVc8KqB350Y/wMcAfMTxKXa/+vc8k3RmPkVl8L5HVnH4ca?=
 =?us-ascii?Q?v4xQj1X6wYF6VeMiYx5xDOkvxiq0BjNOdtzMzeCKNUbjt/dDTcyLQ2s46oYv?=
 =?us-ascii?Q?IcAWOpLRHa99ZR0RQrlVXcymTYzOK2EI81iKD9CFU4vdGDOG3ViCH72eTiN1?=
 =?us-ascii?Q?pAbvsazz5rJginl2B08mWORD/8pqZXr8b4bYw5h5nF7SR3+t4ARb001tQYsQ?=
 =?us-ascii?Q?LzZUTv3k8ApchLeTHIDrQfg0nRIiXTl0auNmPRg2AXZggTl+FfVdq3OhqtvN?=
 =?us-ascii?Q?UHpka77NLwgvsoM+6Etjt3nZ+wimuSfX3CSQJ4K/wPgq9q0PI78h6oHr0VW2?=
 =?us-ascii?Q?IZHzWiJYe1War0poMFq9GHDjVoRmU7trk1XNOHKvkUDuVUMxiVn6NJ1pAhV0?=
 =?us-ascii?Q?+V+nA3kv7pQ6Lfl30zmUdbCBSSK48S1k8T5rhl95gS6T/WI8IMIJb42otsfJ?=
 =?us-ascii?Q?VGsecd1TxadSh370xwJDhEp5WRwnP2Z7dlrklhXCk767QA0HT+F20K/ixgKE?=
 =?us-ascii?Q?odiX4UCM4mUhpv4fokRTAeMjv0VRA6H3ZsxYHR+LtEj0iUveC4ScW3SchRJU?=
 =?us-ascii?Q?aLzo2c5BLBfzE780UjEGOBGeAXrdmESeLtESg88zou2XmJonRWsVsS974Vu6?=
 =?us-ascii?Q?e9PgCBU2v7OTaaPm6nNEf3Buk4tLm1tzBOmmPCjAv5NiGatEzf31g+MLdAeM?=
 =?us-ascii?Q?Xh5dxYBb7A4zsDmPI/S8MhXAG1gUksqcScb0M+JtBETLY9vWPYzC9NWqZlcF?=
 =?us-ascii?Q?MfXVCG2mMS5VxS0ivvO3W7foyh0TB6UnG60rbbGMY9TjQW1pz3QJIPd3KEwj?=
 =?us-ascii?Q?+MIjsgDiES+9jI1neI913IvXgV4n1tXsMRVd4ClNhBXlGvWWuOD/5f8WHmAQ?=
 =?us-ascii?Q?Sg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d50127-4ddf-4597-c29c-08ddaf1bbc05
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 10:26:20.9584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5BasByYzubc6/uqlOPC6Hurual61/oyMNzUyrRKzXPO9724Fs4OrTm9XYi17xlxAV4N+rlHn2Z/7flmMMgUN01hrymLjwEtyAXbgabj+qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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

Hi
> -----Original Message-----
> From: Lis, Tomasz <tomasz.lis@intel.com>
> Sent: Saturday, June 14, 2025 12:45 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Winiarski, Michal <michal.winiarski@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr
> <piotr.piorkowski@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH v1] drm/xe/vf: Make multi-GT migration less error prone
>=20
> There is a remote chance that after migration,  some GTs will not
> send the MIGRATED interrupt, or due to current VF KMD state the
> interrupt will not lead to marking the GT for recovery.
>=20
> Requiring IRQs from all GTs before starting migration introduces
> the possibility that the process will get stalled due to one GuC.
>=20
> One could argue it is also waste of time to wait for all IRQs,
> but we should get them all IRQs as soon as VGPU starts, so that's
> not really an implactful argument.
>=20
> Still, not waiting for all GTs makes it easier to handle situations:
> * where one GuC IRQ missing
> * where state before probe is unclean - getting MIGRATED IRQ as soon
>   as interrupts are enabled
> * where multiple migrations happen close to each other
>=20
> To help with these cases, this patch alters the post-migration
> recovery so thar recovery task is started as soon as one GuC IRQ
Typo (thar)
> is handled, and other GTs are included in recovery later as the
> subrequent IRQs are services.
Typo (subrequent).
Do you mean "subsequent  IRQs are serviced" ?
>=20
> The post-migration recovery can now be called for any selection of
> GTs, and it will perform recovery on all GTs for which IRQs have
> arrived, even multiple times if necessary.
>=20
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 167 ++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 91 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c
> b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 6526fe450e55..aef1d256e871 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -147,127 +147,111 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  		xe_sriov_info(xe, "migration not supported by this module
> version\n");
>  }
>=20
> -/**
> - * vf_post_migration_requery_guc - Re-query GuC for current VF
> provisioning.
> - * @xe: the &xe_device struct instance
> - *
> - * After migration, we need to re-query all VF configuration to make sur=
e
> - * they match previous provisioning. Note that most of VF provisioning
> - * shall be the same, except GGTT range, since GGTT is not virtualized p=
er-VF.
> - *
> - * Returns: 0 if the operation completed successfully, or a negative err=
or
> - * code otherwise.
> +static bool gt_vf_post_migration_needed(struct xe_gt *gt)
> +{
> +	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags=
);
> +}
> +
> +/*
> + * Notify GuCs marked in flags about resource fixups apply finished.
>   */
> -static int vf_post_migration_requery_guc(struct xe_device *xe)
> +static int vf_post_migration_notify_resfix_done(struct xe_device *xe,
> unsigned long *gt_flags)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
> -	int err, ret =3D 0;
> +	int err =3D 0;
>=20
>  	for_each_gt(gt, xe, id) {
> -		err =3D xe_gt_sriov_vf_query_config(gt);
> -		ret =3D ret ?: err;
> +		if (!test_bit(id, gt_flags))
> +			continue;
> +		/* skip asking GuC for RESFIX exit if new recovery request
> arrived */
> +		if (gt_vf_post_migration_needed(gt))
> +			continue;
> +		err =3D xe_gt_sriov_vf_notify_resfix_done(gt);
> +		if (err)
> +			break;
> +		clear_bit(id, gt_flags);
>  	}
>=20
> -	return ret;
> +	if (*gt_flags && !err)
> +		drm_dbg(&xe->drm, "another recovery imminent, skipped
> some notifications\n");
> +	return err;
>  }
>=20
> -static void vf_post_migration_fixup_ctb(struct xe_device *xe)
> +static int vf_get_next_migrated_gt_id(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
>=20
> -	xe_assert(xe, IS_SRIOV_VF(xe));
> -
>  	for_each_gt(gt, xe, id) {
> -		s32 shift =3D xe_gt_sriov_vf_ggtt_shift(gt);
> -
> -		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
> +		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
> +			return id;
>  	}
> +	return -1;
>  }
>=20
> -/*
> - * vf_post_migration_imminent - Check if post-restore recovery is coming=
.
> - * @xe: the &xe_device struct instance
> +/**
> + * Perform post-migration fixups on a single GT.
>   *
> - * Return: True if migration recovery worker will soon be running. Any w=
orker
> currently
> - * executing does not affect the result.
> + * After migration, GuC needs to be re-queried for VF configuration to c=
heck
> + * if it matches previous provisioning. Most of VF provisioning shall be=
 the
> + * same, except GGTT range, since GGTT is not virtualized per-VF. If GGT=
T
> + * range has changed, we have to perform fixups - shift all GGTT referen=
ces
> + * used anywhere within the driver. After the fixups in this function su=
cceed,
> + * it is allowed to ask the GuC bound to this GT to continue normal oper=
ation.
> + *
> + * Returns: 0 if the operation completed successfully, or a negative err=
or
> + * code otherwise.
>   */
> -static bool vf_post_migration_imminent(struct xe_device *xe)
> +static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>  {
> -	return xe->sriov.vf.migration.gt_flags !=3D 0 ||
> -	work_pending(&xe->sriov.vf.migration.worker);
> -}
> -
> -static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
> -{
> -	bool need_fixups =3D false;
> -	struct xe_tile *tile;
> -	unsigned int id;
> -
> -	for_each_tile(tile, xe, id) {
> -		struct xe_gt *gt =3D tile->primary_gt;
> -		s64 shift;
> -
> -		shift =3D xe_gt_sriov_vf_ggtt_shift(gt);
> -		if (shift) {
> -			need_fixups =3D true;
> -			xe_tile_sriov_vf_fixup_ggtt_nodes(tile, shift);
> -		}
> -	}
> -	return need_fixups;
> -}
> +	s64 shift;
> +	int err;
>=20
> -/*
> - * Notify all GuCs about resource fixups apply finished.
> - */
> -static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> +	err =3D xe_gt_sriov_vf_query_config(gt);
> +	if (err)
> +		return err;
>=20
> -	for_each_gt(gt, xe, id) {
> -		if (vf_post_migration_imminent(xe))
> -			goto skip;
> -		xe_gt_sriov_vf_notify_resfix_done(gt);
> +	shift =3D xe_gt_sriov_vf_ggtt_shift(gt);
> +	if (shift) {
> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> +		/* FIXME: add the recovery steps */
> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>  	}
> -	return;
> -
> -skip:
> -	drm_dbg(&xe->drm, "another recovery imminent, skipping
> notifications\n");
> +	return 0;
>  }
>=20
>  static void vf_post_migration_recovery(struct xe_device *xe)
>  {
> -	bool need_fixups;
> -	int err;
> +	int id, err;
> +	unsigned long fixed_gts =3D 0;
>=20
Follow inverted xmas tree.
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
>  	xe_pm_runtime_get(xe);
> -	err =3D vf_post_migration_requery_guc(xe);
> -	if (vf_post_migration_imminent(xe))
> -		goto defer;
> -	if (unlikely(err))
> -		goto fail;
> +
>  	if (!vf_migration_supported(xe)) {
>  		xe_sriov_err(xe, "migration not supported by this module
> version\n");
>  		err =3D -ENOTRECOVERABLE;
>  		goto fail;
>  	}
>=20
> -	need_fixups =3D vf_post_migration_fixup_ggtt_nodes(xe);
> -	/* FIXME: add the recovery steps */
> -	if (need_fixups)
> -		vf_post_migration_fixup_ctb(xe);
> +	while (id =3D vf_get_next_migrated_gt_id(xe), id >=3D 0) {
> +		struct xe_gt *gt =3D xe_device_get_gt(xe, id);
> +
> +		err =3D gt_vf_post_migration_fixups(gt);
> +		if (err)
> +			goto fail;
> +
> +		set_bit(id, &fixed_gts);
> +	}
> +
> +	err =3D vf_post_migration_notify_resfix_done(xe, &fixed_gts);
> +	if (err)
> +		goto fail;
>=20
> -	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");
>  	return;
> -defer:
> -	xe_pm_runtime_put(xe);
> -	drm_dbg(&xe->drm, "migration recovery deferred\n");
> -	return;
>  fail:
>  	xe_pm_runtime_put(xe);
>  	drm_err(&xe->drm, "migration recovery failed (%pe)\n",
> ERR_PTR(err));
> @@ -282,18 +266,23 @@ static void migration_worker_func(struct
> work_struct *w)
>  	vf_post_migration_recovery(xe);
>  }
>=20
> -static bool vf_ready_to_recovery_on_all_gts(struct xe_device *xe)
> +/*
> + * Check if post-restore recovery is coming on any of GTs.
> + * @xe: the &xe_device struct instance
> + *
> + * Return: True if migration recovery worker will soon be running. Any w=
orker
> currently
> + * executing does not affect the result.
> + */
> +static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
>=20
>  	for_each_gt(gt, xe, id) {
> -		if (!test_bit(id, &xe->sriov.vf.migration.gt_flags)) {
> -			xe_gt_sriov_dbg_verbose(gt, "still not ready to
> recover\n");
> -			return false;
> -		}
> +		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
> +			return true;
>  	}
> -	return true;
> +	return false;
>  }
>=20
>  /**
> @@ -308,13 +297,9 @@ void xe_sriov_vf_start_migration_recovery(struct
> xe_device *xe)
>=20
>  	xe_assert(xe, IS_SRIOV_VF(xe));
>=20
> -	if (!vf_ready_to_recovery_on_all_gts(xe))
> +	if (!vf_ready_to_recovery_on_any_gts(xe))
>  		return;
>=20
> -	WRITE_ONCE(xe->sriov.vf.migration.gt_flags, 0);
> -	/* Ensure other threads see that no flags are set now. */
> -	smp_mb();
> -
>  	started =3D queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
>  	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
>  		 "scheduled" : "already in progress");
> --
With nits fixed,=20
Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> 2.25.1

