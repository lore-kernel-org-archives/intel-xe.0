Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB5DC43458
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 18:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D6D10F6E1;
	Fri, 26 Jun 2026 18:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k22V+Rqb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF1610E1D4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 18:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782497075; x=1814033075;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=J5GXPNTEQr9ITRIeMKvEtwMS5vVfwpcs2grqRFk7poY=;
 b=k22V+Rqb9W0yfPdYWZ7fh7ekThwIt4TlAuRuicR7pLmweZR6SXiCdwvx
 Tt4uNBwPGV9mrLRab3E+o4ye608Mg31/haFcF2kBysYxfFap6bz79Z8C/
 PnLpQL/2FsCsoYB+TlfkhWsTVGeRMyu6GHoLbWDl67msucbrReogFOclz
 1i/YipoJSRlTUWFuaOYPtAkHHdAVbvhARGMn1CV7ruK8DdElVnxdFwUR0
 F5I05UuzuB/+YDsPtDGUzxQHTIioNGE3J1q3tiZndVmg/x/XqpCj3ejq3
 A6DlH42lniPm00CVTBEWYHHluPuSRtrHEEBm24iaWN5TptkNl/oFOV1kV A==;
X-CSE-ConnectionGUID: qfn4WyziS6aBGrdcHphDkw==
X-CSE-MsgGUID: UIuTVF2nQwGV/rD/uenpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="106088236"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="106088236"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 11:04:34 -0700
X-CSE-ConnectionGUID: HM9o5l7/TmqzvC+u5KTIrg==
X-CSE-MsgGUID: v7E503IUQTmNcIZNn/GLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="254994260"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 11:04:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 11:04:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 11:04:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 11:04:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYnmMfT8aodRA3UTTz+2B5kOEFR/2Mr6eWN5doG/eGQaeTZ1XplfEw40pfYRt8w4utiflI49ux/U/a6g85TyUqLXFeZCCUttKlP78INCGL1LQK9ibwdD+zlsTMS9ZyiIOqBGyXyjR7T/fcD5+y3Y4v3gzpTA2l82QW4Evfp1kuyg2qRNY8YSu5FF4fQCaEaKNoplVnx6VO+/V/K/dY3ZA56OvaWH3QTmRYw/S8w6zcMoZSe2W6QAX2udV8Xg+drIMk4l09EmtZopHmWFneRLhkWUTzJ1gaGXlzjwW1nPUzaOyAG+EBMI7e5zBKYyHTMVpBX3xkorCyezVxE1jB2Ing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tSXPMKMtMq2dLWh8FuL0V4C03B+vYYQKv0fb+vZj4k=;
 b=ZbK+EZVpEm8ej5GSI3xeRCHE9pwJVuGgtLQzTClZkl0OUpKlL6zNnfENzEIdKSpZHlvV7ar8A5WTlD8yiNV2PKPDGgrMP1343UWuBLEqWfgzXYEyELZSvTHmZ8R66WVbGEpYDNAhcbu4aHm4xfGJYa4HyLXgve69mUZa9J2sPUkPXD3sxzTYfG6wYbmXbsaGfZpNLEmTTNWHelMgeiTEUZmw3qq9cbWAV1/FphHMi+dTzq2iR91BRtpSrNb9QHg6yNbkXnj8Qe6Bf/xXAGFq7ZADEl7d+Wr0dzEe2Kot5cxq1yW448xC7T+44HSgBVkENIU7GSvhKvvEnRDpp/aXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 18:04:28 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 18:04:26 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/tests/rtp: Add kunit test for whitelist upper
 bounds
In-Reply-To: <20260626-kunit_whitelist_bounds-v2-1-223dc3699734@intel.com>
References: <20260626-kunit_whitelist_bounds-v2-1-223dc3699734@intel.com>
Date: Fri, 26 Jun 2026 15:04:23 -0300
Message-ID: <877bnlnpp4.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: d93c419d-b52b-4b6c-da42-08ded3ad5c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Gx9D5cnsKHqmmxbu1lsvco9WOsrNrsltIgUNPYM1XQL+dLDY0k97x51TpaEZFrv+xOQNcmCZwM1PofStyKaya/0VOaSBwpS+SLyJYk3TCDMJ9l1+Uve6zjvnpgeFSxyb6rAN7vrBTCuaYj4wploHbqWQIZHvxuPJxzwARjgWYYauuEtmRpHs/YUcQX50LMF3cletYrsk5SI7TrJi5eF+z4HfDg3eaOn6+YF6Enm3EAPOqD8vzV/jiisRYmuoYO1NUnV+Z8ckpJ2+cexDaIku5aer0UMrP8iZpNzz1KtJDhWO7hqQK8z7apgm3I1431nWq4yTd3gW0n109Rb3lpLCKQsgQw3rssAHIFQCAZgLrfgbw9rpT4h/JweMQgYAW04gfkGjBwlwwrByGSDbWMoKYsxNZHfL1gn+K9c+b2xbcAfe693nUkF2CDk3TC+lliFh/JkWCZrwU7gsCLKcbEJEaBTNLwgExqFn9GOJS+kIsiRkBozbCa5AOpAXDR4lCuiG08KjElo9hwu5rf/QS8EfFnl9aAH5UtwepK1q29AW8gZYKatlEv1lJbFE705lvnLtwAoicGKdB2ylsOsd1awc8YBwQUXt5ezaEgx4xsuHnfxtjL4lh/BxlfZ6Sun8At+v4LGsGwTY9wP9kUjp07w6s2MAQ8iGQZ+3f31wHtySKhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CQuBQqCr+rD5K+t1LApuAXQaZk+UvE8eVs05MFuFaCSujLg6jvzbXbDSBert?=
 =?us-ascii?Q?Ptv7RC7A3qCjUZOeut9MEoAcMYQBIpLntAwchuCfHeKyOBv2NcyF9609V3uY?=
 =?us-ascii?Q?X+cYbVQcxCDUeKS1ZakStBg7bB/lr3WOit4m5eL+RkYyMsIAGQkjrdH3Is6u?=
 =?us-ascii?Q?nGBTZ8PSWbeVXKPTgQNn9uXRDZo0XbwkFFGTBl2Dg0YCy7NsjHySO/iIFCEz?=
 =?us-ascii?Q?LPhfxvxgIjmg3/qFFPAv6TeVc6F8p+saPUdlX085d3W7l19EX/rnDUrKi4s/?=
 =?us-ascii?Q?2uRsZuysaKgFWH3JTRZPHFL3n61jxSedOdR1V07s780Uuqj3+LddP7gUdrB9?=
 =?us-ascii?Q?f3Iq/URaopCQDfvymxwcOltx5mpF5w4GiaBFhleHRgkPsP2mrPbKkBMD8wF8?=
 =?us-ascii?Q?qILY91hE25J+Je5q+Ea9pKnMIZf7DG5+aOvEH2lOD5IO40r2H29wlP4mIYly?=
 =?us-ascii?Q?bd12q4lVqag5mXtRYNILItfiOfdf5/ogt9ZejZGlUPIIgveUQ7voYDZqfUfP?=
 =?us-ascii?Q?iD/+uSpxLdCHElSM4M0aQWcwh6UjXXJ9BiRiet80mSbqPB8ADq/92aOiFjs8?=
 =?us-ascii?Q?3EupKccpSpwOvYcM2UF4v0QJ3WX/KAoUEZysWmMwdWFyW4mHN5xyhQ0ZIG4X?=
 =?us-ascii?Q?/Hs502CTtaplrc/EX2BB8UN/UKCp2DqgsBiHrn13v/a4CVBTSiqUDD1R/YNd?=
 =?us-ascii?Q?JkBps8d8A2NTXbp7WjfeB0J5FVKGFT12Pe/bxUAcEFKm8AYjgvcDdfX2+ex1?=
 =?us-ascii?Q?4NnFJsDNgG0JaG3xH9TvhIdCt3fnXjhEgtIBtjvs5ystfnjEy2ivOzl1rgWc?=
 =?us-ascii?Q?i25KDkp2Txp38ptCPoklqLC8DMa43W0jbGi0WhV9owblEH0P4KCu+lYwc/bs?=
 =?us-ascii?Q?LCr/qd1md74yBLQQgAGyT3GQRrgVO0ZrWZ6lKuugt0rHb7zOO2pzrXDh+p5z?=
 =?us-ascii?Q?fFUMjvEr944FpWZTg7mrxUvBgkfD0t4H6bYA8G8u7E7tz7L/zUaHrSU2S7g0?=
 =?us-ascii?Q?lcRn1BcoS/eipTgs0T8Zhysv8vnU5ZpowpEyCvJHxVoUjj6gQX2Tis6aaxLN?=
 =?us-ascii?Q?IJRI+0/iH35Om1IbjQpOXyLPLbz3PrUFb5h61cmwjXhJiXsrWXzHrY7nHLUe?=
 =?us-ascii?Q?8dy/burVLnA1/g3TNvDfcpvaJma4Izn9VzYIriI0iPDOiN09g10QqhxzUHxT?=
 =?us-ascii?Q?FK5DBEkJrxIoO/fbeg99JCE3Kcr6x/PFQxMvbZNSbXLDWMECcCpu/yw2Yo5O?=
 =?us-ascii?Q?ge/PSbuUMwbP6/fGJCSBA5Y8IjsAbe7gn4zwqMUywPZIV1AkWx5ZIcHfyFPs?=
 =?us-ascii?Q?iOt34NdcVBuLjnqps8irRtgYEadRlb9HzSzKqj6RDCge0LOPO/irwplUazJC?=
 =?us-ascii?Q?fvHezE6Fyo7F3Nzu4XvjQDNG8LRWR5QLOVLqiHXaVKJt6zCMboDI3/BRmweM?=
 =?us-ascii?Q?9rQFBRdgABxKM5P0WNnfTSo5vH9b2it467EWNk+uX/bPpprku4oTIAi/o6eV?=
 =?us-ascii?Q?L3EDkS1wO2X1l7tCvRbmyRTng3s5WLk4zLdBk2AvS9Tg9tVzZMFmDMm2wLiL?=
 =?us-ascii?Q?8bkpqFI65WpKEZedxJv6TAX1R3oaOBd6s4FtmVFG+nzToNOIg8pyiXLAYzpo?=
 =?us-ascii?Q?4VbpCyRFFEh3ld3zMflGJUERMLK8qc0TXSTQxvSGvzIdkAIs6qDbX3+SncmZ?=
 =?us-ascii?Q?l9oDWuG1QxA4u3u5A/yFNfFGqwYTfi3TPks6JU/fOsFdbstuW2qrPAc0d/7P?=
 =?us-ascii?Q?tDyc5VRvww=3D=3D?=
X-Exchange-RoutingPolicyChecked: mlNCwLtK0alS5r/lOE6rTDm2KvWzsR0ugKUJHZXkZq6eTxjnUpirD1w1rq8SWvOQV9EFxqj/Ib2SfGB12Oapc7LQGckJH0tRORtFQFSeZLQrMDz66EFaNX7xH3NoIANTf04rP6Wd5ARHzLrHmZiwC993ycreUf4O5TvfHsIwgGuEtaRY/lUqBBYhjoXzyDvOi8x/JPpAVSIaXt6Q56gcuRwM7LIKLmYEOaaYmXWvWGpOiqETdyXRRIdPmsQWNCSXjCNZsCsV4n0a2Gj5DivXGtd1nhNtdnfYjCMXMBj2jdIDyKwRqrAs7dJwASAPxHQVEJxoNhzfI70NVpWEFG4JQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d93c419d-b52b-4b6c-da42-08ded3ad5c52
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 18:04:26.8500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GtDDqN4VAXWQFa/fCGbCBUEJl4m34qKpsSrVXsir90z7os4PIfC6wvjzACPPJjQ6vnTUm5ccn4ltNWhQOBTiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
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

> Xe must only add registers to the GT whitelist if they are listed in the
> "Software Allowlist" section of the bspec.  These registers have been
> carefully reviewed by the architecture/security teams to ensure that
> they are safe to whitelist from a security perspective.  The list of
> allowed registers changes from platform to platform, and it is not safe
> to assume that a register is safe to whitelist on a new platform/IP just
> because it was whitelisted on older ones.  This means that whitelist
> entries in the driver that used undefined upper bounds
> (XE_RTP_END_VERSION_UNDEFINED) for their version ranges should always be
> considered illegal since they could potentially open unexpected security
> holes on future platforms.  Add a kunit test to scan the whitelist RTP
> table and ensure that all entries have well-defined upper bounds on IP
> version ranges.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
> Changes in v2:
> - Add missing EXPORT_SYMBOL_IF_KUNIT(register_whitelist)
> - Link to v1: https://lore.kernel.org/r/20260625-kunit_whitelist_bounds-v1-1-d8f5f055f1f0@intel.com
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_reg_whitelist.c         |  5 ++++-
>  drivers/gpu/drm/xe/xe_reg_whitelist.h         |  4 ++++
>  3 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> index ef379cbb6a86..72ae1c13ad72 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> @@ -5,6 +5,7 @@
>  
>  #include <kunit/test.h>
>  
> +#include "xe_reg_whitelist.h"
>  #include "xe_rtp_types.h"
>  #include "xe_tuning.h"
>  #include "xe_wa.h"
> @@ -75,11 +76,30 @@ static void xe_rtp_table_dev_oob_test(struct kunit *test)
>  
>  RTP_TABLE_PARAM(device_oob_was);
>  
> +static void xe_rtp_table_missing_upper_bound_test(struct kunit *test)
> +{
> +	const struct xe_rtp_entry_sr *entry = test->param_value;
> +
> +	for (int i = 0; i < entry->n_rules; i++) {
> +		u8 match_type = entry->rules[i].match_type;
> +
> +		if (match_type != XE_RTP_MATCH_GRAPHICS_VERSION_RANGE &&
> +		    match_type != XE_RTP_MATCH_MEDIA_VERSION_RANGE)
> +			continue;
> +
> +		KUNIT_EXPECT_NE(test, entry->rules[i].ver_end, XE_RTP_END_VERSION_UNDEFINED);

I wonder if it would be more informative to embed the relevant match
types in the expectation:

  KUNIT_EXPECT_FALSE(test, match_type == XE_RTP_MATCH_GRAPHICS_VERSION_RANGE &&
                     ver_end == XE_RTP_END_VERSION_UNDEFINED);
  KUNIT_EXPECT_FALSE(test, match_type == XE_RTP_MATCH_MEDIA_VERSION_RANGE &&
                     ver_end == XE_RTP_END_VERSION_UNDEFINED);

This would make it easy to see in the output of a failed test that
XE_RTP_END_VERSION_UNDEFINED should not be used for those match types.

Your call.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>


> +	}
> +}
> +
> +RTP_TABLE_PARAM(register_whitelist);
> +
>  static struct kunit_case xe_rtp_table_tests[] = {
>  	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
>  	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_tunings_gen_params),
>  	KUNIT_CASE_PARAM(xe_rtp_table_oob_test, oob_was_gen_params),
>  	KUNIT_CASE_PARAM(xe_rtp_table_dev_oob_test, device_oob_was_gen_params),
> +	KUNIT_CASE_PARAM(xe_rtp_table_missing_upper_bound_test,
> +			 register_whitelist_gen_params),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 3d9e3daab01a..fe996d23007b 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_reg_whitelist.h"
>  
> +#include <kunit/visibility.h>
> +
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_oa_regs.h"
> @@ -41,7 +43,7 @@ static bool match_multi_queue_class(const struct xe_device *xe,
>  	return xe_gt_supports_multi_queue(gt, hwe->class);
>  }
>  
> -static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
> +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
>  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(WHITELIST(PS_INVOCATION_COUNT,
> @@ -104,6 +106,7 @@ static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
>  	},
>  );
> +EXPORT_SYMBOL_IF_KUNIT(register_whitelist);
>  
>  static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
> index e1eb1b7d5480..c0248063d515 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
> @@ -14,6 +14,10 @@ struct xe_hw_engine;
>  struct xe_reg_sr;
>  struct xe_reg_sr_entry;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +extern const struct xe_rtp_table_sr register_whitelist;
> +#endif
> +
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  
>  void xe_reg_whitelist_oa_regs(struct xe_gt *gt);
>
> ---
> base-commit: c04e038b8787434bf489ea6de4ab2e2d936083c7
> change-id: 20260625-kunit_whitelist_bounds-a88495e5cc7b
>
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
