Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B9BC98304
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 05:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F3F10E4CB;
	Thu, 24 Sep 2026 05:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXk59bvQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C70710E4CB
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 05:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790227219; x=1821763219;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IGyTP0Oe3bn8jtt+OqjaincNQg0+958oX0Q0vjs+r7Q=;
 b=AXk59bvQwXHY83HGU3iPte2vPTPtNIQwT2Ci8jlCsUjHsJfswp4fSupg
 AqTROZuYR1WOW7SMOVNxEQptkwQBlBYedKbPgWJoVqw38SbjGFTITYLbU
 Y7O+OjxTAJ0HUKJNqNuco9fYuYFSwkAyeNp1bxDgtkq6N3ifuUQEFJAZs
 rqBi0LdFWLxd/jcSjnnj8La7KxkCxNEeTSYFmGKw5y00aH8Kkcr+4uQnu
 /2KlCIR6GUNTQEq54Ah5hvprgk2g/qd8GfKNAmYClWQa8xY33ywsyo3QU
 u5garxlPA3yEVuOwxYtIOOi+jI4xU7s2xB0RqyeorKoV0CXeUZVadRBbs w==;
X-CSE-ConnectionGUID: E30+oz+fRMefGR0d8QjEqg==
X-CSE-MsgGUID: wEhkH2elRxys7fJUcGOkTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91092203"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91092203"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 22:20:19 -0700
X-CSE-ConnectionGUID: 2DmJEZhYRS+FT2gwZnrL9w==
X-CSE-MsgGUID: 3ELCBkovRzSFTmy1UN5oAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="5040739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 22:20:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 22:20:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 22:20:18 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 22:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHGayHx0lKzRoEDZUj2zNj7cm7Dfpgy2YgiGeAU+XJVzrw7TsmuVx0Tnv4pAGdMHl8KZ7cb1OLBzwPH4JQp+8+CV6rzTVqh63fnIqB1K1NvKO1gWG8MRIVPVexJxiftJbPmGr7mnAb4gsWOH5n1ym8gG5iJEq6+237vpxG3LiG20/wtc0OqSCcj7J7hy0ofegiopedVWSr/3Yt5OOLeyQx1O6pt0nwM1JWQFKOWu2gBx5MYvjLEBivpPQsqGibL7ZynLQ2+y4zy6gc9YNC8Xp/b7CrWVj9HrjHRfzMjFnYEHYcIZ7SOIwH3LxSbMpHsjuDBEx3q8S5pIJs8tQAQAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGyTP0Oe3bn8jtt+OqjaincNQg0+958oX0Q0vjs+r7Q=;
 b=qqHzxQ6ETCbuYN9Uea737/pM63/hMmnAdpZoax1p/+ObgiZ4YVG0L2k/5RAujpkTxCXtJ6kW2MF+K9mEq1MqeGLGNNIcLxUVEPrY/9qK3lA8/pV7B3lpcLOto0EkjO9dR1xnYpkdDI1T9e4hr3VeW9r7Liud95ZALsgu7TjLKz5yws2zLisaK6z6vziSIqkECcY/f3NNbv2f9lksxP5mf7IjMgecI+woWj+s0qL4Ejbxi/4yTajm3nbPQLgOHNq2iItSgWPUV+d/AYy9Lgz93HIKQKUFPU5mSiwjrE4xtUDIsY4BL5rpgJm7Y7n3Uelj7uZYuunOxh/e8sqsKTzZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16)
 by BL4PR11MB8799.namprd11.prod.outlook.com (2603:10b6:208:5aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Thu, 24 Sep
 2026 05:20:16 +0000
Received: from BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811]) by BL1PR11MB5413.namprd11.prod.outlook.com
 ([fe80::9a26:cff1:9b8a:3811%4]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 05:20:16 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Drop old Xe GT ID macros
Thread-Topic: [PATCH] drm/xe: Drop old Xe GT ID macros
Thread-Index: AQHdS7DHotlITVFblkS3f3BrB8n2LrbdMTcQ
Date: Thu, 24 Sep 2026 05:20:15 +0000
Message-ID: <BL1PR11MB541313A5D228F2F0CACFCEC9E2812@BL1PR11MB5413.namprd11.prod.outlook.com>
References: <20260923-drop_old_gt_defines-v1-1-8f0811238582@intel.com>
In-Reply-To: <20260923-drop_old_gt_defines-v1-1-8f0811238582@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5413:EE_|BL4PR11MB8799:EE_
x-ms-office365-filtering-correlation-id: e9d73507-311d-42b8-98bb-08df19fb847f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|18002099003|22082099003|11063799006|38070700021;
x-microsoft-antispam-message-info: ADLpS4ieyYKdqQk5LcFlqdc06/4mLuIohv79hAyEw/p4RRe/HsOhCMxvHomO9Gxtc1GA6PA30InnBtbGUJsZyk9Ya5h83qL3pofo7sW5IN+GtM2OMMl60kHubTokmdjPV6h8/HAF1EF/jhM/T1FO7nvRW7V0JInZVUhazGqv6eRlQN+ZeU0AuDPmvyvKmTt6IHo7Xal1L+F9B1wDv1byUnIHs3rbCmuCLH0YDtp0rgA1NtHFFasYY0qyEfIrbvwr+fWPgrvBRFpXGgXRFtcEjnPVq4O4UTj04sRwuSRPx9u6yDd5ZJ/DrIKE4DDOlGIjtyOoi/rG47NgNCDntz2PAMNWLT5TWkAZlOcZDkjl1wYbkzCQqPrjKFvEI1ThhUA6JHSZehyY7xbjro5efq+yT1E7yXJxKwlSGG/M4IlNXuTZ/A/2PbBNdHLqUBHG3b2T8ri8AsFYtFAuzIE89vAXfEi0jUmr4Y6eHl+zmw9ZUcfQJ8fsSaKXNbUMiriSRnlY/F7bXo2X2YV04XSiDSBJI11AoYewbDrky7rCJz+4GFzTriwhmnipGw9jO/hnFrq5exljb2uEim+aIjk/CYqzkMbdFdATOvcUEd3EmPBpBsMtU7iksOcvtG5vjzS89hVubqCBh874jsWGV+yfvsmQEoq5PHY2DMZUWJgq6eLklw8p5ojCxkSl8YwA87IEz2yDLtSkzEPwSjoUtQkg5lrFOTHJflMPU7NOoFSDR+pYRdw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5413.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGVTcnRQRitUMHlRa2dZL0xWWFl3RXRiSXBJUW9qVDc3V212R3IxL3ZDYjFL?=
 =?utf-8?B?ZVlOcjNqNWZzbG5tbTVRdzVNVm9ySE1XSWlyWDh4UFJDSG8wUllScFk1Ui9j?=
 =?utf-8?B?QjdGQnl2VkN2ZjFhL3l3NkM1a3I0dDFLNkYvWWd0N2lBTERvc0pSdENsckNR?=
 =?utf-8?B?a2cxWmo2dlVENzdxazR6QmNLWFBoNm9TbUNhcGlKUzNHVEN0NHZ5aDhTZnVv?=
 =?utf-8?B?OXJMRmhJcXdhL1hpSFBHeUVwRDZzOUJHMWFlWTg1VXF2KzJOd2hQOXRabGZU?=
 =?utf-8?B?QW0wQVp2TFJZZ1FieWp0TXB1bXBmeDNtY2sxMEtWbU0waTBNWnFrRnB6RDhn?=
 =?utf-8?B?RDIyQ3pvcFc1eHFqZTRra21kZEx5QmI1OXB0Qmt5bjFLR3lHWC9LOGlZRjcx?=
 =?utf-8?B?Y2prRGdBN3hHeW5WWlNWOGhMb0g5Vy8vdUZIR25vb3lmMnVyUCs1LzZCQ0I4?=
 =?utf-8?B?UTN0eFU1eS9HS0l4akNoZlo4V21iKzJJdHVUVU1tQVU1Q3MzeGZKbitFSnMv?=
 =?utf-8?B?RkJUL3FuUUF6MFBpOEU4eTAzamdGTS9JcFE1V1VXczJpWk9rY0tJUHdJWFls?=
 =?utf-8?B?NksyNTZzb01MSktuMkRUMHh6SGFSdmxZYUV6RWhPdlYrTDRsVGJIS2t5Y1ZB?=
 =?utf-8?B?YXYwV21ZQWVwZTNMTTluOHUwZitaeXM1eERuajFOc3cxMUkvbjFITUFGR1Yv?=
 =?utf-8?B?VFVYSkcxUEtwam9QSCs2TVpsS20zWnVwVkplb0kybTJ5SWRsNXc4OXVnZUly?=
 =?utf-8?B?dXQxUEQ5bTh0d1NKRlFFSVNBSUtVQUpCSTdWZ1ZwR3pLc3lQN1lyalhrZ1Fr?=
 =?utf-8?B?eEpJRWYyK1BnclJqTDB5UDRTL1dPU2dhWmVIYlhXM1grSiszZWNtanI1NHh1?=
 =?utf-8?B?WFNhbSsxL3Q3bFNXUld6SEhhcGZYcy84RFVPS0tjWDlGbFQrc0hyQ3M2QjBJ?=
 =?utf-8?B?V0NXcE16Wi9lMzFFdWowZlFNYlZ6T0cxL0REZ1ptV004RkVKMDJRWEFwajIy?=
 =?utf-8?B?K1FibmFwTXR0MGFuMjBnVzZNQXA0TCtKUzBhKzFjVk9PNlpndzh4MG5UVllO?=
 =?utf-8?B?VFlpbGNrMUZ4L21WYkQ2bU9xNktZQW1sVGtyRGN2UjFvWTRVL1p5dG1kZVA2?=
 =?utf-8?B?aC9JRUN4V3FIUTh2Sm9Xelh5L1Q3WlFUVFRJcE5aWEozSU5xQTBEN3JnQW9Z?=
 =?utf-8?B?RlNDUnJTcDVDaFRmeHFvYjZkTVRjYmlkSkRnSFNxWTQ3UE9RL1h4Z1JLY054?=
 =?utf-8?B?dUN4NHhwc2pJMGxod1VQOEFFN1N3cnFNMzBjNmxQRUU3bmh6MHV6dE5iSmJ2?=
 =?utf-8?B?QzA0RytEeFpuZ2J3VmRJSVI0d3NCc3h2TW9xWVBpU1FTdURyYzRFUWptRHNn?=
 =?utf-8?B?U3VZQmltQng2THlCUVVPZWlMdlZlZkpWaEJOZUFlbGFSQmV3NXVJUUlXdDN1?=
 =?utf-8?B?Y2ltOTVxZzN6UGprQ1gzZTJDRDhuMDBpUm5DbW94N0taUXZaN1NINXJKQnZ3?=
 =?utf-8?B?UWlwdVcybU9vYWdOdDJXbzJWTnczMUFJQ3ZHbHdkNDlGTkw3em5mWFRiQjlw?=
 =?utf-8?B?cWFqbnJobE02QisrWXNuZ0hRTXFMOHk4dHlOOEdySDA3d1ZHLzgwUlpNUmhj?=
 =?utf-8?B?di9tK2g0V2hyd2VTdkpvYm5MMkJzU0t4YzN3UC9wOFhPRUN6eUY0ZXBCT3d0?=
 =?utf-8?B?T2N4b3Nnb2U5SXhKais1NXRxUzdSYjN2VXRRbTlMbFB3Zmk1dUJYOExkZEVP?=
 =?utf-8?B?aG95TnlvRDNRQjU2U3VUZmdWd3J4eGtvSGJWNC9WNjF1QWZvcUpsMnVtVzFx?=
 =?utf-8?B?Yi95ekxBNHJEY1plNWZxYUVwRWZNanZDTzFrdWJnTEFLYTdDWiswUEdHQlBj?=
 =?utf-8?B?M2ZLLytIOVZKelExT296bGNzVXJhVWFaL0NPVmsvcFNJYlZvWXNCeTFHVjVq?=
 =?utf-8?B?RmNqOHpieVhPMEk0aXZXdXBQdFVHZkdyWkdHMXllSE42MkZFSHlETGl4VmhJ?=
 =?utf-8?B?TjUrU1JXVlhId1pTT29kU3QrNlFVZ25tcGIwRzBHUWJ3TWo0NW5mMDV2WWk5?=
 =?utf-8?B?UEZyK0V0TEFBWlNPRG1aWnNlZE5RSm9xU2hjbXpzMlpNTUI2QS9hZFA3emZ0?=
 =?utf-8?B?aWRzZXA2SEJ1ZmxNZStDUWY2bEt6bVpySzloK2ZLcmRhZWFPQi9DWnZtM0xa?=
 =?utf-8?B?dmkyNFZvRitjWndEU3Z6MFo0Sldxd3o3eUpKOGVVM3o0dlJVbmMvWGNQS0t0?=
 =?utf-8?B?UnFrdVVOT2tNdlJOUVNYUCtWbjdwc2pPbWdrMVM0T1grbFdISzN6VmhML0F4?=
 =?utf-8?B?MVorWGszZWgvQ0JwVFpBUEI0bSsvSVcwSDlKNW1HRmgrVzl5cjU0YzlNMFlN?=
 =?utf-8?Q?upUgzh2xbkbsDWOY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ah1ENClzlT9r9Qa1+s0deVFXv9hyl0nOd2n/27eJlcSnJAGvpkykC6XeGqU/ZS3s8x37l6uEGob/IDlqDvCtqJ1/oSLEjAXdHQrrarOjTNe9KzEBRlYakInj3D9FGmCj7aAr8wKhohByQ3ihDwCSOGkwT29C1kQ6+J6q2jqZrlzxhMXGfPZaJCaXobrfWt04uxRp2ADA8LNOobtmy3sbWNyKe4My99DDKJgntnRFphCI/0wB4e02cdgfupSkme09n9+LUJW0JuRH4D3POVguCZvKtw807nQvQgMj2iZlktKuVW4Zpsp8IrhMKkFVNPxHhlFNPFUGxTNXlkOB9a2d/Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5413.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d73507-311d-42b8-98bb-08df19fb847f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 05:20:15.9716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 10VahlxMbWkbr+XOlrmW5QNPulm8y8q1JK3RxEUF6QuV/ogg2qWjKO3xgdJU05Xl8tNPP8ok+T9GIewd4fcBdq2IBzxTHNs6b43ACa6NOKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8799
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTWF0dCBSb3Bl
cg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI0LCAyMDI2IDQ6NDAgQU0NCj4gVG86IGlu
dGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogUm9wZXIsIE1hdHRoZXcgRCA8bWF0
dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0veGU6IERyb3Ag
b2xkIFhlIEdUIElEIG1hY3Jvcw0KPiANCj4gWEVfR1QwIGFuZCBYRV9HVDEgYXJlIG9sZCBtYWNy
b3MgdGhhdCB3ZXJlIHVzZWQgZm9yIGhhcmRjb2Rpbmcgc3BlY2lmaWMgR1RzDQo+IGR1cmluZyBl
YXJseSBkZXZlbG9wbWVudCBvZiB0aGUgZHJpdmVyOyBuZWl0aGVyIHNob3VsZCBiZSBhbnltb3Jl
IHNpbmNlIHRoZQ0KPiBkcml2ZXIgc2hvdWxkbid0IGJlIG1ha2luZyBhc3N1bXB0aW9ucyBhYm91
dCB3aGF0IElEIG51bWJlcnMgY29ycmVzcG9uZCB0bw0KPiBzcGVjaWZpYyB0eXBlcyBvZiBJRHMu
DQo+IA0KPiAgKiBYRV9HVDAgd2FzIG9ubHkgYmVpbmcgdXNlZCBpbiB0aGUgR3VDIGluaXQgY29k
ZSB0byBza2lwIHJlYWRpbmcgdGhlDQo+ICAgIGh3Y29uZmlnIHRhYmxlIG9uIG1vcmUgdGhhbiBv
bmUgR1QuICBDb21wYXJpbmcgdGhlIEdUIGFnYWluc3QNCj4gICAgeGVfcm9vdF9tbWlvX2d0KHhl
KSBpcyBhIG1vcmUgZGlyZWN0IHdheSB0byBlbnN1cmUgdGhpcyBoYXBwZW5zIG9uDQo+ICAgIGp1
c3QgYSBzaW5nbGUgR1QgcGVyIGRldmljZSAoYW5kIHNob3VsZCB3b3JrIGV2ZW4gaWYgdGhlIElE
IG51bWJlcnMNCj4gICAgd2luZCB1cCBjaGFuZ2luZyBpbiB0aGUgZnV0dXJlKS4NCj4gDQo+ICAq
IFhFX0dUMSB3YXMgb25seSBiZWluZyB1c2VkIHRvIHNldCBYRV9NQVhfVElMRVNfUEVSX0RFVklD
RSB3aGljaCBtYWtlcw0KPiAgICBubyBzZW5zZSBhdCBhbGw7IGV2ZW4gdGhvdWdoIHRoZSBoaWdo
ZXN0IHRpbGUgY291bnQgd2UgaGF2ZSBvbiBhbnkNCj4gICAgZGV2aWNlIHRvZGF5ICgyIG9uIFBW
QykgaGFwcGVucyB0byBtYXRjaCB0aGUgbnVtYmVyIG9mIEdUcyB0aGF0IHdlDQo+ICAgIGNhbiBw
b3RlbnRpYWxseSBoYXZlIGluc2lkZSBhIHRpbGUgKDI6IHByaW1hcnkrbWVkaWEgb24gbm9uLVBW
Qw0KPiAgICBwbGF0Zm9ybXMpLCB0aGVzZSBjb3VudHMgYXJlIHVucmVsYXRlZCBhbmQgc2hvdWxk
IG5vdCBiZSB0aWVkDQo+ICAgIHRvZ2V0aGVyIGxpa2UgdGhpcy4NCj4gDQo+IENsZWFudXAgdGhl
IHBsYWNlcyB3aGVyZSB0aGVzZSB3ZXJlIHVzZWQgYW5kIGRyb3AgdGhlIHR3byBkZWZpbmVzIHNv
IHRoYXQgdGhleQ0KPiBkb24ndCBnZXQgbWlzLXVzZWQgYW55d2hlcmUgZWxzZSBnb2luZyBmb3J3
YXJkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgg
fCA0ICstLS0NCj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19od2NvbmZpZy5jIHwgMiArLQ0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+IGluZGV4IGJiNDIzNGYwMDQ1
My4uM2UxZDNhMTQzZGVmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlX3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5o
DQo+IEBAIC04OSw5ICs4OSw3IEBAIGVudW0geGVfcGFnZV9zaXplX2FsbG9jX2N0cmxfbW9kZSB7
DQo+IA0KPiAgI2RlZmluZSBYRV9WUkFNX0ZMQUdTX05FRUQ2NEsJCUJJVCgwKQ0KPiANCj4gLSNk
ZWZpbmUgWEVfR1QwCQkwDQo+IC0jZGVmaW5lIFhFX0dUMQkJMQ0KPiAtI2RlZmluZSBYRV9NQVhf
VElMRVNfUEVSX0RFVklDRQkoWEVfR1QxICsgMSkNCj4gKyNkZWZpbmUgWEVfTUFYX1RJTEVTX1BF
Ul9ERVZJQ0UgMg0KPiANCj4gIC8qDQo+ICAgKiBIaWdoZXN0IEdUL3RpbGUgY291bnQgZm9yIGFu
eSBwbGF0Zm9ybS4gIFVzZWQgb25seSBmb3IgbWVtb3J5IGFsbG9jYXRpb24gZGlmZiAtLQ0KPiBn
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2h3Y29uZmlnLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2h3Y29uZmlnLmMNCj4gaW5kZXggYjMwMDkwMWRiYjhlLi5kYzY2N2E3
MWI0MzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfaHdjb25maWcu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2h3Y29uZmlnLmMNCj4gQEAgLTY1
LDcgKzY1LDcgQEAgaW50IHhlX2d1Y19od2NvbmZpZ19pbml0KHN0cnVjdCB4ZV9ndWMgKmd1YykN
Cj4gIAkvKg0KPiAgCSAqIEFsbCBod2NvbmZpZyB0aGUgc2FtZSBhY3Jvc3MgR1RzIHNvIG9ubHkg
R1QwIG5lZWRzIHRvIGJlIGNvbmZpZ3VyZWQNCj4gIAkgKi8NCj4gLQlpZiAoZ3QtPmluZm8uaWQg
IT0gWEVfR1QwKQ0KPiArCWlmIChndCAhPSB4ZV9yb290X21taW9fZ3QoeGUpKQ0KDQpMR1RNLA0K
UmV2aWV3ZWQtYnk6IERueWFuZXNod2FyIEJoYWRhbmUgPGRueWFuZXNod2FyLmJoYWRhbmVAaW50
ZWwuY29tPg0KDQo+ICAJCXJldHVybiAwOw0KPiANCj4gIAkvKiBBRExfUCwgREcyKyBzdXBwb3J0
cyBod2NvbmZpZyB0YWJsZSAqLw0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA3MDNjZDI3MWRi
M2EzNTA4ODQ2MGFiM2ZlYzBhOTZiZDQ4ZTdmZTA0DQo+IGNoYW5nZS1pZDogMjAyNjA5MjMtZHJv
cF9vbGRfZ3RfZGVmaW5lcy1jY2NmYTg1MTZjMTgNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0N
Cj4gTWF0dCBSb3Blcg0KPiBHcmFwaGljcyBTb2Z0d2FyZSBFbmdpbmVlcg0KPiBMaW51eCBHUFUg
UGxhdGZvcm0gRW5hYmxlbWVudA0KPiBJbnRlbCBDb3Jwb3JhdGlvbg0KDQo=
