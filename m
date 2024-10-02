Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFECACEB2E0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 17:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA42710E771;
	Wed,  2 Oct 2024 17:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7l1BVCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8B010E771
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727890987; x=1759426987;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n0I/mNYPHaRqA4LQ1VmAEWkU+YCZkL9lbCh7kbClNrE=;
 b=Y7l1BVCAFW5okCEb/mCXcNEvTxE+qqcE8A9k4f2ZNbbbPeTbnJkolZko
 Cys7Kyn2A+Hs5O4vNWScdSeiV/Gi5Z5cU4cRMmn3VMdbdX7epXzn/N+mh
 PN7fbALX1MmVLx2UzZ8NIRS+sE38V9wFDdKO0s2zSZFWmO4P7PRYHoaZV
 cnmlTavGp3C/DqO1uB2hTccWcxM69B+CKCL4FPfVitcq7EIE+7nGBcVhY
 1WTOzokxU/0a6AzXwqFLSykGvH8nwnbS+90vj/j6JLqYHEwcw7e70SNqX
 QgXeTKxTcczX0/uxVztQOSu9NLQZLDv2C4S7y1g+ohjadD3EeVgw7EdOl A==;
X-CSE-ConnectionGUID: gpUaWlU3TGy4EgpQc1X+jg==
X-CSE-MsgGUID: erzdOq4BSuGAJIrh3dlhxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27195938"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="27195938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 10:43:07 -0700
X-CSE-ConnectionGUID: gnRp3dZHQue+IGoC6+GFPQ==
X-CSE-MsgGUID: qX398+8FTtmIz/jgtreGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="73657587"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 10:43:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 10:43:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 10:43:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 10:43:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 10:43:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InR6UhMT81g4VjawK065V92MRs5DVjXowSHB+MSny0SrFOYJExWu/ABX11OPaMA/1yYsvOw2XfwsQZ6whl1hiTTFFQlZUJznrENVOpLJc54H5Z6l8jIPXoU/MqyMRmZSHwc0bTmRhYJN38kFR49f/yLga1IUNTfgsViIjH8h1ocAP5nv/0Cj33yvxeGQZ9tAGgr3ygIzLGm6ecMibP9EtTBfatYudLTC4/yyRb/DrekVjPfuOUjqHiHW94Q5gQ6+lfLB0jx3sZta1JQZCTl+TNJ9u59X8omqCASyn32erdNxzSrpXKNDQXhTeyc8/87gBg7k76J6Q4+MwSqajKnkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpjIAI8AtkjEroDihGG4laQNq6YQN5MK9bA1Hy8nlR8=;
 b=vuPmC7DFg+rk6b0CY8P14htHOOCkyC+y6dmojGluaNbl04rbqhgKY4AefvB32TGtaW/c41dxPVEXrIOwcuk1n2PA0SjvP237PMISkT+gpInm8hgZHTX8R7pMwqDwbAfMZMpDGRf508SD/Le4mbP8LTDVYeFTy9Xd2K2V4IsgHAFpWnapCgiuGZKwhTSnL27adcPqrT2CIKlzfK8PjxR0d/J7IftNnz9bgKGq1zHdq5KL7YKF846GZlj7x1qzlNChEI7ssEW6403WjSh/f4G/DR4TOgE7Q6noyZF+lZ0sb2PnAFqlXanWM4DZ0h4JB5vStC85GExXFIRns1nQ7ySp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4710.namprd11.prod.outlook.com (2603:10b6:208:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 17:43:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 17:43:00 +0000
Date: Wed, 2 Oct 2024 12:42:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <apoorva.singh@intel.com>, <intel-xe@lists.freedesktop.org>,
 <oak.zeng@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
Message-ID: <xt7xysewqynwxbzdgmcnglebbrqpqq3wdqpwkuuitjanitj25t@56zkq7vi7sjp>
References: <20241001135432.447074-1-apoorva.singh@intel.com>
 <20241001135432.447074-3-apoorva.singh@intel.com>
 <juv7n3jsyv6hqcxbcnlxgeq5rlqayukriwrcbjq3lmonlhrnos@t5dpzwna5r27>
 <Zv1g0tKMaCZXMKs0@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zv1g0tKMaCZXMKs0@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0365.namprd04.prod.outlook.com
 (2603:10b6:303:81::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ca5f13-77bb-4039-2444-08dce309a85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RfJBr5rKWIizgKFvaflBJd8rDzL3lXqTAxqiwWCa0EiDLBviO526rx39wZeF?=
 =?us-ascii?Q?7G9LH+M1rQeBZDuNiY8P1lg/XBKPNLbuwkYrNyZmNKCuh7ToqAueyKIEzlGc?=
 =?us-ascii?Q?3S7QyLowACXaC8JRw47D8TppydDHtu6iBi1g9sHm2PZ0rFkFfEqzY82pxwVE?=
 =?us-ascii?Q?OLnbJILWF9Fmobp4oAmot0gSRxxViMsXNwWqAGkX1PojKEHHercgMxID+4Yv?=
 =?us-ascii?Q?Jql0JvkWv0QmrxdnLBLP1hEdjQAfyHRWfpRuYIJZH90xVjtFqAiEUw5wRKUr?=
 =?us-ascii?Q?kLnAzblxm18TIjm1y+clfp9hLL3qX4nXKCfhK5HmkpNhHAUlROrn7iwZryIU?=
 =?us-ascii?Q?NVNZFL5+aH1HDnisRajWwWbcZgGs8GDlR6AVKQMxfDcIuTfhUseY6NVVZ8xO?=
 =?us-ascii?Q?9EVIMhLWoPFsaU/pOJf/QxCx7GlAAj5wP28+jLrSXDDelBFDytNCa3dnCEVm?=
 =?us-ascii?Q?WwXI+HqMTSNFy71clgtWzIWWSF/txFC/utsVjU2+PAXP2bOGocqJtNEXxeJ0?=
 =?us-ascii?Q?beK+PFpckFOTGVL1J2E76lZt60DRn5jafEh8ox+otb0U1NJ2Z/1X5B4bheRp?=
 =?us-ascii?Q?UwFoIIZtWeiBkB2n50r8r8ckqIfFghqw0FjXmecBh9RcEcy1lBzYTXiNMnlG?=
 =?us-ascii?Q?avcGzOB0VlQlOaQ263kggsvFOXtCPA/1/6lbDIvg/ETq/ImDx1Y54vGaj4Xv?=
 =?us-ascii?Q?43vFA6Za2ceLLisMlgGLlvYp1LICIRJ2cTj8wiXibWjE7c1gLbzj6JzeEhzX?=
 =?us-ascii?Q?Yi/0wpYhTXTJR9sufdFmQ7qPzBfrTOXRiXU4cK0oM3HaAKkigoeAb2R13FQI?=
 =?us-ascii?Q?DfWboVYZOFFXadcjEdCELPHzBNlYWym8ovEiwNDEkCHswRTaOXGHdFHyQaKJ?=
 =?us-ascii?Q?K3M61Qwkor3tE7RrVUWzugXrbMLr5pm0bGWgY6agOXIiM3HK3vmEmX2Dmy+b?=
 =?us-ascii?Q?BOBIOkXic8IW+2q6YV4ilQOtXgi0LwVgGkjmJwPqSwUR9yF1WT+wDXuOhFsS?=
 =?us-ascii?Q?E56l+kmTkMXB9NisHmAjV++AxMxHQ4reuzUJh7m4gTjITL44q50BAmyy/7Ka?=
 =?us-ascii?Q?yMncLrkFtFUcIN3au6YyThMO/DZg3Mco/gWp9O29Ix6w60ZIfMCj1xtqDGIR?=
 =?us-ascii?Q?x6ldTRrD3fmQdI4DBqPInSK2hKUe9i7jxeJ7dowwN2b435FuLYKovL8ZAH9k?=
 =?us-ascii?Q?Edg27nhfoFFlxsJEeGKbQLwd0Uatsiw4o2u00bSbzoANeak1GACZ59UvZEkP?=
 =?us-ascii?Q?Hp5eABMWEuYlBxTeG5xffaweofVpzvi8YnBnCm9v1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?405ARwLlg1oLSdjSJFdHogaOESPh2bDR5UTNzxPVCTsC5M2NYEFUJWhSEXMt?=
 =?us-ascii?Q?JvZYOZW5z0iOY3XDJt5Z8Lc3wo/AYiWYpkuz8/A7mQT+xNCGLLRztJDuEVe1?=
 =?us-ascii?Q?XVy3CJkAXXjgAkqfiTE31X+HqTEtZV1aduaPOl5qLdUuLXrFFR/j5ykD5RM3?=
 =?us-ascii?Q?KY3AD/kHuMGyOEqgEBQyjy1OlSY5hQuQKyqH6hkYMvEnmyWCzAD1T9tSLa2X?=
 =?us-ascii?Q?jc+kw8Atdou5BgVe5tbEOQ49+3NYU1lSzDNgcEgJklcNA+Ej1VU7FfFSw+iM?=
 =?us-ascii?Q?hmnEzL1hlqbznRbvhoiylW01Wggf7CLAc0lt0Hmy18qxqMJl5RSyUIaor8nh?=
 =?us-ascii?Q?so/Xs84nEljcpfpUV63Bo3v1c1CL6ky0ESARRpsLgAV+O/wcDsou28fKjUwJ?=
 =?us-ascii?Q?edIEx5sH32dTmi520OaLeOU6h5E0se/Z6d46jRugMg91ChBScmCCUt0jJTmv?=
 =?us-ascii?Q?bAl3dIAH7V7vm5+CAt6roAHx2KGFq71bd2BriCxZJxmwuHE8Cgvepks8Dm1b?=
 =?us-ascii?Q?Vbb/JQ40kqN3sriZBmSZtwnWvKjp+TcXistYRei8LM4M1z85aIcRvzHpNHr5?=
 =?us-ascii?Q?WtZUd89UWnRm2EM2MdcatGazZdWl7gxj9KSG06Yp5XEdx4+zzFY08tXVuQA9?=
 =?us-ascii?Q?5wSV+mpl042vPfSvL//BUVtVO7T1p7FedcbtgWezm2YgXqTaT1BP1bfOqy/i?=
 =?us-ascii?Q?wmdp5Kop1Q0BbwZ4ZamTV3aBJu59wRs4wskNWU3itCh09tNEMeLcHbwk+kBq?=
 =?us-ascii?Q?awwICT6P9v/lF9ZcFzLViH6s8RJRJaqFTSEgN43cNxa/kVeRyN3SUXEgCN4Y?=
 =?us-ascii?Q?KtgbEWZsyMvAuqORyUAsCRnSBVeOt/lVaONCad2NTOdKMkcn19K9eekw5JhT?=
 =?us-ascii?Q?3PdPrx0MzWmWrHIIoEntFqdIDj3fes75dE1fxZitg8++C6xeFJcDGMML+cRX?=
 =?us-ascii?Q?KTfWFykk3FMdwBsA1l8GHk+oWHoce3IK++xDp7yc12WKq594+TE4wESRUoRX?=
 =?us-ascii?Q?NAaec0XcWf5xq+7zJnlc/OELC/4C676zmvMMTsOxEnY8bYt15z0FsCQFFn2i?=
 =?us-ascii?Q?+mAMazOS52j891aUE7UL9gQJWu3Q59j3pSzwWM2VqJhvoxr/Y1wW+mwok0E0?=
 =?us-ascii?Q?qbJbR/WsTc+K4xKzx0lSNoif1eUQAiTEmMlxxvICi8uhXVww9XsgEaJJgz3f?=
 =?us-ascii?Q?KJhKHnUYUSMZSt60/48oCMjqu0RfFOIl0b065WvJiWC6t3mB8pidLdfkbLP3?=
 =?us-ascii?Q?4MjI2VfOST/4Q9VsepEp4O9eSJM26a1clioWLBGlYuHKC3iav5flTIo5XflJ?=
 =?us-ascii?Q?YAr0HoD7OOB8/gNed1PiPPVXIh+8a8Neuxy1+z6EBxQDoXW+bJa5B+Ed29o3?=
 =?us-ascii?Q?KDbEMbCYUOqoRplzeAAAUYd+fTU9xw+hxZY/M6kG7GHc2nIVJGK+q+f1cM62?=
 =?us-ascii?Q?rHzPdGOoiBZCRM6hh1p4/7UK39UAyQ4kRKViZT+8B2sU7R48Q+urv+JsHbq/?=
 =?us-ascii?Q?cDCNz09QqtV7A1rL16kBjMdP7E30L3hqPwYpObDO7P7mvLD7Cb8wrnejIsXu?=
 =?us-ascii?Q?NcGNafRxUstVtjF2rvRZshRmkEfi0b0rQfMygMtV9/EpQRvtUHanjEGrwtga?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ca5f13-77bb-4039-2444-08dce309a85a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 17:42:59.9629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSDtN+AMT60VOTt3Z1PddQ9AN/9qLhiO4Xu5Fhn9LcqhlU2u0fLKhw4FUfAa0lyyUDbLV7lnQRqC5ET1ElmyYA/Gqs4yKCxBJ6ZTX7c00Ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4710
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

On Wed, Oct 02, 2024 at 03:03:46PM GMT, Matthew Brost wrote:
>On Tue, Oct 01, 2024 at 04:02:55PM -0500, Lucas De Marchi wrote:
>> On Tue, Oct 01, 2024 at 07:24:32PM GMT, apoorva.singh@intel.com wrote:
>> > From: Brian Welty <brian.welty@intel.com>
>> >
>> > In order to enable access counters, this must be enabled in LRC for
>> > the exec_queue. Add basic uAPI to set configuration of access counter
>> > trigger threshold and granularity.
>> >
>> > When access counters are enabled and threshold is hit, the access
>> > counter handler in xe_gt_pagefault.c will migrate the buffer to that
>> > to that GT's local VRAM.
>> >
>> > Signed-off-by: Brian Welty <brian.welty@intel.com>
>> > Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
>>
>>
>> What do you mean by **Restore**? I'd expect a minimum amount of
>> documentation explaining what this is and how a real
>> userspace can be used it for implementing X, Y and Z.  Link to userspace
>> is also missing, and is required for uapi.
>>
>
>I was going to say do we have user space for this yet? I also suspect
>getting this implementation right is going to part of the SVM work. I
>personally rather leave this disabled until we get the SVM
>implementation for this all worked out so we can freely change this if
>required.

Agreed. If we want to merge parts that are required and we are still not
ready with the entire feature, then it'd be ok... provided it's properly
explained and documented. But touching the UAPI is not. This should come
only after we have everything in place and a userspace consumer is
ready.

Lucas De Marchi

>
>I can't imagine any user space is really demanding this to be enabled
>yet.
>
>Matt
>
>> Lucas De Marchi
