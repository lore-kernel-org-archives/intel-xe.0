Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D351FE77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 20:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AC810EF1F;
	Thu,  9 Jan 2025 20:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsrVQciy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CAC10EF1F
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736455276; x=1767991276;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kZ/Tke9/g4rIyUS4OGuVmwkkRscF8Ox5D3eIRlKeeF0=;
 b=bsrVQciyjHCi3WXPsm2UeFlTiDtoEoQfnECTzizm9JELnAqY+xvbnm6d
 yEDV0/x1+9SjxxPrKu3Vgq36k6H94Z/UC3optPx4yxl4WuJf3p4zCSXqb
 d7NfQhxTNXZAI/4hjjhJ3XHCRmz+Mj8TJF5JtDjuFMZzujTeImzGedIzB
 BIgqKYyB76aSB8yR55cwT+hHCfQKD6qlHcGgiyGymzMW7j1Sv66MwAYTI
 XV25wj+bJdKL8zDgd9Rdot/m1d1gNfWp0f03Y0hEE/cuL1cgCawfXSNMH
 PgilOXNhukV5sone1Ja7yOUm//Ag0VtxQvwG5jOe2MG30xR1HrYw4S11r A==;
X-CSE-ConnectionGUID: j/WmdavnRJuqegi7SwWn0w==
X-CSE-MsgGUID: un6MP3xrQnyJ4jvVLQkAyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36899313"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36899313"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:41:15 -0800
X-CSE-ConnectionGUID: txvXPDCSRxaAsf48DQopvA==
X-CSE-MsgGUID: 9lQWXMiESee97onQ28VKTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="103581849"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 12:41:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 12:41:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 12:41:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 12:41:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/ve5aQhlNb7cPb1qucN0o5hnnRHMyHty5jAZFS727t7A6pXFaYimX2vcRZr5P1yIJDhILNcqjy8h3OlKv9g0fRMZPqGElf5xHPkXLUkH+4Yqxw0APqvt/TG27ljkCd1oEjDlj3qN52lBKTJCoFDjHXAAMrr42BNE2Yc2qKKiI40pFAKiAkW2Ca63wyuPT+wREIdW8BHtbouPDJYmMNFNG/P4mPKynks9D/DERJz4zXwvhO5BjJThqPln3dEoIMH5nWLWhjgsQx5XqEuN8NJBVZy7PUKJrcHa/xwEoTetawwgZrAIlNJN1H+Du6hiWKppF4lNYtorBrPV3/mqjcn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlRvQn40qd9vOLfOCLUGYFfVHidsmIBQTIgDw6fxctQ=;
 b=sCcn55mnsqT1EUm2kR5Xmh2QGKgAZiq08NnBy2C6LsAG2696lekIhtyYJ7IkGbmXvISpDldms+IMFmyuAGEDCWpqlNsLEIBkw159u7qGHdQKRK9zD23iWUGH9fcVzPDpe9UCGjMsXmK4vUXCtO1MbWbK/GomU8DT+NmfviFjAev1G8hzXe2VHgTNxvb/8t1euiqh3hW6MXZUXhoiw9fVy4M8HbWnjz51u2mgMvoI/kI3/21kA72o2Go2ty9fB6o7L9thIiBlmqal4dV72mi8o/ihHlG4AZmVUREUTiLIY0d7hbFQGbR2KI78xx/xffG9xAXERQtefGHeLQijfi1n+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Thu, 9 Jan
 2025 20:40:54 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 20:40:53 +0000
Message-ID: <b33cc2e2-d29a-4325-a92f-529ba55efc09@intel.com>
Date: Thu, 9 Jan 2025 12:40:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?=
 <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
 <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
 <ef3c1576-74bf-4fbf-be8b-9ff8d24cc24f@intel.com>
 <qj6jh2z7qncr73nesmsdjaa46rxnm34tf4slp6y4ctv4w2dzv2@lttsv323fanu>
 <789cbf9a-fbd8-44e8-a528-22a6c098189e@intel.com>
 <zkjzktceuth45bignihe2vy5j3durxymlur5ama4npxjtraetp@2cta2iw2pq7r>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <zkjzktceuth45bignihe2vy5j3durxymlur5ama4npxjtraetp@2cta2iw2pq7r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0124.namprd04.prod.outlook.com
 (2603:10b6:303:84::9) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: affc359e-38f2-413c-f1b7-08dd30ede93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjJiQUhpRjRBZHF2bEJVdkh5akdnR1VDWFozWDdoNXVyaHNQbDVtRGlTMWxY?=
 =?utf-8?B?UDA3SHlLTDhZNjMvanpXdE16cWEyNE5pbUZrb0dMWXJwdFRPdlNjYU8wSWJz?=
 =?utf-8?B?cFZPOUdad21tZDhEd3pvK0JxdkJiVFFoZXNCVVNaQ0xjM1U4SmZxRjUybDY1?=
 =?utf-8?B?Snp6b0JoT0tLZWZ6NEt1NU1iQUZYWG1UT0Y0czZudHcxTEs1dCszaHJkV1FB?=
 =?utf-8?B?bStHY09RTytFZnZSNm9KZ3hPMGRWNFBtOTlMaG0zdEFzOFdBS0tIelkyajBz?=
 =?utf-8?B?c3dZMi9Pbi9rUDgyOFlTOENNZ0luVVVRUGcxdmh4VlZjQmRUelhzcXNhUXBG?=
 =?utf-8?B?VTFxdHYrQURyQXlqd0JTQXg1UUpoN0NUNERrWHhhamY3MldMWTNtWDZ4ejRa?=
 =?utf-8?B?STN3NS9WeFdoZ1VqMDR2dVF0UTlwRUpDakw4SHl4eHRoQWR5dzZlaHovUjhU?=
 =?utf-8?B?dWJINkllV0NZU1l4TUpZVUxMdG1YR29SUThtdTA2RGJlWlVuZ2tLNnlvdDZ3?=
 =?utf-8?B?Mzc2ejV4NFZKOWl3WGZFUlFWMmw1eVlBT1JzV1FDOUgwSGFvUHhQMkx4Y3Jo?=
 =?utf-8?B?RE5SbzEyS1djZ1BKRmxtL09lNy9Cd2M5S2phSG9vQXlDcUpPR3ZDQ0FXUytB?=
 =?utf-8?B?dWpoMXQ1NWtLT3V0bitMRy92Nm1CQkVwWm52R2JyT3N2bm8wU0lVSnR5UnVR?=
 =?utf-8?B?a21JRW5reE5xNFV5VWplRWZPM0luNXNDYTJEdVo3Y1o2dFIxQXJrZHhKN0k3?=
 =?utf-8?B?Mmx6dnFhclVucnFZYnhsdmNXeGp6TXNQUlZFN0tZbTFyNlAydHdMaDUzMWc1?=
 =?utf-8?B?T3BWeTFqN1Q2OHpTMFBVdHNKM3BOTVJlSGMvdVgzYmZHQ3RsVzEwT3pMQ2dr?=
 =?utf-8?B?K3VKdjJDLzBtaUYzYzFZK2tucHZqanZzNDN5WEV3SkFqWUJxakdVT1JIci9v?=
 =?utf-8?B?cTRBaTFmNmc1NlVwMVpYcnZYVWdDQUY0eTIybjExV0dWL1N6VU9QSUJVMjU0?=
 =?utf-8?B?TXQ0SFJqM3N4Nzl2VXQzMTBWU1lybXYxZGF4RXJxV21CV1hPV3E0MkIxbnZt?=
 =?utf-8?B?RjJiR3RDNGMwUWhZVUgxakFzdzY1VU5KY3pIVEJBZWR1bURScmV6TVova3pP?=
 =?utf-8?B?enUrMjZYNEthV1pQemFlT002SUw2OGdncVAyTFA4eHpZeWlGUGREbm9GT01v?=
 =?utf-8?B?UUpuYmdQUWwwakNqdFFhblk0dm14WjB3Q1d2ZnZKRkJUOGoyTDVQaWZCUUN2?=
 =?utf-8?B?RDMwcVRwN2M1dUJBelZJUzRpa0VuRGJnWFdRejA3bmxJeVI5eVVtVk9KWWEw?=
 =?utf-8?B?ZGFRNWdqR20wWndwRkFKbHhHSzRRYUVOY0JyZ0YvYytZb1hjamtyRXhuMHZX?=
 =?utf-8?B?d2V5NHhXalJVa3NuTjJjQzY1Z3NIb21OcjlyMTlYbmI0STdHQ0dZeVVqeUFL?=
 =?utf-8?B?YzR6TXdCSlUxSU05eTAvRi82TlNEOGM2MWZLbGRpemMvV1lTbFkwV2J3RFJ0?=
 =?utf-8?B?SGgvTkw5QUVlczZPZm1NWnJRZ0dWeHZSbnFyZEJoTitLS1lqdkMwMjVqZXhz?=
 =?utf-8?B?QndFOUNEaFdBdWpLTDdNb0VyWkQrdGlMNlN2cXlqbjVEVCtnOU42bWx5bFJL?=
 =?utf-8?B?bXkvdW9qSTJqelA5MEU1Ui9BMjdUckZ1NGtYdUVyd1J6RkpuR2hvMllZaDlF?=
 =?utf-8?B?ci9aZ1B4YWh5cGhhME5jR1pBc1NJSVJRd2JKeVdIYlRLbkRvaEdjVi94bFRR?=
 =?utf-8?B?QU5QTGk2VHN2SDErMDk3S2VYZzVHT0xOOTM1TXlKZGpFQTArNHcydnUyak9r?=
 =?utf-8?B?WGdENmp2REhTVVJmODVVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTRSZmxhVHNBNU9Bb0JJNmV5WGhPV1ErWXpxOTNFS3ZxUU9aeEZPVTJUNThQ?=
 =?utf-8?B?dzVqYXdoUDlFd2Z5cDNqVU9rUHJDR0tCa0sxRkhwR1ZwTFN3RDk5VXV0ekdq?=
 =?utf-8?B?NnEvRkxma041THYzc1NGTlZ4VStIeFA3c0RRajRmdUIzOGtXdlN1cHR6OXQ4?=
 =?utf-8?B?QjZiY0xQOE5UVW1KRnhhdS9xa2NQUUtvY0p1UlJ1cVNjVm5ieGZGMmRvT1Ra?=
 =?utf-8?B?RlRWMHo4emI2czByd1pnTlRGSFRrM0RjYWZZbmN5NGxzNGJDWkR5cnFOVXQv?=
 =?utf-8?B?QUpEK2tDdWhxcEpob0swNjFOY0FQaldjWmxjVW51YVNjUEIxMlFkR0wwbWth?=
 =?utf-8?B?cjdYQkJCbURjRzJIT0xpV1B3SmVFc0svd0taNHoxd0o3c3hhTnpVMW9FNktX?=
 =?utf-8?B?TUxwajZVS0ViZXRiTUVkMVBzUFNKeVc3YTFZV0VCMy9GVk1tNmhpeDg4SXE5?=
 =?utf-8?B?SEtTdXB6azEvQVVnQnA0blpFdmJua2hwb0tNTGdLb2dhTmdIa05FNmRRRWFT?=
 =?utf-8?B?Y1ZKemJqbWYvbW5sT2NkckJrUWF2dG1oSVFuU1VvY3ZDd3BPSXA1LzZEclYz?=
 =?utf-8?B?LzFDNWtnK01VNzA3eURXcTR1dlVVTlUyWCtEQkdteDZxQVpwejFRaHNTSk9r?=
 =?utf-8?B?Q0lKVEpocnhOalRSZ01EVDkrdVZwQUpXVDBqeE54TXFSOCtwNGtSOEVNZEVE?=
 =?utf-8?B?eWJTeFYyNUtFWVowRFJNQjRmQi9JWXk3UTBMY0JIZEwzK3Naa3VWOUZnaUFX?=
 =?utf-8?B?ZFlSdDhMK1NsV05ZMWxsYTlaT08ycGg5SGZTTkErVjhJUHh1OWNhTGF4cnNu?=
 =?utf-8?B?TkZ1N0lnSUFLUG40UDRtSktjZ3FaSTJWS1p0MkJjTm52UW9MWUdHYmk2ZE54?=
 =?utf-8?B?MU9FcjRVNkhEeEo3MDVtRzlqSDJnTDFhOG1kYzY2VjAzcE5XVXd3OXpVSDVE?=
 =?utf-8?B?ZjNEbXBQVHBTTzVqYjZvb0VOcHFGL2ordkV4eklDNVJZcC8yUzdNQnJucVNW?=
 =?utf-8?B?cmVvK04wNVIxU1J1aE1wU3M3ZDNRUkhzdkNmM0xOeVQwOWVuam5FTDl5T3Rs?=
 =?utf-8?B?empJMit4QnlmS1hzNXhnNEhGLzNMTEN1UkhOVW1id3h5cUFINHBaZjhuWUtt?=
 =?utf-8?B?bmIybWhDbkJxYWU1SmdWZlc1QnNXRjNhUEVIWENsMjFwck9wbk1MQmZJVW9E?=
 =?utf-8?B?Y0hYYzJnenpQOUtsM1FXRHAyVUVRVDVmN2NBVzhYMTU2dk1zMmQ3b2hZV1ZI?=
 =?utf-8?B?ZWFKVnhoUXdUa0srbmFQV2dsTm9yYkpLTjZweWFXMDljRTdmbmZ6NTQ1Ni9q?=
 =?utf-8?B?VHVrR1JPTmZzdGthRDRYRjNwK2VJTzhLL0hnMWtFYXlpRDk5a2ttQ0tqbXFm?=
 =?utf-8?B?Vnhabmc3K21BejR0dGhkbmY2dzR2YTRKbmRpWUVZeVZnbEIwdGZxdGZ2NnJC?=
 =?utf-8?B?dURCa0MyUk5kaU5wUlFXY3VrTXVIZmRpNEV1R2dCdXpNZmhqSWxRQmx3MFdn?=
 =?utf-8?B?aURGdFpEdlNOWjNiMHM5TFlnSkJCSW9zcVF1SEJadVZkQ09PaVdIeGFoMThX?=
 =?utf-8?B?c3ZoeUJZcjh3ZWtPZDlGd0tKaHZyaEVZMEpQYS9HUmh2LzhJT1g0WkE5T0tt?=
 =?utf-8?B?T1R3Ym14azdQSFF0YTBKWmVjc1FGb0FvejBkQ2Q2VHQ5cTRqVExDQXFvdzVp?=
 =?utf-8?B?djFHWVZjVmFVanFHakc0Z2x0dG9TMHNJdDJzMlAwdkdOZmgrNjN0bm9BMmNn?=
 =?utf-8?B?NWMzdnBKKzdpNDBNZmtRZU5zTGJkR2JuRGdDbFNGRTA0ZGVoeGZJUWpPamdQ?=
 =?utf-8?B?K2htbjJYdUJwcEc5MGVWTi9KV2FzckN2WlVRUTRYMHZscExhcWE2SzZiZHNJ?=
 =?utf-8?B?N0FQRHpVZXdIT2xCRmVlajBENGFTNW4wNVYrNWkxVURHd3N6MkhHdkNFY1dU?=
 =?utf-8?B?blhJa05GK0x1Y1poSFMrWEF4TzN3R216UjM4b3VRTUJtYys1c3lia0xtWXIy?=
 =?utf-8?B?V2JiZENuZUNpNzZnSTQ3ZlFTaHF0emU2MmN3bnl4bTEwdVFvZGRRc0IwZy9k?=
 =?utf-8?B?TWZ5N2J5a3hlSTcySHF3MThBWVlwNkJLZy85Nk43b0dSeHZhc0x1QnI1dUgr?=
 =?utf-8?B?dUtUWXJBYnZyTW14UkhMeFN3d0xMSXRtSkgzVjJJK1k5NitRcXVGSUU1dERp?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: affc359e-38f2-413c-f1b7-08dd30ede93b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 20:40:53.6662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzYEV0lFfHo/K8ONh8CTkbsR5tqDS9VwDq7Ab9/PKs0HW6OpCg6H90AvRT0vhdr5YW57S0J03aRi1TKUO0oLCPljZbGX5C9xan2xz5PuNWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
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

On 1/9/2025 07:39, Lucas De Marchi wrote:
> On Wed, Jan 08, 2025 at 03:59:58PM -0800, John Harrison wrote:
>> On 1/8/2025 14:11, Lucas De Marchi wrote:
>>> +Jose
>>> +Rodrigo
>>>
>>> On Wed, Jan 08, 2025 at 12:14:49PM -0800, John Harrison wrote:
>>>> On 1/7/2025 13:10, Lucas De Marchi wrote:
>>>>> On Tue, Jan 07, 2025 at 12:22:52PM -0800, Julia Filipchuk wrote:
>>>>>> Change to disable asci85 GuC logging only when output to devcoredump
>>>>>> (was temporarily disabled for all code paths).
>>>>>>
>>>>>> v2: Ignore only for devcoredump case (not dmesg output).
>>>>>> v3: Rebase to resolve parent tag mismatch.
>>>>>>
>>>>>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>> ---
>>>>>> drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
>>>>>> include/drm/drm_print.h             | 2 ++
>>>>>> 2 files changed, 7 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>> index 6980304c8903..8e5d1f9866a7 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>> @@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct 
>>>>>> drm_printer *p, const char *prefix,
>>>>>>      * Splitting blobs across multiple lines is not compatible 
>>>>>> with the mesa
>>>>>>      * debug decoder tool. Note that even dropping the explicit 
>>>>>> '\n' below
>>>>>>      * doesn't help because the GuC log is so big some underlying 
>>>>>> implementation
>>>>>> -     * still splits the lines at 512K characters. So just bail 
>>>>>> completely for
>>>>>> -     * the moment.
>>>>>> +     * still splits the lines at 512K characters.
>>>>>
>>>>> did we investigate where this is done and how we can overcome it? I
>>>> Yes. And the comment could be updated as part of this patch to make 
>>>> it clearer...
>>>>
>>>>
>>>>      * Splitting blobs across multiple lines is not compatible with 
>>>> the mesa
>>>>      * debug decoder tool. Note that even dropping the explicit 
>>>> line wrapping
>>>>      * below doesn't help because the GuC log can be so big it 
>>>> needs to be split
>>>>      * into multiple 2MB chunks, each of which must be printed 
>>>> individually and
>>>>      * therefore will be a separate line.
>>>
>>> so there's no "underlying implemenation that splits like at 512K 
>>> chars"?
>>> Nowe it's something else: a 2MB chunk because of what?
>> The GuC log is captured in multiple 2MB chunks because we can't 
>> kmalloc a full 16MB block at a single time irrespective of memory 
>> fragmentation - the kmalloc function aborts with a page size error 
>> above 8MB, I recall. Might even have been 4MB? The 2MB chunks become 
>> approx 512K characters of ASCII85 output (when mostly full of zeros). 
>> Because each chunk is a separate bo object the memory is not 
>> contiguous so each must be printed with a separate call to 
>> xe_print_blob_ascii85(). If xe_print_blob_ascii85() includes a 
>> terminating line feed at the end of the print then that means 
>> multiple lines for the GuC log.
>
> now it makes sense... and contradicts what was said earlier about the
> "underlying implementation still splits the lines at 512K characters".
> It's this very function that is splitting it.
The initial comment was written before the situation was fully 
understood because it was a quick hack to get the mesa debug tool 
working again.

The split is a combination of the helper function adding a linefeed to 
the end of the output and the GuC log being so large it must be split 
into multiple malloc buffers. But it is not related to the 800 character 
line wrapping within the helper's output.

>
>>
>>>
>>> I don't really want to keep updating this instead of fixing it.
>>>
>>>>
>>>> The dump helper could be updated to never add any line feeds, not even
>>>
>>> when you say "dump helper", what exactly are you talking about?
>>> xe_print_blob_ascii85(), __xe_devcoredump_read(), __drm_puts_coredump()
>>> or what?
>> xe_print_blob_ascii85
>>
>>>
>>> If it's about xe_print_blob_ascii85(), I think this would be the 
>>> first step:
>>> drop the \n you are adding. AFAICS calling the print function in chunks
>>> of 800B would be fine, just don't add any \n. If that still adds \n
>>> somewhere, we can check how to drop it or you then may have a pretty
>>> solid argument to adapt the mesa tool with a newline
>>> continuar char and send them the MR.
>> As above, the chunking is at the next level out. So dropping the 800 
>> byte \n won't help with the GuC log still being split into multiple 
>> lines. You have to either move the terminating \n outside of the 
>> helper and into the callers or add a bool parameter to enable/disable 
>> it. Either of which is just messy.
>
> If the caller knows it's calling the function multiple times to continue
> previous data, it's not unreasonable to have an arg to terminate it or
> not. It's for example what python does with its 'end' arg to the print()
> function.
Just because someone else does it does not make it clean or the best 
solution.

>
>>
>> Or extend the helper to take an array/list of pointers in a 
>> scatter/gather fashion.
>>
>> And if you drop the 800B \n then you break the dmesg output facility. 
>> Which means we can't get logs out from CI panic type situations.
>
> Or that we should have another way to get a devcoredump. I don't think
> we are going to print the devcoredump to dmesg when the kernel panics.
> We may print it when we fail to probe, but the cpu should still be very
> much alive - we tie the devcoredump lifecycle to the lifecycle of the
> device, so we don't have an opportunity to get that data.
>
> The workaround you add is to dump the whole thing to dmesg, but we could
> dump it somewhere else like a debugfs that is tied to the module
> lifecycle.
The point is to get usable logs out of CI. There are multiple situations 
in which CI fails to save logs. By 'panic' I was more meaning situations 
where we have very rare bugs that can't be hit locally and for which CI 
is not providing useful logs. I.e. we are in a panic about how to debug 
it and dumping via dmesg is the only viable option.

>
> The dmesg (kmsg) format already contains other things you have to ignore
> to extract the message:
>
>  * /dev/kmsg exports the structured data in the following line 
> format:            * 
> "<level>,<sequnum>,<timestamp>,<contflag>[,additional_values, ... 
> ];<message text>\n"
>
> so you will always have to preprocess it, ignore lines that don't belong
> to the log, etc.
I never said this was not the case. The GuC log decoding tool already 
copes with myriad different dmesg, syslog, serial console, etc. output 
formats.

>
> And if you print it correctly, you can even make use of the LOG_CONT to
> mark the new line as continuation of the previous one.
Reconstructing split lines has never been a problem for GuC decoder 
tool. It is only the mesa tool that has a problem with line feeds.

>
>>
>>>> at the end. And then the burden would be on the callers to add line 
>>>> feeds as appropriate. That seems extremely messy, though. And it 
>>>> will break the dmesg output facility. That does need the line 
>>>> wrapping at ~800 characters which can't be done from outside the 
>>>> helper.
>>>>
>>>>>
>>>>> understand having to split it into multiple calls, but not something
>>>>> adding a \n. particularly for the functions dealing with seq_file and
>>>>> devcoredump.
>>>>>
>>>>>> +     *
>>>>>> +     * Only disable from devcoredump output.
>>>>>>      */
>>>>>> -    return;
>>>>>> +    if (p->coredump)
>>>>>
>>>>> but we do want the guc log to be inside the devcoredump, so rather 
>>>>> than
>>>>> adding more workarounds, can we fix it ?
>>>> The simplest fix is your suggestion of adding an extra white space 
>>>> character at the end of the line in the helper function and 
>>>> updating the mesa tool to support multi-line output. That seems 
>>>> like it should be a trivial update to the mesa tool and it keeps 
>>>> the KMD side simple and consistent across all potential output 
>>>> methods. But Jose seemed absolutely dead set against any updates to 
>>>> the mesa tool at all :(.
>>>>
>>>> The more complex fix is Joonas' idea of using an official 
>>>> structured output format of some sort - TOML, YAML, JSON or 
>>>> whatever. Something
>>>
>>> it actually doesn't fix this particular issue. It fixes others, but not
>>> this one.
>> If we do it properly then it fixes everything. The format library 
>> would have helper functions that the devcoredump code can call to 
>
> but we are *NOT* going to export a library for that. You are just
> shifting the problem to "we have only one userspace that is our own
> library, deal with it".
No. By library, I mean libjson or libyaml or whatever. The whole point 
of using an externally defined file format is that you can use an 
externally written library to read that format. Whatever userspace tool 
only has to worry about processing data/value pairs or whatever you get 
from the library's read interface, it no longer has to worry about file 
formats, character encodings, line wraps, etc. All that is handled by 
the third party library / file format definition.

>
>> print integers, bools, strings and BLOBs. The debugfs/sysfs output 
>> would just stream the encoded output exactly as is. The dmesg output 
>> layer would add the 800 character line wrapping in a way that the 
>> dmesg decoder can undo before passing to the decoder library.
>>
>>>
>>>     "Guc Log": "<encoded data .........."
>>>
>>> if you need to split lines, you still need something to do do it in
>>> whatever format you choose. One json I remember working on in the past
>>> that embeds the binary is the .apj format... example:
>>> https://firmware.ardupilot.org/Copter/2024-12/2024-12-02-13:12/CubeBlack/arducopter.apj 
>>>
>>>
>>>
>>>     {
>>>         "board_id": 9,
>>>         "magic": "APJFWv1",
>>>         "description": "Firmware for a STM32F427xx board",
>>>         "image": "eNqUvAlcU1faMH5u7k1yCQGCICCgBoIaRW0EtVSxhg ...
>>>
>>> here "image" is base64-encoded  afair. But in your case, just printing
>>> the json to dmesg wouldn't work because of needing to split the line.
>>> It wouldn't fix the kind of bugs we had in the past too:  in json it
>>> would be the equivalent of adding a field to the wrong object and then
>>> move it elsewhere. An application trying to read that object in the
>>> previous place would be broken regardless.
>>>
>>> toml is more for configuration and yaml isn't a good one for this case
>>> as it further relies on indentation. I wouldn't oppose to use json, but
>>> don't expect to have dmesg to magically work because of that.
>> TOML basically says 'use base64 and print it as a string'. And it 
>> supports multi-line strings, so the reader would have to drop 
>> newlines within a base64 object before doing the base64 decode. Or 
>> just use a base64 decoder that ignores whitespace.
>>
>> YAML seems to make even more explicit. From the 1.2.2 spec page:
>>     picture: !!binary |
>>      R0lGODlhDAAMAIQAAP//9/X
>      ^ space here for line continuation, as I mentioned.
>
>>      17unp5WZmZgAAAOfn515eXv
>>      Pz7Y6OjuDg4J+fn5OTk6enp
>>      56enmleECcgggoBADs=
>>
>> So the userland reader just gets binary data straight out of the 
>> decoder library with no processing required.
>
> A decoder library that we are *NOT* going to write.
As above, the decoder library is definitely not written by us. It is 
libyaml or some such.

>
>
>>
>>
>>>
>>> So let's fix the issue at hand and let the talk about xe's coredump
>>> format for a later time.
>> The issue at hand is that we have two fundamentally conflicting 
>> requirements. DMesg output requires line wrapping but the mesa tool 
>> has been coded in such a way that it breaks when given wrapped lines. 
>> There is nothing we can do about dmesg but making the mesa tool's 
>> parser more robust does not seem difficult.
>>
>> Switching to an externally defined encoding scheme that internally 
>> manages binary objects and supports wrapped lines would fix all 
>> issues and guarantee future compatibility.
>>
>> Note that line wrapping is not the only problem with the current mesa 
>> tool. Unless it has been updated since? The tool breaks if the 
>> context information is not part of the "GuC Communication Transport" 
>> section. Which is totally incorrect. Context state is very definitely 
>> not part 
>
> We reverted it because it's not ok to just move it to the "correct"
> place and break the users. If it's in the incorrect place and we know
> there's this parser already using it incorrectly, we can treat as a bug
> in the kernel and adjust the userspace (it'd be considered a bug there
> too and backported to their earlier releases).  What we don't do is
> simply merge the fix and break userspace.
Can we not repeat old arguments? No-one realised that that change would 
break userspace. Or if they did, there was confusion over what exactly 
had or had not been tested and was causing a problem. Certainly it was 
not an intentional "merge and everyone be damned".

My point was that there are multiple issues here. Line feeds is only 
one. But using a structured file format would prevent both of the 
problems we have currently hit.

>
> Send the fix to the mesa tool if you want to change this in the kernel.
When I can finally work out how to build mesa (it seems to require 
libraries that are newer than any Ubuntu release has access to!?) and 
have spent time learning yet another code base and how the tool is 
implemented...

>
> And as I said, for this particular change it doesn't matter if it's a
> custom format, json, toml or whatever... the bug would still be the
> same.
Ideally not. Part of moving to a structured file format would be 
ensuring that the structure of the data is correct.

>
>> of the GuC CT layer. That absolutely needs to be fixed. And 
>> generally, anything we can do to make the decoding more robust and 
>> future proof would be a very good thing.
>>
>> Note that the devcoredump content is highly dependent upon the 
>> internal workings of the driver. It is going to change over time. So 
>> the more robust the decoder, the better chance it has of not breaking 
>> when some new piece of data is added to the dump or an existing item 
>> removed or modified.
>>
>>>
>>>> that ideally supports binary data and compression natively and has 
>>>> a helper library that can be included in the kernel source tree. That
>>>
>>> oh no, we'd need to define the schema - there are plenty of json 
>>> libraries
>>> in multiple languages for users to choose from  and that would be 
>>> basically
>>> then main benefit of using it.
>> Well, we can certainly define extra formats on top of a base format 
>> but it seems like it would be simpler if the base format supported 
>> all the data types we need already. Doesn't really matter either way 
>> as long as the underlying file format supports all the uses we want 
>> of it.
>
> My point is that we are not going to add a decoder library that all
> userspace consumers have to use. The kernel interface is not a library.
> You are relying on having just one userspace to not break userspace.
That is not at all what I am saying.

>
> The benefit of a common format like json, toml etc is exactly that it's
> a format already understood by hundreds of libraries and we can even do
> something like this instead of having to write our own parser:
>
> cat devcoredump | jq '.[] | .foo, .bar'
That is exactly what I am saying.

The mesa debug tool becomes something like:
     #include <libyaml>

     info = yaml.read_file(file_name);
     foreach_engine(info.engines, i)
         printf( "Got hang on %s\n", info.engines[i].name );

The external library handles all the file encoding issues. The tool just 
has to put meaning to the fields returned from that library.

John.

>
> Lucas De Marchi
>
>>
>> John.
>>
>>>
>>> Lucas De Marchi
>>>
>>>> will then remove any and all confusion over interpretation of the 
>>>> file forever more. But it would require updating all userland tools 
>>>> to use the appropriate helper library.
>>>>
>>>> John.
>>>>
>>>>>
>>>>> Lucas De Marchi
>>>>
>>

