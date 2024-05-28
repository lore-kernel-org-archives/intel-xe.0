Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F94C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 13:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B0B10E365;
	Tue, 28 May 2024 13:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfC05cul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA8C10E365
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716902547; x=1748438547;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WQlqQq9h+MmXUrvn3paA6KiQt4Bv3EV9nahzpVXC1pM=;
 b=DfC05culBicv1sjgDKNgTawvW+Uv3q7sD26DT8jvD9KN4ruAjY7WUVPj
 HtkxsSs8hGL9HuvJT905GvDqmuNMCeNcg+URozuDqncNHzj0Q1VKQ2tgm
 Q8dhulLbnuPx5IH/rKvXhj2/OLty5XOoKKNq1ykIFRQ8vS+IFf+w0X2jm
 F1f10vgL3HHRH3oPytti3B6PczWOr0RkKZ06m3ywTqTzC3588zcuOL8J1
 c/p1MzACkjcNt/HEtLVC8V8Xh9ml5qUwBB5suCuTaQkr+K3RLx3o9olvm
 tuy31DwE1XeM60vSYZTzO87OnQIzIl3R2GEJxndUbGcuaXdc4pnnXT8GM Q==;
X-CSE-ConnectionGUID: uiQqKVrqQ8+Aaagef3CblQ==
X-CSE-MsgGUID: HW5q8zFVTC+lh5sRiLrqLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30769788"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="30769788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 06:22:26 -0700
X-CSE-ConnectionGUID: RfMEv9UaSrueatPrD7QUXA==
X-CSE-MsgGUID: d2uDSzsdRb+D+Ofc8t6Jsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="35011214"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 06:22:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 06:22:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 06:22:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 06:22:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 06:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9UcNyJv9xylSMzFtDHaNTaGLArPUpmb2gXChdLAD43QtSg9IUXtSZxEzlcBX4O86t7dgjg2T1ucQKU4JaBLns/KJi2GimScc3ZgNPyTO23sPgY0DbJa3UBPTEPNkKTMv7nltK2hUuU6DCBvqBNMAYfz/8SX6pYUHMZcBAQLC95OwB3BI5+6YVVBIhx5htUcggkUSZItOgvZ9SuyvhdM0jAyhmZCsmXTv6IABY/tPGa9mUNXovBhHq9Rp9HM3htiD3XhhRQUxdaTy9K3yyi3QmYLLd57bYHJS0X53HI4ppFpMIuySUCYLZcB1JIx1PqYaXjA6uDWRZh01m7TxuP1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQlqQq9h+MmXUrvn3paA6KiQt4Bv3EV9nahzpVXC1pM=;
 b=FBnmRNuAf4g5bOlZA4cTz99yqXteaq7LmteiJFfKIpuQ2gnmlf6s+swi0PR/JdBgajFtBDAqIIUB2Qv9msiZhnqKrkaOlH9Gvlm4NgpEYa05mxVm9L3pUwnZwPR0wfgO7Fis8TZDx77FphRkigEbIPgFc8dTo8Ho8WMh/kNTDPJcbjakKHq1gaGSAmSmSjI3HlJSFLX2mG0YVNg6H8DRH+dMD7J77iskuFn78+LzM/agSpy9QXpyUzqBAiDG6PkpRAIs01afpa4emsNF2lT2Ta8fxbhUOaEX4DXaW+qgTtxEoj9NwMX4cgUhLqnWhFkUFQnxqwcTcpzGmDn9UTonfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 13:22:21 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7587.035; Tue, 28 May 2024
 13:22:19 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add more document to xe_vm::lock
Thread-Topic: [PATCH] drm/xe: Add more document to xe_vm::lock
Thread-Index: AQHasIEcZv+/g92wYkqRhfu24AGzS7GsPoKAgABkBsA=
Date: Tue, 28 May 2024 13:22:19 +0000
Message-ID: <SA1PR11MB6991C2B6D611582C9FC4525792F12@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240527230731.1888261-1-oak.zeng@intel.com>
 <6c5cc6d2c79cd1c98d879b73f1bdc4790d9603e3.camel@linux.intel.com>
In-Reply-To: <6c5cc6d2c79cd1c98d879b73f1bdc4790d9603e3.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS0PR11MB7310:EE_
x-ms-office365-filtering-correlation-id: 6cc25c7c-f873-46ea-9058-08dc7f193347
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?YUxJb3RoSTFncmVhejBTajdLU2NVVUxIM2ZPV1Ewbll4VnFBa003YXROa21l?=
 =?utf-8?B?ZWMzZHp2bUl1TEJqaGxrc0J4VnRpWEtkYmFnT2E3REp4UkN3RlFSU1N0SHgz?=
 =?utf-8?B?MkdxLzdzY0pKM2gwb3NOQjR1QXZIUndQSlFLa0FiMTJsL2FrMTR2alpJeWR4?=
 =?utf-8?B?MktDdktPWHphRVZRanRjemQ0bDNFTFViU2FSRUE3T04yVXh1QzlkTmVISXF1?=
 =?utf-8?B?TXdzTHM3akwrNmx1eCtTYWt6bVBiL0VkUVliQ21SVmJBVUhpYkpibTE0WnB4?=
 =?utf-8?B?VjV4R3V4aEd5TXoxNjVRRi9IOEhEelBURjdHcE4yd043NGxsQW5DT1pRdDJI?=
 =?utf-8?B?Uk9ISkVteWhPT2tSVDBra2J3blBUY25QT0lDajBqaFE4NUlXZUFQbW9vUUhH?=
 =?utf-8?B?TThMd3RaRjlmVHZZVlpqVE5FblM3YUh6Z3dicERiMFVvSi9WQ1hTVmlidkVF?=
 =?utf-8?B?RkVqUmNPSDJDVzVhU1NkbDV2bmJ3SXVHODlXZkJxbDJ0WjNtZU9yZEx5R3c5?=
 =?utf-8?B?WVJ5V2l2Q1FBdEpPcHFLeHRDTnEzVzZEbnBjcnhlZks2MENOYnR3amZ6UTVY?=
 =?utf-8?B?M1lwTjR2Q0FaWEpIcXp4VU4wSXYzL29UNlRmODY3QVFsZVUySUsrNmZlOHdn?=
 =?utf-8?B?N0RGdWNPVHlSVVlaNmkwbnJmTWlaQys0d0lPb0FLSHBiNjQ1OCtya2p4UFhN?=
 =?utf-8?B?YWFnZWJZM0JZUU5sd2EzZ2ZzRVJJWE9PTXVMVHlLUkdLNndjNUNyaTlwZ0J0?=
 =?utf-8?B?b1RKc3dZY2I3ZktvWjFSRXk2c0o3b1lISUlKblZiSkczbTVGWmF3bndUdllr?=
 =?utf-8?B?VjQ3N1F5Umt2am40NE1uR2t4QldENU9reXFJTzdJUDhEZ09vOWJBYTllQWdP?=
 =?utf-8?B?V0l4VWtFQlpWVTU3Z0k0NWl6R0RNbU1DZXFpcnZWaEFDUUxVajJLejhEQkh5?=
 =?utf-8?B?VWdKQVBXUFZQd0RUdjJUbWlCZVp6aDBUaFRUQmJxekJyNnR4bUVSdlRLSWN5?=
 =?utf-8?B?K0h2aXRtbk95bWtuZ0JXcWlJK3pFc3NEdzVzZzl4ZWdZSGsreUxpQ3o3eWxO?=
 =?utf-8?B?M2ptVVMxSi9xL0hNNmQrZjJ6Wmp4a0NvVDF3VTArQ2NaMTJ2L2JvS0Y5NHVy?=
 =?utf-8?B?MkhFVVBRVFE0OWtiUnJaZW5DQlNHQUQzZXEyMkNHdWlyM0xYa1U5bzlLS25Y?=
 =?utf-8?B?eXBwdWVobTdURFJUWEJHOGdHMDRwR0N0VmlOOWFJVUs2c3BuVE1nUVRtb2ZM?=
 =?utf-8?B?THZ5T2lCU3VGaGFRQkRqUUxLaFFQdHgwbGpXSHdtVDhjVGw2a20wbStaR293?=
 =?utf-8?B?R0trSGU1WnRwajBDd3dxOVRVQ0E3cjczRFcwczlvTWxMNG9wOHhjVHFlVVdm?=
 =?utf-8?B?M2FicWN6WEVjOXNXdE5RWXRmZlFqQ0VyaGZVZXYyNHZlT0tPYXVzNXVwcFFu?=
 =?utf-8?B?VXNUeXZyVDZ5WHIrTGEyUjBEQlRodDQ5d2hlaEt1VXJUT0hrZnRmWnl2RlBI?=
 =?utf-8?B?UjROc3padE9CNkVqc1R1RXM3MXBLbHR5Zi9jS1ZnZ0xrVWNsQ3NlRDF6UGhI?=
 =?utf-8?B?eVRreWlGeUNiWWdmbWNUQjVWMHBWYVVtUy9Mdi9XeW5JTnpPNEhoS3VrMXBL?=
 =?utf-8?B?UEFlUWdJMlkvZU9VSFowK2pHbVA0aUM5NVpZU3FpVFVWK0J6dFpnM2hNZFVh?=
 =?utf-8?B?ZlQ3R1VickxIOXQzZDJrQVU3cmlCOUh5UlU2Z0VtSkNsYXpTYlg1M3dtT2pL?=
 =?utf-8?B?VGNrUE1tZ0FJMW0zVXFtZ09kSUY0cmEzcll5MGRpRUtTVzJERm93djl4amow?=
 =?utf-8?B?SVFQMHVlMERuSW5nYzFmZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGpObmkvbEJqdkF3Ky9odENOblJQOHZjUmk2TW5sSlVCa1ZtMzYvWlpGYklk?=
 =?utf-8?B?QnVkMGV5WWwzYnJ5eGJlU1laZlU2QnFWOUU5UThkdkx3WUlaWGIvaHlmSE9Y?=
 =?utf-8?B?QnpFcVp0UGhzbFRkbnlKRFNBamx6YkNTTDBPeDRzcmlOOEEzakc3MHB2UmxP?=
 =?utf-8?B?NVJIVXMxdXFvdGxBQkVENVQzckVJaTU1ZDZrVWJyNVpwcVB1Q1hYOE9vbFhw?=
 =?utf-8?B?dWtlOGc2alA1Z1paRmFENnFhMXY1eHBHYkdIU01EN3lLcTF2ZTA1TWo0UGQ1?=
 =?utf-8?B?bmE0aHgrVHRyL2R4V0lTMTFZaDhtYWdKclF4WjBTQ2tVRElOc2wxVlFyZVRW?=
 =?utf-8?B?WXk0R2FkUm1QaVVuM0Jsb1VtdWZ3dTlXckJ4Z3JhMVlWckMyV094TzhXdEtK?=
 =?utf-8?B?cDRnNU1qZ3JqRUgzei81RC9paGpuWWdMcDhPWDFZT2ZmYTVNd2xYdTlDMjMr?=
 =?utf-8?B?MVVlRlB6dnBiN1RLVi9LajR0R0s5bXZWZnBOVEh2WDlkbElZWmhDRDhVYitq?=
 =?utf-8?B?UVBNTER5RXJHSi91Uzd6bTIxZWNuQ3JzbmxUUzREOStKMnl4N1VsRGJySEFj?=
 =?utf-8?B?aHhlUUhrOGQrU1RLbExxN2VUbWJuT2NqcUJTd3pMM0VBRnJObitjNHdCTEJx?=
 =?utf-8?B?SmNpZWRWbjdpa1k3U1dvR0tGZ25QZnFMMXlVS1JtT2duWTNiVVFMMDhkbWZM?=
 =?utf-8?B?RVYyMy95SGpOaXlZMFRrcmhiY2xnQk5SMUVWdzZncGFBSTl1aXdBRHFCYldy?=
 =?utf-8?B?QVBlVmIwckJUUlVuSldqR0UyemUrbWxIdXQ1Z1hCcGhidGw4NGlsUms3WTAr?=
 =?utf-8?B?NmJUTE41dGtMT25YQ1VYUk9TWWpySnNwSnVNODkvRUdwN1J2UUZNdmpyZ3hS?=
 =?utf-8?B?azJ4TXlOSHN1THBKaHFmZ2h1V0dFdnFOU1crbVhoamhKbThiSTJEbGNtdEZO?=
 =?utf-8?B?VkU3bDVYZ0ovTFhWc0E0ZlNUbEdhSlFDd1F6bXNJS2FXTGVSbUF4WWd3dVRI?=
 =?utf-8?B?ZEUrdGY5WVhrei9wNXB6MTJwTHBlaHVIQXlIUGF3Q2ZTQi9Oa2ZtUnFJL0di?=
 =?utf-8?B?MktTSkEySmxqOGtqb215dW5TRVVTWFZCcHNqWHFQbzVkamUvRnRadUtvdlM2?=
 =?utf-8?B?K0xWeEMvSnc2SGpGSHpqZnlXMWpPOUl3TkM5QlhnRFVTRXlydEEycmw0QUoz?=
 =?utf-8?B?OSt6Z1FuakwzRFdjTHhSTU9zOCtCcGd0emFpeTl6SVlOVjI3VXBoL2huUGFk?=
 =?utf-8?B?RVNqdXlkUHNCdmhUUjhORWd6N0hTNVkzb3BwTkw4OFp6SmxKanhNTlFtWk80?=
 =?utf-8?B?M2hkQ3AySTB4UHFxZU4wS1hxSlBrWVR6NXA5S0I2NWk3a00wdkRrMGZqNm9i?=
 =?utf-8?B?K3c0UkZxdXhkejBLa2FZMW9FRk9rdzRMeERubW5TRzRhK2J5KytSNFJHQVpv?=
 =?utf-8?B?WmZNbFJRWWlXakxRUmc4ME9oa0pnenNUK21GZm1GS3lCQ1k4VzRJYWtqK05R?=
 =?utf-8?B?M1c2QXVTcFlTaFdXUFZSWGlpSVFUNWJ1TkliS3pmNVRIbitZcmhtV1JZS25Y?=
 =?utf-8?B?NzQ5VjB0WG9HZktnbitkbnkwNmpNNzEvWVNmUjl2UUdHcGgxU3VyRGVFNHVH?=
 =?utf-8?B?eW9nbmFvVGZaMEo5UU9nY0RUZzBPdnNNV2NXbVFxV3VodlVUbHpKU2t4UGFL?=
 =?utf-8?B?OC82YWRRdVR5cEsvd2t1c2g4VEZ5ZkJ0bzNpU3c1ZFBrcFRyY1pDNXJOUm1S?=
 =?utf-8?B?eTVGYm1sWDY0UmtpVjludER3TkdHWlhjOVFvL2RZN1dtdWl4anZLekYxMlhS?=
 =?utf-8?B?MDNKMXd2Z2NxVnNMNjBZcVdQa3V3WjhDMFFYczZwWEpOQ1EwZ1ZzcnFwbEw0?=
 =?utf-8?B?bldPb01QSyt2bVJ5MUpFQXA5ZUZRYnhjeXRGMm5FS09rak16NDR5N3cwOWdi?=
 =?utf-8?B?eis4bnlEZWs0T2xvVVZmOWNIV1lITmsxMzhORG5WVUtHT21xMHRrczBIaWFO?=
 =?utf-8?B?U3BRTjQxenc2VmNoYlh5cXNjNGd1bEVoK3k3Uk8rajd2V1ZOTysrVVZKQWpy?=
 =?utf-8?B?UktFT2hFWERVUkRFbE1jYXdvWEpKbkdWaGNuM1ErN1llL05KYVJIM2xGZEt4?=
 =?utf-8?Q?0nvE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc25c7c-f873-46ea-9058-08dc7f193347
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 13:22:19.0468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjTzYyoILwLulAgws0qJJnK8swDZp502134zL4wN3UYIRQ2oF2BkZgH0wH3j5m3YFw3PNwqoUcqVGJClng3hhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
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

SGkgVGhvbWFzLA0KDQpUaGFua3MgZm9yIHRha2UgYSBsb29rLiBJIHdpbGwgZHJvcCB0aGlzIHBh
dGNoIHRoZW4uIFdoZW4gSSBoYXZlIHRpbWUsIEkgd2lsbCB0cnkgdG8gZG9jdW1lbnQgbG9ja2lu
ZyBpbiBlYWNoIHN0cnVjdHVyZSBmaWVsZHMgYXMgeW91IHNhaWQuIFByb2JhYmx5IGEgdmVyeSBs
b3cgcHJpb3JpdHkgdGFzay4NCg0KT2FrDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMjgsIDIwMjQgMzoyMiBBTQ0KPiBUbzogWmVuZywg
T2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlOiBBZGQgbW9yZSBkb2N1bWVudCB0byB4ZV92
bTo6bG9jaw0KPiANCj4gSGksIE9hay4NCj4gDQo+IE9uIE1vbiwgMjAyNC0wNS0yNyBhdCAxNjow
NyAtMDcwMCwgT2FrIFplbmcgd3JvdGU6DQo+ID4gTW9yZSBkb2N1bWVudCBpcyBhZGRlZCB0byB4
ZV92bTo6bG9jayB0byBkZXNjcmliZSB3aGF0IGlzIHByb3RlY3RlZA0KPiA+IGJ5IHRoaXMgbG9j
ay4NCj4gPg0KPiA+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPG9hay56ZW5nQGludGVs
LmNvbT4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGJlIGRvY3VtZW50aW5nIHRoZSBs
b2NrcyBpbiB0aGlzIGRldGFpbGVkDQo+IG1hbm5lciwgYnV0IHJhdGhlciB0YWtlIGNhcmUgd2hl
biB3ZSBkb2N1bWVudCB0aGUgc3RydWN0dXJlcyAvIGZpZWxkcw0KPiB0aGF0IGFyZSBwcm90ZWN0
ZWQgYnkgYSBsb2NrLg0KPiANCj4gSWYgd2UgZG91YmxlLWRvY3VtZW50IHRoZW4gdGhlcmUncyBh
IGJpZyBjaGFuY2UgdGhhdCBzb21lb25lIGZvcmdldHMgdG8NCj4gdXBkYXRlIG9uZSBvZiB0aGUg
ZG9jdW1lbnRhdGlvbiBzaXRlcy4NCj4gDQo+IEFsc28gc29tZSBtZW1iZXJzIGJlbG93IGhhdmUg
bW9yZSBjb21wbGljYXRlZCBwcm90ZWN0aW9uIHRoYW4ganVzdCBhDQo+IHNpbmdsZSBsb2NrLCBm
b3IgZXhhbXBsZSB2bTo6cmViaW5kIGxpc3QuDQo+IA0KPiBBbHNvIChldmVuIGlmIGl0J3MgYSBj
b3B5LXBhc3RlKSBpdCdzIG5vdCBwb3NzaWJsZSB0byBwcm90ZWN0IGEgc2luZ2xlDQo+IGJpdCB3
aXRoIGEgbG9jayAodGhpbmtpbmcgb2Ygdm06OmZsYWdzIGZpZWxkKSwgdW5sZXNzIHRoZXJlIGFy
ZSBvdGhlcg0KPiBjb25kaXRpb25zIGFzIHdlbGwsIHNpbmNlOg0KPiANCj4gQToJCQlCOg0KPiBy
ZWFkX2ZsYWdzCQl2bV9sb2NrDQo+IHVwZGF0ZV9iaXRfMAkJcmVhZF9mbGFncw0KPiAJCQl1cGRh
dGVfYml0XzENCj4gCQkJd3JpdGVfZmxhZ3MNCj4gCQkJdm1fdW5sb2NrDQo+IHdyaXRlX2ZsYWdz
DQo+IA0KPiBIZXJlIHByb2Nlc3MgYSByZXNldHMgYml0IDEgdG8gaXRzIG9yaWdpbmFsIHZhbHVl
Lg0KPiANCj4gTWVhbmluZyBhbGwgbXV0YWJsZSBiaXRzIG11c3QgYmUgcHJvdGVjdGVkIGJ5IHRo
ZSBzYW1lIGxvY2suDQo+IA0KPiAvVGhvbWFzDQo+IA0KPiANCj4gPiAtLS0NCj4gPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV92bV90eXBlcy5oIHwgMTMgKysrKysrKysrKysrLQ0KPiA+IMKgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fdHlwZXMuaA0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3ZtX3R5cGVzLmgNCj4gPiBpbmRleCBjZTFhNjNhNWUzZTcuLjU1OTdk
ODA3MjA0NiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fdHlwZXMu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV90eXBlcy5oDQo+ID4gQEAgLTE2
MSw3ICsxNjEsMTggQEAgc3RydWN0IHhlX3ZtIHsNCj4gPg0KPiA+IMKgCS8qKg0KPiA+IMKgCSAq
IEBsb2NrOiBvdXRlciBtb3N0IGxvY2ssIHByb3RlY3RzIG9iamVjdHMgb2YgYW55dGhpbmcNCj4g
PiBhdHRhY2hlZCB0byB0aGlzDQo+ID4gLQkgKiBWTQ0KPiA+ICsJICogVk0sIG1vcmUgc3BlY2lm
aWNhbGx5Og0KPiA+ICsJICogMSkgdm06OnJlYmluZF9saXN0DQo+ID4gKwkgKiAyKSB2bTo6Zmxh
Z3MsIG9ubHkgWEVfVk1fRkxBX0JBTk5FRCBiaXQNCj4gPiArCSAqIDMpIHZtYTo6dGlsZV9wcmVz
ZW50DQo+ID4gKwkgKiA0KSB1c2VycHRyOjpyZXBpbl9saXN0DQo+ID4gKwkgKiA1KSB1c2VycHRy
OjppbnZhbGlkYXRlZCBsaXN0DQo+ID4gKwkgKiA2KSB2bTo6cHJlZW1wdDo6ZXhlY19xdWV1ZQ0K
PiA+ICsJICogNykgZHJtX2dwdXZtOjpyYiBsaXN0IGFuZCB0cmVlDQo+ID4gKwkgKiA4KSB2bTo6
c2l6ZQ0KPiA+ICsJICogOSkgdm06OnFbXS0+bGFzdF9mZW5jZSwgb25seSBpZiBxLT5mbGFncycN
Cj4gPiBFWEVDX1FVRVVFX0ZMQUdfVk0gaXMgc2V0LA0KPiA+ICsJICrCoMKgwqAgc2VlIHhlX2V4
ZWNfcXVldWVfbGFzdF9mZW5jZV9sb2NrZGVwX2Fzc2VydA0KPiA+ICsJICogMTApIGEgY29udGVz
dGVkIGxpc3QgZHVyaW5nIHZtIGNsb3NlLiBzZWUNCj4gPiB4ZV92bV9jbG9zZV9hbmRfcHV0DQo+
ID4gwqAJICovDQo+ID4gwqAJc3RydWN0IHJ3X3NlbWFwaG9yZSBsb2NrOw0KPiA+IMKgCS8qKg0K
DQo=
