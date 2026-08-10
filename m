Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609BFC5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 11:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A252010E7D1;
	Mon, 10 Aug 2026 11:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lj2S2Hi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4103A10E1E2;
 Mon, 10 Aug 2026 11:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786362108; x=1817898108;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gXMm5rMc0Q4eVBWXm8iq7DkelG1FILLO1zwCqBP+VQQ=;
 b=Lj2S2Hi/5Kg4Zlp8sbSIc8KzxUtsVPuAyoZmZWQ2TX6KFcNAfNgD2JRD
 4g/zhVBA7MvRJKdZqv0JEVxYTwH3vzvwUbOrL0p2Y2P1Ey5NacG/+P3wC
 EtH92SYvzNyybNy4LSSWEFf6Hpe1eA/461VJUPYgnA/qSPdln7V0O8pQH
 EWsjZiop0fxiDtCNw+RmIirHG6/c1KPBcH0WmQHphtN244ehGokClmqFH
 wgScPe0uPhKd1JXoer4KwX8N0RuNUZu+z1oHEY9W43SX6GHMKTi4odTPh
 /iC8utykkBHcp9CIScEF5rn+IRnLapRh7IPJBYT1640wgN4x9aIdHqVjZ Q==;
X-CSE-ConnectionGUID: hZigE+UbSi2wuUJSOLztUA==
X-CSE-MsgGUID: 7FkLJ8kuTqeGCer86ImZNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97222579"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="97222579"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:41:48 -0700
X-CSE-ConnectionGUID: kL5fuPyDRuWNuyAFV12Kqw==
X-CSE-MsgGUID: faNMFhf8TTOVUXaT6hGY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="265002302"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 04:41:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:41:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 04:41:41 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 04:41:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHldYFrv4iT3kNDIYf55gLjsPJzvqmV0wCJARL3UynMcR8vRq0BxtoQqoy6AEcGMha3mhTFeqyEwfX5YF3EZ1ZvAWcwt1ZqwOccB0xENfqNYNhN6oQOJ0SIH9gILxq0hwRXtFoZ02x8TEERZycUiOxpyiiuhJYollyL+pYMQk+fgMAbb/iOXDOImpmXvf07/bb9gb9rAqAhvwH5wePrPFtXHkSTVhbZCxYx0QMa1ITwvR+jbCnznN6UUubWbAGsKhImOzAH7xnGmfvBcjOaMfFgasIT8Vtn+0qVkcFI0XcxbrT/0IKkoD7TjFqFwex85rMKhb/Q8EiykmTsGtty+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0zETlcdtIXfnJGBJ3xaH/OliJ/6rFUYTG2tmZW5gAY=;
 b=IHEnpLkdWhzgCVuXXauP5uoVvFdnqZW5LUsjwLOnXbD+rI5e1DtVqTQ3VX4o00U7SVUkphlkfUif4Dkt5HWaVG/6JBaTlN3HZbTY6FmnKUdTj51xP7vqY6iISYe1Tz7ArM8RJ0AOhwgyxr0oxLsRw95g1fKFMjfL9t0ugoGMNhmfJd8yvP9Af+TSjodRjH3L5ypt+OiyfeQJCeJThyiYlXtVys+GlI2kPkTDqUX4h5wvoboFpe5z76TtI5cQscVDfOGvfveMvy0jqVTpW20ZcEOlYEWYLemB6sqkH9sOm7JNVkDFYaB0BsmZQEKusb5vkP2GaBVKg4/xu9tF/Gvtag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 11:41:37 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 11:41:37 +0000
Message-ID: <d6520a08-8dbc-4a1e-80d5-62f969cf88c1@intel.com>
Date: Mon, 10 Aug 2026 17:11:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/i915/dp: Limit compute config joining to pipes
 that can actually join
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <cover.1786105831.git.jani.nikula@intel.com>
 <dc1c7fc45d4da7d3fd1bd8b94c30c78d69aa0742.1786105831.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <dc1c7fc45d4da7d3fd1bd8b94c30c78d69aa0742.1786105831.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::12) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: dc3c8724-1b90-4768-d833-08def6d45640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vt1qgQ9lFWJUhysDn8uijURTwq7iSOcNxakBBlpcihBmhtLWw3gioY6RExFKMan/3aGO/mt5H1Rc4igWc1JcRy8YDrjXyn7RlTHMxf6p5K6OBAltZlkeoZkk0U3Wgtj2oM8TbgFQ6ab+ARPtfrs19TzaMKZyXo1GKClJHvOnSzmfVFdcfDe49cdLPhI8dqLRcalc34+TkZckVLHcwQST33s/8Pn8h9CSxGZohcV+oaNqfhtSToVi0vLtW2qfq8j5YeBwdlTXdr+NHu5bIHxvoVno8xdwt4E//66i/+hLaEXUGq9DA827YBHWPQ05u4RXBlBZZYpmAwEOn9lEfXi5QY5ufTFVlgWKxC+ASlOq2GSdUPjHT+Tc+gzKbnCJOsh8tsgVEwCgUc0CweGBqU/XF8+SB+WoecW0MHNkHVWe9F2wb8Nqomu2K/JyDUmCEhAWHkLyRTkigI95Ubv/4fBe8NxbHXRg9bnQZp5tMsavyLRpIHIJPe8Xc0E867Dnri4qwA7966K4BgRjga2tb79jE2ASz0za81G7UeXj+9/j6xnp40wBK4izf/rhIBwBNpAWbKh+zmZkMhVs3tztW5KCLaDzUWwQNNX4cc9KptmnNC5mCg69kjtTKco8y/hH4r/sQkP1AmsxqxmTaXPEE87cljNo0idG9LJ17plXvf3JGPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azEwRFJlSEcrTTBzSFZvWTJZU1dnNGc2Mlgwby93SUlCcWxTb3R2Z0FDTFJC?=
 =?utf-8?B?bG5wZ3RBdXIxTnEwdFVnK1BNU3dLbjhjQ3JYaytyaUN5ZFZpQ1BBOHJSSi9F?=
 =?utf-8?B?RFpHMlhQaHVOTmRpM2VwWVNzU295dlJRKy9MSjVhMml1NWgwMngwWXB1eS9i?=
 =?utf-8?B?emFpMDJmazlaR0NSNVJCUHY4YzhkZkVtSWZ0d0ZaVmhDWW5Xb1pGbFBpYVBP?=
 =?utf-8?B?WkJQRG1XQ0F4WU1FR3dySmcrNksxY0hMY1BDQkU4ejBzaE9UQkFmcmthaks4?=
 =?utf-8?B?ZDA2ZUhkRmhpYk9ORGlydUljYUFmM0Jsc2tuL3EzemVaM2FYUWkraWtSOTZj?=
 =?utf-8?B?UCtlTVBBU2RGVHZvUUd4b1ZVR3JaQkZIaXh4bWl0ZzFoS2c5V2VLcjFEMXVW?=
 =?utf-8?B?eVVsK2FJeTh1djBrR2RZYlo4U2xqVFFDL09DZkl4dXRCZ1FUY2ZTNjliQjdS?=
 =?utf-8?B?WmwxNVpHQlNVb3ptZXVlenRkQmI1b2tubmx6Q200RWhzU3R6Q04wbjRJUSsx?=
 =?utf-8?B?cUo4M2JxTUdya0xab1NLU1NVOUZXclZPemFDeVVwalp3OGtwWnorZ1JOMXcz?=
 =?utf-8?B?V0ZDU1hhS3BRQk5LNEJ0cHlnbTRxUmVwLzVGS2w3NXcxWW1nMzI5YW9ubGxU?=
 =?utf-8?B?N2hZdVZheDkyaUFERWZReTNBM0JDYjhxTnYzRloyQlJqZ3d2RDNNSXV2VGhH?=
 =?utf-8?B?dnNZVndSK0laWGVOQmc3VVpRQXNaZldnSDYvTXlmWDM4UkFDTi91eHVyWmhQ?=
 =?utf-8?B?b2RMZ2JNWjJkQlRXSWFiL0dYcUI3endyTlR5d01FcHRVeU1jRHlMbjNtWXNw?=
 =?utf-8?B?dzRXZGFmd0Y2UlFUM1JDNFVITTNDczlMZzEzNUQwdGNleWVWOE1IRHptNERX?=
 =?utf-8?B?NTZ0bmFZUmhNdWh2ZG43RDJraGtwZzZGOWlmY1c5eUJDWDkyaUswaEIzRnk2?=
 =?utf-8?B?VEFXMkQ3RFU3N0tMREpmclhtNjNZdjBrWUNTeklUR1RIazBReHpXRFRGNU1t?=
 =?utf-8?B?OGhPNVMwbGFZNkNXTHh1MVoraHI2ZHU3SDExQ01GcUZtVm5OYklPbkpKRkoy?=
 =?utf-8?B?WmF0S2ZCMUhxT0pCN1dORGRYTEMvSEE1RzJreDgxOU55SXpYam5oQmQwdmZy?=
 =?utf-8?B?SjZZSWtVOTNpKzZVUUs2dFBzNGU0enF1V3d2clJtWDlGUFdrYm1FWVlHNnp2?=
 =?utf-8?B?VTBQSjdFTk9UYkhNYkR5SHZqYkNzWXVDSTI5QnZaSjlMYzY2MGpveG50WE51?=
 =?utf-8?B?a0tDSG1KeEVHOVBrTDluTE5hcHREVGJjUUdud1EremF0RE1oUzA1MG5teHFy?=
 =?utf-8?B?UXdib0F4M3dKNHh0M2xneWc4Y1VkUmdDK1phYkpUclBmZjFYdVJlalBHcDNy?=
 =?utf-8?B?UnM4NXVMMncrbDlzL0lKRktLWjdFYmlyRzh0NTJLbi8zbFhMdGhORmRmYytp?=
 =?utf-8?B?bG1lWTZJK2sxY3NLVm8xcjgySXRsTndEVmVobGVkVTZoR0kzUHdpdFYwL29w?=
 =?utf-8?B?K2Z1Y3BvWWFRaG0yWFdwbXhrbFE3d3ZDZlkwTzBxTjFrOXdKUHRDYXZScFJF?=
 =?utf-8?B?NHFEYXJQNDd6bktBVFNMcE5iM2ZIei9sM0dNb0dpdjlxcC9qb1FicndnUnpT?=
 =?utf-8?B?VjMwQXFVYzlBekVDaDhuSTFXai9HUkwxN3BmQlcwWlZGenpybzdmNHVMUThK?=
 =?utf-8?B?TEdrdExVVWN3bno2cndpTlhtQzQ0djVyang2a1VTQmY0eHNuZjQ0MUFtd1Vz?=
 =?utf-8?B?YXZVdVZGaTQzZllNYlBZbFF4cThHN2FUd3hIV0wzNnZHVkFrQkRtU0FtYjZC?=
 =?utf-8?B?bHFrRmZHZm9vbm9TRnBsbGhraExGK3JsdHZaazJDVFYyb0FlWkJNSmcwTjJY?=
 =?utf-8?B?WnFGUTNCbDdGb1QyS3BpQk5jVW5CZGVsZTdJNlhEN2VTZkNZRXJYc2w3QXFT?=
 =?utf-8?B?RGYwS2lJNW91cEd6eDNEM3owenoydklsblBlbkVkQ3JkWjd2c2pDeUphWHpS?=
 =?utf-8?B?YzFQYVhQMWhMOHBVd3d4TFVEOWcxME1LajY1d0pBK3hnV1poeHlkL1I3VEZ5?=
 =?utf-8?B?cjhGR05GUUM3N0ZydmczTCtxMmFRUTJsNnlZWGR5cGxlTXJ4ZDBLYm1CbWhC?=
 =?utf-8?B?WENQbXhEd0dndE1SVkN1K1N4M1ZQcWR5RmxaVHJSMUVMQW9rSTFyMG5zZTR6?=
 =?utf-8?B?NjVNa3EvRUduTjJSNElzSDI0c2VHQk9BK2hrSWgrQWMwV3VRdHRvWGlSZXpB?=
 =?utf-8?B?M213VHI3b2xGd29GekxpeGJSSzNXTVdIa0l4MFExRXF1elRaWHBoQUJ0Y1Vy?=
 =?utf-8?B?dFF6VmtocjJPVkpybVRiNVQ3ekVGTWw4RU9pUFRuTlZVbXZOb1ovWWVpa1l2?=
 =?utf-8?Q?wI6NiagJXEQDCMYA=3D?=
X-Exchange-RoutingPolicyChecked: EE2bWT8R+bNqVuiPI1F/k5iyirUhuDSA3C6aHjzc1xbKBBrSleaISkeGcYeI5W8uyBjyVw6u5SCGF+q7wYr4RULSRHCjNhuDMpZszzngaytriVWiVq9TjxNapEXqVxXxo2rty3IsfKUYDLDZ0b5RSGpHnTUoWQcWxPV1Hdtwqxr9RupohcCGiXOOFegSs2KVCZUyyS83TYiJ1tRoHTNJMzzh1MENNEKbpvV/KGU9B4Co4/W2UQsIGPzulG1CFFZeFQLMFcX1EJulf6x+xyvzR6KqNkIu/7rusk99nblBYfPtkoLxaBeK+4dR4tC5460DQUmqRzoYOAeRwEhCWOILoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3c8724-1b90-4768-d833-08def6d45640
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 11:41:37.7634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH4xaVu4sesjP/4a0i7LU5jeRm5++aXBl9Ztg8s9QRxXa7hjeh+ebnw6gskPjBGtQ9BWjJmH/7Ee1SklWRmd+g/3V7FlR+VOrxT0eemL2tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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


On 8/7/2026 6:04 PM, Jani Nikula wrote:
> Skip joining for pipes that can't work as joiner primary pipe for the
> number of pipes being joined. This limits the invalid combos early,
> instead of ending up with crtc_state->joiner_pipes that would fail
> during modeset. Before, crtc_state->joiner pipes could have ended up
> including pipes that do not exist on the platform.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_dp.c     | 5 +++++
>   drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index e1604bc895e5..6b60e0a1c8ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2910,6 +2910,7 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>   			     struct drm_connector_state *conn_state,
>   			     bool respect_downstream_limits)
>   {
> +	struct intel_display *display = to_intel_display(encoder);
>   	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>   	struct intel_connector *connector =
>   		to_intel_connector(conn_state->connector);
> @@ -2924,6 +2925,10 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>   		return -EINVAL;
>   
>   	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
> +		/* If the pipe can't be a joiner primary, skip early. */
> +		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))
> +			continue;
> +
>   		/*
>   		 * NOTE:
>   		 * The crtc_state->joiner_pipes should have been set at the end
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 3be1643f8d03..379666692bc8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -770,6 +770,10 @@ static int mst_stream_compute_config(struct intel_atomic_state *state,
>   		return ret;
>   
>   	for_each_joiner_candidate(connector, adjusted_mode, num_joined_pipes) {
> +		/* If the pipe can't be a joiner primary, skip early. */
> +		if (!(intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes) & BIT(crtc->pipe)))
> +			continue;
> +
>   		if (num_joined_pipes > 1)
>   			pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1,
>   							    crtc->pipe);
