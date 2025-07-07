Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D4C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 18:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E5F10E29F;
	Mon,  7 Jul 2025 18:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WbwC6BYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DA810E29F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751913284; x=1783449284;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=loQgHAoX/cjgzk/8gniDboMzI3WwU/74PcRQ7Kpg094=;
 b=WbwC6BYmRnfFIpvQtzTZRMaoWKmmVgevHoAYsVJK+ws7guBZb40R5Aa8
 s83XZaP/PtyxqssKkY1loEYdkJIL4r392NiKzD/pnwYFY8tmd5XW2b7IC
 4Fq/RBN1XshNeYDon+6K/RgREiPHMITGghpz6hCZ7idAUnEmt8onWeWoL
 XuanuxEud4RDWpDcqRLNMUTlQ4vkqHLMevxPv0vdySdiYhvQd1aOOEsK5
 Xq1KSybKnTcUwyrTGVo0Vjq9Fl8Wx95k2QRs97EHjKYARY8hImWTBcs21
 s79v8wyZ8repi+nNC+v757jXiM6S+dChy7ElUWeNbLJ8S05tkYr+29rrU w==;
X-CSE-ConnectionGUID: NmN7SarTS+6/anBLWgaBTg==
X-CSE-MsgGUID: 154KuNmDThOMdAsjMTsLEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76690805"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="76690805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 11:34:43 -0700
X-CSE-ConnectionGUID: 0EmTdXjHS+mFTphEU6FVNA==
X-CSE-MsgGUID: kuKZQohcTkWA2eeU0qctHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154683110"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 11:34:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 11:34:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 11:34:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.89) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 11:34:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hvm0tNTCkXd4HipXQynEFvTTJ6GJFnL8dDjXj8/8cLAqgBDHdAClBAAhQCoKLm0liqw9h/Nhx/VLaJqvanf5UNr1D/iUXYSzRpCYyVqyxGdN/k5kmKt0ofEJBjRL4e3E4jB0DvvXVc29VeLO9ooNKIOe/Lxf9oEFR/Oq8EVRwuhzNJmdC1QE47Oo0bOqiDCq4aQv3L86r+5KP4bjkuqT12NN1WHapreg5UbHpIu1G60C6iCP6QJFwil3OiAc0VW8nQMg9W/8pOmPfTl6VE0N48g8gE48A+b07fpP6c7EH6qrxdW7NEblAOZd0Bf251LY857C9YjjR9ueN8NO22xk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loQgHAoX/cjgzk/8gniDboMzI3WwU/74PcRQ7Kpg094=;
 b=f2yQA9qkWwPNefUuVt9Lu+OACjFrWc8AheapKMicF+uLlEHat1r5Ib5K4FVvGog8EsBlly/l7UwPEo+3+xqkYhxEWboQKNbXcONIOXkZH/kP/2tQMK9CPcduz5GUbZeuyvmkVnaR9xaLKnnDfwsNh/CXQ28/T5CQsBlMQIf2M4mbqcnd+r6/n9UV2rEr2k/HGrkO/aVd/IZUBYc+x6ZbWlWUbqmJrG7utdoI3PPWMwpgi2r/WEi/tL0okYJupC87ZQsHE42NtU0AXgvmWogLrNPLMAQWMlJXVxJ8LJYJ1+ldf9HT1onWhYnH1gg8jjHQsWsS/CTi58/2QPll7SglNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 18:34:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 18:34:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Topic: [PATCH v8] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Index: AQHb7GLf/swB/5MSzE6vZn1OzlJQrLQms/8AgAA+koCAAA78gP////sQ
Date: Mon, 7 Jul 2025 18:34:22 +0000
Message-ID: <CH0PR11MB5444E827204F576615A86875E54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250703213845.2259302-1-zhanjun.dong@intel.com>
 <CH0PR11MB54443606D202241399E6692EE54FA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <3a784641-2436-4ead-88e2-88ef33fd39ac@intel.com>
 <aGwSLzlUP1YTJ5bP@lstrano-desk.jf.intel.com>
In-Reply-To: <aGwSLzlUP1YTJ5bP@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB7512:EE_
x-ms-office365-filtering-correlation-id: 16dc0290-f9b0-4faf-7bf6-08ddbd84e4a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SFdhSDNvQjJSSzMvWjhRc3dxM0RtYWZKK2pxZUR0ZElxa3NtSHc0NzR0T2E2?=
 =?utf-8?B?UnFaZTgzMnZHNzVIUW9nV1hYa3UzNlJ2MUw4OVJiMEhjclZ6UWh0MDdqM3Ez?=
 =?utf-8?B?QUplTFBQdDJQcjRDWTdhenhIQXVqVStRR1l2TmV3SGJKQkFqMW5JREY0N0NZ?=
 =?utf-8?B?aWxwTWFXMVlGQmhzRldvNW14U0lzakNiOHZiV2d4dWJyM1N1RTFKdTdmdmth?=
 =?utf-8?B?Y1pkMFp0QUVTQU0zUGFsNGdPTldzVWZ6eTh2R3AzVlh6Ny9DeG9tUTgySkZZ?=
 =?utf-8?B?UzZXbHorVHNzUlFTQ2hnR1ZvY0UwNHdIbGE1NDR2NFN3OWxaNWhwUWhCMEdK?=
 =?utf-8?B?WHRpVlZMS3hyTS9la2pEanRaWFl3cldsMmt0Q2xUT2k0WlNhWHNEYit0aW93?=
 =?utf-8?B?YWNqQ3VvZFB0OTdFVEFmK0oyR2EydDQ2Z2VSV2VvN0lZS1FIU1dvT2w4c0VE?=
 =?utf-8?B?STl2SVNObHBzb0cydmVLRWtmcWNVU1FVSjVhSXYyUE52d3VyZFJzV3VHQzlj?=
 =?utf-8?B?WjFaeDdoMU4rNmtidUxaYWcybjUyODN3NFYzZmxpbUswK1hxOXhXeFBUMnha?=
 =?utf-8?B?U0FvcUtrQVVjZWRwaUxObjdrZlRXVnAzWUpjN2lNMjNpMTYxR09PalNXOW1p?=
 =?utf-8?B?NU9NQnZvb1VZNHhHYlNjYlhjWDZORDdNWFNxeFBUTWJrbENCd3ZtVEF6RGMv?=
 =?utf-8?B?c0p1ZnNpUEZ2SE1WSTZ3Z1BKNndTR0t1cmlDd3I5Z2lMQkJlQ1ByZGJOQy95?=
 =?utf-8?B?SitlU2ljamk5eldLKzVuYlhWS0lRK3pVZzZITWV6NmhBV0JtRmtzdmFXMDBG?=
 =?utf-8?B?TUVic3AydDdHZUhZNnQ5ZUtOWitzdFcveUxEZmd3bHBlcUdHdTNyajNyU3Zp?=
 =?utf-8?B?VXF4UHdFVEFZWGs1dGlHY3BNVjUwRmtlL2kvYjZ2amlhRnFTYUUwd211bVNk?=
 =?utf-8?B?NHYrcHFKRWJxVVhIK3Z1anBmUnkvWHRlM2NJRDRhZHpOV0k0Z3Nqc2JRb0oz?=
 =?utf-8?B?Ni9HeTdnaWxpWFF2WVd2UCs3czdJVGhQNTMxSlpzRDFZbGN2NFRlR01FUlI3?=
 =?utf-8?B?eExpbk91WFZudHdjVzc4eXJZWnJ6YjEvQmgxMkpUYUxBUkQzZ1A5cm5ZYTZO?=
 =?utf-8?B?VmE4em9VVGJwUFpSRit3R1pxcGhQZFlYWVBvZHZhSlhjN254YXdTbGVocmtx?=
 =?utf-8?B?cFowVDFScVZqNURSTy9YZEljeVVBeEFQZDFBSHg5aG1LSmM0RGdYVEtUenBK?=
 =?utf-8?B?VlREMjBrc2VXSnA0U2pLMTJzaDlvTXg0UDB5eGJ4eXlaYXBuSFlUbXMrYWdy?=
 =?utf-8?B?UlE4dkFwVUMybGF6NDY0L0Yvb3krdU1iYVR5aVFiMGdwMi8wTTRyVXNLQ1hD?=
 =?utf-8?B?cEFMUk5nYkp2aFN5N1h2bGNPeXA4bzBTdXVnbitGbVBzajlUZG1wUTBLcGdB?=
 =?utf-8?B?TXpNbUxrZ0s4ZW1EMG1GM1hQK0pWMXUyVEs5NGZpSVdZMExmalJ2aitzcmNM?=
 =?utf-8?B?NzQ3RFUxcFhoU1FXWGhTWjVRSDRUUFBsSXRGVERYTnhaeFZ1WDFHbnlIRVU5?=
 =?utf-8?B?K2tLOWpvZmdKY0JGWFBRY1h2RGN0UzFhNXVUUGM3dGV3NGlLRGIxU1VEekJI?=
 =?utf-8?B?ZTZ4UVZJbituQmZrYzQ1WnNaZEs4M0xBYkxXMFNjR3dWZDY4THNVZi9ONHgw?=
 =?utf-8?B?TjZRSTBQZmpFbnJRVExIWEpuSGV1aVVDRjg0TDRPWjJwSElleHZSQ1NyMjB1?=
 =?utf-8?B?MzNyUTM3VkRZeHJqc2FFTmhBZHdFOEIwMzIvTlJBc1Zac0NMUXhLeXh1M1lz?=
 =?utf-8?B?RGhNTytvTkFqeW0xMjlDYlhHdUZobVVIbExURVB0UURPaFhaZHlOWjdzOWl2?=
 =?utf-8?B?SEtQamswTlVZNXVhbkw4N1V3Vy84eFFFY2tEVStXdEM0UWVXMEU5bmUyeUxw?=
 =?utf-8?Q?n+kBy+t8XMk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXZBQXRubStHcURySkhGNDZRMmtPRENlTjI5TkYwaDVsUUZkY3BhZ2d2V1U5?=
 =?utf-8?B?a1I4Y1ovbHVOU2duWUFvU0hST3NQOFlQQUc2Ly9jamhVTk5vb2oyUHgvYjhQ?=
 =?utf-8?B?V0ZDU3RGY3VvclhCemcvZ0hVTTdteVFIR2ZyTTkxV05GM1RDRlcxQitWUndl?=
 =?utf-8?B?VUE2a1hza3dTaHFudlIyMkczbjNsT1hXM3ZCY3NCS0Z2Q3k5c2ExVjNNM2Fx?=
 =?utf-8?B?MjcyZW11S2R0OU44b3pDS25GSk9xZXViejk4cWFvS0J6WnVjc1RWcXNCR0Jn?=
 =?utf-8?B?SjNhRGpKQUM2RDFuWCt2VURoVWJzckFTUjlNdnhoYzNQSFZ6aHdoR0tXOFVP?=
 =?utf-8?B?aHA4VGNMM0FPYkJqeWlYYkhtTFlJZWwxT0I0QmNMY3F0T0h2bWFXZnBEUmtq?=
 =?utf-8?B?cXZJYXhMNEVPZG1pL1Q5TGZHeXhVUEpxek8raG1zTWNDSHoraWhkeFZWZlNT?=
 =?utf-8?B?MHJNeFB0UjJYdUtoWktIYklibitnV0hRVEVxY29xZEh1LzMwVmF0SThOWHl3?=
 =?utf-8?B?ZVBwcmN4K3puQ0JQM0NvMjNLNDZVMzJpVzcrNHdkZEIwblp2NVFxd290R3R2?=
 =?utf-8?B?YVJrc0lnTmFZN0ZOdmExYUdzQ1J1M281Mnpqb3RtYWlLYmtmbGVwYnhWLzFV?=
 =?utf-8?B?d2thb1E2WW9QS2w4M3dQU1JTYnJMclMrVDhnZXhZTFdsQW5zb3had3dDdzM4?=
 =?utf-8?B?TGlxbUpJMVhmODBhWGFHbFhtKzllL0Y2ZUhVY3RjWTkrT0s3cHltaU8xRStW?=
 =?utf-8?B?azlldHdVT1FCc21xV2pUeFBUcTFmZkVJN0s2WmlmTUFHS2N1SkttYlM0N3lM?=
 =?utf-8?B?YlR0S2htdGNaZUxaQWtxOHJoTzh0a3dEdGNWQ3dGbEo5WnhTd2c1czRKSmM2?=
 =?utf-8?B?bmQ4eUdWV2d6MUJCUkRPYzl6eUxWKzlXQlRlR2ZxWndOajhuL0Vhb3d6T3Av?=
 =?utf-8?B?OC9jQ2NsN3E3WDZVZXRIbmNxVkxuOE9XaFk1SXMzb2lLMEdCcTBxZHZSRmtC?=
 =?utf-8?B?VnBtMFhORkFHQW8yN0p4Q3ZCQUhseXdyQWhCNVRjdGdrb2xuWW1PR0xENzkz?=
 =?utf-8?B?Wm1KejFDQ0hGS0VudjlFU1JvbW1vWkU3N0tONFA2MHI4c1d0WGtnbDV3Undy?=
 =?utf-8?B?QVNsNWNjbDFsVVZodmJudDBYaTBtWCtyQ1lKdkxVSS9RZ01VVEdTeDF6QVJh?=
 =?utf-8?B?WTlCNkxqL3REdGI3Sjc2R2s2bVNHcjBDaUx5cmhjYVMwNDlMdkZTY1ZpL0Jx?=
 =?utf-8?B?Zkt1Y25OVXJTYUtkTDdUbEMveUlGM2ZQY1YycWRnbmszeVI1V2o1RzlzQUdm?=
 =?utf-8?B?N0cvdXlYNXVOZW84L1F5dkYwME1jekNSRjVuUlFwcWIyY0pYMmgvbGdrcE56?=
 =?utf-8?B?T0VmYnNKYUZjVGVFN054R09kVVR3Ti8xUkJnZjBRek91ZW9tSVB2S1lVSXAr?=
 =?utf-8?B?WEt5Z2VYZW1KdjJhMk9pTUlsZnlyTEJsTjNMNW1RM1hmRGhBTFJMWm5QMnBq?=
 =?utf-8?B?WGpkNTY4NkRzSWkzWWQrNm1tNit6MnN6QUQ4V0ZXUXdxWUlFUTFqZFdOVlA2?=
 =?utf-8?B?eUI2c2dpcnRmc09Md2dGRzl4Mk1Kc256bE1IaVFleldxZlhDa01RT0tuakJL?=
 =?utf-8?B?bWsrOTVmMm42MjJDNjJZcERRQU5mTnZqWDdQQXlWOWQzaGFxYVN0b1Avdzdu?=
 =?utf-8?B?Um1uQnJmdnNRanNvZFpYVm4zU0czdUo1WWZKaHhNZEgrNktNODE0cmtwOElS?=
 =?utf-8?B?M3dINGZ4ZiswUUt5Z0tZTFhtUldSK0ozS3I2djBqK2ZZbW04R3RBOHQxbTFR?=
 =?utf-8?B?VkVRSjNMYVdvTXVDY0phRlc2RmtVcUU3WjRLZVNlYXpIY211RXpwTEo5ZFdo?=
 =?utf-8?B?NkZvOW9MK2tZV01PWk5QcjRGQVRsdFJqZnpSWjJLNWpUREE2Q3JtaWxjeS9u?=
 =?utf-8?B?N2wvZU56MkR6b0JQMys4Y1FubG1mZnZEWVFMMGhZOUVlNndQWGhsUnFpU1Ru?=
 =?utf-8?B?MUNScEFLSVkyU3E1WEhtUkFQc2FkNkRmUTl1NngyUFl3eDh3OCtraWxMZmtx?=
 =?utf-8?B?RzVHM0p0RDh4azA4NnZDVjBqQzNrN2loQTRQMU90akFUQzhQQ2J6cDRxWGdu?=
 =?utf-8?B?UTdJVFRlc0wvR05aVFZ6QXZuL29KMkkzUS9DVTVIMXlvUENuNmtNS1o1eTNK?=
 =?utf-8?Q?A6nO7xg+/q/xX9TeUAuLo9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dc0290-f9b0-4faf-7bf6-08ddbd84e4a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 18:34:22.5695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4indHNkJIE2xNpETS7q5w1HfqdXFcxHjD5fJocV5Ij7owp6Zn7tUL4PH1jrSVHqyR4g2/0O9EYy5NFU2TGvPufA55Qj7TOlaGpxlqnY14RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4gDQpTZW50OiBNb25kYXksIEp1bHkgNywgMjAyNSAxMTozMCBBTQ0K
VG86IFdhamRlY3prbywgTWljaGFsIDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT4NCkNjOiBD
YXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgRG9uZywgWmhhbmp1
biA8emhhbmp1bi5kb25nQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgU3VtbWVycywgU3R1YXJ0IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQpTdWJqZWN0OiBS
ZTogW1BBVENIIHY4XSBkcm0veGUvdWM6IERpc2FibGUgR3VDIGNvbW11bmljYXRpb24gb24gaGFy
ZHdhcmUgaW5pdGlhbGl6YXRpb24gZXJyb3IuDQo+IA0KPiBPbiBNb24sIEp1bCAwNywgMjAyNSBh
dCAwNzozNjoyOVBNICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3RlOg0KPiA+IA0KPiA+IA0K
PiA+IE9uIDA3LjA3LjIwMjUgMTU6NTYsIENhdml0dCwgSm9uYXRoYW4gd3JvdGU6DQo+ID4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogRG9uZywgWmhhbmp1biA8emhh
bmp1bi5kb25nQGludGVsLmNvbT4gDQo+ID4gPiBTZW50OiBUaHVyc2RheSwgSnVseSAzLCAyMDI1
IDI6MzkgUE0NCj4gPiA+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+
IENjOiBEb25nLCBaaGFuanVuIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPjsgV2FqZGVjemtvLCBN
aWNoYWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPjsgU3VtbWVycywgU3R1YXJ0IDxzdHVh
cnQuc3VtbWVyc0BpbnRlbC5jb20+OyBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRA
aW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDogW1BBVENIIHY4XSBkcm0veGUvdWM6IERpc2FibGUg
R3VDIGNvbW11bmljYXRpb24gb24gaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24gZXJyb3IuDQo+ID4g
Pj4NCj4gPiA+PiBEaXNhYmxlIEd1QyBjb21tdW5pY2F0aW9uIG9uIFhlIG1pY3JvIGNvbnRyb2xs
ZXIgaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24NCj4gPiA+PiBlcnJvci4NCj4gPiA+Pg0KPiA+ID4+
IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4g
PiA+PiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVs
Ly0vaXNzdWVzLzQ5MTcNCj4gPiA+Pg0KPiA+ID4+IC0tLQ0KPiA+ID4+IENjOiBNaWNoYWwgV2Fq
ZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gPiA+PiBDYzogU3R1YXJ0IFN1
bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+PiBDYzogSm9uYXRoYW4gQ2F2
aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+ID4+DQo+ID4gPj4gQ2hhbmdlIGxp
c3Q6DQo+ID4gPj4gdjg6IEZpeCBrZXJuZWwtZG9jIHN0eWxlDQo+ID4gPj4gICAgIEFkZCBlcnJv
ciBoYW5kbGluZyBpbiB2Zl9ndWNfbWluX2xvYWRfZm9yX2h3Y29uZmlnDQo+ID4gPj4gdjc6IEFk
ZCBrZXJuZWwtZG9jIGZvciB4ZV9ndWNfZGlzYWJsZV9jb21tdW5pY2F0aW9uDQo+ID4gPj4gICAg
IFVuc2V0IHN1Ym1pc3Npb25fc3RhdGUuZW5hYmxlZCBhcyB3ZWxsDQo+ID4gPj4gdjY6IFNraXAg
ZGlzYWJsZSBjdCBvbiB4ZV9ndWNfZW5hYmxlX2NvbW11bmljYXRpb24gZXJyb3INCj4gPiA+PiB2
NTogU2V0IHdlZGdlIGlzIGV4Y2Vzc2l2ZSBhY3Rpb24sIHJldmVydCBiYWNrIHRvIGRpc2FibGUg
Y3QNCj4gPiA+PiB2NDogRml4IHR5cG8gYW5kIGFkZCBuZXcgbGluZQ0KPiA+ID4+IHYzOiB2MiBD
SSByZS1ydW4NCj4gPiA+PiB2MjogUmVtb3ZlIHVubmVjZXNzYXJ5IGp1bXAgdG8gZXJyLW91dA0K
PiA+ID4+ICAgICBEcm9wIGRpc2FibGUgY3QsIHN3aXRjaCB0byBzZXQgd2VkZ2UNCj4gPiA+PiAt
LS0NCj4gPiA+PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jIHwgMjAgKysrKysrKysrKysr
KysrKysrLS0NCj4gPiA+PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5oIHwgIDEgKw0KPiA+
ID4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdWMuYyAgfCAxOSArKysrKysrKysrKysrKy0tLS0t
DQo+ID4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkNCj4gPiA+Pg0KPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPiA+PiBpbmRleCA4NTczOTU3ZmFj
YWUuLjY2NDNhMmNiODk4YiAxMDA2NDQNCj4gPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjLmMNCj4gPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPiA+
PiBAQCAtMTIxOSwxMyArMTIxOSwxNyBAQCBzdGF0aWMgaW50IHZmX2d1Y19taW5fbG9hZF9mb3Jf
aHdjb25maWcoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ID4+ICANCj4gPiA+PiAgCXJldCA9IHhl
X2d0X3NyaW92X3ZmX2Nvbm5lY3QoZ3QpOw0KPiA+ID4+ICAJaWYgKHJldCkNCj4gPiA+PiAtCQly
ZXR1cm4gcmV0Ow0KPiA+ID4+ICsJCWdvdG8gZXJyX291dDsNCj4gPiA+PiAgDQo+ID4gPj4gIAly
ZXQgPSB4ZV9ndF9zcmlvdl92Zl9xdWVyeV9ydW50aW1lKGd0KTsNCj4gPiA+PiAgCWlmIChyZXQp
DQo+ID4gPj4gLQkJcmV0dXJuIHJldDsNCj4gPiA+PiArCQlnb3RvIGVycl9vdXQ7DQo+ID4gPj4g
IA0KPiA+ID4+ICAJcmV0dXJuIDA7DQo+ID4gPj4gKw0KPiA+ID4+ICtlcnJfb3V0Og0KPiA+ID4+
ICsJeGVfZ3VjX2Rpc2FibGVfY29tbXVuaWNhdGlvbihndWMpOw0KPiA+ID4+ICsJcmV0dXJuIHJl
dDsNCj4gPiA+PiAgfQ0KPiA+ID4+ICANCj4gPiA+PiAgLyoqDQo+ID4gPj4gQEAgLTEzMzcsNiAr
MTM0MSwxOCBAQCBpbnQgeGVfZ3VjX2VuYWJsZV9jb21tdW5pY2F0aW9uKHN0cnVjdCB4ZV9ndWMg
Kmd1YykNCj4gPiA+PiAgCXJldHVybiAwOw0KPiA+ID4+ICB9DQo+ID4gPj4gIA0KPiA+ID4+ICsv
KioNCj4gPiA+PiArICogeGVfZ3VjX2Rpc2FibGVfY29tbXVuaWNhdGlvbigpIC0gRGlzYWJsZSBH
dUMgY29tbXVuaWNhdGlvbg0KPiA+ID4+ICsgKiBAZ3VjOiBUaGUgR3VDIG9iamVjdA0KPiA+ID4+
ICsgKg0KPiA+ID4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgZGlzYWJsZSB0aGUgR3VDIGNvbW11
bmljYXRpb24uDQo+ID4gPj4gKyAqLw0KPiA+ID4+ICt2b2lkIHhlX2d1Y19kaXNhYmxlX2NvbW11
bmljYXRpb24oc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ID4+ICt7DQo+ID4gPj4gKwlndWMtPnN1
Ym1pc3Npb25fc3RhdGUuZW5hYmxlZCA9IGZhbHNlOw0KPiA+ID4+ICsJeGVfZ3VjX2N0X2Rpc2Fi
bGUoJmd1Yy0+Y3QpOw0KPiA+ID4gDQo+ID4gPiBEaWRuJ3QgdGhpcyB1c2VkIHRvIGp1c3QgYmUg
YSB3cmFwcGVyIGZvciB4ZV9ndWNfY3RfZGlzYWJsZT8NCj4gPiA+IA0KPiA+ID4gLi4uIFdlbGws
IEkgc3VwcG9zZSBuZWVkaW5nIHRvIHNldCB0aGUgc3VibWlzc2lvbiBzdGF0ZSBlbmFibGVkIHRv
IGZhbHNlDQo+ID4gPiB3b3VsZCBhbHNvIGJlIGEgcmF0aGVyIGltcG9ydGFudCBzdGVwLCBzbyBp
dCdzIHByb2JhYmx5IGdvb2QgdGhhdCB3YXMgYWRkZWQuDQo+ID4gDQo+ID4gaG1tLCB3aGlsZSBp
dCBtaWdodCBiZSBhIHJlcXVpcmVkIHN0ZXAgZm9yIHNodXRkb3duLCBwdXR0aW5nIGl0IGhlcmUN
Cj4gPiBsb29rcyBsaWtlIGEgcmFuZG9tIGNob2ljZSwgaXQncyB1bmJhbGFuY2VkIHdoYXQgImVu
YWJsZV9jb21tdW5pY2F0aW9uIg0KPiA+IGRpZCBhbmQgYWxzbyBsb29rcyBsaWtlIGEgdmlvbGF0
aW9uIG9mIHRoZSBsYXllcmluZywgYXMgZ3VjX3N1Ym1pdCBjb2RlDQo+ID4gaGFzIGl0cyBvd24g
ZmlsZXMgYW5kIHdlIHNob3VsZG4ndCB0b3VjaCBpbnRlcm5hbHMgZnJvbSB0aGUgb3V0c2lkZQ0K
PiA+IA0KPiA+ICsgQE1hdHQNCj4gPiANCj4gDQo+IEluIGdlbmVyYWwsIHRoZSB1c2Ugb2YgZ3Vj
LT5zdWJtaXNzaW9uX3N0YXRlLmVuYWJsZWQgaW4gdGhlIGV4aXN0aW5nDQo+IGRyaXZlciBkb2Vz
bid0IGFwcGVhciBjb3JyZWN0LiBJdCdzIGFjY2Vzc2VkIGluIG11bHRpcGxlIGZpbGVzIHdpdGhv
dXQNCj4gYW55IGNsZWFyIGxvY2tpbmcgb3IgbGF5ZXJpbmcgcnVsZXMuIFRoaXMgZmFsbHMgaW50
byB0aGUgY2F0ZWdvcnkgb2YgIkkNCj4gd3JvdGUgdGhpcyBlYXJseSBpbiBYZSB3aXRob3V0IG11
Y2ggdGhvdWdodCBvciBkdWUgdG8gc29tZSBpZ25vcmFuY2UsDQo+IGFuZCB3ZSBuZXZlciBjbGVh
bmVkIGl0IHVwIuKAlGFuZCB0aGVyZSdzIHF1aXRlIGEgYml0IG9mIHRoYXQgZmxvYXRpbmcNCj4g
YXJvdW5kIGluIFhlLiBTbyBJIGFncmVlIHdpdGggTWljaGFs4oCUd2Ugc2hvdWxkbid0IG1ha2Ug
dGhpcyB3b3JzZS4NCj4gDQo+IFJhdGhlciB0aGFuIGNhbGxpbmcgeGVfZ3VjX2Rpc2FibGVfY29t
bXVuaWNhdGlvbiBoZXJlLCBtYXliZSBjYWxsDQo+IHhlX2d1Y19zYW5pdGl6ZSBpbnN0ZWFkPyBJ
dCBzaG91bGQgYWNoaWV2ZSB3aGF0IHlvdSdyZSBhaW1pbmcgZm9yDQo+IHdpdGhvdXQgZnVydGhl
ciBjb21wbGljYXRpbmcgdGhlIGhhbmRsaW5nIG9mDQo+IGd1Yy0+c3VibWlzc2lvbl9zdGF0ZS5l
bmFibGVkLg0KDQpJdCBzZWVtcyBsaWtlIHRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB4ZV9n
dWNfc2FuaXRpemUgYW5kDQp4ZV9ndWNfZGlzYWJsZV9jb21tdW5pY2F0aW9uIGlzIHRoYXQgdGhl
IGZvcm1lciBjYWxscyB4ZV91Y19md19zYW5pdGl6ZSwgYW5kDQp0aGUgb3JkZXIgb2Ygb3BlcmF0
aW9ucyBpcyBzd2FwcGVkIGFyb3VuZCBhIGJpdC4gIFNvLCB5ZXMsIEkgdGhpbmsgaW4gaGluZHNp
Z2h0DQp3ZSBzaG91bGQgYmUgdXNpbmcgeGVfZ3VjX3Nhbml0aXplIGluc3RlYWQuDQoNCkRvaW5n
IHNvIHdvdWxkIGFsc28gZWxpbWluYXRlIHRoZSBuZWVkIGZvciB0aGUgeGVfZ3VjX2Rpc2FibGVf
Y29tbXVuaWNhdGlvbg0KaGVscGVyIGZ1bmN0aW9uIGFsdG9nZXRoZXIsIHNvIG9uY2UgYWxsIHVz
ZXMgb2YgeGVfZ3VjX2Rpc2FibGVfY29tbXVuaWNhdGlvbg0KaGF2ZSBiZWVuIHJlcGxhY2VkIHdp
dGggeGVfZ3VjX3Nhbml0aXplLCB3ZSBjYW4gc2FmZWx5IHJlbW92ZSB0aGF0IGhlbHBlcg0KZnVu
Y3Rpb24gZnJvbSB0aGlzIHBhdGNoLg0KDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+IE1hdHQN
Cj4gDQo+ID4gPiANCj4gPiA+IEV2ZXJ5dGhpbmcgZWxzZSBpcyBMR1RNLCBzbw0KPiA+ID4gUmV2
aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4g
PiA+IC1Kb25hdGhhbiBDYXZpdHQNCj4gPiA+IA0KPiA+ID4+ICt9DQo+ID4gPj4gKw0KPiA+ID4+
ICBpbnQgeGVfZ3VjX3N1c3BlbmQoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiA+ID4+ICB7DQo+ID4g
Pj4gIAlzdHJ1Y3QgeGVfZ3QgKmd0ID0gZ3VjX3RvX2d0KGd1Yyk7DQo+ID4gPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWMuaA0KPiA+ID4+IGluZGV4IDIyY2YwMTlhMTFiZi4uMjA4MjNiODIxZjdkIDEwMDY0NA0KPiA+
ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuaA0KPiA+ID4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWMuaA0KPiA+ID4+IEBAIC0zNCw2ICszNCw3IEBAIGludCB4ZV9n
dWNfcmVzZXQoc3RydWN0IHhlX2d1YyAqZ3VjKTsNCj4gPiA+PiAgaW50IHhlX2d1Y191cGxvYWQo
c3RydWN0IHhlX2d1YyAqZ3VjKTsNCj4gPiA+PiAgaW50IHhlX2d1Y19taW5fbG9hZF9mb3JfaHdj
b25maWcoc3RydWN0IHhlX2d1YyAqZ3VjKTsNCj4gPiA+PiAgaW50IHhlX2d1Y19lbmFibGVfY29t
bXVuaWNhdGlvbihzdHJ1Y3QgeGVfZ3VjICpndWMpOw0KPiA+ID4+ICt2b2lkIHhlX2d1Y19kaXNh
YmxlX2NvbW11bmljYXRpb24oc3RydWN0IHhlX2d1YyAqZ3VjKTsNCj4gPiA+PiAgaW50IHhlX2d1
Y19vcHRfaW5fZmVhdHVyZXNfZW5hYmxlKHN0cnVjdCB4ZV9ndWMgKmd1Yyk7DQo+ID4gPj4gIGlu
dCB4ZV9ndWNfc3VzcGVuZChzdHJ1Y3QgeGVfZ3VjICpndWMpOw0KPiA+ID4+ICB2b2lkIHhlX2d1
Y19ub3RpZnkoc3RydWN0IHhlX2d1YyAqZ3VjKTsNCj4gPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWMuYw0KPiA+ID4+
IGluZGV4IDY0MzFiYTNhMmM1My4uMTAxMmZlODRiMzc5IDEwMDY0NA0KPiA+ID4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV91Yy5jDQo+ID4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3VjLmMNCj4gPiA+PiBAQCAtMTMsNiArMTMsNyBAQA0KPiA+ID4+ICAjaW5jbHVkZSAieGVf
Z3RfcHJpbnRrLmgiDQo+ID4gPj4gICNpbmNsdWRlICJ4ZV9ndF9zcmlvdl92Zi5oIg0KPiA+ID4+
ICAjaW5jbHVkZSAieGVfZ3VjLmgiDQo+ID4gPj4gKyNpbmNsdWRlICJ4ZV9ndWNfY3QuaCINCj4g
PiA+PiAgI2luY2x1ZGUgInhlX2d1Y19wYy5oIg0KPiA+ID4+ICAjaW5jbHVkZSAieGVfZ3VjX2Vu
Z2luZV9hY3Rpdml0eS5oIg0KPiA+ID4+ICAjaW5jbHVkZSAieGVfaHVjLmgiDQo+ID4gPj4gQEAg
LTE1OCw3ICsxNTksNyBAQCBzdGF0aWMgaW50IHZmX3VjX2xvYWRfaHcoc3RydWN0IHhlX3VjICp1
YykNCj4gPiA+PiAgDQo+ID4gPj4gIAllcnIgPSB4ZV9ndF9zcmlvdl92Zl9jb25uZWN0KHVjX3Rv
X2d0KHVjKSk7DQo+ID4gPj4gIAlpZiAoZXJyKQ0KPiA+ID4+IC0JCXJldHVybiBlcnI7DQo+ID4g
Pj4gKwkJZ290byBlcnJfb3V0Ow0KPiA+ID4+ICANCj4gPiA+PiAgCXVjLT5ndWMuc3VibWlzc2lv
bl9zdGF0ZS5lbmFibGVkID0gdHJ1ZTsNCj4gPiA+PiAgDQo+ID4gPj4gQEAgLTE2OCw5ICsxNjks
MTMgQEAgc3RhdGljIGludCB2Zl91Y19sb2FkX2h3KHN0cnVjdCB4ZV91YyAqdWMpDQo+ID4gPj4g
IA0KPiA+ID4+ICAJZXJyID0geGVfZ3RfcmVjb3JkX2RlZmF1bHRfbHJjcyh1Y190b19ndCh1Yykp
Ow0KPiA+ID4+ICAJaWYgKGVycikNCj4gPiA+PiAtCQlyZXR1cm4gZXJyOw0KPiA+ID4+ICsJCWdv
dG8gZXJyX291dDsNCj4gPiA+PiAgDQo+ID4gPj4gIAlyZXR1cm4gMDsNCj4gPiA+PiArDQo+ID4g
Pj4gK2Vycl9vdXQ6DQo+ID4gPj4gKwl4ZV9ndWNfZGlzYWJsZV9jb21tdW5pY2F0aW9uKCZ1Yy0+
Z3VjKTsNCj4gPiA+PiArCXJldHVybiBlcnI7DQo+ID4gPj4gIH0NCj4gPiA+PiAgDQo+ID4gPj4g
IC8qDQo+ID4gPj4gQEAgLTIwMiwxNSArMjA3LDE1IEBAIGludCB4ZV91Y19sb2FkX2h3KHN0cnVj
dCB4ZV91YyAqdWMpDQo+ID4gPj4gIA0KPiA+ID4+ICAJcmV0ID0geGVfZ3RfcmVjb3JkX2RlZmF1
bHRfbHJjcyh1Y190b19ndCh1YykpOw0KPiA+ID4+ICAJaWYgKHJldCkNCj4gPiA+PiAtCQlyZXR1
cm4gcmV0Ow0KPiA+ID4+ICsJCWdvdG8gZXJyX291dDsNCj4gPiA+PiAgDQo+ID4gPj4gIAlyZXQg
PSB4ZV9ndWNfcG9zdF9sb2FkX2luaXQoJnVjLT5ndWMpOw0KPiA+ID4+ICAJaWYgKHJldCkNCj4g
PiA+PiAtCQlyZXR1cm4gcmV0Ow0KPiA+ID4+ICsJCWdvdG8gZXJyX291dDsNCj4gPiA+PiAgDQo+
ID4gPj4gIAlyZXQgPSB4ZV9ndWNfcGNfc3RhcnQoJnVjLT5ndWMucGMpOw0KPiA+ID4+ICAJaWYg
KHJldCkNCj4gPiA+PiAtCQlyZXR1cm4gcmV0Ow0KPiA+ID4+ICsJCWdvdG8gZXJyX291dDsNCj4g
PiA+PiAgDQo+ID4gPj4gIAl4ZV9ndWNfZW5naW5lX2FjdGl2aXR5X2VuYWJsZV9zdGF0cygmdWMt
Pmd1Yyk7DQo+ID4gPj4gIA0KPiA+ID4+IEBAIC0yMjIsNiArMjI3LDEwIEBAIGludCB4ZV91Y19s
b2FkX2h3KHN0cnVjdCB4ZV91YyAqdWMpDQo+ID4gPj4gIAl4ZV9nc2NfbG9hZF9zdGFydCgmdWMt
PmdzYyk7DQo+ID4gPj4gIA0KPiA+ID4+ICAJcmV0dXJuIDA7DQo+ID4gPj4gKw0KPiA+ID4+ICtl
cnJfb3V0Og0KPiA+ID4+ICsJeGVfZ3VjX2Rpc2FibGVfY29tbXVuaWNhdGlvbigmdWMtPmd1Yyk7
DQo+ID4gPj4gKwlyZXR1cm4gcmV0Ow0KPiA+ID4+ICB9DQo+ID4gPj4gIA0KPiA+ID4+ICBpbnQg
eGVfdWNfcmVzZXRfcHJlcGFyZShzdHJ1Y3QgeGVfdWMgKnVjKQ0KPiA+ID4+IC0tIA0KPiA+ID4+
IDIuMzQuMQ0KPiA+ID4+DQo+ID4gPj4NCj4gPiANCj4gDQo=
