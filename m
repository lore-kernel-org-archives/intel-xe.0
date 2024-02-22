Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D240EC54788
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 15:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7895410E968;
	Thu, 22 Feb 2024 15:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJD6ZxyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F3C10E96F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708615833; x=1740151833;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=GZhFMcaejkd1EvMMBPi7D/xgQ76Uhp42sRicik9XOro=;
 b=AJD6ZxyUyCFwRQ/pj8CjQ9Mu7R1Se3y+Nnw45WX7gxMkjQKGTFkd1/t/
 2Vg7Mq9qmumhLnrvWjT62LtXEsqzgJHsckXHjPqFzyv79Nb1AzpF+TzUM
 AI1sWYuAIvAKXPdJjEkO0o4fNxgTOBBFfvBYIUQADgMRJZ8rCrwzVfWrp
 aOeQdpSFcbw4S7SaGvqAY4t6Esh1V2FSmEkhK8MtvmM9kwZiyJYdtFsW+
 Y5JpuFOvVzM1laEgQCOnLnI5sdYmLCnx7ppnEvJqC9Gdyz+W3cXXXc3jc
 tRLEptFo/1iEqkPwn+xMZt3YdpnWRZDFq2+N4TBCTRR7v0zLwaYb7z0EL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13548835"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="13548835"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 07:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827564107"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="827564107"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 07:30:32 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 07:30:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 07:30:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 07:30:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdGwbyBq1vspWdK2PDYG7J0PwR18YimDWJIJ4ZctjaKrSiv+oiaaYvwXZP5a0y0u0hct1HGgn77nRIykom1jxhRygP2fhJr1QBkzb0xiw3DIXKkX+JXEqdd55iM0CYutpJ1lKNnwVw7M4K1DsNf/FBFdiEF5uhNoQQv+jNoFoTTT0XP5RORICAKXd75ZJ7QbRXObon6Tr+XQIyH62fXlpDVSQm4eij2pGIGp20UWH+1iwRbJR9tTjsGx5eWAsUzxnvnUUcK0J6FjID6QUvnWM0CQ9fwEAoH/2NnMq2dX5MZ4y9utcM4/sSil5bUR93G4EKSDjsbQbVyJkXJJw7NWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZhFMcaejkd1EvMMBPi7D/xgQ76Uhp42sRicik9XOro=;
 b=cTGMyC7TKcWIryW4LaY3MILRKt8VAVEmpwPMsi3+dRsMjLm0DYwbPDJZaDrzFmDgxcwkXNEt1vrR6Bkd7rxO5b2O1u0cxXnIFKW+eCmr7TfpqIqtWTCnjFnlNu7+kMLrLl6HCePBkw8iddoxuqM7K0B/t/b7R9l7CX+BknxP8qtbJBcChcU76GbogcJDkzFy+aiCLPPwOlPMiHsJWeihLPVnT31Xos1TjL918I13pSNB7gdgD8jzxrbVC2w61lCicz23avZo/vZLpHN7AYaPscnD7HXKFXcmw34RULLATltdkQNHX/y/Qfq1fIouj5Iqs8ZWLhvkA5epX54+1YDkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5664.namprd11.prod.outlook.com (2603:10b6:a03:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.42; Thu, 22 Feb
 2024 15:30:29 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%3]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 15:30:29 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v5 9/9] drm/xe: Implement capture of HWSP and HWCTX
Thread-Topic: [PATCH v5 9/9] drm/xe: Implement capture of HWSP and HWCTX
Thread-Index: AQHaZMo2VWRxUxpbIESZZPaEm88TtrEVFPUAgAFplAA=
Date: Thu, 22 Feb 2024 15:30:28 +0000
Message-ID: <97dedcc441b4e2dc09bacef8ca60af6c5c4036a3.camel@intel.com>
References: <20240221133024.898315-1-maarten.lankhorst@linux.intel.com>
 <20240221133024.898315-9-maarten.lankhorst@linux.intel.com>
 <aa36acf27826fb1df71bb83f55daa74958727497.camel@intel.com>
In-Reply-To: <aa36acf27826fb1df71bb83f55daa74958727497.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5664:EE_
x-ms-office365-filtering-correlation-id: 013c5dcb-7965-4e5e-d0a8-08dc33bb332b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dmr3hrf9slKdmhZ3BVOngRTSlIMVo9RtpGjtqok7E0cr5YfLHLmOi86tRC+AvxQiiJNw+Vj8S/1stNg+NFxX8dIpqPdfX9yMJYS7sN3vnmbXxElw1EGqufdo7ziHeMi92IpD1qR3fqYvDvZGZQ35Ut1JyIwdcDqNmaaUScfXd192bh6bbX4JT6MP3setCtQt6w2CqwA/+FGpMnAsEeEElNSW4iUvY11AHnXoJbllWssRs1hZYbJQfHQDOO65+Bs6d/ydrY/fjlMMHVQrCBhaQ8xEEQSgpkC+8yydngVKHHT9n/BWWo5ZrGFvuXIZIq7fHT/Whaa/R+yqa/s7FkZDkHHoJEuUIfVSSxlEDDYmuGc15p3QhXJ91WI0HXtNYiFDR8d8+Wz3ouDIIQCX/05f10xQLACgJJplUq8BzBi557PPgs+O6tFQQmBUWKW9Q0nixaGSsmw0VEW61r9ec/jxNU39GtVkqRAd8SxVVMlhDgfqdqqxM6cX8AhOMPMlm5Xqslf+RiUwPdNPaTCzo2V6OGj/ZR/0R8OIjRj7tL/wXc41qZ9rgJqXhQyFwmMt1KKBfQHGkrwax45diITS1pVrT21oxbgLeOaz6nCrvDj/vrZjb5vVkiN2YuYKgMcBjCk7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGtuVCttdmgreTR4Rkd4MmdMdERSRzZYQ2srN1dWZDRhWjM3UjVYMmlxRmVV?=
 =?utf-8?B?ZlRuVlpsRk5QeVBCMHpWajFIMWREc3ZJMERocnlUNCtzRkU2ZmRvc1R1U3NL?=
 =?utf-8?B?Q3ptY0FvWTRoRUhhZzE4VXpIVEVaVkZSZms3Z1ZzRUxXOFV2WVNSTFVqRzNP?=
 =?utf-8?B?V1IxTmRQVXhLTi9ZSGpMVmVhNnI5Mkh3L3VseUt2VFU0UzdwenpBQnc2ckY2?=
 =?utf-8?B?dTVIL3l1ZUlkNVUxMS9nMjA4bzZvZWhSYnlBQXYzWTBhWXg4WGx1Z3lPRGND?=
 =?utf-8?B?ZnNjV0hlMDYwc3h2TFFPQzdhbXZNWUtpVFZzZXpaRExsTGFkK09lYzI1SDNa?=
 =?utf-8?B?b1ZITHpVR1hvWVVRK09xckdzSjJMZFJIVUFET09YOC85M2UwQzNlQTZrUXd5?=
 =?utf-8?B?M2pPZWpmUU5NcVY4SmpsSGJsdWRQRXQzbU5pa1pYYVVDenlvQ3BRelV1SVZq?=
 =?utf-8?B?VVBmS2pDYXEyZ09FTXU4a2V3Q2htZEdka1VCYVA3UmFhZm5NejVRTkd5YXEy?=
 =?utf-8?B?a2dBajBnbFNhbkdFMVEvdm83aEJ4NkRPMXZsenFqOFRnNDZneUNuWlFWWkwv?=
 =?utf-8?B?ZFRWQjlpUTRBUUwvQTVVTGFYZ0RmSjRHT0JwUWN5Q2FRVTZNdWNZMmhNcmtE?=
 =?utf-8?B?c1M0ZXZvUWlickd3Qzc2dmlIMGQ2Q1prc1FEM2dlNE42aDBVZGJCTVFoREN5?=
 =?utf-8?B?OTJCN0h4R0hqdWROZFRuN2JRTlpiZDBVSXhUQ0dZSWYxZGp1ZFlTRkp3VXls?=
 =?utf-8?B?T0ZZUDNNV1FJV0h3bzc1ckUzcXExWkh6VkxUTTUrQjJ4V0NwdzZRNEs4QkpI?=
 =?utf-8?B?Y29TajRsQVFjbzZCSTI3U3BZempOazRFVjVRRHNhMWxOZkJHTUV2QmI4eUZy?=
 =?utf-8?B?VmkzQ1pDWXQ5TWl4eXB6V2RYTjN4RDBWM1BhaWJGTi9oejlHYWc1WHFsOVVp?=
 =?utf-8?B?bDFsMnI3VDZUV3p0RlhCa1IyME9mVjJTdEtEaGRWMnZwREswTFNBT1cvQXdL?=
 =?utf-8?B?c2ZPZmdWWVlWTWgxOERCK1dONlQ1dUM2NG5QOEN2c3NDd0djdUhVMitNWTNL?=
 =?utf-8?B?UnVKTXMzcytzL09nZGcvakl1WUxpSVV1VlhUOXFEVXQ5bmdnK1VsQW9mbU9W?=
 =?utf-8?B?MXpJdWRMeTBhcHRYVHpoMGcrak5sbGUvbjFzZVkwdVRHemhRZUJBaGExYWk0?=
 =?utf-8?B?TkNVTkpBMGdYcTAxUEJuN0VPODBuNEJSdWQySEx5WHZ3cmhiNWM2amNUZ21F?=
 =?utf-8?B?WEJ5dlFIM3RUMy93UGF6a2FxSXN0d1RuZ2NNeXFmOS91RUFMajF5ejIybXMw?=
 =?utf-8?B?NkcyamRzMllSRTVYMm9LS0JaTUJDLzBUWEJUOTZSZkE3MjdQaW5hYmZoTmhD?=
 =?utf-8?B?cVFVR3YwdTIzWTdhZkJ6eXJ3d0pWRHNkeGhjOVV5ZXRzV1dNV0pSUGFtdU5q?=
 =?utf-8?B?ZmZTWTVkcVlSL2lOckh0d3hncGFySG9IUFVteTBhYzJESVkxYi9tMUwwTzR3?=
 =?utf-8?B?OUhTb2VobEdKS1ZaYTZ2SVVWN2c3SDlkWHp5L2lSVHZqalFYNzNkejJIbVBS?=
 =?utf-8?B?bTVKdlUzRkw2NVI0RnJHZXoyN0tzQWRwTjd4YUZtRThRc3RZRXNhU0VlMVRl?=
 =?utf-8?B?RWF0MHMxM3g5K3QzWml3QWh5M1JuSHVqdk1jQ2ZNU0I1azJ6UkthVlJ0QzRJ?=
 =?utf-8?B?WVkyQi9jbnRVeDRMcUVvMGdIUG1iS0tCNDNOK093cGlmOHFXV1dKbDF5Nkpv?=
 =?utf-8?B?T0VYbVNwNjdQSUo2bUtYYXo1aU5xTkxDU2tzMW5wRHpFVml5eFBjT1FJZ2lY?=
 =?utf-8?B?T0d3SUNtN0FKZ3NET3ROQmRGK0JVRnUvNFNSNXViRkhKRnJ0OGFTcSt5Snhs?=
 =?utf-8?B?MHBqQWVlVTJCa1lGeHZjamEzTUEwK3dETzJQRVVhMS82RG5TQ3V1S2Z1S0RV?=
 =?utf-8?B?SFNWeXBWYXRrd0J6bjQ2RUFyWURHSTRKWFBkOTMwVmd6Y0pVWXRMRVIxRkQ0?=
 =?utf-8?B?UnhPaSt5aFZpT1FUb2ZHbU1JVTluczZ2WEJpY3c0NFJRd1lGWmRDdVFWS0sw?=
 =?utf-8?B?NngwbWlyZmJOYkpmNWRsMTFqdzJwSGJSVXc4WVMwMzRyc0pqQXA0OTMwQ1U3?=
 =?utf-8?B?TW5QSzBobm1RelYxQ0RJRmVtL1hJWkZBaGVhM0J5WXQ3N21pZHF2NEJsYUk4?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <603D3946E98DB74082AA46D79E344BBD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013c5dcb-7965-4e5e-d0a8-08dc33bb332b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 15:30:28.9967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDpF1it7TEEJECriW28ZNWr8bQjt2hOiLcSlC8/4RCMAgSgcxfAUneySXXV4Udq2V2KsrzD718+23j/tb1MOBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5664
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

T24gV2VkLCAyMDI0LTAyLTIxIGF0IDE3OjU2ICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gV2VkLCAyMDI0LTAyLTIxIGF0IDE0OjMwICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gPiBDYXB0dXJlIGJvdGggdGhlIEhXU1AgYW5kIHRoZSBIVyBjdHggcGFnZSB0byBhbGxv
dyBlYXNpZXIgcmVwbGF5aW5nIG9mDQo+ID4gZXJyb3IgZHVtcHMgZm9yIGRlYnVnZ2luZy4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
bHJjLmMgfCA2MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9scmMuYw0KPiA+IGluZGV4IDIwZjIzNWNkYWNhMzQuLjkzYzEzOWY4ZDRmZWQgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+ID4gQEAgLTUsNiArNSw4IEBADQo+ID4gIA0KPiA+
ICAjaW5jbHVkZSAieGVfbHJjLmgiDQo+ID4gIA0KPiA+ICsjaW5jbHVkZSA8bGludXgvYXNjaWk4
NS5oPg0KPiA+ICsNCj4gPiAgI2luY2x1ZGUgImluc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5o
Ig0KPiA+ICAjaW5jbHVkZSAiaW5zdHJ1Y3Rpb25zL3hlX2dmeHBpcGVfY29tbWFuZHMuaCINCj4g
PiAgI2luY2x1ZGUgInJlZ3MveGVfZW5naW5lX3JlZ3MuaCINCj4gPiBAQCAtMzIsNiArMzQsMTAg
QEANCj4gPiAgI2RlZmluZSBFTkdJTkVfSU5TVEFOQ0VfU0hJRlQJCQk0OA0KPiA+ICANCj4gPiAg
c3RydWN0IHhlX2xyY19zbmFwc2hvdCB7DQo+ID4gKwlzdHJ1Y3QgeGVfYm8gKmxyY19ibzsNCj4g
PiArCXZvaWQgKmxyY19zbmFwc2hvdDsNCj4gPiArCXVuc2lnbmVkIGxvbmcgbHJjX3NpemUsIGxy
Y19vZmZzZXQ7DQo+ID4gKw0KPiA+ICAJdTMyIGNvbnRleHRfZGVzYzsNCj4gPiAgCXUzMiBoZWFk
Ow0KPiA+ICAJc3RydWN0IHsNCj4gPiBAQCAtMTMzMywxOSArMTMzOSw0MyBAQCBzdHJ1Y3QgeGVf
bHJjX3NuYXBzaG90ICp4ZV9scmNfc25hcHNob3RfY2FwdHVyZShzdHJ1Y3QgeGVfbHJjICpscmMp
DQo+ID4gIAlzbmFwc2hvdC0+dGFpbC5tZW1vcnkgPSB4ZV9scmNfcmVhZF9jdHhfcmVnKGxyYywg
Q1RYX1JJTkdfVEFJTCk7DQo+ID4gIAlzbmFwc2hvdC0+c3RhcnRfc2Vxbm8gPSB4ZV9scmNfc3Rh
cnRfc2Vxbm8obHJjKTsNCj4gPiAgCXNuYXBzaG90LT5zZXFubyA9IHhlX2xyY19zZXFubyhscmMp
Ow0KPiA+ICsJc25hcHNob3QtPmxyY19ibyA9IHhlX2JvX2dldChscmMtPmJvKTsNCj4gPiArCXNu
YXBzaG90LT5scmNfb2Zmc2V0ID0geGVfbHJjX3BwaHdzcF9vZmZzZXQobHJjKTsNCj4gPiArCXNu
YXBzaG90LT5scmNfc2l6ZSA9IGxyYy0+Ym8tPnNpemUgLSBzbmFwc2hvdC0+bHJjX29mZnNldDsN
Cj4gPiArCXNuYXBzaG90LT5scmNfc25hcHNob3QgPSBOVUxMOw0KPiA+ICAJcmV0dXJuIHNuYXBz
aG90Ow0KPiA+ICB9DQo+ID4gIA0KPiA+ICB2b2lkIHhlX2xyY19zbmFwc2hvdF9jYXB0dXJlX2Rl
bGF5ZWQoc3RydWN0IHhlX2xyY19zbmFwc2hvdCAqc25hcHNob3QpDQo+ID4gIHsNCj4gPiArCXN0
cnVjdCB4ZV9ibyAqYm87DQo+ID4gKwlzdHJ1Y3QgaW9zeXNfbWFwIHNyYzsNCj4gPiArDQo+ID4g
IAlpZiAoIXNuYXBzaG90KQ0KPiA+ICAJCXJldHVybjsNCj4gPiAgDQo+ID4gLQkvKiBUT0RPOiBD
b3B5IHN0YXR1cyBwYWdlICovDQo+ID4gKwlibyA9IHNuYXBzaG90LT5scmNfYm87DQo+ID4gKwlz
bmFwc2hvdC0+bHJjX3NuYXBzaG90ID0ga3ZtYWxsb2Moc25hcHNob3QtPmxyY19zaXplLCBHRlBf
S0VSTkVMKTsNCj4gPiArCWlmICghc25hcHNob3QtPmxyY19zbmFwc2hvdCkNCj4gPiArCQlyZXR1
cm47DQo+ID4gKw0KPiA+ICsJZG1hX3Jlc3ZfbG9jayhiby0+dHRtLmJhc2UucmVzdiwgTlVMTCk7
DQo+ID4gKwlpZiAoIXR0bV9ib192bWFwKCZiby0+dHRtLCAmc3JjKSkgew0KPiA+ICsJCXhlX21h
cF9tZW1jcHlfZnJvbSh4ZV9ib19kZXZpY2UoYm8pLA0KPiA+ICsJCQkJICAgc25hcHNob3QtPmxy
Y19zbmFwc2hvdCwgJnNyYywgc25hcHNob3QtPmxyY19vZmZzZXQsDQo+ID4gKwkJCQkgICBzbmFw
c2hvdC0+bHJjX3NpemUpOw0KPiA+ICsJCXR0bV9ib192dW5tYXAoJmJvLT50dG0sICZzcmMpOw0K
PiA+ICsJfSBlbHNlIHsNCj4gPiArCQlrdmZyZWUoc25hcHNob3QtPmxyY19zbmFwc2hvdCk7DQo+
ID4gKwkJc25hcHNob3QtPmxyY19zbmFwc2hvdCA9IE5VTEw7DQo+ID4gKwl9DQo+ID4gKwlkbWFf
cmVzdl91bmxvY2soYm8tPnR0bS5iYXNlLnJlc3YpOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICB2b2lk
IHhlX2xyY19zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfbHJjX3NuYXBzaG90ICpzbmFwc2hvdCwg
c3RydWN0IGRybV9wcmludGVyICpwKQ0KPiA+ICB7DQo+ID4gKwl1bnNpZ25lZCBsb25nIGk7DQo+
ID4gKw0KPiA+ICAJaWYgKCFzbmFwc2hvdCkNCj4gPiAgCQlyZXR1cm47DQo+ID4gIA0KPiA+IEBA
IC0xMzU1LDkgKzEzODUsMzcgQEAgdm9pZCB4ZV9scmNfc25hcHNob3RfcHJpbnQoc3RydWN0IHhl
X2xyY19zbmFwc2hvdCAqc25hcHNob3QsIHN0cnVjdCBkcm1fcHJpbnRlcg0KPiA+ICAJCSAgIHNu
YXBzaG90LT50YWlsLmludGVybmFsLCBzbmFwc2hvdC0+dGFpbC5tZW1vcnkpOw0KPiA+ICAJZHJt
X3ByaW50ZihwLCAiXHRTdGFydCBzZXFubzogKG1lbW9yeSkgJWRcbiIsIHNuYXBzaG90LT5zdGFy
dF9zZXFubyk7DQo+ID4gIAlkcm1fcHJpbnRmKHAsICJcdFNlcW5vOiAobWVtb3J5KSAlZFxuIiwg
c25hcHNob3QtPnNlcW5vKTsNCj4gPiArDQo+ID4gKwlpZiAoIXNuYXBzaG90LT5scmNfc25hcHNo
b3QpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWRybV9wcmludGYocCwgIlx0IEhXU1Ag
bGVuZ3RoOiAweCV4XG4iLCBMUkNfUFBIV1NQX1NJWkUpOw0KPiA+ICsJZHJtX3B1dHMocCwgIlx0
SFdTUCBkYXRhOiAiKTsNCj4gDQo+IGRybV9wcmludGYocCwgIlx0W0hXU1BdLmxlbmd0aDogMHgl
eFxuIiwgTFJDX1BQSFdTUF9TSVpFKTsNCj4gZHJtX3B1dHMocCwgIlx0W0hXU1BdLmRhdGE6ICIp
Ow0KPiANCj4gdG8gbWFrZSBpdCBjb25zaXN0ZW50IHdpdGggVk0gc3RhdGUNCg0KSFdTUCBhbmQg
SFdDVFggc2hvdWxkIGJlIHBsYWNlZCBpbiAnSFcgRW5naW5lcycgc2VjdGlvbiB1bmRlciBlYWNo
IGVuZ2luZT8NCldoYXQgaWYgYSBmdXR1cmUgSFcgbW92ZXMgb3V0IG9mIEd1Qz8NCg0KPiANCj4g
DQo+ID4gKw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IExSQ19QUEhXU1BfU0laRTsgaSArPSBzaXpl
b2YodTMyKSkgew0KPiA+ICsJCXUzMiAqdmFsID0gc25hcHNob3QtPmxyY19zbmFwc2hvdCArIGk7
DQo+ID4gKwkJY2hhciBkdW1wZWRbQVNDSUk4NV9CVUZTWl07DQo+ID4gKw0KPiA+ICsJCWRybV9w
dXRzKHAsIGFzY2lpODVfZW5jb2RlKCp2YWwsIGR1bXBlZCkpOw0KPiA+ICsJfQ0KPiANCj4gbmV3
IGxpbmUgaGVyZQ0KPiANCj4gPiArCWRybV9wcmludGYocCwgIlxuXHRIV0NUWCBsZW5ndGg6IDB4
JWx4XG4iLCBzbmFwc2hvdC0+bHJjX3NpemUgLSBMUkNfUFBIV1NQX1NJWkUpOw0KPiA+ICsJZHJt
X3B1dHMocCwgIlx0SFdDVFggZGF0YTogIik7DQo+IA0KPiBkcm1fcHJpbnRmKHAsICJcblx0W0hX
Q1RYXS5sZW5ndGg6IDB4JWx4XG4iLCBzbmFwc2hvdC0+bHJjX3NpemUgLSBMUkNfUFBIV1NQX1NJ
WkUpOw0KPiBkcm1fcHV0cyhwLCAiXHRbSFdDVFhdLmRhdGE6ICIpOw0KPiANCj4gPiArCWZvciAo
OyBpIDwgc25hcHNob3QtPmxyY19zaXplOyBpICs9IHNpemVvZih1MzIpKSB7DQo+ID4gKwkJdTMy
ICp2YWwgPSBzbmFwc2hvdC0+bHJjX3NuYXBzaG90ICsgaTsNCj4gPiArCQljaGFyIGR1bXBlZFtB
U0NJSTg1X0JVRlNaXTsNCj4gPiArDQo+ID4gKwkJZHJtX3B1dHMocCwgYXNjaWk4NV9lbmNvZGUo
KnZhbCwgZHVtcGVkKSk7DQo+ID4gKwl9DQo+ID4gKwlkcm1fcHV0cyhwLCAiXG4iKTsNCj4gPiAg
fQ0KPiA+ICANCj4gPiAgdm9pZCB4ZV9scmNfc25hcHNob3RfZnJlZShzdHJ1Y3QgeGVfbHJjX3Nu
YXBzaG90ICpzbmFwc2hvdCkNCj4gPiAgew0KPiA+ICsJaWYgKCFzbmFwc2hvdCkNCj4gPiArCQly
ZXR1cm47DQo+ID4gKw0KPiA+ICsJa3ZmcmVlKHNuYXBzaG90LT5scmNfc25hcHNob3QpOw0KPiA+
ICsJaWYgKHNuYXBzaG90LT5scmNfYm8pDQo+ID4gKwkJeGVfYm9fcHV0KHNuYXBzaG90LT5scmNf
Ym8pOw0KPiA+ICAJa2ZyZWUoc25hcHNob3QpOw0KPiA+ICB9DQo+IA0KDQo=
