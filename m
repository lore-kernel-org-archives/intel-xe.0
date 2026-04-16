Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3993CF8D776
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 20:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0035510E1A4;
	Thu, 16 Apr 2026 20:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVSQwbro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4B10E1A4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776370189; x=1807906189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RHe+BXyxbFkv7T62qydmoS3OprRnzGMWxo8JhMf3Pms=;
 b=lVSQwbroJiBRaNPHwpeWs/kixFbUnxujBhcgL3UZVXArsbNIRD71fR8y
 7N2RZvPI5i8yjcbhe5dQ26fGjtkYcknfXBb2LC+Aqv7Ew85CfSTt62TC5
 n3/ECGgqeJduJ2/yxMiaLx6u0lJDj/elPtajeV7yQqANjGW8RobiJkuZb
 3gExvIY5uPvv1ZQxhETu8fRtYrrVPg9T755kLZ/ZTscgJDMx8Ytmigw2V
 24jltHGDJtorMalQNadoLQK7Xlc1jXh3W/qFIXFbisJUVQhwvF80WCWpC
 VW7vvTIz4JF3ta/Fk6fxzq4Lc5uNXPyl/O7EVexYTJlimBywK01thW/s0 A==;
X-CSE-ConnectionGUID: Ov1hEjO0T7SYhyqeoVS7rQ==
X-CSE-MsgGUID: Kp3gZ3lOR4CVXzeTOXRLpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="100030876"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="100030876"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 13:09:49 -0700
X-CSE-ConnectionGUID: H76Pb0x4Tv+uhf5sKxunHQ==
X-CSE-MsgGUID: OT4K2NFwTVyYD2ozULfpWw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 13:09:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 13:09:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 13:09:48 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 13:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYiP6FbHC38/20LqaIfDk46+/DERHRshx39YdFt3k8FudyRgpmUvYL7xcwpPX637HWwljgrKiYPTq+JCEhNRHpD1cWPXbDvlVm++PkMtscDjz0Z5hQdcCSiy/0lDm7TEsHfSDi1BGuIpWYFEsYhNEkuVrbomzS08OxZ09MJk6hggbIk7LnXYY9Txp79TRN/ySzVj1vTWgGk7CoNbZkD0IA94VkI+RDwL9FChSuk+WWHxVVW0hSirbAoLqO0PpD5gpVnq3Lxe7cVWZUn3UKDBM1smcLRQMYggD4Awt2lv0kx/6x1NwvnBQ7/wI+JmgbvZlFdgyDPEYZRX+fgQIuWnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqqIq2l+mU45bfnXpJUpwmZ8ZB1XH95F45K9hh1FesA=;
 b=WOgacaiITczRxNhZeAthNjzjd5/KcdKFszU0WyyL7o1LgTgn/Rrj+QQLmhA6na+nJ+NOcFO2Iy+VatKVCrSzO6voXCKSEG8wg5DP+IqZevpMtK8usAyfYjsWaahd0SVgGcycBlMlwDBk5Tgv0CQ3E3Q46TGRk2LMve9dM1pYG2FoWZrx0zkOzeeECqHqkAyU5uiD7wXTWyNRmeDy6zMbnKUysfHksxQkMKrhj78YeDKI68eu6XFSbT3tDZ1r6wTsz3DVNgY2B9KkjKTYVW+FehUjpX+lR4+28lhsgYzD5HAJu51Of4dIdRqnDWry1vVF9rOvJERbS6HOY9eBkXG/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 20:09:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 20:09:42 +0000
Date: Thu, 16 Apr 2026 13:09:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Feustall?= =?utf-8?Q?=3A?= Fix drm_dev_put called
 before stream disable in close
Message-ID: <20260416200940.GI755471@mdroper-desk1.amr.corp.intel.com>
References: <20260415225428.3399934-1-shuicheng.lin@intel.com>
 <177630388373.466823.2256317328873350420@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177630388373.466823.2256317328873350420@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4695:EE_
X-MS-Office365-Filtering-Correlation-Id: 192a168d-83b7-4cb4-cac2-08de9bf418fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: H6SeRFUzHsInLHpwAgGwRy0y2IqegDFHee9ZH43EJQT5bvcQGpUqNX+V9LeLaHqzJXayu4k0NvN6p17lGXEHnolUGOxK/Gjd+/2DWlRbYcjpnGQ2aev3Km85dZdoD9sAVBXijEXXvr+GRb2miJki240TEnMA8NPG6AF8kL8BLqO4O2VKS5X+eChRukoIyL5OK0vKRrPa/gpX8mdS1oEGTO2JJaCqFaYFbc+gBpfZbYN1XDauUcU/r7SH/oKO7Pwy2OvXDF194vJMA+NEka6bysxeZ4cDTuInF3q0yAw0Ocv28r8ezn0yMyv2Fo0ra+kvPLxt6nHgr/HTFIgYKfljSr/IDGnSN7zrEGNusV0WVRK/dN+luuTfEXmI4xZxCwSAls0viazoNiPOOw1ZJaerHBhz+HKlp6ldFRgSnwdUszsEkEHH299ABl6bdo+zsBUfC/PbQpVMc2Da8XSrA7PBFxDyvA1Hs3ud8wFw/ZYJNMsq/j3s5OJz0enXDtLw99DjPiSN7KRL3qnBROnyLcs/a+Z4/apcXfAjrgzP6lsyubeBdl85gQ1kGSJjs9MswSETuMBwpn/GYN2faZ8cvI9tq53obBw3gcBn7cxN/AsLE69BX5idLOeojcJy/r06haq5d9KiTlwl2PWFLVLGK41DpG42OLem6sTR39pKyA7UZ/EMcy0T7l9xIHpNy1CgtETd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VrnMdq2ii2r4SAAwO6mzUInxVykxE1Tpjag2mZ5wPUn5YT81Prx1oZYtwFD4?=
 =?us-ascii?Q?x7Kz8+Eautpw0NKJlS5HkncR3BNT4rf86hIOVxlCclxwN1yqvS0wxYhkx134?=
 =?us-ascii?Q?tLp3KAF0o7XMWv7tnFNvw0G1r6XOLTFc3xZymWiLNJICd0AjaGR3dcIkHWh/?=
 =?us-ascii?Q?9OuxHduK3A90p1dIQeGCgR2Aj/nshZS4fAq4kHIjLSO36b6y/2ZIQjk/FQpi?=
 =?us-ascii?Q?/Z27miV/wrNzivzfGFW5Cay6pm87FFkUI143YiMVAwehqSkEtO6Q2esf2WX7?=
 =?us-ascii?Q?uHJMH0HQggabsI7u5sXpTuIkOkkI1PrYpup/ex21O6Jqh05AQYKxWTAFqzDC?=
 =?us-ascii?Q?eZ9cD61QpIqW4S8A2cWKqbZJ2Vs0RtncPuqtSsY7Ttpcs3t/17LpK0vmAYQC?=
 =?us-ascii?Q?Z1dhfu6a6yq7SDgWXy26hOiVqRoYy2aSsR2BvsAQ6R4feqAaAi/WOhbSgkul?=
 =?us-ascii?Q?rGmkfJyLeHXfMkFiMG5vEoQN5cdS8dYCKIa7o/m+5Odpt7D7JBCU+ydxYPXz?=
 =?us-ascii?Q?uT6uhv3+cF5mkYBU87ZwfPuZM3AntHlSvcscLt+52YTRyvdNCZKnDBMn0RPQ?=
 =?us-ascii?Q?jcxGz4T3ykewdSjEPgUcGPfqUBVWEnFAFMXSNEk+ay7BZOa+Pf/XJyr3XvFW?=
 =?us-ascii?Q?W99bk36wFSg57Gc92sUfvXZzJtTEy6deeVTv7YMqMkDHHH11MnJfzFvgOy/8?=
 =?us-ascii?Q?t3aMKNMaMtRZnum8o73hxrdxaTVexATJgJBWTDL33EZuCM79/fHIq1Q7jiro?=
 =?us-ascii?Q?tdTs3bpSXTksP7U1+Ve7eImEOKnxvzHQuceRpSD3n57wJoOeYkSV4EYMTu8c?=
 =?us-ascii?Q?EbVxM0wQx7MN9Uh2LfJKy3JHt5PHvS6uUJaoDOwkTqwkIEllQggSmVgTxe8n?=
 =?us-ascii?Q?y4uQ4grx7GnC5Bmh1OH1xB0pERZgI4/1VVhx5lEeWGoNiXXtdh6yXG/T7pmw?=
 =?us-ascii?Q?5/OQ+Td3oKx/itwKjSsUbEAFmCH7xmtvBcItUav/O7b5IrUSzONVLRXouka/?=
 =?us-ascii?Q?OFUnjnzlUto3JazNw8uyw5h3M8lYk40n+dayteY35Fj8f94DilPOGZtCmx7w?=
 =?us-ascii?Q?3jmMh+etfMcVLwLGDT1fSVJrAB+i0fdnHTJDibmpWoZ7H0918bbqnlzgHbYV?=
 =?us-ascii?Q?FOTxog8o6fqTd7aXom+NCJh0TQ9wF43d9pV/yXAx9aX95hrMAJlheEGWwsZa?=
 =?us-ascii?Q?M/j2xULlUIx3c9/W+M1HL7RcQi1Plzr3xLvr2lrqT7MoW3cWEyI60aWez1Ow?=
 =?us-ascii?Q?73+CmHOkiwofSSLm2tDOdNbKLNjv4/EmbRicxSWc6+HeM8F780U6owMSSP91?=
 =?us-ascii?Q?UBARXwpH5i2gy8Ex0XNrA6tW0dqK1VSdzGqSMOLV3OW9v4mYgPjqsmIKZG76?=
 =?us-ascii?Q?EHM76OV1x2boABqZ56OTa37laKWG0b0BPjs0oBUluuH/6C/xoQs42MsiA0Kv?=
 =?us-ascii?Q?l7/Wg4hy6DS0Q9iPBZI4arGB0TwRYv1fkVaANQ45YRjMS33Fo9PZeWycb8F2?=
 =?us-ascii?Q?zlUhM7IQPdSpL1bJtJyaxEmgwIOezd7XnCIb0lL6/Rbq3Xpsx712sJz1jSaa?=
 =?us-ascii?Q?kVxom39YDbr4YF3dB3HpXPQws0K+Lx7WWnw1CwJJBgVegVbY/9q/aUfFOA34?=
 =?us-ascii?Q?2FHEtUY67ygn5gMyPphoYDheCrvii4sbGMXbN3FfBC30gHGtAuGbog1Swg7o?=
 =?us-ascii?Q?sUvtqD367PswQwuPBf8S6aGyHE4+M75zAlXvTxq38m7SZT3eBKrlbNAj1m2s?=
 =?us-ascii?Q?e9nUk/i94FNIXchQsYXwnHRPaOnVPgY=3D?=
X-Exchange-RoutingPolicyChecked: l5QHHD55kYpau3aOwtEHzDZeks/MrQfgow0yE+zxvzIclZhVu5RpIbbKyNlIGT2RS9apguhenLbMKRWeRKp0JlcQhaX+tf/Ehh4FtLhYxEYwlo3tJ+N080A3bq5UfS+KksjlNRDFw3VxjDp4D8M65ttOyEhMcG9d2RPiaD3BwJGURQ0kc9LhFVvno8qlHunbMrAS3xg9sM46F/vVPi0KHd8qDsI6WPGac3nxZ2pIHKdPu4wVjfOqPpY49eXNb2iOECAazBQgIVuQekU515FWzn3Ti67Y2//a99/Fb6EmGSReo9ytutrdx4rwKetYy0YYPE03fu6WYCaisGKfdmFEog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 192a168d-83b7-4cb4-cac2-08de9bf418fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 20:09:42.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyoBTYI9Y9d6A8nXK7/vpgGUOOdG4EuQaZVSOE7F7SWbmfohzqjsztDHFGAr1Njj4uypQkGeIkeiaO7cjcMo5yC70saHGKIfblwg27z4d7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
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

On Thu, Apr 16, 2026 at 01:44:43AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/eustall: Fix drm_dev_put called before stream disable in close
> URL   : https://patchwork.freedesktop.org/series/164952/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd_FULL -> xe-pw-164952v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-164952v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-164952v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-164952v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-bmg:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@core_setmaster@master-drop-set-shared-fd.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html

Looks like this is

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7567

which was closed prematurely and is actually still happening.


Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-164952v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
>     - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] ([Intel XE#7084])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#3432])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325] / [Intel XE#7358])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6974])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2244])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-bmg:          [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#5208])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_flip@2x-flip-vs-panning-interruptible.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#5545])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7179])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061] / [Intel XE#7356])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-stridechange:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-stridechange.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2311]) +5 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2313]) +7 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#6901])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7283]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1489]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2330] / [Intel XE#5813])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-plane:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#6503])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2426] / [Intel XE#5848])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#4459]) +1 other test fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1499])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_vrr@flipline.html
> 
>   * igt@xe_eudebug@attach-debug-metadata:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7636]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@xe_eudebug@attach-debug-metadata.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][33] -> [INCOMPLETE][34] ([Intel XE#6321])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7136]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html
> 
>   * igt@xe_exec_multi_queue@two-queues-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6874]) +6 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-priority.html
> 
>   * igt@xe_exec_system_allocator@many-stride-mmap-prefetch:
>     - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#6557] / [Intel XE#6703])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-prefetch.html
> 
>   * igt@xe_exec_system_allocator@twice-mmap-free-madvise:
>     - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#6703]) +28 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7138]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
>     - shard-bmg:          [PASS][43] -> [ABORT][44] ([Intel XE#7578])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
> 
>   * igt@xe_pat@xa-app-transient-media-off:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7590])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@xe_pat@xa-app-transient-media-off.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7599])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@xe_prefetch_fault@prefetch-fault.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4733] / [Intel XE#7417])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#944])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-bmg:          [FAIL][49] ([Intel XE#6946]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   * igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync:
>     - shard-bmg:          [ABORT][51] ([Intel XE#5545] / [Intel XE#6652]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-2/igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-9/igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          [SKIP][53] ([Intel XE#2887]) -> [SKIP][54] ([Intel XE#6703])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [FAIL][55] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][56] ([Intel XE#6703])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_content_protection@legacy.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x85:
>     - shard-bmg:          [SKIP][57] ([Intel XE#2320]) -> [SKIP][58] ([Intel XE#6703])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-bmg:          [SKIP][59] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][60] ([Intel XE#6703])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-bmg:          [SKIP][61] ([Intel XE#2311]) -> [SKIP][62] ([Intel XE#6703]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>     - shard-bmg:          [SKIP][63] ([Intel XE#7283]) -> [SKIP][64] ([Intel XE#6703])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          [SKIP][65] ([Intel XE#1489]) -> [SKIP][66] ([Intel XE#6703]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-bmg:          [SKIP][67] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][68] ([Intel XE#6703])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>   * igt@xe_exec_multi_queue@one-queue-priority:
>     - shard-bmg:          [SKIP][69] ([Intel XE#6874]) -> [SKIP][70] ([Intel XE#6703])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-priority.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-priority.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
>     - shard-bmg:          [SKIP][71] ([Intel XE#7138]) -> [SKIP][72] ([Intel XE#6703])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6946
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd -> xe-pw-164952v1
> 
>   IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4907-259d8b4db2633a121007a389ad6b9bfb1be1f9dd: 259d8b4db2633a121007a389ad6b9bfb1be1f9dd
>   xe-pw-164952v1: 164952v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164952v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
