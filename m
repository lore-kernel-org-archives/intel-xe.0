Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C18C27C53
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 19:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0AB10E0EA;
	Sun,  9 Jun 2024 19:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GW8vsuHs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FD310E0EA
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717960224; x=1749496224;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3l61oSfez/6qrXJqWbjRBHjcm7qGQyLh3WqqqdL3u9s=;
 b=GW8vsuHsez/CKYlQCeGgCIkWyTG9YTk5+Vs0FrzNv4doEoe2AM+QCtW+
 dxcUKCd3V0WmWkQ20PaCzvershXqeTZqbMwygc3yxac07pBAuzNNVcmuJ
 /jkOAXWvvM+CgXJTh7VFZo7E6i4QGJruCiYjGvMSgvq/iZFRiRpVsQlHh
 Wn/NNYO6QzLaoLSYX8992c6GvyUoNpym85VIFS4TU1Q98UxKm4ZIa76PH
 zZGv7FbRjGpFIbSpngLejD2VIv6RZdifAmH6PTUIe2mCBJAQDSvnU0j5c
 vawfomuQfKyjrCBPitkvzmwLzH92o+AkqJ+9kApIAwd6OEOweGICDVByh g==;
X-CSE-ConnectionGUID: tNx7eoc4SHCm+vuiMrqRzw==
X-CSE-MsgGUID: 8W04X/nDTYukVFQfV/eMWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18406838"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="18406838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 12:10:24 -0700
X-CSE-ConnectionGUID: Ogq9nSLfSQ2wEc+V4j34wA==
X-CSE-MsgGUID: UT4mJTVmRpi151FCHbdk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="39287259"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jun 2024 12:10:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 9 Jun 2024 12:10:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 9 Jun 2024 12:10:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 9 Jun 2024 12:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYt4Ut8g03IM3h+lb8yo1+Ml41QQ2pk0waM2rMQxdSGQd8B3F9wfUtrOr6cqkmkAUK2je/ICmzXb+8lmrgdpJHF30cUlD1zU7wcZTSnchYKcKphgCStGQ8gBxXZkuUoL2hg+sLOdsLTYH5QIspgbJMHkTYe7/1e2ilG3Qh7ORWzBRulNnZVFpu+enriwsbfU/zybxKi3cUnN8jTI33fNaGAv3xRwUWD0LDFXvzhjVelIfxIcnsOkscg8LRumUjqmw0RgI7oz89OA4mjQO0l26nMRhKIS3ag3tASBLD5A2rCM5zx1aJKOQ7DxUdVjmfjEpVpra2rTGKGEZRkqaA/X8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apXuomJsI4YXSGhh82yGDUvDxwLPMRp4tSZp6CXUi3U=;
 b=aWJUMVgvDrAeYMwWR8Z+H1HBvAFnfny/de1MYH8HjvNpaP2zC3J1WEeE8LAZlNuM5ib2jvc0b3K0gIBQ39w9CR+/eFkoSFnodOJk8LDOjdcisB334BfPxElMnzmOfbQkH0qL31YgCy46s4N8OPgWu8JcKuusa/xCUTa3V0JSziiBRKOU/2fOqrUZ2TL1t3VZlVg6YYf3tBBszJsTx26xK4oqRcLJXkLLw3f3GlQ/+xkMmGz3UZfNBnVq9shasx/eXj1EP3m4NZxmqqNKmP+Naw8xz2/srWZkMhKFK6C40xgTV8APG8foftPaIXKvjmJnTNoZUeRbhiiUrGdtHPcSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 19:10:16 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7633.036; Sun, 9 Jun 2024
 19:10:16 +0000
Message-ID: <6696704f-4778-4be8-9a46-b823d4ecd8bd@intel.com>
Date: Sun, 9 Jun 2024 12:10:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/guc: Prefer GT oriented messages in xe_guc_pc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240609181931.1724-1-michal.wajdeczko@intel.com>
 <20240609181931.1724-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240609181931.1724-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: a99ceb3a-e7a4-4747-27a0-08dc88b7cbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEkwVHBnUnY1V09zTzk4QkcvL3BHRWpaL0hsRk4wT0VrMHNuTGZXanIwQlVU?=
 =?utf-8?B?MzlGRCtHMmpoT3kvSitNamJkdWRCYy9XNm9nSGxhQ2hXcjhkWUJBMHR6Nk4z?=
 =?utf-8?B?SitZZlVXMEFwakh3ODhzdUxOemhHRnYvaHRwVDRLUUl4UGpGakhSVmV1YnYy?=
 =?utf-8?B?ZWtBczJRTWE5K0Fjdlh6VFhsZTgxb2piWXpETGJ3L2ZncmpXSVc0RkVTS25C?=
 =?utf-8?B?R1NUMExyRUhBM2ZybGlKYzFuNXVhSzhMVWJkSWNhUk84OHJwcUpGTnBiVUIx?=
 =?utf-8?B?Y2ZzdlBsWnU2MUpDSjBZU01FVzVTbHN2WkxVZ1luc0tBU0Yzd0dJNDgzc253?=
 =?utf-8?B?Q1NERDQ2NDZ3TGc4K0lWeWZYZUdCKzc0MG5oQmNnV1NHVUhQQ0drTk03cG01?=
 =?utf-8?B?bVVaUkxaaFYyMkNaVmZFZ0E0NHFjSUFIdmp6MWtuS1FvdTk2aFdCQUFwZU0r?=
 =?utf-8?B?L3NyODdkamFTT0xMT0hMeDU5SGoxYUhTMFhtV2JKUkNRY1BUb085M204YUFU?=
 =?utf-8?B?em9XZHB1Nnd0RERLam4yWHZJbENicXIrc1R3cVZNN095YnpMUVdxMDBJaTRt?=
 =?utf-8?B?V2E2VW81OW5xd3BmOEoxa2RxcHpsZUNjMThjMklGUDNTdE9OeStCbnN1SlZL?=
 =?utf-8?B?bG9sQkl2em1zc21CNkdtU1A1YXlRZlltMGJoRmdvdXhLS1RubVg4TXFLYlQ3?=
 =?utf-8?B?WURqdjlzd1NqMDR6a0NsYzZDS215T0VUWUdlamo2c3lxaE1tSUhEVWVqYk9t?=
 =?utf-8?B?Vkg1MzJxNG1pL2tJaUl1K0UwTmEvdDNZUDV0L3E3OGNOUS9UeHY1SmFVL0NY?=
 =?utf-8?B?ZEs4WEoveGxqekNMRGhhVjVyS2hUVzFsY3VaejhhWHR4UFIvMmNRWXFURE5C?=
 =?utf-8?B?Q2ZBWVpJazJHR1F4cnVSdVptcldWMXFMVEhvOVdldCtTR0RjM3pYY0cxQzBw?=
 =?utf-8?B?YWJWSVJBemxOTU9MMUozOWRqcVFPNFpQcmVFcGZOUmpLTjZuMG9yMHdNMGFv?=
 =?utf-8?B?aWp5SHFoUUdqekhhUDRIb0tieldBdWpzRHo0ZEV2UDNheFdMd0JHdFBoODF5?=
 =?utf-8?B?TFZKZ1Frb09odGptQXVmZnU2K1ZwOHNiMXNZc0tZbkM4THFsVml4blZZaVc5?=
 =?utf-8?B?K2NtNUplck9DMWY5dVRxZzM2STdtWGRmNjc1Y2JWY1kvalZHcjkyL29Rcloz?=
 =?utf-8?B?L2hCeUFpWDBFaWhVRU9sVXpGWVlSZkI0VU5lNFVVUXZSNEVma1lHd3A2cHMy?=
 =?utf-8?B?ejkxZTZNUUlaNHVMZmF6bmduZ25JT2MreUtyVng5Tk53dHdyY1pDREVpWld5?=
 =?utf-8?B?QU95anJXdTZRZkpGRkRtVEViS09lR0syaExEU2xZTkhmM3lxNWJEcW5pQXc0?=
 =?utf-8?B?V2Ezd1J1d1VuQzNTOUFHQmlWeHExZFY2S3E4akVldmVCRjkxVGw5RGdpQzhO?=
 =?utf-8?B?dm1uemRSOXp3OWZGVmtrUEplWXZLYkNXV21Wend0R2FkOWVla3hxRjhvNXI4?=
 =?utf-8?B?bm9OZURzNW9ZTisyZFViSng2NFBHMmpoNi9LL2s2WTg2eWs3TFRiUEhoWmVH?=
 =?utf-8?B?V1VsVkNSeVFJV1pFRlhCOVlaVGRtYzZ2UWFHRXZwK0hhWmFCTHk3Zmp6MWFy?=
 =?utf-8?B?b2RwMU8rTUZEWFY2MWs5aWZQN0VQeGJvQjNhdnFmN1VMOWxlaEN0VEI5VElF?=
 =?utf-8?B?K1FDMDJtbmdiY3hZaEtyNHlKMVpuOVlEQndSNjVqNTgzSitWSHptNE5YN0hD?=
 =?utf-8?Q?9G1lZ4uO6vVKvMTDnTWZnE2iI9abmvgvsbPQUd9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZKa2pNUHF1SS96RE9mMlIxTDkweFgrakJ3OEdEelY0dmpncklxb3ZCdk1l?=
 =?utf-8?B?eVZ1b0RFcTd0MnNXM3M1bVlJcmY4UDVNTDFObGdNamsvclpkOTIvSjhLNjlJ?=
 =?utf-8?B?WExzL0pmVlAvamlRVzVrakxaVnVCZHFiVUVPT3FDNGIycnIxMk9PQUh6Yy9r?=
 =?utf-8?B?WDFSMzlpSlhSdityRlVwWmdCcW5lbGhORitrYURVVlM1dWlnWFdwUHhZWGJI?=
 =?utf-8?B?NEw0bjdZa2Y2OWRwSmVNK2cxQkVtUXUzeFY1aTlsd0lUWDF5YXFxUzhiZzlK?=
 =?utf-8?B?aGwwSnpEcGg5YkEvM2dZU2RIdEJBMmdoSFNwR3loV3BudjdYNWRXSUZBVXdi?=
 =?utf-8?B?M2VHMFZOYnpRdUFJM2NFRDdpdFdoYzZuNHk4T2RyZXZzVFlGUU0zZEE1Tyt1?=
 =?utf-8?B?RUxiN0NyV1dvUm9uMUhZckdiQVFNUTNrVVhZSVZPQ1U5ZWM4Mm4zK3FDa1Bn?=
 =?utf-8?B?cXF3QmxFVDdPVEwwN3pSUCs5dXRTTEZSM0JXdFRSS2pSQnk5V0gyb3owK1Rx?=
 =?utf-8?B?c1dTQnBOSm9peE93M1UzaStOUGJkb25jdGZBK0ZLRlRNQlprZ3gyYTU1elJB?=
 =?utf-8?B?eFlrYXV2dzNCMWxxSkFuTGJuWWlkVnhlM0MvWVg0bjBKQ1pCMXB3YmRyaGli?=
 =?utf-8?B?UmdrZndPK2FMZ01jNkQxSkJ6RDFUaWFKMlc4VkVYMSttUDVJZEFEWGFvME1u?=
 =?utf-8?B?QU1MNlh1R2N6Q1BTTit4Wk9KY1A5SDRJcWozTVZwa2wvZ2o0ZHRDaklhRzgv?=
 =?utf-8?B?SDJZdXJVSkVuQUt6R1h6a2JsNU9DN3c1QUN4VHJKV1NLNzVrM2FYVzkwZjlM?=
 =?utf-8?B?eHh6TlQwelB3WTJtckphdnp0bnkzVWFtRDloT0M5dFBuZ3VwNndiSEhCc2l2?=
 =?utf-8?B?cWdwMXAvWVB6Yk5YWEVkQkF1bVhLZU1DVUFXSmM2dmlWbTZwQWI5SEx0T3ND?=
 =?utf-8?B?TlBWUDdvYWRnSzdSaUZadWhDNFoyVUZrdjBrdEFRN3FRSFJxUU4vL2gwQjBw?=
 =?utf-8?B?bEU0MjRJKzZIUWx1cFdCUVdWWWFBR2xWdGdoSTFUYmVVNno3MVgxVUthaUk0?=
 =?utf-8?B?THRzZUluUFRlU3NOdDAyK0I4WGVLLys3aTlFYkJuZ3lRVWo0dFB4eEN2dnVX?=
 =?utf-8?B?ZVJyOG85L2R4cWdkVlZoM3ZZY1kwR2taRjNuVWxxYkhucU5TejFobEZvZW5u?=
 =?utf-8?B?OXJBZThzdlUvcmtvNUlNbDdjYmNGNmw0N3FaWlAvZGZrbEhxdGpsNkd6MHox?=
 =?utf-8?B?QTY2aWpFUHJiVTRleHI4V0I0VGVrVFI1VXVnZEFpRHlrY2o2djc4OElzMkZW?=
 =?utf-8?B?eXVJdW9hWnQ4L3RlelJDanFJSDYzTktQTHNIL2Vld2JHTmx6QXJEUWVaaFNx?=
 =?utf-8?B?dW9rcmI0NkZMcnhQTzNjUXRYZ3phNTBKeWFxeno2RVBob3FjRm1RZFhJeEF0?=
 =?utf-8?B?UVZhNUNhUytHd09EZU44d0lNZFNqVDlJNCt0MDV2SGZVK2NjVjdFWGtwQS90?=
 =?utf-8?B?UHdZeHNlS0pQOGFrR1Y1bEFVYnBpczJQWWVzcHJCekFNQXc3MkI5Y1FzeFYr?=
 =?utf-8?B?Nlo3bm9zSkNjd1pJcEhsUkVxSVdYVVZsdXdYbG51bmhHSXRkTWwrWDZ6bXll?=
 =?utf-8?B?VVgvUWUzTklVMUhnOFczc3ptU1dzeUtSY3VJSHp2SVZja0NZdFlKRnhMNHdq?=
 =?utf-8?B?azA4RSttUkNVVE5ETHlIQ1pBTGlrb2dPaGVNRWdLUlorM1VXalVQbjNjcy84?=
 =?utf-8?B?dDBDYy90Sys2aUJ5T0ExcHRJdnkrMUFwZ1hvQnVEUThZdXpLYUt3RHloMG9H?=
 =?utf-8?B?RnpVd2RybWs4S0pqMVpGdExnYUtKRWJzNVZJbEYyekcvblZic0NYeFI1aXFY?=
 =?utf-8?B?TnRQMHpiWmJQU2Q5L0pnd2QrZVdIYzdUdys5bWtJYXZuOHo1enp6MFhZd2tU?=
 =?utf-8?B?VWdFazE4SDg3T2Z6ekhWb2JHWXFlV2hrSEp5UHBFQWgxcGVoYlFuekU5dEI5?=
 =?utf-8?B?Q3FPT0M4R1NBYlhSMTVpMHZjQXh1V21NSXlKR2RkUmhVdjROS1l5Znd5cSsy?=
 =?utf-8?B?d3BLOTVlYVl5ejlTdzRCeUs2WnlCOG42TGNsbFVsNE9Bd3pqanp6RkFYam1J?=
 =?utf-8?B?bjByMlZYMjA4UWhOYUthRW9lNm96dTVOVEdEWFZ1UUtFOW1CT2dHaGpod0Fu?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a99ceb3a-e7a4-4747-27a0-08dc88b7cbd3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2024 19:10:16.0598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmD9FYqDDzn9muAbmzDGC2ikHwTbVATnqI55ZPKHZn9KMeHUEfXPD3YDiJ9Xb5iUmx2WTG/n/tYwkFsWYaCrQhRzXjrOD9jF6Z6gulO9ytA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
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


On 6/9/2024 11:19 AM, Michal Wajdeczko wrote:
> If possible, we should prefer xe_gt_err() over drm_err().
> While at it, improve and fix some of the error messages.
> Also drop unnecessary "xe_gt_sysfs.h" include.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 2eb8584566eb..666a37106bc5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -17,7 +17,7 @@
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
>   #include "xe_gt_idle.h"
> -#include "xe_gt_sysfs.h"
> +#include "xe_gt_printk.h"
>   #include "xe_gt_types.h"
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
> @@ -139,7 +139,8 @@ static int pc_action_reset(struct xe_guc_pc *pc)
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>   	if (ret)
> -		drm_err(&pc_to_xe(pc)->drm, "GuC PC reset: %pe", ERR_PTR(ret));
> +		xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
> +			  ERR_PTR(ret));
>   
>   	return ret;
>   }
> @@ -161,8 +162,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>   	/* Blocking here to ensure the results are ready before reading them */
>   	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
>   	if (ret)
> -		drm_err(&pc_to_xe(pc)->drm,
> -			"GuC PC query task state failed: %pe", ERR_PTR(ret));
> +		xe_gt_err(pc_to_gt(pc), "GuC PC query task state failed: %pe\n",
> +			  ERR_PTR(ret));
>   
>   	return ret;
>   }
> @@ -183,8 +184,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>   	if (ret)
> -		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
> -			ERR_PTR(ret));
> +		xe_gt_err(pc_to_gt(pc), "GuC PC set param[%u]=%u failed: %pe\n",
> +			  id, value, ERR_PTR(ret));
>   
>   	return ret;
>   }
> @@ -200,8 +201,8 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>   	if (ret)
> -		drm_err(&pc_to_xe(pc)->drm, "GuC RC enable failed: %pe",
> -			ERR_PTR(ret));
> +		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> +			  mode, ERR_PTR(ret));
>   	return ret;
>   }
>   
> @@ -844,7 +845,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   		goto out;
>   
>   	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> -		drm_err(&pc_to_xe(pc)->drm, "GuC PC Start failed\n");
> +		xe_gt_err(gt, "GuC PC Start failed\n");
>   		ret = -EIO;
>   		goto out;
>   	}
