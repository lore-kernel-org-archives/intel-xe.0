Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE27CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC990112001;
	Wed,  3 Apr 2024 15:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdJGAU0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A54112001
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712157835; x=1743693835;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NDmtzbaWGeQ7c99iez7sYFWzJkhfCitJxiGqKw33GnE=;
 b=CdJGAU0FFKRa5pf3WlJsefx4iUNI6e65ffFIWZk+g3nhlQV8sD1A8J6y
 hrCW28Plgpq/NUP8m10913l3B8hchW+X+cVZrnUrApeChZnyokaG5E4cX
 neCHLHf0/dmrxl5xZy7go3CS3gx+JZNYhPe0AJXhOCZfFutShDyyPfo7N
 qPXOFOHdjk3u0eIL7UWjxm7wVJndOKDEp+pYxCiwT4y1K7h+iyzgIZ+GZ
 Qm+OjVTo4pC6xEOFX3F4xeV24vM7fK8JjMirpoxxqyv9iyefUEWo0kJJi
 ZHDHB2DXDQjjtbyJR4U6o/jtY9ddnhZAbDItV3eP+mmvaY/hXkHDZPM3y A==;
X-CSE-ConnectionGUID: Nl0VnmFkRZ2D+YpFeQuXtA==
X-CSE-MsgGUID: RhuZHinUSOmb3TN8oap+5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="17969676"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="17969676"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:23:55 -0700
X-CSE-ConnectionGUID: DGHSUCvoQhGllHnMGYyZ3Q==
X-CSE-MsgGUID: Nj+hNXsvSD2vs78TQUKknw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="49703409"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:23:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:23:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:23:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:23:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:23:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdZayiN3dze9ZmqqFEHzt6C3kTGSlSdc+7WUiV4aMDJRmpkgb+3+XLK+MVRIyxmKhLZB5H4UHDgnaXa5sQVzbl07kry5kNt2o8taWf3+cigvjhKFzLeWSyFkfoZMnyac/ojCPEa45AgRTQHHW5NrIj/+qmJB4rM5xiOAFyieahy36LxW3o93ji0KcdMOfvKeigJXkkTrppo9WQfHSHt3DqIRdS/dwvBeJ5UOcsSNVv/ZVQCtmyWQnt7yauC/SxVZ3fxAwtRdb9XDA5g69umeZULCqWJr9R4Eh4Zg15c26j6wYsPS15HgXDJcztKa92Kd4QaVnQW2vTaxsxAhayUQeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDmtzbaWGeQ7c99iez7sYFWzJkhfCitJxiGqKw33GnE=;
 b=F2g6j8cDeU2gDUCDTyUzOz/JerJa+G2ryqDRU/qAEjGEA6LoSPB/NtvDme2HoJiY9r+nXi8gyjgrO9GIpdXwIkGoSGlRn75lSvDJp5U5hLaK2tgCejKHSWELidP9uyUsCYC71/c3H1WEXZYdQPkSJsiF3FPJkz7A0ow2rWu7p9KX4WFCPwfY2MlZMSKJV90PzeoWb1A3ElK6s/nCOs123pN4IKo1oRPefiMCj1sCwZUqAW0fLkTa7iIF14dYbVR99ejWLtwcRaxmGVXbA7aCp7T1qYYkDICfv+xeHO0ou6o+hY4Dk/cyOnCbiTdXYK2/PuFxSqhVYGv4PLwmvtF+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 3 Apr
 2024 15:23:51 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.031; Wed, 3 Apr 2024
 15:23:51 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Protect devcoredump_free
Thread-Topic: [PATCH] drm/xe: Protect devcoredump_free
Thread-Index: AQHahdZYFxanliF8sEapkb8bTTU6PbFWqi2A
Date: Wed, 3 Apr 2024 15:23:51 +0000
Message-ID: <d44153ccae19eeacfa6cce68729e537d759a69ba.camel@intel.com>
References: <20240403145054.97414-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240403145054.97414-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB6560:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LOrFdAjQ2ptWIeM43a80Tq2wadEYEsm2WxK/yWQeQ5fE0GSch5mKn4oTDCE7ZbAzrn0c1uO/+eEVSRlHUdOCmqmhdrAV8cS/p+OCLBYsMuDWY+w+6nX4U76OYttxB1mcFWXr0fH+i7MMCXWTjnZA7ESMsKx0jIBa36wFkGnvyUHLWcxGUK4bmQCyur2Iv2iwSvZOR3gOpqfZmVuccqI0q2CkaIKjr4Im61D2Lt/JZ9yXhIVUiGnvreg5xWFguBczlIu6qp2I0DEjm2V0brMXsd0nniZeRT7bLc91ECF7j1gGhuxTfj6QxzW/Dldn8iwOW04t8DtZsqsRJYsH76+yDIEp6xWhjoZbEHxhhJ4SRPrh5BYR7AldwfeCygVijp0j8dDleomCeGOEY+rsTEGbMJzswmXVv6ULC42/GfwevDU0hst69Ls1W9k3u8qzl13T6BmGRe9RR8REykTd8ExHpD0wpsxjio58BabM4a6Xc7TEHG4P6DKomG50F21HYVzye32KVFRDpbWhBEfL2FhqTN8XlCOle2V93XIMNU0MuTXPFQ8ajidB1CebDf/vNwIwel0MJ/PUicFnVVYxYHQEowTd0YQC9Pv7teZ+SdeUCusu0OV9ccYHwNFdijlF9YYPWNjqepDk1it1QG5ok4rYRzY9CVKJwnyewozkjmCWJ7U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MU9OaTJpZzFhWTdGTHBnRXh3M05mblhodjFuTE52SllxNVBOa2duTnh1NVZk?=
 =?utf-8?B?Y0JFMjE3aFRMQjhNQkM3SC9Dc1c0aXdyU3g1NnpNMUxJckh1c3ZGOTVXME1L?=
 =?utf-8?B?S3lsTEwxK3VpZVNGKys4UzNKMFI5NXY0OVlWQlVRd2Z2RFlJcldhY1FZdmN2?=
 =?utf-8?B?UWEyUkRXR0I0Z1I3Ni81VkxYZVBXb2Qzc3JTZXkyYUZ1dWxOVFNXcVBHQTZu?=
 =?utf-8?B?UWFiNnZEOEFlZS9Uc1d6Q0owOCtIRC85Vm9jME9iTGx1VktuVUlocjBFNFB5?=
 =?utf-8?B?alI1U29SWDBIK2RYSVdibXlUcXdvWUhlbDVpMENIOU90UUpoSEIybHFrTTRK?=
 =?utf-8?B?VWNVcVJMWGN3OGtMak1nQk9KbUx4WkRna05NZ1NjakkrS2YzeE85dW1PU3Jz?=
 =?utf-8?B?Rlc1cnp3V2hldWRFSlFZeXZSOUgralpwQmdwQUFISlRWc3BDN1FaTUMzQ0Ix?=
 =?utf-8?B?ZzFlZmd4STU0S3QxVG41a0s0N09PRzNwZGVOY3lBUE9GWVRpYVV0ZERGZExh?=
 =?utf-8?B?QngrQS8ycVM2OWtnOGNmVlA3QUdZRGp6aHhWSlJMS0ZTYzNwelV6T2dQNGhN?=
 =?utf-8?B?NEp1RXIxOHVwK0pidDRzcWFiZDE4TXA0dmtKQ2t6UjNuK2Y5Q2Z5ck91L0NJ?=
 =?utf-8?B?Y0NPOTVGeERvb0NkOXJSZENJREVaVnVNQmN0dW54ODhvdUNBeFRyN1pzWUtv?=
 =?utf-8?B?dEg5b0U5c3Y0dzRtdWxRZ2ZLWFgzWDV0ZFhnM2VPTWNMMTF5L1NIUHlhWEcw?=
 =?utf-8?B?QXVkbi9JUk5kR28yT2dHWXlLMVF2NUFQOUp3QzhZYXRqTVBTL3FlVm1jci9l?=
 =?utf-8?B?N3FkRkdQMFpEVm84ekZXQzB2V05RWTBNTTJwakt3ZFl5eVV0aWpINStOS2Zk?=
 =?utf-8?B?cGxnL0hLamhySlJha29Qbm5kNmN0SjdqUlhISHI0Q2E3dldWMC9JWE5Gc1Rv?=
 =?utf-8?B?MDVtck5OWEM0d0RpSkZzbXNESDhtbjRwTmhEdnpwSFZteWpaUjB4cFljMVhH?=
 =?utf-8?B?YXVSdWtrVFJIRFFwTjdZQStlK2hWUk5XRVhMblBCRGhGTUJ6YXFHTG1jemNO?=
 =?utf-8?B?MDhSSnNubEpuZGk0VXk3MEtvVzQrOUQ1R2svWFlYRmxIWktEWE01OGgwcUIx?=
 =?utf-8?B?ZG5pVUVTMVZLRm1wVkpIcjJ4NUdoRkFzNmhDRFVGOE50dERqK1RmYU8rSEZU?=
 =?utf-8?B?OVR0eXMwSUFaTWpBNXdJUUxhVzBLc2VRYnhsTFM3eWcxTTIrejJzN2Z4aUNO?=
 =?utf-8?B?ekxhWVlPRWExMG1WYXB1QWF3bjloakUxdEhUZ3BHbDVNanlmR2pLeEtFeEVn?=
 =?utf-8?B?dC9hM3hWTWhBWE93TUdyQzVGbkRmcXBHYmVCMlVlTGNSZG0yNXVpVWpBMHo0?=
 =?utf-8?B?cEdpSEVmaVlvTHhaNUxsZFhudVpuSXhac0ZPVHlvdmlhdU5ua3cxd2hZVTUy?=
 =?utf-8?B?RVRnR3dDL3dFSzA5SnNFaGh1OUEyR1RvZStiV1FNZmo5WU5NaEVTMVZYeVJk?=
 =?utf-8?B?S0IzSk5HN2VQa2ZPbWk2a0ptUFplblN3RmYvUm9LZnI0UHpvT09TT3ZYZ2FL?=
 =?utf-8?B?bERoU3FHbXQ2TjByZVdaR0ZSTnBXSGt5eFpmVmp4UHVXY2JkNkZGc0JTUXlx?=
 =?utf-8?B?eWladzBzOFZsOWFsQXRDblJ6WEx0dmdlLzg3bnJiY1d6cGJTZEx0SWphcndC?=
 =?utf-8?B?b3ZKZjhRRjV3alhvekQ5bm8vNVJBeU9kZGU5OWxsMkpGRUQzZVVyVjFoYTZB?=
 =?utf-8?B?WUp0OFpOS2xhb1lUT1ZaaG5wWUhEV1BrczJBRHBXcGtHeHhqdjBGSzNIODZZ?=
 =?utf-8?B?MGpjVGJMRjJRZ0dWM0IrdURFeUY5K1M0ZG1iUnprT3BPTXFLS3dHS21hTGx1?=
 =?utf-8?B?eW5ZRnR3SURGRGtsYTZSeDdYci9zcFNEc3FqK0ZFczZFVTYvWlpxejJydlh1?=
 =?utf-8?B?TE9IUDdYNDJpM1E2aldWalp3c0t5by9JTDVEZVRNbDY3NVJiN3lCTHYvREQx?=
 =?utf-8?B?dnk2R2crOWhmNlBPK0pucm5KcVN1cER0YjZKTkhuTGJYaHJOS2hPNit1aTY2?=
 =?utf-8?B?R3p4dEhxMUlLVjYrM0MvNTVlZHhsZ0JhWTIwUFlNZVR3eTEyNTQzYTNHbWM0?=
 =?utf-8?Q?LKcxw1zfZM3+WM2g+b12UQSDG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39653BC2A3D5F449857B9E8C7F87DF50@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77188195-d036-4eb8-4802-08dc53f21108
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 15:23:51.2522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQCFBYIVeJf7TN0N8Ok62sP/FoqCb7qVLUPM55gKFSphRSJl/HFNgDs2Bg1W95/QPE16OnpAdUt/RBs+VhCfSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6560
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

T24gV2VkLCAyMDI0LTA0LTAzIGF0IDEwOjUwIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IFdoaWxlIHdlIGRvbid0IGhhdmUgdGhlIGZ1bGwgZmxvdyBwcm90ZWN0aW9uIHdoZW4gZGV2Y29y
ZWR1bXANCj4gaXMgYWNjZXNzZWQgYWZ0ZXIgZGV2aWNlIHVuYmluZC4gTGV0J3MgYXQgbGVhc3Qg
Zm9yIG5vdw0KPiBwcm90ZWN0IGFnYWluc3QgbnVsbCBkZXJlZmVyZW5jZToNCj4gDQo+IFsgIDQy
Mi43NjY1MDhdIEtBU0FOOiBudWxsLXB0ci1kZXJlZiBpbiByYW5nZSBbMHgwMDAwMDAwMDAwMDAw
MDAwLTB4MDAwMDAwMDAwMDAwMDAwN10NCj4gWyAgNDIzLjExOTU4NF0gUklQOiAwMDEwOnhlX3Zt
X3NuYXBzaG90X2ZyZWUrMHgzMC8weDE4MCBbeGVdDQo+IA0KPiBXaGlsZSBhdCBpdCwgSSBhbHNv
IGZpeGVkIGEgbm9uLXN0YW5kYXJkIGNvZGUtZGVjbGFyYXRpb24gYmxvY2sNCj4gb24gdGhlIHNp
bWlsYXIgZnVuY3Rpb24gb2YgeGVfZ3VjX3N1Ym1pdC4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiBGaXhlczogZTVm
NjYxYmI1NmQ0ICgiZHJtL3hlL2RldmNvcmVkdW1wOiBQcmludCBlcnJubyBpZiBWTSBzbmFwc2hv
dCB3YXMgbm90IGNhcHR1cmVkIikNCj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
c3VibWl0LmMgfCAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jICAgICAgICAgfCAy
ICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGluZGV4IGY0MmYxYjU2NzA2Ny4u
NmUzMmY5Y2U0ZWI1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1
Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gQEAg
LTE5NjEsNiArMTk2MSw3IEBAIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X3ByaW50KHN0cnVj
dCB4ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25hcHNob3QgKnNuYXBzDQo+ICB2b2lkIHhlX2d1
Y19leGVjX3F1ZXVlX3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX2d1Y19zdWJtaXRfZXhlY19xdWV1
ZV9zbmFwc2hvdCAqc25hcHNob3QpDQo+ICB7DQo+ICAJaW50IGk7DQo+ICsNCj4gIAlpZiAoIXNu
YXBzaG90KQ0KPiAgCQlyZXR1cm47DQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gaW5kZXggZjRiZmIy
NzA1OTU2Li5jY2IyZTFjNjdjMmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC0zNTE0LDcg
KzM1MTQsNyBAQCB2b2lkIHhlX3ZtX3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX3ZtX3NuYXBzaG90
ICpzbmFwKQ0KPiAgew0KPiAgCXVuc2lnbmVkIGxvbmcgaTsNCj4gIA0KPiAtCWlmIChJU19FUlIo
c25hcCkpDQo+ICsJaWYgKCFzbmFwIHx8IElTX0VSUihzbmFwKSkNCj4gIAkJcmV0dXJuOw0KPiAg
DQo+ICAJZm9yIChpID0gMDsgaSA8IHNuYXAtPm51bV9zbmFwczsgaSsrKSB7DQoNCg==
