Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA1CC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2BD10E853;
	Tue, 21 May 2024 10:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B58Zjlxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086DA10E853
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287991; x=1747823991;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TRL2kFFOg+SNGRVJwE2aPBLh1Ey6pqqPYS2F3PDQBSw=;
 b=B58ZjlxbSbnWSXQt8eDQQazY4jxonnyV04NC/bcZkIslJHHvJafqnBZ7
 olbnWE1Qd7zEYBr7hgsM66g21dJ1BbbtSKkK+u+g4f2fLXE72WN+Cx3jg
 wSI1DK3u5ydE0TEDOSfkDBgvSaWXx+hlc9RO+d6MLms8I+fFC6InKZPK4
 X+U/HExEATbRelXSLKu9MJBThe66mr+pFhnUoDSZJ/SwnztUQw/3Np0eV
 6N2iuef83cWZwdUA1rUT5pJbQmCQixcUCf83rNlx6YZONq8+JWxXmDSjs
 M4GHxlqFxs4ZsJ56njjZpZHIrkhz2Q7Bh6nbq0ENcbl0Icw8s+dNSTJK4 w==;
X-CSE-ConnectionGUID: EnUUJjGtS9CUWnIhE5hwEA==
X-CSE-MsgGUID: sL5iq2yDSeWp8SH6ucPHdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="11629275"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="11629275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:39:50 -0700
X-CSE-ConnectionGUID: MgnsuyJySYakDGoaOGw3jA==
X-CSE-MsgGUID: ZBuy6RBITXmq3iaVgwTWyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="64102188"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 03:39:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 03:39:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 03:39:50 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 03:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTExuyat4/u4bXe7zaLG1heTOz+URaoEVJjwAW41b6+w+n3/sMP9Q9dX+sMfjbJw/oTvP8GMKGhSpew2SXHZRN9YEGp87ssLuKxN4hIjENKnkJTIPXjf+pBE97I+ArYV/jUnKKRCaZ466Bv475FWC71DqGvRdI1vPCmzdh3UgqYWf0T/cQnd248nKZRY/Ho5mUJ6S97udnQNp+zv9kCXD87U+Dp+lrs1ih2LkwPfCF45cfKtE2M6DVeMLWIVGJ/MSHvL3bHMEwTE2HvHe33CXZChdQ8YOMyFtTeN4abiyxVZOu0hi33rDlpKCKilRkif4Ox57lpxmh60KUf0uwB5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hEWyaf8z/JC4vRu7WOfToxPYxCRE5yifWK4UUmiuog=;
 b=YxrqLc4P8olOFeLrW/RZc3t8CIH4Nv3eABPEriEp7xJ+o+jlCxjsNfmTDUgzLfI/0iXLD1QVCF+XvkN/MFfyd36y1IkE5+CcFK7IbvJ843Z+HXiYxdTrK7mAdUbKY8bqQeRzSo1r4aLlA+o+o4wvv0kqxiOMzoUvOqGoU3IYwuNkw8cuhuabWgiAcj9cp74TcghtXW3j2QtSnhs9C641Qipy+exBqT9oNoukbDYyH7E18ruiEHhRq78d9xjywwF4d1vEz3e/+O2BQ8RZSE0fj+GwPQbJe+l0FTGDddwHEpGo9dhvuj7dSgCnCwxGfBpj142NBRW11NrwHBqUrONe3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 10:39:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 10:39:48 +0000
Date: Tue, 21 May 2024 12:39:45 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Fix xe_huc.h
Message-ID: <Zkx58ZNfZgUCOnOa@fdugast-desk>
References: <20240521102828.668-1-michal.wajdeczko@intel.com>
 <20240521102828.668-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521102828.668-4-michal.wajdeczko@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca44697-b511-4d8e-0466-08dc7982565b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9PQd+ziTb4D9GzzZWlVW1Rc88G5izupCk2UCv3rD3aqd1cvhf2U4sLSIoO4w?=
 =?us-ascii?Q?TAhrnBz6gM5iCcrLtFYmHoNJ4InDqE9QwPa/i02rTHTex+t8xIUGQ5FjseaF?=
 =?us-ascii?Q?8f8cusdx6rACXfi8bwKYRf89+s557E0qZ5CkMhXH9TmPlUvhFVveRvpBTdX0?=
 =?us-ascii?Q?eEo+nzG/hd3dZ6eJkU/s939geE+l1mvnDUBMc4154pQLBjQ6NEum2OWPUmEK?=
 =?us-ascii?Q?oWAdj+74qScRTuJx/y0eE43BWlnNsYCIlbX4Oe88eKG4jrOZNSwsqszvKJxA?=
 =?us-ascii?Q?f5bHPqIAE3H08/7nidxifthIlivY77RdvMPeLYIiaJ8/SN6CV5KxXz8h908f?=
 =?us-ascii?Q?bGzS/T95eUZfs4LsAQaKf4cED4yVZVMJuU1BXo4txGKR825umyXi/a/NVyu7?=
 =?us-ascii?Q?6xX/m63z3OhNKp1X8D02aa9JPsFTNL8fWR7mv1246tAiVHnRRTib+n9Q2KQL?=
 =?us-ascii?Q?S2SySR4dekXfWiUrJU+A9HdG8lNQnDoPQaTXKyra+S9+2WP39lIJkeljdOPu?=
 =?us-ascii?Q?8+9PUOeSIT5khJqHVYopOnb1fDcgFeP1q11dIU8dcS1RuBTNJpLg84TksmNs?=
 =?us-ascii?Q?C/jjHo6ql1TsEQ41jQLxOyZMBC1gS4sP+0DTwcbmWVYVMBwbFLB9Ej/Tl8sQ?=
 =?us-ascii?Q?OR1OaA0cRGqbFAv5I/hL5HVpC2JgJtSTmg2vkWad5NKfpkzpY4fx/08hbJzR?=
 =?us-ascii?Q?7ZPtHJQmvDleSjcbflZbB4M9MY5pTXahoZawyTRWvZtKDs4pht2c3kuAOhIL?=
 =?us-ascii?Q?eLB5hrUR+WbdYcyUT6VqlCzZlTUiuM8BMqY30bnG/tW5EKWrhj/R1A5QktGw?=
 =?us-ascii?Q?il5/ANOJtA7p3qAdLX3FR/n4gBxHZY04gQ9vY9+pq/I7hTZhuuhHWqKps+dG?=
 =?us-ascii?Q?0v0MBTbGAzMBhfvlTPFtCKpk/sAft8abWRs+0mk0bJ9YI9aCGC1OCaq0xDKj?=
 =?us-ascii?Q?huz+Ett47oqx5WrabD8Ev88aGr2TnxWCKv+1C7Lhj6Qg8284Ladp577fpumH?=
 =?us-ascii?Q?lk0+eUSxlp7Z2Y1ztaYSrathAMYAyH7VarODYl2XMW8ryo+BSqZQ1rhjZEYQ?=
 =?us-ascii?Q?iY88toLQX0T9QQKBo5SjtnktivR+SdEqAHsUQQ7QUXKBf0pi1knae1nEHPa8?=
 =?us-ascii?Q?PE+X1Ddfg4G+69E2JJbKEYGAWmvTLZM2yNXJT5nhuGLUGJ8E7ORzVlo1h8XF?=
 =?us-ascii?Q?OdzYBytUHR1d9Mq4ydURhNM6KzzeKAHHDfV9+/Zy+3BVlBo7XIoR+8MMT6b7?=
 =?us-ascii?Q?xdqz5D98gEa7zU9L3+7H0rU1uhxkvFYSfQ3dugzXvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N2rkgZOKprKUn29BDUXmuYbVmbyPqSxPtt+RHqJi822shOGZDRlM849q0zir?=
 =?us-ascii?Q?Pgntvo2FRfuasoxuTOrqKfMN8xfyNfClEVC9ak7w+ix61EpzCuY7S0UTXP03?=
 =?us-ascii?Q?yTKkcDMrfanr2fXXzb5d6VxR2veHePKRpwDGBZ2mfeXKHoEFTs+FNQxkMGnu?=
 =?us-ascii?Q?bN4dC61m+mt/XD9DgdImrmtsimxKYgeEA6/Vh2vIw0nj5lmWQJg/XlXdYMsu?=
 =?us-ascii?Q?HVqOS+BtpmhuFaPaYeufMtOr6G9YYYIlayhlNhsHyAspQenzxxfC3NS0fUWe?=
 =?us-ascii?Q?/KbnBfj6/6APId9hkPGuJV8Ik+Wb/UXIoM4zucBsA+mKjmAuKBbvB9FbUWD9?=
 =?us-ascii?Q?fJsESIfxJa0nU8AE+pd1rufYpy4NSj7BB4qNs7aKObqOkKKno11KpauoaUd4?=
 =?us-ascii?Q?IFESlmAPm16NkaU2/ZknK4xrleleDeNMe5BjIvxYrlJwHKJ/5mlSbcYfgnvz?=
 =?us-ascii?Q?N0T7CRypzpcnEZCzsqZVwDSLuaMjl4Erx2ro+q5Y8Uvm6MAyfbUDo5z8GRmr?=
 =?us-ascii?Q?KLDs9+ldzkO4X2baaddEm4Bn8j+AmyCYS2YkhKybSRdPvosgZOcZ0G/FiL6g?=
 =?us-ascii?Q?K7S9cJx795ImCOpg11cbCnnugk6FEl7ZBBVJt+WFj27SYVLdwzRemS15sduN?=
 =?us-ascii?Q?76E8Hb3ynZfCDgeF2b93/bHUqFCzcI4ieSlqtrSmzpgcqXuJ+pwIGno5MqiH?=
 =?us-ascii?Q?TDc69kQmcIHnpZVUksmxSw8P3IvPJD1+ptKruOKqKwnzgBXay/wWG20RifVN?=
 =?us-ascii?Q?B13S36S9hD8MUKxJKRJKyd0Tv+KlKhjuZrSi9l7ja7fiC+PxdjsMQPE64uVS?=
 =?us-ascii?Q?09pWLQg6FRRqLUA4J4yblNDvHeRT5sXM95DbHGploFpkmoR3dNvbqePGk2oT?=
 =?us-ascii?Q?SSQdVJ6WRdDfNkBokIs6mRAamwa9rJvPDA6iM/XTcU5rf2X8pJaTo94OlUJg?=
 =?us-ascii?Q?WLGmS3tGFE2QxB4s5Qthg3lWOI+Rw6r8QJDizhyd7Ao2ET9D0VDAPCW4eSl9?=
 =?us-ascii?Q?U3DM0Jr4jQv6MSoQatrbFpvLi/BnWH/Q8wWXviRn039O3t1isLnUUsf2uw2K?=
 =?us-ascii?Q?ee4pRkBEQ8yW+8nssK5wvo9Cmdn5ys/XhnvXCCnfPH5E/nunM7DVJ0H93o6U?=
 =?us-ascii?Q?D9cE6LV5RhdKpbYCp991nXAeyylQzsvZLTNsqxblXyylQ1dy5YY+44TivhG0?=
 =?us-ascii?Q?Bu8TuTyd8SP16lA+Wlch3G6hy2dI6XCMk+h6XNld9kBj7t3/UDy9297H8rQL?=
 =?us-ascii?Q?RLAwc6uQeRL9+lz9gmQqvQPcu0Ju75QeRry5G70RDjbbPTWoZkzr5CX2iK1q?=
 =?us-ascii?Q?5xyah55RJSE59s3PGA7Eauj1FkW+6BMNiBNS5oFrSiHgRZdW4eiVVDLyqF8D?=
 =?us-ascii?Q?5vR5HyiNsg1HUDSfdRwz8/wdhGDuy7ZeaTjpeWMlovcTG3/+WxIiRP0Cja8l?=
 =?us-ascii?Q?xlNBgPuGIgSVueNrDLgj200SgQpt1VZwZV2T4s5xsZgnXqz6H+nsASfVm5I8?=
 =?us-ascii?Q?KCgFDrJwzJtiAgmNjavxRwk8M30lYe+d/w6Hp2moy2cSGOjQwkvih+TKnaVf?=
 =?us-ascii?Q?b/RljuW+VBq+JTZIoDXt10Mi6uiDIbzql2RLzLNmd0BMEHq/eD+UyhJum6dy?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca44697-b511-4d8e-0466-08dc7982565b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 10:39:48.1904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wR2XVj+cOQXFH99h3+j4yvZK829JtPRpykBKsAwCucJ/kIssMzl/7mmud9GOdSn7wY/YWV3pbICs8YQ7NocVWp4b7RUxiHNTkKc3x+SaK+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

On Tue, May 21, 2024 at 12:28:27PM +0200, Michal Wajdeczko wrote:
> Prefer forward declaration over #include xe_huc_types.h
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_huc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> index 3ab56cc14b00..fa1c45e70443 100644
> --- a/drivers/gpu/drm/xe/xe_huc.h
> +++ b/drivers/gpu/drm/xe/xe_huc.h
> @@ -6,9 +6,10 @@
>  #ifndef _XE_HUC_H_
>  #define _XE_HUC_H_
>  
> -#include "xe_huc_types.h"
> +#include <linux/types.h>
>  
>  struct drm_printer;
> +struct xe_huc;
>  
>  enum xe_huc_auth_types {
>  	XE_HUC_AUTH_VIA_GUC = 0,
> -- 
> 2.43.0
> 
