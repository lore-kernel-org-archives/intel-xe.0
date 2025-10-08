Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A0FCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 22:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A89410E8F2;
	Wed,  8 Oct 2025 22:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3Msme70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F0410E8F2
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 22:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759960863; x=1791496863;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IyP5uaID29gBXaiIuDfdUeR9L3zYGqcvCvmoQdNyJrc=;
 b=V3Msme70YGhklExMckUn9s4k8WHFIMuBa+XlJZJEb/I3T7w7AlvuocEp
 lk+aUDXL792ZUd+NbljnDAz5Jxshx01qltkqBJRkhruD3EBevxUPBzf1L
 WVx3+HoDIpsNwQ0MzPEfy/zZRvtG2z1hKCsd3rtXAy3KHrOTsjHlpgdXS
 GgYG34TYjk1MenA1r0r4OFP/lDnS4mwKBVqAf1RxjWIiHLH5+AzbqJ+oK
 ebldY3TnQWdIm4ViOZhYVT9OCT9YVHawdWo3IiVsxHZCQjPSe7RrjCngL
 /04cllOzJVf5NN1Pa5UmnnGuk++SVkwT7K14A0YIRaRIiuZdZBurhZERU g==;
X-CSE-ConnectionGUID: A0yGkN4XTZ6zosCCTW/SLQ==
X-CSE-MsgGUID: IEiIUNVnQhiegXykrGNN0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73512666"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="73512666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:01:03 -0700
X-CSE-ConnectionGUID: Bcp0hBMTTD+WDkoQ/JXazw==
X-CSE-MsgGUID: cEz6uHySTz6RhhBrTIVtWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184929866"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:01:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:01:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:01:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjkD4FIvhiAi3yDsEMWHlGUqToEvhOdrXwmUebGN53nklFNN3xRcxSj75dl9vo5LYaug9bhM1aCvBy8xeuCTdxsRuUuyeaxmmLHu1bcpK3XeL3M6XQto97CkxCX7pISGAagdUsVaARGihxiKZeh0kFMj1Qd56mObY2oLEHfeWFX9IFEr9QwavHZk8fHH4Qcy8/WtxA9J22CDSTNcDobpiNFTr9C20Wf8wZwpsh8tCzn0KkyjEqy+Av3JmJZQOCBUpfiE/u+843eJVX2ljOvdVLnSW+bhTInRs1YwcnsB5qRxGIZiOxURI+/kUSBidXtzrSZ2CBgW2wGM9oT56BaS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7qNAvI7xXlKCWeesqNH1FXtAVUQcqQAOYdcVLdAsI0=;
 b=hhSLHeOXMU2JZhyNex23PfGTPfk7VAk1Pg2Ly4FjOHdEmM+3wFQ7nGJdQpKv5/igcb048Whg7CkBqmwGfRre6mdpvpzImObT6rIWEdZMzb3tAZFJEmRr3iTkRQXlq95CAm6d3B8f42PZAdPmRPKNAG/AbS9glI2+2Vps7qld12y4VYMkjb5DPBFGSfuItDxMBsAbJJ6mnHrancwK4JHPhIeWXCa3eWN2iaXgqI3lDFga/UU7j+uxea59EZJ490FndWckske0wCms8utXzi/tQUCn2wZ+RyYMDfLReixNNxRYACSUIpVhU//DB0rzFYr1nEvXVbpT9pv7EUOEPfGNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 22:00:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:00:54 +0000
Date: Wed, 8 Oct 2025 15:00:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/6] drm/xe: Rewrite GGTT VF initialisation
Message-ID: <aObfE4LRrZorXc1a@lstrano-desk.jf.intel.com>
References: <20250819101119.511705-8-dev@lankhorst.se>
 <20250819101119.511705-12-dev@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819101119.511705-12-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:303:6b::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: a5aacedf-70d6-46cd-380b-08de06b6273f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mp45LllyMTqszgDFtI0aNp0qwgGLBCukDX6Aj31lI+gcZ86nY+NOvSLr9O?=
 =?iso-8859-1?Q?bygT9BHePRfmaqONSzBAQYjIJDEjesVnMSvmcyKKDHJNW6cXQmIYSXp1w+?=
 =?iso-8859-1?Q?XMtIKw1Ts6E41y4Q6yHI7jVMOZxq6gT6JFLtDD3nOpYfWi+rqd1/0qBVIv?=
 =?iso-8859-1?Q?lLFOcj3ENHo7TEGIQw3/gpEvrXJMr1xqx7YqzvlWC5COEVrheWhO5GY+tU?=
 =?iso-8859-1?Q?0Zpyu8LrBVDLyeqinyAqRGy088tsnndsv6GTsi1YgDnPh1KTDO4yIeN5hG?=
 =?iso-8859-1?Q?6KipctY+9K/jdWaeptrV1wibNovosjjfyMrNtqw+/KkZMyt81PHRWzWEUM?=
 =?iso-8859-1?Q?bZRo2J3/ofCr5i7rpdLtcWgErhj/+uM/gNu0Zq6T4jMmAJs0goVN36wVdz?=
 =?iso-8859-1?Q?8UrrZLJgHrzVPwYbzalxP5HUxAnXpAj+T9882DD2CS9B1Tslc3EH5IM5yh?=
 =?iso-8859-1?Q?txv5CsaQ23WOLqvlNcO4ToQN2rx4EY53Hi5AJtqNcoLpZa0mruTOPGVLfb?=
 =?iso-8859-1?Q?+5XA8FfmgYnNv21Y57uRsSXpnt/XnNEZdSKbg92hM6hJ3p1rLv9ZpIf9DZ?=
 =?iso-8859-1?Q?JM1rNBR8U3iufpPVDUr5mK4cz1nzqgJGMEHuyoG9hVbvCS5OwRYmFCDWBc?=
 =?iso-8859-1?Q?XCatB0k8q02lB+UNLMrSdt99Ry+fjwtiW6muKk4swzixtHf78Me8Dg+vef?=
 =?iso-8859-1?Q?+M+KQ9Ogdr3jfQ3xvt1FAsEHhBNFhSFBLrzgPnwHp8am1vSX4XLJSvxWqz?=
 =?iso-8859-1?Q?oiaDiR15i9qYoRO6MuU+2gnaFnY3cFn38E6BpeVlZrwMkJqO2N3Rk3VRie?=
 =?iso-8859-1?Q?J6LN9MHruhCUmz/eYPR9iuRacROLokyGhFgHJ44obtvK/9Fl/kAv9BFDTU?=
 =?iso-8859-1?Q?cpJAMB4fD8xkW3duGlFdpbLDKggmJ4fO+gG+6XdJMB44eLzcaKU//8FCNz?=
 =?iso-8859-1?Q?TVU0dZE0Wznn32eWUaAY5/V3dOey7XOh4hEgz0zWrjPc7DXqb3FT/K04YD?=
 =?iso-8859-1?Q?FkzI7aLEkQ9GKQ7iIwG2Pvo5X1TW8XWyN2nZ5Dnd3zF+Eczi2V+s361et/?=
 =?iso-8859-1?Q?TDpLbC0zTobipmiYzMHcpS4K1w2X21OmxbafOi4SmSzz+tymxne0GHOuU4?=
 =?iso-8859-1?Q?8ocVBsN3ooQ79NP1rg3Ipcyb34jzn/7nxn4MeUIGfxuR5rppmyH0LtlLBk?=
 =?iso-8859-1?Q?6mYxpgVSAevwGrJ/SSDlAJZYFLNqoV0yWB/PnN803OIRGtKMjALTHJNx+T?=
 =?iso-8859-1?Q?U0PUxOHyJ4jnvxkZ/MT2ZvFu0W/SfZft82Up2enaAd17wQ53zRyg8wAk5t?=
 =?iso-8859-1?Q?duhHt2j82rwSod8tkgb0V61K6ptDfFb/Erjaj/LykoiAZa89osklCQ9jjI?=
 =?iso-8859-1?Q?sn33RrDt4oD1t28Q7Cfqs3q3woXo2SSs1uZDbifQE2CTyaT0tMOgKGUUx8?=
 =?iso-8859-1?Q?bdZcRMQBt5fiw5SKin3VbEKDx9aRxBYjRlLwvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u7B9t2gLyuy2lioMnjA9AozEcxX6/McBNqpgtcsiLfIzFEHXU4MYpiJFka?=
 =?iso-8859-1?Q?ofU+MJ+yNFLrx9mQ7RhojNLoYQhBzCOoK7VQ9VwYAJzap2WY3y7an9gL65?=
 =?iso-8859-1?Q?sj2AHOeEiTGPXJPsvgoFJqMrbhj0OZlif8QCA4XMIfNYFWnrDaibauBOqE?=
 =?iso-8859-1?Q?PJ1cFvtK2JDQ5f+KYMVhqiMT1gsemFkc3Z8tcNNV86znPEypwBXrQwazuC?=
 =?iso-8859-1?Q?Gw0QvWxDAio5cfOodx6kU2GJVeuItby/P6qSSBXVorbb4bDpxbu9UxUCwd?=
 =?iso-8859-1?Q?dC/JGLQFyExUBqdf/zs2S9j6uaHKxozPchGVSYXy17vPP84iH+oaHhxDp7?=
 =?iso-8859-1?Q?Lj+Ic4mb2q1bW54f1wzIOfh2PD8U3KdMdUWHVUZTPt5MRi4fPme3+t0hL2?=
 =?iso-8859-1?Q?MtdY+eBZ6Wlz1h1Zn0OZSEtJPNKPc+uSEYAYpH5F+DAjvupLC9sWM0ceBN?=
 =?iso-8859-1?Q?BHXVf5PD1SQocjXYTokiwNyMclExRULb6Am3feDHbmi2XfLfd5pvJeogds?=
 =?iso-8859-1?Q?4pcWkdX2Os9K6825UpuqNzBx8gsHvBa/NExSLCuc85CUgbGZMhrqkXIOcW?=
 =?iso-8859-1?Q?4Ml+5NebkWxu1mtyht25uyvgTw93BiAc4rzF2jkw8RAx/uAeS/p5hDNK/c?=
 =?iso-8859-1?Q?t7UbFa2QTc0EfDe1rSlfoG9m27mDaBxT0d9GGYVjjnYZeba5NJdcqXBxxB?=
 =?iso-8859-1?Q?6w7kgRErZOiY/msgmkn2VbADG+K1AO5KkeGfQP0+X1mvDI/6iYnrHBGGPs?=
 =?iso-8859-1?Q?4Bp5upM9exjfGnCjhiQvP0AG7mIBpXsd+LU+JtyyL5XH7xnmlPvSIgc2w/?=
 =?iso-8859-1?Q?E01wZ0fkEJr+8ChLuIbktKI2ajbRnqyP4OFIiyoCt0wcxY/roLbqNe98mM?=
 =?iso-8859-1?Q?NsldcDidNdvfL1OfXjU1ABktCDPN6EGId/f9ng85i+GWDXtO0YyxHwKqCN?=
 =?iso-8859-1?Q?NY80Ypq+LLKCMBiyMr9nfsAG5Tbg6agZxo0HWGZhOxDvLrUZYA2HwBSXto?=
 =?iso-8859-1?Q?Dy6GEBCEaKwPXpgnNeSUdprkbceU3iq6Qu4N7LRtmcuQuLKqDO1Ld9pqak?=
 =?iso-8859-1?Q?CiQIhFEAmPrd85i2JBh9GwL+OZsVw+ziy97EaNitt0m4qZvk9tXX5hgwtu?=
 =?iso-8859-1?Q?cSUQO52iFYB6BI964ZvJ9MSvlQsu8QI/+0Vz/63q3GxrnQeTPJGH5Ou2/i?=
 =?iso-8859-1?Q?E7TE+pyM7RM8MUxTBuyCOgGjQLuS/pem+WwbjGBfajLeQxaQ8lkAV+tTRa?=
 =?iso-8859-1?Q?ZDnekniQ7YiuhRB7hWnYfU4UpCtb8h9NOZQB6Jel+iV+Ux6Z6GyFuZbuT/?=
 =?iso-8859-1?Q?pviK9r8GTF+8oXsahMnIdxQS8FLypHLZ+OKaomYcFVTV5vlyBxgAlN2zTW?=
 =?iso-8859-1?Q?6m2VKzZgyga31cJ3IiYeCPUYa36KJK/uiTkSRY6lfbhZaBJZzuxrLD5oDN?=
 =?iso-8859-1?Q?fD/GpjxGGPt1DR7V3P/980tmSxalfeEnI9qGj2k6fZ5cW6gXmYv9Bgwzkk?=
 =?iso-8859-1?Q?18tdXVQ+xDPKYKfVrSEzcx042srj4YPp0UTyH0xnGtpNzEbQhHWGU+wBbB?=
 =?iso-8859-1?Q?/UxWvXiL0SbzVmP2YIEWfjR3kGZGEVgiYoNQMgCGFe8m6PRra0j2sXuCMa?=
 =?iso-8859-1?Q?QPDwunitJk16+gU69Lw1xtKOzH8jCRQzk/3iqKl9CNb7fMRRhPfon21Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5aacedf-70d6-46cd-380b-08de06b6273f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:00:54.6868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZGjY8+e1nRAGTEK4Wj0m4ONB0N1YANh1jrpzb6vuSSa+PoSIEM64ipRTxBE0FaYShjhiw6C/dz4QN4x7PGlWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
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

On Tue, Aug 19, 2025 at 12:11:22PM +0200, Maarten Lankhorst wrote:
> The previous code was using a complicated system with 2 balloons to
> set GGTT size and adjust GGTT offset. While it works, it's overly
> complicated.
> 
> A better approach is to set the offset and size when initialising GGTT,
> this removes the need for adding balloons. The resize function only
> needs to re-initialise GGTT at the new offset.
> 
> We use the newly created drm_mm_shift to shift the nodes.
> 
> This removes the need to manipulate the internals of xe_ggtt outside
> of xe_ggtt, and cleans up a lot of now unneeded code.
> 

[1] should be merged by the time you are online.

Do you want rebase on that and repost? I'll pull, test, and review.

A brief look, all of this looks sane enough btw.

Matt

[1] https://patchwork.freedesktop.org/series/139778/

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/Makefile           |   3 +-
>  drivers/gpu/drm/xe/xe_ggtt.c          | 144 +++------------
>  drivers/gpu/drm/xe/xe_ggtt.h          |   5 +-
>  drivers/gpu/drm/xe/xe_sriov_vf.c      |   4 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 254 --------------------------
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h |  18 --
>  6 files changed, 29 insertions(+), 399 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757c..d7ded8ec53166 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -152,8 +152,7 @@ xe-y += \
>  	xe_memirq.o \
>  	xe_sriov.o \
>  	xe_sriov_vf.o \
> -	xe_sriov_vf_ccs.o \
> -	xe_tile_sriov_vf.o
> +	xe_sriov_vf_ccs.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf.o \
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index b502aae5a57eb..18bf9fc7fde73 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -29,7 +29,7 @@
>  #include "xe_pm.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sriov.h"
> -#include "xe_tile_sriov_vf.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> @@ -266,7 +266,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	unsigned int gsm_size;
>  	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
> -	int err;
>  
>  	if (!IS_SRIOV_VF(xe)) {
>  		if (GRAPHICS_VERx100(xe) >= 1250)
> @@ -280,9 +279,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt_start = wopcm;
>  		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
>  	} else {
> -		/* GGTT is expected to be 4GiB */
> -		ggtt_start = wopcm;
> -		ggtt_size = SZ_4G - ggtt_start;
> +		ggtt_start = xe_gt_sriov_vf_ggtt_base(ggtt->tile->primary_gt);
> +		ggtt_size = xe_gt_sriov_vf_ggtt(ggtt->tile->primary_gt);
> +
> +		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
> +		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
> +			drm_err(&xe->drm, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> +				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);
> +			return -ERANGE;
> +		}
>  	}
>  
>  	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
> @@ -303,17 +308,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
>  	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> -	if (err)
> -		return err;
> -
> -	if (IS_SRIOV_VF(xe)) {
> -		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
> -		if (err)
> -			return err;
> -	}
> -
> -	return 0;
> +	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>  }
>  ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  
> @@ -465,84 +460,8 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>  	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
>  }
>  
> -static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> -			      const struct drm_mm_node *node, const char *description)
> -{
> -	char buf[10];
> -
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		xe_gt_dbg(ggtt->tile->primary_gt, "GGTT %#llx-%#llx (%s) %s\n",
> -			  node->start, node->start + node->size, buf, description);
> -	}
> -}
> -
> -/**
> - * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
> - * @node: the &xe_ggtt_node to hold reserved GGTT node
> - * @start: the starting GGTT address of the reserved region
> - * @end: then end GGTT address of the reserved region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
> -{
> -	struct xe_ggtt *ggtt = node->ggtt;
> -	int err;
> -
> -	xe_tile_assert(ggtt->tile, start < end);
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> -	lockdep_assert_held(&ggtt->lock);
> -
> -	node->base.color = 0;
> -	node->base.start = start;
> -	node->base.size = end - start;
> -
> -	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> -
> -	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
> -		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
> -		return err;
> -
> -	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> -	return 0;
> -}
> -
>  /**
> - * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
> - * @node: the &xe_ggtt_node with reserved GGTT region
> - *
> - * To be used in cases where ggtt->lock is already taken.
> - * See xe_ggtt_node_insert_balloon_locked() for details.
> - */
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
> -{
> -	if (!xe_ggtt_node_allocated(node))
> -		return;
> -
> -	lockdep_assert_held(&node->ggtt->lock);
> -
> -	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
> -
> -	drm_mm_remove_node(&node->base);
> -}
> -
> -static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> -{
> -	struct xe_tile *tile = ggtt->tile;
> -
> -	xe_tile_assert(tile, start >= ggtt->start);
> -	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
> -}
> -
> -/**
> - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
>   * @ggtt: the &xe_ggtt struct instance
>   * @shift: change to the location of area provisioned for current VF
>   *
> @@ -556,29 +475,18 @@ static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
>   * the list of nodes was either already damaged, or that the shift brings the address range
>   * outside of valid bounds. Both cases justify an assert rather than error code.
>   */
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
>  {
> -	struct xe_tile *tile __maybe_unused = ggtt->tile;
> -	struct drm_mm_node *node, *tmpn;
> -	LIST_HEAD(temp_list_head);
> +	s64 new_start;
>  
> -	lockdep_assert_held(&ggtt->lock);
> +	mutex_lock(&ggtt->lock);
>  
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
> -			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
> +	new_start = ggtt->start + shift;
> +	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> +	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
>  
> -	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> -		drm_mm_remove_node(node);
> -		list_add(&node->node_list, &temp_list_head);
> -	}
> -
> -	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> -		list_del(&node->node_list);
> -		node->start += shift;
> -		drm_mm_reserve_node(&ggtt->mm, node);
> -		xe_tile_assert(tile, drm_mm_node_allocated(node));
> -	}
> +	drm_mm_shift(&ggtt->mm, shift);
> +	mutex_unlock(&ggtt->lock);
>  }
>  
>  /**
> @@ -630,11 +538,9 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>   * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
>   *
>   * This function will allocate the struct %xe_ggtt_node and return its pointer.
> - * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * or xe_ggtt_node_remove_balloon_locked().
> + * This struct will then be freed after the node removal upon xe_ggtt_node_remove().
>   * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> - * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
> + * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>   **/
> @@ -655,9 +561,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>   * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
>   * @node: the &xe_ggtt_node to be freed
>   *
> - * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
> - * this function needs to be called to free the %xe_ggtt_node struct
> + * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> + * not going to be reused, then this function needs to be called to free the
> + * %xe_ggtt_node struct
>   **/
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 70cbca788b6c6..4241159eae9ad 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,10 +18,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node);
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
> -				       u64 start, u64 size);
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 5de81f213d83e..ebe5cafbe2ba2 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -7,6 +7,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
> @@ -18,7 +19,6 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_sriov_vf.h"
> -#include "xe_tile_sriov_vf.h"
>  
>  /**
>   * DOC: VF restore procedure in PF KMD and VF KMD
> @@ -279,7 +279,7 @@ static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>  
>  	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>  	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> +		xe_ggtt_shift_nodes(gt_to_tile(gt)->mem.ggtt, shift);
>  		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>  		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> deleted file mode 100644
> index f221dbed16f09..0000000000000
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ /dev/null
> @@ -1,254 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2025 Intel Corporation
> - */
> -
> -#include <drm/drm_managed.h>
> -
> -#include "regs/xe_gtt_defs.h"
> -
> -#include "xe_assert.h"
> -#include "xe_ggtt.h"
> -#include "xe_gt_sriov_vf.h"
> -#include "xe_sriov.h"
> -#include "xe_sriov_printk.h"
> -#include "xe_tile_sriov_vf.h"
> -#include "xe_wopcm.h"
> -
> -static int vf_init_ggtt_balloons(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> -
> -	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> -		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> - * @tile: the &xe_tile struct instance
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> -{
> -	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> -	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> -	struct xe_device *xe = tile_to_xe(tile);
> -	u64 wopcm = xe_wopcm_size(xe);
> -	u64 start, end;
> -	int err;
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(xe));
> -	xe_tile_assert(tile, ggtt_size);
> -	lockdep_assert_held(&tile->mem.ggtt->lock);
> -
> -	/*
> -	 * VF can only use part of the GGTT as allocated by the PF:
> -	 *
> -	 *      WOPCM                                  GUC_GGTT_TOP
> -	 *      |<------------ Total GGTT size ------------------>|
> -	 *
> -	 *           VF GGTT base -->|<- size ->|
> -	 *
> -	 *      +--------------------+----------+-----------------+
> -	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> -	 *      +--------------------+----------+-----------------+
> -	 *
> -	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> -	 */
> -
> -	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
> -	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
> -		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
> -			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
> -		return -ERANGE;
> -	}
> -
> -	start = wopcm;
> -	end = ggtt_base;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> -							 start, end);
> -		if (err)
> -			return err;
> -	}
> -
> -	start = ggtt_base + ggtt_size;
> -	end = GUC_GGTT_TOP;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> -							 start, end);
> -		if (err) {
> -			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -			return err;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static int vf_balloon_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -	int err;
> -
> -	mutex_lock(&ggtt->lock);
> -	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -	mutex_unlock(&ggtt->lock);
> -
> -	return err;
> -}
> -
> -/**
> - * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> - * @tile: the &xe_tile struct instance
> - */
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void vf_deballoon_ggtt(struct xe_tile *tile)
> -{
> -	mutex_lock(&tile->mem.ggtt->lock);
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	mutex_unlock(&tile->mem.ggtt->lock);
> -}
> -
> -static void vf_fini_ggtt_balloons(struct xe_tile *tile)
> -{
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void cleanup_ggtt(struct drm_device *drm, void *arg)
> -{
> -	struct xe_tile *tile = arg;
> -
> -	vf_deballoon_ggtt(tile);
> -	vf_fini_ggtt_balloons(tile);
> -}
> -
> -/**
> - * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> - * @tile: the &xe_tile
> - *
> - * This function is for VF use only.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> -{
> -	struct xe_device *xe = tile_to_xe(tile);
> -	int err;
> -
> -	err = vf_init_ggtt_balloons(tile);
> -	if (err)
> -		return err;
> -
> -	err = vf_balloon_ggtt(tile);
> -	if (err) {
> -		vf_fini_ggtt_balloons(tile);
> -		return err;
> -	}
> -
> -	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
> -}
> -
> -/**
> - * DOC: GGTT nodes shifting during VF post-migration recovery
> - *
> - * The first fixup applied to the VF KMD structures as part of post-migration
> - * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
> - * from range previously assigned to this VF, into newly provisioned area.
> - * The changes include balloons, which are resized accordingly.
> - *
> - * The balloon nodes are there to eliminate unavailable ranges from use: one
> - * reserves the GGTT area below the range for current VF, and another one
> - * reserves area above.
> - *
> - * Below is a GGTT layout of example VF, with a certain address range assigned to
> - * said VF, and inaccessible areas above and below:
> - *
> - *  0                                                                        4GiB
> - *  |<--------------------------- Total GGTT size ----------------------------->|
> - *      WOPCM                                                         GUC_TOP
> - *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
> - *
> - *  +---+---------------------------------+----------+----------------------+---+
> - *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
> - *  +---+---------------------------------+----------+----------------------+---+
> - *
> - * Hardware enforced access rules before migration:
> - *
> - *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
> - *
> - * GGTT nodes used for tracking allocations:
> - *
> - *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
> - *
> - * After the migration, GGTT area assigned to the VF might have shifted, either
> - * to lower or to higher address. But we expect the total size and extra areas to
> - * be identical, as migration can only happen between matching platforms.
> - * Below is an example of GGTT layout of the VF after migration. Content of the
> - * GGTT for VF has been moved to a new area, and we receive its address from GuC:
> - *
> - *  +---+----------------------+----------+---------------------------------+---+
> - *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
> - *  +---+----------------------+----------+---------------------------------+---+
> - *
> - * Hardware enforced access rules after migration:
> - *
> - *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
> - *
> - * So the VF has a new slice of GGTT assigned, and during migration process, the
> - * memory content was copied to that new area. But the &xe_ggtt nodes are still
> - * tracking allocations using the old addresses. The nodes within VF owned area
> - * have to be shifted, and balloon nodes need to be resized to properly mask out
> - * areas not owned by the VF.
> - *
> - * Fixed &xe_ggtt nodes used for tracking allocations:
> - *
> - *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> - *
> - * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> - * overlap; but our node shifting will fix addresses properly regardless.
> - */
> -
> -/**
> - * xe_tile_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> - * @tile: the &xe_tile struct instance
> - * @shift: the shift value
> - *
> - * Since Global GTT is not virtualized, each VF has an assigned range
> - * within the global space. This range might have changed during migration,
> - * which requires all memory addresses pointing to GGTT to be shifted.
> - */
> -void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
> -{
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	mutex_lock(&ggtt->lock);
> -
> -	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> -	xe_ggtt_shift_nodes_locked(ggtt, shift);
> -	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> -
> -	mutex_unlock(&ggtt->lock);
> -}
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> deleted file mode 100644
> index 93eb043171e83..0000000000000
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2025 Intel Corporation
> - */
> -
> -#ifndef _XE_TILE_SRIOV_VF_H_
> -#define _XE_TILE_SRIOV_VF_H_
> -
> -#include <linux/types.h>
> -
> -struct xe_tile;
> -
> -int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
> -void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> -void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> -
> -#endif
> -- 
> 2.50.0
> 
