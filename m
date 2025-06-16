Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFCCC71155
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 14:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EE610E3B9;
	Mon, 16 Jun 2025 14:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gn14qajz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FCA10E3B9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 14:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750084692; x=1781620692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K3XBs4aVhDRbEOkhzT84KbOT9lvy9acxYlbUTHaT4zw=;
 b=Gn14qajz4u2Io+4fVYfMq6oPnXwRxfQMEDyspw6N9C/L+3YDN5GFiXRG
 CCr29WQRIy96GaewUuQdsbGEDiUqXLkD5W96ocXvqNsXfA8aD4aYpBV16
 JRtkQnwv0pbpIPnVIgbyJ4CNjmf0LTVoYOexERntRFaenITgNO/cIGQt9
 Kybn/lZqrCiCQSqLjt99TfZOeE3ffIRkswTowSqsrazH1OrG5A8dtvatW
 rNHhUyf8eCnrXEXsPFXVW/e/lPL5MCpZiqO/xTIcCe0dYvSTnZMV03zqa
 gH5jt2A8iYSxbB2eJHla9WP8d/xDO7YQFzdeQbZDjAeNwzMRYPZDv8xTg Q==;
X-CSE-ConnectionGUID: yQg4tZOxTHu/FHHlEGhxLQ==
X-CSE-MsgGUID: +Ygp3UThTqi07HYJPK4dMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="74765974"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="74765974"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:38:12 -0700
X-CSE-ConnectionGUID: KxwKJ4S1RRSfDYT3Msx0Sw==
X-CSE-MsgGUID: jLnCZYzVTlW+J98weOTnVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153246034"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:38:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:38:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 07:38:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.65)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRFRExdcnsQjjTy6xl7RRDCxsyJDd4ags14foyQ+fusoqpeDmxg7tP0ZrM8tIstiYH2o1kVX3n0iQJxCB/l33UUyz9nl9mBDD34Cupd38aSsG/iHQcFSlC03g1AML5ASsnEDjzJIIuext2XHoL3a5p+M5gklJczVjhMvgxhWJbyeCeV3KZ0KUlyQR9Kpi0ARN9iRJ3lErGvlL8mvDMRPM90gac5068+Um4QddcvkTYKXBRpKftLltdDClPAprS26iQJfVDxE88YcdZWlrSTnil9ofx3xQaamO6a10UN5aUUe/kHw961ZUTf1Er9AzTjyl4wzW8h1Z37FCM8Y+bpgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfhUPg+gtTMOcqb+ssKnKVScVzDBRGbsj8UA3IraQHc=;
 b=A6eRf8Zd9kTIshLZ6D8uME5Jx6cBPbXZ9HFS1pMnyAjPnHMAMySgqc/H0JfZcJh9hvcIiavEY5WuWexkHizQ7AEILjEbhkWJ2dtnhjgoCAML6E0vv3R/ILVj9EbKGE3UIc4bp1pOsPvPXRzBjF/ucIfQFg6nd/LXKR2X1ojRf2X23en97Ro24K3riNrdkte3nUrQCGigb7G/88Lgw5ASRWjWWPIU5lqb01uLwuJFxlCvrQHig9/Y2SPS6ZB68VMC9uVSpXrwmW2CaJgmGlcoW4SxvMkIuLVempfS2nOFViy0cArartXPmfP8KmiXYztsiu5sS4VTdNZLtmfSptFajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 16 Jun
 2025 14:37:54 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:37:54 +0000
Date: Mon, 16 Jun 2025 10:37:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 "Stuart Summers" <stuart.summers@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/bmg: Update Wa_22019338487
Message-ID: <aFAsPdQ8EsSdNUu0@intel.com>
References: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
 <20250615-wa-22019338487-v4-3-704830697cbc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250615-wa-22019338487-v4-3-704830697cbc@intel.com>
X-ClientProxiedBy: YT4PR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PPF529E923C8:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0c91ab-19d9-45db-e771-08ddace360d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?02Qzbk9qqBVrGvpy5heruf9KyVm20Gp/inwLMA9e/m6HakgrT8gYS0jfSr2v?=
 =?us-ascii?Q?U/NtQ9nXjt943KluYZ7j44vpWTs1ySlkk1h3cmKMEuMTCvLxPjNMxFOQKy7R?=
 =?us-ascii?Q?q6eJ1HKrhUt5Zht0ul8rBY+R2IcqwSCZJRvijPmQ98xSKCSsdmh8gJEzRNCi?=
 =?us-ascii?Q?0TIBZGywNEAUjbt5hRXwlZSW67CquhPaNC+YYbpPYKeGwI/UVb64XrRK5dgC?=
 =?us-ascii?Q?m4CX9MrK+JsESyxk2KfFFKTuwY97W9br3fmZ66DRoILPpZVqHfQNZdX7ycuV?=
 =?us-ascii?Q?A0v63jBJQRtkw30DrYLrHAszHu0L17VC2FXNFmYug30GCtpZDcaa4lk3XVXW?=
 =?us-ascii?Q?bdcNUXF9bG72b3PCWTY7pOO0EyRe/1Yn1EcX/kRnkOXYKouz8ypR/6r4FB6C?=
 =?us-ascii?Q?mTXa5yYTGmMHug9rpjzcWd2QxKYF2D200NTmvFMwEkaRtcoih0+Gn6pq3Lcc?=
 =?us-ascii?Q?0x94qtZ+0wOMsB0UNrQGHQ1jTS3h42B/aVW5zf4J0cMlrKcarVJzqymZ4RC9?=
 =?us-ascii?Q?3mM74Kz7oIUUSdU363K7H9qNW/hkqrKzEDuaoBhTKc4UsNZECol2vmLBaYOz?=
 =?us-ascii?Q?l3i5SHw6fJWTO5gQdIvXzfQQ/KKMhpQbvRZrFQFzl8w4LG2ivJUiikC6gmAc?=
 =?us-ascii?Q?GVk8Dgu3zGRdPIVXxLuBMMUayXLVYfLdsqMPPkcdMRJpyASP+rlamcpWTer/?=
 =?us-ascii?Q?5EXBzB3x6vqG/bvKi2i3X/ICreeHxVCC2m8ex2C/qWbqeTvBCrRnNyvZ7Q3W?=
 =?us-ascii?Q?MfkY7oyz6bQVuD1lF2hMfeHr9IWIZMoVqeuYJdtr6rxQKMJkCzIVaDdCTEp5?=
 =?us-ascii?Q?rHOKWo8qFJalK1d1WRG9ZoJzbrnAuwoJ3phJWdhgcbVT00/ns+wd4w6T8Il+?=
 =?us-ascii?Q?JQgn7JSL+FgXPJH055ZbNnjlHi2+QYg478aPV0mFtxDHlLjPwiEIBVjDtDxK?=
 =?us-ascii?Q?GBb4T+GEiK8b0O0QPAEdM9a12blCLERDkhV+mZWfIREHg0WuK2g8bDar6ZWn?=
 =?us-ascii?Q?zZ1pfQlcgSWuHFBA3jUXivmhl7IHAZ2f+JyJKA3nAfkIEMTlTGHjrGsZOMV/?=
 =?us-ascii?Q?e843yMEsqsaUOQx76888S7fyG6q1eFxzwK9xAl3AqdLVzs619qHs+YUKcdbn?=
 =?us-ascii?Q?6zOYO3iJIdCYP5Y6aL64lW+qHgDGemoR8+zdfBDWCqIDfbR+qrGQXt77lbOS?=
 =?us-ascii?Q?1OOyQqlzPgQ8mJ2CsiJJ/qLldzmvouwIvflLl9haGToCcKUFRJIJ4YKKb64u?=
 =?us-ascii?Q?9aHKHBXxHdzBbMTCGD1lsBs9FxSpGEJ4djNj/4rTEJ7WB2pRG1YPS+CdOlxW?=
 =?us-ascii?Q?6J9IqLxIJP5SRD4WajAM7upn+r/QIkwpLDIln7zW6viBwHOdnxyNOHUADm6a?=
 =?us-ascii?Q?7ltGS0V8XFgHKW8jsN3OnyGsphIsQTEnznJB52Q0BDBc8ATjPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w+YbpOOGzdu6/icKoNC6gQg2rnIUyqO0mraMxr1I/sAMs5tqBiwuUl/NkHEH?=
 =?us-ascii?Q?ZT3REHS5BVybov+S7v3XatGNb+bpIJnf+BOWfn7Op+pccny9eLekEL5wiOMU?=
 =?us-ascii?Q?NnUkZhyxnI0PddwQb58Wl7UwbbZUccYseSM2WKNki/utKfRK+giB7JJx5wgq?=
 =?us-ascii?Q?H/TJvU6xaKaM1n/JsB4ofgEU0CVpAVGKUVk9ROlDZ/JVO2lzN4NaebJwZyYu?=
 =?us-ascii?Q?o6WYXyCnfCk38R9cDm+qYTArt7jm7j7r4bXJxQ0xbNDslNadek8mje8nAxsg?=
 =?us-ascii?Q?pB8ew0gKseBKLjDavS3cN1LUgEg4XqepWWoA+xhcfZoF51rFEybPjTQEox1L?=
 =?us-ascii?Q?co82YtFL44OjZi+SqS8BU4IabBTEUkQtWQhc+hT2bzbEatOu/BE/9R2fE6Sh?=
 =?us-ascii?Q?51gtRunOI+VpzEQFvQbgfvMG0gSt+Z0I7g+9pmH5p7ynu3llQNE6sny3AStq?=
 =?us-ascii?Q?0Kla32vSagWTu+lhbJmb/oMaNW4Zs9pnLOceE9lRO/0NjTkviQSDrBUzjP4Z?=
 =?us-ascii?Q?XVM0q7hFVhDzAdJCc6VkNAjxkRgoIuZfjOOsnQ8ZVxaA3YOMk3OIQEJK6VP5?=
 =?us-ascii?Q?HwrFr8tYC3ajtNU7799ewtIKqJr+JiT7S5Q+JqFr6XBVFs5c9twYjTGCEMVw?=
 =?us-ascii?Q?4DCwbyDG7d+/3etf44cPeogP33xYEwfEKXiomKz3Mp+WX5H5A3ycROoMQJKC?=
 =?us-ascii?Q?m20q/6voG3xiqPCj98JwnsuLtYHq7pTZke562lSoDjssLw/3QgVbZVVYBqqy?=
 =?us-ascii?Q?gJ3gq5+w3BzwLifNBesdyEL0Oam3dS1FOKYijCuUD5l61ZB7SRG39D+OuZ3Y?=
 =?us-ascii?Q?9cqeDW+ekLj/XdLiGlW7+2fERI0SytZjrv9pgNSKLnumJFQQ91kEMbmh3C/M?=
 =?us-ascii?Q?/SV0CXsH2sEj9+WIPTJ5GJjJNm9FX9f89H65HllLkLCGcIRRJKl8RFERJsb+?=
 =?us-ascii?Q?qZwjEib/91qE3KG/OcEV/iyVSshP/1wZN5g9ZMbL4SvrLm144KMJYFFfjzLS?=
 =?us-ascii?Q?6fPYJUq5F4ejZ0TeI6055VypTH+FgsrmRIqCtOq9IBjBaYicZYGPzVpPEfff?=
 =?us-ascii?Q?z8+URtR4I/9sjU3HseJA7GKutPuEcm9PYtGmKDvaiLQBw/h887Zsr2C0UUMa?=
 =?us-ascii?Q?jOv4B6x/wz0cNHnacaRdzkqXvq6il1SmutiKgU6b5HlNQk9H6SEn2HSXIloP?=
 =?us-ascii?Q?Qb6pv0MDQixHhXqHFnqJdYHwiEeN1XNsAlItV0kMLJ1vqkmbueZK+b6ZP8C8?=
 =?us-ascii?Q?9SltCjXIgrWmX12woV2QqxBtkXOkGpDQ3FqN6jPFwIkYPvB6kKrwwWuzBgFI?=
 =?us-ascii?Q?o4gJOw+NYeCCfNNLBffXfQbD1cWrfZhqc02TuT+23ZPHhoyloqCnW9I0AKEc?=
 =?us-ascii?Q?mGMH/zIKrtG7H6t3G+OAWRMua4mNZkSepxx/0+4PZwS7W56RVWA/bfTV+Uol?=
 =?us-ascii?Q?bQ9ufFtqoA3tOqYjFF5+52C5Uc9YAeqDDH46BbpNFpaAh/vw+6YpDPCqRy+I?=
 =?us-ascii?Q?ttFr76s7prN0KyIDqdwPn1oK5256itcHSCmfG/w7aAUW/pOL04xPxTR5UV45?=
 =?us-ascii?Q?aJjmTh+A71T/XtWNv+kZzdUme6Gb65aaP80Rqg4i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0c91ab-19d9-45db-e771-08ddace360d6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:37:54.1698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okYl8gKKaBmfx299XxSjZvKlB1w2d7IGh67NGEIY5euXuua28gcKaLKS+X4vcDDNJzK2znBISGCwy6MFBFyySQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
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

On Sun, Jun 15, 2025 at 11:17:36PM -0700, Lucas De Marchi wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
> GT actual frequency is limited to that value before performing the
> cache flush.
> 
> v2: Use generic names, ensure user set max frequency requests wait
> for flush to complete (Rodrigo)
> v3:
>  - User requests wait via wait_var_event_timeout (Lucas)
>  - Close races on flush + user requests (Lucas)
>  - Fix xe_guc_pc_remove_flush_freq_limit() being called on last gt
>    rather than root gt (Lucas)
> 
> Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  13 +++-
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 125 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
>  4 files changed, 139 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7e87344943cdf..6ff373ad0a965 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -40,6 +40,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_pc.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
> @@ -1001,16 +1002,19 @@ void xe_device_wmb(struct xe_device *xe)
>   */
>  void xe_device_td_flush(struct xe_device *xe)
>  {
> -	struct xe_gt *gt;
> +	struct xe_gt *gt, *root_gt;
>  	unsigned int fw_ref;
>  	u8 id;
>  
>  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>  		return;
>  
> -	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
> +	root_gt = xe_root_mmio_gt(xe);
> +	xe_guc_pc_apply_flush_freq_limit(&root_gt->uc.guc.pc);
> +
> +	if (XE_WA(root_gt, 16023588340)) {
>  		xe_device_l2_flush(xe);
> -		return;
> +		goto done;
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> @@ -1035,6 +1039,9 @@ void xe_device_td_flush(struct xe_device *xe)
>  
>  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	}
> +
> +done:
> +	xe_guc_pc_remove_flush_freq_limit(&root_gt->uc.guc.pc);
>  }
>  
>  void xe_device_l2_flush(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d449eb0e3e8af..eab932655b2fb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -7,7 +7,9 @@
>  
>  #include <linux/cleanup.h>
>  #include <linux/delay.h>
> +#include <linux/jiffies.h>
>  #include <linux/ktime.h>
> +#include <linux/wait_bit.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -53,9 +55,11 @@
>  #define LNL_MERT_FREQ_CAP	800
>  #define BMG_MERT_FREQ_CAP	2133
>  #define BMG_MIN_FREQ		1200
> +#define BMG_MERT_FLUSH_FREQ_CAP	2600
>  
>  #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
>  #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
> +#define SLPC_ACT_FREQ_TIMEOUT_MS 100
>  
>  /**
>   * DOC: GuC Power Conservation (PC)
> @@ -143,6 +147,36 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
>  	return -ETIMEDOUT;
>  }
>  
> +static int wait_for_flush_complete(struct xe_guc_pc *pc)
> +{
> +	const unsigned long timeout = msecs_to_jiffies(30);
> +
> +	if (!wait_var_event_timeout(&pc->flush_freq_limit,
> +				    !atomic_read(&pc->flush_freq_limit),
> +				    timeout))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)

for a moment, the name of this function got me confused. I thought
it was going to wait for the *exact* act freq, and then it would be
risky because we can never know what PCODE will decide on extra
throttles.

But I don't have a suggestion for a better naming and reading the
rest of the code showed it is doing things correctly.

There's a risk though... if for some reason PCODE decides to keep
freq high for a longer time... but likely unreal for this platform.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +{
> +	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
> +	int slept, wait = 10;
> +
> +	for (slept = 0; slept < timeout_us;) {
> +		if (xe_guc_pc_get_act_freq(pc) <= freq)
> +			return 0;
> +
> +		usleep_range(wait, wait << 1);
> +		slept += wait;
> +		wait <<= 1;
> +		if (slept + wait > timeout_us)
> +			wait = timeout_us - slept;
> +	}
> +
> +	return -ETIMEDOUT;
> +}
>  static int pc_action_reset(struct xe_guc_pc *pc)
>  {
>  	struct xe_guc_ct *ct = pc_to_ct(pc);
> @@ -689,6 +723,11 @@ static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
>   */
>  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>  {
> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> +		if (wait_for_flush_complete(pc) != 0)
> +			return -EAGAIN;
> +	}
> +
>  	guard(mutex)(&pc->freq_lock);
>  
>  	return xe_guc_pc_set_max_freq_locked(pc, freq);
> @@ -889,6 +928,92 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> +static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	return  XE_WA(gt, 22019338487) &&
> +		pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP;
> +}
> +
> +/**
> + * xe_guc_pc_apply_flush_freq_limit() - Limit max GT freq during L2 flush
> + * @pc: the xe_guc_pc object
> + *
> + * As per the WA, reduce max GT frequency during L2 cache flush
> + */
> +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 max_freq;
> +	int ret;
> +
> +	if (!needs_flush_freq_limit(pc))
> +		return;
> +
> +	guard(mutex)(&pc->freq_lock);
> +
> +	ret = xe_guc_pc_get_max_freq_locked(pc, &max_freq);
> +	if (!ret && max_freq > BMG_MERT_FLUSH_FREQ_CAP) {
> +		ret = pc_set_max_freq(pc, BMG_MERT_FLUSH_FREQ_CAP);
> +		if (ret) {
> +			xe_gt_err_once(gt, "Failed to cap max freq on flush to %u, %pe\n",
> +				       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
> +			return;
> +		}
> +
> +		atomic_set(&pc->flush_freq_limit, 1);
> +
> +		/*
> +		 * If user has previously changed max freq, stash that value to
> +		 * restore later, otherwise use the current max. New user
> +		 * requests wait on flush.
> +		 */
> +		if (pc->user_requested_max != 0)
> +			pc->stashed_max_freq = pc->user_requested_max;
> +		else
> +			pc->stashed_max_freq = max_freq;
> +	}
> +
> +	/*
> +	 * Wait for actual freq to go below the flush cap: even if the previous
> +	 * max was below cap, the current one might still be above it
> +	 */
> +	ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
> +	if (ret)
> +		xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
> +			       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
> +}
> +
> +/**
> + * xe_guc_pc_remove_flush_freq_limit() - Remove max GT freq limit after L2 flush completes.
> + * @pc: the xe_guc_pc object
> + *
> + * Retrieve the previous GT max frequency value.
> + */
> +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret = 0;
> +
> +	if (!needs_flush_freq_limit(pc))
> +		return;
> +
> +	if (!atomic_read(&pc->flush_freq_limit))
> +		return;
> +
> +	mutex_lock(&pc->freq_lock);
> +
> +	ret = pc_set_max_freq(&gt->uc.guc.pc, pc->stashed_max_freq);
> +	if (ret)
> +		xe_gt_err_once(gt, "Failed to restore max freq %u:%d",
> +			       pc->stashed_max_freq, ret);
> +
> +	atomic_set(&pc->flush_freq_limit, 0);
> +	mutex_unlock(&pc->freq_lock);
> +	wake_up_var(&pc->flush_freq_limit);
> +}
> +
>  static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0a2664d5c8114..52ecdd5ddbff2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>  int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>  void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
> +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc);
> +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc);
>  
>  #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 2978ac9a249b5..c02053948a579 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -15,6 +15,8 @@
>  struct xe_guc_pc {
>  	/** @bo: GGTT buffer object that is shared with GuC PC */
>  	struct xe_bo *bo;
> +	/** @flush_freq_limit: 1 when max freq changes are limited by driver */
> +	atomic_t flush_freq_limit;
>  	/** @rp0_freq: HW RP0 frequency - The Maximum one */
>  	u32 rp0_freq;
>  	/** @rpa_freq: HW RPa frequency - The Achievable one */
> 
> -- 
> 2.49.0
> 
