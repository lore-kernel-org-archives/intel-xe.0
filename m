Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BD9D72379
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 11:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEEA10EAC7;
	Fri, 23 Jan 2026 11:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z23mFmZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2A910EACA
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 11:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769168677; x=1800704677;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=3RwwhiKb8deRspTPwnvZ5M9SPyfsjGLsjfUCUSPOzpU=;
 b=Z23mFmZmtXg2FfPAnNQEhIGlDGTdbUy+CCk43CG2uLSbFMvpPthfklQv
 wQhU35bvM5JWlC8glMKa5bT3tdZzHT7qUfcczaK0szzXC1g0Zcni7c5PR
 5SmZ1ZvqqAjuDRMZOl6Qhvr0MT77f/vJVhnRwpV9qh/Ijq5j0Ex5HhTis
 fqRpyuh98F5OU/mkKjlf5hR+N7ZQsp9JwINpzYmNYN/xC5NBpCTv0+A8b
 UAg8MgjvmYv7JAY4MFYUxX0MLlg8UXS6r9kFDGC/IEy0fnI613d+lurDG
 VzK0U9yeAKGGcLbJXBCS41tLNIFQtCo11NAeRI01usCnBTF9OQo73maQ+ g==;
X-CSE-ConnectionGUID: dIpzXSz7RWWOdlBcBHwRRw==
X-CSE-MsgGUID: bnEReNUsQ8a/rN1C1hhrUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="93089652"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="93089652"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:44:37 -0800
X-CSE-ConnectionGUID: Tu6TQOhfQXCn9ssybr3J8A==
X-CSE-MsgGUID: XhwvOH84RlG4XV2v+ajcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211878307"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 03:44:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 03:44:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 03:44:36 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 03:44:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8KP0rixg/brkjbMaGMLqD8SnCB5dbYTuY5VbX+oh7XHmFFRe73HDzlbjVMO8MzXtL9KPYouHncT5E22MqdZgCh4OFYv5lWvEAgTW3/pfrxGmPi/9O9ny0ML/f+VjkPUl/dbePhXR7jPKCFBfmkZY81hOg/3OzP/CscapiaCFXMeCpkp3YUVGrvfT/mGmn9bxSguu+fcMGG0BKrFx8PmN+6L71UcsJfhSBZss/BSblrxFUxvxddCp7y3MRWmCyzVo4s9y5hW1BcIgt1jWGJuPaQUNMXPy1sONam19IlYwU3NZ1ZvlN7jmKmmPlAxKCI6U7SEk62pbJACPwFMoaGmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RwwhiKb8deRspTPwnvZ5M9SPyfsjGLsjfUCUSPOzpU=;
 b=WHS43tuaE0/wrg9kdBWpQLaw+rwzeElxOrcZfaH4vXABHKcPr5kxLnjEm4bsNYg5pxDqxlyn1cQ2wHv+CpCbOp8sVIep7lDj/beHUjgf8qlnIebymTJvgrSxpQEt2BSa1oIcX22E1mHddkBFj72WNUqOO9IgLvYifrUAPLAklrHdu6b0w2Fqd6O7OvspWSKyfozjPKG80eJ8TXl/e3xJTu1f0tlKpQ8G5dy9Uk/vAKazUlbDSrIw/NBPLjhsSDY+pK6TiNFl8s792+tKlw1YC+EYLKvy2QT9YH/IJJe3TvQzdRjVoLhbow2hg0kUDzea79UHSr+0JBshL01bCX3Bnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ2PR11MB8297.namprd11.prod.outlook.com (2603:10b6:a03:539::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 11:44:33 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 11:44:32 +0000
From: "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Vijay, Anoop
 C" <anoop.c.vijay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "Luse, Paul E" <paul.e.luse@intel.com>, "V, Mohamed Mansoor"
 <mohamed.mansoor.v@intel.com>, "Nasim, Kam" <kam.nasim@intel.com>
Subject: Recall: [PATCH v4 3/6] drm/xe/sysctrl: Add System Controller mailbox
 implementation
Thread-Topic: [PATCH v4 3/6] drm/xe/sysctrl: Add System Controller mailbox
 implementation
Thread-Index: AQHcjF2kNhK3iC7ytUSuI8LlIJZ/Ig==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 23 Jan 2026 11:44:32 +0000
Message-ID: <MN0PR11MB62079B87E165CF8D4CC9AD2EEA94A@MN0PR11MB6207.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-traffictypediagnostic: MN0PR11MB6207:EE_|SJ2PR11MB8297:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d086960-37ff-4ad9-52bb-08de5a74c69f
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?kYNb23H2RTEmFCaIRVpGBratVV4qHb/n18ECMssuxVBtxuwu92K96bPLdshM?=
 =?us-ascii?Q?XcRLNb2z/z7IfTbv3rt/h6yFCJVumrmdaEwI+uS9hmN15+pEWY1IUZtMRYwg?=
 =?us-ascii?Q?RfTy2iWMwWhtAai8uRKEUYXhoEKnSjmcDHy5FBNprlCVBx74EQ4W1c7MG9e9?=
 =?us-ascii?Q?pmsKi57RAet0XBhsRCSOGC0Jb6qAr4kdihJxLZwR4qo4Fib8XwQgZeN9Nl43?=
 =?us-ascii?Q?mBL4qENfF3bCRilOw+MoOBlpeK8wv76bHLr2Njz29UcXr+SXNX/rl7TUhqDX?=
 =?us-ascii?Q?+2CX47r+5QEKuOWMg7YNxDk3dOQAHEWK29GvyI1oWLdUFfluTDuxAOb6aT72?=
 =?us-ascii?Q?1LMaGcEpFX9zC7hrE9iGF0iFI1UflkxzNSbkUbFhcWQxnz0K/Lyfr7jDCBwp?=
 =?us-ascii?Q?06vFAgZ4vIq8uqyq4QpixzFYbkoga8fE+zORAQVzeCcrjIerHJ5Lf7k7xFI9?=
 =?us-ascii?Q?lLA9aAx8dM1CSNaX6/zjX79fSKyXUzYaIAgehUXfJ8GgXoKyMvnnTTwM5YGi?=
 =?us-ascii?Q?5wNgda6+Gz8Epu1i6OqDQOwSa+4ahnaT0aotL6v2zySVTqvWgWn9G3mFPsWJ?=
 =?us-ascii?Q?aRRUDCxQ79nXW4pbz3vyc93Sm2L33bWxXyw/74GSNRwpZOYfT6aJsf0jsSjI?=
 =?us-ascii?Q?2afc+2yuZZfWZ/MQ07AIrwZ8mJKaaKJrD9ncQ4/MVjPwuo9jgqZuZ9v6+3Y9?=
 =?us-ascii?Q?BYHjTrvHFPg9p8ONRkUPifVWjKj7q/bEf+/UD+Mo9e+8uSw3kuNJLOC7bxR2?=
 =?us-ascii?Q?OsrbaOvUOtX/N5oEuDEZ8OunH8w4l4e9Pyn7tOqT1LgaL0+hhuSmgpj4Af/X?=
 =?us-ascii?Q?ob1k4sFXWTZauXDjGFJhpjz2xiSfvFoPyfcRBhqo3SQ6d944SJcZ0+iR/J2m?=
 =?us-ascii?Q?0hk/vsy6MP/REw/cSawJ3dcy6D77CC3ibXZEAocX95QrHH8CixE1apaoDnm8?=
 =?us-ascii?Q?ZHViP05UGSOdS/apf3SK4mK/cug1r7xOwJX+tW3J/ZGQj27u2hurAViuWuOZ?=
 =?us-ascii?Q?QuyXfMGYTkO10C/IPWuNGOksSwvfrx5LM6up1KjzhMVAGHPg2WlEaj0AFoqX?=
 =?us-ascii?Q?zl1YUcHGt58f9fROrizMUSF6g9rpkhxuUN71hTYhc3eBxANp3d5Q8PmCqG63?=
 =?us-ascii?Q?aUHP/8DgkqDu0pyBbDe7RqXCg5ie3VBzkK/aINEiUNGGdLvCOVMo0P/mNgCm?=
 =?us-ascii?Q?+tszrSLIZNENRujdrWO9PGzJDpLDT7WqhmZBFL5PulCYKtpj067cBvf5hXlv?=
 =?us-ascii?Q?adHCqz/dCUaGl9WmyBG8R92tr/kfVQSvG14B9Tvqbz04S+BL+bi/+JPZnoaE?=
 =?us-ascii?Q?CU4dsxI+KZpjDAmjRUr1kI345lsPb2eW9srwyTu9t/lSqIEHAMOn9s2lkZrI?=
 =?us-ascii?Q?pwmw+NLmj/faMjXRgmewduHjIjupZVSf5f3Zw1j86m4IjfamKilB+XLGcltw?=
 =?us-ascii?Q?xtITbw1lLeIVssJl9lEoiieXeSMeWLBC8DytgJTMK1TVXKUw04GEj79Ev14S?=
 =?us-ascii?Q?WiJRVgpDrGy818t0pIr1ENLRrnzlpt8B+C1hcc2F1Fb9crLMb8MkENftNKXb?=
 =?us-ascii?Q?aHvfOvr9EfC1hZqGJYUj/tNfKaqtl3LTY3PoQH069Vt3OASl1vTklLmLmTqk?=
 =?us-ascii?Q?IRv0Rb8eoT6+Wz6ZLULeDqM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I3PWDAMUNmvgaHa3vHhfb7yQ8FuSiookDY2xUwHRM+klHnpHPmPhBITpxoVq?=
 =?us-ascii?Q?TBMdIp2VmWM2xLFNseSLDvErvlziCF7pc4JoPeU/rKPA4UNdnlIzBy5MbDuy?=
 =?us-ascii?Q?kdUqSDGUJBNO9gowE/1YKL4YPhZ7s3oNY+iRiwkB6PqeEyot0k/qnxkgN2zc?=
 =?us-ascii?Q?OFdIZEFdp+nf4p79ivYmWVgGVts960sBEIQ8oriVDjY1fozBUoq6T1OI7TQb?=
 =?us-ascii?Q?ZV7Jtn3sFELCpJeIzvl9yCEqz8oGhp8AH1OJv6X1ks6y6nq1/MIarG1rl7Ws?=
 =?us-ascii?Q?tqJwlm3srZ7VvOEokKmEsLipNZuEXJ6kUWSQnWSE6VXgrT5xc/kGyeOkOZhg?=
 =?us-ascii?Q?6Ti0RWhk0Wk0PU07TOpEm8jp6FKDiWkLIYRDFnLSTLxfGdCFYjeSd8QdvZKl?=
 =?us-ascii?Q?4FNVX/mrTSQfRZJvm1DCp9XQyfL8T/h7IHj9vsNOGRHsRoV1WB8fMa+e9Dsc?=
 =?us-ascii?Q?Ky7oLmZdIfdBIXios55udiCFvF5wEKg/fHGGvgU7x6eh15L9EthhjNuKouFG?=
 =?us-ascii?Q?+SPb2V4QxjGrIGZRn+QTO4SsX8oYpMptrEPfvQdQf8vyyepRMwxlDB2upEpm?=
 =?us-ascii?Q?11jKIRSLUCCRtEr94xKDO5rJlFJCFwyn1pSSGx1C/7zVZqENh74PAQbwn+OV?=
 =?us-ascii?Q?B+75P2qv58sfEkaqGAYEHndW/6BLkGZgSjJVgXSYbdvbO+/2xGJAwTF5XnZD?=
 =?us-ascii?Q?c+9FPO3YsycCQ39RxPMfsJ3EcQdPn7s49Ru7u3JnyLOjrJdUIAivrYFbHSw2?=
 =?us-ascii?Q?g3lKQEKAToe9g+1Ne9COZUCMCEyV5iMw2wbnehRhDzGT3mJYIbW4YNQZCWN+?=
 =?us-ascii?Q?m6FMo0JFRpoDXbKSmd1a2do2YS/CJmtdAz7MbvXEpo2EGSoMgZdBg774Hz8h?=
 =?us-ascii?Q?gU83fbpigNpd114r0c0HrKc3C3Wvw/DQ5WD/x6HeNjr5O8+O37M8w+UAw+Dp?=
 =?us-ascii?Q?yae9XvUox9t0afDnx3Gc7QYATAGLliHX0Lq+GGgE1WCzgWt0k2n1V1tP1tWe?=
 =?us-ascii?Q?EQAoMdUsdK6gZfLvrAT3ot95MTr0WDSCs64spnxEjHduV1nUvL51Oz7hNM/z?=
 =?us-ascii?Q?xybEcSatZB7ZubaanpVkrSIdZBN/82likcYe5Mm7WbHDpkcfy6QYDgEhSPVY?=
 =?us-ascii?Q?DtCcK2SBr7fofNYwyI8mszispOCDonIH5+X3nUNHKg/bX4mxk3Hzg5/kxifV?=
 =?us-ascii?Q?1awLi/bQsXBB2vMHsj5TOUdUqq6mRJLufnnptiFiKd6H/cpKwWR4Of7prWtR?=
 =?us-ascii?Q?5nI2CgZGIM/jbWh1mYLwlhxMjPgZrWDCgS8CMW3TJKNkkPHlhw/aaTrN/wDl?=
 =?us-ascii?Q?bJqo1JNBYMfLLF8Cow64RpoW8TRxIZs+oDN2hfiQHoXdCa91713hnR+vbCC3?=
 =?us-ascii?Q?Ynm1a6OSoFLUCMOXA8pPKNCfmdpGfCcC7dJ0ThnAgkEvgmhaQNJwwekb2NKm?=
 =?us-ascii?Q?st/AknrgYkoWHJKVCnbaFyDe6a/sroWuwmbqcK0mlKs9NypHLjKrNq8zh7Sz?=
 =?us-ascii?Q?I4k01mq+z7EBglSK/wYyRFFNRQZeJCX+qAgjdn/CwT58FAeVltc1lK+6Mtfp?=
 =?us-ascii?Q?3hjkwtsYKOeJfhQfnjpkx68eJV7/eLDgdBKzUwMLs16lPcM2alTFIcyUfpM9?=
 =?us-ascii?Q?ZIhRJHASKsmcF5yhLYY9KGR6k/h/NVfY9uj+mADlKwB4BnfZ1GJEYHoWijOF?=
 =?us-ascii?Q?pKDfPbh9MYJp3DeICcwYyzb/nZc/+/e5nDPpDWhScXeZ9wLav9JD32PGDg8v?=
 =?us-ascii?Q?qlg1uNH3AQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d086960-37ff-4ad9-52bb-08de5a74c69f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 11:44:32.8072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +NE/RAjBHIsdtIhbdTEU8uoTrhZgpZjYA1fWXFKzAt0AxffGIiQ3qXqLF8nr03EVreqGuAeQzFg232tT5aOlfTZSy4sKRj/BZv4lmOY2FiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8297
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

Koujalagi, Mallesh would like to recall the message, "[PATCH v4 3/6] drm/xe=
/sysctrl: Add System Controller mailbox implementation".=
