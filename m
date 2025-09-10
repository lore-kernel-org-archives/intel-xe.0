Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A3ACA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9229B10E0F1;
	Wed, 10 Sep 2025 21:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BG4FXIUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D48110E0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 21:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757539689; x=1789075689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uKtdhsxoQZhmVJN34ulP1OJzXJs0FUIdidCbSOXzlE8=;
 b=BG4FXIUUjULUWyuWpU6VlmM79s+T1DPrd4tmoWJmHbhsSjDnZ4fC52Lv
 rjLAaqhb7Obnx6a8X5rCy2cdp0e8apRc4pve3oLzs5vMfQaLLZv72ZwDW
 jj24ilN2cBwtK6Z3gz1q48JbxTnBX96sQZaDNUxDlkM8aPpwyxdNEfNLx
 kV3v3KewFNniuR/knetnLqMd4mTPusCWPXynW/J7sFq4JB4os66W4NIMl
 z3NqCFnG1WtD/nrZOiHkxFYaIt9Y1Aj2LpDiOhtcBTDm6N9Rp/dcoAOln
 G1fE+UXUGiqcmkEYgauXzHbcQZ7mSMsuVinQb34HPF6cWN86UGJHvJXEk w==;
X-CSE-ConnectionGUID: Go523+X3TaaTYSK+w/sYSQ==
X-CSE-MsgGUID: dRRkanfWSCatgVo9dt27tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82450062"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82450062"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:28:08 -0700
X-CSE-ConnectionGUID: W2TdHPBFR/mCCxMwYwXcQQ==
X-CSE-MsgGUID: Iu2iuP5nRYmZ8DPmHx/Dug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="172792085"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:28:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 14:28:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 14:28:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 14:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrbpkOcXZPqD5+Mm/Yp8UmFWHALXbMUpsAz8/j5HSweSCLiLwUypMlS4Rygm5K/9itvrGGVCeTxtAFtdHuj6pp7jvKAqYH93rTrjkTa4qh6iFBLIqAhAyBIhwwWXy2gYfUovlDvnVo80RSlLMGo9IJGd7Gx5MbU/xGro4zRoqKju6X8k0gYs0qj5YCEIqCREjyxI3JSivA0eYpp220K7cYEME60usL8iZBf91vtCIu5CCsNkLqlALJ01grJZq1597aa5q/EgxV9ASsNlXK+4uPi1X/Vi7KTmv/GlLsW4hxzksWia6eKHg5jPzdkPMpS2E/t8dKK8CygGeIpQkWLpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89LD7nZNztcH5BSMnOpQJrP78Tjqc70o2AyIPFwUavg=;
 b=YZkf5VtHWdfYE28GDDntimhxZnWU+Ex+mVoocnTEu6G3DktwOCOGQl9nb9eSKuXXWVoUkWt4k53BXjmfw9aDq04xceR/K2vhJzPpNstCCVO9GmpuifDVL6ynW2tMOx5UCc4er4uKvy/RjSiaC0kTZlZ5T9fJgj8IWHDYfUSuAgpZA7l5TSCoNGq9eEbmz68hWryZyX7on14LQ+BREA5nURyrL0C6j7fZQEKciSrRQmFCd7bpuF3pA7SjvLAGHVcTvyXxeQSj2TPxsdf0JLyLpRZL1YzDuo8xPZSRshKzBIOddR1Asdyoro5zWe1ao6diXa7aWxo3AWIue2BKv+pJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 21:28:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 21:28:06 +0000
Date: Wed, 10 Sep 2025 17:28:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/5] drm/xe: Prepare format for GT-oriented messages
 in one place
Message-ID: <aMHtYothosjPjPXB@intel.com>
References: <20250909165941.31730-1-michal.wajdeczko@intel.com>
 <20250909165941.31730-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250909165941.31730-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d028a5-3740-4d9f-bc29-08ddf0b0ee4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ev1uHlB8f2VyqZNhjZSoxGgrBQLov84Xv8EWy74Z2JcKnXdhWurk90nd89VL?=
 =?us-ascii?Q?kY1T/jcNqNc7Ys9PLO5JkWyjL9azS/7Qz9Nx5A+whShqoZ8hS9FNbsbsihv6?=
 =?us-ascii?Q?lZIbmuadSnf7c4tQB5jJJLCXh0qap5RSPeIJGId9izxAoj1dT4U4N4+rx0AX?=
 =?us-ascii?Q?YQfAauSGL/YrNppl77KiLclF4s4UZkO0+U/qUuyeIKKEJL/eBWWlrpw4mxr3?=
 =?us-ascii?Q?VQuxk9nd5BsyOIngN9IJ7Atsmd10ksFRHeQ2hrtEQfKfxUwppc/+wauOSbbu?=
 =?us-ascii?Q?FTkBvTjX39hauDBbNJqBsPdoPEsfv7ZaBLpmBXrKHoUmMJQcKGz2xAS+3iaY?=
 =?us-ascii?Q?njljrVBtonF9HBzOGXBm/XFsId+tskJNvbXu5TUfrIbnUH71MD4uz5SnDeYg?=
 =?us-ascii?Q?A7tTe68Wp7svhfwUMLv87EIqkq7zigo8LaeOZ9qJer4bs1dTXSyW8ztGkx2c?=
 =?us-ascii?Q?9U2CXcNBMurFMYyEuJTrtAJKERNkJ6omrnZ350fytHDqIcMoGZuOwgOUz6Am?=
 =?us-ascii?Q?+A02SNCiqUy6TpgoW7C6Z5oGJta84wWXe85GuBWIlg9dZff5BU4mH4COO50d?=
 =?us-ascii?Q?IP3BrHbSTsKkwu/v6OmB2xISIvdfdYYqydYQlIaGDsGrALTLjjZ/1D+cyayc?=
 =?us-ascii?Q?KtngcHu0xD4n2RBeq/ERa/CjmOZ71/5z7bN/C7YtPZnCqprm+RO5Ay7LqvOn?=
 =?us-ascii?Q?LJdB83Fh8wrrmod7RJTQ0rs4z7BPa0fsOeJQqdVS5RRLDdEBgWYEOg7Y1bdi?=
 =?us-ascii?Q?LULjLGTvVDD8C2BUO2PB1ag9uKQ48T/TuyaLGKZX3ymjsRLzXln5mClCZDPm?=
 =?us-ascii?Q?+f5p3h2ojfFrp+N6jXsZM8iv047ogfCd97+4FlqZEWbNNJckzDy7ZTV+UTXM?=
 =?us-ascii?Q?r8ysEDrKkbtYL4aFBoxEOanX5CS1Q7PU90dhEIlKMCj7aKHDxqPDd6GdJpVC?=
 =?us-ascii?Q?3UFcp+PMzEXYF7oEKqFWKhdBaj2mUerivgJNyOAQU4JHVqnCiWZFORW1TX7r?=
 =?us-ascii?Q?qHlwteKtaKjvKUD/ijUWC+LghavpPO/ZYwAKu9J8I2hP79Rnz4wX0nS54CzK?=
 =?us-ascii?Q?j8LUFOvW38ZUjpXynXhzo9QmrngMac6h3xbK1O87YoGp7ef6m/ib2Bx+qukW?=
 =?us-ascii?Q?cFgNK0TQ7haC7UltTpfaBl6+h/6rbC4sw9ajE1znJqghSjHc7k7mY+ru0g1C?=
 =?us-ascii?Q?Amd/lsHWdkP7wf5tOtkqlBK89qik2zTFkgKbeZ0yLA+mlV+ugnMBP/SMzck2?=
 =?us-ascii?Q?CggBN0LkbU19XYQkJLbE5ibNB/nmKW+KMxvRNcSvCfVgSc0ruVbKrKpZOII/?=
 =?us-ascii?Q?TLbbFUoWxrO5Cg9AzIWsjtL6orMfTNeeZI3/U5aj2/jeE3a9hcPWm2SClu5T?=
 =?us-ascii?Q?vLZJ8VoCI+HXQRKBSk8PpM1Ohz9Ec1bN9aA2r81oJlWTbUev+wA1Z1hmlSIA?=
 =?us-ascii?Q?xaWAA4JwFSo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L3sZndZbrjckGeJUA5QJLKAODEiURmc7NE9IJEhYn/hKuJE27qZXKhueuftQ?=
 =?us-ascii?Q?OrN7kHer0Oe0eJ5xC3wCOlYpvljI3VU0Tcl2uEADqZ7o1TXjZvCtc1hgfF98?=
 =?us-ascii?Q?YNhUMFryevj1+rNzb7dr0kxF8or5KoYpWd/vXyGtKIUjYj5otU0vT00bumN8?=
 =?us-ascii?Q?RbWCicNTfgRmfvFK5GjrAhLXKkfrYm6TpAj0NgCUeyXJO4CBRoyrx3qdm27e?=
 =?us-ascii?Q?0FqMV7v2i9/Gl9W/TjOVUwO5HxU/4fskQQxM3y3dYSCL4RwWVvmNl3XrHPLU?=
 =?us-ascii?Q?BHkD9dHN+YGR2R4ktY1bkVUJHGgmp3+El8qSuqDX294GxMkoiXTTrs0XCFmV?=
 =?us-ascii?Q?WataS9YpL8vULCq8wqeqRBcJ6d56ZKbyNrWHl0yEW+19PU05LrVxmH2QkDd+?=
 =?us-ascii?Q?9qROzw37FhXzbDAtLkM1YTeRoIfDUxpJsD8xmDB/rEai+ibzJoGGyUQCmHzB?=
 =?us-ascii?Q?Gm8htqiYE1n8UGnfzSuZxhi6PSzKtB7/smrWEwixQZ1obF1zDb26uTypTGwu?=
 =?us-ascii?Q?m539B+L7sZCXRRj1kAZvlsl0oSoL76ehewEquXz49Aha44hnq906SFeb440z?=
 =?us-ascii?Q?XHj5vNc6w31Ey3m9+GN8slOJ6KXVj5eTDaIPb9lGyZ8ELtGY1W8OeXe21DXR?=
 =?us-ascii?Q?+MuEZKcOitHhKWRUGmSkNgc4U0OaOCpWXUBMHh9qUZsJnHin1O+n5HREAH7h?=
 =?us-ascii?Q?3l/U5/yUIGXy+YV0vdV+H4O7XrbJBGnSo7PYPrFr/M+b+ApVBL/UIa+NUQ4F?=
 =?us-ascii?Q?gj7Nqt54BIMLttgkje07LOsTyT8ShN6U7z7zp1j1LWCDjbcRRSfKF/R1HsS2?=
 =?us-ascii?Q?VQq+ZyYZj6FHqWr98BKWz8i6QNVgoC+TQCdRSz/77WkIAEfhLT6nVq7hszxd?=
 =?us-ascii?Q?dd1WDSSJUs0jkxTTgR5eTKjgp4pvfpzwiSs6frz5beDaSStdgmwoVxBBWcnU?=
 =?us-ascii?Q?a4kxFqsZKUw3O+Nh6cq27C1vd+14aCtLtzAl9uuHK7ER/Tv6zxteV12oQzaE?=
 =?us-ascii?Q?yhvpSsgU4ZeFe8UrG0KUjOJrvexxpYi7dPjN0VoTZKN+PtIVhwzFDXGRMqH+?=
 =?us-ascii?Q?gUYEOKv7RAw+4zM5uWYZrUr93gvb7gCUNOSz6BKRW7gvNMNtyiJ5IIhdVUh+?=
 =?us-ascii?Q?sxkEub8i9MWrPBb7+aJl+Wrp3VX+NmwVr22+A3y/vIUDrmW1nFbi4SQWeb6k?=
 =?us-ascii?Q?JZG9zzXY8tiOrJhsjmn1ngiHMSA6ecIqRZzp1IFE5TZb94RGFoFVWznDgTGa?=
 =?us-ascii?Q?07a0n/28e6F0a3A4SrgI84R6TId+ek7Ll2sTirC/ZokWLM5w4GJNUYy+GG+C?=
 =?us-ascii?Q?m//msAbx08S9/rSfrv0YOr2uv+It3I2eEOXUvc0oXF7npCV+VuhktXj5+Fpf?=
 =?us-ascii?Q?YVE9+++WU0+l4QKhc5lc9TJyxlGjX5kgx2InT4wQ0M8GJXvTMC8y0b2fO71T?=
 =?us-ascii?Q?nzN197hVOrHrrw6HTSltqJ+bIfqxpY70nsaQa7CtBsgA32R9eHC0gYJWgsF4?=
 =?us-ascii?Q?wTijMXKUwt2EHqoAbcbNSyw0ZXk/xKUpw5+ohRUJlhvQTrIgwJsKYjyKydNT?=
 =?us-ascii?Q?pDiA1LhTZFsWtNw7l8H/7d9nM5VV17PAMan15QHwprZY3i2ndX6Ig/LkyrNH?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d028a5-3740-4d9f-bc29-08ddf0b0ee4f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 21:28:06.2017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlyppe2UuQbtgB2sNTdjnTAWCBtO7UCJdssJIL4o14Rwe04p6mddMixl3UU7q6gFWXYj5Nn2ZbSpxxsK/3fujQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

On Tue, Sep 09, 2025 at 06:59:37PM +0200, Michal Wajdeczko wrote:
> To avoid code duplication (and thus potential mistakes) and to
> allow easier changes (if needed) of the prefix format of the
> GT-oriented messages, prepare that prefix in dedicated macro.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: use uppercase for FMT macro (Rodrigo)

Thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index f2091c734aba..dcc45628cca9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -10,8 +10,10 @@
>  
>  #include "xe_gt_types.h"
>  
> +#define __XE_GT_PRINTK_FMT(_gt, _fmt, _args...)	"GT%u: " _fmt, (_gt)->info.id, ##_args
> +
>  #define xe_gt_printk(_gt, _level, _fmt, ...) \
> -	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +	drm_##_level(&gt_to_xe(_gt)->drm, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
>  
>  #define xe_gt_err(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
> @@ -34,11 +36,14 @@
>  #define xe_gt_dbg(_gt, _fmt, ...) \
>  	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>  
> +#define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
> +	drm_WARN##_type(&gt_to_xe(_gt)->drm, _condition, _fmt, ## __VA_ARGS__)
> +
>  #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
> -	drm_WARN(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +	xe_gt_WARN_type((_gt),, _condition, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
>  
>  #define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
> -	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +	xe_gt_WARN_type((_gt), _ONCE, _condition, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
>  
>  #define xe_gt_WARN_ON(_gt, _condition) \
>  	xe_gt_WARN((_gt), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
> @@ -72,7 +77,7 @@ static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *
>  	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
>  	dbg.origin = p->origin;
>  
> -	drm_printf(&dbg, "GT%u: %pV", gt->info.id, vaf);
> +	drm_printf(&dbg, __XE_GT_PRINTK_FMT(gt, "%pV", vaf));
>  }
>  
>  /**
> -- 
> 2.47.1
> 
