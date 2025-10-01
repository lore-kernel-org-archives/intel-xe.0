Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBD7CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 07:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A34A10E690;
	Wed,  1 Oct 2025 07:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E85kpoAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7F510E690
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759303986; x=1790839986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R7W3f4wSA4c6zGaCl0RigHxxFnbWI63iSfnpDVulr2U=;
 b=E85kpoAxy1UEiYUi3rrrFGzLpZn2eo3n69gErQradJamWFaKbDhm/le7
 Il1d6NfACryO1uj1e/8egzQFhc/1WOQpkYl8D1wUZhp9R8k3owAJ/fkDr
 2VPuFB1uo7l6vbhXYrPPOyWu7PgJxBFf4H0B4noPkTQzOvDi4SpfMOIwT
 6ZxcS1fxCWe+UhOBFSFrwe/x2pm+8/sXIi+I4rl+zYEuM5BE1t6vi5yGv
 pBSEcuVRwGhpm6voEfR0dQWnYQg/nVN1b+ZazgI1JY4E0GqAX19PxsUKF
 7T5MlsvWEnCi9KtL/uXqJlKlL0cMFeGKM0TnLNGV5vRR8H366uCjRcKDP Q==;
X-CSE-ConnectionGUID: +9HlTFv2SkW0cHEK2x5hag==
X-CSE-MsgGUID: IVU+XVHcRiONo8GYrwBxew==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61279686"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61279686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:33:05 -0700
X-CSE-ConnectionGUID: Z4coDetrS0G0Fromd9pPSw==
X-CSE-MsgGUID: b8MEDi53TLSUzow4WMqytg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="177849535"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:33:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 00:33:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 00:33:04 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 00:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvAuNtrKKYUQrQ0YQOnM9AzlFuzmACVAU8OxZ5tmV9YZAhs+EqRRY6Oe9d8z8O1d9Qk4wImhdWbcE+vHsTjr75AGfXHFY/LzwfAJ7s4JfogL36DOnlYY5pozSUaiauDhNOsqOb99Zg791MdpC2uLXopM4Eexxut5OLRtEI3nDbvI3NCxvZ169oe5P0Z7amAjkhKdz5ghuviZzInj+3G1fC19kD0YcgNWu8VlGmM+EVINch7hR2IaFAzcLHirNU5rS3EPFfHEfW26rdNmg3Yt1bYa3ae5+m2RWNiiNPXR1WAW/nAYUUlu7pgl1GlnDXsWmHdT8v19zB/bybj8/WLn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVDgM40ymE4248Zq/0CYqZIUcEledaLCZP5VmDI6MI8=;
 b=wKBaebkZOt1LmGgNORHs2l/nWA5JHDKomtn/xkFt1SaA32EeWxg0R4RgDlPub7L88Iq0i1G2xJs1xSccz0NAoQkA0Ozt5O5tyCzI/NlFZ4oP3CNh4pgB+GrNEwsLdr8+ZnOD/ZiDb3cESbo/7VssMMN0086E9Sq76+xHGX2l4jXSnlBIsohRNjL233XrI3FjB13QXzxWMKegoqdkhf5o5gm7J8UctlKpHYBsVAdIsg4a/niKbHMe/MOSQmbzXepFRC/h7Xmcf33OceVxhPKzk4KkgqgfL+yCMYkYrKkelRvXBuDEx6dPBFzK+dGuuOba9x+6fhLhXzDz/yqIHyxZmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 07:32:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 07:32:56 +0000
Date: Wed, 1 Oct 2025 00:32:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/xe/pf: Synchronize VF FLR between all GTs
Message-ID: <aNzZJofhvZEdNnjn@lstrano-desk.jf.intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250930233525.201263-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW3PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:303:2a::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: bf66fcac-568f-4ef4-f436-08de00bcbd80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JFPQ4kQKERcKXQBYPSWaPr/vLqd3Yq9yLVGNrK/D9cWWRF3CEFAQT3fHQ4ch?=
 =?us-ascii?Q?A9VaZBJayNIg85D9sN47yJjhtkLOVoBwY8JGwIieqOLjLrDnI3KT7r4Puqlp?=
 =?us-ascii?Q?APH7lPLPm2S1A7rtBuf3vk8Lk/vAFbby8z5VCMbjeyb73wp3WRobOWc+mKeM?=
 =?us-ascii?Q?7NmmZcfKlnOMRrteix0xcGwS6k0brRd5yTObhERwfrAGD8Tg3JacfwPFg2x9?=
 =?us-ascii?Q?vs1Ue2zIaaTzvRUKHgz6fwSunw0vTHHjvlEw8luqcOAgUqT/mPQjjOGhi6/3?=
 =?us-ascii?Q?tU+I82w2nIEZp/2yxV4T+TJLSJ9DHNGOq1eGWmQqlUMG9MW1xJHJg7htFOHi?=
 =?us-ascii?Q?/+1RxJbPhIHfBjV4GnHHwseOQ9JrtOUtOFPpQ47PApSRvwDOpzln4yEGp9iY?=
 =?us-ascii?Q?Di59tZvAM4MOElG/4XwSKyCtWE+8X8TovMfIweTLsr1NmzEtXHl6ubArKeph?=
 =?us-ascii?Q?iTJr9SVjmAvXOaxO6vrT884uhxjGFTSobmA+/ohF1Q2hknr8rZgFFWYTy9UA?=
 =?us-ascii?Q?tpY4dBxzNKcmLoncgWQnQ5tTkBlGKnKxAjs3elDe1Cm3fe7mhlH3KpQ/zvas?=
 =?us-ascii?Q?CAkh4gz262m7shiNfCZHEZ7p7yrMG12rSbiPNG724F6Mggg/K/Yrq4Nrokrb?=
 =?us-ascii?Q?Mue0gnXLM6fLiQJWbWp/O4a1b4fRzK3L/FuON9GGjcKVCpGBwJuKZA0LSH5C?=
 =?us-ascii?Q?3eg65VX92JD8LdkBubmuG8k+5HuhyY112QFncoceeHql3gaa+zAJay7Vlmtj?=
 =?us-ascii?Q?QiN8yCu5oDg0Zh6661sO46vk3EDA6UM5I7hXWCPqq4MnQZk/Pv7laADkQLQa?=
 =?us-ascii?Q?TaH2I/0wK2ttUqmv9OaH8YjeFr2YF/w5UT97W3C0w9agW7xIdbDPo4Xzg2O4?=
 =?us-ascii?Q?Ddm4qmiEmRdY+nMfWAZcOooEh7fMjTHoURFyTVTfdbThCrQX4l0N9tIcMQjq?=
 =?us-ascii?Q?PnO9slz5YB7L4iUGBvsI5TazKEDEkoV15xU0pYAf4ath7mU/jMnTYK2h+V4O?=
 =?us-ascii?Q?LWMtX8/WtU4gs7PcX0nJqn+tTyx74hSitjOHReEL5ke2GYfBEfhZAOsCgNMU?=
 =?us-ascii?Q?G4pu6k0QGchg3kIFxplF9IUcSxr+dLhuU+No0PyFwqTClQOgvFEbF5Xi3+iz?=
 =?us-ascii?Q?X8mQVQkacNRGO5l5n2fO1P6vaBjQHjWRLnEc8+ER09C9n3pzgLDYQeIt+p+7?=
 =?us-ascii?Q?3yMTPJwxqviFy8X2winoGLCdthFdcJ+zIgMn5tKP8KZw9TAGmWPvd7GUJqes?=
 =?us-ascii?Q?YMjNUr37IwkItF72iQuUMTS/vRrVpZrH/vkOi8BRFuNRc6r+KzsJ9t/quUxj?=
 =?us-ascii?Q?L5sKLbMVoCQx4Tmd4Lch9kqWOg13ntQj7lAbzFouDTaJqeyAIAR3x1TuR62T?=
 =?us-ascii?Q?ZrPKgFZM2eNI/JuloPf8fw+xwp5TELfBNUKz42AcfPH7HmfgjEVcFTTz9E/S?=
 =?us-ascii?Q?e1Ngl4h4Nk5gED5nmL9+wAiQvCKfe9q+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LueKAH0Ioyzd+MaMXbDYY3voRuqiHIIOpNKTtBi+6CCpb8EZiLyh9qTNWmNe?=
 =?us-ascii?Q?bwIz0/vddNrBtCJXi+jHTNS4Q6q64kcUSagDMhcLH1MLchKi6DbcY51DhOsL?=
 =?us-ascii?Q?pqRQXElsWUHE3TbLiVVtsUX6P2VY/PDMcPwUAvJ6iK9ihcWDZOHZEslivgTH?=
 =?us-ascii?Q?n8o6IcXW2ihvyJx+t4Pc6exHCXKC8V7juMXEnHAzHL1KF/rZBemt2g1R7B4V?=
 =?us-ascii?Q?ZWhzsvRYNwssISwYPCQrbKWXdn2FjwT0pXzW3srgoQEKx+fZgR651IbDHMyC?=
 =?us-ascii?Q?kBELXUqAQCRk6vdjLRxTHR0226wPyJ8EjvXov+aye67F13fOdxB8e+tijt6h?=
 =?us-ascii?Q?zKP6OaHIcLs7rwaAr1xeYYPsNj/lePENEIOdQx6rhNKBAL0uypIFzcy1+Qo+?=
 =?us-ascii?Q?BHlSGZ4FflPjCZIwp05XKHIuI7OjovyvLn1LbAqssMN+uAvYLVbAzxw75bGf?=
 =?us-ascii?Q?4qTbG3wXTX+FGaWQQ+N36jDpsPA1oPayOy3Rmqya08lmbGsfysRnHJa5ZBhJ?=
 =?us-ascii?Q?nHLh/pGrA0zxlURE1xIODXTihC3v5yEehhbL0ZSYH8G7i4dPZNejT+lxnKeO?=
 =?us-ascii?Q?6xGO1DKtCPZK1cHYMqht49aE4arEm+vwLA1skzxcupGwckLXv15FbrqFD8Yf?=
 =?us-ascii?Q?iF2A8NbAF7fDvbrjhL1Na+9ffq3IeI5whpqidiXgtdjERi73rON0F0KW1G3Q?=
 =?us-ascii?Q?M7TAUryPXu5+RgI8O9vd+pmrDBlA0Q+Di6HNzP8KAxXq4pA7hv2cb1/Jby9+?=
 =?us-ascii?Q?Y53eHC9A6ilVdg7yZYqFh+0uyMqgPg6Pas5NKpwyrCasxHqocWXWG81R/0aT?=
 =?us-ascii?Q?gyTiDH+ITJDoejhm/1odqwJZ3CdmN95XCf1h1DbhIeayBnbRY5WRO6I2l/Ws?=
 =?us-ascii?Q?T2sGkuojA3YMrIV3RPLQW7sVq2NKxJ+38VN2rtKdG7fnc/Mcwxb1GUokUR12?=
 =?us-ascii?Q?6lly1tzw17zofjaQ6onF0jGfVWToIjEVo4INbYoNyhcciBvVH182PtRJUElM?=
 =?us-ascii?Q?6Yd5d/srrwDB9YBf6JGYbiqheE92WHrrkT06+fqGJVA5fNgsXXSoS+jGCVTd?=
 =?us-ascii?Q?uwtPfdrz62MQIwSHnVm+m1xmfzfLhs5o8teGOnO64QwtXjw1E1YuKzl8WOhe?=
 =?us-ascii?Q?dhsMS6VA88T+hdTR9QyVwRdzGIByLGQuQ09Wyj/z0FcwJ6xHoY0fJbz3MQN0?=
 =?us-ascii?Q?PIioApriclzjPdhydF9RLU1PMvAGm/OLVIHUInMAImESuOqorLuBdHU4zdcr?=
 =?us-ascii?Q?AuV89OXJ1Gz1foMdpDrpMMcZTL/oHbG0rslYKEqQ8r3wM2ym/ECEAtkEzv9G?=
 =?us-ascii?Q?8nNN7WN0HAnj8iNEyplQV6bBPpKPsHBovsxNparLkruIcfEchQmw+cb1+ig2?=
 =?us-ascii?Q?RQN6DYdn0BMmmWrsX/BBb+AhCLtayL/vvEO+WMUrAfQa+SY4ENhGxj03uHYs?=
 =?us-ascii?Q?B3oeLBSW6J+LLSHHVxkm4fYu7Vx4DEaKkPNE7yburbB18otE6WD+PiYBJyTb?=
 =?us-ascii?Q?PuyPkEL6LCTbmIZitMQLna0OSu5G4vDx5k7dgDddU3Tb6L6pEV0f1rWr11nJ?=
 =?us-ascii?Q?gAumog30utH3tJHbxXPdCtpC4RgJczrcIBOl5QiI88tthkXJAs817oK6QWvH?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf66fcac-568f-4ef4-f436-08de00bcbd80
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 07:32:56.7636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PtQMUgTxLUizQ1JIMc3FEMN/gh4rZVbG8PqSvNCHyPTMz3+rlqLBdHKJU7UgmiOY2BT//meVW++C7L29dotNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Wed, Oct 01, 2025 at 01:35:24AM +0200, Michal Wajdeczko wrote:
> The PF part of the VF FLR processing shall be done after all GuCs
> confirm that they finished their part VF FLR processing, otherwise
> PF may start clearing VF's GGTT that other GuC may still accessing.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 56 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |  1 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 29 ++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.h      |  1 +
>  5 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 491918d6b93b..2e6bd3d1fe1d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_tile.h"
>  
> @@ -170,6 +171,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(FLR_SEND_START);
>  	CASE2STR(FLR_WAIT_GUC);
>  	CASE2STR(FLR_GUC_DONE);
> +	CASE2STR(FLR_SYNC);
>  	CASE2STR(FLR_RESET_CONFIG);
>  	CASE2STR(FLR_RESET_DATA);
>  	CASE2STR(FLR_RESET_MMIO);
> @@ -940,6 +942,10 @@ int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
>   *	:        v                                      :        |           |
>   *	:       FLR_GUC_DONE                            :        |           |
>   *	:        |                                      :        |           |
> + *	:        | o--<--sync                           :        |           |
> + *	:        |/        /                            :        |           |
> + *	:       FLR_SYNC--o                             :        |           |
> + *	:        |                                      :        |           |
>   *	:       FLR_RESET_CONFIG---failed--->-----------o--------+-----------o
>   *	:        |                                      :        |           |
>   *	:       FLR_RESET_DATA                          :        |           |
> @@ -1147,12 +1153,38 @@ static bool pf_exit_vf_flr_send_start(struct xe_gt *gt, unsigned int vfid)
>  	return true;
>  }
>  
> +static bool pf_exit_vf_flr_sync(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
> +		return false;
> +
> +	pf_enter_vf_flr_reset_config(gt, vfid);
> +	return true;
> +}
> +
> +static void pf_enter_vf_flr_sync(struct xe_gt *gt, unsigned int vfid)
> +{
> +	int ret;
> +
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	ret = xe_sriov_pf_control_sync_flr(gt_to_xe(gt), vfid);
> +	if (ret < 0) {
> +		xe_gt_sriov_dbg_verbose(gt, "FLR checkpoint %pe\n", ERR_PTR(ret));
> +		pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC);
> +	} else {
> +		xe_gt_sriov_dbg_verbose(gt, "FLR checkpoint pass\n");
> +		pf_expect_vf_not_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC);
> +	}
> +}
> +
>  static bool pf_exit_vf_flr_guc_done(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_GUC_DONE))
>  		return false;
>  
> -	pf_enter_vf_flr_reset_config(gt, vfid);
> +	pf_enter_vf_flr_sync(gt, vfid);
>  	return true;
>  }
>  
> @@ -1178,6 +1210,28 @@ int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_sync_flr() - Synchronize on the VF FLR checkpoint.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @sync: if true it will allow to exit the checkpoint
> + *
> + * Return: non-zero if FLR checkpoint has been reached, zero if the is no FLR
> + *         in progress, or a negative error code on the FLR busy or failed.
> + */
> +int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync)
> +{
> +	if (sync && pf_exit_vf_flr_sync(gt, vfid))
> +		return 1;
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_SYNC))
> +		return 1;

This looks a funny the return 1 / 0 / -errno pattern. The caller of this
function only checks for -errno.

Matt

> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_WIP))
> +		return -EBUSY;
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_FAILED))
> +		return -EIO;
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_wait_flr() - Wait for a VF FLR to complete.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index fd256866f628..8a72ef3778d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -18,6 +18,7 @@ int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_sync_flr(struct xe_gt *gt, unsigned int vfid, bool sync);
>  int xe_gt_sriov_pf_control_wait_flr(struct xe_gt *gt, unsigned int vfid);
>  
>  #ifdef CONFIG_PCI_IOV
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index f02f941b4ad2..c80b7e77f1ad 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -18,6 +18,7 @@
>   * @XE_GT_SRIOV_STATE_FLR_SEND_START: indicates that the PF wants to send a FLR START command.
>   * @XE_GT_SRIOV_STATE_FLR_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
>   * @XE_GT_SRIOV_STATE_FLR_GUC_DONE: indicates that the PF has received a response from the GuC.
> + * @XE_GT_SRIOV_STATE_FLR_SYNC: indicates that the PF awaits to synchronize with other GuCs.
>   * @XE_GT_SRIOV_STATE_FLR_RESET_CONFIG: indicates that the PF needs to clear VF's resources.
>   * @XE_GT_SRIOV_STATE_FLR_RESET_DATA: indicates that the PF needs to clear VF's data.
>   * @XE_GT_SRIOV_STATE_FLR_RESET_MMIO: indicates that the PF needs to reset VF's registers.
> @@ -47,6 +48,7 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_FLR_SEND_START,
>  	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
>  	XE_GT_SRIOV_STATE_FLR_GUC_DONE,
> +	XE_GT_SRIOV_STATE_FLR_SYNC,
>  	XE_GT_SRIOV_STATE_FLR_RESET_CONFIG,
>  	XE_GT_SRIOV_STATE_FLR_RESET_DATA,
>  	XE_GT_SRIOV_STATE_FLR_RESET_MMIO,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index e1c54a8feb07..416d00a03fbb 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -120,3 +120,32 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
>  
>  	return result;
>  }
> +
> +/**
> + * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int ret;
> +
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_sync_flr(gt, vfid, false);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	for_each_gt(gt, xe, id) {
> +		ret = xe_gt_sriov_pf_control_sync_flr(gt, vfid, true);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> index 9bf059f746d4..2d52d0ac1b28 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
> @@ -12,5 +12,6 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
>  int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
> +int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> -- 
> 2.47.1
> 
