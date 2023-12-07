Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0799C10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 06:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BB010E7DA;
	Thu,  7 Dec 2023 06:03:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1719E10E7DA
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 06:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701928988; x=1733464988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fp4PfpFFo+ifU/yVE/3go1RNZNqbAx6qP/ijF6j6XNM=;
 b=NZMVZ/+t9HkpPJy8R7YCvFshPWx5SNQYLJ/n1ukXQQMuiu6Hh2pw2hqK
 DbetBtHJL2vTjotE5tWiBmMW8Vb7V3+oEkva+G9YySf5E3sKCODYACAUF
 jYINaAukuVqj6OExB6lPg4jZ93+UJ0hML1SYOlV8193VnZbx1deL9GdLE
 2jOv3/7QL/xEGWBRCldgOJbHWq0pCpzG68StZC2CM1SoQ+azvjyniMceN
 rBkvMFHIQ07Svh+d4zfTdz0z8njRdPWJ+qbHbFNMUFrr+lLocRVIyhEYs
 zFLGFGfzD8HYrhdPQxrHv2Ns9I3szRq/j/e6DTXoueTuXKB5QJwDGJuIm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373667954"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373667954"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 22:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800614255"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800614255"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 22:03:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 22:03:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 22:03:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 22:03:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZLdHnP4gY556T3f2i3l3t+g41koH28WbjzZZGgBKRaTsrLY+hYXkWWJDupzzeD3GkDsQYQGesy4eS7m8CM4qvpzIuEmiRD7mkvo80KgPf7g0o3UoHCazduX5cxpNMs30eh8EQp7CcwJUSnF+mMO4ZubXXtnV4lWL7ZsaFJ6I8KEV3wy2HTJwWJHtXaougIX0Cp03JR9UrPlY5rTgLaDpUoec3LAzqWqG7euXvs6SdSEmeYAkoEaZ+Xf4caevlGgUjn+W+viEenLTXyq2H/9Yy57J3hKEvG6ylmcMxJp1YJU2q8rrZP7A7JFQMoIJUSlnZ25ZxEcs72AxGSWSbycKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEe4bZBPzGMnSqABEmQZCxABKbzENolPdWK5/XEXF6I=;
 b=WGv0RHmgYR48p1MhZn6brvUhBX+3iL3H34/gOAPNHn23pRp0+KtKwmWn00nDJeaD/lxj6WkBdRVIjKtqIGGmg1iDXgoDNTF8cGPmswurLrrS43Wr8hKuXkgDQF8omK1gy+l+9oQFRHfytiEj9RvPHJN/m9sSDxmEZxE14JZ1zB1NFoyk8Rc1YjIIEn4OCWG8XuTClwFkLQ+FP5i4tqSwhLGxDO6k6xaWu9hSvE96SIcglvtqEM2Ebt+sPCXhYRimCbHj93MOSgGMbMLxN3YcsAXDVGVhZtGseKSzLtPQkOdMbzwrnvuFQhJePZDuPWHqkrMVutUxdK1MWmCOVqjOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 06:03:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 06:03:02 +0000
Message-ID: <33c65d14-bb41-4091-b3ab-8bad50ed38fe@intel.com>
Date: Thu, 7 Dec 2023 11:32:56 +0530
User-Agent: Mozilla Thunderbird
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-3-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231206044735.966213-3-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 361232d8-1e30-4f58-5d0e-08dbf6ea2bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VOG3MFyZgOjFGDo1jgJMNH4tKdFdMgdq+dS6GpKMH3WsHbiC0mTKVI5YmafdGkEaRB9SqFK/j+Erlha08QrU6ojcgdID21SsHUfy9BnrSugcwupG+zEPapUaTqZINf6iOUc6CrOpowMHvBMBuEAv6OgCG9cmaNycL79vc9b3o0XGdgJIn5PhTflw2ELImCqmvW6DL89xEGWBoDhuVbF8frA/1gDHtIdFhG/aorhTxzduVPuy142Hnf75vEuYkKJsmjgoVYLNHg2y4peRuVYLxsueUif/3BbAVhMU6Ny9HL/w0OudgSgaq0I8P1Omv9tob75NkRfM7O5/BTz3FCFqL23isOClPV/yGuz/fn46V/YgZFK3qyIRzvycuxcck+ZbKlLaQWXrkVX0DUYQgIgYCEu3Fag4WsXACr66ewUNAXEtwUUKuL1zrzW4zVpUV8smt+av/3Db8hfdLMXttsfFqP7Nxc0rLOfn0dfTyJ0DuhB4MxVcwIg4H1z9yppGwsC9kkBXqnCy3jgj8M5UiB/XIR8PUV96EpMaWkxpIA1fD5TnFrSCS+RJhILRChVyye7inGzEHm9cxEpcfq5FBXK9DfgvAAx7PiJrGpoVcjgbpcLBY9dwxVrdHgOWM3CdbBcGrUBoOl+ESwMVH69Adh4y0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4326008)(2906002)(8676002)(8936002)(31696002)(44832011)(86362001)(5660300002)(36756003)(41300700001)(83380400001)(82960400001)(53546011)(6512007)(6506007)(6666004)(107886003)(2616005)(26005)(38100700002)(31686004)(66556008)(66476007)(316002)(66946007)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LytSRThSYVFKWFlkK3k4VmxUUzdTSm5qOFhETUQwMnFaOFhIZEJyWWRUUHhr?=
 =?utf-8?B?TTloL0FFSkw5OEh0UHNKbkZGZGZDb3g4dXM0TGJpRDlIYVRVMWp0Q05wNXE3?=
 =?utf-8?B?M0dQeWpQMXlyVnNGVnB6T1FHNmZ0QUhUc2xkWmppbVQ4R2xiRWtuTDA5TzNs?=
 =?utf-8?B?ZVVuQzVGQUNZMVMxdHpaZ3l2M3JtS2E0NUxYaHh2ZGhFVGEwcmN5cElrV1p1?=
 =?utf-8?B?cytDSm9iMS9lTkRHc2hZQlFETEZZaTROdmM2d2dKdUxJRmVxNE9FN3ZWZFhp?=
 =?utf-8?B?SnE5L2dZWUpFUTZqR3hFcEI3WlNkVnJMMThXSk0wMlE0Z0srYVE0eENhSllm?=
 =?utf-8?B?amVLWmsvMXFVNUZPSFo1a2tIV3NDLzcxdjFyMFVHN1hidjVhR1MwaThRNHdO?=
 =?utf-8?B?WVJVS2ZpbWZmWE1MYUFJOWFtcUZFNkhmZEFqT29GdkcvVi9DV3UwcGZUTE1i?=
 =?utf-8?B?ZC9hMWdTQzZNbXB5azNvaVRFaGxFcUpFN0FGdGsxM0hTNFpneUFMVTRSYllU?=
 =?utf-8?B?N0dqRDEyUWZyYTZ2aXNnaVRKdmVBVFpHRktWSGJNN2hmL01USDJzNGVYczQx?=
 =?utf-8?B?eEwzejNSZnc0c1Q3b0ZoMUNaV1d2V21YT2ZEL1YxbUM3NzIzK0lTQm5JV2gv?=
 =?utf-8?B?b2VjbnZWcFVqcGJ2ZUd2UlQ4NWNSQWx0Qy9GbGF2c3czVTV2alZrbE1kaWtx?=
 =?utf-8?B?NEM4akhEdFVwaUJpaEx6WnBXOFdFbk4zWCthN3ZSTFJoTlRJVThDdDVORjVo?=
 =?utf-8?B?S2lMOHNPOVVZNmM5UVlHcDhkTitkM2l6dWpxKytQdHlEdFlJL1AwVDdqWWhT?=
 =?utf-8?B?U3JmekxhaDdsWVNQREJUamtVdGQ2cENPZGNFWHJjWWwxYmJ0ell1eDY1Umcw?=
 =?utf-8?B?bkNpYWhEVEc4LzZoMEN6Nkt3TzRvcU5kRm9kb3JkdW9pYUdjUXllbEFxRkhs?=
 =?utf-8?B?UEhadU1BbnNyUUhYNGIzZXMxNjJXcXJaaFgwdWFwTlNjYjZnRk12Vndzc2xw?=
 =?utf-8?B?RVZNbEZWcjkxSTc2Sk9EYTVIbWlIT3FhaFo5eHdGWHRJU1BzTzBJbUR2VHlt?=
 =?utf-8?B?SjNOVmtJT21XZStmZHE1alh6MDlySVlKenZvbEdHZzRCTGczRmZERjNwSUlE?=
 =?utf-8?B?bVZHU3l5UW51VEhJWDBiU3BLejVLNWR5dXVwU3hVaEN0Q1ZmdnU2bUdBbWxF?=
 =?utf-8?B?enNpR2wyWm5RUWR6T05pQU50aSt3M3ZYdjB4SjNrZ1BITUk0cGQ3K1JzS1BV?=
 =?utf-8?B?SEEwMlZSaExwUFZFMnJEUXRWb1ZHQ0xxMXVkWmVIVXhXWGFOUmhjV0NvODYz?=
 =?utf-8?B?ZWZGU05COUVacGVMWUtGYWpxaDBUT1AvdHJRdE9Hb1h0eHpFVjZTR1VTOEd4?=
 =?utf-8?B?RGdLNjM5Q1paRHFaYjN6cW9qUDFKUVJtRllSQWFKZmtLTW4za3FKN29mSWVw?=
 =?utf-8?B?ZmxZdUl4Tnh2YUdMR21VY0pVNE9lV0tJRGJSNm0xWW9zSzlXc1dCVHRkYzV2?=
 =?utf-8?B?b0YreWsxT1Y3YVJWeWtPYkJlMmhhcVd0UVlIZVN6bXpQdjFwZlo4V0hRQmp4?=
 =?utf-8?B?Si9SSksrWmRnK0F5T1paMVVFVGl5MHFhcGRxWkNpaDVnamFrYzliSXpQMjha?=
 =?utf-8?B?MjBObjExSWhrdmlpMlBjbGtQOXVWLzZGREtqLzUzRE13ajBSQWN1TEQzN1NS?=
 =?utf-8?B?THpNT1FOdnI2T1R1OHlnMVc0L0FPRzVIR3lmMTV5dmoxSFJtZzZqMjhpUm1Y?=
 =?utf-8?B?QlhHaHR0ZXRldDlQREIrSEFpTVNveWdxZXFTRVRRUXd1NTlOK0RjNXRZdHp5?=
 =?utf-8?B?VzZSZU11amZiZnNwTzZhVk5ialdPQlpjcGd5REdVOXVGT25rRGxhaGZKK1Yz?=
 =?utf-8?B?NUk4d2pwcVpPbk03aXdyc0hyTy9LS2hnL1ZTcitMTXppV0YvMDN0U09tV294?=
 =?utf-8?B?M1hqQlZpZVMvNmlMaGlsc01aNWk4bThabStFbmZ3VFZ1UFNmbWN4Ni9uenpD?=
 =?utf-8?B?OVVBbDZMd3dCRXd4bHJ1Tk8zdlowU2h4OGdQd1c5M1M0L29rVlJUcUxLWTY5?=
 =?utf-8?B?Ly9yTGxPYlJuZFR3QTlFZXpXSWFMSk90enpYeW5jcW9tWE5PY3JpUFpzN05D?=
 =?utf-8?Q?iwkF5W7cGmraOZMtfB0WyYeeC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 361232d8-1e30-4f58-5d0e-08dbf6ea2bca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 06:03:02.3919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXimewmnWFgMXYZTAfZWJhsgnhWRvNwR/o5AyWSxfce1ZD15qy2Hjr/X7+9QH+X8J498vdq9K9vTKm6UBiyDKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 2/2] drm/xe: Add vram frequency sysfs attributes
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Suja

On 12/6/2023 10:17 AM, Sujaritha Sundaresan wrote:
> Add vram frequency sysfs attributes under the below hierarchy;
> 
> /device/tile<n>/memory/freq
> 			|-rp0_freq
> 			|-rpn_freq
> 
> v2: Drop "vram" from attribute names (Rodrigo)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pcode_api.h  |  8 ++++
>   drivers/gpu/drm/xe/xe_tile_sysfs.c | 72 ++++++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..edde5335bdb1 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,14 @@
>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>   #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>   
> +#define   XEHP_PCODE_FREQUENCY_CONFIG                  0x6e    /* xehp, pvc */
Can we change it to PCODE_FREQUENCY_CONFIG ? there's no usage of prefix 
in other places
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0             0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN             0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
> +#define     PCODE_MBOX_DOMAIN_HBM                      0x2
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index e8ce4d9270e6..38d334833594 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,9 +7,14 @@
>   #include <linux/sysfs.h>
>   #include <drm/drm_managed.h>
>   
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
>   #include "xe_tile.h"
>   #include "xe_tile_sysfs.h"
>   
> +#define GT_FREQUENCY_MULTIPLIER	50
Could you add documentation to this file as there are multiple sysfs added.

> +
>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>   {
>   	kfree(kobj);
> @@ -35,6 +40,65 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
>   static const struct attribute *physical_memsize_attr =
>   	&dev_attr_physical_vram_size_bytes.attr;
>   
> +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct kobject *kobj = &kdev->kobj;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rp0_freq);
> +
> +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
> +				  char *buf)
alignment to the start of bracket

Thanks
Riana Tauro
> +{
> +	struct kobject *kobj = &kdev->kobj;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, XEHP_PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(rpn_freq);
> +
> +static struct attribute *freq_attrs[] = {
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs = {
> +	.name = "freq",
> +	.attrs = freq_attrs,
> +};
> +
>   static void tile_sysfs_fini(struct drm_device *drm, void *arg)
>   {
>   	struct xe_tile *tile = arg;
> @@ -78,6 +142,14 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>   		drm_warn(&xe->drm,
>   			 "Sysfs creation to read addr_range per tile failed\n");
>   
> +	if (xe->info.platform == XE_PVC) {
> +		err = sysfs_create_group(kobj, &freq_group_attrs);
> +		if (err) {
> +			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
> +			return;
> +		}
> +	}
> +
>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>   	if (err) {
>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
