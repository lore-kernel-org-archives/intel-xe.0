Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB71C9EC94
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 14:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A44E10E3F6;
	Mon, 12 Jan 2026 14:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4StYIyY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509410E3F6
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 14:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768229221; x=1799765221;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r8ilCikHpJ9jyOqAxgLaW0LJHOwwRkJINRpGC/FPKCg=;
 b=G4StYIyYBdQKmQfbYaM5eIEzP4fANnrOtP0LNWZdDI+s5zCx1CTyORq4
 ONeHsCqdd6rfy3dZNfpjJLcl7LhPHyCKUIRFmEX2YDi1VErvyV76cdvz7
 qJuZYk3cBBYVNmiK3xYlaAR7TVbdY0IA6X56BTMRKbTbsQ8XtVABz3tvh
 KrE2KIfWftMdMyKSTB4olAxz5xO3/IQ04wuYf6k0KCwg0KDiH2pqnuurN
 UWndNs/N/fx5rUHuKyTZlfRtf/JkImgNEJCtekpc6KqGVO2BimmSLg2Sx
 NjFzcdZhg5jDnP7tTB+HjuL6JwR1o8r4AYCiQ953P/ugob5hcPZ1VyFlj A==;
X-CSE-ConnectionGUID: qf0Zjp3DQiycw0mh/T92Zw==
X-CSE-MsgGUID: 0lwMNmtoQfirxbsEHTYKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69400849"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="69400849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 06:47:00 -0800
X-CSE-ConnectionGUID: l1mt4xGOTxmpoGTx3rUHig==
X-CSE-MsgGUID: cK8OhQ8oQJOhZcxd3cSsfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="234804035"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 06:47:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 06:46:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 06:46:59 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 06:46:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGObXupIdSA6W8wBMVb56HHVLSrI8hIY7P2wETEV0yCEecA9M+N0K6iEOkKdHsnVaIzQeT3RisnanvKdg4BwfEzmwUnWEldxaEKqgmOpNOJqKe/Hx5dplFk4qjuC+GIK04VW1r+i/RCevvqP0Re8aVNKTMn6OwiXy0d5kp82w4k2vKTnjSaaqYstJxXhrTmL/KLb1s1bEPla4ztUOvq/hn9nbo97rX2b62Sj5fUgXTt+DExrRmzEOILgeEFc+jhifwBgZrnpSjolYnMb8Ywzp0ADrEy8UDnFf/vMygzSQobE1aZ2/w0Cp8a77fpgaFPbiv0Q/VRtJ5rLy1JfD8iAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JR0gpU4eBshgia5CkJHyyoRlb3nApTG8OiGUMus8UE4=;
 b=ZVORr7hKf7yHqPCqIsK0yFvtoYko1rjn4VUFuHk4GkYUc02WWlZnbjQMth+gafZAFPoLjxSC174MSADz0luFmUkKJ0UzukrfK2d7RIIxxNF7eWAIUm9CC4UZ4A/DmLgt6y97rnAoT8xUh99lUUlxvCERpzPqxfqD1Sj7oBEUMP48piFE7eBbwE2BtgPJohmGhGFy/fYyr8PvRIDjAHj6KpQw9cdctSJTzAGw7JoyJMVvdUeBSzZVQG6H0+WPT50JdWOVD1x5gkSp45aKwVmabB928riN/FuNM2AdWmQxcNkXapDkx6ca4PYyZQ1OQ1MJVzFXsI3+KLEGj3gbmmiMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7768.namprd11.prod.outlook.com (2603:10b6:8:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:46:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 14:46:52 +0000
Date: Mon, 12 Jan 2026 09:46:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 4/7] drm/xe/display: Avoid dereferencing xe_ggtt_node
Message-ID: <aWUJWEMRvVo3noI4@intel.com>
References: <20260108101014.579906-9-dev@lankhorst.se>
 <20260108101014.579906-13-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260108101014.579906-13-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 696c9f09-12e6-415d-5474-08de51e96c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zZUbrUvd9vwrIrLcjwxR/mFmTentrtLuOkzfbVo9CJJhbQSDJWGVP431XH3T?=
 =?us-ascii?Q?y3yCkxSpmwkmTJ0RGc3mb6WtEJbo+p6FutKb0fRxk6/5iyeU4AqKzNV5MeRP?=
 =?us-ascii?Q?B13euZNGaR5Uqb0G2CRC7CZwlSDVCujK0xQwRHTcszxuL5v0bktkHgcQzA6W?=
 =?us-ascii?Q?J0SA6DRChLJyNz89ln8C4z5hdO5wt2oELGTMQt/UotKgZYpzngjedjjupwPN?=
 =?us-ascii?Q?KAStGYRLctkK+hbSkAE6aTWHJwTEJcyRb6WkKmQ010qSegeZRWtoL3Da6XB6?=
 =?us-ascii?Q?XUWWxaTA2I3KKKsCbq8z+fa5LojdDDPvzXgLa4ptl3c62rziOpJdu9q4NGZ/?=
 =?us-ascii?Q?BYkafn6rrWQPUwp44CzKcQgq5RyDDKD2UF1KnTA0ve4YOhR1jBfK6N+TvnzW?=
 =?us-ascii?Q?KBCEXav/Wpl9y154GqtrDMlVahqwLTKuRmVSFd/I6gBHOMXgM9cXatlm3p8f?=
 =?us-ascii?Q?J3Y7dW0BIFDoyLGkSUOsgtSmpdvx4spovHpJU++9S9hDKJyCjuE6875e0DJP?=
 =?us-ascii?Q?oSL0x+N9C9eK7mUJJgULNEQ3McvWv8QNCMhCxnYa86O74VqjblG6KTGVxPg9?=
 =?us-ascii?Q?ihJlMQfgeVB0CM2ZqJt0/czTBU3mFbzKBbz+8MZKZwqsFh1p0KkBwNw89UBT?=
 =?us-ascii?Q?0KG6lhe/ekICI1MN/KmPt9plW6uuBItuctwB/xAr2TWFhpaeMM3uEKL2yN2W?=
 =?us-ascii?Q?ENuJdyE7Lo9gNdnhJbJXvwcsDAtcjbtRZYRVzCnmfXiCDMhsNmCRz5/gKWaC?=
 =?us-ascii?Q?Fbv4fFMZjSKMwL1VuAOMBFHh//oqs+h4McsBsdU86XQzCEpq9UhBQGAdz0mb?=
 =?us-ascii?Q?lmRpBBZBvrDY21Pd4UfixDMPgmZdijeUV57Cmt1GmAergbT1QTb88FunkcDY?=
 =?us-ascii?Q?ME9NTQNKzC3Bi+GdCq27nL7kXtiruTmYVWlpuVfgS6PdOBOWyZd72H6wiRWV?=
 =?us-ascii?Q?7S92MzLo63gxTtYYZoLk/9LZoZkshUIChnRwAHnM7EabLd/5aGOAWyrgHr8I?=
 =?us-ascii?Q?oAAJuq35wnyp3PMhl5R9DajbXosy3bABHxUwI/XaLZ12bOo1FZcCqDrJSyeP?=
 =?us-ascii?Q?J6v5vdGBNaKNbTATD+vQJgrNHL3Kq/NgQcxYlKpE5/6M0EwnNq3FphAyntK+?=
 =?us-ascii?Q?gzaS3qsfdDzdcgUMppqCBohuvlsOhj3sN2Loi1hOLhKSZbXrz3U51TJRXz8Y?=
 =?us-ascii?Q?B2J7kCen+vsJZ2Vu74hZcXt75ViSD1OOFnskg8inv5Loj1RBy/ALYb9VHScd?=
 =?us-ascii?Q?aTfFpK/vAuJGbiGFTHq12LAerFPvnxIB0ThwpgEf8cI6AR+NYVipJzB4735E?=
 =?us-ascii?Q?UgFEVEd/91PicI6wpUM1NvMUcCW6CplkYjN/QrMRv1Dq0dZdjEG4XUCmIFNj?=
 =?us-ascii?Q?itqDoFOZnHaat9G0ZKo9/UX84t2hkAjZ6kA7KzwSWeK09VXQHqD/WF7tk1B9?=
 =?us-ascii?Q?LMOCMHR9t5iFslTceOrySpO/TULAWtnj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DBoTVwdZb/DexWynYom7LCRCiVO1LPtTMyi9rFENKDQlyqdbxWKKJhQ3tanj?=
 =?us-ascii?Q?sVULkI1LrwD55eJtcG78cA7PVCsQ4unT2sRwaB3zlwgbXC3NV1xtjtuqnZCk?=
 =?us-ascii?Q?X04XEtHPmKJKD+ZuG2EhZDbNCRc5j8qpifwTXvbSBX0iLNrvAlG5eIiW82IE?=
 =?us-ascii?Q?ldZ2evqajT6lcY668uW/R472zhozQJr8WFQjnACk+H7zvvSzYFG4t+Rhbwiq?=
 =?us-ascii?Q?vO3QbsbjZQl1bezesk4mFP5fAF8aW8S95AJt/3cKKDgX/jbVr9ubd5yXmBXk?=
 =?us-ascii?Q?Mq+Tz9YN4FG4Gd1wDKWf0eWV0EN4nXJFhUjnf43eQrPavvqdoFDO6MMV25R4?=
 =?us-ascii?Q?4UYJ3lEl9qLmAn3d36aRt05pqd98WrGBzDMDnCcU1zT9TSha7FxFxPMs5oSe?=
 =?us-ascii?Q?OlVxTlX/BLyu0cMyp/kgqBd/qMSxK3C83PSRn9Y2A2gJ+HCWT9SGsMZ5oJf6?=
 =?us-ascii?Q?NkD9eEjTGWhCKqMeTwIr764/VVxDmJA6A8CueyHqHOT2IKGY4Vr2PQldre4Y?=
 =?us-ascii?Q?+B5jz/Oq39HVGi54Cj7LMCCSS5anQWcOvc6PWVU04UxvMPpC/IOWzL8ZAQ++?=
 =?us-ascii?Q?p7FQPF/T4PQPLdx8TGSXlwoHts5ZCk3CGwXNyoQ5ZeuCauc/Rh01KcO3HdHQ?=
 =?us-ascii?Q?VTlafijJ1nvvAGjsoXMXRdkAAn7BYqyGqCw21tgPICQmclNT6110KLHa/qNH?=
 =?us-ascii?Q?wfy7fOvqi2mg0YmvYbeQEF7Hq9aaIaRk0oPmxb4oeK5kd/chmWFNJQ6rE8t0?=
 =?us-ascii?Q?yW3rwAbg4tR8Kd+AXyF3RNiBxJ6fUEO80Vi17fFBLkVGvCE5Qj9yFoN0mjWF?=
 =?us-ascii?Q?//VgORTdf4cg54Ju3U/Xx5PrXLEOYmEOguesY6eE2SF0uj405lT5bBOmGOwv?=
 =?us-ascii?Q?IKrZWKDD2cHv87uBfs27KZj0PQhgTwzFMZIYYP1NvXCN5Py9XUwZf0ZmAGRM?=
 =?us-ascii?Q?z1yn5uRIej6Am3aG0arhfdlCOy3SGA4z+MZfeN34ACblZDuSl5/JssNx0SxM?=
 =?us-ascii?Q?LO+Ttyir+PyiM9xUQMZLDWrf7EHV3IadpNIJsO47710hNokk+zsJCY+LLdr0?=
 =?us-ascii?Q?V9eu7EiK6gLwcWNT34FMCPFogoAFRDJK8cQqLXsqcOGByhuNogbOTnETNuVL?=
 =?us-ascii?Q?crohvpxHXAm7qNNyMwzVCpbsE7228AY/BtxgRSZ5YgbGX2TxZIhu6aJTN7+Z?=
 =?us-ascii?Q?usM4KrFYBWudJdyNO8bQujf0xDSyH6JsnQGQxDQidsB08+8n3vYxX/zXcZgr?=
 =?us-ascii?Q?tiqkMbEqqdm+xVibcxUCU6Bmep7Y9UJQyhkFJxUHfMGCF7jlQzl3GH6ysckS?=
 =?us-ascii?Q?a0yV34mWtoGb12qkIp/9OiT+Mk33C1GY/vh1xev8D1OttHIpJ7WBNiN/TVh5?=
 =?us-ascii?Q?q2YyhL7hfBWSZendrNnjtdZoOcz97Yh2xnigA4ZghaanFxuBe5bm8DjGNENc?=
 =?us-ascii?Q?14Pd3zUvRjwnbUNb/j1kMqLblRNCOrj1y85rjPGSrdXGjbK+GRL1mWcciRj3?=
 =?us-ascii?Q?XLSgiBpqYcN7PtGUugkj7np66/VpkQqwHrG8TBuWzqPtKzspr2XR7CrTTlRr?=
 =?us-ascii?Q?sDLel8MnugvbydS8jy0/IjsIQ/0qCKfBixXOfyiUTHnxX7013Z5ezyxPn3zJ?=
 =?us-ascii?Q?4MBLWIDG1d7gnpsxIwE82E5Q34NI7lJo9p0QA2D5lYRJNTIs5fXGFCZ2r4kk?=
 =?us-ascii?Q?przmF9npFwtDKH8eKNcBhU6+LFYn0UxBY0P5ukDsVwAmIzB/wTIzKFjeDZ3C?=
 =?us-ascii?Q?yCN/ggCeYA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 696c9f09-12e6-415d-5474-08de51e96c5f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:46:52.3049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7KEw7tf4rr/fs04iltZaSwrNuZM7RK1x2HTTgvnKB4cLLhwf0tjXyc0fv26n36xtWLrYxlfm9hXbuVmx1iQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7768
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

On Thu, Jan 08, 2026 at 11:10:19AM +0100, Maarten Lankhorst wrote:
> Start using xe_ggtt_node_addr, and avoid comparing the base offset
> as vma->node is dynamically allocated.
> 
> Also sneak in a xe_bo_size() for stolen, too small to put as separate commit.
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 4 ++--
>  drivers/gpu/drm/xe/display/xe_fb_pin.c            | 4 ++--
>  drivers/gpu/drm/xe/display/xe_stolen.c            | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> index b17e3bab23d58..c4b5adaaa99a3 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/drm/i915_drm.h>
>  
> -#include "xe_ggtt_types.h"
> +#include "xe_ggtt.h"
>  
>  #include <linux/refcount.h>
>  
> @@ -30,7 +30,7 @@ struct i915_vma {
>  
>  static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
>  {
> -	return vma->node->base.start;
> +	return xe_ggtt_node_addr(vma->node);
>  }
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index a1cd42001f442..d2c4e94180fa3 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -206,7 +206,7 @@ static void write_ggtt_rotated_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *n
>  	struct fb_rotate_args *args = data;
>  	struct xe_bo *bo = args->bo;
>  	const struct intel_rotation_info *rot_info = &args->view->rotated;
> -	u32 ggtt_ofs = node->base.start;
> +	u32 ggtt_ofs = xe_ggtt_node_addr(node);
>  
>  	for (u32 i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
>  		write_ggtt_rotated(ggtt, &ggtt_ofs, pte_flags, write_pte,
> @@ -353,7 +353,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  	if (vma->dpt)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
>  	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node[tile_id]) ||
> -		 vma->bo->ggtt_node[tile_id]->base.start != vma->node->base.start)
> +		 vma->bo->ggtt_node[tile_id] != vma->node)
>  		xe_ggtt_node_remove(vma->node, false);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> diff --git a/drivers/gpu/drm/xe/display/xe_stolen.c b/drivers/gpu/drm/xe/display/xe_stolen.c
> index 12771709183ad..8dc2f86ec6023 100644
> --- a/drivers/gpu/drm/xe/display/xe_stolen.c
> +++ b/drivers/gpu/drm/xe/display/xe_stolen.c
> @@ -78,7 +78,7 @@ static u64 xe_stolen_node_address(const struct intel_stolen_node *node)
>  
>  static u64 xe_stolen_node_size(const struct intel_stolen_node *node)
>  {
> -	return node->bo->ttm.base.size;
> +	return xe_bo_size(node->bo);
>  }
>  
>  static struct intel_stolen_node *xe_stolen_node_alloc(struct drm_device *drm)
> -- 
> 2.51.0
> 
