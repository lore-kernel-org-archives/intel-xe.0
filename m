Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EDB106FD6F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 04:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F00C10E02F;
	Fri, 13 Mar 2026 04:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBzA/0zq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84DA10E02F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Mar 2026 04:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773377251; x=1804913251;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=3wrh2h4UjcuW7nyZGaBHA+SwuvWA7PafdwhdI7ncVbU=;
 b=NBzA/0zqptlbFBiFXVjmzghLiJo4WENJOupVGTm/V9Lopc8aumpfU7P5
 RzsgBcPLgw8x15zdJ6MmSEinDzGC5nr7VX9xv70pXZNWA4bBqDEEsRmfg
 ruZUZAf7VCe85A6xEQV3qZFVmbUdTOLRbMpeXgnQrzLkDQ/FcVikfSO/4
 KoLpy7qk69sClU7uYtQoK4AimfzS0783TZL6iBhXhq+qNLZSmtHlGvFzL
 6xNkSTZAaKMyszD0SmSxi1PA82qZh8CAi7dnC0nbcmAeT0Vl5gIRKMqaR
 oiIr3HHWEzRtxB1tTf1jtgo5M5DOqjQzmrIbYgMC4x2HQOU0M/geUI7E+ w==;
X-CSE-ConnectionGUID: N5tHp3tTR7KRVCKqtdzyjA==
X-CSE-MsgGUID: ZgIWaSnLQJqn05xyb9vTsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="84801179"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208,217";a="84801179"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 21:47:30 -0700
X-CSE-ConnectionGUID: KW/KK0f8TYuJBCeZdEqkbg==
X-CSE-MsgGUID: qwm+UBMoSx2pu7e1sdmD1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
 d="scan'208,217";a="223436253"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 21:47:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 21:47:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 21:47:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 21:47:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVvAIjav5EmkmXxpXJ7fRiaOjykG4F0eHX6idj7quEQ3ULaMJQE2FTmm0EXERIWBjBqZK8BshxEvx75SmjyX0hvs02ct9aKUopUzK8fJmJQYE7jGC1/sD0UAXHafX/OKlM5KWerGa+DR+pTfA5r59HaowC6Ww23vNSgOf4PpYXU6EbJ2EqYZY9mGmA4XgmyeY183QgsBtCi4SLJGUDtpAsOgOQfY7k8VIBKEm9fCyiadYPKGGpcuevHTw9349TUPx5mk0xuR+Ia/KH1rTlCnwcNs2dlqg/l5QmlFRBBOgBVvqIj7sdIQcWnu5VDlDUrRvvOUiGKO95M0GH3RN8sYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpZKjrIGRKmJ5gDYhQ/7h/UcS4UnpzYzcIuvrv0BOWM=;
 b=iHs5eaD/YIN1XsYrs3EE4vW7jD7iN9nyMz8xGU1lUEqRBaugPcfgo6tj9TK4DCs+TUNcPWlxzuZfosqxcYBoot3Wybfn2dTlmeBeCsL8gFxHGnpTRvxGXW2roR2+/Xc2D+sLIrKd6VCLAswvujwzlaE98ZvcD6f6Gt0JULHPTj2um5LWRV/vcYX/UP5SJwEK/q4dSI6BkFgLpLRU6KTM03jSYF6JjxlAdF2aeH018XWl8IvO8UjSHrEZC5mdxdJm+KEjsnXlfyheR+q8IF/fWxuAQxgZKPlIfi+aiic7FcC5l8kENOt49efDz+BNKbdXkmX64+IDluQcscKULBiNpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Fri, 13 Mar
 2026 04:47:23 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 04:47:22 +0000
Content-Type: multipart/alternative;
 boundary="------------HWjQD5F8rkxobtp82ZjVTSc7"
Message-ID: <7a5fc775-3bf4-4fb3-915b-e696cd4352cc@intel.com>
Date: Fri, 13 Mar 2026 10:17:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] drm/xe/sysctrl: Add mailbox communication headers
To: Riana Tauro <riana.tauro@intel.com>, "Anoop, Vijay"
 <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-11-anoop.c.vijay@intel.com>
 <d7eeb026-2de9-4dc3-ba4e-610cc9a97e17@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <d7eeb026-2de9-4dc3-ba4e-610cc9a97e17@intel.com>
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM3PPF0644BB20C:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e143a83-f61b-4d8d-2daa-08de80bb9d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: 0SMNGZyIyaslMO+adfpE2aglnQDwOQmF6sEdwxYA3pKRO7KbDLnsJUIuZ8Vc+wBmPdoDS9JGPnxbRKLAzUylmoq9FVXpJR8pe+uXFNocJMe4gcFDoBCCC7YEwoXs+AROSdCeaOGQYPO34ieUURDJbOuijNxNNZIpa6t56JY/hdSpEbrc/zLrXNTSMu9v8qeD2ex8xrr5tYs8xFxLXaSN8vfqP8spVXGOpHh41ZNwoEcuD5oOM+GhOCOOzU+S+Nhl7dcJSkeIxvX9ZVMnz7EuMcPqGpAXB5Mz/pq3jPXxKXBGV511Twq2hWItRiuhsmqn69Eh24PqLz2OAWr0rGtzcw5xYdtxL7tcgx6pvseepW/cWLoogCrJ8QunXHN4MCupwoSsL+qe4qBF14/ST/Zw7QE0Zf+JAZw5AYiA099rlCh7T0Qvnx1Y+iS4V9M5I2usoeCz/kBxSBeoW7YPuWEbwkfTaGvjJSWBrA0uRwN8GV09uBhv4RypiYp/VC1LWmP/knZ+/2gMj9DgKg6zM2sZGy+WGsy3QD2z1XOVHCRoh9wE/bPPyeWp8ftMMw24quBK6ZutzgnyfKTbKCKEa1V+JiZieYl+HmneKCjBcoIOtWCe4TrFq2vI2anLlu8VmtIbQjBRfyjBibdS8ZLZKU0QDoGBD+WaelycGEo9vndEaqTETQ6wBtccu/sjQRPJpud46ORjr5BYJ1OOfCVn0Y9LfVamzEEn6AUxR/N7BzOS31Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBtdWw2Qlo4VjJTSXY4Q1hJOXN1VDFobDRaL1oyUUFUc3FUTXhTcnQrY1ly?=
 =?utf-8?B?eHIxaVBYdUlPMzJLS3BlUU1uRmI0MFk2Q3M3a25IYjRtSU53aDFQaEt6cXBy?=
 =?utf-8?B?WEtrRzM2YVVESnU4a2x0YnhvYTBOZzE2UkE2bm1Kei9aQ1VtTFQvYWpCb0xD?=
 =?utf-8?B?WW1KcTBlNWJ4NGVwb3k3NmE5dE1GSCt3RFlLYVZucDFnUTZPMi9XcWlmcFBs?=
 =?utf-8?B?cnZjS0ZOWWRyZHJVNnRlakVZc2xWZmc2aitjd3RzQzB4aHlralcvWXJSWXpw?=
 =?utf-8?B?WHlKR3V3ZVltYVhHZWZ1VlpQY25CUE9CQy80TkEwY0plaHpWNlJ3cWJ4UzFO?=
 =?utf-8?B?YmgyT0t6TCtUU081aGdGa3JTS2NxNEVWSmJ2MnFEQUhKU0xMcE42ZHNZRk1V?=
 =?utf-8?B?L3VHdmxFcU9uZXlnanVDK1BMckJPcVhjQ29KeHAvTFZmbVNYQzZETGh0WHlo?=
 =?utf-8?B?RkNyVWhQV2VQSURKN21OVGRHZVlxT2h2YTMwTXBxVVNialNQK09EWXRNY0xF?=
 =?utf-8?B?Sk5TcnlBeDJvSWw0Um91SWtaekhQY0owV3h3dXR4SmdZODluTXU2MGxNSkpE?=
 =?utf-8?B?NFRORS9PZm5RSXdvUTNPcndYREl6RTZHRkNMWjVNQWFtY1BoeUs5NFBicGR4?=
 =?utf-8?B?TFlVekVQazFvS2FEak9MdWlhWXBOaFBwbUVHWTBDWTdOMXJkLythSHR2ZUV1?=
 =?utf-8?B?ekE5T3ZaVjZBeFY0SjhVdTRrcHFiQ1g5ek1kb2RuNnl4ZlNtbzNscHg3Q3FG?=
 =?utf-8?B?VnIveEVVeG9qZUc2TjF2VDY5L1BkZnV5UHRiTmd2RWRSYzU2K0dhVmZQV1BD?=
 =?utf-8?B?MG9LcHpSNlhaaThGbzdydnVldWd1Uk14TWxyYmkwZnFMeWhmYzZDU1dkMGY5?=
 =?utf-8?B?VU5DVTNreExFMzQ5L2U5L1dSSFJPdEQyNVpWV2lnR3V1SU5ydnJaTGxqYjBM?=
 =?utf-8?B?WG10dUJqbXYyN2MwQWl4b1pJZWhMNHB1aURjcnk4Qno4M0FNM0lLV0JEbFZv?=
 =?utf-8?B?VUhJT3pvSWNWMnkzV2VBS2dzUVVxcTRmK0hLNTNIaUlHT3BrU1RpbDFqSUV2?=
 =?utf-8?B?NE9mRTlGZmlQczdUQ0xCcmRqRVlEOWFBdkFKV3BwR05vWENvVFFiVTFybzhn?=
 =?utf-8?B?bFZtVWwzTGtnL2ExWGNmWjBwRzU0VlFDdTNmbUNnMEhwK1JYVG5obGxFWktz?=
 =?utf-8?B?eHlvam01TlVIU1I3dC9pNjFiOGJzeFlocU5uQTFNMWg3Z29hTEIwTGNjeGdx?=
 =?utf-8?B?VmFaSFlLSzJMM1l2bFBIUXpsSjZTQkdSa3o4b2F4eXU1YlhISGpSaitXaElY?=
 =?utf-8?B?OU5YdHh0YTI5blo3aldHQ0NyRDlFTDRNNWJVcktYQXdLcHJ4SGJodituaDRS?=
 =?utf-8?B?SlUxQ2UzcmZDeTR2TC9lTHRkMGVuRnN2UXJoNGR3c0RDMkowS2dVdkpGTGdh?=
 =?utf-8?B?NCtoZ2kvVnpzVHVKZkxER0lxYWxTZWY0Uit6WFJxYmVYVEJSUjUvbDF6SzhP?=
 =?utf-8?B?NmpTSkE5c1lrYWUwVnBqbVliUi82VjFaNzVYSHRkZndPY2Nzczl5M2lXbnFX?=
 =?utf-8?B?KzFuWjBHZkZrekx4WDl6Rm94OE1iMTR6Q0FqWEFKUDYxeXhRSEZkZEJ0Ylph?=
 =?utf-8?B?NlNlaklBdGZHd2pWTnRPQnppRnFCSGRvbkQrdlpTRFNFUTdSL2dvMjVYSUZM?=
 =?utf-8?B?WmJaaGtiOC9DbWpkdlE4ZmdFbzhRVTBCOHhzUEJVMTBZTnRBY1lJd2NRWjdz?=
 =?utf-8?B?MmNlbXp5UUdoSlB0dHFGUEhaYXpOSGdGU2F0bTRURzM2cUlRdHFWT3pqMHI4?=
 =?utf-8?B?QVlEZWV6eEFHbVNmalptUE1hMVEvczBFZW40V3NSejB4U3FielF1UFRsQlJm?=
 =?utf-8?B?MnRvSFhMaHcvVUM5bkN0YWdqSmtpS3hsQnN0TkkvV0tVU05pNjdOQ2ZOcWJw?=
 =?utf-8?B?bzg5d3RtMEFiMjAzanVidnZKbU51SkVmS05GaExFVmY1QVF3clc0eU5sY29H?=
 =?utf-8?B?cXJONGJYRjQxSStKaWE1ZzVhcHk3SmhzbjdUdDFYTmtaam9iSGQweDVyc0po?=
 =?utf-8?B?dkcyZmttS1JsS0twaXlGSGxKMlRiY2pkZ1RtK2pnTmpDczJPVWlhV0hTZ2lm?=
 =?utf-8?B?MnhCa2dldVE5Y28zZ1g1eGZwdkpQTVozSkxzMk90bWVtN1ZNeEluNFFnbi9S?=
 =?utf-8?B?ckY3RkF6SWd0blpWeXZOeDhLRWRrM0NvUG9rNDBTRGQ5QTlIVXJUNFJQQWx3?=
 =?utf-8?B?M2JlOThHeE5yeTJiVWZ3NFlCQWIwN2piYWZPWTBrT2VPMy9DbDRyd2oxNGZT?=
 =?utf-8?B?aHlzRkhySUk2SEt4MnJLN3BIbDRwcjhMYWxHcGJvQjdDQ0tVYk9mQT09?=
X-Exchange-RoutingPolicyChecked: DhdeEZRS9+Pr3LdK6P+XfU2ssrald32CaRZiWB2huzQJW5eiJCfWSWn0oatH+WeDStYX2oQydkoRXtWb3T0lEyeSKOLCeGo2XrpqZXtlHw/c6KVKdTD+OEvxrAWdxS8iPUFmYqc8kamYyWJ8S+FalWRXSEZj9dS3hzOtw3EBbP/WZWUkzUCWZV1eGa8E8//pH1j1hhfOBHdT1S5sK9IYIMLXchQBO2LdCLYcS51n0Y01tU1clKcT2mgNW71MhZQaeLyXY0l953Y1/VwNP+JiXTfYXHYrR7oPx184Zp+ZkcDAwJE7ehyFrnK6sNDCUaH/9HHvDGOuLK08T9qXKtcPQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e143a83-f61b-4d8d-2daa-08de80bb9d98
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 04:47:22.8590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DkCGFjNkEZ9pp5NnEW3k9K4KLNRaZcPY7d/WlIp4CigrSnnle4Q+kEjsoyY3TGjSdlzGNlG9WClxJoxH8IpWzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
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

--------------HWjQD5F8rkxobtp82ZjVTSc7
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 11-03-2026 12:59, Riana Tauro wrote:
> What is the reason of using SCHI? why not just mailbox_msg_hdr?

Agree, no need to introduce new term, just xe_sysctrl_mailbox_msg_hdr is 
fine.

Thanks,
Badal

>
>> +struct xe_sysctrl_mailbox_schi_msg_hdr {
>> +    __le32 data;
>> +} __packed;
>> +
--------------HWjQD5F8rkxobtp82ZjVTSc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11-03-2026 12:59, Riana Tauro wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d7eeb026-2de9-4dc3-ba4e-610cc9a97e17@intel.com">What is
      the reason of using SCHI? why not just mailbox_msg_hdr?
      <br>
    </blockquote>
    <p>Agree, no need to introduce new term, just
      xe_sysctrl_mailbox_msg_hdr is fine.&nbsp;</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:d7eeb026-2de9-4dc3-ba4e-610cc9a97e17@intel.com"><br>
      <blockquote type="cite" style="color: #007cff;">+struct
        xe_sysctrl_mailbox_schi_msg_hdr {
        <br>
        +&nbsp;&nbsp;&nbsp; __le32 data;
        <br>
        +} __packed;
        <br>
        +
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------HWjQD5F8rkxobtp82ZjVTSc7--
