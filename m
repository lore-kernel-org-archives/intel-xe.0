Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5458C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4CD10E08D;
	Thu,  5 Jun 2025 15:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ils9dv0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042F710E08D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749136163; x=1780672163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hvWVNz1LhDwm9zwRnMFDFnj3CqrHwK7L8mCt9Yjx2U8=;
 b=ils9dv0tm4/YV3OkW0BA7s8k3QSyYBBBGolOc+d81N0JMz6fwGCGRIm4
 3C/UT29vp9ii0rybDSs4KSTOpnQt0svNKAx+k5oZip3PLgz/msvS6b5Mt
 nKG0Mfw0o2A3CwTX0P/ws6HixWLjBXNNLQ4MFWYNpY3K1a9hONct4qSEE
 Pg2Cs/+sE8WJBinSXrvNQ9oe7hKsvrhXICfonMWuMt0heGiFOjR+0ecrM
 mxEIUeh/4k3DmE/ETbVVVoocRgjKt0yCXqUuqfyLxQfaqRKSxnQwanoCM
 syY4RzTJAzTaVNhsn+x5WIF1QZjREekth8IbUx7enkPBArTl8asBlmBTw Q==;
X-CSE-ConnectionGUID: XpIEuHX+RB22gPMjnK0y6A==
X-CSE-MsgGUID: SGznZKMDTmK7e2Exf2j7oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="50959765"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="50959765"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:09:22 -0700
X-CSE-ConnectionGUID: BXuJDYa+TfqYFGhQPC5jmQ==
X-CSE-MsgGUID: 6A7j+lslTiy2UKWl6Xg1Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="146123382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:09:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 08:09:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 08:09:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 08:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngbeVpSwx2sSJKZppsV7P2ZiRBTR5ZFbVu093q5Un5scRyJah7Eoim9Q+gnqT8K6VDlubgOF2u2rZDC/l795J9LzkKMg6DlzA2kse+LMGe7JoL47ssRp4w7KPTHnWmzYvCpOMXQrFPb2XLZj8tsoaErhBLo0iahAFdeXYcSMIbREVHZfZrEphlsYueMRDOL3SCAracj1sB4kJXDa73gTqyGEDZsSKVjN+fFQp2GZX8Z5/RttgX5WAOyzIhYqcrSZFpE88N6e0yQno0X8D3rXMenYro/ATvy/uaHpa9j+8memd1dx4EcbFT/sunCRUW+VUwwLVKqJTwzeE27zeWMYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlhBX0++KmSP1xFZT7Gq8xggBdwWav91tFD55qLvPFk=;
 b=yBIX+1dCTuO0GCshzAo3z1ViHh3Ir7R+w0bejKczJAZwBZdAVATXCXAJP6oiVG6gVVvmJMg/kujmLf/mf3lfnmwBNlqvyx9sLjlVQsi/NrrQTKyEwmuxp9/G5xfIpFbbZbPHBZ5yjgnjOjZz/rM7hBC+FNhf1wcjM8Fgi01tdq41/xSgAre7G/9ABqEVWISgrjyRmLBHS24psufPeD5z0nZmC8LAT2kri1NxEK607OWUaTooyCafFsop15GGyDFEC+Z8ZTCtEkl48JNT23XcBs5yT0nRTYcMS8/a5kp1vxlGfwlTsMY8+3A7d9y9drRHx2SdcEYcpOY2oM3/Nc9oAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPF1B1B74C09.namprd11.prod.outlook.com (2603:10b6:f:fc02::e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 15:09:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 15:09:19 +0000
Date: Thu, 5 Jun 2025 08:10:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/10] drm/xe/ggtt: Seperate flags and address in PTE
 encoding
Message-ID: <aEGzfGJlIM3W43YW@lstrano-desk.jf.intel.com>
References: <20250505121924.921544-1-dev@lankhorst.se>
 <20250505121924.921544-6-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505121924.921544-6-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPF1B1B74C09:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf379d8-95d0-4232-6cdf-08dda442f20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zipl4cgu9HkCTgzGVutZhJaJlYvtIbYTfnHmNT8wNDDz7vn2WOEuz+vP39fH?=
 =?us-ascii?Q?J5W0VZByo2Tk/QykLeB9Z0rmhH0HNqDROFfLXiSp949LBmp30ARHFdqRKUbH?=
 =?us-ascii?Q?FE80Jf+z5FSVu52mAuT+55qFmJxr9h10Eg/DvDANik7qs8f7hbvIT+i62EPI?=
 =?us-ascii?Q?t8OvuQ/hhI3MaL28uFN5W7e+Xco7xkzI06ajXzQi9ntVN6rmkJ6u5VD3+muC?=
 =?us-ascii?Q?4sUaB+g5Qdo17IzXQagJuHmBqY7WT0OisNmE75tjoYhhkw1irb75kVp0hZ8F?=
 =?us-ascii?Q?W12+46mJXYQoJ46U+j/cT8pRXwy+KueznMpJa2VKe+AfnZmzflwHiYx6+jSq?=
 =?us-ascii?Q?UC3SGftl6Em+djY1OJ+uHHLSMLrQYoiBvDiQfuG1zQK1MEVxnfmwBB6ZvfIH?=
 =?us-ascii?Q?a1KswoTxI9x2DJ+jkI9LPluyqw66jHKy/E8LcFOLlPebMPcnl12RypZDaVGE?=
 =?us-ascii?Q?3aWQ+aLFRBK9O+PyPKEQdHPoTXuMNhv4FDJjsLr19QEL/ArmT3qCkf2TAgRn?=
 =?us-ascii?Q?7pwyAseFoK2P6hChGKWjHa5BFiw0VkbPO7r9+bwFCDjTNW6a5gNk1PpqZpZ0?=
 =?us-ascii?Q?DR/mflU+5ck2k92pDYCEzWzJC6NNDquecxaJRQ5E7iXkNjpv7JVLPY4M4KTb?=
 =?us-ascii?Q?salTrL1kvJN86sDOECSuO0Zg1b+fplXOAMarzJ8KZsSPj5/LE94kPjTy3irJ?=
 =?us-ascii?Q?02NYp+qeOdg98p73BfTC5mgpZCfi89RR3YYeMT7fGz/ZQ8UZE52ut2/QJmL6?=
 =?us-ascii?Q?dqS2yxdDQga7tE92N//uVwkhx12tRsbrCcLxmK09msWopbXvH1VMVqwSlHsP?=
 =?us-ascii?Q?5YvYpu8S3yyNQh4f956SVf1jfBRMEZnA6Skucuxqe7cWvQtujhpJ09lTE5XD?=
 =?us-ascii?Q?NFks7dH+dq67xHYzMwyVc1GTKD9DYmnuQZ+HcGJw3Z6vsRN0LV9V2FodQ6eG?=
 =?us-ascii?Q?+SISEyIjsIy9f1+BHMKcL2UiUTboy3ATjK5QLSi+EGB2af5+THoWm0y4AZoX?=
 =?us-ascii?Q?GAuJHBql1d7DjGnpuq88gs8Rf3UgsF0wo+4kfbIlUg7XCOf+x8pUGZu9g/SV?=
 =?us-ascii?Q?yL2jOp7JHgH27WsEPzd6DNBHjr+ZArZlWrNB+8d7Wg5d1Hfit1WxlP4OVbnX?=
 =?us-ascii?Q?TtDGKlI6DnPYX8jLUTHNbiFSda8FID0f7xnI1YmoD28jKbEWytopJyIdbxWH?=
 =?us-ascii?Q?lcdkq8f/2eCscD891thbXBQ76510Khaz2R9Dno0Aohq+1WV4XnTj7N3x3vS3?=
 =?us-ascii?Q?T4E17moxSSlyZ8o7HKbCK5qC1iIEKl0G4VlN+wos77SHrV/7kadYN5gunnes?=
 =?us-ascii?Q?agPBKvfB/L1DyE9M1AFyk9Lm2PCUwOAoHaKKcJX/9GGaal7BXbVQ974Xjq+O?=
 =?us-ascii?Q?eUOGu4Scj2TInooYdgGOomuABE4nlT3Qmauk/r7dpvalN99J0hN5cSI7dDTu?=
 =?us-ascii?Q?2E0ATik+ye8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3dQBT474kf++QFY7JoFoApeEHKcwlxB+3jH6wfPSh4pCWouPTI9NqNA83Uk?=
 =?us-ascii?Q?hsh2i+lYo+Lf9YDsEQ2BgWlFDpQLl861js/i0C3/GvTE5XVb7ScOQVdQZ6RY?=
 =?us-ascii?Q?c09qcDSBoXwLxK9khk2K+c+vW6gkdDy/L2Qv2R1BCqqHsuUNeVc6wTxwmmli?=
 =?us-ascii?Q?V+YFWtk/EA9ywd4Iz+Uv61vNbhaIpGJTqnvWEPlmrSThqe2WbdPhCZ1k65h2?=
 =?us-ascii?Q?yi8NA7OjSBug1ZFZna8f24dhBG51KGul+2N2JkNdWYMyWoyW3kYtQAD9bYqD?=
 =?us-ascii?Q?vRPGX7qxrRv+LVnzmoBo9m6voCXxC/YsnEBWVxOn45lOzFFDYJf//Jx856VC?=
 =?us-ascii?Q?XeP8op4SurJk8L2AEtFtxvzvQD+9+KC/SNjbI5k68BC5FvRQnGGPzEkVkPuA?=
 =?us-ascii?Q?Ep+EJU4IAsChGm4JWruA6zS7Z3xggv38Z7088C/sAdSTXfXtIntfQwVbNFps?=
 =?us-ascii?Q?Z01pXkMLsGNGp9M7xPkPvPY8mC8UlLL+v4CrvtJYlvNeT6wR5xYOe6Qv0Hkb?=
 =?us-ascii?Q?fq5/gclUqG4Juo0BE4+5AYx6DCw5GL4rzzLx7dTi1hExOOC9tM+n+xuxCGJA?=
 =?us-ascii?Q?snNZC3rkjXLRRJkBsgazRMRqZXCxvK2HAdpRPrtAV1j/IBk6YW1pfqg8u7b4?=
 =?us-ascii?Q?9tC+V4LOZ9ucs37ObnQRlmPXYmfHvBJqRSAlULrOub7IU2PIj/fxYFf9JhaZ?=
 =?us-ascii?Q?PtDCQJ48sK0mR5h8g/VQ41NaAB2Jx5DBXd0I7Eci/Ms51o77Xuk6ffDGr1zX?=
 =?us-ascii?Q?Ra8RX1yHfx7X+NjNv7Y7C1p2zguxD3Tnaa5r65a7c9yUS9XzRzNUvk8/DMUu?=
 =?us-ascii?Q?+TL1B7CKGQcgPI5VVSmex94LRamH8QiYILNb51SMHDFcIJaFk5jxAR8woDPP?=
 =?us-ascii?Q?31vKUGjG1GhZz0waPNi09MUrRY4aeDjjHitkzcmvZ8mUDGTMhPtDKGMObKSr?=
 =?us-ascii?Q?jmwkAQI2dsiRuN5ndpTz4yh4zvXeKS4DfZEnjDYn31oMMRwuHfsAGhilOJzx?=
 =?us-ascii?Q?hE8m2BHxdmxk3ei20KEBGCM0NN6S2ybsg2JRxvGToJjOF61nsN/KCd1vThI4?=
 =?us-ascii?Q?z8NxdGc+45I+hYf+iYPjYzxjNGykMquc+cHRcmGsFAp605iD/gvkvJjPXXpp?=
 =?us-ascii?Q?n4DjgurCnwxfL02HKHfq6TfYtXu9r850iMcm/n9qBWRUC6nZbI+0oNsEute9?=
 =?us-ascii?Q?H858AIHA+IiRvm4/PUSOsPZh/kJA9DHAlxhGvM1oJAlFpbCAR55cylJ3gb/h?=
 =?us-ascii?Q?tm9KaZyOE1vIzz3/nBXBePHonHxKsaB4sxaEV4OT86AdTd8kQUPKceJ7jMt1?=
 =?us-ascii?Q?7yG+ACDVdvCojyOqOGkUodCyts9kdrg86hunZyZyKgTkRzNLxnoj3ZHetU0K?=
 =?us-ascii?Q?olpUGiJvB4hdfP90xRfvj4GiVd9KE7tHZleC7nVnYSTdrJYei6B4CEFn612T?=
 =?us-ascii?Q?xreXZjdqH6cXeNBoav82Z4k1aUL5+FGoCGZJ0Xi0SGFFtbnMn7PhUBPnV7Lo?=
 =?us-ascii?Q?VvwR4qUwf3F7GNv3rGhj3/n1Bze7MetWCdYdtNv/sY1j6WQAmpYnTnGJ7NFh?=
 =?us-ascii?Q?C4+TpFgrOT20QF1IfhE3t22XONcX3XwUStar65kzetqNNtRnZeWS9dR3vBOr?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf379d8-95d0-4232-6cdf-08dda442f20b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:09:19.4487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7hQQVX3mFNBNTRRqFSoQbxPAF1eeFcHgaGXj1yyYOJDGXhzhVKjG9mn7irG6IdtwwiN5UwVKtcM82Hu81LQsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1B1B74C09
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

On Mon, May 05, 2025 at 02:19:18PM +0200, Maarten Lankhorst wrote:
> Pinning large linear display framebuffers is becoming a bottleneck.
> My plan of attack is doing a custom walk over the BO, this allows for
> easier optimization of consecutive entries.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c       | 85 +++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_ggtt.h       |  2 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h |  5 +-
>  3 files changed, 65 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index bdda9302ae294..7526739034ea0 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -27,6 +27,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> +#include "xe_res_cursor.h"
>  #include "xe_sriov.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> @@ -64,13 +65,9 @@
>   * give us the correct placement for free.
>   */
>  
> -static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> -				   u16 pat_index)
> +static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>  {
> -	u64 pte;
> -
> -	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> -	pte |= XE_PAGE_PRESENT;
> +	u64 pte = XE_PAGE_PRESENT;
>  
>  	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>  		pte |= XE_GGTT_PTE_DM;
> @@ -78,13 +75,17 @@ static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  	return pte;
>  }
>  
> -static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> -				    u16 pat_index)
> +static u64 xelp_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
> +{
> +	return xelp_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +}
> +
> +static u64 xelpg_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	u64 pte;
>  
> -	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, pat_index);
> +	pte = xelp_ggtt_pte_flags(bo, pat_index);
>  
>  	xe_assert(xe, pat_index <= 3);
>  
> @@ -97,6 +98,12 @@ static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  	return pte;
>  }
>  
> +static u64 xelpg_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset,
> +				u16 pat_index)
> +{
> +	return xelpg_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +}
> +
>  static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  {
>  	u16 gmch_ctl, ggms;
> @@ -149,8 +156,9 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  	xe_tile_assert(ggtt->tile, start < end);
>  
>  	if (ggtt->scratch)
> -		scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0,
> -							  pat_index);
> +		scratch_pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
> +			      ggtt->pt_ops->pte_encode_flags(ggtt->scratch,
> +							     pat_index);

Why this change? Does the vfunc not return bo_addr | flags?

>  	else
>  		scratch_pte = 0;
>  
> @@ -210,17 +218,20 @@ static void primelockdep(struct xe_ggtt *ggtt)
>  }
>  
>  static const struct xe_ggtt_pt_ops xelp_pt_ops = {
> -	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
> +	.pte_encode_bo = xelp_ggtt_encode_bo,
> +	.pte_encode_flags = xelp_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
> -	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> +	.pte_encode_bo = xelpg_ggtt_encode_bo,
> +	.pte_encode_flags = xelpg_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte,
>  };
>  
>  static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> -	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
> +	.pte_encode_bo = xelpg_ggtt_encode_bo,
> +	.pte_encode_flags = xelpg_ggtt_pte_flags,
>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
>  };
>  
> @@ -612,23 +623,39 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
>  /**
>   * xe_ggtt_map_bo - Map the BO into GGTT
>   * @ggtt: the &xe_ggtt where node will be mapped
> + * @node: the &xe_ggtt_node where this BO is mapped
>   * @bo: the &xe_bo to be mapped
> + * @pat_index: Which pat_index to use.
>   */
> -static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> +void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +		    struct xe_bo *bo, u16 pat_index)
>  {
> -	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> -	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> -	u64 start;
> -	u64 offset, pte;
>  
> -	if (XE_WARN_ON(!bo->ggtt_node[ggtt->tile->id]))
> +	u64 start, pte, end;
> +	struct xe_res_cursor cur;
> +
> +	if (XE_WARN_ON(!node))
>  		return;
>  
> -	start = bo->ggtt_node[ggtt->tile->id]->base.start;
> +	start = node->base.start;
> +	end = start + bo->size;
> +
> +	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
> +	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> +		xe_assert(xe_bo_device(bo), bo->ttm.ttm);
> +
> +		for (xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &cur);
> +		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
> +			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
> +						   pte | xe_res_dma(&cur));
> +	} else {
> +		/* Prepend GPU offset */
> +		pte |= vram_region_gpu_offset(bo->ttm.resource);

Does this actually help vs pte_encode_bo? I not entirely convinced it
would. Any data on the speedup? I can't say I love open coded nature of
this vs just calling a vfunc.

Matt

>  
> -	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
> -		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
> -		ggtt->pt_ops->ggtt_set_pte(ggtt, start + offset, pte);
> +		for (xe_res_first(bo->ttm.resource, 0, bo->size, &cur);
> +		     cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE))
> +			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
> +						   pte + cur.start);
>  	}
>  }
>  
> @@ -641,8 +668,11 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   */
>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> +	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> +	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> +
>  	mutex_lock(&ggtt->lock);
> -	xe_ggtt_map_bo(ggtt, bo);
> +	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pat_index);
>  	mutex_unlock(&ggtt->lock);
>  }
>  
> @@ -682,7 +712,10 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  		xe_ggtt_node_fini(bo->ggtt_node[tile_id]);
>  		bo->ggtt_node[tile_id] = NULL;
>  	} else {
> -		xe_ggtt_map_bo(ggtt, bo);
> +		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
> +		u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> +
> +		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pat_index);
>  	}
>  	mutex_unlock(&ggtt->lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 0bab1fd7cc817..c48da99908848 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -26,6 +26,8 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>  			       u32 size, u32 align, u32 mm_flags);
>  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
>  bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
> +void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +		    struct xe_bo *bo, u16 pat_index);
>  void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index cb02b7994a9ac..06b1a602dd8d1 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -74,8 +74,11 @@ struct xe_ggtt_node {
>   * Which can vary from platform to platform.
>   */
>  struct xe_ggtt_pt_ops {
> -	/** @pte_encode_bo: Encode PTE address for a given BO */
> +	/** @pte_encode_bo: Encode PTE flags for a given BO */
>  	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> +
> +	/** @pte_encode_flags: Encode PTE flags for a given BO */
> +	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
>  	/** @ggtt_set_pte: Directly write into GGTT's PTE */
>  	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  };
> -- 
> 2.45.2
> 
