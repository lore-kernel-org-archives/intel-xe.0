Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9AAEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 10:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1CB10E2D8;
	Tue, 27 Jun 2023 10:14:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8D10E2D8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687860856; x=1719396856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j6K4a0fnKQrcUtY8vRKrjh11niYoUgaJfiuST9DPItU=;
 b=IEpZXOwE0HhNl+Qg1mXMP3GXZ71Jf2AccfrqV40ljOHdRoYqos7PC6Un
 XEw/a2yldWfzS7ll5MdEGae6aXB6ZbdRVkNyz/71l2rxg3owS2hfPcunX
 n+Xwim/85mHdRfV01JYlhoRmJkCZB0sVy0L14F4bkVgpFvrsi1sGoXSeF
 IoHUXL4nF1Z5wrB3FlNiVyDPiMpcQHdfWRnuWg1sSAZ/Wdvy3QFYCqX4k
 GHLfsIM+wM0gxyDLRlZQM8UQOBsgWhRoQHAPoCxWwu3aj3ZE/JeM7zMUr
 Y/M2NPsFGsejG4jMksD/IVpecERlOVB5MXsAYGDj6upFqmMYp0MDQM6O/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="346293062"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="346293062"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 03:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="746143604"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="746143604"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 27 Jun 2023 03:14:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 03:14:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 03:14:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 27 Jun 2023 03:14:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3DpwklqSL6LRlPN+yeRcOp5GIjlvuMOwuPkKeoOhzHkQYqwrRIUt72nD5pabyGCP9S/EBh8gKLyEfZJ8Ph9J5+5uBqf626DSbniUuwph0QntxZiw0kDWx6At3qg+WBO34gaOosIQuC46hzTkNU0CqtlOJnYGeoemI2DBGbhLWRrxHjG0N8pOLikM5ePxqfLUaxAInLCMrxLOWmUBPlRrhV76LXHGTzvwk0qd4bs8zR8GMyQA+McE5aJ9jba1wxOLoj0/oOzCq0RGoM6Y7BogjemvFNoX4eE2JLrM7KFB6P6Q3OiqAP1gNsbWtTfYx6XhS4LkKEnIK+QiWt0NAnIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6K4a0fnKQrcUtY8vRKrjh11niYoUgaJfiuST9DPItU=;
 b=RCixfXCkAgTCPXerK8QrZ6PEbreQLdk3jhkOKYaMDmK+OB1/L7FdDl16Hueyi6Y+NVUvBLFTKNVncrQ/QNdkk/rFbdx4xnTYan9P4xQb4Pd1VqJCR5dBCfUSeO5RiC0YEvnr8MEktoJBdVoCrtlyAzGHVM2JUCtXO5d9byMucfHV/sJImVcyVhcr8qkXJR0IIbZR+odS9LOumRTUPBTX9ti0sWHlGU0/Eu3KjtssozyKURKItMFGcA3xwKyrzFp+XGCGYageO0DT5++cTWCiKrTHauU9Ponx3DCLDL3ejxdosmryrxN1EqbkRnJoiSeRLcKQ6z95oXos+/O18m9XcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Tue, 27 Jun
 2023 10:14:13 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 10:14:13 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v12 04/13] drm/xe/guc_pc: add missing mem_access for
 freq_rpe_show
Thread-Index: AQHZqBwhaLDqNaB5yk+YHEd63i+KB6+eNwEQgAAZTICAAB6MwA==
Date: Tue, 27 Jun 2023 10:14:13 +0000
Message-ID: <CY5PR11MB62118E93051092EA93FC07BD9527A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <20230626105037.43780-19-matthew.auld@intel.com>
 <CY5PR11MB62117F609203FC0958818E3F9527A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <6d1e3a45-efd0-6ed4-88eb-e2d3fc752dd8@intel.com>
In-Reply-To: <6d1e3a45-efd0-6ed4-88eb-e2d3fc752dd8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH8PR11MB8105:EE_
x-ms-office365-filtering-correlation-id: 12c7fa28-86b9-42c0-f83a-08db76f74177
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jm2HU/nU1v+wTxaJuxSpUIpzC+sgS/ckK44eL8ny940fhL5w8rwlCnjrZkZZMl4BI6vy6tdb2lnDueehMthzkNOrEVt7ObFgTbMqtWsM4xzxYgR4NfE3uvAzmoh8V+I2rAiwV1n+B57xcqXKw4Y7cLXqcXAvp39ZznyzoJvHefHjDIERbZnyfzbWx6XAEGq/SlzCOp35l92rzgcjTPRD3nJ3YaKv5lFmMnFbF6uakTQTEgXJX9+hMyx/Fv/9lq0hJNxq9wsadwSmrEbwMmR5Tvr18eheUdWBIaPdTm3QuTArGji8c5w88Yo5T72HniJp3tp1d2HX2zaUXe+pqNTGVP/4fe5EuuhHlfooowe/9KYmI41DnkAJUdnMf/HtzEJjPg0CAKUcOpofrdHlhaPMAAKd+kGrRBgEbOrI1/823WdOTwVTdBbOaFQUW4yaLdDIGPMTtgqdokjav7M9gYknbRFqWwHHS/vdzi4fJs7dnEgt6cBBHoNm6987O2acziV1XeZdMR8bRSgonX5SjTumPsZmzFnOqfDEEtO/Ea9xlK1egj5io6D5pLYFKexHHBlnWmpZuRTwX76VSdERwEf9abcUF/+6USncWPA+W49/lYg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(5660300002)(38100700002)(83380400001)(26005)(966005)(52536014)(82960400001)(53546011)(55016003)(6506007)(122000001)(9686003)(478600001)(38070700005)(107886003)(41300700001)(33656002)(7696005)(86362001)(66476007)(316002)(8676002)(66446008)(76116006)(64756008)(4326008)(8936002)(2906002)(186003)(110136005)(54906003)(71200400001)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alltcTRjS3pRdGlrSG9mUlB1d1BJWDFkdGFBWVk3TTdOZ1BRMFZxQTVNbFBP?=
 =?utf-8?B?VFF4ZEx2RVN1UnUyOHJXbTVPUFJwNUN5Mk5iM01CYXRUd1Iyek5scmVHeXhB?=
 =?utf-8?B?VnRZbWdJZGZqNVlHWGtCZlZQQUlrdERDclFYNmZmRUNtSHV3VGNZYlpPZVpT?=
 =?utf-8?B?aER1NVQzbFNrK1lhQXlDa0NqWXV2bTh5UlFDK1kzN3dmZmhGL0RvY3p2VUpr?=
 =?utf-8?B?RU5WWGlockhma3haa3FQS0VremxqWXh1UXZlQnpvQ1hVSHhwdVZiK0xDZVU1?=
 =?utf-8?B?aERyN2dFY3JTWmQyQm8yaFVKSm1WZnpWM255ZjNYYkNXYWd2bEFZTUJHMEhQ?=
 =?utf-8?B?YXJEN2RKS3hGY1dSVDA3cXN6UEgvR2l3aUtURHVLNC9RbzhMUHF0YXV5Q0hS?=
 =?utf-8?B?U203cnlWMW9Bc2JMK0ZtaTBGNE0yK1RrM0tMeHZkU0hkOFo3d1pvenV2WG1D?=
 =?utf-8?B?cjl4TzFHbUU2b0JZM1RZN0xWRmNyS1B1eGp4WTBLU1YrandPRzhvemgwUU9r?=
 =?utf-8?B?eUlYRFpESEVoTVMyYUtpd0k0cWhrVXcvSkpLNVF1TlIrMTZtMVdCMUxaTlBY?=
 =?utf-8?B?OVRqREZzR0lVM1plSDBGdlFObDJOdFFmWUlubVQ3WDZDWUR6d2dUdjJkOW9N?=
 =?utf-8?B?MGVQcVd1UzJ5czB4VUF6ZWoxdXpONmoyMjJnYkJLT29xb1BybnpvWE14REFN?=
 =?utf-8?B?S1lHTVpPMVhFRDFZc25DNzZzdXFkSFAzU3gva09PVUEzVzJhSGlRSlY5ajg2?=
 =?utf-8?B?UEowc1AvaEJBY2dFSmM1N25wQVFUKzBNckJTcWVobjBzUzN4cXFyRnZ1N041?=
 =?utf-8?B?dFVXbVdaclRRdXNIWWtybkZ6YjNZaTJuYWdaRFduc0d2QXBaeW9kYTZKMWtN?=
 =?utf-8?B?QUJVZGVlQzQ2VTMzWE5RSmxNUnIrdkd6c2tyMDNlT3E1S2MxQTI5V0FXQUlZ?=
 =?utf-8?B?RW5ELzJ6dzIvcUFQL0NhOENZVGV4Zk45ald0T3hXSmtyclFvdGFiQk1ydFpH?=
 =?utf-8?B?UjgvVEtTWFpGN1hDeUo3Rm8xQXhrRzFmOXI0NzM2Q0xUTXlGYWlnTlNUVkJt?=
 =?utf-8?B?Q0ltQTV3bWhPVXZoeDZMa0lYZjI0bnBRY3lwRHdOU0J6bTh5ZWxEMTBmOUFQ?=
 =?utf-8?B?YW9JdW9wR2h3SExBL0RhcWl5T1JzU2Jlb1dER01HY3NEQkJBNlRWaTJZMVF5?=
 =?utf-8?B?Zyt2UUFDVzlDaElEWHpyOGh6OWpsVGJ2TzNEU1dxYUp2Nk01amJ2NVZZRFlp?=
 =?utf-8?B?TUlMQ1NMM0hKbFBpVnRYRlhBb0JPN3c2K0RFVkRIZTJ5V3RFNDZ5VjQvMjJV?=
 =?utf-8?B?alFIUnlFcFdiUUEwMzEyeHR3L3ZVVmhaYUx1RUJ4bDFjaFNONUFJM2NkQ2gv?=
 =?utf-8?B?Q1ZLTEZUZml3WUJyTysyOUcrbTZxbDEzeFRtMkNjbzNiZ3MwUStiQTkvb2Zo?=
 =?utf-8?B?NzlINjRka2J0NGxkVExQS0l4VjBGUXVxUG5nQm0vc2w4cENZa3dQRFIyQlJt?=
 =?utf-8?B?Y0t1bHVQMkl0MVFXTGYrakNrbFh0ZU5oLzlwenhNYWJ5YXVVaDVLRmdyZm5l?=
 =?utf-8?B?S0JyakRQODI4K3BjS1J3eVg1K21neGNBWVhtUkFvREkzY3BFVVRHdk5Ic2Zh?=
 =?utf-8?B?Q2tnV0VTc1lzNzJ2OG80UXgwUEZ0SkN4SGM0a0N5V0oyZVZpZEpidG9JVGli?=
 =?utf-8?B?S1QxOUZQSFJJU2UxQk93MjdlT3R0amFzejVyakVpT3NrQW1HUXJpUFd2dDhp?=
 =?utf-8?B?QU9jaURsbmtIdHFVY0g3M01rTkVjbk1EVy83K3ZxUlV2Q3E1bUJFSm1ka0dM?=
 =?utf-8?B?SEx3bC80QVdkRkcvNk1GenVnR1IvQ2tzOVBvQ3pPekcwd2tXTFMxOUZkeFBL?=
 =?utf-8?B?cjNSSzhCaWtyZ214WFBKaHdoTkRocUg3R0I0bWZIalhiYzh0dHlkMHY2SWlP?=
 =?utf-8?B?RnhJMXJheHJkYnlldmd4aU9tM3h1SXZOQSsreDFBakNNbThUK3BsTEhVb1JF?=
 =?utf-8?B?aCt3cGQ0NW9SK1kyZVZMQWxJZUc0VVNGSVVpdWJuc0orenBINXFZQi9CVU04?=
 =?utf-8?B?RWtqclZheHJGeFNPY01OaEgzTmxMbVlsd1d5SkFVMUJ6Q3JRWTJDdndVMU5q?=
 =?utf-8?Q?BbowDn4Lh5ygNVku3KcvlwRn8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c7fa28-86b9-42c0-f83a-08db76f74177
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 10:14:13.0365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vqZ/gQU1zazOtkKYaZV/sYbpVEsQ+JM5hh/DPRUyqZtSQFFTl9xgFJ9CXPdSn9QV5SyVOAnSQEgHCf8QPXMaSIMkMpTJfZXfJawZPzC3mX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v12 04/13] drm/xe/guc_pc: add missing
 mem_access for freq_rpe_show
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAyNywgMjAyMyAx
OjUxIFBNDQo+IFRvOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47
IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJyb3N0LCBNYXR0aGV3
IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28NCj4gPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEyIDA0LzEzXSBkcm0veGUvZ3Vj
X3BjOiBhZGQgbWlzc2luZyBtZW1fYWNjZXNzIGZvcg0KPiBmcmVxX3JwZV9zaG93DQo+IA0KPiBI
aSwNCj4gDQo+IE9uIDI3LzA2LzIwMjMgMDc6NTMsIEd1cHRhLCBBbnNodW1hbiB3cm90ZToNCj4g
Pg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tIEZyb206IEF1bGQsIE1hdHRo
ZXcNCj4gPj4gPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+IFNlbnQ6IE1vbmRheSwgSnVuZSAyNiwg
MjAyMyA0OjIxIFBNIFRvOg0KPiA+PiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcgQ2M6
IEJyb3N0LCBNYXR0aGV3DQo+ID4+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IFZpdmksIFJv
ZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Ow0KPiA+PiBHdXB0YSwgQW5zaHVtYW4gPGFu
c2h1bWFuLmd1cHRhQGludGVsLmNvbT4gU3ViamVjdDogW1BBVENIIHYxMiAwNC8xM10NCj4gPj4g
ZHJtL3hlL2d1Y19wYzogYWRkIG1pc3NpbmcgbWVtX2FjY2VzcyBmb3IgZnJlcV9ycGVfc2hvdw0K
PiA+Pg0KPiA+PiBUaGUgbWVtX2FjY2VzcyBpcyBtZWFudCB0byBjb3ZlciBhbnkga2luZCBvZiBk
ZXZpY2UgbGV2ZWwgbWVtb3J5DQo+ID4+IGFjY2VzcywgbW1pbyBpbmNsdWRlZC4NCj4gPj4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPiBD
YzogTWF0dGhldw0KPiA+PiBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+IENjOiBSb2Ry
aWdvIFZpdmkNCj4gPj4gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+IENjOiBBbnNodW1hbiBHdXB0
YQ0KPiA+PiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPiAtLS0gZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19wYy5jIHwgNA0KPiA+PiArKysrIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMu
Yw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYyBpbmRleCA1ZDVjZjRiMGQ1
MDguLmUzNzIyYTgwNTgzNw0KPiA+PiAxMDA2NDQgLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19wYy5jICsrKw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYyBAQCAt
NDMwLDggKzQzMCwxMiBAQCBzdGF0aWMgc3NpemVfdA0KPiA+PiBmcmVxX3JwZV9zaG93KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXINCj4gPj4g
KmJ1ZikgIHsgc3RydWN0IHhlX2d1Y19wYyAqcGMgPSBkZXZfdG9fcGMoZGV2KTsgKw0KPiA+PiBz
dHJ1Y3QgeGVfZ3QgKmd0ID0gcGNfdG9fZ3QocGMpOyArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0N
Cj4gPj4gZ3RfdG9feGUoZ3QpOw0KPiA+Pg0KPiA+PiArCXhlX2RldmljZV9tZW1fYWNjZXNzX2dl
dCh4ZSk7DQo+ID4gV2hhdCBpcyBkZXNpcmFibGUgdG8gdXNlIGhlcmUgLCB4ZV9wbV9ydW50aW1l
X2dldCgpIG9yDQo+ID4geGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KCkgPw0KPiANCj4gUm9kcmln
byBzdWdnZXN0ZWQgdXNpbmcgeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KCkgZm9yIE1NSU8sIHNp
bmNlIGl0IGNhbg0KPiBiZSB0aG91Z2h0IG9mIGFzIGp1c3QgYW5vdGhlciB0eXBlIG9mIG1lbW9y
eSBhY2Nlc3MsIHdoaWNoIHNlZW1zIHByZXR0eQ0KPiByZWFzb25hYmxlIHRvIG1lLiBNYXR0IFJv
cGVyIGFsc28gaGFkIHRob3VnaHRzIGFib3V0IGl0IGhlcmU6DQo+IGh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81NDI1MzgvP3Nlcmllcz0xMTkzNDUmcmV2PTENCj4gDQo+
IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGVpdGhlciB3YXksIGp1c3Qgc28gbG9uZyBh
cyB3ZSBhcmUgY29uc2lzdGVudCBhYm91dA0KPiBpdCBhbmQgaGF2ZSBhIHJlbGlhYmxlIHdheSB0
byBhc3NlcnRfZGV2aWNlX2FjdGl2ZS9hc3NlcnRfbWVtX2FjY2Vzcy4NCj4gDQo+ID4gSXQgaXMg
cmVnaXN0ZXIgbW1pbyBhY2Nlc3MgRmV3IHBsYWNlcyBpbiBkcml2ZXIgdXNpbmcNCj4gPiB4ZV9w
bV9ydW50aW1lX2dldCgpIGZvciBtbWlvIGFjY2Vzcy4NCj4gDQo+IFRoZSBvbmUgaW4geGVfdm0u
YyBsb29rcyB0byBiZSBhIHdvcmthcm91bmQgZm9yIHRoZSByYWNlIGluIHBhdGNoIDEsIHdoaWNo
IGlzDQo+IGZpeGVkIGluIHRoaXMgc2VyaWVzLiBJZ25vcmluZyB0aGF0IEkgb25seSBzZWUgdGhl
IGNhc2VzIGluIGNvbXBhdC1pOTE1LQ0KPiBoZWFkZXJzL2k5MTVfZHJ2LmgsIHdoaWNoIGxvb2tz
IHRvIGJlIGEgc3BlY2lhbCBjYXNlIGZvciBkaXNwbGF5L2k5MTUsIGJ1dCB0aGF0IGlzDQo+IGFs
c28gY29udmVydGVkIHRvIHVzZSBtZW1fYWNjZXNzIGxhdGVyIGluIHRoZSBzZXJpZXMsIHNpbmNl
IEkgd2FudGVkIHRvIHRyeQ0KPiBhZGRpbmcgYXNzZXJ0X21lbV9hY2Nlc3MgZnJvbSBhbGwgTU1J
TyBjYWxscyB0byBzZWUgd2hhdCBDSSBzYXlzIChpdA0KPiBjb21wbGFpbmVkIGFib3V0IGZyZXFf
cnBlX3Nob3coKSBhcyBwZXIgdGhpcyBwYXRjaCkuIEFyZSB0aGVyZSBzb21lIG90aGVyDQo+IHBs
YWNlcyBJIG1pc3NlZCB0aGF0IGFyZSB1c2luZyB4ZV9wbV9ydW50aW1lX2dldD8NClRoYW5rcyBm
b3IgZXhwbGFuYXRpb24uDQpSZXZpZXdlZC1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1
cHRhQGludGVsLmNvbT4NCj4gDQo+ID4gVGhhbmtzLCBBbnNodW1hbiBHdXB0YS4NCj4gPj4gcGNf
dXBkYXRlX3JwX3ZhbHVlcyhwYyk7ICsJeGVfZGV2aWNlX21lbV9hY2Nlc3NfcHV0KHhlKTsgcmV0
dXJuDQo+ID4+IHN5c2ZzX2VtaXQoYnVmLCAiJWRcbiIsIHBjLT5ycGVfZnJlcSk7ICB9ICBzdGF0
aWMNCj4gPj4gREVWSUNFX0FUVFJfUk8oZnJlcV9ycGUpOyAtLSAyLjQxLjANCj4gPg0K
