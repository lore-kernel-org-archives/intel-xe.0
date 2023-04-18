Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3748C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 18 Apr 2023 20:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6531410E88F;
	Tue, 18 Apr 2023 20:13:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269A110E88F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Apr 2023 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681848837; x=1713384837;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=f4xrChbS/2ROI6lH5DMAaJiHgJOr/lz++fRIiwOgtVY=;
 b=GOyJnVbo3VGpmotPNvN9Gh+0qABVKpSKtyJuEFgD5om2KlleQGJVsFea
 XoJWwJOa37Vt3amg2bQhL8K/vnVUA0zmwn3ag6fsHYszY8JNl1Y/7l6rC
 byfi3c4nvdb+Qe75SJCXdE3RlcOL+ct1cgpD/+6HCygdUhRD/aT+J6dM8
 9/Qt+gl8LVPDFDtLq+QhimuK2WfFsw5wbXxX+TsSzBXEu8cGnYkAOVgWX
 jEZus8mZq49y2xZLfIvCJGM8ifvy2vG5BZpCcBxlObYQG/iwez7WnPjkl
 ULxDWjgIDi+cxihI1FWTt8UdEixUnRzGDcu0pJvm7UGeSQ1BZmTkkGh89 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347129770"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="347129770"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 13:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693770057"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="693770057"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 13:13:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 13:13:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 13:13:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 13:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLgD9AIqRckVJFWcuVgP1+5WnaESV71PbIkC3XadacXWioGsQwjDW4o5dBQYp01uu08y6f4+dYOcW7wBAkNfkzI97A1ydZwMWonlLKbVv9BzVvw3kqPvkCT44eukCxrCDXUA6P0yDk8me06ZBz6TjnDyB31Yrka/qf3zaqDmC1KpIs5Pg/TqfWnND46v1DrTumpQyPh24lRnNWWjoBUPVfzPwN4KtbOhU3Ycp47lXyeauzranLX2NIltW91n7CHGOJ3EPQ4ZwCU5Fx4XI8BCjHfrsEOsFQWryzFIvZwmPtfpzLM8Nkfp9eXA6ohhQm+2xRMcPX9Ah6QT61yKwQfEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4xrChbS/2ROI6lH5DMAaJiHgJOr/lz++fRIiwOgtVY=;
 b=hjxJf4XHcla2YPkn/x3Um7E5Eu/Mzjx+X3ghirU+gKvsrPCUML/N+XhHZt5ewha/Px2bM9Hp1ipULNPBUHlMVmgZGgaCSrDXYrVvQhRHO96RDncJldtp7jzXD2/UVYNvMS+6YJM1j83oeVC+Y8bySl4GiHYRX45YbiKS+GPL/pTTICt2dH59rMGs7bLy3ciafVAlJLCbHo7GETaXNKmSG7t6qFs1iaLiZ4yVL74SnMwAwnH9iDvhbys4MBA650mfNREDk+RizZmQRTsaLTIV/deZaewyutmBBQpRX+4/ED6zLOjQxmGsNnB5hk8+kjFeWHq3ysf0kUYEKkS4+KiwvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA0PR11MB4720.namprd11.prod.outlook.com (2603:10b6:806:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 20:13:54 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 20:13:53 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [PATCH] drm/xe/tlb: fix expected_seqno calculation
Thread-Index: AQHZcfmZ9ipljgPa50u8f8cyhbiu3q8xgKAA
Date: Tue, 18 Apr 2023 20:13:53 +0000
Message-ID: <4ff8e863ad2beeba47519a2c184c84733fed38fd.camel@intel.com>
References: <20230418132742.141308-1-matthew.auld@intel.com>
In-Reply-To: <20230418132742.141308-1-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA0PR11MB4720:EE_
x-ms-office365-filtering-correlation-id: b98e63a7-4992-4695-99de-08db40496ebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BK1emMPo6bJJ3RIw2PCu4iicYPoBZPiG+hHj63dUEDy6AXm7zN142REZp/SfVGVeHAUMASqbaRbpa18uXd+RhwGXUCJtRPA+w4Rk4ub3uSTxxn4S5hKock94Inkne4Cu79w44HllMYeH9Jo5ItGqyYWuXiexUGDoeilMLHdwE43bmZYYjY6juf7kpE2Qe/JVtBxyu6JZjfxUzCHwVW7hrhgEHnSNrQ0BCfGzoEekzZimZebiNoDed4sdP96mPX5hMF0OBBu9kxhzlfzeZ0E4ED5PUNtqesTlhlRd7HPtZPKkC+tb09fIR0S8uShQXdtBPf0GNK5xtkw6Mo43zTHggwDn6ambsmLitdgPP8RBNLpt40IWjpGCLDbSFIETJFcZhz04+/SpgBI/I4CKTpl3E15ie8fLyhpUWZT2Fx5xyOHElLRh3gseyE2G5mxtXRMmTZuBVqd9Vr3FhInQ7XR5NFeVbZW6h6Wr1Zqg1Si9D0sv9+DKWxrLSfmyvEs1D0SJD0SM8JOW3fZphBejEAm1fBPPzj0b2D9OcTvq6UuZHyr9Bj1BzPGffAx6D3isEdup
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(2616005)(110136005)(6512007)(6636002)(26005)(6506007)(478600001)(186003)(66946007)(66446008)(64756008)(66476007)(66556008)(76116006)(316002)(83380400001)(82960400001)(966005)(6486002)(71200400001)(91956017)(8676002)(41300700001)(8936002)(2906002)(5660300002)(122000001)(36756003)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDdpOGNZb3BlUWt5eVNmVm9nWXRFZVhNa1ZmMHZRR2RvY292UUVtMzVyWWp2?=
 =?utf-8?B?TStNZmd2K1NuSENxWGRyUnZ5UTZNdDVDOWFMeUxxRU12SWZEdHFmbjdZUG9V?=
 =?utf-8?B?czJqZGNQSHpmZUZGc0FIcWpjTkpJY0o2NTRPZElsanA2OUtJTURVcU9FRVFL?=
 =?utf-8?B?dU5HM1Bna3pESDBwVFFHSHI5Zm5iZ1hMcmo2Ulc1N0hvek8rc0FsREhwMDk2?=
 =?utf-8?B?NXFLZGxKUzVteENXOVEwZ2xwWDNIdmhuYnZ0eFlSWWRFQUNZL05NYmMvVjdQ?=
 =?utf-8?B?U1FJNDk1T1Fpb1JRdElqR05HY25yQWtiYWpSeFY1czhrVS9CWE9TRTJiU1FD?=
 =?utf-8?B?Q0lSdWhiaVVDVlluOTRNUTRrVFByYXVOekRZeEdHc3I1NjVPbXRWQzczQlU1?=
 =?utf-8?B?MDR1RXZUYjVZYmdBNmNlcE9QU2ZEQmxPczM0eStXSmdBNnlRbFRJcWpZL3JO?=
 =?utf-8?B?cmJYdjJFR2pQQW80UW5XelFUVGJzTVlPY3VMQTRkU2w5TUZuNDFSVWR0R29Y?=
 =?utf-8?B?a2FJK0xjN2l0bHRSL01YbVY0VThlbHIzc2hOYTh3d0UyMEl3M0x2OHIzV3lF?=
 =?utf-8?B?M1VoWDJWbDhNVWdwV3R1SVJ0c1lLbDZIWG5YdU8zZExyOWFjR3hCaEMzNlNR?=
 =?utf-8?B?bGxjdWpUMEdLaFlvWGR3b0VhZEMyUXZCdEtyQlNsSHBMVENDdjUyam1wYzVI?=
 =?utf-8?B?eE9GUzJ4KzdGRHlPUmdXeE9kWkNHZnpEWmtyQTN0bUl4SXlUeWhPTlRpTTVX?=
 =?utf-8?B?ZzFmK1VGM2RJU21VK1k2dGNhTFhmWU1KQXl2QmQ2YURORGtaTUZpUHhpMVJO?=
 =?utf-8?B?S1RSN0JoWHBoY0NDZEcvbkg5SVpTLzl5VTJJSGR2TllDZGlHQlA4NWlseXl1?=
 =?utf-8?B?aGZ1TDlNWm1hY1ZkR3pQVWsvbG40dXpEM3NmZXRHOW9TdEFWNG5PNUNxMkdy?=
 =?utf-8?B?RmRHbk50L29ET2crQ25qMXJSNTlyZFIybHpwUGFDNFk0RXJkNUZ1bk1wRDZr?=
 =?utf-8?B?YkFKcW05azVRRFZzNnhLRW9lVGRlUVQxelgvdHAvTWc3UThDUzY4QVZ4TE5C?=
 =?utf-8?B?SWsxTUxLQWRhdXlnVmRlOWllRDNSYUozOGQ4aGZoVW5TRFN0RUk3K011U0ky?=
 =?utf-8?B?NkkyMUJWTDQ5b215cUlFZUdTMjJZMXNuaEdoMnRXZytzY205a3RjNXZ0Q0Fs?=
 =?utf-8?B?Z25MVk85WXBlVkVFZ0IwalV6NFprRkUwUEpyYmpEeDl2NEpmUHI0REM2cEdm?=
 =?utf-8?B?aEptZVd1UGI4bWpkNGp3dG5YVnJyZ3pBWk1VQUc0OWdFUmRHdnB1akpaaFRX?=
 =?utf-8?B?eHI2NXBHWmo5Z0hCNEFNUGVrWjNPYlFRdDRwb2NTRnJ5dzM4dTV5MjBsZ0dI?=
 =?utf-8?B?R1dFZTVySE1oSHhzRUg1ZWU4ay9lL0t4RTZwbHJoZFFKcTBwZHRFR3lLeWZp?=
 =?utf-8?B?VERyRURuOHY5S09nYU1NV3lrVVZGWFdsenM4eHVRdUZNaDAycXJBdEtBdUl4?=
 =?utf-8?B?Z1U3aW1pVHd1bEh0RUg5Ynh5Z3BUY0ZGcjBrcDNuTnQrTTFTZmh4RGVSU2Vr?=
 =?utf-8?B?K1VuRnNVd3A0NnMrcnhZaWRXY1NtekprRDVwUkdMK1FhRitoQVg2RllqR1B3?=
 =?utf-8?B?cVlSckZxdzVwT3dRV3BKT01ialZ5MHZlVmNBK0luN1luek0wUmgrUEpINExE?=
 =?utf-8?B?Vk1MSHczbGdRZVNLVWNSSUMzc2RkbElRT2pMbktLRUQwcE1zU1JmUTljMXU0?=
 =?utf-8?B?cS9JZ1ZSNUc4Skx3WktJUHlkZ29XK1k0NjFVWk9MNGVNdWpCQzJCZmdZNncz?=
 =?utf-8?B?Q1VlZlRXMWNwSzZkNk9WeEJsN3dNWUVXeHBrNFFyK2phaTErTnl3Q25iWGV0?=
 =?utf-8?B?SGR5d2tRUy92dDJaUFdVbTZIUEhJRG53VHVpRGxUZGIrdHR4dTdTcEc3TXVs?=
 =?utf-8?B?ejFNbEFTam9oK09Nc01wUGF2QVFtUmZ6QVhSMFBSNVVvQ05WQ1BBc2RuNVV2?=
 =?utf-8?B?SWRDRk83ZS9mdVQ0N0R0M0pwT1JvTlduV3BnQlZaQkExWFBVd3owMWg4Y05o?=
 =?utf-8?B?dmpLc0JoMVdsci9MWFhWM1pKVU81dXBWamtSeEFLUkRVMFhUNEFpaXpxV2xk?=
 =?utf-8?Q?uoQzjzSgbQdMEip2qNvuQedyc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9D6105F3A84B44F988944FD76EBB343@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98e63a7-4992-4695-99de-08db40496ebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 20:13:53.7445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FTnFAJvhECsQyLI1S9OI7VhqBwxw6HToRc3p1H+Lnrc6aK4OHYmrbSC69/mlaAdeeD4VWNNVbl1mVtkocgHmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4720
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/tlb: fix expected_seqno calculation
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

T24gVHVlLCAyMDIzLTA0LTE4IGF0IDE0OjI3ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEl0IGxvb2tzIGxpa2Ugd2hlbiB0bGJfaW52YWxpZGF0aW9uLnNlcW5vIG92ZXJmbG93cw0KPiBU
TEJfSU5WQUxJREFUSU9OX1NFUU5PX01BWCwgd2Ugc3RhcnQgY291bnRpbmcgYWdhaW4gZnJvbSBv
bmUsIGFzIHBlcg0KPiBzZW5kX3RsYl9pbnZhbGlkYXRpb24oKS4gVGhpcyBpcyBhbHNvIGlubGlu
ZSB3aXRoIGluaXRpYWwgdmFsdWUgd2UgZ2l2ZQ0KPiBpdCBpbiB4ZV9ndF90bGJfaW52YWxpZGF0
aW9uX2luaXQoKS4gIFdoZW4gY2FsY3VsYXRpbmcgdGhlDQo+IGV4cGVjdGVkX3NlcW5vIHdlIHNo
b3VsZCBhbHNvIHRha2UgdGhpcyBpbnRvIGFjY291bnQuDQo+IA0KPiBXaGlsZSB3ZSBhcmUgaGVy
ZSBhbHNvIHByaW50IG91dCB0aGUgdmFsdWVzIGlmIHdlIGV2ZXIgdHJpZ2dlciB0aGUNCj4gd2Fy
bmluZy4NCg0KTW9yZSB0aGFuIDQgaG91cnMgcnVubmluZyBhIHRlc3Qgc3VpdGUgd2l0aG91dCBh
bnkgd2FybmluZ3MuDQoNCj4gDQo+IFJlZmVyZW5jZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzI0OA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0
aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IENjOiBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jIHwgNyArKysrKystDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gaW5kZXggZjI3OWUyMTMwMGFhLi5mZGYw
OTIwNDgyODcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52
YWxpZGF0aW9uLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlk
YXRpb24uYw0KPiBAQCAtMzE5LDcgKzMxOSwxMiBAQCBpbnQgeGVfZ3VjX3RsYl9pbnZhbGlkYXRp
b25fZG9uZV9oYW5kbGVyKHN0cnVjdCB4ZV9ndWMgKmd1YywgdTMyICptc2csIHUzMiBsZW4pDQo+
ICAJLyogU2FuaXR5IGNoZWNrIG9uIHNlcW5vICovDQo+ICAJZXhwZWN0ZWRfc2Vxbm8gPSAoZ3Qt
PnRsYl9pbnZhbGlkYXRpb24uc2Vxbm9fcmVjdiArIDEpICUNCj4gIAkJVExCX0lOVkFMSURBVElP
Tl9TRVFOT19NQVg7DQo+IC0JWEVfV0FSTl9PTihleHBlY3RlZF9zZXFubyAhPSBtc2dbMF0pOw0K
PiArCWlmICghZXhwZWN0ZWRfc2Vxbm8pDQo+ICsJCWV4cGVjdGVkX3NlcW5vID0gMTsNCj4gKwlp
ZiAoV0FSTl9PTihleHBlY3RlZF9zZXFubyAhPSBtc2dbMF0pKSB7DQoNCldlIHNob3VsZCB1c2Ug
ZHJtX1dBUk5fT04oKSB0byBrbm93IGZyb20gd2hhdCBncHUoaW4gbXVsdGktZ3B1IGNhc2VzKSB0
aGlzIGNhbWUgZnJvbSBidXQgdGhlcmUgaXMgc2V2ZXJhbCBvdGhlciBwbGFjZXMgaW4gWGUga21k
IHRoYXQgdXNlcyBXQVJOX09OKCkuDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiArCQlkcm1fZXJyKCZndC0+eGUtPmRybSwg
IlRMQiBleHBlY3RlZF9zZXFubyglZCkgIT0gbXNnKCV1KVxuIiwNCj4gKwkJCWV4cGVjdGVkX3Nl
cW5vLCBtc2dbMF0pOw0KPiArCX0NCj4gIA0KPiAgCWd0LT50bGJfaW52YWxpZGF0aW9uLnNlcW5v
X3JlY3YgPSBtc2dbMF07DQo+ICAJc21wX3dtYigpOw0KDQo=
