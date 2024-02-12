Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36517C48BC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 20:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E993410E186;
	Mon, 12 Feb 2024 20:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoWcHnmm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786EE10E22D
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 20:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707770935; x=1739306935;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VEbHGWFB8j9ClTHQhyBEj4PsLblRPS/HEu4Rxkf2AJk=;
 b=HoWcHnmmRhWYP6Cx4vC605zA1jVFrnyphHYtPZAbTem3XKeP+StcCxVa
 N9ONQw4qboPzD9Zvn2B5bN/fKo6mt6/BsTHFz396b8ghu0QFamg8sRDCe
 Ok685OZDJTFJHJS9/je6bhesjWLZUQW8J9QP0LOACK77nwGq6CTpLhK+a
 JhfXraF6SKwnlOC2a7HISVwnyOn0F8ngzoxgGLoj5lZK1OVpnrCC3FAmC
 0DP9en79+dA2EDgEfseZ1CtgCdg5hnO1DtgU2rkihWw16HzXaUaBzLI1k
 Efokqb7mQErf4p1rUL5XXcJvymoMZLDyPAFVt5Qqqg3Z+aaG46egWxni2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1903643"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1903643"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 12:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="33494493"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2024 12:48:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 12:48:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 12:48:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 12:48:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsNgsK1CqDNxgCLAyQrJNv9SeGo3AXPJK2HZzZiXBG4DU1v6fa6jGh1hnbf4tTI1PGsIUOTYv9H0DJTzlzHe3uIx+lXdhYBW7/mImSF5Bn0WeYD9490fBOl/4un7PDpnzpncz6Q350I3GE9Ls7yjKtGlXUek6QzOj9c2sHSq0IzA8q6tTBY4S6KDmTQN3JfmVvuj752FNSjBU8HwOtwXNP9vGtYULSL6Hf1osI4NBztQr5KLrIyNH5KNp9rHAIiUDqkKeRhuhqTzs4PdxAKVDnFXFn4D5NkqnM9Tp+TNz+vxz+AKNE8KZlPbT8XhLhfBJYSRJ5bCqeMaEp0JQb9KpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ORr6LdOB7GHiuO4dfGOsg6cSVaQMhJJtXWXBcoNl2U=;
 b=R6OFt7HRtLfrLN+ERk5bO/E8DYkgsu1UKO7FG4Ie5ycDnSqWFCdOxW0Yb+fXsnNR/qkl+0Rf4uZdC/a6GVmPd18hZG5Iv3KsckqTKTaZKRtHidUA0saw48G/JMk5lT/93Oi8uuIbJEjEevB6+yHofo2wzhmh5Ve4SwQqtZisUW2QrKagvR7DmqZ27xzPyBelxZh1gIK5N6vQKwyaLCiWziFFFz3jhFDF6DKRomaUqOcOI+R2+nw+FNBLBV2omufJEbkF+6XSwYfMfcyO2FjQ1Cyqx+gmiWXNB7BbX23TMBCRE30RqT7urixMjuwDZM1t4S4TK+Ss0XF127wNifPcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Mon, 12 Feb
 2024 20:48:51 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::83d:7cbc:ec45:cb9d%7]) with mapi id 15.20.7270.025; Mon, 12 Feb 2024
 20:48:51 +0000
Message-ID: <615f8c4a-fd3d-4512-9dcc-80d6b5e27731@intel.com>
Date: Mon, 12 Feb 2024 12:48:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uapi: Remove unused flags
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240212161654.7-1-francois.dugast@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240212161654.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: b53151de-a830-474c-32be-08dc2c0c0513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pbex2HaTqvBsAkykwmqSHNyWhOozM+YN4xuXVvzdSDQN3iChBNcMqRgtErc2dEvW1ILn67dqFL1WeWkD1NL/Zm1W+9cdO7dRSIlmPKqSEB1jR0GjLgetJ4ac4HnaJAS3lMcma5JXglLs4UlLpXX5QDQQKN/R9GZn63Gdm0Fl2UOfXSFoNMfLT5YTi2nHuSyuFUMh/owbZHygiqF1NLD//+hCEWeQlSiO7aBFKtJXtlf2NhfoSS2rQAd7tsEM3gatEuLkiMDB2tqVINEp5OvWXE0aZE3zyCXlPHF/Ojg26j/lCy9twqQrfzuMl0Y6zCl82kC0oRVtVli4dfh2pMFo//7Ghqsdjl9xk3HB1CrtCWD7HFVk21il9/aa9D0E4P2XE91VFDZLF0ekOvHqm9hPLUepWn3+tT6ZoDACgMR/UIr3aoumWNGMmLvmYGPs6pYMZmHkmeTOpmSPM/H3j0CvILnJ3iUM34Ftjx/UjNwaitGG/aOpMqei5qcRYlP5G7h7TMa3GqrCgO0Ws+507YhLCa6E2bKLlhun09qG6tWWIt5zD2A4/HnT+AgaQZGdyzSS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(31696002)(26005)(2616005)(41300700001)(2906002)(4326008)(66946007)(8936002)(5660300002)(66556008)(8676002)(66476007)(30864003)(478600001)(83380400001)(316002)(53546011)(54906003)(6486002)(6506007)(6512007)(66574015)(86362001)(82960400001)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVRbTgyMkE5VDlqOHI1eitYOWRvUTlVY2tuTG5jWm9lMk5zWWlGd2hqWWhB?=
 =?utf-8?B?dEtCRnNqVUdyQmhKQUxzbkg5UCtiZm8wQWdlZkpEaEtIQVZ5czVmUmYvSmxY?=
 =?utf-8?B?aFhsNERmamlUY01UWFJCQnhEVnZlTGJ0bVE4amV0SnZxNlJZakdwSmEvT1lr?=
 =?utf-8?B?N0ZQc0JvWkdKbkJRMGd0NlRRTDBqVGpJbnU3UGloMm43RUFCOWJHdE83T0ho?=
 =?utf-8?B?aXY3aW51VFQwWmlZMFNEVnFNZklHb011SEQ4RVptL3NmSElMTzR0WUVDMFox?=
 =?utf-8?B?cTRGZnk2UzFCczArVHdISDdpUmVYRlE0TWlaK2VHZHV1WmV5eHFjeExVdGhE?=
 =?utf-8?B?MUR4bU83UEVFRy9ad25YSngrditXVEtxbmFXcVE0UUwvNG5ZYlJldDBGNmpO?=
 =?utf-8?B?N01ZK3M0TWhrbjAyVlZSNDdCNjdweXBzdjk2SFJEbnMrU2VyRGFXQWQvSWN4?=
 =?utf-8?B?V3dCUlB2OGdMVjBIODlUOUt0TEdubFh6Y010U3JsTXo1V1FHNHZ3MzhmeHN0?=
 =?utf-8?B?T0JJK3JaSmhGWUhxK1hZVzdhR2RadCtmeFdKNjN1czNCY1VUNk5UcHpyMFVG?=
 =?utf-8?B?WndSRStua09Bb2FjZ2RFK0NLaHEwOVJKOXZpWnFEaTNqdmhPN2NMbXhWR292?=
 =?utf-8?B?V2lGYk4zMFc4Y21sWXlyb0loVDVGWklJcDhXdkFhTUxYMW5XSmIzUXZFSm4v?=
 =?utf-8?B?b20xUG11QVUvZVlxUWxiaG85QTd4YUtlNmJRS3AzTDVvdzJEd1BGRWc2endn?=
 =?utf-8?B?NThHQml0RmpNam9KQnRpalFybzdTditzMTFMZzhHTDU2SHlscDZzd0d0T3p4?=
 =?utf-8?B?YTdkSW12aWdxcVp3eWJ2SXA2R3Q4SmYwdkY1QWRzdEE0NUpKbExtUEJENndP?=
 =?utf-8?B?YXA3aW5ycEgxOG9XQkd3WGFhdkV0elp0Uis4Mmx5WlFHNzhWU0YrRXZwREtj?=
 =?utf-8?B?MVpTYkNzeFdsV0ZLb09VNXhTRkNEUkZCVnl3eHpJTUgzcmJhSlgxM1ZsT2JP?=
 =?utf-8?B?MDR4UXFPYTZPM2dyalRPV3h1NjdFZE9nM1JGS0RjQUdLL3ZWcWZJa2hwQm5h?=
 =?utf-8?B?NVZadkRhenppQ2E0MzA5bmJLVE40YmlDeWNrclo0cW96MFo3QXByK2lGZWsw?=
 =?utf-8?B?SFB3ZFdYL3hsVGtIUUpUdTNWaEk5ZkoxUXExUEoxSTR0NzFPMlhUbGZ2Z0RK?=
 =?utf-8?B?OTAzUjE3Tk1oZ0p6dXU4RWlhdVhoMVA3ZWJtS29pMDdqUm13VGFEOXdvWHpk?=
 =?utf-8?B?RG8rV3B1MktJZFBnS25ZU1NmVGNWVG01dElxL2hGMXkzR0ZnaHNOTS9JWkxH?=
 =?utf-8?B?Qkd6cmJnMlBYUWZXYVBYOUtEZm9oa2cvWC9pTGVQR0VzQTRRSnlsdmVMTEsy?=
 =?utf-8?B?bGFMZGJoTHgwUzBxbFZyUXRSOVRieGdDUzhIS0pmdjJWVERDVFFuRXJNa0Y0?=
 =?utf-8?B?N2pnQ0JIM3kza05ZTFVNT3VzOGJFVFhlMitGaGNXWC9zK2FRcTNlZUNPTUtX?=
 =?utf-8?B?dVAxN0UzWElRNERYc2pKZkw2TVE1ZlhQbkdmQkRRY0wxbmg4TFJXckJVcVd6?=
 =?utf-8?B?QktMZFpvYU53YnNpdExWRUlmaC96TFhCRk5ndnBlek83YS9lcTAyVjZYQXZJ?=
 =?utf-8?B?YkIyZEdHUTFwelA0dWkzdlZNeUJ3azBWNVZYaXdaU2dMUk5hWC9iZTN4R0lS?=
 =?utf-8?B?UjkxRlZsQ3NrS1U0NXpkb0l2bHNGSEpmbWdGV2RPMkJxUEpleW83MzNYc1Js?=
 =?utf-8?B?R0tTK1RraFpUZStmMUJGemgweUdlQlE3cm43T2pLZFRYTmpQdms2dzBjdWx1?=
 =?utf-8?B?R2pvaHlJeDlHRG0rYnF6MVBaMngzbE5tbFVLZFZSV1BZd1llYWl0UjhzanNF?=
 =?utf-8?B?aUcweUFhSm9tU3ZEMkZ2V3NpNXRxNW11OGVlcWhxTGt1ZFhHcVdxai9sbzMv?=
 =?utf-8?B?MXlqL3l1LzR0ZEsxMXBnbE1kb2hId1M3eEtzakt4d00yOHAxVFZxTmg4SlNT?=
 =?utf-8?B?ZlJLbXU5VXpBS2FZcGJZQU5INzdLUld4Ym5ObmIxam95c0g0dzVYWDVZNXQz?=
 =?utf-8?B?SkpuZHcvSDFOemphZENYT1JXNHIzWkdOeUVWOHloZENsdUhlblk4ZFUwWisz?=
 =?utf-8?Q?Gt2x3ZR+FLpo8sGUkSmFqouJC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b53151de-a830-474c-32be-08dc2c0c0513
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 20:48:51.7476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4hvQgLEhSb8NQe/gsR9p4abNTdEQlcANOREV3an1HShLLhnr5CxqFLX345O2KxM7yZ6up89WM0DBSgwRJdiwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
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


On 2/12/2024 8:16 AM, Francois Dugast wrote:
> Those cases missed in previous uAPI cleanups were mostly accidentally
> brought in from i915 or created to exercise the possibilities of gpuvm
> but they are not used by userspace yet, so let's remove them. They can
> still be brought back later if needed.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c       | 90 ------------------------
>   drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ---
>   drivers/gpu/drm/xe/xe_lrc.c              | 10 ---
>   drivers/gpu/drm/xe/xe_vm.c               | 41 +----------
>   drivers/gpu/drm/xe/xe_vm_types.h         |  4 --
>   include/uapi/drm/xe_drm.h                | 25 +------
>   6 files changed, 5 insertions(+), 175 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2976635be4d3..b200089bca77 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -359,26 +359,6 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>   	return 0;
>   }
>   
> -static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> -					     struct xe_exec_queue *q, u64 value,
> -					     bool create)
> -{
> -	u32 min = 0, max = 0;
> -
> -	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
> -				      XE_EXEC_QUEUE_PREEMPT_TIMEOUT, &min, &max);
> -
> -	if (xe_exec_queue_enforce_schedule_limit() &&
> -	    !xe_hw_engine_timeout_in_range(value, min, max))
> -		return -EINVAL;
> -
> -	if (!create)
> -		return q->ops->set_preempt_timeout(q, value);
> -
> -	q->sched_props.preempt_timeout_us = value;
> -	return 0;
> -}
> -
>   static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
>   				      u64 value, bool create)
>   {
> @@ -396,71 +376,6 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
>   	return 0;
>   }
>   
> -static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 value, bool create)
> -{
> -	u32 min = 0, max = 0;
> -
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
> -	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
> -				      XE_EXEC_QUEUE_JOB_TIMEOUT, &min, &max);
> -
> -	if (xe_exec_queue_enforce_schedule_limit() &&
> -	    !xe_hw_engine_timeout_in_range(value, min, max))
> -		return -EINVAL;
> -
> -	q->sched_props.job_timeout_ms = value;
> -
> -	return 0;
> -}
> -
> -static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 value, bool create)
> -{
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> -		return -EINVAL;
> -
> -	q->usm.acc_trigger = value;
> -
> -	return 0;
> -}
> -
> -static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue *q,
> -				     u64 value, bool create)
> -{
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> -		return -EINVAL;
> -
> -	q->usm.acc_notify = value;
> -
> -	return 0;
> -}
> -
> -static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_queue *q,
> -					  u64 value, bool create)
> -{
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
> -		return -EINVAL;
> -
> -	if (value > DRM_XE_ACC_GRANULARITY_64M)
> -		return -EINVAL;
> -
> -	q->usm.acc_granularity = value;
> -
> -	return 0;
> -}
> -
>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>   					     struct xe_exec_queue *q,
>   					     u64 value, bool create);
> @@ -468,12 +383,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>   static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
> -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
>   };
>   
>   static int exec_queue_user_ext_set_property(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 648391961fc4..28b297208a37 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -162,16 +162,6 @@ struct xe_exec_queue {
>   		spinlock_t lock;
>   	} compute;
>   
> -	/** @usm: unified shared memory state */
> -	struct {
> -		/** @usm.acc_trigger: access counter trigger */
> -		u32 acc_trigger;
> -		/** @usm.acc_notify: access counter notify */
> -		u32 acc_notify;
> -		/** @usm.acc_granularity: access counter granularity */
> -		u32 acc_granularity;
> -	} usm;
> -
>   	/** @ops: submission backend exec queue operations */
>   	const struct xe_exec_queue_ops *ops;
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8c85e90220de..3d615db8edc2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -706,8 +706,6 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>   
>   #define PVC_CTX_ASID		(0x2e + 1)
>   #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> -#define ACC_GRANULARITY_S       20
> -#define ACC_NOTIFY_S            16
>   
>   int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   		struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size)
> @@ -777,14 +775,6 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
>   	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
>   			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
> -	if (xe->info.has_asid && vm)
> -		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
> -				     (q->usm.acc_granularity <<
> -				      ACC_GRANULARITY_S) | vm->usm.asid);

Please fix above so that XE_VM_FLAG_FAULT_MODE continues to function 
properly.  I believe it should be:
	if (xe->info.has_asid && vm)
		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);

Do we not have any XE_VM_FLAG_FAULT_MODE testing in CI?


> -	if (xe->info.has_usm && vm)
> -		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
> -				     (q->usm.acc_notify << ACC_NOTIFY_S) |
> -				     q->usm.acc_trigger);
>   
>   	lrc->desc = LRC_VALID;
>   	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 836a6e849cda..af280e98e67e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2067,8 +2067,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>   	struct drm_gpuva_ops *ops;
>   	struct drm_gpuva_op *__op;
> -	struct drm_gpuvm_bo *vm_bo;
> -	int err;
>   
>   	lockdep_assert_held_write(&vm->lock);
>   
> @@ -2089,23 +2087,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   	case DRM_XE_VM_BIND_OP_PREFETCH:
>   		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
>   		break;
> -	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
> -		xe_assert(vm->xe, bo);
> -
> -		err = xe_bo_lock(bo, true);
> -		if (err)
> -			return ERR_PTR(err);
> -
> -		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
> -		if (IS_ERR(vm_bo)) {
> -			xe_bo_unlock(bo);
> -			return ERR_CAST(vm_bo);
> -		}
> -
> -		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
> -		drm_gpuvm_bo_put(vm_bo);
> -		xe_bo_unlock(bo);
> -		break;
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>   		ops = ERR_PTR(-EINVAL);
> @@ -2117,10 +2098,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>   
>   		if (__op->op == DRM_GPUVA_OP_MAP) {
> -			op->map.immediate =
> -				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> -			op->map.read_only =
> -				flags & DRM_XE_VM_BIND_FLAG_READONLY;
>   			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>   			op->map.pat_index = pat_index;
>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> @@ -2307,8 +2284,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>   		switch (op->base.op) {
>   		case DRM_GPUVA_OP_MAP:
>   		{
> -			flags |= op->map.read_only ?
> -				VMA_CREATE_FLAG_READ_ONLY : 0;
>   			flags |= op->map.is_null ?
>   				VMA_CREATE_FLAG_IS_NULL : 0;
>   
> @@ -2439,7 +2414,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
>   	case DRM_GPUVA_OP_MAP:
>   		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
>   				 op->syncs, op->num_syncs,
> -				 op->map.immediate || !xe_vm_in_fault_mode(vm),
> +				 !xe_vm_in_fault_mode(vm),
>   				 op->flags & XE_VMA_OP_FIRST,
>   				 op->flags & XE_VMA_OP_LAST);
>   		break;
> @@ -2714,9 +2689,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   	return 0;
>   }
>   
> -#define SUPPORTED_FLAGS	\
> -	(DRM_XE_VM_BIND_FLAG_READONLY | \
> -	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
> +#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL)
>   #define XE_64K_PAGE_MASK 0xffffull
>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>   
> @@ -2796,12 +2769,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   		    XE_IOCTL_DBG(xe, !obj &&
>   				 op == DRM_XE_VM_BIND_OP_MAP &&
>   				 !is_null) ||
> -		    XE_IOCTL_DBG(xe, !obj &&
> -				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
> -		    XE_IOCTL_DBG(xe, addr &&
> -				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
> -		    XE_IOCTL_DBG(xe, range &&
> -				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
>   		    XE_IOCTL_DBG(xe, obj &&
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>   		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
> @@ -2820,9 +2787,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   
>   		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
>   		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
> -		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
> -		    XE_IOCTL_DBG(xe, !range &&
> -				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
> +		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK)) {
>   			err = -EINVAL;
>   			goto free_bind_ops;
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 5ac9c5bebabc..fe92f9fc766e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -286,10 +286,6 @@ struct xe_vm {
>   struct xe_vma_op_map {
>   	/** @vma: VMA to map */
>   	struct xe_vma *vma;
> -	/** @immediate: Immediate bind */
> -	bool immediate;
> -	/** @read_only: Read only */
> -	bool read_only;
>   	/** @is_null: is NULL binding */
>   	bool is_null;
>   	/** @pat_index: The pat index to use for this operation. */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9..868e3ea10078 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -827,14 +827,9 @@ struct drm_xe_vm_destroy {
>    *  - %DRM_XE_VM_BIND_OP_MAP
>    *  - %DRM_XE_VM_BIND_OP_UNMAP
>    *  - %DRM_XE_VM_BIND_OP_MAP_USERPTR
> - *  - %DRM_XE_VM_BIND_OP_UNMAP_ALL
>    *  - %DRM_XE_VM_BIND_OP_PREFETCH
>    *
>    * and the @flags can be:
> - *  - %DRM_XE_VM_BIND_FLAG_READONLY
> - *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
> - *    MAP operation immediately rather than deferring the MAP to the page
> - *    fault handler.
>    *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>    *    tables are setup with a special bit which indicates writes are
>    *    dropped and all reads return zero. In the future, the NULL flags
> @@ -912,23 +907,20 @@ struct drm_xe_vm_bind_op {
>   	};
>   
>   	/**
> -	 * @range: Number of bytes from the object to bind to addr, MBZ for UNMAP_ALL
> +	 * @range: Number of bytes from the object to bind to addr
>   	 */
>   	__u64 range;
>   
> -	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
> +	/** @addr: Address to operate on */
>   	__u64 addr;
>   
>   #define DRM_XE_VM_BIND_OP_MAP		0x0
>   #define DRM_XE_VM_BIND_OP_UNMAP		0x1
>   #define DRM_XE_VM_BIND_OP_MAP_USERPTR	0x2
> -#define DRM_XE_VM_BIND_OP_UNMAP_ALL	0x3
>   #define DRM_XE_VM_BIND_OP_PREFETCH	0x4
>   	/** @op: Bind operation to perform */
>   	__u32 op;
>   
> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>   #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>   	/** @flags: Bind flags */
>   	__u32 flags;
> @@ -1044,20 +1036,7 @@ struct drm_xe_exec_queue_create {
>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> -/* Monitor 128KB contiguous region with 4K sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_128K				0
> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_2M				1
> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_16M				2
> -/* Monitor 64MB contiguous region with 2M sub-granularity */
> -#define     DRM_XE_ACC_GRANULARITY_64M				3
>   
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
