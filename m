Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F7E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 17:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C719910EA23;
	Tue, 17 Dec 2024 17:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKC6BTng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DFE10E41D
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 17:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734455596; x=1765991596;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dQlJn4UtXrVCtjARa/Y5PXqDyenXlHYOiQe8JL6Srmk=;
 b=MKC6BTngp46XKruSdVCcrHRzpXHeAJKPAoOlHe663clVtVM0QJQxzfLt
 oipO1hFQveQIV9MNDGwLqT8pInTlPy+QRfXxwoeCmSoUiHBHaoIJcZyOn
 EdaZGUHVhInmIR1fWbS6YsKooXWJUxroHi6uX5NjSLS04/J+aMNUggDVA
 FWwDC1uUA4X6vxtumaLfYS1y2B5GA4R4U3lxLyPNSBO94nAn5vGajrLTs
 oXc7r4A+9/zbmZSym3UGa3JRm+NmL06Bpy1/jV+5Uoro9HclSKhckKGKM
 boDzDG+vu0VnCTl/pVCk3XzRo3NS5n8MBlKQ8zg9iDDflKe2orUQYph13 Q==;
X-CSE-ConnectionGUID: g0EWA/7PSG2vgivlBeFTxg==
X-CSE-MsgGUID: e209ppUlQ3iam1jX7UINRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34772794"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34772794"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 09:13:16 -0800
X-CSE-ConnectionGUID: wPB7/ip3RFWcZZhj3DcPIA==
X-CSE-MsgGUID: e6aJoKU4QQGTQSZ3ReOwyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98034374"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 09:13:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 09:13:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 09:13:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 09:13:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9T+EvrUqrsZGMuUfdnchfS3xpYy0T0/pvhDXNJC9YEeoJ/f3zEg6WZabxs5w21HxkXxIqeTFSQ1Q13qgFnwxWRNgAqDMUP3VDAnMBfZEIgAgchdtUz1M1g1FMdL79mS7DSs2L8j5y20p4Z/nsQ3+pwwSYJG1BljaF2zkp5HH8I4SIUwJs8Cl1rFf3ZTHfSq93PYahl3sVVJy1NsdohtO7fRCImu+Gs0v7f7KxEOejqBRO2S/oj17l09t7FRs1CblhVTPaFd+wOANX1q37OlG+hVv9JkKxC1mZodqDCM6uvzcvBCOtDM3H7n5pjY6h2QgIbPgsMCdcQ7wLpTg4CCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQlJn4UtXrVCtjARa/Y5PXqDyenXlHYOiQe8JL6Srmk=;
 b=xAznNS6W7cwlroNSycOkEHxVOU8QxqYXqWdqjAnurRBW9WRUhjRf8LAQIVVFF7cTr+CGGLkzxvQ7FRQZV/RNaPgnfHze7uOm8X0KupcC+35VyjI1uY9GpySl3cipIImamyUipYfpOkfYoCTh3Hmbpje+rc4bp955tdGOpuOLVfg5OoWQqg55s53f0BVYjGkMQmvB6iFcDpuiqbhRa82zWAYetAyF4D/mPdzchj3yDNZBbiwHKANcz9MjHgsOKZ+HS8Clu+VhHKDWnKLNV4WaSI6O77e0MIr/VxrprsZz67/ttW3Ppji/4hKXPBcQu5WlP5Kzrs4AZBEJJFJh0FdP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 17:13:12 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 17:13:12 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH 0/2] Fixes for MI_REPORT_PERF_COUNT
Thread-Topic: [PATCH 0/2] Fixes for MI_REPORT_PERF_COUNT
Thread-Index: AQHbUB71nP+06ilvU0qegyuyAk/437Lqq3+AgAACIwA=
Date: Tue, 17 Dec 2024 17:13:12 +0000
Message-ID: <fd6204d5194f31a7fd4592849a1ba5e8cf02d26a.camel@intel.com>
References: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
 <86588b9eec3e3b59a30fcd3aae1481dca21a651b.camel@intel.com>
In-Reply-To: <86588b9eec3e3b59a30fcd3aae1481dca21a651b.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5008:EE_
x-ms-office365-filtering-correlation-id: 9fae6ffb-423d-40c9-3275-08dd1ebe1654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MjJJTnBXbTdaVWE5N05wYTN6NVpCblQzcDNaeW1aNmlVbzJtQUtUQ0owUVZz?=
 =?utf-8?B?MUxWQmxLWVpmVXUwU2NTWGxoeHJ4RytvcndLMlE0TW15VGQyT0wyOFFTd3hG?=
 =?utf-8?B?S0g5cklCSHpzSWZidVpmbDYxNmZEZXVKc05PUjlEWlBRTUxxZG1YTE5KRFN4?=
 =?utf-8?B?MHoxK3ZpZk5qbkMwc3VEaVlZWG1sTStCbm1lTUltNGJlckdCZzlXRFpIZGQ4?=
 =?utf-8?B?ZjAydXNoNmwzcE1JUFJIbGdWbTlPWkVLc0xLYlk4UDVWd2RsRnV2RUFpY2Vm?=
 =?utf-8?B?bk1PNzNqVEJLMFNBcjNGSThSck1UWm9wN0xCYTRDM1RQWTRRVGd3TndhenVF?=
 =?utf-8?B?TlIzR0l3UzRVTUFGNFFJZVMyeWlsdzFlN2FpQ0UxS3FxdjJtRWdjeFVxeEI0?=
 =?utf-8?B?WUJyelo3Z1BiTXMxT1pOamRENS8vMUpCSG5oS0FqSVYvaFhEeEs2eExNQzhu?=
 =?utf-8?B?RmloZzZGOWdSb3JwMmlkcDAzUFc4eGFOVEJzOUorMlNURlo4b1ZncmxFRkdp?=
 =?utf-8?B?UGJTeUxTUXZhbVdkRmdTdnNqcWpsbWt5ZzF5NElZb2IwRENESDJUOFVZQ2pG?=
 =?utf-8?B?YUFYOTlseHkwdkhkdFh0Ylo0cHQ1bG1JSzBTNjBVSUtnbEFSUitYa0Ezb2g4?=
 =?utf-8?B?VktoelY4VEoxSjBudUxwRncyV1NxcFlQVWFrR3E0T3h5Uno4WEFFMlQxbUFP?=
 =?utf-8?B?dXdYYWF6Rlp5MEFnU1c3bWh6c1lOMGp1L2xMWCtXS2VIaFhhaXJOYXhPQUNW?=
 =?utf-8?B?T1FscGg4VVROYUtldzlSN1dsMGFRZlJ3c3lXNHZ5T0QyMnQ1VDlhV1lpaFh2?=
 =?utf-8?B?WDhKMjU4ajlQQXRYcnBhc3NMNE5iNlE2UDFZWFl2dUM1V3FPT1d3WjBBTVdC?=
 =?utf-8?B?OTF2QWsvVWNYejZVY1NIUWhOMDdScDBrWDgxcjR4ZDhabGZkTlFVcUtEREFi?=
 =?utf-8?B?RnZzUndrREpYbDRNdnMzTnduK3NqQUhvYnJoNHM1Tmh3UlNqZ01Fa0tDSzZR?=
 =?utf-8?B?aVNLYzVlNmR3bFdGdkE0MHBUbkF0aTFpeDFmTmRGVC9hWkJIQmdyVlJ3U3hw?=
 =?utf-8?B?T0dvQXdsQkVDVGNqYkovUWx6b3psSnVVa3B3eWo2V2UvbktpbUZuZzZNSkRk?=
 =?utf-8?B?QVJNR3VFbytORE83eHZvRGd3OFhKbzZXVWRSNEhMS21NME5za1ZCbjBXelNr?=
 =?utf-8?B?aEhaWG5oaWowbkthKzNOZ2dsbTE5emJ6QkE4NFFvYVhNV24vaWFIV3NzTUFY?=
 =?utf-8?B?QlVjWnhiM2tyaDBieCswcmFrSVNXNUUwS08vWUZjSkY1M0VkRHROS1VHdGJ1?=
 =?utf-8?B?cGlRMml0ZENQVkMxVEFReDVsbm1Ma0E0QVhFdmdvOVdyVHc3S2JCRFVXSTIz?=
 =?utf-8?B?TTE5eHVaaGhXZUVtTWFnc2IydG5IS0ZzK1g3eXF6MXhTZTYwMTlsRTR5RDVo?=
 =?utf-8?B?cmhQUWxWTDdlQ3NOTDZEdkhOeHQ2UGFkTHpScHRZNDVJS215dTIxZDJnaWlM?=
 =?utf-8?B?MndKOUN5WTNHZVUzSFNHWFBTV2hTOUx1SnRhcUJ4QytwOFg2ckxJSU5mYk5K?=
 =?utf-8?B?eWdDcXdwMHhjb0pHTTBFZTVRZXE0MVg1VHYxTGRVZGpFT2RrMklBa1JYMHBk?=
 =?utf-8?B?dGIrNURvT2xRclNjaU5XNkVZVTNNZjg5cm9jN1BIVlFRbXpFQVdhL25GaXFY?=
 =?utf-8?B?TDFiOXJVaVl0cytZNHpJaVE1NTI4ZXhtaXFvN3VNNkxEMlU3Q2RXOG95dTVC?=
 =?utf-8?B?b0xvUFRLa1JlS2ZiVDluaEgrOFMvYWwzTXFiWXBIbzg1YzhwMDYrOTBpVjRK?=
 =?utf-8?B?REZ3TVc4RjQ5WGxsc2tqMFRPSnhhWU5ieWhDVkVvVENsa3I3eWN4MjZiZ0px?=
 =?utf-8?B?Y2ZQbFZlbXlqVGFkV2NzTTZYYm1pSEd4MjZkS2c0UUZRZnRXVElJaE9iNCs3?=
 =?utf-8?Q?TOrO/uFfuY5zqcNek6ZSdIojg8w/tn2b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zkl5NTEraG5oZ3NmVEE0d1NVRUZXRTl2WFo4cVlPUmhzaXdRUmRJZnVqbmRM?=
 =?utf-8?B?ZmtRdmVLd200bGExM3BwMy83VUhHcXJMSmE2QjJnZXYyK2dQYzJXSDRUVTZn?=
 =?utf-8?B?ZHdNWndja0Q3SEU0TmdIWFEya0tpZFl0aUd6SnZhbDY4TDhqekJkNjN4czV4?=
 =?utf-8?B?eTNRcGN5Y1hRQUFGd0RtNS9YYkRzSGo5ZFcyZUFoWERKWFc3UWFVTCtlejc4?=
 =?utf-8?B?TlBnU0R0WnlHY3VTTlVkbHFQRDg1aGlTZjB4Ym1IWndiMWRGbVk1VzhvSE1F?=
 =?utf-8?B?cGUrWnFWQnNLcVROQUczL2lmTFBUVUlSb01xaWszeWk0ZmtuMkExU0hFeUxT?=
 =?utf-8?B?SHVxSFQ5MlBaanNWazhLN1dYRkdEUEpCd1ZLaHZwN2xvSHMxRDJCL21ZOXUy?=
 =?utf-8?B?bDZQamhCL3ZDQk9DMStzeVlWMDNjY2VnK2QrVVMvQU13UzZzL3RoZmY0Rm5G?=
 =?utf-8?B?T1UyZHJGRXNYS2tiVU5yTTdXdHlDRWFrVk1sYnN5Z1phalR2SEo1TEJEU3hW?=
 =?utf-8?B?c0lIT3FjRkViNTgxYVBoaEZYR3hWVFhjazFXM0JrNEhTQnhGYlZtUWNGVk0w?=
 =?utf-8?B?Q2NiWWF0WTAzVUVibmZFNytmaFA2bEdxTGVZOHhhRmNPOEZHZ0xENVk0TDhL?=
 =?utf-8?B?VDJFQzZjZ2NpSWNZTEtITWgza2xONFVhK3lxMGdFNFFOZWxqTUpzTk5ZT0Z4?=
 =?utf-8?B?b1JTc1dZWHZ2MXNlZFVPVmZBTVJVNlRNeWFpTVl5Ymp3OGdzeTBjQWtZVlVI?=
 =?utf-8?B?ZW91SDAxdDVTVDYxaE9HaUlJcE1lZFQ1Nm04RFIyTmxkUXRnSk1JSW05aExB?=
 =?utf-8?B?NDQ5RU1KazRibGxFV1lLRFJWTXYra0g1a1BEd1RucjU2UkNLMnhWOU1pOU8z?=
 =?utf-8?B?aTNpTC9FSmFzckRsYUJuRmRqeFdkcnZvZFJEemg5NE8yWHhPT1RqbnE4NjRM?=
 =?utf-8?B?bkFIYUNzeGJXMlcvb2NpSktSNDBrb0ZKRGZVb254NGZOSTc5TjdZaFBBWXFm?=
 =?utf-8?B?cnIzNHhIWnhYNUpUcWNpM2lyYndBclI4TlZkL011Z3VDVHRERmlIQUNrN1NL?=
 =?utf-8?B?MXN5UFk1TW1Fb3Y3VW1CeVZRY0lFSFNiR053a1MwK1V0RFBPNU5BWjNvWVFj?=
 =?utf-8?B?YXVxanArSmkwSE9zdExlQU12eG55QnNLTVZUTDRIdEp3eFpCNzNnMkRrTGh6?=
 =?utf-8?B?ZXozZEJiR0FSN0VqRVk5RkU0QmlkNFEyeGtTOWFLMmtXa1pvSlEvTEdGWnVZ?=
 =?utf-8?B?UGMvanV2QTU2R1hXanhCT25uYmhhR3J0VkNLNjl2QloyemY4WVdDLzBIYTJk?=
 =?utf-8?B?NHJOQWcwWjR6TkRIR1gwaExNa3dOZzQvV25JWEVyTEY4bEZ4UXorY1dPdzdV?=
 =?utf-8?B?eEVTeUFSUGhyRHBYbFdCV0ZGVUdlaE42ZmZZTHRVU0tkOE1lT0NEbmt6YVpK?=
 =?utf-8?B?L2svLzRjVzcrc3VnbGNSTURWNXpna1B4czgwekF4bVA3MStDdFQxL1JuTm5P?=
 =?utf-8?B?Y2N0Q3JJUUNYMTNIR1pud1FvUElqZkRMSUhja2Q0cVY1Y0x0Z2swd1VVdTFW?=
 =?utf-8?B?OHNZS2ZPcytFNkVJYVNGWGV0cFpiVnp6Q2F6VC9LWmFaZU5meVdYRGI1RHJr?=
 =?utf-8?B?bFZueG1wVml5cDNzZzRMOEh6NXRJQkZubm8wYXN1d3hFZGlTUXltU2xFeHNS?=
 =?utf-8?B?emlTQW9BVjdsZzl3UEtQc092NTNWUllxSzRjYmFiY0xScDExMlJHcDdFOGZa?=
 =?utf-8?B?WjlQUEE2VXZ3YTBZaWJxN1hrbW1PWDdEeXkwQVFnUHlSNXFzZ1pheFUraktV?=
 =?utf-8?B?UjNJaFRsZkNXRkJKNFJPektNT1pQV0xqcE12Y0lta2tFek1yUGxKV1lYdVBl?=
 =?utf-8?B?Mms4Tk0wOGxTV0JCVkRXMmt2TEI1cVZ3b3NFSFErai85Um4vRlVqeWUyWVNR?=
 =?utf-8?B?c296elZ1M3J6aWhGWG9DK3U1eE4vQnU3MGZOQUtRaFdIS2dWY1EzRXdHV3No?=
 =?utf-8?B?RmdybGVPemtrUTJzUkQvM3I3ZHlsTzJFKzVlVEQ5OURETDllb3QwNU0xeVg3?=
 =?utf-8?B?M0JXVVlsZGd2RGtwRGxndkV5ZWE0Y3NYb21KNGIyMHZjY1RJRTRMZGtmcWxT?=
 =?utf-8?B?bnJqaHowYVYrMTVmU2hyWkpKUjQ0OGI2elg3Sk9ndTBmaE5Zc3NqTTA4TnNH?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56D594DA8E87864B95E7F99F7664B1DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fae6ffb-423d-40c9-3275-08dd1ebe1654
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 17:13:12.3224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2HsRTKLm4h+oIe1a8HiMflzeJHns7BUnoziLlmOr4caLAlGrU1E2J6x6c8vyJwn+pniLtt/C9Pb0xb/97KGwjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

T24gVHVlLCAyMDI0LTEyLTE3IGF0IDE3OjA1ICswMDAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4g
T24gTW9uLCAyMDI0LTEyLTE2IGF0IDE2OjU4IC0wODAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEg
d3JvdGU6DQo+ID4gT0EgcHJvZ3JhbW1pbmcgc2VxdWVuY2UgZm9yIHF1ZXJ5IG1vZGUgb3IgTUlf
UkVQT1JUX1BFUkZfQ09VTlQgcmVxdWlyZXMNCj4gPiBtb2RpZnlpbmcgc29tZSBIVyByZWdpc3Rl
cnMgaW4gdGhlIHNhbWUgaHcgY29udGV4dCBhcyB0aGUgdXNlciBleGVjDQo+ID4gcXVldWUuIFVz
ZXIgcGFzc2VzIHRoZSBleGVjX3F1ZXVlIHRvIHRoZSBPQSBpbnRlcmZhY2UgYW5kIE9BDQo+ID4g
aW1wbGVtZW50YXRpb24gc3VibWl0cyBhbiBNSV9MT0FEX1JFR0lTVEVSX0lNTSB0byB0aGlzIHF1
ZXVlIHRvIG1vZGlmeQ0KPiA+IHRoZSByZWdpc3RlcnMuDQo+ID4gDQo+ID4gVGhlIE9BIGltcGxl
bWVudGF0aW9uIHN1Ym1pdHMgYSBiYXRjaCBtYXBwZWQgaW4gR0dUVCB0byB0aGUgdXNlciBleGVj
DQo+ID4gcXVldWUgYW5kIGhlbmNlLCBzb21lIHBsdW1iaW5nIGlzIGFkZGVkIGludG8gcmVsZXZh
bnQgY29kZSB0byBlbmFibGUNCj4gPiB0aGF0IChhcyBwZXIgc3VnZ2VzdGlvbnMgZnJvbSBNYXR0
aGV3IEJyb3N0KS4NCj4gPiANCj4gPiB2MjogcmV2aWV3IHJld29yaw0KPiANCj4gVGhpcyBzZXJp
ZXMgZml4ZXMgR1BVIGhhbmcgaGFwcGVuaW5nIHdoZW4gY2xvc2UgT0Egc3RyZWFtLg0KPiANCj4g
VGVzdGVkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4N
Cg0KQWggY2FuIHlvdSBhZGQgYSBGaXhlcyB0YWcgdG8gODEzNWYxYzA5ZGQyZWVjZWU3Y2I2Mzdm
N2VjOWEyOWU1NzMwMGViOCA/DQpXb3VsZCBiZSBuaWNlIHRvIGdldCB0aGlzIHBhdGNoIGJhY2tw
b3J0ZWQgdG8gb2xkZXIga2VybmVsIHJlbGVhc2VzLg0KDQo+IA0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVs
LmNvbT4NCj4gPiANCj4gPiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgKDIpOg0KPiA+ICAgeGU6IEFs
bG93IGEgR0dUVCBtYXBwZWQgYmF0Y2ggdG8gYmUgc3VibWl0dGVkIHRvIHVzZXIgZXhlYyBxdWV1
ZQ0KPiA+ICAgeGUvb2E6IFVzZSBNSV9MT0FEX1JFR0lTVEVSX0lNTUVESUFURSB0byBlbmFibGUg
T0FSL09BQw0KPiA+IA0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYyAgICAgICAgICAg
ICAgfCA3MSArKysrKysrKysrKysrKysrKystLS0tLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9yaW5nX29wcy5jICAgICAgICB8ICA1ICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9zY2hlZF9qb2JfdHlwZXMuaCB8ICAyICsNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNl
cnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4gPiANCj4gDQoNCg==
