Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2CFCD98E1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 22:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC07610E0B7;
	Tue, 16 Jun 2026 22:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0hO0JXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135AF10E0B7
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 22:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781649225; x=1813185225;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kcw+p9/fT3Ezds+d4tWhIHfQn7VMKDUNNHjp6AjW3lI=;
 b=Y0hO0JXYZQCnnRUwnilhO95vm/xob1Wcad4XIIr3xlcSsHE92lNBTOZt
 v1mYYHyu3EyDOvnY/x6K5lUine58epPBovbDG5QFHNzIOUqbHnYqZWXYo
 mrxPM9coDc8kOFt+hRjVWrCLcObj9l2TV77kJZl1Y9VR45V730zjafKEM
 nYLvKEJN9FSlj7wMaPMEGoz+GVYjjFWthkpU7bXdW/17pB32/CS2NqyCz
 bzOQjWvbHSaWiYe77CK4zQQN7xJTYQwTE/aZN8N9Rpj3Phgr+NidNdQMo
 cz2Yi9uxY8yz0kWsAEUkMKlhGS8t2uvST/+IykKsnxoHYNNXhMuidVO0I w==;
X-CSE-ConnectionGUID: P+7Tm4BJRLK5Y6EPFfFmxg==
X-CSE-MsgGUID: v85Y0GqkRFmsVRTD1x9E8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93102106"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93102106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:33:44 -0700
X-CSE-ConnectionGUID: M2rg5993TZ+NUKfB9ItDBQ==
X-CSE-MsgGUID: 5VfVAgSkSEKmNd/qR7SGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="286009115"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 15:33:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:33:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 15:33:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 15:33:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLMVdFK+KL0ByTTuC5zMYLC+2e+jMcu3okcvPWV9THBUYgxIBhev8wx0HtDiYaB1Z6Qyf6YG0BhZibYu1TDAgiWnGA8+2FJeuGbhvCxfGzSUie0tFHvIt0JvYWquE8LtZdfz/4q5nblDT4sNW9LzuRQa+2BcBqZeD6hd8ZmGacV36A0B9clMiDLdJgmS70P3Ps5xz49WR7P/Z3DA1Df4OymXnrYUCP21yCy9nH7AqDt8Q7yS4XyLGLaYsDGJBY8Eii2WBaEaJMMY+9bruO7d03sVZqQ58iVFa69PoRVCVDLpBko0WPwx/qtN5mfPir5ecukBhaQ0qLMmSYzRVguiyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ih6toC80oquPbgFUKGPAC3FYdRQYErlMKEqrYdHIg4c=;
 b=UlWDmSyU2M8rO7kYwBdVkwTL4zG2aXtyNv3jLOb3yHRI1RKSo0w+0w1Yx8qwuzdpR6oE4uDbOA+emq8XCets7YHz7+zbYNUZwzGnzZuIKwZQjYw1qBVx5oCAE36feP9IEKOYEBgYd1Dfh3bYPuj6aobzZ6u9x4lVSD+nhzvd15sVOQjfFvH+8fSTRZvzEiYLoYtPKWjN0m0iiTqe7jx+utvtHyLfZ4bL5Ho0S2wDRwicgPC2nh0kjL40YyCZ7SDWMtm/IdLFsiOpzRqIVtIvbKmix1dOC4LG5SPrDwzyuxM8KdQnmyy+U7WHoXlHkRJpqGqgzL90+7kt/+BYi2+QQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7960.namprd11.prod.outlook.com (2603:10b6:8:fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 22:33:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 22:33:34 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Move engines' non-LRC programming RTP table
 off the stack
In-Reply-To: <20260616-rtp_with_dynamic_vals-v1-4-f2b47bea9dd3@intel.com>
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
 <20260616-rtp_with_dynamic_vals-v1-4-f2b47bea9dd3@intel.com>
Date: Tue, 16 Jun 2026 19:33:29 -0300
Message-ID: <87tsr2t8sm.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 09299272-e871-48a4-2225-08decbf74cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|56012099006|4143699003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: lY24VXl2FauJCZmER+TaS+uXfZZpxP0DG22G0DMuhTF3L2uzkCG8Fvj22pPRG27GaQ/3P+cvvx0dh3SIz4f83n3TmV4hbUacq/c/zFb0tfbZU5wTDHfYbTBPyblsb5PeRTlbOzNkO7nvPiHrHpDJUFVDl2Bq66GGpphrhaFsW49Ns+cYdHinzAhR8k0gV2K5I7UQ3+C91Vqj2owHjL8sLUiwlRTGuAZreMFPevQ5YQ77wPf/Ffb3eLyjOSWEC0YtjpiMRtAvR7cOW6+MJuaEzglP+YILR6RXY6YD12r/InwSjD/EBwf7D2QdMsz/ZqXf+MGr9Wa8PRvPNodZQowxL5TIWaqshG3vJsEij4IWjMtUFOJR7ykMozz4kMEbZxAwCMSyhzqJm3yY8dVqSP9qedDDNPayEOgKuL3DxL5e3QDGEkH1YkvftncI/35Rd51dJizE+C1EsS6dMU/kmLNfnfq8C8/yWbn4JRvysNKmYmvyfqmgaJMk8RYQaFqLqDDQrJ82BjcpsXeGMTIBECCJGtol8ts84Qz/aZo1DrhgRfBFL7elwa/SswlUUpxHylrV81WH3GyokaPmkkYnMyQmLFCq9IcZekVZiMX6HABbFo+0jB42So23GFODYUXzMFcqHMbmF3Y8452YC6ItB/odQ5zK59hcTiwFqGxzAGBzGEvtY+sZMhG1wa8HnQOHw8aX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(3023799007)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?86M/xlxc+ZZlzB19iL19+vs87/Jw716RB0d8lh/bjHe84MrApAxg3kelF5gf?=
 =?us-ascii?Q?0WZ+n/0sx+E2C+jducRaNcRKcQiEmUjIyxqa8cxZp7wsSjOUY5dnoBwFyYQn?=
 =?us-ascii?Q?pXdpA1+cvd15rQKMBhQbQwKYdwgw4jG5uelUBe92nqJZRpOFnwiQImEJGVGw?=
 =?us-ascii?Q?U+JsqHJ9xDolgX4E7FhOZSEuzjqn5KEgBJ/4KkZRic9SV89+AIICsMSuQ+rl?=
 =?us-ascii?Q?xQFdGFHfUtAZNNnCSgsc6T9s6umFXaKMmfzypMp6AljBh/tImEVa7jnvCvY4?=
 =?us-ascii?Q?JQtY76zOaqqgq5FW4wkSY8DhGDMFQepVxeNSB5klI86JT3nXf1K/x4woj0+2?=
 =?us-ascii?Q?FHXx1cB58LC22oUK4f2LjPWwYfFJjzkoOoFr8fvhkkWImV8Y38rn3X9X8tMS?=
 =?us-ascii?Q?ry4BSzOtX747lSpkimV1wNogDz9ciOL0urKl8uGzIpE3esWmpsbx68d4BlER?=
 =?us-ascii?Q?4ALQwbSWCn0raH2I40CBim5/Omdag6udCY6Wul8bsz24kiSqQt48weoMLNDF?=
 =?us-ascii?Q?INYpvSR0rJb6Z75GDtfBVakv6LjmtTiZxoT5+OUx/RennZVrdBwA7I5wUuSu?=
 =?us-ascii?Q?FajIT4USRiSsbCTo34lNmYdEOpMCCE4CmFcPgcrR5imtSJ81327N599bSUTB?=
 =?us-ascii?Q?yjjAtbYLu5UoTNauk42zmb4pRcPiq/86GLy6dpWZvDgbgEROMXIIt3jvypY0?=
 =?us-ascii?Q?aqyCtb1Q3GUD1vMmoBkpkkKB6qUDqeD0TeT4zrlKCAescVfO6Iqcq3IdWkjU?=
 =?us-ascii?Q?XsuUq4Wgz2h6dx/C0KxPPdApJFeum1mH9W5qKtHKOcc2r1E/EGMqcoIxHZPs?=
 =?us-ascii?Q?sA3T2PowTTRxAaPDtRV6aQHVxBDe9sZ0MkHZAzEKhXpcrKJZLuoKxfGlmXxW?=
 =?us-ascii?Q?5sbUoXSMbhblDRdjAPTGv09v75eWkXVAayxWp4LJCitG8W9yf9f+LuV9uYYv?=
 =?us-ascii?Q?5y4kelxjaw1CAjpqpiR0nC7PLjd4mbbs416T2KwcvZ3Z7mCmJZl1u9cTLp52?=
 =?us-ascii?Q?WWXL/H1oceQKGhBxcXxkDKEhm+UkwIrldpRsLYtHRh3WcijONlqvRYlTFuew?=
 =?us-ascii?Q?1jENnWfMEllHVXHdTMYHcKv5rlKDMd9ulymXVf367d2G/5lqe+5R4/46RknD?=
 =?us-ascii?Q?lC6KDG6t/w65qLjkSeLjFqaxlFPSt1d4Cx2ooAKk7m+oC/JmQ1VGCjfEk4aG?=
 =?us-ascii?Q?cf304rnpwY3afRt3zCSElPdz8gikLYbLb8u8qXyCOX8OPFDSrURl5VYdu0Wj?=
 =?us-ascii?Q?+biGuQsdVuIuw88dFijXSZ8+vtMH0PQV7TjpZ2lmhfOkoi81ttTcO0WOULg3?=
 =?us-ascii?Q?VeCAKKuWpPo14PD1Dpur4atv1C9Aph8kEhnLEYJBxCb9DRQQKAFS02Ln3dba?=
 =?us-ascii?Q?rLNMiz6DP70jzaeTWDV1GCh3q/Bc6e90qw6lRRWg26dSGaxFcAs3wZye9lTM?=
 =?us-ascii?Q?y7/0t98QxorzopAKxy+zrf+xKQrz7kacOLMA5E2hMJUgmOWH2sOW6oqsKog+?=
 =?us-ascii?Q?lbX/i8ytSJ4tBlqCFB7erWO+iDvClPiYByzY8Id7Qr8O9cSVD1Cj0gUZLxOF?=
 =?us-ascii?Q?9MMhaofAttlGhUmvDoNwzeLBHvi/m8tmoco2arG0h0LiJ8T9A37m32VjV/07?=
 =?us-ascii?Q?2C8IZvJTGCmRoFG9nb+fwH7CQXTs48GpXIt4XWriwI24bSN9/+Z63QBCCS8Z?=
 =?us-ascii?Q?pzhxQTEkBF0ayGMzYihYS6SptZOHWBM7/ZIVzEs7a/eDds9Q/+TE7PsWUx9P?=
 =?us-ascii?Q?mvmpBQQ/KQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Un1+hAMRXLf9NmfthoMnep160Ndj1fuL/9+aMUi3q5rc2yVrpPEFbTdpqHsFUZp85GZbslvgY7+mSXdMJxuYrKhkVKIBEjRhK9FnCnU0SXnnnHrq0CmVmxTTpI0wcQX5Z17ZFzh4YrEv1M7fBavAvQB7dSb1lK1YYTCihZ87UjzygeH4kzQ1YibS6vfQzI8zcz48MkJjS458pCgdkAs2b20ptT+wRcHkEtgMVEC9KVni8BTS+zFXyX2DX6R8kMfo2U86uSRQHkxOTeJw7FcuQVXD8s6UD1rZO5TVMcSzuJHHUW5m8qx3R/t0FajSzjoPYu4kWH/uaJxGDojyb/SKOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 09299272-e871-48a4-2225-08decbf74cd2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 22:33:34.1330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpsF7CFqkj6sPh+m3RcbxxMq245nbTyNyAr5Ob9snSmAHOYXZUoiyeA1Nf+xE0kdgBCGAkUCca9iOhwadAJQUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7960
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

Matt Roper <matthew.d.roper@intel.com> writes:

> The 'engine_sr' RTP table was allocated on the stack because it wasn't
> truly constant and needed to calculate the proper value for
> RING_CMD_CCTL at runtime based on other stack variables.  Using the
> FIELD_SET_FUNC action allows us to make the table itself truly constant
> and move it off the stack; the RING_CMD_CCTL value is now calculated
> during RTP table processing.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 158 ++++++++++++++++++++------------------
>  1 file changed, 82 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0b688b851b71..987cd1a49f03 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -387,86 +387,92 @@ void xe_hw_engine_setup_reg_lrc(struct xe_hw_engine *hwe)
>  	xe_tuning_process_lrc(hwe);
>  }
>  
> +/*
> + * RING_CMD_CCTL specifies the default MOCS entry that will be
> + * used by the command streamer when executing commands that
> + * don't have a way to explicitly specify a MOCS setting.
> + * The default should usually reference whichever MOCS entry
> + * corresponds to uncached behavior, although use of a WB cached
> + * entry is recommended by the spec in certain circumstances on
> + * specific platforms.
> + * Bspec: 72161
> + */
> +static u32 ring_cmd_cctl_val(struct xe_gt *gt, struct xe_hw_engine *hwe)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u8 mocs_read_idx = gt->mocs.uc_index;
> +
> +	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && IS_DGFX(xe) &&
> +	    (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC))
> +		mocs_read_idx = gt->mocs.wb_index;
> +
> +	return REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, gt->mocs.uc_index) |
> +		REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
> +}
> +
> +const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(

With the addition of the "static" keyword for engine_sr,

  Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> +	{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
> +	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
> +	  XE_RTP_ACTIONS(FIELD_SET_FUNC(RING_CMD_CCTL(0),
> +					CMD_CCTL_WRITE_OVERRIDE_MASK |
> +					CMD_CCTL_READ_OVERRIDE_MASK,
> +					ring_cmd_cctl_val,
> +					XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +	{ XE_RTP_NAME("Disable HW status page updates for interrupts"),
> +	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
> +	  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +	{ XE_RTP_NAME("Disable engine 'legacy' mode"),
> +	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
> +	  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_DISABLE_LEGACY_MODE,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +	/*
> +	 * To allow the GSC engine to go idle on MTL we need to enable
> +	 * idle messaging and set the hysteresis value (we use 0xA=5us
> +	 * as recommended in spec). On platforms after MTL this is
> +	 * enabled by default.
> +	 */
> +	{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
> +	  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
> +	  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
> +			     IDLE_MSG_DISABLE,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
> +			 FIELD_SET(RING_PWRCTX_MAXCNT(0),
> +				   IDLE_WAIT_TIME,
> +				   0xA,
> +				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +	/* Enable Priority Mem Read */
> +	{ XE_RTP_NAME("Priority_Mem_Read"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +	{ XE_RTP_NAME("Enable CCS Engine(s)"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
> +	},
> +	/* Use Fixed slice CCS mode */
> +	{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> +	  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> +	  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
> +				   RCU_MODE_FIXED_SLICE_CCS_MODE))
> +	},
> +	{ XE_RTP_NAME("Enable MSI-X interrupt support"),
> +	  XE_RTP_RULES(FUNC(xe_rtp_match_has_msix)),
> +	  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_MSIX_INTERRUPT_ENABLE,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
> +);
> +
>  static void
>  hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  {
> -	struct xe_gt *gt = hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> -	/*
> -	 * RING_CMD_CCTL specifies the default MOCS entry that will be
> -	 * used by the command streamer when executing commands that
> -	 * don't have a way to explicitly specify a MOCS setting.
> -	 * The default should usually reference whichever MOCS entry
> -	 * corresponds to uncached behavior, although use of a WB cached
> -	 * entry is recommended by the spec in certain circumstances on
> -	 * specific platforms.
> -	 * Bspec: 72161
> -	 */
> -	const u8 mocs_write_idx = gt->mocs.uc_index;
> -	const u8 mocs_read_idx = hwe->class == XE_ENGINE_CLASS_COMPUTE && IS_DGFX(xe) &&
> -				 (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC) ?
> -				 gt->mocs.wb_index : gt->mocs.uc_index;
> -	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
> -				REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> -	const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(
> -		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
> -		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
> -		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
> -					   CMD_CCTL_WRITE_OVERRIDE_MASK |
> -					   CMD_CCTL_READ_OVERRIDE_MASK,
> -					   ring_cmd_cctl_val,
> -					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -		},
> -		{ XE_RTP_NAME("Disable HW status page updates for interrupts"),
> -		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
> -		  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
> -				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -		},
> -		{ XE_RTP_NAME("Disable engine 'legacy' mode"),
> -		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
> -		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_DISABLE_LEGACY_MODE,
> -				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -		},
> -		/*
> -		 * To allow the GSC engine to go idle on MTL we need to enable
> -		 * idle messaging and set the hysteresis value (we use 0xA=5us
> -		 * as recommended in spec). On platforms after MTL this is
> -		 * enabled by default.
> -		 */
> -		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
> -		  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
> -		  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
> -				     IDLE_MSG_DISABLE,
> -				     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
> -				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
> -					   IDLE_WAIT_TIME,
> -					   0xA,
> -					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -		},
> -		/* Enable Priority Mem Read */
> -		{ XE_RTP_NAME("Priority_Mem_Read"),
> -		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> -		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
> -				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -		},
> -		{ XE_RTP_NAME("Enable CCS Engine(s)"),
> -		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED),
> -			       FUNC(xe_rtp_match_first_render_or_compute)),
> -		  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
> -		},
> -		/* Use Fixed slice CCS mode */
> -		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> -		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> -		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
> -					   RCU_MODE_FIXED_SLICE_CCS_MODE))
> -		},
> -		{ XE_RTP_NAME("Enable MSI-X interrupt support"),
> -		  XE_RTP_RULES(FUNC(xe_rtp_match_has_msix)),
> -		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_MSIX_INTERRUPT_ENABLE,
> -				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -		},
> -	);
>  
>  	xe_rtp_process_to_sr(&ctx, &engine_sr, &hwe->reg_sr, false);
>  }
>
> -- 
> 2.54.0
