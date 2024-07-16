Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A58DC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA7710E8D0;
	Tue, 16 Jul 2024 21:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLlSbrvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4450710E8D0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721165167; x=1752701167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bBRxSgCDa3/HpYrQlVge0CQR17YDlz7m7LW7z4K5SLU=;
 b=bLlSbrvA9Al6asYRw7Bso/8tB/XzJO2oJYiRi1m7QwPiNDpIkrSTesCv
 gLqFCkfj4SoTSg35ZfLi+BU4mZaELC+AwJNlFTRJxB55/sGKoOsDBAbSq
 OgkKKVUCvI94RGkoUUBl3soXpGIRqoBIfMef5fLiu3SSWkyL4BGjcTa9S
 ToJo2B3uV3xtNYhrMBFoMEcV9ibiazWeJXUsKLXafv7VAI3gzWHx/nwIv
 +UpT22UteTCpFym+bzk6HqLTfno6t62ovlkvLfKUJ0Bvgy8N5U3QGDW4O
 uxSBM0Ttq1IosSWXvkqgaBYS0FjRDPSwesFV3OuldJczfXezpJlCM0DBd w==;
X-CSE-ConnectionGUID: Y1d6mv6DRbOZ7gRsUoiH/w==
X-CSE-MsgGUID: U4HlNRC4Q+m8V6jQoFKLRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22448709"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="22448709"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:26:07 -0700
X-CSE-ConnectionGUID: OPsm7+MlTeWurAeXFaTmfQ==
X-CSE-MsgGUID: aVIoTb/sSRONAgWti1FxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50092946"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 14:26:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:26:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 14:26:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 14:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dj8iRuJ8t/rcMjrPQSM/P6MYcRhfUuigMszmvELS7jdd6t7tifUp29xVn8qR03E7CmWBeW1ob/gspby+5Xu7CCWL3Z4NIjktpOIP9PZkBJip3+kJ+7bWu5AC5BvRVSCnn08EJja/C7ZZKm4lZBOwxZayLpgi0RpRMKueeCYzsyNNmbUt/nFarAHUm/9R72Y679WP4lClSlMLeR1ZzhsdMiBzRD6Xrl9qlauTyoUkkmbLkEn9Gq7mbmrtS2KyScqydlCIVQavg6KSs/aWO08A6ENIW3EsXk0v/O7I90dPlffV44Vvzdu7wqFdiL1P0/3u9gBNfernKuGkUsznPVaL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMlVed/a9t7xI4tCucleD6NmYFRVqlt0Fwls2EYKLRQ=;
 b=ygJUp8CNRglcFpIDJLG9u9Ea99xqTq5ZabsklIdOTxMHiZwlVIvVnV0jEDa5PLfwUNJL4v/eyqpCnS233ScicrH/r+Ow3oHbnLy2NtJQyQEGzJ3nQDrlgEo9kpBtuGjRZ8s+m2j2pUP6sp3Ho0XPGnQjd/VsDsDVTgacZhfGbS70rAfcXkuCoVBwZgcCfv0AcAItGqh6XapKXkX5cUU8N+y8ZvMQwfopv2gLlT94yNBL6VBCrD5Drxzlu5f+Kq3662ETe49ob3V54Xm3Rn2mnCrypExVsntaOdpotFzR9jWKN2zERwXUPUtdk/b2jH5SwUKzEcZfLB4i5x9QY9luxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 21:26:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7784.016; Tue, 16 Jul 2024
 21:26:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 2/2] drm/xe: Don't suspend device upon wedge
Thread-Topic: [PATCH v3 2/2] drm/xe: Don't suspend device upon wedge
Thread-Index: AQHa10rIBIAxMji7m0S5BOiTsLtEVbH53hpA
Date: Tue, 16 Jul 2024 21:26:03 +0000
Message-ID: <CH0PR11MB5444BDE1386F1A76F9DEB7B0E5A22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240716063902.1390130-1-matthew.brost@intel.com>
 <20240716063902.1390130-2-matthew.brost@intel.com>
In-Reply-To: <20240716063902.1390130-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN0PR11MB6304:EE_
x-ms-office365-filtering-correlation-id: 0ba4cc2f-f13a-45f5-4bbd-08dca5dde530
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xbANjDu36TT8xccC+bTGb0Avv8+/UI7Xy+HXeu8pXPC2WywvYCbo1Y0WpJbh?=
 =?us-ascii?Q?zc5y92DAUBKzGtY/7e7LocQ4QcpLsHDdPdFDGesirY+tcarpvwBC0JMKSyAX?=
 =?us-ascii?Q?4ggMdgS2TFQZLAXlE/yr6VCoYQeFElB6tXh4TBQfWM7PkBhX5IJ1Nsxf2oT2?=
 =?us-ascii?Q?NKe/GJB8nU1knQdYir9uTtpDAS3jdlPpNk5L+jy6CgPfrEnejjraFuYXJcFS?=
 =?us-ascii?Q?bzJ4PpNbKDwFEI4VkUzImo1LnviUeHGjrD0uB+FxEqh4Rh8yG4TZKjExVB6j?=
 =?us-ascii?Q?3W1H29WqxlYpBdkv6XxYmc7B0F0Qi4ZHTVtuNpscmGkZlNB/Zq1ljmgMRp1c?=
 =?us-ascii?Q?RhuiDoAHh9bn0vXAYMIM5XFplLRbLCwHXpfOKy0LtLMhSW9qqrckSozd5dPy?=
 =?us-ascii?Q?3KpGRX1+ZbY1jdy5INIk1FN3V2UU2x+Uf22+zi8CNKlKwFRQBr3c+l45H6CP?=
 =?us-ascii?Q?8wfZUr8thWCUcANKKZeFkAyXgUY9Xj+7h1U/ytT/xKOTU30xEZqdCEpGNvbT?=
 =?us-ascii?Q?yCAg4ddB9jtk8YNC0g/nJe6UyGRIrtPJjDmW3Pc4Ahxo8vjpAsFXSn+2WtJR?=
 =?us-ascii?Q?Cqcz3zftLkRl/yYWwmc3QIBZ88jkqLFpvVaTCWBjlxPz5SLshlW5lX/J6nqY?=
 =?us-ascii?Q?6kopOip9Xdbn7cSHb6405S9DbpBPOBe0Y2aKBzqxopifBLPV40oWACTyoj3p?=
 =?us-ascii?Q?KdJ23wL2vycCtFfTOj3MulXi9PQJiUNih6H96eEq8Q0ZPOCodmMw85IANewk?=
 =?us-ascii?Q?sCOpQVGEva+aIHuvaWycIlpdE0GxjrKvxF6tB5Ppjhla7s1ciED6+H5SOwZ0?=
 =?us-ascii?Q?j8QMMPh+hLrHSzyCkVhTCKaBfit37vGWrDZ6TqZawol3oeaYsDCs7bJiGih1?=
 =?us-ascii?Q?MfQiA469iqC6SBZF4YKw0kyz2xIhxuuez7X1nUnkSC69L2Y/kkXyalEV2h9R?=
 =?us-ascii?Q?P/pUrpaOfwLQ8l0Ngz/lb8HzK67qRm8DPWNYkKzGcxqGBSETo3UlzJcgpI5S?=
 =?us-ascii?Q?PSHBo42PpETG37OvKzHIZ8xawy8/N6YEWOiAgdbbYhNNuvedfnTmXyd1tL03?=
 =?us-ascii?Q?LPIsGK3Zxcp9nKSOazIA0zNvpC8NSHcWtl35iR2TOsjrmSF/xHY2ZM7C9cSK?=
 =?us-ascii?Q?Vy4zPbtkbA67DL+ieOXdAwaSyFxCZMN86ji1DwTL5wsUOTCnFOVdJWT6u2N/?=
 =?us-ascii?Q?WAPtqCJiNC3W6kAM0TBOV0SYdw561meOPJGdG/U0bHOV9uzEgGXpbYEr7rB5?=
 =?us-ascii?Q?vs3NRyiSJopVsabSj0SOHWmS9XtZSniwXHsCoGtbwg7J8WByYfzSVyTs26yg?=
 =?us-ascii?Q?PX9ip9dPoLEm1N08UbVnTrohOlH1S6YClQcK/CLVkiDkGHVkMzwHUZEcw/N9?=
 =?us-ascii?Q?5ndFSizrcuV4Wvro4WP/gfLvAnWZ6u31S2yaFD0nZK9Ujts8rw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gSqa9dPXkCqxkqoeTk8U2r02ir/KtiRdJENSPYRmC5gcES+XC77l9pSHb7bz?=
 =?us-ascii?Q?EsosjSEGar9CLMJlZ1Inun9J4wam9/w5MIuuawvNoKZWPvWofjy4b/qLAbyU?=
 =?us-ascii?Q?xj+Y5iK1zJKKu8xpoey998JV1z0aTSL7tUVJbQ/r+GY6flh51dO8mfZ0Yb50?=
 =?us-ascii?Q?2K33MdtXVl2Wug/mE+MdfnqFI+COnNsnN50NO4AUK7jRlDa5Q8zvKA7MNEiI?=
 =?us-ascii?Q?8H57+gUPhmZAMr8DKlDFsTG4ufDF7b3nH/t0GFrKCw9HAu220W8my2iKceQR?=
 =?us-ascii?Q?ukPUh/qAfvF2RETjORXuNRw9wwojUJzr2nhRk8WqydYSBfr01oQPYiwHnH6K?=
 =?us-ascii?Q?17FlosMsiMWkvTlwQ98b7iZKg0Lgp4lo7iHEX9PfdgvT8MNlMF3EGzsJA+vp?=
 =?us-ascii?Q?HdIm8XRTb01XKY5GVcsTfk1Y3OpGnDcXwbzz6rJpxT2QhukX54zVf4e9ckyr?=
 =?us-ascii?Q?g9F1Ul87fnrgH+eIxMAWPlJm+xfXE1jRdGU6SOwOWb3UUZacxDVg8g0PHF2p?=
 =?us-ascii?Q?KjeI4ri1PUZhG5XwJIOjgnRaTgts16Ruxe4wsMFxEDddbROUU1HfSZmkmi7R?=
 =?us-ascii?Q?SHqxDwlOWj8biqsl+dGU3IMPQC1R6AFlWTo6Z3UhLP8+SGUzafGxe/GQnwrr?=
 =?us-ascii?Q?oz0eqdw8zh37lq72RO8vat+nUiz7SdJQq/FAbf3B0vip1E2M6iRr9wkI6Y0m?=
 =?us-ascii?Q?AojwK7jKTf0f2YPMVRmMeka1lOys9jJYGYgf2o4jZufC4d/t2JmBoHdOAcGi?=
 =?us-ascii?Q?HCKMxLCJP3qgyvtQ5ohOvhSjQ3GOr2LVXx+pNzbBkZk2/NvYukZVJNZ6YVyK?=
 =?us-ascii?Q?fOqnnG43fz7ErCmdxqBxZGMAqRJbXImTOpIlskzGUs9kJLl408XLTnG0tVpp?=
 =?us-ascii?Q?BQeZIaZ1i1WNSjJ0E4cEV+ecB715yLajaSCYbiKKPFwvbAqKFjb6zQTfc5jC?=
 =?us-ascii?Q?rVPeDwQWjZaOJSciuTywB6dkCwQjmwr3KV6ZrTRQhip87RhdVZWKYJc+M6yJ?=
 =?us-ascii?Q?vPA6bUatiURirrEqKRqUykHyvZ1J6C50/6EM8QRq9Kw1jqX4trcoCyLT4Eg+?=
 =?us-ascii?Q?A7L00O3tHKcSGmTuCfDq1QhOZq4VXtzK2OaqsP51PWQJQqq9baVWVY64t4PL?=
 =?us-ascii?Q?AEq43s8sdNyzYlZjwM3K5UE3ChuaGrL9zPpzmK641rGmgNKjPBQuoUAS+Twu?=
 =?us-ascii?Q?WqqZY24sjJXq4GN7vOYcC0TR5iXaMmDJp7TsSVZKUSJbXKC6tozFFt8nG4Nz?=
 =?us-ascii?Q?21o5z4NfBT4FgcabCnCBzPJ5L6VNfLwROi7LdzeRY/QHxgFl8NMBP4UCdncx?=
 =?us-ascii?Q?HFNcCAnsTNnUu/XS7klBfP18maMI4YfiaNcJB0Hkm/KAnubrHitvsuTIuft5?=
 =?us-ascii?Q?6xBkYPuuuPt+m9H8fwqSD51R21LgFABYX1eDReoLb4HTAAQ2tw0xRJQ0Cpmn?=
 =?us-ascii?Q?xl0UUiwFJtWQgNjVkHWzij2kwBnAHb97YLr3tbWEnIr4OHblsms7DBsih/7G?=
 =?us-ascii?Q?mY4nBhZFy/9TsbZjQfuHFxaF1RlJiEn88NTj1r+U5bRlfOdmQmkZ6DRS/qOX?=
 =?us-ascii?Q?8Z9Dy38+aLoy80j1b53P1eqAGjGNLIY9vYSfIDQx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba4cc2f-f13a-45f5-4bbd-08dca5dde530
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 21:26:03.1067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXYYmZzuSU1WKjJ46+lCnsfnI0XQgjsZtyBxF6HG4taQbVJjb5s1KeIL5/k9y6CqNtwKChvKmPolYDOzmpUXoHBuIInxDImAwBzE1Za7WPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6304
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Monday, July 15, 2024 11:39 PM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH v3 2/2] drm/xe: Don't suspend device upon wedge
>=20
> When wedging a device we shouldn't be suspending device as state for
> debug will be lost.
>=20
> Also this appears to not work as the below stack trace pops upon trying
> to resume a wedged device:
>=20
> [  304.245044] INFO: task cat:12115 blocked for more than 151 seconds.
> [  304.251333]       Tainted: G        W          6.10.0-rc7-xe+ #3518
> [  304.257617] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [  304.265459] task:cat             state:D stack:13384 pid:12115 tgid:12=
115 ppid:3986   flags:0x00000006
> [  304.265465] Call Trace:
> [  304.265467]  <TASK>
> [  304.265469]  __schedule+0x3c4/0xdf0
> [  304.265478]  schedule+0x3c/0x140
> [  304.265481]  rpm_resume+0x1cc/0x740
> [  304.265484]  ? __pfx_autoremove_wake_function+0x10/0x10
> [  304.265489]  __pm_runtime_resume+0x49/0x80
> [  304.265494]  guc_info+0x6b/0xb0 [xe]
> [  304.265538]  ? __pfx___drm_printfn_seq_file+0x10/0x10
> [  304.265541]  ? __pfx___drm_puts_seq_file+0x10/0x10
> [  304.265545]  seq_read_iter+0x111/0x4c0
> [  304.265551]  seq_read+0xfc/0x140
> [  304.265556]  full_proxy_read+0x58/0x80
> [  304.265560]  vfs_read+0xa7/0x360
> [  304.265563]  ? find_held_lock+0x2b/0x80
> [  304.265568]  ksys_read+0x64/0xe0
> [  304.265571]  do_syscall_64+0x68/0x140
> [  304.265575]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  304.265578] RIP: 0033:0x7f4254d14992
> [  304.265580] RSP: 002b:00007ffc558666f8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000000
> [  304.265583] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f425=
4d14992
> [  304.265584] RDX: 0000000000020000 RSI: 00007f4254ebb000 RDI: 000000000=
0000003
> [  304.265586] RBP: 00007f4254ebb000 R08: 00007f4254eba010 R09: 00007f425=
4eba010
> [  304.265587] R10: 0000000000000022 R11: 0000000000000246 R12: 000000000=
0022000
> [  304.265588] R13: 0000000000000003 R14: 0000000000020000 R15: 000000000=
0020000
> [  304.265593]  </TASK>
> [  304.265594]
>                Showing all locks held in the system:
> [  304.265598] 1 lock held by khungtaskd/57:
> [  304.265599]  #0: ffffffff8273b860 (rcu_read_lock){....}-{1:2}, at: deb=
ug_show_all_locks+0x36/0x1c0
> [  304.265607] 3 locks held by kworker/6:1/90:
> [  304.265610] 1 lock held by in:imklog/547:
> [  304.265611]  #0: ffff88810498cd88 (&f->f_pos_lock){+.+.}-{3:3}, at: __=
fdget_pos+0x76/0xc0
> [  304.265620] 1 lock held by dmesg/1310:
>=20
> Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon =
any GPU hang")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1e3d3a7e74d5..07aedbaf1821 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -893,6 +893,13 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *=
xe, u64 address)
>  	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>  }
> =20
> +static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe =3D arg;
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
>  /**
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
> @@ -911,12 +918,21 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	u8 id;
> +	int err;
> =20
>  	if (xe->wedged.mode =3D=3D 0) {
>  		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
>  		return;
>  	}
> =20
> +	err =3D drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	if (err) {

If we aren't reporting the error value, we can probably just
check against the function itself to reduce the size of the change:

	if (drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe)) {

Either that, or we should report the error value as a part
of the drm_err report.

The current implementation is still good, however, and this
is just a suggestion.  I won't block on this.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +		drm_err(&xe->drm, "Failed to register xe_device_wedged_fini clean-up. =
Although device is wedged.\n");
> +		return;
> +	}
> +
> +	xe_pm_runtime_get_noresume(xe);
> +
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini =3D true;
>  		drm_err(&xe->drm,
> --=20
> 2.34.1
>=20
>=20
