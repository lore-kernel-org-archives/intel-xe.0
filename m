Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2AAC77B7C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 16:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E35F10E42F;
	Mon, 23 Jun 2025 16:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWeS/PvN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F9210E42F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750696348; x=1782232348;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JTCIWuLxMTplcCQ6c18j5O7o10SWPPoke3JtxtDG2ZE=;
 b=VWeS/PvNrhc4a1ig7XXeywHqzraGh2X1jmd9Wst5vFyCeZtkv5wIChjq
 Wg10s8xokLPVt8cJVcZRfaz7PYHiRiw1BowbPyZW2wom3XkvZ8Iq7vkRl
 Gyud6oy36E+4xE1J29vCZAUtXa3IOcblPhCeN/N7CksEY/r2ngzwrjetY
 4HFIhnLJD11krxIURgkU2xHTUMdDOHs/ZcC3YaKW/ccPue/AwsPhbKFsL
 Er9vI8mhR4n3CnJVsXTGQkYggXeTysqmOty7YsR6B5luy7bNTDdtHUJ4K
 OuM9l90UvEz8fgYhH3xON1U6ZtfxO7x4lC0gcCV2VD4VtM1+coP2l6Eq4 g==;
X-CSE-ConnectionGUID: dcsk9Y/wTc2FpVu7Ke/sOg==
X-CSE-MsgGUID: ps4btixNSRCULYv8tIggKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63517643"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="63517643"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:32:28 -0700
X-CSE-ConnectionGUID: 9vSAAMH0RQmZ++9VgUT/sA==
X-CSE-MsgGUID: csjBeE1NT1i/J8ShN+WcxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151127118"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:32:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:32:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:32:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:32:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTozjvo17i0r9hZa7fgYjJKmbRn5R50qGDntv4RJSEYLPd9XN4dcvKzL/71QzoqelmYyKq0wZ45A36PMcAqk/TDjZuWNnI5vQiq7CrRG69esVuLqfBl7je/e2I/UCPurC4VpI0oi4qkLYuP6zpqJCc/WVCz+Db3ouesIphchpPfaZrK76SxZEBZuznVcYuWHMqk69fpXFWuK0Id82B6c3NR2C0r67VD3PxgoNZP6PL8A471N+MyAREtrHc5i5gLTYpGs3m1+Y9FzEVr6O1TSJr/nMLaUcn8B0CzF7juAGEli5Y9VG0+Yuu5yPj48nTIutlQdWee9tUOmh8HwWeQIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRfqNE5Ek4JBgoOIOyZ5ZBnxUJ7qTb9jmlk+boEk0Rk=;
 b=KgXCm1X0GfH8xtuHZf1I0EgARgHIfhbU2cCPsKtNGgYeesBH+2cG+HG2B5/V2LZfKDKXzifFrzy9KZDVD6x0tIR+6cNxZV0V/wiCPvH8roSPGaxdk4X0HRCysCy4NTI2eXbOC9wPS0/zzekze1nCB0kbG1B9LIOBmRlB11rx+wIE7ecpPBJB2+WeSRzDXmfrD/miGmaPHjZp2v4/HLbXJcHFpYtiAnhUg+da+019OcDTYykyz21kmxPo31yPy4i7xvVVVtEFLkGTqk1+HLpSoMJySrvw/jpfHG1pNishsazeKNV5qzvFBZttjT+My9Ix9evQBbYllcRjTsBo207BSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 16:32:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 16:32:25 +0000
Date: Mon, 23 Jun 2025 09:34:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 14/20] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory
 attribute
Message-ID: <aFmB+4yynXKTb1Xj@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-15-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-15-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 69497fe5-690e-4e89-6b3e-08ddb2738923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ljg02WDtK/PKmPw8R+pFx6U3tjibFfDSDvQJfubZZGYYRVdxfK+0TRe3xQrb?=
 =?us-ascii?Q?wz2YRS06vMQn2ZUhyWah0SqONQSzcA9WwMj6q+ZVvxaNrBX3fXJHcaHMLAD1?=
 =?us-ascii?Q?66HfqzQkZTTiM7WQNxFR7OUPI5kX+KGCBKmVTXUZKezsmRN+dWPRlTSFv8dg?=
 =?us-ascii?Q?zTS/nfbc8MMiDC4KoFJD+6Lx98isc8WgdbGifQuPm7p2kElx8m+Gt+FneHO6?=
 =?us-ascii?Q?WFRg5Km7jP8P23XvAbP6uvf0HB0Qq9XhGIR1fJph8JNMX3FOvkJMQkMzi92M?=
 =?us-ascii?Q?0xagI1e+4RNVpTyJb4/CdiywLbPCKUfE/lukBKfXPFrpniMMFMMn10dQUHcO?=
 =?us-ascii?Q?DP5Ei2FzjqRyCRsJY1hOfy55KyihkMYUZqZE7VIb1PzcZ3smdVXE7ZiNZR5v?=
 =?us-ascii?Q?lDQn6ZhhtQbKthMXaSAwRPi6e5jnfBwEjjhdHGt9kZOFejEC+PmdLwzij917?=
 =?us-ascii?Q?jxBwFLmv/punH52028tHpBv7MWXi2V8eKWf9JShdZ8Y/BYoiye66AtFJLA4n?=
 =?us-ascii?Q?nQL1Q7Z5ZNWzN6gsF4nBa7GUakeCusruHCAc3F0h7Fd+XXTc5U7LC4venO/a?=
 =?us-ascii?Q?simxzSybOtcKTFa3mOrD/XeuF/wvrIitSBA+XLdFQeiwDd0zzsyXExz3SEL1?=
 =?us-ascii?Q?h5IJ5p3BlKQnEX/krrtOguBuKIS+W4SE35AawiXAY5ibVyysXxJKmbdojJME?=
 =?us-ascii?Q?dZLYwTd16orLl7/3NPpMqXHOySVM2CnlPwrN1T4tK610Hm10+jpnhTIu36M8?=
 =?us-ascii?Q?z2n38DxHQVGsMRqDPvnRZcJ1hArk+pIadjFg0vonZiz7SEds0XEnJHr5twC1?=
 =?us-ascii?Q?ayob1quGwQIoxHjci3hg9LQt+iU5IzTvdt5zb2edh7N1g1kH18NqThHvUD7J?=
 =?us-ascii?Q?fDXNL7/+DHN+rOP0RBsI3Pm4YMyGrYP9hsrahBSSIdooiLv4E/kN8XjKpbhq?=
 =?us-ascii?Q?7TLlDxlUhbI12H1EjWmA7kIXRr+d8tMbV+IzQTiZrKo/e9LvecG0MeYhrbYo?=
 =?us-ascii?Q?WKQeqT4sCkhc042UZC/Nd55gPDRQGWpkY/y2SpNqE5JnhEcOwJEeZel03JVH?=
 =?us-ascii?Q?KgokOgv2XgbCNxTxccB11ljtWjGRvTANKSpHUXN0SNMpopibXjQrH9SEb7Wo?=
 =?us-ascii?Q?rd6DfAqWFUjj6j+ASpSr3iD3fILlptA5NCmmPUmj835K10euf+KIc/qVG7HK?=
 =?us-ascii?Q?PLcokFfW+qFjiWpF6hqn6iMDfOxzKjebKCmokDPurlgRuN2+lrr2NSMDMCbU?=
 =?us-ascii?Q?TBZGxgj7f9GwteoYsXNoesg+f5JnXOO92Xn8mI49F0NJjRxpWmMpg6oKqtE3?=
 =?us-ascii?Q?DIEUuXyPDPNoTHZJ8x9NM92KHQKa4e+s34pAAwlAu4ygrG8y0c0lQx+wubEr?=
 =?us-ascii?Q?fOCc5UwhHB2N7A+3HLi/bavWp3JjPRmqZWgLWDi5gOW8O0SqFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ICRQMRlLwj+PA/ijqBfUPNd1aZ9MhY3QLPf/uXaMHZTZt6Lm13P++0N45CQI?=
 =?us-ascii?Q?8n6Wmu0Nlezt40rJUPBf+6FMNPbsqNR+trgc3ccvRtGYRrw+tZcw1O2nUPXK?=
 =?us-ascii?Q?HvcmTGHpHHC6Wjf7Fxeo0hdBbjnaa8u8lty36gu3mN8hudXQEm0PspSkW0W9?=
 =?us-ascii?Q?3jNTd9a+PXRRA6BwK/FTEAxQtGhXWHXiwj58+2J4qrrwK58qQxJujXVaA285?=
 =?us-ascii?Q?2JJ/BJJ9uPI+6gjndD3d+YveFHW3byoz14HYapZTj54y+7PjNRpxfwq3kLhv?=
 =?us-ascii?Q?5/3bm0xhZwjTt0S9ImVwXftn2r3pphhJ8QgfQjBmfEs3Jbi0iMb4K5FG0eIg?=
 =?us-ascii?Q?HxnZgY3Lcqux3GRdpTFGBUEg7Jod6kIXtFooTiHRtsT7IIHoRBlIxqj+f0tt?=
 =?us-ascii?Q?iVYXtuBG5Oqzvd9YIKflT8W6PBc3bGPUK4lu3T1SpqTDT4I/wIYhLRsqa4cB?=
 =?us-ascii?Q?i+kUMmTjfrVEjncj5feY2egSLWsvUJoPMcxbGDNzngeXzENJMxYBSZxydisF?=
 =?us-ascii?Q?kQxjINiTY0vqEEiy7TlsM5KzL1c7PNz0VQ605VaESdj2IWd2qOJS3Av36vzk?=
 =?us-ascii?Q?73adpcwSK2q8KCHv5wm26Ja3EE4mO94BFtLq3gc23Bpt1VRTkhsTn6rnF73q?=
 =?us-ascii?Q?fn/Ja9g1kXuyIb547mvOLOU2s844Xh+dTRxiF1lG62nj1CR/qh4V1EqB7uxM?=
 =?us-ascii?Q?GB0FpOFjtL0X8jtn31s62T0GSPaX+05gLyF5Aj4PV/mifSHltC9ERqIWmbwU?=
 =?us-ascii?Q?ksXzvcsNj+F0xr/dsSrhTN6y2VLKmfdAdqFhu73oZocXpJkpwHechfqpjw6d?=
 =?us-ascii?Q?/B80ho6c2JBJG4ltCMybo8TXSzfM+j7X+CG+H/7OTERZEwI/2prgiu20IWJ+?=
 =?us-ascii?Q?imJwrjOa44aNdAtkcTdwpTcdL10k2nCuo4OBmpQR7xeZSoBea5o3+D2U6hS6?=
 =?us-ascii?Q?T830aapcVz+b6rzUVJEHvUdjgEszvW/izwdH/E5eOc+KqszWpNytU55JpPvX?=
 =?us-ascii?Q?oOZHrrkLj5bLZrGUjTVc+Zv6BtRRoKyrrBUNQZFV4weYlUuatCvaRiqaWj3t?=
 =?us-ascii?Q?LHJ4DEuo7ta6ZwiW/gdRzi5G4Fs+sztaBrFWeluDbZiSqLOlGMGB/kJ2YMSv?=
 =?us-ascii?Q?xU0u54YVna8YGbaB0b8aFVCpKPKUGBA5roVFyPe6iSCsDQUCDg5Puu4vG2KZ?=
 =?us-ascii?Q?WX03zuCLtLE1ztyMiLpQzbJh7pBqBYKsM/QpARtPPtHdbsJ1j7q+raH9RsXy?=
 =?us-ascii?Q?zzX1ckuYv+z3Vf5t/PhvMaIAYDi3pbn9FpyqqniBMHOc0vEJXkR2TT67WMVv?=
 =?us-ascii?Q?5mP1cLnjPd3bf8Ayr7DHbjJI6l4rpqBKEKXs6FdYbTtRK3rAdPnsJMey6XJl?=
 =?us-ascii?Q?EIYwUlCSPPF9wKMF7mT88JU0PM+CDUmRn/BZN3tQycdbbw5j0G4oSo5+FJFw?=
 =?us-ascii?Q?+60v1RKxbYFEALpMWaFn+XLqDWzL0p+VeAcL/RKPZGDg6xMP4MKt0zxeLy6g?=
 =?us-ascii?Q?A40vxKvdgKPi4eW3ED4V2l5UhUKDbJQiWlTLNCV+R//786sq+OAbpodvSxIM?=
 =?us-ascii?Q?ook1nsAdFTwRlnRYRXULRN0YONw7v0H1MXZ0Tw/nUS3wydbAOCrVplCT7QBt?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69497fe5-690e-4e89-6b3e-08ddb2738923
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:32:24.9772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7O/4vGxzx7J4EzB2qWkD5QpPB/ty5ixzBaxBCr5BlwWXq5HN+GL9/EjquWYt+v1Q2J2lBCLs2gHKnlss3pk6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
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

On Fri, Jun 13, 2025 at 06:25:52PM +0530, Himal Prasad Ghimiray wrote:
> This attributes sets the pat_index for the svm used vma range, which is
> utilized to ascertain the coherence.
> 
> v2 (Matthew Brost)
> - Pat index sanity check
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 64352fbebd25..973627edb23c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -11,6 +11,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_gt_tlb_invalidation.h"
> +#include "xe_pat.h"
>  #include "xe_pt.h"
>  #include "xe_svm.h"
>  
> @@ -115,7 +116,13 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  			      struct xe_vma **vmas, int num_vmas,
>  			      struct drm_xe_madvise *op)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PAT);
> +
> +	for (i = 0; i < num_vmas; i++)
> +		vmas[i]->attr.pat_index = op->pat_index.val;
> +
>  }
>  
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> @@ -195,7 +202,13 @@ static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const struct drm_x
>  			return -EINVAL;
>  		break;
>  	case DRM_XE_VMA_ATTR_PAT:
> -		/*TODO: Add valid pat check */
> +		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
> +
> +		if (XE_IOCTL_DBG(xe, !coh_mode))
> +			return -EINVAL;
> +
> +		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
> +			return -EINVAL;
>  		break;
>  	case DRM_XE_VMA_ATTR_PREFERRED_LOC:
>  		s32 fd = (s32)args->preferred_mem_loc.devmem_fd;
> -- 
> 2.34.1
> 
