Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDCCC369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 11:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5609410E753;
	Tue, 15 Apr 2025 11:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOjdQRT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3D810E74F
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744718383; x=1776254383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IJGM1QLD0h8YmjfpRZCN6C4s1hZT5LOKumLiyxu3Gvk=;
 b=NOjdQRT/pwufxyZ4ztZCvJcWGN0oLJzuSihg2uWvL3BVbUGqd4kcjJEg
 mQa0jdJk4EoSp8yLDKUoqsG8b+7ISqbzQ2nxSRuW9RYP8ZeEY/1bXsr9g
 QsDoLUMa0kJwTaJdlRxq/vhgDKHAsKgNJzLPHaYJBabLAXbkid1p9Pe7w
 xvXdD9Gj1SpXJZsNOEENWDLeB+uTd7KXWGvbD+VayQclgRsUqUAtrSxQB
 C+mWwLszxKVhqRzOnP6lyCJNsnjI/lhik745PnxECnmUYMnfNNrfFN2pk
 4BSKtuXyrGZ3wTEBnglmFYEvhlGx9tG2VyLtIe8tZ5V+v836hEpP2EWUZ Q==;
X-CSE-ConnectionGUID: IPJl0O2cTjC6j1v8tvnqkw==
X-CSE-MsgGUID: +LRa4xrJSKuWkOX7rhoOpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50048227"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50048227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:59:43 -0700
X-CSE-ConnectionGUID: IWqYYWJZRTqCeAjQ72pefA==
X-CSE-MsgGUID: 3nAaccTYScykCtckSzlBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129870217"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:59:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 04:59:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 04:59:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 04:59:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRQ3UKSJ6sMwPzqcy/Sr8qwfl769I0o3CNqTa3yddx4djtJ4VqAs2N3p8TgKS56XQbbzfgOLfQeyUGeNX1VdMsrMGYDCgu5NqmUopgYoaA2vMC9M9gY9Wiczy5Msi68NQNFyb2CGUVH+/ZkplGlIDjQAxHyJSWx628MuB8WrdIRSFd1XgoFpkIpVfDzb7wphSRBJtqT3E3j7SiJgWnexrBmQCGeEibTKXg+XzO8IOSIEAymW0o9IbR1+KcbfGHlyxdTWAYh0q6sobZiaz1FbZteRMX2YLywTxGF+qJEXZhmm+Ly+Eda0MuWROmIY2r4cASV1eByncHdj8QxFyZ2uJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhrObBTeVhuKGpS+uKBgcgz2+DyJaU5LZXQarF06M+s=;
 b=MEMiiJ6HxXV6MmGakxnt96pjQeOobpfCFHVAtFV5A62bG48BNdJCC8COtONgw9IkTHEUVMJXOLwm46Pt97SPFMEagBCI1bPlIgGjgAMppC1cDAP+2LvY99/G19REqZPi6IGvhr/fiGXv6R25kA1Feq/nPhOhQagVKSzFvk2zchd9FtbqC2054PReeIkN/Tst/YF1jQiHrAvacUVifk0iOZieXOgAjaiFzVXPQHk85s7dHzTr8yN5wivfAkmydXC6AgprmoX7MtY58Yftco01uPaY4Kfyx6vRDNdliqueLApXPNhhjmckKyb9hwQ4dMYBLKbTOeliAefYIbaY6CuV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA3PR11MB7416.namprd11.prod.outlook.com (2603:10b6:806:316::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 15 Apr
 2025 11:59:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 11:59:12 +0000
Date: Tue, 15 Apr 2025 13:59:07 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v5 01/16] drm/xe: Adjust ringbuf emission for maximum
 possible size
Message-ID: <Z_5KC1Xny1EZCxR6@fdugast-desk>
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
 <20250403190317.6064-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250403190317.6064-2-tvrtko.ursulin@igalia.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To IA0PR11MB7838.namprd11.prod.outlook.com
 (2603:10b6:208:402::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA3PR11MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc52250-e059-4ea7-7fc6-08dd7c14ef56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BVoQEgBXJ382rAAXOPal5+vR6gyD5Rg9lYco9xt257CP1j8RSR0LEtiCCVc7?=
 =?us-ascii?Q?DEiXcu5+yW3M5SyTEx/5QriMu6YWGY9LLt2z4AESHswM3yRKLNuJ5JNh4f7+?=
 =?us-ascii?Q?YJNm4uZXk1oE+e33zQVjHC5Jyn2TYOFUQSBShKxW/pfl6AfN4EM7njtBAWV0?=
 =?us-ascii?Q?SoQbUHgwCnU8IaqLfTgHLvMU0cq63i4k/1LHxaX9GNx0rzroGSTo+NNb1eZl?=
 =?us-ascii?Q?/ZvqH/LXiryefg05/nPqSp3Y60FC4tYQfYFyrUbPvxKvGiyv9GFQl24poMC3?=
 =?us-ascii?Q?SrsUeWCrfh6TEyKtmY0vBjWMeuwqExwxKwiJxvL6MW7ps5q6Ciwbb1d6cU0i?=
 =?us-ascii?Q?xDmysB+EqMIW8zRE7slo5uOUKenzjFjUsEywYjZjSrf+1hVUm1KXiibwq4L2?=
 =?us-ascii?Q?BiDQISjDR/SCi0VetWPhX6jTG7FaIBeYnr6MvEABQWS+KgX1bPLNKkJ5JCpu?=
 =?us-ascii?Q?1KG3cOrzx3BZWWT7di6Ails7mGlOWA3ye7Mx5QPyV4qEInn1VhQCAsv32C53?=
 =?us-ascii?Q?uKi1aim6zn0GDCr7mSIRcnkTSKzcxZQkO+XL8sJWmI67vlcx4SiG3Ytn1jLC?=
 =?us-ascii?Q?Zy5dF7A46oo+ua+YvStAzCftdXzZocliMPu2qgytaSwn8TfISxtk0SpIUMO1?=
 =?us-ascii?Q?4IVNmJi3QJqhjS6ZEDV7l4Cc5qR/Gm0XhMhy1+kYHCSmBoER26GdXUBq16Dk?=
 =?us-ascii?Q?BIsGyKsZ5xVyd8lDZLghhAnlfRXNvx2DC4RwOAFnMMEeh6hK+0yj3hmM2yY/?=
 =?us-ascii?Q?B6aXAtqCRx64obfK/Dhr5xk9j4csZLzPSyL6HhQl3sEY/HT8YeZK+D77sOqw?=
 =?us-ascii?Q?ictyrvKBXDpzco2YHySwHAxlEo+8G8IU+0E5dhXlGdgUqYWc7VXl/JdD2lJX?=
 =?us-ascii?Q?Byy35Nkb48M5BQhfIL2j3fK+EYZ4kGLHKkbuQlGf2rn2l8w5CL7JVKlaN2et?=
 =?us-ascii?Q?7gBcvfn2FhYReDNF4DxgYuXsmqOtHa8mA0NzWvejIGMELL0vEYwFBjDMfy1P?=
 =?us-ascii?Q?UFAgoOMBgEnWX0LatN4zcZmo3BQGYwuHKXtJw4QkO/ph0czVU5j6AFOehqba?=
 =?us-ascii?Q?UnWKGZoG4rGexkCuyvR7X6GJHqauNWZuVhfto3B3LtMMVEjrHJ37sGppN/Md?=
 =?us-ascii?Q?teWq5QMmjWv38V1AD3xM9wucIIkBML6K/TLeKIeTiJFJllS0EZV3qyLdLSF9?=
 =?us-ascii?Q?zfR2WEXSKQpR+EIRsTWRW53rQbjcuksngc1Wj4YJ818xkcEaO5q2JAVv78Ay?=
 =?us-ascii?Q?H5t/j38Xh4OV3OhCWwueOyTUyMa9Bbwjhw7XmsViCpfbQV7Db/mPmT+prKbL?=
 =?us-ascii?Q?ViHX9JNXtW2zg/Urt9GwLrO3sptd79jiCr+f3qE9DkZIfGI1Q7hfW8z2Zlho?=
 =?us-ascii?Q?5vLqQ1RODtbCXd1La77Jm47fKOZb1MRKYR3b+Mc7NW/LuTFxPGQP/Epnn6YZ?=
 =?us-ascii?Q?XOrMYt7nEMo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BSmT+FHGW+9w4yneUXU5OZ7/Kyre6YdHcsV8y1Bu58apiYJJ7btirOYGjVpk?=
 =?us-ascii?Q?ZwkBEelxtqK5YE8MmeKd8Q8VhMrh6y8Fl9jLhMETQORjMu2KE2tcjW60q+FK?=
 =?us-ascii?Q?KYDroXtBt+x5EP28DDWZ+iYSRF7mm1TPWIJLNDiEv7akq4f7szoClQWGRE5G?=
 =?us-ascii?Q?NfvZha/SU498R1V/A36A+qze8I4K7jiwveBMgGu7ENF8EdVPdkzq8QYID5fc?=
 =?us-ascii?Q?cZ9JDtVG3/q6bSCWASBNGDUhkk79N3sjtjqmjv5p/2fHUFUOgumIJBB9kMuj?=
 =?us-ascii?Q?6KgwndY9begl97QkHvzwUdyBvbwPpMQiRidqKRFPueOEuUqJgUMxCv9OS62u?=
 =?us-ascii?Q?TI/gcKFLE/hHgxLn1ZNCgdFgWGpI6PjoVJlw67c1yrfJG/pyyYVuf9Y0fh/P?=
 =?us-ascii?Q?YmNc3rht6tMnuiWC2rjyW4gXbZR8OLNhqRcG7ZU5nI7Lz8712LkRyDzpOTxw?=
 =?us-ascii?Q?XvRJMNyd0I9WDFdVr1xWXtFULuAxWTRLLcOpL2JnkPU7AHKyW4m+2qqUV2rX?=
 =?us-ascii?Q?Fo6g4K9sS+UZAP2SPwHZLvzanFBp4A6jzBbNnnBulEA4wyeEQYApi/xBrO5u?=
 =?us-ascii?Q?mdj3CrjvSHWsBkXckTPYt8OAd/UnJ7rEuYFB1FbE68VNByUbWBeEQkXW12WC?=
 =?us-ascii?Q?bOiA/sPwPVIPh/2AO3Xxol3OrdWmyQ4gf9V1vFFD8m4zDqOWCHYmgTtvjmFj?=
 =?us-ascii?Q?uWgC0J4O1JNc3JDdrBA33tg96VGTTWRVwJD6yHi1x2bCu6qYP3p0P0JNpKQG?=
 =?us-ascii?Q?/ZG3w+w5qE9NA7SGQdapbb7CmKkIIHF2ZOxLE7fGBXjIvSmcuDpPl8abONEY?=
 =?us-ascii?Q?fB/UlLQcljO1BZBGbvhPS/tl3Si0nFGqaIhrLtkkZ54rCokxM0mvbn1D8SHm?=
 =?us-ascii?Q?a2C6ve22M/qajm4u/+dE7/diQVBo2T3wgpBxjBrMcf1mxTJS77dTwEaIJ0MA?=
 =?us-ascii?Q?8QjMPceeeeeXadtpoB81aeO+vlFeGgXMayEbMId3f/r13Rf4pHLPq52koZeX?=
 =?us-ascii?Q?nHUGXZx9P1wHqziqEBlY60NesTfB+RU0q600mQguODTJ+XOh9LH/QQTBhW5i?=
 =?us-ascii?Q?+J5ES2q8k1i2LZadugLMzEj2MB4bZN772IwO9srOP15FftYTpp+L6ZGi4zX9?=
 =?us-ascii?Q?mPcMU7Bo6G6LP72sYl3EwCqetk13XnwHwmpM0XG/QimWvUpZH+k5m5QzZxDj?=
 =?us-ascii?Q?lgExDcV/PCFQq9wq9bqNTLzl+ebQ0BQ5tI5QCC6Zh3C6eNOe+yDA0MImrBbg?=
 =?us-ascii?Q?WjQWJsgNcEEj8aiJLI+PAvhZb5psi0Do7QT4/65aAL93wddPXqZ5aQ1Hcp/Z?=
 =?us-ascii?Q?v+bku7xDYiH7zN8phO5wYadhrgfssRMai6cpoeMDz9OcUUVB/7+Wag0fLys+?=
 =?us-ascii?Q?lbLiMbUTf16HxPgzyeVPVfatR74SU0n3WTyFnuWF30hpV0HEQ/HPeReVqEwz?=
 =?us-ascii?Q?5Ly+WP+yLkWmaszNbgHwAR9W+EdAncv6SDKjUsi/Cb4zzgadG/t0nfm2yRQh?=
 =?us-ascii?Q?PKB6EjELN+Zi2N4pOAt1HQ15AamPj1HBnG4VusTkuS5sr+qB1pWU3x5HN2pW?=
 =?us-ascii?Q?6NHg2WPVAtE8sT9xK7xRjYF+CPKMq1+x//qxwBjTIuygHfMc5XDx+OgQl/aa?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc52250-e059-4ea7-7fc6-08dd7c14ef56
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7838.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:59:12.5302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKwXGzMiSUIvGfR/vJcK54TmuYUwd4yQm6uoptnBLZiCVCuOWgBkdXR2DRm1cICW8IU5cGCh3mhaKqR7qhNvA0HXueJoYnJW+xqMw0RT7Yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7416
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

On Thu, Apr 03, 2025 at 08:03:01PM +0100, Tvrtko Ursulin wrote:
> MAX_JOB_SIZE_DW seems to be undersized. For the worst case emission from
>  __emit_job_gen12_render_compute I hand count 57 dwords so lets bump this
> to an even 58.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 1ae56e2ee7b4..d7e3e150a9a5 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -8,7 +8,7 @@
>  
>  struct xe_sched_job;
>  
> -#define MAX_JOB_SIZE_DW 48
> +#define MAX_JOB_SIZE_DW 58
>  #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>  
>  /**
> -- 
> 2.48.0
> 
