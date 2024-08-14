Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE25C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 06:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E68E10E00F;
	Wed, 14 Aug 2024 06:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXsKQDUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD8110E00F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723616135; x=1755152135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V4hvkMi8AM/0U3alN9MjjjKOSp2JKdbAAiojxzc29kY=;
 b=gXsKQDUZgORb930bV3ABHnPcQo64Fx0VBuQDzcjXolfhUc2lp8NsyhGE
 bLeY51YDYro8OZfXzlVP/kbgDoGrcnuOcPI0Wdbb7TPS18V0LINHypKQX
 4jbHGK2a0SWr0bo6rYitJzpiwrumec56zi2Cegs7c7j9p4+g5MVc4PxK/
 y9NGi9/i278hEi/FO1I50mHKQCnr5QsSjB4VwJMN3Hc4VeqPWdUMR3AQd
 cKGSJogoOXwTsE4HpciEbZfDrpiPNbcsSGu5LEVbyenYXmqxjstdf4dgf
 LWs/OY1OqyXqVFFBT3f016FYbnMIpXIuLXDVRdnwLQczWV5mn1HS/c3ed w==;
X-CSE-ConnectionGUID: khvL9EgSRzaRsCu72EqvJQ==
X-CSE-MsgGUID: X0cYK9uQTtq5ZquNtnPiYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25675655"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="25675655"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:15:34 -0700
X-CSE-ConnectionGUID: QFHvF8G3RBezqzl7Y47lIQ==
X-CSE-MsgGUID: 1KUD/U6GTwy4nKrNyHiS+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="58548052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 23:15:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 23:15:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 23:15:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 23:15:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 23:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynZ3K0LRc+YIur8/tTVT2hAjUQJ5ADi8E+zLQ7fO5HaBqBVZ2D3EHlrhEtYlwrIIuW3YsaDUYV+gIzJSPUxgDYo0jhV5RLvAXOv60O8PiaVF1yzIM1eAkF/GUCckyvJ2vu/WGxwlBRQjfHvP60mwM9r2fcIkhmRYs+4EaHzHxSJMxg1DtnWpEmZJk/4oQxxI4lzuQ1WbH58t/AECaCD1ozKKGfVMpjz0WWIfBqRipGZMVye3rtGqrthzBg5hcsocixbSrBapMw+xRbvUwsyZbLFDhWh6Lw50ipYagpv8TE3tPzG9x9xO2PggegYLL3C8WtPblK6VcWKGWDxLs7RaEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4hvkMi8AM/0U3alN9MjjjKOSp2JKdbAAiojxzc29kY=;
 b=KB4D/IYLaQh6ootC7i+py8J8mHVxE+s71RSE/kvvlUMv1xknSHK3/KMC/IBlEBblbnBRMgSvsPgAjLTrFcRPPC+5scYXaFDnL/pPHyTyQa4r2Gi74SOJQS9Jfg+jjgiU186VMXVHC8QeO/ZwKYE6TB+73WVsZ8GwvGPlrrqAVWh42F991Gnmr4dRg28mMkANSK12pU9/GwXUwKUD4hlsUMVazwO40vzfWal4yboHPVcWTworF5J9Q1uU0xb1q9dk4ATCGvgq5lnPKLMD4qje7EEoHAIMDhiXFgkdAqyLd+FVx5HnLqx53YLskV0yYRyfSSgHkFoe2LApLRXvwEnSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Wed, 14 Aug
 2024 06:15:25 +0000
Received: from MN0PR11MB6208.namprd11.prod.outlook.com
 ([fe80::7a1b:645a:6e80:3ef5]) by MN0PR11MB6208.namprd11.prod.outlook.com
 ([fe80::7a1b:645a:6e80:3ef5%4]) with mapi id 15.20.7828.023; Wed, 14 Aug 2024
 06:15:25 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
Thread-Topic: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
Thread-Index: AQHa6XUSM5dvDthrZ0WoognIGtqYVrIdxbwAgADbCgCAAARwQIAAAwgAgAenGTA=
Date: Wed, 14 Aug 2024 06:15:25 +0000
Message-ID: <MN0PR11MB620816BEA1F14A518ADA130281872@MN0PR11MB6208.namprd11.prod.outlook.com>
References: <20240808092826.585276-1-tejas.upadhyay@intel.com>
 <20240808092826.585276-2-tejas.upadhyay@intel.com>
 <20240808195114.GE5091@mdroper-desk1.amr.corp.intel.com>
 <4a41b168-10de-432f-8535-a719d321823a@intel.com>
 <DS7PR11MB6197AD5C4DD4595F464E765C81BA2@DS7PR11MB6197.namprd11.prod.outlook.com>
 <2bd3e553-6319-4f9a-844f-d08528e4c331@intel.com>
In-Reply-To: <2bd3e553-6319-4f9a-844f-d08528e4c331@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6208:EE_|CY8PR11MB7242:EE_
x-ms-office365-filtering-correlation-id: ecd20227-b4d6-4df0-a939-08dcbc287c72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: L7KLF4T40gQd//CkwSKL4SwH8j1TrmYoAj6LIc6VYxcR8Bc+yzU65EgQS8EgDPVNvIBWnlo7PRaFgNKkDeDnAXZZjSRR1zfb75bzeXXeTkUIbI+9q3m0RTIqZfEOXm6ZI+dFqgBC6mTosiBcXtMxpAzD/mewTpxnYe/odIy4cpoQZiUWBZ7sRYDawMSniBH0Vxcg0QbN5iIL1ap1hzeQUBMJHIkFdmXe0IoDSQYlV31KcnrFCRpTZ32r6dgwUsdxE8sCnT849GdoLzFIu9tjaUw0iet3J3q9gFgxkHtT0rvC9cJI8wsU23+SMwiHL0PFSVz4psNaWODuOxZIzIbBP5Q6IQzHfcl8fqVQb88m40vTzw25aoLWtnzgZ+lX3kO1KUdSLhTz3CVkTnr9Y8QGE/gZleuc7oAIbiDKPKaaiNpNyy3kWph/h8s66C7gkvrg9wPBoAdddlb9bS0C6HcbPzHu3Avlzx3BZL5wWAmib+wXG3nZNofYT1UBZKsO6dIfTK4nsZr9fUGHvZWbUsOXee/jg+F7/eA6afIrnzzT62cfhdiXBF0CaYqr0MinxvE8UzecK15EMNtoyf9SnP/4iAWVefsIl861ZZyzK8NGb6zHouI3jhh5bEuSlc2PpCyrAl7m//MY871/fMwsHAQL3qlek79UOtrXi7kqLPFuR+rhggC8gInGK/5yuXPqUCWntAhMbP7kQwRfJILX41d7o7VK55GBiOnjYUG6JxIrw0E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXFNR3ZhQjk2Y01EU0NGc3hBVXBtcGpYcVVYSWR3V0J6dGlCYmpvc1lPd3E4?=
 =?utf-8?B?ZzN5WVorSk5wK0VuK1JLNkZJNmJ6VTAvNGNzcGJxa0hnTVlFUGI2dE9BblNM?=
 =?utf-8?B?SVk4eXNlWlhyQy9vZEN4UUZSblBvTmQ2NzNoTW1TRFgvdEFUSXN3QWJWbUh5?=
 =?utf-8?B?UjVremdBMmRYT1hRbU5aQzhjQXlCL0ZoU1grdVJVemhhWUtHNndBc09la1Iz?=
 =?utf-8?B?aEUvVnZXWjMwZm9HaFFjUzhYaVpSZ1lacE83TUdqQ3FWQ3dieUN3a2luczEz?=
 =?utf-8?B?Mk1NZkJjNVZSVC85dDUrTnZybWlFRnI2aTB5Ri8rb01vTHBzSUFvcktpWXps?=
 =?utf-8?B?aGRKMkQ4a0kvazY1U0tDTW9BbG10bTVxbWsydTh6cG85U1dPMDBPdzJHdThV?=
 =?utf-8?B?YVFtUER2RzBvd1ZZaHpxUmExREVJQzdFOWpxNlNNZDdpN3VnSFhpTEZmRmFY?=
 =?utf-8?B?dkhyc0FlUE1la0RKTDJ3VHZGNExjOEVkd1hoZkM4ekhpMHFVd1Vlc2ZKbU5P?=
 =?utf-8?B?di9La3dhWU5UVUR5U2FrWktCeGNwUmR3cnB2TDllNTBjZ1pDdU5zZ09INkM2?=
 =?utf-8?B?UzdsZTA3QU56VG9DLzBxRkdla09OSy93SllJWHZjT1pVcVRDR2svTlFrNjAx?=
 =?utf-8?B?YzFZeXpPcjZjSDFRUlg3M1FubnVacTJKeFpQb0hRVWI5VU1wMFlNUVQxbElR?=
 =?utf-8?B?c3d1dVdPdlpTWHBEam5RREVoYTAzclhxMUt0TExuVzB3ZjNHWG5Cak8wSjJJ?=
 =?utf-8?B?cHJPak5jeTIwYk40cTlCUHpSRGY5RDVZb1dXQ2JGenVRbHNoVTQ3OCtTd2Vm?=
 =?utf-8?B?ZldwT0FNY2dKeFlhMnZHVUJHU3lqbm1tNkpBbkx5akdqTFRKNGhIN0lxK3p3?=
 =?utf-8?B?ZHozUUQ3L3c3UkRtVXVZL0JqNXd2N3YrSWtXdmVKUnJmWGF4eUpzRklySU9Q?=
 =?utf-8?B?aUZaM1BzdXY5VWI4cmFWRldoOFhqeDc0d1dBcEZCS2ZoZ0lmLyszYUhMeTFa?=
 =?utf-8?B?QnE1dnpJSmZTNXJWWUZPREpVampvUzJVdExTbTZIRE5uaVZDek9sZHorVDhK?=
 =?utf-8?B?elVSQ3FYT1R2V1BhN2M3Y2UvSjlFRWxEaXJrOElKek1EQjViZG8rWWFhMmIx?=
 =?utf-8?B?UUljSWpLcHZBaUxVK2JpTkI5TEFkSFdZejJJclZhUHBwZFRKRzgwbkc2akp5?=
 =?utf-8?B?eC9xVElYanJlSFdmdkR4ZGJDWTBvZUkvdW1UY3FWU1dOdC9ZeGQveXpjdWtv?=
 =?utf-8?B?aHRLZkNuZE95NW1OVThWcXgrazNmTXRpMmtScFNGbnlKM1VXbmFtZWZONnlw?=
 =?utf-8?B?SmhqR1V1VVJmMEozb1ZSSFBhSFNjSnYwbDdCZ3c4ZGVQOTcwaVFZYU9UZkkz?=
 =?utf-8?B?eGpHbHZJcDlTaDZnalF0T1RybDFuMUIvYWo5OTVBT0V6Q1lDQUg2SGtjcVM5?=
 =?utf-8?B?T2JZVmpaejNhajNycFpxR2dMOXA3U1JDVTc5bWdudVI1Ujdjb1ZoZGoxRWxw?=
 =?utf-8?B?UFZWNUE5Q2pXQ2NXQ2VYbFlmdU53MHIyN0hiRWpZclhiMGRKandjMFpBbnhm?=
 =?utf-8?B?UmtIK1ErM3FEUDFWaTNSMUplOXFkOXQwR2U4blpxWUJnTmU2OHZQZHhUVXpT?=
 =?utf-8?B?QTAraTRZMnZyVVA0SEFZUkV4cHh2TXZjSnJTelQwRFZjZThidWlpcFQvY3hP?=
 =?utf-8?B?b1hYMC9MWWh1djI3bkV6U1lYUUFEbHcrODJUMWxMUEduYkZIV1c5NXBsZ1Mr?=
 =?utf-8?B?M2NxQlppamF2SXE5R2dqMnNlVVdiWmZxdGlJbnltckdmUmNGQ05JUmdQaStE?=
 =?utf-8?B?a3ZNK2JtdnZ1UG5LajMwN3Y4K3lMdDhwa1ova3Zrb3R6K3dPcjc4dFRQZy9B?=
 =?utf-8?B?NmtDZnlMcmtlbmRLUzhwZTdSSDlDNitOVWRuZWRFMmlON2o4YWwraUMxK2dH?=
 =?utf-8?B?OU8xcCs4QW1LVm9DNVFranhHaEdBWVNWS2o0TXF2TmRReVFZZUxwcjlPZnRx?=
 =?utf-8?B?cFcySmkrMXJWZTY1VE1oWW9TZStHM0pxVlIxeGFtRmp1MXNVZHFUZnNGVytw?=
 =?utf-8?B?dDVuSmtPbFVJdUlGbFRqUHFCRHZocDJ1MDZmZkMvRk5NR09TTlZyeUp1d2Nv?=
 =?utf-8?Q?jAVhQvMwSRR8O+No2rW7TE6+T?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd20227-b4d6-4df0-a939-08dcbc287c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 06:15:25.2082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gk9HI+zkcFgoBxZu7e1ftZNxm/NsQsmJsgIpnscqyX3WygHDyUS/NnsANGaHEp6XJkhaVHRLRMWaqtQ6ftOphE0X4HehBkJy1FkYu0kvJhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgOSwgMjAyNCAy
OjUyIFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47
IFJvcGVyLCBNYXR0aGV3IEQNCj4gPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERlIE1hcmNoaSwgTHVjYXMNCj4gPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGRybS94ZTog
SW5pdCBNQ1IgYmVmb3JlIGFueSBtY3IgcmVnaXN0ZXIgcmVhZA0KPiANCj4gT24gMDkvMDgvMjAy
NCAxMDoxMSwgVXBhZGh5YXksIFRlamFzIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxk
QGludGVsLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBBdWd1c3QgOSwgMjAyNCAyOjI1IFBNDQo+
ID4+IFRvOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgVXBh
ZGh5YXksIFRlamFzDQo+ID4+IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERlIE1hcmNoaSwgTHVjYXMNCj4gPj4gPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGRy
bS94ZTogSW5pdCBNQ1IgYmVmb3JlIGFueSBtY3IgcmVnaXN0ZXINCj4gPj4gcmVhZA0KPiA+Pg0K
PiA+PiBPbiAwOC8wOC8yMDI0IDIwOjUxLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiA+Pj4gT24gVGh1
LCBBdWcgMDgsIDIwMjQgYXQgMDI6NTg6MjVQTSArMDUzMCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6
DQo+ID4+Pj4gZW5hYmxlIGhvc3QgbDIgVlJBTSBpcyBleGFtcGxlIHdoZXJlIE1DUiByZWdpc3Rl
ciBpcyBnZXR0aW5nIHJlYWQNCj4gPj4+PiBiZWZvcmUgZnVsbHkgTUNSIGluaXQgaXMgZG9uZS4g
TGV0cyBtb3ZlDQo+ID4+Pg0KPiA+Pj4gImlzIGV4YW1wbGUiIG1ha2VzIGl0IHNvdW5kIGxpa2Ug
dGhpcyBpcyBqdXN0IG9uZSBvZiBtdWx0aXBsZSBwbGFjZXMNCj4gPj4+IHdoZXJlIHdlJ3JlIGlu
Y29ycmVjdGx5IHVzaW5nIE1DUiByZWdpc3RlcnMgYmVmb3JlIE1DUiBoYW5kbGluZyBpcw0KPiA+
Pj4gaW5pdGlhbGl6ZWQuICBJZiB0aGVyZSBhcmUgaW5kZWVkIG90aGVyIGNhc2VzLCB0aGVuIEkn
ZCBleHBlY3QgdG8NCj4gPj4+IHNlZSBtb3JlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgbWFraW5n
IG90aGVyIGNoYW5nZXMgYXMgd2VsbC4NCj4gPj4+DQo+ID4+PiBBbHNvLCB0aGUgdGl0bGUgc2Vl
bXMgc2xpZ2h0bHkgbWlzbGVhZGluZyBhcyB3ZWxsOyBpdCBtYWtlcyBpdCBzb3VuZA0KPiA+Pj4g
bGlrZSB3ZSdyZSBjaGFuZ2luZyB3aGVyZSB3ZSBkbyB0aGUgTUNSIGluaXQgKHdoaWNoIHdvdWxk
IHJ1biBpbnRvDQo+ID4+PiBvdGhlciBjaGlja2VuLWFuZC1lZ2cgcHJvYmxlbXMgd2l0aCB0b3Bv
bG9neSBhbmQgR3VDIGluaXQpLCBidXQgaW4NCj4gPj4+IHJlYWxpdHkgd2UncmUganVzdCBtb3Zp
bmcgdGhlIEwyIHRoaW5nIGZvciBXYV8xNjAyMzU4ODM0MCBhIGJpdA0KPiA+Pj4gbGF0ZXIgaW4g
dGhlIGluaXQgcHJvY2Vzcywgc28gaXQgbWlnaHQgYmUgYmVzdCB0byBmb2N1cyB0aGUgd29yZGlu
ZyBvbiB0aGF0Lg0KPiA+Pj4NCj4gPj4+ICAgRnJvbSBhIHF1aWNrIHNraW0gb2YgV2FfMTYwMjM1
ODgzNDAgaXQganVzdCBzYXlzIHRoYXQgd2UgbmVlZCB0bw0KPiA+Pj4gZG8gdGhpcyBhcyBwYXJ0
IG9mIGluaXRpYWxpemF0aW9uIChhbmQgR1QgcmVzZXQpIHdpdGhvdXQgcmVhbGx5DQo+ID4+PiBz
cGVjaWZ5aW5nIGFueSBzcGVjaWZpYyBvcmRlcmluZyB3aXRoIHJlc3BlY3QgdG8gb3RoZXINCj4g
Pj4+IGluaXRpYWxpemF0aW9uIHRhc2tzLiAgSWYgSSByZW1lbWJlciB0aGlzIHdvcmthcm91bmQg
Y29ycmVjdGx5IGl0J3MNCj4gPj4+IHByb2JhYmx5IHNvbWV0aGluZyB0aGF0IHdlIHdhbnQgdG8g
ZG8gYmVmb3JlIHdlIHN0YXJ0IGhhdmluZyBhIGJ1bmNoDQo+ID4+PiBvZiBDUFUgd3JpdGVzIHRv
IHRoZSBMTUVNQkFSLiAgSSB0aGluayB0aGVyZSBhcmUgc29tZSBDUFUgLT4gVlJBTQ0KPiA+Pj4g
d3JpdGVzIGR1cmluZyBHdUMgaW5pdGlhbGl6YXRpb24gKGUuZy4sIHRoZSBHdUMgQURTKSwgYnV0
IG1heWJlIG5vdA0KPiA+Pj4gZW5vdWdoIHRvIHJlcXVpcmUgZG9pbmcgdGhpcyB3b3JrYXJvdW5k
IGVhcmxpZXI7IHdlIHNob3VsZCBwcm9iYWJseQ0KPiA+Pj4gdGVzdCB0aGlzIGNhcmVmdWxseSBh
bmQvb3IgZG91YmxlIGNoZWNrIHdpdGggdGhlIGFyY2hpdGVjdHMgb24NCj4gPj4+IHdoZXRoZXIg
dGhleSB0aGluayB0aGlzIHdvdWxkIGJlIGEgY29uY2Vybi4gIEkga25vdyB0aGUgcmVhbGx5IGhl
YXZ5DQo+ID4+PiBDUFUgLT4gTE1FTUJBUiB0cmFmZmljIHdvdWxkIHByb2JhYmx5IGNvbWUgbGF0
ZXIgb25jZSB3ZSBpbml0aWFsaXplDQo+ID4+PiBkaXNwbGF5IGFuZCB0aGUgZmJjb24gc3RhcnRz
IHdyaXRpbmcgdG8gdGhlIGZiZGV2IGZyYW1lYnVmZmVyLCBzbw0KPiA+Pj4gdGhlIG5ldyBwbGFj
ZW1lbnQgaXMgc3RpbGwgZWFybHkgZW5vdWdoIHRvIGF2b2lkIHRob3NlIGF0IGxlYXN0Lg0KPiA+
Pg0KPiA+PiBZZWFoLCBpdCBzZWVtZWQgcmVhc29uYWJsZSB0byBlbmFibGUgdGhlIGhvc3QgbDIg
Y2FjaGluZyBiZWZvcmUgd2UNCj4gPj4gc3RhcnRlZCB0b3VjaGluZyB2cmFtIGZyb20gdGhlIGhv
c3QuIEkgZG9uJ3QgcmVjYWxsIGlmIGl0IHdhcyB0aGlzDQo+ID4+IHZlcnNpb24gb2YgdGhlIFdB
IG9yIHRoZSBvbmUgdGhhdCBkaWQgdGhlIHRpbWVyIHJlZyB3cml0ZSB0aGluZywgYnV0DQo+ID4+
IEkgZG8gc2VlbSB0byByZW1lbWJlciB0aGUgcGxhY2VtZW50IGJlaW5nIHNlbnNpdGl2ZSBldmVu
IGR1cmluZw0KPiA+PiBtb2R1bGUgbG9hZCAoSUlSQyBndF9pbml0IHZzIGd0X2luaXRfZWFybHkp
LCB3aGVyZSBpZiBkb25lIHRvbyBsYXRlDQo+ID4+IChndF9pbml0KSB5b3Ugd291bGQgc29tZXRp
bWVzIHN0aWxsIGdldCB0aGUgaXNzdWUgd2l0aCB0aGUgcmVnaXN0ZXINCj4gPj4gcmVhZCB0aW1p
bmcgb3V0IGluIHRoZSBpbnRlcnJ1cHQgaGFuZGxlci4gQnV0IGluIHhlX2d0X2luaXRfaHdjb25m
aWcNCj4gcGVyaGFwcyBub3QgYW4gaXNzdWUsIHNpbmNlIGl0IGlzIHN0aWxsIHF1aXRlIGVhcmx5
Lg0KPiA+DQo+ID4gU2hvdWxkIHdlIGdldCB0aGlzIGV4dGVuc2l2ZWx5IHRlc3RlZCBvbiBCTUcg
YnkgdmFsaWRhdGlvbiBiZWZvcmUgZ29pbmcNCj4gYWhlYWQ/DQo+IA0KPiBNYXliZSBqdXN0IHJl
cGVhdGVkIG1vZHVsZSBsb2FkL3VubG9hZCBhIGh1bmRyZWQgdGltZXMgb3Igc28gaW4gYSBsb29w
IG9uDQo+IEJNRz8NCg0KSSB0ZXN0ZWQgMTAwKyB0aW1lcyBvbiBCTUcgd2l0aCBIRE1JIGNvbm5l
Y3RlZCwgZG9u4oCZdCBzZWUgYW55IGlzc3VlIHNvIGZhci4gSSB3aWxsIHJlLXNwaW4gcmV3b3Jk
aW5nIGNvbW1pdCBkZXNjcmlwdGlvbi4NCg0KVGhhbmtzLA0KVGVqYXMNCj4gDQo+ID4NCj4gPiBU
aGFua3MsDQo+ID4gVGVqYXMNCj4gPj4NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4gTWF0dA0KPiA+Pj4N
Cj4gPj4+PiBlbmFibGUgaG9zdCBsMiBWUkFNIGFmdGVyIE1DUiBpbml0Lg0KPiA+Pj4+DQo+ID4+
Pj4gVjEoTHVjYXMpOg0KPiA+Pj4+ICAgIC0gUmVvcmRlciBwYXRjaCBhbmQgcmVvcmRlciBmbG93
IG9mIEwyIFZSQU0gZW5hYmxlDQo+ID4+Pj4NCj4gPj4+PiBDYzogTHVjYXMgRGUgTWFyY2hpIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBh
ZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPj4+PiAtLS0NCj4gPj4+PiAgICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyB8IDIgKy0NCj4gPj4+PiAgICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+Pj4+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0LmMgaW5kZXggNTg4OTVlZDIyZjZlLi4yMzhjN2QxMDUzZjANCj4gPj4+PiAxMDA2
NDQNCj4gPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+Pj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ID4+Pj4gQEAgLTU1Nyw3ICs1NTcsNiBAQCBp
bnQgeGVfZ3RfaW5pdF9od2NvbmZpZyhzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+Pj4+DQo+ID4+Pj4g
ICAgCXhlX2d0X21jcl9pbml0X2Vhcmx5KGd0KTsNCj4gPj4+PiAgICAJeGVfcGF0X2luaXQoZ3Qp
Ow0KPiA+Pj4+IC0JeGVfZ3RfZW5hYmxlX2hvc3RfbDJfdnJhbShndCk7DQo+ID4+Pj4NCj4gPj4+
PiAgICAJZXJyID0geGVfdWNfaW5pdCgmZ3QtPnVjKTsNCj4gPj4+PiAgICAJaWYgKGVycikNCj4g
Pj4+PiBAQCAtNTY5LDYgKzU2OCw3IEBAIGludCB4ZV9ndF9pbml0X2h3Y29uZmlnKHN0cnVjdCB4
ZV9ndCAqZ3QpDQo+ID4+Pj4NCj4gPj4+PiAgICAJeGVfZ3RfdG9wb2xvZ3lfaW5pdChndCk7DQo+
ID4+Pj4gICAgCXhlX2d0X21jcl9pbml0KGd0KTsNCj4gPj4+PiArCXhlX2d0X2VuYWJsZV9ob3N0
X2wyX3ZyYW0oZ3QpOw0KPiA+Pj4+DQo+ID4+Pj4gICAgb3V0X2Z3Og0KPiA+Pj4+ICAgIAl4ZV9m
b3JjZV93YWtlX3B1dChndF90b19mdyhndCksIFhFX0ZXX0dUKTsNCj4gPj4+PiAtLQ0KPiA+Pj4+
IDIuMjUuMQ0KPiA+Pj4+DQo+ID4+Pg0K
