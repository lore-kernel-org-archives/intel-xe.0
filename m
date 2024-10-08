Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD966CEF173
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 13:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E4710E096;
	Tue,  8 Oct 2024 13:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oI2aFk5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6282410E096
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728395225; x=1759931225;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Uz1n71sqsSdH1Ypw/4/VmZxq/z602oJqSk05zAUTBj8=;
 b=oI2aFk5NLSHFuoaBd+BO1lm29YVde7ubL5t1KqBy2KuV+kkdS5AA9T80
 NIBCTmTPAzihxSQNH+VQxXbTtN14uDDbFA0/c0Dbf0ri36tyxD0Nx+O/B
 aNwvqeipbYCl7IFkq17vT0Fdi3ZddogkzchmdZuRrxAheQnPziVxJ7cfq
 cTjs13oOP6fjRJQyqLV+UDO4cBlnisFMCoVWQf8vUS+Yb2pDYy6BQJ8Kl
 0nOjyX95HuUJHUij7/uw+wn1jNdE6UPnJvRsa068UznQwl3gddmIWoSXi
 OaQ5/hra3ZCWZ46ehLtTmpTwDi08t219BtO+MnxLLvcidNKSUbLM3SZYv Q==;
X-CSE-ConnectionGUID: JiuI83scRjKqO/O7wZmNOg==
X-CSE-MsgGUID: vsnmllfPQL6ZMQ1bTYrCLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31293919"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="31293919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 06:47:05 -0700
X-CSE-ConnectionGUID: 7IOr9WeRQU6HIsL9wdQpbg==
X-CSE-MsgGUID: ILiU/EXWRyuN9vLr+uI43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80850178"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 06:47:04 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 06:47:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 06:47:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 06:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0KFO5v461hE5CmVPDnVULRbcoGbWeMg1Mc0PWIueylMua8VPS7/X3MvzUPuTboRyt4U/gf58UOS2j3HrwzaVJHe9SWjsqlHvRY8wLAxo1XLDqYRKcta2c0lACzZ0nqXZB73fNIhNZjDf1a54mlqENYsGuxziFzr0sWAn80OPdJCho8shHg6BfljJH7dE+4ECV9SB1ksm2hnr6jA+bFsTBSOTg1QrJynMldVaqqS7D+1faNl+EiWxeCDZy7lWv3+SUzRTleaN4OKjVwqV9F39rswcRVFZxrQdcBO9N7y6YFacfid7GQiM4BDd3CK01yEheqS5dD0Z1pao/4w295WyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRX/XKoNi6URfHHVl7y3ixMfUe1NaJdkxDF8L+P45Q8=;
 b=KlhR0HB5oByZ+mFbeurAuJNV44ES7svUtuQkj3AFbIJiLSOhWX6H9oi+4dKI7a48rXGSvL2jgCFqxWjRD4rcoHrJONkOgOZ4RsiAQPR41E3jOfj8XFRJgzovLnBRIUZl0/SQLP4uPFuAHh4hQJ9DTiezYDBNzxtJdLAZj62e5rSp5attP3wTYGG/Fzjh+ggFzHbKcqmIMLzT6bExb4y2qrtJpwBYsyVmCK0L7dAse6RROk8WEyPINa0zTb7GbrLeFZkMqOUbAW8fSlUn+DKo4Hrt2us3AWJ1YLQbmu3uOWac5/JvdnJw0Sru1hl6R6ASCpCr3gBAfj6kviQfiwxAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 13:47:00 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%3]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 13:47:00 +0000
Message-ID: <d8202760-57d3-4cd3-8e9a-deee3d4c5b3f@intel.com>
Date: Tue, 8 Oct 2024 19:16:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/xe/xe3: Add initial set of workarounds
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-4-matthew.s.atwood@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20241008013509.61233-4-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::16) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CH2PR11MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c1d709-6db3-45d3-98f3-08dce79faf2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXo2UW9kbzFud0NaeEdkY0tjNkZWR1lzWGFGY2U2SWIrbk9nYmpzYnNzcHBN?=
 =?utf-8?B?TDJNNlhSYmZoZkdDUHhuTEVZM0hOQkw5bGtPRWo4cWJSS0M4eDVJTE1wRFJ2?=
 =?utf-8?B?WUVER1BpMFczNmp3ZnFYbzY3eElFYWYzczF6NTlZYzJGNW1lRW5kRm1xMnVJ?=
 =?utf-8?B?ZjRoMkRYeEN2NmN4ZW9rKzFvOVRmeGpYRTJSM2FDLytwM2JuZ0RGZENlVFg4?=
 =?utf-8?B?YThUNFg5U2pzN0lhSXdzSTlld3VPWnhHL1BqeWRRdUI4cGh4aHpjT2RmSlVE?=
 =?utf-8?B?cGIzZ1JTUkhtOERiTzZqVGlMbmxuTG8vWWJQd1ZJZWUxVmVsZmNOQVNEczI3?=
 =?utf-8?B?U1JBcFRTT1RiblJ1eDBnQkRJdDQ0M2p0MHFGdEtpbzdNRXREelh4MThzK2Ni?=
 =?utf-8?B?UDA5TEdVbzZFZFFEeXo2a293cC9McGdmUExTSmF3WXVQUmw1Q2MySWdvRzc0?=
 =?utf-8?B?ekdLbTNOTkFDL24yTG5HVzN3RnRaRzZ2VUNqTGp4SDdLZUMwYWpDcTNqcTk4?=
 =?utf-8?B?SXppZmtDU0pOUHh3M1Y1bmRoZ0hwOTR6alhyVGRiemtnLzI3YldLUWdRTlVS?=
 =?utf-8?B?eWxXVHVWK1lKT2tnTVFpbytNY3B5QllhMExsSGN3MWxobnNGK1JHYlQ2RlpH?=
 =?utf-8?B?dzduUEEzMHhnbmhFK3V6cHJRSG5wQzNkazJZWXVzUGo4TmV4MUxLUHkyVE9I?=
 =?utf-8?B?MFpOUndVand0SUwyaWhydXRvb2EzWnJnSkg4QVIyV2t3NnJ4OFVIMzJadWpY?=
 =?utf-8?B?S3NFaXZtWWJvajhZN25XcTN2eEJRcEdKRmdyZVEyQlhsaFdjMklYbjc0U0Qv?=
 =?utf-8?B?Z2xHTGk3bi9zQkg5OHBkNjJaWkxmaU1WZmtKR1ZKMGdqaC9RUWRna0ZQcUFi?=
 =?utf-8?B?WG8rdTczZnVUK3hSeVZIaVZCVEVwUjA4NjNuZVZHQVQ1R3BhOVBkaDNvcGgv?=
 =?utf-8?B?S2lvaGFNZEVKZUlENEs5NlJ5Ulp3ZjdLV2hodzZ2TENiSkZqV3BhTHcxYk5N?=
 =?utf-8?B?akFva1pUNUxHSjVrc0JwMTVFNXNWS2VUTzBFR2g0dUovbGYvcm1neXZQZUVG?=
 =?utf-8?B?V2g0QVRTdngySEpOaEJXVmo1dVhHZDVzNzBpL2E2UmVlRkhVUm04TWhFclo4?=
 =?utf-8?B?TTdJL2lOTmdDL1ZRUHJTSTYwWVZXTHQySXdnTU1oRWtPMldVbmYwVElHY1pC?=
 =?utf-8?B?WVZtbzhJY1Q1VVRUSzhGYkNld1lpU0JCZjU5OThCSm5xSWVwVWliT0h4ZHQr?=
 =?utf-8?B?cXIvOTVhb3lpeVRYSWh5WWxMYVJoTW81WWM5ckg0M0dFYUlGSWR6ajk0TWdP?=
 =?utf-8?B?ZHllb0Z6Nk5iZWZsOWg1RW9nTzNEdkRtU2ZTVGxRcG5scmpNLzVDN21xZitY?=
 =?utf-8?B?eGkxQ29HWjRHVWs5TmVuQWUrZGlpaVkxQW9wM282M1FjVDRNeUJVa3dnbEZI?=
 =?utf-8?B?OHhmT3pGcEJETm1UcGZvM3lqdk9PNnJhblQ5cnBRcHVYbjJGT3VRaTV2VWox?=
 =?utf-8?B?aG1vcUJKa3VlWmxUR1VYRDJoUnh4bzNuNXJESE9BaEdjeHdTdTEyaG1hWWRP?=
 =?utf-8?B?eE1nMWFoSmRleVlvYkFVRWcvNnZiV24zSGNiWFdFWjZ5QThLQW5vMDBwTklI?=
 =?utf-8?B?a3N3UGh4QVIwVENhMVQ1d2lMbTFWdXc4QkxQb0Zrbi9NUFNXRzFSZERiRWlE?=
 =?utf-8?B?Z1lIc1Q1ZzUzVmhLNlE5M2d4dUFIbmU3VmJTeHhLcUJvTXh5aUNuQk9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVFOYzlveWJqdzBXMWRXUUMxanVlK1N0TCt3NXNGSTNCMHdGU3RZYzNhY1hn?=
 =?utf-8?B?eHB4a2J2QjduNlN5Z1hKOXl4SEdNcGsvNnhOdWl4Z25seXhNUFRrOGRDYVNP?=
 =?utf-8?B?VXlVR1hBdUhOa1U1K2ZJakZhYUo4MU0rSmh5VmMySDJFQVd4L0oydm93SlIy?=
 =?utf-8?B?My9xUFdzZllFWlE3dEM5MnRsTmViaHJiVmNGbDVqcEdpeVFaUzlybVl6T1R2?=
 =?utf-8?B?RDdiTnloTW5MMUhRZ0U4UlZhU2R5allkZjdnelQ1cmtsRllaeXYvM2hCakNX?=
 =?utf-8?B?MXBialdGYURqRERjdW9KcGlaZDZNSGJmSmdIeUY4bjY4TmhZVjRDbGtOejVS?=
 =?utf-8?B?alR0cC9zTmxsYUZ6ODhhSXNNd0I1WmZSYVhiS2tlQkZDa2hKK1ArbXpsaUlB?=
 =?utf-8?B?T2VXNHhxVzR4MG1NeHg0R0xDOHRqUXNlMEg5bUZydjlWZ2VqN25Sc0VYanlP?=
 =?utf-8?B?NVREUFFiRDl2U1BpQjlqL2ZnbVFCbkNjUEU4eWFGVTZmTFM3ZTYwMUw5Qkxn?=
 =?utf-8?B?OXlicFI2TjZsUzBpc1pkRW1Oc0doSXhQem9sRFNQN0pYLzFXYmNrNGxyWTVZ?=
 =?utf-8?B?Vk01Q2FuZWltS3FyK0dFUXRXTDY3Vk5VcFB5MVN0aWdKdDRuVUVxUWU5cUUx?=
 =?utf-8?B?b1d4NjhYK1pFbm5IMkNhNEtkUjRERmZNR3o4TWlWcXlxZFJQQytJaXBObFRi?=
 =?utf-8?B?dGh0eHVlR1RnZm1WV2ZNS1lDd1E4N1BFMmEzV1d4R0hOMnBzSlVRT3BkV0Np?=
 =?utf-8?B?SG9oOXlxR0ZkaWJaM256ZlVrT2IvN3k2NVBBUVIvYm1kTzR5S1lrWlVYYU01?=
 =?utf-8?B?M3dRRHR6eUdKS0psVXVabWRHK0JUdEVaV2ZzY1dERUJuVVVkUFVlUS9GbzR2?=
 =?utf-8?B?aVhyUEZxWXNraTBxRGRUaTRZQlVzdDRSV0tKYU8zd0lPMDRyYXNlM00yTS9l?=
 =?utf-8?B?WkZTdUJRcnR3MnMxcDRKVEFNUFBsc3ZvbklBRzR3eWlBQlViQiswT2FPV3pI?=
 =?utf-8?B?Q24vQkFyVHJFa3BTVmFtUzh3b3ArRjlMeHBZQnJaVytYWHVaTHQzOUhpZE5G?=
 =?utf-8?B?djk0KzNOTnA5SUVoN2N1WVpHVWo4VzB6dzZSa1kwbXBZVk56OVR5OURUK0tY?=
 =?utf-8?B?QzFEREhwclpmQkMvT3d4NENhQXFURXN2RnNjazVQeURndWUrV2xmblMzcis0?=
 =?utf-8?B?UnQweXY3VHhyemE0Tjh0NWtjMEx4dUpYVEhhYmpaZEMrM2FVNVJUQ2V3VUZ2?=
 =?utf-8?B?ZkI4dVZKd3N1MWhlSHBLL0NnZGFLYjMycTkvKzJpZ2F4elo4UnFGeDJUc0s3?=
 =?utf-8?B?SU1hNDFUenBFSkJFMXRSdGNMTXNjVDBkZlhoNTkxRDFTNnFMQ1hxSjl0NzNN?=
 =?utf-8?B?YlVEdFVBRFNtSEVrTWEyaC9ZVFNJUnJod1RWOUNVcFJHeldsczdrRHdGbEVY?=
 =?utf-8?B?djlkdjdpUnpyNFJ3NXllUHU2YlUzY1pSWVZ3RXdmbHFBQUxxanAxMklTTmNK?=
 =?utf-8?B?eExuNDVCYTFSdVgzTlczZG16UE1tWEdsYmp3NXZqSkdOVEZoeUZ5UWxHRmJl?=
 =?utf-8?B?TVFnZnZFYlVNQUJSRnY5ajQ0QWhxSEVSandOUDdQNkVQejQyN1JlT3R4WGs5?=
 =?utf-8?B?NDd6ZThDUnU0eE5CQ1Flb1hFbU5vdFlNU052aXhwYXFNSTRhblUrc1RYUFE5?=
 =?utf-8?B?R1FHU0NtSnhKWnZuVEtnVVRjbitRSWpSSVJOczBOMWdBa3NXRlVLZVFMZ3lz?=
 =?utf-8?B?YkF3K1lkRFVwZWJOdGJOOG1tbmJ0MDFBRFhMS0t0Y3BhNk5NU25SaW1PWEJm?=
 =?utf-8?B?MHk4RERKUGxuUDJhVUNsZ1BOWVlWd3BOanBZL0JnbzMzdkZ1VE1xVUFxUjB2?=
 =?utf-8?B?ekJPclI3aWlhOVZHamI4di83R0R2eGRSYXNnNEF3Y1RlekxSeXNXa2c0UzV3?=
 =?utf-8?B?ekZxTTZUaElUTDhIenNsN0pVZ3hGbGFqZ3lNcDkwRWVJYy9kdnp5aUZkT0tY?=
 =?utf-8?B?OEl6MStVcWxBQlEza1VvbXRVemEzb3huUk1ndUNoSmY2ek5sV1Y5SzhMTFVH?=
 =?utf-8?B?c1U2VjlBZFVObWhMajBrUEtJQkZPR1h1bXlVSkFuU3J1OC9oc1VHaG5ROVQ5?=
 =?utf-8?B?QXFjejVheHJZMmhwanhXVUtjcHNhUXp5ZnV3Y3RwYTBZSXV1Q3Jpekp4N2tr?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c1d709-6db3-45d3-98f3-08dce79faf2c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 13:47:00.7586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiV9HRIoLC6oMq2VWvpVleQTcVhYLBHyFkkV72Is+IJ9/Oqpgdsp+klRMIorQdD5KEtVTlc9qz4MivhBLTVSed4934QATxjXTJMCC1vgvVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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


On 10/8/2024 7:05, Matt Atwood wrote:
> From: Gustavo Sousa <gustavo.sousa@intel.com>
>
> Implement the initial set of workarounds for Xe3 IPs.
>
> v2: correct steppings for 14021490052, 22019338487
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
>   drivers/gpu/drm/xe/xe_wa.c               | 52 ++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
>   4 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 81b71903675e..7c78496e6213 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -186,6 +186,7 @@
>   
>   #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
>   #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
> +#define   RAMDFTUNIT_CLKGATE_DIS		REG_BIT(9)
>   
>   #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
>   #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index fb80042cbe0d..ac5a9ae94eb1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -286,6 +286,9 @@
>   #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
>   #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>   
> +#define UNSLCGCTL9454				XE_REG(0x9454)
> +#define   LSCFE_CLKGATE_DIS			REG_BIT(4)
> +
>   #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
>   #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>   #define   L3_CLKGATE_DIS			REG_BIT(16)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 94ea76b098ed..a47f43166651 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -252,6 +252,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>   	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>   	},
>   
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021871409"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
> +	},
> +
> +	/* Xe3_LPM */
> +
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("16021865536"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("14021486841"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>   	{}
>   };
>   
> @@ -568,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>   	},
>   
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
> +
>   	{}
>   };
>   
> @@ -656,8 +691,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   	/* Xe2_LPG */
>   
>   	{ XE_RTP_NAME("16020518922"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> -		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
I think you got confused between 16020518922 and 14021490052 (right 
below). 16020518922 applies to steppings A0 to B0 and 14021490052 
applies to all the steppings. Having said that, I believe we shouldn't 
be touching workarounds targeting GRAPHICS_VERSION(2004) at all, since 
the patch stands for Xe3. The original code was correct, maybe some 
confusion resulted in this, if you could revert these two w/a changes, 
the patch looks good to go.
>   	  XE_RTP_ACTIONS(SET(FF_MODE,
>   			     DIS_TE_AUTOSTRIP |
>   			     DIS_MESH_PARTIAL_AUTOSTRIP |
> @@ -703,7 +737,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>   	},
>   	{ XE_RTP_NAME("14021490052"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER), GRAPHICS_STEP(A0, B0)),
>   	  XE_RTP_ACTIONS(SET(FF_MODE,
>   			     DIS_MESH_PARTIAL_AUTOSTRIP |
>   			     DIS_MESH_AUTOSTRIP),
> @@ -739,6 +773,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>   	},
>   
> +	/* Xe3_LPG */
> +	{ XE_RTP_NAME("14021490052"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
> +
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 920ca5060146..51d7208d7681 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -33,6 +33,7 @@
>   		GRAPHICS_VERSION(2004)
>   22019338487	MEDIA_VERSION(2000)
>   		GRAPHICS_VERSION(2001)
> +		MEDIA_VERSION(3000), GRAPHICS_STEP(A0, B0)
>   22019338487_display	PLATFORM(LUNARLAKE)
>   16023588340	GRAPHICS_VERSION(2001)
>   14019789679	GRAPHICS_VERSION(1255)

-- 
-shekhar

