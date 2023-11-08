Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D1C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 22:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5934210E878;
	Wed,  8 Nov 2023 22:25:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE07810E878
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 22:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699482304; x=1731018304;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VoiM4738qWueBd/14+IILFaLGj+TWWRwmZZ7GHVpma0=;
 b=G7raffRdBLa3c/9uXruR8CHWW/bmVRqCjlrO49aBLHuGP5ZkcKnLkYWE
 /AcJwoSZ/ApURfQ38e3yqOsjCZuhfS3eOGLQ4zB04MHSE02JD221nbgxO
 KC/tupA9e7kjRcJfneTyv+nA+8EAFoBR1P/PJeHBzcFUjg9lqkVaAo6uM
 qKcNCq+I2k7j8pgDyOJmVXXQQ9tVxrSsJsBEUPUySTQlzAqR3wc1mqlVY
 pBOxka3GVw+XKXaAwJU0zqWHxZTLkWyp3qZUc5nqaaIQeev6x9EdB+UE0
 WdSD9q4ajOu+69eSI62kuQaJXAu323xtImcsyAqfh7HIanTr0mE1WojqG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="388725729"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="388725729"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 14:25:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="713087692"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="713087692"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 14:25:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:25:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 14:25:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 14:25:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 14:25:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIiJJb8hRO8fRMM6S4zVa7mdzO+l2bvcbOUfjmxS7Jh/DMkDxECgvsxMOI1vqcm4i20+Hib0saZqimtLoJa3aEv5KeypG/Z+TSy3TJeHzsN4c2YlXTGo7cNWWSNFApZKKarzT9b+xYHy42tyJrAeG8jmXJ2X11BVaJOsLTPk1IDGgvEmffiA5WLP0P7J9xU9FDbKlRutkl/5ijPb7mwC+EwhDjOjO5isv6Ct3Gic/XJywnntRY04uH4htOsA1jwoDDZR0vZf9YOqWajbwHlYgQyO/b+HZnoMY99VzK+RILnsHpPH7byhis6HGpqtKVx3gnazePlmi8bn66b1YlhzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fR42Kb1oyBZrwoUmeFh6e8BwSvlMBR+fDORz4O8cUsw=;
 b=fi/e06aRahzZF0kD/rM0k4sdXvNGhbALlJ6b8fQob62vQRPkgLtd+ohn8lLs0FarCcW2q5XrwafhnXVVJ0jg6GbcmzWF0CRdWIMoQfkCEa9fjQcKcZKBuUG1n489E77KbX8S9VBGUJOV80i1eZ2L0J/tIuOfImqHySV9R8j2UkVWatFMhOncH/re1yBzskCC2+THDEBesAlJZ1MhV1tshhP/kmk5D7F+UEv2eW0f3XkAgJTmQ4zwYeG+32uFEqfTLBQy7DywMy9P24trtYgEXDZ6zKdRKHu/AAjmwlngMQsK7YK2Vl/TnmiSZ6manU1eoatTuN9TMscbH554nPuB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH0PR11MB5952.namprd11.prod.outlook.com (2603:10b6:510:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 22:24:57 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 22:24:57 +0000
Message-ID: <7f9b6b64-7103-44d4-ae28-2faea7f1a675@intel.com>
Date: Wed, 8 Nov 2023 14:24:55 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-9-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-9-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:303:16d::35) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH0PR11MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: 155a22f4-be89-416b-0f78-08dbe0a989cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDlZfnFx1jGQqIJJ3ZwqPCD5l7uMj+DHmQBJkcakKFBS8JQVmxMzIKYxDICXNoXj20nlu48Nuz/LvfhlWotxcIVpvno/gHg/1hx9R64CaAiBnCd9JRLYhM+JBWi0HLNDXO/1Ot32S3Y8sImpViOmdN1Arlu6oXLugQXSUNk5GM8p2EiaH0FL+/tfgFaKWj3xOkM3VRjGq++4wQuRAz6jAC5oiwqdSXEWhKr4A+YElZwgZvAOlNxJNoqwJKjjMqKK6FUjY9lqDaAjDemEGWR7R0irfY62FDi4BQUz0ijHYATDwlf5E9byZORXAkCuBofVJSxb/kDaB7bf8mJwxrkF5DeSXtaMhveV6/bnJXb47Jx6ZvnSejalyro1y/IaUx/+9+VTDszW4qXyWsBuuj0RgE6gTQILzXYYMJueIXkZEVghD5YA5EnNFcROrGsnzOWCP0emtVBFxmjW5Z06ZhLsieTNCQLx/VsU+hxdd0/ZC4ytFFWWlUSV2sFLS+Z7jmWjbe+lcLaLnacoWGshWFGyt5u776mmE8Kxhr6LHhPLi/lE3IhoUbxtKoMIT5oExBJBHBvfdsaqlsxfLN8G+GpZhKf+47Cnobjh6z1zm7XU2j4vDuL/OqaJM3fSIwtmUd/QRuibK2KsZtTjomKVtApUNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(316002)(82960400001)(31686004)(2616005)(86362001)(66946007)(5660300002)(66476007)(66556008)(478600001)(8676002)(31696002)(8936002)(6486002)(2906002)(38100700002)(6506007)(53546011)(6512007)(36756003)(83380400001)(26005)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEhjQm5RTHQrc3JFb0Z2NG5wQ3BzMWE2NXUzdTZ1cXpyNmhXQndVOWtJZlYv?=
 =?utf-8?B?MW43ekx0ZEgxdkYrWDhBdDZNc1hZaDVMaUhzc1M1aUxqekhpMFlpQlpJSXZR?=
 =?utf-8?B?T2JnZTVlb1dVd05YTmZOR3F6NjhSeWp1MXBkZ1lvckNwS3hrbjdLVWlYM1da?=
 =?utf-8?B?amVsV2Z1eStCVFgvZmhLZ05sNGt5OSt0elFrNFFNR3h5S1piNnRuQmU3UmhU?=
 =?utf-8?B?VlVWSFV6NzdRN2V0L1FHa01ReWYrOVI0MlBmUHNwWGJhbnNoTHAwbzBodGdE?=
 =?utf-8?B?bjF6bithUlpFQVRqQ0xNLzFLa0FRRW1MQ215eVBDTUZmS3R6blg5VXRYeElY?=
 =?utf-8?B?cXBFQlk2ZjVMWHRrdjZBMGNxNnQyN2h2SUpvSlc5dndYdnFVN3QyWXRFd3Nv?=
 =?utf-8?B?M3RSWEoxc3loU1JTdmZFdGJvaUFwTFFOeVBVaFBqQWRrQjVsK0tLdVdUZFZy?=
 =?utf-8?B?eUFvYms1aU5uRm41d2FudjR1Z2RUcEYwM2tIUUpjU3Naa3RleFhjWWdJcGJB?=
 =?utf-8?B?TGdUWWdEY25GQzVBRGFhd1JVTFZZb0JTVGFiYmUySnNDMzRJeFFaNjBiWGlG?=
 =?utf-8?B?L2JZaTI0RDlJRmYxM21sOUlEOHZ3VXViVGFYVzFLZ3o5UTRBODR2NENIdGZa?=
 =?utf-8?B?K0xaU0VPSW5KblQ1ZzF4M3BjTmlCeGU1MkZ0SUZ4a2h2Uk9FSmc3RU1jQVAr?=
 =?utf-8?B?bkVqdy9YdGErbkVRYlVFYm1KNDJpL2tlbjdhbmQ5MEc3WjV5Y1dkckw1aU1z?=
 =?utf-8?B?N3pUbVU2aWVQZkZ2c0dZRzNQQXFFcWhFa25IdE9tb0R0azRaQi9jM1kvcUJF?=
 =?utf-8?B?ZG5EM1dqMU0ydkQveXhOWlZJWGdndW1EMlk1MldPTVRKMDEwa25aNFpyOWE3?=
 =?utf-8?B?TjI1SitQVnRkdS9yeWQ1bXJjTExiVjl5QXVUSk9mYzhrMHpwSnBnSWs0aVRk?=
 =?utf-8?B?RlhYajI5K2c3OVhrenlyNzcyWnREbEp2WUNCbTVTVlpXREpaK0h2MmJacWdW?=
 =?utf-8?B?ZHM4b1p4UWpxdEI0aS84ZlRCdDk3WlF6ZkdCanhNRm11YVJzMjFaWXI0Y2NS?=
 =?utf-8?B?UUhkVEt3c0ZKdWhqU0VWenQrWXBDcnVaNmVwWE9WUERlRmJnZ053d2ZQUWY0?=
 =?utf-8?B?N290Uy83ZnNLSDRvQ1VjS2crbWdTdyt0WTREdVEvbGRta2R3R1YzY0hLMjRu?=
 =?utf-8?B?bXZIcG1lNzVrSEtCbFdBaXlJYWxWVlRic1cxZkFwSDlXVVd0ZXhMOGVUYWZ5?=
 =?utf-8?B?dndQU2c5aGVtY25XOVcwRFRZMDdZd3F2Q1hTbTFSUGRmVlJyTVJ3UThnSHVN?=
 =?utf-8?B?blZ6Q285ZzVOWHdEbDZiZXh0VmdHSG5FbDdpVk9GbXhUc1BqY3ROZEIxQkh4?=
 =?utf-8?B?RDFBMVN2RGRRRW02Q0tvcjQ1dnNZOHZCZ3V1WEdTZnN1eFdLZFBUVFBpWlpL?=
 =?utf-8?B?Z2FzTFJSUnBrcVprZXdQeVhNN3VSVExJWlhySk1leEhYNkZzekNYWXFNQUVa?=
 =?utf-8?B?SDc2MWZrdjZMSm5wWnYyR01GbXNxRENpU1dvQmxHNFFLd1J5ak53NHdJRVZO?=
 =?utf-8?B?eUI0WWZKL1hUSDJZSUFxUC95Z2ZQdmxpaXY3Sk52eXk5a1ljM1N0a0ZGdGJs?=
 =?utf-8?B?c3V6WHIvN2FYYVJXc0FwRUdxUlQyNkthRnVEMkd4NXZ4d3hFdnBMaXlrMm5B?=
 =?utf-8?B?RE1xN0VSUDlkWmdCZk14TTI3Y3V0SlpicTl3K3NhQ1Z0NVhPSmdINlNoeWFv?=
 =?utf-8?B?VjdGWWh5cHVDMUt4RFg0THhlenZtMjlhcGJFTUYvQnNiT0RyTmRnWXNkWUw1?=
 =?utf-8?B?MFBPRGJSV08raGNDT1VkbzVnemNxZWdWektna0xYYTYrNy9YMkduZE96azdk?=
 =?utf-8?B?djVYczZGUVY5eXh3MU5VNExZR3ZKRDRwZ1BsSnRVem1rWmZKN1Nvd09seVgz?=
 =?utf-8?B?ckNQc3FrZjFkUUYvajhpZWFmWGM1ZXl2L29WMGw5RjBVYkVlclJielZxWmZN?=
 =?utf-8?B?T3oyNVFEcXRvVGNRRWl5T25yM0dnSkpSYmdSd2d1ZnF4eFNKMElUeks2YzZH?=
 =?utf-8?B?VjVOK0ttOWZyTEpMbllLNEU4SE1OcURuYVZvQnlpMEN3TTdycS9EbUtycG1o?=
 =?utf-8?B?aEJFWmRjQ09tOHFMa0pIblV0NDlpOW52b05UKzM1dGxuUkJOaERaYURJQm1C?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 155a22f4-be89-416b-0f78-08dbe0a989cd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 22:24:57.3639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHE+4B+gLB+T2owOU7AHAmHTU/+yGNe9s25wcg3RFuTEjC0SnDppLnWNdZWRSdjdTXswrycuUfOQ1EXI3ikoIyanE5SXFDOLEFzcM8oCg9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5952
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/12] drm/xe/gsc: Trigger a driver flr to
 cleanup the GSC on unload
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

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> GSC is only killed by an FLR, so we need to trigger one on unload to
> make sure we stop it. This is because we assign a chunk of memory to
> the GSC as part of the FW load, so we need to make sure it stops
> using it when we release it to the system on driver unload. Note that
> this is not a problem of the unload per-se, because the GSC will not
> touch that memory unless there are requests for it coming from the
> driver; therefore, no accesses will happen while Xe is not loaded,
> but if we re-load the driver then the GSC might wake up and try to
> access that old memory location again.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gsc.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 7e5ba9039163..edf74780322a 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -106,6 +106,7 @@ static int gsc_fw_wait(struct xe_gt *gt)
>   static int gsc_upload(struct xe_gsc *gsc)
>   {
>   	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
>   	int err;
>   
>   	if (XE_WARN_ON(!xe_uc_fw_is_loadable(&gsc->fw) || !gsc->q || gsc_fw_is_loaded(gt)))
> @@ -117,6 +118,23 @@ static int gsc_upload(struct xe_gsc *gsc)
>   		return err;
>   	}
>   
> +	/*
> +	 * GSC is only killed by an FLR, so we need to trigger one on unload to
> +	 * make sure we stop it. This is because we assign a chunk of memory to
> +	 * the GSC as part of the FW load, so we need to make sure it stops
> +	 * using it when we release it to the system on driver unload. Note that
> +	 * this is not a problem of the unload per-se, because the GSC will not
> +	 * touch that memory unless there are requests for it coming from the
> +	 * driver; therefore, no accesses will happen while Xe is not loaded,
> +	 * but if we re-load the driver then the GSC might wake up and try to
> +	 * access that old memory location again.
> +	 * Given that an FLR is a very disruptive action (see the FLR function
> +	 * for details), we want to do it as the last action before releasing
> +	 * the access to the MMIO bar, which means we need to do it as part of
> +	 * mmio cleanup.
> +	 */
> +	xe->needs_flr_on_fini = true;
> +
>   	err = emit_gsc_upload(gsc);
>   	if (err) {
>   		xe_gt_err(gt, "Failed to emit GSC FW upload (%pe)\n", ERR_PTR(err));

