Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BBDC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 15:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4155210ECA5;
	Fri,  7 Jun 2024 15:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqDEZvLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529A110ECA5
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773435; x=1749309435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ofVaLJ5qqhSU9vlixqt5OqGJvif9tbrzyvr9t8UN1bQ=;
 b=AqDEZvLMUpehJ8SFn+pIM15nBLHftAznfvcvTUngVw55VPRIEoxpt4wE
 bQ4KCAMepIrd+/oriT9nHw2fT86pFnhztBMZ9wPUPUFaBJDz1aUN8B8bJ
 vqsCKsDlNVMKsw8MhLMUffpKYhLTS6DrMSYdQBWWLNdpHjGPdVjnQ9aUY
 Ue+uRSLCMW3sGbu0gP2ZXn6QtMTxT5nPXe+sRBpyCBtbBSc0fILZUFzNN
 jRq3YiMpgQRi/8NlHxSb6nENZi7U8RNVXI76KbopK/8pVLgAWhfPvgbue
 bjkv+9ap1wWSKrvz5Nn8FOszjSN++IAVN9r0f1oNy+9+C7ZBuazhJ24mL g==;
X-CSE-ConnectionGUID: hK4aXCHcTRi9xJgwO9XcmQ==
X-CSE-MsgGUID: FLXM+yKcTYalqvakyY4BaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="37028633"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="37028633"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:17:14 -0700
X-CSE-ConnectionGUID: EPa8yHGbTSmIlGsjKhQ6PA==
X-CSE-MsgGUID: sthXE4KDScG0SNkpH5lSSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42781474"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 08:17:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 08:17:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 08:17:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 08:17:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxJbqufbgQxfZFuBB5TTFAM7Uroiy19MCzEuBlLogzKzeO/Q+FPqLqmccZOLh1DMHm7CF+/JRWVHEcmp42fSjaaBM1pgKbFN/I1XGTTbMgTVZahX29Zs/L8NP8akZKrZNd6WksxS3xpGTfz4gujpztQ++Xk7u6k5AUBPE6Gl42OJ2k/jWr6DW0S3e0tRstTz7nq7Lx2N9ONueLF44ZxKeLJLAag1F5eVN2EeGNxZ9AaeCsGPKTAV1IIjEy8yNRvHNBHVyHrzSjDGyap7pQG1vu4VVaSvbSBQju4pLT0zM6nA5q5qAJDv/R3K7Wkm0r1MyMJNajXjpBmHdIZRPzPRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtfXBOhlG72WSQwetbSg0W0LIvCcA7Ur9U/IhpQniCo=;
 b=QnjDpqu6mpIBIp+fofl5KtujgXSWgk4x3Yz0cEMVPKpd7jj6svusKsXJxXS370gbVf2dUClWcnxHlBLzlNaXIpKB7foEw83uPhW/va1GolI/heGLQaGPGOT1mFjk334TowtclSfxvopv4kQxhGLhUzT0Nt+abaGKB8+qvrD/c5DIXN43EHlUbYdn+hrclNU/6jDoSttQLba+tK5dvb+fofJXpRQ9H8mtJrWLjsGnl1ak+GaTHpr2Qrpcoppx6aqO1iQvgAr0456+HeZ49m3PGSXUm3g7/9REis+G8YxAH58c6NFeN5x9kSrzDBWVDd+cEyUmdBxNkrOky9c9lb6X8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 15:17:08 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 15:17:07 +0000
Date: Fri, 7 Jun 2024 15:16:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/5] drm/xe: Add LRC ctx timestamp support functions
Message-ID: <ZmMkOmu0nfwBMrEY@DUT025-TGLU.fm.intel.com>
References: <20240607065219.2264624-1-matthew.brost@intel.com>
 <20240607065219.2264624-2-matthew.brost@intel.com>
 <87bk4dmdmp.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87bk4dmdmp.fsf@intel.com>
X-ClientProxiedBy: BYAPR11CA0055.namprd11.prod.outlook.com
 (2603:10b6:a03:80::32) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e63902-3542-4b0c-e93a-08dc8704e52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wAP+2THMUJ4qV9NCQzrKy5q7JjrhgxwE+egX5/qwXieB7zU2bqCoHtVaauSI?=
 =?us-ascii?Q?iOaYWEG+TYWG3BGTO/Or+FuPvW2QJ3w4Kf8yL2Rn+xue2H+OrHdzxEom/sSm?=
 =?us-ascii?Q?ssk3KRUoTDvNLMtp8qIfT9uCniZuZgTARjQjoeIA37TrvXyeHA+/ehasW/1W?=
 =?us-ascii?Q?TMQw7aijG6gVCR2pFqLWrx1AyBXs9AY2cbJIELbASiELtl7z9S6IkwdPUnlj?=
 =?us-ascii?Q?9Fn2hSFuiNIt0CKDnja7J7/DNbmQN05UNYX++oHYXGgy21tHHzNHrqUXI5Jl?=
 =?us-ascii?Q?8EA+S4hbnZHGdDQr/mXlRbzsjw2adZWYoQPjVnZhQCjNdO61J9qrpj7e3DvQ?=
 =?us-ascii?Q?U/YIrpA5cxsZ5JFTkviS+tEJD9qE21vLFAj/XgLSbqme6Gzil9RTYFHI96WN?=
 =?us-ascii?Q?b6e7tYzAObVR1bRwBJlVysaMBkizmE5Cr1kbxYmSaPKqKqyfitphb4Qyb5Hc?=
 =?us-ascii?Q?5zeHiMWxeq22hKMdI1jrMBRRgVslD7toOQUzBjovFiw1IhhKIuqWN6z9fLkU?=
 =?us-ascii?Q?yIHXuWIlsBlTCbqztyaNDD67Ek+pvWydHM8OwK8iqzQWOGYzGz/WiriW70KI?=
 =?us-ascii?Q?ox04b6+go/SvoSZImGezfau3gYIpPujn2JkYiHa4e4grGQdulUOgJ3UmOwP3?=
 =?us-ascii?Q?F48aquOW5TRb0x7Gyq+qS5LXZu2IYPH60KXAZ5sL64onfjSJunINLFD1ZaDG?=
 =?us-ascii?Q?BNI+9ne+el5Nae/Q924MUwl8qtv0V+yi4d3skdID4fwTwwn2RBvTMX9SQccV?=
 =?us-ascii?Q?5UK2gabR2amn3diDyOP/kyiKjqGpzgTavRro+sqW/6+fkCO5d88e+xFxMDSg?=
 =?us-ascii?Q?xmsR+B498YSWYhkn9cEusfzKSV7plt/WNv/CXDv6y5PnAFpw6FKcivUOPFW1?=
 =?us-ascii?Q?fSw16o1HhWaaOOrdtaGfqUxNHOoefjY5u5JHknTMU5r/K2c0CktKksLNMYNE?=
 =?us-ascii?Q?dDJygRL0stwIuGUDQF1fBih3Nof/VdAXjUMwS7b53rdHuxmeEcSGmX1nMtZG?=
 =?us-ascii?Q?E9HVLtW/kFU+3YYUFklHsJRHRcc0OmL8Okz2qqfUUOz17rByJSZ/2teD+Pe5?=
 =?us-ascii?Q?TRqSYLTla0Rg1d2pGey1eSzJYMCuxlwyHaZA8BlIXce44crGJeh97o6epc42?=
 =?us-ascii?Q?QldxWJa52guRZJZWs9XrpfQzIxztMJq+5JJv5XKeFKOIYmr8JIuDfp3MZ0s+?=
 =?us-ascii?Q?v2ELvay/miGON4YmuXUgqECdY5qcxL/HHQhnSfzs4qtDiD2Et1DwLGmeTjhL?=
 =?us-ascii?Q?N6vY78Ajra2iFpeZTRYrh7sSC908ZRRtAsPCqqFD7q3pFyeMQk1JJwc1YAfd?=
 =?us-ascii?Q?wH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OoUAuxW0RNdC4uCC1WJH8L/tjWO+caPb+w24gV+uefccT+2er37PDgqX1irl?=
 =?us-ascii?Q?kilQzp9PT/BXhDd1ZvgIeA2ga+GOVB12/9k93hLFOEOZbD16AHbs4OoXg9/y?=
 =?us-ascii?Q?Y87IQM1z4kH0NzBTq5hFoOGWFiRjco8E5Sq3k/7tYhp5yTJUHVHVseTQx1MU?=
 =?us-ascii?Q?+JJxybOMxnGgC6JsW4qDdox3U9VY7+egjzjtoN8RvtUeGPy+jpRLfiSLAtb5?=
 =?us-ascii?Q?PBGDADZJRGISoEdpIF9dQaZ0MOaOl1AO9iddF0dGC7bALjwioRhNi64voUWu?=
 =?us-ascii?Q?JnMH30jMkDvEDHJAJ6fbw+Jlj77+7f1QT3eC4aenizZUEynq8A35Pv2iezRn?=
 =?us-ascii?Q?i2Mg3E1tNQi/Lz6hO8gMpVJJuzkTokq12PFtBvN0hCaa/7mlHYanA5t1APU/?=
 =?us-ascii?Q?TPU9WPEOjJ3WesHteo+zM6QfSvWA6BEeSaauJXGDdfZGrGl3MsN0RXpz15X3?=
 =?us-ascii?Q?UJ6Ey2XP7qyeH4Ke2JWCggCvJAe8oxOr27/Tmd+8dklluBpZ80R569tfhM9F?=
 =?us-ascii?Q?K4JG0p4HbVS6IWtP8letIjF5dDtdQ//Ycjy2XzRGlC+WXAG1SyUc5YLRejAA?=
 =?us-ascii?Q?EWT1EIC834Wy5qLnhV84HzxekBDddSzIVO9rNxCkj27SrXSj3EfDQ/ytz43u?=
 =?us-ascii?Q?18vPUUZ1iTKWMdOjuw2dNEmJO7DjWYIX1nSaqTgo39Nln1w6QOnHHryJ4zHh?=
 =?us-ascii?Q?dw4HSIqrKUXsrSXxK59enigYzueKUEDvYmQxU4sxOmtLplvofuyxipO+w9IY?=
 =?us-ascii?Q?kBZu74yOkqy87Q+lDOHi8AI7Q7wiQ5zhD7/tK5Dy26G70iIiN5fHorzysKJK?=
 =?us-ascii?Q?jGm24V9zzKrwe3tb0hx+3st89OF+BVXOUzcQL62HfQLq0I9jmMMUWHNhqBqs?=
 =?us-ascii?Q?R4ljkBwbMj/RU63Mm61ITBMRm54mXwoveP/1H8EkUKVwIiCaaCA0SgD4yPvz?=
 =?us-ascii?Q?1Zr5RLb1h7CCGAJovvLJw/2xJUM28F0pfk+rnZ/StBkiBhdT0Lz6+2/W3bEu?=
 =?us-ascii?Q?3t4RfvYOG0P9VuZ5mBCxsG+j4WPfkyN86VaoTz1IZ82nFm4jqkDelNIuamrX?=
 =?us-ascii?Q?QpLb0GfwnTmtOrG7P7p1nhT1/U48x4JX7tqo6kaHBgethlkiAf6JYDZhUPhS?=
 =?us-ascii?Q?DDv2LQiL7gELvriJTN3eraS0E1nRRQyaG2lr1b5TbXBDs89FU6QYxIamZU7c?=
 =?us-ascii?Q?cNiD9DcmXooFNhRY/jnIPPmcRRAn5Gu74kbzVdbBBJvuz+zYKQNIOmemIA/g?=
 =?us-ascii?Q?Mf7G+C30rPm6iZIcDP8pPM2Rc35TwA4AvfL/aMisnSpUEHij7b8KC9u7+Lbx?=
 =?us-ascii?Q?rCFmhdb2e5Apc6q5AHr0B/30/3ugAP1LPfcXvlzrqns1xQWheBawyrULxeQL?=
 =?us-ascii?Q?TvxMwBUwLgHDBaa7JEyu1QniQDcrEsLWXDyMmKgtxoOdj039TM3Ne1kzXPsn?=
 =?us-ascii?Q?mH2xdfF5wgqT84kjzD+qkIdLzpYs3wGsxjYivOwrDFYIzPeX8rP1gVcaz8aN?=
 =?us-ascii?Q?rX0j8TzVzjP4os4Bf8rUZzg8XQPirDJioBDGTraj/yrjrITiPfrxqfd6YFcX?=
 =?us-ascii?Q?tFQC6hzFhKh/GAtnbNHZCyzcxU/k4FKD43wsp6Fp6pjx/i8b8ywmfYHmEeXL?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e63902-3542-4b0c-e93a-08dc8704e52a
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 15:17:07.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gTO81vp8IdlAOktwtzmXn6F6LM9qYmzYu1K8+UuiJPZxrFn4PGzQF+Kk+5G+x5fQ/w5kgkQFZfX1iA7Xdi89w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
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

On Fri, Jun 07, 2024 at 10:10:54AM +0300, Jani Nikula wrote:
> On Thu, 06 Jun 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> > +static inline u32 __xe_lrc_ctx_timestamp_job_offset(struct xe_lrc *lrc)
> 
> Please don't use the inline keyword in .c files, no matter how simple
> the function. Just let the compiler do its job of inlining as
> needed. Using inline also silences warnings about unused static
> functions.
> 

I'm aware of not using static inline in *.c file agree. This file has
thia design patch and actually doing this intentionally in a few spots,
so followew that design pattern. It use static inlines as some functions
spit out via magic macros are unused. Let me just clean this up so some
the functions spit out are annotated correctly...

Matt

> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
