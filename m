Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8601DC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 17:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F54F10E9C0;
	Thu, 30 Jan 2025 17:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJV3jBGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A04C10E9BC;
 Thu, 30 Jan 2025 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738259038; x=1769795038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wJxDrQrZbcyTjwvhwE/hlJ6nCayO3gKXz53IZVN1xW4=;
 b=DJV3jBGVGdFewhaGHB06Mrr74ddGpLZLoXclz+4ZctHfcOXZ7sCGVMYG
 p1DGnr7ddJ6g+YsP7hMAospwBuCl4NTpwmZrodKwzelmXFdxXm0xxfhTH
 xj4fD+v6gfPt0ZU8AwprY8Aoc6z9//VWl2gtpSkkmxhDoosy/m/MBRP69
 MxwHc4mjiF1lj2N2XpkoKJKXIpDLApnlf8ub6ukDf0clsIYKktFFcX6mH
 JCJsqctM6xdbpjEDmonxyTu1b8b4Nlak4UaIXasfItatmTwqn4jRv0wXY
 42nvYGjPNBwaRtackm8zjOILr/Lyzpe7UWe8SXkNY0y9Z5JdqDvyC8008 w==;
X-CSE-ConnectionGUID: xP5Y+NlNRjm+RExjYFGjxA==
X-CSE-MsgGUID: cQcyy2K2RRS9P5eoLqn0Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38957320"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="38957320"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:43:58 -0800
X-CSE-ConnectionGUID: JgZfowReRdiIR1YW2G5o5w==
X-CSE-MsgGUID: I3klr2XdRyCp5/m+L8Cv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114540989"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:43:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:43:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:43:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIWU5Hg4a+aTxPMYgkQERYCaRvPbdFrdFQeRw4UzRu/1VMgTzZFzF1yMyR3vvY4OqS5WnNxezIsrp945RF9I7nuvD5yB3PwBY5FZvh72/tUCsPAIMGCHZlmYPMOiaU9IKVxaun0ljDeLURI1h0Sl2GoT9cnKwWnsyUk5TX5mDhC8GzdNRwpD8pEuXWvQXXx+SKShvyQ0kHWQsfpXyUJElrHC9BVKg4ElWz7Q803fZ/ZORSdxIgcaRpzb0SxBlMmdCdVg0DV5btaPqxZPzkxoFJQ5vRcfFQcccwWggY566ImPn9oErpVm59gPz+fSFfooHlKEYMf3BJCbS9O1lRFb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5S3YTHJQ0b+YfsO8Qr/4rfk9Ehl8XR6LqMLSIEbxAs=;
 b=Rtr6Z+jAKxQRgnXzZp081Hst2uThpLr7iBWGwSl51O2hQMdmFuSpvvC8b80vTpvpTtD/Ui6gs7Uy8v0I9dZTyFlmJyGHfO+8XFkHFFBflbXWRh1U8lTNEohWwZ1CQwRgjO+YXusq3PHDceLh+pKbM1mknADBbEO7K2XkJ+T2D9gK33XoVkfwY8J5RYzIj+/pwx22xs/u7XRLlqXtHE++MOrApczTWmypBrURzW+yJ9GhU1sha9r9c8L/AeRQF23dNLgTuDVEqBZ27UeuTbTsjBHY08tuqsV9bdxvFVoZVTyUSERhIakcA6cYtiybZanVX7h0JdyC83pKPYDrQ0Yxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 17:43:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 17:43:13 +0000
Date: Thu, 30 Jan 2025 09:43:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 drm/xe: Fix sort order of .o lists in Makefile
Message-ID: <20250130174311.GS5109@mdroper-desk1.amr.corp.intel.com>
References: <20250115140812.20799-1-gustavo.sousa@intel.com>
 <173695374387.3983181.14187231526385162871@b555e5b46a47>
 <173695805941.3159.1159064316268223503@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173695805941.3159.1159064316268223503@intel.com>
X-ClientProxiedBy: BYAPR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 846acebb-7f7f-412a-b09f-08dd4155920f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jTtUTfmQihGgYP8B7XmItKPWIWaPpI8X1/8GQo20WByqWrAut7Bx6kxIgIih?=
 =?us-ascii?Q?cGwvp19ewVonUVDGEtbaDsOpNyYTfCIiv/Ta5KtuIO7c+Ox6URciqN4NM1Mc?=
 =?us-ascii?Q?rt20k5H9bt9aeE+Nus1ZuVq+7AHgaI73E2E5fPC75pu5wL6N3/n2HuCDfCkx?=
 =?us-ascii?Q?KKxFcOVLAjum2Efj3nF7A7jdzVzw5AzdZy3MbbFj2MIVcbq4i0U7pYmUqWWp?=
 =?us-ascii?Q?z0GWd56aIGxwm97pqdH+fLrrQNxkE89VrUU5LlB0dI2rd97Z3GoT5Z5PwoLh?=
 =?us-ascii?Q?yTpTNXnyYqV0GwCYykgsifg8YApbEZtaTKN4Z0MEt9VO6TQmVvM9LsLnbjWW?=
 =?us-ascii?Q?hppkZaWCzTBKbuUVsR7WYJP5b8Uv79CVCabEydwjAfcjNHZhyzU+8/YSvv04?=
 =?us-ascii?Q?L03g3g6/dvWZb0WoIhNXtGU2s/r+EX3+s6VZp6bqMVwo/hLOP7aK/Vs0fx49?=
 =?us-ascii?Q?fa9Pn71xFvkOcSaCdOd0JjMrxrk8nCGCRR5e3xMmg0o9Pd01ssoeBUrb2ve9?=
 =?us-ascii?Q?TUPvOAkoau88BoQdoQ5HT+LhMzsMdXckgXDVbX2yy2ei0EqhpBVEGmIEspq5?=
 =?us-ascii?Q?5gTBg26gEwP11fekDX+yjCjIVoUs/I13d+iyvxORnNMX2hRK4nqF1SJ5oVY7?=
 =?us-ascii?Q?2/kP9WTcqHliBMUSaa41aRX+z1Jv5ZOi1JNgcyi+ViWynMEV1Uqn+3RHOlDs?=
 =?us-ascii?Q?Cdg2uRpTtaYCr0SW7R+omiXkAg0UhDi1Ih1g/hQr9l0lGF7h0vuytznV/ANh?=
 =?us-ascii?Q?E7GCFBt0T+GLDT4iI3Ys+WTTr5jmKfuvl+LLlv4yPPYUeVtoXKm4q84oG9wB?=
 =?us-ascii?Q?wFGmQ212Ry1J2JvzWDC0VngcZaWb/xcnr3H+dXumZ7t+gc0ygwcx6NgOSuKN?=
 =?us-ascii?Q?9PTWc/dy9hVupeERMwLWZufQZhE/1/7dRheeKO0HIbBiP5NYxIRttAaw3QKw?=
 =?us-ascii?Q?JG5rPReVsKOS1ox9qKmmSrPnR5Nj4FzrzZRtNGos/d+fdLuc9HfFB/yT2hKt?=
 =?us-ascii?Q?aGMfRDTKYRxOHtK6HLBco98Lt+o9wVYIXCTjENPbMTKettSYv/J5NPrTPiDB?=
 =?us-ascii?Q?4lvKj2z/8bOVnVIl0QaELKU+omAG7jNeSajMQXZmEe+TpyfPbNMJWK7YrmsZ?=
 =?us-ascii?Q?Z6yEyK03VVjke1a3d/ksRIbKaKrzmtGG8ISwAaYigeNvFdsvM5mwxWKJQoMW?=
 =?us-ascii?Q?9Fem0pp7impL7DAb4Ut/OMLlUQyUcHv/kOtMumpFVN5uPDC3x4aWptJbgXx9?=
 =?us-ascii?Q?r6fsRCmN5Bo5t2oEn/+FaOAJQY9NdbJXnyNWPgBMyCGbRCSWYg8TH3JQDFBx?=
 =?us-ascii?Q?Zda5Wx9mjVAM35BeMJVWK/jISFr1/VP1IlHTxhZdR0l07Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ket83V3+RaWXi28SoxQ5eXzpR7/byCcVoGPPTuvboNBJ2+4rH6ZvkTSRPCTO?=
 =?us-ascii?Q?gGLAuS1ADIscM7okVupWUOnS59Hlyw7elwa7bEJz7TZt7tlPKJW/hY0KbUcG?=
 =?us-ascii?Q?iPvoHcVgtp//44vTtUODCWrGDuqIkT19Xy41rFw4lcfHy8L8y+1lKBk1GMbB?=
 =?us-ascii?Q?RIu7sPhEdY9JYvWZr+VJH3S7KF2jD1V1Oba7Dzb9hVbYSboo0Ybv+1tIinLt?=
 =?us-ascii?Q?TGjvksVHS7NSrZ9ck5n14dr5kQNAWb18xbGBM3LlKLP5xgS62eAI/6FLxu+u?=
 =?us-ascii?Q?TUeUHCOzZnzuYRbmXpR4w63Iv62QjeT38qnm0jwVuB7KLZbA+UmiMOmkY5z5?=
 =?us-ascii?Q?BIcnTcv4DTP65NRryqG9uoB7+DbQ271OTJm6RXaJu3I98pEs9LF1o52yQdHU?=
 =?us-ascii?Q?I5JP6nVGwBqoWjgEkgjqgxeRsj7rlJ8tzulLgho9coBd9NBiohJXTe6DlSZb?=
 =?us-ascii?Q?uK67Ecro6gdvyipuCm8jojICJ3s8fS5D0ewX7iEXUXiRlAWK/yE8wAmQ7Wob?=
 =?us-ascii?Q?tYdUwzg8CadMWsjoCeBGIuEVJclhV8JegznPu3JeCw8QDkTfvD29ist9LWgg?=
 =?us-ascii?Q?MMlr//nd0b1wKj/orA9jHCxFfyCrP7hOkfLKnJlQjkleSL7Rvn9gHQXiA4UT?=
 =?us-ascii?Q?zgaFAFv8KrjkcsERSEnOxHdd1cA6fjdj/RXENsjZNRFD4MB+ExuIxF6Hyxat?=
 =?us-ascii?Q?tyFArwzjHe+DzGQE+YMjQoe/dULTdEGxVGSSPbbLWEtktuEzBNIkeQM2+ug/?=
 =?us-ascii?Q?u0pvF9p5w6ShlkuulehHkv2RhKYHdhpoEIwDID5Zt795cSo3KxE/+3FA5zEu?=
 =?us-ascii?Q?xwhzWcChkn1jlC5qylXTxSCYthHGBlR5RKQb83H+LDzIZjKYDDtWf6xM3Ip0?=
 =?us-ascii?Q?3WwuysazygW8k93qjjgWvsgm37I2P5DQkeBq1ruatdn9Ov+t8QbyNXbfDTwu?=
 =?us-ascii?Q?HFqxaGCUXRe7nXEygJYfzcZtUV3TfF+7ai8Yt10HWqEeI0pXtvE5SBT9v3ci?=
 =?us-ascii?Q?h/WEDA5ofGbtJzlI6fuvUb5dpYdeUfWclFrHS81YncLJrB1BlhQLD8WeSkuE?=
 =?us-ascii?Q?kyginLUaL+485co4wmAToKox3mBwXdzqbLDPfVd1OptwO1FNtEIA6YSQL8m9?=
 =?us-ascii?Q?QmSmvw3YfpZ/29ik2TJYSjOTsUtgIBH1O/+mpg9uKAIExSu+ZQQdgx2vPUGL?=
 =?us-ascii?Q?LsvBFpKT3eazFOE1kZiGvZhdgExpNL/Z22+6mowqhNnvojzp8cYpjpbHAy67?=
 =?us-ascii?Q?f2q847WlEijvTHgPFAcVw5WPqTXh85doDvVv6cffSeCzwIvaJXZTVxv4CRks?=
 =?us-ascii?Q?JnJjGRzqbcacBiauLhRRlMTpagRfx/e/DvDkbQ60GcmK13ZejOlkLu6WuYtD?=
 =?us-ascii?Q?fM6NRwda0/gR4NLNFIqnqgV1JLPBDO7zYjfGkJ3iUlCNkkwUjm48NCWF7slK?=
 =?us-ascii?Q?QLn+YLgBsEKi736KJeZPhTR5CChxN3EYvczZlGZzTgHVF1btfNcv5dPmFdlS?=
 =?us-ascii?Q?a59dQBAj0it/iQatO/3ML0gvLloseeBO6bGYQaj1ZQv7z6bQV34Z6J4Bg+L4?=
 =?us-ascii?Q?g8h7NimvCeuUgne2tKcopbJzcl4O4IflA/29siKRMOzmmmdOXaVyUtm1Squf?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 846acebb-7f7f-412a-b09f-08dd4155920f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 17:43:13.7043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hid2fwf4Cfhb7UN21nutf1+g17ABKf0R3pyhlw6saPcpWkI/hCUB5HcY4Zh6UWrKmcPES3lKd8RYenskPqpKt+Q/+wwJbLAFzF+rrL3iRsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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

On Wed, Jan 15, 2025 at 01:20:59PM -0300, Gustavo Sousa wrote:
> Quoting Patchwork (2025-01-15 12:09:03-03:00)
> >== Series Details ==
> >
> >Series: drm/xe: Fix sort order of .o lists in Makefile
> >URL   : https://patchwork.freedesktop.org/series/143557/
> >State : failure
> >
> >== Summary ==
> >
> >CI Bug Log - changes from xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09_BAT -> xe-pw-143557v1_BAT
> >====================================================
> >
> >Summary
> >-------
> >
> >  **FAILURE**
> >
> >  Serious unknown changes coming with xe-pw-143557v1_BAT absolutely need to be
> >  verified manually.
> >  
> >  If you think the reported changes have nothing to do with the changes
> >  introduced in xe-pw-143557v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >  to document this new failure mode, which will reduce false positives in CI.
> >
> >  
> >
> >Participating hosts (9 -> 8)
> >------------------------------
> >
> >  Missing    (1): bat-adlp-vm 
> >
> >Possible new issues
> >-------------------
> >
> >  Here are the unknown changes that may have been introduced in xe-pw-143557v1_BAT:
> >
> >### IGT changes ###
> >
> >#### Possible regressions ####
> >
> >  * igt@xe_vm@shared-pde2-page:
> >    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2]
> >   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa5a598f0b284ab09/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html
> >   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143557v1/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html
> 
> Hi, CI team.
> 
> This is unrelated to my series, which contains only non-functional
> changes. Could you re-report please?

Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt

> 
> --
> Gustavo Sousa

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
