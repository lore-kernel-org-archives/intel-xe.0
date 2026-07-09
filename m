Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB49C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 12:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6359110E078;
	Thu,  9 Jul 2026 12:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5esTBps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E436710E078
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783601619; x=1815137619;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PK6yb5274XCf+cA9KTT5zqxNBFRhojr0EXaERAQLftI=;
 b=D5esTBps06kxv9VHTy6MbHj5ZDK3rVUtUoYr8ynujY0nb2rjWNr5CJdG
 JsWrCNtMfF/bnvIq3VnyvDU3t7RW0GBHojJEfI6ndEarrFSDqXt9j7Pp6
 pe7fP2snYLM3n1D8qVaq+r4lkyhMkk0DDmyelLP8EibGViwcyQriKjVEb
 80DXIpd5oQfrN/MxjGU0wuK7PtklVkPKWQsW3LyD4oJ3U1RXfhqqLzuzX
 5ZmZYj+ta2h3NdWmB01ByOOBXroFEj2M2rL/nQPiQNmVpY4SYNbUa/zJp
 Gmt5lB/ldt6MvW5a429+4I3I1fq2sHX6wDGzhipdNrewbGm+b14mT9vkf A==;
X-CSE-ConnectionGUID: 91d5PvV7RTiOG4zay4KzVw==
X-CSE-MsgGUID: kJ2xz6PhRnioFOM3ActlNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84158309"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84158309"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 05:53:38 -0700
X-CSE-ConnectionGUID: p2H2dFH6Tjux8X2kqg3ppw==
X-CSE-MsgGUID: yKkt3rCPRkaxn3tGYuAj+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254086818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 05:53:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 05:53:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 05:53:38 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 05:53:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DILuOF9tbi35DIxA5own+jhLWjhTXDNSs1HSEi4EbFOvd8RLCCKZF4a+OigTHKwoIrMhawYJEV42cCNhL4ifIDJcjVtyIc0OpM/EKd1E5xa2dYxl1ueO6wTt5avRXLfrdt4SAiGw/bT8dZKZpgDdWjyjxtzzIrta6WKtvBm9uLxydINOg2prnBan9Dd9fx4TXPqZbvkfyDftGj+FGBl0WWVNuzmJ9fXz1Sf5m7SdxUo+rc2tO6C7xJVWUpCITmJDHUZOa655k/Qr3FMeGE2kWVoth8AjbnfA2pAL0pwk3L1VnKcmjn0b3i8kM8mtG3Y3BrOR4826EFOcSGDq9dhlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ye6W5SLVv/8U2+7vhNMo92t/LGWdOweiAyNzUUxsG7w=;
 b=yo7z5FToEnAhepmWc5U/Rse41gBrYcT0eIWVClTZYW25ORfRUUekZSIjFdbnLfFMPXg6UJbo9SDgRNtxTb6gi8lDHlDRxMtEyS/Le/qKJ5Ix7AXTWhU49sq9Tj6nsZK8grSAxbZwa9UexRbheK+5euykQJTvHGXIMILDf2D6RRcdkwFXuAAG6AQq052Tk730GEPSaRWLSd3T/+dZDUoVZPDarqjwtHygmlxBdD4EnTMbzRMnymZWgWHmN74DZfVTZkxYF2GedTnDWEsEmwWkjQtNNherbr3W9F9mSK12BL1berdwnbXnGvn2Ttoo1zN2VnDCXUfcDB+LB45csS3thg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 12:53:33 +0000
Received: from MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86]) by MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 12:53:32 +0000
Date: Thu, 9 Jul 2026 14:53:29 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/13] drm/xe/guc: Add object KLV encoding helper
Message-ID: <ak-Zs2mfNWmaht4V@nostramo>
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
 <20260707220816.677-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707220816.677-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To MN6PR11MB8148.namprd11.prod.outlook.com
 (2603:10b6:208:472::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8148:EE_|BL1PR11MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 6936f5ca-09ad-4dd5-7a4c-08deddb91508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: cF86LFpySo/XylGybLr5vVIZ3SDy8a/kpDawDu8x9aC0FH3U7K+mDGCax2h26kNDBLw9vKmBMh6CiSstnFeQ8cqQC8g0ctdwbAMUrn5QP24uB8PAwxe44im+J9jmv+DgAvUjaci6pGL+9FZUBwzBdZ6xUo33eck2jey4fZPLpaUJS+cAAt9Ky4OTWaOTmTMkq/kvqOdhQcqTvDdBCKpvbsUKfXslReNjHbCJN38izbXHF6EAuzO3RvoqmhW46lZfl5gfBsZoP73RaXtmkwAseGbTJzFcnatnkSlreC3BJwYufUZujqcS8DP1HYn7PayEo0tdSGWBVGZUqNIKSzwnKOZvhD4GDX/FySH5LqHcbOaepUofpXO7OUpeNiydIsevGm1cuERZQv2oQyDrhQxYPyBiISEzBIp28x62VIgwHhzecL1TTfO5XCTTcBNw6zoX7DvOjLWO+9dDn8/pgDlXmzCEMCieTI3g+qIBdICzItG3UBXstjEfNO+UlC/6atGgHC28i9oV4wF6SzuE4DAuors5GndoperQdmDUq+ZjUkhuLPGksL3vzD0p39A1Z/7HIBvuqsTSqWQ2R1+PG1RWUXE/NRE2fC0gGHQQ1LJ+UFchhLxRAbP2Bj2UKoKZ1RtxOcofC6MB2HflNvVQDkNV2UdHrer/JX938wVedfPD61g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8148.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amNFMVBxa3J6MHNyNzRyODNrbFAvMHB5NFpQMkZaY3FEb25CRzY1OUVBbmZl?=
 =?utf-8?B?UUJ4bFQrek9Td0h0UnVybjdIUjVvSHlZbUQvNlk3c2lNbmNQbllQVTZTeDdN?=
 =?utf-8?B?YmtReExWRm4zaTVneXdxSFRBVTlhbXRObUM5Y1ZGMlhlZG0zR1p1NjhNVkFK?=
 =?utf-8?B?VFVHM29LWTBmLzIySmkxSVc2ZGJQMjJYeThDd21JN0R6ODg5dXRvR2FCcmNs?=
 =?utf-8?B?RVlmeVRGR2NlTkFIeFN1b3dGemRrOEZJY1FPUmR4SmxVTEMya3gyRnplZDEw?=
 =?utf-8?B?eUY3ZkZTZlpINjJnWU1kM3FPTStVWEJGMUN3TWk0QjFXNEl0bUFTVEppd3VQ?=
 =?utf-8?B?QWR4bHpQQWtKejlhYUNVVGpqVjNoNXp0a1pTTnByYzgwRERJcDBsV1E2S1Fk?=
 =?utf-8?B?N2xFaytzNTNpQTdiTy9LWjdrQnMrVldTNW5rZGJlOTI0d1lMcFludUV4MUxj?=
 =?utf-8?B?bWpTTHNmYXdKOXlhc0I2QU13Y1RDZEVQa0hERml0WUR3TE5GQzJWSTVXVXlw?=
 =?utf-8?B?bEFoUEkzNlZHKzVCVExtcXBGckkyeWJXc3FnUDZnKzVQbEo1TmdpMGpOaUdn?=
 =?utf-8?B?NHdUb3ZxbFVOZGRSVnJWWGdBTXZvRHFJWm9ER0VKQkh1bnZXdjNKampaamFH?=
 =?utf-8?B?NFlwWUZqSVpNSkJOOU16ZkZaQTRsUDd2UVhLbkNBYzBkdm8zcjFsN3FnN0RN?=
 =?utf-8?B?TVJYRWZwVHdQZjRScVJjSkhpRW9zMHYyWEpwZ3BVbHRibEdMb2E0b2pGTEU0?=
 =?utf-8?B?Wkw5ZGtyejVjcXIzNHF6Vlo3MHBmdW42VEd5dnppL1ZuZ21GL2hjUW9veVFw?=
 =?utf-8?B?QjFDdWFhazh3VEJ1NXJ2a2tLRHJxdkVDSFlZODA1VER3OU4wQnJCS1Zoc0JT?=
 =?utf-8?B?UklibENua1QwL2R0clpRQzBwY2hhNnFGU1dud1l6N1RkQ0RwVVg1c0xNdUNC?=
 =?utf-8?B?MW1iWUpQNFBuK1J5S0FmMitDYlZyUEpUelFYQ0FjQXpnWElUS0REblg5Zk1o?=
 =?utf-8?B?cDN2VTNsSXpOYTJKYi9Ld0o3ZE9obWtvbkVqTmw1VE1lT2drQlUzQTF1WC9E?=
 =?utf-8?B?ZTd5TlJYQWxMU0RhNG1XYkgrcXRDUmdGZG1kZjFVbXNoVFA2WjM2QnNtbkJl?=
 =?utf-8?B?eUI2bnJNL0JMclNpV0pFZGx5YnFyS0JKRlFNSldFMk0xMjJqODdsR0RleGVJ?=
 =?utf-8?B?RGo0UXdYU0lFMjBQVkFzaHZPdzBmckFQS01FWEIxd1lnSmlqLzg0TGgrWlQr?=
 =?utf-8?B?SThwKy9nN2RZUDF6NjdjZ0FVb0lvVzFnWUYxNk1PWTNQTjJvZHBOcWdIdjB2?=
 =?utf-8?B?b2ZBTVVOYzZDWVVDWGxZNHF6RHc1T2tUQjhpNzlSZVFURzRWd3AvYklEYjhj?=
 =?utf-8?B?OHpEUVNIOFZUb25kMUpvR3h0V3owRUlHZ1ZkUlBlY1lWZCtOeGx0TS9OeTNV?=
 =?utf-8?B?L3hTSENzazlWUDRodzZSS20rai9RZTd3b2tsM3gzZWRlbUMyNXVpdTFEd1ZJ?=
 =?utf-8?B?QkY0K1VvSmFGanBud1huWERhTkcxMUwzMmZPUlJ2aTlwaXdXWUUyMXNRSkEz?=
 =?utf-8?B?VklSZkpQb2ZoZnlOcDkwVWM3U1lUN3dtWnE2VEs0UG1NZDl5azFOSDk0QVZa?=
 =?utf-8?B?RU5haGJBQllSalVBRStDc3EwblZoZGM4NlZQOGFHTWJZWlRWalZHNG1lV2lW?=
 =?utf-8?B?TEdxR0xUUXo3NlV0SkNMamlMdWxBSGZlblRaalJ0YjhHRnk5REtUU2J1dUZR?=
 =?utf-8?B?VFBTZVJFM0hvYTFtRysxcGdOcXUzaEFtek9HUkNyaFV4SnZHbzg1RXdORXB5?=
 =?utf-8?B?eXEzMXJwVkI3cXpra1V5SzNweEJuUFY2YzgvUWd4NGc5T014VjZQMlM1V3B2?=
 =?utf-8?B?YXhHemxvd3paVmQ3dWJsVUV4Z3h6N1hqNFM2MWk1dHdUNnNtUDZFUXdRU2J0?=
 =?utf-8?B?UXBKK01KdFMzbkx5WE9iOUF0TVl2MlJZem5ja0hmcjRELy9uejAwVTZnSXhJ?=
 =?utf-8?B?bzRPSzJ2RnF6VmZFa3ZTL24xUEZoZFovcnQ2ZUtoRDIrZktpbENwcjNpT3hZ?=
 =?utf-8?B?SnNXWGVPaGhVeVBtWHdYOTZCOTVnWmVPTWdQUXBRRHNob1ZkdUJmNkh4VW55?=
 =?utf-8?B?MENBd2NrVHBsNEk3MjJudUVHajhpU0ZsaVBMd0pHeEsyckVVQVNiNjJoUWt4?=
 =?utf-8?B?UDBpWFN3UmJ2bDkxS3hDZWFzZTY0VlhPZlo2MlpwNUZwWTdpUmtncDBnekx4?=
 =?utf-8?B?c0pXaFB1SW8razU0dzVsT1dDcWNYREhTYndkL3NlRzFWeDd0cVduSWV5N3Q5?=
 =?utf-8?B?OVZ5TUtHNzV0a1I1MVovREJWdXFSM2FLTkpvZ2ZTN3JZTnJybVBobFN1b2dV?=
 =?utf-8?Q?tk5641Ap4/JWvDZM=3D?=
X-Exchange-RoutingPolicyChecked: fsRcXFMKmU5bCqeX9bVCcvW3chjoQ3GFkFAtKaejTmdu2XUhSbjZBJRy51k9ab07YR0cURowcFfXO06VbidSKsBycmignK10FS2x6uLOgLhHBJk8Gl8QfA181CWUY1AJqXoJBRwqSieTUBnux+R15v1lE0TAfzuguSP8mPgoeMRwrEeV7ACRUVYFHVg7QPWOi9/fZxa/vxGEqbonDRa32nqZRkZ6bICscFzWyNrUtBLEbl1hsXiQ2lGOcTftGdSnkMQkPNbTxQ+ZLrDA0Em2/YyGuXIurqKRdl/ICf56+WE83SeOcp+RUHaQ8ndxkS8yt3bli+3OqLEewNBlscbCHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6936f5ca-09ad-4dd5-7a4c-08deddb91508
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8148.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:53:32.7912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mh3uc2rNIucJ9dnT+P85N86W19Gp1rWdsYnX3pyF7WfIFABOKRm4ta97af1YwxzdkRw71eb1WkfX29FRf7NOf9OaMWd/a1fjbyjVhHUPZxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
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

On Wed, Jul 08, 2026 at 12:08:07AM +0200, Michal Wajdeczko wrote:
> We plan to encode larger objects as single KLV or set of KLVs.
> Add helper for that.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
> v2: limit avail to avoid unexpected truncation (Michal/Sashiko)
> ---
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 39 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.h |  2 ++
>  2 files changed, 41 insertions(+)
