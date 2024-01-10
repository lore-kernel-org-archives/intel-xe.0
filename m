Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0378C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 04:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCEE10E0F8;
	Wed, 10 Jan 2024 04:37:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E087D10E0F8
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 04:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704861472; x=1736397472;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PuuQ3sUyrTCzb+QeknpaPFZEoqLB8QQ1h5gdvwAhlDE=;
 b=GQ5kcIGl/965Vk2RlvdVcQUD02rSqRX9PtqG6/EmGNhUa6JDQ9ETGs2W
 YGPs+J8j0G+6IdJArPsniSUWz42smyy7aOFIm/vG7DyoDzrKwXY7wlC5Z
 yrQV5uakJ9u8IOWnjibRJLQeDmA7NylupbcIIeKCqodQEX7ufUrgzm3r7
 psCaOZvwef1jIFPkjHGRi769SjKbB1v4qrETX803ZcXZDY4KUizRmXtqG
 Y60APhhrSv4yt3K6mKvSqSxmeBLVKCeENZKlAzXDqj1GCltnS99HQ7FxB
 Ewa+BbhWBfPieIMBAUT2iGt7E4o0CP0oPDbaaViT/1rriaQrvBMuM9l5l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464807507"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="464807507"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 20:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="23819653"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 20:37:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 20:37:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 20:37:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 20:37:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 20:37:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJZLuaGdwbUsXXF2dhDLEW3+jDSFFBAG+V+k+ntDkry4jnzny0r8ZAhaSsDSGs/mIZ+0VSjffiV9K8loBneGy9zgZ7rwFhsWLtKuGOCBSdS6ZIZA9eW9NBu6/7ynJKZkxXWpbacchM/kiokE/SOHyk3mImMn5dGJdXlhZawJ9cs9U02bOS3+18ysK5o8sCW8IwXoO2NKOoZBadiYJxlh3ItehqGeaWcAPR5oED2qX4anc/X+jex188jq+4np53+YG2gZMNO7hwx7WHozRrRv7kq6WaSt3bCmuLMVV0g1T3JLB5orVMvYhW3ADXtqYqDrtjVZ4yqH4KTalGHIZ7vUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ/a0X1KWi5Qlr0txwx1DUpoLGEIQEEzz+8GwCw283M=;
 b=aOkBRp+PHsScAHh2QJfgfZ58xeD3iB1Ui1NAvRSyZZZPH2RG5OQ3pateB7KKpxN1oK42NTlf7Hsrd4hdMN2Hg3wTtSGhYsxRKKN3Ye2agPMfbPB1K41gkw7j8fD5zsrV3D5h0+fO0iQj8dIJkFXnalf1w8TTmCDLGnJYULr270PYiRkJOUH1m+SyVWXNf+EN4xxSlCP0T6B0XsLAT74+eS+LEha1BPWDBSPSbFF6Fp5WJfF5RfDATfUxF3c2SAN7ZDMUbozZRmiSCVup5w1+IW/n1qUE/DbKfyQnq2OnMznxAsUSMkkq5adRdjbT1fIe4+knr6MO8nQytp7xrqvKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 04:37:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 04:37:44 +0000
Message-ID: <a49a5d79-2171-4024-b75d-2a462f6e71d0@intel.com>
Date: Wed, 10 Jan 2024 10:07:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v9] drm/xe: Add vram frequency sysfs attributes
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240109110418.2065101-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240109110418.2065101-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 6226536b-b238-4e64-fc6d-08dc1195e325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3J+hF68Q0DsAcRQm+igByCzYPHY2oUo0uaRzGpuVm0CFcBLR10nTlS0O8vejZM2mhJWaJlXIxYn5qw/mYlFrVq6JC5mv7yOaVDPrARPWBMehbAniqcu39jxcykRMG08kkSnXPgHTiMC83wWOVkUe/qkU9KfzqW33fCZt9b2dk1YC1uLQJPEGpsk/9MI5DthYYF25Xpx8mbIeNPKG+sP51cVX9HJqqgccQ8+PuK1QCkw5NeLjZO+p93h18dCv9eQ7NWvFUGzHVWkSfxiM9BwRZTJPeoPkPsbHkp9jgsbG3g4C8wE6ON+hLO1fzQkIz2gdI6Vqp7gGuYeTtGPKyvpX9yqo7/3KxnjbcT3vbwZeFaUZfWxlPsOFeCmFh9KZpO9dWkRzvY00hsCPDMXUhIX7YLRjgyccj2Gz8GT4QLy2sp52PDJp1c4DqWA3KGl36cBRwLVVBR4MBrf6eOENbPw8l6yqhJQZ/jOCz+HeWPp67SRIsycyZ3GzcEZh+POu01F7OzprrWcZ9o60qFO99BsfuryPRSARA5kssy2GpbmjyAcmGx/ukZzFpncFxIL1a5fAJK4po8OsIiXn7gJhQGvkXRM45H5QZXhVR+RnHcaH7lltwaIQNuX+RxjYOOiIp6u2M1OkK9xxt0kqTohMfANaeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(26005)(6506007)(53546011)(6512007)(8936002)(8676002)(2616005)(44832011)(66556008)(316002)(478600001)(6486002)(31696002)(66476007)(6666004)(66946007)(82960400001)(31686004)(38100700002)(86362001)(5660300002)(2906002)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzlOa2JyVkFUR284SnE1WmRVSHF2anJ3b0JnaEhnczJSSHRPWGJWcVhoalBM?=
 =?utf-8?B?TWtzR2tUMFQ2YmhnNG9QaEl4TkxOWS8xNEFuN0tmQ3dHQklDZCtKVjIzZkxQ?=
 =?utf-8?B?L25uQ2ZuSEptdThDMU91UmNRY0dYRjlzamtGN3JzYzVXVGt4UHVUVWZOV2Jv?=
 =?utf-8?B?SjRaMHVXeXBkYWR1YnNjVFZKMmJxNkRRL01KVXllbzZpT0M5NC9sdzcxTEY4?=
 =?utf-8?B?ODBRNldyRkFlYmVBMjc5M2NaK1pZU3NuUTNEcFdaMW1uc3lPdSsrR3NsS01w?=
 =?utf-8?B?VDVyeXR3ZU5IOTJoWGNkdjI3dHFNUHNndE04cC8wRHowdlh1L2s4V2puRWR4?=
 =?utf-8?B?L3AzS21yNGhia2RqcEZNQ2tsUGI2ZlhqNFRlQ2M0aklua2dvU3AwY0xUQ3V2?=
 =?utf-8?B?NzdNcEJBZUt2UEI2YnpiQmFKV052VnRONUQxb1FlN0tMWlhDMGdldlVCRlps?=
 =?utf-8?B?ZUtHK0NnQS9WaVJYejFyMWt5bDNXZW15LzQ1cUZkbW5sMnM5SStMTllQcWF3?=
 =?utf-8?B?cXFiMWl1MFZYTXpOeURmTzlUN0V6aVloT3RFZUcxVFBLZFllYzFkRENpTWRB?=
 =?utf-8?B?RElUeWNDbmVaNzYwV1FsdGtER1ZCSEtCdklkOUEvRFVLZ2hCL2pGY2hZb25P?=
 =?utf-8?B?cW45UFNSQWV1NHVoV0E2Mmw2S1JNVW5qWkhYZkU0OTlrSmlvS0gyK3RRanlZ?=
 =?utf-8?B?V2hyMEgrOGNzR2M2MEVNaTNHWDIvZ2grQjlhU1JxUmF5bHd4bmd2VGwzUjU3?=
 =?utf-8?B?a0VyZVdSMDJxZm9wMnA1ZnltTllseTZGSG5DMGZUaXZob0tlR2JsWmhQdHRk?=
 =?utf-8?B?TXpxSkpCcWs4MTV3YkVMU25talY3SUt5ZzRISkFUUXZpTVI2YmhjUUJTOUhD?=
 =?utf-8?B?cTBiL1o5U0wyYi9mT2Z1ZlV4WjR6UDQ0TEIvT3pmVVR6WFhJL3dyNExlTHEx?=
 =?utf-8?B?clA3TWp2eFdWSVdKdFFzb2ZXTHVzdUtnejJNOUUreHVDMnRjYUlzdm9nUzVq?=
 =?utf-8?B?Qk01Yk0xQ296SXlyZzNPVEErcW5mZVZCU01oZ1BuenAzZXNDNVYvdk5iOVZV?=
 =?utf-8?B?alVjV0dlbWJmVGcwQi9LUllQTXJIZ1MyWVQ5MitRUno4L3RnMVZBbUVrNzNC?=
 =?utf-8?B?eUkwYlROK0ZmeWIvYituL0I2Wm0zYURyWDk4cHVweTVuWnl3ZXFkMG1mZlJh?=
 =?utf-8?B?TStidTdrbWdNL1draU1PU3NsTVZWaGFhOTlXc3NYTGUzWm9ZTlJrR0haQ2d2?=
 =?utf-8?B?UW1rR2JLLzFBVFU1ZVJHQlZKZW9hSmZPME9NNlBwblcrS0djVG9LTFNKcHFK?=
 =?utf-8?B?TlVjbjB2R3lyQlV0TVpJNytpemZtOFM2a0pXRlNVYU0vakpmZ2w2dWdNUStD?=
 =?utf-8?B?OU5QdUo5M0FvY0dyd0p6czRyWWJMRTRMSm5FS1Z0RWpNZ3ZxOUpEWUJPOEFO?=
 =?utf-8?B?YWlSWnBTdmdVOGdVQi91VHB1cjU2bkJGNmNUTk5GVFdyRzlhVzlvbUhDaDVF?=
 =?utf-8?B?bjF6ZU5ZTE94ZE5HaWNsYkpsNERYMXQ5Tk91eDNpRzk4cStEZEJJR2dvaEw5?=
 =?utf-8?B?MGZzWVdSOUVNbkFLL3JTaWxqRVkrNHY4bnJEdkVZVWw4Z0c4M1B2RlJ3UnNO?=
 =?utf-8?B?TEJZOWJXMkxBU1Y2RmlwSTJONkYydjdsMmp0aWZpVS9sWVZLK1pKQmZLMWl6?=
 =?utf-8?B?QmNUbjZEZFc2Ykt6OEpjaFNua1ZzOXU2eHV3TWdXSmJZVzBTakQ1UVo5K01B?=
 =?utf-8?B?OHRoYmMvZFR2VWFCS2ZmbjlTN1ozRFY0MnduNnR2MG5McFZqU0VjVUhmTG40?=
 =?utf-8?B?THFmOWNvNkNpSGhpVTB5eVlUUGtweWN1K294KzZvb0dHYS9qblVYUTV3bHJS?=
 =?utf-8?B?NldkWlBPeWpZaDdaZ1RGR2lFSGZKRHh6Y25CcE9za2JsSlhyTW1rRklYVG9V?=
 =?utf-8?B?NHAzK2R2YnM2YjgvUUJvVnMrVkM3TjBZWVcvR3FxTGJyRStNNktpZlVuc29D?=
 =?utf-8?B?dDloMTNDTTF3UCtSMUlYR1hMZEZqK0RRZ1cxNjE0YkdkVjVzcEVCdHFsQW02?=
 =?utf-8?B?MkxyTThBY2pyaGlrUnNOOEs5VFlxa0NZV2pFb2xrcWdlRks1SmZiRTAwcjEw?=
 =?utf-8?Q?F1bhP08OSRZarWK/HdTO5LDLQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6226536b-b238-4e64-fc6d-08dc1195e325
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 04:37:44.2483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWkOZlBBKAnJ2S/35Sl7xt57gjNR4VEsl4rUDnhJIectjDl9OCNOLbANWHgRb92UFS9I4FeouIxUi/8JDvYIRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
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

Hi Suja

On 1/9/2024 4:34 PM, Sujaritha Sundaresan wrote:
> Add vram frequency sysfs attributes under the below hierarchy;
> 
> /device/tile#/memory/freq0
> 			|-max_freq
> 			|-min_freq
> 
> v2: Drop "vram" from attribute names (Rodrigo)
> 
> v3: Add documentation for new sysfs (Riana)
>      Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
> 
> v4: Create sysfs under tile#/freq0 after removal of
>      physical_memsize attrbute
> 
> v5: Revert back to creating sysfs under tile#/memory/freq0
>      Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
> 
> v6: Rename attributes to max/min_freq (Anshuman)
>      Fix review comments (Rodrigo)
> 
> v7: Make documentation more verbose
>      Move sysfs to separate file (Anshuman)
> 
> v8: Fix platform specific conditions and add kernel doc (Anshuman)
>      Fix typos and remove redundant headers (Riana)
> 
> v9: Fix typo (Riana)
>      Change function name to include "sysfs" (Lucas)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile        |   1 +
>   drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
>   drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
>   drivers/gpu/drm/xe/xe_vram_freq.c  | 129 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vram_freq.h  |  13 +++
>   5 files changed, 153 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c
>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6952da8979ea..f3495d0e701c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -139,6 +139,7 @@ xe-y += xe_bb.o \
>   	xe_uc_debugfs.o \
>   	xe_uc_fw.o \
>   	xe_vm.o \
> +	xe_vram_freq.o \
>   	xe_wait_user_fence.o \
>   	xe_wa.o \
>   	xe_wopcm.o
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..f153ce96f69a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,13 @@
>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>   #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>   
> +#define   PCODE_FREQUENCY_CONFIG		0x6e
> +/* Frequency Config Sub Commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> +/* Domain IDs (param2) */
> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 0f8d3e7fce46..0662968d7bcb 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -9,6 +9,7 @@
>   
>   #include "xe_tile.h"
>   #include "xe_tile_sysfs.h"
> +#include "xe_vram_freq.h"
>   
>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>   {
> @@ -50,6 +51,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>   
>   	tile->sysfs = &kt->base;
>   
> +	xe_vram_freq_sysfs_init(tile);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>   	if (err)
>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> new file mode 100644
> index 000000000000..733146293307
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +#include <linux/sysfs.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +#include "xe_tile.h"
> +#include "xe_tile_sysfs.h"
> +#include "xe_vram_freq.h"
> +
> +/**
> + * DOC: Xe VRAM freq
> + *
> + * Provides sysfs entries for vram frequency in tile
> + *
> + * device/tile#/memory/freq0/max_freq - This is maximum frequency. This value is read-only as it
> + *					is the fixed fuse point P0. It is not the system
> + *					configuration.
> + * device/tile#/memory/freq0/min_freq - This is minimum frequency. This value is read-only as it
> + *					is the fixed fuse point PN. It is not the system
> + *					configuration.
> + */
> +
> +static struct xe_tile *dev_to_tile(struct device *dev)
> +{
> +	return kobj_to_tile(dev->kobj.parent);
> +}
> +
> +static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct xe_tile *tile = dev_to_tile(dev);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(max_freq);
> +
> +static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct xe_tile *tile = dev_to_tile(dev);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(min_freq);
> +
> +static struct attribute *freq_attrs[] = {
> +	&dev_attr_max_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs = {
> +	.name = "freq0",
> +	.attrs = freq_attrs,
> +};
> +
> +static void vram_freq_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_group(kobj, &freq_group_attrs);
> +	kobject_put(kobj);
> +}
> +
> +/*
> + * xe_vram_freq_init - Initialize vram frequency component
fix function name

Thanks
Riana
> + * @tile: Xe Tile object
> + *
> + * It needs to be initialized after the main tile component is ready
> + */
> +
> +void xe_vram_freq_sysfs_init(struct xe_tile *tile)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct kobject *kobj;
> +	int err;
> +
> +	if (xe->info.platform != XE_PVC)
> +		return;
> +
> +	kobj = kobject_create_and_add("memory", tile->sysfs);
> +	if (!kobj)
> +		drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
> +
> +	err = sysfs_create_group(kobj, &freq_group_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, vram_freq_sysfs_fini, kobj);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h b/drivers/gpu/drm/xe/xe_vram_freq.h
> new file mode 100644
> index 000000000000..cbe8c12fbd64
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_VRAM_FREQ_H_
> +#define _XE_VRAM_FREQ_H_
> +
> +struct xe_tile;
> +
> +void xe_vram_freq_sysfs_init(struct xe_tile *tile);
> +
> +#endif /* _XE_VRAM_FREQ_H_ */
