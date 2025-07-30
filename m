Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238F2C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 11:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01B810E1CD;
	Wed, 30 Jul 2025 11:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VV1/YRj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5178310E1B2
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753874177; x=1785410177;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hQAKLWwGEvNk3BCTzDhyH6UU+qP9UrC87BcjIU29gWQ=;
 b=VV1/YRj0rujDufXbVb46ETfEqPwEw0hyRTQzMAbZuoNPDdaa5T3H5KYU
 Vt/JzWgLxxkI7/cA/m7CFzJLaqHlWdLykdNSzJFbTVnBdoocQISrrUjqC
 7ItMAMTh0srSP4BWGbHQ/balqZH1h+fzB/EVpv9CRW4LH9927/YjBxf1H
 +YlxcJo7nkNRsLTW1QAHEo6KjKc3I7/Z6GudASEYz+y1hmswpeFeFaCL/
 3VZ3wW36E403EB9jZvyzQNApf+KY1PkLO/ki1BOMizx5p4JoyIwQPXLe1
 XCbfT0x5OCo53iz/qVccY3OOkkcM4n8lFDqUeiR56fDqA7Q1uYdhHMHw9 A==;
X-CSE-ConnectionGUID: 5lucPoyrSkuE9ShLbKv2CA==
X-CSE-MsgGUID: 5GEUmdxWRHKwjt3rtAtU8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="43774596"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="43774596"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:16:17 -0700
X-CSE-ConnectionGUID: FClCdSrXTPe0GSPNhwPoRg==
X-CSE-MsgGUID: XGEd1P8WToWM/AbltBvP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163305845"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 04:16:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:16:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 04:16:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 04:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cctYEkxRW4F7MAspyn0Y44uKZZWzZeOmHgWsh6F1cHMeQutFQgTQuUQpvR0qvm3tx0mCUe/zk1kS7shd1VwSmO/IN5F6jHYY/CTfU4UyuR1p4kh2ApMGM+O5OtrjKrak9FuI11UBUEHn2Fs25fpsaUeAz4ZD0k1fjF1i4rNmADi2tpx3lwS9JG7SdotspZjFsAs3M3+3FuwHbbOkkqjF+3wcwPrHOYtoJ8WDoW7mp25015KRw4VptO3i16CNxcnipPDGk+VXf7a9Kpg01jsApLRCzHJTdnYQGFNFmUE8v3tjtoi3gQTA9/8gu+XLiLxiXOpDYQy2zgKxtKnJSOxmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEWrmDa7I/J+dkkXOBoLPYeql+lR6vkopf7xbVz2Lzc=;
 b=vz2tAJEEFBUpcMB0ngilbyDworeQd+tLg0bhmBotJsac6cM/NEZsA0UUJ0QjnTKZWI2vqtZlyC+MguzYek/MNorkr0KptWkIpaWWr/AEHztbNbozdpNDH/NEveineGpiX7bSHP8oJY9d5nZd8wrM4147LKSdZgH8AOj2QoELJqEXhbfLSciSJnx62wIyyFuenfM8YQ0+LJdMy0/SK5z9oM/F6dstCAz98KsX3hOoUsDtT2N0cDxo0Z49ySKfRF70EInJtldHseutXYFP9vmjWSJwM89Th82YmxiErLMMtwnSyr+wq4+QvOXJ4ZAsEyY9TzX7a2wR9fKVscKHGwRFFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA4PR11MB9231.namprd11.prod.outlook.com
 (2603:10b6:208:560::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 30 Jul
 2025 11:16:13 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Wed, 30 Jul 2025
 11:16:13 +0000
Message-ID: <e2da36e8-75b3-431e-bab4-5d2685a587dc@intel.com>
Date: Wed, 30 Jul 2025 16:46:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/20] MADVISE FOR XE
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <aIhQ5Sv6dsCFFz3L@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aIhQ5Sv6dsCFFz3L@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA4PR11MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f8d72e-089e-4871-95b8-08ddcf5a7e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0hQUnZhOXlYZyt1NE8zWHcza3kyVWpNS1B2bmtENTFnZFkwdVczYmkzdDZJ?=
 =?utf-8?B?ZlFkOFNFUGdySUdMTVYvYkJMbSsva2tyOWFWbTZKak14MVdTN3Zyb00yNEJL?=
 =?utf-8?B?cUhIZ2g5MXo4YUpIMXNPYTFURkFwTmFYZVI1MEx2RDdpYm4reGEyOEJuTTdo?=
 =?utf-8?B?T0pVVkc1SklqSXpVdzdVWXQrRWc4UTJWbWdnK0ZaK01rN1pPY1BUL29lN0J6?=
 =?utf-8?B?dnh0dnFoZ1R3cG11NnNHNE1NSS93SFNCckVSaG9jWVJSamFSOWEyVlNSV3dt?=
 =?utf-8?B?bU5rbkRmMERlTnhKNjRQeCt4b0wvcmhRVko3bUJ1c0xiQWYzb1F0dFBsMzE3?=
 =?utf-8?B?ZFptUHU4ZEtCblBlUVNmQmdJQWtMT1gxZHVSVUJoTlk4a1ZQK1E5b1F6aHFJ?=
 =?utf-8?B?NXN2ZVZtYWpUaXl3cTJjWGoxaVJ0RnlqK2Z6OVFtaEtzVVhZcklDcjFDU245?=
 =?utf-8?B?dkNIcWp5UUtMbkVBQm5ta0diTU1vemFSdG9XWlRDclBKSGhHRVlRd2FRSW54?=
 =?utf-8?B?emVaeE1CUkRReXhWVGNBSnZ0UXcxVjdRTVA0cnRTWXhJYWtnSmZDbG9nODdx?=
 =?utf-8?B?STB4UGRvZkE2ZlVhK0ZyK0FKcFdUbDUzNVFMbmxTUy8yT0FnbjFQb2RDalYv?=
 =?utf-8?B?QzR3elRoOWFlOUE3RTI5L3BWNTNSQ0ZEaFFuODZERHlvcUZRd0xBb3hXTEhl?=
 =?utf-8?B?aCt4WDJaakZUS1lMdFBEeXZmRWJZRzhGSFdpeTRYUGp6U3QxK2hQSTR1ZVlv?=
 =?utf-8?B?VGJlZWJtMEs4c2xRdlQ0VHpGOEVpOUtNREMzMWZDenIyMlVjTXZ1ZlZYVGQ3?=
 =?utf-8?B?QVlzUkVLUW5CeEJHN2x1OXAxT1VyTTQ3L0xBQmJ5VFpBVk5vOCsrZjJHNnJ0?=
 =?utf-8?B?QzZMZ0phbnRJaFFvMXdLaytod0ZXYTF2ekpkaWZIVlEwWURJZnNuNEdxSitu?=
 =?utf-8?B?elBHVkFxQWNiL3hFSnhucU5pdlRoOU9VaEs3b2RKc3ZDRzBhajdrRHNJWTlU?=
 =?utf-8?B?ZUNQbE9uNkVhTUQ4eGNSNS9FRHlURCtYdXJpWWgyNWg5YTRwSXVvYzdTT0xx?=
 =?utf-8?B?VFduam5aWmdvYzlqTkFkM3J6RmV2Vis1cUpqNk1wbC9CQnRKaFJ4cnE5WWt2?=
 =?utf-8?B?ZStjVVVFWmpJVkFYK0ZjZVVERWxoTXF3T3I0TDJUQWM4NjhadUtyUGR4UWdi?=
 =?utf-8?B?MDVGUUxkaXBiT1ptTit4S1cvOXl0V09XWHJMQks3V2lpcXN0c2dVYWtybTRB?=
 =?utf-8?B?d2xDMlNNKzVod1JhSUczUktnNnRiK1Q2d3k5ZzhmS21ESE1rUUNZRUNQa3Qr?=
 =?utf-8?B?ekdqaHd5YzJNSDE4M29rNC9RT2IrZnp4M1JlYXNwUlhqZUtRaGwrUUZ1aFpk?=
 =?utf-8?B?d3ZVTFZKV056QmdPa3Aya0lCSDhLVTdsL0Z3NzRDZC9IZUZHdkpEMzdSNlo1?=
 =?utf-8?B?QXp5ZGhEb1M3QVhQbTZUY3FTWEhNQzFYdUh5dVBNN1JtUE4wa0lnbUIyTDJj?=
 =?utf-8?B?MTVyQlcyaW54eUN4bEFzNnRXc1N3b2ZkNFZnM3JMcVhzN2ZxbDlRdnJhcmVq?=
 =?utf-8?B?Mytsc2p0K1k3NHIxM2pOV2w2SVZJWStVR3Jha2kvK056REZpSjZ1SmxUQkhq?=
 =?utf-8?B?NW4rZDF6WTdsdHQ2c05VZ2QwZ0xBKzREdytEK0pzeGRvc2h0cytQRlRrZFVs?=
 =?utf-8?B?ZnlJNGkyT1lpMm5mRldDSTI3YVEySzJnbklSNUx0TFJnU1Bqa0tpU0FqcGd3?=
 =?utf-8?B?VlB0algxd1hEdDZXd0hUbE9jLzJRdjlOcHpISjN6NXZXTWNSS1BtVXlXbzNj?=
 =?utf-8?B?SVN5UU9OYytEckIzL2x0empER1dCb29jeEdOYlg0UkxXOURqL00yL1V2OVk3?=
 =?utf-8?B?b1kreE1qZVdXcWQwQjhvWTNQU01NN2RNdXh6WHFyOUFlem44VzduZnkzS1Nw?=
 =?utf-8?Q?jUMwkLmFUZo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW9salphdWtHeTZvT3hnaysrWWFkVXJ2Z016S21qUzZjUk1xSk5XS3dvb3NK?=
 =?utf-8?B?MHhKUExyMVplSVNxdlN2d0cyUzBLZVV6U3Z1RjRMZGZOYjlTdWtsYURYc2w2?=
 =?utf-8?B?WUo0czBZLy81SVgwVnRBeVZjQm1qaTE3QTVpWHIvMG8rb2RZTXhYZVJiYS8z?=
 =?utf-8?B?Q1pKalNMVk5uVGhoRWY0S0t2bmp6N0Jzb1d3VnkyRkNONzRWTE80ZE5idks2?=
 =?utf-8?B?Z1lETTY3ckQ4Z1VkUDRKeHFldFJlTGxDSE1BUnFhMDR2NXBXVm9oZjQ0b0Vr?=
 =?utf-8?B?d2JhMGE4TnI0SmNTMW5NcTZwb1p6T3lGMzJKbUJKLzU4V2oxaVg5c2lDNEt1?=
 =?utf-8?B?U1FNcjJ2ZFZFOFY2akRyMUo0My9hUk5acDJFMzltMWNmR2NMaG5BM1ZvOG1n?=
 =?utf-8?B?aTZJUVdOUFBoNkxwNDE0U2dJT0xZNTNGS3F6N0NFcnhwSVdHcGVGRTd1ZWN3?=
 =?utf-8?B?TDl3YXl3eWhtc3lDT0RFbm1oM1JkSkY0d2lmYm0xdkpabHpralhTWWExeGZH?=
 =?utf-8?B?UUFyZ3lvYWxRSm9ZaGtKbXp5ZFRKWTdBdlRkT1Evd1psZ3ZEc1Y3TEdCVGJB?=
 =?utf-8?B?d3FsdFE0aXRQaTY4RmV3WGUrSW16ZjRXZldUdHBKYW1ydUFaR0lzQzBJRzJX?=
 =?utf-8?B?WWs4L2VKbXczaWNKNTlCUU1KNTEwWlBmbmw4UWlnS3h6U2tWOUJsOUhCYUYx?=
 =?utf-8?B?Y2R5OEx6dnp0YnpudjF2WUF6SjlZT1F4TWZuSzdvS0l6K3ZubnVWTmluSnU5?=
 =?utf-8?B?SjZBTFIrNU90TmVBLzZxd1AyUlVpL1l4dlVvVzdTbDh4TzBsLzY5U05FU01w?=
 =?utf-8?B?LzN1Nlk5dC9YUE5ZM0hRWmQ4V3cySzBLN2dXOThVTlBRL0FXNUZhMXRicWg3?=
 =?utf-8?B?NkdUdHdROWhPRjBKZHdLYWxBaCtseGF4aE5WS0pPd09pbm5aZ1Yza2I5N29t?=
 =?utf-8?B?VERkMGpCUi9ZNkdjZzgxbGN3SkE1SUY3ZktOZ3RHbEt6RVpGNWdjVzd3RHhI?=
 =?utf-8?B?dXE1RnVXTjMzQXZiVEk5N0VYcGN3OFozcGtFZUhGeHV5cC92Rmp1Y05OWEdS?=
 =?utf-8?B?d0FYeXhJR3JyM0lwcVpOazEwRzFWeVM1QUlWL2pDbkJHVTd2ck9nOVZZT3Y1?=
 =?utf-8?B?RjViNUlwN3JUbm92QVcyUXhTWUtEQy8zL3hNM3ZHR0w5UXEwOXRyM20vQjRl?=
 =?utf-8?B?TDRiMUV6MHM1OG8vcUxsVlFUVUFCUHlBa1NYVWtjS3JNV0UzYmJhcG1nT0hi?=
 =?utf-8?B?clU4NXVodE42UktWemxJcjlDU1ZSeTIyUFBSZHVxaEdnNjBGbFBHRm9oVysy?=
 =?utf-8?B?Uk4rU2llNUtlV2RTTjJ6OW9hNXBrRUVoZzU1cXkzOWpQM1dYRGhJSStwRXRW?=
 =?utf-8?B?VnFHUFUwdDgzVTdaaFV1YXZYdkRkS3hXMHAyNkhISDk0em9aTHZaV2dNYlBW?=
 =?utf-8?B?SWlvYllqTW9Iak9SRmZvQzRIZVBBeHlvT2RPZFJ3c2paNFg0NUlFTm9UMjlL?=
 =?utf-8?B?bDhCYWJRejFJVkVJMGI4ejl0YmpiNnhoMDlOL2JhcWJrTVF3dGt1aUtmNW1u?=
 =?utf-8?B?WlFNSHA3bDJydjU3WVY4WGRzRjhaakxpTm9MbzdRQ2ZzTUxFbEVob2MyaGo1?=
 =?utf-8?B?ZmdDbTJrNFFkRWdSbHF5VnFzbjlnNWIxRk1qdVVzeUl1NldJbGlSNjZtUFFl?=
 =?utf-8?B?RVNmVVN2NnhvdUhLVmQxaEtyRnRFUjNRTmNldHFzMm0zb0NTTzQrc1hXa21w?=
 =?utf-8?B?VjdsY2hnMFhmR28zREVZU3c3ZE5WOXA2STIxc05KUTBETThlRHd1UTZkc3I5?=
 =?utf-8?B?dWpyTGROMW9rRkE3NzRaRXN4QTZTWUdOU3lDazNUNENLbkZvYzlMTDFXOWVP?=
 =?utf-8?B?SEpUcnhUY3c2MUJSb29MazJGdlNvWnY3TEZ0M2RqVnZRSG1kcG52ZnpzeHkr?=
 =?utf-8?B?UkFRY1h3bVkvM3VyY1ZVOXpwQWEvY0w4UVBCck1IcS85VW1xS0Q4U1I2Z0xO?=
 =?utf-8?B?ak1iM094dXQrejIwRWVLMlBUMU1SV25jQ3RVYTdQUk8vaW81S0JwSkFNK0RW?=
 =?utf-8?B?VmJTOVU2Y0hucXJ0a1Z3UHJSQjdsL2xmOElkN0NHUEpaZSsrNFc0WVRpa2xN?=
 =?utf-8?B?UnhNZ28vZlhyK2dmeE10N3ZlanNjbDBBVW9hQ2pISHNBc2NUL2RXMHpDNXNz?=
 =?utf-8?Q?fk6MY5e9kz/KP6S9a3QNY/g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f8d72e-089e-4871-95b8-08ddcf5a7e82
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 11:16:13.7548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1D1YsjGYkSJ1abZcfkVNqsAtLKTeMaopeDS7J80e5PxW2Cr5E+X+AjuFeOxKQrPd36FVJLXIm7WRTLIaFVJz6dEUYmTiN8bISsrBLbL3qxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9231
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



On 29-07-2025 10:11, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:38PM +0530, Himal Prasad Ghimiray wrote:
>> Provides a user API to assign attributes like pat_index, atomic
>> operation type, and preferred location for SVM ranges.
>> The Kernel Mode Driver (KMD) may split existing VMAs to cover input
>> ranges, assign user-provided attributes, and invalidate existing PTEs so
>> that the next page fault/prefetch can use the new attributes.
>>
>> -v4:
>> fix atomic policies
>> fix attribute copy
>> address review comments
>>
> 
> We are getting real close to this being fully reviewed, so I think we
> need a UMD PR for this ASAP.

Sure

> 
> Matt
> 
>> Himal Prasad Ghimiray (20):
>>    Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
>>    drm/xe/uapi: Add madvise interface
>>    drm/xe/vm: Add attributes struct as member of vma
>>    drm/xe/vma: Move pat_index to vma attributes
>>    drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
>>      parameter
>>    drm/gpusvm: Make drm_gpusvm_for_each_* macros public
>>    drm/xe/svm: Split system allocator vma incase of madvise call
>>    drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
>>    drm/xe: Implement madvise ioctl for xe
>>    drm/xe/vm: Add an identifier for madvise in xe_vma_ops
>>    drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
>>      madvise
>>    drm/xe/svm : Add svm ranges migration policy on atomic access
>>    drm/xe/madvise: Update migration policy based on preferred location
>>    drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
>>    drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
>>    drm/xe/svm: Consult madvise preferred location in prefetch
>>    drm/xe/bo: Add attributes field to xe_bo
>>    drm/xe/bo: Update atomic_access attribute on madvise
>>    drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
>>    drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
>>
>>   drivers/gpu/drm/drm_gpusvm.c           | 122 ++------
>>   drivers/gpu/drm/drm_gpuvm.c            |  93 ++++--
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |   1 +
>>   drivers/gpu/drm/xe/Makefile            |   1 +
>>   drivers/gpu/drm/xe/xe_bo.c             |  21 +-
>>   drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
>>   drivers/gpu/drm/xe/xe_device.c         |   3 +
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c   |   2 +-
>>   drivers/gpu/drm/xe/xe_pt.c             |  25 +-
>>   drivers/gpu/drm/xe/xe_svm.c            | 110 ++++++-
>>   drivers/gpu/drm/xe/xe_svm.h            |  22 ++
>>   drivers/gpu/drm/xe/xe_tile.h           |  18 ++
>>   drivers/gpu/drm/xe/xe_vm.c             | 295 +++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm.h             |   6 +-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c     | 389 +++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
>>   drivers/gpu/drm/xe/xe_vm_types.h       |  38 ++-
>>   include/drm/drm_gpusvm.h               |  70 +++++
>>   include/drm/drm_gpuvm.h                |  25 +-
>>   include/uapi/drm/xe_drm.h              | 253 ++++++++++++++++
>>   20 files changed, 1368 insertions(+), 149 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
>>
>> -- 
>> 2.34.1
>>

