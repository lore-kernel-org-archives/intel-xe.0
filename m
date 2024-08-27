Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C5AC54736
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 20:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092AF10E418;
	Tue, 27 Aug 2024 20:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUuFDgI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF1710E418
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724790666; x=1756326666;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+eFfzfeIOFSc6DarXRnAR50TszVeJ5M6s0rX2JNzi2k=;
 b=SUuFDgI8ppvvCM6AXGkHSN66atEcj2YwmADZNOh9MmJOM+LUd/dDsYTK
 OzNRvF8tIXnpBtmWL/aSkArY2ScSNqZlu/ZkrCufSV6yM4zKwZRXWpJ2u
 +ckAoUAxqWLOaZ1ISzSXUAD7S8R3Jog5kXXSijumtZFhGvm/Mj5lSMeXZ
 UA4Khh/lYc1DrBVjun5d3bUGNS0NJUZCq1Mt1++fr8N9WfqQq9g/XcSVd
 3i1/ZjVls6Rgq9rvqXnGhqYXirA5sRhCyLZruH8JjL5dq+1sDiAqmPRbA
 YRZIVGRYEhaxhDLc6DHMJOOl1wM6FoZRljtnChRAP6Qj5Z+FZcGkaURk0 w==;
X-CSE-ConnectionGUID: Vtj6CHRcSRi4a8trXMIKoQ==
X-CSE-MsgGUID: 9L4dd39xQEGSm6kHshJ7cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13245673"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13245673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 13:31:06 -0700
X-CSE-ConnectionGUID: uHpbWVFtQIqugZHb90JlxQ==
X-CSE-MsgGUID: KqO63dQeTAa2Cn9JbdRh3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62649729"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 13:30:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 13:30:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 13:30:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 13:30:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 13:30:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEiighge3Y+hbQ63yzHWcbWMmPaLTBSma2J3pg7YCqDAjoYvCxi6OSBCDyMe0A2Ct9BG/KuYDlwixLmT1r46cz1JZlu5YB4FYzz4gKhFC7SBVKD8RCPnvn9sGfhFUen7VpmhBwJmJCJrq40fFvuMRseI+UMroOuo0V114qdI7rX7NuQiY1EzAdTtq1xUblJFQnPdJXdW55ybOKZLHOj0xDQ8UDjLS3T8uAzf8wv5FP9o7ozDn5FPs2iNGvVo2wdh14OUJ7gxKERrRliKjCaaN9pswFRcqm97zCKQNKr6zkwHY+dmFLhBrZmVZT73VbH9YKACHHFvbcxQA4utahmxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eFfzfeIOFSc6DarXRnAR50TszVeJ5M6s0rX2JNzi2k=;
 b=jBszzuhihKhTpT4W+EGQGFCKuOTpeY6QprXWEnZXU/htzqQ3MWFq1fEQlftcxc1M/1wUNFgHRFdq40HysF/wtv1jqQISVNYRyx+OhWYIBnGyFIJiwqjxifdU1BsxYBp+oDgdbMjXL32R1Lv0X8/Hu6bpvqhnXH0BwwywAyqTevbhtowy75OUm6G3PWR5ykrOzzjwNWMj6AnTgP4R48rE0ECHMw13a3B17ZZ6Erugr/xHyMYjuAOlC1UHWHb0ukAMndOnMaZXtjY/v67EYqivfola69ezvaNP8gRvc+2wwogyi/NDOrZy6NyfagzNMSH84bjip9LbFRQL3KR3HnYFQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Tue, 27 Aug 2024 20:30:55 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 20:30:55 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v16 1/7] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Topic: [PATCH v16 1/7] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Index: AQHa8qZi+1txp8+P8UmJAAUW1dwlLbI7mrUA
Date: Tue, 27 Aug 2024 20:30:54 +0000
Message-ID: <907851009fed50c370824f2cafc332f127841ef1.camel@intel.com>
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
 <20240820021142.436536-2-zhanjun.dong@intel.com>
In-Reply-To: <20240820021142.436536-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA0PR11MB7742:EE_
x-ms-office365-filtering-correlation-id: 3e2551e9-8bca-44a5-894d-08dcc6d726c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b3F0KzFoNkI4N3lYMzY0NkNHZWU4Q01FQ3lpdlQzaVJaenhuQ0krRnpPZndL?=
 =?utf-8?B?RXkyK2QvSVo5WWgyOFpodktodEF2WU9sdDZlL1d5NzVhNGJraXY4WUVlUmlO?=
 =?utf-8?B?Y044M2Y3YlhXVkNVeDhIdGtqMXk2bVBIb0tyQmtFMjRIbGpJR1d1RDAxdFY2?=
 =?utf-8?B?Q0poc1ZMODVGTjVlbHUwaWtwK0pRb1RsZU1HbUdGSHNxNUl6ZG40YXBxNUkv?=
 =?utf-8?B?Ykl3YWlNV0Zmb0FqUklIRjd3dThoV2psNWtTWHhmVXAyVW1NcW1zWEd4empx?=
 =?utf-8?B?b3ljWmRudXRGL3BGNkd3UHlBWEtmbGtBckF5RkJ3RkxtdmNsQVFDSHBacEZX?=
 =?utf-8?B?N2pQQkxPOURYazVIRGt3MW9TQm5lVDNEOG5hTGlucVFiRmdhY3lkQ3dEZkVh?=
 =?utf-8?B?aVlsd0NaOWcxUS9YL0RWTExVOFQ2SFY0WXIzVUtsU0UrOG4raXp2YmRQajVX?=
 =?utf-8?B?VkNmMW5wWHNuK05ENTBad3VlUVRZc3Rmem9FazBrMmE2ZzNybitLSlAvUGpW?=
 =?utf-8?B?MTBCanBjV3pvT2F4b0c3WFRKVjhrMHZBYmFUYThPb0RNRHJwdGt1R3N6S1lS?=
 =?utf-8?B?TkVQMzU4NWE1b3kzTHJldnFaTGdnbzFVSXdMS1dlL2s0SFBaMEZBYXpiZDBk?=
 =?utf-8?B?eE50UGlVQ0pxYWRrUGdXVXk3cCs1SnhmeUlxQVI4N2F5d2tCWU90L3ZzQlJy?=
 =?utf-8?B?TnBQdjMvQmhmVnNsTzhEU0NDYnRVVWY3Qkt2L3loSktyUDVMVDY0VkVsUlp3?=
 =?utf-8?B?NGhDMWhDOWdZL0dvb1VGUWwwKzFpY0pBOGRxb2tad1VYdjMra3oraFQ1VGs0?=
 =?utf-8?B?b1hWVlNEWkcxQXJqSGl0cDB5MDBFc0JHSllqZ1ZYRXJJOXVVRTNsRGc2YlNt?=
 =?utf-8?B?VGZ3VUlhb1ZydWZrWVl3NTl6cTUwZStzbzB4Q2xtV1UxTGx3NVhaR3NJQWI3?=
 =?utf-8?B?bEZSL2phZnhxeGk4S04xOHNLQXBNeEV5dGhwTXVSL0FObGRST2x5dzFrb3Z1?=
 =?utf-8?B?YzFkUGRGa1dBUk43aGoyRklmdEMrcDBiTmZ1Y2dUUmJVRzJSMzdmR0RpdTNZ?=
 =?utf-8?B?SXplZ3F5aExIbi9vaTEvV0h1bmpIRGpMMWc4UjBOWXJaTndNZjRZNDRuWmcv?=
 =?utf-8?B?QmpMWGl6SWdYelFmSHo2MjQwZW9yZk1NSXRwZVYrUWtoWHdUV1d5NWNmREMr?=
 =?utf-8?B?YUlXek1JdWxZcEhJQ0h4THhoS09zd0RmVUVOWlBzSTEvdUdsTUs1b0luMFNX?=
 =?utf-8?B?WmRBR1VKTUp3anlqWmNJNkR0WktORGZ1a1A5MnhkZ3d4bjFOUUZSbHI0UFJG?=
 =?utf-8?B?WlFOQXlsak1RVGpycHkvRG9zaElZb3RibGtTR3dUaDZhaW1ONitKK2g0Sjc4?=
 =?utf-8?B?RGhrYjU2N1daVzB3ZzRqYVhmb3ZjTWNITTJUclZKMEduRHBhUUtRcTJLMlZX?=
 =?utf-8?B?RmVZNTJid0JxOHlsbWlmR2t5TlZEYXBuSGZFbGFmbFFFUlZJdzM4TUJWOTF1?=
 =?utf-8?B?a3dyYjBCTEwwcEtaNlN3c3dhblYvSWs3ZFhlMU1Hd3NpMmJDUkN4aFAveXlq?=
 =?utf-8?B?STU0dzZtcEY5NDBNc25MMHNRT0dESzQ1ZHRjZ2tSSVZqVTQxS0o1ZHg3d0Ez?=
 =?utf-8?B?b25WMWlvbVk3NEt3MnJZeVM0TnBaSVQzOEdMTHNtbW9IRVdtbmZIMmpYMW8z?=
 =?utf-8?B?WGZlbVIvUjVlU1UzQXB5UWtobUp2SW04a0dZSTlRZXdXaHpUTWxWMk50bVlX?=
 =?utf-8?B?c1RGc2VUYitmZFZhbGtDWFZlNS8zL1NYdkwvU2k4a1RWV0t3T281Qm1SdnVm?=
 =?utf-8?B?MUFSTXhweUVUOUFJc3N6aU9hb2dxU09xSjBNMEZjeDRHVHB4akpSVUx3RHEy?=
 =?utf-8?B?UFBGWXkyVlczcFBCRDEvMXU5d2dNTytLUVJrUFhYbFlPVUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlBUTjNxUnU2b2E1YlJrMyt5d3k2N0pxRUFHaG44WE9iczJZVk8vQlVoTnpP?=
 =?utf-8?B?SnJLcmhtbnF5THZuNzFnUnlLY1JrelhPOVdmVkUxL2h5YnBReE1mYlpwN1FK?=
 =?utf-8?B?WW81M21ObE94ZDBJVUM1Rm9mOGQ4Z0xMR20xSHdmcnlPaElQZHp2MjN3TS9G?=
 =?utf-8?B?RWlmSHNndUt5NWdZU2RQcGtkYnVNZDYwV0tvbFczOG53dzBXaGs5aHB4TzZx?=
 =?utf-8?B?Vk1qalFBNXFjSG9WMDE5YUQvNXdOcVh5a0N5OG9oM3Y5VG15K1dLT0k2bzV3?=
 =?utf-8?B?b29rVmk2d0hOOVFVNzBpdEJDZ2xXQTVXUnJrRFFUUXc4ZXV0dnJWQ2p2RGdQ?=
 =?utf-8?B?U2JuQnowaTErWWkvaUw2K3dBSkdBTTlvT21zQ0YwYlNGaTZqSG5GRkw4Skg1?=
 =?utf-8?B?TnN4WERlUGgzaHdsMlpSc1lSU2xsS1dyaVJScmdUZHVKbUJpVWNsbWJmRXM4?=
 =?utf-8?B?WEpaS2RaRXVublI2WXRyZ1VMb3B6V3hQNkRxcWwzano5N0VuTWVZellmZ3Ni?=
 =?utf-8?B?bVV3QUc0YjA5WXRLK2dWbFNzZmp0VUtmUmJkL05idnBmZUlZak1DaVRYK0pY?=
 =?utf-8?B?SWNWczJodEltMTdnY3RhQXJyQy8vL3RocDIrUG96eDNRY0NCVVltajZsWnhl?=
 =?utf-8?B?VnFxTkt2TExpSzNESHFDVXg3TDN3dHdJUHdQNWl3K2hweHVSZFBsSVRIazZG?=
 =?utf-8?B?a0F3d0cwakd3bHE0VjErRkgzM25kRWtrSTVHeEp3MEFFNUFpZVJzRG1rWGRt?=
 =?utf-8?B?ZUlNQmRmVTFQYXJGWGgzc04wSlhjcUQvaXd3TU9VcVZGeVhUdVI3em5JY090?=
 =?utf-8?B?b0VOdUVkNmpkV1dpcmkvV2w4bjVFQlcxTm5TaEc2RktvbEU2Z0NCVXdCTkJN?=
 =?utf-8?B?NEh2WVFwb0NxOXZSeVI3YlJFN2RUTnpJTmZ1SUdOUWpOWU1JUzRSMllIM3Ux?=
 =?utf-8?B?ejVYN3dVamc1T1dNOWE4UHo5MEVMOUxCNkdIM1FJeUVndUVCekdGTVd4aVZx?=
 =?utf-8?B?L3FSMWRsai9lMGdDN3lFdU5uTFZTbk53eHBaMDdDS0ozcFQxTG11eGxZSGIr?=
 =?utf-8?B?ZVEzZ3VrN3dHQ3phMVhBOEZ1YXVXenVLdGpKdm9oMFJrK1Z3R21zT0Irc3lH?=
 =?utf-8?B?dU0wTnowMDVYak9iTGdBRk5WSXFyaWhLSVdBcDZLcWhaY056dVB6allOWFlt?=
 =?utf-8?B?K2ZUZlE5N0VGc2lRM2lObkdXbnJrWGJXZW12dkJPNDVXR1V0WkxyZDIzdmZB?=
 =?utf-8?B?cVVQcnZ0c1ZPbEJhTG1TenJpeTJjNnlrcWJvcGFXaXZpMkIxeTByUVV4d0xX?=
 =?utf-8?B?eGJMdWRYRTB2Rm10YUI4c3Y0Y0tsRkFEeCtRV1M0WktsZkNrVFZhTjB4ME5k?=
 =?utf-8?B?cVVqVlU4NWFDazE2Q1NnZC82N1RpeElOZ2pNUFBqM3gxTkZsS25qUXlYRnU5?=
 =?utf-8?B?T21PbVQxaE9CSnU1STVZVlFyR3E3bGlHdmFpeFN2U0l4VDlUd2dBU3BoaERI?=
 =?utf-8?B?REZZNUJJMjVtT0RXRXM4ZHRVc09QRkh2N1QxWm0xa2kvbWtqSS96Rit3dzRZ?=
 =?utf-8?B?Nzg5MHJieldwN3BsNFh2eGZWOGVwR3VhYncveHh0T1A0TzZvbnhuTUVpOC9W?=
 =?utf-8?B?ZTIvV09XekN1bDdYalB6MEE2YVMrRWF3YUtrZGNnOXFLemljVmRoelZxN1U4?=
 =?utf-8?B?MU0veFNXdFgveWdDYzkxcHhVSmZhRFVnYkQzWUJnaUdSdk9HeUtMU2pwWmVH?=
 =?utf-8?B?UzduQ0dsL1ZHanQySnVIeEl1Sk9CM1JmTksyY01QbW5rT3RYN1Q1VzZiK0hI?=
 =?utf-8?B?WVRtRk1vYXB4RTE2Njh2RkNvS2xOZ2lLSG11N0FSbnMwTVlOcTQ0UWIzMW8y?=
 =?utf-8?B?RUNYUlZZM0s4ZGh5Umd4UFIzMitDMUZWQXdVVGhUeGZiVHpNWk9MQ2pZMVlP?=
 =?utf-8?B?NXdjN2Fobjd4U3A1Qy82ek5SVlkxT3F5QnBsbXROb0xLWSt0SGwwNmx3Mks5?=
 =?utf-8?B?aGg5M0U2ZE5NbmdobzNFaVcyUldSQ1hBQ0kxZEZEOU5mY3FtMThDNm5mRlVE?=
 =?utf-8?B?UXpaanpGeUFockM1aFZXcXdkcnRzZ1VyYVBWNE5ha0FtZnhrZzduSEpKSThh?=
 =?utf-8?B?ZUxVM1dYa1NSSDcwSUZ6YVR3cEpBNDl5alA5YktBNzBHdDJkR1piTjFQSHg0?=
 =?utf-8?Q?M92nvL7o2/9uUgZfEF8g9Us=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD47E1B82BF95B46B7A94DFB985D026F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2551e9-8bca-44a5-894d-08dcc6d726c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 20:30:55.0180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8r6k0ke+ZvT0Y6ksabsUPs4Rze/I24i0CecRk1IlL5B9nNtmDFX7W0pt4IgsBJUNxwFe+H8DM/PCqBPTAvhDVm+OjEmpZgcT8IikS4Q7lY2nAeGX8NpbiD/Q5bHPa3+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
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

U28gaSBvbmx5IGhhdmUgYSBmZXcgbml0cyBzaW5jZSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHYx
NSB2cyB2MTYgb2YgUGF0Y2gjMQppcyBsaW1pdGVkIHRvIHRoZSBpbmNsdXNpb24gb2YgdGhlIGFk
ZGl0aW9uYWwgdmFyaWFibGVzIGluIHRoZSByZWdpc3RlciBsaXN0Cih0byBhaWQgd2l0aCBmb3Ig
cHJpbnQtZm9ybWF0dGluZyBvZiBvdXRwdXQpLCBhcyB3ZWxsIGFzIHRoZSBzZXBhcmF0aW9uIG9m
Cmxpc3QgZm9yIGxwZyB2cyBocGcuCgpIb3dldmVyLCBsZXRzIGVuc3VyZSB3ZSBjaXJjbGUgYmFj
ayB3aXRoIGNvbmZpcm1hdGlvbiB0aGF0IHRoZSByZWdpc3RlcgpsaXN0IG9yZGVyaW5nIGlzIG5v
dCBpbXBhY3RpbmcgdGhlIGRlYnVnIHRvb2wuIEZvciBub3cgSSdtIHByb3ZpZGluZyB0aGUKY29u
ZGl0aW9uYWwtcmIgcGVuZGluZyB0aGF0IG9yZGVyaW5nIC0ganVzdCBuZWVkIGEgcmVwbHkgb24g
dGhpcy4KdGhhbmtzIGFnYWluIGZvciB0aGUgcGVyc2V2ZXJlbmNlLgoKClJldmlld2VkLWJ5OiBB
bGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4KCgpPbiBNb24s
IDIwMjQtMDgtMTkgYXQgMTk6MTEgLTA3MDAsIFpoYW5qdW4gRG9uZyB3cm90ZToKPiBBZGQgcmVm
ZXJlbmNlZCByZWdpc3RlcnMgZGVmaW5lcyBhbmQgbGlzdCBvZiByZWdpc3RlcnMuCj4gVXBkYXRl
IEd1QyBBRFMgc2l6ZSBhbGxvY2F0aW9uIHRvIGluY2x1ZGUgc3BhY2UgZm9yCj4gdGhlIGxpc3Rz
IG9mIGVycm9yIHN0YXRlIGNhcHR1cmUgcmVnaXN0ZXIgZGVzY3JpcHRvcnMuCj4gCj4gCmFsYW46
c25pcAoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUuYwo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wZTc1ZDE1NTM3MzAKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMKPiBAQCAtMCwwICsxLDUw
OCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUCj4gKy8qCj4gCmFsYW46c25p
cAo+ICsKPiArLyoKPiArICogRGVmaW5lIGFsbCBkZXZpY2UgdGFibGVzIG9mIEd1QyBlcnJvciBj
YXB0dXJlIHJlZ2lzdGVyIGxpc3RzCj4gKyAqIE5PVEU6Cj4gKyAqwqDCoMKgwqAgRm9yIGVuZ2lu
ZS1yZWdpc3RlcnMsIEd1QyBvbmx5IG5lZWRzIHRoZSByZWdpc3RlciBvZmZzZXRzCj4gKyAqwqDC
oMKgwqAgZnJvbSB0aGUgZW5naW5lLW1taW8tYmFzZQo+ICsgKgo+ICsgKsKgwqDCoMKgIDY0IGJp
dCByZWdpc3RlcnMgbmVlZCAyIGVudHJpZXMgZm9yIGxvdyAzMiBiaXQgcmVnaXN0ZXIgYW5kIGhp
Z2ggMzIgYml0Cj4gKyAqwqDCoMKgwqAgcmVnaXN0ZXIsIGZvciBleGFtcGxlOgo+ICsgKsKgwqDC
oMKgwqDCoCBSZWdpc3RlcsKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGFfdHlwZcKgwqDCoMKgwqDC
oCBmbGFnc8KgwqAgbWFza8KgwqDCoCBSZWdpc3RlciBuYW1lCj4gKyAqwqDCoMKgwqAgeyBYWFhf
UkVHX0xPKDApLMKgIFJFR182NEJJVF9MT1dfRFcswqDCoMKgIDAswqDCoMKgwqDCoCAwLMKgwqDC
oMKgwqAgTlVMTH0sCj4gKyAqwqDCoMKgwqAgeyBYWFhfUkVHX0hJKDApLMKgIFJFR182NEJJVF9I
SV9EVywswqDCoMKgIDAswqDCoMKgwqDCoCAwLMKgwqDCoMKgwqAgIlhYWF9SRUcifSwKPiArICrC
oMKgwqDCoCAxLiBkYXRhX3R5cGU6IEluZGljYXRlIGlzIGhpL2xvdyAzMiBiaXQgZm9yIGEgNjQg
Yml0IHJlZ2lzdGVyCj4gKyAqwqDCoMKgwqAgMi4gUmVnaXN0ZXIgbmFtZTogbnVsbCBmb3IgaW5j
b21wbGV0ZWQgZGVmaW5lCj4gKyAqwqDCoMKgwqAgQSA2NCBiaXQgcmVnaXN0ZXIgZGVmaW5lIHJl
cXVpcmVzIDIgY29uc2VjdXRpdmUgZW50cmllcy4KYWxhbjpuaXQ6IHRoaXMgc2VudGVuY2UgYWJv
dmUgc2hvdWxkIGJlIGNvbWJpbmVkIGFzIHBhcnQgb2YgIjEuIgo+ICsgKi8KPiArI2RlZmluZSBD
T01NT05fWEVMUF9CQVNFX0dMT0JBTCBcCj4gK8KgwqDCoMKgwqDCoMKgeyBGT1JDRVdBS0VfR1Qs
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFJFR18zMkJJVCzCoMKgwqDCoMKgwqAw
LMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKgIkZPUkNFV0FLRV9HVCJ9Cj4gKwo+ICsjZGVmaW5l
IENPTU1PTl9CQVNFX0VOR0lORV9JTlNUQU5DRSBcCmFsYW46IHBsZWFzZSBlbnN1cmUgeW91IGhh
dmUgM2QtdW1kIGZvbGtzIGNvbmZpcm0gdGhhdCB0aGUgY2hhbmdlIGluCm9yZGVyaW5nIG9mIHRo
ZSByZWdpc3RlciBwcmludG91dCBpcyBub3QgYW4gaXNzdWUgLSBzaW5jZSB3ZSBhcmUgbm93CnVz
aW5nIHRoZSBzYW1lIGxpc3QgZm9yIGJvdGggZXhlYy1saXN0IGFuZCBndWMuLi4gYW5kIHRoZSBv
cmRlcmluZyBpcwp3aWxsIGJlIGFsaWduZWQgZm9yIG9iaHQgdGhlIGd1Yy1hZHMtcmVnLWxpc3Qg
cmVnaXN0cmF0aW9uIGFzIHdlbGwgYXMKdGhlIGRldi1jb3JlLWR1bXAtcmVnaXN0ZXItZHVtcCBw
cmludG91dCAod2hpY2ggaXMgd2hhdCB3ZSBwcmVmZXIgdG8KZW5zdXJlIG5vIGR1bGljYXRlZCBs
aXN0cyBmb3IgZXhlYy1saXN0IHZzIGd1YykuIElmIHlvdSBhbHJlYWR5IGNvbmZpcm1lZAp3aXRo
IHRoZW0gb2ZmbGluZSwgcGxlYXNlIHJlcGx5IG9uIHRoaXMuIEkgd291bGQgZXhwZWN0IFVNRCdz
IHNjcmlwdHMKYXJlIGZsZXhpYmxlIHNpbmNlIHRoZXkgaGF2ZSB0byBoYW5kbGUgZGlmZmVyZW50
IGdlbiBwcm9kdWN0cyB3aXRoIHNsaWdodGx5CmRpZmZlcmVudCBsaXN0cyAtIGJ1dCBiZXN0IHRv
IGJlIHRob3JvdWdoLiBUaGFua3MgaW4gYWR2YW5jZS4KCj4gK8KgwqDCoMKgwqDCoMKgeyBSSU5H
X0hXU1RBTSgwKSzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSRUdfMzJCSVQswqDCoMKg
wqDCoMKgMCzCoMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDCoCJIV1NUQU0ifSwgXAo+ICvCoMKgwqDC
oMKgwqDCoHsgUklOR19IV1NfUEdBKDApLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSRUdf
MzJCSVQswqDCoMKgwqDCoMKgMCzCoMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDCoCJSSU5HX0hXU19Q
R0EifSwgXAo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19IRUFEKDApLMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBSRUdfMzJCSVQswqDCoMKgwqDCoMKgMCzCoMKgwqDCoMKgwqAwLMKg
wqDCoMKgwqDCoCJSSU5HX0hFQUQifSwgXAo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19UQUlMKDAp
LMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSRUdfMzJCSVQswqDCoMKgwqDCoMKg
MCzCoMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDCoCJSSU5HX1RBSUwifSwgXAo+ICvCoMKgwqDCoMKg
wqDCoHsgUklOR19DVEwoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVH
XzMyQklULMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKgMCzCoMKgwqDCoMKgwqAiUklOR19DVEwi
fSwgXAo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19NSV9NT0RFKDApLMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBSRUdfMzJCSVQswqDCoMKgwqDCoMKgMCzCoMKgwqDCoMKgwqAwLMKgwqDCoMKg
wqDCoCJSSU5HX01JX01PREUifSwgXAo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19NT0RFKDApLMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSRUdfMzJCSVQswqDCoMKgwqDCoMKgMCzC
oMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDCoCJSSU5HX01PREUifSwgXAo+ICvCoMKgwqDCoMKgwqDC
oHsgUklOR19FU1IoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVHXzMy
QklULMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKgMCzCoMKgwqDCoMKgwqAiUklOR19FU1IifSwg
XAo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19FTVIoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgUkVHXzMyQklULMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKgMCzCoMKgwqDC
oMKgwqAiUklOR19FTVIifSwgXAo+ICvCoMKgwqDCoMKgwqDCoHsgUklOR19FSVIoMCkswqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVHXzMyQklULMKgwqDCoMKgwqDCoDAswqDC
oMKgwqDCoMKgMCzCoMKgwqDCoMKgwqAiUklOR19FSVIifSwgXAo+ICvCoMKgwqDCoMKgwqDCoHsg
UklOR19JTVIoMCkswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkVHXzMyQklU
LMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKgMCzCoMKgwqDCoMKgwqAiUklOR19JTVIifSwgXAo+
ICvCoMKgwqDCoMKgwqDCoHsgUklOR19JUEVIUigwKSzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoFJFR18zMkJJVCzCoMKgwqDCoMKgwqAwLMKgwqDCoMKgwqDCoDAswqDCoMKgwqDCoMKg
IklQRUhSIn0sIFwKYWxhbjpzbmlwCgo+ICsvKiBSZW5kZXIgLyBDb21wdXRlIFBlci1FbmdpbmUt
SW5zdGFuY2UgKi8KYWxhbjpuaXQ6IGlmIGkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoaXMgY29t
bWVudCBzaG91bGQgc2F5ICJFbmdpbmUtQ2xhc3MiLCBub3QgIlBlci1FbmdpbmUtSW5zdGFuY2Ui
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVzY3IgeGVfcmNfY2xhc3Nf
cmVnc1tdID0gewo+ICvCoMKgwqDCoMKgwqDCoENPTU1PTl9YRUxQX1JDX0NMQVNTLAo+ICvCoMKg
wqDCoMKgwqDCoENPTU1PTl9YRUxQX1JDX0NMQVNTX0lOU1RET05FLAo+ICt9Owo+ICsKPiArLyog
UmVuZGVyIC8gQ29tcHV0ZSBQZXItRW5naW5lLUluc3RhbmNlIGZvciB4ZWhwZyAqLwphbGFuOm5p
dDogc2FtZSBhcyBsYXN0LCBjb21tZW50IHNob3VsZCBzYXkgdGhpcyBpcyBmb3IgY2xhc3MsIG5v
dCBwZXItaW5zdGFuY2UuCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgX19ndWNfbW1pb19yZWdfZGVz
Y3IgeGVfaHBnX3JjX2NsYXNzX3JlZ3NbXSA9IHsKPiArwqDCoMKgwqDCoMKgwqBDT01NT05fWEVM
UF9SQ19DTEFTUywKPiArfTsKYWxhbjpzbmlwCgoKCg==
