Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2BFC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D6510E115;
	Mon, 28 Jul 2025 19:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQK6sKbm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E241B10E115
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753731579; x=1785267579;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2Y8by6I3shCCsndLq6ufQopgBzi4woAUhzuUXw0oKV8=;
 b=PQK6sKbmdbHZDdtTs9rdkLePZJra5pX825NCpnlSTntxzmR6HkeVUwy2
 ClkTUrRfzO24m8EoDCGUFxhGx5rA8lhmv9Nly68PeOP1px+lfbHzv+Rz7
 lEWpxVMzSCdX649CyABjlqIWMZtfhlgsDxcFfvHf+YMhQ3xXinN/uxTc1
 /OncE93jHtgslOCfgYDpYvpXgln/umcYGnpysKcJIv5ylqFCqB5i5lakK
 +Qs7JYGFqnMjPV0gBOlInYPIKuNw1qnMkft/R8lwT3JG+Zg33t59WV2F3
 zo3EtYxtkHoWmzOlNOoqCV5EUyGEIpJKtd8FuLtpt2dk6EfdWhp/q5Den g==;
X-CSE-ConnectionGUID: w4cNKYxdQAKoBCkDAYSL3A==
X-CSE-MsgGUID: BMpKuw/JQtmmN2vROYGGOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56140423"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56140423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:39:39 -0700
X-CSE-ConnectionGUID: kZK4BJ04QJOMJvm9mrmUEA==
X-CSE-MsgGUID: vUmnajokS8qdqYh/dUhoKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161761920"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:39:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:39:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:39:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:39:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4j+GMAqM17Zb8I26caYyHdu6Qje06hLsWr0TODUJCJMzxnjdPf3hiTa8vpgy+xkaiExcWUelKouZsDUhnHWQH0TGSo7DSqKXVq8OTsHhA6tvgdc7oTfL+Vd5gcaqfB3xt/ZLxC0rILzLLRvnlq2oI5N0uTAYMDROJj0s5aBXko9QSGVOaZi1AhZfJR9OEfQNplBn4s3VGrUgHsZvUSJfBxJkeGi3XYX6I6EOntZp7rTJyvlFJvucPGSfdpMCxhM5lwxJsEer5dSc+2sNlh6nKpoOjHnukBdUjlrIKYCvG3uAhv4mPYOvJJHD/uDTqnK+pfznq6jZVfJeHiQQhBFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tf685uTYVRqMnU1Miv6hAZ/xGG56tJapVxQbYO3YnM=;
 b=FPv5cc4fYvMtBXRtIzUKZ2taGE2LpSCDUJjZ4ZO0BCZhIUv/rcKFlJccnthbRWkziBpc9tDBXKnep0ZF2gxAi+Vb5nqYKZUXDmaHKTyaM2rXNGNhk9sc8/ZGxCEGLCXipoKr7M6wlHrFp5pYG4N2yDHUJT7ZXaH2okiwFbRv99hMgv3CMTWCvVhoYkEvRcW65xKh3vfLw2tuqeWdLtBUmcRnEB4OJP5MA6RgR0zlKAOWUkS9g6gLT5gZ3AfN8+1FpqOe26qiQuD1vRYTAJM0IzkR/Ty21cJyQOYNzfNrC/L2XtqD5y+mJh+zNKlwQ7E4mu+T5nF1uDBOeIRBCIgd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:39:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:39:30 +0000
Date: Mon, 28 Jul 2025 15:39:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 02/11] drm/xe: Print module init abort code
Message-ID: <aIfR7noIcrRAMnJf@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250727172009.587-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR20CA0019.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 9418fcd2-4188-4ad0-b1fe-08ddce0e7849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QmAvwV+hQ0owHH+A5+Cg5vmXYIenCUcQ3YPbWutap8WLJbPCg83N4jvpzE9v?=
 =?us-ascii?Q?UbxyhRY3CQWM6qnenxei3nUXU442KjN5s+uavxnHOn/3EMivTMTDIJiBKumg?=
 =?us-ascii?Q?CEH5SQRRe8jVlYvYu3BWZsVMWEC3LXRFEHIiE9vkvIq6E17yETWp94iTFWsT?=
 =?us-ascii?Q?HZ/mXGSYrIDzkFMHgUrv8n1jFud5XeObtiSONaKmZTLbB09wl8Hhn4OplB/C?=
 =?us-ascii?Q?5eG6zyqH0v73BAVtC07hc8hwxEVFPYoufD1ujdhQMKa3yelTKaohkeuKQBjg?=
 =?us-ascii?Q?D6KcBZsJHu+JX2J6pzkwUogQPJcQEQw5KkMTqtV6ChDQruPOEUlbVSEFQfzv?=
 =?us-ascii?Q?CdJ2I8G3/Rqsg9qOO/qfMEQ6Bbyicp+4vVmL0jt7Iazoj9LXlb/5FvWG/zQa?=
 =?us-ascii?Q?Z5WOLaFi/U5tiY9DTShMPaih6MOYSYD+6e+JJqXLdin9NwdvLKpb/pSbtDLf?=
 =?us-ascii?Q?IcUYhYh8XuhW+9PIWkigad2cVVqOoAaGZQ38rrmif21AxuWQiOAdhAFN6i/4?=
 =?us-ascii?Q?tCsjA/WWkkmH1kOx7N4Hb7ekuxiIENRqO3okUAxH9eKp74aWrOVO8RQAzfnk?=
 =?us-ascii?Q?3ySO1qS7fn909oXm21ElAVR+ynN1lHLFdE/1GseLhERymTHLxFB0dJH1knAm?=
 =?us-ascii?Q?Rq6wsDegPHb6Uio+rmARGuee5rHcoOlgPmzOkKWttKqiaD267qJ6w4TcAKFa?=
 =?us-ascii?Q?AdELxWri+yPPBZyaeQQoki09yc9H+f4yT6aaNiPgE33QU7P20OCRqemypybx?=
 =?us-ascii?Q?kx1b1uEzmWT3DDQQ/m9cd0NlLmwR9MglW7SK8Ep2XgGc+iWcQfYmmSes/E9D?=
 =?us-ascii?Q?TRyJ685DUvuSTdSAW8Y4lc7h0I+xDnqkXvO8pOSMiIRcDymQMyKZv/k96cl1?=
 =?us-ascii?Q?2H3VciJv6tevnpCZiXJMYyc3QyXYxMNWaeRqQyuFFjrEJl43fDbfNc2Hshx5?=
 =?us-ascii?Q?8llE5/sByOIyypJUsIVOTFHN8bDSmicBRmuh6UMVE3blcQ/KgcxunR/tB4K8?=
 =?us-ascii?Q?nu5CIdQmmvMa+zTgBzPN0XFhhU+GwQuO5zyNQk65Lkw03pdZcgMJ4iBPPpZa?=
 =?us-ascii?Q?3sjPQa2VfEbc77g6kiDP+7sCV2h7IjWk0SVPg1/LrBaaT59arnRcqRKDwY3V?=
 =?us-ascii?Q?QWCOm59j6vHpROKjPExhr7wfkWYHVorkWtOmedUnVQ6/oG6u6cLdcco3HyeC?=
 =?us-ascii?Q?Svv4sj4wtgbKs5nTTYArhOfEj7i0LpGEgDG5mzCFX13RVvWvIPIumpUDAIbI?=
 =?us-ascii?Q?GQWcx2EQ7wKC50NtzWD4rYnskq8x20N6c4fB/bd4jMhkQrXOCJfqTC+VH1dP?=
 =?us-ascii?Q?8m44aEjiwKnawmT41Ia9vlRlO0cY6MaBFYUmrHfe/nN9lMLIfv6z593uc/Fd?=
 =?us-ascii?Q?5l3r9bWB2n4aYz5e/HdenaA+fCGc4xEq+JArgNB16HOx+jZqF4V6y97t/Ozz?=
 =?us-ascii?Q?Yh6sAU9p7qw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B4x/Nvl9gdPxYbXSabxpjZVh5ihkVvXPCvbR0LqZHUl/He0P1bgiwqWj6zZf?=
 =?us-ascii?Q?MHViGeiuwGA4vzclA4IKMkXQrm6Y0Cg+ztI7mxC7e0SwK63jbFMh3eW8PiHj?=
 =?us-ascii?Q?ifEvjV5VuxQX+oESNnsZ90/Sa/z9+aRwd1uJX6KNe1xUfdh2xfwq9QjCDPV4?=
 =?us-ascii?Q?xC1BK5O+DiMnwrkZqifmoJRcmk8PmqIzyTRkJUEwJemcFMOLZQVivVpF+p/k?=
 =?us-ascii?Q?Uglx4yYYtw73r2eXAqXq9LHsMi2EgLplyRReZrZJI5GL8mcGWeTp6Fyi6zJO?=
 =?us-ascii?Q?J1SiIOjh1Ya9cBzAjDMh0pdhn6d4swnhR2OV+/tTsrY6VA1Gi2QffljdBv85?=
 =?us-ascii?Q?DvJ8b5F5G/rQAVhDioGDkoYdlsQ973QwHtlwm16WHRAFZOV4/w6j6g8/w2tD?=
 =?us-ascii?Q?AILFpRHT7JkCFPYCjjfhn+YDst3nQ4iPYq+uSnGbkFdF1dQ+IKAAN3UskmPs?=
 =?us-ascii?Q?P+nSlgMCaRgVC3+jZxKhTQgD9Ei+kASdg2+5g34WhWsh/xO4ohfkKHHLq1dl?=
 =?us-ascii?Q?ewakgksaZzfplvmFYg0xZrALbtwW5z0xTE+wr3rDErgQHn7PBOZs0y7pRj8Z?=
 =?us-ascii?Q?e1MSIjYFcOmMR+WSMIPaAYStdnPghrhSzjyYdmqD5dXDUzEebkMfNwwHTFs1?=
 =?us-ascii?Q?imtY3DL6JiY6/eRW2uB5QCCwgpQiYIe6yaMlbyCd9KFjt8ESgb2OmZ3pKNgk?=
 =?us-ascii?Q?+Xenjj9+XmycqeHX+bK90hj/zIZkrxIv25v/GY6U+S8eRhTW0xR2yr8/TSUf?=
 =?us-ascii?Q?MhCnzIl9vKTR7Iex2FfMwrN1rNcucK7cLFwNKy+SyeIqV0WFVObFqSig7XqH?=
 =?us-ascii?Q?Nmwbg2Uw8pcivlcnF6q9P3UN9e9LKc17WBKkzD8FphJkfG81yCXe5ql9dnky?=
 =?us-ascii?Q?oDH3L0HHBqpHBwS580l4HITP8ZRCOwFTY226Cr4A7p+PP5N2KX8wcysnnnt8?=
 =?us-ascii?Q?ct0U33Vt8HvWp4JH1ilsZoYKJ5VuZXlIWu0z+qhENGMDhdtPml3Foh3NJ9mU?=
 =?us-ascii?Q?l1U8rru8U67o0bvNWQWmOl9tSgxV238rDIKKJFCNFw+MHOcWvNBeo+/4/rEq?=
 =?us-ascii?Q?apfoqrQGa/nIqcDOTCUXLj8zKZsMWsXoHjeXsOL95DJWAqWRbpn3NGszKjN2?=
 =?us-ascii?Q?J2OTsRx67BHaocwpT0SGHXtWqunglPodjzRO+reteaJKIOP/MhTKjz03op/T?=
 =?us-ascii?Q?9Uwm10EbtBLzTlfmvkLysjGvmUoTlwRky9BGF/MmPgN+eKSPrjhlU3Kj6b4c?=
 =?us-ascii?Q?8Vj0AM+SKisUmc31soHWEJIgzViHMFj34pIjk13OKhL5WAVzxaTluB6YFuSQ?=
 =?us-ascii?Q?TFFB86FyGMo9cyHiOIEcLBHFhmLPdWvJeAXpfnNFKqyKC2DNKlLXfu+kENer?=
 =?us-ascii?Q?EEa8E8YKJejA0oe0EhWk0xgTQIX2KrovWtSSW0QR7L0WHbb1t3Q0JDXt4NL7?=
 =?us-ascii?Q?TEfELS4JDSIDZJVUr8uXpGGelkTm8nVaCcE643ANffw0gvTc662+dTlkRq5M?=
 =?us-ascii?Q?a646qqXEOqCBOPvjggu0tGDvrYQfrBqPS1rtjiGrpNKuGQTfFPbyB9AKs7av?=
 =?us-ascii?Q?gF53qM9cBrvSRs/lQ78DcQKxSJ4M65IJVSCQND07cmq2gICTLXHhqe/PLo6t?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9418fcd2-4188-4ad0-b1fe-08ddce0e7849
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:39:30.1408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KpH5GxTRjH5XUl+WFF2HFDqMK+Pt2KYxc4iFSfFMBrBCbOIjMjv0Ta0yaDF0vAzplKV4Xxt3Q/WXDuQs+NT8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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

On Sun, Jul 27, 2025 at 07:19:59PM +0200, Michal Wajdeczko wrote:
> We should provide a hint to the user why the module refused to
> load. This will also allow us to drop individual error messages
> from init steps.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 593bc9e5851a..23be7c4cfde1 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -155,6 +155,8 @@ static int __init xe_init(void)
>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>  		err = xe_call_init_func(&init_funcs[i]);
>  		if (err) {
> +			pr_info("%s: module_init aborted at %ps %pe\n",
> +				DRIVER_NAME, init_funcs[i].init, ERR_PTR(err));

pr_err ?!

>  			while (i--)
>  				xe_call_exit_func(&init_funcs[i]);
>  			return err;
> -- 
> 2.47.1
> 
