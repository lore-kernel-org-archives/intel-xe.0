Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF10C25B7C
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2192A10E13C;
	Thu, 23 May 2024 17:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxNrGkmO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528F910E13C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 17:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485937; x=1748021937;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W+XqxsoTfh/X0hsXaD5nRZQye3UzwAcDlRWQsU40Z7Y=;
 b=kxNrGkmOotAdk2Veh6z7WqWGkpZK2X1fe/cPl51H1H8kjn6p8d2Ort4x
 EnVcRQ9C6W6mqtyLVW0pTHL+DJGRU1ILXD9vPG1pW/5zTclIBxNWYs/3E
 OHHobM0ZMhmvxQbhdPW6gyvJ02cLXs8NGExH7F2Vvf6wqIN8q0qZjAq6a
 i2/5qiuRSiFHnf9BpvAaP7gpOI9lLHnmd8gno0uFnT9ySkF2pbX07m5xG
 Qqtde1iNQcmQdZraY7JOgT137xGlhhUHQUy1eEsYldfnPj13lxJxTrBEp
 sKjWkdr2hNP4rPQlT5794vAqUkUP+vkzOAmjgXp/zkCF5bFFRC4QNnUs1 w==;
X-CSE-ConnectionGUID: vXwxomizTvSKbUKVCpvX0g==
X-CSE-MsgGUID: /pip5UDnRyipL5zB8w7+Pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12700266"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12700266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:38:57 -0700
X-CSE-ConnectionGUID: 85EiVZzoRmqg+i62vEBCNw==
X-CSE-MsgGUID: KDJUdFzgR2m8keOXuk6I2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="71157580"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 10:38:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:38:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 10:38:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 10:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEcns6dX+ai4rAhsIZDzruThxtTHOF+J7gh3Hjltdz68OHK8eaXB/zmv8l/zkIoW9g92f0zNT1umW84BXhXT/ijTtlYi7Ff+GqeMQ81sRK4CLCer8wivXtTit0HKPgqYHdf99hbGl8JRzrxEa8GeZ5hij1C3xUKqhCbR+66jGaKy1dkWCLtr3166JcAMtdr7T5ZScRRaN9T2SysNNup2C2q+ZZSyFMheUHjpsGZB13MDG6pKSOeQJULtf+e+8/zWdBSLXfZKqKNYKCBZPigyyoy7Mp1wZ1jHzhgyIjtmb2UNWTKWVztQSvitVZjBlZ7lZ6miwcz49Gwpd3+5RsQlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDoR+TN9lRvd+DYnQ5JagjEoAOQxv2nOaYwur+Yfbew=;
 b=k6HVltKwq74lqdD4zv6EyLcyeRuM0UsP9EfIpFa2ce9HdMZaZI+vYEfQZFPkQuNtrggtipfCiAJHZjUfdp4Lcj+QvSTH3sQxeAsMFo81Y0SEOI2LpCr+qn5oqI97v6s/zR0Fbzd+Qc/B3aj7u8Jii11MIM7bZKsMWQTKDaLh44P2y2UK56R78iIT8fB5AFfBArAjygB+4CZXHYNuQUSMS+ckribOq6Wnbqamwj21aGK5VMYDMc9mIcoKVI/xHm6uGcfIWnbNke9dcxTMAWciFxPALmmeVg/EUuo4xIuOONSV7KJyUyYVt/2HO4+i7cg1XCbPXRHjn6kI/xIXrZg45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 17:38:52 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 17:38:52 +0000
Date: Thu, 23 May 2024 13:38:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Nuke simple error capture
Message-ID: <Zk9_KenRCyXr2KII@intel.com>
References: <20240522203431.191594-1-jose.souza@intel.com>
 <dccadb04-7aa1-428f-9d6b-4bc0f328ea3d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dccadb04-7aa1-428f-9d6b-4bc0f328ea3d@intel.com>
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: d85f858c-9bda-4354-8ad6-08dc7b4f3658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?awNFYoFIuzfjy9Y7IsSWjc4j/TUjBmG8UootNzDoYUhW+V619R3zXpESf0?=
 =?iso-8859-1?Q?wrFeyj4GQIWo9KHqLbfstk/klkbP1WDpQFhmwaE2G9vbmxcANVHyLSO954?=
 =?iso-8859-1?Q?NFe78Jwf3SrwMPiK4ncwn1KSqZITlBy7PXvrhH6f5U+hKEo8jPtXG7uJsw?=
 =?iso-8859-1?Q?HhbYe1cnCoZ81pMGWrOeRUBVbJegczQo5CcYrjfhc8doVlLZQz7bJPyhUg?=
 =?iso-8859-1?Q?l5nQecJM1Jj17qb0Ch7DTHrFjx4NNQo/f3MKjCHXymN08fseEWevirzqjA?=
 =?iso-8859-1?Q?HrTGOqiAzB8O7iBYG8jQHsO9HzdAvni+8+6/EKBpto8+BzjeSvkUeljkZZ?=
 =?iso-8859-1?Q?SI5EY7EK2K3aPdY63sncnw1JbzRHpxcKzxjP3wq8aA48xB5Nutp3VVaviJ?=
 =?iso-8859-1?Q?k8yxS96SuJedTnMIFScPyjnS3LhECo9k3wObosc4e/dd+LZWuMPlODH1Xs?=
 =?iso-8859-1?Q?bINLxQELcVr9Z7KZWVBRcxavJib8AHMUXHLAL0VaByKcftTZGPRsvYauwe?=
 =?iso-8859-1?Q?8tkqqZDHXn90CbDp3BmRSMEiIAtH7NH5e3zLcpJjawjsD0i7FZBzg1QjJo?=
 =?iso-8859-1?Q?kfYX2lugZqCxLafabcDo5e0Q/2C38ipSeQe0H1/CMV7DwXrVIAqGKDr3BH?=
 =?iso-8859-1?Q?+3OtyOPbLQgvFmSSLQ0xYsiistU0vvwYIV1XLaLzBAHLM/b/hX2SBo4alD?=
 =?iso-8859-1?Q?yNBuRogR5dYWkPr5tAP6m8vWw1clIlNahxBnh6u94vkxp4cbSUm/4lZQdG?=
 =?iso-8859-1?Q?cTbjTfxWVOodKfbeS9ZafBodPA2gq/EYXRmnFpdRI8fWaN7ytZkMWtiTWs?=
 =?iso-8859-1?Q?2IZhpij69GZWihaKPAAtmw7znmIDXlLiF5axfsl9IoC0fWtNQPJxHwIgZo?=
 =?iso-8859-1?Q?QmjB27j0BVo/4ZYJ//fJlzYBYNPFuOVK2fnuiq/gBvJ7wlG2Oap8hH8XRe?=
 =?iso-8859-1?Q?aj/p+eIBKIXt/3a9GycdAJdrdhdt7+5N2TCUJ5icATwFuEYi+p7rMA4LIH?=
 =?iso-8859-1?Q?5bhjDNfk+NxpnFJ5CBbrE8bwaT13Ggf/LYIX5ZWHjcJUX9QwIyV1mth097?=
 =?iso-8859-1?Q?yCwCpcr1/vdlvdkpp8cq07NEJaqk9TkSOpniw2rnvyoJhH3gOEHQApxykC?=
 =?iso-8859-1?Q?V01kBw4jFb5IssJQXHqFXt1knjtfjcY+7jQqL46/YFb4I00JBsVm6v19YJ?=
 =?iso-8859-1?Q?5nkGzfwOTN7QFaNNr1iZHPP1Kp27Z65ySXuGakyNqWJsSvTESI/74deUmO?=
 =?iso-8859-1?Q?723JQTNb3QzP32dOQnMg5UPIBNlzEc6SmwczH/9NeXSHwLAxIkzNh1dVGC?=
 =?iso-8859-1?Q?57tVMO0rEaaTHRTSC8NQfWZmVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4+/iSKIs/YRzpoaGToGZRFtSjDvK2jl2wC0axarQWlWEqcD0u3vSMWZi20?=
 =?iso-8859-1?Q?/Cf0ef6Lhs1NAlQZ6wWblbHGLfTUuXgTcWX/2EE/A1geadeCecaJf0+SgN?=
 =?iso-8859-1?Q?GyMcBugogho4pV7Z3+wnQxvQ7uOzqRaIObP9KC7Wsr6035QJJ3cB8Ibwfz?=
 =?iso-8859-1?Q?iXN7dp5Qrqc4Zcb7yL50NSqHz07g3pqfzrc6blnYhInKHKz/c34Fl7YRCd?=
 =?iso-8859-1?Q?GRXOegTO3IyB1RtkHYKbF2BYLdeTN19OobUPw7V2ZUdZOqnUliPxzXnHWA?=
 =?iso-8859-1?Q?C/VVq3+z3jomqR740ULxQ+A1eDyp6gKqtrnu0ySDY6wkniGpSj5ZKnHDpz?=
 =?iso-8859-1?Q?2mH05i9Rx6wYOU0co3/B7fjI3eFl7XStD2bTzjD344l56jjjeHhNwyb19R?=
 =?iso-8859-1?Q?X35rLOuU34RJQP2I8rIdRbYWCDPfKfLz9/4tzm3BG/o3fHh50rwQFCSijn?=
 =?iso-8859-1?Q?MVXVI6BHIhhDt0D1UZuDNYQFrOaTlujqSNySlZWhNsZgVXYiI8lGtISnhf?=
 =?iso-8859-1?Q?AxbJiMljdsTvxjmW/JHtDOli9zlP0wCUTlhSY7hm7OKXxlvuay2d21bgSm?=
 =?iso-8859-1?Q?LmpSUOy0DnmsNy/HkrcgFiCOcInRW/Ma7zYwRAaQc9MtM0hlEMAnPLx5fT?=
 =?iso-8859-1?Q?CbOWqV1EDideniB9bq3KQoiKpyWv2NCt3UuL3Sf0pPfJpLu6tf24X7rKl6?=
 =?iso-8859-1?Q?JIJacEF4olJFRKeVpRx2OnrR3y30QCgATZMcsWTVxHQYNa5AqxGcwzmZiP?=
 =?iso-8859-1?Q?jEWnUI3SJxZhj0nF+c1cNdTKUTpK2781pUQ5FF3iksgIIEC0NgUh7IAcGQ?=
 =?iso-8859-1?Q?Mp63k8inhX5HL7v4dz37v6G5lrD2BBveNPb/ASzjAoJ9St0czBO/hnhQ+T?=
 =?iso-8859-1?Q?966g6hQA5be7fIkJR+qGnozHRIE8Po+6XQAUF5SmE7p0GDEK+J4QyikjVF?=
 =?iso-8859-1?Q?gpl41sBLTG+PXCXHHJdoAyqOq3g6eg7L6PCtLDHFajVThQtUrY5yQeDhnL?=
 =?iso-8859-1?Q?NUh8qpiLmSNEQEZSmUmB/N4F+X7z5WW86dX3C/vaQ1imH1P3BpMBycQTW3?=
 =?iso-8859-1?Q?rzFLeBF6j4EheyVqPDjZnBnYrb4Evoh09PBNEk8iArhl9cnjeTmOP+M+DI?=
 =?iso-8859-1?Q?LwZ65yu8R4K9lv8qsdiKN2lf84KTrrKKLo4BhNQjW/8YablHJq+wacNTpk?=
 =?iso-8859-1?Q?Vl2TS0nv6sXfHoS2h8mPjC1XzN+kFwjvcCTzgggpzlLc4DJthDiTaNSG/b?=
 =?iso-8859-1?Q?KY3qJIQHzmdvpSlchs0V99swejRu3YyISWiMZ0Uv6aiM2IuoEoSMM0OjCh?=
 =?iso-8859-1?Q?49BhkKKC1yj0YWA2Ba9OoRUmHa7vlJufTjRK0J7EKdMD9ZsVSugEPvzJJb?=
 =?iso-8859-1?Q?FXYodsNhDy93T18MRT0Uz0iQgWKwQnebHh/9la7T/IVoY10XU9rnAlkN5v?=
 =?iso-8859-1?Q?r97GYiYEc15xlmzkenqt32iDmiXh9A/G3W8Co/d0p6TFNG/omDEG7WujDn?=
 =?iso-8859-1?Q?tzz5kYjvR8BYFclYbpsaFi6xfmL45Afvstol6YyRtUsD0IH9hCdB+gWaS9?=
 =?iso-8859-1?Q?8ZwinN3c58Mof4u1A6Qo6y3dSlrGH6m7yRdlGH42cCqb/sUFkp52cEP2RP?=
 =?iso-8859-1?Q?tHNgggOZjFf/gyK1YSLqOWDrc/G5+lrzxJNTfekW/VhcFEOCSjA2enqg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d85f858c-9bda-4354-8ad6-08dc7b4f3658
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:38:52.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2l+x+o5eAKtsXqZYXRPvIPxLbMf01P52H7B2lOgTUwaVRjshfvd+Xog+OP5BzZBAO923e8fHSabzlLsvs24RXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
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

On Wed, May 22, 2024 at 05:35:51PM -0700, John Harrison wrote:
> On 5/22/2024 13:34, José Roberto de Souza wrote:
> > This error capture prints into dmesg HW state when a gpu hang happens.
> > It was useful when we did not had devcoredump, now it is a incompleted
> > version of devcoredump that has potential to flood dmesg.
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

thank you both, pushed to drm-xe-next

> 
> > ---
> >   drivers/gpu/drm/xe/Kconfig.debug   | 10 ------
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 53 +-----------------------------
> >   drivers/gpu/drm/xe/xe_vm.c         | 49 ---------------------------
> >   drivers/gpu/drm/xe/xe_vm.h         |  2 --
> >   4 files changed, 1 insertion(+), 113 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> > index df02e5d17d26f..bc177368af6c3 100644
> > --- a/drivers/gpu/drm/xe/Kconfig.debug
> > +++ b/drivers/gpu/drm/xe/Kconfig.debug
> > @@ -61,16 +61,6 @@ config DRM_XE_DEBUG_MEM
> >   	  If in doubt, say "N".
> > -config DRM_XE_SIMPLE_ERROR_CAPTURE
> > -	bool "Enable simple error capture to dmesg on job timeout"
> > -	default n
> > -	help
> > -	  Choose this option when debugging an unexpected job timeout
> > -
> > -	  Recommended for driver developers only.
> > -
> > -	  If in doubt, say "N".
> > -
> >   config DRM_XE_KUNIT_TEST
> >           tristate "KUnit tests for the drm xe driver" if !KUNIT_ALL_TESTS
> >   	depends on DRM_XE && KUNIT && DEBUG_FS
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 23f73577facf6..f0a5215159003 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -815,55 +815,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >   		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> >   }
> > -static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p);
> > -
> > -#if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
> > -static void simple_error_capture(struct xe_exec_queue *q)
> > -{
> > -	struct xe_guc *guc = exec_queue_to_guc(q);
> > -	struct xe_device *xe = guc_to_xe(guc);
> > -	struct drm_printer p = drm_err_printer(&xe->drm, NULL);
> > -	struct xe_hw_engine *hwe;
> > -	enum xe_hw_engine_id id;
> > -	u32 adj_logical_mask = q->logical_mask;
> > -	u32 width_mask = (0x1 << q->width) - 1;
> > -	int i;
> > -	bool cookie;
> > -
> > -	if (q->vm && !q->vm->error_capture.capture_once) {
> > -		q->vm->error_capture.capture_once = true;
> > -		cookie = dma_fence_begin_signalling();
> > -		for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> > -			if (adj_logical_mask & BIT(i)) {
> > -				adj_logical_mask |= width_mask << i;
> > -				i += q->width;
> > -			} else {
> > -				++i;
> > -			}
> > -		}
> > -
> > -		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL))
> > -			xe_gt_info(guc_to_gt(guc),
> > -				   "failed to get forcewake for error capture");
> > -		xe_guc_ct_print(&guc->ct, &p, true);
> > -		guc_exec_queue_print(q, &p);
> > -		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
> > -			if (hwe->class != q->hwe->class ||
> > -			    !(BIT(hwe->logical_instance) & adj_logical_mask))
> > -				continue;
> > -			xe_hw_engine_print(hwe, &p);
> > -		}
> > -		xe_analyze_vm(&p, q->vm, q->gt->info.id);
> > -		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> > -		dma_fence_end_signalling(cookie);
> > -	}
> > -}
> > -#else
> > -static void simple_error_capture(struct xe_exec_queue *q)
> > -{
> > -}
> > -#endif
> > -
> >   static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> >   {
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> > @@ -995,10 +946,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> >   		   "VM job timed out on non-killed execqueue\n");
> > -	if (!exec_queue_killed(q)) {
> > -		simple_error_capture(q);
> > +	if (!exec_queue_killed(q))
> >   		xe_devcoredump(job);
> > -	}
> >   	trace_xe_sched_job_timedout(job);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index c5b1694b292fc..53f196cf447b4 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3389,55 +3389,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >   	return 0;
> >   }
> > -int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> > -{
> > -	struct drm_gpuva *gpuva;
> > -	bool is_vram;
> > -	uint64_t addr;
> > -
> > -	if (!down_read_trylock(&vm->lock)) {
> > -		drm_printf(p, " Failed to acquire VM lock to dump capture");
> > -		return 0;
> > -	}
> > -	if (vm->pt_root[gt_id]) {
> > -		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE);
> > -		is_vram = xe_bo_is_vram(vm->pt_root[gt_id]->bo);
> > -		drm_printf(p, " VM root: A:0x%llx %s\n", addr,
> > -			   is_vram ? "VRAM" : "SYS");
> > -	}
> > -
> > -	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
> > -		struct xe_vma *vma = gpuva_to_vma(gpuva);
> > -		bool is_userptr = xe_vma_is_userptr(vma);
> > -		bool is_null = xe_vma_is_null(vma);
> > -
> > -		if (is_null) {
> > -			addr = 0;
> > -		} else if (is_userptr) {
> > -			struct sg_table *sg = to_userptr_vma(vma)->userptr.sg;
> > -			struct xe_res_cursor cur;
> > -
> > -			if (sg) {
> > -				xe_res_first_sg(sg, 0, XE_PAGE_SIZE, &cur);
> > -				addr = xe_res_dma(&cur);
> > -			} else {
> > -				addr = 0;
> > -			}
> > -		} else {
> > -			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE);
> > -			is_vram = xe_bo_is_vram(xe_vma_bo(vma));
> > -		}
> > -		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> > -			   xe_vma_start(vma), xe_vma_end(vma) - 1,
> > -			   xe_vma_size(vma),
> > -			   addr, is_null ? "NULL" : is_userptr ? "USR" :
> > -			   is_vram ? "VRAM" : "SYS");
> > -	}
> > -	up_read(&vm->lock);
> > -
> > -	return 0;
> > -}
> > -
> >   struct xe_vm_snapshot {
> >   	unsigned long num_snaps;
> >   	struct {
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 3ac9021f970e3..b481608b12f1b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -243,8 +243,6 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
> >   bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
> > -int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
> > -
> >   int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
> >   int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
> 
