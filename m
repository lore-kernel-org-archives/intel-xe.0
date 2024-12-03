Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE08E74AC6
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 17:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3418C10E480;
	Tue,  3 Dec 2024 17:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RacmsIrM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82CE10E480
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733247644; x=1764783644;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=zvJp+G/agECXgib43w8e1R3IJu3vw7fgN1Zj6DH4UWY=;
 b=RacmsIrMGJ4RoTDj5etI6Snoyz2JAEla1NkZ+aV0+9RzsESIS3pE6EAr
 kD4aVE0JB7maYVWmsAGZVSsn1LgceE77JeU8oBDHqogjpPofe6EyxTGmP
 KkexQ8UTj0A+CAFYbOuzjD4YuN8o64RChZcmQYb4J4rXrVdzHLk+bE8Du
 GISp02NrkPV9tHy+wqH5ur7eEnoz2NpmiCQPa9THSrWXQyt/d7bis1dF9
 2y1KYyZ1dpK7zHSxnUxzZUPe5KCi4Rrjs6skRAyYIxQczsegghk38HVol
 OgGPz31LoqvhwEZx4YlmCwQlbjZ4sv/BwOnR5JUNxw/a1RTxcpizKfzfx A==;
X-CSE-ConnectionGUID: QUsw0A8tT2OteqlzXOhx0A==
X-CSE-MsgGUID: yg4hHw62QHKgUKoS3zswFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37251681"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37251681"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 09:40:44 -0800
X-CSE-ConnectionGUID: spE6zoN7QJm0PmICEltogQ==
X-CSE-MsgGUID: faEvN0m6Ti6juiqv4SYyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98518513"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 09:40:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 09:40:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 09:40:43 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 09:40:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkrtKFqHiRQyRUIhQf7HLfFExeONgreuWWv+2PyEpAe0UnqaztaerMEV4e/FHV/T/wnfKjPj6Xk+6uLE5dbCOX4Yb0LptzNimrmLyl3THB0ZLav7hhb8+uBdTL5wM+bh6QBKwmcJnxtp8KRP73GNoeJD+MwhpPs9EZebOf6bAD3dPQZX+Cjz3cOfjfUHpMapVoPXGLk4q02iKT45Yd9OL6lIF3mWYN7t/M7NHofCuR2dR2SQZdI4l9YZB3e76BrhK6PIzttgNEsGxk0fRcvsE1zw9fa27npgm7MFXt1OioKc+En+Fpl7MVEEG4tHcF1V1HRwjB9Pb7647SWWRNOROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvJp+G/agECXgib43w8e1R3IJu3vw7fgN1Zj6DH4UWY=;
 b=cZwb+11FEJyiLGnyeei54XTIh0+g95oESheCSr4Ilq9YexFzhEYOUijd5tE4/pc13XATOFYUORrSzcQe2XWgRsG/Ed1o8UVaazjghQ+KlSfCCia0s6ZjswcTzS35/7NBeCHZT8xUdMnlr28UKxYSvU03KM191DJLbE5guOwn8mJX4/zBGd2TqanrKAMVPsw5OsCoiiHcfI6mcjtUeD07YwA3s8LOwyXf56Td87Hq94m6/rIawhUpPw0D7JB+mEyces8Akp0ouy48CBpmRnIH/0ZoJSvdWCw/kWvOKg88NEXsl77EI3ZO9uaHXjCXWiZWI4GzFKV+7QjL46tegtbw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Tue, 3 Dec 2024 17:40:35 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 17:40:35 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBNYWludGVuZW5jZSBv?=
 =?utf-8?B?ZiBkZXZjb3JlZHVtcCA8LT4gR3VDLUVyci1DYXB0dXJlIHBsdW1iaW5nIChy?=
 =?utf-8?Q?ev2)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIE1haW50ZW5lbmNlIG9mIGRl?=
 =?utf-8?Q?vcoredump_<->_GuC-Err-Capture_plumbing_(rev2)?=
Thread-Index: AQHbRUhTJicPphF+8U6Pkuh0A/a79bLUylgA
Date: Tue, 3 Dec 2024 17:40:35 +0000
Message-ID: <41e08c46851bd52cc4367f977d891db6107f9bc0.camel@intel.com>
References: <20241203033703.3215624-1-alan.previn.teres.alexis@intel.com>
 <173320544602.1903651.4392219603779837554@b555e5b46a47>
In-Reply-To: <173320544602.1903651.4392219603779837554@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY5PR11MB6161:EE_
x-ms-office365-filtering-correlation-id: 7429e2cc-cc8f-4f71-4069-08dd13c19823
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RURJZkRMeFFuejVtWldNWGNEMFV3aEFmajRzZ01YUUM4UFNrUWV0Qm84V3Yv?=
 =?utf-8?B?VmMrWVlDSDdLM0NQcFpNZzIrS3JSUXhBY2gwUEZacWNVVnBySjlWaHBnc0Jp?=
 =?utf-8?B?bHNHNW00bmIvb0dBTDBhYzNacGdXa0pNc0h2VnFHUDVuT1RrMEZFRnpNa0tm?=
 =?utf-8?B?eVAxcUEra0UyZ1V5R1BJRWRFbkt3Q29TS3FOclJFODZwSkNWNmd4QjVNeDRG?=
 =?utf-8?B?YTZlanFnRWo2VFhqdXpJc2ZPaHc1anV3S2pVVHpLemg3NlFTWHZodHRoWUlU?=
 =?utf-8?B?RDZoQXVidmNRWHVkWk5Tb2dWYmtVTTJrZy92SzBFSGNrd00zS2pEaWIvempM?=
 =?utf-8?B?WTNsRUdpbFp3enZoSm9INjFSU2N6eUNsdTRram0zQzJGeVBaMUxmb2luc2du?=
 =?utf-8?B?cnR6NnRHVFpWVjNYUzdMZnZDV3pOYzY3UmlvSDVBTGlZWVBzWHI3V2dHODJS?=
 =?utf-8?B?L1Q5dkVVNHh6RllnOVR2SDh6Z0FHT3dkVDBzczVjWUp1WkhabEpyMHhiZTh4?=
 =?utf-8?B?R2FUZjhaMTNaVkE4N1QvUHFYVUFwaE9EWS9zY0ZuVkdBRDE5R2Iwb2EwT3Bw?=
 =?utf-8?B?RFVtYVRpUjk3RmhGMXp1ZXgwdjF4c01wenJUVDIrLzcrU3hvTkhSZkRsQjJT?=
 =?utf-8?B?SHlNRWwxMk4rRWlscHNjU2xubFN1Tit0UWREZ2FXQjErb21BRE5RQ2V6cVNa?=
 =?utf-8?B?V1Vlai9sQ01wMUpyZnQ2VHlMSWt5SVdUTE1XMXNrdjZCcXpVUXRXeWpmY2Mv?=
 =?utf-8?B?VXlwOGxVcmZCSDdpMnVwM1FIZWROVE1pWnlUZnprYW5za1FhVmh1N3hxZW1I?=
 =?utf-8?B?UWp0TzlSam9xeG12U0N2SGlFaXMwZWFwMG9ZRkUwTGZYVitGUHA0dHlxMGI0?=
 =?utf-8?B?S0VRek5xUHFlMkx4ejZ4eGl2dXNhOXdRYlhOZDJoZ2s0N3oxYmxoUXczZjlT?=
 =?utf-8?B?alRiUk9ZdHh4dkJpalFrODRZU2kvNmIyb3c5TFZkMGV6eU5JNGhhTjNBMTVw?=
 =?utf-8?B?bGNCajhKZUtSMmxnMmpNbXlDRXA1d2syV0hOTXpGaHI5bUhXTldVK29FNjV5?=
 =?utf-8?B?ZzhTNnRmeGw5MURQTC9tS0lJMnBjc2lRTjlKWWNTbTRXbGhQMzhuWjFUQWxP?=
 =?utf-8?B?Vm5sZkVBOHlNNHBYOUp6emMzdlZ2SWw5VnNTVTVjY1NLcTgxelV1dWd0QVB4?=
 =?utf-8?B?Qmh4NFFYMUR2T1U5OHczaUdhWUI0bGRaV3dsNWlSZS9BMEtHQ01DY2pka0Zk?=
 =?utf-8?B?aE5yLzlzcHB5TjBTWlROdW90Vk14VHY4ZzBLSVJaYTV0RndwRERvMUJZNEFV?=
 =?utf-8?B?NER1L0tqSHptbzRIakFpR2VPMmdudmowbTlLTVFmUVdOdHJxdkZPR2UreUp3?=
 =?utf-8?B?Mk4zamRJYTg0YjBnVGVHVjJOdDVvQWRpeTlsV3g2VFdIdzZmWXdNQ05tYW9i?=
 =?utf-8?B?QTlzWnQrVmYvOVpGSmZLdHFEcTA1NjVVaGdFb2R0Q0I5Z1VGaUhUVHJ2cldY?=
 =?utf-8?B?NlpZaTB3SEpNeUszbXEycjJHNTlJdngzQ0h5Uk03QzR4eER1Z3BXbHN1RVBC?=
 =?utf-8?B?ME95OGFsUmtkVmF5RTdENkpyNUdSVTI1ZjUvTVpQdHV4eFpyU0cxQWRHQnph?=
 =?utf-8?B?dFpOTXczRWtQeW1tZWY4K0pQeUttdkxHNElqMEdqaHl5WEVlamR5WWc5UWRo?=
 =?utf-8?B?QzdLT0pNUGFvY2xiQmNjd210aWFtbWgxdW5rMGM1OHI0QlJyRUZZS2lLNlBq?=
 =?utf-8?B?UEo2YkNsQUN0ZDFJbksrTkRPS2xhSDBHSzhDZ0sxeTBrVHdYaFJQSTBjOGJw?=
 =?utf-8?Q?gDFxe2udacLLll/zgloaxLB3K3d7GM783Ah08=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0FaRW5zZUpPemJPaG80RmM4b2hwRjhkRTRIaTl1TDNhYUVRUUNOQktFM0RE?=
 =?utf-8?B?VkJONjlNZjNzTUtwMEpVQ3AvWmhDTG5JMjE5WTBGK2twcE44NDFTbkVuYUhI?=
 =?utf-8?B?NVZxcVArNFNZdzhvV1Fpd1NicHdGNGNCUm41TXl5VkVuejd5cm1NZ05PTG1F?=
 =?utf-8?B?L3h2ekNwZHdKVVZzbnJvQkZlWlo2d3Z0Ukovb3g1NGtSeDMyR05SbGxsQUZR?=
 =?utf-8?B?OU5ocTc3VGJ2bndwTFhJV0dGRU16cE1LaHUwVnp0cWZ4Q2lKWFJpR1JiSHFX?=
 =?utf-8?B?WHoydXpvK0NJMGtMdmxlNGdvdUVHN3dEWURNZm5DZkNYTVRjVlpSaE15UEZ2?=
 =?utf-8?B?Q0FaZFJFeXNkblpqQkw0OUhBMkhOL3lDTklhdHVocXBvNHhNZGhsMjdMRDlL?=
 =?utf-8?B?YlpmWGZlRTAyNlAwMWtuK0ZJdzFMREVqVGxLV0lwMkdQZXFaWDhQVmE1Zm42?=
 =?utf-8?B?TTJncWxMdm9qZGxvN1g2NnNocmRzSm0yRWI3UDZ5bUZRczM2ZEFvc3FHeHRx?=
 =?utf-8?B?UTYxaHJnVFRveVhXOGFzS0ZhZUU4bGVnTnpuSDFTdmJ0dDJUa1FrSDV3WGF5?=
 =?utf-8?B?TmNjQVAyN0syTkNhWTFqTE9QcXVqdzFsV2lqWjVOakkzSEVUc2tBN3ZicU1H?=
 =?utf-8?B?Vjh1TG9xQ0dvZERqZHBhalFMNm5EdXl5ZE04QVpSMmJwREs1L2dTRU5iUmVM?=
 =?utf-8?B?ZG1SU2l4UUtUMTJvbHJnMFpPRUJRd3VrOWtlU3MvcmJ4enE0YWFIM1pyYmNw?=
 =?utf-8?B?amNiRkpPK2lwVVk4UExmejBGZEVYdkV5c01hdGFaRGJGYUo1cXcrNDN6NWho?=
 =?utf-8?B?NlhsK0g5K28xWEl0N3p3RkFRV2swVEtRbW5BdlFsaUd6NTc1ZWV4VDcvZGxx?=
 =?utf-8?B?Um9tMWw0dWhldGlMeUVseVN3MXRQZlBwQWtyaEtUeGp1Njl2TFRSUTVkbmFt?=
 =?utf-8?B?NjBHanF3bXlHYlRaT0dscERERkpyTzVOeHZ4dTNOWERkdVdmZWVvMDNaZDQ0?=
 =?utf-8?B?T1U2QWE4NEgvUVY0NWI4Zml3QUlVbU94SjBud3dzeWRDb2VaWGVKT1phOURz?=
 =?utf-8?B?cGczOVB0bVBKWHRYZ0gyTnBXRlpZREhjdFBsd3U0NUh6U2lLREVTRFpGUXFH?=
 =?utf-8?B?Z2FqNW9NNzdSU2lnZFc0M2lEWXJJaVl5UUN0N1JyMk9ZcUNCS2MzdjdhV2N4?=
 =?utf-8?B?cVNMcWFpMU5xaFVsalR0SzkwcVZodTZWVThRbnFJOFUydDJLK01JbE8vcmFx?=
 =?utf-8?B?eEc0bjEwaFhxQjh2VnU4VXY4VVZQUElBZm9zbzY0WDllNWF5UVFpMm41c1dl?=
 =?utf-8?B?MXVSbUo4YUxiWlBlSDJyL3Z0TWxibUlIUVJ2eitmdHpOU2ZJNENtS0JkaXR0?=
 =?utf-8?B?cnVmY0NFZTMrb1VUOUszbGs2MGxUUkVRSlo2SEVzUzFiK3ZqenIxMXlNR3hO?=
 =?utf-8?B?UmdlaDgzR3YxazVwMUFaQ0J2TTA4cG9nSkxWa25icTRucUlUSG01elVhbC9h?=
 =?utf-8?B?bTJ6dHF0K01NYVhoeU5oWEdqcmswYUI3aUZyQ1FjMHFuVjkyQ1RadDBPcWpv?=
 =?utf-8?B?UVpETDJsVFRCREJ0TjdvbnMydnFLK0Q1M0M2UGs5VGJSM0RXRytnQm5wRDFB?=
 =?utf-8?B?THdVYktjUXh4MFFjYkZ6bVk3elZwVGFsVHFEb2h4dEZ4bSsreC9ITFRpOXlx?=
 =?utf-8?B?VDZwdUdHT1VqeEpOSHB5Uit3czc4LzQ4V3JFMEVlOU8zYkN3VG91alRrbENH?=
 =?utf-8?B?bmtEY3lFN09BSGNicTdaanJDai9uRzdUVHliVVhIYzNDM3UwY0pQQkt2NS85?=
 =?utf-8?B?bHFCOEdjTkJqUWJaNEY0c09rTGhNOXJPeGdJOUgxMWN0MjIwUFJVRzd1WEVO?=
 =?utf-8?B?alZDM09kK3NDWmRQcmpwT2xVVDNWSlhTZGJudXBJa09jMVp6K2xyMFE0T0x2?=
 =?utf-8?B?UUNhVUVjc1VzblQ0cURpZFZPRXQxYlpNNDNIS01kbGgxa0RxNGNBbFU1VjU5?=
 =?utf-8?B?UmJqZDQ1VVNYQzEvRzFVS1dDZ0FCdUtjaEhPRGJVUWFRSjZ2N2h3bkRURkg2?=
 =?utf-8?B?d1crMW9VeDc1eTRoLzloWDBEb1FWRzBGUFRISVI3VEl4TXo2T0ROK3ptRC9W?=
 =?utf-8?B?ODVFQjZMbFM5Sm1HeDg5T2hmcUk3VnlqdnNXeXZ4bVcvUC80S2J3MXBleXZR?=
 =?utf-8?Q?eLVPVtDd4tUFD19/viBEkKg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1148FB335C3A4D4DB8240F5CD6980646@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7429e2cc-cc8f-4f71-4069-08dd13c19823
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 17:40:35.8217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W22sraxTcD28IdzhOnsEIO6bKg/8RzdDbHvinxpfj6D0EBLcXmoiOs5QBWK8XDBLTj6VXz0Y6PqJaloeEVOhHZQjFdXnffR86GVWQLsua0dTpOw+J3SieXR1CsfFPLfS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
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

T24gVHVlLCAyMDI0LTEyLTAzIGF0IDA1OjU3ICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+IFBh
dGNoIERldGFpbHMNCj4gU2VyaWVzOiBNYWludGVuZW5jZSBvZiBkZXZjb3JlZHVtcCA8LT4gR3VD
LUVyci1DYXB0dXJlIHBsdW1iaW5nIChyZXYyKSBVUkw6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQxNDU5LyBTdGF0ZTogZmFpbHVyZSBEZXRhaWxzOg0KPiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNDE0NTl2Mi9p
bmRleC5odG1sIA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIHhlLTIzMDctNGRlODJkNTBi
OGRlNmEyNzhjMTQ4M2E3Zjc2YWU4MzBjODlkMTgyNF9mdWxsIC0+IHhlLXB3LTE0MTQ1OXYyX2Z1
bGxTdW1tYXJ5RkFJTFVSRQ0KPiBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4
ZS1wdy0xNDE0NTl2Ml9mdWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiDCoHZlcmlmaWVkIG1h
bnVhbGx5Lg0KPiANCg0KW3NuaXBdDQoNCj4gSUdUIGNoYW5nZXNQb3NzaWJsZSByZWdyZXNzaW9u
cyAqDQoNCj4gIGlndEBrbXNfZmJjb25fZmJ0QGZiYy1zdXNwZW5kOnNoYXJkLWFkbHA6IE5PVFJV
TiAtPiBBQk9SVA0KPiDCoCogaWd0QHhlX2V4ZWNfc2lwQHNhbml0eS1hZnRlci10aW1lb3V0OnNo
YXJkLWJtZzogUEFTUyAtPiBETUVTRy1XQVJOICsxIG90aGVyIHRlc3QgZG1lc2ctd2Fybg0KYWxh
bjogbG9va3MgbGlrZSBpIGhhdmUgYSBidWcgaW4gdGhlIGNvZGUgOiBhbiAiaWYoYmxhaCkiIHNo
b3VsZCBoYXZlIGJlZW4gYW4gImlmKCFibGFoKSIgLSB3aWxsIGZpeCB0aGF0DQo+IFdhcm5pbmdz
ICogaWd0QGttc19kcmF3X2NyY0BkcmF3LW1ldGhvZC1ibHRAcmdiNTY1LTR0aWxlZDpzaGFyZC1i
bWc6IERNRVNHLUZBSUwgKEludGVsIFhFIzE3MjcgLyBJbnRlbCBYRSMzNDY4KSAtPg0KPiBGQUlM
DQphbGFuOiB0aGlzIHRlc3QgZmFpbGVkIGZvciBvdGhlciByZWFzb25zIGJ1dCBhbW9udCB0aGUg
ZG1lc2cgdGhlIHNhbWUgd2FybmluZyBhYm92ZSB3YXMgdGhlcmUuIA0KPiANCg0KW3NuaXBdDQo=
