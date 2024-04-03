Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C9CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 14:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F658112B58;
	Wed,  3 Apr 2024 14:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdwR5UK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D007D112B50
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 14:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712153592; x=1743689592;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XLvnChdwVQpI18nMGNLnq391J4PGoAxfgV6Qm6YbwK4=;
 b=jdwR5UK2NosU1TkhvDf78w3sg5d9PKtb9bmRACt/KlqobP1Ccv+mtMtQ
 UTqAnwLii3LM10TKglRR3vKc3DoZZN5tW5pi8gcG2/vXrhoR4aGyL4n6e
 mU27a1VI3/ppq6c/749x23/hvkDkx86/TquSHtz06prMVYsB1A/6ZEtPY
 8hDwb5X9TatiEFHcB2eMrMjfzVsUzwFbHQTPGF3hMYGSqTugnWsJvyEZa
 tyEDQGgDm5k2V+UFqZGSHs5mK8VKwW3HWL3r+tP2EvcDwz486pG02ADZP
 uRcGnk5QG6Sye2LMVKj7SWUb1Lq2eYzcUOr49bY3PoczH3SdSIICdn4wM A==;
X-CSE-ConnectionGUID: EJlPPJagQ5i3X+KoZSKvQQ==
X-CSE-MsgGUID: +9GXB6cVRFeOmvG2IkvOoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11204483"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11204483"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 07:13:11 -0700
X-CSE-ConnectionGUID: PbiT0KEBSp2wwyTDCD4xAA==
X-CSE-MsgGUID: jKigHeZzSMiO8rcZEYbJ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18372495"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 07:13:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 07:13:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 07:13:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 07:13:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ohsdfki8ylQ1iphz6YS/OON/ru0WevZU7jdQnk29KdsetkfyYpWVpfRjU2z/yEcpiB9Nd2G7rO4S7OMPJEMus5R4dCqY3ZdAhSb/5qk7jmWoIJvakTo7nffKAdYrpMgUFUn2qKJQvwAwKsM7KF9CB3uCsTiP8BUaSRE1KYX7z/GTBKtXRu1NbjGSFtxHvIA8AFBjOmR9JfU/SXZe0vnoGXqYmF38QQjrr8oGw0RVGor9ncRxDmwCcsr34yEJ1RBGXAdFVxgVD1MQsOX8AyLfPduz8KCkFaFWxFAVubo/v1yohJ3tvsQkqnLdqd9YNeICdpxrc6GciSqmC//0Zx6uUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLvnChdwVQpI18nMGNLnq391J4PGoAxfgV6Qm6YbwK4=;
 b=JjAtkaIa3tQ67uWYaSOIZRcOxcdLrScRSgaqWvX4s20C4OYKYmZuUtrHVZ/Jx3EwcAdzt/cxV7KLNhgkaso7AzxI04uhPl0Ndl8q00RdrqtZ1hhTXSFEAaLzZI5xo2t0qZj9SSHwYqedusjJuXVBPSAN/ZpsZiTODxIi2PnH+wcLFsZeQmOMAq6BkhDoZrKLCF0jE3x/rqdEKFO7qhc6IBUDqYIgYTlEplZ0SgTAe4tvKk9+oTa7LZWimjYFHkFldLKOqsXHUanOWaKT+2W9loW23GX461EjAde0/3oOLCaIlXlMTWMfh6ktqu0v7Jly0cXMi1Nlqv1X07WXC64HDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Wed, 3 Apr
 2024 14:13:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 14:13:07 +0000
Date: Wed, 3 Apr 2024 09:13:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/xe: Use ordered wq for preempt fence waiting
Message-ID: <civ4n3amzkagpijase3snsncegqzmfkhecy2ywwsfwhy3kfd3i@2yrcj5pjppwp>
References: <20240401221913.139672-1-matthew.brost@intel.com>
 <20240401221913.139672-2-matthew.brost@intel.com>
 <nxkyv6jbed5rkgn5lwm3igcw73gqebdhwsxpqzgvgunyfj6mx4@h57khd3dee43>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <nxkyv6jbed5rkgn5lwm3igcw73gqebdhwsxpqzgvgunyfj6mx4@h57khd3dee43>
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6971:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LsCQkMdgv1JC+LlUMqE249T2SeeCb/Qze0ES0wfMNOI4ME4ZmLzjt9JvgLXjAy8trcTzxhsmFKBdtTTZ3ggxtgLHpQlrKb+nfQwVybIHn5pC9AlIv+Mllp1qnaWFhXXNDlk55ca2pYbvnvSQxUMbrkaPmX8Qu0aBYLOY59xeB9PJKUia+x2LJdfqbpviIjH8mDsckZZlxgydIDAUv1LWIhTOIUfjrWxJ4sSXoFilnCE3eZsnTHghqOsdNJC+Me1D76ZIf8+g1LhWEvoIxutxSN3F4RZ2JTQqVtkq4NJTlI4N2PpZUQUc654rq416pYOOH9aJ6obcJiEOIX3JXocXmDuaMyKK/ouL99FTuJQZ07vYzMKgiEe1dWT5R9ujsFXmEOt2A2ySdpynX9F9xP1mpuXfoRy+dT2xaoOeCHPFDX0d9u9xKhtjjkSkH6P9fG/3KPzrVSgaQE0wpgryYyYmn0TZoFRAi6hC8IdzDC1nyOQCnCDhRWr0NZqXayd+znw7m1uO3H/6xvrDnJFoKyNsnU2SbrLzpngDdVrt06Y6ewBmMYPFNQc02+Ynn0jkh5jPANJbpl4xK/dHL0rkcsncePBHLI8Avz/bl5NQft1d0eoTnClIJ20iMV5NmM1ngy2mvnLaiOIcyedqQ6Guni7gboR7v0Uua64AhPno+eJIHhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V6ywgd307+l8jjnxF6+VEyQJCI7V7YAP4PsUILjPyTzfyno8wMjwG84chwBw?=
 =?us-ascii?Q?znFzsvCqeBs5e7n4I0el0JDdod4VWnVETygjjTvntIg7qeOEsIYDJLjiLToB?=
 =?us-ascii?Q?hD4qZsk8QmR99QHQWelqHTO2kMWTjFOOaG7ptRXPeIWPEA2005TPWbxkFK9S?=
 =?us-ascii?Q?Dd5VFWjMmQquDYid7eEXDYvJaH5VCz/t8FnExHGzBV++gEYpFJP+F7uCwgtv?=
 =?us-ascii?Q?gXXTVv1seZQ3mjGKwD6EDmJT0DwQDuxqDnm3eP9euzO1hLvVCq0z+MlOZMUD?=
 =?us-ascii?Q?nx7Sm3j11sYKkidQoWPYzQ9fITbspWd4HHGid7v8JeAQjKXrW4+RP0t4udQu?=
 =?us-ascii?Q?KO177kX6kqkLOHR4jkJFpw85CuO3NLlTi1O+rqh/f4MOg3fJzKB82QIQap2a?=
 =?us-ascii?Q?i2Yy3FlQqdrNZndSyqVuA7sLOhpbDektEFeCduK0F6JH6yLAv5s2Faeb0QXo?=
 =?us-ascii?Q?jDme4yyHuqKeDtrWORBoNT8OizQ2xd0naGIJA3bCQli/E6SnGYh+5IDJSKem?=
 =?us-ascii?Q?edc11RDHYkd0zdQ4G1hLnm+GBy8KWhE+KEdgF98k0wNeqZUClXJmGitIWbDF?=
 =?us-ascii?Q?5enFL5HnmCsEkHMqFCd5HGqoLsCKR/KFaREKQaBqxiHjXE9oFpEmucDzvizj?=
 =?us-ascii?Q?yIWXufQ2rafe6gJYXiNRxJxZe5ELY3CJxvPpI+Fc6fOQS8+ueFbhCyD2neWT?=
 =?us-ascii?Q?MOdYUuLNJbWPXmRDc4USSusE4tAh1r0zGbPi0V9lyc2fRQQrSglavxPYOAe7?=
 =?us-ascii?Q?jNI+bGJKll2ERp/92sJn7Mb5wMfRMyvGnePDzS15bEBaOetD4UXN4Ks2yBC5?=
 =?us-ascii?Q?RcAVNNTvFAlW+YSVqwv/IJZTaRx9PiIgZFyeAVCKhXRzI8hWpTgYydp/K44T?=
 =?us-ascii?Q?TpcPndf1GJXRwMkYj04wHUcy3nTXAls5CIYXl5+DHpaXo5CZs731isAZPYRh?=
 =?us-ascii?Q?1vZVhOvkuOIRqkvFwzlc1FbzbmsIOIBdTYO2zIt2cpKUIJD2agkS4ScdBKAv?=
 =?us-ascii?Q?5F5GSj/JDVu0/ZpoB63odOc6kHDu0tIWukRuIVaVkKBxZBlFmZt0OuGL4c8l?=
 =?us-ascii?Q?vpZVuMvWoi1/79rpBtsddlSzpJdqLccQ9Iz6DZFuBz8LoFghVnjdW8PqQSaN?=
 =?us-ascii?Q?NhThEy2beMxruxxwHR+9kqeKHqaUgT2tH2iwoGFW7u9VdKNT+spjLXWAA7gS?=
 =?us-ascii?Q?PfCoUks9Q7xUDkpE4kXaxegXnpcJr6rQkQrXoyrUrqbrJSfJKTijg2F0NQIA?=
 =?us-ascii?Q?j8roKF4tXTlXLLhLJg3MSOSTM7UaXCPbsrGlm0DamsBcxviRvHv6v8v7yIfR?=
 =?us-ascii?Q?zxSD6cG+ErvvYavfd1PpTEpfEUt10Bvht3Oia1QliOuRlLYihHmXwKY8ZSiB?=
 =?us-ascii?Q?da89ix49ktsNBPpbUe7EUb/lqXo9chy8Hvt/59VvbnbBny8GqQTwIBh29+tV?=
 =?us-ascii?Q?EwC4fFqiBbCsDMDPvJXL2PUgUJeqI80gr1pe0q+grqQgRAu6PFRFanxlbBjM?=
 =?us-ascii?Q?L6iwusJ3nx/uYBoW1dQ79D00982Foy9UvsI3H+XiqxGA3VspCy5wqfPaLGhp?=
 =?us-ascii?Q?IqlYAIhd6+DcBvLtFte6BYpoin35h2+2nPg3Fn+hEH43o+WyEc7BaSTZCzJ2?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1c251e-a0f0-4047-fdb9-08dc53e82f24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 14:13:07.0278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jQUlOuy5HXjTxy2D6Fm1qBY3l26pzMMgvtGSfkAxXi6xYX5FIm8v7K5nUUzbYRf8QxuqI12kTDuZJCByxhrcDJqR6gfD1Az9NSgKergg6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6971
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

On Tue, Apr 02, 2024 at 12:14:55AM -0500, Lucas De Marchi wrote:
>On Mon, Apr 01, 2024 at 03:19:11PM -0700, Matthew Brost wrote:
>>Preempt fences can sleep waiting for an exec queue suspend operation to
>>complete. If the system_unbound_wq is used for waiting and the number of
>>waiters exceeds max_active this will result in other users of the
>>system_unbound_wq getting starved. Use a device private work queue for
>>preempt fences to avoid starvation of the system_unbound_wq.
>>
>>Even though suspend operations can complete out-of-order, all suspend
>>operations within a VM need to complete before the preempt rebind worker
>>can start. With that, use a device private ordered wq for preempt fence
>>waiting.
>>
>>v2:
>>- Add comment about cleanup on failure (Matt R)
>>- Update commit message (Lucas)
>>
>>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I went ahead and pushed this one so we can queue it for drm-xe-fixes.

thanks
Lucas De Marchi

>
>thanks
>Lucas De Marchi
