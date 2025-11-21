Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E10CFC50F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 22:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A572F10E917;
	Fri, 21 Nov 2025 22:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoPs+XRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426A610E917
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763765489; x=1795301489;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BaNcE79YCsiojZ/DhRpkWsxYIQW1xWaIpmIqKvoCeyA=;
 b=RoPs+XRK4aHWkthv/ni21HySbkdjDP7nV4hRzuIarjXWU2UyoubkPupV
 TcZmm5kg4UQtVUX52ww1rWXxLRD0X7K8OZ0Q0AGeIXZUi9gepbcp/llkE
 LLBnHmoSRv+IYpCXZcU2K8SmphowXZJOjlm53kpLSphUowxb6LrW5thlc
 pSOqNtixUuCw3/UYOhbqQvKnUsvWgq8ysYeHGkNlgUmv4QqiKqS828dBf
 Cfm5WVz7stCd3o09nfxWJOgVcco6orNsTJ09fw5sm3J12pz4sw77R62iO
 BmWvMrmve9JVjbalOIWzyP6zCw1ZS8rH/LSqu2U/0kR6IdrIc+bElQJLx w==;
X-CSE-ConnectionGUID: NtgzzX+vS4OeiG7kJstG+w==
X-CSE-MsgGUID: a0Ff0+VHQc6HD5/jcMt89A==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65562891"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65562891"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:51:28 -0800
X-CSE-ConnectionGUID: 7M8rT3VpTOWhtXiO2aHGjA==
X-CSE-MsgGUID: PpdfyxK6S8GUQLgNWVPybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="196276670"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:51:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:51:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 14:51:27 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:51:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHB/RZgOjubNP7cD3I5lAGOFni8oVGZaHait6S+5tOBbUMq2uSwKH89JF4dHnd7lgmX5Hw+o35CPsG1vTFkNizgSBwhR9z/7raxSHKAfjJnkaQUqKvVZB6WsiRSaJJB4LSSlpO9ijjd0G/pKVUnUSy3I/unLdoZMJSCM6+ms5TqYaMylUuWFDhMo7kQjJMmqjwz78xy4cqznzrL55c4444SlT55o/8P68blxuNk+WytZtPF9BXo1NOR90BlIJGu0TjDwsT2OB/hiatEgd/iHaA/ZY13LC6YGrp9R8NFBDWS6sufATdxR/Tl1M1oPGSuvy84N7spjWmVbKFUQfNsIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5JUk3qAKPASRi9gWyJLfW8TFk+Fj0e1eAYNU0/0UcA=;
 b=gCH2YpRnD3VVQhjEWbyH19kPtM8BVsz4b7p3zJ59bf3t/zG6fi6W6KmF0DIdMst9fM6su3UxrUF7T69p8/CgYOrnBq9VNJuojH/rV+CrIJxWunAsyOjyEU8vUB7zIw8bCT7xdECEu6PbYczXsQtKzOopOeHrcajSHU/K0WfnHvF/gHmKpfbFWrDoQc+RTgITmQa+WQGbdmhJB/bBkn/sZ/VH20nW3BMjdrqHj+OhQ1OXquRd+AbDCW1vcJdAxqyseIfj8OfxHXx92sfEohn8NMQcAukBeuyrvZfZ7VRgkD19GIG5eOxPXdiN4tpvk3Z26lFVZ5Lc0Vg6hJ4/B6/fxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Fri, 21 Nov 2025 22:51:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 22:51:24 +0000
Date: Fri, 21 Nov 2025 14:51:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/18] drm/xe/multi_queue: Add user interface for
 multi queue support
Message-ID: <aSDs6c+wt5B2E61C@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-22-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-22-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:303:b4::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 7249f607-2fc7-4696-a82c-08de29507f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BheuUMaV5c76Tdkj0ep9sz1h7Ij2ZGBTn34pQdlkfxou19IJnpov906UHYb5?=
 =?us-ascii?Q?HinDyDE6fDymSmQy85Lff3a6xkHZxvKe11NgvPuCz6lNeB34Zc0EXqzqULrH?=
 =?us-ascii?Q?NkNsmmZTcU4dFnhZL43SGOEQI4SNKQOoz8e6aCY8dMlopi0HIQsiJQOOjG7F?=
 =?us-ascii?Q?nzifW0ApmuLoNKbc2fasaz83FRXGR4+uun5+RDOSo6pR88RLSSZiOuL0KjvF?=
 =?us-ascii?Q?3hQs4cntKnmpAviA3fLIS9HWyC1+tL/T/66YAQSD/jFxFuZxqHuaLuALKywT?=
 =?us-ascii?Q?+lw3r7hvuppUzAz3mcFRdmUvuTrstL5gUc3nDDHUScZTlj7GhXheXD8rk5/6?=
 =?us-ascii?Q?ccI139wxFSAxn0Hj/UVSvPijzmk3UvSah6E44QrjJYrgZuxqomvSnsZaGE97?=
 =?us-ascii?Q?eIsFFnI8nhN5ZQnsu68nBrJoqohebjMvbzJ/Nw3kIPTDgiQjQXk99BtJiOlY?=
 =?us-ascii?Q?M628s5AeYc5ObJCLKmu47WKz83SFusmWOIZFJEyUTQMiTvdhwmBJwBWa30EI?=
 =?us-ascii?Q?d0+tV4iSPW9LB6baQk4bXsD9dlklAJSDt5BJ5uJPDkSL803OPK/R9yVi4vcD?=
 =?us-ascii?Q?BN8UCu3V6zzlc1QeCqlgHbbuVPZX2ns0eCRrRxbhagj/GKMyXepclI44YcIE?=
 =?us-ascii?Q?k81eP1vGVLViz2WFHpf0eO5BYKDqBaRTmligwVK+vYXIfjsXGMcJF0ZoMy4s?=
 =?us-ascii?Q?BFT8U5rT0RFTUKBKFpSxsb75+qf4rw7cqWwYEqxeYtVb3IyMDnK0KcHPkvse?=
 =?us-ascii?Q?I6uJvHzHQylMtFoYfdqdpNNB2Yiq1Vw3/a+JLRIh3ejYK+wmdBTCQMNB5A/G?=
 =?us-ascii?Q?vGtQ9bu+6QBYxoRsqjq0nB0XcHDPAALjHFxP5taBGxe9hr9mvVAc8pUU472y?=
 =?us-ascii?Q?NvI+uMXG2WRUU6ooQOnE7OKaUoBCf5dcfKNneOHhDTdNDrPiv+auxEPSIzGr?=
 =?us-ascii?Q?lNv5Anhe/FQXIjFQjlrIZMmyiRujj9324FC5VT3W3k/O7GMmjw5a7NopEer9?=
 =?us-ascii?Q?swMwqo8MicddUqKoG3Jww1Ig7RSJynqlmpD3iQFtND9wt+W6zSpmGr+XAL8y?=
 =?us-ascii?Q?cGIB46WSpzU9rW/EzKehg9jI6zgAPGNn0D/324IcFrspcEHrnkycHwKYlCkH?=
 =?us-ascii?Q?KSZiBwAv1CGj1evxJVuWnVvNaszsg/JOz6ECwnQGUGbgACFSelCxgsFT/Msi?=
 =?us-ascii?Q?AV1WcUCri9w0nL04gnRUGipAJ02BBg9y7kqqC/Pu2F01y0wbGncn1V8e8lvV?=
 =?us-ascii?Q?Eyfkc1E7ouzZqLIrOXSWFrzVs+3XJ0rs0bFKZVm+TiskZ20uXhs96JvhS8Ss?=
 =?us-ascii?Q?/hojRdmjH5A4uaUNyQLBG9ywTUVfPsq01StldcV9vBKGzF3MPnu+avAyUJqV?=
 =?us-ascii?Q?YeZ1CJIvrneX7B+1xODTDv3TbbY+IHg3Ns3VHaIPu1Iluns9ZG0gIuNDupkH?=
 =?us-ascii?Q?XdMCRz0WlufLuRpGotPjB0xKhhUnY35M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+hFoHMiCDtG90PdI898uDzm4vo1alutuWFz3hyjYgc31wjA6mpKT2OfiTE2j?=
 =?us-ascii?Q?25A3BYiIoHXZ7GEf49BVbCd+5gTQHGsto9zIj6KcC68E4883G4uGBb/QtpDg?=
 =?us-ascii?Q?B2hOqy9mNOhyKTG8S8qifyVWH6dZuok6yGuRzECIO67m72/7DsDldaRaUylk?=
 =?us-ascii?Q?CVPpRDZWSH0wC1ryIfYcnTvciDN0IEua3r5UCX/8BZV/mz7IZBCp3A7qLOc8?=
 =?us-ascii?Q?82yY9wKhyu5uJms7cUnOawwTvOmJA0WCjcIvUhdaCPtsUkJBUDa9i0Uh3kE5?=
 =?us-ascii?Q?eXk0h8MzZ8O9a6da2/moT9J0HwtbCrlM4p/mf/mIYTh/vXHynQCZyomah51g?=
 =?us-ascii?Q?x7LMwpW6FRlYC/VqcjHs6b1NN4Y1CU+1vObfCqSgIiZSpKGYJ5Y8IrQtjT5U?=
 =?us-ascii?Q?DRXQsY+pnrcr9m9ee46xXxI9rSkJ5da3TifoV1pgRjqGfC2PLyqDq0+RoOIy?=
 =?us-ascii?Q?79BXCcemnENehyw965LQxTcrKUZChQc8yPIYj+O6a1bcMAjSnB44xjSCHmsb?=
 =?us-ascii?Q?2sgwnEv4tpLlQkR6gbPWFfSToWO8Li9KTmGy+TXeJcyKAHpbzyskUDo/iZCT?=
 =?us-ascii?Q?V/VUuBgabi7JJTgJrSlrezMYIqZLRjOJlXrNmgsr74DHbyNEBEJ/AhFocOus?=
 =?us-ascii?Q?CxKD07KOs4EUkUF5o93TMXfn21M3SmPbZy1G6SBk20yzFEPpHghvoWrDurj7?=
 =?us-ascii?Q?wf3Uvk5yaglA/dswmpmyumxH5SxZFmPW+JODPC422Fu3lxJCfPhSeYHzsVUm?=
 =?us-ascii?Q?pxaAl6BM6/h1Ahby1rX2wkKB4Dn+awp5oPYfMXvXB+eT3bL7xpLP6qKf2NKO?=
 =?us-ascii?Q?EYvEnq6Z7ldZOstB2fXRzbd+HKg8VPtgZmt1VXlFYjLceznaRnBs+IttZve2?=
 =?us-ascii?Q?pbd0lPDPky1686OoYQ8dRNNy4BK1lxKpe8/GgNYe+NKoGAVUlzhkVh9l6fOg?=
 =?us-ascii?Q?IOUN2aBShLlTjhNMu9HehhvfjIsnkAOK2MopzV+bQLcvzoZFAJ4uq/WAvJtc?=
 =?us-ascii?Q?fiaOf2XqMfrTmAhT+0e/Ad+7sozUsc630tpmwIxEKqoRFPyP1dbY/IwMP0xi?=
 =?us-ascii?Q?/vR0fapeLX8lUbUTgjUfDyOIeE9wJHJNboHaAkX7BZgy7WgIuuDfUrQoIUsR?=
 =?us-ascii?Q?mpmEF2W7qXZEuwlko03JYjn33/tOGFwjWOaEqfJUfQXS0bJxb+xQ5FNXQ9j8?=
 =?us-ascii?Q?kAUxV4CPMfGCMYXQO5Jyi0p+f8fqzR2fQ+FnvOg8ZI7TzNVrXgJpnTHGtQ8U?=
 =?us-ascii?Q?jyoCkzguGcYmUMhD5xFcisJkRfYJNoddfwpUriMzd5CJa4ks/VOrPAlWrode?=
 =?us-ascii?Q?Bn8c6mR6luaPnXsIuTvtTjo1Ap3LZOOEZTEHVa0oVoQ3B8s92OnR8ww5Q4L7?=
 =?us-ascii?Q?a268G1nr4p3OcXQIr5XRnQ2D4+lqulLiQIxqDAeIAXsaNBnAHtiPX2uVsexo?=
 =?us-ascii?Q?xMOoSU/J2oetQAfJMWxVxPjv1NyLwd0d/Lr1TDDcDd61xK1TqaXs4ek05Kei?=
 =?us-ascii?Q?aViPkHkVn98WO5/Y1QWJU/2VS4iTYXQXjDbjhc0KPh0hBSwJCXnxfgvz9Ckh?=
 =?us-ascii?Q?+nc6XC8sBFFkjWH9ER5Day8H5FFyXapQrSCYNfj1eADpW0T8H8FZpzgJnsGG?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7249f607-2fc7-4696-a82c-08de29507f38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 22:51:24.3973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeYKPDOS0TlDKJeAZJBzxLgJWeRhZZ3dI/1buV2V/nj1XTHFr561d/TtcXRbIEc7k0eo/rL/J+KBlvzv5tdlGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
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

On Thu, Nov 20, 2025 at 07:51:36PM -0800, Niranjana Vishwanathapura wrote:
> Multi Queue is a new mode of execution supported by the compute and
> blitter copy command streamers (CCS and BCS, respectively). It is an
> enhancement of the existing hardware architecture and leverages the
> same submission model. It enables support for efficient, parallel
> execution of multiple queues within a single context. All the queues
> of a group must use the same address space (VM).
> 
> The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
> property supports creating a multi queue group and adding queues to
> a queue group. All queues of a multi queue group share the same
> context.
> 
> A exec queue create ioctl call with above property specified with value
> DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
> queue being created as the primary queue (aka q0) of the group. To add
> secondary queues to the group, they need to be created with the above
> property with id of the primary queue as the value. The properties of
> the primary queue (like priority, timeslice) applies to the whole group.
> So, these properties can't be set for secondary queues of a group.
> 
> Once destroyed, the secondary queues of a multi queue group can't be
> replaced. However, they can be dynamically added to the group up to a
> total of 64 queues per group. Once the primary queue is destroyed,
> secondary queues can't be added to the queue group.
> 
> v2: Remove group->lock, fix xe_exec_queue_group_add()/delete()
>     function semantics, add additional comments, remove unused
>     group->list_lock, add XE_BO_FLAG_GGTT_INVALIDATE for cgp bo,
>     Assert LRC is valid, update uapi kernel doc.
>     (Matt Brost)
> v3: Use XE_BO_FLAG_PINNED_LATE_RESTORE/USER_VRAM/GGTT_INVALIDATE
>     flags for cgp bo (Matt)
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

As this is new uAPI we will need a UMD PR and ack from a UMD team.

Matt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 194 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  26 +++
>  include/uapi/drm/xe_drm.h                |  10 ++
>  4 files changed, 275 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 8724f8de67e2..330b5103222c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_syncobj.h>
>  #include <uapi/drm/xe_drm.h>
>  
> +#include "xe_bo.h"
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -63,6 +64,33 @@ enum xe_exec_queue_sched_prop {
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>  				      u64 extensions, int ext_number);
>  
> +static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_lrc *lrc;
> +	unsigned long idx;
> +
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		/*
> +		 * Put pairs with get from xe_exec_queue_lookup() call
> +		 * in xe_exec_queue_group_validate().
> +		 */
> +		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));
> +		return;
> +	}
> +
> +	if (!group)
> +		return;
> +
> +	/* Primary queue cleanup */
> +	xa_for_each(&group->xa, idx, lrc)
> +		xe_lrc_put(lrc);
> +
> +	xa_destroy(&group->xa);
> +	xe_bo_unpin_map_no_vm(group->cgp_bo);
> +	kfree(group);
> +}
> +
>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
>  	int i;
> @@ -73,6 +101,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  
>  	if (xe_exec_queue_uses_pxp(q))
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> +
> +	if (xe_exec_queue_is_multi_queue(q))
> +		xe_exec_queue_group_cleanup(q);
> +
>  	if (q->vm)
>  		xe_vm_put(q->vm);
>  
> @@ -567,6 +599,147 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>  }
>  
> +static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_tile *tile = gt_to_tile(q->gt);
> +	struct xe_exec_queue_group *group;
> +	struct xe_bo *bo;
> +
> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> +	if (!group)
> +		return -ENOMEM;
> +
> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				       XE_BO_FLAG_PINNED_LATE_RESTORE |
> +				       XE_BO_FLAG_FORCE_USER_VRAM |
> +				       XE_BO_FLAG_GGTT_INVALIDATE |
> +				       XE_BO_FLAG_GGTT, false);
> +	if (IS_ERR(bo)) {
> +		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
> +			PTR_ERR(bo));
> +		kfree(group);
> +		return PTR_ERR(bo);
> +	}
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> +
> +	group->primary = q;
> +	group->cgp_bo = bo;
> +	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> +	q->multi_queue.group = group;
> +
> +	return 0;
> +}
> +
> +static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
> +{
> +	return q->gt->info.multi_queue_engine_class_mask & BIT(q->class);
> +}
> +
> +static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
> +					u32 primary_id)
> +{
> +	struct xe_exec_queue_group *group;
> +	struct xe_exec_queue *primary;
> +	int ret;
> +
> +	/*
> +	 * Get from below xe_exec_queue_lookup() pairs with put
> +	 * in xe_exec_queue_group_cleanup().
> +	 */
> +	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
> +	if (XE_IOCTL_DBG(xe, !primary))
> +		return -ENOENT;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
> +	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
> +	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
> +		ret = -EINVAL;
> +		goto put_primary;
> +	}
> +
> +	group = primary->multi_queue.group;
> +	q->multi_queue.valid = true;
> +	q->multi_queue.group = group;
> +
> +	return 0;
> +put_primary:
> +	xe_exec_queue_put(primary);
> +	return ret;
> +}
> +
> +#define XE_MAX_GROUP_SIZE	64
> +static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 pos;
> +	int err;
> +
> +	xe_assert(xe, xe_exec_queue_is_multi_queue_secondary(q));
> +
> +	/* Primary queue holds a reference to LRCs of all secondary queues */
> +	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
> +		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);
> +	if (XE_IOCTL_DBG(xe, err)) {
> +		xe_lrc_put(q->lrc[0]);
> +
> +		/* It is invalid if queue group limit is exceeded */
> +		if (err == -EBUSY)
> +			err = -EINVAL;
> +
> +		return err;
> +	}
> +
> +	q->multi_queue.pos = pos;
> +
> +	return 0;
> +}
> +
> +static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_lrc *lrc;
> +
> +	xe_assert(xe, xe_exec_queue_is_multi_queue_secondary(q));
> +
> +	lrc = xa_erase(&group->xa, q->multi_queue.pos);
> +	xe_assert(xe, lrc);
> +	xe_lrc_put(lrc);
> +}
> +
> +static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> +				      u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
> +		return -ENODEV;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
> +		return -EOPNOTSUPP;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
> +		return -EINVAL;
> +
> +	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
> +			return -EINVAL;
> +
> +		q->multi_queue.valid = true;
> +		q->multi_queue.is_primary = true;
> +		q->multi_queue.pos = 0;
> +		return 0;
> +	}
> +
> +	/* While adding secondary queues, the upper 32 bits must be 0 */
> +	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
> +		return -EINVAL;
> +
> +	return xe_exec_queue_group_validate(xe, q, value);
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -575,6 +748,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -595,7 +769,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> @@ -644,6 +819,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
>  						  ++ext_number);
>  
> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
> +		err = xe_exec_queue_group_init(xe, q);
> +		if (XE_IOCTL_DBG(xe, err))
> +			return err;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -798,12 +979,18 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (IS_ERR(q))
>  			return PTR_ERR(q);
>  
> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +			err = xe_exec_queue_group_add(xe, q);
> +			if (XE_IOCTL_DBG(xe, err))
> +				goto put_exec_queue;
> +		}
> +
>  		if (xe_vm_in_preempt_fence_mode(vm)) {
>  			q->lr.context = dma_fence_context_alloc(1);
>  
>  			err = xe_vm_add_compute_exec_queue(vm, q);
>  			if (XE_IOCTL_DBG(xe, err))
> -				goto put_exec_queue;
> +				goto delete_queue_group;
>  		}
>  
>  		if (q->vm && q->hwe->hw_engine_group) {
> @@ -826,6 +1013,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  kill_exec_queue:
>  	xe_exec_queue_kill(q);
> +delete_queue_group:
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		xe_exec_queue_group_delete(xe, q);
>  put_exec_queue:
>  	xe_exec_queue_put(q);
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index fda4d4f9bda8..e6daa40003f2 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -66,6 +66,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>  	return q->pxp.type;
>  }
>  
> +/**
> + * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if the exec_queue is part of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
> +{
> +	return q->multi_queue.valid;
> +}
> +
> +/**
> + * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
> + * of a multi queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if @q is primary queue of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
> +{
> +	return q->multi_queue.is_primary;
> +}
> +
> +/**
> + * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
> + * of a multi queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if @q is secondary queue of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
> +{
> +	return xe_exec_queue_is_multi_queue(q) && !xe_exec_queue_is_multi_queue_primary(q);
> +}
> +
> +/**
> + * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
> + * @q: The exec_queue
> + *
> + * If @q belongs to a multi queue group, then the primary queue of the group will
> + * be returned. Otherwise, @q will be returned.
> + */
> +static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
> +{
> +	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
> +}
> +
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 771ffe35cd0c..f429b1952be9 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -32,6 +32,20 @@ enum xe_exec_queue_priority {
>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>  };
>  
> +/**
> + * struct xe_exec_queue_group - Execution multi queue group
> + *
> + * Contains multi queue group information.
> + */
> +struct xe_exec_queue_group {
> +	/** @primary: Primary queue of this group */
> +	struct xe_exec_queue *primary;
> +	/** @cgp_bo: BO for the Context Group Page */
> +	struct xe_bo *cgp_bo;
> +	/** @xa: xarray to store LRCs */
> +	struct xarray xa;
> +};
> +
>  /**
>   * struct xe_exec_queue - Execution queue
>   *
> @@ -111,6 +125,18 @@ struct xe_exec_queue {
>  		struct xe_guc_exec_queue *guc;
>  	};
>  
> +	/** @multi_queue: Multi queue information */
> +	struct {
> +		/** @multi_queue.group: Queue group information */
> +		struct xe_exec_queue_group *group;
> +		/** @multi_queue.pos: Position of queue within the multi-queue group */
> +		u8 pos;
> +		/** @multi_queue.valid: Queue belongs to a multi queue group */
> +		u8 valid:1;
> +		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
> +		u8 is_primary:1;
> +	} multi_queue;
> +
>  	/** @sched_props: scheduling properties */
>  	struct {
>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..4de21e0a4fcf 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1252,6 +1252,14 @@ struct drm_xe_vm_bind {
>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>   *    runtime PM will be blocked while queues of this type are alive.
>   *    All PXP queues will be killed if a PXP invalidation event occurs.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
> + *    or add secondary queues to a multi-queue group.
> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
> + *    then a new multi-queue group is created with this queue as the primary queue
> + *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
> + *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
> + *    All the other non-relevant bits of extension's 'value' field while adding the
> + *    primary or the secondary queues of the group must be set to 0.
>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1292,6 +1300,8 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
> +#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
