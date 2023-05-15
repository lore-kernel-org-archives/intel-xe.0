Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E30C7EE22
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 13:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB40110E1CD;
	Mon, 15 May 2023 13:07:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ED410E1CD
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684156046; x=1715692046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cwS3+hGKxzEeV6k3eM1GwLkfn7fOrlEms53OyjPl2bY=;
 b=lFuxGsr9yBJMgdQdQ9hFqykevHcYFHaw+Mu4yiUod6zmx0Y9fDO8Mc8E
 bVkkBwsjE0Ry+sNdad0SuPkBQokrO3Alh1moFIQ8Exbr+cLQCF884LnxT
 cKVtnhw3kMiLbXdM8JrMnc0//oZM5V9vVygsbNd9P6m2YhrRTJYB3sHwI
 508oT2gbryTGHC9SV3MwlewpvISG4GWMSEp1Nh2EuFDW4s8b5iVWmqBdx
 KRmnxLbzUYnOPURWNod5MirnKv96NQQHcihDGG33tdAzvfr1HdEwNhl+D
 txQg7waXQfAmxfEueYS1/yWPO2kmMYEq1bgtHTGED32JPZF+egwU6swrV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353464514"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="353464514"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="765921697"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="765921697"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 15 May 2023 06:07:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:07:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 06:07:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 06:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWPI91X0KVOwMkt4xYH4jR59VK7ZsZ2nqqNZPyTcwuMgE2q59xg26/fD7HKKTaXyDVCfabwR1SqbXqoAKQEn1x61i0gjJbamZhj4fwT8TyhscQU50pf512by+i122t8r5GhG8lDy3prR3frWYbMt6KdwF5kYGWJHbNhM5KKdJZe+ARGbTNiJhOGCxWZMm01Q5haWMzH8d/bN8wmWUV4lTZ+Tn55TVxxfpTqfcJi4jj/VDbmWexYaBthNikbvpvJvifHjVN0AEliZTOpNc3obDmphPTzsxsE3z1g2Bm0nyl8BIWPB3P/TbWMSZr3gQgpzKAhT+eIA1p1dkZPHt9U6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8poe/ZDdkN6CT94sI28gZSqx/UYrApah1YUTrkZpPo=;
 b=T0L6uIcj8fmG6BxHoX3VUG/B8A5WJ7mRmuN7MKJ2znevu8WJRvQadQrS2L6rETY+hZV7jBxHCiWa1APFzEXXWK/Vp0b1DaKxwLUTJNC9MTfd3JEqxOjxcmmXBXs85oRJOOAovmz4W+81258pD7RNMtH6aI3WNEc1iQNqb8DrhW6h4KDEAM+zOLyNn8L7BBq5R2+EAjYjxM8JAH574MQaZ0aZUrFmMwfsdCFK9iI3O9tNlNLVDHySYWPAtPYx1PwJWS8k4i8rhVJgjFoLzLFgRNCWhhWBri6NPZvpg1DhN70m2AXosEvogrZD45XVsii2ncd7xRoaUhp6AF2zUU66FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:07:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 13:07:19 +0000
Date: Mon, 15 May 2023 06:07:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <opurbk7owbiao2tm5sindrmg3scaxajolewwjpdw72otyzpscu@uw6exgedxbkd>
X-Patchwork-Hint: comment
References: <20230513050830.3240970-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230513050830.3240970-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 5095a3b9-3583-4ece-6ac3-08db5545505e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U89GUGhdtwPOE7fRIwvgyuxdh/ir4jY4MbRUVXBmhoJNG1/zdOZ6AYKUxqLfAp18sZO59VD8jYNj7Oh4vLs4xPQWHStYCEG1Izc65l3YwcoLF7VWVgBXbbnMjyTv6r/XzGYNrSXRMYulY0hxGr9BxZgOpvZt3HGEK8wD9yicUET2T5jbxvfNQNeeOPLRl9ijwygfiRpa5kuYfyXF38aLtvyeq2o5IjYHra74ppLPm88kQDZS0lxlrFt0DbPHp6RYgGMniveXQ+vcxQQqpB5hJRnCLqkYsXRkTGzoLjfncLaLsb+NNkV3Fg8uCrlffIs3S7/llGkomlcLA/xVQB3bXx31AkQSBu5uWRkkGkx9jV4rG8ezBAYra0wgGPacpcRRO9bcRsSZYG1aAvZyAXyyn+e9MBaMBdXLRTEUfxBDQ0FgU0SBPo98BzJ3o27bpDfHtE94rHkwHONmGKF0aJf+B/sMlQgxr+fMbV7ZEl7mpK8LC9ACEdvAfdzFp4KG5jh4ypNA+yYhKCKvH4AG/DB1DVDQxHvJknoiKjAged9bibQYCByvjy31Eis9+mEDnV8x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(86362001)(186003)(33716001)(2906002)(107886003)(6512007)(9686003)(6506007)(26005)(83380400001)(6486002)(478600001)(8936002)(8676002)(4744005)(5660300002)(82960400001)(316002)(4326008)(6916009)(41300700001)(66556008)(66946007)(38100700002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qR4q5NOLSLi82nMu0hT6sahMi48WRJ8owQmfyNrTizl/wFOMBHdCIzbTanSk?=
 =?us-ascii?Q?D8CZGsm5GX/Rn3mwjvhX2ZeTYcIlDeNm/+vBu2TbaXz6mlbDb4+nxnX9GFlP?=
 =?us-ascii?Q?glXsHC9+QA4I+0fhkdRTNWZ7uqUO48IqIaZLKKFLL5lhodpOg2q9P4z9Newm?=
 =?us-ascii?Q?v2R5UWGsMMCyK8FwLOwaz4BVYpFpcpBSC9Kct25MQmLvaMpYiISaE50Upl/l?=
 =?us-ascii?Q?O+PBKn5ZGz4ReMCYGclKIzft/rptrWOiEfwOr3qZFEVUynaqEKQ+B8Vcjsog?=
 =?us-ascii?Q?TRDK5B2OxBWor2Q+hTIW9AjNjkgYhnf6S6plqerkE5KcHxkNnOIOW/khUy6r?=
 =?us-ascii?Q?rcabSLhmauARtOKBiacffT7eK+EwFliKNrfcTQIfOsje3TGU2CdY/JcTtsRs?=
 =?us-ascii?Q?s+UAKc7nw9gWInNr69mlT1rVfY+ZBDKoByI8nB2t5WdIrYvQ7ecsjR1L6bn+?=
 =?us-ascii?Q?/QvA/+k7ly6peX8C8wMCEBWKLElvFZg0QrACh2jBrgiFjgMm7XZaJhDQt2nG?=
 =?us-ascii?Q?JB4J6rmkJD2HYHLQ90WBhEIOtp1caxxuFJfECZnu5DCRQQ/FLd3038L9Fg2U?=
 =?us-ascii?Q?iM7P9fFul3b7a4YNkhTiq9+SYTyAsQUPzQ9WEWNe5woek0EVAW71DctmRipv?=
 =?us-ascii?Q?lh/ARXUVQL9IiEncdB3sbVUXs86HFy5urimx1oFdr37lMlSMDpPFXdgmMpip?=
 =?us-ascii?Q?DZOIKl8IDlONl0xMLB4s3X6OR7Dmm16HYb1ALW3kcogrSjUFH+okt4cTvZbw?=
 =?us-ascii?Q?PGousnPN/sAJMaiHb8u6iFgztm+d/nOGKinvTq4qnUbTFBskC/qCSsARdnep?=
 =?us-ascii?Q?rkH7kH5dQdgM2cDO6MZ8GWHPgWxqXUxhWmAVogABgkB8mzfZGJgoDVVlBD+a?=
 =?us-ascii?Q?1Uj1Rsz9qrq/I7t1W91rOklJcQswDGKCwK39lK7yyDJomCb6i852rsBmRz+m?=
 =?us-ascii?Q?M0pjXXSOGY5PZn4in0K035kDUQ+sG6ohJBJRaPIYtqSMlxtIrvrAYi+A8l6C?=
 =?us-ascii?Q?CXhRUm0YD7/TCuRfoBl6HFovKpJxbV1nESUSVBhAEDFRrYC94a3ixxwa4a++?=
 =?us-ascii?Q?XvYFtHOvbGJREpooCaHhfP16lAU32GG0Cer6RGiWw8Nqnm7cbQ3iDInxbpll?=
 =?us-ascii?Q?ULaozcP8WaTjM3HTjejkEqczGq41KSPBzk4soOQrew9VhEEEd9P0Tm+Wlo5B?=
 =?us-ascii?Q?cnUVgToWdhpw+yuJVNUxok3HoNN5NecdfJmt/hdoLdKU6dP3Ji+dfw9+WuOI?=
 =?us-ascii?Q?tUptL9rk84/0iuj4FhtWY2M5XjOva3mXalQdcoZ1aQu5jGwTPmYMpT25aT8I?=
 =?us-ascii?Q?cCp6wRnpJbPtCuehH6uVGcBsrBVXu06OMatSnMYGeJh7jE2nEpwaRbgNVmyg?=
 =?us-ascii?Q?grJ67gAB3MBhGL8wC6yeamQoc7af9dURzWBwAOQk3GVKbd5Bu6hzZg3NeEhF?=
 =?us-ascii?Q?O7aFBXi5YJAAkaZcYoSm2owNCodhhP9Dc8ATg/P2sFnM51U5YsZIDUpEoHuy?=
 =?us-ascii?Q?aH7S5Y4TRQ1G/zDK0w9gsu5yLNe81EHpoxw0CTn6exrmx15SvrEwlhgOfTJx?=
 =?us-ascii?Q?PsKrQmo/hSsa1ruTc/zbaWo0Dzj5uy7QffTMPsybGfHIGjXFv/CA5AE/n+85?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5095a3b9-3583-4ece-6ac3-08db5545505e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 13:07:19.4919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFd0scBXIVLo+Xly+Jxn+0bakzrr/xTN/dtOXkkvt8BVYZ6koX/FwGCiUI/pAbwLpokIbmDOQQmIC9rPfOzbs+D6Uqf6O59ibr+e+ZEyRuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Annotate desc of platforms
 with display
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 10:08:30PM -0700, Lucas De Marchi wrote:
>Fix race when pushing the display annotation on desc struct and
>enabling ADL-N.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Fixup already applied.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 18d58d916fff..66af8a621876 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -222,7 +222,8 @@ static const struct xe_device_desc adl_n_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
> 	PLATFORM(XE_ALDERLAKE_N),
>-	.has_llc = 1,
>+	.has_display = true,
>+	.has_llc = true,
> 	.require_force_probe = true,
> };
>
>-- 
>2.40.1
>
