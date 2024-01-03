Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE88C47074
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 14:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6800210E32B;
	Wed,  3 Jan 2024 14:19:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4052310E326
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704291597; x=1735827597;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WkIkPrf+R1I90R+7PkxFyUCxjAcq4gw/TQ+TZsYNxtQ=;
 b=c0TWg2I5OOGTd2f6fx7srFUL7934ab4GvCA4V5Jz/4cP/q2MIiVZ38V0
 5d2gyabPeyHg7XYaGUfZmeBH+9IwqA4ODeKIj0CK8vmnoNd822xd2r3mk
 wwWvw03z34GrE9mM8QqZExiZhOHYK+ZGgbUT6mDd0zEtdQBZkx4Ok2+Ec
 3C1tBazjpDgT44iogxjF4nGzIK1xNZqoGUP9tMI+qz+vmAhWZReYV4gld
 gTO2tI5iONRmNFhn9vKnrqyj+7Wkbhz5T3Ek8C36CS1PSTYPUtGkH5yhY
 0NQf7mRCiNcDaTF4XFL1E9KQ/HhFFbiBhhANXf5dxYvjzUGWNiXkGz5CE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="18537585"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="18537585"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 06:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="898894473"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="898894473"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 06:19:56 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 06:19:56 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 06:19:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 06:19:56 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 06:19:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOInYIPT7ubzJIr4OlLHvj9vTB98j6TqF5oIHkv51cpmTv3gdBHhdpnKu41Lzhvc1/FtQFxHXZ6Z+dynm0dQ1+XUluuiAJ8aRA2OLQaZWX5z6I0PTnZThRuVZA9jjuFdRqYqyPcQNqNzieGsDJxP8TvnNm30qO5fr7W1jEIFYclU3lYF/m5YNHRWXDii1mYo58qynhvTTpdZJAe8Fi/icV9plsZ1GjGs3nMsTZGXaCvsBhfmCCMDqdRDfrBmn7Cck3buWKpM3mHSA/PK4zXq3Gd8pgP7IeOuxAk3SORyrzO56feyzdBMrFKKy7WjIpiMD7ORaxNq+z6EeFd3VF/FMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkIkPrf+R1I90R+7PkxFyUCxjAcq4gw/TQ+TZsYNxtQ=;
 b=cZ6F9zyrIHBjwkkD8Xr9CMZlLP6z7taIEv8uFkNTHv0uCip2O6DtJi2eJ4n1WAi9JEcAkjxxzrRrKQzHh/8FpZsOpTA0UjhrdJDGr4Zx87piJ/+LLkB4qolGyAzdIYVXK+oFG2jA0G5gzpEKSbkzos1w+AGYnK07ZXf0PNSOykjwSAxaJpim/U7iMaNnOQfkgRMFd1yb8S0HZYD1wj8oGhZ2LIgK0vixayOyrhEuJ2284KXwnVxk5Mn8v+YIzx3IEboimcS+fwPOosgHbNSodByt2B8yryEKWiKXd90LV0Mx6ZvFunatrlHmgau1NYJDyGitAL6TOIz7rOX1XMS6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 14:19:53 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1a4b:a930:2aac:11e7]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1a4b:a930:2aac:11e7%4]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 14:19:53 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Zeng, Oak"
 <oak.zeng@intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Thread-Topic: [PATCH] xe/xe_bo_move: Enhance xe_bo_move trace
Thread-Index: AQHaPkKRFhC3unU56kmwKpF+H0Nv07DIExIAgAAPvyA=
Date: Wed, 3 Jan 2024 14:19:52 +0000
Message-ID: <CH3PR11MB8434FFE4D37A01C7FE5B3A4A8D60A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240103123826.2386219-1-priyanka.dandamudi@intel.com>
 <6eaf8e85e9a99ab33de51def3fde72505da75433.camel@linux.intel.com>
In-Reply-To: <6eaf8e85e9a99ab33de51def3fde72505da75433.camel@linux.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7558:EE_
x-ms-office365-filtering-correlation-id: 7826bb2e-40e5-4d54-2446-08dc0c670da4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jPn3PiASNnr+EUAKwuoirWBFIQDnYBhP4usu6gya+v0hsmpLVojBhjLOpnryn3I++vssN7BbwUBrqfQXIXnWdg67bt/KkSExou4k4yvnzw4J58Rzg4sdaXcNvCnyk9Qdt0F9l00A+4gTWfcQdpWmQc6/XzAL+Tvq6QtEqnhuVkdLgpqf4xcUgFdvLI7T6LAyZt5IA82Ds0YQPyFPZEuYqn1OqYRZAOREC71EYk6fppgKz3t/ji8a9FUfpG4mc7VrtGC3pmc+vLoL1cSgr4HQcgYYW5IwvavrYpXNWIBFxS0GjmutjfRKCZgvwbJC2j3Fm348sJbjF+O7rWsErjox5jrhemuU7oCFJC+D/2hcJxoqQthhesfIcubFIzhR9clk5Ibc1s77TtIB4mGIFEJSaI6ZF7Gd44LvwN441Px2crQJruOqEHjE2gPe7D2DeKwxbVHFc+Uo7vC0QW3hyBTUJGBCJtPH3YQ93xZlj2KLYHV2b9t6cPJS9PdsRNtpieI8yFccYH5FOahgUygdxqc4ikc9lJiehXr5fCwmKUtnezFONJvV2zNcNvjo8evnYbbVnwQAUdvdPSXfdT8rSR0LVR8U8HtmUI/+/Sqr8S3bhE5IADdgVGUm8EAf2G7DOfXH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6506007)(71200400001)(7696005)(33656002)(82960400001)(478600001)(86362001)(66946007)(66556008)(110136005)(316002)(53546011)(55016003)(6636002)(76116006)(9686003)(66476007)(41300700001)(64756008)(66446008)(122000001)(38100700002)(83380400001)(52536014)(8676002)(2906002)(8936002)(38070700009)(26005)(66574015)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmY4Y0tOeTROb2NPZ1Y5SnRlTU1HYTdZSDdXbS9VZUlpbUF1YVp6VG8wdVJP?=
 =?utf-8?B?VnVTb3BuRkNQMDZnUDMxMFhlY3VyeHU2TVgrYzRBZ3VzeXNNK2NLZ2NEM0Zq?=
 =?utf-8?B?SXNQZ25zOXAxY0ZGRHZlVTRNaU1BS0QyamVrODNsKzRNMnBqaHVMN2pKdnUx?=
 =?utf-8?B?SFYxYi9uMTdsWTN4RkZKQ0dmZUwxZjZCU0xicEFwMHpaTFVoNk1LM0pIckl5?=
 =?utf-8?B?b1R1dnR4M0NGcW1pR0tCRE5kL3NKdHA2SmFZcnFCdCt5cTQrekRMb1RCQVVo?=
 =?utf-8?B?cGsxS2JlWEtFK1psekJYaDJDNERoSDJ6WGNjZWlydGordkhYa2VIQlQ1d3hl?=
 =?utf-8?B?M2xSVXB1ZUY3K2VHbjFJSnBxUnpqMEYvZkRNRmV1aGV5ZGpIWXZRN0dLWE90?=
 =?utf-8?B?NWZiMGxvRXdrMEpvaGE5SEYvNjd0MnNwY3BWVGovUENoNnNkemNDM05TajN1?=
 =?utf-8?B?MVBSdlFYUlBVSlVqSFFvUnUzSnNQU0VBeEFoTVk5Ti9BUmJOWEhkbWJFT0wv?=
 =?utf-8?B?ODFTY205N0QvVEU5T0hRa2dtUFc2elBTU3UrYXB0Z2tmc1JqQWJ6OTRYYk1z?=
 =?utf-8?B?WnhvS2h2UUhnaENvVEs4U2RYVTd6bGhlTDBEWVNPQk9VK0p5enR4NFFZZVVD?=
 =?utf-8?B?NkJxODZncmNSbDhGdVN0K1Q4UTB6bFNMSmhyaWMxejdrL2ZyK1BLVVNtWXFY?=
 =?utf-8?B?NzhtaTNYOXc3VXN1R0ZUc0szeEdBZmk0NVJhazFsMTh2eCtoRkk2R2V6REN2?=
 =?utf-8?B?NTBvWVkxbjEyTFBQU2pmVWl1OHN0UjlBYXRmNnVQbjY2VGhqNllPMWNrWU1m?=
 =?utf-8?B?U200WWIvaG84MjBES0h1OC93dlp6aUgydUY2UXRZZnhOaThHK0NaQWZmbnlZ?=
 =?utf-8?B?MWNYRnNWQUFqNDJTSWdXRmtqQXk4b2FNNkJoUlQ0NXVET21tdXNQZXN4ZVZj?=
 =?utf-8?B?VEl1YVVPTzFJdTE2WGl4bysxcmhJdk9Cb3QyMkRMTjIrTHBURHRnejdjbnFq?=
 =?utf-8?B?SVZoeTkxOFRpTUhJMmpkamtxS0JPNy9YQzlScUw1cGNwUGh2Q0I1bkI5SEc3?=
 =?utf-8?B?SGdxQmppL0tFUlJSb3lieW1RS29YL3M0Y1lYcHBORVJIaW9semRCTEFtb1hQ?=
 =?utf-8?B?cVVPUmxvMWNtODRucEtZM1ZPRXloSnMwYnBXZTJZWGN4Nk1rbW5lYlBsbDha?=
 =?utf-8?B?SEZKTXB3ckpkM2Q4Y1hDbXFTZ25sTGgwalYzdEFGR3B0YXB6WGQ3cmpHRlBt?=
 =?utf-8?B?Y1g0dXRoRGxvNFltRkEzbXhZbXcxL1hkRUFna0xOZTdwSVVDWG1WYVd4M1VG?=
 =?utf-8?B?dzY0TFd3UFpoV0VWbFFFL0U2K045U3RLZ2cwUnVNdFlDNjUwN0ZMbmFKb2Zk?=
 =?utf-8?B?bGJWNG9pa0hFMlI1UFhhaFk2TmZhSXpJL0pHMHVqclNYQXZTTVN3amZPUk5W?=
 =?utf-8?B?OXcybERKcXlJM2d4a3A3cEQ1OFhQWklxL3k0TGVNZnJFdjRuUkV5aVZuNVRB?=
 =?utf-8?B?TVhCSGg1K2dEUERUcEQrNEplTlZmeklFczhyOWtUNjc5S2VUaDdCSFJlUGtz?=
 =?utf-8?B?NTNWRjRyNmZjRFMwWmpHYXpKMEdBaCtLZkFHdFBPVTNEbFBVdzk4eDcxeUhn?=
 =?utf-8?B?ZnlzT1FuTzN4cXZBMlNmU2wwT3dOYmhRZldoa3hrRkl3Uld6ajlOOUZ3OWhm?=
 =?utf-8?B?OTY5ZTJnM1V5Mmp6TnNpUFd0UlpqVks2b2llZGFXR1FBQTRXbGoydW5QalIx?=
 =?utf-8?B?bzdhL3krR3VmbDAzRlByYk1nWkc0Wkt5cWswQzFLWmluVTIyQ1FWOS94WTFR?=
 =?utf-8?B?Tm96V2VkZkdEbUpTN0F5Wi85WVYwQUJqWkt2c1JmOE9Ec1huNWdyMXU0ZUlS?=
 =?utf-8?B?STF0dHppMng4RVdOcGhkdFhxV3h1NGlac1BSZWtleHBkQlFrSE14VWVMY2NB?=
 =?utf-8?B?UERuYzBtYnNTVCs5aHRkSFZlV3V4QkRlUU10akRveEcwaS9YS3QvVzViMmlM?=
 =?utf-8?B?Z2Nic3N2UDluZHVhMkxVME9EdHhkMUNQRkdra053ZVpxcE9jbGRNa3FlTW5V?=
 =?utf-8?B?U2dlZmo3T29zbjA3dDUzYmNGZWRlaVZVRi9vTStsVW5ZNVpvMU9iRTNJamVp?=
 =?utf-8?B?ZXIybUVTRFhUTFQyNzV3ams3c0w4eDZOdENEUzN3aithbjdvazBKSFM3dTFJ?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7826bb2e-40e5-4d54-2446-08dc0c670da4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2024 14:19:52.9758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNORrG362mcpsAmSgHKzBk8mLBng8rcH7eLE5NWhDf8jwwDL9CAI9wa6bQMv6TB1rZ6l0B0Yt0xIIrlAQc7tHO+58LPM3ki4cM9V8LmJ8J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IEphbnVhcnkgMywgMjAyNCA2OjUyIFBNDQo+IFRvOiBEYW5kYW11ZGksIFByaXlhbmthIDxwcml5
YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgS2VtcGN6eW5za2ksIFpiaWduaWV3DQo+IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+OyBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IFdlbHR5LA0KPiBCcmlhbiA8
YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZS94ZV9ib19t
b3ZlOiBFbmhhbmNlIHhlX2JvX21vdmUgdHJhY2UNCj4gDQo+IEhpLCBQcml5YW5rYSwNCj4gDQo+
IE9uIFdlZCwgMjAyNC0wMS0wMyBhdCAxODowOCArMDUzMCwgcHJpeWFua2EuZGFuZGFtdWRpQGlu
dGVsLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRh
bmRhbXVkaUBpbnRlbC5jb20+DQo+ID4NCj4gPiBFbmhhbmNlZCB4ZV9ib19tb3ZlIHRyYWNlIHRv
IGJlIG1vcmUgcmVhZGFibGUuDQo+ID4gSXQgd2lsbCBoZWxwIHRvIHNob3cgdGhlIG1pZ3JhdGlv
biBkZXRhaWxzLg0KPiA+IFNyYyBhbmQgZHN0IGRldGFpbHMuDQo+ID4NCj4gPiB2MjogTW9kaWZ5
IHRyYWNlX3hlX2JvX21vdmUoKSwgaXQgdGFrZXMgdGhlIGludGVnZXIgbWVtX3R5cGUgcmF0aGVy
DQo+ID4gdGhhbiBhIHN0cmluZy4NCj4gPiBNYWtlIG1lbV90eXBlX3RvX25hbWUoKSBleHRlcm4s
IGl0IHdpbGwgYmUgdXNlZCBieSB0cmFjZS4oVGhvbWFzKQ0KPiA+DQo+ID4gQ2M6IFRob21hcyBI
ZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiBDYzogT2Fr
IFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4NCj4gPiBDYzogS2VtcGN6eW5za2kgWmJpZ25pZXcg
PFpiaWduaWV3LktlbXBjenluc2tpQGludGVsLmNvbT4NCj4gPiBDYzogTWF0dGhldyBCcm9zdCA8
bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+ID4gQ2M6IEJyaWFuIFdlbHR5IDxicmlhbi53ZWx0
eUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUHJpeWFua2EgRGFuZGFtdWRpIDxwcml5
YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICstLQ0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RybV9jbGllbnQuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0NCj4gPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kcm1fY2xpZW50LmggfMKgIDIgKysNCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV90cmFjZS5owqDCoMKgwqDCoCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKy0t
LQ0KPiA+IMKgNCBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gaW5kZXggOGU0YTNiMWY2YjkzLi5mNzA3NWZk
ODY1NDcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+IEBAIC03MTMsOCArNzEzLDcgQEAg
c3RhdGljIGludCB4ZV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdA0KPiA+ICp0dG1f
Ym8sIGJvb2wgZXZpY3QsDQo+ID4gwqAJCW1pZ3JhdGUgPSB4ZS0+dGlsZXNbMF0ubWlncmF0ZTsN
Cj4gPg0KPiA+IMKgCXhlX2Fzc2VydCh4ZSwgbWlncmF0ZSk7DQo+ID4gLQ0KPiA+IC0JdHJhY2Vf
eGVfYm9fbW92ZShibyk7DQo+ID4gKwl0cmFjZV94ZV9ib19tb3ZlKGJvLCBuZXdfbWVtLT5tZW1f
dHlwZSwgb2xkX21lbV90eXBlKTsNCj4gPiDCoAl4ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQoeGUp
Ow0KPiA+DQo+ID4gwqAJaWYgKHhlX2JvX2lzX3Bpbm5lZChibykgJiYgIXhlX2JvX2lzX3VzZXIo
Ym8pKSB7IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fY2xpZW50
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fY2xpZW50LmMNCj4gPiBpbmRleCA4
MmQxMzA1ZTgzMWYuLmU4NDViN2YyMmUzOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZHJtX2NsaWVudC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Ry
bV9jbGllbnQuYw0KPiA+IEBAIC0xNSw2ICsxNSwxNCBAQA0KPiA+IMKgI2luY2x1ZGUgInhlX2Ry
bV9jbGllbnQuaCINCj4gPiDCoCNpbmNsdWRlICJ4ZV90cmFjZS5oIg0KPiA+DQo+ID4gK2NvbnN0
IGNoYXIgKmNvbnN0IG1lbV90eXBlX3RvX25hbWVbVFRNX05VTV9NRU1fVFlQRVNdwqAgPSB7DQo+
ID4gKwlbWEVfUExfU1lTVEVNXSA9ICJzeXN0ZW0iLA0KPiA+ICsJW1hFX1BMX1RUXSA9ICJndHQi
LA0KPiA+ICsJW1hFX1BMX1ZSQU0wXSA9ICJ2cmFtMCIsDQo+ID4gKwlbWEVfUExfVlJBTTFdID0g
InZyYW0xIiwNCj4gPiArCVtYRV9QTF9TVE9MRU5dID0gInN0b2xlbiINCj4gPiArfTsNCj4gPiAr
DQo+IA0KPiBQbGVhc2UgdXNlIHhlX2JvLltjaF0gZm9yIHRoaXMsIHNpbmNlIGl0IGlzIHJlbGF0
ZWQgdG8gdGhlIGJ1ZmZlciBvYmplY3QNCj4gcGxhY2VtZW50cywgYW5kIHRoZSBYZSBwbGFjZW1l
bnRzIGFyZSBkZWZpbmVkIGluIHhlX2JvLmgNCj4gDQo+IC9UaG9tYXMNCj4gDQpUaGUgYWJvdmUg
aXMgYWxyZWFkeSBkZWNsYXJlZCBpbiB0aGlzIHByb2dyYW0gaW4gc2hvd19tZW1pbmZvKCkuIEkg
anVzdCBtb3ZlZCBvZiBpdCB0byBtYWtlIGl0IGdsb2JhbC4NCklzIGl0IHJlcXVpcmVkIGFnYWlu
IHRvIGRlZmluZSBpdCBpbiB4ZV9iby5bY2hdPw0KLS1Qcml5YW5rYQ0KPiANCj4gPiDCoC8qKg0K
PiA+IMKgICogeGVfZHJtX2NsaWVudF9hbGxvYygpIC0gQWxsb2NhdGUgZHJtIGNsaWVudA0KPiA+
IMKgICogQHZvaWQ6IE5vIGFyZw0KPiA+IEBAIC0xMzEsMTQgKzEzOSw2IEBAIHN0YXRpYyB2b2lk
IGJvX21lbWluZm8oc3RydWN0IHhlX2JvICpibywNCj4gPg0KPiA+IMKgc3RhdGljIHZvaWQgc2hv
d19tZW1pbmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgc3RydWN0IGRybV9maWxlDQo+ID4gKmZp
bGUpDQo+ID4gwqB7DQo+ID4gLQlzdGF0aWMgY29uc3QgY2hhciAqY29uc3QNCj4gPiBtZW1fdHlw
ZV90b19uYW1lW1RUTV9OVU1fTUVNX1RZUEVTXcKgID0gew0KPiA+IC0JCVtYRV9QTF9TWVNURU1d
ID0gInN5c3RlbSIsDQo+ID4gLQkJW1hFX1BMX1RUXSA9ICJndHQiLA0KPiA+IC0JCVtYRV9QTF9W
UkFNMF0gPSAidnJhbTAiLA0KPiA+IC0JCVtYRV9QTF9WUkFNMV0gPSAidnJhbTEiLA0KPiA+IC0J
CVs0IC4uLiA2XSA9IE5VTEwsDQo+ID4gLQkJW1hFX1BMX1NUT0xFTl0gPSAic3RvbGVuIg0KPiA+
IC0JfTsNCj4gPiDCoAlzdHJ1Y3QgZHJtX21lbW9yeV9zdGF0cyBzdGF0c1tUVE1fTlVNX01FTV9U
WVBFU10gPSB7fTsNCj4gPiDCoAlzdHJ1Y3QgeGVfZmlsZSAqeGVmID0gZmlsZS0+ZHJpdmVyX3By
aXY7DQo+ID4gwqAJc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYgPSAmeGVmLT54ZS0+dHRtOyBkaWZm
IC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVudC5oDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZHJtX2NsaWVudC5oDQo+ID4gaW5kZXggYTk2NDlhYTM2MDEx
Li40ZTMzZDA5ODFiNmEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Ry
bV9jbGllbnQuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kcm1fY2xpZW50LmgN
Cj4gPiBAQCAtMTMsNiArMTMsOCBAQA0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+DQo+
ID4gwqAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4NCj4gPg0KPiA+ICtleHRlcm4gY29uc3Qg
Y2hhciAqY29uc3QgbWVtX3R5cGVfdG9fbmFtZVtdOw0KPiA+ICsNCj4gPiDCoHN0cnVjdCBkcm1f
ZmlsZTsNCj4gPiDCoHN0cnVjdCBkcm1fcHJpbnRlcjsNCj4gPiDCoHN0cnVjdCB4ZV9ibzsNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oIGluZGV4IDk1MTYzYzMwM2YzZS4uMTk2ZDI3Nzc5NWEw
DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmgNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2UuaA0KPiA+IEBAIC0xMyw2ICsxMyw3
IEBADQo+ID4gwqAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPg0KPiA+IMKgI2luY2x1ZGUg
InhlX2JvX3R5cGVzLmgiDQo+ID4gKyNpbmNsdWRlICJ4ZV9kcm1fY2xpZW50LmgiDQo+ID4gwqAj
aW5jbHVkZSAieGVfZXhlY19xdWV1ZV90eXBlcy5oIg0KPiA+IMKgI2luY2x1ZGUgInhlX2dwdV9z
Y2hlZHVsZXJfdHlwZXMuaCINCj4gPiDCoCNpbmNsdWRlICJ4ZV9ndF90bGJfaW52YWxpZGF0aW9u
X3R5cGVzLmgiDQo+ID4gQEAgLTEwMCw5ICsxMDEsMjYgQEAgREVGSU5FX0VWRU5UKHhlX2JvLCB4
ZV9ib19jcHVfZmF1bHQsDQo+ID4gwqAJwqDCoMKgwqAgVFBfQVJHUyhibykNCj4gPiDCoCk7DQo+
ID4NCj4gPiAtREVGSU5FX0VWRU5UKHhlX2JvLCB4ZV9ib19tb3ZlLA0KPiA+IC0JwqDCoMKgwqAg
VFBfUFJPVE8oc3RydWN0IHhlX2JvICpibyksDQo+ID4gLQnCoMKgwqDCoCBUUF9BUkdTKGJvKQ0K
PiA+ICtUUkFDRV9FVkVOVCh4ZV9ib19tb3ZlLA0KPiA+ICsJwqDCoMKgIFRQX1BST1RPKHN0cnVj
dCB4ZV9ibyAqYm8sIHVpbnQzMl90IG5ld19wbGFjZW1lbnQsDQo+ID4gdWludDMyX3Qgb2xkX3Bs
YWNlbWVudCksDQo+ID4gKwnCoMKgwqAgVFBfQVJHUyhibywgbmV3X3BsYWNlbWVudCwgb2xkX3Bs
YWNlbWVudCksDQo+ID4gKwnCoMKgwqAgVFBfU1RSVUNUX19lbnRyeSgNCj4gPiArCQnCoMKgwqDC
oCBfX2ZpZWxkKHN0cnVjdCB4ZV9ibyAqLCBibykNCj4gPiArCQnCoMKgwqDCoCBfX2ZpZWxkKHNp
emVfdCwgc2l6ZSkNCj4gPiArCQnCoMKgwqDCoCBfX2ZpZWxkKHUzMiwgbmV3X3BsYWNlbWVudCkN
Cj4gPiArCQnCoMKgwqDCoCBfX2ZpZWxkKHUzMiwgb2xkX3BsYWNlbWVudCkNCj4gPiArCQkJKSwN
Cj4gPiArDQo+ID4gKwnCoMKgwqAgVFBfZmFzdF9hc3NpZ24oDQo+ID4gKwkJwqDCoCBfX2VudHJ5
LT5ib8KgwqDCoMKgwqAgPSBibzsNCj4gPiArCQnCoMKgIF9fZW50cnktPnNpemUgPSBiby0+c2l6
ZTsNCj4gPiArCQnCoMKgIF9fZW50cnktPm5ld19wbGFjZW1lbnQgPSBuZXdfcGxhY2VtZW50Ow0K
PiA+ICsJCcKgwqAgX19lbnRyeS0+b2xkX3BsYWNlbWVudCA9IG9sZF9wbGFjZW1lbnQ7DQo+ID4g
Kw0KPiA+ICsJCcKgwqAgKSwNCj4gPiArCcKgwqDCoCBUUF9wcmludGsoIm1pZ3JhdGUgb2JqZWN0
ICVwIFtzaXplICV6dV0gZnJvbSAlcyB0byAlcyIsDQo+ID4gKwkJwqDCoMKgwqDCoCBfX2VudHJ5
LT5ibywgX19lbnRyeS0+c2l6ZSwNCj4gPiBtZW1fdHlwZV90b19uYW1lW19fZW50cnktPm9sZF9w
bGFjZW1lbnRdLA0KPiA+ICsJCcKgwqDCoMKgwqAgbWVtX3R5cGVfdG9fbmFtZVtfX2VudHJ5LT5u
ZXdfcGxhY2VtZW50XSkNCj4gPiDCoCk7DQo+ID4NCj4gPiDCoERFQ0xBUkVfRVZFTlRfQ0xBU1Mo
eGVfZXhlY19xdWV1ZSwNCg0K
