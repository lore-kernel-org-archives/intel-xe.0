Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B66C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 05:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD6210E1A4;
	Thu, 10 Jul 2025 05:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPGw5FjT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0639D10E1A4
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 05:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752123748; x=1783659748;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Hn2QWk0ndpeAd7B+z5M/jsuJEYSAuIswAxBwkpNTgs=;
 b=fPGw5FjTBdBvdZ+XUrQpKXieoyjxBf2ZSXF7HzjmkDZyeoCbObmXYaBu
 uMJePbu5w4uLLRgYjUBW4BTaWCmFO7KnmIKKNl1sNd4HssVcwbcJXNJYd
 /61oqDW8zjEKBAFLzcfzwVC13vNLOLoSdCzI8tn0SBSANLEZ+VdLGNreb
 yAFRvq+xqN4PCjQIarr///hHLqQhB1t9LZDpU1hY3AQgEJ3IiuexiV5C5
 kpK2hwu+/aTA/cC1VPLenTqKp/Q+bkmviDqcapitYfd9gFfOyJsh41dsu
 b5eqjRKonLBz8zWr0JxKIcP5q1M2ExctOKcOr2AagygumOt+CDyBamB2N w==;
X-CSE-ConnectionGUID: p7CRex6/S1qOddBvh9xqzw==
X-CSE-MsgGUID: 0nKKZaYOQDCpDPsrp3UakA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54247191"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54247191"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 22:02:27 -0700
X-CSE-ConnectionGUID: BdqeeJ3ZRZuc9gezBUuHGw==
X-CSE-MsgGUID: 5/B3iWzgSmCpedr/+rnKUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="161524063"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 22:02:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:02:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 22:02:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtJJET7qb32ibutmv9JIEYUcA9HcJNNrUQSf1A0oIelSgP/GNHUQnk0aZG1P+m/GNXUYjh53bT4AK7a6o6p8LK+bdE5Y49zOM2DWYVm4BSJl6qJJjKz/kvtrsnNd9Opco4PiCB3SQYGT+nk64gnowQS6ox8KoCGj92QQiRHi4gg+M/xF4foGRWNZ0JqaWsF6JTWV5aTsXo+Bb1ePq0ihXuEO4wif2Rw8GO9HoPsGKQfX8RB6qX1u6xwDghKAPaYeW4bW/9xDQk50iZAuKZR8oWtSoEI4uS842SEyuE2n55xkA1jwbiQ9oJ+0TrjgfUctZ6t1K/lXByjmhKoaQYFP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IDMlYRidq9jvcsOhGnR3BnSjFFv4oyPgT/fXJt6ltU=;
 b=l+vrL6ZuW12qCtpmT29z446T89tom3F5KnSLE5uqO21kopsmBOAwRon0+iNJ9GBj4ETPo5UdIiX0CTzwlDa6/31oqcTBHeyHdNBrC0SKlJKyeG3TwlvNYpi1YzpcXtrGLbTNbIDZ6B5Egh/GeiR1ZCuCLKFn8YHzZMFfYHIkxFkT496t2SCKoNhZrng8x/42bIKJ11jZfelu5WUDvu0jSgSFLlZpuVlhOYokNXGe2NB2luGn+d2v17+qw4y6AME4ZU9eB1AIr1hlL5FS6k6mPNitLH/1eh5UfGlMGgSlAKdvf/vy5JUUA+jLDSF6A/xX/FHtsSUNb09ZxNrmCFbw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7677.namprd11.prod.outlook.com (2603:10b6:208:3fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 05:01:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 05:01:42 +0000
Date: Wed, 9 Jul 2025 22:03:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V2] drm/xe: Dont skip TLB invalidations on VF
Message-ID: <aG9JnsplFWSaL6pW@lstrano-desk.jf.intel.com>
References: <20250710045945.1023840-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250710045945.1023840-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0330.namprd03.prod.outlook.com
 (2603:10b6:303:dd::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b5658a-3584-48e1-f932-08ddbf6edc8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3lrTNUkqJWQxoDrpX+n4wA2p6tqbG2ldpMkKtaH1qSAmE6MK+KoPIvnsue/W?=
 =?us-ascii?Q?Q4cuyclvUf45Ko4HN+KTPD2PHvZM3VaZi+E/A7q3X3P/yGoGhIYAyXc+b8yz?=
 =?us-ascii?Q?kLrHW1Fwi36rGPrjbYZWtqtoOXmKOo0cHyYhREH4JMkC7XB8MJEeuWJ9c0yH?=
 =?us-ascii?Q?teLndA60XVn5DxkBvnMr2fzregeCZ0ugXgi5e4rJqRbGMXJyPEwF+7n8n5fZ?=
 =?us-ascii?Q?JsY2bUh7vqso2iuIe3WIt79kzxq3g2PA+nVjuO0sp1LAjXFmNIcC5C6tjvP7?=
 =?us-ascii?Q?+Un+bsbAzxKs+Gp8fsoo+r2uZASM5uSEvtX37dXJ9a62fDDclfz5YJB0AEmI?=
 =?us-ascii?Q?6AaSikonu27azk/1uY16fY7YdZwRkKZfPihqz/OF8if892XuGWj6U+4WEpUd?=
 =?us-ascii?Q?o6cRDSf17s1yl1/MzIKldhbJ8CCKbNXk+naURGv2AWwvDwtVyzMd6lsSVKAQ?=
 =?us-ascii?Q?PLCAPujHZHIt+QeDwAxdvDomzGeKh8M5PZ1FP7yfnQMo2j6HDC2pBnTQxkpo?=
 =?us-ascii?Q?WD17NP/YX/dSerQKcUZxxgUCsZO0MlWu9uhgd5ICythNvBrX7y0wGYAps84e?=
 =?us-ascii?Q?l+Hd1EveqXP+bm558jaOhOqKzkWiajrG1tJ7xMyVOZWskLIDCEGliAiUv25x?=
 =?us-ascii?Q?lCXC3ziKZgwQwDvnL6QHFtPFFoSkNy8BrB4VzeO+ttx/i6dfXwqKgfX8l+UV?=
 =?us-ascii?Q?AFQNnKqYceR9DNsmWGcIpOXSzhIwOBku7KSsJN94h91yCdmfbcLddPnjjHu6?=
 =?us-ascii?Q?ndILIWBqwP1Rh3naSqgqZw3aoIHHqRtEekVPuqd09kyfeoTToFJQzUeiyz8K?=
 =?us-ascii?Q?Sf5CHXx51hG1lnuVSLWXheqSbYV9p9Y8YTh77M6dpCtBJ5xxasY24UCLdaER?=
 =?us-ascii?Q?OPxlA5edOAWiSGv2jr74Z863DLrWiqPqtfH7sB9M0b46lTsul02xnMQVeN9e?=
 =?us-ascii?Q?JgYWwo0jMXjX3nMg6vbU+aJdWCBHsuXxH0Tp57lW8a5A3dd9cpDet1XbdW34?=
 =?us-ascii?Q?s5eY/1bNnel29tmNfKHSMO3veD1VPLw2HEQjxYwWRCOZo88QvxBCF5czKnVj?=
 =?us-ascii?Q?hK61YhAknT4j0HyCZ/DB+J81xmDqOyOuwlEWTtFZ8uFqZLXQY6nbSSiMv8LK?=
 =?us-ascii?Q?RauxseDqVNeX0hmREvQEfS2S7PdX31T74Gv6NfZdx0K46gguTQ+9cfNhfGiJ?=
 =?us-ascii?Q?sOeF0/t4AmrZIdN9ezquy7xiKJ3Nus5lQbX+tF3szMkoyeKfA/KF5X15WAaj?=
 =?us-ascii?Q?7nDQCbxqI6MLJJhUhK2oR/qxnB8R43OUUX3dzaUGM6Ck2XJ3c0hKfuYOjkFe?=
 =?us-ascii?Q?Cz8qR5lOrV2EBbBpWOO9deuyOm77xuzNLphdPyKo404JZbloe9x6GcM+UKbw?=
 =?us-ascii?Q?DeB4OL+i/h0qw7t6APJYr2aFJk57/Eu9YwCvRcXs6sfsWod7Wnr8hVuaNuqw?=
 =?us-ascii?Q?dPcX8w1We3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qrvBVXWgesYLlXodm3aQEPg9kKJEtQrAdpTlCHSSFO43gZ7MmrL9r1HupUFl?=
 =?us-ascii?Q?J4FeDGCcOfK12FJNs7XfU5oSoVEG+GziU1ODljFOnTEZE+Yc4unvENlIEqoL?=
 =?us-ascii?Q?5dTW+R4soT/3Wt4qA4LQhDtGp8+ur2rEn+kXZvDnr0kDGcKXye+CMlOQbT0C?=
 =?us-ascii?Q?tb2Hl58pYBCFgI1iyyE2bttb6yAWALHpCmMQHjrKyeqJlBlYC9qBfrPGAvpq?=
 =?us-ascii?Q?kcdUzTih3yj0IznZvN78o7ixnQXVZsxY3dk5/xltDjRZ6m7RMfNxHAWrXiys?=
 =?us-ascii?Q?j220R9caEz68wfOoTvT703P/9mPr2heKBeWMv2rkmcbyzWZkkZYhJbfTwTg8?=
 =?us-ascii?Q?Yt6WgJvvAmWLNBfqkexiGwHrDKM2YxY/RG4Z9bh4h41rfMZJgZ6WIxRfG1w1?=
 =?us-ascii?Q?hrZGjosK0QIe39mdF7CTyhp0HRq5cq3w7+/upgpbCkqRqp7LmljQJZ6tg6xG?=
 =?us-ascii?Q?aTedHbSZYJL8sn5oSMVjbNoVoxmrZt7U2o7pvDw8qWKWET1n0Wn+EE0G/eXP?=
 =?us-ascii?Q?KDZ+a9R+vrs9M7pO5LR+f0OuW4ta0JfNzDjmOQBzuDhWhugcmdQulB09e4d+?=
 =?us-ascii?Q?J/DOf7Y8JC7cNrslMQZXGd0MiexqYynDe/oyUnwZIiNSGyucI59HPjHCKiE7?=
 =?us-ascii?Q?Aq8tPQAx7ul4tFlf4janns/KYhv7ecN+G2OzQhPZythizB7tPJT2zWqEcCSS?=
 =?us-ascii?Q?bekHbHfSoIC8zKpFTMPPqLGj7vG4Kq67XnV/rUfaEJ5ULvWQBEOlbSC8g7Y0?=
 =?us-ascii?Q?pTEytPXuTY93ocrPZ+nzMyGUw2VEF4PncJsKr8Fm04fS5DyBfnpEOdJ9fbaK?=
 =?us-ascii?Q?xopLE+zD4sJknpFtXUura/fKNG+LBDTKuBeP6URuHhEAcJICAvGGPg+qo9tL?=
 =?us-ascii?Q?5VKVtSaJx6cMZUMkh5qiPHOR+09YQuKery4JFLpcIK1tTnAA5bXRO/jsCVSo?=
 =?us-ascii?Q?RA75wKVyNJZ/xgIybBDDkJUnYr685t8ghAL7EE3V1GSE/J8MqFhhLeI+nVFO?=
 =?us-ascii?Q?EwlKghLQHZDv4EaUsbKYscl3hApcpeqrkT/qdHL0njYd6mX24NF+N4CSCMp0?=
 =?us-ascii?Q?Jag+B0gWOppvcQeqDVxo6v7SNDBNnn6TdUFOQxtxGNQUlkuYD3vaoMYlS+4D?=
 =?us-ascii?Q?hC8ojhXUzovyJvt64Wx5TxxV4cPZ+vvzhiVFpAQmi66DoQaBImYbDXTfGUz8?=
 =?us-ascii?Q?XrMw2dic3Bsh90HmVheJcVAJyTM3TfogNzBOfSI3V2Uk7SqyDSDn82ywHAFm?=
 =?us-ascii?Q?0zLnLcWOMRkNST60Jd+g45O7+uXnboRP4/Y9VXOg22bTBbUtMscrr+64iLor?=
 =?us-ascii?Q?5Jp2NwoSrGyFEpinq5eSXzk1M74Q8FFjanHWNTKrdVsI/LraFSDP7cc6fWYy?=
 =?us-ascii?Q?+aXUTguTUMur9R/PYkr7S+4WRKhv+vtHQpgqCk8nK1ZL39Naks6/sieSjEgp?=
 =?us-ascii?Q?uyqcbYCZwn6ZdHrJcI6xOB5IDXHdzUGYxT1nxsARhzKn+ISnmxfBzPekha8N?=
 =?us-ascii?Q?tsPa52O6QEDreyjVt/2dlzA3NGuEXIi7w6VZ2+qmsc1UL1GIcASLbKglkfUE?=
 =?us-ascii?Q?ETqDdYKw3s9McdOjnTqK45ei+XjdazVNbAhgVHtulyQdEqD5Z8aCWXGI/o7+?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b5658a-3584-48e1-f932-08ddbf6edc8c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 05:01:42.6200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uw56okt/nKiGWJPR2m3T/Pjx9NsletiIDz6QAnsc0YiB80Kg3QMukeiBibnepAgH/HBAp+jNe+SYVogTyldZSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7677
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

On Thu, Jul 10, 2025 at 10:29:45AM +0530, Tejas Upadhyay wrote:
> Skipping TLB invalidations on VF causing unrecoverable
> faults. Probable reason for skipping TLB invalidations
> on SRIOV could be lack of support for instruction
> MI_FLUSH_DW_STORE_INDEX. Add back TLB flush with some
> additional handling.
> 
> Helps in resolving,
> [  704.913454] xe 0000:00:02.1: [drm:pf_queue_work_func [xe]]
>                 ASID: 0
>                 VFID: 0
>                 PDATA: 0x0d92
>                 Faulted Address: 0x0000000002fa0000
>                 FaultType: 0
>                 AccessType: 1
>                 FaultLevel: 0
>                 EngineClass: 3 bcs
>                 EngineInstance: 8
> [  704.913551] xe 0000:00:02.1: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22
> 
> V2:
>  - Use Xmas tree (MichalW)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: 97515d0b3ed92 ("drm/xe/vf: Don't emit access to Global HWSP if VF")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index bc1689db4cd7..7b50c7c1ee21 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -110,13 +110,14 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
>  	return i;
>  }
>  
> -static int emit_flush_invalidate(u32 *dw, int i)
> +static int emit_flush_invalidate(u32 addr, u32 val, u32 *dw, int i)
>  {
>  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
> -	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
> -	dw[i++] = 0;
> +		  MI_FLUSH_IMM_DW;
> +
> +	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
>  	dw[i++] = 0;
> +	dw[i++] = val;
>  
>  	return i;
>  }
> @@ -397,23 +398,20 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  static void emit_migration_job_gen12(struct xe_sched_job *job,
>  				     struct xe_lrc *lrc, u32 seqno)
>  {
> +	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
>  	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>  
>  	i = emit_copy_timestamp(lrc, dw, i);
>  
> -	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -				seqno, dw, i);
> +	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
>  
>  	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
>  
>  	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
>  
> -	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
> -		/* XXX: Do we need this? Leaving for now. */
> -		dw[i++] = preparser_disable(true);
> -		i = emit_flush_invalidate(dw, i);
> -		dw[i++] = preparser_disable(false);
> -	}
> +	dw[i++] = preparser_disable(true);
> +	i = emit_flush_invalidate(saddr, seqno, dw, i);
> +	dw[i++] = preparser_disable(false);
>  
>  	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>  
> -- 
> 2.34.1
> 
