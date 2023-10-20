Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AF8CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E5C10E58C;
	Fri, 20 Oct 2023 07:27:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A3410E58C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697786873; x=1729322873;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4/KhEmLyWuEJtJD8GALyxSzy9EJmPtcFNYV5TkDzqUI=;
 b=ViW53Lfu1eSLjXa7MjEHhuei63+4RRJ8Qi/bzIZB/3CAn7THwkxeFM2Q
 dosFCSd1oeaMEVKX1ycTifRH9YC9yYW87lRL+QVQWK13jLQdDuKp8a2XT
 adNLp1E8oa3y0RG+43zep5ngWDymanmexv/5bZqc8G3UIjkbqR2XE2sVN
 9aX6JZcOLksSzj9/IHvpqXfL9hbJYJqIsB8oGGjWwIuXlJ926HHn0ba2N
 fhJ+XwXB6CsNfQYE8sEBBF2zD2mufPXOCEvOp/unSUUD/V3BIzJExyJ49
 Km3nE3W6pwEclF0VTvc3oWqw7G+C2jFLKoTXiP+w6fOeE5kUD9YJCHyQH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="383662052"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="383662052"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="707151758"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="707151758"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 00:27:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 00:27:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 00:27:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 00:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpQbbSNyllNsqobKdZZdNZNR0OgrzB+YpsCu39PMWM21SqItxNc+nn+uy02rX26x1xvnckrSB2S6KWCjIBpLiSRgQxkuk1g7PeD9Phg8HaDlM8sMZB646XNRrrAcwZHn1lWQVkWI3S7luW/EBlRw80Z/Wb96SLNu4m3DV6UDlKL9WFIX4Q/VWE3r8pJsTtilL8+jr/ZXtf/I0pqYz7P3tOonXSoCNsjDfji1SUfrgwT8Gjv/IPYG/Ul8yaShoYyKsIwi7uBI3kX0AuKhQDg3gRYFFw9d3+mE9KoAI7adiNhHCK4wgAwdSDxxfkjvJ5X+zuyJ1arvEyNNCpxb4jATsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLLOCtMiC47czm+1qKzfLAeBeM6l81AC6wK7MJBeqn0=;
 b=MnSZP4zEt1ag94SMIVoqikbxXjoFEv+EugyutRK912zKKKHcjBMRyWwdF0u978gYaY2PQ/gh8PzFFqbyq97W4D0u6Sie5n8CYzIZr4eOarLIYo0Ig20VmXa0UUAaweSdGX4yo+Xl7rOU77x9oCNp2GuNHqQLcAuaFDzi04S0ooJ7aRtdluNbc9YItxJu/kfia3Eabjo/XgcuBCzkpgcesW0ZHlxdchCnSysNCHyd+2Y8V5FSzp9VnGRk7UPTf+qWrranVdboRZyx+JVKp1hENAyHqix7hGuG5i3S0ayKe/+wBbw3g7yJcjQzAfD7gowEBOBDLu6PTfUk9RV0gWdwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Fri, 20 Oct 2023 07:27:45 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::1e05:8d6e:fa94:9f7c%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 07:27:44 +0000
Message-ID: <9d82cbe1-1dc3-4c44-9acb-58af4740c362@intel.com>
Date: Fri, 20 Oct 2023 10:28:01 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230919161049.2307855-19-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230919161049.2307855-19-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::17) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DM8PR11MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: ecec9b6f-1ca1-40f2-6b64-08dbd13e0d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6dH1rq5A3Er7Mj/9PjuDTivLfSxFwCknkctln5lS0fhcqGl/Xz5FW4bLogkpbVQ8oz8bYPlo7kV3q0mbPL3YeXZ1i9K+obD+ZGYgcYozwBNTj6GkHWWvz2+GYXfknV/it3qeXv1nnvJHLvpo6gSU7HfoO4mq7e28jdtLXZzZw7mrGYf4S1jZSUWj1Whu+4yAKa9xzyI+M54XvgZzH/vmkYdxAWFYHb4qTZ37Ifrof8CV5ELHW1hTsNtX4HGaEBQctn/FZG/4sDIhYDJD8AGMUcXE+uMuxQgEw5E7lK28ucwIYVyaoPmlN7h1rrKSlG9CoVD/VVTivRP1/eOrMph8GzAUTxjQLsxhHYCzXG8MbEi0c068yMqmy5oCDk816l1PjQi8qv3Y02smTyqjpTDRutfM2BHNAVP6MYP58k0eocp6r9J7GIJuBWj0YV+bUICzvG16wgtLlfai1VNQva1lFX5su04y2q3Nx1G0XNYG9GaNUhNneKegZDWisuQsweK/7vuX+u7vkhTSe8wII4WPxaa0xbbQT449m4+5EYVHofToRVdtuaEUXciS0viWmzQDjAguok359TIsJ++T4RdUb0C8Vqg/XpSkMXk6xDSaoisUjIMhzFznX/K5ctdPAs/Y7fEjSDdyyaqT0hcdnF/kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(36756003)(31686004)(86362001)(31696002)(6506007)(478600001)(5660300002)(6486002)(6666004)(2906002)(41300700001)(82960400001)(38100700002)(26005)(2616005)(53546011)(66476007)(8936002)(316002)(83380400001)(66556008)(66946007)(6512007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmYrWEMxaU0vR29NTHJBZVVRakViZXhYRmNUejhOOCtVUVN6clMvUW0zVTdX?=
 =?utf-8?B?d1VpVitpWUxrS2FIb0tVOVNEZ0F6ZUgzY1hLdStnRnJ0MFBOOVo3KzJ6OTF2?=
 =?utf-8?B?MFovb1d1djhkMVl6OENmcUlEc2NLK1ZPbFliTWNPY0JjQlVyLzRSWFJ6WWFn?=
 =?utf-8?B?SzRDaDBKOHpZb2o5Snp4QVFBVExvYVBPdkxGWWtmRWphUGpweVRhM0Z5RzZN?=
 =?utf-8?B?bmF2WS9oQkcyZEloV3llWGxUNFNoWnFNVUo0eUNnazh2aDZPUWRYTGxBV3Bn?=
 =?utf-8?B?TFk3YURLdUcxVE9uYmpNUUZRNzc5d3lyQWRBeFlWdnErODd3T0hzVXFLcXVr?=
 =?utf-8?B?MjNNU3I1c25ObkhjRGFlNGRoa291S0U4aUwzMGxyN0xZcWhHYlBHV29qTkw5?=
 =?utf-8?B?QS9FOXB6SkhHK2FaQkRqdGlnbFVuRjVHY2k2M2xKL1BKdDVHYmRWQ3BIcnRu?=
 =?utf-8?B?azZVL3RRQUcrRndwZ2NBcmZvZ0lRS2xIOWIvYnUvNEdzbk5TdUl3M1JEcHlu?=
 =?utf-8?B?V2J4M0grZFRLN2RCOWorWktBTGFtclNzZlZkSldiVlFuaDhXQTJHVUl3dTg4?=
 =?utf-8?B?amR4blVwbGJDdXBhU3NWOWdXayswS2JTd1M0MkNzd2dWMjc5eFNMaWIyY0pl?=
 =?utf-8?B?NlhwL3VSU0hBUUc1TVg5Mm1aMUVPMUJyK01oaVNtZ1dxeS9vT0VneW9LUDVK?=
 =?utf-8?B?NCtIR1lHVk5GL051RWxzUmw2UFNCWkUxQ2s5c1UvdVFUMWYyQmtOajdkZ2I2?=
 =?utf-8?B?S0lObkE1RENEM25CK0gzdEFKQStaSHRKY2RCSTFsSDR3RnZpdU92VlVsa1h0?=
 =?utf-8?B?ck5oQUsxUW1BZlN0U1N2T3puTnlIa2F4ellpR01FVHhzRXVGSUhVZTdTdys4?=
 =?utf-8?B?R3VmMVl0QkYyN1J4SFE0ekFKWUJQUmcvR0hoTks3NWJqZ1FlaWpOekI5UktF?=
 =?utf-8?B?RndOdXlwTmxGTXhoSkw3SXdVUWZBZXo3YWp4bER5Ym94YlBlQzAwbnZNTkl6?=
 =?utf-8?B?OU9GSE1SZmVZUFdjYVVnTTM5M0NpWDN0Z2czT3puWnM4emRjRnBibGErby83?=
 =?utf-8?B?b28vZzNXZkNJMFBOR0NwbkF2bHVTK3NkNjdpSnRXUHNPNUtkTjRsZnNCZVA3?=
 =?utf-8?B?WnpGcHp2UWxBTXBNbmR2WlZHbkhrdTFTMHk5cy8rbGVjSmR5U2lFVm9QU2hM?=
 =?utf-8?B?YS8xQUNPSm9ZOURvL01UN0tmc0VwU2RrQ0JaWDhXa2Rma1I3eC9GMEEvUTRO?=
 =?utf-8?B?TGJMWE5QTk5wL2tOa2lhQkhubWFVSTdtbmxGREFuOFI1ZUkvWENqbWdUelpE?=
 =?utf-8?B?ZS9lQ21tM0hXN2E3bEdSVVlDay9KalRveTJtaWZHU3VuMG5wOVRGWmNYTzdh?=
 =?utf-8?B?eFNibGtaVDRWdXlIT2tKYURrVlJybTRDWnZSMU1nMTNFM00yOTkwQ3h1N0w5?=
 =?utf-8?B?eE8ydVVJdTREam43cS94bnd4ZU5QaTdVckY2b3g1alNPYUx3VCtrQzk3Z3lD?=
 =?utf-8?B?aGx3N2NjWkNoaXozV0luZkFQWFlvT3FwZjRSNTVCRjVxdk9DWG5xSytEL3J0?=
 =?utf-8?B?SWlOcHBLVjdlSmtjK09Yemp0d0VBQjNrbFI4dUg0cmZ3alM2aFY5bGNQZE9r?=
 =?utf-8?B?VkxXNU1CYVhSYzBQdU5qVmJOR0NrUUpad2kxdmtyVHpmaWV3VzFkSnVCN2FB?=
 =?utf-8?B?VlVCQ00wQzI0MEpuUDlXb2p3SStjTzFOdVBaY0tlMTZJWEE4OEpPbnBIVEds?=
 =?utf-8?B?TjMwTDZkMVpBcTNXUndqbXNOaWRuTi9uaitKMy9IdGhNZnQvQklaUm43aEVW?=
 =?utf-8?B?dGgxVnVrYWxNejYrVzRRakFHYVVEWlVjK3pNWEczZG13Qzc2QkVpNVRTNVZr?=
 =?utf-8?B?bkxQUkdoWDlqNk9wS3RnWHJoYkRpZ3lCSTEydTdHeTNJMExNUjZaMStMdHVy?=
 =?utf-8?B?dndYTTgrc2NmeGZyVk95Z2N2b256L3JtREV3SG91Rm42WTlVR1dtcnVYZXhD?=
 =?utf-8?B?SFc2YlI1ekhuQ0djbzdWWFZ5ZjBMV3dhSDA3RjRaU3Vid3Izd3hRK29xNkJP?=
 =?utf-8?B?NXcyRU1qVXR4KzdCOU9zOHQ1Tk1TeGc0Wmdmd01odXlCZ2ordW5ZWVF2RXVz?=
 =?utf-8?B?YUM2MnBmSkhBalNCNXVHdnMzeGZqclBKQytUVWdUNk0vSnc1a1RSeEJvaE5O?=
 =?utf-8?Q?4QNF5j4mvLcspoTIBmG56NI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecec9b6f-1ca1-40f2-6b64-08dbd13e0d81
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 07:27:44.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GVOv0EuSwj9zBEYqcIZiHiDb+GNJsIHYNRIBdzMrMtBDkNs21zPRMi8n/N5aOQUMGa8Lsu/8fCcQ0T6qD2VsddWYE0ahcTnFVHraatpEyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5590
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [18/21] drm/xe/uapi: More OA uapi fixes/additions
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

On 19/09/2023 19:10, Ashutosh Dixit wrote:
> - Add drm_xe_query_oa_info to query information about OA units
> - Discontinue DRM_XE_OA_PROP_GLOBAL_SSEU since it is no longer needed
> - Add DRM_XE_OA_PROP_OA_BUFFER_SIZE to configure OA buffer size
> - Add output parameter 'config_syncobj' to signal userland when stream
>    configuration is complete.
> - Add extensions field to structs to make structs future extensible
>
> The implementation of these uapi features will follow later. At present the
> emphasis is to finalize the uapi header.
>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 72 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 66 insertions(+), 6 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 77949c5abcee1..3b106bed42ea6 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -395,6 +395,7 @@ struct drm_xe_device_query {
>   #define DRM_XE_DEVICE_QUERY_GTS		3
>   #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
>   #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
> +#define DRM_XE_DEVICE_QUERY_OA_INFO	6
>   	/** @query: The type of data to query */
>   	__u32 query;
>   
> @@ -1133,6 +1134,48 @@ enum drm_xe_oa_format_type {
>   	XE_OA_FMT_TYPE_PEC,
>   };
>   
> +/**
> + * struct drm_xe_query_oa_info - describe OA units
> + *
> + * If a query is made with a struct drm_xe_device_query where .query
> + * is equal to DRM_XE_DEVICE_QUERY_OA_INFO, then the reply uses struct
> + * drm_xe_query_oa_info in .data.
> + */
> +struct drm_xe_query_oa_info {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @oa_unit_count: number of OA units returned in oau[] */
> +	__u32 oa_unit_count;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[4];
> +
> +	/** @oau: OA units returned for this device */
> +	struct drm_xe_query_oa_unit {
> +		/** @oa_unit_id: OA unit ID */
> +		__u16 oa_unit_id;
> +
> +		/** @gt_id: GT ID for this OA unit */
> +		__u16 gt_id;
> +
> +		/** @pad: MBZ */
> +		__u32 pad;
> +
> +		/** @oa_timestamp_freq: OA timestamp freq */
> +		__u64 oa_timestamp_freq;
> +
> +		/** @reserved: MBZ */
> +		__u64 reserved[4];
> +
> +		/** @eci: engines attached to this OA unit */
> +		struct drm_xe_engine_class_instance eci[];
> +	} oau[];
> +};
> +
>   enum drm_xe_oa_property_id {
>   	/**
>   	 * Open the stream for a specific exec queue id (as used with
> @@ -1185,13 +1228,11 @@ enum drm_xe_oa_property_id {
>   	DRM_XE_OA_PROP_HOLD_PREEMPTION,
>   
>   	/**
> -	 * Specifying this pins all contexts to the specified SSEU power
> -	 * configuration for the duration of the recording.
> -	 *
> -	 * This parameter's value is a pointer to a struct
> -	 * drm_xe_gem_context_param_sseu (TBD).
> +	 * Specify a global OA buffer size to be allocated in bytes. The
> +	 * size specified must be supported by HW (powers of 2 ranging from
> +	 * 128 KB to 128Mb depending on the platform)
>   	 */
> -	DRM_XE_OA_PROP_GLOBAL_SSEU,
> +	DRM_XE_OA_PROP_OA_BUFFER_SIZE,
>   
>   	/**
>   	 * This optional parameter specifies the timer interval in nanoseconds
> @@ -1223,6 +1264,22 @@ enum drm_xe_oa_property_id {
>   };
>   
>   struct drm_xe_oa_open_param {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/**
> +	 * @config_syncobj: (Output) handle to configuration syncobj
> +	 *
> +	 * Handle to a syncobj which the kernel will signal after stream
> +	 * configuration or re-configuration is complete (after return from
> +	 * the ioctl). This handle can be provided as a dependency to the
> +	 * next XE exec ioctl.
> +	 */
> +	__u32 config_syncobj;


So you're adding this, but there is no implementation for it?


> +
> +	__u32 reserved;
> +
> +	/** @flags: Flags */
>   	__u32 flags;
>   #define XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
>   #define XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
> @@ -1283,6 +1340,9 @@ enum drm_xe_oa_record_type {
>   };
>   
>   struct drm_xe_oa_config {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
>   	/**
>   	 * @uuid:
>   	 *


