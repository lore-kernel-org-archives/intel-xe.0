Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDE3C282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 22:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761FD10ED61;
	Fri, 28 Feb 2025 22:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3wjnE8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8A310ED5B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740781330; x=1772317330;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+WsSvMYKKPW6MViiTUh5+EJi6LbckXPc/VnJeWvSlYc=;
 b=N3wjnE8Hr+J3aAc2dsN0XvdUY6HNpWR2auYB06Bl3sYMq2d5o4PLJYeC
 VMVXXPei+dp3gtGpfS5f46vubOWeYVateQQOBG/P19i1SD5WSbG6PDWtR
 ygNh+AotbIW+lrONOXFH91mh4ZZgZXKtSP5So2BNZXmAUTIYYXbUU4yfQ
 bI6VcnlaOCOt0SlfE/Ll0UfMNu1yhBqPe/hO1dfZ7M17sboUO9sRT1OxC
 bQfkfkbYHuyWuX8ECWj+i0k9aGdxv+cdZHZoMb8umosfIm1F9X7IaJ6RZ
 S0yRYPWbjhzCeBUzTIVsMvSuOVVrdcgQ/Af2AMSaro+36fpFgMYM2NJro g==;
X-CSE-ConnectionGUID: q4WfRz4oTHqOcyUJvFA+zg==
X-CSE-MsgGUID: X2dtpLlqT9uAgWD+0DYLHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41571445"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41571445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 14:22:03 -0800
X-CSE-ConnectionGUID: 0ElNPkhkTPKOA5TZ8Wio9g==
X-CSE-MsgGUID: ukYY8phSSC6yRRGVg9jOhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="122455447"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 14:22:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 14:22:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 14:22:03 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 14:22:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQV43Sj14gDiYCpd1/6k4vLmh41W2iSdHQm+T4iXi09aNoPDW3llE+JW9iHhFv4fH52lo0xc5rK/d0Tp0Xk/BXJz/wezF5mq6/5m77E6GSSqDU5yiiriyDYwjobHnYPYzwV83IhlcyG1cbH1ZZ5ZGG94VwVqrwMAwS16dAgZc+iAU17t3ROOLXnOh8sRxxyhwKNFRAkw8Mhvx0r+HZ3fVFr0x1H/LDNh/dH93MA7ZBt7aIRRF4lIzGZ+CbC9bUiNn1FjF872hv+/gl2Kk1WZZwMmc4YsVSgwRkabNwngEmoJN6IHpigB+aw2hgqG3pZpujmM0i85wmdtppBDT15h4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNOyGx3E1wYPmP/NvelJHhPFnlRnRxH0czG/s8HARZ8=;
 b=eW6dj5cORBvjBPGd8bSGv6eCNsXOdcK23IlSBVrBdt3//mYQH2abQnft70dq8LEo+zhjfzRvAR81zcbXx716uQDkARYkXQz4p7KWgManFjNepcsRkoK7UIGZAK8W7Wh5Yi8dL2H2IZdBijBCThM9kJat1qRodRfEtaGm1SJFzdin8wBX6ao4oDXDtenIKceZT/RrT1jy6HGasilcTERPYPxHYFIPLlWUbdq4ZDklqcRfP1guK1gE/chdMc0H5UVrNEWXRkXJPMCrYS2uZXSMW1o6PnbghvFD/K4mOHjnvMB1vvB5rHIUSOWOZrfeYB7etR0Ri5xZ7BoBQIeETiWU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA3PR11MB7627.namprd11.prod.outlook.com (2603:10b6:806:320::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 22:21:30 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Fri, 28 Feb 2025
 22:21:30 +0000
Message-ID: <c0e68a6d-4250-4373-b573-2490b374660c@intel.com>
Date: Fri, 28 Feb 2025 14:21:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/guc: move KLV helpers to common file
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20250227010530.3002093-1-daniele.ceraolospurio@intel.com>
 <20250227010530.3002093-2-daniele.ceraolospurio@intel.com>
 <02842531-7ce0-4518-a6c9-9530f946bb26@intel.com>
 <03101dc5-00cc-440c-9358-c136ba6d961e@intel.com>
 <ba0e0dab-3561-4ed7-abb7-ff424b3d8c3d@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ba0e0dab-3561-4ed7-abb7-ff424b3d8c3d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA3PR11MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf3fb07-2b86-4503-9b88-08dd5846401d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHgvVGNRMlNZWUp3dCthWitMZU1mRnlEZnJMVldHTjRiVU9VRldEelBPUms0?=
 =?utf-8?B?aW1TNzdBTG9kQXpNTG9keUdtZW1Sb2VCNElqRVV0YWkvUVIveGdiTk85K3Va?=
 =?utf-8?B?RVVDRXlSTy91RldtZXFMVHNtYzJFMklPN1pDY3NoOEkzdmhKNGQvNklDNlNP?=
 =?utf-8?B?Ty9jSkUyTmJIeVRtZ1I1QUFoempsRXo1QW41Qlo4TDZBVXFOUXRHOUtJU3Rx?=
 =?utf-8?B?OW81QVhOOU1mY1p4bUxvOFRtY3lWMVoyR2tmVG45V1JGZG8rc1p4NEZ1VDdZ?=
 =?utf-8?B?YXNaQkJrcjRUZ3pZM0xuZWFWdVg0UlVwUnlhaDlGZ3hrS0FtVWhSUU51bGFi?=
 =?utf-8?B?VkNkS0dDNmxTcUhGTWxjMW56dFBRT2JjOGw0Zmx3M3p2d3pBd0FFclFNdlBu?=
 =?utf-8?B?WUR5T3NkMUVic1BKQXFCN0JTTk96OW9RckZENGxwczJkQzVwR0NkMzRtYWJQ?=
 =?utf-8?B?TkFpWW5rM2d0aEQvbzJ6UWd6VGEzcUtYNk9nMUlXRXRTTFN3YWVnL1FxSW1o?=
 =?utf-8?B?VUNjYkRQanROSVVuY0czbmVmVUFIRUV6VjBZaWJzZFhKOVVxM2JCZ1c2Z2l6?=
 =?utf-8?B?VlNIUEVOZStMQkVORzBGSHREbThSZmJnTWVaanFDajFLTEJ6T3hLR1VEWVhJ?=
 =?utf-8?B?cnJ6WUh0ak9mQ1BGNUpNc0dxODFxa3ZSYm50Skh5UDdqNXlNdHpyYk1DQm9F?=
 =?utf-8?B?QkEzV1M0dzVNaHNnR29XZ0NhaUdMSVRmUnJpWlY3aEVwYmtTNlRwNHRFYkY5?=
 =?utf-8?B?RmVGRTMzZThqMHRQMkpHYXZhSTV3L3FkSWNlMFRpMldLT0dGc3c4SmRPTTc3?=
 =?utf-8?B?VXVFU0Fmdm1hZC92WkJ4bEVWblAxQXdIcEY5T3lTbkJZMHZUNzJaN1FlY1Vp?=
 =?utf-8?B?Z0h5Ni84a01PWUFkd08wYzdhRDNObGdHT1NETmFub2lZVmNrc1dsYnkyZzJC?=
 =?utf-8?B?azIxK2lyOC9qM1VZWC8vVW5VcjBLOWQyT0tLZ3dPTEhJU3p0NTZuSEhDbUNq?=
 =?utf-8?B?TXRxYTJHOThiaCt1NDBtSVhGbjFHd3JjRWRsaUFiYktBazlXeU9kb0MyeGdJ?=
 =?utf-8?B?elJmNzZ0am9JTkFZOUdEM2dTbGFuQ1pwZmhDZzFnTzF6OTJ5Q3A3YjcxOGF0?=
 =?utf-8?B?YnQwYm1yU3k5MjBqQUdrdjkvMk0yektzMklRN0Rhcm1YRTRFME1aazFhNEhI?=
 =?utf-8?B?QjVNWUgzN0ZyM0NwbWZXaGRDNytVMGpCQzBOSXhpSUh6a2lMQWlpdjhMMWJa?=
 =?utf-8?B?Q0lDc2dMOVYxRWp0UzI1QUhaNmUrSWFCSTZFMlZjanpUVDJaS21Jdk5YN2RO?=
 =?utf-8?B?SGlqRndxbTBRamR0S3NYUnAwOSsrVG40aGVLRVJpaHhUdWp4VXlNeGlXMEta?=
 =?utf-8?B?WGwwbWxIM05MQzhRRmgrNlAzTDBCRlF0TGhISW5aTzZUbW9HWXpLaHU5eTBz?=
 =?utf-8?B?WjJJR0t3ZzU1WUJiOVNtejFDS1ZRM0Z3a0hIRjA4T2R6MENnLy92RHRNbHpa?=
 =?utf-8?B?Y3Mzc3ZBbTRuSXVudlYwaU91Vy9nUTRNakcrdWVrMXlmSW9sNkNVcG0vTlZD?=
 =?utf-8?B?bWJxZVZZT29jTTJPK0l5WTVBNTZsS1FpVFZ1WUNtZ1ptKzdrNnJIL3k1UU13?=
 =?utf-8?B?TmhQRHh2cnBpblFUd2g3eGJ6N0R6bkZjdGh1NXk3eTNWY3dXaVdDbnplOGo2?=
 =?utf-8?B?Y1d1S0ltbmU1TDcySXZaRDcxdE1iNVhYMmM3aW1lOHB2L3NGNktyQXZqb1Zi?=
 =?utf-8?B?MFo2UGZhMkMwbTVHM2hQQzQwKyt3SW5BZ2dwWUhDQkxaQ2ViMEo5RGFVVmt6?=
 =?utf-8?B?QWVaNzB1Q2E3cFVKaTlHVjV6U0NGS3g3YU1JRmNnU3ZSNGJSTjhpREFsU0pE?=
 =?utf-8?Q?9ptOu3cuEKm0o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2M2ZXZYUUVQS1orNzhldE0rZzlzTmtMQU5rMFJmUCsvTHVZaUU2OWFtWXM0?=
 =?utf-8?B?ZE5KMyt6QVZjQ0RNVzhPdkp0Qjl1NUxuUE5GWCtFcEFlQWt6NWZrOEcwejFY?=
 =?utf-8?B?QkhFcmI3c0lwcHY1U3pDT1ZTdzVEWjRweUE5YXk1WjdqZGpmWC9oOVVjcmJp?=
 =?utf-8?B?V09KRVJvcEJsTWlod0xqUmVQZ0VLY21RMUNncnNrbGN1SmFuWFQvdkN2WnZa?=
 =?utf-8?B?NTJickI5OWN4UzFtaTh1MWFSYm9GRFVHRlpaU0hzbVNhUjZScThJMWlpamZj?=
 =?utf-8?B?c0xxQko1S0xreEdsRFk0TFVITkttd3hUcU9lWnBoM2x0WXROdWhNWU5hQ09y?=
 =?utf-8?B?aHJDSmJ5Vk9NYUVtMk0zNVpXQzFCdExubFJVa1FjWFl5SzlDdFRYU0VDV3RD?=
 =?utf-8?B?UDNYaHR0eUZWL3QvcklWa25acm1tRUVUV0NFSmhOSktRdVlWemJEM3ZQc3ZQ?=
 =?utf-8?B?cUNBY2I0WmVSU2xVTHpGZE1HbGxmNktacDFtMTVVeUlYb3MydS9ZM3ByR1pp?=
 =?utf-8?B?K1RYMHpYUFZWRmh1ellSTTFuTXV1cGQ0UjRsaGRKU0VYb3ptYkxhY0pjdFoy?=
 =?utf-8?B?U3NhZDVmZkJxZCtJRGlTTFB6ZHJyYmV0L3RFViswVUdkR3J1bnpjdzZHOHk0?=
 =?utf-8?B?QWsrTFNYeVFoRXVDMWowOHp4YkJ3Q01QRkVaOVJuVDV3WEtQZUZ6a3ZPRlRm?=
 =?utf-8?B?WEpOemhwOUlQS1VuaFRXblBsV0NiMS9lVWthcXN4YmdMcUJYbG4zbW9Benpx?=
 =?utf-8?B?azFCTzQycDJ6OFRCYWtEOW9zKzNRbU5wZ0xhT05ZMkJIZ0I5NmdtdnhjTTJN?=
 =?utf-8?B?a3M5Z3FPNWc5T0JwdktEcm5Xc3dEZmtwYmduWURQYmpydTVQMDFWdzZzQXpT?=
 =?utf-8?B?TUYvb2ZPTmFzcGZPcmpXalJXTExWdWpiRld6dmhVbHBrMVc1cUUwUUhFc2Rh?=
 =?utf-8?B?YkZvUDZkZzg2Q0tUYkVFcnprVE5ERG5Tc21OUHpGRUIyQVpmYXppZmZ4UE8r?=
 =?utf-8?B?Z0FZZlR2Ry9nVURRQ3NrWDUvQUs3WVRtWUNmWHprZnFEZENnNVZKVGxJdWJG?=
 =?utf-8?B?TTlFak13R3BTWmdNOHJvRUJtNlRBcHJobFNTcGhqc3I5c3EybTl2eHd4VHhT?=
 =?utf-8?B?RXVyS2FveWVTL0x2US85SjF2Umppdlo1RHd0ZmZLV3FyeDJKVCtEVXN3WmhI?=
 =?utf-8?B?elFhTGcvbHFwY1JjTTJUdFo3ZW4zUlVuNlFEcTJ0VTAwdlBydGEzc2djU3Zl?=
 =?utf-8?B?U2JCR0pKOEw2eXhvQ000MEhDcFFSd1hMQUFpVnFpcy9remE3NHZ5eVZCSTVQ?=
 =?utf-8?B?ZUJpWkFKTHZJQXlHUHlkZmJ3QlhSUUtuZW5qb053RkZhcXVtL0pXalFIYUxC?=
 =?utf-8?B?WWw0a1RnM241ZVgzV2ExTEJVekpENmdQTjR4Z3lPRngwak12NndITlBhb29o?=
 =?utf-8?B?Q3ROTlZ1TWNTNU15TFlqOHNqZVVFc003MXpnV0J2d2Fyd0VkUklOcVQvUGdh?=
 =?utf-8?B?OTZUcWwyaUx1ZjdLa0cyL3oweXNxZUh4OFhobkU0Vm5QaC9vempUQ2tIeGZI?=
 =?utf-8?B?cUE0anRRSkhlRk5QNlc0Qy9XaVZBZUVXanc3NzFEMGRCRTZTc3hZWVl3Lzho?=
 =?utf-8?B?TlhNVVRoSUtBZS9QZ1paMXNDUHNESmhCT0JjcS9qZzRhL1J1KytiRUVnbWpr?=
 =?utf-8?B?VUZjWVF3YXRtbWhkbUZoSkMrbEx3dU9xeTZxZ1B4RnU4QmFxMkRQNDhsSVlK?=
 =?utf-8?B?TEI1Q28yakxJMmpDVGlWK2VlL2FXODVnN0krcHN0ZXdyNW15SVh4MVYzSGFv?=
 =?utf-8?B?VEF2SWtUTlVZRVlPRkRzRThYY0djWDRuV21qMDlxVnVEVVpEc3JmNmYweUFE?=
 =?utf-8?B?eDVaVVpweitpQlR2bGhETHNuSmRCaTFnKzE3OVFraWRyL3ROWWp5SE9YREJY?=
 =?utf-8?B?TUc4cW1Fenp1dUlvTU56TFhISGJ4LytpWHQreEg2TEhPWUNLV0tubWhTSHZi?=
 =?utf-8?B?SFUzb3BKdmtaWlVQcDFvcjZZZGt0TE1rVDR0c2lMc3VXcmExa0txOXNGZ3ln?=
 =?utf-8?B?TjJUSWV6WlFDRU1mZ2ROR09MSWZJemlldTVXMDBWN0V0aXczdW9OT2lTdzQ1?=
 =?utf-8?B?dE5nT2V3NXdNclBidVV1M1pUK2pYSWdJMmZxdjRpakUwWTJtTWJCZzZHUG92?=
 =?utf-8?Q?eVUhuj2k1QPI82cDcpSXLhA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf3fb07-2b86-4503-9b88-08dd5846401d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 22:21:30.4973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+sYnka8Zw5OvzLuzNQ0vXtfUnztSGm6bYs6TuFEeuzGG3E+5yeQstjtLhRr+NOSs7qrdB3RzwLs03fcUNbj1HpJ8oI/+WHnoN/6uCjLFME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7627
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



On 2/28/2025 1:47 PM, Michal Wajdeczko wrote:
>
> On 28.02.2025 00:59, Daniele Ceraolo Spurio wrote:
>>
>> On 2/27/2025 3:29 PM, Michal Wajdeczko wrote:
>>> On 27.02.2025 02:05, Daniele Ceraolo Spurio wrote:
>>>> The GuC uses the same format for all its KLVs, so having the functions
>>>> to set them in a common file will allow us to re-use it for different
>>>> types of KLVs and not just the WAs in ADS.
>>>> The next patch will make use of these functions for a new H2G command.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_ads.c         | 89 ++++++-------------------
>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 62 +++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  7 ++
>>>>    3 files changed, 89 insertions(+), 69 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/
>>>> xe_guc_ads.c
>>>> index fab259adc380..ed3304a11812 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> @@ -22,6 +22,7 @@
>>>>    #include "xe_guc.h"
>>>>    #include "xe_guc_capture.h"
>>>>    #include "xe_guc_ct.h"
>>>> +#include "xe_guc_klv_helpers.h"
>>>>    #include "xe_hw_engine.h"
>>>>    #include "xe_lrc.h"
>>>>    #include "xe_map.h"
>>>> @@ -283,56 +284,6 @@ static size_t calculate_golden_lrc_size(struct
>>>> xe_guc_ads *ads)
>>>>        return total_size;
>>>>    }
>>>>    -static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>>>> -                      enum xe_guc_klv_ids klv_id,
>>>> -                      u32 value,
>>>> -                      u32 *offset, u32 *remain)
>>>> -{
>>>> -    u32 size;
>>>> -    u32 klv_entry[] = {
>>>> -        /* 16:16 key/length */
>>>> -        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>>> -        FIELD_PREP(GUC_KLV_0_LEN, 1),
>>>> -        value,
>>>> -        /* 1 dword data */
>>>> -    };
>>>> -
>>>> -    size = sizeof(klv_entry);
>>>> -
>>>> -    if (*remain < size) {
>>>> -        drm_warn(&ads_to_xe(ads)->drm,
>>>> -             "w/a klv buffer too small to add klv id %d\n", klv_id);
>>>> -    } else {
>>>> -        xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>>> -                 klv_entry, size);
>>>> -        *offset += size;
>>>> -        *remain -= size;
>>>> -    }
>>>> -}
>>>> -
>>>> -static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>>>> -                    enum xe_guc_klv_ids klv_id, u32 *offset, u32
>>>> *remain)
>>>> -{
>>>> -    u32 klv_entry[] = {
>>>> -        /* 16:16 key/length */
>>>> -        FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>>> -        FIELD_PREP(GUC_KLV_0_LEN, 0),
>>>> -        /* 0 dwords data */
>>>> -    };
>>>> -    u32 size;
>>>> -
>>>> -    size = sizeof(klv_entry);
>>>> -
>>>> -    if (xe_gt_WARN(ads_to_gt(ads), *remain < size,
>>>> -               "w/a klv buffer too small to add klv id %d\n", klv_id))
>>>> -        return;
>>>> -
>>>> -    xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>>> -             klv_entry, size);
>>>> -    *offset += size;
>>>> -    *remain -= size;
>>>> -}
>>>> -
>>>>    static void guc_waklv_init(struct xe_guc_ads *ads)
>>>>    {
>>>>        struct xe_gt *gt = ads_to_gt(ads);
>>>> @@ -343,22 +294,22 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>>>        remain = guc_ads_waklv_size(ads);
>>>>          if (XE_WA(gt, 14019882105))
>>>> -        guc_waklv_enable_simple(ads,
>>>> -
>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>>> -                    &offset, &remain);
>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>> +
>>>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
>>>> +                     &offset, &remain);
>>>>        if (XE_WA(gt, 18024947630))
>>>> -        guc_waklv_enable_simple(ads,
>>>> -                    GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
>>>> -                    &offset, &remain);
>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>> +                     GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
>>>> +                     &offset, &remain);
>>>>        if (XE_WA(gt, 16022287689))
>>>> -        guc_waklv_enable_simple(ads,
>>>> -
>>>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>>>> -                    &offset, &remain);
>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>> +
>>>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>>>> +                     &offset, &remain);
>>>>          if (XE_WA(gt, 14022866841))
>>>> -        guc_waklv_enable_simple(ads,
>>>> -                    GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
>>>> -                    &offset, &remain);
>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>> +                     GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
>>>> +                     &offset, &remain);
>>>>          /*
>>>>         * On RC6 exit, GuC will write register 0xB04 with the default
>>>> value provided. As of now,
>>>> @@ -366,15 +317,15 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>>>         * future, so GuC depends on KMD to send it the correct value.
>>>>         */
>>>>        if (XE_WA(gt, 13011645652))
>>>> -        guc_waklv_enable_one_word(ads,
>>>> -
>>>> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>>>> -                      0xC40,
>>>> -                      &offset, &remain);
>>>> +        xe_guc_klv_enable_one_word(ads_to_guc(ads), ads_to_map(ads),
>>>> +
>>>> GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
>>>> +                       0xC40,
>>>> +                       &offset, &remain);
>>>>          if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
>>>> -        guc_waklv_enable_simple(ads,
>>>> -
>>>> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>>>> -                    &offset, &remain);
>>>> +        xe_guc_klv_enable_simple(ads_to_guc(ads), ads_to_map(ads),
>>>> +
>>>> GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>>>> +                     &offset, &remain);
>>>>          size = guc_ads_waklv_size(ads) - remain;
>>>>        if (!size)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/
>>>> drm/xe/xe_guc_klv_helpers.c
>>>> index 146a6eda9e06..50eab2086ee3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>> @@ -7,8 +7,11 @@
>>>>    #include <drm/drm_print.h>
>>>>      #include "abi/guc_klvs_abi.h"
>>>> +#include "xe_gt_printk.h"
>>>> +#include "xe_guc.h"
>>>>    #include "xe_guc_klv_helpers.h"
>>>>    #include "xe_guc_klv_thresholds_set.h"
>>>> +#include "xe_map.h"
>>>>      #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>>>>    @@ -146,3 +149,62 @@ int xe_guc_klv_count(const u32 *klvs, u32
>>>> num_dwords)
>>>>          return num_dwords ? -ENODATA : num_klvs;
>>>>    }
>>>> +
>>>> +static void emit_klv(struct xe_guc *guc, struct iosys_map *map, u32
>>>> *klv_entry,
>>>> +             u32 size, u32 *offset, u32 *remain)
>>> s/klv_entry/klv
>>>
>>> s/size/num_dwords
>>>
>>> KLVs are always u32 aligned
>>> 'size/offset/remain' all should be in dwords
>> That would mean having to convert back and forth between u8 and u32:
>>
>> - allocation is in u8 aligned
>> - params to this function would be u32 aligned
> but for generic KLV functions it doesn't make sense to pass u8 sizes
> and we should aim to define function signatures that enforce proper logic
>
>> - xe_map_memcpy_to below needs u8 alignment, so convert back
>> - the GuC expects a u8 aligned size, so need to convert remain back to u8
> that looks like a mistake done in this action definition, since all
> initial actions that introduced KLV concept (like UPDATE_VGT_POLICY,
> UPDATE_VF_CFG) were defined to operate on dwords as size

This is an ADS entry and all ADS blocks are offset/size. The new H2G 
command (in next patch) is indeed dword aligned, but it still seems 
simpler to just have a single "offset / 4" that multiple conversions 
back and forth.

>
>> Just using u8 everywhere seems simpler instead of converting back and
>> forth.
>>
>>> this will also match rest of functions in this file
>>>
>>>> +{
>>>> +    if (xe_gt_WARN(guc_to_gt(guc), *remain < size,
>>> do we need xe_gt_WARN in production?
>>> maybe xe_gt_assert will suffice?
>> I've kept this the same as what was in the original function. Not sure
>> why it was xe_gt_WARN instead of assert.
>>
>>>> +               "klv buffer too small to add klv id 0x%04x\n",
>>> s/klv/KLV
>>>
>>>> +               FIELD_GET(GUC_KLV_0_KEY, klv_entry[0])))
>>>> +        return;
>>>> +
>>>> +    xe_map_memcpy_to(guc_to_xe(guc), map, *offset, klv_entry, size);
>>>> +    *offset += size;
>>>> +    *remain -= size;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_klv_enable_simple - Emits a KLV with no data to an iosys
>>>> mapped buffer
>>>> + * @guc: the guc structure
>>>> + * @map: the iosys_map to write to
>>>> + * @klv_id: the KLV to enable
>>> key ? there is no Len nor Value
>>>
>>> this will follow other functions in this file
>> ok, will rename.
>>
>>>> + * @offset: pointer to a variable holding the offset to write to
>>>> + * @remain: pointer to a variable holding the remaining writing
>>>> space available
>>>> + *
>>>> + * The function checks if there is enough space to emit a KLV with
>>>> no data and
>>>> + * if so writes it to memory. After the write, the offset and remain
>>>> variables
>>>> + * are respectively increased and decreased of the written size to
>>>> be ready for
>>>> + * the next emission.
>>>> + */
>>>> +void xe_guc_klv_enable_simple(struct xe_guc *guc, struct iosys_map
>>>> *map,
>>>> +                  u16 klv_id, u32 *offset, u32 *remain)
>>>> +{
>>>> +    u32 klv_entry = PREP_GUC_KLV(klv_id, 0);
>>>      u32 klv[] = { PREP_GUC_KLV(key, 0) };
>>>
>>>      emit(... ARRAY_SIZE(klv)
>> Why? this function is specifically targeted to writing a single u32, why
>> write it as a u32[1]?
>>
>>>> +
>>>> +    emit_klv(guc, map, &klv_entry, sizeof(klv_entry), offset, remain);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_guc_klv_enable_one_word - Emits a KLV with 1 DW data to an
>>>> iosys mapped buffer
>>>> + * @guc: the guc structure
>>>> + * @map: the iosys_map to write to
>>>> + * @klv_id: the KLV to enable
>>> s/klv_id/key
>>>
>>>> + * @value: the data associated with the KLV
>>>> + * @offset: pointer to a variable holding the offset to write to
>>>> + * @remain: pointer to a variable holding the remaining writing
>>>> space available
>>>> + *
>>>> + * The function checks if there is enough space to emit a KLV with 1
>>>> DW data and
>>>> + * if so writes it to memory. After the write, the offset and remain
>>>> variables
>>>> + * are respectively increased and decreased of the written size to
>>>> be ready for
>>>> + * the next emission.
>>>> + */
>>>> +void xe_guc_klv_enable_one_word(struct xe_guc *guc, struct iosys_map
>>>> *map,
>>>> +                u16 klv_id, u32 value, u32 *offset, u32 *remain)
>>>> +{
>>>> +    u32 klv_entry[] = {
>>>> +        PREP_GUC_KLV(klv_id, 1),
>>>> +        value,
>>>> +    };
>>>> +
>>>> +    emit_klv(guc, map, klv_entry, sizeof(klv_entry), offset, remain);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h b/drivers/gpu/
>>>> drm/xe/xe_guc_klv_helpers.h
>>>> index c676d21c173b..231f7c4b0947 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.h
>>>> @@ -10,6 +10,8 @@
>>>>    #include <linux/types.h>
>>>>      struct drm_printer;
>>>> +struct iosys_map;
>>>> +struct xe_guc;
>>>>      const char *xe_guc_klv_key_to_string(u16 key);
>>>>    @@ -61,4 +63,9 @@ int xe_guc_klv_count(const u32 *klvs, u32
>>>> num_dwords);
>>>>    #define PREP_GUC_KLV_TAG(TAG) \
>>>>        PREP_GUC_KLV_CONST(MAKE_GUC_KLV_KEY(TAG), MAKE_GUC_KLV_LEN(TAG))
>>>>    +void xe_guc_klv_enable_simple(struct xe_guc *guc, struct iosys_map
>>>> *map,
>>>> +                  u16 klv_id, u32 *offset, u32 *remain);
>>>> +void xe_guc_klv_enable_one_word(struct xe_guc *guc, struct iosys_map
>>>> *map,
>>>> +                u16 klv_id, u32 value, u32 *offset, u32 *remain);
>>> hmm, "enable" does not fit here, maybe:
>>>
>>> xe_guc_klv_emit_empty / no_data / no_value
>>> xe_guc_klv_emit_dword
>> emit_nodata should work.
>>
>>> and those should be inlines that use:
>>>
>>> void xe_guc_klv_emit_simple(
>>>      struct xe_guc *guc,
>>>      struct iosys_map *map,
>>>      u16 key, u16 len, const u32 *klv,
>>>      u32 *offset, u32 *remain);
>>>
>>> like:
>>>
>>> inline xe_guc_klv_emit_simple_empty(.. key ..)
>>> {
>>>      xe_guc_klv_emit_simple(.. key, 0, NULL, ..);
>>> }
>>>
>>>
>>> inline xe_guc_klv_emit_simple_dword(.. key, value ..)
>>> {
>>>      xe_guc_klv_emit_simple(.. key, 1, &value, ..);
>>> }
>> This seems to just make things harder. xe_guc_klv_emit_simple() would
>> need to handle the case where we have data differently from the case
>> where we don't, potentially with 2 separate memcpys (one always done for
> this isn't on the hot path so I would prefer avoid code duplication over
> perf optimization

This isn't about a perf optimization, it is about keeping the code 
simple. The only duplication is between:

u32 klv_entry = PREP_GUC_KLV(klv_id, 0);

and

u32 klv_entry[] = {
         PREP_GUC_KLV(klv_id, 1),
         value,
};

Which is minimal, but it keeps the common code much simpler as it 
doesn't have to handle optional parameters.

>
>> the key and one optional for the data). I really don't see the benefit
>> when the current approach still makes most of the code common in
>> emit_klv() and only has separate arrays. Also, that wouldn't be a
>> "simple" emission anymore since it'd handle all the possible cases, so
>> the naming also wouldn't fit.
> but the goal is to have helper function to 'emit KLVs', so the 'simple'
> here means help in building and emit of the proper KLV-header based on
> the provided key/len params, followed by emit of value (as dwords)

The "simple" here was in reference to the fact that there was no data, 
as compared against the emit_dword.

>
> and while your current case is only KLV with 0 or 1 dword, nothing
> prevents us from implementing generic helper, and satisfying your need
> with trivial wrappers for 0/1 case

I'll give it a try and see how it looks, but it really seems like we're 
over-engineering this by introducing an helper that can handle cases 
that we don't have.

Daniele

>
>> Daniele
>>
>>>> +
>>>>    #endif

