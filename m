Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785C2C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 12:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FE910EA4C;
	Fri, 24 May 2024 12:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/HOPenx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9748810EA4C
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 12:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716554012; x=1748090012;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kmxL10exU9pPFcPMQem/5Dr5i+PtZ0RUK594CD+2Uk4=;
 b=S/HOPenx0HnklBXqcAefVTVf7XjElpMehvGNC8D70yxXJH4rvn1rQYfc
 v5gpg80XiiCi23Cadlc6LRepaOsTJSf5DVFzSeXQeV1UoGk7JCbQEjmdV
 VVJT6kLmF3rJ8qUtNMSwbU22HoU0Dohsk4FLwWbeXKZnT50gT+o1cMgBf
 awd1h6PHklQeVfJeZH2ZJvnaaiNR4fjNWgJJR8FLUF8fyqstKL23pvJPJ
 2FsJznpfmFCA/4yJwsvsIEddeehMtB/043L6tAgT7Ph3/kKwudbGDqdHO
 D1hBIddnxx82MDIOAfVUXr2MbEzoERGQLjKvI1+dLn05xtQX1XzMy2/og A==;
X-CSE-ConnectionGUID: /3bTmM83QNu+T1uvjoTMqg==
X-CSE-MsgGUID: y+MUfVmlTX6loHylJg7/Sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="11678402"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="11678402"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 05:33:32 -0700
X-CSE-ConnectionGUID: mHTLZyVMRU2o3A8DauJ3KQ==
X-CSE-MsgGUID: Q6je2pnoS62oPVcyjKLyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34114176"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 05:33:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 05:33:31 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 05:33:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 05:33:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 05:33:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkfUEsHTtVvPeOafYRFgHuTOea6dQm3zj8DWjlAf5dmRLxdFDEMITjiaJbAzJ3QkbY0FaaiDEKYvn2im8dleS5i5QncxQCZCDz0NaPZh9t4ERUmrpq6XsymF2x/xl67VP2EUIPTBPsa99QJgfIgUCoJXFMTGm06rd/Oib2vDKmL8CngHf9O8QzBAB9IEu7E/sfVR/CAv5ITkIlfx4Dry5kLc8Yn0/P46fR/Ui9folO0szqGPY+Y5b1KoBCuzVM4aSwRdxuKeh2xlaU8dUGBSap/dBBNFP2oaDNKgl4hgc9R7pUg/B9Nfhg3Fw89N3pmCGSB9m5UfwnK0uT8yd/7Wqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3TMTHv3Se6rucjjmX/fQq9BhH1s4TZqdgc8RYc564w=;
 b=AvNjdDqWs7OOi9BKemd/OTrWFuy35iTfW37lchJNHR5m1Z4SM3H7vWD/DV5x74PV+0ftvvXQzRurRMZTniMMWojFsF/XeOYQRODgNZew1IOZtJHmTRiL0rNkkXx4QNUiAzSQg2ZfRAq4DcLYXI1NXmAa9RJugijwYUU0zCLqc9GgrSsH+WatXSgZ6yjVM0qDsA1zE8NGs6SErUL4hnfxUa5PzHFj6Vi4z+6S8M8gEFPasct2r5OST7ls8C/McSAYVnt1CICGjsN7HFvj1xEXmR7cl84mej0a16UhcGB5loO8PDgFUs4pktMj2QUcYtQYFtJGyZbqIT1Jq/lY4VYOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 12:33:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 12:33:28 +0000
Date: Fri, 24 May 2024 08:33:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe: Remove xe_lrc_create_seqno_fence()
Message-ID: <ZlCJFDXU6MkJE6_b@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524071940.83042-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a33a120-de3b-46eb-5b02-08dc7bedb698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EXlW6fb5OsgpVi3mhFprRG71K9Zl4wKWJKH7QdZ87NkCPBTbcfxfX4RAM1?=
 =?iso-8859-1?Q?WXbf5FXb1j0Glvd4x2FmTAoS+wZwCkFJnTg6NFpCT/RY1cvD7bEiYwcQk4?=
 =?iso-8859-1?Q?+Nxe8Wn4Bv7RoAFt0WY9IPkMdd1HrlwDHgkLPlPNoYYgDG3oBQF2MXUsP+?=
 =?iso-8859-1?Q?JlrXxWpNLV3fSEG9/ufJ0saSxyTHsS+/suIQAF/TV5h6TY/NcwKPlQxoKt?=
 =?iso-8859-1?Q?G1D742zQyH+MqxmtREHcaSO0AktJYoephuxIQAGDKIpep67TlTXblteYMA?=
 =?iso-8859-1?Q?IjT/QlJnlFSnscayZLiv3n+3pLlSSEUXMJhkK7M0JGhHBsQ4/H8wlsjkIi?=
 =?iso-8859-1?Q?c+hzV1KHilQW0RAA6kDOBigkfm3rBvyiQqfukv5DOL4xXYE+GiGkgYb3uS?=
 =?iso-8859-1?Q?EUzu8DclAhvsQUotPGyRpXXXwAzpjf9F0eI3Paaqq1Pg1DbCCQkswaNovJ?=
 =?iso-8859-1?Q?/OF0W8MY4e80DqETNVfKc7Se67c98/dRrtPjqeg32rwYSfLBf9zKj9Ekn2?=
 =?iso-8859-1?Q?Ta4JkAVQQ/ZMXjtsQz4PKDMu3BcE1TFwjxuA4QG1vMFv698Od4TcLHuxuW?=
 =?iso-8859-1?Q?WpcNpfFCiLjmWXNXoXmTvixATo7GsunsCjXO4kQ1ddHe0FpDbcjiFo0IpL?=
 =?iso-8859-1?Q?Vj0snjTAy6bsJoUaslnj70HVDvYCYRsGv/Iipj5YyQJstg131Ai5e2wSiz?=
 =?iso-8859-1?Q?P1iYxHJqq8JInWUCsoJtry45plygbrr2i9RQmDdouKscLURO/lDhCXTCQK?=
 =?iso-8859-1?Q?AwqhhwsFKl4OCXU9ny5XV9lC/B0lBrkmllli1Y+QknOGUUTHwmVKqYUumK?=
 =?iso-8859-1?Q?CWrx/ipvoAMruTQcU3eNgIBi9JathYA+lbo/XtLaRycztrVXRrs8qIQySH?=
 =?iso-8859-1?Q?MLqgx5P0Xfbc4sUGic2iqZCJMgmW9K0+gY6tHxDmch8ayaf2SinkRwABgS?=
 =?iso-8859-1?Q?z5E1J3Dt4pM77q/TbfkC0cKMZwUABLoXroiiuQNVB+No2EWZS0iGTzZ/jo?=
 =?iso-8859-1?Q?VCeJWuC1N2UBnP/TGmE2hityUB0fSeSfkwjsYVlK3GxBUfQtziATCjOG1B?=
 =?iso-8859-1?Q?pjncMQHn7PJOOSf6blKoXlGefFBzdLuyfPJnkW4ndn7xC8d987ZHUOi9a5?=
 =?iso-8859-1?Q?QKddDiitoI4Xl5oV4Pd1LP+O+41CvArf1sNUhRySN+1oJIWc0qoUyK4jPf?=
 =?iso-8859-1?Q?v9uUiSIsLzIwTU6zBWseBSTe41CgOMxGxcULt6kQ6Sp+AAIhtEtSvm5jYG?=
 =?iso-8859-1?Q?8aNAfvmZblZJVGtRrXNnkEvQNeLvCSukLMa2ieECdiby/7DCCJh6NtnRaZ?=
 =?iso-8859-1?Q?Z2BEK6reziPSnKkWFF+F36ukOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XLQEGUlzRektzrsPSHytutXWPo9s+/LmYskeARfvwE90SO++jViN4f8nJM?=
 =?iso-8859-1?Q?cOoMSLlOXu79N+z1OnhwPHLxuX1ffGpjvaafqGRWGCeXA18VaTNCJWwd/I?=
 =?iso-8859-1?Q?wxrnhCpFKTuc/9rX7kGhaoFh27zL67Q0RAyvmk9k4fdpxcNisXW7FJEw6/?=
 =?iso-8859-1?Q?JNWwUh3njya/cvt5N0TPum0iFYTQOKSf62eRp2aawjGULC++7Pw2ctzsyW?=
 =?iso-8859-1?Q?xCL4OVOAJYAHcChAqhrtB6SlT/NmiYe2Zo9WVv2Dh1neSYj/9shxxTTciE?=
 =?iso-8859-1?Q?teis/41jnuYPnEZlENbz30SZl3mDSgAX+gH2iyAH6fhF6DR50TNhuyOzQE?=
 =?iso-8859-1?Q?eqXvkfz/pmOYGk1iaruEEYvQW0ioAE6ChTirsRYDCxefXWgyKjb4hcRMmd?=
 =?iso-8859-1?Q?3cz4s2uBk2n12oZyY2EIVbHBNlS9Ce/wqjbh6Gv++yo2S71IyVb2V+dhLt?=
 =?iso-8859-1?Q?OK2MYCvxAnFvodkj0VX0SG8ls1liRuCTLopIfn+LG8Yx97VS8X/tu09s37?=
 =?iso-8859-1?Q?54PFvzEev8a1gLH6EIsHfCBhP/PGMOngoudvqOUepTGeRGJgDWDjieNkj7?=
 =?iso-8859-1?Q?Tj/d9T29LP7MRZ2Umv1VLf5wOUOWECcMXE0ufSdy/Nfm8VUxVlilTlO/HV?=
 =?iso-8859-1?Q?asL9nmsJPqr/iPlQFKyj00ITWImjDqvjbxduDefo/gDtWnyBsNlR2LhmtM?=
 =?iso-8859-1?Q?04PdZpu25q72VgcV/zPYpFHykRzCjiAZEMsZD4TNxYoZhz1mJMNQlWnrC5?=
 =?iso-8859-1?Q?Wzas89da2YOK7zASsgMq5KA2PTEubZQfHe1o4IEBBEuUB06YIPQgEaRy5j?=
 =?iso-8859-1?Q?Oqsge1Z8OdhJEDSWb9hRhl+4MBVQNB/qMZNi1lSbKyjbTZp3swCvqqFwvA?=
 =?iso-8859-1?Q?6e1DmvzZgdZkQa2Bhq+Y4qksKERs23NPjdyik3txAtPIpoQ3PgU7sl2q+h?=
 =?iso-8859-1?Q?4BETGQSyCG80qMe3x4ozho41ytSsIg+4Ui41Q4UYvpmLQeUfkiKD+mFQ+o?=
 =?iso-8859-1?Q?wqw00yHNb65MJegNnWM5vdADBLq8bx5H9CcP/c32SXgDUkh0gozi9d1GEz?=
 =?iso-8859-1?Q?dS8qkEV6jf6jlf5tuSUB/qiaouVhPIYmXh2wSamI8kRyTZY7LLNyK7zDTi?=
 =?iso-8859-1?Q?yo4NnvG3WhKD5CI+hCwsDze8sGaKjRQBLMs2FpLHMpPrRhq6JopME+PeP2?=
 =?iso-8859-1?Q?ck9ewAbEtUVybxnlZ2wz3p22U8zFqS92X8L5UXECr5j7THXZaapz3wjgHZ?=
 =?iso-8859-1?Q?O6s8tJCaQPahUcDFt0XAabWb4kmY0fPT/pzvdwCcW6VfT2ThJpqRS3wlAm?=
 =?iso-8859-1?Q?6uXaKGepWXPpSwxFPGPotq5d6uFRPsPPnWrCZRq3d7xQXCBEiwaX+6ilfQ?=
 =?iso-8859-1?Q?Z5sDiB2iYoa12tBK6hqS0iRYeL4SfJ0OP52srG0reqq6/ptaso/LjV4/l6?=
 =?iso-8859-1?Q?8K0MaN9TBDcQirGnTBZAmYlnO4WUVwMzmcEbBgKRdhRE5JV7p2n72vzEsT?=
 =?iso-8859-1?Q?A0HQUOzWV8GwhPa/1gxX/4Y5PRgFiwiqCsffatMWqs8M1GKVfKExAajzXk?=
 =?iso-8859-1?Q?cvQ2do5npHQg2V1AM+EQmz9Oa++7eZJNTcR8OUtp9K4tPWHLEskyhFLwbf?=
 =?iso-8859-1?Q?pqwbNMCdhBLsTYBkOmG/10KiOC5lMOZqZoEjb84+L4rdNz3UNQFB0tjw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a33a120-de3b-46eb-5b02-08dc7bedb698
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 12:33:28.4058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMRuV9T9CYUZ2n8Ca5GJvnbRkzHLT17M3bxwojCiNeIKdlY6PIzUhELuqPGJtKdAtG5toJrcAcO/QeSghHk7fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
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

On Fri, May 24, 2024 at 09:19:39AM +0200, Thomas Hellström wrote:
> It's not used anymore.

Trusting more the compiler since I didn't apply it individually.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 11 -----------
>  drivers/gpu/drm/xe/xe_lrc.h |  1 -
>  2 files changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index c28796cfaa03..e91967070478 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1072,17 +1072,6 @@ void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
>  	xe_hw_fence_init(fence, &lrc->fence_ctx, __xe_lrc_seqno_map(lrc));
>  }
>  
> -struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc)
> -{
> -	struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> -
> -	if (IS_ERR(fence))
> -		return fence;
> -
> -	xe_lrc_init_seqno_fence(lrc, fence);
> -	return fence;
> -}
> -
>  s32 xe_lrc_seqno(struct xe_lrc *lrc)
>  {
>  	struct iosys_map map = __xe_lrc_seqno_map(lrc);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 7a8752fd8484..c2df6bfd1889 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -47,7 +47,6 @@ u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc);
>  struct dma_fence *xe_lrc_alloc_seqno_fence(void);
>  void xe_lrc_free_seqno_fence(struct dma_fence *fence);
>  void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence);
> -struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc);
>  s32 xe_lrc_seqno(struct xe_lrc *lrc);
>  
>  u32 xe_lrc_start_seqno_ggtt_addr(struct xe_lrc *lrc);
> -- 
> 2.44.0
> 
