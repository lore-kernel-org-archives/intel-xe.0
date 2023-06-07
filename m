Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7670AC77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 18:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A9E10E064;
	Wed,  7 Jun 2023 18:04:04 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E729710E064
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686161042; x=1717697042;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Ab4Fcw/pOMFsxAUVu8lQECAaUPSQylmbNY0etsj2Sqc=;
 b=BCoBoaPEwugVAuibsXbl38Ik5/f3IjtNVkERLcDCliXNFmNG6kF2FmCI
 h9xS4cOG6o381HAko3l7FIBE/KQhB+8csP4OVthSAbB1rk/Of2hccBIX6
 rEATSLkDO63RsaET1a8Oi+LMOEzY/m80I/knhDjRNygqQAlBW/yOtYzZS
 St3IOqvxR+3vXSXX2CqpjQDwLyjgajhsCj6s/Q2aqaHFBhpo4A9pvzAT5
 W4h6gPVZRYi3PELOaQ1stbe1E2pxAFaDtgOJPNiVgsGqwtcg71lJlBmyV
 Dz+XRQJm9pZemz0Rqblnv31Jr3gGPZsUwv2I3mbiJ9fsL2B83G2GwQBGD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="420625640"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="420625640"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 11:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="774726486"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="774726486"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 07 Jun 2023 11:03:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 11:03:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 11:03:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 11:03:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MujkQFuUpMu2In+WpCNtqWM5bDjTpeII5PVPae2D48vJX9lIcO1suIPiba4eWUVkLKNh/508RXoKLI0w9o5P40NdBQchVfTKFEoaTnNwpYmuRelHZ/UXspsn3ftRA4+cClzs7kooqsIQRSrTm43ql+yzIXWBl4caU7fsl8m9ypordkHqz8H+1oeWLH6/ZX75qLqzG0jVbqXR1IyqUkBxmQg3wo8Of41EmxI3lX5PnlWLEoAT+rNpKXqgI+ruHwMChEFsxpYZqVYgdDwgicpekgiZyktuD0kCu/+OdA5oLqrpX5S86Zi0Zu5xNKK/lSt9GhSnD//gr0tzT6+gw7az3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ab4Fcw/pOMFsxAUVu8lQECAaUPSQylmbNY0etsj2Sqc=;
 b=J1Lo+zcxLg8KbFUWL90po+LDQVVsG5zDgk0zFlNKng6p0Wy8pZcEB9EnCXd6wL5kLqto2VOdNn2xMS6SGL4n8FcGNoaKG88KPTP7GmoG8///n/CmFm9++J9q7W5fLijI9TZweycNMcqvIpmYxmZIAuTiu7NU9R5bWF8e1FrDzK58bb+e7oJxgHwWwjG/VCbG6oARl2GFLKBna6o6aqiLJWUwbLTb2ZDIEpGy7ERVdxHGNvsf4Cm42kxNK91uAn0oeNEpwCH0oZNZVI3l2d+IRYZcyvc6aP+CgdXACx/1a7+0C2Zy926iq9ZHU9vXTaDx4ED6XcvbEnu80RzsfWTGhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 18:03:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6455.034; Wed, 7 Jun 2023
 18:03:26 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 0/2] Implement rcs/ccs missing invalidations
 and flushes
Thread-Index: AQHZmWgyCNQT3F0GSUSYx/9sORlfWa9/oeKA
Date: Wed, 7 Jun 2023 18:03:26 +0000
Message-ID: <87b962bef2eeb5a8b2425e2f5ff816df2bfc6eaf.camel@intel.com>
References: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB7965:EE_
x-ms-office365-filtering-correlation-id: 9f18d414-7dd9-4efb-f8de-08db67817dcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vfscYdC6ZUL2YwsQgAoNDdvaU2UylT2iIzARzFNtQSoCQsBmyzd+zdwGmmItgZ2XU3xUmsR/at7TXwQohy+u4j2kge8N6n1QRdb3+IaFN687iZFJ9aoRJXmHycIThRFF/sAx5seGPYIagthtIr71HyZ04RJj3aOHfOsx6epn49QNSUGhMvFeHW6rOCVTHTosapzSjKIm1s+hsc0HLW2Rce/0YlFNI6nhXK6+ns6M32fMIqy+QOm1gbe4lP1cjdRy7N981AfEjWBkdGtxGUl/prB/qjAnVPq8ZZa6UVAkAcHQmLtXOVHWd7AdFLmm6n1csYSIQl48ygSPjBjbg1hdF27H18eplGObqviwo2+1mGybVYhncXzf6F/QzyDUVAE4L/oGBz3pL+cKaUDOQZlywRF9lzA/5B1m8MHOi0Wlb05QCfp8th/WSGDv01VngS9XtNR9386ec3xgh3ISsVPHm4uoyr13O0gZc8CFazAZbUO2DatpQFUeJREBUwWWaYHTmELgkPoCl91TYTwIdtk4Ulme+8g8VtKdDtBNQKdbvYKZVqW22Dif7OqpdQPFt1cA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(83380400001)(66574015)(966005)(478600001)(82960400001)(8936002)(8676002)(66446008)(316002)(38070700005)(41300700001)(76116006)(122000001)(66556008)(66946007)(66476007)(38100700002)(5660300002)(64756008)(86362001)(91956017)(36756003)(71200400001)(2906002)(6486002)(110136005)(26005)(6506007)(6512007)(186003)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkd5amViVll1ZWs0bUNWV2hEZGZsVHdjUVkxdFI2ODhHTXpVcFIyOTNmTldY?=
 =?utf-8?B?ZU1BaVcrcU1qME9Ha2kwWDV5ZU5hbjdPWHdFMWpJNmd6K0FFQVFFb3pIUWp1?=
 =?utf-8?B?YzJpTW9PWXZPWlpHdjZaQmFqU2dmUlJwQlBxTjJweXo0WUcyT0NEVm9ubUlm?=
 =?utf-8?B?M0UyaWdZcXRuT3ZhSEkvanpKcFZ2b3lnVXdTcC9IcW1wVjBLQ0VEbk5xWmFa?=
 =?utf-8?B?WDFZaHBva1lvL2RKZ1Q4MExMOVpSeTVuKzZIMjdXTStkMjBYY3NyS0ExeGtq?=
 =?utf-8?B?Y2VValJNUlk5YjNja2N3Sk5ZS1FjTk5mL1Z6aHlVdTQ1bWpLWStWMmJROXk5?=
 =?utf-8?B?K0tXc0VsRTVnWnZpaFVjM1RVcDFJdXFzZUsxS2RBUk05V3Q2VFhZS1NkbExJ?=
 =?utf-8?B?U01tNFUxd1hZSWRGR0hYZkl1MFlhRnczSFExZUo0WXNsb2FYTXRPQ2FCSCsv?=
 =?utf-8?B?S2xOOHhVbk80L2pIaEMrVlYzbGxXeUtTQzl3dHBSSnBOaTRjNjVLVnNlZFp3?=
 =?utf-8?B?QUxZM0sxMnUyM2ZtNXY3ZzE3aFNpQVFKN05oUUJsSDBaazdja2pRRy85TU9H?=
 =?utf-8?B?ZmthZ0N0VkV0N2lNektjRTRrcWJnUHdlM2k1M3pzL25QS0hncmFkVHM2aG5w?=
 =?utf-8?B?MmF4Q0l6TGxyeGtNaXZhVXFsbXlKT29qbEdobi9XQm8wVHE5UERoRGl6T1NZ?=
 =?utf-8?B?YVE1TnU2eDA5WXI5VTJrQks3UDZEY3Z0RzdzWmZaZkF2WTJLd1VFWHZwWmYy?=
 =?utf-8?B?TTVodE5zbUs0OXQzWVhRMDZ5UzJMSzBJaFZGRG5CcWRXd1RmQ3NFUmJMeHZP?=
 =?utf-8?B?cWRjN1VicW5STTUvbTRTK1JHdk50bm5FdU1WRTdZRkZSN3hld1FTMWVLTzN4?=
 =?utf-8?B?WHZhb0VLd1pRMWdzbE03VUtlNXdSRHZ0NzFQUVFIQ3JNMlZZSjVldDU2U0l6?=
 =?utf-8?B?N0dLNnQrWGJCb3ZPY2ZWQW1OM215SFN1dEpQREVXSEZhYkRGNWx6cGMvSlJp?=
 =?utf-8?B?ZXVZUkh6Tmppb1ZON1FpUVROUFAxNU9INXoxOU5JNDM1T3F1SGcvbHg4S0JO?=
 =?utf-8?B?aWNiMjVSeFZTSHpPNk1JcXUwajBLUjlxUThCR3FYNWlUQzFNTDNNZUhYMTAy?=
 =?utf-8?B?dmNqVk9OK2RjemxrbnNla0grNEtCNDBZSTZ1QTRYYURua0t1V25CZW42K3My?=
 =?utf-8?B?TitKUDlKdFBYMU9zbnRzSGV4ajN1UzlIZmFqaksxaWxtRHlMSDNPQ00xTTFw?=
 =?utf-8?B?SU5FU0t6R0ZPcVZRenU5Q29ZcURTaUFJY3JSQmlDY2lrZWs5OWwyZmM5eTQ5?=
 =?utf-8?B?VC9ROG1obUovVjNNRW1hSmJ4OGtzZVBqNUg4RjJxQ2IydFNFNnU1SzI1M1hX?=
 =?utf-8?B?WE1Oam81Q1FUNENvMno5NnpYMXRYOTVzb2M3NlVOKzBacHNxZjY0bmlFeHNs?=
 =?utf-8?B?NXlEVGJLYkVMZG90d2hBSDNMbUhtZDloMm9heitZRWJIa3B3K3JEVTlZZFcv?=
 =?utf-8?B?L3ZjQ0pZbGU0dWcwT2FWcHN2MGlJRHR6ZkpTQUhqelV6MmxhWUdGOWtoVnYx?=
 =?utf-8?B?Wmg0ZmhPN0Q0aVFEZFowUzMrZ0FxWFo5QUxwem54cHl1Y2trWHRsdUtXTHhM?=
 =?utf-8?B?eU1MRm1LYWlXQ1BNcWpOOWFCUEYzZTVjcmM4VTNuRVYvWnlKcUdoK3R1WUVn?=
 =?utf-8?B?R2V5UE9GQTJKaVdjSDQrei91L2FzN1IyTE5BOU05WGZtZjRXSk0zUTk4NkJs?=
 =?utf-8?B?WDNhVnd6ZUx2YUk5Mmt6Y1NpWGFPUWhadlBUZzVaRFNwU1hleit1aXdYK09U?=
 =?utf-8?B?RXk0MWpiZFowVWtBNXIzL1NNaktTV0I1QVoyRXZoQmxwa21hWEdnTzF5Mi91?=
 =?utf-8?B?a1VydnZjOHFZY3d1ekR5dFhSNC8xdnZEMERlUUFnZTlLNURacHUycnZrTmlD?=
 =?utf-8?B?b0hTaXhteXJUNy9wYXhkdGhYb0hlQU5vMVdUdVJ4OWRzSTN0aWJuU3Q1VjRo?=
 =?utf-8?B?Mjl3SUxFQW9yTy85SFZJTk5xTnppc3NFV2d6a1dUSnpLeDZPYUs3WTgxbmZx?=
 =?utf-8?B?dkxLSVg4cms2VFVmWHZURWVHRXM3ZStJY2R5MkUvUGMyYUJUSkJVZ2ZDcFY3?=
 =?utf-8?Q?96tcbcV78Fg6dKSIJh236y4Ot?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86340907FBED6A439153BCCDE83E63A4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f18d414-7dd9-4efb-f8de-08db67817dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 18:03:26.2081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DwBRy0TT95EwKk1iqSN/nqpJfHMvo1/nGKVu9zY4ffGCv+NviGh3mzLBVY+TTpZZbUcYzhDPITfuAUXs9qHlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] Implement rcs/ccs missing invalidations
 and flushes
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

T24gV2VkLCAyMDIzLTA2LTA3IGF0IDE5OjQ3ICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gTWVzYSBpcyBzZWVpbmcgdW5leHBlY3RlZCBjb250ZW50IGluIHNvbWUgdGVzdHMuDQo+
IEZpeGluZyB0aG9zZSByZXF1aXJlIGEgVExCIGludmFsaWRhdGlvbiBhdCBiYXRjaCBzdGFydCBh
bmQgYQ0KPiByZW5kZXIgY2FjaGUgZmx1c2ggYXQgYmF0Y2ggZW5kLg0KPiANCj4gS01EIGFsc28g
cmVxdWlyZXMgdGhlIGxhdHRlciB0byBtYWtlIHN1cmUgYW55IEdQVSBzaWRlIGNhY2hlcyBhcmUN
Cj4gZmx1c2hlZCBiZWZvcmUgaGFuZGluZyBtZW1vcnkgb3ZlciBmb3IgcmV1c2UuIFRoaXMgaXMg
aW1wbGVtZW50ZWQNCj4gaW4gcGF0Y2ggMi4NCj4gDQo+IFRoZSBmb3JtZXIgaXMgbGlrZWx5IGR1
ZSB0byBzY3JhdGNoIFBURXMgcmVtYWluaW5nIGluIHRoZSBUTEIgYWZ0ZXIgYQ0KPiBwcmVmZXRj
aCBvciBzaW1pbGFyLiBXZSBjb3VsZCBkaXNjdXNzIHdoZXRoZXIgdXNlci1zcGFjZSBzaG91bGQg
YmUNCj4gcmVzcG9uc2libGUgZm9yIGEgVExCIGludmFsaWRhdGlvbiBhZnRlciBhIFZNX0JJTkQg
b3BlcmF0aW9uLCBidXQNCj4gcGF0Y2ggMSBpbXBsZW1lbnRzIGEgVExCIGZsdXNoIGF0IGJhdGNo
IHN0YXJ0IGZvciBub24tTFIgdm1zIHdpdGggc2NyYXRjaA0KPiBwYWdlcy4gRm9yIExSIHZtcyB3
aXRoIHNjcmF0Y2ggcGFnZXMgdGhlIFRMQiBmbHVzaCBpcyBpbmNvcG9yYXRlZA0KPiBpbiB0aGUg
YmluZCBmZW5jZS4NCj4gDQo+IFRoZSBUTEIgaW52YWxpZGF0aW9uIGNhbiBiZSBvcHRpbWl6ZWQg
LyBjb2FsZXNjZWQgbGF0ZXIuDQoNCg0KVGVzdGVkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy8yOTENCg0KPiANCj4gVGhvbWFzIEhlbGxz
dHLDtm0gKDIpOg0KPiAgIGRybS94ZTogSW52YWxpZGF0ZSBUTEIgYWxzbyBvbiBiaW5kIGlmIGlu
IHNjcmF0Y2ggcGFnZSBtb2RlDQo+ICAgZHJtL3hlOiBFbWl0IGEgcmVuZGVyIGNhY2hlIGZsdXNo
IGFmdGVyIGVhY2ggcmNzL2NjcyBiYXRjaA0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdz
L3hlX2dwdV9jb21tYW5kcy5oIHwgIDQgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5j
ICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9y
aW5nX29wcy5jICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMgICAgICAgIHwgIDEgKw0KPiAgNCBmaWxlcyBj
aGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCg0K
