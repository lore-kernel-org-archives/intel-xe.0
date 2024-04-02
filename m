Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B3C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 14:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0D410F7BE;
	Tue,  2 Apr 2024 14:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCU75jtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAD510F7BE
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712068846; x=1743604846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7M2YnlZ2yk+ANlSF0QPyIL/tsy8qsPYO3oDoI1ZIPl4=;
 b=kCU75jtZ4tI9wO3maNPlwq7tzEMxxRkP317cyXkBen0vplOJ/5PEFUO4
 z92q6+vDqYMUgQdk4FFdf5u4LVdlWw7XX9JN7l4PkybHgQQ+4R0v9xraw
 q77W/e/3fSW8VcaYnBaGhdK+rUVt8o6YSuOs9PikU+YDlZaIvaGNJ9hsc
 Z2OoF4kRYq22nEXjppDshCWtcfAK2fM8aGBDLAJs3Ti9xD2BtjG+71BJY
 AWtu5mHm89Ezd8rzijE/sxAr7g9XlX6PJ+KtjdOZvuKsECcLT3g1YiBGY
 vioKfINLgYsY1G5PZp3VXb/h4DgEUnwK3IRB0r+yXdKxgJiXamiULxMe7 Q==;
X-CSE-ConnectionGUID: yaSwbP5MSYWJOrOF7LpSOA==
X-CSE-MsgGUID: ObsVlKROSL6WyzBAha2kEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7364514"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7364514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 07:40:46 -0700
X-CSE-ConnectionGUID: HjP1h6bOQC6VsUvNu9GNlQ==
X-CSE-MsgGUID: x/xwTn+sQ9+4AOcKQzRGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="22785024"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 07:40:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 07:40:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 07:40:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 07:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnKJxXij8KxFbLBRC9GgMxwqIN5bc8z8WM2n3c/Gs/HrLViwhT5L/BrhbZPHp/dcBeSmGE+z5cm4qXup+Jh4cJCejghVQ3Usu9i11SzwcVF06gdfw0523qfLycFk2TZ/+nfiDFG2kP16jJVjG2Kh4NZrOTSb4IpbxuCTIffuaQiv2k87lU925h/yukt86JSqCGGoBxGlmOF6eQBJH4sf5l5hPsC52nlv4vRwyt1YoVy3dMvVn4d9O2zhtEw2wTXeWppVXOJPAXw27jfcCti1VTwQB8IQdltVOyiLXn3N+M60ssZlslOh6zyPeLGU7xQ/V6pkZCjQQtgzsl/OqkRyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khYPfbYZxqL5NCYOHblzYdoOltQdTF+BNcZkV8TQBgs=;
 b=gO7AkJR21mkrweuIkSdvHJAWOmrTEJklPwj1KsWdmxoYe87bi365kEtGZshotPNTnJAi3de5p++t/RToGZnNEWz5B9G/rv66Dhye6o9JrK+v7avPcoszgzOa4QHfdcmzVvTpwv97QiXmnDTDf7od86w8IgNOmS3JIC0+z1SaIITMSMpFV+yqqnAWqrMPH7fqJa2reDwD5tmztpmq8WBXjja55ZY0R5T++GU4HTkBJa1YBdH9DxrE1i/ZvLB+vGd9R1+hoNly439/fzkhM/5viIkHQJinJsicFFbetl48Qd7kC2OF7mhcDYcs5RMMOdSCfD+4vduB0oCunD+EgWM7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 14:40:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 14:40:42 +0000
Date: Tue, 2 Apr 2024 07:40:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 07/11] drm/xe/xe2hpg: Remove extra allocation of CCS
 pages for dgfx
Message-ID: <20240402144040.GE6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-8-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-8-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6223:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BBgKrYiOSMs7gdRHf7i+xeH5LVb5T7WCa6EimbX5x0LOGd2KXan1uYtSpef9f4d9+2/FIZ/36rQjshCNto8msmUwlgBhJWhi4p6PJqyb7wqXNEDKpNokZgO/RsNdyAK8qCXEJKkL8irBeMDPlLX1Ksic8BkpsZqwWbCLEmB5swPPOWUg+sM+TzG3McGyeRWhtaJKa0xogx2KOPLBe/r4wyjwQm40Jhnwfb29xl3EtVbhbr8lkqE+8UKGoEy8jZjgzZsqOSIqGqQOVvbD6hO28ys/RRx9Z3zlT0yKPxExyO6rGfiDPEAZw0SWbdT3C4HSWexSeomLg0s3VGVmot7kPbTbYVChPBgNdfdHFYNVgMuNtYq+KhrgSrW4pPoMy2zlkZe3w7tC6cWjhVUynMmWSNpn3CIF+Y71mCRTlAuRLSCU+Q1ov08u4bGKXrgWghZiyh6/icL09M2gX7LfKkQqXTqJ3qBLJA+w6Rmn+qmaWbHA4ToldoG+NxErwnVWEeEf4olvaetwClnOliD+6AtJrZ78tK8tMVn7wwfHtu3zOjaeABSYYIjjkJnJYOqNRBsGE+hwsJrHJlbnTHDY+K3nv3LuysLMUBnvGOQhJwjoVqo3ir7a5KyfV7ZXJZf0CEpfAnC4MsYqQd0s2Eq9raiXQMYvQezQDmOLQK0rvpaCe9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FGE6hv3SBhUf53JPxX/y4KN4Aqo7QZN10tMEdCKU6wpPnGc6PefFKmwjQccb?=
 =?us-ascii?Q?UKMTiP7nf1UcyBCrW+JUP1lbvCAU4WFz7WpmG9jxB77iXNICquo0Wv2xeNz7?=
 =?us-ascii?Q?+66iX5JwFfgrrT8yYnXQx/Xzn1zCeVlgDUPOD4TXfgEHqhVDlJnJnmbJFAdd?=
 =?us-ascii?Q?PnhGfDMM5qp+RnTHQjqbO64Nyf+SusAHZ+QJNLTbKZRwBjGTyMBARyBP10Wh?=
 =?us-ascii?Q?R+JMuSTSFD+C5zMrigWD0RNVDlhp/6iHNQaAbAkHm13yWNIHJpeeg5MxzYVq?=
 =?us-ascii?Q?ozo21+inwZvleWd9Ubzc/bixhiVPhm1RnNUsnzXdfBXuQMIA61gWs3oSRbAZ?=
 =?us-ascii?Q?GTHc0S3jgaBmBeeWwhC/cWxa6ML9tI1LSQtcwkZckLz0Twhb3SI+O+iALpLG?=
 =?us-ascii?Q?hu3k1hzwHl8/GUuZi/GqEEFThao1gEMBOEriFYmF1lG8d6O0p+3OcLVLNCmk?=
 =?us-ascii?Q?64B/XdUZzIfzrK7Zr3iu+u47RdN33mwVWle/AKlLtP0bD9gKFpgIFVyTFreg?=
 =?us-ascii?Q?Y307wFaEOEOCTieJdV9k5A3UeQA4hSa1T7aUFH39ltULDw+Gj/U6uyDZEUBK?=
 =?us-ascii?Q?pjbJLlTFfdAuVKPdPjPwwOmpGKfW2kk3YXJbPKYh6Zr3fFJPp5/rxl2+FFg9?=
 =?us-ascii?Q?+aHa1VTkLKxdznIIN9dBhUAlZboVY4++Jrqle4Wq7C4R7reMNO0wBQSEZfWG?=
 =?us-ascii?Q?i3yEGSRYsmKLJrKY4gNNdDo3LC6vUBYhm+2akdqIfILEkMxalI/yLLP2KTaH?=
 =?us-ascii?Q?ILLy8ioVO8JbljpRJkaiQHlyM8Dos3sVCMqOz38hH+BDej9eEhv3nloUDgND?=
 =?us-ascii?Q?OqiMZ43bFhm5jl15vHECPkzKg3SKt5OjdUVdZfH4dK72WrOauvHetMeJpKGS?=
 =?us-ascii?Q?eSdhxV6EvVr3LvxK9jHB/+oafUPxBBkSE6cykSmNC9nOaMpNevH7FXt6cyi+?=
 =?us-ascii?Q?ghX5LwpPmMkRu9x+aDw0vWCCF/HQSboGf1Gl3LQ88FpQkOpbrSokRcwExlzw?=
 =?us-ascii?Q?Id51vVF8RaKB20FMYOlu/ujHp2qaLtGRInL5kyWzZn4wbx4/QfLz7ERguZme?=
 =?us-ascii?Q?mozrcsJ/pAbv/32POU5EvXB2+mfyPWhymgQ6Cr3ldrC4nGw33yWVuihnxZqk?=
 =?us-ascii?Q?5YSVkornkQxqlxwqwkawk/vgkwBfZt67wsL12HbWcfuxy/FdHXEk1NkLV10P?=
 =?us-ascii?Q?6p09lg5UOxB5UHj5MwWpayiz5ZCckDWpuQVKEQENhI1/AWLz1Xw7RzmUqr3L?=
 =?us-ascii?Q?1QntaJ+IuzqtSDdHYIdGiEaS7aOScHNcX0ik9/LkZ24uByXKrofwJQTyenNb?=
 =?us-ascii?Q?XywSgtf9XGrkgVKbCh2TJtYDR6/H1ASNvsBTVcnXUj5AXrahcfbKDQgwFC6/?=
 =?us-ascii?Q?D7SMjnRpxsG5LiXuAXUd9Ym9KQFD3p6E8uzx/By+KbpIplr7o1d4+gC9UWMe?=
 =?us-ascii?Q?DsHdn8dlgncmKSj6RIOpoLuoEXwTRvI7S3hg9IOPSYe9zAwYuZFGEezBEV20?=
 =?us-ascii?Q?w4RVN9Ljg6n/uf74oAiKu5td5TMDsuFFaffm29GbpHHxPi7GOdX1Cgt/Bghq?=
 =?us-ascii?Q?aSnWwBmG3o1PsAhWl05ySzsPDBfa4ORyytwNbAkj+jhDlH+oI6XeBk3NYIfO?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7bb592-cb14-4496-726c-08dc5322dfb2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 14:40:42.8153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQtZwTAhDi9waYoRC2uJ4MmknzkHn/bTKu9tGIGEWrNbmyq+VtMuetMRXPfNHlfgYdyYaT3DPVT8Qs/i2OR5g4A48BBLTCpdBO7hNpo/d/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
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

On Tue, Apr 02, 2024 at 06:17:20PM +0530, Balasubramani Vivekanandan wrote:
> From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> 
> In case of discrete platforms of Xe2_HPG, we don't need to handle
> copying flat ccs metadata during eviction and restore.  So, remove the
> extra allocation of ccs_pages.

This code change looks correct, but some more explanation in the commit
message might be good.  I.e., when evicting, the copy uses a mapping
with uncompressed PAT so the copy in SMEM is guaranteed to be
uncompressed.  And then when bringing the buffer back to vram later, it
will either stay uncompressed or get recompressed based on the vram
mapping of that copy, so there's no need for extra metadata storage in
SMEM.

If I remember correctly, in practice we always want to bring buffers
back into VRAM uncompressed as well, although I don't remember now what
the reasoning was there.


Matt

> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 9298546909b5..f710caf5cc79 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2201,6 +2201,9 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  
> +	if (GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))
> +		return false;
> +
>  	if (!xe_device_has_flat_ccs(xe) || bo->ttm.type != ttm_bo_type_device)
>  		return false;
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
