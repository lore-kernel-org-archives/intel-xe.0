Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D511C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 21:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4210E074;
	Tue, 16 Jan 2024 21:48:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9B810E074
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 21:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705441692; x=1736977692;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UpBlYXR8Zd7/y8KIIVp4/claXL1tZ1uyPk3IujHS+S8=;
 b=YNlozMkbYmNBLem4IGj3GXszIKlaX4w6tL1vLHzFnllduJsTKTA9bMFQ
 y0faTwnnsB0RNeXw6Aem9pgrS95S22QgNbwJZi7SlMVyAHiRoLcGJeWKV
 /1RTSc3Of0a1+ouObAv/PYOKWJMKOkNs4BQu7BoRBRC8YhkSQiY9vhMQh
 dtmI81NpYZ8SPIPelbxsOeeJZcasViXmnpTMtm4dq8rcrQXz1jb55Z6kv
 RuVzbOyW0vlkdjTm9YBai+bjl4HUIa0DmYbOvc+fARqLEV5Qfb8HfMKcH
 PeVFqS77Vxm7nnoIBrpIFcnHemcHVRdto301QKNQ0F+dKqxk5BFBMQ8s/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="403751441"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="403751441"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 13:48:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874608597"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="874608597"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 13:48:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 13:48:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 13:48:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 13:48:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 13:48:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwBKeHZ5xWkIQBViPWEta2ZRu7gRVNkdNUCUbpJovt9jt/XyLobN8ux3dbMsNp/kc6+e/ViF1yM7JtNh8KfQZLN2YtpTvMEi0qk6xKx6Hb7gj9iHw9y3IIx6lc4bjCwLETtEujAPZKgOePshzB+091+XhR/Zany8fCjqzvfbMhVfmRUyQbf7sBZaTibfiSJR+QrGdU1bVMtsPwS/xSKvE/Ux6GfGRAXuGLIpJCiyBb3f7IbaHFYrYgzmLajy/n5LOWviMTp7tGTWEaMiP83vowtMK8eH4ynEh2mW33Ela1RYQcneDKtex/KRAlQ/dKcN72vvBIQ9zpChah3XeBpHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpBlYXR8Zd7/y8KIIVp4/claXL1tZ1uyPk3IujHS+S8=;
 b=EUDJMR1Tla6igcalZuAfMDvbe83YlpSEQSZl/j1ykqcZrxQG/JcHi7jeQU/KB84tCxGLqfGL3NPlyUrQWjcSbo1PXb31fazQn/YnNkTZ4nqviwQpr/3CZwl95iko/dzJ5wu1nFasaAWFc3iReSbxZ5WovGdV/ohn6dfXc7S1MHDA4FabXMGtnWDC97zpMqR7cwiiwaaCIlMVyeS7kZ0foZWsgZCCD9BciVihAnbyleuE/0d+dphBjGGD8JxDTeciGbrJPXqb7HWHP4i+/pXFL7B1ldPIDYU1xbNQanbaDHOwBctsbwO71ggiigmHVWmVMXu4Z2ZkCEIdJOtTlPxPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA3PR11MB8002.namprd11.prod.outlook.com (2603:10b6:806:2f6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.21; Tue, 16 Jan 2024 21:48:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7181.026; Tue, 16 Jan 2024
 21:48:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Add kernel-doc for CCS mode selection
Thread-Topic: [PATCH 3/3] drm/xe: Add kernel-doc for CCS mode selection
Thread-Index: AQHaMIMlEJpB3nPQUUCHchFilc9UmrDdKlaA
Date: Tue, 16 Jan 2024 21:48:05 +0000
Message-ID: <ce5251bd1e8431fcf91adb0e57658a0dfb852673.camel@intel.com>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231216214120.7394-4-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA3PR11MB8002:EE_
x-ms-office365-filtering-correlation-id: 76ae18e5-4383-4682-a14a-08dc16dcd1ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XRmIwYXos9VPleTLBT4RNV84cKoFcHZI1B8WHVHHCkXbj6ieaW4HbWJe9a1akYu0khQJfUu4kj2tGXhkqTu6JY8GcZrUZQIS4Uwh7vz/bR/JeInvZxlhxiKSMIJWsUpIsNOL8iH7LTlN1uP0CigRjJ2eKlBBVp4xq2ryLzQoWkmgZbZlIAI4nhwxQc6XitaHmQOjuy4uGLvZ6HRW5gTtsWbTvJHIQPMDQ1TLx4TAftSdiqCuMgliD2UHRt9wfSbqNc83Cd7sdbjDV4fyrzfPJn+72FhJDiDIcyaVK/Oh5Fj6fd17W+vGicjkyuydBTqnjI6zPXgHAfCKsV9jnojwNOzjpK6iZEe4zSsFdHq6H1299ie6Uqbb07VmralmRRujdEICFygoTABjne7auQBJ1A/BL63HaMtsldJReu4tnKdfqhQX4f1/hoEytxG0Nb20dD3Mcz1hPiO9CY1P0ntdSh20xifmDP/VWnUk5k3CH+PSDPpXFUnWdpLsq39NfbCY7yKz0dAmu6EF/z6WnrjiI9WOgYfAQ5vNXzmuPXPSXxKaogOSq2gx6ATuPSsbKCJpWZ5VfMvrZ1ulHjYOJRQcZv0cQWopXWLPr+F+NB6TaZUhgMDbWmVs7LWsrwL6bQWb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(5660300002)(110136005)(38100700002)(91956017)(2906002)(6512007)(76116006)(316002)(4326008)(8676002)(4001150100001)(86362001)(122000001)(64756008)(82960400001)(66556008)(8936002)(66946007)(66446008)(6636002)(6506007)(478600001)(6486002)(2616005)(71200400001)(36756003)(66476007)(38070700009)(26005)(41300700001)(83380400001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0Q5eHBlZEhJLzJXKzh0ZmEySFZhNG9mTno4di9GaXFRQ3FaYkZxTVBFekZn?=
 =?utf-8?B?b2h3eFVyNmJNbHJUNG53RnREMmNRV2lpSWVldEFoSmJIK3UxaUFaSUg1RWFa?=
 =?utf-8?B?MGQ2SzlPYnR4YklPK2dramdndFhYTU9EWXJuSC9LVzNqVG4wRG9NZGVzZzk4?=
 =?utf-8?B?VzJPckFTdEcxU3ZTd2p6QjI5WUNZMlNjRVllbUZnNDhvVFdzK0hPUWlraDBZ?=
 =?utf-8?B?QUZjVkFGd2hFWUs5N0xMRTRUUDhLeEY5MUMrZ0NVMW5GN0lENUxtMjBzd3NF?=
 =?utf-8?B?Ti9BQUp3ZDdUR1oxN2xxalNwS3VUdEpmeEkvQ3VhM0d5UTF6QjFHTUJNM1BS?=
 =?utf-8?B?eUhQN00xNFVrWmNDS1l3WUFYc3Z4NzhWdXA3REJKUW5PbGdKd0xhUUplKzNh?=
 =?utf-8?B?bm1lR3pkeTd0cmcyOUk3QWhnRjRWMzdkck1uKzYvdGxlTi8raEUrMHVZS2NR?=
 =?utf-8?B?aTh0T2JldnpJMlduRFJLWjBwdkU2azVxMDBTbnk3Z2tHOTFCY2pweHZtZUIy?=
 =?utf-8?B?TVA4YVh1b1cwQWZrb1Z3ZVlNMitEUDZlTU5lVnV1NWFUZzhvQmttSWptQWs5?=
 =?utf-8?B?UGFUMnl1YnkwelVqY3dCNDB1U0NRbXVVTEh0alArWTg4d3RlME1MMnhMc3l2?=
 =?utf-8?B?RFdnZGNabFVRL2F0Qm1LNUpLNGtoZWF1dVFxZzZWNXYvdUhrN0ZnNStTUXV6?=
 =?utf-8?B?WUx6eUlzNmo5d1UxeFBvNm4xaERhbzUzaWloY3lOSkhIYmoxVlJDUHVBcnJi?=
 =?utf-8?B?cDBUK1JPdGl6SWNNcE5rSWdMMlhXSDlWbGNDV2JxOWxTRVUwTmc2bTA3Wm5R?=
 =?utf-8?B?bUFxQmJCL1pvYllUbk9GNjBBcTFIaEFXbHFVN3pQSWhUT1FwQkpQeGVFUm10?=
 =?utf-8?B?UHBua0pyd0MvNXlyd3dPRFVtM1JZTGxZMTBzMFlML3oxMXhTS01GYklNRDJE?=
 =?utf-8?B?Q1NNc3Z6eVBDc1RwKzhvWk1vVVVmUTBCM0d2VHNsWDVRWTY4UFZHalJtV1R6?=
 =?utf-8?B?bWZFeDNCaUlOVGhDVXlKTkxIdENCMS91cU9wQnI1YWdtMitjUVZIalB4TnZn?=
 =?utf-8?B?VnFPSjJrT3hnMFAxQTZXcERaZXhhMkl1UFBDaHExQnJkbEJwVS9JOEhXeFhS?=
 =?utf-8?B?WXNmNDAxSytnOUZ5c2hCczFLa3RpeVRGZXFBY1o4OFRla2VEUGJDMmdLTlRx?=
 =?utf-8?B?ZDlZNEU2ZnFNK0daRGEva01CaWF1VU1jTTRFblJYOEFYYVRiZnp6QzBTc3Jq?=
 =?utf-8?B?YWZHaTdSNkZPMUhhUWg1SWFHdmp0cHl2eHN4Q2pxbHRoc005dDNTY3BZWXNw?=
 =?utf-8?B?ekJpTUJtTGJ2WHNINWRESmpoZ0trckRjK2R1MXAxdHhXdHkwUWZRMzYwZkhQ?=
 =?utf-8?B?anlHbHM0NWJwZkxoUFlqNmNNSFM0SzNMalpNM2Jna1N3ZnI2TldVaW5iK2VP?=
 =?utf-8?B?UXliZFRLNDZxUlNoRTZMZkdRZk56cVAydWN5ejgvdUM1VHVkNGpaWHhybm82?=
 =?utf-8?B?TGNNaEFybUs1aGlRUWxzVVdBUUxLN001ZkppaW9XV1dNOWJHTkk3RFpObFVM?=
 =?utf-8?B?TThzeklOdWJ5NExsWGN2cU41RCtYN1QvZVJGYjhiaWlTMzdxbHc3bVd2UnJI?=
 =?utf-8?B?T2FzMVdkaXN0OGpiTjNjdmxTdktudWNtd0UwaFcwYWo4elVrWG1IcTU5QVNh?=
 =?utf-8?B?ZjIvdmpGVnMwYThwS3gyZXB0Zk5PSmNJMGNBcFJnTjY3TTJGNDNNcGNLQVhz?=
 =?utf-8?B?SHBNaXhaRlAxc0Z1ekNQdU1TK3ZpYUxnb2h0QXpNQ3NZQmoxQ2JEenI2VXBV?=
 =?utf-8?B?U2xkRzgzUHFZU0pPSEF5cFBRdDBjdHVDdFVSNUQ0NWl5VEo3SzdjQjV1VExx?=
 =?utf-8?B?YWNDak1CSnJOUUR3SUNzdGRURFViM1kraXFKQ2UzUDZqaERiWUtEc0ZXMFd3?=
 =?utf-8?B?QS81U0ZtSnFEYXZmby82bG5TRzNGeUpLY0ZHcXBlZWtTVFlmSEdCRHJUWk1E?=
 =?utf-8?B?U29aSEp1QzVtejFpejl2SWNmaWNlcWdsVXBjemFVU2hLTHc5aGxmWmdXL0Vl?=
 =?utf-8?B?WXllV0lPUzdtekx3OFBUV0hxZVM1WVNrR1FTWWJMOFA5ZEZwcXA5Z29SMGR5?=
 =?utf-8?B?ZW95OFpSUEF5VmpUVUZpbkJOajBsRzRqeXlVTndkaXd6OGY2NmhSQjRTYmpL?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADE8972CB1B38D439DA9E820360823AE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ae18e5-4383-4682-a14a-08dc16dcd1ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 21:48:05.0307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: riHLTvTS5E8WlDUPfMDGeezhNallqyQg+YqMiYRthMC86IHtQURufgPT0SCrQDI9F1kTpwkqkYZG2520Jo9t0VqSy4xm+GxuXn1Ad6vAmlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8002
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTEyLTE2IGF0IDEzOjQxIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBNb3ZlIGFsbCBDQ1MgbW9kZSBkb2N1bWVudGF0aW9uIGluY2x1ZGluZyB0
aGF0IG9mIHN5c2ZzDQo+IGludGVyZmFjZXMgdG8gYSBzaW5nbGUga2VybmVsLWRvYyBzZWN0aW9u
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYQ0KPiA8bmly
YW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBTdHVhcnQg
U3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoERvY3VtZW50
YXRpb24vZ3B1L3hlL2luZGV4LnJzdMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+IMKgRG9jdW1lbnRh
dGlvbi9ncHUveGUveGVfY2NzX21vZGUucnN0IHwgMTQgKysrKysrKysrKysrKysNCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2NzX21vZGUuY8KgIHwgMjggKysrKysrKysrKysrKysrKysr
KysrKy0tLS0NCj4gLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaMKgwqDC
oMKgIHzCoCA3ICstLS0tLS0NCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2dw
dS94ZS94ZV9jY3NfbW9kZS5yc3QNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dw
dS94ZS9pbmRleC5yc3QNCj4gYi9Eb2N1bWVudGF0aW9uL2dwdS94ZS9pbmRleC5yc3QNCj4gaW5k
ZXggYzIyNGVjYWVlODFlMS4uMWRiOGQyMDk0MmI0ZSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9ncHUveGUvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L3hlL2luZGV4
LnJzdA0KPiBAQCAtMTQsNiArMTQsNyBAQCBERzIsIGV0YyBpcyBwcm92aWRlZCB0byBwcm90b3R5
cGUgdGhlIGRyaXZlci4NCj4gwqDCoMKgIHhlX21tDQo+IMKgwqDCoCB4ZV9tYXANCj4gwqDCoMKg
IHhlX21pZ3JhdGUNCj4gK8KgwqAgeGVfY2NzX21vZGUNCj4gwqDCoMKgIHhlX2NzDQo+IMKgwqDC
oCB4ZV9wbQ0KPiDCoMKgwqAgeGVfcGNvZGUNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
Z3B1L3hlL3hlX2Njc19tb2RlLnJzdA0KPiBiL0RvY3VtZW50YXRpb24vZ3B1L3hlL3hlX2Njc19t
b2RlLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAwLi45
ZmYwNzcwNmY5NzM5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUv
eGUveGVfY2NzX21vZGUucnN0DQo+IEBAIC0wLDAgKzEsMTQgQEANCj4gKy4uIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQ0KPiArDQo+ICs9PT09PT09PT0NCj4gK0ND
UyBtb2RlDQo+ICs9PT09PT09PT0NCj4gKw0KPiArLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jDQo+ICvCoMKgIDpkb2M6IENDUyBtb2RlDQo+ICsNCj4g
K0ludGVybmFsIEFQSQ0KPiArPT09PT09PT09PT09DQo+ICsNCj4gKy4uIGtlcm5lbC1kb2M6OiBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2NzX21vZGUuYw0KPiArwqDCoCA6aW50ZXJuYWw6DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2NzX21vZGUuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jDQo+IGluZGV4IDE3M2IxMTlhMjFjMDAu
LmQzMzhiMDg1OTcyOGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9j
Y3NfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jDQo+
IEBAIC0xMiw2ICsxMiwyNyBAQA0KPiDCoCNpbmNsdWRlICJ4ZV9ndF9zeXNmcy5oIg0KPiDCoCNp
bmNsdWRlICJ4ZV9tbWlvLmgiDQo+IMKgDQo+ICsvKioNCj4gKyAqIERPQzogQ0NTIG1vZGUNCj4g
KyAqDQo+ICsgKiBDQ1MgbW9kZSBzZXR0aW5nIGFsbG93cyBmaXhlZCBtYXBwaW5nIG9mIGF2YWls
YWJsZSBjb21wdXRlIHNsaWNlcw0KPiB0bw0KPiArICogY29tcHV0ZSBlbmdpbmVzLiBCeSBkZWZh
dWx0IG9ubHkgdGhlIGZpcnN0IGF2YWlsYWJsZSBjb21wdXRlDQo+IGVuZ2luZSBpcw0KPiArICog
ZW5hYmxlZCBhbmQgYWxsIGF2YWlsYWJsZSBjb21wdXRlIHNsaWNlcyBhcmUgYWxsb2NhdGVkIHRv
IGl0Lg0KPiArICoNCj4gKyAqIEJlbG93IHBlci10aWxlIHN5c2ZzIGludGVyZmFjZXMgaGVscCB1
c2VyIHRvIGNoYW5nZSB0aGUgQ0NTIG1vZGUNCj4gc2V0dGluZy4NCj4gKyAqDQo+ICsgKiAnbnVt
X2NzbGljZXMnIC0gVGhpcyByZWFkLW9ubHkgaW50ZXJmYWNlIHJldHVybnMgdGhlIG51bWJlciBv
Zg0KPiBjb21wdXRlDQo+ICsgKiBzbGljZXMgYXZhaWxhYmxlLg0KPiArICoNCj4gKyAqICdjY3Nf
bW9kZScgLSBBbGxvd3MgdXNlciB0byBzZXQgdGhlIG51bWJlciBvZiBjb21wdXRlIGhhcmR3YXJl
DQo+IGVuZ2luZXMNCj4gKyAqIHRvIGJlIGVuYWJsZWQgYW5kIHRvIHdoaWNoIGFsbG9jYXRlIHRo
ZSBhdmFpbGFibGUgY29tcHV0ZSBzbGljZXMuDQo+IFRoaXMNCj4gKyAqIHVzZXIgY29uZmlndXJh
dGlvbiBjaGFuZ2UgdHJpZ2dlcnMgYSBndCByZXNldCBhbmQgaXQgaXMgZXhwZWN0ZWQNCj4gdGhh
dA0KPiArICogdGhlcmUgYXJlIG5vIG9wZW4gZHJtIGNsaWVudHMgd2hpbGUgZG9pbmcgc28uIFRo
ZSB1c2VyDQo+IGNvbmZpZ3VyYXRpb24NCj4gKyAqIG11c3QgYWxsb3cgZXF1YWwgZGlzdHJpYnV0
aW9uIG9mIGF2YWlsYWJsZSBjb21wdXRlIHNsaWNlcyB0bw0KPiBlbmFibGVkDQo+ICsgKiBjb21w
dXRlIGhhcmR3YXJlIGVuZ2luZXMuIFJlYWRpbmcgaXQgcmV0dXJucyB0aGUgbnVtYmVyIG9mDQo+
IGNvbXB1dGUNCj4gKyAqIGhhcmR3YXJlIGVuZ2luZXMgY3VycmVudGx5IGVuYWJsZWQuDQo+ICsg
Ki8NCj4gKw0KPiDCoCNkZWZpbmUNCj4gQ0NTX01PREVfQ1NMSUNFX1dJRFRIwqDCoMKgwqDCoMKg
wqDCoMKgwqBpbG9nMihDQ1NfTU9ERV9DU0xJQ0VfQVNTSUdOTUVOVCArIDEpDQo+IMKgI2RlZmlu
ZSBDQ1NfTU9ERV9DU0xJQ0UoY3NsaWNlLCBjY3MpwqDCoMKgXA0KPiDCoMKgwqDCoMKgwqDCoMKg
KChjY3MpIDw8ICgoY3NsaWNlKSAqIENDU19NT0RFX0NTTElDRV9XSURUSCkpDQo+IEBAIC0xNzQs
MTIgKzE5NSw3IEBAIHN0YXRpYyB2b2lkIHhlX2d0X2Njc19tb2RlX3N5c2ZzX2Zpbmkoc3RydWN0
DQo+IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqYXJnKQ0KPiDCoCAqIHhlX2d0X2Njc19tb2RlX3N5
c2ZzX2luaXQgLSBJbml0aWFsaXplIENDUyBtb2RlIHN5c2ZzIGludGVyZmFjZXMNCj4gwqAgKiBA
Z3Q6IEdUIHN0cnVjdHVyZQ0KPiDCoCAqDQo+IC0gKiBUaHJvdWdoIGEgcGVyLWd0ICdjY3NfbW9k
ZScgc3lzZnMgaW50ZXJmYWNlLCB0aGUgdXNlciBjYW4gZW5hYmxlDQo+IGEgZml4ZWQNCj4gLSAq
IG51bWJlciBvZiBjb21wdXRlIGhhcmR3YXJlIGVuZ2luZXMgdG8gd2hpY2ggdGhlIGF2YWlsYWJs
ZSBjb21wdXRlDQo+IHNsaWNlcw0KPiAtICogYXJlIHRvIGJlIGFsbG9jYXRlZC4gVGhpcyB1c2Vy
IGNvbmZpZ3VyYXRpb24gY2hhbmdlIHRyaWdnZXJzIGEgZ3QNCj4gcmVzZXQNCj4gLSAqIGFuZCBp
dCBpcyBleHBlY3RlZCB0aGF0IHRoZXJlIGFyZSBubyBvcGVuIGRybSBjbGllbnRzIHdoaWxlIGRv
aW5nDQo+IHNvLg0KPiAtICogVGhlIG51bWJlciBvZiBhdmFpbGFibGUgY29tcHV0ZSBzbGljZXMg
aXMgZXhwb3NlZCB0byB1c2VyIHRocm91Z2gNCj4gYSBwZXItZ3QNCj4gLSAqICdudW1fY3NsaWNl
cycgc3lzZnMgaW50ZXJmYWNlLg0KPiArICogQ3JlYXRlIHBlci10aWxlIENDUyBtb2RlIHN5c2Zz
IGludGVyZmFjZXMuDQo+IMKgICovDQo+IMKgdm9pZCB4ZV9ndF9jY3NfbW9kZV9zeXNmc19pbml0
KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+IMKgew0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0X3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0K
PiBpbmRleCBmNzQ2ODQ2NjA0NzU5Li45Y2VlMTc1MDZmOGJjIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfdHlwZXMuaA0KPiBAQCAtMTg1LDEyICsxODUsNyBAQCBzdHJ1Y3QgeGVfZ3Qgew0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW5sb2NrX3QgbG9jazsNCj4gwqDCoMKg
wqDCoMKgwqDCoH0gdGxiX2ludmFsaWRhdGlvbjsNCj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgLyoq
DQo+IC3CoMKgwqDCoMKgwqDCoCAqIEBjY3NfbW9kZTogTnVtYmVyIG9mIGNvbXB1dGUgZW5naW5l
cyBlbmFibGVkLg0KPiAtwqDCoMKgwqDCoMKgwqAgKiBBbGxvd3MgZml4ZWQgbWFwcGluZyBvZiBh
dmFpbGFibGUgY29tcHV0ZSBzbGljZXMgdG8NCj4gY29tcHV0ZSBlbmdpbmVzLg0KPiAtwqDCoMKg
wqDCoMKgwqAgKiBCeSBkZWZhdWx0IG9ubHkgdGhlIGZpcnN0IGF2YWlsYWJsZSBjb21wdXRlIGVu
Z2luZSBpcw0KPiBlbmFibGVkIGFuZCBhbGwNCj4gLcKgwqDCoMKgwqDCoMKgICogYXZhaWxhYmxl
IGNvbXB1dGUgc2xpY2VzIGFyZSBhbGxvY2F0ZWQgdG8gaXQuDQo+IC3CoMKgwqDCoMKgwqDCoCAq
Lw0KPiArwqDCoMKgwqDCoMKgwqAvKiogQGNjc19tb2RlOiBOdW1iZXIgb2YgY29tcHV0ZSBlbmdp
bmVzIGVuYWJsZWQgKi8NCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBjY3NfbW9kZTsNCj4gwqANCj4g
wqDCoMKgwqDCoMKgwqDCoC8qKiBAdXNtOiB1bmlmaWVkIHNoYXJlZCBtZW1vcnkgc3RhdGUgKi8N
Cg0K
