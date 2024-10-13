Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DCACF2576
	for <intel-xe@archiver.kernel.org>; Sun, 13 Oct 2024 17:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6D810E0DC;
	Sun, 13 Oct 2024 17:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayrZ45Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F9610E0DC
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Oct 2024 17:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728840692; x=1760376692;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wpuQXNSgmPzMOyLg3lrKjUpCPKyFsdnGJnA0e1GWG5E=;
 b=ayrZ45CxZoySHfgCJa0fhLm5cmTDYujO+FSqOnfbwntJZ/9uf9Zy33H3
 M2GFW0Vfrukgqc4gH9jEejMh0x8EsQy3BoGaFVpwydh+FewB8Hny/oFJd
 bmIw2tCjF+FTE1NoBVGd3bpHDGwMh/+8axo9nLs6dlFhgLj/DUS/9Amum
 onvYnCEnBNfuSkVBvxJnv2MBj7YkyJs3z0JpSoKr2zVTBmCckH3SEI3HZ
 hyuKcO9cet7ydSOp3nSfoYGf7ghj3GC2eI/OSDI1f+00dAniwkrenKTvg
 yvokuRwDrJxdDu6fdzEFm49l0xZjj5lI1T7jxL6rhnJL1hGYk0zq39gxq w==;
X-CSE-ConnectionGUID: AkVbMR34SJWmSACIm+2GZA==
X-CSE-MsgGUID: btaMQCEoQiSbDmWPaLsBzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50719107"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="50719107"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 10:31:31 -0700
X-CSE-ConnectionGUID: dCn8SCFrRiOLhYjv9D4gkg==
X-CSE-MsgGUID: lH1wCq/TSFK9URXD++V9Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; d="scan'208";a="77287032"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2024 10:30:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 13 Oct 2024 10:30:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 13 Oct 2024 10:30:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 13 Oct 2024 10:30:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 13 Oct 2024 10:30:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 13 Oct 2024 10:30:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZL/oPziXw9Ju40ZfbD9hkP/M2TVyn48CGFqEpHNPVsl05mKNPIvzJ5ll1QAtS4EeB8rCvpQAax+FY0qEo519Wu/m+srAvRAw6fBOvfD48zPRBg3JjC2vxVIWhBqrzgQ5Y0OXiOy8xVthNF24Z8OnY5j94ZQwfFJS2SSPmwT0IZOrxaHXN6y4Dsr9au88EDkSiW4OQQyYtsb5zJZvDpLu2sUsPfIpRPaWNNtOCN9KALy5xngazaSHGCD3H14VUfydZq5vgXtJ6I9ovqPY/XZovcqFVNfj6gCsuSF1J3OJ6ccGlXOzHbIFT1GS4EIyAe1HIRIB+jb0PaR4vATlCbtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3fN4r3D58LS29rvGN7hShaeKeZ3LNczUXDGfYK6xlA=;
 b=xAVuL7JpoFeDlbwahhGpC52GRQfcyOdge7wUGc7fRtL4IVurRH3xviNa0mOlrGTTSTg1fn3H/dqnzBu4e3Dphf++wHaSzkZCnQRNOJVDcd4eyqqjOwjQHHgfO2Zl0QweH9FSfizZUKrYVHRXi+WlhmnN0mLo4dTp1XqjhpVKe7v8oJwgDRmcmqzRvlOuaCcMEKMzhdDsDZCDBF5MQUx6L1JPzRqA5Hp/9Y3SKsj35HOwjKAwF7N/QUr1HbY3WKB65FpdWrzDvMsBxou3euwiwsUNKtNSonti9lYRJmAxnt/VYEH6eGz86MsW00DOW1kDEmb8AKfq6KUuRcDJbe9DUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8841.namprd11.prod.outlook.com (2603:10b6:408:2b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sun, 13 Oct
 2024 17:30:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.020; Sun, 13 Oct 2024
 17:30:50 +0000
Date: Sun, 13 Oct 2024 17:30:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <ZwwDq++SAOxI7mbz@DUT025-TGLU.fm.intel.com>
References: <20241009172125.1539-1-michal.wajdeczko@intel.com>
 <20241009172125.1539-2-michal.wajdeczko@intel.com>
 <ZwnV7WFgRw85mdxZ@DUT025-TGLU.fm.intel.com>
 <66db813f-a475-4043-bdef-25be321e18c3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66db813f-a475-4043-bdef-25be321e18c3@intel.com>
X-ClientProxiedBy: BY3PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 9279e18f-216a-4492-3ef4-08dcebacc7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+iVM8Rk05UORunIC2EwjNDhjftdBDwgv2n8/5ccw5QJcswqwmZxuBVGHjZ?=
 =?iso-8859-1?Q?JGVR7gkE74xw+/TxW97NGCo1fEXqBnebPvpcvl7Uh9ZuBFVHcC70XVQuw1?=
 =?iso-8859-1?Q?FW0/tlIDrvMdFiGd+1g2XuMKpyn2pFIVUAMUdEaZf5Pii/GhoVhPrmDIaG?=
 =?iso-8859-1?Q?M3D0jIn6ai+QgtnVHNmGgjUEvt6K2wt7bKAJaSh37WHMj0HDf+v8MZvZkg?=
 =?iso-8859-1?Q?RNVrawx6y7idqcGfG6d8Kfvwn6I0bZAQxLGPMWNEdF41DRP1BYX05DURA6?=
 =?iso-8859-1?Q?06L60oqtTM+o7Qfepx8an6p5+TjxWY5nZO72Nn0K0qZk+nImxAdhpjXysP?=
 =?iso-8859-1?Q?LsH3Z0K7znbaU8E8ZYaXe8cvwMDe5ofubQRSb8Up1LF+6TDEH1I7+bYCWj?=
 =?iso-8859-1?Q?vs5TOYYTiPjwFa5KOQWUzs5+TUrRF8mtHXWAheCRlKFyf9M1rD3WisIc7S?=
 =?iso-8859-1?Q?1bRQDqVh9mdfPiF/xajcaiP59Ry003Iusd6RPQLP53YDYU0GZ9dysBd0f1?=
 =?iso-8859-1?Q?c66tPz/tmrcHgDAvAr1N6ZCYKOIJH5d0oGdCeSdc2Rtkp7vhVf2tAhZwi3?=
 =?iso-8859-1?Q?nZ8iKzgYo2deFrWQhxk4cYSCfOIXyF/MRr+9Y7ANq5bxsK4v2ISR4As9/N?=
 =?iso-8859-1?Q?2C8F9ihqlE4GOiWI8XA8Z5o3PP6VfgI1gQ4Oc/TzlELgMxSUTpHT2BW13J?=
 =?iso-8859-1?Q?hT4eu0NvGlrhbpv9Gtlvt/0S+iVJw5FNLhTB2kcka87lG3+6ct6BKxdMv3?=
 =?iso-8859-1?Q?aSLBHWhLItXuKbNG0JKm9RQgNMqex4W7MjkZn++MCuCyosSlE1DuQQJenB?=
 =?iso-8859-1?Q?OuJF8z4K0aZpRI+YXu5TOfAb1ieg/9XanF0bTxbrlk3XGvKWx1zizG7SMS?=
 =?iso-8859-1?Q?MKUlN+H0+Y5VxGtfSY6Gp7y/EOGI77tRb5MAWMT3RTiwdfcbyAqMCbpuLh?=
 =?iso-8859-1?Q?835SImUz0tfeDdJ9wPteqFH+Bb4P0Iu3+JmXTog4xlmwGyk+W1sSROH8CC?=
 =?iso-8859-1?Q?0hcSqqAJEz0ry9e2Kwmq5PRf9X9aklh/lIp95WgzkEOMvHVXeds//gyy7G?=
 =?iso-8859-1?Q?VWCIKpi+mKRIzrf0Rp1CoEewKgvZGoh51+KYPthZOiCtQp8eIr0JVH5Zoo?=
 =?iso-8859-1?Q?EGx++OGUtL9xaYh1ODCz+UWnoFAr8hADzUnyqHQnawGL9y4UaBoZFP8d11?=
 =?iso-8859-1?Q?nsMbvupoTnhGFWtW9FZoteXV0FljwXksROrJnkeQqtZI0O8SeO5Aa1J1DC?=
 =?iso-8859-1?Q?wS8qepZKoKJ6BtywabCZVveXHCUHHvnkv/Du+Erj+YVoIKN0TqrDLhNsUe?=
 =?iso-8859-1?Q?YMUJIlV1m9xaFy4tMPUwrZUEUg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hD6z8GV/hIOmdUenR5eFVKXtfNDF+QyU7btdD9zHbnpmeaRFKs0bEBOeF4?=
 =?iso-8859-1?Q?q/ZzqCgrHRBfBp6jnrgzoGU905zq/g4m/NLVu/pj+jWISroo5dzHfXXo9G?=
 =?iso-8859-1?Q?X8MUYpHoQ44zRwDe5TvR0woeyMQtT9MKOQ4c/2k7seFfer9xQsoJUYxeeo?=
 =?iso-8859-1?Q?0qITxjZ85/gKkGdwKlhQDc8mP3veUubB+SM/rCST/l77UoUzYkFgX7T18E?=
 =?iso-8859-1?Q?S3QSyq3U6/X3X7q+RgPy1KTZE3eLp6oqLCkpz0pphwZZ3FCbhIMW8EOLc8?=
 =?iso-8859-1?Q?odpWxPHGXw5nywwaDzjskd0xMwVJjn23PSkd2pPFleIy92frT2HKNDulzf?=
 =?iso-8859-1?Q?BirwhBSe3NmKrfXl1NPUTS6Wzl3Pv8jPhRd7YxuUkCa/Qe1dBAi5zVY5Yl?=
 =?iso-8859-1?Q?fR/LFuMrFS5Aol4OD1KZztJXdDviMqIiMo6UmmCBr0l3Kmd8CqbR1WNUFC?=
 =?iso-8859-1?Q?IdSdDH88Cj9BRBLd2CNmf+R9CWjpy8gfbeTPTP61ccz01nX+kqcvZzjw1n?=
 =?iso-8859-1?Q?fyUmTKY1R8DAp1hTq21FnhFK/Y4yA8fAB7DQ5cAHKWVPt5KWfLc/pKMXiE?=
 =?iso-8859-1?Q?fSkvbcmrm/kmDs0vCgbbA42EKG8IJ4xhG8H5brJiEhyO+jJp34Q1I4yS8r?=
 =?iso-8859-1?Q?4htxT3NX9ZEfkX6gKkunJDH5Nce8yyfG/Azit9Qygc31SuzzPEwgQ6a1/n?=
 =?iso-8859-1?Q?FB3nPa3UGFG/i35BSSSW4+hvAnBkY/EZbRDlaMItNksvc/wMN/G0ChVTum?=
 =?iso-8859-1?Q?AChLWseMBsUpKMOShCJyQMZMbXIT0zNZGV9nyWSdQ0CdbMVHWoyypGH9wU?=
 =?iso-8859-1?Q?9SFfo6igBLBm1QPQzJZ8+AExOK85RzD//eqIw/v04j/58JHFFWNK2zilds?=
 =?iso-8859-1?Q?fQrAPj2AlnmhDC0fAM0F8YKpYQJmZ4W5DUO/2J5pWK4Wx4gB5r8j8HWNja?=
 =?iso-8859-1?Q?NgoG9hTjzclDBITPOtefSLQhfoY3vWkSrSskAbZHmccYw1G3ywHNFzgsNR?=
 =?iso-8859-1?Q?JnMAHQTjg9EGv/KRo9AKWGzyp72mcXvE75zWg4tx7FgNj2zcJ1qotZZ65r?=
 =?iso-8859-1?Q?nLcKhz80SyCeKqh73Z9uOTycYjL/O5Cw2YVcc6tZtNp/aofo6EsUBF89Tf?=
 =?iso-8859-1?Q?7HPFXyvZ4PcR6gtoyfIyuz7AYcL719PV1dLCmZkNCDys0lwKeQf4W68VMk?=
 =?iso-8859-1?Q?T1Z+vXr/jccx0zvnljREMjG3yyhIHQ3VCXZsfa2eBsWGUJRpOIAj2JgDvl?=
 =?iso-8859-1?Q?efbNGGBdfSYaYFFSr9DydWRevzn9dO8BdZl7mYCYXE6pcujeB9bpNqufAg?=
 =?iso-8859-1?Q?Du7RqIitYaaJdt0qr7eVTVoqibP5P8KczJE745fD+GiDKbmSlncgmFy0Mg?=
 =?iso-8859-1?Q?D2eapNWjVVtCyBZYEn/0/4CzvjEhgMno8Cb0PCd0xGMxmX5pj9Ffu2Snly?=
 =?iso-8859-1?Q?b41dyN85iG4iBBCIZlRi+03gpnzWNjysf9/HGU1MwCGwimKshGT/uZmYim?=
 =?iso-8859-1?Q?w68WwCrPiXGHO8Y1KA9OX9fZdMA2qD6Be60+nqKQ8PkP3iiCpHwuF/a8wM?=
 =?iso-8859-1?Q?6+UsSNQKt1gUpIQAIMscjtz/GcfZv5kyuH26aGJjDAtTFYxg11eX20tAW6?=
 =?iso-8859-1?Q?zUKONQZQgw6HZ5TEi77f4IQBlFPufAvjgXAePQ4IxdMQjD+LkLWBy51g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9279e18f-216a-4492-3ef4-08dcebacc7e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2024 17:30:50.2001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDQPa9P9paWtuLim15s0J3ona65eowu5c2bl7kuDKfPi7emkCd9uuf6Uo9UuHHEt4fEe6JUNw8d9hcrOqoOXPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8841
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

On Sun, Oct 13, 2024 at 01:55:45PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 12.10.2024 03:50, Matthew Brost wrote:
> > On Wed, Oct 09, 2024 at 07:21:21PM +0200, Michal Wajdeczko wrote:
> >> The purpose of the GuC Buffer Cache is to prepare a cached buffer
> >> that could be used by some of the CTB based communication actions
> >> which require an indirect data to be passed in a separate location
> >> than CT message buffer.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > 
> > Quick reaction without to much thought, this looks like reinventing
> > suballocation which we already have in the DRM layer / Xe.
> > 
> > See - xe_sa.c, drm_suballoc.c
> > 
> > So I'd say build this layer on top one of those or ditch this layer
> > entirely and directly use xe_sa.c. I'm pretty sure you could allocate
> > from the existing pool of tile->mem.kernel_bb_pool as the locking in
> > that layers make that safe. Maybe rename 'tile->mem.kernel_bb_pool' to
> > something more generic if that works.
> 
> TBH reuse of the xe_sa was my first approach but then I found that every
> new GPU sub-allocation actually still allocates some host memory:
> 

I was wondering the purpose of this patch was to remove memory
allocations from PF H2G function. This makes more sense what you are
trying to do.

> struct drm_suballoc * drm_suballoc_new(...)
> {
> ...
> 	sa = kmalloc(sizeof(*sa), gfp);

Can we not just wire GFP_ATOMIC here? I suppose this is failure point
albiet a very unlikely one.

Another option might be update SA layers to take drm_suballoc on the
stack and just initialize it and then after use fini it. Of course this
only works if the init / fini are called within a single function. This
might be useful in other places / drivers too.

I guess all these options need to be weighed against each other.

1. GFP atomic in drm_suballoc_new - easiest but failure point
2. Add drm_suballoc_init / fini - seems like this would work
3. This new layer - works but quite a bit of new code

I think I'd personally lean towards start with #1 to get this fixed
quickly and then post #2 shortly afterwards to see something like this
could get accepted.

> so it didn't match my requirement to avoid any memory allocations since
> I want to use it while sending H2G with VFs re-provisioning during a
> reset - as attempt to resolve issue mentioned in [1]
> 
> [1]
> https://lore.kernel.org/intel-xe/3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com/
>

Thanks for the ref.

Matt

> 
> > 
> > Matt
> > 
> >> ---
> >>  drivers/gpu/drm/xe/Makefile           |   1 +
> >>  drivers/gpu/drm/xe/xe_guc_buf.c       | 387 ++++++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_guc_buf.h       |  48 ++++
> >>  drivers/gpu/drm/xe/xe_guc_buf_types.h |  40 +++
> >>  4 files changed, 476 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
> >>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
> >>  create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h
> >>
> >> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >> index da80c29aa363..0aed652dc806 100644
> >> --- a/drivers/gpu/drm/xe/Makefile
> >> +++ b/drivers/gpu/drm/xe/Makefile
> >> @@ -56,6 +56,7 @@ xe-y += xe_bb.o \
> >>  	xe_gt_topology.o \
> >>  	xe_guc.o \
> >>  	xe_guc_ads.o \
> >> +	xe_guc_buf.o \
> >>  	xe_guc_capture.o \
> >>  	xe_guc_ct.o \
> >>  	xe_guc_db_mgr.o \
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> >> new file mode 100644
> >> index 000000000000..a49be711ea86
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> >> @@ -0,0 +1,387 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright © 2024 Intel Corporation
> >> + */
> >> +
> >> +#include <linux/bitmap.h>
> >> +#include <linux/cleanup.h>
> >> +#include <linux/mutex.h>
> >> +
> >> +#include <drm/drm_managed.h>
> >> +
> >> +#include "xe_assert.h"
> >> +#include "xe_bo.h"
> >> +#include "xe_gt_printk.h"
> >> +#include "xe_guc.h"
> >> +#include "xe_guc_buf.h"
> >> +
> >> +/**
> >> + * DOC: GuC Buffer Cache
> >> + *
> >> + * The purpose of the `GuC Buffer Cache`_ is to prepare a cached buffer for use
> >> + * by the GuC `CTB based communication` actions that require an indirect data to
> >> + * be passed in a separate GPU memory location, that needs to be available only
> >> + * during processing of that GuC action.
> >> + *
> >> + * The xe_guc_buf_cache_init() will allocate and initialize the cache object.
> >> + * The object is drm managed and will be allocated with GFP_KERNEL flag.
> >> + * The size of the underlying GPU memory buffer will be aligned to SZ_4K.
> >> + * The cache will then support up to BITS_PER_LONG a sub-allocations from that
> >> + * data buffer. Each sub-allocation will be at least aligned to SZ_64.
> >> + *
> >> + * ::
> >> + *
> >> + *       <------> chunk (n * 64)
> >> + *       <------------- CPU mirror (n * 4K) -------------------------------->
> >> + *      +--------+--------+--------+--------+-----------------------+--------+
> >> + *      |   0    |   1    |   2    |   3    |                       |   m    |
> >> + *      +--------+--------+--------+--------+-----------------------+--------+
> >> + *                                                 ||       /\
> >> + *                                                flush     ||
> >> + *                                                 ||      sync
> >> + *                                                 \/       ||
> >> + *      +--------+--------+--------+--------+-----------------------+--------+
> >> + *      |   0    |   1    |   2    |   3    |                       |   m    |
> >> + *      +--------+--------+--------+--------+-----------------------+--------+
> >> + *       <--------- GPU allocation (n * 4K) -------------------------------->
> >> + *       <------> chunk (n * 64)
> >> + *
> >> + * The xe_guc_buf_reserve() will return a reference to a new sub-allocation.
> >> + * The xe_guc_buf_release() shall be used to release a such sub-allocation.
> >> + *
> >> + * The xe_guc_buf_cpu_ptr() will provide access to the sub-allocation.
> >> + * The xe_guc_buf_flush() shall be used to flush data from any mirror buffer to
> >> + * the underlying GPU memory.
> >> + *
> >> + * The xe_guc_buf_gpu_addr() will provide a GPU address of the sub-allocation.
> >> + * The xe_guc_buf_sync() might be used to copy the content of the sub-allocation
> >> + * from the GPU memory to the local mirror buffer.
> >> + */
> >> +
> >> +static struct xe_guc *cache_to_guc(struct xe_guc_buf_cache *cache)
> >> +{
> >> +	return cache->guc;
> >> +}
> >> +
> >> +static struct xe_gt *cache_to_gt(struct xe_guc_buf_cache *cache)
> >> +{
> >> +	return guc_to_gt(cache_to_guc(cache));
> >> +}
> >> +
> >> +static struct xe_device *cache_to_xe(struct xe_guc_buf_cache *cache)
> >> +{
> >> +	return gt_to_xe(cache_to_gt(cache));
> >> +}
> >> +
> >> +static struct mutex *cache_mutex(struct xe_guc_buf_cache *cache)
> >> +{
> >> +	return &cache_to_guc(cache)->ct.lock;
> >> +}
> >> +
> >> +static void __fini_cache(void *arg)
> >> +{
> >> +	struct xe_guc_buf_cache *cache = arg;
> >> +	struct xe_gt *gt = cache_to_gt(cache);
> >> +
> >> +	if (cache->used)
> >> +		xe_gt_dbg(gt, "buffer cache unclean: %#lx = %u * %u bytes\n",
> >> +			  cache->used, bitmap_weight(&cache->used, BITS_PER_LONG), cache->chunk);
> >> +
> >> +	kvfree(cache->mirror);
> >> +	cache->mirror = NULL;
> >> +	cache->bo = NULL;
> >> +	cache->used = 0;
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_buf_cache_init() - Allocate and initialize a GuC Buffer Cache.
> >> + * @guc: the &xe_guc where this cache will be used
> >> + * @size: minimum size of the cache
> >> + *
> >> + * See `GuC Buffer Cache`_ for details.
> >> + *
> >> + * Return: pointer to the &xe_guc_buf_cache on success or a ERR_PTR() on failure.
> >> + */
> >> +struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size)
> >> +{
> >> +	struct xe_gt *gt = guc_to_gt(guc);
> >> +	struct xe_tile *tile = gt_to_tile(gt);
> >> +	struct xe_device *xe = tile_to_xe(tile);
> >> +	struct xe_guc_buf_cache *cache;
> >> +	u32 chunk_size;
> >> +	u32 cache_size;
> >> +	int ret;
> >> +
> >> +	cache_size = ALIGN(size, SZ_4K);
> >> +	chunk_size = cache_size / BITS_PER_LONG;
> >> +
> >> +	xe_gt_assert(gt, size);
> >> +	xe_gt_assert(gt, IS_ALIGNED(chunk_size, SZ_64));
> >> +
> >> +	cache = drmm_kzalloc(&xe->drm, sizeof(*cache), GFP_KERNEL);
> >> +	if (!cache)
> >> +		return ERR_PTR(-ENOMEM);
> >> +
> >> +	cache->bo = xe_managed_bo_create_pin_map(xe, tile, cache_size,
> >> +						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> >> +						 XE_BO_FLAG_GGTT |
> >> +						 XE_BO_FLAG_GGTT_INVALIDATE);
> >> +	if (IS_ERR(cache->bo))
> >> +		return ERR_CAST(cache->bo);
> >> +
> >> +	cache->guc = guc;
> >> +	cache->chunk = chunk_size;
> >> +	cache->mirror = kvzalloc(cache_size, GFP_KERNEL);
> >> +	if (!cache->mirror)
> >> +		return ERR_PTR(-ENOMEM);
> >> +
> >> +	ret = devm_add_action_or_reset(xe->drm.dev, __fini_cache, cache);
> >> +	if (ret)
> >> +		return ERR_PTR(ret);
> >> +
> >> +	xe_gt_dbg(gt, "buffer cache at %#x (%uKiB = %u x %zu dwords) for %ps\n",
> >> +		  xe_bo_ggtt_addr(cache->bo), cache_size / SZ_1K,
> >> +		  BITS_PER_LONG, chunk_size / sizeof(u32), __builtin_return_address(0));
> >> +	return cache;
> >> +}
> >> +
> >> +static bool cache_is_ref_active(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	lockdep_assert_held(cache_mutex(cache));
> >> +	return bitmap_subset(&ref, &cache->used, BITS_PER_LONG);
> >> +}
> >> +
> >> +static bool ref_is_valid(unsigned long ref)
> >> +{
> >> +	return ref && find_next_bit(&ref, BITS_PER_LONG,
> >> +				    find_first_bit(&ref, BITS_PER_LONG) +
> >> +				    bitmap_weight(&ref, BITS_PER_LONG)) == BITS_PER_LONG;
> >> +}
> >> +
> >> +static void cache_assert_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	xe_gt_assert_msg(cache_to_gt(cache), ref_is_valid(ref),
> >> +			 "# malformed ref %#lx %*pbl", ref, (int)BITS_PER_LONG, &ref);
> >> +	xe_gt_assert_msg(cache_to_gt(cache), cache_is_ref_active(cache, ref),
> >> +			 "# stale ref %#lx %*pbl vs used %#lx %*pbl",
> >> +			 ref, (int)BITS_PER_LONG, &ref,
> >> +			 cache->used, (int)BITS_PER_LONG, &cache->used);
> >> +}
> >> +
> >> +static unsigned long cache_reserve(struct xe_guc_buf_cache *cache, u32 size)
> >> +{
> >> +	unsigned long index;
> >> +	unsigned int nbits;
> >> +
> >> +	lockdep_assert_held(cache_mutex(cache));
> >> +	xe_gt_assert(cache_to_gt(cache), size);
> >> +	xe_gt_assert(cache_to_gt(cache), size <= BITS_PER_LONG * cache->chunk);
> >> +
> >> +	nbits = DIV_ROUND_UP(size, cache->chunk);
> >> +	index = bitmap_find_next_zero_area(&cache->used, BITS_PER_LONG, 0, nbits, 0);
> >> +	if (index >= BITS_PER_LONG) {
> >> +		xe_gt_dbg(cache_to_gt(cache), "no space for %u byte%s in cache at %#x used %*pbl\n",
> >> +			  size, str_plural(size), xe_bo_ggtt_addr(cache->bo),
> >> +			  (int)BITS_PER_LONG, &cache->used);
> >> +		return 0;
> >> +	}
> >> +
> >> +	bitmap_set(&cache->used, index, nbits);
> >> +
> >> +	return GENMASK(index + nbits - 1, index);
> >> +}
> >> +
> >> +static u64 cache_ref_offset(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	cache_assert_ref(cache, ref);
> >> +	return __ffs(ref) * cache->chunk;
> >> +}
> >> +
> >> +static u32 cache_ref_size(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	cache_assert_ref(cache, ref);
> >> +	return hweight_long(ref) * cache->chunk;
> >> +}
> >> +
> >> +static u64 cache_ref_gpu_addr(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	return xe_bo_ggtt_addr(cache->bo) + cache_ref_offset(cache, ref);
> >> +}
> >> +
> >> +static void *cache_ref_cpu_ptr(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	return cache->mirror + cache_ref_offset(cache, ref);
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_buf_reserve() - Reserve a new sub-allocation.
> >> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> >> + * @size: the requested size of the buffer
> >> + *
> >> + * Use xe_guc_buf_is_valid() to check if returned buffer reference is valid.
> >> + * Must use xe_guc_buf_release() to release a sub-allocation.
> >> + *
> >> + * Return: a &xe_guc_buf of new sub-allocation.
> >> + */
> >> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size)
> >> +{
> >> +	guard(mutex)(cache_mutex(cache));
> >> +	unsigned long ref;
> >> +
> >> +	ref = cache_reserve(cache, size);
> >> +
> >> +	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_buf_from_data() - Reserve a new sub-allocation using data.
> >> + * @cache: the &xe_guc_buf_cache where reserve sub-allocation
> >> + * @data: the data to flush the sub-allocation
> >> + * @size: the size of the data
> >> + *
> >> + * Similar to xe_guc_buf_reserve() but flushes @data to the GPU memory.
> >> + *
> >> + * Return: a &xe_guc_buf of new sub-allocation.
> >> + */
> >> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> >> +				       const void *data, size_t size)
> >> +{
> >> +	guard(mutex)(cache_mutex(cache));
> >> +	unsigned long ref;
> >> +
> >> +	ref = cache_reserve(cache, size);
> >> +	if (ref) {
> >> +		u32 offset = cache_ref_offset(cache, ref);
> >> +
> >> +		xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
> >> +				 offset, data, size);
> >> +	}
> >> +
> >> +	return (struct xe_guc_buf){ .cache = cache, .ref = ref };
> >> +}
> >> +
> >> +static void cache_release_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	cache_assert_ref(cache, ref);
> >> +	cache->used &= ~ref;
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_buf_release() - Release a sub-allocation.
> >> + * @buf: the &xe_guc_buf to release
> >> + *
> >> + * Releases a sub-allocation reserved by xe_guc_buf_reserve().
> >> + */
> >> +void xe_guc_buf_release(const struct xe_guc_buf buf)
> >> +{
> >> +	guard(mutex)(cache_mutex(buf.cache));
> >> +
> >> +	if (!buf.ref)
> >> +		return;
> >> +
> >> +	cache_release_ref(buf.cache, buf.ref);
> >> +}
> >> +
> >> +static u64 cache_flush_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	u32 offset = cache_ref_offset(cache, ref);
> >> +	u32 size = cache_ref_size(cache, ref);
> >> +
> >> +	xe_map_memcpy_to(cache_to_xe(cache), &cache->bo->vmap,
> >> +			 offset, cache->mirror + offset, size);
> >> +
> >> +	return cache_ref_gpu_addr(cache, ref);
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_buf_flush() - Copy the data from the sub-allocation to the GPU memory.
> >> + * @buf: the &xe_guc_buf to flush
> >> + *
> >> + * Return: a GPU address of the sub-allocation.
> >> + */
> >> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf)
> >> +{
> >> +	guard(mutex)(cache_mutex(buf.cache));
> >> +
> >> +	return cache_flush_ref(buf.cache, buf.ref);
> >> +}
> >> +
> >> +static void *cache_sync_ref(struct xe_guc_buf_cache *cache, unsigned long ref)
> >> +{
> >> +	u32 offset = cache_ref_offset(cache, ref);
> >> +	u32 size = cache_ref_size(cache, ref);
> >> +
> >> +	xe_map_memcpy_from(cache_to_xe(cache), cache->mirror + offset,
> >> +			   &cache->bo->vmap, offset, size);
> >> +
> >> +	return cache_ref_cpu_ptr(cache, ref);
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_buf_sync() - Copy the data from the GPU memory to the sub-allocation.
> >> + * @buf: the &xe_guc_buf to sync
> >> + *
> >> + * Return: the CPU pointer to the sub-allocation.
> >> + */
> >> +void *xe_guc_buf_sync(const struct xe_guc_buf buf)
> >> +{
> >> +	guard(mutex)(cache_mutex(buf.cache));
> >> +
> >> +	return cache_sync_ref(buf.cache, buf.ref);
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_buf_cpu_ptr() - Obtain a CPU pointer to the sub-allocation.
> >> + * @buf: the &xe_guc_buf to query
> >> + *
> >> + * Return: the CPU pointer of the sub-allocation.
> >> + */
> >> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf)
> >> +{
> >> +	guard(mutex)(cache_mutex(buf.cache));
> >> +
> >> +	return cache_ref_cpu_ptr(buf.cache, buf.ref);
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_buf_gpu_addr() - Obtain a GPU address of the sub-allocation.
> >> + * @buf: the &xe_guc_buf to query
> >> + *
> >> + * Return: the GPU address of the sub-allocation.
> >> + */
> >> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf)
> >> +{
> >> +	guard(mutex)(cache_mutex(buf.cache));
> >> +
> >> +	return cache_ref_gpu_addr(buf.cache, buf.ref);
> >> +}
> >> +
> >> +/**
> >> + * xe_guc_cache_gpu_addr_from_ptr() - Lookup a GPU address using the pointer.
> >> + * @cache: the &xe_guc_buf_cache with sub-allocations
> >> + * @ptr: the CPU pointer to the data from a sub-allocation
> >> + * @size: the size of the data at @ptr
> >> + *
> >> + * Return: the GPU address on success or 0 on failure.
> >> + */
> >> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size)
> >> +{
> >> +	guard(mutex)(cache_mutex(cache));
> >> +	ptrdiff_t offset = ptr - cache->mirror;
> >> +	unsigned long ref;
> >> +	int first, last;
> >> +
> >> +	if (offset < 0)
> >> +		return 0;
> >> +
> >> +	first = div_u64(offset, cache->chunk);
> >> +	last = DIV_ROUND_UP(offset + max(1, size), cache->chunk) - 1;
> >> +
> >> +	if (last >= BITS_PER_LONG)
> >> +		return 0;
> >> +
> >> +	ref = GENMASK(last, first);
> >> +	cache_assert_ref(cache, ref);
> >> +
> >> +	return xe_bo_ggtt_addr(cache->bo) + offset;
> >> +}
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.h b/drivers/gpu/drm/xe/xe_guc_buf.h
> >> new file mode 100644
> >> index 000000000000..700e7b06c149
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_guc_buf.h
> >> @@ -0,0 +1,48 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright © 2024 Intel Corporation
> >> + */
> >> +
> >> +#ifndef _XE_GUC_BUF_H_
> >> +#define _XE_GUC_BUF_H_
> >> +
> >> +#include <linux/cleanup.h>
> >> +
> >> +#include "xe_guc_buf_types.h"
> >> +
> >> +struct xe_guc_buf_cache *xe_guc_buf_cache_init(struct xe_guc *guc, u32 size);
> >> +
> >> +struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 size);
> >> +struct xe_guc_buf xe_guc_buf_from_data(struct xe_guc_buf_cache *cache,
> >> +				       const void *data, size_t size);
> >> +void xe_guc_buf_release(const struct xe_guc_buf buf);
> >> +
> >> +/**
> >> + * xe_guc_buf_is_valid() - Check if the GuC Buffer Cache sub-allocation is valid.
> >> + * @buf: the &xe_guc_buf reference to check
> >> + *
> >> + * Return: true if @buf represents a valid sub-allocation.
> >> + */
> >> +static inline bool xe_guc_buf_is_valid(const struct xe_guc_buf buf)
> >> +{
> >> +	return buf.ref;
> >> +}
> >> +
> >> +void *xe_guc_buf_sync(const struct xe_guc_buf buf);
> >> +void *xe_guc_buf_cpu_ptr(const struct xe_guc_buf buf);
> >> +u64 xe_guc_buf_flush(const struct xe_guc_buf buf);
> >> +u64 xe_guc_buf_gpu_addr(const struct xe_guc_buf buf);
> >> +
> >> +u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *ptr, u32 size);
> >> +
> >> +DEFINE_CLASS(xe_guc_buf, struct xe_guc_buf,
> >> +	     xe_guc_buf_release(_T),
> >> +	     xe_guc_buf_reserve(cache, size),
> >> +	     struct xe_guc_buf_cache *cache, u32 size);
> >> +
> >> +DEFINE_CLASS(xe_guc_buf_from_data, struct xe_guc_buf,
> >> +	     xe_guc_buf_release(_T),
> >> +	     xe_guc_buf_from_data(cache, data, size),
> >> +	     struct xe_guc_buf_cache *cache, const void *data, u32 size);
> >> +
> >> +#endif
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> >> new file mode 100644
> >> index 000000000000..fe93b32e97f8
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> >> @@ -0,0 +1,40 @@
> >> +/* SPDX-License-Identifier: MIT */
> >> +/*
> >> + * Copyright © 2024 Intel Corporation
> >> + */
> >> +
> >> +#ifndef _XE_GUC_BUF_TYPES_H_
> >> +#define _XE_GUC_BUF_TYPES_H_
> >> +
> >> +#include <linux/types.h>
> >> +
> >> +struct xe_bo;
> >> +struct xe_guc;
> >> +
> >> +/**
> >> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> >> + */
> >> +struct xe_guc_buf_cache {
> >> +	/** @guc: the parent GuC where buffers are used */
> >> +	struct xe_guc *guc;
> >> +	/** @bo: the main cache buffer object with GPU allocation */
> >> +	struct xe_bo *bo;
> >> +	/** @mirror: the CPU pointer to the data buffer */
> >> +	void *mirror;
> >> +	/** @used: the bitmap used to track allocated chunks */
> >> +	unsigned long used;
> >> +	/** @chunk: the size of the smallest sub-allocation */
> >> +	u32 chunk;
> >> +};
> >> +
> >> +/**
> >> + * struct xe_guc_buf - GuC Data Buffer Reference.
> >> + */
> >> +struct xe_guc_buf {
> >> +	/** @cache: the cache where this allocation belongs */
> >> +	struct xe_guc_buf_cache *cache;
> >> +	/** @ref: the internal reference */
> >> +	unsigned long ref;
> >> +};
> >> +
> >> +#endif
> >> -- 
> >> 2.43.0
> >>
> 
