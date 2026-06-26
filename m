Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D49CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 03:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15FF10E2F2;
	Fri, 26 Jun 2026 03:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFvac7y0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB11D10E2F2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 03:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782443653; x=1813979653;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=74WJMhGkSKKa38w15RG8e7zdAGzlx6wJ4gYa2JYUREo=;
 b=fFvac7y0z5m3UitfZOa09iUqm3TRo6D7pDcseL/QyeZ95ax94eR8a92t
 KkQNIRX4DD8cFHuxX68J2aLnbga0Mlrij1S/cF9Ga0HYghn+FhFY2JsHJ
 6HtcxzwIiW88hVzJ5CscChxI4ylMXTWs07PSARDYBMUIJOiRSaHcVIBqN
 +4s+fe0dqyzdIyXNiebY/DlS2qTU54Xf3TGbnFentVnZ0yogITNXHHQQb
 PUwJjykj4/xpmKMJQHTTdPftvLzTqYp5qaNWKcVEq3Sigay6avQ8oGOfZ
 G0oaIFSaqlfBkoBJ6qId9aaZ83n4uhagK+GwKpcTXaTWCWk6+dAxf0R6B Q==;
X-CSE-ConnectionGUID: vDag7GirRIKcfxBKVuJGXA==
X-CSE-MsgGUID: 0tZVjbt3TUSuey6S1jY5aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83248637"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83248637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 20:14:12 -0700
X-CSE-ConnectionGUID: 2UsSBaouQyK+Ynol++z2pg==
X-CSE-MsgGUID: r4IIc+uMRtm+wBvGzKhYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="289320313"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 20:14:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 20:14:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 20:14:12 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 20:14:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ii7RwZ58EQL7vGNb+f7mJKXNMmKE3AFMm734tg9rnlmvaZAIojSpL4FcerbkJI4KyOBhu6JX+u3W12tzYXsNqLoyQ+BUR99+bZEsM2RZfQfdOfPkrvoHrzwPqDElk1x+sb/DlYsVy0pypRy8dPhv+Xz7MPACol8oT8oWKIgWkZlrnYZ9px1G06dRq8pJ6mE3ZTQB+47bs8JzRQsTE7m1pzN6rGqK/QIWSee/kv08ydoQZ65KZ05fPMfTKn4l16lTsO5zqUSz1tgcyy0Bj7mlkHpyp3glIUs8EWN+COwmmN5pLUird7BRpUVaoIAqVLG6DaZpSgMBs76otqZBZE4bLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyIJcoS95XZdGCBDyeOcLenWrU6q9IIAXV9k+BF36gs=;
 b=KyNClZt8+6yCJpvAaGV7L7ScuvpqqBYAm4MLvkU6ddG3OCVmVVdXX3rt8T2h7WEx9keJsJ/Lk6V899Q3tmy1SYz3l6RRqmRHsf3mKYBHg4kCsw3IDtGeDwyJhYIAH04ErRuqutTwF2SceCm9jAbk+U+KoxgQMEgIdKnNlqb/Gfd48089RQR645V0GQE24oQZAZYUoVCuhnXSBsnnZULbTQx5/A3+LdemsiBQJ21xDWZreYUn7loa2GaG9o3JcHqTEjM+mprjbBKr95oB/5z2J9DOkaBjGZ1Hb2KExtubqfKKN9P7X6BgjR+coIsGyb9ABr91QTga18ZIDPIddjDnZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Fri, 26 Jun
 2026 03:14:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 03:14:09 +0000
Date: Thu, 25 Jun 2026 20:14:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 2/2] drm/xe: Add debugfs stats for DMA-mapped pages
 per order
Message-ID: <aj3ufn28Of5lIc0+@gsse-cloud1.jf.intel.com>
References: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
 <20260610133451.8930-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610133451.8930-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:a03:331::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: da086c90-6bcf-45e8-c1d3-08ded330fce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: mJjaX7yL4/8TXfsyl7nHYTc2QQ+I/9kZoqKikOwfreVGj99KbNifBw37wjlgcr56A7dwlCyNaQmgU9Schyt1kDMEMN9Z9eucBdYl247ijKcjuNQuTUJYsIOQ6MA9Oy3A32i7ub7+aXc37XpaoMSlk6EthrGXT7y0w5CRll28e+5Y5SKhmB0s19YVEl1x6f4jnkzttrKdTUKr+rc+WaTLtV6Ph2Kcw1HxT3thmGHCbZ+bJBMLynUwEyjxaov7/Qun5oF8hDhsb5Wgc1ZGd3Au/Y4Eg7FcVcSNVz1DD7PwfkUsubsih1SSEmcb5MR9HSJgxkURVTGVKGvljOlejJ4DT/rBscZ8UGjXURr8UMyQo4bGNJekQgxK0YTyBgXJBCViAh9cB6o1RnUFLC/idLJjjn3/eXXRIYOziVLtCUCzEFar0+Tp7z2iCjXniO5BUGOfgX3uAqVJ0mpjvcJmrGeRIDnJxbSuWL2sUrkipOpyNVCZhv2qHo/JrSiU09J4ueTdiqEWvjpDJAJlOaMjcggPOnUAux50TyXK1jxWE3saj0ZRnVtsYN9ODe1p2jGbJAx/PbZkh/0lEr9dLKehvUTqTXPq6/600hVGzBr4uqPqXPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/R8neKPiDLUFRVFBRitdVI3eYSZDdYBfa2s+LdMVYNnqWAKyyW2dFRWpwh?=
 =?iso-8859-1?Q?sBCZqgBFQcjlN0GFyo70DqP6BRQqMk4Igd8GjcEovQa2g3AK45zg4Hvu2R?=
 =?iso-8859-1?Q?Lh8GGiGeLEMwpU47Em6QdqJJwWYfGO1Sn1rXCiYK7MjTA10dLCsVUqksW1?=
 =?iso-8859-1?Q?e9Sv5KKq0fqTJ/4+mL14GF0/tM3JD6zeaAqysMdgEtgTlnA8N98ytNEf/3?=
 =?iso-8859-1?Q?Q6QjjT0g86+q5CixcEaKqoKamP/H6fHW67oc2prnCuPKhgEKq4R2jUt/Jq?=
 =?iso-8859-1?Q?vQLfAKOgzhpCY/Mx9Rq1+H2+3HuNGdxDHRiIyx+wZGY1kLxxN4/d6hcePW?=
 =?iso-8859-1?Q?0uMba2pdSr5xxTtghmmHzPZziSHNyC3SqEjlCRKQB3W3sRBGpw6NwRzo0H?=
 =?iso-8859-1?Q?PKNOtrbvAz0uBxzpZzhvy3hRom2RDkgeTaScjHvlTIfyQwdkvOXAlukRtL?=
 =?iso-8859-1?Q?CQoJ0KuHDnMaiFCbDgy4B+Wcs3OTYEnSLHBu1alYJrSFRTEpkoSzPL8AEF?=
 =?iso-8859-1?Q?e4QpwF4n3fBnPl9ES8ZwjXWOMrtD5gNA1qYMKPdWE+rvTFRG2GySu+beOG?=
 =?iso-8859-1?Q?kPwTa1p1e3r90tZY1drmd4C3EoBrnHncJzL7m+QAkbw0/MowFzVMJb+5mC?=
 =?iso-8859-1?Q?hBvsO7DkoqLNDHC8oX2v0Begy8ajygoTq5J7UcXFdFEClChHY9n++NEp7J?=
 =?iso-8859-1?Q?qZncedxxO3xEkUZ6vHH1qOYXbfvV966o7jf2wmiM/CNHBFTka/bHkdX4Jg?=
 =?iso-8859-1?Q?hKr2x8e2wOxPAqKXOmVdAAb3gDbwvYS8MKaa1P55dGL8Zjv/0RDk3pr3/V?=
 =?iso-8859-1?Q?bLn9selLy7JWwQ3bXizmz7tb4TXnPcBLFHLkWT9Wz888uqWJmmJcytrUbg?=
 =?iso-8859-1?Q?fPEIsIzdg3ERVlsRC7Dc4qC7bJqvQRr5vYIsKKj/CMK375ZO8c3huTPGTb?=
 =?iso-8859-1?Q?E2S+pp6OFLB6vFobbezYWoXkuJttHVxIRZuW3MPt80laZ/NxYmccAZHTtR?=
 =?iso-8859-1?Q?sS1EdiUVuL8ypdubB9zf682LQz4rSsivYSv15YzsZLD1ghUzdEFyUnxn95?=
 =?iso-8859-1?Q?inerzqq9xAGfuizLdkYO1NzJTmDiILsxbkMqsOywpMI6BgT8wccWXy9Xbl?=
 =?iso-8859-1?Q?8Obn7r/mE5EF/ka6VTzUNv280tuGWSh78sEVBRQzha7gmvAVCy+/VkpwEH?=
 =?iso-8859-1?Q?DTa0M5ZY/7dqKAh76IZlR1Bv5bo2JMeqFDhYCcL3DB7A1uAoYhDv8Wgmkz?=
 =?iso-8859-1?Q?8rSy7jZPChogF6QfELYJVGGYoDKWMRY5z1G48+AgvXIIbWdLKrjfai/gDz?=
 =?iso-8859-1?Q?h+af8B8WKNacJi6hMPNxlOxw95W6qfPsegzI7+rNUI9URAcX/kW0N3EUq3?=
 =?iso-8859-1?Q?PEX5v3My/MNWa9YmYc0QsIMkNjJPveXD9iYhr9RSQdzryd5KVWLjSaP2z5?=
 =?iso-8859-1?Q?2jQJxUrRIkEJXtsrdWHDGnlRulkIcwyL+LXCpNPBjFfhIx4D9j/tiaAxeI?=
 =?iso-8859-1?Q?7MegMe9qAH/eA2F8aRvzAAv/7KCZMEy28wwydddzyVJ8U4pabUzeNy1ieX?=
 =?iso-8859-1?Q?n8VhjLL6UYEHarT1/DR7nRMsBqIVJzFZ/XKnpnlX0yK5cXmxU1pvddQhTW?=
 =?iso-8859-1?Q?XWwiE76FbZfZUJRAGPyUG1blyYdE1lVfIbgKOAD4U+zxiQTvR4kYuovyzS?=
 =?iso-8859-1?Q?j4DyS7PITc5kxCyKyCwWiarSbUFBRspGFufdbH+o4FEBqetBIwcUl2k6lv?=
 =?iso-8859-1?Q?qiVp5CKUy1B1RIViOyadoN0P/ves0XsqscngyrI/zDKnGmFLe5TkJQFC53?=
 =?iso-8859-1?Q?jZ+EDpAFtw=3D=3D?=
X-Exchange-RoutingPolicyChecked: R721GWjGZIkVj5xgwFT+6sp2ze1ShPOmZHIV/HhgyMGzNvb7wfEHYYATv9v6E0rHnTk+y6DfHE1BZiMGTYSOeMkxdA2WjFtkg01ZkoQVobsc5rQ9E2BkO3RM1oaPdXTUarFQgD/qsByuEmP1e1Wjh1d0a9CQ3qSDX0kkSj7Nnuor/fR17MLaTAOK9mZfQdeXTu0KnIpepJhrMsxZKwkBaVtuLNk7xiOXP7y0PdEl0+uZAnbQY3EdQ+SoCom8EQ+aXUafgTWlCzi8JuOr0rX+k7QsO++MTj2hC9m94LlhVRFbkf88SWbUUe3wDKcPlhg3+LVDDIFQCCUhpq0X0Rvw1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: da086c90-6bcf-45e8-c1d3-08ded330fce4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 03:14:09.1805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N84ogjdVzRctiQ6o7AsQPxa5pGMkBpF68y7Vb6oQtxV3mcfkZDMnc1HKe+0o8uONvnOAka7m4ZSvsqcnputDeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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

On Wed, Jun 10, 2026 at 03:34:51PM +0200, Thomas Hellström wrote:
> Expose per-page-order DMA mapping counts for the system memory that the
> xe driver maps for GPU access, split into two categories: TTM buffer
> objects, and the GPU SVM / userptr ranges (which share a single
> drm_gpusvm instance per VM).
> 
> The stats are visible at:
> 
>   <debugfs>/dri/<N>/dma_mapped_pages
> 

This is useful, I am using heavily during shrinker, fragmentation debug.

One suggestion.

> and are broken out into two rows (bo, svm/userptr), one column per page
> order, mirroring the layout of the TTM pool page_pool stat.
> 
> For TTM BOs the order of each chunk is determined by walking the pages[]
> array and finding the largest power-of-two run that is both
> offset-aligned within the BO and physically contiguous (consecutive
> PFNs).
> 
> For the SVM and userptr ranges the accounting is driven by the
> drm_gpusvm @dma_map_account callback, which fires once per dma_addr[]
> entry at the exact point the entry is DMA-mapped and unmapped. This
> makes the accounting symmetric by construction and avoids driver-side
> walks that could drift across migration, partial unmaps and the iova vs
> non-iova paths. Only DRM_INTERCONNECT_SYSTEM entries are real DMA maps
> and counted; device interconnect (VRAM, P2P) entries are skipped, so the
> counter reflects only system pages actually mapped through the DMA layer.
> 
> The callback is shared between the full SVM instance (fault mode) and the
> core drm_gpusvm_pages-only instance used for userptr, so userptr
> mappings are accounted in both the CONFIG_DRM_XE_GPUSVM=y and =n (but
> CONFIG_DRM_GPUSVM=y) configurations, into the same svm/userptr counter.
> 
> Since the counts are only ever consumed through debugfs, gate the counter
> storage and all accounting on CONFIG_DEBUG_FS so that builds without
> debugfs carry no extra atomic traffic or device state; the drm_gpusvm
> callback is simply left unregistered in that case.
> 
> On device teardown assert that every counter has returned to zero, to
> catch any unbalanced accounting (a leaked DMA mapping) during testing.
> 
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 63 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_debugfs.c      | 26 ++++++++++++
>  drivers/gpu/drm/xe/xe_device.c       | 24 +++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h | 17 ++++++++
>  drivers/gpu/drm/xe/xe_svm.c          | 36 +++++++++++++++-
>  drivers/gpu/drm/xe/xe_svm.h          |  3 +-
>  drivers/gpu/drm/xe/xe_userptr.c      | 55 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_userptr.h      |  1 +
>  8 files changed, 222 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4c80bac67622..673ed083d131 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -367,6 +367,67 @@ struct xe_ttm_tt {
>  	bool purgeable;
>  };
>  
> +/*
> + * xe_tt_account_dma_pages - account pages in tt by contiguous aligned order
> + * @xe: the xe device
> + * @tt: the ttm_tt whose pages[] to walk
> + * @sign: +1 to add, -1 to subtract
> + *
> + * Walk the pages array and for each position find the largest order k such
> + * that the position is aligned to 2^k within the BO and the 2^k pages are
> + * physically contiguous (consecutive PFNs). Accumulate the count of 2^k pages
> + * into xe->mem.dma_mapped_pages[k].
> + */
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static void xe_tt_account_dma_pages(struct xe_device *xe,
> +				    struct ttm_tt *tt, int sign)
> +{
> +	unsigned long i = 0;
> +
> +	while (i < tt->num_pages) {
> +		unsigned int order = 0;
> +		unsigned long chunk;
> +
> +		/*
> +		 * Find the largest order k where:
> +		 *  - i is aligned to 2^k within the BO (offset alignment)
> +		 *  - 2^k pages fit in the remaining range
> +		 *  - all 2^k pages are physically contiguous
> +		 */
> +		for (unsigned int k = 1; k < NR_PAGE_ORDERS; k++) {
> +			unsigned long size = 1UL << k;
> +			unsigned long j;
> +
> +			/* offset within BO must be aligned */
> +			if (i & (size - 1))
> +				break;
> +
> +			/* must fit in remaining pages */
> +			if (i + size > tt->num_pages)
> +				break;
> +
> +			/* check physical contiguity across the chunk */
> +			for (j = 1; j < size; j++) {
> +				if (page_to_pfn(tt->pages[i + j]) !=
> +				    page_to_pfn(tt->pages[i]) + j)
> +					goto found;
> +			}
> +			order = k;
> +		}
> +found:
> +		chunk = 1UL << order;
> +		atomic_long_add((long)chunk * sign,
> +				&xe->mem.dma_mapped_pages[order]);
> +		i += chunk;
> +	}
> +}

I'd write this function like:

 436 static void xe_tt_account_dma_pages(struct xe_device *xe,
 437                                     struct xe_ttm_tt *xe_tt, int sign)
 438 {
 439         struct scatterlist *sg;
 440         unsigned int i;
 441
 442         for_each_sgtable_sg(xe_tt->sg, sg, i) {
 443                 unsigned long nr_pages = sg->length >> PAGE_SHIFT;
 444
 445                 while (nr_pages) {
 446                         unsigned int order = min_t(unsigned int,
 447                                                    __fls(nr_pages),
 448                                                    MAX_PAGE_ORDER);
 449                         unsigned long chunk = 1UL << order;
 450
 451                         atomic_long_add((long)chunk * sign,
 452                                         &xe->mem.dma_mapped_pages[order]);
 453
 454                         nr_pages -= chunk;
 455                 }
 456         }
 457 }

It should be more efficient and avoid reaching into TT internals for the
page array. Later, in the defragmenter work [1], I have a local concept
of borrowing pages / transferring ownership between two TTs, where I
encountered underflows once I implemented that. That may or may not
land, but either way, I believe the above implementation is better.

Matt

[1] https://patchwork.freedesktop.org/series/169053/

> +#else
> +static void xe_tt_account_dma_pages(struct xe_device *xe,
> +				    struct ttm_tt *tt, int sign)
> +{
> +}
> +#endif
> +
>  static int xe_tt_map_sg(struct xe_device *xe, struct ttm_tt *tt)
>  {
>  	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> @@ -396,6 +457,7 @@ static int xe_tt_map_sg(struct xe_device *xe, struct ttm_tt *tt)
>  		return ret;
>  	}
>  
> +	xe_tt_account_dma_pages(xe, tt, 1);
>  	return 0;
>  }
>  
> @@ -404,6 +466,7 @@ static void xe_tt_unmap_sg(struct xe_device *xe, struct ttm_tt *tt)
>  	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>  
>  	if (xe_tt->sg) {
> +		xe_tt_account_dma_pages(xe, tt, -1);
>  		dma_unmap_sgtable(xe->drm.dev, xe_tt->sg,
>  				  DMA_BIDIRECTIONAL, 0);
>  		sg_free_table(xe_tt->sg);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..45bdceb200ac 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -6,6 +6,7 @@
>  #include "xe_debugfs.h"
>  
>  #include <linux/debugfs.h>
> +#include <linux/mmzone.h>
>  #include <linux/fault-inject.h>
>  #include <linux/string_helpers.h>
>  
> @@ -215,6 +216,28 @@ static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int dma_mapped_pages_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = m->private;
> +	unsigned int i;
> +
> +	seq_printf(m, "%-11s ", "");
> +	for (i = 0; i < NR_PAGE_ORDERS; i++)
> +		seq_printf(m, " ---%2u---", i);
> +	seq_printf(m, "\n%-11s:", "bo");
> +	for (i = 0; i < NR_PAGE_ORDERS; i++)
> +		seq_printf(m, " %8lu",
> +			   atomic_long_read(&xe->mem.dma_mapped_pages[i]));
> +	seq_printf(m, "\n%-11s:", "svm/userptr");
> +	for (i = 0; i < NR_PAGE_ORDERS; i++)
> +		seq_printf(m, " %8lu",
> +			   atomic_long_read(&xe->mem.dma_mapped_pages_svm[i]));
> +	seq_puts(m, "\n");
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(dma_mapped_pages);
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"info", info, 0},
>  	{ .name = "sriov_info", .show = sriov_info, },
> @@ -600,6 +623,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  	if (man)
>  		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
>  
> +	debugfs_create_file("dma_mapped_pages", 0444, root, xe,
> +			    &dma_mapped_pages_fops);
> +
>  	for_each_tile(tile, xe, tile_id)
>  		xe_tile_debugfs_register(tile);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 51e3a2dd7b22..231ad742a27c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -454,10 +454,34 @@ bool xe_device_is_admin_only(const struct xe_device *xe)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static void xe_device_assert_dma_pages_zero(struct xe_device *xe)
> +{
> +	unsigned int i;
> +
> +	/*
> +	 * All BOs, userptr VMAs and SVM ranges must have been torn down by the
> +	 * time the device is destroyed, so every DMA-mapped-pages counter must
> +	 * have returned to zero. A non-zero value indicates unbalanced
> +	 * accounting, i.e. a missing unmap-side decrement.
> +	 */
> +	for (i = 0; i < NR_PAGE_ORDERS; i++) {
> +		xe_assert(xe, !atomic_long_read(&xe->mem.dma_mapped_pages[i]));
> +		xe_assert(xe, !atomic_long_read(&xe->mem.dma_mapped_pages_svm[i]));
> +	}
> +}
> +#else
> +static void xe_device_assert_dma_pages_zero(struct xe_device *xe)
> +{
> +}
> +#endif
> +
>  static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> +	xe_device_assert_dma_pages_zero(xe);
> +
>  	xe_bo_dev_fini(&xe->bo_device);
>  
>  	if (xe->preempt_fence_wq)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32dd2ffbc796..6fe94fc18008 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_DEVICE_TYPES_H_
>  #define _XE_DEVICE_TYPES_H_
>  
> +#include <linux/mmzone.h>
>  #include <linux/pci.h>
>  
>  #include <drm/drm_device.h>
> @@ -279,6 +280,22 @@ struct xe_device {
>  		struct xe_shrinker *shrinker;
>  		/** @mem.stolen_mgr: stolen memory manager. */
>  		struct xe_ttm_stolen_mgr *stolen_mgr;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +		/**
> +		 * @mem.dma_mapped_pages: number of DMA-mapped pages per page
> +		 * order currently live for this device, for TTM BOs. Only
> +		 * accounted when CONFIG_DEBUG_FS is enabled, since it is solely
> +		 * exposed through debugfs.
> +		 */
> +		atomic_long_t dma_mapped_pages[NR_PAGE_ORDERS];
> +		/**
> +		 * @mem.dma_mapped_pages_svm: number of DMA-mapped pages per
> +		 * page order currently live for this device, for SVM ranges
> +		 * and userptr VMAs (both share a single drm_gpusvm instance).
> +		 * Only accounted when CONFIG_DEBUG_FS is enabled.
> +		 */
> +		atomic_long_t dma_mapped_pages_svm[NR_PAGE_ORDERS];
> +#endif
>  	} mem;
>  
>  	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index e1651e70c8f0..03cfbf831257 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -817,10 +817,42 @@ static int xe_svm_get_pagemaps(struct xe_vm *vm)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +/*
> + * xe_svm_dma_map_account - drm_gpusvm DMA-mapping accounting callback
> + * @gpusvm: The GPU SVM the mapping belongs to
> + * @addr: The address descriptor of the chunk being (un)mapped
> + * @sign: +1 when @addr was DMA-mapped, -1 when it is being unmapped
> + *
> + * Maintain per-order counts of the system-memory pages that the full SVM
> + * instance (SVM ranges, and userptr VMAs in fault mode) has DMA-mapped for GPU
> + * access. Only DRM_INTERCONNECT_SYSTEM entries are real DMA maps and counted;
> + * device interconnect (VRAM, P2P) entries are skipped. The counts are solely
> + * exposed through debugfs, so the callback is only registered when
> + * CONFIG_DEBUG_FS is enabled.
> + */
> +static void xe_svm_dma_map_account(struct drm_gpusvm *gpusvm,
> +				   const struct drm_pagemap_addr *addr,
> +				   int sign)
> +{
> +	struct xe_device *xe = gpusvm_to_vm(gpusvm)->xe;
> +	unsigned int order = addr->order;
> +
> +	if (addr->proto != DRM_INTERCONNECT_SYSTEM)
> +		return;
> +
> +	atomic_long_add((long)(1UL << order) * sign,
> +			&xe->mem.dma_mapped_pages_svm[order]);
> +}
> +#endif
> +
>  static const struct drm_gpusvm_ops gpusvm_ops = {
>  	.range_alloc = xe_svm_range_alloc,
>  	.range_free = xe_svm_range_free,
>  	.invalidate = xe_svm_invalidate,
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	.dma_map_account = xe_svm_dma_map_account,
> +#endif
>  };
>  
>  static const unsigned long fault_chunk_sizes[] = {
> @@ -915,8 +947,8 @@ int xe_svm_init(struct xe_vm *vm)
>  		}
>  	} else {
>  		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
> -				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
> -				      NULL, 0);
> +				      &vm->xe->drm, NULL, 0, 0, 0,
> +				      xe_userptr_gpusvm_ops_get(), NULL, 0);
>  	}
>  
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index b7b8eeacf196..729627abb08e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -234,7 +234,8 @@ int xe_svm_init(struct xe_vm *vm)
>  {
>  #if IS_ENABLED(CONFIG_DRM_GPUSVM)
>  	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
> -			       NULL, 0, 0, 0, NULL, NULL, 0);
> +			       NULL, 0, 0, 0, xe_userptr_gpusvm_ops_get(),
> +			       NULL, 0);
>  #else
>  	return 0;
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 6761005c0b90..08e0d4d25f8b 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -8,9 +8,64 @@
>  
>  #include <linux/mm.h>
>  
> +#include <drm/drm_pagemap.h>
> +
>  #include "xe_tlb_inval.h"
>  #include "xe_trace_bo.h"
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +/*
> + * xe_userptr_dma_map_account - drm_gpusvm DMA-mapping accounting callback
> + * @gpusvm: The GPU SVM the mapping belongs to
> + * @addr: The address descriptor of the chunk being (un)mapped
> + * @sign: +1 when @addr was DMA-mapped, -1 when it is being unmapped
> + *
> + * Account, per page order, the system-memory pages DMA-mapped for GPU access
> + * through the drm_gpusvm_pages instance shared by userptr (and, in fault mode,
> + * SVM). Only DRM_INTERCONNECT_SYSTEM entries are real DMA maps and counted;
> + * device interconnect (VRAM, P2P) entries are skipped. The counts are solely
> + * exposed through debugfs, so the callback is only registered when
> + * CONFIG_DEBUG_FS is enabled.
> + */
> +static void xe_userptr_dma_map_account(struct drm_gpusvm *gpusvm,
> +				       const struct drm_pagemap_addr *addr,
> +				       int sign)
> +{
> +	struct xe_vm *vm = container_of(gpusvm, struct xe_vm, svm.gpusvm);
> +	unsigned int order = addr->order;
> +
> +	if (addr->proto != DRM_INTERCONNECT_SYSTEM)
> +		return;
> +
> +	atomic_long_add((long)(1UL << order) * sign,
> +			&vm->xe->mem.dma_mapped_pages_svm[order]);
> +}
> +
> +static const struct drm_gpusvm_ops xe_userptr_gpusvm_ops = {
> +	.dma_map_account = xe_userptr_dma_map_account,
> +};
> +#endif
> +
> +/**
> + * xe_userptr_gpusvm_ops_get() - Accounting ops for the simple gpusvm instance
> + *
> + * The core drm_gpusvm_pages-only instance used for userptr (and, in fault
> + * mode, shared with SVM) is initialised with these ops so that DMA-mapped
> + * system pages are accounted and exposed through debugfs. Returns NULL when
> + * CONFIG_DEBUG_FS is disabled, in which case no accounting is kept and the
> + * instance is initialised without ops.
> + *
> + * Return: Pointer to the restricted &drm_gpusvm_ops, or NULL.
> + */
> +const struct drm_gpusvm_ops *xe_userptr_gpusvm_ops_get(void)
> +{
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	return &xe_userptr_gpusvm_ops;
> +#else
> +	return NULL;
> +#endif
> +}
> +
>  static void xe_userptr_assert_in_notifier(struct xe_vm *vm)
>  {
>  	lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
> index 2a3cd1b5efbb..1e9601be5713 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> @@ -108,6 +108,7 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
>  int xe_vm_userptr_check_repin(struct xe_vm *vm);
>  int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
> +const struct drm_gpusvm_ops *xe_userptr_gpusvm_ops_get(void);
>  #else
>  static inline void xe_userptr_remove(struct xe_userptr_vma *uvma) {}
>  
> -- 
> 2.54.0
> 
