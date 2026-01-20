Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB28D262A2
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1470910E64C;
	Tue, 20 Jan 2026 20:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwYgpEcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A3710E64C
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768942480; x=1800478480;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H7cZgdurKERQGbWqRCYUIJmP3Lo4wsL94IpsW5ZjqUs=;
 b=LwYgpEcLehr9Z13JQ073Qw417KrJavuxNYr4AOobO4XVB3aZEoKwI2hs
 j+3JlLXnZDGD2in27Mfla35t2yEF3w+CG1IUwl7RceJ37SqApBywzI0Gm
 RZbbo3sPR5bSXwRLZNvmZbOqbNDky2sM5+fTpf5cG1KS0jyFmdkheCBnu
 YtV6r4FhWmPOOhzG7qH51poqpAFi43mrnwuDc5hCDp8sFN3UhcGOyojug
 BFiWYIQmqcW4+rXcep55I5n8bbB7kbNH1Yi6cWNfCE93qtmtoRrrvRFlp
 clRWmzYJGP76IICB59IsU/dKSK8JdUK/sF0gyRQH/f6XvYg+HtYcSdAV0 A==;
X-CSE-ConnectionGUID: Uig9kiwOTwG/GcelGVurYg==
X-CSE-MsgGUID: 6hZJo1MJQO+6cFgmMYhIfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92829977"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="92829977"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:54:40 -0800
X-CSE-ConnectionGUID: 6mbhxu5bT4qVAL0/loWqzA==
X-CSE-MsgGUID: 3tSQ2LWcTLyubzs648dlnA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:54:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:54:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 12:54:38 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:54:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVLTvWDahPGv1gkeOQ0Ox5e/4T8ag4GabsF91TWJmL7vSTRTDg3J3spzm5zInQkqjFhalNRLco7Y7zMmlGPSYG7BYxn+dprhkQOQ6ZbSpnEL76Olci7Hfisex7qcsOv03h62v52SjJIgKLI4WcXYC6bV98p62IyfVA2fD0zRhhJS8mKfb8TaVN5CbNdqF+xxV/hCUd1m7KcQhiBAD6seqVpWyEUpKXFavIeyB4UakTJpbfV3imPc44TbqEimfpewddVBMT0YXtRBIU3reQ7pdoFH1mur0sCu5EFbM5REPNGlxCTMzZHZHMs04OCu0IMGXmV8bmgQ2jekm4O9gD4XQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHgUSrmFhtd9YsSQrI7sZjyOCMbpo8y4B0wTPTAKii0=;
 b=a3e7lrGv12Ma3WbGDSH7gPNByUlFFGyutf2RJgIwNkkXEI79huneltn2dN2+AeFe3/f257xOr//wJMD6fo55BLL3G8WffG6Zn03/8j/rGmp+BOmhCnKT1J7YXQ1HxgA+MUwL5zI9lfi497yYnHhkdYSm3L6DaWsB7OBKE+qsXTDpYZ5B3Vt08u7TlrfyoXI+0ydhbdDyMR44vgoFXhfUOmROTiJXAcXyfbMrWIAtIL/orUee1KQ0vOAurY1OD3o9Jxhkqzf6nNr355ZLEOZxtyLkNEx9Zn/eMc9uD+t+ko7RG8PrfgptaQaEmlw/01MbAzWOmyQBdQBT82AyY7W5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9299.namprd11.prod.outlook.com (2603:10b6:208:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 20:54:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 20:54:30 +0000
Date: Tue, 20 Jan 2026 12:54:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/6] drm/xe/guc: Ensure CT state transitions via STOP
 before DISABLED
Message-ID: <aW/rhHiZc8Ty+L6d@lstrano-desk.jf.intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
 <20260120201621.2442803-5-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260120201621.2442803-5-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW4PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:303:8e::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: 0639e52d-7cc1-442d-1de5-08de58661bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1X0pgG8GADHNIhQRsOiPmsIIZjPsZ22cyiATf0bxPXC18nj01RC/7ll2xIXi?=
 =?us-ascii?Q?W2+MzKo/EyA/z/9f1p3ilBQfZFCUeIWrhRo6OYgFV0F7Itz23B52FGQy8Qxx?=
 =?us-ascii?Q?D2m9WgQGPbE2RBCmdbaKqTkE/VcuFnars2O7WpNG2VQFXiOWGvzIXzVoq33Y?=
 =?us-ascii?Q?sVHNM2/YXBWjGTn0fobBP9caN2mFQJ0fW9mGaUr+CwMgLKQR/GLFadGi3Q5e?=
 =?us-ascii?Q?qkVtoi/iK3kfkAt8z5nThO6FGmdoiWEPFKd6jaY1XMI46ZLDjXjoEBv65CfE?=
 =?us-ascii?Q?Eei6IJRWZ1l4sK5kAA5RMvJ/y/NjpLhURLksZ7eCwHPS9y2TbPQREmM2MihJ?=
 =?us-ascii?Q?bkftR0Rbob7rrWEHLjct+xIVFkFtMn6MUlhrjAm9YXnbMTs24nUbziVCM/7+?=
 =?us-ascii?Q?o9e5wGf7xpORZw+2CgWhoHmrG8C6ZY/JYYha0K1go7z88Fxq+hi/sgABbt/l?=
 =?us-ascii?Q?JWYsjufcrDLwJNy5QGYu4WI5/huboFNBUV5nvjut4afYDIvPS1/khx7MT417?=
 =?us-ascii?Q?uF0JrYQp4d0+mxgPDlEl2BZYDcR651pO0D4bVoA6FmuKt9NRI3sgdGYGRI5e?=
 =?us-ascii?Q?nXPBjUzCCOBAYpewaErQ9Ad1oT9EDj1/g4hPnTTxc7u0dew03w5QvGuKQfUI?=
 =?us-ascii?Q?o+4dYBvnOSN5+aiZc7uma5UNgnSurfSNjSImLe0NUNNLpmknZMHNM6zlc1UP?=
 =?us-ascii?Q?wz3IuNxM0HxABsIpGA+cK6Qu65x9WCVOokJxWtsra+IC67W/Zc7osvmY9QQU?=
 =?us-ascii?Q?sscp/cvGclJxgDW7scFSUedvO1xyOB1zOWI0FAjFn2Y6IIKVbG/eS1XNL7Rz?=
 =?us-ascii?Q?n6KOSvPr3mSfZ4wu6npa9Mwg+wqzkLK4apGY/2+SvuNVgCNnhZnwTDC63Gx+?=
 =?us-ascii?Q?STlj7qExnM8OUqtVpo/7JiDbAFMazrHXGjKAeHFSpD8z04VNqaXk0vv0DhwG?=
 =?us-ascii?Q?E/wNKmF67qWZkJMB3jr9kBGu4BTqhj6bIpPyeue8ACD2Czcdm3tkRE7i+rhz?=
 =?us-ascii?Q?DEU0MC3nzMHqDIXjJJOFUkFRyZJ+a593tRf5NRHxFQe21WyPlms2jm1UMDiU?=
 =?us-ascii?Q?nbRwh9UAcABZk7dPSyreM8A+hq8F05DURk1X3cFPVIKqFzUL22XMUfYSMgHA?=
 =?us-ascii?Q?gwx/Sm0vgyNZ0WUCwoMKKiXRAEB03kMfJ8L0yTCQlPHhe2qs99x3IiSfLFWr?=
 =?us-ascii?Q?BOr/Dj/0Wkmf/hvVO8ismtbvzKVPTipsuUfKyY5f6uHqb+g7ueL3PLmcnL/D?=
 =?us-ascii?Q?HWZY0upIEfzZ++dpECrvpYZ5Qex6l+vAlTJgxTe75p4M+J6X0Fjvi30JLLtP?=
 =?us-ascii?Q?TDd6rDRSbICenPsA93/OuA0ht83Wpfl5w5h0GYl8uM8WO67eXC+WAPhmjMcI?=
 =?us-ascii?Q?YbPka5Mu2iDe7H6oVrKBDV3cJlu2NidcHihZAOndNkbptxxjrDiB09BIYWAQ?=
 =?us-ascii?Q?lFuO6SUvN60JSx4UE5VmV2DFHGrtGJY3DwyxJgUp2Y8SHtBFs4Ng7ARapKb9?=
 =?us-ascii?Q?zpcM0jKcnkwJ6Gp7P1dr4g7hFifN+rH+kTa4b1cKDfa5Z1Bn2C28ln9b77IM?=
 =?us-ascii?Q?pMwENVtvB8qv+uSTtAc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fdlczJXqTBz53kcPzKX3USYRkgjKfFK1/pGL/IBRl2slMpof3vrUqMHukiBa?=
 =?us-ascii?Q?PFcq1nhm4mwgvOdWGq4IwkxhNbSvN7xBremPrScbLtq8A0717jo8oe5Otx3b?=
 =?us-ascii?Q?WKYvVAQhM6t9/giY4pEfbgWJWeJ/ZV2IkfGXbrUGLsZKjeHg5HDrQnt3doRW?=
 =?us-ascii?Q?+jvL5swGZkrQOg5s6tLl7/4jqWCvzPI1M+wWQWw/JdcZC5vxJ87oHY/w0jJL?=
 =?us-ascii?Q?aDqdi1iKqaxjd9UtqcNNUgGZzUUq4aYUHhR1xw9YF0kgl+avzpWZNwyVFliZ?=
 =?us-ascii?Q?gQEFIRm+9rACzEgqsup3anDqe+jYR1kHFh4VCdNk/mLsh2WPfUg9qvUfelVk?=
 =?us-ascii?Q?5B/C62y8SxZbkTTG0QelIA5JaJYh5XY/rVV4nS0DIRitO7CFzV7BKc3Xo+An?=
 =?us-ascii?Q?2pTgN4BJA4Mn/FaOiVwmKxi8o/J7q7oKBq8eXID64FE22cfX8rty4TVmrXla?=
 =?us-ascii?Q?pvEEhjSkcx+Q/Q4xVcdpIflMlrROGMOVev/WaEJQOtf7NmasBRCA4NnCsJNV?=
 =?us-ascii?Q?9B6HIcIFr79tq3xZBwWUPv8G+zYfz8zuRgLpVUkHOhJdT5VTlHwMAlxnogPc?=
 =?us-ascii?Q?uXMa3+R+X4Z7pNho0VPr0Oj+0x1ssBt2Esnm+2Gm77AR9uKCmbDU673VA0TF?=
 =?us-ascii?Q?ffl2I6WYYzYJmQnDpujdYsQ6XjTHgAoQv6IFT8nBGd1oPfQLQ0tx2M+8Fje9?=
 =?us-ascii?Q?pZxRBtyfc0D0dSO/3ue2C5eiYTn3n/2ZwoTxSJUa8l4bV1/4fdbHyG6uCLxU?=
 =?us-ascii?Q?ImG11P3szyZ41ypSmsA69H4oTv2AHQ7LAbUKUg8vYGIX58rsD8rznlG/RcnX?=
 =?us-ascii?Q?D9pq8WKl3sAR+Yq8y2KwcRlo1CRiM6b6dZ5XfXBVVMd/r+14DgQ8Op9czAtI?=
 =?us-ascii?Q?BQiTbOgkuusALtYzBkkMQz42GjMpZ0p8cmZpmTC3tM5nNTLe4jUO/g5N1tAo?=
 =?us-ascii?Q?7EZJNSTF8g84stbjDnejvpgEbp08r5vNgfMG3E9x2RCIy1ySPwl3Bqzmt4xB?=
 =?us-ascii?Q?Vf06ucs50ni2eiOrH1R0776vlltVrR3Aowcu70pUqhEL5zMRTUogPP/fhowq?=
 =?us-ascii?Q?rw3jc2FekQ4D1DjJ0ugT6UexfDBW4h4Yq7dj+SP7GRicHu7jCXGJ7KDEuycA?=
 =?us-ascii?Q?ty61TYgxOOhKORcXvQmclykoKpey22NofB6mkhO1wR+5ayBQaUs90/IubcQ5?=
 =?us-ascii?Q?BSsUo8K6vK2O6MRVw4V/0Ztp/KdySXRO9cPD2leclL4bJwADusMnqoPoaYfs?=
 =?us-ascii?Q?XoWBR+vhiRVC1NZd1oyT2xPxeKOkcDW3jg9ClUwou3+ju1B6XhPO3vuI+ryf?=
 =?us-ascii?Q?LflsPb7TGhy+1IFXFd3z/83MEvz1+Sgd2B6lfXagcD1dbuXvzA1HnCMwvEYr?=
 =?us-ascii?Q?nwkdwAyFzFv+Rqx+HKrj3HJMtTcywrueXr/kLUuNJPUzklDhtac45hevRLzX?=
 =?us-ascii?Q?s9iGIRGepize4HsDhxYFnLAUg+pOYWnc2IbxsCmYTj/DmC13Akgp2u0NmWuk?=
 =?us-ascii?Q?hcUd0mf8Q8VbappBu40jO3a8rqIza3KdigOKzeP1JbE71B4+0CyiX8gcJqwm?=
 =?us-ascii?Q?1NCdcyPJnYIzwvuakFKDBGfG8ZXccRS4q9M21vjiVHPQrevne/veRV07iAQ+?=
 =?us-ascii?Q?kvE9ye0jt6heZuiabMAmv0T2ROhpzBeNlM1Hk4fDvcTvj1hKu4kdUlAqhdx3?=
 =?us-ascii?Q?+finoxzYNHvY05IiMs3hRJiS9h5Ux6JYYf0sMDJa7U087gsBm4oDAzyNum3g?=
 =?us-ascii?Q?gOLLnBrO2Ixksbyek5X9hbeNj/bRRVg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0639e52d-7cc1-442d-1de5-08de58661bb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:54:30.9084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMmv22cmyQb/Oxj8v19VJZRHOyjCZiKya0V/age1qRFj4+A0GfVmiZcdTsykepV6+bZAJDRex+jGPefeV8JfqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9299
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

On Tue, Jan 20, 2026 at 03:16:19PM -0500, Zhanjun Dong wrote:
> The GuC CT state transition requires moving to the STOP state before
> entering the DISABLED state. Updated the state machine logic to enforce
> this sequence.
>

s/Updated the state machine logic to enforce this sequence./Update the
driver teardown sequence to make the proper state machine transitions./

> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

With an adjusted commit message:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

This is also probably a fixes patch too.

Matt

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index dfbf76037b04..6a658f085e0f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -345,6 +345,7 @@ static void guc_action_disable_ct(void *arg)
>  {
>  	struct xe_guc_ct *ct = arg;
>  
> +	xe_guc_ct_stop(ct);
>  	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
>  }
>  
> -- 
> 2.34.1
> 
