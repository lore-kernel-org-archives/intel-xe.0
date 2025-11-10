Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9853BCCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 21:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1E510E0D6;
	Mon, 10 Nov 2025 21:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdtdexY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEF910E0D6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 21:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762811993; x=1794347993;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Ysry8gZP6VEgLdluKRrPTEc/+x9KOCyiTVzKKmcATdc=;
 b=cdtdexY2NPWM6zsqm7G2W57ra8w9gqEJasuVRq5rYGvRB/2XhpTAN7dw
 1dZRA7ETIcozgsaajMgF3hBXbigCexees6cluV9rB2Ey+upEH5Vja7kJQ
 6G6H9qsqc018vd1Cc8bzCbQJdpNitLJoLUtsolsJxtMjV/kHyY1h4DVgk
 NnOmwZBlqgLW/P0kEI98Q1/RJVg4TNsmj+QxcsKUsrbTFybcekGZ6nsGS
 mObi+AQErUrGfcQLU6LCmBEtUodcNKdkJs7uL5bWkQZCG2fnEo4XHU+8/
 G+5SV0NqmKzvSlpJdYelKPXQkYe62PvhKIutK16KuD3Mwy4HZr11YTnfl Q==;
X-CSE-ConnectionGUID: U1qvFOKTTDCeW+K3r00kog==
X-CSE-MsgGUID: yLcefVTiRQeLQ1Lox4eTrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64957721"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64957721"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 13:59:53 -0800
X-CSE-ConnectionGUID: rcdKZ+O6TbypiNhdseGhUg==
X-CSE-MsgGUID: tb15kFqxRiaF95q5/jkYWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188041610"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 13:59:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 13:59:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 13:59:52 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 13:59:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXkVQni7uMMnddRQ/SW7LL7wp4m1D1+RLIEdKQ3RC+w1oC3b0JY9kcjPhuvkL2IfN79y/nq/g9lj/DPOZ3/ESG8H9Lr9OLMwShz1rOuUP+TJNAVOhB95H32rlBOKBSb/7T31EPywXBpwX8AGUBqoQTuKQl+p6tkodInZE78eWV2jEkBLgZ3ehsQEtcDTfU0Qh+wJ2/rCmswup8ai5LThBYH6wmaCT4Yb3JJqbNL4tC+rVWSZRkifjJ/2gL7Du4Lkxra7OnRnt/PyoAkknXr4ZXhA0cFc+deINBEq2ijDAeGHhzA0PpKfemqtS/NSppTdgVIyprJjNwUC2u3DbrNr+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTBHwjJxAOda9FTKktkEnJiZPIPSLkMIXnMqsyLZays=;
 b=cdZSi0Z4b2G6vPAOYWewWSqz1zCkxHoFvPvi0cgRQ7EMBzjJraCsncM8RNuaYrGUSpkQk8hbsFJHFWgOUSZsNfr5FN+YlD2oaJL67jOzO9kjzIDqt4uQu8a3dJEBpm7VYcB4fhRhlaF/pOb2+6M9J/B6D0IOht2HcqeRjLl9yhwjlKV8AQtdNFJ61RrvtxDswINk84Q5bJ5nrdLAnxv3wiY8sBJqmJ6jzUrDdepuDZUytnL1bs58OynQmlfJmlTM22S0+oQTtbDSUaChBKNMJ94U9vQCi3Da28Xqi/SEFRV9xOxLvIjel5F4gkZiwRhTralwVhUDWf2PMobZ1GpkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 21:59:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 21:59:50 +0000
Date: Mon, 10 Nov 2025 13:59:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 08/33] drm/xe/pm: Add scope-based cleanup helper for
 runtime PM
Message-ID: <20251110215947.GL3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
 <20251107181315.631642-43-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251107181315.631642-43-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::45) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: e5538ecc-1eca-4091-9532-08de20a47880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DE2gApru2gG/P2kb9uXksSw/CUvmHT5Ymbz+sX2KlHqnGHClGg1czahbMvk9?=
 =?us-ascii?Q?oQ0SzuN0VTn6UcRRFtyYSFwBoAP8XO5pZ7S5Bk8yicoWyXHlbcou5fEEEPfU?=
 =?us-ascii?Q?X+ioHe98KOc5vd4hZyDgxCsQGooireWzJkuo9x2osJ5igD3zBboQ7WqHNYjs?=
 =?us-ascii?Q?xMnBhFKKoDU3sB/7VSI7bwnep7yFkkFqGmjYSCJr8iAQ8LAUbFmxXef0Gs9n?=
 =?us-ascii?Q?D4zdyLYardd0iSZYeMba9E7lOWIKClL/IIvt8yhMM3azZdpzU6tR1Qx0t1xi?=
 =?us-ascii?Q?eR4Ey6GtnU0KGGC156vfXPaC5OZJFUNbSHFTb2PK1Xq9iYyY3lRXAnyd/yCW?=
 =?us-ascii?Q?6JvQe2eaFcxDORVi5CW30ix+ABSDf03lQwNApMikgLoNinaY8PVJZiJLydWL?=
 =?us-ascii?Q?byP0h1AA8FoPE/VYKO5AdwxT8KlVsde5z4RwaTcBW6PLPS9uJMEKMpSu34Iw?=
 =?us-ascii?Q?00SyUbAnX/NAMOOWBWtsXi9AlwxsjO+Q4M25kXHMtSNOOBJNhiHrs88x5KYc?=
 =?us-ascii?Q?60pVaSsPxAFZgalV1k37xifFLA/MM0Pxa9LVOOBvS+4rCNFvn1iHMS/8XWj6?=
 =?us-ascii?Q?OWyKCFGSpSkaHrJx04nMh/rrCj1Ow3CE1Rs/Tw2V/qyz7u47kDD/mExEcODl?=
 =?us-ascii?Q?xb0RQ3oCUd8mjByEPJni8UuVpCFbDQZ/WuQWabVRvAiCJ4oNUtnJ1oxIzeYm?=
 =?us-ascii?Q?rNfTxKQud09HC9f6R1RcvZKM/h885OkeHKUfIosibXdLU3b+jwKHbk8PX5E6?=
 =?us-ascii?Q?wick1BrK/x5UaPS/9gtbxfxAONNV18uugeNfixJ/DFc3grUQf4Wbat70GHSE?=
 =?us-ascii?Q?oQifZ0v0QDCCiHMt77ASD+2jEdga7SOngwuq14xs2PwE4x13X44/OWoborP5?=
 =?us-ascii?Q?Awc8TawfAD2htbuBdAEpaoaB1/7+YZkzMYkBd8NnzJwL8EAAvZifeXJE8OCy?=
 =?us-ascii?Q?QJCNrwvjlsNvVtAgNp6POE14xp38078Jr+vgKzeVAbqh15i5nW2tiFSoWwkn?=
 =?us-ascii?Q?TOBW/jjXKmhtBohE1q8q9w08lzDY4tnAVLhkcY3Du8SsPOw+s1sUMsVmHPFa?=
 =?us-ascii?Q?bdAMh/h5evk2TCtfThiZU9UJYsUU6VncREavDifZMrGWaOeZlua6UE2AtMEL?=
 =?us-ascii?Q?j46snisQfbMRokYL+cPBUU2F6HRtyaDYdHWvWFW0RVHCqSrhqVPmeKYAucN2?=
 =?us-ascii?Q?kne7j6oEd21/3xKXqKGJ42bN5VZGf9gy+vFXFJnVJPn/OBVgerS9YSfqOvPO?=
 =?us-ascii?Q?6Ml7hNkGGnGwC2Cp8vri35TdPUEIkb9SIZ9jhrz1w2goeoj7LTlbQO6W47st?=
 =?us-ascii?Q?Z+jLeR8M8aiB39y65pD3Z9RH0UR9T0gh8RlyFwjzKW282FH2dTuliR9qb2aZ?=
 =?us-ascii?Q?jtf8hLKDCTSVRY5DvC1Wx53YGHQquhiqyxf7iyxBnmnFKwplAengMZYc/Dqx?=
 =?us-ascii?Q?+g2Zd8G2BbQLIXlOzV4lMZOQ45NXWAaO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VrhRypSerYea9nUiKefpsBDihT0eh/+yF6/3ZLAKAbChywa62FBajHq9ziMH?=
 =?us-ascii?Q?gD/k8RonTOYJk67425OAmuRXFSzTxz0SlwSOkJX/qP9z9ESCBD5ArolFWrNR?=
 =?us-ascii?Q?0snW9dHxLAwEQGGkeY1am7l02GqY7EHN0EGPkgg7XEUqe0EUXJ599+9mfDAK?=
 =?us-ascii?Q?DK+ZdUGMOjjKsJonilfojhMyx/2lUjtgbdbZO+m+PLf86zGCDW9gfVEGs8HH?=
 =?us-ascii?Q?FbjZ4ZpFnhZm7NvCUEj+SRF5Kie9l3dmzGhIoQWBwLBrnf3YWTzCnLUTkJdZ?=
 =?us-ascii?Q?JC/WDfQk3HNmceT23CW5iPvyji7OJe9Nd4ZymZZO/WcOO8AOEQVGl323AhJW?=
 =?us-ascii?Q?IRq/bclqvTvU+a6wt3P6RRGitcMyUhvG0u/RQdB/t6zZ6k9mSZI8xxWrl9aP?=
 =?us-ascii?Q?XrFQ2yMsUwdK4WqgnJI5jsMsavNHWzRvnfbRCp88NV9yizhCHckdeAoC8HUj?=
 =?us-ascii?Q?ohMKQbdDaOmJm8LDJMjul5Mq+IRLs6m64TPoKPpEZTNPhke5J8WYo3FUbVJo?=
 =?us-ascii?Q?1kDqwtT55vG5xvv9wiPppKjvuwPNaSYYPx60LgY0gcsVovgIZySNjhH6hTxu?=
 =?us-ascii?Q?4sWRectZalujcBV45DPFY6NywiunyyGM2VVcvgXOFrRGTI9c0Jdg1tQCLJCz?=
 =?us-ascii?Q?Z/RjK9xsXKN1R1W6HIPyjCyAHr+sCPVnYzyn0Y3q+/vRTZkpOygvImAW2jaE?=
 =?us-ascii?Q?xela2FYiqSKh7aSm7aY+ZEphZDwx3tLDuAs62A6Shvx8DXRsYWW2UJ56s3v6?=
 =?us-ascii?Q?PpbSk2qQGLdwFk8/n2QU7FRXw4SfJk0f6NYhN0wKKYcOyOD9j5lcl+RJnTmf?=
 =?us-ascii?Q?PNXhzwZpl7J5RXzYnbc84RsWrIQYjC6pnM82ZrFeybLuamzXmqfA4qRe6gdS?=
 =?us-ascii?Q?7k8adUfbKgoVxms0uVSphAtUP/pW/kLk0ldlCh9V6iew8ukbCWKeamStnt0L?=
 =?us-ascii?Q?hrYbhe110vfJFO4MheLIs3/WiSpZEmCr4MzBJuBUJZiEe5f5jL/iOP3m8uUP?=
 =?us-ascii?Q?Uieq5KbgMxzumcV/CWEK0JbLjQ8Xz03tp8AHMaAoIvWK5ZjZsdFWxSIysyA2?=
 =?us-ascii?Q?13vn15wxY4tF1pNEaAg3XSreDkQnSTz4x1qmx2qwNjNhID0ocNIhRTX5ZmvO?=
 =?us-ascii?Q?xUmyoAOJrreKaXZHW0QCU4gmO6sXv0UCYaHbuXKDykmP8HqLw3LjrZo4e8Da?=
 =?us-ascii?Q?jr6mhBB7t7UdfUIRa8BSHyz7Q0a1Dn5bdHk2XOQDVYNknarH2dwDiLlquE6b?=
 =?us-ascii?Q?QIeA8lgcWPyAy7lgj7JRVIsOSw+jof8gq1OIaV79mcKQJ1FKhLxSeQ7D3+Ws?=
 =?us-ascii?Q?wFoti2v71pTG3z4qmsxIwkGuJIgBkFPnxHx5mvYQWQzurlMEuArJChBvf/+0?=
 =?us-ascii?Q?LEO7Glo/n33QMK8qv4IadLgJRMhwpmT6e5SSDM0NEfbnrVHb0eorrqJ+Jamf?=
 =?us-ascii?Q?rgyewVTqF3dRU/Wwh7WnvdL0oknL2xBmzKdj52cAbtdjuXsYQf2j1oZtnIeZ?=
 =?us-ascii?Q?QFl4ePw11sAmCZyH3dDY0sS1k77m9ePx/ibvCF8QvzPZwBSdW1ORef9Dcky+?=
 =?us-ascii?Q?3gIM6qbTU+eOeAh2+j/JnRMNTtJv7TQfgEooEUELX1l4YmaR911nSEg7F9el?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5538ecc-1eca-4091-9532-08de20a47880
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 21:59:50.3432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JK7rbKmZz1mt/V7ULdj4yZhWWbFNuqG4Wp9t+GepOj+4HHvzohaicuaepU7NT0Rxa5ynV10MsuH9DvcrGg00guJFuDD1aubxGFVUGuxucSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
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

On Fri, Nov 07, 2025 at 10:13:24AM -0800, Matt Roper wrote:
> Add a scope-based helpers for runtime PM that may be used to simplify
> cleanup logic and potentially avoid goto-based cleanup.
> 
> For example, using
> 
>         guard(xe_pm_runtime)(xe);
> 
> will get runtime PM and cause a corresponding put to occur automatically
> when the current scope is exited.  'xe_pm_runtime_noresume' can be used
> as a guard replacement for the corresponding 'noresume' variant.
> There's also an xe_pm_runtime_ioctl conditional guard that can be used
> as a replacement for xe_runtime_ioctl():
> 
>         ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
>         if ((ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) < 0)
>                 /* failed */
> 
> In a few rare cases (such as gt_reset_worker()) we need to ensure that
> runtime PM is dropped when the function is exited by any means
> (including error paths), but the function does not need to acquire
> runtime PM because that has already been done earlier by a different
> function.  For these special cases, an 'xe_pm_runtime_release_only'
> guard can be used to handle the release without doing an acquisition.
> 
> These guards will be used in future patches to eliminate some of our
> goto-based cleanup.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index f7f89a18b6fc..c2cde906aeaf 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_PM_H_
>  #define _XE_PM_H_
>  
> +#include <linux/cleanup.h>
>  #include <linux/pm_runtime.h>
>  
>  #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
> @@ -37,4 +38,20 @@ int xe_pm_block_on_suspend(struct xe_device *xe);
>  void xe_pm_might_block_on_suspend(void);
>  int xe_pm_module_init(void);
>  
> +static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
> +
> +DEFINE_GUARD(xe_pm_runtime, struct xe_device *,
> +	     xe_pm_runtime_get(_T), xe_pm_runtime_put(_T))
> +DEFINE_GUARD(xe_pm_runtime_noresume, struct xe_device *,
> +	     xe_pm_runtime_get_noresume(_T), xe_pm_runtime_put(_T))
> +DEFINE_GUARD_COND(xe_pm_runtime, _ioctl, xe_pm_runtime_get_ioctl(_T))

The conditional guard needs to specify a ", _RET >= 0" success condition
so that the guard mechanisms will properly recognize which return values
are "success" and need destructor cleanup vs errors that do not.  I'll
include that fix in v2, which should solve a bunch of the failures
reported by CI.


Matt

> +
> +/*
> + * Used when a function needs to release runtime PM in all possible cases
> + * and error paths, but the wakeref was already acquired by a different
> + * function (i.e., get() has already happened so only a put() is needed).
> + */
> +DEFINE_GUARD(xe_pm_runtime_release_only, struct xe_device *,
> +	     __xe_pm_runtime_noop(_T), xe_pm_runtime_put(_T));
> +
>  #endif
> -- 
> 2.51.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
