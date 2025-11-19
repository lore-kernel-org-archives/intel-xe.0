Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD090CF34D9
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 15:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7E310E662;
	Wed, 19 Nov 2025 15:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emfcRdJV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E09710E662
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763566029; x=1795102029;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=SUvKnLOHWl1NGkKfCmYqspg5qZfYfmI7T9OTo0Uf6b8=;
 b=emfcRdJVk/tKXqspgnSObJ/OKd+W2+1oOoV1bmQu2iLRasYrUipC6XX6
 +hi+ZgJYoI9mwXOOIBfr/vUVA0BHqFfwX/J+XSz+nNDPSuAvHe+87daU4
 3Gq6mrWdWW8CtQQgDXZzUmwL1zesaySO5ZAKnKZ5IV1pxWcYQcVKD1o+l
 BqcAq4T1+94yJar7gzvuBGUNR02/iDZRTz0lBXvuCruQzAEogx61kqusR
 RUIg3c16LeLg0USScVvLmPlCt76DVP+dME8II/HlApQHQlTDlV3oia/WS
 3opm/lEz2VlaeaxzIQycsVzM8bWmyK8WYzoXk+XG+Hy7FvDJjYgcF7tUR g==;
X-CSE-ConnectionGUID: IPMSVJY0RvSyn9TjuZa0lA==
X-CSE-MsgGUID: J3R4BtmVQousNtQXbBlGZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65544511"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65544511"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 07:27:08 -0800
X-CSE-ConnectionGUID: 3Y8XzKzXQgCcom6DqsfOpQ==
X-CSE-MsgGUID: 5lg44A4hQj6LdndxJIeaeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191122432"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 07:27:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 07:27:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 07:27:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 07:27:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEuhp5MzCvvMSViun5jyPRb7DOo3E5H3M7meQrItDAJOr57HLw+MzMEtPtVkXFaHYu/XwXtgjffnc6VWC3r5D0sZgOfcNRjUQ8hsx2GoUkEdT3R7xbVYChvFkpxJ4OdPhKyekmdPhJ2V39PTzH8ElCMuEGxIHSdB2XKRzjGFW91oZM657RCQzeZQF+gvsrTq/e6kERcEud4BSh+tJD8Fx/AhTcKlYl1INXq/kMfDGLsujI+IXXkWZKwfcKPL8JXNeicxKfq1dgBmcRkFW8Kw6gngCiLJfXdHmpwfDRgKcnboIYblnpd3YFh5cViwCUjWgm6DjvuHF31E+3BQE6nA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85Lcv/Ly+FiOBzjDs//1BSdXfM4Y0AUgOjfidw6BBXk=;
 b=DlS91sTpExeSDa4pRdrkrUsryBs/A1FXvWelV8MjzNnsghHyrPDNLDyTxUmBH6HnWTzBiFFGzx/Mj1jPeUDw0qYQX/tPwF/B48AL6eqsCHVAXIb2e0l0bOpBLpFR4MUFc2MsQWCMWm0nStiWNNIrhzUA5Zblk4Vgtr1subZQjiDtTNtUpzoEOlOmle30kVbI/B40iClmF0bwNUZuG/AJyWR2hBrWHdY5KKq2WF5d8bXIJMpKB8USJbL9nlJQP8V3UchhviLwlARo9r1UENbaDwdf619A2p//iy31Rzf82QY+5yw9VAuok1tIr/3DK7M6cysIUVZ43ydyZQg4q5sAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7406.namprd11.prod.outlook.com (2603:10b6:8:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 15:26:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 15:26:56 +0000
Date: Wed, 19 Nov 2025 07:26:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=2Fvm=3A_Us?= =?utf-8?Q?e?= for_each_tlb_inval() to
 calculate invalidation fences (rev3)
Message-ID: <20251119152654.GX3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251118201439.3688178-2-matthew.d.roper@intel.com>
 <176354012577.8491.12976114629667420689@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176354012577.8491.12976114629667420689@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f94cfd-0469-4de4-6fc5-08de27801321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eEMMU2opVUeJYEI5Z3X37SShHOJysigg7GU/XcH8kwtCqjDCHspS1pW15unP?=
 =?us-ascii?Q?T2e47peq3QbYHd/0WRuql9CyCAjOD1gCpm381JNJlNYrHyFqGihOn1Bos+1/?=
 =?us-ascii?Q?cTefQnFFgUS9vmp9MGPIptZsDgQZB3ntkgzeYnTv6sma0e+Z0qGfaPbRPb6o?=
 =?us-ascii?Q?dnvV5iEYFZBRAETNBx1mhUch4u2dP55/Cgr1RZhLd3locpRO7cAd894NRGqH?=
 =?us-ascii?Q?BsAfEH7hmAwRGL1yLnKv4p66ys9q8NO59t6FZf4Yu9WoF4ioRltZ/Rk2PUB4?=
 =?us-ascii?Q?lqwE8HBjpi4m6MBOusvqTV2rzanXZ3ttCRrjq1cD1gSfQsuo5gQWuO9ZOJsN?=
 =?us-ascii?Q?rOujPlba5JlRla2vqn8N1ZwIOu/4Vs7NWemlQaR/JYIOd5ihgskq4pg99Sjn?=
 =?us-ascii?Q?HHJ7+xcZ1lYL5BGSbSvyoXLKugaCNxIh96F7tGdHKkz9GqS35N7veIxzBjvI?=
 =?us-ascii?Q?+F7cbGI0Txmp4IBuDjOGoKHp6WOwzxnCbEW+KLVK5Op4BXfezRwLEgXWlORZ?=
 =?us-ascii?Q?8u/kYTtZeDxJgVyfApss1f8gjxiaUqxzZopC71NpHyxKD9MTCVJeD7L6P4Wg?=
 =?us-ascii?Q?knY2zHcegn9OfY/sMgq/Cu2HLHqu5K2eDol6bz30OPSxlbk5LH3n8ToMkSOu?=
 =?us-ascii?Q?C4x+NoE4+iCrS9XLid/DMcuNacTD1epIwH3DpzwLqr0GvmumTIi3Rf/7kllp?=
 =?us-ascii?Q?neDmFaMyE/1f0zXw7w1iGiYMdwAmGBkiS1O0ex8zdyCbe3tAwF4RNquuDJSq?=
 =?us-ascii?Q?FJZSVhkHOxfI/uSc8YwuTh0KQhSzVYqNsFu0vj8VlO0I9zXFKjMsLcgnR4tF?=
 =?us-ascii?Q?oGpjtd4kIyNxz4LJQn0DkBe44x51/sBBTwxYTTMAC3yWVg+9ZwQ+9qRYbu30?=
 =?us-ascii?Q?MLMo9dj3fBVc3Jouopmo1s1HpLL7WQgOCeSfKz3InM1OMFmrnFne6cmk+nvZ?=
 =?us-ascii?Q?HeXbuU3W1lWeaVRl5VMDkzvviNFargxJKexKXnRL67y+tXiZ8LBK+aRIo9tC?=
 =?us-ascii?Q?fuYFLSIDLDKMZ8TS+ytICDVDkon5DZlW9MM+TCMHHe8loTEEMmpxxUMJbHgq?=
 =?us-ascii?Q?SUiQ+fsjWT46Z0sMMFoG5wfbylA9gqoeK/jozmZHBi2Gs9pC27GL7Sb3cobi?=
 =?us-ascii?Q?LTbrRR8ezh7xOGemt3c8eBY9rYeYzBX+CqxrYmGHff/ge+hJd16adKuK86e3?=
 =?us-ascii?Q?Cx2XVoTPN/bvh9rxTovHsMukgELuN3jJgswKC3SvXU7Gr2ZP8s3lMmP9mL8j?=
 =?us-ascii?Q?MXxfMBaWs9KK9rBlPir7bqXwLzzdsdDg8fORRgby/13uRmkkYxVBOKSQ4uWZ?=
 =?us-ascii?Q?b/d7l1trfSLSWvz2ztV9lcDOdPh7841CST5oLugkSk3VswwU+jkToqNMne5d?=
 =?us-ascii?Q?CJIJ7221gPf1WbRd+nKS3/w6sK6Lqaa6w0QWd94rzgwqVSA2Jg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5GsL8S+G/bjU14glLUVLFOUCBLKA0JvUXdnYZGA0a9LQqD1LURi2owpuHW0L?=
 =?us-ascii?Q?9PELc+T1c3QU5Gyfd1S2fPgBzSbYdaTKy5bYY2au2KGS2BXlsdWbQ6QEibP0?=
 =?us-ascii?Q?2fhNN3WyO/ZNmtrACd9mg1PaBHPtBqaOnmqQdT7Jes4Y7n0uVf9+OiVMP9ID?=
 =?us-ascii?Q?FdZohSQNF9DrZAMQ4kOR5SHKEDLM98VvBecAdRpFfUBhJpduYMyc2xtDIMCt?=
 =?us-ascii?Q?nTe07JbuTd5fHG+6BTEjnTHwVR+UPHmbmzpfdIB123sZ3wTRwR6ekHwhJnAO?=
 =?us-ascii?Q?mbgSy524iX1VOW6IvRjgtksaiBodzOE3eeYnybLsdantOrpCfb4Uh2CWBLe1?=
 =?us-ascii?Q?h9SJGk15wjCzBrFcC6ofIo9dcvfzid2YruxG/P5JWYP8aI51Jii4xkdHJuBd?=
 =?us-ascii?Q?wM1BJV8leEgb41oIqwYBbZRNnrk25s7iVZQpejtn2oDkS8LTG1e99HeSqX1j?=
 =?us-ascii?Q?rhnL/f701db7lIydqx0J7VqdQDuX31KK4ucf1YEUWlLo+mJjz6tDxWPgzVK6?=
 =?us-ascii?Q?NblRyaMuLJuSp0QJH32mI0esHXJhSZYtAv60SZkIF0+q9hhb0DEiLnUlcJxD?=
 =?us-ascii?Q?TdcEjiKlMqdFH2YNLRpy8psI2jVNzVkaPPx/eVzxXeSfWq4yB6c1MQfz2Hii?=
 =?us-ascii?Q?ZHcHp7Mfbo7nO+8jRFgcTsyCuKAq4EXPIKnws2P8iE17C1Ca3FSF2ytGc1oM?=
 =?us-ascii?Q?PQfPkObJcw180ONfJLz5BUxe+fuyRpJPm4ndr7wl5/7xrdHk5T6UJFjRrRVw?=
 =?us-ascii?Q?049IkQf3sXYS4O85O9+4twm9s106CPTZwwKlbvLEMXNkUClOuwdnJrQHSVJ8?=
 =?us-ascii?Q?XgY2cDu2x8LgV5gBf3VS9UR4FqzX3NwwAHOoGwhdHN9yIbHI+tzE2oVq6GA8?=
 =?us-ascii?Q?hDWs5gkWAd2XvHG1kJTO4ma1x61dYisEDs1z/HVWLprYsV8HLQScmvTTq4eD?=
 =?us-ascii?Q?apgeCtOIj50O6jGdq9H1uhOwiaJw98P8jfNfQErwa8UNqVd/GVRlVA4SJ5wl?=
 =?us-ascii?Q?w/zWfOHa6GIslL4cVKZm8ZguXhO1d5pGCF7nF5jMTSxlxq6VVnASwRAqUajw?=
 =?us-ascii?Q?7g4PGlAigQgJ0IjDdSebnWcWPLJnpTV8h2EJ7QTUWjiKe3MdVjuVe5TNrsTY?=
 =?us-ascii?Q?TC5EdriFATdkEGkCZv6Eg3R0012tD1PbH/VSAL2ti858qpQ0TD+91+omclNF?=
 =?us-ascii?Q?1avyNOc4H4C4BsneaBWYKGAvaip/E8pyk3rgWSOl5lc/l5vy3+3/dyydwaQV?=
 =?us-ascii?Q?nTndrUKZ9GQo96tKOornvFdgAtH2AlWNYO0GlQzvHrAOrOjCZiUHLfNbaaHZ?=
 =?us-ascii?Q?SG92QUUr2xhII0EIHZX8VW9UUxu0DIPJJze0mrc3hGiNJs76Ydji0WIMjKoi?=
 =?us-ascii?Q?K7ydWqUiZWrUV1RPswuJKtjOt8IluSz3twvCxZ9a+nOdxglL5Vhr+mpxclnB?=
 =?us-ascii?Q?Py0quKAarMpOoZMQ+jd+4VuzEgjrwVAZ+hfXPmmpOcgWAF7/kjAwSYW5egAj?=
 =?us-ascii?Q?2HqsbcTFBLxdzHfNzUrLRbFWGuVOSMt+oBp41Mqtu+ao0f/4zTSlD5gFKu2I?=
 =?us-ascii?Q?vHcMp+W8Fis/N4tpNc8qgRrNCj0is11BGIqizrJMavEkl4Z9fbODdL+4msfF?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f94cfd-0469-4de4-6fc5-08de27801321
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 15:26:56.6702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bN/ZHiGyVSQC0dqKInZ6O33Rw2VL0qyXVHwBbzsKZEVEgV4ng8Dbi6y+m9ci6/OCsfaEUll5LAYsFXisWddJaI7/+r3az/wAscPEqEs0B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
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

On Wed, Nov 19, 2025 at 08:15:25AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/vm: Use for_each_tlb_inval() to calculate invalidation fences (rev3)
> URL   : https://patchwork.freedesktop.org/series/157743/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4124-b603326a067916accf680fd623f4fc3c22bba487_FULL -> xe-pw-157743v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks MattB for the review.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157743v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#6054])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2370])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316]) +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#316])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-270.html
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#610])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1428])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4543]) +9 other tests dmesg-fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124]) +9 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#607])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +4 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2314] / [Intel XE#2894])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2191])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#367])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#367])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#367]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +97 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +10 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +11 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
>     - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#6014])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252]) +8 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#373]) +7 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mode-timings.html
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-7/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#373]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178]) +1 other test fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#308])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320]) +4 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1424]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2321])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][47] -> [DMESG-WARN][48] ([Intel XE#5354])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][49] ([Intel XE#5354])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#309]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2291]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#309]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>     - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2291]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#323])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2286])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1508])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#1340])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#3009])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@kms_dp_aux_dev.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#4354])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4422])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4422])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1137])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1135])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-8/igt@kms_feature_discovery@psr1.html
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2374])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@kms_feature_discovery@psr1.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1135])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-466/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1421]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-8/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2316]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#310]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2316]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
>     - shard-adlp:         [PASS][77] -> [DMESG-WARN][78] ([Intel XE#4543]) +17 other tests dmesg-warn
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a6:
>     - shard-dg2-set2:     [PASS][79] -> [INCOMPLETE][80] ([Intel XE#2049] / [Intel XE#2597])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a6.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [PASS][81] -> [DMESG-WARN][82] ([Intel XE#2953] / [Intel XE#4173]) +9 other tests dmesg-warn
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1397]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][86] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#455]) +15 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [PASS][89] -> [DMESG-FAIL][90] ([Intel XE#4543] / [Intel XE#4921]) +3 other tests dmesg-fail
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#651]) +21 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2311]) +14 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2312]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4141]) +9 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][95] ([Intel XE#4543])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#656]) +9 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2352])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#651]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#651])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +9 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#6312])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#653]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#653]) +21 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2313]) +23 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#455])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#2925] / [Intel XE#3012])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-1/igt@kms_joiner@basic-force-big-joiner.html
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#3012])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2925])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-433/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#5624])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#5624])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-433/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4359])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#4596])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#5020])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-432/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#870])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#870])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
>     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1406] / [Intel XE#2893])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-primary-render:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1406])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-1/igt@kms_psr@fbc-pr-primary-render.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +12 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-4/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-lnl:          [PASS][127] -> [SKIP][128] ([Intel XE#1406] / [Intel XE#4692])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#3414] / [Intel XE#3904])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2413])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_sharpness_filter@filter-scaler-downscale:
>     - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#6503]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#330])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2168]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-464/igt@kms_vrr@lobf.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1123])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2504])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eu_stall@blocking-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#5626])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-432/igt@xe_eu_stall@blocking-read.html
> 
>   * igt@xe_eudebug@basic-exec-queues-enable:
>     - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#4837] / [Intel XE#5565]) +3 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@xe_eudebug@basic-exec-queues-enable.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr-faultable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#4837]) +9 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> 
>   * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
>     - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#4837]) +7 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#4837]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-5/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_evict@evict-beng-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#688]) +2 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-8/igt@xe_evict@evict-beng-threads-small.html
>     - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#261])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-9/igt@xe_evict@evict-beng-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][143] -> [INCOMPLETE][144] ([Intel XE#6321] / [Intel XE#6606]) +1 other test incomplete
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-2/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#688])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1392] / [Intel XE#5575]) +2 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-rebind.html
>     - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2322]) +4 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html
>     - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1392]) +2 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-1/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#288]) +23 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#5007])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html
> 
>   * igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#4943]) +13 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][154] -> [FAIL][155] ([Intel XE#5625])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#4915]) +259 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-prefetch-shared.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck:
>     - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#4915]) +70 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4943]) +3 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2229])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     ([PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184]) -> ([PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [SKIP][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210]) ([Intel XE#378])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-433/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-435/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-436/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-433/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-433/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-435/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-435/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-432/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-466/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-433/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-432/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-432/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-435/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-433/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-432/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-433/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-464/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-436/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-466/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-466/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-466/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-464/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-464/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-435/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-435/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#6032])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-433/igt@xe_oa@buffer-size.html
>     - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#6032])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-2/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@non-zero-reason:
>     - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#3573])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@xe_oa@non-zero-reason.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#3573]) +4 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2284]) +1 other test skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [PASS][216] -> [DMESG-WARN][217] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#584])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-8/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
>     - shard-lnl:          [PASS][220] -> [FAIL][221] ([Intel XE#6251])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#4733]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
>     - shard-bmg:          NOTRUN -> [SKIP][223] ([Intel XE#4733]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#944]) +2 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#944])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#4130]) +2 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#4130])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
>     - shard-bmg:          [PASS][228] -> [FAIL][229] ([Intel XE#5937]) +2 other tests fail
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-1/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          [PASS][230] -> [FAIL][231] ([Intel XE#6569])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][232] ([Intel XE#3908]) -> [PASS][233] +1 other test pass
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][234] ([Intel XE#4543]) -> [PASS][235] +3 other tests pass
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [SKIP][236] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][237]
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_color@ctm-blue-to-red:
>     - shard-adlp:         [DMESG-WARN][238] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][239] +8 other tests pass
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-6/igt@kms_color@ctm-blue-to-red.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-2/igt@kms_color@ctm-blue-to-red.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][240] ([Intel XE#4633]) -> [PASS][241]
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-bmg:          [SKIP][242] ([Intel XE#2316]) -> [PASS][243] +1 other test pass
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][244] ([Intel XE#4543]) -> [PASS][245] +3 other tests pass
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-1/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-8/igt@kms_flip@flip-vs-modeset-vs-hang@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [INCOMPLETE][246] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][247] +1 other test pass
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][248] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][249] +1 other test pass
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [FAIL][250] ([Intel XE#718]) -> [PASS][251]
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms:
>     - shard-adlp:         [ABORT][252] ([Intel XE#5545]) -> [PASS][253]
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@kms_pm_rpm@universal-planes-dpms.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-9/igt@kms_pm_rpm@universal-planes-dpms.html
> 
>   * {igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12}:
>     - shard-lnl:          [DMESG-WARN][254] ([Intel XE#4537]) -> [PASS][255] +1 other test pass
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-1/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-1/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html
> 
>   * igt@xe_exec_balancer@once-cm-parallel-basic:
>     - shard-adlp:         [FAIL][256] ([Intel XE#5625]) -> [PASS][257]
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec_balancer@once-cm-parallel-basic.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-1/igt@xe_exec_balancer@once-cm-parallel-basic.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
>     - shard-adlp:         [DMESG-FAIL][258] ([Intel XE#3876]) -> [PASS][259]
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init:
>     - shard-bmg:          [DMESG-WARN][260] -> [PASS][261]
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-adlp:         [DMESG-WARN][262] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][263]
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm_residency@idle-residency:
>     - shard-dg2-set2:     [FAIL][264] ([Intel XE#6362]) -> [PASS][265] +1 other test pass
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-464/igt@xe_pm_residency@idle-residency.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-463/igt@xe_pm_residency@idle-residency.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
>     - shard-lnl:          [FAIL][266] ([Intel XE#6251]) -> [PASS][267]
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          [FAIL][268] ([Intel XE#6569]) -> [PASS][269]
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
>     - shard-adlp:         [DMESG-FAIL][270] ([Intel XE#3868] / [Intel XE#5213]) -> [PASS][271] +1 other test pass
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-bmg:          [DMESG-WARN][272] ([Intel XE#6627]) -> [PASS][273]
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@xe_survivability@runtime-survivability.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-7/igt@xe_survivability@runtime-survivability.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [FAIL][274] ([Intel XE#1178]) -> [SKIP][275] ([Intel XE#2341]) +1 other test skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@kms_content_protection@srm.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [FAIL][276] ([Intel XE#1188]) -> [SKIP][277] ([Intel XE#2341])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@kms_content_protection@uevent.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][278] ([Intel XE#2311]) -> [SKIP][279] ([Intel XE#2312]) +9 other tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][280] ([Intel XE#4141]) -> [SKIP][281] ([Intel XE#2312]) +6 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][282] ([Intel XE#2312]) -> [SKIP][283] ([Intel XE#4141]) +2 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][284] ([Intel XE#2312]) -> [SKIP][285] ([Intel XE#2311]) +6 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][286] ([Intel XE#2312]) -> [SKIP][287] ([Intel XE#2313]) +8 other tests skip
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][288] ([Intel XE#2313]) -> [SKIP][289] ([Intel XE#2312]) +12 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][290] ([Intel XE#2426]) -> [SKIP][291] ([Intel XE#2509])
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2-set2:     [SKIP][292] ([Intel XE#362]) -> [SKIP][293] ([Intel XE#1500])
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     [INCOMPLETE][294] ([Intel XE#2594]) -> [SKIP][295] ([Intel XE#288])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][296] ([Intel XE#3868]) -> [DMESG-WARN][297] ([Intel XE#3868])
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
>   [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606
>   [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8631 -> IGT_8632
>   * Linux: xe-4124-b603326a067916accf680fd623f4fc3c22bba487 -> xe-pw-157743v3
> 
>   IGT_8631: 8631
>   IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4124-b603326a067916accf680fd623f4fc3c22bba487: b603326a067916accf680fd623f4fc3c22bba487
>   xe-pw-157743v3: 157743v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157743v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
