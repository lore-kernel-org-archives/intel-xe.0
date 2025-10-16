Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92E1CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 02:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D7A10E92D;
	Thu, 16 Oct 2025 02:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuwBNEYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB8810E92D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 02:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760583523; x=1792119523;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nDFMGyrnQpmvCPzVcbpZ7yecS1Q7K3k0EqYKueeQWhU=;
 b=DuwBNEYu9iccUctbtmqWylIeVWCRK9QvuUBYK25pYbp1IfqnvCFStE3F
 rS10kDnfR0hsNP1LLfvoqJil93NFHCF5ScR7PAtrnhAhzhG9zs+sSkSlE
 riKLxZs00hVAfXLSjYwAZWsMGpjzkUJtCteGv8t+fHWujgdT1RAC9vboh
 sv6QFEpd9gcbKqGBJdPmKWoKla19dQpsLk9UcBXMP8dMhn9IIhe0ASGEv
 5FBW2yxtfAcE9UABkY1iF9CLNSSLGqrLCMULXpqv6Q8+dNxAIDP5p5E8l
 UE+Z3SA9B+vYz2fW1KdQlikVJVK16IqSKWSdKJYsZTWkotM3u+jljValJ A==;
X-CSE-ConnectionGUID: VwRgIiVeSz6v2SelNB/yEg==
X-CSE-MsgGUID: dIBAfkSkRHmCAJaxpPqSVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73369114"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73369114"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 19:58:42 -0700
X-CSE-ConnectionGUID: JI/E6Z5iShy2Q7vJBBFa/g==
X-CSE-MsgGUID: 8Ci8u4GwS/+x4cwQ8HvHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182274605"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 19:58:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 19:58:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 19:58:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 19:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6qNFVcGgi4iw0uWK85IrngbXjwrVFwecdHyVOVF+uBvJ1pqZQlmE/Qkw58Mp5YQY+KX965RXXrgjndjGXlbUKsrg7DwxYIQB85zlFZGWwplVmCSpSbZZGewvkV5OXQuXzvyRcVXgjEcy+FYlKSdwhFmSS5rHKRgUbR8jOMfxCMNo9+o4gjPYfhP4Zv6nFG/DYFcQU4KXKND/TtbFDMMWYmfwTwIyt5vswTyjt+KC7l1FXSgL1A7gTNa293x5g752N8Fz3OEdNv67QjmrE9yhYbiGrXGgaHSdGK7TZOLYOH6lBfPRRmThQGITCcnTRR2D+H0OBqGRRx3lnvk2w8Cyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLCTkFZL/XqMxbti6YBXY7YnVbDXFPWBcC0jtIbl1nI=;
 b=bG1OWV8FRLT2rwZ8ZhHsyFnVLdiClf1abhEe0ug4qWxiu0/0U+a0yd5QKEIB5lOfiwowKvLeq+d/QLkisw4n3PfXaePq+OvqJxnFlvmyJEdKDG8m7cMSNlKJZPE2rWyG8C4gjfi2fvCLmqz7wAyjOjsOZuYI+a/JM5JFyfgT9GyDybs9Ei1ISFduOo7VuIgOegEHLTF4p0hXqBAEWn7gYUj61OtOAJ+BplRGEWBYc6Hiho+Wlk7ZYwvxnUSmVvpHxdSHrTABQYr3FG2IMHvGKYMdB5L3FeeWGfPy1Q9wfP361i5aRzeQa8Ob3wDgpL0KrAiz4bY0Ea3zVMjAIVVA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Thu, 16 Oct
 2025 02:58:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 02:58:32 +0000
Date: Wed, 15 Oct 2025 19:58:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe/vf: Fix GuC FW check for VF migration
 support
Message-ID: <aPBfVRjz5AraRGsM@lstrano-desk.jf.intel.com>
References: <20251015002755.720992-1-tomasz.lis@intel.com>
 <20251015002755.720992-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015002755.720992-2-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4PR04CA0352.namprd04.prod.outlook.com
 (2603:10b6:303:8a::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1ccbbb-310f-4e21-1656-08de0c5fe3df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M5XOTRSJyjkbaFeI0fMpLqUzvY0TWk5PnMPxCE2k9NvEOfLgis+Wd3OK5pYo?=
 =?us-ascii?Q?7AGuSMEybpGuV4poHJQT3Sm4G0lX3vKlU8TOoZnKjFmfQTcnLyQor0IQE5m3?=
 =?us-ascii?Q?YulZOtItH0vz+KWDHhsS/dXcNsKdJFI4tuzldkjWvu9OeT+QY8ciku32cNkX?=
 =?us-ascii?Q?0cqHie4mip+4cAhAnYt6p60M159iZbuPdTP8U9rrLroM4gKDApDAuy6DaNx9?=
 =?us-ascii?Q?1qjcgwuSoee3vqGqyOSigTHDZx1CPYO93tiWrwOs3UY/hwVHnGMLpW2n5lqr?=
 =?us-ascii?Q?fdj+EjhymEkwTq7Skv4Vr7utO4ccvXET/j+sqL8CGinAFDJwqjX5px8EP9g8?=
 =?us-ascii?Q?QFKIRrpHchjXqi4NahyRinuCO7931RlTktxdfyxa+cRKxKbtjnjWwojDWNRA?=
 =?us-ascii?Q?QC7+BRHgAmJZpVSJTfxU/widWXwxeTxgOk0FWriSaWETBNPgfuJP8LGBrtzf?=
 =?us-ascii?Q?212BQkBljEdly/bzmF8ES8nomHvSnm9y2VaghNAi0SA2O+N65Bd23PRmCU3m?=
 =?us-ascii?Q?6EEgPs3tYlhud4fFPcefE8URACWk319VxGOVICvJ1yireJxdVnLlytFbemOA?=
 =?us-ascii?Q?/8sPCMWKgJuCdISrWliSr9zrVvph4E5pOl0lLIAAdBQrUR7S2GjuvWIfzJvM?=
 =?us-ascii?Q?UnTfPyp0Na9URFrMSHFSV+1cWo0XINnhr6h45SWRAW+q1nhPXPAcP3fw/dLt?=
 =?us-ascii?Q?lBw3ZE685qLEwx1nwlR0PjMwE9nA09PFtf2OWt8lbh2jRQsgkvScsKezb6Sr?=
 =?us-ascii?Q?WlD0HjUUjVuP9M95ko4nOKdPU1bYxHQ0LzLsFZuM1aQy3VeWpnO6LlfnRy9H?=
 =?us-ascii?Q?K1AY7XvQHJ59G1aMGTDpUtraH5Ix5TzU2VpvyvdcJt0Ub5cwgTZFFqPsoZBv?=
 =?us-ascii?Q?NQZzYNzFhAQBj2wnc+sagXK7nlk2YRCOullcMC9PqTLHCHXLlBjfBJFmO4Yx?=
 =?us-ascii?Q?UuOGZoUCNlKvDoBitqJ93ZkHY5E4jse3jOHAjFGokghDOg61+UPBk2tkbp2w?=
 =?us-ascii?Q?wh4Eg8HC26ab5AX+Vy2JkrnWLyIVyjWj8n7CCs9adjMEs2dLVUIpT6DfsxLd?=
 =?us-ascii?Q?8JH9Hcy+2YJ4hJKsGN5wJuOmvbas+2HZX1+Ob6dAkQFFrs7U807tI6bJxWsr?=
 =?us-ascii?Q?I7okbvnYhNQXccU8UX4oXgVBFkuFHTCoclH8Y1EeaQyAlL7l2zQLFUoNIQAE?=
 =?us-ascii?Q?pW/x/JR86izU6poxN/SCYALnya0Fgg12hFTLCMXNvQUBIGaFjE6Fcy+gZkSN?=
 =?us-ascii?Q?+EdAU0SQwDmFHKoO7qyqLw2zj2/xwC416xE3gMcvWgARmWafOSGIqtAAT3RV?=
 =?us-ascii?Q?QR07PK/VqoWCvZ+Q6A+BwKAoJmJMeycs0Lm6kbAhgEj6QmDedVi0Z4VsCeO1?=
 =?us-ascii?Q?bF/wENQiewDx6omH+WRtNokD4doWqwptShz520PuWzqa9sxJlWa4ri0LnYOs?=
 =?us-ascii?Q?IAORwYNvPZo6BlvO84gkVUL+HazBSrau?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CmKjgTIOsm8PIp9SwykQNc9EwooWNLKaFFvXuWy7U/ORDKzQLSq08VOIv8FL?=
 =?us-ascii?Q?a7be3iOCz91F2FJkvrHymWL5FZCtdH/ideKSOva0JON/dST04+7ClErz0+PB?=
 =?us-ascii?Q?4lFUD1jjGfUs+7Vh7cTjj82iZeSjeFn5Rel65MGdtVBBD1KNmpcRrQhKA672?=
 =?us-ascii?Q?GoGRGIfU/qoDJhQqSQoRNK6JUd8Q2iIi+ere61/ZU+Y2rOkycEFoD0Uyyr1n?=
 =?us-ascii?Q?apgQAJEJw+GyBICT71KXKLAuO8YhsVEfnlO6xKjs4nH8w3f6mkXfDndBzjh9?=
 =?us-ascii?Q?/vcymB/np44qxZ/O79acSHix/G0FBgWIOyeEXj5hIsSzJdhyqFUOjIWg59Ro?=
 =?us-ascii?Q?uJiWwhlka5HDJkfcsI0k3unzZiTrTL/J9iAg4iAH3saVuiJ8XxOJkloFcHbm?=
 =?us-ascii?Q?G4bfvxBbMe9HmICIrTOqsPqUnDRqRkg1D8Xv8mDh8Ey9k6uZjUjsvpx8UvCX?=
 =?us-ascii?Q?8Q4/Mf/2Ledof3eq6Pt5Xm4ZvYEIT6JjlvxwrOFx92Zqzrx/3LKXsCMeab47?=
 =?us-ascii?Q?Qc3O7DwiGbSOQozRSA8qQCk1S4cJijyYatK80Mywd8tR0LrqfpQBSwpgCJqU?=
 =?us-ascii?Q?rTtIlsfGFJWoQojqAJCGQL9kYAUucNAzfPTO9nX1yBZDkOl6e/gUuTfi4OIE?=
 =?us-ascii?Q?4X6fQxF67G3b48pexPLNFMLzq8JS1l/CXEMI3jGbPDU6AQt+h5KoI+6siAcG?=
 =?us-ascii?Q?Yyaie1CtVyR9lv6z3f+TdbEe0hqb42qZDGjQ2c7N5WuKQK/MH1Zq6eOBc0DS?=
 =?us-ascii?Q?GWBgOKmqvQzbYaHhtfw+3H+m4Vu/WEsk3GV1uhmSwJEL+b3/AdRUHOEo9hi0?=
 =?us-ascii?Q?IR10135p0xR21AUF4jxY2o3yKjmH0CY+o3z+bbc3pLRnUIBq0Xa18w+4ymx5?=
 =?us-ascii?Q?s3qffmH/6Dug6iz8cQWllwyHEgwu3UaUnvFaKw/viFZM1eK4xxdvBMnsIB6X?=
 =?us-ascii?Q?0LpNHVQeG/mF84q/wQ0+E+o5Sg46UlZGBFtTCAwRSw5HwHJiZVIAmNOL/Qt2?=
 =?us-ascii?Q?+x6B7AvJjciiKISyjP6VOXrqTaXpW7+fNkaNOjClb1PlJQWdvEEpdTiy9Gap?=
 =?us-ascii?Q?TVrzxtbLTMSA4ZXzVemJXSMNcFoGc+Iw/KwkuAm5jYmW0dxSQ7R7gYvtcEyT?=
 =?us-ascii?Q?AN7vOc1ek/DMrc5g/9X1FiSEiiZA6vCvBnUT5zMXQY/8/5JiGwTO1KUIcxmY?=
 =?us-ascii?Q?yyvW4UIws2rjDTa7tz775vdZfZhf2Kfcy7oUly45LjRTOKj7ktVpxHkIaIWn?=
 =?us-ascii?Q?fdurNvsC9YwKQlsM5GOOY6uroUDiktsH/VejOOk0uLrfNYoPvkXeeweAobS9?=
 =?us-ascii?Q?u8iOd1N+gzKtNRtlKVQRF/DwADawbiiMKfYOpSbC3tZh6PVssfPoeti7ykGi?=
 =?us-ascii?Q?45/Hvf0VJ5+/HFG2xGXk+nTUbsbO3RgVh7rejEqqALc5OoqLEycV36PVmdLM?=
 =?us-ascii?Q?T6F5Jd+cfl9qio61HpN1Q+ej0fAxKYBZmijo0fWW9Vk7Fs8HMsJ9umBQIm6b?=
 =?us-ascii?Q?IN9mEH3dekBBQyIxlkJ8UA0CxZkqdUCP3OmA6ytIQhy3btRoy00qJoqHk9wQ?=
 =?us-ascii?Q?Ree8WFD5B4u/2o35MxIHj49JmobWzr+4tKnmhab0GEKs6KqFk19bD3TXlMvL?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1ccbbb-310f-4e21-1656-08de0c5fe3df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 02:58:32.0877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhFAypdzoj/A0T/IG6xrtuSQ7ee0cp7DxFI/es6dGIPtYgMoAYUzO5TwjHcEcgQ6S3ESiJPJI6cj8fuUZhw4Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
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

On Wed, Oct 15, 2025 at 02:27:52AM +0200, Tomasz Lis wrote:
> The check was done before GuC ABI version could be acquired.
> Comparing only to zeros provides very stable results, though
> not the ones expected.
> 
> This change dislodged part of the VF migration support check
> and moved it to after GuC handshake.
> 

I thought the handshake has performed as part of read_gmdid earlier in
the driver probe. Still confused by how this got broke but anyways, I
can confirm this fixed the VF probe issue:

Tested-by: Matthew Brost <matthew.brost@intel.com>

As I'm confused, I'll leave the RB to someone else.

Matt

> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 44 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_guc.c         |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c    | 10 -------
>  4 files changed, 47 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba3..95c10de0732f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -314,6 +314,50 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> +static void vf_disable_migration(struct xe_gt *gt, const char *fmt, ...)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +
> +	va_start(va_args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va  = &va_args;
> +	xe_gt_sriov_notice(gt, "migration disabled: %pV\n", &vaf);
> +	va_end(va_args);
> +
> +	xe->sriov.vf.migration.enabled = false;
> +}
> +
> +#define NEEDS_SW_CCS_MIGRATION_WA(xe) \
> +	((xe)->info.platform == XE_PANTHERLAKE)
> +
> +/**
> + * xe_gt_sriov_vf_guc_check_migration_support - Check for disable migration due to GuC.
> + * @gt: the &xe_gt struct instance linked to target GuC
> + *
> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
> + */
> +void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!xe_sriov_vf_migration_supported(xe))
> +		return;
> +
> +	if (NEEDS_SW_CCS_MIGRATION_WA(xe)) {
> +		struct xe_uc_fw_version guc_version;
> +
> +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> +			return vf_disable_migration(gt,
> +				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +				guc_version.major, guc_version.minor);
> +	}
> +}
> +
>  /**
>   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>   * @gt: the &xe_gt struct instance linked to target GuC
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index af40276790fa..60a3b9b05b20 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -26,6 +26,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>  int xe_gt_sriov_vf_init(struct xe_gt *gt);
>  bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
> +void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc..3c4e64233b3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -713,6 +713,8 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> +	xe_gt_sriov_vf_guc_check_migration_support(gt);
> +
>  	err = xe_gt_sriov_vf_query_config(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 911d5720917b..5fb042c05112 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -163,16 +163,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>  		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
>  					    GRAPHICS_VER(xe));
>  
> -	if (!IS_DGFX(xe)) {
> -		struct xe_uc_fw_version guc_version;
> -
> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> -			return vf_disable_migration(xe,
> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> -						    guc_version.major, guc_version.minor);
> -	}
> -
>  	xe->sriov.vf.migration.enabled = true;
>  	xe_sriov_dbg(xe, "migration support enabled\n");
>  }
> -- 
> 2.25.1
> 
