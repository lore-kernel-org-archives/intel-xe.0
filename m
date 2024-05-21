Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9F9C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 20:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8BA10E1C5;
	Tue, 21 May 2024 20:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijkqE6cO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE03010E1C5
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 20:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716322029; x=1747858029;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bf+g74KbqAz348kdHZEOk21DFcczG2TbmA39MAA5nGQ=;
 b=ijkqE6cO9QNRgDE3XsAx0VIOiI8PKl8IBuEGaugDgzgZUu0CI43k6k66
 2UQ3y9faOsQN/U8PJsAS1IlRY/xRAT7YuqSvL5I+o5TgpZaTZKn/KhuGK
 fRNPIRYa8/ChUMlEN6gvp2QH58YL0wIV+YZ4zNWNSErQgdLl2BtPakgOb
 42Dd0EyDy7Y0sQocTP02CBrF2ivb3wDKJMOBp4/DgMk2DltzCBWMYZ5lE
 lX/iXsAwBcOX3sztLd4E2WgwCYBrWDOxohTzIJtE2jESQYeJ7/g/SHOY0
 ey8s5uO9gzY/a1wp2JT6l5ZqFJbbTnv1B5uXSdj9XBYXJFwX41n4YpKtu Q==;
X-CSE-ConnectionGUID: XrGkM3DjQmuEnoQ4DVKYew==
X-CSE-MsgGUID: Fyk/v1l6Qi66LwM/rnHINw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16370924"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="16370924"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 13:07:08 -0700
X-CSE-ConnectionGUID: T06Zp4lsQzis3be6x9NFzQ==
X-CSE-MsgGUID: mJpM26s8RnuhLrfU4KPMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33644306"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 13:07:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 13:07:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 13:07:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 13:07:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 13:07:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE2NiT1o6gRH2OxywrsueWTyubjbiOO+kRDrc45HaCCrnpHfWVrtpEEaN8SBFJFTn2EfXDHw/TVLJCyshw40ietO4c5QLKdy5GID8AKaAEErSncpIALbLtsIf9sTOULWZjPb55QkZXr7n9l3+XDhyAIqWjaVxRbKYGjFXT3b4VwiZsMjLxbgQPYpC4SuJmqkDGf7BZuoOZXyAbeJVwN2dGwYzKSMwRes6rIm9XfJKjKleUANb88PiLi/iVu2qy41RYSVM6HRyqMgE/LIJLIRnv8rdiiQl1r/YVGc1Rt8ioqj5/8YEN90L9vO3gw+U4yyagPLSZB9tteAciOUdF7c9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8TmZ4xFXa+Mb1IWzoe4FYd1BclvGx0jZjRfa4RHqJk=;
 b=loTbWFKb9nBf+B5/mFSMWDaj7QttEl/jmrk+di6MCs0jdOh5NAljt8QTITbk/yxHo4lgezBqGHOD1X3jZtL/8Xd19mIuEhC1RMGubNTmNSnHmFAy8kbW0UHP9iPQtyzmWgi4fRC0gA/5xUEGSy7mG2jzBH0JmM+1vh0ZCs4CaASi4QudW0PwdZdxYPIbVMrM32GXZT5C6StAOJ4R48C7isszQ16M68G9Vm8RuE+UJU6bvCmO8kn5XgLa3fqNh/QPRIICIr2iXiMPY51buxx6gYr3aaPwdxs9JCa+X+EJRFNJtP9uB85kw9GeJiUUSV5A093TwATdK7LKbIg+YgDPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB8223.namprd11.prod.outlook.com (2603:10b6:208:450::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 20:07:05 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 20:07:05 +0000
Date: Tue, 21 May 2024 20:06:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Properly handle alloc_guc_id() failure
Message-ID: <Zkz+z7TUWeEqn9Ri@DUT025-TGLU.fm.intel.com>
References: <20240521193739.4298-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521193739.4298-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cfeadf-c77d-4920-265c-08dc79d19643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ovYuQh8Otql/ATlCZHK05uF6DjS8iBHYSAwcDvIlEeIBfmPdLSBMcSuMbZsq?=
 =?us-ascii?Q?tayQINEq8K1tNwDNPfsGDNDAkEBAngF5nYUamnVz0U/s0xOWS9UKGLAHhzrt?=
 =?us-ascii?Q?/FeciLbl45ozm+aSTD1lxmLKOi+Y0btmoCguvCmJiQ/X4lLYFbex4iAQxRlm?=
 =?us-ascii?Q?U356lV67XvjZqPsCgBn83lnEkMcoiWkk0Q6DZe/4igUDocRlWbG4vxCQEk1L?=
 =?us-ascii?Q?XVvcyA6QR2z4LzLbQ14QWSgMUSzSCIyylFdiDo8FAuetFw+4KjZCnXwSfHJv?=
 =?us-ascii?Q?YcPI0HOLoaBygprn6XBkA5Xonkl4HJjZEpeDU8kp5EYzKgoDkqiubDgJMuaL?=
 =?us-ascii?Q?qNam9tu69YlAmM6LP2wkPaobvRAIL0Tr9y+do/3PR2alyhIBSUDit4HDGs/t?=
 =?us-ascii?Q?uwN8HXjpN3+9VDE/+0sHksTrcED2Z3KexrEzg43Y5GzAUYSIH8ef+ILQjzc8?=
 =?us-ascii?Q?0ufC6rfSZlIoGlew9uYZxHEf5fcP1W/PZorqkQs5w1aIE+7SxIRFbmlyS3zY?=
 =?us-ascii?Q?JvLBZmIL8F3nNPTuo8k0xAgP8hUdctK91LaE416hXKbNjSoM4DvQPUTcJIXv?=
 =?us-ascii?Q?w6FWqo+r1LtU9RVitU0DIfKakRamnTniW4ijQRULl+YWccn71hpdkEp9ST75?=
 =?us-ascii?Q?GoKzmKjMU6dUNMrIvfjzAOcNr+MH60C03Rm5e90eHcrI6KG5hh0es/8DoH6/?=
 =?us-ascii?Q?NOuPPJ0v/64h4qmdfRfWiLcD2tQw0E/GpaTCXjs6Tov7/m/Vmu06Ov7AE4XV?=
 =?us-ascii?Q?g3vqQrY3fa3+F+g567jgYprjG+5J46Hunc/XP+t5oog7+31govOSREctcGTI?=
 =?us-ascii?Q?oog5H7mK+R3LuJ5bZYHHSs2fKjGRUYUs+HMB6m4oBLDApt+lcaDSNGEP4aUR?=
 =?us-ascii?Q?VawpIfSCoxydSTuFs1te9DDN0AY+d6wscLxanyhO4pCEMhjR4XtEPq7v9L0D?=
 =?us-ascii?Q?/5v8ukeiZ1pgLBWkkMrUbLfYF7/SkGUsHB8+/f1K5ZPAb5JHmTJ1D364APCJ?=
 =?us-ascii?Q?8nz8VCZ/DUXiP6EDWG7OP3H6/1uw3njmOIzzWBYzv6s4q7+MVg3hn/8VrSAG?=
 =?us-ascii?Q?LM5dmr/ikVTeWoy3L92x3zRxTEhSnV9ILX26vHJP8aPJw6vCkyTEb3kXo5vN?=
 =?us-ascii?Q?gNyJOJK9r+hU/lknsrVJ8VQ0tGXnXzvpum6Syxy5mfH878XSZCQMd6Xd+RcD?=
 =?us-ascii?Q?HF1f7eIP7Om/fN+Vx8v3lk/xGg/NqvxGYUrvvC4pcIzLHk/lAcu1paoGyQlP?=
 =?us-ascii?Q?HDhvr0j1N1trl5aCrDGJW8xtxTwTPwC9nfM8n5T12w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eBaq8I3hEtf5bOuPi60+aOvXtVuy67AqBMA5lM4SXWNiI7WS0OP4J6nkQChT?=
 =?us-ascii?Q?dsPjJ7xcOjh8qnMta1o/tgBQ92EbRRvMVeqX+rUCpd6jvq+QGAAl2fe0kK1M?=
 =?us-ascii?Q?T12IuhURNNcxFwQdY2YaUj6bdYTU+3AjpE6MC32uqxNAks4pw5KetdgoPyHF?=
 =?us-ascii?Q?4Vfy7+OUF7lESRwGYfrx/HrROkk34t0oqCDbiqdxjPHJQ5sLdqHUNgXw4wJX?=
 =?us-ascii?Q?9vAwU7SZb0CPODpzy5DsQ087PAl9A0XLb3p8CPTHuSH/gelbKJz9UuIAfFSo?=
 =?us-ascii?Q?5B+pRHshYfIHV2qBfRdWlkyS1xxOEUa3qPpUOvi9bs4VNIARuc6Vard77Cv1?=
 =?us-ascii?Q?OfFkc5HibKYWi01alnwkp5dpPrw2McYSlzHqhcdwgjw4QzuynSkWUQmTvdAQ?=
 =?us-ascii?Q?vOIVutpxi6TfK+zWbr9kDdVmeTs0u2IzGlvWyc1EOQh4+oZkxfURi2mR8sPZ?=
 =?us-ascii?Q?gSAvfz7cQtGM5uH7sgrOOmA4mckWN+jRpLGwrN+i1LIWlsXJPsPssCo1TYxp?=
 =?us-ascii?Q?CQs54/xSYrGLXWcfjp3av0JjayZtQCe7EUmmUY6xcc+0+wqKklR5nYMq0s9V?=
 =?us-ascii?Q?B6f9OsFlPef5Wj0oQZMDKKXaCbh6gj4DPcEnjrOq1kWebGELyQ7dJzK6U+aW?=
 =?us-ascii?Q?0bnwZZzqCXpfimi2qn3X+bbXmj2E27LDIdV7+9jPn2niud/BE4ag93D8Kpsk?=
 =?us-ascii?Q?YmRuFQh0M5I2TtVSrNjzPvvJYRbEEcHNVrLrvKSOzSYgzQ8ElKKP2bxvGs/z?=
 =?us-ascii?Q?MJSA4N9NTPFfpSXJtgVeYhCaGQ5XUcbLXd6wtfQlSZIeENuGBTWuSOzhnODx?=
 =?us-ascii?Q?SGY7/Lv0g8oNeyNKzk/C1a6JT91JDkaOLpndcgOZTrhs24I5m7F+G/KZKs1a?=
 =?us-ascii?Q?gl8KUGpDFKd/t4uT8IbNU8AF5/a9xci+Okcqaf0I4MZTDSF6m7/VCzRw+lVA?=
 =?us-ascii?Q?RAg7z9qZQewUfhZXQDx6bZRU1y9gPQxnrg3xZGZOlBtv9+HXKN2/L0VG9JZx?=
 =?us-ascii?Q?tuPBwF2Dk30xj0T9/kKN4maABlTtp7qjoZMT5uSQvyr/CVgvI+CHLXJlUHpa?=
 =?us-ascii?Q?uFmEkOO3gxiJg6yixls2V7qYYDIM+X6jmZkNygYD1Mr1WjQrJ3eTD3Kx4Yqt?=
 =?us-ascii?Q?m5YxwH5Vccg4m4X70VHfTz65yKAwwsrLXfUGmkC+X2Dko7BXuvVkqHvrVVMl?=
 =?us-ascii?Q?wgQ1iy/F4v51CS8TX7PXXBUZlSe4F9nfW+l/ntcdMNwosiMmy59cpzdjjVek?=
 =?us-ascii?Q?JlOdSMc9ihrU1m7n8kAYtH2ohu/en+acb1XvlO1rDUp1CQ1OTjkqB2Hzf3EL?=
 =?us-ascii?Q?mG8kNY4g7OcfkIEZEyoieBFKNbbmLwXGEXX0o//SbwdU7DPkc/2w+WL83s+6?=
 =?us-ascii?Q?KOqvyQTRxOwbknwKQr4WT/1uQ2U3TgS/ncM3CawMVdrkY2TYgPr+egvmBf6m?=
 =?us-ascii?Q?oZnyI74PE62GabvrPidP2KcRjy68puitg3sOGnYJf7Qqphk60RU3OoQY2Son?=
 =?us-ascii?Q?dY7V8wb+qPNRdUGDtf9CMZI6LwJ2Jcs3+VfQh0Qv4tv0vmrZYmPb0dvVeP+q?=
 =?us-ascii?Q?SNs9FG2M2uXCg5vqTTgmwnwHTrEMG3S6m9wrK0TJ+UySKLOlqc+xAAdTdza+?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cfeadf-c77d-4920-265c-08dc79d19643
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 20:07:05.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8puCj/7Zv4wtaKT9Y1+brsNlDB7pc42ZNRP7v5/BiYTXT9RObBxnfqgKZpfexatMfU+iX3V6nVk3HqjSr/eLNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8223
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

On Tue, May 21, 2024 at 12:37:39PM -0700, Niranjana Vishwanathapura wrote:
> Release the submission_state lock if alloc_guc_id() fails.
> 

Fixes tag and CC stable kernel?

With new tags:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ad2b8067d071..c0b901c5565b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1304,6 +1304,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	return 0;
>  
>  err_entity:
> +	mutex_unlock(&guc->submission_state.lock);
>  	xe_sched_entity_fini(&ge->entity);
>  err_sched:
>  	xe_sched_fini(&ge->sched);
> -- 
> 2.43.0
> 
