Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3154C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 18:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D4010E052;
	Wed, 29 Nov 2023 18:34:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0585810E052
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 18:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701282877; x=1732818877;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cx7jHCPyfcf8q5667VmU/8g5f7WSQaokecOztAeNRoM=;
 b=bP/hyCGNUDwP8YwdubX/EQRNhxfz2TElVBp9pSgYeMUrtOM62vR0tw4E
 nWilu6fnjkPD9O7Iwu5UQu+N/tZoxT/GgG6oU9k4B7gKdqxcCJWU1Hc9T
 wGjJ0wkWG7eJCtTMttQXRoYCEHSzwr49an8Kx0MiID4jotZud+0d+M9Oo
 4/yiq497yi2S4F3kgIkfYU0OYk+qYBD+yIWfsFvdcrs8nseWcjp1k7ENW
 HzRL/Q2kvPqxYHGpYT74hnxbizcXHBshkIHD1A7OfQGzg+TOLt2Zaggw3
 D5j26j4Pd+NqGfQx0OdAh2WspnqJEziWf93H7bCc0GaKHapkJapq5/Nm1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14765548"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="14765548"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="803385194"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="803385194"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 10:34:36 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 10:34:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 10:34:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 10:34:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 10:34:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2K/p8foqPHhtUhuHayMLh5cvGV9XbY3UN+hHEPc8IyGDnmjPfhRRZMId3+8MiW7XU+zdDl0WBT2dSFNj1mz9M8cWLrGJJ9jWRWH5f2yumL2hIsXnMPOxuJPLMQLR6LSawLbWpJUnr0ExatwHJPtFNMPD0Wp2PAX+jkLQEZ9ih6WS6RGLGOUYvEDErvPT7lPNC6iIs0+Q3P5N4ZLkxpiKvFlC4Tj7vSgS38MyTJOkh5Xf5loMbc/f1vYwgebkU8tS8WhM/6cBq+FgZdFvAq22iH6V7oIGid71Us3WF08AJhoBbuI41OST4OEIw754hmBMy+KOl6aQ+5hDPFXRUNygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx7jHCPyfcf8q5667VmU/8g5f7WSQaokecOztAeNRoM=;
 b=EDeau/ZuO4tdiWk5HA/K39IWny/zeyc8qO4sNnE+aXgM4TdgE74EWXXdJAbyZqO0eyd7cmik7xsRzmvEQ2Gr3fRqstwhBqgoWZ3FIQNKxvy2oEj61kltv5Vm/kaNl374h/42LykjwDoZm3gM+eRI66TlxJhvnclb2wQq3JusC8J0/8B6/ja2vczropOhj137/x/e8emMq69lRa0SDVsQqhJrg5G3hEjmWt1pUN8m/kXfuRMfCoRr/67x6CRfPj99nRIl0z0PLdMLXtjpAe5XQjjFW0I4d6X35O8ClLmy7QSh1kMOcvHuWQB1kZjgRk6BNqv4kPADbeOF5rVbIYz/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 18:34:26 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 18:34:25 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 14/14] drm/xe/uapi: Move xe_exec after xe_exec_queue
Thread-Index: AQHaHVGoesXSKqv3gkmRGL2gzdhNxrCRqrWA
Date: Wed, 29 Nov 2023 18:34:25 +0000
Message-ID: <0787989529e6c89fb08c57f5e06191760f7d8066.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-15-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-15-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5117:EE_
x-ms-office365-filtering-correlation-id: 97a12692-7b9f-4d69-f105-08dbf109d041
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JE16Zxp7WkNsCpX+lBFZMjFzGWi2ztkkcL0AQa/rKftEl3Hv0LMunL4ka4jvUYhZWVzx4O4igr1adN02VeeVzNKJ3bZKl0FZilHfBWZibdBz74noCg0tPsqbzuE5464nEwDNuwRiWx6TxAyjEP7VLu3RS/hE32znK0Mtak1vj6MXC4md4J8SOjZ5yxJYR9XoUJKz4Ygj6ucyaNhSRUEhmYoFv1awGqBPm6SJkqT3dIwmqd/bUD4c8cZeEFSpMd+qh6IgBG8cLKGqCzSZGHAyQ29P6wBXr08J0cXWuV7DYWWzxN67SelmliaOLasVaP7eW1Yn2Ju9N6zLYf4dWJg4ga5+HLSqkARxY4B9z0pqE0rJYYFtEcIQKN0bk/DKjeBEl0oOHwIrDnaWjf5Bhjrgv4o7HDCC90OomOsgQ39H7Ek/MCJ4RlmeTE53UNLaNCc1OArID2HkzhNBmac5ea9/3fBlWOSwCN4c4nJjFmQEQIPT8ojwR7LNEjhPFMZp8L9lcjIYxD7lbzCd9EGg9vROJgeM9bjio0S75tY9exKJZD5dPfnnIFt43A8y2FE19yxZI804DLUb/C4tPlJ2fRQyuzAhouggX8XGzHf9DYbJ4tFmj8k97BPxWbNPX2Bm8AbL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82960400001)(36756003)(83380400001)(86362001)(122000001)(38100700002)(91956017)(6636002)(66556008)(110136005)(316002)(76116006)(66946007)(66446008)(6486002)(64756008)(66476007)(8676002)(478600001)(4001150100001)(5660300002)(41300700001)(38070700009)(8936002)(2906002)(26005)(2616005)(6506007)(71200400001)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHBUU2dTdG9GZ2MrOWdkNFNscmJRSmI0K2JPc25CdVcreUVuK3F5ZE9qWWx1?=
 =?utf-8?B?b21FNjR1S0FuakpCaHN5REVyMlhNWEpUWitSTVl3c3MzK0daOGwyZDVwQ1ZE?=
 =?utf-8?B?T3Z6ZkFXczQzM3ZQMVRRc2FnMmVIcElUWHF6azZsdHMwK0g0L1k2M0hIbXhO?=
 =?utf-8?B?bXQxOUk2VUhtVjlPRmJianVrYnhXOG05Wkw0M1VlZkgrT1JjaEtNUGxnUnZh?=
 =?utf-8?B?SU5WbFM3bDJvSHNKeUxqcldOa2VKUThrT1diemJqUmVTVVMxeEU0ay9kcHh0?=
 =?utf-8?B?cmlsbzhwRmdjeURlRUNQcmlNejBtMHNGZVNsN1djTWJzRGJuMkpnT1p4NHNv?=
 =?utf-8?B?Q0pHOGh0d0dOYVJZTW1iT1picldhVmZYS2RzUWFzYWFydW9XQmVBVmxONWdY?=
 =?utf-8?B?REk4aEt2eml5R3RIYUZIakNORkVrdWZ0b25BWWo4MVBmNExEMDZJdXB6bUpL?=
 =?utf-8?B?MHYxMTk2VmV5YlZ6MWVORFo1RjcramQzSUdHNS9qWldZbEwwOHQrWGIyay82?=
 =?utf-8?B?QXVHRGozdHpScnAzalVmb1dvS0E5TEg1dTR3aWw3SkV2a1hGNWZqb1BnbHBz?=
 =?utf-8?B?MFU2MWpXaHdadGlFdkhpUUlXNWs0bUM1ck9JaDBmTkdJUDdYRWdjaWx4YlNF?=
 =?utf-8?B?QVc5WUhnTTJkeTZOM284NDZ4TW1PTHdOZnVSeGNvUkFjbkY1VGh0ZktVRWFE?=
 =?utf-8?B?SUtpY0FITUZYTFZkMUZjeGM2VUErWmgvTWJDTHRtK3NnTDcwM3kyaFRNNmJs?=
 =?utf-8?B?NjgrSzVnRkRyNGowamMxVzBuR3lWeHhROWJtcmtONUJRR0JEaDc2ZUFOVk1N?=
 =?utf-8?B?QUFmMFV4UmFIeDlvNlVHK2Z4b1FhV1RnYmQxdlVoMVJYUVJ5WHlzTkNqOVJH?=
 =?utf-8?B?K0REbkFqV3M5N0lRUTcvbThRQVNzN3pOb2ZjMDlUNnJYUXJsWU1WTHh3dW5F?=
 =?utf-8?B?RUtyejBXdncvbGdxaVEzQTJvZnhGWnZIYzJPT3h0eWNEbmJIak43YWhwZ2pG?=
 =?utf-8?B?aTlGVlB3dHhSOG13bndoOUJhY2d6ZzdCOHlzdzBCRnozcWczWHZFSnQxSkZn?=
 =?utf-8?B?czY3UXkzMFVFNHljNEkrWjBwM0VvQzlOU2RQdEdiREFaL2JUY3BsZzl3Yndk?=
 =?utf-8?B?ZU5PVFZTMWh0RDlhVXBwNTA1Y0MxU0VQNFhUWUhWR3NQQWN4Qi8zZzVjTHVa?=
 =?utf-8?B?Y1lRSVNoTG0rQ2c4VVR4aEdQZjZVR0lDKzQ2YzIxOEFINmwyZGs1WGFNbWpD?=
 =?utf-8?B?V3N1dFF1amNXU0NUYU1HZEJGZXFxSlNtQlJtRHJpV1JYNm94RXRvZDN2OTVZ?=
 =?utf-8?B?OWZmODNQc25QSzdJOWFjRG1IcnY3eDZEbTQ4Sk1zdkJLMGFNQnVYMTVBS29H?=
 =?utf-8?B?dXBDK3FTQUgzdU5zdlI0ZWRENDc0Uk00T1c5Q2lIVURUUE91Z2tDMTVLdlYr?=
 =?utf-8?B?UUIzTnBuNE9WSXpSczBaNUYwSGNqdFJxNTZJRmI4cnE0QVNmVExGZDdJaUZi?=
 =?utf-8?B?N3orL2VuL0xqQmkvRlk4MkR1a09sbWZRTUZncFgxaHJ1VTNDenVFSEJOOHd1?=
 =?utf-8?B?dEhzZ2d1d25QaTVraGQ3MDc2RUcyT25iUjluelBaekNpMG02dVZjcC9jdlEx?=
 =?utf-8?B?NWtuUm50eCtWRExTL0l2ZlJvK0c4NVdNQkMvR0lFQW1KMzJSYVA1Rkp6VnhH?=
 =?utf-8?B?Z29sbDlTT0VYTlhHU0JhcjRQTW5ZTXR4alV1UWlQamxSMUlFUmNpaGNoWFFP?=
 =?utf-8?B?cmpLSlRSLzZUajVKMXNWbkFUTWh3T1FzSnBhRytZK0w3TDNEczR4eWdkUEh2?=
 =?utf-8?B?TnN5dERhNUcyS21aSDMwWTJYa0ZzWTB0TmYrbEd5dSszVDhOSENwZHkrQjVl?=
 =?utf-8?B?aCttRGNlZWo0M3pvMGZFWnA5WGVpdDJjQ29BaWZhZ3k1aG1tVHgrU0dETmY4?=
 =?utf-8?B?N0FoRk9acFQ0QkpoU29vQWtNcFdod0hDY3UzSnoxVERoY0YxSE45S3lhNjV2?=
 =?utf-8?B?djNrVnIwY0hjOWIrMGdwbjZSY0lvR1VIRXhvRFlGMW5sT09TSmQ2akRCOXlU?=
 =?utf-8?B?UmFudGVPbHRoYW5rL0x3UFc2Q0Z3MER3eW1XNXJBeTJycmFFSkx6RlNCU0ti?=
 =?utf-8?B?VFlmL21KcEpTMjJGYlcxamFlV1U1aFNKWnBLZFVOdCtEbXJPU1JQZTZPbVdT?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3418920C67A1D842A2D4E986486A9F98@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a12692-7b9f-4d69-f105-08dbf109d041
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 18:34:25.3413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VEs3QVq5NQpXpkfLrTXBinY7+oJQcWfkBSOUlklqtFbqBZ+/x8t92p86y1vEjiYOGv2MdNJUHn+4RFmvc6jtbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 14/14] drm/xe/uapi: Move xe_exec after
 xe_exec_queue
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

T24gV2VkLCAyMDIzLTExLTIyIGF0IDE0OjM4ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IEFs
dGhvdWdoIHRoZSBleGVjIGlvY3RsIGlzIGEgdmVyeSBpbXBvcnRhbnQgb25lLCBpdCBtYWtlcyBu
byBzZW5zZQ0KPiB0byBleHBsYWluIHhlX2V4ZWMgYmVmb3JlIGV4cGxhaW5pbmcgdGhlIGV4ZWNf
cXVldWUuIFNvLCBsZXQncw0KPiBtb3ZlIHRoaXMgZG93biB0byBoZWxwIGJyaW5nIGEgYmV0dGVy
IGZsb3cgb24gdGhlIGRvY3VtZW50YXRpb24NCj4gYW5kIGNvZGUgcmVhZGFiaWxpdHkuDQo+IA0K
PiBJdCBpcyBpbXBvcnRhbnQgdG8gaGlnaGxpZ2h0IHRoYXQgdGhpcyBwYXRjaCBpcyBjaGFuZ2lu
ZyBhbGwNCj4gdGhlIGlvY3RsIG51bWJlcnMgaW4gYSBub24tYmFja3dhcmQgY29tcGF0aWJsZSB3
YXkuIEhvd2V2ZXIsIHdlDQo+IGFyZSBkb2luZyB0aGlzIGZpbmFsIHVhcGkgY2xlYW4tdXAgYmVm
b3JlIHdlIHN1Ym1pdCBvdXIgZmlyc3QNCj4gcHVsbC1yZXF1ZXN0IHRvIGJlIHBhcnQgb2YgdGhl
IHVwc3RyZWFtIEtlcm5lbC4gT25jZSB3ZSBnZXQNCj4gdGhlcmUsIG5vIG90aGVyIGNoYW5nZSBs
aWtlIHRoaXMgd2lsbCBldmVyIGhhcHBlbiBhbmQgYWxsIHRoZQ0KPiBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5IHdpbGwgYmUgcmVzcGVjdGVkLg0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJv
ZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGluY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmggfCAxMiArKysrKystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5k
ZXggNGMxNzU5NDY1NDdjLi4xN2U4NmM4MzEwZmEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFw
aS9kcm0veGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAt
MTAzLDExICsxMDMsMTEgQEAgc3RydWN0IHhlX3VzZXJfZXh0ZW5zaW9uIHsNCj4gICNkZWZpbmUg
RFJNX1hFX1ZNX0NSRUFURQkJMHgwMw0KPiAgI2RlZmluZSBEUk1fWEVfVk1fREVTVFJPWQkJMHgw
NA0KPiAgI2RlZmluZSBEUk1fWEVfVk1fQklORAkJCTB4MDUNCj4gLSNkZWZpbmUgRFJNX1hFX0VY
RUMJCQkweDA2DQo+IC0jZGVmaW5lIERSTV9YRV9FWEVDX1FVRVVFX0NSRUFURQkweDA3DQo+IC0j
ZGVmaW5lIERSTV9YRV9FWEVDX1FVRVVFX0RFU1RST1kJMHgwOA0KPiAtI2RlZmluZSBEUk1fWEVf
RVhFQ19RVUVVRV9TRVRfUFJPUEVSVFkJMHgwOQ0KPiAtI2RlZmluZSBEUk1fWEVfRVhFQ19RVUVV
RV9HRVRfUFJPUEVSVFkJMHgwYQ0KPiArI2RlZmluZSBEUk1fWEVfRVhFQ19RVUVVRV9DUkVBVEUJ
MHgwNg0KPiArI2RlZmluZSBEUk1fWEVfRVhFQ19RVUVVRV9ERVNUUk9ZCTB4MDcNCj4gKyNkZWZp
bmUgRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZCTB4MDgNCj4gKyNkZWZpbmUgRFJNX1hF
X0VYRUNfUVVFVUVfR0VUX1BST1BFUlRZCTB4MDkNCj4gKyNkZWZpbmUgRFJNX1hFX0VYRUMJCQkw
eDBhDQo+ICAjZGVmaW5lIERSTV9YRV9XQUlUX1VTRVJfRkVOQ0UJCTB4MGINCj4gIC8qIE11c3Qg
YmUga2VwdCBjb21wYWN0IC0tIG5vIGhvbGVzICovDQo+ICANCj4gQEAgLTExNywxMSArMTE3LDEx
IEBAIHN0cnVjdCB4ZV91c2VyX2V4dGVuc2lvbiB7DQo+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9W
TV9DUkVBVEUJCQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1ZNX0NSRUFURSwg
c3RydWN0IGRybV94ZV92bV9jcmVhdGUpDQo+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9WTV9ERVNU
Uk9ZCQkJRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1ZNX0RFU1RST1ksIHN0cnVj
dCBkcm1feGVfdm1fZGVzdHJveSkNCj4gICNkZWZpbmUgRFJNX0lPQ1RMX1hFX1ZNX0JJTkQJCQlE
Uk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfVk1fQklORCwgc3RydWN0IGRybV94ZV92
bV9iaW5kKQ0KPiAtI2RlZmluZSBEUk1fSU9DVExfWEVfRVhFQwkJCURSTV9JT1coRFJNX0NPTU1B
TkRfQkFTRSArIERSTV9YRV9FWEVDLCBzdHJ1Y3QgZHJtX3hlX2V4ZWMpDQo+ICAjZGVmaW5lIERS
TV9JT0NUTF9YRV9FWEVDX1FVRVVFX0NSRUFURQkJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSAr
IERSTV9YRV9FWEVDX1FVRVVFX0NSRUFURSwgc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX2NyZWF0
ZSkNCj4gICNkZWZpbmUgRFJNX0lPQ1RMX1hFX0VYRUNfUVVFVUVfREVTVFJPWQkJRFJNX0lPVyhE
Uk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX0VYRUNfUVVFVUVfREVTVFJPWSwgc3RydWN0IGRybV94
ZV9leGVjX3F1ZXVlX2Rlc3Ryb3kpDQo+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9FWEVDX1FVRVVF
X1NFVF9QUk9QRVJUWQlEUk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfRVhFQ19RVUVV
RV9TRVRfUFJPUEVSVFksIHN0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9zZXRfcHJvcGVydHkpDQo+
ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9FWEVDX1FVRVVFX0dFVF9QUk9QRVJUWQlEUk1fSU9XUihE
Uk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX0VYRUNfUVVFVUVfR0VUX1BST1BFUlRZLCBzdHJ1Y3Qg
ZHJtX3hlX2V4ZWNfcXVldWVfZ2V0X3Byb3BlcnR5KQ0KPiArI2RlZmluZSBEUk1fSU9DVExfWEVf
RVhFQwkJCURSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERSTV9YRV9FWEVDLCBzdHJ1Y3QgZHJt
X3hlX2V4ZWMpDQo+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9XQUlUX1VTRVJfRkVOQ0UJCURSTV9J
T1dSKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfV0FJVF9VU0VSX0ZFTkNFLCBzdHJ1Y3QgZHJt
X3hlX3dhaXRfdXNlcl9mZW5jZSkNCj4gIA0KPiAgLyoqDQoNCg==
