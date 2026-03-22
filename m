Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F942FC72AB
	for <intel-xe@archiver.kernel.org>; Sun, 22 Mar 2026 05:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D1010E06E;
	Sun, 22 Mar 2026 05:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHHOjhna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734B710E06E
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Mar 2026 05:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774158524; x=1805694524;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D0Q/LurNgevxNZkck/vKzBNtPiaeTMsNDjjAMtoAqls=;
 b=fHHOjhna0omQWect+64c9iKIqu/2Z0OI1l2WxTHC8TWDlSsm7uDoyPqo
 kdgSAp6lm5rGdrE4RE+Ndm3/KtuAM+csYpKpuJ9IH43beYHthDg90Z9rD
 x7BeHjAhNlGD3eWyePGKHyarTXoOZkuOkVsRQqIRpCb9Q+atAWeh0O38k
 gnKzGwhVWbtn2xrnwSbCVhsPtXjP7h3w3TTmPSO/4+wJE8XvXX84mFSKi
 TGd/MLCZsziDE5u7mlGTdj5kxS/9+DiL579al+aEvkJf5VF6k0zpXANT2
 jrG/S3srVy3vmbplOBvBfSLWzpiAFw+sTdwqL3aYYEW0ZjIbzE3jkCSAp w==;
X-CSE-ConnectionGUID: //FeqnulSsq+n9rJb1R7iQ==
X-CSE-MsgGUID: 5mrkacFyTw2jDbK67G9OYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="100648051"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; d="scan'208";a="100648051"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2026 22:48:44 -0700
X-CSE-ConnectionGUID: 52qD1+IkSyyTwgkvoQyLaA==
X-CSE-MsgGUID: stKvkAyaR/KDZW9RtdPG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; d="scan'208";a="222921449"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2026 22:48:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 21 Mar 2026 22:48:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 21 Mar 2026 22:48:43 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 21 Mar 2026 22:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McVecqXPHbSQeGXqBpc9wEE95+E82XEktF2MI5QT9JVoEdM9mtCu8jzCXd5RElhePa8flogIx6bFexjVrQYMnIyhzVOzn+XxmeJhALGK78Pl6d+dr1tXCmt5JzyM4xBkZ1AWH1C8SwogvbM4GNotX2tjrnfkrx0MJt9bNzFItIYDOGjJd+dYhDCEqB4mWohvGdhuvJqzR7JWaFrZdGMrYoTKKPhIVyskRZ+M0E3PV4/cTkOcb7oIjJfPC64N2kwO4SIgl5QRejsiXBk8+6728G108pSEDdKj957n6T6wEdjQNXW4EWXgwFhI5YtNBvfex2q/6lYNQhxodkBl1UVuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TR3GoDAre+Zj88542c9uaBu0Kt83M+HWELlYkwU304g=;
 b=GBm2I6Z1aeASGDz34NOi4BHUJ3EFLleGcceFGWo1eHWywavr8PUsyWwK7E+vNL4o63WMkACy6ckXCZzxtr1jhyb21H0HFG1LqWmqG4bZKQFSn7l7dMnT7aqp/+OW6XJMDYfIDZksMwPXsFoyhwN4R1cNDNshIT7j6fsk5tHtWPxoSAqu3z9sQSw7CyVejNw5kFBk+TWINXNETs6EFZs1gAkRsuhuess18GUU5R2+3VZODtvDj5xM7DQ9gwF8QZYeOnt4j1T6IUw+cGrwYt1DbuGQ9Ai5JtEZ0cilfqHo1ABxVJ+23AKqKZkJbgRcfEtCqnocTEVtyB1diBZUVkmozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sun, 22 Mar
 2026 05:48:40 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::b36e:ab4:9ded:1305]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::b36e:ab4:9ded:1305%5]) with mapi id 15.20.9745.007; Sun, 22 Mar 2026
 05:48:40 +0000
Date: Sat, 21 Mar 2026 22:48:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v1] drm/xe: Fix confusion with locals on context creation
Message-ID: <ab+CtrhY7BmAzb41@lstrano-desk.jf.intel.com>
References: <20260320145733.1337682-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260320145733.1337682-1-tomasz.lis@intel.com>
X-ClientProxiedBy: MW3PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:303:2a::25) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|IA1PR11MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 700536e6-aa12-425f-c401-08de87d6ab6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Y3GBZ8ypPcxTCn20fLh1OPPffjpYfwab1c7qvYnmFMfpi2AUdoKteyIfEZQeivy321R1EaJWuzoTlBcg4wCc2NDY6Ylrns4ujoCFPRGQojJaiclaS5s0pYUCDHwA3XOJvuPIl8hX259FNX4yRg+J1Hi12+76GGIFybxBdDJzo8rtvyVCoK0qcbZ3K8qWprX208tRu6OWS7S+p2wH4Au/CZ6oNYKziOHyZ5Jw63L0YNdZd3HxVj2gH398plHpGe1C5m8g1orLY6HVVsNVuehFcH2dGW6oelHT+rBnj5/LaEhQDtueMemppzW0nRMoDB9wqAhaw7+6X5NzuPx82TRLneRJXPkakolTKtpVv+Dd99eHsJwvdh60sWHBmGEa7CVmUXAftq+ZK6GT8Nt2MuH1Q2fSiy6wWXmy1EKms/78l3Ex6DfeZheq2cCj5K+8uyZgz/7cl3k/Y4etlba1VWbLAHgUC9MfQk6+PskZbFgR3mg4NprEVGj/PrU4+WRMgFO5XkBRh6OG5+qYx+P9Pe262Qn3afypOYd793MJu3VovxACAJ/YrzBNtBH4zAkIJ+uvdLL93fUZrFeWTE2R3tnXFdYn8GgmSxSeacMsjI60EY8Il6so8aL4QXf4bePeYfr1mx24vtF2mej1dPhG7+fOZ/z5Cf1vBPXPM6GiJ7s+biZ2c6DlgqgytVP3jZywdk5TexvjoRSnNhdko8M2MACdlthSmGlfqA6BNq5lkEk7ahs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1KwBZANhdgQZIgKooxHjgEkKaaxDqciSWjdh8kasblCeh7iBn4qzTtTeOOCq?=
 =?us-ascii?Q?EYu5efeKPyFzWWM1uOVe9y9BVzTeMPudp0wLZpijyWqcQhbbseive5Dd2iBF?=
 =?us-ascii?Q?nlW5al965lM84saptlK7ux/QL1xzjhwDd6RovsP3TLqqI2eCnwquS9Dg7sPu?=
 =?us-ascii?Q?lZfq+sa7s3WTFZnmtfTnyjCKezU6oyoP1LXPdA54gTUPTKKW+MhWeQMC8EKl?=
 =?us-ascii?Q?341R1f+BLDWeuP53/jTmRblMHRv7JeaHwtUmHExJAfOQb2oXXnCah0PFLovz?=
 =?us-ascii?Q?K5+/kqFkHVDeRjJrViseEe4OMk40/4MSZi8XsYePdy2/pEaiSQLLle1p5lqf?=
 =?us-ascii?Q?lb3v4q1ff6pD+OxOp+ip79stFF1wtipB10l1ivbwsewbw8T1nzuSARmNPsJn?=
 =?us-ascii?Q?2fTYoNxkvSeoGO8tsMyl4OQ3O3ZjfKQECzLlaa87REPRccmUcD2l5735t4hS?=
 =?us-ascii?Q?5L6sfpByiuCjZ6vtYYNq78EENpsqX+Ps9vmlMJB0Cr2PiPv1o+OC+b1E2OO1?=
 =?us-ascii?Q?JwuHKeJckYLO1ODk4rlyMYG4QHOU7jyWPHNzYHXQ3uOBIngsN50NslmFNXLI?=
 =?us-ascii?Q?+BEgB9IkE/rs0g7Jm3EDDNVwyn1QkM2hrsVZwhMUH8KBRDIbDZuVpo1ZMk7w?=
 =?us-ascii?Q?SVC27We7lhs0FgoVqoYTwyECy/wStGnQK7iniwmdDFusk8NPPX2LDvgKOmjM?=
 =?us-ascii?Q?TjFpc+LWxA+VO11EX4CmCs5uVlZG1xIF6i5sxvKQSg2+PpYnYahk5Nljv+T7?=
 =?us-ascii?Q?toLUskoERZXUI4nM1Tcxn6e+/WaMeMSEGx51GOTyLYBh8Y7tFr1hWAtup9XC?=
 =?us-ascii?Q?PVGxxuUavhmJqz5TOongQjtxxa1oTgHqLwQPjCCogw5WnjFZXCZcWTIVyvL7?=
 =?us-ascii?Q?wjq0Xh8KkUqU0ZoKMVVop8ZlG/tAIkGPCuAIQtbTPG6c/PqLF4HDrn108raf?=
 =?us-ascii?Q?5+UiHhqt8hbMxzcbDAwVvh6ZzLcHpP+H1+jVtuheunPyXH98F08FnwJ36DwZ?=
 =?us-ascii?Q?GnjMTh07Xe6y3rDXh/TB/fAAKvTIlhFewAZewg51gZw7Q1cY5vVyEITDvaoM?=
 =?us-ascii?Q?F+K0JBNL8ChvHFt52NoRdbRxdsbaiUfT80p4U6J2N7q3LZbC8zddIuNog/S6?=
 =?us-ascii?Q?kER7jk9xR8LYwDBTTd9f+K1myvBAdQHc4xELkNp14p+Pu3SbG1MUeQCO45Ir?=
 =?us-ascii?Q?AyFLjSFlClMGQcA77ljCBVWZKeoMvZg1yzaP+GF3R9Z7Gn2Xe1LL5lB9LRm6?=
 =?us-ascii?Q?QhOsw5nIlprviQq6WX3GPvnNSXAKKco0H+YL/jGXbZuOOGve5N/kreRhiZlm?=
 =?us-ascii?Q?dLjRvOuzKXpf2wE9x0SSGRvDICqzE2uGP9ilMVdWDjIpDELAEVs1OuTssM7r?=
 =?us-ascii?Q?JC8T3TZeBKK6g8V9i3Ug5GjLVQauSHNdmtxTTvlLL5X5imMHc3VzZmQo7aYC?=
 =?us-ascii?Q?Fph6x6en5e/FeBxadXrASvxtJrfs/J5G8OdFEMwIIhDqFRaEbVpo0UM6wZdU?=
 =?us-ascii?Q?a7C8IX2U2zVrIc2fDuxxMU4a3493exSN5f2ZP03pfXjmPxEKJNhb44KOJa/w?=
 =?us-ascii?Q?3efhssl+R97P1hI4vbcdl2C6HfNTKxvI6fp5R9VZjbGz4VJUjQv4oNXMDBhx?=
 =?us-ascii?Q?LIrA9v3ZuAeyEYLS5YTh2GnNCwstEMZ96p1d9l5gaPyABknVF2vr8ncUKaXI?=
 =?us-ascii?Q?y9zmbUpOzK/s1medRLNclvOyGoUnXdYiE+8cQ1BtkTvEGjLIL1bCad/doDQW?=
 =?us-ascii?Q?Q9cLRNGqMQJNqK4mHgv4JCu9TAwSdv8=3D?=
X-Exchange-RoutingPolicyChecked: HoB5FiTC6mY/+uoB5N6RbxLevpepDu07sJKKJL8mYz4evrShBxwvSOgqfKYr+qC3PARtxXbzYZTWCEUuHXZHBFf+LDdTCuwVLXTmoRkMGWX/CsfDCG9mwunv5xlLI+wK7S6XJQ6WOn79QvZTvtX4iEW9KAkVabpyG3GspvHtcbJtm3huS6oYW5ePVFxYfGzjv4sEWK8zxl3FaL90m3Yv0NC4z7wyRoQqi9bkhCZyNU2iHTLMZkGUjyFvu1Cuebb2p60ul6Mu8D+p5eXbimtPrmTgqj1ppeX3KC1TVk2JoE26LOaqMXSb8cBQb0kbWylZxlaToiMJKCZy2f/bk4JhuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 700536e6-aa12-425f-c401-08de87d6ab6f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2026 05:48:40.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSJyeohtstf/0RIz8urXxtfUMLsdG4+rHAEIBU3TKvZFjNzFj8auZKADWlf+w3/CXZjDLcMMzoHJ0JeRBvjypw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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

On Fri, Mar 20, 2026 at 03:57:33PM +0100, Tomasz Lis wrote:
> After setting a local variable, check that local value rather that
> checking destination at which the value will be stored later.
> 
> This fixes the obvious mistake in error path; without it,
> allocation fail would lead to NULL dereference during context
> creation.
> 
> Fixes: 89340099c6a4 ("drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()")
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index c5cfd8f75a94..77cd57788837 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1607,8 +1607,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
>  	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
>  				       ttm_bo_type_kernel,
>  				       bo_flags, false);
> -	if (IS_ERR(lrc->bo))
> -		return PTR_ERR(lrc->bo);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	lrc->bo = bo;
>  
> -- 
> 2.25.1
> 
