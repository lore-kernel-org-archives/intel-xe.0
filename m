Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F749CF8856
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77B210E0E0;
	Thu, 20 Nov 2025 13:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejU9DdEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CE510E0E0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763645740; x=1795181740;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PkfwAICrdNdpTZhkJyY8bGcnCKIYxf2NEEquBJfNuvs=;
 b=ejU9DdEvHT5MqVZvTO8Ksoz6Iu11sGeLNqW7ea+uLHX3KsON7smfpXXB
 bTKvNfZ8vpevcL25VqUzplG/ZvPO9P5zFVGiKH45/9Ewh4C48BGIWv4qH
 i3XLf/435uj9KBFnx75cqBODpQJxHBg6E+0rR7mUymz2lLjzAMxIFdCCc
 tK0GX7F+Kv8OXdmr8P6LWVAf8D/YxPjNh6ECXUfqLkHglwDF+2sgu69pa
 ZWpDW/Zg9X+Ud/x7n7fg35IXU/mxbc/0RKEliVf62zvIMt3hceu5Cda7S
 67NTgpJd08fUIx9IWA6JwKXysd5dJD8qR4gGPgCtMrOQ+wnzOjSuZa5F3 Q==;
X-CSE-ConnectionGUID: kYz678fMRvaGHB07lzz8UQ==
X-CSE-MsgGUID: BAOJRIBNQTKyCrcHFAC1kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65800058"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65800058"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:35:39 -0800
X-CSE-ConnectionGUID: XxmYmjNRTzy7nN29MNCOTA==
X-CSE-MsgGUID: OPu6YKfFR028KnNyUkDAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191160739"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:35:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 05:35:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 05:35:38 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 05:35:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6XLhZRoGcBFhl+ACO9kHRySbF7rlfDDJOaADaUlKw4kHo4glYquAFmOyWwb5YUwP9h6YLvlJvV9tzYf0NS7ddBYnB+4D82GP/by8UvKWMXrfnk5rGu7JKK0A+sI2tI68QKXcrXBq7b8KNmT5cUHzV5GbztNGL2inw/1BVh+SZZwnIRjbmih1TFcxtzafdqaiIj63jigj11fNFOhgoKdVZI6XBGgsPLwpM227oKCfxqD0r7Nyvq5eeSfaWNhmSFfyOU87qUS4TPYhMyZe1Amy14Yt3/sK2aFKW7VzOE/v01kdYGG4ja20oRFaUi4DBy9dKI4ebgO429qyOEAERi8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5FykHQedPNzUm0dO2+agxNRrIFGBc4m5E7RDUtgloA=;
 b=Xe1Zli8d6F2SYfNIIAhZL75JhZODHVXw05ixdu5RINFLA7LqeoVy0bzPkGj40hxxJZbNZ3oEScPGb3r2sNCN9qDeHB4Ez6bMEXdLuUt8N7ZOp2F7pwWF/OUqGOtVS62qtR7GXyuPJRob0vXZUkqzV685lIdRjEwK+JpYGrO++YVRbZeXvHDck3w0JWRqbU/kHYJ8hl7hlmVjWDugETxeXm/1Lo99afkU62xZmT1F9v9kpbDDAs5nAZor1TvV9DAecPF5hvJ0fpZX+sRGAbqvJgUkORsOElkjYAryDDtaK+gSfh6Dabc9rnJm8sQy7ppyjET7D1pWhVYT+x2hp/Jimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH3PPF5A672BE95.namprd11.prod.outlook.com (2603:10b6:518:1::d22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:35:35 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 13:35:35 +0000
Message-ID: <2c971cc6-0d73-4690-bacc-d878f962dd2c@intel.com>
Date: Thu, 20 Nov 2025 19:05:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe/vf: Add debugfs entries to test VF double
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
 <20251118114116.3429730-4-satyanarayana.k.v.p@intel.com>
 <4f54ae0e-acfe-42ed-9ddf-2ac42e08ac8c@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <4f54ae0e-acfe-42ed-9ddf-2ac42e08ac8c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0099.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::10) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH3PPF5A672BE95:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f445017-6607-4af3-2a71-08de2839af03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejVOWDVYWUw2YWRORUtEZHY4cTdXOURsS21yTFFKRTV0ZEVVR2FneGdhTlho?=
 =?utf-8?B?TnE4cUZUdWJ5VU1KbVB1d0FxM09yRmpMWGxNeVVXbVJHRHRFUDN4Wkx1VkUz?=
 =?utf-8?B?MzJPN1pKaFJSSUxtMVdFOS92VllmMXlDRE1rWTZ5RHB4WTNBOU9reGp3RFd0?=
 =?utf-8?B?bGRVanpqV1dBVE9SdXgxOFdJdXlSamVTd0RMNmdaVHExdzZlQ0cvQ1ZVNjZR?=
 =?utf-8?B?bzhjb3hWbENveXhZbnhmWjF5UThLMTBheVhGRHh1c1pEb0ZaYWN0a2JyTnNx?=
 =?utf-8?B?clYyMWh4V2xORzBUYytjTEJwOW40eUsyS3pJWlBBWHlPT3gzQ25DU0VBc1RX?=
 =?utf-8?B?ZU10MzJXV2FzVloyTC9MZEhaR3VJdUtzVEVtOUhEK3hMSCtBaWJDUEM4eXYy?=
 =?utf-8?B?TWxOSzAydDZ1K2JJSU94Nk5YbDlGWUZJclJiMHZoVTZrSFFJY1BYZTRrRUpJ?=
 =?utf-8?B?THc5b1hqM0gwL1pLemJya3ROcCtQMUxraDZ4bWYvbURCVHBFTExmZVduWU56?=
 =?utf-8?B?RlAxSXFuRHFZUXQya1RjenVwTDVyUk85R0VQSUdGZk9GUng1MkVxM1JSMHp0?=
 =?utf-8?B?QjF4d0RFSUhZZUpDSC9iNXYwaFYyUGhHanMvK3Y1SURxTG9COGtvby9nYWk2?=
 =?utf-8?B?aDIwVVJFQzdmUXRWT2w4WWpkT2l0K2NNaUQ2N3V0TXowSENtY0J0WnAxc3hj?=
 =?utf-8?B?KzVBNFZLUnd2WWV5Umxja0ppOEZocDhhQWVETW12OEVPczYxb2I4TEd0ME1T?=
 =?utf-8?B?NWFocFlMNlhMeVhGazFvZ2ZtRmJUdmUxL0tvQ2NaMUNHT2QrQ0dteFc1UmFQ?=
 =?utf-8?B?dlh4RVQ4T2VTMGtGQitoN21DSDY5enh5Q1NaWTMyME0yQ2V3YUVvbmp4eXEz?=
 =?utf-8?B?T3pIYVl1YzQwSmJoU1N3TlczVlUxM09yc2s5YXpBc2NQNHBFbndhZ0lkVnRz?=
 =?utf-8?B?TlQ0Z256cTU5by9ieXBJaE9yam4yWkJMUFBkZHNhcWNWdjROMHI1b0pGVGFs?=
 =?utf-8?B?UnhMUjBrdk5XU1JPMEVKa1R6OHNDa1hqNG9KbU91ZGNzMlVOQjZtWHlBU2ZC?=
 =?utf-8?B?OG5NaDh4UW5xSFBSdkdpTVcweWRQT0VVVmZrVXVWKzY2akp3MjFEQUxUK2Vp?=
 =?utf-8?B?TlArNllBTGlwWXdQKzMrVTlqTzRTYWhaU042b1Q0YUxDcDYyT3B4dVNoWDRB?=
 =?utf-8?B?cDIzNlEzZlJVSE4rUW16dThNNXk1ZEZqTXc0eGFmdEhRNFphdFd5VkFKWXRC?=
 =?utf-8?B?V1h5WUVOTkRWbTcrbmxWUXduczVwaklvSk9TY0kyT2NFUjByT0JoaGJGNCtv?=
 =?utf-8?B?dUU0NC8vcGF6c2VucmQ2RUxWQXBHK3R4eFIwQ001TW9wVDZqaGRlL2lzb2R1?=
 =?utf-8?B?T0xUMDNQZnAxenc3bzMzemVVbVBOMHVZYWVCQk1RZWs3b3duVmtlak9ETXg3?=
 =?utf-8?B?TlFyYW5OU0wrUnlrMjRLNGRRRlRWck5XamtXdmRKTzk3N3JmNVI4NXl5cXJO?=
 =?utf-8?B?K0pLdFUrL1FaYjVOTnhqeitiajBEUW8wUnBaY0duUVNLYWFBcUhDdElhVGlU?=
 =?utf-8?B?RTV4MDhubEdHTTdrNWkxVTRsRjdNZit6Tkt2MVJYMlp6TzNOdlFTLzd0S096?=
 =?utf-8?B?Y0NhVHdDUGphRitkYThEdjkxYXYvUVRDTVpBdzQxcUlKazgvMXZEZ1BxMDJJ?=
 =?utf-8?B?alFERnY0dTRoT0dJaWpPWDRQek1SQjEweUcxaWljNHgyRkNyc0p1ZnpEWDd0?=
 =?utf-8?B?UzFYZHUya0VZN3YwRzFWbWwrNFF6V2U1b0JCTXRiTkwrQnYxVmxnYmdLZjNi?=
 =?utf-8?B?Nk84YUxCdEFkWnM1UlZPb2RMRy9qbGVUYklwNy9YbFdTSzkraDBDWE55WTl1?=
 =?utf-8?B?cGl5cHFYNkhGMld4OEZ1cTRwWHdVRW12UlpHVjJZUENkMXRSbGNhYndXOHc2?=
 =?utf-8?Q?4waL4fjFbuQI9S4LpNAY8OeHnFaCH5Mk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3FZV3RmYjhKeUhwQVc0UVBXeGtxMjBCTFI2dnRUZWNKTmZmSEN0QjFNS09r?=
 =?utf-8?B?V2dMVER5aVlYT2tORWoyMVNRa2VNUWhldmFTT2Rzd01qS3VvVlkwaUZ1bW5O?=
 =?utf-8?B?Qm13YXVXLzZjdlhJSzF2UjA1eEhsR2YvbWFncDNlazZTN0RWc2VPQ1Y5eUpW?=
 =?utf-8?B?UFVmMEt3QUJ2aW1ZdmcweDZadWZxL0crSHRxMTFxY09LbG5mSmdQYmltN0sw?=
 =?utf-8?B?V0ZiQ0VJVkdjZWoxaU9WaHVmdnE4L01UU2JBcXJGckRHaVZNSEVvZ2cyRDkr?=
 =?utf-8?B?M0k0WWdBUk1ZQzdJTU56NmRrd1RMNHRYd3FsamVnRTRVLzc0VnFTalNpQklD?=
 =?utf-8?B?UTgxb2d2R2xscWRuWTZQQ0FIQ0JBUWJzQ2YvcUJRTHhtdlN6LzR1NlFFMXZt?=
 =?utf-8?B?Mko1K3c5TjR1WU1Qc0FnWGdaS1IzS3JTelhqOTJMcHZ3eGtXYTVVbGJjeUxZ?=
 =?utf-8?B?Wmx1ejNuYlRJK0YzdlZTYlROMzBVbFBqVTU3d08zQzV1akw1Mm0zWVVWZkJW?=
 =?utf-8?B?eUtkTk9KdFdYL2dLdWF1eG5zYzMyVkhFd3ZoZ2hzZVFmT0dGMjhZYm1OdUo4?=
 =?utf-8?B?ZHBVdGRpamJ6WUdxUUc3MVFhaDZVaGJmM0hWVDhvck9pV0RYZFFaVE5tUmJV?=
 =?utf-8?B?QklCQ3d5OVdiM2RDQXNwbWpHd25HcUxvQUlhUE1iN3Q5N0JUdnlNKzBKTzZs?=
 =?utf-8?B?TXQrenBpZmUvR1h6OE5oa1VCZ1hIQ0xqNU5YU2pNYTJQZ2NhYmlGUWJRLzZI?=
 =?utf-8?B?YzNUMFNybFlQMC9Fb1JvTVpUaVgxamZvQzE0S0xlYUpScCtlMWdCNHUrR1VS?=
 =?utf-8?B?QjBVd3BqRzhiY05iK0pNTk1QQXUybWpqSVcxd3I0TFBlOEhZVlU2LzVyUjhh?=
 =?utf-8?B?dTJtRHU2UVZMbGZYWE8ydW9tZ1dGZ0xad2VuV1ZyM3Z1eDJiNnU0Nm5lRlJM?=
 =?utf-8?B?bE15ZmlxUXFrZmwwcVlCUjhGU1BvL1hFVFJsYWdyWlQ1VTNOVWkzanlmQTJV?=
 =?utf-8?B?UUFXYTZXUDhxL1g5ZDROV2tXZkNPVHR3RnhnbTdEZWxmRnc5YS9aZHlMTmhV?=
 =?utf-8?B?WFVoNERnN2p2bCtTU1NjNEJPZ1pxdmpFM0xVSy9aTEEyQS9iWSt2WXJwY0U2?=
 =?utf-8?B?dEpNTHJlZmVuSlU4WHJ1VVhBeXNvMTdIU1VjN3R0Ti9NbkJRdU5VTDFyYTFu?=
 =?utf-8?B?YzZHSWpvbTd6eEpzOTdmb2FDdFdHVGI4SnY2eUxJR0dFd1NEdWRyb2FyY3FY?=
 =?utf-8?B?dmwrZzRnRjA3d2plbjhYZHR0cysvc01aa2w0a0J3NnhhaWQ4V21yVzdrK2l6?=
 =?utf-8?B?NUdWRVJRWU5tL3o4bGtNQ3FGOHM3RTh6ZFUrL1VUWEJGTnVEMy9YQ0NHanJv?=
 =?utf-8?B?V2RKSmJVY1hqVlBYZitjTGRTd2c0UTY2VFBOUFdqcWFNNFN6d0JwdVJIZHNM?=
 =?utf-8?B?bWEyQ0xDZkxKZnhGU05oYTVVT1k5NnhlMEZVK1ZFSThTcUxzQytjSlBGN3Yr?=
 =?utf-8?B?UUpLN3ZnWkxEQmloWjNERGpyUDVNeGNoWWpvWW1JNVpTNFp4TjVZam1hWXY3?=
 =?utf-8?B?RzltR2YwL20waERuZndpdjNuV29CdDdxeFYzQ0hLU1dhRUlFNUNJcVNTRGU5?=
 =?utf-8?B?K05kZWQ0THdScXI2Y0RmbWR0R29udi9QM3ArSCtzYWJvZy90a3hhdHJaNEw4?=
 =?utf-8?B?OUFlMEE0TkcxMmxvYTZvem5EeDN0eW1uRmgvZ0R6dTRtQWNjZDhUZ2llcGEw?=
 =?utf-8?B?L3BaTlhJR2xqOGNRZUMremlBQXo0aGludWpaVlNkemJiNC90ZjFDZDBvNjdz?=
 =?utf-8?B?NUdXaE4yWUtRRlBjWDc5OXk4aGZQM2FWcjJvcVVLS3IrelFzQXRSODVYRTBB?=
 =?utf-8?B?aU1FbVVBK2hOOXlkT3hJTTNsdjdmUFNoR2hRK1pka2JRRUVodTZvdEpSTmFq?=
 =?utf-8?B?V09NNHVYQytvUUM3eXhnaktJbTJGSkVkWGRxNk9WZmVmNW1xQlEvTU1TVFBI?=
 =?utf-8?B?YXIzaWtCZE55TTZ2SFNNRGM2U1JmdmZvWk9xb0tBaGRFenpib2NBMjd3VnNU?=
 =?utf-8?B?QkdaajBvWXZqKzZDQStHRjVGdDJtY21xNWtTUkREOGp5bWlKaUozNEh0NStm?=
 =?utf-8?B?bmU2Zk1sYVBzL0NJOGpDKytiTll4OFcyb0R1ME90NjdZRkdlUVFScmpoY3FO?=
 =?utf-8?Q?ZGt7bpqcpa5GyCMd2G34+NQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f445017-6607-4af3-2a71-08de2839af03
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:35:35.0939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1g5oFek5MYaVHKXrn7BY5NlOkb4lYsG7lJG1tD7QMQZdrAHx3omT6xYdjmMoqCpBJijYdvwZPXMAmTunlq5YsedHuzcpGXy951RWOomBlqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5A672BE95
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


On 19-Nov-25 11:21 PM, Michal Wajdeczko wrote:
>
> On 11/18/2025 12:41 PM, Satyanarayana K V P wrote:
>> VF migration sends a marker to the GUC before resource fixups begin,
>> and repeats the marker with the RESFIX_DONE notification. This prevents
>> the GUC from submitting jobs during double migration events.
>>
>> To reliably test double migration, a second migration must be triggered
>> while fixups from the first migration are still in progress. Since fixups
>> complete quickly, reproducing this scenario is difficult. Introduce
>> debugfs controls to add delays in the post-fixup phase, creating a
>> deterministic window for subsequent migrations.
> how will we know which delay value gives "deterministic" result?
>
> on some setups, delay like 10s could be too small, and maybe for
> others will be just a waste of time?
>
> maybe instead of looking for some best finite delay, we should just
> introduce some other mechanism that would block next 'recovery' step
> by explicit action from the test?
>
> maybe this debugfs entry should be like:
>
> 	resfix_stoppers: ulong
> 		0 = no stops/no waits/no delays
> 		BIT(0) = stop before sending RESFIX START
> 		BIT(1) = stop before querying
> 		BIT(2) = stop before restarting
> 		BIT(3) = stop before sending RESFIX DONE
>
> then the test can setup stop points before starting migration
>
> and then driver will enter a loop until given stop bit is cleared
> by the test?

Updated debugfs entries as suggested in the new revision.

Instead of waiting indefinitely when the bit is set, max wait time of 10 
seconds is used.

After 10 seconds, it proceeds to the next stage.

-Satya.

>> New debugfs entries:
>> 	/sys/kernel/debug/dri/<card>/
>> 	├── gt0
>> 	│   ├── vf
>> 	│   │   ├── resfix_delay_ms
>>
>> - resfix_delay_ms: delay after sending RESFIX_START marker
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>>
>> ---
>> V3 -> V4:
>> - New commit
>>
>> V2 -> V3:
>> - None.
>>
>> V1 -> V2:
>> - None.
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 13 +++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c |  5 +++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  8 ++++++++
>>   3 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 08c00b773a13..13ae71dca208 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include <linux/bitfield.h>
>>   #include <linux/bsearch.h>
>> +#include <linux/delay.h>
>>   
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_print.h>
>> @@ -1234,6 +1235,16 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>>   	return vf_notify_resfix_done(gt, marker);
>>   }
>>   
>> +static inline void vf_post_migration_inject_delay(struct xe_gt *gt)
>> +{
>> +	ulong delay_ms = gt->sriov.vf.migration.debug.resfix_delay_ms;
>> +
>> +	if (delay_ms) {
>> +		xe_gt_dbg(gt, "*TESTING* injecting %lu ms delay ...\n", delay_ms);
>> +		msleep(delay_ms);
>> +	}
>> +}
>> +
>>   static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
>>   {
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> @@ -1275,6 +1286,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>>   	if (err)
>>   		goto fail;
>>   
>> +	vf_post_migration_inject_delay(gt);
> shouldn't we wait right after sending RESFIX_START,
> ie. before calling vf_post_migration_fixups() ?
>
> or have few wait/stop points to allow testing more scenarios?
>
>> +
>>   	vf_post_migration_rearm(gt);
>>   
>>   	err = vf_post_migration_notify_resfix_done(gt, marker);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
>> index 2ed5b6780d30..33d6f37d8dd6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c
>> @@ -69,4 +69,9 @@ void xe_gt_sriov_vf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>>   	vfdentry->d_inode->i_private = gt;
>>   
>>   	drm_debugfs_create_files(vf_info, ARRAY_SIZE(vf_info), vfdentry, minor);
>> +
>> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>> +		debugfs_create_ulong("resfix_delay_ms", 0600, vfdentry,
>> +				     &gt->sriov.vf.migration.debug.resfix_delay_ms);
>> +	}
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index 66c0062a42c6..e7244e9fd406 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -52,6 +52,14 @@ struct xe_gt_sriov_vf_migration {
>>   	wait_queue_head_t wq;
>>   	/** @scratch: Scratch memory for VF recovery */
>>   	void *scratch;
>> +	/** @debug: Debug hooks for delaying migration */
>> +	struct {
>> +		/**
>> +		 * @debug.resfix_delay_ms: Delay in msec after RESFIX_START
>> +		 * marker is sent to GUC.
>> +		 */
>> +		ulong resfix_delay_ms;
>> +	} debug;
>>   	/**
>>   	 * @resfix_marker: Marker sent on start and on end of post-migration
>>   	 * steps.
