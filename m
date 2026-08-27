Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843CCC5DF9D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5A510E394;
	Thu, 27 Aug 2026 06:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCNeVVgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F6D10E394
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 06:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787811607; x=1819347607;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EG1Wzcdcd/bYD87ZcdjGr7NPY0DwwRF0m4W09gQOvVk=;
 b=TCNeVVgDF4VZBCnCyEgu9xkXsZXd+K+bDyMOEbzx1SRjH5w6ynng7Ka0
 dkpdaO9qpEPOUuMo0RSJ8ii8zD2mBTbiaO0xTwuDQwc+QWKH7mjbWrzwm
 fMHEoduQiF9wKZdIs5aQKmHJreAfMn8o3bHtLYxy0RjzWZBUDwj+Kyneg
 Vwk+peha5913eFeyU4El19Kq9+eoKbhdzXNxcokf86eyq2uyKXG4RqAOy
 456Uv3845Xf26eAw7l1uoliHHLQ0IqQeqNfee0tR8TP3zGutWTohObRPT
 yiV1XEnXd3PpmdaGWhf9MuRMijQH+/SRM7xMtz9Qas52CcaVYza4nXCZq w==;
X-CSE-ConnectionGUID: wUWFPWFeSn23gjkP9VEOxQ==
X-CSE-MsgGUID: IAWNV+qkSrGL16kdA6jTkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88510991"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88510991"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:20:06 -0700
X-CSE-ConnectionGUID: 4nV5reuvSqGH+/FYnvPlRA==
X-CSE-MsgGUID: OCNqNbbETweCGX1jwTmEkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="297657217"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:20:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:20:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:20:06 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+o3cYCIJwf9y9/klD6+Q8jgJGNJJcsMTT+TLbFCovw3PZYnR8woyXEogku6cKkwaFKPayr7/GA96q6jMaKJk9MrftD/642J//nmJeb/ENPRcR2h4lK5bFE9QINvoLt4W3I+JpXtn6r04fBpf3XX8n+YJcgKztHnAV+irtt0Lei4U7kEN4PAosVccKyL1DCBoer9tslxaInsRhzDbv7Y5bp2O+Why7aLJ3Ani9wzG7PWDsy2fo7DGkCFlulH9PP2hV054IFQyaWS9s/7yUXKpTZ8QQyGOw5eY8rDqOxFiggiD25Pq829uz8iVqm6xNSRtzS/Plkx7TvtOsGvmwzOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuJbsxaYjWqy0nZ/iOx23BAf9xlThW/4U3nwAHBKH40=;
 b=DiNL1DZGYOZljPpJvSwyqLZcTvRm3IFu5Rs+Et7nBU/eAgcUMcrQpOmtXAgJ3V3q5FShJ8KwfGZS68GOVPq/vdmRQS7DO3tHiXAkNzVYHV9GX8FvtElco0Orbhz3Zp3PVDGFcuI+FI5T2TPEOVV5XCRT7l4iTgwhB4c4y1tzkgqB8vIHT7sqt3p05qTkt6enFua/gBXTY9Kda6EmwcE3pa20++jVJXqjNuJRQZqI2LqQmxqwgYjJx3TbpVYFpvXX85Kaww1XsPB0r9Gx7ebEPI34YvGkXtc4E2GXeCIBKldRNyXEdn8AZbH+q+QjD4bKhjhIWut75zURUaQRk1CCew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:20:02 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 06:20:02 +0000
Message-ID: <e62e2d10-7b8c-40fe-8881-bdf72267ef10@intel.com>
Date: Thu, 27 Aug 2026 11:49:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 07/14] drm/xe/vram: Add page offline data structures
 and lifecycle
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-23-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260826135136.204044-23-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0200.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: 53daedec-8a29-40fe-4392-08df04033a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: L9y6+ILun3CKvLcOJuIYgeVL2ORZW1ibsv1TJDEjQ8Xr9gP4Ij4BsQdnjwfCHloL0auylWuAKdsK/QMp3Oi6UjAMKsnbiGT5eM3xM4+gbwg61YwwXMRldEatP9/LHNSL2/2WZUYB8yMx6BS9YuFiXyZ7lSG7MuWydJ/lc9ijvhrqtiSiLJU87/Cl5Kv6bfhUzqsmSioMaaFqzJwqFL80dnG9de/F3VL6puoabuV6sPp4vhaP7FOS18XFj9l08GOSB9/wub3bhEXaDw7w0I02HpRL+cX+Dyw0X9n35hABxjl3J8P0dhFwaSFpuGrYs+uWHLVZJTGTObao/3k4R9yIv/teBZU5/08ZvQfGT35gfzyZm3tZ0TiIEaTuM9QeLjh8BjAKB5brFcyrAOVmklH8XI/KvZxb9Ij0nS78hhvAkR7tC8xj4rjV3yBEIjI3tdAzvpObu2Fi9IHKanRF8Rdgiedn3MC1tmhCLKnN/trB7jFdZo3K+rlMngMctWv0xW+VqnPohwSoiZlMVFyrtKH+LyTLwiNpZm+H41aW5OFK89P3ueukWOBkj9ycagfoCoIRDif1C36/hOD9cKYJr0Zd+7joqS6+UN5HBfF8K+CkcpXs00m+CJa8J8QCo1HyYdW+otsibZAcaGisi81Sg205krhSmz99v+uLgjnwmv6iynY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFpwRU1LSFdqOEErSExMUkM5ZVo5M0F1NUNZZTJzL2tvK1lzUEhLcVJ5Nyt1?=
 =?utf-8?B?K0ozVFVPTTl5MWxJSFJuMTRxZ2dWUmpleUpJZC9mOFNpRUlycEVrSnArcngv?=
 =?utf-8?B?ZFBNdUtvaU41VXZCcmsvVVcwbXQ1d05YdDlYc3RlUjg1SG9nbFpHU3BIdWND?=
 =?utf-8?B?TW1XUGVKcXlRK2hVRkpqRU0ySTBjbE1rejkwN1dLNy9zWDVhVGZudlN4dnRB?=
 =?utf-8?B?bmlHb2ZXTkFmcU81Rm1sRmRpZFhwZkZBTytNcFFWY3RJUVBHNVpXV2pIUCto?=
 =?utf-8?B?N2RiekVUNlhLOXpZZDYyYjlPWGpWUlpIU3J3ZGZaaDZqSHprbkJWb1R4L2FJ?=
 =?utf-8?B?dy81Vk1sN1NuMHdWREowQmdRaWhqTk01NDdBOW52aXdVU3Z2UHREc014bXhQ?=
 =?utf-8?B?dDQ2MnlVbElXd1JieGs1R25uRzlMcGZWV3A5alQ5OUZOa2FMaktPTnAwam1C?=
 =?utf-8?B?ZTJsUGxxdmU1dkFUTzRZQ3UzUlFKWnByM1hoY2lNUHMzbDZZd2dWeCt3R0Ez?=
 =?utf-8?B?dXozL0JubXEvVDU5cWZSVzVxamJKVVZYS2xmTk0rMUhicHFLaTJoVEpSRTNi?=
 =?utf-8?B?UXd2VDdkazZaQS9oODlIVW8wRTlwc1pjTnVMdXdHNmJkckk0TkZGdDVKMmVw?=
 =?utf-8?B?WllUYXRjcldzcGplVnR2OW1JZ2duaGthTG10Y3JlWGxqUkMxWW5YMUUyNHZv?=
 =?utf-8?B?OGVwK041YnByTE5JblZSR2F2YkE3ZWRTUzFPYWxHQUFBQ1JIS0E4eC9OalNG?=
 =?utf-8?B?M3dLZVE5Z1EyKzFITjRveW1KNDE4d0NBOHFTVDFlcWNEUis5aUNRSmVyUUJj?=
 =?utf-8?B?Y3BPRklZQmdCU2JrT0Q2WDBIc2kvOUpWRzBndjYzNlREUVF4c2p4ZmZLTS9o?=
 =?utf-8?B?aExacWt0MUtSUzRaTExOTFZtSW1jSXpnOTZDM0dIa1JkR2w5cC9va05yWFl6?=
 =?utf-8?B?eEg1bGlNR1Nab3N1ZFVHQW1LRjBySXhSaFJ2VkhlYWFPRjZ4SEZsa2taT1dz?=
 =?utf-8?B?YVFvMlVBREJveHd1SFpUUHRGZ3lCZGdNUEtzbDlHaEFTVjJkdW15a2k2RWxD?=
 =?utf-8?B?cWQ5UFlzRCt1azc2TmRKUkJ1bC9SUm9nbWtaajlQMkNveTllYlFxdDN4OW1F?=
 =?utf-8?B?bTRCVk5UNTF3SnVsZ3cyVFJoWkhmanhGZUcrTHladUdOWlFaQWQ2WCtXQ0dX?=
 =?utf-8?B?bXUwaXJlMzkxVUs1U2hCeHhxanVBVWtzT2dYTS83QmM0VW9zNjMwTC9YS09t?=
 =?utf-8?B?ZzhPcWJGRVliYVlralQxNi96dG9GTHlrcnkyd1Y2eGxyMkMydEtlbjNSclJt?=
 =?utf-8?B?ZEUvbGVUVldzUVRnRGEwbEV3THJTbmx5ck5mNUVlMzRVVWNjcE9NaEc2ZHpk?=
 =?utf-8?B?UVRvaVBBbE1hNVB0clBJaFZIWXFPV1pCdUFPMno1UFlnM0RJZDZLV3Baek1Q?=
 =?utf-8?B?NUZ6T1cvOTRPUy9wTmFhMlhJOG9hVFUwVGZpMHVuckFUZzFyTGlxRzVJenVN?=
 =?utf-8?B?NWZKYW1YbDNiMFN5NWlibiszSFhTMnJOYVpaTGJGQnRnUkc2Tyt2M2EyWE1X?=
 =?utf-8?B?WnZlakVwcjh0Tkl3M00wMnpwV3VGSUlqbnNMbjZ4b3VaRTZDR3FNQ3E1Tk03?=
 =?utf-8?B?L1hJbGZ1alNyZzhhOTdKaWpHeWhYZU9DVGM0WUNxdnprL3J1aGxFbFcrZXVB?=
 =?utf-8?B?U1JEaDJvd3ZuRW9XRXhxdEZ3YTBTMUNwQitvSEhlYk5pYThKMjRDMEdjQ21Y?=
 =?utf-8?B?Y2xKeW5Ra1ArS3FOZC9MK0MyNkdUQ3ppSVRkVWlweXFxSHUzTlNpb09QN09l?=
 =?utf-8?B?YUlPSm1HdkxqdlRLcU1SUmVsTE41K3h0OTRYcmkvL0ZOT2VJV1JIbTBlSlZh?=
 =?utf-8?B?d1J2azlSSWRNNzNhdGxYUnljTm11dHozUkNpYU1vMFJPTlhrZ2R2cnFDTFl1?=
 =?utf-8?B?eHRoVVJ3SWNDVmNXUkhMZDVTQXM3M29ma09TRVZ1MG4va1NXaFIyeEljOExS?=
 =?utf-8?B?UUxyaWZ5a2QzK0U5NG1TU0hDeW1NZjg4Wm9KZzRNNkU4ZVBtSFptTFd3Y09I?=
 =?utf-8?B?RFIyZ2pCOGwvMHRJR084TEdvWG5TQWRjMTVUT05jQXVaNGlRcWhkLzM1cXdF?=
 =?utf-8?B?UnUyY3N1SmUrbnc3MUIyTW9SOGhNVDBRMXZGdmF2UHJxOW9LN2FSbGFrazZR?=
 =?utf-8?B?dEdrbjBYWnZTNzFoWllhTWZ2emY4alZ4NlU1d0JvTVpwaU0vbnNHMWRqV1NH?=
 =?utf-8?B?R2luYnRNMWcycWY2OEZlWlJHWWdUeWlQS0s5VWw2dUdYRWtmSHY2b0Y4RGNO?=
 =?utf-8?B?Lzh0b00wdnBwdmZnS1ZtM2tVQUl3UlNQdjlpclpJblluUXZsWTdCRk9CVVVk?=
 =?utf-8?Q?7iPz5olW3SRgVpLg=3D?=
X-Exchange-RoutingPolicyChecked: lGAP93ReArrmCDX/usV15GhoAPEM34Es39WQ4SkWiDz49Bk0RYksoWCU34DYNsMoKOJh0u7RBRc+Xk7LVmdhjz9N4M1WtpXrBhkznwwvynrnoQxtr1WaaYFWr6mABCtMz8OXo8SiVN7uvP2bF5SoXzLoJWvxGs5rldF2CXGPpI9DE5bqOFITj+4paRQEjuS8AfBYzf0rph9gRsS2UAEFKIobYdhBPqHOHmo7dWZGzzu6Qg99Q9wF1fHdT0EA5kdYz1ZLk6cJk8m37ryRtmDOLP1BPQQ2tA22bY+3TzjYZZcnzNn67J5lepmKeTga5bmzVKQdzB7XzT+yMO7OOC1UGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53daedec-8a29-40fe-4392-08df04033a4d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:20:02.1267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vi1JwyUCukkXP8683K8tOSKzonZdTAK8G4mRYK/g5s++56uV4YxxORb+kDOnijBb+sr57zjIy1JWiUBeN/EI38gih4+09z11kf8Q9HL8iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
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



On 26-08-2026 19:21, Tejas Upadhyay wrote:
> Add xe_ttm_vram_offline_resource to track individual offlined VRAM
> pages, and extend xe_ttm_vram_mgr with offlined_pages/queued_pages
> lists and their counters.
> 
> Initialize the lists in __xe_ttm_vram_mgr_init() and add
> xe_ttm_vram_free_bad_pages() to release all tracked pages during
> xe_ttm_vram_mgr_fini() teardown.
> 
> v3(Sashiko):
> - Reorder xe_ttm_vram_buddy_free and list_del_rcu
> - Introduce reservation status
> v2(Himal):
> - Address possible leak in xe_ttm_vram_mgr_fini()
> - Remove unused dev and add comment for used_visible_size 0
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 25 ++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 38 ++++++++++++++++++++++
>   2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 16ecea497780..1253989a8d06 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -338,12 +338,35 @@ static void xe_ttm_vram_mgr_set_unused(struct drm_device *dev, void *arg)
>   	ttm_resource_manager_set_used(man, false);
>   }
>   
> +static void xe_ttm_vram_free_bad_pages(struct xe_ttm_vram_mgr *mgr)
> +{
> +	struct xe_ttm_vram_offline_resource *pos, *n;
> +
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		list_del_rcu(&pos->offlined_link);
> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
> +		--mgr->n_offlined_pages;
> +		kfree_rcu(pos, rcu);
> +	}
> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
> +		list_del_rcu(&pos->queued_link);
> +		/* queued entries have no buddy reservation yet */
> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
> +		--mgr->n_queued_pages;
> +		kfree_rcu(pos, rcu);
> +	}
> +}
> +
>   static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   {
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_ttm_vram_mgr *mgr = arg;
>   	struct ttm_resource_manager *man = &mgr->manager;
>   
> +	mutex_lock(&mgr->lock);
> +	xe_ttm_vram_free_bad_pages(mgr);
> +	mutex_unlock(&mgr->lock);
> +
>   	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>   		return;
>   
> @@ -370,6 +393,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	err = drmm_mutex_init(&xe->drm, &mgr->lock);
>   	if (err)
>   		return err;
> +	INIT_LIST_HEAD(&mgr->offlined_pages);
> +	INIT_LIST_HEAD(&mgr->queued_pages);
>   	mgr->default_page_size = default_page_size;
>   	mgr->visible_size = io_size;
>   	mgr->visible_avail = io_size;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 9106da056b49..dc97b0ad0e51 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
>   	struct ttm_resource_manager manager;
>   	/** @mm: DRM buddy allocator which manages the VRAM */
>   	struct gpu_buddy mm;
> +	/** @offlined_pages: List of offlined pages */
> +	struct list_head offlined_pages;
> +	/** @n_offlined_pages: Number of offlined pages */
> +	u16 n_offlined_pages;
> +	/** @queued_pages: List of queued pages */
> +	struct list_head queued_pages;
> +	/** @n_queued_pages: Number of queued pages */
> +	u16 n_queued_pages;
>   	/** @visible_size: Proped size of the CPU visible portion */
>   	u64 visible_size;
>   	/** @visible_avail: CPU visible portion still unallocated */
> @@ -45,4 +53,34 @@ struct xe_ttm_vram_mgr_resource {
>   	unsigned long flags;
>   };
>   
> +/**
> + * enum xe_page_reserve_status - Buddy reservation status
> + * @XE_PAGE_RESERVE_PENDING: reservation in progress
> + * @XE_PAGE_RESERVE_FAIL: reservation failed
> + */
> +enum xe_page_reserve_status {
> +	XE_PAGE_RESERVE_PENDING = 0,
> +	XE_PAGE_RESERVE_FAIL,
> +};
> +
> +/**
> + * struct xe_ttm_vram_offline_resource - Tracks a single offlined VRAM page
> + */
> +struct xe_ttm_vram_offline_resource {
> +	/** @offlined_link: Link into mgr->offlined_pages */
> +	struct list_head offlined_link;
> +	/** @queued_link: Link into mgr->queued_pages */
> +	struct list_head queued_link;
> +	/** @blocks: Buddy blocks reserved for this page */
> +	struct list_head blocks;
> +	/** @used_visible_size: CPU-visible bytes consumed */
> +	u64 used_visible_size;
> +	/** @addr: Faulty DPA reported by HW */
> +	u64 addr;
> +	/** @status: buddy reservation status */
> +	enum xe_page_reserve_status status;
> +	/** @rcu: RCU head for deferred freeing */
> +	struct rcu_head rcu;
> +};
> +
>   #endif

