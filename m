Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA217C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 17:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D1810E6E6;
	Tue, 25 Jun 2024 17:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1CKYBKo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E3F10E6EA
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 17:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719335641; x=1750871641;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BDmH+k7vce2m3QDRJvPVC0v0OTTCsBpDyzkH8D7cJbk=;
 b=b1CKYBKorCmNg2ezJihku1Zn+m1PJOw3QMoEuKdtULL+Q4jRaiCh/B7n
 wBDqq2T+sU26YirQd/QQsYKKyN/aDK+5h8lOvk4w0N9rw3BTHysVHAdDt
 t9dyHkkW4G/ajqscTCBCLMpTiAPexzmAizdKlCW/gbfTViROdZhVFIClm
 y+ZrdeXhMAnmqtmI8fnwRWPXLZqPjXDyKRJdabS7awnIhlpPJeGORNsd/
 fjDdHO6rcgz7sgUEm24g7drmS38EEqP0UFTogYnsE96LvNu5tutTeugao
 ICa15b6oe1Mok4t5RAd1I8yXcMMBJltGVIosHQT307692xXCos+omm86q Q==;
X-CSE-ConnectionGUID: apZlVYLZSBmeCfH65t40Rg==
X-CSE-MsgGUID: HiK/yF3gTLeg8JKqApoABg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27779636"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="27779636"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:14:00 -0700
X-CSE-ConnectionGUID: oMTCCVgsSPSaMPapeUw2dQ==
X-CSE-MsgGUID: kSH25j33RwK+wgAyH8vlwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43690387"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 10:14:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 10:14:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 10:14:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 10:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9bVr4/cnq9CXtf7EmijB4qVFZ3vkrJ1ERZHlXIipraB/9A1tzfu5lWYOvum/oEDlvhBeJRHZdY3u8i+WBuGogEx0/oZarPKMYG5M8wOGKIYsR0ZQvpJ5JbwA9EGDfFhgZzpdhyMUttu7xMuL/u1DbuU1MKNGIOfJ1TijdJnUkPVSFmDSuit9VLL2BqqNo128tpBDzlb1JgtBZeQtN2pa5pJWNkOOboU++IIX8pYGi1lNRxvJXahq9BTPGvZ4Komgz8ukv91/iZu23QFF27ER3uP38AurFAN3GPz7s6AIWM2TQErz1nK1h5C7z5sNliPOtcsLmU6ohu549hYfKophA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wPQ4PQAlfrozmBUTT5hyjuZQSwjc3VYcaDz0d/eVAA=;
 b=m30B2K18JUFSymCuU1xWXOkm+zb8Wkh7ewooM6fr2oEEVsAj+DieaSRM960da7+TlI3dNZQlpDWayCNaRz/nBJXuqe61UCZOldb3E5EXp7BLdLJQRX/5wm7iTOZp7CIhy2X5D1GaHi2vyv6GFg3UpZtf1zRYxbsvyQfUqZllM+jNVtsWynBYdd4QmsPC6mdKUqh2XgVoziEKI92jPDnHajVA0S7IjH7qZKOl6M7OEaPeKnGtDhfLgm3Xo2IFyPkru02/vYWzTWM2sDr2xt5N1Zg+ErPEiucuuWHK1+Z8+mqW33X+jZS7Aj9hMVgEK2IpVK50BFJZYJekgDeZrCWLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 17:13:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 17:13:52 +0000
Date: Tue, 25 Jun 2024 17:13:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Use a helper to get delta run ticks from the
 exec queue
Message-ID: <Znr6qpiO4d0OdpsG@DUT025-TGLU.fm.intel.com>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
 <20240625165812.58411-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625165812.58411-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR06CA0035.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4745:EE_
X-MS-Office365-Filtering-Correlation-Id: c461982b-6c4e-45cc-243d-08dc953a2fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fenm7nAXolP9uUS705w8078zhHup1F728d0/S3Q5pi3R0LQqeUXDGlW0HI4j?=
 =?us-ascii?Q?dp9Rd0WX+61YLdujeE0R9vzIgZMr7pmW3mR+KoZ2/MDpuLSPfaYXt+fOPqXr?=
 =?us-ascii?Q?sWtoM+j84x14WF36oz6kdlQzsgcAlGcMUAYz/pmnYUU61b/eRMYqR3j4zrPw?=
 =?us-ascii?Q?dkUwyiO8jBUfMn+8PMjWGl0AWCVEWWOT0dOzU0tfkkZEzz1z34B5/mbHrkNc?=
 =?us-ascii?Q?s5HhSLtBSw+D3CRvwJCL+rUpdEjVWil54/T6Sr8ONL+T/3wYDLNy80O7HxKk?=
 =?us-ascii?Q?8phIuZmtGF7dbPf11X911Dmur59qJvkTEs8me4sfTxKSIq/Aov5Pw3TFf07+?=
 =?us-ascii?Q?+UZrv1NSZ69CWxXxUn4U+zDZ6Ct7CLravjvk8Qksd0hmdNqNhUe5cx2oszZ+?=
 =?us-ascii?Q?6JxLPm8hd6i9/eKToV+pAwajYDSX+HqHd2LeTmrPLuNFVS2E0yfdo7cDQsHG?=
 =?us-ascii?Q?IWrbmNTHmc/MdqkS1ZSSw5qWAG1K9+I70e4c7PCj9y2m92gWk4nuTlD3AE2T?=
 =?us-ascii?Q?M/laE1m3/PB1KV30ewu079yrlo33GgK3xDYmTb6DoFP995WYNBBJVHQVdLVr?=
 =?us-ascii?Q?8EN5ywo9BKffCzL8u9mHx6XDlKMGl9nirJNetBeUMA0AsBcpXGuLg7tFakVP?=
 =?us-ascii?Q?cvvwRqN8+JeXZE48dGLjAUvQOmf5fN8hM7i4Ii8B/mAInuPQ+awNHW2T2dJC?=
 =?us-ascii?Q?mbK/MIF4RQ5rQjByWCLb+2UBI7O/dN6lhB8YvyPYPxMdLhqQJ4Aq3XVMpgQf?=
 =?us-ascii?Q?Wt53fpqUQa/mXDGCx4Dr9onEoFstH0IhOc8cN/vXlzSbSP6RDxG6zFn9HLvx?=
 =?us-ascii?Q?JDMy3CKkFViBg9fExSrY/ZhfMmm9yLTPgJwMzrDhdSGH2fF3knBS6eoRxMJ2?=
 =?us-ascii?Q?Fy8hutsuWY5FuA4sf77+Z3N799Oq4gc6CaDOTfx3ljCSxERYvUdje7Kgo15q?=
 =?us-ascii?Q?hb8M7r5n7CNQ+xk0nJb5YIbVVCybMXJYhvn8dEFtMEN2Syb0jDyJ4u9Vf7U8?=
 =?us-ascii?Q?Z1yaHOZuKCsdqYH9koXe2LoZ8y3IISnSX8rZmTtJ10UiQqfBZp3MV378hPmW?=
 =?us-ascii?Q?cfoXvaQ3tGxmmTe8CY005R3UGGU7V5hHk+mzSloyZ2x7Jz8IBGQTYtHAWk6y?=
 =?us-ascii?Q?R1iRSwO0xbkpH6mh8iwa88zlNGlesdB5ARvgre4BqClJu2ZvZDNYROOBkjcd?=
 =?us-ascii?Q?g7DH386bRXdOIiSnjVoyRWd1wOG10p9EM8Nl3FrClb+dIcP1+3/IEhx3QiJJ?=
 =?us-ascii?Q?SCX5oylD1DXbafh89pk6PBqebAlSEYJYnjQhCIxFq/4QpbYgb+Fugc0xJkmv?=
 =?us-ascii?Q?qbQOX9vvGaP0qz/5L+U6ZuFw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pz0ybxkKk5duDk6X+xYggW2oFr+cT8tSYqjofmT6mAlLYF8iM5RtFU1cn6h9?=
 =?us-ascii?Q?FkOa8SPADh7XRo5hiCpMYRtIy/bQwRUwLOzVuM6rMgW9gEErGjzGuhg8YHF8?=
 =?us-ascii?Q?deM+WweeYQov541g88Xf2ymGO3r2DUmWDywFnSm65pOT4DWVmh/BMjmALV/U?=
 =?us-ascii?Q?fo+djWfvNcYkozmk5B/ZQ8lZQ/MLwlQ4w9l6UG3+u10jv84mOJkBc2l9db3y?=
 =?us-ascii?Q?e8odOLsD7wo0xnmAnk5WQXSrcIJ9KiwsXoZLH5C0b5zhIA5RbvmVdtsJOZXF?=
 =?us-ascii?Q?mXYv3r9J38/c6ysYLx3v5kkGfG8oOmkT3X2y5l1C+rHDH/2uh/oGbhHj9gyM?=
 =?us-ascii?Q?Spm/C6fbC7nhj44AMd7+uyr1O2AOA2pjeeCEIF9p4I/EiDVIrO9Ugb6h0sgU?=
 =?us-ascii?Q?+PG62w97CadtNQ4nlaOkC9iH4B1AfMdCay8sTqtf91zKwCVVoiq2WC8eS2zc?=
 =?us-ascii?Q?6XVt7ouulgD+J+8RBGKhDGLEYg/LeSHV/uGjDzDm8ZOfMsA/6xIo1NjpnFWI?=
 =?us-ascii?Q?WmXtOe02xT7CObEKVQH3PlrgXNnG60JTWlptAL2qO4k1tor7tWrgubXeGijJ?=
 =?us-ascii?Q?4OWKLfD272Vi7Vn6zM944hug651ux70m4gljOgnZcasFWG2X7/BopUM7SZcj?=
 =?us-ascii?Q?yH5RAh0OkZijzDj7svNUj/ZhCBACrl2VgHgvjgM1dNus0q/kXOhI1vMuprLl?=
 =?us-ascii?Q?FRmtEDYFXLPzBl+aPLV7YQLC9ZB46Rg46tyyin9jVcs5NXyDpSHoUNHXXsXq?=
 =?us-ascii?Q?z2HdphfeqQKCECWWEwNxaBGMR42/XDOyMeAQmdGX0VRzGg65wxNJ3ph2yUq+?=
 =?us-ascii?Q?9/kLwCkCDyKUpb3Qx49bS8ndhgys6hjq3TTefCTzdnBgPEtN8MCdumG8G2F9?=
 =?us-ascii?Q?6JGC2jnPV9IRCbGskvXEpXEMRhs7l1+iH9yLb92EoxB3sH4uihbwS9t7U5uI?=
 =?us-ascii?Q?kZ23mAW3s5e+55FNBYWcEHurZH44sf4lFBRGS6koocTqSml7I9Sdy4iW6X/D?=
 =?us-ascii?Q?B5t8iYuK2eWPFcEoXjuS9qna8YlrwJig2e4gcZCvnvhikdyi9nrdFlZS3KlL?=
 =?us-ascii?Q?XrdW3cuH8DX0lcsr0DNIywsHWJGi0Ys7q1XiTDV9b75aQJ7h2Lo8lP45YH68?=
 =?us-ascii?Q?Bunv7GXlqJs8+SjNhUCttHsnqT2xSieJwCs3DH6xDWhP3a+KdSzxdZ4sSXDa?=
 =?us-ascii?Q?tl1c5/HGGWS16wzQS2o6LXS5GzqYAH4gfJZyLKe0jQ3pyMReULjr01x37Ity?=
 =?us-ascii?Q?BPEQTCHQpavfxVGH4Lv2MnMal67d71yJL41sFN4ARYLJdpalzrwatqTKHkEE?=
 =?us-ascii?Q?o9DPV1jf89RYsvY7xhNJzoT4t1rLBZ/mVtQFGawXKDaLq9lehTvTZgvja4gs?=
 =?us-ascii?Q?qO6iGc93Nz/x/Fzmd5XJ92/uT0LkmH0toe5miZZlZDokW133jGOPq6NUBOtm?=
 =?us-ascii?Q?xAbkPbSmfjlkELwPXNvzrYewrsCsa63A/6KYt//FXNrz8drz2dYRtlTQOEVB?=
 =?us-ascii?Q?yBY85ZeK73pFgJlAE2SfkJ5tvPVU4TrUpb8g7VAFnnZ77EIKMZdCnkHD8Wl9?=
 =?us-ascii?Q?XKMD4lfAIXSQMYn3HVklGFwlEd4WXMyEnwqtSmMjjamLjPGsfBcs2S+e4Lkt?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c461982b-6c4e-45cc-243d-08dc953a2fca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 17:13:52.3869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0U9xI3BWqpOHk8MbYEy5xnOcv3iUgezFx+Khq333oKHzSZhx2qMwZ5tM2kAexVWOAOYmeN7lIk7S/x/HbQaYlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
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

On Wed, Jun 26, 2024 at 12:58:11AM +0800, Umesh Nerlige Ramappa wrote:
> As per earlier review feedback - code manipulating exec queue fields
> should not be present in xe_device.c. Use a helper to get the delta run
> ticks from exec queue.
> 
> Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")

I'm not sure if fixes applies here this is not changing behavior. Maybe
ask a maintainer for clarification here.

Patch itself is a good cleanup and looks correct.

With a clarification on the fixes tag usage:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c |  7 ++-----
>  drivers/gpu/drm/xe/xe_exec_queue.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>  3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 4a19b771e3a0..e0c4a50d372c 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
> -	xa_for_each(&xef->exec_queue.xa, i, q) {
> -		xe_exec_queue_update_run_ticks(q);
> -		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
> -		q->old_run_ticks = q->run_ticks;
> -	}
> +	xa_for_each(&xef->exec_queue.xa, i, q)
> +		xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
>  	mutex_unlock(&xef->exec_queue.lock);
>  
>  	/* Get the total GPU cycles */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0ba37835849b..4d90a16745d2 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -786,6 +786,24 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	q->run_ticks += (new_ts - old_ts) * q->width;
>  }
>  
> +/**
> + * xe_exec_queue_delta_run_ticks() - Get delta of queue run_ticks 
> + * @q: The exec queue
> + *
> + * Update run ticks for the specific queue and then return the delta when
> + * compared to the previous value of run ticks.
> + */
> +u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q)
> +{
> +	u64 delta_ticks;
> +
> +	xe_exec_queue_update_run_ticks(q);
> +	delta_ticks = q->run_ticks - q->old_run_ticks;
> +	q->old_run_ticks = q->run_ticks;
> +
> +	return delta_ticks;
> +}
> +
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>  {
>  	struct xe_exec_queue *eq = q, *next;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 289a3a51d2a2..42f683e5d88a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -76,5 +76,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>  				  struct dma_fence *fence);
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> +u64 xe_exec_queue_delta_run_ticks(struct xe_exec_queue *q);
>  
>  #endif
> -- 
> 2.34.1
> 
