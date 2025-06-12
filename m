Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0B9C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 05:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EA410E188;
	Thu, 12 Jun 2025 05:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3XobXR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134C910E188
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 05:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749705615; x=1781241615;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NJO14QjufyqFy0F0+kDT18o4Rbvm5YhtIOKWQPZKuvc=;
 b=j3XobXR1q7gqL1YfPLsVLYtFSSdrNJ3DJmCg+epiWkqBP/fd1Gy3d3YJ
 gHrIupJdeA8NlQTnef37MSsRVjB3TZW8mofsWfFAKqWjqiG93CHxi6iZg
 z676/Oje0sucY59wg0TL/NrBRfddcT6unZ2fYbIJUK/X6YytbHpPqxNKl
 UezIzdG+YbJXR7se/4pU5e2kaK9djJjhS61jWy6LXx6b9VhHMUjSVByK5
 q00ZVXo+e0IkNJ1x/s64plD1wbhY31hNBKsoAbOAHleApt5hFhW+RzHF4
 cOv1Eo9v87owtC9RBVOl4tGQCq/hyAX+N3zMvAdtWw1nOkA/iCiUT/gvB A==;
X-CSE-ConnectionGUID: HkHzWgwvTq2WfQrdRQx4FA==
X-CSE-MsgGUID: SgDMrrzBQiSoV/och67ORw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51967635"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51967635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:20:12 -0700
X-CSE-ConnectionGUID: vYyWxuXaS7KU7fvRpw9rhQ==
X-CSE-MsgGUID: ecPN/nPRSFuHibFbuXF+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147899864"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:20:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:20:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 22:20:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.86) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTzBHriPS+TP0swQxf2ERKOycMSeF2gMpo+a1aB2KCOXQr1X1G/9O16X5V1QVqTO88QErb/Vbzu+pPv6CxECg3oSfndLMylP5jbpvrvSGej35wl03mF1s3XrWOndLbobAv8qrEX1bxetq0gBDAU27DhfNGm0rORkZ8KEIN97D2ZIY5prvojniWMsUj4q6LcMIoBpJX46/IzrGjKPgbJpHVZM5C/gfo4ZZh6Qf4sQZBLHv38qGhw7FpE5rBxi6MZblHNy0N9xFwPn2xW3SU05tJVLYpk9FdIHiLPzeDVsjqB10Z4Oco22nJxFezZPYiw8GTk/UfA4zNW0DzaSDhXCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbRgc8B6ZBvQXwwDMv+GuHSRSlsMljL3aQqVnh1JN7o=;
 b=ohfkYBmtp3qd8KLAT9enAGuWQ+68VemR5waZsIA77Uu7pMkV5nitHO/fa1ICi2Sg1VibnPlzaKWxLtnw+InMK033vYcRwX+6UHXHjdLTVip7SOksRcN7/eE2NvxVk1Xf3JVyjf8HMBFKZjaeu8Dce1cShgT34uOPt7ueacVoc48E04T+3slvnA4ANQcQ+vHBXPXn6rB6SwtX81pAcpBub3t+7E2lklgsQ/Z/pypMO86e1J7g4cqr/+dvzoeeM+TvjWDtt4KCNXNMaYDw7KUIMcVImztGncHgXK+fE+ZPttdREdWGCcRXwwLJIh0h3a7KMlYlMm8Y8RuaPpbN0q/1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 05:19:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 05:19:55 +0000
Date: Thu, 12 Jun 2025 00:19:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Make WA BB part of LRC BO
Message-ID: <h6entkmzc2eslbo2l3ydqgulwf3jvnabryrerqqvyny5hwhykz@izxsvlciq4g6>
References: <20250612031925.4009701-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250612031925.4009701-1-matthew.brost@intel.com>
X-ClientProxiedBy: RI1P284CA0073.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:152::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ea380d3-2234-48e8-3b9a-08dda970c468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ewDIMNBXkeHZe8RCCYOobI+/sfh5ggsD7Q7wiQXyLdsFENXoqDTTDHsKzrO?=
 =?us-ascii?Q?B4H9dCGilh1x4sEk4v8qk3FQ13PmjiNxGv9qPyz55N99zlyDkWEi75j/qr36?=
 =?us-ascii?Q?fnppuK04Nm+zLsyVVCoRJ7QvswUoBsW5a4T6lYihilGnfocvMMXEBqT7YFDu?=
 =?us-ascii?Q?5saq1A+TeKZKbyTV7fzpwoxG4ip+Ud1+zZR21Nj5vbA6Tv0wFFw+bgnWfkff?=
 =?us-ascii?Q?HmIlsRVeI+yvH6Ov//OTujNpGjS8n7sW0whhEeZzGpavxRBKbTR9KGc2xMVJ?=
 =?us-ascii?Q?Md314XxpDl67KLFH9TRdK3kliyt+VT0aajgHrHDQBi+FhKsivTJnFlDS09fx?=
 =?us-ascii?Q?7s9IwnIFDFO9XpNI/bog6zl9mVpvG14Ayi9ND9DaFEuzWxP8Jgg02eFlc+Ip?=
 =?us-ascii?Q?LCObjIFIIO2KUuS4b+H7FY5pWzdfwpnLkD/rbDv7AKPylsvF6A6CdXC3yXz1?=
 =?us-ascii?Q?qtKmYZ1qvjLBZ1yOz6q3iDQlszJvFW1HWo06RO1L7Mn4/MAnEuAagel9898U?=
 =?us-ascii?Q?CtJpkxh2QbcCTje4qc51PP5hIA/GiwcBj9wSvWviXU4uvO09VBMymaDOFsiS?=
 =?us-ascii?Q?8FobJy1OdqIpLZbc0dv9NoCmNfX11YgdL/meY5xc/8jAv9jZ8HvLh7vAgnzo?=
 =?us-ascii?Q?hufaVtlyg7YxasmTssmkd+mgvjBmc9LPGmLUrNEKdPpjfeYiFxgpR6egnhJm?=
 =?us-ascii?Q?4zH5OP7fBDgIEWn9TAji2qIzHhWzPMQN5sLOryDnMMkE31tKoTPV6BlH1Zc3?=
 =?us-ascii?Q?/62bZdXTnUTC9dKHaVu+rQ658xwksF1Pp5EkzA7+08mLlry27J8hZSalezns?=
 =?us-ascii?Q?0ZN+p4ezvoRb42mAgjw6GEExSrzsPYubTAutCuvxvpo1cSbJ/lms3Fpom8zn?=
 =?us-ascii?Q?9rcxZ/OcctU3M7cQE1qkMqlZeVpb2UFAUZVS0PYiWMQnVlykgo/jRQ+eMZFv?=
 =?us-ascii?Q?nzk85Ar0RT5FYrxVBEL1W76IsCiFSC1cNgFsbIMlcUK/jF7+nEyGMqoW9dWp?=
 =?us-ascii?Q?X6pBeolgFF0raK95bvClsDZpFT+pHWhGu0XaMOJmiiADtyVp0yJEwrag5DxU?=
 =?us-ascii?Q?z8/5+gzBCtIsIXfjaalpvHVViiimDAPSW6cIUOascsQNP5wTosA9o8dmMp4B?=
 =?us-ascii?Q?JB1WGhMoP5nQzigApkIoj17aXSrMAaV4bGMjIiXiZN5F+qGAutP9U4soFSuC?=
 =?us-ascii?Q?fj3rrVdWA2wRaay+CKgADwiVsUtEGe90KR9wT8KSdu44SNeuq8IpQkOSugfs?=
 =?us-ascii?Q?uLl12FO9M0dCSErae8hq0oSXDPlIqEzpM41UzEs2vO27Rc5TtaVyaqDTpcVg?=
 =?us-ascii?Q?hI9MFkrfo5lVCFg/BBtdcohUgnQotnaxY4Q2I4tKFHEvKFOVUarRmRPZCO6M?=
 =?us-ascii?Q?0WGh66P6+JobRMqORYDQxRIMK5Z6LGTKNKRVt0UfJ0Pk6Xzgbaa8zsGjLM4c?=
 =?us-ascii?Q?stTcSxh4mtI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x7Gd5ozTnG7SVGCytqjYISyUDFZ5HDNTUfyFtRCHLFWheNUbRqBJyLX7Ivs6?=
 =?us-ascii?Q?qP5lOlHasunOjs9H1lnfqmG5R1vzYWMIN3sFyA7ia3c+DqbpWuW5l1YI0sGO?=
 =?us-ascii?Q?CCk0h2qc1NztLy2ffDJQ0iw1R/Z75XCbwNAAoEDRsqaJ9m3WJDqkqEXk1kVi?=
 =?us-ascii?Q?btwSrouVu0HCHd+0L5i+esFEFIAP5nz+lVKB3PiKdi6miXW3jio0POdj1W/F?=
 =?us-ascii?Q?z1ym6T7eJLHpX2ByvhOqWnYAv+Qv71zQ0cqlpvu4mjPXqqcFJr6k+zL/93vu?=
 =?us-ascii?Q?WKYeE6/l+jmoe0jkL9h4q/4GqDGplmiP2/KYWBwiGwhd2ToED+1fYvLvTUCM?=
 =?us-ascii?Q?4GPNbyC29sE39bEHNv0K+fAdcuRKiEhJcsCvokKv5pFAwsm8jFpzJw98Imze?=
 =?us-ascii?Q?a5MVbuppVGnE+mGEK3J5sHaoca6NR0hVelPtRAhzSuyrxN0wqUKU2yfxuEhx?=
 =?us-ascii?Q?FK1LRUVtRvmLcAsED7kCYQDQCUQa5OayEkreCf6e7ujYoWlainEPaeFxTj0n?=
 =?us-ascii?Q?GyuupPyEAfRzug4J5cUGIrcuEQt94p3A2O5YxuePCZgn5woxBji6CePFyDSm?=
 =?us-ascii?Q?OzpPvJ6+SrWZuSMaImnSAPr48deWIXy3fD2ocfri72rv+0re0/3d8gn6/hsn?=
 =?us-ascii?Q?M5Do82nsh6WYwTIDY9/Orkg2RI/6Q4bdrSRovhy2hNWeoh2h7vFvALC3P0nN?=
 =?us-ascii?Q?lQCniPnj4EUnaN/T8waiz1pTf2PZis5NRIMvfO/NnChXLi8zlLlNvvLkuDkE?=
 =?us-ascii?Q?bXRqDQXc5lo0jOMJbe/hsEoGBY6P5Fbk0B6oPMJ/umiFF9IVmvxHhlR9eH9M?=
 =?us-ascii?Q?lAE7yxHdPuG9WR66p+S2+3Uk3xkHI1KQO+szUw8qfHQtGHY47iUxRJfuR++2?=
 =?us-ascii?Q?/ew39yggXOwJplI36fCEnEgyrM1yqcip7qGkiM28E2pJyboNTccZGKQQ9AD0?=
 =?us-ascii?Q?blxsZFZgqPx8VVdasXWMYwy1RzxkgDedSRzMKGKTaTDfmaSGVTAtAx4HA2Wq?=
 =?us-ascii?Q?UQ+bq2W+07WD0dYu+5QSf2TR67JTOEtImZoBYXDm+0cco6M309VskyQs73pX?=
 =?us-ascii?Q?xMMCYaBYxXWKoKlSFLHdRWqQ2shAOh6ZaC5HUwFZp1YxakX8TMBroQE3T+5R?=
 =?us-ascii?Q?36bnw57++j6eOyp6K6jXwTu47muJQBbB/7mYJdPot3qGYrkTfF/6jzZM7zwB?=
 =?us-ascii?Q?sE/9JO+Db+6oMKEduzvp2aod14vB5fXq55OzaAflsrDtmz+VqU7FFAUxhL9B?=
 =?us-ascii?Q?sJ27iyYiXxx0x4LcWeRaqEZphz+tyWJYXx7+8m5lKkB2vkSnXwiW7t5FcgwS?=
 =?us-ascii?Q?MHi8ReUDuRo6kvzQYhbAwRe6b4xt3YXKy//kHmtPW9i0cu5BL+n5Ru4TZ2pI?=
 =?us-ascii?Q?VgtcTRE+Upnf0k0bvNg0uFabkRaFid+5jlwapofu8Vu9KSpb0vZSvnFz3g6e?=
 =?us-ascii?Q?DZfyOe4p7lpJpkXDS+RVVRhI69/TWtQGoXoxf+xhdFGpjqUXkSeh2iHK82Gk?=
 =?us-ascii?Q?B6yiUmIPjdK+5KZaUXmcOfaRP2T6dWzHxcKsOhLqzbyZ1ogZ3cbYiqQDfRp7?=
 =?us-ascii?Q?VkU6sHD/RLCTudO6ue2lTwz+cjjFNzSb077qFa+VyyJqt/Lpnzw+wr18TFbD?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea380d3-2234-48e8-3b9a-08dda970c468
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 05:19:55.5005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BuhyEN2KsDw2MadCnYy2hGzOyhU/6U4AglmNPsgOiBdIEFDiIO+VGwFp2ZvuxbvcYsOUjYXO/GYDjRZHQVZRaalIA/midOlPTt68xueaZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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

On Wed, Jun 11, 2025 at 08:19:25PM -0700, Matthew Brost wrote:
>No idea why, but without this GuC context switches randomly fail when
>running IGTs in a loop. Need to follow up why this fixes the
>aforementioned issue but can live with a stable driver for now.
>
>Fixes: 617d824c5323 ("drm/xe: Add WA BB to capture active context utilization")
>Cc: stable@vger.kernel.org
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

As an optimization, I agree with this. And it's even more than half way
through the other optimization I chatted with Matt Roper about the extra
allocation we are now doing.... eventually the additional 4K could be
part of the empty_lrc_data() (and thus of lrc_size) so we only calculate
it once (per class).

However there's something funky going on here. Why aren't we able to
pin the second bo and use it.

code here looks correct.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_lrc.c       | 36 +++++++++++++++----------------
> drivers/gpu/drm/xe/xe_lrc_types.h |  3 ---
> 2 files changed, 18 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 529c6a972a55..a875b93697a5 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -40,6 +40,7 @@
>
> #define LRC_PPHWSP_SIZE				SZ_4K
> #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>+#define LRC_WA_BB_SIZE				SZ_4K
>
> static struct xe_device *
> lrc_to_xe(struct xe_lrc *lrc)
>@@ -910,7 +911,6 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> {
> 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> 	xe_bo_unpin_map_no_vm(lrc->bo);
>-	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> }
>
> /*
>@@ -973,22 +973,27 @@ struct wa_bb_setup {
> 			 u32 *batch, size_t max_size);
> };
>
>+static size_t wa_bb_offset(struct xe_lrc *lrc)
>+{
>+	return lrc->bo->size - LRC_WA_BB_SIZE;
>+}
>+
> static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> {
>-	const size_t max_size = lrc->bb_per_ctx_bo->size;
>+	const size_t max_size = LRC_WA_BB_SIZE;
> 	static const struct wa_bb_setup funcs[] = {
> 		{ .setup = wa_bb_setup_utilization },
> 	};
> 	ssize_t remain;
> 	u32 *cmd, *buf = NULL;
>
>-	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>+	if (lrc->bo->vmap.is_iomem) {
> 		buf = kmalloc(max_size, GFP_KERNEL);
> 		if (!buf)
> 			return -ENOMEM;
> 		cmd = buf;
> 	} else {
>-		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+		cmd = lrc->bo->vmap.vaddr + wa_bb_offset(lrc);
> 	}
>
> 	remain = max_size / sizeof(*cmd);
>@@ -1011,13 +1016,14 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	*cmd++ = MI_BATCH_BUFFER_END;
>
> 	if (buf) {
>-		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
>-				 buf, (cmd - buf) * sizeof(*cmd));
>+		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
>+				 wa_bb_offset(lrc), buf,
>+				 (cmd - buf) * sizeof(*cmd));
> 		kfree(buf);
> 	}
>
>-	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>-			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
>+			     wa_bb_offset(lrc) + 1);
>
> 	return 0;
>
>@@ -1059,20 +1065,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
> 	 * via VM bind calls.
> 	 */
>-	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
>+	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL,
>+				       lrc_size + LRC_WA_BB_SIZE,
> 				       ttm_bo_type_kernel,
> 				       bo_flags);
> 	if (IS_ERR(lrc->bo))
> 		return PTR_ERR(lrc->bo);
>
>-	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>-						  ttm_bo_type_kernel,
>-						  bo_flags);
>-	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>-		err = PTR_ERR(lrc->bb_per_ctx_bo);
>-		goto err_lrc_finish;
>-	}
>-
> 	lrc->size = lrc_size;
> 	lrc->ring.size = ring_size;
> 	lrc->ring.tail = 0;
>@@ -1860,7 +1859,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->seqno = xe_lrc_seqno(lrc);
> 	snapshot->lrc_bo = xe_bo_get(lrc->bo);
> 	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
>-	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
>+	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset -
>+		LRC_WA_BB_SIZE;
> 	snapshot->lrc_snapshot = NULL;
> 	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index ae24cf6f8dd9..883e550a9423 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -53,9 +53,6 @@ struct xe_lrc {
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>-
>-	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
>-	struct xe_bo *bb_per_ctx_bo;
> };
>
> struct xe_lrc_snapshot;
>-- 
>2.34.1
>
