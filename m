Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DD6606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 06:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jNba4Ebo;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QDA8pZm/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9389D10EEF1;
	Wed, 25 Nov 2026 06:44:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2382E10EEF1
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 06:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795589060; x=1827125060;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pp4W3cpuZUhTNiF8qq5Dxw0GCwemkgd4Kq0A00ZTcxs=;
 b=jNba4Eboq7XjTAc9HMpm1f4i0sNkXgEECVOcpkx5jb4FPNKDggPjfDR/
 SlIgs3f3L/A1gNARvQMqxcNe7frwKMN4bl1vpgCjbz0c9lZf+NLLa7Q3V
 /axR7K3MY/Yu6mgd+BZtIzkYMZw7ipGi5/ULQ2cEVjSLGvxfjXX1bgAxz
 tekdFLcXEPVs+w3kc9ftE4+5L0GKfk4dynOgUkuFWqZaRTQd0tcpor5nX
 qJ6fjFfjmvoo7jANicgfuzQkjVIZ0kXTfxWVwUnXFmyjgrMkCNmiP+vWG
 h/rdKrpjAK4UAsnjFJj2vEQoBbta7RpXVbF12nhTUHM23KRDrBx5fUB8d g==;
X-CSE-ConnectionGUID: x6IEVfqoTJqIJ6RzoFLevw==
X-CSE-MsgGUID: +o03gg0iTOS+Vj3AhbneCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4534636"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4534636"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:43:03 -0800
X-CSE-ConnectionGUID: y+1yZSFNQceUB+O0p9LkSA==
X-CSE-MsgGUID: InkSvl05T+mzumqlz8GvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11675640"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 22:42:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:42:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 22:42:45 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 22:42:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/K0abU9SiuA6AH35x5xsmJpI7nMyvji5diLGOXUeL0C0TkMhR4wio4ym1qtSshtcs5SmtQcuBrclPYqS4tlaA556BPJWItNzgmNVDRsPptP4RSaanAmTPaMA/5x0o7L9gn9s1eE9rANUPVlektNf4tq3mgtAXmcKOXPk2ES0c+UfPwikFEc6V1W/+jG0fb4XLYHsdXs5x5K4wIHO/5+YsVpAR2v+ER6fr+LsTlMBPZrIgLju5iL2eJHVQwmfghydJpbD3Nvoi5AkIx+iBlHSFuNcYQRpzvv5a7iOsOwdeZXBpyRxC433X9691U9WnJx/4qxRosakIn1qYv3OZ3UvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP/tRozItrs2icuOu8IYxYx8lQawUe7rRnd405xSuBE=;
 b=lEoGtDpNQSCpjVrq9RYhk2xvYJvKr0br+uZghGTP/5HdoYSsnbFWfE3nhTUu6O7QDfTgvgGRvGeDZdtFz389jHwsBpvF/Nh6AvKas6gVIESjTjClI3pj0ftNq0G0iZv4EJEGxMfgseZVZH+xE4mVG0sFad3s0zO9kI6Zgc1bObcqSPV52YYozG799L+yuiC+bLJvW5b719mZDmv4YZhSJA+TxSq/M0phwGlKtouZAt8SIsTkQUSApY7ykclrz1UENxLwIHqrPD2eBbIcwDZI+SrH0oy2uMDDsNZx9a1Kr/Wwcj6a6fcE+h8v6K9ULTXJG/gpAXrNAfFieraui+sJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP/tRozItrs2icuOu8IYxYx8lQawUe7rRnd405xSuBE=;
 b=QDA8pZm/V25R5sE7IkjX7pLzkOcL44QFb/fIrXWanvDXPM/1PAuYBu0Ge4HObJPtAyoO5+z60sCEDYjp7ygYpPbxOXlQhGiL1OJYx2sV4XJruUu6IV6AfrI5g4JczvPfrQfoQ1ljVsjdtU2ZPUB7yV0V9Dx18FDtw58yBOAmR+c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 06:42:42 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 06:42:42 +0000
Message-ID: <8a7eb2fd-df8c-4273-963d-5777a0b854ab@intel.com>
Date: Wed, 25 Nov 2026 12:12:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/survivability: Fix infinite loop in aux info
 traversal
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20261119104300.3401464-2-sk.anirban@intel.com>
 <fd341c40-b5fe-4624-a6cc-9c3458880240@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <fd341c40-b5fe-4624-a6cc-9c3458880240@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|MW4PR11MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: aef55d6a-f791-4212-09e2-08df4abf4e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|261009223027099003|6133799003|261021123027099003|261021121427099003|56012099006|261022105027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: WIq27RCOPxBcdoyrqXLhI9XI1w0Y1tLSCoznE96GLz7bV+Sc3nfSQTgcm0M/j839RpP+Wyx3A+cJWVciIxTxwyh54hpor+mdXzIl4Zy8S6iB6bHzTphLqydBE75P/NKTsPjes+Cqt+r6JHDtE/6viVkkn2ZCEnDyhP+sjdrLXPwhsGrzEQ8IC2D29rNBqlJDBVsrmX3Y52icC8fepPEifRqsifrzpX+5g5V2BhV4z2oqeXaHGOt/DWpjLN4o6zhhuzV2TN+UyZNXMGGXWfxE4jvI0Fk/kWhY7RRVss5T0HIaGNqvnl0NpZ+7fXIto11mLAmpFvmRufpSewF5RZc8IFbZvmkYk8SYv4mywCxrGB9vjHti4ugk9w1t2LD+INTUS2IpVQ/VndZK+EAhuOzhZ+AM2VkiZzUwf2sjCT1mwH/n+ZxM3rDXQ/tnx2+CMAjS5qkXBL3PKbtaYUNKn31RPiDXaHOW5aQwfKmVpN6s5uLOG4PpcPrtfIdd8Y1a19uVvA+bnF6zXTgtBQ0foES09DOZV3fRZ8KTzcUToKhVJV/2OUdA+3tV+BKQd720doNDI7BJgThfBnkoWD3flcsZv1wVAnVDuxizI/7K4gMYdC69Ui/FcdVbKz1ED5oHWabIGDlmEqjxS/LxCgzTvIFbI0a4mpufEZzut1wtjTjsluY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(261009223027099003)(6133799003)(261021123027099003)(261021121427099003)(56012099006)(261022105027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW1EY2JXbU10QXNLZm4zSGh1QmV0ZkJvRlRXdG5lNStvRXA2RjJRT25Wb1Bo?=
 =?utf-8?B?bmFkeHRIZS91Zkp4aU55dnNxS0dVZmxreTVWT1ZqZkZQUnJZano3NTJFNVlC?=
 =?utf-8?B?WFUyak9KNTBzNDNzM0VFcjZWTVBScG1tVUNUZmR0Znk2VFNtTUdyZ1BMdWI3?=
 =?utf-8?B?TzAxdDRFNkpxSElTNGlVRDlSRENmUE1IOXk3R0dKWVk1SWNzdkFVOCtobjZj?=
 =?utf-8?B?YUtnT25wOGZ0Sy9UMWI0OHdzUmo1UDNRVVdweEwrclp3V3NYVEdMMXFoWDAr?=
 =?utf-8?B?RVRaR2MzTEYzSW4vNkU3NDVvcWFIU1ZlNmg5L21QV3pYNGVRM2VtWTFKWDVI?=
 =?utf-8?B?bFkzdmpEeE41ajZzQ0NrdzhoUUFMekhrTytHKy9vS1FqS21DUnBZM3AxdGk5?=
 =?utf-8?B?SDVDRFozL2V0SDR5YUw4SmI4dnhzc1EvWnhCY2N5NjFITTlVMzFUbFpSQU5T?=
 =?utf-8?B?bW1pbnNBckVBTmJyZmlSd3NmOTVqRTdxWjFCU2VEeHJKRnBJVkNJNEgvWlFa?=
 =?utf-8?B?TFpuZDRoZkxkc2xya3VRM1JLNHBxNzZjalFBRmVxYmhwTjY4WHZ6RW10dWlF?=
 =?utf-8?B?VVBnQlpBSVI2V2RYVlRmcmM5Qzk5Rm5LUDVvYm9TbkNWcERHMnJtbjZ0NUl2?=
 =?utf-8?B?YzZDaHFlRHVWcE0yM2dlazlJaktad0Y5dkx6V0lUd1ZqVnhBMC9aU0ZLTEdt?=
 =?utf-8?B?b0tQZ2hCK0x2eUdHOUxoS0lVRnR2eTBhOGdWcHM1RXRrRUFFOGNGdlR2SW5v?=
 =?utf-8?B?QVBUdmZmREM0OWxWWlU3a3dreWF0Q28yaC9XZC9rK29QYlFHV1B3MVpyLzRx?=
 =?utf-8?B?VndCTUtRMGVxVjBib0duSVpZdUFLbXVzc2dYeFcrMGNvbzk3UmhRWnBzN25Q?=
 =?utf-8?B?N0NpTjhvaHQ4ck9KajNsOFpuc1VHM3NZVTJBOTYxZWU2RDFUQVN3Tlo0VUJW?=
 =?utf-8?B?TGV4OUdDZ1BwODhBckVLT1ZVUEdERjBTL21LRUdQSkZTNmlXdG5HY1VwUjJw?=
 =?utf-8?B?d1Bzd2VFRTVvdk5nUVMwSVo0VWxXc2U0dmZTL1VsYXJrZ0ZXdG9PaHVEK2Fk?=
 =?utf-8?B?ZDQva1NTZkZ6RzVWeTlsTFJ1aGFDQ1pCdVNDWWlrcisydjRuSXZaQ0JmYUZI?=
 =?utf-8?B?NEpLalJJMS9NVTQrbVVPSWJhaUxWckZBYXBYRVJhc1NuL0dodVprcStmeUc0?=
 =?utf-8?B?WGkrdWJvMVBobzFLcC8xc1BHRVgvQjRFVXhCYnNJRVowWUNxUVVReWhhbVlo?=
 =?utf-8?B?RlRBSGFsTVVUUEdxL2sycGxrZ0wrQ0RBaGNONGxERXNBRVc2QTFVekp2N1pT?=
 =?utf-8?B?Y3NJQ1ZZaVFVN3laSTVRakJmQTQ5WEdaNXJjemladWxsbHJXUVdWM200eUZh?=
 =?utf-8?B?WTRveEJLYVkrM1VzTGF4QmttNGhPTEh2ZDgybEJJQlA4MUZHcVhRdmI2VHRL?=
 =?utf-8?B?eWVIbXVvL2syWW1WQ2d1RkRHQjVjeGFDaWNSZ0M1NmZKcW9nV3JuOGsrK1FE?=
 =?utf-8?B?TVlTWVNlMVBJWTJYdzVMbTBQaFNydHNCd3dzODhBZHJlb28xU2wyQVRyYXcx?=
 =?utf-8?B?cFVPenAxV1QyZWk1allBY3hEYTlSUFc4S1kvK2R0bGJQemhnZHNqdlF5bE1Y?=
 =?utf-8?B?NHRUb2Z5SE9MellSTGhpcEdObW1iSHIxdjB0YVQ4VGVuamxSV3Z6ZHFCRldC?=
 =?utf-8?B?cldCUFR2QnRNd0hkckhDWFBvOU5EUWNRUWFRSkFSZ2JtQ2M4Vy9SZzFDQy9K?=
 =?utf-8?B?eUNFSEMyLy9NL2hFenBmS1NxZjRTUzM1OXQyN3hlWHpheFFhdW9UZjhUeHBm?=
 =?utf-8?B?bk0xbi9hc3lUa2dTYzMxdDV3aVhFR1p3cWdLa20yTENvb01KZU1YMU1zVjND?=
 =?utf-8?B?UGRuNFE4NEhWWnh2bVlVL0FaZnI4c00xMllNeDZtdVBEZFJ0RkhuY0JiR1dt?=
 =?utf-8?B?UXp0ZkorQ1hQYmNZVWt2Sk5zQ0JvWmVaNUNxNHhCKzg0UkdNOU54dE4xdlZx?=
 =?utf-8?B?bi9DWGlpOHUrL09KdzVvelI1eStGRndPM1I2OTNVM3lpU3dmRHBpMnFCRmpV?=
 =?utf-8?B?ZFh4Mi83YVpHeEliZFlFSVpoRFlEL3REOXhtdkVjL3dMZXQrUkZVRXQxOWdi?=
 =?utf-8?B?eGxyZHlrdWZoLzIxQU9EWUNqVytDZWxYcyt1d2N3TzlLL0FjenpkNDJVZGtj?=
 =?utf-8?B?Q3hVa1Zia2E0SzdhWVFhM2dnSlg0QWZIcWl3Q3M4cFoyUnhtOWdDL3p1ODlX?=
 =?utf-8?B?MEdKdndFSjhZT2tCVllYeTZNN0FRalpaOFE2WWJHRDBFejFWdVRwYTRVR0Jl?=
 =?utf-8?B?eUJodkFNWk9jbmw0MHVzQVhnUTk4dVdXYTVTSWZnQWFtQ1p3WjFndz09?=
X-Exchange-RoutingPolicyChecked: RLhXFqHSy2UedBLuILrJxsQGi315CtL7PYUpgd+j8Kl5+sOxUTcsSf+NYxSNornKH2gaMT6gs6aHOET2wCK6SeiOL2bpH2ZZ9SO+u8xDUvgXxlSEFg8OxaWIpZqNnJbW0ACiEyATXoEDWK3v1YFtDfVlisrNzTVAUk473hXYDy9bpqVqSB5ApZrJejWjuTWJx27qilywMsU6orjJmCbQ73STNrFGf/QSTo1FvucjdcJMjxDn4pRJCndkpXhlnXkCi8umksiZXykdCFr07XJYCDYdazuLlKAgZOqlWu6HjTtVa12bGVDgCPjSqJ8Go2arU6EUh3muJHranJ3XqwJRgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aef55d6a-f791-4212-09e2-08df4abf4e03
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 06:42:41.9070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihphtJ5dLIafXbG8sOju68/n45rjxpNKnwyT3QC8B5MWiu6Prt8AMLNCuSjzLQsYf3T/SyxR+pSY/5VeTjxEfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Riana,

On 24-11-2026 22:50, Tauro, Riana wrote:
>
> On 19-11-2026 16:13, Sk Anirban wrote:
>> AUX info register traversal can loop indefinitely when a register
>> points back to itself. Avoid revisiting registers by reading each
>> register once and collecting the entries that contain data.
>>
>> v2: Add fixes (Riana)
>>      Modify loop (Riana)
>>
>> Fixes: 5e940312a2ac ("drm/xe: Add functions and sysfs for boot 
>> survivability")
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c 
>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index 91a0680e449b..5fd40bc0dec0 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -168,12 +168,12 @@ static void populate_survivability_info(struct 
>> xe_device *xe)
>>               set_survivability_info(mmio, info, 
>> POSTCODE_TRACE_OVERFLOW);
>>       }
>>   -    /* Traverse the linked list of aux info registers */
>> +    /* Read all aux info registers and store the non-zero ones */
>>       if (reg_value & AUXINFO_SUPPORT) {
>> -        for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>> -             id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
>> -             id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
>> -            set_survivability_info(mmio, info, id);
>> +        for (id = AUX_INFO0; id < MAX_SCRATCH_REG; id++) {
>> +            if (xe_mmio_read32(mmio, PCODE_SCRATCH(id)))
>
>
> Do we need this read? survivability_info_attrs_visible and
> log_survivability_info already do a valid value check.
>
> Thanks
> Riana

Yeah, I just checked the details, no need to read it twice. I will send 
next rev to address this.

Thanks,
Anirban

>
>> + set_survivability_info(mmio, info, id);
>> +        }
>>       }
>>   }
