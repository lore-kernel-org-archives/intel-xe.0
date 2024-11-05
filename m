Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882BAD1CA13
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 00:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537CA10E157;
	Tue,  5 Nov 2024 00:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+mgIjci";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EE910E157
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 00:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730767775; x=1762303775;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j1t1SENTnCGzIVBdtBUF0xngaYQKE72peTmfT3otkKE=;
 b=a+mgIjcitSoVB/sVxSrw2AjkoVe68yqRUS3Os6gVEV0qqWpq+K6BT2ST
 QyxzDS/HKhM+9QJUB82nTeai/QJKkH65jVtR0rTMtPodY1e3UPym4Yx52
 VzqUg6Ij+r2bAG+kZYFcs4+0L/h6nZybuYrlIOr7UE2IJcLN6v98dLK6u
 bLYMooT+ydzzGRQbPazFD8uZTw/GF+SWh1y05BRdzHGRo1XUx9+IPDoB6
 5ZWG/GxAKu+jMosnycyWMjTIeobkM4sgxJSG0WxF/WS9qq1VRK2R/qmDA
 n2X+KpgQnFr3cLpH/0AnYuWYYoLTOXb3RDa+7tTGpLqzbjFV0ld1U94ju g==;
X-CSE-ConnectionGUID: KGo2xv0WT1u7BMxrSOgyHA==
X-CSE-MsgGUID: pg+bQf1IS06A85RtssUmTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30654295"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30654295"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 16:49:32 -0800
X-CSE-ConnectionGUID: aSwY3Y5ITaCGiCQt/KRqGg==
X-CSE-MsgGUID: lkGoO/DiQcSoKSWleTBPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83704610"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 16:49:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 16:49:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 16:49:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 16:49:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HW8tx9VlLVvyQEvQ1LbNBw0mhEzL2dszgmXaDw5SSCultvtX3QKOrVJgA6KtUdfHR4o5tfxrwMWYsOveHx+QJ4ZGglRFm5z8ZYa8SIb2ttax2xI6fQuLrytE+HlpEiD36CeXOZNmCv0d04LzSJ1D3XX1c7MUpP+OFrt4q5ypZk0g7ZFC7gstUqjqHd6ET21RBV1YWvIzd/jY4WRflHbPGraRiM3lfU1LV46K/gR9IbfoPkuk1YCa5PaSjeDpCUZQ2myY5H5BCwllOfEusNMl/HUeZHJ2w/8EtXXmdVDJ+/81thwNq9yIybiHG8ln5eHdXk/GDX+WtgH5ODrxNoKApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVH/+Hh/06pvlAvfK14/QTl7l939HcxNewfYzhTmjmQ=;
 b=FDTVhk4y9IfgyF63r95BlrVirGbaoVDLWsm2eIxEsRZp4ZH+e+fGEYePQ917rc+q6QOH6zM+Qyj3M8DqWEA/0aJ9zG3N/bi8daxD93ysQ+LkoV9fTc3EExBviuHF58E0SvzQ6h7FfqIlUJ97G4pHisd23JGGAvA9e5T6IqMIBtmPRVKa1w7YXQabxTkKqRxFpneQDn/aYiV9QMiaMIWVVScDNhmoaeSkKCmE/g/OPN3K2fdW5vJORgpbLNwk4thtJrqccmUoBNUtDgVLOdvGi5Q0+k0Z60gJp30CKDD641jY/YifDAy69fwytaKrG0GTWGrB+lOu3nZeRMhUDJSd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8199.namprd11.prod.outlook.com (2603:10b6:208:455::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:49:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 00:49:24 +0000
Date: Mon, 4 Nov 2024 16:49:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add read/write debugfs helpers for GGTT node
Message-ID: <Zylrsw40oX0fGVU2@lstrano-desk.jf.intel.com>
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
 <20241103201633.1859-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241103201633.1859-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:303:8e::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: ae73692f-39da-4431-8c03-08dcfd33b155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ghfKjNC8zQu/rgCbDC6iomF+cjJSGrY1BOfbLaIsbJrPfk12ZhEeso4fUNxP?=
 =?us-ascii?Q?wCnW/UsQ5fQCJDa31c9XtA375gGjo4Ki4M1GtCPC8s4d3JlEGkMF9khPGIvt?=
 =?us-ascii?Q?1FjxiZR0dbP/8X6rSg6CVYyXR9UL0I/Zw5hIOKYGRbJd7g6KYTSTmetp/4Yz?=
 =?us-ascii?Q?YVp+6bu8SiELqVS4k+HtOYQcF6LzcXGh84HFUrP5COTr8qNe5tRk59PPWEIt?=
 =?us-ascii?Q?X2aliHWaMRZPIB/JR2VLS1EY+9ZKNoJPcFylU8tH0vkaiXRRKmIL33BOulMS?=
 =?us-ascii?Q?vOdH4VFTTj771pewFJhViQL9vSN570RjcHbnjkze65XadluvJk+OoJhZUCBe?=
 =?us-ascii?Q?zbzvLey16xsF99DXM0n+SDz87PnQ9wTVifnyfTiBzPebxT1h94d8Y3+0NDh+?=
 =?us-ascii?Q?bjDI/Hl+BQnGVwkKhQewbVFZKPc/69h0Bay780Hap4NdEM3qIY+j7IGZHHJk?=
 =?us-ascii?Q?ccHQeS1I8nZkhTSk1A4XNwmv2Wna8iCxqDoslEb294bWtXMuaRJs0eUyPTgz?=
 =?us-ascii?Q?SNlA730sLDqM3fvwYJHypKfXiOzeVP4KwIRgz5yuO0sRRaHJ6m+rXKPIJgBg?=
 =?us-ascii?Q?IEp5/eqGwhQlF+cl6bnMXcNCMHvIOp8Fk9bJno83QRezb8mfUzlyZ2ue3QRO?=
 =?us-ascii?Q?Qqi9c5CZz+O1fDQgMurCXP/j39dVl41PDTPl/I7mUxvYHPTWLsqVC7lSXzny?=
 =?us-ascii?Q?Iwi+JwB0sQNqlQW43hWbyyEhzn0gKI3X5pRPMGmTBGSxrq4zGtwpZ5nE+pFe?=
 =?us-ascii?Q?pPWUXy/xSZ/Ujw6f7RmJJu93r7TvUVPM8K68zZjFgP8qWzJLsVBD5H9QOJCb?=
 =?us-ascii?Q?8MeXQvHzBwx931Q2PHH8YzYUp3GRUnzzKuXIBbclqclZgeyW6XMxIFiT6wR4?=
 =?us-ascii?Q?FUxVUWLMFg9Og/Jyv10kVwzQwnX65ral4UFziLfcguf3CiDV3kgI57n+IQPy?=
 =?us-ascii?Q?IiIBXdZrOhGtfoHkdhhI4wbl38ld0TAzmsKCLc+KoCVNeiN1RYxrVqn3l5/K?=
 =?us-ascii?Q?Pj2XGScnUBoGi3jki2YS34smP4JHlTY2gOQvkfzyDIiAWKcAYK1TxSBm8jxl?=
 =?us-ascii?Q?8fVkDdM17kO9M5x4+L1YuQqLpF/z1hxCA57heiFmV8Kx5iCYFDQdj0AOt80w?=
 =?us-ascii?Q?b8yBgWsAr8PoAB0icbUmKdZLyIbbd9O270L/sZfpfalBuoiSr9wVX1N/yrio?=
 =?us-ascii?Q?M1rVBNU1nzVxZjQxJ74sErRZ4AU6rOjtTIDaXANcwdI7d528wKO0KKm4BSXr?=
 =?us-ascii?Q?sVgGhZy0qCUCA+M1M3jsY1NptnTMWnZwW7TNDlHu3cM5CJtXUwXNFDhxAUL9?=
 =?us-ascii?Q?jqiB7TIrUKfwFOhtCPPeWQo2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fzh19GGoOCtRsolX4A8ERjNd0ZgwMv0EjhcXs3L5eZ9aemhd08PzV/uWjy4u?=
 =?us-ascii?Q?FBS7vI5608vSZQzl85jqbjvNO6Pnd1wMqHdjrTSUQXE9e1mUVVu1we+481/P?=
 =?us-ascii?Q?bw8kGhIbJv/l4SUvnU+Wr6JynnpMVguPJioelpAAYDgqiDo3h36vXewcmQOZ?=
 =?us-ascii?Q?08Ko2Ce0dRid+a5QQlR8OLHpXSDIDiBRbfVcnHEcEXfN9sFKYqlq49mur6zJ?=
 =?us-ascii?Q?uow0zvCQ5eNULe4IXSPLFBVjmTmt5Tt1Q8YNyoU1bLREi5UHMOb3S9H2ThFo?=
 =?us-ascii?Q?ShLC6bY+j3Lt50xyMJu/p1o1g3MS0hOwf4UbGnzZk4XrbwZmW6+8t8yJM8xt?=
 =?us-ascii?Q?c6KjKGcYV2a+DmXt7tQtylcUGH1PXMd01ZJ8nQ1/GZcOwvtKnBumwW5c6l9v?=
 =?us-ascii?Q?zSFoM70gnOTl9+JyPW56qHyVjQz0DtYj9mn4fXPeYJoeU1TZNpdHVLggkq8N?=
 =?us-ascii?Q?xoGflxzemPIKKX23mXzDNtpEqi5hqNxU5rOr5mPQQnsAs+jELaj8v8W66xnX?=
 =?us-ascii?Q?H6plT7SWszg2xZw6npt2QgeushK4ifTGhgtuLafmfED3oD7Up23HsbxtYSC1?=
 =?us-ascii?Q?USDSbHo7wDbRUCmAKs6QNS2Ki5r/G1UsTqCgfaaPkU0wijGRjgwYix5c8GwJ?=
 =?us-ascii?Q?4tAuzOIqQx97g7MU0kwWKCGeOh3QoG8kPqSFRB55dBRZJu881uY0rOSakiW1?=
 =?us-ascii?Q?1aMUWOE9Y9qK8zV4a4DFCDTrmd2fWLaTdy/bKuvGkXdWOO1TXK5zL0Q2UyXv?=
 =?us-ascii?Q?Iv+gqGVoD6IJdLSTyrCJUJ6pggUu/2nhQZervG08vlCQ123rZOwHZ3qga+BE?=
 =?us-ascii?Q?K3ZKPZRpgeCCRKCJ4RqwKO25zuWHENh+htWUthQ2KZ6pD/H9d9p1B11kf5zq?=
 =?us-ascii?Q?vumGx/W/grGShg5ROgrtJFi+ydLuN1Q4cwD8+OcdHZUHnVSXRUZOd1wSGBik?=
 =?us-ascii?Q?oTleYv7bOigrH4MtnMF9zQh38JRc9aUpa9Eu4X9/+h0m7itZrea8MmyWw48i?=
 =?us-ascii?Q?EqMiIznaT2AeEwT+HARmWt6CXWqrqK/Yon86JWZwI+tFacTUkZ3dRoZMp6lA?=
 =?us-ascii?Q?rYcKkQFyDCYV+qX1LmcdXpwzE3OCpGJ2317vJZf0Bt9yZo34kSINRTi18+FP?=
 =?us-ascii?Q?C1EL8KePJMgQOvQaP9QlScCq/MHUSOWz65XbNFIHb4IwBq4ub4FZGX7g+x9p?=
 =?us-ascii?Q?tF9m1zFR0ln28Pib5RN6GvzTlRRPa7wGMP6sQB9Efct53TjrYHx+3/0JOZcX?=
 =?us-ascii?Q?RcJQkCsfNTHy/Zj8cI7j3tslbP/AFxuyrW1xm126PjxNmg0itWY/uiMiePoi?=
 =?us-ascii?Q?MjpBtTcSe6+bMLYNPI1+xiuVNP8Eby143Rh1ANicUU9gbC3ROQGt222rujuF?=
 =?us-ascii?Q?eloGhWUs54Pnd0GwUjk2DxWjHMfnjt0i6DtEcwfK0ki6naXNLue0gG0UAIgl?=
 =?us-ascii?Q?K7L+zMk4w1N0BcL1J/b3g6YjcogUeh0TI2Xr34GvjfNcFb181CBy9EoCv32z?=
 =?us-ascii?Q?fGcXlrGVEx8hgLk/rMJ4Mx43Nm9rU6TSBX12y8pIwmfijZWaMlN0NghZRB6M?=
 =?us-ascii?Q?vWtdHUA4AQRWb3dTmGmmS+QJyBosSFv+sVIYxgaW0eNwBTEwKTqkcalAMiST?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae73692f-39da-4431-8c03-08dcfd33b155
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:49:24.1270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jm4SXAnTe1me7z+TUlRwSTPiOvZ1JzsZs9OjzfbF0ZiCN3+phXfLS/pSY48nL62K0KbeiMblUSWjqwgKqXtoXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8199
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

On Sun, Nov 03, 2024 at 09:16:32PM +0100, Michal Wajdeczko wrote:
> In upcoming patch we want to allow copying and updating PTEs of
> some GGTT nodes over debugfs. Add simple helpers for that.
> 

On the surface it very much looks like are reinventing something that
almost certainly already exists or if it doesn't we should try to do
this in a common way. Have you looked for any similar code to this in
the kernel.

Matt

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 178 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h |   7 ++
>  2 files changed, 185 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 558fac8bb6fb..e003f5f51ac6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -838,3 +838,181 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
>  
>  	return total;
>  }
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +static size_t copy_iomem_to_user_by_chunk(void __user *to, const void __iomem *from,
> +					  size_t count, void *buf, size_t size)
> +{
> +	size_t chunk;
> +	size_t rem;
> +
> +	while (count) {
> +		chunk = umin(count, size);
> +		memcpy_fromio(buf, from, chunk);
> +		rem = copy_to_user(to, buf, chunk);
> +		count -= chunk - rem;
> +		if (rem)
> +			break;
> +		from += chunk;
> +		to += chunk;
> +	}
> +
> +	return count;
> +}
> +
> +static size_t copy_iomem_to_user(void __user *to, const void __iomem *from, size_t count)
> +{
> +	char chunk[64];
> +	size_t size;
> +	size_t rem;
> +	void *buf;
> +
> +	if (!count)
> +		return 0;
> +
> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
> +	if (buf) {
> +		rem = copy_iomem_to_user_by_chunk(to, from, count, buf, size);
> +		kfree(buf);
> +		return rem;
> +	}
> +
> +	return copy_iomem_to_user_by_chunk(to, from, count, chunk, sizeof(chunk));
> +}
> +
> +static ssize_t simple_read_from_iomem(void __user *to, size_t count, loff_t *ppos,
> +				      const void __iomem *from, size_t available)
> +{
> +	loff_t pos = *ppos;
> +	size_t rem;
> +
> +	if (pos < 0)
> +		return -EINVAL;
> +	if (pos >= available || !count)
> +		return 0;
> +	if (count > available - pos)
> +		count = available - pos;
> +
> +	rem = copy_iomem_to_user(to, from + pos, count);
> +	if (rem == count)
> +		return -EFAULT;
> +
> +	count -= rem;
> +	*ppos = pos + count;
> +	return count;
> +}
> +
> +/**
> + * xe_ggtt_node_read() - Copy PTEs from the GGTT node to the user space buffer
> + * @node: the GGTT node to read from
> + * @buf: the user space buffer to read to
> + * @count: the maximum number of bytes to read
> + * @ppos: the current position
> + *
> + * Return: On success, the number of bytes read is returned and the offset
> + * @ppos is advanced by this number, or negative value is returned on error.
> + */
> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
> +			  size_t count, loff_t *ppos)
> +{
> +	if (!xe_ggtt_node_allocated(node))
> +		return 0;
> +
> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
> +
> +	return simple_read_from_iomem(buf, count, ppos,
> +				      &node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
> +				      size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE));
> +}
> +
> +static size_t copy_iomem_from_user_by_chunk(void __iomem *to, const void __user *from,
> +					    size_t count, void *buf, size_t size)
> +{
> +	size_t chunk;
> +	size_t rem;
> +
> +	while (count) {
> +		chunk = umin(count, size);
> +		rem = copy_from_user(buf, from, chunk);
> +		memcpy_toio(to, buf, chunk - rem);
> +		count -= chunk - rem;
> +		if (rem)
> +			break;
> +		from += chunk;
> +		to += chunk;
> +	}
> +
> +	return count;
> +}
> +
> +static size_t copy_iomem_from_user(void __iomem *to, const void __user *from, size_t count)
> +{
> +	char chunk[64];
> +	size_t size;
> +	size_t rem;
> +	void *buf;
> +
> +	if (!count)
> +		return 0;
> +
> +	size = count > sizeof(chunk) ? umin(PAGE_SIZE, count) : 0;
> +	buf = size ? kmalloc(size, GFP_NOWAIT | __GFP_NORETRY) : NULL;
> +	if (buf) {
> +		rem = copy_iomem_from_user_by_chunk(to, from, count, buf, size);
> +		kfree(buf);
> +		return rem;
> +	}
> +
> +	return copy_iomem_from_user_by_chunk(to, from, count, chunk, sizeof(chunk));
> +}
> +
> +static ssize_t simple_write_to_iomem(void __iomem *to, size_t available, loff_t *ppos,
> +				     const void __user *from, size_t count)
> +{
> +	loff_t pos = *ppos;
> +	size_t rem;
> +
> +	if (pos < 0)
> +		return -EINVAL;
> +	if (pos >= available || !count)
> +		return 0;
> +	if (count > available - pos)
> +		count = available - pos;
> +
> +	rem = copy_iomem_from_user(to + pos, from, count);
> +	if (rem == count)
> +		return -EFAULT;
> +
> +	count -= rem;
> +	*ppos = pos + count;
> +	return count;
> +}
> +
> +/**
> + * xe_ggtt_node_write() - Update PTEs of the GGTT node using data from the user space buffer
> + * @node: the GGTT node to write to
> + * @buf: the user space buffer to read from
> + * @count: the maximum number of bytes to read
> + * @ppos: the current position
> + *
> + * Return: On success, the number of bytes written is returned and the offset
> + * @ppos is advanced by this number, or negative value is returned on error.
> + */
> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
> +			   size_t count, loff_t *ppos)
> +{
> +	if (!xe_ggtt_node_allocated(node))
> +		return -ENXIO;
> +
> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.start, XE_PAGE_SIZE));
> +	xe_tile_assert(node->ggtt->tile, IS_ALIGNED(node->base.size, XE_PAGE_SIZE));
> +
> +	return simple_write_to_iomem(&node->ggtt->gsm[node->base.start / XE_PAGE_SIZE],
> +				     size_mul(sizeof(u64), node->base.size / XE_PAGE_SIZE),
> +				     ppos, buf, count);
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 27e7d67de004..64746e23053e 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -34,6 +34,13 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>  u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
>  
> +#ifdef CONFIG_DEBUG_FS
> +ssize_t xe_ggtt_node_read(struct xe_ggtt_node *node, char __user *buf,
> +			  size_t count, loff_t *pos);
> +ssize_t xe_ggtt_node_write(struct xe_ggtt_node *node, const char __user *buf,
> +			   size_t count, loff_t *pos);
> +#endif
> +
>  #ifdef CONFIG_PCI_IOV
>  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
>  #endif
> -- 
> 2.43.0
> 
