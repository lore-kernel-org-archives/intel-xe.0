Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C04FC5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 22:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE9110E631;
	Fri, 21 Aug 2026 22:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biFS0/0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E473610E631
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 22:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787350144; x=1818886144;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=M5/7MS33YYWcTAZEMd9C+asC4H7/h5J4df9ipiUpS84=;
 b=biFS0/0dhyRHJOH5orHVOCFqZtcOKWnVGmovxzCweis1Y1je+cuIh46A
 rckoyl4OJjLCCU1RVTCkCRsB58XKHSB/SW6nxW6mE6GfIl/dZc4FfU0R1
 48rk2CCmb3Hrjwxx8vN+rjvgJ5i3PzY7aWPdY4nwv/dIRzrq1tNlphZeV
 9h/NFN7yjygkbHTwny+IkV7UTQWo50WsqvtYQP4XeSCHWsZQu0bbNIa1x
 BmUiwv67cNOYYoNLX9MrfyrxrLfS8xeUHqJij1Axl49RL/7vBDzBvhX1c
 3GTSS7AO72/lK9cdiF5uTp2W3YocEHzv6kAickr/sdrKJAQLgR9UiXmjo g==;
X-CSE-ConnectionGUID: w7TNwmv+TK6J2oyCONeEGA==
X-CSE-MsgGUID: Dr6hSB79Qy6QWL7bV6BX/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87919366"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87919366"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 15:09:03 -0700
X-CSE-ConnectionGUID: +3+hbnPRSReEFHAmCtCkkA==
X-CSE-MsgGUID: zdeD6nmEQTabbWccAJoVsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="289989349"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 15:09:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 15:09:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 15:09:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 15:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb1UWW+sz+t7xz96iH3LVzTs3tszBqLUDFn0Cgj8VRMv57JX+OxHDJlwzywx6hnXM30yykc2utxwKC4MynAanYNn+S8Rvf68etFmYNgNbJWjiiPqeaGSpvRUqjjhLXgelGE2JWyyiqs5B3kDUOe2Jj8Gi+6UKW3MGt2SeZBB7Ak2nGTQYtG53hkDvjFsDhzXVvJ2A8eRm2udS7BjlAeVSnbK+DLjvx+2lBDv/VQ7FbAvtTGisYGtTxjyabuPElBpDKoe35o2vLYXmxNMpwvxtdehCUrSbxGiXmcNnCua5clAJLjNff4oofZsznrElTUduXv87iPIK6e9PmwEEu4CkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd7QsZetubYEoM594MX6c1bkP4BuluiXqVJ+zJRlYEA=;
 b=H7YrKLuqVqxehQVKuGVXpXjYtc8MUQ6lBOZitK3ScKRRn6FTcW7GfyycZ1eCt2V6c8YkBXcC0/zQ8dug1NnuuT3hoGTNpDeyinnOKCPivOAZPiYnw6AOBzwSZdTmEc1LB4tGbFgBzZjO3fEgjT+C6PQwviq6oEBA+nfXvFhCW4u00Ri22di1E3Mtf1CfzFzeiCMs+GvFhor2COeoO56pyuz1E4LoLXfvSLoVHnEl9FlrWu+N5isizCgFkTzSJpCFNmEoNnaa47UbG7Ty9OxZQViCCr18HhzWwQWt5jsB0HuuZ4/VeqFmh1TF5bTRgXYf1hx5fSXOLzVOAwh1cZuHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LVUPR11MB9566.namprd11.prod.outlook.com (2603:10b6:408:39e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 22:08:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 22:08:56 +0000
Date: Fri, 21 Aug 2026 15:08:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <Michal.Wajdeczko@intel.com>, <daniele.ceraolospurio@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 04/10] drm/xe: Add a new debug focused configfs group
Message-ID: <20260821220853.GG681121@mdroper-desk1.amr.corp.intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-16-stuart.summers@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820210639.107524-16-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LVUPR11MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 780232b3-90a2-4ff3-f7d7-08deffd0cb2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|3023799007|4143699003|11063799006|10067099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: m2ZcYPpFpP05LJBYkcdcWKMupfh1Iek5rxYJc7dNgTwvuEGZAe+1oaPkVjZKvzFpJ6yzVjIllTd55UNF5iKsaqjSZMkwcH/m40XimL4YG2jyYL3l+a0usCDvcKFo4QZ1SXa6O6mjUgzbSQXOrGdGSGC/XKQFxgm8qxs6Uci4HqB8XryyrSOG/b9CSifs8Wd4KIg3K1BFhWbRysF+yZl51I0+T0x03LrFictfFhdNLIZWUDoSLyQYfKk2Lb63Zh/6ejhBrHxujGIklyWeR0BfiCjhEA4lgFCZn46upPxuqCqqMNbw4w+BrUlug8Ai4KCVACXdo48pHeXGJ9gyiy1Y8rNecilWp1MiUsyvpkIhhQxc5gOoAmObCrhzDErznxMVxlpfOME/AbABAKKyNqJzMhegyv3re6uTrqqq/S5fLrxn/emtNCS84gFc1yREvj8E/LtXpDsOFckc292rCSbDaThvtNtfgZuNDVh7AyrgG9xy2/t0vIYrbrLf3+S5M0CKGvgxpxTs6WynrEYNxp/6GR0nQtgMUKqJiEeNASNSte4Y7xVo01a4DzYxc+byUvQ4NQzQ//IyqVB85dGuR1vXYoUaEIVk6y9X5EFOHxREvTVJzXxFr0Ifjr84IArdRomxzsQCJ1qWj++9pmCKDRbU1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(3023799007)(4143699003)(11063799006)(10067099003)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iP2rtSj5LeZ87DGQyzcBlUPlKnBQcExhUjiVMHjpz49yRq42MojDjdOmPg?=
 =?iso-8859-1?Q?0sU00ZPskRNZUA6fNKqGJIoDdLbQRQmIpITa0NNBkKeCXeneayCF6XbXUn?=
 =?iso-8859-1?Q?MVLcGi/JYZoDQIwnHMlYeK5qCrWDi0rTFdKhJY6uiS8xGoyIS5IReVUFH6?=
 =?iso-8859-1?Q?pEiY2y6yprfWnNvPHXd3PiUFZcZNVUsCJld5ewrSaCN3v2tVxyUWJz4bZZ?=
 =?iso-8859-1?Q?8XoLcO44u0U/uWptGT4P67wyfAuKmL5zHNzgTbEqX2nyyIh9DRB9KRKAdp?=
 =?iso-8859-1?Q?LWFKYz32z9i4mzUDcRF13KUjZKMgIZYYEsbM0Do+8eGfVpXlqJAhOlFfKh?=
 =?iso-8859-1?Q?ekwO7ilr5zVasz3lT7Uirx8mBnv6/Ircz0vQ9Van18cYwocRpyh9kV4yTF?=
 =?iso-8859-1?Q?4KLL+VbQfHbnNei6S8Uft/F+OHATqjtnReaFbnDDOx+OD+gFLxDbfkrcQL?=
 =?iso-8859-1?Q?YpDbONZpAAjxilx3Kq2w3vC58MCT11nky35c8Uktl3XEvh7mgkt5G0DSOD?=
 =?iso-8859-1?Q?zjwDd29wWxryr26zriVYmB7nM34NcYSkiEsyjpUb+UZlqZjasqpVs9yhvF?=
 =?iso-8859-1?Q?9ZJo1PDxkm+nPUHpXeiHHEfv9O6B8/ltmqYhcyPjyYHrmbga4yreRLRX/z?=
 =?iso-8859-1?Q?JucKf6+QwuRG8oeZslSaoQEjsFRbGkZRYFLh4oH8KG84uxDkjVL/lAc7/g?=
 =?iso-8859-1?Q?8A/dUnxABES/c7ta+yEKd1hIa+W+JLO4uXKvx0zxLSR7q914loyJS3dzIR?=
 =?iso-8859-1?Q?+aLHYKfloisawv2LuefKxGCN4LVqymYhosjo6uadOdbDvERZTi3ROwS/Db?=
 =?iso-8859-1?Q?NF8RqbGm/7jR1Fvki7TLSoKMFdCftySCMe/s14r32607nCRBmaiOTt/ZMm?=
 =?iso-8859-1?Q?BOjT/ILWOU4XTKNSYb7zsQjm7hPiCW8n807wX32x+6NEAvkkIQV6ODGxun?=
 =?iso-8859-1?Q?zRwBcURly4ElhjmzjPb3u6mMwlBNpninFf9aPVz1Mmif6LBICy2vYvBQf0?=
 =?iso-8859-1?Q?epNIsYpiour09E0gOCPXPFLYOmFf/y4lRHVcBDhsyHyx4fApjjhdfmJokV?=
 =?iso-8859-1?Q?M8ciWwW3Vs8lCxOS9JWrkxHXkKs6Z/uU+0KOfwZhmQaIFUp8aFD7qXSFeG?=
 =?iso-8859-1?Q?gjTugUdbrnKGJnF6DR5XILMXxG7gVrmFqeQptZKxevez3bEMV51pyRtnpt?=
 =?iso-8859-1?Q?8azViprT2JuIsz9Dy19WB6tWmAfdK+hp2hrXuqYlY4f4a8TPjdoA9GOKOX?=
 =?iso-8859-1?Q?xGKZez+6g11aYDqNBk4mswVj/RS/5moLm5PcDag0zaUj7pdztUhGfjhzPD?=
 =?iso-8859-1?Q?ocxbpIlsDo/AOa4Hxq/7imUPO700hjIR0aEKivLtuM1VLus+ZiPLEOwTO9?=
 =?iso-8859-1?Q?QAU1rhNAnuk9wbsSyYzmzVDMqeQwPzOsgd4AY5mpxf/luHPyBMDv1vhvGd?=
 =?iso-8859-1?Q?g3a4mtUsYhtVoV5H60Jc4JY60GD0ZS6H2TtPfo0e+l/6QVuj2DkGsPvlch?=
 =?iso-8859-1?Q?tL5XPCz4JCKbNkD1nnxZsIVdr22Fh7fPaEV++LdzizsVFKlZ7e9HQVL+l4?=
 =?iso-8859-1?Q?D4TdhhHLbZGLShGR2qy7kZig6dyAgO4yqRR12LEtrF4g4xu0Tk9iAKJyC2?=
 =?iso-8859-1?Q?n1IzUcjbo2bjwc5+TQSfVdKs9satr+sWlW+92eFgA6RYAbwLnzp7aY/CMp?=
 =?iso-8859-1?Q?0+04FjcyU1K/dnuhAZxR/uwO7SCs4dwSSiob6wPs8GhwJG10wsF4Ubuz+P?=
 =?iso-8859-1?Q?6BTgPR4GJpY8Czx/DAwjVkxVtTR5FdjdADVT1Cwdz/nTkz02wvCcFCR2bO?=
 =?iso-8859-1?Q?lE+0S2O1qNkojoO3cLJs4j8JAlkadvM=3D?=
X-Exchange-RoutingPolicyChecked: TpscAQW6OfDOWabiHEjqjhrOg2HPb4YBYwjTjDtjzGDlMxbVMExBqVtB8ifgxevllUh4eDQiZEVekneIfHkVouPcmL2jxs9F/p4jmre4CHllDZo0PsYoNUM402VvYappXx+UGVS8naGZbJ1hhYpiOZpECGJUBacoFhdS02y6Nm5Q7SHvCogeNsIbMZBh98scXg8+cBjVpvNx15P1/fcWC1/kqc0f4ANd+8nS3Ca19hM5WjhTxgnA9/g3jrr9yqMdYUEvc2avld3oEtT4VlGWmHtGkee5/aU4/CsUcWV+LHjf7OYoyDEcppfU0GRzhHrVTiuhfspe+xkaDoDEmNK6hw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 780232b3-90a2-4ff3-f7d7-08deffd0cb2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 22:08:56.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4WnGpIh3BZIyV/aKffrPT9VXH4Dc1ypqZ7Xmfy4BFl8DqI5ubcKNXSNyxKp+9pahWPN1klx2uhUTvSpxm73YrDOOOW1E9eslZIwdqrmVIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9566
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

On Thu, Aug 20, 2026 at 09:06:43PM +0000, Stuart Summers wrote:
> Add the skeleton code for a new debug specific configfs group.
> Just add the structure for now. Actual debug content will be
> added in a subsequent patch.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile            |  2 ++
>  drivers/gpu/drm/xe/xe_configfs.c       |  5 +++++
>  drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs_debug.h | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_configfs_types.h |  3 +++
>  5 files changed, 37 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 92134709d998..0b71f311c9c4 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -163,6 +163,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
>  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o

Not really an issue with your patch here, but since we're messing with
kconfig stuff it reminds me --- I'm not sure our pre-existing configfs
kconfig handling is entirely correct (and I think I've seen kernel test
robot warnings about that too).  The concern is that our header file
does a typical IS_ENABLED(CONFIG_CONFIGFS) type of check to decide
between extern function declarations or noop stubs.  But if Xe is built
into the bzImage, but configfs is configured as a .ko, then Xe can't
reach the configfs functions.  I believe there's an IS_REACHABLE() that
maybe we should be using instead, although I haven't got around to
actually looking closer and trying it out myself.

Your actual changes in this patch look okay to me.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o
> +xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
>  
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 029c9f682c8e..33aea1150c86 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -14,6 +14,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "xe_configfs.h"
> +#include "xe_configfs_debug.h"
>  #include "xe_defaults.h"
>  #include "xe_gt_types.h"
>  #include "xe_module.h"
> @@ -1242,6 +1243,10 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>  		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
>  		configfs_add_default_group(&dev->sriov, &dev->group);
>  	}
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	config_group_init_type_name(&dev->debug, "debug", &xe_configfs_debug_type);
> +	configfs_add_default_group(&dev->debug, &dev->group);
> +#endif
>  
>  	mutex_init(&dev->lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
> new file mode 100644
> index 000000000000..45617282cec5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/configfs.h>
> +#include <linux/module.h>
> +
> +#include "xe_configfs_debug.h"
> +#include "xe_configfs_types.h"
> +
> +const struct config_item_type xe_configfs_debug_type = {
> +	.ct_owner	= THIS_MODULE,
> +};
> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
> new file mode 100644
> index 000000000000..5f938450aed2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef _XE_CONFIGFS_DEBUG_H_
> +#define _XE_CONFIGFS_DEBUG_H_
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) && IS_ENABLED(CONFIG_CONFIGFS_FS)
> +struct config_item_type;
> +extern const struct config_item_type xe_configfs_debug_type;
> +#endif
> +
> +#endif /* _XE_CONFIGFS_DEBUG_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
> index 3be7d6160b4c..e22b9424f719 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_types.h
> +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> @@ -22,6 +22,9 @@ struct wa_bb {
>  struct xe_config_group_device {
>  	struct config_group group;
>  	struct config_group sriov;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	struct config_group debug;
> +#endif
>  
>  	/*
>  	 * Fields sorted by type (largest first) then name: struct arrays,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
