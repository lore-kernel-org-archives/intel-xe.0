Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7D3C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBBF8911F;
	Thu,  9 Nov 2023 15:37:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4363C10E8D3
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544256; x=1731080256;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=puCa63fo3U3ZdapaPAkphkRfC+ti1U8A/NIagqxfdvw=;
 b=efDRw2UJsGSB6DFRj3V3+aYmLP+hCs21up4P6wgFBK+TZpGQFgX6jBbt
 CeAmcg2OAOk8Fx+Y2RxExZi3RY/Ev9RkAp31APkrtSQjDwwLM3a/FUI7d
 UlWhcKtl/SkopE8JNcmsiTCHjX0KI2FCfsBz4ICoM2GDr4CUd81IhWhKL
 YzxTOfxnXSzRqKdSxibuJBdhLDo14ZuO/2mLJ/nwiqFUudFZsyOjX12SS
 +FZuE39TJIvcHCcNZ16Y3ZQTC/4HQW8nf7PIjkIjOM+nuifveAuEWYmfU
 HcYZeAsJfVBB+NBM86e2vsLb5FkdFhenBBY5yMRlDf9aWej88htycPUJQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="476235795"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="476235795"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792579772"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="792579772"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 07:37:35 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 07:37:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 07:37:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 07:37:34 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 07:37:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXAJmfUltJ/u4OdMNJ2MuDi+5/GVHDYrHlzC+q2hdBxSXB8lgXtCv89fpZgC5hq1qG8j3iRy8QvkI4z9uObPc60XNNJHQW5A2l/OcrhisSMxEHtqPIzG2GF4X+m8X/3QMipS4m82FZJGn2KA9hePJ4z76vJD1tqRK27P9H3ZvK8bIy10CX39A4MCXic2VIFgAu737nQGoyY/WW/3W+rKb3sJ8DZ2XyVBcKW0c6ZAOYh6955p2R5EPhdKmMJr+cYZhYEzZ4V1fqamdCoznIVWxhQcxjFErtCDf1F/om/aG8sddvc1CVqtcfGqG6jvhaDoa3zhawc4Bhvfj1GYmF8/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puCa63fo3U3ZdapaPAkphkRfC+ti1U8A/NIagqxfdvw=;
 b=cC8WZg8OCCQYPM4GrbQmKyDbJJ5gJKKLBzUKR+jCkJn8fqbpF9qrCvKH4D/kE67XcX/CK18lpu0wRgXyQg9kPtPHQ9KqBZr6CRL8rH8WsCYFvJ5uPH61NrRz0XrAjfDtSH1vFFkHFDOFCkHw50/wFMPyKdaCJm2+0B/G7ayWtFUfdHYgmmbJEe7abWP3xzC9T3pJh//akCCNzDS64xDRS5llOl5YfU5I3sKjxDTU2v17Srso96gZR0XdZ3tUhXnuweoKF9sUBXrQopI/8wnMfKoZ9B2DORYw6IUQdsANbxeVdauv5KPXbLp/RBBZFAJh75P7SUFCDED9Snd86+QLHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BL1PR11MB5303.namprd11.prod.outlook.com (2603:10b6:208:31b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 15:37:31 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 15:37:31 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 04/50] drm/xe: Add uAPI to query micro-controler
 firmware version
Thread-Index: AQHaDmMDEWxoFuTMsECKFHOtVp0x1LByKIQA
Date: Thu, 9 Nov 2023 15:37:31 +0000
Message-ID: <365bbbeb0e05ce0bebfa9b90e3ab44fe5b807459.camel@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-5-francois.dugast@intel.com>
In-Reply-To: <20231103143456.7-5-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BL1PR11MB5303:EE_
x-ms-office365-filtering-correlation-id: ce893590-c180-4e7c-7c8b-08dbe139c96e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kLV783nkL3o0Ywn7JqHLBGagvVUzboAMbYZqb2z4MIqGnS6JZJ2cZYWJ0/HnILdDM1KphiRgLRedC8+3Ap51DAj3B2jtqqN30fuUWUxuqU8jJCLUJEZo9qDurcLsXXEZ4/W6QH78DFbWUb3qZUnAlPUSUnUx+JWrQ/bR/43a1RhHW23JCf+bwDXOF0OCeutpQVnH1dj4yXoCm4j5zwUX36ymNIbWu5EffcseuGTvEZ8nFbSUSn7l+KRa/nUkojeIQ5nA8JbwhWwR7tLOmThNi/WKNPdf8rHXNAZp4+dAU3E3Tww+M5OgVV5205m3ZWBMnst9DRlmB9pPDnxU22PVZpd2fwLRc1alf5AJ+lL3X7NQRYatssfG4Zjg2euirR4kbSH1KeyNunXM2MQDSfba41Fe+Qp0FBnL+GUF2z0QtXjvvD44TkrTBsi+/FsY3DheS/o7XH/HJxrEETHBHFN6IJuBEkj2hyxlfFwrQ/o9G9XgT8DwNThwurlvN72jZmYzSRZUBsHEenWWZXAeW8clv4C8DtrYYp1wnHjA9rTBi22szfdVlIj1xITawldsjUQ0ivFJbPQ4RXffsArUjsVbh0oxOrCcQbtbxkiOwJU8JDnVJncnhmPLzI3y/0KhFbv/NIO7HdQFyHxZINLeHDCVkA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(83380400001)(8676002)(5660300002)(122000001)(82960400001)(6512007)(2616005)(38100700002)(8936002)(6486002)(966005)(2906002)(86362001)(38070700009)(478600001)(6506007)(71200400001)(66446008)(36756003)(64756008)(6636002)(66946007)(66556008)(66476007)(26005)(76116006)(110136005)(41300700001)(316002)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3VaTkpMSWdYekdZZG1vUW45N0NMK2w1OXVTaEc5L2J6V3dBNitUWkY0QzlV?=
 =?utf-8?B?VTJFQ0JnY0dqYUNvZXdDTVB6dTg0YkNzVHozNlh5bmI3TWpuK1ViTEFRMGpI?=
 =?utf-8?B?NUEvWmlqYUNFQ0FoYVIvUERIOTFWSnd6Z0l1UHZTSkdOanZhbU5ZbnBWempu?=
 =?utf-8?B?VE1kbk9MK3NrS1ByamJONVpNWW1PUjM4TnppTmUwZ2FmbVR0S3NuMW9taDAr?=
 =?utf-8?B?d3ZoaVNnR3piSitvemhka1dlcjJjdlNYS0IzSlFqaFNlVmtNVmFWeEMrdG04?=
 =?utf-8?B?czhjUVNvSnBLRFBWa0Rsa0FBVWkyMHp2M2ZIV0hKYnhBVEJoSGlEbjJsbG9X?=
 =?utf-8?B?R0k5SlEyK2pOcktYdjg1NW1jbHB2SjNyY1dxTGx0L2JjQ3ZjbmNxbTY3Vlpv?=
 =?utf-8?B?NTRWdnM2b2FMeExPTEJJbkIwRXVtT0gzNlI2ZFVIcmZjL1BXcDZ3SjdQc0ZK?=
 =?utf-8?B?MXllS1grWWZ2aDFzQW1kb1ZVMjE1bW9uWnRoMHlmOWFaT3FickJMUllrTEd4?=
 =?utf-8?B?a0IrRVRWSHZVbXdMVW1tTTVha3IzV29IN0ZuTXpWMjZGdURuS2hsWW9kY2dT?=
 =?utf-8?B?eGloUHFzWlBrWXVPbTZqb1hsZEpsZ2lmSW4rYXRYVkN1REZMcW0wUEk0bkZQ?=
 =?utf-8?B?dnFHYzdWbXAvSFVCc1gvRGRKRGhyRWNrMXQ1VHpkWFJSM25UK0hIeWkrYmIz?=
 =?utf-8?B?QThJemZSVUFKN202VDRtVHRvS2paWDVlVkhOYkZRR3lHS0dyaTd0RFhCTkZa?=
 =?utf-8?B?ZlNZL0JNWWxXaVdqb2MrK0hjdThhdndLckVMM1d1SGlWSDIzTkd3VGtWS3kx?=
 =?utf-8?B?ZnJ4N3VlVVlLalZIaHlDcFNzRk5GaGdXb3FZbVJrbjE0bjM1eHZqeEMwL2VP?=
 =?utf-8?B?YkVtVVp5V0k4dEEyS2NCcE1YY3FmUnErT3dZQmZ4OEpqa3VuUldRRVhZZkNK?=
 =?utf-8?B?TE9aNEFubElJQ1dvSjRkb2FGWjQ5UWVwS3h1UzNCWWxYUFJJTVdzRVVUVmtU?=
 =?utf-8?B?NlFSRlN4cjJsNTFQOFNlZmdTdDJUZEhRVk5uS0lOVm1PbkwzZklidmFlMnNY?=
 =?utf-8?B?LytncUhkTWp2OEorNzRuMVFCTVd2bXNHNHp3TlExVXlDWUpRUHNkc1lmZWRL?=
 =?utf-8?B?Ukg5WTQ0NVM4QkdHcVpQZzlhTThYeDdQWVNwVUsrRGJSMkZGdDZMWWRVYytx?=
 =?utf-8?B?TDg4dXBMcmJ4Y1lOa3VET2x3UHVDWTBkQXQ1b3pLMGtTNEc0WTZ3bEY1Y0lI?=
 =?utf-8?B?U2VzVGN6VFdCR0dRMmFCN2RLdWJVbGd3VVM2dTg5UWdKNWQxS3BqQjJTeEkw?=
 =?utf-8?B?VTM1V3hHd2E2OUx1RUtwVHhMaTNXNm44L2lLM0huQmJJUHAreWcyRHRkd0Rk?=
 =?utf-8?B?NEFQbnA5cnUxdzQwdDFZZmRKc3BHTm8rRnpSc2pXRloyYlQrN2thbHpETmhX?=
 =?utf-8?B?dng4Uk9tQnVabDVjRjZqTzRmZTV5Mm94QlV4VmxXUGI0YzBvWW9NMWhZL09p?=
 =?utf-8?B?a0hmWVRuekFzQW11cXlQdW9rRVpVY0pQR25JT1pLMndQTmJzQzNjcGszeDd5?=
 =?utf-8?B?V2w3QTdCTUM3MTg4NlUzMkVXSVdLVUlUbFVRN1dlTUJTKzZpaUFySlY3ZUdZ?=
 =?utf-8?B?bjRDMUpVNmMxaVZMOWNHZkg5K01sMkhkUndPYUtUREo3ekpYVG9yNnVTYXZ0?=
 =?utf-8?B?cXd0QmZ1empocXhobWg2UzRJbFFoVi9vTGs0dnlaQSt1TnRLOFlYUkswQ0Q4?=
 =?utf-8?B?ODV5NWpPM1A2WldYZGJWMStySFY5SVoxLzUvaVdzR21tYzc1SENaUDdZdFRy?=
 =?utf-8?B?MTNMZjVaaE53OGttVWtKVkQ4TmZmc2FEVjVZVi8xTHBoMFpZcG9pakYxcnJY?=
 =?utf-8?B?SW11NnRrSXluOGFyYWlrU3dUTFNzUTJQUVd1RXAzekRlMEt3MWp1K3lTdi9o?=
 =?utf-8?B?ZTJaWmNrR21FNlBGa3ZwcVZwa1FpbTl4MVZETi9WWGRrN1lzNW43eWRpOWJv?=
 =?utf-8?B?cUd6Vy9NOTFvOU9TK04xMXZvcGN1TVIwREd5OHNTNVUyUEtqdzBaWHlMN3ph?=
 =?utf-8?B?bzhVbXExMTkwT0s4T0d4TFFISi9jVGxRV0xPNHJ0WTdsdmtTTzlOd1dKbzlE?=
 =?utf-8?B?SEg4RklKSkozbkc5SzVQK3R0ZnBDTlgvS2VWU2dORCtaTlY3Mko4WGs4WEZN?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9937B78631E4C46A3D948A3102070DD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce893590-c180-4e7c-7c8b-08dbe139c96e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 15:37:31.1786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ahmIxaSXRhIFUjtLf44rh2GIuEFEdgs+hMByaXe9KcVPIvoTrisspCr+EGd1hZDEkegIMDDFxiWUKcxwvLcIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5303
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 04/50] drm/xe: Add uAPI to query
 micro-controler firmware version
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

T24gRnJpLCAyMDIzLTExLTAzIGF0IDE0OjM0ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0K
PiANCj4gRHVlIHRvIGEgYnVnIGluIEd1QyBmaXJtd2FyZSwgTWVzYSBjYW4ndCBlbmFibGUgYnkg
ZGVmYXVsdCB0aGUgdXNhZ2Ugb2YNCj4gY29tcHV0ZSBlbmdpbmVzIGluIERHMiBhbmQgbmV3ZXIu
DQo+IA0KPiBBIG5ldyBHdUMgZmlybXdhcmUgZml4ZWQgdGhlIGlzc3VlIGJ1dCB1bnRpbCBub3cg
dGhlcmUgd2FzIG5vIHdheQ0KPiBmb3IgTWVzYSB0byBrbm93IGlmIEtNRCB3YXMgcnVubmluZyB3
aXRoIHRoZSBmaXhlZCBHdUMgdmVyc2lvbiBvciBub3QsDQo+IHNvIHRoaXMgdUFQSSBpcyByZXF1
aXJlZC4NCj4gDQo+IEl0IG1heSBiZSBleHBhbmRlZCBpbiBmdXR1cmUgdG8gcXVlcnkgb3RoZXIg
ZmlybXdhcmUgdmVyc2lvbnMgdG9vLg0KPiANCj4gTW9yZSBpbmZvcm1hdGlvbjogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzIzNjYxDQo+
IE1lc2EgdXNhZ2U6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9t
ZXJnZV9yZXF1ZXN0cy8yNTIzMw0KPiANCj4gdjI6DQo+IC0gY2hhbmdlZCB0byBzdWJtaXNzaW9u
IHZlcnNpb24NCj4gLSBhZGRlZCBicmFuY2ggdmVyc2lvbiB0byBiZSBmdXR1cmUgcHJvb2YNCj4g
LSBjaGVja2luZyBpZiBwYWRzIGFuZCByZXNlcnZlZCBhcmUgemVybw0KPiANCj4gdjM6DQo+IC0g
YWRkIGJyYWNlcyBhcm91bmQgY2FzZSBYRV9RVUVSWV9VQ19UWVBFX0dVQyB0byBtYWtlIENJIGhh
cHB5DQo+IA0KPiB2NDoNCj4gLSBzcXVhc2hlZCBjb21taXRzDQo+IC0gbWFrZSBpdCB2ZXJ5IGNs
ZWFyIGFuZCBkb2N1bWVudGVkIHRoYXQgaXQgaXMgYWJvdXQgdGhlIHN1Ym1pc3Npb24NCj4gICB2
ZXJzaW9uLCBhbmQgYWxzbyB3aGF0IHRoYXQgYWN0dWFsbHkgbWVhbnMuDQo+IA0KPiBDYzogSm9o
biBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgNDEgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDQzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDg0
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDEwYjk4Nzhl
Yzk1YS4uMDYzZjliZjA3MWEzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtNDk4
LDYgKzQ5OCw0NiBAQCBzdGF0aWMgaW50IHF1ZXJ5X2d0X3RvcG9sb2d5KHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlLA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgaW50DQo+ICtxdWVy
eV91Y19md192ZXJzaW9uKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3hlX2Rldmlj
ZV9xdWVyeSAqcXVlcnkpDQo+ICt7DQo+ICsJc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJz
aW9uIF9fdXNlciAqcXVlcnlfcHRyID0gdTY0X3RvX3VzZXJfcHRyKHF1ZXJ5LT5kYXRhKTsNCj4g
KwlzaXplX3Qgc2l6ZSA9IHNpemVvZihzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3VjX2Z3X3ZlcnNpb24p
Ow0KPiArCXN0cnVjdCBkcm1feGVfcXVlcnlfdWNfZndfdmVyc2lvbiByZXNwOw0KPiArDQo+ICsJ
aWYgKHF1ZXJ5LT5zaXplID09IDApIHsNCj4gKwkJcXVlcnktPnNpemUgPSBzaXplOw0KPiArCQly
ZXR1cm4gMDsNCj4gKwl9IGVsc2UgaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgcXVlcnktPnNpemUgIT0g
c2l6ZSkpIHsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGNvcHlf
ZnJvbV91c2VyKCZyZXNwLCBxdWVyeV9wdHIsIHNpemUpKQ0KPiArCQlyZXR1cm4gLUVGQVVMVDsN
Cj4gKw0KPiArCWlmIChYRV9JT0NUTF9EQkcoeGUsIHJlc3AucmVzZXJ2ZWQgfHwgcmVzcC5wYWQy
IHx8IHJlc3AucmVzZXJ2ZWQyKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlzd2l0
Y2ggKHJlc3AudWNfdHlwZSkgew0KPiArCWNhc2UgRFJNX1hFX1FVRVJZX1VDX1RZUEVfR1VDX1NV
Qk1JU1NJT046IHsNCj4gKwkJc3RydWN0IHhlX2d1YyAqZ3VjID0gJnhlLT50aWxlc1swXS5wcmlt
YXJ5X2d0LT51Yy5ndWM7DQo+ICsNCj4gKwkJcmVzcC5tYWpvcl92ZXIgPSBndWMtPnN1Ym1pc3Np
b25fc3RhdGUudmVyc2lvbi5tYWpvcjsNCj4gKwkJcmVzcC5taW5vcl92ZXIgPSBndWMtPnN1Ym1p
c3Npb25fc3RhdGUudmVyc2lvbi5taW5vcjsNCj4gKwkJcmVzcC5wYXRjaF92ZXIgPSBndWMtPnN1
Ym1pc3Npb25fc3RhdGUudmVyc2lvbi5wYXRjaDsNCj4gKwkJcmVzcC5icmFuY2hfdmVyID0gMDsN
Cj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiArCWRlZmF1bHQ6DQo+ICsJCXJldHVybiAtRUlOVkFMOw0K
PiArCX0NCj4gKw0KPiArCWlmIChjb3B5X3RvX3VzZXIocXVlcnlfcHRyLCAmcmVzcCwgc2l6ZSkp
DQo+ICsJCXJldHVybiAtRUZBVUxUOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4g
IHN0YXRpYyBpbnQgKCogY29uc3QgeGVfcXVlcnlfZnVuY3NbXSkoc3RydWN0IHhlX2RldmljZSAq
eGUsDQo+ICAJCQkJICAgICAgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KSA9IHsN
Cj4gIAlxdWVyeV9lbmdpbmVzLA0KPiBAQCAtNTA3LDYgKzU0Nyw3IEBAIHN0YXRpYyBpbnQgKCog
Y29uc3QgeGVfcXVlcnlfZnVuY3NbXSkoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJcXVlcnlf
aHdjb25maWcsDQo+ICAJcXVlcnlfZ3RfdG9wb2xvZ3ksDQo+ICAJcXVlcnlfZW5naW5lX2N5Y2xl
cywNCj4gKwlxdWVyeV91Y19md192ZXJzaW9uLA0KPiAgfTsNCj4gIA0KPiAgaW50IHhlX3F1ZXJ5
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmls
ZSAqZmlsZSkNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IGVkYmM1OGE0NzY5Yy4uMjI0NmE2ODY2NzJi
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTQ2Niw2ICs0NjYsNDggQEAgc3RydWN0IGRybV94
ZV9xdWVyeV90b3BvbG9neV9tYXNrIHsNCj4gIAlfX3U4IG1hc2tbXTsNCj4gIH07DQo+ICANCj4g
Ky8qKg0KPiArICogc3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uIC0gcXVlcnkgYSBt
aWNyby1jb250cm9sbGVyIGZpcm13YXJlIHZlcnNpb24NCj4gKyAqDQo+ICsgKiBHaXZlbiBhIHVj
X3R5cGUgdGhpcyB3aWxsIHJldHVybiB0aGUgbWFqb3IsIG1pbm9yLCBwYXRjaCBhbmQgYnJhbmNo
IHZlcnNpb24NCj4gKyAqIG9mIHRoZSBtaWNyby1jb250cm9sbGVyIGZpcm13YXJlLg0KPiArICoN
Cj4gKyAqIFRoZSBAdWNfdHlwZSBjYW4gYmU6DQo+ICsgKiAgLSAlRFJNX1hFX1FVRVJZX1VDX1RZ
UEVfR1VDX1NVQk1JU1NJT04gLSBUaGlzIGlzIHRoZSBHdUMgU3VibWlzc2lvbiBWZXJzaW9uLA0K
PiArICogYS5rLmEgJ1ZGIHZlcnNpb24nLiBJdCBpcyBub3QgdGhlIGFjdHVhbCBHdUMgYmxvYiB2
ZXJzaW9uLiBBIHJ1bm5pbmcgR3VDIGNhbg0KPiArICogc3VwcG9ydCBtdWx0aXBsZSBWRiBBUElz
IHdpdGggZGlmZmVyZW50IFN1Ym1pc3Npb24gVmVyc2lvbnMuIFRoaXMgdmVyc2lvbiBpcw0KPiAr
ICogbmVnb3RpYXRlZCBieSB0aGUgVkYgS01EIHdpdGggR3VDIGR1cmluZyBWRiBpbml0aWFsaXph
dGlvbi4gSW4gbW9zdCBvZiB0aGUNCj4gKyAqIGN1cnJlbnQgYXZhaWxhYmxlIEd1QyBibG9icywg
dGhpcyBpcyBhIDEtMSByZWxhdGlvbnNoaXAgd2hlcmUgdGhlIFN1Ym1pc3Npb24NCj4gKyAqIHZl
cnNpb24gY291bGQgYmUgaW5mZXJyZWQgZnJvbSB0aGUgcnVubmluZyB2ZXJzaW9uIGFuZCB2aWNl
LXZlcnNhLiBIb3dldmVyLA0KPiArICogdGhlIHN1Ym1pc3Npb24gdmVyc2lvbiBpcyB0aGUgbW9z
dCB1c2VmdWwgaW5mb3JtYXRpb24gZm9yIHRoZSB1c2VyIHNwYWNlDQo+ICsgKiBwZXJzcGVjdGl2
ZSBhbmQgbmVlZHMuDQo+ICsgKiAgLSAlRFJNX1hFX1FVRVJZX1RZUEVfSFVDIC0gVGhlIGFjdHVh
bCBIdUMgYmxvYiB0aGF0IGlzIGN1cnJlbnRseSBydW5uaW5nDQo+ICsgKiBpbiB0aGUgcGxhdGZv
cm0uIEl0IHJldHVybnMgMCB3aGVuIEh1QyBpcyBub3QgY3VycmVudGx5IGxvYWRlZC4NCg0KRFJN
X1hFX1FVRVJZX1RZUEVfSFVDIGlzIGFkZGVkIGluICdkcm0veGU6IEV4dGVuZCB1QVBJIHRvIHF1
ZXJ5IEh1QyBtaWNyby1jb250cm9sZXIgZmlybXdhcmUgdmVyc2lvbicuDQoNCj4gKyAqLw0KPiAr
c3RydWN0IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uIHsNCj4gKwkvKiogQHVjX3R5cGU6IFRo
ZSBtaWNyby1jb250cm9sbGVyIHR5cGUgdG8gcXVlcnkgZmlybXdhcmUgdmVyc2lvbiAqLw0KPiAr
I2RlZmluZSBEUk1fWEVfUVVFUllfVUNfVFlQRV9HVUNfU1VCTUlTU0lPTgkwDQo+ICsJX191MTYg
dWNfdHlwZTsNCj4gKw0KPiArCS8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ICsJX191MTYg
cmVzZXJ2ZWQ7DQo+ICsNCj4gKwkvKiBAbWFqb3JfdmVyOiBtYWpvciB1YyBmdyB2ZXJzaW9uICov
DQo+ICsJX191MzIgbWFqb3JfdmVyOw0KPiArCS8qIEBtaW5vcl92ZXI6IG1pbm9yIHVjIGZ3IHZl
cnNpb24gKi8NCj4gKwlfX3UzMiBtaW5vcl92ZXI7DQo+ICsJLyogQHBhdGNoX3ZlcjogcGF0Y2gg
dWMgZncgdmVyc2lvbiAqLw0KPiArCV9fdTMyIHBhdGNoX3ZlcjsNCj4gKwkvKiBAYnJhbmNoX3Zl
cjogYnJhbmNoIHVjIGZ3IHZlcnNpb24gKi8NCj4gKwlfX3UzMiBicmFuY2hfdmVyOw0KPiArDQo+
ICsJLyoqIEBwYWQyOiBNQlogKi8NCj4gKwlfX3UzMiBwYWQyOw0KPiArDQo+ICsJLyoqIEByZXNl
cnZlZDI6IFJlc2VydmVkICovDQo+ICsJX191NjQgcmVzZXJ2ZWQyOw0KPiArfTsNCj4gKw0KPiAg
LyoqDQo+ICAgKiBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSAtIG1haW4gc3RydWN0dXJlIHRv
IHF1ZXJ5IGRldmljZSBpbmZvcm1hdGlvbg0KPiAgICoNCj4gQEAgLTUxOCw2ICs1NjAsNyBAQCBz
dHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVyeSB7DQo+ICAjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVF
UllfSFdDT05GSUcJCTQNCj4gICNkZWZpbmUgRFJNX1hFX0RFVklDRV9RVUVSWV9HVF9UT1BPTE9H
WQkJNQ0KPiAgI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX0VOR0lORV9DWUNMRVMJNg0KPiAr
I2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX1VDX0ZXX1ZFUlNJT04JNw0KPiAgCS8qKiBAcXVl
cnk6IFRoZSB0eXBlIG9mIGRhdGEgdG8gcXVlcnkgKi8NCj4gIAlfX3UzMiBxdWVyeTsNCj4gIA0K
DQo=
