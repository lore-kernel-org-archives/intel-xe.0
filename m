Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA74F327BE
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 08:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED5710E828;
	Tue, 21 Apr 2026 08:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WO4K+pfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE6D10E828
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776758413; x=1808294413;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WrCjjinna+eptAfIbCMIE5wIVgtLA+uYILBB3vYgoeI=;
 b=WO4K+pfQ8X5wTgXyGuGgA+jK1nU1VXXU9+jYlNB+5BmsxtmU0r7Zujwn
 0jhLGTxqLFKT/wm7n0zmGqi/E3kqoZuaQ4jTAxIW5ZYocwm93FMWMt5ka
 5ux/GV8S+ct4WgandwzwrKA/JlqWpZNIxmkoSUDiX5SEncA6p76dTPjG9
 F7u6H14kMqo56Pil9eAEMzpEiMFLYFw/uIy9AradN6+f852dCsm9gVflO
 tMzBUiNHwAj7kYXc6ZiFU/OVfwmjC2XJIkF39aFVJu+Sk0rseO9tMxRDF
 7pgoVORh5znuX+UnPReVoJe1lajczY8J10sIXl+Mb30oeIoeyezWEPIDi Q==;
X-CSE-ConnectionGUID: Z4Wy3M/JRNSDhr8KBfs9ng==
X-CSE-MsgGUID: 8EH5mkdXRkqULI4qF0RamA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="103145901"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="103145901"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 01:00:12 -0700
X-CSE-ConnectionGUID: LMPalUptRNW1nNtBChr5Iw==
X-CSE-MsgGUID: atskrkZLTAaTIOd1x3A1HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="233741782"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 01:00:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 01:00:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 01:00:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 01:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDYm3V7qQEsb4YBmVN12rimbxJSI/rO8T954HM0rWngE5t2FvmhtxfzOcWoO/IbKfhZ5fRJyu5Nz+DbtJVcz5SgJtl7o4eww9eezTYncFXnitwgMDvE5xn8hQzqjizZISMvz3WknwtCCxwXJ+RwEGU3lGw8E04JwoZ36yGxoVWLCFHU950EgaPGAiK4gxdroiogt9MF5/SBW4JUPaxROVLqZS2lz+8+q4Ar81JriLEPrdcH0p5xItq/ssvyU6UbeSguQAYhClF7HQaTlQxoc+G0JdBTGWKCQzU6wgTcrV6vo8cWKzU5JvUEW9t5Kqh8lHYx3oY9to3gPZ1CoLI7RkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwDh/etsZsD7dCn1lTn2Vm9HZGOLK9Up/X74edrqsrA=;
 b=YrDRnCtCxPgUvSCUmMqV5Gx6vVC/9VfjEUTLdmeLrbxc7KEkI+nFEi20wkXK/iTUlHTVqHwa8Px1B45+aYhxAF3yeeLKyEwsc9OoSKCKSZSkkU5f9aTnbv7vlGeUxK51GIvhj6pnJWk+BJ6rB96mvLSvqGYxZYuqk62kNEjTB8i7d/1+7wBGgkglni2tlDJN9W8gy2vgl8rtf+AG9Okf/En3dqhorp6p7UIicMRqHSUPeiHTbRfYyCuV8gjoS6z4v+YvaNmfRMxC29aclYsAFFgdPSxSiB+53I6beyNgYHtr4XEpM7DTBlbyPrA4kv90flia1u8hZvhV9PZb6dOVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 08:00:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 08:00:08 +0000
Date: Tue, 21 Apr 2026 01:00:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] drm: Ensure ioctls are drained before device unplug
Message-ID: <aecuhmp/Yi8vjT1q@gsse-cloud1.jf.intel.com>
References: <20260414091552.6153-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260414091552.6153-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: c92643d6-6a42-4ee5-1b4d-08de9f7c01ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: sMfUrQMDsmwJWQB2qCDyox/58YgnNyrjsbvpJUX0oCgcJHBSyLBlj4dVGqT81qz7jGN114mpYT+VuIslUkOdGXDbUve7dULqXAt8WHz03oXmHyKRMnPnYUAzoGq7ukn2TKeKsjZMUfpEj7v2YhMzfqwPl2oqdMc3RZ+Eg+6fPV9DIZh2cyJgXDRHd2Io8Ot2acMMF05o7V6m1GHmWHYykbkzdaVKCc0IhBcr408RKFNiryN2gi1TtRNYZpg6Rnf8jPwaYG+Mglcf6A/V2wkmMoVmOfW1YR9Lf89ECdCFt0G7wVB2auoYI4gBGp5/1L63GT5WnXZiX7KcuoXDQtN9BfcobVG9o5wK8TXQvFLAWshbQJsN3xs2s9Tb2cWIWqgCLjKPRnmPls9Df3drFPHadfEGWvYPqbjCKrzuTNstEvWP06JcZk6ye01JV4a5AICHGVlAHUBRSXMPI1zS7UBb2rhuzqvbyVDifAW+CyVTS7xSebRRj9X6+t5HlIDBzvPZeLIP9kaH7b0xr+x4FGN1p2Dz/ztAdkZSfM0UZLnmi6l3fA2dHmalWnRIe6DuW2ClYSXp62cAqOO0irBSIBOlJeKw93LMD81ssLY4OKJEvZ4nt4vXCXjmMnMwckD3OzEB+8Tt9wRJJIiEfbjyBWPRQP1VfIdIyjaHQ1wKX/4UlhOCLsheMnG1LmNIJT2/iUCq4fX4HdwNh2UEsWkIY/U9Q4wH0Bz67OnSmJqxbhIjAig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmhWbDdUTW81eDZJS1d0VDFDbm5VbE1QT3o5Zng0bWhIa0FZMVNPZ05NZ1Rk?=
 =?utf-8?B?dFo1M1FtVTh6THdjK0k3OWRub1BYSVVXNnVWdFlqVFpFblh4YUUrTTJjVDIv?=
 =?utf-8?B?WGVLSVhyK0w4VUlERFoya2Zmd1ZUWlVyaHptaUVJQWkyUkhZMzVmTnByRDhR?=
 =?utf-8?B?OEhwUmlSZEJRUE1wY0g2Zmh6cGl3ampIWXpXQmNkTFN2TGFaVHpvMTJ4Tlcy?=
 =?utf-8?B?MHFpdG1pR3hrQXc0S0xxa2UxMFZ4VWlEMCtoUlJLVXRxSVpxR2RQYVJLaUIx?=
 =?utf-8?B?MjBBVy9peGt0Nk5MYlFaMFpZdVQybVVPRFFxTTMzTUZjYWJOajhxempYUnhU?=
 =?utf-8?B?THljUGhjMlc1dmoxbmZQbXhqT3E4SEtGVHRIZmp5bTRGVWprYzRpOU5HUWNW?=
 =?utf-8?B?ZlE2MFN6QnlFMzJBR0F1aGlVelQ3TmNReHc3ejRrWmgxV2ljcW1BakZSc1Y3?=
 =?utf-8?B?OWVqNkh5U29ZbjY1eWpZamlKSDQ1NUlXTkJpb1RiV2FxSytIOWhNd0xpOXJB?=
 =?utf-8?B?MFNiVHBzRkNhS25UVm5VMVdKSjN3NVdFeU9Gb1B3eUk0Q01KMWQ3cHUyOGY3?=
 =?utf-8?B?YmlhUEhrOU1vWHRQVFpWUjNxTjMzNDZ6SDlCaThSbmdrTTFpQ2tlbVc2Rnd6?=
 =?utf-8?B?dk80SlZ0NVgyZ2ZyWGZETlFRZldtU1RJeVplSk95K09seWpmbzhUci9NSUlu?=
 =?utf-8?B?elV6YXdpSy8vcTJtNkZoYWpYbnVRZWtTb0FLdFhadWJ5R1JhaEhlZnRyZFpN?=
 =?utf-8?B?a0M4cWpuRVkvdURZeVp2Nmh3cFRGQ1M1WnRtZ1BCbzZlak9YSzg5bUJkWENM?=
 =?utf-8?B?Z0gwVTIvbjBGenhFZERxYXFYMjQyTk9yOUZNcWFvOXlXWm9mcWlNNkJVU3Jp?=
 =?utf-8?B?ZzJIRHRUOWRnRUpkb0hXQ09UenNjQWhJdHFBa08rQks5WVd2YTliTmNhR1V6?=
 =?utf-8?B?L1pCa1FMN2tkQkZBZ0tIeFhwcGlweGlNNkpLbmNlai9DUEJVdWNvTlJyVVlH?=
 =?utf-8?B?cXRiTWVBZ2s3SlFQUmpBUy9ndkVDTm42OStDUG1rRVhSa21XNFFxamIvQVJH?=
 =?utf-8?B?Z3hNanM0MDV2R0NiZEZEbFMveHVIQ0FvUlBpTmFuNXFHY3FxeEFTUkhBQ2pw?=
 =?utf-8?B?RjBmeFdmaENXajZqMFVXdmZycEw2L2hZMlM0V0RKUjlCRW1wMXU0U2VyTW00?=
 =?utf-8?B?MEltaUVxQm1jUExiQjM3ZkNPaWdaNk13Ym1MZFRxNERQcTRWVUpiem8vRmdu?=
 =?utf-8?B?K25UYTZJMWsyZE5GOVFkcGZ4dHFnRUl1WlcyT2ozRnJHMWN4V29PTzJqZEQv?=
 =?utf-8?B?Qis3SC9HdlRSZ0ZEM3RwMUFvSE1zczBZUTBKMGU2aG9HczJBWG1STnA0dXN4?=
 =?utf-8?B?WENDendidVAzZEl3RTdWZ3VodnoraWFkamxaK3MxOUt3bEZFT3JoRkZ0R2tC?=
 =?utf-8?B?MzJ0NjEybHNjM3ZnQjUrR0RRWlhJSytweE1JWUhQYjJuK1k5WGttRWZLL1Nu?=
 =?utf-8?B?VVBQa0EvNkNTVGxOMHZoY0ZGT2swbFdJb2xOK3N5RGQ5c0dzTERUbFRLd1RI?=
 =?utf-8?B?R1Btd2JmQmY1a0RJajlVWDkxZlVIQXk4Zy9rTjBYajdIOGRUcklza2lheEcx?=
 =?utf-8?B?a2Y4YnZmM2QxSjVYclpZUEdxZ0VsSHlBK3R0eVI0YytBU0hycmxNSHFXTjZW?=
 =?utf-8?B?WDR5K0VuZ1lmWk9JWjdlRlY4R3dSZjg2ZGZ4N3piMDRGcjNvOERRSHNINmgy?=
 =?utf-8?B?MDNsMlp5YWE2c2RhcVN1R045bG00ZzBFblZBU0VPN2psSG0yYmI4SUs2V1dT?=
 =?utf-8?B?N0VHSi9LRENieUxkcmlLQk0wSjZKVWp4YklkY0YzeFZya0NKazMxYmZ6K1Q4?=
 =?utf-8?B?QXowVUJaeTFnWmN2OG01M0JkTG91ZllRVTF2SnhsUzdxVE1vbHFGZHBvVnZk?=
 =?utf-8?B?KzdweHZveWNLdHduOHRBUlBLTVV2NWVLbWN2TGpKcUxvQ0dmc2NnUFZUNWdx?=
 =?utf-8?B?N3phMWhUMW1Fd3hIeG1mU0EvT2tnaU9FNDl0OHo0TWQyVmVFMktRTThEd2dw?=
 =?utf-8?B?SytOay9DcnBNSksveHJ0b1Y2d1NRQXZlVGdTVi85b0pPdCtGckhnQTRHY0cy?=
 =?utf-8?B?ako0UFBWRC9kdDZjWkxjcEZPSDdJTVZvMytpekNxVWovQ3RjN0p0cUhacW93?=
 =?utf-8?B?STlHZ2JubEtSa1pPQXlVb2VsQkhrNms5bTIyYTZnelNGTlIrODVFVTFoMnZ6?=
 =?utf-8?B?d0VoVHJPNmZSK05wV09uaURPWHpRUkhNa3ByYVIwVzZDNkIrYURwU3RJaEJl?=
 =?utf-8?B?V3p6amQ1M1dJTWNacEJUVzhpaXUwZUZoZjlTZG1rNGxYZVNIWDlBS1BTcEN4?=
 =?utf-8?Q?0MBohDGMGgEIqxa0=3D?=
X-Exchange-RoutingPolicyChecked: hUqE6mQqckrfHlgTdIclOwpodvXQMX8KdaNyHY4bINjsHMxMn6U8dC60LNfwo+On4UWNAzk25eSy8FRJWdTVBt0KFIn8V4JpoS5Tw9Xu4ReLHaatgMZIHjdy/KbdI78qx4quai8V+QkUSwDhYceHYit+6ABtPdo4t6WvOEhibTLsJePi/Q+uB6Ccqv4mHD7Osp9CYuYTFI2qTss+8dnw4ri68xXCaKiA2QOmLNIUpQZWarEsJIKqO0xUveOG4Hot1ORy2py3vMmDiDQ6IXOdYhKIIWZDE/7uESBoBnIoGDHBCAjaljXmdg07Vx4kByJyUAReMB4BlDtIqerRlcgl9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c92643d6-6a42-4ee5-1b4d-08de9f7c01ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:00:08.8020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjWBZJ1J+1FFMJf3KOStWfjdWdSK7atni3c3W6vFajzrrRkPfumUGXW4qUjVvx68xwr8XV4yCw0C6znixyn3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
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

On Tue, Apr 14, 2026 at 11:15:52AM +0200, Thomas Hellström wrote:
> There is a check that blocks ioctls after device unplug,
> but we have no check that running ioctls have actually
> completed at unplug time. (And for some IOCTLs like
> fence waits, that actually makes sense).
> However, implement ioctl draining to have CI check for
> lockdep issues.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


CI patch, but this seems entirely correct—unless there’s some black
magic or hand-wavy behavior involved for not protecting IOCTLs against
unplug.

So…

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_ioctl.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ff193155129e..c87a925f0fe4 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -789,19 +789,22 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
>  {
>  	struct drm_file *file_priv = file->private_data;
>  	struct drm_device *dev = file_priv->minor->dev;
> -	int ret;
> +	int ret, idx;
>  
>  	/* Update drm_file owner if fd was passed along. */
>  	drm_file_update_pid(file_priv);
>  
> -	if (drm_dev_is_unplugged(dev))
> +	if (!drm_dev_enter(dev, &idx))
>  		return -ENODEV;
>  
>  	ret = drm_ioctl_permit(flags, file_priv);
>  	if (unlikely(ret))
> -		return ret;
> +		goto out;
>  
> -	return func(dev, kdata, file_priv);
> +	ret = func(dev, kdata, file_priv);
> + out:
> +	drm_dev_exit(idx);
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_ioctl_kernel);
>  
> -- 
> 2.53.0
> 
