Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC18EE49A4
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 14:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911FB10E378;
	Tue, 22 Aug 2023 14:17:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8E310E37B
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 14:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692713827; x=1724249827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UUN+hOfX9txCpzFeI2jFkehUzKpOGun9EVdOR4wwEq8=;
 b=JPWDQqY//WHjzopWQ9JaKr9J+N7rrXQ5n1BgJmqkfXgqoDttbL1jfwSt
 SA2PmLeuspSOqRZQ+3rJX5rY17Zagy7gbixQxjJEqXvtARHNGetFeCBtW
 P0Z8OSaj2kCjN9Hh5HzVmitNujtAPBsjmTdSenH7wPwCsOvFEWJtCzsDW
 GJBDSusffJHyvn0l3URedED3Jsq+W/EZ9q/x5CvURzJ8R7tydAKoKELNh
 avQEdquNNe76yuDk10VD+n3KufFx/gsN4FldOM939RcE+varu9sz4bd2J
 vLDOu9dzvuSdpNkGjtGU1rSC4bsbqhpxGKDLpUWzE8dVeQZyfyff2mGzq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364058893"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="364058893"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 07:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765747913"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="765747913"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 07:12:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 07:12:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 07:12:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 07:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QC+Jxa1wkzVCrsyMQkcfAJhx6OT4Vp+UNwlnMmREZnZky22qErKNW0by1+5AxPH5y9t5X1eWMAzSp0uF7ZMpeQksGP/keNPXrAK+fOICfQthZ7kWPomC3NYoCkUXfw/3RxRNL0xH7+DCIq3uReMppdWYZn9WcodF2WKriTdvUSphbw3kmQau67ms7mJzXBwz4z4uXSfQBkhxciNTfH9RzAu9oyGdJKN6S6RRcTEdWKImpchQDULS6pKjWaCQ5MXKINuJ7rhDYCAj7NXD0RpTpAQz9UKb92JzgWPjZIPRdUVqkHK/XqH7YiWQ3wNBxxJnth+KVIT2HQAMnKtbFJaALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zXufCYLn+v/AZXrBRJM1ahOlAwH0Lk0//UXBoLOL70=;
 b=RZ7Q1HAq7vPze5rnAMGZcmSX+uF+dinvEzqcrh8JBSumGeGEparGXBi8cF7g46dtQdSxyiDwj1hbrsNFMxy9bLvo+YaDsim66zExKXeVRh7fuBOAMqDHgfFwlSXnxl6Vwn/xVY16aU/1sJrCT+n85ElpbwRbRSw0CgXvVg74QYM6wYEEYTxio3L+3CfmO8f6wFItWm8VpSd53sQWwjNQnL92LYU5UsH4iwT/LVnH4XCwva0+nY+nnp0yoJSCyUGTgyLwGotE/uMuZ4s2oyPs4omz2A5CFJ/psufDwZeSZ9rA35+IwB7Uidasv4JOKLNvtrsg98zsnHuXk1ZhuFb/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:12:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 14:12:50 +0000
Date: Tue, 22 Aug 2023 07:12:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <d6uoulsbl5l7uibznwqy6jkrcp2yctoryre67xn5pa4znolrb6@skw5zmgvydtm>
References: <20230821234322.758689-3-matthew.d.roper@intel.com>
 <20230821234322.758689-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230821234322.758689-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0377.namprd04.prod.outlook.com
 (2603:10b6:303:81::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6a3070-3cd5-4f43-a197-08dba319de16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tW2Y8xnGwJ+7vpMg5xsRdOjN2Y9lL8JAZlwl42PVN89ItFlMgp/7hikKhbiB7g1cxYQvgTBXxAI1CojvopD9eke6GUfI/p8n7oBDp2vB+bAqK9yTbuVo+l5zbuShttIwgYXEH/a0Ua8fa8kPsiIyhtZ/46ChUL/K4pa7nA0rUH1SFUspLwhwITeLiwH6bhus6Qojt04ZFS6scIBjNG86VN++KBAsTZg8WkTZP4Bf7EgIgvexGcQemuweMft16rTewOGIzv995JaGCiUn7ED9GrwAbIG6BRqyIK4wjKkZxlPhVokLMy4kQdheeGqvDFLc6Y8rGClkj+SDDaOa5iCTg2nkuce6elCtKyBQKjDH2BaJ81yZy1L2aUhDAdxRpRDPy+NwMaYOBNPQflUXSz6kc9l8+G5/KRHyrxcWqLIKWMwZi6AMRKan/TFxE8kBApJLFndT80mzlaUZz3P65LkZdRa/B+CWr+sOI5k2OW3tsDS+4OwXRysF6bMoM/+J5F+1JjSRC1+Y0BSIZukqZgCYLiFCqwDDn8lGnbC1YbRdKDs+u3kIIyTSwGo19BTqaLxD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(6512007)(6636002)(316002)(66946007)(9686003)(82960400001)(8676002)(8936002)(107886003)(6862004)(4326008)(33716001)(41300700001)(478600001)(38100700002)(6486002)(6506007)(83380400001)(2906002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nXe1bKuxlxCV1Bkg2alPhZrAZLKXiUBtGUQnX/1oi3kDSEd9e9WKq5ZAocRB?=
 =?us-ascii?Q?bgqtJ0AnQQYfSJk4wdzIIX0ma/J97eWODJSSynqj9aLKIrZPe+7iUEbbaW6+?=
 =?us-ascii?Q?y95/eXZWVzHdJLguGvUnQqQCsCPDlcXCDJy7F4ybckPefXsK+pOMaUYa7Eup?=
 =?us-ascii?Q?NPTmUceCM9eZ8PdwVuLbazYDxkQZmcW/cWTo4Lxqat7jvuGlx8v3ynbGzgEg?=
 =?us-ascii?Q?N5eLKFP0tMkgmwTw/ZPjgkgqpONVI8fShek0lzPEGh0hpnItIbb7LVc32VyM?=
 =?us-ascii?Q?Atm1lF5+XJwdgHEFKZwDxeoalp41mPMOH4731JzyvJskmoyUj5cwken7jUm1?=
 =?us-ascii?Q?BmZO0+f+zB0wV4NZLh7oHeqSnrgjEAY/2JCHsn9ktECVe9HaWmITicKVlbmz?=
 =?us-ascii?Q?xIUKQUjhGdHkumKUnkJ2XZCvbbm/8w005avDLmabve7LAD7V4r/VG5xtFdQ+?=
 =?us-ascii?Q?9M0YVmo787J58w8oDeBN/vGNA1rtdW//GhGIjPtYsPnuBoGH2NIv76OOhrRr?=
 =?us-ascii?Q?2WimR2EKAoreu4GslUuyrXpin65ecpEYrOnkicQUG5Uzx0UDayIJ8ErSZOfu?=
 =?us-ascii?Q?37uANFCvWNkP36TJbAIbrz0r9U9HKqvio75Tji2vMPFULRa+zndhgUt0TbYq?=
 =?us-ascii?Q?AJH6jDkXZOd5Gz2gLWX9ghacua97vgjrb9SeRVqOh7+0zMnhFGXA00zK9WP3?=
 =?us-ascii?Q?JPJXTu0A91ZnHbmvcsGyf6uO7GA40Ra9pU+RUmK30P3r3btQDXFnsV93O4PN?=
 =?us-ascii?Q?XecQSPREfHq8A49OvsujLSTYUllmD1CfwEsmKFbves1J3d77ii67HRhxs3Cx?=
 =?us-ascii?Q?VOmPxfCZ2LODv4GrvsDW2ZdpEi5pQGsikrhYH6RxunluHCCim3QBo72swREa?=
 =?us-ascii?Q?cFtfEYyuqqELo62/3X5QlL2SRwbjjOQMsq7BzpaXiGz0aFcLfWgAuvRmpLdh?=
 =?us-ascii?Q?MsSgXp8IZBlY/mbY4uLZilgjg85By8cfnEM/YTldvom61WhYOyGweP0hf/UI?=
 =?us-ascii?Q?g6BcKCj9CV91TodaabpSolO7OWwPeXHTdhT22a0eVVeC6V2rfKc+Jj+9x9QH?=
 =?us-ascii?Q?Qp1bntuakfzhMWNvrTz9VIAT0uKGFCGyUH/3M3KcToTSYD4o+0C4C1bNh4uD?=
 =?us-ascii?Q?v4F5IGIig2g0E0oXFbaYxxcqVpHaCa22RXXwF+VlxUbEXIKg0+ndOU8cYznn?=
 =?us-ascii?Q?/zon1EMJYK+26/5+4uaK/8YKttBPB+vCAjzwnTlN3coJ5S4GYdryFWEYTIpx?=
 =?us-ascii?Q?ARuJ6yM7Km8NZODjDVwjchbuFvZ1ZqO8pB6uKKTzYJowSVdEnyafgqQoB3rY?=
 =?us-ascii?Q?Oq7fXNO1B7Nyuyz+GUExyhmiBrVzY3UHJfzvNGsCLMS/9tnAMWW6o9rupWiV?=
 =?us-ascii?Q?NlvmpGJjpTxpretbI4HjOkQ9ctW6BED3aarALEfqnmztGwTkz9JtC3Dv38D6?=
 =?us-ascii?Q?oEvGdDKnx5psGXtl3kHroG0P8RbXHt6pKO0XPqKH68S2eUfiInCHyOzjG2N/?=
 =?us-ascii?Q?bkeHoDlxD0fWsiLwjnCoLnRBJwzWGTo0YPQfCwzE1scOGO29Y79NKG+XGZmT?=
 =?us-ascii?Q?VGIV88rLTTJuAWExliqx+Uf7paeHHcboznKVKdUDfujLlDSk10V1e8VbVjZB?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6a3070-3cd5-4f43-a197-08dba319de16
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:12:50.1667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDLEbjHBudzQkZlPcAwLfdHO1ZZYikTuaK3ezkeDHwwvH6GTOGtmax+7LdHrpcGh22A+tjG8TqhT7uBYZe7CD7hEJujYtcXIgwnKIxCea38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop xe_mmio_write64()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 04:43:24PM -0700, Matt Roper wrote:
>The only possible 64-bit register writes in the driver come from the
>highly questionable MMIO ioctl.  That ioctl's register write support
>only operates for userspace running as root and cannot be used by any
>real userspace; it exists solely to support the "xe_reg" debug tool in

mesa also uses it for some operations to avoid the extra latency of
setting up a bb. Have we confirmed none of those accesses are 64b?

humn...

	mesa $ git grep DRM_XE_MMIO -- ':^include/drm-uapi/xe_drm.h'
	src/intel/common/xe/intel_gem.c:      .flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_64BIT,

Should we turn those into a 2x32 access? There was an issue in gitlab
about completely removing the mmio ioctl, but that got blocked because
of these kind of timestamps read.

+Jose


It would also be useful to check media and compute drivers


>IGT.  Since the spec indicates that hardware does not officially support
>64-bit register accesses, there's no reason to allow such 64-bit writes,
>even for debugging.
>
>Bspec: 60027
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c |  3 ---
> drivers/gpu/drm/xe/xe_mmio.h | 11 -----------
> 2 files changed, 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 932aa4ca59c8..568cd106d0ec 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -490,9 +490,6 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 			}
> 			xe_mmio_write32(gt, reg, args->value);
> 			break;
>-		case DRM_XE_MMIO_64BIT:

if/when we can remove we also have to remove the DRM_XE_MMIO_64BIT
define

Lucas De Marchi

>-			xe_mmio_write64(gt, reg, args->value);
>-			break;
> 		default:
> 			drm_dbg(&xe->drm, "Invalid MMIO bit size");
> 			fallthrough;
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index 892e96e50463..7c525d27cafb 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -75,17 +75,6 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> 	return old;
> }
>
>-static inline void xe_mmio_write64(struct xe_gt *gt,
>-				   struct xe_reg reg, u64 val)
>-{
>-	struct xe_tile *tile = gt_to_tile(gt);
>-
>-	if (reg.addr < gt->mmio.adj_limit)
>-		reg.addr += gt->mmio.adj_offset;
>-
>-	writeq(val, tile->mmio.regs + reg.addr);
>-}
>-
> /*
>  * Intel hardware officially only supports GTTMMADR register reads of 32 bits
>  * or smaller.  Although we often seem to get reasonable values back from a
>-- 
>2.41.0
>
