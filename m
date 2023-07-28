Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD88C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 16:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA6610E1AC;
	Fri, 28 Jul 2023 16:50:06 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFB610E1AC
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690563003; x=1722099003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rFvLp36nvIVe+79BSLNdSOo38r0cC/JIpByQswTP+zw=;
 b=O5/ygc5cjOEpJZKUbZ+qpsLMSYzt9NKTv+4nlchpnP2jjlzgKA5HuzGy
 BXgEulnehm2Q/ppUO8JkF0+49aPuaZ6tNcUHTUvWNm+MuLAMzg42drP9z
 DcZGBX8V6duFIU1Z4cZFMRDiqADZHCey4Md7YDFXp0PxZHG4qUqF0GIij
 mORhTVBP1+ihKNgsy4MSB4gtcIzN7EBNEhf3+IMPmZ/UUwE7IzbqcBznp
 xtRFs7DQi075BLy1zO2SlAF3ZQK8NaOpfyCOYTUh9DvHdz58OLvMI/1uH
 Md34Tz3OrYMfNbX1xVPNxpc9HsIKWv2S6iIHydIlTAF6os9qDCJqh2CuX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348236673"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="348236673"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 09:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="721320782"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="721320782"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 28 Jul 2023 09:50:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 09:50:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 09:50:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 09:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWdWOJFtGbTYsiNB5V2CU05/GltyryJa6gS4tXN1WYoRfGjHubv+FlVpBO+iTPK9pXZy6v+5JevDk99JgMJxX5OHVQxfqaHQ5lQxLMKGk5mWBYGMraq8fZvpX3+bC1nthqslhPkiFxv/Dcx1+HBv8E/NldSNJ5RNwWlKhP9jff7AUr5MjXmWkiV137/jaUCMD859+wkWtPiQjHgoQ6L9ILLKECj+p/Nzal2ThdnDq9GdkRyb+Hb+pkqErK+ExNW9CEWRhMEkKJj4WRytfWADal+zqOFIohxIuiN1DlE7RQ1U6gyzY23vG5lNvrD3LNHHBLWlNyP5gj3QYk0U9ptSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8V2AfRacNQCBTPEkxmvB+5hq7qkPVZ25AtwEsvC9WU=;
 b=P6ehVrEQKJ2m0fLXdTQ3HDTZWDTvPmulqMqVT0lW16jlMqBmAjOgjfkXmRYYAKweT5RlkRWbGFKKQiEwrR6VXT1hlmCUa8WTrIQ4M2AH3X0f4aeAhRc1tSeMexZMgmYoSOHVsm1GzOnuRqyU1qjrQkTKr5REVpVnfzRzy5xfVV4RXgccSjo+dowdbY5HaQ5sx8uosAW1U8hLTseevQXeu3PdgK91kHq2kPP9UQe5Ql0mNSJUQjq51trndRnu2DHhLiNzOwrH7qkaTZzm5BWHam9+/VrbV4ftRkA/Q84lSe7VLqc/ZGbTRhhQA4/yxXgYGQPaWl+w8QIQzWsWz/JA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 16:50:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 16:50:00 +0000
Date: Fri, 28 Jul 2023 12:49:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <ZMPxtBs6T3lODcgV@intel.com>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
 <20230726232650.3873897-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726232650.3873897-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR11CA0075.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 157676fa-355e-4035-aa08-08db8f8aaec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvbqcShuyL6TWX3Hf/gvOm4ASnf8mY4uSUh6u0fdfoBeZkGBOzfsNeaRX8AH2AXlLtKDGuy+flRCV5FCL5ldHwIKMdtgdGFapH3v0Oa9KUOYn+UgCk3b49Ydixpefi/VFU42IK7O4C3jYXuar3hHrfZr0WeYc0OpqV8MKfney5oQcFiDGikqmhH7kt8gM/fWqL7kUSVpvdJgkEDG+AHSpfKOi1TT9npc6i/W6duYwoPX7GM9k4vFDzafdnQ/cGxZRfIH7Os0zFcfrNBEFJYRwHxwo3o5S2vsdYd7LlHOpQILQngmJ/purnZiPVtv7hfFYSzsJS/XvL559TB40CKg4S9Mygt2V576uM+K3vdfvqT9fprNq7URh7oKnT2k4gCdwwgZ6kA5XVkelRualIxCQvu5CPEgnVoZ4GjxDg+hH9fI2Be7KzeNbIvOapjku4Vr3M7bIOJScFerC5NXDHzg84cOyWUSJRbdheBeSQQVS4Bts0m4na72CpeRMqAm/yQwAuNQqyQo6rnnYsyJVV51bPy6hUKUXBa25EUWk3NPbBUCq4D/OHpeM94Qflq/3t9R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(2906002)(316002)(8676002)(6862004)(8936002)(5660300002)(86362001)(44832011)(41300700001)(36756003)(6512007)(6506007)(107886003)(26005)(6486002)(478600001)(82960400001)(6666004)(83380400001)(186003)(2616005)(4326008)(38100700002)(66476007)(66946007)(66556008)(54906003)(6636002)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?biSPWwPeWg1YJaYZUac+Vvb3xzeTrsfMdVoO79L+u13Q+Q9ejYYKBu3Uv7oO?=
 =?us-ascii?Q?ZAGJDl1lHBeNkST4TtJdZvSdcKscN7mYL9sm/aaMM0h/jdGJbl2lfKB96z01?=
 =?us-ascii?Q?KBZIEDcjXPisdd7GeU3a1CynPWBZpNcKomnN7EhQFAsb7giYXMz8+ZpJp9fq?=
 =?us-ascii?Q?bGcOb6Y33rhroU5Wqa9F6QPFF4fr3YlUdsRPcnJbKojjOSPd3KhEjbTr5ACs?=
 =?us-ascii?Q?2j/sOsc+aPrepMiKTr48ex23bOiza7s6AyMA9N8/HZRfbJhchEQCMw2ZTWe+?=
 =?us-ascii?Q?0g4aIZOz+Pgt595ltVenHsX/xuiUAdVJ6IcsXPXlz+dfLg8P/LPev5/kUQL0?=
 =?us-ascii?Q?LZdUv7ewrlJdJdKqXEqwbKXpXEzjZLhO7J5PhheW56pDuao0NfT7uLp6QOgD?=
 =?us-ascii?Q?DW9oLSamOOUDyR7q4eKWDcKS+pAED4UUL+z6kOpa7Mgr5yh+hSZFLp/1NlBV?=
 =?us-ascii?Q?MbCedLgfQfV+2/uy52TObduccftFBjIjxHqzbZ9LuqDedVrIluu9c2BOEAEh?=
 =?us-ascii?Q?X3qnW/cEsjIqKoa7X26OYrPk9k2ZSMKNMpIchV9B4yjAryzTpIEb87Q6dg24?=
 =?us-ascii?Q?s0Sz26k5zfM+A1xpnX8E46sSn+CuYcXRxANDSv+9cOvTpPyEygrIXg9QmzXv?=
 =?us-ascii?Q?TERCWMYu8CRguWoIxQnMT+JacrqAKRr7NYAaHM4fUr/Ntp2hctsgckfF/QXZ?=
 =?us-ascii?Q?SaovByyf4Q3WfIM/VGMv4byrMbtkBHrJUyY4i9n5KBbxImDRj8q8QnqCFA1F?=
 =?us-ascii?Q?PVPmSSx8VX7BNfK76uqhZlLzEfkJrSanNyXU6Z/DybWp9k43bUlQXD4QMh/v?=
 =?us-ascii?Q?qFJ/N1AZhkUHtqNOMy0XEVKPlUhPicbQRkjFzRxxT9hecUXTfmjoDDWLbBGX?=
 =?us-ascii?Q?GklXvxEPt+3hU7NgUUBGCWQ+3irr2KppLRQdh2sowAMH515JCz92E3rH9c8v?=
 =?us-ascii?Q?Cwafx/G3W/E1INn8RRw7SZAIzpJkCbCE+pChoUMeZW+KTSQItOyn/eknbAN0?=
 =?us-ascii?Q?2C2HxP2SWJpOOxFTNtQLmbO1dbBC3OxNp7xeizxTi42Wj22t/E2vhjIuxrEl?=
 =?us-ascii?Q?VsBCrisIwYoXLNWWLKAtnkf8VxVP4/2veFAjmcCoU3zZmTAkbBneoXhLt3DS?=
 =?us-ascii?Q?kldPzaZe3RIx6pkty2NyXdVkocFSD0ASlbc5zQjJSTJNRjYUsM/dcFqyumHM?=
 =?us-ascii?Q?SbvCjGerfyRwwRqMd6gyoQc81HrZZbu7fvBPqK73IqpsJzCtapCOYJeeWx7r?=
 =?us-ascii?Q?J0bPSO/kTI6u0PjRDEHhnm6RlwwKzY/PqVF6Re7g5p/dbGd4rgOnhzMIhwdU?=
 =?us-ascii?Q?UenNfX8k4dFaTPVZLBZeU6uiYHZuv9Qr9HR3i1J5Ldqlpm2q0wAxG+JrXTD8?=
 =?us-ascii?Q?bcrjs49hlVgoaRjAzNW7crWc2Rzob9sidpHv8VN85lm0lKIUf4TS5cB7bRPI?=
 =?us-ascii?Q?QZD4EuQ/Eggw0rvennTIUxQ5MBr3R6W8YiWIcmjdonpc/qFsH1CWzy00IbI3?=
 =?us-ascii?Q?7kW4mmEvDXzpkxpv6MDpZZyVNRuAKVpfSDjlSvJk1ODtw+TOlVwVsnlTTRm7?=
 =?us-ascii?Q?JOJLgYVL1V06Y5N7TQUnM4IUjslbw7Q9lWTpNRcv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 157676fa-355e-4035-aa08-08db8f8aaec1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 16:50:00.7466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00WToNFyEqBvHnW2NkqE+YeLWpT4sl72X0UBtzvFpHwlnRWWi/mgqXgxNCFpndnAs2U+3fQZ6aA1atrN+2YYaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v9 1/3] fault-inject: Include linux/types.h
 by default.
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 04:56:48AM +0530, Himal Prasad Ghimiray wrote:
> Functions should_fail_alloc_page, should_failslab, and __should_failslab
> are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
> bool and gfp_t types, which are treated as unknown when
> CONFIG_FAULT_INJECTION is disabled because the inclusion of linux/types.h
> is missing.
> 
> Fixes: 6ff1cb355e62 ("[PATCH] fault-injection capabilities infrastructure")
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2:
> - Add fixes tag (Badal)
> - Rectify Cc. (Lucas)

and now you removed the correct cc folks..

Okay, so, I'm pushing this exact version to our drm-xe-next in a hope that
we will get this patch sorted out before we are ready for the first
pull request towards drm-next...

We will later remove this patch anyway before the drm-next submission and
only add as a topic/core-for-CI if still needed.

Himal, please continue working with the community there to get this
fixed upstream. Resend the v2 standalone, but without the version history to
the lklm and to the maintainers.

> 
>  include/linux/fault-inject.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h
> index 481abf530b3c..f83ab2b6cd08 100644
> --- a/include/linux/fault-inject.h
> +++ b/include/linux/fault-inject.h
> @@ -2,9 +2,10 @@
>  #ifndef _LINUX_FAULT_INJECT_H
>  #define _LINUX_FAULT_INJECT_H
>  
> +#include <linux/types.h>
> +
>  #ifdef CONFIG_FAULT_INJECTION
>  
> -#include <linux/types.h>
>  #include <linux/debugfs.h>
>  #include <linux/configfs.h>
>  #include <linux/ratelimit.h>
> -- 
> 2.25.1
> 
