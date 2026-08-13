Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4CAC5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 10:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA86810E4B0;
	Thu, 13 Aug 2026 10:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZX6Y2SV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03C010E4B0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 10:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786618377; x=1818154377;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YPh20z7SG2+WRCwfByEtDthWeXu5jtgCYw8F5nTasdc=;
 b=TZX6Y2SVnE7R2hvNG4KLnrbXF+DJwnepX8nU5LFvep6K7Vkbb+6cSOaG
 LTIC2L2AYbkNcszsy0rSuGcufCBTpIB+gcCoylDqO4W+qyFBNl+jP9iRL
 r844iHZvhX9O8kll9Q0WTxuX+t7tfJuJPOMeQm/35/KKAp/kdJHZhbvFr
 yVJPIcmCus2mfCgo9S8Zzw1K+o03Un/mU1DBV4E1hiS6m+MSa7zX6kXiu
 JpGu1cbMJqO/40c4KLJDjmokl5i/n0zBki5DHAlYi5cQARlrW9l9Enisl
 PIVaj+vt5reyK20CGr8zBlNz2mPobHV0t++oEwoIim6PPDnze1xwWOBvr A==;
X-CSE-ConnectionGUID: bJjqdA81QSKzlr+6xdrnoA==
X-CSE-MsgGUID: OlVUz4LfTgOsFaUgW8j14A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98341275"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="98341275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:52:54 -0700
X-CSE-ConnectionGUID: 98kHQHdtSwiRkDIPbsPCLA==
X-CSE-MsgGUID: qOQcdRkhRYmiGFSejovSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="288696561"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 03:52:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:52:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 03:52:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 03:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvnI2ExOpppyU+qqgtyyHGSFrYUFOq/Er/ms9DU8s4F62lp+cx+wIf+icG6VPZ1FSwe2FpnkNT/jBIdMotAqEaAI5hMtfZprihDLRYl7RRnL9tjZohJtIi5kbRhoKt1udk2JmoDXQvTrDXzvTjQ5HWZiOjTPA7rN0/ZWh+y8H86b6V03DdGSt+78OKt0SeH5d0fNBNm2nemmJXv36QQHdfFTNe+pLY9ycmSihYYzXob+3BpYFJKyMQ11CjpvRk2leHo8QlsUtumgicGjHayXJ+5E4p8osXPtfcirKv4PKfJA4WPzySQZFvRedMY5caOsXo8dlJb1aOkOeNrdVtI1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcsSAr5QEeS/l7MukW+Q9tEVdsagMZ9sDD9a/Df5AX0=;
 b=oVmtLsTB6VWwQAcerV+KN67+Z93ir4pd27xIfC6vupEi1U+JszSuNQllpG/+z0GSHj8wssevLGhMGbbAL8EGPB3iRRhdhJkIVoEoEZcaZHiuyKhJbb/1Fo1tBasQ8XBi87CO1nj3+nkY0km3wFeWJmvq6vyTcuyVUj1FTxqYxBXjf3uQmtxJUIGDARw9n/aprjgSL7dcIVqY/ePw/iPtOwXOf5gDd/aXUmzvnwWao3vyFjE/gyOCeS7Q9LdeOztUnXXN3J3B9kYkVSX/75MWOTBeRPKcAqimDiMweqlWJ6S1zaDmF2xb7eT0vXO+jBDLIU9H0hyqSykufP+LRAXYsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 10:52:44 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 10:52:43 +0000
Message-ID: <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
Date: Thu, 13 Aug 2026 16:22:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-23-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6cf913-d000-438a-7869-08def92900d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qTnReNblaItiLqzttBWoMAUn/PqTFR6/daGcr5MVZLp6sMfQ78zp0Oq3gp2C75+thlbr8vP9OSmqCUQuCPibqTWBQ9LVvdZKVt4vpIwGopj6kJ5IgknQl4SArjjOC1BNmxgiCCbbUKkOE+nqXGKDDyqUZfMIQ+qfR5sDdiDzq2/1YyKdcdxfBfz7MLxemJqR36lVcoLzQJR4DExvqEoTueDFmj+/ZdOrBgpJvHPGj/qtBQYKh0ffI5AClyUiAKjONX6+tbVybMC4aWS29HT5snU9c5yfB3e2rMtqroAFNKggy4DnXGCAP1135WxSD1CXevXUZeORanQuybXlZPZCKJWUzX/7G3ZXOlaSgHVAJgTqs696RkUob31mxFz12R/famBgpWNAiM7JYs+e8Gs5/X3u+Qcgh/qY5u2C1Bd88hvTjNTzFPtKx17O9hHf31EcNn8FbltXyyqhmCWnrLjf6BQViszNIrsn+S040dwhRqM8j4KZJciGi/u0tnwZPhPHIBKggdcsJwtz2jjRaHZq4NZ2SB7pQe4l7BEBlMelvL+ua9W+u6YdTTXyrTNvIPYXIXraYa/UH/V0bgSrugp6iY+OqAt7gAcTGC8q4UYb/v0Y3OYmxWBrnPoey2dqq4jPqrtKxDfqTIPJYXxIZkNgGy21/i0UF+FouedBoCiuDvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0RnVFhJejFGaFlycjFXRVlIbmcrbmtpMzZpK3J6QmQxYkU4bDNLQTY4bTNX?=
 =?utf-8?B?TTBkTXJML1FvQlh6b1JRRjh0R0xhWFp1YnBTZ3UxL0c0d0F5QWhraW52NHlC?=
 =?utf-8?B?YmdvYS9oc3JXMFNNVlZhbnBWSUVhV25ReGQ2VlVzcnlLbk5sci9yMVdoWWxv?=
 =?utf-8?B?U2k2aVh5WTN1UjdMYUF4ZHdqUzBYVHp0T2Q1YlBvSkxjRkREenpXZzk5TWlR?=
 =?utf-8?B?bHRURHAxTXdoOUFxM3Z6WlJzVStkTFRiQlBqOXdjU3NqRzJPZmNQbWU0Y1Rj?=
 =?utf-8?B?NzZVWlNOZHIraEprU3MxcWt0TUJCYkVvTVh1aWFZWm5tUUVUcXB3NnpuN2Uw?=
 =?utf-8?B?TDlnKzYyaDJ6MU5lY2hzblhuUUYzNk5TV2NOWW9HeTNUa0F4b2JkN2hXQ01x?=
 =?utf-8?B?MWRjTldoVlR0S09pdGZtMjZYZm5hS0pUMWpMRFE5YzlDV21LQUtVYkY5NzJ1?=
 =?utf-8?B?bk14SVVjYUpsSWlGcEsvUDk5bUJaZW9jMHZ4TG1yZm9YRm42RTN6RWlkd0p2?=
 =?utf-8?B?dUhIMWRtdllxcnJpY3UzeFdnN3BEVndlbzNVVVRkU1hhakZsZE1taE95MGxu?=
 =?utf-8?B?NS9iVFdmWGdBeFVFNm5QV1RrcmNPaXdRcGtiOTMrZTY5WUFVcGIzcnQxU3FZ?=
 =?utf-8?B?MlZ5Vlp5RVQ5V25JMFNCYVkyNGcwb0dYTlBJMk1Rb3ZVRzJHKzlrRk14clVy?=
 =?utf-8?B?UEhmZ2p1VUlFeXh4enRZTFlFSGZPRDhKMExlRUp2SzdnTFlKeFpTR2hrYTY4?=
 =?utf-8?B?dzlITzZWQlRKbVNmVk9ZUEw2a0FnUlRjUTR5Qk00NnFhRUVHMndFNFBDVTZa?=
 =?utf-8?B?RUJ1VGdid0N5dVZPeTVFaVltU05Mdm5nNUxXdDIxb21Cdm5CZWlabG94SWlv?=
 =?utf-8?B?OU9HRmloT0xGTVhxNGw4TUIrWkNwMGZUdEFkMDJkNkZrR1JDNWFzTE5mOW9Z?=
 =?utf-8?B?bWZTQVppS2wvaVpHVzdHRWZOMWFSY2N4SDVaM0lDamtoTGFTbnVnd3htZGJr?=
 =?utf-8?B?K2poRTZITDlHWTdwRDdwcFMzckRYUkFyL0djK2xydEVnZDFJWWRPUEdjbEd6?=
 =?utf-8?B?WmlUYkVJRVB3cDUreFdkNVBBTCtDai9IS2NFa2xyOHRNeGl1Zmt5U3dtK3NM?=
 =?utf-8?B?M0VucVhzRVE4QkhLcUVTaHZ4ZFFvNU00Nmo0QlR5cWhjU3hFbVUzMmR4WlZv?=
 =?utf-8?B?ZW16bWpPR1R2ZWFsR0ZyVCtYenJlaWJSL3NvMkxXMUJVOXUrYVBQbm1ITDF1?=
 =?utf-8?B?UHRqSjVLeWtNc2lXSTlmcVNpQTVsd1UyZG1PKzdaR1hFdG5nOXpqVzduU2NP?=
 =?utf-8?B?ME5NYk4yakdtSkZTTnJ2UEh5bXc5Sy9LZFdOOWNtSUxMOGd1Y2p5dkNDR3lo?=
 =?utf-8?B?dmFvcnY3TEhKSm1leXBjVGphTWhXQzM5cHdhenJsWFZQeGJpOHQ5MlV4L2xm?=
 =?utf-8?B?ajhrMU9SRHdTcmhuRzEybHJtcGdaZ1lNVGpQVkFIYUsxR0xHenJ4MTdMdmY1?=
 =?utf-8?B?aEVHV1lyT3lxYlM0U2RNRGtZdUNzVmdBeW9YcXRaSFZzK2VtdmlDaWZicGMy?=
 =?utf-8?B?RTZsTllWdlJjY05UeGR2bE81UjZubng3Y0pWNnB2TktEUmRia256Q2VPaGdj?=
 =?utf-8?B?N2ZFakorWlNpODhZUWcxRUlhSndjS2hWdnJDdWpLOUhWNnhQL0xxNjA4ZmZP?=
 =?utf-8?B?UjRqMnpTemk3V1dvSFZJTlRjc2p1Y0tzS2VBWWtmRnBXNjViTmdKMXBjdVBq?=
 =?utf-8?B?bDcvUVFuRllHbzFCaXdVek5JazVUalpDcXV5ck43cE9yVk1pUlJIZUJGK2FB?=
 =?utf-8?B?TSs1VklNdkxvS3R6RHlQQnRaem5GZXh2UmNrNXM3OW9DVmc0bm9ZR05NZVRH?=
 =?utf-8?B?OXdYUHZMeVZTWTJ0cVBVUDFqVy93WTJOS1V4a1E4czNaemJxQjVsc2pxcWZ3?=
 =?utf-8?B?ZmNKNW5PNUVFUlZMdHFWOXY1QkkzMldVQW5iTUxKQUh1V0Z5YmlGd0lHaWtN?=
 =?utf-8?B?ZU9zTkhlUEpLVGM0cUxsaXpSNzFRb2hLcGR5NXcyLytraVZ0SWRvK0dKMWc4?=
 =?utf-8?B?aXUvTmg2QWhJb3NGNFZNQ0VkQ2xHMHpPSVI1ZGxIM0FDaXI5SUpTcElQRXJw?=
 =?utf-8?B?bHJRZnoyOTVLYzR2NUdoRFN0cXB2dTkvRjFMWTZOZGJWUkxvWDF1eHFvM3ho?=
 =?utf-8?B?aWJVVUR6dUZxdDM4OWlQcTdxalkweFRBSitlZHh1TmE3T1pkUU5LQytZY05O?=
 =?utf-8?B?MHFPOEpNVk1WNlE5eitkZkdRbmd1bTBzNWQwdjFRU0lvelE4NHQvRGcwNWxJ?=
 =?utf-8?B?bmRTaFZKbVlCTCtqQkpVTEtFTFloMHhPZmczZ0haVlNidFVhY1BsVlpVY1hB?=
 =?utf-8?Q?j3OeYlIA82c/2vcs=3D?=
X-Exchange-RoutingPolicyChecked: G/v/66I6SN2d4YSaoIP0BkOAw8k6WnzqdUDwvMAfCJh/y0rJkt57OIlCOtzvkdz/irqHgKCPyCIahEBYQ1rDhrMPW6XJhHgLvd+eNyLom3t5VM4vROaqFfuIoOZCNyHH9v74HPILvlytagzCw3JwDv1CcYfin4UG73Ma8mL0Rw4x07FaBkPQI+wRmWFeO2WnCbsVMUQi/wZeVCde+tUhVYXfQoFiQnqItxp2P+sqsO7ixjhJ444xHlxlgcb3wFX4xpB7MfwPUssRMwKbLS/AkrCZ7t8XkUpuNpgxxcCYvJcUeggMPF+P6ZOWIH0bG9DEAWuJUwt+SpH9NUigA9Vz5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6cf913-d000-438a-7869-08def92900d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:52:43.7515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1+rp5ADSZ3w55bj3FCwNmSxdsxtmVwVUx/5EMYdKijTjVAIT9PBalsLB3SADsG0rJ806cDEkAcya9sG0sNEqZgGAo/OCmqKaCTK5qsmgbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> Report 'Boot Mode' status or failure using various xe_log() helpers.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 2d8c532157fd..ebd288986c11 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>   
>   static int enable_boot_survivability_mode(struct pci_dev *pdev)
>   {
> -	struct device *dev = &pdev->dev;
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	struct xe_survivability *survivability = &xe->survivability;
> -	int ret = 0;
> +	int ret;
>   
>   	ret = create_survivability_sysfs(pdev);
>   	if (ret)
> -		return ret;
> +		goto failed;
>   
>   	/* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>   	survivability->mode = true;
> @@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>   	if (survivability->fdo_mode) {
>   		ret = xe_nvm_init(xe);
>   		if (ret)
> -			goto err;
> +			goto failed;
>   	}
>   
>   	ret = xe_i2c_probe(xe);
>   	if (ret)
> -		goto err;
> +		goto failed;
>   
> -	dev_err(dev, "In Survivability Mode\n");
> +	if (check_boot_failure(xe))
> +		xe_log_comp_fatal(pdev, SURVIVABILITY,
> +				  &survivability->boot_status,
> +				  sizeof(survivability->boot_status),
> +				  "Boot Mode enabled!\n");

In case of fatal, will make sense to return "0" OR we can add return as 
-ENXIO right? any thoughts?

After handling fatal case

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +	else
> +		xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>   
>   	return 0;
>   
> -err:
> -	dev_err(dev, "Failed to enable Survivability Mode\n");
> +failed:
> +	xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");
>   	survivability->mode = false;
>   	return ret;
>   }
