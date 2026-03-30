Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FCEFF4955
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 07:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2831110E2F1;
	Mon, 30 Mar 2026 07:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nmh3pE50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326B710E1EB
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774854875; x=1806390875;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fTkzyrwSusuuZKv8AwFY/q7fVemkUrLQpZCTP8c2Ncg=;
 b=Nmh3pE50Mnx0MuDV1/ld7239pGmiLjhS3O+q583kG7ScczMNcFmr7lqE
 PKm4yKQFBS1EUNXWpYwawHDTLeO8XoCP09uXnyzk0DSPz4ERQaDmYb58Y
 sphHqpSSBkJdn/8ufRvMVTWaSqzEPpNKW2E8q17EfumBicD3nxiFK1FOK
 esRDWWmTY9fbPk0o1S0PjXmJ1MfEGFI2TUKA3xHg6plYr4/5GnSdSnRtl
 ZhAnkGvn4eRrpdn7ubOiYJnR71/R2lg+Ar9TUejgapskKquDwG3C8f9Ua
 pijZIlFaQdSWHZb0+BSZYwhedT1BOy7sl2JJKfqbU5hcx0eomL1fmuEh2 w==;
X-CSE-ConnectionGUID: ZVAvhIZmQYe0vJz0ejuqNA==
X-CSE-MsgGUID: oDFvlppQR5ud1DFndSU4tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75735604"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75735604"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:14:35 -0700
X-CSE-ConnectionGUID: sMjg2tYjQnaEmYuzY/iT1A==
X-CSE-MsgGUID: s2FXHIQwSuqCXzq+NHMBIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="224990935"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:14:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:14:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 00:14:33 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 00:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2Pw1Yk2hRxbdZaZwdPvebRuotfrDerrNwuoQ1M5Du5pMwghf7W4Uvjh3649DmCAEgDNK0+KC2iP32mdV6NiUvNqeiJx5455gV0XyIgkTd1hr5p5grRRgoQUJQObrc/M3IvgipYvRdlwV7bTJK5Re7WcDe9gsnYbfUM5SBZ+mY14bA8htkEvDvjmZjku8/4ACztmdcon0J0aJVn/AknLUP9U7wnK4M3mlwrZA20EW8QJXuwvOOEbR9S3s+1c3/YQ5IWYhgcZn46tl9f2rmoQ24hcbIKQ9b6/01oXjPIE7xwrl3TVSCBgtcHHIEuJfgeaWpiF19Xe0nWy+b8a9wUeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTkzyrwSusuuZKv8AwFY/q7fVemkUrLQpZCTP8c2Ncg=;
 b=XyUW+9ifH9zjq5g1nAGP8naO49k78otAKcoQGUR+e7KRDKICDWKUrjSrbzKBKDUroLfptwVbK4US2uSUCs2W31EdUe9fCQJs0+OIC8DlM5JivLHNg1mM0g3pG/0KQs8MnVayRJymfuboCpXWzD6WeMwrTdiPC/ZPbnd6woWAx5lo22k98N1kU2ZgWJ6UmBdNlYzB4BGspiBfcXAkzPaXRWq0iwOwfxZU/kRwg0UiAWOjG4I3/AQv0HLb78hy9POv3phb9LQLfzw3Cz/wkwyHCBKIIBA1caJnIEVcEGtuEJ1FGICd/7zVghl1cU1MrKXWH4ABo85NtdHNLWzUhjMHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by PH3PPF632600ADB.namprd11.prod.outlook.com (2603:10b6:518:1::d27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 30 Mar
 2026 07:14:24 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 07:14:24 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/5] drm/xe: Add missing include guards to unprotected
 headers
Thread-Topic: [PATCH 1/5] drm/xe: Add missing include guards to unprotected
 headers
Thread-Index: AQHctlmsIgTj4niDpUKgF6930noKAbXGu8Dg
Date: Mon, 30 Mar 2026 07:14:24 +0000
Message-ID: <SA3PR11MB8118F9D938BFFBBB4A1CAAB9D052A@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
 <20260317215732.2208976-8-shuicheng.lin@intel.com>
In-Reply-To: <20260317215732.2208976-8-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|PH3PPF632600ADB:EE_
x-ms-office365-filtering-correlation-id: 70e800ce-2bde-403c-44ee-08de8e2bf8ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: x3WHjTArGf2k0dRC5ivbjPDw/Zj0Z9REGliCpzKPj3z8nwyikBKQmav8g9eQeMGlT6AWn/HjiLbPjfFANdRZa1AG9UfhcKSItp7Zs7oZe4HzVmGNc8+vycD7uFzl4/Oi0zvmf6OAQ3x6DLQqi9q8rf279/gczaxVRjvuV2MZvyhjDUYI2aTPtUtRxBJauxIZxsQZ3oxwtNRxDhorq75gP0U3PvVixgsh1RSuff4TmOL1NphHr4LqQZ4oYeROGLlwl5MIWt09RQfvp5LYMKvfXYSRo3NgyZtlAMJ/JenHIEs3nsQn3NV6hvtAkfQUSoFSTNFXJhsEbOq8Qk2vvhjYvRuxIN7aTHbkl9DbFIUYvR7qeP/sU9pjqh/ocDOHt694u4n1Y5FH0PAhLPq+/JsxRRLaarT6Ijl/Qha0mRzufwSCbVhz0yNePmL+GFFEwT44xTpnEgUtQrWKZt5pP0prV3WwusOUNxie7io2ccLakqfq24DcthtJDD+vs9x+oxycF/jXFA13G4k7XACT4rSUbSCMGYKr8M/zw7egXc7LjaccQPZJYXLgW60zWwtlYINJxxvYCcHHfLLBvnvzFNnjosNAcd8isq72jdXObI8a9LvQMg8x3Ge61Hf+BL+Qpab52sANNI1C5duH1WTx4H1UT1hc7rkM6EhMEvCArYvEG/K2p1ytIginNgqS2oDoJ4n3PZvy/qk0GeY2zreuLVAViFue7uicxkGTlOR5JmCloP01QRybqAhf+/PLBw+gGYbdPKclqCF6xFc+GAbJy0aZFosrD0QvFUs4lABiomiPEow=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlpnUFZBWHZEWElvbWhkZzhOUUlNWmErdmVoSSs3RksydnAxa1czYkhEdjU0?=
 =?utf-8?B?dm9yZ3FXSmZnZFNqNXFLTk9sakVGMjVkdHJRTTZGUjJ6aDBlRWZCVUVoc3RQ?=
 =?utf-8?B?ZFBGeXV6K3lVYnQ5ZEtWYXRnWTNKNHRFL0FkVmxYcFMrcjFuUHNwOU8yVitj?=
 =?utf-8?B?cDJuZUdTZloxSTdYakJiTGpjdExGb3ErN1FUT0V5UU9RNmNuYjFVNWNJS0kx?=
 =?utf-8?B?OXNjampMcGFod0tVbHRLTXNaMWhackdvcExHcTdiTno4TDhyUzZxKzFUUDRG?=
 =?utf-8?B?TXhQSUJxK0VxcmJucHNGN1hEaThlS3dvTXRrZTVrY0VNcXFObG9ETzU0SEo1?=
 =?utf-8?B?eGY3blFrT2FHYS9uUjdxTHFiYXdMZE9ESTdWb25hMGNKbVdXcHFJRkFaZ3o2?=
 =?utf-8?B?MVBqanBGcTFGZmtyNDN4L0poSUlQZit0anF0dWRHL2pCMWlmZXUvUmdRRjVm?=
 =?utf-8?B?dVJCZ1IwSEgrZFkyTTFDMnJPejVOMkF1UXhPR3g5R1NOUkZjd3ZkRElIbkF1?=
 =?utf-8?B?YlNlV1ZGRGdYQXl1WVB2KzRpdk5WSGs3UzhZbWxGL1hzRUgxQ0h3VWtUZjRN?=
 =?utf-8?B?YmxrWENldVVKc0pnR1FqdWJLUVdGdklZYnlGODIrYkIyL0lsSGlzOEdaOTd3?=
 =?utf-8?B?KzhFcWR5cDJOMGlLNGFqbWx0UHFmSTRJcWJXR0F1eWFUY2FNc00ybjZ0ZTRx?=
 =?utf-8?B?VExkTkRYRXdxSXJaSkhkc0FhdlFRWStULzRBT1llZmR1ekllQlhYcTI5eURB?=
 =?utf-8?B?NWxKSkJqUXJNTzV3M2FSb1ZzMXlWT1ZNY2FTVkZ6ajJkcGd0bDNzbHRPaHhU?=
 =?utf-8?B?Ym1iNnRxM2x1dzV3MXArZVg5SXNlYVBOS3NFZmtvb1ZSMTBvZFVIVTJzQUU5?=
 =?utf-8?B?OURPVnY2OHo1bXZBRXdoSTRQZ3hwenArU3lNY0FMbW54NDNTTUZrdUh2RG1U?=
 =?utf-8?B?bEY2UjhoR29EaDVGMmlJZmRtV3VKdC8xOFpnQ3NMck5oTHZBSzZqWThTS1FY?=
 =?utf-8?B?c0VHYXJEbEVPaFFEL2poWXZKNTYvSTc1b0tsVU42ZFRudGpjeGhJS2drMDE2?=
 =?utf-8?B?YTVqcTdFMllrcVl0eWRYMGIzWkQ5TnloSXZrSEdNSTc4NFhrTkpseUorUGxB?=
 =?utf-8?B?bVJwWmM3dnRSV1VHbDZ0bHZUaGpnUUpHL0N1MnRGWjU1d3hFVVlZdEw5R1lq?=
 =?utf-8?B?WG4wZ2xDWE5iRzZ3dE41S0dQcVBPcFBQRzhyZTMzNmtVbWgrcTlGeU8zK0Ft?=
 =?utf-8?B?cUdvajcveFBLU2RsQ3Q0OHowMHlaOHdIM2hnUWh0YTYwaDUwTVl3bTRobHlI?=
 =?utf-8?B?dGhoOFdHaFFQbXFQdXYvdFRKS01KSU5ZdWxSaUF5Q2RRTnlxZTRGNkRDT0ZS?=
 =?utf-8?B?UitWUS9WOWF1RkRZTG84R3N6NzdaMW4xTjIyWFU5bmpLMCtOQjJKTnFKRlIr?=
 =?utf-8?B?b05EZE1oNWV3TzBYZUZwdFFXQ2pCRUlodTROUmF6TURpOGR5bU95d0RUbG5u?=
 =?utf-8?B?ZTRJTHV1UkNSc0Q5cE5QQmlhTGRxVWV4L2NydjRrWTIxWkZmK05NK2VFMXNh?=
 =?utf-8?B?RzZvRERCK2E3RjlWS3hhdU5kSHlwcjl1OVZucjhkL0dxdnhtZUk2NGJTTTVu?=
 =?utf-8?B?S0lMTjhJZTNFcW5oSnoyazFlZkRiZVVqMSttcVpVaGs4cDRqQkhKTSs0QWZp?=
 =?utf-8?B?Zkw1RDVHZWZtSFFuRVdwRE5qdWZkb1FoQ2xvYXMwckdOTVdYUnRUY015WXdW?=
 =?utf-8?B?ZXJEckxJbWJnMUJuTVRWTHE2ZitzRFhISm4xZ0pEVStYeThBNHRlM0VOSG5Y?=
 =?utf-8?B?R040YlNQOGZNNTF4R1l6S0I4dFE5YW5KQUtXOGxSTkxzYlR5eG9zeG9QbHpN?=
 =?utf-8?B?VlJtbnd2OXRRVDl1aEZheG9BZWNydFJUSk5KSHNVQ3JYK3FEbXV6S0NqRzBS?=
 =?utf-8?B?RUdCMlBCeXVzT05YQ1c4dlBKRkJva2w5b1FhbWxPdzhRYnowMk8xQXpoTm5D?=
 =?utf-8?B?Vzh0aTNaQVpiWFdqZWsrc3VYZFBXc0hmSFZPZyttM1VveXhjaFlXaXFUemRH?=
 =?utf-8?B?a3lDVSs5dkNpZHl6UitxcmErMTV0S0RORDRmV3VPVCtXYXZVL1Bzbjh1eHV3?=
 =?utf-8?B?SVA4eUkrOTlpbWJBMXRSaGlXUVVTSEFvcjJkT0d0YXNSR2k1VDJsNnNVVUY2?=
 =?utf-8?B?QkxGbG5kUngwcytoUTl6d1lBTjNVMUJLM2JYUjdzclIxVlhWNnVvclR5L0I2?=
 =?utf-8?B?R1BSNllCa1k1RDhnWHEzK3VzaDdGT0NQakd5M0J6QnpTUTJJcUlLNU9KYnRl?=
 =?utf-8?B?YkJlUzFvZnRnMzBBRHp0UGk0K0x6enZ1ZE5NQWd6NFU4ZjRmQTdmZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PK51+xPfYZiH3uu1BDgN/dW03IFtyBK6THk8J8x8kuV1Sy3t19kZx+DCTCH2+7cft3IDvSB5ZE++dAmiJLifcECv8UsAKURUs5GouvuHwwyymkqubmyXCnbiTdbhUN//lRoxTXP2EkB9TsH5TIAM1GUUfKCAjXDaYgTk0pNy+l7satFBX05JUB5CcNXDk83ZnewTC0zD10qp18YZH1B39HL49HFUFl1SB/eX7RZqnVKbD85PGdJSUTUuuoJNXz3XPg/bnIW1GGgi9FcQIJTmA97SOKrm/OzeO1iQ16ve83+cFT57AVEmOwOsrtxEYwZAuGKZNfa3xC6oPgo60mmUYA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e800ce-2bde-403c-44ee-08de8e2bf8ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 07:14:24.3786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mudCtILLSfXj3YzkRtW79Ow0Qc3AX0hmGwXP3eoQir6AurhNF74u80hy79fhIFSOes2EMcW8h3hdZ+4lg+0RHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF632600ADB
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW4sIFNodWljaGVuZyA8c2h1
aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTgsIDIwMjYg
MzoyNyBBTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBMaW4s
IFNodWljaGVuZyA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+OyBHb3RlLCBOaXRpbiBSDQo+IDxu
aXRpbi5yLmdvdGVAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMS81XSBkcm0veGU6IEFk
ZCBtaXNzaW5nIGluY2x1ZGUgZ3VhcmRzIHRvIHVucHJvdGVjdGVkIGhlYWRlcnMNCj4gDQo+IFR3
byBoZWFkZXJzIGxhY2sgaW5jbHVkZSBndWFyZHMgZW50aXJlbHksIHdoaWNoIGNhbiBjYXVzZSBk
dXBsaWNhdGUgZGVmaW5pdGlvbg0KPiBlcnJvcnMgaWYgdGhleSBhcmUgaW5jbHVkZWQgbW9yZSB0
aGFuIG9uY2UgKGRpcmVjdGx5IG9yIHRyYW5zaXRpdmVseSkuDQo+IA0KPiBBZGQgc3RhbmRhcmQg
X1hFXzxOQU1FPl9IXyBpbmNsdWRlIGd1YXJkcyB0bzoNCj4gICAtIHhlX2RlcF9zY2hlZHVsZXIu
aDogZm9yd2FyZCBkZWNsYXJhdGlvbnMgYW5kIGZ1bmN0aW9uIHByb3RvdHlwZXMNCj4gICAtIHhl
X3Bjb2RlX2FwaS5oOiBQQ09ERSBtYWlsYm94IHJlZ2lzdGVyIGRlZmluaXRpb25zDQo+IA0KPiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFN1Z2dlc3RlZC1ieTogTml0aW4gR290ZSA8bml0
aW4uci5nb3RlQGludGVsLmNvbT4NCj4gQXNzaXN0ZWQtYnk6IEdpdEh1YiBDb3BpbG90OmNsYXVk
ZS1vcHVzLTQuNg0KPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGlu
QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVwX3NjaGVkdWxl
ci5oIHwgNSArKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlX2FwaS5oICAgICB8
IDUgKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXBfc2NoZWR1bGVyLmgNCj4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGVwX3NjaGVkdWxlci5oDQo+IGluZGV4IDg1Mzk2MWVlYzY0Yi4u
ZjMxNGZiNWQ4MGY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVwX3Nj
aGVkdWxlci5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXBfc2NoZWR1bGVyLmgN
Cj4gQEAgLTMsNiArMyw5IEBADQo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3Jh
dGlvbg0KPiAgICovDQo+IA0KPiArI2lmbmRlZiBfWEVfREVQX1NDSEVEVUxFUl9IXw0KPiArI2Rl
ZmluZSBfWEVfREVQX1NDSEVEVUxFUl9IXw0KPiArDQo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMu
aD4NCj4gDQo+ICBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eTsNCj4gQEAgLTE5LDMgKzIyLDUgQEAg
dm9pZCB4ZV9kZXBfc2NoZWR1bGVyX2Zpbmkoc3RydWN0IHhlX2RlcF9zY2hlZHVsZXINCj4gKmRl
cF9zY2hlZHVsZXIpOw0KPiANCj4gIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICoNCj4gIHhlX2Rl
cF9zY2hlZHVsZXJfZW50aXR5KHN0cnVjdCB4ZV9kZXBfc2NoZWR1bGVyICpkZXBfc2NoZWR1bGVy
KTsNCj4gKw0KPiArI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cGNvZGVfYXBpLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGVfYXBpLmgNCj4gaW5k
ZXggODVjYzc0NzhiNzg3Li5iNjE5MDMwYjllMTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY29kZV9hcGkuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNv
ZGVfYXBpLmgNCj4gQEAgLTMsNiArMyw5IEBADQo+ICAgKiBDb3B5cmlnaHQgwqkgMjAyMiBJbnRl
bCBDb3Jwb3JhdGlvbg0KPiAgICovDQo+IA0KPiArI2lmbmRlZiBfWEVfUENPREVfQVBJX0hfDQo+
ICsjZGVmaW5lIF9YRV9QQ09ERV9BUElfSF8NCj4gKw0KPiAgLyogSW50ZXJuYWwgdG8geGVfcGNv
ZGUgKi8NCj4gDQo+ICAjaW5jbHVkZSAicmVncy94ZV9yZWdfZGVmcy5oIg0KPiBAQCAtMTAxLDMg
KzEwNCw1IEBADQo+ICAjZGVmaW5lIEJNR19QQ0lFX0NBUAkJCVhFX1JFRygweDEzODM0MCkNCj4g
ICNkZWZpbmUgICBMSU5LX0RPV05HUkFERQkJUkVHX0dFTk1BU0soMSwgMCkNCj4gICNkZWZpbmUg
ICAgIERPV05HUkFERV9DQVBBQkxFCQkyDQo+ICsNCj4gKyNlbmRpZg0KDQpSZXZpZXdlZC1ieTog
Tml0aW4gR290ZSA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCg0KPiAtLQ0KPiAyLjQzLjANCg0K
