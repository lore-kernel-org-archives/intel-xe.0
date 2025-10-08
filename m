Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB4CCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 00:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E68910E737;
	Wed,  8 Oct 2025 00:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBj2QNVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C335189BF4
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 00:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759885011; x=1791421011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=07yUdqSVxY2NaNYZpUDJHsd2sgo/brhmUy+x/s6dQ6M=;
 b=LBj2QNVK5CxYPREIQmhCasrq73P6/lafFt+L4s4/k/HoohPRGeoor874
 XrTkPyChLpHUEvLFM/tnfYvHFz761y6udDS21sOu153HeiY2uAStk1lD/
 8NKLHcb3gEmO1QbvqDh9l4n9jc/zxOMOFOqCxs36MgMO5eaBhjGLqNzxF
 51pxMGRHqo4XqQnhKpadO1g8kNdZIA7NeHsONWM/dRVSZK1lDq6ckCUQB
 Fb8NRJg95+0lg+3KLugNcDrjxbnd+IXJcuTyIopG2qdPGzVKmwGPAROn4
 WoDFlvCWLrQA6dvcgKmvAIi3z2zKyB1IfkhImGd5ShLIlSeoD0LgrxuEY A==;
X-CSE-ConnectionGUID: LUf22W2kRgSEXDxPNlLfug==
X-CSE-MsgGUID: wjKAhR4sTL27xxXv06Ouug==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="65925961"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="65925961"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 17:56:50 -0700
X-CSE-ConnectionGUID: 8jFsaYtxRD6y2bCrpbFFgg==
X-CSE-MsgGUID: KQzcjr8xQpCS08qaZfSehQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="185596672"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 17:56:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 17:56:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 17:56:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 17:56:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDDmv0loQc6YZ2m/A/qsBo3nj8zLTdF/x5SWXH8LAbLJA4cpIoD/rw4eCQC/aEITYb25qiilxzZ1hdno9eusVu6olqwdRbSJ8ALjxQqZtWN73HxJPVM8gN+SyN/q/OIg5lI23RBZfjzwv1JW9hHAmj6NYuF6BfmyEeZ+leKJ9cuqaffXsnZG1In8EA32zsGz10gjb55kOLlMcPo/h8XEujyjYhOxHqgStZfDSo/BrkRGH8PCPZNKujwsfDoJ13yBzXqStwjiX8IyUGSbGfvaDz4MyHHOWVLtxUzmUK0FfgsRIuk+cZG1W2qiPy6/9N4pxJDIF4+QsYHkHfIYhYW9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br3IdKQN3J+dEQBxw4ykZzw5CUiSpC/qIkKcBTFULxI=;
 b=xinfkYIxSaICS/eZJrtaADmFdFeWk7p00VnwnILsUXshVVEWYJEvDcyjZUldJWxmO9JcZQ2KvcRjHr1ToIOmUmvO6OzysHZavMGm/P4D2SC/TwEf3imptrPAz6ubVVIHnwpiKc3Xl3pl+eI6GAG21UvgfhYWpegGzpaSzhioOyo0nYvn6DIVN/fc9K9fgMrfWwT0fESyUuSl6H2K89YH2kM0NBg/UUfPlzlpu8Bfor+/TRPxnDsHGuUzIMpKnkMVdk0a4O8KrTRbBIaqjSznrTkAKg+ruqB2jt/KpJJX5EJWAa/u0eGRyhbe9fIe1pjJG5bG4lbQkUDQqhH6UaW15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 00:56:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:56:47 +0000
Date: Tue, 7 Oct 2025 17:56:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc_submit: Check all long-running exec queues
 on stop
Message-ID: <aOW2zb85dsxSABfm@lstrano-desk.jf.intel.com>
References: <20251007215550.141304-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251007215550.141304-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:303:6b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4653:EE_
X-MS-Office365-Filtering-Correlation-Id: d91281d7-1553-4f12-9185-08de06058eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qWNeT5ZM2ASJcQU8hWEAvUGRa5JDNsPR25euHa0BQrTltTsPFjVCnflXI7Wx?=
 =?us-ascii?Q?gu7Q6kNNtX0KLlqEA2ptpsVeN4RTEjHSgwX3T9pCZzqLoRU37Ikzi/wEAKAf?=
 =?us-ascii?Q?Jwm156a+AR9c833a05wS5blYBsEY80L94bftrgdVKO3z9IC6BtS+rWCo6azo?=
 =?us-ascii?Q?yewAAGti8RjLN57A165xEHTRhcesy2CXNwBAFp39gRXvcPWvGaFr+7Rq+4OT?=
 =?us-ascii?Q?OSCbL+D82POSWAtndsJMsm14kjPx6hxyibgVEggtbk/F6hM3WuJc76unBp3c?=
 =?us-ascii?Q?h/UU2Xb126w+AnDdNRD+42/RuWpVjeeHEqh/WN3OZQjFpkvR1IZzXguzckcZ?=
 =?us-ascii?Q?BagihIQAUHVF4jbjUNxefMjvMOin1TOS6/cb3nnCeFTlFhqDE/FhfdPXW9LV?=
 =?us-ascii?Q?YEjuk7isVWk4PzFBhzEL4PB0s8k+w6GSGaAuKm5C6EN+9h1PFF45q2CyVRJx?=
 =?us-ascii?Q?twCJwgpi4UL/o9SzXXBImSEwMAuKjpHJS91hOZCbgfbLxyco+JK+3oCTVtZR?=
 =?us-ascii?Q?KL5HhBt35aTlW+ix7pMXD/0peiXLkuBwyDtaT/Oq0fAGYHkTl37aEg6pOeRf?=
 =?us-ascii?Q?Z9dELRzQboPncbBXS4Tm0+RAQCOTl1TMnyqmpZr/u7TzEOaU3NeHjUNw9efz?=
 =?us-ascii?Q?JBnkabMe1OkRecamVsJyJcCS8L/DXDPGyCummsWslroWfCJecCN1YAWG+Y+a?=
 =?us-ascii?Q?nvRhd5o6tqaMkMbla/IJcrjPTnPWDn339xLcORmbMuVINtw3926rF0LrVKjT?=
 =?us-ascii?Q?s00Gokf50dY8ZDIU0fV6GMbQqbMgeiwq7mPxC3xgJHefAb6cb0bj5zkQDyOt?=
 =?us-ascii?Q?cS8syJQAcf0yHAVFlFqv4fYkthMWEeU4rwWNKABu7dfr8T2E21bufCx9D2vP?=
 =?us-ascii?Q?ovlzHUk50YH7xDK5IM3o9SKD0a4sNFMSF1ho2t7NRp9qLBwxblV4a995v4hg?=
 =?us-ascii?Q?Fb6BrJRmIfKavmGrhDdUu3OqgWcnNbpjttPTZfNzAaAyNqe830J0cNUyi6ew?=
 =?us-ascii?Q?T+Ty5SNXicW1/wgC5kB/nUKzQTYWo+QOS+kseSe6RyUi4zg8zJY2qWnSDyuF?=
 =?us-ascii?Q?glNDMV7uqDY8QoSxV5JMoYTXy18YxlIXYLoj/JKVbMO+GhlnFaChKlWtrGJK?=
 =?us-ascii?Q?IGlEzaDWihd6D++IZrj4vvHPhwaSz3dPQz8n8tLIrU0EduMFg64JUBeWqjYH?=
 =?us-ascii?Q?rlaVaj9he9QpYjmdwkzF7CczLr2wOxxL2jHiAKPpSXxK7LBWJwD8bWPl07Uo?=
 =?us-ascii?Q?fAkBa59GNFpFiACHFD8j0zhHw0RnfZZSe5TFoqC9BSoBhORWWxOXJCggekzR?=
 =?us-ascii?Q?KC8MPdd96xC5z2y+lywAEti49QneM04rTUvK00m2fsK4B9tmcWM1TW+JWwXn?=
 =?us-ascii?Q?s9kHUY4IsrvTnJ9hCOVs3RFWMZiH0ZOV5/fpCUhHj6tG/2tP2IS2itZNVNeU?=
 =?us-ascii?Q?pDAh4Hwb9HfCzw+eRoxkcyVH0GiT9UWt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/zBMx1agx3E+OuyJvMzhLqrb2CTsJZz8hEMe1FeH37YzVtBIm0EyZVDJ7a59?=
 =?us-ascii?Q?pdtasi4pSteL0mOSdcwD7PnxV+ZBYYNd4ASD38ruq6rvgRLUhOjlrSy8R+k1?=
 =?us-ascii?Q?lteVxDGLLT2C729i5j0a54ksXeKXxSsK6dzTLC9aISQa9ap7So6+5xo2EPy6?=
 =?us-ascii?Q?kBzmCP7tOc05JH7gZDBXUaJGgaSBkG4FAcRT9TmtOAtUob2G9ZZJFUQz2A4G?=
 =?us-ascii?Q?LX11QojTFNBg/PCfYdFZ4n4AORSw/zyc8EuQZQ/eW712MuXpmKmdBTYwui4y?=
 =?us-ascii?Q?BkNxCXQqc+KTd3DS37xVIasr8x/6k7WgHuQPOYO6qUz1QPA6SdusEdQRBaOL?=
 =?us-ascii?Q?vg5zZ5quWTl3sQMqQOJf1E1c+V/BWaviDdWoZk+iQ6bHoWB9QIW3oKWTQQkT?=
 =?us-ascii?Q?OA7Gt4GUDGYBJtVysB77+u0apM5O1Sa6HLH7FQPlmmlLNz1/T491E9xVFPLB?=
 =?us-ascii?Q?ShPgq7hF8Ptm37MqcXgRSopyb8JE105OP4v8Rj6toSH1vSx3JKxFKn0lfa1d?=
 =?us-ascii?Q?6tx15tXO40IwTom+bupROyiYNYjTMJ0gqq2pwgrjoyD8uxsOapw2LEcHQRuh?=
 =?us-ascii?Q?N0VSRw1KZhFPbX9S2dKDVcf0R1j33YzsS1BBlGhVjRgNg/3LmTIBQcWOqbCY?=
 =?us-ascii?Q?lpNy1duRX2ds2rU9o9rFmtoItu3kCTrV4jTjH/jM+YW0PmOgNYmZDN7yeKbT?=
 =?us-ascii?Q?ZuvvdV8YyYrowGDlEFI+zqtmtd8O0NB8SOrJ6Y75gZgfERcTM8BNr499Fz6j?=
 =?us-ascii?Q?q0dW8LpXD4j96M0vKFbSd53GiRX6fJJhZJG3rT0rpgQ3/S00S+0H3Tk6qlS+?=
 =?us-ascii?Q?yYKmyt+0m2lclJGRPopNDZr4MBtEsYMQQs8Y5DEGxS8Hnn0hL7Yd7GLyF/gJ?=
 =?us-ascii?Q?SCw/55QGrFOmOiOoqZDxnat/bA7JPqb+vftMZhiXA8GcQXzOsmx/8QkppO9t?=
 =?us-ascii?Q?sf2UZ1xpBY/D1ErlyvA+J+I57GzvemVSbWYdv08KxxwL7nCBqX7L9md7p0W8?=
 =?us-ascii?Q?XUd4b8uKgem6ZaTzNmlwlG+AH4IYx6CLAgLYJWSPT4TxCCALJe21DBbfZRlY?=
 =?us-ascii?Q?4fDk8qeH7JkL+Lv4mjeqMibMdmEFO8Zz4358OXghk7bu5gAR8qTug19YqBar?=
 =?us-ascii?Q?8mgYnO30dckrAFYXkrCpjtEyMLRy1vvOsIEghbpC79heoLCkL5tBZlUBaZG3?=
 =?us-ascii?Q?4GCTREJS8Njzhd3zbMBvo0s1RD8V5q3xoHtJcvOdzYDdQFzv7wJ+/NnAzT49?=
 =?us-ascii?Q?GWG/be3jTpywBuTNP/Gpi2rl2IWm3g+8yC53JwhPy1XNCr7nNd1u3jOAYQmt?=
 =?us-ascii?Q?B74dXeMnss/KHWCZZE7p1A2XMIRu1I90DHFCuXNhujc7nHbeq5i5fb98xHwd?=
 =?us-ascii?Q?59KpeR972H6xBlSmwCYw+whOzzI5zqOmTb5HiMEFpIKE1xT0eJoQgV3gXvf8?=
 =?us-ascii?Q?S5W4tGYtZfNPTIeoFtTcmSNZEt+UaFSJZ2weexTJy4FHzFa1ztV9CBJpfR8Y?=
 =?us-ascii?Q?AYUgc9yXhfkPe1dm43PEIF5q12i5JCb8jFEhtHaS2CJ2AsBWV/kX5jerlqwa?=
 =?us-ascii?Q?9phEv/qG+XkZzHpaTHHeyQcVyK5PRjeB9BKcBqtAhUTjwb9mk51TzuyBQLn9?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d91281d7-1553-4f12-9185-08de06058eef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:56:47.8055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIBZTBYAVrvbxEEmookmm7RJyLVMOjJcNxwWFtFtOS4CuYTow0q23ubY1HHjGkdmzDlS254tDRw+GxwnKd4cLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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

On Tue, Oct 07, 2025 at 09:55:51PM +0000, Jonathan Cavitt wrote:
> In guc_exec_queue_stop, the target exec queue is banned when one of the
> following conditions is true:
> 
> - The exec queue has a job that has started but not completed.
> - The exec queue has a job that has experienced more than two GT resets.
> - The exec queue is long-running, and the LRC is NOT idle.
> 
> Notably, the last condition is not mutually-exclusive from the first
> two.  However, we use an else-if to determine the last condition only if
> the exec queue does not have a first scheduled job.  This means that if
> the exec queue:
> 
> - Is long-running,
> - Has an LRC that is NOT idle,
> - Has a job that has not yet started, and
> - Said job has not experienced more than two GT resets,
> 
> The exec queue will NOT be banned.
> 
> The check used to make sense when long-running exec queues weren't
> allowed to have jobs, but this is no longer the case, so we no longer
> want to else-if here.

The above change hasn't merged yet but likely will in the next couple of
days, so if anything this should be included in that change.

> 
> Fixes: abdea2847acf ("drm/xe/xe_guc_submit: Allow lr exec queues to be banned")

What motivating this change / why do you think this requires a fixes?

I don't think we really have a UMD contract with GT resets other than we
do our best to restore everything to a working state. In practice, GT
resets should never occur unless we have KMD, GuC, or HW bug. With all
of this, I think it is perfectly fine once we a job list for LR queues
we attempt to resubmit the jobs.

Matt

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 16f78376f196..86b96d7e58e9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1839,11 +1839,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  				trace_xe_sched_job_ban(job);
>  				ban = true;
>  			}
> -		} else if (xe_exec_queue_is_lr(q) &&
> -			   !xe_lrc_ring_is_idle(q->lrc[0])) {
> -			ban = true;
>  		}
>  
> +		if (xe_exec_queue_is_lr(q) &&
> +		    !xe_lrc_ring_is_idle(q->lrc[0]))
> +			ban = true;
> +
>  		if (ban) {
>  			set_exec_queue_banned(q);
>  			xe_guc_exec_queue_trigger_cleanup(q);
> -- 
> 2.43.0
> 
