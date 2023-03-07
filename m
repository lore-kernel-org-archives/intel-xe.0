Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EB6C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 10:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974E410E113;
	Tue,  7 Mar 2023 10:04:29 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABFC10E113
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678183467; x=1709719467;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HBr+7IvmbDOyDGDTSuEnjjaYsalbqIrisTeM2UcIP7s=;
 b=LJ7GxWN1Shs9nKyZ1MENFAwB7xlriro6wlFCW+mUjAsoktF0VYXOEaT4
 rH6DHFugIaVO/108zNWf1Z847Uy5RiT2tjUQFzW2ZylFggm7OYak3G1s0
 GFYlJ/pAlv93qwDC/SzQoZ9Y4nJP1M9pOerOV/Xzsz7R3UndsoHO5FlGi
 JCAkdyfOYsZ9rPcu22bnt3U9IXV36rvR+dHQ6UL9oQePLuxL9I4hO6iak
 PntuX8F3hUFo6di8FzpaEHdK6Bp08TxUygePtTfwHK6Oi2TxUEq0rd5A/
 wIY0AfhNieNlibbr7mbTgxc3EoRbzNPa/QLbKZsZc9/xEcGeF2rwKs4zb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316213987"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="316213987"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="800341703"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="800341703"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 07 Mar 2023 02:04:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 02:04:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 02:04:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 02:04:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKI8qv1ZRz6lJb3BcUebOIHaE2yn5ftRmMKRMMloX0MM8w0a5NlQoEuS+J6eAGKHS8KtEMtwg7iG+GkPlksiaSdtZag5Awsyb/at/P4woMeo/3o9S1ZsERzE8H8Bc3sx9K5O9XJWoOXPKN2cg3YP+LFZ2JmNIGcBRVY3XWqZW4LM5E+iZx1MKHGDUnmLPW/3beXJbqvaA3trowyqkLg+2WtL2jBYLDa9VC8d0Uo+BFwQvaBS62hQWKaGVYTlzOLyMFTZogMrwKX7M6jzjNNezDQ0fKY3WCRuabM3sPcdiiDNemELLLlUGK+LTSGpCLtZWb7B0EFyLQyvbNOemVvEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlP+jvT37J2YwwIYxf+16HWQSq9dMVQmsPUVKWw+w8M=;
 b=Qoflmo62rv+SaBmTJvucaaOIu2WzZRRhOF14NQ+CnV5Qs+RfekSt5sNwSNaaNtsHF6F809WOOdONCOOIg/kru5R8vPmMbFXSjh+DsqrhiKCosMy9g5MreA754HitXatW5vwUxxpnlbQ6MLTr0BBDexlr7FNg63zjdD0K4gmo/F4jtdn85yTgTaqsOpP8zTaSVBWriCIsv9rgXsQIQlcBe9KT0De4Qw1OGR6jaCHgbA0RlEGlnsknebMymko8BlsJkZC1R4fvoAM9ZOB/j5PEMgo/Yi7UjfMyUH5QuCDYqjupEaNuBRCpWxL15848s3+uTlbD0bRjbfuPEhxj0bg9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by MW4PR11MB5798.namprd11.prod.outlook.com (2603:10b6:303:185::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:04:23 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:04:23 +0000
Message-ID: <f4fbb52e-0b6b-36de-eb45-616236d4587f@intel.com>
Date: Tue, 7 Mar 2023 12:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230301144815.248239-1-matthew.auld@intel.com>
 <20230301144815.248239-3-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230301144815.248239-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|MW4PR11MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc50c87-d6eb-48ac-fce3-08db1ef35368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oOGByzXIt2Iy+aNEBP89CzMEVYbStJovSO+zVPGKI5uAoMXtIRC1CFUtrOZt2wsEdkgqgHpxTbnf9Gv46aYvv6Pw/MEwG6Wp+r7Qqrp4nDWXw/RyGLi5Gb1XWUL2EhzgsFuHx+tGZAJU4GrIbKYPDvmNfW3gfSoBq8jL24KJcJBSBSuG1/2y7LL/hD8jW5PRgExmzW8JTjzxAvLYUCih6yqO0Acauz12EyxD/UxItfhLOccdIxJpn1gGuBNiNSs7Ye/eRWz4DUlA5/9N1lcNWUk169bhDdL83nG49sVcybLi4Hv9vIeuR6HKHNSW+nqf1b+hmrcT1NE6IC74FWgzX7uCJ6RZEJaFVttKFfuOFYTPF4PuEyfOg/5Td3jPbKsaw0jj0NU7WJJf0jG7wabQctaEiRh5uFAGtImf+dJ+71nJZV1sz/Wst02f+q1q0G5Ds24tEyWaMIwi92ubDeJ6H3ar0ulLhSCf8wdIaPri1eiWK09ZiH7W+Od9G6EeC+23ab0G1axMu0q29d9p0nGEC+BC4einegw24EizDcotgAyhgM3b4GzOI/TRc8qIEVspvD43nT27EDEmDNzyqfO/QDK8unfYZYvg1uS91soUpe1rNkaMBz0em7StElSb6Ex2EwA9nuoxUcLiA4QnyLbVLOs/o3cWP5MoZ2nNmpCgqosnqOeVGxz5VwHbgPzFRJtjnrkPEGl5kseVkDKZRAxPCQNZ4e7fCZ0neseZD30afmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199018)(2616005)(107886003)(6666004)(5660300002)(41300700001)(36756003)(31696002)(83380400001)(316002)(86362001)(8676002)(66476007)(66556008)(66946007)(478600001)(4326008)(8936002)(6486002)(31686004)(38100700002)(2906002)(82960400001)(186003)(6512007)(6506007)(26005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmtaQTl2M0hrb3JqbGdXa3ZYM3JrNGN0cXkwMWJwUnJZNm1sK3NjYUJHTFlE?=
 =?utf-8?B?eG5pN2tJaVhMVU9Rcjd3YzdKV3dUTlZONlB6cWlmU2JCbkg4d2xoMzF5WTRx?=
 =?utf-8?B?d3VlSUVXR0dEMDM4T04vT3BTM0VNdXIvOGRjT25CV0hDVmtldUJyaitJcnBD?=
 =?utf-8?B?OHFBNUwzN210Qk93WUxyNExpdmRWaGJmUHFtMC9pUFd1SnNScFhxekR0dVFm?=
 =?utf-8?B?S1d4UGVmNEc4N2Fwemh4VEkrYTIwQ3NyVGpqa0JsMU1jVmtsODFFR3N2a0kr?=
 =?utf-8?B?ejdGV0R2L1JuczBLeVRWZ2ZGOHB4Q0ZrNzZ0dlphWkNRcUExTjhYNU9DLzhT?=
 =?utf-8?B?VTZnWW1XaHBFdENiZk9GTFEwR3ZYOHE1bUErNnN3RmpkM05OTXRwbkRtSXNC?=
 =?utf-8?B?dUNhRWJUaThVZDcyMGhVL25DRWYvcDJHUzdZbzg5US9lOG40UDYyMjBvRVZR?=
 =?utf-8?B?TmdOSmtMaGdIVTFOV3ZsV0xyQzRESFk4QTBiYWV6OXRSZDJMeVJtRmdia2xK?=
 =?utf-8?B?NlpJSXFDY0huNVhESjlPeExFV05BSmNTbEtERkpnQThuNTk4bm01RXlQUFF5?=
 =?utf-8?B?WHJhOENKQ3VxM0txSHNXY0FhNEUzTDlLM1RlRTJRR01NVUlHd3NFUWNpeXc4?=
 =?utf-8?B?UG9vTFVKcFN6QTVTTWgxV1dDN2FUR1JCNnRkeDdsc05nSUJPYlZETzc4NXFZ?=
 =?utf-8?B?cy85a0JlSU1rVTUzYmdmaTlBUnd1MUVvQzNZQ3NvWWFlN0ZQMnByaGdxUU1Z?=
 =?utf-8?B?THBRNjNLVmxlQWxxNEpTdHdpamVlcVBBUVkzTFl3N2ovNzBMMXpyYXBTZ2pi?=
 =?utf-8?B?Ly92QzBrYVVLWTh1RU91L3hKeEsxUmgycFh1L3RwWkFxK0VER2NtTHNmQ2VC?=
 =?utf-8?B?aHpTZkZaZ3hPakZQOUxTME5pbGtaSHJJZ1NuOTV4d0c0WVZ0Wm03ZDBLcWVY?=
 =?utf-8?B?S1pzSjVwMU51ZXVHMkVEWnBWRjJrSmRUZWVaYnd0RmlpNE11VXRUc1NOK1F3?=
 =?utf-8?B?U3lYcmd4dEJPODhFV2t3bjZxeDVpQk42aXBORXVWMW9SN2hqYWgyb2lNMEtY?=
 =?utf-8?B?WDlNNzNGOGVxbzlWRFVJOXZkTG1ndnFHeVA2VVZIQ29wU3daWGZKbGtwMEtY?=
 =?utf-8?B?ekdBSkxTZFVLY0ErQWZQYnJqbUNMNU5pdy82cDkvbW9aeko4ZlJoMXNISDFV?=
 =?utf-8?B?ZXJhZGhQNkprNFR3ZXB6TThzTEpEMVVNS1ZPblFmU3o1cHZQSms0Qkh0cnJR?=
 =?utf-8?B?TkJiVThRWHF3aktJTzJwVUx4MjA0MUhhdjJpSUt4SjBnRHVCZWZ0UjhqeGdQ?=
 =?utf-8?B?bEQycUlaNE5zSlRxRTJyOGg4MzRSUHpZLzJKTGxCTHd0Zy9QR3BhM1RaMXVU?=
 =?utf-8?B?d01JSDRWdXJORkpEUVgvRzhjS1Z5eVpoYzF5OVQ1Tm9tTG9sbUJ1TUFYNG9l?=
 =?utf-8?B?R2Z0T0FJTEhSaUY0WXB6Vk44aFl2TFpZblphV2ptMWYvR3JSOWVRRTZsbTZk?=
 =?utf-8?B?LzQ3cUxpSzVObG5mVnJLekJ6cHZaZzM3TkxCcDRzWFUrRHp4bU1HeFRvSlh3?=
 =?utf-8?B?ZjNlYlZpNXdEdlFXbWllUzh2L0JwMVc5ZDhiajBsVkVVbTE0QmswYm5VS1hq?=
 =?utf-8?B?dTg5MnNtZ0JxNzA0Zm84OVdFakVkMFRVMGw3anRYcmZiS0t6RjJQUXVETUov?=
 =?utf-8?B?aThHZWlxVU41ZzZMa2ZpdEpudWEzb0RFeXVBcEZVOXUzZCt1eWlkT0tra2M3?=
 =?utf-8?B?MlJBYnhqSjdlTDNYRDNBWjhCTlZ1aGxQVTZOcjhiZVR3ZTZsaE1WM041dm9z?=
 =?utf-8?B?ZnlwWmtJR0RHQUk3RU9NMGJTL1UwTkJ4bzhrWFZMZFoyaVBmejgxZ0RpZjVP?=
 =?utf-8?B?NHhzdEdUMmRYdDViS3cvSTB5Q21BdDN6MHpwTjVXQjVZSThmR3QwemdmTCtC?=
 =?utf-8?B?cUJnM3ozZGhUR0V6amZ5cFAyVjJiR05IWmlVODRVT05YeHNidzhzMHZidFVX?=
 =?utf-8?B?ZlpWMm5jR1J5MG5xKzFZTDM0NzhPUVlXWnE3b0lKYzZuUGY3RXRWcFpvQnAz?=
 =?utf-8?B?TjFUU1ZMaUdwcXVtZVAvT0R0cTNCOTk4WGltbmZKakx1VjZEcTJCSDl5Y2Jn?=
 =?utf-8?B?eTBLZlJFWklGa0FxTkpWYmFlTXY1elVxa1JsTDkxUENPOHpHejlxc3JPeEpX?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc50c87-d6eb-48ac-fce3-08db1ef35368
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:04:23.3813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3xJgQRylH5On/NBWRv9Sqd7zOsbHpBHbdT04z6Es/85Ylg2Jv7EbiJZ3f/bxwV+hDqNKzmXjuu18pPlS7FZAVEBnZhEIlQ9BBtGxjXpeGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5798
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/mmio: s/lmem/vram/
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Looks good to me.
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

In addition, in the code of the function below, a variable or string 
named lmem is used. Is the code intentionally not modified?

drivers/gpu/drm/xe/xe_bo.c
	xe_bo_pin()

drivers/gpu/drm/xe/tests/xe_migrate.c
	test_copy()

Br,
G.G.

On 3/1/23 4:48 PM, Matthew Auld wrote:
> This seems to be the preferred nomenclature in xe.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c   | 40 +++++++++++++++++-----------------
>   drivers/gpu/drm/xe/xe_module.c |  6 ++---
>   drivers/gpu/drm/xe/xe_module.h |  2 +-
>   3 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 65b0df9bb579..e5bd4609aaee 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -68,7 +68,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>   	return 1;
>   }
>   
> -static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size)
> +static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	struct pci_bus *root = pdev->bus;
> @@ -78,31 +78,31 @@ static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size)
>   	u32 pci_cmd;
>   	int i;
>   	int ret;
> -	u64 force_lmem_bar_size = xe_force_lmem_bar_size;
> +	u64 force_vram_bar_size = xe_force_vram_bar_size;
>   
>   	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
>   
> -	if (force_lmem_bar_size) {
> +	if (force_vram_bar_size) {
>   		u32 bar_sizes;
>   
> -		rebar_size = force_lmem_bar_size * (resource_size_t)SZ_1M;
> +		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
>   		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
>   
>   		if (rebar_size == current_size)
>   			return 0;
>   
>   		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
> -		    rebar_size >= roundup_pow_of_two(lmem_size)) {
> -			rebar_size = lmem_size;
> +		    rebar_size >= roundup_pow_of_two(vram_size)) {
> +			rebar_size = vram_size;
>   			drm_info(&xe->drm,
>   				 "Given bar size is not within supported size, setting it to default: %llu\n",
> -				 (u64)lmem_size >> 20);
> +				 (u64)vram_size >> 20);
>   		}
>   	} else {
>   		rebar_size = current_size;
>   
> -		if (rebar_size != roundup_pow_of_two(lmem_size))
> -			rebar_size = lmem_size;
> +		if (rebar_size != roundup_pow_of_two(vram_size))
> +			rebar_size = vram_size;
>   		else
>   			return 0;
>   	}
> @@ -117,7 +117,7 @@ static int xe_resize_lmem_bar(struct xe_device *xe, resource_size_t lmem_size)
>   	}
>   
>   	if (!root_res) {
> -		drm_info(&xe->drm, "Can't resize LMEM BAR - platform support is missing\n");
> +		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing\n");
>   		return -1;
>   	}
>   
> @@ -168,7 +168,7 @@ int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_si
>   	if (usable_size) {
>   		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
>   		*usable_size = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
> -		drm_info(&xe->drm, "lmem_size: 0x%llx usable_size: 0x%llx\n",
> +		drm_info(&xe->drm, "vram_size: 0x%llx usable_size: 0x%llx\n",
>   			 *vram_size, *usable_size);
>   	}
>   
> @@ -180,7 +180,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   	struct xe_gt *gt;
>   	u8 id;
> -	u64 lmem_size;
> +	u64 vram_size;
>   	u64 original_size;
>   	u64 current_size;
>   	u64 usable_size;
> @@ -207,29 +207,29 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	gt = xe_device_get_gt(xe, 0);
>   	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>   
> -	err = xe_mmio_total_vram_size(xe, &lmem_size, &usable_size);
> +	err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);
>   	if (err)
>   		return err;
>   
> -	resize_result = xe_resize_lmem_bar(xe, lmem_size);
> +	resize_result = xe_resize_vram_bar(xe, vram_size);
>   	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>   	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
>   
> -	xe->mem.vram.size = min(current_size, lmem_size);
> +	xe->mem.vram.size = min(current_size, vram_size);
>   
>   	if (!xe->mem.vram.size)
>   		return -EIO;
>   
>   	if (resize_result > 0)
> -		drm_info(&xe->drm, "Successfully resize LMEM from %lluMiB to %lluMiB\n",
> +		drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
>   			 (u64)original_size >> 20,
>   			 (u64)current_size >> 20);
> -	else if (xe->mem.vram.size < lmem_size && !xe_force_lmem_bar_size)
> +	else if (xe->mem.vram.size < vram_size && !xe_force_vram_bar_size)
>   		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
>   			 (u64)xe->mem.vram.size >> 20);
> -	if (xe->mem.vram.size < lmem_size)
> +	if (xe->mem.vram.size < vram_size)
>   		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
> -			 lmem_size, (u64)xe->mem.vram.size);
> +			 vram_size, (u64)xe->mem.vram.size);
>   
>   	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.size);
>   	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
> @@ -360,7 +360,7 @@ int xe_mmio_init(struct xe_device *xe)
>   	 * and we should not continue with driver initialization.
>   	 */
>   	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL.reg) & LMEM_INIT)) {
> -		drm_err(&xe->drm, "LMEM not initialized by firmware\n");
> +		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
>   		return -ENODEV;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 5a51a9959eff..6860586ce7f8 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -22,9 +22,9 @@ bool enable_display = true;
>   module_param_named(enable_display, enable_display, bool, 0444);
>   MODULE_PARM_DESC(enable_display, "Enable display");
>   
> -u32 xe_force_lmem_bar_size;
> -module_param_named(lmem_bar_size, xe_force_lmem_bar_size, uint, 0600);
> -MODULE_PARM_DESC(lmem_bar_size, "Set the lmem bar size(in MiB)");
> +u32 xe_force_vram_bar_size;
> +module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
> +MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
>   
>   int xe_guc_log_level = 5;
>   module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 2c6ee46f5595..86916c176382 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -8,6 +8,6 @@
>   /* Module modprobe variables */
>   extern bool enable_guc;
>   extern bool enable_display;
> -extern u32 xe_force_lmem_bar_size;
> +extern u32 xe_force_vram_bar_size;
>   extern int xe_guc_log_level;
>   extern char *xe_param_force_probe;
