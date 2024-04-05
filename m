Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E544CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 04:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD831138A5;
	Fri,  5 Apr 2024 04:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbmXpRei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22701138A2;
 Fri,  5 Apr 2024 04:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712292159; x=1743828159;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WDq2H0GpCPP8Z5JKTYPehauBumlVi6gA9nk/utNlfxI=;
 b=hbmXpReiWIYlddkOYgUB5c6WTCOWlD4u/RdI9hwCWr+0AGwichtuN1Xd
 FRcd5wsJmJAqyRsjS9vwI7TewlJwDCOavqvmaFUhHPAbLXlLpfxsHV1EM
 8yhz4y1W0xEWHupDDvFzgXAPmoIgybvR8bmWQ9FcDPbg2MOG6PoshxKW1
 SUUKXGuPDSOh0KJ6IaO3q77eg8LPgHdqwNPPQdV0MxG/IHmv0rvldSe1g
 nNNzByEt/uXPpiZyrwDfWWnrDCx73tapjqss+ZosQB7AHTj7yx5sXstEa
 HpmHBztrcDfQeP4x1tJoy/SbugW9ZkjJRXGraCeSOAt62YhcNM4ey80ni Q==;
X-CSE-ConnectionGUID: IHBO3iTCS9m4OQLZb+/0zw==
X-CSE-MsgGUID: XREB2NjyTfqy9OhfCmM8LQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7471222"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7471222"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 21:42:38 -0700
X-CSE-ConnectionGUID: DnoQzPD1SB2lHnuVPFxPfQ==
X-CSE-MsgGUID: jL/CaPHwS0GwXm5Xd6RViQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18968307"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 21:42:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 21:42:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 21:42:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 21:42:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egNmQS+aX3NgU6iqo7LPfOiBqnNgFHyyMUlmXJh8urubPGDg4epjQeEzLBwhvOu5BYIRyB1B/5JJ8sl7YpHAu0YFKIOUSVmcwmuNb5AgZwjfwSK34E0z+itm9qngrzavzp3y57/X5dlt1IH7EswB6+Abl6Ak0t4U4x/WyoNMhzcOoj1YMu485IZFba1XxS/CQrWI878b9YeNjOz85GhMTwTipKv6bnBivtixOCdkiECTh6ZzaU3IoGuUivr8hLYiHpDiiDgMiUvb/mDLjtjkJXmCBhhJcgkn/uVmvo+GPVOUj/GEkManAIBnlTsUggz0jOEO0tomd4XvugSSawtmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDq2H0GpCPP8Z5JKTYPehauBumlVi6gA9nk/utNlfxI=;
 b=HJp5XV6Dd2i/3t2zgEqBufdq+oNwK1XKvj8z20e88jvFPlHG7tknGxTHK0xseCrjvKUfZXMJFPvH2Lpyr9pcNAXDRBeC5z8U9oyVZYwM3IcIaWirkoOno7xg+13cjOniIAfosiJQ4YaUjF5XdXGFFaRtpEUisYKW2WAO17Fln6rCwG+6QFhAiynKhFhyyQzoY2teBSVpJcufgANRdI/QhIWla1SS8FkI5DzGVlp/QC2J2LJCqOxkG9IUUQaxx28AmNOFyvU++ajLLBYwGzM0jMmyJ71aqDUEHvH6oiJA03PL3DmTUC8q6ON9HwPc5c4Cnu2pAqZi4KWwVUuEcT5HdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7577.namprd11.prod.outlook.com (2603:10b6:8:142::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 04:42:28 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 04:42:28 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Topic: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Index: AQHahPafLEfGR8IzR02LuXk/Od8ojLFVYUCAgAAVBACAAIxecIACwXUAgAAGNwCAAFKToA==
Date: Fri, 5 Apr 2024 04:42:28 +0000
Message-ID: <SJ1PR11MB6204139D5B5349E4A51C654F81032@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
 <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
 <3f5a262a-25eb-4415-aefb-b9f9fcd1d702@intel.com>
In-Reply-To: <3f5a262a-25eb-4415-aefb-b9f9fcd1d702@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7577:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xBkl8fQLNq93ZAteQgL+r9m+pqOlJzNOkWyAAr+xK8ltORFjW3QXKsiOgMusNZLo0+YdtqvEQS7WZw4qDowhPLwVtvDh2CRNPGGSV0GkLNHuGuMNOubsHDIWpMeD3t62XO8Tqh1tQYXcI3PNZ+4xmugBYtGtj4gGZQyQ7YDwJFnM7cpowrpUBpKoUY+U4LPq5Yk2jRU/ftTduDvq+Ebqt3jLKotyRrasZ99AjAIrIeWM/zHdjUCMIAzzyEFvmkGMbe8EGQ3xQzgDUmE3pkhX5o5rRgH5RVAyVoWyOpZ+XW8j/LxUYdB0xyMf1rzaszIZlLcWG4TlvxMmlVH6YB6I5gqTPb65Lej2jKLW2HeEdjjd/QRzP9Ih4T75St3M3dTme30tvd3QRb+9cHCPjdjB9v6zG2q0jotmArQ0SNugo3TdQTtL7RaZ4/nHTxB0dASg1DxnLlJKwMLKun6OMNFkkM19S9O1EJ9nkZ/s2nciKp5vqdvrwGbnPPpBCKA6fBYEAJ5Z1SOO4UOfJjQu2WAtKVlmC+pujQbxDv4K4R00BZi4E/fsiRfJHBkG3YUHP981xXa4Tz/LAVLyJfB5LmPn7cyFiveVzMAKUY1UMSKf1N13Pq9ql/FlG9xE7aUMD7zd+VTl0TelnEWx56kmjfiWZLmAVUDZjDfRCHKfwVJHBpo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1VrUGpkTGtjcUpoMzZqa2ZrZUJmTDg5dnFSNk43ZTJsSVlSSStvUTAwdERr?=
 =?utf-8?B?MUFQdGdYRFB2dWoyYVJ4VkYxckI1RjhyWnJuWHRyZkJKbzV6THUxL1NnRVo2?=
 =?utf-8?B?UUhobTlSbTJvVjBuZmlSVE51emhGUHR4WEVDM0tpTXRYZU14YmdQRXdYdnR2?=
 =?utf-8?B?dldDbWxTcEZtdFpBUU54aHg5a3BLVXZ0N0dDaEJIb2o2MEJiZG1Fd1NhV2tU?=
 =?utf-8?B?Nkd3UWdSd0pWeEdyYnpZZ2p4Rm5sYlJvbkM2ZE13TUJVckIwM2JIUDZLU3gy?=
 =?utf-8?B?SVplOS8vcTdoQlluUkpWNG14OC9jTmF4L201ZUoydTBSa1Q2Q2pJOVdGeWMx?=
 =?utf-8?B?NklaVUdFaDlnMkhuV2pHTnY1cnY1Qm1qQS9GK3pFS0wxSW4rMitiUDdIVGZw?=
 =?utf-8?B?djVBc2dYbzl0bE5VVlVNb2ZVN0xZdEo0Qm56ZEQ4bHYzZmhmeFZjalVyU21M?=
 =?utf-8?B?bXp0NjVmRTRJRzFVOXNTMmxCTlhmbWFHU1U4WDJUQTkxU21nYjRSb3lOSXd6?=
 =?utf-8?B?VDZNUUhZU2F5bW85UGQxMFlwSWhTdnNiazBZdVc0L3dVL0VSaE91N2FWOTk5?=
 =?utf-8?B?ZzE3THdMbzJnYmFKaC9jaG5CWkJKNHVBcitzRTVpaXhLS094ZGtFQUNKYVpx?=
 =?utf-8?B?SlRLaGNpaGo3NVRVTjZXSkZSdlZjUGNQNWR5Wlo4MWpmR0dTUWdZVys0dVJW?=
 =?utf-8?B?SHZHNjVnbTlNWXJWdW9SMnVUVHRURXBQMGxJNFV4MVg1d3FjY0dPYWh0WHQ2?=
 =?utf-8?B?OEZoUE9wL3JMTFBiU0FDMUpUaUdqb0c2R1dleSt6R3BtbThTZzNsa2RReWxY?=
 =?utf-8?B?S3I1USt3bE05NXV2Vm1CWDFndXJSejNHbkJyQzlZRFRhM2orUHM1TnBKelVn?=
 =?utf-8?B?UDJPUWtrMjF2NWNpN3hpbVExK2o5eUNQU2F5WG9mU0ZxeU9qZUFoUUt6T2RE?=
 =?utf-8?B?cURtWVdhSFJ0WFZSQTFzcFNVMWZ0QVBoSWpjSnI0Nk1Cby9WNzYrK2JxbEZx?=
 =?utf-8?B?bUE3dWFzZ25TQWh6MzJYRjRJaVFYaTVEWTllZU1HVEQybUxWVVNZeG1Gb2o4?=
 =?utf-8?B?MW1RSXQ5bHBNRE1ITC9oYzBCcEpOM01HTjFVOG1hNGZTSDZNK2ZHcGJyekF0?=
 =?utf-8?B?d0dLWWxJaThUdGdmTkR4eFJxVGRNb0FKVFlMZVR1dkdvMUdZMEQyV0N5Tkli?=
 =?utf-8?B?ek9XRUdYL0Y3N1RlaDRSeHRtN0l2UU5JdTU0S3ZycUhoeGU5V3ZUMnl2aVFm?=
 =?utf-8?B?SVhnSG1wWHJHZFhqZ0xkOW9LOERRaEpVakE0WHFEZDFYMVZzZlZEUk5uVHA3?=
 =?utf-8?B?VFlUdjZxTlN0WTFwMUZ5TVNvRXhLOEMzSEJtNW9acmdscDFScG8zYTlWUUZP?=
 =?utf-8?B?TU9NcHdKRXBicXFyZkNmUkNTNCtVZitTYWFlZjdtNk81NjhjTy9tSlp5L0J3?=
 =?utf-8?B?bVJaeFM5Y3ZwUEdFWisrRVA3eUVJRU52b3lzbUxOQ0tIdUlRcWhLZDRHN05l?=
 =?utf-8?B?TGlINFNJZzJ5aVFjZkYyOVBaOUU5bzArUFdRb0pSTWNFN1VCMkdta2xqNmUw?=
 =?utf-8?B?RXVRY0VyNE5FVFRBTzkwM3pCanlva3pGbEZuOFhFbzNCQmpqZlJwbVRlbHJv?=
 =?utf-8?B?ZTVkdVlVbHg0UmtGaDJaMVQvNlJUT1NpeUF4TC9acm1MRENMYXJaaDliT3pm?=
 =?utf-8?B?b3lodVZwS1dmeTZLRWNaS2xSZFpWaGsxaU83TkQ3ZzZXK2VFSldlSFRGc2Vo?=
 =?utf-8?B?VUExcXdoOHJwU3Q4VVNhUVJtdUY5U2x4ME54bWhDQ2Y3dFhLTnhJNHRFSmhL?=
 =?utf-8?B?TzF2TWs0ZE5tTDFXR2dsSFhqdUdYeHkwNTdrUjFFMVRWQmptS3RuWlQxZkdV?=
 =?utf-8?B?QmVkR1hBTXBoZWtoaHExNWpaSG1MWlBjaWJNaG9sbit5N1BQMGtGckdPYUlp?=
 =?utf-8?B?NUZYQnVwWmxPOTlBL0FFUTB6NDNIUUZEbHhJOURPRkN2cmJ0YytYVktWd1VF?=
 =?utf-8?B?U0t2b29ab3QvNTF1ZDJkdDFSSUhjRU42OTJvMHpVMFpKY29lZG9DQkFzZDFS?=
 =?utf-8?B?TFdvMEw5UEV2ZWZqY09nalk0R2hmQmg0WnZDVm53eTl2Y290Zmg2MEhWV2NJ?=
 =?utf-8?B?eGVnaThnOHVXMFkySDJJRFFjU2tpcVMrNVFCVmllWTZMbUtZVUY5dXFiRUk0?=
 =?utf-8?Q?LojSHL1fMO4iXBZLlDNeMI0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147cda6c-ed4e-4944-e482-08dc552acc58
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 04:42:28.4936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k++Qu60wD7Eykv7az9ajDZodTbF3+WvLZHCzm9p56ZbS5CutKYhiD2r/L7ZSpYIDJUGCetKk24cJt+8ISjsm0ehq4C43aFtu/rqzf+TqA6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7577
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFycmlzb24sIEpvaG4g
QyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBcHJpbCA1LCAy
MDI0IDU6MTUgQU0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwu
Y29tPjsgRGUgTWFyY2hpLCBMdWNhcw0KPiA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgUm9w
ZXIsIE1hdHRoZXcgRA0KPiA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gQ2M6IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IEJyb3N0LA0KPiBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBWMiBpLWctdF0gdGVzdHMveGVfZXhlY190aHJlYWRzOiBNYWtlIGhhbmcgdGVz
dHMgcmVzZXQNCj4gZG9tYWluIGF3YXJlDQo+IA0KPiBPbiA0LzQvMjAyNCAxNjoyMiwgSm9obiBI
YXJyaXNvbiB3cm90ZToNCj4gPiBPbiA0LzIvMjAyNCAyMjozNSwgVXBhZGh5YXksIFRlamFzIHdy
b3RlOg0KPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IERlIE1h
cmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPj4+IFNlbnQ6IFdlZG5l
c2RheSwgQXByaWwgMywgMjAyNCAyOjI2IEFNDQo+ID4+PiBUbzogUm9wZXIsIE1hdHRoZXcgRCA8
bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPj4+IENjOiBVcGFkaHlheSwgVGVqYXMgPHRl
amFzLnVwYWRoeWF5QGludGVsLmNvbT47IGlndC0NCj4gPj4+IGRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQnJvc3QsDQo+ID4+PiBNYXR0
aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
VjIgaS1nLXRdIHRlc3RzL3hlX2V4ZWNfdGhyZWFkczogTWFrZSBoYW5nIHRlc3RzDQo+ID4+PiBy
ZXNldCBkb21haW4gYXdhcmUNCj4gPj4+DQo+ID4+PiBPbiBUdWUsIEFwciAwMiwgMjAyNCBhdCAx
Mjo0MDoxN1BNIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiA+Pj4+IE9uIFR1ZSwgQXByIDAy
LCAyMDI0IGF0IDA1OjUyOjIzUE0gKzA1MzAsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+Pj4+
PiBSQ1MvQ0NTIGFyZSBkZXBlbmRlbnQgZW5naW5lcyBhcyB0aGV5IGFyZSBzaGFyaW5nIHJlc2V0
IGRvbWFpbi4NCj4gPj4+Pj4gV2hlbmV2ZXIgdGhlcmUgaXMgcmVzZXQgZnJvbSBDQ1MsIGFsbCB0
aGUgZXhlYyBxdWV1ZXMgcnVubmluZyBvbg0KPiA+Pj4+PiBSQ1MgYXJlIHZpY3RpbWlzZWQgbWFp
bmx5IG9uIEx1bmFybGFrZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gTGV0cyBza2lwIHBhcmFsbGVsIGV4
ZWN1dGlvbiBvbiBDQ1Mgd2l0aCBSQ1MuDQo+ID4+Pj4gSSBoYXZlbid0IHJlYWxseSBsb29rZWQg
YXQgdGhpcyBzcGVjaWZpYyB0ZXN0IGluIGRldGFpbCwgYnV0IGJhc2VkDQo+ID4+Pj4gb24geW91
ciBleHBsYW5hdGlvbiBoZXJlLCB5b3UncmUgYWxzbyBnb2luZyB0byBydW4gaW50byBwcm9ibGVt
cw0KPiA+Pj4+IHdpdGggbXVsdGlwbGUgQ0NTIGVuZ2luZXMgc2luY2UgdGhleSBhbGwgc2hhcmUg
dGhlIHNhbWUgcmVzZXQuIFlvdQ0KPiA+Pj4+IHdvbid0IHNlZSB0aGF0IG9uIHBsYXRmb3JtcyBs
aWtlIExOTCB0aGF0IG9ubHkgaGF2ZSBhIHNpbmdsZSBDQ1MsDQo+ID4+Pj4gYnV0IHBsYXRmb3Jt
cw0KPiA+Pj4gYnV0IGl0IGlzIHNlZW4gb24gTE5MIGJlY2F1c2Ugb2YgaGF2aW5nIGJvdGggUkNT
IGFuZCBDQ1MuDQo+ID4+Pg0KPiA+Pj4+IGxpa2UgUFZDLCBBVFMtTSwgREcyLCBldGMuIGNhbiBh
bGwgaGF2ZSBtdWx0aXBsZSBDQ1Mgd2hlcmUgYSByZXNldA0KPiA+Pj4+IG9uIG9uZSBraWxscyBh
bnl0aGluZyBydW5uaW5nIG9uIHRoZSBvdGhlcnMuDQo+ID4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IE1h
dHQNCj4gPj4+Pg0KPiA+Pj4+PiBJdCBoZWxwcyBpbiBmaXhpbmcgZm9sbG93aW5nIGVycm9yczoN
Cj4gPj4+Pj4gMS4gVGVzdCBhc3NlcnRpb24gZmFpbHVyZSBmdW5jdGlvbiB0ZXN0X2xlZ2FjeV9t
b2RlLCBmaWxlLCBGYWlsZWQNCj4gPj4+Pj4gYXNzZXJ0aW9uOiBkYXRhW2ldLmRhdGEgPT0gMHhj
MGZmZWUNCj4gPj4+Pj4NCj4gPj4+Pj4gMi5UZXN0IGFzc2VydGlvbiBmYWlsdXJlIGZ1bmN0aW9u
IHhlX2V4ZWMsIGZpbGUNCj4gPj4+Pj4gLi4vbGliL3hlL3hlX2lvY3RsLmMsIEZhaWxlZCBhc3Nl
cnRpb246IF9feGVfZXhlYyhmZCwgZXhlYykgPT0gMCwNCj4gPj4+Pj4gZXJyb3I6IC0xMjUgIT0g
MA0KPiA+Pj4+Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMu
dXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+Pj4+PiAtLS0NCj4gPj4+Pj4gwqAgdGVzdHMvaW50ZWwv
eGVfZXhlY190aHJlYWRzLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+Pj4+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
Pj4+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMN
Cj4gPj4+Pj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX3RocmVhZHMuYyBpbmRleCA4MDgzOTgwZjku
LjMxYWY2MWRjOSAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY190aHJl
YWRzLmMNCj4gPj4+Pj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXhlY190aHJlYWRzLmMNCj4gPj4+
Pj4gQEAgLTcxMCw2ICs3MTAsMTcgQEAgc3RhdGljIHZvaWQgKnRocmVhZCh2b2lkICpkYXRhKQ0K
PiA+Pj4+PiDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPiA+Pj4+PiDCoCB9DQo+ID4+Pj4+DQo+
ID4+Pj4+ICtzdGF0aWMgYm9vbCBpc19lbmdpbmVfY29udGV4dHNfdmljdGltaXplZChpbnQgZmQs
IHVuc2lnbmVkIGludA0KPiA+Pj4+PiArZmxhZ3MpIHsNCj4gPj4+Pj4gK8KgwqDCoCBpZiAoIUlT
X0xVTkFSTEFLRShpbnRlbF9nZXRfZHJtX2RldmlkKGZkKSkpDQo+ID4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZmFsc2U7DQo+ID4+PiBhcyBhYm92ZSwgSSBkb24ndCB0aGluayB3ZSBzaG91
bGQgYWRkIGFueSBwbGF0Zm9ybSBjaGVjayBoZXJlLiBJdCdzDQo+ID4+PiBpbXBvc3NpYmxlIHRv
IGtlZXAgaXQgdXAgdG8gZGF0ZSBhbmQgaXQncyBhbHNvIHRlc3RpbmcgdGhlIHdyb25nDQo+ID4+
PiB0aGluZy4NCj4gPj4+IEFGQUlVIHlvdSBkb24ndCB3YW50IHBhcmFsbGVsIHN1Ym1pc3Npb24g
b24gZW5naW5lcyB0aGF0IHNoYXJlIHRoZQ0KPiA+Pj4gc2FtZSByZXNldCBkb21haW4uIFNvLCB0
aGlzIGlzIGFjdHVhbGx5IHdoYXQgc2hvdWxkIGJlIHRlc3RlZC4NCj4gPj4gUGxhdGZvcm1zIGxp
a2XCoCBQVkMsIEFUUy1NLCBERzIsIGV0Yy4gaGF2ZSBzb21lIGtpbmQgb2YgV0Evbm9XQSB3aGlj
aA0KPiA+PiBoZWxwcyB0byBydW4gdGhpbmdzIHBhcmFsbGVsbHkgb24gZW5naW5lcyBpbiBzYW1l
IHJlc2V0IGRvbWFpbiBhbmQNCj4gPj4gYXBwYXJlbnRseSBCTUcvTE5MIGRvZXMgbm90IGhhdmUg
dGhhdCBraW5kIG9mIHN1cHBvcnQgc28gYXBwbGljYWJsZQ0KPiA+PiBmb3IgTE5ML0JNRyB3aXRo
IHBhcmFsbGVsIHN1Ym1pc3Npb24gb24gUkNTL0NDUyBvbmx5Lg0KPiA+Pg0KPiA+PiBASGFycmlz
b24sIEpvaG4gQyBwbGVhc2UgcmVwbHkgaWYgeW91IGhhdmUgYW55IG90aGVyIGlucHV0IGhlcmUu
DQo+ID4gSSBkb24ndCBnZXQgd2hhdCB5b3UgbWVhbiBieSAnaGF2ZSBzb21lIGtpbmQgb2YgV0Ev
bm9XQScuIEFsbA0KPiA+IHBsYXRmb3JtcyB3aXRoIGNvbXB1dGUgZW5naW5lcyBoYXZlIHNoYXJl
ZCByZXNldCBkb21haW5zLiBUaGF0IGlzIGFsbA0KPiA+IHRoZXJlIGlzIHRvIGl0LiBJLmUuIGV2
ZXJ5dGhpbmcgZnJvbSBUR0wgb253YXJkcy4gVGhhdCBpbmNsdWRlcyBSQ1MNCj4gPiBhbmQgYWxs
IENDUyBlbmdpbmVzLiBTbyBSQ1MgKyBDQ1MsIENDUzAgKyBDQ1MxLCBSQ1MgKyBDQzAgKyBDQ1Mx
LCBldGMuDQo+ID4gQW55IHBsYXRmb3JtIHdpdGggbXVsdGlwbGUgZW5naW5lcyB0aGF0IHRhbGsg
dG8gRVVzIHdpbGwgcmVzZXQgYWxsIG9mDQo+ID4gdGhvc2UgZW5naW5lcyBpbiBwYXJhbGxlbC4N
Cj4gPg0KPiA+IFRoZXJlIGFyZSB3L2EncyB3aGljaCBtYWtlIHRoZSBzaXR1YXRpb24gZXZlbiB3
b3JzZS4gRS5nLiBvbiBERzIvTVRMDQo+ID4geW91IGFyZSBub3QgYWxsb3dlZCB0byBjb250ZXh0
IHN3aXRjaCBvbmUgb2YgdGhvc2UgZW5naW5lcyB3aGlsZQ0KPiA+IGFub3RoZXIgaXMgYnVzeS4g
V2hpY2ggbWVhbnMgdGhhdCBpZiBvbmUgaGFuZ3MsIHRoZXkgYWxsIGhhbmcgLSB5b3UNCj4gPiBj
YW5ub3QganVzdCB3YWl0IGZvciBvdGhlciB3b3JrbG9hZHMgdG8gY29tcGxldGUgYW5kL29yIHBy
ZS1lbXB0IHRoZW0NCj4gPiBvZmYgdGhlIGVuZ2luZSBwcmlvciB0byBkb2luZyB0aGUgc2hhcmVk
IHJlc2V0LiBCdXQgdGhlcmUgaXMgbm90aGluZw0KPiA+IHRoYXQgbWFrZXMgaXQgYmV0dGVyLg0K
PiA+DQo+ID4gSSBhc3N1bWUgd2UgYXJlIHRhbGtpbmcgYWJvdXQgR3VDIHRyaWdnZXJlZCBlbmdp
bmUgcmVzZXRzIGhlcmU/IEFzDQo+ID4gb3Bwb3NlZCB0byBkcml2ZXIgdHJpZ2dlcmVkIGZ1bGwg
R1QgcmVzZXRzPw0KPiA+DQo+ID4gVGhlIEd1QyB3aWxsIGF0dGVtcHQgdG8gaWRsZSBhbGwgb3Ro
ZXIgY29ubmVjdGVkIGVuZ2luZXMgZmlyc3QgYnkNCj4gPiBwcmUtZW1wdGluZyBvdXQgYW55IGV4
ZWN1dGluZyBjb250ZXh0cy4gSWYgdGhvc2UgY29udGV4dHMgYXJlDQo+ID4gcHJlLWVtcHRpYmxl
IHRoZW4gdGhleSB3aWxsIHN1cnZpdmUgLSBHdUMgd2lsbCBhdXRvbWF0aWNhbGx5IHJlc3RhcnQN
Cj4gPiB0aGVtIG9uY2UgdGhlIHJlc2V0IGlzIGNvbXBsZXRlLiBJZiB0aGV5IGFyZSBub3QgKG9y
IGF0IGxlYXN0IG5vdA0KPiA+IHByZS1lbXB0aWJsZSB3aXRoaW4gdGhlIHByZS1lbXB0aW9uIHRp
bWVvdXQgbGltaXQpIHRoZW4gdGhleSB3aWxsIGJlDQo+ID4ga2lsbGVkIGFzIGNvbGxhdGVyYWwg
ZGFtYWdlLg0KPiA+DQo+ID4gV2hhdCBhcmUgdGhlIHdvcmtsb2FkcyBiZWluZyBzdWJtaXR0ZWQg
YnkgdGhpcyB0ZXN0PyBBcmUgdGhlDQo+ID4gcHJlLWVtcHRpYmxlIHNwaW5uZXJzPyBJZiBzbywg
dGhlbiB0aGV5IHNob3VsZCBzdXJ2aXZlIChhc3N1bWluZyB5b3UNCj4gPiBkb24ndCBoYXZlIHRo
ZSBERzIvTVRMIFJDUy9DQ1Mgdy9hIGluIGVmZmVjdCkuIElmIHRoZXkgYXJlDQo+ID4gbm9uLXBy
ZWVtcHRpYmxlIHNwaW5uZXJzIHRoZW4gdGhleSBhcmUgdG9hc3QuDQo+ID4NCj4gPiBKb2huLg0K
PiA+DQo+ID4NCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+PiBUZWphcw0KPiA+Pj4gTHVjYXMgRGUg
TWFyY2hpDQo+ID4+Pg0KPiA+Pj4+PiArDQo+ID4+Pj4+ICvCoMKgwqAgaWYgKGZsYWdzICYgSEFO
RykNCj4gPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOw0KPiA+Pj4+PiArDQo+ID4+
Pj4+ICvCoMKgwqAgcmV0dXJuIGZhbHNlOw0KPiA+Pj4+PiArfQ0KPiA+Pj4+PiArDQo+ID4+Pj4+
IMKgIC8qKg0KPiA+Pj4+PiDCoMKgICogU1VCVEVTVDogdGhyZWFkcy0lcw0KPiA+Pj4+PiDCoMKg
ICogRGVzY3JpcHRpb246IFJ1biB0aHJlYWRzICVhcmdbMV0gdGVzdCB3aXRoIG11bHRpIHRocmVh
ZHMgQEANCj4gPj4+Pj4gLTk1NSw5ICs5NjYsMTMgQEAgc3RhdGljIHZvaWQgdGhyZWFkcyhpbnQg
ZmQsIGludCBmbGFncykNCj4gPj4+Pj4gwqDCoMKgwqDCoCBib29sIGdvID0gZmFsc2U7DQo+ID4+
Pj4+IMKgwqDCoMKgwqAgaW50IG5fdGhyZWFkcyA9IDA7DQo+ID4+Pj4+IMKgwqDCoMKgwqAgaW50
IGd0Ow0KPiA+Pj4+PiArwqDCoMKgIGJvb2wgaGFzX3JjcyA9IGZhbHNlOw0KPiA+Pj4+Pg0KPiA+
Pj4+PiAtwqDCoMKgIHhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKQ0KPiA+Pj4+PiArwqDCoMKg
IHhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7DQo+ID4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoaHdlLT5lbmdpbmVfY2xhc3MgPT0gRFJNX1hFX0VOR0lORV9DTEFTU19SRU5ERVIpDQo+ID4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhhc19yY3MgPSB0cnVlOw0KPiA+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgKytuX2VuZ2luZXM7DQo+ID4+Pj4+ICvCoMKgwqAgfQ0KPiA+Pj4+Pg0K
PiA+Pj4+PiDCoMKgwqDCoMKgIGlmIChmbGFncyAmIEJBTEFOQ0VSKSB7DQo+ID4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB4ZV9mb3JfZWFjaF9ndChmZCwgZ3QpDQo+ID4+Pj4+IEBAIC05OTAsNiAr
MTAwNSwxNSBAQCBzdGF0aWMgdm9pZCB0aHJlYWRzKGludCBmZCwgaW50IGZsYWdzKQ0KPiBQUzog
VGhlcmUgaXMgbm90aGluZyBpbiB0aGUgZnVuY3Rpb24gbmFtZSB0aGF0IHN1Z2dlc3RzIHRoaXMg
aXMgYSByZXNldCBzcGVjaWZpYw0KPiB0ZXN0LiBJZiB0aGlzIGlzIGNvbW1vbiBjb2RlIGZvciBt
dWx0aXBsZSB0ZXN0cyBpbmNsdWRpbmcgc29tZSB0aGF0IGRvIG5vdA0KPiBleHBlY3QgdG8gaGl0
IHJlc2V0cywgdGhlbiByZW1vdmluZyBhbGwgdGVzdGluZyBvZiBjb21wdXRlIGVuZ2luZXMgaXMg
YSBiYWQNCj4gaWRlYS4NCg0KV2Ugc2tpcCB0ZXN0cyB3aGVyZSByY3MvY2NzIGJvdGggYXJlIGlu
dm9sdmVkIGFuZCBIQU5HIGZsYWcgaXMgcGFzc2VkLCBIQU5HIGZsYWcgbWVhbnMgd2Ugd2lsbCBo
YXZlIHJlc2V0IGludm9sdmVkLiBPdGhlcndpc2UgYWxsIG90aGVyIGNvbXB1dGUgZW5naW5lIHRl
c3Qgd2lsbCBydW4gYXMgaXMuDQoNClRoYW5rcywNClRlamFzIA0KPiANCj4gSm9obi4NCj4gDQo+
IA0KPiA+Pj4+PiDCoMKgwqDCoMKgIH0NCj4gPj4+Pj4NCj4gPj4+Pj4gwqDCoMKgwqDCoCB4ZV9m
b3JfZWFjaF9lbmdpbmUoZmQsIGh3ZSkgew0KPiA+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogUkNT
L0NDUyBzaGFyaW5nIHJlc2V0IGRvbWFpbiBoZW5jZSBkZXBlbmRlbnQgZW5naW5lcy4NCj4gPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBXaGVuIENDUyBpcyBkb2luZyByZXNldCwgYWxsIHRoZSBj
b250ZXh0cyBvZiBSQ1MgYXJlDQo+ID4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogdmljdGltaXpl
ZCwgc28gc2tpcCB0aGUgY29tcHV0ZSBlbmdpbmUgYXZvaWRpbmcNCj4gPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBwYXJhbGxlbCBleGVjdXRpb24gd2l0aCBSQ1MNCj4gPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqAgKi8NCj4gPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChoYXNfcmNzICYmIGh3ZS0+
ZW5naW5lX2NsYXNzID09DQo+ID4+PiBEUk1fWEVfRU5HSU5FX0NMQVNTX0NPTVBVVEUgJiYNCj4g
Pj4+Pj4gKyBpc19lbmdpbmVfY29udGV4dHNfdmljdGltaXplZChmZCwgZmxhZ3MpKQ0KPiA+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgdGhyZWFkc19kYXRhW2ldLm11dGV4ID0gJm11dGV4Ow0KPiA+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgdGhyZWFkc19kYXRhW2ldLmNvbmQgPSAmY29uZDsNCj4gPj4+
Pj4gwqAgI2RlZmluZSBBRERSRVNTX1NISUZUwqDCoMKgIDM5DQo+ID4+Pj4+IC0tDQo+ID4+Pj4+
IDIuMjUuMQ0KPiA+Pj4+Pg0KPiA+Pj4+IC0tDQo+ID4+Pj4gTWF0dCBSb3Blcg0KPiA+Pj4+IEdy
YXBoaWNzIFNvZnR3YXJlIEVuZ2luZWVyDQo+ID4+Pj4gTGludXggR1BVIFBsYXRmb3JtIEVuYWJs
ZW1lbnQNCj4gPj4+PiBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+DQoNCg==
