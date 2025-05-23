Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04301C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 20:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BBA10E0C6;
	Fri, 23 May 2025 20:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdP4nRCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3FD10E0C6
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 20:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748033580; x=1779569580;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LN2OodYIYa/hxlixzvgk1Fvhi5fPAZNTyUHvhkFq1mk=;
 b=CdP4nRCwTekl2CzyKAbf2Z4p8Lu23tsWs+PSnqlrXqvXqiUgBrwX8+XM
 0CfCnXFkuc0BnEBRgRHVexz/vOssjaOeYybSbZdYOa9q2CL9QYpNd669s
 HtyhyNjsP3szXqgyWFph/L3Vxsv+WyrfvSS/qLA9LzHinUelrStafvTIc
 sVyY06s+B1QqAcpyd33YUG7dN0i2LGEh3WM8xtB6dzS3Bni/KdehRUE4t
 D/VfcZi2ZIGtIZNVKQpa3Ta3b/yg5g9pxpqSv2BUbmiVl7grkp5sf8f9c
 qBkal6/4vELojTgzpXSflmNvMvHjls34kXH7vdWbSbbp7ozgo+oVzzZGW A==;
X-CSE-ConnectionGUID: 3PkoQ/KIQqGTTw/DLKVGtg==
X-CSE-MsgGUID: v8z6jGMURLOSrdh4oov/iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75495455"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="75495455"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 13:52:58 -0700
X-CSE-ConnectionGUID: hjE1zVvwSOu8GAGlReKttw==
X-CSE-MsgGUID: FqwFIg5ZSIiEVBGMyi606w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141350216"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 13:52:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 13:52:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 13:52:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.82) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 13:52:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WceLyIshDY0fFHVX2c9aNwYS283dbzMRbn6LRERY1ypQ6E1XJcUIRI9qKh0YjlJxfxueMXAjBR1coGYEh1poJN4/ItDDnZbL3M7yXCSxBgiVXmzlEgYDOvAX+BBd2cl9P2BHWM998uCE4Y+r8I4B50t5/9psmxoXoPUNZDH8Y79BPBPaiHKoa9i01A5x3xR4HbGpx3GHIEqPndzhpS+9EfvgflCC6I15YN4Nq6i10vKi60fOLcs4BnL+W/KRgnf+qSvT9REjghWLio/CXBtxY0ST0p4WYIHBScsJd+YyDey6FnD2bRdNbhRI0u4rhUXYohsZgPVl3KyTTozzTUdu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQC+UuiRDjSxmN2p0PWzEBbmmHjvVu3UJs13b7A67cM=;
 b=S6fFpVDW071Zt5y4yDo6xSj6vhvt/EJsw6Jnb6VzoYdLiPNfYssAlmfFlIhqaB1HYQFk9z0sYPZUx02HA98odE1TabSjqKQKt+Yd/4Zne7y6GW/KPgeO0EJkvDEz/Nm8I/6DGlkaRnoLpYL4dq8LXagp32pajeuhNQ1omJVO9//i4KSQiZfSguARGaTr88F2dh2EAu32otvKTcEINdtal1prGu7DbcLexidEuziCcuaAblt2Vn6V2pJ1ksPn+Zg3LklHksywBRyR1ZZDzzNlRpydehPxIE0sE1I9ojL7Ex9xN6CG8CnsvX71sEJxO0CZwcvLMSP1wGTTYAX9pRKpkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8596.namprd11.prod.outlook.com (2603:10b6:806:3b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 23 May
 2025 20:52:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 20:52:54 +0000
Date: Fri, 23 May 2025 13:52:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe/configfs: Drop trailing semicolons
Message-ID: <20250523205252.GU6239@mdroper-desk1.amr.corp.intel.com>
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
 <20250523-engine-mask-v3-1-11817dc6eb63@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250523-engine-mask-v3-1-11817dc6eb63@intel.com>
X-ClientProxiedBy: BYAPR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 375338d8-f243-45e5-22e3-08dd9a3bca7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f3+O858JrhPth0u12PUbFKJ/3FMNafjI8zgBArgbgyqidsRm4n/UVnmd7w4k?=
 =?us-ascii?Q?V2KwZ2e2Sj1PDqsMgL/okxEBqg21ys7E66QP2DqfxyX2C1GG46A14qVg8/1X?=
 =?us-ascii?Q?CpFbGgHf6D+VqPZw3G9TV/5yzRiz32Y32iSYQZ0UFaUfgBXFwHvo37svA/Ar?=
 =?us-ascii?Q?6ZtgkKRwI4GxZU636mPbm202mkRP9Hg/d3zpO/lHgSWp6x5lBi7hKodIAAm9?=
 =?us-ascii?Q?gHk6fp6iISdq9hYUsCOX3ZmbcJvpFNGXevRim69tih5q6+rhSAaIqQQk5wqh?=
 =?us-ascii?Q?toK6uTaz/wcXiLi/j4j/j6Ik7+qWTOX2VJlR2i8aDDcQsccuPVYFXXAi5IE1?=
 =?us-ascii?Q?2mgDpCgmEkM/sVF/D6s6IdNpvo1WX3z3LTR+TS0AK+8iD6kifYqe1gIbyD8d?=
 =?us-ascii?Q?BEIeVMqF77J4YOe8S2OrdDripWzFWLcVH0t9jy5tpsa01ME2rC13jeM+qwCa?=
 =?us-ascii?Q?rURJm+QHc+y3O9ZIzPB+7UvaHGW1/cozgw03I8Zg/m3qOd8661nKySKEO8y3?=
 =?us-ascii?Q?K1e5e+qdvryidPxwY42KhjhTwFFf+cS4+0IEnkK/rzY/LHE2SYaIFEADtCZq?=
 =?us-ascii?Q?uFLfiMcA3IU88oXvRf8QvDFaEmvNNa17SFBi85vbjICB0wASexLQj5mNepGd?=
 =?us-ascii?Q?QVP+6zOTuSLmWa7QW5J8wrnoKqbub8nRXNBE9MQScIH5p+SCIImhGGM0k8qO?=
 =?us-ascii?Q?97MYS1faPu3NzpYfyl1pb4ro5Ro3yREGprId0tjv87AHy8EELlnu4wWqK5Re?=
 =?us-ascii?Q?Uj2EcxgE1h1aIEqiI7lX1x4xMTUU/lRrBfdkmfLTvcoYjPdwIPxpvIhiitCv?=
 =?us-ascii?Q?3J+Z73lB+UVzoewvO9t+UNhyV/j0Jaoy+LeAE1ho2JJFZmwRzJtJViphNyqp?=
 =?us-ascii?Q?45/WJ99A2pjPEyPH1GZWtW/8Bi9iOQ+j+l90PMg7KO0ONZlJak3woW0ToXlh?=
 =?us-ascii?Q?w5cN+R/Lrke3aECNb4TpsAYht/eHge7hQwYJMDWpaGMO3Y5zBra79JDMyisD?=
 =?us-ascii?Q?c05uW/SPKPMNZlNYoY+lqui1qghEm++YS3ACCY+0tBtX3ipwjWLA2PnXSXio?=
 =?us-ascii?Q?g/qiHbTylgpMIby3XQk7AK01MRbKyjS5F4m2MSH1bQfYOC8nVADPjnnUiD+B?=
 =?us-ascii?Q?LykVwkdNIf40Q8ZMYP1Xb7XxnH8QY7v2gbMlacGniiK5bR15tQKGEMsuL/5P?=
 =?us-ascii?Q?kKV7Yjv56QHMW5UU2ms2XfBCtMy6nBwGOyet6Hl62dhDQv+A6OqDnU45usJy?=
 =?us-ascii?Q?xX32pnk7AIel7xsD2lUeGvjpKoPbCzrUV7PL3Y6y/xO+xsJYHStLgr7PbOPZ?=
 =?us-ascii?Q?9i3pnFbGnaonyphoZvyHNuGt40Kj2+8+XjFjJEkxWl8oXsWfWS6nTFkA3QVY?=
 =?us-ascii?Q?prtorzmIsih5hb3tO7qHTEpezeYO70MfsrcUuccqpNEXJhGsSiLEUWlIK2lm?=
 =?us-ascii?Q?/3AJOqz2Ayc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1PkC0s6dlWmq8WFOTL2LyBDKTpjJDRKljLNwm/zP0ui7bcOrpDXULsdzWKOp?=
 =?us-ascii?Q?8Wn9ce6MgTNxP2w8s1CU045hEn22AwgAo1AUkHQAX9HUq+yGWlhuqUutdehT?=
 =?us-ascii?Q?nQC98x4Vc5054JPLtqKoQIxmgOQ+okG60Orso/f6Zdv86mFenFOrvon3y4BI?=
 =?us-ascii?Q?Ax5D7GETuOYmku/WhkYvtAxi7//3Yj+UhDN6FU5hDw3EUYlQQNcEeTWSb3Ig?=
 =?us-ascii?Q?YN5S2xfWBauNc0CMfncfoAQJwyIiDN2Jf5ydD73xHQOLCBDda6ztOV5diVdv?=
 =?us-ascii?Q?x/FpQsOE/V8G5up+AIDh04bec3VFuIBNDLjjhp5QECo+nn022R7zAU2dYS8O?=
 =?us-ascii?Q?UIunn0wjmKodazMWTI37SGu/gn7IgqVWw5tsC7i2VHtL2hRT0wHM/gKfIyN1?=
 =?us-ascii?Q?AM9koP7q8BOiuAoNXD1t8E2006+3eBwpjInX7FQUbAEz4Mow4rmE9sTrTl2V?=
 =?us-ascii?Q?M63oeYLK9kB0Q/R4fNFlQ5sZTpNjGsWsLQINC+dpmZ9bcUKC6Lf6m01dNgQv?=
 =?us-ascii?Q?oYbAWep8bZTWThVESi+sqLBvZXqlAZ+CCh+konme6MsoqiwEglgRJxHIiHzV?=
 =?us-ascii?Q?VuuR+tCMJemEuvJF2DxYMYxgBietjuL3veJPZtonRrOar7Gxuy76n9wZDsKm?=
 =?us-ascii?Q?GhnyA0ACW4chip3Opa9qeEpZrtFRCoP8w1QpRJ2s801jf7XhhNQyB4rrY+1g?=
 =?us-ascii?Q?XnZkjW0iMm46B35hy0wfXiEilpBgOCKukskkRfdnyDj0ztlfpoaUWDwb0K7H?=
 =?us-ascii?Q?62tO2xbJ3w0dUnQ7TI//qdGYlLDslfN1dexX4R7/b5RSDs81h9KVCMZjKQ6E?=
 =?us-ascii?Q?hu9Mfsh8nNod0vEMagjXYWjc4xIDXv5P/YbefORhERv04j7S9Hs1GpI5A6Vu?=
 =?us-ascii?Q?hJwR1wVkwVaQrjIXb1Kch7bX5S9UZ4FbIOFAT40i3ftRpEgjgfENMvp756ec?=
 =?us-ascii?Q?iGNJv41bKDafBzJFJVqbx0MSez3vClLbEOMh3n9NLRT56+ssoYTgbN1euL0w?=
 =?us-ascii?Q?YfHv+gguVz+ocmTpYN3lsO7mNzKv6ou2TfhYJ65loAj1/Y0lNmSu0DInQDwI?=
 =?us-ascii?Q?q4o07F/IYadNkJ0LXY0Cy0CORFu/bK2b2tAL7Mj8fwE80UF22TqyZR7RhdG1?=
 =?us-ascii?Q?E5zWzGXnYJIOKEbtI+3tTzlaE+Nr/DYRfh73QPCYWsNCasb+2XnAoG0z+DsC?=
 =?us-ascii?Q?rLWVppkhBYzS5RxewF55UbpfcM5rHIt5p4WvgVTw1vGNrZ3k3+0JZiod5Awy?=
 =?us-ascii?Q?C8BBMYH0jvxub/pkqSnpYhPDAuHnshxatA0N0uuiaVZKOCOcV/d0DDjw935z?=
 =?us-ascii?Q?FEQWQHl25t8YJLlFZilRImB8796C9BzJ6lFR3vOfGFkucniptvd8J0Y21rbQ?=
 =?us-ascii?Q?PDlKrykhHlrR3Hj8EfztAJZNfC8StWn85upE1H64vW+88dSvchL7EvJyv3HE?=
 =?us-ascii?Q?NLxRV3A0+bs+JMsLzpC5H+rxixez89Nm6e9ewUU8LCTUYnQAJeqzEs7H6MLU?=
 =?us-ascii?Q?7y1autKq1nJnroipxxaK35GIwFy2ELwmOQ/lxAIJRh18RIsxyAHHKAumSkSL?=
 =?us-ascii?Q?22hRMt71xmO/H05tgzBI9z5SJ2y4p7JChoAzde7MEVrd7OkLS+Zd+5GQOk5h?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 375338d8-f243-45e5-22e3-08dd9a3bca7b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 20:52:54.8659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di/0FX4YVGilETEJEthzgi8x5kQt0wPhuBT8dMpVi/X+17zRCZL0lfTFdmIfWM56P02nLCmdT8J6SMJvzV8s2JpvIObU6TVfWCLCmtiqAW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8596
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

On Fri, May 23, 2025 at 10:42:31AM -0700, Lucas De Marchi wrote:
> Drop the semicolons from the dummy implementation: they shouldn't be
> there.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index d7d041ec26117..ef6d231b3024b 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -15,10 +15,10 @@ void xe_configfs_exit(void);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>  #else
> -static inline int xe_configfs_init(void) { return 0; };
> -static inline void xe_configfs_exit(void) {};
> -static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
> -static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
> +static inline int xe_configfs_init(void) { return 0; }
> +static inline void xe_configfs_exit(void) { }
> +static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> +static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
>  #endif
>  
>  #endif
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
