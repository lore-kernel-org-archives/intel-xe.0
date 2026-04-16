Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A65F8D775
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 19:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E41010E218;
	Thu, 16 Apr 2026 19:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HE7jemEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179310E218
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 19:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776368266; x=1807904266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IXh1l1Z5LfV8tJAsi5+aIW9oSCWM4LuotQS13v9KWBU=;
 b=HE7jemEmZ3MErZvHmAg/GEtHvL2lL5o/49wx66XH1BLYTOl9uxerGGBn
 //CWWn46aC5c3Dp929ZYxO7QMF8W4Mx0CKD34T1rspCwO0IOtFPgOX5in
 ggS/s28K8JDPkSa+WL3e9tefla6ycaInQCJZ9X4Zc2wapTgkkapp/4lXX
 RrPV2PRDmG7gR9Dhs0G4w3LX+CSCzD6wE26cMGow2bN3x2F0fTSx+Z6cJ
 4DWIztCDfjCm3xVg8VRfb3Vsmi5mPbz8omGYiPq1e+LO21lQUAIlWH82O
 awha1wJjVK76gXpK2dYr4l+E/IVi+J1LP2pAWgw7IMZE6KIRBeQEVq3rj A==;
X-CSE-ConnectionGUID: KPs8CvdeTZekhFQmc3qZ1A==
X-CSE-MsgGUID: P3i6Z77DRV+W6ELzHp+1rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77455085"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77455085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:37:45 -0700
X-CSE-ConnectionGUID: ebtcdglaRaS+H4uR6mrPwA==
X-CSE-MsgGUID: +5jyqF/fSwSADqEoB4E/OQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:37:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:37:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:37:45 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVwflxVti/CZWEUuaX93j9HOOUNlHDkZW+E1zbUl53QiI/5KlsCOGGebd5WY4dVhqspXKJLtuopajWf2oo/CB7NEUUoqB7Q+j54zjZeUvEoFgyrzDhv6SoT8Ix0LTxNNKzge9wbkJUWPGZ+isBxPSEMV07vkorGqKJCIWXBjFcidzIn80hd7rejV4fIY53e/27r5w5aKjdB0JzViiY3awqzgpT/qRVxf3ddmuohk6fywi0joJ2uT9a/MSj4zsXTlItstloqlBMV/7aiNMDMYTe7HT6AWpLzFeRe10sOzGXDzzjAJalrFxbHXCUXkYgxsZr754H0KiR+DDp/iRgS1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R61OJ+wUB/DWjcGkauNNj1zbKFx79wmdZx6nfHnWZ2k=;
 b=XS8r6ZDSpky5wB/25mXPJ6Z6iDTptj8ZkzKU1sOLOMzhf0dRKe9XrqfYjF7fG6Sogv/GzGSSaCpQHy8rGz4Lq8/7YSXP4lI66Oom9nfwmPxvv+neckNzhM6vAp8cVVfTWx/t5/7f02dE+VIUdn0475MbL3MNJyxTpHPw67rr2M7HZuT43Hsu1nrN4sl292odbu76zW6ho0OZdj3l4WW9iru5uymYWBEeHK+sPghtIVD+ckGATMiGUlFMfivnKVfh5jOepr81e8GgMlA/wy7aH7cwIt4X7ziw2nMhm1NeYH4MqRuJsorrcfO7m+3XLNxis5MPHbkqYJA9ufze0Uwk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 19:37:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 19:37:35 +0000
Date: Thu, 16 Apr 2026 12:37:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Message-ID: <20260416193733.GG755471@mdroper-desk1.amr.corp.intel.com>
References: <20260416-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v2-1-9adb9fd3b621@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260416-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v2-1-9adb9fd3b621@intel.com>
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: afa62662-45f6-45c1-77c6-08de9bef9c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ge1mG04CG2eEbnVvz6AUoJKvihQhSS3D/nzzR5wrrPgOcEBRnZN7d11R7Kg5PtMO0vieS5IUylmJQHL6Dop80O1d+mKEOQ4b+LIRMU4/j57V++ci1ZLvqxau0EmpAVZccmLHmWmSzxO/3xKv83AHtbxv4Vg0atO0nbdZf6QANnzBBDIxauJySrlGT1HNTq3JdCgMZ948iEu0soZ+t+cj5QF+go3XFOVoh0OUTmDI1WWV/GcXoOtKH0xhP14hrGr4l6QrL/2p3Fan+7IYlIaOdJ2ldhU3iOA/kBp2lQDeGj9anPeOdC9myxGQu42CWjv82vKjqyTeoUf/mutnPpVGfgmMEeIqr2yjzxbhJHjNMoNszhfSEv/ydPn8EaMC2vUelo4fwuWIIjA98raqYxzCHpga+O2CRnAOS7XCPyFWY0bh746ppxOKwQUtaXCqzW3mm3a0GeqHWCVosDMAKGQdj5X2pC9FI3Aqopn675odZHc50k50hVGvS0Di7/2wEHnvXVTPgoKMojH0wBHijTxARzgwchpgI6W4vEjVnWLxP6KQLJL8GrTvFJuuy36cHDPIV0eWBNZXZgKmdPZsZqetSxkpOjZCO0jHhs4U9/txZJhqOfBp5QUxqp3qW89xXbJojyaLlsBncUruvaT16RHTJS5DnH3RhS9BJ8wSSQq6EHhjN60x+uQ2dOlgzK9jMpnM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/rRpiX/XvmHt+XLdQf5SaP44DU7uLPGxLhpM1jvAvQBfKyy042jC42GbMcx+?=
 =?us-ascii?Q?hkkM00S8AF+PD7q5aKavAeixH9pfkxmCg2csaieGOx4V0rxCsGU/Db9qayMp?=
 =?us-ascii?Q?B8DejyFmgMT0W0qAcg3D9W4WYNkj66QwvKOYhqyOz4Bs0/rTQ4v2zrLL5SM2?=
 =?us-ascii?Q?jWRtGhsaWdwZeMP2ms7Nj47zn89nxuisqWdxQxDtEGjWFucCOV1ONIYhR8Nj?=
 =?us-ascii?Q?wNX/7wtNmT2AlBSPCR8qQCVXQc0qqrAwL5He22hNIjHOUNCFnhO5NFbXvjYz?=
 =?us-ascii?Q?vTJvzZYI4gvqkJw8gxNIUQFdDB7qxYl6PK3f9ePFftXcd6V/bx45/n9+Fsyb?=
 =?us-ascii?Q?ypKODNIIWOOf+tMiFQM2fm7HdZuANbCY0IkeNm2WMPO9u3i9yTfd6Ii1spjB?=
 =?us-ascii?Q?egxcfThHBpjQeuoYEXG0HO/hoIL0jRBp9o1zjuiPH76rM2AukSyoErId+FQs?=
 =?us-ascii?Q?tP4dX1vWnQSKxdMcIq4rU7Hwn9TG5ThQwE0E935JLyrHf/OvrS29rKL+z6+g?=
 =?us-ascii?Q?oG4f1GOrm5DEbWQlrdpJqHs10e5RUJh9EnamkiGdiueIZWYhDI0JiR3DIP+9?=
 =?us-ascii?Q?dIKxEg57n95zr5rffizckUsLovjHDDQJbtosq5Nnja81JjApQJ1wh3RAJqq1?=
 =?us-ascii?Q?kNOV2+LLelUThhFAsE+fwkjcElAqT/3JDE2yMupEfOUEzY//4c0gFOW2JzLj?=
 =?us-ascii?Q?U5pqnn1DHuTIVm9aBdGIiMEdGNfo13rWAE3yf4F9NqYwLtVxG6lQhQr5H7Qw?=
 =?us-ascii?Q?LzTLt0fPm4L7ZMDoT6CIcmZv/2o9Xt/IqzSvLM8h/niyYgIbLDcRK7bLObeX?=
 =?us-ascii?Q?gSwuVQLGKjQ1fvAwWRYLNR724NmRpmbONdKwqS/WGL2ofcZ1nlr+L9itY5pV?=
 =?us-ascii?Q?8a+cnwAegDUEiFj07Ynt1wJIvxcFvNubj0UDd7Da4FWVViRt1QrjNIwtVJcl?=
 =?us-ascii?Q?QDmkWKrrg/Zgt3wGWE5XQPGgBkRk8Yy+qskjY7kiy5p+8/WJb1z11HM98tJv?=
 =?us-ascii?Q?U2ghwgwm7ELb8dXTXpRR2PnDJcC1Fz59DCEdi2X4ao6cun9UbJOVVYikoNUM?=
 =?us-ascii?Q?0qLpjT02qU9zWIZNQ9NtUpmj3nQX8CKy0/TCszwV7uV/sCXROIZY4lgD+vEM?=
 =?us-ascii?Q?1FSBGdmJX5l+W8X8kZ7gV4/qvSfi9p8rEAIQsnAvLV/suG05DC6C0FFKTpbd?=
 =?us-ascii?Q?jBwTAPdLDdP+q452Q8QirPaBRPWhUTRK3/++ROagAyT6iJDnfGTWapn0AxJj?=
 =?us-ascii?Q?ey0+3CLsbvaaErQywYEKUVIfHi0EuPclk0T+yZIqdJJEi77Me4K3baSwuAKY?=
 =?us-ascii?Q?icbIWhRdW1pF8m6SFHzOYyzdP/Z3pYH+Z+0PUbFt09TuhEj5/t4gjmYMgiW/?=
 =?us-ascii?Q?8Nk0c2CY04+og2ShS4ZGuQFMmP1uq/SWaoHkmteiKxh1nvFyBH72LRh/xkLQ?=
 =?us-ascii?Q?02OLHj78nJUOLxHrLlMCdpPajX1dK6xL4/pgLEzYGzxLukDxXBvHkAiu8lm4?=
 =?us-ascii?Q?oairQx1B4NdSZVeLAb39IxQka/V42rn7VK0d8xdocbvSOZmjcGhbhJRupR8g?=
 =?us-ascii?Q?f96k3tnlTj01FG9pXhHmlcgT4sf+Aco7330zXdwEJ24Fa6gOZPGH970Xu4f2?=
 =?us-ascii?Q?qPUUx+idkvuhbO9MpQCpRVihuWZkgs10BPAt9L93euXpZm2ymPQwjp5s2nR+?=
 =?us-ascii?Q?gKfR/D/S3vAxXU3/dRSjPyPBCjk7yt+BAwQZ3KFd9rOs8pXw+uKBOPJpEhQ/?=
 =?us-ascii?Q?mME15IBKvR9O5FqG8mBKqQ9EHKRC36o=3D?=
X-Exchange-RoutingPolicyChecked: LZuq3tugIvPXKZp78zbularbyu6TxGUG8iG2l/GH7/U17hFqBToz9YqCyrcOnYrFH6ICAoJqovA1Bmis2mxCbj0/YJRHFFiIdEo5fSClcopTnf7N6dyWfLCZCP0scqAAfa4b53LK0I/SApUdWKG+hEfXGlI1+Ufmy9vu2PRcYOiQxZvgzDXUsCg9lINvAMu4hndBrep1NGa+dz9RzTFsljmxPn14glg2JKmmgHy21vAllrddPQM2xiPxRZpblzyM5eu48ArAOlCtOOC17cbMZIW1iSbRKvQ43+zwG0GqFMiYZs8GIUy4ucy/y3nLkECKTAZwdCMXQ9dkTXvr/ALAlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: afa62662-45f6-45c1-77c6-08de9bef9c2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:37:35.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwdMH6Qe10WjFou/r9CALBrjTIg5iTVGqepv0IOC6BbnP0Wd88O4uCmEzOYeG0QVLilHk5Y5lWB4A4HKrFQ+OXmEItLGRgRWCFiRNkcxGgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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

On Thu, Apr 16, 2026 at 03:17:19PM -0300, Gustavo Sousa wrote:
> When media GT is disabled via configfs, there is no allocation for
> media_gt, which is kept as NULL.  In such scenario,
> intel_hdcp_gsc_check_status() results in a kernel pagefault error due to
> &gt->uc.gsc being evaluated as an invalid memory address.
> 
> Fix that by introducing a NULL check on media_gt and bailing out early
> if so.
> 
> While at it, also drop the NULL check for gsc, since it can't be NULL if
> media_gt is not NULL.
> 
> v2:
>   - Get address for gsc only after checking that gt is not NULL.
>     (Shuicheng)
>   - Drop the NULL check for gsc. (Shuicheng)
> 
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

We should probably also have

Fixes: 4af50beb4e0f ("drm/xe: Use gsc_proxy_init_done to check proxy status")
Cc: <stable@vger.kernel.org> # v6.10+

too?  Or I guess we could make the argument that there don't seem to be
any real devices without the media GT, so it only became possible to
trigger this once we added configfs support for manually disabling GTs?
In that case,

Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types")
Cc: <stable@vger.kernel.org> # v6.19+

minimizes the number of kernel versions this would be backported to.


Anyway, the change itself is

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://patch.msgid.link/20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 29c72aa4b0d2..33494b86205d 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -37,9 +37,17 @@ static bool intel_hdcp_gsc_check_status(struct drm_device *drm)
>  	struct xe_device *xe = to_xe_device(drm);
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
>  	struct xe_gt *gt = tile->media_gt;
> -	struct xe_gsc *gsc = &gt->uc.gsc;
> +	struct xe_gsc *gsc;
> +
> +	if (!gt) {
> +		drm_dbg_kms(&xe->drm,
> +			    "not checking GSC status for HDCP2.x: media GT not present or disabled\n");
> +		return false;
> +	}
> +
> +	gsc = &gt->uc.gsc;
>  
> -	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
> +	if (!xe_uc_fw_is_available(&gsc->fw)) {
>  		drm_dbg_kms(&xe->drm,
>  			    "GSC Components not ready for HDCP2.x\n");
>  		return false;
> 
> ---
> base-commit: 9ac7dca8d82a4e6d9806ac6c991f0777338833bb
> change-id: 20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-071898b8a402
> 
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
