Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F451C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 18:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFE110E0DF;
	Wed, 29 Jan 2025 18:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrEaEgUE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622410E0DF
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738174985; x=1769710985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Waz17FCjssZ4mZ1qUUAqE7+gOZSGXqdDRNYhfFJ/K7A=;
 b=RrEaEgUEapYk2upx9QuDcx3KgfW5+jc0jEXRrESM/J/lOSYZYEhWWel+
 O1dq+jVHCDYFn77Dh8zlSQmLPG9a0C/OxrysPkwN+gSlsoANEF8NILcAN
 xt/5WSj2he32tJr4u7j8P2Tb/wvJgMbx7MhfvzPc02GYiar8hjiKUTS6X
 9kYEpjDhNoCIBpgObhJhEDF+u8BrvgSsbC3obNMElVEfd2zIXFxnBzhf0
 eQkqlVDRL714UQU5N6IwVUlKqCoY/3n3vYQ0OXkIR9Djbgoqcp08ni0Oi
 aHKD5iIndSB/9NP5BjgOZkQcJqizznm5aYBqzsR1bodhRXMCnV+Rc2bLL g==;
X-CSE-ConnectionGUID: 9ECkbrCuSJ6zfpLHhueDwg==
X-CSE-MsgGUID: hHoTU8K7QMuCOZJEgdZDvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38734889"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38734889"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 10:23:05 -0800
X-CSE-ConnectionGUID: FpdkigWGTuakVylytwjEvQ==
X-CSE-MsgGUID: 0uB1JE7pRv6e+gO1cigv0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108961633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 10:23:05 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 10:23:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 10:23:04 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 10:23:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q35CHkE3w0v9CuubAfyC1e5yiCVisOpWc6N51G/lxLO3PMbHA0+Mdr3w0w0aBza3YsxC0XQn1R/iJlsfFGfoKkQVaeq7pvWTQFIZWkN6nSzzqMJcDcXj84lqWKgm7f0mJTtO7U1bhQGfkbH8pSeifJeJuHrig1rKoUP0DpkPRs17t3OVzX6uH14Dhn/zD4RKGYLgFspk5LEQ+fBVNZV9sD8DiuQm5d+YxAP+xACElw+JDghk042wT2RfxUnSmZRd/4150fM+gmVO1Wutclej4MDVOCHYoORIbvnZ8eeQtiTz8lVbfrJEBnJm27rAU88ZSU/fCOnW/bGHk6PonS8CTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F99aIUYTETENBva7wGP1KopeB08IUoMedCWRw4CaV4g=;
 b=So/+ZFQmFvpGw9fPNByHesqK/JYNzq+9YmsdOMDG3Y3p6GKbYjCgnzdeNdzn3WmSsUALp5fzmqiTAmxnllHsIhMcCYk18sYQGG60A5xw1gs2btzBTtY2rREoNSjl9CZU2MGPXJ3V0FLvAXrlxz7ew5f4QY8mG+sBE6TaHZCL+BRTep+s86AdsQsIjuK3YKKr8IdMjQhY5hiSwhx6Ii2lnK+5yZ8dOHXRInGWNBQnQERqvNmLnQOfJ6dUbHiyYZ+39V+NSxhljoMxegmNppGNvuUJUPxEIbSr48svFRLdRIgDJQD38YMNWAb4ZQCfWG9toKJzzFVcBlbHmkgF+dkh+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 18:23:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 18:13:01 +0000
Date: Wed, 29 Jan 2025 12:12:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/gen12: Add Wa_1604555607
Message-ID: <o7lfhuxhj3yllz2aytlh4ljfyz4233by6dihardi4hjjjg6vpw@rdim3m54gzr7>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129155627.93827-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:303:b4::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: ebef4ab1-c2b0-4dfd-42d7-08dd4090913e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K+ffp5xzcoYY9x7pwvo9ckuCe9wxuemdJXca3rIMTpMjWsOOvkXMKedLq5EN?=
 =?us-ascii?Q?4Nci2qmJL4ksh0/owRmYx7bC8QodtQd3L3FI95EAanmtjsdHbUJKu8F0rkVp?=
 =?us-ascii?Q?dEeCehxahoalYa6dhd87pij6V1BrB5Kf0MrkYb/l7lKL8B+ZTOYxH+4gETMF?=
 =?us-ascii?Q?gmC9FkS/FVKVC566Nl09y6pJ1UgjcY5ucrnw1OgpJ+K8ymGRcZBAB0cHifIZ?=
 =?us-ascii?Q?T1viYoCMNXa6AS7mhlXkpC5+Y/FPh9hvY+C+aGVdXEm77RjLP7d8tfxYVJku?=
 =?us-ascii?Q?gAGYjUvUrXJv2EoyUlyzyG5Ci+U8iC2fgPAo2Zw6qeLJt7kJIO2AjpvtGspn?=
 =?us-ascii?Q?JGDjxGJjBT8z2zf9jTmZ8cOu6/g9Kz/pim2RWKZmCAqUKcXvyc1KMYhNanke?=
 =?us-ascii?Q?I2HsE9JrobDzFsRCbm9cPOACTiFkIpeUfHKZwhKvTDfHAWsd/smYBOT0Fm7g?=
 =?us-ascii?Q?PgxsTEE/9dtRFNrz7C3PKrlyv5DgPFR/paSPd9FK5k597nhcZxnqe2cbvp4Z?=
 =?us-ascii?Q?J7y5UiI93YuoiTuBiuP5O9hwHmmc7z71RxIohamXA9JWDdlDuSSLmVxKfued?=
 =?us-ascii?Q?yaOrGAkocgvT+BTVS2vskFH8yiE67zJDRZBxjy7+mGqFAnwhXDkOIBiuuu6w?=
 =?us-ascii?Q?VnBZgF/tF6TQMEZHiWEQuv6NB7eF4FB65F+TAX8u+Ona13ord0eA11mWoZRK?=
 =?us-ascii?Q?cXqyPXNA6zZQLVcqSHFC3hoZBZzDlGPxm/oCRqdIS+UG8nF2kiIJNi1Pserx?=
 =?us-ascii?Q?X+dG6sxqeB9QAOwdeA9KrgmH9a2nKUZDWD9a6SCqlEYGYu0rAYeGJ4huLTg8?=
 =?us-ascii?Q?h7uEYEiRSz0kAl7K9AZelEizq4sCe9hHBfIfmWXtqpm6vCBSgbHdUZUpTMfk?=
 =?us-ascii?Q?hApPkb6q7EsUEks2bsj27N3bmOAT9LQh/roYG6crJfhA0AVbSra0GVDfwwct?=
 =?us-ascii?Q?7KL5BOZG0Z7NSb5xa/D63NS2JLw1vmctZtl2hBxZw8B/qGSUZAt9jYS4RJw2?=
 =?us-ascii?Q?B0jnLDrK9u4NuN7pQmZGgGLZi5iqJThq89OOsxjO1g/by27uNHKKA6qY3J2R?=
 =?us-ascii?Q?ratRGwgizqX1E6RWd1a1pt8tK6ABq2XXR8gpEaQ7aKhDk+/ZvQ1qV5ka1SbS?=
 =?us-ascii?Q?zZ/3p32iDvitCgd0Nb7Pn8d3GdZa1sOLvq62pZwZMHYa2lo4fEZYu3uKs1X/?=
 =?us-ascii?Q?mDSBG9Q3auBVW3idkAdpCEr822jTkdK8Gy2u38XNgSv+rkZzRmwKg24VVTmc?=
 =?us-ascii?Q?Ma8imTTGmnOI4ah+sVTFsr3WS6LkfHqPXt++7Rv+TvIovcpDFA+oUyY+KkLr?=
 =?us-ascii?Q?8fQ76uR5WKRzxDA1A4LxiZyK0SXX6KWrv+fyaUJUpOsrPZVHKQpo8ossOJuT?=
 =?us-ascii?Q?vpfkBDDoQLKgvx5h/AsSmzd6xwIG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rt5WAPzI7zvqXSI6mrifyoq/dflDnu4vlGbvVQCtES+RIZf9CRN0ypN/3BiO?=
 =?us-ascii?Q?kn67cHyc2CeDW0BygJ1SWjgbnOLTkSTE7yY7a1u5N7H/2Ye/Bngbmu74G7AO?=
 =?us-ascii?Q?tC7iyZpMNiMDKlw/XRMWOhbc+xF0ll+oWzCjTRTBkuxwPn9XAf5fWPojN4yz?=
 =?us-ascii?Q?sbAfiCF21DInwFjv8Wl1i8jku8DnHk5zd09gPmYuZjqLxrLXt62oB0t5FVM/?=
 =?us-ascii?Q?GtFnhy3YA25bC+JglawbMgyUVkCXtoCXlbQjcMThKkAwXMnUAMUfV/30JPrY?=
 =?us-ascii?Q?NdVSGbRQwphjkBLenIMKOsxMpkV4U7a4w3bravj/D9gMlNNHv8UzPcjPF4oB?=
 =?us-ascii?Q?d5RRj0n+2h2bZK1/jSw9/blnsRNgFTGlcampeSYHopBvb7KfhP1/rpadNANi?=
 =?us-ascii?Q?vURGx67V3cZ0sNclighI5SmnA8sgoZ6l950IxNn/qbHBA2Pjf48D/H+e+Ovv?=
 =?us-ascii?Q?o4kpWH8EGTvxwS/0/r25PVJwAvvaYNCKqGq8igJ7U/GWhFilg7QruE7BHrna?=
 =?us-ascii?Q?VRFUY1wNM6fuu1flZcBLhSXv1Y22HYJCvVdJRJxI5l66RF6KZI4Ys1gUHQVJ?=
 =?us-ascii?Q?bLqsNR4Tk5Ew7sR7z6K3Z7e/dFAfeMNjYHGo58+Zqxl7x9uOFaktvSFgGtmh?=
 =?us-ascii?Q?OeghEUTplQsqAGhvGJ4NeTaHZGK7CXieUWj2ieuBFgzC5KXrstl3YgADI9mY?=
 =?us-ascii?Q?dqLT0FF0QDvhLcbRrfy/lLc6JBplhCVx9oAZgo7Ow+A3rrNuOPBCbk+OIfXU?=
 =?us-ascii?Q?e4afdb4Nt0bxYQ0pTQ2xQg6Ch9Dqeld+cSD/66SH7v1vGrVTpZgIHustI0oy?=
 =?us-ascii?Q?Tlh3P9O+l+BjG3SeJG4F2L+kpAazxkxFe4dCaZL3/uhtA7v3XsECMUdkJaTB?=
 =?us-ascii?Q?BVI0JbmMo9O8XFXjCh/mBlNd5hQqw+zZFoQa/ggY72kmxaQuvgti2LyKK3NI?=
 =?us-ascii?Q?RZ+xyW1KRf+JM7N7nSbyz0DIi1+HMfum5hrakUX+sT6Z7cvjzGJTS+eQy4nq?=
 =?us-ascii?Q?achOUbEGTtrlHG6ivaKV4W+Eui/g+XKvH6HuwiiZRRPbOhjkFbLJJXtOT3CI?=
 =?us-ascii?Q?3Ub7l7pSQezxlToPvG2AFLj2HNtl/39fgkhYIPvpf7avuR34J4jxGxAYvbYy?=
 =?us-ascii?Q?L+ASRwt+u/yPzwegHHIIlU8N64R4s96ZG4agrP2Y6GkLumjpUFazRExFfdR0?=
 =?us-ascii?Q?seMbxvYSS6VKxD0j5/Zm5M0IpIMfqVPUoHHiWzRP8GL6Z/jJWgU5mUkRghU0?=
 =?us-ascii?Q?h1+EOIiwErZ+CykRwupM+WEthu/f5GLsVnQ1oAfYPSXWPpDXkom8IB+xzNX8?=
 =?us-ascii?Q?s87FyBZzxrf46ze1deVvLGiSii2CDDhXm2wXXEWexWjDrszCv03ZDeZFRBFv?=
 =?us-ascii?Q?KgwoBzsPk9e7akAGl+XXWX2oViC/kfH0jM/QNXrNzVT9SOhHtMTeLl8hXgCv?=
 =?us-ascii?Q?fX1+QASnj2NyS8eKghvUs3fon7eIN/ji+Dyyqcpc+F12D8S3OrMFTbbz/bni?=
 =?us-ascii?Q?tIHbePgfPWtWw+vwpegYNwZ/tf838MhH0vZhk2JYHesXQPG2HaoGBBtpFB9z?=
 =?us-ascii?Q?swvZczHUKEHImfy4BlyzZkoTdjsT7Thl8nwBU61tVHdu9Du7RNDRIA5yAgbf?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebef4ab1-c2b0-4dfd-42d7-08dd4090913e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:13:01.7390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaqHPd/krfu3GTTl9mKtacqa+zfDpEWWhjz53G6pRpOXsSvLS43NrTYeXh3uDzEcrhd5HHtiASYoOTScmUuDFNKTWdB5F/gWGwKGtITrWtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
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

On Wed, Jan 29, 2025 at 03:56:24PM +0000, Tvrtko Ursulin wrote:
>According to the i915 code base, apart from setting the GS timer, all
>Gen12 platforms should also set the TDS timer. Make it so.

I have a faint memory of that actually being wrong and got removed
in cedbc0b75790 ("drm/xe: Fix duplicated setting for register 0x6604")
while fixing another bug.

The TDS remains for DG2:

         { XE_RTP_NAME("Tuning: TDS gang timer"),
           XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
           /* read verification is ignored as in i915 - need to check enabling */
           XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
                                                 FF_MODE2_TDS_TIMER_MASK,
                                                 FF_MODE2_TDS_TIMER_128))
         },

Lucas De Marchi

>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>References: 2b5298b0aa09 ("drm/i915/gen12: Add recommended hardware tuning value")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
>This needs checking by someone with access to the proper docs and proper
>workaround database.
>---
> drivers/gpu/drm/xe/xe_tuning.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index d449de0fb6ec..9e7ec36dbd47 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -97,12 +97,14 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
> };
>
> static const struct xe_rtp_entry_sr lrc_tunings[] = {
>-	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>+	{ XE_RTP_NAME("Tuning: ganged timers, also known as 16011163337 and 1604555607"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> 	  /* read verification is ignored due to 1608008084. */
> 	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>-						FF_MODE2_GS_TIMER_MASK,
>-						FF_MODE2_GS_TIMER_224))
>+						FF_MODE2_GS_TIMER_MASK |
>+						FF_MODE2_TDS_TIMER_MASK,
>+						FF_MODE2_GS_TIMER_224 |
>+						FF_MODE2_TDS_TIMER_128))

this got removed in commit cedbc0b75790 ("drm/xe: Fix duplicated setting
for register 0x6604")


> 	},
>
> 	/* DG2 */
>-- 
>2.48.0
>
