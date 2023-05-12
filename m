Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F83C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 05:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3622B10E61B;
	Fri, 12 May 2023 05:45:22 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A2D10E61B
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 05:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683870321; x=1715406321;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CEGASLRO+EIEm54M8am1vLQXp+ZyQJnED8Y2/bUGyW4=;
 b=CiQ2NjJ2EygYYsQNBX1g+yhimNKkwKeMJdj5j4YdvhSIh6PnWWqFZ45J
 bA6bayAN3lz4vpSPleQ5ntcjrnnGcdNlbu9HDw8DUVyWPtK6UIoZNvrO9
 LJRlInN8871oe1P2m/bpUc2kGXNxnbCOFeIByJeQnkoreo/uW7ri/gQhf
 AJ5YOHktsos6hHl0bphKH2syfZ+YqF3FR90NjlbgCIbDc9+4cCipkV4/Y
 IAxJEUxOSj4RJ5ATnTxFlJovO8BbK/H9OsoB6+IZ6ACEvm8rlUpYnRdsu
 OVdJXnKD5vgFrGTXu6ZhWE9IY28s/k3NfmHs3fCleMagT16cZ+OXXDf5G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330327886"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="330327886"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 22:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874262955"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="874262955"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 11 May 2023 22:45:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 22:45:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 22:45:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 22:45:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 22:45:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnVnpdQQELfAL6vQXAkPv9fvriCjSj/tQzY49g8GA3nx2QPA1G7dmvamDLeg9VpVSyGfG//sQV4lP7gY3u/7G/x2WwLS6DxBai7wiraAms47imcx8iOP1gGdCxFC4UAVjJMxiyellwlrUvmvw0Dj0JDh5zkqO5Q/rAezUJUSO/z22g/SfX/TiCY8lrR+J0PFw6BTGOsoNgkFMDrTVWaz7eeoKax79vKaANpeYM/LDDQa8/E5D5xgHkwEoVHZefDQYD8OwGKljLkDYQ+2nlF6hI9LLGf7+QJhTOl3DyJKqCaLdf1nVUHH76pB8xDJcs7PrEdmlhUe56BR8UKWQTKjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5s/hCh7yOXrdLmfptTKEgVfKJyXenN3JDzSBTHDAzU=;
 b=KQ1rIKLiTGTfiOVV1F7m8AfQ8cOx205Eg/hvUjqvPyd6GuIMuOlypRtVqJ2clh1aiheqa55Sc/CxDAIkiEKUjnqKbZwT61sv9y7reLqjZkolJPjWn+bRdle31bWTvw1Q5KJD2wpBfsdViF2l6M8k1JjkgbeQ2K5ZtUAG20KR29pt6HkrSVXbBDlIqQMcvJ0GDyv7//KCseDURfYz/HjY2cNh+NKKulpGR9QuHvt9GDGRP7YedUsS2bCwEdIkZ2DoypGtBCu56IVWEKUJz//bmsbnBeXMqsVFoVtwkyVcvYvxAzsp96mNIQXq5h1BkQ5iHu3srjVpENqG8Ohj/rnRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 05:45:17 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::4921:b87b:297:f312]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::4921:b87b:297:f312%6]) with mapi id 15.20.6387.022; Fri, 12 May 2023
 05:45:17 +0000
Message-ID: <4470f44a-7664-4e7b-398b-4746b8bfd784@intel.com>
Date: Fri, 12 May 2023 11:15:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-5-matthew.d.roper@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230511034722.1929038-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0192.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::17) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MW4PR11MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7d826f-d45a-4ac4-5f5a-08db52ac102f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d09t1yO6IEomnPOJOeKRCt/YbofLmYABdwSuZOucI+ZqiSCq7ViJ0xEqLqaLnUQLWY4Bw/NQaFOUJu1FuED5Cb86YLsA/7ddb9bmf9znjQzC+UER6Bk8l2Sruq5Ojrph2fEaHjACpvoDcCRVcIE2Yqf7AfgeV04RquKE06QG17xa/v1SNgrxwgXHlTwC4epKpaZzkemYlTLmxw0KDZSu4suwyWNHZbAXQW+l63fIHI4fM68yxjTiJS/5egqpjQwL3wWsuKKjrAxmK+Ub+4F+XGronr8KJ9efW5kqtavQcLwA3oNIvFBfFb6a5l6GNhy8m0MHB/QP10bolwvSbx4/Xp4Nlh6ghap6NG9hWjtzHlmHktRY1Mu4kttS0VWl7B/ZZ1CYyVQPjoWmWBQYc1ZNeTwQH5We7BGfxWpnSJYQYdgoQ1+ssANObvtfUUEtbskkaODUsN+7jPrFOka2OLvgr68LTVLoud/AXGuUlEvldOITpL8JySUlGOag+bwDTHfvb/Nb1M4QOBM4he62IxRgmPkkM57hoCDY2Wsq/dE4klSfUtmWnZwWRWgHtTNbOdRFO4qr3tLPUHHje9CajUycw6gAEDqGv7iKfufH9he36o1osY5HVgjlN+PcTf20aeRizVM5YZO/XtbLFprP2kd6KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(8676002)(53546011)(2906002)(83380400001)(316002)(2616005)(186003)(66476007)(66946007)(6666004)(41300700001)(66556008)(478600001)(5660300002)(6486002)(26005)(6506007)(8936002)(6512007)(82960400001)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elg5MmtqeTN0L2VybDY0TVJsbmlXK2NnVGFtZS9VeWM2dTJaWkpWbjFNdVl0?=
 =?utf-8?B?OFJNZnU4bGZCR0N1TWQ3c0N3azBzRlg2TmpvRmpsbkcyMHE1QkpHLy9JcHBU?=
 =?utf-8?B?MS9INDIvajFKYk8rdlJVTGdCdk1rbzhZYm5FYVJZdnBvWi9JOEtucHpxcHBs?=
 =?utf-8?B?TVFsYmt6eXBGQUloOUg3T3BqdTd5U0dLTjZsQy9XbGg2Wk9aWmVOenkzU2lh?=
 =?utf-8?B?TkpUMGllTHEvZWtKVjJ1N1pBbGpLS3NTRjJpRFhtbXA0NTB2NTF1VjNmOXFo?=
 =?utf-8?B?ZkJUNzJENDM2OFQ0Tm1LY3g4TUI4a2pyVjR5TitjQ21EQmF5cFN1cThwSVdM?=
 =?utf-8?B?VWpSbVVHT2NvR2NHaTkvamVncStGVDlWUVFMUHV2UnU4U2lVbWtOeUFYbHl0?=
 =?utf-8?B?cG1WdDFOUDU5MHFqOWt4a05kaWRUU2h5bFk3ZGZnR0N4bXEyWnJoMlY3RWJq?=
 =?utf-8?B?TllsMEdJZE5WZnBVUlh1RitkczV6VnlEQVA0VmE1cTRIeXFnOVhWMXNJWDVt?=
 =?utf-8?B?TG91WFNTaEsrYWNKQWJzazFhM25ZZ1pHK3NZY1pJdmhnZzh4dksrSXhMSm1k?=
 =?utf-8?B?M2UvRlZhbnh5ZWRTNEowdjNIeTlPWGdOOThPNGFHc29ZWVEvN1BlczlQYld4?=
 =?utf-8?B?WGcxVXRCTU9mOUdaeHRCV05oeFpBdEdVODZwM1ltSUJDSm9NVml2ek15TjhN?=
 =?utf-8?B?eFYzL0VqbWdUQ0E5Wlc0R1FBMkljT2w2M25NbDArdzVYbkJteUt0aVNacDJ2?=
 =?utf-8?B?MkgreU1VTHVMRTdzYUU2ajF2cElTUVVsNERjeFlLeG0zSEJqNXlKL3FBN2Ry?=
 =?utf-8?B?VzZKcVF6RDJiajV2YWZ4ZWlCMkY5ZWNERTBhbE5ISGVQelFqenZYUEhzUk84?=
 =?utf-8?B?TjJ5Wm1ORE11YzNoNUdMOHhWamFYaUE4cGlkMEJXY0lMM1drendjNDQzVk5P?=
 =?utf-8?B?aFh2VkZKRDRKM1EvMjQ5TGhlYVhiMXN6dXU5bE9OSC93N3E4MTNYVEVSZHlw?=
 =?utf-8?B?dFlBS2YrQitLUmhGT3JYMGptTlUyOFNFclcwN2gxK2xDVUxtdXhjUzUrbU9u?=
 =?utf-8?B?dEppQmttaVFaU1dPajBpUzJsVzVsWTdVUWE5Z2JwckJwdjBwdkE5TmN5eHp6?=
 =?utf-8?B?bUdvL0pPamVNRmxadDJORlZBYkNqSUp3cHE1YnVmTCtWR1lIc0dERTd1SWlJ?=
 =?utf-8?B?WERoL1NKOEwxczM4azJLVWdUVTJLN3BkSnIzcncwM2RNQkpkY0lRRk9kampi?=
 =?utf-8?B?WWg5MmNHTWw4Wm5tZlRtVC9lU0Z1QjJRVVhBT1Z3ejQ0ZTNPVnp3cUVRWlJu?=
 =?utf-8?B?amhPUE9nWVZKb2hPajRIVUF4ZUdUZnZidGN6TzNDM3c0YWg1MEh4SWtoUnBw?=
 =?utf-8?B?OUtGeURNNkdTbVlvVkJmd1RQTGJ3M3VkUDhuYkdTUW1lR2FBUUdnRWZYT1p6?=
 =?utf-8?B?Rk9xeEhaQlJScTc4bmxiNDNISVQ4cVZ0Z0VKWUIwYWg1VkhXcmtRSmNSRjRW?=
 =?utf-8?B?TW8waDZkYXFWQW5Vd1NGSnlCUzA1UFRhTmh4UWpKYitVazQrcmtPSXk0ODY1?=
 =?utf-8?B?ODNnNy9kdDQzZmVTUlJrVHlNWmlyZ3RLMGlFd2NHem5hSHJkd3FjVDRpc0M5?=
 =?utf-8?B?clhiaFBDb0R6Nk9XZU91dnBHaDREK0N4c1JuUHhxT2l5Y2lRVEs1T2RiUGRB?=
 =?utf-8?B?eC83R0R0aGI3QlVLaWRHaEF0bkFraXRGZkJReDNhWmllYmF2QkVFU2V6cVVL?=
 =?utf-8?B?VE1wZ3dIbnJFakpJeElLOFEzNC85eFA3MElLcmRhclc3K2IzTG1sS0Fib0RB?=
 =?utf-8?B?aVM5QU5ZbjFVL3lMTUJqQzJObmQ0SlZpcHZ6SzZBZHFvMUxHeUxIYlRFcUZr?=
 =?utf-8?B?d2FMUjZCc1gvUWFseGF2NDBjem5uSWhkZitnclFWcTZsZVhBTUJpbG16akI3?=
 =?utf-8?B?WHcyUzlHbThQL21ydG1ZcExTOGNmNjBXb2VzTDhyM2x5ckpOanJaZS9aQ0hF?=
 =?utf-8?B?K3lUL3l4VDZpeHJDSzJ4eWgyT3ArUFhydldkYnlTYThFUUIwVjBHVVNSaXFj?=
 =?utf-8?B?WTRJSGxQRHBOTE5iTUVtVVp5cFlicFZmTVhaMDZKbnZMOEZxWFNSZjBvYjBF?=
 =?utf-8?B?blJNaTRkZ3NvQ3hkSlY1NUlOdGRlSDEzVUVhdHhxNUlYdlhvM293d2NqSnRs?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7d826f-d45a-4ac4-5f5a-08db52ac102f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 05:45:16.5938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEHocL6bmKSTTeTK83fsZg29V+FIk++wUOgpePi/NsZHEDIrrony/GZN6zqbM4f6DlXflTqByEGkikp4uWu1mpQq41u23+hrXkFlFMTh2S8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/26] drm/xe: Add for_each_tile iterator
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



On 11-05-2023 09:17, Matt Roper wrote:
> As we start splitting tile handling out from GT handling, we'll need to
> be able to iterate over tiles separately from GTs.  This iterator will
> be used in upcoming patches.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h | 4 ++++
>  drivers/gpu/drm/xe/xe_pci.c    | 3 +--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index f7acaf51a1fc..745dbb16d417 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -83,6 +83,10 @@ static inline void xe_device_guc_submission_disable(struct xe_device *xe)
>  	xe->info.enable_guc = false;
>  }
>  
> +#define for_each_tile(tile__, xe__, id__) \
> +	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
> +		for_each_if ((tile__) = &(xe__)->tiles[(id__)])
> +
>  #define for_each_gt(gt__, xe__, id__) \
>  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__++)) \
>  		for_each_if ((gt__) = xe_device_get_gt((xe__), (id__)))

as mentioned in earlier patch, this looks to always return primary gt only

Thanks,
Aravind.
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 87c328106aca..bef65d3a440e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -525,8 +525,7 @@ static int xe_info_init(struct xe_device *xe,
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>  	xe->info.step = xe_step_get(xe);
>  
> -	for (id = 0; id < xe->info.tile_count; ++id) {
> -		tile = &xe->tiles[id];
> +	for_each_tile(tile, xe, id) {
>  		tile->xe = xe;
>  		tile->id = id;
>  
