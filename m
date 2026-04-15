Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FDAF43834
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 15:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C8810E6F8;
	Wed, 15 Apr 2026 15:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MinC7mGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C00F10E6F8
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776265849; x=1807801849;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fIstJap2DDxhMWoPeJgLAVldojoVVGubpqIIXI2ZR74=;
 b=MinC7mGhgs8TqlHuIR2zsqGhr/9ujMjyUE/RrkEPdSprwV/lrlRF/lV3
 NOAL8LuU6meyuwwnaKkvpf6BgZiJomNcSoEZt7q4WJle1bhSXkQUJpn47
 DJ1LZh57yFrS/8zlYprlSWyJCOJmrS/akSjJ1xp8oNUoRtDmfmCgfmjFk
 KQYo646G/LnJGIXJeBbf7VBLMWU2bi7W2uDvGwV2Y37+fsvD9iYuRSish
 iwpU0SA4U++vKyYURpcfiH8TeiEdNTkwnElIziDGyrqpQ3yp6XmffG/5j
 YaLIQ+FIKRD409w2PG0lX0+AfhFysd67MebJ9ReCHXHOgwIE6ZMEE0E6X Q==;
X-CSE-ConnectionGUID: L+Cu2pguTlGri6ctvZuTTg==
X-CSE-MsgGUID: tt+XbWMQSQm6DfbngLbxcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="79829325"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="79829325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 08:10:48 -0700
X-CSE-ConnectionGUID: w4aesaxBTne29JawZWOnoA==
X-CSE-MsgGUID: Qypy0YQQQRKW2720LkN09g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235399678"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 08:10:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 08:10:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 08:10:47 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 08:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYqHkGRJIJndyDl39X60wNvaJ5LCa5E82Y5M/WaEKalfty72O1kETl8f9P5kfkMC1pTw9hVE9xmnOI46rc4RA62W5dlKqrBNG1QZDJ0GP1diXtnLQs4W5SoCcav+6Lpzb8UaORbiio3/kubEW84yIr4CaJ7VD1k+hOrnVQOcqzqTwoWrIggN5GYnOQdBrpXAo+DUiXrtOr7AS+usbHuX9sFbddAsX32uM4fXdXSeF1HHbUJBqsv48mwgPrZxcmguykTo+Rx9pJ2yPoMg9o19AH4gIF+t7J7h2AGeeGPPY8OJ99TNnOhLeL3eUaNiIgkzVCPslVz6MI7zphwd5aFMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIstJap2DDxhMWoPeJgLAVldojoVVGubpqIIXI2ZR74=;
 b=ns62sBm1BE/UsdUUnb8eaDmC2E4Bzd+jrcG9CxFY5MLDns5uR6mmMvo1kszlfhPVOzfMoLDCNgU8qyqAcSefEIu810xVyC2TXBXZq+I9fmgcyo1sBLTExwqPoTWGKCoBq45OWkGxgn15oFt0WrMhApyoIwI8zSjj0XdQu90LFWndCGhTL7l3J4t2zBoPEUZirtxOlEp4dYEIgbMn7RkJniPCiLfKm4iA63k3WuqPSbrOIce3CCPxKLH9Olo69wp88cdSNnKmY79qoAK9L+n3EtT20TQDt8ur11pvvI0sUvHrriOCLVGhjjS5DNNTqmkGAxSIEgnpgLxbOV/WZfdMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Wed, 15 Apr
 2026 15:10:37 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 15:10:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH V7 0/9] Add memory page offlining support
Thread-Topic: [RFC PATCH V7 0/9] Add memory page offlining support
Thread-Index: AQHcy0fQUzyBLYthkE+pu3prSfpYY7XgPMrA
Date: Wed, 15 Apr 2026 15:10:36 +0000
Message-ID: <SJ1PR11MB620462D48CD805CD0B56D26D81222@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
In-Reply-To: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7578:EE_
x-ms-office365-filtering-correlation-id: 4eff3c38-bcfa-4b39-3561-08de9b0125e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: IpDmo+LR9R5M5OprWhy2jC8nhf0fiRXmWXwB9ZCEIGSFpr1UHtKomp8apluyFX+pDO1AUbyOtS6zsknig1drXBI2WqLp6mLzzIM2WGdiFCd5TVTUd9E03zl3/cD2nyXHii+K+OC+0eJnFjqyIQYKIftZmoiRGno69jvEby5JrTb4IBmrPvH+Lgk+wCGxLJBpWqQJNtHeeRnxYerMq4CBe7oN/ycUFiaHGaOB6haz/tzxl1NifxM0rhvJfWj4oc8tuf7vDrh0O0UuH142MTqC9yN1552sWuZ0bQwbhSmHfUKiNO2Sm8WMfE2ZgRn9qD50EphCq2XTe0lTfz+jGFZxEFqOjwAgmiwl/NvRWXnhqh/jhxfziitSpEaVqhUbSplD1adueK5s6OzHscpEnjVYQ6xwCwYAzDmRJoOE2L87Z9tGF6wabbuwTSJNiE9BFnrlWEZJK+LQoZqjPCagXqCewL9fAUOS/8/NfxP+zd4XOixRbzRXsuig29g0b1BRhHmIdGmQhlv+jgDGSGQ2xQoGXvS/3HuAD+2UoCcvsAJ4fjiu0sOMKNS7vbkhyRo6ckZ4cGiaV0DwLA/1MUKE6JLr1fGXWe6eHbmrioPob3wve3tBzmJfTfcrUZwP7FBC0OwzavMkF5ryV33tiXuRlOLaH0Xta1suozSz1KLTDWIfCb4Gury7lDyzYcIqPMooipE5hLpL/AnZWZB4EY4uU2pUHP236zixScP/wJdzpisNvao=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXJLZHB6b0l1QkliM21ka3VJdkR4RDhwVk9SQzcrdWcvbW1qOG52K2VoM1hH?=
 =?utf-8?B?c2lSL0YwMlRKbWlRMnVLNGlLL015MTlJRWtHdXF3Y2g4dVJJc01XaEkrQ1BO?=
 =?utf-8?B?UjA0YUQ3MXdQUXh1TlRER0ZUdjZXcUYzQUwwbE16TDhkbHV4WWVkdm1iSVdC?=
 =?utf-8?B?Wmp3VWYyTWlEYndkZ25YS25uVG5UWHR3cVl1UXBHMWhOOExTNXpjb1pPVit0?=
 =?utf-8?B?ZXMrTnVpQ0RhU2YveEpaK2Y0bGhITVRkTmMvbU5wYkxabVVLWGxFTDZtRlh1?=
 =?utf-8?B?YmdCenFNalNHcFY1ZGZkcmswQUl5OGk5STVDRFE1aERaVWVFWnhHeUlKSWdh?=
 =?utf-8?B?RHpqZTJqazBEQ1U2U0hzb0tjd1NOeFIyWFo2R1p6Vk5ERjRLWkJsNmkyWU9V?=
 =?utf-8?B?TFgrNFVLaFlrUVAxbEt5NFdUbW80SnZxVFdLSXZqenBBL1NyelFsc1c4bmw0?=
 =?utf-8?B?UFlrWDVDREh6Zk5oaklwN3JBeDhBcUFXdHpHbUVORkRnS3duS0NMTXhkeDFC?=
 =?utf-8?B?WkcyOHNqZmJKNnc2YjYwcllEZlM5THNtdmhCT2lRaDJiUnZrbDgzRk43aW85?=
 =?utf-8?B?TTh6eWV6cC9zQytPMFJKcnJyZjI1Rm52eEFPVW1JRTQxUktZZXk1TWJmQnlG?=
 =?utf-8?B?WWMzRVdSVVRGWm1NZ1oxanVsS1RCeXBQWSs3V2JXMGRId0xROWlHaWZSaFdS?=
 =?utf-8?B?L0p4ZnBlUXgrYjhlRTBwd2JaVEZMNDRPbkFLTzdrR0E5VmIyVEIzbkU1UGZo?=
 =?utf-8?B?ZGhHd2hXbi9vZS9HSEhabGRTcVhjbnVPSzZZOVFWN3Y3d3B1ZkJqSkNUdlBr?=
 =?utf-8?B?NmJCTHhzSm5FS0JRdTlGelVUT1ZNQWJrRWN6K0RiVnJWRmNDMWFycFZmNE9s?=
 =?utf-8?B?anlicWZpNGExTVVkUXZPZjhyZGpzZWp1SEVPMGF2KzZOT25qbWJrQzJGRkov?=
 =?utf-8?B?NTFaOVJPR3BFS25LbkZYanI3VTZndEpja1k4a0ZKSjlWVUJ3YVJVSW1YSTRl?=
 =?utf-8?B?SXdzS0RBQUVoekpJMytZNEJCdGNYeHFGRlVxUWdESndYcFEyVXdENjNuSlkx?=
 =?utf-8?B?LzlQNHdEREVZUlRvRXRRN1pGdWJPZEY0YldWaVp3dTRuNWdWSm56VlNkVEVh?=
 =?utf-8?B?L3liYmIxaE5GakZzbU1wUHNDK3B5TWtuOTVYS2RMN0lWWjhlQVdzeUtOLzN6?=
 =?utf-8?B?Z1NSMVBocGdPbDhTSXA4dmFoODVDUUU5MEU1MXo2YWpMZ3RBNUQwS2pOeUk2?=
 =?utf-8?B?bWdhcVVLYjArUjNoMGlrWGlJUnBZa3dqN3BKL29scVJGVjNtTWhvTTlxaHBT?=
 =?utf-8?B?UXlQSlRwcW5oV1h4MU1oT2xzTVdoM2ZnL1ZhenZYS1pyd01BeUQxZjIxWFZR?=
 =?utf-8?B?ZEtuQ01va3lEaWZORDRpRStXY2xVak50RW1PZDFoRVZCcVFzYWo1dEliQUlR?=
 =?utf-8?B?RzU4ZWFSVFpYMXRmRDh3SjBmcXNsWEhsWGdsUmp3SE5qdG4wOVM1OFlYSHZC?=
 =?utf-8?B?RmJaOVZYbzdIZ3k3YklDQ1IrdSt0c3Nha1EzbDY2YjRCZjRxU3ArVCs3cnk4?=
 =?utf-8?B?Tlo4bWpUNjNlbldvWmtlVVQrRkZlVHNXU2Nqc1A3anM0Nkw1Ynk5T3lOUjlV?=
 =?utf-8?B?YnQ0QzhtMFNmVjhtUWpXTFpVTHRubUlLNkYzQ2Zibk00ZDV2dzVmUlpldVZJ?=
 =?utf-8?B?d3VDUC9HeVRVazV2Nk81V2tUb0orMmRmY2UvMFdhbDhRcHFhWlVwRXBOR3di?=
 =?utf-8?B?Wnl2cGRSRGJPTUpNWXJDMlhpbFdWNTFWL2lvd2tYWGJZQ2hBM0pONk4rUjVG?=
 =?utf-8?B?Sms5d1BrQ0hBTWRGTEQzeURNdDFlb0JCSFM1R2srLzJFZXBsek9MMXd0Q2xu?=
 =?utf-8?B?bEx6ck9ibUd0VnNBZXJ2eWVBS3ZqaEQ3a1dzNXVDcmdiWnF0N2J4bnFIWjdC?=
 =?utf-8?B?SUtoVTViMHFqalpUNmwzVTJRczdnZDNTQ2xaaHRUVndhVjNINldqbWgzTytJ?=
 =?utf-8?B?eG9VMXlKcUEwcVJYTnBNMmRZbVF0RTZLOXd3d1lqNGM3alQzTVlOMGNQNlZQ?=
 =?utf-8?B?RW1hMGpNd1dQQ2xRVWtQWFd6NHVDbFQ4SnVEbGJjSmZWWXFCVm5qaXR4Uk9G?=
 =?utf-8?B?bnBSTzVJT1NEY1ovbTFycHVxdjhLYXdDRHRYbTl0R2QzRmlYdERmOFliMmZX?=
 =?utf-8?B?ZmdURmZmL2hJbmFYRDFFOXQvU2p2ZDFCSndjQ3ppVkxOcCtwUDJsRHJSZHlS?=
 =?utf-8?B?dUkzRjhoNEdHREt4TnpORDcxVFdyck02V1h2NGFNVWp1WTdmbFhvVmxTb0Nw?=
 =?utf-8?B?Z2xUUnp2Vm94akFQTldGYjlyeUt5YXVxVnRWTTNrcTNoOStZbmRCUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: D2sIi1lZQZq1nlVMZoYqceTVFMuMUTV2EIZrYBOYhEVORjETvvAuzuxQI81KNzDoIuw7E9ygEjAvzfZqa7SUoCyhZ/v6T+TgEPsacAtv+F5wmc3As1rf2/wJVpf/Kj4CmgYGWFfOdg22xXnOh0BemdxQgEPVCzZDvzp0CqneA43KiDqM562kbikLHqt3/hyM3rC4MQTJlT1Y1AqxPZGHYP0uAWFqSETYiZ0mX05I1KZAiTsdVnr1NBlMrSJtJvQVsAsZM7j7IaeAKjDPSBDTiyqYSs0BWq8QDKVXBaKV3r6PfqswShB9M/VfCRRcQlEgnRZR4GY82qZo+lXUYi7wEA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eff3c38-bcfa-4b39-3561-08de9b0125e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 15:10:36.5757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUJ+tfl6ayXysQUC3SwvDk/OuHBbhF4QcEV/FvKxBU6lFohGdGf7hcfWOiGZY7zY957sVqDdsAyVauXc220prOSCwFTVaQslUe1Iz6i0rTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7578
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

V2FpdCBvbiByZXZpZXdpbmcgdGhpcyBJIGFtIGp1c3QgcmVzcGluaW5nICB0aGlzIHdpdGggbW9y
ZSB1cGRhdGVzIGFzIGFmdGVyIFJBUyBpbnRlZ3JhdGlvbiBzeW5jIHVwIChpbiB4ZS1pbnRlcm5h
bCkgdGhlcmUgaXMgc29tZSB1cGRhdGUuIEFsc28gYWRkaW5nIGxvY2tkZXAgaW4gZ3B1X2J1ZGR5
LiBTZW5kaW5nIG5ldyB2ZXJzaW9uIHRvZGF5IG9yIHRvbW9ycm93Lg0KDQpUZWphcw0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMu
dXBhZGh5YXlAaW50ZWwuY29tPg0KPiBTZW50OiAxMyBBcHJpbCAyMDI2IDE4OjQ2DQo+IFRvOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEF1bGQsIE1hdHRoZXcgPG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+OyBCcm9zdCwgTWF0dGhldw0KPiA8bWF0dGhldy5icm9zdEBpbnRl
bC5jb20+OyB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsgR2hpbWlyYXksDQo+IEhp
bWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT47IFVwYWRoeWF5LCBU
ZWphcw0KPiA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUkZDIFBBVENI
IFY3IDAvOV0gQWRkIG1lbW9yeSBwYWdlIG9mZmxpbmluZyBzdXBwb3J0DQo+IA0KPiBUaGlzIGZ1
bmN0aW9uYWxpdHkgcmVwcmVzZW50cyBhIHNpZ25pZmljYW50IHN0ZXAgaW4gbWFraW5nIHRoZSB4
ZSBkcml2ZXINCj4gZ3JhY2VmdWxseSBoYW5kbGUgaGFyZHdhcmUgbWVtb3J5IGRlZ3JhZGF0aW9u
Lg0KPiBCeSBpbnRlZ3JhdGluZyB3aXRoIHRoZSBEUk0gQnVkZHkgYWxsb2NhdG9yLCB0aGUgZHJp
dmVyIGNhbiBwZXJtYW5lbnRseQ0KPiAiY2FydmUgb3V0IiBmYXVsdHkgbWVtb3J5IHNvIGl0IGlz
bid0IHJldXNlZCBieSBzdWJzZXF1ZW50IGFsbG9jYXRpb25zLg0KPiANCj4gVGhpcyBzZXJpZXMg
YWRkcyBtZW1vcnkgcGFnZSBvZmZsaW5pbmcgc3VwcG9ydCB3aXRoIGZvbGxvd2luZzoNCj4gMS4g
ZHJtL3hlL3N2bTogVXNlIHhlX3ZyYW1fYWRkcl90b19yZWdpb24sIGF2b2lkIGJsb2NrLT5wcml2
YXRlIHVzYWdlIDIuDQo+IExpbmsgYW5kIHRyYWNrIHR0bSBCTydzIHdpdGggcGh5c2ljYWwgYWRk
cmVzc2VzIDMuIExpbmsgTFJDIEJPIGFuZCBpdHMNCj4gZXhlY3V0aW9uIFF1ZXVlIDQuIEV4dGVu
ZCBCTyBwdXJnZSB0byBoYW5kbGUgdnJhbSBwYWdlcyBhcyB3ZWxsIDUuIEhhbmRsZQ0KPiB0aGUg
Z2VuZXJhdGVkIHBoeXNpY2FsIGFkZHJlc3MgZXJyb3IgYnkgcmVzZXJ2aW5nIGFkZHJlc3NlcyA0
SyBwYWdlIDYuIEFkZHMNCj4gc3VwcG9ydGluZyBkZWJ1Z2ZzIHRvIGF1dG9tYXRlIGluamVjdGlv
biBvZiBwaHlzY2FsIGFkZHJlc3MgZXJyb3IgNy4gQWRkDQo+IGJ1ZGR5IGJsb2NrIGFsbG9jYXRp
b24gZHVtcCBmb3IgZGVidWdnaW4gYnVkZHkgcmVsYXRlZCBpc3N1ZXMgOC4gQWRkDQo+IGNvbmZp
Z2ZzIGZvciB2cmFtIGJhZCBwYWdlIHJlc2VydmF0aW9uIHBvbGljeSA5LiBTeXNmcyBlbnRyeSB0
byBwcm92aWRlDQo+IHN0YXRpc3RpY3Mgb2YgYmFkIGdwdSB2cmFtIHBhZ2VzIGZvciB1c2VyIGlu
Zm8NCj4gDQo+IHY3Og0KPiAtIEltcHJvdmUgZGVidWdmcyB3YXJuaW5nIG1lc3NhZ2VzDQo+IC0g
VXNlIHNjb3BlX2d1YXJkIGZvciBsb2NraW5nKE1hdHRCKQ0KPiAtIEFkYXB0IGFkZGl0aW9uIG9m
IHF1ZXVlIG1lbWJlciBvZiBMUkMgQk8oTWF0dEIpDQo+IC0gRXh0ZW5kIGFuZCB1c2UgeGVfdHRt
X2JvX3B1cmdlIEFQSSBmb3IgdnJhbSBwYWdlcyhNYXR0QikNCj4gLSBIYW5kbGUgZG1hX2J1Zl9t
YXAgcmVxdWVzdHMgZm9yIG5hdGl2ZSBhbmQgcmVtb3RlKE1hdHRCKQ0KPiAtIEFkZHJlc3MgaWYg
aW4gbmV2ZXIgaW5pdGlhbGl6ZWQgYmxvY2ssIHNldCBibG9jayB0byBOVUxMDQo+IFY2Og0KPiAt
IEFkZCBtb3JlIHNwZWNpZmljIHRlc3RzIHRvIG5vbmNyaXRpY2FsIGJvIHNlY3Rpb25zDQo+IC0g
SGFuZGxlIHNtb290aCBleGl0IG9mIHVzZXIgY3JlYXRlZCBleGVjIHF1ZXVlcw0KPiAtIEJyZWFr
IGNvZGUgYW5kIG1ha2UgcHVyZ2Ugc3BlY2lmaWMgc3RhdGljIEFQSQ0KPiBWNToNCj4gLSBTeXNm
cyAibWF4X3BhZ2VzIiBhZGRpdGlvbg0KPiAtIFJlc2V0IGJsb2NrLT5wcml2YXRlIE5VTEwgcG9z
dCBwdXJnZQ0KPiAtIFJlbW92ZSB3ZWRnZSwgcmV0dXJuIC1FSU8gdG8gc3lzdGVtIGNvbnRyb2xs
ZXIgd2lsbCBpbml0aWF0ZSByZXNldA0KPiAtIEFkZCBkZWJ1Z2ZzIHRlc3RzIHRvIHRyaWdnZXIg
ZGlmZmVyZW50IHRlc3Qgc2NlbmFyaW9zIG1hbnVhbGx5IGFuZCB2aWEgaWd0DQo+IC0gUmVuYW1l
IGFkZHJfdG9fdGJvIHRvIGFkZHJfdG9fYmxvY2sgYW5kIG1vdmUgdW5kZXIgZ3B1L2J1ZGR5LmMN
Cj4gVjQ6IEFQSSByZXdvcmtzLCBhZGQgY29uZmlnZnMgZm9yIHBvbGljeSByZXNlcnZhdGlvbiBh
bmQgYXBwbHkgY29uZmlnDQo+IGV2ZXJ5d2hlcmUNCj4gVjM6IHVzZSByZXNfdG9fbWVtX3JlZ2lv
biB0byBhdm9pZCB1c2Ugb2YgYmxvY2stPnByaXZhdGUgKE1hdHRBKQ0KPiBWMjoNCj4gLSBzb21l
IGZpeGVzIGFuZCBjbGVhbiB1cCBvbiBlcnJvcnMNCj4gLSBBZGRlZCB4ZV92cmFtX2FkZHJfdG9f
cmVnaW9uIGhlbHBlciB0byBhdm9pZCBvdGhlciB1c2Ugb2YgYmxvY2stPnByaXZhdGUNCj4gKE1h
dHRCKQ0KPiANCj4gRGVidWdmcyBzaG93cyB0ZXN0IG9mIGRpZmZlcmVudCBzY2VuYXJpb3MsIGVj
aG8gMCA+DQo+IC9zeXMva2VybmVsL2RlYnVnL2RyaS9iZGYvaW52YWxpZF9hZGRyX3ZyYW0wDQo+
IHdoZXJlIDAgaXMgYmVsb3cgYWRkcmVzcyB0eXBlcyB0byBiZSB0ZXN0ZWQsIGVudW0gbWVtcGFn
ZV9vZmZsaW5lX21vZGUgew0KPiAgICAgICAgIE1FTVBBR0VfT0ZGTElORV9VTkFMTE9DQVRFRCA9
IDAsDQo+ICAgICAgICAgTUVNUEFHRV9PRkZMSU5FX1VTRVJfQUxMT0NBVEVEID0gMSwNCj4gICAg
ICAgICBNRU1QQUdFX09GRkxJTkVfS0VSTkVMX1VTRVJfR0dUVF9BTExPQ0FURUQgPSAyLA0KPiAg
ICAgICAgIE1FTVBBR0VfT0ZGTElORV9LRVJORUxfVVNFUl9QUEdUVF9BTExPQ0FURUQgPSAzLA0K
PiAgICAgICAgIE1FTVBBR0VfT0ZGTElORV9LRVJORUxfQ1JJVElDQUxfQUxMT0NBVEVEID0gNCwN
Cj4gICAgICAgICBNRU1QQUdFX09GRkxJTkVfUkVTRVJWRUQgPSA1LA0KPiB9Ow0KPiANCj4gSUdU
IHRlc3RzIGZvciB0ZXN0aW5nIHRoaXMgZmVhdHVyZToNCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoLzcxNDc1MS8NCj4gDQo+IFJlc3VsdHMgb2YgYWJvdmUgdGVzdHM6
DQo+IFVzaW5nIElHVF9TUkFORE9NPTE3NzQ2MTAwNTAgZm9yIHJhbmRvbWlzYXRpb24gT3BlbmVk
IGRldmljZToNCj4gL2Rldi9kcmkvY2FyZDAgU3RhcnRpbmcgc3VidGVzdDogdW5hbGxvY2F0ZWQg
U3VidGVzdCB1bmFsbG9jYXRlZDogU1VDQ0VTUw0KPiAoMS44MzRzKSBTdGFydGluZyBzdWJ0ZXN0
OiB1c2VyLWFsbG9jYXRlZCBTdWJ0ZXN0IHVzZXItYWxsb2NhdGVkOiBTVUNDRVNTDQo+ICgxLjgz
MnMpIFN0YXJ0aW5nIHN1YnRlc3Q6IHVzZXItZ2d0dC1hbGxvY2F0ZWQgU3VidGVzdCB1c2VyLWdn
dHQtYWxsb2NhdGVkOg0KPiBTVUNDRVNTICgxLjg3MXMpIFN0YXJ0aW5nIHN1YnRlc3Q6IHVzZXIt
cHBndHQtYWxsb2NhdGVkIFN1YnRlc3QgdXNlci1wcGd0dC0NCj4gYWxsb2NhdGVkOiBTVUNDRVNT
ICgxLjg0M3MpIFN0YXJ0aW5nIHN1YnRlc3Q6IGNyaXRpY2FsLWFsbG9jYXRlZCBTdWJ0ZXN0IGNy
aXRpY2FsLQ0KPiBhbGxvY2F0ZWQ6IFNVQ0NFU1MgKDEuODI0cykgU3RhcnRpbmcgc3VidGVzdDog
cmVzZXJ2ZWQgU3VidGVzdCByZXNlcnZlZDoNCj4gU1VDQ0VTUyAoMC4wMzJzKQ0KPiANCj4gVGVq
YXMgVXBhZGh5YXkgKDkpOg0KPiAgIGRybS94ZTogTGluayBWUkFNIG9iamVjdCB3aXRoIGdwdSBi
dWRkeQ0KPiAgIGRybS9ncHU6IEFkZCBncHVfYnVkZHlfYWRkcl90b19ibG9jayBoZWxwZXINCj4g
ICBkcm0veGU6IExpbmsgTFJDIEJPIGFuZCBpdHMgZXhlY3V0aW9uIFF1ZXVlDQo+ICAgZHJtL3hl
OiBFeHRlbmQgQk8gcHVyZ2UgdG8gaGFuZGxlIHZyYW0gcGFnZXMgYXMgd2VsbA0KPiAgIGRybS94
ZTogSGFuZGxlIHBoeXNpY2FsIG1lbW9yeSBhZGRyZXNzIGVycm9yDQo+ICAgZHJtL3hlL2NyaTog
QWRkIGRlYnVnZnMgdG8gaW5qZWN0IGZhdWx0eSB2cmFtIGFkZHJlc3MNCj4gICBncHUvYnVkZHk6
IEFkZCByb3V0aW5lIHRvIGR1bXAgYWxsb2NhdGVkIGJ1ZGR5IGJsb2Nrcw0KPiAgIGRybS94ZS9j
b25maWdmczogQWRkIHZyYW0gYmFkIHBhZ2UgcmVzZXJ2YXRpb24gcG9saWN5DQo+ICAgZHJtL3hl
L2NyaTogQWRkIHN5c2ZzIGludGVyZmFjZSBmb3IgYmFkIGdwdSB2cmFtIHBhZ2VzDQo+IA0KPiAg
ZHJpdmVycy9ncHUvYnVkZHkuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDk5ICsrKysrKw0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgICAgICAgICAgICAgICAgIHwgIDE2ICstDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaCAgICAgICAgICAgICAgICAgfCAgIDUgKy0NCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ib190eXBlcy5oICAgICAgICAgICB8ICAgMyArDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYyAgICAgICAgICAgfCAgNjQgKysrLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmggICAgICAgICAgIHwgICAyICsNCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmMgICAgICAgICAgICB8IDE3MSArKysrKysrKysr
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgICAgICAgfCAgNTEgKysr
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMgICAgICAgfCAgIDcgKw0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RtYV9idWYuYyAgICAgICAgICAgIHwgICAzICsNCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMgICAgICAgICB8ICAxMCArLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMgICAgICAgICAgICAgICAgIHwgICAzICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmMgICAgICAgfCAzNjENCj4gKysrKysr
KysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmgg
ICAgICAgfCAgIDIgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21ncl90eXBl
cy5oIHwgIDMyICsrDQo+ICBpbmNsdWRlL2xpbnV4L2dwdV9idWRkeS5oICAgICAgICAgICAgICAg
ICAgfCAgIDMgKw0KPiAgMTYgZmlsZXMgY2hhbmdlZCwgODIxIGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi41Mi4wDQoNCg==
