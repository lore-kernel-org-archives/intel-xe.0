Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EABBCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 17:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165FE10E304;
	Wed, 10 Sep 2025 17:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxdnTQes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B085E10E304
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757524428; x=1789060428;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c7HW23ng09FZ3n7pCc6+TrhxWyZEZDStGcL95Bj5kV0=;
 b=MxdnTQesZ4BOX/jIaWRoHboc3k2pc67H1l7QXy76wALL+i1h96zc9UFS
 nNGe2VKwYjoeFng0MnDK4LrYDjn6kmnQDZ2+uSMbJDZ+C6AoRlCzYwqB6
 lSi+HuRypyQjcpaW4VYWekc76H3gkAKC78ggvWap6grHCy5vQ7phoWjQ0
 Y6qdpQ5JcrtFCKdtUqLHHuTyEEGSmnAd2+jw9Zz9fqfXe2OtQ034L1UPE
 yqjUKow7wKBCjIRUauOylTxEd+X9GzlUvAEWh+lVL4YFX7lkhFI9r7wvf
 Omd5MMVmjasGQQAP2+ubUap0H5l1OaBVAk2aJC0S1nA+uAUUozb4x1r4C g==;
X-CSE-ConnectionGUID: t9cgvT9wQ6KCZW0mvXTc8w==
X-CSE-MsgGUID: fYrPODm1SdmjvYdefb+pHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71223149"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="71223149"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:13:48 -0700
X-CSE-ConnectionGUID: 3Q6hRUtGRQa2U0VxQKwQ+g==
X-CSE-MsgGUID: oxU5GBHfQFih74yNI0OP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="172634448"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:13:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 10:13:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 10:13:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.87)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 10:13:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYrkoGF97vFb/DWIus8cx7/fLK0mDSY745pUrGSZyV4l5W9fNPgBrtxsE5sghINyrx4rG5iAdL1xqZa+9gJdZYuQJC3fd65xV+A362mxpHpcvtLDD2YdgUZChPQluLgrxF+0BY0J0sQaIvBDsZwRWvqkuxhGhL6tywWQpsvPNTb2guEnkOFLSI2XYpI9hz6yIOiLHn8HugJEV55DZbd1fit2/ZtrWMD3rJ+UyqnVNJuee/c0yzEoQCN9TO8dvYzWHxj8VaHOHtyYuLWuHCNU2W1e7aj5kUNVWzt40e7KlFZpQQ/ciGHXcOuwdJtq/JCZrAAeHs+rkvUK3y4Z7bW8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DoGIrEHUcL5GfGjeuPSBSsGHHFGQzsvjB4Wr9d4Kd4=;
 b=ZbuDA656oFCUsy/xu4cynYAyJMU8hwj58Cesd8UdgGPf4FTbflLdRfU6X4EqBl5VtTcsz0HFoGA2ldtRDfz3sZdm7rszYD1YcDORmkq4Ctpjof0r4hyp7xJ/zWmU/HoKFoVK307uBBSJI13Sl3vrveIIDpc+6pVRea+uOzwx7Hi8t4UB7AC6uyfb7l+f54J3EV0WDiqpkt436uLbymi3+JOUv/fCsGB+mcP/CX6PDke2cRcdlsfuljSYPz/O1XdvrTcJRqdCeqUTmPI4ATE/N9WQKORqfhRBeQoF3uz0zf5gw5RcyoIdpO9bUC1Wt0idalN4EnAAYbJWzEpnF3IvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 17:13:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 17:13:44 +0000
Date: Wed, 10 Sep 2025 10:13:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood
 <matthew.s.atwood@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP
 30.00, 30.01 and 30.03
Message-ID: <20250910171341.GF150955@mdroper-desk1.amr.corp.intel.com>
References: <a14d4cb5cf1bee071cb93ea2067a337401be9297.1757523671.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a14d4cb5cf1bee071cb93ea2067a337401be9297.1757523671.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: eed2729b-3e73-4497-9897-08ddf08d658a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lLgIeMDFI+KNPH9XCxz0LeKg6gPU3RaRrXL6RuW5WzpSLCBxKJT/CUmotCn7?=
 =?us-ascii?Q?zxWoKAhR2fe2Qg0oPx2k3AYVHrNLAFj6w6j2U5dElDM/WsfNW8mzmVEpLuXx?=
 =?us-ascii?Q?JmhmnuVank9+nQE4oQOTtAhxZojuUeg8S/Nhhk0xNuc6831Xw9Rro9471xkF?=
 =?us-ascii?Q?FlThzjFjp8OBZt0B8I3+ISmIpLqRg+Tv7llyC/GEL1yfJQxpMFDnBIj+fDQn?=
 =?us-ascii?Q?4Nb4P443xeZ3EkqclcfRriTsYHUop6UuRNjlcxAwpz8ooP32cROZ/488DaMJ?=
 =?us-ascii?Q?7pfejZFcxIFOo90nVdOGnKYprEuQqxwQItfUn1HIaBshU/BO4cYDnbOwHn71?=
 =?us-ascii?Q?C3BxMhzJyf5lryHyzmgYK1rUfvr/5cF5fgLQxkJKARTUZ13VJt8jyOp0HnZt?=
 =?us-ascii?Q?URXj4Br83hN7lcioBxvSt9n0TBfJ7T8BhYyxnVIl4QtRvtPKGIZYraMdSynH?=
 =?us-ascii?Q?sNHxfy08D2V45gY6yeu6bQIVyakiN74wyRq+nlluahycvD69ayK27GiO18aF?=
 =?us-ascii?Q?jJ2fOj1T9kaasq3OZ1NfWfKh9nplah7DEQX/CWyeDdQV4Y01JrHPk8R0rE89?=
 =?us-ascii?Q?hQxNPYFmGd0siCubWaDiHap9WG7acF+Xhu437rsHR1gVOi9BWJuCARVKdtQd?=
 =?us-ascii?Q?O7jQgqVjJM4rDGKr2FfFa8nY6ucYezBRPUT/Cw2u6VAUiNyAcdBSI8ABdnBY?=
 =?us-ascii?Q?tvpFNLoL6K369QdllOiKM4BF3xzVJjfIqTQTRWPvyQ7qiN0mbp7YCSKrqX6W?=
 =?us-ascii?Q?EWW6qNNRY02BXNfQIiVJAJeovvPzBPAZf+xsYFrnMzfpBcEewCoJt8+bt7I+?=
 =?us-ascii?Q?7zsZ33HNIpApzSJhk8gouDBKOffYjkkXachM1dFqDd6L1sDh5WhGXXlZiK6f?=
 =?us-ascii?Q?UFHm6wwp5+bbn8YvFuQGENptFJ3ECj2xkpqDSTYohE6IugfoJpCcswPCr413?=
 =?us-ascii?Q?FS5+FYhXwbV4jmsMFyxL3z3t44cd4Y0gyoDYMDF4gFR24vZJmTCuOVGIhubB?=
 =?us-ascii?Q?AZ4S3e8+6li2XC9Z38LeRfC1D6wyOz7q0it+qDidBZqp3ij5wUUTnS/zE189?=
 =?us-ascii?Q?drwT6+YIQBGz5kEjP+vjeSYFnOvJZaA7bOAn16r3hVg+mGW9PmqtEAcKpxC4?=
 =?us-ascii?Q?CkHoxXOIFvBEobfxN6rcjg0hD5kladaGXvdqcuoNDAWoLJOZD0Cf5gDgvhVY?=
 =?us-ascii?Q?t6H9npWsShnXOTV5HOiVAv9CzCQbadb1WVHBD/OphR+y39KJLQO29Zz+13B0?=
 =?us-ascii?Q?Zo1DdvEenY5kCX0QlGcXVOTJZ9Lr1qOwN+yioE5sZGzqPp605YyHgug3iO8x?=
 =?us-ascii?Q?YTCxJDVkKM7wmk8J3P0I28HNd0oNSC+ayv0uEGWe3EoLc2QRX5mV/+hzugF6?=
 =?us-ascii?Q?qpb/t4n7rIuEGl/F3iyVijJwHKnCgRhjD+fBvAD6xZ2wWfr/7qwWtWtORwdx?=
 =?us-ascii?Q?i6M+rukam9U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fjqZ6kNbnEDyqm13XolpQb/i3K6X1Acd0T5DSo3Q05+7whgEKIjC+P3434Dh?=
 =?us-ascii?Q?+3I6W6tmeYX94fYp1EuUiWqiSWGhm9tiPGNv/PYoMzTuT3QosVQsNA/3U/Cl?=
 =?us-ascii?Q?Hm0YVi1GJAshyST/xlK+nhPnya4j8VEGviZGtjW6IKzVL1CTkbE7G6ZE57oF?=
 =?us-ascii?Q?0JOB0ACe/UN7IS0fkoSAmPJehhEnO7VJV1AiAqB3hXZiFBlWxpnxREnWnABv?=
 =?us-ascii?Q?TNW6o/k3xZ6s0HYywiq+CbXWSeuN+WS2rWj5HNJeYiLzh/uR8fCedxkCNNAz?=
 =?us-ascii?Q?Pffh//pKfsFON0GlhEc0srXX2Hk6oXga4k/WXtjgeljxLfuIWSwniDzoQhVL?=
 =?us-ascii?Q?s1MZ9HzaOjelkWtF1GLJGUGdmqwBzVqCj22mSJMZJD9/eg1C2RF8mEe93gdR?=
 =?us-ascii?Q?5fFIzqpZieywd1ow2b2J5YCIaUaUTDDhs1qqimfTOS8tNCFekAWbEKYicldR?=
 =?us-ascii?Q?wkWhNo6dyJjG7WstMQqJc/UpsgKJoqE99ufcYyB1+TuFuncv/gn4RGsfPc0P?=
 =?us-ascii?Q?Ghu9bfD77vsp4lDsDueMmifkbNqlY1jKR7ntM2k9XisveZX4u+WGI0D1OiX1?=
 =?us-ascii?Q?AStEBEGb8mbbN0T3uSeREFsFryiTYBUq0GpmrOItWQ/g7h/Dec+Ys3Dh7QhS?=
 =?us-ascii?Q?KFPJWfj0zADyaMVCXmSucfDz1xIC7iiB9RhNjCa1HbbCUeii07ergt8fvEvL?=
 =?us-ascii?Q?zkK5k3gNTwb8/Ag/PinDKI35MsJAgxr6TpfVr5wdnAKCfiO9UX7R3mHUmmBX?=
 =?us-ascii?Q?Ga1Xwj20GJLF1YLFBsltmjjXigoAshe1+otnNHClCiJtuV+aBz+jLoiFSuD3?=
 =?us-ascii?Q?1Eqr7pgVwoFYoNAc73Em02Kf+SbXfeAbEDdtFp1NC9wmGQ0diRtJQDAbsRGE?=
 =?us-ascii?Q?8asQVLcxdx5BrtAlarILEhEuGkgDi4QwcRlknym1TBxAVCSeHRGx9YZctLC/?=
 =?us-ascii?Q?T5udtM4DAcTNYQfjm19fgFprHSBDyqULrF+lEbLy9FJ6BZW5MJI0CqUb/+hF?=
 =?us-ascii?Q?XkdNYK9IoacYLNbX9dhi1WwKs2bvOscXK5uZkeNIZEMdzAbTHnQeAUFbTpx6?=
 =?us-ascii?Q?LJxHrf0+k8VP7sTAeBlcnwJaFEOMOWZ4CxSnkzuy+CQFSHnTQGiBizEHCGku?=
 =?us-ascii?Q?MNhx+9YDdnbbEGE5K+rNYKmnpWOmagOZsDrC7ymux5lu0/MAKE0ffghrx9jC?=
 =?us-ascii?Q?5LUfssqCaML10H05+rXUv3TtammuheUx6XEItC8y2SB4oWhzELOKEXFpjN9r?=
 =?us-ascii?Q?YiOTxcqYjRbLfFXL1SLoWsjDyGvQEdp6BBk30vTgL+2r1NaRbzq6CMTpMSFq?=
 =?us-ascii?Q?jKXmmTjjjmmA5YaPTDkqCJy/Kp3bAyuv1/CQjMYdu4oDw7dc8iPMnQ0E+05y?=
 =?us-ascii?Q?08e2m5SUu2oyGkoYmR0c0gXdnCsN0OcMWPBQ7ReRymJ+r2Y61wOPNQFQF7Eg?=
 =?us-ascii?Q?nUS948uf5Ul05Xn3ektLIq85yXk4oqNplC5vkOvuoXeXLp1vmy+xJlBdcxOC?=
 =?us-ascii?Q?uPvFaRaDp5wJ63nRKEQTCGM/2rEc6cVhkTX+vySz5ufykpjwLkrvaypbx1Lx?=
 =?us-ascii?Q?cgJFp3eksy4UMgsilpFHjPf3/TUJL/BJXqNv2b53q8/pUsb9WV84lFtX8e5d?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eed2729b-3e73-4497-9897-08ddf08d658a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 17:13:44.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LH5tGdvIEZmqyNS77rBPvqcegdTXU/Zl8zibKlYnls3hwnnS3xqG1S6lH7RYfGQYLnV7gC5irI3eItdislaIxnuitj4dgFLHEDgfUxAVdcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

On Wed, Sep 10, 2025 at 10:02:07AM -0700, Harish Chegondi wrote:
> Apply WA 18041344222 to Xe3 LPG graphics IP versions 30.00, 30.01 and
> 30.03 too.

According to the workaround database, this isn't needed on 30.03.  See
ticket 14025706931 for details.


Matt

> 
> Bspec: 56024
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c1fec526bed0..41ff7c05f12e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -679,6 +679,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
> +	{ XE_RTP_NAME("18041344222"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003),
> +		       FUNC(xe_rtp_match_first_render_or_compute),
> +		       FUNC(xe_rtp_match_not_sriov_vf),
> +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_was[] = {
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
