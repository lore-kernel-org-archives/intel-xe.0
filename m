Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16F3C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 18:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0BC10E44A;
	Fri,  7 Aug 2026 18:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buECMJgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5630010E44A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786128703; x=1817664703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oyetc9KZiePonr3B51zlz/bpTxOy9rJNe6hqCo3noGU=;
 b=buECMJgiU4JQYLdLpL8mglMAyKtYttOdZx0VT22KqqrL3froJc2uG0wl
 7gUTEOW4iX5Zn2cgPcpLhe94JKcJvkqcnSlR0eb9GbJRSz9XjoP91jJGr
 CxRsfxZ+mIZCF6skMHvCuRO0CBl+eQTogpT3Zs8fDISAg8pYX+ogPGz8m
 z1VIFvHI+kZO3neQyxgsOq+AFBRscHKtoneu1q8dFhgqGI37ruicm/PmF
 iB82SPpebuRGzE1RRPXRyiGrMRLBJ/7AGTHuwRvPXv8zHe7rYxiu6xz2m
 lBet2zNBfmkO0HcviVlCvcqinQ7Ga9DL9woo2bIjATkJ8bFk3I/vszY8S A==;
X-CSE-ConnectionGUID: crm/4vA1S2unZfpldnh0fQ==
X-CSE-MsgGUID: tQ1/n/FQRyGqlkfXqpEfGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90623938"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="90623938"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:51:42 -0700
X-CSE-ConnectionGUID: 8KGb4Mz2Sq2RydrADfO7tA==
X-CSE-MsgGUID: RV8sTxrzRdiQhsqeGKUWvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="264458117"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:51:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:51:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 11:51:40 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgzegXd6iKHNiuI/U4+4KCmdkiUo9iuJ2pMXRcPdc4WQjxUGplpNYui2Th16QCcq68UY5tv+nHtcEJsjaX4HmJHwtvKHK3xoFHZnZ9c9OOrj3W2lQViUhDGltsC8zxbrAj8FjyeAPPXMKFlPvzLYVYbW/2/L5fbWpR9zGUg92Wp2NpsXjJCDwkBJxHSuohlEJGRmIVKri431sa3HKQFT6bmKgGxeUgcyaHwbDglqGsBq2egAQoT8nEJTeEW+FA6TIro+j+rKMJce8jqHsUVSThdp5WHsrwd2lSo2H4VX/tlIH5ciKlLBdg+pfq3xLxtkYxPsLyufavgcWD3YMiOdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k44XCVBGfuX+RiJoufMv5T7AfD4PdbP1wzfoUYSUIns=;
 b=PLoKTULKZdkd4JwKVUBfJgcMOTMeVMlm1lQVkqNQR+9Fag11FqcoqN9I53EkSG3wNX75NjL7CUSpDICtp2r/oMwikZ0Gc1zLZZAnjWxjWoWLM1ojUHXLCprugP5l6b1cbhrNs2IngJs9BZVYX/L9x9u/3n65cfyAIHLp9TjsrXN29e1Hl/vSsaqAQPPd/z4/pGkzCQ+ffl3ILwZBAZvGVyx3QH4NON2KyDy7eR4H6JlT6NHL6cOP80eg92+zBD9kXh/2CuVDp1tw79hPl7uttM2nE9JKYql0c/FLISTAvaAxij+ktoJ5yJhOrts2LaGVMSpjPXmlPHY3lnLIU7L7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SJ5PPF66B2E927F.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::830) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Fri, 7 Aug
 2026 18:51:36 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 18:51:36 +0000
Date: Fri, 7 Aug 2026 14:51:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/sysctrl: Add System Controller get
 application status
Message-ID: <anYpNPX3o7a5vEkd@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
 <20260807145621.2938848-7-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260807145621.2938848-7-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SJ5PPF66B2E927F:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d55e8ad-91f2-4a33-4ecc-08def4b4e83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: RHmNZhlcrGvmRKT7t6YTasW36wlzqOVtcH9c8e3Sq7shckeVN2pPSz5yKYZko2Fo9XGFVtUtDNROqoIiOMQLcaDp0rcxgMLJgf9Yy175JB8q4POGxIcD0ow5JUG9b/z98Smitnkro5eVeimpFJFMya2DlsyQAYZ9eeD7hBkNZwGftEit/D3Y+8A5PA43IYpJ15krJtpMG+iLEwANZ/68u+XezVMqVOA0Au5nRctkYOUS4k08h+DD6dciJ9O+QId6OqLW0P/hJ1Y7YyaxI3CgF9NKwrbkQqzQAPb51nha97pdB3/SfTh/Awd9y4qChEfXnfAIY0J/wBez9eTPwoqUqKnrTaImu7ZxIKHF+K+MaDMfzo29N9Fuc0uVes5BXEm7wlAtzTDziLCEPIq2cQHAQVijcPdjhKzu/yL1q2QqB/HEvJMwbDBrmGkBDOxZaIchlhO0tKpF5XlCAxEDBX5MkGomENuI4ReQw8Y12spwcEBps4Xsx7A/88jboa37x63QFszwj2npyAMszfJC9lV23S/rZ/E69ncsKk+Vb/9Isv/27NCivFb7umI8g5yWXVxU9t1FzNerxb50ojO4rXg4P5afiLpem1h0T7977/T/wU1su1NQXwrz7Ym61uVT5HVmxrnfVHTHWeR+LwsfOrIwt+QOXp4eCf0qyT2Y4gxvXU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mY2DWj7SHeiUuQQsIY5inZJ+6tdz7hfNrpXvnqa7P8XVoTHEv5AuHsnC3nFg?=
 =?us-ascii?Q?y3PObv0xZ++uwBuG2dBjQa3K0gfdGFnXwOWQWxjzaJN++zR76JnlfRUFHKBs?=
 =?us-ascii?Q?dieQnVZ7gcA/exGwIeWLk8zs75It1YKee6UtikGOobcscxLKP/FfnNVdyBu9?=
 =?us-ascii?Q?TrXwGv5zGvZj3lkjAAS8gvJAVIIKSppviWcLrksqmRYYb/kwsa3VAC5HJfP1?=
 =?us-ascii?Q?DtC9WKFB1URN/Dy6BjdBsPvdeuCMrNYXz9DXWYrwlBfSVF2uw/PV9HDTqTI4?=
 =?us-ascii?Q?zMRfa11buqepOVTF+8JtLjpKRDZUYGCtNGU+Xw1eJvAC092788xzmlkLHmPK?=
 =?us-ascii?Q?gObFR8JfeReeFU5yPDYitrWAjj6yq1A9+vwiBj/N5eNraH5f2tzTrgvk1TH2?=
 =?us-ascii?Q?GkGiTePxkaJRg/pioKL0SFaavio5OSK9e5TFIBXjwS7ODKE4IxVlRDkFKCvc?=
 =?us-ascii?Q?8+pxBCPCy0D+iWd3PtGHkt0FBuAMxRE5QXElbydKyD1wwy35upiF5ujO72Jh?=
 =?us-ascii?Q?FVKKNTn2+k8oQj1nSB5XPqeZakWz1DpPMLGgqm4gr1WYc3Tfks1bslPKrmmQ?=
 =?us-ascii?Q?aSMQQN1Y1Uy9m6WiajRYCF9UbkTAe0RiEBhjrKDXNPccj5PG+9daWg/9OtnZ?=
 =?us-ascii?Q?ThE384TLyLOycWXB77ElyXZwDKm99fm3B8b7QMS3o/Kr84VgOjM6bMbJek2/?=
 =?us-ascii?Q?C4wlyNmuN2TNBvJ/BCx/4zFrz+mX2xvnsMZCverOSaPk4K0PFAu+PNFJcyz+?=
 =?us-ascii?Q?krOInjZ98SNgyHFZGw0280YpQpIMAeTD090thQU6CBid9idqLOj4/WZwRcaK?=
 =?us-ascii?Q?NkxMivCfOMtCRiu/0eD75wvabQYqBxbWHRZbjlj8O7kpZqPSURIsuWOB2/Hx?=
 =?us-ascii?Q?xrBd+aw3SIdn29JBiWPLXbZxT8xKvgrXx9/YOYUVCGJG6j+9oQyhSWdNJHH1?=
 =?us-ascii?Q?KltWoZx0uodybKuCO2MqKoloWuCbS70RN79HRKnBCVNGhRTJr21dXRvq769w?=
 =?us-ascii?Q?YvMnz9L5nb9P9Xr7IJKoCHmz95oPK0kBcDNi4W9el8yBw8HqadJlDxxFdooM?=
 =?us-ascii?Q?Yd1lZjTzyMyB5XFrCNb1Dd5ddFgq4GAsQAIk2n68UuNAPrzXyw4zQZ269XVw?=
 =?us-ascii?Q?Nq8qW/IlqGpkwpfVQpzlrVIX0K7/Xc/6IqB4SHggrkyQYbLmED3OiOX17/a6?=
 =?us-ascii?Q?mhX4Ym7wXwrJuIo0i1MtGXQwHXnoPaFN/1hT5HUPK3KRKFBVrEQtwnrNGngH?=
 =?us-ascii?Q?z0iBKFVVRs3Qv7Li60wpvcC60YztsU7z13D+bvbn8n+qwjm/ycfhywh+Ia/g?=
 =?us-ascii?Q?16dnDR6eZZWED6Bx6b1HDOj0WQVrcCxc4wo7Hqbe5OtGKj7rI1MY1BOD7UjD?=
 =?us-ascii?Q?0IOEc/PCbf6OmkvVIgpyk2yRC5Lyb3UXNqn6KNp955qDLkPcasBNUUxG/N3c?=
 =?us-ascii?Q?fl1Ed0RRceUAiL9w3RcMlvxVlr4r2NyG5l/ljSHmjpvdQ/WW+yX9fnqiwBh7?=
 =?us-ascii?Q?NfWmHssHM0BtwbTjdvKmFaS38cezyNCo2IlLkXGIhepQrxxzGPMZTXJSEz8x?=
 =?us-ascii?Q?yRHqcJdznLFBYSSCV1DhAwk5PSzAph5zR5EPhBK+sdR12ZHMoNOfssYFzKCH?=
 =?us-ascii?Q?VulTVV6fz+4EEpiLlkF1BeywZ7/nbpFirNmCG5WUbO7YiHJP2oKNqbqGYWi4?=
 =?us-ascii?Q?d/WWLOkKSLyqiAIPfUwVfFX58w6xiKx5CJe5xTbsasRm9TFnOKVuG2XBvnDx?=
 =?us-ascii?Q?M7bUKCx9ow=3D=3D?=
X-Exchange-RoutingPolicyChecked: six/N9IbKo22e4WEF8o37W6RI/YRgfD48qFddi+Qn+fIEztzRFF5FTudXUuwqZKsRbc9DpajjDD9/WVeBKX0JsZckRTXvdjzQOzCtOHGaQlBqLEuZSi/x6q72UwEVNwYpOkGdxR2JI7e41uVw1LcYEf9czXE/n82owJ22FKAdmRfUpdQSQJfsrX187OpxRpNTHG5Y5ETdnuEDg4KwQMWe4ChrXMBMeSXdlsjPuQ+N6p49qs+vzJD3jSdManOAvsyIEsfC8uS/ZKV/z4jArNhL5puo+/qHWnzv63padwivawTC4e+rVou8L85Av98uslF6w/lLo9qKYY/hN8ot92TSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d55e8ad-91f2-4a33-4ecc-08def4b4e83a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 18:51:36.2595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgMQPlXL8PknwiFbDHHmR5WhTKqJdR5ZLO8TTO+7QuRUg1rhVgBMn9HUnvFf+NRd88UIwGsHF5Cf7GVcQJq/Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF66B2E927F
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

On Fri, Aug 07, 2026 at 07:56:22AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Do not review, CI only.

Why is this the case?

Is it part of another series that is under review?
It would be good to put the lore link here if this is the case.

> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl.c               | 82 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl.h               |  2 +
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 65 +++++++++++++++
>  3 files changed, 149 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 1db20be8158b..8eac58647265 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -13,9 +13,11 @@
>  #include "xe_device.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> +#include "xe_printk.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_sysctrl.h"
>  #include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>  #include "xe_sysctrl_types.h"
>  
>  /**
> @@ -130,3 +132,83 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>  
>  	xe_sysctrl_mailbox_init(sc);
>  }
> +
> +static enum xe_sysctrl_fw_status
> +xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
> +{
> +	struct xe_sysctrl_app_status_req req = {};
> +	struct xe_sysctrl_app_status_resp resp = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	size_t out_len = 0;
> +	u32 flags;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> +
> +	req.app_id = (u8)app_id;
> +
> +	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
> +				  &req, sizeof(req), &resp, sizeof(resp));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> +	if (ret)
> +		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
> +
> +	if (out_len != sizeof(resp)) {
> +		xe_err(xe, "sysctrl: unexpected get app status response length %zu (expected %zu)\n",
> +		       out_len, sizeof(resp));
> +		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
> +	}
> +
> +	flags = resp.flags;
> +
> +	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
> +		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
> +
> +	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
> +		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
> +
> +	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
> +		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
> +
> +	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
> +}
> +
> +/**
> + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
> + * @xe: xe device instance
> + *
> + * Returns true if oCode firmware has reached the initialized state, indicating
> + * it is ready to handle requests. Returns true also on platforms without System
> + * Controller support, as there is no firmware gate to wait on.
> + *
> + * Return: true if oCode is initialized or sysctrl is not present, false otherwise
> + */
> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
> +{
> +	enum xe_sysctrl_fw_status status =
> +		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
> +
> +	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
> +	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> +}
> +
> +/**
> + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
> + * @xe: xe device instance
> + *
> + * Returns true if diag firmware has reached the initialized state, indicating
> + * it is ready to handle requests. Returns true also on platforms without System
> + * Controller support, as there is no firmware gate to wait on.
> + *
> + * Return: true if diag firmware is initialized or sysctrl is not present, false otherwise
> + */
> +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
> +{
> +	enum xe_sysctrl_fw_status status =
> +		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
> +
> +	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
> +	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index 090dffb6d55f..b69a3f474236 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -20,5 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>  int xe_sysctrl_init(struct xe_device *xe);
>  void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>  void xe_sysctrl_pm_resume(struct xe_device *xe);
> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
> +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index d0341538ad05..b507e1553cbb 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -14,9 +14,11 @@
>   * enum xe_sysctrl_group - System Controller command groups
>   *
>   * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> + * @XE_SYSCTRL_GROUP_CORE: Core group
>   */
>  enum xe_sysctrl_group {
>  	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +	XE_SYSCTRL_GROUP_CORE			= 0xFF,
>  };
>  
>  /**
> @@ -38,6 +40,69 @@ enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>  };
>  
> +/**
> + * enum xe_sysctrl_core_cmd - Commands supported by Core group
> + *
> + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
> + */
> +enum xe_sysctrl_core_cmd {
> +	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
> +};
> +
> +/**
> + * struct xe_sysctrl_app_status_req - Get application status request
> + *
> + * @app_id: Application ID for which to retrieve status
> + */
> +struct xe_sysctrl_app_status_req {
> +	u8 app_id;
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_app_status_resp - Get application status response
> + * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_* definitions)
> + */
> +struct xe_sysctrl_app_status_resp {
> +	u32 flags;
> +} __packed;
> +
> +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System Controller firmware */
> +#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
> +/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its boot sequence */
> +#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
> +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed all post-boot initialization */
> +#define XE_SYSCTRL_APP_RESP_INITIALIZED		BIT(2)
> +
> +/**
> + * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
> + *
> + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
> + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
> + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
> + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
> + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available on this device
> + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
> + */
> +enum xe_sysctrl_fw_status {
> +	XE_SYSCTRL_FIRMWARE_APP_INVALID,
> +	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
> +	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
> +	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
> +	XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
> +	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
> +};
> +
> +/**
> + * enum xe_sysctrl_app_id - Known System Controller application identifiers
> + *
> + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
> + * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
> + */
> +enum xe_sysctrl_app_id {
> +	XE_SYSCTRL_APP_OCODE	= 0x0C,
> +	XE_SYSCTRL_APP_DIAG	= 0x0D,
> +};
> +
>  /**
>   * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>   */
> -- 
> 2.43.0
> 
