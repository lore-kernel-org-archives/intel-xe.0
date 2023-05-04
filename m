Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFD7C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 12:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7879410E12D;
	Thu,  4 May 2023 12:44:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AD310E12D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683204249; x=1714740249;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SemVQOLrcO7hX9QMgbdYVwYMCAdO4msais4M2ur9MoA=;
 b=Le+DjpQI4vewEfwTJmdXTN7SsPA50+/bZH0CdoctO5x0sOj6hIgChxTE
 WY9heUSvQFfsAPia87dluWOh2QgdrOFiGo8uOIdPwJwKc2EWWZVeDVY3p
 bLNjbI5yLhPkI26o2rW8yfWMQ2p7+TRtC6I++qp048O4DAPHhFv7tTFD0
 olMxNXcSspEsXDak2A7jEOqPZe8eZZZ/Wh7RsHu2Rv+eO+u1/SSF2ifA9
 tVB2jU1WU3nLVXdb+uORJ0hJo2BBGlqLrEyY1BLdP1goHZrdV4hOPOKdz
 Sspep9aQ0cIgwM/fPK3qcEmZmJ9yE1jo/R6xQk92hRsSQmYKxIDZHIeSp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="435228569"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="435228569"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729779857"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="729779857"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 04 May 2023 05:44:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:44:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:44:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 05:44:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 05:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQm1MG3BLlPflNolpI6bGU+9UT4pfi27eDygLD43x4SYlL/X+LOuxOAAPE8BFA+Ri3RoqSBFlWltU2Cj1kgjNo1Rdkbj7bt9T+hQwMJn7PnT7Hpp31JanMgo/tH9s6CuT/Md8LYjIfYGLHgp0LuZHgVmU3pXjG0B1eShGPjqTrMuHD7+pOnOXNtSC0rVKbCykFX6FFyB6D17C8OJUNAHrtTWLGzo30abL9AqGg//Zl2bdt5cXcYtZS/cNCUP34Oc8l/V7c5BzORf6AugYRNhrJPIuAg2CNT+SaqD61I0akJjv+7XsvtT5gSOX+ZB6dJOsuW5dKIB5KpARXrDQbMXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBNsfTOrjYt/0E9d96+bPVTjyzcRnzCSxYGNzaA3nxg=;
 b=fE715zC/0wQ9lZk+D19SQ3rgM1UyjxMgK0u9AM9LLfRhHyylRkQsXJPRQWYH5Xst1bfSPfe2Sgzlnp+WCNNxZJtJmM5yJnvf784K9tjtcH7nazWs3XUTIW59f+0GwYQCUnjhri8FSnEs5UZMglD3emcLmM+5+JGsRnlkkhyRr9k5imUDQ2Dz6z6whBGBfYN8ypLTcu4DRr72cQrmfBl7H9d44092gFyEag2bOQW0zGsGBO5M/Ro/aeqDo9OAN45mlPV4ctkBmkO5cUdhkfD1c7IviI+9NrkM0ZeZaz5OdsjBDZNlYP7Ai2TQu7ObAArDQlYfVBXPJ7pd9f/XyKROVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 12:44:02 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b%4]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:44:01 +0000
Message-ID: <7aa6147f-752b-27b1-9f4c-667a3d457b51@intel.com>
Date: Thu, 4 May 2023 18:13:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <20230504112020.300498-4-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230504112020.300498-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::11) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MW4PR11MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b61dc8-f63d-4424-ab0a-08db4c9d3c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fRUiriFzVviE5aSn1SX2SqsOLE9+S2qB0YW82OgFWTDyAK7xtmsys+HWiRLczGo54bssfwKglCGcXeIbZ1MADAYNF8mN5BQ7f+zIstd/P5XEsoibI+w+vxXOrBAoGExD00VYWKcx60up44u/TLI+dB9EeSW8Y3UQRvoBOp5f2UfpcA4eH79s5FY7ak6bB03BN2TPylEwwCjPcu6vttzrVXqFE1QNVpjb16nerro0hpuONN6E82piR+89Sl8jUc7gT25hv+GOgitQUYgGDjt6QPRN4+1Hd5hVmFpqiNzcYPWKpmanw1lK8y+sol4OjVo1uh3RjWIurFZar0K4WHsLbTajhrkJXayuycskVau0Lj/eo5bLn24X84M5tDH1XUTQWuCxKOoijzwn/EAXfKaMBgrZtPTDxnDhhTLr8p7+hKz3odA0f2KubzufxJYJmlCCJqHRFmWD5rFWf+2vGqt6Yy4SBhl34EQgKHw81is4XANXlV3xy/F+eNe2FIUNtY4t5TJqjCKrxpYjPMqw4XJ9CsKWZxP3HQmxmEAI6h0ngW/gUaQky3rsQNTI+CfedbuNUTh07e61uwigNZwHDXMBUPz39HFcfrp887D53Hiv4wBQuxDxb2xn65Frb5aCojUY2CimII4Khm3NrYwSXu1LBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199021)(5660300002)(8936002)(8676002)(6486002)(36756003)(31696002)(86362001)(316002)(6636002)(6666004)(41300700001)(66556008)(66946007)(82960400001)(66476007)(478600001)(83380400001)(110136005)(2616005)(38100700002)(2906002)(31686004)(6512007)(6506007)(26005)(186003)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dYSXlvcWkxMFBqM0RvWEVUK2Y3cDdIbXQwTnl5M25icU9lSk1JdnpXdS92?=
 =?utf-8?B?enNKSzdYcUR6b05vUFRSWmllc3E5S2l6M282eFNMMnd3NlBCQmxoZE5zU3Ft?=
 =?utf-8?B?bVRYNU50R1JFOENvRXBZL2hKQ0VuK1NQNkhoUWpaMU1LdE4vcFZoMU1NMytv?=
 =?utf-8?B?REtrbTRsd0g4bEh4UWl4RVlLczQ0Qk1kZHhEbTNzYStsOHVoNnkrb3k1OG9S?=
 =?utf-8?B?Vlp1WkJuK3dGd0V3V1RYYUUyTFlPTFNKOGlmWnlSRXVNQ05xNE1nbzl4eDBX?=
 =?utf-8?B?TUtDN0NzUTFsbmZHck56bU9OelpOakRWV0hraXhFbVJSbGZ0MWpqaURYTU42?=
 =?utf-8?B?cCtFMDhSS3ZIdW9nRkF4d282Sjd3UFZOMXcyZ1VISDlWa05xVGZadWNVdGVD?=
 =?utf-8?B?RmwzaUttdk9LdEsxMHlxWGk2QmxrTnBoeVd2alc4anVmUGFtZWhuTVFCSHZ2?=
 =?utf-8?B?dUtSRXNYNFAvM1Via0dTWXUwQ1FhQ0xWdXBKbUdRQVVEcHh2YllIMFNCS0x1?=
 =?utf-8?B?TTRXUnJkL0VZdk9XMjNoK1lsTlJGcEtDWHdhK0J4NXZLYkIzejRBSkk1UHJM?=
 =?utf-8?B?LytnaUdrODBZaUV2OVlTWXdvQ3Y3SjIzTlE0R28zb3BKbmZ2Zy9ZQUp6aFJz?=
 =?utf-8?B?TEZJdGhvMU4xQithbG5GMEo2b25wei9VbDRHMlAwYzZ0SHZWSVpRQ3lVbjJ1?=
 =?utf-8?B?NldtZ0NSZ3FRZ04wYXA5dFN2TS9DMFhxQUxTczJ5aEgrd1VoU3VzeitzVWR3?=
 =?utf-8?B?VUNpWmVFT0R4VW00WVQ2RE5CclZHREluZWo0LzVuOWNoNnJaeFA1VnJ6UEFy?=
 =?utf-8?B?dUVhODVCTFE0enpGRVd0YmFKbkFVazdpWTVsWU5TTFRVZHY2Yk56RHNxSG9l?=
 =?utf-8?B?dHp6ZEdQeVJicDlMT0xsZ01jS0ZKbmdVRDFlbDJsdVFILzN1VC9oQTgwSCt6?=
 =?utf-8?B?b09mTXBqVVJGdXdrVHBSU3A0UnRJS1ZpVVBoVUxjVHQ3NmNLeGlwV2FxUDFC?=
 =?utf-8?B?Zy9DcWxPMGtsSnR3RzAxMnNreDVhVU43SVpCdEVhaFQ1N3F5Mk5yMUpWaElq?=
 =?utf-8?B?VmhuYklxTklRc3AwSmg5ZWRZZmhtUXhBYWtPOWVqNFVmZmREVWVEaDdvY1Zq?=
 =?utf-8?B?T0dnMnpwSFg5L0JpNUNnbHdHRDJsQ2pwYkVldzFUb2IwcHdseVFNK3l5RzA1?=
 =?utf-8?B?OTNvaHFXOEdDTTdtSWhzMVFJQjhzV0pFaW5RM0QyS0sreVJVZ1BzVGVOZUx4?=
 =?utf-8?B?OXZHbGZQaTF0R1VBdE5IQmhxaDR3bDZ0ZStVQUpSRWZVSUVVNTZHd1FzQkpU?=
 =?utf-8?B?dnJia25sa1B0VjdJZTZnNWwwcUV5clJ2SUUwVFl4dFB2Y2h1ZVNIQXFta09o?=
 =?utf-8?B?VUYvcHpzM1FEVUFQbHhGRXlTazYwTGN3cnRpSGozRkp4Y3M4Z0dhUWlTWm5H?=
 =?utf-8?B?OHVoUkZ2K0lIaFcrQWdoaTRMemp2MUN4MmQ3b1hvRWZOblN4cmF3cmdLSEFX?=
 =?utf-8?B?MUtJQXNsUmhFTGVFM0NVbi9Od0hsNkEraU5ybGlKODEzMjJXdU45N1JqUFM2?=
 =?utf-8?B?WUZ0UU4zYlJwb1ByQndDSWdwRTRycS9SdXEvbzBGREFYbjlFUCtYbjFFN3I5?=
 =?utf-8?B?ZXlSK2VoOGRlL2IxZ0FnQW1HMUpxd2tmZ0QwN0s4cFVjb3FvUHJFbkt2bEZv?=
 =?utf-8?B?RlRDMDR4N2poZkNJYUlVZUczVDhDSjJZQ2NzRW1uRTMyUlBDamp6bzYzWHp6?=
 =?utf-8?B?aXd6MnhHb2owbEJHVVUwc1pmQTNQZmgwNC9YWGVjVHlDSFJvZWpoYkdhTWJT?=
 =?utf-8?B?Mi9aTi9HTi9RSHpmQjkxVjk2bmtiWHFRQ0swblNuWHM5Q3hlZUNXNHJldk01?=
 =?utf-8?B?a0orUWZGR2FhdUlpUTR4WEh4amNpMjJTMTBXcHRDYXNyUGZ3TjR6eTVMOGlv?=
 =?utf-8?B?cTcvUVJvMmpyNmlXTWp4eXBXd3ZDeDZCQ1VGYysrTjdvVkRna1pJWldXSTZu?=
 =?utf-8?B?cHlSTlR1YktVN2g2L2tmSWhnT0ROaTM5MUYzSFo3RzF1YWdIV3FKdGx0b3g5?=
 =?utf-8?B?d2lpNnRybndRTTF0NnYvVmp2Wk11c081RHpWNGtibkpsTWdzYnZ3ekxSR29m?=
 =?utf-8?B?ZTRoR2FmRHFhQlBKRzlXWDVwb1VJeFNnOGF0U1k3M1BHazYvVXl6bldLSDV6?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b61dc8-f63d-4424-ab0a-08db4c9d3c9a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 12:44:01.7170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyuiPssz+T+F3RKyUxWCfQMEaNDTiaiRl4hHu1rbEOfvbPpx6UWDtsmKdoKZwysdsMZdbkFTu5su9NzNYdrH38M4pgbIMtzKFNfnxnoIqZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per gt
 memory size
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



On 04-05-2023 16:50, Tejas Upadhyay wrote:
> Add sysfs entry to read per gt physical memory
> in total including stolen memory.
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_gt_sysfs.c     | 74 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sysfs.h     |  1 -
>  drivers/gpu/drm/xe/xe_gt_types.h     |  7 +++
>  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
>  5 files changed, 82 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8898aea4bc2b..f6b68a3c6eeb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -254,6 +254,8 @@ struct xe_device {
>  	/** @gt: graphics tile */
>  	struct xe_gt gt[XE_MAX_GT];
>  
> +	struct kobject *sysfs_gt;
> +
>  	/**
>  	 * @mem_access: keep track of memory access in the device, possibly
>  	 * triggering additional actions when they occur.
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c01cc689058c..b133dd7b9d31 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -29,12 +29,76 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
>  	kobject_put(gt->sysfs);
>  }
>  
> +typedef ssize_t (*show)(struct device *dev, struct device_attribute *attr, char *buf);
> +
> +struct xe_ext_attr {
> +	struct device_attribute attr;
> +	show xe_show;
> +};
> +
> +static ssize_t
> +xe_sysfs_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	ssize_t value;
> +	struct xe_ext_attr *ea = container_of(attr, struct xe_ext_attr, attr);
> +
> +	/* FIXME: Wa_16015496043 Hold forcewake on GT0 & GT1 to disallow rc6 */
> +	value = ea->xe_show(dev, attr, buf);
> +
> +	return value;
> +}
> +
> +static ssize_t
> +addr_range_show(struct device *kdev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> +
> +	return sysfs_emit(buf, "%pa\n", &gt->mem.actual_physical_mem);
> +}
> +
> +#define XE_DEVICE_ATTR_RO(_name, _show) \
> +	struct xe_ext_attr dev_attr_##_name = \
> +	{ __ATTR(_name, 0444, xe_sysfs_show, NULL), _show}

i do not see the use of this.
> +
> +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> +
> +static const struct attribute *addr_range_attrs[] = {
> +	/* TODO: Report any other HBM Sparing sysfs per gt? */
> +	&dev_attr_addr_range.attr.attr,
> +	NULL
> +};
> +
> +void xe_gt_sysfs_register_mem(struct xe_gt *gt, struct kobject *parent)
> +{
> +	/* FIXME: Check has_mem_sparing here */
> +
> +	if (sysfs_create_files(parent, addr_range_attrs))
> +		drm_err(&gt_to_xe(gt)->drm,
> +			"Setting up sysfs to read total physical memory per tile failed\n");
> +}
> +
> +static struct kobject *xe_setup_gt_sysfs(struct kobject *parent)
> +{
> +	return kobject_create_and_add("gt", parent);
> +}
> +
>  int xe_gt_sysfs_init(struct xe_gt *gt)
>  {
> -	struct device *dev = gt_to_xe(gt)->drm.dev;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct device *kdev = xe->drm.primary->kdev;
>  	struct kobj_gt *kg;
>  	int err;
>  
> +	/* Create sysfs dir only for primary GT to avoid dup */
> +	if (!gt->info.id) {
> +		xe->sysfs_gt = xe_setup_gt_sysfs(&kdev->kobj);

i'm not sure if we ever wanted to create a top level GT folder

@rodrigo, any thoughts?

> +		if (!xe->sysfs_gt) {
> +			drm_err(&xe->drm,
> +				"failed to register GT sysfs directory\n");
> +			return 0;
> +		}
> +	}
> +
>  	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
>  	if (!kg)
>  		return -ENOMEM;
> @@ -42,7 +106,7 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>  	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
>  	kg->gt = gt;
>  
> -	err = kobject_add(&kg->base, &dev->kobj, "gt%d", gt->info.id);
> +	err = kobject_add(&kg->base, xe->sysfs_gt, "gt%d", gt->info.id);
>  	if (err) {
>  		kobject_put(&kg->base);
>  		return err;
> @@ -50,9 +114,15 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>  
>  	gt->sysfs = &kg->base;
>  
> +	gt->sysfs_defaults = kobject_create_and_add(".defaults", gt->sysfs);

what is the use of defaults??

Thanks,
Aravind.
> +	if (!gt->sysfs_defaults)
> +		drm_err(&xe->drm, "failed to create gt sysfs .defaults\n");
> +
>  	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_sysfs_fini, gt);
>  	if (err)
>  		return err;
>  
> +	xe_gt_sysfs_register_mem(gt, gt->sysfs);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> index ecbfcc5c7d42..a8078c5992bd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> @@ -15,5 +15,4 @@ kobj_to_gt(struct kobject *kobj)
>  {
>  	return container_of(kobj, struct kobj_gt, base)->gt;
>  }
> -
>  #endif /* _XE_GT_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 47f059bb8c6d..5615f2d65996 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -138,6 +138,11 @@ struct xe_gt {
>  	 * objects (virtual split)
>  	 */
>  	struct {
> +		/**
> +		 * @actual_physical_mem: Track actual LMEM size
> +		 * including stolen mem
> +		 */
> +		resource_size_t actual_physical_mem;
>  		/**
>  		 * @vram: VRAM info for GT, multiple GTs can point to same info
>  		 * (virtual split), can be subset of global device VRAM
> @@ -324,6 +329,8 @@ struct xe_gt {
>  
>  	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>  	struct kobject *sysfs;
> +	/* sysfs defaults per gt */
> +	struct kobject *sysfs_defaults;
>  
>  	/** @mocs: info */
>  	struct {
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 2c35a1b79be7..bc05b6c0cefb 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -296,6 +296,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		if (err)
>  			return err;
>  
> +		gt->mem.actual_physical_mem = tile_size;
>  		gt->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
>  		gt->mem.vram.io_size = min_t(u64, vram_size, io_size);
>  
