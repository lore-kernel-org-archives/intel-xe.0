Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410BCC61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 17:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389A89DA9;
	Fri, 24 Nov 2023 17:07:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2A897AC
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700845660; x=1732381660;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AzoOThjW0ctozRDuowDhkqSEDfAvU1xRaPPLdHej4mQ=;
 b=Yg08HECY94PutI3ICy9tKYfwO/94gj2yH4zFlhupWV60tkdqX3Odn3eY
 L8v9qBymhcTTAzTLrK/8EAbaTuVKFA9j1t6IwOJeAXoYB46F0TdxaE7Ft
 7agZXgpPxSCRoOuWQPjk8xcslAtJ+n/JNAjqEmoRK4q9XuLUNTLDzxi/w
 b108K/a+Rv0PUtp402vhiAUeQYLiBpdi5kfuasVt+EGuacjer7fK0k2CS
 g5ok6WiiP5Yt53oazHbIlYYzbYnK1RdrfHJvu+kqKdFxyIhXxuAhl//os
 +yt+jp/CUVtnA1WKpP8HU+ZjT1DWTif+jEkxHsZfLU2/LCl9QS5jLC7Dx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="458936745"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="458936745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 09:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767533171"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="767533171"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2023 09:07:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 09:07:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 09:07:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 09:07:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 09:07:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqX9rJTyexa+KHaSq0cD1aEsUVn/PtIgXa0uui0UI3CQJxMrFDboWyjMUS/B8FCxEwEl3bLZZkLEwt6Uks5rylMjUknMUvFvjK43SSacvKIZpOeuwnDjEsLI8q1VMdo51HyfhrJiGwLEQ5MoriV3c1YLHYETcb0Hb7NUnECIsxCUKuqPwfTZJ1LwKoOldxHr9FbnOaf62tMxbKY7tRKaKlAx15/J8Yq1pLOaircX7nEC11c06SbpKNoCmRTyxvhYXtjwF+cZ3d66eDiDME1UgkDu4tIVydqfU8gPCuumdwvQ/mv5qyDcr1PHLQV84dWWSMfTYZzGENbzCqX4AW9dzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzoOThjW0ctozRDuowDhkqSEDfAvU1xRaPPLdHej4mQ=;
 b=RlgKe6CXQICHvMUQ64sVaAbehOPRC3vmoJCCXaWbbRERWXKLSDXEjDMl2fy3yA787oB06nQWM/uFpvXMCPBq+zo7TqQzVMVljdUn4AFiBm75DK4RaHa2yY65MEUMjU2lURNjCb+vGpsz7/P0K3eTG19lPnIF0iQFgyfN/uop7kH0WK4jY53sl2ogi60fNi4Vkk12uqTCxcOUyl80gbqPbJmLJTGkhOsQPg0HRQTGu8pGHfOS4V8yJlvAC4V4YhP1AFxSzzObKH1V3cDayAVo0EXnnProG0/hfim9ebXGs9asFYAB3WdIuCKxCi+9c1Pq+XmtH1lroI2ghSZ/2dTWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MW3PR11MB4667.namprd11.prod.outlook.com (2603:10b6:303:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 17:07:36 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.7002.022; Fri, 24 Nov 2023
 17:07:33 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe/uapi: Use LR abbrev for
 long-running vms
Thread-Index: AQHaHupT5v9lAdm2KUykgploZoT/ibCJri3g
Date: Fri, 24 Nov 2023 17:07:33 +0000
Message-ID: <SA1PR11MB699164C6784D56EFA026253292B8A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231124152320.97115-1-thomas.hellstrom@linux.intel.com>
 <20231124152320.97115-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231124152320.97115-3-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MW3PR11MB4667:EE_
x-ms-office365-filtering-correlation-id: 91952c82-8bce-4913-f612-08dbed0fd9cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CT6Zfoh/pTDF7mxNKZfs5N/j97l38sqzsNp5Uf4CkogWlxkjBMFEPoPdTv7abPSdUZ694WQeWgREpOlXro4UqJ8oEdR6aufScB+W2Y6xs6yRqfREwYg/aGbdj3wvAznDpD7cKYFtkRRBnLEzr0UcrhUOp9mekpgEiseAOghZTSA4GSg+vA1qGGsZPnDSctXmwfdkZhyf3ZwwO9rhJ29cMgYeJmAeJLuWZwzDIHhE2/NNDmkdolBui2Xfzu9FWsqs1DDD2l3Qo2VEm9MLKsqb7veWT6f5chi91cwCf6vX13vxeKllmgxuCqyzfkjfuZL1LW8xQ2f4rF946qixJwEqf4jQENyxtH5lJtENc06Y59673blinM4rNpvWlP9gK2hMOXXAZV96rZJMH7+bNcUD3bS+k1E1O+kGdv7aKIBr7keHKn6B1fbRy7rs++OwmIkwsHD54bvnVSJeI4z80PrGpi2k7DQOtVJTLbdkbefm+w624JV9UgGVgS/kaxcN2LY1ezIkxPAX2ORq6i3ibdrPNa5B4gkwbGBmv9KHu4zs9lDCaGblXs4yeInsplFXpYKKQQbFCRhbSUnqGvuup+K/8eInvRaSG06/W1nC6iU6a+bgaoTpeYDIntm2P8CdK6at
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(83380400001)(66574015)(82960400001)(26005)(55016003)(122000001)(9686003)(71200400001)(110136005)(7696005)(6506007)(53546011)(478600001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(316002)(52536014)(8676002)(38070700009)(86362001)(2906002)(5660300002)(8936002)(4326008)(33656002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjE4NlJ1eVUwVDRFeS95WElQaCtQbXFoN1NFcit2Q3RkRWdyN3dMQk1objRW?=
 =?utf-8?B?YW5aR3BFNlR3bmhiOFB6d0IvaUNQQVJYYVg5azcwK3pnT0Y5VmV5SzlGQUdq?=
 =?utf-8?B?aWh1YlFDZTJTVHppczlXRDBpMWNqcHoxUDVUSUJsZVU2cTZHV2NzY1lhMUhl?=
 =?utf-8?B?ZEMzblhFM0VHZW50SURlMHBRWXZPOWlrRnY3eHd0MDI5RlpSSXkyQjFPc2xG?=
 =?utf-8?B?bXl4Qmk4RkNBNzUzUnZiYmFtRno2TmtqNUFCOTJVUnFldDQ0elhJS2lCU0Zn?=
 =?utf-8?B?SDdLQjNxSkVia09mWURoNnpYT2RPYzU1QlBvUDRtU3Z1Y0tQMS9BUTlIakZL?=
 =?utf-8?B?S1I3TXhYUmpIZ1hXQzhnakdlNVR4SWt1eTlUWm9GRndodnpFZU0yWGRxUWcw?=
 =?utf-8?B?QWFYWHpzZ0ZWT0JOUFhhcm9tRm9ZRlRnOUlERXUrSjZtN2wvMjRBY1dub1R3?=
 =?utf-8?B?Nk14YjdnSjgxRzJRNUdzb3p4cHpBODN6Q04xZ3EzZWt5K2JwUmFtVjJOOTRH?=
 =?utf-8?B?dVdwWklGc3M4TkRNQzhLZzR5NitoTy8vZWwrSG1kY0RUMFRNYWtWcXV1Z05z?=
 =?utf-8?B?a3NocjFZTHA3Q3pNd2JuUW9BMTJPUWtqeVpJNmwvVjlKMVlPSE1DV1JwYklv?=
 =?utf-8?B?NzdqMEJWWStROW9JaysrQnk2eHBBV0J2Q3hFaGUvTENjTTRhNHNjWmgxbEM3?=
 =?utf-8?B?T09sdmdVczM2eXAvN0p5aTFCZUtXQUdFMHREQUlldGZoR2hDNiswOHlkT1g1?=
 =?utf-8?B?NzBsR0ZUQ01kN3JHM0p2NWlhVy9CMXlFNVozMXFsOUtoZHlHZmVrWGlldEdy?=
 =?utf-8?B?TThJdk9qVFF4UFdQTUVONUZyQjVvRk5mbGNzQmszZGkrOUF4UytqUW1tWC91?=
 =?utf-8?B?TnNPQm8vTCtWUUg4UG84YnZUM2IzcUtVSEN6WmRsSDNYSGhUVFp6OHp3M1JH?=
 =?utf-8?B?N2MzVDg5RVdaczIvMkh6SW05ZFJBYjJ5UElOaGg1dlJtaEVMVnZjZnc5MTh1?=
 =?utf-8?B?SzE5Qm5Ma2tDREdOZmtWRGdhdkw1OU1BNXRuaDJyL2F4TXNUSDFwMVdEMER4?=
 =?utf-8?B?OCs3Z0IvNGJhQlpGekRUNU15VHhFNzNDWFZCNm92K0JoZjIvUzZ2dWh2bmQy?=
 =?utf-8?B?cXdhQWV6WkZEUUlKc2ZIVW9GWkJRQURlRENxVWJDM01ic1ZlWC9NNnhnTzNm?=
 =?utf-8?B?NDdjTitPV2x2bEcyc1NITFZIRDJWNDY2aVc0WmV2dkFIN0hVVkJ6U0R1SndD?=
 =?utf-8?B?TVRpbVJWQTdQUFlRcGtua3hFS1FOMkpiZzEzb2xsNjQwUkZXclRBZEltcG9w?=
 =?utf-8?B?Q24yZURhUWlMdUlqcUxsRGNwUFY5ekp4WHpKbzY2bnViV01abkFSVklzTHpL?=
 =?utf-8?B?SkV1VWlzOEdlYzQ4SWNqajNMM3BJNy9aY3NXcHV3azA1SXlqVUlVMnArR0p4?=
 =?utf-8?B?U2FuUFRBczY4NVRDcHcrcWhMc3ZvanpVTWlMaEc1Y1ZtREs4anBVMTRkeFZJ?=
 =?utf-8?B?YzQ4Wi9LVEdLT1JPa242amZMbmI4d1ZrL0FwdnZyRzJmcUJ5VkZVWFpHdTAw?=
 =?utf-8?B?cCtCMkFGaVhtRE1OdXNDdXoxeDExMFROckJMelZucFlRVXpPTEJaSG9tOXBZ?=
 =?utf-8?B?SVh4cXF0VU1ocGtDT3FrRDV1U0hWelBYU3lqN3VKMjQxblVlSzhLbVBOdEI3?=
 =?utf-8?B?VUtOdnY3T0NkZFJTVkxEdzFpamkxQU5CczRwSUNNRGF2Z3VPSjhtK3FtT2Vx?=
 =?utf-8?B?RGptTkFOOXJxbTk5QWJ4amRLbmdCS3NFeUxwVFZKS29MUlRsOVo3eWdKM3Zz?=
 =?utf-8?B?U1BxUURZbW9ka2txdlZlNEwxUUFsQm5JajJuUGFobzFKMldORGV2Q1dPOUhx?=
 =?utf-8?B?bDNNaWdZQ3ZUQlV2SC85SE9LNkptVEkvMHc3YURtOEk0UlBHVVRkRXN5UENC?=
 =?utf-8?B?a0xDSkJVUEMzdStzejE5VWhoL0hwbFdFVktFM0txMEVIdnF2aWpBSmhvakRm?=
 =?utf-8?B?UGtCcXl6N1REU3pYVnhiaEZUMjcvVjY4M3IrV3VMRVFLejNuWVVRSFpzdnM0?=
 =?utf-8?B?eEg0Wkp3MUl3OG1wR2ZBcjNNVWdha1Q1aHNqVHNkdG1nTldBY2p3YnUzSldi?=
 =?utf-8?Q?OOn0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91952c82-8bce-4913-f612-08dbed0fd9cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 17:07:33.6984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+JrUjDGIT6jypQxhQGEPJQUJsLRPWhg0Yi0SBSu1fpgU4WzblY8rr9nBa97Vy5VU+8QV6p2u/Z3H8O1Xaqu8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4667
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/uapi: Use LR abbrev for
 long-running vms
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

U2VlIGEgZmV3IG5pdC1waWNrcyBpbmxpbmUNCg0KUmV2aWV3ZWQtYnk6IE9hayBaZW5nIDxvYWsu
emVuZ0BpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YgVGhvbWFzDQo+IEhlbGxzdHLDtm0NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAyNCwg
MjAyMyAxMDoyMyBBTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBEdWdhc3QsIEZyYW5jb2lzIDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPjsgVml2aSwgUm9k
cmlnbw0KPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW0ludGVsLXhlXSBb
UEFUQ0ggMi8yXSBkcm0veGUvdWFwaTogVXNlIExSIGFiYnJldiBmb3IgbG9uZy1ydW5uaW5nIHZt
cw0KPiANCj4gQ3VycmVudGx5IHdlJ3JlIHVzaW5nICJjb21wdXRlIG1vZGUiIGZvciBsb25nIHJ1
bm5pbmcgVk1zIHVzaW5nDQo+IHVzaW5nIA0KDQpZb3UgdHlwZWQgdHdvIHVzaW5nDQoNCg0KcHJl
ZW1wdC1mZW5jZXMgZm9yIG1lbW9yeSBtYW5hZ2VtZW50LCBhbmQgImZhdWx0IG1vZGUiIGZvciBs
b25nDQo+IHJ1bm5pbmcgVk1zIHVzaW5nIHBhZ2UgZmF1bHRzLg0KPiANCj4gQ2hhbmdlIHRoaXMg
dG8gdXNlIHRoZSB0ZXJtaW5vbG9neSAibG9uZy1ydW5uaW5nIiBhYmJyZXZpYXRlZCBhcyBMUiBm
b3INCj4gbG9uZy1ydW5uaW5nIFZNcy4gVGhlc2UgVk1zIGNhbiB0aGVuIGVpdGhlciBiZSBpbiBw
cmVlbXB0LWZlbmNlIG1vZGUgb3INCj4gZmF1bHQgbW9kZS4gVGhlIHVzZXIgY2FuIGZvcmNlIGZh
dWx0IG1vZGUgYXQgY3JlYXRpb24gdGltZSwgYnV0IG90aGVyd2lzZQ0KPiB0aGUgZHJpdmVyIGNh
biBjaG9vc2UgdG8gdXNlIGZhdWx0LSBvciBwcmVlbXB0LWZlbmNlIG1vZGUgZm9yIGxvbmctcnVu
bmluZw0KPiB2bXMgZGVwZW5kaW5nIG9uIHRoZSBkZXZpY2UgY2FwYWJpbGl0aWVzLiBJbml0aWFs
bHkgdW5sZXNzIGZhdWx0LW1vZGUgaXMNCj4gc3BlY2lmaWVkLCB0aGUgZHJpdmVyIHVzZXMgcHJl
ZW1wdC1mZW5jZSBtb2RlLg0KPiANCj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RA
aW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0K
PiBDYzogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRl
bC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgfCAgOCArKysrLS0t
LQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgfCAyMCArKysrKysrKysrKysrKysrKysr
LQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMNCj4gaW5kZXggNWE0NDgzYmIwMGIxLi5lMmUxZmJlN2Y3ZDEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC0xOTE5LDcgKzE5MTksNyBAQCBzdGF0aWMgaW50IHhl
X3ZtX3VuYmluZChzdHJ1Y3QgeGVfdm0gKnZtLCBzdHJ1Y3QNCj4geGVfdm1hICp2bWEsDQo+ICB9
DQo+IA0KPiAgI2RlZmluZSBBTExfRFJNX1hFX1ZNX0NSRUFURV9GTEFHUw0KPiAoRFJNX1hFX1ZN
X0NSRUFURV9GTEFHX1NDUkFUQ0hfUEFHRSB8IFwNCj4gLQ0KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZM
QUdfQ09NUFVURV9NT0RFIHwgXA0KPiArCQkJCSAgICBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJf
TU9ERSB8IFwNCj4gIAkJCQkgICAgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0FTWU5DX0RFRkFVTFQN
Cj4gfCBcDQo+ICAJCQkJICAgIERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFKQ0KPiAN
Cj4gQEAgLTE5NTUsNyArMTk1NSw3IEBAIGludCB4ZV92bV9jcmVhdGVfaW9jdGwoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZA0KPiAqZGF0YSwNCj4gIAkJCSBhcmdzLT5mbGFncyAmDQo+IERS
TV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFKSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+
IA0KPiAtCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPmZsYWdzICYNCj4gRFJNX1hFX1ZNX0NS
RUFURV9GTEFHX0NPTVBVVEVfTU9ERSAmJg0KPiArCWlmIChYRV9JT0NUTF9EQkcoeGUsICEoYXJn
cy0+ZmxhZ3MgJg0KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSkgJiYNCj4gIAkJCSBh
cmdzLT5mbGFncyAmDQo+IERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFKSkNCj4gIAkJ
cmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBAQCAtMTk3MiwxMiArMTk3MiwxMiBAQCBpbnQgeGVfdm1f
Y3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQNCj4gKmRhdGEsDQo+IA0K
PiAgCWlmIChhcmdzLT5mbGFncyAmIERSTV9YRV9WTV9DUkVBVEVfRkxBR19TQ1JBVENIX1BBR0Up
DQo+ICAJCWZsYWdzIHw9IFhFX1ZNX0ZMQUdfU0NSQVRDSF9QQUdFOw0KPiAtCWlmIChhcmdzLT5m
bGFncyAmIERSTV9YRV9WTV9DUkVBVEVfRkxBR19DT01QVVRFX01PREUpDQo+ICsJaWYgKGFyZ3Mt
PmZsYWdzICYgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUpDQo+ICAJCWZsYWdzIHw9IFhF
X1ZNX0ZMQUdfTFJfTU9ERTsNCj4gIAlpZiAoYXJncy0+ZmxhZ3MgJiBEUk1fWEVfVk1fQ1JFQVRF
X0ZMQUdfQVNZTkNfREVGQVVMVCkNCj4gIAkJZmxhZ3MgfD0gWEVfVk1fRkxBR19BU1lOQ19ERUZB
VUxUOw0KPiAgCWlmIChhcmdzLT5mbGFncyAmIERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9N
T0RFKQ0KPiAtCQlmbGFncyB8PSBYRV9WTV9GTEFHX0xSX01PREUgfCBYRV9WTV9GTEFHX0ZBVUxU
X01PREU7DQo+ICsJCWZsYWdzIHw9IFhFX1ZNX0ZMQUdfRkFVTFRfTU9ERTsNCj4gDQo+ICAJdm0g
PSB4ZV92bV9jcmVhdGUoeGUsIGZsYWdzKTsNCj4gIAlpZiAoSVNfRVJSKHZtKSkNCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oDQo+IGluZGV4IDg4ZjNhY2EwMmIwOC4uNGU5Njg4Yzg1ZGI2IDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmgNCj4gQEAgLTU4OSw4ICs1ODksMjYgQEAgc3RydWN0IGRybV94ZV92bV9jcmVhdGUgew0KPiAg
CV9fdTY0IGV4dGVuc2lvbnM7DQo+IA0KPiAgI2RlZmluZSBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdf
U0NSQVRDSF9QQUdFCSgxIDw8IDApDQo+IC0jZGVmaW5lIERSTV9YRV9WTV9DUkVBVEVfRkxBR19D
T01QVVRFX01PREUJKDEgPDwgMSkNCj4gKwkvKg0KPiArCSAqIEFuIExSLCBvciBMb25nIFJ1bm5p
bmcgVk0gYWNjZXB0cyBleGVjIHN1Ym1pc3Npb25zDQo+ICsJICogdG8gaXRzIGV4ZWNfcXVldWVz
IHRoYXQgZG9uJ3QgaGF2ZSBhbiB1cHBlciB0aW1lIGxpbWl0IG9uDQo+ICsJICogdGhlIGpvYiBl
eGVjdXRpb24gdGltZS4gQnV0IGV4ZWMgc3VibWlzc2lvbnMgdG8gdGhlc2UNCj4gKwkgKiBkb24n
dCBhbGxvdyBhbnkgb2YgdGhlIGZsYWdzIERSTV9YRV9TWU5DX0ZMQUdfU1lOQ09CSiwNCj4gKwkg
KiBEUk1fWEVfU1lOQ19GTEFHX1RJTUVMSU5FX1NZTkNPQkosDQo+IERSTV9YRV9TWU5DX0ZMQUdf
RE1BX0JVRiwNCj4gKwkgKiB1c2VkIGFzIG91dC1zeW5jb2JqcywgdGhhdCBpcywgdG9nZXRoZXIg
d2l0aA0KPiBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTC4NCj4gKwkgKiBMUiBWTXMgY2FuIGJlIGZv
cmNlZCB0byByZWNvdmVyYWJsZSBwYWdlLWZhdWx0IG1vZGUgdXNpbmcNCj4gKwkgKiBEUk1fWEVf
Vk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSwgYnV0IHRoZSB4ZSBrZXJuZWwgZHJpdmVyIGlzDQo+
IGFsc28NCj4gKwkgKiBhbGxvd2VkIHRvIHNpbGVudGx5IGVuYWJsZSBEUk1fWEVfVk1fQ1JFQVRF
X0ZMQUdfRkFVTFRfTU9ERS4NCg0KTWF5YmUgYWxzbyBtZW50aW9uIGxvbmcgY2FuIHJ1biBpbiB0
d28gbW9kZXM6IGZhdWx0IG9yIG5vbi1mYXVsdCBtb2RlPw0KDQo+ICsJICovDQo+ICsjZGVmaW5l
IERSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RFCSAgICAgICAgKDEgPDwgMSkNCj4gICNkZWZp
bmUgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0FTWU5DX0RFRkFVTFQJKDEgPDwgMikNCj4gKwkvKg0K
PiArCSAqIERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFIHJlcXVpcmVzIGFsc28NCj4g
KwkgKiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERS4gSXQgYWxsb3dzIG1lbW9yeSB0byBi
ZQ0KPiBhbGxvY2F0ZWQNCj4gKwkgKiBvbiBkZW1hbmQgd2hlbiBhY2Nlc3NlZCwgYW5kIGFsc28g
YWxsb3dzIHBlci1WTSBvdmVyY29tbWl0IG9mDQo+IG1lbW9yeS4NCj4gKwkgKiBUaGUgeGUgZHJp
dmVyIGRvZXMgaW50ZXJuYWxseSB1c2UgcmVjb3ZlcmFibGUgcGFnZWZhdWx0cw0KPiArCSAqIHRv
IGltcGxlbWVudCB0aGlzLg0KDQpUaGUgeGUgZHJpdmVyIGludGVybmFsbHkgdXNlcyByZWNvdmVy
YWJsZS4uLi4uDQoNCk9haw0KDQo+ICsJICovDQo+ICAjZGVmaW5lIERSTV9YRV9WTV9DUkVBVEVf
RkxBR19GQVVMVF9NT0RFCSgxIDw8IDMpDQo+ICAJLyoqIEBmbGFnczogRmxhZ3MgKi8NCj4gIAlf
X3UzMiBmbGFnczsNCj4gLS0NCj4gMi40MS4wDQoNCg==
