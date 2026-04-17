Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87695F8E4AB
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 05:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6A210E28E;
	Fri, 17 Apr 2026 05:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbxZOilK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59110E28E
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 05:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776403055; x=1807939055;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uVTbTchN8nrB8XqxJoAkR7Rt9HEqZYeOC3NCc87uqVk=;
 b=NbxZOilKCGDdh/IpQLFQUNI/X7UQhF/khyBp52H9T2QzM1kluhqRYr3p
 d2fzmpG1V7NjABJWcsNus2bt9t/QU9Q1s7aO4qjH/iW+MGQ6DitYlwJXv
 JoQ0ItOvIdUc5iuHBNJpyXG5zOvoGPBhx6CIicWTUMDZfrjXjSJBJlz6/
 +H8+1KVLfpZh9+ExMD/Gp/195eQHnrtFrmDu27a9NszXJCTLxxvnHevUq
 4sfVFt25N8/ZMzfrCpae6H51/VVRsfZ9P+OPKBNxDdOk4/Jtn9iglWkny
 eyhs5AuhhICCkKPac7mLMxG3IcQJImzWY9FpgzUl/vIWnQ9ObT0fqk+l6 g==;
X-CSE-ConnectionGUID: 2xDW8biTRwCUVgIPgZup7A==
X-CSE-MsgGUID: xPlXZMJ0Tea8ftqO7NGWxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81294079"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81294079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:17:35 -0700
X-CSE-ConnectionGUID: f7fIxHEqQVKDYoHNoEE7Fg==
X-CSE-MsgGUID: yIoA8HsYSnajVG95qQcftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="254411416"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:17:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:17:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 22:17:34 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 22:17:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrQRXZliiHPN2wsXHGQmc77sf0DJpjjm2hADubnk58dMJKCRTBOq+2pNXYV+5XQGXKybp1d04s9ho2dxBagjrUtno2w+NyV2uDit09V7EYnYJUz2EL7WB/HQYGpVSla7JYX12eZVi9MYAG/Z7r147C1v+f6z/FUgDcCmZGe63Ws14L2I8IhIFtDKhv9goEnXuLtaP+Z/Wjg1SKRtvYIG9Pav5WLxq/66vl+FiRKf6puMtqLwN9gDhpAf9xnA/HbsiznLk+lbi4OEUO1TNQfNHrn4Nd3zYsXrVJQTAsly9j8lNByGnGL+xFWKs3as182VoP2CnqomAu50NgyeISZ1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zJ36GwBHqvS7Brfnuzq1lRoGpQh/MDWmQYEoKUNVlw=;
 b=fAt0o+uYTsUIin0xn6thRXV9PTbEKcX8hJ3OFh5FJIQ5AOy75wWoJa0kuJiDA3VuB8jN5xkFX/u7afx6uOmEY/C9s3i97PYk/RVXox/+ywZ0jj8BiI7cdLD05z0MMRWkAfE9qga0/Dow2UmINSNyCcsYi7RxtoxfFwYQTy7mXbXMUFQZ9klrWREsYI55PaJrt4vLxFsASKxxISgawjpYdZEsBaZmwLG4vbmrf5PvPzJe9HGOi5eN3xjFoW58K2Wz7fbnXzAiz7gxjzQCW62pN9GknPFD4nfaBa+Ynzeoymra3F0dbI5QzKsf4jzApPj6hyx0LSQOYYSjhQEkoE2Yww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 05:17:28 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 05:17:28 +0000
Message-ID: <daa3abee-31af-4721-8ba0-cf5949089259@intel.com>
Date: Fri, 17 Apr 2026 10:47:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Enable energy attributes for CRI
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20260417041456.818668-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260417041456.818668-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::17) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc64f69-3c5d-46ce-561c-08de9c409e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: nrWldpjgfnDdaD5lElpb8a2IFyaO97WUYj1f5ofl4uN24t/fLnOg+2E3JYpgwNlNBugn5W/yiV/1M+b5Nmn9gZlqjZlEowH/okj2ZTock/M01Dy5HCKiKRL5uxclKsuoomGX82sSlB+8bhqPoOF9PyDxRA19ai7MYXhYW5j6Fg7OxkWEekXanqmVNoKqHy98Aukg1Hd1th+mctppO7Ii9d/mG/JkCgW+RISnbDUAG3ouAT1s6Bos+uDOizmOiKkSYi/7LM1mtr4UhZ0dMz0gI4ksBanKnlNNsvgmOdNc4auko85oG32t618NCRbOsxtU2BEk0xyLj18JO+czgB+slJIJcnKpdQ9r7ZrCfWpPZuIHg0s/JwJ9b5iCdUQy0zqHId9PrVBGEGBrYeruI5F1hw/Rvcd1o/Y4U1otCS6qtz7BPStOE91OjRHxlLiL53E9QljZfulrNibxVc1jd+QSkMgzlubNjvwAwrt/WWyaKUlPrWBP/mZUBP5S43NWz0uill1o1w/unuGJr9Tlk5qypchQ7uaXjiKfvTgyalpbrRDiV3WO9O9e1MYYA7aiuLO9wqYuFfbMVNwnHxvxeUzzBFy7Zg+Ut9rZbW37U9Ds3WZFokoDE3kSBul3GCoYTzgiQKRyIddDjEnVz1XgmnOWSjCmN6RdLm6GHSUdYyaeRRwbJP4sAcKWK5QMMMPSoPphaKqtNaaqf8Sq/jCzixHaXhP806Nt7cJpSB6Kux4v3do=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0lNSStVWVJKNngvVDMvUXVUK09WZTV3WGVqNUxvSGo5L0pVV0w1ZmpTdUpY?=
 =?utf-8?B?V3dMcHlqWjdlVnhiV25VYmpWM1R3VVhnZkpFVGVDS1RRVmxxTTVVS1ptUE5J?=
 =?utf-8?B?VUdDNkdmWUs2Y05IZUlqMFplL0lWV2pYR252Q1BqTEJsWThUQ05uYXc0MHdG?=
 =?utf-8?B?MVpRLzF5TCtuTVJsajlNVzFwYjAwQTlGOTNMWVFrZ1VnV0lTY2Y5ekp0Q1c1?=
 =?utf-8?B?YTgrbjhUaVRSNDJwNVovdmU2bjNnQmRyQXNrZkUvM1Z5dmlwWkVrNys1aVFp?=
 =?utf-8?B?QVBoeDdHTXBQVVVQRkdSVlI1VlpYcmEvNTc1RGY4Sk5SSTJHYmhwZ05VK2hM?=
 =?utf-8?B?ZzY3MmF0a3lEZ0hRYjFkTnN3Q1ZhRHNtYnluMXhxQlJFOC9rWUQ3TVdOUUlE?=
 =?utf-8?B?OWdEbFZvTVU4dnVQcHkxVEdOeXhzRjJWMThIQ0tJSUZxY3hDMkFvLzdKSnRO?=
 =?utf-8?B?aWVIamhTb2thc3BwLzU4Q1BCemtQK2pyeXRFcjRyTVZYVXNxeTc5SGY1R3p2?=
 =?utf-8?B?ZlVHZExjbklkTk5TdjhBWG5aSVNzVXJtZW8wL2hYS28yNmtTeHptZjlSVjdH?=
 =?utf-8?B?WHdxYkNjemVFTHlNZXE0K1YxVEo5a2dKaEtEblVEMC8rUTd5aG80aXdvR1Bs?=
 =?utf-8?B?QVZxRDBYQmdWa2lVVmQ1blBMVHZGemloTWQ5K0w1QjQyYWp1WEZjSzdlUHRu?=
 =?utf-8?B?TTU5QnBLTXYxUE1vUUsrRjJabnhoSzZpSTJ3UTdySFRrU2ZQQko3dFhBRVA0?=
 =?utf-8?B?YWRacFFRK0VOSnlnZ2tDVDhYUzJPV1UxT3d5MC9GdDB1YzVRWDhKTms5bFFE?=
 =?utf-8?B?SS9YT05kWTVLNlVaaTBYZ05yQWNldSs0MVpPTXRJT1dqZGhhYTJQUDA1dThk?=
 =?utf-8?B?WXFYdE1PNWhEZEdOVGwwUmVmWHB4NUVyQkJKbGxYeDduYXduTjRHQmg2bFZr?=
 =?utf-8?B?U293MVU1TEdEbklsUlhoOG03cUpvamxMaXFPa1NiVTB2N3R1MnkrN211cmpi?=
 =?utf-8?B?Wkh6d0MrcERjYmJKOGNMQTBNUnBrNHR4TW80Z1hZUFlmNW5aRldES08wVHJt?=
 =?utf-8?B?YzROaEJFRlhaVTZPOHhjZCtxN2hqcTA4R094c1lhWHB3YU9JaHNlbHg4d3Jo?=
 =?utf-8?B?cFFmWkNtTlF2NjgycDdaZml5L3FZT01WTm5aUytMWWtoZ2psY2ZzVEltL3Rs?=
 =?utf-8?B?WnlQaGFuN1AybVdmeFJmdHRKWW51Z3FzenpwVE9LREQ5MUFxQkpxblZEOCto?=
 =?utf-8?B?dUlPYnV4cDJnejI0UEdzOTF2RHk5VmxOajZkUUZjMzVEMDdqNzRxaU1NbFRa?=
 =?utf-8?B?NmJCdURIWmlPNmZsbTRiNTdjQ0toK0VIMGF6ZGVvODlWVm14WHRCWmVrNGFw?=
 =?utf-8?B?eHgwSStQOEV0WEhwVkthdUhnQ0UrSitTY08vK1dkejNIUUxuTFBXWlVDckVL?=
 =?utf-8?B?QlFRZWIrdlFGNWxTUUgxeEZyWXdxcTZnaVVleXVuNmR3S1lFUy9XeSszUDd5?=
 =?utf-8?B?UUhCdm50NXRLaWl0NnYwbVY1T05oZmF4MnFXMWpWN2JTbmJ4eC9kQjJXQ1lU?=
 =?utf-8?B?NHgxV2xheExmcTkwdGw5MHFmMS82U1Q4VFhmcEV1bGVXY0Z0eEVBOFJDQ2ls?=
 =?utf-8?B?QU9XbDVlNWliZXl6bC9GOFZCZlZhcWtSTDJ3WFpIMTE5akZseXRqaEIxUFMw?=
 =?utf-8?B?OFZwZ2tYdE56SHEwM0ZWVTNxR2U4Uk1YUkorUml3QU9hVUd4VXpXLzJBcjBX?=
 =?utf-8?B?cHZPRllHTUFnVkUrNk91V2Q4WWUvZ3kyNXUyYVdSVHNGdDU5VWZ2K1Q2UnFD?=
 =?utf-8?B?T3l2SDJBcU9YWm9xZE1RSmlGcVBTb0YxMzFTS2I1S0ZkSDF3cmhRM2ZsNG5I?=
 =?utf-8?B?QWExaHF0T2JRL0tSd28xU3FNUGYxc3FvTUJtMU41Qnd6VVdHZHNFMFFtNkI0?=
 =?utf-8?B?V3lSTW4va3pxVzRuM2VaODRkS3JYQlk1VGNPa1dMVXlYSGFNNjdNRWVTSHRo?=
 =?utf-8?B?QkVUcXhVNEdDREJnZnNVS2dzOExZbmFNNUVOdVUrU0IrUGE2NWVNYkFwL2Zy?=
 =?utf-8?B?TlRZN1FvclF5NWZ4a2dJZW5qU2RqTk1RdzNIU1NhaFEyOTQ3NUpJMWZyQVVS?=
 =?utf-8?B?REttUVIyTlZSOWhDa0VIY0g0SnRnRXRqdVBySVQvdUJFUWxtWkdlYndtL0ds?=
 =?utf-8?B?YjIzOVJLYkk2alpReEZGUTZURlU2OHgvTG1kUUdHQTAvQjFPcnMyWnl1UXpQ?=
 =?utf-8?B?N05EbCs2OHFVYlVZVFhwb2Q4akVqVU1rRkc0R0tEQUg0K3hJL1Q4SzdFQThE?=
 =?utf-8?B?b2IrNlJXRlpmOFpoZXRWNld3akVheXFIUnhDbmMyY1ZBWDhZTWUvdz09?=
X-Exchange-RoutingPolicyChecked: uWgFks4zBm/RWdlQMTyge3k3gOz6biGN89+nxMW0Zi+KosMYGe+rUZ9p3TjgIS4/pGyQ0pDL3egmXjEqGHTfZ0dMcaMEQDbdfJM+5oLEgZ3HzBZWuk+lYfSdsfi/9/cD4haVeyq85C9pLihcUEZFzPFnPd5fsb0NK94IyoIxowwXgNfTZA7ISWstkezPuLm8Dl0fTdbAUK004CO0X0gUZXTGKLROsLTmcmKg8zFc9q9q5xnrsy42CJkz7Wk5mwFv++pXejyvxMqLAUP38ZwPQzzmU0Ezw+CZUKHBEam58mcuX5Wz9To6AEUI5wwZ76ko5taE+dE9gzi8a8ZQko4/aA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc64f69-3c5d-46ce-561c-08de9c409e38
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 05:17:28.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0rld7oKGbpiXd1iSg1/tCLKAY1D4SpEAuG7JPdecGDiOyInodH1vWc+aZTHLlnvOzsRUpqaUvAkLBo7dM2xqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
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

Hi Karthik,

On 17-04-2026 09:44, Karthik Poosa wrote:
> Enable HWMON energy attributes for CRI, which are available through MMIO
> registers.
> Although these attributes can also be accessed via PMT, MMIO is preferred
> as it avoids dependency on ocode firmware load in late binding scenario.
>
> v2: Rephrase commit message. (Anshuman)
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
>   drivers/gpu/drm/xe/xe_hwmon.c           | 7 ++++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 4b3c46eb858f..c63b409d7a82 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -27,4 +27,7 @@
>   #define   TEMP_SIGN_MASK			REG_BIT(31)
>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>   
> +#define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> +
>   #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0fd4d4f1014a..852681bdb84c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -296,7 +296,12 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   			return GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
> +		if (xe->info.platform == XE_CRESCENTISLAND) {
> +			if (channel == CHANNEL_CARD)
> +				return CRI_PLATFORM_ENERGY_STATUS;
> +			else if (channel == CHANNEL_PKG)
> +				return CRI_PACKAGE_ENERGY_STATUS;
> +		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
LGTM.

Reviewed-by: Soham Purkait <soham.purkait@intel.com>
>   			return PVC_GT0_PLATFORM_ENERGY_STATUS;
>   		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
>   			return PCU_CR_PACKAGE_ENERGY_STATUS;
