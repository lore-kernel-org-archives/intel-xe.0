Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA951C49EA1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 14:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833310E39C;
	Tue,  6 Aug 2024 14:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9sLrm/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACF110E39C
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722956164; x=1754492164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RsEnO7wbplPTiBJLgDszQnCvdPcfSZszxNlOLPqqRPA=;
 b=N9sLrm/A4MjB+y97VMwiirsOV2JX6O8mS06+G1ml+6oVSFq9UwMxCYz0
 2CNzcDklB1NiSRS/UUd4VAkDsOWGL7HPOQ4k9b4edVkRGC4ZXu7N5SgQd
 dgKRyaGWjnTxkO2/cfyIgqYZE4zONDhUIhCw2pAYnNQn+ol0gRkjHoufy
 Mf3uusDQH5wtJ/uIyNCzn7ivoih2TnJEPPvzbdWiL3s8mPjlzdXmel814
 WOcDKezzeH9aa7QQU0bHyh2Q/u/qg99AoBU3WxmYirtht5w5HuNJ7Liq5
 PoPNvukyOt6lE4udWdxN4HpbCtgghMKnvXMX+ZYfK1chwC1avfhY+QoSV g==;
X-CSE-ConnectionGUID: ByuIvS0FTPqJNvu8VxJGHw==
X-CSE-MsgGUID: s/OOFBRGRW+gMuMM5caXVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31552480"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31552480"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:56:03 -0700
X-CSE-ConnectionGUID: 9KaZgxauT5Kra8+3T332RA==
X-CSE-MsgGUID: SiOurzLERHSeA8XFvlcdUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56749666"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 07:56:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 07:56:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 07:56:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 07:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxjTF4jKdrA2tIm96XoG7DdYMqkGqWJtHq8ykStRQRN5LWHYrH1duQqCefWTtu8C54GV/qfksyO5qHc4hVo6SG+JqTuVQJtE+RCNtbacZoOd/X+DKuzPAY2SFeurjE/fPRCWswIkQG3T0rGksuWeWmf/tc12bolXFOnNnIP9PFzfuHb67nB25TXklOfJY1oyjuzcNAGCCDwP3nGXVDdy2BJqj/SzSxmYwCP6Of8DXr0gnzXDldhPY221z2c0+Nf85XDmxrVPQyaO6CKdxIJEdcD9GJvE3II7HYA6LunVL60jo1iFWNcJ6+/9tzcKq6t9FYb5V3vZlmpr1x2aU5CmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPW2KAanm2Lg0FB6IKntsgEkzr7FoZMTfqkq7vj5KF8=;
 b=fmatfXXA7WMgmLbYcBuVjF3E6/xn+atU4JXVn2GYUHZVc8yO/wo61bfW/TlNmh2bUSo0GuKquk6+krZAzkYP1paGIp6cMwnrbPYn20aWEhqg6zuF8Bg5yy9+8mkfzTYhcxVQrsBo8erWhUQYI7GOL1wYB4YvnAZegUZRn3F4Ub4LMehQXWWvWliJ/ENxIUJctaOk68JrjsqKy/aDxPaHKMQBN5HmoKeJzvfD6GioCoB3i2Quwg2NfUNXu0RnTvTqhjqUE4xcyaKsmzPs2QQuqphGzhaVjON0fWSbtf9clzYMAigh18zswe4xGHZAYF8sDshCWcAs6MjGAp7vmja9Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 14:55:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 14:55:59 +0000
Date: Tue, 6 Aug 2024 14:54:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH] drm/xe: Export xe_hw_engine's mmio accessors
Message-ID: <ZrI5NgWF6LeKx8Kq@DUT025-TGLU.fm.intel.com>
References: <20240731153422.401458-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240731153422.401458-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a165ebe-cdbd-4b53-a471-08dcb627e241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sq4fFX3Nt0S/22JIucidgSPDInK1HqhhlSImx/1krn0/PETfeuzSLqqyxrrT?=
 =?us-ascii?Q?mbAqF1m5gDe6vfPBMLLiSuLvOx5nGs4EUM1EAn4I7dFGTQi3ivS0eroz1h1z?=
 =?us-ascii?Q?bfsW7E2Ud7/42vzrzlOKi/m5ksG4gU7sO1HKOFx6QP/DU5/va+0sKyZmePbj?=
 =?us-ascii?Q?NNeYISbUeUhOnXWNiBu3S2vQJN1wK+bCK2lzwiqL26sY3j4eZwctGRO2hpgU?=
 =?us-ascii?Q?kn2+z5wwgTB3WAyZRWP9/Ws7EaoCujou7JrfJlnpcMIaShPF7xU2D4Hi1nJg?=
 =?us-ascii?Q?frjxLHR4KLAuL+kgrUu9lNYoAGbfuC7mOFXZckeZYJqd0dQKjNIAAl1GD0Do?=
 =?us-ascii?Q?qUAMQv4Fyk0kmxi+49NFhA5dLbleZZdUmJK4JeL7unyhilaI6ku863s4/cwS?=
 =?us-ascii?Q?MZrtXzxLJtQp1YU6J9rnx42i8KGsMGxIi1ByTugfN4BxwEttt9BfnUS+XSJx?=
 =?us-ascii?Q?4WvgOIHuzpgh67MXpjJU34aYZ4TpCoabBfFJiHWa7FJEo54dHAPrGBF2g8uO?=
 =?us-ascii?Q?Ol1kgpSF8+zgSqzapTwSxSbqMHrpAaw0VpLyMu3SnydIX2BVqvTtKT4godYI?=
 =?us-ascii?Q?ZQml2TaEWWHUmDWaRl9Z9nEVYcSISJ6VfqB5L0yFGeJfIIsQgz9j1TeG6ttP?=
 =?us-ascii?Q?GL/AzSS2lmz50iw03Oz+MBT8LJri6meQkpgCUf3Gichu88eDm9rh0VgeEdav?=
 =?us-ascii?Q?/8HQLwWEffKT0KbtWMR9RmGfkKn4K2HCeMbKIyg13vQTLG0OgyFwW5rOl6Rw?=
 =?us-ascii?Q?i6UDwfjc2IL8mf+Du5XSerhlW/+6PPue7W0TvhkYmt/k2q9K/3L/iDtoe0BN?=
 =?us-ascii?Q?edh1gZOJZspxh3B61ro3paJGVanWPQMOFfQ/E3dtVimkGdBmpqEkAgW4FuGz?=
 =?us-ascii?Q?4HHb5iX5vh2urCHjNy8zXkTAwU3Mwe0rKHi4tsS8GmNUWtJbf5v9g9UNZJAP?=
 =?us-ascii?Q?IhtNzU/e6fMkY3wXX+8vrZ7/J6fKFbh86+RefMGv1CDt3YgORVkJ4z5Leg7n?=
 =?us-ascii?Q?2GqLl143at6xwmVQ3yTluyxXGBf6penrkx2d1P5COb/x3O+94rLlrk1IIAZ9?=
 =?us-ascii?Q?CYfbKRTZxitfIM4PqzvhExYF5BzyI8uxDXnCMSKLBCyzkHc6eGWFu1buvSvr?=
 =?us-ascii?Q?V6BjdumtibGEQwvf0seAdYIYWQzoPha1Toh8tfEV+yeTGNXRidk4yjTHqeoe?=
 =?us-ascii?Q?4U/wjwG//W+TxLREa/g4dQsbeSjwLM/c12r6/Ae2DxcHPakts85Xk5Jccou2?=
 =?us-ascii?Q?SSIZbRHKIwdjmF1pfLSnul14+H9CJz2/NVjfYDBPO8CeiitxRQZcIeucxqPN?=
 =?us-ascii?Q?f9AVGMeJBAOOcmHTzt50bOO+xP7cS8YaaZBCV6GKqlrgtA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6nVj+eAWIzwH2m08H2bKPAojvkBGUmwXgllXrpXAiPgAkbn+Wm0ICNofnWfT?=
 =?us-ascii?Q?b8fKolXtZ/VgMO8oaUtzVbfwd2kXnMs39dtmWn42Q0PCJWoHUJT3bdMeGreo?=
 =?us-ascii?Q?LbLQh0T0qvvOty6qy0eECk+5KndPkfLHJmL+DRun94PvfDKOTlpLlaiUda6b?=
 =?us-ascii?Q?UQEzliUH1BJtrHCgAwe5+7cizfCztZZj2U2meke7JwP2IAWNKdTnUt3zIcDA?=
 =?us-ascii?Q?lWeE6gpaRd252AZP+4SN5tz9yk4/G3B7uvweI8+HxA4PdwQ5HZEO5LkgfWLG?=
 =?us-ascii?Q?ZrF/xDXR9sj5ZfKsVsEhYyYxzRt/e8hOoUjfgnZOAXRhF63opGt3PWWM7YHh?=
 =?us-ascii?Q?vn97Yd+oCf8Dt+BF9A1lIysiuSV3fNHs5ySdpShdzBDOIpKfqohWweDbsELZ?=
 =?us-ascii?Q?TQZUK8O9roEwl2RrSXGrR4VEFTPeWImAeduAixe7uiyeCjQ4vc5eewJUi9VS?=
 =?us-ascii?Q?35EyZdEWg5ss58M7Asy0JLlhEvDtWzni3GtAvEq8Uqo6N671RlJ48TS8oFdB?=
 =?us-ascii?Q?fJ2NLIhVKNHcroMV+SYXZqsTSkVV0NuLpIt9p2todBsp0ghQeBenSKNHO/bD?=
 =?us-ascii?Q?dbLJ6YXrm5HWIIZ9VuwkSFuqbWVtNBLT/mO9aeDU/E68bQQWzPqcesFGcKLV?=
 =?us-ascii?Q?WvzEX81diXenMMy1IOjoWO3q1QB/qAKWH9NInqLz791pvVbvpXxHd7mOkfWn?=
 =?us-ascii?Q?LdGf8+xFl0LD4va4wM0EoxncDmBl59p3O6xOGpglqk2OwGvo0oBNDldcYbFB?=
 =?us-ascii?Q?f8XdyYRKRrF5RvIKcXojjvlCVcvmCpnQ3EYtKsV/f/K+rM2rnafhD8hmYDW7?=
 =?us-ascii?Q?f2hvamV1brtRQV7jn3pymO8GLQoB5Gg3LGITFk+FSbAHkq8LgT3DQxZXZgOy?=
 =?us-ascii?Q?Q0UGOzPxrpzNPhUI91zWFhQz1kCQatV2Fu/6kZXZJEIBnp+NY3U6aETDjow5?=
 =?us-ascii?Q?mYHhLBQl0lrt+nrzcI7Swk0GxJGX05Md0x1VKlRzQ6ZYZwqT5fjDAKQYZjLS?=
 =?us-ascii?Q?9GKnTZ1bcYFqPj504WJ9A2v51yyyw07lJp1yqe6qI+XnaNIVx2WH4nIP1AY/?=
 =?us-ascii?Q?LFbpHJp6VW8+csIMP162vzpopHHj/DXvjQD57XbxdYrL90rEAsNrRjMNQoCb?=
 =?us-ascii?Q?A/JhunaiYLSojYv+iw0mSL54+F7rGg6rdNIx8wgyRFwhCOxt3kcGZl/SUpBs?=
 =?us-ascii?Q?3PgOXgfnEPU8ZV4WU2pAOA2Ka2cG91C/HMiLs8VWcop+/W7MnEFk7k3z4BtV?=
 =?us-ascii?Q?NkZFtRIsW+yqEfzL4vUXfdodHFGAAJiahS71Yidp8ahOh0e89/kkTLqzNjTV?=
 =?us-ascii?Q?vxSWN+uO8pogu20LPmOXxafQARz9iWCv29cmN6I9PpyZeSTfOc5TxSKpEOEl?=
 =?us-ascii?Q?svsRZc98T4mrCYBwVufMa8W034LvVSPfXIjycd9cQw6Ew4i45dA0so+juhJ8?=
 =?us-ascii?Q?dJd4ce1lmICiiwfyhQ9cPdgOHOy6TXpetKWbvgiWHnar1B4t89Mdp4w5Ai7F?=
 =?us-ascii?Q?ZTxRVjzyi8iMT4dl7Oz3Y9RXLIreUNFxKShMCRKXDCENGLylzCn/1YKjAa7N?=
 =?us-ascii?Q?Q37exm7ZLQ0FLboTBomCjZked8jemWn9y8/vZb3H1YBgWAr5gpBrI6nDZ7Nl?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a165ebe-cdbd-4b53-a471-08dcb627e241
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 14:55:59.7075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+VELW5G8+nHOgjLhCnbR/1sYpWlmxnD+hhgdRu4PfQ7hO47tPhl/uFmd3s23VRVUSY1YSR/vUaEhbLRmSHPxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
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

On Wed, Jul 31, 2024 at 06:34:22PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Declare hw engine's mmio accessors in header file.
> This is in preparation to use these from eudebug code.
> 
> v2: s/hw_engine_mmio/xe_hw_engine_mmio (Matthew)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 68 +++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_hw_engine.h |  3 ++
>  2 files changed, 37 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 00ace5fcc284..3c12442981e8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -277,8 +277,8 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
>  	hwe->gt = NULL;
>  }
>  
> -static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
> -				   u32 val)

Add kernel doc as these are now exported.

With kernel doc:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
> +			       struct xe_reg reg, u32 val)
>  {
>  	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
> @@ -288,7 +288,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
>  	xe_mmio_write32(hwe->gt, reg, val);
>  }
>  
> -static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
> +u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>  {
>  	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
> @@ -307,14 +307,14 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  		xe_mmio_write32(hwe->gt, RCU_MODE,
>  				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
>  
> -	hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
> -	hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
> +	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
> +	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
>  			       xe_bo_ggtt_addr(hwe->hwsp));
> -	hw_engine_mmio_write32(hwe, RING_MODE(0),
> +	xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
>  			       _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
> -	hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
> +	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
>  			       _MASKED_BIT_DISABLE(STOP_RING));
> -	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> +	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>  }
>  
>  static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
> @@ -794,7 +794,7 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
>  	unsigned int dss;
>  	u16 group, instance;
>  
> -	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> +	snapshot->reg.instdone.ring = xe_hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
>  
>  	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
>  		return;
> @@ -890,53 +890,53 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  		return snapshot;
>  
>  	snapshot->reg.ring_execlist_status =
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
> -	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
> +		xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
> +	val = xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
>  	snapshot->reg.ring_execlist_status |= val << 32;
>  
>  	snapshot->reg.ring_execlist_sq_contents =
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
> -	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
> +		xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
> +	val = xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
>  	snapshot->reg.ring_execlist_sq_contents |= val << 32;
>  
> -	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
> -	val = hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
> +	snapshot->reg.ring_acthd = xe_hw_engine_mmio_read32(hwe, RING_ACTHD(0));
> +	val = xe_hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
>  	snapshot->reg.ring_acthd |= val << 32;
>  
> -	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
> -	val = hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
> +	snapshot->reg.ring_bbaddr = xe_hw_engine_mmio_read32(hwe, RING_BBADDR(0));
> +	val = xe_hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
>  	snapshot->reg.ring_bbaddr |= val << 32;
>  
>  	snapshot->reg.ring_dma_fadd =
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> -	val = hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
> +		xe_hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> +	val = xe_hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
>  	snapshot->reg.ring_dma_fadd |= val << 32;
>  
> -	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
> -	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
> -	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
> +	snapshot->reg.ring_hwstam = xe_hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
> +	snapshot->reg.ring_hws_pga = xe_hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
> +	snapshot->reg.ring_start = xe_hw_engine_mmio_read32(hwe, RING_START(0));
>  	if (GRAPHICS_VERx100(hwe->gt->tile->xe) >= 2000) {
> -		val = hw_engine_mmio_read32(hwe, RING_START_UDW(0));
> +		val = xe_hw_engine_mmio_read32(hwe, RING_START_UDW(0));
>  		snapshot->reg.ring_start |= val << 32;
>  	}
>  	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
>  		snapshot->reg.indirect_ring_state =
> -			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
> +			xe_hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
>  	}
>  
>  	snapshot->reg.ring_head =
> -		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
> +		xe_hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
>  	snapshot->reg.ring_tail =
> -		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
> -	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
> +		xe_hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
> +	snapshot->reg.ring_ctl = xe_hw_engine_mmio_read32(hwe, RING_CTL(0));
>  	snapshot->reg.ring_mi_mode =
> -		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> -	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
> -	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
> -	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
> -	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
> -	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
> -	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> +		xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> +	snapshot->reg.ring_mode = xe_hw_engine_mmio_read32(hwe, RING_MODE(0));
> +	snapshot->reg.ring_imr = xe_hw_engine_mmio_read32(hwe, RING_IMR(0));
> +	snapshot->reg.ring_esr = xe_hw_engine_mmio_read32(hwe, RING_ESR(0));
> +	snapshot->reg.ring_emr = xe_hw_engine_mmio_read32(hwe, RING_EMR(0));
> +	snapshot->reg.ring_eir = xe_hw_engine_mmio_read32(hwe, RING_EIR(0));
> +	snapshot->reg.ipehr = xe_hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>  	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
>  
>  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index d227ffe557eb..022819a4a8eb 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -78,4 +78,7 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>  enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>  
> +void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
> +u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
> +
>  #endif
> -- 
> 2.34.1
> 
