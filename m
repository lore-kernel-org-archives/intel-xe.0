Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9432C369BD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 03:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92F010EA12;
	Thu, 17 Apr 2025 03:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHx7Ti2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEC210EA2B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 03:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744859067; x=1776395067;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XeJItb8OZchsEKPeY8H/wUbSyHHsVChuLMaukIK6v0Y=;
 b=FHx7Ti2+TWGjDffZX8pelEKNr4SizcTEqrakvfYGIyIRa4l2yZCXFbKQ
 oMR8/aneiZkdk+pxI7iAp4Y5SalvDg1zBoxNgeVmnIxdyU7zpzpQ3Rrbv
 lVpvfzTiWG5fygahiLLWGwl4l4JcY1QcUQ5sIY90rBcKmN5iSO9cwW2ND
 3oAXL0QRBnLPQPSewhJ5MIgNhSoJ/qVxcZ2Vjl/1tR7l1+0bN8xuBo4xk
 hpXlJTW2CO8lcdC6TcodBHGiXGpC/8Iebdob33PcbDZt2XVr/Pgi/wNAF
 xsync3uC5BQvKzIHkoar3nioQ+8ijs51Vgg64623uCKz8K7BrRQE2BpSU A==;
X-CSE-ConnectionGUID: rrOekCVfSu2urIHMlBXC8A==
X-CSE-MsgGUID: kZphaqX0R2K98YEXJ5ANyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50254844"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="50254844"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 20:04:26 -0700
X-CSE-ConnectionGUID: vvV8IUazRZKjRzARgMeo6w==
X-CSE-MsgGUID: nGJq/eLiRF6PQVQ77S8OYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="135525505"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 20:04:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 20:04:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 20:04:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 20:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0vOJQvBkAWy8BWhS1xP3bUk5KBdaLmLdRuEV4Ks9Ysjd2FrbOPQwNw+lN03t2vCEq43VX019Iwee6MkM8pY9Srd6GJv+AGrO+jISc9CjlAB1k4KjIHtdigwPBWaOvpIMPlYn8ZLuGoUZ9C1DYXVfefgqX+4phxi+9qlsMwPAKHgw93Bpd1youmrDd8PN1LvmIXvVAV0zK3XNCWZJYwx/5Bg2LmLcAxSnv4CPHcdBr9XPt0VxA4OEzRWX6DgTiMuqL8RFtsyTUsW7KhmAtOuMiyWu5Ojb5YproyZw7R3uyvYWTkl6HmXKOchVgG2qBRKSXgWVBuQRUoQUe7eo5LEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmFT3QmOhQkVoxE0/KD4KiJjNX+QOUMr3BlZ/eWoV4M=;
 b=tIuDRHTL0dw+SCJhb7fna+jEE3emSJUflM9sYL2y0GGAwZ9ETVXMzOy+WPAz4hgO6CPb44Es0OZNoe1e6cDwKqqaj+tn5FhG0YHDwyK3aEOp1cUNbnoL73iOx1RCANovs+MZHA2gpr9HtsuGgAnkJ/ACkQsJesEHjtfk0NJejLRy52PXUPgCEW4VN5XRP+esfO6AKlfqLReInecPZ6Z3uofzoHWg5t12NntHO7OEfxDwTUCyeBt7i6kQKcNkvecPW/6hh+IRwF7K6ZA8eElxPAa3q6n2eeowkrPtWrhYwq1P3uN81Y621GbFTS020GtCNb634VU9NkZ8QWFpr/kWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 03:04:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 03:04:15 +0000
Date: Wed, 16 Apr 2025 20:05:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 11/32] drm/xe/svm: Add function to determine if range
 needs VRAM migration
Message-ID: <aABv/vgb7v3ixrkX@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-12-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f8efff-8b1e-461f-cbba-08dd7d5c8992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ItDiQGKNXchfMr0NwqEzLPJBoCMnJk4mO7c0yqZ3UwVZ729S6rHCL+ZLg1dj?=
 =?us-ascii?Q?Um5d1C7pAvYMt3uquR2/JUFfEKewHEoxYzqtW6CYS/e6f+Ek3jSutQ3hG0Xn?=
 =?us-ascii?Q?4QPdSNuUmuC0AZUoYdJt+cx7vGX19fHhL9Q/d+l2wyeka8P69hVaK7zYoUfo?=
 =?us-ascii?Q?Mpw0I2tAX/8jMxceWYA9Jvq1BWnGF7PddaJDB52M/dczTYOAgxs1JryvMlCb?=
 =?us-ascii?Q?aCH92ag4JjgR5a/aRkow9ofl1fQgP3QMsdCsac3P+86MumtD9bfV5QMlHa65?=
 =?us-ascii?Q?HHIYhGq6WgoWY7MJVK6tYl1j8MvyhVgpz//EteiFYCCEm2KvjOxgdkIdNkLE?=
 =?us-ascii?Q?ml9feyKV8W6n5OVK8dSzVcJRrd0cDcDOgU/2ayTpyzvGOMr9IJgXrfZwuXuU?=
 =?us-ascii?Q?2RBUIX/qvmJVUpVsIWckbEZBiCGb/ud4Cj5al0j5hXHo1WNwovxcMeFc3oXc?=
 =?us-ascii?Q?0cUJQZULM3VDeNdyowtR5jF34SDpxqNp1uNpnkt8p+HBG+KqF1JcTx4Mx+Me?=
 =?us-ascii?Q?NfM1gmm1itQS3GkhJI+eVYhwBxb4CdVJO9jBtKnTarYbyEwsFFkCACR9RQ2B?=
 =?us-ascii?Q?zHHTg5nZbk6DIa4CKQq+FCdk47n0C1KgeeNdjR8ms7SESYW+CSJ+nr9Z7O9L?=
 =?us-ascii?Q?LgpyboAoYA52envauiQduWcldIm+rPa/CqGkWsmvOIivqsMR8RZLbxuzEohP?=
 =?us-ascii?Q?F2I/EiAOnakHsMDFy8yDIuyk/oizCbJR0iYQqhqh7vOXc81gI0lsROUe/nzQ?=
 =?us-ascii?Q?gWsWAQFa31LNUQyuhHU5AY7ivOQInCxMyq7MTbMeqeebcgJXXjqN6HYDSce8?=
 =?us-ascii?Q?yeSXeFU6WKNZza6mx+1Wm3beDUN2Rj5M70i+9tsa+Yjn4ENPo14JLBqYuiNP?=
 =?us-ascii?Q?f4PWxNflgxvUnnbV0iAZogLhqWB44t9IRIRy69wqRnksA1JLtPYBgDIuIBMF?=
 =?us-ascii?Q?bsCoB802nvvYyY6qoy+xI5WpwOT2mWtNzWw+eE1aHxcIi/c+8UbXdf4xnl6k?=
 =?us-ascii?Q?LyH+5ACF2jxtdzq5Mf9a3yGpX973KRfexG7SxHoi+AajRNXLgoUW0LNnoGAh?=
 =?us-ascii?Q?fXxWGs+RvUwK4SFI1X2OT2f+U+SMtk4CERzQcsZF5p7217nE0GDkNlGPj+T9?=
 =?us-ascii?Q?UOxCegNvg9CqXhX0ZXOZxufrDtKe5E/8TT1JQxJ0xYLwynC56aFMSD/shRcH?=
 =?us-ascii?Q?dfM/1XPhbjg9A3jhMO4Yj17aei3VmsCPEFz+6Vu4qCh9TBG4iVxtJ5Bjgw+b?=
 =?us-ascii?Q?OetKNO8DI7BWGbagdUSyvLfvngzofz+lQhMapWyyOTzaBgn7bnm9YGYII6cK?=
 =?us-ascii?Q?eOULeRo3Y8AIey+fUSAos3GSimUDkgiU8wNSNyTUd/Hc6YJzZl1U8OlUaXL1?=
 =?us-ascii?Q?zsGUp3c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+c4aq8pbieGGFnnSJioYclDbtfcrrqrIrbOnbr2589hXJnCmgZonwl5vaXIA?=
 =?us-ascii?Q?n+Sjg538smqTJt1ItG1FMH7nkwt2jCr9UjgRe7f6BthEzv7sTiDeJ2rpkrDQ?=
 =?us-ascii?Q?VVDxMih9h6o9CdTnrzRgg10C1HuKCtGKRs+PRNT+mz28UEEeLXSI6egcj3lx?=
 =?us-ascii?Q?8470oigMBaBB+UZqw+KiCNPLJSAeF2CT2WR7OsYgejY7jwBSmVyUvCTUt0Ew?=
 =?us-ascii?Q?QYwnhkQcu3PCr5uWKGKAinRKlCl6tE5HOF7cUlljwx5rF7uj0w433yhIf5dQ?=
 =?us-ascii?Q?0llV7+qzn7gMQ3fRyw4+fH4vs8lafA3BRiUPbBv4A9sSGQFjGSwCPuu+l2/R?=
 =?us-ascii?Q?W9kJOUbIhvD11xn4lCKUrYQxAz2IattlGRSVIlW4IEQD4yhxqYR6C32EgXD4?=
 =?us-ascii?Q?BMM/t1jq++JkzX28tSM5ev8x/MSEs2hXYmUWcqaSG2DgDkPir6p4ftc6jfgT?=
 =?us-ascii?Q?y+wHfykEUt0Ta43nrQqNQAIUQTBhVi/VdK/acqommyyEVa23yseDqNV+vw4L?=
 =?us-ascii?Q?g5TapE1aZjIcJQFn5JnnAgTAGFPeM8UGQT0I/NykARkW25/pv7BlEKsRdZYH?=
 =?us-ascii?Q?ANpxUJzlJdoHevWp6Sna95ykguRM6pXu1LxcFy5Zhql5t6xRNZZKf5ndV8yv?=
 =?us-ascii?Q?cby108GdcXLsRRq6CpOIEQX5ThWbLFFtrFbhrpNoEXc1wJeS3b8ub6SGVzbr?=
 =?us-ascii?Q?wFNqzD3UcxQyxfSPlJrQSysQRPj0NyOW9FUeFlZNRA5EI6YGuOx6U4hEZTNW?=
 =?us-ascii?Q?eTJrOK2jP1jVDh0g5R7MBM5iiqR0nKxeZNy2Ats2zYEL459KflDGa6nPOIzd?=
 =?us-ascii?Q?y55ecMMed+c2oPLe6QH6tCJC4UQBPLOUpDo4Xs0Oa8UD2T2KZUcc8ZC8MiV9?=
 =?us-ascii?Q?1VyPipJrsSLOK08DgSDzgp/DaAP6Ah5jwdRFp0FK5bi585jOSiVuKdWXf5wX?=
 =?us-ascii?Q?005UB13ar6jEOy/M29FdRG9GZkW75/FRhnfzSFt5fFKcyZUtv3Kdy6eB21EL?=
 =?us-ascii?Q?xZ7vnNGcbunfiB0l0fPWFfiqlWKMStZp4B2QTSZ7KMElT8yL5EHiclzzIHc0?=
 =?us-ascii?Q?IYiao/JmrePtBtRJOwqY3DdbrT1BMoeVWxqDdG0RhGHuzbypi5k9b8KMcJ3M?=
 =?us-ascii?Q?CJ/wkifD4bzpuyxSaVQVX0+d9ZUYRrtAmc2nRmA6VSuzkszbgdqsg/O+MC2o?=
 =?us-ascii?Q?m+sAuRUR02E64XmbITzaX92X5Zg2VvkJo5iNqA3b7mz1tEIFQfBViFEsygpe?=
 =?us-ascii?Q?/qP9KqW6appHhK0J/MfZbN1Mi5CudDtdIiqEIICSANMd+XnFwAjrgrfOhcHj?=
 =?us-ascii?Q?nRpxO6iN2l1Fa9KIQfzrfVBYn9CwYpNdmx+rW/c2BRyw9k4U2anBmpUb5pCK?=
 =?us-ascii?Q?dkYVZc+EwrGcsdFZUQv4emVZZbRw2meixZIp9LrawhMlPDEj5j/KvlGlz0Zl?=
 =?us-ascii?Q?n7CrN7fDbQ2cUIrfIenY17ZyBBHNIMpkxtmY9/iNSICrkgnkAB+Puass1xav?=
 =?us-ascii?Q?gGcPioHIzH0GxH7SAeYvdvkT+gtBaBtxMBeX8mgrNN1DxyB4qRKjKQ+0RGui?=
 =?us-ascii?Q?hPveCSsJe5nuWDm4pp3rGu941kTKb16Mi9idqWZ2bwPai7HreCy4X+XOo84h?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f8efff-8b1e-461f-cbba-08dd7d5c8992
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 03:04:15.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCvL/1u09Dd+HHt+FVTcR89IEvDepj1FGwUpJs9hP07jwkv8QZTMZRIUc6U2/ifTqwcTymbyEW80kbRcc5hYEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
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

On Mon, Apr 07, 2025 at 03:46:58PM +0530, Himal Prasad Ghimiray wrote:
> xe_svm_range_needs_migrate_to_vram() determines whether range needs
> migration to vram or not, for pagefault try at least once.
> 

So I pulled this patch into requested series to minimally enable atomic
on the existing upstream code here [1]. I suspect we will get my series
in first, perhaps even in the 6.15 cycle as I think it could reasonably
justified as a fixes series as the compute UMD doesn't really work
without it. Just a heads up.

[1] https://patchwork.freedesktop.org/patch/647159/?series=146290&rev=4

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 49 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_svm.h | 10 ++++++++
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 8cd35553a927..f4ae3feaf9d3 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -709,6 +709,51 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  }
>  #endif
>  
> +static bool supports_4K_migration(struct xe_device *xe)
> +{
> +	if (xe->info.platform == XE_BATTLEMAGE)
> +		return true;
> +
> +	return false;

	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
		return false;

	return true;

> +}
> +
> +/**
> + * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
> + * @range: SVM range for which migration needs to be decided
> + * @vma: vma which has range
> + * @region: default placement for range
> + *
> + * Return: True for range needing migration and migration is supported else false
> + */
> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> +					u32 region)
> +{
> +	struct xe_vm *vm = range_to_vm(&range->base);
> +	u64 range_size = xe_svm_range_size(range);
> +	bool needs_migrate = false;
> +
> +	if (!range->base.flags.migrate_devmem)
> +		return false;
> +
> +	needs_migrate = region;
> +
> +	if (needs_migrate && !IS_DGFX(vm->xe)) {
> +		drm_warn(&vm->xe->drm, "Platform doesn't support VRAM\n");
> +		return false;
> +	}

I'm not sure if this warrents a drm_warn, I think an assert would be
better here as it shouldn't happen unless we have an internal
programming error.

Matt

> +
> +	if (needs_migrate && xe_svm_range_in_vram(range)) {
> +		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
> +		return false;
> +	}
> +
> +	if (needs_migrate && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
> +		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
> +		return false;
> +	}
> +
> +	return needs_migrate;
> +}
>  
>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
> @@ -763,8 +808,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	range_debug(range, "PAGE FAULT");
>  
>  	/* XXX: Add migration policy, for now migrate range once */
> -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
> -	    xe_svm_range_size(range) >= SZ_64K) {
> +	if (!range->skip_migrate &&
> +	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {

A little odd to pass IS_DGFX(vm->xe) as the region...

>  		range->skip_migrate = true;
>  
>  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 9c4c3aeacc6c..d5be8229ca7e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -95,6 +95,9 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>  int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  			   struct drm_gpusvm_ctx *ctx);
>  
> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> +					u32 region);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -281,6 +284,13 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
>  	return 0;
>  }
>  
> +static inline
> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
> +					u32 region)
> +{
> +	return false;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
