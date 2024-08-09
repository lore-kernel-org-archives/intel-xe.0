Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AB9C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 23:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD5C10EA36;
	Fri,  9 Aug 2024 23:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bph/0QJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917A510EA36
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 23:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723246654; x=1754782654;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bYbdzx6zr2HTVGF0XULHdtuyKVqExciF9fgnLyZ2s9U=;
 b=Bph/0QJu2AKzH9gw3ySTxL8aMfPpdU3ubbdVKc14S32w9+OPQx5sASiL
 dDTejVcSmhtHLq/11OhTdcSefK5MZWP+XDZyIS10Sbujb0UKz/yML1cti
 9ejykHjFmCZlFeg42gXBJ76/S44J9hT4MUDjb8vH0ERuWL8xX6rsOjw5k
 Z9URQiUKXhq8jaoT+2cePYCPqZn4mpVJbXcaK5sd0Zu0uRqMXPv/KpA4h
 W/rh+li88LmCas6FlaeLlV4xIiRhUDoO5At7TWRNgLbrQS6VBA3B3drKX
 TYFuH5pV9RRh8XfsIvG9ItrIyOkx2Ww9GTKpc45dBHlIv59WFaeINz/Z0 g==;
X-CSE-ConnectionGUID: 2OlxI4y/SRWhqWPOq0lh5w==
X-CSE-MsgGUID: smXs4WwKT/+VtCGdIGNoIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25233622"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="25233622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:37:33 -0700
X-CSE-ConnectionGUID: J1HNwHpzRkeV98hArg/a/g==
X-CSE-MsgGUID: DqI8UWQDRU6fAb+dGp7V8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57791705"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 16:37:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 16:37:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 16:37:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 16:37:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGcaUW+QfOGJWKjTXRyBhFdAQL5dUg9BBVGTwZ219H4YcJk9BodgmklnqFkjfkZGdS2hyUvaUbfRBXzDRBqXOLeprhHOrTQ4BcY1Hf8sOjxJElXZMRm41n6+Pxdk+4Pwn1OnpBqtToy9Iwy/m6XNDU6SLuwT8dpfL/9vbPkgv9bRE8dGFQvd19Bl96bm4E6DfHLcPRPEfeBY228qQpe4NxeP7css7cghD72Bxlrb5C80x0HFMhsSrOHhPAk0+WMOh9aUSp8cFVFpLzh5dKB4cG3oapxmffn92gAahE0Y09ipcJuCEbHWxNj0mX7wjByrnAFvQgEc5t+Z9enypf5yQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AOvBD6wV69ovYCm//J8UJnShNwp8dA921zjUJXiR/k=;
 b=DoylkdeL0Rj7vVG7pGxMrErFCACdryMSzSZlGSuE8ttSdWKMIUb9FXkPJLrqwjY0Gekf7aaHfophUZ8RLtOvBqsy4btsyyRa0AGqeE1QJB8ChBxMXo3Thn1Iq9/gxagRZO3bqdrNaLN5XkDXYDOAgfo5oCGl7KypzMI9mxclEmb/cWnMG+Kcr9iWGp8dtcKqi7Cyi3tLtCoCedlPuLP5hj0oIh8jqgaGInXjf7wsECaU0MlxkJ/k9RDFo4rBakDEu7hyNYpvw36ASjLb17KdQYTPoF9DAC4EbOYriKLUuo9ri6R28Irqwy+YJiZDO5o+GsRiOgktZdF+ArcfF3E8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Fri, 9 Aug
 2024 23:37:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 23:37:29 +0000
Date: Fri, 9 Aug 2024 18:37:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 fixup! drm/xe/guc: Pre-release GuC firmware v70.29.2 for PVC
Message-ID: <65zyucaal5sfyn42j4jtveardo4wrx5esalklikytajlwgjtj6@vrxsigshxpcq>
References: <20240809173459.78732-1-gustavo.sousa@intel.com>
 <172324392489.558655.10902101599422609117@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172324392489.558655.10902101599422609117@2413ebb6fbb6>
X-ClientProxiedBy: MW4PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:303:b9::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbd3bee-a092-4f37-4651-08dcb8cc3bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z7+nUE6WfErNhXn8rUfKDxC3GLeu5VZuuV4nQ0BfI9QU/hXjeQ4tqCrb1pjk?=
 =?us-ascii?Q?HhRMnJM++BC8uCt2GZKZjYCX31i1dw/DnsV5KLDuoOQOJwpzLMRXUiwyEEqD?=
 =?us-ascii?Q?KRZvn2hAERsg/4TQZbBPeCrBDyMtNGybRYVKjyxnT7CK43ho+TU/hGPCkxf0?=
 =?us-ascii?Q?IrcNNL4ddTb/SV4iUVQtnShuxsUMxkrbAB+ROQC9EKD5ifIXkB0A80bTJpCl?=
 =?us-ascii?Q?1tjZna+5i4LyijzBZBWOLUMopypT9qJx1I/Wvjbp3JrsTFY76/zs+SFT57b+?=
 =?us-ascii?Q?bFeurcGVf1nSZqYjOxr4Pd0CHgladAT5B9iZgxkB6iXK/mRrVcr3fh3xssfH?=
 =?us-ascii?Q?XhEn78wqaXDShuXM8qPAEYjGiglXg0s2VH4WVHa6Sg9iJxS3bzon/1RMvyVY?=
 =?us-ascii?Q?ltNn7CPFOU1Ge0ksZT8M+8FRKHa2Glh+9gTyP7ZgOQFsmhxfECkDixoYeGtw?=
 =?us-ascii?Q?W8xtqG/jTArZOu2tp9/f5qGQOWBtoD5mNuk66i+JaE5WwoRqSwEGNh6wC43v?=
 =?us-ascii?Q?rSnEKMUyjDrHnwdWiXl9b2VauX9uQC27tz43OuGTt0z5m5DZSRl6tYBwr+IN?=
 =?us-ascii?Q?qeiBkfrNI6Etr5VQJM+oMrWgq46MTOyF6yOoPXJEY825XsB8lEsbfxh25fKG?=
 =?us-ascii?Q?ZaHaoUKUxud0tTX24C/qZdd6rO6YASgpSmkT9N3jxOTzPOGKLHZjhpz3kk4N?=
 =?us-ascii?Q?za+TtUIePJ1UEYWFSRCj/s2JrzM8BVNusduYwYTQxlpLCIH2YCnwkEiN7BJF?=
 =?us-ascii?Q?kU2/zMEBPD2GIoxfH2kjS4zKIpyyNv/omqhMCV9nMD5lBukXkm9zV8AipvZS?=
 =?us-ascii?Q?/mITgljjH8RXka0T8cPiXczSkhbQ+XhyNOjG0PaeWnE3QzQIwpTwp/e6KI0D?=
 =?us-ascii?Q?hTo1iuYbMaB9sb7Qy2rEZ2bG0IzO5GVeKr0BJqst5Q0qTy7S3IC/Cnj5MJmB?=
 =?us-ascii?Q?UomAXUVsTA3egRP+D0fa7nyT5ij7mmu9Xx5Wk/qpGMRw4YuWr1gsaPOS5prN?=
 =?us-ascii?Q?z0CzbYkrmUEdz/ZIsDPtA+4HNGMhB9zwHZ7oxAbTuPON2Q/5BRm15tFNzXcH?=
 =?us-ascii?Q?ojIMqBCwGpvohvGkT2kXxOLqDmlmJCs2phaWIbRqkFN9vzoSt1BNWXuRaF+S?=
 =?us-ascii?Q?LAOuc5DEN0ME2ZEMORbcx/OAkkCeuIQtYKCQ31CzCbAmBvoVry3L9KtUkU3s?=
 =?us-ascii?Q?P1Xq7EVqeDiMPjrg7YK7D0Y/PtpVT0lqryjAZxus8/yolaKH9Zwe8PKYiap5?=
 =?us-ascii?Q?oK5QoVtXOfu9sVr/PRF0dWBFMN/08fkXgpBrtYafQbqJXVQ3fjjR3YkgPmH6?=
 =?us-ascii?Q?eeA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sjIlUd6Ti5NOcWDkbtVZRg2uUT/0hdrrTYFMS3Ryx31IUvV4NFUMwVVPB+Sg?=
 =?us-ascii?Q?SVkcWQe+M8ywUkAaVi0E0c2H/tTMo9eNSKrDh/F8/sdd6agHAydNZqX+Xg/p?=
 =?us-ascii?Q?2Z1XGa0esqm4utZDNwD0nwBhrI2t/3UITVX1ieEj+DhdxeBHx9CzalNK9ANE?=
 =?us-ascii?Q?nfWG90ESzyvPjkP6b3KWiMRP/hqpAVlqE52RG59taNVChgjR/UYsQ3YkvfuT?=
 =?us-ascii?Q?wrnd4lu5JlHCU1BEDlf1UxCoV38/1D6Sxb/csANCTYqN4Gu+UitDAb1+L+N0?=
 =?us-ascii?Q?NeErE69zIpKo7UM9E96IMtE6SyriA0OU4ZrTZku2YG1CLhaNbowOdRWe6ITj?=
 =?us-ascii?Q?7TET9/eqKIMu49Wwfj6oDpkLnfugh2eu6sU1AnhBV9ugYUBjHNugXzhhD8HD?=
 =?us-ascii?Q?2x3Ekhxy7KEtjUvCvIesLXs6225f/Im4eZqf+NAXCmFYs4vzanb/4FbucYcz?=
 =?us-ascii?Q?RF6SOsLY0S2drj1ntyOwBJviDNc9v0swiI+uaUgJNQA89AxwyVn4QhxSVxGq?=
 =?us-ascii?Q?oqx4teicVwizwu6NapC6yjhBIZGaowQ9oRKtPuKJ6jocvjhj9xjD7tqwZBVU?=
 =?us-ascii?Q?520G7zZdP9GdW2flNT08DeDnTlWtgPjBOhlolIVjAJiNqTRKKK+0dXqWU7pX?=
 =?us-ascii?Q?fiSejMQu8om/tFG5ZH0PNv+jFzHemRxWMPY2R1+3trEssLGSVit//AXofy+7?=
 =?us-ascii?Q?f3gvKZ+eB4OuSewFemREA5/ag/ZhOY0hsFf9w65IC9BLAmJC9WPh3eNtnD6G?=
 =?us-ascii?Q?kJp5KSkUBo2OR4nSaNZm9kQ7tgGH5Ft/JefecsX5rYr6qezfeoMuLBguWiMj?=
 =?us-ascii?Q?zWMb3vZ6fvON0tuGTkX1hGM2VpjSciW0dXzf+HUydercc5rl7S/QbKr4kqEk?=
 =?us-ascii?Q?PAKJ/GEXPW+UbjE5Jv7Qe29/doXIYqU2bOVQ65N2RgwWdD8wLAf/wCNYd13q?=
 =?us-ascii?Q?PizptF9VLTdyW1MAQnfd+Xpn8puJs7LIqhuBX3823AhdB7QA+0Eod9/17CPd?=
 =?us-ascii?Q?gNGFxrBvVxpptyXXe2germ3K2rqcIqHB2nXqENdkltqICGv+mEjBYNMkg0Xy?=
 =?us-ascii?Q?yphy1dSv7scmBJ9UVI6o+6Nx8eSS9EqPXjEcV5U0Jt6ik8Qpe+eFQZcUjvEa?=
 =?us-ascii?Q?IPGGtbvV6UWeNafd89bv7Wxj3k8q0A0dGMSzVcYay7LGZw3WnaJqQPsV5xeC?=
 =?us-ascii?Q?3aPfMuyiT1DpKw9KEJCIQapnRpeFuicqC/hLv2/WmIiwmqsrALwbUy88/bCB?=
 =?us-ascii?Q?kDKitDwrGsusoxcKocpfmjVPQ190QBQ6lgcGImyIq5KkFwWJiQUZjxX0wxEJ?=
 =?us-ascii?Q?ticTP2zSL8YwDc4ooEgqKzO9wvqZXA46zasXowybm0KsbFKMHwgMoXxynC8f?=
 =?us-ascii?Q?I1PpJk7sFR4ID12W4jtmTXY83ztG2cHapumlgbfu7UmcsHBg154do/u3Dppq?=
 =?us-ascii?Q?odQo73aQARpxOu+5oqNIVeMpA1Wr0SIHolqXGFuDaCUlfFzgo0IYvV4iD7M8?=
 =?us-ascii?Q?3oSzhgqBJYcbi1FdvqUHOi3yf9+fqqGClhoa9pjxnI61PofmaGk4o5hikN/y?=
 =?us-ascii?Q?ayfsJ+tN2YK5x2Kz33do6BhyPymAojvXyyJvzAlrv5ME5uvRla6fRWnPpmMn?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbd3bee-a092-4f37-4651-08dcb8cc3bae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 23:37:29.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fivm4Cz3pdje7v9OyfFDGtStXMvElJXVSYi7SOnN2pf328x1WwkS0e+Qh10uVr2MponjWlWn3W5R6hUqDqW4A46W0X9I2wpZGZkpf9s3Fmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
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

On Fri, Aug 09, 2024 at 10:52:04PM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: fixup! drm/xe/guc: Pre-release GuC firmware v70.29.2 for PVC
>URL   : https://patchwork.freedesktop.org/series/137097/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d_full -> xe-pw-137097v1_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-137097v1_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-137097v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-137097v1_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
>    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137097v1/shard-lnl-3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
>
>  * igt@kms_fbcon_fbt@fbc-suspend:
>    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137097v1/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html
>
>  * igt@xe_oa@oa-regs-whitelisted:
>    - shard-lnl:          [PASS][5] -> [FAIL][6] +2 other tests fail
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1742-13384fb5b1e76e7012902cc10b1e49023358dc1d/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted.html
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137097v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted.html

none of these happen on PVC. Unrelated.

pushed, thanks

Lucas De Marchi
