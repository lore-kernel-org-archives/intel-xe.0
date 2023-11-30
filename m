Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF39C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 22:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F01210E060;
	Thu, 30 Nov 2023 22:17:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA96A10E060
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701382670; x=1732918670;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QgKy0gfRzIk8HSdRYG0zwMMQCuyE4JKENLEpIX14eis=;
 b=cEcV0JFzaz07jrzue1RaxN2JMnMDZkMFzJSsXNHuEBSwxCp4w7k8Ed8l
 /2KNu22NpesK5GUF31f62Wv50yemOJbdc44npzR2FBGFmA5ElcCQGTDdx
 +FekVQBb21DR9McnBkGwErCY06YgkZNEDPQbhDOHp6DwaCT65Ynccwptj
 MsqtEPtXTVxe07igLABk5ndNF+XK5b7ThzHXLzEMETsxV1n8h4zgGgbzG
 SeRuUsikF0QjjvEzD3gFjArFkc2DUg/ijVhdPcbShOKSIb9HV7sDGGg15
 MMQovVX7cb7aZtFd5bfQ2g8jxLFTN2zc4kn9S8UQtxzz/4b1hQDJ1WuFL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="372791018"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="372791018"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 14:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="745781041"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="745781041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 14:17:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 14:17:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 14:17:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 14:17:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrwMrBwknRCTnYWYj8qDwaVEPdJP+quWNI3t0sO5HR+jzBqI3NjK2CE5jvcBqIbJNGlBxiFBKV69jJ1BZQkERyp7w8K+PsZ4Hc8lonsRGA28yvgS45ZplInzENUlvMqdlTu+H2fbdzQ6PzasYb+KT+Uy28PQaYe41W+anTn/2f1wnKfudO3eZ3NdDXaTpU5TPRYU/0UdBQvZtYS/jA9yQnPPSJ4WQBpUvvwWnT1kGFknfw728zK1Kz/D+Z4ls7WwijBUYOvcmbVKkBnE9j0ZVrngnpHbfkKwfalDtnWgHtnSgOeE+Kz5Ud9o4b+bTX4LJ60a2OkVT2XLEGctWseo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVdBxIKnfOgYNhzaA1Pmr2SJf8EDlzsobZYYpDNkhrM=;
 b=lm4Nl7pXxRoTgol1ixzfw2cfrvOhUlVDDXKDKqhktfJURJ62wY0YJ/cjc9VIU1vSD3uHsvclJ0n1Ir1aKcYM8lXgA+9M4y32UiihGhE7Mhb67GBXtGiohkhy/isa6T6y9NZQjN6aMST8Xcgdkpvwo9waG8ILuNEuLHVb749iWC1vDgzeHRO4sUxh12VMgjsDDa34xxCAciOubCUmd1TypZrkQN5KigJnkjQIB2rctcVfSjWkKi4WLPKSt22TwtQlPOv2rvxlGsaTHmPWwUSVsq/dax6PkSIZ8DY45qQtNATYxwSKg4g/0sxIyNrtYtjozJweO35y+EtVltI16HytIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 22:17:39 +0000
Received: from BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::a1fa:aa5b:37c0:5b98]) by BYAPR11MB3398.namprd11.prod.outlook.com
 ([fe80::a1fa:aa5b:37c0:5b98%4]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 22:17:39 +0000
Message-ID: <c419521a-b95c-b008-7c88-d29de28e1e66@intel.com>
Date: Thu, 30 Nov 2023 14:17:36 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
 <20231129011721.2793482-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20231129011721.2793482-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To BYAPR11MB3398.namprd11.prod.outlook.com
 (2603:10b6:a03:19::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:EE_|CO1PR11MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: 73954635-784b-46b6-27cf-08dbf1f229b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ckihtpc04NxTH/vN75yu/44zIhOJx1OZP+tytzTUn8luTgg6xQfC8OfMcQtIF25u/H1C2tkZ4ZtF8BrkTwaY1Gu7ZEFu/7tqzPNXL9y4cFnLkyb9B6+rBHhVvm5ylKDVo6eVnledN5lDsvQYHXe26JDCZZyhTH/1iH9BlGu6kJM4Gd57fY21MfVzB8Vzz73r4p6fgJ9yeY3qWBOr3HBXbqumvHesyfw+oMi4cnLtFsU3IXw9ELNNusJyuUb3U9j5Pyp7oHjW7DCjpIaT482RJruuDmFjrit3cSckWUWHxJAvcWyVie7ieCqUl2YhSfOW0Tgd6IkaN8wj4TbruH/G+rNVpwxNH8mDKEoVsbrf3XkXKANCmmeRqt+b4Gl32s8890cIsYCtcy6bkV7Cz0OUjii8/mTrWTSr0YavckD9koayuKIKA6VoV6BnJNQYzKTTCQcVHPozlrn+y2kszbfejNcZslF7UzQhqQ11PJVGzqC//hYYdA0PqFrUlnSjO1S5D3+G7Uv4UjJDCp7UAQYTCbJNQnubJovw6ZEYSweDW88cWleWtQz29/zXH26kfkOkSXAidaR2rr/huOi6+p7uVBnODdPr4JkOTh/ef0YTWfS+5256C7XQDLaZygYnrI83L4+eTO41VDbUH8ngKHKq7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3398.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(366004)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(82960400001)(83380400001)(26005)(38100700002)(41300700001)(36756003)(53546011)(6512007)(2616005)(6666004)(2906002)(6486002)(5660300002)(31696002)(316002)(66476007)(66556008)(66946007)(6506007)(478600001)(86362001)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjRTNzNVQXRkRGxBNStzYkxLaTA2UDF3K1YvOVRZRjRXaDgwOFdkTkMrRy8y?=
 =?utf-8?B?aW85ZDJnVmRHenNYTm5PVDlPOUJqN3R5RU9EMTRLNXRSektUeXlxN2VmYUZI?=
 =?utf-8?B?MDgvdlNJS3hKMmlNOCtab08vRk9jMitlRHRCb3Rpam5EZ3pEV3dCTWMydTcy?=
 =?utf-8?B?K3VVS3gzVWJnQ2djRS9IM0JFUjYvNzJXSzZRTjN0ZWZaM0xmZUdFZVZneHNh?=
 =?utf-8?B?U3V1ditrR1MrTDRnY1JoamhBbU9DQkpGZHVDSVNndlZIVFpUSDdhQXdSbzlt?=
 =?utf-8?B?cTFrNVVuQ0RFREVibkZBWU5SREJUbFM1UE04NVNwUnVteUw0ZTBlMXZiejQ5?=
 =?utf-8?B?V2tDTjVmelNad0N6a3lUZFhTVU9lSWx2OVprWUtQbjVFRDFyMVpBcjV0UE1F?=
 =?utf-8?B?eWJ0c2kvdENLM0Y4Q1RTK2Y4NGJCcmhCTkVaZ25BYlE3UlNkVGxmRzhrV2k2?=
 =?utf-8?B?dzJpdWdBd2tVUnY2UGxDSXdFalQ2bUpHTlNGMUpHMkpGNTgraDZ4SXdXWHZr?=
 =?utf-8?B?RTg4ZlhMWml5TFVhQjhsMTRNQTRWeVhZQzZwN0RINnVrZjNUOUdFUS91Sk5w?=
 =?utf-8?B?YUNKc3M2OXZWaHlYVTFIeHJOelNCOUVCeTVocENQNlZYSndhU2FJL1BDdW9U?=
 =?utf-8?B?K1FUWkQ4YnFzcXptdTdURDZJQ2RSV2NlV2lGV1czY1FrUk5VRE9xbWxpK1do?=
 =?utf-8?B?L1doeGhTQlVnaW8zTEtEbjdjMDZuUHI2YzdybUtKcWlpeFNCM3BSV3VjdkF5?=
 =?utf-8?B?QnpZMVRkakNHME04RmxGaWRUSFYxdDRkUDMwRDZQZ0VVSmFWTGdtVWJjbEpX?=
 =?utf-8?B?dzI2WExHcGhaeWdXR3paVFJNWEFpb2pCR0VzRnBnZmYydU40K0hFRGo1OVBT?=
 =?utf-8?B?ZytDR240VmpxbXBlbHZ4QXpzcnJmUWZ2VGgyVXNDZGV3QVVlelVBRkFEVE1L?=
 =?utf-8?B?K0MrcFVWMDdxaUIxb3kvVU1QaW5idDhJaU1JeFdLTGwxdWpTc28xMTk0L1Bj?=
 =?utf-8?B?dDBVYUwra1QzVDdCd3pSbmN1N1hhdEFQbVh3RFFwRndmTlRDbTRjYi9oTkVM?=
 =?utf-8?B?M1RxREg2U1Jia1Y4SVpQZWxSZ1Y3K2YvU0xjQlgyWVBTbU1BQWpVZm5QR3gv?=
 =?utf-8?B?QXRXUkRITFA1QmM1ZDBVTWtndEp1Q2lla1Jpc3FpdmhNdVo2VjAwYmxBWWtJ?=
 =?utf-8?B?ajNJK2ZXY3ltZ0ZQaGJJUFhSQXVicHR4MkJMOWV2aGVzTEkvdUwxU1Z1czdr?=
 =?utf-8?B?QXZUeXkvYWRoZG4vL21KS2gxMkpIMVVrWTAyYlBoK096MEJyMWIzUWJhL09P?=
 =?utf-8?B?aTREeGpTMll6VEtNT2FjTllaRjdVZUhhUUVwTDFjb1h3UmZNb2RwOWJ2ai9B?=
 =?utf-8?B?Q0l3cndabmpzdDZxcjZoSzBlcEEyRi9MWXZXVDh4MEZac2RVT0xoNTlIeHFY?=
 =?utf-8?B?ZERvcDYyTW0wS0hEWG94S1J4aGR6ZytOU2dIcU8zcC9SeGZlZ1JGcWNtT2l4?=
 =?utf-8?B?MDNEeStaWEF5OExtRFlUTHl2VmYwWWRyODFabElZSlRsUUtFc09WU2M1TFBV?=
 =?utf-8?B?VEx4aXNPb21wUWJTaVdLSUhpcmJoZHBodkpHVDlUR0MrdGoyQmFxWnRXQytQ?=
 =?utf-8?B?am1UeEZRdkwzSlNDVjRZN0k4VytzcmZVU1k3bWcxc1NRZlFPcThwNGlXK0tz?=
 =?utf-8?B?RVZZN2tEYUw1NTA3Z3pwUk5sU0tXT1NUZTZDVjBZcnBxMHNIeVBnQTJxcjZT?=
 =?utf-8?B?SktkdkxsNFM0aVllY1lRaTdkT2Q2aUdKTTJSYjA2akRWcG9nSzUzTmNnQjJB?=
 =?utf-8?B?SEpubVkvN2txVzg1OUNVK2hWejhONDMvVVhaNjUrVkkweDN3NUI0OG9jT1Jz?=
 =?utf-8?B?YkpIcU1nN1F6eEtHeUVLaHZ0WXFlS0lWenVBN2ZKdGVEeXQ4SlFybHVmQVQv?=
 =?utf-8?B?Um5uNHJPYzV5SGZHcVVxMGc0NU1BcHcwemIzUHNXQi94c0QvTW1GZGdULzdi?=
 =?utf-8?B?NWcyekt5Ykl6OHpXOVhzemxzeVM3b3EvTW1NL3RIK0J6OVVnSllkazhFWE03?=
 =?utf-8?B?dFp1QzNyK3BhbEZjWDBxTU5VNTViZFFnK0duMERhTW13Y0hJVjdXOTgzSGJO?=
 =?utf-8?B?T1c1Ulh3WGhwZm9SV3E2WDVXVWxSNmVGdWlLU2Z3MkhlcDhTOVFHbER6VWR1?=
 =?utf-8?Q?x3hOnIFwNRqWOrbgVJ+TLm0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73954635-784b-46b6-27cf-08dbf1f229b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3398.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 22:17:38.9311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LC7CZ/WHWIq6KJv3NaGi6+DnoVtG8iPJkOxRUipmDwqqsKPsnxlq7oIcM3GW8RkV4jAXub+EU62lFpQhAC9QxdwBDC22t7q63f3a/Ceq4cLGgnMj2IoRZEZS7hygrAZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/huc: Prepare for 2-step HuC
 authentication
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

On 11/28/2023 5:17 PM, Daniele Ceraolo Spurio wrote:
> Starting on MTL, the HuC is authenticated twice, once via GuC (same as
> with older integrated platforms) and once via GSC; the first
> authentication allows the HuC to be used for clear-media workloads,
> while the second one unlocks support for protected content.
> Ahead of adding the authentication flow via GSC, this patch adds support
> for differentiating the 2 auth steps and checking if they're complete.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  2 ++
>   drivers/gpu/drm/xe/xe_huc.c           | 47 +++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_huc.h           |  8 ++++-
>   drivers/gpu/drm/xe/xe_uc.c            |  2 +-
>   4 files changed, 47 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> index 9a84b55d66ee..9886ec9cb08e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> @@ -32,6 +32,8 @@
>   #define   HECI1_FWSTS1_CURRENT_STATE_RESET		0
>   #define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
>   #define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
> +#define HECI_FWSTS5(base)				XE_REG((base) + 0xc68)
> +#define   HECI1_FWSTS5_HUC_AUTH_DONE			REG_BIT(19)
>   
>   #define HECI_H_GS1(base)	XE_REG((base) + 0xc4c)
>   #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 2f176badab26..9845165a819c 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_huc.h"
>   
> +#include "regs/xe_gsc_regs.h"
>   #include "regs/xe_guc_regs.h"
>   #include "xe_assert.h"
>   #include "xe_bo.h"
> @@ -71,7 +72,25 @@ int xe_huc_upload(struct xe_huc *huc)
>   	return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
>   }
>   
> -int xe_huc_auth(struct xe_huc *huc)
> +static const struct {
> +	const char *name;
> +	struct xe_reg reg;
> +	u32 val;
> +} huc_auth_modes[XE_HUC_AUTH_TYPES_COUNT] = {
> +	[XE_HUC_AUTH_VIA_GUC] = { "GuC",
> +				  HUC_KERNEL_LOAD_INFO,
> +				  HUC_LOAD_SUCCESSFUL },
> +	[XE_HUC_AUTH_VIA_GSC] = { "GSC",
> +				  HECI_FWSTS5(MTL_GSC_HECI1_BASE),
> +				  HECI1_FWSTS5_HUC_AUTH_DONE },
> +};
> +
> +static bool huc_is_authenticated(struct xe_gt *gt, enum xe_huc_auth_types type)
> +{
> +	return xe_mmio_read32(gt, huc_auth_modes[type].reg) & huc_auth_modes[type].val;
> +}
> +
> +int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
>   {
>   	struct xe_device *xe = huc_to_xe(huc);
>   	struct xe_gt *gt = huc_to_gt(huc);
> @@ -84,7 +103,7 @@ int xe_huc_auth(struct xe_huc *huc)
>   	xe_assert(xe, !xe_uc_fw_is_running(&huc->fw));
>   
>   	/* On newer platforms the HuC survives reset, so no need to re-auth */
> -	if (xe_mmio_read32(gt, HUC_KERNEL_LOAD_INFO) & HUC_LOAD_SUCCESSFUL) {
> +	if (huc_is_authenticated(gt, type)) {
>   		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
>   		return 0;
>   	}
> @@ -92,28 +111,36 @@ int xe_huc_auth(struct xe_huc *huc)
>   	if (!xe_uc_fw_is_loaded(&huc->fw))
>   		return -ENOEXEC;
>   
> -	ret = xe_guc_auth_huc(guc, xe_bo_ggtt_addr(huc->fw.bo) +
> -			      xe_uc_fw_rsa_offset(&huc->fw));
> +	switch (type) {
> +	case XE_HUC_AUTH_VIA_GUC:
> +		ret = xe_guc_auth_huc(guc, xe_bo_ggtt_addr(huc->fw.bo) +
> +				      xe_uc_fw_rsa_offset(&huc->fw));
> +		break;
> +	default:
> +		XE_WARN_ON(type);
> +		return -EINVAL;
> +	}
>   	if (ret) {
> -		drm_err(&xe->drm, "HuC: GuC did not ack Auth request %d\n",
> -			ret);
> +		drm_err(&xe->drm, "Failed to trigger HuC auth via %s: %d\n",
> +			huc_auth_modes[type].name, ret);
>   		goto fail;
>   	}
>   
> -	ret = xe_mmio_wait32(gt, HUC_KERNEL_LOAD_INFO, HUC_LOAD_SUCCESSFUL,
> -			     HUC_LOAD_SUCCESSFUL, 100000, NULL, false);
> +	ret = xe_mmio_wait32(gt, huc_auth_modes[type].reg, huc_auth_modes[type].val,
> +			     huc_auth_modes[type].val, 100000, NULL, false);
>   	if (ret) {
>   		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
>   		goto fail;
>   	}
>   
>   	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
> -	drm_dbg(&xe->drm, "HuC authenticated\n");
> +	drm_dbg(&xe->drm, "HuC authenticated via %s\n", huc_auth_modes[type].name);
>   
>   	return 0;
>   
>   fail:
> -	drm_err(&xe->drm, "HuC authentication failed %d\n", ret);
> +	drm_err(&xe->drm, "HuC: Auth via %s failed: %d\n",
> +		huc_auth_modes[type].name, ret);
>   	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> index 5802c43b6ce2..b8c387f14b8e 100644
> --- a/drivers/gpu/drm/xe/xe_huc.h
> +++ b/drivers/gpu/drm/xe/xe_huc.h
> @@ -10,9 +10,15 @@
>   
>   struct drm_printer;
>   
> +enum xe_huc_auth_types {
> +	XE_HUC_AUTH_VIA_GUC = 0,
> +	XE_HUC_AUTH_VIA_GSC,
> +	XE_HUC_AUTH_TYPES_COUNT
> +};
> +
>   int xe_huc_init(struct xe_huc *huc);
>   int xe_huc_upload(struct xe_huc *huc);
> -int xe_huc_auth(struct xe_huc *huc);
> +int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
>   void xe_huc_sanitize(struct xe_huc *huc);
>   void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p);
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 15dcd1f91e9c..68199ffa52b0 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -176,7 +176,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>   		return ret;
>   
>   	/* We don't fail the driver load if HuC fails to auth, but let's warn */
> -	ret = xe_huc_auth(&uc->huc);
> +	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
>   	xe_gt_assert(uc_to_gt(uc), !ret);
>   
>   	/* GSC load is async */

Reviewed-by: Balasubrawmanian, Vivaik 
<vivaik.balasubrawmanian@intel.com> 
<mailto:vivaik.balasubrawmanian@intel.com>


