Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4E6C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 16:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A11110EC1F;
	Fri, 24 Mar 2023 16:54:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB42D10E55A
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679676859; x=1711212859;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SMBV2c3nFKkKVKPC1dNIxiz1pukZDuuGmjuYz1aGZaY=;
 b=nPzxgkBFHNzND4PHtyRIwHHY3VobF2p6vMUqaS7gDpAnG0xccTzVcX+8
 mHxAzTJYqpSDFtcrzXavtXnil79edqVFkdMv2JAVYpBpCFq06YQPzjrrs
 p4KHD4Yk1c2yWeFaO6KVDlF+pqwdVFIfhl3DO4vStQV8QNGWv5gxiGdAU
 rKJAWEbNtkL+kzMHzceAGULFFhKiOAntsBYltV3BHyLBqGiuCs9EtrnHs
 +HbqNH9nyisXPu+bwLXvhtCOAORiofhlgTYFcAVL+J1sYn0mzupk5MWjn
 2xh3OaOCtPHG7vzWSTVq35Fp+EDUFKTA8hVt1sU4Z7DTxtmuARdHjNPQm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323706653"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="323706653"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 09:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="793515668"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="793515668"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2023 09:54:18 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 09:54:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 09:54:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 09:54:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEFyTviBLgZPG9d3M4KEC3PbVEkC71r5Suz4mWPqocrgi+v/PIrRFFBlP12l+3a7exPVpdQu4/Z+XCS3vR1bzRKcqTKvywD/d2McaYMsVsArfTThBVdY7bIah/VnHfi3JBu704J8nPGHJtHFhx7mOyUUNzTwV1KhaC2FpU0fxVm2BIzB6nMaCfcpn8oQNZZxZftNouwZuktOEoGDuC66ZsTvkxK9W5miOGwXGw/aPh1rWB3t5rKtpkv+39fllSDcfQpZzF3rX04MF9To3MZxVa20IR1uxdGNRXU+AyNlCdSdxF5foZvWOd2EkC2CLhFMdAw6ZAlwl2alzNFzoAC2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Htd03HiKPbAAyIYGlZwGQlEYNzmwZDHMvwv9XiEFd9k=;
 b=NRfR+tgl+v25EV5V/+t4OYISGSeuZFbd6FatiW4bYinEFHAjdsBqyoTb6BgdURMzhw/WgSxD0XX+VtzN+UiyLUJGMtrVDFWIA7Z+5cwTyXzcSZ3j628bmPCb+GHiBgBYwNOV39IjiKgacI8q3LO+Zoaj4Xonocv55Ka0Q9CqHQ2W8WoBhx2nXoWdjEpQT4pLbuvadIeE61hSYVdwtfCAIN/5M/zvXmku/QfBtG6aYC/2qz4Xo/aUiJjO5yEShsLjHI1r43TYAsSMIxHiqcBVojTri55S6ei8/psfzP5iv0/OCZTlsfU+5lfmF9+kbE8S0sX9CK4QITqbyvUM3kRj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 16:54:15 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 16:54:15 +0000
Message-ID: <9563684e-90c4-6b39-1951-9fd0ed22f2f7@intel.com>
Date: Fri, 24 Mar 2023 18:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230323115926.391900-1-matthew.auld@intel.com>
 <20230323115926.391900-4-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230323115926.391900-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0136.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::15) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|PH7PR11MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b20a74-900a-4205-a234-08db2c886699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0q3v7KBYv2vNPQFiI4O60C2mwDNn85enSPyBijRg4qpr4k+YkeF8uM8voQ1HF2Xu/LJI/DutekQq7GIB9qYwcrGYvyNY0/MN9ydbWy+MIHnSnh87ieP3e+Sn0CLY8HLOmAvSMKmh7ZU602fuK/cUWWxnD2ED1wgKgrsEcAj8B9n8HY4K8MssjwaWUtVHaTdzy2jL/EnJM0/Ue0BHRiwbe2J/sKyflinCzwAMkreNdjgehQRC4t9CvaV6Ric2svwlyTrhgx4A68q6UJRDJKKa41tu6PdqwCk+vsLiyueXwD1vtPg4f4YD0aSiq55XxOEr8JdRTtrz9/JO/uz4qUsYnTCBWdoVdg4mW+Y72PfNWwYshfUluLpm6Y6whHtTsObLFxdTtO1BRWq/Upo6+8Qq3ZiSusVQJBQcMm3GBDVtz6NRMV7ttW7W2bZ6tpoC89SxTpjMic8iSKhFQTb72wFi2rJ3wBf3+l4ZmZ6z8+j54+SHcD15ZGHS9xzLaOzt4Ziu11k35U5YVFd9MWrSqqotrXNES3n8NVJOy4WaJTjkbcRtEOVhp5ZLUCwb7tCwjjycO0xUkp0GV73SpAppe14B1q1p0xMdyFrIhQbcMzamof7/9obAC9PVfzCCcGBu35nx6hMO/SsKi9wbQYcPbZENyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199018)(966005)(6486002)(83380400001)(31686004)(53546011)(66574015)(54906003)(6666004)(41300700001)(316002)(6506007)(26005)(6512007)(66476007)(4326008)(66556008)(478600001)(66946007)(8676002)(186003)(2616005)(15650500001)(2906002)(5660300002)(8936002)(82960400001)(38100700002)(31696002)(36756003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzVqRldQSVBxdHA1L2sxUGlSandvMlZXdG9GMHp2bXZkTnpSZWJUc3MrZm5P?=
 =?utf-8?B?c0ZvMXVham9OVnRnMEQ5SHJROFJGc1NUY29BcFROUUd6MFVVb1k0c045MFlI?=
 =?utf-8?B?N3pqNE4xMmJCV2NyR2lqWkRPSmYrTUVEOEpYemcxZVd0cW81bEVVbWs2VWxJ?=
 =?utf-8?B?aFRVSmNuMTJ4MVRITDlZd2Z1OStjMmtaU0pEcXNGUHQwbDYybVJ4Y1R1ZWFi?=
 =?utf-8?B?QVBFZ1Vlc05iT2dXd1lKSjMxd1R0QkVOYUpiK2JFbzEyT0prbHg0MEZqRTFt?=
 =?utf-8?B?VWcyeWxIWVFBTy83emEzNWxEOXkwUVpvT0JLQWdtSzFLNS9Odlo0eFVIS1d5?=
 =?utf-8?B?OTZiaW80eHE5OWYxdmlFOUdEby9QdGpTMFUrakttNTRyaVRkSithWlFoOWlB?=
 =?utf-8?B?ejNGcU1tdkZIM2ErUHRWcW9FZXhXMnVhVWFRaUJSUFE3Z29weGU0eElud3dV?=
 =?utf-8?B?bHFwWHMzQ0UvYlJPM29Ydk1nWHZsaUtBd2cvM1p5K3hJejBmVUFUVFJKdm1n?=
 =?utf-8?B?SjVEZ2VxZW5SZ1ZLK0Q1SzBtK1J0c3RiQkxVQS9NQjRtR2hxbUxsdHU1dUtu?=
 =?utf-8?B?VXFjdDl5SUhVSVRyWFhLN2ZyL3MvZHZYSHBLUWo1YzlVU25jV3FPRnNnZGpo?=
 =?utf-8?B?TVB2N1pzWFIrQVhncGcyV0dSMFF1cjlIT3ZLclNBKzhrL2dhYm5zdm9ZSzhk?=
 =?utf-8?B?dFFZZEplMWppM3BJZGlXTE14NFhWT1EzVmdFa21tcUhiNk5OMDZwVi9saFBR?=
 =?utf-8?B?Z2dyL1dVUk42SkF5SzBiK2VYYkJnWWJMK1lISm5MSGdKZVc4QTJQRU5aaHBI?=
 =?utf-8?B?aFNIamRHRWkveEpuTTB2NU9WODczaU5aMUNQbzZRaTJFYnVEMnBHWXhZSnZn?=
 =?utf-8?B?SldEOHU5dW1wejU1SnBsTTc3MHVwZW9jTVRWK2VQTTArV1Y2bjhDR1lmUmFh?=
 =?utf-8?B?UmlTVFVGenF3ZDVzSFNYd2FpcmNVVEY4cXhvbG9pemJBRjZvSkwyOWIvdVFU?=
 =?utf-8?B?dW5YcTV6ektSa3FNNXpwMHg0dTVoWXBPR2ZZVmJXSml4c0xlN04wVTRUTDRG?=
 =?utf-8?B?QytjbndPREM2dHd6VVZHckttU25qQ0MzcVVIOXNKWTRCbDJKb2F4d3AxSHAx?=
 =?utf-8?B?SUV3bkxxVjJZUDg4UXhFdWFzZ1FRUjRLY3VuUWx5NGQ0cTlxcTNLOWpoMGRi?=
 =?utf-8?B?M3VoRURub2JxcWRSK1IzMFBrd1RZN0tyOTBLZkZpcHVoanhTOWFnVDJEVWFT?=
 =?utf-8?B?eVRVbWY1bURGL1ZobklBa1NNZFZlcDNWZ1ZXUnZTb2ZFbFNFWFFkSGRGMi9B?=
 =?utf-8?B?cGZKRFZ4OEU0SFVROU5wb2tONEtSK1VaUDcwK2xpQWZ6Y0RZUTNPMXBXYyt1?=
 =?utf-8?B?cmRxcmpwbWY2TnhXRjJDelpnSDQ4MjkzNWl4Tll6ekZ1SW91OXl3UnUwN1RI?=
 =?utf-8?B?RGs3K1pRV3R3dlFTaS9oRlcvck02L25ZL3kxWlhkcVBXYlpCYU5zT2kzb2k4?=
 =?utf-8?B?c3BVSHZiZEpDbFI5ZmJKUWxpMWFSb0xhbnRDR2JqT2c1cGtJdTBUdlkyU040?=
 =?utf-8?B?NjdVS29OZFIraFEycVhqT2tnUlFSNjVPbFN0RFIzdWpJSU1DT2ZmbkFSUm96?=
 =?utf-8?B?L0x2eHFrbEtHdkpCMS9EMnJXdzlLWHFFUXFtQ2s5czE0aUdTWkJyVUVjWWVs?=
 =?utf-8?B?b2VDZit3TENrVFJnM1VMb21iS1U4RENScnoxcnhrdUVWSFU2bSt0UTkydktI?=
 =?utf-8?B?RW5SNDRMMDJTRngwbVorVU5NckRFa2xIVEpldmdnZmJkb0ZoYXV0a2swOUgv?=
 =?utf-8?B?WktKWEljWUptRWtmREhaQWZpWDZVYmlvVTkvVnFvNHJ5TUNaWTFsekRHZjhU?=
 =?utf-8?B?WDlDaUNITUs1MFNxdG9qK2U0Sm8wUEMyaXdkUDJ3VXlLQkh6dkxKTk5xQVZi?=
 =?utf-8?B?MGN0QmtjZkJldElNb2xha3dPOUdkbENhVXJReHhLVHIvTXhkNDh0YXBzakdy?=
 =?utf-8?B?QjR3YW9JZTQzQ1h6VklEYTZYdzQyMHl1T29sK3kwa2pTZGRjUmFtNS83YU9v?=
 =?utf-8?B?eDhKY2dBWmlORzF2dkM1Yml0c1o0NWczTGxJSVFmazU4bW8xa2NCRkljcDlq?=
 =?utf-8?B?OXJma2c0cjBZSEFVWDkyNFpIckQwTWdQVitNMGQ1YzF0dWp6U0FZaXg0c1BJ?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b20a74-900a-4205-a234-08db2c886699
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 16:54:15.5637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2WxJmKg+6IPK8QUrnEMStIGsV2+DFx0Qf1V2Jp9mLZCqQcpm6n8vV41lwGuqzPKeZ1VvzE/TvKOAVzR1h3NXthSgZs0s6Fg6Fy/fA7JB0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/6] drm/xe/query: restrict system wide
 accounting
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
Cc: Filip Hazubski <filip.hazubski@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

looks good to me.

btw, it is similar to the constraint attribute described in this article,
https://docs.kernel.org/gpu/rfc/i915_small_bar.html#probed-cpu-visible-size-attribute
do you have any plan to add a small bar related doc for xe?

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/23/23 1:59 PM, Matthew Auld wrote:
> Since this is considered an info leak (system wide accounting), rather
> hide behind perfmon_capable().
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 0f70945176f6..9ff806cafcdd 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -127,7 +127,10 @@ static int query_memory_usage(struct xe_device *xe,
>   	usage->regions[0].min_page_size = PAGE_SIZE;
>   	usage->regions[0].max_page_size = PAGE_SIZE;
>   	usage->regions[0].total_size = man->size << PAGE_SHIFT;
> -	usage->regions[0].used = ttm_resource_manager_usage(man);
> +	if (perfmon_capable())
> +		usage->regions[0].used = ttm_resource_manager_usage(man);
> +	else
> +		usage->regions[0].used = usage->regions[0].total_size;
>   	usage->num_regions = 1;
>   
>   	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> @@ -144,8 +147,16 @@ static int query_memory_usage(struct xe_device *xe,
>   				SZ_1G;
>   			usage->regions[usage->num_regions].total_size =
>   				man->size;
> -			usage->regions[usage->num_regions++].used =
> -				ttm_resource_manager_usage(man);
> +
> +			if (perfmon_capable()) {
> +				usage->regions[usage->num_regions].used =
> +					ttm_resource_manager_usage(man);
> +			} else {
> +				usage->regions[usage->num_regions].used =
> +					man->size;
> +			}
> +
> +			usage->num_regions++;
>   		}
>   	}
>   
