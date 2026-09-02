Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2453C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701A910F02E;
	Wed,  2 Sep 2026 07:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HORyEmwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B4E10F02E;
 Wed,  2 Sep 2026 07:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788333750; x=1819869750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H9MES+LRNTeOQT/2RNzOKraYF8dGa/gBSqHa7d1L1aU=;
 b=HORyEmwT9DoRHLt6k1UHWBNF75oKpiYgVlt9QkECUiDq1CgrGuXBgkUD
 Oj3zCXAJCsEEgGMwWpZeRjhTlKABEma2FqQRyaWkR5MInyJujPkLoW5vN
 BqzmtAXz5VVKSeApgZcWXA/WnN3a8vGfRehEwd24Tp7zn3dhorhQes7DR
 8Nse0azBHkdZr8ORjlxOXNq9XpGjFohNjPlYKcqxSkwq6tgUJQ0ITGIAH
 c1wGp4kB8WgSPfgxVXoeIeloAa2qag9nnAJaeZ2kkljZ0kVwTuf6TWYRJ
 RNVZ9ZaM/kDyT/5cgXZkDaCa9JhHuuBzzH3vv5KvFp6SjpO3qgRmLJpjl Q==;
X-CSE-ConnectionGUID: sPSXxrqkRwyoFganvXGQsA==
X-CSE-MsgGUID: Bhy334GySxmXgGh1pARvmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99116137"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="99116137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:22:29 -0700
X-CSE-ConnectionGUID: 6MICXkm5Td6/u6bIPa4PUQ==
X-CSE-MsgGUID: QVLASRNrRbea5mntxgzQgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="271301623"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:22:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:22:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 00:22:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1quQgISkAN7JGeSgDQlTR7JCBNjOertR9R+Hp+MF+jZzNfkqs94ske9rqCPoaGrh+EUq59X/JpDS6Cw2kaiAny/a9Vj5mjmXMC2UvtEj2npu62whxBzl8SU8BzwM7vk6O6rxgs7JFXesLBoJU+JJLcXxlyU+Pyfi3bX/mcCfYDU6JeXzf08OzbZIfueDssiAtWRWEVAigJ5i/IL08y/mDaixdhoOooq+40Lph20RnW/fKRSxPJca/VzpIQ6SJn8zpkqQrDfWMkDlEQQXqzHSPbEj5qVOjOEKVy8p91oHrgdv9g8zq1rssKurxOZZ7UuOzxlbWUI7jUUAhTImPISlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9MES+LRNTeOQT/2RNzOKraYF8dGa/gBSqHa7d1L1aU=;
 b=NEtdPBtVNGYGQNR6p/vPxMmjGa6z6IweKKAPvS7Y4PzVtxa499AbJwJopwagk+DLbGlr/8R33GTtHo1Rl8Ffmh+eaob3yhCopa3U6TNUQITAWZF/fKY0ktCxGQKqCe8y64Mn0D+qz88unDq+woh4J/hiIBr0Ka8FHKXqLKT8xPlRuLGeJwZcY0FPUsEbArDO+3op+fW18u6quEopaccOaw0Ty1rqX6wPRwkASJNnwQQ3z1AQ/q9lFTxz6Gz7v6HqQjdVprTw/HaNHk+dhsOq8xTaN4atTDLbEgLM2n0QgJ0gLzpyyXKt4+i5MBW5WuGkfsEZYxcnjggSf+kSCpQvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:22:26 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:22:25 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 06/15] drm/i915/alpm: Auxless wake time calculation for
 Xe3p
Thread-Topic: [PATCH v5 06/15] drm/i915/alpm: Auxless wake time calculation
 for Xe3p
Thread-Index: AQHdNFmx0PCfD+8o4kCvbP8AT9rA77a67uYA
Date: Wed, 2 Sep 2026 07:22:25 +0000
Message-ID: <cf6a767a132ebd4ae25c4072d64cb4f790866b1e.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-7-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-7-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB6774:EE_
x-ms-office365-filtering-correlation-id: 57851620-d1f9-4680-1df7-08df08c2f035
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|3023799007|22082099003|18002099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: wnBS/jun/SKBZRF8L/hCJjHvd4JDIYGeEd9PgX0bZnirzWt0SsbTaqG5JeALT2Si9uDHzDR3ONUWRVSoWaA7o+7nHKRw8hcVosNAqyd037s9w3947XLQOTLlGP35O/MtPwidmcIf8Ielsi6mztMiPAgNVIaKSQIBgk9KtzhZ0wVEwPq9JUogUlf3dxRlQa/ApVL3zSXXjMo5po71Ri1UNiMSEWHW6/l2Ds7x1c6XNtEMyxfvlRGzz7pVfkl8RpLzQYQYg0J9k8r0cQYnY4feodjIlUyU+27TK5xGFtyITtaSiWXO5Qejx24SoASZTKUyBqtWNZkrSSxkp7SOCsEsGM1DUF859qV3nwvjLQi3vm1sDSYScVE6t5oiqXg5HH3LFSBen6p9INpbsOKG3dgk4dZuSRm9ZGvhxLQwm3cu6j6pYWyvfwWBT7FxV7RyRwsR86GKe3+s/5K1jyPCAJh/0xVUYzqdTcrmbElR4/JWTZxGtfc/deB3pZf2LvEnDPtOdmHPcT+WBHlCuTR1PjKOZuDv3Di2BuNNN4ADGQcw3c7wVYmAYY7OMvmwxxiWs6oTv3EUrjAssm9+x5HOXFdw5S4jQRaEIexRS38WbgK0J70lO4XPvkC4W5s0lw+3GFmrdq4MVl+MdqO4y4FgcovwPrb5G2sHPZdEf5crKHSObQuQC6QN3A+wlVjpihSUqYAPM8n87FDQU24R3EayV6XvoEUwpepiWR5Cn5s0biFcsg8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0M5NHFyK3VSc1QyNEpyRHhlZFFXOUltVlliaW92bkNqNTNScXF3dnZXUzAx?=
 =?utf-8?B?SGc1Y2JnYThRWEMxUnUyRjYvWEZnUTB2citoT2x0U2ZWb0g5S2Q5NG9mcm9N?=
 =?utf-8?B?c1p0QXlneHQrUHAwZ2I4akEwUzlCMGNBWFV1OGdpUEc0TUxiZk1GUnltbVJC?=
 =?utf-8?B?aHJ6cmlwbklnMEs5aUlZMXQzaXRUd3owMGE0VnFEcnVGK0lHMWpUL1VEQmxM?=
 =?utf-8?B?bXZHVXY1U3RaK0NwNHp1Q0RQY0E1LzNQa0IvRFkwNTRTRHVqeXR1VWVzLzlX?=
 =?utf-8?B?cDdiQlM5djhhWTBRMTRPWWVCSjc1ampnQ05HYi9ZNktBSUNRN2dPenZ5WWpq?=
 =?utf-8?B?aTE4TDFPOHBZT0ZIeWN1MXQ3RXlhdHdZRjJKYkpQTnAwTXF0RU9VcC9qai9Z?=
 =?utf-8?B?ZktUMjBBekxOMVpXNSsrN1JMdlVDVE9pVjJXYXJKbEIxU3BuU0o2VmRoRWw3?=
 =?utf-8?B?dklwM1dSY3F6SllrUE1kekV4TnN2S0F5U0ZjMnpzUzZSZmpmckY1R1VPYWQ5?=
 =?utf-8?B?bENDY1NpMU9TT1BCTis4blp6TWh6VXJhcW5tUmU4NjExOW83ZXJxcEtNU2w1?=
 =?utf-8?B?UmhIajNzTDhza0tlWlhSQk5rTE8vZllXQ1R0VU40MW9CaUYrZFhiNmhsLzlS?=
 =?utf-8?B?Tk9LK2FvUkN2eFNBRDZHVUF0ZzVnbHNaVXJaczJkMER3WTdXZkVwRE5xV0ZN?=
 =?utf-8?B?bm9SK2VnTXlGZGhLNmlKMzdlZUZkaEg1R1QwamRCS0pGTlp2bzhCeFpQUU1E?=
 =?utf-8?B?WVc1R2tkU2pWYS9IOVNzSElaK1AzUGZxckZkN0hsQnY4cVQ1ZWRxSnZyVlpu?=
 =?utf-8?B?dmpuYjNRY1V5dlY5ZzFPN0w1b0VJclR1ZHVvdlo4Rm11QmJMV2F6UWhma1NE?=
 =?utf-8?B?NlFnSk05RnlZTHFvMXRKRXUyMUdNbDRMWUl2cERLNGhYckFydEJSbnU1U1hN?=
 =?utf-8?B?V3ExRVJXMkJuTEEzMjJ6bzM1a0xJSmt0bHRtZHk3aXJ5NG5iQ25Nb0w5M0ly?=
 =?utf-8?B?UmVpMXRrZjRBYlpXQXpaTnhrSkRpaGZUMVlJNFllRDlJQUNxd1kvMkJHUzMr?=
 =?utf-8?B?VzA4RHVpblJGVnR5QStMTTE0dVN6Nm1ySEJ3bTFpTytrdGg2N0YvK2szS1Fs?=
 =?utf-8?B?aEJGZzM2MDA2dFg3UmZERksvcnBnZGZXckNRRmhUY2x3dU9pQ3VTMk9ZRWps?=
 =?utf-8?B?c0Y4M3dRVFA4OENvbG4rNytMQzNkRDZpUTd1ZVBSZ0N3dmxiKytvSVpYOGt6?=
 =?utf-8?B?ZStWQ0t2aHVqOTlmdnZhU1JDMWRwQ2wyeEYvdVhrYytydThPTk82VWswZXZZ?=
 =?utf-8?B?WVA4UE4rd2dkdFRXZVAwY3l1NEpKTmVFVkh6UGlOM1gwMjBNL2NoSEpzVDhW?=
 =?utf-8?B?cmU4a1dIczdYZlJmcjVpcVpzbUYwNitKQkdQN3pENFE2K0R0RkczOEdDRUVZ?=
 =?utf-8?B?N21RL21mTHZXT2dpUlhnS2laQ0Z2NnVJRHJoNkF3cGxOQlI3NHEwcmVUVnNv?=
 =?utf-8?B?djZaZFpOamN3WThoZTU3a01EN29pVUErd09YNGhLSDVLWUN3NDAydldkNXNw?=
 =?utf-8?B?bE16WG1WZzU5eG1GWnowdi9jWU13aHZSWHRBMURoK2UxMHlnK0EwblQzUlBN?=
 =?utf-8?B?QWN1SzVEN0w2R1kyMTR0dnpHdmhvbkYvVjBEN2FZVk1ieUFXVzJORnB2LzNT?=
 =?utf-8?B?SzYyWS9OV1RZYnFPR0U2Q3FoeE1ibXFCTlVQMlROL1lMZXd5S3hDT0dNemdz?=
 =?utf-8?B?bzdVdjNicXlsNjBwQzJ2SXhOQ21mbS9QMm1Ydk1uOG1tajJjVEZDbW9FVkYw?=
 =?utf-8?B?ZjNlTFF4VWhJMCs1VzRIcjZEK1pIUmtpVXEyUlVJK0Fqa1A3ZmRFd29mM3dG?=
 =?utf-8?B?ZksxeXZKeTI4VDJpelBtbnNPQnVmWExzTVpBbHdkRFo2YlNuSGZoL3pVbEZh?=
 =?utf-8?B?c1BDOWJxRytTRUgxanREemJUZ3haK28rUG1QZ3RxSmV6Ym8rU2NuU1ZDdkZJ?=
 =?utf-8?B?S21aMTRUdUdDRlVuRzhMTE1QckNNZDd4MUdmTGYrc2pocnEyWjI3ckNFU2Ex?=
 =?utf-8?B?eitWK2RzelZTRjBFU0ttN0xNWEZXK1E4QTh1SnJITGNEeFBTZEE2bzVkYnds?=
 =?utf-8?B?SGFCa0hnTExKQ0s5RDFaVENsc3ZLV2JES3dvb0JCY0w1bnk0eFJCY0NwUUNC?=
 =?utf-8?B?a2QxZ3ErOWI3SzBKMVdzTERrYWJBZ0NucEtOWFNxM2x1M0hwSjhZYXFEb2ZN?=
 =?utf-8?B?UzI0VmVqM3hUZ2FTTDJ4Z1V5TEpVdENKejIyeW9aNGpqWG9HSFRuWGVtWXF6?=
 =?utf-8?B?dGV5VnR6dDZHTU02MklqeExRV21XMUhjaTdkSTAvanRCMUx1bFI1QnVhWjVs?=
 =?utf-8?Q?0gJVk/4Ah5AOuLt8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AC6839659BCDF46B9579EDB6C0ED80C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PwzMn/Yq2oB1E0J+tQR91TCRZtjJd+HeUIEaJGp6ErPv2ozYhpKvqHEauVWxnsVqjrew8QF94nD6qrMr5/C0ixaoOnbjgALV/p5/G6/3f4phYQE5et+Rs6a1r69zp+XdbHCY9er0X2lmZ5VYmkhvKRkufi6qgXUmbkrtY6WwfPT8kLEFeWvIB9fuNLAl19reweFr0IHs4MXB4cTc4gMAny+Ki7B7xV9EkLpEMOnpYPQZQg/v8XGJNh0H5Gvsjr9pO7jSFnxeIrtUzGPPgRHYMQMwDioedVCUhZuIBDujOOgDcQvIdj40t/YVzH1q21z7UwRvIyTAegZ/Yyw7hgh+Jg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57851620-d1f9-4680-1df7-08df08c2f035
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 07:22:25.5535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NdRboWHF9qxT1alx4HOSG5h8Hry071C6fpUAzvdi9oAev0V3X0PHG3N8jUQqU5WOijD2UT+SoH/U5zj3zfqQzVkyYFQiiSR7qhyup1H6zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBBZGQgc3VwcG9ydCBmb3IgYXV4bGVzcyB3YWtldGltZSBjYWxjdWxhdGlvbiBmb3IgRFAyLjEg
QUxQTQ0KPiBhcyBkZXBlbmRlbnQgcGFyYW1ldGVyIGdvdCBjaGFuZ2VkLg0KPiANCj4gdjE6IElu
aXRpYWwgdmVyc2lvbi4NCj4gdjI6IFVzZSBpbnRlbF9kcF9pc191aGJyKCkuIFtKYW5pXQ0KPiB2
MzoNCj4gLSBTZXBhcmF0ZSBvdXQgc3dpdGNoIHRvIGFjdGl2ZSBsYXRlbmN5IGNhbGN1bGF0aW9u
Lg0KPiAtIFVzZSBtYWNybyBkZWZpbml0aW9uIGZvciBNTF9QSFlfTE9DSyBsZW5ndGguIFtTdXJh
al0NCj4gLSBNb2RpZnkgQVVYX0xFU1NfV0FLRV9USU1FIGJpdGZpZWxkIGZvciB4ZTNscGQuIFtT
dXJhal0NCg0KSSB0aGluayB5b3Ugc2hvdWxkIHNwbGl0IHRoaXMgaW50byBzZXBhcmF0ZSBwYXRj
aC4NCg0KPiANCj4gQnNwZWM6IDcxNDc3DQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhv
Z2FuZGVyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVz
aC5tYW5uYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYWxwbS5jwqDCoMKgwqAgfCA2MSArKysrKysrKysrKysrKystLQ0KPiAtLQ0KPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyX3JlZ3MuaCB8wqAgMiArDQo+
IMKgMiBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0u
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IGluZGV4
IDRiMTVkOTZkMGFkNy4uYWYyNzMzODA1NTA1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiBAQCAtMTA1LDIxICsxMDUsNTAgQEAgc3RhdGljIGlu
dCBnZXRfbGZwc19oYWxmX2N5Y2xlX2Nsb2Nrcyhjb25zdA0KPiBzdHJ1Y3QgaW50ZWxfY3J0Y19z
dGF0ZSAqY3J0Y19zdGF0ZSkNCj4gwqAJCTEwMDAgLyAoMiAqIExGUFNfQ1lDTEVfQ09VTlQpOw0K
PiDCoH0NCj4gwqANCj4gKyNkZWZpbmUgTUxfUEhZX0xPQ0tfTEVOCQkyNTINCj4gKyNkZWZpbmUg
TUxfUEhZX0xPQ0tfTEVOX1VIQlIJMzk2DQo+ICsNCj4gwqBzdGF0aWMgaW50IGdldF90cGh5Ml9w
Ml90b19wMChjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSkNCj4g
wqB7DQo+IC0JcmV0dXJuIDEyICogMTAwMDsNCj4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlz
cGxheSA9DQo+IHRvX2ludGVsX2Rpc3BsYXkoY3J0Y19zdGF0ZSk7DQo+ICsNCj4gKwlyZXR1cm4g
RElTUExBWV9WRVIoZGlzcGxheSkgPj0gMzUgPyAoMjAgKiAxMDAwKSA6ICgxMiAqDQo+IDEwMDAp
Ow0KPiDCoH0NCj4gwqANCj4gLXN0YXRpYyBpbnQgZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKGNv
bnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICpjcnRjX3N0YXRlKQ0KPiArc3RhdGljIGlu
dCBnZXRfZXN0YWJsaXNobWVudF9wZXJpb2Qoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4g
KwkJCQnCoMKgwqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUp
DQo+IMKgew0KPiDCoAlpbnQgdDEgPSA1MCAqIDEwMDA7DQo+IC0JaW50IHRwczQgPSAyNTI7DQo+
ICsJaW50IHRwczQgPSBpbnRlbF9kcF9pc191aGJyKGNydGNfc3RhdGUpID8NCj4gKE1MX1BIWV9M
T0NLX0xFTl9VSEJSICogMzIpIDoNCj4gKwkJwqDCoCAoTUxfUEhZX0xPQ0tfTEVOICogMTApOw0K
DQpBZGQgZ2V0X21sX3BoeV9sb2NrX2xlbigpIGFuZCB1c2UgaW50ZWxfZHBfbGlua19zeW1ib2xf
c2l6ZSgpLg0KDQo+IMKgCS8qIHBvcnRfY2xvY2sgaXMgbGluayByYXRlIGluIDEwa2JpdC9zIHVu
aXRzICovDQo+IC0JaW50IHRtbF9waHlfbG9jayA9IDEwMDAgKiAxMDAwICogdHBzNCAvIGNydGNf
c3RhdGUtDQo+ID5wb3J0X2Nsb2NrOw0KPiArCWludCB0bWxfcGh5X2xvY2sgPSAxMDAwICogMTAw
MCAqIHRwczQgLyBjcnRjX3N0YXRlLQ0KPiA+cG9ydF9jbG9jayAvIDEwOw0KDQoxMCBzaG91bGQg
YmUgaW50ZWxfZHBfbGlua19zeW1ib2xfc2l6ZSgpLg0KDQo+ICsJaW50IGx0dHByX2NvdW50ID0g
MDsNCj4gwqAJaW50IHRjZHMsIGVzdGFibGlzaG1lbnRfcGVyaW9kOw0KPiDCoA0KPiAtCXRjZHMg
PSAoNyArIERJVl9ST1VORF9VUCg2NTAwLCB0bWxfcGh5X2xvY2spICsgMSkgKg0KPiB0bWxfcGh5
X2xvY2s7DQo+IC0JZXN0YWJsaXNobWVudF9wZXJpb2QgPSAoU0lMRU5DRV9QRVJJT0RfVElNRSAr
IHQxICsgdGNkcyk7DQo+ICsJaWYgKGludGVsX2NydGNfaGFzX3R5cGUoY3J0Y19zdGF0ZSwgSU5U
RUxfT1VUUFVUX0VEUCkpIHsNCj4gKwkJdGNkcyA9ICg3ICsgRElWX1JPVU5EX1VQKDY1MDAsIHRt
bF9waHlfbG9jaykgKyAxKSAqDQo+IHRtbF9waHlfbG9jazsNCj4gKwl9IGVsc2Ugew0KPiArCQl0
Y2RzID0gNyAqIHRtbF9waHlfbG9jazsNCj4gKwkJbHR0cHJfY291bnQgPSBkcm1fZHBfbHR0cHJf
Y291bnQoaW50ZWxfZHAtDQo+ID5sdHRwcl9jb21tb25fY2Fwcyk7DQo+ICsJfQ0KPiArDQo+ICsJ
aWYgKGx0dHByX2NvdW50KSB7DQo+ICsJCWludCB0bHcgPSAxMzAwMDsNCj4gKwkJaW50IHRjcyA9
IDEwMDAwOw0KDQpXaGVyZSB0aGVzZSBudW1iZXJzIGFyZSBjb21pbmcgZnJvbT8NCg0KPiArCQlp
bnQgdGxmcHNfcGVyaW9kID0gZ2V0X2xmcHNfY3ljbGVfdGltZShjcnRjX3N0YXRlKTsNCj4gKwkJ
aW50IHRkY3MgPSAoU0lMRU5DRV9QRVJJT0RfVElNRSArIHQxICsgdGNzICsNCj4gKwkJCcKgwqDC
oCAobHR0cHJfY291bnQgLSAxKSAqICh0bHcgKw0KPiB0bGZwc19wZXJpb2QpKTsNCj4gKwkJaW50
IHRhY2RzID0gNzAwMDA7DQo+ICsJCWludCB0ZHMgPSAobHR0cHJfY291bnQgLSAxKSAqIDcgKiB0
bWxfcGh5X2xvY2s7DQoNCkkgdGhpbmsgaXQgd291bGQgYmUgZWFzaWVyIHRvIGZvbGxvdyB0aGVz
ZSBmb3JtdWxhcyBhZ2FpbnN0IEJzcGVjIGlmDQp5b3U6DQoNCmludCB0ZHMgPSA3ICogdG1sX3Bo
eV9sb2NrOw0KZXN0YWJsaXNobWVudF9wZXJpb2QgPSB0bHcgKyB0bGZwc19wZXJpb2QgKyB0ZGNz
ICsgdGFjZHMgKyAobHR0cHJfY291bnQNCi0gMSkgKiB0ZHMgKyB0Y2RzOw0KDQpCUiwNCkpvdW5p
IEjDtmdhbmRlcg0KPiArDQo+ICsJCS8qIHRkcmwgaXMgc2FtZSBhcyB0Y2RzKi8NCj4gKwkJZXN0
YWJsaXNobWVudF9wZXJpb2QgPSB0bHcgKyB0bGZwc19wZXJpb2QgKyB0ZGNzICsNCj4gdGFjZHMg
KyB0ZHMgKyB0Y2RzOw0KPiArCX0gZWxzZSB7DQo+ICsJCS8qIFRPRE86IEFkZCBhIGNoZWNrIGZv
ciBkYXRhIHJlYWxpZ24gYnkgRFBDRA0KPiAweDExNlszXSAqLw0KPiArDQo+ICsJCWVzdGFibGlz
aG1lbnRfcGVyaW9kID0gKFNJTEVOQ0VfUEVSSU9EX1RJTUUgKyB0MSArDQo+IHRjZHMpOw0KPiAr
CX0NCj4gwqANCj4gwqAJcmV0dXJuIGVzdGFibGlzaG1lbnRfcGVyaW9kOw0KPiDCoH0NCj4gQEAg
LTE0MSwxMiArMTcwLDE2IEBAIHN0YXRpYyBpbnQgZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKGNv
bnN0DQo+IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiDCoCAqIHdpdGhp
biB0aGUgQ0RTIHBlcmlvZCBjb21wbGV0ZSB3aXRoaW4gdGhlIENEUyBwZXJpb2QgcmVnYXJkbGVz
cw0KPiBvZg0KPiDCoCAqIGVudHJ5IGludG8gdGhlIHBlcmlvZA0KPiDCoCAqIHRNTF9QSFlfTE9D
SyA9IFRQUzQgTGVuZ3RoICogKCAxMCAvIChMaW5rIFJhdGUgaW4gTUh6KSApDQo+IC0gKiBUUFM0
IExlbmd0aCA9IDI1MiBTeW1ib2xzDQo+ICsgKiBNTF9QSFlfTE9DSyBMZW5ndGggKDhiLzEwYik6
IDI1Mg0KPiArICogTUxfUEhZX0xPQ0sgTGVuZ3RoICgxMjhiLzEzMmIpOiAzOTYNCj4gKyAqIFRQ
UzQgTGVuZ3RoID0gTUxfUEhZX0xPQ0sgKiBSYXRlIERpdg0KPiArICogUmF0ZSBEaXYgPSAzMiBm
b3IgMTI4Yi8xMzJiIGFuZCAxMCBmb3IgOGIvMTBiLg0KPiDCoCAqLw0KPiAtc3RhdGljIGludCBf
bG5sX2NvbXB1dGVfYXV4X2xlc3Nfd2FrZV90aW1lKGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRj
X3N0YXRlICpjcnRjX3N0YXRlKQ0KPiArc3RhdGljIGludCBfbG5sX2NvbXB1dGVfYXV4X2xlc3Nf
d2FrZV90aW1lKHN0cnVjdCBpbnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+ICsJCQkJCcKgwqAgY29u
c3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+IMKgew0KPiDCoAlp
bnQgdHBoeTJfcDJfdG9fcDAgPSBnZXRfdHBoeTJfcDJfdG9fcDAoY3J0Y19zdGF0ZSk7DQo+IC0J
aW50IGVzdGFibGlzaG1lbnRfcGVyaW9kID0NCj4gZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKGNy
dGNfc3RhdGUpOw0KPiArCWludCBlc3RhYmxpc2htZW50X3BlcmlvZCA9DQo+IGdldF9lc3RhYmxp
c2htZW50X3BlcmlvZChpbnRlbF9kcCwgY3J0Y19zdGF0ZSk7DQo+IMKgDQo+IMKgCXJldHVybiBE
SVZfUk9VTkRfVVAodHBoeTJfcDJfdG9fcDAgKw0KPiBnZXRfbGZwc19jeWNsZV90aW1lKGNydGNf
c3RhdGUpICsNCj4gwqAJCQnCoMKgwqAgZXN0YWJsaXNobWVudF9wZXJpb2QsIDEwMDApOw0KPiBA
QCAtMTYxLDcgKzE5NCw3IEBAIF9sbmxfY29tcHV0ZV9hdXhfbGVzc19hbHBtX3BhcmFtcyhzdHJ1
Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwLA0KPiDCoAkJbGZwc19oYWxmX2N5Y2xlOw0KPiDCoA0K
PiDCoAlhdXhfbGVzc193YWtlX3RpbWUgPQ0KPiAtCQlfbG5sX2NvbXB1dGVfYXV4X2xlc3Nfd2Fr
ZV90aW1lKGNydGNfc3RhdGUpOw0KPiArCQlfbG5sX2NvbXB1dGVfYXV4X2xlc3Nfd2FrZV90aW1l
KGludGVsX2RwLA0KPiBjcnRjX3N0YXRlKTsNCj4gwqAJYXV4X2xlc3Nfd2FrZV9saW5lcyA9IGlu
dGVsX3VzZWNzX3RvX3NjYW5saW5lcygmY3J0Y19zdGF0ZS0NCj4gPmh3LmFkanVzdGVkX21vZGUs
DQo+IMKgCQkJCQkJwqDCoMKgwqDCoMKgDQo+IGF1eF9sZXNzX3dha2VfdGltZSk7DQo+IMKgCXNp
bGVuY2VfcGVyaW9kID0gZ2V0X3NpbGVuY2VfcGVyaW9kX3N5bWJvbHMoY3J0Y19zdGF0ZSk7DQo+
IEBAIC00MzAsOCArNDYzLDEyIEBAIHN0YXRpYyB2b2lkIGxubF9hbHBtX2NvbmZpZ3VyZShzdHJ1
Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwLA0KPiDCoAlpZiAoaW50ZWxfYWxwbV9pc19hbHBtX2F1
eF9sZXNzKGludGVsX2RwLCBjcnRjX3N0YXRlKSkgew0KPiDCoAkJYWxwbV9jdGwgPSBBTFBNX0NU
TF9BTFBNX0VOQUJMRSB8DQo+IMKgCQkJQUxQTV9DVExfQUxQTV9BVVhfTEVTU19FTkFCTEUgfA0K
PiAtCQkJQUxQTV9DVExfQVVYX0xFU1NfU0xFRVBfSE9MRF9USU1FXzUwX1NZTUJPTFMNCj4gfA0K
PiAtCQkJQUxQTV9DVExfQVVYX0xFU1NfV0FLRV9USU1FKGNydGNfc3RhdGUtDQo+ID5hbHBtX3N0
YXRlLmF1eF9sZXNzX3dha2VfbGluZXMpOw0KPiArCQkJQUxQTV9DVExfQVVYX0xFU1NfU0xFRVBf
SE9MRF9USU1FXzUwX1NZTUJPTFMNCj4gOw0KPiArDQo+ICsJCWlmIChESVNQTEFZX1ZFUihkaXNw
bGF5KSA8IDM1KQ0KPiArCQkJYWxwbV9jdGwgfD0NCj4gQUxQTV9DVExfQVVYX0xFU1NfV0FLRV9U
SU1FKGNydGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLmF1eF9sZXNzX3dha2VfbGluZXMpOw0KPiAr
CQllbHNlDQo+ICsJCQlhbHBtX2N0bCB8PQ0KPiBBTFBNX0NUTF9BVVhfTEVTU19XQUtFX1RJTUVf
WEUzTFBEKGNydGNfc3RhdGUtDQo+ID5hbHBtX3N0YXRlLmF1eF9sZXNzX3dha2VfbGluZXMpOw0K
PiDCoA0KPiDCoAkJaWYgKGludGVsX2RwLT5hc19zZHBfc3VwcG9ydGVkKSB7DQo+IMKgCQkJdTMy
IHByX2FscG1fY3RsID0NCj4gZ2V0X3ByX2FscG1fYXNfc2RwX3RyYW5zbWlzc2lvbl90aW1lKGNy
dGNfc3RhdGUpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9wc3JfcmVncy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9w
c3JfcmVncy5oDQo+IGluZGV4IDE2YTllM2FmMTk4ZC4uOGVjOTliYmQ4NGI2IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzcl9yZWdzLmgNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3JfcmVncy5oDQo+IEBAIC0y
OTksNyArMjk5LDkgQEANCj4gwqAjZGVmaW5lwqAgQUxQTV9DVExfRVhURU5ERURfRkFTVF9XQUtF
X01JTl9MSU5FUwkJNQ0KPiDCoCNkZWZpbmXCoA0KPiBBTFBNX0NUTF9FWFRFTkRFRF9GQVNUX1dB
S0VfVElNRShsaW5lcykJUkVHX0ZJRUxEX1BSRVAoQUxQTV9DVExfRVhURU5ERURfRkFTVF9XQUtF
X1RJTUVfTUFTSywobGluZXMpLUFMUE1fQ1RMX0VYVEVOREVEX0ZBU1RfV0FLRV9NSU5fTElORVMp
DQo+IMKgI2RlZmluZcKgDQo+IEFMUE1fQ1RMX0FVWF9MRVNTX1dBS0VfVElNRV9NQVNLCQlSRUdf
R0VOTUFTSyg1LCAwKQ0KPiArI2RlZmluZcKgDQo+IEFMUE1fQ1RMX0FVWF9MRVNTX1dBS0VfVElN
RV9NQVNLX1hFM0xQRAlSRUdfR0VOTUFTSyg3LCAwKQ0KPiDCoCNkZWZpbmXCoA0KPiBBTFBNX0NU
TF9BVVhfTEVTU19XQUtFX1RJTUUodmFsKQkJUkVHX0ZJRUxEX1BSRVAoQUxQTV9DVExfQVVYX0xF
U1NfV0FLRV9USU1FX01BU0ssdmFsKQ0KPiArI2RlZmluZcKgDQo+IEFMUE1fQ1RMX0FVWF9MRVNT
X1dBS0VfVElNRV9YRTNMUEQodmFsKQlSRUdfRklFTERfUFJFUChBTFBNX0NUTF9BVVhfTEVTU19X
QUtFX1RJTUVfTUFTS19YRTNMUEQsdmFsKQ0KPiDCoA0KPiDCoCNkZWZpbmUgX0FMUE1fQ1RMMl9B
CTB4NjA5NTQNCj4gwqAjZGVmaW5lIEFMUE1fQ1RMMihkZXZfcHJpdiwgdHJhbikJX01NSU9fVFJB
TlMyKGRldl9wcml2LCB0cmFuLA0KPiBfQUxQTV9DVEwyX0EpDQoNCg==
