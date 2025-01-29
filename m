Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7C7C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 19:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4E510E862;
	Wed, 29 Jan 2025 19:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwkg5Hbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BA810E862
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 19:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738177295; x=1769713295;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=u+F4xbjejAMuJ3ZgtWPXpvjF779m6y/nZssM+HQhPKY=;
 b=kwkg5HbbF0W+E7UmcKhlcwfzyp4yYNyo3xhwErhCdkTvcF6O+6WGJQY1
 ZZtTclYVR38zTulEg8kOYYcUM5lcHcYT2DJCIr746mCbjnkioaICRlNzL
 wCrL314TQGTkDp2ud7vGsUKG87tjc8wLvzv6mgHgx6Cx0kt8h1B7gZqBl
 S5jThGAw3ofRW/JgysvSiCwK3+MStPxbIwei+SelBZqmbFK27gyMqH8aK
 P3XI81sHwKhTdUGR2c4/ZvV6G+ybD2YX0Z6FrVMfs0emsOnHrB+67WuBg
 KcZ54DZdbfB6sbDRkDWSEk2tkOXz16zgPke8v7e/FxRuuzUK1lQ7xf3lN g==;
X-CSE-ConnectionGUID: JOA6gs9oSCyzRZRXitAzvw==
X-CSE-MsgGUID: 00RrqUYaRUapUWq4jL3QjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="61178983"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="61178983"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:01:34 -0800
X-CSE-ConnectionGUID: jh64rWtZS+qAv8K4xBj0mQ==
X-CSE-MsgGUID: csGhBJGLQ3KeitO2RmhUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109564792"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 11:01:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 11:01:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 11:01:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 11:01:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcsMkUPZersymzDpvPuswkvJES8p1klsjflmQhTSIgxxvqpwMgzVFk7FonK+7KTX7g5BYvzp3wfGmh0/+YTGbOwtVifhooWCZqtRjAs9nIyzepJCIAtjKHbubnSDbaVhVn0DkdlVDpvatjcvr0WUqLaa4BsPrqZrNQ8z2B4fbcEjDauJ0WqL7d08fOT4dCkNzr0QMWPZFYMmnnrScQg3k15o4hdZpwd5zEhQrVbTWEPkF9AOdJWkYwklKKcBaYQ5PMgdeJfxbH9Qt6RNDP2oPqR7PNLvHjyvT9X8DnKMghaLoTg47oyGFtcH5E8MsjxDLowfisLpmpnWn7uCopg/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNwozzAxV4SUEBqDz4rDLWNU7l9YKBN2mDRGJ2W4X3A=;
 b=erChQD8Cvr3TrwlHok17pisPdg1zyH6zRR1HKPEQgf2W4iZZIBkC7o9QEz8VakgrHCK85xaTNDfB7MOcAGcXvaBT/BBDu9civLTeR+S4/KTzigSpgnDfp3YizmOkpktIh/f3Kogh7MpmoAlGXPOp9NLzXcuVqoKEmLUzkH2WVHNt9J84cXjPJXJbaGKnR0RbaMkI+f908HWq0o0tlMt02tW8AS9j1zUTNV9TRixnoA9FZbrphoLq7uUiSlYu0FasVqi9nKLfQ3+h9xlY6XYvh/3AqkJeLhAn95m/o7zrNBrJvyXLeGotTaGebZHkD0tf8a1rQINFcz4bG/Wa+3SCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 19:01:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 19:01:12 +0000
Date: Wed, 29 Jan 2025 13:01:10 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/guc: Fix size_t print format
Message-ID: <fbiog36nsa3nnr75mqxki5xy2ijtwoqiqtvqdndoxiy4sjffvb@vrvgrrub72g5>
References: <20250128154242.3371687-1-lucas.demarchi@intel.com>
 <173812930309.2257320.3031523661577915522@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <173812930309.2257320.3031523661577915522@b555e5b46a47>
X-ClientProxiedBy: MW4PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:303:b6::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: b8fccb93-ef62-4149-34b5-08dd40974c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?knAvLEsqKGp0GrOKO9jUBTM7gmy2PPLmUkAQrR4oY79mvFSIJh6F7oZBpOH0?=
 =?us-ascii?Q?Lhv1F+wudyQIwAWuXFQIIeOYJOq4KMt8wkHALqVBbtImjaWBZ6oaczyusDOq?=
 =?us-ascii?Q?Cu+QkNN3yFsc0NkCFru5lEEoamhLBhKJdZOw/Fc07lns4Z4s2sImgXZTVhC2?=
 =?us-ascii?Q?XZY+edFfTCRTYWLqyAYC0v0tmC2T1ksbODGJKujeuTXx2W2udFkDp6N4ZObL?=
 =?us-ascii?Q?ISYyDU51628gGVMjPaPrMKG58Kpp1KyXjMYD6QhvZVJoMXsngALCWc3fhqQw?=
 =?us-ascii?Q?RXBVE2H713i8hyxLDxqD75hLTcdCtO+5O5zF6elkfFkW2ItK0tIvSrPRj9ZI?=
 =?us-ascii?Q?kFi0ZCrsy27Zxzy+0bsgdV8gyT1BaH6mWJoko6NC+Vj2XNcCCgeBKkwpFFD2?=
 =?us-ascii?Q?2aWRGOT7e/es87cBMN4qqt6E4WRld5F+R1Qwz9AtTa4EGFpuQ39tDDKlHszH?=
 =?us-ascii?Q?UPEPae3YYY4rkUtyt17MLt+km+YmWx8Rlowb7veQCqT3FUQFVGkNs3xGr7g6?=
 =?us-ascii?Q?LJ3cYD+MuesC/kdAF37KjvKPpBhChMztuBOTUeSVLWKzG1G8vfsRvZEzbqmP?=
 =?us-ascii?Q?sOrQVtJTH5qrn45NnvZNci56yv/0OsO1bkDkc54g/k8kiM3QoIILRbdTvWYi?=
 =?us-ascii?Q?RcYSFCHAlExm6qJ23CTxvTIiY6VJ1jf8aE1JQQ6SG8nLFoDWfubDp0ZVqYL2?=
 =?us-ascii?Q?X2rtd+1JnveBtsjQFKTrYA7VQWyfPQmqbdvnOeYbCJn6sNZk1+z5q1av4Pqa?=
 =?us-ascii?Q?TCHe/shFS3WQZgIQBy0qVEiCdfKMYQuonp3ex1ZFhLW0xe/soh745LfYcChI?=
 =?us-ascii?Q?h/bFSvUrsV06I3V2D+a1XFKEUvQ6LtFO71zkjz9bmsEdDaBvwh8aI2wZME2A?=
 =?us-ascii?Q?CQ3utYbPx3jDcTsWwvBQBlS8Fz6+tbOuMBjjAfz/flslQjun5RfSDABbSyds?=
 =?us-ascii?Q?qCVxWKHf7InakSvFWJMJGOigB52YA12NpzAgGb5HQI6CSj5seFfFQfTplw+2?=
 =?us-ascii?Q?yFIttIlSl6vpAmF7VZ3tkst/a3XF2newg23sGuaR01CA3XUIfWIIyyloZ+g3?=
 =?us-ascii?Q?kQ5lKlLbGsLSx/VDWsC8QLs0pJNFaLEKXL3qzXELXDrSbnO1U/CmpUaUkbwu?=
 =?us-ascii?Q?mT0bnKI6qPwneollBIWHqmrPMCs9UZIkrcdLLQ0UhPxIHvt+5xbFZkh5J01E?=
 =?us-ascii?Q?3+MH2y5yGazxp3Z9veCA8P+voShjfofVvd6BUgNXyru6gxNnFVgmkdryTVit?=
 =?us-ascii?Q?Po4kRzYVJCQgVLF2sltJ+5oeuKGkGixwBWYQJJE+rCDq7prl9BnU3a9uiyHX?=
 =?us-ascii?Q?PTRnwry+Xh+bgo3h4tKDEvXD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dVKOMOXAq8ZgWWPR00IdntYhxxy9TD1CcgXNlcFDHIvXJQ8pGMFdZHC0mlN4?=
 =?us-ascii?Q?LjoRqWik0LnUDWX1nFvRx7oh1bWQSAkAqOHri12GWkW0iroljROP29trqmxI?=
 =?us-ascii?Q?pcOQp26ZItIuRaML74WFhZVMRYNs5k402mCfHD4c1+HMcbgkjqBcPzU5mLk+?=
 =?us-ascii?Q?zef8H7Dqj4z5dMuQIXeFzCeIINXGs1DR4RE7MNqREVkBI/MHFwrG57Lk1WsD?=
 =?us-ascii?Q?zWLwS19VYvx6WJVNUQbikxDwyM8CqeY1WoDTyerK3odlocjy0YQrdmI+oI9T?=
 =?us-ascii?Q?tTEaZl0W/XEHRbh1lEb167GpucwXBMQ3zS1USHMS1Tl0g+8sKNZlz3xOBHcZ?=
 =?us-ascii?Q?Kk4WVSZisKpQ3+X2C6jz8QX7miIQAmRoYdBuwPcyffvS7u5fUdFEcXWSKz8n?=
 =?us-ascii?Q?PFdf1h+Eix6Z0qof0YUct0KWW/AYdkygpi4BJPR8VBKzcRrs7Mv5tzkZhyOb?=
 =?us-ascii?Q?pSc7ui4bb37L4JqQcWp0rS+9SpJH/Q4IDy/JEjgAXajbdOuyJuNCcPw4i6Hr?=
 =?us-ascii?Q?ZxlwmrJC/v8s9Y6l9WJUFtCuluLi1gn2kyfWiuouoNXlsQcCn8xBZmWJhpNh?=
 =?us-ascii?Q?Q4S19HrdP7jnI6jY9G4OOAp648cBu/bypuZN6ZsbEBXOh8AHjwAlAvMVrCJX?=
 =?us-ascii?Q?XoDV8IQzksrvhdZASA+8XUqwOsZBRjqcEiudqld8l2Zxu2CHn8bumrCaEGEu?=
 =?us-ascii?Q?LCheXksPdoe+7O0pYUEYgvh+aZCNS6XieFL82Igd9KTHMpTuDBgJK9ep5iEu?=
 =?us-ascii?Q?Pold9szcLujZOl+hv/zlyQDMmUZzb6S8zqgw/xK8hcSNqXrxD4N2u3zG0l0+?=
 =?us-ascii?Q?Wy9swhQWU8EZtH3F7HiyyCT23860Ap/dlc8sg+8isNXLDB+NauaZehCcFb4N?=
 =?us-ascii?Q?pmD1++mE44YijFhyJapQXYYLqCfjrCWW6IcAtV20/h9NoeYPifrkA2fbK56S?=
 =?us-ascii?Q?4Mj0dKOD+Iu0hqfR5YbFpnI3mc8z2wAnLFiyib51k9ArKbykNkSgsA4ie+h8?=
 =?us-ascii?Q?og7rDjPOnuM9MIlPrqzhK4422xaZ8VSQ2GwKzCti7r+HV/61+X8OutObCpvd?=
 =?us-ascii?Q?tGnTrvPUGSieW0hsZpzJiRjpWZ4owYisSwO0iNr/CP5Kd03rZ7veR6sGfqMb?=
 =?us-ascii?Q?9BJJ91CJ5kOPCekn6dwuQm3qJNQ7deqWoA5heZQSVcKiWTWK7Lux0WxyiATA?=
 =?us-ascii?Q?agOf7gc7hMVUj/lICehcVUbpVv093sKnrfjCG6qv35XzQt9gnustSc/wSEND?=
 =?us-ascii?Q?Rv9j/WCHsFGxU1DmGoBMKGGVGMHl3SrFHZpB7s4gCWAMUg3QmteOnj/bx8Nx?=
 =?us-ascii?Q?TkEbK/hNigyMPjCCmJcB1AxqdIVXIiYa3+iTzTZVOk77wxdywbZdr0fcElwb?=
 =?us-ascii?Q?YsUST3NoO5jZJnbD2DOd4/wvN7lKOoLnGt0Da+gUEV6fAjDiyMEt5c8h+ZNN?=
 =?us-ascii?Q?d8FL/Kv+EQ74lu3YD6XwvGQlhJOS6qH4NtTk0WivuIYVORxy9+2GQpsiFBzm?=
 =?us-ascii?Q?hctYPlqKjeaLOKn3SvbaWYL0rtQ0u/GKfy4wagJjjHL1ei9sTprng6eoUsvC?=
 =?us-ascii?Q?7weR8VcGWSygL6+ks9MklA/6etKUsHoHmx3axd5yOsWyWOVPA3cVC+EkwBnA?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fccb93-ef62-4149-34b5-08dd40974c5c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 19:01:12.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAbQ4Lt2pEmwd2HvUU9V53e9I1qjdI0V60A/+KBtPCv0am43wIImt/EEXuqDPcbgzKy1cF3gfldcTJ2hGCMHsFYjHBdF3cCJZJ1yxRM9oU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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

On Wed, Jan 29, 2025 at 05:41:43AM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe/guc: Fix size_t print format
>URL   : https://patchwork.freedesktop.org/series/144039/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060_full -> xe-pw-144039v1_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-144039v1_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-144039v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-144039v1_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@xe_drm_fdinfo@utilization-others-idle:
>    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-434/igt@xe_drm_fdinfo@utilization-others-idle.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-436/igt@xe_drm_fdinfo@utilization-others-idle.html

/me confused

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-436/dmesg23.txt

<7>[  368.003222] [IGT] xe_drm_fdinfo: starting subtest utilization-others-idle
<7>[  375.031181] [IGT] xe_drm_fdinfo: finished subtest utilization-others-idle, SUCCESS
<7>[  375.042530] xe 0000:03:00.0: [drm:drm_client_dev_restore] intel-fbdev: ret=0
<7>[  375.044241] [IGT] xe_drm_fdinfo: exiting, ret=0

which doesn't match the incomplete result.

Lucas De Marchi

>
>  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
>    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
>
>
>Known issues
>------------
>
>  Here are the changes found in xe-pw-144039v1_full that come from known issues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_async_flips@async-flip-suspend-resume:
>    - shard-adlp:         NOTRUN -> [DMESG-WARN][5] ([Intel XE#1033]) +2 other tests dmesg-warn
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume.html
>
>  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
>    - shard-lnl:          NOTRUN -> [FAIL][6] ([Intel XE#3719] / [Intel XE#911]) +3 other tests fail
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
>
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
>
>  * igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-2:
>    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] ([Intel XE#4172]) +6 other tests dmesg-warn
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-7/igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-2.html
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-1/igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-dp-2.html
>
>  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3658])
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>
>  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407])
>   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>
>  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#316]) +1 other test skip
>   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>    - shard-adlp:         NOTRUN -> [DMESG-FAIL][13] ([Intel XE#1033])
>   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>
>  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124]) +3 other tests skip
>   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
>
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
>   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124])
>   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
>
>  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2191])
>   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>
>  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#367])
>   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>
>  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#367])
>   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>
>  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1512])
>   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>
>  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#3442])
>   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>
>  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +62 other tests skip
>   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2.html
>
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
>    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2669]) +3 other tests skip
>   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html
>
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +1 other test skip
>   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
>
>  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>    - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
>   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#4010])
>   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2:
>    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#4010])
>   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#787]) +11 other tests skip
>   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#3124] / [Intel XE#4010])
>   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
>   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>    - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1727])
>   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>
>  * igt@kms_chamelium_color@ctm-limited-range:
>    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#306])
>   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_chamelium_color@ctm-limited-range.html
>
>  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#373]) +1 other test skip
>   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
>
>  * igt@kms_chamelium_hpd@dp-hpd:
>    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373]) +1 other test skip
>   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd.html
>
>  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +1 other test skip
>   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
>
>  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1178])
>   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
>
>  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#3304])
>   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
>
>  * igt@kms_cursor_crc@cursor-offscreen-256x85:
>    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1424]) +1 other test skip
>   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-256x85.html
>
>  * igt@kms_cursor_crc@cursor-offscreen-512x170:
>    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#308])
>   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>
>  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#309])
>   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>
>  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>    - shard-bmg:          [PASS][46] -> [DMESG-WARN][47] ([Intel XE#877])
>   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>
>  * igt@kms_cursor_legacy@single-bo@pipe-b:
>    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][48] ([Intel XE#1033]) +28 other tests dmesg-warn
>   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-b.html
>
>  * igt@kms_flip@2x-blocking-wf_vblank:
>    - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#2882]) +1 other test fail
>   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html
>   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
>
>  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421]) +2 other tests skip
>   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#3321])
>   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
>   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
>
>  * igt@kms_flip@2x-plain-flip-interruptible:
>    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#310])
>   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_flip@2x-plain-flip-interruptible.html
>
>  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#886]) +4 other tests fail
>   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>
>  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#301]) +1 other test fail
>   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>
>  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
>   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#455]) +3 other tests skip
>   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1397] / [Intel XE#1745])
>   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
>
>  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1397])
>   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
>
>  * igt@kms_force_connector_basic@force-edid:
>    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#352])
>   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_force_connector_basic@force-edid.html
>
>  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651]) +5 other tests skip
>   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#656]) +13 other tests skip
>   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>
>  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
>    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#656]) +7 other tests skip
>   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
>    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#651]) +2 other tests skip
>   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
>
>  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#651]) +3 other tests skip
>   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#653]) +5 other tests skip
>   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
>
>  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#653]) +3 other tests skip
>   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
>
>  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3:
>    - shard-bmg:          NOTRUN -> [DMESG-WARN][70] ([Intel XE#4172])
>   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3.html
>
>  * igt@kms_joiner@basic-force-ultra-joiner:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2925])
>   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html
>
>  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
>    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2763]) +3 other tests skip
>   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
>
>  * igt@kms_pm_backlight@fade-with-dpms:
>    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#870])
>   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_pm_backlight@fade-with-dpms.html
>
>  * igt@kms_pm_dc@dc3co-vpb-simulation:
>    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#736])
>   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
>
>  * igt@kms_pm_dc@dc6-dpms:
>    - shard-adlp:         NOTRUN -> [FAIL][75] ([Intel XE#718])
>   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
>
>  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1439] / [Intel XE#836])
>   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>
>  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2893])
>   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
>
>  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1489])
>   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
>
>  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1489]) +1 other test skip
>   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>
>  * igt@kms_psr@fbc-pr-cursor-blt:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_psr@fbc-pr-cursor-blt.html
>
>  * igt@kms_psr@fbc-psr-sprite-blt:
>    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
>   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_psr@fbc-psr-sprite-blt.html
>
>  * igt@kms_psr@pr-sprite-plane-onoff:
>    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1406]) +1 other test skip
>   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_psr@pr-sprite-plane-onoff.html
>
>  * igt@kms_rotation_crc@primary-rotation-270:
>    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#3414])
>   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html
>
>  * igt@kms_tv_load_detect@load-detect:
>    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#330])
>   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html
>
>  * igt@kms_vrr@flip-basic-fastset:
>    - shard-lnl:          NOTRUN -> [FAIL][85] ([Intel XE#1522]) +1 other test fail
>   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@kms_vrr@flip-basic-fastset.html
>
>  * igt@kms_writeback@writeback-fb-id:
>    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#756])
>   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@kms_writeback@writeback-fb-id.html
>
>  * igt@sriov_basic@enable-vfs-autoprobe-off:
>    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1091] / [Intel XE#2849])
>   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
>
>  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1123])
>   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>
>  * igt@xe_eudebug@basic-client-th:
>    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#2905]) +3 other tests skip
>   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_eudebug@basic-client-th.html
>
>  * igt@xe_eudebug@basic-exec-queues:
>    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2905]) +1 other test skip
>   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@xe_eudebug@basic-exec-queues.html
>
>  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#3889])
>   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
>
>  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2905]) +3 other tests skip
>   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
>
>  * igt@xe_evict@evict-beng-large:
>    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#688]) +1 other test skip
>   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@xe_evict@evict-beng-large.html
>
>  * igt@xe_evict@evict-beng-small-external-cm:
>    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#261] / [Intel XE#688])
>   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_evict@evict-beng-small-external-cm.html
>
>  * igt@xe_evict@evict-large-multi-vm:
>    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][95] ([Intel XE#1033] / [Intel XE#1473])
>   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@xe_evict@evict-large-multi-vm.html
>
>  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1392]) +3 other tests skip
>   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
>
>  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#1392]) +2 other tests skip
>   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>
>  * igt@xe_exec_fault_mode@once-rebind-prefetch:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#288]) +2 other tests skip
>   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@xe_exec_fault_mode@once-rebind-prefetch.html
>
>  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#288]) +7 other tests skip
>   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
>
>  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2360])
>   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>
>  * igt@xe_exec_reset@close-execqueues-close-fd:
>    - shard-dg2-set2:     [PASS][101] -> [INCOMPLETE][102] ([Intel XE#3592])
>   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-432/igt@xe_exec_reset@close-execqueues-close-fd.html
>   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-434/igt@xe_exec_reset@close-execqueues-close-fd.html
>
>  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
>    - shard-adlp:         [PASS][103] -> [DMESG-WARN][104] ([Intel XE#4173])
>   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>
>  * igt@xe_mmap@pci-membarrier:
>    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#4045])
>   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@xe_mmap@pci-membarrier.html
>
>  * igt@xe_module_load@load:
>    - shard-adlp:         ([PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129]) -> ([PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [SKIP][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155]) ([Intel XE#378])
>   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-4/igt@xe_module_load@load.html
>   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-2/igt@xe_module_load@load.html
>   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-4/igt@xe_module_load@load.html
>   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-4/igt@xe_module_load@load.html
>   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-4/igt@xe_module_load@load.html
>   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-3/igt@xe_module_load@load.html
>   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-6/igt@xe_module_load@load.html
>   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-6/igt@xe_module_load@load.html
>   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-3/igt@xe_module_load@load.html
>   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-2/igt@xe_module_load@load.html
>   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-2/igt@xe_module_load@load.html
>   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-2/igt@xe_module_load@load.html
>   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-6/igt@xe_module_load@load.html
>   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-3/igt@xe_module_load@load.html
>   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-8/igt@xe_module_load@load.html
>   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-8/igt@xe_module_load@load.html
>   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-9/igt@xe_module_load@load.html
>   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-3/igt@xe_module_load@load.html
>   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-3/igt@xe_module_load@load.html
>   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-8/igt@xe_module_load@load.html
>   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-2/igt@xe_module_load@load.html
>   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-8/igt@xe_module_load@load.html
>   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-6/igt@xe_module_load@load.html
>   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-8/igt@xe_module_load@load.html
>   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_module_load@load.html
>   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_module_load@load.html
>   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-6/igt@xe_module_load@load.html
>   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-6/igt@xe_module_load@load.html
>   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-6/igt@xe_module_load@load.html
>   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_module_load@load.html
>   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_module_load@load.html
>   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-8/igt@xe_module_load@load.html
>   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-8/igt@xe_module_load@load.html
>   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-8/igt@xe_module_load@load.html
>   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-8/igt@xe_module_load@load.html
>   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-8/igt@xe_module_load@load.html
>   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_module_load@load.html
>   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-6/igt@xe_module_load@load.html
>   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-6/igt@xe_module_load@load.html
>   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-9/igt@xe_module_load@load.html
>   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-2/igt@xe_module_load@load.html
>   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-9/igt@xe_module_load@load.html
>   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-9/igt@xe_module_load@load.html
>   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-3/igt@xe_module_load@load.html
>   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-2/igt@xe_module_load@load.html
>   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-2/igt@xe_module_load@load.html
>   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-2/igt@xe_module_load@load.html
>   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-3/igt@xe_module_load@load.html
>   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-3/igt@xe_module_load@load.html
>   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-3/igt@xe_module_load@load.html
>
>  * igt@xe_oa@non-system-wide-paranoid:
>    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
>   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_oa@non-system-wide-paranoid.html
>
>  * igt@xe_oa@syncs-ufence-wait-cfg:
>    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
>   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@xe_oa@syncs-ufence-wait-cfg.html
>
>  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][158] ([Intel XE#1173])
>   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
>
>  * igt@xe_pm@d3cold-mocs:
>    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#2284])
>   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_pm@d3cold-mocs.html
>
>  * igt@xe_pm@s2idle-vm-bind-prefetch:
>    - shard-dg2-set2:     [PASS][160] -> [ABORT][161] ([Intel XE#1358])
>   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-prefetch.html
>   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html
>
>  * igt@xe_pm@s2idle-vm-bind-unbind-all:
>    - shard-dg2-set2:     [PASS][162] -> [DMESG-WARN][163] ([Intel XE#1033]) +5 other tests dmesg-warn
>   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>
>  * igt@xe_pm@s3-multiple-execs:
>    - shard-dg2-set2:     [PASS][164] -> [ABORT][165] ([Intel XE#1358] / [Intel XE#1794])
>   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
>   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html
>
>  * igt@xe_pm@s4-exec-after:
>    - shard-adlp:         [PASS][166] -> [ABORT][167] ([Intel XE#1358] / [Intel XE#1607])
>   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-6/igt@xe_pm@s4-exec-after.html
>   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>
>  * igt@xe_pm@s4-vm-bind-prefetch:
>    - shard-adlp:         [PASS][168] -> [ABORT][169] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
>   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
>
>  * igt@xe_pm_residency@cpg-basic:
>    - shard-dg2-set2:     [PASS][170] -> [ABORT][171] ([Intel XE#4046])
>   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-463/igt@xe_pm_residency@cpg-basic.html
>   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html
>
>  * igt@xe_query@multigpu-query-invalid-cs-cycles:
>    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#944])
>   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>
>  * igt@xe_query@multigpu-query-mem-usage:
>    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#944])
>   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html
>
>
>#### Possible fixes ####
>
>  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-adlp:         [DMESG-FAIL][174] ([Intel XE#1033]) -> [PASS][175]
>   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>
>  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>    - shard-dg2-set2:     [DMESG-WARN][176] ([Intel XE#1033]) -> [PASS][177] +7 other tests pass
>   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>    - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][179]
>   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>
>  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
>    - shard-dg2-set2:     [INCOMPLETE][180] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][181]
>   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
>   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
>
>  * igt@kms_color@legacy-gamma:
>    - shard-bmg:          [DMESG-WARN][182] ([Intel XE#877]) -> [PASS][183] +1 other test pass
>   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-4/igt@kms_color@legacy-gamma.html
>   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-1/igt@kms_color@legacy-gamma.html
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>    - shard-dg2-set2:     [FAIL][184] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][185] +1 other test pass
>   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
>
>  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>    - shard-dg2-set2:     [FAIL][186] ([Intel XE#301]) -> [PASS][187] +1 other test pass
>   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
>   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
>
>  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
>    - shard-bmg:          [FAIL][188] ([Intel XE#2882]) -> [PASS][189] +2 other tests pass
>   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
>   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
>
>  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>    - shard-bmg:          [FAIL][190] ([Intel XE#3321]) -> [PASS][191] +3 other tests pass
>   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>
>  * igt@kms_flip@flip-vs-suspend-interruptible:
>    - shard-adlp:         [DMESG-WARN][192] ([Intel XE#2953]) -> [PASS][193] +1 other test pass
>   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
>
>  * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6:
>    - shard-dg2-set2:     [INCOMPLETE][194] -> [PASS][195]
>   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-436/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6.html
>   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-6.html
>
>  * igt@kms_setmode@basic@pipe-a-edp-1:
>    - shard-lnl:          [FAIL][196] ([Intel XE#2883]) -> [PASS][197]
>   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html
>   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-8/igt@kms_setmode@basic@pipe-a-edp-1.html
>
>  * igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile4-uncompressed-compfmt0-vram01-vram01-481x481:
>    - shard-bmg:          [DMESG-WARN][198] ([Intel XE#4172]) -> [PASS][199] +46 other tests pass
>   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-1/igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile4-uncompressed-compfmt0-vram01-vram01-481x481.html
>   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-8/igt@xe_ccs@block-copy-uncompressed-inc-dimension@tile4-uncompressed-compfmt0-vram01-vram01-481x481.html
>
>  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1392]) -> [PASS][201] +3 other tests pass
>   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
>   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
>
>  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
>    - shard-adlp:         [DMESG-WARN][202] ([Intel XE#4173]) -> [PASS][203]
>   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
>
>  * igt@xe_pm@s2idle-multiple-execs:
>    - shard-bmg:          [DMESG-WARN][204] ([Intel XE#1616] / [Intel XE#4172]) -> [PASS][205]
>   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-bmg-1/igt@xe_pm@s2idle-multiple-execs.html
>   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-bmg-8/igt@xe_pm@s2idle-multiple-execs.html
>
>  * igt@xe_pm@s4-multiple-execs:
>    - shard-adlp:         [ABORT][206] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][207]
>   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
>
>  * igt@xe_pm@s4-vm-bind-prefetch:
>    - shard-lnl:          [ABORT][208] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][209]
>   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html
>
>
>#### Warnings ####
>
>  * igt@kms_flip@2x-flip-vs-suspend:
>    - shard-dg2-set2:     [DMESG-WARN][210] ([Intel XE#2955]) -> [DMESG-WARN][211] ([Intel XE#1033])
>   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html
>   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html
>
>  * igt@kms_frontbuffer_tracking@fbc-suspend:
>    - shard-dg2-set2:     [ABORT][212] ([Intel XE#1033] / [Intel XE#2625]) -> [DMESG-WARN][213] ([Intel XE#1033])
>   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html
>   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-suspend.html
>
>  * igt@kms_plane_lowres@tiling-4:
>    - shard-dg2-set2:     [INCOMPLETE][214] -> [DMESG-WARN][215] ([Intel XE#1033])
>   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html
>   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@kms_plane_lowres@tiling-4.html
>
>  * igt@kms_tiled_display@basic-test-pattern:
>    - shard-dg2-set2:     [SKIP][216] ([Intel XE#362]) -> [FAIL][217] ([Intel XE#1729])
>   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
>
>  * igt@xe_peer2peer@read:
>    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1061]) -> [FAIL][219] ([Intel XE#1173])
>   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060/shard-dg2-432/igt@xe_peer2peer@read.html
>   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/shard-dg2-466/igt@xe_peer2peer@read.html
>
>
>  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
>  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
>  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>  [Intel XE#3592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592
>  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
>  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
>  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
>  [Intel XE#4046]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4046
>  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
>  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>
>
>Build changes
>-------------
>
>  * Linux: xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060 -> xe-pw-144039v1
>
>  IGT_8212: 76102a17560c6e6fc6528db29286b0266ccc48ef @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>  xe-2565-f85f4e698972bc6021185ccba59e6e3638a8e060: f85f4e698972bc6021185ccba59e6e3638a8e060
>  xe-pw-144039v1: 144039v1
>
>== Logs ==
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144039v1/index.html
