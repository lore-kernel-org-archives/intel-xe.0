Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A894C48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 14:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB1B10E768;
	Mon, 26 Feb 2024 14:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMH16R29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905FD10E768
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 14:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708959469; x=1740495469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SYJrcdrMsjY7nOsk7sQFywQK2WDtQaoHrIYVuzD1Mu4=;
 b=JMH16R29DVPFRcn/o3/U0AT7kFpYldkRCraN4TKAIUU0IV9xQcAPGnaw
 0dNlr3zlHf4oNYr1l4qmcOP1+Mhm4V8j5tujgyEUd02I02vj4gHU7gxvF
 HzgnhSQjRzU04eJqSB4VYE+iWWGDNhSfV3AAjYkLnnqN7zoTGqGxvoFuX
 raGbU+9Ops0z3Fn2odnsirnujmSrLsF/qBgByE5hrJtTKBLdn8GQw9Gpf
 /3haJWUSXfm1s1XocfwJuf27n+12es91Q1EwFTRtatv1crw7Ps5tCF7zd
 bZkjjK2JG2UKBt0vxp9YVC65EoZcTXWCzYKfuruZEAzrr8SMgHS5uhp+j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3409908"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3409908"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 06:57:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7233535"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 06:57:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 06:57:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 06:57:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 06:57:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 06:57:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaTSqJUKB4oLEm72omy1JsGnL5KAW7s0jP6M5fQR8EtQwdB1GOPZfui+hs1auGrbO+HIc53QDCwLkSi5Asguens9RlRGEGvTinKb8c/ZAy7WhB/Sjw1NV7g+KbO5f1vJ28Qyt2f61sBx/PrKQHGJGzKFKSeeRpgY0HDDVMoSFNU9Yp1LnNDQWNC5HymjjWrpaJ/a5Eg7fAUr70AHxc3QCVWKnOdpiLgCjkMkxHvJXQ04aYHmnWooY5COfMzHK8mSEqsGVfHDEjpJ1BFDzKQlr87lNeCfwReHypuu0s7dHgT234tdC2vKQ4wqGYqoyROfenWTDaIso1IpWoYeJUtt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYJrcdrMsjY7nOsk7sQFywQK2WDtQaoHrIYVuzD1Mu4=;
 b=gz14qLnPSWeWvT3u+S/tNOORJjDgJp10qau2A3kEVaYkLlQ4/tmfjQTAk+7qx1tW6o8UhUSHwZcpED/idcO9ZsiEcFEArRHWImioofH1HB/UiYfd9U3RgUZMBiHxjXehRo1SUV91ul8Bn1GcZv+VC8SHyLqUKnEmb7gxY5Kg8Ex2ylKyzP9WVd4j2tN/wu3RL3x5PA3n1BLPuVTMoZbGwDKU6f3olOSyWxfBalzf2+y/cZe20zGO1qgJFzayfzAqtKJN1ihY7J9/06eP5Xwuw0jch9pAU1IPDbNQSyKyoKmFx5MhaRXd51EdhG+ajtN7wVZl4QUC5cKwdrixwfXE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 14:57:41 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%3]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 14:57:41 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/guc: Handle timing out of signaled jobs gracefully
Thread-Topic: [PATCH] drm/xe/guc: Handle timing out of signaled jobs gracefully
Thread-Index: AQHaZplw4jfEfxBVFEWjk/V/yhUakbEcuxQA
Date: Mon, 26 Feb 2024 14:57:41 +0000
Message-ID: <35cc6d5ef57b3f814ddd47672072cb21c6abf206.camel@intel.com>
References: <20240223204659.40750-1-matthew.brost@intel.com>
In-Reply-To: <20240223204659.40750-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB7065:EE_
x-ms-office365-filtering-correlation-id: d32b323b-9d19-48a2-1cae-08dc36db47f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I05KOpXV6/IlpoZIV/XjhEM4tgUTl5FSarpD7WAi4h3QI+bQb8Hx91huKWTJV3239ikms0n2XobwXNLCi8X9yrzA1k9BXEwafDBka2qBtjED3z5qJL99rq2oQJeXUtzMYuDWcdLgaVt+je9cKPDVfMEv8zLSdGSYBQfgxVQfn7qiNSBgIpZjsAN4t2yHws+Noz61AVXyArrblYLUBQqg2tZyYCYuh/X9qcXEYZN0YXlALEo1N73AikDGBc3DSfHVRhB6Ah73v1K2R1CeXVqhMHPQoH35X7gVee4wA0lncYlNeXXFJwGEXthJ5kyLeYnL5QZlbp2k/AQSR/cpUesQPVSm+SEuvm23UVDXlfXdClCUnkyyXsKdpm3zb0x1bHJlzVcjl8WBlC/V7Uhxn0i7FN3GM/mZQ5ULbgA+MS7s0Hzb6bCrlthFFNzy0kK5Dcww6XSvo0/dQUYVuv4QEomxgptaEm1ZmQPJonYV4sI/U2VEf+FtUfkmDuo+Dz3/UbeyXVlxizJK2f8sJGBcXWyoCPZSwY7Lb4P+GoedCw6RMWT0LsjQCZNCDNj4bYn+60XC4jMPpL7zZJGp0uyplfqss+Bh5owxFhWJ1oJ1CQ4Ho1RIrPx8+5tQ1mIkmeJfDpBkA8GwGXfirfoBFgPg2mlaKjV5DGd3Noxd3VqVFoaUeqqeTdWeN2s5PmxngitccPYZafkA+h7B4dBX4+g9XNkXyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjNOcUllRjJwMi9zS2tBdTI4NzJwNlRyWElOT3prYksyQlpqNXd4WFBubENm?=
 =?utf-8?B?ais2alc2aHAyTVFta2J5ZktxbWZjcEFZVzM3eExDQUk1cTN0N3pNNG5zK0Ev?=
 =?utf-8?B?ZmVxVXA5Z2lzWkhWRXE1c2lqTithSGtlbkFzSjVjc2V4d1czaFJvMjZBR1Q3?=
 =?utf-8?B?T0hDaUgrL3cvQ1JrVlpoamduajQ0emNkQ1pacmVzdDVsMnR6NUlkMlR2ejkv?=
 =?utf-8?B?Qm9OMVBhMno5aUtUUy9yaGtjVG16eFlqVE16Z2ZPYnZpd2JrVWNyOTI0TU84?=
 =?utf-8?B?TWd4dEVGNkZ1R2hITWRnRjc1N1VBUFBpdXdYVGRHcDhZOGFlVW41V09KTFo4?=
 =?utf-8?B?ZWVMMEdESVM1VnZTYmpJZkU1dzFtUE9KSXJ6eHNKVkNoaUNxNHJpdFk5UlVq?=
 =?utf-8?B?WUwzUTBJME9odmZtSGt6b2xsYlhyejJYMXY5K0txcmFxeWQ2bkVpeklKK0lw?=
 =?utf-8?B?SVV1WHFCbkxXTmp1bmlVRmtxVWUwY1RwWEc2b3lhK0NJQnZCdkZHVHJGSENT?=
 =?utf-8?B?TGdmUWZ0Tm4wMjZwcVBodlY5ZWpKTXYyajZZWVVlOVZDOVNNWWd4SXdOQStm?=
 =?utf-8?B?UG9Gek9zQnc3OWVmZE1NY1hDWDh1RUJ4ODNQWkt0MExzV2Z5L3V3WjhNcVhq?=
 =?utf-8?B?TStRZGZWZ0hlVGJlVGJSNGlIRTBRNDI2bzc4aGZ6WWREeFJZRmxZM0p6bUk1?=
 =?utf-8?B?L0V6WXNwc1RRQytON0llVDJNSU5GS1grM005VEdHQ29GWHFZd2x4VXhxSWVi?=
 =?utf-8?B?K3RmYjVxV2QrS0lIMjlsWjI1cEtSaEJLdW5KbkFsbGVidW1YWFZrNjVoMjNK?=
 =?utf-8?B?ZUUxV0dhYm1oQzZHL3BlTzF2VjlDMGZ1NURBSjVwcUZLNGlrMXdldDRRQU5X?=
 =?utf-8?B?cEhTTnpJOHdsMlpjSGJIbkFESnQ5Qmg1ZVNRNGcrQzZFZjRNd2t4ZWVoTnpz?=
 =?utf-8?B?VTQ2MWtnNFBQajVHRWlhdll2K0FnbE9zZ0RjV1pUTWZiL2FHeVU0WHlCWU9X?=
 =?utf-8?B?OC9MTVBzY0dUZmtnM1h2YXI4SmNhYXZoaUhrTk96ak90SHFDVURqOE9sUzlT?=
 =?utf-8?B?SWhmRThSNFltZ2ExcmRBOEUxQ0toQytZWW0zYmRCL244QTVWSWpJdUZ1MXAv?=
 =?utf-8?B?ZG1Gb0hUTWFPZWMzbVVDaDE2WURYZ2pVdFc2S2JuZHFZSUs5ZXVVL1E2SXdw?=
 =?utf-8?B?dlZYZTY4cE8ydmpNTDVzdDkvbWlqaWNKM1RqVWhKeGxOai9qcGdteXlQd2oy?=
 =?utf-8?B?b2M2UWt2Z09PK203UStvQ3lzc2d6Vzh5ZUQ3NWNVWGZqUjFwMWJWMHM2cVFn?=
 =?utf-8?B?cnhDdmJGMWhBUURpK2QxMFIyTGxHdW0rL041dG9Kc3Fqd3JMc0VGRzcyeTU5?=
 =?utf-8?B?WkZDZnpSemxoblhoRGhzQjRkc05GOGphQnBKNDVTMHRtdWZKMFFwZTg1OW5o?=
 =?utf-8?B?VmxOOE1Kdm1Xemx1aGhKWHAzNVRhNENwQkE4b1o3Vk8yNWk3OFdyenQ1Vk1X?=
 =?utf-8?B?dHhYRzRlSjhCU1c3dE9TTU5NRFFSSm14UnZTOEl5WEdBKzRMQ2ZYSE5sbE9U?=
 =?utf-8?B?TlkwbWdOL0hDUlU3eU5XaFFoRmh4QlBzUFNXSWdHWDVoQm0wYk1rTzljZkRl?=
 =?utf-8?B?Y2R3MHVUVXpNc2ZZd3A1TzJvRVowUWdJaFlFM2p3alliREJIbXVpME9janRF?=
 =?utf-8?B?QnZ0MklCMUdyRnhELzh2S2ZrUE1vRDZRQ0lCL3dSNnhyS3BEUm1qNWMxUEZl?=
 =?utf-8?B?MjNhNDk1NUJtT3lqVlpRSW1KdWo4a3ovZjRHZ1NsZDhlYUwvaE1zeGY2Sks3?=
 =?utf-8?B?V3dvb25JUy9tT2VKVHpHN3JLRk4wOUFEemtrZHVjRkhhN04zVERJVitESDEv?=
 =?utf-8?B?RWdBYVEzZTVlSlZkeXRQLzlnL0laZkllTXBlSElEWTZJbm55Zk1SUzQ3T1Ja?=
 =?utf-8?B?am1wZ2lHUkxHdytNT1d4dmppZ050RVBYNU9jSXR0NzBYN1h0djlBVldhQzRS?=
 =?utf-8?B?dkxLMEFST1A0VGZMQXBzcVNiUGUvaTdQck1nSXBBMnZkMHlBTHJaOG1RaFpw?=
 =?utf-8?B?K0Q2YmJKTGFMQXlpVWdkdDVnVGY4Tm5ZbWtZL2RVNmJpYm82anYxYmM1ZmNh?=
 =?utf-8?B?ZGx4aDhaTGhjbTR1RHllUU04eFpuNFQxaGJGc2orQitjRWhQRTFMNmtzT2o2?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <146CE15886247643A4380D67EFCE3664@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32b323b-9d19-48a2-1cae-08dc36db47f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 14:57:41.1955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWFIh1b3Wzv373ykifbaUV/eV0QM06OINo6OcRAp3HkiX7qcTdKfaWbjdHNo3gv5IbgvHn/ppSIHzBVbmSsYqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
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

T24gRnJpLCAyMDI0LTAyLTIzIGF0IDEyOjQ2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBUaW1pbmcgb3V0IG9mIHNpZ25hbGVkIGpvYnMgY2FuIGhhcHBlbiBkdXJpbmcgcmVndWxhciBv
cGVyYXRpb25zIChlLmcuDQo+IGFuIGV4ZWMgcXVldWUgY2xvc2VkIGltbWVkaWF0ZWx5IGFmdGVy
IGxhc3QgZmVuY2Ugc2lnbmFsZWQpLiBUaGUgVERSIGNhbg0KPiBwYXNzIHRoZSB3b3JrZXIgd2hp
Y2ggZnJlZSBqb2JzLiBSYXRoZXIgdGhhbiBydW5uaW5nIHRocm91Z2ggdGhlIFREUiBpZg0KPiBz
aWduYWxlZCBqb2IgaXMgZm91bmQsIHNpbXBseSBmcmVlIGl0IHdpdGhvdXQgYW55IGRlYnVnIG1l
c3NhZ2VzLg0KDQp0aGFuayB5b3UNCg0KVGVzdGVkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IDxqb3NlLnNvdXphQGludGVsLmNvbT4NClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7Zt
IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gUmVwb3J0ZWQtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBDbG9zZXM6IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzEyNzENCj4g
U2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyB8IDMyICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDEzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfc3VibWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+
IGluZGV4IGZmNzdiYzhkYTFiMi4uMjk3NDhlNDA1NTVmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfc3VibWl0LmMNCj4gQEAgLTkyOSwyMCArOTI5LDI2IEBAIGd1Y19leGVjX3F1ZXVlX3Rp
bWVkb3V0X2pvYihzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqZHJtX2pvYikNCj4gIAlpbnQgZXJyID0g
LUVUSU1FOw0KPiAgCWludCBpID0gMDsNCj4gIA0KPiAtCWlmICghdGVzdF9iaXQoRE1BX0ZFTkNF
X0ZMQUdfU0lHTkFMRURfQklULCAmam9iLT5mZW5jZS0+ZmxhZ3MpKSB7DQo+IC0JCWRybV9ub3Rp
Y2UoJnhlLT5kcm0sICJUaW1lZG91dCBqb2I6IHNlcW5vPSV1LCBndWNfaWQ9JWQsIGZsYWdzPTB4
JWx4IiwNCj4gLQkJCSAgIHhlX3NjaGVkX2pvYl9zZXFubyhqb2IpLCBxLT5ndWMtPmlkLCBxLT5m
bGFncyk7DQo+IC0JCXhlX2d0X1dBUk4ocS0+Z3QsIHEtPmZsYWdzICYgRVhFQ19RVUVVRV9GTEFH
X0tFUk5FTCwNCj4gLQkJCSAgICJLZXJuZWwtc3VibWl0dGVkIGpvYiB0aW1lZCBvdXRcbiIpOw0K
PiAtCQl4ZV9ndF9XQVJOKHEtPmd0LCBxLT5mbGFncyAmIEVYRUNfUVVFVUVfRkxBR19WTSAmJiAh
ZXhlY19xdWV1ZV9raWxsZWQocSksDQo+IC0JCQkgICAiVk0gam9iIHRpbWVkIG91dCBvbiBub24t
a2lsbGVkIGV4ZWNxdWV1ZVxuIik7DQo+IC0NCj4gLQkJc2ltcGxlX2Vycm9yX2NhcHR1cmUocSk7
DQo+IC0JCXhlX2RldmNvcmVkdW1wKGpvYik7DQo+IC0JfSBlbHNlIHsNCj4gLQkJZHJtX2RiZygm
eGUtPmRybSwgIlRpbWVkb3V0IHNpZ25hbGVkIGpvYjogc2Vxbm89JXUsIGd1Y19pZD0lZCwgZmxh
Z3M9MHglbHgiLA0KPiAtCQkJIHhlX3NjaGVkX2pvYl9zZXFubyhqb2IpLCBxLT5ndWMtPmlkLCBx
LT5mbGFncyk7DQo+ICsJLyoNCj4gKwkgKiBURFIgaGFzIGZpcmVkIGJlZm9yZSBmcmVlIGpvYiB3
b3JrZXIuIENvbW1vbiBpZiBleGVjIHF1ZXVlDQo+ICsJICogaW1tZWRpYXRlbHkgY2xvc2VkIGFm
dGVyIGxhc3QgZmVuY2Ugc2lnbmFsZWQuDQo+ICsJICovDQo+ICsJaWYgKHRlc3RfYml0KERNQV9G
RU5DRV9GTEFHX1NJR05BTEVEX0JJVCwgJmpvYi0+ZmVuY2UtPmZsYWdzKSkgew0KPiArCQlndWNf
ZXhlY19xdWV1ZV9mcmVlX2pvYihkcm1fam9iKTsNCj4gKw0KPiArCQlyZXR1cm4gRFJNX0dQVV9T
Q0hFRF9TVEFUX05PTUlOQUw7DQo+ICAJfQ0KPiArDQo+ICsJZHJtX25vdGljZSgmeGUtPmRybSwg
IlRpbWVkb3V0IGpvYjogc2Vxbm89JXUsIGd1Y19pZD0lZCwgZmxhZ3M9MHglbHgiLA0KPiArCQkg
ICB4ZV9zY2hlZF9qb2Jfc2Vxbm8oam9iKSwgcS0+Z3VjLT5pZCwgcS0+ZmxhZ3MpOw0KPiArCXhl
X2d0X1dBUk4ocS0+Z3QsIHEtPmZsYWdzICYgRVhFQ19RVUVVRV9GTEFHX0tFUk5FTCwNCj4gKwkJ
ICAgIktlcm5lbC1zdWJtaXR0ZWQgam9iIHRpbWVkIG91dFxuIik7DQo+ICsJeGVfZ3RfV0FSTihx
LT5ndCwgcS0+ZmxhZ3MgJiBFWEVDX1FVRVVFX0ZMQUdfVk0gJiYgIWV4ZWNfcXVldWVfa2lsbGVk
KHEpLA0KPiArCQkgICAiVk0gam9iIHRpbWVkIG91dCBvbiBub24ta2lsbGVkIGV4ZWNxdWV1ZVxu
Iik7DQo+ICsNCj4gKwlzaW1wbGVfZXJyb3JfY2FwdHVyZShxKTsNCj4gKwl4ZV9kZXZjb3JlZHVt
cChqb2IpOw0KPiArDQo+ICAJdHJhY2VfeGVfc2NoZWRfam9iX3RpbWVkb3V0KGpvYik7DQo+ICAN
Cj4gIAkvKiBLaWxsIHRoZSBydW5fam9iIGVudHJ5IHBvaW50ICovDQoNCg==
