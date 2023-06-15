Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBA5EB64DB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 09:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D8E10E4AB;
	Thu, 15 Jun 2023 09:37:03 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7951010E4A7
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686821821; x=1718357821;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6hQj/Hvuaqjot4cVUoa5mLdO6LV9P6jrH1ivgyjWlyI=;
 b=RWDqeF7S6lrMliC4ll03yeQUGW5Lyh5oMJFqvYkwaAZ2xJeQ7ipbnqMQ
 mlNC8KnP9v3iuDQGC/L47ky0uxCx0NEIbN8bVZ0N47GELTpHOXqqWmu/z
 AFmU57G9N0s6PatfC9w3Czny00arkgGRWOhpRg78eVadpqOom6CSfxpXm
 TdRzYVUqf9iErykjuXI7eaIVAoLpKhVj8igxPUQssCh+srPC5V7HKIPdl
 CNtm7U8Q3sYfj7D6xG3NX/q58I3VVdJlcgHQIla7WvZwdCRIwP64am/zV
 gres32ZwbaaLIzogeVbKNNkuuEi5TQyy+OdhcuFs6lYs2TjSXOdrK4B3l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422470396"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="422470396"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 02:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="886585685"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="886585685"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 15 Jun 2023 02:36:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 02:36:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 02:36:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 02:36:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIxAXiqc7JCKlQe6qdM/iNFxfr0WmqKHiMeYMy9zIeG9+CDSZdOEELda0BgnbsiEItR+Uzg7J5Pwx/B/mRcZqDxjHT5h6PXoi9mMqbesJbegHEln45l/H+5SAxCzllCXG3Y/1j9LeJ4pXrxMxp1x2IaggfAgp/2Y35iyBX67A6TP0rM+2uu6eumvkhuu1o6Ct8lu1WXJGks2uKQWd2DeIZE35ktpc0A3hv+LlGiIdRP3yxIgnJTc7iAdVVpP6GwinE6WWJsyRi6AzomkgnGshurKdvuRygzYhhY7VRNBmrva7DEArxOJKzUuTAOOzMwfKhj6d4hApjDOUc4hS4eTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYTc6q6INQ7vsHxYiRaVR5DcjWVQD3gbo7SYqvTHdlk=;
 b=OfcBrGBUWT1Yq490tv1K7R5tU5yl8l2880mdeltnwDITVf2gEZh7r4CXd8VM5X+rFiWFGYQTI408CT8jok+PKFy0H0is5ENvaiDMwtDWRpJNpoA3dbP8CpUdNUqg0HoH002zAfZ1/rsLfdL/Jh1x4mnDURHRXCRfP4xhVxLNPsIFEVv2yRMD//VjgT+dq7xnj6OV4v7orpFZTd7uoaCT+fwZZMESsbTSOJcXzmU8L+g2TDEhQKNazhi4xVYYrafmgv3ONrFBwb2XA9V0QG/eoValPDUVzahfE0WmxI+27pFetbItM+UapgQLg//GFeKt8zkzcfKN0Yc1rEe5xwdxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Thu, 15 Jun
 2023 09:36:48 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%7]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 09:36:48 +0000
Message-ID: <9b939163-1907-fb31-57b7-d13b8aaa86c7@intel.com>
Date: Thu, 15 Jun 2023 15:06:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
 <20230607110328.3739706-4-anshuman.gupta@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230607110328.3739706-4-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::10) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0d9b17-a5a9-4734-6135-08db6d840aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGfICc6LZkf5GSB9HOnO53cwGj6LGOVVYSTPQsr8YSm9vfGiJejeL2dqb5GTEAOxHe2NIvmpZNaDmqWUv0RdY0zMBm+008yI+s4tDQrh5wBd2YqjdJZbGTDzftIUN446MFlKnc/3cbCYSToZCPa430Mo8504+3CzRVhlm6Bo4OZlTz8Z3NJUpjv0iyJMVjXHLIOcsWjf/I2UKTmXm5GCc3pZBACi3G1COrJo17aQeAhanlS8a2nExX622Icqnpa3omkYXuiLDtSmApfFvBOu+UbOv/AE9DxmY1bML3ShF46NQAqkqTTxvYNIBr3SIf+SmIMuUMcz+OPzeVwsJtoWx8mJW9k87OnJduJzVOOb5b3A3L5rjH6jifX7T47PXhFi2kyUQZSi8d6imFALB4qgDbaR+QLwaldcw2absSRatT4O4pNfSkt/cEZXeagVSEbtE2Sya7QQf6QD28quRN5PzMHFLUUCLuMCsDpqRVOitKjFQlKN6PfMXdj8KcE5Q1ja5JvCs7RmPRUMAgoqdwJxo2XSQuHji6s8G8Ht5OCzmzV/Pcw35SmW8Y0gwkakLepzDW+1TLOrFmZeIgxzqtExX7UozDcXMfLtxXHwv5h0MgmrQRuf5c66IFqJNj/xlDZNg2tSIGaoRrVvcYvG2KvaKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(6666004)(478600001)(6486002)(6506007)(83380400001)(53546011)(186003)(107886003)(26005)(36756003)(38100700002)(31696002)(86362001)(2616005)(82960400001)(6512007)(316002)(31686004)(5660300002)(41300700001)(8676002)(2906002)(4326008)(8936002)(66476007)(66946007)(66556008)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S09KUTNvZStZWk1TSmo1ZHVrMWhUMFlrMnk4NWlJYSs0RlZpMldRcitPZ3hQ?=
 =?utf-8?B?QTNOYmFXa3VyM1FBdHJWYlRmdVJXdC9aNzBWNFpYK2UyRytKc2NWb2FYVExO?=
 =?utf-8?B?TkVrdm9KMTdoSmpocjBFMFNCK0xYNDVrUUZmcDNwUHR6NUZHdzVtMXVLaVlY?=
 =?utf-8?B?emVTenI5RkFJRTRMMzRmTUJKanFUWjh2eDRSbUFWVVVLM2NTaFNuMC8wN2E2?=
 =?utf-8?B?RnpZMjl2cE5jWlZReDJ1dHNSTTljeHI2QzVMZnVnRCtuNnZ3b0RjWlVGNDFs?=
 =?utf-8?B?NHg0QmtRQzY3QWFNc09iak4rTmk1ZHYyTWt1Q1k1YVExSmd2U0pld3lPWkpK?=
 =?utf-8?B?QmlzWHJZeE9QVlViUURvTHZhbnhxK1p5Q3BwV0UyV21NNGNZQ3ZtZ3hmUTBZ?=
 =?utf-8?B?S1FLbzQrMDhCTU5RSkVUZDdOZHNoY0Z1VzZLQ1plYUhLZnhET2hKUmFSWHpL?=
 =?utf-8?B?dWlGNHdPUE1tcXZ3Uks0N21IQ1Y1ejhsK0VDMGF0QXJhYXZXYys3eXRsR3JV?=
 =?utf-8?B?L3lpREk3d0ZITDNHc1R3RlNLanFFLzFwN1pWemZpbDNWMmVqUGtqM0Q1Mi92?=
 =?utf-8?B?WlBjR2h1RXF1WEJqb3psYUNWQkk5d01oSHVOY0lFd0RaUmJHN2QvZ0xHczFM?=
 =?utf-8?B?S2o0bUloNStReHgvV0o1OG9GQldBKzZGYTJ6QXJVNjZQUVJXOVBETmZQVldo?=
 =?utf-8?B?LzJzWXBBcTR4UkRXNDArSVhETlVYb2dRS0tlZndDTUVVcW9EaHhLdXdUYnNh?=
 =?utf-8?B?elRleUVmWHJMWWRMcm1LL2JSN0F2cEdlWEdaQkoxdGZ2SzhwZjYrb21Selcx?=
 =?utf-8?B?OXFZOXVLbTMwZ2pOdFhCL01jZFJnREVZQWRmWkZNa0VTZStaV1dWOWVLZFoz?=
 =?utf-8?B?Z0x5YU51dkgwVk9hdnhub0Zlcms1amFLaG1LNHdWK1F0aTdOeUJEYkpCWEhj?=
 =?utf-8?B?V3hrVUZMVERXcEN1YzFhcU5tZjZTdG5yWHUxN0lPeHp1UlRGVmlRUTgraThj?=
 =?utf-8?B?N3JVS094eWZiTDNJaEpRWjVUc1p4OFBZd0xmb2o3QWpuYkFtRmIzTDgybXpX?=
 =?utf-8?B?cEwrSFpxWkpTY3ZkVFVDS2FWTHdiTGwxTEl3YlVkeG9sU0pXenp4OVRMMkVW?=
 =?utf-8?B?RU1KWDRWREQ4bzd0ejBKYVJKNy8xdExQWjZCOHY0ZHg4ODRqNTFrRFAvWENN?=
 =?utf-8?B?YzRpN3gzV2hVNjRDdURWNEhLSlN0ZlBJMUlMN2cvS3JnNEVPWlpJTDBycnhs?=
 =?utf-8?B?Wkk1a1FTNThvSG5LbFNQaVV6dVZ1UEFJSDlPUW85dVM3RXZzb2Z5eUJkbWp1?=
 =?utf-8?B?S3FnSmZLYmlrZzJaRlZTLytuSlZHQXh5VzZsR0VZc252NTc2SHMwT1FTQlo3?=
 =?utf-8?B?VTQwY1Flb0VZRHI0ZDRQbWVzbzlrVmluYVpINDIwQkJnaW52a0Q4ZElDSDRw?=
 =?utf-8?B?Uzh2QzVXZUZ6b1BQaXhkczhybDlwTWdoQisya1dEaVg4Y1FiOU5KL0Y1dG5U?=
 =?utf-8?B?TzNiVTdpV0RQd2VacXRjQXdCRnFwenplc2dPbG5zLy9ISGVwYmhIT0NYNlJF?=
 =?utf-8?B?c1BoUWlBWjNvVEU0eVpQL1Y1WkJMV0cydlZTMjdoNGxleE9wMm9rZ1pvbExx?=
 =?utf-8?B?SEI4cFB6MjVIZDY1cUxLTUJuaGxScnZLbXNEUk1JY3Z5NnV0elNyaUZoOUs0?=
 =?utf-8?B?WENxQndJRnBBb2ZOTGFBZlFtcElNZEU3czgrU0lsUUZlWlVxaGpDdkk2Qkpo?=
 =?utf-8?B?VHZKaHJBYzhaWGxtUW1lV1Q3WW41eTBUOEIvSTZJSXpHUGNuMnU5QWY3amhj?=
 =?utf-8?B?YS9zcFo3RVJCY08zOTdSUThkaXZmSXZhUVV1OHZqZi80ZHdSV29hZUV5NTlQ?=
 =?utf-8?B?bmo4WVJRZzlkbEtZa1FuV1FORlhLdEQrTDh5Q0I3czFCbVQzMmtQV2pQTDkv?=
 =?utf-8?B?R2xZRnBNdWRSM29lTVRvUUdSVFJxcjBZa05zeVFJbVFvSTVKcWFvVi9BazUv?=
 =?utf-8?B?VlZ3TWt4Tmw0WVdkYnpqYUR1VFJic1YvWjFIU2FxdUxzMFowTDJVMUtjSzk3?=
 =?utf-8?B?S05KMGlUaURoS1ZyblkrOVVFQkZEdnhkbWEzNmxQd0tnazZqbnZLNjVTT29H?=
 =?utf-8?Q?d7hqNzx/PM/FtKG7aEb5qji+C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0d9b17-a5a9-4734-6135-08db6d840aa8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 09:36:48.6133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QKifZmCtYgIVMjde7OeaQFPBsf81s1WDYdzjo1jI4fiNlKvuo1iQZHXsvU78OebuzmHJ/nvvASKIWBnrrt4qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/5] drm/xe/pm: Add vram_d3cold_threshold
 Sysfs
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


Hi Anshuman

On 6/7/2023 4:33 PM, Anshuman Gupta wrote:
> Add per pci device vram_d3cold_threshold Sysfs to
> control the d3cold allowed knob.
> Adding a d3cold structure embedded in xe_device to encapsulate
> d3cold related stuff.
> 
> v2:
> - Check total vram before initializing default threshold. [Riana]
> v3:
> - Add static scope to vram_d3cold_threshold DEVICE_ATTR. [Riana]
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 76 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_sysfs.h | 13 +++++
>   drivers/gpu/drm/xe/xe_device_types.h | 21 ++++++--
>   drivers/gpu/drm/xe/xe_pci.c          | 10 ++--
>   drivers/gpu/drm/xe/xe_pm.c           | 37 ++++++++++++--
>   drivers/gpu/drm/xe/xe_pm.h           |  3 ++
>   7 files changed, 148 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f34d4bdd510b..b939fecb59ef 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -49,6 +49,7 @@ xe-y += xe_bb.o \
>   	xe_debugfs.o \
>   	xe_devcoredump.o \
>   	xe_device.o \
> +	xe_device_sysfs.o \
>   	xe_dma_buf.o \
>   	xe_engine.o \
>   	xe_exec.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> new file mode 100644
> index 000000000000..3e01c97e4aba
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
2023
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_pm.h"
> +
> +static ssize_t
> +vram_d3cold_threshold_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int ret;
> +
> +	if (!xe)
> +		return -EINVAL;
> +
> +	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buff, size_t count)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 vram_d3cold_threshold;
> +	int ret;
> +
> +	if (!xe)
> +		return -EINVAL;
> +
> +	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
> +
> +	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
> +
> +	return ret ?: count;
> +}
> +
> +static DEVICE_ATTR_RW(vram_d3cold_threshold);
> +
> +static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +}
> +
> +int xe_device_sysfs_init(struct xe_device *xe)
Can be void and print warnings on error since returned value is not used
> +{
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> +
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
> new file mode 100644
> index 000000000000..d6dc2ac7a37a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
2023
> + */
> +
> +#ifndef _XE_DEVICE_SYSFS_H_
> +#define _XE_DEVICE_SYSFS_H_
> +
> +struct xe_device;
> +
> +int xe_device_sysfs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5541986b7df9..bdd093d30788 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -375,11 +375,24 @@ struct xe_device {
>   		bool hold_rpm;
>   	} mem_access;
>   
> -	/** d3cold_capable: Indicates if root port is d3cold capable */
> -	bool d3cold_capable;
> +	struct {
> +		/** capable: Indicates if root port is d3cold capable */
> +		bool capable;
> +
> +		/** @allowed: Indicates if d3cold is a valid device state */
> +		bool allowed;
>   
> -	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
> -	bool d3cold_allowed;
> +		/**
> +		 * @vram_threshold is the permissible threshold(in megabytes)
> +		 * for vram save/restore. d3cold will be disallowed,
> +		 * when vram_usages is above threshold value to avoid the
> +		 * vram save/restore latency.
> +		 * Default threshold value is 300mb.
> +		 */
> +		u32 vram_threshold;
> +		/** Lock to protect vram_threshold */
> +		struct mutex lock;
> +	} d3cold;
>   
>   	/* private: */
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 33779a092ae2..2ff2e4a0bf72 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -758,7 +758,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   
>   	pci_save_state(pdev);
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		pci_disable_device(pdev);
>   		pci_ignore_hotplug(pdev);
>   		pci_set_power_state(pdev, PCI_D3cold);
> @@ -781,7 +781,7 @@ static int xe_pci_runtime_resume(struct device *dev)
>   
>   	pci_restore_state(pdev);
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		err = pci_enable_device(pdev);
>   		if (err)
>   			return err;
> @@ -797,8 +797,8 @@ static int xe_pci_runtime_idle(struct device *dev)
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   
> -	if (!xe->d3cold_capable) {
> -		xe->d3cold_allowed = false;
> +	if (!xe->d3cold.capable) {
> +		xe->d3cold.allowed = false;
>   	} else {
>   		/*
>   		 * TODO: d3cold should be allowed (true) if
> @@ -811,7 +811,7 @@ static int xe_pci_runtime_idle(struct device *dev)
>   		 * 3. at resume, detect if we really lost power and avoid memory
>   		 *    restoration if we were only up to d3cold
>   		 */
> -		xe->d3cold_allowed = false;
> +		xe->d3cold.allowed = false;
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c250a36b99ad..ad282eaf8a6a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -12,6 +12,7 @@
>   #include "xe_bo.h"
>   #include "xe_bo_evict.h"
>   #include "xe_device.h"
> +#include "xe_device_sysfs.h"
>   #include "xe_display.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
> @@ -148,8 +149,11 @@ void xe_pm_init(struct xe_device *xe)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
> +	mutex_init(&xe->d3cold.lock);
>   	xe_pm_runtime_init(xe);
> -	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe_device_sysfs_init(xe);
> +	xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>   }
>   
>   void xe_pm_runtime_fini(struct xe_device *xe)
> @@ -166,7 +170,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		if (xe_device_mem_access_ongoing(xe))
>   			return -EBUSY;
>   
> @@ -192,7 +196,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		for_each_gt(gt, xe, id) {
>   			err = xe_pcode_init(gt);
>   			if (err)
> @@ -213,7 +217,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_resume(gt);
>   
> -	if (xe->d3cold_allowed) {
> +	if (xe->d3cold.allowed) {
>   		err = xe_bo_restore_user(xe);
>   		if (err)
>   			return err;
> @@ -248,3 +252,28 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
>   	WARN_ON(pm_runtime_suspended(xe->drm.dev));
>   	return pm_runtime_get_if_active(xe->drm.dev, true);
>   }
> +
> +int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
> +{
> +	struct ttm_resource_manager *man;
> +	u32 vram_total_mb = 0;
> +	int i;
> +
> +	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
> +	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> +		man = ttm_manager_type(&xe->ttm, i);
> +		if (man)
> +			vram_total_mb += DIV_ROUND_UP_ULL(man->size, 1024 * 1024);
> +	}
> +
> +	drm_info(&xe->drm, "Total vram mb %u\n", vram_total_mb);
Total vram %u mb
> +
> +	if (threshold > vram_total_mb)
> +		return -EINVAL;
> +
> +	mutex_lock(&xe->d3cold.lock);
> +	xe->d3cold.vram_threshold = min(threshold, vram_total_mb);
Is min required ? -EINVAL is returned if its greater.

Thanks
Riana
> +	mutex_unlock(&xe->d3cold.lock);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index e0c4f92e27c5..b50ec8bdce6f 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -8,6 +8,8 @@
>   
>   #include <linux/pm_runtime.h>
>   
> +#define DEFAULT_VRAM_THRESHOLD 300
> +
>   struct xe_device;
>   
>   int xe_pm_suspend(struct xe_device *xe);
> @@ -21,5 +23,6 @@ int xe_pm_runtime_get(struct xe_device *xe);
>   int xe_pm_runtime_put(struct xe_device *xe);
>   bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
> +int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>   
>   #endif
