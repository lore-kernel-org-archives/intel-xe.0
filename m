Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9B2FB5164
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 20:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BDE10E2BB;
	Mon,  6 Apr 2026 20:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIpzcT1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80310E2BF
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 20:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775508698; x=1807044698;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vk5SHK6nm9+c3xx0JEykadr0eh883odihYNyuT6s3gQ=;
 b=YIpzcT1YcPeeLbwRp/mUXCA71cjWr12JEW1m7x0kIglPCNdRC9R61bPc
 80DjqRBaxCriIEF1UY75xJfwF6FtUTlmi2F87TbA7tPzn77iY4MGQoasF
 cbv3APdO+/shvTnMXOzbUPXN/8cchzfjrtpMItEodan791r+dDkpIqLw+
 XMQLWrdCAGJFgFOCVwNz2HNIczdd7K91tMRoqoR8YPiDfJiNMFJstWfUZ
 SDBSI+BPZU2KXiaSa9SRcTCHN2uVtQZe4QuLmzB6tnD5C17cL/yp4NhnH
 AsZCb4k8CHmaOAH75zYZaMr+uOCu30BMyBhr3XHWaQ6qGFW/M9NADVf2q Q==;
X-CSE-ConnectionGUID: ObKENWmWTC6tebbG3Xwlxw==
X-CSE-MsgGUID: HnKaRS7URSShtaAYG9IBWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76651277"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76651277"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:51:37 -0700
X-CSE-ConnectionGUID: WSDtPySTT1W4hvL1Kt2e9w==
X-CSE-MsgGUID: 6ZZQwfmcQO6jGCk0z7m6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="232367250"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 13:51:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:51:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 13:51:36 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 13:51:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAL5ipZSrD2TVVVcn3wTcDTQ4IAS9VzTB+jLzhY3c91igIQ5+SxJcmBOiToBrD8EsA0TJUHnBP4EIi1U4OJBb030iGjUzySu8dcw02/qb9O4KDRD5SAj20avND4MkoLH3sZjklEKyiYmoXvQZP1wA6mqCzu4Twi93jbKT4TdsqicNThgM+sYCGe2CYWVRbj+uCfa1WOmJJXX6pJ+FDY7xr0WQydyAxBXV+7LkUkqBSPkWqIsi1eoQtlsfoLAL2G5lTzRTKS86PJ3QmS6Ee0b7/f6DVJgP5jmDbatqIHeWUuZbOIaNdtEtBnRA0AQD4VbW0xuF1woM4ftUqczghvXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuD7WPkwugI3glFh872x6V9ft2YcJbnJXVFJ5sK/u2I=;
 b=nSSrXrob9FXe4Oz9FC2/giFq2TV3T0nYNiCcqKEMH7u4+WMdFNzZxHxRJALpKyGg1gvlD2HpOwyfO8+//OtyI8lUd0+6HrnBRc9N8UGC6G85mYPOVgp0Ha/GbUhQYpmkaQhXZx6r9YPMz21tHjb7iHLbxVj23SOZNtEY/qkSpTw+9ms0+MWCaRpEAA9XfG8x7YcqGe6Pl4iivqJ2TCYhaBLlQMFmX17yVGhQy2Gg41U2hcMOkkTn+oTPceelNQlmmqvyp/vyGZARq4YWUoOQEGZJd3MsbhlILJ3w9P5Yez2JvRCJ+ZTHHeTdoQZLZXjgpdCtEwz6XxwvbJx9GK0gGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH0PR11MB4918.namprd11.prod.outlook.com (2603:10b6:510:31::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 20:51:34 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 20:51:34 +0000
Message-ID: <89b906db-9d60-4fcb-847f-62f76c82b4ae@intel.com>
Date: Mon, 6 Apr 2026 13:51:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/uapi: Fix grammar errors in xe_drm.h
 documentation
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
 <20260331172049.3053871-9-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260331172049.3053871-9-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH0PR11MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: d47a9815-e8ff-4b7a-5149-08de941e4a07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: N0RGq2uoIRnrUAFwRSnsB8fjX3EV4TL0xfH80e//SU5kPGQso2A4xISU6q27Mkz8txTxln5CfPZQeFhe9zgQe01t7i+HHrtMo27wpsedDUwiim3dAZrqzE/jaSRD56zPFw3oK5FV69hHp+98pY4idLV4bGnRzHGHd+/5znE6EyS2nmgc0qHMMEsFN34wEgF2k1hL/wq7xbfDZYn4oKlINt8JLhbnN75Wd+2B9IN9xY88sDdqfcrXO+ttRXQldmUxVVpvzJ7qqClfAMu8qnAR5NvcG5UaHuip3raTpRlw2iT+Kt0A/MWSZsjOZR4iLsLRcl9SPfvUqlxLwzs4Zl+pruhRCmczUDeaqcF+BjGkS6IZ6VNi0LT7LHCJ0yBMuBd8YSYTWAvKxPQbTZpehYa2fbgjuSS2VMzaqVnBvVgw94X9PwoBJiNtQLaA429E+hck5czCUzTgE4zm5b4lDz6sc3oVg434evYMkQIB7gGS0kPMs8yPbicUioS6YtJJQUc+cPpYOhtnbkvGZlqIzBGdm5Gc76QDNmtMmUmN6S5zbrYkcKM7w190cSGfv6wbWbwvjLOWjgWYQLVefoQGIDIqw+19vs5WafQIZHEbOUhwK4vDHxYH20tpwFAtiuozC7uY7Aron/lFlRXiQDvQ4iIjR7JD6ifvmWFU0JBwHdhsFWYoqQwXVivJ6hSm/E9u/rkshIaB4G54ho1SteddRa9u7L8XYuZuM/AGDBKRDdBYgqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVJSaUFJT3hkWmpBeVFrNkRVU2x2c0JuT0RVdGNteUxJc25DcU1uWnNxdlVM?=
 =?utf-8?B?SUt0OExObVZNQ3JXVDl4L004ZnRyT1BqQ1lta2VhOUpaLzdtdTUxUm1OYWhQ?=
 =?utf-8?B?ZVQ1ZWhranE3amE1SHl1WnZYV2hvaHk3dEMvZ00rOE0rWktybWpOWk9CQ3F3?=
 =?utf-8?B?MWh6NG1iSDJFV3E5Y05KSnRyY0QyUHA1L3RWMEExcDJWNUhMb1EzOXVlN1JT?=
 =?utf-8?B?azdmczdWRFZtemwzaDRjaVBidkpkeXF4cUZYWjZYWVhYWWNvK0F0Y3NqV2hY?=
 =?utf-8?B?RUJpWUxqYkVVYzNidEVYeVI2RnltME01a2p4YnVKVEx4RWRObUU5UStuVlJ1?=
 =?utf-8?B?ZmRMNFZ2eWI4ZktSdGkvT2N5aU44cEFFNWZkRlpGMHFFZllXQk5DWmxJUVRN?=
 =?utf-8?B?QkJrdG9FMWpNNzlOTzlLek1OMFlCdzhJZHQzbXJqczcwVVBBOEZOQVo5ZlFo?=
 =?utf-8?B?ZnUxcjBvWEcxNjgvOEN3bDlqQy9BRkxud2RhS3lkUFlQbWFrc3FRZEJGdEVl?=
 =?utf-8?B?a2FnWnhxbUZmcStHOGtVdklkM2pQbGt6ejlOQzQ4SjgzVS9YYjZrTDU4VmND?=
 =?utf-8?B?L0ltRWM5M3AxYmE2Umpyam04OUlROHVHZDJJbnc1eXlzc2ZvVXpIUDhBVmw2?=
 =?utf-8?B?MlE5S01XOVdxV2hzUkhxWElYaUVpeDFwYkZUb0xUbFRhKzNTcEgxOWVYWDc4?=
 =?utf-8?B?OHJHRmFMYmo2dXdsT2dNeWNwRXhGZlJtRlBydmEvSUMvWHhwZm1YUkRPcmE1?=
 =?utf-8?B?YzZJODhxaWRKM1U0UmpBK29VK2pGYUZPZGI4RFNGdVlza1RIZC9MY1c3azlY?=
 =?utf-8?B?MytSQlE1c2VDZVBoZFZ6YmFQYU12bFFYaFpObnkwcXdpanNnb0pyWmtOZ2Zw?=
 =?utf-8?B?YXk4ZXpkeUJzTHQ5NDVaWDQ1Z0RvQnNOdEJ2dDdDLzh0U2R4MVgrMFloZnJw?=
 =?utf-8?B?QzFuR0NuSnA2RkNuQU1PVXlNUmtEVm9tU1hkalFwc2xZanVpU0k1bzJuTDJG?=
 =?utf-8?B?andlclREelp1MVdBclAwVnJpaVB3SmI5c0RxREI0a2VYMHkwY21RVlZ5Smd3?=
 =?utf-8?B?N1lzQkhqT2pUWlZvTUx1dGZvL25YVjZ3UjRPWVluL0ltMWxlS0c2QkVUb25Y?=
 =?utf-8?B?SHZ1dTRPRGN0eWVqYXg2dzVDeTZSQUhyNGd0MDBOaGUyZzFCckVUbmtIZVA1?=
 =?utf-8?B?VU0rWHpsN2NkSUIrNVdIUzRDSDZ5dHJRRWZIU1o0MkVvYUFxdWFEcmlJNzNm?=
 =?utf-8?B?MU45OE9ia2svK3pUMTcyd3VyL2h5dlRDUTgreEQ0UXo0WmVzM1lxUzF0OGtN?=
 =?utf-8?B?VEsvaXNXRFVUeHNYaWJ0QUNxR2hsN3ljQU5UL0htcDZxajZqZzhrdW4zYlc4?=
 =?utf-8?B?d3M3c1Z2MzM5N0VOMWZzRFR1M0hXQ0Z6bHU3bGMxQjdDOGZPYnp5ak1EWDNW?=
 =?utf-8?B?T2RXSlZYSy9rdVNRbDlHTmNKNXR4RXFXVU5ZRXIyU0VKSkc1MGhwR2hhb2VF?=
 =?utf-8?B?dmVRaVhKeTIxbGNzNmtPQ0ZuOEZienpMNnZYZTNBOVJlRWh2OElDN00rcHJ0?=
 =?utf-8?B?QUNQZmxvWk55a08vRmJQUURGKzFEbGw2c0dsbGVmTEpBRjc2MnhpWlNRODVX?=
 =?utf-8?B?ZWxpNDNwTzljRnkzR3daSU1NbjlvUzJLRHVPK2tBUE1ZeGRFck5rMzkrR0xJ?=
 =?utf-8?B?d1hLeFBjNHhNZ0lOYWxhZjNJSGx5WXFIelJzdTNJcVp2elF2K1R3dDZBc3Zh?=
 =?utf-8?B?djJ6WW5rNDJFMmRIVTlob2EzUGNycnlCWldsZ3ZEVSsvbkZSQ29Edmc1dGc5?=
 =?utf-8?B?eUZXVUdnZ3NvQzFqck9GYjU2WGNqRWxVUm05K0tFNzUvTjZlNTJwa09OS3ZW?=
 =?utf-8?B?NnhPMWFFTDRsTmh6WG9OcG1semx1WWtwYUFIM01YZGZuSE5kYk14ZDVSdmpU?=
 =?utf-8?B?ZjllTE9DSEZGZzlRcGsxVkQ0QzBlazBDZVRGWWlLQU5mL1F3MVRzK0V6NXQ0?=
 =?utf-8?B?KzRxcDcybDFMTTBPZm5raUkrczVKZ0wxRzRLcGthZk82a3NJbEdPOW5rakxn?=
 =?utf-8?B?cmdVOWdmOFVyc3djTUIvdU1odWVPcjRRTzZLallRT21iaUFSU2E2TDdRNjgr?=
 =?utf-8?B?NVVML1dzbW5jWHkwT0ZWcm9pbUN4RVFaTGdpN1lBSmhUb2xLMTRUNlFSekJp?=
 =?utf-8?B?YTNPeEVwSHVodmxzTmdqT0crQ0RKTHhUa3R1SXE2SXh0dTNKdy9HUkVWMUdC?=
 =?utf-8?B?WXFNUzJFNHJGNW9QNUhvNGpnVG9YRi9JUSs1LzM0bHFWZ0RtRnkrYkhNTGd2?=
 =?utf-8?B?cFBhU0NrdDlSNkFSNzIyYkJVejFObmhpMmkzdkpCMEJSZkdWSjd4UT09?=
X-Exchange-RoutingPolicyChecked: e8nWta7P2oHCjffvTm8z5G5t1i5uVfdRREWNyiEcadZIktIwlIsOYAWFY5/nHagztxSwwgo/GDx/oEH07ReB8ANv/rRiK6MNJrpZde2bJWogj4IqSw/UVKNxyTYqXW6c1RYG8NEHdNTeSonJTOgVYcEseDG1dFgndStNwobeLvLm/lKgCQgpCUADkVEcPmiPqXJoXr5vrnsqS7L2GG+/P3jYW+WS/Jt+rxWtDKhuAMgfS60FLi6Ctf+gffc6AfdIRLmPZ749YQX0cR2qDYxbcAMpvXikLO8MuTqyfVVYAhdwTBIp9X8ea7fWmg74sdPajt2gmSqqmIKoJGSn6UZGXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d47a9815-e8ff-4b7a-5149-08de941e4a07
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 20:51:34.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95XVm+vIt3i9WzhjcAJ/18e20eOp8KX4asPmnXo8klv30kYqDTR5Hoi/SyEdRRHzvGXaWIRghkfKrbJRlhrCUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4918
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


On 3/31/2026 10:20, Shuicheng Lin wrote:
> Fix various grammar issues in doc comments:
> - flag are only valid -> flag is only valid
> - should only ever used -> should only ever be used
> - if isn't already -> if it isn't already
> - Type of the this -> Type of this
> - When sync passed in -> When sync is passed in
> - the users responsibility -> the user's responsibility
> - must qword aligned -> must be qword aligned
> - for a observation -> for an observation
> - a memory ranges -> memory ranges
> - for each memory ranges -> for each memory range.
> - Second ioctl call -> second ioctl call
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f17355684083..1d3406416d8c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1045,7 +1045,7 @@ struct drm_xe_vm_destroy {
>    *    set, no mappings are created rather the range is reserved for CPU address
>    *    mirroring which will be populated on GPU page faults or prefetches. Only
>    *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
> - *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
> + *    mirror flag is only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>    *    handle MBZ, and the BO offset MBZ.
>    *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
>    *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
> @@ -1109,7 +1109,7 @@ struct drm_xe_vm_bind_op {
>   	 *	ppGTT WT -> COH_NONE
>   	 *	ppGTT WB -> COH_AT_LEAST_1WAY
>   	 *
> -	 * In practice UC/WC/WT should only ever used for scanout surfaces on
> +	 * In practice UC/WC/WT should only ever be used for scanout surfaces on
>   	 * such platforms (or perhaps in general for dma-buf if shared with
>   	 * another device) since it is only the display engine that is actually
>   	 * incoherent.  Everything else should typically use WB given that we
> @@ -1366,7 +1366,7 @@ struct drm_xe_vm_get_property {
>    *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
>    *    there is no need to explicitly set that. When a queue of type
>    *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
> - *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
> + *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if it isn't already running.
>    *    The user is expected to query the PXP status via the query ioctl (see
>    *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
>    *    attempting to create a queue with this property. When a queue is created
> @@ -1546,7 +1546,7 @@ struct drm_xe_sync {
>   #define DRM_XE_SYNC_TYPE_SYNCOBJ		0x0
>   #define DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ	0x1
>   #define DRM_XE_SYNC_TYPE_USER_FENCE		0x2
> -	/** @type: Type of the this sync object */
> +	/** @type: Type of this sync object */
>   	__u32 type;
>   
>   #define DRM_XE_SYNC_FLAG_SIGNAL	(1 << 0)
> @@ -1559,9 +1559,9 @@ struct drm_xe_sync {
>   
>   		/**
>   		 * @addr: Address of user fence. When sync is passed in via exec
> -		 * IOCTL this is a GPU address in the VM. When sync passed in via
> +		 * IOCTL this is a GPU address in the VM. When sync is passed in via
>   		 * VM bind IOCTL this is a user pointer. In either case, it is
> -		 * the users responsibility that this address is present and
> +		 * the user's responsibility that this address is present and
>   		 * mapped when the user fence is signalled. Must be qword
>   		 * aligned.
>   		 */
> @@ -1664,7 +1664,7 @@ struct drm_xe_wait_user_fence {
>   	__u64 extensions;
>   
>   	/**
> -	 * @addr: user pointer address to wait on, must qword aligned
> +	 * @addr: user pointer address to wait on, must be qword aligned
>   	 */
>   	__u64 addr;
>   
> @@ -1769,7 +1769,7 @@ enum drm_xe_observation_ioctls {
>   	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
>   	DRM_XE_OBSERVATION_IOCTL_ENABLE = _IO('i', 0x0),
>   
> -	/** @DRM_XE_OBSERVATION_IOCTL_DISABLE: Disable data capture for a observation stream */
> +	/** @DRM_XE_OBSERVATION_IOCTL_DISABLE: Disable data capture for an observation stream */
>   	DRM_XE_OBSERVATION_IOCTL_DISABLE = _IO('i', 0x1),
>   
>   	/** @DRM_XE_OBSERVATION_IOCTL_CONFIG: Change observation stream configuration */
> @@ -2373,12 +2373,12 @@ struct drm_xe_madvise {
>    *
>    * This structure is provided by userspace and filled by KMD in response to the
>    * DRM_IOCTL_XE_VM_QUERY_MEM_RANGES_ATTRS ioctl. It describes memory attributes of
> - * a memory ranges within a user specified address range in a VM.
> + * memory ranges within a user specified address range in a VM.
>    *
>    * The structure includes information such as atomic access policy,
>    * page attribute table (PAT) index, and preferred memory location.
>    * Userspace allocates an array of these structures and passes a pointer to the
> - * ioctl to retrieve attributes for each memory ranges
> + * ioctl to retrieve attributes for each memory range.
>    *
>    * @extensions: Pointer to the first extension struct, if any
>    * @start: Start address of the memory range
> @@ -2443,7 +2443,7 @@ struct drm_xe_mem_range_attr {
>    * If second call fails with -ENOSPC, it means memory ranges changed between
>    * first call and now, retry IOCTL again with @num_mem_ranges = 0,
>    * @sizeof_mem_ranges_attr = 0 and @vector_of_vma_mem_attr = NULL followed by
> - * Second ioctl call.
> + * second ioctl call.

Reviewed-by: Xin Wang <x.wang@intel.com>

>    *
>    * Example:
>    *
