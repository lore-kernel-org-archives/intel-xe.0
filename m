Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECF4C79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A8310E8BE;
	Thu, 10 Sep 2026 21:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deF8GRUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CE810E875
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789075103; x=1820611103;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dKdrGt0ggwSXwEgEc8M7JCXfmqiODSi+MQaVsbddhQ8=;
 b=deF8GRUQ9COocvP37HR+GBKBQRbN1SztVICCAJpawJX1L3lmxhw5fzHh
 TvKCg0P+XoGBZVQMlRPUruuYjG6htSx1Zt4sDABa7oihpXyPv1tmfg4ai
 asoxpD8mdvlXus6bS0UbskVb/KL/ljnOETJC4zS/WcnKIxV/1BMTtMqUc
 suoDcHHb2sYpwkvjItDajpfIOXGj6OrYUNXorpAY9e8hs7/Rhowjxj1NI
 Girisd6ObQuzBNMbnSfxw1ELVsGVAuEcN4Nh1t1yxvsAgow4pffFzhYxi
 Cj4rBFqyghxL4ydi0TrkSXdYah7txdqDYbBV6hO0Dg5UNuYMgBo5NLunN A==;
X-CSE-ConnectionGUID: 5kDWCE8KQbKaXaZKazkgzA==
X-CSE-MsgGUID: REzld3LWQKq3LD/xp/9rcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89567726"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89567726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:18:22 -0700
X-CSE-ConnectionGUID: 8Bvp/xJbR3ePk0EGmzqhdQ==
X-CSE-MsgGUID: AwaoyF1CSuye5Nv4l9epbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275271556"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 14:18:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:18:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 14:18:21 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 14:18:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TF8Yk1USBTMVsKxxWrUYELiwe2du918jHBxlFNHcWsYuJqH8b094KRfH5HHrgfe/fOScK6LeSxVszkVPOpT856E0BY63p1iQCTi3g4xZfbOCglI+5Ec29sFk+Hh/wuyEXOYYizOO3iELfP+si8CEFW55dUgW32lEmmdbITj1Am7Pb6DvSkBd/1bG/fVcgTxY/DrmoMAXjMzdgJhvvKvE8wwHhKYr/lVHYbPMSjxLjzcXq1RMe+xlGLOHuixRRUC6s2Jxi68hUbl1WPHRgZZxmdL2U/gy8u7Kn22DdxXUqBHR32EO45e0Id40Nb6osqh2TNvRQ/OWOd8JOtCce6nyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1oVivieeQEiF4EyZkiIKRcLyMNkRX8x9WFtctKsCyw=;
 b=qcJFVR2mFEVESEAQkNrM30PDJCwhf6d+6ArOFDVa7TSHc2hmDtwPg+a8N59p+nFKsiy6oPz/mxRG3K8ZVIRGMBeV+gYxCBqz0trVmabgnuLzKkyaMcyKnWZxiRLA/3dD5h7KxrI89KzAhzLv5r8W7txCW6j342b2/HF6OCZDr+54wtONuzHnYPfioZDkJ7tNFXZKS4PwU+Xr93txPv6XRjZqTTV38EMgmSctEjSOPoEVwDT/4XYyPphhrFilavVWHmK30qbWg3WH6T5Ger2TwV9r/Zk86x0CdsPcZ6zCZkul7EIZtjW5qChyQVhVjnEQ9B95YrMFSkn7YNxaTGKu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 21:18:16 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 21:18:14 +0000
Date: Thu, 10 Sep 2026 17:18:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <julia.filipchuk@intel.com>,
 <matthew.brost@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v8 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Message-ID: <aqMekldlWxNWQrFD@intel.com>
References: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
 <20260902234039.885267-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902234039.885267-6-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH8PR11MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef432fe-30b0-4d25-b121-08df0f81061a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: H4mh2cQy5q+iux7g9oSj/Hgw0m5NIlFDcVUSoE+Y4zJdmwkLcztMltV1tBA9RBb7oXRmVPsS5IJe79EGP6ehKYuQc9MT29hrUVN4sAHea6zdNHwrsRAMRX28Fb5jF1ykM7G9UTLlPdN8Vy4SLKh14HV3x2P75JVzDOYjAcC6RDec9Mtf3A7EUpTxgterOoiVQT7/MLsm36e3ob078yg2ekrCGCGud1i2+eFUst2dY0G6hMUwXXVKLgF8rRkkXr7Y2b+/e7zlNDJwYgn+D9fS6H3KEzwD0AzCPGTCZH6vEWZyFAUL79UT9sQ6ymMxxN1erofm0jbSgZ4sRDAAbxvp3XFEKiNovqtBuOQx1w9xMMJeVUKKEXCR9iU1MpRnEBdbTkmhdoPrK/UEQ8UJTtq7wD46+I0mHM48Ux0V3Nuap47dqeOH2WC9tk+QXa+wl/zSJQewhmnhUL7KicFWDZxuk9aZUwig/SL3cjSS7t80wCJhIzN0J92XXSE9dVpvFOzEsKUd+NwghvRRM1u1ejfryIBTv6mVBAsDL2dNEfqI5fQ6Wh5FIBILQJRqh0Sbp9hdDETDj9rvOZI3m60bZ2lHUc+Vl60ONTTOXe6tpCzWUx2od2Iph6dvwJb7QBE43IwIQCqCNcQ87Sc8lPyNefy5TCSziRvo4WHMX1JOkOvXrmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?X17dENXpV43ZC3iM7ne4W7DJ5OesgwY/plug8FiYr7uyVf4d8LBr8z90gC?=
 =?iso-8859-1?Q?uyXoVTOlUXXBlTN5hh6xQpEQ+8nkE1P78Qk1QohQOh45wwUD7+j7itukRK?=
 =?iso-8859-1?Q?qWSnmT26D7BxbcHBLJ6OUr4m0o3SR4czeRKMELnK3BkUOJK/P/kB0pvRnG?=
 =?iso-8859-1?Q?xhrn/JBo+Hsb+IvvM1in7wZR5SRYw8xrcCwrbzSxoOPWt9+lYX1JtdLqkY?=
 =?iso-8859-1?Q?/NBSGmZVPrjQURibicnqz4mvKR+4A8GnbUGn4rZ8T6zON8GygRiTNeF26u?=
 =?iso-8859-1?Q?lpgzXg9F2BcuZf0Qlzvh6Hdt58jEfbiIN7bFZxdCI3P/HMmZjUynv6EluJ?=
 =?iso-8859-1?Q?W8NpicPB9CVNvO7QkQSEb0FFJTrrHcFp6cz+L0EOimxf1MdcZMpVDHBsng?=
 =?iso-8859-1?Q?JLoINPqoBVe2e/Da/tm+8YHU2igoOJA5bTc3Ls3h0e0em/LH2Yc44qW6YF?=
 =?iso-8859-1?Q?6shKiP0E1Az6LvpNCSobEObSnUNt1tIBjtnXqUjRwZeb/8fGcD6j2igE7E?=
 =?iso-8859-1?Q?wrVy/66wdhquMOUK9MsqRYI3vNnUic9j7dcUAaFAWFSmsVk83R3X3KtITz?=
 =?iso-8859-1?Q?Eb1xrb35x2ePSeiH6dZHFwWLZX3EP9BJUo6Jl4PoW2QuwtDXmTOCFOqG0m?=
 =?iso-8859-1?Q?ugDryiONP4TwRh6U4+TPOlUNvWRe8/tH72o8zAZKoF0RZ/4tdxJwmSoUkj?=
 =?iso-8859-1?Q?+mwelMr8IvfpwrGIsAYaLtLSb0oElpWzpWUdRiECHCF4nQzrQTDJbhF8C+?=
 =?iso-8859-1?Q?o5khJ+w5mK7Xo1yeGNGXaSf2PXFaNSnss7vcdjsurRUN/8aSQeRm5nqOPH?=
 =?iso-8859-1?Q?Eo58HAWTD7r9L87EenekWD08Qk4IYv2hBs/2tqFb0F0VuKTxLxugjxkc0o?=
 =?iso-8859-1?Q?779awljBy5bELcXlJ/1f2KVgv5iiR8rNyKYbdrH7i0fQwq8dqYx+Bjg5zz?=
 =?iso-8859-1?Q?we0U2c3d8Hhune8Fbyt0lbIDujqTairdSHVnd2LQNS0egD8CinOV/2otk3?=
 =?iso-8859-1?Q?wEpFbcf4OJ7lKRUk1qzmwS7B+KoREtiA4E6Zk1ubZwxB1TYeY6gIPFAyV5?=
 =?iso-8859-1?Q?62SVxiz4P9dzljYPJ0hUfqbkY3dPSaf3z671WC/ssQ9nrhoEtON2gtTAjY?=
 =?iso-8859-1?Q?i1k/7a5gVCAyeu2Ua8/L4esRqlmmHKkBHyVtI46gyDEtDA+F9Ad1T58c7G?=
 =?iso-8859-1?Q?3+vwhcNdAjJShRht2JHZMaKUF3ZqMxyuCzu9QMuD5QPXSSCgjYSXUZkPxt?=
 =?iso-8859-1?Q?QSrhDhfmctEljfq1QzkWCVYuQEdHQsRUD0fJj8cedGl635imJ8CA6FCAbK?=
 =?iso-8859-1?Q?a4J9amZXK4AwEuTwvsHXGaUjbj4+pwtAGjLUCTlOQLPRo6HxpYWo0Ob0xr?=
 =?iso-8859-1?Q?hp26fiDY5Y5+OXrUoZZq4lGeIdp4O22lwK8eKkW1kSLgzYydRCvC7aHdV7?=
 =?iso-8859-1?Q?rnt5eYPlHAh2auThRsJmmuzNI7Ulm9alKrR+DyolkNLfkfsbGGIAhX62D2?=
 =?iso-8859-1?Q?+z6q3qIepGoCLh4i1K9jKm75kyNLUzKLiiYIgyM3+hR2TQoWTNZrJ3IjST?=
 =?iso-8859-1?Q?P2AHmigcyhkH2H9s9QoE9kEu/OjB1rFeA6f7HjomNvQSjro3m54XFrNlNa?=
 =?iso-8859-1?Q?CZf7hr8foxRqQOCz2UWXfl81JA0P9Xa1HvtE6Wk08zNbKWCuK+KTDbmJZU?=
 =?iso-8859-1?Q?0CGgPU0lF6e5Ao629R4lZP+Gc7PCoegydiuqFXEg+PyjWD9lE7BwqOKc4U?=
 =?iso-8859-1?Q?r0UlBSjs8GTGpe4fHI8DqKOrTahpraffDpumyQiSfr+tIICUGl7EhAQMXZ?=
 =?iso-8859-1?Q?rZyD0tNMNw=3D=3D?=
X-Exchange-RoutingPolicyChecked: V+GNw1xrSB7bTX8mfPcuy2P4ADsoxX2mPuHiAR8r4+o/n6Fr9jZBCOjSptpvNXCYGgqeCxDuLZ+P2EC/rNVY0ghKnCvsYSk5etskDnJxVheQdU/pbytPKcDK+vSjmB2CUJ/ug/SjLSLQ9+LYxtYGcgWSfcH751/ANMWCT86w8ylR8HlbCjoRY0BFXRAigTYBOW0gdINaLgx1sOna5N8i/iPjKqZDcyWvdbRHsC65h+UhfcbeAO3wSsrt3LOQLpqx4kmr+oWYuI2DmRpp9/2yuQXRp81X4WPBtIHokSP20pgcQhcfx3RqW2U+2s15W9V+k/mKSSDz9GI8yDa+lX/Zgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef432fe-30b0-4d25-b121-08df0f81061a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 21:18:14.2188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p03NwRymyd9jSmUWuilqLFpfD7eRV6q1PP6luMYNCUW2qHMsn9+yR/JcorfD10Q7mTcjSx7KdJROGZMbrD3uJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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

On Wed, Sep 02, 2026 at 04:40:34PM -0700, Alan Previn wrote:
> From: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> With default settings, GuC log is 8MB in size and
> dumping the log is time-consuming. In debugging scenarios,
> dump-to-dmesg suffers truncation loss because CI's size limit is 2MB.
> Additionally, if also forwarded to serial console, it takes several
> minutes. In use-case of continuous error+log collection over extended
> period, we pressure CI's allocated storage. Thus, compress the
> GuC log data dump to address these issues and multiply any benefits
> from a future upgrade in CI's size limits.
> 
> Replace the raw ascii85 dumps of GuC log snapshots with a
> zstd-compressed ascii85 stream and reuse the same helper for CTB
> snapshot output.
> 
> Use zstd streaming with the default compression level of 3 and an
> estimated source size of 0 so the compression workspace stays bounded
> even for multi-megabyte logs.
> 
> Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
> GuC log and CTB dumps are compressed with ZSTD. This allows users to
> choose between reduced dump sizes and lower memory usage.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Acked-by: José Roberto de Souza <jose.souza@intel.com>

Please always sign-off whenever handling (submitting or merging) any kind
of patch.

Also, please mention what you have changed in comparison the previous
version submitted by Zhanjun.

The CI reasoning now is much better.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig          |  15 +++
>  drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
>  drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
>  drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
>  6 files changed, 183 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4d7dcaff2b91..18a682a44b31 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -33,6 +33,7 @@ config DRM_XE
>  	select ACPI_WMI if X86 && ACPI
>  	select SYNC_FILE
>  	select CRC32
> +	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
>  	select SND_HDA_I915 if SND_HDA_CORE
>  	select CEC_CORE if CEC_NOTIFIER
>  	select VMAP_PFN
> @@ -101,6 +102,20 @@ config DRM_XE_PAGEMAP
>  
>  	  If in doubt say "Y".
>  
> +config DRM_XE_COMPRESS_DUMP
> +	bool "Enable ZSTD compression for error dumps"
> +	depends on DRM_XE
> +	default y
> +	help
> +	  Enable this option to compress GuC log and CTB dumps with ZSTD
> +	  compression. This can significantly reduce the size of error dumps
> +	  but requires additional memory for compression workspace.
> +
> +	  Disable this option if you want to save memory or prefer uncompressed
> +	  error dumps for debugging.
> +
> +	  If in doubt say "Y".
> +
>  config DRM_XE_FORCE_PROBE
>  	string "Force probe xe for selected Intel hardware IDs"
>  	depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 5f2b90b18f97..27473c25aad2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>  	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>  
>  	drm_puts(&p, "\n**** GuC Log ****\n");
> -	xe_guc_log_snapshot_print(ss->guc.log, &p);
> +	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
>  	drm_puts(&p, "\n**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
> +	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
>  
>  	drm_puts(&p, "\n**** Contexts ****\n");
>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5c4733da385c..10a8cf327036 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -2186,11 +2186,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
>   * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
>   * @snapshot: GuC CT snapshot object.
>   * @p: drm_printer where it will be printed out.
> + * @gt: GT structure for error reporting
>   *
>   * This function prints out a given GuC CT snapshot object.
>   */
>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> -			      struct drm_printer *p)
> +			      struct drm_printer *p, struct xe_gt *gt)
>  {
>  	if (!snapshot)
>  		return;
> @@ -2204,11 +2205,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		drm_printf(p, "\tg2h outstanding: %d\n",
>  			   snapshot->g2h_outstanding);
>  
> -		if (snapshot->ctb) {
> -			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
> -			xe_print_blob_ascii85(p, "[CTB].data", '\n',
> -					      snapshot->ctb, 0, snapshot->ctb_size);
> -		}
> +		if (snapshot->ctb)
> +			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
> +					  &snapshot->ctb, 1,
> +					  snapshot->ctb_size, snapshot->ctb_size);
>  	} else {
>  		drm_puts(p, "CT disabled\n");
>  	}
> @@ -2242,9 +2242,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  {
>  	struct xe_guc_ct_snapshot *snapshot;
> +	struct xe_gt *gt = ct_to_gt(ct);
>  
>  	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
> -	xe_guc_ct_snapshot_print(snapshot, p);
> +	xe_guc_ct_snapshot_print(snapshot, p, gt);
>  	xe_guc_ct_snapshot_free(snapshot);
>  }
>  
> @@ -2342,10 +2343,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
>  	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
>  
>  	drm_puts(&lp, "**** GuC Log ****\n");
> -	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
> +	xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
>  
>  	drm_puts(&lp, "**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
> +	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
>  
>  	drm_puts(&lp, "Done.\n");
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 3ddc665ab84a..f950d68a060a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -12,6 +12,7 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_gt;
>  
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
> @@ -26,7 +27,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
> -void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
> +			      struct xe_gt *gt);
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 538d4df0f7aa..aaeb0f76af30 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -6,6 +6,9 @@
>  #include "xe_guc_log.h"
>  
>  #include <linux/fault-inject.h>
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +#include <linux/zstd.h>
> +#endif
>  
>  #include <linux/utsname.h>
>  #include <drm/drm_managed.h>
> @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  	return snapshot;
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
> +					 const char *length_label, const char *data_label,
> +					 void **chunks, int num_chunks,
> +					 size_t chunk_size, size_t total_size)
> +{
> +	zstd_parameters params;
> +	zstd_cstream *cstream;
> +	zstd_out_buffer outbuf;
> +	size_t wksp_size, dst_size;
> +	size_t remain, ret;
> +	void *wksp = NULL;
> +	char *dst = NULL;
> +	int i;
> +
> +	/*
> +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
> +	 * (windowLog=18, 256KB window). Passing the full total_size would
> +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
> +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
> +	 * workspace stays ~1.5MB, well within kmalloc limits.
> +	 */
> +	params = zstd_get_params(3, 0);
> +
> +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
> +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
> +	if (!wksp)
> +		goto err;
> +
> +	dst_size = zstd_compress_bound(total_size);
> +	dst = kvzalloc(dst_size, GFP_KERNEL);
> +	if (!dst)
> +		goto err;
> +
> +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
> +	if (!cstream) {
> +		xe_gt_err(gt, "failed to init zstd cstream\n");
> +		goto err;
> +	}
> +
> +	outbuf.dst = dst;
> +	outbuf.size = dst_size;
> +	outbuf.pos = 0;
> +
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
> +
> +		while (inbuf.pos < inbuf.size) {
> +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
> +			if (ZSTD_isError(ret)) {
> +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> +					  ZSTD_getErrorName(ret));
> +				goto err;
> +			}
> +		}
> +		remain -= size;
> +	}
> +
> +	do {
> +		ret = zstd_end_stream(cstream, &outbuf);
> +		if (ZSTD_isError(ret)) {
> +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
> +				  ZSTD_getErrorName(ret));
> +			goto err;
> +		}
> +	} while (ret > 0 && outbuf.pos < outbuf.size);
> +
> +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> +		   length_label, total_size, outbuf.pos);
> +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
> +	goto out;
> +
> +err:
> +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> +		   length_label, total_size);
> +out:
> +	kvfree(dst);
> +	kvfree(wksp);
> +}
> +#endif
> +
>  /**
> - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> - * @snapshot: a snapshot of the GuC log
> - * @p: the printer object to output to
> + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
> + * @gt: GT structure for error reporting
> + * @p: drm_printer for output
> + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
> + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
> + * @chunks: array of pointers to source data chunks
> + * @num_chunks: number of elements in @chunks
> + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
> + * @total_size: total uncompressed byte count across all chunks
> + *
> + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
> + * zstd level-3 streaming compression and prints the result via @p using ascii85
> + * encoding. Otherwise, directly prints the uncompressed data.
> + * On failure the function returns without printing the data blob.
>   */
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
> +		       const char *length_label, const char *data_label,
> +		       void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size)
>  {
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
> +				     chunks, num_chunks, chunk_size, total_size);
> +#else
>  	size_t remain;
>  	int i;
>  
> +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
> +
> +	/*
> +	 * Print each chunk directly without merging into a single buffer.
> +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
> +	 * for all but the last chunk to omit the newline between chunks.
> +	 */
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		const char *prefix = i ? NULL : data_label;
> +		/* Add suffix only on the last chunk */
> +		char suffix = (remain == size) ? '\n' : 0;
> +
> +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
> +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
> +		remain -= size;
> +	}
> +#endif
> +}
> +
> +/**
> + * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> + * @snapshot: a snapshot of the GuC log
> + * @p: the printer object to output to
> + * @gt: GT structure of the GuC log
> + */
> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			       struct xe_gt *gt)
> +{
>  	if (!snapshot) {
>  		drm_printf(p, "GuC log snapshot not allocated!\n");
>  		return;
> @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
>  
> -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
> -	remain = snapshot->size;
> -	for (i = 0; i < snapshot->num_chunks; i++) {
> -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> -		const char *prefix = i ? NULL : "[LOG].data";
> -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
> -
> -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
> -		remain -= size;
> -	}
> +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
> +			  snapshot->copy, snapshot->num_chunks,
> +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
>  }
>  
>  static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
> @@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  {
>  	struct xe_guc_log_snapshot *snapshot;
> +	struct xe_gt *gt = log_to_gt(log);
>  
>  	drm_printf(p, "**** GuC Log ****\n");
>  
>  	snapshot = xe_guc_log_snapshot_capture(log, false);
> -	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
> -	xe_guc_log_snapshot_print(snapshot, p);
> +	drm_printf(p, "CS reference clock: %u\n", gt->info.reference_clock);
> +	xe_guc_log_snapshot_print(snapshot, p, gt);
>  	xe_guc_log_snapshot_free(snapshot);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 4649a260755e..3e97647ee8b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -11,6 +11,7 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_gt;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>  #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
> @@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>  struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> +
> +void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
> +		       const char *data_label, void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size);
> +
> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			       struct xe_gt *gt);
>  void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
>  
>  static inline u32
> -- 
> 2.43.0
> 
