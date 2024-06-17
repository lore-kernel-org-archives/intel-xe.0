Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9E9C2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DD010E4BE;
	Mon, 17 Jun 2024 19:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe1QexaX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E5310E4BE
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718651915; x=1750187915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BEm1jFO5WsTpUdNbnrPEg8nxd2g1etih1FcAAoY4j9c=;
 b=Oe1QexaX85YHm/v3Wv1VBl2ZyGeZ3sgwXnNv8Pf+A76ULyWJrRPGlYgQ
 rfn//JIqPMCtraLEQHqElToBfduDhnRLC4UZuQB47bvtZ+PHqK7Mqynma
 p+UsBrIK//1+N9nAwdw1AzYw0sRbPPAahD2isdvfUKsG8hW4r6FDTGZKi
 50W4R0loL9TK30h4KALmsk0kw7Fx9uRcMBLhBIYSwsGQUCM/HgRK9iHHD
 3245HHh8xu8XqpUr4Kq2DXmmZqOl988/IlDIhdnT2FvISpJAQIF/WfpAH
 DtOHpmlPo/XJBYbRU3YGL8tPhpz2f3kMNVrnZI5Pkh+fGZ46WHzNIFsRf w==;
X-CSE-ConnectionGUID: Ls0GLyPxQTWsDRBynERTGg==
X-CSE-MsgGUID: TJXEMc+FRKKk9kg28kDgmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26616401"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26616401"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:18:35 -0700
X-CSE-ConnectionGUID: tBRf0ovPRp+6VqX+3xj2Jw==
X-CSE-MsgGUID: EPApfihWSCWXflglvs2eFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45653360"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 12:18:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:18:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 12:18:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 12:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP+fYM/f46zAaKDQwEQvRCWHTviKFtuVRy4E86z19OLwV50yKZRVrBijMpV6tbYCYAS1KaDxoRHXqUenLIwY7rJIwzQo0VNUiYIEoO6uS8iFj1sJ0jeDnQH20hEFFqzLE3Q5q/QZvCovVOmxgMN7XPArY7ZMqTTf2LwHYdVzNrVBI4u/BCtEjdmwt1A8KYQ8Yot8jlwrDjOMXkmiakzCi9kO2kJDY9DXFms236ruPRK6SuVCSqtJwiY8m2o0JliTRgPjnGFs44N4uJtasrpZ2ibBwrAAutQGvMhvSsXnjSY3NT5e/wNTmxAZ6eUYADlOxzs9sK1qcYlEJb/MvAgvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h74IGmz0DQKCeZZsf+yjsfy9kAaPJbGuKiiFWQ1UG0=;
 b=HclQbS4H1KZr5cvBt6sZv1unqwWXOOUNrM6j5OuZGzs7NLc2F2i1a74qns0mFuHZs4E4bBCwqGUyRX1n2UOtqeaNEOY0kSRYZ1n+VUTv8DNrWvwuUc7SzBJkGN1NDrM1g9iHFVi6qdUfnVW+7mn75BmnaqCAsGEtzEPuC21S+HSYJ99V73smsa1d66p/0KwVOXeIMDHjhu745VYp/zYWlxcMwEzm1SQy6b8/uEuZdY8Z1VQ0yvLM6ejo2QzVQckT16EmubLNNwVinVamI4MMVOMR/SjxVIOJ7/Wr5gfgECM7jeZdVXIUJkCoaMG9+BxRZ1yLlk55v0ks27MlnuCa+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 19:18:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 19:18:31 +0000
Date: Mon, 17 Jun 2024 12:18:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/rtp: Expand max rules/actions per entry
Message-ID: <20240617191829.GH2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
 <20240617182518.280975-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617182518.280975-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: d632ab90-e924-4d0c-4a02-08dc8f02468f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d8pECeimLh3RTFnArOepDU0cySE0raMiC+Z0wembLuk7jed8Am1P0Zz31Tw+?=
 =?us-ascii?Q?uQ7qAGt6paFViPK0zyoA4HEn0J9BLZ/exHgZ2l1/WDjez46pWeSYlF+9J6Ka?=
 =?us-ascii?Q?KSr6iM0dhU/o7q/3TsKWDB5A3B0igSuSwhmyCr+Lt1GyfaXsk12dGKh+8gf0?=
 =?us-ascii?Q?DhCScftJYxPgdZtpbTb8szmAu2xoMDpku5txlPDff97FQ00WFE5dXuIsPdc/?=
 =?us-ascii?Q?E1cbapCbBae4nI2Tf6Jm5XArl/fL+6R8r6RrvSwYdRS1Mk1onSUhmZT5/hI9?=
 =?us-ascii?Q?9TxCkNjvzy1/lE/pf5FfaRmno5xymiv5wJXJJL6hz0JCIwz55epDTzYkGm/v?=
 =?us-ascii?Q?suzVbfxM/qo6td2/v5zsr18dTNYrN03Dye7GxjrsAoVvn7VzcE/vrU0oXWkN?=
 =?us-ascii?Q?EpFYkJm2p64VStMDfDs2+9CPBYVhdgwJL7nDJXn+6XHcnyKHvG5VjVjiSyo+?=
 =?us-ascii?Q?7/En8wg1LUD2m5VScZG7yQRFkmhffCbwUexIRoKsItsiGHXV0F424x3vXbqz?=
 =?us-ascii?Q?qVaRqiwDa9YOltXi+4+uYvqkUPabdR2lhIrdBprkvwzlTYhDbKnZp3BQwWC5?=
 =?us-ascii?Q?blOb1X2SfBaCHYRs32QQ6kCsYII0UNY+Nmd9dbEmgrBVVn4U/Vq7wylRc+nc?=
 =?us-ascii?Q?Szk5R62As9xnz3SzPEkIz5/72Sc+FP6xHI/EU/M4k/mjtx80TyVFU6bMpRMH?=
 =?us-ascii?Q?ESNiuKHxc6zrlC/WdhzLqs1v+WDswPjlRBgicubHDjxiIQlazaL4zwKBhY9W?=
 =?us-ascii?Q?rm691UxwIP9Pb/rle3cCAEJrwzy0zPGXDKbaQcmboHe3R1wsR2KQqIulWfm9?=
 =?us-ascii?Q?owR9hIc3ky1b1DY/0KoE3+BybGrPplrskT+7SDCqkpLibllTrFMReyFObzQ1?=
 =?us-ascii?Q?WAgLQSX4HjRlebQI5HNa9uJT8LRQegRYM9BsR+7b/sz2ipI2LoEbqQRHbqCL?=
 =?us-ascii?Q?WblPZBSzy16F5HlxPBv6L3Q4ot7mklNI3Y2L9Tqgn2KYRW8KNkgE0IEqaYwy?=
 =?us-ascii?Q?zL6XXHRxyJLjylWOJGBtrtuFh9jW6suwqeWclYbGhzYIiNnW46119jxhGVmH?=
 =?us-ascii?Q?UAEjyDrD38wkxcL/VpUrgLf2tdKTfJWWU/UToMNST5LlpKGNObv4GsXM0wNm?=
 =?us-ascii?Q?rtucy1P8CTFos1ZpPsW1MoRUJJvsAZqOluONdCglqQdlVxTaParP0PeMQQgd?=
 =?us-ascii?Q?hNDSr3YZS7cERS8PgHShWnHk8EPAqe20crpviE4gATZhCoH/lXmwlgHEjN3h?=
 =?us-ascii?Q?rm39e2f2RrfAnDIbpyf45O3v3hubmix3xYnSsZ045cHTAaZIGls1UpuoGMeQ?=
 =?us-ascii?Q?vt41dZTDNPupZeLaxVjE76Gz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KKVyhIKvu5jzfA66M1FDEpc3zd3x2fhtGKjacbMSntTSVt0XNpdO7FIj1K79?=
 =?us-ascii?Q?FfnB8RDJPNuK8ovOmuqT1V7GWpkbqlRFphARy6keazyMWdEglvPRjv6nxsQU?=
 =?us-ascii?Q?G+jFh61Z8MWwpuSN3DM/7IHfNcrfMa8VzZlIYwnQ41JF3bNXhBkbdbrub2z9?=
 =?us-ascii?Q?ata2du5twdMFj0SkEB6GEbBHWIwqNxQnm5plv4cdLaoWkwaw6suEG411JoTV?=
 =?us-ascii?Q?B9V7uYt2hgmE3Noc5BpFud+RHKGSesxbYCVqa6JQvYV2zjo4EwpNn6iFjX0V?=
 =?us-ascii?Q?4qrAJMKQCS3gv8oJep3wlo2RV1EV8L54ekHITuxqaTObg5VEoGsKY6my4two?=
 =?us-ascii?Q?/g5/sEXP62BB/Rhl1R3Lc2xYf5lJGydd/7s2LMwmhqjwYO/44+Y+rPCReMIM?=
 =?us-ascii?Q?E5efZkRjSUVLDGRMjoOaZkBvTLml2Mvbp81DjwDUix7jeQhGk5qL0FOoYx9Y?=
 =?us-ascii?Q?FD86xFIKr6bNui/wlOnITitOmdMuwg1SSrovWcKOUY0YBJ2l4/6v0Xso660g?=
 =?us-ascii?Q?TlSaya5Pnrg0U8sPuhaVC7WKHFZNhEy+iCK2U4pXAzbG6Ggpm/t8GdbjF/6N?=
 =?us-ascii?Q?olPGUpbiKSjASSZVMUDYQRYddSxi1nm3vlZQZbm0ktLoBCXA2SePNlfy8xDZ?=
 =?us-ascii?Q?xJnYSJoUWwyZ8p8oyoZtx1e7hnU3scC86iuGwT+WUBgKijCDgVztMNFc/u8L?=
 =?us-ascii?Q?muKT6xNQJa5qhLE+ODsK8oxjAgvSlhpmwlvqB6vScLFeJsV/5uW/azfzf8w9?=
 =?us-ascii?Q?/zs54N41Sa6SPB8NyiFBJ0NmCRIPoXEBCYUr9blPnk1Gs0rsmLxuwrYKgwCL?=
 =?us-ascii?Q?ekPneCo8j+8TBKZO4TpgkhYE6ghCR7pa/3R+lFgbrStabFMiHIa+6L2rxSEy?=
 =?us-ascii?Q?QAbHC+n0fO1RgwtHVYoTXoWGn9BIamE/tMBXYlD9pm1w/Qs8yvDCijbGduNZ?=
 =?us-ascii?Q?CpndioLu4rEwZDl7mqssaY2Ph8pnErE+68ZZjXz01MYqDsn4+QjNjiHkA693?=
 =?us-ascii?Q?bCPOmRL5Ox+FXwbVKxCYzPzrXcIDXQD2HzRiDlgqmM98RO3fsPQDUYJ9TIYB?=
 =?us-ascii?Q?4bll7/Q/nyqc4Fd/wLOGk++wgp4R2Qs74q6Wj7O1u8qmoqOJ13XAId9Kg6iC?=
 =?us-ascii?Q?9BNlGh2McbBLGm6Umgh01ux6ekRjOf31O8rFe/C2+rdiFLmlQLXmqUrzOHsj?=
 =?us-ascii?Q?WbTQUiZBIg5QS8G3juKP0VUmodhYHKm61x4UzLUxxHyklBR8lviFxOA4UWSv?=
 =?us-ascii?Q?kPi182RiA/U91h8eF7wDvyiTACfwk8jfVL2QFEacnZzbzit4bCuF0pPisdvK?=
 =?us-ascii?Q?2zCBsS6o7jkbYJ7iV03IcYe31vuq2Sv8UKr1RGfNH4iPl1r/7IP707JcjlEl?=
 =?us-ascii?Q?mL1eitCTvfhmgh5mG1kFRXP4P2TmcDSglGiXkOEJ0dMzJNYq4uO8KCGGw4TQ?=
 =?us-ascii?Q?sQU838i71PSlbFuNjBeLpxz+Q1VuP9u5ij+oGpTusdhyafELFde8t370duGq?=
 =?us-ascii?Q?NbKQuIGduKFGXfEaJAcQKHrVgH9cRJd3UjSlwy5gImKDz51OFJOciQMe73AT?=
 =?us-ascii?Q?PD87MgfOhUFa8Mmw42oYK3dXJU3A9jNzsmqnYx9Ne8cB7FriOMNpAoQogNZ8?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d632ab90-e924-4d0c-4a02-08dc8f02468f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:18:31.7484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T785uhwLMwfnt9XAv0QK3SBXVhgc2m0wjtw88Uan3qejYa9KjXrppNe53bkyzfbqFf0cZsJdPehqv48CUYqABUVJwgqoEc1Lp0mNUCSnQmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
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

On Mon, Jun 17, 2024 at 11:25:16AM -0700, Lucas De Marchi wrote:
> Having at most 4 rules per entry is already reaching the maximum.
> Expand it to 6 to allow for more room. With the addition of OR
> condition for rules, this will very soon not be sufficient.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.h         | 4 ++--
>  drivers/gpu/drm/xe/xe_rtp_helpers.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 5a6b112a8be6..bd5b5ba0fb31 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -346,7 +346,7 @@ struct xe_reg_sr;
>   * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
>   * @...: Rules
>   *
> - * At least one rule is needed and up to 4 are supported. Multiple rules are
> + * At least one rule is needed and up to 6 are supported. Multiple rules are
>   * AND'ed together, i.e. all the rules must evaluate to true for the entry to
>   * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
>   *
> @@ -371,7 +371,7 @@ struct xe_reg_sr;
>   * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
>   * @...: Actions to be taken
>   *
> - * At least one action is needed and up to 4 are supported. See XE_RTP_ACTION_*
> + * At least one action is needed and up to 6 are supported. See XE_RTP_ACTION_*
>   * for the possible actions. Example:
>   *
>   * .. code-block:: c
> diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> index 7735f217ba71..c59e40fd7fff 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
> @@ -58,6 +58,8 @@
>  #define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
>  #define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
>  #define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)
> +#define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)
>  
>  /*
>   * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
