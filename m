Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38EFCD5BD1
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A002C10E124;
	Tue, 19 Sep 2023 14:46:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3508110E3E6
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695134767; x=1726670767;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f2yDeDDodNkb3u6aLEtnnymLS1R0q3Bz7gM3n54HQzM=;
 b=VQ730mvuzT/2jOy2KnvV0u2Zsmo4IMhLqgvwb/yPJ+VfbPrR4H3WgZXk
 jqZMQ3dkK6xGXc0EKa455yieJcEiEUTM/pOOOUTaYvc32KtssVOxH3xTV
 XIQ4swVTu2/tay16EDohMDbFksh53LRy7QuqqV+jQSXknwWdxGmBaj/w8
 Uv5t6DMGBjF4WQsvZzXNlT+zYolDgQz0v3y0F/KMVWXH2dfDqWYP2U/qD
 DhYMjYzYA9K45apj7ObvNmHAxrX7BW+apOdvFDDBQrPSMdo1YFVuASL1f
 diRBQ19GwLjpQ005zez50R12bleksebVjXV5bIySXVbzS7W33W1M/6STn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="379862285"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="379862285"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="919898523"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="919898523"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:45:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:45:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:45:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:45:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0XLcsh4/kS+nylmJi8J7Ldy77CRmNW8WDfG595NZ+mDXefp6BH3FiHvODLgdF41rX3kYY+5dIFgtO/Mqj+Iw4/CpJVLUDmifKNcNqVywFgsQCZ+gNutBB3h1G7YceL5F9JT1fpIEW3zntdkhILzk5g3CUUNIU9SKHWC66/RHuRA7dQtEEwtd8oEf1Cpng9p7lEA92QGdvYzh/qBolrPoeMLHyeXTClgI1ooONcHaj0yxVLgNxwNk6xfw3casMwdA7hiZa9OXgJHEy2ucDArsJcuV+Xf1mjEffJwC/jDZREPTLFRFlL7aX4nBR9BOJMwkunU2itm/RyiUHtVtIJhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTphY1KVaK+s6GpfanPFsOzfw9zznYcohwu2l+wXLOs=;
 b=IjfODFb98mbMyhHrTc/8p489zq2YoJBvxThAPKt5uIVJtrL/Ip8eCBRNokiPml98vo9dOBsl+c5LrbeSnmTS1srBcv1qC9KkUJpjqJat2Kks8rrTesjWKgkSFv4to9RtmyCJAn2IXcoMhkafeYGw9FElpS/lkBOkgw90oJxYY1lki5ISiqbeiCGI2xBEmEW8ayptb52WZHBxfSnMdylioUOKWFXSwd5Pm+5c0m0C9k8jUKAa3LsthrqeBANDIskB9BPbrP27bSAoNb0cFMbjn6zZIJ+i6D2zQdanTU8kDB1ZWddPfCobJixOogM4bMn7RpEQHdIh4IC7t1y2pljwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 14:45:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:45:22 +0000
Date: Tue, 19 Sep 2023 14:44:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQmzvwM/CgPYp088@DUT025-TGLU.fm.intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <20230919142504.91652-18-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919142504.91652-18-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 09bd495b-79a5-4f3a-cf51-08dbb91f0d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3X57Z7OSJEwW4ve3lU0EqBfyl6x5/LJlXXBUXgkK+f9kWtyWT28vHZx9/TtrR0i/jwuGzL7yZswmhh3ulwlZk8In+RncBpc8xBXxmVMoHg9ES2ZqV9CL/BsdpF/qemFwW0b1ZpWotd5G2S1caKXiHyiPoOjEb8yc+0yHdN1TU2jP1J4VM8nT61lEJM9V355T8yUd58NeZ4Ey5R6pSIy/d40mUgsCfwZGS8TP1c8t76j3HRlpPEiIqMy2rF2YZgjCRErTj2FRNaD64bIGMFQ0fDj7jH2Ty2vJI+/PdxWo+LjlfoydSC/hUJ6eLV4yJJc2wQrAJugrqZQBwqDwrnH29jRKoIjc5YKz0OhPjQvAZ7kVyMlrdLtN5GwF1s+TEXV8hQMU6A38m6XZO4brdfjW3s8jRzdWmF0GcQKMb0lIk8euaq+PjiYBZFCMOM8o43aIYLh/eBmozmQG/YjBlc3OmHCPTltGepwOgqIWXCWRTwnZU8rrchWM57X1OuRgUmmjGFaT3A+JYFYgqiqZQs99gHleYMpHJV4GSkNlGgULlnK+e1k2JbDfw7vJRb4Zav/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(1800799009)(186009)(451199024)(2906002)(44832011)(5660300002)(26005)(41300700001)(66476007)(6636002)(316002)(66556008)(66946007)(478600001)(4326008)(8936002)(8676002)(6862004)(6486002)(6506007)(6512007)(107886003)(6666004)(82960400001)(38100700002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XJ0/0KKkEGzlicBNdw61PpEiNGFVrCsXfSWFcOVH+n7wCCOMUj8SlLxyAdyv?=
 =?us-ascii?Q?PK1RSVsCbjlwifeUjisoj4bLPcmwryc+Xu7ZEj980gFRy9O3QWGbXRs47s/U?=
 =?us-ascii?Q?VI08eBNXtZBfSPvF18gGG1jIwHZqoF9sa1kun9nl9goRngWFr5LPgOMyjNKT?=
 =?us-ascii?Q?ng7IhJKlzABoIClviAONLB5p0S+Th7Qb7vcf/3XFBxT8kkbYlYSMLsqrTemA?=
 =?us-ascii?Q?o4tpxBAEz+RV2plxHfF0e9aRBOsz0HGc5+pq8HpU4th1wWh01F8NGl8enMlm?=
 =?us-ascii?Q?wfFPoHSHLJm3ED3Z+tDDQ+XgppoEgoe4KQtLMYMDhBw0EAqmenCGFpatMZZj?=
 =?us-ascii?Q?Muf29ObC9jMQboQMC13uvAd9DLhsho/I/NalZ9VT94GC1436a6iPij7OkJyQ?=
 =?us-ascii?Q?xcxmDxtfjzA3XUWwupkfEtAA3vPQY4mD3XB2vYMWfGn379Ayx6Qtuk1JkdRw?=
 =?us-ascii?Q?xoWfI70hRsq4LfiNERyaUpkaPLti5QdDIT6m9mBUDn8ja65znT0t4oOktGH2?=
 =?us-ascii?Q?FTB253+Y3lXLVUdinM0PDGn1YOdwGx6/twL5Eu5iCt4IVzSBc5Hlgnb1PQvg?=
 =?us-ascii?Q?xZC5UiYr/fG754x8JXfDa8JKFMd7DVNnpUYsRvR9KFL8Rz0LqkDD9x2c9VL8?=
 =?us-ascii?Q?gzpDQ8PISmhyjh1/VZj25ghhxAIb1N/ZCf31pJgB8tQsdL2lcq8qFTDKnQGd?=
 =?us-ascii?Q?qCgeOi7yOlQjOr1jrIvf2QOZti8nE7zICl/RRWOt2IXsbN8N8Qgi4iGwvjCF?=
 =?us-ascii?Q?TGlxu2N5BBaCKz86EODjRAN1m2iMQQWSUuzecbNN9bHrJPEbDN37S258iVR5?=
 =?us-ascii?Q?sJ5EwxjvQaDHADayTOxszPKOk9Y5xzMnOFRtkHdrNbLAiG8L5VZskjM3spyb?=
 =?us-ascii?Q?RK3Dxroy+bj8vKTI3ehc69ZqfL5PhqeNkYr7WuvQb5kFhhoiv8Ngqmt79Yqh?=
 =?us-ascii?Q?bikmstullzZ+fATUHqJkU2G5dNFovuZcSL3/grSFwLGo3TsyPiVPkugp40zR?=
 =?us-ascii?Q?NUYrUerwo8Up4LLnleUedgRrdW6RHAdAqSUDvJUTw/YXn154oO8vVv86m1+c?=
 =?us-ascii?Q?1UZTQGqexdz0UEa09oxrjPJcfrs7usgDwsxL4KarIUR02vCJFgH7L6w1uhx1?=
 =?us-ascii?Q?+qnS/AFtozsJZQTup43dWxytkvTs+Tna/04CwD4JwISt/pLvFRbPQO19RYu7?=
 =?us-ascii?Q?N9g+sWjg4g+xiBy84870ulfJMTweGGcpSsdLARdwJMsDPSYBimKW/k7KYgwZ?=
 =?us-ascii?Q?eHuFPUHqUmVM6AT/WYSMLlUAdsVHGwpfc35JJbQkh1JA66Ntus6Wy6EwJVBt?=
 =?us-ascii?Q?6cwXkkE57YcHCfVEpFZ4jCZMEgkg5OT8rZgNY8uPmtFRl71MWZmssZFzakdg?=
 =?us-ascii?Q?a0QCV1+JxqTOiRmtPC3NyRTkEBYAjv1o5349GLgPllChbS/BTLJOdtiL+ZRQ?=
 =?us-ascii?Q?Ld6iRuU4m6I/ZI1yUR6FPJasZyWc3UfL+8oa72MAOsuHkEXTo0+uZhg2xAqX?=
 =?us-ascii?Q?zbJs8BfqJMFD/gBsQ0+fArro7oc/HkLfP3R+bkYULJLndWfaCjfd3pimZ3/5?=
 =?us-ascii?Q?RhwcmgCem2QRrHhAMr6S//quGjRHB5qt9J+c8EPc7S/IxrWoHj0rWsHk0VUx?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bd495b-79a5-4f3a-cf51-08dbb91f0d0f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:45:22.1450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eg+nBiz1oWk7gFH3eMjNF+a8ov9FOXzAAfaA8+ZROqKuhzswgLy88ZNYr4oI6+IVf0DViTxsIcN1EEtz3f7ZTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 17/17] drm/xe/uapi: Fix naming of
 XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com, carl.zhang@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:25:04AM -0400, Rodrigo Vivi wrote:
> From: Francois Dugast <francois.dugast@intel.com>
> 
> This is used for the priority of an exec queue (not an engine) and
> should be named accordingly.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 +-
>  include/uapi/drm/xe_drm.h     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index f7a374c28fa5..a27b10583f5a 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -338,7 +338,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
>  	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
>  		hweight_long(xe->info.mem_region_mask);
> -	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
> +	config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
>  		xe_exec_queue_device_get_max_priority(xe);
>  
>  	if (copy_to_user(query_ptr, config, size)) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 43155d2c01d9..83d9bf644e16 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -330,8 +330,8 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> -#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> -#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> +#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
> +#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
>  };
> -- 
> 2.41.0
> 
