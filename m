Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4E4CA101A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 22:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B77110EB0B;
	Fri, 30 Aug 2024 22:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DM17YHgO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE14A10EB0B
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 22:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725058013; x=1756594013;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p5joGuBJZzzg2nOCSZRkEnuJQYWUh+OJ8IlY+V2bTyA=;
 b=DM17YHgOxAE6H1bFJhNCLpciB8pRiQ8iaoMESkKubJMdTL+EdZCgbCzt
 k4sEvC91Noe3aRFExjuN0AOCLNSl3aWZNU8QbJezwlqZgodGYkBYkdNQP
 83JBRUn8C8bkGwFWthrGvjVmmQs3f1Hi8sxkeBag4ikxo0mvA0naQ7yzr
 eP9cJ5eVJorzPLQrq6fJZG/y5O6N3ZM0r9ylxWXzQo+J+gN6rQz+cXJhR
 ezdVGR75XPlr9SoK6zh1gN7KSqf/GzoO8acqkCgEzZi50a/A5FJcDLouV
 /Y5y/AIoaLdly9ZYajUI/tQBYb4uRPWsCdRGC07phpN0EckArc06rEJC1 g==;
X-CSE-ConnectionGUID: YsMgLUUwSEOt6JCtYsGO6Q==
X-CSE-MsgGUID: Y83s4f9PRRiLEZFHuJDsmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="49101450"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="49101450"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:46:53 -0700
X-CSE-ConnectionGUID: zYKFZtvXRXijRIxVlNNQxQ==
X-CSE-MsgGUID: tLBBNAKCQoOjT35c7KIFLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="68174070"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 15:46:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 15:46:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 15:46:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 15:46:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSw6TvPuIMZ4PXWLkpUoX3xlyMq0+mFGS4Gecu0iS1Ivsrfw1tG5kMxh1OxL+/HCMN44GLZk2daV7tUXAGGhNz5lxyAgxfkJs6RO4YY/1nQLH9WYZwPef5wi4JLWxSG7CHzfgThIFp+V6pywj/QcMzEPjitzzoEnkNo7p2UP2PFQ4a9CffeSqFVZ+ZxPvBTlQB+VMRhuRLMrXHNwXyYtRFoneW1mMtzsA81Wj/NcKeTF/S10TQufHlIBAT748uCMn7L71NIe+MmABbPDnZ6A4eyat8lm2dcxq2huoTfm+4iHaH6wh7wdoBHPHgAwmZTdG0H2LonJ+F4Cb4N5w7OOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VofrPH1FwFUBIpZBLIg39sj1LHuOIEvYxf9US1IsZtc=;
 b=IuQLfX8QeMaWcsSPcZb5Kg7ICNqXp5dGn5TV8wNLGv8OZpE6qPjLhZ4ZWgtKAF7789NuL0svnDwlcQmh7hMAUdNd5Z7M0Z2X2CaRMLP5WV7ghkyoxTLuMuZXk4gH6wsNBjrPfX5Go8+UPThG4ioF3y0qddDO4qJb0yH5bvOnsdyMY2Dqx4S8GmPwgXw/5fZBdoQNydFGrpi2My+kPD9XAXOyvYqLXG1uf19V7b6icae437ppEIEYcBD/XrbHytU1Sb8b5OVecL6erDRsWFL+NfixAsNSh//N1jwMNMgkQxGD5GxeqnnxuiaOk4eE+MZu/y11mbSuuwc1Jf0qf5Ku5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 22:46:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 30 Aug 2024
 22:46:49 +0000
Date: Fri, 30 Aug 2024 22:45:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/xe/oa: Signal output fences
Message-ID: <ZtJLfeELgQxuMW3E@DUT025-TGLU.fm.intel.com>
References: <20240830221618.2103948-1-ashutosh.dixit@intel.com>
 <20240830221618.2103948-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240830221618.2103948-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 174cb932-6b28-491f-9cd0-08dcc945a238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ncCMOdS8n3FZt4e5yIpNYYjFxkadTgjqClWnbTGdmhM0B9Llp1IbgliHksp8?=
 =?us-ascii?Q?H6sE+8MqWD+2wwWFRwmp2UvKOSVd1nhwvq1sQPCZFFEAkMogfebodLsLkxEA?=
 =?us-ascii?Q?ccytSz5tLmVvJN4z7KT+Ds67cO1P+EsQ6PMHPDTq3wHHXEamduQC1qtgxMCO?=
 =?us-ascii?Q?cxbWJlTlPaN5EBUEwbtiJ21C2k2AlGOWEpKPSuMGbgEikrjmH1y6abE/pJSn?=
 =?us-ascii?Q?5u1aLQtuzybfY697ph6J09kO/mQnoDG/bzz0yck7W0wQdUllrC1c4OL8PKld?=
 =?us-ascii?Q?Q+JBVrmOHTmpENY+Qqe8wHsJ4+2Vb2fYYaRnM1gSSM1dqAPk6NgrWpZRO1Zz?=
 =?us-ascii?Q?/ta4YlbPcB3Wh6me4JB3vycXyirTh86Ie5HPoKaFi6H8Jyl39tljgLcLdBWW?=
 =?us-ascii?Q?QTXy5NOYJgu9K6aH25aCNP4gwA8EnrE/d3OXeYpBx8JibttgBJvTyczw8E2Y?=
 =?us-ascii?Q?XHkBbL76Bztp8vsc5ZC/jhA3KW7mY2LJeYvWTcwYJS1Ls1lRzUqGIQ3hT8qD?=
 =?us-ascii?Q?+lV6I3tCwV00yvv8+BT1+tXNtsiMQOFBZ3dKOHMNc5MoecrNLbibH3+1//NT?=
 =?us-ascii?Q?o81k+vpQwMLb8s1YBDlWb6fxQYTpZyLwkdUcfuCwOPJxTv2dWF/sr/EEQPBk?=
 =?us-ascii?Q?E6qlVI+QpekrGfjZZ8AlBF4ECpuoVHd3E3Kfz/w22S+ug5Nh50ZgQMSAjOW3?=
 =?us-ascii?Q?D63dvNdKT/lJ1f3IdsaoPlS2LLu4+FEnRSEjBydDfFGZ74+P0q45pV1yNR6k?=
 =?us-ascii?Q?Qu3DI12BM108iaNksDGmOi660YiWKA3aCBYaWs60zoaHLwvQymlpXL+4+pTN?=
 =?us-ascii?Q?s45R13aWmxRxxYTeJzmsk/BaGRud3AeHjJCNFwJOIm1DXhWX+o5VXh1LLigp?=
 =?us-ascii?Q?DXRUft7NM6DgAJd9W3M/za49J4xPL0dV8GD8CYNvJJCbM09zmJ1+Ai6LjVy2?=
 =?us-ascii?Q?FiKhAHUj6pMhJrmeqjeCmSW+Vq2O8qxm4HfcEtNGriZB4Ukah4c9QgbrFgiy?=
 =?us-ascii?Q?+v0wIbWDM2xAuzODU2JN1YAFsApsptlkvJeoihO2TNfu3X+Qzbsn718auToe?=
 =?us-ascii?Q?JqEyLy7OiPl/jfTixV9xSV+16iRfMUpA60NWk4tCv8NmUB4l5/tB/A7JeOln?=
 =?us-ascii?Q?ZdSrn2/yaWlSnOWR0+mjPBV+rDkQEF7977SpnCVkOidCoS0BLQutF9vv0B6m?=
 =?us-ascii?Q?hPeVeUbrThhV+U7L54NESZDOID5MsbWv6f4oWwQEG6zitZ2j2n1p/SEBHnYV?=
 =?us-ascii?Q?ssEwgIht7rD7jr/iLl5GG5zJnLjCNzH+FQXboaxDwfEAIFeIewGw4Yt7wLzf?=
 =?us-ascii?Q?tKAUff8E8FFDI3Qbpgwa21KvcCt601Q6VWmG54/viIaEmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?avTESFDiaWwDQO7LlQCt0hCy6dT8BVnciOAJWjAq49b4/7oQDA4rR2ImJUpU?=
 =?us-ascii?Q?o5rXIdBb/iDdfoNaj2DWNAM01EKY9nYOma5DCKcwWqRTd0oYdAxTCiPEqJRm?=
 =?us-ascii?Q?CqmVDBge1OT6Le0mPfBgbXH2/jGryZiqlsVUlgRFPcynCj0wbz49IlgWmgae?=
 =?us-ascii?Q?Ue6o044NE5RYQ9jxmRNwtXeX2VBJOAv5aSDq2UZNscXK4ZfvMnCuOx2eLhIP?=
 =?us-ascii?Q?WzPAERZ/M0xWT0MhgDehP58oVA3vuaUr7gHCAGdniWLkDToCRmjxEAPkhBNg?=
 =?us-ascii?Q?YzIXdV5NRRX5dMrdfHn95PEffEeUfb/DgAKE8ukYo+hfOq6ebMWqGeUDJgVE?=
 =?us-ascii?Q?VD5zdd7uxtY9yIB1Sgs8dRBaSQZDL/3rfhnac5kOTVEZqKTpLuoVrBgeGgYh?=
 =?us-ascii?Q?GkIc8/ENf0tf3yypTHoPgD6b5qKVtJTh3izVCrDMi2u+u37tFklRXDKNwYMh?=
 =?us-ascii?Q?SkhPfse6t2Ykz/F04TDGtKItsKOPzDy9/1nSOO5JtVRo2U+nxxxHW51sV+j2?=
 =?us-ascii?Q?+kDVm+qFcHF+NrUKGP5+nnrv11a+qR9z1dGg7s3sAaoOPh+MdNuGoUL9bkJE?=
 =?us-ascii?Q?dtAP6mbyPtKMawXnKpMrbrLYVFrST/5MlDQvbLDUCuV7i9FAzJRQhe4j2kOM?=
 =?us-ascii?Q?JpamTxYH4MdkC+LMEru1SJqCQI4DSTWJauAWersl4+RBmgHoM/MoqX3CPp7J?=
 =?us-ascii?Q?9JbONsZIZjdpMDpXlh77a33ftM99niSEEs86OQO8rBaG4ilv8jMRNxOJmW57?=
 =?us-ascii?Q?YhOciUOzhk1WAaI18jjqHvhtjGPcTR5/TVOZ0NU2fCVXv/Zogf0PinE9EewZ?=
 =?us-ascii?Q?cqoUuYfDgb/2faca2WXnzFXQpU3vu9QFC2Hbnzs4jk9AF5Xl4z8eK2gJUX9u?=
 =?us-ascii?Q?OXc2AVkDTNt5h00uOshWqGCqy6OIh1uu8HsRaolVm+M3Uvfgx8hVcbQI/p+0?=
 =?us-ascii?Q?zHQ4igf7RIZy28JFeZxMMhzsB90BkZfw3XC7yqhUgMgzWyA/zOpLifx1iGJL?=
 =?us-ascii?Q?jLlUOahmh1Q+5+8R5cDHjKo0vTz1vx5qPepbhFhknKvZ1ecwXjsMlyIehp4t?=
 =?us-ascii?Q?PYor/obXOVVNRahv4Q1ih+jbVtpKJHgZl+rA8jNzJrBxidjUljLlg/6gKWUX?=
 =?us-ascii?Q?hmUl047HbK+KSCv1f4vATWjmhG5SzUZ/Pg+Ts3GthP52y3BP36Xl1waHrU4v?=
 =?us-ascii?Q?Kpob2KKDTI2eB3m/3/At1eZUErtQ+Ld6hdD+Sp0rrnf+DIcBSfgWnMMFTHFo?=
 =?us-ascii?Q?zDvxXdCi6NT6cNsQRfvxo3R/E5pj7s5fQVOTjTtJNm6TWbT0R7jQbJ6LJwXO?=
 =?us-ascii?Q?BZOWwOtbRnV4/NBk+YKZWN4a4OhCfjwdXeavxuRnAkOiU9zNo0iEZfvMuC6e?=
 =?us-ascii?Q?OjvPaDQvuF9/8eha7kg3vRIiX06DvFxpo0gD3fxwJ1mXJHAgyc/WXrtV9lJ1?=
 =?us-ascii?Q?Obo0/b+OKpKyDlN5KCJY1nD4L95YsGK8O1ZkaYg8M5KWERz2v0cyzeP/a8m9?=
 =?us-ascii?Q?69lFv7XDgT7hHr5w5+AIU6Jxxn6YrPNw43BMU1TzIiJ6t+kTvv1Eb6Mbd6/4?=
 =?us-ascii?Q?x7N4nMdzAulUGuRjlZnl7FV9d3zhnxke/OKUEFYIUT8DEsFpMsHPSRFkZCVv?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 174cb932-6b28-491f-9cd0-08dcc945a238
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 22:46:49.2166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxLh061C+UlVwQU4hRE31L1pFCOxUw6VYA7sJ/gVmceonvI+oF67OpOZ50PWdybFU2u8PAQt7k7peOcWf5Nleg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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

On Fri, Aug 30, 2024 at 03:16:15PM -0700, Ashutosh Dixit wrote:
> Introduce 'struct xe_oa_fence' which includes the dma_fence used to signal
> output fences in the xe_sync array. The fences are signaled
> asynchronously. When there are no output fences to signal, the OA
> configuration wait is synchronously re-introduced into the ioctl.
> 
> v2: Don't wait in the work, use callback + delayed work (Matt B)
>     Use a single, not a per-fence spinlock (Matt Brost)
> v3: Move ofence alloc before job submission (Matt)
>     Assert, don't fail, from dma_fence_add_callback (Matt)
>     Additional dma_fence_get for dma_fence_wait (Matt)
>     Change dma_fence_wait to non-interruptible (Matt)
> v4: Introduce last_fence to prevent uaf if stream is closed with
>     pending OA config jobs

The usage looks correct, so RB holds.

One suggestion which can be done in a follow up. I had to check the
locking to make this this was correct (i.e. a mutex at the outer
layer was held to make this serial) and didn't notice any lockdep
annotations in your code. Lockdep is good catching problems but also
self documenting which helps to review / maintain code. If possible
maybe sprilke in lockdep annotation in the OA code.

Matt

> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 117 ++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_oa_types.h |   6 ++
>  2 files changed, 106 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index b4b68019d35b7..56f95fd431bf9 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -100,6 +100,15 @@ struct xe_oa_config_bo {
>  	struct xe_bb *bb;
>  };
>  
> +struct xe_oa_fence {
> +	/* @base: dma fence base */
> +	struct dma_fence base;
> +	/* @work: work to signal @base */
> +	struct delayed_work work;
> +	/* @cb: callback to schedule @work */
> +	struct dma_fence_cb cb;
> +};
> +
>  #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>  
>  static const struct xe_oa_format oa_formats[] = {
> @@ -172,10 +181,10 @@ static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_se
>  	return oa_config;
>  }
>  
> -static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo)
> +static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo, struct dma_fence *last_fence)
>  {
>  	xe_oa_config_put(oa_bo->oa_config);
> -	xe_bb_free(oa_bo->bb, NULL);
> +	xe_bb_free(oa_bo->bb, last_fence);
>  	kfree(oa_bo);
>  }
>  
> @@ -648,7 +657,8 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
>  
>  	xe_oa_config_put(stream->oa_config);
>  	llist_for_each_entry_safe(oa_bo, tmp, stream->oa_config_bos.first, node)
> -		free_oa_config_bo(oa_bo);
> +		free_oa_config_bo(oa_bo, stream->last_fence);
> +	dma_fence_put(stream->last_fence);
>  }
>  
>  static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
> @@ -945,40 +955,112 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
>  	return oa_bo;
>  }
>  
> +static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
> +{
> +	dma_fence_put(stream->last_fence);
> +	stream->last_fence = dma_fence_get(fence);
> +}
> +
> +static void xe_oa_fence_work_fn(struct work_struct *w)
> +{
> +	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work.work);
> +
> +	/* Signal fence to indicate new OA configuration is active */
> +	dma_fence_signal(&ofence->base);
> +	dma_fence_put(&ofence->base);
> +}
> +
> +static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> +{
> +	/* Additional empirical delay needed for NOA programming after registers are written */
> +#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> +
> +	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
> +
> +	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
> +	queue_delayed_work(system_unbound_wq, &ofence->work,
> +			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
> +	dma_fence_put(fence);
> +}
> +
> +static const char *xe_oa_get_driver_name(struct dma_fence *fence)
> +{
> +	return "xe_oa";
> +}
> +
> +static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "unbound";
> +}
> +
> +static const struct dma_fence_ops xe_oa_fence_ops = {
> +	.get_driver_name = xe_oa_get_driver_name,
> +	.get_timeline_name = xe_oa_get_timeline_name,
> +};
> +
>  static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
>  {
>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>  	struct xe_oa_config_bo *oa_bo;
> -	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +	struct xe_oa_fence *ofence;
> +	int i, err, num_signal = 0;
>  	struct dma_fence *fence;
> -	long timeout;
>  
> -	/* Emit OA configuration batch */
> +	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
> +	if (!ofence) {
> +		err = -ENOMEM;
> +		goto exit;
> +	}
> +
>  	oa_bo = xe_oa_alloc_config_buffer(stream, config);
>  	if (IS_ERR(oa_bo)) {
>  		err = PTR_ERR(oa_bo);
>  		goto exit;
>  	}
>  
> +	/* Emit OA configuration batch */
>  	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
>  	if (IS_ERR(fence)) {
>  		err = PTR_ERR(fence);
>  		goto exit;
>  	}
>  
> -	/* Wait till all previous batches have executed */
> -	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
> -	dma_fence_put(fence);
> -	if (timeout < 0)
> -		err = timeout;
> -	else if (!timeout)
> -		err = -ETIME;
> -	if (err)
> -		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> +	/* Point of no return: initialize and set fence to signal */
> +	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &stream->oa_fence_lock, 0, 0);
>  
> -	/* Additional empirical delay needed for NOA programming after registers are written */
> -	usleep_range(us, 2 * us);
> +	for (i = 0; i < stream->num_syncs; i++) {
> +		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
> +			num_signal++;
> +		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
> +	}
> +
> +	/* Additional dma_fence_get in case we dma_fence_wait */
> +	if (!num_signal)
> +		dma_fence_get(&ofence->base);
> +
> +	/* Update last fence too before adding callback */
> +	xe_oa_update_last_fence(stream, fence);
> +
> +	/* Add job fence callback to schedule work to signal ofence->base */
> +	err = dma_fence_add_callback(fence, &ofence->cb, xe_oa_config_cb);
> +	xe_gt_assert(stream->gt, !err || err == -ENOENT);
> +	if (err == -ENOENT)
> +		xe_oa_config_cb(fence, &ofence->cb);
> +
> +	/* If nothing needs to be signaled we wait synchronously */
> +	if (!num_signal) {
> +		dma_fence_wait(&ofence->base, false);
> +		dma_fence_put(&ofence->base);
> +	}
> +
> +	/* Done with syncs */
> +	for (i = 0; i < stream->num_syncs; i++)
> +		xe_sync_entry_cleanup(&stream->syncs[i]);
> +	kfree(stream->syncs);
> +
> +	return 0;
>  exit:
> +	kfree(ofence);
>  	return err;
>  }
>  
> @@ -1479,6 +1561,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  		goto err_free_oa_buf;
>  	}
>  
> +	spin_lock_init(&stream->oa_fence_lock);
>  	ret = xe_oa_enable_metric_set(stream);
>  	if (ret) {
>  		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 99f4b2d4bdcf6..935f98772a948 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -239,6 +239,12 @@ struct xe_oa_stream {
>  	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
>  	u32 no_preempt;
>  
> +	/** @last_fence: fence to use in stream destroy when needed */
> +	struct dma_fence *last_fence;
> +
> +	/** @oa_fence_lock: Lock for struct xe_oa_fence */
> +	spinlock_t oa_fence_lock;
> +
>  	/** @num_syncs: size of @syncs array */
>  	u32 num_syncs;
>  
> -- 
> 2.41.0
> 
