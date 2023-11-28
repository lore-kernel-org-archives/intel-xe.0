Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24312C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 09:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE1210E467;
	Tue, 28 Nov 2023 09:04:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970C910E467
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 09:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701162278; x=1732698278;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vl030WAx9siKDspnR8h3q4tEdxWw0d9Zngt609XuOYQ=;
 b=FD1N4HaHaG7r4aBzg6p6J34FFHYUyWi8t3toGkKqESb1W+9xYw5yusKD
 XV4TjP3Tgl9e2tfaWM0/HtCC5ZfIL6hii+1x4lYEdmZTMGLLPYAeXN3ZW
 gF0zci6xA9VbKyS3EkDw5+o/iG3LglwpPo9ypJE5yaV9EdArYn+vhkg7V
 6UP7WEDrVjtO/BNQNdtwon2dbj61jVMdYdO+ZeFlHC6W793GVScJqGu9a
 44p6jrJJyUQwzfa0BKEN8Ub5Uqrc/VYTEnTWIwLXkWFv2p+scJsB0AmhU
 wOtyUkuMzrTWpUQEiCZ4HQq57FxSZe6j4XGekhPuiDid17ftKf35gDTES A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459387372"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="459387372"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 01:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="772244492"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="772244492"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 01:04:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 01:04:31 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 01:04:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 01:04:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 01:04:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPuGXE6oOEdSEqEddVWv1CZqOOKz4EUzW3QF8QOnovdHayC10ItZDPuA9lTYuVL5sDUM5lAtrSupYbzVK2uKmp1/Xp+hMYI1iU/LZMR63WeUU6VyTFkE9TZO28qdMcmJlzMw8D2T4SsUGUYAK0M7UmdeizvPpMTHjA/Db8G2EqTFyScW2VGbeQfDELKTI21rdYQ8qmHXzQzjkWc4GPk24njMGuOAPCBx3ZQcLtJzk/5kD8qLAaycjYp6EIFKhgSDY0ca7nnia36+cFxdhj1o6bgGOeC171X38yzNVD1aM8Un1GQiiDGhkvvxMzr/+W55yMCwOJAqJpnoHTVzJXMv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl030WAx9siKDspnR8h3q4tEdxWw0d9Zngt609XuOYQ=;
 b=GnyFDsf9ChDSkf85W4HMCMiXzN9dpqYJlulJNtl9fi6Y933Sier/4OZN/WBpdWfrBusr5OZsAzTd9N4zK4cSGUy+zKGAapTwukGhSTscdxZea+wfDETDO8ZO6XVs2Tbj3XR/Uk0da9d3nsFzwHcwOhlumy57ubhBrT2ht/Ee1juAy5abRB4gB61TlAWvwDiyn/dACiGOakddneCEmOywh7jsDLWKvVqRmsqEhYz5Egbku9Xwhenhth7YXNvIHyzgTWkgGKI6TuoR52NtaNcnseZi7z7PV1EGaqhh6mXaRxyZbJSdIhKmi4vVBZ6kxuyN451AmthtwpWmLWJCY7fK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB6723.namprd11.prod.outlook.com (2603:10b6:510:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 09:04:29 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 09:04:28 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 0/6] revert local patches and cherrypick same
 patches from drm-tip
Thread-Index: AQHaIdnkPM+a97sJZkepfuOaeDw5Zw==
Date: Tue, 28 Nov 2023 09:04:28 +0000
Message-ID: <b960630d6053350d589e431722a828ab49d8dce4.camel@intel.com>
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB6723:EE_
x-ms-office365-filtering-correlation-id: 1e073658-b45c-44ec-b7e6-08dbeff106e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cRrGwj8zow92QVbRXl5u3SFFc5n0eeYjSa+LK1KUo1X4aluY5RS8OtOJSPPwixRRgCrLILPqi4Qsv3b4eudDjGtJixBGEMw7GEX9E4RhmxN8gDg71VuxPKaC0ZuLpGG+9JlKiCGkrzO3JJEt/oRpfdt9My+8XleGt68q1xvjIfwJBp3ttHr3venk9sHjiv3+6X2YjG2uKHNsKAF3LDa4vjWEU7ZLCWS2QiQlPxaz2upH6uyH08xWdmSLBwoLBtyJ5/I/LC3p29zUbT3Uroujqf0svdC6FH2RUNo/Mw9KTNySxcQIvGZgkgbuQLlXd4B6nO5CoaDKEWbrUeGTDKEseyGP5GsbU0ZHHhYYCYDWLBgkdm85Gvv8EXR8WUFM/jgPoQAjN4/Ec9UhK9hoZsBQps4eGUkAteKHl5a4dGnrH2vIhIdt3rKe4jFyI52Tk2DCYxV1/6BSFvXOz/RurvZHnw+dHAKMgfkB3kRUE8ApsoOT5FivGCfxV/xD3P2RB0wGQVsKOWV2OVVh6OHQDQTxyi36tNGAhJqY1DjsjCRwh8loYiYTu08GUFzzNeoDDhjCNKt2D6sdxX6jJ9KGnJfEw6R3OsqEQTiifhT74j7HXUIdY3NqRwosanJAslGuRXji
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(122000001)(5660300002)(8936002)(66556008)(6486002)(8676002)(82960400001)(6512007)(6506007)(71200400001)(86362001)(91956017)(66946007)(316002)(110136005)(64756008)(66446008)(66476007)(478600001)(76116006)(41300700001)(36756003)(4001150100001)(2906002)(38070700009)(26005)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2UyOEtrV3Nndnk5RkRPc2MxMVNjVytGWjY4c0VUb2I3RkcybVVMMlE1UVY0?=
 =?utf-8?B?Ry9FeWRJUk1oWHZnK0l6NU5yOER1Q3QzbkRDamNBRVZTRndSSTBydjVjU3Jy?=
 =?utf-8?B?VGlRYnZVenVnR0JzYXlldU83N3U2cHBGVWZjcVd5T0VOZjFRVFI0MXM2ckRv?=
 =?utf-8?B?VkJab3R1cklIUy81OVpXcHlYRzFoTndyQzNveE5XREZEa3FqNjJUREpsL0Fn?=
 =?utf-8?B?VmNWZ0lDTXBJckR0V3JDc0RUb1RHR0JUbU0ydE1XcCtqNUdoTElySnBlWTN0?=
 =?utf-8?B?SjQ0SUVobVRHSWtHZyt1ODFYbVBwTUZYbjk5NEhlY09PeG0vc3praTByQ2RV?=
 =?utf-8?B?TzVtcURoQlh2MkhvdUhiak4xRnBiQzZPaFROR05YM041TjZzdGlRVmdXUkdG?=
 =?utf-8?B?THFVK2tkZHAzaVBnVUpDVW9CUUYyZlR6ejdBam0ybjAwd2FrNFplNVlZYTBK?=
 =?utf-8?B?ckh2NE82cExNVE9QSWtXU2xLYlc0YVB6c0ZzM3U0NmZqczBUUm1qRjJNSU9h?=
 =?utf-8?B?bFJpYzlRT01lMGRTYW9BUmY1Q3g1L2cwZWlPREs5Q3Bydk1rbFdMaEJvek5K?=
 =?utf-8?B?OGJUaEhaQXZZOWdqWml2Ylg1WXRNMHhNd1BCTHlQNkkwN2NzcC9XSzFRbFlU?=
 =?utf-8?B?b3A3ZkFmQVdzRkxDd1pHVmFNbnNIY0dBVVQwSlhKc25FOXkzclpPbm1LUDRy?=
 =?utf-8?B?Mk13aU9ZK0lZVXVteElXdFBpaE52SGJ4VnRlcVkramY4RTFkNzg1cThiNjU3?=
 =?utf-8?B?OWFJS0ZGaGMxU2pkT3AxL0dURjdhZFZ1dFF5dUphNis1MGw4K0ZncEliOHBj?=
 =?utf-8?B?a3I0VlIyd24xdkJFbmtlTnhmVFpSb3FPTlZUMS9OSVlKeWt2aUdvY0gvcGdL?=
 =?utf-8?B?Z0pDdXJYcVVDUGtRVFRHMnFYczA5ZlJjbkgzVzUrdmZ2YkJpSURBQnBUMmdy?=
 =?utf-8?B?bjBOMnNPWkpEMmtmdFZYeURMVXFmY1RWQ2V3MlVuWkNMaU9NbE1LMnpOZWJK?=
 =?utf-8?B?VC9qNXZzOTBqUklmdTUyNG80YlNnb3Z5azRtajVxd3ZFRHoyUWdZejRFYWZD?=
 =?utf-8?B?cWU1NTdwMzl5Z1lIVEVlMFN3K3RIVWQ5Mm41T2kvSWdrbHFiSG5HNTRIY1Zk?=
 =?utf-8?B?cTBtZFh2emJQd2I5UWwwQS83NDFpbHgwSkErUW51U285OFVId1dDT3lBbUVJ?=
 =?utf-8?B?YzJaRHdDY1NsbFlmVCtZdDJ6Y1d6aFpXbmhFbWRaVWxuS1hzTVZ5Z3J1Y2FU?=
 =?utf-8?B?djF2Q2JGZk1SZEpOUzRGT2NuMzhSSEN4aGFZNUVPUDlJQ2JDd0cyYmx1dWl1?=
 =?utf-8?B?YnAySGdzNW9OYUFER3VkcDlQMy9xY3RYQytFek1YQ0xhbGE1OExLYzg1d3lo?=
 =?utf-8?B?VHQ2bitLWUZ0bitZY0o0aERQV2pYZ3pva0N1Z3hNM0FxelFHOS9VeGZ0MXJj?=
 =?utf-8?B?K2pJc0lJN3pNbmZha3dMRDBGb3JuMG9ZYUE3ZTJCVVlrdTk1Zi9rcFlWUGgz?=
 =?utf-8?B?VjZGQWR0UE1oYk96M29lTitlR25nR0htbDNSSjVmNUlwdDBmaURaSU9JTHkr?=
 =?utf-8?B?QnpkYXFnbzZIamI5ZnNjazVTVGtaczAwWFQrWnpEUEdrNVFMeVZ5UGNjaVVV?=
 =?utf-8?B?L3BINTJXNHN0N2tDY3VjTTdSdDVFQkx6ZXlQT2NsaDFzTkZKTHovMXJILzRr?=
 =?utf-8?B?YVBGMVdUTkxIdXptd1JkTGJRcUFLWlBib0tvdlJmK2JMQ2hNTk9mdDg2clJu?=
 =?utf-8?B?cDMrNE0xaFhYM2l1OU1na3JVdmIxSGsvNGdHaEl4MG5TbkhCY2dsMysyV0FC?=
 =?utf-8?B?cTZSNGpFSEluemVZMDc0TlJ6V1ZlVDhnbHMyQUN0WlVJY2xGUUZFK0dlbW5V?=
 =?utf-8?B?aHFBV0ZIZ2NpWlU3YnBHOXJheVkxL1NYWDRIK01QV3AwZEMxRzFKak9RMW9B?=
 =?utf-8?B?N1pCL0VUUkNaYUpURjNFQUhDOG5udnN2aDNsOG9kMmlxbXpxVWVnQnp3WDE0?=
 =?utf-8?B?L05iOGJpSVZteTFaR3I1dG1aTGxUYXh6bVJ1U3VlM3M0a21EQTRLeFArK3Bk?=
 =?utf-8?B?b1FLdTRUVXVZd3dweERseHlHaXRVYjJWaE0rWFpua2w4dmFkVVdESmxWMXEx?=
 =?utf-8?B?SnlzYUZqaVBvWkIzbjVvYXkwQk1Hd3FRMTRqMWM2dGdJZ0krVTFGSGpOdEJv?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0D97E14E919E540B4D614ABA80B3963@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e073658-b45c-44ec-b7e6-08dbeff106e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 09:04:28.4428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VNkFCtMGQ5u0T5hWDCeeRD+60B0o15McAo6Verio0QAUbSofzsYeeNiVhhti8o0X9kZ1ZCVynOyYU9Z1B3VLtbyr8TYnwmzFf/jyYpcxJxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6723
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/6] revert local patches and cherrypick same
 patches from drm-tip
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

T24gTW9uLCAyMDIzLTExLTI3IGF0IDIxOjA5ICswMjAwLCBKdWhhLVBla2thIEhlaWtraWxhIHdy
b3RlOg0KPiBIZXJlIHJldmVydGVkIGxvY2FsDQo+ICogMWM3MDM3Nzc4MjIyIC0gZHJtL2k5MTUv
ZGlzcGxheTogSW4gaW50ZWxfZnJhbWVidWZmZXJfaW5pdCBzd2l0Y2gNCj4gdG8gdXNlIGludGVs
X2JvX3RvX2RybV9ibyAoMTIgZGF5cyBhZ28pIDxKdWhhLVBla2thIEhlaWtraWxhPg0KPiAqIGQx
OTJhNDc5YzU5MiAtIGRybS9pOTE1L2Rpc3BsYXk6IGluIHNrbF9zdXJmX2FkZHJlc3MgY2hlY2sg
Zm9yIGRwdC0NCj4gdm1hICgxMiBkYXlzIGFnbykgPEp1aGEtUGVra2EgSGVpa2tpbGE+DQo+ICog
Yzg3Nzc0YmQ5MjM3IC0gZHJtL2k5MTUvZGlzcGxheTogU2VwYXJhdGUgeGUgYW5kIGk5MTUgY29t
bW9uIGRwdA0KPiBjb2RlIGludG8gb3duIGZpbGUgKDEyIGRheXMgYWdvKSA8SnVoYS1QZWtrYSBI
ZWlra2lsYT4NCj4gDQo+IGFuZCBjaGVycnlwaWNrZWQgZnJvbSBkcm0tdGlwDQo+ID4gPiAqIHwg
fCB8IHwgMTJiNzE0MmU2NzlmIC0gZHJtL2k5MTUvZGlzcGxheTogSW4NCj4gPiA+IGludGVsX2Zy
YW1lYnVmZmVyX2luaXQgc3dpdGNoIHRvIHVzZSBpbnRlbF9ib190b19kcm1fYm8gKDQgZGF5cw0K
PiA+ID4gYWdvKSA8SnVoYS1QZWtrYSBIZWlra2lsYT4NCj4gPiA+ICogfCB8IHwgfCAxODViMjQ4
ODNlMjcgLSBkcm0vaTkxNS9kaXNwbGF5OiBpbiBza2xfc3VyZl9hZGRyZXNzDQo+ID4gPiBjaGVj
ayBmb3IgZHB0LXZtYSAoNCBkYXlzIGFnbykgPEp1aGEtUGVra2EgSGVpa2tpbGE+DQo+ID4gPiAq
IHwgfCB8IHwgMWFiYTY3MTMyY2JjIC0gZHJtL2k5MTUvZGlzcGxheTogU2VwYXJhdGUgeGUgYW5k
IGk5MTUNCj4gPiA+IGNvbW1vbiBkcHQgY29kZSBpbnRvIG93biBmaWxlICg0IGRheXMgYWdvKSA8
SnVoYS1QZWtrYSBIZWlra2lsYT4NCg0KVGhhbmsgeW91IEp1aGEtUGVra2EgZm9yIHRoZSBwYXRj
aGVzLiBUaGVzZSBhcmUgbm93IHB1c2hlZCB0byBkcm0teGUtDQpuZXh0Lg0KDQpCUiwNCg0KSm91
bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IA0KPiBKdWhhLVBla2thIEhlaWtraWxhICg2KToNCj4gwqAg
UmV2ZXJ0ICJkcm0vaTkxNS9kaXNwbGF5OiBJbiBpbnRlbF9mcmFtZWJ1ZmZlcl9pbml0IHN3aXRj
aCB0byB1c2UNCj4gwqDCoMKgIGludGVsX2JvX3RvX2RybV9ibyINCj4gwqAgUmV2ZXJ0ICJkcm0v
aTkxNS9kaXNwbGF5OiBpbiBza2xfc3VyZl9hZGRyZXNzIGNoZWNrIGZvciBkcHQtdm1hIg0KPiDC
oCBSZXZlcnQgImRybS9pOTE1L2Rpc3BsYXk6IFNlcGFyYXRlIHhlIGFuZCBpOTE1IGNvbW1vbiBk
cHQgY29kZSBpbnRvDQo+IMKgwqDCoCBvd24gZmlsZSINCj4gwqAgZHJtL2k5MTUvZGlzcGxheTog
SW4gaW50ZWxfZnJhbWVidWZmZXJfaW5pdCBzd2l0Y2ggdG8gdXNlDQo+IMKgwqDCoCBpbnRlbF9i
b190b19kcm1fYm8NCj4gwqAgZHJtL2k5MTUvZGlzcGxheTogaW4gc2tsX3N1cmZfYWRkcmVzcyBj
aGVjayBmb3IgZHB0LXZtYQ0KPiDCoCBkcm0vaTkxNS9kaXNwbGF5OiBTZXBhcmF0ZSB4ZSBhbmQg
aTkxNSBjb21tb24gZHB0IGNvZGUgaW50byBvd24NCj4gZmlsZQ0KPiANCj4gDQoNCg==
