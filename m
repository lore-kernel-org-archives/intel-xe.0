Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6E6D41D51
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 19:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4561510E629;
	Tue, 12 Nov 2024 19:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXyCdQK3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F7010E629
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 19:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731441464; x=1762977464;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=th/gEMXaqxkzN+1rBLrHzu/a8DKMZSiSPyGQv0/GAxM=;
 b=CXyCdQK33vIw9VcogwEql86rCzWCu7+4X5yQaJ6W+eR9ROHITkbpJ8gi
 AliBEhHGR+h0CXdK+Sl4okF+BqRvRrJtTYwHjHxPex4XjaIZ0WHJDUwze
 VesgBzfbbLonnqS9jC7ywGDshTZC7yjWMyu6J0kW/9b70gbtTPqZ5K/Xp
 0ulMkPXIb0kdmyTGuozqTwCb9s94zwKzVYdsny14dWJErPK2EYeGiphSK
 IAom3SkCK9GOsZTZ/3ImBfd0zaynTbylfbPQ66bSjUx6nWBxsXlWCkp4G
 NnIraPrSWYWxN1E9/so1YLnN1fiunAtyQVeDNx3dy9Y4DfNJ/ZPg5LUQ3 g==;
X-CSE-ConnectionGUID: nhtq95QATUC8HUaJS4IFHw==
X-CSE-MsgGUID: DV3QDfDMTUWpOOU6sbAieQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18912804"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="18912804"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 11:57:44 -0800
X-CSE-ConnectionGUID: ZWnk2AoKRo+el+c84x0nXw==
X-CSE-MsgGUID: kG4Rg/BGTbGHmjSDrvUFAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87791870"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 11:57:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 11:57:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 11:57:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 11:57:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdfFwA+xjmt8EBKpRkNlRDvCbNrMuaa3n0Zu1HonMAlpzg4qnb/YTpbSTXSJ/TpbM8tHDZKJjL4vyu1Ulh/T+bqcYwvJtJsqVPMuCP+KuudZakeCY2dipaQxHJfNodwsqVT/4hUUBhpFtH6DRr6LwdQDerN+0UHsqrFDUwXItwjxvKsBcs8mDMbB6LSiz/5U9nLn4WI5xDryXLWrFRlu8so989xuWkdT7HhmoLKdE5JGa7N337hLpbxRKL8YPJS0cNX/hWDerv/QEWJ02Ae+ZW67WY8DowHTGHvIMlzW4kmKcuHcYBOPQxiTT/+jsVVsGjXRYronR7k2vet1ax4B8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYC5ygRPNalXxzK8/NUrsyprfqiMGSC1QxSnwxbt2bs=;
 b=Bcq1ybh5buPfy0Cv0qvD7y1/Me+eynF/a2EOowYDBxNXkP7IPVbq3NwmCkPurPm02YgjaoZWwF69TGFHpqC8IiKwYiAyLyrH4uOeXS7teRicteqSKD7nUxK4N0Be0BrwKnY8fL3JaJofyz8WWRG1KpQrL5ZWEbOSqIxR5oc3Y8idK1XXDeYmMbGw7K7uBbDPTcVuNTSDiRXRfw/8/vXqW4Gvt7h+Gg46189zszpL8KNnsDKJRpKkaE0fbUAsxRqunUAeOUK49F325FYLNGfnmkpHy7yeGDB6HRvl9+1d3T8XuNdnlnNbgOzt+zevxRseohkrfZz/DOKcl9MyaW2KUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 19:57:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 19:57:40 +0000
Date: Tue, 12 Nov 2024 11:57:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>, <matthew.brost@intel.com>, 
 <zhanjun.dong@intel.com>, <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH] drm/xe/xe_lrc: Rename desc to addr
Message-ID: <20241112195737.GH5725@mdroper-desk1.amr.corp.intel.com>
References: <20241112185515.64060-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241112185515.64060-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3e0cf1-2fed-4d4f-fae0-08dd03544395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Quvg9YrGwc5cR0cMJgEWt270tR7/xnM9n3GQTyhyJd9P6EXhOiThNfEaMue?=
 =?us-ascii?Q?Eexs15N/9s71PpYuPl2i//ooDQtNZGlOgt1XY2zqino3li2HyC5zAxhNLbhm?=
 =?us-ascii?Q?kJjqaINLYHw1+RfzQNVTyzUYCADHBoZw++z372+nBA8STvUFU28bTBExzwbo?=
 =?us-ascii?Q?IA2ZWkN2D8cDe6FXeqDb9OqsCJXEEjG1OrDvaaBYAHSLzsaz9ItyJenebwWd?=
 =?us-ascii?Q?qUhtegURz6tLHeLeqtjqOsFUCNr88dzPaidnV4KIGZp8a9yIN/P2Z1CLvqZf?=
 =?us-ascii?Q?KaNQSeediEtKS4j7FaRdiW419+R/zpcdTnF3Fl9n+Oe8YsEtJVyBCpto1yvA?=
 =?us-ascii?Q?NnH3JjoeuVXmwArqQOoHN4vzeIP8K2kKsuH7uUs3BARjh87GqvMnvv7nwYOf?=
 =?us-ascii?Q?e0oEMvVZOjVEMBg86pg70kA+ExyHLTpqZcvqVBoR2iu/itZz6Zdp9t11eJTV?=
 =?us-ascii?Q?zeyeyyOzFgOUOrTLhxIVTDcC/0V1BCq8i2VysmE2e4XUUV8z1XxLWWIitQO1?=
 =?us-ascii?Q?IAM+0afSt2WQ+0xt8sRg0AhQ0B9NIEew2PMww5kPudfV+QF8fN8zmScZ6M5b?=
 =?us-ascii?Q?de2Pj07GoAx4xvOMc6zNOkuKS6TMhQX6oOn4ibv1cbxC3Fuipp9uWFUWYHjs?=
 =?us-ascii?Q?TA+JLdhQnkVnj1ZtxhXdqLyxV6N0cPUkBuFd+sr0l0m6L8GTHcdTAfCsWMKv?=
 =?us-ascii?Q?4zit1gzehnDzP3V08fdKwqK6TtDtd1adsOqpRbceWdy9IUFUWquLCH5S5U4R?=
 =?us-ascii?Q?WmFBjxF4ALsy7tYpTL+tzPBpbV6QQrznCsF7oHt/DuWD71JA8I03BHcLuPll?=
 =?us-ascii?Q?mzTP+40/CSJtzWOFzsOIiDmOlMhxFzmfPVO7/CJjgBxmpKkXMCptOqZwi1gm?=
 =?us-ascii?Q?KB9sJwuZG+dN/2wGGp+Me29pEtBi97Uy42fY9nwYUsTDSAPYd610UZAMcHc7?=
 =?us-ascii?Q?ZvCfqVjpIOu+8ZRFCSBjAZo7t6nR9Q9CYnUFcDQaJGOjx/4CBROEm+Fcyj+E?=
 =?us-ascii?Q?o7+ToCPc5YI0i7ZzPJ6BVHz3Uu5C+Fhi9GFF+AaeCmnvWB1iGu8gFYPl3uqu?=
 =?us-ascii?Q?ukvblZIV0koMMuuKrQMBdzs+fme4+9N0AouA99ZHlHs2TiZJlJPHHXJM/dkr?=
 =?us-ascii?Q?4ca8biN5k6HYw8JrFjjJTkGo+3YSV9bszKxVmua6JR8FrSPxjrdLzYHiq+No?=
 =?us-ascii?Q?gviFlue3mppYId/+dcZjpZU+5U4Q1NfQo6rZ5bNhFEFR8sC8dxfXlcZIE9SH?=
 =?us-ascii?Q?ITzziWZEDBe7ljQHTDMhQ25bZ8lu6doGjhrLK6o0ZVvUQinQjnkPotCi1MQe?=
 =?us-ascii?Q?jhnAiS06kISCsVVNwrGWYxzT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s9y5KyosTDIvvtTfVCJQhr0CElOQ6sBtbC0kYf+wyETqSXMgbN4jVEEp24fp?=
 =?us-ascii?Q?s6iAY3AAMYjvi9L295NnxJjYfzsq/7lA84DqP6jwcMw+qOVMKhs9luLDrOJE?=
 =?us-ascii?Q?gSV/B2N6KXh0XvdVIJrBux51GPheZCB4QsZ8oI/kKhACWCt9KTdhC2r1cQJd?=
 =?us-ascii?Q?kRK8jSPCfdOGAt0To2Xcv79xCgeYQ4Df5y1InaqqU81zlq9ank3VoguyIcrK?=
 =?us-ascii?Q?jSJEuSUbi6Ubc/FLxVn51Ac9TA9SufZ1TapnfXuRFNVlAExEClxPMevnNUFa?=
 =?us-ascii?Q?dKKjICNA/y03Zrfk8KZTXYTkxUE55VMFOasXVTUExjIQtP7aaQsV1uxE1moB?=
 =?us-ascii?Q?k7dmYkqmmTiQS+vvr57XRHjVqmevJTJPgEZIJEqpbrHYmlZOWZfpVXbMYRcx?=
 =?us-ascii?Q?eOGmkiAOFVd8k52rG/v2bzKUW9lGCZoCnNkwliOBzVodYWNcVWwo9gecC72w?=
 =?us-ascii?Q?a/c6zEGTnY2X/kou3g5AGFMji2rujUAjF1VADEAV6PQR1n1g6tFDndsHSUDn?=
 =?us-ascii?Q?emkuNdp2x5Rtua/vslRcQU6tswnaV8BPpN6JgdUBFuoBvxG2qhqhucAkpojM?=
 =?us-ascii?Q?6WrI0KJ2elLXHeY22++4SECWFZ7FjwEy8Wjc9mqTxzxaP/00KZNCy8w5EkPK?=
 =?us-ascii?Q?JQGuZpLh5V2H0cH48DLDeYi+oKoY6470rTuYDyGRE1PP6IhUnqVqbokaj8Y7?=
 =?us-ascii?Q?TxiJKx+NFGR+fabp8Kz5DrAGh/RUXux1roCsID2K5CCUvs9hf7CrZcT5G43R?=
 =?us-ascii?Q?4h/fKh3mmlMHsiSgSBb633D2rSNyR5xHQbWojy2W1bnCNirR43uAGLumUN5y?=
 =?us-ascii?Q?8WDMDFA69jUA2gLFqtpq4iirqJ5rU7qNYfWHmMWVXLcY+mauMubQf1SLFYGZ?=
 =?us-ascii?Q?eUsjDtmVBFwliqkDgPxd+CcWin1Pfzf/w8aaoCqQOuMyEwBuPxv7a2mtxGG/?=
 =?us-ascii?Q?+r0A9mHyvnQVuFEZc1272um8L6A7OXuzaL4onZlvkdMktyC9+Io70t6/xeyD?=
 =?us-ascii?Q?GE1MdyYzDrd+mpkEQE5XIptEHCzWGaJWClgX94RdWbyAxy3g5UeSt0BI9hbD?=
 =?us-ascii?Q?RV61juag/S5H+OYbcXRjEKZfG0bGKQY9zvo8+MXc2o9EmMTPtT4xn5IUaE0b?=
 =?us-ascii?Q?eBT0iJKzYGcdsRr+7YxGuoUyzKIcGIV8zKD65GXRVMfJxzHKoLOPWQUyTjQh?=
 =?us-ascii?Q?kAvSMsP4yV6n69Lxe+7IVtdMVgv6SQmv1PSriQ2urh7XxYeZGS0nF7Evco5/?=
 =?us-ascii?Q?/Q7QA6OKwExmZlMxeCkjvc6dyACzs/66MJ8Nh9hhghhJ9U2KijkKT+vVmmJ9?=
 =?us-ascii?Q?ehrKUl9mZC5N9oX514LkXDN0yFHTdj/g14fJEq2jbTJwTG3eATeQsmoscDiT?=
 =?us-ascii?Q?jwmCrKzB4T/4KFRKxzXlidu4PtWWhl9/4OeJasSGoaOYmSOo/QXXspRka4bC?=
 =?us-ascii?Q?mh7Wdu5aqp48BjZ1ZJ71H52UyA/c2Us+b/g+vyIQkMPsL+QybOtoBrT4Pdak?=
 =?us-ascii?Q?k0lmsZ5ZItwyXP6jQt76DYUeq0haLOOfKzXQpkozEXGJ6mhomDMni9vKHofQ?=
 =?us-ascii?Q?9shy2ruLksedYM7nEUnRkNk9jHgyfBpnuh8XkMdK/bTGvwRSe6YDzGA4dzRQ?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3e0cf1-2fed-4d4f-fae0-08dd03544395
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 19:57:40.4302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxUPxn3Gqj2ydxdUTGC4lWchVtC2kZFlr/33tF8dBXkVanX2IoEQZ/EsvagPuktxgSbXj5JRcUZs3g/CKipSxFkRqzYjIVhxZEYbZvK2X2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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

On Tue, Nov 12, 2024 at 06:55:15PM +0000, Jonathan Cavitt wrote:
> The qualifier "desc" as used in the xe_lrc_snapshot struct is a legacy
> term used by i915 that has been incorrectly applied to some of the

No, "context descriptor" is a formal hardware term that's very much
still in use.  The context descriptor is the 64-bit value that gets
programmed into execlist submission port to ask the hardware to run a
context.  The context descriptor contains the LRCA inside of it (among
other things).  See for example bspec 60419, 60156, etc.

So the real question is what is the capture code here trying to capture
and dump?  The full 64-bit context descriptor or just the LRCA?  If the
goal was to capture the full descriptor, then we should probably just
make it do that.


Matt

> attributes.  Said attributes that use the "desc" qualifier, namely
> "context_desc" and "indirect_context_desc", would more accurately be
> referred to as addresses, so replace the incorrect "desc" qualifier with
> "addr" in these cases.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Matthew Brost <matthew.brost@intel.com>
> CC: Zhanjun Dong <zhanjun.dong@intel.com>
> CC: Alan Previn <alan.previn.teres.alexis@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>  drivers/gpu/drm/xe/xe_lrc.c         | 8 ++++----
>  drivers/gpu/drm/xe/xe_lrc.h         | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index cc72446a5de1..b95c21a18c31 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1632,7 +1632,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>  		if (ge) {
>  			guc_id = ge->guc.id;
>  			if (ge->lrc[0])
> -				lrca = ge->lrc[0]->context_desc;
> +				lrca = ge->lrc[0]->context_addr;
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4b65da77c6e0..09f0e66952e7 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1635,8 +1635,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>  
> -	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> -	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> +	snapshot->context_addr = xe_lrc_ggtt_addr(lrc);
> +	snapshot->indirect_context_addr = xe_lrc_indirect_ring_ggtt_addr(lrc);
>  	snapshot->head = xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal = lrc->ring.tail;
>  	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> @@ -1692,9 +1692,9 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  	if (!snapshot)
>  		return;
>  
> -	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> +	drm_printf(p, "\tHW Context Address: 0x%08x\n", snapshot->context_addr);
>  	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> -		   snapshot->indirect_context_desc);
> +		   snapshot->indirect_context_addr);
>  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
>  	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
>  		   snapshot->tail.internal, snapshot->tail.memory);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 40d8f6906d3e..f6bf81009294 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -24,8 +24,8 @@ struct xe_lrc_snapshot {
>  	void *lrc_snapshot;
>  	unsigned long lrc_size, lrc_offset;
>  
> -	u32 context_desc;
> -	u32 indirect_context_desc;
> +	u32 context_addr;
> +	u32 indirect_context_addr;
>  	u32 head;
>  	struct {
>  		u32 internal;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
