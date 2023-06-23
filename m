Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42749EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 12:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0591F10E0A8;
	Fri, 23 Jun 2023 12:21:31 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35DC10E106
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 12:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687522888; x=1719058888;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tp3vSAXFXQ7b8+64h6KmYXL5eI+ruBVaO2Xn+nmgnvQ=;
 b=YUBFo1sgj5CGQ8O5ceSlMMbetirdY+tc43D03J4YJaue4jBX+98IjQUS
 kpCJ7tqWGH0dbaVDDu+/q4P6CrMlXvvBpFPWrhYGXKIv5c6LjeW6pvcop
 WfXWCz5atPMCVLpP7XKt0J3JTnrk8TeCpVh10RPRc8PqazRrHec12X4X8
 4o9rV1X67G2WQU+I8OFFaoyJv+nB2zoHejmwllTvMjARm0CMMV5GI6SIN
 Aqj3pkYExQt9QKUzL5pD+16xz/h07NGjKIoH10jhR10GJVab4M2NfmQne
 gXvoZkSjC9OHIyuYbUZk8XYkFUsCd8tLeAxB5qPflYVoiNrq5D5fCTmRe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="364197865"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="364197865"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 05:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="715301615"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; d="scan'208";a="715301615"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2023 05:21:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 23 Jun 2023 05:21:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 23 Jun 2023 05:21:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 23 Jun 2023 05:21:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5NAzipNsOSHcJDVbLp9LggcfsTirc4S08WYOvR+0FW13UIN0BzuDxSd0chLwHS6NI90JTOjDSgGHsFS+2eOQ+E9RfVpefhgz7K2ugH++NdBQCGPM65EPcsm6sPrZpJa2AU6sZH3OXOUwzS0dBEd+HCSJLMm0lhmWAi99JN/qFdjTzpfcd/G3WjuUqbF0SOtHv0hrZuN4xfjk5/aoFUyiYY9R98yNPFcMB5fNjEFDcEMX7HfoCbpcQnTeIG+Bfcxgf46vlTqlUqgkAVrRwvsQI16gmXEWsOL/GQnWGKODdroF5o/iMlvEKFAdrzkY1y4spYlExVhTnVODsXGOzlaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cVg132bTgthEc5dBd062j+E5FxhfwHuDXAY35NYO60=;
 b=lKeaNsrf4iv8Ii6SrKWWNzeOI7dvtmckc+69tkFkBs8TufT4yUOLYWcz3V3ksXE3sS8KXE3bxmBPVqCLz+xthDvW7Yo2XQQDbZenBHiyDtszK19ltr+JucqJ6DkscbB1xO8VVCGfKlVbFcwMzvsZ8ZdPjWv9CSRxLoE1USzF4DVkfcLnPcOnvRmPm3gYY8Pi7lYBJAfjtGME6B7Af4aSMlhzPGWiazZf8GeW6QwDxyEFSjmPfxXWeDtB9IeQ+merFzDhDvpN5PlxBPlRFlfoM0L+HAqo4nruS21oDLZiO5FmBlztkXQrgUO57Q/mRx3XQVriVP8yhTtlF3egGdmdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Fri, 23 Jun
 2023 12:21:23 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1e4e:c49d:445e:cb2d%5]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 12:21:22 +0000
Date: Fri, 23 Jun 2023 14:21:14 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZJWOOhXiUFaWRS65@fdugast-desk.home>
References: <20230623112920.147748-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230623112920.147748-3-matthew.auld@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb39019-29c8-45b0-c5c8-08db73e45b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhAyX0H408seh8YhaQjghcoRUywL2pmeuJbIDcCxrh7KPGL9jekfyw2PYag0mFVR6IY/sT7bC/Bz4j4nECyoCBgKjN73hhewNPhbDataDqADsTd362Ozm8ZlIHL4KtHArSxbObOVXBCHFkKJqqrdWDDLuKW7YZ+sB9Z/WICUndFAiNv0qBKPPUyUyp8EvixixS9PIK/um1o9Sd4RHcXgiTDIojzs8qSnqBBKu8xMNE5QhgJgnqYL3x5UaVHFbAQzZdCuL3ncY+CWMZz1iY3Y4ez/bjWL+sIkwPaj2++9EVaDInyuQfenucrpnoiifQJ3wUNVgkPM3H9LVpsZVkUaNKWjcp6Khy9wXhkKUfRvKWm1zjHTtYCX2g4IlltHuCsc4ea+eo+aajLhMh6I74RrelJhWmiHwyWUpiG3T0blNolM5rpWe71mSOUmq40P8EnYwgd2Tc5mpJ8NKwSayG2GPGRwQTvGUWremCOI8QMpkLrU39NsO86m18ozKafW77KO2zB6Qe8Wt+/VIoL4s8pCnap5DX4OVqssZBfBsxB3HZEvId2e4RbFeLNlVFJ7W7Sp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(107886003)(2906002)(186003)(9686003)(6512007)(26005)(4326008)(6636002)(316002)(36756003)(66476007)(66556008)(66946007)(6506007)(38100700002)(6666004)(82960400001)(86362001)(478600001)(83380400001)(6486002)(41300700001)(5660300002)(36916002)(44832011)(8676002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3Csh33ijEhRaiA0XrmpzOEYejGtQRh5IUKN2it8zFa3MAwJ1rI2JYyLgA5x?=
 =?us-ascii?Q?N4VPIPRA7zuBwTf9Q8kK24M+xLIBkvqh+f6lopuDy6JslgQQh+5L+w8yivx3?=
 =?us-ascii?Q?cKT06IXCaIs2uCtjdctXjgXvArYggd6gI6XxWpTM7HvXH6Nro7TfJRUbHk91?=
 =?us-ascii?Q?PhsBYQyrq88V9OOfIiV8ffajkCUWRmAgVPknNoyPZowdc2hIB4Q8NFJ9td+s?=
 =?us-ascii?Q?ybEsDTXmJcmZ/wynabylEuZSg8xK8p4z10n6cxmaYWUl7HchDgJLvuCBI9EN?=
 =?us-ascii?Q?+45zn4iyz2L4qxJ1wAW6Fr4fN4JBg9XFdmcfoqL4AwYrJtFqO3DfojdCudtO?=
 =?us-ascii?Q?SGG55hLvKhvS4fquvCG1bxwm0lAWnrU4Ivqk7zyx5/QhaHYZwsyuvUWAfckQ?=
 =?us-ascii?Q?QKgF1xJivehN/8AOaSh1/4yob9ak9I6zQxUBIIbKVqIjJee4fF9GGoa6RGTE?=
 =?us-ascii?Q?WiIDhe3PgUStNB9U/fxcB+/FsMqRSInsJAlI/n+JcVaphUOlRqHth96MTlIl?=
 =?us-ascii?Q?LWUw+UZgwGZMAnuaFvHI7FOFXlGFrFulQyZS+WuYDY/dUCnmXwm/Bh6EaMoi?=
 =?us-ascii?Q?VMqHKCA9qwSydR0VucaOUwFnSPi3ewF2flGkz0V0TBihvEMTf22CzDYRyAPI?=
 =?us-ascii?Q?n65AKu9WmExLSf3/rkAvwxygxqs6bznu4usT9jxsHMVop7yky/mhwVjWPIxD?=
 =?us-ascii?Q?zCGlsWE2er6SB3B81stYQuS2IFFFO/Ylrzs7Y7t+z5Qra8ZT5VNgO8KU21jm?=
 =?us-ascii?Q?TRsWxcqxT7aMZ9DDdNRlQn7Mrx/+xIoQJZADadseSjYGh/15/T5yn52W+04i?=
 =?us-ascii?Q?zEvQgRRHmkCXSDJtKmvM7tQ0BYpUyvarwxEKOVPBaMhCddRj0s5u1koD8oPB?=
 =?us-ascii?Q?/g++7JCoEG4ht1TSW3y2t0QacQNX9mpfOciLGLC/q77bL0PDQPgeNBCKC4Hn?=
 =?us-ascii?Q?6NI/XCkS8Xx8crCVOGYFumSNJNLAN6lve+YDRsIhHn/iKmXNrPqmWody3dns?=
 =?us-ascii?Q?KnKUlz9mOZCvW/SQIZPvcdlAgNCI+aQ8ytI6jTXweMV3Tg71SV+KePJU2cIV?=
 =?us-ascii?Q?f506W/WdaTFpmKJQBO7PmGMjPKthkC91mWG5tl/Q06X/EvPBdOXK/PewQzrQ?=
 =?us-ascii?Q?vGK2qiuUz+CqM4UEhLRUgaLoV6QmAJ3C6c1wKlal3g59XjVvmY817GxKTmTs?=
 =?us-ascii?Q?GYOCX1BkCTKzNrgSZGjsL5Y58izycKehTxYdPll1R6wSElbbYFRjQ9+wXFSV?=
 =?us-ascii?Q?65GbODScwQWiRT1nxgXqqvySXJ2IjVp5nQhHTDzjKfvnzJzfQ5qO2+d9ygiu?=
 =?us-ascii?Q?5P8hQ3brUjD+e3SFsYkHc/v4ja1JwWv7uel1uRByRV8nQNS2xDZB/nEnmpeJ?=
 =?us-ascii?Q?U52cG3kN12/pKPOZ4OrkKTgJRfGZpNwgBIB/+v+HvaLDdoMqOYJ9xEZTkSBn?=
 =?us-ascii?Q?BwTXe20mrQuXWJNVFGsx7H9ydjDJwUlEv3hMPZaP2yCSWFbQVQR1XCu8rgfb?=
 =?us-ascii?Q?+l8qSg2Sk2GVbM0iuFFvsqCRbjbIHy9shVwYvkJv8Aa8afsKyy4fxskiAlJH?=
 =?us-ascii?Q?eBa92S4TsF+Xl+gwjB4gQQuYX4y+i7Xc2OqnLmsQW2COLeVWq4HZGtrzulyb?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb39019-29c8-45b0-c5c8-08db73e45b46
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 12:21:22.6356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAn6i9KoPHQmfIM8Yw0BzgKJ1qnVP5D+pfO8UYwU2tyFqW73LCHLBYwdjgROE9dVm7z3rL/dPqT50rO9ulbFiNw0VgmKCf7ireTr2H+eSuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uapi: silence kernel-doc errors
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 12:29:21PM +0100, Matthew Auld wrote:
> ./include/uapi/drm/xe_drm.h:263: warning: Function parameter or member
> 'gts' not described in 'drm_xe_query_gts'
> 
> ./include/uapi/drm/xe_drm.h:854: WARNING: Inline emphasis start-string
> without end-string.
> 
> With the idea to include the uapi file in the pre-merge CI hooks when
> building the kernel-doc, so first make sure it's clean.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 432bd87ca401..5da6a04bb478 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -228,7 +228,7 @@ struct drm_xe_query_config {
>  	__u64 info[];
>  };
>  
> -/**
> +/*

There are multiple occurrences of this in this file, which seems ok to
me. Is this one particular somehow? If it needs to be fixed why not the
others?

The commit message refers to a missing description line 263, that is 
attribute gts of struct drm_xe_query_gts. Is that not the real issue?

    	} gts[];

Francois

>   * struct drm_xe_query_gts - describe GTs
>   *
>   * If a query is made with a struct drm_xe_device_query where .query
> @@ -242,7 +242,7 @@ struct drm_xe_query_gts {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  
> -	/*
> +	/* TODO: convert to proper kernel-doc.
>  	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
>  	 * bandwidth between this GT and remote region?
>  	 */
> @@ -852,8 +852,9 @@ struct drm_xe_mmio {
>   * struct drm_xe_wait_user_fence - wait user fence
>   *
>   * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> - * instances list and check if user fence is complete:
> - * (*addr & MASK) OP (VALUE & MASK)
> + * instances list and check if user fence is complete::
> + *
> + *	(*addr & MASK) OP (VALUE & MASK)
>   *
>   * Returns to user on user fence completion or timeout.
>   */
> -- 
> 2.41.0
> 
