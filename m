Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C52FC87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 21:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEDA10E09B;
	Tue, 29 Jul 2025 21:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dnqig7DE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC1B10E09B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 21:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753824747; x=1785360747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=17yvoSeP2DV9UOnrgNCl+jzAqDaMNuQhy8wDdhUygYY=;
 b=Dnqig7DEDcyVNZKUgrSKF6WpQQn6Y7EuVLLXdmtTJiRzJ40Rkj28qdBC
 bTRv3qB0qZYpA3Ub6hs3Jxlxvsxhunl5ERTzVmhWofm/bn/JtPiO2NPo5
 1ws6DLDpwyiU3pKrO5TG6+CQpOJDO8lnTsMLBl0UYTCIXCkFUFEBnapBV
 znd15VjupWoGOXjUwZlqmHGtoUuQyQoZ/KHYGYE2riWXMzjPVtONsr8VX
 TwznMiCUXmXPgy7WJCtogtQ2C/e0Bx1n6LQejt9ZIoCfANLsvsb0FA4nw
 Oij1f1KnyiLEqXU28QJEu24TUt6pTSh9pxdJfs6HN5t8XrBys2iZMtIQa w==;
X-CSE-ConnectionGUID: bk6+AJQJRjed81Mo8aWNZQ==
X-CSE-MsgGUID: ggy89ysWRGqUxMsT2V1vhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67468920"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67468920"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 14:32:21 -0700
X-CSE-ConnectionGUID: 21gv6JF4TPSoK/BXiThlDQ==
X-CSE-MsgGUID: +RiiLvJmRKej/IFLOhTL1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163154974"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 14:32:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 14:32:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 14:32:20 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 14:32:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4oxxN2gDw2AyP0jOeck91AooVwIDDxGV2fJMWeltR3cKEc0s78I6k7FNyMevRI3JH7PkvNlb336G85U6X7cHWQzrvdyxZXKIVZOsDMDhBpc/mOBZwlngz0NtI0N9YAvk0gDwX8pCv9+MfebbU0vexe8Kp+lF3eutBafPpkzvJCC62a8y5+GvkUNuC93cw6oMWuN2AHYz1zdrgiRDxbZCOnuowVfZOQfdrXqmCLtvWXdT5fzQJwhw/D80uN+gdvUm74bvrNvJYB4phGlzT5dWcRnFoQIZ7dUhSdNteBCNE+EIEw0H7oO6yQBN0JzJjKDnP1gXeprozRlZzh+tawkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQd0TQRw+pK7p4HpUGNkDmHWNjG3fACwF2zf3MPLT4o=;
 b=kGaP9K9Od3TFRbjaGG/zBwn8h6KvgvCHQl9xiBNNaQkcTF0gnaNcMPm/VFIz0PzHVfeRZeDkTCvlc00vSdPXomkLMzVyQN2TvZzC0UGZx4TLlNWuezxHpWOJxUqvPh8P7DAScnmvWwj5Y4g292fvF6TuAwplH0DzlAJ0xeh5AsG7A/loOOChl1orGVJedtDYWwfEBj6kvNTTyshOOXFzqVXAl0J2SkrxFiXn2Y/0Kr3liIa2nhqMKjin0kDnTtm/iO92ttFnQhAla7R43bJbH5R6xW+7czR3mzi+OPTUQSGqMYp6c/MphA4y1fvEhVqzGPOJOe6C5b/yDQmvRmwWNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7874.namprd11.prod.outlook.com (2603:10b6:930:7c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 21:31:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 21:31:38 +0000
Date: Tue, 29 Jul 2025 17:31:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v5 03/11] drm/xe/configfs: Destroy xe_configfs.su_mutex
 on exit/error
Message-ID: <aIk9t_Y6qSoB2WLe@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250729114215.177586-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 713e9d04-19c9-41c3-321a-08ddcee74cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g/PF/TVecikyhEFVID8Ga55rUEKj2AZUyoY7HWvV8dP042GSYbv03kJFx/kM?=
 =?us-ascii?Q?rOhEuUQ/fNiv/qBd9f7TdbqOLah3RMRpwkRJdjc4lmH2V2MDoMPtyka8mOIu?=
 =?us-ascii?Q?kSJkcJgg+rk+I4ncZkkni02ERVrhe2MiMGrbgcTgiQlMQj+Zx+PuM61URA9S?=
 =?us-ascii?Q?Hij6nLeFQ0Ukz038okL+Lty4efP3LjQfAGUkMwccHi6hfAUdtTb4m8q3X/lU?=
 =?us-ascii?Q?XwIHJLe6VMDo61fGt6vjMoc2TvsocXlBxxVkt9XrSH+xXMxiscoSdMGBU4nE?=
 =?us-ascii?Q?sbiykT8CeFdMM4e9iGllPI4jKS4d8LZV5yoLAvajOrZcNWf4rFQFY438ZsMj?=
 =?us-ascii?Q?dbZXL61WmLVUxrrSKh68XdY4N0NjXVv+hYL8nW+EXtIzazxrgMn4qwMoYhQQ?=
 =?us-ascii?Q?NNFC1D/wJsu35Vh7aZXOdRyb27Aq6BON+q6aMd1afjX9gIj8HhKjqbsLzPgs?=
 =?us-ascii?Q?w7G1JSt/Ld5Bz5ORPHGz0Hdld9Dzcscg8gAxkEtkGXBV41nIGCHE0Oj8M+MO?=
 =?us-ascii?Q?OGunS2CcDysrTH70Cos+A3U+RPNtxUrtShN3379Rvh5ZAJ9/cba3BFtpb8f9?=
 =?us-ascii?Q?PBs6mstvcess5kz2vnW4x2HTlLNDBniXesF0P/tak5AfvGkfYaBe1Fbnst0N?=
 =?us-ascii?Q?t30oYB+cmzpPTfJEoKTYFFmNA6s2fVImWaU07g3YznFN56n42u23fdGc8AsU?=
 =?us-ascii?Q?2QGqvR5SPSnBR2sIARkE4HD+6xYhZcqXG4GBy+sBAOc/PBDIFQQgnJHw9i9i?=
 =?us-ascii?Q?8lXOd7uKZYhs7IRvakGQXWl3oTnk+hAUZyfit/0xbGxJazt5xi9mCDMrhKa8?=
 =?us-ascii?Q?VMBo+/CzeGTZ7RrXXP0y50YliYsUXIJJmIYfMRuAYopjg8zVP3srrxIfo3rB?=
 =?us-ascii?Q?mkY8D7C2G8OiTo+A/QxHxLgEXxoZ87mscYFVmLEWXgHFoSVBh2oaYMqwZ5z2?=
 =?us-ascii?Q?Y1MxbIMGElNsVUudNLI6i4G4+S1R2dF1vNeuUEKH4DFchdK5jaKB7XJkYHSn?=
 =?us-ascii?Q?vlGEKR1Lrvxghbetlu2uJFHhorJEG1AezwoSe4HJPlyenVc0LpAO2ElHfSo4?=
 =?us-ascii?Q?X5GdqD/fPGHFRd4vldxEeh7BJtKU39r1MtnEANbrnd7yKCPqIQTFT+EvIF/h?=
 =?us-ascii?Q?sJjKwQNZrhiccva/EPNmGdINx9OLdJ890XgStVpiSilkpJoVFyEKZ1Wkqugc?=
 =?us-ascii?Q?4FXCypr0QzPhK7kcTBrM5s3bjtztWeNn9VDDF5WgxzcOfpIHGArNG9sCvgjY?=
 =?us-ascii?Q?AiaXQPbeIvFsmyP3bcyvgTaVoDWAwi/6knSIO/X8pXZEkrXE0T4EHhlhtOss?=
 =?us-ascii?Q?1wKBOQYTDilfuAEgYrqoTMesPTybrgnPDLN91rBBAfCxCVUshJQrHHEz95By?=
 =?us-ascii?Q?WzuidL+H6glZrAC406uxmn6JjR0QsjoxwObk1F3Us89RLEJFr4IHvF/HmzvZ?=
 =?us-ascii?Q?RNCp5CXSves=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u1AYFJegqjD1VTnnPvLHtVB/zv1VHdTPq/39T2IuJtbAVLjmihnAZpID/Rxy?=
 =?us-ascii?Q?LqH/zXeuBBIxtwtzfwmDm4Cntpjq+LKb563tZhfiz4TKBtQMMw2QgwYdwXWu?=
 =?us-ascii?Q?DV4RD2Fe51zQWbx6TV4xPmrXo8503W7+eDxVTbcCo1QAENLLYhGCRdcvqo1T?=
 =?us-ascii?Q?BWeW3fpSwQIUN4dzRnXRVpWZ1OsMdinsEaAH63WzL9OSpW6adqMCumzQPPgF?=
 =?us-ascii?Q?to2tUgb82qpj+Gp2ArDjwKX992oUQkJOcNJ8y8BhSc0ouRpyXdz6xeXMAoBk?=
 =?us-ascii?Q?tyidgFQBId/FG0XXXJFPq8aUjDKZMGmJ7PlK7XJYf0LAk7S0JZavp72iZwec?=
 =?us-ascii?Q?nmwr9p8xfQsFUKZdp4JjaINYZZaGRgYFOEHxrMy6YlVA0B8ek5iCrvuIr/l+?=
 =?us-ascii?Q?YZmrqH/hh0/lcm9KPU2rZV19x4t3ZsMGVX8RdPqAsE4SWK0/2JIjFcJZUhYC?=
 =?us-ascii?Q?7B3Ws8WNtGcmZUWWQcrBpPHK0GuA7ewpodfbAo3coiGJSTMkbZy/sSTftxHP?=
 =?us-ascii?Q?I/xr5tYUl/IxTijMOCctB5A2OhVmUXyITVp+LnBK7bxBnyr0q5C4pbc0RtUJ?=
 =?us-ascii?Q?sHzjIA7ZoV6/VMFByMtuO8Tc1C3TN8SCV93CbmrDw1dVUQCb5o0J4SmZdrlB?=
 =?us-ascii?Q?JUknWXTTTxB4q7hGbXRHmvfjSYi4ugSb/yX504cb8eLuQNkJ1yQB5ZyUaRnd?=
 =?us-ascii?Q?M/rApW8XwEmpcmLGbapXGXDT/yflYMKZZuD3z3PKO+ni1K2lFxfxfWBfIV+v?=
 =?us-ascii?Q?faE7H8jupse6DzCjdVVwTqdnKRWSOtmie54AiUuD2yL/836WvLLKdJdoKpHW?=
 =?us-ascii?Q?Xu1QXz3spQ72CtIIippczHFHY89Jc4akBLlj47coq/Yqu0FtItJWZBcYi730?=
 =?us-ascii?Q?e5CB3EXGCW0C9n0mIu2cwboKhIAyeVS5JWDxJQqofpPaKH0/LudrME5j0Y8O?=
 =?us-ascii?Q?jj7LUQQFF8QfPuSw6gZ3R7nujSbWZBQcFnFnHUoPR3KA5k90TkL5Hd4SS9lO?=
 =?us-ascii?Q?8AhwkZzfwlAcQ5V9Zn3a50aJ0FZD2NuOL/VWGsEBYc2JBnxWu5lwwJ1DhUMX?=
 =?us-ascii?Q?JyVN7IWbpDsFJCUaIQwzuWpixnhf2e0NqpOlzEDpnnPCuGLOEDtDuZlKrS1h?=
 =?us-ascii?Q?alaacUVRVINRL5baOUVdORdmW7EHU01yKUsoaBLDn0M02wDMfNSIexLNbqEp?=
 =?us-ascii?Q?/BiBIxqH5KlvtzOpvhSSW/eBFTlD4wiTMzqDNDnUgfavE4fES4FCcB8ohKv+?=
 =?us-ascii?Q?1VazfsdZN8ygUE61mMDef04u/FgeOlfrQN8NBNRizg72ii1VZa7oSQrR1Ocf?=
 =?us-ascii?Q?485eG0kVsn2n1J+ziwSFyG/a2RHn6Cl1ejeyJKRya7MsWBROuGXvtahbQeHO?=
 =?us-ascii?Q?2IYT5FS6RPj8hdPSB32ZW0p21p/lPIHhXy4zXgBT3i6uaskXFnP6oQt6U+vd?=
 =?us-ascii?Q?lLjPmm3IQSQZk+vuAjLXros0uQ0H13nVFfmEns7vb/auQCGVtLoTv9aAkSg+?=
 =?us-ascii?Q?lDYGM75oAYwrTO1ofaNJN3FR3AX9arj3l/AlhkFABYFEWm+El5mfC2LN2Wuc?=
 =?us-ascii?Q?5W/Ysag6fnYDgeizsZTRLIKXY6ztgIu/Mr8VEkQ1TRfVrnGfN2f6x1zssk/B?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 713e9d04-19c9-41c3-321a-08ddcee74cd9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 21:31:38.0740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2KY+DKZjsDldmFqhbU2ee2lamhvQKsGFmi/ff9OFmjXu56+XvLJF6F3XVZq3dQvuocn4onWqXmE2WFGpWHPcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7874
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

On Tue, Jul 29, 2025 at 01:42:07PM +0200, Michal Wajdeczko wrote:
> While mutex_destroy() is NOP when CONFIG_DEBUG_MUTEXES is not
> enabled, we should still call it.
> 
> While around, drop a traling line.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v2: remove pr_err in separate patch (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 36e2b45b305f..56fbf4c1c37f 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -401,6 +401,7 @@ int __init xe_configfs_init(void)
>  	if (ret) {
>  		pr_err("Error %d while registering %s subsystem\n",
>  		       ret, root->cg_item.ci_namebuf);
> +		mutex_destroy(&xe_configfs.su_mutex);
>  		return ret;
>  	}
>  
> @@ -410,5 +411,5 @@ int __init xe_configfs_init(void)
>  void __exit xe_configfs_exit(void)
>  {
>  	configfs_unregister_subsystem(&xe_configfs);
> +	mutex_destroy(&xe_configfs.su_mutex);
>  }
> -
> -- 
> 2.47.1
> 
