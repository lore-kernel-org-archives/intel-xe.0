Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C47C54FC6
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 02:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F0D10E171;
	Tue,  3 Sep 2024 02:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6cx4gH5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC0E10E171
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 02:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725330967; x=1756866967;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H5de322QNGxRXP1v561bvecYZR0eAnf8p0S5v27NTrw=;
 b=Q6cx4gH5zbQr9ajCTTIG7NxrzBSiMCtj7kaCYRn2ychXM/Brplo4Vbo5
 5ne7xyUeM5VcgoGR5kWqlwoZWyvxEL1Ovf9EZN7YpML4cxQ/VG18P7BSw
 TEXqLtsK/4R77hhXo4LK8VQ7o30Gh25F4yTpaylGuTQ6G3n8FxEyf4ZK0
 uOjawo/x3kzrknMGYoSdQr7kPZdxDQ1dfTHiAjj3lRXv3kFKyaIhPC2mH
 M+yBymLro8rb80DiPEuM3JNdIkF08/rKfGpJvu94PsUp413eJqFzYLskL
 0buko10Q+lD6DXNp8DY+k2e6LwXegokhjPw+5qKoC2FQ5ztLwZgq2cgZ8 A==;
X-CSE-ConnectionGUID: sAWYhXXnRACXWmDIXBEd+w==
X-CSE-MsgGUID: yJucgjq5TVWN4LTNd1yYrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23784113"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="23784113"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 19:36:06 -0700
X-CSE-ConnectionGUID: bWc7gaz+RUCf77zGkEiCMg==
X-CSE-MsgGUID: 7NCDkzoeSWyU52b3VwDIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="95554389"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 19:36:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 19:36:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 19:36:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 19:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QI9K2+jvmHCKsCYiHV9KKnBk/N7XyCX7oI1ZvRlGkO7R1SW82QjGivjIx6MZvM/M7h/jvtdwdtQEwQ9cSrc82jZbRli4uvpSyZcu3K/81GmNfLV1w4L5BESP6KwaBO6wUqrlGC0ZXv3YcI+0pKZ7HeJliV+h75DiwaAuFaH9KwHq9DESC3yNPDTNh0OngIJUQP/uNuCtc4DXdP7sU0TTSlw9dc06TLf+I+61jacwlBdEFS8Op2vWnJEwbFn9SMCcTpeAJp+OlQ9GJ5nFQtyxxndnO48y/uYoe5LuhqkIC95VW7VWxWb3z1nQwneZlpmKVK/TarsKjcRDir65Nvx1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUREpjM1G1HiYy04czdhoxf9OYMcTHhuqVBmkv4lIbI=;
 b=lc78YlEHtuwJ/7It1SObcX/ZBz35crzRI59FA3BKAYGiSzlE4bpLVS0s82uJadaEVHBHCNTE4mXjnkX6g5Ef3E9pEEW4knKI90RtaE/YWZSA7om4fsb8u+76K3RFaZxGICr2Yt0HtLN+8i0hev6qChZ2eJagvULT7xMJyznIpBhb8zzeCH08KkDZk1FjNT2GPakQ5RyFKcVwPHN64qs7+4vGGWDG3hSSVmZuadMW8efqi9NMxbZV9kiwfk4GDWXP1z54CWTNc979xt82qsBatkg1nqC43SCqf0Zjzlzr7twPhQbuns4Xqmlh+JSBjflr7G996b5B9z2xJKk/lPhqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 02:36:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 02:36:03 +0000
Date: Mon, 2 Sep 2024 21:36:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove redundant [drm] tag from xe_assert()
 message
Message-ID: <ircnhwlne235oljnbf5qyfamqy2uv7tmsshmhfc3wkg6husy72@m4owwy4osvyo>
References: <20240902190726.1748-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240902190726.1748-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:303:dc::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc2f46e-7b64-4e01-03bb-08dccbc12790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vHruY9FjfTaOA+nXazANwqjmAwcWuo1/X6mF/PvrvNJmaaBCQbkwTiNlBob3?=
 =?us-ascii?Q?G5oRYMFxEYu0CIhWij2hrMwSWHu2th1V5xFWOPli3ZnOigk7LPKf4qrCB26q?=
 =?us-ascii?Q?KAkkzK+FUh1ypsLb/I0o13LOPZ2Bs5qQnfJT2rLMeAagFGG6EeOh97ulwF/Q?=
 =?us-ascii?Q?0Z3mXouuSLpFPiedAb50Vd50oSSvJkS1Kj1bVOo5U2URRY+06+8k9X0di1qk?=
 =?us-ascii?Q?TdIb3jVqf8r3cVTX9RLLwJ+ACYlUF2FzLPa/r2jX/vE36P4vSzuqexi3n+HW?=
 =?us-ascii?Q?t5sw9Cr2une2uA4LAxp5I5hAf6k83pHlqFJ0PD9jVdFGH+f0VOarRJ8oYNG6?=
 =?us-ascii?Q?geKLourpy1lVT0VxopliNZmcyOjLKzXEx8JsaXkev4pO+VYJGsFmiGH+vkFu?=
 =?us-ascii?Q?OmZRj/oNOOfNuzeuW3P0rdH6lpnxYTzPvze25dfA2J1XJm3VjhXXchO+Oz5f?=
 =?us-ascii?Q?6lHrRiDYeELmhJ14z5SlaaGlVJnnZgiz1tAXMg33BvCl98slBTVhFlpfqJt7?=
 =?us-ascii?Q?RfPXuayA9tjhylabXSd1AlQdoa+QLumoZZ4Im9rD79TaBF6ID9dR8/55QfxX?=
 =?us-ascii?Q?lm8EDHcht5ch3rxjf23PJ7g7MNPSiHFx2vfPHH4JlLhq4clqaWjBR91XBnML?=
 =?us-ascii?Q?obtqEr27L0J5dbtxLZELnYhfi5AQvHnQo7hNlAr9Q65SYWZTS1T5S9kv1Cl+?=
 =?us-ascii?Q?Yu7M0Q+B7sPy+bWuDTp1cdyjhbdEtS1g4yRUQmJb/0gricA5Es5NV3FHM+wh?=
 =?us-ascii?Q?9CQKh6VUE49Zv1bq67+syMLlzY9rXTN243WdyTQNh8mCJwOfm2vnsUHVRlcv?=
 =?us-ascii?Q?aEp5WfVsGANhPw50IaDlnGMVY5RAQKjQ9SNt/CXj/GQlWr0wxoNf17TVThQF?=
 =?us-ascii?Q?L0f0mXaT/MgQjceCEH8r+xmJklHU4bYtvFCK91fcufAcvx1/dLFnRBbBpFoF?=
 =?us-ascii?Q?ysBecoNmVeQgZItNMUME8surslVqC8xnKN2AU0K7Op48cT4PazeBBRaVAI8a?=
 =?us-ascii?Q?2bpmGyqrVzxXXzt+/MYRTIqUjI+A29BDAKqDcQm7nKGsl8UPi5xvFd6gRj8v?=
 =?us-ascii?Q?mLgRfSk0gIxNgfvXWWZPAB2ch1Vx1xpxTUXawyKYGu7pC3x5KPXvgLiJHzy6?=
 =?us-ascii?Q?6nPAKPH5XnkznntC5yi7NvI96UCSDT+gF13Od9sCWroTNoxYaCeTBaf5ikk2?=
 =?us-ascii?Q?29WFE1GaWuFY+NoGG9Jjl/PYsBVgjhZvMgIs05SvH+4U/E/zbBx9oc9ALjbw?=
 =?us-ascii?Q?Bye3t41m9UMey9N1Fr48MTjL9t+b2TfpQTxRhGGv+QgDznJeYqd09T7Erorn?=
 =?us-ascii?Q?WndMuwxHzi4Wc/KKWep/uG8U3HUunrr0GrXPuvWsCTqCbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0qItaX1j+0rdLDuhFWZHR3GH5z34ij0qFTuFUfX0FaAXsGAZvBJBA37LLHfn?=
 =?us-ascii?Q?/cBGmbUBB3i7JX6Ru38uELXwCF5ZqoI+MWimg4jNEwkqG1BieLfJ1qKc5nVg?=
 =?us-ascii?Q?jj7Cz0P2cSPhaXitfmQ81fjqNDbQVqfjJZwYVOl8X1cTR97jfmZo3JZFDkMO?=
 =?us-ascii?Q?c4KOrlt/wEzNCA/LnK2X/p4/4K1d5kZBcmoYYcnvtLEEhfw2WQR0ZCS0z7a+?=
 =?us-ascii?Q?eiJ99ngTUqVCLrocUkzwIWj/mCHB0Mddg6aSUls5c1kUdfdcSxHl7+1dOPyB?=
 =?us-ascii?Q?WIIfl8DhmXUDjoBvSgNfp3gn11W1bHGyXjRiTszTaEq9gdyexuLJy9s7mvc6?=
 =?us-ascii?Q?DlF4crSQL5yBNpTq6Bu2SZeSLX3/07vFIEhn2yRnaeSHH1ciOR0qXul+coQ1?=
 =?us-ascii?Q?qPOpHCj2fcYwjoYe60rIuihSxhKiZ+K9RhKuKTGMdV7mggufERavZUO2r7Y3?=
 =?us-ascii?Q?vxTt9cLez70Z4BRTvtF06qsH8qY5+rgAzsr8x8Qk4/7HwmJVWDvwsiePQHnv?=
 =?us-ascii?Q?7uhJ0GCzRShdGOU2wGgr1HM3F5lMitRVZ0qWplmc6S9iAjMUWcVdoW5a3icw?=
 =?us-ascii?Q?SbSuW/X775YFA/egfo8fn+KlAoL/zclUB+pvESoERbmx8U+XS44G9+vFxyIK?=
 =?us-ascii?Q?B+F5gUoNYVK7Bhbn6KMnDR7YA9XeuUM3986ukw8knfupJJQJtWGmAYvM7YhC?=
 =?us-ascii?Q?Qll8mx2apGwSOy+cApNG8ME4JOuqCM0znEZ6ryF3tqxU/x1Y4nrnG+x0em/K?=
 =?us-ascii?Q?MvqfMORlweFrKOMSem9Nzjz8qlpo6sxAg1kv5q2s47wFRbtMDlzr9HqzbN3P?=
 =?us-ascii?Q?S7cF2niH/WNqb8ZN4ZSOBNkuL5v1+RdgH1561s8NmAlizT0KGhuZ7aKyoxeY?=
 =?us-ascii?Q?KWodfevJvuIiSoe1vm4cU7D0v3PhzaUTfGQRzkjvM1jqoHWFmmYADSSywl97?=
 =?us-ascii?Q?haSo/hX34xOa9Dke0dPNBKaTf1l0oMTFnVnek4yaNX7P7OWXjQyELHxrevwm?=
 =?us-ascii?Q?++9DPxUxBXR8VnFtKxFdCtjYSmXc0siPQnmmFtP5vOKBCAAOjehKfm+wABLS?=
 =?us-ascii?Q?yGPO290cEda/Z6zOwmL3MqIF9ogDWPcC1bMa3Vdyxp2T48bCCoQBnDuT3FKf?=
 =?us-ascii?Q?h5sLVGVzWIJRfXTR4r7VabnBNzQzKg7e/heY/M2fOeQkkOFi4SqHJWnTmM69?=
 =?us-ascii?Q?9OIpDkAGs20bpQPQCzARW+v0dPxHm0khiGB+FBl+CGaahdL+FZfx1uyoR6hp?=
 =?us-ascii?Q?j/y5np13Ef38iZR8bGSxXFcaSvDNWUl8qgVWr5eOTXjjYtWpG1Xv+DJP14pb?=
 =?us-ascii?Q?/FsJH3c6D6MqYfVNQ3rMxNhJlDe/zpN5jgEzo1U6H6kcS8zK+Cy0fA7+Hrfc?=
 =?us-ascii?Q?aYbcEszg7SQ+qtPPe+a09+ntOp9Lj3uSNYaXHkLYBoKlR4d3MJpNG7moatIM?=
 =?us-ascii?Q?h0+GLHu37YORGIV1NlvMJLmknjVGvEwX/LbblvPntZAkmGl0ecs+193gs3nC?=
 =?us-ascii?Q?HPZc+mHV6+ptDGaShJWcQL5GQXt/3n2yMHXCFoQIqkl0NNwNbnzSjZkju+jr?=
 =?us-ascii?Q?plhDZaLDMTPmi+l1Jbp25nuZuxyAS6c7r43ojpK86vNklUPi3Tc/qLlRYdlW?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc2f46e-7b64-4e01-03bb-08dccbc12790
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 02:36:03.4022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQkLzM51QNwRP7dDqXax1QGysccbPMPdvaBS5dgW4PzBA+54xl7E9akD2SwfmjbApCvUfxroBHXZDxtnmXxyu3eUs4An0A9OY+RUjOBbjII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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

On Mon, Sep 02, 2024 at 09:07:26PM GMT, Michal Wajdeczko wrote:
>Since commit 178c0a33c421 ("drm/print: Add generic drm dev printk
>function") the output from drm_WARN() includes previously missing
>the [drm] tag, so now xe_assert() is printing it twice:
>
>  [ ] xe 0000:00:02.0: [drm] [drm] Assertion `false` failed!
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_assert.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>index 8b0cc1bc9327..e22bbf57fca7 100644
>--- a/drivers/gpu/drm/xe/xe_assert.h
>+++ b/drivers/gpu/drm/xe/xe_assert.h
>@@ -81,7 +81,7 @@
>
> #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> #define __xe_assert_msg(xe, condition, msg, arg...) ({						\
>-	(void)drm_WARN(&(xe)->drm, !(condition), "[" DRM_NAME "] Assertion `%s` failed!\n" msg,	\
>+	(void)drm_WARN(&(xe)->drm, !(condition), "Assertion `%s` failed!\n" msg,		\
> 		       __stringify(condition), ## arg);						\
> })
> #else
>-- 
>2.43.0
>
