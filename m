Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5D6C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 05:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFC211213D;
	Fri, 26 Apr 2024 05:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjWgypMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB7E11213C
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 05:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714108782; x=1745644782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/tTJsUbOs9Uj/nepaiBGeIOUkoI/5MhLXzdcQU19s8k=;
 b=YjWgypMIL1uQiE0JWPGJBciQ4tt8wkmNuB3192x1dtUGO3LCrVR9RPxC
 0MFc3sf0yp4ZKhxSP7jo8Phd8GVcx7m0/2NSmpgGHDJWtbnx0tg7tAPkQ
 msBP18zi1iD8MyHJ6F5bjaulrW/ZFcxHosS+Tn19WcFOcpn+2MJPnT2He
 Y8OtB7vVDO9MZV8JLq3O+gxe/P0uIRbBsd+mjdqcJM98/GtNIUtanq7O/
 LF5vyTInsCp8qzERPMhxmgDkWljlB5qlWtbjb6t0S+f5GBQcFa5HTzWw0
 /F1TkUM/DHkMMhNrDwPZxZGhIAuX5LikmnKy3Wy5p2QoOJ1aEfwktcl8i Q==;
X-CSE-ConnectionGUID: kwGIHj3cR7mGcpnBUPn6tQ==
X-CSE-MsgGUID: 5FI460m/QDiRrSP6tRARiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9668152"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9668152"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 22:19:42 -0700
X-CSE-ConnectionGUID: jejuFoWuSqS8rbiyxAapTg==
X-CSE-MsgGUID: 80CtuOBUTU248jI/NxZ4vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="56486743"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 22:19:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 22:19:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 22:19:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 22:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RS/yVBT1MgDCZgC/DFd6fJgMjQMG9UqTn3PsUbM0Po94VO5rktVNQIjEVobO/RAsTlPXuVhvufueZoa8zzQnmayLPaLBEfl2Zgi1iQztZRNSl3XVtgVmostHIjnxMFuDDKq9TJ5FV3kN2zNtDfypfFJBMvh1QtWMDED1s1xp4xA9RT3vvB01A+PhLgfpBafe6OKBd/kOpOE4s9miA58f+/m9IdsjBhA1RLvVlcrgKMbc1tTl3Ete3iu2aFnkAbNAaoUjSY89slbrXT6NI/hugdqLDcaV2ZEnh/P3w4AqqCE9wHkPQAayS8r6pp988ucRi8GbWe7MnitGJnLxgXCxsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2b2swVqjBe/zCRAc04srIMEzyvdh2VZI4OEugHBrDQ=;
 b=lN4lruXAR3uVi5SgU260St7p5wDeoFMyANxPhsad+RrjjiHaXssj+n/merKu389rcyM0ipQQ1u5XV1KhUYuZhlkH+K+o9eSA+gBi2ZvnQFLOLuiWYfeAHgoLOcWdsAwdgCWwokCsaVS5HRVJqs84gf1lAu/jb8f6PRa1GpUvXRZqt/jKJLPR9WUBGq1mqyeAtJ+/bTL67fQqafOiky/qZg0okp74bClE9Mm2jNxeRYzJ5h1BfYI7FJOAXp3tKi6C3gxZdEu4N5vV4rbWTk0s9NM4lsDRJiyB9Lhebu9cPV9t8gTwdbz3xpFHTt7e7eybkJl/N9QkLT9bDzdk8xTcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30; Fri, 26 Apr
 2024 05:19:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Fri, 26 Apr 2024
 05:19:33 +0000
Date: Fri, 26 Apr 2024 05:19:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, <michal.winiarski@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Drop useless forcewake get/put
Message-ID: <Zis5X3vPeUZqTnvO@DUT025-TGLU.fm.intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425182410.2705061-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 82580bc2-7fc9-4909-9c45-08dc65b07527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CDEO15ZVzqOVQP1DbWjRY1v/6tP0hd9m2sGRSrHktHjyz0aB5edlvzSLeqgk?=
 =?us-ascii?Q?XqAt9G9ue0/3jyA2fxw20ryOcxd63cUEOkY/AVxVRwgiaZD1mITzch/vZ85K?=
 =?us-ascii?Q?1Laj1npI8F1KUW4vPW1gBx766N1blTXBCEf7tUX+Qm4enoE5AFWC9UolfOQG?=
 =?us-ascii?Q?AO0h+QJiK8GcZXhQDQe5km52gnPSyB+YY4JDmSdg7bVv2x+M4lGpW2L6K3du?=
 =?us-ascii?Q?DYKqo3e0lvqxLsyaAJ3v71XQep3QITJNSxF9nNTH4ulP/DC+cgV1UsX0uUVf?=
 =?us-ascii?Q?Pt17AhXN5l1MPK312X5KbdkLyHwA8qhSR7R9bWYAoUg82Cn8IimFLP7DAcNk?=
 =?us-ascii?Q?HAxkAEAxZ+72Fk2mjlWM76I0GODoHkr75Ab+kVsqEeEzH/TxETNtC+0MHnu9?=
 =?us-ascii?Q?lkXukC3Pk6xLdSpapc4S6eZkKWn0g2gwaeVZRqC8/n2TxemMWH6Y1RBzigLU?=
 =?us-ascii?Q?0ad0cKwyFh02AIzfvdOZW2VgiS0kvHkaiSWjhvvWl0DwrcNK7OWPhi3zxYnc?=
 =?us-ascii?Q?kZkET1v1HpXBQjaWsQPvWD6UcBxrlrlhTTt8F4gQE+K+PK8vZzPq+AbyK5Xe?=
 =?us-ascii?Q?qoX9VGJ1gAYMWGPoRAoKGAsqtrw/wXfkzm9g4H8ryHlMV2rw+vQLiWMYayW5?=
 =?us-ascii?Q?Kn7JNRAlGeiPHRj3bJiMtWgoGS+Cv8IgFoKvZ0dz1KxUaBD6EBo6GW8YCjHK?=
 =?us-ascii?Q?91f3D6a0l8VF27NzJedjZE0ntCiBCA6EZ9Vf8xo9fCmHGrAIq9oj/TVjzvgr?=
 =?us-ascii?Q?ouylLtOjatkSPQPVahJMLQ7PreqJvSnWNUR8Q1NW8nrij3z83XxjPH7+O0A4?=
 =?us-ascii?Q?4hLyK/VoXBLS89Woo5owsP4fRFp8pfoXA+O7A+5VkHMLq4rJX2Qo9TZprFyx?=
 =?us-ascii?Q?J9uA32Zavbzz4BMqJoakcwkBO/MtDOYdVBbdlKb/JWIXGd//9Mctjg919mwC?=
 =?us-ascii?Q?gWf3DsyxkR028Wxvi+FsfVfS6UkaG4bhWOwdKrLsKjbyDFFuaZz65OMOyfb9?=
 =?us-ascii?Q?CjpI5MRtgqeDl3GCM1TT0/qK2ale6sDSjtsy8gr1V9HIQyD2HRakUqJuSevj?=
 =?us-ascii?Q?7LJy4g2TXMQLwn60EtnUoiz6XBuy7j5yOhJ+FGqil7jTxcPsS1AKj6CD+Nd6?=
 =?us-ascii?Q?hxqy2yZOQnmHonqUlcMTrzW1PBd+1zY0E9fPuOCCxZUFk92gQobG11c/b+Ga?=
 =?us-ascii?Q?c9XOaeciAC0kx4+IXRutsOUsvOYOiRv9ebTlkIp384J06/Sn70pUriyP2Z/L?=
 =?us-ascii?Q?WMS8A1o9gDPgHoeeGTd0GMND/MiDkEbUaKLUcfhaag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FMB2DdLfcX0SFELocgC2+zE0rt7t35ZtwGH9adGIyf8mdd9wV0Bse6spEo88?=
 =?us-ascii?Q?nyA6vdsvc/YktMsa/rmB/v4WU5ZZOYNWMzprcFsbVbW7TpWCk/VjLLmxiPmV?=
 =?us-ascii?Q?NzESIWENm2hnfxobduGE0HWX8QRh7NpTo6EUFdj9JyzBZuUXGuESGStCi6Nr?=
 =?us-ascii?Q?/+0v+GscQx/PyNOYxUpRSVxSJpPPKOuJXcP2UNWOhZ67mWrM/zt3AxvElKMG?=
 =?us-ascii?Q?VjLgiSLDStmxmC1NetBoAM2c9+OTzHPw4Th9CjQx7bBnW6Dq79EIy/tusgl6?=
 =?us-ascii?Q?6DBSYJ+KV0i5f23zPwEY26LNpWKYbbN4LwZV+eYGMoeGPzgBzYmIgexN8DP7?=
 =?us-ascii?Q?Yseoc1E+NoL5v6cf06PgEnjr+RfEo7RsgsQzyKUdSJ3Nm05wXFDa90sjyppT?=
 =?us-ascii?Q?KvVqzT6VT1oBhSlDpLOxuZyGmJdCToKhYqGCZPfMPzDrbVAlpCI5sNuop3XJ?=
 =?us-ascii?Q?4dUBAjsD9RjYTZccOSubzop8j5GBslAUGNpMv6MojNYZxRj8T4qGMvLRvsju?=
 =?us-ascii?Q?vuDen0Dv95XMHcBYU03zhY3SKDFw05JXs007YbXQyngjJhG3MR30iYmrUdTI?=
 =?us-ascii?Q?5baTyP5sjvwGPW91mAU5ZrxUfY32DcA6FNFKVIvLjT+B+ljFhnKrIznLNCrD?=
 =?us-ascii?Q?5nutsnWZBaNMC7uc3zQxWtQlqWIJYlyrNCW6uewFmqnQNCJ9m0jm4i2fqjGn?=
 =?us-ascii?Q?oXEcT/1RxkwCAA6i/fOf1Vx5aMX++5M8D6sPxdKBRR0OoQheSmqzZQa37qTI?=
 =?us-ascii?Q?ah+uhHs4vVQox5cxt1jVll9IaX/Ux9HUjC+9pYu1zj0e0u1obHDXrOZ9/AG0?=
 =?us-ascii?Q?jiDx2NBduDWkREDxcZPd2ElSm1rlG/a9jukobf2uM+re6yT6bFdU9lnGh3wV?=
 =?us-ascii?Q?yc/fTvrCYTNSCFXu9otlRb+KWnCB+kb0S2zQX3aJN7N7L7369d0qQ8BP+26E?=
 =?us-ascii?Q?TN7WYD8T4BIQYyKYNYMnOnKmJEoYE/y204gdYCANEZ6UDy+8FRMKFb7MPEUj?=
 =?us-ascii?Q?F78G/ApHStEycI7iKAP0/MyrXwjsYPhhuHOLyuQAgjZiYP+dKyP0ZZ2QiyWm?=
 =?us-ascii?Q?1GqFPW0hxkbpDpOW5kOYdMYvt5hlsd3E76gBuGIvhsvCW44L1A328a/WpYQB?=
 =?us-ascii?Q?/0QY2Frctp2Y2+UDlgraAAwA+KJ5LS6SgSmvmyf2aN5zwJOUysxCUTgyllwv?=
 =?us-ascii?Q?W9q98xisU7Eu5vgKQlFfJxdntSb69jcGInu38VEH+TriiwBZIr8XO0s/2UDf?=
 =?us-ascii?Q?3yWU+lS9a4c3tPvn2ytV2SuoK5FdTbuRJP4Yz5uxDv/FvPT+IuW1OKXDHTqm?=
 =?us-ascii?Q?GmTH9aKRXih4m03QXAIQSDsiksHpjSFiMRPZZ6RJSCOcaDOrfzu4kH0ulupE?=
 =?us-ascii?Q?0Lcv/VnqME5fBK8eCU5Z9O2FL7F+pn8pnA//jX8Y12Lqe5riItguH/R7TwEp?=
 =?us-ascii?Q?uWBVH3NWTq6+bUMsOjZ04IYRTC6P37AGaI5lZ3dan2iPoLjaZ0FMCzRe8RAr?=
 =?us-ascii?Q?3PL2/0rX65H4WvlQau1byVJEVLhrL+oWb+LZ68abkxkyLZBAgJP+nHXxD7y2?=
 =?us-ascii?Q?dr3HaVyujmJs+seI+Mye03aDw8lRJerKrSmE/q7TefxOcXpcsXKmh5dfpAjZ?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82580bc2-7fc9-4909-9c45-08dc65b07527
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 05:19:33.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrYMggmtnD7vmvuTpWF7HK3fmLQbhHUnLGAaLvJUk1M2iA0K83JgflYPB469/0hvzqkYKzWWh/Lru0tzKg3amA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
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

On Thu, Apr 25, 2024 at 11:24:07AM -0700, Lucas De Marchi wrote:
> Forcewake used to be needed in xe_gt_init_early() since it was calling
> xe_gt_topology_init(). That call was dropped in commit 4c47049d93b7
> ("drm/xe/guc: Fix missing topology init"), but the forcewake calls were
> left behind. Remove them.
> 
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 00a22cf2f5b5..805fd0acfc03 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -318,14 +318,6 @@ int xe_gt_init_early(struct xe_gt *gt)
>  			return err;
>  	}
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> -
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> -
>  	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>  
>  	err = xe_wa_init(gt);
> -- 
> 2.43.0
> 
