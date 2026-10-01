Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1D6CA5FA5
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 05:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F4210E0B4;
	Thu,  1 Oct 2026 05:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHXn5gHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E3D10E091
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 05:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790831937; x=1822367937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=48Y0N06I1ctKDdTzrHAxmsZoS3DFpUG7lIAoNteTByQ=;
 b=IHXn5gHzPMIm19DybGxkLwU5AI7qxpQA0N6xtNSEFWx7De528AWzUXkf
 BTBSXQc7VTJKNV+h4p1O2DMQ6zIi6u2xpOZRXpagtNdgJ9CV6ipl+vVxC
 FEWkU25BHcAxpBZHbkR1ujCcsdINXnT8njb48Pfam9YeCwtI1oFJFwvTQ
 quWzqwwf1mws/kbbTDt9HkDNjJav1To0wMIvdwijUo/1YLMY72fDj07Lq
 K5e7kOCmVDhNVr1ZaUpWlDw70IwQQiCahdBmMa6+SpRi7d7HpEg44uuq2
 oxoL9henLmgidMekwFQ5eljjW5c0FLKcx7q/a/RdyvyUj9ZZRXCUAFgI4 g==;
X-CSE-ConnectionGUID: u4D/zfwjSqWBuJO4qBdkJw==
X-CSE-MsgGUID: P0Z3QTayQ9qdPz1It/3OSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102954161"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102954161"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 22:18:57 -0700
X-CSE-ConnectionGUID: yoMs/sLtQsKFgBhZmUYDAQ==
X-CSE-MsgGUID: pgbEYRirS222LVuE4iDvEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276011298"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 22:18:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 22:18:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 22:18:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 22:18:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTY0+OVyMdghnCxr3RzXkhqryNXPvf74V4sFTpJIcbTXEnR7IyLsvN/2giqVzNHfBL8UpHWBPO4mPSEpIiCiuASgjdH5filivWR17OGx3wnjRUUJQTRywTNX3GuKfahBUzsIhcfJUm4aM3kM3ujJrSubwsayW2baNTuuqiVuaPleSA3KjfXYGKptXh6n6BRdoiKf7YznhWZLGTS5KdISnvQLn0K7U0/3AEaGzJgbjz/FW0U9DXkmKroGmGMEsuBTqwkheaywHlDkrnASQeMPF6h7BbPDoSiCfYa1KKt0zFWP7zwSFF9klbuVTOWMoV8O2HmhVFk6YYWfhYUkiNFLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHJY3SyYarHVn5YYmREdLQMjPN/HfOkMWQR+Pe9VCBI=;
 b=tnqtLQm0vyCcE5db5YWr2uKbRnyy0QlWXi6rwQmGFQJV7hS52s6+xCHKWYF6qwGKUhj0Yo+DhVwhrcd8CMCyfuCbPyznTC0grHuYA/ZbGKm1P7uBvZcUbNNz2W2nJtsRAsWdF5b0G3Mb15DgZHtPOO+vuDpbF3Zntie8gpVxwG18vnUKRTqtUmRGq/Kz2ju0dPifB6fnECr25Qxr76dS3C5gekbgNYYSgeqJMBbz6PsjB+O0k9aOKTCzBzieopq8izjVdWmnyePa4BQt3TaqV14JmFEDyA/eR5e15U9R+7FrfAtrHqoGSaUQiyvuF99vCOaauNR8vsRXAfTRr9Ylew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA3PR11MB9088.namprd11.prod.outlook.com
 (2603:10b6:208:57a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 05:18:54 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 05:18:54 +0000
Message-ID: <3fdc101d-721f-4fd4-9726-945a492ca327@intel.com>
Date: Thu, 1 Oct 2026 10:48:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem
 callback
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
 <20261001033602.3166274-9-himal.prasad.ghimiray@intel.com>
 <ar3cOOtIjX8wWWr6@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ar3cOOtIjX8wWWr6@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::17) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA3PR11MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 6643ae9f-b84f-4297-9461-08df1f7b7c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 7rgJ7WMv3B7je0yOkuozxx1BUc8QMh5DGgcIRf0FIOWWJX3R+9xq+s/pcpPUzpEJvFb+0N/lz8pnwv3r9QE8TOJ6I1IXGX3U84GqNgqYg82Aa48jdGBy3W+KvgwTCAP2J6ghOlp4CjKSP75SU+i3UkSvHQLTylw1O1H38JLIP3wUMfMtJ3covQVicFeTlFR1Zv0x4hILGxVLiDi6NiNE0DCirKA15QSoKTSt1pSYags2yuhfFNyR1QTpflreAJ9sOf/21B1Ui+cUdYwsZevwpEntoZ7RmB/EYQN+GnwRNVBT+ONr3z/iDc0mUME3GgmnRYqmYe/lb+LKl/Ot+hD9wAXX+Q2Kah7/hdcMYGajunwW8CoHQLpsdkeGFs6SIn2abgo1wqkyZtuXmfOZ7bGpRLMLVWlhHfDSU890gec0nNlX2xeo5JEMkX6OJTgn9ZZwsfH4VIduqe07hXGIj0+EaMOCc8e5a2hPLmng3UNUi3D55wJIRZZEkUtyns88x5Mbloy+pD6MP7q7dY9416TzkQc1wUctOo5IgQpTtk6HvioHCrdoZcY43LG62r4qq3zAYS9QyeHONJeDCLqzzusL53f4hvOUavs31tfXXKs6Nb0Xfk7LBe91WssiPKTFK8vzq/StbQtE0SW1YHiz83a91m0RtP+jiwpaIAFPH+6qsxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWtnSDQ4elErQVpiaXJmNmh2cVdQeEZ1WnFTbnQ3WVQyTnJUK3lWaTZKSjQy?=
 =?utf-8?B?cG9lRGFTWlhKb2Q3UnE0Z2xEZ3hIK3dJd1dPV1RYOEo4dXdyZ2ptOFoxQ2lC?=
 =?utf-8?B?V0l1QTEwbUZlcWNMdEhobzZDYlZtWWhnTEZkQndDdWtmVVFxLzdrOG5qQ0oz?=
 =?utf-8?B?Q2g4L2thYUZWcVY5UnZ4K3ZNZkxTaG9xNVpXTFhxRXRkNHlwM05hMnorUnZv?=
 =?utf-8?B?bmVpQW5tb0gvU3J1amkrQzRFcUxXZml6ZU5NZ1JTQlRpQmF3Z2JYUHR0Yk1X?=
 =?utf-8?B?NlU5aFE0SCtPMVJBdS9nZ2Y5NEE1OFAvU3hhNC8wbGQrcDdpNmpIMlpQZnQr?=
 =?utf-8?B?U2hMb1pJSFJaWUQrUmd3NFFGVWVXZVlKTTZQKzRaa2wwVWRHMW1EbkFnVEwx?=
 =?utf-8?B?NnlibGFzdTZYNXNOcmIwWk1SUFhHRk9SZUdzenBHVzkwQk9kQU9OL0cwYUsy?=
 =?utf-8?B?cVhDbHUwc2VGcjlXWjJWSVFRanRVcm9MVHUxdmhxckxZY2hxTzh6YlhBbGRi?=
 =?utf-8?B?RWRhK2UzMDFndEtUdlFVSWsrWko4eDVPWlM5Si9sVVV5KzhJVmgwVlVHSGhS?=
 =?utf-8?B?aEtadDUwUWpXUWc1SDVsbHBGZ1MxTkduUjdrY1N5eDZnV3FKc0YxSG9NZlJj?=
 =?utf-8?B?UDV4bElPSXhLcE4vNDlxUWR6VlJPb0V0KzYvUFF5VWQya2hMY3p3cXB5cHZl?=
 =?utf-8?B?Y2NzWWNYb3ppa0NkVDB4bW9HUnlzeHhOcnJxUmppSSt2OWhrbjBIYldhZHVh?=
 =?utf-8?B?QUFpOWFBZ2Y2eWlzSVljSnpsNDk0YkFXYkhyU1FtU2o0VWVSSjAyN2dXaXA4?=
 =?utf-8?B?UXdxRWdwMmxWdzNlUitTbUlaTEliM3BnZU04MmdvL3krUmdTakVGcWxzOVlq?=
 =?utf-8?B?TjBJNUdXdThLMk9NUjIzRG5pc1JqWXdzZUpBdURWd0tPeDlMQ0hZRWd4TnF2?=
 =?utf-8?B?Njdra0s2bDROQjVQUkJvdmxRK3dGL3dWdkVrVHo0ZE0zMTNjYUE3S0dPQTNR?=
 =?utf-8?B?aDFHaDRDVGExbnVFMUxZRTBnaXJ2S3ZrMjJxaFp5c0FjQzlIdmYwUXpNY3lM?=
 =?utf-8?B?TTBYYUlPSXNhczY0SEpRQ2pzUjBLdmhPMVpiTFovS2lqd1lwenV3WHd2cFZl?=
 =?utf-8?B?ZjArVHNpSXhGaHFNK3hXVkxWMUZmcVd6MVNNQ0tFbHVDSXpTQ3paelRCM1d3?=
 =?utf-8?B?bVFVZmppa2JHQVRNY2VXVDQ4WHBSQVl0b3VkNkVZOWQrTUlEd3BLZXgveXJy?=
 =?utf-8?B?QVplaDhkWEFualp3d25aUjMxOGJ3TmxkcGNVb09DSWY2aXA0SmRBd2NFUG90?=
 =?utf-8?B?T0pmdXhSZDB1NDlzR1pLcnJWOWJlaC93YWo5ZE90RThJQnZLNERsNG1UWUc1?=
 =?utf-8?B?djdzMnduR0M2clRBeERFNERybUFyTGE1UkN5TEkzUGFyZlA5TjhGc3c5MnRB?=
 =?utf-8?B?L24wa0IxTFdzUkdxQlU5VGFaSTFTWTdwUjFXZW1uaTRqQmJXTW9vdk9seTUw?=
 =?utf-8?B?a3pMUzBweUNqakNqR0dOaHp2MUI4S1hnOFd6dzEvaVo0WGU4T0VabTkzbFBo?=
 =?utf-8?B?ajVHWTQzR2JlWURxRXppODhuZExIVm9HQzJMd25NVUdxWXN4MDBMUU5XbHIz?=
 =?utf-8?B?Qk5YYysvV1JCWHB2cnJSdVp6M1JQYmptNm9sTUF2eUJYWWZpb1NWWlhCcjI3?=
 =?utf-8?B?V0hJMWdJYXQ1azdJWjlROXZqZCtVZUVUaUFSbnN6UEFjWFVvY1RYSXA1ZDln?=
 =?utf-8?B?NDlOMm11WWdkY3FKT2w5REh6ckFEbEhQdGJqaHBVYUdsS0d1SXlTck1tUzdi?=
 =?utf-8?B?ckdmbHNWQ3hscUJKZUd0cjhtSnI4Y0NjU2RjeWZYbWdLcmNPMUlDWHVjdVlW?=
 =?utf-8?B?dlk0YUdLU0pyZWl6SEdocEdPTXhPZnhPUUJ4MXkzbzF1dXRIRGxBbGtodVN4?=
 =?utf-8?B?M0pxRmw2M25uckk3ZDZVYlAzNUppc2RhQzMrc0pWVWF3Zy95ckF5aGYrQVFL?=
 =?utf-8?B?dkxoQzNCajUzSW53YVIzWXlZOFRWV3JIOTNVMi9SOVhKOG1sdDBPZ0xBVDVk?=
 =?utf-8?B?RmwxLzhIRUVjWFpmbFFQK0lnenNqd3ZxZWVMdFlGM00xOThwaDhvZER4YUhp?=
 =?utf-8?B?V1l2K2xrelY3bHAwbWtJYzFyei9YLzhRSkRxYjZ0dnFZK1lIZFNKWi9HK3pK?=
 =?utf-8?B?Y0NuTVZndHV4cHNNRlZhbEpCZld0N1liUTdwZ3lrRzYvZzE4RWtKSjJWTklF?=
 =?utf-8?B?a3pJdlBWbWhadEZVaTl2SlpUOEplODg1TEl6QTMrY0htWGpxSmxOWTRpcUEv?=
 =?utf-8?B?SldsZXk1YzE1T1AzMSsxd0RuQ01yMk1weGtsMUVtSGY3UnRsejRLdWd2VkQ2?=
 =?utf-8?Q?E0RJJchNvmx/2Ksg=3D?=
X-Exchange-RoutingPolicyChecked: SS8NXfW6h+WlbRoK3LOqsBblLnySImGoTCJ0zg117pTy188JHBk4iJu+V5O53w3qcnTa180UsV/O8Kacp6Pzyy6DgE7gjwb8DhTT1kQ4oj66ROgdiBdDGMpzpMZnJA7WXhIgT6oZB48+YqD+iwWFITWb1XK3QIPdWnkxmxpM4KQk7f7zJs26GqfS+0+EJG3QUMv5d6z76t2C4gl9lKg/ml+eYwMCRKya/5pqd3gxs7h07k60KZI9JSIQee4Zt0T8IShvRUfNRABurJeJkQMuO5LriwayxZeg8vsLuLsIMbvamkLi/yqL5GrPkf0/RIhniQyLntwov7mKUBZbq8XWjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6643ae9f-b84f-4297-9461-08df1f7b7c88
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 05:18:54.4123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0IsPchYFnsZeEM3O/XINDj5s5r0Gco4/YOS5CSDynr98dq56x6YkadeRN2J8V4S38VPA9/LWHefiY8vCvQnIwycCD8Ct5K36YNGUTYg2ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9088
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



On 01-10-2026 09:36, Matthew Brost wrote:
> On Thu, Oct 01, 2026 at 09:06:06AM +0530, Himal Prasad Ghimiray wrote:
>> Add xe_svm_devmem_lru_bump() and set it as drm_gpusvm_ctx.devmem_fn in
>> the prefetch worker so each backing BO is moved to the LRU tail during
>> get_pages.
>>
>> v2:
>> - Guard xe_svm_devmem_lru_bump() against foreign device-memory
>>    allocations before casting to xe_bo: return early when
>>    devmem_allocation->ops != &dpagemap_devmem_ops. A shared
>>    device_private_page_owner can hand us another driver's allocation.
>>    (Matthew Brost / Sashiko AI review)
>> - Add stub for function (CI)
>>
>> v3:
>> - Guard xe_svm_devmem_lru_bump() body with CONFIG_DRM_XE_PAGEMAP; it
>>    references dpagemap_devmem_ops and to_xe_bo(), which only exist when
>>    PAGEMAP is enabled. Fixes the build with GPUSVM=y, PAGEMAP=n.
>>    (Sashiko AI review)
>>
>> v4:
>> - Fix xe_svm_devmem_lru_bump() kernel-doc to explain the locking (Matt)
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Sashiko comment for series are theoretically possible with different
> coherent devicesm one of which uses GPUSVM, another of which does not
> but I don't think we need to solve theoretical problem today, nor is
> this in scope.
> 
> Himal - go ahead and merge, ack on doing this through drm-xe-next.

Thanks for the Review, pushed the series through drm-xe-next.
Himal

> 
> Matt
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 34 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>>   drivers/gpu/drm/xe/xe_vm.c  |  1 +
>>   3 files changed, 42 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index f39e647512ad..d07dd95ab451 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -9,6 +9,7 @@
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_pagemap.h>
>>   #include <drm/drm_pagemap_util.h>
>> +#include <drm/ttm/ttm_bo.h>
>>   
>>   #include "xe_bo.h"
>>   #include "xe_exec_queue_types.h"
>> @@ -1625,6 +1626,39 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
>> + * @devmem_allocation: The device-memory allocation backing the range's pages
>> + *
>> + * Intended as a &drm_gpusvm_ctx.devmem_fn, so drm_gpusvm_get_pages() calls it
>> + * under the GPUSVM notifier lock. That lock sits in the reclaim path, so
>> + * dma-resv cannot be acquired blocking beneath it; dma-resv is also the outer
>> + * lock of the notifier when memory is allocated and migrated, so a blocking
>> + * acquire here would invert that order. Hence the trylock. The BO is private
>> + * (dedicated dma-resv), so the trylock succeeds unless the BO is being moved
>> + * elsewhere (e.g. eviction); a contended BO is simply skipped.
>> + *
>> + * A shared device_private_page_owner can hand us allocations backed by a
>> + * foreign driver; skip anything that is not an Xe BO before casting.
>> + */
>> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
>> +{
>> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>> +	struct xe_bo *bo;
>> +
>> +	if (devmem_allocation->ops != &dpagemap_devmem_ops)
>> +		return;
>> +
>> +	bo = to_xe_bo(devmem_allocation);
>> +
>> +	if (!dma_resv_trylock(bo->ttm.base.resv))
>> +		return;
>> +
>> +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>> +	dma_resv_unlock(bo->ttm.base.resv);
>> +#endif
>> +}
>> +
>>   /**
>>    * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
>>    * @vm: Pointer to the xe_vm structure
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 2ef4ef026ccd..585ad64b672b 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -128,6 +128,8 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>>   int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>   			   struct drm_gpusvm_ctx *ctx);
>>   
>> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
>> +
>>   bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>>   					const struct drm_pagemap *dpagemap);
>>   
>> @@ -356,6 +358,11 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>   	return -EINVAL;
>>   }
>>   
>> +static inline
>> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
>> +{
>> +}
>> +
>>   static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
>>   {
>>   	return NULL;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index ea5bfb307db1..986e0ebfdacd 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3246,6 +3246,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
>>   	ctx.devmem_possible = devmem_possible;
>>   	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>>   	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
>> +	ctx.devmem_fn = xe_svm_devmem_lru_bump;
>>   
>>   	skip_threads =  op->prefetch_range.ranges_count == 1 ||
>>   		(!dpagemap && !(vops->flags &
>> -- 
>> 2.43.0
>>

