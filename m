Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D908EE20A4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 13:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF6B10E675;
	Fri,  6 Feb 2026 13:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZEXHBFv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABC610E675
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770384534; x=1801920534;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4GC5Eqgu7nin+1CD2PYPGkGtt6oxRS1TMv6p4w/nkBg=;
 b=lZEXHBFvHjVoSov7YK2vH7Mn1ayMNMgA4kdeEmsWDA+UhRxs0VUfxQfZ
 L3Nm8060sDUIVml7qIYGdINYBmIwV4R8dYR4xrBtI7I9hxbDOJjFxeEmP
 U4KWsFK4lgSPTucO7lnHeROjW21h+/8hQp/5ZVXH4XPvorgg9gfJWk3dK
 RmKLukPD94wEakGSOuaJhBi3sdGNGJt8xPUegyGk8i89tm9rAugIn8kKP
 S5BXVLRRlAii96/xjwTA/Z0rZfo+Kn3Z4+klcDglnOjpdbcekx5OwjHoc
 4VJeZK/dzGrAsETvg8U15MoFge2DX9fwS2ef6HR2ggy3z2elvxIvhIajz w==;
X-CSE-ConnectionGUID: SFmzn9vAS72QdaIAgKl5hw==
X-CSE-MsgGUID: nHDAp3ppRV2ADQ05CrgRqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89169474"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="89169474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 05:28:54 -0800
X-CSE-ConnectionGUID: QdCliE6hRNW9+xGsAJKx/Q==
X-CSE-MsgGUID: cKbjf4RGT82sDn5x4T2pnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="215046233"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 05:28:55 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 05:28:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 05:28:53 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 05:28:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFM0mBmEzsJFka4mJXJmHIbNZD1Hc0vxcBlz2z4FEAUCzpFMD9nWtPKfgOoWYe0n4921fllHk72SQaJ8gPtIzCna95smcun1JgpaK9ZXMK9xfaz/QN3tIvnSv8UMhJBjUBkxLHpLxBodB7bCjxrco4t/iS8AUNn3DwHzrKa+1a4g3e/dEzWM6c10r8w1zQG8V5RytKtw3s3zyGN5I7n0rdW5ohyWv7K6zMqGYWbYGaoG+Clv5VtqJ3nc0GsyFo+xVFkvAtGIGKuPjuMS78p7WI3ddzCIWjnP/31rAOwh0cvdpT4m5L6+3BeWGv2ozOVRF1yJo6Ps71ZN9PB1XFU9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GC5Eqgu7nin+1CD2PYPGkGtt6oxRS1TMv6p4w/nkBg=;
 b=KzOw/k4cTLGlQcd7bMj13tEKaZwguhlLMn+lUq9uXbcK6kchRevT8e/CT/9GEZJhyGJ3ozz/KcIDaRGOTnHxztWz7QorKIh/bjQHltdy1yo9cse90oddsXMa1a+CPDrvQHVNbbKjHghLNENi2y3Px7g3yjxNY8O9Sl2m/cTqSGfGWmVlh1y6bGqnDeNmXDuBlRMUc/qngkESvJhpC3jgEMTMLxC0sDqdaDn6SBFc3Rys+AvHao9XZ1pB1zri6TL93wv91gOOiujBbyx5JbBy3PtTT6KLmCec52bbTFCbR3YgqVWhotUZT0CziTkTO8qs4LlR4KZbCcN3I7xpEljIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 13:28:51 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 13:28:51 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "Yadav, Sanjay Kumar"
 <sanjay.kumar.yadav@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on
 devices with flat CCS
Thread-Topic: [PATCH] drm/xe/query: Only advertise NO_COMPRESSION hint on
 devices with flat CCS
Thread-Index: AQHclnjbfr2J3qU3sU+qxMsKEd2eorV0HeKAgAAJgICAAYTIgA==
Date: Fri, 6 Feb 2026 13:28:51 +0000
Message-ID: <d05696f532f44ce6b13002ddb07d4255a99b1025.camel@intel.com>
References: <20260205082048.2988738-2-sanjay.kumar.yadav@intel.com>
 <363425b3ac18605c3f3625064c7bcbe407d73dcd.camel@intel.com>
 <847e5437-994c-4fa2-a316-a6b9f92d73bb@intel.com>
In-Reply-To: <847e5437-994c-4fa2-a316-a6b9f92d73bb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7484:EE_
x-ms-office365-filtering-correlation-id: 0e582cdf-028f-4b82-2381-08de6583aaef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?REFQcGRSTk9udld4WDI5YUR0MmNEMFE0U01BVGdrb2NFdFZHbEVQbHRRZU4y?=
 =?utf-8?B?TXBtck0rd0FRUWJTOTlhY2tGWmdwV2Q0UlU3OHJHbVNGU1NTQWN3blZPbU9G?=
 =?utf-8?B?T3ZjWmk2OS9JMkd6VEJyWHJuVVZTVFZsMi9leUVObmx5ZW5ZK1hEMzByV1ll?=
 =?utf-8?B?MHJaT2JOYkc5M01mYzBWUWN5QkVxL0xBME5QemlLMmtmU0ZOTlErWWFzUnZE?=
 =?utf-8?B?bkk4aGJLSWN1SzRObnF6QmpsQlBoU2wwNmJRQ0l1WDlpczlady9NZitRWFN4?=
 =?utf-8?B?QTRYQnBTRjMycWRIenJVUmpwSFczc3JYL3kyTXR5WEwwKzhTYzJMUURLT1hw?=
 =?utf-8?B?RW90QnRhcHdSaGU0eXA1UHlwQ3haUkhMdngwM0ExTUdIT1Q5V2ZsSUsxeUxp?=
 =?utf-8?B?WmxOellXeUYyY2c0aG9paWZOaFFIeVl2OWZZUWptanExWXB0WXlGMFQrbzBo?=
 =?utf-8?B?WVZOOXZacHY5N095NjVoQ3RzREFpMUdPNDY0NHBsc3h1OHJ2b3YvWFN0d3Jt?=
 =?utf-8?B?UGNsS21nQWQwL2RXM1BWLzlnZTJCYitXR2ZBRlNtTmpTY1Q2aVlyUjJBZVBQ?=
 =?utf-8?B?Nm5RL005aU1CWUNYUzJWaUJadmRGVDFyanBTdCtNd05IMkx1MGdhREtDZXA1?=
 =?utf-8?B?OXN5dFpsaTF3bmN4Q2pKQUt0bkFacVAzRzl2b0RCUnIxK0s5dCtsQm9lMGti?=
 =?utf-8?B?TFZLb2dBbkFTZDg2VEVhOWtpOWhvUU9QblF0OFB1T1Z3SVB3alpGdXRkYU9x?=
 =?utf-8?B?dEt2U2daV0tObzFoZGE3OFBjR293Y1RPcWJNaVVlUzY4eG9XL0hCblllSFR0?=
 =?utf-8?B?SWxEZi9jdXhtcVZETXZtbFBJR0JhTW9VNnA5ZHJNKzZUZ2o1WjJ3QzNldm1Y?=
 =?utf-8?B?N0tLeTFvR1NHcjVwZjBJTzFaNnBkSHJMS1hmQ1VwZ2hnd3NjNnFFRXBOdm9t?=
 =?utf-8?B?bkh5N2NRQUsrM0YyRlNxaXFKd1IzZmdDazF2UHZmRGk3Q1d0YVdWZzY1OGlk?=
 =?utf-8?B?K3BsUHNrbGxhWWNnV2drdmhZcm00R0JDZVRFZFlVbmNvdFd2M056ck4rd2dL?=
 =?utf-8?B?MkNXd0I5YVFhaStlMUsrdkRyWFVOcWRCUW13NThTTmV6anBRN25QMWtPYnhF?=
 =?utf-8?B?bHNJazhLelA4ZVR2SlNwK1ZEdS9hdUtDRUc2Wmh5Zk4yWnBQZFFpTFRQSmFK?=
 =?utf-8?B?ZUVzZS9BSHU5Y3l1amRJZWlwNFp5RnJydk9kV1ZwSElZNFlYK3VxT0Rta3ow?=
 =?utf-8?B?MC8rRUozWmorSmF4TmRUNFJrUSt0aXZ0elptczZVTEVMTHZaY2NFSnlld3Vj?=
 =?utf-8?B?TlA1NGg2RzRvWDBBaGRoUXN5TjFGZXRLdThJYzBxdVd1ZUNSN0podjZDWHhQ?=
 =?utf-8?B?Nzd6YzhuZy9kT3VNMW9DbE9ObFB0Ni9WNFhmZDRGc3B5M1puY1UvRnJUS0tH?=
 =?utf-8?B?TzZWVmdPUC8zcGRsSVl1RTRBWFhZOUE3TE1oWFRscEo2RkQwRjZZMHlLeGNZ?=
 =?utf-8?B?cnJGZjFkMHl3dVZVRVZVY1BzRVZZaWN5RFBVUVl0b2RsUHJrTkJUM3FhVWVD?=
 =?utf-8?B?eGlIRUEzaUhlWTMyaUxtZWFLZjlSNDhWQi9zRWJzdGVyUGw2a3dNbTFlZDVt?=
 =?utf-8?B?cUdhTVQ5YlVsOTlEVmIwMUIzeGJmVnVMNEpDUldHV1pzV0M5U2wvblk3Zmdi?=
 =?utf-8?B?L0lkK0NpTkJpYUo2TTJ0VGoxMnRSOXQ1eFBvV05rTktkdU9OWU10RjVOWW10?=
 =?utf-8?B?aUVxVlo0Tkh2R0xITEVkcWZHN3ZudFF6ZGI5WEdRZC9yaW9xNEF0dGJHZWh5?=
 =?utf-8?B?aUlmdzRTTmJIN0VJdmRWM0p4d1NuVGI0UXdvTXl3em5wdEdIRmNMaC9Xanln?=
 =?utf-8?B?WWJiWENiUlZwSzYzUXNxRExTUmZtZWRqSkRKN0ZKaEd1b1cyQ3VEMUt4QWhS?=
 =?utf-8?B?OUprUlFIUERHbURaZWlWRlBwZWZCZ2x2OS9obiswSkZsWDRRRUxHajZzTlJv?=
 =?utf-8?B?eDM0NTI3aE5SeTJtRTdzeUR2T01KY3RUR3BmYWhDTWRGSnRzeWM1b094OUNP?=
 =?utf-8?B?R21TbFRjbDFqU3JUc1pWQ1YrY2didy9ibkovb1VRRGF3dG4rdEhrUEd3bk5s?=
 =?utf-8?B?eDJ2RURGTFh4OW1WOHRNdEdDYjVXNmx6RmRURVd2WDBuODR5YUVEOGUwVXNX?=
 =?utf-8?Q?edKTMNZlSuT9FSqI/4svXjw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2ZqUENJekUvek5qTktLMGVOMXlramV2NGF0RUZaYUNqYTk2Wm8yNm5zSlYz?=
 =?utf-8?B?VnExRGlWRjdSMzY3TXpyUFZrb3BwV1l5cmpwa3dhRzYwU1oyWTFwUXNOZTBh?=
 =?utf-8?B?dFoxbU9JTzlUbnJxdlBBYkJhVGxEWHlTUjJZNmJxa3NqeW53VEJqNC9wcVpo?=
 =?utf-8?B?R2hhOXMvL25henlzNDVFZ0czbHQ3bHhVcWtWNUo2UGdmUWlaZ3Bhd0prN0px?=
 =?utf-8?B?OTZqMVY0S2pIUTBBMHlVVkJxaUMxRXVxaVp3UnFlUFpjeHlNSXplcXlzNVVV?=
 =?utf-8?B?ejRmaEVtZzhkM3JldzdoUm5yMlJHTTUvY2F5VDBickZIdit3NU9PU0Exd09O?=
 =?utf-8?B?WWh6M1UxMWZOdmc1bkp0WkZMUmlOY0hWQ2VmK25Zc1VqSHlaa1JGNG9TaE0w?=
 =?utf-8?B?Z1l3TGVMUm1EcUk0V2puaVdRc1drZGxNMWQveDcrTzBLNE1FVmtXSWoxM1k4?=
 =?utf-8?B?RWlGbytuUk5JY1RRaE1UangxRTZjRjlKYWxMSHJvWWRqUXVKNW9hRm13UUhQ?=
 =?utf-8?B?cDlsVFhyQXJhZkhHY2IyRUdOUjR4dlo2TnBBRDZMNkpoVVpOVXNuUmlKSys0?=
 =?utf-8?B?ODVLU1lYbXhQckp1N0xDZVpqMVFjSnNlcXJ1R2dFZG9TZFhaSldMdzRKcXRt?=
 =?utf-8?B?WDRhZ2N5MkJweTJseitHWkc3MW1qUFVieVZQaUZLTmtlQyswMlVnZzh1c3pN?=
 =?utf-8?B?cmt2WFNWeEkzZHd0QlNBK0Q1aEVwcGlWeDFoQlV0K2VRaWhtOGRNcDBMdE51?=
 =?utf-8?B?b04zU1Z3OXVySnNGMGpEbzVoYXNoU09VZEhwaWxiaHlLekNzd2VaKzA4ODVU?=
 =?utf-8?B?TE5zVldRbHdId2FMUjY5WHozK1o5YkdqZGFaZ3dpcjJXdzFrbU1nYm1DVm9o?=
 =?utf-8?B?N2J5M3BMUEZNN0lOMEdzc1draE5Ob0xSM0VYYmJtMk54eDYwaFhhOWpSQzdF?=
 =?utf-8?B?WXpsbWN5RVZ6OWh4SS9qU0w5WVFyeXZyWEJKeWxZZVdqZzJRcGw3a3lsdi9D?=
 =?utf-8?B?eFFOTkdVU0J2WXJmbDJHMmgyK2lPODhwZmJIQnhZN0pkRFhKQlNRVFdUNXFH?=
 =?utf-8?B?Z042QkhsMkV3T1J4b3JrQlZBOHUzc0ZPZ3FLVGFEUGF1SUl1eElSTXk4N1NE?=
 =?utf-8?B?VjlSdVZDZFUyL3I4Zm15TnFwSTljek1JWFBsVFNPWmVPRXFLR3ZPMHhMNjlS?=
 =?utf-8?B?blpJTVd6djV5dWZGOTQxdlZlVTNMZXJqUHdTNW5DRDdnMEc1ZVkzcFNFQWI5?=
 =?utf-8?B?MVpYUm15TEJhSldQdW9yTVBOQjBkbC84MUJpZXRJT3BEd0ZneU5xaE52WVB6?=
 =?utf-8?B?SXBLWXhmdlh2VTNNTUo0Y0g4a1I4Wlh3aVdERUw0azFoSlpKZ1d6NDY4NDdB?=
 =?utf-8?B?ci9iZWlKVlhocDNKNWJpb3J0S2Jua3NPcjc2akhra2lCWTZ3eVBDcGxyNndT?=
 =?utf-8?B?RHlGd2tuei8rbVJFWHhQbWlJZjRTdzJOdHhid1dZU3FtQ2RadVVBS1dNWU1r?=
 =?utf-8?B?cDdJa1d1bWh5UWhTaHZMNVdQN280aDZrR0pSdEdSbjVaWGdMajgwU1RtVmtY?=
 =?utf-8?B?SVpNNElidTllUXhXcjdOWnBHSlBoS0NnNWY5S2ZNQzFlZ1NValA3eWJZUEtJ?=
 =?utf-8?B?VWxyOHFBeFMycVpUUlVPaXBZOWJ3cnQ0Q3BaaVV3SldCcUdnU2VxSTlvUElR?=
 =?utf-8?B?S3pMaHJPT1lNbnZwNFVBM29TbFNUdGN2TGNudkNIZG0veW82eVIyOWtPVHJY?=
 =?utf-8?B?ZjVLM2VVaHhESTY3b0ZYMFhYWWs0TVlIQnRlUHVwYUlKNDQzQThuR0c3aWJq?=
 =?utf-8?B?SVJiVjdsQjJObUFpdm43QTJtWG96MFhja2V2VGZlNmpseXBpOVc4eG9LSUth?=
 =?utf-8?B?NlVrVVlROUk1SFlFWmZJQmdhaEkraWN2dENEaERLSy9RZHdqSVdhVHRzQjBL?=
 =?utf-8?B?QklPMGJ2OVFxTm4xTjBYbDZKWWNPU2JTWUhncFhqTUttZ3ZUT1dUekgzZWdG?=
 =?utf-8?B?QmhCN3N3aWJOUVNBTTAzUkIxdVZGVk1BWmdmbSszTUNqRlg2VElPcWJ2L0dq?=
 =?utf-8?B?S2N4bEpXanYyWDRWSzFWbmJKdmVOS1hhc1hpT3FnZmtoaXZSSHpFczVYc1FO?=
 =?utf-8?B?cnhVcWlXejNtMUU4dnBkdURyTnU2YnhZVjE2VGc2Y2ZVWUs3M2ZiakVCK3Fw?=
 =?utf-8?B?Smlza3lmYTlRa2s4c1VHZnRIZzdhdkl0bHh5WE14cStQeHB0ZzNlQVYvckRQ?=
 =?utf-8?B?WTBtQVJ5c2NXRzF3S0ptYUZPTmpRTjliUFUyaTBYS3l3U3VNTVJjRi9TbHp6?=
 =?utf-8?B?bUNINzhLclRMdlJha1RJMTJYQnMydGYwVm9HNEM5eW5PK0hoUFFuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8990AAF1FE5A75418435DF1C75F5231C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e582cdf-028f-4b82-2381-08de6583aaef
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 13:28:51.5807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDASigg4b+ffcEMT8Q0u+kiSfnt8Q+x+P1sOT4++FCVvAtZJ8q8ioAaC0gDr8bcQIgR5R+IQ74r7EHEpTT+l1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
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

T24gVGh1LCAyMDI2LTAyLTA1IGF0IDE0OjE3ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IE9uIDA1LzAyLzIwMjYgMTM6NDMsIFNvdXphLCBKb3NlIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAy
Ni0wMi0wNSBhdCAxMzo1MCArMDUzMCwgU2FuamF5IFlhZGF2IHdyb3RlOg0KPiA+ID4gRGV2aWNl
cyBsaWtlIENSSSBoYXZlIEdSQVBISUNTX1ZFUiA+PSAyMCBidXQgZG9uJ3QgaGF2ZQ0KPiA+ID4g
Y29tcHJlc3Npb24NCj4gPiA+IHN1cHBvcnQgdGhlaXIgUEFUIHRhYmxlICh4ZTNwX3hwY19wYXRf
dGFibGUpIGhhcyBubyBjb21wcmVzc2lvbi0NCj4gPiA+IGVuYWJsZWQNCj4gPiA+IGVudHJpZXMu
DQo+ID4gPiANCj4gPiA+IE9ubHkgYWR2ZXJ0aXNlIEhBU19OT19DT01QUkVTU0lPTl9ISU5UIGZs
YWcgd2hlbiB0aGUgZGV2aWNlDQo+ID4gPiBhY3R1YWxseQ0KPiA+ID4gaGFzDQo+ID4gPiBmbGF0
IENDUyBhbmQgdGh1cyBjb21wcmVzc2lvbiBjYXBhYmlsaXR5Lg0KPiA+IA0KPiA+IElzIHRoaXMg
Y2hhbmdlIHJlcXVpcmVkIHRvIGZpeCBhIGJ1Zz8gU2VtYW50aWNhbGx5LCBpdCBkb2Vzbid0IG1h
a2UNCj4gPiBtdWNoIHNlbnNlLiBJZiBhIGRldmljZSBkb2Vzbid0IHN1cHBvcnQgY29tcHJlc3Np
b24gYW5kIHdlIHBhc3MNCj4gPiBEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05PX0NPTVBSRVNTSU9O
IGR1cmluZyBCTyBjcmVhdGlvbiwgSSBkb24ndA0KPiA+IHNlZSBhDQo+ID4gcHJvYmxlbSB3aXRo
IGl0LiBZb3UgY291bGQgb3B0aW1pemUgYW5kIGFsd2F5cyBlbmFibGUgdGhpcyBmbGFnDQo+ID4g
aW50ZXJuYWxseSBmb3IgdGhpcyBkZXZpY2UsIGJ1dCBwYXNzaW5nIGl0IGR1cmluZyBjcmVhdGlv
biBpc24ndA0KPiA+IHdyb25nLg0KPiANCj4gWWVhaCwgdGhlcmUgaXMgbm8gcmVhbCBidWcuIEJ1
dCBoYXZpbmcgSEFTX05PX0NPTVBSRVNTSU9OIHJldHVybg0KPiBmYWxzZSANCj4gdG8gcmVmbGVj
dCB0aGF0IHRhZ2dpbmcgYnVmZmVycyB3aXRoIE5PX0NPTVBSRVNTSU9OIGlzIG5vdCANCj4gcmVs
ZXZhbnQvbmVlZGVkIG9uIHRoaXMgZGV2aWNlLCBzaW5jZSBjb21wcmVzc2lvbiBhcyBhIGZlYXR1
cmUgaXMNCj4gZWl0aGVyIA0KPiBkaXNhYmxlZCBvciBkb2VzIG5vdCBldmVuIGV4aXN0IGluIHRo
ZSBodywgYWxzbyBzZWVtcyByZWFzb25hYmxlLg0KPiANCj4gVGhlIG1vdGl2YXRpb24gd2FzIG9y
aWdpbmFsbHkgSUdULCBqdXN0IHRvIG1ha2UgaXQgYSBiaXQgc2ltcGxlciB0byANCj4gZGV0ZWN0
IHdoZW4gdGhpcyBmbGFnIGlzIGJvZ3VzLCBvbiBjZXJ0YWluIHBsYXRmb3Jtcy4gQW5kIGZyb20g
VU1EDQo+IHBvdiANCj4gaGF2aW5nIGl0IG1vcmUgYWNjdXJhdGVseSByZWZsZWN0IHdoZXRoZXIg
dXNpbmcgdGhpcyBmbGFnIGlzIHJlbGV2YW50DQo+IG9yIA0KPiBub3Qgc2VlbWVkIHJlYXNvbmFi
bGUuDQo+IA0KPiBXZSBjYW4gdHJ5IHRvIHNvIGZpeCB0aGUgSUdUIGlzc3VlIGluIGFub3RoZXIg
d2F5LCB3aXRob3V0IHRvdWNoaW5nDQo+IHRoaXMgDQo+IGZsYWcsIGlmIHByZWZlcnJlZC4NCg0K
SWYgdGhlIHJlYXNvbiBpcyBJR1QgSSB3b3VsZCBmaXggaXQgdGhlcmUuIERvIGxlc3MgY2hhbmdl
cyBpbiBLTUQgYXMNCnBvc3NpYmxlIGJ1dCB1cCB0byB5b3UuDQpNZXNhIGlzIHJlYWR5IGZvciBi
b3RoIGNhc2VzLg0KDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBGaXhlczogNzhkOTFiYTZiZDc5
NiAoImRybS94ZS91YXBpOiBBZGQgTk9fQ09NUFJFU1NJT04gQk8gZmxhZw0KPiA+ID4gYW5kDQo+
ID4gPiBxdWVyeSBjYXBhYmlsaXR5IikNCj4gPiA+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcu
YXVsZEBpbnRlbC5jb20+DQo+ID4gPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5z
b3V6YUBpbnRlbC5jb20+DQo+ID4gPiBDYzogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJz
QGludGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFNhbmpheSBZYWRhdiA8c2FuamF5Lmt1
bWFyLnlhZGF2QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9xdWVyeS5jIHwgMiArLQ0KPiA+ID4gwqDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1
ZXJ5LmMNCj4gPiA+IGluZGV4IDM0ZGIyNjZiNzIzZi4uYzE1MmViZmJkN2Q4IDEwMDY0NA0KPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ID4gPiBAQCAtMzM1LDcgKzMzNSw3IEBAIHN0YXRp
YyBpbnQgcXVlcnlfY29uZmlnKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+ID4gc3RydWN0IGRy
bV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiA+ID4gwqDCoAlpZiAoeGUtPmluZm8uaGFzX3Vz
bSAmJg0KPiA+ID4gSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0dQVVNWTSkpDQo+ID4gPiDCoMKg
CQljb25maWctPmluZm9bRFJNX1hFX1FVRVJZX0NPTkZJR19GTEFHU10gfD0NCj4gPiA+IMKgwqAJ
CQlEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX0NQVV9BRERSX01JDQo+ID4gPiBSUk9SDQo+
ID4gPiA7DQo+ID4gPiAtCWlmIChHUkFQSElDU19WRVIoeGUpID49IDIwKQ0KPiA+ID4gKwlpZiAo
R1JBUEhJQ1NfVkVSKHhlKSA+PSAyMCAmJg0KPiA+ID4geGVfZGV2aWNlX2hhc19mbGF0X2Njcyh4
ZSkpDQo+ID4gPiDCoMKgCQljb25maWctPmluZm9bRFJNX1hFX1FVRVJZX0NPTkZJR19GTEFHU10g
fD0NCj4gPiA+IMKgwqAJCQlEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX05PX0NPTVBSRVNT
DQo+ID4gPiBJT05fDQo+ID4gPiBISU5UOw0KPiA+ID4gwqDCoAljb25maWctPmluZm9bRFJNX1hF
X1FVRVJZX0NPTkZJR19GTEFHU10gfD0NCg==
