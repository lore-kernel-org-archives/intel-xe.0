Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0316C79FA7
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 16:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C4110E473;
	Mon,  5 Jan 2026 16:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mw/72hVU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A28C10E473
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767630418; x=1799166418;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HxpDrlyayHbFg4IG1s1dUOhwCECXX6MMruJ23Lm6wc8=;
 b=Mw/72hVUxLmdlGie+14cWIKP+Ji20zN09Tn7nHdOQhdgOc3PvvOP+ulI
 TquDfGO1ms6+jkvTqUk6paAdEfd65i/C585dB49M89uj9Bf6eIJ+saaWZ
 Pk3i9eyybpKwP+030f6Sv7thzglIkbjdvvjgf7ykcnbvB1iZi8BEptR5M
 h0TtGDIJYFa/WsnZPW1U46PxMHVcnokBtezoNVwoT1eRKNrHPMLn6g447
 5kJgxUbCrK1Qhzict5dT648Wz61/E8y7S4s74u4ITNgXxmrw3kjVhZKAj
 QDDouah/OwdjmKLsBdcZGv6Vjz4DXkt9gnh99iRVnp+ASHigJ1ml180Q/ g==;
X-CSE-ConnectionGUID: 3zZi99TjTJCfj2d8Mm5njg==
X-CSE-MsgGUID: OsadipuTSrGM9jDh4yl06w==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69070129"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69070129"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:26:57 -0800
X-CSE-ConnectionGUID: yCxE+C/TQtGwSAcWvwqL2g==
X-CSE-MsgGUID: v1k2vyXfRmmmuW47/1QNRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="207461877"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 08:26:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:26:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 08:26:55 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 08:26:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXDFDsxuKvuOhzGCO9rlVFF8l/P5fTsW9eMR8PUXbmomC4zGHhBa81s7CBkdxpNDz8hxRQ0sWjw3SX144uWf6PjqVjV5l+i59Ajbt5HTDduUxiQm2QX6AOTYmPuIp61EJpxrYFlJP4jlVOGoOs6zXqom6/OcwYQTYfNzfbwmebUbsJUcNFYe3WPADHY+v4N+vvDQ/yf3+hoWNwzDp9PtOtH/hxq9MhUcVNOMijozffUDdcuFdEMbgfnH8Oq49z122/1/X8hZoXQVdj/lPmZZKvyWQ5BuzmtHYd0qneyKHg0rkno4aTaUPXrWELQhCjAw3E9h5uAbkxwjY/C2341uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uZhAUBzQTIB6es0oJ+WarU2iJJMpXi4eRHTZOlQ8N8=;
 b=hjeeKbeVsQ+t1GQeFWgetO3+LDBcSodcSIy8PVqEhdZxT4hga3qSTJLLGNUbLNQl8ilhGPgOVOf3PGZh0yAdRsMPKtE2pPffRzE+tfPU5W3erv4f6d/OyYoVMmmFCO3hyOthlvCanFPg/qMy7OTgBWw1h3BSZLIHFjxs/ximodTLnnRD12/AgirN9O6XkfOKaj2c2NqJFQwq7W2e7dcURXQk/SivzLaA8P3DVXOAtprGAN/d/CF0RnjS53p8DSGisnlOudPrNa6cobT+0xYJEKG8ri5KTTWFObre544Nxd1ae1O7q1cQl8vfTRgUmwdvr6DnIyhBY0FyXYB/ZMxWHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:26:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Mon, 5 Jan 2026
 16:26:47 +0000
Date: Mon, 5 Jan 2026 08:26:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Add page reclamation related stats
Message-ID: <aVvmRcMNMytX6SSH@lstrano-desk.jf.intel.com>
References: <20251224233638.1535283-4-brian3.nguyen@intel.com>
 <20251224233638.1535283-6-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251224233638.1535283-6-brian3.nguyen@intel.com>
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: fa75d064-90b7-4f28-8732-08de4c773907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iRIKdDC1PqKHmyrzmWOkmPfC06HpPhbC1xjN3YTbNj2CPbTt6zZdgMUckuMe?=
 =?us-ascii?Q?3FlmNgr2SHdene81WWZ7OU7LCd1BiYTIDcjEQJ6X3Q7TD5eSnADrtW1QUpx6?=
 =?us-ascii?Q?XjNacngcjwpA0lQOJomSfQcH8OFISoJBZSFmiGlxqcGTbnlG1i7EAA+XOAaa?=
 =?us-ascii?Q?Uu0itDPJH6/EeC33UtgjWvmvTd1wYotuywqb+H0ILzzuCy22V/IQCI57ZK3P?=
 =?us-ascii?Q?gRsfavpkkEeRHbDuwIT32PIItJJX4/RO5R0HAeEAoKvJ/q3pBE9mggtNF6Zo?=
 =?us-ascii?Q?IUhgY7XfyzOqkofZ/3C/osXpjDGmYMFFHlhDxBSbQj1+YGfZvFtD2BxA2gmL?=
 =?us-ascii?Q?MeRSNGorjuFoh7ucDkkR5sNE9PT7KgGcdpRXGaphxo5nSLJ1OVDzCZMxZRYI?=
 =?us-ascii?Q?4CuQcVXYUnehUBQJ6yJyjqlTZEXqESP4pVtx6WawF8zvkzihwxeWeTYalz7X?=
 =?us-ascii?Q?R993xys3xxzzdM6afqlENAidTEUCpyMP+6GTxpFKin6piOabEIV8OhBK4Y5Q?=
 =?us-ascii?Q?sgL5IuOaeuqKGlzujdR3aEuBEineNEDIEvCbgv5ZZYNBILgfHooy8q9wxLuj?=
 =?us-ascii?Q?4xLTN3+yjQDSrcAWgykJCALW/1BOhr3brNh4UawjCUGnOeq7lqwty3bEAFtz?=
 =?us-ascii?Q?TJjLWkZsaRl6MJBDVgW8OJ6+dyMOSswHfbgocKOWeWq7EMdT/rdrNwVitmf5?=
 =?us-ascii?Q?M6/FB9a2Bl/6NS4/jKpYsBH9rn4w6WI87dfhMrJXDUjs7+95vXEZa2UJf9yR?=
 =?us-ascii?Q?gM3rFWv6ikRjMLygWWUm0LtMNxhqArOLCiKycHTaD9NCuphEvRM9tPLgBae2?=
 =?us-ascii?Q?tJU0jljfzAR7+3zuOYKTH6lbEajOeglLKrLif5TTLYLe5agILD73fEVxboNV?=
 =?us-ascii?Q?LW55WZhE1l4ABHwMj3BqxCMszLTE+JV98a6lKNPI9qs8jWi9SsqxHqFPXp4E?=
 =?us-ascii?Q?riMUzrsg7RLRGWHD5jmbFOzq1hUJUDUtkMAjPQVHabOKFLHH0oj6V8nRt6L8?=
 =?us-ascii?Q?//+5rtZIQgP88uqJmkDt4OdsK1UGs4WWdk+HfWSxaYKk/zrr6AKUu2PZF74O?=
 =?us-ascii?Q?T7KbCSYqMAG2X+SW/p2YboAMQ0vPThdwWH7UztQiEY1mwHYgupk+WpWleKA4?=
 =?us-ascii?Q?28d0SGklNWo0U/5mCDlrlY/c/GuywsOKmxefQ12ZpGIYjppyM6BzddwOuv1h?=
 =?us-ascii?Q?wCsO761muVTMks4TW3Kqr3CatNjSGk/FQpfFU/3eujUhNvlWHR8d+Y2hi0xh?=
 =?us-ascii?Q?6bHlAkqhwQPyr8+u4D6+idfJee+KgI901B2PwqNa62A1kLoAZaZw3N3nXNKC?=
 =?us-ascii?Q?AW/BhqPMDl6T4vdgzziq64FRJId1Bj1coOVrCY99K+QTQ9ch+HniUbov5syH?=
 =?us-ascii?Q?BucHGf+YMgEC9Mk7ktksuAFZjwUR5GMQW6fbQb6KnFKpFJajZXL6uGhhd8in?=
 =?us-ascii?Q?icIElsR9EhWBn4GWCjdqvoZmO4SdegQp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f+1Tp4eKL9XnJmsgPdvscoMLJlHA61ZTtqubZ00dV1XSBNAIsxw4LK0k9L3K?=
 =?us-ascii?Q?1zcLLPdT84ohgqnltNW897MV5a/VtZ+TpKcAs/wygKAgdb/jluYdMxU/gBoD?=
 =?us-ascii?Q?Ep7/7dmcCvp8fVLyASbff2XfMg1d2LuNHAbEj0vasV6dXPYL12XZuHWKMO6l?=
 =?us-ascii?Q?VVi8xemnKfAz1EGSMW2yYfs2hNSboKtVJf8CNu8Hjp34p8Oj3uthll02Hjt0?=
 =?us-ascii?Q?2Mpad0RFaF/2lBCmDoFcoMftjHPmntWtGDWFGi6C9iY/vnIDhZVS3xWV6TYx?=
 =?us-ascii?Q?t4x6mxGX8jOPQCeDPhuxYxc3gReLOa+Is+wpVLOoJbYLq2WXIffoA/7MvdLh?=
 =?us-ascii?Q?yONo9z6RLBouUEzVWHBw/JR0nPbKUzupJR+QfasZfcPqJtWhd/SzCBqIY3J6?=
 =?us-ascii?Q?fP2zLN3aS9R08nGr3+QCe8Z8ZOM3xOkzVlwfa3Wd7qSDfB/H73nwOenFMLj2?=
 =?us-ascii?Q?ahYagU2UtuHPMpn5OSElXWzQ5ixFOJO7QDsWJ0nP7YViMEtE8KN/M9iAn4N8?=
 =?us-ascii?Q?a66c6+QYumfNhg6/OK/jA1u1IhXEJxhKIoELmnABtyYnhn0KaxxG4SGazCeY?=
 =?us-ascii?Q?c9Tt1PqsVZ6ztUuB3JoOuPzpP4/trq8DzeXQO9mALZVAdVbODDMcydj88DnA?=
 =?us-ascii?Q?cfsiNpTlLBZLtwdXtnoasfuYREKwP+uX+Hu1nHFPd4X3bJhkqaMQTwdgwRkr?=
 =?us-ascii?Q?6g2H88/XTCExCbJYkEKPCcHxOR6368Ghgm9zP7kStvAm/+tILBRdZg8IQlVf?=
 =?us-ascii?Q?blHtQ3t6hA0nFxvdtECX4+N2dENQit2aH1X17H/9XLNktv2ywSVsypG/J167?=
 =?us-ascii?Q?MBVOpwxIPzYApDIPTsWPH6iqlOmM5EoBuedJMchyKTuguosUWVIn8sOezJ9v?=
 =?us-ascii?Q?FA1gVbJfB+z0LNrtQaxA+2mEilEf2lN365Vl9UfKFbeZwA2GTPZRF3uRcCFY?=
 =?us-ascii?Q?V4NUP6og1kYyxkK7U3uB3mzCu2m7WHelGyKM4nbSpNyJt1Xib2rMn+fR28dE?=
 =?us-ascii?Q?AmL/Vwts4/rW1D5lUreGEGaUQ6MVeqpYbSuu2j4x2i64Y5vz3UG9mEXa/HXq?=
 =?us-ascii?Q?KgTkcRUqTbQ6U+aPIkktDB9tukmC4whLWB6qaVwOIkhsREQdTuzTvosNw5l4?=
 =?us-ascii?Q?GjaxbHRgk/DiJeQ5V3BDKARz0pN/PwatlackuECJAeYgtK6NBRLzrHnkDuK8?=
 =?us-ascii?Q?dZQ5ZVJs2AlUKTArML0ZCfvTbqm7ecO7UiGAuVAVlLWva+B8MRK4kAj4JS6Y?=
 =?us-ascii?Q?DavqwWEdxXu57jdn9JMSmukyiQsJQDwHpxxMxMaEsuTr2+myXe2k0hCqNdG0?=
 =?us-ascii?Q?uZciICcncE8GA/nfPCUcCCn7fmYgOIeh6mXKG18mMU1e4u2/kx89REGp9iI4?=
 =?us-ascii?Q?YiOsQr8zNvWrAeFjWozGXi4EZuiBhgO9TcFTMPsARybvOioYI2rN85ALxWPJ?=
 =?us-ascii?Q?Q6Ae1F7Hu1mJK7rGhN9Jebeyh3jjyoveT0WJRfO7PIez9xly6yu0Q7qC7Kyf?=
 =?us-ascii?Q?c8R40TTZjg7o6ScPWKLloNZaQLSIVEXfCKpYTYzxTPK8+4ZzljI/uMJEMTpg?=
 =?us-ascii?Q?ejAWDaucFlfznP2vFT8bxyTeBfHtatXS70GtznBLNYVSFujaUMwIoDW5ofQZ?=
 =?us-ascii?Q?fvudNJU2tujpCCNLq/HH9qFU6EDzkxMCyAbMri0lDsZhC74fmX0HQLh5o2qs?=
 =?us-ascii?Q?fzAVOHrXIJ/wnC1n3l0O4KCR58adbxY+2xn+Pn/idwCQiYmSSt/rsFh7jiNd?=
 =?us-ascii?Q?YflpDQ+QaUmKpIyIjZ8cwGvwS6RA67w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa75d064-90b7-4f28-8732-08de4c773907
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:26:47.6628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7qSe1thW8ofP/TbhUr4bKqFgOo0LKDsmkfHBPtyjg+2UowkNt/LFIsLH7/2N6o48MfcmN2+tUxm6XNrs4wFkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
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

On Thu, Dec 25, 2025 at 07:36:41AM +0800, Brian Nguyen wrote:
> Add page reclaim list (PRL) related stats to GT stats to assist in
> debugging and tuning of page reclaim related actions. Include counters
> of page sizes added to PRL and if PRL action is issued.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c       | 4 ++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h | 4 ++++
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c  | 3 +++
>  drivers/gpu/drm/xe/xe_pt.c             | 5 +++++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index fb2904bd0abd..ab61d2579e87 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -76,6 +76,10 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  		     "hw_engine_group_suspend_lr_queue_us"),
>  	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
>  		     "hw_engine_group_wait_dma_queue_us"),
> +	DEF_STAT_STR(PRL_4K_ENTRY_COUNT, "prl_4k_entry_count"),
> +	DEF_STAT_STR(PRL_64K_ENTRY_COUNT, "prl_64k_entry_count"),
> +	DEF_STAT_STR(PRL_2M_ENTRY_COUNT, "prl_2m_entry_count"),
> +	DEF_STAT_STR(PRL_ISSUED_COUNT, "prl_issued_count"),
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index b92d013091d5..424eb8ec9c09 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -49,6 +49,10 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US,
>  	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US,
> +	XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT,
> +	XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT,
> +	XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT,
> +	XE_GT_STATS_ID_PRL_ISSUED_COUNT,

Can we get a PRL_ABORTED_COUNT stats too?

Matt

>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index 6532a88d51e2..774467befbb9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -97,6 +97,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
>  			     u64 gpu_addr)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 action[] = {
>  		XE_GUC_ACTION_PAGE_RECLAMATION,
>  		seqno,
> @@ -104,6 +105,8 @@ static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
>  		upper_32_bits(gpu_addr),
>  	};
>  
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_ISSUED_COUNT, 1);
> +
>  	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
>  			      G2H_LEN_DW_PAGE_RECLAMATION, 1);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a79734079ef3..e83bc4503e5b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -11,6 +11,7 @@
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
> +#include "xe_gt_stats.h"
>  #include "xe_migrate.h"
>  #include "xe_page_reclaim.h"
>  #include "xe_pt_types.h"
> @@ -1587,6 +1588,7 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  				  struct xe_page_reclaim_list *prl,
>  				  u64 pte, struct xe_pt *xe_child)
>  {
> +	struct xe_gt *gt = tile->primary_gt;
>  	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
>  	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
>  	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
> @@ -1607,12 +1609,15 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  	 * Only 4K, 64K (level 0), and 2M pages are supported by hardware for page reclaim
>  	 */
>  	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT, 1);
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
>  		xe_tile_assert(tile, phys_addr % SZ_4K == 0);
>  	} else if (xe_child->level == 0) {
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT, 1);
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
>  		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
>  	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
> +		xe_gt_stats_incr(gt, XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT, 1);
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
>  		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
>  	} else {
> -- 
> 2.52.0
> 
