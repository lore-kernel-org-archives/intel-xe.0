Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF6FC7EE23
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 05:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC9A10E00C;
	Mon, 22 May 2023 05:13:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E963410E00C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 05:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684732405; x=1716268405;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1OlqzFsxD6u/gywK/ugZOORjlj5YJKazKq6EBgj8oNE=;
 b=LuUI4+CSBcfGk7a2UNXQaBpE4ql3wgx1ojsAThiwCLuagONBUqyHlKIZ
 Zj2gL/tVbXfivSiiF7+CGmDxx4mFVS3hIphWLEji+DaAbLM3hzJjP4DSS
 xiWHhhM51glnOlZfSh61a2JmgeU6uaUTB7sdnz6UTfsKHbGVAFQYqdZBj
 fN3mq72HIQYlfyo4QRfkOQrd7mPPOsWR79VzEwsPRtnztULmcyVDX/5zq
 iBry+UFgvdmZ7ykZsTl3YMeQLe4qO1p6OHYHW8n6xtgm1ieBLkc6dZNB5
 ByMWBOFWmOkBJl9fFPyRzRKUigr3yCFvhxKt8Wfl4uk2eipywlnmJjiHm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="416290725"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="416290725"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2023 22:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="815523365"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="815523365"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 21 May 2023 22:13:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 21 May 2023 22:13:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 21 May 2023 22:13:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 21 May 2023 22:13:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn2Pr1r2TUO9JDjyP7awL1UTLzZKxIZGOW35PtLBhmeOIh5sPN6frVHIT3mTbJZj5nlUxjL3WRMgy4mf2kMU9I4GH9TuIDoMSPijNNrUaU68VuuNwHWubGi+U1oD5gM9iLoGBojEitbxpXqgcilsOl9O5cHukQ6Wi85otVMG33W3hx0VOHZVP9J4PsUyVOo6tE3PO80XXZDBHOcuhG9u6+JAJsK+S5gvVTK6vOsY/A5gkiN71ISB/zMsQbgLIrOugZnp9RfZZv2QkzUgTHTVJkBXCES0AvkQtomeVG8JgNXQdA6oD1M0mIBPC2auUhURq2Vtmpwk348lrGE+CGJeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZN9VPvLh9pTKiMJMcBc2zdkv5MygWGksilKCQpPSHmo=;
 b=Q7lrnBkHddp3F+M1brhQ9/9/m5mT3LCdZwgF4CkPKrNhTKMfnPGdbgnzMPmvbR+6hEIFEKCxV1LNx3Hu4lPLbR3GYJ8fSgWbwgYnZF+abYM1tIQzM3/zJOY4HKLYOZujbo6Qdm4ysk3sm4d3cXrxZo5IrIVG/WFqrz6fwpsVKBXiNjfanD5RBxXoJP7Qzg5Acbs8pOvHyBSmSTZ85Rvn824AFTYfqTmpP1MSw6IYZRbellRY7dle6rV8pGN6M5smeqAJXJHMb2dw2fF02jr+gC5P1iNoEJlJf06WEhXfnjegvxmYMQJOg9qLzs/hU1dE4CmX2eX4VvyvC5Q1N5k79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 05:13:20 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3%3]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 05:13:19 +0000
Message-ID: <c99e34ec-36e0-df55-30c5-c1c29f7f0bd9@intel.com>
Date: Mon, 22 May 2023 10:43:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230519162555.409853-1-anshuman.gupta@intel.com>
 <20230519162555.409853-4-anshuman.gupta@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230519162555.409853-4-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::17) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8f0dbd-2ff8-44d7-1f97-08db5a834199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUwfljC26BwT4gj36DOcjKS2G1Ny1bYvjRBk5HL5PaYmSV5hndy4dbQXQ/Y0ps0MWmDeP9GpwEo6VbNai4WoG6HuKT2KDusClepDopGPforAWs7AizxzvoT4N0WTxmasK5Nlui2BDQAI8Gx4OqnVVvr6Na0y+nh7S+8R954+DIXj79VLWqG/AJ577FJ6E5RInz1r0I1FdPmTedqThadWD2gPZu42XM4V9Hv9LSdazpwfqbhgelXTQCvYth9XNvXMMwnqAdFbbTIt1AAT5qoiq1MkdpDfoLN1G3GoAWeZdPBl0+yDKOk061dDvE7dpeCl/+nty5d+KmTmLELtEkplQQOH6AhTlJgchc5GLXhRTMq8niIW84lyWQwN+3AHiCr2E5nu5QnuVZ1JiGf2ppXt+pzyzdf7hVd/C2rduspdsqax2A8LOZbz1/cMrKnjupgjzvQCEEAYz3Jpg8kTez+sfVqzcznRA9Av0VZUSY79rflx7Z3yMZxHPxj6i5Fko0+tTksSRyoeK0QKLgdg/Np2enXMSXKsMJ3KcONTvlEBEL8/+yC22QcV2KMus1FCS+NxrbW1V05JLYhi+Ta8b4j/0FlFH5r+47kJpsGMy9RTeGeMZTb8BpgCX/ryU78vpwjC8Y0QtS3bBeTjIAN7HPtAfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(38100700002)(8676002)(8936002)(5660300002)(82960400001)(53546011)(6512007)(6506007)(26005)(186003)(2906002)(2616005)(36756003)(83380400001)(31696002)(44832011)(86362001)(316002)(31686004)(6666004)(478600001)(4326008)(66556008)(66476007)(66946007)(41300700001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFBia2t2SmloRWwvK3JldFJFRkNCYVU1TmhrYnp4aDBDdmNHeGtmMzFad1M0?=
 =?utf-8?B?NXNYVlRBczRReDAxOHIwd2dRdEc0Y1l0V3dnT1VRMkVEQ3ZQZklsenM5NXZ2?=
 =?utf-8?B?MFcrSjg5WjhHNk80L21jRUIxSWdTc0R3NW1KNWMvRFdKazdrRjJkemxMVDBC?=
 =?utf-8?B?dmlvTGZVdlFWRE9QcUQ4M25RTzV3Y09NOEEraCs4M1JydXJHV1hJbXFSS2pn?=
 =?utf-8?B?VGMyUWl3bVJHYVVmOVhWb1FBWGFnVlhsMEl1OHg0cGxOYzhqRHdqekNQa1k5?=
 =?utf-8?B?c0JBajNveWdBbkhybjZnTGF0YzVOZ0VER0FvdGxzNkUzKzUzMlpycU1IbGg5?=
 =?utf-8?B?TTBySkJsS2l0RzFzcEx0bFJyNWFuQ0Q3UWtibzVuS3Z1UXhwNXFNUERvM0lW?=
 =?utf-8?B?Q2VxRCtyRkxROEcxK2diUS9YUnovVkZTTjRUbEYzT3Q5cUFmM0UzTVNFQTVw?=
 =?utf-8?B?U0htai8rZTE3RFExSEg2S21uQ01Zd0JvVFNHZXFUZkhIKzdjRzI3SGdLcjdu?=
 =?utf-8?B?TnFaOWtSMjB0S2NLdWNvWUQ2aGJ5MjJ4TDJKZmhaeC96cFZpK3Y1ajlsUDdD?=
 =?utf-8?B?bVZzblFGWXg1VW9yWnNRQUQ2blJKdzhJd05EWWUwYTg0Q29qVzdyU1dOZ01C?=
 =?utf-8?B?OFR2eUNrT0QyVks2eDAxL1V2U2V3UHZDWFBPaWRNYVJ2citZbGdsTGpNMWlu?=
 =?utf-8?B?R2FlUU1Rdk5YT2p5QzR2SVRQRVMzb3EyY1M3MUJlY1RJeVRMMEVkcnc4TnVJ?=
 =?utf-8?B?T2QwR0IvY2pVb01PSC9VTEpaQ2hWN0xVd1NlVHN0VkRQZTRyMld2V05nWkNv?=
 =?utf-8?B?N2lOczRmblBiVzVlbUF4Y2VsZmVnRVl3MXVYSG5TbUZLZjhMVDFqSUI2VGxx?=
 =?utf-8?B?Qk93SEZTTVlqMm14cWpkclJrU3hzWWV2dU9LZTQzUUFBalFwWUlLNDl3b2VY?=
 =?utf-8?B?eXVuSWMydmszblpKR2ZEN0VyMHF0OGNZakxFWFVSUHQ0RzYyN1lEemRZRjZz?=
 =?utf-8?B?SGR1bzJaanZDaDJ2MzBydDhrSGUycEtOb0Z3R3JTZGRhNExHSXlLNjFsbmFG?=
 =?utf-8?B?N0NFYXk0SC8xd3VTSi9mbWg0UlU5N0hpdllpRTgzVXhPR29BWlowNDJranli?=
 =?utf-8?B?MFhSOFFvdWJRRXRjOW1aMDJIaS91K2pMVUFZeU5vanhUVDdKQVVDOWtNRm00?=
 =?utf-8?B?bmNGaERRRDFmdlZHR1IxaldiYkg2VGR5WmkyeTQxUUtJalVkMTRtTXBHamJk?=
 =?utf-8?B?eWtERlcxWXIvcnkyMnQ4TFNGdFNrMzhGRGl3LzhqSkdrR0duK0VHeCs4WHlB?=
 =?utf-8?B?RkZJOE1nSGo1SVdnVVdSSGRRV2JHUDBoWDBZUitHSDlHK1g0M0FXanozWXoz?=
 =?utf-8?B?MFh2aVIwa2pXaE9LWEpMMUVUQ1FOc2ZDTGV6TGxleXFlZS9XSVJKU0FoTXlo?=
 =?utf-8?B?NnpjTGJvc3hSUUJiSi9zMituaWc4Y3crQk95K0dHSm9hMEJ0V05wZlhUNEN3?=
 =?utf-8?B?Z3d6djJGMzI1STBjWU5weElaUTVsc3BreWR6a0d0Mzg2a2YxbFY5R1FORFY2?=
 =?utf-8?B?RTdVL3R5V1RUeGxFWWZQYU9lVWNrTVdOSnd1NnB5Q0Z1ZGpUT3g4M3pMejVa?=
 =?utf-8?B?aTBYdlQ4Y3hZdkF2VnBEb3c1Tkord0tRd0M4MEF3L1MvT3dWYkc0Ry9sWEdj?=
 =?utf-8?B?ekgxOGdSY00wdVlaQlBLelJyRmJNQ2ZSQnowSm4ySmh0MVpKa1psZWc4MW9n?=
 =?utf-8?B?Z1lNY04yR2VnK0J2MkMrVFlzNmJyY1Q4V2pWK0ZIb3hua3pUU3M2eWgxd2lr?=
 =?utf-8?B?d3Y2UC9LaFZBb3R3S3RkU1Zpam04alRJaFcxYUxjQVpWUENpM3hlUE1CQm44?=
 =?utf-8?B?YzkrUVplMkxpd1NKZmppS0hESUE4TUg2NWl2bHJ6L01FNlNXQ0RJVS8wVVlN?=
 =?utf-8?B?bjNHN2Z4cTE1RjR2aExpL0hmVlJTYlpRVkwvVzliSDBzMEtvbGZxcVdHOG9G?=
 =?utf-8?B?c21Wb1dJMVB1NE13eldDVGM0VEJraFZ5Z09RQ0FxTHRJeHp4NTFzRUhiaTRN?=
 =?utf-8?B?UDZvS2FnaEdwUWQrRVFQaWF6Wk1XS1N0dC9sME1WaGsvb1lBRm9BTGZ3Y3U1?=
 =?utf-8?Q?JZCshAYQFj7iYbKh0YNjfMx+w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8f0dbd-2ff8-44d7-1f97-08db5a834199
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 05:13:19.4702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihVOKzS1BWkG2Jbp7y/be24NaWbDDiu83qOi1DM1LXTHT5qCzUuDAE9t7hQidlKxwbibdZiB2lFVwvdevxv5cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/pm: Add vram_d3cold_threshold
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

On 5/19/2023 9:55 PM, Anshuman Gupta wrote:
> Add per pci device vram_d3cold_threshold Sysfs to
> control the d3cold_allowed knob.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++
>   drivers/gpu/drm/xe/xe_pm.c           | 65 ++++++++++++++++++++++++++++
>   2 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8fd3acf60719..68222a3447cf 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -272,6 +272,14 @@ struct xe_device {
>   	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>   	bool d3cold_allowed;
>   
> +	/**
> +	 * @vram_d3cold_threshold is the permissible threshold(in megabytes)
> +	 * for vram save/restore. d3cold will be disallowed, when vram_usages is
> +	 * above threshold value to avoid the vram save/restore latency.
> +	 * Default threshold value is 300mb.
> +	 */
> +	u32 vram_d3cold_threshold;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index c250a36b99ad..ebdbdf2e0898 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/pm_runtime.h>
>   
> +#include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_placement.h>
>   
>   #include "xe_bo.h"
> @@ -132,6 +133,68 @@ static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
>   	return true;
>   }
>   
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
> +	ret = sysfs_emit(buf, "%d\n", xe->vram_d3cold_threshold);
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
> +	dev_dbg(dev, "vram_d3cold_threshold: %d\n", vram_d3cold_threshold);
> +
> +	xe->vram_d3cold_threshold = vram_d3cold_threshold;
The value set should be within the vram total size.
A check against total size?
> +
> +	return ret ?: count;
return count
Already returning if there is an error above
> +}
> +
> +DEVICE_ATTR_RW(vram_d3cold_threshold);
static?
> +
> +void xe_pm_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +}
> +
> +int xe_pm_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_pm_sysfs_fini, xe);
> +
> +	return ret;
> +}
> +
>   static void xe_pm_runtime_init(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
> @@ -150,6 +213,8 @@ void xe_pm_init(struct xe_device *xe)
>   
>   	xe_pm_runtime_init(xe);
>   	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
> +	xe->vram_d3cold_threshold = 300;
> +	xe_pm_sysfs_init(xe);
>   }
>   
>   void xe_pm_runtime_fini(struct xe_device *xe)
