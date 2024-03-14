Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB730C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 15:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8415E10E3DD;
	Thu, 14 Mar 2024 15:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTMaWIlo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E23F10E3DD
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 15:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710431370; x=1741967370;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ESi+7qsJVxZTITLRy5tBK088SdaKdRRIueCp5foPxSs=;
 b=WTMaWIlop9Ma98EuQGfwWUVeva7ERL0RZWwzCo5YaI2ldufcx+LbglVR
 yno1WeXWbDGk0UOh+ig5EN4lelG7E3M42Vpc1B/4agfLCP2VR1CHiiXHe
 SRuBkb6IxdyeLnBCqW6OS4aFdY08OH+ezuZy1X2xg8JftQOZwHc9q2Ww/
 GmLOZAygfuuhvnqBAXJW2fw0454WPT2+FhzxQoGo+8bBnBx1/oUUllzbc
 OXsfqp+pmTaV04ezT9JZ5BPfAsK7Ppdf1RT8VqssNrp05Q6dHeS/a6Xak
 NcaCzqUXPkhj872IyFJFyk+TIRYByE16/OtTU82vLWNh1HRqhvOWD1Cbn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9037049"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="9037049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 08:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16923419"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 08:49:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 08:49:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 08:49:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 08:49:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 08:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQM3LdKiwNp6p0X0e8vc2ljbjlk0K2f7TgiJzFF9xYxvs+EN+7mSBSgW8O5jMNzMaBZG7NiqkaoxjIvZMAD202HEq9vbptVbSx7BSRq7B/p6CX/ZLam0IbfJN/Eto2Ihil/cDjk02O6hagj2PkPp74+TpqVbE16J/zYwta4L2edGEgtl+Qx1TH/8Qln3Br9E05QGz8QzaMTmUnNRx8GtlwdLEMUQnqivTK6a3Ko4yMmjH5L5gCf4bjsDPaRk6EpyRc4K0CdBoJ4FcowbRvzs3H/yIUdk9GtZoanE121WPLf14faoG97jko3XcATbIemX0e14BTbu4m2Y7eRcgVCY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESi+7qsJVxZTITLRy5tBK088SdaKdRRIueCp5foPxSs=;
 b=lsrlkS+U/k9tZJmZyUGGN37YVPArxgKvaQfgUUB2Ammyyidm74zlKl1uJ7dZ9XVeQmTEZdwjq9fYz8IA+FgMjBI2F6aDdY2mAkXABLOiKZMLJ0cgob1y6hmN9+z3PHnMPXja9dzTvi+WgFFSQ4uqLnnypYcJ5JpJJMK9h6ScEKNO6PlKhs0ic+8h6joWTxrFQMVBvACP5G/S81SaiVdlXLpoAjY4r+nnDxG1KvnGrLV/oVDOMWdVq2yZlMJnmsgjcurApOo+GSsZwinaUWX8nlIeglgiTsCnA9/MpsIm+yrHWvHZRyIQ4h6hPfxpzwd44tO9WM42+TFEv2RABhT5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB7493.namprd11.prod.outlook.com (2603:10b6:510:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 15:49:25 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7cad:cb8a:117e:9f96]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7cad:cb8a:117e:9f96%4]) with mapi id 15.20.7386.015; Thu, 14 Mar 2024
 15:49:25 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2] drm/xe/gsc: Handle GSCCS ER interrupt
Thread-Topic: [PATCH v2] drm/xe/gsc: Handle GSCCS ER interrupt
Thread-Index: AQHabkQzOZ85twWhCkK6zso5vsAk4bE3cdaA
Date: Thu, 14 Mar 2024 15:49:25 +0000
Message-ID: <48a232531140a3e74e0446a2cb3aa2bab2b5bd45.camel@intel.com>
References: <20240304145634.820684-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240304145634.820684-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB7493:EE_
x-ms-office365-filtering-correlation-id: 77dd5c7c-7e63-42b0-0c61-08dc443e531b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gTblFpvxCavVrJThW/Zo0oIhJM01W8qS4f9nUvsVjacj5D5k0ICfOwiFwNS/v7GmSAGIT79TuajziyM+IuSvvBx9cPTAz7ERJR9ad5Gz5dmXPiqpzCQNqHuxM3kqgkbgcbByBfQ+OL37m/zWr1KViFneYr9uFB9HsIrfOpXMyeY0wvErYyATxy7+FCX/P12SRIAUE6AT8g3J5NlJQbH2fKzKQunsyYUsWl4L4C17vg7oGISo6yfyKKVJWrNoFDjd4CkcuTi1S0Lz2Uoaxm+99/GMxRvih6K1phX5pcUOW5GziR1ldiVBLmxQds2doe0jh6Too9qKskdUSJLfAwmyVOC/+BlzTgdWU0OZ9FIU7QAmFVR2+3DfAVq6SzoJ8MROPZl8zMzHhI5QLBggZhA6YcsLSB746OLseI0kRs9hsR/eSZ2ZwO1lFc+twvoX85jn5ccle2m+bqPhCtBULbM1qYQdVjQIbOUuL96oKh48ENnqK0lsM3uvo7w16zauPwcbMWL+ev2GveVm+c95/JPx7iwqqldNv3imr3fcM9OTMloE8F8PhqGw0adFigd+0CgctU7SiKCbFL0qZU8BMzTG4J6Q8ydPdCba5Ingv2M+DlVMziYqdPu2O6d5AxlTP+tC3glijXc4y6MIg2Q+1rV2+W+goNiNAcEqdkNb1nK69+n4m3TBtEqkj7uhlicUxLWAPCHv5Wkpy4Il9c6p02bjO4iCE4mU4UHUgp0JU8iOAbo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3dsQ0tNRlFzZXlpcWpUWTRYanppTlpVdzU5MS9MUi84VXRWTVpwbnk2UTE4?=
 =?utf-8?B?d1hGTHpCS3FjWFhkeVAvNGs3TUNjTGI1MElnakxOaGJIdXRNd2ZTOU9JU0JR?=
 =?utf-8?B?c3dWY0E2eGI5SE8zQThHNUFVMDRmNmhRZVcrZGd6QnlsQ3lQQThWYUZBV2pj?=
 =?utf-8?B?Vjh0YVV6SmRvaGRHRWhiVWRhOTdkeSthTVQrSVdBbmJsbGhzWEIrcjFrYWZw?=
 =?utf-8?B?aVJjenlSVjF0NjZQdUJlSW1zdlpkWTlkeWJINE5KeElMQzZncWVBMHhaMWds?=
 =?utf-8?B?U01UK3RjOE44QWh3YjE4Q29WSTRqcXNVUEp1VTloek83ZDc4Q3htN2k3Ymlj?=
 =?utf-8?B?dWZ3Qld1SFJKTUJrUmFEOWgrWXd0WnlUVUw3Y05CbmZDSHBYQnhnWTg4U1Ux?=
 =?utf-8?B?YVlCZjlmaTc5WVFLV1ZadWRsSXJHd3RDNVlMaDNZWkxhbE9KVzl0dTlmTzNC?=
 =?utf-8?B?dExlamlnVTRFbnlndUdJbDUxUEFYeURpVU92Zmo0MGdNUDc5d1hPSnFOaGZS?=
 =?utf-8?B?VmQyUk04Mjl3WTVmMXpsOVgrS0xMYisrSUJrbzlFREs3a1orVUk0QTNNZWYv?=
 =?utf-8?B?MnhWczRxSDhBZGljZUNpd3pwc0JnY3hpcUpxQnFBaVFjbC8vSS9iQk1tekNB?=
 =?utf-8?B?bExTN2xhMndCalFHMy9wdERyVklWNWZPWXZyS1RXTDI3enZVWS90TzlBQzhE?=
 =?utf-8?B?endDLzROUHdGekZ0UFluVElPckhKd3dSNG1jcTd0cG4wMjJYazVkV3FRb21Z?=
 =?utf-8?B?U0ZIQUl5eXhQVTlaY3kvMmtwQ3ZjcTl3ZFZJOXVBUUovOGdybjNtYTY0eUIx?=
 =?utf-8?B?RUJvck1KSmVLNms2N2VvbGV5QlIxQzA1QmV5RVBuV25Lc284MFg2L0hRWW85?=
 =?utf-8?B?ZHpQdDJ1S2VQS1pJR2FrT1lNK0VTNWdxVUNydVdVSzhSTm9SSU5TY1EzVkFt?=
 =?utf-8?B?dlhsTFcxK0NkTStyakw1VXNvNUVCMlZ0dlVtUm9aenFZcVl0cFU4WmpZWkFQ?=
 =?utf-8?B?SGk2cW9PUy9FQzFoeWk5TCt2MEpBL3ZJUzVpamxKWEZVVnRobEpuWmZzbHkx?=
 =?utf-8?B?Y1pjL0VKTDdUZ2JOK0Zkb1ZaT3lJU21CZFFFSTJxYjJ2RTEyYy9icnVGOEow?=
 =?utf-8?B?cS84Sm5yc1QwVXhMRmhlQlZyNUNWU2xuYTd2blc0cXNDczRyUXN4Yk9oTjF6?=
 =?utf-8?B?ait2RGN0MDRyTmM0NjRNNVhSZzQyVEpDZGtxcGh3UE9uTlE3OHRua1dxbG9R?=
 =?utf-8?B?dEZNeEV0ajdtZ3d3cTh1alJBaVNiT0ppdWdmRUN4OEdVb2VheVZsVGFSNzBE?=
 =?utf-8?B?RjBncGZiRzZJcHVET3hsYVdjRGNIWDRMSnQrRjhMalpEc1NBa1lHY1FSZENh?=
 =?utf-8?B?MHFra0pTN2hraE5KNDhmenh4VWZqTnZjVmU4REFIR3Y1bWYybzVPWVdQZHQ3?=
 =?utf-8?B?SUxGdGM1TWRHbTdRanhza0NNWXJIOG1JQjB3MDE0Z1p1V0tpQUFnNjB0WkZN?=
 =?utf-8?B?Y2svMWtWVXVvTC9Xa3NpMURZMXhrOS9jUnlNSm5jWnA4MHZSY3VrbHIwZ0li?=
 =?utf-8?B?MGYzcEpyd1RUd2tUYjhEaHNOMHZkcGlpVWRDVFZuSTN3NElTMUt6RUVCRFc3?=
 =?utf-8?B?dVZJSWtHd2JNZkt2NnUwUHBCZHpUN3BkbjZqeWU1WldjaXgrSzZMQlJjeEI1?=
 =?utf-8?B?aWF5blZubEYvQ2JjdStPVHR0enlEaXFFMTEwTlltKy8vVVNLb1VMa2xvR1hV?=
 =?utf-8?B?c2tydENHNzFrQnNlY3B6cEhuT0hwMnZoOHBvREFTZUttRi9nMGMxd3BSejdr?=
 =?utf-8?B?aGhaUUUydkI0WlZyZWwxNHJ6ZWkySFJ6M2NTeGRXQjJOZkNlemMvcEJBcWMr?=
 =?utf-8?B?YVY0RVJmSHBYMUNHSmI5TE1tdUFxUVVFZkRBc0FRR2pHMXBnWkxoVHVSV0FV?=
 =?utf-8?B?MW5zRXFtOTRtMnVxTVNWclpWV21qQVhlZ3M3OTcvNndJa1p0dnpyVmZ2NDNv?=
 =?utf-8?B?cDh6R1ltT1dYZThMNHUvTER6dFBTTHYxMFVKd2I0TG8rQVQ5dDlVMms3Y3VJ?=
 =?utf-8?B?bzN0SUU0WUJFWUdzTjB4SFAxcXloVFRMaEpUUHlBdVRNdWVLbVdyTjRzdG5K?=
 =?utf-8?B?d1JlUVk4RTUwc01jSUN4U0tQQzJZaUpUUE53NHlHUWFVSHllM0xQeUQ0czlY?=
 =?utf-8?Q?4oW0hmrwPuy4Iz1wGibU6mI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <543AA7A79B258D469DF773148775A8B0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dd5c7c-7e63-42b0-0c61-08dc443e531b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 15:49:25.2438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgjvGqVZSa8/SnHEf6KKEknjUaJpw9tOyOQ5BFD7NrR2nomGqplNpGrioEmTcMpaNf1y/q8Iv1CwMjyuoxvjJSZuDXZWcepTkzWIIqPkqQctVVlybg/52G6q65Zb7+RV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7493
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

TEdUTSAtIGkgc2VlIHRoZSBHU0MtY2xhc3Mgc3BlY2lmaWMgcHJlZW1wdGlvbiBvdmVycmlkZSBp
biByZXYyIGFzDQpkaXNjdXNzZWQgLSBUaGFua3MuDQoNClJldmlld2VkLWJ5OiBBbGFuIFByZXZp
biA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KT24gTW9uLCAyMDI0LTAz
LTA0IGF0IDA2OjU2IC0wODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIHdyb3RlOg0KPiBTdGFy
dGluZyBvbiBYZTIsIHRoZSBHU0NDUyBlbmdpbmUgcmVzZXQgaXMgYSAyLXN0ZXAgcHJvY2Vzcy4g
V2hlbiB0aGUNCj4gZHJpdmVyIG9yIHRoZSBHdUMgaGl0cyB0aGUgR0RSU1QgcmVnaXN0ZXIsIHRo
ZSBDUyBpcyBpbW1lZGlhdGVseQ0KPiByZXNldA0KPiBhbmQgYSBzdWNjZXNzIGlzIHJlcG9ydGVk
LCBidXQgdGhlIEdTQyBzaGltIGNvbnRpbnVlcyBpdHMgcmVzZXQgaW4NCj4gdGhlDQo+IGJhY2tn
cm91bmQuIFdoaWxlIHRoZSBzaGltIHJlc2V0IGlzIG9uZ29pbmcsIHRoZSBDUyBpcyBhYmxlIHRv
IGFjY2VwdA0KPiBuZXcgY29udGV4dCBzdWJtaXNzaW9uLCBidXQgYW55IGNvbW1hbmRzIHRoYXQg
cmVxdWlyZSB0aGUgc2hpbSB3aWxsDQo+IGJlIHN0YWxsZWQgdW50aWwgdGhlIHJlc2V0IGlzIGNv
bXBsZXRlZC4gVGhpcyBtZWFucyB0aGF0IHdlIGNhbiBrZWVwDQo+IHN1Ym1pdHRpbmcgdG8gdGhl
IEdTQ0NTIGFzIGxvbmcgYXMgd2UgbWFrZSBzdXJlIHRoYXQgdGhlIHByZWVtcHRpb24NCj4gdGlt
ZW91dCBpcyBiaWcgZW5vdWdoIHRvIGNvdmVyIGFueSBkZWxheSBpbnRyb2R1Y2VkIGJ5IHRoZSBy
ZXNldDsNCj4gc2luY2UNCj4gdGhlIEdTQyBwcmVlbXB0IHRpbWVvdXQgaXMgbm90IHR1bmFibGUg
YXQgcnVudGltZSwgd2Ugb25seSBuZWVkIHRvDQo+IGNoZWNrDQo+IHRoYXQgdGhlIHZhbHVlIHNl
dCBpbiBrY29uZmlnIGlzIGJpZyBlbm91Z2ggKGFuZCBpbmNyZWFzZSBpdCBpZiBpdA0KPiBpc24n
dCkuDQo+IFdoZW4gdGhlIHNoaW0gcmVzZXQgY29tcGxldGVzLCBhIHNwZWNpZmljIENTIGludGVy
cnVwdCBpcyB0cmlnZ2VyZWQsDQo+IGluIHJlc3BvbnNlIHRvIHdoaWNoIHdlIG5lZWQgdG8gY2hl
Y2sgdGhlIEdTQ0lfVElNRVJfU1RBVFVTIHJlZ2lzdGVyDQo+IHRvIHNlZSBpZiB0aGUgcmVzZXQg
d2FzIHN1Y2Nlc3NmdWwgb3Igbm90Lg0KPiBOb3RlIHRoYXQgdGhlIEdTQ0lfVElNRVJfU1RBVFVT
IHJlZ2lzdGVyIGlzIG5vdCBwb3dlciBzYXZlL3Jlc3RvcmVkLA0KPiBzbyBpdCBnZXRzIHJlc2V0
IG9uIE1DNiBlbnRyeS4gSG93ZXZlciwgYSByZXNldCBmYWlsdXJlIHN0b3BzIE1DNiwNCj4gc28g
aW4gdGhhdCBzY2VuYXJpbyB3ZSdyZSBhbHdheXMgZ3VhcmFudGVlZCB0byBmaW5kIHRoZSBjb3Jy
ZWN0DQo+IHZhbHVlLg0KPiANCj4gU2luY2Ugd2UgY2FuJ3QgY2hlY2sgdGhlIHJlZ2lzdGVyIHdp
dGhpbiBpbnRlcnJ1cHQgY29udGV4dCwgdGhlDQo+IGV4aXN0aW5nIEdTQyB3b3JrZXIgaGFzIGJl
ZW4gdXBkYXRlZCB0byBoYW5kbGUgaXQuDQo+IFRoZSBleHBlY3RlZCBhY3Rpb24gdG8gdGFrZSBv
biBFUiBmYWlsdXJlIGlzIHRvIHRyaWdnZXIgYSBkcml2ZXIgRkxSLA0KPiBidXQgd2Ugc3RpbGwg
ZG9uJ3Qgc3VwcG9ydCB0aGF0LCBzbyBmb3Igbm93IHdlIGp1c3QgcHJpbnQgYW4gZXJyb3IuIEEN
Cj4gY29tbWVudCBoYXMgYmVlbiBhZGRlZCB0byB0aGUgY29kZSB0byBrZWVwIHRyYWNrIG9mIHRo
ZSBGTFINCj4gcmVxdWlyZW1lbnQuDQphbGFuOnNuaXANCg==
