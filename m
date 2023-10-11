Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97F0CDB483
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 20:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878A310E1D4;
	Wed, 11 Oct 2023 20:17:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582CA10E1C2
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 20:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697055467; x=1728591467;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=JOAZAXrBO8+0yDZcjhVUS9Xr0DrP5yzRCiGIILJGXls=;
 b=FUtpl8A1Tpkd2w/ziEt2hg0w08aRvODf3pZR11dsl8+IuLffvG4sM9bd
 c0GopvG8KvrwT9kbTAFZDT6sti8/Zp9OR17mcMfXtquGa6Bs4WHDDe6/a
 lehAjf4mokQ9Q6FYW8OckuZSUUszo9mI5WbIpDoGxqD+ZGUwW/Ms3oju+
 q8HQwG4256dCp2/ikW0R4kpzsikQUR4MUORA7nCFzRWvuMMM79VWT13tg
 vrlVP5qXmXaggWFS5ZSsWfXachtnqmdLlK2D/TjjfMEe6coE+E/D+2BeS
 Ej3SvbQ/DW5GhjFcmFt07WsSDiSBD2Du8nnOXV6S+D+2A4GJx3yxif7kY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471013770"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="471013770"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 13:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="789115855"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="789115855"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 13:17:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 13:17:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 13:17:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 13:17:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 13:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VibP9Su79L6Ca2Z8y1eIySPi7NXfkcVa1/qDYd3bn1ofn51BOfgAO9jc5Ud/rywMqrxiwWJx2UOw+qr5fpIq3bJGCVCs5WFZ2TdC6Q159yVTIlJW6veAlXF89sTShMRTOwBbnFPHeTDch81F3QopPpqo4zjHYbh38nK//HDQvIEt1v3G/83H1HutID+oV31jIBoLf9iQceL0o8i6kIzzOhUNP4qNykXKnrgOr4WbH/1T6IgYYwShch6GuJbMvtSwV3/Xq4KopypWzOTEK8BmxM/E3gIJKk3Tc2w4p+z0DX8Tc8hnk3iFwIAV0WS7mggM8LDg4UJTKNVhWiZma8e04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOAZAXrBO8+0yDZcjhVUS9Xr0DrP5yzRCiGIILJGXls=;
 b=EPDp+AQ2qKmGca1yJ38OcmJ/hPAx+tx6xgifcbEPSOPoVAdt8Js4qDjZ3fCmKIEwufqd4iGCjLrpeCuSSMaOfM2YysxS3lnp4jqez4TGhmX/y7eCFpDOsdqZNZzugW8EBcXKRXwM61FQ9rp05Qb828RJyc55QatYwSiF4i5xS+DYT4VfLf8MXcqgAFWGM4qqIpjr+bRLc6LC/UIaB6OvG8mXgfcJYeqm4RwjDWXsfirP7eSaTt2pu/yG0BDXuYMFeygk73TyC0X9IaoMrDpXuoP3r/LkyrMd+Ir4BHtq9Emhb8YxP1enFu9ZnmFaAgvPW2H5GkUj2vcJTsibvMIGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN0PR11MB6012.namprd11.prod.outlook.com (2603:10b6:208:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 20:17:42 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 20:17:42 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Thread-Topic: [RFC v1 04/17] drm/xe: Add uAPI to query micro-controler
 firmware version
Thread-Index: AQHZ/Es0hJ/BNFwptkO4X80vYAgXTbBFBJ6AgAACwoA=
Date: Wed, 11 Oct 2023 20:17:41 +0000
Message-ID: <7594e54cd6eaca370ec3b8e7ee6c0270d7cde3da.camel@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
 <20231011135926.7-5-francois.dugast@intel.com>
 <c64733c1-9472-4308-89c3-43feccc32976@intel.com>
In-Reply-To: <c64733c1-9472-4308-89c3-43feccc32976@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN0PR11MB6012:EE_
x-ms-office365-filtering-correlation-id: b46d731a-b461-482e-0931-08dbca971f77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0X7YI7VDSw8NmUaaxo6kHLgf0zOt1hTI6wl/y7dNabAC5QppdDn1txL5TRBs8fCHaRcynqNui2dYL+jS7LVdzTaGn+PC9ZcH4gPHE2KjqPhEO7oT+uUmEARHzYf1aOTBn+y5nID5j8WDqVN0EFoOM0Po6TvXFq9LXkaMA6Dfnnp6/tWEKMesBd3VzMMcc8ymIHgnra9oNbcmQfrMY0PCQc96ri+rD7gift9WcLc/LIJkCOYh5obeEXNtVWRRDqdwbPbG3sQJ2aqM4fV6MezM5Wwcu1/NflMKXOSW6sovwzJ0THi6ZPA+FEpJRccA12wZhT8BHgAeyHhqi0XgKf3fqmmdabwtJ5vF2SDTnsftC7CrvNRwceMT70auViMMMubcM/wfE0JFdME1gypJl1xgBlJFML8ar0744OvhoAsGly2/O1iLDdZDTjnu1YDea2lxSqduIxGSj9Y68XE8DR5l9ELvCVSVxxKVJq2WV6mRmBOyl99hMdU++n582KuKlxWjYO/NuZOc7oPn6rPnD9w4n9OmLYvDXCYBuG4h8Ij/wVj0/OPJLF/qvSgct2EgguqFyWH0C7bS9saurm9vKqc7CL8cJKsuH35hEosK+FjlyprzL7Xt44nYKYKA48G2s9T4viJO+B2Ekki/HPWE7X1frA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(2906002)(8936002)(5660300002)(41300700001)(8676002)(6636002)(316002)(36756003)(4001150100001)(26005)(2616005)(53546011)(83380400001)(86362001)(6512007)(6506007)(71200400001)(38070700005)(38100700002)(122000001)(82960400001)(110136005)(91956017)(6486002)(478600001)(76116006)(966005)(66446008)(66946007)(64756008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFIyeXVwUVNyZDZybFFia2txSzhHUEw3Q25VbWRqSHNoWDJ3R0JtbUIxNnZt?=
 =?utf-8?B?eml6WDF0MFAwOWp1UmxabWhMMVpXUHh2dUdOVkpJTGxLbjl0cHo5cHlXc0xP?=
 =?utf-8?B?SlV3a25LTjFHc0l1SVpBVFozUWxrWEMzT2JiUFZLMUJSazZ0c2JzZGtTME5m?=
 =?utf-8?B?ZUY5ZndRWHhkWXdJSEZ2d1BJbmFkREpCNGZaYXR0TzlSU3VCOTl1WWM1MGRt?=
 =?utf-8?B?UldleHBiQm1meTF0c0xadWplWWNlVU40MnV0QlFuWTZhd3FLaFJKSzEzTWNZ?=
 =?utf-8?B?QWN4Rm5HSHJ3TzhGMXhVSU9aSTRlMlBPNlRnckkwRlZLZytPejNUalpobWZR?=
 =?utf-8?B?aGdXc1diRUZmMUlidFdKOWttTVliUEJITnRiaWVvRUxUOU90THFXbjl0Tldr?=
 =?utf-8?B?cVd1UWphU3FuV0dKRVpaVG1scXNEYkswSFlybFJCcUpMOTc5QXBYaUJ4OHJS?=
 =?utf-8?B?ZWpsOUpkNE9sUVloTHRNeGREOEJsT1dodlh1T3RDZUdCVlY3ZFlSbE9SNkEy?=
 =?utf-8?B?UERTSWJMUFVQdGhlSmF2VVBYcXlEbWZBVS9ZNk5OUWdZeHkwYVFzaXRNMTlt?=
 =?utf-8?B?ekdNUGx3NDYwdGVRb0JMdW51dTZhUjBybGlwN1NST1lPb05wRDdHL3NFZWpv?=
 =?utf-8?B?SWlIK1huNVo5YjhBZzIzb2phVkNPRDZaMFA2ZUdmelhiNDFlQUM4dDlaZVdt?=
 =?utf-8?B?YndPRzJlenRSL0RTSG1pRVlZMzg4ZVBiMHdzQ0FUTTU0TFc1YkZsdUpkV1p5?=
 =?utf-8?B?WmtjRjBESTJmUHBmSDZXcFk2Uk03ZDhQcGt3bjFvbjUySFoxMS9hdnYvdHpk?=
 =?utf-8?B?Tm9IZ1pocm9HRUNxbGxvRG5VcmJTbllzSkJoZUdWYm45MjduM1NhK2RVRjRE?=
 =?utf-8?B?S0NvUXBYdHlWMXFQcTA3N1FnaVg4b3BEYTRiMjZuU2RqYmJReGdSUkh4NHBC?=
 =?utf-8?B?cG1KUy9memNuam5GL2tLVWt5RzFERnFXYUJrUENGWEtzNU82eEdEb0wweGg3?=
 =?utf-8?B?MkREMWRuTW5keG12MWU0cVJWYUYwTUhUREh5dU5LcU40S3NCRXFEVU1ROGhX?=
 =?utf-8?B?T1hvczBaRnJYanF1Q01WWGtNWVA4S0U0UjhGbDhVYmluUkYrTUpxWWxDZFN3?=
 =?utf-8?B?b3hscHI2QU1BZGN3a2lwc3FLOEFyV0I2ejd1eHE5TW9UV3N4aEdmcWdxc3N4?=
 =?utf-8?B?aE1LN3Fmbzd0UWVYYWtGWTQyZFVZNmFIVGdKK2JibzhHbHNwcU1sSzdCekRB?=
 =?utf-8?B?L3U5VVNOaEVsMnJ4VnBTcDYyaDJ2aTB2SnJUVTBwbDdpdUJTMUtGVG96YXZK?=
 =?utf-8?B?RGd6UVkzTW4yeUlqTWNuSTFEY2ZzRG5NblAzbUxHYWVNOFpiaDRHVmpjdEhM?=
 =?utf-8?B?d2hkTVFueVVsZGhvSXpvbmkzdGhMY3Z0NEQ0QmY4aTQ1dzdGK1B0b3JIMXVW?=
 =?utf-8?B?RmZKZjlEUHdTYTNJVWlrMlJqbXBCSVZqbVBTZUNtT1VSM1g1U2ViMjdiU2Ey?=
 =?utf-8?B?emRJL3l6TTkwTGRGZE9JbDVZV0pMMWNDK1ptNnhGV1JDdU5WdmZpdnZVWU8y?=
 =?utf-8?B?VGNuOGdpS3UxMjcwczlOKzBIOWZOK3JLQVhWeTFqL2FVNVBjeis5UFRkRGV0?=
 =?utf-8?B?UjVSZjNNc2JRbjZFQklRblo1VUJGbnM4aGltLzhza0FialZUcEUzSm95SW0y?=
 =?utf-8?B?OGdnZWdXaVUyaDViUEZrUEIvTVpBWG1WWDF5NVRuMmlmN1FFTkpQVG9aUnd1?=
 =?utf-8?B?ZWt4dHFuekRvWG9lTHFiVnZ5WGRJaFAzaHJaZU8xS2FzdkhiT1JWRlh2bGxi?=
 =?utf-8?B?TXk0V1djOUUyQU40eENLNG81aThCYWVoOURkcm9GcjR0TXcyQWlMQTIxeTNL?=
 =?utf-8?B?RzFhaGUwYmNjdnh5YTNpZm5hekpDTTlWS3lUaDByY1Y4eTlUa2I4ZlBDeVhS?=
 =?utf-8?B?M2FEbjV2VXhreVdka2JDZ3NoaFM5NDYrdDUzMzRDa2FpMG5va2FCU1p5UXVs?=
 =?utf-8?B?QmYvOFo2Mi9JMlhRb1RpNU5yOS9sS3krRDljRUtnellIb2ZwdWY3QTBXTTNq?=
 =?utf-8?B?WngyWFkzbERPUlcyTUsxR3NCU3R4cVJlcmdhcHdBRmVIdk1CSXpHN0NiQTVy?=
 =?utf-8?B?cVZSbk8zNXNDWEt6aTRXSVdlc2FhUjloNmE4c3FoZEcybk8vbC9IN0thTksx?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F74B4F23DF04C345AE10AD40DB74E193@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46d731a-b461-482e-0931-08dbca971f77
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 20:17:41.9268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OL3CjC7v8s180+3lDlpD72MBYtQRdN02fUsEC7R5TsW6YAUF1CBvBnW2P+fHrFJLFEo8Cm8/iJVQPGnCvvZ+Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6012
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v1 04/17] drm/xe: Add uAPI to query
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

T24gV2VkLCAyMDIzLTEwLTExIGF0IDEzOjA3IC0wNzAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxMC8xMS8yMDIzIDA2OjU5LCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6DQo+ID4gRnJvbTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gDQo+ID4g
RHVlIHRvIGEgYnVnIGluIEd1QyBmaXJtd2FyZSwgTWVzYSBjYW4ndCBlbmFibGUgYnkgZGVmYXVs
dCB0aGUgdXNhZ2Ugb2YNCj4gPiBjb21wdXRlIGVuZ2luZXMgaW4gREcyIGFuZCBuZXdlci4NCj4g
PiANCj4gPiBBIG5ldyBHdUMgZmlybXdhcmUgZml4ZWQgdGhlIGlzc3VlIGJ1dCB1bnRpbCBub3cg
dGhlcmUgd2FzIG5vIHdheQ0KPiA+IGZvciBNZXNhIHRvIGtub3cgaWYgS01EIHdhcyBydW5uaW5n
IHdpdGggdGhlIGZpeGVkIEd1QyB2ZXJzaW9uIG9yIG5vdCwNCj4gPiBzbyB0aGlzIHVBUEkgaXMg
cmVxdWlyZWQuDQo+ID4gDQo+ID4gSXQgbWF5IGJlIGV4cGFuZGVkIGluIGZ1dHVyZSB0byBxdWVy
eSBvdGhlciBmaXJtd2FyZSB2ZXJzaW9ucyB0b28uDQo+ID4gDQo+ID4gTW9yZSBpbmZvcm1hdGlv
bjogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVl
c3RzLzIzNjYxDQo+ID4gTWVzYSB1c2FnZTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzI1MjMzDQo+ID4gDQo+ID4gdjI6DQo+ID4gLSBj
aGFuZ2VkIHRvIHN1Ym1pc3Npb24gdmVyc2lvbg0KPiA+IC0gYWRkZWQgYnJhbmNoIHZlcnNpb24g
dG8gYmUgZnV0dXJlIHByb29mDQo+ID4gLSBjaGVja2luZyBpZiBwYWRzIGFuZCByZXNlcnZlZCBh
cmUgemVybw0KPiA+IA0KPiA+IHYzOg0KPiA+IC0gYWRkIGJyYWNlcyBhcm91bmQgY2FzZSBYRV9R
VUVSWV9VQ19UWVBFX0dVQyB0byBtYWtlIENJIGhhcHB5DQo+ID4gDQo+ID4gQ2M6IEpvaG4gSGFy
cmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9z
w6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyB8IDQxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDMx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDcyIGlu
c2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+IGluZGV4IDEwYjk4
NzhlYzk1YS4uZWZiY2YyZWY0MzZlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4g
PiBAQCAtNDk4LDYgKzQ5OCw0NiBAQCBzdGF0aWMgaW50IHF1ZXJ5X2d0X3RvcG9sb2d5KHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLA0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4g
K3N0YXRpYyBpbnQNCj4gPiArcXVlcnlfdWNfZndfdmVyc2lvbihzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1
Y3QgZHJtX3hlX3F1ZXJ5X3VjX2Z3X3ZlcnNpb24gX191c2VyICpxdWVyeV9wdHIgPSB1NjRfdG9f
dXNlcl9wdHIocXVlcnktPmRhdGEpOw0KPiA+ICsJc2l6ZV90IHNpemUgPSBzaXplb2Yoc3RydWN0
IGRybV94ZV9xdWVyeV91Y19md192ZXJzaW9uKTsNCj4gPiArCXN0cnVjdCBkcm1feGVfcXVlcnlf
dWNfZndfdmVyc2lvbiByZXNwOw0KPiA+ICsNCj4gPiArCWlmIChxdWVyeS0+c2l6ZSA9PSAwKSB7
DQo+ID4gKwkJcXVlcnktPnNpemUgPSBzaXplOw0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICsJfSBl
bHNlIGlmIChYRV9JT0NUTF9EQkcoeGUsIHF1ZXJ5LT5zaXplICE9IHNpemUpKSB7DQo+ID4gKwkJ
cmV0dXJuIC1FSU5WQUw7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKGNvcHlfZnJvbV91c2Vy
KCZyZXNwLCBxdWVyeV9wdHIsIHNpemUpKQ0KPiA+ICsJCXJldHVybiAtRUZBVUxUOw0KPiA+ICsN
Cj4gPiArCWlmIChYRV9JT0NUTF9EQkcoeGUsIHJlc3AucGFkIHx8IHJlc3AucGFkMiB8fCByZXNw
LnJlc2VydmVkKSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKwlzd2l0Y2gg
KHJlc3AudWNfdHlwZSkgew0KPiA+ICsJY2FzZSBYRV9RVUVSWV9VQ19UWVBFX0dVQzogew0KPiA+
ICsJCXN0cnVjdCB4ZV9ndWMgKmd1YyA9ICZ4ZS0+dGlsZXNbMF0ucHJpbWFyeV9ndC0+dWMuZ3Vj
Ow0KPiA+ICsNCj4gPiArCQlyZXNwLm1ham9yX3ZlciA9IGd1Yy0+c3VibWlzc2lvbl9zdGF0ZS52
ZXJzaW9uLm1ham9yOw0KPiA+ICsJCXJlc3AubWlub3JfdmVyID0gZ3VjLT5zdWJtaXNzaW9uX3N0
YXRlLnZlcnNpb24ubWlub3I7DQo+ID4gKwkJcmVzcC5wYXRjaF92ZXIgPSBndWMtPnN1Ym1pc3Np
b25fc3RhdGUudmVyc2lvbi5wYXRjaDsNCj4gPiArCQlyZXNwLmJyYW5jaF92ZXIgPSAwOw0KPiA+
ICsJCWJyZWFrOw0KPiA+ICsJfQ0KPiA+ICsJZGVmYXVsdDoNCj4gPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoY29weV90b191c2VyKHF1ZXJ5X3B0ciwgJnJl
c3AsIHNpemUpKQ0KPiA+ICsJCXJldHVybiAtRUZBVUxUOw0KPiA+ICsNCj4gPiArCXJldHVybiAw
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCAoKiBjb25zdCB4ZV9xdWVyeV9mdW5j
c1tdKShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gPiAgIAkJCQkgICAgICBzdHJ1Y3QgZHJtX3hl
X2RldmljZV9xdWVyeSAqcXVlcnkpID0gew0KPiA+ICAgCXF1ZXJ5X2VuZ2luZXMsDQo+ID4gQEAg
LTUwNyw2ICs1NDcsNyBAQCBzdGF0aWMgaW50ICgqIGNvbnN0IHhlX3F1ZXJ5X2Z1bmNzW10pKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+ICAgCXF1ZXJ5X2h3Y29uZmlnLA0KPiA+ICAgCXF1ZXJ5
X2d0X3RvcG9sb2d5LA0KPiA+ICAgCXF1ZXJ5X2VuZ2luZV9jeWNsZXMsDQo+ID4gKwlxdWVyeV91
Y19md192ZXJzaW9uLA0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICAgaW50IHhlX3F1ZXJ5X2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmls
ZSkNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUv
dWFwaS9kcm0veGVfZHJtLmgNCj4gPiBpbmRleCA0N2QyZDA0NjgzMzkuLmY3Y2E1MmFiYTc5YiAx
MDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gKysrIGIvaW5j
bHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+IEBAIC00NjYsNiArNDY2LDM2IEBAIHN0cnVjdCBk
cm1feGVfcXVlcnlfdG9wb2xvZ3lfbWFzayB7DQo+ID4gICAJX191OCBtYXNrW107DQo+ID4gICB9
Ow0KPiA+ICAgDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3VjX2Z3X3Zl
cnNpb24gLSBxdWVyeSBhIG1pY3JvLWNvbnRyb2xsZXIgZmlybXdhcmUgdmVyc2lvbg0KPiA+ICsg
Kg0KPiA+ICsgKiBHaXZlbiBhIHVjX3R5cGUgdGhpcyB3aWxsIHJldHVybiB0aGUgbWFqb3IsIG1p
bm9yLCBwYXRjaCBhbmQgYnJhbmNoIHZlcnNpb24NCj4gPiArICogb2YgdGhlIG1pY3JvLWNvbnRy
b2xsZXIgZmlybXdhcmUuDQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3VjX2Z3
X3ZlcnNpb24gew0KPiA+ICsJLyoqIEB1YzogVGhlIG1pY3JvLWNvbnRyb2xsZXIgdHlwZSB0byBx
dWVyeSBmaXJtd2FyZSB2ZXJzaW9uICovDQo+ID4gKyNkZWZpbmUgWEVfUVVFUllfVUNfVFlQRV9H
VUMgMA0KPiBJIHRob3VnaHQgaXQgd2FzIGFncmVlZCB0byB1c2UgVFlQRV9HVUNfU1VCTUlTU0lP
TiB0byBkaWZmZXJlbnRpYXRlIGZyb20gDQo+IHRoZSBmaWxlIHZlcnNpb24gd2hpY2ggbWF5IG5l
ZWQgdG8gYmUgYWRkZWQgYXQgc29tZSBwb2ludCAoZS5nLiBmb3IgDQo+IHJlcG9ydGluZyBzdGF0
dXMgaW4gYSBjb250cm9sIHBhbmVsIG9yIHNvbWV0aGluZykuDQoNCkl0IGlzIGJlaW5nIHJlbmFt
ZWQgaW4gJ1tSRkMgdjEgMTYvMTddIGRybS94ZS91YXBpOiBCZSBtb3JlIHNwZWNpZmljIGFyb3Vu
ZCBHdUMgVmVyc2lvbiBUeXBlJw0KDQpJbiBteSBvcGluaW9uIGl0IHNob3VsZCBiZSBzcXVhc2hl
ZCBidXQgdXAgdG8gRnJhbmNvaXMgYW5kIFJvZHJpZ28uDQoNCj4gDQo+ID4gKwlfX3UxNiB1Y190
eXBlOw0KPiA+ICsNCj4gPiArCS8qKiBAcGFkOiBNQlogKi8NCj4gPiArCV9fdTE2IHBhZDsNCj4g
QW5kIHdhc24ndCB0aGVyZSBhIGNvbW1lbnQgYWJvdXQganVzdCB1c2luZyBhIHUzMiBmb3IgdGhl
IHR5cGU/IFdoYXQgaXMgDQo+IHRoZSBhZHZhbnRhZ2UgdG8gc3BsaXR0aW5nIGl0IGludG8gdHdv
IHUxNiB2YWx1ZXM/DQoNCnllYWggZ29vZCBwb2ludCBvciByZW5hbWUgdG8gcnN2ZCBzbyBpdCBj
YW4gYmUgdXNlZCBpbiBmdXR1cmUuDQoNCg0KPiANCj4gSm9obi4NCj4gDQo+ID4gKw0KPiA+ICsJ
LyogQG1ham9yX3ZlcjogbWFqb3IgdWMgZncgdmVyc2lvbiAqLw0KPiA+ICsJX191MzIgbWFqb3Jf
dmVyOw0KPiA+ICsJLyogQG1pbm9yX3ZlcjogbWlub3IgdWMgZncgdmVyc2lvbiAqLw0KPiA+ICsJ
X191MzIgbWlub3JfdmVyOw0KPiA+ICsJLyogQHBhdGNoX3ZlcjogcGF0Y2ggdWMgZncgdmVyc2lv
biAqLw0KPiA+ICsJX191MzIgcGF0Y2hfdmVyOw0KPiA+ICsJLyogQGJyYW5jaF92ZXI6IGJyYW5j
aCB1YyBmdyB2ZXJzaW9uICovDQo+ID4gKwlfX3UzMiBicmFuY2hfdmVyOw0KPiA+ICsNCj4gPiAr
CS8qKiBAcGFkMjogTUJaICovDQo+ID4gKwlfX3UzMiBwYWQyOw0KPiA+ICsNCj4gPiArCS8qKiBA
cmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ID4gKwlfX3U2NCByZXNlcnZlZDsNCj4gPiArfTsNCj4g
PiArDQo+ID4gICAvKioNCj4gPiAgICAqIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5IC0gbWFp
biBzdHJ1Y3R1cmUgdG8gcXVlcnkgZGV2aWNlIGluZm9ybWF0aW9uDQo+ID4gICAgKg0KPiA+IEBA
IC01MTgsNiArNTQ4LDcgQEAgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgew0KPiA+ICAgI2Rl
ZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX0hXQ09ORklHCQk0DQo+ID4gICAjZGVmaW5lIERSTV9Y
RV9ERVZJQ0VfUVVFUllfR1RfVE9QT0xPR1kJCTUNCj4gPiAgICNkZWZpbmUgRFJNX1hFX0RFVklD
RV9RVUVSWV9FTkdJTkVfQ1lDTEVTCTYNCj4gPiArI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZ
X1VDX0ZXX1ZFUlNJT04JNw0KPiA+ICAgCS8qKiBAcXVlcnk6IFRoZSB0eXBlIG9mIGRhdGEgdG8g
cXVlcnkgKi8NCj4gPiAgIAlfX3UzMiBxdWVyeTsNCj4gPiAgIA0KPiANCg0K
