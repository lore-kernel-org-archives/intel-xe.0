Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CB6D0EE17
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 16:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6109710E033;
	Fri, 11 Oct 2024 16:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlOoELt8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C9710E033
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728663648; x=1760199648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RbmJLIsnUFxsHQ+J4fJ6/yOtmy64ZwcJ9PekMc1Ocok=;
 b=ZlOoELt81tr7QuIRzYggnnW8V6iFLDL8/SkuOFg+EhsAAoZAW0A6mia0
 y7DO8KLk3WfhyllCZxrDGipGsp8XLxUrLdyujL/gOw8a6sE+g8fxsJ0M9
 3mXEHM75OpULu/sTh0cPWmkgNgd8l3fprkwr0olEzk7tIaL/vuTB5PAYT
 6reVqubw7WVyVHNt+RGzaotjrGzwzacEcZuA/tvVnxHJywvnK7+HFe3JJ
 /mi2Bwkb0DADdvOiADmp7O6S7I7HvkXE1RZHD9w7JeAd3ccjeZmdPVxC6
 Kq1FkgwrCqJnWetnnhXxNsmpg7USLRr5sDu0yOUBY9elCT3LWhjo1BeTA w==;
X-CSE-ConnectionGUID: Qfgw4HmMQoeRATNhHrgtgA==
X-CSE-MsgGUID: zzsIud2ZRtirGPwru8aQuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28207760"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28207760"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 09:20:46 -0700
X-CSE-ConnectionGUID: vMbv6pW6SsOpxVT7T1gIKg==
X-CSE-MsgGUID: SntAYzZvQmK8ks/+kc3qXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="114414136"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 09:20:46 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 09:20:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 09:20:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 09:20:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMsSjeBt8LyfWBNDBIuy0BTPuB9rwHo37hwgKqUlswDYlHNIWqW2YUL4BpLw4O3yABeC/pUxVS2jk34ITZRTD8Q9RiCS8wTLKv9TOXdXyTaR5PpilSmR3bJymh7ApwGwBUx0jMVgUF3Zxsog6qHKJzZJi2c3r2sQTKfN3VwndjRi1nRYubtKVxqogxuT2UqEbJVL+0GqKbv3f3eMeoEsyOTyfWTIFVVZxVhOJQmDA+Fs60NfBGTlNnmGvoGAxP16ERdvxff46Te/6rjdobkQuve2WvGmJ8NvHtr3/DCGe+nJuKKAp+SgRrnw/iuUsTtq4oX1u/mRbKOBEEyRt4i0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLNNWn1+NFdgM8Yg4M8jTF0wcwUfOUb99DoPdZPeY8A=;
 b=MVBXmMAY7APopRfwlDi3ELbZbdtzxAID5N90XqOKO1T8drDEDtcwOrSPG0qmuOEpdVuH3XQlnw5Wwu87VSoZ1XBXzBH8JFLWG+qcru2dfmyZQjp5oG3CdqtnayEpV6a6lDjhXhirhYopOgv1YGuCa82z0m3z4Tigu5WedFm2N0qocuNXn2V88i7LQNKqH9PrYERW7F2c4fstELwOW0XqwXYYr1sdTP6GZAXiQvsbtUBVf2PWCi2SoFSkrWGdX7gsf5i3Y3lVzrhX538lMdbgXvwpiA/JknXbXr06JYkrwP/DT1EG/VdNerfKziSQfGUmTE5YMtOl+JiXOeR1LrOyMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 16:20:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 16:20:32 +0000
Date: Fri, 11 Oct 2024 11:20:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v4 5/6] drm/xe/display: Dont poke into GGTT internals to
 fill a DPT
Message-ID: <o6efwnosvbj5w2hxdt7skquczvj4latoyprd5gmc52tl4j6rbh@cxkkwxg4ny7c>
References: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
 <20241009125114.412624-6-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241009125114.412624-6-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:303:8d::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf46a57-8656-4519-a4cb-08dcea10a0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AGzjLS2oaXAM7u0j8lBci05ZChn74ea9eFZgR0tQ5E5sk0DQ0wh7vGROicBF?=
 =?us-ascii?Q?os7AQ1Kr0H3vWpURsUR8BOAqDlLN2zm4FU4jtSIxG6bwoChd+xrRDlJBEYfZ?=
 =?us-ascii?Q?WkAwJpxbD7irhRYpdpPDLkPetR8c38kP2f2VoYQJSk/4Y2MvY4H3mTKuuy7x?=
 =?us-ascii?Q?z9CeJ9LV4HUOZWXnFA+A/bBmrDbI+pG/mh6/+RpMyE90BQ0kGAqsAz31c7ln?=
 =?us-ascii?Q?Z3SH07lMFnIWNpBLAxDFI429vwLykjH+Trk3oPPqYzlFBe9Fva47ygglKAfx?=
 =?us-ascii?Q?aY7ofxt8xScDRQ987UTM9ARaX+QVUJGmlZGeG9FakazWwZpQO9JP7BecAIpp?=
 =?us-ascii?Q?On3K1SwscJzfPjdckytBpjpii880Jlu7efFAu/IYtf0aGAvxor3HzoyhK0w2?=
 =?us-ascii?Q?tC19W94Bh2IUsUsgAQpsGpM3G6C/D36qCvrLqafpXn+tMj9UHP5t15+0lVcB?=
 =?us-ascii?Q?Sc1e+4VFfFV6ahG9bSYmKBqIIx0aJ3drxL3oprNjHe4Vqo+VZT/iq3mhP78j?=
 =?us-ascii?Q?ee/HA76pl1Y43EYyqV+oyQGgNGZ08v4ygpiSNTEasWSiOH4vbCfvTIC6yxRO?=
 =?us-ascii?Q?RIYFqUEwnzVb+7QlG/IhQ9Gm4X++zv0VNQvnLcJAkt1tGQAJp5ya3YGACehD?=
 =?us-ascii?Q?LtR6CLH9on6QlgtuFbE2XooA56f15/IwSJ1Jo+SS10F2kqqwA++IthE8XIgf?=
 =?us-ascii?Q?ynOn5uVb54kOYELuKhL1MSN1s7kibuOsCNxGAl/CR6OokrkOl8bCigtaXO8j?=
 =?us-ascii?Q?LxDHArAzcu5AkfLMFRtxgyzLn7zUEIsN9Vvem1nzANEFcU1aJyq+f4fXf9Yo?=
 =?us-ascii?Q?EV4bFqcQB0mfnVjj7KlNRza8CqABzb+y9eHUpkj3tU/ipyD8udZtDbzruShh?=
 =?us-ascii?Q?Kw7a7F2n3WfkGt2lAl8zFl08k4Mu2vcJnEDgo0dOSToK+su/qXBOkCcpUhHR?=
 =?us-ascii?Q?dVhrUE9PsiZ097Hizrq2PJuk2IdeSEBrliMnTn6kV+DuP/YldTYBDZiANMMf?=
 =?us-ascii?Q?28DSYBDhwOaK8jTFgkHL82zJ5LuQy6NIYaFhk8k36Vbf49zmXxvhR85lKFGN?=
 =?us-ascii?Q?WG9Futfq9+Mr0pf9bo5jwNyr67ZnyH4gMPbK4f7cB1+ilFs3R19a8R6OtXoy?=
 =?us-ascii?Q?Z1mF5JYE4oz8pAPDpBUqmMHI8zRlxkPgzyMwd/FqvqeNSpeWodDuwcWU07AO?=
 =?us-ascii?Q?bxMUs2N2Dh7rCKca60pKxNFlKjzodwdCmTmsvyu39H6TRYZtrIwR7ZeWYMCZ?=
 =?us-ascii?Q?9owtLH0H7f7dsF2cXQngChRTiK7MnvyJ9GgB6LWjJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7HOhC4GXnFz9+gEbo8njnfe0/p7ejtCE2Cfvln57WBeYEyPwtZfaT5Z6g6Z?=
 =?us-ascii?Q?SrlqFurR928NIwy5bOOLKK+P0gqRLB++q9IgLNtfP+aoUGmQDmlPbxH1XInL?=
 =?us-ascii?Q?3AB83SeXzzQvB/SL2b8L8D4wb/2dWUC4DotaCNckzl9q36P7YtXOW9BRfFfw?=
 =?us-ascii?Q?9U/O03HAEg49du5PglD4anCw1rpUyKyK+uEu/yVupE2Bx/s13oQDWRhDcE5l?=
 =?us-ascii?Q?nDS45iV6cUvncr7yUJKSYegLb9zj4UIuusyrI+mKLFBQnVT8s2IWJyFDITzt?=
 =?us-ascii?Q?rHC6v5ZYjUdzdp+wojCJFnw4LTQug2QiWdOmBSF0BBJ9KTeDYPozClzDtpbY?=
 =?us-ascii?Q?RUKUQbpxbLZoVg/EfLB/k1uDLfEOtvKI1Y36KSVNrgXP0wWbtdw8imX788NB?=
 =?us-ascii?Q?EX/chpKrLO4toevbotlNxVNEJBA1F1pRtAWmdL11DXvSVl7rNvLhhx4IRa23?=
 =?us-ascii?Q?/6pzRfHsM68+IFVNUNGBfhhDuxuAQrocqZnYFIMT2uvEisY5qjNhfKCNSAks?=
 =?us-ascii?Q?zXTINjDhHGFoex2OqkwU6JcBvEWUy73q2rImv15iTLXiaolyEIH+C3UrArOc?=
 =?us-ascii?Q?CBnoFEYNhfn2o2I/q70bPo0iuiEMNeSc+iyw+tPGL9e18gLlFQD6xtsOp84p?=
 =?us-ascii?Q?qhfs83ULAe5YHyzGN7W1LgjsZB9puCF3oR4tLCEYF4xjVQ4qPv87aXqVfxWp?=
 =?us-ascii?Q?gfCHHgpFD6oB3P9IgOVluilyOSU20OGC1jwFgdhflZKRFnu7Hrb9cqz5McMX?=
 =?us-ascii?Q?ltF6Z59Q4m2wSHptMz5aZCoK0ItQi8NWuMyXq7W1ndPF8oFGz4v1txysaY+o?=
 =?us-ascii?Q?6srDnslbbzeuKnG9wMUwB6J+hZ+vGx3LF/IvS8tQr2iCNGAY4a9kB+SNOOTa?=
 =?us-ascii?Q?ItuypsgTAtpiehMfQOPpYdi+VpvZ+6s+fFbNejcmQvr03LSrlvUZUlvOeOTD?=
 =?us-ascii?Q?tdSeQW6JZU7x+rAs0x6hHmMcbWAKPaLEnM2ptd+gHue3Bcl67HvK9+VESl2G?=
 =?us-ascii?Q?RTUqU/OD8b4C22+ZQL7x7vnNRGfp99eRIirsSb0At4n1bPYMJBquZ/TWLZky?=
 =?us-ascii?Q?V9o9VkkUkgHu/Jp365r9i6Ro0S4yNnqXSYqU+bQXSD9OB9r273ZqZNsGhaws?=
 =?us-ascii?Q?HZrsys25PQ5spfeurGE0kabRBdy1ozRdpMhN2IcvOw3hLq7vR2caVwCNC+nU?=
 =?us-ascii?Q?2agWnL+jSihaIUY3H7EuW4gzkV07RHBf1tSitWEiIsWfU1j0MDS0ccPrP7WR?=
 =?us-ascii?Q?SGLaFE9vDfkR08XLDFMczie9HrmaEQZv5CnkcWqh4yYZvNtW/6fiY7zWYS/a?=
 =?us-ascii?Q?3mElVDomhQiDX8jYU/1tm7K9H4D7oJf5TMEjYVep4kIiSbCYQEEnBH84NBcI?=
 =?us-ascii?Q?rGbGuQgz4YrSb2VXvlFDDwWX8kHm2Kud25w6AyZNfZoetz2B4VBR+sTjcYBy?=
 =?us-ascii?Q?Ud5DV5KxuCioqEE7M/zhCzqqpioZcSprDNVD2yYT5I4sr8g1p3Kn80BrJmfO?=
 =?us-ascii?Q?lgFkzDBTBEJsHF9fbiaXzqvIuB+4l0hHjquusQYtJCMqgLply67w8XW9N/da?=
 =?us-ascii?Q?4VGhlsD22zr0iDhYTOu7ay+9eeNPTQjYltjB/6iHBu+TPRgHmbDNh3xJPunp?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf46a57-8656-4519-a4cb-08dcea10a0ff
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 16:20:32.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ep7BnTdszHmplQjo7elwYHxonEnqKkQlCVEA0j/trp7Cm2hXDZSeJS1fwCGuXf8mfWpasxxL5wH5Ap7UjUV+UGex31KKhZeoBoBjwwVV5gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7968
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

On Wed, Oct 09, 2024 at 02:51:13PM +0200, Maarten Lankhorst wrote:
>Now that xe_fb_pin.c no longer pokes around in GGTT internals using
>directly, it should be safe to export the encode function.
>
>With this, no users remain outside of xe_ggtt.c that need to know
>anything about the struct, and we can make it private.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c        | 22 ++++++++---------
> drivers/gpu/drm/xe/display/xe_plane_initial.c |  6 +----
> drivers/gpu/drm/xe/xe_ggtt.c                  | 24 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_ggtt.h                  |  3 +++
> 4 files changed, 39 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index ec1dd356f26b4..73bfa085cfbb3 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -15,23 +15,22 @@
> #include "xe_pm.h"
>
> static void
>-write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
>-		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
>+write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>+		  xe_ggtt_pte_encode_bo_fn pte_encode_bo,
>+		  u32 bo_ofs, u32 width, u32 height, u32 src_stride, u32 dst_stride)
> {
> 	struct xe_device *xe = xe_bo_device(bo);
>-	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> 	u32 column, row;
>
> 	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
> 	 * by writing dpt/ggtt in a different order?
> 	 */
>-
> 	for (column = 0; column < width; column++) {
> 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
>
> 		for (row = 0; row < height; row++) {
>-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>-							      xe->pat.idx[XE_CACHE_NONE]);
>+			u64 pte = pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,

sorry, but I don't really see a benefit in doing this kind of "let's
make it private". It's just adding one layer of indirection. You make
the pt_ops private just to then have to add a function that returns a
function pointer.

As I said earlier, IMO it should be either a plain xe_ggtt_pte_encode_bo(),
that internally does the pointer indirection
or just keep using ggtt->pt_ops->xxxx(). Contrary to the direction
of this patch series, I don't see a problem calling the ops functions
as long as they have this purpose (which they do).

Cc'ing Thomas since some time ago he asked for a cleanup on xe_ggtt that
may be related, but I don't remember what exactly he had in mind.

Lucas De Marchi

>+						xe->pat.idx[XE_CACHE_NONE]);
>
> 			iosys_map_wr(map, *dpt_ofs, u64, pte);
> 			*dpt_ofs += 8;
>@@ -48,13 +47,11 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
>
> static void
> write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>+		   xe_ggtt_pte_encode_bo_fn pte_encode_bo,
> 		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
> 		   u32 dst_stride)
> {
> 	struct xe_device *xe = xe_bo_device(bo);
>-	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
>-		= ggtt->pt_ops->pte_encode_bo;
> 	u32 column, row;
>
> 	for (row = 0; row < height; row++) {
>@@ -87,6 +84,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
> 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
> 	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
> 	u32 dpt_size, size = bo->ttm.base.size;
>+	xe_ggtt_pte_encode_bo_fn pte_encode_bo = xe_ggtt_get_encode_pte_bo_fn(ggtt);
>
> 	if (view->type == I915_GTT_VIEW_NORMAL)
> 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
>@@ -123,8 +121,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
> 		u32 x;
>
> 		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
>-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
>-							      xe->pat.idx[XE_CACHE_NONE]);
>+			u64 pte = pte_encode_bo(bo, x * XE_PAGE_SIZE,
>+						xe->pat.idx[XE_CACHE_NONE]);
>
> 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> 		}
>@@ -134,6 +132,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>
> 		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
> 			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
>+					   pte_encode_bo,
> 					   remap_info->plane[i].offset,
> 					   remap_info->plane[i].width,
> 					   remap_info->plane[i].height,
>@@ -146,6 +145,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>
> 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
> 			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
>+					  pte_encode_bo,
> 					  rot_info->plane[i].offset,
> 					  rot_info->plane[i].width,
> 					  rot_info->plane[i].height,
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>index 8c113463a3d55..f812747a340c3 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -70,12 +70,8 @@ initial_plane_bo(struct xe_device *xe,
>
> 	base = round_down(plane_config->base, page_size);
> 	if (IS_DGFX(xe)) {
>-		u64 __iomem *gte = tile0->mem.ggtt->gsm;
>-		u64 pte;
>+		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
>
>-		gte += base / XE_PAGE_SIZE;
>-
>-		pte = ioread64(gte);
> 		if (!(pte & XE_GGTT_PTE_DM)) {
> 			drm_err(&xe->drm,
> 				"Initial plane programming missing DM bit\n");
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 93c903db6d1f5..213a6c0b10b7c 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -888,3 +888,27 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
>
> 	return total;
> }
>+
>+/**
>+ * xe_ggtt_read_pte - Read a PTE from the GGTT
>+ * @ggtt: &xe_ggtt
>+ * @offset: the offset for which the mapping should be read.
>+ *
>+ * Used by display for inheriting a bios set FB.
>+ */
>+u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>+{
>+	return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
>+}
>+
>+/**
>+ * xe_ggtt_get_encode_pte_bo_fn - Get PTE encoding functions for DPT
>+ * @ggtt: &xe_ggtt
>+ *
>+ * This function returns a function to encode a BO address as a PTE.
>+ * It's used for DPT to fill a GGTT mapped BO with a linear lookup table.
>+ */
>+xe_ggtt_pte_encode_bo_fn xe_ggtt_get_encode_pte_bo_fn(struct xe_ggtt *ggtt)
>+{
>+	return ggtt->pt_ops->pte_encode_bo;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>index 7417f236df5b3..6e7e70de9132d 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt.h
>@@ -46,4 +46,7 @@ static inline void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
> void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
> #endif
>
>+u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
>+xe_ggtt_pte_encode_bo_fn xe_ggtt_get_encode_pte_bo_fn(struct xe_ggtt *ggtt);
>+
> #endif
>-- 
>2.45.2
>
