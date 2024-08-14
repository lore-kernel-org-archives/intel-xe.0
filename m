Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A8AC3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 17:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9E810E501;
	Wed, 14 Aug 2024 17:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oF56IIny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F77710E501
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723658047; x=1755194047;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=+62dNPpLACl11unlgYuIlxinr8E9HnqAiKo4138H6Rg=;
 b=oF56IInyaMQ2eLKjcs9pGbpMSC64A8ZMO8fLDmLju71vuOKLDGHII2vS
 U/LoUeWwF/iydJcu3vmHATYP6KC8a80RIiJTbWp/4d/aRcSXEM5gqtAU/
 teIYnL0eLTQ17XWSyclVvkg/nGqwQf+mLBm5gNbBpELejj7ERL5ZcmD8s
 bc8TcqOEp/3cCD0ND4TucvOjyYrKcapeceO+NsRAR/ZgD8e7bsjUPfCpq
 C2dN/6RpMEJOzyBIwNff06zFMq6H4lQqZi8znGuXOCKUdjRZiOe6AmesC
 JCk6bV0uGHOEH+Ak62Akno6QqZDijuf7U2UxpDYcErq2F/iHOrLhSeAuv w==;
X-CSE-ConnectionGUID: OwqK4sltQW+IofxDo7wmNA==
X-CSE-MsgGUID: hxk2QlFpTjeMdud7G/oo0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32522276"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="32522276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 10:53:53 -0700
X-CSE-ConnectionGUID: OAAxTChSR8WlSkdzn3OsAA==
X-CSE-MsgGUID: 8B9p0iLoRTuNzsK5MyH0UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59059387"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 10:53:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 10:53:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 10:53:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 10:53:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 10:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nw6ap6ToO5Gzi2AZtOpw6RkS2Z81QivH77gXTmltUeCqPTjYejii8kAilq8/wservEZ7ir1E06WIWPrGyRSeiIkXPuo88WOOlfB9zaEfvOyuQF0bqwIgzZo9eeorPcdu4uyk0ZGrnFQB82lc1E7rTyUGhWC9fsySHc+4YJo1Nebnprr6Wpy1n0yPia5Fi8SDIjG12tYvZgVQhv+3rUMpU1zfUJdHNHu5P52V6WcSvDLjEnDpIN2zStLkzLc1ho02c5Apc1y//FC8iTZEMaJKr5lQ8GLW9t9f+54x5EnVfDFiufAo5foVlJa0uvoiUseHcJBXSttME6ZdfuZ7/y+jPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4rjaLtZ2aJdD6SZBJnYbAW/TNxJEYEpZjbm7uDZle8=;
 b=FAjmd/ZlwMtbrHVxoTAf9mS/pL0hSka2sOIunLLXroLUki/+nF9hNoK3nafKeul2aPktYAI+nHZgyvjTRL28VwE5N7Tpxfl+ebExRLhz55tXbyRhz/x3ki883oDgLhe9pN1hyzr5Ba+EcfTFNxECPldhK9BLfmFJtI0FKnITAB3OPqR77MPHaQoxsvUIPsE/Wal3DjtrbKjwPg2s31hh6sbtxUjzZ5DF7s+7hAiaN+vi+kIvV8/VncC3tjlIpYUdTwT0ZOp3X2KIlo2hOLYtfIiEAolAAqQtKkTGdx9CXmiWY2RWb//3WuIewRWt23m6Jrr+kYjvHuEzer4i3jIkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Wed, 14 Aug
 2024 17:53:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 17:53:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240814120432.2040511-1-fkassabri@habana.ai>
References: <20240814120432.2040511-1-fkassabri@habana.ai>
Subject: Re: [PATCH v2] drm/xe: add wopcm device info and set region into Guc
 registers
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Farah Kassabri <fkassabri@habana.ai>, <intel-xe@lists.freedesktop.org>
CC: <farah.kassabri@intel.com>, <rodrigo.vivi@intel.com>, "Daniele Ceraolo
 Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 14 Aug 2024 14:53:43 -0300
Message-ID: <172365802388.1939.8883103491907881343@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4710a3-8084-4d3f-9835-08dcbc8a0d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: j2gAql8I63YuemZlqtniU6hCFKQ3oeMp33RljzbmGuFTfbYQD0vqifYHiJ4AyE2goXHAQ/44AjAPF1ZachAQYgAP763X8rBQ9IMR423gsW+SUtDyiZmcpqbOvS6mKDEbU4RxymOPMnl4ecGtwWO0wn65lbWyXrwLNIVGjZ4QrOoELdFIsR68yzKv8pcCX1CzWdrEKFQenskuv+6gB94yT/YKKI9VuVB4PmI2B0ERG/dJMmFMRUnL1oKSuGNjZVkr1YBcCt3Mk9cJSgtsRuTYy4b7sb1EyzoDVJH0PRKWPxwxVhiUf+Vh8tLA3X312f6vbohKOtHwoGGN6kTZ+Sdwfjs8LYmOBsZQD0gpbtJYJ2w1coge6lD5+DmEznAXoOC+lUN0SN+ihtIKX0I3nDj5OOx+7rxjXNmJQYjNQSScsNpEZ1ZBf0JJkXGeBuKbsK62TOiH2YjA8jhHS1WD6Ql1EbOeZhIgzjfhlDF7b9DIX7pB93BofYMSoN4ysbaG8Amvd4Fc+H6UY0DVA1Hvu6jLfJ7kRBVMnQYclqwking3JnzcbdrqNQDSqjoZj7CxSCRDHpx9XbIZZkL9ss74wZ/FDUJIJiILhGyKrwf7yM6ehKisIFVpK32cuktkotdSHj0ITq/OZe6/b8mcTjM5Znm7P/v9UPYEemFrBzm2OP2TBTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWpJRmlKRG9vUGQ4N0FNSUhPRCthdHp2WmRyRUpwQnRZYzNWSVlJSGEyUXFM?=
 =?utf-8?B?REVOc0QyZ0ZZSG1IV1RSajFkTjYrNndsZnI0SVY4YWxnRmNxdnZOc0lHbXhh?=
 =?utf-8?B?UEdjZjRUSmt6ZkU0ZjlvL2pWZnVxVzd2UjRiazlJL0NZTWZndDlmNlRuaHBm?=
 =?utf-8?B?ckQ3WmcwU2d6VDVwRXlGVW81ZlZ1WitLeTBIY092RkNzNWpodXUvcHJITi82?=
 =?utf-8?B?clVtRi8vWGVrdTdsOWZiOWkybXFHdzE4cEVPNHVoWDJlL1hzSTZDNEVvNVJk?=
 =?utf-8?B?R0ZmcW1MaG5XOTRya05FTHpkV1ZpMEQxekJaeENkdFI2VEpaLzVTS1A0ekxk?=
 =?utf-8?B?L2Q1Nm5JOFpVMHM0NU9waWNLUGFWTmRoS3hFUnZxOU5RN2x3bklRYnYraVNu?=
 =?utf-8?B?cVpNa0l4UmVWWXRWK0tiRk9ZNUhLVU5BUzFwM09Fa3hoTmM5UVdUZnJEeUh3?=
 =?utf-8?B?bWxOQjVRR3d3UVk2UFlLa2ZEYllhOWJtNGxGd3VUeFZTTGZvZC9ySjNBUWxI?=
 =?utf-8?B?dURmVDgxejMyRzRUZ01ET0tRSlpGanNDVWx6bHZvakNPTWVaTEUwekVzSmg2?=
 =?utf-8?B?Z1BGWTdzQXhBS08vOXhhaWNMUXdJZ0EycXFyZktKT0xCcS9lcGRmMjZiRENn?=
 =?utf-8?B?SUJUWERoWVdjYkJRS1cvRDZMOWF4c0ZHWGMyUzFKaG42Q0xWSjR0clIwR1Zp?=
 =?utf-8?B?VklyeUpybXFMcVhqcHN0WTFXdERkWDl4L3Q0cktSaVRjbUtib3dWK25zRjVu?=
 =?utf-8?B?azJNcmgrUlV6L0NldHhNcmdWZ3ZsNnh6R0NwazMwMUpTOU8xcGtYTzEwK0xv?=
 =?utf-8?B?Z0VzRzA1TVRNYm1pSGZRRFNwbThta2xqakZYVWVWa1VPUFpLWk92REQvRFpC?=
 =?utf-8?B?Tng4SDNXYWF5cmthbTdJTXAwOUdrbzIvYzN0YkdkVzFBSXYwNFRSZ2x6SXEz?=
 =?utf-8?B?STI1LzV6VUo1cFYxeDYyNjgzNGFMdEZzN2lDWkxsUmJ0NFBVUXlVMDc2MjBB?=
 =?utf-8?B?akdVbUZrYnBBeUMwNStsVG9EWStpUlAwRnpBc1JNZjdOVWVkUW5zU1FaNStB?=
 =?utf-8?B?NmI3NGhxaUMyemVFMCtwZFZ0SHJ5ME1pbkhOMmVQZS83dkcwUzEwV2dtQVAv?=
 =?utf-8?B?MFFoZ1pNeTBuTWdaemdRQlcvNFNob1JtQmhMbkkwd3RWT0t5RnVITDRJblVV?=
 =?utf-8?B?T0ZVcmp1d25CNWE2R2MrMHNiWmFPTjlFT0lGeUdZYWlaN0svTUJNTDJ0Ni9N?=
 =?utf-8?B?RytpRkNDL1huMDRPT2RBZzNLMXRyaUhzM1VyTkYyUnlHYkQ0eERFZ05KUElI?=
 =?utf-8?B?MVRLY0xicDNJOW1FR3R5VVJEVVVSbmxNemE4VFl4MDBzdHd6SHhlVWQzVVpl?=
 =?utf-8?B?WTRtOTQ1d0Z4V3RtYkhmRGpxNE1VN2JkYnhmMTBZZHd2ODlQSnBXenludGlx?=
 =?utf-8?B?OTRvZHFaL0dCNjcwb2V2SDFiZWttYTVKU0htb0kvWm9pTFFwSENjZnRkOGV0?=
 =?utf-8?B?ZmczL0hoZ1AyQ0J3NWtPSGFDTjZUanZPWTR2QVlDWUZNZU90RjNGZ29kOThC?=
 =?utf-8?B?NGNZYW9neldZNi9XbXZqdVBqZDlBbFRIRldsb2IvODVYdnJtaElkNlo2ZTEr?=
 =?utf-8?B?NHdhMnp1V0dyM3A5aXFsUlNEeURxcEN3YkRCUXlNd2w1Sit0RGxQMzRPd2Q3?=
 =?utf-8?B?QjBOMlpFRGtJUkZpSXBJNlBqbnRpTVVWSEdtYXV5VVhwRVRrSk1qZloxVFdI?=
 =?utf-8?B?TEYrTjByOHhhVkpvNUNLcWJiUjVGK1Nhb0tHcFBQMUMyS0RNUCtkbDd4RjBC?=
 =?utf-8?B?bDExMHJVNmpneXFMK294Uk9lQ2ZsemFlSEk4QWxSeTkyZE1NVXVWdStRRmxr?=
 =?utf-8?B?MGNCUE1yZGF1WXp5d1F2UDB5OE44dEhFY2RZTEZUL0lDSU9BaTkxYzJtdXMy?=
 =?utf-8?B?Y1VCM3NyNHZGNm5td3E0UVBwb2RkQ29uZGZOU1hrRjVwcnVzZjZIMkEzQzVF?=
 =?utf-8?B?azB0TU9KUHoxUVpBbEQ2S3FpemVlSFo2QUl6bDdHNUJZV2ViMk5XeTVXSkVn?=
 =?utf-8?B?aURGM0NtWDI3UXUrZjBrZUdDUzF2Ti9pcXpnWnFXb0FHMGt4Y1dKUXlaK0tj?=
 =?utf-8?B?dDhUZGdPY1R3bjhaZmNEMEdtcUFZd0IweHFzNzNWRXlUUGd5V2haaDd2L09I?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4710a3-8084-4d3f-9835-08dcbc8a0d6d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 17:53:49.8741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKsKo4qGOdjMv4MIZrAD6xZDF+rrkf/fv8MJTJ7LFSZ+adSe9BQTv7QL6R7xGbgVReduULWV1XtyS7re4pD2lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

Quoting Farah Kassabri (2024-08-14 09:04:32-03:00)
>Guc FW is loaded to the DSM WOPCM region.
>Guc DMA engine reads the WOPCM base address and size from
>guc registers DMA_GUC_WOPCM_OFFSET and GUC_WOPCM_SIZE, do some sanity
>checks and alignmnets, then load the FW there.
>This patch will set the region size at init.
>
>Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>Changes in v2:
>Keep the xe_wopcm_size function and return the new attribute
>from it.
>---
>
> drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> drivers/gpu/drm/xe/xe_ggtt.c         |  1 -
> drivers/gpu/drm/xe/xe_pci.c          | 12 +++++++++++-
> drivers/gpu/drm/xe/xe_wopcm.c        | 12 +-----------
> 4 files changed, 14 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_=
device_types.h
>index 5b7292a9a66d..013d61d11288 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -241,6 +241,8 @@ struct xe_device {
>                 u32 media_verx100;
>                 /** @info.mem_region_mask: mask of valid memory regions *=
/
>                 u32 mem_region_mask;
>+                /** @info.wopcm_size: wopcm region size */
>+                u32 wopcm_size;
>                 /** @info.platform: XE platform enum */
>                 enum xe_platform platform;
>                 /** @info.subplatform: XE subplatform enum */
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 0cdbc1296e88..6d3b3ab50b93 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -227,7 +227,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>                                &xelpg_pt_wa_ops : &xelpg_pt_ops;
>         else
>                 ggtt->pt_ops =3D &xelp_pt_ops;
>-
>         drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>                     ggtt->size - xe_wopcm_size(xe));
>         mutex_init(&ggtt->lock);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 7bb811b4a057..fc7dbf5ef74d 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -54,6 +54,8 @@ struct xe_device_desc {
>=20
>         enum xe_platform platform;
>=20
>+        u32 wopcm_size;
>+

Are we safe to assume that we can know the size of the WOPCM without
asking the hardware?

Note that xe_ttm_stolen_mgr uses get_wopcm_size() to ask the hardware
for the size.

Copying Daniele here, since I recently talked with him about the
subject.

--
Gustavo Sousa

>         u8 require_force_probe:1;
>         u8 is_dgfx:1;
>=20
>@@ -223,6 +225,7 @@ static const struct xe_device_desc tgl_desc =3D {
>         .has_display =3D true,
>         .has_llc =3D true,
>         .require_force_probe =3D true,
>+        .wopcm_size =3D SZ_2M,
> };
>=20
> static const struct xe_device_desc rkl_desc =3D {
>@@ -287,6 +290,7 @@ static const struct xe_device_desc dg1_desc =3D {
>         .has_display =3D true,
>         .has_heci_gscfi =3D 1,
>         .require_force_probe =3D true,
>+        .wopcm_size =3D SZ_4M,
> };
>=20
> static const u16 dg2_g10_ids[] =3D { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS=
(NOP), 0 };
>@@ -312,6 +316,7 @@ static const struct xe_device_desc ats_m_desc =3D {
>         DG2_FEATURES,
>         .has_display =3D false,
>         .has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>+        .wopcm_size =3D SZ_2M,
> };
>=20
> static const struct xe_device_desc dg2_desc =3D {
>@@ -321,6 +326,7 @@ static const struct xe_device_desc dg2_desc =3D {
>=20
>         DG2_FEATURES,
>         .has_display =3D true,
>+        .wopcm_size =3D SZ_2M,
> };
>=20
> static const struct xe_device_desc pvc_desc =3D {
>@@ -330,6 +336,7 @@ static const struct xe_device_desc pvc_desc =3D {
>         .has_display =3D false,
>         .has_heci_gscfi =3D 1,
>         .require_force_probe =3D true,
>+        .wopcm_size =3D SZ_4M,
> };
>=20
> static const struct xe_device_desc mtl_desc =3D {
>@@ -337,12 +344,14 @@ static const struct xe_device_desc mtl_desc =3D {
>         .require_force_probe =3D true,
>         PLATFORM(METEORLAKE),
>         .has_display =3D true,
>+        .wopcm_size =3D SZ_4M,
> };
>=20
> static const struct xe_device_desc lnl_desc =3D {
>         PLATFORM(LUNARLAKE),
>         .has_display =3D true,
>         .require_force_probe =3D true,
>+        .wopcm_size =3D SZ_2M,
> };
>=20
> static const struct xe_device_desc bmg_desc =3D {
>@@ -351,6 +360,7 @@ static const struct xe_device_desc bmg_desc =3D {
>         .has_display =3D true,
>         .require_force_probe =3D true,
>         .has_heci_cscfi =3D 1,
>+        .wopcm_size =3D SZ_4M,
> };
>=20
> #undef PLATFORM
>@@ -620,7 +630,7 @@ static int xe_info_init_early(struct xe_device *xe,
>         xe->info.skip_guc_pc =3D desc->skip_guc_pc;
>         xe->info.skip_mtcfg =3D desc->skip_mtcfg;
>         xe->info.skip_pcode =3D desc->skip_pcode;
>-
>+        xe->info.wopcm_size =3D desc->wopcm_size;
>         xe->info.enable_display =3D IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>                                   xe_modparam.enable_display &&
>                                   desc->has_display;
>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>index d3a99157e523..35878b5384a1 100644
>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>@@ -45,14 +45,6 @@
>  * The top part of the WOPCM is reserved for hardware contexts (e.g. RC6
>  * context).
>  */
>-
>-/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>-/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or=
 later */
>-#define DGFX_WOPCM_SIZE                        SZ_4M
>-/* FIXME: Larger size require for MTL, do a proper probe sooner or later =
*/
>-#define MTL_WOPCM_SIZE                        SZ_4M
>-#define WOPCM_SIZE                        SZ_2M
>-
> #define MAX_WOPCM_SIZE                        SZ_8M
>=20
> /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>@@ -179,9 +171,7 @@ static int __wopcm_init_regs(struct xe_device *xe, str=
uct xe_gt *gt,
>=20
> u32 xe_wopcm_size(struct xe_device *xe)
> {
>-        return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
>-                xe->info.platform =3D=3D XE_METEORLAKE ? MTL_WOPCM_SIZE :
>-                WOPCM_SIZE;
>+        return xe->info.wopcm_size;
> }
>=20
> /**
>--=20
>2.34.1
>
