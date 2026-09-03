Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25A3C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 05:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46F110E063;
	Thu,  3 Sep 2026 05:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkkIBVYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC6E10E04A;
 Thu,  3 Sep 2026 05:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788412729; x=1819948729;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9TVWshdEuji9gJSFk4MF7fqkSvdMk85qKzFvr8ImNG4=;
 b=NkkIBVYdDLmOvw8vOVOV6jr+CZsTyjZrue2CZXnNChgVqiHlwQTMeqqU
 UTd4l5D898jzIkXVWkZFaPHBfbleY+4yH3o5//GcU4eG6/vLjd5ncZMQQ
 Mif6hDGQ8oFYniVkwyyH7uBgrHz9YTrz4r4hbtFLBjBeqBUtVueN7gLr0
 Lx5HLlDBr5Bhi55UfyXvpUgWee4Z4Ij7tmtW57EOiryB7lzTAnwnn0CXd
 BlI/R4U7iZIReSOkd8PqYyjlylKRXrTOniuw36fFxIgwufsKvznYPQu+Y
 /gsiFeVMRN4XVLkbShcLKG7nkQ7r0hkarDoEgY/RFYfKv2s1bTSrvTYox w==;
X-CSE-ConnectionGUID: st9QXuUQRUKrN4trZmX5Og==
X-CSE-MsgGUID: e1iQnRTQSCOXZRyTboAsng==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87818852"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="87818852"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:18:49 -0700
X-CSE-ConnectionGUID: lTPlZyDuTC63HkL9nNMmGQ==
X-CSE-MsgGUID: yxhcxVKZSeGswfWNppWfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="267014282"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:18:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 22:18:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 22:18:48 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 22:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJSAgwkr8P33qExHvnXTxmJeBTkF5jALSv9o4LODE+Dioh7KA7uTaKXOxoxJln6JAyKo9jJ8ItWIxTLzA4OY/r2VmFxvvwr1BkFBvU5vRYhwws+qEuDwGICcc23jUkzq8QuLzwcNNeR7pGsTd33oHMCwpuvb2jWwwkNHFEEKdQPwH5VDRx9dkpqW5Yd9ngoEpm5aovFn9SEdQoZ6QJObMEYXsjwmObatP+0jtGBVQyUgcgZIGDm2Ow0+UIYwMQ7SSlf6gr8pzIggQIPJZW64ZJf5J2wMAu2k2ehzAJgIyzDi/GJnDpRhU5FJeSd0NZN/46QS84n0tbeKpbojKbOLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TVWshdEuji9gJSFk4MF7fqkSvdMk85qKzFvr8ImNG4=;
 b=xhkdS2QPiDP91N67bRn775p8+8LcUrc1GPT7Wk/GVfGf5sXUwAojk4nSC5Ls2OrzYf2FurShRIJHTTF2uXpBHxu5oe8PtzpXKe0ARNgGMIf4E/8Y9lHJLeON/GCbZTV5MTnT06i6VUBP3JjFsMqre9T/lyN0pAbVXqAcSceyLObzj2K+roTnEjllDIRebWKhNhvG3UOQr4AqqNxvU2bxFJtMNJz5kNzbyC7eDKg4y98YXfaa0tzWFeiYDjHJfZAVpBXpnvL4wT8jsmqxbcZcyk86UnWdwPRyp/5t/X0QGOhpxEn27DMJsk4c53w8Nf4fG8BmjdGOHmNCng5CPhswQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB8090.namprd11.prod.outlook.com (2603:10b6:8:188::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 05:18:40 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 05:18:39 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "Manna, Animesh" <animesh.manna@intel.com>
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY, 
 panel never refreshed (Dell XPS 16 DA16260)
Thread-Topic: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in
 SU_STANDBY, panel never refreshed (Dell XPS 16 DA16260)
Thread-Index: AQHdOvdDB7Q2OBUzw0ODpqNUYIfIbba7q7SAgACltwA=
Date: Thu, 3 Sep 2026 05:18:39 +0000
Message-ID: <d9e0848cd8622ff2762a72c0f3f7610600a0049a.camel@intel.com>
References: <20260902162150.58778-1-j@metarealtyinc.ca>
 <20260902192531.44003-1-j@metarealtyinc.ca>
In-Reply-To: <20260902192531.44003-1-j@metarealtyinc.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB8090:EE_
x-ms-office365-filtering-correlation-id: 477f5276-9c1f-4b61-f71e-08df097ad080
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|56012099006|10067099003|11063799006|4143699003|6133799003|18002099003|38070700021;
x-microsoft-antispam-message-info: BdJKWdkr3mKEf02PPAWh1XFD4pIUOk716Z3GzYd+kipTuYTLB6U/fpFbSeT9CAwGPKnNFoNrjBwu8eXrD4ylohKo+JHtNNFCny/Q6A0CE+GCuaMUdqrg5doAjL/fEMGwbSai8NoGAm4v8LZdyf9QnMkY8u2rGdePg6GGcmTwZKo/9MK3KdLMIrYKohF0fp7Vaw/PQn9fp0crOIrYSwr0Gs+1wE4WAxEN4qffv+GD5LOR++dVZjal39fjoRz67h+jrGZwoxC69rua3C1NUOKc/sDdQWXQlVG25RYIj6W+EM+uKsF43UOpIed7FrQydKdtBoxydvdeF8VaPNXxbBqheC49FeL366VIcPQZcNNtT5PPFmmSYOQlBPp/9k37xJ/22Ps2gaz0zO0UzomOw4gXlKE3mk01VA60tXIQ3EJgIhHOEwIJZeDkS4Ij4sL2WaiaXwbP2rfGhZkrS+FPSWkX8NoQoGSwD5oOuUjcfWgOU/+Ms4rTJssjqaIoQYgBMiIPKGhmYqYEGUNhQMz63KJ4ZJJHWCOnVHaXZuJQCNMUcI+cffJDHjoHO/S+xDEhZ6DeshyhM8uSMKZ/9LHp1j+LRGhFcmApHnm28sgJ2WR/8k46fWf1GHZD06yDGKUGcqGqoxQd2LRHfsw3YDE/yvswcnyJ6dNIfolcPKQ6AmkBRwI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUtjQ3RKdzRhR1kyTi9yU0s4djkwenR1anZQMEVMS0VybWlROFFOQ08wRkFN?=
 =?utf-8?B?RTRQNHdmMmFKZUdXUEd3QkdaaTZoT0lqVUYzU2RPMHo2dmx1ZWZsU01oSTcz?=
 =?utf-8?B?b0hJYUxOc0dDTUltUnV1ZUw3MzRKSHJkU0ZhbjZheUxzUkliVDJvYVQra3Bi?=
 =?utf-8?B?MmpyL1IzRmpYY1RNY0p3am8zTTBvNWZpODh6UzNhUUdibGxVTDBJc3hBREtX?=
 =?utf-8?B?WUJCN2RrV2JqTEZYdzdIMlJiUzZXRWpoR0tGTTVybUVyZWtFd0h4aGdxclBW?=
 =?utf-8?B?Ri94M0NRUWdadmZFN2lONGdUWEovRFZXSjlYNTgvcDdHMmVCWmxLTG41b0Ry?=
 =?utf-8?B?NTJ5Y3U0SmFEdERWRHh5TDE3bE1FeEdzVklsdDdySDJQa3FSeTNJMCtwZkJt?=
 =?utf-8?B?WW9RYlQxNUhXelZ0RVNYd0dVSzhpZlJYNm4zNjFDUXpnQmR3V3ZZclRKU0o4?=
 =?utf-8?B?MGJlZkRTOWE5RW9XL0tLSDZRM0p5cmZQNERlaTNUS2F4SUpRN3JNaDFhWGV0?=
 =?utf-8?B?TVN3eTlab284UGt3RVRPSC9lLzVMZUhjLzVNUFZoalB5SWpIYWVVVDhYNnU5?=
 =?utf-8?B?OEdyblF2L2lzME9FYlV4SGJXM0dqSlpXVFZCeWZCVFN1bnlEeVJtbHVIWVNH?=
 =?utf-8?B?M0U3UFBwelVNL0VkRUNrakF0eUdZMmF6ZDloMjEvT2dTQU93MEZ3Y001N085?=
 =?utf-8?B?RDN4SVNhOU1MNGZ4YXNnUEdJaXpwWDBZaU1WT2NDdSs2RHRvWjNLL0V3TzBa?=
 =?utf-8?B?OTFJYW42NkEyTVlaaStMcU9NVmRxN1ZDcS9nMWZ5NjhlekEzMm5rWFVKbWp1?=
 =?utf-8?B?UGJnYlhHQnFDR2ZscGw4V3dTOVRJZHppQjE1MEoxWUdkWmVwMmRHaENRWkpT?=
 =?utf-8?B?NHpVZ2t2UVE2a3N1SGxxNFVjOGhUTG5WWTRXMWdjU0JhNzFuK1laNXhtcHdi?=
 =?utf-8?B?QmQxQ29CdklKV1ByZjhLbExWYkRIVFFMcWZKSHl3NnVDdEtBZ0xJaHBqdlZK?=
 =?utf-8?B?RmtpK05vaE1ldHBoMkt6djJuMGNLczJmSitsNnNpQ1QxbndRQmxYWG5VNHhT?=
 =?utf-8?B?KzF1STI4YVFkWXljMUNETExIVnRBYlo2eXJEMC9LbXFqNm1KQUN1Qktlcm9n?=
 =?utf-8?B?bW5wS1ZHZ0xwMEd0a09oQnlHdjdJSktCa3lkc00yWUIxNThMazhQUUQ1K1RD?=
 =?utf-8?B?a3VPVXkzUzdlVU5JTWx6THk5NEJseXZIT1llNWRWeDVvck4reGQ5UnhsbFJt?=
 =?utf-8?B?Qitra2lVVlNnZzh3dkhoRlRpaXdiMTdJdWJuODBMMTFkdlpCMTJoYmc4RjJN?=
 =?utf-8?B?YUg1QnJlaU1POU9rOXFYRHpiU2p2dklzSiszaGxQaU1lMWJtamxibUxHR1pY?=
 =?utf-8?B?d2V2RTQvVWExSnpvQjRZMkt0R0lqQmRwTVp3S0RrMnlsbjFiWWU0eWhnSXlk?=
 =?utf-8?B?L0RqZ2RsL1BadE9MVXBtOW1oZkMzdW9JSkUzdXJVRDdsQmVoTFF4aW1kMEsy?=
 =?utf-8?B?SXVUQmZYY05NMWF0TmR0VW01VGh4NTBBbVd5RVU1bG9helh0UlhyRmxKOEdY?=
 =?utf-8?B?YkdHS3ZjU0NZeENabVRiSHg1a2ZDbU9IUjNobE9zcFRGdHoydlQvK2ozVW5W?=
 =?utf-8?B?V1ZBNnFzZW5hTlZDY24rRkdUTHVtM2JzTHVUZjA3aTdTWGF1eUQxRW1LT0xk?=
 =?utf-8?B?TERJelVVQWt0b1B1QjV5MzRHUXVrQmVmbTNpWldDbEgrSlFJVTkzcW9EV0Fy?=
 =?utf-8?B?UVJlQ0hkcVZaTkwrczgxUVpCbm9ieVcrRjlWUzR4RGtuVldhRHhMdkU1eitw?=
 =?utf-8?B?TVNxa0dZRlBCd1JiQ2pCS05ZTTl3bXB2RThsY2NEdTFzTExtZFUrTUpHOWto?=
 =?utf-8?B?M090b1htOHRPbDd4UU9WeVY3MkhZWkZRZnYxa1ZCYkhwWUQ2THNTNzdVWlc2?=
 =?utf-8?B?T2k1VldwZ2svc1ZlR3h5SFRBN0owYVZHVEY4ak1ZeUxYOWQ1SHJRK3M4bWJM?=
 =?utf-8?B?cXdETWJYc2Y1WmJiM3VNeXRscythY3FhL1p2Zm11RTFtb0tFTUlrOFBuazFp?=
 =?utf-8?B?TEg5N2dkOGJ3QVVYWWNnVEhCQXl4YTZ4NU5aUmdqaDQ3dU5BWUlDY3UzTk5N?=
 =?utf-8?B?ZXN4SEFEanZlN0hhdGZ3MEhjWG5jTTJBcWw1dkpzWCtYRVBaUUZWL1BmYTBM?=
 =?utf-8?B?RzdEZDBWSy9HYUxsek84UldLTkZvZkIwS3Qvdm84MlRERXVkY0xZQ0dsSWkv?=
 =?utf-8?B?NXRncmZvb0RuQWkwY1FDZUMydFIyVi94eWYyTVJkaWhXczE1V1hRVVh0THUw?=
 =?utf-8?B?bmdKcU9wV0JqczRQZ3lKcmZaQ0xOdWIvTzVOZklKaXNXT2ZCRDF1Z3ZMd0Uy?=
 =?utf-8?Q?Pt9sqM9/Kt12Acsk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76DDCD897E11D249AA69CFCBA4B23AC8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: y9ZDegLKwbuW7pD1JUOQLeYVoa4Z8v4ODs0dGtx2YxSwbPxo/hkWBmmCHEavfwHPY8Pmvr5+YJsdb/BfoEYNBMfeMNXeNjUnQDLDIljWvGTrlgBq89q3+UQIJ50ZZBzUn8OGB8oViB97YXXAIkLmpwGXj9SJw4eS6h9rWlCATvyqWshcERlIG5RTIsnwRaTaUH/9VnCBHHkJKFAu3yDk5rESr0FsaZZsFgBfmBXgSMJptze0Qh5Mmus5uvQW5M0NPMJQihhlGZPvPc3GPMJZEb9RmD1ieZG5OmT5X1ucd9z53R6rImlb7tNXyEIbuEdMpSTnn2QtkkRw7QxoqO0VgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477f5276-9c1f-4b61-f71e-08df097ad080
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 05:18:39.8527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CYJXcP2UL+N/zV1iUEodHjkuak8NcknmiNC9k/rkT3maRnwmUuC5QtkKCffNBvBTLLO01tmR0oVzvTN+ueyMyemc1Rhqz8rr5YjvidIjxo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8090
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

T24gV2VkLCAyMDI2LTA5LTAyIGF0IDE1OjI1IC0wNDAwLCBKYWtlIFN0ZWlubWFuIHdyb3RlOg0K
PiBGb2xsb3ctdXAgYWZ0ZXIgYSBkYXkgb2YgQS9CIHJ1bnMsIGFsbCBuZWdhdGl2ZSwgZWFjaCB2
ZXJpZmllZCBpbiB0aGUNCj4gcmVnaXN0ZXJzDQo+IGJlZm9yZSB0aGUgcnVuOg0KPiANCj4gLSBU
UkFOU19WQkxBTksuVkJMQU5LX1NUQVJUIHByb2dyYW1tZWQgd2l0aCB0aGUgcmVhbCB2Ymxhbmsg
c3RhcnQNCj4gaW5zdGVhZCBvZiAwDQo+IC0gZ3VhcmRiYW5kIGZvcmNlZCB0byB0aGUgZnVsbCB2
YmxhbmsgKDEyNyBsaW5lcykNCj4gLSBQU1IyX01BTl9UUktfQ1RMIGluIHRoZSBwcmUtQURMLVAg
bGF5b3V0ICg0LWxpbmUgdW5pdHMpDQo+IC0gQUxQTV9DVEwgd2l0aCBBTFBNIGVuYWJsZSAvIGtl
ZXAgRkVDIC8gQVVYIHdha2Ugc2xlZXAgaG9sZCBzZXQgZm9yDQo+IFBTUjINCj4gLSBJTyBidWZm
ZXIgd2FrZSBhdCB0aGUgNS1saW5lIG1pbmltdW0NCj4gLSBQU1JfREVCVUcgbWFza2luZyBNRU1V
UCBvbmx5DQo+IC0gbm8gUElQRV9TUkNTWl9FUkxZX1RQVCAvIERTQyBTVSBwYXJhbWV0ZXIgd3Jp
dGVzDQo+IC0gZnJhbWVzLWJlZm9yZS1TVSAyLCBpZGxlIGZyYW1lcyA2DQo+IC0gU1cgVlNDIERJ
UCBkaXNhYmxlZCB3aXRoIFZTQ19TRUxFQ1QgPSAzDQo+IC0gc2luazogQ1JDIHZlcmlmaWNhdGlv
biBiaXQgc2V0LCBNU0EgdGltaW5nIGlnbm9yZSBjbGVhcmVkDQo+IA0KPiBJbmRpdmlkdWFsbHkg
YW5kIGFsbCB0b2dldGhlcjogdHdvIGNhcHR1cmVzIGFmdGVyIGVuYWJsZSwgdGhlbg0KPiBTVV9T
VEFOREJZIGF0DQo+IGV2ZXJ5IGZyYW1lIGNoYW5nZSwgc2luayAweDIwMGEgbmV2ZXIgcmVwb3J0
cyBTVV9WQUxJRC4gTWFudWFsDQo+IFRSQU5TX1BVU0gNCj4gU0VORCwgQ1VSU1VSRkxJVkUgYW5k
IExOTF9TRkZfQ1RMIHdyaXRlcyB3aXRoIHRoZSBkZXNrdG9wIGlkbGUgYXJlDQo+IGlnbm9yZWQg
YXMNCj4gd2VsbCwgYW5kIFBTUjJfU1VfU1RBVFVTIHN0YXlzIGF0IHRoZSBibG9jayBjb3VudHMg
b2YgdGhlIHR3byBlbnRyeQ0KPiBjYXB0dXJlcy4NCj4gDQo+IEkgaGF2ZSBleGhhdXN0ZWQgd2hh
dCBjYW4gYmUgZGVyaXZlZCBmcm9tIHRoZSBkcml2ZXIgc291cmNlLiBXaGF0DQo+IHdvdWxkIHNl
dHRsZQ0KPiB0aGlzIGlzIGEgcmVnaXN0ZXIgZHVtcCBmcm9tIGEgUGFudGhlciBMYWtlIG1hY2hp
bmUgd2hlcmUgUFNSMiBTVSBvcg0KPiBQYW5lbA0KPiBSZXBsYXkgd29ya3MsIHRha2VuIHdoaWxl
IGl0IGlzIGFjdGl2ZTogMHg2MDAwMC0weDYxMGZmLCAweDcwMDAwLQ0KPiAweDcwN2ZmLA0KPiAw
eDQyMGMwLTB4NDIwY2YgYW5kIDB4MTZmYTAwLTB4MTZmYTdmLCBwbHVzIERQQ0QgMHgyMDA4LzB4
MjAwYS4gSWYNCj4gYW55b25lIGF0DQo+IEludGVsIHdpdGggYSBQVEwgZURQIHN5c3RlbSAoV2lu
ZG93cyBvciBMaW51eCkgY2FuIHNoYXJlIHN1Y2ggYSBkdW1wLA0KPiBvciBwb2ludA0KPiBhdCB0
aGUgQnNwZWMgY29uZGl0aW9uIHRoZSBQU1IyIGVuZ2luZSBuZWVkcyB0byBsZWF2ZSBTVV9TVEFO
REJZIG9uDQo+IFhlMyBMUEQNCj4gd2l0aCB0d28gVkRTQyBzdHJlYW1zLCBJIHdpbGwgZG8gdGhl
IHJlc3QuDQo+IA0KPiBJbnN0cnVtZW50ZWQga2VybmVsLCBzY3JpcHRzIGFuZCBhbGwgcnVuIGxv
Z3MgYXJlIGF2YWlsYWJsZSBvbg0KPiByZXF1ZXN0Lg0KDQpCZXN0IHRvIHJlcG9ydCB0aGlzIDoN
Cmh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9pbnRlbC1kb2NzL2hvdy10by1maWxl
LWk5MTUtYnVncy5odG1sDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQo=
