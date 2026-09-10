Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6CC88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7D810E193;
	Thu, 10 Sep 2026 21:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+jGNTsR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04E810E193
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789077576; x=1820613576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DHJC0pGCQh8VmfBTA0av6kPUMQSWQxY9Zob5uFi0/UI=;
 b=Q+jGNTsRMXkOPcn2LyU99f7eidMd2nryNwAIJuVTI4Yl10zl5K77wSwx
 +zS3OOsCSbN8hOobRnT96vIjEL9XcvKcTbDA4qvQrdABgRAv+GsnRKilg
 Pbzsnww49ICGFexQj9ArAewqPNLCeyhHhEfdyQ2O/tN28XKWEIP9QM+qs
 az6cEfU6fxtFz9LaM/ZW3h7D5tjsca6de/7ZAP/PUcMGEbBJkTS0Q/34d
 PHN9P9Q8Vr1uxQoGcj8ot9Gq8ASyroD+/5pcgkItxXPgzk82U9tFw+y3i
 TjPE0GKxnoeAH/00RaOXAS59SSw0UBnug3dTRLy0uG2nVi6q6rdP1lJns g==;
X-CSE-ConnectionGUID: Xj5j74LDRUG9CXwENxrrOA==
X-CSE-MsgGUID: jI49JrdqS5C0bhqRtVDLkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106910330"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="106910330"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:59:36 -0700
X-CSE-ConnectionGUID: 5TRnkOkmRT6/gDihOSGf4A==
X-CSE-MsgGUID: Kv/jgieoTiea5SaQ+Y5rEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="271731067"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:59:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:59:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 14:59:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=degAJz88j5E5QtNyM3vbQhrynZ96y5kTyWTwcrzZzef2bJ0Q5XOUQMB47KkiDpXlsTVZXcXZeylzHnqJwxAFEPVkCcuhd1QCEQwqAUEtzpE+8SWZ0wra4QuGgw4JCMCZOs9GKVoR9bo6vi7po+Xbzw5PT5IkoDH1f2gWV1dH2BfApfkIoseBoE36cDJPTYlTu6r6UY8vu8b+Q/igh1TiRpLEbmrQBX9zLZ/nr5empRgcLNDFrK2hz62kA92DNuOXyIjGRjsHAagwV3znrSq3Kf2g4TlOTjGQ2DNhwR0r+nja46OZLOyXzr5Ii1xPYHxNZBFB4Q6EYOa65Z83LllFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT1fquEnGdI7/D3bZsHOHmfUkQMG3LsECBdozwS/L50=;
 b=o4kKXDfASkBtP6RZ3byWtOqyUocoHVlEAG5x0mG5iVHeIiLTUMbfYcwrioFKvnAqAaCGMkvkiYeS76/o0dBB4N13RYnz3Fabtp2B3RJrVAN65jeTDUeRNjNLa7gWBRaR3pGwC7yAJTsmlkD/YYHwe2Jjxlm+Xub4NZdIwE5ZSogvo8Q+gOnF1RLqjKkARwFJ9lZ8QTZS9H2xJYKADMlpVOT7mXnJ0EcltdkGqSWnCAsPwTjgSF/E5/YU7KMSztITzZ4u/hdUQ43HeR/peyHJzow+t95OMk6vlR8+VoFIrwC92z0lLsTvdn6O+4deJGLFZ/nEkUzgvd44QeZCQIYJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DSVPR11MB505860.namprd11.prod.outlook.com (2603:10b6:8:3e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 21:59:33 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 21:59:33 +0000
Date: Thu, 10 Sep 2026 17:59:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/hwmon: Use shared pcode default timeout
 for power limit write
Message-ID: <aqMoQI5vySekKZ1D@intel.com>
References: <20260907083520.192418-1-karthik.poosa@intel.com>
 <20260907083520.192418-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260907083520.192418-3-karthik.poosa@intel.com>
X-ClientProxiedBy: DS1P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:451::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DSVPR11MB505860:EE_
X-MS-Office365-Filtering-Correlation-Id: b1450db8-b0b4-4249-0f96-08df0f86cb9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|4143699003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GGIqUF0mJCqDLgxjfk1gXINcLFuqPH3h0M/FVNuS64wXJdAV6SS06tYcMQv51HzxNMepguJWKlYyAwNbjHfAcYsaLCsPqYUermxFTJrEufo3m45XNrvW5A8rvooVKkejaM8UYtf9f8LdGRGcWj0k+vH+JXJQ17zF81ft6feC7YBHBMfFIfid2D7OOMKm4uSv+jriiL/SJ544/ztDuL9JQvpTZnA8BlpOuWzmtecwmrDgkrkddRv5XuXIRFCs43x8MqvQ6ptj7sLfJz+PRgEF54fw4MpkxBFbRYntomekAza2IZq59aMhoJLkRbRiysYrHffsGocqjfUEGPjpHuup/89FtMAwuxuoNdvvBvaZU+Nm9pFySBOn3AQuv0lCuxXsYu73sEC0txzAokQNEKL4wupzNXJRl4eFvoLeYG5vN8HcYdJ08hGZgwRznehtzsyRHS4gLWWS/dsBwivHlRhs7aHJkudqYDkEjo7D/tamK+rQaChOuHEvdF0USUF46LWBEYINvTw2s9hFp6IGssb9n/CdWp/t8XnJ2Mz5PpKjewX/HM3dpbvdce1oTrU+XeMzYG+Bjh+PS6JX1IFsylt8CExZ6t42IEJphJ4EBgWwpzHKMtLJQyM+Ua9GNtM4qXP5VpRKYQ5GlWJyN7c8qan1qBKocYbd3bE3poanhvFHviI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rOAYiUuL29mPC9HZ6yzLrv6cfa0qKIswjdYO3Z5F+IpOiaMmOiCxpCOt+C8Z?=
 =?us-ascii?Q?jEOCRz5L/fV0UF2CnojqX3fcxrqeil1kGmanH5u4SPHGAi7geRbZOnh1+HxI?=
 =?us-ascii?Q?+lls17pKBgLp3ylvOBehE13W/pSrfrojS4EB6qALko009/jIOEV+TZz0vMS2?=
 =?us-ascii?Q?s+pq7UWmCaYvi64iE0QTJgfZsKufwIvgV0BqKtZLLPYI5Q+X8uJFd1g02UC+?=
 =?us-ascii?Q?9JfwgLLeQN9pbiYoZb9soWyYWz4S/355krY01ImG8x0UqPeHgesqH3clrOq1?=
 =?us-ascii?Q?Z7jQ+vjeqBmP5DJX5Mtsy2JPBYWbmZDajBOHu4QiOpvos36UmufqmvUbDjdG?=
 =?us-ascii?Q?OkrGdO0QLcgelcuHmr3wGUVe/1zJKG6VxOnzUeKeytnSRQORdx/jLP1e9bR5?=
 =?us-ascii?Q?2qdyS4GFZUHVTJwE5QXa+j00S1fFJW/96jkdtfsfdlhtbkJvoXU7HcgiUdiK?=
 =?us-ascii?Q?UGTxE8V1h5epGiRg8VRr0kYM4B0PVBj3d7PkN2HLWQqUb5bqyWIYsC2nKKoW?=
 =?us-ascii?Q?Nr/nhdCB6T/bmRLVFvBrk1vs+dzfFvVl3OylSgAW47BiQciWflSCh9N+ckAx?=
 =?us-ascii?Q?pAe6C8DnKa89EQ/N8KaGK2EkuaB3YPCX/WJ9AKXOKZHB6RwU24v1oQ1Qn7BJ?=
 =?us-ascii?Q?1qKPT3mTJSZoA9FkW2/YJ80KXqwUlCsIc6bPbExHGl+Voc3DlBrpFjpo0hob?=
 =?us-ascii?Q?tiN8AhM0rgrKEocHV7COJycjleHdJy1JVovVQzOYe5Gd64Era6M0+iY/Avlo?=
 =?us-ascii?Q?BUm0xXCrBEwh2vcaD/7rdDCbQrRlf+s7of8NjxQ2CjjKUMuY5KnuntAh6FCh?=
 =?us-ascii?Q?5uGRY1RM0VhqK3rX4vbP9x/IZFaBj62xsC4U1KaHMaxd+jgAQBHLidRaTm50?=
 =?us-ascii?Q?fjLBQ4sZc0t3SbwS90Tm6ceun/cNB6DNCLJ6CQskgvfd9xtSfNMa3H+wFv0Q?=
 =?us-ascii?Q?gLWT5CA8+OHJCW/JsvlwZKY8k+hsUF1qU8e1twdUAktc/3K5VJ12G/Mtz43x?=
 =?us-ascii?Q?jXuiMMw5wXDGXcQiDReP/8GhdyCE+fPK1ZfRlEYjWPpUnFopr9rks+qaNaqy?=
 =?us-ascii?Q?jj0ZzKKeufxOpS/982akAUtx+Rhky8T+IZ0poL74XHLSASiUZtqy3uHcrLvQ?=
 =?us-ascii?Q?DYomyA+jYHyFWgsHkulXyc4swXMD2cpmWFYb+ePPaBeq5SKGXA1lttDnShHj?=
 =?us-ascii?Q?P8qkTGO7mKjG8nyrrfMZMtcY+6r6o6ifzdB7gNUSRc/wdA4HIx/uwVmG/Fu6?=
 =?us-ascii?Q?2kpo/QhgoiJ7+oSlfBRb1cy4QRCr5wazJh9GRXbPwDIAIT1cY162eaNr9exr?=
 =?us-ascii?Q?G9zj7hROKgFLQfXeWmb7qnEpX6GrgRmxmU9fXW6UMPU/Zq6rBhyTro/Irt+X?=
 =?us-ascii?Q?hJm6oT5NPVzNfo6V08E6QuJ484oJnZLAaE6CspNderH5Au/RJt6nEzwU4jmb?=
 =?us-ascii?Q?ouQltGUmls49+6WJUNZTRuT5tvob1EBA93L3QLcXsgQ1axusgK/j5AlSy19A?=
 =?us-ascii?Q?W5cnAf+B4vM1o5omz3By371kMAbrlwSmbbrD2aoVdgttYgj+A9V+p0gbk1Jm?=
 =?us-ascii?Q?6NGOzJSX0rNPHg4kUmJ0ymwR4sxQklMWrSUjV3hMpdrkmdkV98pa36m581+l?=
 =?us-ascii?Q?+1bE1EVeOXwxN+2sXBzgUBZ5tr3GI4JlUEPqxWtSTA/dYshL7mJqN1OpyJ9u?=
 =?us-ascii?Q?MfIs4eu6V/1sUqQdqBj+w6+dJlsrEums2HJ0qvsQ3YL/4WDzCSziMlFn4XEw?=
 =?us-ascii?Q?a6FOfTLvww=3D=3D?=
X-Exchange-RoutingPolicyChecked: qaLkPGLCOdHyblj/AYvbKtArRV7sn2CuyL/TBfdGkPanZpJyQVr4gcafzqeqnpue5+rUBiC/OPGKz45C1leWLUEHllK7G7SwOkfeYvg7FAIvepTa8Vz/aQCWfXg3G/+bAgU1MqnWrbyJVAJXpAPuZbafQj3wuEG3MXf65xwavd6fboR/lOnYJ+1Vsx+TeALWxVJKgly198OSc8SUKZsb9SNNPrLn2BWmbyFUlqEIc51JNVnLSNJ4Chag86rzvsreNl0pWgqV3yX8O1rIayCexDZ56J8EeOTUuK63hTLJLFk1Yh6vkOHH8c8iCUQwY7q5/HO8gPGjuTK2OjTCwi72vQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1450db8-b0b4-4249-0f96-08df0f86cb9a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 21:59:32.9462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FITrqvivaSSMbe9HBY5V7TWbp1A+LTVR+H+FBth/oMRFpaBFrY2/r4ksImv9Iar/8fjabT+qCwiX2ezlT9QBfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB505860
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

On Mon, Sep 07, 2026 at 02:05:20PM +0530, Karthik Poosa wrote:
> Drop the local PL_WRITE_MBX_TIMEOUT_MS macro and use the common
> PCODE_DEFAULT_TIMEOUT_MS for the power limit write mailbox command.
> This removes a duplicate timeout definition and keeps hwmon in sync with
> the pcode default (now 10ms).
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d..5edeac961ec3 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -101,11 +101,6 @@ enum sensor_attr_power {
>  
>  #define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
>  
> -/*
> - * Timeout for power limit write mailbox command.
> - */
> -#define PL_WRITE_MBX_TIMEOUT_MS	(1)
> -
>  /* Index of memory controller in READ_THERMAL_DATA output */
>  #define TEMP_INDEX_MCTRL	2
>  
> @@ -252,7 +247,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  							     (channel == CHANNEL_CARD) ?
>  							     WRITE_PSYSGPU_POWER_LIMIT :
>  							     WRITE_PACKAGE_POWER_LIMIT, 0),
> -							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
> +							     val0, val1, PCODE_DEFAULT_TIMEOUT_MS);
>  	if (ret)
>  		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> -- 
> 2.25.1
> 
