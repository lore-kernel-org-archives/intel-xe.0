Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED925C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 19:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DC68920E;
	Mon, 21 Apr 2025 19:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YunV6z8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EBB8920E
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745265187; x=1776801187;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b2kmIpRp4bYq3MttaUzlbIVV9CfXwMVxqKaCMzdB/Fs=;
 b=YunV6z8qqNyL2bb1MgkTTgWzUBVzpobxRnQHKCByf+NDi3mAXnlKGrWZ
 iKzA5+2GrfPAWxljtxrMy/vQJjrAh7iHDJndkrktBlCywMs4AcsQk+lRf
 oPHnL3HT8XD1OzGn002YJGHfDWC3R8kKY4qLxYvPkUHF6fdlEre4ov7YL
 91Yv7ES+WXXW/xkhop463mvPQeT/g/MRvNrR0dZfgC6Eg5TqvmWcVkVA1
 3ky29exX4fnyhzympgD4K5MkvCk8GNBE6oJn5my3VkZsJKEEOH7qLYSn3
 6n0SW+eZLkcT8xPkiFZd30oNWYTBUTARQ6zjRa6+wWuuaSnjqMVLRMBea g==;
X-CSE-ConnectionGUID: DyxbuYaBRZmV4AuRpln5YQ==
X-CSE-MsgGUID: tNmppuwxSKWs08/opzFgwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="45927819"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; d="scan'208";a="45927819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 12:53:06 -0700
X-CSE-ConnectionGUID: zICWLeoFRHeuS+1+zJORzA==
X-CSE-MsgGUID: DWbx9FeRQbG3Uny7BlGW3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; d="scan'208";a="162779838"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 12:53:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 12:53:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 12:53:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 12:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0PnPfvrZg6uLypyibfFwm7KBsfkBOFLfwdV65YCP1B28L1bs1TD+pPY+Sm0/OyyqoreGhiFDOIntShrnZS5uhGJqrO4Q09anInN9tstD1rNaMtVaUHKJoKj78WgsjX6WbM9+CoC/WwBE7FfLCHhr5xSRcP/wI9RFKEzy1QbDNlGIcQ+vwkYVJvXRZ7/Lr7GSk34p6J7Smdrty31nDulzRktcRUyqowvwm3je6WAXDfgbnLETy9Z344TXPFZxlh5xZYzAZOgoe0hRnKpc2RXJxZ8zDelj2e2Zh3+U1F7nxCAafw/STNDaJz4MsJIJvzEi50+UPTkM3jA68OgOylUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUyVcCb0sDVZga3lUcH/GjHsjLuG97thU5Z2IUTLZJY=;
 b=qOWWBR15aJwjPwt5tCDL5Ivq9U/f5GwaV+4V/vBqGLm1ZzVrYWm5mO0PsW7XSNcUMfy5n2SDb3IDOaXUVmdFnFJFHejoVl0DsO9UgIbSdkyevJ/uhH2DJlaMGZB3m8noFb/ylpo6v35uDy1zjBUksrPG8i+yXfV76OlGgWVdWLeLEFx3OJO0jHw+Rm9KF8znSUUDVynHlo1A3bvWMBWfNaGgjWG3/r2+q42Y+gy2xxtK6rAZ+Kba5ALgT3+k1rl2Yd8ADOUcvsGmoXO8SXyyv9jzoeqoeBiWPOTzEy29Qc+Rlt6bAY9YA7sSoWyfWHDGOoMP/NggQZvttVWHfn+EdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 19:53:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8655.030; Mon, 21 Apr 2025
 19:53:02 +0000
Date: Mon, 21 Apr 2025 14:53:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Ulisses Furquim <ulisses.furquim@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Fix kernel version documentation for
 temperature
Message-ID: <uorgzeqaszua5ofvdff2u2y5gba5ctc5tq3ziu6voih6uceox5@jypdw3tcp2oe>
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
 <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
 <aAZ8qZytCQQrSLez@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aAZ8qZytCQQrSLez@black.fi.intel.com>
X-ClientProxiedBy: MW4PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:303:16d::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f42d69-9af0-4c2e-862a-08dd810e2041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3fD3hBO7bXtgwRbUJh4x1ZgVqYqohU1wkVDM65Ib+2H5WOauxa+mJi8YcDMJ?=
 =?us-ascii?Q?LZUlazimGPDrw+/WN9DyHWrQ+FCQxtxmmaneonPK8dkf9u61UqqrtPb8/653?=
 =?us-ascii?Q?SVfsp75pQBieNa/3OSxRynqbl28KSA1XY4AtjjP9DD9YDHtMeVXuePlsGWm0?=
 =?us-ascii?Q?EouZ9xbQXWLG1haHRe8uYZksoeAoM4GkZLaAzns3TwwlhYPRewos1XeNrRsB?=
 =?us-ascii?Q?2UMHhssK98Q5cZQFj9NTKXu2ih7P9lH0iHEuaQmCaqeGVrm9hIhKaRbHUPRZ?=
 =?us-ascii?Q?Sf8QDDG5k7LTui8zDT08cjrlCMK7z0ee6WYI5zIWy8e8H2wERw7P/huX4qRL?=
 =?us-ascii?Q?0B5Fd/o5z68fyso0UiDTZNw+4lvChV1r95YcMSykGgvk5LymLMqmhosEZyFf?=
 =?us-ascii?Q?E4I9hEu75qyP5IoNrBXH3V6WXMmf0/qX4tVixjGhp5/PShJ/MtOFk0mc3QTf?=
 =?us-ascii?Q?K9t7K0DtDi0p1FF6RrJ+zDUiR2rsVDtvJH7qKHkY1j0r2TL4smk4xhTvu5dD?=
 =?us-ascii?Q?Oks2uejZ9IpYHBJNCdBhpSITSR2BUxyBj2cbpUpXUeOZzCj7ZYn4BgZPxcLE?=
 =?us-ascii?Q?oA8ztdJ4nEd6XVqMkUqMsOWZND0pNYgtd3LrQu5xZopVP4A/6i8dxr1+epxS?=
 =?us-ascii?Q?Nnlyd1xLpmBZ+BRxVnO/dCN/+BGgdANtvaWNuGW1mAXjNqh0P3HDyNLyaJDb?=
 =?us-ascii?Q?YnOshKdtv84BCWIFFTUGFH281HReJxOGyjiSWp2325xaKFUY6aF15oRSUFU6?=
 =?us-ascii?Q?tnIjnQ+4mPA7Jg4zD0Idazr7AhVYyLlpNp6vN774ELps1+Bn3qtC7iEOU+SA?=
 =?us-ascii?Q?BS+fqDdgT7EggKaNoFEzpp4LIxl8RH9T1VgeDFlWvAhW+BVX81Qg9U4Z3kB3?=
 =?us-ascii?Q?4QDem0uM+SIALXJvV19ELKk6sQoxeKOPy33duwMk/i47qqGL97QowYJHQQJp?=
 =?us-ascii?Q?/sXTxMbbZLpJkwL9fL05HHV6pfq0ogp55Ra/a2zhklfwDPmReORhf9QDGprs?=
 =?us-ascii?Q?2va1BAhuiFIT34qLntYUnThZRZjz4rEmrsEgkTzxDkn9fBlXJ3fpic+YNpyE?=
 =?us-ascii?Q?9+aS5Fwbl2kktxwlRKOOeluOYxdhgG9XtQmhSLpJaoBsmvsVVt6Qh0+Wv+6W?=
 =?us-ascii?Q?/cCjx52aTUI4jM/vcuaybFlcQV7C4FMVW/aLtY7qGO6tRdA1yv2lBMeXF8NH?=
 =?us-ascii?Q?0J6Tdqh8B7JmSC8Z8tKFg7lXxst/+/QHvzx9m1lp3NLLqS5QHpgno/YGoz9I?=
 =?us-ascii?Q?PSw7dyA6hxw+ZZLbCImOyPq47j4hFPrS5bQpQO798bEKzAAp33WOnXFPdRi+?=
 =?us-ascii?Q?koXgx7tZSY+VnPVgdMZMACKsubce+598zFdVe0z88uRsq6lNFEkH2q2C75dg?=
 =?us-ascii?Q?qbwcdBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?43tNcCKiKll33kLgk4HMcGouQ0JehNRKwMZyHN5lAo6kzSVLb6zkhaH7YSPP?=
 =?us-ascii?Q?+5M355GVnqc+k6Ssg0sSfi50ldm9txDRQFRm+G2m/kMvk93wI6JFX9ANJmqC?=
 =?us-ascii?Q?hK4gOYbBq8Guj2DqVtzUNiQFiNjuR7m4ovlqYRCGKC1mdx6lnOFagh6LITAS?=
 =?us-ascii?Q?/EbchJvL31UTwZyNG1wWG96AsRRvtBcT/147ejwnej8OHzT0NDx4yFYzaK+5?=
 =?us-ascii?Q?KY7FiR6DE314cCM4djv09FniLe5C5EMB60zyH3JHlJT5znHQi7Pzn+l6ImZB?=
 =?us-ascii?Q?IYdCVQiv82a2aO2iehpIpY/ejFHnj4l6wV98oX8LOEwmlg59KCQaAwIGgpqD?=
 =?us-ascii?Q?UzkIxpP/O9AHp8YADbu5HZqK6niEKts+DZH/lYK4gElzsZEVw9CvkHtYn6a3?=
 =?us-ascii?Q?Uckh7qFAUB1daGfswbkVFfLwFLe9gXpnciDrIK2+UMPvILteplqg4vA/BvDR?=
 =?us-ascii?Q?PgNnAXgkSICAFjWie6Y/Gppq1rFJTBtBTA6MmIXgIPN1iNwUEF66mBgoRCFF?=
 =?us-ascii?Q?rDYBfJKk8XHbY6puhTIZf+HMM07kgrhc3TnlgemDs4yPrUGuyPka/SNrCiUY?=
 =?us-ascii?Q?oBQveHOiCBfSVMoSJEJS+9eoSEWYmTMr2tCgrjioxdG9Jarq4igXdB9Z0hmY?=
 =?us-ascii?Q?4sGAj/+4cY69HhjCdFkPGe+3yO8j5RfKSv3U+b8MximFJA1tZ1CKxf54dx+s?=
 =?us-ascii?Q?sYyWTgL4XvIqQLrttL/wM2T76q2l+JsI/dkdtpUMP72Bhp9wwJySIsx3Nlm/?=
 =?us-ascii?Q?aN1fwz+D+DyhrOhqibVxCyd+Q+SC9OaWp5aG49hXVeV9byT/ZW+sZ10DjLa7?=
 =?us-ascii?Q?2Oix1HpOV6Pkzn3pXcbF0n1EuS7rLBzoOWx79wLhqSDircUiXJIlZ6WnqTW4?=
 =?us-ascii?Q?zfwJKorLCm9MlasU4RsfgFt/yUZoAuwa01s2Ple5vQUIiHh0GVittgHVo3xi?=
 =?us-ascii?Q?heAXnoVSd1yqRPS1wumdyTMeFMbnav4A8ldwlmnrnhiGqXkobJBJVHRNHu8k?=
 =?us-ascii?Q?ifC7iZfFJq3QiPI9l79YJDraQf2f4lpVdKt0EB18c6eGmbnbfqizJiR4t5qL?=
 =?us-ascii?Q?xGjaSwoUVT3swag4XKa/OnlwfGz4FMHvG+fG0zXjBe37ZRC7xfHlUkNa9XUC?=
 =?us-ascii?Q?FstXzuANHgQrEY9bAx6POt4pScyYCSFPhjoMNUQiw79RUEPZc0aOUcARfuQZ?=
 =?us-ascii?Q?bjDeciCARRbfHKmGprX6193RVqrqJNzP3qqS7tkorkpXjE8q0qrCAe0PwEOf?=
 =?us-ascii?Q?XrAmqBt5Yb3puLgit9rrRJLCz9Sh366HTZ7Fyluplq4I552z6ScS4OuredqA?=
 =?us-ascii?Q?xbyo8a2JzIv1HiSVDHn1mOS0ZkCdc1FhU8I/dWhiBxE1eGCKEDPCg78OhsCv?=
 =?us-ascii?Q?YKX8j8KwYrZ7LKh+vjjKcWKNLBlhx9Dq8URokJruxmRGSI3/KmYwIM2Z295o?=
 =?us-ascii?Q?RKMN26o5gvfaOrs35Pf+D9WyRZY9fTCoGhn3DnRMnrjNN8H7nTNEk2xi3Hzj?=
 =?us-ascii?Q?c3TZkhK3YWAj4RyX+xdwD5QZShJU6k6FEvGJY2YxmI5k1RPkd9jSQzkcDdc8?=
 =?us-ascii?Q?AJNGHVU/WmLdpRvK/1MjEqWbHpca7vZvx1P8R2qojSH5wc25RYgkzAi+vPaX?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f42d69-9af0-4c2e-862a-08dd810e2041
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 19:53:02.9041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeh6QLl6pXUJUlI0hY8Y6zi+jslYT4ir9e7b9stWeQH4no8/cgy2hB2KyMEh3TGwupgyOtTE58qVpeUcUjHWp0XolKt9yw820bXgTzJY52U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
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

On Mon, Apr 21, 2025 at 08:13:13PM +0300, Raag Jadav wrote:
>On Mon, Apr 21, 2025 at 08:15:38AM -0700, Lucas De Marchi wrote:
>> Wrong copy and paste from other entries: these are starting to be
>> supported with 6.15.
>
>I had an impression that we follow the upstream drm tree, but it seems not?

This is a simplified diagram on how it propagates to a X.Y kernel release:

                                                (a)
         drm-xe/drm-xe-next  ->  drm/drm-next   ->  linus/master
                         |                      (b)      |
                         `---->  drm/drm-fixes  ->       `- <X.Y-rc1>
                         `---->  drm/drm-fixes  ->       `- <X.Y-rc2>
                                                         `- ...
                                                         `- <X.Y>

	(a) 2-weeks merge window
	(b) weekly fixes propagation

We always first merge it to drm-xe-next, but depending on when we merge
it, a **feature** may be targeting different kernel releases. As a rule of
thumb, a -next branch always target either the next kernel release or
next+1 in case current is already on ~ rc6. Fixes target the current or
next release (depending if the current has the bug or not).

This sysfs documentation is for the end user and userspace developer: they
have now idea (and shouldn't have) of any branch propagation in the
kernel to get to a release. This propagation is not even stable across
the different subsystems in the kernel.

>
>> Fixes: dac328dea701 ("drm/xe/hwmon: expose package and vram temperature")
>> Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4840
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index adbb9bce15a5d..6fbab98fb639d 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -111,7 +111,7 @@ Description:	RO. Package current voltage in millivolt.
>>
>>  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>>  Date:		March 2025
>> -KernelVersion:	6.14
>> +KernelVersion:	6.15
>
>Perhaps the date should match the release?
>https://hansen.beer/~dave/phb/

from Documentation/ABI/README:

	Date:           Date created
	KernelVersion:  Kernel version this feature first showed up in.

I don't think we need to try to predict the exact month a kernel release
will happen. There would certainly be mistakes. "Date created" can
simply be interpreted as when the feature merged in our branch and
doesn't matter much. The more important part is the kernel version.

Lucas De Marchi

>
>Raag
