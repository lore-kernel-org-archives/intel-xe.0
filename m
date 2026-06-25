Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D5BCDE000
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 19:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2BA10E270;
	Thu, 25 Jun 2026 19:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A35sJFqg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E2910E270
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782416540; x=1813952540;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m8B2H8DSrEeRBcWhAEBkL88vWC82pZ51ExjXfln0Mus=;
 b=A35sJFqgJ2cQN3y7I6DzVx+LRrej6mB+NcgmBrjsqTmD9TnI13sV90zg
 whmbFhz4ClogytawNgRrAYcc7Ylikx9Zp0yOtHEC98dT2S+VdlpSJoUn/
 C+ppt1Hsh1K1ZucffM0c5N488I7K9QnqwVd0FZOoq0Hx6GLG1gIA+fEbz
 Lkn2s27oFnBzxJSnZs8xGmLHjhoanxdsl/tMLZrxXQrut+B9gK5svrllM
 EOnb8kGOjcCnXUGkkyYj/DcVlLKj8y0B5haMduCEUqAMQggc5yZYpx4Cp
 kszlWq26sYMhAcj5NLkJeoq1ZIrpnH2KPlFaI8/kcOdE3a/1VXggfzxaz Q==;
X-CSE-ConnectionGUID: lIp8MQjeQLuTuR7Co/yf4Q==
X-CSE-MsgGUID: oaMJAHVjRPuE/ChvQOKG2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="85758241"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="85758241"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:42:20 -0700
X-CSE-ConnectionGUID: UOKv9vIdSlq+ylpYltKEiA==
X-CSE-MsgGUID: FSUsHYCnTG6uh7glyo6u+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="249372097"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:42:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:42:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 12:42:18 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 12:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJtnG9lSnDaPA3gY4Tk9rf5F4jZV766DlQNjwcVnX6besETxwfMjuwGxa+AzrST7CSp1aIL5BOtzdRuS1sDaEpX/iFtzpXQSN1X+WnYZkfMdwhLooydPC1aNWmEyBbA6lJs6eqJul4PpbrrMwlD53H+7vmLS85vCxzNWVDrliMAHq4/XLvq6h3IS5vw2yEclRMxTzi+/poXOfyGR9WZsuvnkKScOrheVKLCe5i/NPcQi9TPm2Ze+rDq266hjJrzCaWa/kw70I1pWolTk/EVRT9aT2kqgg81UAo5/FIOJxrCFzyQU6nXKI8NXcjAZU9p1xlEN2XbxrXwaL64zz7Vm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qO1ha3WZC4gsFwqr6jLsaNBaRjbOWouIxj/TDq0rELw=;
 b=cjPZsX3jFWqCM9Z8dmPeo4eaDt7m2mGJluJ5uCJaGjgnWHpTA/22Bg6rO6jAfcgW9tQQDVH44Pa4OA4lA9bi0KvnxSKoGiq7gEHpV0ckoi0ik3DIkFrcDBzBd47zsJ/qbVK+G2g/rQW5PkyGyWH9aPAFL/Gxl/m3WycpaDkqAndxXtHqXg8p2ypERMjX2Q7krvgvMCkgTP0JXOJGbHytnDs81zKtBdh/aXLqmCma9nXmFrK2H1xNR3b3axjpi2Hwr8o4L1d8TFQZBUs+DKWHAWy8qQAMjOXSQeK87xd2zr7dolpbqdWPRx5gBNidySi9XC1z4fpzJDr0sxQgptv1Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 19:42:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 19:42:16 +0000
Date: Thu, 25 Jun 2026 12:42:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Schwartz
 <matthew.schwartz@linux.dev>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Arvind Yadav <arvind.yadav@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/pt: prevent invalid cursor access for purged
 BOs
Message-ID: <aj2Elhx87Nqe2uEc@gsse-cloud1.jf.intel.com>
References: <20260625152054.450125-5-matthew.auld@intel.com>
 <20260625152054.450125-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625152054.450125-8-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 2995eb3f-7745-4de1-285e-08ded2f1dcaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: mzp7jg/SCa1hTNYsRi/ygeUOy88EPMpt2963yiJw0MA5hhfwppuTmG2q7aOvmB/u3p/iZvcqD/dZ3hR6vWgloCBnaijTnZLWsa4LAJXZvA5g82q8UZ62weeq4/FO8FhBOJ4CWIqYDK5CTiZj+EkKiA69TxnvwqBN3JO4WXrujvNM0gvFgplgoZoa2tueigqkRfN+6/MPCpRLEXntRlSr2kB2usY4gEhhSTS5XZ6qIP5IvvSDGFxOKmU6VaVTCDX+dqcMNet0St05Ggy8H4N/XPnwQQCD9gh0WXEmNFDq9FXo1WMfBmRp2C6psmr2mqbObbhj47pilInBUr17DaplfCVDnmIelM1jfKPfKpLwaX35qYVlEIJAiWSf+1OVg5XI+XSSlC++OhEa2elWEQ7ZSeqrbGIg1B5FVPQ4gtuZA0d8TKpn/+1lphODxuIqzdNwvCQPJ3EK6X9b9qKixh24aCPdlIaMNqhLssYZQ1kN2n60bBi17LLunf+/wMmZfvjAdPe6iJipldMfDw2iWIfCs5ycGfn3VVptIiVJhUIZPFKd/efofNdmKPe/ualenEVRhorel99Dado1x2yBxancV4DXnxtAV55BW3N9NPF7bOHI9iBZIqu+0FNAoZR5WtOs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3RO5XdkI9ran4cD0BqY3Mh5kOpThMntXb7mQWL/5OEcvoWR2sJAFfqyc1K?=
 =?iso-8859-1?Q?nWOhhwAVBD2TKZx5VATLc4wEFPndjLL7ERCAAC4qjslyt2YgzFF2lVVP99?=
 =?iso-8859-1?Q?NCKli2GYPqgGZIjZQwhW6VwpOis4dao+qArgNaIecE4qtvKC2WIm0C8v3J?=
 =?iso-8859-1?Q?srUUnGhljvLgA/HeY/Y5HcsK3NvGj9acKpUfu0vsNkGikr7nIU3D1BMLW2?=
 =?iso-8859-1?Q?h0F6/6XslVjHX720DW0nuaGsF7P0/lfE3az9k4ppG1H/bBxMFOtzC506xd?=
 =?iso-8859-1?Q?t3z1GrAtWecGAKme8npwl0EQWigr1EurUVuEOjksZCF3dSLKXWALWW6GZj?=
 =?iso-8859-1?Q?iZ00ZDz1zusKWbB3I2kk97ksw/JOboNKIgjr9PnOgDBor6ZS3AAYKpjIsw?=
 =?iso-8859-1?Q?Q29KTc50QadqxGGg5z2OhNPmJrMydH3D7o+Hl5oczcPUpE/L1joewhofgq?=
 =?iso-8859-1?Q?JGg605RS1rivDyX8dd4HA5vIVOJnMFgjogzgErPFURWQkp6SvtCM99F2eQ?=
 =?iso-8859-1?Q?iDY/HDiN4LkucVCSTjwSc6d07pvxFBn0x/X9mCcDi4KuRSZUd3mTBq6K5e?=
 =?iso-8859-1?Q?SpkLydUebvTU4wqgpNs5zgQZr16BfKblZDvg/B7Y5oMNuojSP3ekGWczfd?=
 =?iso-8859-1?Q?X1kctTnj0GC4eE3VtECAd4iADQCE55SHWK0nPjLyvtiWtDU/oK/9RNgsP/?=
 =?iso-8859-1?Q?NVtqJN/sOGeWxgwrpQxsxYG/9jY/22H+y39qehycOX6D9JlOtbuQITSVfM?=
 =?iso-8859-1?Q?ndIXDeDG9BI1DsmckH2xJVKENtF7yB7e9QPBxYTAYgOc9x2fSHujhpBCVo?=
 =?iso-8859-1?Q?hR3i+srRwRUwh9A1qsmSBnMpSp5DXFvcVTUGn0p8Oq9jbn3Aer7n7Thp3F?=
 =?iso-8859-1?Q?VVRm/OSuRX++3vB/uVZTD5tSzYANiGKpRT/mN7mq3IqPfg3TWsfH+SJNIt?=
 =?iso-8859-1?Q?182YG7+o1NXM5aTOecCBviQEPMH0FULKBFj63x4d8VpxHTPPtBnMTjMQls?=
 =?iso-8859-1?Q?XZV4+Bix8YAKJ4x5wndJzi0WJmOnTp0xYjOFqeuBwNOWZsig09d1DEMiXm?=
 =?iso-8859-1?Q?goDWn4WDpVtcjmVa3tiREau5ULK3/ia2iJpU+gCyts+lbEfF0cTiNDeOQ+?=
 =?iso-8859-1?Q?DWRxiR5ek+/Z3Ih7wp//n2gLehiT84w/avYvUfuCt+KobOKtjf0YYyzVtc?=
 =?iso-8859-1?Q?Lhs6viCM3J0Vn3OKpZmfDGTHO6COVUzEypYFs+9eUsNC1n6DeuCQIQmyAZ?=
 =?iso-8859-1?Q?p2wKLcHMmBR51ATBo19jzcW4Mf7jY9e3u6+jJEjkTrFHEdkG4VXWlgzHEY?=
 =?iso-8859-1?Q?HfrCAZu7CUxl86DjHLWTx7/hnwecPKlUoSCMCH/KloGVA4Of2WRfxTaEcy?=
 =?iso-8859-1?Q?Y0HP5AngucDNwRuXXUIxx6+LBOc+w6L90QJ2aqX43HP5h+llUNP6ONTENd?=
 =?iso-8859-1?Q?ASIZr0Iy33LOcRSBHAWrQol1SCrbt7Rhh8Sp83qNa2+s+kiAW9DhxUQEm/?=
 =?iso-8859-1?Q?LvUouFBEqxhTKenbYmJiwzs0aZ1Pq4iHRBfDdYoJ9LxfwX7/BwRZ6ifm5Z?=
 =?iso-8859-1?Q?VZ7mVC/NWY+KTL0qdMPDJg9Js8gTfSBTGuRBsSJm9OE4l2MrU36fwl4uI/?=
 =?iso-8859-1?Q?zMH2cZP1FE2/9a+QOmivNw4bd99x7VJmHIIP6YZXpcVaUgLvTWjL0GpcKl?=
 =?iso-8859-1?Q?wc/dUJu92kL8iv154KFGCH6nqbw5YgkdH3meIYSa7wS8BmNHUQ22KRp4GA?=
 =?iso-8859-1?Q?PJz6ivPeg6/WVYtez7YOmlXfiPAFt6ol8cu8aUohWivOWVN/FjSCYZszdb?=
 =?iso-8859-1?Q?aKkqrmoXKw=3D=3D?=
X-Exchange-RoutingPolicyChecked: sEpzYFkaYUNqDLBRQiEC3nfbFHGx5Z6pLvfqV8kwa2fS+N4W8jgrLWN3dASFmrFsyWRfKBHhWKiNT1h/+R23QXJqm42fKaO0DA2Cmbwu7wU5hVf1tfin5+JwrEbttiP7e/YikOPB3zMeHbKb/kRnOtH9VhO/aBgMn+S0YOD6EAZluKHUrW8V9QJnNsH8trixIWyJLi+SaUAC7t1g+exPsqg+ok2hGrefjhMrJt4gLINaMo3/j451v2o/bwhqnEgEdQKG96Jnk7KcjFDHLZD2JwxiDAW7G9SXv75A2gdGGk9H+gpf3DnhDd9LWMisS1mHXsjkPd3J2P6+Q4EeWvq51A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2995eb3f-7745-4de1-285e-08ded2f1dcaa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 19:42:16.5449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIPREX+tmCKKeuyDCnnOUK3LgD2rsKUxULqg9nUIbb7+HNKjBk4mX+xsYtTWTASy+3MKBTbXYfHoazNMqLRXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
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

On Thu, Jun 25, 2026 at 04:20:58PM +0100, Matthew Auld wrote:
> During a page table walk for binding, xe_pt_stage_bind() explicitly
> skips initializing the xe_res_cursor for purged BOs, treating them
> similarly to NULL VMAs by only setting the cursor size.
> 
> However, xe_pt_hugepte_possible() and xe_pt_scan_64K() did not check
> if the BO was purged before attempting to walk the cursor using
> xe_res_dma() and xe_res_next(). Because the cursor was left
> uninitialized for purged BOs, this falls through and triggers
> warnings like:
> 
>   WARNING: drivers/gpu/drm/xe/xe_res_cursor.h:274 at xe_res_next
> 
> Fix this by explicitly checking if the BO is purged in both
> xe_pt_hugepte_possible() and xe_pt_scan_64K(), returning early just
> as we do for NULL VMAs, avoiding the invalid cursor accesses entirely.
> 
> As a precaution, also zero-initialize the cursor in xe_pt_stage_bind()
> to ensure we don't pass garbage data into the page table walkers
> if we ever hit a similar edge case in the future.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8418
> Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 0959e0e88a14..b1f6a96dab2e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -433,6 +433,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
>  static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  				   struct xe_pt_stage_bind_walk *xe_walk)
>  {
> +	struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>  	u64 size, dma;
>  
>  	if (level > MAX_HUGEPTE_LEVEL)
> @@ -446,8 +447,8 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
>  		return false;
>  
> -	/* null VMA's do not have dma addresses */
> -	if (xe_vma_is_null(xe_walk->vma))
> +	/* null VMA's and purged BO's do not have dma addresses */
> +	if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
>  		return true;
>  
>  	/* if we are clearing page table, no dma addresses*/
> @@ -468,6 +469,7 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  static bool
>  xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
>  {
> +	struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>  	struct xe_res_cursor curs = *xe_walk->curs;
>  
>  	if (!IS_ALIGNED(addr, SZ_64K))
> @@ -476,8 +478,8 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
>  	if (next > xe_walk->l0_end_addr)
>  		return false;
>  
> -	/* null VMA's do not have dma addresses */
> -	if (xe_vma_is_null(xe_walk->vma))
> +	/* null VMA's and purged BO's do not have dma addresses */
> +	if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
>  		return true;
>  
>  	xe_res_next(&curs, addr - xe_walk->va_curs_start);
> @@ -708,7 +710,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> -	struct xe_res_cursor curs;
> +	struct xe_res_cursor curs = {};
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_pt_stage_bind_walk xe_walk = {
>  		.base = {
> -- 
> 2.54.0
> 
