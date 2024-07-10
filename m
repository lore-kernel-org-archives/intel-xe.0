Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD38C38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 07:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72B10E6A1;
	Wed, 10 Jul 2024 07:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxOJSXdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1DB10E6A1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720596441; x=1752132441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hd5CSTS595E1iXyELrl6rfbx2zI+T28GZ5ZgxzVrhdw=;
 b=TxOJSXdCu9dMRBALxRtZb1Guvue7clBHne5orBW8Qf1XuTvH9u5bm6CY
 HbRuSDtCJNjlgaf9cC07M+NDD0e9j7C3FvlhnJHSSpNySg8F33FxVwu9H
 0v4aD5SN2AlnCWszBKzcCkrr+Jf1rv+XhOcRdPPiOMFpIxU4jfjA6wRvV
 oBpPJQOKKVGOLQCTYRleM0EBfGmx1XLafAU6V2pQxmmRmN2EBO6Q+Lnt3
 7ZnSXisbzgaRlIt8L6AsrSTWuW65Do+yGiHOIKqmVHvLMSX9hibbA0swd
 7n459ErTZyjzmIy4NGVaVmp/tYvQf43ILDxzyOJJIpxmgFPkZ7iZ6D+sO Q==;
X-CSE-ConnectionGUID: SIDRXSb6RsaWN0xbwJoLiA==
X-CSE-MsgGUID: dDfHCqUtQYOr71PCdFnwlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35429495"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="35429495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 00:27:21 -0700
X-CSE-ConnectionGUID: a25AliLSR36IUBoaNIDNwQ==
X-CSE-MsgGUID: B3xXJlMURZmR+VPFfsJDag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48561311"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 00:27:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 00:27:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 00:27:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 00:27:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 00:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mE6elVaAy6ODAJsTLzvYpqS+8qvnb/bFT+cfq3weQ6Cl6F3wMdHr/ZP4es4v9bvcMy8r8UzTM3IzCZMS9cKsPmvoe/Kmn2r/GSpT+qsEGdALyTesobE554vzOZFKD+a76mJBigq3ik89ep+4kioy7MQ/1u5IaWvUXuUKx8OBlrcSMtWCe0eMnFPc1KvGsD37QEVg+MQAzj2GmqMz30l6K3ST8LmtHy5FkK6lutrc7ErpDgY0NFdWWhUZA3XkNf3w7XFk7C2J9fUDlMKjTKZ1BW0RhYSAr1I2KxuVzbQAOGr3SBtbCiG+Yt1cEhLk8a8sp8C/c3Q9NWwjVvU09qCjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3FpIRhs3DcHH2r7x/GEd1FUno7p70q7yLQkIWs6/uQ=;
 b=g0ZERXxisaaQuRZPXveux/u311xOvlYBvicYCol+d73qHxdohjt1wcHk7YYYSaPuBiUMNR5+Y6L9h9hZEK4uP9fhV6gmBn0uBJpvp8dS8aVKW+8HKFJ0CByaeCSi3iK/dZtPaMvKQ39aWBGg7OD6XnguhSfaxnnRaL+d0a59zWmwtG9jGPwpH5/CvxRxzdmsV0D4ajEgdOYRt0rLu9s9FuEf5T15njoyUqVZMbyOOY7KGUnQkyGUVhVGh1Hdg6OFyocXYkKixJPCQy7glqoTgXJBLpaIPhSfvfUwSz2GqHjbXcYjdFLOiyZA5k57131oSBbLEcMcef72Wm/d2cCY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 07:27:16 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 07:27:16 +0000
Date: Wed, 10 Jul 2024 00:27:14 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 8/8] drm/xe: msix support for hw engines
Message-ID: <Zo430gl3MguzwDOw@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-9-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-9-dliberman@habana.ai>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dea2ca-a4d3-46d3-3a89-08dca0b1b9aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sn2JqwWSJZErsRIjZmmA7q3LX23dCx/aabxDsYruQEFmOK19VlUx9XRcpDjZ?=
 =?us-ascii?Q?p7eix1ZXeKUV2ECB02scZV7TZ8bGQqjWhrYomaJZ6PVeuDPUsbgaPOxWbdZ+?=
 =?us-ascii?Q?fwVEosbGJFIrkNjA69/8T5kCJmPk1O4cCS/pRjSW9ArOA8w7f9FDzZgeH+8J?=
 =?us-ascii?Q?y893ppKHmKY1akPeXrxkk7KcLzLm/QAZG/2Jc4+5uujPqLk679IHi7jWdNL8?=
 =?us-ascii?Q?tZYYXR65G/L2niffPXPTpzIM5PcyF+Kh+NV2pAERe+ZFK6oxlp+AtYpvGc+g?=
 =?us-ascii?Q?65WOYNC2eAope8HC7GqBP0QIRBwflUgicO7y917985u3gvWRk20jjcj5b5LN?=
 =?us-ascii?Q?KGkgZKnasimlV1H6Hhi55rEzwA4H0BG2guwbW7Fn/5zDxI3uiqaMP3QBv/a+?=
 =?us-ascii?Q?nJrbvavfegGDlsazwUI0AX9TCT6CyXgal2egJDXw3Nr8vDF0qs3qS3IL4tnn?=
 =?us-ascii?Q?F3t6NQzH6B2Lkkwew19Oe6EiMFh7T/I3vo3M9b2w7/D+XHjl9s6/QW0AizOA?=
 =?us-ascii?Q?V/Gv+XfAm5M3WCvE/aKvXzjHINHilThaYH4vxTOgJtzBZcyo3IhbcaP+Jjko?=
 =?us-ascii?Q?RNjeZF5E6zN4O8eyPPOgCYmYIUwiWAWokbkA9VDxqIIbt0siz1rpkbiXzVMW?=
 =?us-ascii?Q?W2SFZhISbq91D2AYS/jIu0vETJ/Y6N+MTlmBvpfl58McehTXpymkZziYjQKO?=
 =?us-ascii?Q?eIwE2+z8tOYZlqI3uw0cIfrZcEBVIzyvwGdawQYZ6b7YLA6DW4IXv3uK95Ae?=
 =?us-ascii?Q?ezfiL+J/u/PWnxnwB76Bv2xXUzIMchAI3D36nqxvlKhjoz1CDp/YdFk+4FPb?=
 =?us-ascii?Q?nXifX5RIQQZWSqLA1A5Fjmz4nRygWRbZZ4NPc6/O+uHN9qLGDOHxkG9LLvAl?=
 =?us-ascii?Q?cnNhbOqAnwdLdtalRAZ+7I/QR/hFgGR27OC4fVGuhVLl5xpqnRYrW8xQJsvc?=
 =?us-ascii?Q?sXKvzb9DNIowirgB+QCTj6xC+WvJrd/KS+L+9SMKeUKO43BKiiTH8repcjoe?=
 =?us-ascii?Q?+VW3LhRXixN4LxOyruw+RPM4uZWrwYCM99nKfvNXfOq615H/PQ2fO60pMZvi?=
 =?us-ascii?Q?CaKunLZKqWXnc+AvknjwpikEB4whUWRWXX0QVWZjCvU28zdiMtUbvfSZe7R+?=
 =?us-ascii?Q?sqGI3W4MHs9/2OL9UdRT4+8V3JBBiOjv1wYByYxAbqBQ5o5eI6Z7796mRXtd?=
 =?us-ascii?Q?TaKjiqX/nN/4iq076dDWhx+PwCF+Bd9tcMvg7WEBdmaq7doaZxZaXjlkI1x7?=
 =?us-ascii?Q?P3jJIgFOCQ0KHn7fAPGGZR2/qgxfbeIkvFFwGA5wMNceZ8ArEl9CUQwbJThX?=
 =?us-ascii?Q?XpIs4/c8m5gWTG0PKR1hyLfU9zFLQ8nVcEPxkxCliO6A/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k6EKRMc36sd/Zm3hxw4va0zaqSgS2aw/0O1nDjBW7Sz5kpY5Hsup7okZ5Y9A?=
 =?us-ascii?Q?m6EOyPjnxG+iXa7ZJmq8TzLiR9l5gPg18We0TwiS+NMjfNsvxAy9rJaCBYA6?=
 =?us-ascii?Q?vrIxbxAFYM09Kb4ggI5TtWdCQ9+bHZl1MORp11swD9/cM24UkVwMUVrOKsTu?=
 =?us-ascii?Q?SxuCoOsv3ytDHdxCthet7jY5UHsi0XoV2YE80Wc5h4aL+kfDEQKlgGCbUdag?=
 =?us-ascii?Q?RsojoC6vavKCFcFeoXoxBuKjR4EESX12lO9QZJbJAdzbjTr+mUW/nuo5kkEz?=
 =?us-ascii?Q?SpSzOIZt+pAcW6KsBbSkacgSE4YRwiNeLz1u0j8CpnRfx7whLoVxmLs5j86e?=
 =?us-ascii?Q?q7H/cSlmPNzozIEfQQFdQedrwEaEF3iRaqW8SfHe0ZvUT5KNXbIpSMuiysTs?=
 =?us-ascii?Q?bNFhBiM5KC0cehHK/be2ouJ5F4PKYvVb71F1i+M1izALPk6yK3yynnCezSvA?=
 =?us-ascii?Q?T1YcFNtZMwFb0bIkJ0AkDrh9QiFdMc6ko/MOFJSJKjo9iILB0SgPWyolzvyZ?=
 =?us-ascii?Q?lsno2iN/vg2BShMwpNs0KlFiQp1Im6o3EZQQkbZkqu3D6n+d2+g55IzGiZbj?=
 =?us-ascii?Q?nkeX77LQAtvTFJeEaoSXB6fEAnryKpnbkP/AgW+1XxcB+wo/XNdIXy714u/Q?=
 =?us-ascii?Q?aCR+Z7F65EjrB93xHFKFlKsZ9CnVsP1Ndegt83l5Ixn5c+t/G9+vg9b+ja8H?=
 =?us-ascii?Q?9xWkgAS7B2d+nXt3bt/c+0QJCi7y90qBBhCqlNyV+gPLDEcV3/JSjxsWRG0J?=
 =?us-ascii?Q?Jp37uCtcQ+cI/L9xKnQnujjNeaVEjl2NPJ+5BbzK413f+jyKzswke9W/FmiJ?=
 =?us-ascii?Q?xO85kKvBdcg/fGNNDpSyT4Jl8RBc34J9N3m4dCF8xJA4ppe3J1VoMlnQHbpO?=
 =?us-ascii?Q?OIFqEmzTytwOz9SKW0yU6W1vH0cMa0iHrWnqhgjHFU3nO0h9EP5lW1DyAP9H?=
 =?us-ascii?Q?mluWx9JW/cSAz/pXu3kCC3nrfcptODxUEeNU9g+aQb0DuY2K1iQ+8VTEex2R?=
 =?us-ascii?Q?j27nRZpQPLkZ604GPOW1ZwwdiAtEulTS60VRtCizEevqKa7aRU7TrBKfQcd8?=
 =?us-ascii?Q?Rm3ezcNEJTr8jlzbVbE0kHyPG85RnpOyit170F6MLKG9IDBcsctcNp8pGpli?=
 =?us-ascii?Q?fMQrPmcYlb0CXAHvXiq6sr493wVEow37GgEQ+08I1ycFECZJfXlnzdSlsje6?=
 =?us-ascii?Q?eJ4xH5u6NnxewCiNUjL/wvdSdy/SI7B/wqCM31/6WrhxNcII2QXN6X1LbgYo?=
 =?us-ascii?Q?i+BvdsGQp6ZU/aSKAJ9X2N6Gy3RFSiXWuXA78/65hChEgahz3665EJ2kzWJ+?=
 =?us-ascii?Q?g124eWf5Dc4VBlPNAGyJ4bHRQSKrrgLYaFGfnQpC4LAIr0vLBCsIhd78tNGa?=
 =?us-ascii?Q?zr/g3+eZaFRjpa0nP1cHuEoj+FGxAi5+TFq6RqExXJWF1QoYUDIAqfz2GDen?=
 =?us-ascii?Q?XfCyRS5nT0Hq+7GIXH8kNBtCjxJPYrHufIgLiyVn22oE9FtADrhdubhBPqTq?=
 =?us-ascii?Q?9W6/MEFhTvHHArW5z4ivEKA9MEdWwNEsodAPlrOUGwYF9Zvl9vA5Y5lm6DPr?=
 =?us-ascii?Q?3+aK39lrvVwz4h4vuOuJQ0C9VOibU5yAzIDUSwNQu4RZ5PVSpTD8Gf+FT5r4?=
 =?us-ascii?Q?PTJ2i04FtAqM+bk6kvc9eNM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dea2ca-a4d3-46d3-3a89-08dca0b1b9aa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 07:27:16.5475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /17Ei0auZlSvPItr6MwmndlG5d68lxyMjCg67KzLbcca/wW3Dd+Oi+UfoHRSWx5zo9Zvx65YUxXjeqhJTW2CQN/YC5n225i+tfn3PEbGrliU4J+gO3peCAXkRr9H82p6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
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

On Thu, Jun 27, 2024 at 03:40:43PM +0300, Dani Liberman wrote:
>From: Ilia Levi <illevi@habana.ai>
>
>For devices that support MSIX, we would like to be able to configure
>the hw engines to work with MSIX. This patch allocates MSIX vectors
>for exec queues (via MSIX allocator), registers a handler and
>programs the lrc the same way vf does it (using memirq). An
>additional field added to the lrc is CS_INT_VEC.
>
>MSIX vector 0 is used for GuC-to-host interrupt.
>
>bspec: 60342, 72547
>
>Signed-off-by: Ilia Levi <illevi@habana.ai>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 ++
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  3 ++
> drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
> drivers/gpu/drm/xe/xe_execlist.c         | 12 +++++--
> drivers/gpu/drm/xe/xe_execlist_types.h   |  1 +
> drivers/gpu/drm/xe/xe_hw_engine.c        |  7 ++--
> drivers/gpu/drm/xe/xe_irq.c              | 42 ++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_lrc.c              | 22 ++++++++++---
> drivers/gpu/drm/xe/xe_lrc.h              |  2 +-
> 9 files changed, 80 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index c38db2a74614..4c9e4f467e64 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -83,6 +83,8 @@
> #define RING_IMR(base)				XE_REG((base) + 0xa8)
> #define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
>
>+#define CS_INT_VEC(base)			XE_REG((base) + 0x1b8)
>+
> #define RING_EIR(base)				XE_REG((base) + 0xb0)
> #define RING_EMR(base)				XE_REG((base) + 0xb4)
> #define RING_ESR(base)				XE_REG((base) + 0xb8)
>@@ -137,6 +139,7 @@
>
> #define RING_MODE(base)				XE_REG((base) + 0x29c)
> #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>+#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>
> #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 045dfd09db99..9b3eafd2bdc4 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -25,6 +25,9 @@
> #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
> #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
>
>+#define CTX_CS_INT_VEC_REG		0x5a
>+#define CTX_CS_INT_VEC_DATA		(0x5a + 1)
>+

NIT...probably define like below.
#define CTX_CS_INT_VEC_DATA           (CTX_CS_INT_VEC_REG + 1)

> #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> #define INDIRECT_CTX_RING_START		(0x06 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index e40c5380e292..8b709968ec56 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -143,7 +143,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
> 	int i, err;
>
> 	for (i = 0; i < q->width; ++i) {
>-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
>+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_number);
> 		if (IS_ERR(q->lrc[i])) {
> 			err = PTR_ERR(q->lrc[i]);
> 			goto err_lrc;
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index 354f85b591b1..858a77c83b5c 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -17,6 +17,7 @@
> #include "xe_exec_queue.h"
> #include "xe_gt.h"
> #include "xe_hw_fence.h"
>+#include "xe_irq.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
> #include "xe_mmio.h"
>@@ -254,7 +255,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
> {
> 	struct drm_device *drm = &xe->drm;
> 	struct xe_execlist_port *port;
>-	int i;
>+	int i, err;

NIT...err can be defined within the if statement below.

>
> 	port = drmm_kzalloc(drm, sizeof(*port), GFP_KERNEL);
> 	if (!port)
>@@ -262,7 +263,14 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
>
> 	port->hwe = hwe;
>
>-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
>+	if (xe_device_has_msix(xe)) {
>+		err = xe_request_irq(xe, xe_irq_hwe_handler, hwe,
>+				     hwe->name, true, &port->msix_number);
>+		if (err)
>+			return ERR_PTR(err);
>+	}
>+
>+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, port->msix_number);

Where is this port->msix_number freed?

> 	if (IS_ERR(port->lrc))
> 		return ERR_PTR(PTR_ERR(port->lrc));
>
>diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
>index 415140936f11..bbb05310368e 100644
>--- a/drivers/gpu/drm/xe/xe_execlist_types.h
>+++ b/drivers/gpu/drm/xe/xe_execlist_types.h
>@@ -23,6 +23,7 @@ struct xe_execlist_port {
> 	struct list_head active[XE_EXEC_QUEUE_PRIORITY_COUNT];
>
> 	u32 last_ctx_id;
>+	u32 msix_number;
>
> 	struct xe_execlist_exec_queue *running_exl;
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 90660d9382a0..667393d70d6d 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -298,16 +298,19 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
> {
> 	u32 ccs_mask =
> 		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
>+	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
>
> 	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
> 		xe_mmio_write32(hwe->gt, RCU_MODE,
> 				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
>
>+	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
>+		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
>+
> 	hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
> 	hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
> 			       xe_bo_ggtt_addr(hwe->hwsp));
>-	hw_engine_mmio_write32(hwe, RING_MODE(0),
>-			       _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
>+	hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
> 	hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
> 			       _MASKED_BIT_DISABLE(STOP_RING));
> 	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 24e8445b2a76..62ed569bfcc7 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -11,6 +11,7 @@
>
> #include "display/xe_display.h"
> #include "regs/xe_gt_regs.h"
>+#include "regs/xe_guc_regs.h"
> #include "regs/xe_regs.h"
> #include "xe_device.h"
> #include "xe_drv.h"
>@@ -31,6 +32,7 @@
> #define IER(offset)				XE_REG(offset + 0xc)
>
> enum static_msix_allocations {
>+	GUC2HOST_MSIX = 0,
> 	NUM_OF_STATIC_MSIX,
> };
>
>@@ -686,6 +688,13 @@ static void xe_irq_msi_free(struct xe_device *xe)
>
> static void xe_irq_msix_free(struct xe_device *xe)
> {
>+	unsigned long idx;
>+	u32 *dummy;
>+
>+	xa_for_each(&xe->irq.msix_indexes, idx, dummy)
>+		xe_free_irq(xe, idx);
>+
>+	xa_destroy(&xe->irq.msix_indexes);
> }
>
> static void xe_irq_free(struct xe_device *xe)
>@@ -731,8 +740,31 @@ static int xe_irq_msi_request(struct xe_device *xe)
> 	return 0;
> }
>
>+static irqreturn_t guc2host_irq_handler(int irq, void *arg)
>+{
>+	struct xe_device *xe = arg;
>+	struct xe_tile *tile;
>+	u8 id;
>+
>+	for_each_tile(tile, xe, id)
>+		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
>+				   GUC_INTR_GUC2HOST);
>+
>+	return IRQ_HANDLED;
>+}
>+
> static int xe_irq_msix_request(struct xe_device *xe)
> {
>+	int err;
>+	u32 msix = GUC2HOST_MSIX;
>+
>+	err = xe_request_irq(xe, guc2host_irq_handler, xe, DRIVER_NAME,
>+			     false, &msix);
>+	if (err) {
>+		drm_err(&xe->drm, "Failed to request MSIX IRQ %d\n", err);
>+		return err;
>+	}
>+
> 	return 0;
> }
>
>@@ -798,12 +830,16 @@ int xe_irq_install(struct xe_device *xe)
>
> static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
> {
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	unsigned long msix_irq;
>+	u32 *dummy;
>+
>+	xa_for_each(&xe->irq.msix_indexes, msix_irq, dummy)
>+		synchronize_irq(pci_irq_vector(pdev, msix_irq));
> }
>
> void xe_irq_suspend(struct xe_device *xe)
> {
>-	int irq = to_pci_dev(xe->drm.dev)->irq;
>-
> 	spin_lock_irq(&xe->irq.lock);
> 	xe->irq.enabled = false; /* no new irqs */
> 	spin_unlock_irq(&xe->irq.lock);
>@@ -812,7 +848,7 @@ void xe_irq_suspend(struct xe_device *xe)
> 	if (xe->irq.msix_enabled)
> 		xe_irq_msix_synchronize_irq(xe);
> 	else
>-		synchronize_irq(irq);
>+		synchronize_irq(pci_irq_vector(to_pci_dev(xe->drm.dev), 0));
>
> 	xe_irq_reset(xe); /* turn irqs off */
> }
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 838609915916..575b4833be84 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -598,8 +598,9 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
> {
> 	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
> 	struct xe_device *xe = gt_to_xe(hwe->gt);
>+	u8 num_regs;
>
>-	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
>+	if (!xe_device_needs_memirq(xe))
> 		return;
>
> 	regs[CTX_LRM_INT_MASK_ENABLE] = MI_LOAD_REGISTER_MEM |
>@@ -607,12 +608,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
> 	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
> 	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
>
>-	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
>+	num_regs = xe_device_has_msix(xe) ? 3 : 2;
>+	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
> 				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
> 	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
> 	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq);
> 	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
> 	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq);
>+
>+	if (xe_device_has_msix(xe)) {
>+		regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
>+		/* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
>+	}
> }
>
> static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
>@@ -890,7 +897,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>
> static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>-		       struct xe_vm *vm, u32 ring_size)
>+		       struct xe_vm *vm, u32 ring_size, u32 msix)
> {
> 	struct xe_gt *gt = hwe->gt;
> 	struct xe_tile *tile = gt_to_tile(gt);
>@@ -959,6 +966,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> 	}
>
>+	if (xe_device_has_msix(xe)) {
>+		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix);
>+	}

Braces not required.

>+
> 	if (xe_gt_has_indirect_ring_state(gt)) {
> 		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
> 				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
>@@ -1019,6 +1030,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  * @hwe: Hardware Engine
>  * @vm: The VM (address space)
>  * @ring_size: LRC ring size
>+ * @msix: MSI-X vector (used only for MSI-X capable devices)
>  *
>  * Allocate and initialize the Logical Ring Context (LRC).
>  *
>@@ -1026,7 +1038,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  * upon failure.
>  */
> struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>-			     u32 ring_size)
>+			     u32 ring_size, u32 msix)
> {
> 	struct xe_lrc *lrc;
> 	int err;
>@@ -1035,7 +1047,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> 	if (!lrc)
> 		return ERR_PTR(-ENOMEM);
>
>-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
>+	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix);
> 	if (err) {
> 		kfree(lrc);
> 		return ERR_PTR(err);
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index c24542e89318..1eded8919d73 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -23,7 +23,7 @@ struct xe_vm;
> #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>
> struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>-			     u32 ring_size);
>+			     u32 ring_size, u32 msix);
> void xe_lrc_destroy(struct kref *ref);
>
> /**
>-- 
>2.34.1
>
