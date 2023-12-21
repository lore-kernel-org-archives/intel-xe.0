Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87727C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 21:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B8410E6EF;
	Thu, 21 Dec 2023 21:56:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009BB10E6EF
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 21:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703195800; x=1734731800;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ojU58TM9tNYlgZFBSmuEpI+cCIYrdQmaNVaamC4zBdo=;
 b=Ecj38ojboo0NEV8z8zvjcgALIwKQQTahN54OcIVIs2N0qChkZrM79d0L
 k3LGWMLWvHAdtKVJGYSlolBGBgaQw7ATK4XNqNujjqyVNYsso7t7hB6oc
 dGf3rDNObEkUYoI5owEaRQQsIkENUSXIakPtct1jA0JPohWqeJI+U/CLv
 iMiQpdYuUVOeFkPCn2xX4ORUcx36ThcLZzdbLW8h0neluPtcu7conBO8U
 yb+fUnqwae/jhZyUwbw6nivlctvr6VTF0uJeDOUMF5ABcg4lNP1O1E+7a
 p855ORWVL+uHzTiuzgwgaR5BjmKL2Gw8k9fN84CfssqMiRP5Rg3FxFZ9X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="14724960"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="14724960"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 13:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="1024006883"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="1024006883"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 13:56:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 13:56:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 13:56:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 13:56:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLwGaGx7iMu9rSHVvxawJn4GqWndCGdTCjVfmcdCMoWqpGRXc8srlR6j1T6mewBmGkaP8UdxxADhEfCdHsVGXuevNyC1l5QAGi3DVJAoMya9X65PoojJqvnHhM8ErL97mngWeSzF9MqWzuJt0kdp/odhrDhlRIcw+2le3mCn6GtXkhUsgZkj23RX3xtxylY2BBiBBzvz8ovISNfk8fwKSlMCdLWvvvVHfXlZr02wByGCxvdA9d+hIm4U0tpRfbKRAjI3WDs9xLg9bEs9ZZ9xfgToLXVmqbPvoDn8EoHfa48SCs6itqDsZloAXn6EUq0P88CPA1OmanJLwljQYqHCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTFfpHfIstaPBX+zcu14XXrs+kD08HGFBxXRYxxPERs=;
 b=FMyawaB0ufkTbnUGEQDcFbRZFMgkWw/tQd0M7F/EjAIbfuMZMT+oz600Sh/y5QZ6jMLfbru2E8k+WdWYN8Xk82dqHzU4z60wCDo4yhUfYvUn/SW2C3V8rkwwfPHpVJPcIQCuSokOnoIrWWiOslb63ubg+XZk6vZyEFkgxJXL06+DFbLt4QEDXaKQis5fNt70BB7KGeahjf1H7D7QfDSbfh+Hz9XWioY19SLDIzsVr3k/yVEgJ+BZDP0IkCmptZYngScccuxC7HXcrtvy4OKbZnVBHkKq+lM+UU2qbRKj3+MmbVHL3y3sWFEkCV8sG6ROgO2ErlDsp5PUovLIe9EEYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 21:56:36 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 21:56:36 +0000
Message-ID: <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
Date: Thu, 21 Dec 2023 13:56:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231219172824.832873-1-matthew.brost@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20231219172824.832873-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0053.namprd11.prod.outlook.com
 (2603:10b6:a03:80::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef6a7d0-b382-4acc-3b35-08dc026fb3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: whnxvMNHVUUD2BDRHR+OQ7oZbgnoPHovEEvvfc+GUOZdG2gYAjtsx/9O/PhV1JCo2C9niawOkoPqJtZy1bL8dfKwDeRRpy/rnuc5s1e5LLQfho9ey1sUlDKI1lYXTmX5fFZjYJBszGy3DDooqZZUVDOypgdPNaZfCpwJVEzGQAA9/RjPSA7vsQXi95rL9XlMzUvtne7nmnwpDvw6+Rk4N2FNWoFW8Tl/6f/c2UUOjMErpYJKoeyNLPvN08zQeXZTyCSYvGVxYwTsflX6EZCntxdo1FAupic51+R64v40zFM89QzjA1RZzrqM0aEVBtcn5NuTs/jVdXae3xEY9tGE1/OBGXhLrQ6HErUzk71VH8vUY94nXSP2eBwTw0HN3g6bpL/HJY0ijrbLnlw9NlnFGKIiolNcPLkx+/XnUqPoH4IzqDvGzuc0N8cRsLIELftraxPdJt5OFDtycCTFIYw5A6oJPmII/X3+hYMnWDWyqk8TKdW5eJ6VaJwlg8whzxClHufxIjsnhDv9R5yxo2WRUXoEP2LKWuXnJRysVOQJjIpfcXHC8mPGnr6Qz27M0yyI8Ev0uUdlvD4A9cKpFQxluLYeds5r4RJZqp1YCb+ufb9pZtgKNMhqdI8WMgcaIthk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(83380400001)(2616005)(26005)(6666004)(6506007)(53546011)(6512007)(5660300002)(8676002)(2906002)(478600001)(6486002)(41300700001)(66476007)(66946007)(8936002)(316002)(86362001)(31696002)(36756003)(38100700002)(66556008)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjBHbGg2RTl5b1hSTE5KRURZNmhPVDVacFBwZE9WeFRnOGVBbVpaN0gzaWpZ?=
 =?utf-8?B?TkQ4aGdocGdUQXV2bUo1dXh1UW15blhORDVzODMzM1I4a1ZCazVESkpyYm11?=
 =?utf-8?B?dGp2dVpqM29aR3NvYmlxckFDdkY5bHF6MHJVdVM3TWVGcTFKN1R1cWNGSkdD?=
 =?utf-8?B?M1BPc3pRTlJ2cFUvZUpkT1JoWXlBbTdrcGNJTmlDZWE4VllwbGRmOFZlazN4?=
 =?utf-8?B?VDN1Ly9oZUlEWEdnY0t5RktybzdaWkNNbEhqL09IMWsyQkVHZldPY2lOSjVD?=
 =?utf-8?B?WTg2UVRXNUdZdUo4VFBTcVRVSVgrc1V3cmQyUmlidHVhYzlwWXV6RHpqbXU2?=
 =?utf-8?B?ZDBPTjdsRWcrUXdzNENpNkxRK1UyRzAxYUlKVGVxS3luV1hzWE9sR3lmdHRn?=
 =?utf-8?B?MEl5U2dnWXNrTUZZMzFmSGxvanBzUjJSR0Y5WHd6NDlTL2g1akRJc2syZUNa?=
 =?utf-8?B?aTFKWEg0bURCUTllVjlYZFZ1UTI3R1UvZy9jTktsaFN6OEVTUHVJM3NFQ2xl?=
 =?utf-8?B?ZkVUbCtPMTJGSVVYRlRlWG9NNGxhdnVJUUdqejJqM0ovNlc4SnNOTG5JOTdL?=
 =?utf-8?B?aVg3NnIvVlp4UjFvT0d3WTdkZzNQYjMyOUNWL00wcnIzVGYrWGVleDlybm16?=
 =?utf-8?B?VnNCcnlaK1UwMTB5MjVOVlVmQjlKRmoyamlJY21NSlB3aUtkSm8wcUMxYUlP?=
 =?utf-8?B?a2x4T2pvdnd6cEVMeU9DTTJKUlpoV1RmdTUwbERpaXljdzJQemlTd1prWTRQ?=
 =?utf-8?B?NFExUmpuVEZVOFBERW1XNEdaYld6NWl0UlBONGN5Z0JIazZNTUZZQzRSS1Vj?=
 =?utf-8?B?ZCtITERubEVqQ0oyanBiVXV3WisyMm9sNUQ5b01CRUczWVNhMFM0TlNaVGFB?=
 =?utf-8?B?YU03eDNHdksrK3dxUEZlNlNUZjV2Vm9Hb1JZejJUZTFiUU9CZXYvNnJ4dXVH?=
 =?utf-8?B?UjRxczFYaGNKNG9FTVJqcU4xdXBBTTNnSnozZlRsVmkycElKMXFJNWd2L01a?=
 =?utf-8?B?UTI3cHJVbFNETzhTamJOZHJIeExSWlZLRUhIRzlTT210emtCWDlLUzZLVXk2?=
 =?utf-8?B?TllLRE40YUwwNzZtU2tvaU45UVlaV3RqMHNoVzJzbUtCY0lRQkdQSjdDNHN0?=
 =?utf-8?B?a09mQ2RWNmZLb0t1ck5aUDN1a3FuTXRCT3dGSldCVGkwU0xKblBTUFY4SzFC?=
 =?utf-8?B?OXZmQ0N0K2NWR3Q3TGZtOXNWb1k2dUNwNWtqMGxGNEV1K0JTSXJZYmVRckc4?=
 =?utf-8?B?bW02WmhDN3MzSHNTRWJvQmxVUEZXdk12MmJ2QW0vQXZLa1V3U1p2OHBFVjhm?=
 =?utf-8?B?M05MZ0pSV2xkR1Iva2ZucjhGelc2U0x1VlNtOVZ1cWNwRWlleFBCTTdzQWpP?=
 =?utf-8?B?SXExRldicUwwWW8wNllIWW0xMTNaU1NKVm9DRXRnQXpjOXZ0NkUwQ0J3aWlZ?=
 =?utf-8?B?YjkzZVlDaUpURlZiMHAzR0JaYitVWVFPbmc1NnEvc05JRjB3YlF1c2ttTm1v?=
 =?utf-8?B?T1Bhb1lNeUlLWTVKN3VwZ0tRZHJZcjVzWGU4aU9zUVVkSjFiTzZlUkFQU29J?=
 =?utf-8?B?Rk95cVRjTEVCcW5BdVlyaFo1QkVtV2ZHV0YvVW1DWlJJdEJoWWZrTUpyek5M?=
 =?utf-8?B?U3MxTzFkNVZYaktjZmYwQ2lSWlQydlNYaUVRQ21aOElNa0E5d2ZrYlczOXZy?=
 =?utf-8?B?ZmdvWXZCNlhyaDI3YnlQZUVZYmZRMEZ0RStBZUtYalc3ZkRDRzlJUmxoTDFE?=
 =?utf-8?B?cGlybFpERkFwOXZ0WmNlREVOUHZZbitEeTNya2FnQWxzemlFTEFxdEpsTXo4?=
 =?utf-8?B?OWlTblVmOU9Ec3luejg0a0s2dkhPQ3FNeEhGbGxsOCszV1RqbDZ4Y09NMzlZ?=
 =?utf-8?B?SFRCNStqaUo2WXVnL2xRZXMwSURTUS9IL1dzZUViczZ2cUpqa2wxQS9zc1hU?=
 =?utf-8?B?OVlnS3BTVkdYdUJQQU4wUlNmajAvWStEdmRjVkZMejBFbkZTdFgvTzlpdWM1?=
 =?utf-8?B?ampDdU1oWlNJZ3JQOGIvc2dQUWpFbG5Na25xc285aWJ3VURaSUNXa01GYVZo?=
 =?utf-8?B?d3RTanhqMTFvU1JTN3h3NStUR0VuQ0MvZERTWlZOY1ZwdG90S1VoY2cyVXVM?=
 =?utf-8?B?M0VZV2xjeUZyT2dCOWdhMXFrRW1vaG9EeVBkbWxIcG5KK0NmaWpvUndJV21y?=
 =?utf-8?Q?teGDJ0+nCCgElcDR15wV9JQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef6a7d0-b382-4acc-3b35-08dc026fb3ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 21:56:36.4375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaYPAIydfJ2or2vwkPTvZ8PZ/6bBk1mOGpBeuiVGPPKsnb2+WDs9DTIEt3OS6q8U+18Pmgz/tgU8AdzxJ6jsuE5Qs5z5fiytrBgPgPo9lrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
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



On 12/19/2023 9:28 AM, Matthew Brost wrote:
> The Guc CT has more than enabled / disables states rather it has 4. The
> 4 states are not initialized, disabled, drop messages, and enabled.
> Change the code to reflect this. These states will enable proper return
> codes from functions and therefore enable proper error messages.

Can you explain a bit more in which situation we expect to drop messages 
and handle it? AFAICS not all callers waiting for a G2H reply can cope 
with the reply not coming; e.g. it looks like 
xe_gt_tlb_invalidation_wait() will timeout and throw an error (which IMO 
is already an issue, because the reply might be lost due to reset). I 
know that currently in all cases in which we stop communication we do a 
reset, so the situation ends up ok, but there is a pending series to 
remove the reset in the runtime suspend/resume scenario 
(https://patchwork.freedesktop.org/series/122772/) in which case IMO we 
don't want to drop messages but do a flush instead.

Daniele

>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c          |  4 +-
>   drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
>   drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
>   4 files changed, 64 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 482cb0df9f15..9b0fa8b1eb48 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   
>   	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>   
> -	xe_assert(xe, !guc->ct.enabled);
> +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>   	xe_assert(xe, len);
>   	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>   	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
>   {
>   	int ret;
>   
> -	xe_guc_ct_disable(&guc->ct);
> +	xe_guc_ct_drop_messages(&guc->ct);
>   
>   	ret = xe_guc_submit_stop(guc);
>   	if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 24a33fa36496..22d655a8bf9a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
>   	return ret > 0 ? -EPROTO : ret;
>   }
>   
> +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> +				enum xe_guc_ct_state state)
> +{
> +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> +
> +	ct->g2h_outstanding = 0;
> +	ct->state = state;
> +
> +	spin_unlock_irq(&ct->fast_lock);
> +	mutex_unlock(&ct->lock);
> +}
> +
>   int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   {
>   	struct xe_device *xe = ct_to_xe(ct);
>   	int err;
>   
> -	xe_assert(xe, !ct->enabled);
> +	xe_assert(xe, !xe_guc_ct_enabled(ct));
>   
>   	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>   	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   	if (err)
>   		goto err_out;
>   
> -	mutex_lock(&ct->lock);
> -	spin_lock_irq(&ct->fast_lock);
> -	ct->g2h_outstanding = 0;
> -	ct->enabled = true;
> -	spin_unlock_irq(&ct->fast_lock);
> -	mutex_unlock(&ct->lock);
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>   
>   	smp_mb();
>   	wake_up_all(&ct->wq);
> @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   
>   void xe_guc_ct_disable(struct xe_guc_ct *ct)
>   {
> -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> -	ct->enabled = false; /* Finally disable CT communication */
> -	spin_unlock_irq(&ct->fast_lock);
> -	mutex_unlock(&ct->lock);
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> +}
>   
> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
>   	xa_destroy(&ct->fence_lookup);
>   }
>   
> @@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   		goto out;
>   	}
>   
> -	if (unlikely(!ct->enabled)) {
> +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
>   		ret = -ENODEV;
>   		goto out;
>   	}
>   
> +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
> +		ret = -ECANCELED;
> +		goto out;
> +	}
> +
> +	xe_assert(xe, xe_guc_ct_enabled(ct));
> +
>   	if (g2h_fence) {
>   		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
>   		num_g2h = 1;
> @@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>   		return false;
>   
>   #define ct_alive(ct)	\
> -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> +	 !ct->ctbs.g2h.info.broken)
>   	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
>   		return false;
>   #undef ct_alive
> @@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   
>   	lockdep_assert_held(&ct->fast_lock);
>   
> -	if (!ct->enabled)
> +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> +	    ct->state == XE_GUC_CT_STATE_DISABLED)
>   		return -ENODEV;
>   
> +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
> +		return -ECANCELED;
> +
>   	if (g2h->info.broken)
>   		return -EPIPE;
>   
> +	xe_assert(xe, xe_guc_ct_enabled(ct));
> +
>   	/* Calculate DW available to read */
>   	tail = desc_read(xe, g2h, tail);
>   	avail = tail - g2h->info.head;
> @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>   		return NULL;
>   	}
>   
> -	if (ct->enabled) {
> +	if (xe_guc_ct_enabled(ct)) {
>   		snapshot->ct_enabled = true;
>   		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
>   		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f15f8a4857e0..214a6a357519 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>   int xe_guc_ct_init(struct xe_guc_ct *ct);
>   int xe_guc_ct_enable(struct xe_guc_ct *ct);
>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>   
>   struct xe_guc_ct_snapshot *
> @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
>   
> +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> +{
> +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> +}
> +
>   static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>   {
>   	wake_up_all(&ct->wq);
> -	if (ct->enabled)
> +	if (xe_guc_ct_enabled(ct))
>   		queue_work(system_unbound_wq, &ct->g2h_worker);
>   	xe_guc_ct_fast_path(ct);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index d814d4ee3fc6..e36c7029dffe 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
>   	struct guc_ctb_snapshot h2g;
>   };
>   
> +/**
> + * enum xe_guc_ct_state - CT state
> + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
> + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
> + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
> + */
> +enum xe_guc_ct_state {
> +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> +	XE_GUC_CT_STATE_DISABLED,
> +	XE_GUC_CT_STATE_DROP_MESSAGES,
> +	XE_GUC_CT_STATE_ENABLED,
> +};
> +
>   /**
>    * struct xe_guc_ct - GuC command transport (CT) layer
>    *
> @@ -96,8 +110,8 @@ struct xe_guc_ct {
>   	u32 g2h_outstanding;
>   	/** @g2h_worker: worker to process G2H messages */
>   	struct work_struct g2h_worker;
> -	/** @enabled: CT enabled */
> -	bool enabled;
> +	/** @state: CT state */
> +	enum xe_guc_ct_state state;;
>   	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
>   	u32 fence_seqno;
>   	/** @fence_lookup: G2H fence lookup */

