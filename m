Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72470C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 16:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389F510EAF0;
	Fri, 22 Mar 2024 16:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZQdXVL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6251D10EAF0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711123732; x=1742659732;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Y1WuoWXP8s1tGvL5MinSLZRx9T0X9BUlWBUENXezuRU=;
 b=aZQdXVL8WdWSHl7ZRxfik20TIrB5FvsK7q56fCa22Zo8qfmmjZWaozBW
 z0P3+4CuxFrrJUUIV1u/L6vmCG8dRjHr6hRhwT/g0vriZgQwuvuagoLLz
 jAOWmB7f2mW31x4uxZ/fkKZ1u1MWJnnM9rbPnEY4ESdRCOzueHtu9i6Mb
 orFotCUfkniNFCOqtd3eonVZ1XKPy209a3NZi0073Ovw+zEPHM328dwkd
 QMEPZKpuGtiNQFiKucLAhOP/byVWOz8Dr12//jSuGooUeMd0FgWZseChK
 3kC3q0slJfMRW73EuYqez0h/g42IQa7/bgUFs5LiqfLIG4gylcuuz+6ZQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6035469"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6035469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 09:08:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19650822"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 09:08:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:08:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 09:08:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 09:08:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 09:08:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPLjiUFlRw6FiZI+gPwCW2SmsMvzZa7fR66eyy0LfCuJwrIuJRcTFNMY7eBlRAz7ZXf0vvDvDuXvTC0wOQC9BhtNRvo7uWs0J5MiXbvprQaDalR54z5wqMsE1uWkeOEtzqQPDxPIFwmQ5s2InJLAVqK70jjNu5NQN9pO0Ubtfogsac5+WoOyzCmR1DeU17k3Q1iYG3/hciCXi1RDZIveOMluDsTtY/xRtvH8yhGTgDvxzsWozqH+sDs5jouXEc36AuBhTHfv0WSVwvhGW2rklBYd0omlxBzG5/YYHnb00QikmODIDscBZYr//izmxB8tNctXdm+FQyqHCIkYVG2fSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1WuoWXP8s1tGvL5MinSLZRx9T0X9BUlWBUENXezuRU=;
 b=d9ChfLgV9G42bxoVDPNd7N+7ilsSiJhH4Il21rDBHVLAWHNmEADioeuEZ44IUTPTHiwfPUL61YxwGXLhnYTlB/rc5juK7NC8RqN47K/Z6wkKBfd0f5YKKOvbA4wIFj0N5z0fNT4V/YhIp41a6XxPpVaosuLJ0skR+NFtFuX+woWqAd4cqNv8/JZxtKrXh/2omx19B3srOV4hlR05LnOAweAKwJyLdSvb9EmeDRuJlVnkjvpMYY8ZZQnM9kl98NuFBxQbZC0JsUgneBtLuqAELSvNdzg5ciLIIkahE/vHI2nq9mCIl1dzYfB4tcvg+FHFtZYoCFJ7K9WiC9GQBDbfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB7154.namprd11.prod.outlook.com (2603:10b6:a03:48d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Fri, 22 Mar
 2024 16:08:32 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 16:08:31 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit, 
 Ashutosh" <ashutosh.dixit@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Topic: [PATCH v3] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Index: AQHafAtQZ/eeG/Aa5EeQ7IEwlbac5bFDyaqAgAAfn4CAAAT6AA==
Date: Fri, 22 Mar 2024 16:08:31 +0000
Message-ID: <4cd61e1479695ed6d48bf4c8ec90d897d4b584ee.camel@intel.com>
References: <20240322035810.3347272-1-himal.prasad.ghimiray@intel.com>
 <24c1facddb694a5b500a180ba9e19c23eae47607.camel@intel.com>
 <Zf2oz5ItlLT97Qf7@intel.com>
In-Reply-To: <Zf2oz5ItlLT97Qf7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB7154:EE_
x-ms-office365-filtering-correlation-id: 5f12b476-47c9-44e6-1278-08dc4a8a51cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nI8237sZ6D5DBIjNytcGv0qCQdTFqzfL4rCuC6z7KaqK9ga4XU5IqoS9iQDeiKxbFfIqMehG3JEYTxxFylfemUtRJo5nmgyIDiwEdRYL/BVciHaXeQqvItpmUK58RUt7qrd0Y/EhS2S6A54S9tGkPic5wBYCIXksnZk6wUM8e8eTxnXJzf/j/6giG87vJHyd3fobsDfSAi7FMEhk2cp0YdBoxB18hyUziWtAkdO653YB81/YS3yjXpa7eLFLWH+DfuWoPanGHRj0Y+3vRdD5y/szJfxET932j8OZwN1R2QfDOZbO26imuTEufk5BlC64rgUl3NjUgPi9kbIYha9WABmfaBsmq0tx3j27LxEvBKwu1fKZpiRmJKK1zLIqlCGAHy7SCHJPEGUYpkd3wIzWXYaJjGiftYFAWHEU3/e9E7km3fwkFExDV+LmfkmSAc7+oVOCL8YKwDCvgchudOkNSjrQwtMKSmyEINPXoFk+djLcyWqZTl9QnD0I4cmWjTfT1fYZXB04VJQ+p3Z93VnrHt2njbWVqTzhdlrx3CG+PE55W8WlK9Cy2lFFUgsLXPwCUiMhaq+HTEOFN7SUydeuqNnRYZUGtvJ2qIaANWvEq12Cc06M0RSvPDgs4DCXM9aAmFOtcLQIwcOdeozt8SpmQ3Es4mm2EqOe/h5ZYjZnWprzOjX62EFDgv4lvJt4gvlbPRJyz8RqzBkSQYOC/NhYuxtxq1//RbBcYHpGZbbUGRM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wis1NVR3amtuOGJ6dEUxaGNXakVwYmk3UjlaR2xPYlJ6aUViaHJ4djFZM3hV?=
 =?utf-8?B?eGpJQzkxVzlWcURZNUQrQy9TV3d1UVJoU2IxSy9IcEN5dE44ZmpyRHdTMyt6?=
 =?utf-8?B?UFFIcHFhSDNzS3FlT0IwTWhBWnVSVTk5SzVPdjgzcytXdGlOeHZtZFVoWThq?=
 =?utf-8?B?SUplczBNVFhoa29lWkVtZS9wM01jSmV6Z1hzeGI5L2NXYm11VVFSdCsvOFY1?=
 =?utf-8?B?T1MveXFTOFJUNUJ3VnpqK3lqSTRyWmNQSnU0QkFqbFFaWWRLNmZvQko5aitn?=
 =?utf-8?B?QzJ0SHRvcHliTURRZGc0cVlnNFJFTWFGWEdZOXNzSHlZc1JaSjdyL0dPaW5q?=
 =?utf-8?B?QXdyOUt5L08wajgwRjNiYVByRDYzaVdQUVNieDRaRWxETEZsbVJTTW1tV0Y3?=
 =?utf-8?B?WW41Vjg5RkpQektpZk1oKzhDZEZVQkFxNkMwTksrQmdWQmRxc0NZUVNKZU5r?=
 =?utf-8?B?cU9Ja1pZK0NnR3ducm1GZXVmYW9BdjNha3pZQXoxMmcrV1o5aXNocnpaWmcz?=
 =?utf-8?B?TnkxNHM5VFZPZ3lLR0ZDemZuTFAvTGNTdFFNaDd3dmo2TlZlWjdQSTIzc0I3?=
 =?utf-8?B?UE1BVFNXQzhlMStDR1BtY05WS3dHRUhEUVdSb3k5TmhSRGR0M2lSYTVCQjlo?=
 =?utf-8?B?Ykhpa0l4Y2FpM2dmb09zRzQ2TFh6V1ZWeGl2ck5yQlhpQXFCZTVEb2VYWHZk?=
 =?utf-8?B?MjR5TlJFRkdabmkzSzZIQWxqeFhqdnhrVWh3MEE1RitQZkgrdkxOL3NVK2dn?=
 =?utf-8?B?SEJvK25Uc2pyZXVGOUZBVUhuL29RVVEzdGltTGVOOHZETUtZQlpra0I1YTlZ?=
 =?utf-8?B?M1lNY1FsTy82Y2RqS1FoRVN0QUxFcjRsenRhQzJoZTY1T2ZQbkFvdVVZUzJ3?=
 =?utf-8?B?OXVpaXVGS0hLN2NKbGlsVnJoYkZQZEJpWEZabElIWmNlUUVsditWQVBoYmEz?=
 =?utf-8?B?YWVVRWRtaUI4dy83MHFOMGxRbGlkVzJ4OEs5M2JuZWxLRHlnUmZnekkwS0xi?=
 =?utf-8?B?TERNTnd2c2ZGNHZ6RWFWVERwaVdLSlB2dTFDbkw3djUvNGZNZDVyNWQ0Yktm?=
 =?utf-8?B?ZDBESjhwUlI5aGcwb20yV04xM3A5aHhIZkJQQmwxSExoaWRyWVhkcDM5T2FH?=
 =?utf-8?B?WDNSMWdsTktrL0JCdFNvVFRBekdJUWpRTDRwQmtURklPRUJSVFl1ZENFSVZh?=
 =?utf-8?B?WjB5U0dlVGxPYkp1WTQwSmIra2lkSGZDWnVZV0E2RHNmWnJBeVFZOC9menZh?=
 =?utf-8?B?UzdFN1VCWFRlNVVoKzBnR1diMEFEUytMYkpmM2dWZ2M2dEp4R3k4S1g1V0Vp?=
 =?utf-8?B?ZjYwZXFNS3hCOE5xSUpodG54OXpTck93a1UxeWYwc21HWGZQa2VUZXZsYnRU?=
 =?utf-8?B?eGRJamQrdHU3WHJCYVhVRkpOdjcvN1d5c0F1ckZ3ZEZQUUJMYlFySDg0RWsz?=
 =?utf-8?B?dnk2dXFBM0M4amNEdDA5Z2l3WEV6TzZ2TGdKQk4vZlRUVWpMNnhxRGFQK1ZR?=
 =?utf-8?B?YmNoMFRPRDJFMjNKb0hSQ3FJQjBUZHg3dld6MjFDRzVINkliOFc5STVkQkVh?=
 =?utf-8?B?YVB6Mnl2UTJjSVBJOTB6Z2xyYm1Da3o4cFdsSlV0U2kyNjhSTXhJY3pERHor?=
 =?utf-8?B?WFVaOGc5bWFJcngyK1h6aUpObithVGkvNjBGNmNOYlNrUkM3Tktwb2JxeTgr?=
 =?utf-8?B?dnNDcXIrZ1BLVlk4eWxFdUthS2xaQUkwSk1UZlR1ZUg1Q3hTbkZGaVRFZUtu?=
 =?utf-8?B?YjdXenh4MjNOQlpEeXRPUDU4QW9ybWhJblNlK2tKb3JvNFNoQndIbTV1TlNr?=
 =?utf-8?B?UzRFSEdVcFpIejg2bTBwWWt0OE5hMFY1aTI1eHozNVFvL2o4V1MvQWNkbkxI?=
 =?utf-8?B?azVHL1FITXVBT3BDRmNCNE5JT0huUGtsckh3V3UvemdZeEFwaTdFcWVnZ1ZG?=
 =?utf-8?B?VHBPcTZLeFhSeFVJdkgvZkhXU3VFSzFBalI2TDZuRU9YT3Bpd0NFN25Sby9W?=
 =?utf-8?B?YXNGTXZPVk0vdGN3akVLenl2MnFWSkVMYlc1TXhoekIydVlTdjRYbDFqaDZF?=
 =?utf-8?B?WG9ZVkcyNy9USkNhSzl5RUd0OXVFTDV0SEhqcXo3NEFDQTZjTS9nQmt0dGdJ?=
 =?utf-8?B?a0xZYU5TL2tXWWFMRmZ4Q20rVzZnNm1ud1RsUDAzanJxL3ZHVFJiamtzZ2xw?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9DD51C97E34814190C2E6443D3B003E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f12b476-47c9-44e6-1278-08dc4a8a51cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 16:08:31.8009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C3RhG2WWCg5zYpqYWAygjZF2TCMlQCNYiKcpVMQHZcldssMd2cP6Fwl6a/dlAa6DjRQqCmu4KZUtYwYFSbG6lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7154
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

T24gRnJpLCAyMDI0LTAzLTIyIGF0IDExOjUwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIEZyaSwgTWFyIDIyLCAyMDI0IGF0IDA5OjU3OjMyQU0gLTA0MDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIEZyaSwgMjAyNC0wMy0yMiBhdCAwOToyOCArMDUzMCwgSGltYWwgUHJhc2Fk
IEdoaW1pcmF5IHdyb3RlOg0KPiA+ID4gRGVyZWZlcmVuY2UgJ2NvcmVkdW1wJyB0byBhY2Nlc3Mg
J3hlX2RldmNvcmVkdW1wX3NuYXBzaG90JyBvbmx5IGlmDQo+ID4gPiAnY29yZWR1bXAnIGlzIG5v
dCBOVUxMLA0KPiA+ID4gDQo+ID4gPiB2Mg0KPiA+ID4gLSBGaXggY29tbWl0IG1lc3NhZ2VzLg0K
PiA+ID4gDQo+ID4gPiB2Mw0KPiA+ID4gLSBEZWZpbmUgdmFyaWFibGVzIGJlZm9yZSBjb2RlLihB
c2h1dG9zaC9Kb3NlKQ0KPiA+ID4gDQo+ID4gPiBDYzogQXNodXRvc2ggRGl4aXQgPGFzaHV0b3No
LmRpeGl0QGludGVsLmNvbT4NCj4gPiA+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4NCj4gPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhp
bWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogUm9kcmln
byBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgfCAxMyArKysrKysrKystLS0tDQo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiA+IA0K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gPiA+IGluZGV4IDdkM2FhNmJk
MzUyNC4uNWI3YmUzYjViOTA2IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmNvcmVkdW1wLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZj
b3JlZHVtcC5jDQo+ID4gPiBAQCAtNzcsMTcgKzc3LDIyIEBAIHN0YXRpYyBzc2l6ZV90IHhlX2Rl
dmNvcmVkdW1wX3JlYWQoY2hhciAqYnVmZmVyLCBsb2ZmX3Qgb2Zmc2V0LA0KPiA+ID4gIAkJCQkg
ICBzaXplX3QgY291bnQsIHZvaWQgKmRhdGEsIHNpemVfdCBkYXRhbGVuKQ0KPiA+ID4gIHsNCj4g
PiA+ICAJc3RydWN0IHhlX2RldmNvcmVkdW1wICpjb3JlZHVtcCA9IGRhdGE7DQo+ID4gPiAtCXN0
cnVjdCB4ZV9kZXZpY2UgKnhlID0gY29yZWR1bXBfdG9feGUoY29yZWR1bXApOw0KPiA+ID4gLQlz
dHJ1Y3QgeGVfZGV2Y29yZWR1bXBfc25hcHNob3QgKnNzID0gJmNvcmVkdW1wLT5zbmFwc2hvdDsN
Cj4gPiA+ICsJc3RydWN0IHhlX2RldmljZSAqeGU7DQo+ID4gPiArCXN0cnVjdCB4ZV9kZXZjb3Jl
ZHVtcF9zbmFwc2hvdCAqc3M7DQo+ID4gPiAgCXN0cnVjdCBkcm1fcHJpbnRlciBwOw0KPiA+ID4g
IAlzdHJ1Y3QgZHJtX3ByaW50X2l0ZXJhdG9yIGl0ZXI7DQo+ID4gPiAgCXN0cnVjdCB0aW1lc3Bl
YzY0IHRzOw0KPiA+ID4gIAlpbnQgaTsNCj4gPiA+ICANCj4gPiA+IC0JLyogT3VyIGRldmljZSBp
cyBnb25lIGFscmVhZHkuLi4gKi8NCj4gPiA+IC0JaWYgKCFkYXRhIHx8ICFjb3JlZHVtcF90b194
ZShjb3JlZHVtcCkpDQo+ID4gPiArCWlmICghY29yZWR1bXApDQo+ID4gPiArCQlyZXR1cm4gLUVO
T0RBVEE7DQo+ID4gPiArDQo+ID4gPiArCXhlID0gY29yZWR1bXBfdG9feGUoY29yZWR1bXApOw0K
PiA+ID4gKwlpZiAoIXhlKQ0KPiA+ID4gIAkJcmV0dXJuIC1FTk9ERVY7DQo+ID4gDQo+ID4gdGhp
cyBpcyByZWFsIGJ1Zz8gYmVjYXVzZSBJIGNhbid0IHNlZSBob3cgdGhpcyBmdW5jdGlvbiBpcyBj
YWxsZWQgd2l0aCBhIG51bGwgZGF0YS4NCj4gPiANCj4gPiBpZiB5ZXMuLi4NCj4gPiANCj4gPiBp
ZiBjb3JlZHVtcCBpcyBub3QgbnVsbCB0aGlzIHdpbGwgbmV2ZXIgcmV0dXJuIC1FTk9ERVYuDQo+
ID4gDQo+ID4gd291bGQgZHJvcCBpdCBhbmQgcmV0dXJuIEVOT0RFViBpbiB0aGUgY2hlY2sgYWJv
dmUuDQo+IA0KPiB5ZWFwLCB2ZXJ5IGdvb2QgcG9pbnQNCj4gDQo+IHRoaXMgcGF0Y2ggY291bGQg
YmUgc2ltcGx5IGEgMiBsaW5lIHBhdGNoOg0KPiANCj4gLSBpZiAoIWRhdGEgfHwgIWNvcmVkdW1w
X3RvX3hlKGNvcmVkdW1wKSkNCj4gKyBpZiAoIWNvcmVkdW1wX3RvX3hlKGNvcmVkdW1wKSkNCj4g
DQo+IHdlIGFyZSBoYXBweSBhbmQgdGhlIHN0YXRpYyBhbmFseXplciBpcyBoYXBweQ0KDQpjb3Jl
ZHVtcF90b194ZSgpIHdpbGwgYWx3YXlzIHJldHVybiBzb21ldGhpbmcgc28gbm90IGEgZ29vZCBp
ZGVhIGRvIHRoaXMgY2hlY2suDQoNCj4gDQo+ID4gDQo+ID4gPiAgDQo+ID4gPiArCXNzID0gJmNv
cmVkdW1wLT5zbmFwc2hvdDsNCj4gPiA+ICsNCj4gPiA+ICAJLyogRW5zdXJlIGRlbGF5ZWQgd29y
ayBpcyBjYXB0dXJlZCBiZWZvcmUgY29udGludWluZyAqLw0KPiA+ID4gIAlmbHVzaF93b3JrKCZz
cy0+d29yayk7DQo+ID4gPiAgDQo+ID4gDQoNCg==
