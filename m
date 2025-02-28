Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18031C282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 19:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDAA10ED2A;
	Fri, 28 Feb 2025 19:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLEhYHBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EC510ED2A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740771279; x=1772307279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kyN9t+XCGVlqbEP6qYVSn1QVeEz2yLHAlC4poPjiA+Y=;
 b=fLEhYHBG6n2OYMnDJq3qIBzRMdHY5UBeTLKwg2wMAb9703JViiBceK6p
 1htMkrjeit/oE0iSSo2GQcAPm34dmVkmZ4c3f3MAR800BwqPLn5TGWkra
 ZqTBU2Nrz2HHTV33espUbdIJepkdMQVK82elEd/Gh4VZi5189a3RtcogQ
 vUQI+jn7XWctCdzOyOQoLtskmXoA77+Nn6HSr8Mzmn9LOBc/i6UfBWE3+
 3PkxmPlWfNbDyVAy/a87cfx43TdnrI7i2dLyT/UL+TRjaAXKkDhpSVnDQ
 wv54En7yF9e5fW6dbECAiynzwojS7v3kAsKDhoFjfAmyQ382dzXaSQCWA g==;
X-CSE-ConnectionGUID: tM9IpJV+RIioTmCtz+CpYQ==
X-CSE-MsgGUID: iec1dwevRbmiMUvOo3f/Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="53100057"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="53100057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:34:39 -0800
X-CSE-ConnectionGUID: zH5Yid04TJSFvpdbVSyqJQ==
X-CSE-MsgGUID: NRs8zeJPQemW+cJ56W1BTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154595450"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:34:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 11:34:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 11:34:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 11:34:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGGfNw7pLoo4Uvv5MAspf2zNd0ah07RiFdta3Gs/JQhXVVN1q7lkMiJg+MKYUnZ0iQiC7RuRzYvzgcGdewhmDbV+DbUvAUoj6eIr9ENzwwH92mUUt8gjISyHPYMrFw5vcPB/p01x6P/NPxPOToliHRBYh0BqpnZrRJGuXticr0VxI6ytMB08ChsDBq9PcuK2ghc/YbG2+GvGWjmZ+9cOsZUoisi5piHSlsCs//n3xFZz6mcI8m13aDc2m6pKhA8uiiRkORgtDQHoDoE29Wm3XGNcor7FE7WZvkxhY8xVIzhuqpoK6CEQC4OXP/GEUVfryNPblsnrKBhR25AdaVLChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sUJak9IXUZaA01hFF6MMmMfQBqeuzLyElndppr0nfA=;
 b=JyYqom6+jKgvy0Nk7LwAhFV5smvTSaDaD+tfbFW1Te3Bl073mpQpiwnWNe/ey6KC/l1nxF6flFqSGwtplfPkIq4+118OW6RihvHji68b9jDCNsHF7ZIbQA3ngDVt1WWz+p/HVsKDm6Qdc0k2tk0xlE6E/9FeQKpOxLzm3AGUvL1FEfD6YLkeHeVbcUZl20hQH3Yu3eEztPm4CnCnqPFqSqL4+hD4WxkRo70PpoYyszHvBIqffbyVMvpfm8WdPf/9z2tozRD7w9sE+ndDRsBkMK2bhk7Nu4hBRp+7BHJmjYGXPBxkgaIdqHm9jWIFZcbGOvgJZLZt+b+MryPTfiOKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB5094.namprd11.prod.outlook.com (2603:10b6:510:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Fri, 28 Feb
 2025 19:34:35 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 19:34:35 +0000
Date: Fri, 28 Feb 2025 14:34:27 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 10/12] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
Message-ID: <Z8IPw4njV3JFQDm8@intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-11-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221101736.78986-11-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0382.namprd04.prod.outlook.com
 (2603:10b6:303:81::27) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a65963-283a-4fb4-e42a-08dd582eeeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SV9BAkcineZincilxl6RoBtmlwq1KPOGBsL0avzstIzGjWzRTPN0N5S7camh?=
 =?us-ascii?Q?XsBx2chQOb7f5TkSHAxlq6QsrkZ9B1FYTwommvJ7vrC2ZH/4WGC3BpjfzsOL?=
 =?us-ascii?Q?0CDnYetfr2jd+OWPshEyzZUs/KmHcHBAWJcO5z2G6ho7PSJEdkE0DPoh0yQk?=
 =?us-ascii?Q?BbzkKf3h0pJGBCdVZCtEktyqkXYqsTDOkGaFU8SPsPzOjA0D99ZfK2sQ4mgW?=
 =?us-ascii?Q?4lnZ8NkPm7r6VmJCS9tvuqdef3L+8TYoPLSavujQJpXhRX4udpnYSnV1fErJ?=
 =?us-ascii?Q?fZ2lcDqLOpb75KG6MCtUwnv8DLAN5xTETEZydkM1USON/nb93jKFsZbOS5K8?=
 =?us-ascii?Q?TBn6kg3AZuH2b/IWlwDHdmznHvx1gkMCQiu531dUfMWciMjARzIW9PVOubYC?=
 =?us-ascii?Q?p+VfewoPU6HiDL1u9fWYMGajFuvabsAohBHSH43BigkOXf+y4g5fBeEh1xc+?=
 =?us-ascii?Q?SwFmCRiL1KTl6MZ2L2bc69322NYEK1RDNfzllouJg4Z1Sebuk0fNHOjf6+br?=
 =?us-ascii?Q?wuIoVbqU8OdxzFyGzEb1xVGJ6YkM5m3q1O2knWMQrMoLwOO7hJ4ez/eMvftV?=
 =?us-ascii?Q?aigalbyoYo2fBWsf4zdV4SEN4WEdu7+CkvtiZi6jzhzkB63ol1NGWO675aar?=
 =?us-ascii?Q?VL0geqzNswaxAv30TH/V7q8L2/nTiCLjASC6g/28dRHn8DqkTKbVxy8gHmXv?=
 =?us-ascii?Q?Io2FriPcUMn1OR1L9HOOPRqgMGv88fT1NHsTIVre7JwxpXb5maL24/LHDgK4?=
 =?us-ascii?Q?cvxZscIAxT9pNUhWVs3wgO/3CgGls6DLP/VN0s/pRqMEalnEnQhS0RiLyz/9?=
 =?us-ascii?Q?Sd6sceL4ftEab1YGcN4oX3ps8Zi4BS8y1d5G5g/UgwD9FhL5D9LvCjZ/HG5W?=
 =?us-ascii?Q?06dyP3O1QvUYoEhRdMuepnokisgdo/rSrWl+GIhYopPhHDsrgvGNBtfBBoq4?=
 =?us-ascii?Q?ZC5YFUp3lLeDQNr64aJlXveeZA+dxyF/ckhYaAEmyiYAHUpSvJkOvKUdK6bX?=
 =?us-ascii?Q?ChA7p2nSLjVs6+k1A8yNJZ9LliYMicirV2KHyzxBoZOlrrT0RClr2MsA+fjE?=
 =?us-ascii?Q?K0cVe1Q25EubMoYYqM9A3simGTtZkruZz9JlVSo08VRlU9YQcfxAdD99PLUT?=
 =?us-ascii?Q?/Ni6rQqltcxgnaoi5OjXD4/AR/XhBZI8oe806o+BB/9A3gA+Acmso3t8IjPj?=
 =?us-ascii?Q?YP3zstXgKtutgFEVtJTgMYd04KjOdLj/9mK4+fuR/h1CTte61P9OuD7AOnd8?=
 =?us-ascii?Q?J4UhNhYTUVwoc61yZQ+D57JOggXViyZlsYUGtup6wslUp3FZIAaIBYZe7cYQ?=
 =?us-ascii?Q?U+12MDzbgLhDNs9GCAxUJLLnX3j1CoJXEAFljrRgoGJDJ7CeUxpreJQOjb6c?=
 =?us-ascii?Q?rAoiuxkcgoxDz2zdPCnbMrnbyIhR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yl/qRt4UrYG3b8YQ818hyTtUVZckGxiBYYpkaJmeD6UJOvctuy1A8c0rpvRF?=
 =?us-ascii?Q?n4FkRt/9xaV+Wp0xPSePRdtrrv9CD3RGzAmgtGzfoi63TSkd68SSNnnwlWM3?=
 =?us-ascii?Q?dIMnN3C0KFAf+v6d9Nhnh5gcjRU/JtAf5uph2T4YNtfvFtOSHO3OXuvFKbf6?=
 =?us-ascii?Q?34I+Lz8b26qEhcTGsXiu1ZBwbQ+e0yBh4a+7Ce4DK6Wrf2VhXtfOb7P2VM/O?=
 =?us-ascii?Q?eigNL96kSZELaxU6a2MDNqPp607vj1yREycO2E0AZbnVQDhsxmZkB2onOlt5?=
 =?us-ascii?Q?e9YepRajaWt7BfYB+BNyQok7nn2VziXeSWiTFKSOit0dcSqRzr4mgJwYHR2W?=
 =?us-ascii?Q?faEM4x3qcsDhca3CJ9PWRpCFz2vsk2c4scF7We28nRwc7VJhISN+KNMOP8ez?=
 =?us-ascii?Q?+z3T+fKAw1nEu2Wt7RCu61mrN2qyJI9rO2aZvXb5hj/qJriIyHvbb4TvRjso?=
 =?us-ascii?Q?1MkheMBDjFdBdsv6BGKdzudyQuwRSZGwbEAvuhILx5ZPmBGsHAmoVxkOy+Mq?=
 =?us-ascii?Q?2RzwxIAr9Ew5t669pnTiNSzHCfh2T+BgRwkglkEUO9TPDyEXAShPZMh/jtD3?=
 =?us-ascii?Q?mRuXAs4KWQVWOV5ElwseRPiWmD9riTSLxy/ueK7+iDedNQQAix1OQoX9lSsj?=
 =?us-ascii?Q?kEBgZkk5hFGBCsi/2nf+SVRoDPjGU2yxRu6pOY9kNN7FomJOPRAm6KcD9Zyc?=
 =?us-ascii?Q?3wk7hc/8jriZe/2dUPghWfd0bwbKEoVV0+wCALnBQANih1QrBz8BnMuS6pud?=
 =?us-ascii?Q?GjNAKLhaGkxAGRkufp34fLNrVrw/q7YhdjaUp0ic2/NgaP4ZPUtBmHBJwJVl?=
 =?us-ascii?Q?QEYX07a9D7ACqGVZDmbXFjtvU7VjluVWfcI+RDB466JQxetkHVPmdNmsoun7?=
 =?us-ascii?Q?z8yFfV1X3xQAFgM7GOZNLlURrT5Mh1gh10MGVHZ1vpYnRzEwfv3ZTJVfM4XJ?=
 =?us-ascii?Q?E3z8iPFwIt/dD/mHMFLUDUg8wC61kweqtpoPahZoro+hipd/Tn1rO2yC6Pj0?=
 =?us-ascii?Q?rSxZ1TOkwqrJbhRrJb6ESuEYOvFXKdgcNBZu50RE3FlqoSNnVhGwrxb5zBk7?=
 =?us-ascii?Q?4Ia7+GtpREaYdIsd7GvDBtYt5NfcgEzYBL/enSnePT79LcR/55uV0OAjXVDS?=
 =?us-ascii?Q?TADMvaWqa0jC+WnmLXkPzm0AJG9ZJvOSjGzPZcyJYaJSYFnMDIuJrSqxv+PQ?=
 =?us-ascii?Q?mDuiDUlMvXQi0y6p413dN6mQeqqHdJ4J8cMGnS+eK8ncjhvSknYNF8RxTvgQ?=
 =?us-ascii?Q?lVrUDP1hfEmbPsqibWi14QwEVLCeIi5Mfz/LQp16AcRJ5K7S69qkNLl6U8ai?=
 =?us-ascii?Q?B/40Vn8OznwNXV5jsTAr8vhH460c3iU9PvEojcu300qwIUoCtu1khZlel87c?=
 =?us-ascii?Q?eycrxAeO4rG0buM9FzqnrTD9MK5dwJaRMrZcJWDxmhgA0WtdIKHfPopPbirp?=
 =?us-ascii?Q?mdOoWBG2Ci/3GkbTRI4PatgAuc59ZQxNeMuiUEC1e4uaSPfAd85d7Nrm07s2?=
 =?us-ascii?Q?8S8MZmVT5H8BoLp+fCvBXVUsmaQswSEI3YIDofoxBTzmnDSKUugBBfDZZDRn?=
 =?us-ascii?Q?MxO4P8xh5r/890kTcGfvW66Vl/0QVAwm0DKHYuiZUuiOKk+DqSL4XcJhQCy8?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a65963-283a-4fb4-e42a-08dd582eeeb4
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 19:34:35.4932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRCg2fx+/vEQrvEAWe69litAhA0ymPGchXIGHwvci6EbKpFm5+DXmN5aO31G8iHKj450lsJNOjAjvYQfJ6lQxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5094
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

On Fri, Feb 21, 2025 at 10:17:29AM +0000, Tvrtko Ursulin wrote:
> Even though frame buffer objects are created as write-combined, in
> practice, on top of all the ring buffer flushing, an additional clflush
> seems to be needed before display engine can coherently scan out the
> AuxCCS compressed data without transient artifacts.
> 
> If for comparison we look at how i915 handles things (where AuxCCS works
> fine), as it happens it has this same clflush before a frame buffer is
> pinned for display for the first time, courtesy the dynamic tracking of
> the buffer cache mode and setting the latter to uncached before handing
> to display.
> 
> Since xe considers the buffer object caching mode as static we can
> implement the same approach by adding a flag telling us if the buffer
> was ever pinned for display and flush on the first pin. Subsequent re-pins
> will not repeat the clflush but so far I have not observed any glitching
> after the first pin.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
>  2 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index a32f3603751a..5e7813154733 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -331,6 +331,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>  	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
> +	bool first_pin;
>  	int ret;
>  
>  	if (!vma)
> @@ -362,6 +363,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	if (ret)
>  		goto err;
>  
> +	first_pin = !bo->display_pin;
> +	bo->display_pin = true;
> +
>  	if (IS_DGFX(xe))
>  		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
>  	else
> @@ -382,6 +386,15 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  
>  	/* Ensure DPT writes are flushed */
>  	xe_device_l2_flush(xe);
> +
> +	/*
> +	 * Force flush frame buffer data for non-coherent display access when
> +	 * AuxCCS formats are used.
> +	 */
> +	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
> +	    intel_fb_is_ccs_modifier(fb->base.modifier))
> +		drm_clflush_sg(xe_bo_sg(bo));
> +
>  	return vma;
>  
>  err_unpin:
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 60c522866500..f518becb78c9 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -67,11 +67,6 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @update_index: Update index if PT BO */
>  	int update_index;
> -	/** @created: Whether the bo has passed initial creation */
> -	bool created;
> -
> -	/** @ccs_cleared */
> -	bool ccs_cleared;
>  
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> @@ -80,6 +75,15 @@ struct xe_bo {
>  	 */
>  	u16 cpu_caching;
>  
> +	/** @created: Whether the bo has passed initial creation */
> +	bool created : 1;
> +
> +	/** @ccs_cleared */
> +	bool ccs_cleared : 1;
> +
> +	/** @display_pin: Was it ever pinned to display */
> +	bool display_pin : 1;

Is there any way that we could have this contained within display domains
instead of spreading display specific things to the core part?

> +
>  	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>  		struct list_head vram_userfault_link;
>  
> -- 
> 2.48.0
> 
