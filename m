Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E2CD3C92D
	for <intel-xe@archiver.kernel.org>; Sun, 20 Oct 2024 19:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA2010E0E3;
	Sun, 20 Oct 2024 19:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2HS+yGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E9D10E0E3
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Oct 2024 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729450972; x=1760986972;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CgDQGSxLVvIBTI8wyNp7WUCmRHaIJUeGyCh6XKkd7W0=;
 b=R2HS+yGw2/OtYMClnpNefxJOhMQiOPxE/InzUNJ9FE0dlaEQdrJ/DAdD
 TwT29f8zIc6VrUECRBibUn0SC6CfGNnos8wqiW19iUxhK+mV0+32tbTW3
 Jknzh7ysXsz3OY/KFD1B6GnabfiSkTo/JZe38Q6q6RTfgjEEcjZANVY0p
 PkU1cru6r2SqyvWyzTQHIOZ8e3KE1kPLCPeh0vIcAfXwayUthcUdO6/UB
 9xWbOlWp1jMoqgi8bEJYxCDfaj1OGzIVddjbXtjZ7lITOXOyR1iXTMg4Z
 xy0DiZN3RZpCIWD8U8wJFaGZu7LqbbwxePR3OZUQjDBqaKbuJr/mVZXJn A==;
X-CSE-ConnectionGUID: AGgR2hrDQDerAE1nxjQXIw==
X-CSE-MsgGUID: uHnM7XSwSMa/tw1Pc/xRYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40291907"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="40291907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 12:02:52 -0700
X-CSE-ConnectionGUID: frBi14CcS2ulWo948E3jhw==
X-CSE-MsgGUID: nt6fyHU9QeK2w+YmEZO6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="79284180"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2024 12:02:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 12:02:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 12:02:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 12:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhAL0owvyJLxds8GkhAuS6yisX6tPmYsBwAHJtb6n3lfPy0eqwWtbW5zu4kSnYZb8vhMezeMzWJ2LsQ9FTrq57/N8/3XGjpnWJ1Y4AMhNLgnlPwURfBFbmYc/7RAUwsli6LAKiTHTMSAIcie00m94tykNm3VXc8E2TqJjI82qFYDn1HX5PviMFoPebQ7/I63nyZmVZRxdTaWERmDlb7/3Q7k7EMRmaf5UmFRMJ+q8JDbbAoRduydNiqKqIJVqQzV2tGwXciuGl58n2AYEeLIP0Gt9ii1UMzcsPw4eqSCHAmAPL0wU5q53k1wx6BhT9pJi1JblkMeOEA3NrLq3b98Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YY2/cqJvXiyRFuk+eDTWXMr9JRztlFVVI2zIYmyvmA=;
 b=jPcwixoK6+GrJHu5mxPxIno3a5BKWrfOcJEBCt+pZw4W+Frrt+n+bm6n2Z1iyK40pva38nXAdzkghieHlSnOgC5wkdYtkpKgXxdhaHIOLLSfYm+gTCbid5UnoJjr2hsiOqPDRty31j+r2TcRmTMkUnJiITe5t+qcz0YZIXQykT3yvjbrQtXtpqFSTsLJQm+ceqV0mga/F5hFx1wrvh/TWgPMou477Bsigf0vZvQknCGjjg0YDgmRppH4uJq1u6/mKWaV9pZ9pm4e9KJwVOxIJjVRjoWW6RxcifBpRy1xJDlEu9kPd0M4/+UePsORE9CjcgGDck6/ayhBAgkj0o+XbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Sun, 20 Oct
 2024 19:02:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 19:02:49 +0000
Date: Sun, 20 Oct 2024 19:01:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVDogZmFpbHVyZSBm?= =?utf-8?Q?or?= TTM
 shrinker helpers and xe buffer object shrinker (rev10)
Message-ID: <ZxVTnTQOl4NSf2i7@DUT025-TGLU.fm.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <172907997277.1273612.2250565785976442475@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172907997277.1273612.2250565785976442475@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR02CA0070.namprd02.prod.outlook.com
 (2603:10b6:a03:54::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e19b37-53c2-4045-8849-08dcf139ca46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?auAedwq9y5eZVB+kxjpJy6BGmX6Lr88sy9a+x10EwlwimSvMbQl7MZA4SR+D?=
 =?us-ascii?Q?OviMBmHYnm4+s+I+nC2ZqR4YHHmkVnK50UEhX7H3Qi3GmUcRxHHx/Evisqc1?=
 =?us-ascii?Q?+I5l7iuqOlzFuJ7qv+GeI7OnPytj0cVGdZl3AzZovxXOiOdzILH7EDj57U6J?=
 =?us-ascii?Q?Tp8iROERSwXp/TiVR7eVKZum1qXIv2FD8+va8xH7tXVa88gsvKcXEkEmjWGT?=
 =?us-ascii?Q?GCdG1lUn3Z5K3hfCLaQGRb7B6TZ2yAcsiC3RkmakF8Qynv0katrxtFadLQaS?=
 =?us-ascii?Q?fOHOFkf2TAk/Nf8Ds9I03O0/cVXyzqzxlkI8lK6QArwmRO8vUbuRKYEb4qO3?=
 =?us-ascii?Q?YmokJC7GRvkDIjK2MujBQ4MA7jhjla8BGWJZjq4lNsHSyzZ45Q4TS1Ievpb2?=
 =?us-ascii?Q?bI3tKjgop2PKPN+Hj9j7XoTdSwbTb4gIqS5BaOxKsFIA6XQ1P9c+CFkVj/TZ?=
 =?us-ascii?Q?c3g3eN6H3Xvf3hPwWTkwy1tldVC0iyHuHOJzPIztL1uPWKK9kkGvXBGqJRsu?=
 =?us-ascii?Q?jAGnumCmN2+iuyNn1JUvzYujUboAZcungmkoeHnIsRCx69qgINUduqeMT60S?=
 =?us-ascii?Q?yiTXrhiNYkT5ClEQsCAs2F8zMEcT7XI8/Z5qokMinHzQ17QNTz4X4SYcQlKu?=
 =?us-ascii?Q?6MvPH8Q+PM0CS9JqF0g5RaFk2hiEm7N8ogkaPKvgEpvWmL5t3IL04+TsJjEa?=
 =?us-ascii?Q?XmqqXpuiBbe4UlFDwvqAozZs2uYr8PLR7k+tui9XlJwvTtlIsOdAMPzZWRCz?=
 =?us-ascii?Q?lENlfXxLLoToqgiNZEaPNrWYGmujbaxtCqDklu97q5iVcDuzPwyDQNAaZRx9?=
 =?us-ascii?Q?9sMGiYYj6+Se3M1KMFy+KBG4Fp+eYhetYYqEPja+WCY1p4nLbHH5savyWOll?=
 =?us-ascii?Q?7hES8Kzjiz+oxrTN9B5ASlCSiFVjujDTqR2m9Nz2vkFUaQv7XJB30iTNCfgp?=
 =?us-ascii?Q?rQznPGivzlbQY19BibPeppQDH88oLUtU0yIdbWLQQfJ0uBmBHi4t2EL04Azr?=
 =?us-ascii?Q?Y7disVzIEreQSJJ9KeFqOgqZ+cisWMMm8rNlUbQCI8gip13UfjNrcGlAi9jp?=
 =?us-ascii?Q?wwpsFTgBVQqw7hWS5B80HDB9MrF6MkVGby7DflpyrMc0ZHPjulwv7n+btkxd?=
 =?us-ascii?Q?zLLXaWuF6mL0/LVxjAVm9Z4IPR2F65zpatpxGZ12BAybEcMVDE7u90zSZjOB?=
 =?us-ascii?Q?+g8ZGANsA8sDbIdUNeGr0LJddqmKrzSpMhWSFrQARgMzNALWAXRIJ2zUmLSD?=
 =?us-ascii?Q?MQq2+9r43N7DCvOEJWJgj3sGEwFnXx1wAtMIiwa3qQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2O120zQEYBw7+xCWpf1FXHMF7yPI2akNLPocZPwRcj94hHFVHJ8PpMsfUHOY?=
 =?us-ascii?Q?7rCt/fFyHJ09lNKolxn1Lca38mTqGQvg8LWdYnSVnddtiNzl3tvL4CPygYzB?=
 =?us-ascii?Q?rvYVt9w33clxY3WrMZBVi4a1re5Kmzn277lyPGqznZ5cgaZ1FGawjldsPAbe?=
 =?us-ascii?Q?Iab7oYNI3IwsLdQ4KG16RWXAYN/N9qCIFzGy8tdl5YRzseSpNQuoyxOpo4nN?=
 =?us-ascii?Q?eh4lW4IPFrYv+J28CMkmaRQwymIQyw3rKH5zKLefaWXlrakSBh0sXuZMdTyY?=
 =?us-ascii?Q?KAaczIA2iPLbgo1GzHObP8HbPMX/ScDNjDela98ruK25Qe+ORW9hjYyGruLB?=
 =?us-ascii?Q?fXenzhD3Za+MjRF42UuXPzMzjRW4NhlH20UF0ihTGxhCeUA+qials/aB1eUI?=
 =?us-ascii?Q?D9P80zXZZehiBqUaFx5+jNqyzKb7/okIlts0ODT/kOYOm4Aoz6h5GHILH8zW?=
 =?us-ascii?Q?quKKsZuqz2zA7F3fcKfb+KH7/IYjJQ9POPc+r1Twf27RATNYjRvVegen8UvY?=
 =?us-ascii?Q?hrXxPbQstBhXXhIYiRkPsgR8RTNpZmH/fnySnC3Snjzn+MgUdYocHVGP1Q1i?=
 =?us-ascii?Q?f3LI7kEIhPHnkFlEvfpz1EpGNiGSszljZK5Y/gB5Y15uPnOpCt7sWRwdaRRi?=
 =?us-ascii?Q?HGGlTZjn8et5JsDSrn5r0kHoPqFnNznuhe5VTnLjUiC6U0on54BzbUpUVdzZ?=
 =?us-ascii?Q?Wy17YZv10SgYMruV2Szm2HqqL2FvHr9dyHai3vPnkCAlYElFZF6ULwnK9bdg?=
 =?us-ascii?Q?Hq5XzJ7IhrqH9eoZx+Shf8cUh74DqspDcFj9mA781m7eXo6t8z9p4OtIAgs4?=
 =?us-ascii?Q?xSoL37SnYcD6f5DJlVV4GnbCqBCn8YlwkrUAAGwnK/umW6dDX5raCLR6TVaM?=
 =?us-ascii?Q?E9iFd7t9QVPsUqDRhTo06lqsK6/MgXSZv8KmEYrvYtSGMHtmN1pKWQxFZR9o?=
 =?us-ascii?Q?WoU1Hw14RfVZcZxfhUVRQirYZBwfcBIaBELiB5DtPzV1zaBMJ0HfGZer8eKX?=
 =?us-ascii?Q?LYsQ6WEO5IC500LfcjknJLLQGqQ+GKIsLn4xYm2rAn9V1/dD9qusTo2jO4Lr?=
 =?us-ascii?Q?n0jLaZ3LFGwpEQu4j78e+2c9KiOdDgQJ7dJoLho9HCV6Yn3jDIh0eqdq1+aT?=
 =?us-ascii?Q?m387GS5NOmd2917bZYy480D7DveJQrMpcQRJTyVHhNsquJguiy72YPrZPav+?=
 =?us-ascii?Q?DDCCn4PXwL+1CA9THnsrhKmrf+dr6WovKrXjtFnpW5ATjyj8rw/w37YVSLue?=
 =?us-ascii?Q?kDaEHgYIyyYiHe7TjOjksNanv5B6B6VZu1W8NnpUv6jnDbH8Hld7Gefv/V02?=
 =?us-ascii?Q?9KNyCTGlPuw4sMdkb5aHQOgabplAmcXZo87VByMkl08XIA8ZCE4flSjQHbRs?=
 =?us-ascii?Q?0OWpACQOaTPBcrLMJjgyrKPNEb7vlkeRDhNyXeloqEa+6rliowruhwnXv12G?=
 =?us-ascii?Q?dNfUKdxOYTIbCa1OLpJRPrY4v7Oinjb5xwEboaQm2mqTFK7H17Dg6DWIzvFz?=
 =?us-ascii?Q?8yEjeZpeuRYg3z6H2L4lPQHlxzDPcgNuZgqBmKD9Im15Aiu6nuf0/E+dTYVb?=
 =?us-ascii?Q?byCilco0VKETO4H32vXjOl5AhPhTxQYxi7MHBpMMR46JDP0SwwA73mmATcla?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e19b37-53c2-4045-8849-08dcf139ca46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 19:02:48.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0pAzpSCqLLVGUcXVzDKrMx9RQW3PXFUe5zmvNgAKVx3rYUskYH6ezAPpEdOuM50brnOgJAcpRTxf/tEcXRQ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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

On Wed, Oct 16, 2024 at 11:59:32AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  TTM shrinker helpers and xe buffer object shrinker (rev10)
>    URL:     [1]https://patchwork.freedesktop.org/series/131815/
>    State:   failure
>    Details:
>    [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/index.html
> 
>  CI Bug Log - changes from xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519_BAT
>                              -> xe-pw-131815v10_BAT
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with xe-pw-131815v10_BAT absolutely need
>    to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-131815v10_BAT, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
> Participating hosts (9 -> 9)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    xe-pw-131815v10_BAT:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@xe_live_ktest@xe_bo:
>           + bat-adlp-vf: [3]PASS -> [4]INCOMPLETE +1 other test incomplete
>           + bat-lnl-1: [5]PASS -> [6]INCOMPLETE +1 other test incomplete
>      * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>           + bat-lnl-2: [7]PASS -> [8]INCOMPLETE +1 other test incomplete

These look related. Any idea what these are about? Should I continue
with my review or do you think another rev is needed?

Matt

> 
> Known issues
> 
>    Here are the changes found in xe-pw-131815v10_BAT that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>           + bat-adlp-7: [9]PASS -> [10]INCOMPLETE ([11]Intel XE#2874) +1
>             other test incomplete
> 
>     Possible fixes
> 
>      * igt@kms_frontbuffer_tracking@basic:
>           + bat-adlp-7: [12]FAIL ([13]Intel XE#1861) -> [14]PASS
> 
>     Warnings
> 
>      * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>           + bat-lnl-1: [15]DMESG-FAIL ([16]Intel XE#2687) -> [17]FAIL
>             ([18]Intel XE#2754)
> 
> Build changes
> 
>      * IGT: IGT_8076 -> IGT_8077
>      * Linux: xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 ->
>        xe-pw-131815v10
> 
>    IGT_8076: e511df10a1201d0d83c03ccbcabc3d57191e5f8e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519:
>    12e4970af1ecdeb76e94df2daf51a9c3d6b9f519
>    xe-pw-131815v10: 131815v10
> 
> References
> 
>    1. https://patchwork.freedesktop.org/series/131815/
>    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/index.html
>    3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
>    4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
>    5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>    6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>    7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>   10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>   11. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
>   12. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>   13. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   14. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>   15. https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>   16. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
>   17. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v10/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>   18. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
