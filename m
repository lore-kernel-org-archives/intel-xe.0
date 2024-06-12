Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB38C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 20:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDE410E8F6;
	Wed, 12 Jun 2024 20:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dH7jySfN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E814710E8F6
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 20:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718222488; x=1749758488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YQZHQs85qXvDpdDP4LYVDVdKGHsTAvJnciriWB5MSpg=;
 b=dH7jySfNW9r9z8LY1Ms5J3UYBBM9qehYMHQiKscikGFs4SUOiWQ1bCm/
 RxR8tVdT0aYQdSkSJpqmcDkw+4oISp6ALJDQgugMPzznHv4x/ECpX6Upy
 0fy7intcW9KfszxR6FQ5nSXrStfKfoZbLSTbeacGTF6HfSJxV2CaRWZJh
 lJBIYEBNgmmkLcb6XZT8KqccC1+eo9/RiKtoeCYz+KlsWhZWf2+T+biFc
 QtFcnZxxoZ5nYoSyy1v3lUlh1LhiXgz9CGYpCjAOfDqlL4XTYUIdS6/Lo
 z7V9222K2dZ8QWCb8yoil4X47oU7faZcrVl6XZJxk3HZvCQ/ALTVTzhek Q==;
X-CSE-ConnectionGUID: wpU0PZGFRCSZ9pKDJMO3pQ==
X-CSE-MsgGUID: omaboRjOQ/ytvEPrDVAjOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18790645"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18790645"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:01:23 -0700
X-CSE-ConnectionGUID: 3Hsq46/JS32kdheHBa76Eg==
X-CSE-MsgGUID: jtlwjMixRhCPt81Pp8WUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39819172"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 13:01:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 13:01:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 13:01:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 13:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY7Wo9ggq/NDXNXnuGfplGtXkP58am74owEPe0t0RcHPj/VE/lksGnIbK6sFRj2h2wvZrk14XMYgBdaihM/WSOC9RC7NpT+ngZe8z1C4p0VjEGz8QnDF7KlGrOCLr+wNKOQq8UNVttZ4UmXxFOa962JnmDhAZeBDzSok3jcchbeE8g4ol0FsyC2SLzGAKVJrLwJ39Qn6UOLaRo2NuAh3qU5rI/286GjAdciOn3BVFa1FBpCoPXJiPF35bVq4IuaNaHJ3cCoeYRzyx0kWRTIDKEEVCb6/z3o1WZHsZ+PbC+COs/zARcf6xndM+zVeNJ7+yITkieNUVARSSanKINNqDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqUDobS+UmIyGZxa86qX6ifcUuclT4gmrM3NHjcHxWU=;
 b=m0BZ1WbLb3A/C+Gwg9ltD72IhW1WJGXWKl86pGXLHZKU1pEQG9b5FoUZYYkk/xFj7xE5Ikr2EOFgpLmqJ4ItSRMkPUeIoKhmvcSExJyiLzBOspdBTmIRDBI/PWBEFvcyNOzA4/0Mq0xdIVsLajHmC4lTHvtb3afEG0LismtJONISP4bw/HaxSZB2C1ji84g/AgqNdwPpP08Se/ZY8WBE3HgLoeUM5OjB5PaJv7B7gzJg+QHiD1ExSKKobgc0s5EkNhRzBTCcRp7YQ4tp4qKxxZd95MlvXXbVOU/4mrZmGxi2eHzDxGUuNtcNxOOfGKFPK1GELO+Fk63K9AJNC/h9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Wed, 12 Jun
 2024 20:01:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 20:01:20 +0000
Date: Wed, 12 Jun 2024 13:01:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/xe2lpg: Add Wa_14021490052
Message-ID: <20240612200118.GC2905419@mdroper-desk1.amr.corp.intel.com>
References: <cover.1718264337.git.akshata.jahagirdar@intel.com>
 <cae8d6c79aecc73424c3b741c10613742c5fd84f.1718264337.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cae8d6c79aecc73424c3b741c10613742c5fd84f.1718264337.git.akshata.jahagirdar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2c5474-f966-4cd1-4b91-08dc8b1a6dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FpMONDB9zPGxHlPT3h6+6tJqS/36KGYccjz63crIjz+9orIvmTlnOWdDZg7w?=
 =?us-ascii?Q?NNRpBhLWHm1P2S40A+tCW+VO3kscF9FqxUeZr0KZh9133xAeKfVVIoy0EZGa?=
 =?us-ascii?Q?t3y7ZliaXnvXjiwvSP0YEivqW+O04MJ52uPG8mnwIl3UIbI3dVfKH0ZNxOfc?=
 =?us-ascii?Q?OD9ZMhu+PuRUZVxB+ugwvpXXmKgaik7qn4iXBVOQIkOBrTMAIaqDDlRYc0V6?=
 =?us-ascii?Q?D0m3L6bzIGl4wBdgYjKM2xsgbGA37h/4OXLIIpsUBRzaiws/pM83n3zEDXy3?=
 =?us-ascii?Q?xAi9cD8ez/0a9pXVbkmyvVqjKwBMHKISqj+Qz3flknuaEAs/vo3kJrWO/ty7?=
 =?us-ascii?Q?59GaGAJoM4ZFg4e/xWFWGN28qFT3I1v1k3+T7OLjBgs7N0y+XmNserbzV3ZG?=
 =?us-ascii?Q?R16vU+5wizpVAu1TBZ96wCsgVw11HjJE88uTjqlTT4m7feHYGZkkLJcyyUIc?=
 =?us-ascii?Q?8wHQENp+rptjkBn/ySTg6gM7trfI+K6/ebTnXYkT0pUlkfEjL3nHMuiYQ8pO?=
 =?us-ascii?Q?R9Ot8YdhdmID7zyhYsPQhcpWVJql1kHFwjnSZun0wWt+pkvOt9eniREwQVzg?=
 =?us-ascii?Q?Yh3FwIUxnfRNnEscwcqG9flgg08osaJLXBmEoC9WKYRmf/d07rANZJZ0OmsJ?=
 =?us-ascii?Q?mVfc7UY7Pp7tain5JwZCDz01Yw6+t5YTwVL7du9PVzpCuxp5ZBdXBnYDnAMy?=
 =?us-ascii?Q?8aw3H7jHQv8B2uet5kiT65imb6H0W2T7CCYensvahIze3oDVsy/S2Akswzum?=
 =?us-ascii?Q?Gw6vT7C/hmwg8swvLywEVUxk2K1oQS0Bbo9GLO9q/LBnCgZg+kaUvUSRTTtC?=
 =?us-ascii?Q?/nYA2bK7QtOfjkyIFsAsJKkruxYgnEfLNHBD5F4ybKpjGWbBVOEpVPmXpngC?=
 =?us-ascii?Q?6wE/OHgqKl8o4IGXxBaGn/Llrp3wqQHezhiNXW41lTujjb2Ven9hDEZfMWjk?=
 =?us-ascii?Q?wKCIrJyu5f7CBkggR+lC+jjMU8ny/+vSNHPsArLFVkHUkXK3nkBYSATCZlz/?=
 =?us-ascii?Q?OHdw29l32JmJr3HQq+PV8p8YJVkjaHxkF5tOyrO+AALxjiV4pYwjFeh5Dtm4?=
 =?us-ascii?Q?d/jN8ZdPCI03cNARNkrYHUg85DuP/fYPxFcGOdIh4TFDiAxw2Wluf1fMe4KD?=
 =?us-ascii?Q?2vbPiWqIEJL3W0ge4ERC/mwBR4pk/vfroxvZW0BSFvfcKZkMzFeB+wcjbnG1?=
 =?us-ascii?Q?CEyNuGU3pEyXSHYZcXa7hRTbeWwNHSpxr1abSR5Koqr7HIbKrMGeWiMUZ+bQ?=
 =?us-ascii?Q?tVoN1mCo8t/bJ+RmFL8x1+1A1h4cNyGaS+r1D66/AB6dU7EsPdvOWKp3EytP?=
 =?us-ascii?Q?p+I8nMfJCbeCgm0PeF/o0oLd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vqy2wNrAxtd6NqxX1T0SjHCZE4g71FXv2bB80y5A3e5CyrsBuvt7XHuD6Bqh?=
 =?us-ascii?Q?FTD9S5QHL+IrWnniKgyjzlwuWAarR/dc8/NCiMXkDAGQv1LLgX01HhhayMlj?=
 =?us-ascii?Q?29lzIoEIM+Izv9z/rlJC6Te2KsF7OL54knwJo8fWUydbnVjJOfXEFCU8MNsy?=
 =?us-ascii?Q?hIvTSEn0iOMgfdDpS00p8FYgb1cRiJgqvcKft15LKNmFzkNlMd6fV6sfQzzo?=
 =?us-ascii?Q?hmHe9b/OBk4oYwarip/D68cjxwTDtPLDs0gPJLLTzOHy+DX8jb8scUFz+ic9?=
 =?us-ascii?Q?LcFNmYR4i4HDERPBcJBwTFppyzKutBgY1cq458PEVkth0xKrnvLZI0sncs3c?=
 =?us-ascii?Q?E82EnigTIpkoNZQ+mYMNC9YiOtY+lhsJ8wNEYQfzDLySSGk2Vxt+Kjywz+gT?=
 =?us-ascii?Q?9mJ1IuTEdM/sN9qIE89bxMyPzoEH3UxqaSg2l8eVEA/HdePruN6MZgYUMAau?=
 =?us-ascii?Q?SMZatQgCLs7nfgDzyPMG3c2qHkW7Eld8Hm/26IyFifYKUJrWc2wjpt+wnOp6?=
 =?us-ascii?Q?FTrIWL6XRxaaDiPnYj039c1Cx2FCQ3Ab4luTsR7WZD61PMRcFkQQCMH7qN8U?=
 =?us-ascii?Q?RwREdKxXL6QBTgTqnCO/AjKGcOoI1w56GOA2RHo0onkDd0yC7FzhOpzyj7gx?=
 =?us-ascii?Q?L4kABdYd1AbPkIKN3FH3WkwkxURnh30N9FeuBnlh8dLpoT6Kqk8KKiU4zt2U?=
 =?us-ascii?Q?g5UoFP+6sqTIpuH+t4fwZWcV83ZnYoHWCLOwylm4Up8HSfhH35vdp1a9VW1C?=
 =?us-ascii?Q?vXiNbU0bmfBMRc6gZB53BpckhUOWbiYfEiG0DC7mX9TK8qwshHCOGIQrr6ls?=
 =?us-ascii?Q?rIGxCDM9id8GMx0zTe6sCKEqlzLvBzPptxp5BcMEStH/8Y6KHb8DNLNsxcV2?=
 =?us-ascii?Q?th0ajZqgzTeaxd+AeALmJOU4iI1gcFg949QKs+qXVUbD1E4y/wDyy7UXFPCV?=
 =?us-ascii?Q?xT1E+HT0UHtqch290p58CPBKgaela0abgb+RqFLQiPFZO8BgpQ5xC+sJSvl7?=
 =?us-ascii?Q?4gc/0zpKIwHYwIAxbCD1BIwrNpHzSv4g6nv6oDS8nzYCJyIaTaHhzGVhqf5C?=
 =?us-ascii?Q?K1Hx2nq3i3wgC5ht7JiEHANovQBgNlEO1ghIGuAGVz217jqAtN+YHoaEbUq6?=
 =?us-ascii?Q?6VeDqmeG/7PAE5+CVS22NDYsAPD8Pqan9cDZp1jDkagriU2rnNqe21k0wjNm?=
 =?us-ascii?Q?p7gmFZLrIr+rOegRGQQootasCN8boMvlxWmW0HJsQPGqFjTquZKmBP0wZHAB?=
 =?us-ascii?Q?4cmwF7AumWCamm5uhEUJZKlvu4uNJ555ir16c+SGLuMxuumlkqMnn8uXjBHN?=
 =?us-ascii?Q?+2F92zKhNlYG/hY17WOXf5FBa/WyVr/RR6ueBNU9hsDrC4Of2L2jRtM45d8W?=
 =?us-ascii?Q?tXX9wDWSX7sn/3V8GdzKLl0DtcOccTVZ4K6hnlG+5RuiDBjQLVdRDt4PpP7B?=
 =?us-ascii?Q?qu5im2zPCA/2vm0Hi6h/yx5ab7r44kZ6FNDibvvY6FjOuLADdvOtPZF9HXsX?=
 =?us-ascii?Q?nrstKXKaIBbjm87ng+Xw2yhPY6oyoSXsutM1a+f1I/FStv0JSW+aUBf8crrz?=
 =?us-ascii?Q?5DjcjX97fiINsbDZL88A1ftejmOSc5EeLZcI8Jihx6VQzC7qrX9DuJHSCFcU?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2c5474-f966-4cd1-4b91-08dc8b1a6dc8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 20:01:20.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qd5L/JiMfUg+H6agowOB4jXyBhxup7flPVQWehvz5vV1YMwsxmft4rI6TpNs00HeKgJRT8xoSV0dfZLBGj/ojVC1S3aiMwLt6SNM+lBuW2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

On Thu, Jun 13, 2024 at 12:52:57AM -0700, Akshata Jahagirdar wrote:
> From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
> 
> Add Wa_14021490052 for Xe2LPG 20.04.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 18a4d5dd5a4c..a2725a150441 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -688,6 +688,15 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>  	},
> +	{ XE_RTP_NAME("14021490052"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
>  
>  	/* Xe2_HPG */
>  	{ XE_RTP_NAME("15010599737"),
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
