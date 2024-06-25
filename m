Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4827C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B07A10E157;
	Tue, 25 Jun 2024 21:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvtFOgKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F28310E157
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 21:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719351968; x=1750887968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Hd3RJFNd0tbXKECBSQvUGm6sR0K9LGJ7yljCMYkUpW8=;
 b=FvtFOgKsc+k1Omsu7lkEUj4Keqft53jXvdeHipn58wiSX50HUiLYbkJY
 iKIxdnBlLgIwl8tdLoKY+1I1RL2u/oKQJzo634nckr7Apvm5r3YFE8Qwg
 YMnw5D5yk8NrATZBdHOLxZQWptHFkhZQem0kOO9frtWsfYsP+k/gYkmXp
 nPgQaKm9YnqSwpHd4lkrGVZnHg9/GECjT2Zx7M3G4YcFCmI4kMaOYrsyv
 SU3jHTrsI8BMUUh7yYTIP8uPKZwX+2x3+pz/6Vkgs72d6ulynOVZQFanK
 lsCRMnxk5W2Anvv8P73AlMJpG7i29NtKCYo3P33iW3zG2//1qMJaDsISj g==;
X-CSE-ConnectionGUID: WXFg2dgSS7OqHCOuIMnbyQ==
X-CSE-MsgGUID: oKfxZaUZQGK5mfHXCyINYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16222695"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16222695"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 14:46:07 -0700
X-CSE-ConnectionGUID: Lf1IxVbaSAeJJXwPZLu5Pw==
X-CSE-MsgGUID: 08TD8rCZTF6nKV/GzujOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="48956555"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 14:46:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:46:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 14:46:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 14:46:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEs9wFu5nuYJwQwKiDTevrfKI/qfQm4y813ss8oP0U97FYCPGl2Jwzc/nqLOFi5l2dlX47+HIRPpIDv3ZE0mFeJ/H0ja7PMZdcL3V3WAFCkCTZ3f0ahnsL/KePWsWDtzYqRJQNOZPa0Uy2HcqRTymwGA4BaMM1l5z6Qfn1J9ICNNhl4iUNuD1oQ2ex3HrZrQsk8DEp4e7bTFC327toqTqThsNHX+G602Dpi1JSW5K+HKQ3s6nZ090UEkvvWDKOiYqcHr0uORSBxB5BCtuhxCI0ChiIF3Y0HbbAeGBHzMuca+jdDjPAuEVocngMPBriwYojK/zvy/sQY8CYHfac5hog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IMfeRksYhUCICC+iA4VejoUnPcIbdLwlN+/9eZBJhY=;
 b=JKVOw9wp9vx8c0VLJ7Udknwxr2gKuPXwtBqGDJgRVo5k0ivDseGNum4cYHfYMpQMXVmHa1on2AWnNbt1IiMO2ks2l34JsjYdX9NJ2w8xFJAmrqloZTuwVXgkz4FqchVgxNF7BvhO+8nkThY8VY6TzJjC2fmJhxMrgaiGGWir51yYYiV3yUxhEBFqLY32K0lnuYDPPhDMBOCJ4pZwXcrJ5brAPw/w3c9VApxZttTML8NSJZarI1Re3Kao1tCj+lHdjrLz2JStGhMOu39XO3277EtUO/DPf5WyFpgOgHYxjLLCLUXhAUNpObofNsquph50oGmIF8hnoD2AO7/IHJB07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Tue, 25 Jun
 2024 21:46:04 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:46:04 +0000
Date: Tue, 25 Jun 2024 21:45:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/guc: Print GuC error codes as hex value
Message-ID: <Zns6dR3ZxJlBMD/C@DUT025-TGLU.fm.intel.com>
References: <20240625141258.1257-1-michal.wajdeczko@intel.com>
 <20240625141258.1257-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625141258.1257-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 082f7f6c-37b4-4c12-2390-08dc95603679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZGG2YgYypaQX0eimsvp1eC26egJsWEqZ2/tGYQuM8RWzzfl/I3QCT7vaeHWi?=
 =?us-ascii?Q?Y9wnM91+qFlVE2gUalv/nu6rrzziqRQt62+lO9HL2aD2hx4AjXlAPT6pujOD?=
 =?us-ascii?Q?CnuO14Hd+3uIFrX27zo1We/2dRTp+kMkKGhjaVwaDjWhBHaH3v6snh5wA9BW?=
 =?us-ascii?Q?bcLqHiT8wVZt9f9DTbAs/iX+akGfxFR6jHqCJLKOdkLJYH8/M/M+RZqc05XR?=
 =?us-ascii?Q?dP1jgtwELD9UUJJ2e6c0dLtEJZZb42gH9Of+PE9gXm+zTivm1pfG6HFKX7xx?=
 =?us-ascii?Q?9ryzBKh843Eroef8pcgeUMDKCzlqz8vcifcfnsp8u0vA7U9gHhjqSKbMHywH?=
 =?us-ascii?Q?fvc3aVGHfmBc7ypri0p8RRVaxkIOLf+j91WJ78yZyj5cqVil0EezWYktF/2B?=
 =?us-ascii?Q?YkgTRy4AokCdJgPjGG8KNXv+LsIJW91kUHpuwQiTFK7jFHafT81dApCDjFW/?=
 =?us-ascii?Q?JFKJjvR5g0C7VIiQVXGeZubNUH8DrFidG09psSAQBmptpy1MYwVoEGvpZVYx?=
 =?us-ascii?Q?l/WLloGw0mVjX42pzyEbUY4XTGsJ5bBaNvFpfmkYEdcwUjZzQx6rrDKfKBPB?=
 =?us-ascii?Q?SZYDBhMhXbjRnJ2PvUnje6FW4u+EAJP1K0WFq8sjIeIEjr87XEbjmDryiVGG?=
 =?us-ascii?Q?+mvX/gYkMqG+7ZfXRPw+XjqReJu0O2Zz/cWOCbpWf/AX1ZI6cqDu6/ApIVEw?=
 =?us-ascii?Q?JAChJVLCceBgY8t9Mp4CVcg6x9s4MBE9ddg/tZZx3vNOC4FsVgn0HqHeZsAV?=
 =?us-ascii?Q?Vf4oDo8gb52Xyv/HhxTHzdHv7uUkXZpAeJiq39aNxbphfmDP0RzbT2xnG0V6?=
 =?us-ascii?Q?Q8BgVHWAqO19gjxL20c6dAuL3JFED8dBhqPbOLIzyJEcMmUg8XBSIPol5MyQ?=
 =?us-ascii?Q?TtEOu9fNxxBeItN3sT6437NFC7SL91/4T6XRXH7VKiuLKthkcpW4Y9NBHRzk?=
 =?us-ascii?Q?COT+gh86dGoUNW2DK5jEkhBX/pqqHfuXypImUGx2rCWCWwDA5DLF1o1gXRla?=
 =?us-ascii?Q?LLhXNLLAZIpGCYl0eYY+d+5cJGxvSOclerBsLYtxSX6dC65ah4zl8HJDbOpM?=
 =?us-ascii?Q?VemMpzjsagVbCk4zxM4Tww5uF0S2OnUepU+pxmckVedhEsqptR008vf9PEgR?=
 =?us-ascii?Q?HTeHZeIoArGR45tsE0zKhNV9o6EJphCgw0hs3c2+NM+Wmpro3dJdnHKn5nGD?=
 =?us-ascii?Q?Vq83sjgdZ0TZT8it9zFVLO17+UjHYBtZZZIfSfiDQn1FSrhHGXRsKCiOSI8i?=
 =?us-ascii?Q?qMcZ5m2hBlwkBvtxTUM2opvhR4oOwWk343dDwG6uDJVtQgYnIWHBLiSmhACy?=
 =?us-ascii?Q?wwbW1j5/z8bqvFIcmAm5A0MmTt5v4YZhW9vvvR2DXZcmdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AaLwmDdzz4GO0Hy6jpKTF4FC2xKCtxwjgs3Vn/kxubFeu2mUV7y1fu1erV6I?=
 =?us-ascii?Q?lN0uZFfAU4gkDrHF0yKBt7xHq5LCHhpWvHInYjMBJBR5trTCTIat2dN5szaD?=
 =?us-ascii?Q?vIltFpiRmd3JARmfJTEehOuNYPcI4bTH4+/Ez3PW1oXvejqOW5Pa4ljRUcu5?=
 =?us-ascii?Q?jcgU9Gc/XagOFu4FoRAzc2OsZEapFJnXWLdOesBHC+oc4cgp9CPvP+qeHoXK?=
 =?us-ascii?Q?VSWvhXBVN73uotnsoO4LWDx5XGios/7mI15BAZ7tx8UC/JOdh1IAr5slxo2D?=
 =?us-ascii?Q?M8cQxl9mmHGzXsjjH4KNNXwU/BNPMoU1QSvs3vD8BVFl/IJbj7tOMv1CGIPt?=
 =?us-ascii?Q?poHI0D2UfH4bPIpY4TqDyyey57yr2i+i+j6Oljz7tK6m4uyz1l6PWKGtHwav?=
 =?us-ascii?Q?yTdOObX5iasgGkCmphRkIY7bGLRmMSutVpRaMJvjJro4Siri0UgECBQ3Isv9?=
 =?us-ascii?Q?7WTXWFbrbOmDDohQK8j8papVmk64iNlPAYEhTn92kskrfkuM2ANpUXM8zgGM?=
 =?us-ascii?Q?CJ5GpQpvR1gtFA484KdsI6e3f+HTKmD724IRQyD/j/cQoZmZhFUSXv+t3P8l?=
 =?us-ascii?Q?4l7xICzu85sw70hvtpggEVPXsyhwCvwR2awbsz5SnZeF9I06VHFS4v6q6UKp?=
 =?us-ascii?Q?+BUe84YHuOzaJgz/k7aaN35RN/1jaK1eI7X8Q+fAe5iXWuYegStxw+5D5P1l?=
 =?us-ascii?Q?EzwohiT1869UqU0wUTlzSL1VqVJ9GZ4bWtYesZA4XIdDLnEtmUQWn+j7VlpZ?=
 =?us-ascii?Q?PzEEZQYPm3mePJc3wS9xhm022brTSPMmjvmGotjDZqSRvCNAtUCLVIGhkLH+?=
 =?us-ascii?Q?ivdbl73478egyq6kU3kI6HdgQJWIAsVef83q4H+ZpMRph+nnhL2M1RkAGqKE?=
 =?us-ascii?Q?w7i2MtU/FBFFT4IwExEnJX1+HHPHiK479qS2U4GieSrYR4FqjA3Q7mmH2h5P?=
 =?us-ascii?Q?jrAfGMim0ttOOzrD1cwnLVgNHCY1Es71R16+l/KO50ih1QSn7vly/Brx9VC0?=
 =?us-ascii?Q?yq8rT4RTmkQt/kp+dKNEZpoD76ieXKyjcCVAd+T6zUDp8ruFrXNiT4t7oELZ?=
 =?us-ascii?Q?6OLeCTUvaD9ORMq1fm+b8GcW4b4IF3/h+S6ngY+SeSuM2Q8f8WmNWdTVeVOn?=
 =?us-ascii?Q?XGfRRd1dkunpX0u7LKVsW9RLJ2eT1+3xR6D8B5X5DoYxyT8Y2lsgINROOfHe?=
 =?us-ascii?Q?Nb/Ykvoi9fPEZj6/RuET6dhsNyTUIuVZmeDTdNw0E26MVp/wTa8cQUMuKdCK?=
 =?us-ascii?Q?mSlZRXrQ0nlyw7/rkJFjVNcn43Cl6A3D6RP/pgZ7pYLtLD/XktGziN/kmvkp?=
 =?us-ascii?Q?rpuG6Mvepyybes1pO2VqnQyemoU+sEvkh7tRH4ZiXn65rNm5SzFAeeydzIRT?=
 =?us-ascii?Q?hONYUJ4YrYsyWQfmrApVLcL8ke6GxAvXBVtqvvx+Y6YkSG9pSNmKU63Y8WVe?=
 =?us-ascii?Q?SpuFMgewhewUaGGXaCVac2chknuJi5nFQ9pFW621sdZGm2ZGVE6dZM4XaFv8?=
 =?us-ascii?Q?tk7Xc+/8rxJl3FehYdRTRmfFCxi1y2HrTyZAwLgWY2rcAri6Ho8VJfU+ECSm?=
 =?us-ascii?Q?2HTJoGp2bXb55UxlILFUnQeHjkdVC932mhYXQaZZyzfyNiWjNLUBjzONrs9J?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 082f7f6c-37b4-4c12-2390-08dc95603679
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:46:04.4180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/9fFfRM7wcC5YtZzaOZ3N89opInU/1eMonoV1mWmYuXDcfgAO0v5CYIXZE8WB6RZKUKvi+sIG2owbb5wl5hMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
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

On Tue, Jun 25, 2024 at 04:12:58PM +0200, Michal Wajdeczko wrote:
> We maintain GuC error code values in hex format. Also print them
> in that format for easier matching.
> 
> While at it, slightly reformat the log and add missing \n.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 91a8a969a6ad..873d1bcbedd7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -882,7 +882,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		goto retry;
>  	}
>  	if (g2h_fence.fail) {
> -		xe_gt_err(gt, "H2G send failed, action 0x%04x, error %d, hint %u",
> +		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
>  			  action[0], g2h_fence.error, g2h_fence.hint);
>  		ret = -EIO;
>  	}
> -- 
> 2.43.0
> 
