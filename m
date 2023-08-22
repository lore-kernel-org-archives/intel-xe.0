Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5EEEE49A5
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 23:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7F910E090;
	Tue, 22 Aug 2023 23:58:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7E010E090
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 23:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692748708; x=1724284708;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xXmBGFRCYYEZjr1M1OTrVKqXH3/DuXiA5daJ349nuvM=;
 b=JX1bbeLL4KPtQKY7YtbkJfPdCoSShBZ08qD7W4sDu4Z9HDgG78wn7u9c
 BLjpX5hRHlQJ1Qa/BZKD447k5Vcg7yZY0dqRocheFZe2WSQr86znCejNA
 3q/0odBASMc6fTVzc0XsfUTro7g5KWPxDRitGJsevbrtvjJSznAJ0OVva
 emzqG8TeZyqoPvEydYClWMedGvBPCcquwT8uSoJ8OwMPHQ8Ess65sOBpv
 qLzZOkezCHMSw8XnWcHFe3bXJhcf6VCCi6eG5uV6roypxtAY5ggbjpLjD
 IWTdg9TpGhdtJQHSOLp7MAo2yLFyBJP9WZRqn3VBEFtgpUfuWg0Vm8puL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="373998288"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="373998288"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 16:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="850822290"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="850822290"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 16:58:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 16:58:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 16:58:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 16:58:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyXSgydx0FY/bwRZRlu9stt5mmS2QaVeZbBgB0D4DRoush5FyZ5d5rIjmy4ChR//UfVTxovtSLv7E3j5vvVoeZu2godYDQ1nEJuvyZDtlx28tvQGgNw33yAZ/ezA49zbOZXLpe5uKSf+ejwlUXgv3uQ1e4bc8is7HkF/Cb4O4MqWXwC9+Lor/A5kajqITUNwMLc9RigksScZnL4g0U58U0gM4LccyydM9xvqOY2IlgGfUdU6NtW3ysMb+PjLnhP+qUMoj9MDIhDi6bicDmJeuGYNN8UJIkrKi6eD0T+ni7fEs9gt7Hy/+s1eluat2Z704f3WEk7tyxdXYO8Rp0vdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpM8RM8hEDqvZ4F0lZm7qWJ33dmfAPz0PNsyLbzVVcU=;
 b=cc/hUjjtHZPL4Fwt5Pd8NLJ7YpnxiMOQJ4EfSucsZ1+JYvF2zvv+IjS2evzFLFswolZECXT6AaGFiFYCdNDNsVHWVoDv2KQGdazHJ5cFMsCdGOFOJJBVTX/2I1v6fcaPpNVNEVHKYeQqBDUg2J945LCGErxMt7fpnEhUfGYO5z5SUEJ7g7+nylZ/+AjHR1BEsYdqmxHOdcVh19/+MEDxNzsM0ozIIZsY5szs6IqK8GQX09/rXVbQW4boECLv2MGOHhzdVBjek06qcYv8/8K+wHMuNGmQlC6fDNb1F9SDtJ7rEuTg06v0qouJjOgIx4JnLOQghO9qsdNyJ1KwBBaMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 23:58:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::a9b6:9a74:51f5:2d2b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 23:58:19 +0000
Date: Tue, 22 Aug 2023 23:57:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZOVLT+qHEZjIzga3@DUT025-TGLU.fm.intel.com>
References: <20230822045825.3900964-1-sujaritha.sundaresan@intel.com>
 <20230822045825.3900964-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230822045825.3900964-2-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: BY5PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::40) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbe0568-83fe-4102-155d-08dba36ba8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7K4tSJ7IWXLann4l7LB1Qrjt5GwWqwybeU/NDa9nuTN5XTX6E+otWqSJpTOJZkr1K3r8UTYuXPtf1Jc5bCvJsqEf71aHUyrTXYDehsUMbvHa27d5U1/OtvyjUckm9oqjsB6oSfgjqfRFM4Zl89geoKSIdEY4IwOBlcBRvNxo/8Scu//k6FWkcIHtVB53O0GuRAnKDZ+sB+EyJ4uRMqjPlAyUMRKLt52sxjAepaYPr0vLy31ih36kTIdAe4nXnuOnGLc1JbmMSAwaEu7YJwr1c3yNu+NBrCuPwPj6RQ9NG4qSuwaXtPtwfvBdxVwf8gll+Av1ye4NQUI8yZNuD0XNxOVmGl8UMc/zm1Nd9IKae/OOXrOLwfMQ7R6Ea9gAcdZpS/Ud08Xm4WYgB7lnRmqVQ0bnwUxScwhLfyuaDU0Fvn8eSGzVTNZ/M2akap8TlxPhwuRwh0MUXmU1bPAJP6GduvfgQ/1KqWYgkvJmwvBAEgHxTLgrAmSJCXkeb+ehIei/YIZ8uLjLj0TzmHZLH34iz8z/xGUK0IUvqwA+10U5JLvZh2i1DKJ5U6+G5Mp5snDd7flYC5PNGCHHmHWJI10mfrjs6KOYTJGZy7byySzaR2JCmJwNcJ1qGPB0h/TGcbnh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(366004)(1800799009)(451199024)(186009)(6666004)(4326008)(8676002)(8936002)(6862004)(6636002)(316002)(478600001)(66556008)(66476007)(66946007)(41300700001)(6486002)(6506007)(6512007)(38100700002)(82960400001)(26005)(5660300002)(2906002)(44832011)(83380400001)(86362001)(30864003)(67856001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2hsUWtWVjlINjA5ZUROU2pFRmRLMEd1VWNUNjVYV3J4TG95R0IzTEd1TVFo?=
 =?utf-8?B?YTFyWTJoWGJjSDAxWnJ0Q3BKeC81WUpqUUNRUGtzMzBkKzg2UnY2OW1idS9Z?=
 =?utf-8?B?cFdkOGhIRlA5TzN4am5McXVuUTV0cXRWZkhpMmJFaXlMSDM3Nlc0YmRHd2lt?=
 =?utf-8?B?QmVYVGdHcGdjeDQ1cGp0dUhEM3JoT3plZk9HWmVqajkreTRoVnJ4OEtwd0VO?=
 =?utf-8?B?K25NVTdQUGNESkFZL1MzVkJ3OXpDMDZRVS8vUlc1SXRKQ2MxbkhJSFdtcUZK?=
 =?utf-8?B?dVBpRTdpV01hVGk1MTdkRHRONWk1MnpyVU51RFhmVFdLeVphVFUrOVk3WWpn?=
 =?utf-8?B?Y3dpVEFlaG1NY1NGWUxvMkJleWRGM2hNNnpaZTNVa3JGNENzRDhKWVM0SkZw?=
 =?utf-8?B?WFhHelYzK1daSnV1b2JPd1FSWW5rcHhHQ0NKRWVqbFBubTk4NG9reFE5enlw?=
 =?utf-8?B?dC9wWFdVaDA4NHJzVXlxQ21rMmhMRDUwR2g0RndOZ2xaWVpOMVFTNW1oaFlM?=
 =?utf-8?B?UUg5Z29XblkrdGNlTnkvTHdXYWIvWnFRYUg4RzdKcHQzZXlBQmNyWFpTazlp?=
 =?utf-8?B?RHE2MGs5Znlnd2ZITEdjZnhsaGZ4RU9tRDc5ZmEyYzB6ZGNlcFExRFo3M013?=
 =?utf-8?B?YS9xQWR3bDd4MlR0WWJ4YlQzdXA3SkZ5eTFYYjV6Nk5vV0JsNEpPd01hSUFB?=
 =?utf-8?B?TTNJUTdES0c1WlRGeWNRbktra3VPTDNRNnZib0xhem1JNGo1TFVBRVNkcVdO?=
 =?utf-8?B?NVJmNm8zRiswaXlmL0dhMW5tSXp4RjIxSVFaTzF4RkxMQUVSTG1lSnlUcW9E?=
 =?utf-8?B?b05iVFZXZzR0Y3hYRFBKLzcxRXFqd05MaERaQzdiaXBmVmluT0hNU3V1TlUx?=
 =?utf-8?B?UldXTzV1ZmN0WE96OGhsVFNJWWtuUUdycW90UGV1VUd1NExyei8ybHJUdHZs?=
 =?utf-8?B?YVZxbEJ5bGM1SXh2cGEzWHIzYW95K25YaU9oaENPN1Vqd2FVdHJhVG53bzR5?=
 =?utf-8?B?RjQ2QkFzRDZVaDd3cW1qVWQ4UWp5YXZsam9pTzZqNHltbTExejZObDVJOWYv?=
 =?utf-8?B?UE10b2syUGZhL1kwdkJSWURlQmljVmFZbXdabUZpMGZXRTMwWW5hWlN0RXpV?=
 =?utf-8?B?R1U1b2lyblNUUFMzNWpKc3poVFpIV21vV1BmaSs1c0lvclNpQWVSVHRYSjBI?=
 =?utf-8?B?RWlkZGUvbkxVc0tWNHFsVkhhQnJwMnJSakdBUmp0bi9sMy93bmR6ZGpyQnh4?=
 =?utf-8?B?K1ljL3VPV3JZVjh6K2ZiaVhmL2VIci80clRnU2hDZ2xoejdXd3RiUlRhQ2xt?=
 =?utf-8?B?TFVvaVQxQ2ZzaFBnc2VpQUJSMFZEVnJUR0hLMlVjeVdEUVZiZTJUVmZkcTNY?=
 =?utf-8?B?TVM0Yk9hS1VtSUNHc2QrSXlPRURVZVl0dHVXTVlSZGpGSkRUcVlwQTVzcVA2?=
 =?utf-8?B?aWc5Q1ZzWGRxRkZQaUR0NTZsVDhBbm9UUXZ2aEJRRlEwYlgrcUhqbFVvVVY5?=
 =?utf-8?B?dlNXRmttSE52dXBPRkp4anFqbFF1dEt2OER0R3JpdU1qQTdOQ0dDb2UxdTZs?=
 =?utf-8?B?OXM2RG9Db0xEekdMZzJBMGVTa21DOTVpQTNYdktwZlJtUlhUa3VtdkZacUda?=
 =?utf-8?B?SUViV1g2VS9tK1dCZUd5azdFTEd5VDJmdlN5aVY1RndKSXZmdXZrQmhZcjNY?=
 =?utf-8?B?SVJBRXN0M3A2SW5PL3Yzc3g2RnhwaG11ME1lQUU2dUdML3ZMS3hIYzhFWXBj?=
 =?utf-8?B?QjIwNVNiR1F6OVorR1ljMXhId3VVa1RrRnhUSk0zT21UbGhodVp6bE01V3dC?=
 =?utf-8?B?NUJ0RXpqSkJyelcxSE1lWDF2aXZ1U3RzNytTaWxsS2p4WkM3QXRHV0pYNmhU?=
 =?utf-8?B?Y1AycyszajNnUUQ0MDJlNmlrK1U5YWlCWXpJVTVEWWhzdUxKU2M1VzdDUVFa?=
 =?utf-8?B?dTRGRW5ySzFnZk5xdXN4Z2txeFBPV0NLaVNkRTN3UWtZRDQwMGpTVW5SaDBF?=
 =?utf-8?B?amc0NXErdjJVVTE3S09ZRG5LRUcxQXZEM1FQSzduOTZZWFRUK2gwSDUwTm1X?=
 =?utf-8?B?STkwbnRJVXE4dXh6b1F5MUNrNE9wYkgwM0JoSmpsK09kREdYUXlZUGJOS25L?=
 =?utf-8?B?Uks5OEZJQTh1aFNETjgvMitHcmJwdFRNaG15M3BML05YMStCOHlxemJ1SHph?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbe0568-83fe-4102-155d-08dba36ba8b3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:58:19.3446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJH4Fi4Zh54TuNQsAx4vEkJT01UeYWs6xhv2uipzHFoFINjtHN7uMWEsQfdBzLtrbKw64Hh3Ra9z18EruK1rsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC][PATCH 1/1] drm/xe: Add throttle reason sysfs
 attributes
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

On Tue, Aug 22, 2023 at 10:28:25AM +0530, Sujaritha Sundaresan wrote:
> Add throttle reasons sysfs interface under device/../gt#/
> Currently there is one overall status and eight reasons
> attributes.
> 
> The new sysfs structure will have the below layout
> 
> device/<dev/gt
>              ├── gt0
>              │   └── throttle
>              │       ├── <throttle_reasons>
>              │
>              │
>              ├── gtN
>              │   └── throttle
>              │       ├── <throttle_reasons>
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
>  .../drm/xe/regs/xe_gt_throttle_sysfs_types.h  |  36 +++
>  drivers/gpu/drm/xe/xe_gt.c                    |   3 +
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 282 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
>  .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  35 +++
>  drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>  8 files changed, 391 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 550cdfed729e..eb3ccd90b2fa 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -63,6 +63,7 @@ xe-y += xe_bb.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \
>  	xe_gt_tlb_invalidation.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index baa00557f114..8416d483e7c3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -400,4 +400,17 @@
>  #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>  #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>  
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define   GT0_PERF_LIMIT_REASONS_LOG_MASK	REG_GENMASK(31, 16)
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
> new file mode 100644
> index 000000000000..b71865f467ce
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_throttle_sysfs_types.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_gt_throttle - A struct that contains frequency throttle reasons in gt
> + */
> +struct xe_gt_throttle {
> +	/** @status: status */
> +	bool status;
> +	/** @reason_pl1: */
> +	bool reason_pl1;
> +	/** @reason_pl2: */
> +	bool reason_pl2;
> +	/** @reason_pl4: */
> +	bool reason_pl4;
> +	/** @reason_thermal: */
> +	bool reason_thermal;
> +	/** @reason_prochot */
> +	bool reason_prochot;
> +	/** @reason_ratl */
> +	bool reason_ratl;
> +	/** @reason_vr_thermalert */
> +	bool reason_vr_thermalert;
> +	/** @reason_vr_tdc */
> +	bool reason_vr_tdc;
> +};
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 13320af4ddd3..03be2c2980d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -24,6 +24,7 @@
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_gt_topology.h"
>  #include "xe_guc_exec_queue_types.h"
> @@ -442,6 +443,8 @@ int xe_gt_init(struct xe_gt *gt)
>  
>  	xe_gt_sysfs_init(gt);
>  
> +	xe_gt_throttle_sysfs_init(&gt->throttle);

This is the wrong place, xe_gt_sysfs_init should call xe_gt_throttle_sysfs_init.

Matt

> +
>  	err = gt_fw_domain_init(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..7db67b5fc138
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
> +#include "xe_guc_pc.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Throttle
> + *
> + * Provides sysfs entries for frequency throttle reasons in GT
> + *
> + * device/gt#/throttle/status - Overall status
> + * device/gt#/throttle/throttle_reason_pl1 - Frequency throttle due to PL1
> + * device/gt#/throttle/throttle_reason_pl2 - Frequency throttle due to PL2
> + * device/gt#/throttle/throttle_reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/gt#/throttle/throttle_reason_thermal - Frequency throttle due to thermal
> + * device/gt#/throttle/throttle_reason_prochot - Frequency throttle due to prochot
> + * device/gt#/throttle/throttle_reason_ratl - Frequency throttle due to RATL
> + * device/gt#/throttle/throttle_reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/gt#/throttle/throttle_reason_vr_tdc -  Frequency throttle due to VR TDC
> + */
> +
> +static struct xe_gt_throttle *dev_to_throttle(struct device *dev)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +
> +	return &kobj_to_gt(kobj->parent)->throttle;
> +}
> +
> +static struct xe_gt *throttle_to_gt(struct xe_gt_throttle *throttle)
> +{
> +	return container_of(throttle, struct xe_gt, throttle);
> +}
> +
> +u32 read_perf_limit_reasons(struct xe_gt *gt)
> +{
> +	u32 reg;
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> +
> +u32 xe_read_status(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool status = !!xe_read_status(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", status);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t reason_pl1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl1 = !!xe_read_reason_pl1(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl1);
> +}
> +static DEVICE_ATTR_RO(reason_pl1);
> +
> +static ssize_t reason_pl2_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl2 = !!xe_read_reason_pl2(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl2);
> +}
> +static DEVICE_ATTR_RO(reason_pl2);
> +
> +static ssize_t reason_pl4_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl4 = !!xe_read_reason_pl4(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl4);
> +}
> +static DEVICE_ATTR_RO(reason_pl4);
> +
> +static ssize_t reason_thermal_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool thermal = !!xe_read_reason_thermal(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", thermal);
> +}
> +static DEVICE_ATTR_RO(reason_thermal);
> +
> +static ssize_t reason_prochot_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool prochot = !!xe_read_reason_prochot(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", prochot);
> +}
> +static DEVICE_ATTR_RO(reason_prochot);
> +
> +static ssize_t reason_ratl_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool ratl = !!xe_read_reason_ratl(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", ratl);
> +}
> +static DEVICE_ATTR_RO(reason_ratl);
> +
> +static ssize_t reason_vr_thermalert_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool thermalert = !!xe_read_reason_vr_thermalert(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", thermalert);
> +}
> +static DEVICE_ATTR_RO(reason_vr_thermalert);
> +
> +static ssize_t reason_vr_tdc_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool tdc = !!xe_read_reason_vr_tdc(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static const struct attribute *throttle_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_reason_pl1.attr,
> +	&dev_attr_reason_pl2.attr,
> +	&dev_attr_reason_pl4.attr,
> +	&dev_attr_reason_thermal.attr,
> +	&dev_attr_reason_prochot.attr,
> +	&dev_attr_reason_ratl.attr,
> +	&dev_attr_reason_vr_thermalert.attr,
> +	&dev_attr_reason_vr_tdc.attr,
> +	NULL
> +};
> +
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, throttle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("throttle", gt->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
> +	err = sysfs_create_files(kobj, throttle_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> +
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..809213c3bba1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> +#define _XE_GT_THROTTLE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_throttle_sysfs_types.h"
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> new file mode 100644
> index 000000000000..acc23ce8d0fc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_gt;
> +
> +struct xe_gt_throttle {
> +	/** @status: overall throttling status */
> +	bool status;
> +	/** @pl1: throttling reason is PL1 */
> +	bool pl1;
> +	/** @pl2: throttling reason is PL2 */
> +	bool pl2;
> +	/** @pl4: throttling reason is PL4 */
> +	bool pl4;
> +	/** @thermal: throttling reason is thermal */
> +	bool thermal;
> +	/** @prochot: throttling reason is PROCHOT */
> +	bool prochot;
> +	/** @ratl: throttling reason is running average thermal limit */
> +	bool ratl;
> +	/** @thermalert: throttling reason is vr thermalert */
> +	bool thermalert;
> +	/** @tdc: throttling reason is vr tdc */
> +	bool tdc;
> +};
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 35b8c19fa8bf..c55815d1114a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -8,6 +8,7 @@
>  
>  #include "xe_force_wake_types.h"
>  #include "xe_gt_idle_sysfs_types.h"
> +#include "xe_gt_throttle_sysfs_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_reg_sr_types.h"
> @@ -298,6 +299,9 @@ struct xe_gt {
>  	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>  	struct kobject *sysfs;
>  
> +	/** @throttle: frequency throttling reasons in GT */
> +	struct xe_gt_throttle throttle;
> +
>  	/** @mocs: info */
>  	struct {
>  		/** @uc_index: UC index */
> -- 
> 2.25.1
> 
