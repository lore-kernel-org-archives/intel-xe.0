Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3758BFD45F9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 22:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E080B10E83C;
	Wed, 25 Feb 2026 22:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VP4KXuec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B0910E83C
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 22:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772059352; x=1803595352;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MMhRMpqHkuWbjdk9tNAxNxwJkOLtUxW/eapM+3u8wQ0=;
 b=VP4KXuecI7Qy7g79crDTzoWKwYK+xQKhKcFXZzZpjO9Yuk8x0pPa7Tj8
 xA5DS4VdAkdJPb9mn+gCnrS2VIVUN5gswQ1WtDGE5tC+S4ZA+/4ePmnNI
 1eOpUOQJWe+vXmYPpidt1NIICUqIu/eS5g/uqoRAwHpXy9wX3AamsrPDL
 Lyw5sC76K+nN8Hq9pyPDOtdhaKvm6AkjDeaHeyCqUX34d4k5BRLm9g6HD
 Wzq+zFZb9Mw1Y29aVSYZskOUi4YXBavvgabmhQO5txLjGdZYVQbD7yz54
 eTxB28ge7nsbNrtLUROPk/JlrND5Wn4jvTzLzQGpxQp1psOnqObhP45yw A==;
X-CSE-ConnectionGUID: ihr2W+w9Tx+3AmQfJiLY/g==
X-CSE-MsgGUID: 1GI0lm5qTGaGxXbTfPdW0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72814707"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="72814707"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 14:42:31 -0800
X-CSE-ConnectionGUID: 5xXDXzqzSJuR5+s5ofv3Cw==
X-CSE-MsgGUID: lkDqYN5/QEGddyjXVdOy5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="219755306"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 14:42:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 14:42:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 14:42:30 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 14:42:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ar7miVOSk/aqYuazFaB2LtRe2t0kgmm+05lfmhdf0JqHOaUNlGhk/PQxZ24te+cQdU+DaTJxSEFmBDUM85wjjdpQtzyrvjmzpWLMWrSHmA0qqPJhWWLikvs6UprSsAfffT/7IokkVhAikIr2BEXTNx4P5fgNjANVkP6Gv2UKS9EMHEjwuFyNp0p2qIJeXaeR/jXF7vGobuOf3RSIAnE3ITtxnX867W8bn1PTMIG4pS+PuDSqBkDJl+570fP+XDlmFACLQ0m+0TjKC1F0OGDGtgGXoNpb0UwfquERK5JaSDeNjxwGKpGgpp8DoroG9EfeDC2vB7xZL1goo27XRMbJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+6Hdc7Wg0NWPbnOLNV07lsQuY/0Zb1++WG5wCaCdVY=;
 b=uHEmkD4WjDZzHxxGh7wocgUpki539ly4liJwMOeNYhAMsHE8hWqRQ7ct8UVO4N/u5pZw/ZEkO407Pp3M3WOaCGTK8E2rxCp9V26kgQ4EZL+Qa4Nj4/5CNWPlgj3TOHffg8U7jW2qJA7qcUW8mPg0Ul+BrNi8Mr0Dyb46vDJj6He5ifojKK1Go/Xh3nU7fJKgvkDu+1Cs0A1pd6odj3tHsMFm1QKZFnJGasqma9ORoz5aWEl3rwBSuHE8UhSdSSUdQIUl/XOuL/hqWd232k5vT/papfX7OHKBZkxdRIGrx9mV9+M2vsfh6gcRZuOplreWjOvTbob6ktexldUnB5Thbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 22:42:28 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1edf:e4d3:91d0:fd2d]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1edf:e4d3:91d0:fd2d%3]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 22:42:27 +0000
Message-ID: <9876f542-0c59-436b-b2b4-ce6be9aa9563@intel.com>
Date: Wed, 25 Feb 2026 14:42:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pxp: Do a PXP termination before suspend entry
To: <intel-xe@lists.freedesktop.org>
CC: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>, "Julia
 Filipchuk" <julia.filipchuk@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
 <20260219002627.1208210-8-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260219002627.1208210-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|SA1PR11MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 750aabca-8ace-4c32-092a-08de74bf26e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: ioXH2Fm9JsPu7hhVAyAMTgNgT/Bo71FvyKcTdboC9Mn9txtq0t6+u5w6hB/cUT3HnY7Ezcb9r/EwADQPfH1dJ1BL1p+x0Rp5Jlu2lMHMls+NtrrmOpbSnQERZ4a1IkpRGm9IaKVhK2r/UIAUXDVPJfH8MVzWyXcp/X2Mz5hDDjdGwL/JNN19j+/FiRPti18UL7S5yz6dhz2SGvS8evyRXs7BjJGuG5TnIrqtvy8LEvY6X8dSXoZgEDGdxkpjzjBqfpd0JvMxiBfTJb8pQ62ssUwmrai2RaykQca2neTShW7iqO54T/hs4w/j3JJ4M7mu/rsC1PhIUfzmhOYH3EtHxZCsR0cJ8cGiZGyfGWqJMxmI0k8+WjSEvN52fxYrhjIMWyD533qWi247F1CDuk2dMili77nHbO8v+M8yjmDk33YoUJSqva+r+c05oEcmenlm2TW7/m6mdoRzSb37+7RFUNTqdw8v3mgpkECiQJIPVcOb97b8768p6FvY5onDwx/IrgDgLT9G6W43EqyFBcWN3SXAZF4EVo6AInS0lVr5igsKTuRdSvxvpN5K89H+qIGCCKPAUeM1bMwjezqFnSuToBVEdEjw+UW8YeIfm21TRHDtCMwm6kv60LyPDmlDOuLKXTON1lEykzIcjYclLxvVeDAOqiEKqIFCksWVHNcWRFlihehEfnkbMmTW38pIcicy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUdocUhwcWp4MnRpdUhwT1RLaC9QeUtOeG50dktadWlKK2MwSHd1cVYrbVJV?=
 =?utf-8?B?bG9ObWVYaHF2NGh3NHJ3dTJ5clUyZkE2OGtzdEg2VnR6aGNFL3RmcDFuV2pk?=
 =?utf-8?B?UnNyTkRqb0NoWjJOOTRvYzhWV3RidTEvWGxUWXFXaSt4M2d3dVVLMGlNeWUw?=
 =?utf-8?B?RGVLZk9BZFNRekVzQkRpL2J2akFNRDdhanBwZy9GZHhYeW9NRjJJemNCSXF4?=
 =?utf-8?B?SmNOeHRYcy9leFpNK0xVRlgvKzRQY2R5SDZWdUUzQlgvZU9Ndlh6cTdMWm9I?=
 =?utf-8?B?VUViV2xzWXJselVkOVN5SnJZTmVmNm16VitwWU96ZG5PK2toWllCVUtYQ2sw?=
 =?utf-8?B?bFpYaUI0R2FjUm4vQ1NoYjBvUWduWVovMWZkenVYV0lNa2xvMjA2YjlzSnhr?=
 =?utf-8?B?TTU5dHovSWRBeUZlYldjUmp2bHB0QTVBQkZUNHVoanFvWUl1bnhkTm9Pemtk?=
 =?utf-8?B?SjJvcWlMRjNiYTZiZVpsT2k1Z3BxeDAwczZMM2N3WTFQVVdTODZBYUV5R3VV?=
 =?utf-8?B?WnhHMlExUUc4MmpScnAzS3dycCt0TEd5TEhWaWd0WHZNazBISGJtSkU2YklZ?=
 =?utf-8?B?NHVVYkUrSWU1dzdYaWV6Y2FkRTMvdGxrRExuUW56bW8rYnZqdnFDalhvRGwr?=
 =?utf-8?B?cm05NkkvOXlzazdrQTFWbXFjSno1NUxzRXZ6L01Ra2hBWjZXSWk2aXlKOEpH?=
 =?utf-8?B?S1Z2aFBoUlBxVHZ0bmpZNFArN2lNWEJJQVJrcnUrZUFZQkMvb3FyZFQ5NUti?=
 =?utf-8?B?VytrWHh4UVRRaHVWaU1aNkEwdWl1SlArYkZUazdTUFZLalp0Q1QxWGoxWmU4?=
 =?utf-8?B?ekJheER0QUlCdGIxNWUvOU1Da3BjY2ZKbGwvS2t2Yy9WdEFvM0NHOSt5ZzZ4?=
 =?utf-8?B?OGpkQlBvNGNmS1U5dWJvbDQwQXpLL0p5UzY0SVdxRDQ2c2JLR01heW5XbnlT?=
 =?utf-8?B?dlg0WDlWTmxYOWE5WkxKTE8wWURVeFh1MFRQdmxKM0Qrd2Q2WWs4ZEV5Z3I2?=
 =?utf-8?B?NFJyNHBLOWxadlQyTjZRcmRQanhuRGFSeDVXNzhpZ0RLZDVFcHNRcEU4RUp6?=
 =?utf-8?B?V0lRZTNxSFZjZVJ1N2NvdjkvYy9la2I0SVF2Viswd2swVVVRVWVvY1htTDF0?=
 =?utf-8?B?V0ZEVjdhMjRVM1ZBUW1WZTVVUTgxM1d3RUN4cHFiRkI0L05hdlhVSXRuTjY3?=
 =?utf-8?B?QTY5TUFmVHFicld5UlRQVnV5SHE1Y0FXUFVaYS9Qc3RneTRjSVNCb09nN2hy?=
 =?utf-8?B?RTJaT2pZc0JCRW1Oam9jbkhIdVU4Z05Wa1FDREk0TlFxNXkwMWFhSlVhY0lK?=
 =?utf-8?B?U1E2ZlR6d1g5U3F5RUhFa3VQcG9wTlFQMzZGWUVaUkMrM2VsL24va0RTM1Ur?=
 =?utf-8?B?RjBmcWEzaXhLVmtGOW8zMU9qS3VMUjNNeFhlRmZVckQ5WWMyU3RzVnJxRXdN?=
 =?utf-8?B?UEVWckpSYlFLZjFHM0dIOVJRUWV0Z0ZOYlBxZ0dLTmsyMzlrbU5ianl5RGNq?=
 =?utf-8?B?dFN3Y01keDFpWEczQnpHUVltUUExTHY1Z3M0Mk5EUEpzaGtNU0Y4MkFqMllD?=
 =?utf-8?B?alM0bmZJMGZHeVIwUDZ3K3d2RjBzdTdlK2gzUmdBQzJMZFhXYTNpQ3NRZjcr?=
 =?utf-8?B?VXh2RHdlcTVYelNKNmFicElKRzE0NE43ZjZlS2pjMlA1WlV0OWMwcDJSVlhI?=
 =?utf-8?B?Vk90VnlJb0lFckJseWY5WVF4QnI1NldJcW90V0kzUGhSVThMdTRqR2UvekZz?=
 =?utf-8?B?N3NTQjFrVjBWRnR2Zm44VkhBTVJ0dDcxY1JJSTVWZzlXc2Zha1F2WXI2OTh2?=
 =?utf-8?B?OFJXOTRGYUdEZWpPa0dHc1AySDBxcitFSlMxcENFZWV3cnJTRzlBMmd6M25o?=
 =?utf-8?B?RXdSeXdRQlRzNUJWUjJpR0t4VkFSUEk1Zms4clFVeW9YamhIeFFaN0xLUUx0?=
 =?utf-8?B?RkExUUp5NzlNcENSUTRBR3ZPTnRZRlB1RWFXdWJYcGxZbDhmeXJhbHU5WUVl?=
 =?utf-8?B?bjRPd2x1NGJxZW5vMFFZRVk2aUw0NGp3c3VzYjdHYlJYZVZCUGdtMlZmU2U2?=
 =?utf-8?B?K3hWSUZvMUJMRnZlSkdueFVDRmwzSXh4Y2lJVTVOY0NIOHRBV3dvSHliQmlO?=
 =?utf-8?B?OE5sYnRUSHM3UGtoZjRWT2wwL1h3azBnRi9tS3ZCeE1xZ05aOXVEMk9CYzVs?=
 =?utf-8?B?akJUSkdLVW1BWWZ5Rkp3M05kZkNXR2t2Wk5Nc1YyanhRNmFSTG9ZWjRKT1JC?=
 =?utf-8?B?TEZMTDNXWUxuQWxkMllwTXo5SmNOVGxuK3d1L2RBRHZ5SnY1NWllS2k0UFlW?=
 =?utf-8?B?alRGSTZTenR0bXk1TExHa1lRZ1Vpa3hrZnJraG40Sm1ad21lVlpZZVpOR3J1?=
 =?utf-8?Q?aHsbRH0q+x8PAVRc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 750aabca-8ace-4c32-092a-08de74bf26e8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 22:42:27.8069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OzVH/0zV+nq/7DsAXOz1MCIkrNnq57jP/ngm8FB3VFNpiez2sAkRMQme4aSttDAjDiofBXhWlLtn1iAhzLUlDbQtAnbaZkPR1bGqWXUpWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8839
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



On 2/18/2026 4:26 PM, Daniele Ceraolo Spurio wrote:
> There is a bug in the PTL GSC FW that causes the FW to sometimes crash
> after we resume from system suspend if a PXP session was still active
> when we suspended. This is being debugged from the GSC side, but in the
> meantime we can mitigate the issue by simply making sure that all PXP
> sessions are terminated before we enter system suspend. Given that there
> are no negative consequences with doing this extra termination (because
> we do a termination after we resume anyway, so the state is cleaned no
> matter what), the change is applied unconditionally for all platforms to
> keep the behavior the same.
>
> Note that the issue has not been seen so far with runtime suspend, so
> the behavior has not been modified for that case.
>
> Fixes: b1dcec9bd8a1 ("drm/xe/ptl: Enable PXP for PTL")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7075
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c  |  4 +-
>   drivers/gpu/drm/xe/xe_pxp.c | 84 +++++++++++++++++++++++--------------
>   drivers/gpu/drm/xe/xe_pxp.h |  2 +-
>   3 files changed, 56 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 01185f10a883..7094b133f449 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -178,7 +178,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   	xe_pm_block_begin_signalling();
>   	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>   
> -	err = xe_pxp_pm_suspend(xe->pxp);
> +	err = xe_pxp_pm_suspend(xe->pxp, true);
>   	if (err)
>   		goto err;
>   
> @@ -584,7 +584,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 */
>   	xe_rpm_lockmap_acquire(xe);
>   
> -	err = xe_pxp_pm_suspend(xe->pxp);
> +	err = xe_pxp_pm_suspend(xe->pxp, false);
>   	if (err)
>   		goto out;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index fa82d606953e..bff20f0e5cf4 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -509,6 +509,24 @@ static int __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	return ret;
>   }
>   
> +static int pxp_wait_for_events(struct xe_pxp *pxp)
> +{
> +	/*
> +	 * if there is an action in progress, wait for it. We need to wait
> +	 * outside the lock because the completion is done from within the lock.
> +	 * Note that the two actions should never be pending at the same time.
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
> +
> +	if (!wait_for_completion_timeout(&pxp->activation,
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
>   static int pxp_start(struct xe_pxp *pxp, u8 type)
>   {
>   	int ret = 0;
> @@ -528,18 +546,9 @@ static int pxp_start(struct xe_pxp *pxp, u8 type)
>   	ret = 0;
>   
>   wait_for_idle:
> -	/*
> -	 * if there is an action in progress, wait for it. We need to wait
> -	 * outside the lock because the completion is done from within the lock.
> -	 * Note that the two actions should never be pending at the same time.
> -	 */
> -	if (!wait_for_completion_timeout(&pxp->termination,
> -					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> -		return -ETIMEDOUT;
> -
> -	if (!wait_for_completion_timeout(&pxp->activation,
> -					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> -		return -ETIMEDOUT;
> +	ret = pxp_wait_for_events(pxp);
> +	if (ret)
> +		return ret;
>   
>   	mutex_lock(&pxp->mutex);
>   
> @@ -827,13 +836,14 @@ int xe_pxp_obj_key_check(struct drm_gem_object *obj)
>   /**
>    * xe_pxp_pm_suspend - prepare PXP for HW suspend
>    * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @terminate: terminate PXP if active before suspending
>    *
>    * Makes sure all PXP actions have completed and invalidates all PXP queues
>    * and objects before we go into a suspend state.
>    *
>    * Returns: 0 if successful, a negative errno value otherwise.
>    */
> -int xe_pxp_pm_suspend(struct xe_pxp *pxp)
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp, bool terminate)
>   {
>   	bool needs_queue_inval = false;
>   	int ret = 0;
> @@ -841,10 +851,10 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
>   	if (!xe_pxp_is_enabled(pxp))
>   		return 0;
>   
> -wait_for_activation:
> -	if (!wait_for_completion_timeout(&pxp->activation,
> -					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> -		ret = -ETIMEDOUT;
> +wait_for_idle:
> +	ret = pxp_wait_for_events(pxp);
> +	if (ret)
> +		return ret;
>   
>   	mutex_lock(&pxp->mutex);
>   
> @@ -852,46 +862,58 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
>   	case XE_PXP_ERROR:
>   	case XE_PXP_READY_TO_START:
>   	case XE_PXP_SUSPENDED:
> -	case XE_PXP_TERMINATION_IN_PROGRESS:
>   	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:

I was going through this patch which Julia and she made me notice that 
the additional termination case should be treated like the termination 
in progress case, because additional termination is a subcase of 
termination in progress that indicates that we need a second termination 
after the current one in progress is done.
Will respin with this fixed.

Daniele

>   		/*
>   		 * If PXP is not running there is nothing to cleanup. If there
>   		 * is a termination pending then no need to issue another one.
>   		 */
>   		break;
> +	case XE_PXP_TERMINATION_IN_PROGRESS:
>   	case XE_PXP_START_IN_PROGRESS:
>   		mutex_unlock(&pxp->mutex);
> -		goto wait_for_activation;
> +		goto wait_for_idle;
>   	case XE_PXP_NEEDS_TERMINATION:
>   		/* If PXP was never used we can skip the cleanup */
>   		if (pxp->key_instance == pxp->last_suspend_key_instance)
>   			break;
>   		fallthrough;
>   	case XE_PXP_ACTIVE:
> -		pxp->key_instance++;
> +		if (terminate)
> +			mark_termination_in_progress(pxp);
>   		needs_queue_inval = true;
> +		pxp->key_instance++;
>   		break;
>   	}
>   
>   	/*
> -	 * We set this even if we were in error state, hoping the suspend clears
> -	 * the error. Worse case we fail again and go in error state again.
> +	 * If we're not taking any action (i.e. we're not triggering a
> +	 * termination), we set this even if we were in error state, hoping the
> +	 * suspend clears the error. Worst case we fail again and go in error
> +	 * state again.
>   	 */
> -	pxp->status = XE_PXP_SUSPENDED;
> +	if (completion_done(&pxp->termination))
> +		pxp->status = XE_PXP_SUSPENDED;
>   
>   	mutex_unlock(&pxp->mutex);
>   
>   	if (needs_queue_inval)
>   		pxp_invalidate_queues(pxp);
>   
> -	/*
> -	 * if there is a termination in progress, wait for it.
> -	 * We need to wait outside the lock because the completion is done from
> -	 * within the lock
> -	 */
> -	if (!wait_for_completion_timeout(&pxp->termination,
> -					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> -		ret = -ETIMEDOUT;
> +	if (!completion_done(&pxp->termination)) {
> +		ret = pxp_terminate_hw(pxp);
> +		if (ret) {
> +			drm_err(&pxp->xe->drm, "PXP termination failed before suspend\n");
> +			mutex_lock(&pxp->mutex);
> +			pxp->status = XE_PXP_ERROR;
> +			complete_all(&pxp->termination);
> +			mutex_unlock(&pxp->mutex);
> +			return ret;
> +		}
> +
> +		goto wait_for_idle;
> +	}
> +
> +	ret = kcr_pxp_disable(pxp);
>   
>   	pxp->last_suspend_key_instance = pxp->key_instance;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 71a23280b900..2fe2a8bab127 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -21,7 +21,7 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> -int xe_pxp_pm_suspend(struct xe_pxp *pxp);
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp, bool terminate);
>   void xe_pxp_pm_resume(struct xe_pxp *pxp);
>   
>   int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);

