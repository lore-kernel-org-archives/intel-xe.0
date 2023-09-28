Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A468FE743C9
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 22:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5E910E6B9;
	Thu, 28 Sep 2023 22:40:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105E010E6B8
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 22:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695940802; x=1727476802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xxakQLV403VoQw9xVnGcocBJEOCui2Qb34t8MupTBRE=;
 b=DGUlwy1XUUYRCWlkaDgZQ3jRX0BjCQ8PpTsGOLvPdugwUskN+mCqNxq9
 5kT6wNSzLxfBsIdX+nqBQOJg65SNCFuTZ4h6hlzABt+11OXoZ89tKGwM8
 OC+3lmK1rwm9awKhxlaDcOYM/Pxj20OXCXh0miv/tGa3FEbMcs+XCfQsu
 MZnD2H5tRFMGaoffKmwl51AGAx+VG7sktmNTxkhywupwqayfRmXppE8gu
 G0V49yPjSwPf8j1Q0eftvzEOlnEjyPDCkwQTeI1dzeo/hxTQlNvJ7K5Fx
 4FH6RsJqHi1p0oneKO6zCjijgKuEjYLuGYMdYXTct1xBZwLcZnSaOVcZz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446354068"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="446354068"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 15:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="784894349"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="784894349"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 15:40:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 15:40:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 15:40:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 15:40:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 15:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu7MTJJpqn1GZMKRfPrss/6EtGCp0Cs+cuiiXlJHogen5EGoxeYtKrfQrtNfoPgp41tC79JZkX5rb/n+bTuKBeRV8z0Qxx613HullrMxZveWxW/cmzQ12izl21FwZQ8DE4Sh94W9ZAtbkzTb3SupBsGMiHytZqcOuZ/0sv6K6b0CgXs5/V4D0vVfd1dXRUCzDbNNCen3Eq/Eq+NczavFGYUXVqzlLInTmOb1Li+g6muzWnv6lQcL98oEuwLehzuR9hH3Ju2R9pLTNfb6pfKfGM2o0HBP42qFy7eq4V/melCTTV/W9Vyj1CNUTkL/tnjGBduN7MHsiEs6qmRBW0a7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KOhMU6+oop9u6eAB5NDywDBti5//UIokGqpwy5B2g0=;
 b=ceivt+MvjWv8F8LhpsTaOUojhUo7nrg/O7kbDtlZzo06OzxQVYEowLd4XIDAHJvpsPnjHa+jB/3TIoZhBbg1jflm3tInRN2rUTGMXyBhr9sKzWt3ITTZQT7UwrXLJmT0X/mkTeSrvhUsntz+XHs7Pfd8qhdR2bLtpe3nlgIovhIWndNIiqpQgnIkF/6Z1/iewFNl9uCXQphnWPZ9Me0stuNabXYYr0RxQjweNSDP+bGOVqeSyo7yzNRlhfaBI1/uRXon5qzKmTEb757/em+Ecq2MYahOy5/IXiqU1eKTQvesNEKSn0moYpuq647+lezzyGE3K8Vllta91wGgmD02vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by BY1PR11MB8056.namprd11.prod.outlook.com (2603:10b6:a03:533::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 22:39:57 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::a53a:1157:885:64fa]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::a53a:1157:885:64fa%4]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 22:39:57 +0000
Message-ID: <4183d4d4-4228-35e3-9dce-9ec0d0ad8774@intel.com>
Date: Thu, 28 Sep 2023 15:39:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230927193902.2849159-1-lucas.demarchi@intel.com>
 <20230927193902.2849159-4-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20230927193902.2849159-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|BY1PR11MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: cee6f179-bb42-40f6-6a6a-08dbc073d746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: amsOXfiO/VFn00VzQGWHFlxDROO9qfVzXVkF8mQBJD+Bl/bDG8AoPRIbjw8LW9bnCK05G5jECb/UaxpJE2C2OKS8SiMhRmAmLPj5sHArMRGKmEKDV1joZYGkcGUlzNgP/awlcTSxgwn3ZYUF04pGeE2d3yKu+H5S+x+2YfUeyp/TccOTrPkwfDGAI/j57VeLNDsopupuWnwikK+WP5ziAj48ee3gSZpyYERp/byzb9mP141m087zNAPA8zj0XTpfEzsWThB0yoIfYWbdmyx8OeyEA000ldfzJBCEvfCvgKaJJZPdgmYRS8c/6/evWPD9lZeH9bjYQf5eBkDY1iXv6x+s4LpEZ6srWTI5bZEJ7/G5+pjaO6UIskLEg9dem0cJ9WPxcjQT0wOZQMNUWXmjN+4AlbfXtJX9770Da5VDMx9zR+06XiNjXxzcUaHlYKnNIXPChox84NIZgwCxx3LzaVU0NJtHtZ5sZHKGLVR3DLZS7gwyMUJCRiKn/4li+t2JjVES8olEcNI1UihUgkVOxIqHEytIBXSLf3qROfwUfbtugyhIIr13Z+uRHX4W1ViDKxJG2Eg3eObtIPubtAOH88MERZNzpG/+HmBwh/+lwZJg/7v6SB+utwde5xNqiUnReBVm0OiXBgjBlnzmUaqDQylRS0oeUM15NrD7GyVULns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6506007)(82960400001)(2906002)(66946007)(6486002)(30864003)(83380400001)(38100700002)(6512007)(478600001)(54906003)(26005)(66476007)(5660300002)(53546011)(66556008)(107886003)(4326008)(8936002)(8676002)(2616005)(316002)(41300700001)(31696002)(36756003)(86362001)(31686004)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1BvY3BuNjFEdE02SjA3VGtkcnlpQkhZOFZMSWJtd1hUdVNMZUFrcVFOWFpM?=
 =?utf-8?B?TFB2YkYzcGFmNzFKUzNDWlBSRVVUdkhMdWI2VjIzZUhDczBlU1dPQUZzenNq?=
 =?utf-8?B?dE56SjQrNnVFNEZMVkVyTXhNWU5UbWJ4UGt1YjNPMisxZHkvQWE3VzAyakFF?=
 =?utf-8?B?eXh4enU1eThZODRHaDg3dFlpQWQ1V0hlR00xaTZ2ZVBlV3BpbG5xMmc0TXZR?=
 =?utf-8?B?NnNvMldXdWlHdFhxY0tnV2U0T0tJVHY0ZkJiK1VpMXhvaWRBeTduenB6VWlP?=
 =?utf-8?B?UjFMaUZRVGxiRHFwOEZFbHV0T05EeStNdDdPZGJLSGhBMytUc2JkTk5RdXFt?=
 =?utf-8?B?YVZXd2tVclVLN2VLSmlZM0tTZkUvRWlaT05CdXdxQnRnL1FqWlBWb2pmUlVh?=
 =?utf-8?B?V2ZMcWhhSFM3ZitzMENEOVRldDA4TlZEa0FBcCtTcWdmRVg0NVRZKzhDM0Fs?=
 =?utf-8?B?U3lGTzdVblB5THVFdjB0b2lGQXV6cFlRZVJXeGFOOGtDSnNjT3pyYUt1WVVY?=
 =?utf-8?B?ZjI4cWZ6NVpxbFp3VlhibEJPNkRVb0xJSU9LQ0N2YVl6QW1nMnFLL3ZTVjBF?=
 =?utf-8?B?S2ViWEJ0d2pSclBJVjJ2R3h6TTlUMXY3VXJSN0FpUEtITmJKTG5VNTdiM0w5?=
 =?utf-8?B?RWNNZ2hMM2VJZ255L3FXQjdDUXAvOGdlY1YzRUtWSHpxZTJPRG5qMWZybUdN?=
 =?utf-8?B?VXRmWjQ1UVhpdE5WL0NqaWl1QUE1U0lMM3R4ZTVRWHEzL1c4Q1B6blZ5VGgw?=
 =?utf-8?B?YUg0L0ltNThteW8vcUg2dUlyNC9peXpUVDJqQm9BdS9YTVN5RC9yWHdFc295?=
 =?utf-8?B?QXovdDQzOWJmZDRLREozdXZ4N0dYcDd2S3ZpclJKVStrUDE2ajg5ampoUmNW?=
 =?utf-8?B?VUprNm43V3hmUnZSOGxzM3ZweVI0dU5LK1dRWGd0QXlES1FCQXc4VVd6MFVj?=
 =?utf-8?B?STlPNityaVNTVUxsZzRUZ0t3YUQrRVFpN25GY0tzaU9iVzVlN1hsb1dUTkR6?=
 =?utf-8?B?K1pEU0dmbFFZY2UvemlWRWdod1lsL2FlNkV4VnRpTGV2MTdmdzFxYy9BWis5?=
 =?utf-8?B?SlluUlgzdlVycnhVQXpZaTBKeTl0QVRRRXl4aXMvYzFwQ242WmFRVXo1ZU9q?=
 =?utf-8?B?NUF1NTJlNjdqMEVpejZMN3VtSzdOek9uZit2eUJOZktJenBlOWIwOTBZY05z?=
 =?utf-8?B?bjdjL3hkZjlOSnNQMmVyeTkzbEtCdVYrTXYxREd0VktvQjhCV2FVTmUrT2t0?=
 =?utf-8?B?U2xYb2N5YXdnb2VEUWN4RUNsdzg3cHREczdwQjAwZjNIUUF6KzZzaFRsVTlW?=
 =?utf-8?B?dDJhbE9MSUxzak9YdVhHME85dVVMOVA3TEhyMUROSU42NCtvbzVVREJtdlVD?=
 =?utf-8?B?VW4wR1lEOEFweWJCQUp1cHNTcVRHWUd4V244U1dtWTdKU0ovd2tvRmF1SUgv?=
 =?utf-8?B?SkRDQU9ncHZWZU1xL1M3bDFVRGtQbS94WUx1aWZNdWUzVi9zbTliaittWTZE?=
 =?utf-8?B?VEVyYUJKeVNLeU9ZaGJlNFJ4SWNWN3lGWHNUanJtdnZNZFdFVUkyRDhDUktT?=
 =?utf-8?B?NlZ4c0o4NlFxdm1ndmNrTjhkM2pUbVZxOTcxOWthV3JLLzRxMkVBYmpibEFu?=
 =?utf-8?B?QUNlK1hYSDluY0NrUHZQL0xSN294TGQ2V2ZvWEtBdDQvZjZPTlRibGxXMEp3?=
 =?utf-8?B?elBVb3YwekQ0RERQa1lBRnZmUXlhb1dIQmp4ZUtETTdmWUZnaGtnVk8xeXh2?=
 =?utf-8?B?OFh6WDZpZzdXd2NYVDFJVEo3aFIzMmkycWVDelN2V0RIUzZLb0p2aVpQK3E4?=
 =?utf-8?B?SXZFS1JjcUtYYVVCRlBlSmtwbXRlZ2tUTFB2TmZqT25pZENTM0dTcGxSek9r?=
 =?utf-8?B?eUhlM3RBL1VJdFp4bGZtMEthSDJSck00alFlZWFyUCsrTVU3TXQxWXhyQ3FG?=
 =?utf-8?B?MGg3SUE2S3pyRzZpWEtTbnlDUUE3UDFod290QUpQZ1ZGNGNXVWxCUGVTNW5G?=
 =?utf-8?B?cksxL1ozRmVsOWhBYkZrNmZXeU9ZRk5jRXg3ZTJKVHFTUEZtWWl4VjA5RHpO?=
 =?utf-8?B?UGZKSmxFaXpnb1NtTEdGNGJJcmNjT2FOYmJpVlJvWDllbUVMTlR5b3FzREI2?=
 =?utf-8?Q?UJ3c94Bu+wyK8C5f6ioHe1/zY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cee6f179-bb42-40f6-6a6a-08dbc073d746
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 22:39:57.0208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRm2ZEtMCFeFXbxOvZVWezaWtd055M4hHXPsWNzM/32UZMQUNZTtYBmAof5QjKD4P55XQoed+6k8CGW7HmQTiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8056
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 03/11] drm/xe: Use vfunc for pte/pde ppgtt
 encoding
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 9/27/2023 12:38 PM, Lucas De Marchi wrote:
> Move the function to encode pte/pde to be vfuncs inside struct xe_vm.
> This will allow to easily extend to platforms that don't have a
> compatible encoding.
> 
> v2: Fix kunit build
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c |   2 +-
>   drivers/gpu/drm/xe/xe_migrate.c       |  18 ++--
>   drivers/gpu/drm/xe/xe_pt.c            | 125 +++-----------------------
>   drivers/gpu/drm/xe/xe_pt.h            |   6 --
>   drivers/gpu/drm/xe/xe_pt_types.h      |  14 +++
>   drivers/gpu/drm/xe/xe_vm.c            |  93 ++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_vm_types.h      |   2 +
>   7 files changed, 128 insertions(+), 132 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index f58cd1da1a34..6906ff9d9c31 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>   	/* First part of the test, are we updating our pagetable bo with a new entry? */
>   	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>   		  0xdeaddeadbeefbeef);
> -	expected = xe_pte_encode(pt, 0, XE_CACHE_WB, 0);
> +	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, XE_CACHE_WB, 0);
>   	if (m->q->vm->flags & XE_VM_FLAG_64K)
>   		expected |= XE_PTE_PS64;
>   	if (xe_bo_is_vram(pt))
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9438f609d18b..aa0396330903 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -189,14 +189,15 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   		return ret;
>   	}
>   
> -	entry = xe_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
> +	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
>   	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>   
>   	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
>   
>   	/* Map the entire BO in our level 0 pt */
>   	for (i = 0, level = 0; i < num_entries; level++) {
> -		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
> +		entry = vm->pt_ops->pte_encode_bo(bo, i * XE_PAGE_SIZE,
> +						  XE_CACHE_WB, 0);
>   
>   		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>   
> @@ -214,7 +215,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   		for (i = 0; i < batch->size;
>   		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>   		     XE_PAGE_SIZE) {
> -			entry = xe_pte_encode(batch, i, XE_CACHE_WB, 0);
> +			entry = vm->pt_ops->pte_encode_bo(batch, i,
> +							  XE_CACHE_WB, 0);
>   
>   			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>   				  entry);
> @@ -238,16 +240,16 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>   		if (vm->flags & XE_VM_FLAG_64K && level == 1)
>   			flags = XE_PDE_64K;
>   
> -		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
> -					XE_PAGE_SIZE, XE_CACHE_WB);
> +		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
> +						  XE_PAGE_SIZE, XE_CACHE_WB);
>   		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>   			  entry | flags);
>   	}
>   
>   	/* Write PDE's that point to our BO. */
>   	for (i = 0; i < num_entries - num_level; i++) {
> -		entry = xe_pde_encode(bo, i * XE_PAGE_SIZE,
> -				      XE_CACHE_WB);
> +		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
> +						  XE_CACHE_WB);
>   
>   		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>   			  (i + 1) * 8, u64, entry);
> @@ -1255,7 +1257,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>   
>   			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>   
> -			addr = xe_pte_encode(pt_bo, 0, XE_CACHE_WB, 0);
> +			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, XE_CACHE_WB, 0);
>   			bb->cs[bb->len++] = lower_32_bits(addr);
>   			bb->cs[bb->len++] = upper_32_bits(addr);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 0b8a45609e83..4d4c6a4c305e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -47,109 +47,6 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>   	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
>   }
>   
> -static u64 pde_encode_cache(enum xe_cache_level cache)
> -{
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -
> -	if (cache != XE_CACHE_NONE)
> -		return PPAT_CACHED_PDE;
> -
> -	return PPAT_UNCACHED;
> -}
> -
> -static u64 pte_encode_cache(enum xe_cache_level cache)
> -{
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -	switch (cache) {
> -	case XE_CACHE_NONE:
> -		return PPAT_UNCACHED;
> -	case XE_CACHE_WT:
> -		return PPAT_DISPLAY_ELLC;
> -	default:
> -		return PPAT_CACHED;
> -	}
> -}
> -
> -static u64 pte_encode_ps(u32 pt_level)
> -{
> -	/* XXX: Does hw support 1 GiB pages? */
> -	XE_WARN_ON(pt_level > 2);
> -
> -	if (pt_level == 1)
> -		return XE_PDE_PS_2M;
> -	else if (pt_level == 2)
> -		return XE_PDPE_PS_1G;
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_pde_encode() - Encode a page-table directory entry pointing to
> - * another page-table.
> - * @bo: The page-table bo of the page-table to point to.
> - * @bo_offset: Offset in the page-table bo to point to.
> - * @cache: The cache level indicating the caching of @bo.
> - *
> - * TODO: Rename.
> - *
> - * Return: An encoded page directory entry. No errors.
> - */
> -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> -		  const enum xe_cache_level cache)
> -{
> -	u64 pde;
> -
> -	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> -	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pde |= pde_encode_cache(cache);
> -
> -	return pde;
> -}
> -
> -/**
> - * xe_pte_encode() - Encode a page-table entry pointing to memory.
> - * @bo: The BO representing the memory to point to.
> - * @bo_offset: The offset into @bo.
> - * @cache: The cache level indicating
> - * @pt_level: The page-table level of the page-table into which the entry
> - * is to be inserted.
> - *
> - * Return: An encoded page-table entry. No errors.
> - */
> -u64 xe_pte_encode(struct xe_bo *bo, u64 bo_offset, enum xe_cache_level cache,
> -		  u32 pt_level)
> -{
> -	u64 pte;
> -
> -	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> -	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |= pte_encode_cache(cache);
> -	pte |= pte_encode_ps(pt_level);
> -
> -	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> -		pte |= XE_PPGTT_PTE_DM;
> -
> -	return pte;
> -}
> -
> -/* Like xe_pte_encode(), but with a vma and a partially-encoded pte */
> -static u64 __vma_pte_encode(u64 pte, struct xe_vma *vma,
> -			    enum xe_cache_level cache, u32 pt_level)
> -{
> -	pte |= XE_PAGE_PRESENT;
> -
> -	if (likely(!xe_vma_read_only(vma)))
> -		pte |= XE_PAGE_RW;
> -
> -	pte |= pte_encode_cache(cache);
> -	pte |= pte_encode_ps(pt_level);
> -
> -	if (unlikely(xe_vma_is_null(vma)))
> -		pte |= XE_PTE_NULL;
> -
> -	return pte;
> -}
> -
>   static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>   			     unsigned int level)
>   {
> @@ -158,15 +55,11 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>   	if (!vm->scratch_bo[id])
>   		return 0;
>   
> -	if (level == 0) {
> -		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
> -					  XE_CACHE_WB, 0);
> +	if (level > 0)
> +		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
> +						 0, XE_CACHE_WB);
>   
> -		return empty;
> -	} else {
> -		return xe_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
> -				     XE_CACHE_WB);
> -	}
> +	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, XE_CACHE_WB, 0);
>   }
>   
>   /**
> @@ -618,6 +511,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   	struct xe_pt_stage_bind_walk *xe_walk =
>   		container_of(walk, typeof(*xe_walk), base);
>   	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
> +	struct xe_vm *vm = xe_walk->vm;
>   	struct xe_pt *xe_child;
>   	bool covers;
>   	int ret = 0;
> @@ -630,9 +524,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   
>   		XE_WARN_ON(xe_walk->va_curs_start != addr);
>   
> -		pte = __vma_pte_encode(is_null ? 0 :
> -				       xe_res_dma(curs) + xe_walk->dma_offset,
> -				       xe_walk->vma, xe_walk->cache, level);
> +		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +						 xe_res_dma(curs) + xe_walk->dma_offset,
> +						 xe_walk->vma, xe_walk->cache, level);
>   		pte |= xe_walk->default_pte;
>   
>   		/*
> @@ -697,7 +591,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   			xe_child->is_compact = true;
>   		}
>   
> -		pte = xe_pde_encode(xe_child->bo, 0, xe_walk->cache) | flags;
> +		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
> +						xe_walk->cache) | flags;
>   		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
>   					 pte);
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 01be7ab08f87..d5460e58dbbf 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -45,10 +45,4 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>   
>   bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>   
> -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> -		  const enum xe_cache_level level);
> -
> -u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> -		  u32 pt_level);
> -
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 2ed64c0a4485..c58f6926fabf 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -6,8 +6,13 @@
>   #ifndef _XE_PT_TYPES_H_
>   #define _XE_PT_TYPES_H_
>   
> +#include <linux/types.h>
> +
>   #include "xe_pt_walk.h"
>   
> +struct xe_bo;
> +struct xe_vma;
> +
>   enum xe_cache_level {
>   	XE_CACHE_NONE,
>   	XE_CACHE_WT,
> @@ -29,6 +34,15 @@ struct xe_pt {
>   #endif
>   };
>   
> +struct xe_pt_ops {
> +	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
> +			     enum xe_cache_level cache, u32 pt_level);
> +	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
> +			      enum xe_cache_level cache, u32 pt_level);
> +	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
> +			     const enum xe_cache_level cache);
> +};
> +
>   struct xe_pt_entry {
>   	struct xe_pt *pt;
>   	u64 pte;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 861d050871bb..2e1b4d46d9ea 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1191,6 +1191,93 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
>   	.op_alloc = xe_vm_op_alloc,
>   };
>   
> +static u64 pde_encode_cache(enum xe_cache_level cache)
> +{
> +	/* FIXME: I don't think the PPAT handling is correct for MTL */
> +
> +	if (cache != XE_CACHE_NONE)
> +		return PPAT_CACHED_PDE;
> +
> +	return PPAT_UNCACHED;
> +}
> +
> +static u64 pte_encode_cache(enum xe_cache_level cache)
> +{
> +	/* FIXME: I don't think the PPAT handling is correct for MTL */
> +	switch (cache) {
> +	case XE_CACHE_NONE:
> +		return PPAT_UNCACHED;
> +	case XE_CACHE_WT:
> +		return PPAT_DISPLAY_ELLC;
> +	default:
> +		return PPAT_CACHED;
> +	}
> +}
> +
> +static u64 pte_encode_ps(u32 pt_level)
> +{
> +	/* XXX: Does hw support 1 GiB pages? */
> +	XE_WARN_ON(pt_level > 2);
> +
> +	if (pt_level == 1)
> +		return XE_PDE_PS_2M;
> +	else if (pt_level == 2)
> +		return XE_PDPE_PS_1G;
> +
> +	return 0;
> +}
> +
> +static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
> +			      const enum xe_cache_level cache)
> +{
> +	u64 pde;
> +
> +	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pde |= pde_encode_cache(cache);
> +
> +	return pde;
> +}
> +
> +static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> +			      enum xe_cache_level cache, u32 pt_level)
> +{
> +	u64 pte;
> +
> +	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_ps(pt_level);
> +
> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> +		pte |= XE_PPGTT_PTE_DM;
> +
> +	return pte;
> +}
> +
> +static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> +			       enum xe_cache_level cache, u32 pt_level)
> +{
> +	pte |= XE_PAGE_PRESENT;
> +
> +	if (likely(!xe_vma_read_only(vma)))
> +		pte |= XE_PAGE_RW;
> +
> +	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_ps(pt_level);
> +
> +	if (unlikely(xe_vma_is_null(vma)))
> +		pte |= XE_PTE_NULL;
> +
> +	return pte;
> +}
> +
> +static const struct xe_pt_ops xelp_pt_ops = {
> +	.pte_encode_bo = xelp_pte_encode_bo,

do we need a .pte_encode_bo?

In the next patch you add a .pte_encode_addr.
It looks like our pte_encode_bo op callers could just use a wrapper 
around calling the pte_encode_addr operation instead?

such as:

  ops.pte_encode_addr(xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE),
			cache,
			xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo),
			pt_level, flags);

Just an idea if we want to consoldiate the number of ops here.

-Brian


> +	.pte_encode_vma = xelp_pte_encode_vma,
> +	.pde_encode_bo = xelp_pde_encode_bo,
> +};
> +
>   static void xe_vma_op_work_func(struct work_struct *w);
>   static void vm_destroy_work_func(struct work_struct *w);
>   
> @@ -1239,6 +1326,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	INIT_LIST_HEAD(&vm->extobj.list);
>   
> +	vm->pt_ops = &xelp_pt_ops;
> +
>   	if (!(flags & XE_VM_FLAG_MIGRATION))
>   		xe_device_mem_access_get(xe);
>   
> @@ -1574,8 +1663,8 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>   
>   u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
>   {
> -	return xe_pde_encode(vm->pt_root[tile->id]->bo, 0,
> -			     XE_CACHE_WB);
> +	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0,
> +					 XE_CACHE_WB);
>   }
>   
>   static struct dma_fence *
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index af2ba4acf1f9..1c5553b842d7 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -249,6 +249,8 @@ struct xe_vm {
>   		bool munmap_rebind_inflight;
>   	} async_ops;
>   
> +	const struct xe_pt_ops *pt_ops;
> +
>   	/** @userptr: user pointer state */
>   	struct {
>   		/**
