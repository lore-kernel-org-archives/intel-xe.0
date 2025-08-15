Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D803CA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 21:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0468710E9AE;
	Fri, 15 Aug 2025 21:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQc2Tk1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAE010E99D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 21:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755292114; x=1786828114;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ASXwpeNi8PjE4L9eb2c0DEo8oK8xkvS42w4SE78c4dU=;
 b=CQc2Tk1ZmsT8zMLQ86vWhJYK7ObyTTvcBPFgK/I5xmrixxTa4R99UwjA
 U/IxKwr50aWl9HfA/3/Lnl++Np4w+RNsosHxQMRsleW1gkoxgmxqBywqY
 OAR1TOjMwl22xsnmN4nKQSdlUqHZ++hh1zc2PCARNaOpxMgR2pRzFJNGw
 Qax1ja/kAIc6X6mIdkIlhVhdUp2Jokb3f3pntwsjBsctj7TSPcTMJhWJo
 vqB7/J2xCjx8Ipgiq7dP5rABdxdCK/fk2+VKenSKxFSH69t5z1FU2QDuS
 5dZcuTcug6SJtYjWuM8WbkEFOHJ7NiTHJBYiN3Wx6xN966MAVaKaBs0+y Q==;
X-CSE-ConnectionGUID: N6/z5YMATAmLz34SwWEoIw==
X-CSE-MsgGUID: dIpaDZ/LRNy/xWzrQWuWCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57764622"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57764622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:08:34 -0700
X-CSE-ConnectionGUID: CgTID1L4RgKINMK6rDCokw==
X-CSE-MsgGUID: DhjA9t8LQ1mn2PaYkx0fQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171539284"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:08:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:08:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:08:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:08:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ur91+6WAM+KyWEj4LXjW+g5FTQd62bj7NXra5vdMvQEiB4sLF70QkMRRphaGwnt85rpu03PR+gEqN3zdtA3RlO94V6lRNMiQWP/GEaYB4/+NMdLeb62OjTMAJBXXcJtLNA0qNsV3p3alOKwaZ3rRHIEolKqmOObKpsGrePA3zQKq3r8gawGDKEzCTMoO4oMMeVONMYbWZqYpywz8vrbX8YxLHJtKtYh/lrC79opeeqYzHQ7UmFtqtG3XzPqQWJytkZ1PbjtiOTrMR3TLa/TjXPzZkuEAMM14OfLo5vuGRaDeYvtXgwhA/R5+cMXYK3PZGM4pke8nFzIHRF99QgNI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cViFSuYr19CYVbubwIMUv2K1kJb3OYzaR3zga4q94Z4=;
 b=utdC7wcf6Jb7vRLNsiEeiwTnPh85Y6mmX5xsKwosYfTEa+zcN1D3Z4w4siT85mrL3MlBopl1d6mBt05r0Ucx5J39xIbg0MvOjM7JnAQY3XVH1P3sWl5bg40jJ8JuCfnROyICiYacZcxkHvpKktd/2l7C+O226B7pjjnCrhOrvbHqmJABzeMAqYb65s7xwIMYluUb2+2I73q/1itXiCUHCoKYpisT034ydaya2weiTnCWJnaWixKt4f26o7WVgI6d3XEK+y++6j+i5YwMTutNXlld9VZK3ifs5Zi3zS7rL6N2Pc35JU3HhffiKgZmccmahF9cpgzWRquWQosjtSg1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Fri, 15 Aug
 2025 21:08:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 21:08:31 +0000
Date: Fri, 15 Aug 2025 14:08:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Message-ID: <aJ+hzc0Jc//MGBf/@lstrano-desk.jf.intel.com>
References: <20250812182846.1608209-1-fei.yang@intel.com>
 <20250812182846.1608209-2-fei.yang@intel.com>
 <aJufANNMVyeB0HMG@lstrano-desk.jf.intel.com>
 <BL3PR11MB63624BF7AAB3546C1A1920DC9A34A@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL3PR11MB63624BF7AAB3546C1A1920DC9A34A@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:303:b5::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: a1245a6b-930d-488c-b270-08dddc3fe387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2NLQUXC5BltejlANSHSyqQqRQaau5lsZuJHXbjVrNYhoHEKMjCIW/2bSH7+0?=
 =?us-ascii?Q?LsTYVBGGfqe2O15w4vL90iUMHY3ULILZ/BkWZxX7ukhdVFGYiL/TmFW3Z8vt?=
 =?us-ascii?Q?oPUAoP5cTugSU376IlIYuIJI6/m+hSY7tI4g/q+wn01OK8sXQCc2XHff8K76?=
 =?us-ascii?Q?izJ6G4e3156H5GMwhdjF+kqvcqMxmDLjsgTfNiLRCcchNCEF/+aiLxTsexKa?=
 =?us-ascii?Q?A6RPXn79V3K2UPmwcVi/KCLBol9byiJj1Oh0fV5cf8cY0a0eya+ucMjLrfxR?=
 =?us-ascii?Q?UffvKSW/iBvNj1Gfn7T+qLBdSdHvCERn82MPVD6BCY1G0TNnzJAX78Og79EG?=
 =?us-ascii?Q?lBFM2P3YsJyIr3Ii8QfgqJDqTKewS8CRkTrGRvlWyKP+H3Hf1rqVZm6iynw5?=
 =?us-ascii?Q?MympmBeP9BaQSL1Lf+ZQ5S8k5bWgbwUwfAQTJ3O+6v6cIh7jQh0OB8kP52AP?=
 =?us-ascii?Q?P28yaU0LPxZvD+WuVeuQpIVWCRbjCZ+12oxDNPjDJw3+zsy+mOY9YKFd37R0?=
 =?us-ascii?Q?iO/LOZnWMbfZtzTSYNJc/tOgcUEDEjqGai2KWMmeR4Zf2lOA0jO71eeG3/xL?=
 =?us-ascii?Q?6ngU/vrlROH9Ana7FKANh//oVfLgtO1gXsAdnVfaTm7pwh0Jt/wLCG/Kqpt+?=
 =?us-ascii?Q?r2Y8HUMSWtzcVhb86jVUna5ICIIMIZ1jGCN1BYG2boXkPx/hSFY8mrnYpmVr?=
 =?us-ascii?Q?nrLdc0nG2MqhXcoljc472wnMwdxDsOuAwkg06faT5kThu6XRKz3XTbzfEbZu?=
 =?us-ascii?Q?6C5YuOv74y+DyH11oHq/1erdu40WMpBf4o4mTwlsC4Rp8wMCjvBxaXp+YYYz?=
 =?us-ascii?Q?5rpi9lHrpdnPqRHCWt/Q45zC0ICvC5+whTaeSnVJ/ET0h58QoE4/70v0kuU3?=
 =?us-ascii?Q?IqpXNZImU1je/K1GWHGPF/hn8CAP2D7GFe+4vAywqZe8GBwjkxnIla4Mo+xT?=
 =?us-ascii?Q?5jT5o9sLlsxrEoAYclXooyGAUpmmk6ySHsq6z+eVMjZj2+93cWoHE4lyebhY?=
 =?us-ascii?Q?4fwA5FVWppSvQilUstDU5zOBcvv2EIzJT4yt3HjdQFO446Ysyjbalj+UPjTQ?=
 =?us-ascii?Q?qfi40P/LXTZq2WT57UnRyA5Qk0aKqKvO314gZ5VC5eClowJZqfl4huAh6wFu?=
 =?us-ascii?Q?pRAGuLrUkZc1F8RzE77RzzKet1RqC5kYiVqGcy8brN4NW2AGsn4HjDuz413u?=
 =?us-ascii?Q?kWq0FF5LtK7jZ+XBzH5qM7gzwZZt1mmGhmvo0nj66jMqbgUc6dGvcF/6uqOI?=
 =?us-ascii?Q?Js4baD3LFWrX7ny1neaNG0AWtfyZxiapbruava+vGe4LWkamSeE+P4ukD06b?=
 =?us-ascii?Q?/7L7GJOcK6PS0NvMCWlstJngV9JqEzhzH1OJh+17clZqlT6HSZmlaLDC/dwN?=
 =?us-ascii?Q?LT8E8DKjHk6PPdvg7+XzsE9RJOiHm2bFEHxzUyCHLdxjd0CT9dUOLnb2It9y?=
 =?us-ascii?Q?2O6yaZhKIpU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x9WSim/NXar11OPHT/vxeFy2LZdyRBXRNRLU/ypwZi5o3SE3zzOBSLlqD2t1?=
 =?us-ascii?Q?DzpyAIc5L76TQOVPfzT0vDDyv5sqaNuFq4S6Wbvtru2e1kMi13t1UjNvnge4?=
 =?us-ascii?Q?AiVPXsb99dRrTSY9n55a1ONQ4tmv/LkaqwiJxaQubvgbSLMibu9CIWanK2Ke?=
 =?us-ascii?Q?1lP+6PjPdujmJTIHfCIo9GHuRplUugIaGU1fnpvxCxVyC02M1pzQgneiUCUg?=
 =?us-ascii?Q?efLYdm1d8MFJOk3wFAHEF9X6vRDKv8+b9dZe6iJmV61L7IfZKRzNkc+/7Ccz?=
 =?us-ascii?Q?hWSqNxn6MTIvuFfI+oi++FBrHKO6/7qLh/wZUrL27F1mxGSMZG4QiwUM3rk9?=
 =?us-ascii?Q?a0a/ROtFtXvXC8+hAsCrGWtNEglODrMyIX8aEA2ab75yFeh3SWN71v20HjUC?=
 =?us-ascii?Q?nS40Tae2gaeuGCFsk6/yudL6t2YTR2jlbfTcD68BjqPkMqH+4xG9RoNcstXg?=
 =?us-ascii?Q?lKChtK0a15L2M+OII7cryQUE7yHnF21PUMmMio/3YSu3K6k+adz3NI7MAQ0F?=
 =?us-ascii?Q?Zh90fJ+JPNpiVv29wf3krv4y7uDuF1CL10ByMEr7OMaDyIPWVo8NYzeznt75?=
 =?us-ascii?Q?3+DpQGXsq3eobY3wqmEDMcodxzawhxR70jvZIVaJMwBMcqrapAWJ8G+je7iO?=
 =?us-ascii?Q?ZIysoTWQ7TN5BnrncKz0rR5Wazoo29gdfRjsbx9IJRpjR3zUV1aL1K+EZmb4?=
 =?us-ascii?Q?m3Zg0/jgvvqu6cRaHeczBSoq48nUBwIaUolNG+zjfgoztMeOvw6oARjlAmBr?=
 =?us-ascii?Q?d7s1lZ8FXiLIixFzu8w7cL/tnyndEfMt4dcnY+AxzLFpEPmIYWZi06YRmWp5?=
 =?us-ascii?Q?eQbd7Oi+XS3jWUM0NF2zm05SxF9RXtjo0SEnn/Ww0tlK2WZVTxj7DFfdD+iB?=
 =?us-ascii?Q?HqCbzlhEt9ajr1tPMTNLcNb+nNubmsrgiPE8ghKL6VKYAusT5wo7YVrTfHPt?=
 =?us-ascii?Q?7KPs/WBj8Cl+3exsO7c2ICtsDIelcfVD7bOHSfc0TN26iI6AhmUYVigA7UQ8?=
 =?us-ascii?Q?0/LSoekXtOSYHMek5AJgg5cDR/q2nU54StQZgMwjcP8EAL7QJDpHruvx2I+e?=
 =?us-ascii?Q?xZN4sxk1i9jQlaaHJgjjE9vuCjp5Gp34jFwTX6KhfVgK0yxZmBrYTXuSJqTI?=
 =?us-ascii?Q?laEjqYCwf00or4b8BtK9t7MP7Sxka3qRMIchplYevrSJVTJ6IiEiaM1/ezsx?=
 =?us-ascii?Q?DRQ3LbY1bIBvvbmthV3cNqbEeiHOA/PhyEp3fOhpFJhs6/Vxu2LUQAvHmo1T?=
 =?us-ascii?Q?mJbuQlRBzndpjjWEg2VN6UtsYnF6VQR3rk/k2gCLjJKAR9mF4fTIRkf5l5CE?=
 =?us-ascii?Q?Jle4aG4ufovoEpNKoeblHUoX1zLCWxICYVffDj1B/8tjeqPvZlc304gP4sjZ?=
 =?us-ascii?Q?CD+/n2tScJKXk/nn+6q1cM8KgdxMaQ4ZSCbqjqmzR29gBT+5gZ7fhSvDdQ7N?=
 =?us-ascii?Q?rpjb6O9BWJqmXU6BwVdmlf1nxDFAFbJ8O7Z1qY6k7ljcUQKuZ+tNvp/3s2EH?=
 =?us-ascii?Q?WwFK/powBK8dkxMD/6XzFB+CTtEKFQEW90wHyRdkBTkHpfHJ1ElsHn1BKalg?=
 =?us-ascii?Q?r+WPD8xy4crqhTQXnMLiZBdO2FQXR5z8fD4Iv+cbg4IMZ/xp140QIlYCBj1o?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1245a6b-930d-488c-b270-08dddc3fe387
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:08:31.6331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDrqsM1xFvCQNF55fMg5/8AHZdry6deHGQAOfGMcYSA1PzXMB2t6ePGrH0B3uIz455Ocsf3skJBON2F4nZS0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
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

On Fri, Aug 15, 2025 at 03:03:33PM -0600, Yang, Fei wrote:
> > On Tue, Aug 12, 2025 at 11:28:46AM -0700, fei.yang@intel.com wrote:
> >> From: Fei Yang <fei.yang@intel.com>
> >>
> >> Quote BSpec, MI_STORE_DATA_IMM "simply initiates the write operation
> >> with command execution proceeding normally. Although the write
> >> operation is guaranteed to complete eventually, there is no mechanism
> >> to synchronize command execution with the completion (or even
> >> initiation) of these operations."
> >
> > Can we not just use update emit_store_imm_ppgtt_posted to use MI_FLUSH_IMM +
> > a PPGTT address? I think we can get rid of prior flush added in 3ad7d18c5dad7?
> >
> > According to bspec 45725 for MI_FLUSH_IMM:
> >
> > 'Usage note: After this command is completed with a Store DWord enabled, CPU
> > access to graphics memory willbe coherent (assuming the Render Cache flush is
> > not inhibited).'
> 
> We already have a MI_FLUSH_DW in between the MI_STORE_DATA_IMM and
> MI_USER_INTERRUPT (See __emit_job_gen12_simple), but the issue was
> still reporduced.
> 

That is not what I'm suggesting. I'm suggesting convert
emit_store_imm_ppgtt_posted to use a MI_FLUSH_DW intruction rather than
MI_STORE_DATA_IMM.

Matt

> static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 flags, u32 *dw, int i)
> {
>         dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
>                   flags;
>         dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
>         dw[i++] = 0;
>         dw[i++] = value;
> 
>         return i;
> }
> 
> > Matt
> >
> >> The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT
> >> consecutively to implement user fence. However, according to the
> >> BSpec, the data write operation is not guaranteed to be completed when
> >> triggering the interrupt, that would cause the
> >> xe_wait_user_fence_ioctl to wait until the full user specified timeout
> >> is reached before checking the fence value again. Great performance
> >> degradation has been observed in IGT xe_exec_fault_mode test cases due
> >> to this unnecessary wait. The worst case is that if user set the
> >> timeout to MAX_INT32, the wait could end up being a hang until some other random program triggers a user interrupt to wake it up.
> >> A semaphore wait is added right after the data write to avoid the
> >> unexpected wait.
> >>
> >> Signed-off-by: Fei Yang <fei.yang@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 11 +++++++++++
> >>  drivers/gpu/drm/xe/xe_ring_ops.c                 | 14 ++++++++++++++
> >>  2 files changed, 25 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >> b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >> index c47b290e0e9f..1c9e7b35c665 100644
> >> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> >> @@ -34,6 +34,17 @@
> >>  #define MI_FORCE_WAKEUP                     __MI_INSTR(0x1D)
> >>  #define MI_MATH(n)                  (__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
> >>
> >> +#define MI_SEMAPHORE_WAIT           (__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
> >> +#define   MI_SEMAPHORE_REGISTER_POLL        REG_BIT(16)
> >> +#define   MI_SEMAPHORE_POLL         REG_BIT(15)
> >> +#define   MI_SEMAPHORE_COMP_OP              GENMASK(14, 12)
> >> +#define   MI_SEMAPHORE_SAD_GT_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 0)
> >> +#define   MI_SEMAPHORE_SAD_GTE_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 1)
> >> +#define   MI_SEMAPHORE_SAD_LT_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 2)
> >> +#define   MI_SEMAPHORE_SAD_LTE_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 3)
> >> +#define   MI_SEMAPHORE_SAD_EQ_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 4)
> >> +#define   MI_SEMAPHORE_SAD_NEQ_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_OP, 5)
> >> +
> >>  #define MI_STORE_DATA_IMM           __MI_INSTR(0x20)
> >>  #define   MI_SDI_GGTT                       REG_BIT(22)
> >>  #define   MI_SDI_LEN_DW                     GENMASK(9, 0)
> >> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> >> b/drivers/gpu/drm/xe/xe_ring_ops.c
> >> index 5f15360d14bf..189e764e3914 100644
> >> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> >> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> >> @@ -169,6 +169,20 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> >>      dw[i++] = upper_32_bits(addr);
> >>      dw[i++] = lower_32_bits(value);
> >>      dw[i++] = upper_32_bits(value);
> >> +    dw[i++] = MI_SEMAPHORE_WAIT |
> >> +              MI_SEMAPHORE_POLL |
> >> +              MI_SEMAPHORE_SAD_EQ_SDD;
> >> +    dw[i++] = lower_32_bits(value);
> >> +    dw[i++] = lower_32_bits(addr);
> >> +    dw[i++] = upper_32_bits(addr);
> >> +    dw[i++] = 0;
> >> +    dw[i++] = MI_SEMAPHORE_WAIT |
> >> +              MI_SEMAPHORE_POLL |
> >> +              MI_SEMAPHORE_SAD_EQ_SDD;
> >> +    dw[i++] = upper_32_bits(value);
> >> +    dw[i++] = lower_32_bits(addr + 4);
> >> +    dw[i++] = upper_32_bits(addr);
> >> +    dw[i++] = 0;
> >>
> >>      return i;
> >>  }
> >> --
> >> 2.43.0
> >>
