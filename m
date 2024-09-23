Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C34CF9C6F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 16:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D82210E42D;
	Mon, 23 Sep 2024 16:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PF61e0V/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5720F10E42D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727107674; x=1758643674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XT8Gz+hU8QcsfWxVi5wHZ44yeeIE48HWOQAQO3XTUoU=;
 b=PF61e0V/n8bWAOM+M36ULhFxB7ZyvS5ByIb6vbuWWpSr+ySRlQNHXrLn
 Cd6x5gOCz2Sqo69B3yPhstN6/oAmD506zi4Ik6yjQ4PGDS3O9662LvRyb
 w1cA0f9crzUM9MVfNPCyXN2rjKT1rcIEqzY7/yXguNFtHUTnAaxAo3CcC
 CbgLMr6+cx0V8/+nnPEtXAsbU+3ytpomXyMxVxIFfjzAx1f7gMBKcBAaa
 3ik2LZVbFHeStjhDuOJLj8Ld1PuJy4r87Wxz2CFMeTiD1voMF8ZCcrJiA
 1KXV2+Df67EepeKeBNftFmxXlD97vaMaUyKipUtmKLqWtnfPXZve64Wi6 Q==;
X-CSE-ConnectionGUID: GEo2cTVjQCSqkJpPk6nRzA==
X-CSE-MsgGUID: 27x49lehQqmxbtqGMTy3FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26219048"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="26219048"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 09:07:54 -0700
X-CSE-ConnectionGUID: /Byd9ul1QoC7VivsxDNnNQ==
X-CSE-MsgGUID: EzR5kGyBTXOHouBPxJ1CSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71255760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 09:07:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 09:07:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 09:07:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 09:07:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2nnJJYOpzuRWa3RkbdBwoI629QKETejtV/bm1TGm5QDWbYGcbnXnkanuCm3uaK/3gNQvYNhAgLXgCQXjzf25mocCQD8bKpBNco2/HEBuqLcMBUUacvFm8KoEzCXvk/E9A0azFx/v/UhzpQ+QYcVwyrXK26dskva13tMCF6dUWkgAxopFq76jTx+aYdBQpmO1nWDABaWidWJhKyYa/FY9LJJkSbl1s1KyBii+VUazmOI45hPeboG9ezJeppYOq7FuxODM0S/Kh96XUm4RGuf9l3crNnDjel4Sr7bLfsTIVcXrpg/9TrJoVuB82UnUHVE0vqRt35/kvef7IgA/qEoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=164lvqbxMR4YG46IONiDqE1mzM4ehWFSgWHQu0Yrwbk=;
 b=HOKaWECPoBj5xVtdJGt33gBnNtjuPB3lXWr61x/6KTn5UVwNS4nrFJpndOSTaeUuEVBAu0JZUn6Y48oylGmgpZQ6UTmI0KvYyLmjir+niN8o77GF2FaBhgBqFyBhuILErzz7dkWs+3cibq9sejsNp655Ks4Ma83FL6r43ddD4gIJLNJqyHY6v2uRPY2u/hXR84a0j2mBhup3r7OnbBZlrvKupWgLyx/kr/023rBtYU/ghGn7VjL+eSKgyKsT4FaCx6ZjT5vlAIgSBEXs22rYMVh9y/Vlp8G3pANmSIbIQWiMn6L65AcobNBlp6rSKrydnhkranzvmc2NXPsL+3nf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6960.namprd11.prod.outlook.com (2603:10b6:303:226::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 16:07:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 16:07:50 +0000
Date: Mon, 23 Sep 2024 16:05:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/queue: move xa_alloc to prevent UAF
Message-ID: <ZvGR4eIX2jsl5sD4@DUT025-TGLU.fm.intel.com>
References: <20240923125733.62883-3-matthew.auld@intel.com>
 <20240923125733.62883-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240923125733.62883-4-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6960:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b078886-4b93-4362-c478-08dcdbe9df36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QIY2lCkbVFJfyQWI4oWSeM+CTtZqu42KecXGC2o+zHgQI0Aq1nGzinXulcVk?=
 =?us-ascii?Q?FR1vQshK2Uxg3+zvM27HKMkEfF/4IQUIaivJQaekIMVoohSlPBqSsExw157U?=
 =?us-ascii?Q?6a8v3Y+wEdf+7XQ7xUaV+kRyz+oMFSKNmlGW6fwTztyc0Kp9hQLGe2+rko47?=
 =?us-ascii?Q?mbfLr9wrVEgwt/U9hz0afz4XEt8M4ljtHW1/2UPoMVOIbn0st75fIDm7oCfJ?=
 =?us-ascii?Q?HOVx8r9ocIRBeS1heJq3nU8TULv8D3FCbfuoxIILkQjE9r+gaHfjpz3xUPt1?=
 =?us-ascii?Q?C/jJzmXiEsVIcFbzSwPugTTTdLAY+23gmleeDj5+kudG14G8WkfOFA3ced7H?=
 =?us-ascii?Q?Blfp+bVEQ6cAGiMbzpPrtYxvmOsmtqEeg7dQOesWZ23ffzq6ctJVDGSSNwCu?=
 =?us-ascii?Q?swhQduSSu5JqjMS6AVJIH5++fVTuHnOUHDLG7qvFkI33tCi2vMVwAyERzxmy?=
 =?us-ascii?Q?UC8lrCkRBxYhRZT2/7su2+1kEysQNG9obr16yP+z/NaBF4+MKcynhdBIA+dR?=
 =?us-ascii?Q?tGqAZeDVFJGdwPxuQDOCYluqpKk6+KqcKPKulUjPwyEtGSRU2cF5XDXTmZpM?=
 =?us-ascii?Q?p5r539KKlF7CFCGf7rw4ZlRWeRh5qIsA5D4pzk5dHwduHWNecRqh4JyZZRtq?=
 =?us-ascii?Q?yj1OPrKb6ZXfQf40J6MvvDA/syr3tI0uYTweUUacH3pAI0Zll0umxLWlgCUb?=
 =?us-ascii?Q?Mrh0fKwEm7Fy8+K6DnAbsgc6KBqdOLR3/c0UsNeWZuUMxkkmWDV43QvNAcjo?=
 =?us-ascii?Q?Tsv6E1yQewTdKlbKOGMe8Hch10vhHLc+9e3qF6vcDw0AEJ9v10s+Hcm3zaEm?=
 =?us-ascii?Q?JJmoAkDvJGF1dEDK7BI89SVtCx9SRu5riyN7EntkQMzeSfOzCYHzKuRbW+MX?=
 =?us-ascii?Q?byrIws1ajqT8eZiOdyCJ9Bj4Tonij+NYloSSOIlQwsroBtXrTauEO5b2wn6o?=
 =?us-ascii?Q?VUNNZnbWEo0cnygOfMRkG6q2gNs3OouL5jVBw7RP+lInThny5BEELbI2gpkK?=
 =?us-ascii?Q?g03HIyj1dB9md0Es1JYSXS2Klwpe/dxcyjKDdq/3zJNG0QiqI5Ys3G3XWjUk?=
 =?us-ascii?Q?A4ny8YbXwMUi2s488iNfvIPS46y4sCx5eQa+2Um7l4fRijcJySl9Pe5e99po?=
 =?us-ascii?Q?BFsT6Doj4mLChJjtb5j+FWilxvoMCGO0XWRprJcqIqUjQt8T1JjYT4VQqfBn?=
 =?us-ascii?Q?5grtVUD55iwUNvGh8Dnm7Q20hXcdWwWarTVvEsKj8LU28AzKXI8jjUnW1aMd?=
 =?us-ascii?Q?5tFpHkodM7EAQS4PDlxBsOdVTOqliuAQNffBF2xH+nXcARbubSNuIL8ubowZ?=
 =?us-ascii?Q?c7utoT+XqLHvGZTD+50GadEY+4EO7XfDTs0985F0ppWAog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rFIsU+jpDrcqJ5zMpZ59QiNQau7yQgcTgrP05h5nxvkvu5A7CbCigPW8n4VB?=
 =?us-ascii?Q?aZld9+IE1B2i4waqf3Y1EbSm/nt7pFG4Pq5QGZiJIF4I7fEdcJuClHQ1Bvbn?=
 =?us-ascii?Q?4n8mCU+98k8jBwSDvjYk4czpOvgIKSLPiV9mdtaUnges1bcWiY3o2hc1DSEa?=
 =?us-ascii?Q?NXGR1rZYMvLBbctM/Fi8L79eEBEd2zmbmr7lTq25oauilrDPlUMBlHyblrMt?=
 =?us-ascii?Q?FT9lux4ITBkMBrVM1BRdQm2w9dTCivVdxjW+Z7p2SXomgHxE2wdPdMZlb3Uy?=
 =?us-ascii?Q?pbnOzW8ZVeLB1M4gsGEeBWyckQ5NQafVbQgE09z7mJug+336/byFgduQ7Uc1?=
 =?us-ascii?Q?36h4QAfug+ovPV/9JyESegZACEoJVDFWTND1LN91OA7Sf4kuETMObCyLronU?=
 =?us-ascii?Q?KNTPEHepfbmVAYynktvg9Y8nAm0BMmhNw01TCv41MIKE+JS0P/5woX7O2dkG?=
 =?us-ascii?Q?MlMq3WKwQP6Yod4LiaTdZc1vRQh77RBt3yYQbfFjNDRm2wZXyU4XX0SniZe/?=
 =?us-ascii?Q?UMkToIUZXjcp/3jmN+dRIszuFx/7Moq+xYtcx+W5V0N+fzCAG/ASMrjb68qu?=
 =?us-ascii?Q?VvP3WErygzBEEFMikK87impOYav1v+cPZ3mvb+sELzleXYx/WHhXAk33F8zA?=
 =?us-ascii?Q?qBdefCVnNSNtWrI8tAimW3KTwoMxTyt1J3f1EkOeUUQmZo9Tsugnc5ZlbenY?=
 =?us-ascii?Q?ukTxWG/3rTXEB6tIKsCyvfieG8M0AZ95/MQwrwxLmMw650EVEWCgdAYE1vsF?=
 =?us-ascii?Q?CtmRGZ7ei7jMYTIIbrraF9FjCB2DDwe4S8bvBMZfFiwzdDQqsy48Ls3wdM6K?=
 =?us-ascii?Q?nH7uodbQPt1dM3fKQ1/c9SJ8OTpZN/4RLuv86SNpB5qbQHP7NPoPclRdPHX2?=
 =?us-ascii?Q?6dTgEHRLk1aH2XL0DJSmk+P6+KTN2aLIhDH/tv9iQ8TJd0jLHMHJ7HfwpYpW?=
 =?us-ascii?Q?AXuC0RivUBr2GSmZPn1zxyX4FVkKWtcPc5MapkhyHRGXxcx23U/ARjVRcHFA?=
 =?us-ascii?Q?mvMJJMLrd36LWwztnNvuSVm9BQae2j1E1H/+9kCX9AlweSiLefkGvoCXL33u?=
 =?us-ascii?Q?nao3j3tCSHRQSYCItqCKHnKKhyWApflyanY7suIk8taQNVMkJjdbtijEqCxi?=
 =?us-ascii?Q?OafFwcaC9+0nAz3BeueiONr+rv+g3JNlyeO8dadiyll1cxC2KgqI4ZphaZab?=
 =?us-ascii?Q?99pUgWUsm9WhJ6gqDFMxoqDwlBzQsf/7kAnpKcC9iRYHrqB+JUsGJgmwqv8F?=
 =?us-ascii?Q?CBykJUq2tnTMyMmjtuMs2UbVVoO3BvRH4aUYHROPBOaLzzOzHmGRWpN72VAc?=
 =?us-ascii?Q?v4LOKBN8JRzRRF7Z/8iFBZDlmr9qzDItYd94yY52e+Ss4GXaqbz+JYmi4uVX?=
 =?us-ascii?Q?lobSUiPM8MyuP/zv+bLJYS0heHcrkni7ynKeoaL7zc+LjOJbwWkjqeOYn+gr?=
 =?us-ascii?Q?HVJUIjoplxmzfeXPKpeUCjPBGIJw1X/GLgcivllhpd0INHVLetoVHet+JxcD?=
 =?us-ascii?Q?b5xP+E0im0vrztbBlcnL9cPOcGzj3rbWlX6poGr0464ecJOTZ3SWVLfU0Anr?=
 =?us-ascii?Q?zp6Wc14sXH8RACI7muYaI93xynGLgMzqn14akDinnW9ONJ7+8GrmwvjQopHg?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b078886-4b93-4362-c478-08dcdbe9df36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 16:07:49.9861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2ZJd4PBvDFXP8iP1doTwWSyALvHaq2rgdCLZjwrebejQloIXJsDB9R7/d9yDkKVtiSKF29CjdXWGgjBxb6r6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6960
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

On Mon, Sep 23, 2024 at 01:57:35PM +0100, Matthew Auld wrote:
> Evil user can guess the next id of the queue before the ioctl completes
> and then call queue destroy ioctl to trigger UAF since create ioctl is
> still referencing the same queue. Move the xa_alloc all the way to the end
> to prevent this.
> 
> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7f28b7fc68d5..a1d4b9b0726e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -635,6 +635,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> +	q->xef = xe_file_get(xef);

Same comment as last patch, this looks coreect shall I merge my series
and then you rebase?

Matt

> +
> +	/* user id alloc must always be last in ioctl to prevent UAF */
>  	mutex_lock(&xef->exec_queue.lock);
>  	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>  	mutex_unlock(&xef->exec_queue.lock);
> @@ -642,7 +645,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		goto kill_exec_queue;
>  
>  	args->exec_queue_id = id;
> -	q->xef = xe_file_get(xef);
>  
>  	return 0;
>  
> -- 
> 2.46.1
> 
