Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB8FEF99DF
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9246310E85C;
	Fri, 13 Feb 2026 22:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccUIwin0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E63010E85C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771022494; x=1802558494;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g2oyl6Z8KV5TjZQ6FMopubBB9BqY6RAa4tZZhaKe+Lw=;
 b=ccUIwin0F2p4c4vFp3CCV+3XhTCJkRMmakFj+0tQN/lrJ6I6YopGOXzO
 tc1F4vlZnPLjRgMS8NlO99+tUovIz3SgQPiZqsZ4EbJSquwkZhXgSm5xH
 BQwBqNS+RznwtG0ThCs6b5QJhj19HEkfe1KdZUXFk8+VjkY/Ir44ljvlA
 gnVjOzbRi+H0kZj9HN9N2daDYbmnl1LMPDx0m3gKbfszAn0bGI29msVFR
 81+8LtUkBOQpyvCGtTuHr0S0a3RdpSOCnus0xhcAOWj4dnAZo3w76uRmr
 8GAtTh9cXJFP0cUpTQAIcbmguMpgNMKsAx9HlM84fUTTrK8+DWJnFg9n2 w==;
X-CSE-ConnectionGUID: G8tBO+JqSy2ZD0sEaeX8VQ==
X-CSE-MsgGUID: WuT4t734QY6femMSAERCRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="59781424"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="59781424"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:41:34 -0800
X-CSE-ConnectionGUID: PSYMlt/YQ5i8yHQRFfJm0Q==
X-CSE-MsgGUID: I14kyYZ4SMidW9+7HJ869Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="217167035"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:41:34 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 14:41:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 14:41:33 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 14:41:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWCzScZoWXnpJdBKvCvO9paUWgb9Cp9owxiWdgOjLpinOHZfGjRXuinnvy432BSoMlGDZ+0NiEoRwOiaoctvT6JOaa2aDpjG+Qihguw9jFi1+vpsg0/JojPuqFrON03PcoMX52SlnwmfoFBAcayxExKjSVlqd5UkIvc3n4C6GRE//CQj0qn8YDJPcKdgKKp2VYaJr/j+HRDZHwQWe5wshdRmR3XNra+7IZjh1aAfWs/yy/Qou1+5RZEa87vl57Kie7XXzSNQpiiEo58BpQPXRUqJs9uwGnTRapYJzSrz6AzJSejs/+IR3dmPWXlOAqiBZoCfOHKhkaNTn9eg1W4Zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhKrmk8y7z1NTvh0wtbm6JGPO92tGIs0s2T/wMSbC6s=;
 b=lNMPyVIP+wm0813dXNrwX2omlEKXZui0yaW9PaGrHRPpVE9/e6L18wWr4nDm9GAmW1tuCnV+oXLinvFopy3NomXn0E5yx61yAD3JFhzcyKSaAjW95EQSKbLChKdObd4ZLLE1aGm7ylytJXpFRjT8oqyytyxao8yaOy26v4jJ9Io3bNioQ0YiafrZ+E5MSJYaHw6UYPEbeBQzH6b0NZK8bLot9ZhrqR5zQCe006NmzCQ/X961EdmDAhGYMwnX6T4bHqPLiD6d21o0+nTRs1eN7xVf8nwuCK0ACiAv4nJ1bC5XPvw+1L9jAhdnFUg5r/LahuhoWFnPliz1ks27Ud38NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7383.namprd11.prod.outlook.com (2603:10b6:8:133::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 22:41:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 22:41:31 +0000
Date: Fri, 13 Feb 2026 14:41:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: remove unnecessary struct dram_info forward
 declaration
Message-ID: <20260213224128.GQ4694@mdroper-desk1.amr.corp.intel.com>
References: <20260212131206.1804113-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260212131206.1804113-1-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR07CA0054.namprd07.prod.outlook.com
 (2603:10b6:a03:60::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fccf86-c942-4bc0-ee57-08de6b51083e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3So9L/+9Ssg/p3N4suiEqIfzME2U+L+4/IriAIww7kC2l4RJnIAuYk2hr/cz?=
 =?us-ascii?Q?mCY2KoFHqtyj8FsLaxkJ3K5io4KpGct/XvESYrraeKRpddFY3voXxe1qxGd1?=
 =?us-ascii?Q?aMD50oGRWbZkbUpVt8L9db6AqCn8xZI891hb1HakF7iDLHSQIEM8wGnONRcR?=
 =?us-ascii?Q?vY9yEAHpRUHdBVcdNCc9tlLEJ9yKKRff0ik0J2bIA3Vym1a8FXF7c4FngAuo?=
 =?us-ascii?Q?gpLn3oPcNqfsPH0XNFO64N40wXaWdyH/pYwxBBG/ynf4vl4qZpAQKDtm/y9Y?=
 =?us-ascii?Q?45vQdL9jYMXnmGo+Mj/JDv9ZqVBUKQF3dEUvt/HTQPu6DQdFKOh2w1WzhiqJ?=
 =?us-ascii?Q?62Z8yV6wyEMSY1B/K9ER7SMARznv5dQKpXID09bh9cADZyAOpiMiOTvwc/yf?=
 =?us-ascii?Q?eTag5uh54VnqJEQ4yibXRe2r4QXQJA0xlin3YB9e0Ia8ikrriuoUlNDrkjEh?=
 =?us-ascii?Q?UqpdVWvsh66yVmLM1/nTfW5P4QYhDZqkGBhsQ6eMAIFbiWRHWHoSb9a+4fUh?=
 =?us-ascii?Q?DG2CCXJz4V2N45Sn2q/FRr0B1IEK63+otohtrJ4yE2+6p8UAiKjuRh2oVtQD?=
 =?us-ascii?Q?RkMC/socTESWv3MgfowrNNf1WLi+s7gkWDv6/yOwqC8C1h2/9s8eP8Twr2pt?=
 =?us-ascii?Q?r2iDKoLo4OtK6+yuHV54LIV+KcveaGtBiej39IXjhWmnFx4KNA4VRB/gddVj?=
 =?us-ascii?Q?cKGKYLo5VpDO/hBljw3EjM+wG1QbEW1alsKJk8pxqKwubtOXaqPpGuP8atRK?=
 =?us-ascii?Q?jIQLqnfejAkgcMwfnltObb2ot2b5iZ77TOlz83YVozJCuATfjx3yvBzOs80M?=
 =?us-ascii?Q?pcArb0L9w7sT8zUfD/JDmwp2XjzY/F1bwwKSGIFM+WHQz7KSc71/fAl8m3Mx?=
 =?us-ascii?Q?z9RWW5kMDI0dA/pkTRd7I8wExqUsw/P8tp/BNTtCtq4FOEwyK0nvY6P9LbH1?=
 =?us-ascii?Q?Box5tYeyadWWgVgwkKKA5fXeRBJcNd6oF7zG42s8jMrq3y83FJwYcxSu2yct?=
 =?us-ascii?Q?S9h5cD0nQpuNlGpWLb2dJUMIagLPgad/rZbmWFuw0gLDmiNHUVwNQpvhZ315?=
 =?us-ascii?Q?c14T2Vo2Obbcnwgyh3BkygnrH2IEpx3Y19IhmWgfaEWnPv5pVYdRFljTTUK7?=
 =?us-ascii?Q?trC6/p0ZPWgJD50H3zEgenWxFc+LmjZqqTI80qqe1+elbT/FHpMEEaWZHYYO?=
 =?us-ascii?Q?6rlUCo2+0Q4ckwbXc755DXr+aW4cVoJZ+QimxjjgVpibHbZiEh3ZSg65mH1U?=
 =?us-ascii?Q?/7DVCiZsVkOY4cu9nMAoQabnTNO/nh7PPy6b5BKhB59yAGVPgK0M5gsJiFe8?=
 =?us-ascii?Q?KXc//5VVF+RQpmp4isOBcXaOHCK4wNJXjqAKxqvr8p0jhG6v6rJ8jaf0IY7v?=
 =?us-ascii?Q?5k0Ez1w9XJrz4GCbUIaIDowJNTWsgq2hWQXDp+aQLHDc1mi3UgwLRXUjQlZh?=
 =?us-ascii?Q?WgqVhdQxfM9rF7oHD1NPoAvC5z4yQ1MVTFOPDWgA/NS/pAlQNlY3sZfPK6Zc?=
 =?us-ascii?Q?7sT8CrY9jG3kJ3OvQBdhFHtU0E2tE65CBPVyz828cx9kL3L0FXiKPJEer9kd?=
 =?us-ascii?Q?YZc9Sg706FR2OOHiIA4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rOZ4iHyRXKh8Q/SPeoa7Pbz79XjKIndYUDtt+q4D/Db7RuTXahsfKHoyLYbi?=
 =?us-ascii?Q?ztwz+7R6XeTSmjeCQxYNaYKmruzGQtkVllHpr5rYvqb6IA5l34wtOfoOARmL?=
 =?us-ascii?Q?138JoFCbb9s+8yw3RtvAA6i9lU5lp1VORBGbxWcuH9cj7vaZgbKkW6Lo2TAS?=
 =?us-ascii?Q?aIDMVCCTXtJH8+GmdaUavbsaEVq+rAY6w4Q3uM5oWT79e862hOj4uvqv9YFq?=
 =?us-ascii?Q?c3RRE0yxctC4h9rQQDIVOMh0CdccwcolDQuWxBOCQ9mCJSFTPWbGHlnAWCPL?=
 =?us-ascii?Q?FZj0so+sV952ECvYQzrCUgWkrEbq/QOOFPh/huAE/GJC8tGenqab1/SObXWH?=
 =?us-ascii?Q?11T3dIH6Lj18zbMpEijHkf5seA8hefuV70dsDGjReUirVHL4+xKxHCwpzRDx?=
 =?us-ascii?Q?4AQ0H5T2BUMBGgk/1NHHDljJZQYnPH2U3DhwNg9KTp9LMeQE13NBQDwL47TD?=
 =?us-ascii?Q?2MLBUKz8+CQL0sMZlhCMXa0aZc6TAbKBpazcibRXN4FAERION07XC94dUMtU?=
 =?us-ascii?Q?kyAWAL+x3C1jyNQK0E3MiTPIMaVXcur2ZdjhqyL7Rb+ymSnLs2MIMMPr6COE?=
 =?us-ascii?Q?N921PDQRENx/b4Iru9/W9VyFwnVAK0W3mG15XJ02cTmroqwqJNijfeGo8Pbu?=
 =?us-ascii?Q?8D2JxZm55zMZrSdxow56TIx6Y5BX54oQW7PkiqF3zwkIMAB6N1p+Wcm96GDn?=
 =?us-ascii?Q?sap2u2YiRkWcSrqGFTFQHxdXApk2XCqRc3K3SqGN7X1cRzmFjVV9RzmqnXIZ?=
 =?us-ascii?Q?JuCxta47aeXBoI5y2lCJW+KTs320ld/VJEQCv7kNCOG1kcI/NmA+K3o8056o?=
 =?us-ascii?Q?TNwUEco2IeSYdE/h5EPt5Fd8nS1BBBr4mlJF7k/g0KkVTGn5d9dakqlAM6lc?=
 =?us-ascii?Q?UxV+m9CWQqLDxIwhrqg2hk8Gyp44SNfnmfDW99uUwWukRX1dcwe8M7o6YozR?=
 =?us-ascii?Q?rgYZQHWVkZw8dOM8J2gLXF3IFhFuGmp+LcG12MoJVIKBlLXRVPPTCTdPHA4C?=
 =?us-ascii?Q?rfQN234T7XwP9TG3zgeQ6KDXlerH88UWknxMIBNaKBvzmvM76I8LTUVzBEzI?=
 =?us-ascii?Q?F5JYj5xaH9fSumDrFGIQA4TKxiwG0yNxHpaks1HYZmccDuclBpqwpwSxiUz/?=
 =?us-ascii?Q?XCMInPfuc38W4+pyeSVEP1bsI1/L0TJsxqp3eC1417NKp55BMBJrebK3wO5v?=
 =?us-ascii?Q?5AWP61sFpi2+MpYc4oRK+9OL6xQXV+5vSPF6thto2AiK/OEVs3NQdNNYuZkq?=
 =?us-ascii?Q?iXS+ZdGq8BFWrqT8yVFzs0ZYToxDAGTAW5x+tl0BNTr9AqRzfZupWaY53VvG?=
 =?us-ascii?Q?nt6YcHG+7n0hF9faxx/zwOFvFzsmD46biHWTSd4oSyQp5vr2YDbsx22BeAH6?=
 =?us-ascii?Q?am3kVT40XTZXU2Bta5Pj3K6+T66BGFwvahpzYVV6HPZFRwBlt6Z27Bf+KY1x?=
 =?us-ascii?Q?9LQGFoyDqOlZH2kyFTqboR/oWg3vHHFVtDDhEaZC4l8jZD5DBTa/vH3i/Qhy?=
 =?us-ascii?Q?z5/NAHd5hntMzeh+M3x/N5Q5cqUQbtSm1YeQzLGA+jvIu63NDQzDRMuHzO1O?=
 =?us-ascii?Q?T+1zO60rr0HGZznQ3bF6EcJPHoU62N3aEzJY1wUZ9nqy9IXMUIhvWcphbljL?=
 =?us-ascii?Q?4B+TN9o4C9dkJAyzRCYdKRZd8DQFZl8760XNPSO4X434O2L6ghmNSKmf+YdX?=
 =?us-ascii?Q?+f2bk28Asmms8E+yeqbRUAsUtZV0lGbpwkMe4pcLFo6rat8XNtCdW4750FH9?=
 =?us-ascii?Q?AHn2uZ6/FqQKSdmw1MmfOkAwPOlb9Vs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fccf86-c942-4bc0-ee57-08de6b51083e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:41:31.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2Xw1wmjYyn+lxy1P2a+0pT/O+IRO8zDqlbb6UJxbxnLBzzbjC08AAzbKuZr7e9jSf0/TZ5wQEfgygWS7fk1BPtHp2ueYkfS939JvmHspY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7383
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

On Thu, Feb 12, 2026 at 03:12:06PM +0200, Jani Nikula wrote:
> There's no longer any need for the struct dram_info forward
> declaration. Remove it.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Looks like the same may be true for the xe_ggtt forward decl as well?


Matt

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 059f026e80d5..8f3ef836541e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -33,7 +33,6 @@
>  #define TEST_VM_OPS_ERROR
>  #endif
>  
> -struct dram_info;
>  struct drm_pagemap_shrinker;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
> -- 
> 2.47.3
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
