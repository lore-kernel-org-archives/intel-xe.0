Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B135CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105F510E485;
	Mon,  1 Apr 2024 16:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXLMTgYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4810E485
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711987985; x=1743523985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qqfnKHVL4lvrwgyamH9lR2y1WvP4KT4usR7BqibW/t8=;
 b=AXLMTgYymRCUEgN3d2jayfDRkUjUMdeE+B4tQT6HaDobFmIYDWndpCkS
 LG1J89892HAVLENH8GA73tezia9GQOexZ+d++DXhSlOJM2NEZia03TVYl
 v7OD11b3UlNJfk6M7KN7dONGA21HxlNy5Mop24TAqZx+K3oaQVP36ypyg
 Qig840itn/5hYChIO74QVpIWBRCAtcmqKWfdKK6HZlyrCGBqeCyd9d47n
 f2D5xq9U3x9xHvnhnIlzWCpOKu5VwrIauQIXp4WTHM1YH7ZjuWJYQYGlp
 s9bpBjCCIIwW7FLQpexAs8VYBAR1nzqh7gsQrhP4In2iq7lBfvHQG7Egr A==;
X-CSE-ConnectionGUID: JYW6S1U2TomoYGWVM2qwng==
X-CSE-MsgGUID: by3nymBBTvi6h9+lRlILzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7056058"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7056058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="22505220"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 09:13:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:13:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:12:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 09:12:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 09:11:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xyk+DWJRYdEuhr2YNwWIKTtCooXNBzlO4Qs76D7kn2hm5qvZ6KR1UYB4VYtjsUO/2H4iTucEkS0ZnNdu/Prc31WlsD1bP1xhLYuUzQr7hb5Yno7p0wQkS3cNJQk/0jIDwEUCLNG5zqa+UV/s/ZIeUlgpnSqOTIBwE00uFSVAAG0tzKloMi08CM35kNoVMvGr+vE/ubnMSC0n+0u+Fo2ATUjgF2w5PMzuBvxL8sj5MYBnyBVYE67PSW5c5NrrWaA5Jd+nHj4evB43na5uTpMmht/Na7CTWgmkg2+sUsqWAUKNJjZo68cKZAKyAZsJi4Ivhy365bVOV6z2CjvTg/Ccbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8c//ZolftQ2kXzetJJPo98URTcJNIWA3ZIATB7+Aa8=;
 b=QBzphXHrLLZYZT24TadQW6Wvt/lLQnFd2HeZzKyxaAg6t29YDXtG85JHrMqFGvPep2kJX5TvVd5NMIT0zW+kKms8vaOpED4UquscLuMvCQHd7OMtj3fvne2/BjeYGd3i60oMbasqn1+tCPqEsb1eKP4+LPOYROiCXWeksQ1BWt/iG+wXZy9XkXFEIHzbz3Y7gsaEixXyqLG36VZjSi8zWoGdDzgdCems1SUIjitxT1HcmHbjCKrAUyq1bVCrGtQgGOq35s293IdseCJDohkm6Cg5oVyAQM23Lyq18mQFB9T77ei0WMpiPBqt5J5UpE6darjlTlvL8OygWTGBIQqfLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6564.namprd11.prod.outlook.com (2603:10b6:510:1c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Mon, 1 Apr
 2024 16:11:41 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 16:11:41 +0000
Date: Mon, 1 Apr 2024 09:11:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Add workaround 18033852989
Message-ID: <20240401161139.GB6574@mdroper-desk1.amr.corp.intel.com>
References: <20240401161907.3820563-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240401161907.3820563-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6564:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2k8wb+IRQP+Fnmb4NP9D+u9ad++YFKt0B7SfprkikknuubEbcZxJvldNk2JG0KXvu6Nw11mFuoguf0eHD6hj2PvR7NlIRdKpaKgK4QQZcoTbsE5WPBl1sPKkMbUAm8+AOVasfAQiRYdUwIB5SF/az+ZzLYN5SR5nmcEZIQ6F33KLmeYggCUVVyMXlctdym5nPGPQpy+in3CZyF/4g+3gJSKJHVs08J/ESX5/+K6p+R70WATudAlEX9lBfdV3Ms8suTS0KFs6lM8ou2p5QfaOqN2EhS5r8wZx53zz9wd6iFM/kSf/9z74OaFHiKP8D4oNgzqhPE8GHTPQ98RMSlGtFv0l8+D698CRAYPDuB66zAQ6hncURHV0p3cYWYitzNBKIxdIhM4QSRaHvq7bvLbYk2jeP+iUWWVd4og6I2P0RHGhH2jRJ4TfsOHlocxmeuk1fsk3i+lBFfXYu1tzGNBM4Xq59a/OlIZcabgSMBzbgN4MQaa4Pd2aNk2ZgTDBepbxsd3cqDkf39cDyVZBI+k44JbrmSTHsmWLVSjpJXnln7uUZ87qjxSTtaj1vwdk8w8UA3a9l+i+LJ6PDcu1IY5GWhlXK1HRWsWASEj8rurRucSYyjyO2s5N4/jI1F4wtxjcYWGrN/+HCuMfwZWqPKYC8Mn1252+9IyTT06JeTE9zI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DejqM5uOakYOvU5Ku95rhAnD4MbKAcoCF//gfOnaplCIZxK6yq7ihf7EHStu?=
 =?us-ascii?Q?n9r5P9DqB0pj4fFZhLHWYa5R/pFIFhxqcgbxGWKI4b+6bVma/b3+bEs5QO2Q?=
 =?us-ascii?Q?E4NUjc6f0i9x9Kay3jdUkyvBLaYhva4zGMuzuArE3nmNmIEzdrxIuA9AAMEz?=
 =?us-ascii?Q?MMq6nXpVZ7KbZ3cSgwt1VdU58cofM/xjLQziqKzF7pner+r4YWnofxhK9Z5Y?=
 =?us-ascii?Q?4P6euuFjuI6cnwecLeRMWxy/9Oxlw7wk8ZBS10YmuYDvYq2VrWynGu5jcTRu?=
 =?us-ascii?Q?f+11tnCECTl7hb/tYZT1f3m+i3Sw23khpLROPkX+2CH4D2g57bdBtbkG2Vvv?=
 =?us-ascii?Q?UfOLkgZl7GE109BFXnlnIzLBIsCxb7kgXDaYgBmTI3Qk73uxeutHm9X+/9r+?=
 =?us-ascii?Q?g3H4SJfSogQwRUkjiO5fD1CnU0dduvm6+lAWf1WgzJr6lCBaBDCaN7rsgeRh?=
 =?us-ascii?Q?1pVxrcF+rcCfxewbcQGjOoAS67HJXA06qDPp6rMujIE7KV3mx+BYrwmqWZs5?=
 =?us-ascii?Q?8H4qwY/lwfpSqYdp1ShuYGD2Oj6fI3K2BOPc7nyZC50XUT6XbcZCsiTgO/Xr?=
 =?us-ascii?Q?Gh1iQSUZBUo/cOCr3YBjLIhCQ5CPVY0oN0Tx95Ywwb+JEwJLSJPJ9OM5kpgL?=
 =?us-ascii?Q?22CeXQfTlJBmjKRpwEb5UDVFBQzAcDYZdyiQSHtb1E5qU4u3wUSGkjNPTDUq?=
 =?us-ascii?Q?E4a/7lRRUVtDG1Qla6ltJ+uZc3gfoO+n0uqM0JHHthOS0iZxEZ359h+pmTf2?=
 =?us-ascii?Q?cm6U6t2hfYZwgoRJTGKHQarUFtcv+X+8I8UKudd+ENR6FSdmW0N2jEkWsBkB?=
 =?us-ascii?Q?BiKYVQ2SBkHL761l3OTjrQXnlVMEibTPLxRLgFeWHRznnrCvzbSlyBokfTmO?=
 =?us-ascii?Q?jxp0mqCkgIm3gMQAiFrdYUDf0VUTVP9WMarqvKIdrM/m9Bo+9twazjOZUf+B?=
 =?us-ascii?Q?xWnnsLLD6FflF1HKwuPB+LdL8pjFSQiR9KmLrNUOUF75RPM+tZ8DaBdG56lE?=
 =?us-ascii?Q?QzMYNZ/O6zr1GCOB2rDhbiz8vrPNzAnEGVjyhk0YGB+44+7E5mDuY+aVRS1M?=
 =?us-ascii?Q?14OOYCfNEKVVuJODG3xY0U2W2hpdUIZfQPpxtmXqid06Ub/WIbNv8sIY0UFb?=
 =?us-ascii?Q?YxbHMpe1D638JvYFqRePmE7suSsxdfMMJuHgz3IOW97JUlLxaGSYg58LgxU0?=
 =?us-ascii?Q?/skOfnJzEl8eNDndNDt50OZehUmfrqryw5S7pQyv1MP7R9r1jixRVCXxUzDF?=
 =?us-ascii?Q?mgVB9fPiUGbWt9TvbtANgL0WfPPlREd20bbf2TagOUJ8vxuRaZ9gXwscHnkl?=
 =?us-ascii?Q?GCeuUE6LCSEdEn3NutQ8ogcThWMbUtjLFjbgAMCEUM+pJHUh9lM74VDUeHlc?=
 =?us-ascii?Q?/vQJ1b4L+vWCFXSYb8T9E9oEfNxKPGIKXKMaImpMQsTd5DAQOgq+7aSVKEJA?=
 =?us-ascii?Q?GWx3qdXXf+HbvjLyuTGvoC8daAeyYqPcksNuJPoK1HzqHJ7AduWX1OFtbmOQ?=
 =?us-ascii?Q?mws+XVBU1EkSISmEAs/HvveMfRoibfPSqpPdli1Nfa4MKYfKpc/pJARA9HLc?=
 =?us-ascii?Q?3v/cxUNhutlRrhpX8YL7PIcYf7e3xZoTpylbx2RZx09uOHZoGNeEMc/C16iD?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d171e1-24e5-49d1-0dbc-08dc52666b1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 16:11:41.7995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0CrX5iBETZdZFjaJ49VRN9fi+qxFjjioQiVp8ZyzqPWAHoJUb/Z9cu3qi6hxzs0e6cXzOtH6ggPw5evvABUNE/yBnAuyhnCfk0Cv8ugt6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6564
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

On Mon, Apr 01, 2024 at 09:49:07PM +0530, Himal Prasad Ghimiray wrote:
> This workaround applies to RCS engine's context, hence added as
> LRC workaround.
> 
> v2

I didn't notice that there was a v2 when I sent my feedback on v1, but
just to note it here, COMMON_SLICE_CHICKEN1 is a masked register and our
definition below seems to be missing the XE_REG_OPTION_MASKED flag.

In the past that didn't matter since the register definition was only
used to whitelist this register for userspace access, but now that we're
actually changing the register contents we'll need to add the flag,
otherwise the bit updates won't take effect.


Matt

> - Fix commit description as lrc workaround instead of engine.(Lucas)
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d5b21f03beaa..9728d9da9931 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -98,6 +98,7 @@
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
>  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
> +#define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
>  
>  #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 74b33a3845f2..c904e55ced9c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -579,6 +579,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
>  	},
> +	{ XE_RTP_NAME("18033852989"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
