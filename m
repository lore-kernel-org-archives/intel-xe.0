Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2BBC30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 16:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC1210E63E;
	Tue,  2 Jul 2024 16:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCz/8wxo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3065410E63E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719936734; x=1751472734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oQ5Ga6zYIKL/6gUwqgzjhBgCzRAJeJFWw8fyGxsALI8=;
 b=WCz/8wxoZ7atn4ZR4edS/vh/FqkseLzT6YNl/QgKfMJYZ16IxPhczyS4
 bVFKpzaYopkOEoP8KF0hwp20r9ufdrkmSKrhKJX5JxG38oF76aljNWL9K
 BfeDCziNLqc9MQnBRYHEOTribm9ndoYnXgGWWmF++SH7hPxPI+qtdZyJh
 b5UXV8+a2Tppc3ffbg/29Wo+C8nzXppcLx+jgF82m1GRq2VWas0VZKW2s
 jbR7MWekla88krIBpfMJYE07PCAVBVTDPTiFkLZUFO9kBZArb2nHe2kwT
 T8jBTsf53x6iNk8qXgY5tK7uCWuheTJT2xCQwON02FDZ6XGzdEayfP8MU A==;
X-CSE-ConnectionGUID: d6PS1XwLQBqSCl5GZ9Vlkg==
X-CSE-MsgGUID: SABnU4XBTSGB1/cPeQh5xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27802045"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="27802045"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:12:14 -0700
X-CSE-ConnectionGUID: 44MMcBOjSAS5Jn/mOEUqqA==
X-CSE-MsgGUID: EjPeIwW7QmCk7tiKLriDTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="69141823"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 09:12:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 09:12:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 09:12:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 09:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSfYcEbzKzz+mcXL32+gD0JhF1yTvLU3oe0X0cx5IA8AkHNggI8OzXOvDPRxUHLDr4zyn2FNOdoh3C8nXthTxxbS6tfNDipujKdOhEPIzOyX1yeXML9tgqmHQEXAHUWLNgdAY1O3XYEkh6bWkvPjE81CKcbxKxy7+A7nV5cEVLdFH2kxtuY84UnJ5xMy+whn6oAAn7sz91Iw3PGO7f0cnS7BHnZC8V9GUyn2ngFmWf8aPJvFBcYpvZME2+fgsOA1i45EK0XchSDuDncVu/DqkrVkDL7PD/+TIlmT78qnmvC6OwZhMNjVMrwPqWAa5HBXCoJOK3scJdYqbCKq2vlDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kK5Q8qslBhkiii5ZcXhifUz/t3iXoGig42abfuJCc10=;
 b=Yh5YfCTVjy/99UelaE500PJC5YGf8pDuy9/tas4FVptBPQyhTMf1DQVevSl7Zyif73XPPRRdd56VR454E38W8puubLQp41UscYM0mJ60QWIIN93J9cy2ti5ECR7RXvEt6iUoY13G91E8F1x3lbQJDT9VLL479a9dczwBr2zcfepv07ti85L5x8fTKeM1XY/AJm2HVQ9WPx9+3Vqz5fMMNWRsZhZ+XMZn4Dq7IhGwRZ3DkUFSa0368Woh/gCJ6HRg1c4w35uuCIFiI0nPHp3bdPj+R8tK+AZXEWMTntj5jlwkPlOTpWac0q6PkrPBug86B4rfgTYtOGk88A5x1AHgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Tue, 2 Jul
 2024 16:12:06 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 16:12:06 +0000
Date: Tue, 2 Jul 2024 12:12:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Prevent use of uninitialized mutex
Message-ID: <ZoQm1JW_22Z1ZNET@intel.com>
References: <20240701231529.2582452-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240701231529.2582452-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9702df-3e7f-40c1-cfbe-08dc9ab1b7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kYpFqs58t5bqQJpfUoS6jLWad56MpQcdoV92w8jK9ugZwUEr5t5iNZBc+gcI?=
 =?us-ascii?Q?TRYTVkPYPO8Av5OaHYUQ/u9jLGTMI1ZBln2G9XFXWhK0rPM6Y+q63MNKyaZf?=
 =?us-ascii?Q?VAyr/lTpemA9gfFpuN2PYP+rfKouqDJX9Q0aKnio3C2hXbNoAI2kBz48Krt8?=
 =?us-ascii?Q?tJYRf0ucqqH+nqvwbtoDuDgnYzrPZta3XLQxl8cE4XsS19EWNOyxrfhGvRhc?=
 =?us-ascii?Q?9GHHGrEgAbPWkDj9zIIDvG9mMA9C0RqfMQCkXXoG9+/4XSQWr3vRXTGGoJwi?=
 =?us-ascii?Q?D206WbtHO1edC6+RDOdbNnZrgl0xu2+ZSIOP/kEnow7mJKLruT+2QlTewmv0?=
 =?us-ascii?Q?hhAk9oRwoFxgm5z/o3YWbQgh7jNnAbm5oJMLHIC9N3SOnGpvR/NGRNQh9JrN?=
 =?us-ascii?Q?CYujXboqGKrWdbsqYpcEmBG9/JL7vsSeeyGswZoHWu6lnSY17tcE2C/pIbFH?=
 =?us-ascii?Q?7WGR977F7Kp/cArtBGRj5/ockFGMful83mScuWxm5tCwah+cSrnV4t5wYjNm?=
 =?us-ascii?Q?rKlpQ7nUbZOxwdZsPJQXUKxFRkLtUqJDXyNd3DfcFfSw23v5d+VcKFZrFzk7?=
 =?us-ascii?Q?89Bj5uNp+LP2vB1R2LruPnOXJZp0uphW4aWHJ0gd1/NcbdWUAlSEJ98Y/mo2?=
 =?us-ascii?Q?+v/2r0OcDaQbZ/tSQRLF+a/dAtKg++F1NxPVULKg4tJVU6spdZz9Q7Zxktmf?=
 =?us-ascii?Q?ThVHj+JkDqFAkOSLQvZpeOyOl6kJ/CN5Pv3pQvHI8sDrKMq0AFpunkl/1eXn?=
 =?us-ascii?Q?33WKIQFKAql3x1HgVT1aWoi2pi2Hh+L188vO585mvWXWAzx2UIHhT9LRyX+A?=
 =?us-ascii?Q?TdXBEOCJD75MrslsbYKZJ9eJ1RL12lR/5lFpZk5Xvkl8H1Ajn9I5ZogxagJ6?=
 =?us-ascii?Q?2fhd+oFMtTXJRUYRUSY2Ya7OB62B4evlljLrMqbcMAtuzmch7nRQlzQ5kBbz?=
 =?us-ascii?Q?SnY6OMfsj2OAcpXAzQuZ26nGU1ZsYELHHzvm9Fb6lOaHi2zAFSZ030QAc8NJ?=
 =?us-ascii?Q?k5MJYy9P7/5WE2fB4XrhIcQHdWdYaKNkDZrp5ZNpGFuQ6DinRhApG0t/LOlG?=
 =?us-ascii?Q?NdzjiM8jknYCvMZWP7GI3QFlljuv5jubgdyu0E9DqN1zQBFIS2zgUSr57afG?=
 =?us-ascii?Q?EpNi/T47RgVh+7gNkx7dQVs12fbADHgBQcZI9NZo+URJiT5VjEBiaqPo4YV5?=
 =?us-ascii?Q?OXThC+aHyMOaesYCTBAjMobE2CbnryTEigTuZzweUjE7grqFiSU+bMUAYymP?=
 =?us-ascii?Q?Yol/ddBNx0KPnDevxqbZ+Zu9C68a13jwc7yM/axCkz8Jlx3fnzw6IMaXLVpz?=
 =?us-ascii?Q?qXN9jiorwK7QJ4e37jFntfwtSICJ2X0G2qrkJzYWGHOM/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9+DfNoGTjnBtFNIpcDgvZB+ffLPHvzBoHOO2FZK4DLVkrUdVG0FRhXNMlrX2?=
 =?us-ascii?Q?Lj2VGGu+W0KesnTEZuXwLrb8M++0SzlTWaQIXUmwcTZjNvVwk/eyW+O1AMFe?=
 =?us-ascii?Q?9dTBUioEI6c0ebJ3tLkK/6gMOzMIagLe0LREmqyhTuwLiPE6/JSEXTtlueAZ?=
 =?us-ascii?Q?U8wlQeBO2JKlDO5pqUK54ZY/HafdMigASJC2IajdVogEjFjjCqMHdTOC/hOB?=
 =?us-ascii?Q?CfeoAW1dA2QgSoIprr7mVrrcM0g0Nkx2ixFKeBqr+g5ET0E2KcSxYQ8iV23E?=
 =?us-ascii?Q?+zRq5FYuBZBC2ZKT257Q5urOzvlOuRjXCh0UZHwuMG2KdQyjIiHBVnkycevZ?=
 =?us-ascii?Q?MyRBNTRAZIY2Qp9XLYBJsc0rYgRbXzDPem9mN0aeyFgLAyxbomlnLqX2B7WV?=
 =?us-ascii?Q?dkyukQu5tG3o8XRhsnnsciUTN9oswRc2Z+hJSLoIvBaiFbEjPKwVcDvm7S4z?=
 =?us-ascii?Q?ioTZCIT8A95gHD2nHIlspM5Okz4nXPkY/cZzXi7ohPdpKwQ8aryZrRKydegg?=
 =?us-ascii?Q?1gIDQfEJMCTRahpT6MaSm746GCMhWqk6lPGN67Fv5U5tXlt+BYA13E8gPqXr?=
 =?us-ascii?Q?2Hh/mnQXVFUGKSdWPktVBA8CrQUsHqoUIGaroK11OW6oUutMt22o2U0IGF6n?=
 =?us-ascii?Q?P5U9WqFKjzCYS9wt/31U3VOYSuBO9EXipGvp8tm47k9wecjr03dWBmiKwuV/?=
 =?us-ascii?Q?/ANsTeLOtT+0LEjiW71ByrcpeIqVKTGw9/NwSWKnd332CRlrSFGvYkeF7hsY?=
 =?us-ascii?Q?yeggwV/lmo2bR/PAfq7doyJpuOPBtOv5Ocytsqb0Oazk6S6RrST4hXIPiHOC?=
 =?us-ascii?Q?OJzT4e0d78IGaeR93p20tzp917axYaJhLCWpfYgiA3KwXcdjZBix5i/Dn2Bz?=
 =?us-ascii?Q?swftfUNiQ4dtDueO/3Z8/2eid9LqKvkdEw+0MRbB6VBeg60uGP/wgtZL62MO?=
 =?us-ascii?Q?Pg0uTzUfPFQvTw7P57c4jbD/GYisAkq/zXRUM76zWxDCtJV70pTVkj23iT5f?=
 =?us-ascii?Q?vH9J5hqGzh+03x8z/ZQWjBmkepIrFRj5jswAF3NAoUrUcWAF/AhBgTaSBtSS?=
 =?us-ascii?Q?w0IseLFLX75Krx6AgMRf3N7BDXBdc6mcfSXxxgW+ePDGZIGNMdFLnW82AWCL?=
 =?us-ascii?Q?CcV8lAHdvVSHKiSD9vPG90xZAKV5P9+VG07BIA4at6l8wPwdneh2j3h/UXdj?=
 =?us-ascii?Q?7UruOjDry9pFQSv2pv20A77sBeWDZGX9hmsJta8O/jUyVFhOIRA6XvLjnbTx?=
 =?us-ascii?Q?yLguyzP/YoABRtPSmu7jbhOBVIGSijZI+QA5ugzprZjK09h5bJMVNPG29RGo?=
 =?us-ascii?Q?fa2wDVS3/Pqp+cACFSjQu4nrNp5xYokDg9iXqGSJK7mPR+P6nHReO4rMuomD?=
 =?us-ascii?Q?Rn5wsDAJ6izb/GMV4FQPaI72ji0eYFVsOjvfD5BHR+M2LbH0L24HhcQSjsxT?=
 =?us-ascii?Q?mLxwcdEf/A1DesfswTBhvGWwGzr3wU39hl8fQNzwcaEm3Bihrn0/jsCIK+hJ?=
 =?us-ascii?Q?g1hG/CqM2r/vEs1dZw/JkTlM1UP/a3v2WXo0lHkqRrD+BYmCnbxz5f54E2xW?=
 =?us-ascii?Q?mQ0cWdlqUjK8Ga6g80r6RWE2dUsR+FS2eUq2p4CQV0ThdZjpP07pMZDjXbGS?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9702df-3e7f-40c1-cfbe-08dc9ab1b7bc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 16:12:06.4606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMAKoUMLK3Wyg/apFYaueA/LkkNxqjQA4UhYpS2s5jTZjV5ciiNYROwc6/M0op3gau7onoynHfBAOoytF7fHNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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

On Mon, Jul 01, 2024 at 04:15:28PM -0700, Vinay Belgaumkar wrote:
> When skip_guc_pc is set and/or this is for a VF.
>
> Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d88f5e960fbd..f7b468930697 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -26,6 +26,7 @@
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_sriov.h"
>  #include "xe_wa.h"
>  
>  #define MCHBAR_MIRROR_BASE_SNB	0x140000
> @@ -825,6 +826,9 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  {
>  	int ret = 0;
>  
> +	if (IS_SRIOV_VF(pc_to_xe(pc)) 

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

are all the other accesses protected?
likely because the freq sysfs is not available in VF mode?

|| pc_to_xe(pc)->info.skip_guc_pc)
> +		return 0;
> +

I don't like this skip_guc_pc... we might revisit later
to find a cleaner way...

anyway, let's move with this patch. the rest is follow up.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	mutex_lock(&pc->freq_lock);
>  	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
>  	if (!ret)
> -- 
> 2.38.1
> 
