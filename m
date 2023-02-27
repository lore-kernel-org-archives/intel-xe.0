Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5329BC64ED8
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 14:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E3510E038;
	Mon, 27 Feb 2023 14:34:56 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E56110E038
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677508494; x=1709044494;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=jV0lwl2fObF0SckeoxroEjuWV4VteKk0qVqW4mhLZ7c=;
 b=gdW+RDNd+o8BJ874MMVt+7tg6wCjL0Hriy/aLB6AxrpMRcr7XYN3GV/9
 BuCoNV5d6XP0VIINrcDWAicvXQU9lW2Pao8pd8snWmUMpoMUxDaL9qxxN
 7WjgMhnH+Lh/rZeH9sgh0n4ctD7eOVvrjrYoR8Ezr00ees6hc5wd0jmcO
 71RXrWnUuuVD084DdiMXoW8Yhpo9zXwGO5efiBTyE3htGVo5d/GT+FexG
 XHA1esdNaNPFGF/vdcoD52E3ZHndbUvult/XX3GD6Ho5GtlMRWL9ji42F
 bafshAmnuX6EzyPM2RSsyFCjcJrbxvDJhP76rCmUB0mxgSET4UVgsfO/O A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335350639"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="335350639"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 06:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="742590545"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="742590545"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 27 Feb 2023 06:34:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 06:34:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 06:34:24 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 06:34:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn3ANE/SoerJrMvSXjLzT7tS/Bq+uv5qlGILdroIb9pqu9cWvliF8PY+gpXYc35iYEXtl8uX93ERDSSoD1uXqBPrdTgiHQokf+SMmMv4ogl0hGGg/M2sRdsdpzJCOwm0YvLLR5zLDFGVtoiA24JqqozCM5UzmgJrEKIWZ5GSpzOC2UCc98I2XrLTXTZu07A47cfEp1ahefZ27bZgtWx3KCYRKYUyVansmJ/Ou88lm1iAoNnuLfY1ud1I4wi645ZhfHiA29CisDNCZxuxTQ8cy+dgbyK1iPJJf7LuB/1mWIAutIj5LZt/8rIPtgj/JPR/nOIWBD1ha4Xiod4vBCkoGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N45Cj84e/sIDRETRe/Bu/QZYhVaOEGvc08y2E2xp1QU=;
 b=EwgdwIlzft/jZ2jx/fvyHNS2XGvFwLlzS0ztaGr42saxRLUyqxRZTEAcJNpv0lEIDmdLtvny1kzhHJj44HDjTYHmy943N1u24MjSTzPO0/mW9S2E1iQytDHZnobcnMXCyhjVxnzbW40UrxX1+t5nJKKTdBAEySjYeGpzGidFV6eOyz1IwsvKP8ySzDs4jYqpjO1DIxExF0S+IKLxKNJVK1BCIa6I5htgpgwduc9qorUEmzYm+HvXIP8Co1rBnd8FwLfIkRHrqAZqR9SXOc+297OUjzAj7viWU/0L+fVq5fkN1YC0NSAYRr09l9lMyvihOTusGvRuZezohEFFPmq1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:34:21 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6134.021; Mon, 27 Feb 2023
 14:34:21 +0000
Date: Mon, 27 Feb 2023 20:04:11 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <Y/y/Y8QJ1vo5zYXL@bvivekan-mobl>
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230216231724.2246534-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SJ0PR11MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: b5cf4d3c-08a3-417f-93a8-08db18cfb74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hHdHam7PBLrhKOw13l6XQPSL12wCRKj+foKzPcxl/bhTo1LSZBaxOddNq8G3pKxAlrYN2SJrDsWVto4z6bBvuhJt8RyNs7YdgzLcZuBwett0rNCzpv8CzCg5ZNOtCnfS9ZwqvmFX7NPhe2ZnUdOe6LpglVAA9BNjcoQCbaAB1V6qxd0+/3Gy5XLLPMJCButKr/kqURTibucuNvbeiSLwc6PWDf5mhDQCHTNiuO/N7DcNGZCbfirilzAjSmVxjOeM6mc7HwH+kbOn7v92LDGZea5TzttScVjOj+TAuaZiZMb4t/mSYJInkXkqKmGMsc5kX89N2Pg5d2WJ1cIhCz0AzpdKd2g0xmlP2AfhMJBp00KfoceEXkiuINC2jl/oI84FD64FKi27lEIa7dmk2eavpllElL6rKp9wVX7FI7NM+rAF09DXPbhlGu917BmYM/KFqP2cZKxHDatQKcEaAn+sv6oleudTD9hNPJk8V2nNTkduxIgnZEGS00bNHydPEUYIvFnxh7oWRny9b/YBnwqgeQ6Yv0mFe+Z35Fx7Pua6f/myZefirfkEmIZT4+oNmu8bbhgJ2kOfLL4jmLBAAS5P5lRnwRQqA5xNQPpJ0ZDoEw0pLFDALhmm1Tpv8Xd0BBsbgl+ifLP2P2vGzKME3XENug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199018)(316002)(38100700002)(2906002)(33716001)(86362001)(82960400001)(41300700001)(8676002)(8936002)(5660300002)(44832011)(66476007)(66946007)(66556008)(83380400001)(478600001)(53546011)(6486002)(186003)(26005)(6506007)(6512007)(6666004)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJzUUtJN2NhZnF4Q2JLNWhoUFEybCtxZ0l3ZG5IQ1pnVDVqdmFENnYrSW5y?=
 =?utf-8?B?anVlSlBseTNYTzBsMnR2aVhKa3dvOHNUWjhkN0Rnb0h2QlY5b1YzaTdBalNn?=
 =?utf-8?B?ZEJNaTVuTm5mSlUzUWplVlZxSnVDN3lBR1J2OFBZZmh1K1JMNDUyckpOUGRD?=
 =?utf-8?B?ZUxsQ3hHWGc5MlAzdnYyOVNhM1NBK0NUTVNxRnE1OGFTY04vbVNYTFh3V3Uv?=
 =?utf-8?B?c2tOTjBDNjNMRXVZMUtYT2JHQUtVMFVpQm8yL3V3RTl4SENUTjJuQ3kwcEd2?=
 =?utf-8?B?Z1RiRE5IaDZQNTZoaVVHb3dUaUxLQlRtaXdZRUg5OEhTT0YwQVErSjhOYjRK?=
 =?utf-8?B?Vnc0Z2srMzNOcE0zcUhKSFQrZGlzQ3VhL1Z6MnJiVVljNWtDRjNSc2JHZXNu?=
 =?utf-8?B?ZUVPbk43ZC92N1d2V0RWYUtGWnBlTnFQYUdUZXZ5NkJUWXUwSU5GNUFaQllz?=
 =?utf-8?B?cW1Wb25nSCt3ckVkZWFKUlVNeHdwdEovVGd2QnZWSVM0ejA2MzdyNVVORzNy?=
 =?utf-8?B?dWNNYnU5VnRHZjJ1b1lVYVFCZ09Sc0lxYjVnMnFSVGxmajRpdVFYY01naks2?=
 =?utf-8?B?T205dGZISk1NeEVPSW1uc3dYcVRacFYzZGw4U2s1Y1BoNHlGZWNhUWlXVDlL?=
 =?utf-8?B?T3NxZytLelV3dUpxNTJnemlPY0R4VmI1UDI1NTRkTlZEWnRNQnBRR0FQN1NH?=
 =?utf-8?B?dmNhNGFqOEpsQjZjTWNGZnZJZnR5UXdWemhEUGczUGZFSE9ML3RCZlJGYnh6?=
 =?utf-8?B?VHZnSGxPTm03TFFlemtrOU1yejBTeHI0RXRJekpPYTd2a1ZLRVZ2bVhKRTZT?=
 =?utf-8?B?L3ROYklhZzVmMWJ1aW5MME8vYTcxTURacyt2MDd2R0prOHVleWdMSjhTSGN3?=
 =?utf-8?B?enoyb1NaTThGQk9qQTB3K213RkR6d2c2RElnaStXbnRGOFd2SWJTUExxVC9D?=
 =?utf-8?B?NUI5bGE0R1NPT1Z5Rm1QWG5vc25QYXd0bG9ocUZqU0ZSQXhENlVqaGcvL2ly?=
 =?utf-8?B?SkkvNGpobXBRUXNmMkRyQnR0M2EwL0dDTTdBWU9TQjlTVXpOcDlUUEpKNUhG?=
 =?utf-8?B?Yi9MdE9FSUcrSDB5dHY2a1pEVXBLSDVqUGlGQXFsd0grL3ZvaXFFWVRaRFhl?=
 =?utf-8?B?eGpEbGg1NzF4WXA4dUpqdXJuOHNuUUh6Q2QvNTFXUURoU3RuUitOWS9sMFdR?=
 =?utf-8?B?VStLZDlNekFYQmQ5Q1UvVWh0SEJINnNxaUVHbW1aeFhSclhOUHVtNTV5dldI?=
 =?utf-8?B?dzFvcTNYMnNmVUxyWDhNSXQzOEE1SXFDa2VSY3BBNWp5WDFXNjRCM1RJWEZa?=
 =?utf-8?B?NWg1cmVIN1NNZDFQb0RDNFVCbjBwbm9WZDBGQnJBcnBWcTBTRElwa0x0ZjRN?=
 =?utf-8?B?cDU0SGZONWJLSXFxZ1hkY2ZJd3VQSUg2Z0dqd2xnWGRxZXRCcUFMVk9rTHY4?=
 =?utf-8?B?aU54NDBlZm1xaFUzNDVESFYyUldHUTFoalpUaDJ6eDJZSGY4eVkySU5LWFB4?=
 =?utf-8?B?TmFhOVVkdU56Wi9Ka3pkUC90aGIvS1hGNHhJeGlnS1RwWUllbmt3SmdDTml1?=
 =?utf-8?B?cmdsRTFWdTdKSnhmcmRmZDlZM2Y2cTY1aXhZb2s0RFpyaXdDUjFjd3JQYWgw?=
 =?utf-8?B?MlVYSEFtYkEzWlFYbmZRUUlSbHhYV3R0d3FSbTVROWx4bWl5TTFHYlVxbnVY?=
 =?utf-8?B?dnlraFcwdjd4RnBxbk1CeWcrd2JKbkJjT0tUcjVtWXBEWXFmVzN0UXN1Q0Z6?=
 =?utf-8?B?Y0t3Qmp4YnFRWHVCS3NqSzZwNGJ1dWJuZUdEYlNpaUxJaHBaekU2T202eGpq?=
 =?utf-8?B?Z2ZlZDZkSDNiSTNKelIyWFlvR2RaNnVLelFlSEs0VGM0WkRJdEIxODZva1Zk?=
 =?utf-8?B?VFNDRTZwMEdCV01BNnA0UjlyT3hwRG9hcW9IZW5pekpDVVFlYzhxRGQ0S294?=
 =?utf-8?B?bWFFUk1rT1h5SEtKczdPZzdQOXVrZVd2REN6UFh5emJVb0VDN2ZmditEZVZD?=
 =?utf-8?B?ZXN6ZnNvSU1hZkZjTUJJdjcrTmRjbExucGVuSHV2Mk92azB2VDUydGQ3eWhy?=
 =?utf-8?B?ODh0Q2ZjMWxzQXlwbFNydnZvN0tDWFRQbEhxY09zcWpjalFHWmpHWlRCenlp?=
 =?utf-8?B?Mkdvak1MSFlzemp5STlMV0grdk9neEVXVWNrMzNYMGEranV5Y2x0OXNpL1dQ?=
 =?utf-8?Q?53/MCIjWiWw1zdfsV17m1rz8DoCcxGqLsSUKQhvxubzw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cf4d3c-08a3-417f-93a8-08db18cfb74d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:34:21.8168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hm9SVbv9EkFaxIrPHrWABMPfXPZStS7ZLIui4YaDmSfd1Ig0UQxIMYQaWm37QZvXf36HUi5SYQis7RCWWtv6fewYyCZWSH4jJjPvTIN9o4GLqCTV0EDsA5DAd7txjr6N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe/mocs: Drop xe_mocs_info_index
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

On 16.02.2023 15:17, Matt Roper wrote:
> The values in the xe_mocs_info_index enum only match old pre-gen12
> hardware not supported by the Xe driver.
> 
> The only usage of this enum was to set a default value for
> info->unused_entries_index, but this is unnecessary since every platform
> in the subsequent switch statement sets a proper platform-specific value
> (and the XE_MOCS_PTE default doesn't even make sense since the hardware
> dropped the "use PAT settings" capability in gen12).
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 30 ++----------------------------
>  1 file changed, 2 insertions(+), 28 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index ec89ff3ac29b..583e198af88d 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -23,30 +23,6 @@ static inline void mocs_dbg(const struct drm_device *dev,
>  { /* noop */ }
>  #endif
>  
> -/*
> - * MOCS indexes used for GPU surfaces, defining the cacheability of the
> - * surface data and the coherency for this data wrt. CPU vs. GPU accesses.
> - */
> -enum xe_mocs_info_index {
> -	/*
> -	 * Not cached anywhere, coherency between CPU and GPU accesses is
> -	 * guaranteed.
> -	 */
> -	XE_MOCS_UNCACHED,
> -	/*
> -	 * Cacheability and coherency controlled by the kernel automatically
> -	 * based on the xxxx  IOCTL setting and the current
> -	 * usage of the surface (used for display scanout or not).
> -	 */
> -	XE_MOCS_PTE,
> -	/*
> -	 * Cached in all GPU caches available on the platform.
> -	 * Coherency between CPU and GPU accesses to the surface is not
> -	 * guaranteed without extra synchronization.
> -	 */
> -	XE_MOCS_CACHED,
> -};
> -
>  enum {
>  	HAS_GLOBAL_MOCS = BIT(0),
>  	HAS_RENDER_L3CC = BIT(1),
> @@ -341,7 +317,6 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  
>  	memset(info, 0, sizeof(struct xe_mocs_info));
>  
> -	info->unused_entries_index = XE_MOCS_PTE;
>  	switch (xe->info.platform) {
>  	case XE_PVC:
>  		info->size = ARRAY_SIZE(pvc_mocs_desc);
> @@ -406,9 +381,8 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  }
>  
>  /*
> - * Get control_value from MOCS entry taking into account when it's not used
> - * then if unused_entries_index is non-zero then its value will be returned
> - * otherwise XE_MOCS_PTE's value is returned in this case.
> + * Get control_value from MOCS entry.  If the table entry is not defined, the
> + * settings from unused_entries_index will be returned.
>   */
>  static u32 get_entry_control(const struct xe_mocs_info *info,
>  			     unsigned int index)
> -- 
> 2.39.1
> 
