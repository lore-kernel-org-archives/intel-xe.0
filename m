Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F49C83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 19:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3133010E02C;
	Wed, 30 Jul 2025 19:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnFW9g9k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9573110E457
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753905444; x=1785441444;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fvtrqQnZpjX71U1AiBtLJYd9Mifz3MaEbD8N0rLguxk=;
 b=OnFW9g9kvBWtATYgaAvQowHMExAWkiaa5ZjLJb5USCCjLv0bowv4kuUd
 jjoakGaIRXqhs/nWbbCmWe4LMjpOk5CzyAE5gKM8VqZigbamLWHf+YNzx
 Q+B+j1s6aIxQ8IaoH229CmDoWSJM0+xYOIq+v5JjHhmCU81qvafknIg47
 FpPhJ8yiPrawz7dqM3o2Mp7plWaL5jARNvssEk8muRkN1OEg+9gP5F80h
 7YhIM/75VcZ71d+A+8IpOng29rbEB3bU25aHU/l7fifRKWEhRB6QOPulO
 JVr20CpnizvQycwFpFdRd58AFOqjRUw6Tk/+ix4k9wLEUQjwtKvBq155+ Q==;
X-CSE-ConnectionGUID: GiW4/yLrT7KgWdD+y625BQ==
X-CSE-MsgGUID: rS78s9MHS5CEMMqGkY7Suw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67662106"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67662106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 12:57:23 -0700
X-CSE-ConnectionGUID: TV3qMvMLRymqMf0il9P8eA==
X-CSE-MsgGUID: TMu+XADfQsqznZusZsSxbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167256591"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 12:57:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 12:57:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 12:57:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 12:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzbDGvU/eg0coxShcX5v7+/P+DeHYdJWxppPHk8rQwJ6dyFGDQRtc+X7ppQq4vHa94L8VQ234Im1uBWz6GZCXHb5KL8N5wk4+LJF8W5+1DHIYgBTfXx7GPkThSK85aB72UbV9dCBITiJgXgGl0fcLasABSZzEzrbanXJ57woflPAgMMuMJ+thpg3SmQq5trdu3KgFz9J/9v5U+M2ENboLPApl3DHmDcwDI23aRIuewM5LyEGaIaa7Ujdf39sabNEoWHe/QqoPnu7te7tCeUjQGyd2jWeqwKioCDTqikBR3AqhmRkbGd8ycvKtJowf1RCMZjXT5QOr7jOHuxXGRBstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqksuUVx64Na3TaTopDPyuz53AGPYwFX7XXM0k2lzoc=;
 b=NXukMkWWXK2tXziUEWtCb3wgfrFgFJ9w7el1YxCp0sIrf17ajJ6wUPuJXa9fnTrODOv7YnR/3uchcoTXWRiad3mtTxwhdkUSJMYiqTKGiX1UZdCKW+LZQYVnM5OfW8G/SJ27cVhuIBhNLoG8sSLXi7773MlZtEybA2Zro0jIDTvoug8qbZaR01E5HIf4D9iNuxQtZfA/kHmRf/ERCVIzrYknWMx/3a2Uw7dtXACX5Q2V1HFunTfLRfWC02H0NVqrYxePy+1/MgZbXqOv4/UovmsJOsI5BeA4TpNT4geIejXGNcLkdRAm8X3dGQCWc1F4gmYmAfDVsF9HPq9NwiHwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB7043.namprd11.prod.outlook.com (2603:10b6:806:29a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 30 Jul
 2025 19:57:05 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 19:57:05 +0000
Message-ID: <e0b09023-128c-4ed0-a8c8-2d12fad11692@intel.com>
Date: Wed, 30 Jul 2025 21:57:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] drm/xe/configfs: Only allow configurations for
 supported devices
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, John Harrison
 <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-11-michal.wajdeczko@intel.com>
 <aIk_4BBGSuIp19WQ@intel.com> <311dc290-d5fe-4214-b332-96337f3c80a8@intel.com>
 <91cb7b75-3fbb-4749-b048-de55a9599ada@intel.com> <aIpIu4UdcmVDCzur@intel.com>
 <4f3a7559-985d-4212-a4b1-6f6386375ca9@intel.com> <aIpkWIw3EAKVglLU@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aIpkWIw3EAKVglLU@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: ad26df67-a8af-4cfe-a8df-08ddcfa341db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3h3c09HT1o4My8vRkpidGNxd29zYkEyQTlMTmtsMmdTUEVIRXhvait4ekhT?=
 =?utf-8?B?Z1hPOGFDOEZ6ZExjT0NYcDA2U1A5MGE0V0xmRTdtMmVXWTcxalA2NHNXWWwr?=
 =?utf-8?B?bWc0RkdCNWxVZ1dSU2FnZHdwTXJpSVV2MlIreVo5cFc1QkM3dnNIL2dUNzRE?=
 =?utf-8?B?MGw0blA0a0FLa00vTHA5TW15bU9McTkvMWZOckpaSUtEODFYYUlRRTJXTXZz?=
 =?utf-8?B?OWlWek9ZRktmSzZURDJTN0M5TktKTi9xQlpYaFp2Zk02ai9WTWJ0R1llaThr?=
 =?utf-8?B?YlBZak5iYlAyZklkRUZwT0ZaUkxVdGRzcTFickZUQmF4aFVBdXowMmNaVDdx?=
 =?utf-8?B?cHViSUtOa3NZc21Ob3p5MXJBWEI2RWFESUVuNVhZUDh3N2Q0KzdVQVllVHJP?=
 =?utf-8?B?NlpBL2RiYXhmMUdNSzJyVWJJS2pCK1FwSWRsbzVFcDVXbnF3Y25oUnpiTVB0?=
 =?utf-8?B?SklhTEMra20wWS81bkU0Y05ySjBHMEtwYzVoeFpta2JXeERub1ZWWnZwL1FR?=
 =?utf-8?B?ajZ6amJIQmhwUHU2RHBuc3Ixb0lpbUtCM3hhQ1JTNklXYjBDV0M3dlFRMlJR?=
 =?utf-8?B?N0FVMVVVTnVrRklaTmh5cG5LVUdGd3NlSi9PS1l6V29pY0FGNDF0SXZwZXg3?=
 =?utf-8?B?aEJEN2UrVXY4SDd3WlpxOWpIcDdHNXlQZU1EWXArbHRNTnZKbmRhS05qRkNq?=
 =?utf-8?B?Ty9wUHpKTmpOSVBTcGJpZFlERXQ1VWlXL1llQTNNaU1KRUFlVVlQZnUxdjl1?=
 =?utf-8?B?L2UybEVqUHRtME5DLzNoKy90RG1LL0I5SmlZSWxWTi9vdUM5RC9td2VVZkEx?=
 =?utf-8?B?VWdGUGtGK3U1SlkyWDVVcVpTOFlWRTg3WUJnR0FHZFcvd0loU0g1bS8vSEhG?=
 =?utf-8?B?bXF5ZzZMcXVib2ppNlAvcXRMZ2JaZDd6NWFubERrcEJvK29SZDQ4UHN5WnBV?=
 =?utf-8?B?UFFBWUpuNlZGVU1lRWhsSTZTWk8ycXVZR2pIdXVXdmF5MElyZ2krN2dyeUhZ?=
 =?utf-8?B?ZnUvVEtYY1FuT0xBbGczWTRVVnR3L3lyN3FiQmFWVGlwWTFJcU5HUFlPQU8w?=
 =?utf-8?B?Z0dSK1RjdnRVLzFydTJIZ3dQa1pSR2pwUWhCaG9KWTBuL3ZMY0lqOEE2NjFl?=
 =?utf-8?B?RkJKOFhCNUcrc2RVbVRBWnVLc0h3NUNTenAxQ1NURWlyRitMaURHNHk2WW1r?=
 =?utf-8?B?amdHR3VCZjdCeUZXa1NUM1IzcmMyTEwvWFMrOEtQOU02SVh5dlptYm55U0Vi?=
 =?utf-8?B?MHFTdDUvZ3JNUkVxeVNKMVJINnZqWHcvMUMxU1NrVzl0SjVDUzd1TEZIV1p5?=
 =?utf-8?B?ODluTXpiK1YrWGFwNWdMRlVLS3BWYzJSMXZNVzhpRE1rWjIrdUpqYndZSlhR?=
 =?utf-8?B?MjVhOUF2Sm5QWUtNZmM3Sk1FVXh1WHZJNi9RMnUrRnNsOE9hYjhHc3VDWjYz?=
 =?utf-8?B?UzRZZlhBbVhTN3laUmE3K2VsZW9FMUwwaEtQV3pyei9WT2lNeWkwbkJPdG50?=
 =?utf-8?B?UlRKVW5XWDFBUitQMGJWbTVyeVlycUxPZXJHbkVqanl3dXZJcFFNektuVzdL?=
 =?utf-8?B?ME9nYTFFTHhzYWEvbHdyOGFWSkhIajlRNDFycDdsbWt6bmJxQzN4MVZ0Qktv?=
 =?utf-8?B?aC94aHNHK0RzSmFIcWZZZ1VCNXduNVFFeEZyZDAxRTM4YTB4cjZRWkpvdWU1?=
 =?utf-8?B?alFVVmRFTnFucmtmNkVUNFliN2RLVEp4OTAyUUFFMTBtK0doSGczUU5Ydml6?=
 =?utf-8?B?dlo1aE1TV3JHbkJ1MWFIeDJKWjFoR09EUHRvL3FpQ3l1Vkw5Mm5TR0FnSHAr?=
 =?utf-8?B?OHpiMy9mN1lEUVgvRjd5Nk9HNDRaNTh4bmZDSkNmWlYrOHhNL1lLc2QxOGxz?=
 =?utf-8?B?SFlCYlJxc0U5RHRobHFJSUU3VXZUR3VsWkpLNzIxMFV5aFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uzl2b0tML29iUml1NEJhTndKR3RLa2MrMFY4UlF2THlqSmVQMkpNRFQrMjl3?=
 =?utf-8?B?cHFHc1ViTmRIWkQ3THhhWlJLKzhaNFhlaFRIdU50dU0zQm5rNGRLWi93amIw?=
 =?utf-8?B?dUZmRGwxcEMraS81Uk0rSEVjU0J0MnZKZ1llc0trSzZtRGhkaUhxMEhoSDQw?=
 =?utf-8?B?TlY1alNodm80RHI2c05Fc3BrREdsVzJwMVA4MXhJekZrWlRJSTBXSlNIa2oy?=
 =?utf-8?B?eVliM2J5OXFvR1BvMW5lTklRREtOOHU1R1JFTTczVWxlMDM3WFJhRGJ5OGo3?=
 =?utf-8?B?SzY2d2pjb01MWmIrZDZOaC9Ydnc2VGRQbWNtaEpLc21sYU9oUGQ2Qkx1alhm?=
 =?utf-8?B?WUd4YXdHMTBEMStXWWZ2aWx1U0swd1lJemZaN09salhqSFVqanJ1SHhJNGtz?=
 =?utf-8?B?cy9JNmVCUU1kd0x6WWFlVWdFNHhUaW5pNThNVDcwUWFyMm9tUVZWZk5mRE9G?=
 =?utf-8?B?aWJaeGJrNU4vK3QwQmQ2Q2lxcElnM2cxU1lnSnpMTVZ0U3dMbjN6OWVBSEdI?=
 =?utf-8?B?bUdwWndZZ2I4UDYvVS9iUUhDVGk3bWl4UTRUZUw2RnV2cjR2dFdMYVl0RWNL?=
 =?utf-8?B?WnlDdFJucng5YVdQL0xFZWhKL3pYaUJKbE9jR3JMbUZHZ1plNy9waDJhWld6?=
 =?utf-8?B?ZEEwNE4vOXZJcUJnUlo4eHFXSFNnSFNJbHNOeERsRlN4NmJxeGVzQjBUT3I2?=
 =?utf-8?B?WHI1dUFjZXFGYkxsOE5wZHpHaVJoNGtjZWlJSEIyQWFTdkZxWWtReEpqdi9x?=
 =?utf-8?B?QTV5eFlBYTZPcDVvL3BrT055c0lBMWx1Y3AyVEpyYnhqWmU0U3AvV1ZJN00v?=
 =?utf-8?B?b3UyVTFFaHpjQ3hlY1Z2TjltT0w5cTMvZXc0OVJzTFRFY1lRaWozYzhpb09X?=
 =?utf-8?B?NWpCQWVJMU5nRlpLdGxPQ3hZYU1xL2tWUThBNXQ1T2luUlc3SzFmOWNibkhh?=
 =?utf-8?B?SWw5UVBwVENzbFIvMkdkaE1ZTkpwOFVCU0pKQWMzN1l6K2kySU1ESXp2RU1D?=
 =?utf-8?B?OENUTzNiaWhxYVlQdFFRUXhoMzg2eGplU250SUI3S1pwcTFuMTE3UDhVVUp1?=
 =?utf-8?B?WmRaZ3NkaS9GdFVLSFgwYmQ2VWZOSW45V0NTa1AwQW16TmhZSExOVWpFL2Vr?=
 =?utf-8?B?T09XM2t5M1RRVTBaQUNjNWNSQzBpQkJhVTY4NGc2VFJIU09LUmI5azdvNTNh?=
 =?utf-8?B?VDVPUlVuS2tpSFhOMWR3Mm5mb3lUK0tNRmdZNW84Wnd1Qk9OWXRjc0pKNlo1?=
 =?utf-8?B?Si84VmIzS3NEZG5hcmk4eDF1V3RIVmRycVkwSVhlTUlxUzM4K3Fpekt6M1lZ?=
 =?utf-8?B?OGk5U0NZcThlcUxHZVJ6djh6YkJNUjhGb011Q0JramxMY21kWmN2RnVKM0ph?=
 =?utf-8?B?dkhIVTVwMlJqNC9hOEY4QnRJWVJzaVZwbWd6dUtKZWpoaDB6ekh0bFQ4MlJk?=
 =?utf-8?B?YkRic1M1RGVoYk1GRTlmY0EvcVlENGQzSG9SVWhHMEpzbHlPcHZCdEFsQkhh?=
 =?utf-8?B?NEZqcEU4QXdlUi9zRENmcFZiV3pQeTd2ZVI2aTF3Wjl0Y3JoR1RMcU93OVJp?=
 =?utf-8?B?UHMrU2JOb1pDc043bjBoSzF1Y0kxUnZtcnQ5UElDNXJScXpRYVJoemdxeWxB?=
 =?utf-8?B?akZvTEFjTkdzcHYrUmg3c0RDR2pmMVFxSHFETiswUmNxT0wxaTR5eHVXcVRJ?=
 =?utf-8?B?ZUFTeHRMaDVDU1pDWmlEVUVOT0dURlg4OUQzUUxvdzhza1Q3R0xwVTZHb29o?=
 =?utf-8?B?dUNBdHZsTVBHMjY0Q0FHc1I4MUdrcmNzbGtzZ0dKL3ZIQmdGeUxQaXpXTml6?=
 =?utf-8?B?NzNMRGxxdjZrUXM4M05vSm5zcHBzN2x2OENQSWtzZVNJa0ZHRHlPSHF3eG1C?=
 =?utf-8?B?MlpocXNKc1pIMXFSVFMrNG5DTXk4UDN6UVZmSVNkR254dE9scUxLQ1VkWFN0?=
 =?utf-8?B?Wk84cGZqTURMU0dWUGZZL3hXMW4rU016UnJUbHpiUUFCdXRYY2FWR3NVQ0Rz?=
 =?utf-8?B?Z2lHNk44S3E0ck5Vc3BaUzk5dytvb1NITml6ZlNJWVJsUDlvRXpTS2IwRWJN?=
 =?utf-8?B?QUdudFdRTUJlcGxvS1ExQldCNmRwdk5ha0I3VjR5ZzBWUGhHME4vclpicjJH?=
 =?utf-8?B?Mk5RaUxlRE5UcVJ3RHBQamhaYVFYZ1JORnRhQzA2ek9vS1JYYUIwN3JMbGN0?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad26df67-a8af-4cfe-a8df-08ddcfa341db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 19:57:04.9952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2oJMc7Xrr3MB88j0ypF97wGs4HesD/LgyC/bsr88HH4+/F9YOKQG2QBtu+4ehUJyBRlwyn8gtzxUHUr4nLBrMcWl2cJOmSaGOkqvv4MvEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7043
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



On 7/30/2025 8:28 PM, Rodrigo Vivi wrote:
> On Wed, Jul 30, 2025 at 10:12:06AM -0700, John Harrison wrote:
>> On 7/30/2025 9:30 AM, Rodrigo Vivi wrote:
>>> On Wed, Jul 30, 2025 at 10:23:22AM +0200, Michal Wajdeczko wrote:
>>>> On 7/30/2025 12:20 AM, John Harrison wrote:
>>>>> On 7/29/2025 2:40 PM, Rodrigo Vivi wrote:
>>>>>> On Tue, Jul 29, 2025 at 01:42:14PM +0200, Michal Wajdeczko wrote:
>>>>>>> Since we already lookup for the real PCI device before we allow
>>>>>>> to create its directory config, we might also check if the found
>>>>>>> device matches our driver PCI ID list. This will prevent creation
>>>>>>> of the directory configs for the unsupported devices.
>>>>>>>
>>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>> ---
>>>>>>> v2: rebased
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++++++
>>>>>>>    1 file changed, 17 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>>>>>>> index 5f145ccdf535..766775772eef 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>>>>>> @@ -275,11 +275,22 @@ static const struct config_item_type xe_config_device_type = {
>>>>>>>        .ct_owner    = THIS_MODULE,
>>>>>>>    };
>>>>>>>    +static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>>>>>>> +{
>>>>>>> +    struct device_driver *driver = driver_find("xe", &pci_bus_type);
>>>>>>> +    struct pci_driver *drv = to_pci_driver(driver);
>>>>>>> +    const struct pci_device_id *ids = drv ? drv->id_table : NULL;
>>>>>>> +    const struct pci_device_id *found = pci_match_id(ids, pdev);
>>>>>>> +
>>>>>>> +    return found ? (const void *)found->driver_data : NULL;
>>>>>>> +}
>>>>>>> +
>>>>>>>    static struct config_group *xe_config_make_device_group(struct config_group *group,
>>>>>>>                                const char *name)
>>>>>>>    {
>>>>>>>        unsigned int domain, bus, slot, function;
>>>>>>>        struct xe_config_group_device *dev;
>>>>>>> +    const struct xe_device_desc *match;
>>>>>>>        struct pci_dev *pdev;
>>>>>>>        char canonical[16];
>>>>>>>        int ret;
>>>>>>> @@ -297,8 +308,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>>>>>>        pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>>>>>>>        if (!pdev)
>>>>>>>            return ERR_PTR(-ENODEV);
>>>>>>> +
>>>>>>> +    match = xe_match_desc(pdev);
>>>>>>> +
>>>>>>>        pci_dev_put(pdev);
>>>>>>>    +    if (!match)
>>>>>>> +        return ERR_PTR(-ECANCELED);
>>>>>> why ECANCELED instead of ENODEV?
>>>>> Or EINVAL? This is for when a user has created a directory for a PCI device that exists but it is not a Xe device? Seems like ENODEV is not the correct option given that the device does exist. But ECANCELED also seems odd.
>>>> we can always return -EINVAL but user will have no clue what went wrong
>>>>
>>>> so the idea was:
>>>>
>>>> -EINVAL     when config directory name is malformed
>>>> -ENODEV     config directory name is correct but
>>>>              there is no such device under such BDF
>>>> -ECANCELED  when device exists but it is not covered by Xe driver
>>>>
>>>> since you both don't like -ECANCELED for this case, what about:
>>>>
>>>> -ECONNREFUSED /* Connection refused */
>>>> -EOPNOTSUPP   /* Operation not supported on transport endpoint */
>>>> -ENXIO        /* No such device or address */
>>> What about -ENODEV, but with debug messages to differentiate the cases?
>>>
>>> Otherwise -ENXIO seems the best of the alternatives here.
>> I'm confused by what is wrong with EINVAL. Are there many other paths that
>> can return EINVAL for this operation? If not then how is any other return
>> code any different from a user confusion point of view? But yes, I think at
>> least a debug message to say "requested device is not supported by this
>> driver" would be good.
> 
> to me it looks more like a 'no device' than 'invalid device', hence my
> thought on the enodev, but no strong/hard preference to be honest.
> and we are definitely on the same page that there
> shouldn't be nothing wrong with reusing the error code and printing the
> debug message like 'requested device is not supported by this driver'...

looking at pci/iov.c where some diag messages are given:

	/* is PF driver loaded */
	if (!pdev->driver) {
		pci_info(pdev, "no driver bound to device; cannot configure SR-IOV\n");
		ret = -ENOENT;
		goto exit;
	}

	/* is PF driver loaded w/callback */
	if (!pdev->driver->sriov_configure) {
		pci_info(pdev, "driver does not support SR-IOV configuration via sysfs\n");
		ret = -ENOENT;
		goto exit;
	}

so maybe we should use -ENOENT

$ sudo mkdir /sys/kernel/config/xe/0000:00:07.0
mkdir: cannot create directory ‘/sys/kernel/config/xe/0000:00:07.0’: No such file or directory

and print message using pci_info() like this

pcieport 0000:00:07.0: xe driver does not support configuration of this device


> 
>>
>> John.
>>
>>
>>>>> John.
>>>>>
>>>>>>> +
>>>>>>>        dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>>>>>>        if (!dev)
>>>>>>>            return ERR_PTR(-ENOMEM);
>>>>>>> -- 
>>>>>>> 2.47.1
>>>>>>>
>>

