Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E18CA0ED1
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 03:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36DF10E200;
	Thu, 14 Aug 2025 03:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpL35/rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E7D10E200
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 03:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755143916; x=1786679916;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7+J8slgzgGH/Cdj6zkxrZoVwVcQIZdSDqiEO2ufFDzk=;
 b=dpL35/rweNCpzqwA/1ZWXlyZu9Dmap95PnJNMKiQW/BEG8JWGF8eADDw
 0YyYKEMmGn3Cki8LXxrySPW6ptOoXgY3vnpMrv7U2JIeaTkvIsDlEoenk
 TnABtMgS8u0T3C+Mqd+MyRX7dWC09bTCHoc0/JGKciVuVavuPtjlWSgnr
 0XeTOSnaMELxofBIL2y7u53c50t/eFJjV6cgVqrbc7HGm8E+++a5xM8H8
 ZzAAMiaQaUOMFkXDHW29MxPTTyJ+Yul2K25DlyYU3suVNyxlbxiER6A9e
 7rpDW3J98wlPfwaPbp0l1mnUSIpP4HpBmGSBmlVfIf9DNvqWJ+vN1Qbf+ Q==;
X-CSE-ConnectionGUID: 31RXX4NZS2mBObYJWK1FpA==
X-CSE-MsgGUID: nARHQLRrTtC2d043EVKAIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57520212"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57520212"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 20:58:35 -0700
X-CSE-ConnectionGUID: 2ZNay2DlSGaN/Rf6LE7eiQ==
X-CSE-MsgGUID: jwnq6TYiSiGQIX9T8/pDig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171110034"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 20:58:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 20:58:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 20:58:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 20:58:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCopR5jh30HCXEShc/87Gb4gT+ICjdDhH/5hmqGql4IK2RJ8suY6tboLlY8Tv73T/pwmyrkQFJU2oAH12bsPiwSAB9XoP82khaDnLIE5seVx7FKvFKCEgv+18L45IfjA5iLoxi3UWnx5nmklow1R/pDJg5u4YF0cVhhKpcYchfR0XE6qjt+K07F/2tJdpcEqJFgIfvejCfp4Ee6RumcI8L++jaAXrPEW8VACbKm8kfsUdoIvfd9n4ie9//rWPpLW++A7cDcIHQdLqL0ARm/s0EmK+dqXyBIm8jFHbenG6qccDH+kNu7M11mslth72Z1I3WEIfDr6WRzQWlzNBW2SDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzrc8g8TuPqbS6E+54R+t9VQ6/R9B7VlQ1eoSUM3qVE=;
 b=V53i9rdi6eLVm6TsIIWUvOMIC8SahKhbnlUCXviJ5reUvm7IdGEUbD135lq26trTOK/iKlEPkSP7JdsJwC7LAAFp/cu4edNltbeSvzDcVZN9tPhqvyjZYzBH92AWdafxUqkfrdEyOFixZ3s8MkCEsS2Nt4us9jltJawdAUhRGPVZqUEKvzdU0+BcFF2pIlnWywRA0WXRPZer06wfo4ThqgKXHZp8g/ykKgZh2wzXcq8/qx+OjgZ7yy7qq7fJf3jSwhuJlhoDHE14bCE4ey5qoUDaiZPtpI/XG7u0EylwkvGhDqBm+Xc+XUNhFdrcIb6BN2gSxa1Cp/DZ36LmL8iKmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 03:58:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 03:58:30 +0000
Date: Wed, 13 Aug 2025 20:58:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 13/15] drm/xe: Convert xe_bo_create_pin_map_at() for
 exhaustive eviction
Message-ID: <aJ1e5AZv/ozck/g3@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-14-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e108173-e5e1-41a5-15a8-08dddae6d4ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Y8f2XN0sDo8oLjYgc7o84H287bAJ9+cI9jnrIkKTHSNMGy5Sa1urR+MHKF?=
 =?iso-8859-1?Q?fRD3dqb4NQlXiLSuWvGr3BS5j1lMNWzoxeci8OAGssyIEoG6H8bo6QXfk5?=
 =?iso-8859-1?Q?auShS6xPbMB3PCEY+chXP1M0N7dre2xDN2pDDo7Uas8MobOLCbdMXnYQr3?=
 =?iso-8859-1?Q?nETwuM207oEfvELf/sgVAbPRcdpd5qFpdKyWHDdDNceZHTGhRhe/wqHSYQ?=
 =?iso-8859-1?Q?20ts41cKpiYAKjaxNeSvqZME35EOdwa0D4Y92TONEg8X2hcS4z1eJ0Iw3i?=
 =?iso-8859-1?Q?X5kQvCjuUBXWQX2C9zhsbsSEnHzPO1EENfBcOfVZdo0uUz0nWkV4OetPK1?=
 =?iso-8859-1?Q?A28NS1xNt0rviLh2XmJXOpJjlqIeqkf+4mxu5e0damwdvJb1dL59sZgBvj?=
 =?iso-8859-1?Q?8sEeIEABQxlmeeYo5K9XwbFQqpUJsuxndoicGbwiGp843gpCInvGwZRUbg?=
 =?iso-8859-1?Q?9sSAZSeZvAqTn9Ap8sio/UVkKNIzmFQwXhmFS2ap6IRJovnP/1Bl2UdXJ3?=
 =?iso-8859-1?Q?JnkmdgDQ5GfMqqIkXiG1mfrTX1A90m/b5CvvesJwFA+FhalUBmiZcp7PhC?=
 =?iso-8859-1?Q?2S0qdPgx1WzG8qXRcZSYGBYEN8UspHPQo+f8BVz1/OOUfJXMZd5Q/rFOYH?=
 =?iso-8859-1?Q?m9T/FAFxbQz7QPZzO5eKJbYIYer2E0Yfw1JLZFKJQo2X/O6b+anM2NVKHm?=
 =?iso-8859-1?Q?GcHPbkP/0WBGLYSsczGShvIsiBopmuzdiGDOA5wgJZtdAjsydQFpvRwBe+?=
 =?iso-8859-1?Q?H16s8BD0LdZIz+eL/GJiX18q40a8LkFzNb8zQ0wB+5O3fQ+qPwsvGZ6VpR?=
 =?iso-8859-1?Q?OGY6umSsscAmXgRsamsZcoKmwpD8aTOJpMHmpcqRSnzcYX3BvbtlSIFNwn?=
 =?iso-8859-1?Q?8AhZ0WNF3qRptq/YkmwgftqQgzRQawFl/hln6Mekn1BP72AkutXbFpmF1b?=
 =?iso-8859-1?Q?rso68J5JuW2lNObxwQMczBXq8QIVuDVdhAFLjVdZsL91CNv+330rbc78W/?=
 =?iso-8859-1?Q?ztzX7VMUWv407kx9r+aRnxQF6wUOokiQaNqMKh/At2HAQ9c9A5qDpMNfMH?=
 =?iso-8859-1?Q?PnKIlS1VbTRj5npnt+0RGjJM9fnqOiTK7x1Y8nclPZ4BrPcnyAndEQhl0S?=
 =?iso-8859-1?Q?BYJTwI00Ob9OqbIyoIID4zRlZmDaM5FGtA3QevepBngBXc35axpzg+GJmA?=
 =?iso-8859-1?Q?FMe1ARJ1DW+e8CJkQfILOdEKhNIu9wC+egZjlv1b8iY34L0UOkdKIJqipn?=
 =?iso-8859-1?Q?3uRdGlAWGxYA0L51EO31u8Ld+0j4VYhMDwaTVeAIYPVzsNXyzyUhD5ogGw?=
 =?iso-8859-1?Q?ca/Yh4NBMC0OkUlSxuuK5vrHlElWsW+eMm2+xkr3d/s4Mft/DhHddKB/Wm?=
 =?iso-8859-1?Q?6Uhw1nBe4ETrIcpZ/OIexh838rAvHKpbYcBzpVVWWkAfIQabd3mZND7Pm0?=
 =?iso-8859-1?Q?ZHKieoxZ+LQMz4p+R4VZ9BzxGfcfRtHXAwcVlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dJsDTjHUBMXPj/uk3s7x8KGt2xMtMTOxXnH6RwcTuF6YYuXAAdRyHsOOh+?=
 =?iso-8859-1?Q?uE8HuOtEOghEvFSH6PHoW3AffZbj5ULEvgBaLzyJ+N2FizWZN4XHgbzDe9?=
 =?iso-8859-1?Q?0PuwgTfLasFCH8mw1H8b2fr2FEr7Ci600jEGssnJf8xlQqXJ5r8DouVyUR?=
 =?iso-8859-1?Q?/beqsySKwNfvm0AWgXF6o5zYZ7la/smXP2EV+aJNcMcul72ck3R2NFM/VI?=
 =?iso-8859-1?Q?wODvquO04HaytCJY1OjI2UdFwmD9XrpQM9vKnPdYPZvwcgcJ5j4vMv6/1f?=
 =?iso-8859-1?Q?YhGfMJ8BzW4nau3BOra6z4y8W25Pr+j/XQIrQfN/5ahSJtdxhwOSqaAfxN?=
 =?iso-8859-1?Q?GSL/fMaQwrnEKIwLgMaUGb1usAhoxITjj8wEEm3mS6JudRRa1Wvi3ZdF5N?=
 =?iso-8859-1?Q?Fxrz8BqvVVPshINxzJ/KaLIRGjXzf5Mb1AYebSCyUcPsfq+T4rQWWipHgF?=
 =?iso-8859-1?Q?5wFnexc/2L+HoywghPfnj/JEzJbxv0yKX4nDc38DIXLAQ2fU1ldfugyvL4?=
 =?iso-8859-1?Q?5MHw5asY/mh6tykjqSqdGEIR4+6r64LFk2prvjUiSKlDvAQqb9MVeVmzzo?=
 =?iso-8859-1?Q?KZaVIm8fAzHRqfK1xlQ2/S+bFS14JLztrpusI0j3MhFdwn3zLmsmLHuaBh?=
 =?iso-8859-1?Q?bp3KtiUsT0UGSp0Aj9Yoso1cvEoes1VMmxjpOwCYhFAygjXAkKG+Z/SwIP?=
 =?iso-8859-1?Q?CJq58RbEl5cUo1RKyr+Wp9nOjiA1WESpO1h2RoPEMzfQY7I/RZyQqUuTAg?=
 =?iso-8859-1?Q?2HblVMipO3MB6w5ssFYBd1yUQLObpzN9YGRTPYUXehJe/Zy0sxc4Uv7JTG?=
 =?iso-8859-1?Q?MsaQYpSjbhw1HcmeVIS3xUh6uWI+4GJ8CAfBmXoSWt2j9iB7Knl4wifo2o?=
 =?iso-8859-1?Q?4N1R+MueW0DcF7vNfC1Airt+TtSugcCHT4G0r0bBXlw92f7NcmWy/GGJWy?=
 =?iso-8859-1?Q?U0D3Z9Vu/QgKY6UAaauOe91a8qcEmEg0PJlORTGPkxlo9WoUCWxepS5oTD?=
 =?iso-8859-1?Q?dZnUmy7gsksA4BOa9t75ZwaEG1PbPlg4Uxmwy8JAtp0zGwipGh8l18KQSm?=
 =?iso-8859-1?Q?UgVAwfp9H6JeEBC8RPA9W5R8AvBCct6d84EeHQOiTXqFENWn2Mwv42uSqw?=
 =?iso-8859-1?Q?ZeIsct/xnQNTp+OBBbR3xpnIeGwXNGBKcRRVvc0v52SUn1/r+tKAM/23Um?=
 =?iso-8859-1?Q?Y2x7HNq7r9czHKDN4mHbvIoDfQY+z5xYA8bjZ3lChlmbugUgZEUMd7/6jI?=
 =?iso-8859-1?Q?Dx8JfCLssC9mYIBT/N+Bp2voi3cfusSZaoR4RqPrcRbdyZ+MCcWJQW+s0Q?=
 =?iso-8859-1?Q?r3uwhUsOCR9xAVT7p0IcZaxGeJEy7Nlto2QKI68GytdB0TmCJ8oQY2LiY4?=
 =?iso-8859-1?Q?I4J7XxqMjGUNA64uPDPUj/JAL2nViPK3uT09nAJ8XiQFNkOQwGYGrwGxKF?=
 =?iso-8859-1?Q?ghBLxkTPWKHgImQ8VPCKM8E0D7FqHqP8Ey9msFv4KXu3bKrbRNQY9fYLlM?=
 =?iso-8859-1?Q?8hEqHRuXYiltka/WYoggafZ7akuw1I4G1+6Ba/IVgVYgaQY8UCl+Dd8ukC?=
 =?iso-8859-1?Q?jWlTmxqdzAYMDRmWhkqCKnSaOOyUult+itzlial43AMb/VN7/esanH5gsk?=
 =?iso-8859-1?Q?EepfotFqIe+GBjPduDoAbxB4kIAs4g2u4ppm9zokZQigkOC9Nfg1Olvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e108173-e5e1-41a5-15a8-08dddae6d4ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 03:58:30.8081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvKiBaKpJh/elWTXIQ6VuQLskReTSJSuqhyDatY1mDFw0ZNWGeq/+rUAl+gsIOtAn/oRCfF94cYTs9c9ruYg7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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

On Wed, Aug 13, 2025 at 12:51:19PM +0200, Thomas Hellström wrote:
> Most users of xe_bo_create_pin_map_at() and
> xe_bo_create_pin_map_at_aligned() are not using the vm parameter,
> and that simplifies conversion. Introduce an
> xe_bo_create_pin_map_at_novm() function and make the _aligned()
> version static. Use xe_validation_guard() for conversion.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  .../compat-i915-headers/gem/i915_gem_stolen.h | 24 ++----
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 45 +++++-----
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  4 +-
>  drivers/gpu/drm/xe/xe_bo.c                    | 83 ++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h                    | 13 +--
>  drivers/gpu/drm/xe/xe_eu_stall.c              |  6 +-
>  6 files changed, 101 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> index 1ce1e9da975b..ab48635ddffa 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> @@ -21,9 +21,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  						       u32 size, u32 align,
>  						       u32 start, u32 end)
>  {
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
>  	struct xe_bo *bo;
> -	int err;
>  	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
>  
>  	if (start < SZ_4K)
> @@ -34,25 +32,15 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  		start = ALIGN(start, align);
>  	}
>  
> -	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
> -				       NULL, size, start, end,
> -				       ttm_bo_type_kernel, flags, 0, exec);
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		bo = NULL;
> -		return err;
> -	}
> -	err = xe_bo_pin(bo, exec);
> -	xe_bo_unlock_vm_held(bo);
> -
> -	if (err) {
> -		xe_bo_put(fb->bo);
> -		bo = NULL;
> -	}
> +	bo = xe_bo_create_pin_map_at_novm(xe, xe_device_get_root_tile(xe),
> +					  size, start, ttm_bo_type_kernel, flags,
> +					  false, 0, true);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	fb->bo = bo;
>  
> -	return err;
> +	return 0;
>  }
>  
>  static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 43c45344ea26..d46ff7ebb0a1 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -102,29 +102,32 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  				 XE_PAGE_SIZE);
>  
>  	if (IS_DGFX(xe))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size, ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_VRAM0 |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size, ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_VRAM0 |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	else
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_STOLEN |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size,  ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_STOLEN |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	if (IS_ERR(dpt))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_SYSTEM |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size,  ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_SYSTEM |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 826ac3d578b7..79d00127caf4 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -140,8 +140,8 @@ initial_plane_bo(struct xe_device *xe,
>  			page_size);
>  	size -= base;
>  
> -	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
> -				     ttm_bo_type_kernel, flags);
> +	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
> +					  ttm_bo_type_kernel, flags, true, 0, false);
>  	if (IS_ERR(bo)) {
>  		drm_dbg(&xe->drm,
>  			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 23b28eeef59f..c9928d4ee5a0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2253,29 +2253,20 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
>  	return bo;
>  }
>  
> -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> -				      struct xe_vm *vm,
> -				      size_t size, u64 offset,
> -				      enum ttm_bo_type type, u32 flags)
> -{
> -	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, offset,
> -					       type, flags, 0);
> -}
> -
> -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> -					      struct xe_tile *tile,
> -					      struct xe_vm *vm,
> -					      size_t size, u64 offset,
> -					      enum ttm_bo_type type, u32 flags,
> -					      u64 alignment)
> +static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> +						     struct xe_tile *tile,
> +						     struct xe_vm *vm,
> +						     size_t size, u64 offset,
> +						     enum ttm_bo_type type, u32 flags,
> +						     bool vmap, u64 alignment,
> +						     struct drm_exec *exec)
>  {
>  	struct xe_bo *bo;
>  	int err;
>  	u64 start = offset == ~0ull ? 0 : offset;
>  	u64 end = offset == ~0ull ? offset : start + size;
> -	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
>  
> -	if (flags & XE_BO_FLAG_STOLEN &&
> +	if (flags & XE_BO_FLAG_STOLEN && vmap &&
>  	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		flags |= XE_BO_FLAG_GGTT;
>  
> @@ -2289,9 +2280,11 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  	if (err)
>  		goto err_put;
>  
> -	err = xe_bo_vmap(bo);
> -	if (err)
> -		goto err_unpin;
> +	if (vmap) {
> +		err = xe_bo_vmap(bo);
> +		if (err)
> +			goto err_unpin;
> +	}
>  
>  	xe_bo_unlock_vm_held(bo);
>  
> @@ -2305,11 +2298,59 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  	return ERR_PTR(err);
>  }
>  
> +/**
> + * xe_bo_create_pin_map_at_novm() - Create pinned and mapped bo at optional VRAM offset
> + * @xe: The xe device.
> + * @tile: The tile to select for migration of this bo, and the tile used for
> + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> + * @size: The storage size to use for the bo.
> + * @offset: Optional VRAM offset or %0 for don't care.
> + * @type: The TTM buffer object type.
> + * @flags: XE_BO_FLAG_ flags.
> + * @vmap: Whether to create a buffer object map.

Can we stick vmap into XE_BO_FLAG_?

Also why do we need argument now when it what omitted previously.

Matt

> + * @alignment: GGTT alignment.
> + * @intr: Whether to execut any waits for backing store interruptible.
> + *
> + * Create a pinned and optionally mapped bo with VRAM offset and GGTT alignment
> + * options. The bo will be external and not associated with a VM.
> + *
> + * Return: The buffer object on success. Negative error pointer on failure.
> + * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
> + * to true on entry.
> + */
> +struct xe_bo *
> +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
> +			     size_t size, u64 offset, enum ttm_bo_type type, u32 flags,
> +			     bool vmap, u64 alignment, bool intr)
> +{
> +	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct xe_bo *bo;
> +	int ret = 0;
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
> +		bo = xe_bo_create_pin_map_at_aligned(xe, tile, NULL, size, offset,
> +						     type, flags, vmap,
> +						     alignment, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			ret = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +		}
> +	}
> +
> +	return ret ? ERR_PTR(ret) : bo;
> +}
> +
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags)
>  {
> -	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
> +	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> +
> +	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, ~0ull, type, flags,
> +					       true, 0, exec);
>  }
>  
>  static void __xe_bo_unpin_map_no_vm(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index a625806deeb6..d06266af9662 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -109,15 +109,10 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t s
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> -				      struct xe_vm *vm, size_t size, u64 offset,
> -				      enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> -					      struct xe_tile *tile,
> -					      struct xe_vm *vm,
> -					      size_t size, u64 offset,
> -					      enum ttm_bo_type type, u32 flags,
> -					      u64 alignment);
> +struct xe_bo *
> +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
> +			     size_t size, u64 offset, enum ttm_bo_type type,
> +			     u32 flags, bool vmap, u64 alignment, bool intr);
>  struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  					   size_t size, u32 flags);
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index fdd514fec5ef..afabfc125488 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -617,9 +617,9 @@ static int xe_eu_stall_data_buf_alloc(struct xe_eu_stall_data_stream *stream,
>  
>  	size = stream->per_xecore_buf_size * last_xecore;
>  
> -	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
> -					     size, ~0ull, ttm_bo_type_kernel,
> -					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
> +	bo = xe_bo_create_pin_map_at_novm(tile->xe, tile, size, ~0ull, ttm_bo_type_kernel,
> +					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, true,
> +					  SZ_64, false);
>  	if (IS_ERR(bo)) {
>  		kfree(stream->xecore_buf);
>  		return PTR_ERR(bo);
> -- 
> 2.50.1
> 
