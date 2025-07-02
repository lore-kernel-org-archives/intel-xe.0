Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42CCC8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 21:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B6610E764;
	Wed,  2 Jul 2025 21:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlOrJaGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835C110E764
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 21:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751492469; x=1783028469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7pLPXvn7YEn4oVERZJJv5H09Ll9Si3mRJoEFhg05rZI=;
 b=JlOrJaGDaOe+oNUaOORSh8jnuedrlHfSZnUQmHVephLvRoQLaTTHSvBg
 6ZWrGJO3gnjA4C4SWiCzzUm666hdzMH1tX3ZGZr+lrU++AuNTL2cCUZ6P
 0xXkyzIS1gq1bNqSBw7OD1O4db0TkrY8ageyWKrelShU4Mv2zUQfQSB9k
 SZsg+wdRQWVWCIdhzhkKyqtvddlzBcXESFybYBwwtN94jUmapmZiH39CE
 PmQ3IGfVzjkRDBHb0ihTjPj3qZWAvykBvwtu8Noosa2NeJNdsZf+26JQg
 4uTA2qnf2DB6im8UeAvO74dwVzSovOfEcX8Lwrh3jma/gBYoRGuNHglIX Q==;
X-CSE-ConnectionGUID: DA4bQHtqQkmFTd4yGW6G6A==
X-CSE-MsgGUID: PZZWvY2ASxKZx8aGf0T3PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65263572"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="65263572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:41:08 -0700
X-CSE-ConnectionGUID: WzwAKmp7SYK/yQBm8oKcaw==
X-CSE-MsgGUID: K7EgmgO7RqqQWI3eSIHdtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="185129465"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:41:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:41:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:41:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CE+oAc7VeMjetblBtDkoicxgVeWEZbkXdewqwvG7LXDDaQ2xY0+FxS60Ey9BPs0yrSbl+20Ag02XUrJOJTZMtvnKbDmA4aGRcsUkYVXgMZOLNiuZRpjiSXSlpnHBI57MHI4DZFNa2J1L2N2hG3upaMHvwb/Z7VstrpGsvy1yEqV6K3grz3KxJJ4nMTnwAC3e32qTSFAmJuzoDHRfATCPhkwO13jvgjaF/Da9UMNH3BwLhGJFOo0wnxWbufPzViRhh4vu6e/xClm45Zp8EUANNQ4Ocm44Z77lDneOrV1VuqmmEONTHn+6ujnri729Ye5zTI98wd7OMXDvzCxs4bt0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDrpPnH3PdUqyQjc2KSK76y8cz2GLBxpMyStzPWxSNg=;
 b=NIBJrnkH8OvneaE8WUrKRhoApbpnbGLryxl7Zq/pCVQb/u5f/KtJeGKPk4oegBUmNnY3PynjIGk7GKO+S96sU/ywLhHKaa2xqElLC4n+TEDtyhz5qIu+OiQgffr9HGFTvXzpgOfhjp9/9O9Z8hWuAj0r4gEoU7vbjpaCYVReiQShqSNBBLdYzBMQuBM2UfSXPP+fIGKeZk9IJPZXLb/cmcWlOuEdE6M+FvizWTm71yOcjeiDCebjW8YUf0jaXwjAw7Uu9s2S9mp45KqZNJvaGYJd/uJ+QNW1mH0rghUDu1iXcvUCWPJVpBCc5T81+VAHQP2xrctdyLKECSRF33F+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by CH0PR11MB8143.namprd11.prod.outlook.com (2603:10b6:610:193::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Wed, 2 Jul
 2025 21:41:05 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%5]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 21:41:05 +0000
Date: Wed, 2 Jul 2025 17:41:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v3 2/7] drm/xe: Set GT as wedged before sending wedged
 uevent
Message-ID: <aGWnbHZQu_dLXxc6@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250702141118.3564242-3-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|CH0PR11MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd89aee-ada4-46b9-7fda-08ddb9b125cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w/CtuQ13766oOlh4jeaFcFK3mM4ucO9V5sSHHIF7VRJy2SeXvhv8gJd0Uig8?=
 =?us-ascii?Q?BThTHRIyU9jwk99UomOqGDxwCvCbRs9MPcFcirCP0uUvoTWHb/GpWD+Cvc9m?=
 =?us-ascii?Q?oHsTKLDaV/WRBKh+Oe+wCgoCaAzqjuh65W6HoM2Rw9+6kgw11uVVAl1jZtrE?=
 =?us-ascii?Q?xyNF0NkKRIg6t8hX6ILAqU8vhB8RFkDtZBBxfpfQKPolPY/ewMKhh/Dh0aRI?=
 =?us-ascii?Q?nU9s2w/7USHYFieplTcPTQBPg7yi7N7w3q/VrKAyBqY7N70QgpZTjhORS1/n?=
 =?us-ascii?Q?gx1VVE5XJNKdTbFAzUbaau59KH8LcNaZKYfKHyh9ukHNdfEzYZc/wJl0aFTc?=
 =?us-ascii?Q?kh7Re6OHtYDUcTts5aTdqhxpNcCbY/5/y/pTfeH/sK6gNoLnEIcquNm6pN2k?=
 =?us-ascii?Q?lKkLEYWv7bg6vVHuMa1BpUhFS8nnyli+FLvMHSDztsceU0a1PPUI5V95O94g?=
 =?us-ascii?Q?9O6N/g/DDMgLiVSFYqvLwvJP5Ze02OqJgwoy+rhdiG8jR3KKVxYLCe/YhYcO?=
 =?us-ascii?Q?CdbxnCqFB4DpbM3cUzOtq8VMtCURdoNcxJqYRrmnjraOaDOZkjvmEcKEwcgp?=
 =?us-ascii?Q?Y5bcUZyYRwJPkaeZFWhZTeltlMHFTX1DRLC/9AZLQuUoswLBYe+UwdXbr/Vg?=
 =?us-ascii?Q?GA1cgK3T0+WHMrhWuVB6+UPqmEuqhWcDvlUXlK6X2Wg+6Bpu0wjXEl28HxCv?=
 =?us-ascii?Q?++Lx4kYICFktxqK/nXOIu7aTOCZ01az1X8iA2w/nKcclt6Gg1RXMlh9ytejE?=
 =?us-ascii?Q?Xh3fhdLeFWQqVXIomB0m5WKZImuVRxHxEPvLKxhDiURYGMuelcwSHwJl3WwB?=
 =?us-ascii?Q?raqTgra4qxmpP/yrTgPp4crTTJW2m1E1Bh++hXlBo5FVAOE9DnqI/OLA4g6P?=
 =?us-ascii?Q?dr4//bDDr5RrxLILZcRO3OknvhKIl5qxllBmpB89EI1AcS7yU1I2lZclYJUY?=
 =?us-ascii?Q?OTOOM50HkbG53vter88TlTiytdKDpFmyn7jSo/vVDTVXGsXINtVt+T6mRCDE?=
 =?us-ascii?Q?itD/42zcuj9fUHg2VlQMDou35UKE0W+XqkYqyYOkRVG2C9TDOl2s3mAqqRZg?=
 =?us-ascii?Q?8tzHzoibD5tMCpV5ZZRZh3ZyQbdmpVStqvdOM3V8Iw/q6PevsCm++AsrBGUv?=
 =?us-ascii?Q?PTg/6g7vPX4yh/r2PRyNCYXiWZax9xAWAxeVPBEq4vFTTpq1r/pzieTfoWLd?=
 =?us-ascii?Q?gJ7CGw1U4YbhCD8q7lD0MD3uGwZzPUVxhvt/BLbfwhTb8hFtlw0UWGZ0K4Yq?=
 =?us-ascii?Q?pOBxGxxM0U+6iHvVdZKVGnjhKWx4U6tKDDbvE05wKxkkgZ2ISQKlYdLORe62?=
 =?us-ascii?Q?khkqpvyHVoBS3cAFGq5mR+7ppjcG5uoDURqq22MUlalmo3PyW7RYWmAaNPF2?=
 =?us-ascii?Q?Ss8hm6rBC8eujN4g6rAOBQdkNfIM5PpwiWLvSub2GeQQAWeJWjxMV/1H/ANh?=
 =?us-ascii?Q?/OOOc6PPxMU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dK+hpgaPpJeOKHIBBdUifmUGwnDiXsUOoaUFV8X96RcrnQiBPnVw1HoXCm2S?=
 =?us-ascii?Q?ABNztZFi+UoEB8LGnbbzyFsKrSlI1OOueiZsktc8PB67znT9SFGPC5YfotAb?=
 =?us-ascii?Q?Hwu3jnfrUR7Q8giKXP/35gXUuZbJg8IuMkqE7tMdRhU5AEkxkCjgYujeKS8I?=
 =?us-ascii?Q?lRctHwSnlWoGAB7JGVvLf+vHhmyJYG1g3YtbrldSz7fDGGCrTK37rUwqixRb?=
 =?us-ascii?Q?7BY05PWqh/JNZ4F3x/v4MPWgO/ws8bN4/6S6xObq9Dn6Y2Im3k7s++EZdX4P?=
 =?us-ascii?Q?YiZc5cI6pP5aAotRN/QfD2H2IuNQILH/IItv+a67i+xOWGYa98kQ3hPjYD98?=
 =?us-ascii?Q?47l/OZ5um92qYRVip8TVOQKxmEpiIdRfY3Gdv4DPG+y2OLGCbmZRKJNdAw/2?=
 =?us-ascii?Q?gxvET9zrYfJjPO9GGstRLzRnZAIVN7JojeW+h8DDlidII+aZrHiAeKxsEVaw?=
 =?us-ascii?Q?glFnHEgyh3ecJtR+MeD1PXcSuyqoA1pI6mfNkvj+txiu7SG+9yNb08Hj4UNn?=
 =?us-ascii?Q?YdcBJvWiCDrKkix5vKlz6iVNAQ3N1dNDAXe5AhOClMBb2IxbZwauoF9HLR7p?=
 =?us-ascii?Q?sRKBeCr6OxDs2ZzPXilZDK5Jkqv9iUghGiM/0KYXry3u4svxE4+y+bGc2DFF?=
 =?us-ascii?Q?xrJvouqVAbi0dZ6/QlZ/IaYCMGSCXFkrOlVaFEamAQ9SmHZMotGT4HIhzf3v?=
 =?us-ascii?Q?la7mad03KBvn7uEDgtxSkkcXFH5oc2ALet3uveD6b0XWQToacGUVpEx1dKrr?=
 =?us-ascii?Q?64c0RV5a5GujnJfp/+obyAQzqeqgKEiggjDQOxStYYruj7ZYXg0hNxYiaRVT?=
 =?us-ascii?Q?veaFg1Cb238cBc1S/Yqrr38LlLDNLdOSEWE74+/jV3lQE5yyWzXSwD0MI2/E?=
 =?us-ascii?Q?HLYvl84nRuNOir08/1MrZxWmbOE79FTsMSgIFKvO2NmZSBNZhWn68c7kZXmo?=
 =?us-ascii?Q?xPaOEOfV/39LPLqEv+xeGE4Vy8WqsMvM9qhGGIa7WvZoYwTDl0ybYlhIEhrd?=
 =?us-ascii?Q?GWFrQ35zwbl9dT4VV+cqLYEGmnNr6XRRDY1OVsRb27T46fF1xCxZ4Fwu4c4q?=
 =?us-ascii?Q?wDVoOHKBoWVxZxkBxcDNpoDZCOm01T9oCr8hlsDx5FEV9izVpuJgh1FwEJNf?=
 =?us-ascii?Q?9+WayQiXhSuZ3czx5j5b/GMEajzb+w9WidCgy+fUVn1qliB6mWMo5yeJayPr?=
 =?us-ascii?Q?AuM0av20Fk9mNrTCPB1HOC2G/42+ZT/n5s6k1jg9qPROZYbp6bgX7xjNu8Wp?=
 =?us-ascii?Q?3VQQZei5p6FIBiv0ENSIfoccdvfTM9V3tb28tBtf6U5kNtihCPPe3Gy2vKs9?=
 =?us-ascii?Q?NnsRKJJUTKUUkAb0QsSx2VhMm1se8ZDI8Raq6+rxWjaEWjuVuOFtSAFxcq3s?=
 =?us-ascii?Q?R8GMsJh3mHrJfC3/IWMDmxbuhG74+Bs+LsscmDu1WfgcDcjLE/kxjcVtHZ3i?=
 =?us-ascii?Q?z3zsngxk5CMCkdgw2LKK/5twVfiJslzQ0QGst7aqITg7BjGdQPN2k5zOgiJW?=
 =?us-ascii?Q?W/Rf7bKDXNBWn481+COLVvkARTYcnBJ3b//WO14sqEgIBqQ9gaoj7SVJcmHc?=
 =?us-ascii?Q?vSsa73ttNkMei9dXXSYd/kqJDOIH3D9Qp76LwoK1PHSRJs7EYJ/vsM1c/7EP?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd89aee-ada4-46b9-7fda-08ddb9b125cc
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:41:05.3372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ER+AfPgH5g0jhLRVfbU10OR3Z0nNeKHHWIwxeJJqn0VZ1NLVYKfwXFobdIydbKrT2kgfGmTc3dpS46no6ZkAyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8143
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

On Wed, Jul 02, 2025 at 07:41:12PM +0530, Riana Tauro wrote:
> Userspace should be notified after setting the device as wedged.
> Re-order function calls to set gt wedged before sending uevent.
> 
> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0b73cb72bad1..4a38486dccc8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1123,8 +1123,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
>   *
> - * This is a final state that can only be cleared with a module
> + * This is a final state that can only be cleared with the recovery method
> + * specified in the drm wedged uevent. The default recovery method is
>   * re-probe (unbind + bind).
> + *
>   * In this state every IOCTL will be blocked so the GT cannot be used.
>   * In general it will be called upon any critical error such as gt reset
>   * failure or guc loading failure. Userspace will be notified of this state
> @@ -1151,6 +1153,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
> +
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
>  		drm_err(&xe->drm,
> @@ -1164,7 +1169,4 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
>  				     NULL);
>  	}
> -
> -	for_each_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
>  }
> -- 
> 2.47.1
> 
