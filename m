Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD19C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 20:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4775910FD06;
	Wed, 31 Jan 2024 20:55:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09810FD06
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706734502; x=1738270502;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aCp8rS685bzJBLlYnwEZgumQaacn6E32ukQDG9pS92Y=;
 b=C+pQyxk+1WDOPp9TWYuEJeZ9FoWH25huUiA+izHORUeFqd6t1PkgUn0F
 fWinNPDoFAbaoMNTXRdjLBaLThCU3GnwgllmVarGkPhzUjHVYqEbS4ly0
 1CSvTRV+5Awwqw0Z6U2SfUzNpiNyZT7PuUOcZubIhXjg7fWuYrpzSNiwE
 Dq5mLjvswvlQGI88rLuwAY9Lb7dv0cxEPCMBAL07ul9Dp9VQE5XaoI2J7
 wMBn9dE+ln+WkUVYu1qk520MnJSTOJgf6si3ZJgf3Ok7nycZFVV3Zs7eT
 A/IGcp3XscDcSz3Jyya4CajkUOokrIgu4aTO6WlCs+Ua/E42laNl1gDR4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17256437"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="17256437"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 12:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822711413"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="822711413"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 12:54:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:54:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:54:57 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 12:54:57 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 12:54:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9FS8BtfLPa8Wod9zAxau7rhdHp3/e6rPzlwFE/r8FGB6dbuyWRVHSoE4AB3l3NgIf34n3Nlc95DjkBWbpuzs6akF+o4hN3abZwsV7/aWt9ChxtkuPEA7rHSFwOlriSVWo4bJPkAlbMNpexdqwArZlbijt6QWzN50TU8O4zKIb8fqUhNbMmqip4S30Byh6t5mJvWhvvr6bTiPXO0gjbLU2aCyaKTyuusGudIFl1EtrWyGT4jdez2RnPLTWbOia4VDWKXC5reDJb4H4qRjc9L/1M/y/6IAKFSa7a0+P0R+g50vB1gAI7uhkJ9SYCqEROMbqfw9zfJdRmINFHsupkFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCp8rS685bzJBLlYnwEZgumQaacn6E32ukQDG9pS92Y=;
 b=SPCeRknFI1/+mtfBUbtfoT/MvnM08w4DIAevi104w+sVzm0qk8BATe38ioX9NEnPFwwx4LNlyIOILau9w+pjhxounNprXeAvp6BtQTeHx/EOGqQYpAt5CW2jLeAm4b3bepBWF1jjy9cM7Dq/kiKyMSqnQdb5XVz9lK5p9z3B4kTU+T1ce7YL89ZuGUDBiISbC51LMUMpVPmunkhPnvvILkOgo+f9FXJYRtCX2xXncJwEP1ofa37TLy2/hiPiE9C8nPMUhNu3/uTqBCpGBqF3ykaPyP/MrTjrFwkW9trY4W6igTVEUEbWn10sXdpfJZe8Yh83arTF3l2+rO+nxCrkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Wed, 31 Jan
 2024 20:54:48 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb%6]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 20:54:48 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 1/1] drm/xe: Expose number of dss per group and helpers
Thread-Topic: [PATCH v6 1/1] drm/xe: Expose number of dss per group and helpers
Thread-Index: AQHaVId9cm4OZQND4k6UIBlPj2ayiLD0Zh7w
Date: Wed, 31 Jan 2024 20:54:48 +0000
Message-ID: <IA1PR11MB8200F79306C66C7B6A26DB088F7C2@IA1PR11MB8200.namprd11.prod.outlook.com>
References: <20240131205242.293046-1-zhanjun.dong@intel.com>
 <20240131205242.293046-2-zhanjun.dong@intel.com>
In-Reply-To: <20240131205242.293046-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB8200:EE_|BL1PR11MB5301:EE_
x-ms-office365-filtering-correlation-id: 2be0d16f-a560-4895-015e-08dc229edcbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DvHH3SZwnK4rciFBooeimKd7x4Tc+C4GLXHFKb/6D/8mBNSwjApGsXNGErd4DxXCCi4bZSBFucSMhf6zPXU+5A98yS+fqlS6Zvs/FF/LhX42VdskkXw//CX3gTTlFkE1XnM68cGMayiCbTVASjfdT94+xus7y4PJ1UmQysCxvR6O++reiUAm7jnGM4yHtauzlwh8ZQnETs/S/Nbo8teVzFezwdifaSA1eqPBXumX7RNyPAeJ7EeTjs+pep+OTzLyI64mZCcIIs3JLfkEn74hzg3dKR/RVea0+MBN95EbdJA6Y70z0CNgbubKYMVyAIOruOkNq5NuWDQw4Kregrp7A5XYCGG5aDcJ68UpNgB5eq+s9UjPBduz6xGY4ikyielUVuNC5v3EbSzuj3rpH3yvjV395tXmQriKqEWulFHqXTbRDdHtZRg2W+zbyLAiYZUMJzKS+ywgBcnUN1avzxmhh+kYJM8186RWusOHitbksMeZQbxX+GKbsnPvuT4zRIOwGPKbLtKABEav5+DZNp46+2wkUmKgP8k/9ucPEj94yiBgvGpXzSikSPYWhpM8IhVdngvwAuv5jESID4X23p5aIYFrvHySQSEF7Hpt96dw0+ViKt4LDPissekILdblvZvC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(83380400001)(26005)(9686003)(478600001)(38100700002)(122000001)(7696005)(8936002)(52536014)(5660300002)(8676002)(2906002)(6506007)(53546011)(64756008)(66446008)(66476007)(66556008)(66946007)(71200400001)(76116006)(316002)(38070700009)(6916009)(82960400001)(33656002)(86362001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2xFTUI0RkVVeFVxRU1hLzlwdE9PY0VjWktod3hWcWtVSUVLcEFZTkwwV0p2?=
 =?utf-8?B?RExITm5INGtDRVNYeksxYSsxalAxUlhyRnhEMEpPVWpMMGFkcDE5RVNoL2hW?=
 =?utf-8?B?RTdiTkhzVTRGN29kRENGUUNjcVNyWDBJZTkraVFvZ0hYRzV6ZkFNRUU1UXNW?=
 =?utf-8?B?ZHBYYndzTzlndERjeWlPZmxJS3krM2hjVFp6TS9MQm40QllrTTh3RjBMRXJs?=
 =?utf-8?B?c29XbjlGc1pHR0RPcnNvMWpLTmlUV21UbXc5Qyt2SlQ4WVBRaVpGay9zTk45?=
 =?utf-8?B?YUpHbEhzV0QwdGhXQzdZelQ1N2FhVzNmWXZiNjUyMTRJZmRNMTlzRHZ6Rkg4?=
 =?utf-8?B?YUl0WUg2Tmt0eFJZbTl5NmNhRUZaSWcwR0VSb0hxazZoMzNENmlNeU9SQllB?=
 =?utf-8?B?dDJzTGNscStxMnUyUnV1ai8ycnYwUERudFpadnBjVEpoN1ltR0hDRGFiNVhR?=
 =?utf-8?B?ZDZhZzJscHJaTGh4ejdSbzhiRTlYcVMvMllTUE1nWGhneHgvaHFPN3dFeHJ3?=
 =?utf-8?B?WDI4Wkw4TjFvRkNtOXR5N2FRUnRMWWRhaUQzNEprMjFKays3c2FPc0Nydkw5?=
 =?utf-8?B?TWs0ekNwdEZCWVNWSWdCM1l4Qm8vUTU3bmhmak0wMENtYW9VMjZKOVVTQ1gz?=
 =?utf-8?B?T2I1QXBvK1NLMUppRnM1MTc2UDFHSTduK0ViN2FUdkhKT3V1SXB1djlhQU9K?=
 =?utf-8?B?d05TaVVWTTA2T2VYZTR5NEI2UFMrWXZvK3pETzVWSTBYaElXY2JuSm45cSs4?=
 =?utf-8?B?MDk1b2NBN1JROWZyb1VDTEZ2V05PWlc1VEs3QXVSMU1UMWM4N2NGYlg4VkR3?=
 =?utf-8?B?YWs5cFRoMU55WGU2aEVIY1JaQllBWXZTdTRuQmtmQWJaWDJvQWh0OC9YRzc0?=
 =?utf-8?B?eEV6QlFKWW9senZYVWp3MVdUWC9WTk00MnZVakpuT04vK2NWVVRGTERuSEhK?=
 =?utf-8?B?anZzQzlNQ2Fub2s5Mkd2b1NlR3R2R0Z6bS9yREduV1JUOTE3VXY2M3ovTEUx?=
 =?utf-8?B?cXMvN0Nhc2I5emNvOVU0YUdTeTVHaUtSVW52bm9CY0FWeFVaMWtnSVplcnBE?=
 =?utf-8?B?Vmk1SEN5ZmsxZFB2dlBHTEU2WTBqTEZDNkxMc0h2LzJSczh6cHo4ZUN1cGY1?=
 =?utf-8?B?bkIycXdHNlgwM0ZKc3duNk9NV281SzkzQy91ZXdDQmRteXFWNGNBREU4VEY1?=
 =?utf-8?B?QyttWXAybDg5T0xvelZjcjd5SU1ZbE5CZEhTdDhKZGhCRWdjRlJrZnZWcWFl?=
 =?utf-8?B?SUU5U0s0U1RYV1c0QmhXcHUyTXBoOEs1ZzFMcllCaWw2eFdJYXJ3VFk3Q21t?=
 =?utf-8?B?dFQ3VnRzajgxbGF5cDRHVE1FeENBeE9mVXphSXVsZTEydXQxNzBTeTNoK294?=
 =?utf-8?B?NzRSZzlQbG16TXBiTnF6TjRQcmtuTDdrbXRTWDJHN004Wk5RVkE3RUQvYm9m?=
 =?utf-8?B?Q1pDK3hxNjVtaXRHWnkvcEZONmpaK2RZQkJuQW1PaWRQQkxnSlAwcUtNKzRV?=
 =?utf-8?B?NXlFUXI3M3RYY0pvNDBHUW9pMStWckp2a2l5V1VwOGtIMWhoK1RqdU1qdms1?=
 =?utf-8?B?ZzFlTnN4RjhOZ3JCeFQ5bkgzMU5id3ZqaEJuUmdJTElvak5QWmRYeXlyVkpC?=
 =?utf-8?B?Z1Myd0RCNTZJRldWTTZ5S04zSmZ6OUdMc0FDSVg1eXd3MGNvUE94T0RCd21m?=
 =?utf-8?B?R0g1S1pOVGdRdTFpcWdpaWZhK2EzTlJlbndsVXQ0dURldzA2R2U4YTVaWkRC?=
 =?utf-8?B?STkyU0ZoWXlXQXJmVmZJbi9SeTMvZzhoYkMyb1pYbzFZcXBCeThjZkRXanZJ?=
 =?utf-8?B?VzhZU2JhUkhJUFpCaU9RZEwxclVMbkdkWjhLS25RbjduRmtndkpFbFVhamZP?=
 =?utf-8?B?SkxFblQ1dndLemoyNEZzbllDelZaOUJTdHZKVytvZXJKUzgzSWNGRGUwb1Nl?=
 =?utf-8?B?Y2NyUHhNQlg1Q3BFUFFNeGhVQWNwa0pUVG5mRDRuNFAyaXczbnorbXpCdlVq?=
 =?utf-8?B?ZFM4MDRyTERabUVIWU5nNk1NNEQ5czRKem52QS9NNEtLUURuK3ZEUEM2U2p6?=
 =?utf-8?B?SUlwcEVNSUhwZlo2YmNJSEpVLzc0YWxET095S0FPeHRmYUVvL3IrR0tVUmJm?=
 =?utf-8?Q?+Iz168I0gGfYuLkRNEedXgb9a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be0d16f-a560-4895-015e-08dc229edcbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 20:54:48.2637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fuJVQP0WbX1oGLpluPV1LNpl8g4eacJGyNDM0nBG+J6QKQjLO6RxRwiREYr/9wtw5uYZZkC60qk/reloQSQgaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
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

UGxlYXNlIGlnbm9yZSBpdC4NClVwZGF0ZWQgcGF0Y2ggd2lsbCBiZSBzZW50IG91dCBzb29uLg0K
DQpSZWdhcmRzLA0KWmhhbmp1bg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IERvbmcsIFpoYW5qdW4gPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgSmFudWFyeSAzMSwgMjAyNCAzOjUzIFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gQ2M6IERvbmcsIFpoYW5qdW4gPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCB2NiAxLzFdIGRybS94ZTogRXhwb3NlIG51bWJlciBvZiBkc3Mg
cGVyIGdyb3VwIGFuZCBoZWxwZXJzDQo+IA0KPiBFeHBvc2UgaGVscGVyIGZvciBkc3MgcGVyIGdy
b3VwLiBUaGlzIGlzIGEgcHJlY3Vyc29yIHBhdGNoIHRvIGFsbG93DQo+IGZvciBlYXNpZXIgaXRl
cmF0aW9uIHRocm91Z2ggTUNSIHJlZ2lzdGVycyBhbmQgb3RoZXIgcGVyLURTUyB1c2VzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYyAgICAgIHwgMzQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3Iu
aCAgICAgIHwgMTQgKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9w
b2xvZ3kuYyB8IDE3ICsrKysrKysrKysrKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3RvcG9sb2d5LmggfCAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCAg
ICB8ICAyICsrDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5jDQo+IGluZGV4IDg1NDZjZDNjYzUwZC4u
NzExY2JmZDhhNDg4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNy
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5jDQo+IEBAIC0yOTEsMTEg
KzI5MSw0MyBAQCBzdGF0aWMgdm9pZCBpbml0X3N0ZWVyaW5nX21zbGljZShzdHJ1Y3QgeGVfZ3Qg
Kmd0KQ0KPiAgCWd0LT5zdGVlcmluZ1tMTkNGXS5pbnN0YW5jZV90YXJnZXQgPSAwOwkJLyogdW51
c2VkICovDQo+ICB9DQo+IA0KPiArc3RhdGljIGludCB4ZV9ndF9tY3JfZ2V0X2Rzc19wZXJfZ3Jv
dXAoc3RydWN0IHhlX2d0ICpndCkNCj4gK3sNCj4gKwlyZXR1cm4gZ3RfdG9feGUoZ3QpLT5pbmZv
LnBsYXRmb3JtID09IFhFX1BWQyA/IDggOiA0Ow0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIHhl
X2d0X21jcl9nZXRfZHNzX3N0ZWVyaW5nIC0gcmV0dXJucyB0aGUgZ3JvdXAvaW5zdGFuY2Ugc3Rl
ZXJpbmcgZm9yIGENCj4gRFNTDQo+ICsgKiBAZ3Q6IEdUIHN0cnVjdHVyZQ0KPiArICogQGRzczog
RFNTIElEIHRvIG9idGFpbiBzdGVlcmluZyBmb3INCj4gKyAqIEBncm91cDogcG9pbnRlciB0byBz
dG9yYWdlIGZvciBzdGVlcmluZyBncm91cCBJRA0KPiArICogQGluc3RhbmNlOiBwb2ludGVyIHRv
IHN0b3JhZ2UgZm9yIHN0ZWVyaW5nIGluc3RhbmNlIElEDQo+ICsgKg0KPiArICogUmV0dXJucyB0
aGUgc3RlZXJpbmcgSURzICh2aWEgdGhlIEBncm91cCBhbmQgQGluc3RhbmNlIHBhcmFtZXRlcnMp
IHRoYXQNCj4gKyAqIGNvcnJlc3BvbmQgdG8gYSBzcGVjaWZpYyBEU1MgSUQuDQo+ICsgKi8NCj4g
K2Jvb2wgeGVfZ3RfbWNyX2dldF9kc3Nfc3RlZXJpbmcoc3RydWN0IHhlX2d0ICpndCwgdW5zaWdu
ZWQgaW50IGRzcywNCj4gdW5zaWduZWQgaW50ICpncm91cCwNCj4gKwkJCQl1bnNpZ25lZCBpbnQg
Kmluc3RhbmNlKQ0KPiArew0KPiArCWludCBkc3NfcGVyX2dycDsNCj4gKw0KPiArCWlmIChkc3Mg
Pj0gWEVfTUFYX0RTU19GVVNFX0JJVFMpIHsNCj4gKwkJeGVfZ3RfZGJnKGd0LCAiRFNTIGlkIG91
dCBvZiByYW5nZTogJWRcbiIsIGRzcyk7DQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsN
Cj4gKwlkc3NfcGVyX2dycCA9IHhlX2d0X21jcl9nZXRfZHNzX3Blcl9ncm91cChndCk7DQo+ICsN
Cj4gKwkqZ3JvdXAgPSBkc3MgLyBkc3NfcGVyX2dycDsNCj4gKwkqaW5zdGFuY2UgPSBkc3MgJSBk
c3NfcGVyX2dycDsNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIHZvaWQg
aW5pdF9zdGVlcmluZ19kc3Moc3RydWN0IHhlX2d0ICpndCkNCj4gIHsNCj4gIAl1bnNpZ25lZCBp
bnQgZHNzID0gbWluKHhlX2Rzc19tYXNrX2dyb3VwX2ZmcyhndC0NCj4gPmZ1c2VfdG9wby5nX2Rz
c19tYXNrLCAwLCAwKSwNCj4gIAkJCSAgICAgICB4ZV9kc3NfbWFza19ncm91cF9mZnMoZ3QtDQo+
ID5mdXNlX3RvcG8uY19kc3NfbWFzaywgMCwgMCkpOw0KPiAtCXVuc2lnbmVkIGludCBkc3NfcGVy
X2dycCA9IGd0X3RvX3hlKGd0KS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9QVkMgPw0KPiA4IDogNDsN
Cj4gKwl1bnNpZ25lZCBpbnQgZHNzX3Blcl9ncnAgPSB4ZV9ndF9tY3JfZ2V0X2Rzc19wZXJfZ3Jv
dXAoZ3QpOw0KPiANCj4gIAlndC0+c3RlZXJpbmdbRFNTXS5ncm91cF90YXJnZXQgPSBkc3MgLyBk
c3NfcGVyX2dycDsNCj4gIAlndC0+c3RlZXJpbmdbRFNTXS5pbnN0YW5jZV90YXJnZXQgPSBkc3Mg
JSBkc3NfcGVyX2dycDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9t
Y3IuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaA0KPiBpbmRleCAyN2NhMWJj
ODgwYTAuLjkxY2YwMmI5N2JjMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X21jci5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaA0KPiBAQCAt
Nyw2ICs3LDggQEANCj4gICNkZWZpbmUgX1hFX0dUX01DUl9IXw0KPiANCj4gICNpbmNsdWRlICJy
ZWdzL3hlX3JlZ19kZWZzLmgiDQo+ICsjaW5jbHVkZSAieGVfZ3RfdHlwZXMuaCINCj4gKyNpbmNs
dWRlICJ4ZV9ndF90b3BvbG9neS5oIg0KPiANCj4gIHN0cnVjdCBkcm1fcHJpbnRlcjsNCj4gIHN0
cnVjdCB4ZV9ndDsNCj4gQEAgLTI1LDUgKzI3LDE3IEBAIHZvaWQgeGVfZ3RfbWNyX211bHRpY2Fz
dF93cml0ZShzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QNCj4geGVfcmVnX21jciBtY3JfcmVnLA0K
PiAgCQkJICAgICAgIHUzMiB2YWx1ZSk7DQo+IA0KPiAgdm9pZCB4ZV9ndF9tY3Jfc3RlZXJpbmdf
ZHVtcChzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApOw0KPiArYm9vbCB4
ZV9ndF9tY3JfZ2V0X2Rzc19zdGVlcmluZyhzdHJ1Y3QgeGVfZ3QgKmd0LCB1bnNpZ25lZCBpbnQg
ZHNzLA0KPiB1bnNpZ25lZCBpbnQgKmdyb3VwLA0KPiArCQkJCXVuc2lnbmVkIGludCAqaW5zdGFu
Y2UpOw0KPiArDQo+ICsvKg0KPiArICogTG9vcCBvdmVyIGVhY2ggRFNTIGFuZCBkZXRlcm1pbmUg
dGhlIGdyb3VwIGFuZCBpbnN0YW5jZSBJRHMgdGhhdA0KPiArICogc2hvdWxkIGJlIHVzZWQgdG8g
c3RlZXIgTUNSIGFjY2Vzc2VzIHRvd2FyZCB0aGlzIERTUy4NCj4gKyAqLw0KPiArI2RlZmluZSBm
b3JfZWFjaF9kc3Nfc3RlZXJpbmcoZHNzXywgZ3RfLCBncm91cF8sIGluc3RhbmNlXykgXA0KPiAr
CWZvciAoZHNzXyA9IHhlX2d0X3RvcG9sb2d5X2dldF9uZXh0X2RzcyhndCwgMCk7IFwNCj4gKwkg
ICAgIGRzc18gPj0gMDsgXA0KPiArCSAgICAgZHNzXyA9IHhlX2d0X3RvcG9sb2d5X2dldF9uZXh0
X2RzcyhndCwgZHNzXyArIDEpKSBcDQo+ICsJCWZvcl9lYWNoX2lmKHhlX2d0X21jcl9nZXRfZHNz
X3N0ZWVyaW5nKGd0XywgZHNzXywgJihncm91cF8pLA0KPiAmKGluc3RhbmNlXykpKQ0KPiANCj4g
ICNlbmRpZiAvKiBfWEVfR1RfTUNSX0hfICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfdG9wb2xvZ3kuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90b3Bv
bG9neS5jDQo+IGluZGV4IGE4ZDdmMjcyYzMwYS4uMzc1OTZkNWY5NTc0IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3kuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdG9wb2xvZ3kuYw0KPiBAQCAtMTEsOSArMTEsNiBAQA0KPiAgI2luY2x1
ZGUgInhlX2d0LmgiDQo+ICAjaW5jbHVkZSAieGVfbW1pby5oIg0KPiANCj4gLSNkZWZpbmUgWEVf
TUFYX0RTU19GVVNFX0JJVFMgKDMyICogWEVfTUFYX0RTU19GVVNFX1JFR1MpDQo+IC0jZGVmaW5l
IFhFX01BWF9FVV9GVVNFX0JJVFMgKDMyICogWEVfTUFYX0VVX0ZVU0VfUkVHUykNCj4gLQ0KPiAg
c3RhdGljIHZvaWQNCj4gIGxvYWRfZHNzX21hc2soc3RydWN0IHhlX2d0ICpndCwgeGVfZHNzX21h
c2tfdCBtYXNrLCBpbnQgbnVtcmVncywgLi4uKQ0KPiAgew0KPiBAQCAtMTY3LDMgKzE2NCwxNyBA
QCBib29sIHhlX2d0X3RvcG9sb2d5X2hhc19kc3NfaW5fcXVhZHJhbnQoc3RydWN0DQo+IHhlX2d0
ICpndCwgaW50IHF1YWQpDQo+IA0KPiAgCXJldHVybiBxdWFkX2ZpcnN0IDwgKHF1YWQgKyAxKSAq
IGRzc19wZXJfcXVhZDsNCj4gIH0NCj4gKw0KPiAraW50IHhlX2d0X3RvcG9sb2d5X2dldF9uZXh0
X2RzcyhzdHJ1Y3QgeGVfZ3QgKmd0LCBpbnQgZnJvbSkNCj4gK3sNCj4gKwl4ZV9kc3NfbWFza190
IGFsbF9kc3M7DQo+ICsJdW5zaWduZWQgbG9uZyBuZXh0Ow0KPiArDQo+ICsJYml0bWFwX29yKGFs
bF9kc3MsIGd0LT5mdXNlX3RvcG8uZ19kc3NfbWFzaywgZ3QtDQo+ID5mdXNlX3RvcG8uY19kc3Nf
bWFzaywNCj4gKwkJICBYRV9NQVhfRFNTX0ZVU0VfQklUUyk7DQo+ICsNCj4gKwluZXh0ID0gZmlu
ZF9uZXh0X2JpdChhbGxfZHNzLCBYRV9NQVhfRFNTX0ZVU0VfQklUUywgZnJvbSk7DQo+ICsJaWYg
KG5leHQgPT0gWEVfTUFYX0RTU19GVVNFX0JJVFMpDQo+ICsJCXJldHVybiAtMTsNCj4gKwlyZXR1
cm4gbmV4dDsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90
b3BvbG9neS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmgNCj4gaW5k
ZXggZDFiNTRmYjUyZWE2Li40NGJkOGE1OGY5Y2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90b3BvbG9neS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF90b3BvbG9neS5oDQo+IEBAIC0yMSw1ICsyMSw2IEBAIGJvb2wgeGVfZHNzX21hc2tfZW1wdHko
Y29uc3QgeGVfZHNzX21hc2tfdCBtYXNrKTsNCj4gDQo+ICBib29sDQo+ICB4ZV9ndF90b3BvbG9n
eV9oYXNfZHNzX2luX3F1YWRyYW50KHN0cnVjdCB4ZV9ndCAqZ3QsIGludCBxdWFkKTsNCj4gK2lu
dCB4ZV9ndF90b3BvbG9neV9nZXRfbmV4dF9kc3Moc3RydWN0IHhlX2d0ICpndCwgaW50IGZyb20p
Ow0KPiANCj4gICNlbmRpZiAvKiBfWEVfR1RfVE9QT0xPR1lfSF8gKi8NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3R5cGVzLmgNCj4gaW5kZXggNzBjNjE1ZGQxNDk4Li5iOTI2NjA2ZWRiMzggMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+IEBAIC0yNSw3ICsyNSw5IEBAIGVudW0geGVf
Z3RfdHlwZSB7DQo+ICB9Ow0KPiANCj4gICNkZWZpbmUgWEVfTUFYX0RTU19GVVNFX1JFR1MJMw0K
PiArI2RlZmluZSBYRV9NQVhfRFNTX0ZVU0VfQklUUwkoMzIgKiBYRV9NQVhfRFNTX0ZVU0VfUkVH
UykNCj4gICNkZWZpbmUgWEVfTUFYX0VVX0ZVU0VfUkVHUwkxDQo+ICsjZGVmaW5lIFhFX01BWF9F
VV9GVVNFX0JJVFMJKDMyICogWEVfTUFYX0VVX0ZVU0VfUkVHUykNCj4gDQo+ICB0eXBlZGVmIHVu
c2lnbmVkIGxvbmcgeGVfZHNzX21hc2tfdFtCSVRTX1RPX0xPTkdTKDMyICoNCj4gWEVfTUFYX0RT
U19GVVNFX1JFR1MpXTsNCj4gIHR5cGVkZWYgdW5zaWduZWQgbG9uZyB4ZV9ldV9tYXNrX3RbQklU
U19UT19MT05HUygzMiAqDQo+IFhFX01BWF9FVV9GVVNFX1JFR1MpXTsNCj4gLS0NCj4gMi4zNC4x
DQoNCg==
