Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96068E95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 13:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7CC10E109;
	Mon,  9 Oct 2023 13:35:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E5810E0E2
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696858525; x=1728394525;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TlOxcu8npSIMlIRBqf2W1ekmcpLCo7dsB3krxqWLUAs=;
 b=PHRMisXHnAMzhepLQr5kiZUUL/zKC2rO1/0U0j2lA7ZL0PTz8PGe/YBy
 pTRLWVREc3FRQjcBzl4JM+vH3iXOM84YM0pitSHCsnUzLTErAFN1FReIM
 snou9Ugf3JhyBej+Iubeh8xM4IjYR13hOKXbGWLlzvIem8UznS2keIz5v
 +9OfYHsr5C4pNw5ZyWh+n9JjeIdJQkVWlKNKb+DwQM998o2kM9MWB79/N
 sTUnW6RFoBv2UevfTeC05CT23NC+8QynbLVkJXKxovf6fG5v4NDfTDOGt
 C0Mz8NbLjgadu339k4UQTDXDQu8Qknce14K/rBghKj7LfY2WBGfmrMRyz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="381407091"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="381407091"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 06:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1084320844"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="1084320844"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 06:35:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 06:35:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 06:35:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 06:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INkDbQtnVm1k1nlBPRph/leZY4J+3YNc2lFujmD4URJdgChb0pScLhopS9+enZKWG2wyrFQUa3hTxeqyv5OiHVmwK9QHZCoBf0eDqOA1RKkMMs03HCtM3QOg2S20ikLlQskhHARzZt5wYPWBPxgH1+ycmb2x41CVgqMOFR+W9WHNWp4dgCVdcdtgUIqtRUxMSF1kJIh7NcvS06ayTJwP5PUX86MujBFi+LfWaDSiRhzH2WpH9F433rua6ufqkVVcru4J9k69NPCBXclZ6d1Qu1IoE+PCi+asfJMJRke1BMLcacodM5Mh+qAMlyh45Ha5Ir6Qk67XfUe2iY9QzBAR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlOxcu8npSIMlIRBqf2W1ekmcpLCo7dsB3krxqWLUAs=;
 b=TfopYTioPvmsgXEKMvnNJko2/pAarv2W2eRHqBD9L9/dOUA+0MLuv6yTwRbsh4EKfmUwW0/qzAxaWnn8HxE0rSsgsGQnoBkiKhEzmfXcpHAxHFFji8CxaaL8x07DPebT8LfZAwSfXU1TKUbp78/bSPX2fm2rwFQERXqhvTMLdO5INehVgEYkJHraodRv9iaFHBF7WFNCKlP24nWBVhmWAOa7Zb7KeDZyxFxsissGl/6zLKUXhTWvGx5m3mE9OTWshl21QmxE3AFLZrQFF9/OU6ry87DtYb/MB7vElNXyEh+o6YYVgznD/BON9q532dyv4TXdCRHBxARE5/qNbZrVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.42; Mon, 9 Oct
 2023 13:35:19 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 13:35:18 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
 micro-controler firmware version
Thread-Index: AQHZ8HoGcN+923X40UuKuEW2Quipi7AtUQ0AgAGXeICAAATqAIAJ6n6AgAiqfwCAAAeAAA==
Date: Mon, 9 Oct 2023 13:35:18 +0000
Message-ID: <682cf5c5a4cd9a9553df0ecf9e960b355fef7cd6.camel@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
 <20230926125540.7-28-francois.dugast@intel.com>
 <f749c938c60f7b6a9cfda34846c457aafe400150.camel@intel.com>
 <ZRRgt81Ekx0tNk3e@intel.com>
 <30f2ed3daceb731b579938b87abdc0d16f182d10.camel@intel.com>
 <a3b880a3-555d-540a-0f10-4f2a7c017dec@intel.com>
 <ZSP7SsqjuPVoDPHz@fdugast-desk.home>
In-Reply-To: <ZSP7SsqjuPVoDPHz@fdugast-desk.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6533:EE_
x-ms-office365-filtering-correlation-id: c031e598-279d-4f54-3627-08dbc8cc943e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0frJaD1fTPedwHFmPJFgK+WZpAR/2qaMYAEtaK9j6hFuJiWItJwLs4DUUO+Uhha5s25gLuillAZsNUoEjpJx6EeOuPTBuh9p7ksMy7zcENTKvv3YXxP9JSjCdKem0jg4/XtFE66819F0cztZ0s3dzmdgCqrefWjv6gA72zFRCAE8S3hvf1dYUgqF6tzgoJJ0pWVG8Wm2LKKb86vpSDHRlQK6hfBImsDymp2I54f1xVofDDUOUrXoJ/PCJ+OrSxJNPDmkhE3O72OR5oizIOf8YyQRm6oNodW2Hd2/N9x76mohNahs7r2Od9uHhN+EnlFSzWInEmqzjEx+yUkTd4QZNvz/0jmecoSIvGIohJMR6CUcGdh6cYbEDQlJxv6bsT+QB3zu/MeDSfro9SkaFtii9geV7dRmRggGoo1xxgXS+mVteizIh5kMePOeYrNwu2Ts88Q5JHSxofTaPZRKAxrayyRjwu9lhqpG2bJNybmkvoFI12jef0aQOZje/OdcAN+uSZ/pfC+We+dwoyAoapfcsr1tXevJ0s0Kas1Hvob7OrafXnUMK7SNXzBsx7YkEOMINbB596fYmx6bLGag/wMBat/RF4tgkiKbWRtZDWYMdNFYrK5mQqMTmAMb/AyoZQ3E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(53546011)(71200400001)(26005)(2616005)(6512007)(6506007)(8676002)(478600001)(8936002)(107886003)(83380400001)(4326008)(2906002)(66556008)(66446008)(76116006)(91956017)(54906003)(110136005)(66946007)(66476007)(64756008)(41300700001)(6486002)(316002)(6636002)(5660300002)(82960400001)(122000001)(38100700002)(36756003)(86362001)(38070700005)(66899024);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkVZakVtbFFuT2NyeVlMY1J0L2VaT2o4bDFRZEphVHhHQWNEWm5wOXBleWpV?=
 =?utf-8?B?eklqbHBuU0hsNlpMbGxyUzI4T3hjSnh2MGZsN1FMTVhKODBHWGZZZE1HRkFO?=
 =?utf-8?B?a0syTS9OK3hld3NLT2Y1WG5INE1vM1NFeEVZRTNnWVJqVm5Nb0NXOTlMK3k2?=
 =?utf-8?B?cktXZkxVYVA4TlJRa1lUUFdYM3RtUTNLdG1NTlFMY2dza3V4M3pmOGMvcTFK?=
 =?utf-8?B?Q2psdDVGL3Y4Vk1FNE1tQWh2WVZuck1EZnVpSmRyQmcrNFZDS2l0b0M0VVBs?=
 =?utf-8?B?VVZBd29iZzV3Z09VMFFUbEJyNmRIOWszSUxTT2xmK0VHZ3BDU1c1WTN5Z3Q3?=
 =?utf-8?B?aXhMQVl3U25uL2F5L3NoRlROUXZ1UU1ZWGF3NnpadGJDbmZhQlFRMjd2SXZw?=
 =?utf-8?B?KzJPVEdtbmNmL3cxM0xCTXBYbXhQTjhML291WUc4Y29HMmYrbGpYeU9qcmtZ?=
 =?utf-8?B?czVlQ25QcFl4dVhLUUd6dFJwZDRDcUptY1NISjc3dUxrQlNOeGdScCtWYmw3?=
 =?utf-8?B?Qk9SQmFucWc4UHJUZ3BCUDhsWU9GY3RyUHBXRlpqK2l4T2hPdkxoNUphdnlR?=
 =?utf-8?B?T29Zc3QwUklOYWtKOCtlWDJtRU10ZnBiaHFQTEVoMm0rYUppZTFYcU5BakdD?=
 =?utf-8?B?U05TOXNIdmtwMGxVblNQU1RIWnFZWkFGWUNSYjl4b0J5em5LRm1pZTh0ZG1j?=
 =?utf-8?B?N0dIaTlhK0RScE5HRjFRQmtXR1ZRR1BZWHhWRXFBa2t0aHZkOTdDZzc3Z0Y2?=
 =?utf-8?B?amV5dk1zcnFNV2k2a0d3VkNMSS9aUENGSjRCeU5seFpqUG94RnFBNVIrSWt6?=
 =?utf-8?B?bC9qUzBvMytCMHZZOEJ4dTRrYksxVFBJQVF3RG9DN1FTeldjQ3BZcG5wY0xH?=
 =?utf-8?B?OHM1NkY5S1k1VHZqelRDbmpNY2NLZXludWNycTJSUjRPS09ORUNCajkwWElr?=
 =?utf-8?B?RExPZEV0ZTE2RzY2ZlJwa2NsUU96d2ZYeVpTOXhFVE5Kb0dJZVRGeHdIc3Vv?=
 =?utf-8?B?cDZDMFlsS3ZSdS82Vi9WdG9jVjA5anpidzQzR0dIQ2xNc2prY21XbDMxVTkr?=
 =?utf-8?B?aWJmajF3ZmJlNjNWWVZlSnp2WVBlZVR2cEdYKzhreFBiWnBnSEN4VHRlTWgw?=
 =?utf-8?B?T1g1RUtvT3gxSFRjU3pzZlVvWHlYaDVuVEk4cGlMOTgvRHJnVGRRUDVNTE9h?=
 =?utf-8?B?aEN2UjdLUVdrOHN3V0cwVkVCUVpGQUcyZnV6YTBHQjN6YXFLQVZObXRoVTNr?=
 =?utf-8?B?NzEzUXYwQ2dHWnFmZFhQN250Y0poalc2NzM1b2tVZ3RDQmlPbEF2ZWpDSjJz?=
 =?utf-8?B?L0NUTE5zQUVKWXZVZ0gxb1hyeTI0RC9rbXJIU3hpK0g4TU1ua2FhL3ZYRlRh?=
 =?utf-8?B?UTl6WUlZRlBHZkN0YWpCS2o3dEYxRWliV3dMVUVYa3VYTHU5OU5DaE92SFVq?=
 =?utf-8?B?RG9ROW5aTDNIRWJad05yZVE5dCtJbm9ia2RZdkhuenBYRm40elFwZDREQkts?=
 =?utf-8?B?YjUxYzNYaUE5LzFhSmptWmVlODgySXNNeGt1OThOclFYYVBmVVNUdFptY0Zl?=
 =?utf-8?B?RStESm9sZ2t2YldmUmlBYkFZWEhVOGNQc2xsbnA2N2ZNM1RybWdGZENNV1N0?=
 =?utf-8?B?M05JUG1ic0FPdmZ0U25JcXNMVXQyQzM4USt1RWtwM2JLOHcxbmlod1pwR2t3?=
 =?utf-8?B?Mld1WUpnbSttR2Q3VEYvOEI0NnM0eEhTQ2pzRXBpL1VWUndNWnRuN0haUGdk?=
 =?utf-8?B?ZnR2bUJJbm1Tem1jSmtRWkZCSWV6dFkwZ3lsZE9XdFlhT2g4OWpSWmhydnBY?=
 =?utf-8?B?WUkrbVNSZkY2b0tkU2VLOGtudnFrU0JNb0xUQkNZVWZoRW1EWGhOMmdncEN1?=
 =?utf-8?B?MGpaZmVFb3VFb1UxV0lkVUJIVU5rSklncnovdXdDN2NTQlVKY1hDajI2WEdX?=
 =?utf-8?B?ZDJmNm03QVJvSURHQ2hhb1hwUnRhVnFpc0tIUStUbUJLUytMeklzRjI2aGlF?=
 =?utf-8?B?akR4Rm03TTdpWjZaSWNFSEpmQ2g4VU80TVRjdXBNSEVIcUp3YWkzOHIyYTU1?=
 =?utf-8?B?a2RrVXVJYkphczI1d1ZhcXBoektFKzVFVmFDTXFKK21zekZtRTZMVmd1NGJU?=
 =?utf-8?B?VERZUHFRV1YyaVppSXgxNEJNazlGd1AxbnVyb3h1d0NNVkZYbzVYYW9DVjdx?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EE28AE33EF04F4CB877C19536DC2A15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c031e598-279d-4f54-3627-08dbc8cc943e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 13:35:18.8981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LkzJT2z23QEQbbdAzO1eiO5Megmad9/srVIcRnj3wY0g4MUVuHqrlPkClMDH8Sag/fXPWNkmBXwOOnpm0lzsGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTEwLTA5IGF0IDE1OjA4ICswMjAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IE9uIFR1ZSwgT2N0IDAzLCAyMDIzIGF0IDA1OjQ4OjA3UE0gLTA3MDAsIEpvaG4gSGFycmlz
b24gd3JvdGU6DQo+ID4gT24gOS8yNy8yMDIzIDEwOjIyLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
PiA+ICsgSm9obiBIYXJyaXNvbg0KPiA+ID4gDQo+ID4gPiBPbiBXZWQsIDIwMjMtMDktMjcgYXQg
MTM6MDQgLTA0MDAsIFJvZHJpZ28gVml2aSB3cm90ZToNCj4gPiA+ID4gT24gVHVlLCBTZXAgMjYs
IDIwMjMgYXQgMDQ6NDY6MzZQTSArMDAwMCwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiA+ID4g
T24gVHVlLCAyMDIzLTA5LTI2IGF0IDEyOjU1ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+ID4gPiA+ID4gPiBUaGUgaW5mcmFzdHJ1Y3R1cmUgdG8gcXVlcnkgR3VDIGZpcm13YXJlIHZl
cnNpb24gaXMgYWxyZWFkeSBpbiBwbGFjZS4gSXQNCj4gPiA+ID4gPiA+IGlzIGV4dGVuZGVkIHdp
dGggYSBuZXcgbWljcm8tY29udHJvbGxlciB0eXBlIHRvIHF1ZXJ5IHRoZSBIdUMgZmlybXdhcmUN
Cj4gPiA+ID4gPiA+IHZlcnNpb24uIEl0IGNhbiBiZSB1c2VkIGZyb20gdXNlciBzcGFjZSB0byBr
bm93IGlmIEh1QyBpcyBydW5uaW5nLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+ID4g
PiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMg
fCA5ICsrKysrKysrKw0KPiA+ID4gPiA+ID4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAg
ICB8IDEgKw0KPiA+ID4gPiA+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykN
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ID4gPiA+
IGluZGV4IDdhMGZmZDlhNjU0YS4uYzI1MGNhNTM0YmI5IDEwMDY0NA0KPiA+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gPiA+ID4gPiBAQCAtNTMwLDYgKzUzMCwxNSBA
QCBxdWVyeV91Y19md192ZXJzaW9uKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3hl
X2RldmljZV9xdWVyeSAqcXVlcnkpDQo+ID4gPiA+ID4gPiAgIAkJcmVzcC5icmFuY2hfdmVyID0g
MDsNCj4gPiA+ID4gPiA+ICAgCQlicmVhazsNCj4gPiA+ID4gPiA+ICAgCX0NCj4gPiA+ID4gPiA+
ICsJY2FzZSBYRV9RVUVSWV9VQ19UWVBFX0hVQzogew0KPiA+ID4gPiA+ID4gKwkJc3RydWN0IHhl
X2h1YyAqaHVjID0gJnhlLT50aWxlc1swXS5wcmltYXJ5X2d0LT51Yy5odWM7DQo+ID4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gPiArCQlyZXNwLm1ham9yX3ZlciA9IGh1Yy0+ZncubWFqb3JfdmVyX2Zv
dW5kOw0KPiA+ID4gPiA+ID4gKwkJcmVzcC5taW5vcl92ZXIgPSBodWMtPmZ3Lm1pbm9yX3Zlcl9m
b3VuZDsNCj4gPiA+ID4gPiA+ICsJCXJlc3AucGF0Y2hfdmVyID0gaHVjLT5mdy5wYXRjaF92ZXJf
Zm91bmQ7DQo+ID4gPiA+ID4gSGF2ZSB5b3UgY29uZmlybWVkIHRoYXQgSHVDIHdpbGwgbm90IGhh
dmUgc29tZXRoaW5nIGxpa2Ugc3VibWlzc2lvbiB2ZXJzaW9uIGxpa2UgR3VDIGhhdmU/DQo+ID4g
PiA+IE5haC4uLiBHdUMgaXMgdGhlIG9ubHkgY29tcGxpY2F0ZWQgZncgaW4gb3VyIHNldCBvZiBm
dy4uLg0KPiA+IEh1QyBoYXMgbm8gc3BsaXQgaW50ZXJmYWNlLiBJdCBpcyBvbmx5IGV2ZXIgYWNj
ZXNzZWQgYnkgdGhlIFVNRCBmcm9tIGEgYmF0Y2gNCj4gPiBidWZmZXIuIFRoZSBLTUQgaGFzIG5v
IGRlYWxpbmdzIHdpdGggdGhlIEh1QyBiZXlvbmQgcHJvdmlkaW5nIHRoZSBmaXJtd2FyZQ0KPiA+
IGltYWdlIHRvIHdoYXRldmVyIGVudGl0eSBkb2VzIHRoZSBsb2FkaW5nIChHdUMgb3IgR1NDIGFj
Y29yZGluZyB0bw0KPiA+IHBsYXRmb3JtKS4gU28gbm8gbmVlZCB0byBtdWx0aXBsZSBpbnRlcmZh
Y2UgdmVyc2lvbnMuDQo+IA0KPiBNYW55IHRoYW5rcyBKb2huIGZvciB0aGUgZXhwbGFuYXRpb25z
IGhlcmUgYW5kIGJlbG93Lg0KPiANCj4gSm9zZTogd2l0aCB0aGlzLCBiYWNrIHRvIHRoZSBvcmln
aW5hbCBzdWJtaXNzaW9uLCBpdCBzZWVtcyByZXR1cm5pbmcNCj4ganVzdCB0aGUgZmlybXdhcmUg
dmVyc2lvbiBmb3IgSHVDIGlzIGNvcnJlY3QsIHJpZ2h0Pw0KDQpZZXMsIHRoYXQgaXMgY29ycmVj
dC4NCg0KPiANCj4gRnJhbmNvaXMNCj4gDQo+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiA+IEF0IGxl
YXN0IGluIEd1Qywgd2hlbiBydW5uaW5nIGluIFNSSU9WIG1vZGUgdGhlIFZGcyB3aWxsIG5vdCBo
YXZlIGFjY2VzcyB0byB0aGUgYWN0dWFsIEd1QyB2ZXJzaW9uLCB0aGF0IGlzIHdoeSBpdCBoYXZl
IHN1Ym1pc3Npb24gdmVyc2lvbi4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBOb3Qgc3VyZSBpZiBw
cm92aWRpbmcgYSBjb21wbGV0ZSBkaWZmZXJlbnQgZmlybXdhcmUgdmVyc2lvbiBmcm9tIG9uZSBr
ZXJuZWwgdmVyc2lvbiB0byBvdGhlciB3b3VsZCBiZSBjb25zaWRlcmVkIGEgdUFQSSBicmVhay4u
Lg0KPiA+ID4gPiBobW1tLi4uIGJ1dCBub3cgd2hhdCBJJ20gYXNraW5nIG15c2VsZiBpcyBpZiB3
ZSBzaG91bGRuJ3QgbW92ZSB0aGUgZ3VjIG9uZSB0bw0KPiA+ID4gPiBoYXZlIHRoZSBjdXJyZW50
IGxvYWRlZCBmaXJtd2FyZSBhbmQgY3JlYXRlIGEgc3BlY2lhbCBjYXRlZ29yeSBmb3IgdGhlDQo+
ID4gPiA+IHN1Ym1pc3Npb24gdmVyc2lvbjoNCj4gPiA+ID4gDQo+ID4gPiA+IFhFX1FVRVJZX1VD
X1RZUEVfR1VDDQo+ID4gPiA+IFhFX1FVRVJZX1VDX1RZUEVfR1VDX1NVQk1JU1NJT04NCj4gPiA+
ID4gWEVfUVVFUllfVUNfVFlQRV9IVUMNCj4gPiA+IEkgZG9uJ3QgdGhpbmsgYW55IFVNRCB3b3Vs
ZCBmZXRjaCB0aGUgYWN0dWFsIEdVQyBGVyB2ZXJzaW9uIGFuZCByaXNrIGZhaWwgd2hlbiBydW5u
aW5nIHVuZGVyIFNSSU9WIFZGLg0KPiA+ID4gSWYgbmVlZGVkIHdlIGNhbiBtYXAgYSBzdWJtaXNz
aW9uIHZlcnNpb24gdG8gYSBhY3R1YWwgdmVyc2lvbi4uLg0KPiA+ID4gDQo+ID4gPiA+IEJ1dCB0
byBiZSByZWFsbHkgcmVhbGx5IGhvbmVzdCwgdGhlcmUncyBzb21ldGhpbmcgcmVhbGx5IGZpc2h5
IG9uIHRoaXMNCj4gPiA+ID4gc3VibWlzc2lvbiB2ZXJzaW9uLiBXaHkgdGhlIFZGIGNhbm5vdCBy
ZWFkIHRoZSBydW5uaW5nIGZpcm13YXJlIGFuZA0KPiA+ID4gPiBnZXQgdGhlIHN1Ym1pc3Npb24g
dmVyc2lvbiBmcm9tIHRoZXJlPw0KPiA+ID4gR290IHRoaXMgaW5mb3JtYXRpb24gZnJvbSBKb2hu
LCBoZSBjYW4gZXhwbGFpbiBpdCBiZXR0ZXIuDQo+ID4gQmVjYXVzZSB0aGUgVkYgZG9lcyBub3Qg
bmVlZCB0byBrbm93IHRoZSBtYXN0ZXIgdmVyc2lvbiBudW1iZXIuDQo+ID4gDQo+ID4gRXNwZWNp
YWxseSB3aGVuIHlvdSBnZXQgaW4gdG8gVkYgbWlncmF0aW9uIGFuZCBzdWNoLiBUaGUgVkYgY291
bGQgc3RhcnQNCj4gPiBleGVjdXRpbmcgd2l0aCBvbmUgYmFjayBlbmQgR3VDIHZlcnNpb24gYnV0
IHRoZW4gYmUgbWlncmF0ZWQgdG8gYSBzeXN0ZW0NCj4gPiB3aXRoIGEgY29tcGxldGVseSBkaWZm
ZXJlbnQgYmFjayBlbmQgR3VDIHZlcnNpb24uIEFzIGxvbmcgYXMgdGhlIHN1Ym1pc3Npb24NCj4g
PiBBUEkgaXMgY29tcGF0aWJsZSB0aGVuIHRoZSBWRiBkb2Vzbid0IGNhcmUuIEhvd2V2ZXIsIHRo
ZSBQRiB0aGF0IGlzIG1hbmFnaW5nDQo+ID4gdGhlIEd1QyB2ZXJ5IGRlZmluaXRlbHkgbmVlZHMg
dG8ga25vdyBob3cgdG8gbWFuYWdlIHRoYXQgc3BlY2lmaWMgR3VDDQo+ID4gdmVyc2lvbi4gRXZl
biBpZ25vcmluZyBsaXZlIG1pZ3JhdGlvbiwgYW4gZW5kIGN1c3RvbWVyIG1heSBoYXZlIGEgc3Bl
Y2lmaWMNCj4gPiBPUyBpbWFnZSB0aGF0IHRoZXkgaGF2ZSB2YWxpZGF0ZWQgYW5kIHRlc3RlZCBh
bmQgd2FudCB0byBydW4gb24gc29tZSBjbG91ZA0KPiA+IHNlcnZlciBzeXN0ZW0uIFRoZSBjbG91
ZCBwcm92aWRlciBtYXkgbmVlZCB0byB1cGRhdGUgdGhlIEd1QyB2ZXJzaW9uIHRvIHRha2UNCj4g
PiBzZWN1cml0eSBmaXhlcy4gQnV0IHRoZSBjdXN0b21lcidzIGltYWdlIHNob3VsZCBub3QgaGF2
ZSB0byBjaGFuZ2UgYXMgYQ0KPiA+IHJlc3VsdC4gVGhlIEd1QyB1cGRhdGUgbXVzdCBiZSBiYWNr
d2FyZHMgY29tcGF0aWJsZSBhdCB0aGUgVkYgbGV2ZWwgZXZlbiBpZg0KPiA+IGl0IGlzIGJhY2t3
YXJkcyBicmVha2luZyBhdCB0aGUgUEYgbGV2ZWwuDQo+ID4gDQo+ID4gSW4gc2hvcnQsIHRoZSBH
dUMgcHJlc2VudHMgdHdvIGNvbXBsZXRlbHkgc2VwYXJhdGUgQVBJcy4gT25lIGZvciBtYW5hZ2Vt
ZW50DQo+ID4gdGhhdCBpcyBvbmx5IHZpc2libGUgdG8gdGhlIFBGIGFuZCBvbmUgZm9yIGNsaWVu
dHMvc3VibWlzc2lvbiB0aGF0IGlzDQo+ID4gdmlzaWJsZSB0byB0aGUgVkYgKGFuZCBkaXJlY3Rs
eSB0byB0aGUgVU1EcyBpZiB3ZSBldmVyIHN1cHBvcnQgZGlyZWN0DQo+ID4gc3VibWlzc2lvbiwg
cGx1cyBpbmRpcmVjdGx5IHRvIHRoZSBVTURzIHZpYSBidWdzISkuIE9uIG5hdGl2ZSwgdGhlIEtN
RCBzZWVzDQo+ID4gZXZlcnl0aGluZyBzbyB0ZWNobmljYWxseSBvbmx5IG9uZSB2ZXJzaW9uIGlz
IHJlcXVpcmVkIGZvciBuYXRpdmUuIEJ1dCBmb3INCj4gPiBTUklPViwgdGhlIHR3byBpbnRlcmZh
Y2VzIGFyZSB0b3RhbGx5IHNlcGFyYXRlLiBBIFZGIEtNRCBkb2VzIG5vdCBoYXZlDQo+ID4gYWNj
ZXNzIHRvIHRoZSBtYW5hZ2VtZW50IGludGVyZmFjZXMgYW5kIGRvZXMgbm90IGNhcmUgd2hhdCBt
YXN0ZXIgdmVyc2lvbg0KPiA+IHRoZSBHdUMgaXMuIEl0IG9ubHkgY2FyZXMgdGhhdCB0aGUgY2xp
ZW50IGludGVyZmFjZSBtYXRjaGVzIHdoYXQgaXQga25vd3MNCj4gPiBhYm91dC4gTGlrZXdpc2Ug
YSBVTUQuIFRoZXJlZm9yZSwgd2UgbmVlZCB0d28gY29tcGxldGVseSBzZXBhcmF0ZSBpbnRlcmZh
Y2UNCj4gPiB2ZXJzaW9uIG51bWJlcnMuIEFuZCB3ZSBuZWVkIHRvIGJlIHZlcnkgY2FyZWZ1bCB0
aGF0IG5vdGhpbmcgdXNlcyB0aGUgbWFzdGVyDQo+ID4gdmVyc2lvbiB3aGVuIGl0IHNob3VsZCBi
ZSB1c2luZyB0aGUgc3VibWlzc2lvbiB2ZXJzaW9uLiBPdGhlcndpc2UsIHN0dWZmDQo+ID4gd2ls
bCBicmVhayB3aGVuIGl0IHN0YXJ0cyB0byBydW4gaW4gYSBWRi4NCj4gPiANCj4gPiBXaGV0aGVy
IGl0IGlzIHVzZWZ1bCB0byByZXR1cm4gdGhlIG1hc3RlciB2ZXJzaW9uIHZpYSB0aGlzIHF1ZXJ5
IGludGVyZmFjZQ0KPiA+IGlzIGRlYmF0YWJsZS4gVGhlcmUgc2hvdWxkIGJlIG5vIGZ1bmN0aW9u
YWwgcmVxdWlyZW1lbnQgZm9yIGl0LiBBbnkgVU1EIGNvZGUNCj4gPiBzaG91bGQgb25seSBjYXJl
IGFib3V0IHRoZSBjbGllbnQgaW50ZXJmYWNlL2JlaGF2aW91ciBhbmQgc28gc2hvdWxkIG9ubHkN
Cj4gPiBuZWVkIHRoZSBzdWJtaXNzaW9uIGludGVyZmFjZSB2ZXJzaW9uIG51bWJlci4gUG90ZW50
aWFsbHkgd2UgbWlnaHQgd2FudCB0bw0KPiA+IHJlcG9ydCB0aGUgbWFzdGVyIHZlcnNpb24gdG8g
dGhlIGVuZCB1c2VyIHZpYSBzb21lIGNvbnRyb2wgcGFuZWwgaW5mb3JtYXRpb24NCj4gPiB0b29s
IHRoaW5nLiBCdXQgdGhhdCBzaG91bGQgYmUgdGhlIG9ubHkgcHVycG9zZSBmb3IgaXQuDQo+ID4g
DQo+ID4gSm9obi4NCj4gPiANCj4gPiANCj4gPiA+ID4gPiA+ICsJCXJlc3AuYnJhbmNoX3ZlciA9
IDA7DQo+ID4gPiA+ID4gPiArCQlicmVhazsNCj4gPiA+ID4gPiA+ICsJfQ0KPiA+ID4gPiA+ID4g
ICAJZGVmYXVsdDoNCj4gPiA+ID4gPiA+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ID4gPiA+
ICAgCX0NCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
IGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiA+ID4gaW5kZXggODQwOTE4NjBj
N2QyLi5mZTdlODNhNWJkM2UgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL3VhcGkv
ZHJtL3hlX2RybS5oDQo+ID4gPiA+ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
DQo+ID4gPiA+ID4gPiBAQCAtNDc4LDYgKzQ3OCw3IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfdG9w
b2xvZ3lfbWFzayB7DQo+ID4gPiA+ID4gPiAgIHN0cnVjdCBkcm1feGVfcXVlcnlfdWNfZndfdmVy
c2lvbiB7DQo+ID4gPiA+ID4gPiAgIAkvKiogQHVjOiBUaGUgbWljcm8tY29udHJvbGxlciB0eXBl
IHRvIHF1ZXJ5IGZpcm13YXJlIHZlcnNpb24gKi8NCj4gPiA+ID4gPiA+ICAgI2RlZmluZSBYRV9R
VUVSWV9VQ19UWVBFX0dVQyAwDQo+ID4gPiA+ID4gPiArI2RlZmluZSBYRV9RVUVSWV9VQ19UWVBF
X0hVQyAxDQo+ID4gPiA+ID4gPiAgIAlfX3UxNiB1Y190eXBlOw0KPiA+ID4gPiA+ID4gICAJLyoq
IEBwYWQ6IE1CWiAqLw0KPiA+IA0KDQo=
