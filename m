Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BFCC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 20:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A5310E474;
	Fri, 12 Apr 2024 20:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7k2dJmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5698B10E474
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 20:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712954599; x=1744490599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=S3LA06e8RPE7HQKYeShQEPGTBwCZfPLm8vw4mvYIaoU=;
 b=E7k2dJmEIJdipiHi0zrLiSYT/BG08u15VSsDYBa2GxH2Nt6J0mKv3fwG
 3v0Br5cwiAf+U+n+HaTBgj9skwBqufo3ltzKhj0RgCUiPk8nDlvpAaDYG
 GiEGLAL2EK0C8grVZZCS0dtd3UeamNkxYLS0p0OyQfQWZNLeZlaiZvkt3
 HRxLU63iI0Hjo0ZFT2PINS7HQkaT+XD89ltPcZj4uqfbva2goScZii0Hp
 druVYqyg2sQHzKE+6AVP1RfUUS36tX1k2+oOv32oNrh4C6oEHxAfc2eI4
 IIAB3OcLawTIwO1RTYvlAdnfuzfkToSfI8fWeqt/asVojQ9LlfytiZSJh w==;
X-CSE-ConnectionGUID: XbPFCW8XSEOF+ETlYYrksA==
X-CSE-MsgGUID: 2bz7dNEHQym7Cjc9pOj+Jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8535257"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8535257"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 13:43:08 -0700
X-CSE-ConnectionGUID: Z0ghlxXNRoutsZw6gsK3ag==
X-CSE-MsgGUID: GfMyh56vTUikm+FLeXJ9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21833197"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 13:43:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 13:43:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 13:43:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 13:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuXny/UN8NdEqyoxo15qeO+9dMb8+iW9FT19y1a7wDW9HGrRYIb6gJqLh75o6RVSObYdbObPSn6i3BaB6vcn18NbMig4gWe+oWDJYDjiCyfYETVvsU2Xypa+eEM1V5STJM5vOkWewzdsG7fbwUzGZIhZcsJEFgOHREkUtn6mRejyvRDBrxixPCRqridgs5mhQqks14rqeR8MrQnPkFXlBi/OrCWFRAnemHkN020zvr+M/XqZsskL8kvu+WMSVcXPADk72lpwzhYaT8EM761lLjNTNnY6BMokzzLexWQbvjK1T0eYAT7FbEL7nVqEsRNeRmSzQcLaUhnf4oSJznUQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3LA06e8RPE7HQKYeShQEPGTBwCZfPLm8vw4mvYIaoU=;
 b=MQ7zuweenik5JJUr/Zzk2Yk2+tMERXwD1KvMeV1RIhEzskHkvJyu9moKoo/w/mvbZ7oGLfwP4K/0Q/ZDdvIoV4cFuTOdYbf7cUCgP4rPVNQ76ReoQiPqvJSVi/7c1IQ2L1/tiHtEqOhnBsEIeRTXwc/75IsWKCLqcD+QoF4Yr46wyxCqaDjg2z1u0TJH0kMwWaiUTTdBa72Oi/13epk76R2cg8Djk3u0puPY4IE200hnjGmIfXbZyt91xLEoMnUbithbmKyJ25XKQM8xW+YztA9jGWht+GhWxunf5cH6WF6SdrszHFSoFnE+288i15qWKR992FBgZ+BxUhhUnaGg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.26; Fri, 12 Apr 2024 20:43:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 20:43:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 1/3] drm/xe/xe_guc_submit: Fix exec queue stop race
 condition
Thread-Topic: [PATCH v4 1/3] drm/xe/xe_guc_submit: Fix exec queue stop race
 condition
Thread-Index: AQHah4SW4XJ2C4a8MEmD1RiqHWVDLbFlJP6A
Date: Fri, 12 Apr 2024 20:43:05 +0000
Message-ID: <5001ccfc6341ba4c1cbced3f178f450413bbfed6.camel@intel.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH8PR11MB6903:EE_
x-ms-office365-filtering-correlation-id: a892d9d2-86d5-4b24-56fb-08dc5b312769
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dQjeqZtfoUjqCjoCUpCQOz1Q7bTZYyvKswa/fHz15FrS2EjgepuIhhVTRmNIsqFqQb3yNcjCMXv+wtsEn/ACmrO8p/xD5beUiQUEu7m1NqmDm7iwc6pBaXlhfZRVAxWq8Ob/NgbsBPm2CcsrgN8oNf2xZB337BdNCxFP0ReLyR9p4hb2Q6tfkr75ewwAkkBZo7Q0GWreGLULuZBd1QGiCjgyMvz1JeB+8OAYFuJF8aVMFk+IREXONdojd+4ri8KolkroOlob2f9THZ+iljI+jq/uZfj6+DcoXn8E2XuuqBLoLNddmuYL4jFJeOFFWfWGgl/o/GFzwFt7vJpApGXDkJA4zfX6k5TqEBEf46SQz28rFiybVELxVXk3AOdysdtMw0oseLVcQKqL36VoZNL7o0FwU6VWyC/nidWATj7Z5uVA44zYyzDgoykM8OEEWGqXnVSRx6YsUYN/LKcFb+LXIdZWQR0SIrl3uXN+R8FVV6NEyRH5hMH5yuYvOJOxE0qlyWHdc06Q5NDEpnRNClxAsN65Mu5hH0bse77o1Xi+nwhtDxgu4qNqMyOoLO6JoLvzFQkSuqqm2N/oGaQdWy206KVBZXcf3m1tD8cPcQyiMebStKvjLvezKWijNn4KerBMhlgoA0hz2ELQBeekJTowv7HroSmzJvxCKT4Mpmu1c891BF+3gA+Id1oibtlcNZW+XazqcVDGjBQ9zmOOySodzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXExaGJNOVBtdEg1V3VHZ0tVK2lWRy8xcVJFcVlWQ05ETVVHakFsb2tuMEFD?=
 =?utf-8?B?ZEhnRXg0SEZMWS9EaHJBY002WTlCYWE2aXdlVFlHYkhQT3MrVDUvLzEzeUVt?=
 =?utf-8?B?OFVPemVCa0RkbnBHbGl1cXJLeXhSMHFNbldSSkJaT0RML21EV0Uybkx2aXBV?=
 =?utf-8?B?ZFNOaHRoYXJBZnlRMnArSnJrdXJQVDhuRktmb1RERThxbXQ5Q0pLZFdzNG0v?=
 =?utf-8?B?VU9rY2VmcTY2Qkk3cmg0Qm0yNFU4USs0VXVEdWZHNkJHOGMxTXlBZWloK3pP?=
 =?utf-8?B?dE9QU29CbndGVDY0Z3JINXZpNml3WkxCUngvVlJETWdpaUR3YnNsaGxycWNJ?=
 =?utf-8?B?M0dsUGNFUEtlQWNmRHdzM1hTVkc5YkFDYk1CSzFkRTZ4R2llR3FMNUdNeWRu?=
 =?utf-8?B?TkxlUXZnZnBoNTUvLzZrTGVGaHFzQWdvb0YvMkJzcUxheE1Bd3pmNVVLU0hn?=
 =?utf-8?B?ZG9Mb0NZSzBYZFM1K1dCQU9UaS9Qa3JPU0FkOTIzSDZTd0w3OUthbjVrQWhI?=
 =?utf-8?B?TXp0SDVNYU1sclNVVkNoYkdGanZsTzV6V09FNk4yTm5XTGUwd0svbFREaUxN?=
 =?utf-8?B?UGNVOGVXbVhwMG52MEttQkpqSjliQ01qQkRYK1NFK0c0d1ZOaHBaQU9ncUdm?=
 =?utf-8?B?RksyL25ZbkVnSmxMUGhaTXJ2RXpLZmJKV3F5cTlJamFnQTN1MUtOR3F0bUxF?=
 =?utf-8?B?SmJvS3Y4UFN2UDkzMk5ZNEpPWTJISlJXbGR1SGFkNzI0SW5YQS9uUkZFWTJs?=
 =?utf-8?B?aFBuK0tlTmtYeCtZNXBwZDAvU2hNaVRCODdNQ0lSN0wxYzVsK3l4cGdOZjlQ?=
 =?utf-8?B?eTAyRXIrTnF2WlhYblpldUxLaGZRS2RKbkZtZ2dUWEFJOUJpOE9DdG44YmlF?=
 =?utf-8?B?VFA2Q2hrN0FJS2VpcjFQa2RxTllzZmRIZitXQUpSR3diK3JnWkI2bjA1UE5m?=
 =?utf-8?B?ZUVkRnptU0xVZkV1Q2JXeDVWVjByL2FOeExmbGlIRkRFM1hMdTdlSzR0a3RI?=
 =?utf-8?B?OExzZVRJNVVMK0FjZDFUWWZMN3dzclRSZWl3SVhmUkwyM2ZmWm92Zi9YYzBX?=
 =?utf-8?B?OWs4TTcvNEZRN0hPNy9DaGRzVk5GdTVkekhXL3Rzek53TUsvUFZaVHlTRkls?=
 =?utf-8?B?MlVYTUlRb3FqNHN1bm1ycGx5aHZTblQ0czVNd2FLeTRvb2hrZjhVV1pCWTEz?=
 =?utf-8?B?bXdOYXN6cVZ4Q3dxdnNuUEtES0FNQzI1U2pXS2tad1EwV1Nta05lRHdyQVBP?=
 =?utf-8?B?UkpiZ1VaejN5UFdoS3AxR3kveXFJSjdXTDNUWEdQcjg3WDFORVA5Y2pESFgx?=
 =?utf-8?B?T0dDR21KQkI4WHRZMjJKNmRRbHNKOXNuT0ljY2tKU3FnVkJFZlAwVzFRV2xV?=
 =?utf-8?B?dDJKVUQwYm5sUHU2MHJrWnc3K3NkVFBudGY3cEJrSU5vQ3ljSXFRMC9xQnhR?=
 =?utf-8?B?MjVDNE9ERWJRVm82TExsczRXTHB1RFdRN0NRSHBlSW9KbTE1UjBCSHU4dHdT?=
 =?utf-8?B?cEZuc3FuTVBXcGVGbEo2U3BRL21WUTdvT2F2SGhOdVpiNGQzMFVod00rZk5o?=
 =?utf-8?B?SUFnL25aN0I0dVlpbGduMGt5bnRFN2N4M292NFM3d1hNU3VmMFhXQXBjdHR4?=
 =?utf-8?B?RGErSWd6dGlubWNNR1ZUN3dkNTdDSHIxbW9sT0h3MERRemZGM2ZlQmtvQ0dS?=
 =?utf-8?B?aGNjT3RxdTE4VHY3cUpScHh4NzFnVUo2NmNCVCt0MWV2eVk5NHdwQ2x5MXZK?=
 =?utf-8?B?RDZxRXQvTzdNUmdkUi8zQkdZU1BROHFsdWNyRi9ucmkwWUFhbXUzVXpyNUJW?=
 =?utf-8?B?bGFiUXI1dWVadmVpRmtyaDI1U1RBdy90UjBvQTYxU216KzZ0TnQ3Z1dVbWdp?=
 =?utf-8?B?a0NzamlCNjJRV0VlcVBIRkhDdTVaN1RNcmtsUWJEZENSMVZkK3puS1p2ZGpN?=
 =?utf-8?B?Z3dDUzU5MGNoTkdRYTdGQ2tRS2QxVTlZQnR6bG43S3Z1d01BM2NGMG1OeE5I?=
 =?utf-8?B?ZmVWWFNwNmR5aU1zK0tnbXBYUHcyT0xqYVdwQ0pnd0praCsvcDFqcHF1VjRL?=
 =?utf-8?B?WE9SbTZVVXRqQjJFQWpsS0pGQ3haVENCcHBvZ3p6b3RRdGY0bld4QTRPc3Ay?=
 =?utf-8?B?S28yWXptQmlNUUJvQy95N1cwV0IwWVBteEVZcHFVelp4NGxKRDgxQ1BhUnox?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B145888246717448B62014E0FF9BA5EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a892d9d2-86d5-4b24-56fb-08dc5b312769
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 20:43:05.2311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyNMosVdTElyOX1UgFBIBsm1eJ3FZ4dKPUeuZC2/bFLfYrKOcrANCGOf10mPkgRsyPJpSx3OixvNmagad1gUstUQ9F8XT9D8Vrl8EUzrb8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

T24gRnJpLCAyMDI0LTA0LTA1IGF0IDEwOjU1IC0wNzAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
Cj4gUmVvcmRlciB0aGUgeGVfc2NoZWRfdGRyX3F1ZXVlX2ltbSBhbmQgc2V0X2V4ZWNfcXVldWVf
YmFubmVkIGNhbGxzIGluCj4gZ3VjX2V4ZWNfcXVldWVfc3RvcC7CoCBUaGlzIHByZXZlbnRzIGEg
cG9zc2libGUgcmFjZSBjb25kaXRpb24gYmV0d2Vlbgo+IHRoZSB0d28gZXZlbnRzIGluIHdoaWNo
IGl0J3MgcG9zc2libGUgZm9yIHhlX3NjaGVkX3Rkcl9xdWV1ZV9pbW0gdG8KPiB3YWtlIHRoZSB1
ZmVuY2Ugd2FpdGVyIGJlZm9yZSB0aGUgZXhlYyBxdWV1ZSBpcyBiYW5uZWQsIGNhdXNpbmcgdGhl
Cj4gdWZlbmNlIHdhaXRlciB0byBtaXNzIHRoZSBiYW5uZWQgc3RhdGUuCj4gCj4gU3VnZ2VzdGVk
LWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgoKUmV2aWV3ZWQt
Ynk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IC0tLQo+IAo+
IHYyOiBFeHBhbmQgb24gY2F1c2Ugb2YgcmFjZSBjb25kaXRpb24KPiAKPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAyICstCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQu
Ywo+IGluZGV4IDljMzBiZDlhYzhjMDYuLjFhNmFiYjEwYTk2MGUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfc3VibWl0LmMKPiBAQCAtMTQzMCw4ICsxNDMwLDggQEAgc3RhdGljIHZvaWQgZ3Vj
X2V4ZWNfcXVldWVfc3RvcChzdHJ1Y3QgeGVfZ3VjCj4gKmd1Yywgc3RydWN0IHhlX2V4ZWNfcXVl
dWUgKnEpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICF4ZV9zY2hlZF9qb2JfY29tcGxldGVkKGpvYikpIHx8Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX3NjaGVkX2ludmFsaWRh
dGVfam9iKGpvYiwgMikpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdHJhY2VfeGVfc2NoZWRfam9iX2Jhbihqb2IpOwo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX3NjaGVkX3Rkcl9xdWV1ZV9pbW0oJnEtPmd1Yy0KPiA+c2NoZWQpOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzZXRfZXhlY19xdWV1ZV9iYW5uZWQocSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc2NoZWRfdGRyX3F1ZXVlX2lt
bSgmcS0+Z3VjLQo+ID5zY2hlZCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKg
wqDCoMKgwqDCoMKgwqB9Cgo=
