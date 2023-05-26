Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21466C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB81710E033;
	Fri, 26 May 2023 19:16:03 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0EC10E033
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685128561; x=1716664561;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EPhahM6NRvzDhL1YwPPL5TAGVcTtRyIv7ARYOwpaBX4=;
 b=ek8JW5MsM6cYxCJhPw/lXfI0/VFrSxP3yKVcClfT+izxqfU+DK1ZVjss
 Rmw/isjA0KCgj2Ml6pWUJ78B0V94Er6JX60GVojurJlA8tIPb7OhhRQh6
 XuWRDNOwvbaAWsmS8SvhkEHH9vTN2kYvsHYUPrW3prLf7xmTSHlRRaYBW
 ElslUCk5cBWiabQIrbjjip54uMcQQd72FQj0bh2KetCPYe/on6JLyFBIp
 ucfq9SXVVB86Ae504ViG96MQ8AfK/NJrWCvnAfklkNWNCLXhPUp2VODd1
 M04IBYKX7g4K/RbWNZS5hcsL2TKZF9FMI01vBhc8F7gtL0kOW9pd19TiX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440639748"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440639748"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="770421515"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="770421515"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 26 May 2023 12:16:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 12:16:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 12:16:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 12:16:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 12:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEznr75x/KT6yRKMqeDjQb+2l19WFHWaJFLim1baSVnVFZ2KNGnbFfcl2/MQMKTrmUvUufmVD+45+OYuuAXh+wVvTSMp+w3QBal/qu3eWGrinVt01GAJc0t54YffKeS2+fK8jIhwaOLifa2eaSOv5LVNB4bKgjaRnlyOpedBh881E3Zzj7i7O4fHeJ1QcsATNRKSW/lF+EKom08NZi6DVEKm+KJopedahO0p9gxJ8PFHj6RXN0xQT4xawfa3uGz7zb1zaIGGzmmOE+VXR9XJyD24Vus6jpRzAJewUVrR5MFi+SkTn1Pko8w+JzIJnEKEozHxs9tzOyD9ZsMhJESFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPhahM6NRvzDhL1YwPPL5TAGVcTtRyIv7ARYOwpaBX4=;
 b=cQCoVCKymgGt72cA+akH8PrFaSDYmDj2tZLdGC4Cep+r1+ULbEuxe0FJEtO1oK9G1y4L5zIuhAz1WpPv0+uj0hdy1Kw3qQOcH/HiQGeCK+eGNpmj7uW/nOyVikLVf+3+iZxcBXVD1z20kELr1291NBMlKh4s2orUe/mmD4y4ZGFolIbAIYyOErHnhxrTRU/Zgb43IeW60xT5SexTXmaKksQpWOP822vOfBR5GAic69K5DbOWsu4dEDYgmG+mtqm6gdsVUBsliDgsLhG5FILUB1rd99aHEtWX9ZMAjBlciPUJ82YpmbA0nE1OYaySd9Le0KcAtDpe7omYziMJneVoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Fri, 26 May
 2023 19:15:54 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6433.017; Fri, 26 May 2023
 19:15:53 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 5/5] drm/xe: Return the correct error when
 dma_resv_wait_timeout fails
Thread-Index: AQHZj8s3NkyCAqo0j0G41jkmkIk5YK9s7VqA
Date: Fri, 26 May 2023 19:15:53 +0000
Message-ID: <97d4425bbb46b19cf48dd04594c9eb3c2f0c5662.camel@intel.com>
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-6-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230526121101.1619278-6-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB7550:EE_
x-ms-office365-filtering-correlation-id: 706453c7-7999-447e-9152-08db5e1da00d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9lMTei4Okf0u2uAcy4rmY24twVMPELgwyMLZupLYghqUZuWeAe8Q7+OMar08XpcvVogKU1ZP63dYYwoowpmjLwAhvQZjm2F7S2Dxnev3duWsaqRVWShPWqLzv8TpHV3rIPDwyU18gC31Gjd9iIHqumLmZWgx/YDmp1DBbEuBhtPwctc2yiQ2cunOZj7YVsSCvwVQFgsG8BDhSh/MjLoTpnWDeKotnO0VTTQfDvrIhRvGtmaE971qmYoClBuRIfFebeM1Lrl6FEYoNO3aLufbNsNS1Jt/wbmZx8ZN+vTwJkiVmemGV9CNN9ZxMHWjlRyGPLotNUwUoxGnF5rwEXTmtThKPaayWhD4jxOedcr1yo0a/XRdy+FzLhYAycHaZBv8q4Wf1reLg5K/j7lnqfxe9ktcf9byPXLld3zHxKfhJdug1UfTLTA4YAkz2vVbkJHiqRtZjNTqg+45qIa8RkGjBJ6igN32/UXajg0mqmoWvNJJJyEuYsU6B8XazRxdB3zxh87w/t8MT1OCLj1DCBgq7IH4vRDOrWVWJ49eLoVoXNkrv576bm7au/7Tqm3cFMtR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(316002)(66446008)(66946007)(966005)(38070700005)(91956017)(64756008)(66556008)(66476007)(76116006)(71200400001)(478600001)(8936002)(41300700001)(8676002)(110136005)(6486002)(86362001)(5660300002)(6506007)(38100700002)(122000001)(82960400001)(186003)(26005)(6512007)(2906002)(2616005)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2V3blFiSFBySnd6Ri9EQVpOeUdPTURveHR1M1pmMHZTeTRvaVVmak80S1Fr?=
 =?utf-8?B?SzczaUpJVHVRb3lvVWFNemM2NCtxbVd4YjRLN2xPa2t3UXRpdkxRSmxLL0xP?=
 =?utf-8?B?aVZqOEh3OGczM0ZOTWl0SlpoMnpmRnZxRWFrV0doNWFtcnVQWnhTa0dUY0s2?=
 =?utf-8?B?cmNZY1JCMTlNN2QzTGpiaHIzK1FIOExpWk9KTFpJUGk5RVp5VnkrakNZckZZ?=
 =?utf-8?B?aUZQMlFqYVB5bW12VGpIQVM5QkhQVllhZGc1R2c5djQ1eU9MN0pHU2JtanJp?=
 =?utf-8?B?VVBLNjVuc2FFV1BiTXc0YXhOUGR4bWpyR3pncGlndFRHc1IxelpKUHF6R3dy?=
 =?utf-8?B?anhMcGZvK2NFdm8wbE1uKy8wZlBIZGcybWtCMjQwV1I3QW5VQTBWK2hYZ0U3?=
 =?utf-8?B?TnY3Z2hFVXFTQVVYZkNOaSs3dTh6bGh6ejFtVW9QRHhYS0lvendITm5uTkdT?=
 =?utf-8?B?cStsTEt5TzY2emJXTE1kNTNOODFmZFpLMVo3Y1RabG9XTXdDOEJkcFBJOHRB?=
 =?utf-8?B?THFhZS9MakdpbkZoRnNiVkZxMEF6SlpJTTRsVGxibXhLM1Q1RlVSZ3FiQSs1?=
 =?utf-8?B?WXo5cnlwYVJIaUpVZXVEUlZZb0gxOGlXakd1Nm1ScTdzVUV2bDBlSTRXY3Z4?=
 =?utf-8?B?SGpLTGZIZHd2Qmd5dmdNRFRxcC8rRjF6NFAvNXF6UTRTcG9walZUcEVlQjNt?=
 =?utf-8?B?enBOVlNSN3lmZFo4Z2NibWw0S1J2RjFlRW9CSGczejl0c2FBVHlLVjJKQkZS?=
 =?utf-8?B?RExPV0V0U3BQbTJMNDVjWlZjQW5nVFg1dVQ4QS9OdldZMm94Mk5paXp1akhn?=
 =?utf-8?B?OG9IRjVmekc4b3g0cDlRWGZ1QnorRGdjQVd5N2o4M2ZpbjFxTjhaZDRSTm82?=
 =?utf-8?B?bkpjZ2lpbVVkc0RKMjNwYms3V3NnMFg2N0R0WU9XRjJkZDRIU2IzcklSQ2s0?=
 =?utf-8?B?Q3ptT2tlN3Zsa2tzTnAvckNMeGtlZjZUMUNqaXhhUFlGN2xuQmpZc1pEQ2FD?=
 =?utf-8?B?RHZoaTRTbGpQZHRyWGF2YW96ZVphbmxTMTlUUm92bDMyYjltNzV6VzB0NGFn?=
 =?utf-8?B?ZTZzTFpoZU54YWlCd2hGT0xSRkNmN255LzNic3RvaDBsOWVDeDZSZDBOSkll?=
 =?utf-8?B?N1QyRWNSRHhIVTRNL3F5ZktPc3E4a0Z4SWRzc3pmVCtLNk95WXVNNlVTa1Zy?=
 =?utf-8?B?SG4wWFlvVnJ4ODNYVkdsZE41YkxwS2xxQ3dzOVVsWTlhbGVZamVqWFJyN1R6?=
 =?utf-8?B?eDN5Wi9wOXBvM2lmZUxvdHlzbHJ1VGx0TGdlV1NwdnpBL0prb1k4SXRJY25Z?=
 =?utf-8?B?WUxRbzVNZjFaM0cwWllwdWRqblRuMmJFTTJTMld6R0h4MDdvQTJndUFHMkxj?=
 =?utf-8?B?U3FWQ3o5NjhQRWxPZUF2ZVdDbWJLTzNhUGpJVFJBNGdHcTZMM1djM1h5R0Vv?=
 =?utf-8?B?RGM1T05lcEd1OWVPSDRUSTZPK3Z0Q0dmdzhhM09CNXZ6WVlzOFd3U1ZGcXhr?=
 =?utf-8?B?aDRreXowc2ZVdHdWaXV0c2JadFlQUlJyNlNJNE5xa0hFYkU4SWt3YXB3VG5F?=
 =?utf-8?B?RUtvaUE5VUpHcEcxalhRNkR0QSsyaWVjQ1J0TFJwcUhFbzBYSE5teEZQRmhD?=
 =?utf-8?B?eGVpMEQwZ2dEbDdCKzRjNlBYL2JFS2ZZd1dKdythUExta3ROZ2p1bCtGVG45?=
 =?utf-8?B?bjhZL2h5OUdDYzVWVGxvSDdQRHA2OWwvZ0ozS0FKWWFmS1FVM2JKaE5GVnh6?=
 =?utf-8?B?Vy82N2hkRlBUKytmb3pFS3VRdjdyS3cyc0xWaHlWdkdrdk9XQ1pIZ2t5NFZP?=
 =?utf-8?B?NloyZ2tmaTJYTzZ2RDNRdExEOW9ZdHlYNkhHMDFCWE0zaVBJRkZ1SVFEZDVs?=
 =?utf-8?B?bm5wZnZ6MHU1L3lHUzdnVWorNWl1cDJMUSs5MExNY2FIczZHbjREQmk3Y0F0?=
 =?utf-8?B?enRBdnFiRTQvZGk3STZNaFpMNjEvTkxzaFhSd2hGNTJTbmkzcTFySTlpU1o0?=
 =?utf-8?B?V0lqUklIb3pPVHc1a0JyNld2NVVtSUJsejdPblNVQ2V1WlhOdzlTSVplUE0y?=
 =?utf-8?B?c0lhbjlpMzV5Nk9vRnlIQkFkcUNPSXJZVnhvUGVhakp3TTRZRHQ1NnFPSTdG?=
 =?utf-8?Q?6ghj6dxQNpmoxLzWECArS/hRM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BB485F2663E1F41856809124CCD0D80@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706453c7-7999-447e-9152-08db5e1da00d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 19:15:53.3183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/kr3VNUX5Espq1GrXw9yYYAL0BITiK6ZBgbygXU8qyPR0MP2e9Sp/s/KjQ2qWfO1eewB2nnkApzROLwn0dfZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe: Return the correct error when
 dma_resv_wait_timeout fails
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

T24gRnJpLCAyMDIzLTA1LTI2IGF0IDE0OjExICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gV2UgY2FsbCBkbWFfcmVzdl93YWl0X3RpbWVvdXQgd2l0aCBNQVhfU0NIRURVTEVfVElN
RU9VVCwgc28gaXQgY2FuDQo+IG5ldmVyIHJldHVybiAtRVRJTUUuIEl0IHdpbGwgaG93ZXZlciBm
YWlsIGlmIGludGVycnVwdGVkLCBzbyBpbiB0aGF0DQo+IGNhc2UgcmV0dXJuIHRoZSBlcnJvci4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3Jz
dEBsaW51eC5pbnRlbC5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvMjM5DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBpbmRleCA4NzM1ZmFjYjFjZjku
Ljc3YmE4NDkyYmQ5MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gQEAgLTYxMSw4ICs2MTEsOCBA
QCBzdGF0aWMgaW50IHhlX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0dG1fYm8s
IGJvb2wgZXZpY3QsDQo+ICAJCQkJCQkgICAgIERNQV9SRVNWX1VTQUdFX0JPT0tLRUVQLA0KPiAg
CQkJCQkJICAgICB0cnVlLA0KPiAgCQkJCQkJICAgICBNQVhfU0NIRURVTEVfVElNRU9VVCk7DQo+
IC0JCWlmICh0aW1lb3V0IDw9IDApIHsNCj4gLQkJCXJldCA9IC1FVElNRTsNCj4gKwkJaWYgKHRp
bWVvdXQgPCAwKSB7DQo+ICsJCQlyZXQgPSB0aW1lb3V0Ow0KPiAgCQkJZ290byBvdXQ7DQoNCjAg
bWVhbnMgdGltZW91dCwgc28gd2hhdCB0aGlzIGlzIGRvaW5nIGlzIGFsbG93aW5nIGEgZXJyb3Ig
dG8gYmUgdHJlYXRlZCBhIHN1Y2Nlc3MuDQpJIHVuZGVyc3RhbmRpbmcgdGhhdCBpcyBzaG91bGQg
bmV2ZXIgaGFwcGVuIHdpdGggTUFYX1NDSEVEVUxFX1RJTUVPVVQgYnV0IEkgd291bGQgcmF0aGVy
IGxlYXZlIHRoaXMgYXMgIjw9IiBqdXN0IGluIGNhc2UgdGhlcmUgaXMgYSBidWcgaW4NCmRtYV9y
ZXN2X3dhaXRfdGltZW91dCgpIHRoYXQgaWdub3JlcyB0aGUgTUFYX1NDSEVEVUxFX1RJTUVPVVQu
DQoNCj4gIAkJfQ0KPiAgCQl0dG1fYm9fbW92ZV9udWxsKHR0bV9ibywgbmV3X21lbSk7DQoNCg==
