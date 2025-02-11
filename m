Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B96C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 19:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040F110E15E;
	Tue, 11 Feb 2025 19:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsLL8+Hw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B4010E15E
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739301421; x=1770837421;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1R5OLxcnE5MkA+hMcUz8mf7Yyx4p+1sPamwifQzZXUo=;
 b=HsLL8+HwnBQcpX55+KPkl6VeKOo0/AEeD1ODpz9KH7gc1r9QArGnz+kr
 vWiX14IUm68MIzliuJizgykFriwqLyvkmbtjXMvny7STwdrzO0SPKU9kF
 UDTUX4SKwf9t7mPnybmga8VJChkPjIDiivd5PD4KJZ3suIHBzgqpbDl55
 HZOlrPvGGlr2cjk5xzjNgmNoYAVUk0dir7I+6YTlW2D40iDjS68LCGxyW
 LsbaiBQUaZBBiS9jU5pM1/d3HuSTZmcEFq9nWe5EMqKpMaDvqWXYci0JT
 kvsuWw0kkK9bhRTrEaj7BX50KcJzP2ZigQIfKEqna2ctT4su/a5bHUHVS Q==;
X-CSE-ConnectionGUID: QXf2eGOEQqurM+yKC9hLYw==
X-CSE-MsgGUID: qbnbBvSkT5ipLs3rr44gMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39131284"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39131284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 11:17:01 -0800
X-CSE-ConnectionGUID: ZgEq1RC0ShSHO9CFJ/e/1g==
X-CSE-MsgGUID: DCw9+X4bQmuCWpSwEP3cBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113493987"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 11:17:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 11:17:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 11:17:00 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 11:17:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCb+OSkuECt2u+QRFfY6ARIghunS2UtQFxn4Uzuy/LFMnismZt7iB4uiBG8UZzWBxWqcNJj/yRy/OHLm0t5dIUMtgKIDak4gaTAhDyNmXS6fqw1KgjZJTdntCC4V2VVc/eOUduOkgPby/ig8HAddNlZeunQ2yEd7gc7XmTzRTFFLhfzMFENnfzzTKEuMRCJODrw73DDKMGzBpt386PACjpsCsDVMUVC7TL1jbMKtnqnqliNais3xAIsgoXPKEOppLdwB+omKBvLCp+nQIk282QOb1K35U/ZW3cqJvpBuJIJs1Hq53RGtGs3I4Ur2nr46mQK+05KZFvwKa4RXbm0xTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbf/t2i0PZBYAZiyWvflOETdcyRxM9Q6gP5c7ch/+Rw=;
 b=O1QKPqH7twEHRoTDhYubg80XMwse+QYywffHYjEFL60WgTgG8AsBFTPim1ZkJSxQhjVjle4RFplPXh/R24jxYFOFaUM0l1U/dvSFfUsW/hEh9CEtArCJECVm6ttzabjH8/iegiJgNioI8oTpflKEFbJ5YWoU2J0LLG1DlxwibDYvwlra8gGwwavVzl+QyM9qb9Oit7qVnb+DG1eJR7yYVFkklXCrUfkoI1J4mVlS2LDGn10D1usYLIzS+U4eGycbKRMWzfb01LKgWOBHDsJAXHupFuoFeuDWjIfF7X2tm1khGhQskpswEkrdfLGsuDbjhwrBi5FEdYFWvSnsvWWIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 19:16:53 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:16:52 +0000
Message-ID: <b0a880c9-2800-4087-85f4-42bd6c3cf77b@intel.com>
Date: Tue, 11 Feb 2025 11:16:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8] drm/xe/uapi: Use hint for guc to set GT frequency
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.mrozek@intel.com>, <szymon.morek@intel.com>,
 <jose.souza@intel.com>, <matthew.auld@intel.com>, <rodrigo.vivi@intel.com>
References: <20250207061223.2072753-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250207061223.2072753-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b98211-7333-476d-096a-08dd4ad0a40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFlLR0g1MHR2M3U0QjRsVGRzWkJuVUp1Rm9TT3daTW8reGxmby9NZTVlVzVH?=
 =?utf-8?B?MHBIaVEzYU9tQzhIU0RzdVRSQ2t6c1NNc2pUMVcrRGM0c1hMY2dERnhlMUI4?=
 =?utf-8?B?dVhYakdnTjZkejVzUkJmcGtycTEvOE1yRXNMTzlhS29CVGFjZWFnT3V0ODdq?=
 =?utf-8?B?b25CelZ1dis4NXYxUW5ZQjV0aTJnT3F4MWsxdlNWSm9FVTNIVk94YytOVjVR?=
 =?utf-8?B?Y0w5bk5tTms3aWZRUnhBZU01aFFEaE5uaEtWNXF4UHBUZ3MxVXFsZmVPSWJ3?=
 =?utf-8?B?RjZJd2MrV1lKOHFvcTlVWHA5VFFaSHVtQjQ3eFZES1M1RTNOTXQvblpOV0Na?=
 =?utf-8?B?Uys3UEhvZXZrc3djQTEwNHNzYUZoOU16WjV3ZU9WVDVuNm5EVWdjZ284Q1Vk?=
 =?utf-8?B?RmdzVVFTMVJuMnJvMmllRmhFSnFSOERvaFFGYS9mcnBpTTlPS3VaM2Qxd0h2?=
 =?utf-8?B?MHA4aWxYUkR6NkVPL0psTGFqdjFnRWxiazhrMVZyYWNFMTl1YlVEZTJLbS9h?=
 =?utf-8?B?dEtUR2RYajArdnhoOEFTcXRLMU9qZWV2dEhiR3AzbWRIc21pM3NYYjIvcXpK?=
 =?utf-8?B?RCthZ0xXbUFSdFNvYTNjRzViS2IyRExLeldULzF2UHEzSmowV3VGRFNDWUNO?=
 =?utf-8?B?RW9wejV1ZHg2UTNSMTI0VXBncUNIUjlUUGtteW00R1JtOFdWb0ZidHI4dGtS?=
 =?utf-8?B?R0c4WkQrYnNPTXlDVTZsZXFGYVpHQ0JmcVJGSFVUU0xDaGNqUDdLMU8rblpF?=
 =?utf-8?B?Y251ZG9tN1plMWhtbGJxT3NaWEo2amhQdHNFV0VkL1lScXcyQzI3RTJsRDJ4?=
 =?utf-8?B?c0dCZm1meGdnZDR3WURTNkViWWxmNzBIRWk3Rll2TVNMK3UxUjlpRXRlTlVo?=
 =?utf-8?B?TTB0ZWJhWGRFZkcwTDR5SVN4Z2gxalAvbnRMZGJqRk5xeDZHcUxoK1RQem1m?=
 =?utf-8?B?WFp3Q1p5Wkh0L242TXBJZHlMaENLcUFxams3aTJKMlB5REloTTlMN3hFeE9K?=
 =?utf-8?B?T1hTNkVyalhDakEzVVZpeENZZU1CNnYrRU1WRUtRbEhLUjFYV3JQRlBZdVRC?=
 =?utf-8?B?Z1ZmRW0xVlp4WUh4WmUvWU5SVDE3RFNmcTVkd2pDY0pWTWNGbDdXK3NuLzQ4?=
 =?utf-8?B?THg5YVQzRU9CMWMySkVyL1EwalZSN2xLbHZ5WkhuYTlzVE9rMUwwVmpRQXMv?=
 =?utf-8?B?bG8xd3JNQ2lFKzVTQVRxdTR0RlhZenc0UUY0bFdvMktVSS9haVNYaWVXdnRh?=
 =?utf-8?B?WnJuNkFIcnVQQWhhK3d2ZUZSWGgxeVNWQUNvM0htOE5iTkg2NnBkQzByWXh0?=
 =?utf-8?B?eTVLWDlBcG5qQmY4TzNSa2E3dzU2MURrNG0zdG13dk1BKzFxWVhvbTdrN0tP?=
 =?utf-8?B?K3cwS0h6UTIzRDRuaU85b09LL2FXckg5WVhwZFpMRUNoR1ZJUTlWQVRoaGYv?=
 =?utf-8?B?WnFRQm11TjUzS214aCtzd0lMaVZQVkJXWlJ1akplVG1VOXpIQnN3S3JaRkNY?=
 =?utf-8?B?REFJZG9Ec2J3NCtpb0NaaExoNVU0dnFOWkJZb2hWMmZHZkc1Q1EvNExjck5y?=
 =?utf-8?B?ZTJJejlBT3RvZWpLWXpBcVRvL1VaY0xiVkt3b3M3UnVPcXYxc0lUV004U1NU?=
 =?utf-8?B?anU5OEVJMjI3U2pCeUcvQUdha2IwMVZDMkNvQ1doOTFuT2Qza0RmUi83NWdq?=
 =?utf-8?B?NDhoWnF4c3ZISFdtR1Y1WGd2TE92YXdjMVN2OTVid2VJMVRrSDA0WW44Y3p1?=
 =?utf-8?B?UzdkVyt1WVZhT01DbjIrZmdJN0FzV2trUXZyV2QyUnVvT0dlaHM1UFRsV0pq?=
 =?utf-8?B?bm5ReHdaZ2ErakJIVzQ3dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnlrYld4RlNCM1NYQzFkR2NkWThIM0NpdG1ZYjJ1K2tTcVQ2ekpickl6aCtH?=
 =?utf-8?B?UitaL0dzRmVLWTJCS0xEVFdia3NtL1VBSlBKRmNrQ2N5bXgrOHRLaXNPOTln?=
 =?utf-8?B?dkdNZHY1cmZPNmVzamUrOVlOQ3YrRWlDZis4YjZ5ODI3S2R2LzdqcHlMenZV?=
 =?utf-8?B?dVZuSjhIaEE4VnZHYWM4UmhqZUo2WHNKczZNRU1yNm1sR0hRaDgvb1djUTMz?=
 =?utf-8?B?dUNTRkVoZDZaQUM2QlJaSG1oUmhGcFd2Z29ZVWlUYlozN0drdGtVTkxnenhE?=
 =?utf-8?B?bnZORkQ1bEZKakxlUjFhanpNZVZCaWJLTFRkYUd5R2MyN3g4MXFuZ2kwODNs?=
 =?utf-8?B?Y1hyUkNvdi9nOC8wNWxvNXNpbzJxenNCaHRzT08wNmNXbUppdE0vVkY2Y3JB?=
 =?utf-8?B?OHl1ZWJMbEFVL2JxRVErNEwwcWY3d3NDMS9NNXBHczNiT1pCbElac2FkbU5E?=
 =?utf-8?B?aHVyRFJCK1FaMjJoWEVGZGRFeVRHMGJIeFI1QXo2U2FlenBMRFV4Q3pLZ2xj?=
 =?utf-8?B?U1czTlY0YU5TNUVvUDBUUG14cnJ5YVVYSEFsSmZlUDV2WnNpVC9hQmVYSFdw?=
 =?utf-8?B?UVhWOFN0YWNYMStxbm5qa0FjL0YwNks5SlUvUnRuWE5RNFA2YkxZc29Ga2dU?=
 =?utf-8?B?bU9WWktyMURLK1BMNG40Zkl0T3I4emZUV3F1MUl6V3E3OE0xZ0ZGdmlvNlYx?=
 =?utf-8?B?QWsrZGhwK3A1Rm8rekVGTkpPV0FJSzVrTlhTL2l5N0t1Y3FSMHJWM2FrR3VF?=
 =?utf-8?B?Tzl0VWJOM2JtY0lhZ0xMa1RSOU5WejNHZitzZ3drWkdsdHdGd000S0V5Q1ZW?=
 =?utf-8?B?UFBQNHZZVVduVDFOVUMwdG9RN1VqbUp6WDV4eUZvY3psWXJwdVIrNHA0WnFP?=
 =?utf-8?B?KzVTblVUbW1uSC9FeFlzMTFIN1NrY3YzaGU5K0pud0cyckIyVXViVE5vQkZG?=
 =?utf-8?B?Zk4rdWhScm9oeUVqU1o4bFJmeUx3TVNxQSt3dE1FUklBcUlsUGt3U0VYelNB?=
 =?utf-8?B?Wk8wSmhXWXJqVWtsSWFMNHJvTGllOGw3QUFiWmhWaE5adG1oNHN2NFIyaXpq?=
 =?utf-8?B?cjhONWFIbFE3ZW9IanM2UU5xNHdtUTB5Mk1LWEpTTEJSZE9KSlF6MFIxYzl5?=
 =?utf-8?B?K1Vnd1JuRGE5TUdoWlFxR3BUSisrcFFFdUpJVkxvYXl3VHZQSzR6dkJreHlD?=
 =?utf-8?B?LzdGTUkzODc4OG9pOEllTm4zMVdxMHpYN3hhWGxjaTEwaEdTZnlVMGl4S2Vx?=
 =?utf-8?B?MGtOaDNJckFuUjVidGt3NWJDbSsyaG9aL1F4WjFqSngweHI3UlU0a2hidVMx?=
 =?utf-8?B?MkJ1dlI3UXNUT3B1TFZKalIrcEFzZitXT01YWEdtNFRSYWVFbUdRNElKbkh2?=
 =?utf-8?B?S3draXY4VnV3TVlKaEdWVWVwTlhuY1JKUUxlVkdYT2kwRTRVRUhJeVNyUVpr?=
 =?utf-8?B?NmJyUE1XSlowN1FKK2NXQU5iLzFTb1RoMFNYT0pSUVZXQ3JuVFZTR0M3SENO?=
 =?utf-8?B?U2UzZzl4N1dXUG8vWXFzbXRKLzFPWm9lWXVjRXczT0FaaE1lZFhxVGw3YVlu?=
 =?utf-8?B?STZJS3E5T2V3RUwvbnFzYm5BZndVTk9DN1FXN2Z4Y3VEaWxIY29lZnR1Nldj?=
 =?utf-8?B?OFpXVEd6L0wySTcxZmZtTlg5WSsyUHMvWWZVbWFxYVNEZnB6RXNPYlVlaDhk?=
 =?utf-8?B?b1h3UDZMNlFhbkZQNVVhMEo5a014aUYzQjJWczdKTFpKODJERGRRcGgwQ1Rp?=
 =?utf-8?B?MHBHUCt4ZFNFVDBYY0FQN3BCSkY0aUNJejdYOFVkTzNsUGZkLytraEQrbDYx?=
 =?utf-8?B?bGlycjRTM0hYWWs5c3h3WS96cDN3dXBkVU84RlVaaVZvbjEyUENoa1p0Y1dX?=
 =?utf-8?B?NWs2N0diUjNxOXY3TG1wTEtQcEJneWIrQnZ0UExmY0gzSVlXL29VOFUzK2FB?=
 =?utf-8?B?eHpVQTFNMytWMkZ6WHhMKzZHTStmOEdOQW9jZW8rNFhoZzM1YzRkQk4xS2xZ?=
 =?utf-8?B?MnlTaktLODFuRGhWVVJiREtzOFloUGQ2YXNTcFZPVFIzWUVnNkRmeC8zQ0ZI?=
 =?utf-8?B?YjhidWVkZ2x1OEV3NWl5NXBLeHJ3bjNWbGdMR3hqSE1WZ2MxNzVnalhReGhT?=
 =?utf-8?B?V0EwcDlWQ0Rub2xKeGZXRW5hWlpVVFVMdFRIRFJveVdFVTBwU0dtSW5tRzZo?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b98211-7333-476d-096a-08dd4ad0a40d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 19:16:52.3824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4B5Wxr/sK5IUMOVosfa1iNwU9t2lORhUN05TVvbN/bXyUVEQxe7fLUYNU45qlmX0mqceRs1EhTp120bVe9gaxogruAuXSmSTTLjDhSpljeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
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


On 2/6/2025 10:12 PM, Tejas Upadhyay wrote:
> Allow user to provide a low latency hint. When set,
> KMD sends a hint to GuC which results in special handling for that process.
nit: realign this line length, seems to be longer than others in the 
commit message.
> SLPC will ramp the GT frequency aggressively every time
> it switches to this process.
>
> We need to enable the use of SLPC Compute strategy during init, but
> it will apply only to processes that set this bit during process
> creation.
>
> Improvement with this approach as below:
>
> Before,
>
> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> Platform: Intel(R) OpenCL Graphics
>    Device: Intel(R) Graphics [0xe20b]
>      Driver version  : 24.52.0 (Linux x64)
>      Compute units   : 160
>      Clock frequency : 2850 MHz
>      Kernel launch latency : 283.16 us
>
> After,
>
> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> Platform: Intel(R) OpenCL Graphics
>    Device: Intel(R) Graphics [0xe20b]
>      Driver version  : 24.52.0 (Linux x64)
>      Compute units   : 160
>      Clock frequency : 2850 MHz
>
>      Kernel launch latency : 63.38 us
>
> UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
> UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
>
> v8(Vinay):
>    - Add separate example for using low latency hint
> v7(Jose):
>    - Update UMD PR
>    - applicable to all gpus
> V6:
>    - init flags, remove redundant flags check (MAuld)
> V5:
>    - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
>    - Modify logic to restrict exec queue flags (MAuld)
> V4:
>    - To make it clear, dont use exec queue word (Vinay)
>    - Correct typo in description of flag (Jose/Vinay)
>    - rename set_strategy api and replace ctx with exec queue(Vinay)
>    - Start with 0th bit to indentify user flags (Jose)
> V3:
>    - Conver user flag to kernel internal flag and use (Oak)
>    - Support query config for use to check kernel support (Jose)
>    - Dont need to take runtime pm (Vinay)
> V2:
>    - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
>    - Add motivation to description (Lucas)
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   Documentation/gpu/drm-uapi.rst                | 18 ++++++++++++++++
>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>   drivers/gpu/drm/xe/xe_exec_queue.c            | 10 ++++++---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
>   drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c            |  8 +++++++
>   drivers/gpu/drm/xe/xe_query.c                 |  2 ++
>   include/uapi/drm/xe_drm.h                     | 21 ++++++++++++++++++-
>   8 files changed, 76 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index b75cc9a70d1f..234c38ef26e3 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -583,3 +583,21 @@ dma-buf interoperability
>   
>   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
>   information on how dma-buf is integrated and exposed within DRM.
> +
> +Low latency hint by user
> +========================
> +
> +Allow users to provide a hint to kernel for cases demanding low latency profile.
> +
nit: extra line.
> +user need to indicate low latency hint with flag while creating exec queue
s/user need to/User can/ - this was in the last review as well. Might be 
good to indicate that this will affect power consumption.
> +as mentioned below,
> +
> +     struct drm_xe_exec_queue_create exec_queue_create = {
> +          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
missing "," at eol
> +          .extensions = 0,
> +          .vm_id = vm,
> +          .num_bb_per_exec = 1,
> +          .num_eng_per_bb = 1,
> +          .instances = to_user_pointer(&instance),
> +     };
> +     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> index 85abe4f09ae2..b28c8fa061f7 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>   	};
>   } __packed;
>   
> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> +
>   struct slpc_shared_data_header {
>   	/* Total size in bytes of this shared buffer. */
>   	u32 size;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 6051db78d706..f68b597f5270 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -605,11 +605,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   	struct xe_tile *tile;
>   	struct xe_exec_queue *q = NULL;
>   	u32 logical_mask;
> +	u32 flags = 0;
>   	u32 id;
>   	u32 len;
>   	int err;
>   
> -	if (XE_IOCTL_DBG(xe, args->flags) ||
> +	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> @@ -626,6 +627,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
>   		return -EINVAL;
>   
> +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> +		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
> +
>   	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>   		if (XE_IOCTL_DBG(xe, args->width != 1) ||
>   		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> @@ -634,8 +638,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   
>   		for_each_tile(tile, xe, id) {
>   			struct xe_exec_queue *new;
> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>   
> +			flags |= EXEC_QUEUE_FLAG_VM;
>   			if (id)
>   				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>   
> @@ -682,7 +686,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   		}
>   
>   		q = xe_exec_queue_create(xe, vm, logical_mask,
> -					 args->width, hwe, 0,
> +					 args->width, hwe, flags,
>   					 args->extensions);
>   		up_read(&vm->lock);
>   		xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 6eb7ff091534..cc1cffb5c87f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -85,6 +85,8 @@ struct xe_exec_queue {
>   #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>   /* kernel exec_queue only, set priority to highest level */
>   #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> +/* flag to indicate low latency hint to guc */
> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>   
>   	/**
>   	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 02409eedb914..25040efa043f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -995,6 +995,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> +static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
> +{
> +	int ret = 0;
> +
> +	ret = pc_action_set_param(pc,
> +				  SLPC_PARAM_STRATEGIES,
> +				  val);
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_guc_pc_start - Start GuC's Power Conservation component
>    * @pc: Xe_GuC_PC instance
> @@ -1054,6 +1065,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	}
>   
>   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> +	if (ret)
> +		goto out;
> +
> +	/* Enable SLPC Optimized Strategy for compute */
> +	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>   
>   out:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..f2ce3086838c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -15,6 +15,7 @@
>   #include <drm/drm_managed.h>
>   
>   #include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_slpc_abi.h"
>   #include "abi/guc_klvs_abi.h"
>   #include "regs/xe_lrc_layout.h"
>   #include "xe_assert.h"
> @@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
>   MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
>   MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
>   MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
>   #undef MAKE_EXEC_QUEUE_POLICY_ADD
>   
>   static const int xe_exec_queue_prio_to_guc[] = {
> @@ -414,14 +416,20 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>   	struct exec_queue_policy policy;
>   	enum xe_exec_queue_priority prio = q->sched_props.priority;
>   	u32 timeslice_us = q->sched_props.timeslice_us;
> +	u32 slpc_exec_queue_freq_req = 0;
>   	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>   
>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>   
> +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> +		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> +
>   	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>   	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
>   	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
>   	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
> +	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
> +							     slpc_exec_queue_freq_req);
>   
>   	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>   		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 042f87a688e7..102923d3dc74 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -336,6 +336,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 892f54d3aa09..7f8a51fa54a3 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>    *
>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>    *      has usable VRAM
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
> + *      has low latency hint support
>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>    *    required by this device, typically SZ_4K or SZ_64K
>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -409,6 +411,7 @@ struct drm_xe_query_config {
>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1204,6 +1207,21 @@ struct drm_xe_vm_bind {
>    *     };
>    *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>    *
> + *     Allow users to provide a hint to kernel for cases demanding low latency profile.
> +
same issues as above, extra line
> + *     user need to indicate low latency hint with flag while creating exec queue
s/user need to/User can
> + *     as mentioned below,
> + *
> + *     struct drm_xe_exec_queue_create exec_queue_create = {
> + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
missing "," at eol
> + *          .extensions = 0,
> + *          .vm_id = vm,
> + *          .num_bb_per_exec = 1,
> + *          .num_eng_per_bb = 1,
> + *          .instances = to_user_pointer(&instance),
> + *     };
> + *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> + *
>    */
>   struct drm_xe_exec_queue_create {
>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> @@ -1222,7 +1240,8 @@ struct drm_xe_exec_queue_create {
>   	/** @vm_id: VM to use for this exec queue */
>   	__u32 vm_id;
>   
> -	/** @flags: MBZ */
> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> +	/** @flags: flags to use for this exec queue */
>   	__u32 flags;

With above minor cosmetic issues fixed, this is

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   
>   	/** @exec_queue_id: Returned exec queue ID */
