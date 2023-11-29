Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CCEC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 05:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE5110E17C;
	Wed, 29 Nov 2023 05:00:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B234F10E17C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 05:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701234049; x=1732770049;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=i3KOrMr2yg91/YFv+a1xPY3n7HaC1zB3FexWkH8bP4w=;
 b=nYKxDGdni+8QlR8zzlBGj73BFUwA2HzJhq18LplWivM4tZaHAeRC+dI7
 NBeDvJXBw9ebFhzvEQjm+LsQ4fGK+xbd73fv3DBq1LzTW7RhqbQEAvhC2
 HzeTzMns/VD0Gch8hjluDvM7EaUVvN7tfL8BesXSwrWuYabTFLU7zdnyM
 NH7/STVPA9Vl6dHlwrliDi0fL95BA+tZPjgiJZ4G1MMtg22Aqs1WeyYWL
 Kpon1oRA7+0OxPCtwtvcRN0Vi6cxD0WGAJn54tBJY3wtB+eM7Iah4MeV7
 VvYLw7VrbTideTSpUHO4475pGjOerC7TNe38+QYVQV4n925ERAnx9tAwX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6310138"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6310138"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 21:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892321720"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892321720"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 21:00:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 21:00:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 21:00:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 21:00:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 21:00:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBpA+IBnowqMJoynalRi3hQHUrKBYbRPafwITG5MX+mxJmhJXx/dNvuhThFgrZlqga24dX7N2Qai2nK5UQYTqtNddId3kCvb8/H23/bgjfYorrPKJUYYO7pTtRngreevFFWylN2TNVvU7DIok0AC6awFE0a27LVt1yYG7/v+wZbFQMfNzwwehQBO7C/dZzP3n2JcaQcDONT7290i52gOUqhXh0vTOx49RSVYegVA8YLospfrXcjd7jHUuMSSeFa4AJAb7drUgsaI2AbtrNWg/Q77bDAJuJBY6es2fVv8BEX9iVRpzyK5f/6gYeNyF7BH5GfZM8VJTr9lMfZ5/aET3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3KOrMr2yg91/YFv+a1xPY3n7HaC1zB3FexWkH8bP4w=;
 b=DQ2sHk5Itx465GiA3R3ZPjTH5V771ZzS1ByzeQDKYILY6jPesGAemdXukuwTMg5JYG0I51ns4u/X1aQXHy3zUYOiP5b9axJQSIZ15eqWRbssdUFZ9BhTDmnhf8SgvLkYgMaqmbEiefMEziLYVqcfJTTB2FsSbuRt0MbO9PH39DKJDRygm5riq3LXrqz4eolv94+CZcGMAOG8ErwF/hjwYEZhzlhhMfBaUgF8QOqg2n3t/R4aw5lNc5rR4RmjiTWQuzNil9/SaGATra584J0BkGZ88A09D45tMorlfehHmO1yM/9TTXHWo3Nhi0LbmMH+dImeDEW0bETinWfGBnNUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 05:00:39 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 05:00:39 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M via
 sysfs
Thread-Index: AQHaIgwv0nUiTdecQkm7LclbocI0ZLCP9LuAgADI2eA=
Date: Wed, 29 Nov 2023 05:00:39 +0000
Message-ID: <SJ1PR11MB62045C5257D79A6B5E47CCCF8183A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-3-tejas.upadhyay@intel.com>
 <80cd47a5-f157-4847-8242-df842c2e2aec@intel.com>
In-Reply-To: <80cd47a5-f157-4847-8242-df842c2e2aec@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM8PR11MB5640:EE_
x-ms-office365-filtering-correlation-id: f6d3c21a-58a8-4c57-05d2-08dbf0982188
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6yOLLmhnkRh3kMibagrwgigvH4RMj9v0m81HWCn/fNw0RD9zBRCf2tOPLBdkdkqfw7KFW6NPdvnz5BHUTb4qBTRLQgDhA42DyT/yOQQiPujS0uIZ44XXhkf8icQTHgNQr3ZSmJ6cr4E4gyHtmCWwlayaAsYDVzG8YFwbK+kryy35Cg290TTld7qcXvmVqb55wrPwmN0BiUcrPDRMCsq7TRvnnTVa960JeTMYfGeGSWvdyl6BjpmHKnqRxKkdaQwbb/+wYRphWx+8GAbzSE2qYoZvIdWFe3N4cbKW/Mw4998jy2fZ3yCCRe8nmNaC584VULwJiF/axwpDtZaNphmf7Y+CpuygBIhORyrTuMXuMPHnE11XiAW5wx+8FReBOrz62/CVC8cCGVeTMle/mAai2of7et0HdDchwjkS2pz3zazpGhI0QXwX1zWkaacvnPWV2uiIMAwGjGoALojEHLY0YE0ZehzrkfLM2KhToXGfjU8ZBXKxcNIq6ji0rxNmnNzM5P2Z8RhS4ujrFtVaxvGiZS9T56iUO/+Iy/g5up2j/kXJQVXUUDaQ6oPa+y4aZ6LGcPnQSG3oJPngoTlO2ddD1CflqX9gPpvB/hkOobg+IHcpdbBFsFNu9wc3PyAlAPxI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(71200400001)(52536014)(9686003)(82960400001)(8676002)(8936002)(55016003)(5660300002)(478600001)(86362001)(6636002)(110136005)(76116006)(66446008)(66476007)(53546011)(66556008)(64756008)(66946007)(316002)(38100700002)(83380400001)(122000001)(6506007)(38070700009)(2906002)(41300700001)(7696005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmVNODBUVlkxci9lcERMUGlQK0Q1djFJNGh4NWk3djNWa2pNZUdranpHRkg4?=
 =?utf-8?B?dXErTVhPN2ppZWNKOWN6b2Zpam1mc0VPbUlRS2IxajYxYWZ3aThsK1ZJMjVC?=
 =?utf-8?B?VTNUYW1TMXVkSVRQRVpzZUhFSzlTeTB6S1RMTEw1YmpNZ3NBMTl5eExhSFds?=
 =?utf-8?B?VUR0RUttOEhGbGJza0lHSzJUSTFCNmtnb2dEKzY0RlVoaUk4NUFDQlA0SkpB?=
 =?utf-8?B?UjFteDd6d2FycllpeisvVGI2MGNjdEtkNitaaWczQzNGdWdYWGttZkllRC8r?=
 =?utf-8?B?Y2NqM3NMS294Q3dKVnNXYlRMK080Q3pxemxTSVVXM2FQdEdUdWtRNVFWeHlF?=
 =?utf-8?B?YXhxYmNPUEYxOTV5aXEvMHkxdDhDZWU1dnJSUVlISldoRys1MmZlbFhBU1ov?=
 =?utf-8?B?MnFKekk3WFRlU1Vzek94NERSNHFaS1NvSXQxajdVODU3OHFpODQ4V1poaGZx?=
 =?utf-8?B?bEErRXBmNE1SNDNwK2N3OWU0MGU5bU5OdlY2bWs0SmpSQzB0QXFzLzQ1d3dV?=
 =?utf-8?B?c09wWkttYkdkcEljcnBSWFJzWEdtTnkzUUFyYytPVFljaFVtYmJFZU1FV0d1?=
 =?utf-8?B?c25RK2libEozVTUzbkJTSWptTTlsUVU1c3dBS3dDNkI3QUhCL05wci9Ceml1?=
 =?utf-8?B?ZTBiTzhtSEZvTGxxWHpsdjRNRGtuSG1lK2hVUHBYVysxNFlWa2JmR1ZraWxx?=
 =?utf-8?B?M3JhbmpUNjJOQkpjRkFSOHVSSVRMSVU1dFFGVkUyQlN1cUw0WFhvSWhWbnYw?=
 =?utf-8?B?QllEMm93c1FIcDhCMHdicnoxUE03cFo4YXpRQWEzeDVtRWh4cWRMYVZOaDRq?=
 =?utf-8?B?OGJQL0tVeHgxWEkxb0UreHM5eTFJZFpNREVTV1hpQnlENm1UWW9JVDlFa25B?=
 =?utf-8?B?VjhyamNhNVIvb3Q4SjZRNENBd3A5OFEvcUNWZ09NOUFjQ25ad2JIYUY2bjY1?=
 =?utf-8?B?SDJtWnJHRGthNEpXQXByeFRLcy9OYnF2RXB6U280QlBvTXFFRkF1c2t5US8z?=
 =?utf-8?B?aWlmZ0o1OG5aNFBzTGtnV0ZjTkQyaitGdHlISWJCZzJSRDl3bTRSODlielRI?=
 =?utf-8?B?c2hKUzdWK2R1VzBRck1PMy9xR2F0WXdDSWVnOHcveEJIeFFSQnErL01wMkIw?=
 =?utf-8?B?SGdiUjV1d1VYTU8rTFcvSTFiVVhyUGVZK2NHa0FQbVlQWDREU3oxU0NsR1VF?=
 =?utf-8?B?dCtycFlYTjZtR0RVUDRneEZMbTh3Z2lmQk13aE5EaDZ1MUFIUDhwM2tiVjNx?=
 =?utf-8?B?U1Juam8xdWxmS2RsQ3BIWVJpcGpzN0dXOEhUbDlVZFU3TWlUa0xsK0xaRUpk?=
 =?utf-8?B?bG5oQ0NoVFFJQlAxTmhoWkkvZHBjeWtaaG1YNndtdzVmMHhsUXBkL0s3RHFi?=
 =?utf-8?B?TlFrTnZhbVlHSC9xSFlYTmdnWGFEbmJuWGtLZVg2dTNIKzJXQWxEc1did2Uz?=
 =?utf-8?B?Qm5BUnB6NlEvZG5JNFlOSlRlT21IMzJjaTRUaVhEN1lzV0hnVHZ1OFdFNE9N?=
 =?utf-8?B?dCtBeUhDcnlId05OWGYyV3g5aXlrKzlYWHptaDFnU2FJV3Y2aVdYNGl2SXdO?=
 =?utf-8?B?Y0xDYkpVWEZGU0cvaXhydzMybUp2RURCUzFOMGtUM2RneWprbDdzQkNyNVRH?=
 =?utf-8?B?NUhrdEdBN2Z4L1psbStXN0h1Q1pkd25aUWFOM0tXdnZFaWZnL0c2b2k0aHpM?=
 =?utf-8?B?cFZSV0hUZmtVblJjS3JOb0lXOERBYjVvN3NKdXptengxVSs3T3dCTmJwdXYy?=
 =?utf-8?B?aEE1VWRnNmVIa3Y1cjRyRWZkYkcvcEFTSWlwTXdKNy9UQk5FaTBQWWh2S1RN?=
 =?utf-8?B?Z0RReFZZbnB4d0NsMHFldHIvZnRia2ZvS2RLa0wza05paUloVGZzU1ZSU2dC?=
 =?utf-8?B?REd6cHFmS0lReHVLVUdRTS9XU0NnRXNqa01GRlZtNzNQSjBHSy9oUU4xai8y?=
 =?utf-8?B?ZjYxTk5sY1pQNWplc3k5Qmo3dm5oNmZockl0QmNZb2RCR3lSMlN3UmYvWHM1?=
 =?utf-8?B?Z2JXeG1FNytNZ0VZLzU5RlZqUUhzbjNSMjZzQURBWTZJWkhJK0lDQitsK0VI?=
 =?utf-8?B?UXNXalpGZ3NHY3pDajdyMEl0OWtMcThVMWdQc29HaVVvb25BQUpId2l6aEpx?=
 =?utf-8?B?VG5laWs2a0NKMXBQbHBoVis4dmJzLzZhUFFvc3MvRXUrZzZBMEpWWXR2QjYy?=
 =?utf-8?Q?mW32nz8rC7OYOjLe9Z14qHrLtonJVZK1z5RY1YDPu3Hh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d3c21a-58a8-4c57-05d2-08dbf0982188
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 05:00:39.1054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFAXvdH9olV7uyFtXN9IAKOFc1YKFboIVbY6GzsdHXz4T/2H0Di0x1KzVR54Q+NrOaZsWlGaJQX+vLZFgsK0g+HmIaeXcy88gc8vIYwrX5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5640
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNo
YWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJl
ciAyOCwgMjAyMyAxMDozMSBQTQ0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlh
eUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBWaXZpLCBS
b2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW0ludGVsLXhl
XSBbUEFUQ0ggVjMgMi8zXSBkcm0veGUvYXRzLW06IEV4cG9zZSB1aWQgZm9yIEFUUy1NIHZpYQ0K
PiBzeXNmcw0KPiANCj4gDQo+IA0KPiBPbiAyOC4xMS4yMDIzIDE2OjEzLCBUZWphcyBVcGFkaHlh
eSB3cm90ZToNCj4gPiBPbiBBVFMtTSBDU0MgZmlybXdhcmUgY2FsY3VsYXRlZCB1bmlxdWUgZGV2
aWNlIGlkKHVpZCkgY2FuIGJlIHJlYWQNCj4gPiBmcm9tIGRlZmluZWQgcmVnaXN0ZXJzLiBPbmx5
IEFUUy1NIGhhcyB0aGlzIHdheSBvZiByZWFkaW5nIHVpZC4gQWxzbw0KPiA+IEFUUy1NIGN1c3Rv
bWVyIHJlcXVpcmUgdGhpcyBzb2x1dGlvbiB0byBsb2NhdGUgYW5kIG5hbWUgdGhlaXIgZGV2aWNl
cw0KPiA+IGVmZmVjdGl2ZWx5Lg0KPiA+DQo+ID4gQ29uc3VtZXIgb2YgY3NjIHVpZCBpcyBsZXZl
bDAgc3lzbWFuIGFuZCBlbmQgdXNlcnMgdXNpbmcgc3lzbWFuLg0KPiANCj4gaXMgdGhpcyBnZW5l
cmljIFVJRCBvciBVSUQgb25seSBzcGVjaWZpYyB0byBDU0MgZmlybXdhcmUgPw0KPiBpZiBmb3Jt
ZXIgdGhlbiBtYXliZSBqdXN0IG5hbWUgaXQgYXMgInVpZCIgb3IgInV1aWQiID8NCj4gDQo+ID4N
Cj4gPiBUaGlzIHBhdGNoIGV4cG9ydHMgdWlkIHRvIHRoZSB1c2Vyc3BhY2UgdmlhIHN5c2ZzLg0K
PiANCj4gYXMgdGhpcyBkZWZpbmVzIHVhYmksIHNob3VsZG4ndCB0aGlzIHNlcmllcyBnbyBvdmVy
IGRyaS1kZXZlbCA/DQo+IA0KPiArIEBSb2RyaWdvDQo+IA0KPiA+IEZvciBleGFtcGxlLCB1aWQg
Y2FuIGJlIHJlYWQgYnk6DQo+ID4gY2F0IC9zeXMvY2xhc3MvZHJtL2NhcmRYL2RldmljZS9jc2Nf
dWlkDQo+IA0KPiBhcyB0aGlzIGlzIG1vcmUgWGUgZHJpdmVyIGV4dGVuc2lvbiB0aGVuIG1heWJl
DQo+IA0KPiAvc3lzL2J1cy9wY2kvZHJpdmVycy94ZS88QkRGPi91dWlkDQo+IA0KPiA+DQo+ID4g
VjIoTWljaGFsKToNCj4gPiAgIC0gTWFrZSBzZXBhcmF0ZSBwYXRjaCBmb3IgY3NjIHVpZCBjYXBh
YmlsaXR5DQo+ID4gICAtIFVzZSAlI2xseCBmb3IgMHgNCj4gPiAgIC0gRHVtcCBlcnJvciB2YWx1
ZSB3aGVuIHN5c2ZzIGNyZWF0aW9uIGZhaWxzDQo+ID4gICAtIEhhdmUgY29uc2lzdGVuY3kgaW4g
Y3NjIHVpZCBuYW1lDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVq
YXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
cmVncy94ZV9yZWdzLmggICAgfCAgMyArKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jICAgICAgIHwgMTEgKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZV9zeXNmcy5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrDQo+ID4gZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oIHwgIDIgKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2Vk
LCAzNyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3JlZ3MveGVfcmVncy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdz
LmgNCj4gPiBpbmRleCBlYzkzNzJhYTczOWYuLjM1OTljN2IzOGI2MSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUvcmVncy94ZV9yZWdzLmgNCj4gPiBAQCAtNzEsNiArNzEsOSBAQA0KPiA+ICAjZGVm
aW5lIFhFSFBfQ0xPQ0tfR0FURV9ESVMJCQlYRV9SRUcoMHgxMDEwMTQpDQo+ID4gICNkZWZpbmUg
ICBTR1NJX1NJREVDTEtfRElTCQkJUkVHX0JJVCgxNykNCj4gPg0KPiA+ICsjZGVmaW5lIERFVlVJ
RF9MV09SRAkJCQlYRV9SRUcoMHgxMDIwMDgpDQo+ID4gKyNkZWZpbmUgREVWVUlEX0hXT1JECQkJ
CVhFX1JFRygweDEwMjAwQykNCj4gDQo+IEJzcGVjIHVzZXMgZGlmZmVyZW50IG5hbWVzIC4uIGFu
ZCBMV09SRC9IV09SRCBsb29rIHN0cmFuZ2UgYnV0IHNpbmNlIGl0J3MNCj4gZm9yIFNXIHVzZSB0
aGVuIG1heWJlIGF0IGxlYXN0IChhc3N1bWluZyBBVFNNIGlzIFhFSFApOg0KPiANCj4gI2RlZmlu
ZSBYRUhQX0RFVlVJRF9MRFcJCQkJWEVfUkVHKDB4MTAyMDA4KQ0KPiAjZGVmaW5lIFhFSFBfREVW
VUlEX1VEVwkJCQlYRV9SRUcoMHgxMDIwMEMpDQo+IA0KPiA+ICsNCj4gPiAgI2RlZmluZSBHR0MJ
CQkJCVhFX1JFRygweDEwODA0MCkNCj4gPiAgI2RlZmluZSAgIEdNU19NQVNLCQkJCVJFR19HRU5N
QVNLKDE1LCA4KQ0KPiA+ICAjZGVmaW5lICAgR0dNU19NQVNLCQkJCVJFR19HRU5NQVNLKDcsIDYp
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGluZGV4IGQ2MDM3OWQ4NDRkMi4uYjU0NjM1
ZDUxMmQ2DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rldmlj
ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gQEAgLTM1
NSw2ICszNTUsMTUgQEAgc3RhdGljIHZvaWQgeGVfZGV2aWNlX3Nhbml0aXplKHN0cnVjdCBkcm1f
ZGV2aWNlDQo+ICpkcm0sIHZvaWQgKmFyZykNCj4gPiAgCQl4ZV9ndF9zYW5pdGl6ZShndCk7DQo+
ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgdm9pZCB4ZV9yZWFkX2NzY191aWQoc3RydWN0IHhlX2Rl
dmljZSAqeGUpIHsNCj4gPiArCWlmICh4ZS0+aW5mby5oYXNfY3NjX3VpZCkgew0KPiA+ICsJCXN0
cnVjdCB4ZV9ndCAqbW1pbyA9IHhlX3Jvb3RfbW1pb19ndCh4ZSk7DQo+ID4gKw0KPiA+ICsJCXhl
LT5pbmZvLmNzY191aWQgID0geGVfbW1pb19yZWFkNjRfMngzMihtbWlvLA0KPiBERVZVSURfTFdP
UkQpOw0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICBpbnQgeGVfZGV2aWNlX3Byb2JlKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlKSAgew0KPiA+ICAJc3RydWN0IHhlX3RpbGUgKnRpbGU7DQo+ID4g
QEAgLTM3OSw2ICszODgsOCBAQCBpbnQgeGVfZGV2aWNlX3Byb2JlKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlKQ0KPiA+ICAJaWYgKGVycikNCj4gPiAgCQlyZXR1cm4gZXJyOw0KPiA+DQo+ID4gKwl4ZV9y
ZWFkX2NzY191aWQoeGUpOw0KPiA+ICsNCj4gPiAgCWVyciA9IGRybW1fYWRkX2FjdGlvbl9vcl9y
ZXNldCgmeGUtPmRybSwgeGVfZHJpdmVyX2Zscl9maW5pLCB4ZSk7DQo+ID4gIAlpZiAoZXJyKQ0K
PiA+ICAJCXJldHVybiBlcnI7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2Vfc3lzZnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNm
cy5jDQo+ID4gaW5kZXggOTkxMTNhNWEyYjg0Li40ZmJmMDI3NWQzYmYgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNmcy5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNmcy5jDQo+ID4gQEAgLTY1LDExICs2NSwyNCBAQCB2
cmFtX2QzY29sZF90aHJlc2hvbGRfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+IHN0cnVj
dCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiA+DQo+ID4gIHN0YXRpYyBERVZJQ0VfQVRUUl9S
Vyh2cmFtX2QzY29sZF90aHJlc2hvbGQpOw0KPiA+DQo+ID4gK3N0YXRpYyBzc2l6ZV90IGNzY191
aWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gKwkJCSAgICBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwNCj4gPiArCQkJICAgIGNoYXIgKmJ1ZikNCj4gPiArew0KPiA+ICsJc3Ry
dWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7DQo+ID4gKwlzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSA9IHBkZXZfdG9feGVfZGV2aWNlKHBkZXYpOw0KPiA+ICsNCj4gPiArCXJldHVybiBz
eXNmc19lbWl0KGJ1ZiwgIiUjbGx4XG4iLCB4ZS0+aW5mby5jc2NfdWlkKTsNCj4gDQo+IGlmIHRo
ZXJlIGFyZSBubyBwbGFucyB0byB1c2UgdGhpcyB2YWx1ZSBpbiBkcml2ZXIgdGhlbiBtYXliZSBq
dXN0IHJlYWQgaXQgaGVyZSBhcw0KPiBpdCB3YXMgYWxyZWFkeSBzdWdnZXN0ZWQgYnkgTHVjYXMN
Cg0KV2h5IHRvIHdha2UgR1Qgb24gZXZlcnkgc3lzZnMgcmVhZCBhbmQgcmVhZCB0aG9zZSByZWdp
c3RlcnM/IERvZXMgbm90IGxvb2sgY29ycmVjdCBpbiBteSBQT1YuDQoNClRoYW5rcywNClRlamFz
DQo+IA0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8oY3NjX3VpZCk7
DQo+ID4gKw0KPiA+ICBzdGF0aWMgdm9pZCB4ZV9kZXZpY2Vfc3lzZnNfZmluaShzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLCB2b2lkICphcmcpDQo+ID4gew0KPiA+ICAJc3RydWN0IHhlX2RldmljZSAq
eGUgPSBhcmc7DQo+ID4NCj4gPiAgCXN5c2ZzX3JlbW92ZV9maWxlKCZ4ZS0+ZHJtLmRldi0+a29i
aiwNCj4gPiAmZGV2X2F0dHJfdnJhbV9kM2NvbGRfdGhyZXNob2xkLmF0dHIpOw0KPiA+ICsJc3lz
ZnNfcmVtb3ZlX2ZpbGUoJnhlLT5kcm0uZGV2LT5rb2JqLCAmZGV2X2F0dHJfY3NjX3VpZC5hdHRy
KTsNCj4gDQo+IGl0J3Mgc2FkIHRoYXQgd2UgZG9uJ3QgaGF2ZSBwcm9wZXIgZ3JvdXBzIGRlZmlu
ZXMgYW5kIG5lZWQgdG8gYWRkIGVhY2gNCj4gYXR0cmlidXRlIHNlcGFyYXRlbHkgKGJ1dCB0aGF0
J3Mgbm90IHlvdXIgZmF1bHQpDQo+IA0KPiA+ICB9DQo+ID4NCj4gPiAgdm9pZCB4ZV9kZXZpY2Vf
c3lzZnNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkgQEAgLTgzLDYgKzk2LDE0IEBADQo+ID4g
dm9pZCB4ZV9kZXZpY2Vfc3lzZnNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiAgCQly
ZXR1cm47DQo+ID4gIAl9DQo+ID4NCj4gPiArCWlmICh4ZS0+aW5mby5oYXNfY3NjX3VpZCkgew0K
PiA+ICsJCXJldCA9IHN5c2ZzX2NyZWF0ZV9maWxlKCZkZXYtPmtvYmosICZkZXZfYXR0cl9jc2Nf
dWlkLmF0dHIpOw0KPiA+ICsJCWlmIChyZXQpIHsNCj4gPiArCQkJZHJtX3dhcm4oJnhlLT5kcm0s
ICJVSUQgc3lzZnMgc2V0dXAgZmFpbGVkDQo+IGVycj0lcGVcbiIsIEVSUl9QVFIocmV0KSk7DQo+
ID4gKwkJCXJldHVybjsNCj4gDQo+IGlmIHlvdSBleGl0IGhlcmUsIHlvdSB3aWxsIGxlYWsgZGV2
X2F0dHJfdnJhbV9kM2NvbGRfdGhyZXNob2xkDQo+IA0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiAr
DQo+ID4gIAlyZXQgPSBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnhlLT5kcm0sIHhlX2Rldmlj
ZV9zeXNmc19maW5pLA0KPiB4ZSk7DQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCWRybV93YXJuKCZ4
ZS0+ZHJtLCAiRmFpbGVkIHRvIGFkZCBzeXNmcyBmaW5pIGRybSBhY3Rpb25cbiIpOw0KPiBkaWZm
DQo+ID4gLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+IGluZGV4IDI2OGE0MDYz
OWVjNS4uZTg4YjY0Y2IwZWNhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2VfdHlwZXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vf
dHlwZXMuaA0KPiA+IEBAIC0yMzksNiArMjM5LDggQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ID4g
IAkJdTggdm1fbWF4X2xldmVsOw0KPiA+ICAJCS8qKiBAdmFfYml0czogTWF4aW11bSBiaXRzIG9m
IGEgdmlydHVhbCBhZGRyZXNzICovDQo+ID4gIAkJdTggdmFfYml0czsNCj4gPiArCQkvKiogQGNz
Y191aWQ6IGRldmljZSB1aWQgY2FsY3VsYXRlZCBieSBDU0MgRlcsIHVzZWQgZm9yDQo+IGdlbmVy
YXRpbmcgdXVpZCAqLw0KPiA+ICsJCXU2NCBjc2NfdWlkOw0KPiA+DQo+ID4gIAkJLyoqIEBpc19k
Z2Z4OiBpcyBkaXNjcmV0ZSBkZXZpY2UgKi8NCj4gPiAgCQl1OCBpc19kZ2Z4OjE7DQo=
