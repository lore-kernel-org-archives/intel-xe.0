Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC88C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 21:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA88010E8ED;
	Thu,  3 Jul 2025 21:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyISrrie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601F310E8ED
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751576872; x=1783112872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sQwGlmr7/K5Z1/fmZz0flfbnNklCzzby0kMj8Rr0Y2w=;
 b=gyISrrieJN+87FpOFhErsdTCpQzYQvUpoI44foeGcaYGvVw6pb1rA6oy
 cPcK329NUfFBh9fnRqgpuDi+6fSm2JTItrGgiQ4qiMC0ge6ZDmB4rxy8b
 LfknLMr32LaNxNi7FT4Xwr/drKmsP6BU5STlQ/o46pZ7B+MVe9vgAt/hH
 HFRBJwcLHNvta47Y7sOHemHopArY5xG9eh4CU/HkI1mOfSgpbHRZlvFj+
 YBgurG9e5X5oPJ96P8GGPO5i5cVbkosFqRdAayDrCjPn2JxfjMz0z7x6k
 0tpoUOCStR0piwgM7MIenF7uKfXhrNs48vRVMVNj55h4dbKXvZZzuftsL w==;
X-CSE-ConnectionGUID: JjvbHEyLSNOZg0m1269RSg==
X-CSE-MsgGUID: DE9e4ltFR8i1X+fXlGZ15g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53783529"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="53783529"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:07:52 -0700
X-CSE-ConnectionGUID: 4feoni0GTL+Ekdx+xyyEkA==
X-CSE-MsgGUID: xvLcFD5RS92y1g3N7AjeyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="158822762"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:07:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:07:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:07:51 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.72)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/2YaAhDLycLYtWM1cVsGQiYdXnzRu0Ho3ng2/MDg0n6faAdhCk2H2fRjjiXMc0Wk7pQLOfnaU9XuCPXLsKBDstFDe/OMYlwv7OJ5WYC3/Fpsl4R5sn1sGI2ZdYv5cJOlLlIaJgfsFL1bjc76w6VoRLr7si36JpXSxxybPZ/3F6Tt3AzPW/jBfDwlKWJ5Mdw/opWQt66OAiaAf0qViAjB49JcZLRo0MoWT0jkSQHi9UMkQHNkhBCnGkK6eRcJuLXixC29cVHyccOL6zXmFMfiRd2agT1d6fbV7refrZybMJXtplSthSWYSwhXylwnKQawfhBCJTiWB4uz6+mls3lvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SsSlqpnKSthwT73WCh1ny6+qSKA2ZEMFyNXyX0wKpY=;
 b=hTMAtDfoqAWgF3TjWtYbcPk65vyCakyfhBufVv72NP6PeduN4c4u6Vw6sWEZEfCi6w40uJJji0Ij3rFLvL8TXZNR9Ql4ZI6VA2dVmuapfViK+CBOadYKWqxaxZu81YDnrLebF8idAEYM7TMn4pg1GKcAUbm/Eoez6bPxEM9zd0jvaNtWj/e43EShKxo9DWE87mGd9MFL3RhH1i3xH4Fpc2lsowK5hu4sLwO4Zmgrsyw8YyjXEcv8Mc97tU774Vg/Kr12YEz2nfAdaTnIbMe87GrKty9uZyE1iHnwdNoMyn7QNYQugE+RL1RYLlYezRjVEjl1gdf7RKGFpacHDE93bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8222.namprd11.prod.outlook.com (2603:10b6:208:44e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 3 Jul
 2025 21:07:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 3 Jul 2025
 21:07:48 +0000
Date: Thu, 3 Jul 2025 16:07:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 2/6] drm/xe: add new type to RTP context
Message-ID: <jvbzpogxi42nwjteq5zfe7udi3afojc6yf5l5iypgbzf4byroy@n2rxlxuw76n6>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
 <20250702193036.1417416-3-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250702193036.1417416-3-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: e312c648-59a9-495f-0c4f-08ddba75aa3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t33FBa2p8JjJ+jdYXzF/0fmrXJQ4l9+hjH/7EAAaAeyebPvjQZAdglGWygY3?=
 =?us-ascii?Q?D4zUvXZemaz39tzlHmsc2JrOXH3lTVNHonidJw1Zm8dKLUsIRJ6iHv0HUfug?=
 =?us-ascii?Q?My7xeEtQql+aGis7qGm5MCZT7foUdMtUT26799T8DyXP91yxw7lD1hLuPb3V?=
 =?us-ascii?Q?rV/Mw/QtoFhBvswNrc9iWMetCO7vaIWpglB7KYxe4QHNdB0ZiOEfXz2f2TCL?=
 =?us-ascii?Q?Szhl3KXM13Sk8okf/JLGmGG0YvxOCL94WoWcoG1e1bbicCcYDrpH7QHCX6kL?=
 =?us-ascii?Q?QT4SHyGJBrXS+a3DFV9dk8FI+toWFCD0FfearF80Sgwdh4rBi4uUI205Xtka?=
 =?us-ascii?Q?TcRRmLoYdHjxVk/aZz8HaOLCipvLWVgFPY+pmjbwa93f1/BBNVb3qUJQwZz3?=
 =?us-ascii?Q?8lzPJEkg/pc/VPrrnQU5i/Vb5+xuFwhxoMlNEP3Ta+j3d1Ikxw2DFApWVyDJ?=
 =?us-ascii?Q?ISoy2JJ+CmIK8wVSUmrVVWeVixn5UhrapxqofxirYJc78AZK0ePNYqriet1E?=
 =?us-ascii?Q?tPZxnp3jvNbUp+t17V9HenY5mwWLNY+kNdcWhaUcSm6vIs65M7IUcLpXAVLB?=
 =?us-ascii?Q?qQjSxaAfxlJ+yZhhNfiK4wowjFQLKApYZqtmY015+LvF/TxCr1K78ACx8733?=
 =?us-ascii?Q?F4C7bEEzkm4DhSQNWkUByslmGN/nyax7qv61FRKSO9FuNqyfKDq3UBnvOvdE?=
 =?us-ascii?Q?ACk6pYCVUxGUmpD/s6HtsVlp2hrZiA1PVQ80vR5AvqfbCTvoZT10NXetoXgc?=
 =?us-ascii?Q?+dmirJDKAiKkEJHLKZmUC4fk3iZtmNqlHa0kYIoxf4cxsK0zgACnw5ORTyfx?=
 =?us-ascii?Q?c3CnNeum7wZrTYLwt0eT6pKch7yNusHcaLowJmmQZSrLtkTt86kqe91NwWw2?=
 =?us-ascii?Q?yeBIAKGKvdcIHaaxuhLtGoMLkApNm8A7e92FJ27gNzQJr3VY/avU07grrTfT?=
 =?us-ascii?Q?cu6iiFZx+dy4DWuimlGp9vd9fWC8okig7ttbtPl4WM960kUXMp09M2mNL4lS?=
 =?us-ascii?Q?PA57lGOHRImBrZGvx8PNpbIf77ZXH4HbuLsVyFuXEVzHVF40C9oLDBmJjmIH?=
 =?us-ascii?Q?aS3ivTW5vc9McjDbYA+y/AycVbam9bT/AFuz/UHyARIMUf8+nmbVObJX8BaJ?=
 =?us-ascii?Q?1OiasQkh4IQaeNd15D95E+KhQnWxv2dcxv9Oo9ec6aZcWosUTyzH46f5WbAB?=
 =?us-ascii?Q?Vao0Pgm4lfSuGpk4fdKN6RDfIwnlhidVLJuDndhLAMQvE9GuetrpbPJ3qOg0?=
 =?us-ascii?Q?eQqW7JPAPYO5Xok5faBKTi1JWh5kAQuNUV1z0h7bjB3OSpWav8ln7pHIUmsG?=
 =?us-ascii?Q?uHdzmp1W+feRB44W4IXr96c9J3z+aFJWnzNADxDOTLZEuNVfkb910urbHtWE?=
 =?us-ascii?Q?qeLTV8YVL58L+BHdMsYVz/wBSg/ssoiGPRePq/3xyQj3v6N7LTrH/5I8zABX?=
 =?us-ascii?Q?b6h/iQOgFRY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EJw+z4UYKpF0cOap/BNZKQ4MrnsXveDOoc2gRAf1OyrfuWgmzkQbnC7xWRhV?=
 =?us-ascii?Q?RLevkuuykvxsexAKFLYMbtU1z5Pm6HrrsAovuAJgsN3DCtO04g8ZiMwqKh6P?=
 =?us-ascii?Q?GDf+nF2Lq7918V88GcOIWzzM45QvG8PfetkKPqxRUFgqBel9XOkk8O06kMV0?=
 =?us-ascii?Q?qXapkmhbQd0o1gCf/658y7bTzhsKhyH3cVtwpFMUQk2x43rQD/+f3abmr4UP?=
 =?us-ascii?Q?UYcnR0VbppLQ5lyu7+gwz16WnVpbO7owPwXNtMbUswFLLUEeoWUGelTkh8UQ?=
 =?us-ascii?Q?eE9dq36rAtFr+ilKFBG/zAszk5/6jndbW/t9gBUGJ0Jgs4qlpdbaikgrImkZ?=
 =?us-ascii?Q?MFLtgq5ns/kXwuyeiKLjJh4L0tSsddN59/CX+8//qeA8QMqYetNNrOcFvgMy?=
 =?us-ascii?Q?4YMdcJRuNdQdeX9Dbm0S+4M5CAwiB0r4vtlkWtui+w5F9Wa40MLxbQWWollR?=
 =?us-ascii?Q?O+k+tFcki1b38dec+lQNIksk66Smxsy6e9qslUVJ8ZR2OEBYdoAz5W1PzZZS?=
 =?us-ascii?Q?OmXFzGUDEUSgb+p35i2/BXeiCFk85qBZVZw+6+2i6+3ER9gza50E3wORWHZb?=
 =?us-ascii?Q?fI1WsqngVVT8+X35X0wHH2+XLvu5Ay+PZgY4TV5UlTWa8UBqnwQyTXTdKdWI?=
 =?us-ascii?Q?VEdvZSQAXOTOxdZGlL+8I6Qyzc45c8KukTl3O+Mxtbcb9/zfJJHaYFXmjnTp?=
 =?us-ascii?Q?Lqgkw6waqffPYXzL3lgtCcuV3DWRltNgDvCANOsZR685gZaxuQjjYt3IaG4W?=
 =?us-ascii?Q?RVMAtLEKXDqiSz5wcg5JOpwN3ApkmnN4FbXkL5FXt6+dq4o5h7cWzHebBjdN?=
 =?us-ascii?Q?rJudZ/jOaQuwoYzX2sJtLPCuCFq2mD7g0rBxZNFqdrKg5R0YDQe3lvjszrnk?=
 =?us-ascii?Q?E6NwnAhOh58vo53YmOmUufwkuhPKceO//FWj+7DgQEe9fdYLBW60fbRKlZl4?=
 =?us-ascii?Q?tOh/Cc2JT/j1T6NSisCpkpt2jTKks/FUr/ITC9+nn9wgCG0vIBzHJLdbZKuq?=
 =?us-ascii?Q?b8ggfiO0j1tgVhnLsKPs4Vbll1BWhYQzU+0e2fraoeu2vWcUWul1D2+wj2RL?=
 =?us-ascii?Q?DM6NTKrSwTRKe9B57qPDmztYeokni+fsLfH3Dw6SKRIalRejKOC2zrX/oxv/?=
 =?us-ascii?Q?xkVUiQwzh23R1f6yaNL7audkZBGnLHxYlBMrwg4XiqLi7e+BZ0UGz2l1gWrO?=
 =?us-ascii?Q?yaQxnY1BTg7jF2P7p6+tC+RmIFmvkZ4CmU7WQ8mSoKPe6f3ww/zdHgDkFQkv?=
 =?us-ascii?Q?ins2Z0rgoA8hWQI2a/ctbuvfv+DHIW93+nHSiWlCUhC+YgWDeQgo8kRjIZB8?=
 =?us-ascii?Q?bB5vfHnZqntm7SDLsnyztU1ynueKifDJnTKcpVLKrglcRc74yqeQ1mrGuPPm?=
 =?us-ascii?Q?jyA2eMF3/FD3eXDtHH19tE8gBB6y54eWx5VsdTXdNhKuwDFn6ryeHRR2CjEt?=
 =?us-ascii?Q?oBp/+Mhw/GvV+LKSgHn9labXERoedQ+7g/uxBicxTEgon2OFJp5zEVAiasXx?=
 =?us-ascii?Q?DIwt814IJP5ccHdSOAhGSIgMYQsqmRGWnH5ObhabgFXeo/7BgO3l8GwZXa0d?=
 =?us-ascii?Q?x3i4wAB/WPnW5Xi504vd7x5rQOkfEV1k+wctohAYfp4Dhztad37X11eWFPm7?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e312c648-59a9-495f-0c4f-08ddba75aa3f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:07:48.9123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwQlvrBui266GUo4aDZQp85B5Ihk/0IcteARnie1EnQpcy5FQP/wqko/BQE65obYVQlJyd5mlQg1vQVgUsWKB8GJZ6CfDqqIDFjXTeflWYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8222
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

On Wed, Jul 02, 2025 at 12:30:32PM -0700, Matt Atwood wrote:
>Prepare the RTP context to be used before GT init. Add the xe device as
>a type, put WARN_ONs to protect existing RTP_MATCHes.
>
>v5: split out into separate patch, change definition order
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>---
> drivers/gpu/drm/xe/xe_rtp.c       | 26 ++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_rtp.h       |  3 ++-
> drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
> 3 files changed, 30 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 29e694bb1219..9ae0bf15984a 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -56,10 +56,16 @@ static bool rule_matches(const struct xe_device *xe,
> 				xe->info.subplatform == r->subplatform;
> 			break;
> 		case XE_RTP_MATCH_GRAPHICS_VERSION:
>+			if (drm_WARN_ON(&xe->drm, !gt))
>+				return false;
>+
> 			match = xe->info.graphics_verx100 == r->ver_start &&
> 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
> 			break;
> 		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
>+			if (drm_WARN_ON(&xe->drm, !gt))
>+				return false;
>+
> 			match = xe->info.graphics_verx100 >= r->ver_start &&
> 				xe->info.graphics_verx100 <= r->ver_end &&
> 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>@@ -68,20 +74,32 @@ static bool rule_matches(const struct xe_device *xe,

missed handling XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT?

> 			match = xe->info.graphics_verx100 == r->ver_start;
> 			break;
> 		case XE_RTP_MATCH_GRAPHICS_STEP:
>+			if (drm_WARN_ON(&xe->drm, !gt))
>+				return false;
>+
> 			match = xe->info.step.graphics >= r->step_start &&
> 				xe->info.step.graphics < r->step_end &&
> 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
> 			break;
> 		case XE_RTP_MATCH_MEDIA_VERSION:
>+			if (drm_WARN_ON(&xe->drm, !gt))
>+				return false;
>+
> 			match = xe->info.media_verx100 == r->ver_start &&
> 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
> 			break;
> 		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
>+			if (drm_WARN_ON(&xe->drm, !gt))
>+				return false;
>+
> 			match = xe->info.media_verx100 >= r->ver_start &&
> 				xe->info.media_verx100 <= r->ver_end &&
> 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
> 			break;
> 		case XE_RTP_MATCH_MEDIA_STEP:
>+			if (drm_WARN_ON(&xe->drm, !gt))
>+				return false;
>+
> 			match = xe->info.step.media >= r->step_start &&
> 				xe->info.step.media < r->step_end &&
> 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>@@ -108,6 +126,9 @@ static bool rule_matches(const struct xe_device *xe,

same thing here about XE_RTP_MATCH_MEDIA_VERSION_ANY_GT

> 			match = hwe->class != r->engine_class;
> 			break;
> 		case XE_RTP_MATCH_FUNC:
>+			if (drm_WARN_ON(&xe->drm, !gt))
>+				return false;

yeah... that func is gt or hwe specific, depending on gt.

with those missing ones added,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I have some refactor ideas in this area, by splitting the enum
per context (no, device, gt, hwe), but it can wait and be done on top.

thanks
Lucas De Marchi

>+
> 			match = r->match_func(gt, hwe);
> 			break;
> 		default:
>@@ -186,6 +207,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
> 			    struct xe_device **xe)
> {
> 	switch (ctx->type) {
>+	case XE_RTP_PROCESS_TYPE_DEVICE:
>+		*hwe = NULL;
>+		*gt = NULL;
>+		*xe = ctx->xe;
>+		break;
> 	case XE_RTP_PROCESS_TYPE_GT:
> 		*hwe = NULL;
> 		*gt = ctx->gt;
>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>index 4fe736a11c42..ac260feaabef 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.h
>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>@@ -422,7 +422,8 @@ struct xe_reg_sr;
>
> #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
> 	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
>-	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
>+	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
>+	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
>
> void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
> 					       unsigned long *active_entries,
>diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>index 1b76b947c706..f4cf30e298cf 100644
>--- a/drivers/gpu/drm/xe/xe_rtp_types.h
>+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>@@ -110,12 +110,14 @@ struct xe_rtp_entry {
> };
>
> enum xe_rtp_process_type {
>+	XE_RTP_PROCESS_TYPE_DEVICE,
> 	XE_RTP_PROCESS_TYPE_GT,
> 	XE_RTP_PROCESS_TYPE_ENGINE,
> };
>
> struct xe_rtp_process_ctx {
> 	union {
>+		struct xe_device *xe;
> 		struct xe_gt *gt;
> 		struct xe_hw_engine *hwe;
> 	};
>-- 
>2.49.0
>
