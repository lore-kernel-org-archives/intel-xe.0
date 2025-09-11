Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F2ECAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 03:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667610E29F;
	Thu, 11 Sep 2025 03:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOymCiUF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B021610E29F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757563048; x=1789099048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q8izM4kC6f92BzNFWy0Rgzx5Va/1decR5JJ5fYBeDJI=;
 b=hOymCiUFwefOYl5gY01L7i3NEojsWDTmgdDnqqfU4DwVMKT6ARGCYt+u
 d43ZtW1rpc12PjMJ2d8V80BZsL2Y8tTLd+8y2yqz0fd5N6NN0flQq4CuK
 RD8FH//ix+sICmDs+geEF2hD75SIj7jcHyr+IqTx8eEjf6uZKyo0xchRW
 3ZFykxylLcHCM0TnnLECBIRg99oggUTRrmMxy+0RxFYOJnpv8WQe9JwdJ
 0YUYbBFMU2zUyZjKTYOrOy8PCeq9tsmEFOF/cZGhkRISKVO5m0nbdOoA0
 QgMNNqJyy3ZL6OGAIepf/XzBarBvuJHb9fvKbK6MLeVrkPvVlIt3nwLES g==;
X-CSE-ConnectionGUID: 1/M1E3ptTmOGdswYJQ4uZQ==
X-CSE-MsgGUID: FAmrnCsGRRCQZsqInJM5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71266066"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="71266066"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:57:27 -0700
X-CSE-ConnectionGUID: mf0jg9w8QvKxdl0ViPqxGw==
X-CSE-MsgGUID: gw6IiJa9TliZ/f6sikDr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="178772241"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:57:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 20:57:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 20:57:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.79)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 20:57:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDjiNBEjPqAwKjdsQHQW6m3Ogpzj8ba4UeADHUccG7tw+m+hdu2oVzCKUAXfouVoDMPlAtoUGYm0U2PrjFhHIUIWojHMFqtort7wYDOp1yxZJXmFwcx9Tm/1NkOUmixWxzoZ6Mxjrne+SUpEgRoGtKCVPHZlnlalOcCgyobeFrI8yIFUwO64v0KNouLkSyQ1QKzn2INVwoxSh3idtpMfVj59PuxH03wHDbiVB87u8N+m6y7aAjiHanUthKzG/KHAs837r8DRDvGeba/cTtOVTP6mVzI739uQ9fwMPOllEFbYweI1V7d8Nxy+3+cFoe5WzgkTnZ7UAvOb5oPCrncpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpkIUkIA64u9kmgkilzRnmiQew/jObfK0kV1E3gaJGo=;
 b=dZShi1juopBB8SdpB0V8ErytoDB3Ah8vDO96xKLRV+1r+YawkqA9QvtrE9uCme+Q661xN50zRE1vjCKCZcvtjK8tmtGEfCfJrZAFFe4qfG6/4uPqOYQerZHQGWHFm5DUqNn1r3AtSQCkagN2ugdxpb35jLr0pN2POsCanmpqdUzmmAzJwLl+HoPfZDwAhGpNrWCBtseX6EzZfoTdUoL1grz60XcpE8Vl9RcUkZ06TYEscYoM3QeB6JMqu8+oNwbSxz2MYF5l4rkhHJTwP0k0rfiMnCYhtJqT5dXpNYbBCcLrsgzdT8+sXxI2oiDF1J1rLy+qmlty/dKD+mFGVJO+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6769.namprd11.prod.outlook.com (2603:10b6:510:1af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 03:57:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 03:57:20 +0000
Date: Wed, 10 Sep 2025 22:57:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/xe3: Extend Wa_18041344222 to graphics IP
 versions 30.00 and 30.01
Message-ID: <m5mkduobh7irqqoeivn4chbefhq56u6ycym2j4m5vsj723ncut@t4ed4ba25p24>
References: <7368f8059013424ac94f4a01c23f9c98a37b06dc.1757552915.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7368f8059013424ac94f4a01c23f9c98a37b06dc.1757552915.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BY3PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:217::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 44003549-7d1d-4441-f5cc-08ddf0e74ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vu9U22fWcr7ANwBfwPWPhKWFMAH+tXQOXKL8eJ6lzc9Q3mBfQwAfvoNJVTqn?=
 =?us-ascii?Q?PiiR5xkgk+LOR+3ZBJ0yllDUkebnuWx8dm2xN4eaKJ/RlhZw+4FhEbpXYsJN?=
 =?us-ascii?Q?4MGR9F2Z+LvTCqOXo1WIsR3ah063vFqg+v3IhijTc/n4crllFzOOTArTyRU7?=
 =?us-ascii?Q?fnxKepFZJaiJCVbNSNVU/iZGoqP4bpT71fdtB8/XomUiJ3+OOZIpgUaJWxST?=
 =?us-ascii?Q?eLiWefpucCH15SBk7O9Hc7cAV485CpgoQexeRRFaTwPeWpkMyWhQ6FIiXTax?=
 =?us-ascii?Q?1sha4AzxEa5hrffW1BSgFvXIIo47QhBXl9H3sdhDjOlwfJm6Wbjj0tQOZMYa?=
 =?us-ascii?Q?a0UUEwvnKENHPY8GJlXRkbRLi/7ytD2EH432rlw7qH1jjcXZvzntV+BISHYr?=
 =?us-ascii?Q?aLN5+HIl2VZ0kmcXudjyH4tVuMm5OoW0zwYK/q5HZEgV3fd2gArERFrVjUiK?=
 =?us-ascii?Q?NmmPr9hqhKmF6fj4IAziBRI4U6FofZWRU4menWHEvoARGeqQgqzDy6CFpDs+?=
 =?us-ascii?Q?Kd2saO96WIllXIs7E08Uzhpkl5/oI0OtodW3YALs0kKxUgUyeuwLgOW7sV99?=
 =?us-ascii?Q?RhkOEUAQM8gI3ypKo++ixvPVYpNfU7eWpZjp2GAm/KEIiAwIiMMC6lMSPncs?=
 =?us-ascii?Q?nrKB2ZqoJHOrdMkdGW4lKkxRDUEsuqwdlmMo5HlwvE+FXGsA278DF34zpdpA?=
 =?us-ascii?Q?BsPMciAJgoiVP0MaGjQr7F/IlUfFqoo3wUiNBHBaPp3mPOf62a5Z9+C4MaGQ?=
 =?us-ascii?Q?Ay2ZIaSJDFxmmgsN8GnJyCfff/Y5i2+17gLy/nkgMI9vHQKuXqZ7spWnChy0?=
 =?us-ascii?Q?tAm167taGVNiPzSUpmSqUwFwuC5a9qPEsjBH7xfOhrKy1EyZsHs+A5yIJS9b?=
 =?us-ascii?Q?EhR4GEhtLrwHR5KnCXGHthRuV68vZxiiI5d7ieG6Mvkd6sahOSFXAniSChJi?=
 =?us-ascii?Q?JfX4eSkTNedQWR7hTdiHsYhyVF1shwph98hSwC5spkKlH3+FzNmh/nXNkm5S?=
 =?us-ascii?Q?LwZZIJ/dx9Z+F1F5Kw2zgWCXi8hc9Msv1r7uqfDAwL5JpDUJmFHO9q6VXPus?=
 =?us-ascii?Q?tRUJ9bs5jG8nrjXbH8GPzydZ3LVVKspaDedcBtYETQrOets8JapskHQm3Y+X?=
 =?us-ascii?Q?uQ72UAptLHn3HSf7184Df0gWhE/SD5C0FTVZryi/iPPDj6ofWeyM6qtVjACf?=
 =?us-ascii?Q?feFuJk7pTMN8azy8Ot6WoGBVpMkERp6qmCugRlQB5tq5t3q3TuNYfZy8tFFq?=
 =?us-ascii?Q?/8IV7oTlpbkOwR4Sxcfs8Gicc10HY7afXoCx9PhkTgAzwiGacVOBsN/f+s5p?=
 =?us-ascii?Q?MUEr63xPoU6tH2RxqLYrVDny9pUC6CahcpcOsu+PfeAKWWzR8C/7Ds92MNFg?=
 =?us-ascii?Q?zJKXqcIXG/+8+54OOrXWdgNwm/1xVSbj6lhP6kup5XvUujkL4D35hJmQ9jVQ?=
 =?us-ascii?Q?C/o7q0ROimk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uDlThBQhfjEKy/ID8xwp2AO37kR8EVA4Pdch7+TEH6APsmsM0avZaWyWJLs1?=
 =?us-ascii?Q?u5JsPVcYR0Y9dlQlbqEVUaOHDoKJsK3d6jWZQ26/pEpaEwyvw64sWnlYYPYb?=
 =?us-ascii?Q?HgZAoasT01ImQZtvqSziZ5HUTCEmMlw+yUd9BbE+e6lSilSSVO+tOxy+ywwh?=
 =?us-ascii?Q?FgoRXf4gy42c7JGO9Ze+aDA18Z4vvedaNdUE6dFn4S2QoubcSay1BRzietNr?=
 =?us-ascii?Q?8U9sUbmXuaz8NGad6hKgAZTENL489NSBf2iYqhdJ0IxeeMPIbFstVacO8RXH?=
 =?us-ascii?Q?JJD36ekCBfYwP3v4pUGXDqmEnGKMQfkpcXxLsIhE6Dkr3uErs3tMNnBjv8Ro?=
 =?us-ascii?Q?H3kwDjatLV8O2dBUA2Wz0Ezw+VLrvvd104C9JiL69fELgvTstq5AC9xwM1TY?=
 =?us-ascii?Q?fhD9nffTw/1LiMhTt65SL5zWWcpqpiKMly0k9muvVQUe+Xl+rtbanydXWs7r?=
 =?us-ascii?Q?L02QCc/SiTFk2fnjrLgtHbbaCw/SFLcdEhigCNPmIbnJwdjie0Afbdfm/IBS?=
 =?us-ascii?Q?o37BLzvx0t+gaOQUjdtLGNvfMmOIUQ7Z8dlw4YRMKES7/BQeIYMwjnhSdIbt?=
 =?us-ascii?Q?Qqd+zuH00QA5WOR7hHQ5xYYJiIpmzwwwRj53HqYudi6RcbawAYpnOhxr+SWj?=
 =?us-ascii?Q?XFiNNLnpwXcegQMvcWn9h6XjNFklEl46SDQckKCMLQgFCXZppsReIMX3UOIO?=
 =?us-ascii?Q?Hc8PIBJ1hyA4owMeBKRLNVfFsawonP67dVeyNJjrpXxbhz/pDAnAeEPSPhp8?=
 =?us-ascii?Q?AMHlkKm9jcoIU+0Rga6hh+C7/zkXKNwpYbjg8d2KKm+gf8LDUy6W+t18tTsh?=
 =?us-ascii?Q?uykK54vhfCP7wiII+L0RPVRtOW6+nT8wkJp9N/JLQKzmvAvIqO8254qPE/NZ?=
 =?us-ascii?Q?461oIR+YXdCzOs3/HPfum7GkN66mOMtJk/OKZVbQr5ZMwgpN5bsRLX9IyWzt?=
 =?us-ascii?Q?xI/wkdh7OPa2njVits0XOkuxkZezzCbBrHULhyAJ804d+7qD/yVCdmxYIGm5?=
 =?us-ascii?Q?twN9IJzLfe5mXXuXBboHpIwz0honeY0MrffziTs1SAk8ML6vFHObDcLEswQ9?=
 =?us-ascii?Q?1OJQIHqU0cv+U15+rmlYz7k6r/qaYk/KufOAkTT8Sbu7x7a8smHByEujgYEs?=
 =?us-ascii?Q?dp/pZ6GJHv0rE9c10cMgiCcFgALw+mrsTKjd3quGt0xE4Tk/k5SILCXmimHG?=
 =?us-ascii?Q?+JDwUk2kEWAOthWAcQjyEJJwQjeUhnBEu8qnS9olKX3vjwuedQGLCW42hDoc?=
 =?us-ascii?Q?LZW65p//GwuaSxPXSLxVLh1bjVqCXEL62DiCb3J96D92aq+eKlHe5JgsmfMa?=
 =?us-ascii?Q?6NptGwKlU24fkD4XYkNpme2GID3KywdnTs0jm2pSt5kILJ+Q7KWYnnRkqrC3?=
 =?us-ascii?Q?tUjz5f1z7sWoObM0JLaihgz+8qR3qNQpgrQ0PRjocCLjSgOM0xFkwjWgKqli?=
 =?us-ascii?Q?IhVHHPoaoZ/4iYVvNDzzM3fIWrCfvbnBbvLs3zYWuIAGzjLBQGNPCKiuoXPe?=
 =?us-ascii?Q?bTxz1oKNI+7TvibQn3+cWTouPSQfGQ0pd614w5pVtG8LM83FqpqheOZfcKI/?=
 =?us-ascii?Q?hiz9ghAoWU9hTPUB2pdnZ39FfeDEWE4ClN8HrWOG5hlvcvu8b/pkgYxrq4kX?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44003549-7d1d-4441-f5cc-08ddf0e74ed5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 03:57:20.8396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+fqla1gRVtXjoQAmCkQzYJN3TxpR86BnFMIO3vM6GqyCR3AN4fRD7/Eyqs1ceAukgrjZIsuF/bAkrP6BDTIPM2n9bqq4ZU8qOESvE25T7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6769
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

On Wed, Sep 10, 2025 at 06:27:41PM -0700, Harish Chegondi wrote:
>Apply WA 18041344222 to Xe3 LPG graphics IP versions 30.00 and 30.01 too.
>
>Bspec: 56024
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Matt Atwood <matthew.s.atwood@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
>v2: Do not apply the WA to graphics IP version 30.03
>
> drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index c1fec526bed0..fa69bc7730bb 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -679,6 +679,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> 	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
> 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> 	},
>+	{ XE_RTP_NAME("18041344222"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
>+		       FUNC(xe_rtp_match_first_render_or_compute),
>+		       FUNC(xe_rtp_match_not_sriov_vf),
>+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
>+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
>+	},
> };
>
> static const struct xe_rtp_entry_sr lrc_was[] = {
>-- 
>2.51.0
>
