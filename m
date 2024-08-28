Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475E5C636ED
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 17:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE02710E00F;
	Wed, 28 Aug 2024 17:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwgY1Fgu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E40C10E00F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 17:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724865412; x=1756401412;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8G/efhH5t5uENyNDC0AaI7Pni+pqVIcIVV47iwnfOjQ=;
 b=dwgY1FguqQJhGrMxYQX+j027+mTdSiLf+gK99REj40p5Trskv+GfATeM
 lS5lQdbaORd/d1EeKYL+n0enUPBXKggMin8YtRb2DHhf61lgDmnAJgy/D
 wuYpXdAA5gIsADoZrouJZmgZBYPbDZKzucw7yjSFylDHIpZ9tFMVvwCLP
 J1xe9Ie4thYwc4ehz/dECyu5mo7W3pRazFNo4oVE/ol7T6mpOFArocXkc
 OJiuXxNtjUj6FlISWW7YZbIwOeUjDV77oDRHrkQWCMToG9/agEi2mpTS5
 PihYY+jkgVSHhJ2ch72lfa6l/ayeikty2QhiAmz005N3si5WD6BUUJO/z w==;
X-CSE-ConnectionGUID: F8FgZ2OfQKGxR7HUxlXMzA==
X-CSE-MsgGUID: nSEzdmmARuuJdHhQ339Tyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23220695"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23220695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 10:16:32 -0700
X-CSE-ConnectionGUID: zyTwtoCZTDWbcrBQUJnwqg==
X-CSE-MsgGUID: ZpnA6Pg2Qce4pFbXwa47Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67653863"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 10:16:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 10:16:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 10:16:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 10:16:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 10:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOXTQaWTQPMoMzM8ihC/rKE0O9gFaTGVt+LYdoYMV0DSjz204iUdMf4qy23EVlJD3ZZhmhq7Znu41lv49btigqC/2dC3xA3ZkBLlUk+VGpP97LgzZloE6UwSqFdn7U35+C4YN6ZXYsyNNMVLsbDVJGkJNIddbeq1V7HE+vT8vxlz6WAdTur2dJHfyBx09ZF+fqSEIGCtFM4TxqjcywcnAcXcR+A8p5pPHXhGPzCLhmxtrUR6doAraZj+/vDjmBwORBEJVLZ9Un5N3LB3JHjxMd1RVKrhqDiJW0j/SGKxL7sbgfZ2we7G9/l61sHmNJ6iavbjLhCY6OUW73bnmRUD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPd59b43lGzxphQFfcyAUBHbjRWJKmuVrERgMglG94M=;
 b=rKKhqp/WEZ8M+9RHlMyUOwlWc8yalkCXwNJd15kunCt05MnKb5GROAhGGfxO/TOuBTzvdN67c6h5KPV8zHgtc+h1vPGyK59MGTqh8+/6xg8jEdUiaFtW3xG0qap6cCNt9LlZQj9XQfnxY7ontuiUNtylmJJQxzL8s6Rt1fRU1JW70qBfk95FFIzXkv1R3XQnP4Qa7J5RQZ6HhBRPA3zEUWp4OO33Jn+VFrn+7m6kVL7sSyjzXd4tUUNeSObqFO53lRy7Gf6+7BIr4tA3Ilpt4G6SxcxeKdk2t2Hk4p9BlLlsk/GRXmnOuXJYcHxhJOTPecWZsrK8KAcNEwsl88d6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 17:16:28 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Wed, 28 Aug 2024
 17:16:28 +0000
Date: Wed, 28 Aug 2024 13:16:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix NPD in ggtt_node_remove()
Message-ID: <Zs9baD_hxnZECRkV@intel.com>
References: <20240828092229.3606503-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240828092229.3606503-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:907::18)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 5240c24e-5775-49a9-09fb-08dcc7852711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5EBjV2ITuSo1XA7iBMzOEW7X/N2K44ld3BMpduTW78Kl1b9cVK5YGY9o9/UN?=
 =?us-ascii?Q?DkzqYW9EXHgG58dJ7Cglx97WDA7QCDFk2j/wGrpI6+IMeOtWjuj3QkvVtJSJ?=
 =?us-ascii?Q?tCdMAPa/sI7o6MVvOdOVcS5V4pf/kdSARS7RBQP55ohUuboJ35oK6JfqeK7b?=
 =?us-ascii?Q?ZJuKhq9jly4cgIy3ZwZ8LV57axoLj7VeWS9BwUlmKuemMlXEPpPOGvNyElXT?=
 =?us-ascii?Q?Q1YlaT9H9Kdy5BmC6v7+Ov3q5BGE96E/rF42pgqTXlSYUgMFsZ56M6F46ZPi?=
 =?us-ascii?Q?SvCHvmAoWDU63dqGeaU5YlwIoIExWDslVcPMrEPw2AYuqJUlxJ7xuBPfu44P?=
 =?us-ascii?Q?FYeKw/vcLnZKt5ZOmP+T2tHiy8U5FZyUhxmncYt0yAKflrj253WzpPU6XZMw?=
 =?us-ascii?Q?LukEHuJn10vXh4wMLsj0zRLpgrf2wjHIIBMKBbDGqIsCP4E7+PTe4hCkKZNL?=
 =?us-ascii?Q?h77rnAy54tH8NW4Qp3sbzjiE0kjJgRzVYAW7rCdtdnfr4r6eu9uApM/z88ia?=
 =?us-ascii?Q?/mYAjfCFoN1n5hxLviNShfWKHJnh1kI4raJHiGGakMOTK0pgag01d7uoIBbb?=
 =?us-ascii?Q?hLOYcFoqUQZP4BQG0Gk1YWG1vn744O5J06wjpT/HziLQGfYbFSHKCx8TW/+G?=
 =?us-ascii?Q?ooF0ueI/DhXOrRJa2FNi8SS/VKKbEFVV4ze4yEFgklrB+Mos4x9w7E7nBf0p?=
 =?us-ascii?Q?kihmtLRNNyxuc+XlNa3gyiISa0xRDPunTrrOdHQh8DiKkvO2X5uueJt83Iu6?=
 =?us-ascii?Q?7IAefT0pXZ7mYFWJT9QPut98qFIee6Lp2fosvuDE1CXs1ZYHKff4ZTn1LiYL?=
 =?us-ascii?Q?TjRGATYvnnpl3NBJlInllnZEVoM0XEjd+AiMBG/6mqJzoN3+Aia8QCie0nG7?=
 =?us-ascii?Q?X/8DbmKJyoPKm2wqBNz3AbGas6F7au4AJlOUspia6sk6MQU8sZdQgRZLcSvo?=
 =?us-ascii?Q?FIrIVtiqXtdoT+dQz71M0KauUNt3vk6VWbiESOjLGe7Tf2q2ZRAHEE3JlXKw?=
 =?us-ascii?Q?oGtft6ZzWGvir1LPI5Up0kgzhIzwEPGvlzMc4Nm7CiA6tEA6kYAXY+gVUr0f?=
 =?us-ascii?Q?unI/gPyvEjvV6UNLTSM6zkb+T07gTjiufrTpqmfAtjW6ktTbrG+lXpRyPpv+?=
 =?us-ascii?Q?k6FE2yz84Qo5rME1WkHnbbLpmE2a3/ivBMd9KJi+Qf2natI6kMnEtzck2zkf?=
 =?us-ascii?Q?IdmLcW3hWa1bbgtl5ReOM5jTAz6hCml7WaSYdZ0dP7eLJidMI0tNF8Dq2pR4?=
 =?us-ascii?Q?AV171UeUsj0Uj7nkIaeE+H+E+Uqmn8qrPQxt+driveV5+ecgYpafGRnRK4Ba?=
 =?us-ascii?Q?Gt19IUir9p1vwkJfDST7tO7n3GfcKohuOfcP7qZ5nVM0kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mB1VkPzoz/QJOsr8Vm3q9F6QVttGtjvYYdS1UahvLbelaGl2pCFmXVzZ3fIr?=
 =?us-ascii?Q?LEqY4IvJlFzv9zwKsTB1EAYPznTbqzGRHNX/7Uueo1iA5f9JMpnlfAKxPKi4?=
 =?us-ascii?Q?808MpSJX3TkWdUT/h39KhmHm8VBjdI01/mW2PoYxgi5Ka1Ug5bxWN6/EkdEd?=
 =?us-ascii?Q?Ov85zn6LLbNkiOpMcI9UK8jvQ4mdgy+s23sBVkADCZqt+xeGMJGuAZdx5YNJ?=
 =?us-ascii?Q?lWuOyOC4+KH/HBBdHAzFI5jtgAl9SXaQidkRhIp3CwWUnzElRYxl8UU4KEst?=
 =?us-ascii?Q?xsD4E7PSApbGyNvWuIfI/AJe3hFfZVJsXqs7LNyNxZEG9SR0+CBoBJHc3a7/?=
 =?us-ascii?Q?F5I/8mL4Q9QyoV8Z9eCqKvjNe7YwFWEuLkuYkIQM2M7DEbAYfxmbnnKZETRr?=
 =?us-ascii?Q?eMvyvl3L1xyfkObnTL2amqZjh8UaNRyO/hxXsiYlO5l82rWFHKZTeHUhsYO/?=
 =?us-ascii?Q?Ppjjo7JO3UkcS3bohuYCSyGNfpRD2qmnNudrYglp97vC4MaRX5BvHXpyi5kG?=
 =?us-ascii?Q?xsAJmYUiqTMhOfeha4YaFHX+3dr3kRRDmhIGSVTYGWyLHUN3Ly7TBaSBQu99?=
 =?us-ascii?Q?N2hqOXN31xZuRoWwb9kw0YOJ5OKqLd5ZXrVtda/vELJeHfkX6/mu7mHYlIzY?=
 =?us-ascii?Q?+nPMk/zQyN5c9ci1yPoZx7uktorvHqyk8WnMR2kGmqDmtz5ABYAmsCgVEMpi?=
 =?us-ascii?Q?K+rv92KE1nP/68tGKzXmuUabduK7hknd5F9Kj0I0N7dTGiZLjhLkZgSBFAkW?=
 =?us-ascii?Q?Pxut3Tr6p30xpooQsrE1+nWWDZ3Nh+qfmpkb5xbXbpvtdaJBvpkBukQ4MTHb?=
 =?us-ascii?Q?EIQDdrcmgFuoReWU+/sbeUtwUmH3rqaeuH92UkhY968OmYy2C+LYh+py3FYC?=
 =?us-ascii?Q?F8TEN0jvYQCz6VVimprQ3uF0u4+bIcb9FbeAeE9zVBIWCLZjTOsRKjB2rkz8?=
 =?us-ascii?Q?DNPsNTqAwxucFzoiDAlPxL9J9+WZuFSsOIotSqV1mDm2q5T7Zh2uPteShBlo?=
 =?us-ascii?Q?7dpHXpn2/560rL1dd8bdHJJEYC7EyRz7QypRkPO78O6oLad+eILq6xHqo+EX?=
 =?us-ascii?Q?LP5Y243BBT86C1NhOt1KrhO4u2dYA+U/3W8KQ3nORCtuIX9NkcD+gfK315u2?=
 =?us-ascii?Q?M+A4PO10hqnYwCxC5fSD0qs1EZduGhZqZqv66W7ZvtRNqLSYpSLU/elXSQua?=
 =?us-ascii?Q?rTpnNx9aNLhxmZkkIzNsaZScv3/ZzL36EI1rqoFa/GooPiUUhiG7ZPFadqhQ?=
 =?us-ascii?Q?5AxU1d6+ibWdCtrhMoi1XgiUtLv/XmLtqrwPXsym2EwYGqhkIltWt5HPSzFU?=
 =?us-ascii?Q?dNqLBH26sxMSu/ELIY1OkaFT6msTppy/xjGWIoqw0BZb7IIiLFfvjOWQCNgQ?=
 =?us-ascii?Q?/+KrkftcAiHKsVA21BZzmrGnBy7jrGkKsdbuFNACjQe5z2zPJn5K80QUIakI?=
 =?us-ascii?Q?5g6yFaSBry5e6t3T9FNd8roE4C2t7QXuMmIK9S//GbheCI2eYiMJjTRfQQnM?=
 =?us-ascii?Q?InTmhFTTu3q008QizP04suwDiby51IOWEbTsKVGer1RqVDW/UfZksQn/KBp+?=
 =?us-ascii?Q?16ek+ETOdonEG91YsDRF9fGCRHMz68+/je1b7odkfRpNbFjgj0khsZqGLmpe?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5240c24e-5775-49a9-09fb-08dcc7852711
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:16:28.1774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79klUqPvMyi67Jget2oYmGOaJugjCrK1xLuranI60voftENMGYVS0dBrcI2TrdiowqUSde8jvvsOsn0BzAgQzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
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

On Wed, Aug 28, 2024 at 02:52:29PM +0530, Himal Prasad Ghimiray wrote:
> Make sure that ggtt_node_remove() is invoked only if both node and ggtt
> are not null. Move the null checks to the caller function
> xe_ggtt_node_remove().
> 
> v2: Move null check below declarations (Tejas)
> 
> Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for ggtt_remove_node")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

thank you both for the patch and review. pushed to drm-xe-next

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 86fc6afa43bd..f3fca5565d32 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -286,9 +286,6 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>  	bool bound;
>  	int idx;
>  
> -	if (!node || !node->ggtt)
> -		return;
> -
>  	bound = drm_dev_enter(&xe->drm, &idx);
>  
>  	mutex_lock(&ggtt->lock);
> @@ -328,8 +325,14 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
>   */
>  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
>  {
> -	struct xe_ggtt *ggtt = node->ggtt;
> -	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	struct xe_ggtt *ggtt;
> +	struct xe_device *xe;
> +
> +	if (!node || !node->ggtt)
> +		return;
> +
> +	ggtt = node->ggtt;
> +	xe = tile_to_xe(ggtt->tile);
>  
>  	node->invalidate_on_remove = invalidate;
>  
> -- 
> 2.34.1
> 
