Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD5CCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 06:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4910E1A4;
	Tue, 14 Oct 2025 06:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4/yZsfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB2410E1A4
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 06:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760422948; x=1791958948;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p+gwkFXkxFvqlsyAh8WU6Ky75ZU/Owpaspt9uu7wfz8=;
 b=j4/yZsfTIRwbSU2bXuiwrTLUCyx5m3ba8TeerlyhFDaOEnh5jB/cqqev
 gTkDWty5do+D+HNL3+onT5N2QpIIembB3k+slA18LPBlzWwTyVMqvB16p
 6dRy6cKcHR2+E83PfDPD9GJ2QY+Q/zgzrU64KbTyM2lkek0z8IlFoWUKo
 mA47yKZ2mIHeWSbU2ewA44C+o+CwPV06fmF3TvDubMq++Amuj8Y+rbf9f
 UF2jXBeW4PynHIrddHb/3ar9fmRrquMl6fYLk8/lal+rETBJeEj1PMY7B
 8/dPhAfdi5kBCgOlm4oyVJ+641A/EnE4dVWRgjghwDPxrz25eEV18boJE w==;
X-CSE-ConnectionGUID: gExsyJ5SSpG92TmAs1TAqg==
X-CSE-MsgGUID: mmAhmf0JR8yMwBdONojlHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62505758"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62505758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:22:27 -0700
X-CSE-ConnectionGUID: wU9F1/YnRDqK2IJWZNHcSQ==
X-CSE-MsgGUID: +VXjq9TWScySA6e8QSWlXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="212767320"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:22:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:22:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 23:22:24 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpSx2jTkEU+40DrmnWRgvksMg5haM0WKU1sZoGlM7vntczKVL6lR/8KrdRszQYjKR+UrJaGdObqnslrhNA+/D4X77I2lMSVzxpfnD65bMJ4AUC+/8V6JCQ0uoXmB4eG8Of4Gm43HPFUvuE5fdWCsMc465d4Y02ksuga4MWScdgmZyEYR1WZVEQpYMmfa2SSV6smZAiC6VOrSrOAy7Ip51xq91H/wsSe/sm5ZlvUqvJpfQrxeu2M8xdEticyrYEp0nhjEZt5KbeXMKfS+i/YordEsi1iZnOhQ561UKv5ooBQML3hb/QumWECAuzu0lgExy6OxYzwBkCOZ1VyXWOStyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml5ojlcRqOA2m0QA7lBph+t4bKVqtOlY6Q0g0jSPDbY=;
 b=bRaTqG2rtc2/B2VtxUCHwXszH9pCZYLNPxIsuEqy+ewNX2YMaotb9EI3wosKUmHD3481U3l1gsAQgZJAh11Sx+8DQ+/g0yEzvRGyYNL64418EkabszWlhEMtp6RYhAIRNHDxEFZuqPNewSd3Qok6ZnSzLe62+Xd9vlq5fd3FyLMTGY98JMEYLBfmkwTzRilgvasa5ETVcEMzwf1pQCQbl2YhhZfHATdWF5qzfTEVoDEYpGPnSWeFt3gU81RaI3AvfYKhn38rq1yPaigSFmuvKky5gLs6+7eST2WiT15YzXcqy4paJvN+BmTxJSFcvjxE9oiOhsg/sspQW+wOCGw85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 06:22:17 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 06:22:17 +0000
Message-ID: <7597fcde-f4d5-4de0-bfcc-44005bdef501@intel.com>
Date: Tue, 14 Oct 2025 11:52:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/23] drm/xe/xe3p_lpm: Add support for media IP versions
 35.00 & 35.03
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-2-bfb74f038215@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251013-xe3p-v1-2-bfb74f038215@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA1PR11MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 75dd639e-6dcd-437c-a9fc-08de0aea05e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWgra3ZLMUp4YmRnV2lpdVFjY1o3ME5GNG1lVmlBU0JDWUk2M1VZQmNsSFZn?=
 =?utf-8?B?QVVNTjhtVUw3cDJQSVJMTzBtU3p3Vnh4cnlDTmRJV1BpVWFSSDhCZkJHQ0h6?=
 =?utf-8?B?S2RRQXB3TjdwT2MrMXNwYm40N1l0Y0lzRmtoK3Y3S3NNRlZ1TGtUcUdOQXpX?=
 =?utf-8?B?K0R4WUtra2NLYjFib0hXbjVwVG9QWlhOVS9KWW1TUnFtQ1IrcWY3RTVYWUhj?=
 =?utf-8?B?ZmxJRlR0WUJWSXFNNmxkUzdVbEcwUFNhaWlFWk5YaFpKQXBobm9Nd0Y1MlFa?=
 =?utf-8?B?Lyt2UTdjbFV3d1JFbWY3YlJkK0ovbjI3R1hjRml1eDZneEFVWjhJQ210eC9o?=
 =?utf-8?B?WWJJck1qMkk0b0lla3h0Z1Ayd3ZaQTkwQk1aWE9OanBxOXQwOGN6RXc3L1FZ?=
 =?utf-8?B?d1h6dUtRUHhaNmtBU2x2VkZMVmRJZENCeThRNE9FOFRubGZySmw4V2RXTUJI?=
 =?utf-8?B?eVJCcVpJVDJ1QThBK2x5QnVlN0NVVURERW9vL0hGTWNSMHorYVF2aTloN094?=
 =?utf-8?B?WHdXSDJlV3QwMGgzYSt5Tko2endtN0QrbzJJa3V0bVlhTEJpVithVTVoL0tI?=
 =?utf-8?B?R2Y1RzZ5VXRvVWs4OTVWbU41OEhnbXVTUWFKdUVXaldmdktRTllZcFFJejVC?=
 =?utf-8?B?UjNncmtoTWRjUlFvWjV6UkZOYWx0TlFPYlprbnpNS2xYNlVWZXRFUXczeXEy?=
 =?utf-8?B?OExtNmJrbGpxVEZjTDZkcHIzOFZYY3NWVW1LT3BjYzQ1OUJCZzY2TWlISFND?=
 =?utf-8?B?a1dEZ3lmeVZZMStTWDlqdzA1NElHT1haWHJNdFh6VDdCRlJtR1ZIWTlEOE1r?=
 =?utf-8?B?NWJzNktDUUFwRXZwd2pMY1FJR1hyMVpMQUliKzZjZ1dQR09QRVNkVmVnMGJo?=
 =?utf-8?B?MkpjQjQrQnlFdU05N3B5SDlQNWZHWnVwU01BQWlXaVU1UEcxOERMV21BbVZm?=
 =?utf-8?B?cjk1ZWNRdzZUbnovbFUydjVmMzFwenQxcWtYbDJ1b1JEOWtjZ1BiRHlvSUwx?=
 =?utf-8?B?enE3MmZuQWxCMlpnRDYzQXYvWDVKeERwSWVKZUhCV2hHZ3BmbXVMMTJBVDRx?=
 =?utf-8?B?dERTUmFRK2FsOGJ6SEgvdXdWMERPTU9iVGJNaWt3VVdIOFJnQVJjK2tyV0xz?=
 =?utf-8?B?aW9iNUE5TUJNck51d3R3M0cyK0RwUlFpRDdKRnU5d0xTL2RaaE9uRC81WUlp?=
 =?utf-8?B?WDc3U0RMcklpaVlHWk9BUnlmemliZndGTC8vUVN6VTZjam1ydmI4WnlRcVpF?=
 =?utf-8?B?TGlHWlNiQ3VDbzdNZGpjd3J6aUgwREZDNSt6RGFCdWZ1aktsZ2EyWFJESXYz?=
 =?utf-8?B?RWlRc0dtaEVpRDlIUkZYYWxMT0VvNlozQnFTaFJhcEUvYXBWV01hYjlabDdt?=
 =?utf-8?B?U2lnWE5JNHpQUFhMUVUyT01KRm9oWEY0WE5hcWQzOWxRM2FZdXhnS2VxQkcx?=
 =?utf-8?B?NjJXT2F5b0hGUmx1cGNONkRYQUkwK1czRkhBYkNTVXAvcnd2U21yQWEyQkxC?=
 =?utf-8?B?T0l0RXVaSVpaanBpblVrNnBjaUpHMkM4aFhUZXFubHdReVBwTjVpcndwcUwx?=
 =?utf-8?B?TjdRK0pCdEsxZWZvd2x1RHRYSTJvb28wUmtpUDFudDdGWUQ1K2xhSjc2aVFX?=
 =?utf-8?B?TGwreGxkQXlTdGx6UkJyQlJoaWRHdmtkUFJBZHQxcmc2cmpWOStmaHZvNk00?=
 =?utf-8?B?S1pZa2FaV0dnbUhUSThYOGowV1NGRER4RWI3RDdxTmhGZ1lwaGFlWlE5R0VD?=
 =?utf-8?B?cVU4WFp0QlJBaVcwbVF2Qm1Pa2J6djRpdVg0TkxxMjRIQVpsVTg3SndpTFAy?=
 =?utf-8?B?UHNBdE5xaEtiOGRiMis1OGV1MUlXRGJwTlV0YnJRaXQyTWIxNkl2OVNqcmYz?=
 =?utf-8?B?NFdRcDU1eUptT2xQRXRHTW9LS2dMOFVhOG9tc3dUQW85WmtTTkljNkovWFhh?=
 =?utf-8?Q?1TKYuSdFmIKE1hp6kNHtopC5LneTp4Gz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djBwSWJpZUJiR0ZhS3dhWGJidlZnaGVkZGg0TVVua3FvK0lwc282T214U1R4?=
 =?utf-8?B?Q2lsbFlJamMrSEI1aUZISkJQeGNCQWdCYW90RlhRSUNzcTJZeURWc0dwWWFl?=
 =?utf-8?B?cDZiWjJhb1g2VjFYemFVZWJnYnRlcndwNGNNdS9TS0dVUkJqZTA0ekRIOXNX?=
 =?utf-8?B?cWs4SFR1VzVQcDYxdlNKU1JsYkIzMnVtSHpkbkJXYmZJbmhpRUo4cWg0cFIw?=
 =?utf-8?B?Z2pYL0xpREJSdzllcG5ZVG5jUXNxMTRFQVpXdyt4TGo1TGNldUJJTHJwZ2tV?=
 =?utf-8?B?OVN0N2JxanJFUDk1L1YreDFtWk1ialRrWDhTOG8wRzlnN01FM1plZUIyS09n?=
 =?utf-8?B?TmlFSml1R2RBN251Szc0Nm9DaFN3MVVlNFNHMXdNUGRBVWxPdE40aU8xVXBH?=
 =?utf-8?B?Sm9DM2VKSzZ4T0xpajlvT2NZU04yTFhkSTkzNU94QVVkc00yUUhhaHVNWGRR?=
 =?utf-8?B?a1lrQ043RmVubTdvK3hLM3hzQ2hlYzd6MU8rRU1aQzJXalVTV1c2d05adksw?=
 =?utf-8?B?N0NweXZOYUluNUFKNUlNVGhuZTZkUHVMYTkzL05Pb2dUQVBVUFhYYmlRQ3dL?=
 =?utf-8?B?Vkd4b3U2TjJLQkVqc05wWkxwdDZBL21qZDdQWHM2NG5CR0ZUT00rMlBBM3kr?=
 =?utf-8?B?VjkwWDdwcDU2U1JReHdXcEpFbmZ1TkxvOVE4akhXeklkZmE3YkF6RXNXbVd4?=
 =?utf-8?B?OTBnZVRmZkxCd0dHOGdVOWN4RmlJMjd5Uzd1a2QwSVVHMm14NVB2cFRTQldx?=
 =?utf-8?B?bXJua3FlYXl1SStrQldPeXVvMDI3V09MZzdxZTBnZVB1M3k4WUFKVHJKZkZG?=
 =?utf-8?B?cWZrL1VQZ1V6bUpmelZmQXN2c1pNNU5wdVBWbTg0U3FzRjkvRDJYOW10Umwr?=
 =?utf-8?B?NzFFR2tqNHJKa1pNb2pUTHJVNmlBRVB1VFF5R1d5anJqMHQ0ZGVmbDg0T1ht?=
 =?utf-8?B?VE94dExuVEM2L29TT055aTU1TXE3RjFQVGswUkFIUHJKMnU2RmxXNFpxbnZv?=
 =?utf-8?B?VjJVeUR3MkpqMXhsWkFLblN2SEdCRndYOHM4SWRRZUFsbDkrbzlYMUVFckZ5?=
 =?utf-8?B?SHBFQ29FWFJ1V0FnMkt2azJac2ZSTWVXVmRlR01nMUxUSkhrSWR2RFVOSkNG?=
 =?utf-8?B?SFZQWUlZS3QvZjIvNEd4ZGFXdHNsL3FKZEF6cHhTbWwrN1J3L1NQV0t5ZEor?=
 =?utf-8?B?Ty9sWW13K0tpdVV0QmVBeWduVnBYT1V4Ri9GamZFTTlkc1lWaXZxY2JKR0k1?=
 =?utf-8?B?Tyt3aWFmcEE3Y1VOcGZjekxxUkhZREgxL3hBTFdaTXJzM0JuR09tSkQydURG?=
 =?utf-8?B?aVRWSG5iTDY5b25jcS9PMlhaVmVSV3dmNGdLUldMTk12cmdJd2I2dlhvWGox?=
 =?utf-8?B?OENrLzZFNnRvM2gyam1jRXV1ZzF6cUJLZzRJeVcxUVZGcS9KQ0NjTTdDQ2tw?=
 =?utf-8?B?M01MVjdDdjR5UFRTUW83MVRjRlpUelJ5WmFRaERseHJCZE15MmhCWkpaOVJK?=
 =?utf-8?B?eGtUN3dvajZCbld3MXFMRTgveTFicUFVMlo0V2dXS0J0Rm5aNytMeE00Z0JE?=
 =?utf-8?B?ZlFldGVoV0lkQURiMTJMZzNXdWxLQlZuWjl4aWQ5dkkyOVcxTmFNTUc4NVlK?=
 =?utf-8?B?S2Nla0RScjlKa3RvYU92VGphR0ZraExCcUdQMGJWT1A4azBXQ2ptdzhEazV0?=
 =?utf-8?B?M09EWU41d2xWejdDdHpKODBQc1FQcnE0aGpMUXVqNkd2MERwRXpnbWw0Tzhs?=
 =?utf-8?B?RUZYanBiTDZwRGlVdTNYdEFQcmRmNWJCbXM1RFVMVFZjcW9xWDRCem9BOHh5?=
 =?utf-8?B?UlBhWXNpZ0w4V1hJTUxZazNmUDU4VTR6eEJhQnJnWWlQQ3lJMS9Vbk9TdDJ6?=
 =?utf-8?B?QzBzNmo2bnBZYnppYkc4R2kvcENiV2pMa2Y5ODlLOTR4RG5rNytBVmdBRWRm?=
 =?utf-8?B?c3IyellYUW0wQThOU1Znb3BqZmVhTk9ZbGEzb250aFJLZ3djWDFwTXl1NXpT?=
 =?utf-8?B?akxPYTEwM2RQeGZRYUwvdnBWcjFJOGo0RW0rRGV4azg2TzJpazlGNGNzb2Va?=
 =?utf-8?B?MS92OXIxdDRvKzJOckZ5eXN6UDVIa3hhUHRxcmFwRnN4ZVU5UWxEVDhZeVJr?=
 =?utf-8?B?YjZLL1Mra25YQ2V6WG9pNFBLQWFBNXNacW1rdFFhN3NmcDF3Mk13VlNocW5s?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dd639e-6dcd-437c-a9fc-08de0aea05e1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 06:22:17.4677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lOAcEXS9FvB/cEy//6eZ+Dc4BPQKjkd6OylJWwc8I8IYH4/nxm6dQLF7cm+EQI1nVnWY9yyp83GmqfRIY1xCSxB43/J4A4ZqKRg/sO/MtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
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


On 10/14/2025 8:54, Lucas De Marchi wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
> Xe3p_LPM is very similar to Xe3_LPM on the kmd interface, so it can use
> the same descriptor structure. Add both 35.00 and 35.03 IP versions.
>
> BSpec: 74201, 74202, 77977
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
LGTM,
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c1e89689953b7..8480e53990031 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -164,6 +164,8 @@ static const struct xe_ip media_ips[] = {
>   	{ 2000, "Xe2_LPM", &media_xelpmp },
>   	{ 3000, "Xe3_LPM", &media_xelpmp },
>   	{ 3002, "Xe3_LPM", &media_xelpmp },
> +	{ 3500, "Xe3p_LPM", &media_xelpmp },
> +	{ 3503, "Xe3p_LPM", &media_xelpmp },
>   };
>   
>   static const struct xe_device_desc tgl_desc = {
>
