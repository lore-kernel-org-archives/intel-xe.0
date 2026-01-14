Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7C8D31A16
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 07:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE7710E5CF;
	Wed, 14 Jan 2026 07:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnyCt/r7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD4910E5CE
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 07:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768375936; x=1799911936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yZDHiCSLyTV6PY96ZPUxCs6NC525QW5TeWD6jGxkwxw=;
 b=KnyCt/r78jpg5nrz9/aEw7dkkL3365+ZIxxOYBHE6alk+XrT+SxkxwKl
 feKSXShjlp38TPNco5+zwJPUxYrklPMEsoNNUpmcU7My+8NVy4hXN79Qn
 xmte+skSIP9ujqdNFrnvnoeMdfsZmiH0PjlzV4V2uQsOZLwXJYZzyiCNe
 jwi5+vpr0o2/+e+OYWnM3T55hLPhZBKVWNArci3sC8SxKeBkA4j2A5+SP
 /lVaeBlPjDAQdjfVHPTSSicFlguE5qpaeNS3r9SUwd8Y/FDq+mrrdOqVA
 5MHPPYadZ/VAkv0yBAve92Jdn5MjglafVw0fVViZiasPMPuvWJnJTaaYc A==;
X-CSE-ConnectionGUID: JHI4wmwTTRKoabaWTqbcdg==
X-CSE-MsgGUID: Jw8I4iS7QoWFMjLSqpOibQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87084047"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="87084047"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:32:15 -0800
X-CSE-ConnectionGUID: CWE5Df8TQMC3i1W2folIjQ==
X-CSE-MsgGUID: 9btV8L7xReOl9a5zShisfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204883539"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:32:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:32:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 23:32:14 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:32:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTHGYpFI0+hQZnlPfP3t1AjsDp0Vo2uojW4ciPjikyLSG+H2U5vbBzaYh8R0snkgc1HaTwuFfZ+LU/dQcQCxtuImKEVz6CPWGuguxrP8HNO1OaOuSqI906ELOUZTA4BACpSod5AMpMcgmpUjn2mq37O0QpYxxnQZWWFq8h9RtjLkud5DPoSILuOLnKT4LbF9iEbScNWcZ3PO1N5e8MB31INbnwFgzkxdU+FlcJmEjk3uIDHbJ0cx9AR93BlmUfUuDaRcGXRkx/QIPFT59lVFfa2BTyOXKPu/nZRacudrxiLeY1tHILVjyBeclK6Bjh3j9LcCHnuTfwC4LOOLURjTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93MkG0lrkpi54/XWAbHYbPWPXSLdmo3OjLDqpOGNTRY=;
 b=woSIt8DzFlVOnw6qDOGiNtLM41+MMRwY9zpVoqf5BrUE31AmwlZRee0e6RU+qoG2JKvLW85B8MafFTVRPeYlBpWEXBDirkqKBYVe2156WvZgoCEz22MoOv+SN0cOINhvSH8a5OtSkFNyzqbbbDCdZMBbgIjc3D8oD0Yqw5KiX6DUf8Sa787ewuapx9PGW5zyI3nhSTD9xQcHFhXpT+JpbQ9IV3KVEtEzZ5kVlz5QXdZMFsecUR6c1jr+sdF5Du6RLMSGr8UeXxhg98m6vctkcAvqIn4X2MZRvE9MshcvQIQ7OGhrlj5YG7UqtkCHVDjIfeugYqhHGJcmhyH6maWHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 07:32:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 07:32:06 +0000
Date: Tue, 13 Jan 2026 23:32:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jia Yao <jia.yao@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>, 
 Xin Wang <x.wang@intel.com>
Subject: Re: [PATCH] drm/xe: Fix memory leak in guc_exec_queue_timedout_job
Message-ID: <aWdGdDqQqJiCjwlu@lstrano-desk.jf.intel.com>
References: <20260114044140.4020785-1-jia.yao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260114044140.4020785-1-jia.yao@intel.com>
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f1a42c-be1f-4023-9057-08de533f050a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s1YuxyvigJsdZRi7jSeNAhWUfb68UgyDxKUvJ/fyMNc6lDeTQ9rJ7lK0Lpsn?=
 =?us-ascii?Q?n0qcdXusd5puN3upKaCLeJRryxhCsWWstzhmILuTUztGWlR00l3qbMuYvz2j?=
 =?us-ascii?Q?5azOkvOAHTWWG7HqWEp4BAMUdvfYM6ZPQKBbxJdTSypbjlba20QKekjpOVLL?=
 =?us-ascii?Q?jurpBC765a/nq6CsJnVfoMBepFFLHBg8lGqZd7Uslojp1u87XGO6nvRTNiLM?=
 =?us-ascii?Q?MzCl0MVFDxSwVO4iVbGkFNPW+O8KcnkcJbbl3V1quxG67j+OAjmaupJiBqIj?=
 =?us-ascii?Q?+T7q0Eoy5lqSwJYqXvhYPVnqHisvaeasS1sEF0JC8J0i08uiWvWVUHT06i9B?=
 =?us-ascii?Q?raOD+SfuMowongQO8Txi4E369/2yxsQb5XSupqY6P7dGomwj+LeVie+VbK7p?=
 =?us-ascii?Q?yp2pPqDw4+lyZTQBUKEywblQul+ZwZlZ56/tFU6zF/QEg+dSdwE7K7+e9Qbs?=
 =?us-ascii?Q?VHScfwklxG2us9MagH+fUHYaahbTxx5ly/cplnMNLTyFzqJEeeg9TGzMBfh3?=
 =?us-ascii?Q?BtY61+c0jgVKz4ZUm9cDBpw798fJPRJ6hTJcTXsrpqtFOYVqd6ucm+adTReb?=
 =?us-ascii?Q?JVUZeRxvWUIeH0Hovt/IzvT+cWbb+JYKjiJy6DFdr9/dfC/ZwjtE9LWhmYW7?=
 =?us-ascii?Q?s3uuDHG8DoXE+zxRkmAdxmCMroc0lbzKBPWQ2VqK4DKg/oLsKXGKQ00n/aP/?=
 =?us-ascii?Q?s4f51gTTIgIq7Tqh+4gyR0Qy7QkM9bJAf7hgCzpL6C2YYAvMRB27csOjvG+M?=
 =?us-ascii?Q?45v8kUoeoJSqIHynLItD+y4jJo3lrWIzYTvJsAdaiGFNrEziSCNoqj3AkK8T?=
 =?us-ascii?Q?6wYZMVjJK+0owpLWDoj6+UIOocZpkBBV+ubn9mAcwBhQTZOHMWXOMwV7ktoA?=
 =?us-ascii?Q?25GcjqESVF+WnrNe6Xq5FGC1f1hLXMH625k7rC13q6p7Zc4X2dzlE+Q/FgfK?=
 =?us-ascii?Q?mHZRbVPgiJ8yI6TWcwSx94UJU0A0bedXKDjH8WEx4SffpZ0wPBr9LuacloXz?=
 =?us-ascii?Q?OYpZFMDAikjdtRPHHIhQszWtb4Lt13C21uKC0eJMEpU249OuT8/4Vzsg/uWv?=
 =?us-ascii?Q?7b+Gay28GfiytZbWia+jqi47i3wnr16eH7ztVyP4Xwmy+JFCWXlQdYdWC/aL?=
 =?us-ascii?Q?UsdkH245GwZ2wWry2Kfmykjt+/rv6OpALfXQQlOASThX/PkDF5wR3PGnpibX?=
 =?us-ascii?Q?XjaA4xU2FPxJvps0o4t7OK4tSHg5J5F3r0CK9BUex0frjhfeOWmousL3A1Zr?=
 =?us-ascii?Q?xflHKSHy2lWQfHdAmquJpHJ9+F0Ri3itDBG2rCrrn3dRHjeJJsJctf7HzF6I?=
 =?us-ascii?Q?Vt/lHTv+s/7bMgxsIsv3HMTrBDmMnMx708mFljmH+RrN1/QG9Wh8Go7U/BCL?=
 =?us-ascii?Q?3IOwmMe25Ujr8ghAws2txlL4XW/nzpNSS9TkpUWa4ixpNIXvjg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ig4jU93n57GK38viHwq0vbs5+A+227k1VWz6IJYDAXFj4XtPqbu0BVmiwCpZ?=
 =?us-ascii?Q?75xlqc3WfyRFw5m0srVrgdFXcvXL95R8h5nu9bRcELJ9ah2C7Ez+9Jm//kGY?=
 =?us-ascii?Q?VkGgWD2PAp02w89q4YTsUgvmELF9p+dp7Tq4t3cf88P/eyMHMKaHjvGoxcUd?=
 =?us-ascii?Q?QvkKkuPU+zw095piW1Xy5almHSeFd+z6L+EBreLzGgBwQguRNZPx5+F5/x7f?=
 =?us-ascii?Q?YjjzkTl4UOO6g2uuIiNdLFkp+/rvekyXkhm2YuD3yxR6dTma6Y8eiu/9x2vS?=
 =?us-ascii?Q?CrvD2uTmffoTd/1GeahGyUTu6yLIl+j54GX5RuMcGaOMJvdfTcu9HsjJOw8r?=
 =?us-ascii?Q?fsFWFyv3U/wVZRNPUmfXA5uuOjYQvXXsf1ZyF790mA0IvfXHFrDsB1q21PKA?=
 =?us-ascii?Q?4wrECJC4DngzyrWhyCuz72HZuKuWLX0/zFiFUFBNDNmvD0je+KQrM4cGFN7z?=
 =?us-ascii?Q?YYI3xofMOrorFat5ZSfnioeVEf55A6XJ2Td66Aa0boX9y8uF0i7Z4gYHB9+k?=
 =?us-ascii?Q?jLgBGAOqxa2O8qOxKi6qJTAMzhbYKL5YBHWT7Eqc7xDrw9lBu8F6ni1l5G8s?=
 =?us-ascii?Q?5XSdN8m2m7tD4nfWi/cXUCY7VHTFFolLubZmBKhbN+tf8xKoIrO3aPkItFhu?=
 =?us-ascii?Q?GbjFEpwMX0D0q4dbdRhc59fzLg5fT2UKW8SoIR7TMt05RPFOBm89OH41ws+E?=
 =?us-ascii?Q?PLCa2F3070cyqDXgD8hibD9LMNyuvF4t00siNdO3qUr4Up3HUr/4h69uoCx+?=
 =?us-ascii?Q?rwsHlWrWiXVE4YrEnbSgLfq23ulB8hzUkZlcFjXMrBY80lRWUbjydBPbrGo3?=
 =?us-ascii?Q?2LKGV2EAnKnJ5hTkVjrbN0MAyXBnNSTZ4t93+RME4nBZ1o9SyyfCgX2KwzgR?=
 =?us-ascii?Q?ag9HMXryPmVDTUQU2kxO02JOCORaHFjDSzknqeB5s5Snuoad/+NG1ZcEuDaM?=
 =?us-ascii?Q?7QHldaIpyTN75dJSlICmj0I+H31gtj3Y9iGlepKMsQFV861DquMdn7ffu6kw?=
 =?us-ascii?Q?bfAe7rcOISQ2+7fsOy/xFem3T6hUxBL8rSSRtQ3Ee59B3YdFuzzzlz3fVDmf?=
 =?us-ascii?Q?xNR4pv20rfn+dFrarN9JpFGgYOQ/oQL7ZU4isr6oAwyf2cPd5sPH2296wD/u?=
 =?us-ascii?Q?EHKf+StZYvytWwt0ryKKKvx4K5qJ7tih/h/ds1xQwxVot+xx7N/C9XutbUff?=
 =?us-ascii?Q?Pw8WsM7nQwA3h7zrdjIj8+mB7WpzAkCgd46j9Pt/81JaFVnQmJm9zdUZrE0d?=
 =?us-ascii?Q?NZppBNV8iseoxbQ/T6Jz0H4mLPO0apC+4xOyRaQd6BD0FG4XVdC895oKsiLz?=
 =?us-ascii?Q?I00+f5X2vEqWBeI7vnbboMpCxpx34pt6p7Y2nq9tCnb1LPq7HHn6P+0VL07a?=
 =?us-ascii?Q?9dUqS84jZaXYS76lFsu9b+PuGb1SR/v5YaERiuv2GQr4g4JobKf3zv8lFRgx?=
 =?us-ascii?Q?iMpeJWr5K3h1J4N3IEwpZbltjY8BzKCubY3Eg8wxqARF4ps13SO82cQv0IWt?=
 =?us-ascii?Q?r63U7nbHSxOReW0hhAL3Dq+dDDMd/zZlcExtXhKoyDImOpuU198K5Ygv5ipL?=
 =?us-ascii?Q?H9Y03b5sVvmBclAoQ+RtLxgA/n+KRu2jNxVmYSersXa1wGP0AqMbrMTVlOMG?=
 =?us-ascii?Q?i66Yyy3cwULhpVBj9VJlpWS0jCWFBo3jKPRL95Ig/6Au1ADiLxCUAizriav5?=
 =?us-ascii?Q?82+UtmFzRys2FSBv3vZb89qActbFTm/611rizPR8FXo/+nvyt1ZvZ4hYz8Ah?=
 =?us-ascii?Q?k40M2eTI8vfX925DqQFqmwpdfnTcfUU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f1a42c-be1f-4023-9057-08de533f050a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:32:06.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZP1mUI7SIpKFmz6YmVY00rLNGPJb3V0AlEDWoPugJiGxuSYZkzrlV4VnwgW6fKOKrlBe2B3+1yCCOvEeiyQfwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
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

On Wed, Jan 14, 2026 at 04:41:40AM +0000, Jia Yao wrote:
> When a timeout is resolved without creating a devcoredump (e.g., scheduling
> disable succeeds or check_timeout() determines there's no hang), the early
> pre-captured hardware engine snapshots allocated in guc_exec_queue_timedout_job
> are not freed. This leaves 64-byte snapshot structures and 8-byte engine name
> strings unreferenced, triggering kmemleak warnings.
> 
> Fix by explicitly freeing pre-captured snapshots and releasing matched GuC
> capture nodes when returning DRM_GPU_SCHED_STAT_NO_HANG without creating a
> devcoredump.
> 
> Reported by kmemleak:
>   unreferenced object 0xffff8881078bb040 (size 64):
>     xe_hw_engine_snapshot_capture+0x7d/0x500 [xe]
>     xe_engine_snapshot_capture_for_queue+0x162/0x320 [xe]
>     guc_exec_queue_timedout_job+0x99c/0x1ca0 [xe]
>   unreferenced object 0xffff88810232f1c8 (size 8):
>     kstrdup+0x38/0x90
>     xe_hw_engine_snapshot_capture+0x97/0x500 [xe]
> 

Thanks for the fix - noticed this one today actually.

Has this been an issue for long time for did I introduce this in my
recent series [1] ? Either way we should probably have fixes tag for
this patch for the original offending patch.

Will look into testing out this patch when I bandwidth but small nit
below.

[1] https://patchwork.freedesktop.org/series/155314/

> Signed-off-by: Jia Yao <jia.yao@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index be8fa76baf1d..083db224a879 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -56,6 +56,31 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  	return &q->gt->uc.guc;
>  }
>  
> +/*
> + * If we did an early manual engine snapshot for timeout checking but
> + * ended up not creating a devcoredump, discard any pre-captured data
> + * to avoid leaking allocations.
> + */
> +static void cleanup_precaptured_snapshot_if_no_devcoredump(struct xe_device *xe,
> +							  struct xe_gt *gt)
> +{

cleanup_precaptured_snapshot_if_no_devcoredump is way to long of a
function name and makes for ugly code, so...

s/cleanup_precaptured_snapshot_if_no_devcoredump/cleanup_snapshot/

Matt

> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +	int i;
> +
> +	if (coredump->captured)
> +		return;
> +
> +	xe_guc_capture_put_matched_nodes(&gt->uc.guc);
> +	coredump->snapshot.matched_node = NULL;
> +
> +	for (i = 0; i < XE_NUM_HW_ENGINES; i++) {
> +		if (coredump->snapshot.hwe[i]) {
> +			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
> +			coredump->snapshot.hwe[i] = NULL;
> +		}
> +	}
> +}
> +
>  /*
>   * Helpers for engine state, using an atomic as some of the bits can transition
>   * as the same time (e.g. a suspend can be happning at the same time as schedule
> @@ -1584,6 +1609,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	else
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  
> +	cleanup_precaptured_snapshot_if_no_devcoredump(xe, q->gt);
>  	/*
>  	 * We want the job added back to the pending list so it gets freed; this
>  	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
> @@ -1598,6 +1624,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 */
>  	xe_sched_submission_start(sched);
>  handle_vf_resume:
> +	cleanup_precaptured_snapshot_if_no_devcoredump(xe, q->gt);
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
>  
> -- 
> 2.43.0
> 
