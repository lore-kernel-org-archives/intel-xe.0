Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B4AC83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 18:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ACF10E946;
	Thu, 10 Jul 2025 18:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0VY5GIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B448D10E946
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752173573; x=1783709573;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AngvFkGLzn3UW6ZLuS6LLUPTLAd3C9F0VVh0aBuxwoI=;
 b=m0VY5GIbMlMzZ9vXEhYpN7GmmAZEx8Yx0S+ZtVdZtiTanBn86CPOgsml
 H6TyoC7He3/aTz/FKWdZYdJoizl0X7eElEAm01THTXpRyCVKE4+TwslA8
 gBWTHaFk6AQy+b9Pj6qHN6z4yNOIXvp7Y2+gRKfzF7Tw74IVb8hAxraJY
 HBMv/3gcdF1W2j/iLM3iZzpRrS8L4Mq6RJO6gBTl7gIsVxdp/3MzU565W
 fa52VCK2+sHHl7CShbrL/TyjgNTV3BEmBWLTfjVi1RUfYUu3lyIqKOxer
 TAIt9YwOXng1+//anMgJat8Iufp0vzvM31FS910nI9WILgPsU8Q7ignoZ g==;
X-CSE-ConnectionGUID: dP93jX8IRyqrQ09/HxPGMQ==
X-CSE-MsgGUID: xVIPqF1MQ16ZppFERuLTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54439610"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54439610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:52:53 -0700
X-CSE-ConnectionGUID: PNyCoNCERWOgCneIOl3hQg==
X-CSE-MsgGUID: 6KTJcTNqRXCQ3gw9TF4Wfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156651363"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:52:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:52:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 11:52:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:52:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0NslXrb9BnA3G3twM7MppSAdwx5YlwqEYMvbOh7gJS3ilgfYl3gok5yJk/CYzwrTsmxRwScBPc5K15sdIm+T2ud9j126pRjqnt4uTYSA2gR7N3TyGNCXfxbKI+r0UeCHZvljyeLEWA1ArFFh3+pPIT+5a2Catts+ziFV2eB0Ypznl9GqZA8Xy4uV2zTFMd3IZSA8tD+nAM/Zvp+gp1oF1/gPXkZTuc23apPQnR17CTsVDfLMblkT04wFdECVqDO+ATympS5tlb0MyDwEvuAcMCAa+ko4bLznLLnQI75CW0GeQYLOLsVslGKvX8nEyPV5rODh0q9lcOd/RqvTc5rnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIaD5XrEY58UAtJK5XGH/cMkjybL9aUeZ8n+Euq42J8=;
 b=Gg+IhDjAzdsKlVuMnOLMc00zOgjPBnyqeVuPVqewS/Zh5+Ka21CORHM7J5saZikgHu312DY2Ae/k6HFyxoqqN5RtEfPbjr3gCeRUM3Z1XMjt2Ck4JHiWcvQZl9k7zdSpLowpNyspKssBw/xaPqfMuUZPhyZ3+DojgjhCDj6dhEFk/QJ79AY7xtoYZ2os+T8p0dbzV3fpW++551/8mwd1Ib6UuoJ9Ztcq5aIi5yA0K0ih1DuIGbJOajmPiHnpW8o7/fANhI+oOUkmpj6DkzJ9jurNh3TZEQ7qv07e28gOM0K5IBldDtxACtiGCYI4e/lhmdIk/geE/G13EU4Bk179xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 18:52:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:52:22 +0000
Date: Thu, 10 Jul 2025 14:52:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()
Message-ID: <aHAL4rXbzTcrLld9@intel.com>
References: <20250707021510.3525028-2-shuicheng.lin@intel.com>
 <ffb0c4b4538cf03d2e20e5e1186ea0d9d012ac5f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffb0c4b4538cf03d2e20e5e1186ea0d9d012ac5f.camel@intel.com>
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN2PR11MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a8cfcf-96e5-48ce-ca4e-08ddbfe2e73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Jq0Ra9cQTytmd+pnm3KwbJzTnJnRYRrHU+dT9CoEOWZXMcOQ82lxIx2fun?=
 =?iso-8859-1?Q?cWjB8TsR+IbAMC7bAu14tz4Cl6v5jHoPJ9Y8lI9EGoqmuFn/0w+Cv2zVWF?=
 =?iso-8859-1?Q?zKpdDYTlfgaCFE/7hKj9JeTqO7VK1RFpTNGVXpq5OA2UF+5Yk4X/x75bNg?=
 =?iso-8859-1?Q?DtWSjFZ2io/UKd8VWUdov4HSzZCdsbrN9hkY5Q8BtY8uDKdU9X3wA6L2W3?=
 =?iso-8859-1?Q?U/sO3BWbS72O+Cx82K30vx59rR93R6JO9kHFlYTus3M7U+jl0J6n6OcL9n?=
 =?iso-8859-1?Q?f2MUjEss1Tca4isgxCGg2gkoMqn2yfY06CeRICBujMMD2iuZoiNZW9heW8?=
 =?iso-8859-1?Q?3+jJd5T7cHjnAcDNPAIxF5BZkm6h2WVQJa//Rvpv3Wqp1vaRUxB2eUr7gD?=
 =?iso-8859-1?Q?jMZ7rC+Oj4TXvSnW0qc0Uc23bnsr8dMZdnFwZXRzax+dsvXbNKH6vd2xzA?=
 =?iso-8859-1?Q?kdZmuUSkjGBR+z08lPg5BKRzZj0BhyIQUY1QqDcv9adlgkv5McA/5EDzd7?=
 =?iso-8859-1?Q?55HYgfaxit8AtGk8mvrG95oGL0QOBWGLs85O4a1HlLendAdlSWKKdmNt+o?=
 =?iso-8859-1?Q?aEbNiTTPUy4fCYDE4JSVK/GMXWuUjqMxHx4ocuuJNnoJHe8e2eLwaG7Z8T?=
 =?iso-8859-1?Q?nHV+SQWVkZnQMRvMsMaXDon4xbpU/TLA28vkiz/p9HLZ3zeSArNb4C8DfI?=
 =?iso-8859-1?Q?CZhegatEyoERj7OlOAyUz3Gf0a+ffwwp0kA++3Q7tmxS+Ug2gI1ls63Uif?=
 =?iso-8859-1?Q?15U/QDMsVIy4KOUA92OsvTlUOV8JxaBLMWPaEJUmjBEg2YMInDaGSBN7SK?=
 =?iso-8859-1?Q?Vpa6BXErYispJ574kgIBFK1dx6Lzystj/V68ME1sHETLT1ayYg7FQ/khzs?=
 =?iso-8859-1?Q?s7SkPXzcQmMcdKlMuM+m79BIsS1mlG++Fzg7TYxwPsStC8WlYEEcNghds7?=
 =?iso-8859-1?Q?ygihTf2ZAjYRatt0bC2raUHUiNTObMko6v4jADHsKvDA2uyKjOEoQ3IctX?=
 =?iso-8859-1?Q?PX1W2o2JGrkechMKcQYQbkvBQZkCs+ss8CwyevWJ+klmAHBd2O3lpOilID?=
 =?iso-8859-1?Q?LrQ2C6ml5DPTGIw1LHJE9mManlTu4804n4Uor21oVf6+6au630wNhVuav8?=
 =?iso-8859-1?Q?PAUrA0c6xS8kYB1EXDx5QDPsfy4BT/AfkEEi2FOqKsAneQYH3dOvYhWr0o?=
 =?iso-8859-1?Q?OavGrAy1BZ8WGr4lA0uTARhNr+Ev9DcttktRs/hHNRmp+MYmfssbMoUcNP?=
 =?iso-8859-1?Q?/qECTbuM/McYHwwK9GIUzOGnh17YiQZZHXA+5Ln2wMfv+/r7ziTImmEEmK?=
 =?iso-8859-1?Q?gP6ZeC5fbfdTY5zJWb76qF2ym2Gz1K0c9fnMgp/4hHe8ywNPHfmxnmdzyB?=
 =?iso-8859-1?Q?MienCXwmxiuWmGDPUu99eZO/o0pxU7Tk7+/ko+mxe1kyPzJ9VRVubOb8s1?=
 =?iso-8859-1?Q?tN5J6DJVQ3GD0aA55Hxp6pb79KQL3JdpdcJJUw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KWiiPkJVVHd9U2Im2Qe8mG4N7QZQhBg00P+cfFCAEMbOiI4rqKWarl2YwD?=
 =?iso-8859-1?Q?Q2/OzgRXdSZ1PWA38MktUMGUjz7j48FrQwwy7JIallHj8e0qxJ+WOmLsyr?=
 =?iso-8859-1?Q?1rYXFiVz+PasQMlvirLxHVRwevf4Bzg7iCY840Ohx4YIt5UEtTZ23M+0ZB?=
 =?iso-8859-1?Q?L/T0WP51AqT/qI+SUYvF0z2/8wg1MmCeTwLwczR3sWTgT82mH2qSVYqJ8g?=
 =?iso-8859-1?Q?NKgbZytNZSgJdnVMXYGsxgpCP+4/uuI/KWhfFwMQ1/JhzkOWTLgsRvEXoT?=
 =?iso-8859-1?Q?n8hxoj7ogk/u4Ie1dWP1Kk2JJj2MGamyWlFYepZg8KQbwn3/d7e7XMoRfr?=
 =?iso-8859-1?Q?tCQJGjE1dSXCzcw+h77FsYC7cGiTR3HTdNy+MqAU92JEwJ20XrLXmBdMTd?=
 =?iso-8859-1?Q?MotRAYCHR5aKPLMzKP6coObDMfQvMoDe1kZeVhvINHMeqOHoPdocPLm7mI?=
 =?iso-8859-1?Q?RZ+jspY/sNUb33X/HAODg5SaD7KQl3xw2F/4+OJnA6kGEEso79GUvSAkey?=
 =?iso-8859-1?Q?/mc1e93GU11oXRoEAc0VzIrTEtxFnP+V3osxqu95vG0ztz4RzvDPr85Q0k?=
 =?iso-8859-1?Q?DI0FZ3OrNMew71JGNowxgrgtKrpnlVnxHvVtxPwqASa78XVHf6ARU1bawq?=
 =?iso-8859-1?Q?gMOZ6ANl6xfpXQu7E7p2yqqd7InrtZVCWUR+ruzSR/bPThgdKmrYNgADmU?=
 =?iso-8859-1?Q?H19kqrUs3YYE85GHnYclpXk6RDIoTJ1WHXef6UE5keQNRaKdT67eeDaaMt?=
 =?iso-8859-1?Q?84+AJeOsz4I5+TRiyjvQWIDHkpjvui8nQOenf+A2NTjs/VPewNzvHxcjyo?=
 =?iso-8859-1?Q?E+kedPMPFESshV7P4zCinJ/Gw/xOOB9IXSFurJzo7ASXoxMNgnw3w6x4Hc?=
 =?iso-8859-1?Q?4gtBcquCVIuEQtXsubUZ63ctkKTAI4E+I5+GPTYSDtOIMDda0J5RwZI7WS?=
 =?iso-8859-1?Q?KSqNfq5Sg2/hYhUYvbhXKCAcKbQGVI8Yv81d8apRPwV4w5EhWM4gPCHbr9?=
 =?iso-8859-1?Q?TV7z6/WVbGxw1dP9DuYzrLMSspPdVrOdlfltFmhNNP4t5Kn1ZXu21ZQIFC?=
 =?iso-8859-1?Q?LlbBFFpUz5XrHd8Smq9VF3S55HP3gtd0itoKRxXW+zf3k3HSExNuHIkbBV?=
 =?iso-8859-1?Q?P5qBrfyu/Sz7s7Miz+uEPSQc7IrE+pXXdYBuA2RIk831qDnsm1UbN4NFH0?=
 =?iso-8859-1?Q?IphfuFr8F+J6fG71yaFE9MkhCFzcfSv8hG4Eeej3rzBzmqPq4tG4icLfak?=
 =?iso-8859-1?Q?39ZlTTjh72UN0+dPqa8exSzf0+1gJsvj9khzAruKqTvTfPppP8LNdS7scH?=
 =?iso-8859-1?Q?M/NIgSupzDmTM4uPKoT62zIHYcfp/Gw1Qw8pbYDIX+sopWbQespEaTiJjj?=
 =?iso-8859-1?Q?1iCDDbkuHaRAqVhva3v9HRkDp3+95rVGG2ZP4eHy6OlKpKINutP3XYH/j2?=
 =?iso-8859-1?Q?A+N65mP2Rlc2AxftLZNCVT2qOSTXJDwS579QZY8SxA5VNd29EQi5+V4OJM?=
 =?iso-8859-1?Q?D9kweMqrOKTFwtdXd6m1HmYRYTGmwl9HYpifbwq+0/dwLTjgoC9s2Ad9t7?=
 =?iso-8859-1?Q?yXU7CtkrjpL61VQyiKXxY1gGGffqx62NPm763xA4vnUKrPq0vu3RTqGefK?=
 =?iso-8859-1?Q?+pag2v25Wit7FCgokC2fSkoSQxTcMDsFdu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a8cfcf-96e5-48ce-ca4e-08ddbfe2e73e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:52:22.1440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCDdpA6u+3J9OqR3qSiJVFu5RcbzmttSm/sdABYf6XbrsbQn9e168iEBgKzPW4/pCp937EBGwxU+SLG0Qidk6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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

On Wed, Jul 09, 2025 at 10:59:56PM +0000, Summers, Stuart wrote:
> On Mon, 2025-07-07 at 02:15 +0000, Shuicheng Lin wrote:
> > The parameter threshold is with size in mb, not in bits.
> > Correct it to avoid any confusion.
> > 
> > Fixes: 30c399529f4c ("drm/xe: Document Xe PM component")
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index bcfda545e74f..c7622e1c614b 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -754,7 +754,7 @@ void xe_pm_assert_unbounded_bridge(struct
> > xe_device *xe)
> >  /**
> >   * xe_pm_set_vram_threshold - Set a vram threshold for
> > allowing/blocking D3Cold
> >   * @xe: xe device instance
> > - * @threshold: VRAM size in bites for the D3cold threshold
> > + * @threshold: VRAM size in mb for the D3cold threshold
> 
> This matches the other checks in the same function and documentation in
> xe_pm.h. Thanks!
> 
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>

pushed the v2 of this but keeping your reviewed-by tag since
it was minor but good changes.

Thanks,
Rodrigo

> 
> >   *
> >   * Returns 0 for success, negative error code otherwise.
> >   */
> 
