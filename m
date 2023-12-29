Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D81EC46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D033F10E2D8;
	Fri, 29 Dec 2023 21:15:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4649410E2D8
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884538; x=1735420538;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yiSGSn8DJE/W7KGovQDu3Yf4gzchKTGI4xCe+wVv3hQ=;
 b=Je8d7jDxfKFCWi2Us3FXPe3IK9zYCxuHosr3wB07tQE4KllCnfAEb20z
 LcPWgUFf1DfiJBdv6nm2XKytVfyOZZjWjljm2wjDXoVuazyBrrmmwafrp
 UfuMzkaNhnrbrLv+iOb+op99HvvKR+bwmXLSiIo/qWqiTOwxaklc23aPZ
 YdJ2CIlPSN9cRSJVIvJFgEnO1k7LY7T0FXWK5OWtOBA1t0mE9d9LmXudV
 N5UQPH2NjppHJXAvqMpgYiV7pig0w1DTHuT7wSI1cCptgDt4COR6ruKNL
 XjrBGIWP8TbKM4wiXeIZ6wBArtpQo31VWT3PspFKSgmLxt9s9BRIr/DC+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="463088789"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="463088789"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="897611381"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="897611381"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:15:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:15:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:15:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:15:36 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:15:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF7hIkt9jUT1HKRsKdq6oBaHDT7zzFK0G59no5jj9Mlwex4x3EQrn8ZzoLwjkuHMYcoaYhH96vSwuah3Fhn60MU167yjIh1MVm2hkKMlVFvMtcyVzzRDQiuD74lwonpfnxosoLSiXUMuf5iim0s5//xQcR0NfDh15DqKg517zuGIbcujMc0WkMeYpejtq7ULrK9UVV8+6PGIALVb0hUSnY899eZTEosnOZl7JHrtUgM7lSlP2SNpwHjTwvD8/tsFkaT5OlAZxZRwokvj/+s7+DPC3x62lJ12xPXP3qMMVeppmssS0+T25cRhum/xVk3IRNeUmA3XXTngGA+/CRxbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/+Baf6yoPSg6/hzWgheCcrTO9xjzxxMDH2hvl8dPaA=;
 b=RGecjpFgTc0Hhx4Ej2viXK1Zkws7F+XqxAMhj5Yc3W6OA/2LokVu3zDGyXHzY3/uyygmWuIHtXMdP+3iQtXpdPq9hWtgGGy/Nch1uYIBMBOc/RAT4YlNLj1/QJV3tUmsnB5vnk7zQz1PpaiqtyV+7KlZgVMlrvNotP/Pqmv7aAzLAVgiHF6xy6rIcq6nWCnobx4anXp3Bn9SKb9VF0/nhXfYM14J1GM2X/e4AXaupguUiz9Hm5ZmAxiTcQIZ0qMX7pMh8K8xEjHu+LnFslBW47KTxJTS4drMbuzhyOaYJoenAphY3qKMwOWUIOc2K+/RurLEcTP86ay0LqHsCP4uuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 21:15:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:15:30 +0000
Date: Fri, 29 Dec 2023 22:15:28 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 08/10] drm/xe/kunit: Allow to replace
 xe_guc_ct_send_recv() with stub
Message-ID: <20231229211528.iyy2vb766xfjlaav@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR4P281CA0290.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c9d96d-b336-434e-c323-08dc08b34927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IiMRF9RLY9ntb2mdDjr1OuHpEzNJwFzti8sE7hmSpVYLGoVRIJNLzavhCf65xO4dSsAFOt33RH4L4JLsbyjtWZz79FZXr03TL2eFVubqEIKRqouXIqRWepbiEorKc/ECd5a/UoVE+06GtYzChkcaXTPOrdHaf4KY+5kOaNrGQ2yRu1jfsgVO/xlmIiRfSwaP57hu6HaBS1ORZq+4CI7Vj6QpjDJBIDMzrxLwA5xsR390HEOb3ho1gsTYHvIcnPjQHDhO+jySkEpvI/1QOrSRwj7QUlK7+5gcaZNDywnJ4ox2qf8NSIxALkDBxl8/EwH5YiksqLS7AJJFATt2bzFaZ59DOHsJgUL/PH/5t3yofRG1CxXgG8W8NLMCgtOw8CsAAdsXQ0y/mrvWmqYmTUIZq21DSj1ic9jdyO4Mr5k0MOfdDPdhjRFss6/9Jdi3PMkVq4MdUzpLlqy/6sIAH1VO5qUGJYHDNXdvS+4WAjPd4pWfkvb5wN4Ox1doTKKqa3RT7aw2q5ESoQtfIg7lE9I9HWF7+Br5M45uPk922d00ZYDr4LtWzHwj97TLmA22Ao4G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(41300700001)(2616005)(26005)(86362001)(1076003)(36756003)(82960400001)(2906002)(6636002)(37006003)(66476007)(6506007)(6512007)(4326008)(8676002)(6862004)(5660300002)(8936002)(6486002)(478600001)(316002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFNeFErNXVFRFBuYkxjVnJ5dmR0R3hlMXpQOWhmaXQxMWNSTzgycEtyTjgr?=
 =?utf-8?B?cEJEOUhwMDBuSTlZWEk4eGtiYm9GV2RNWks5Qnd4Rk04SmNjb3JmVndMVE5Q?=
 =?utf-8?B?TnZ6QWduemphbEFNMkRpZFdSUS85VXNCMVdId2tuTFozMXdZZGFHYXVYVTRW?=
 =?utf-8?B?T0h3NFFvM2xybndNaUVEdzlZUnRFR2hkK0JkTTh3Q3UvbDlreUJaRzRqSGRv?=
 =?utf-8?B?U1phNU1kRWpNdHJQemNzK2pJYkVlUGYrT1ZTUUFTTG1heHJoTW52YVhkR0Jy?=
 =?utf-8?B?NWVXV2h4REJPV05qdTZjVkRzY2lQQnlSaUxSVzRVN0cvc3dGRVBQc205NXlO?=
 =?utf-8?B?bWZ3RE9TQ3hITmxsZnVKeWZrYm85NkphN2pxMDZ6UzI3UjdpMUJxNUw0SWQy?=
 =?utf-8?B?L0dRcjN4UlFac2ZmOXhkWkk0QTlFVXBydklBaXNuTVpqRDVTbXoyVG5sZXpp?=
 =?utf-8?B?QkZQRi9jelZmM3pkRll4ejBQTVJwemM4U1pSVGJ5YTF3ZzcvTUJVTS9CMXBz?=
 =?utf-8?B?YmQ3Y1ArdnNRbGpXRGIxeFF4Z2FaWFN0L1NucUt0dFdIZ2xyeEE5RWJsK1Zt?=
 =?utf-8?B?UnVicytSOWdrWmNkWWVlNHJYNkk1YTdQRVBkUXQ1QmwzMTZNZDhJOUlnN0Y2?=
 =?utf-8?B?UUFmb2RlZEk3ZWJWMzBidmZ4MXNDS0JJclFnV0dzbnhLMUkxOGx2VGRIME85?=
 =?utf-8?B?Q2RjYUprQ1E0WVhpRlJ3SmJlbm1iZzZ1akpaaFA2Q0RMZm9BcXNiOEEydXlt?=
 =?utf-8?B?N1cxQTRHOEJoUkNYdkJIQ3E2WHR1UmdzVjRFNDcrRUZXeHl4TGxvU3NsQUV3?=
 =?utf-8?B?SS9uWEVCQVpXQW14Y1R0UHF0SFdMWmxQSnRCbkMwdnhNQnhQcVZEdTcyM3Zz?=
 =?utf-8?B?cTRhSVk2UytQZ1E0V2RXU05BSlBZQm9PdTdqeUZvZ1llQjBRNXlpYlQ2NXll?=
 =?utf-8?B?V01IWERCUEpMMm42N2orTmNNMVdTZ3dLMW9HdXJtOXZIZFlMSlRrajE0Y0or?=
 =?utf-8?B?S0ZodVBYTlphOFhFd3VRQVNvMGovWXQvclIzSWtYYmhDRDRyOXNkdEVydjhP?=
 =?utf-8?B?cE9nYzdiUmFWQU82NWMrbnFoNTUyalQzZmhMNXp6TlpEeDd4WWFzbWVOZUh4?=
 =?utf-8?B?NWRDSk9VN0FOeWJsRVg0VlB1QmJ5MExmSlZZL21wRmh4bzZISWdyZ1NDQkNQ?=
 =?utf-8?B?VFI3ODdCb2IwK21aa25OYmFUODBWOEV6TWIxUU51eG5ENzBvODNsakJld0JY?=
 =?utf-8?B?Sjd1eHZQcEkzcmhsMFlOZEpIUFZpYkthVUFCUGVBbmRpOHpmckozSXR4T0tP?=
 =?utf-8?B?cTByMnRoNTlKMWJjbVZCcmVOWXlOcnQ3TWpLQ2ZFUlpqYVNIWEdodUJXMHB1?=
 =?utf-8?B?WW9aZi82MGNsMWsvSmtPUzdCTEhaSVJ2cmhWNHlUZmJ5anlwRGc2RHg1UHhD?=
 =?utf-8?B?V0hpZTl1VGlOQUphMDRNc2QrczQ0MGgyNjRma2VmYjg4Mys4Y3VVc0hoTVZq?=
 =?utf-8?B?TUl0dkZGRU1uY1hLaHBNVmlRZmQvamllcmV1dzlRd2xzc0tBd0lBVzVqNnpR?=
 =?utf-8?B?a25NU3J1VnRSZ05KYlY4b1VZNmlPckVJN05DSmxwaFlWSENCeUl6UnRPQ0dU?=
 =?utf-8?B?TnU1RVNwZ2xPTFZYVDVJMGxTS3VnNmtYMFI4cm1QL1c2WW9oQnlaRkFHbVVN?=
 =?utf-8?B?U3dlV1NaRmN6UEhMNWV0T2JzNUZiWW5aSUttWGJONUVyRnoxcFlYUGlhT1BK?=
 =?utf-8?B?eFVIaytwOTR6emVWVEpyV1NkZmpVQmJxTjdEL0wwY0l1aFJDVDlvcVJFYXFS?=
 =?utf-8?B?NDNuUGg1K1NiZU14V2I4VStpZkdTUVJzUE5KQXhHQTE4MWtMNmYzUDBOUHQx?=
 =?utf-8?B?RzBEQzlJMW5xMGUrY1Y3WGFVYm93YkVza3VZUWg0aWtXdjI0aWx1Mk4xY2N4?=
 =?utf-8?B?TlNaVE92dDg5TlBwTFZicjR3bkdzYnhqZytHY1RMdDQyeWJZZlJNOTU0Tm5o?=
 =?utf-8?B?L1hScjY2VmEySnhIQ1ZMS3NPd0x5VGVGaEdtSTh3RlZjbmQ0RVNoTDdBUFU5?=
 =?utf-8?B?KzVlRElqdWVmZ1VISTF4aTAyUWRJSEZId1IxZGJFR281eFhaSDFtOEptV2Mr?=
 =?utf-8?B?aTBBYWwwV0xId1pBanpaNXllZnZNUXo1VzBDNVBwb0Frd25NTlZyRE5YVU50?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c9d96d-b336-434e-c323-08dc08b34927
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:15:30.0646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYmCOgzp1KuVLasiobD1a/UVHZgvWn7AZojz6PTJtU+pZWfpGGJVPuen6fHrwFtwvyqOpG0aYgA5plJW/pj07bXb0a8yGga4aejQMQ9ciHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:36 +0100]:
> We want to use replacement functions in upcoming kunit tests.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 4cde93c18a2d..8f208267ffc6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -9,6 +9,8 @@
>  #include <linux/circ_buf.h>
>  #include <linux/delay.h>
>  
> +#include <kunit/static_stub.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_abi.h"
> @@ -782,6 +784,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			u32 *response_buffer)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, response_buffer);
>  	return guc_ct_send_recv(ct, action, len, response_buffer, false);
>  }
>  
> -- 
> 2.25.1
> 

-- 
