Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1E9C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 04:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44FC10E0A4;
	Wed, 29 Nov 2023 04:19:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A2E10E0A4
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 04:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701231575; x=1732767575;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u/I/R9fCyBrEqF25aAUoYD5xzn60o5gLY0RDRIq8nSY=;
 b=d8q5vXu4geD7C+zUwTZl8rxDJwvE6W5o3TfnMzzuPnvvJVv3Lmx34TNw
 gEgeA9+Uom4ymnU2cJJcWQOeoapzUdh2/88KX8m2dR7CtTYos7g6j6DbA
 NWQU0LROaDO8VqKSux7r258PwsJnpqoI346pTM3kdUn++7HDByK72YNqR
 0pJgwJvPUe+bJK31o4lncT7zNSwiqEL8/v6fqQ/LZaCUZJzu0iCvleS6H
 1TjdB02Y//zFykjgg42qKGPdnUXRP5Nt21ehRIySJZHntCKNWqU8OW+6a
 TQjTXggbIn/KNqxlgH3F/j6kpXH9+oGxeLbrirjZ32Qe9m1ICdEFJRkw5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="14656870"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="14656870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 20:19:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="10296103"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 20:19:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:19:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 20:19:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 20:19:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 20:19:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogRtqxAvOy2YikqGwdwN8Qizt3i6bxfd8cFuKAjWujdzXw0GzOT1payh8Q7eVYDUGzajRupYjEUk47jLZkRkrBxxizmkN7f/jn0s1JZ1URJudOiau+udmnIWenJAhvEMKmOwTIfEI+1T77EC6rAUtQkc4vbmaXOh2ZmaAjsikwuNiwdzg5oxRUzURqce8ilve9jsh/NRqgbBHRHRLbxuDdzsbdKfLl6Je+ZyHYXqTpUZXbrFUjUo4pd6UivjgD0KoTtY/GtWw/bndU8gf9GNld3aXc1N1cGZN0H09UBygvw2fzANAYeTYfMYDfA2xBVxuoHbF5uHgciKUPV9/9B5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Tbiiy+cx6KqdGZQlGW0co3fMEgHQtaPA7L9HEF1EYM=;
 b=IADhtaXfQ/grGtclawQYxR2hxlDUwirmbDo7hMoEHANI4PL406WyJWK7sd0mDiDsIZw9zbjZq5w/1t6p9ytRHLrxIbSKUelM9WSY6KnneTcNI7X8Sdoq4lCErci7y33gHSc7vM2JAE4NQZZYOTol0/b3cJNAau4IvgOPOR5czZ6Yf8Xj265jbYsZH1lQFyEmiBBLpCbV2vOxWeXbL2aLH42HD1WsiIR4gudzl/Y3usxHyzhYGjKwAuLa8xilVqhqEifaKPj3cXkZyB71TeLQfXNBUunNUauld+se0uepg6gYUzgFLzH25u9GY/j6WdcSjgUmNoq5Hv72eg32iIae2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 04:19:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 04:19:26 +0000
Date: Tue, 28 Nov 2023 21:17:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWZY/zQQzVeWV1PG@DUT025-TGLU.fm.intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231122143833.7-4-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 18522be7-e8b1-4fda-f204-08dbf0925f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCqq1w6Capi8fHz8gG28cF9rRAMTWVc9bGsnKL9ejZnXtz61yONi8tC3w9UH/aocGWvxAeGPXrDVkyNBkKrrDQbkeFD3QQvd1hzdMS+PY6oVZo/nMXK6U1AR6rlNwhAd+G9Z2SoevQ7LajX+ukmz5E89tOz4ZM9qm8ULDR3/BiQBpNMSWSYaxzyk5a9kBKK1a76FEN6mGnm+e9ueO1802CC/YuY/1YS5A2vmPvUlwvagwwPxNrymcmwCRTYEBVxoomLZyzmo7wOYv47XJsdWE2M8k20xw8A3/30C1uIo5Kzxng0Y7Zz3k4eDKM4qSl1uevkYyjhh1nbK1gfL+P2HnbnE49QMBeZOTc68qYgGxbad5KII2fY+gvsuNC+WrijoBby61c15T2acMsr2edp1gjfwuZwIJISDkdwJaht2Z1CMo1D1Zm5aiZtG576yX2zoae9C+4QiCC/3kX9i/X8NVPTZDzqYQcZPaYOitl+xXb0/tbtzQqTehAahHPEQnH54k15bG4clUFKDiVXmZN1HWt1h5TTHZ+DXbwCbpOBFTVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(26005)(6486002)(6666004)(6506007)(478600001)(966005)(6512007)(107886003)(38100700002)(86362001)(41300700001)(5660300002)(6636002)(2906002)(44832011)(316002)(66946007)(82960400001)(83380400001)(66556008)(8676002)(6862004)(8936002)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QJPyeVHBhcI56qsK6t4qad8yZ9mU70899CFDnq0Le+GrzWM56ar+L9uBCE?=
 =?iso-8859-1?Q?hvqQqC180Yfa1FesGPAFk39YekQvojkwDSQLBm8UxPqiJLRlFX2oYwpAOx?=
 =?iso-8859-1?Q?Rl4RGBfB6KhOrOEfnuIEiiFRBmi2l8VAIk2NdzFSeejnnUZhr/U0qjjwDR?=
 =?iso-8859-1?Q?YLv74s5Z4xN7sYONDdZtTMxjTM/pU+pimAgSDVP9/L/cnFtx+lxMhaN2RH?=
 =?iso-8859-1?Q?QNxQODoEhhBtiiHCCR43J0qrI/a84dl8CxlLTn3z7MFC3qWoHTrS3KKCD7?=
 =?iso-8859-1?Q?etuSQjKs9hQEnpbhAydD3Y+D4J34EWeKHptHavOlUp2E3pUM9UIzsZlaOK?=
 =?iso-8859-1?Q?DbMX8yFGJzP5lE9441IDM1kankgNOH3sz8taB1O8QMSuts2Q8G6HMhJJJq?=
 =?iso-8859-1?Q?7mzjQDfKwwBR4e/dM/KbkBWbi8yE3EL8HE9IDUAug2jt6x6c5GRo8rWQLr?=
 =?iso-8859-1?Q?J3k86sld9H+kGdqsyZh/Tz6+2UVJrUKb5Wb/hbwOKv7f1ffjsdO35GtQ5I?=
 =?iso-8859-1?Q?+RzPMinWAaUswXlyztD5EKQ+x6iNSfr4OAgTr0o4HsZHl4kAJ/fjFR5JEr?=
 =?iso-8859-1?Q?+/NGbamhhhk4QjO8KPUAXwRjerxC6eh9vgp6L+KiA+iV6Tw+N5GvGf9lfM?=
 =?iso-8859-1?Q?OHzHdZwS3Fp2ZIf2dLSQcqDuAHakPK+/j8tOFCLfC0v4m6l9SOAttqeitD?=
 =?iso-8859-1?Q?cQpm13gTwvZro1NzfU0sKe0aDBQiHIhOnIZVYlsdDzrjn7as4JYTHDwtSU?=
 =?iso-8859-1?Q?0fbydpD8dGOamKoo2F2M/vkiX2PMYbjQT4N7IpB6ZqzjF/uVgHRda77Fl6?=
 =?iso-8859-1?Q?Ip2rJDqC24j0TzThHxQkMU6ZeOT2dsllyFh9XSoEQZyaS8lTYo2nj7EJsH?=
 =?iso-8859-1?Q?ihcLP0xqwF0xiljYvugqcOxlJTqBIFI8UYFtM0KFWQ3XnCCmiyZTcXVq8l?=
 =?iso-8859-1?Q?YxrKiuseVt3bLZWIjfjf7oidzUwq7RLj/Q2nBNg2+3E/GLtC7BwU5augL/?=
 =?iso-8859-1?Q?Pj/QOZTIXgPS2WIKFpGheacASpnDF9XJNUyzkw1msqYMYsHAMe98JFRqlb?=
 =?iso-8859-1?Q?smdfqtbDBGY42eMmlUp9OY9Ro72/yCGH1maIOg2YUCUalj+c0V6lAo0DYH?=
 =?iso-8859-1?Q?XDDFFOyq/UNApf8fHXvqF/85xtjMGOcZGnQoYSO0ZjnLxflzAqui077TPA?=
 =?iso-8859-1?Q?xHGQ6bHoa+JekyF7c/fGNxx+IXjsFsAUhsfc1P8zSb9gahY+AAm8xvcnHI?=
 =?iso-8859-1?Q?OoMGzHZzrzD3fWAubTASGKkf3nfNFKEWfBSvRMN20cSh9VPNP9EaOpFTDo?=
 =?iso-8859-1?Q?kfBcia6MBKvfJjbSjRMcKHHP2y4HJ8Q+YtleoWqvfI2cNterWT+KK2Q+t+?=
 =?iso-8859-1?Q?f1mvAXPDpiJ6ED3m33lOsYNk5OADEr/9j/9GW/YnKqCxXGEK+BesE44qaF?=
 =?iso-8859-1?Q?atSHDdNCIb5g6taHq6BUc36GbDt1ypMNcg0+dLu6JgGypQ0I/3rY08AeLC?=
 =?iso-8859-1?Q?IwJLi59uHOWg09d7l8cxgABRQQAzXZNwqXxVsSAreEvCoPpljoP/G/3zSS?=
 =?iso-8859-1?Q?gQquit+zxk/k4DkNWqZpFQsuTjr7BlwOtBi8ZSOLbhSW8dr3sZ92eYakA4?=
 =?iso-8859-1?Q?oV7VN7cAACtk+18pRLaw7KvsNqq7OQHhawzkZ3hOHCEtLYri3F7vp9aA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18522be7-e8b1-4fda-f204-08dbf0925f2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 04:19:25.7406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srhJE89hB3j+mleFP69l3VJG3P94rsGZ6TAGypq6gD9VruVxZlCzALvhaaBHGOgzZVSmQ6HvS++yW3tXWvVK+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/14] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 02:38:22PM +0000, Francois Dugast wrote:
> From: José Roberto de Souza <jose.souza@intel.com>
> 
> We have at least 2 future features(OA and future media engines
> capabilities) that will require Xe to provide more information about
> engines to UMDs.
> 
> But this information should not just be added to
> drm_xe_engine_class_instance for a couple of reasons:
> - drm_xe_engine_class_instance is used as input to other structs/uAPIs
> and those uAPIs don't care about any of these future new engine fields
> - those new fields are useless information after initialization for
> some UMDs, so it should not need to carry that around
> 
> So here my proposal is to make DRM_XE_DEVICE_QUERY_ENGINES return an
> array of drm_xe_query_engine_info that contain
> drm_xe_engine_class_instance and 3 u64s to be used for future features.

There is 5 u64 in this patch.

Anyways agree this better but what if we improve this a bit more making
each __drm_xe_query_engine_info a dynamic size.

e.g.
struct __drm_xe_query_engine_info {	/* Bad name, just for example */
     /** @instance: The @drm_xe_engine_class_instance */
     struct drm_xe_engine_class_instance instance;

     /** @reserved: Reserved, dynamic size */
     __u64 reserved[0];
};

struct drm_xe_query_engine_info {
     /** @num_engines: Number engines */
     __u64 num_engines;
     /** @engine_info: Array of engine info */
     struct __drm_xe_query_engine_info engine_info[0];
};

The size of __drm_xe_query_engine_info then change and can be calculated
to be:

(returned size of query - sizoeof(__u64)) / drm_xe_query_engine_info.num_engines

We then should be able to add additional fields to
__drm_xe_query_engine_info indefinitely.

What does everyone think? We likely can apply this idea to other
queries too as it makes sense.

Matt

> 
> Reference OA:
> https://patchwork.freedesktop.org/patch/558362/?series=121084&rev=6
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> [Rodrigo Rebased]
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 15 ++++++++-------
>  include/uapi/drm/xe_drm.h     | 24 +++++++++++++++++++++++-
>  2 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 61a7d92b7e88..0cbfeaeb1330 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -53,7 +53,7 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
>  			i++;
>  		}
>  
> -	return i * sizeof(struct drm_xe_engine_class_instance);
> +	return i * sizeof(struct drm_xe_query_engine_info);
>  }
>  
>  typedef u64 (*__ktime_func_t)(void);
> @@ -186,9 +186,9 @@ static int query_engines(struct xe_device *xe,
>  			 struct drm_xe_device_query *query)
>  {
>  	size_t size = calc_hw_engine_info_size(xe);
> -	struct drm_xe_engine_class_instance __user *query_ptr =
> +	struct drm_xe_query_engine_info __user *query_ptr =
>  		u64_to_user_ptr(query->data);
> -	struct drm_xe_engine_class_instance *hw_engine_info;
> +	struct drm_xe_query_engine_info *hw_engine_info;
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  	struct xe_gt *gt;
> @@ -211,12 +211,13 @@ static int query_engines(struct xe_device *xe,
>  			if (xe_hw_engine_is_reserved(hwe))
>  				continue;
>  
> -			hw_engine_info[i].engine_class =
> +			hw_engine_info[i].instance.engine_class =
>  				xe_to_user_engine_class[hwe->class];
> -			hw_engine_info[i].engine_instance =
> +			hw_engine_info[i].instance.engine_instance =
>  				hwe->logical_instance;
> -			hw_engine_info[i].gt_id = gt->info.id;
> -			hw_engine_info[i].pad = 0;
> +			hw_engine_info[i].instance.gt_id = gt->info.id;
> +			hw_engine_info[i].instance.pad = 0;
> +			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
>  
>  			i++;
>  		}
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 1bdd20d3c4a8..c80e03b61489 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -124,7 +124,14 @@ struct xe_user_extension {
>  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  
> -/** struct drm_xe_engine_class_instance - instance of an engine class */
> +/**
> + * struct drm_xe_engine_class_instance - instance of an engine class
> + *
> + * It is returned as part of the @drm_xe_query_engine_info, but it also is
> + * used as the input of engine selection for both @drm_xe_exec_queue_create
> + * and @drm_xe_query_engine_cycles
> + *
> + */
>  struct drm_xe_engine_class_instance {
>  #define DRM_XE_ENGINE_CLASS_RENDER		0
>  #define DRM_XE_ENGINE_CLASS_COPY		1
> @@ -145,6 +152,21 @@ struct drm_xe_engine_class_instance {
>  	__u16 pad;
>  };
>  
> +/**
> + * struct drm_xe_query_engine_info - describe hardware engine
> + *
> + * If a query is made with a struct @drm_xe_device_query where .query
> + * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
> + * struct @drm_xe_query_engine_info in .data.
> + */
> +struct drm_xe_query_engine_info {
> +	/** @instance: The @drm_xe_engine_class_instance */
> +	struct drm_xe_engine_class_instance instance;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[5];
> +};
> +
>  /**
>   * enum drm_xe_memory_class - Supported memory classes.
>   */
> -- 
> 2.34.1
> 
