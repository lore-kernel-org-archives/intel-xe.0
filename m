Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FA5D2A526
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 20:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658AF10E214;
	Thu,  4 Dec 2025 20:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8UviWLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF0E10E214
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 20:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764879759; x=1796415759;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0HklY+R+F/gZNRi1OvS+q6c1RS57HVKvZDnscu6UHDw=;
 b=j8UviWLkY+xcz522fg9W8DTizuJAGeII7tGZ2dS6hy10FSWkLR+RIeSt
 hHnX1zW5/P9iUjkRtYE3M3fKVWyASKUMqZHbdq2GJiOWZaq63TySpT4ny
 B1E93MfSm9R0SfNMwsevMpmPIuQEh1AthAv6QQTuH3VFnZJbE25JEb3tz
 mLfQ5tu3hojK+aZFjlRSi+lJA+O8mjeAu0AIv78Kot6UVpY0V2aasKMq8
 7kakmIbWaiW4hrV//KIHlL6HoTJtcXEVlHICXJ3AxPg1P6SWH5tcZO/kv
 PftB3dbxl/+Sr9H8Y2uSWJdiMVbX/MJ7HUY+DoI17ZmQ0IFk0AmMlhr1r Q==;
X-CSE-ConnectionGUID: B4YGwvlUT1WOgyqhX9DUMw==
X-CSE-MsgGUID: UtGxtM+CQfKCAp3XXHMf9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65910542"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="65910542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:22:38 -0800
X-CSE-ConnectionGUID: BlHNz64jQii+dSET4KFB0A==
X-CSE-MsgGUID: aMQN/tcTQraQ1Y+xruEkjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194889388"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:22:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:22:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:22:37 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:22:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSzYIeftQDWFZ6QrzibSeeRgEU1WQF6Ivv25Gq8jGOX48rVqlbvX96F29yRX3+ad55NZz2NTYlS/an40Z/MUNdpuZx9jQzyuV7Vv+JXA5alw7yBLNhoLvieosJA6lhECAgBDi3PusB41o8zkNeLSkP+bwrqQkyUi9U8EBPSUkD4k0p0QqLbiATXQMyyheUkr3QHEWGgXyVQf78Ji2DjOL3xj4UN5RKNqxGceKS9orqP2QD1viVYNjc06NN3KD/7IyNpAGhjj6+suUoLJ1OMX9QlCqp/TVxzNTTV2udIMvjFzhd5ns5N35SSejQcBhiqygPsffOi0b/WPnwRfYMwOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OySj+XUpSWaTZCNO8LHCz9yO/EcVDE/NpBHQG6OPzx8=;
 b=ru1uc/gtNjO3la+1RbVVhfD24yWHP0mowJ/3NCu+giHcnqcSX1Jzz4Gv4wV1pwYD/y429ySm9FFpYgSNvqW8UmlAVmd5jvtZfde27EOzEQZUdgEoOAcPD3KSXhl9MOnCe2+bX2WDhXL9CectjI3KZqXKy8qStuGhx5eGbO5pZLC9TasBPwQi6fdduANyh7n6EYVqz2TJtAL+SFJYH/EAyxqzPi8c9UYW4Tq3bnzK3X8MF/lJSEf5tHW3xfH2rAhu404IfrXz5VVVbY34ZYJKJR24bB5WknnvXtrt5gFSbyRlAz5hhDJi56VbcXbAgJEOYXov3M+hSHOCPVSr4RhWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPF5D8CD6E8B.namprd11.prod.outlook.com (2603:10b6:518:1::d25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 20:22:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 20:22:34 +0000
Date: Thu, 4 Dec 2025 15:22:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <heikki.krogerus@linux.intel.com>,
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v1] drm/xe/cri: Enable I2C controller
Message-ID: <aTHth3B0MOEpnay4@intel.com>
References: <20251128084414.306265-1-raag.jadav@intel.com>
 <aS36G51_xMA1nvBo@intel.com> <aTFzpOHWRm1Dvmr5@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aTFzpOHWRm1Dvmr5@black.igk.intel.com>
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPF5D8CD6E8B:EE_
X-MS-Office365-Filtering-Correlation-Id: 81852121-ad71-462c-eb33-08de3372dc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o09P0HY1HeQzWfUMjivHcczQj6gOEmOE4FNpEZGUl+iUcprmC6juB3n45HdQ?=
 =?us-ascii?Q?bjdXgZMJh4do2BD0otF5baTOytGJjGbzILfiD2KeIeDm8gfhU1lCphG3A+5J?=
 =?us-ascii?Q?gJtHKJTu9WGzWcLp0zrnK2xhehjAjTSmqHZiF1UAQh2g6yvn4y5B0Ct1ioZB?=
 =?us-ascii?Q?XAB38E669FGCBxjiwqSEd+nRh9HzRYHMNZdAZfeMVWsiGS6Cj257m2dt/XdG?=
 =?us-ascii?Q?rmehfRLa3lYiHPruWx4xWyRbOFlYLassZIoMqngJKUgzGmMvbr9csbwa6UY6?=
 =?us-ascii?Q?97NzLjq0CZSuFmFjxKR35hPFuxxx7KbRT+7UbX1vJehYIjAd4BErdBhVUCUW?=
 =?us-ascii?Q?iBej7lUU7dpPf7UtKOeE7QUTGDc1lTEFTYqGGmcxvI3bs38qmctP+Iu5l2Xm?=
 =?us-ascii?Q?xD2yBoWhq5oL2ktYeP5RVeRCHwi2oOi4qMWCvfLa0J/MCueG8sxfFsiJxmUJ?=
 =?us-ascii?Q?LP2Jz1RMYm9tqMLyN2g299pgHXImT14Vh0Zb434aYRqJWiZlCqHVv3WwIzQO?=
 =?us-ascii?Q?+9tqIOXpQrDXah5/KdOhJBdna6d3Uc5RPD4QS9+zH2sz5PecWQRkQVHaHDNQ?=
 =?us-ascii?Q?8zUYqmOGLGMyYEO+iIzc3YhBXMs00cM9jAt7DFoJTuAlrarLD4a9mqSHufv6?=
 =?us-ascii?Q?pmrcrXTkdfiq9I1MeKRkkxgpmArkukRbLSq168fYIe2Wl5z1R7hchqgSgRUD?=
 =?us-ascii?Q?OcaPqttiCA7A6vFlo+6YFQ7QZBWRaTb/Pg5G892p07FDO9aOFqQ7L/wCiIWd?=
 =?us-ascii?Q?3tnlxsF2WUKYD/DhcGIfwht6OeSS927HEW5lHNzAC5wtOASBl5c2tDRgri5P?=
 =?us-ascii?Q?UeMmaByKY7NoUrTLM2davbCPrM2M2JsFLZBPOwvWFmGCmP46AzlhYE5V0irQ?=
 =?us-ascii?Q?kuuffKiDCZXxFJS97jWXUNWrq88NbBo1msK1wxrv+VGt2wk3V1XGsQyCjVnZ?=
 =?us-ascii?Q?nGDUHWYO3uBX42tksyxqSu1xyqoPeQqXFm8nACnCWJeb4HQTDmb8vKWctU1f?=
 =?us-ascii?Q?tVgM1nmvOxSKpLHL0Z7ytiioUAr8KOe885CUWNEXbLzpKFCHHntJrs8S3gVx?=
 =?us-ascii?Q?WftMpJd3sSP7OArCy9KUjizuK/6OiPJ0CCEEkQj49Cuj8+YSjsQqYnMV1ktv?=
 =?us-ascii?Q?4+QPvxBtzUhuBZvsMJBt4zd6URJ0mx0q5lzK3dOTDfXHVcImsIbNtGDqSu96?=
 =?us-ascii?Q?CdG0PRaiMQ0xw6O/khZKVKsm+TOo5dhxtr3zWe+LHQYfWiOMz7BbERu3iwre?=
 =?us-ascii?Q?XvdUbvCwAJXm/mhb+i3S8/g6LLdro/hK8d7LWrIJk/fg5ug9JKuuQPEfte+S?=
 =?us-ascii?Q?vcNXN9YMHR5zql9KG2UH9in/t4Wf2YDfAwTQKGIy1zes1JgAwNteBpysYIn3?=
 =?us-ascii?Q?OAizCJTyDjo2DgWqmvy2cuBoVJVF6cQS0ZliD0G44Q6RQGA8tAIBefH3T4fm?=
 =?us-ascii?Q?xTA1ETNVlEZJsKtdIMNYr2tag2eDzOhv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lKHIlOtkVh8s+6bFdg7RPjm3+Rd/fEtYKsBM9KEhtvSlozJZJ8IMwsgJHNMh?=
 =?us-ascii?Q?RLIkHBitaxQF9dS79VTAE2vcVg+gVfDaiG0P7fk4YXcSbm3wjMFuACEGMXSg?=
 =?us-ascii?Q?tTCsxwTOGaTM99Bo/8ooiL0g85wibh9XFMi85xPcpJYeQy7UlVmYZY42wZOz?=
 =?us-ascii?Q?iVcJ6Ua7gnnMTjH0Io83RhrmfEp2N2QUjZvX10inCW+M1a3/ue9WWsjWiCgW?=
 =?us-ascii?Q?7OqqdYN6Xtt4Nt0s4Gx8kQFgYQN01fvjHlOcYksaM9qCvfod/EgEyLw2BlyC?=
 =?us-ascii?Q?y5DKWkoAQXX8UHArQzYU2s6uAt667YUO7YvWekCqbUdlmESfWLnBKTha69UF?=
 =?us-ascii?Q?7iR0z+Hy37UHU82S7b9+FbdkQZbWXZP9hRDgGzAwrMyJYw4fuTCnog4y4FOf?=
 =?us-ascii?Q?ogLEyDevyg9h8SNv2KVN+peFWQixinnfPESoiBw/m0G3GDkVGXx2qmbBnYMT?=
 =?us-ascii?Q?5f6zhzePUhlV4ObJicgKJ/nPa16hkBGcZVhvJmX4csJLDHx6j5K7tmHahF0r?=
 =?us-ascii?Q?luVYhQQW5IAtRKD5d3tcFS6+PVBgtOVeeiFBJuM5REflr5ISvZr81EPzDHwg?=
 =?us-ascii?Q?wFg+zYvI/Yd3wECywtsN29imjLX08AdUUXdxkFREuG0LQsZE3Wd+0g0N/HZR?=
 =?us-ascii?Q?GCcdPxaDHTmV2+GTwQ2Egx31vDfkrkj2dPPB2h+BXGNhOnfIjkCL72NmyrGm?=
 =?us-ascii?Q?QkbvbWSNslYfdRf1r6ZgH2UrNxeq/adVXl72hHvJRKqTPiNmxWRW9MOarDal?=
 =?us-ascii?Q?Jx5SXTbKGDJdCYdOoxm7rbqKMtuqy6ooctZDtTwkmPjjPyY4qL7lVkQu6i9F?=
 =?us-ascii?Q?9jBeruwnhgd++TRR0Yu9/Xg6smnlzwmGyeDp+pvyG2+JV0n+7JL+MXDxX34d?=
 =?us-ascii?Q?WZw7bCoCln9exfUhXL3Lb7C8XQvXlMeZAutf3wUj13JL07Pqu1lW/Ch5ns6r?=
 =?us-ascii?Q?tKhosw6zoUpvrZlywG5EpGcp3R3yQmxYH1JGwOFTlo3NzIi4dZrA2e20Hpkn?=
 =?us-ascii?Q?In7HLpxSMiFpX8UGxIYZTONnIRYEcDquQLhQOQJ5ce7vH2U53UL/nemUmK40?=
 =?us-ascii?Q?JfmyeHH47MwPzBZSlN9WjPvpBG+nZKAwthk27AL0JbbfL68ozbmx5Usk2aKt?=
 =?us-ascii?Q?OThv0EePcWpX+c5XPBf6MauMLTQX0SVRd9jmkg92+3uO1XmFq+1wYJUU/BAz?=
 =?us-ascii?Q?2EKDpD0g6wZ/ckrm4q3IJW0SflzOZH7jMM7JBQJRDJNA3jDMKY6d8xf/rnEb?=
 =?us-ascii?Q?jx0xm3Rov8LHzabL0ikL5jf2Hk3pYsReWb6PTWHac9pSwb9odNy1T6KrciHV?=
 =?us-ascii?Q?J3+90VXJLYfteX3OtSDxCUfhS+0gppdlVm3tCQztT3vjCzXuVt2rkHK38I3g?=
 =?us-ascii?Q?nnDe+qMaBs9XtaRhVtaTB0PwpU+lLMIpjzxApaHgHtb2Se8Av+TAi/9GbcaU?=
 =?us-ascii?Q?SdAhKIuboPJpe8aVxiruSxSZMWrDLogZiDWsZxzC5t2khCioAN9zxPbKyX3G?=
 =?us-ascii?Q?v47K2rjlNpjT2I8Wes/RusbK2fDi6+Ov4f8mkYgqivHBtpM8oB2hTZ4nIt0g?=
 =?us-ascii?Q?pApJ0tpa+gtpLrDiy8h4JIA8F5hMfzQcgxXBCnGuSAA8V/45Zd1Gzb0soSEI?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81852121-ad71-462c-eb33-08de3372dc23
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 20:22:34.7660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqDxoXK5nKPthm9CJXw0Gsx8skFflWCpoc0cQ2tVpqO4ibCYPbtbxLP3PYp3qCpIGaa2F1IEZL0BFjiwAfz8+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5D8CD6E8B
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

On Thu, Dec 04, 2025 at 12:42:28PM +0100, Raag Jadav wrote:
> On Mon, Dec 01, 2025 at 03:27:07PM -0500, Rodrigo Vivi wrote:
> > On Fri, Nov 28, 2025 at 02:14:14PM +0530, Raag Jadav wrote:
> > > Enable I2C controller for Crescent Island and while at it, rely on
> > > has_i2c flag instead of manual platform checks.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Anything else I can do here?

Have you inspected the CI failures?

> 
> Raag
