Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB392C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 09:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04C310E1BB;
	Mon,  8 May 2023 09:25:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB5F10E1BB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683537913; x=1715073913;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Lz8xMWgpAw4lRhXot6Qj6tYI90PqjInivQCveM+HR2E=;
 b=fTwNYi+qduk28Y8voiVAK+fZByyVhva33vMwV9Lu/0QEvarfIUcTJygV
 /oZtd2aD23IF7/jSRZtYWI0s0pmvnN9cmZldTWSKUjckZsn0xsggOBq9Z
 zmouvBbZJB5URzsshzwfaUCgoFsvM0zAv2TA+r0UQUz3vu5LvucBvvGm3
 scp4UNjNo8KXRl3ckZx+Q6OdOdyIDtm6rvdZL+v6ajKRG3WzELl4ug63d
 LHyc8Noq4UD9byBDUTj9h+MaiVtN3ENFDpaLicuNtE4S1cagqYFV4s4mG
 qjvmvDmVC4NpJiiXzYHKaM0IVRHILfJlE1t5GeV9NeeQHxF5uHVCxUfSW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="348425701"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="348425701"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 02:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="872730004"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="872730004"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 08 May 2023 02:25:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 02:25:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 02:25:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 02:25:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 02:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqSA/sop/YdHrSpne8F2hksEEAafGV0xSIvkRW4wVAOZyBvRFhd4pUiKj6anEyk0e8DhXA3GxYx/Uv73ziC8v7V2ho6lw0P53Ch3Nmk0pP3eZJhZled4zjWyj9fegPPQwZvtcX1WgfL1Aw1GoY97l6U/pYZf2F7QYM7PVWuFUs2l2jkrCM4vxfBd+H+26HMilwyuWHTQJXoKC2aHn8nlo13F1UsdypL5SgbLw6cf1w3N1fzZ8JNbPR/HMlGqg6J4XKO9x3QVaRX408qh+LOU/zPLV9VIbmDW+UNsRyddk7HZf9A9vx2d0TtikHUwI3Kbueu5t7/yZbgEG+AozvaArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lz8xMWgpAw4lRhXot6Qj6tYI90PqjInivQCveM+HR2E=;
 b=BktErDKu1gq9b0wNBk27Y88+B/PH9uRVlHTEzmMY3MAYKFXj91u/WY+V8Tm30DZxKE2uv/IJ0JGy24aJB7K1zZMF1U8TYCWFHdkcg4MC7L5N8dBwawpd4OzJN+PRl++tim/J95P9NktRYfUKRMIkqgrtCSE1VGjVPNpXUkwxOOpRfPvUGG4Yd5Oai//BsKw+xxsXw7cUUFpapqRO12qCMUW8FJHgl1bL68eqZv+zjr8J+X0F4q8cfhz0DRhnJ/OeQfF/vl1/FNL0eGoe4RqYB9CsCd7ix7cucDn0LXQODZzYyHelSwd42PW5DRh2lunZCHxFikeS+jw6RqfLAPWKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 DM4PR11MB8178.namprd11.prod.outlook.com (2603:10b6:8:18f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Mon, 8 May 2023 09:25:05 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::9f1b:8dde:50b2:1b4f]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::9f1b:8dde:50b2:1b4f%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 09:25:04 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [Intel-xe] [RFC] drm/xe: Handle -EDEADLK case in preempt worker
Thread-Index: AQHZgXY0dzgbduLazEe0t2ed3pDml69QGwGA
Date: Mon, 8 May 2023 09:25:04 +0000
Message-ID: <2bf9e00bbcec0a4bfe0c4d4a194a3cd031fe6d42.camel@intel.com>
References: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230508062730.1509-1-niranjana.vishwanathapura@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|DM4PR11MB8178:EE_
x-ms-office365-filtering-correlation-id: 14f9f061-8fba-4b45-c9bb-08db4fa61b94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z/6QMYydtzJs1GVoIM8D2vsTItN7HmQYLJJLNQCOv6suebSTqDZHbfgRflDaRa2cz8SdoqKQGxYyfUqdQjbaQdY/DMZOxTOBKgWwbOq1NZZ7mUQD8JxgtTkdO4SY6aTZIdeb52G7AnMRaBPmSmGXfj453fbCHJ7DfH5DRxbnX2RCcUpiB/ELMlDJvM4gMGPVRs8RhjyeOdze7yzDTo5p08zd8WLFF1bMrDzVs0WhGaIE8BJqMiUzJoDtx9Xbw6CUS0fTl0NtnIi22dAXxd7woLUghbqSe1QrVehXxpe/ea1dxyRaRrc6khj8qe+sM8743XFBEEOtmGAILElIa4nW/V7DtX25WYX4ns3WI3Mv5jPcHCFQs+rqI3exuxAeGoPz/b2dwwSLGMTzmL4w2eVZMADiJUnKVcSAZejpDvB1GH4A2KXtHZ7j9xOo+yZn30K0M3BmIyGaU+iQ0uXJT3qmUjBrMhkokboEgHW9hK2tfd3pqiIk0utXos1OEjPy+3FngKJeOpOeX88akGSn8MLH6jBLJ8C9Prex6msvYL+LJ/MSCxXLda4JIwvmWK5Vwd+eVe+pKDQOZ9BmIMPW1tu0uoo9sQHA5lzhsBYQoyMI9T1RxmfNQhg5W1i8sXSzsvvP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(478600001)(2906002)(8936002)(8676002)(316002)(66476007)(66556008)(4326008)(66446008)(5660300002)(64756008)(6636002)(41300700001)(110136005)(71200400001)(66946007)(76116006)(91956017)(6486002)(26005)(6506007)(6512007)(186003)(82960400001)(2616005)(36756003)(83380400001)(38070700005)(38100700002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azltR0EwL21jMm9RNm5JL2RPUUZBS0xwVDhSdmJuNE94Z0NIWXd3RXE4VCsz?=
 =?utf-8?B?YkFzR05INXJ2VlIycVpnWGFGYThEd1hlQXAveHprb0dKOVhoN2FlaWNGRTNi?=
 =?utf-8?B?OElGL1NMZTUrc1RnbFFuSWRKYk5XdnpUcXBsTytJZWJNQkRURGRkSEdJOFVE?=
 =?utf-8?B?VkdKcW82NldFd3Rma0VWNTQ4OVlWOXN0QktNcEdOejl5bExhRWFGdjQxbWRh?=
 =?utf-8?B?T3J0VFpnYWYvMytVSHg2eWZFTlVHSUt3ZjBkSUZyMnBZY2lyb0I0azNVcFRx?=
 =?utf-8?B?L0dhZnBrVjVyamtmZXJ3MW9QdmVnZVdEQTFQZFFDeEEwbUpoNlZLTmxOWE1C?=
 =?utf-8?B?Z0hZb1BObUxCdHpiQlZyQlN4Z0F0M296TkpDRmdEdW1xVklabW8wNlJ4dktm?=
 =?utf-8?B?N05POU1POURkUTBMYldlTllSNEhGTWpYc1J2ekR1aG9yNGdlWkVhNmxVTzdX?=
 =?utf-8?B?U0prQjQ0eVUyK2hTa0dBenQzb0VrRUwwMWc3cERZbnUxQVpFc0NCc1JIdS9W?=
 =?utf-8?B?RlRBN3FkclkvSDlyY2dNNkRYNjMyRTliMExaNUJ1VWtPZm9DWCtRN2ZsM0dU?=
 =?utf-8?B?K1pzb1hUUDRtYm9Qd0h2ZXBrNGdjVkM2ZTdDMWovaGcvZXlZTTVGc29IaG8x?=
 =?utf-8?B?dG5qeWg1V3RDUUF4R25nd2RJaEZXU3hOQVVaQVpUanpVejcrOGlMWTg0RjBZ?=
 =?utf-8?B?QnY0NHNtcEY5WXBIY0oxNCtmdWp5MDVTTlBpQ3lqb1dHOTQ3bE9OOSs0a0FM?=
 =?utf-8?B?eGQrYjJGZVRxYjNMd1ZEbVlPOThaMmZ2UmRHMzhqcjB3TTVJQmdKdU9STEhH?=
 =?utf-8?B?MnBMK1MrUGFEaG5xNzB4VEU3OW1rQXpkOGVJb2xoaGhiM0VML1l0aHVHS3Zx?=
 =?utf-8?B?VHpsWTQ4ajFaM2MydTdRTTNZOG4wd3Yzb2xVZlRlSG94UFkwOWdBT2pmbG5U?=
 =?utf-8?B?SGIvdy93VFJDOFp1WVAyRUY4T0JvckYvT0N6NmpueGNOZk5veXVLSndOMWJ5?=
 =?utf-8?B?MWc3YnhRVUJGb1lUTWdKZE5GT2JEdDVBN0tmZjZyaXZCZTZzVkVPaTVESHlO?=
 =?utf-8?B?ditXYmZPdG54dXI4ZDZ5TmUxY3NiZ1VxNVNvKzllTFlTT2RZTnUwSHJOUkdV?=
 =?utf-8?B?SmxPdDB2alBjSjljdjJkVjVRMnJmbWRIYUNRekFybTBVb0szNFRrWDBid2FU?=
 =?utf-8?B?MVlxZlFJcFdpYjI5VXVQekszVXo1QmEvcnlEZUIzNTZmVVQwV25yZXJIM3NQ?=
 =?utf-8?B?b0pGTWcrdUwwQUxwdlZIZEZSNWozTGRTeUFvN1E2ZXluL0t3MWhWcER2YWtr?=
 =?utf-8?B?YnBXSGw1dERuVkJFcjRVdzBCZWlzTXZWYjBIV211UFA4enpabE9YRGtKWEFj?=
 =?utf-8?B?Z3ljc21KT0VVcnBLZjlocGM5dVc4Q1VJZFg5RTFXbk5udytvUFdxanhsaCtL?=
 =?utf-8?B?S0ZPM0twVlRRWnNOc0c2ckxxMVZpVysyYXNGRVFDb2JaWDlOenJTcWlJVHZu?=
 =?utf-8?B?RkNBMmU3WVZkazVFQXluWmlwb3hKWk4wWUt6TDErMnFDZTYvSXRBdlc5Sm1o?=
 =?utf-8?B?TTBTVldYcWFZMzVUeXNja2V6NVpVZkhTcmNxZkhnNkVyTzAxOEpDNE9BS3hB?=
 =?utf-8?B?alYzMGtLSHU4bkFscld5QTEvdmFRQUl2TDZFcTBmWlJhK0FLcjRTSkg4d3dk?=
 =?utf-8?B?WEtaNTltRjlQT1E0bGFEWFpFZS9xTHd0REhxOGxxaEh3SzhUR2JpTkFKZERB?=
 =?utf-8?B?Qk1RL3VkQWdlWTJTc0dDZDBwZXg3VHBUdDBWaUs2WnRJY3FHbzZTRktiVjZG?=
 =?utf-8?B?dEtHMC9lUURESnF4YTkzaUlwVVZYd2xKTHBYZDBMY2VnaU5MZ2RwOWxoOHkx?=
 =?utf-8?B?ekF1dkl5cUZPQ09nbi8vekRtUWFlZGxaTkNyUXcyTms4NEFHZ1FnbTd6cGVK?=
 =?utf-8?B?U3R5dlhDNmtSSkZZaEVjWFlrNysrVU9tL1RoWG9OQndXdUhjaG16MCtIRjFu?=
 =?utf-8?B?OSs3NG9EQXVGbjNobUlJdXVKVmVESWM1aVZ1TE43Y2c3ZHRDeERaZXA4cUdD?=
 =?utf-8?B?SW9ad1VFSGF4aDltQVBnTEtadmw5eGkweVl5amVhN3BrbFd3Z01KUGRpV01r?=
 =?utf-8?B?cWJ0T2l6U05HOUNiRDF0dU5XdWVkdjhCVk1NY1BNcEtvSysyUGJ4VE5RN0dR?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD719ED40854F14F8A358A64C6AD81CF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f9f061-8fba-4b45-c9bb-08db4fa61b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 09:25:04.8731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WsT/5JtBXY8cxF0i3xgjDQagIxsMBnmW+BkTja+N8D8I9Y0PlZvLtTaeYvxsNfl4cH3is9bPTt79Ky74q65SU7kEAjsq0wkSWNCKP6GDKr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8178
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: Handle -EDEADLK case in preempt worker
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
Cc: "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIzLTA1LTA3IGF0IDIzOjI3IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFdpdGggbXVsdGlwbGUgYWN0aXZlIFZNcywgdW5kZXIgbWVtb3J5IHByZXNz
dXJlLCBpdCBpcyBwb3NzaWJsZSB0aGF0Cj4gdHRtX2JvX3ZhbGlkYXRlKCkgcnVuIGludG8gLUVE
RUFETEsgaW4gdHRtX21lbV9ldmljdF93YWl0X2J1c3koKSBhbmQKPiByZXR1cm4gLUVOT01FTS4K
PiAKPiBVbnRpbCB0dG0gcHJvcGVybHkgaGFuZGxlcyBsb2NraW5nIGluIHN1Y2ggc2NlbmFyaW9z
LCBiZXN0IHRoaW5nIHRoZQo+IGRyaXZlciBjYW4gZG8gaXMgdW53aW5kIHRoZSBsb2NrIGFuZCBy
ZXRyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhCj4gPG5p
cmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMgfCAxOCArKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiBpbmRleCA5MTU3NmNlYzAwMGQu
LmRmMTIxNGYwMGEwNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gQEAgLTEwLDYgKzEwLDcgQEAKPiDC
oCNpbmNsdWRlIDxkcm0vdHRtL3R0bV9leGVjYnVmX3V0aWwuaD4KPiDCoCNpbmNsdWRlIDxkcm0v
dHRtL3R0bV90dC5oPgo+IMKgI2luY2x1ZGUgPGRybS94ZV9kcm0uaD4KPiArI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+Cj4gwqAjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPgo+IMKgI2luY2x1ZGUg
PGxpbnV4L21tLmg+Cj4gwqAjaW5jbHVkZSA8bGludXgvc3dhcC5oPgo+IEBAIC01MDgsMTEgKzUw
OSwxNSBAQCB2b2lkIHhlX3ZtX3VubG9ja19kbWFfcmVzdihzdHJ1Y3QgeGVfdm0gKnZtLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKga3ZmcmVlKHR2KTsKPiDCoH0KPiDCoAo+ICsj
ZGVmaW5lIFhFX1ZNX1JFQklORF9SRVRSWV9USU1FT1VUX01TIDEwMDAKPiArCj4gwqBzdGF0aWMg
dm9pZCBwcmVlbXB0X3JlYmluZF93b3JrX2Z1bmMoc3RydWN0IHdvcmtfc3RydWN0ICp3KQo+IMKg
ewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdm0gKnZtID0gY29udGFpbmVyX29mKHcsIHN0
cnVjdCB4ZV92bSwKPiBwcmVlbXB0LnJlYmluZF93b3JrKTsKPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX3ZtYSAqdm1hOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1
ZmZlciB0dl9vbnN0YWNrW1hFX09OU1RBQ0tfVFZdOwo+ICvCoMKgwqDCoMKgwqDCoGNvbnN0IGt0
aW1lX3QgcmV0cnlfZW5kID0ga3RpbWVfYWRkX21zKGt0aW1lX2dldCgpLAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBYRV9WTV9SRUJJTkRfUkVUUllfVElNRU9VVF9NUyk7
CgpUaGUgcHJlZW1wdF9yZWJpbmQgd29ya2VyIG1heSBhY3R1YWxseSB0YWtlIGNvbnNpZGVyYWJs
ZSB0aW1lIGlmIHN0dWNrCm9uIGxvY2tzLiBDb3VsZCB3ZSBkbyB0aGUgcmV0cnlfZW5kIGNhbGN1
bGF0aW9uIGF0IHRoZSB0aW1lIG9mIHRoZQpmaXJzdCBhZmZlY3RlZCByZXRyeT8KCi9UaG9tYXMK
Cgo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciAqdHY7Cj4gwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCB3d19hY3F1aXJlX2N0eCB3dzsKPiDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IGxpc3RfaGVhZCBvYmpzOwo+IEBAIC02MzcsNiArNjQyLDE5IEBAIHN0YXRpYyB2b2lk
IHByZWVtcHRfcmViaW5kX3dvcmtfZnVuYyhzdHJ1Y3QKPiB3b3JrX3N0cnVjdCAqdykKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX3ZtX3JlYmluZF93b3JrZXJfcmV0
cnkodm0pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byByZXRyeTsKPiDC
oMKgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDC
oCAqIFdpdGggbXVsdGlwbGUgYWN0aXZlIFZNcywgdW5kZXIgbWVtb3J5IHByZXNzdXJlLCBpdCBp
cwo+IHBvc3NpYmxlIHRoYXQKPiArwqDCoMKgwqDCoMKgwqAgKiB0dG1fYm9fdmFsaWRhdGUoKSBy
dW4gaW50byAtRURFQURMSyBhbmQgaW4gc3VjaCBjYXNlCj4gcmV0dXJucyAtRU5PTUVNLgo+ICvC
oMKgwqDCoMKgwqDCoCAqIFVudGlsIHR0bSBwcm9wZXJseSBoYW5kbGVzIGxvY2tpbmcgaW4gc3Vj
aCBzY2VuYXJpb3MsIGJlc3QKPiB0aGluZyB0aGUKPiArwqDCoMKgwqDCoMKgwqAgKiBkcml2ZXIg
Y2FuIGRvIGlzIHJldHJ5IHdpdGggYSB0aW1lb3V0LiBLaWxsaW5nIHRoZSBWTSBvcgo+IHB1dHRp
bmcgaXQKPiArwqDCoMKgwqDCoMKgwqAgKiBpbiBlcnJvciBzdGF0ZSBhZnRlciB0aW1lb3V0IG9y
IG90aGVyIGVycm9yIHNjZW5hcmlvcyBpcwo+IHN0aWxsIFRCRC4KPiArwqDCoMKgwqDCoMKgwqAg
Ki8KPiArwqDCoMKgwqDCoMKgwqBpZiAoKGVyciA9PSAtRU5PTUVNKSAmJiBrdGltZV9iZWZvcmUo
a3RpbWVfZ2V0KCksIHJldHJ5X2VuZCkpCj4gewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBtc2xlZXAoMjApOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0cmFjZV94
ZV92bV9yZWJpbmRfd29ya2VyX3JldHJ5KHZtKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ290byByZXRyeTsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoHVw
X3dyaXRlKCZ2bS0+bG9jayk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZnJlZV9wcmVlbXB0X2Zl
bmNlcygmcHJlZW1wdF9mZW5jZXMpOwoK
