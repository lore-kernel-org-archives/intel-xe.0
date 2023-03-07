Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD91C678D4
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 11:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3A010E468;
	Tue,  7 Mar 2023 11:56:47 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A9410E11F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 11:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678190205; x=1709726205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k8EoChkcDHZ0BGqfgeoP5ocrqotpRX72gzqo6yu9RCI=;
 b=gttm6NgoyMKnH45NqexVVrUyiICXQIhkKRzuTGPUA7ocdosVBjKJO9Kc
 wJryxR+IMZIaQLbe/trvjVo7CnEktK57p7dtmObqc7OeoHt3wkb31Rf9T
 wk3Us10xf5e1yReiGr+nj6pBFwr0ZlHkYzNhv5Q1mTnmysR7PVNRRajQK
 1mm48n9Uad5dYGE+2rlMeL29J/BbxyRt5J+xfSBia8FS7zI6galNrga0K
 /VFa8zAD+GX6m0lb4HQbLWwA04ONlr/xVT/JgcbM3RbP8iJW2GSgMVah1
 d3xMb/15bsqACmMyiC5rrIvA3otoT3uskAv+/IZfqBmWeyU9No8snO2rc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316231559"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="316231559"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:56:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="706779643"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="706779643"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 07 Mar 2023 03:56:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 03:56:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 03:56:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 03:56:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 03:56:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fk6035928sgWib7f9FhrzOOik3A7h3KCrQKpmPlug6CTr67xls/fD+D5nI39VG6d44zQu/7leVILrMVHYSqelesIIDhlhX4klPySPzOMXEvf6Y1ffaMAOBHhBn4j1lHdAzrLNOEpShDqHbm/eplBWhiggDKWi+TZz6nZUqIIHq0lMIoWIopir2dACAQ0aZXB/EMQYfbLHO83AD6fuSmp3f7NNTDa8QK27XvZjm1b3lSCJ+W9uwuvSr5fR2nCtNug1WeUzYjVZ5xailWOAuuPKb5So9i1T+UIoSmVDRaCnr2XgyVQrl0wiZR1NjKu/but02hwPhi4+q/rf91nH3P5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M3StqvKkuGdbU81jck/zLocY/gr64KbA2F4/DAUYy0=;
 b=cdfa4qAwUt1MElbJmGOdnw+Tdo4uDrZxNiJ5Rh47M9s99TLQDvVG2QaVqL4hBwdDqEqKzDts7wKD4EXE5e3htAMP+KUPE7YioJMyaq/tKCMqwYujDhOgP8owA0Z0tT/YRTBa4N2plmLMxh+q7gJwReGJ4GSP1pAFgTcalQKtNUQVYv7aZz2BfQhP1PVTl3bICTzaWT9DkQC1X4qzsXvoE+FvMHcd7vacScG/UEQ/PnoDMDKY93tC4rTl6QneYLD5SALzpdKmiAOCHwqRw4jEMnt6TieIyccP68FJvxvGti0fCsStz8igSg7th0ndMJyv59pYaWQSbNl9VyvLNOWFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 11:56:35 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::de64:d1fd:cc87:a040%7]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 11:56:35 +0000
Message-ID: <246c8dd1-3ee0-4992-dff8-66542cb220ef@intel.com>
Date: Tue, 7 Mar 2023 13:55:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230301144815.248239-1-matthew.auld@intel.com>
 <20230301144815.248239-4-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230301144815.248239-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 90550273-816c-4767-5e1a-08db1f02ffc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mmXYRGt3ID2u4felDv59s0TjzSWiNqrK5dQeL+yuH5iw1v0KXlh/Nr9n5NMpDDr4Aux/6gNa7fGaXWFc6DqIl6hTeLqt2KkrcWW3Qnv+3i9GDKxUwZetk4rb71YuNgD3pmdgdHLuithovH7jtzS7rEGSK21r/QzDdjCre1/Kw+wiJ4Jz3yiNFkfC4UWB1qV7oHJJxk/QwbZfRx25SzKnE5+wprlto8JQplovBb/yiSDg4Y3uIZCsk2DZEuwwZWctZmgcvMpXHaINexbJoud0LrV0USci0/en+Z22qoizOshD9tZMD0/dlTB4uymvRa7RDlMxmTLmkr9BZEImFiiig0kKPMDy441bWgIaSTqfVTSwKqcUV/3JiALT/NUJ+Cghklifslytk9QzIKzpv0q1atFBTgdBKPhMqfEn7/3tVcJAClY/7JwF241AFjr+Fwbklu8ey15OZnTNNnEd58Lp79PBNp6It0Ws7LvgqD+RFHNMij79FFxXc654+fRMIkGDuGQbpmlkOpCP4w6/w5lUwKyabtE21r1Qdg+XAtPmH5r3y+/bxZ1rKRqS80wcVvrraxekd7+OQonO/mpDHe4i+ApfV17UlnPsvnvk7EhdLXZXjywCZXlbZXe7UVtyA83BYZ8tOi53uv8DXT/aQgp1WQf9w33t5G+WIqOL4kzdqqd1xJnn6yDka3t+jQlVzQyVJYsAopmCAorImHzt2Af1ha9G1KMnhgzXLLkapUFUPUSQNMjFAPyYFAis6VJnt5fu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199018)(83380400001)(31686004)(36756003)(38100700002)(82960400001)(8936002)(5660300002)(478600001)(2906002)(31696002)(86362001)(2616005)(6506007)(186003)(26005)(6666004)(6512007)(53546011)(6486002)(107886003)(4326008)(316002)(66476007)(8676002)(66556008)(66946007)(41300700001)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVIxMCtXdHFrVEgxc1k4V002YUErL2UvNng0QUpMSHFaajQ1Q3AyRWU1RlNW?=
 =?utf-8?B?c2xWOWUrN0NBZWp4YTdmZ3FLQ3phL3VGaTQzNEhhdmZEeEdUMjBlRktvdDhE?=
 =?utf-8?B?WVo5U1JrQnBqcWR4QXBLMUR0L0hNcE45OHBUR0U3RVIzczlzTU1qZGZkMGow?=
 =?utf-8?B?Q3k5aWhDMnZRWUc3ZFdyS3pNbnIySk96UzFYMm5iMXQrampiaGpYNkhLWE96?=
 =?utf-8?B?WWpaS2pxQ2xmMHVXaUd2MUljaXBCVGcvWlNHODhhbUp0S2tVdC9EQnJlWEx5?=
 =?utf-8?B?eXRKbW1qWUg5eEoyWXNZVXJ6QWdtMXdYcGxLQzVnVE44dWc2MXFoUUVIaWJk?=
 =?utf-8?B?NnZZZlRCOWhXUWpoOHJjMmc4Umw5SzVqdEFFOXphdWQ4bDZMaGpJZUs5bDd1?=
 =?utf-8?B?dWdwUmVrTXB2TzRGYSt0aWNVMGRoWWcrSFdYWG0xTTVJeG4ya0VpN2FITmJv?=
 =?utf-8?B?NC9WUWRQL1pjam5HRlFMR0pwSEJDeDVvZzkvQVVwTUhSREQ1Z25ZMW96b2da?=
 =?utf-8?B?aXdLODh2QjFNSXZxOU0zMlJxYlZKQlY5UGZQeVpmcEF0NWUrL1l3cFcvaVZK?=
 =?utf-8?B?RmpNWmJWNTVINnQ3U2JvZzZwMzNPencwYk9aWmNhYjhoSXVDdzRkS0c1UFQ5?=
 =?utf-8?B?akU3WmVmOXBJUGVza00vaFQ3dnpVUzFLSWNmSWYxM3FVNXh2N3RWLzNZSzFk?=
 =?utf-8?B?QzQ2Uy9ES3NRc3pkeXF0ZnN0a2tVNnFSckxSYVVlN1hRV3NRSHNCa3RHYjNM?=
 =?utf-8?B?QW9qSjhYZzFTTnZONVM4OE4yUEM2MTRmWG1EQlpOSkI4ajdVeDd6VUpmT0oz?=
 =?utf-8?B?Rkc5MmpZbkdWOGZlL1Q1R1JGMk5lTFZZNmQvZlpFTDVSdXF3aGZnZGkzOTV0?=
 =?utf-8?B?K2RXVk4zMDBGSzFuTWpUdGdVSGhDRGpsTHFHNElwbEZQTVl5QkR1OFRyZjFo?=
 =?utf-8?B?a1B5YTVWc0lwVS9jS0dhcGo3bGtTMmg0NktIblNaNlRKTzZUTHJpZjFWNGgw?=
 =?utf-8?B?VDZ3SFkzMGd3cytsUGRRNWtnOEJ5YjkxU2xtcWdxOXV4TzMzSTM3WFA2bUVa?=
 =?utf-8?B?Y3BDUE1yTEM0MUJVU2tJbHZRK3JlK0VlQWJseUJjSUFIb1M2a0l5Z3lLblpV?=
 =?utf-8?B?UXNZbHFnM0FUSC8vV0JCRmdqTGJOc1BkSllOQ0RreGRsMWJoT3I3UmlrckdD?=
 =?utf-8?B?NzlURXlGY2txRW5KaVowK0xCWUlLb2JhaHVXdVl4WnBxNjZuUEhkeGpEYkE3?=
 =?utf-8?B?alo1dHlZZ0gzWFBJVWhjd25xSlNuYlBTNlFSYXBEalo3U3IrOFRXQ2VxTDBK?=
 =?utf-8?B?M3diR2VlcU1ETTNhNmdpd1NpQUV5MmVVdzZ1YXZJTEtYd3VBQVN5eWVHMzFM?=
 =?utf-8?B?TEw4aWtabjV6WHVjRWU4OVRGZlM3TDhiNlZGMjJZMTZEUkZEWHVhcDd4QzNj?=
 =?utf-8?B?dU80S0xIMGhCaVNuYTdIajVXejRlMFZXaGhHUDJCSXVDbE9JS01KY2ZEbjk3?=
 =?utf-8?B?T1dmUE1YMnFrdC9jNmxYNC8rT1c1cWNpS0xDM3ZlRngxM0Z6dlE5YjlYaHl6?=
 =?utf-8?B?ZkkxR0dNdU9HYWovMU4xVTRoTVQzYjhTY3EzL01tRzJjODdheU52M1pNZTFT?=
 =?utf-8?B?VlJVWmFsbngzNUFoTjR1dmVwdFloRlpxbmt4NkFRMXJUbjRzcjhQWHZzMjVp?=
 =?utf-8?B?OFFIbHRCQXE1ejVObnJHSHdLVGdOQjh1Y3F2YklLWVZmakdGUnJ6eStoZGg2?=
 =?utf-8?B?QmRNNWFwQjR5NEFTU3BMcjdBZFBicFpSbEtPSk95Sy9Cb21VUEN0bGVxNWZW?=
 =?utf-8?B?WnYrM0dmWVNha2ppQUtUUHhvYm5yNFk2OGV1OHhpOUhrLzFlWjExMERvWjl5?=
 =?utf-8?B?LzZzdnIzaFhtUDh4M0xxN1FrUGtSSS9QZjd5OGpnYU9odGwvN3hURk1RK09n?=
 =?utf-8?B?VGxYVkFvYXRJVXQ0UEpOUjl1clA1ZG5YTm54eGgvc0VYRzVvNThTcDUyN2k0?=
 =?utf-8?B?T2Fodm5iUEE2Vnpxa2NKd0dwRVgzZ1FyeVFONUpmYkh3VjVMMk5TUEdaVWFy?=
 =?utf-8?B?WGFkT2R4VkdBdHBBRHRLWGt0WTMxVURIUi8yRDR6OVgyeGs3N2NJeDBmRVQ0?=
 =?utf-8?B?MmxHbEpvZC9XL1liNlNzcTZXTWt4bmZ6WUl4MEQ3bis0MW9FYWVOOEtDVVNH?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90550273-816c-4767-5e1a-08db1f02ffc7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 11:56:34.9551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFfqfPQqZ6pcwMsOHNg4aQkemxFSVCA9B3DudIXvbbaDoU8xjCZ0ahb3r+bN9RdMNlAC0UXi+ECrU2EBDlHgopkdoyp9/ShjtH0noAktgjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe/vram: start tracking the io_size
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



On 3/1/23 4:48 PM, Matthew Auld wrote:
> First step towards supporting small-bar is to track the io_size for
> vram. We can longer assume that the io_size == vram size. This way we
> know how much is CPU accessible via the BAR, and how much is not.
> Effectively giving us a two tiered vram, where in some later patches we
> can support different allocation strategies depending on if the memory
> needs to be CPU accessible or not.
> 
> Note as this stage we still clamp the vram size to the usable vram size.
> Only in the final patch do we turn this on for real, and allow distinct
> io_size and vram_size.
> 
> v2: (Lucas):
>    - Improve the commit message, plus improve the kernel-doc for the
>      io_size to give a better sense of what it actually is.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h | 14 +++++++--
>   drivers/gpu/drm/xe/xe_gt_types.h     | 14 +++++++--
>   drivers/gpu/drm/xe/xe_mmio.c         | 44 ++++++++++++++++++++--------
>   3 files changed, 55 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9743987fc883..9e998b4738e1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -173,9 +173,19 @@ struct xe_device {
>   	struct {
>   		/** @vram: VRAM info for device */
>   		struct {
> -			/** @io_start: start address of VRAM */
> +			/** @io_start: IO start address of VRAM */
>   			resource_size_t io_start;
> -			/** @size: size of VRAM */
> +			/**
> +			 * @io_size: IO size of VRAM.
> +			 *
> +			 * This represents how much of VRAM we can access via
> +			 * the CPU through the VRAM BAR. This can be smaller
> +			 * than @size, in which case only part of VRAM is CPU
> +			 * accessible (typically the first 256M). This
> +			 * configuration is known as small-bar.
> +			 */
> +			resource_size_t io_size;
> +			/** @size: Total size of VRAM */
>   			resource_size_t size;
>   			/** @mapping: pointer to VRAM mappable space */
>   			void *__iomem mapping;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index b01edd3fdc4d..00c43f3a33a2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -143,9 +143,19 @@ struct xe_gt {
>   		 * (virtual split), can be subset of global device VRAM
>   		 */
>   		struct {
> -			/** @io_start: start address of VRAM */
> +			/** @io_start: IO start address of this VRAM instance */
>   			resource_size_t io_start;
> -			/** @size: size of VRAM */
> +			/**
> +			 * @io_size: IO size of this VRAM instance
> +			 *
> +			 * This represents how much of this VRAM we can access
> +			 * via the CPU through the VRAM BAR. This can be smaller
> +			 * than @size, in which case only part of VRAM is CPU
> +			 * accessible (typically the first 256M). This
> +			 * configuration is known as small-bar.
> +			 */
> +			resource_size_t io_size;
> +			/** @size: size of VRAM. */
>   			resource_size_t size;
>   			/** @mapping: pointer to VRAM mappable space */
>   			void *__iomem mapping;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index e5bd4609aaee..5cacaa05759a 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -182,7 +182,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	u8 id;
>   	u64 vram_size;
>   	u64 original_size;
> -	u64 current_size;
>   	u64 usable_size;
>   	int resize_result, err;
>   
> @@ -190,11 +189,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   		xe->mem.vram.mapping = 0;
>   		xe->mem.vram.size = 0;
>   		xe->mem.vram.io_start = 0;
> +		xe->mem.vram.io_size = 0;
>   
>   		for_each_gt(gt, xe, id) {
>   			gt->mem.vram.mapping = 0;
>   			gt->mem.vram.size = 0;
>   			gt->mem.vram.io_start = 0;
> +			gt->mem.vram.io_size = 0;
>   		}
>   		return 0;
>   	}
> @@ -212,10 +213,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   		return err;
>   
>   	resize_result = xe_resize_vram_bar(xe, vram_size);
> -	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>   	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
> -
> -	xe->mem.vram.size = min(current_size, vram_size);
> +	xe->mem.vram.io_size = min(usable_size,
> +				   pci_resource_len(pdev, GEN12_LMEM_BAR));
Hi Matt,
xe_mmio_total_vram_size() calculates usable_size, why is there an 
additional check here?

G.G.
> +	xe->mem.vram.size = xe->mem.vram.io_size;
>   
>   	if (!xe->mem.vram.size)
>   		return -EIO;
> @@ -223,15 +224,15 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	if (resize_result > 0)
>   		drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
>   			 (u64)original_size >> 20,
> -			 (u64)current_size >> 20);
> -	else if (xe->mem.vram.size < vram_size && !xe_force_vram_bar_size)
> +			 (u64)xe->mem.vram.io_size >> 20);
> +	else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
>   		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
>   			 (u64)xe->mem.vram.size >> 20);
>   	if (xe->mem.vram.size < vram_size)
>   		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
>   			 vram_size, (u64)xe->mem.vram.size);
>   
> -	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.size);
> +	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
>   	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
>   
>   	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
> @@ -239,7 +240,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	/* FIXME: Assuming equally partitioned VRAM, incorrect */
>   	if (xe->info.tile_count > 1) {
>   		u8 adj_tile_count = xe->info.tile_count;
> -		resource_size_t size, io_start;
> +		resource_size_t size, io_start, io_size;
>   
>   		for_each_gt(gt, xe, id)
>   			if (xe_gt_is_media_type(gt))
> @@ -249,15 +250,31 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   
>   		size = xe->mem.vram.size / adj_tile_count;
>   		io_start = xe->mem.vram.io_start;
> +		io_size = xe->mem.vram.io_size;
>   
>   		for_each_gt(gt, xe, id) {
> -			if (id && !xe_gt_is_media_type(gt))
> -				io_start += size;
> +			if (id && !xe_gt_is_media_type(gt)) {
> +				io_size -= min(io_size, size);
> +				io_start += io_size;
> +			}
>   
>   			gt->mem.vram.size = size;
> -			gt->mem.vram.io_start = io_start;
> -			gt->mem.vram.mapping = xe->mem.vram.mapping +
> -				(io_start - xe->mem.vram.io_start);
> +
> +			/*
> +			 * XXX: multi-tile small-bar might be wild. Hopefully
> +			 * full tile without any mappable vram is not something
> +			 * we care about.
> +			 */
> +
> +			gt->mem.vram.io_size = min(size, io_size);
> +			if (io_size) {
> +				gt->mem.vram.io_start = io_start;
> +				gt->mem.vram.mapping = xe->mem.vram.mapping +
> +					(io_start - xe->mem.vram.io_start);
> +			} else {
> +				drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +				return -ENODEV;
> +			}
>   
>   			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
>   				 id, gt->info.vram_id, &gt->mem.vram.io_start,
> @@ -266,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>   	} else {
>   		gt->mem.vram.size = xe->mem.vram.size;
>   		gt->mem.vram.io_start = xe->mem.vram.io_start;
> +		gt->mem.vram.io_size = xe->mem.vram.io_size;
>   		gt->mem.vram.mapping = xe->mem.vram.mapping;
>   
>   		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
