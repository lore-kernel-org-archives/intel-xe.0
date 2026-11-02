Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15EA606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nxvqseb1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72610EC5D;
	Mon,  2 Nov 2026 09:09:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A66D10EC5D;
 Mon,  2 Nov 2026 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793610576; x=1825146576;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=y/STqpJ7Fdiix1eEgLpfFHFKdZPaM036Z4jIMqDR8XI=;
 b=Nxvqseb1Vhkt6kZ+GaeIIyx71TIhrx82cdU15ntYwqR4gpdMeOjUY/KU
 5M5+ss4z0CzCUKMeBEkKfuCicnl/i/jXhcUxu5ywrJZsZPzlLsvRza0CC
 VBD4iLXA/xvjciDUoNjOzRU+6hPDAEC9+R8lbTQSeXKzGqiKt6b12Lj09
 g0bWTrgcBN23YYJWZmt2f5q4nu7uLvMGayMrCcNWBtBdjmEsylbZxLkNl
 jMHisAA9vJXzhjUDim+RVS3jnxxTi3qS1CDDcL33iTpVF5xIb5JsoMgqc
 f/aSO/kGy8Cvw97C0/WeJDwYs6qCAV3aAYTFViZ/+tiqohFlNJuBL8l4k A==;
X-CSE-ConnectionGUID: PgvGroJyTGmVnshIGGW7tw==
X-CSE-MsgGUID: haKjH48SRSCOZ21etumB/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2309413"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2309413"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:09:35 -0800
X-CSE-ConnectionGUID: N31q4RvlSAi2Olx5tKMobg==
X-CSE-MsgGUID: jaTk24FmSneMz+wTocD//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6420154"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:09:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:09:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 01:09:33 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:09:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNo5AJhCp5KJycMRXL45ArO4Nc/ww34CYd7Y/C531pa93Hb3YXvc/W8Ddm59tWiHVGqsHF9Nq+rGgj7cQr+xpLQN6XjFmFhJEKRbKHqk3OeJoCW6J/1x9w7sRqYgLlQ6Q+fpZbE3bgSPgrlAIUIAV9KWJ1HNUOW3g5HkEJKptE5yuu4Jy4abBbyYmIPViJYaKiWvaIC28uk1C6okKMqM2vMJRyNFFYrl1KiIzy6FswjORfkUX5MrWP6NyeV9q1tauI+8kbtuIJfhhASqEFMPMbSiOwfveK60+sgm3mxeZF29HHutXgRnqg2LBgKV1tOOjMK5t9vGOGGh5qp7K6jyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/STqpJ7Fdiix1eEgLpfFHFKdZPaM036Z4jIMqDR8XI=;
 b=ifDnGyWHJdzqWcuDtJTU0rsByjvTPdGhkYia7kgF59sQE0Twshllg3mnyU0fIKY5bDaDXq+kCrE66T7Ec0tvGNkItpw6Gds+8lg+WpXbrEURT3hgJLHptoQ6nh0V+Iu9xlNESj5ktB7EHSWL3ufFS7hphPABRZLMhO+J7lOpeUnFcwr2CJWmhFdcpavmD4SPLR5TNP2hNAO1XqwVEtAoFmQhXO+NhrgmmyrW4pjfFwR3izBWplmhnAAG6PIt2NtO11fDlKB6dalAQY3yajZqd1wUKD1ZdOcef0GhaRJ9GzV7PTOgu5TT+I9cGbuXLW33crzdxfxEvoB3+qQV+i5jVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by PH8PR11MB6610.namprd11.prod.outlook.com
 (2603:10b6:510:1cd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 09:09:31 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 09:09:31 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Run the selective fetch update after
 the crtc checks
Thread-Topic: [PATCH] drm/i915/display: Run the selective fetch update after
 the crtc checks
Thread-Index: AQHdaqEs3K//g3i8xESauHG4Sd8tPrcacCIAgAAN65A=
Date: Mon, 2 Nov 2026 09:09:30 +0000
Message-ID: <DS4PPF69154114FA796BC545195E735D7B3EF6A2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261102080705.2027571-1-mika.kahola@intel.com>
 <sashiko-outbox-193094@kernel.org>
In-Reply-To: <sashiko-outbox-193094@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|PH8PR11MB6610:EE_
x-ms-office365-filtering-correlation-id: dd32781a-1d16-4196-bef7-08df38c1012e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: ynzM+WMb3xPAD+1KDOio/xTrWg+r2vs4f4AZA2leUi/uy0RquCO7fBTX7GoKEJLrGlcKN+DB7ZMA2ztIRBie/x8KdOoCOLvFDhxhn+QfHEoNUIPveN/bxGuc6PEZ9vSfSYg4Hy9BH2kp7uRUzz4/Y+JD5uLDfkYMzltTEPgNER/AfdDAgvsumojzSfZxA4fIPuW7MMAMZJr5iM7zo03tr9w/J9ZkKCK8ksEf0m1881SMGfWNqvn4UsOKmx09YRpumMuvHnabNLq5uA6GEWAm8FyyhPvsqcYA5iqY7gPZTVU5Bj77+kReOHB13thuB6/fTRKeNJI2zMB6mvP4uoohyknNQug9KvwVLZBVsfCrapR2QzHDT7VIO0IFBHGkHukX87lpGCWFV8Jjl8BwIho/+NC48N+C4Z6qAZhH0olTL1n9NMFMFH4Hrtr//MEWndl10zbL/SsyfD0jLhQ4RC0Vr1TE9g1NmmfAuwcJlihMft7SD9a/vwQ0PsYr3Vh5HbvlS0ZT0l/o2R43HcjGdmrJONpqSMPdo5164br4eRVidLyPCjMWpJ/oAPZOTrUvglkokZZo3EuTiBN/MQOCenGMRbGDFLw0kREuafN6Ho/GfsGRTrQHSP6lRVxHJyMzStDY2Y0g/Tlq9bxW62wdMgs2taFfjB+wB4utgckMhKL9XSw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVc0VEs1NXp0dGlNYzQ2UDdKVXc4UFE4YWNmaWJtb25wUlZ6a29WVUxTWFFD?=
 =?utf-8?B?MDlvQ2lCK3NnTy9sTlpjYjg2UFhQdi9PSXlBWHh5TE11dU1hVTBLQ1Y1dytT?=
 =?utf-8?B?TTBYWXdadVVKQVViUjdMMGxuZTEvVGJ5b0ZFM0diQ2xxWmJ1N25JWmJjbmtM?=
 =?utf-8?B?cWZibm1QUnBCWlRCZGEwcXR5akV4S01KbVpIaTZhMWVRaWtpZjRVZU5TV3hn?=
 =?utf-8?B?RkZHVlNvenlBa0NaNG9SbDBhbEpmZnpnS1NJN1oxVCtNWE5GcHdJOVNlY2xn?=
 =?utf-8?B?SkgrMmtxeGE3YTQ1Tk9JcG8wQy9nUlVwSVdjNDNORkN2aTBTWW5Fb3d2OFpU?=
 =?utf-8?B?WlF6WkNuaXBhZndOeXM5K0Y5REgxSjRmZ0tvdmkxN1hWb1dPVGNQQjdwbTVF?=
 =?utf-8?B?VFlYZXZmbVI0NjJlbnllM1JJUk5hSC9kOHIzZXllL3NOL2Y3ZEZvc2dWQ1pW?=
 =?utf-8?B?ZHZ2T1BkYStpbmtzTWg2M3dQQVhXcTJYZHdtZXVPVXRYc0ZYSUZUMG9pVGVT?=
 =?utf-8?B?T2d4eUFxc0lvZytORGFOelkrSHJJYXJndFR3c2dYaFM5dENNOGkwWHJNOGVz?=
 =?utf-8?B?ZThHZGVvOVVZYk5meHNRdUxSYTVsNmNkYmRZMmx5WlZOWGJHanJ4UXhkUVRr?=
 =?utf-8?B?VHZZcXZ4MmVuWnNId0VzVVMxNS9KM0VWUDhTWkIzZVYzSHdKYjMzRkdaSFhS?=
 =?utf-8?B?NFc0b3BtYzJtM1BpUElqSE1RV2FZUHk3TEJXUkJSU1ZCcmp6aDVJQTZHZS9y?=
 =?utf-8?B?RzlmTWtwRHord1htS2cwOGZCNlVHbVpUcEVuMHhRNWppaThMbkV4QmZmeVE5?=
 =?utf-8?B?K0x1MVNlVXp0UksrMUVneURCbnhuNkhwUWlCUFpSdVNURzVEWVd6aFBHTTJZ?=
 =?utf-8?B?T1RNdXlWR01XSVFvQ2UyWExrWk8wTkMrczgrOHh2cUs1ZUtsKzEzdWZvdGRM?=
 =?utf-8?B?ZzFQTUZzMFAwN04wVWN2b0VrYnc3MXo5WnMweUVVU25TM2dUUDVDRW10R0ZU?=
 =?utf-8?B?dGxyektvM1IyeENqUHg1N3h5Rk9VOWUwQjZKWTBySmxLUlg0d2JwZE1pRWU4?=
 =?utf-8?B?dUhrNU1wbnNwamFMcjg5aDFqR052ajdZOGNjdXlGb3ZXc3hwVGZvSk9ScmtT?=
 =?utf-8?B?NStWZkdhQStTVGs1N1hnQ2Q0SVdERSs4NmFMZVd3ZnRHc0xaUUVsaDJHOXhn?=
 =?utf-8?B?d0VqZGdKMEY4YUh0NDFFSEVXOVNmM29RR2F6UDBUbjFlTlVmZkJkSVZPbHg3?=
 =?utf-8?B?bFJnczMycHJnU0RvRHByZ0ZyM2FuZFBFTVVzTmJDUC9FaXBpalFZMVF4S00y?=
 =?utf-8?B?dHdrbmhhMndXQXZHNEs1Y3pmS3RBNkE1OEE5aHBnNmNINEFEMWZUb2N5Mnhq?=
 =?utf-8?B?UHN1cW1uQXRhQ25ESktQdytFeDk3cit0Q2RocUpZOGRSSlNLdUFaeDRBUmtv?=
 =?utf-8?B?UGE1OWdUYkJ0MEJ0ZzYrSXQrZnZ4TmVtcTdZT2NDZ2NxWVRFQ1BMUklmQ2pV?=
 =?utf-8?B?SDg0Vnl6cVhXZ1FXUFNka0lvalRuUjl5d05EQmNRbWNYZHNaK0FXSVF2T3gv?=
 =?utf-8?B?SmhaaW5EVm9QMEN1MGFzRmJTOHE2MXE3SVZMZ0k5ODIxQ21WczVLOHZZT1BE?=
 =?utf-8?B?azhoZ0ZiK1ZOOFkvanBDcXJUV0pXaENRUVlWa1JBVi82OURNdklQVDRpNU9Z?=
 =?utf-8?B?bkNvQnZEMTB2MldEY3NNZWtCUGR6MGdpVXNPWUdrS1BjdEJEWGNPU05haUVL?=
 =?utf-8?B?TmVORTJwaWlqeUJ0ZzRlRy9JRlhRa0x6dVc0YWJxRDU5dUYyN3ZLZlhORHJ6?=
 =?utf-8?B?SFMrQjJyNENqNVRJRmg5K0xXQ1cyT2pHeDMvSERGRGo4TUo1WGtGQnBCU2kr?=
 =?utf-8?B?QkVBMUhJMDNyZlJ2ZjhnU3FTcXlHdzl2MUhYL1Y4RGNleTZkMXQ1YW9VV3gy?=
 =?utf-8?B?VTc2d3Iwd3JGWFNnSGxvN1ZmVE9YREV4eUxaYVZjWDdPbGNzOU0rdkc4Wndr?=
 =?utf-8?B?M3Nlci8vRkRCWnVmS202QmhaY0JGb00veDBaZCtMWmN0ekR2TVFZMHBFM0JN?=
 =?utf-8?B?YTR6RERkOXhRekxocnhSU0lXeWxYRy9TeVdjQzRkUnZZUnc3WEg3Nk9SNUNW?=
 =?utf-8?B?eE1WcFpsbVRCVnljbEhDRXhUend2enBDcHpReUtheVNhcjQycFUyemNYWWxB?=
 =?utf-8?B?ZUZDS1g5a0ovUDhrR3VqTDVubXZPS2Q0Q1BLQnM4ZzBINEZSZDlpczAyUlZ6?=
 =?utf-8?B?UUQ2V3ZuWVRkQ3dlRkkrRkd0WEZpQTcvYnFRWTZTbzRLNmhrdDMzV3VNUm52?=
 =?utf-8?B?RE5WTDVUMVdacG5uaDE2bkx2ZXdzdEE4K1c2WGxYRzNjNXlzUWVEUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: R+p/p+GJNRnRRic976O1cF501M6CTZwJGQ2vRACQwsD26jNZ6gxGzLsbHnlgb+1TqaqzRA5qqKJwr4fnz21noi5cnxF/re7Z5TTYsuN4hIQSGfv+F3Tlps5i2YfWBBch+6w3/ZkqwaKmgEB60H3sEFKojRbhTe2f0WhJU/qoPExOo2hCIZ/04zCLsZu0Wh08hdElATIjsswC7GePtXtRKGgBdRloi2lrnjjazNLqvmYCQ5pUgDEyd7uWLGIVnhEuS34HY+3TtYibJbVH4zTcUXvuuHVnAKUN0QsLCQajrvNA+Drb5W9ZCq/t/4PjkLIAeyIPSgNF4G3R/BYAcphb+A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd32781a-1d16-4196-bef7-08df38c1012e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 09:09:30.9181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NP8rJVNOwdW+rI7cnXS1ktExTxJRsXoEuIWMBEctP5DqdlOcfTK6D0aYu/+uBDGP0O5I13+9jZO+Z9HG8LlGmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwu
b3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIDIgTm92ZW1iZXIg
MjAyNiAxMC4xOA0KPiBUbzogS2Fob2xhLCBNaWthIDxtaWthLmthaG9sYUBpbnRlbC5jb20+OyBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2k5MTUvZGlzcGxheTogUnVuIHRoZSBz
ZWxlY3RpdmUgZmV0Y2ggdXBkYXRlIGFmdGVyIHRoZSBjcnRjIGNoZWNrcw0KPiANCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3Rl
bnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIGRybS9pOTE1L2Rpc3BsYXk6
IHNlbCBmZXRjaCBsb29wIG1pc2FwcGxpZWQgdG8gaW50ZWxfYXN5bmNfZmxpcF9jaGVja191YXBp
KCkNCj4gLS0NCj4gDQo+IGNvbW1pdCA5NTIzMGIzY2QwOTRhZWIxZWU0ZjM1YWYyNGQxZjdkODAw
MmE2NDQ2DQo+IEF1dGhvcjogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCj4g
DQo+IGRybS9pOTE1L2Rpc3BsYXk6IFJ1biB0aGUgc2VsZWN0aXZlIGZldGNoIHVwZGF0ZSBhZnRl
ciB0aGUgY3J0YyBjaGVja3MNCj4gDQo+IFRoaXMgY29tbWl0IG1vdmVzIHRoZSBjYWxsIHRvIGlu
dGVsX3BzcjJfc2VsX2ZldGNoX3VwZGF0ZSgpIG91dCBvZg0KPiBpbnRlbF9jcnRjX2F0b21pY19j
aGVjaygpIGludG8gYSBzZXBhcmF0ZSBsb29wIHNvIHRoYXQgc2VsZWN0aXZlIGZldGNoIGlzDQo+
IGNvbXB1dGVkIGFmdGVyIGFsbCBqb2luZWQgcGlwZXMgaGF2ZSBoYWQgdGhlaXIgc2NhbGVyIHN0
YXRlcyB1cGRhdGVkLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYw0KPiA+IGluZGV4IGQ1ZDQ0NTNmMjgzYmIuLmUzODMxMjYwY2E0YTEgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
Yw0KPiA+IEBAIC00NDQ0LDEwICs0NDQ0LDYgQEAgc3RhdGljIGludCBpbnRlbF9jcnRjX2F0b21p
Y19jaGVjayhzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gPg0KPiA+ICAJfQ0K
PiA+DQo+ID4gLQlyZXQgPSBpbnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3RhdGUsIGNydGMp
Ow0KPiA+IC0JaWYgKHJldCkNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+IC0NCj4gPiAgCXJldHVy
biAwOw0KPiA+ICB9DQo+ID4NCj4gPiBAQCAtNjE4OCw2ICs2MTg0LDE5IEBAIHN0YXRpYyBpbnQg
aW50ZWxfYXN5bmNfZmxpcF9jaGVja191YXBpKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0
YXRlLA0KPiA+ICAJCX0NCj4gPiAgCX0NCj4gPg0KPiA+ICsJLyogU2VsZWN0aXZlIGZldGNoIG5l
ZWRzIHRoZSBzY2FsZXIgc3RhdGUgb2YgYWxsIHRoZSBqb2luZWQgcGlwZXMuICovDQo+ID4gKwlm
b3JfZWFjaF9uZXdfaW50ZWxfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0YywgY3J0Y19zdGF0ZSkg
ew0KPiA+ICsJCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJCXJldCA9IGludGVsX3BzcjJfc2VsX2Zl
dGNoX3VwZGF0ZShzdGF0ZSwgY3J0Yyk7DQo+ID4gKwkJaWYgKHJldCkgew0KPiA+ICsJCQlkcm1f
ZGJnX2F0b21pYyhkaXNwbGF5LT5kcm0sDQo+ID4gKwkJCQkgICAgICAgIltDUlRDOiVkOiVzXSBz
ZWxlY3RpdmUgZmV0Y2ggY2hlY2sgZmFpbGVkXG4iLA0KPiA+ICsJCQkJICAgICAgIGNydGMtPmJh
c2UuYmFzZS5pZCwgY3J0Yy0+YmFzZS5uYW1lKTsNCj4gPiArCQkJcmV0dXJuIHJldDsNCj4gPiAr
CQl9DQo+ID4gKwl9DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IFdhcyB0aGlzIGh1bmsgbWlz
YXBwbGllZCB0byBpbnRlbF9hc3luY19mbGlwX2NoZWNrX3VhcGkoKSBpbnN0ZWFkIG9mDQo+IGlu
dGVsX2F0b21pY19jaGVja19jcnRjcygpPw0KSW5jb3JyZWN0IGFuYWx5c2lzLiBUaGUgc2Vjb25k
IGh1bmsgaXMgYXBwbGllZCB0byBpbnRlbF9hdG9taWNfY2hlY2tfY3J0Y3MoKS4NCg0KPiANCj4g
SW4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMsIGludGVsX2Fz
eW5jX2ZsaXBfY2hlY2tfdWFwaSgpDQo+IGRlY2xhcmVzIG5ld19jcnRjX3N0YXRlIHJhdGhlciB0
aGFuIGNydGNfc3RhdGUsIHNvIGV4cGFuZGluZw0KPiBmb3JfZWFjaF9uZXdfaW50ZWxfY3J0Y19p
bl9zdGF0ZShzdGF0ZSwgY3J0YywgY3J0Y19zdGF0ZSkgZmFpbHMgdG8gY29tcGlsZQ0KPiB3aXRo
IGFuIHVuZGVjbGFyZWQgaWRlbnRpZmllciBlcnJvcjoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jOmludGVsX2FzeW5jX2ZsaXBfY2hlY2tfdWFwaSgp
IHsNCj4gCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShz
dGF0ZSk7DQo+IAljb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUg
PQ0KPiAJCWludGVsX2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUoc3RhdGUsIGNydGMpOw0KPiAJ
Li4uDQo+IAlpZiAoIW5ld19jcnRjX3N0YXRlLT51YXBpLmFzeW5jX2ZsaXApDQo+IAkJcmV0dXJu
IDA7DQo+IAkuLi4NCj4gCWlmIChuZXdfY3J0Y19zdGF0ZS0+am9pbmVyX3BpcGVzKSB7DQo+IAkJ
ZHJtX2RiZ19rbXMoZGlzcGxheS0+ZHJtLA0KPiAJCQkgICAgIltDUlRDOiVkOiVzXSBhc3luYyBm
bGlwIGRpc2FsbG93ZWQgd2l0aCBqb2luZXJcbiIsDQo+IAkJCSAgICBjcnRjLT5iYXNlLmJhc2Uu
aWQsIGNydGMtPmJhc2UubmFtZSk7DQo+IAkJcmV0dXJuIC1FSU5WQUw7DQo+IAl9DQo+IH0NCj4g
DQo+IEluIGFkZGl0aW9uLCBpbnRlbF9hc3luY19mbGlwX2NoZWNrX3VhcGkoKSByZXR1cm5zIGVh
cmx5IGZvciBzeW5jaHJvbm91cw0KPiBjb21taXRzIGFuZCByZWplY3RzIGpvaW5lZCBwaXBlcywg
YW5kIHJ1bnMgaW4gaW50ZWxfYXRvbWljX2NoZWNrKCkgYmVmb3JlDQo+IGludGVsX2F0b21pY19j
aGVja19jcnRjcygpIGNvbmZpZ3VyZXMgdGhlIHNjYWxlcnMuIFdpdGggdGhlIGNhbGwgcmVtb3Zl
ZA0KPiBmcm9tIGludGVsX2NydGNfYXRvbWljX2NoZWNrKCksIG5vcm1hbCBhdG9taWMgY29tbWl0
cyBuZXZlciBydW4NCj4gaW50ZWxfcHNyMl9zZWxfZmV0Y2hfdXBkYXRlKCkuDQo+IA0KPiBTaG91
bGQgdGhpcyBsb29wIGJlIHBsYWNlZCBhdCB0aGUgZW5kIG9mIGludGVsX2F0b21pY19jaGVja19j
cnRjcygpDQo+IGluc3RlYWQsIGFzIGRlc2NyaWJlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2U/DQo+
IA0KPiAtLQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjExMDIwODA3MDUuMjAyNzU3MS0xLW1pa2Eua2Fob2xhQGludGVsLmNvbT9wYXJ0
PTENCg==
