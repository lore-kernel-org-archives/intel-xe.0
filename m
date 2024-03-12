Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69002C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 12:59:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243E810F0B8;
	Tue, 12 Mar 2024 12:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6g0lvzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3E110F0B8
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710248397; x=1741784397;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eKhYgWIBHReLjm6xEaSDnbQYMUBGtMpJ197wBpNw+jI=;
 b=E6g0lvzlrVkkfedrnhBff+uLK/sgz4i/NU1jLv5nPQUOARtObRkhBnw+
 lywM7QUIEplP/ld2xpm0wIgArdIyxNi7E6MUKoQaUixyECnetkYMokBpp
 w5+WUrK95LqQJJIBhy5KM9tETHtCd1hUddlM22Rh58zEXAlgmp5dU3xjd
 GQI8fkMfN6dLuDSgvXC5IGFTrLmqNlpLOZQfjJRgApQl4zxAG7bK1vUMq
 mSmkmf7ZXnvKVSn9FCJJhMentrKOZP/QgwBWRab77MhJ9lexvLoBuyodJ
 kDSN4jIZpDnkvU6nIpvkBu+lobhxiHl2t9r80vhgnkTRM3ASuLQU+XCRn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="30391950"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="30391950"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16020988"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 05:59:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 05:59:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 05:59:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 05:59:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 05:59:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nICmmnOMrqBzTgvsCIK+MgozljpnWDn+r492j5iHcAQrSFQmgz+DXYhyUJ6WHovesw7EiphKNS/2XywlDO+Ux8cJlyZp3arwnn9yyv3G/YIfihAAfm/jSFA0gBYpD/jbeq4bTmarJpkFuNps50/lrouQnuYlXlJoLS+Ax0srszznO3AQBSoe+KpQYEcHyIVJM0tLVN1IFyucBRYcA8iMbMDDCGT2ugQei1Rf/yd3qTysB8gdyXe6O30oBl7RlWoSR8qNf4pNi0X2AY0s89uCm2F7yXVK5aERkoNB53yye0Coccm6K4qFR+/4H4nYzJzKpAci6MDIPfa5AGMHY88h6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2ts4EsRyATheILlwt6oSOXk6UKghnCqb6SeYo/8xrY=;
 b=a/jbo1vz1O1MQBhUiEuojgU4KH+v9YAwZld2d0L3+eY9m9RtBrEXyl6izpQXJC7dZbou3quEVTskXcMoj+yKHo/5UUOzWtfRwVnTGj741u7XxVupUrgHyzwRpiRQjN3reiJDjTT4wbqvP/Zzcy62hYMzxxZiakGT7qFyPoKCLg929zgEm7bHdpAoSoY1cuZrkBpilFDsfbqIJLMg2A6NWXXuc0Y5OKE29JAvHZjGxcQYUmUdJWuY7lJgcMU+qQzgUfxPFy74t+JYfFWipTQWhCeEqwbFpvfkLIsKIyLnlWMmh5tQHIGuq2nFSiOjH5stV47oP7eIKoKvZDrh5qjbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 12:59:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Tue, 12 Mar 2024
 12:59:52 +0000
Date: Tue, 12 Mar 2024 07:59:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe_tracer: Align fence output format in ftrace log
Message-ID: <eqsd62z3rr3xlp7pggbi2aytwmfj2slfgvzpu6ihcl2voolmky@o3nysw575rvz>
References: <20240312065338.1357531-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240312065338.1357531-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e2a747-32d7-4901-b1bf-08dc42944ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaYKxBoMGMzBCfMHw8wXgj1kppfFJHujQYE7VKLDDjUoFnhjLAlIk2Yszp4de+eDCFCxKzB3+zm5oBF1rAuys6XlGwebkzHo6UBkavd6s11aBtAC/u1x4EHC8aG7bhDDJVJQ72VzsKux0R1FjU6m+7z85SPJ4vSNQ1OBZZY7Z6JGtI2qdKCYSTvnAV0mVsnwiZbMzDbxEbgAkXxWGTGFNdyyL41u7v8pUMQ0YOo9sUJ3tNOnBsCMu2n7SpWE07RAjlIPIUd6sRAXRDWIvAMq6qzSrr1MG5ieLWdC24dNoItclP1PVx6ZkppDYuF7khTMPxu5hIxLGAzLc5GDIz/RUvnp0NN+i/BdivlsgA8Magjp0t3dy2fWuKK+uc3Gicbiw39ra/UYQ0UFzlIH/dn+co+pf9bl18eR/loEGTE73Lyn6O04rttE6CdcmhWFiPXBU7eMXwDwEOSwT1xzcXgPWIrP/unIho4Gr5QGg55scBmkm9mjHN7oe7hbPQ4PVUm4QPbW4uSKBww709IpwijZOVlnj1TCB1MQpdb1TZSvTaNy8IMQRhL/i564cjKMf7j+W5rFypHNVi5ZWcOscPx8hQ2/yeXUCG1MZfPLJRLesUNNxLmmlIAL+pI11v9OGdumDceUSzog+/HtLcWw6mVQukDQOdwhBH2QTA6FgrIjK8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jtARvS5MREYsgBI+vlld2QSxaErMe/6Ik1R50yLDF1bmU9Nth50xKI+awv+R?=
 =?us-ascii?Q?RjMgKoYbtwHyAlBVBwpgcBzXXof3YLktiv67IvJwHw78g7XTFkmkQW6EVJWh?=
 =?us-ascii?Q?vBa90GK0z74dgKQHZiahtZWQZranUeIOD/PcJsOTgKOPAfg2DZmJWJWTGX7N?=
 =?us-ascii?Q?Mi518isP3P/SgJLZyvu1OQRlhapM4vP6VcGdvnwzhSNUDAtJvf/sJTyioUfA?=
 =?us-ascii?Q?dJFXDFphm9Rktji+6jmX2Gg9wlpzyMDjbY8Kr3EKyC3Pvn+9uuyKk8uRV80X?=
 =?us-ascii?Q?FtB3SAj1RBVichXJlGG/VFZb37B5pD2pLHWppC1EbTBedj/10RyzKHediKfa?=
 =?us-ascii?Q?yVIpyPxeeeTe3ZnIDlLHQ1rKvrpziQ9gRhEI+jusWXsdW+ntK4+ixsSUvHEv?=
 =?us-ascii?Q?oBg81r5EpQ2826vl5UHy3i4to+D4az+TcFEBkvbkw3IFmeno56H60pS80BBr?=
 =?us-ascii?Q?RtMdu9fNcLA17CJCIw5Pk+cJ05PJDKAs96q3BuyKcy+2pIusQ1mMHguF12sH?=
 =?us-ascii?Q?uaWExzKkcWfZDy0Z9OZIrYqTu+nZBUbVVYo3KmIpBB8nw6fmrZrPVJtWIaWt?=
 =?us-ascii?Q?mXklKcnweVhvafEi3qLbpyFx/dML8NJRHLZeEF/6aKe3Z1V8nDGEfjpwp1vP?=
 =?us-ascii?Q?NWP9pljOV4KcBkaF7AMZfua3pzOzcRK1T7M/qIfO1I+MVsTb8OqkVlkH25/j?=
 =?us-ascii?Q?CgR3YeoZU9RlaxONxHRS+nAAPU6Jd8n4SZfoHRQNZU6KkqkgDkbiYJR4GgrI?=
 =?us-ascii?Q?v5F9isy0eD/h4LjQJ7YWenIVRVRJlARnBT8QTutF5Fj4ZDuGXMmN5syuMRAb?=
 =?us-ascii?Q?7lB6kXV/EoBG5YM0djecI/uYNuHKbjtt85E27txDfL3X6WWFmLJZYMti0ls8?=
 =?us-ascii?Q?YAMs/cu5bJhucxihEVQCyDe8C7QOjA3F1TOvwEMKMYeNT9etRKZBTsvL4z9O?=
 =?us-ascii?Q?K+Hfuup9e4YebXZRWnrm445V0se3NVSWUs1MwGhHrwZ+PqFAjxt8zjyiOz+7?=
 =?us-ascii?Q?w1wxuBxWI4R1MO/yZTSCO2gTHnCruKaA0F1FJeKpmNnfXSCzhtF0gWBPi9wD?=
 =?us-ascii?Q?BIhSXqduHy6ZitFb73V+wsYkzgwHMi3Tu+pSE1uT3BpiuI9hFVQa/TkHor+t?=
 =?us-ascii?Q?p5bBggYgpCiEF4idbmIfF9h+QQ1OVaWmw3L/0C/ER6NDmrY735P3PF86tMOX?=
 =?us-ascii?Q?P0RAUbcpJ/qeXAGgXqqTyv1HCE9GzBGdcilPjBvmGd/8E4t9ChK+fUpjYJsx?=
 =?us-ascii?Q?MY3V8P/oRo1ylDwWf00SLC1+E3tjeFKCJY9t2czl8GBwkBFIEHdtySc/fJyg?=
 =?us-ascii?Q?LMzKov2LnFuGpba/hTd3I/LhbsADPUJs7qbwbha2w5CCC6smUhAS5I58UZAd?=
 =?us-ascii?Q?Pdmkdm6drpTi6Er3irqZX/6KamHd/gMnvt8bSvMPaVv3ncrHbi1tsc4RShyz?=
 =?us-ascii?Q?rIbvtGU3GTREuCPe9y8euvePJ0LLHOTOPMX1oUHFXDFuRq1eYf9jRyv/Ypdb?=
 =?us-ascii?Q?o7xsMsBHp02H7y3/kW2xrCy4mvCG5hDSy5jCPas4HLnZalpMQbseunvx8CI5?=
 =?us-ascii?Q?1vPD9u2WfzQO6MpqYzIRJftxfPG0kj91Jjd5/P2/qS6rBnGv0RxE7RoLj/RV?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e2a747-32d7-4901-b1bf-08dc42944ea2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 12:59:52.3321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEPOcUzeShE+x9TolOxpK1kUnA+VpCWzXHB3xXGnqqc0vwXmdIOpZhINGWgN1lt5QT9GivbHLdWxv0NV8a3Kx7Cv8GbaCiknfnkWGmvkt/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
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

On Tue, Mar 12, 2024 at 06:53:38AM +0000, Shuicheng Lin wrote:
>The fence print in xe_sched_job class is with "0x" prefix.

it's actually xe_sched_job that got missed in commit
7a975748d4dc ("drm/xe: Use pointers in trace events")

Lucas De Marchi

>Add the "0x" prefix for other fence output, so that they
>could be searched in the same way.
>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>---
> drivers/gpu/drm/xe/xe_trace.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 4ddc55527f9a..c3ac3b2bad3a 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -36,7 +36,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
> 			   __entry->seqno = fence->seqno;
> 			   ),
>
>-		    TP_printk("fence=%p, seqno=%d",
>+		    TP_printk("fence=0x%p, seqno=%d",
> 			      __entry->fence, __entry->seqno)
> );
>
>@@ -359,7 +359,7 @@ DECLARE_EVENT_CLASS(xe_hw_fence,
> 			   __entry->fence = fence;
> 			   ),
>
>-		    TP_printk("ctx=0x%016llx, fence=%p, seqno=%u",
>+		    TP_printk("ctx=0x%016llx, fence=0x%p, seqno=%u",
> 			      __entry->ctx, __entry->fence, __entry->seqno)
> );
>
>-- 
>2.25.1
>
