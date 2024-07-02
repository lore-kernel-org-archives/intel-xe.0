Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C688CC3064D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 16:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB2810E0F7;
	Tue,  2 Jul 2024 16:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HB70O9zP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DCA10E0F7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719936033; x=1751472033;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mMdVhsywozGK/9f2MH500SgVA7wL0Ely1rU9TtBA3Sc=;
 b=HB70O9zPApgPryxAsOOg/JF1u+Voks40dHMlU+ut4r7QUYcUzZZspkcB
 IvcsNNcfrZlwfUUVLUEDvJwVZsEZoVk4UFhwXUd+zw52Dysm4+fB9rndS
 1C0dgXBk20PU0nj9E2gCcRVeI8c2IkjVXkSAC2nEnQWRA7CB9ecGlFCVX
 1QGV2XjGHlNbatfvqukFoF3MrDJqEs20IB0gQr9RLwNSTaIANhVvywJRN
 2aEyO5oszIifU4SUzehGTOh/JxzEHpEXgala3cLmTfX+ZpL7o9DpWSQxW
 w9NAW/HQKyNdApJssWZzT1h/yF7DDdALbOelGXuJMb5URURIdI3lTKJAx A==;
X-CSE-ConnectionGUID: YYkKHXr5SImv00n9YQ6qpg==
X-CSE-MsgGUID: gRgLsySkQhSSzJ9UYTAlgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27721090"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="27721090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:00:33 -0700
X-CSE-ConnectionGUID: 6LTUHGMkSwqy145FeDGugA==
X-CSE-MsgGUID: tXpGAZF3RiaAsU1yxihaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="50399296"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 09:00:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 09:00:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 09:00:32 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 09:00:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j18ikBgTxIKU0E0g/udj84QNQKMXNj3utTuz132UeaW2CjitJRlbWtax8+B6kKnU0MeIenI4hn3YQi4krz0Yj0a2387fu6NpiGRdnh3nyB0rG5R9hlN9d7xYLibIlJvpbkzMeLdM9gi3z7M1Eqy6LLuknCMTktKnAvfAeO7r8CM3bOu4qnsH7JOelw4ip5WmF3chL5AbhQtzpip2sg6uczC3zg/Ejci92OeApsrOl9YqudC0bcBsPJKUvfwnN4DSSvSzKFBlpHUooUa1pxZyJA6QoaFWxVvkArKeDnBy+5T0+xhgggbuH7VJMZr6VX/f+G9dA7kvzcHcV68qM4HRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gobRHxmhxgbhpCmkKmZekEb+LatFKjrmxCugIpFzbyc=;
 b=SpkNLYzvJix32xy7BQ+JFFb1Hc3/Eac1uRuyMj3JfT30UQbR3OvmJYmnHl/8O59xNuMHtUQy+hY5LPw2mi+8e5g7+if/uzncBewuX+A7lz6jnC78UdUTuaF+tHVjC6xM8Z1Cdb3SMsWuEkUzCybYWexCB0abXg3b3dDDwzSSH1gz4nNkmWxf7BUTqlzLTqWDfeJfgWA4M++8rjtKpvCM48vDcz7sWiz0psa4hP9niMxbsOj8BuZizm7q8Ai4kLdCOxfdEJwphBrnsZnPyeRDf1TlnEJUeW/TKYFPCpJhr4bPp6rQau+cdYdz+fQx09AIo4QF7oAwtYAtI7pkN9P6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 16:00:28 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 16:00:28 +0000
Date: Tue, 2 Jul 2024 12:00:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Demote GuC IDs usage message to debug
Message-ID: <ZoQkGZEzkaC_6yPi@intel.com>
References: <20240701193030.978-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240701193030.978-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|LV2PR11MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca53e92-2c0f-4d67-20fa-08dc9ab017d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FdzeNOOeh1euhwAACGgEobEGHi55GWrjs0Bl2Oj69JwUtXe5vSMYhcqU6oCo?=
 =?us-ascii?Q?oGd2a6ZdWAriB/cRTQlaeHEr5ARf81M/SvelxO5ePleSefGdG5apjmWxL/wc?=
 =?us-ascii?Q?MUfqnQDBDVIh6cYNjCctsleHTT7grzy5bUHCwneVC2mDIG75RHp4oUCAnTCq?=
 =?us-ascii?Q?yHViSQHohuSdWGBi9cDD5zyuGLgX87dLSbHyg9kMuheuwmq31JUvOu5wBxu0?=
 =?us-ascii?Q?TbFP4Slg7l43GIRCiRLSQxM80TFmhGl0gLf2wMTePj3scXjAFxt7IMT+mzbu?=
 =?us-ascii?Q?ZcYc2i5s+Qb34rQ4NghbxjixFwYespyU3qH1/2gYyi864o+SD5zeVdv0y/Au?=
 =?us-ascii?Q?q7HkcuIQ2KrLP+0zQBYH7F9afCGDxFHIHIPFYpugERU9sGkdfizLa9plwScu?=
 =?us-ascii?Q?OIY8MrOC/s1XzirscqY5clm73EnONe1T/YBuq8eMAT/W9vo5ePTPtRcDlhOW?=
 =?us-ascii?Q?Cf1uOG2EuVN/YNjfWWmYXSWn9W11SrpWGRHdkCWJlaDfuTrN+rWGiSddlb5b?=
 =?us-ascii?Q?AiBH2bXL6JmE1USHJzQ5TRzuGIk9GuQIHa3pGxoCisCqmpMGMv8lLmfNnlvM?=
 =?us-ascii?Q?a/EBWPDLlVZoVr0ljlSg4yTrNb3zki5LmiLO20NGc4tWJSgZVLDXvz6uMjx1?=
 =?us-ascii?Q?dZzJm8yC9mVVWN/FoKTFj2zB3uSvRke3mmdGZLwO3kWKDhYApQdIyA1ZTUf+?=
 =?us-ascii?Q?Rjr4TznkQzxnQ1zRgzf3SF6xpw4A7a3+xYhKL0bc+JTFFJJn6B0Eqq60Sb12?=
 =?us-ascii?Q?WjKwZOa2aYHO5M0wxciAO/TFLS+Vb3T+Xxn4bBWXP63NMc7Rd1yYEWwX0ehq?=
 =?us-ascii?Q?VA7rSAzdbIVg/b1UChx4GQvc9JrhWmYHTu1HNkMlLs59qNKUGACUJxwwJvw+?=
 =?us-ascii?Q?acjxQ2ShIdYbk7+fpOgbYUXkMFApwIhbgyMlnmAQyiAu6Ag8CgAuRF2ckvPQ?=
 =?us-ascii?Q?EiW0XWOsfyrN/RVdw0JP+V6k18D5MW1khxFT1Z9RFsvgtnKhYXr00jP2LSVZ?=
 =?us-ascii?Q?tZfjoRNaSpY7zKCAReOdzBfQLHFMYKR4Piswx6Dguj/a5g2qOBa31BYdK3Sh?=
 =?us-ascii?Q?Gg+sNdKX/vIQvgnRIExmRGsfI932T+H1uqrDJ+B9Zd+PhzlCWTpSDLCePSRm?=
 =?us-ascii?Q?eWTBd9X5fEsyJH+AjMuoHp/M+lk5UolO8YsT1a2krQyWMKXfslDDJ+wl/Iin?=
 =?us-ascii?Q?VxqcKiVElAUY171XESBoQbwq6trdS/jIRF1KHGuOtI8MhshpRFYwqpt5w1cb?=
 =?us-ascii?Q?KEUioZO0+ChIWu4cvy8BYXowcoq6MOYAyHg56IUEqV7DTCBDEhmKjcysVXze?=
 =?us-ascii?Q?GmBgkl9Q95XRWrADNr1arq0zJUndhb6QP/LWyjiOcITNLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9pVwqMIc5j3n47AIuRbjtBwWnKQqgKceh2SthW2IUtiXr7cGtQSdji7lHqBh?=
 =?us-ascii?Q?d+ncsYRekcJIL20CR8W70qv/8qy+vNURjjyZPXH7l0AT/E9hGFJTJsj3qUTx?=
 =?us-ascii?Q?c/VPb9oI86pu6t0JHupU5CxPUHvPgVKgcaUwauMTzTqIZMqUAo8ftdhylwhQ?=
 =?us-ascii?Q?NRX10Nf/SjyzBzhHXmx3eVadONhP/qoZLL3AysxANsUfT8tOJXGsBcnhjIJQ?=
 =?us-ascii?Q?0S0FO3MTDKdSEoyqZRhR9sjbeVqV0vWwSfnOVr8I9qnioYoEsNUuLH2FBbQA?=
 =?us-ascii?Q?y3J5u54UJYn3EVYZuFGxw8Hs9/Lu8rJ1KSnl/846pE9tXzf0gMjZH0SZBAl4?=
 =?us-ascii?Q?7dhM4hExlxhfg8TQsAHS0bVIhl+9lhzaeQgOy6l6AyGolKlz2X6biq7qR7+U?=
 =?us-ascii?Q?/sR+jsjkWj+g1Og43r30nFOMjcPFbZI07f9lowHOYvW+E206FT/ZDIeu7hUK?=
 =?us-ascii?Q?uFlqcUQRvEbjOOIVsXWg4IoYknSBRE2CiabqZZfgI4dMJPmXvjZoph4V8S3F?=
 =?us-ascii?Q?nN/nx3T+vSSzGZVhM5RoXdUkAywnYtcAXz0AKp6LHf+G/4k+0XA5pm/qYzjf?=
 =?us-ascii?Q?b4m0gfU0pMrTFmMmoyInxjiV3LvoxoZ1NR8G5IUPrYoLjo8xKynXhBXJrThy?=
 =?us-ascii?Q?A/32jKW7VW5qtblp6xK+ACdek+i/qL+BMpHx93zrAkeKnMgpBLvQGExNUg7I?=
 =?us-ascii?Q?M76SR4lcwlptNkfNQHq80JtWfQs7csVlQ+cBRoYWFvBK0gq0Lqkqkvoveo5L?=
 =?us-ascii?Q?jb31k2QSEgVeNDO46Un6meQtWGPDzrpS2iq0t+dBf22p00/pPagq5Pk1ZhY0?=
 =?us-ascii?Q?jbjYsRKhSC9gNNb4YdROEuFDrn67MxY0vvF93OEoXmKClmZYZK/y+mDYl99b?=
 =?us-ascii?Q?pLpslVh5EdrQPnjUi2Wz5iD4xjdsg4xUvtigT7jgYlinvY1gDlT3AHh3/2Zn?=
 =?us-ascii?Q?sBsj7pe4zqn5G2xXCuAl1l0wIH6MDIJe5Wd9GfEncDGrdDmCBMW0p9ohMA0t?=
 =?us-ascii?Q?MNmBwHDPNc1by5Roq7Bx8x9LbFmWWxrDsbV3Z2QVtodEpHDhLZbfJy7K8oXx?=
 =?us-ascii?Q?njkwGM07lLx/pmYV9Snn6FPyyAylqhprV+Ty6Vq/Q7eCdDEQRyiLCViAJ3dL?=
 =?us-ascii?Q?IuG7MopWAnF7EFQ0j4AV9/SPj6CArWQcWC7WNVS2RF/lsSmnQl7UyXHuxY7u?=
 =?us-ascii?Q?Ia1hr/jO+pSuCa3wiiEesCM04ayqZJVBc9U9dQFaKuTwGS+uxtWFBR5W8jcl?=
 =?us-ascii?Q?1WSfzSOKbG0l6OUw2Ba/aGGLJrhWNIk2CxXq9XsKNgIlIV6Q9OIm6pRz0IHN?=
 =?us-ascii?Q?rnFlnXNl/5GTgAavPhvhMUCOAPuT3+TIl4hXLiCwYEGF/qJndV6vlhfYyWfA?=
 =?us-ascii?Q?pJpzgARG9i/D0A7TC6SOvOme6L7VZjBS614uGwuNOYcRUbQbP4PKf5dSmxJZ?=
 =?us-ascii?Q?7Jc6IkCp4cNgzfN0rgXgjQo6fDYaou1zGbfUIqmCBScq93qAu5dJZ+I7ODhX?=
 =?us-ascii?Q?SMY2LdSB2CBQiX67+RtM2AwBr9fZQkoBg5liMj4qBdBt4g69LRyqJG4aRmU9?=
 =?us-ascii?Q?9OfcdpP1MHw0M5ol/GoOv5gsF0EpVL7LwKn4fpkn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca53e92-2c0f-4d67-20fa-08dc9ab017d4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 16:00:28.6155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t55S6FaBQR/PAPPsBl0k0tWDbfMkRE2cvtX+wylHX9MH0/afteiV/Ieb71mN9m33rA11Lazts3ZvO52x9bGRjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
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

On Mon, Jul 01, 2024 at 09:30:30PM +0200, Michal Wajdeczko wrote:
> Printing message at INFO level about available GuC IDs is not that
> important, DEBUG level is enough. It will also match message about
> available doorbells:
> 
>  [ ] xe ... [drm:xe_guc_id_mgr_init [xe]] GT0: using 65535 GuC IDs
>  [ ] xe ... [drm:xe_guc_db_mgr_init [xe]] GT0: using 256 doorbells
> 
> While at it, use proper "GuC" name.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_id_mgr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> index cd0549d0ef89..e845425d670b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -97,8 +97,8 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
>  	if (ret)
>  		return ret;
>  
> -	xe_gt_info(idm_to_gt(idm), "using %u GUC ID%s\n",
> -		   idm->total, str_plural(idm->total));
> +	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
> +		  idm->total, str_plural(idm->total));
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
