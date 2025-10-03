Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7DACCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 19:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA6E10E164;
	Fri,  3 Oct 2025 19:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KayvypwB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469F410E164
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759521228; x=1791057228;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gvrg3KhHZaDJ5EMOQ66S9Ds7ZgkaPcOnYoufIQfbe7w=;
 b=KayvypwBqWlra1B/isRQIUfzQ4DK3TQ6xUtiso965FIVgNYvPNs036Fj
 rkfBcLHCJcezC8NPMmSPjz+U7ZasiLsiXAJdwrwrHXo3M1MGq+PXoL/C1
 7abzSSyIrl6BvvzPR86FB2Q325g9rRwV62R5Umd+J+O1p9KsnCd8Iqqmd
 KzjXod+tPNRHpb5+Kc7jddhtBj+ywGli8YbrTvE+G2TWpkhX79Gm3LnR+
 7jaThuU35unalgk33HH/bG2L4PckdKBWvFET/vkSXiDpYkVNUhhaeZozt
 Q19GyTWX6Q4zkrZN78RyV5TCIxFwvfD+QI/e89IDKyALf0+MyW2FZJhed g==;
X-CSE-ConnectionGUID: KInb5b0MRzilmT7Fe1XW7g==
X-CSE-MsgGUID: T2lyn0g1ReqtKd76z5amGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61724394"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61724394"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:53:47 -0700
X-CSE-ConnectionGUID: gVu2jh9BSNieJGTibY2faw==
X-CSE-MsgGUID: RxQccWS0QoGfc0TuTKDBjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="179788190"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 12:53:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 12:53:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 12:53:45 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 12:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyRC7UyBldMKY52oBfFe74mNJvIE47MpvxBhdxPLv1Iuw/sROJQhF6+8bCrneh+U5ERIXxm3uAR10UcsDKNapky3zE9C9ht0M4pcf6794k+owRST105GtfPh4PYMRbcloo1qMU5czfOO4qyAi2EXvUTzQvd12/Ho4dVuHbOgIHo6QqZbnyrtxYQp40RdPIGcWX6OjNj9jVmm9W7iC8ec2bWT/NI4LGDvy9jxVhfslUQ9lSSlO6P1qEnzXFPBNqcLrp7/SGvs0lwKaDxr89sdUW7ClxTYSMysWXkI8nxMA73oLPORlYsXvSM1mqi3FPKyGIK66RbUEJLKOt+mrrEc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvrg3KhHZaDJ5EMOQ66S9Ds7ZgkaPcOnYoufIQfbe7w=;
 b=II0R2rB1mN6GSynJEInYyO4evayEttYDjfQMAdObmkmTZVNplOg7Xvvi8J9Db+GzOoV/jXI5SnyUVW8eeQjgV72+h3JiU9sg7Yy+s9UWj2EXSUsY1bnSTtHT5PgblGLYiu7iLOrBxQMmCsT4DSLddoBxs2VxjS9y9JLJTdaaXsSfc6fy2cEAFx3QLX7OsCyVlXY1z0zc9fYdOopvL2gYOWL2Z0vMk5knHjygiAa7Lox3t8iOFs2kzCY7DrVM6B+Zu4EtoLp9emOWRB6vV7GKeOFcMfDOgRgSV9u1T9CY0yCybP6zhGZhHaowk5BSkPjk1ysevNHTktLc0RpfHKX3Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 19:53:38 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 19:53:38 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Thread-Topic: [PATCH 7/7] drm/xe: Check for GuC responses on disabling
 scheduling
Thread-Index: AQHcM/D4jvxlEfzKm0yKUDEcvHBvRrSwxlAAgAABPoCAAAtDgIAAAPsAgAAB+4CAAAEmAA==
Date: Fri, 3 Oct 2025 19:53:38 +0000
Message-ID: <650554f26c68c3be02c77db061d513b4f37f31b4.camel@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
 <20251002230444.313505-8-stuart.summers@intel.com>
 <aOAb0JnFULgND3ad@lstrano-desk.jf.intel.com>
 <65030659cc8fb5da4eaf4f28aa822bb149e0453f.camel@intel.com>
 <aOAmTW76SjtPpS73@lstrano-desk.jf.intel.com>
 <0e4a67db333a000b722e114ec52b8c8000db32e2.camel@intel.com>
 <aOAoyZGIpkEWXILt@lstrano-desk.jf.intel.com>
In-Reply-To: <aOAoyZGIpkEWXILt@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB8425:EE_
x-ms-office365-filtering-correlation-id: 3d72cb1d-e2ce-4e35-4ae1-08de02b68bba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UnlwalQ2ZlNlbzJaYTJxT3l5YzkxTVNrQ2lEOTUrTVVpZjJwdWFkZTliSGEx?=
 =?utf-8?B?RlB0cE93QVlkV0xENmk5RGhudEdsWTVNYzF2RGlIa3hpSy93dnVxU2NKZmEy?=
 =?utf-8?B?N25URW5VNXl0aFoxVDhRbGZnYy9Ga0ZUWGdITzF1U0NJK0FmZlN3QXdXcitG?=
 =?utf-8?B?S281dmUrcFFZWFp4Ri8vMm41cElNTFJMVlJjdHVzUCs3YVJVVW1jdDJvcjMz?=
 =?utf-8?B?MFRXV21HZzRIZjRLZGM1SUY5ZWNPSmhEYkhPSnc1R2tzVkVXTk9xaFdvcXl0?=
 =?utf-8?B?NE1weUxlbmRIMTZDT3dnRlFzQ1l0RDlTa3htUUZJMTQ5UTY1UDgxZHNMQ05D?=
 =?utf-8?B?VC9RaGFNVnVMY2w3bmZCREdJMCt2eWtzcFhTNVZVS2Z4OWlnU2E5dEVQU1cy?=
 =?utf-8?B?Z0hyUVpQNzNzdjk4dzY0cGpOUy9QVDlsRSs5ZFZxejdDVGg4YkpoRTZLQ1B0?=
 =?utf-8?B?WmlGN2dLWHJCak5DMXJkL2tqdktBempZQ25obUx6S055WG5Pd0kya0JrZXZo?=
 =?utf-8?B?MVlQMDR4U0JXVUJSMG5YV1pSa3JlVU9XYlAwL0pxcFFndE00eThvK05Wam44?=
 =?utf-8?B?MG1Dak1Nd2JlMXNLdWo5eTB6ekNGdHNOMnliM2hGZEx0Q1dCcExVZDYrMjEw?=
 =?utf-8?B?NFF0aWMzMFQ0WkV5Ym9OSjFrQjVnRFJoazYzQVZVeWdkQlFPeXhDblZ4WGxV?=
 =?utf-8?B?eThYeVo2Smc5c2tuaTU0QXRWdnZrUVJ6ajRFdSt5WjJjZW1jTFNxN2JMRUh5?=
 =?utf-8?B?eHRNN3dRTGtqNkl1WHFlUG9RU1FJNlJ4MDhXWjRYSzJQbjh6RERQS0RlcDQ0?=
 =?utf-8?B?NjFDbEkzQ0pWU1hlK1dwWWVaeklBREJiSUl3bXpQNEZHNk8yNy9ORnlJRTh0?=
 =?utf-8?B?M1hLb1FjT3FiTlp6Qzg4L2VLeExlVXpXdHppcUl2N1YvR3A5T1BPL1Nnc3FR?=
 =?utf-8?B?QWd2QUtzYUR0WDBBckg2VitFTXBpWkIzakdrZ1pEYi8zcXVkNUNEclpjVGZB?=
 =?utf-8?B?Sk5DMzRTNzRSZlVoM0xsWlFwV09CczlCak9hVFQ2RmtVcEVockZFeHpDVE13?=
 =?utf-8?B?Y0l3WlA4bGNydzlWNVJSbEJMWnlhSys5dVljL1J2RWJHb1lCeXlaOEw1Q2dU?=
 =?utf-8?B?VjQ4dk1Jdk1Tdjc4WWNybGlYRFdpeGFPQjdSK2Q4bU90QXFIUFVkTjJRMlZj?=
 =?utf-8?B?SDhMa3NHZ1ZvMjFMZ2ExamJqeWIvZjFTcHp3TjJvdE1RVXhWRnhjMytWdFBk?=
 =?utf-8?B?NS9BbEs1T25ZdHllQXpMbjFKZ2VjL1FGVG05MVBBb1FzMlhSeVRCMXluUW9U?=
 =?utf-8?B?Sitnc2tUdk03QjRuOUhsckRYZ0hoYWo3VFFkd2ozYWtCWFg4WE5FRzg3TThp?=
 =?utf-8?B?ZCtZSkxYWitaMjVMSnJVR3VKWGtVazF4SE5wQlBrVlpWNWVTRUdGNi9Ib1FE?=
 =?utf-8?B?RU9YdVk1WnpkWlVkbERoUDZ6YVgwVHVMd1ZpWC95enNIRUVGRUI2RWFMSVJP?=
 =?utf-8?B?NFAvZExaZFRvUTJiNTVrN0R5RE9DaXBoYTBwWmJIRC9NYzNEOUUyV0dWcE5q?=
 =?utf-8?B?Nm1oWGQyanZIUFJXeXE2WUtZS1p4VDVMTEdWUUZPRXpwRHpLcFE1M2s4U3Bh?=
 =?utf-8?B?bGNoTElsbEZoYjYwWERuZGtGZklFaG9mZEtrdkdzTnR2aEFWUTlHVGFGQ0tC?=
 =?utf-8?B?QW9kejAzZXZTQWZSRWhOWkd0TTVsQ3FRL1JoT1AyWGZWbHk5UnVmYWJrbmE0?=
 =?utf-8?B?VEU4cTNWY0lRVEc4Q0xoWGViazFjMGJDdWxNKzE3NC9pZjB0cDlSWUNIQWVh?=
 =?utf-8?B?Q2drTTNhRUZjUGQ0dllKd2VhSVVBZ3BLSnlYOEdiQVpjOTUrOWVPUDNRMXZB?=
 =?utf-8?B?NGpUalRMQ1htdHluOUFGSm12WWtxcEZrbjlablcya0FUWWtlVHR1clJjYWpk?=
 =?utf-8?B?eVdGTVN6MitWVXdNMjFBUmVxeXpWUUZ2NFNlYmx5MVRjZkFydUF0a1ZybUZk?=
 =?utf-8?B?UFVEZnFNK1U4UFdlRXkvaVEvZEc5SUdaTXlpczBwV2xyTlBJTXl4ZVg1emZ5?=
 =?utf-8?Q?a3AUYb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGl2WjlMNTBHSTVFeGZiRUVKdFZXb2pXWTJNUUQ3VW9hb29ackF0Q0NOUEZF?=
 =?utf-8?B?Rm5hY0RST2VwdkRJNlE4NktqY29jREZnOTI3VWFWejlvOStSS1cvZXRRZWJv?=
 =?utf-8?B?SHR2cjNqYkdxWU12TzBaRDFZWVBrRlZCeE9TRkpyVFN3MmsxdmVFRG5JWWVo?=
 =?utf-8?B?YWxUMlhsRWRyRDduUmlIVG1vT0lXVXA3Yi83U0FhZzBXZm9BRlEyUnhHYVNR?=
 =?utf-8?B?OGQ2Y2hlTWU3YTVreUswbFc3NHFYSDl5WDAvTHVodDNndGxOQU1NR0JhajM3?=
 =?utf-8?B?MU1kdFJ6dnB3RXpyNU84K29EdUVXT1gwNlNjaFJ2Wmo1bWlHZ3NvRURIRnFx?=
 =?utf-8?B?QzFyQW5PWGVaQm1XeUFmbm43dTZsODlLQmZkZjZnZklLOUpwdEppL2k4c3hl?=
 =?utf-8?B?Q3lVZmZScjZObTJPdm40UGZvN0JVZk5LR05xNURrNExpeFpRMllyZVlWVXMw?=
 =?utf-8?B?YkJUTkNScUJlTGE0WHc3bTZ6OXBBWkY2U01VWDZBQWFtZXhZNlZrRllHaDha?=
 =?utf-8?B?STVMdkQ0VmZsL25oOGp6b01SeXo3S1U5RXJGRlJRRFY3TmJORWRYYm1Kajgw?=
 =?utf-8?B?Y0YrSk85NGhSRWJWdWs4emJrVzQ4VzRKNTVST1daNXlXdUNTaU5WRjFOdE5V?=
 =?utf-8?B?VVZ2d1FMbHNFSlhvVlI0d3UrZUd3TU8xeFRlUEhDUWkwNCtWYWVHK2Nrb1NC?=
 =?utf-8?B?WVNQR3ZqdWRqdkZPc3htdzlzaUlwaml3QzNIbkxQSlBQYXpUOGRNOXVHaHJj?=
 =?utf-8?B?MG9zTEh3YklQdGRXMXZOVFdBeTZ3NkhLR0laMzJLMTB6dElmWFNBMkJvOFY0?=
 =?utf-8?B?dzgzbUVrZjN4S1VwemhKcG0xbnlRb2Y5YllBVFhsL3cwVk1VbW4yTTBabjcw?=
 =?utf-8?B?RXl0UytFdHZ1TXBrMVBIeG41aUhxdmlxTW5hOWhSQlZKMnZyUk0vcEkxcnpK?=
 =?utf-8?B?UmxkSlVXdFUwUEJuQTJMWkxnUFlkWnBqT0lmb1BkQ1JtSDR2MEFEcnhuN21v?=
 =?utf-8?B?bkFxbTBhMk44R2hTT2JwT2NZNEEvdG5XNlFlQWJHU0N1TWpNMmgxYk1qOEtT?=
 =?utf-8?B?N0MrTDV5bEdXaFU5d2wxWVpVcUJ5dVRsL09Vclo5MlZYR1Nsc3dmazJMTytX?=
 =?utf-8?B?Z0FHeDlDaXJiNHZGZ0xDWEhpSWN6OWpJcG9pV3RwRWdsUDRmSW5LTzB4TC9X?=
 =?utf-8?B?amUrTitmSEtMTlNlVnBSYWRMenRuaWNJT2lpb0pHVWRpdVpVczVxd1pmTDlo?=
 =?utf-8?B?R09abDFJTDNUMGttdmU3Q1ZpWWZwSDd1Nmg0SGxvTllsZmY3emJsZHNMQ2p1?=
 =?utf-8?B?aHBoY3g2M2gvWG9hMzR5cGdONGFHejRRODlSRDRIMlNmTTNMWTh3ZURQU1N4?=
 =?utf-8?B?a0hSeGgrU1ZZVm1CaDNpRG9icnFudGRFREU1d1J3NE05a3ZrT3pVRWl3czhy?=
 =?utf-8?B?a2luaENwWS95ck04dmxkMUxTUGJqK1k1b2Z3a3ZNV2RpQk4rM00vNFZGN1I1?=
 =?utf-8?B?UGY0SUorZHh6bm1LRVlqNVVDUmVuRHlRakN5VjR2d3AxSHN3ZktWVkRZOU8y?=
 =?utf-8?B?N0dpMVJTVkVvcCtHUThWK1RMU2VWVnZqUFRkK0tJV3NsYWNoc3hYSlUvN2wv?=
 =?utf-8?B?bUt6MzUyRHhMTXAzc2I4ZDZHM3Y4UElZdzZHUjB4VmVCYnhKekZLRzhKMW50?=
 =?utf-8?B?OG9wM1BEeHdBRUlrZ0ppRVVFRFZPd3hia3BLTFg0TGpjbFZxOUlEeFk3bjFp?=
 =?utf-8?B?N1VrQ2dScjhQWnFvZGFHcHcyWmJJQmYzMURZOHVTN3c4MzJqaE5KcW5vZFV1?=
 =?utf-8?B?WGFrSzhsNVBGZTdiN1NmYXZLRTBVWFhtZStlVkU1YVp1ZEVOcWdxYlh4MXlX?=
 =?utf-8?B?N1JibDRrTEZJWnZIT1VNc3p1aSt0cmZvR3Eza0xNZU1LMEhEQmUwN0gwL3dW?=
 =?utf-8?B?YmozMTJTWDZYUTM3Y0w0YzhUUkc4K0xXWFB2V0U3TWJNY0d0alNyTHhaZTU4?=
 =?utf-8?B?bUdUUUNrSmNvL09XdFBRK29EL3Rjbk9QOHJrb01LcE9Leit5aWh3M2xLZmFP?=
 =?utf-8?B?S3p0WE13L3V2UVlyc2Z6WTZSNktJclcvcGU4dHgyM2U4NUVLbGVKN3ExdlNO?=
 =?utf-8?B?a3Y4cXBxZFpRUU9xQWU4WmFRZitnTG5BYytIemE2RDhGZW1JSURVcTFFbUIr?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A65B026B8FCF041A2367F4BDD150DE3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d72cb1d-e2ce-4e35-4ae1-08de02b68bba
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 19:53:38.4409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uyoq1Adb1Jz5J9t73csytFQtB8kFHDqO/SzNTpaZf/x4V45FEf08uvq1/iQEy9rOkzw7050yUJcrreL3al8G8PjYx/8M9UAW1XfJFgRpfjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
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

T24gRnJpLCAyMDI1LTEwLTAzIGF0IDEyOjQ5IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIE9jdCAwMywgMjAyNSBhdCAwMTo0MjoyNlBNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDI1LTEwLTAzIGF0IDEyOjM4IC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gRnJpLCBPY3QgMDMsIDIwMjUgYXQgMTI6NTg6MzdQTSAt
MDYwMCwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIDIwMjUtMTAtMDMg
YXQgMTE6NTQgLTA3MDAsIE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+ID4gPiA+ID4gT24gVGh1LCBP
Y3QgMDIsIDIwMjUgYXQgMTE6MDQ6NDRQTSArMDAwMCwgU3R1YXJ0IFN1bW1lcnMNCj4gPiA+ID4g
PiB3cm90ZToNCj4gPiA+ID4gPiA+IEluIHRoZSBldmVudCB0aGUgR3VDIGJlY29tZXMgdW5yZXNw
b25zaXZlIGR1cmluZyBhDQo+ID4gPiA+ID4gPiBzY2hlZHVsaW5nDQo+ID4gPiA+ID4gPiBkaXNh
YmxlIGV2ZW50LCB3ZSBzdGlsbCB3YW50IHRoZSBkcml2ZXIgdG8gYmUgYWJsZSB0bw0KPiA+ID4g
PiA+ID4gcmVjb3Zlci4NCj4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggZm9sbG93cyB0aGUgc2FtZSBt
ZXRob2RvbG9neSB3ZSBhbHJlYWR5IGhhdmUgaW4NCj4gPiA+ID4gPiA+IHBsYWNlDQo+ID4gPiA+
ID4gPiBmb3IgVExCIGludmFsaWRhdGlvbiByZXF1ZXN0cywgd2hlcmUgd2Ugc2VuZCBhIHJlcXVl
c3QgdG8NCj4gPiA+ID4gPiA+IEd1Qw0KPiA+ID4gPiA+ID4gYW5kIHdhaXQgZm9yIHRoYXQgaW52
YWxpZGF0aW9uIGRvbmUgcmVzcG9uc2UuIElmIHRoZQ0KPiA+ID4gPiA+ID4gcmVzcG9uc2UNCj4g
PiA+ID4gPiA+IGRvZXNuJ3QgY29tZSBiYWNrIGluIHRpbWUgd2UgdGhlbiBhdCBsZWFzdCBwcmlu
dCBhIG1lc3NhZ2UNCj4gPiA+ID4gPiA+IGluZGljYXRpbmcgdGhlIGludmFsaWRhdGlvbiBmYWls
ZWQgZm9yIHNvbWUgcmVhc29uLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJbiB0aGlzIGNh
c2UsIHdlIHNlbmQgdGhlIHNjaGVkdWxlIGRpc2FibGUgYW5kIHRoZQ0KPiA+ID4gPiA+ID4gZXhw
ZWN0YXRpb24NCj4gPiA+ID4gPiA+IGlzIHRoYXQgR3VDIHdpbGwgcmVzcG9uZCB3aXRoIGEgc2No
ZWR1bGUgZG9uZSByZXNwb25zZS4gVGhlDQo+ID4gPiA+ID4gPiBLTUQNCj4gPiA+ID4gPiA+IHRo
ZW4gY2F0Y2hlcyB0aGF0IHJlc3BvbnNlIGFuZCBpbiB0dXJuIHNlbmRzIGEgY29udGV4dA0KPiA+
ID4gPiA+ID4gZGVyZWdpc3RyYXRpb24NCj4gPiA+ID4gPiA+IHJlc3BvbnNlLiBTbyBpbiB0aGUg
ZXZlbnQgR3VDIGJlY29tZXMgdW5yZXNwb25zaXZlIGFmdGVyIHdlDQo+ID4gPiA+ID4gPiBzZW5k
DQo+ID4gPiA+ID4gPiB0aGUgc2NoZWR1bGUgZGlzYWJsZSwgd2UgYWN0dWFsbHkgaGF2ZSB0d28g
ZzJoIHJlc3BvbnNlcw0KPiA+ID4gPiA+ID4gdGhhdA0KPiA+ID4gPiA+ID4gaGF2ZSBiZWVuIHJl
c2VydmVkIGJ1dCBuZXZlciByZWNlaXZlZC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVG8g
aGFuZGxlIHRoaXMsIG1ha2Ugc3VyZSB0aGUgcGVuZGluZyBkaXNhYmxlIGV2ZW50IGluIHRoZQ0K
PiA+ID4gPiA+ID4gZXhlYyBxdWV1ZSBnZXRzIGNsZWFyZWQgKGkuZS4gd2UgcmVjZWl2ZWQgdGhh
dCByZXNwb25zZQ0KPiA+ID4gPiA+ID4gZnJvbQ0KPiA+ID4gPiA+ID4gR3VDKS4gSWYgaXQgZG9l
c24ndCBpbiBhIHJlYXNvbmFibGUgYW1vdW50IG9mIHRpbWUsIGFzc3VtZQ0KPiA+ID4gPiA+ID4g
R3VDIGlzIGRlYWQ6IGJhbiB0aGUgZXhlYyBxdWV1ZSwgcXVldWUgdXAgYSBHVCByZXNldCwgYW5k
DQo+ID4gPiA+ID4gPiBtYW51YWxseSBjYWxsIHRoZSBzY2hlZHVsZSBkb25lIGhhbmRsZXIuIFRo
ZW4gaW4gdGhlDQo+ID4gPiA+ID4gPiBzY2hlZHVsZQ0KPiA+ID4gPiA+ID4gZG9uZSBoYW5kbGVy
LCBpbiB0dXJuLCBjaGVjayB3aGV0aGVyIHRoZSBjb250ZXh0IGhhZCBiZWVuDQo+ID4gPiA+ID4g
PiBiYW5uZWQuIElmIHNvLCBtYW51YWxseSBjYWxsIHRoZSBkZXJlZ2lzdHJhdGlvbiBkb25lDQo+
ID4gPiA+ID4gPiBoYW5kbGVyDQo+ID4gPiA+ID4gPiB0byBlbnN1cmUgYWxsIHJlc291cmNlcyBy
ZWxhdGVkIHRvIHRoYXQgZXhlYyBxdWV1ZSBnZXQNCj4gPiA+ID4gPiA+IGNsZWFuZWQgdXAgcHJv
cGVybHkuIFdpdGhvdXQgdGhpcywgaWYgdGhlIGRldmljZSBiZWNvbWVzDQo+ID4gPiA+ID4gPiB3
ZWRnZWQgYWZ0ZXIgYW4gZXhlYyBxdWV1ZSBoYXMgYmVlbiBjcmVhdGVkLCB0aGUgYXR0YWNoZWQN
Cj4gPiA+ID4gPiA+IHJlc291cmNlcyBsaWtlIHRoZSBMUkMgd2lsbCBub3QgZ2V0IGZlZWQgcHJv
cGVybHkgcmVzdWx0aW5nDQo+ID4gPiA+ID4gPiBpbiBhIG1lbW9yeSBsZWFrLg0KPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1
bW1lcnNAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAyMw0KPiA+ID4gPiA+ID4gKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gPiA+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4gPiA+ID4gaW5kZXggNDViNzJiZWJm
YzYzLi5hMTc3ZDg3Yzg1MjQgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+ID4gPiBAQCAtOTM5LDYgKzkzOSw5IEBAIGludCB4
ZV9ndWNfcmVhZF9zdG9wcGVkKHN0cnVjdCB4ZV9ndWMNCj4gPiA+ID4gPiA+ICpndWMpDQo+ID4g
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdVQ19DT05URVhUXyMjZW5h
YmxlX2Rpc2FibGUswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiA+ID4gPiA+ID4gwqDC
oMKgwqANCj4gPiA+ID4gPiA+IMKgwqDCoMKgDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgXA0KPiA+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gPiAr
c3RhdGljIHZvaWQgaGFuZGxlX3NjaGVkX2RvbmUoc3RydWN0IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QN
Cj4gPiA+ID4gPiA+IHhlX2V4ZWNfcXVldWUgKnEsDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyIHJ1bm5hYmxl
X3N0YXRlKTsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+IMKgc3RhdGljIHZvaWQgZGlzYWJs
ZV9zY2hlZHVsaW5nX2RlcmVnaXN0ZXIoc3RydWN0IHhlX2d1Yw0KPiA+ID4gPiA+ID4gKmd1YywN
Cj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0DQo+ID4gPiA+ID4g
PiB4ZV9leGVjX3F1ZXVlDQo+ID4gPiA+ID4gPiAqcSkNCj4gPiA+ID4gPiA+IMKgew0KPiA+ID4g
PiA+ID4gQEAgLTk3NCw2ICs5NzcsMTcgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gPiA+IGRpc2Fi
bGVfc2NoZWR1bGluZ19kZXJlZ2lzdGVyKHN0cnVjdCB4ZV9ndWMgKmd1YywNCj4gPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqB4ZV9ndWNfY3Rfc2VuZCgmZ3VjLT5jdCwgYWN0aW9uLA0KPiA+ID4g
PiA+ID4gQVJSQVlfU0laRShhY3Rpb24pLA0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRzJIX0xFTl9EV19TQ0hFRF9DT05URVhUX01PREVf
U0VUICsNCj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEcySF9MRU5fRFdfREVSRUdJU1RFUl9DT05URVhULCAyKTsNCj4gPiA+ID4gPiA+ICsN
Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHdhaXRfZXZlbnRfdGltZW91dChndWMt
PmN0LndxLA0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gPiA+ID4gPiAhZXhlY19xdWV1ZV9wZW5k
aW5nX2Rpc2FibGUocSkNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9n
dWNfcmVhZF9zdG9wcGVkKGd1YyksDQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSFogKiA1KTsNCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiBUaGlzIGRvZXNuJ3QgbG9vayByaWdodC4gRGVyZWdpc3RlciBpcyBk
ZXNpZ25lZCB0byBiZSBmdWxseQ0KPiA+ID4gPiA+IGFzeW5jLiBJZg0KPiA+ID4gPiA+IHRoaXMg
ZmxvdyBzdG9wcyB3b3JraW5nIGZvciB3aGF0ZXZlciByZWFzb24gdGhlIEd1QyBpcyBkZWFkDQo+
ID4gPiA+ID4gYW5kDQo+ID4gPiA+ID4gZXZlbnR1YWxseSBzb21ld2hlcmUgaW4gZHJpdmVyIHdp
bGwgZGV0ZWN0IHRoaXMgYW5kIHRyaWdnZXIgYQ0KPiA+ID4gPiA+IEdUDQo+ID4gPiA+ID4gcmVz
ZXQNCj4gPiA+ID4gPiB3aGljaCBpcyBjbGVhbnVwIGFsbCBsb3N0IEgyRy4NCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcmV0IHx8IHhlX2d1Y19yZWFkX3N0b3Bw
ZWQoZ3VjKSkgew0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X2d0X3dhcm4oZ3VjX3RvX2d0KGd1YyksICJTY2hlZHVsZQ0KPiA+ID4gPiA+ID4gZGlzYWJsZQ0K
PiA+ID4gPiA+ID4gZmFpbGVkDQo+ID4gPiA+ID4gPiB0byByZXNwb25kIik7DQo+ID4gPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2V0X2V4ZWNfcXVldWVfYmFubmVkKHEp
Ow0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGhhbmRsZV9zY2hl
ZF9kb25lKGd1YywgcSwgMCk7DQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgeGVfZ3RfcmVzZXRfYXN5bmMocS0+Z3QpOw0KPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgfQ0KPiA+ID4gPiA+ID4gwqB9DQo+ID4gPiA+ID4gPiDCoA0KPiA+ID4gPiA+ID4gwqBzdGF0
aWMgdm9pZCB4ZV9ndWNfZXhlY19xdWV1ZV90cmlnZ2VyX2NsZWFudXAoc3RydWN0DQo+ID4gPiA+
ID4gPiB4ZV9leGVjX3F1ZXVlDQo+ID4gPiA+ID4gPiAqcSkNCj4gPiA+ID4gPiA+IEBAIC0yMTE3
LDYgKzIxMzEsOCBAQCBnMmhfZXhlY19xdWV1ZV9sb29rdXAoc3RydWN0IHhlX2d1Yw0KPiA+ID4g
PiA+ID4gKmd1YywNCj4gPiA+ID4gPiA+IHUzMg0KPiA+ID4gPiA+ID4gZ3VjX2lkKQ0KPiA+ID4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBxOw0KPiA+ID4gPiA+ID4gwqB9DQo+ID4gPiA+
ID4gPiDCoA0KPiA+ID4gPiA+ID4gK3N0YXRpYyB2b2lkIGhhbmRsZV9kZXJlZ2lzdGVyX2RvbmUo
c3RydWN0IHhlX2d1YyAqZ3VjLA0KPiA+ID4gPiA+ID4gc3RydWN0DQo+ID4gPiA+ID4gPiB4ZV9l
eGVjX3F1ZXVlICpxKTsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+IMKgc3RhdGljIHZvaWQg
ZGVyZWdpc3Rlcl9leGVjX3F1ZXVlKHN0cnVjdCB4ZV9ndWMgKmd1YywNCj4gPiA+ID4gPiA+IHN0
cnVjdA0KPiA+ID4gPiA+ID4geGVfZXhlY19xdWV1ZSAqcSkNCj4gPiA+ID4gPiA+IMKgew0KPiA+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBhY3Rpb25bXSA9IHsNCj4gPiA+ID4gPiA+IEBA
IC0yMTMxLDcgKzIxNDcsMTIgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gPiA+IGRlcmVnaXN0ZXJf
ZXhlY19xdWV1ZShzdHJ1Y3QNCj4gPiA+ID4gPiA+IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QgeGVfZXhl
Y19xdWV1ZSAqcSkNCj4gPiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
dHJhY2VfeGVfZXhlY19xdWV1ZV9kZXJlZ2lzdGVyKHEpOw0KPiA+ID4gPiA+ID4gwqANCj4gPiA+
ID4gPiA+IC3CoMKgwqDCoMKgwqDCoHhlX2d1Y19jdF9zZW5kX2cyaF9oYW5kbGVyKCZndWMtPmN0
LCBhY3Rpb24sDQo+ID4gPiA+ID4gPiBBUlJBWV9TSVpFKGFjdGlvbikpOw0KPiA+ID4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKGV4ZWNfcXVldWVfYmFubmVkKHEpKSB7DQo+ID4gPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaGFuZGxlX2RlcmVnaXN0ZXJfZG9uZShndWMs
IHEpOw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoaXMgd291bGQgbGVhdmUgdGhlIEd1QyB3aXRo
IHJlZmVyZW5jZSB0byBndWNfaWQgYW5kDQo+ID4gPiA+ID4gc3Vic2VxdWVudA0KPiA+ID4gPiA+
IHJldXNlDQo+ID4gPiA+ID4gb2YgdGhlIGd1Y19pZCAoaS5lLiwgbmV4dCByZWdpc3Rlcikgd2ls
bCBmYWxsLg0KPiA+ID4gPiANCj4gPiA+ID4gQnV0IGFnYWluLCBpbiB0aGlzIGNhc2UgdGhlIEd1
QyBpcyBkZWFkIGFuZCB3ZSBzaG91bGQgYmUNCj4gPiA+ID4gZ2V0dGluZw0KPiA+ID4gPiB0aGF0
DQo+ID4gPiA+IHJlc2V0IGV2ZW50IHlvdSBoYWQgbWVudGlvbmVkIGFib3ZlLiBUaGUgaXNzdWUg
SSdtIGhhdmluZyBpcw0KPiA+ID4gDQo+ID4gPiBCYW5uZWQgaXMgYSBwZXIgdGhpbmcgcXVldWUg
YW5kIG1vcmUgdGhhbiBsaWtlbHkgd2Ugd29udCBiZSBkb2luZw0KPiA+ID4gYQ0KPiA+ID4gR1QN
Cj4gPiA+IHJlc2V0LCB0aHVzIHdlIHN0aWxsIG5lZWQgcmVtb3ZlIHJlZmVyZW5jZXMgdG8gdGhl
IHF1ZXVlIGZyb20gdGhlDQo+ID4gPiBHdUMuDQo+ID4gDQo+ID4gWWVhaCB0aGlzIG1ha2VzIHNl
bnNlIHRvIG1lLiBNeSB1c2Ugb2YgImJhbm5lZCIgaGVyZSB3YXMgcHJvYmFibHkNCj4gPiBub3QN
Cj4gPiBpZGVhbC4NCj4gPiANCj4gPiA+IA0KPiA+ID4gPiBzcGVjaWZpY2FsbHkgYXJvdW5kIHdl
ZGdlIGV2ZW50cy4gV2l0aG91dCBhIEdUIHdlZGdlLCB3ZSB3aWxsDQo+ID4gPiA+IG5vcm1hbGx5
DQo+ID4gPiA+IGdvIHRocm91Z2ggdGhlIEdUIHJlc2V0IGZsb3cgYW5kIHJlY292ZXIgbGlrZSB5
b3UgbWVudGlvbmVkLg0KPiA+ID4gPiBCdXQgaW4NCj4gPiA+ID4gdGhlDQo+ID4gPiANCj4gPiA+
IE5vLiBTZWUgYWJvdmUuDQo+ID4gPiANCj4gPiA+ID4gY2FzZSBvZiBhIHdlZGdlLCB3ZSBkb24n
dCByZWRvIHRoZSBzb2Z0d2FyZSBwYXJ0IG9mIHRoZSByZXNldA0KPiA+ID4gPiAoaS5lLg0KPiA+
ID4gPiB3ZQ0KPiA+ID4gPiBkb24ndCByZXNldCBjb250ZXh0cywgZXRjKSBwZXIgZ3RfcmVzZXQo
KToNCj4gPiA+ID4gc3RhdGljIGludCBndF9yZXNldChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+ID4g
PiB7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBmd19yZWY7DQo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgIGludCBlcnI7DQo+ID4gPiA+IA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oCBpZiAoeGVfZGV2aWNlX3dlZGdlZChndF90b194ZShndCkpKQ0KPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FQ0FOQ0VMRUQ7DQo+ID4gPiA+IA0KPiA+ID4g
PiBNYXliZSBpbnN0ZWFkIG9mIGJhbm5lZCBJIGNhbiBjaGVjayBmb3IgYmFubmVkIGFuZCB3ZWRn
ZWQgaGVyZT8NCj4gPiA+ID4gT3INCj4gPiA+ID4gbWF5YmUgd2Ugc2hvdWxkIHJldGhpbmsgdGhl
IHNvZnR3YXJlIHJlc2V0IGZsb3cgaW4gdGhlIGV2ZW50IG9mDQo+ID4gPiA+IGENCj4gPiA+ID4g
d2VkZ2U/DQo+ID4gPiANCj4gPiA+IFRoZSBpZGVhIHdpdGggd2VkZ2VkIGlzIHdlIGxlYXZlIGFs
bCBoYXJkd2FyZCBzdGF0ZSwgaW5jbHVkaW5nDQo+ID4gPiB0aGUNCj4gPiA+IEd1QywNCj4gPiA+
IGludGFjdGVkIGZvciBpbnNwZWN0aW9uLiBTbyBJIHRoaW5rIGEgeGVfZGV2aWNlX3dlZGdlZCBj
aGVja2VkDQo+ID4gPiBoZXJlDQo+ID4gPiBtYWtlcyBzZW5zZS4gVGhpcyB3b3VsZCBjb3ZlciB0
aGUgY2FzZSB3aGVyZSBzdGFydCBhIHF1ZXVlDQo+ID4gPiB0ZWFyZG93bg0KPiA+ID4gdmlhDQo+
ID4gPiBhIENMRUFOVVAgbWVzc2FnZSBhbmQgbWlkLWZsb3cgd2Ugd2VkZ2UgdGhlIGRldmljZS4N
Cj4gPiANCj4gPiBCdXQgaGFyZHdhcmUgc3RhdGUgZG9lc24ndCBtZWFuIHNvZnR3YXJlIHN0YXRl
LiBBcmUgeW91IHNheWluZyB3aGVuDQo+ID4gdGhlDQo+ID4gZGV2aWNlIGlzIHdlZGdlZCB3ZSB3
YW50IHRoZSBtZW1vcnkgdG8gYWxsIGJlIGludGFjdCBhcyB3ZWxsPyBBbmQNCj4gPiBob3cNCj4g
PiBkbyB3ZSBkZXRlcm1pbmUgd2hlbiB0aGF0IGdldHMgZnJlZWQ/IE9uIHVuYmluZD8NCj4gDQo+
IFdoZW4gd2Ugd2VkZ2UgYSBkZXZpY2Ugd2UgdGFrZSBhIHJlZmVyZW5jZSB0byBhbGwgcXVldWVz
IHdoaWNoDQo+IHBlcnNlcnZlcw0KPiB0aGUgc29mdHdhcmUgcXVldWUgc3RhdGUgYW5kIGFsc28g
cHJldmVudHMgYW55IHF1ZXVlIGNsZWFudXAgZmxvd3MNCj4gcmVnYXJkbGVzcyBvZiB3aGF0IGEg
dXNlciBhcHBsaWNhdGlvbiBkb2VzLiBPbiBkcml2ZXIgdW5iaW5kIGFmdGVyDQo+IHdlZGdlDQo+
IHdlIGRyb3Agd2VkZ2UgcmVmZXJlbmNlIHdoaWNoIHNob3VsZCBmcmVlIGFsbCBtZW1vcnkgaW4g
dGhlIEtNRC4NCg0KT2sgdGhhdCBtYWtlcyBzZW5zZSB0aGVuLiBJIGRvbid0IHRoaW5rIHRoaXMg
aXMgaGFwcGVuaW5nIGNvcnJlY3RseSBpZg0KdGhhdCdzIHRoZSBjYXNlIChzaW5jZSB3ZSByZWx5
IG9uIHRoYXQgR1QgcmVzZXQgZm9yIG1vc3Qgb2YgdGhpcykuIEknbGwNCmZpeCBmcm9tIHRoaXMg
YW5nbGUgaGVyZSAtIGxpa2VseSBhcHBsaWVzIHRvIGJvdGggb2YgdGhlc2UgbGFzdCB0d28NCnBh
dGNoZXMuLi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gDQo+ID4g
VGhhbmtzLA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBNYXR0DQo+ID4gPiANCj4g
PiA+ID4gDQo+ID4gPiA+IFRoYW5rcywNCj4gPiA+ID4gU3R1YXJ0DQo+ID4gPiA+IA0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IE1hdHQNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoH0gZWxzZSB7DQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
eGVfZ3VjX2N0X3NlbmRfZzJoX2hhbmRsZXIoJmd1Yy0+Y3QsDQo+ID4gPiA+ID4gPiBhY3Rpb24s
DQo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiA+ID4gPiA+ID4gQVJS
QVlfU0laRShhY3Rpb24pKTsNCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ID4g
PiA+IMKgfQ0KPiA+ID4gPiA+ID4gwqANCj4gPiA+ID4gPiA+IMKgc3RhdGljIHZvaWQgaGFuZGxl
X3NjaGVkX2RvbmUoc3RydWN0IHhlX2d1YyAqZ3VjLCBzdHJ1Y3QNCj4gPiA+ID4gPiA+IHhlX2V4
ZWNfcXVldWUgKnEsDQo+ID4gPiA+ID4gPiAtLSANCj4gPiA+ID4gPiA+IDIuMzQuMQ0KPiA+ID4g
PiA+ID4gDQo+ID4gPiA+IA0KPiA+IA0KDQo=
