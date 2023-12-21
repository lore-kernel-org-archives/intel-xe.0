Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37336C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 13:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA6110E345;
	Thu, 21 Dec 2023 13:46:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CB410E345
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703166392; x=1734702392;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vZweHnNeP7l3BveS6zICSKzz22VZp1Sxc7buyeUBW8Q=;
 b=ne8QR3G1afi6HVIpOeRyCFVkhPMv3qThdUTuYttzDRP1v/1amdOB8KNk
 +tG1e8cYyArLD3nOfhGkMZFDRWQdAeUqFD0LeA62J5PQEhF9FnskQVp3i
 6Rq0E0ikG/zSMOiYZDFSMAp1AvVZZ3hpImAdx27I6l94FXU/LqWSgE3/h
 RfxJiQImyhiFaKAWLkdwiaDbx38psplCz73eKW6Wb1VgjoYy08J/haOP1
 eDFZqITyf/SSMdrCqGELGBH3JMUk15tn7BxbNIuiKV8BRAHd1HG3fRY+T
 GjIvo9QRBvkSb2WP6DFcWb/C7x4Fb/jr5tbUjZWjDAwFPEHaeD0AQY9en Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="17530921"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="17530921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 05:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810972820"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="810972820"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 05:46:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 05:46:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 05:46:29 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 05:46:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbGw3sjNdjBSkeXNHMrkVgotvd2BNwp34Pc5XPI9IdOciHd2IHxw8sT/H5E+T+pRf5PreAYZGIVpYKbDxtUlxYJ6iGWb7YsSntw+BiJr4rkhUtoBryftf+m5nXJaSNy4OODDFQpKNcuIG7u3SgsSQK18R8k4cUh0+VEjha6XucnFKBsvZE4T1Oc4uTOyP2qn7qZHZKYS13UKu5GS2ooifN8XmtWahWrFtnBWzYad+nQodYJPo88k1mJ3LoHNrRl3urFwQ+U+yKchlNd9WhlBWNS4LwaqLEMAwcjMCV5/Bu8cuvEO+cBCOp/dFg/VZ0hPGRAlgH1ORYW0SwP/QjxYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZweHnNeP7l3BveS6zICSKzz22VZp1Sxc7buyeUBW8Q=;
 b=i8KLLIp72Z9iLGrP3+z1oWlBCXYwoTD5exfBDIbss62C5h4myPPNHxVxA6pN8R9YHLKguK5tkBhL3XPXt2YZ5z/1s9kCeikYZGCb0mX/PS+ekDnniO7p2lXbEyGQE9zIm96pT/fYJkgIKW1plV7hDsRhn1IZKOgMuSx3azNr2ZqBySTMyVlfC9s+qjJmQddYpBRWbkPI0uWVOEiluy8ceBGkBs92C0cCY5WYPnd8Od2qukKYCyTudUs098VDmQRE1QlhWaFMMiw8WQwO3dTbkCVqwXfgJjxtmeubaGWrd7KNM5QQPT2Am2u55RVsT/HJpkHeAYSurEi7ejgfi1Y8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 13:46:27 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 13:46:26 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/exec: move fence reservation
Thread-Topic: [PATCH 1/2] drm/xe/exec: move fence reservation
Thread-Index: AQHaLeyjL3aF0X9yqkma1hD+XezCd7CzzFMA
Date: Thu, 21 Dec 2023 13:46:26 +0000
Message-ID: <3d7d4005ca495306ea785cb196a2ebeac5f9c1f0.camel@intel.com>
References: <20231213174703.536989-3-matthew.auld@intel.com>
In-Reply-To: <20231213174703.536989-3-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6391:EE_
x-ms-office365-filtering-correlation-id: 4358b692-1f39-4dbe-c88f-08dc022b3a93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QjD8SFU04oTt9lQLZeCK5mrT5xO/fX5tLMEoW8lCXt4X4rEQoSt2uIXL+wkb9h5BVrQpciymUsDhw9V3owiTTOpOrxhJ1O+z4rOYUO3dgTGlRoJBWKEG+LI4wbC6DT6iJTYeQaaxbL9pdPL4KLWHK52wFfubspEfB+Qc1eSQbx3elS9p+hjKBpDMCQtDypTv/I7GtO3j8uUCGXwot08z5x3JakYOv4x8flfAW5/58gNHlWpKiGtrm4q2Phf8odDPYwY+t7iJ1cYObvWm34NdS4Dbukoc3VDFaun67P6zWfYr/7vz9auuDLn950JPCn6M48CSNOfEaF9J/Y8ozcB62piuGmC7wJlmTqMSKLjd9vbbs7UY4lgRvbYvjo9GysT+QbvmXatIzm1Z1lQlKgR9dIcnbrpwKZ0Pc6rEKJG7yggLpzIpHz8xCrjqOJfxfaodZx6bL/tIjj73KeYtWhvTs7AJT6X/Id1B9WOrn7WSI++98SFlG3cBzUdSpEA9lsiqt5zC5H/w7bzWyc6MecuJ1JxPUjOfP6FsQcs54VbZjhtxqrefWGZJ+Zd//XMUpOxk2J0otAjPcaSHiCoS+w84IQfYYAx4iWxgIEi4U47u6oA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(4001150100001)(6506007)(38100700002)(122000001)(82960400001)(2906002)(5660300002)(83380400001)(86362001)(8676002)(36756003)(26005)(2616005)(8936002)(41300700001)(6512007)(316002)(76116006)(66946007)(91956017)(110136005)(6636002)(66446008)(66476007)(66556008)(64756008)(6486002)(966005)(38070700009)(71200400001)(66574015)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmxCYmxya095eHU0amhBcVZUUGx0bUk4bnZJVkl4Znh6L0ZEM2I0TE5STmZj?=
 =?utf-8?B?dGZkZWlCVUVpNS9TYW1tNWF1QTlSZjFFTHUwK3BlRlpvVW9GL1NRcGxETWI4?=
 =?utf-8?B?OGY1NG1VU1I4V3lVUE93RGFzNUEwNVVnU2VjSW40T2FQTXpsb2RKQjVkMHln?=
 =?utf-8?B?c0ZzOHNJZGwwL1VwekQ3bGFMZk9GWUJiajFIZjlUVyt5WjJsOGJUTGtULzlj?=
 =?utf-8?B?Vlczd0hpa2hUcVhPRHMyUjE5U25rSVZ4Z3NZbnRCV29JS1I1bFdON0RQVVRl?=
 =?utf-8?B?RjVSNVBUMWhuMXNKaThnaml6aTA4SEJGM2VCYURyWExGalgycVZWL3RzejFC?=
 =?utf-8?B?SjRwWHJ3MFFidFdZYnBYdTNka094NEliOWpGTnRHV3ViMlZFTklkSEdPQXRa?=
 =?utf-8?B?bDhFVHpqSnRUK1dBUE1IZitZWnpaKzkwVVBwdWJSZ21yWm1MbG1DLzd0Zzli?=
 =?utf-8?B?UmJSK3BVRnpSSGF5WjZzQ05nU0M3SjVZTkg0bzZmenF3R0tiTERvRk9kOTlx?=
 =?utf-8?B?NENKcTdkZ2FpSHlkYTJacmhnVk1GTHBIWjI4SmdnVytiVUxrUUNiajZzcnZO?=
 =?utf-8?B?aEttWkxlZXl6Ulk0NTRHRlU1L2N4RjVCT1B2UTh0a0pXbnkxT0g5MWFiaks1?=
 =?utf-8?B?ZFhiSkV4MU9uVGpvbHhaelIzUTZDNFRNaVBwSVlFQlRaYnF5N25URGhWTFhE?=
 =?utf-8?B?MHhRZzJCSFhaU2ZzSmpmWXBnY3JuUnloTjl4SWRVOWtpdUQwQjBDNVk2WjRY?=
 =?utf-8?B?bWMwOHl3SlViZS9RdUUwVVFNa2daNm5NaXYyYVQ1VmxOWUxYaXVYRHhHVUZ2?=
 =?utf-8?B?Mm5yNVJhdWUxYndTbVQxb0wvZUhIc1Ftak52TEhVZzluc1RNSlNrV0gxQjQx?=
 =?utf-8?B?OXRtbk9ZMkJiU1lXTWpBaXZNY1A3NDhWNlVIa3ZLSXYyQVBWNVJtWHFWQ1k0?=
 =?utf-8?B?dGoyNUNXazJwKzVaTkVkMENGNTFFbWNYeThpS3lLczZTYUY1ZzgxeUQrR0JK?=
 =?utf-8?B?bXhUbjBzSDdsQ1NDb3I4aG5naFdZbUEwY01mUi9RWVRxMVF6eWNhakRaNWZu?=
 =?utf-8?B?WERQUUNrVWc4eTZrUG9oTkhmelBVcDdHcSs2dDJrUDhxem5iQlFpS1BDa1Fn?=
 =?utf-8?B?Yndlek5GMWd3U05SRXZLRGpEM1lVaXVQTTdJK0pxeHB3cnpLczNidUtaRXZj?=
 =?utf-8?B?TFBsQSs1TFdSdUdpdHZ1Sk9sNGREUTdRMFpkeDNMNlk0cG5GVUo3eHJxOHA5?=
 =?utf-8?B?OEV2dUJORFZJRGFZWVg1NkhJVFZuUzIyK3E1NUs5YS9rY21mVWJqaFNmemJ1?=
 =?utf-8?B?bHN5YmtkUTlxaThvK2J4QU95bG1NVEowTFZLVHFvY3N3ZG45cXdoZmRwd091?=
 =?utf-8?B?WitMNVhPSjlHaUNFQ1JJQy83L1lnZnR0aUorbXVVSlZDcUQwNHNWcWJHTFdy?=
 =?utf-8?B?OFpLMkpIVndKWm54V3pFZUwyWWdpKzlyQTFVQTNqR0dPS08rZXNON1NNakNl?=
 =?utf-8?B?a2VwV1pMM2FrWk5FVkl4dUdtZE9NZHdwYlNKT0hqMXRjQTcyOXVpcmJkcU12?=
 =?utf-8?B?ZW9LNVdpNStTTnU3VlYzdjdMU3NOM2pnY25meE9sb0Rxd1F5V3VBdTRlSHdR?=
 =?utf-8?B?N1FrMlIrVFgxeVdUZTNIRFZJWGpNWk9ISmtpWk9LKzBTRHNKV0x4eDJySktK?=
 =?utf-8?B?aWpiVmFNemttN0tGZW1GVWIybWY4UkVVQW01QnI2VWUrVytQeWNMaTdUWU00?=
 =?utf-8?B?VjNka1NnL3FpeEhyQkRoR0JUQWNqVW9jUm1JczN6L0Z3Z3pnaHRzVHF3MEtT?=
 =?utf-8?B?VFBjNlJjS3dDbHo2cVlEMm9yek5wNnZyWXZWOWkwKzJjUi9Xd2RkTW1Xa09j?=
 =?utf-8?B?d3J1cjBQdlFjV1ZyZW1QVm1pOTVhejhuYkNia0xWbWZLTEpiTFQ2Y1FWZEh1?=
 =?utf-8?B?TlY2cTUzWnNPcUg5QnlGd05EZEpZSXlHbnhtOHNZS1pEeTRSbFJPSDNqMkFp?=
 =?utf-8?B?WDBoVnk0am1SSE96cHEycGFKd3ZBVFY2bU9xQkp2L1RsNXRCL3UvdDJVa3NF?=
 =?utf-8?B?SWFMS2NTM3hMQ2sxN05BeUl6NkNjdW8xRy9DVGhTN3pjM0hWTnc1MXJTV1Zv?=
 =?utf-8?B?VFN0ek5ZV2VOTDhVenZuSlhQUitCbkpEUlUyL0RTZmlBaXd4eXRrNzRta2dF?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA3CE04D9A106F47B167546351FCEBD3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4358b692-1f39-4dbe-c88f-08dc022b3a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 13:46:26.9175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2RoUALJOhOm6V7DBOVGH3JlsaomIjrkGuzy2+3+zpXFnMNwv71I/oG2doevbwgE4FhqCVPln0Rt/aLxlR+hamQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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

T24gV2VkLCAyMDIzLTEyLTEzIGF0IDE3OjQ3ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFdlIGN1cnJlbnRseSBhc3N1bWUgdGhhdCB3ZSBjYW4gdXBmcm9udCBrbm93IGV4YWN0bHkgaG93
IG1hbnkgZmVuY2UNCj4gc2xvdHMgd2Ugd2lsbCBuZWVkIGF0IHRoZSBzdGFydCBvZiB0aGUgZXhl
YywgaG93ZXZlciB0aGUgVFRNIGJvX3ZhbGlkYXRlDQo+IGNhbiBpdHNlbGYgY29uc3VtZSBudW1l
cm91cyBmZW5jZSBzbG90cywgYW5kIGR1ZSB0byBob3cgdGhlDQo+IGRtYV9yZXN2X3Jlc2VydmVf
ZmVuY2VzKCkgd29ya3MgaXQgb25seSBlbnN1cmVzIHRoYXQgYXQgbGVhc3QgdGhhdCBtYW55DQo+
IGZlbmNlIHNsb3RzIGFyZSBhdmFpbGFibGUuIFdpdGggdGhpcyBpdCBpcyBxdWl0ZSBwb3NzaWJs
ZSB0aGF0IFRUTQ0KPiBzdGVhbHMgc29tZSBvZiB0aGUgZmVuY2Ugc2xvdHMgYW5kIHRoZW4gd2hl
biBpdCBjb21lcyB0aW1lIHRvIGRvIHRoZSB2bWENCj4gYmluZGluZyBhbmQgZmluYWwgZXhlYyBz
dGFnZSB3ZSBhcmUgbGFja2luZyBlbm91Z2ggZmVuY2Ugc2xvdHMsIGxlYWRpbmcNCj4gdG8gc29t
ZSBuYXN0eSBCVUdfT04oKS4gQSBzaW1wbGUgZml4IGlzIHRvIHJlc2VydmUgb3VyIG93biBmZW5j
ZXMgbGF0ZXIsDQo+IGFmdGVyIHRoZSB2YWxpZGF0ZSBzdGFnZS4NCg0KUmV2aWV3ZWQtYnk6IEpv
c8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBSZWZl
cmVuY2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lz
c3Vlcy82OTgNCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50
ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXgu
aW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYyB8IDQwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2V4ZWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMNCj4gaW5kZXggYmE5
MmU1NjE5ZGEzLi42M2U4MmU1Mjg1YmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9leGVjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0KPiBAQCAt
OTYsNyArOTYsNDQgQEANCj4gIA0KPiAgc3RhdGljIGludCB4ZV9leGVjX2ZuKHN0cnVjdCBkcm1f
Z3B1dm1fZXhlYyAqdm1fZXhlYykNCj4gIHsNCj4gLQlyZXR1cm4gZHJtX2dwdXZtX3ZhbGlkYXRl
KHZtX2V4ZWMtPnZtLCAmdm1fZXhlYy0+ZXhlYyk7DQo+ICsJc3RydWN0IHhlX3ZtICp2bSA9IGNv
bnRhaW5lcl9vZih2bV9leGVjLT52bSwgc3RydWN0IHhlX3ZtLCBncHV2bSk7DQo+ICsJc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmo7DQo+ICsJdW5zaWduZWQgbG9uZyBpbmRleDsNCj4gKwlpbnQg
bnVtX2ZlbmNlczsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0ID0gZHJtX2dwdXZtX3ZhbGlk
YXRlKHZtX2V4ZWMtPnZtLCAmdm1fZXhlYy0+ZXhlYyk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0
dXJuIHJldDsNCj4gKw0KPiArCS8qDQo+ICsJICogMSBmZW5jZSBzbG90IGZvciB0aGUgZmluYWwg
c3VibWl0LCBhbmQgb25lIG1vcmUgZm9yIGV2ZXJ5IHBlci10aWxlDQo+ICsJICogYmluZC4gTm90
ZSB0aGF0IHRoZXJlIGFyZSBwb3RlbnRpYWxseSBtYW55IHZtYSBwZXIgb2JqZWN0L2RtYS1yZXN2
LA0KPiArCSAqIGhvd2V2ZXIgdGhlIGZlbmNlIHNsb3Qgd2lsbCBqdXN0IGJlIHJlLXVzZWQsIHNp
bmNlIHRoZXkgYXJlIGxhcmdlbHkNCj4gKwkgKiB0aGUgc2FtZSB0aW1lbGluZSBhbmQgdGhlIHNl
cW5vIHNob3VsZCBiZSBpbiBvcmRlci4NCj4gKwkgKi8NCj4gKwludW1fZmVuY2VzID0gMSArIHZt
LT54ZS0+aW5mby50aWxlX2NvdW50Ow0KPiArDQo+ICsJLyoNCj4gKwkgKiBXZSBkb24ndCBrbm93
IHVwZnJvbnQgZXhhY3RseSBob3cgbWFueSBmZW5jZSBzbG90cyB3ZSB3aWxsIG5lZWQgYXQNCj4g
KwkgKiB0aGUgc3RhcnQgb2YgdGhlIGV4ZWMsIHNpbmNlIHRoZSBUVE0gYm9fdmFsaWRhdGUgYWJv
dmUgY2FuIGNvbnN1bWUNCj4gKwkgKiBudW1lcm91cyBmZW5jZSBzbG90cy4gQWxzbyBkdWUgdG8g
aG93IHRoZSBkbWFfcmVzdl9yZXNlcnZlX2ZlbmNlcygpDQo+ICsJICogd29ya3MgaXQgb25seSBl
bnN1cmVzIHRoYXQgYXQgbGVhc3QgdGhhdCBtYW55IGZlbmNlIHNsb3RzIGFyZQ0KPiArCSAqIGF2
YWlsYWJsZSBpLmUgaWYgdGhlcmUgYXJlIGFscmVhZHkgMTAgc2xvdHMgYXZhaWxhYmxlIGFuZCB3
ZSByZXNlcnZlDQo+ICsJICogdHdvIG1vcmUsIGl0IGNhbiBqdXN0IG5vb3Agd2l0aG91dCByZXNl
cnZpbmcgYW55dGhpbmcuICBXaXRoIHRoaXMgaXQNCj4gKwkgKiBpcyBxdWl0ZSBwb3NzaWJsZSB0
aGF0IFRUTSBzdGVhbHMgc29tZSBvZiB0aGUgZmVuY2Ugc2xvdHMgYW5kIHRoZW4NCj4gKwkgKiB3
aGVuIGl0IGNvbWVzIHRpbWUgdG8gZG8gdGhlIHZtYSBiaW5kaW5nIGFuZCBmaW5hbCBleGVjIHN0
YWdlIHdlIGFyZQ0KPiArCSAqIGxhY2tpbmcgZW5vdWdoIGZlbmNlIHNsb3RzLCBsZWFkaW5nIHRv
IHNvbWUgbmFzdHkgQlVHX09OKCkgd2hlbg0KPiArCSAqIGFkZGluZyB0aGUgZmVuY2VzLiBIZW5j
ZSBqdXN0IGFkZCBvdXIgb3duIGZlbmNlcyBoZXJlLCBhZnRlciB0aGUNCj4gKwkgKiB2YWxpZGF0
ZSBzdGFnZS4NCj4gKwkgKi8NCj4gKwlkcm1fZXhlY19mb3JfZWFjaF9sb2NrZWRfb2JqZWN0KCZ2
bV9leGVjLT5leGVjLCBpbmRleCwgb2JqKSB7DQo+ICsJCXJldCA9IGRtYV9yZXN2X3Jlc2VydmVf
ZmVuY2VzKG9iai0+cmVzdiwgbnVtX2ZlbmNlcyk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1
cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICBpbnQgeGVf
ZXhlY19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGUpDQo+IEBAIC0xODksNyArMjI2LDYgQEAgaW50IHhlX2V4ZWNfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQ0K
PiAgCX0NCj4gIA0KPiAgCXZtX2V4ZWMudm0gPSAmdm0tPmdwdXZtOw0KPiAtCXZtX2V4ZWMubnVt
X2ZlbmNlcyA9IDEgKyB2bS0+eGUtPmluZm8udGlsZV9jb3VudDsNCj4gIAl2bV9leGVjLmZsYWdz
ID0gRFJNX0VYRUNfSU5URVJSVVBUSUJMRV9XQUlUOw0KPiAgCWlmICh4ZV92bV9pbl9scl9tb2Rl
KHZtKSkgew0KPiAgCQlkcm1fZXhlY19pbml0KGV4ZWMsIHZtX2V4ZWMuZmxhZ3MpOw0KDQo=
