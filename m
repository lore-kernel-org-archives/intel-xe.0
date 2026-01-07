Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739F6D0D14F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A4210E0F3;
	Wed,  7 Jan 2026 17:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgMK1vrq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1F610E0F3
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767807917; x=1799343917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hp9EjxCknJrnj9ZUruSZjnUhzXnFc0Hvsymtu/aU//M=;
 b=YgMK1vrqKOCGQAAAFjvF21XG4uAbvgQd7kGP6W+x1KamRsd7N/th0uW8
 uvBQr80CwPJNW0J2efSNLSdq28e/WoB3gLHTZQXnh/kcmFAq4Dq1T/wYq
 6cDSxoJpZcFsqjQKBlAlgYkaFnzwHzPbwR0gku5z8hhh1u7v0c/xiya5Q
 Nm6cq59fFzaL+HY9aa/3tnvCxdiE+S0yZlE9jKONKsf/cuUu9Zwlr6J0h
 QibtLNmRlOSp2s5FMPBn7wrT1i6bdOAgTrIvLxTKqba44kKOVbbZysyXL
 XVg1XWQJ6ybC4kUol5UO4aC9OGVkQP3X8SqsNdgG3sgsGOwa2/k6/NAqC g==;
X-CSE-ConnectionGUID: TuQ0J8zJRRGzIKkLGpcSTA==
X-CSE-MsgGUID: N6kcnNy/SiODdo1T+pp75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68375834"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="68375834"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:45:17 -0800
X-CSE-ConnectionGUID: 1PVhfZfDQ6eTngFkdOQjcg==
X-CSE-MsgGUID: AuKBXTraSLCddvDw2xpOGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="208045735"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:45:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:45:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 09:45:16 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 09:45:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I80BUleU2qJ6vRdo4CtQa/xgPhUJAFH39DXC+ivcRjb64/smHVHI15ORGfQLRaj8lbxGDhcQe1u/jpKTNa1ejxSv/n/aeZd5XTn832+4PxuK8Y+m7/0mmnMlLrzNxvg++hMCFmvcMhd5tNk3y78AVSM4TjhhUX5pjfnaVS4SV1VZ51fQDHrSxzjahDVDXtYWvwH3sb8vYjGvSSZUMzro6vd9RCP2YZiHBoJeqGD+Y22HBl3zEqThJiGwIyM/uA1j4uihk1/Zw0AYB/hFYc8YuhXLvazOkDkN2xQ8/y+wQ9O/y0I/H4AxYosLLCMv1hwNckre+jWfGNrV9Q4mzxmyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktUch30De/8frvBoDZSUU826B0QM7nM5R2s5mvBmSy4=;
 b=qt63dVlpu7F/wz6+UrewTwVkotT+eaU11gufkW0UKrhpE58l91qlNRIrzZwEPcq0GrXIAEaYcruLT67L/P8UqAQBymr+PVle5H9rq4wYUaCjDo54m/1i3sBjpPuqu246R5Y5enLZb065howtevnP1ytrqvh911e+H96MNt6R4h8nmsS3PklqDtjQPriHTO23Lk5Zb2hj8Ez4LmEWF3VQxvE0NMlct3tEsj/jUbN6ElHvTO5pBAWGNkxBMWvkOP9WVYMJ8gSVzmfKI0Ghtg2kt+hQCSpK3AKyl5ylK0/PFRkRQml/9GRiajLRGOkfOjyjffh2bqxONNWlYzS6W2YHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 17:45:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 17:45:12 +0000
Date: Wed, 7 Jan 2026 09:45:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/vf: fix struct xe_gt_sriov_vf_migration
 kernel-doc
Message-ID: <20260107174509.GR1180203@mdroper-desk1.amr.corp.intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
 <20260107155401.2379127-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107155401.2379127-2-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR07CA0106.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: b011454f-a3f2-43f8-1eb1-08de4e148228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F1MNTKoEH1fCqIX1/xFRfLI5ZaJ0dqA7Vp4O3kScptQU325ezkG7hExHcVKi?=
 =?us-ascii?Q?ThU7pP4xY8vy689NQEc0cevAn62FwlReKZPNPJYLstDl5AhMlstgVgZ+l6DQ?=
 =?us-ascii?Q?l/+Q+puFYKFYB/X0v6Sl3Rb97Tx4rxk3FZfK+10IzSCqyQJ5pgsWdU87fsLW?=
 =?us-ascii?Q?o+PsC9hhZqxqKsu5HfR+dwTc+UquGE1owlg2XF9V7/9B2YI/pU+r2WcsV456?=
 =?us-ascii?Q?PFLzD0YAjq2rgqO7gpEnXOyo3juti3iWiLaB1Lq3hz9dtqDfXLaFNrqmqhwk?=
 =?us-ascii?Q?oyN9Fec/dDSdKHFStxx97fMifbnIDJ7STlV+9WSGp9fMHgJrO4Dh/oxz65vu?=
 =?us-ascii?Q?w7qP5tLw9/gVSPzp5rvFSsmtt6HwKqbRkJxzJPWaMw/IyaFQTX5Yd/Mmu7L+?=
 =?us-ascii?Q?OKhE5mEPVSwfn8vnJtLxJqwXcaOVrlFqS6rK50UvcYRI4cM4zVW4LSoOmBR+?=
 =?us-ascii?Q?BOxBDb+lnDI2kAuV97UtgBrc7xC+7E5vszhx34f595wG8NjTYwGeyCURbVZu?=
 =?us-ascii?Q?FzJm6/PndD5DEdnaPu4pF8+7LnfSW/+ZB9L01rcrTisEltXcdyPrOXhXC+6z?=
 =?us-ascii?Q?J3T7dfGm4Lqng0w8V2S8h9jQE5gnssp69LS0hP6Ea4S8p56Gqo3QutPkvPZX?=
 =?us-ascii?Q?ka2WErrJh8ftfhDvA9xyl2k8aZwGK7XlRmrB8PukySRMdH+utTpo4helvw0j?=
 =?us-ascii?Q?0FHHSfIN65v/nijBYxxkcnmgJHM1YiB7tB10a6vXrTFkdDThcvMGm3XEjEnC?=
 =?us-ascii?Q?PrXzGhRpr8cNCNcNwFMgk6idhpAOdVIjfwD/+No6HjIc04ooJge304AVJrD8?=
 =?us-ascii?Q?/A8QNgxqFuLM/BuWiptQs+c48bxiwAyaXDkqLe4bztn4E4fbz7v/DTqPknOM?=
 =?us-ascii?Q?w0Ouzqo8kY0h0fZVS1u36UkiSznhgCL8lMwQeHaIfw1JpL3b6zbCXMgnl1PH?=
 =?us-ascii?Q?Wpcy4c7TQewzng0I6wyoqj0VRuBwgUTdnO6Dj/49BlNaFXH5UhEmSavixorM?=
 =?us-ascii?Q?2sVfjrcM2nbNF8ep34FrLLEiXHmZoN34nVpoDLVWKdo40bMYB6+gIASeT6Jo?=
 =?us-ascii?Q?CJmF9tQRK98eUxnSi7tEgAUtLBQuivXK/kj07u/mkyNqTksghtyDCTEgIPWW?=
 =?us-ascii?Q?2Jos96BAlKDXgQVaTb1VtZzXPEX94yRzCqNPMSQI9OoW+HytwVscWWBokO+x?=
 =?us-ascii?Q?jxwUKME4psNKPb5LYomMyaheMavzEp9CLqJxK+ylvdFUU/8RLZjhq4aCRtxz?=
 =?us-ascii?Q?s66urOVj0XkX2t5lyGsl1xIGCG6VPnuqymp5edKw3FFnoKHeKNWPl8GqpqME?=
 =?us-ascii?Q?cwJOKdKmXI5MPK/pSDsgaHsxsPiwS9oC5f6PJlCbOviWzLAlmr40Norm2ZsO?=
 =?us-ascii?Q?seoKdfygvn39Hp1T8trOeJMnCbHTWAIEFXLKda0Ntt2gebbPaUAR+Rkw8+40?=
 =?us-ascii?Q?K2k0KRRnFwiXAvoUiSSQF2RCSuF9+ACp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?grG3PUwu/5Z7AgGsPswX/UhlqSoyktGAEBbdnUJ8neH+xWSXiia3zqyIuxU/?=
 =?us-ascii?Q?BaHbv0qAZ3QbhbZYz4aWdL7B1PbE7LrzZ5lw/D31/pcGpdelvKQkPOteE+4h?=
 =?us-ascii?Q?GapjrLNAiC0Zn5Sm8bHOmd2ccc0H9pwFStFAa8gHvgUHvfkLfXFLIcCUH18Q?=
 =?us-ascii?Q?TIsG02ghjbFMscaNbveDUi6KlMbNGiURuETJ2KvDhzkTJ32Glq46gmnpbyuh?=
 =?us-ascii?Q?Qa3mrOVbEBeETSRfmpCzPiO8TIgSN0nZbcdwIN4AGZMeuJD3XxiZwImbrKFH?=
 =?us-ascii?Q?EqSkAbh5fr1ArsPAYYd8DTOBsVVKVdePdx9Er4bwyn5vHevvw9cHeyxDuDZc?=
 =?us-ascii?Q?hHhp98voTLRMFsSwPt77GJ8qQM+biVDUzr+SVSf49VkybFnV3W5UTZvWNK8y?=
 =?us-ascii?Q?wDMmw9988VGhvlp9IzqwoJLlwGD6Z7p63u6wnM/3rF0kNVzFFWsr8FbIZOVM?=
 =?us-ascii?Q?Ca/CiCb58V0BkkvhfrgKNA6eC5cyYozjqKi3zCmmAfYtC/d94NaAGjdFzqup?=
 =?us-ascii?Q?hY1nFBaXW7lRO4GBNGbPbvgaH4QjmBkOyMBIcD6W6GUizbhCpmyQKkm9Nnr8?=
 =?us-ascii?Q?U4o4fp1g43SXg1jZXBGN60xbxvAw6FUXfmKYDs8t6NZqoCkz3o/kLzqN6anv?=
 =?us-ascii?Q?pp5jnlq+fpDqo7u6/fHgJ90k1Rdr6CC/0PHiRWqXpJ1ZCXeIGIkZ6Pi7Yb4l?=
 =?us-ascii?Q?7sJcY42SL/mqeAAgNUj7AjLqUjNGRKNBbzg6gNsAMtNshdZsWb6mYmL1dKqT?=
 =?us-ascii?Q?so1yePQoJ/sS55f4YNg7b3F66+Qraj427soiB7gAnWtmwazBUWA8NWn4l7ro?=
 =?us-ascii?Q?mlBpCzVDDvFVEJJaYlO1BcWarMhzvp41K9G5n9tGPgGg09p5dXkAX09ZoDbj?=
 =?us-ascii?Q?i6RvQiy/Y5Z5vLAomADt/WXTC/tG3HTTx6NS/GRXdpfmKDr5rdn1mjfMNt6X?=
 =?us-ascii?Q?o0NPx9GO49+Z23lPK2P1rxfx94gYVmu0p2aY4T6L/yTjHVi+UhfmhQ/Y3LrR?=
 =?us-ascii?Q?CRf6dENpNk3fFefc4uMvDeZr7DeuzXvvhSzmD/etJS4pfzrrG1hECYwJ+OAq?=
 =?us-ascii?Q?a4DBNqfqM+rIy8wLzX2NvMuZWWkCoezi/ne/Jz18z6nj1HrRDXeW888teDIC?=
 =?us-ascii?Q?oNlaB/qxc3lYPDqFyaT9aH8j7GcY2ZyENpFf9/VxaNqkzQdasS/Gwb6w551g?=
 =?us-ascii?Q?eA1CRrclFxeKeIaLTFghGMBQa7sau2/cNxP0L4In5g4ktjFn8Gk9I73cIgaj?=
 =?us-ascii?Q?m5uplS2Fm3C4Bh9aLTNEDZFsTgNoADOa+JpY4zyH9y+JbiN4BIDJRXq5APFE?=
 =?us-ascii?Q?quh+YRVVMkTSPNcyDwVmJksUovMqboaR14jwoPMlxLvXA/awr7ZIXbLoDIQx?=
 =?us-ascii?Q?Z0J89rj1Ipv3JJZk4XhOkZh7gcVdYv1qzcfSyHzKcyMxFsDoQfOHAJOgQUxU?=
 =?us-ascii?Q?JKquFRSmJJQs1jiBzG17SzA+stLCqvQ4ghPNeYgs9iG1AXoCs/+kubigW4oZ?=
 =?us-ascii?Q?euBBQx0JbXS2ucOT6g5vHyk08QAsMRbbyequJ9+bCMgcksCn0lrMy7wsm+R9?=
 =?us-ascii?Q?yys7T0Km+CgfBnhh8rPNZx2i7mVuTQF1L7So6IHzKxWMqHgGtvrNXRJ5vwZM?=
 =?us-ascii?Q?AvdHvr0xT+n1OalKA5M29WYZKrhpa6rxDN9K3BSt9FiXhfpAF1JMjexb2kJd?=
 =?us-ascii?Q?+F9Pd1RQWOQuJK3vxmKMOPybdx60bRp4OlESHRm5XbaU/eZ5PuVASJO7TVAU?=
 =?us-ascii?Q?p/A4CjeqJZIi0bvUpzrbnxl0oppQ1TU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b011454f-a3f2-43f8-1eb1-08de4e148228
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 17:45:12.6651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrPLwkrhZwZdQ4qV53AMuiW0ADA9/IdLjqvl6sRtN0SXRXTDl2WMQIHAZLhXd/Uy7QfJPI6pqo3iVy3QsIJTsAZLrcGvbaQj2mJNvuAppHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

On Wed, Jan 07, 2026 at 05:53:58PM +0200, Jani Nikula wrote:
> Fix kernel-doc warnings on struct xe_gt_sriov_vf_migration:
> 
> Warning: ../drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h:47 cannot
>   understand function prototype: 'struct xe_gt_sriov_vf_migration'
> 
> Fixes: e1d2e2d878bf ("drm/xe/vf: Add xe_gt_recovery_pending helper")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 9a6b5672d569..4ef881b9b662 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -43,10 +43,10 @@ struct xe_gt_sriov_vf_runtime {
>  };
>  
>  /**
> - * xe_gt_sriov_vf_migration - VF migration data.
> + * struct xe_gt_sriov_vf_migration - VF migration data.
>   */
>  struct xe_gt_sriov_vf_migration {
> -	/** @migration: VF migration recovery worker */
> +	/** @worker: VF migration recovery worker */
>  	struct work_struct worker;
>  	/** @lock: Protects recovery_queued, teardown */
>  	spinlock_t lock;
> -- 
> 2.47.3
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
