Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCA2C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 05:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7195210E094;
	Thu,  5 Jun 2025 05:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4ei6yel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FE210E094
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 05:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749100537; x=1780636537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kw9KgvmA3ugHYgFOVhcY7r8zMIFalherbSgowRAwr2w=;
 b=K4ei6yelQKITFbe0KgkOeKvwkK0JPl2uSoTz96+ui8TZycJSDNqcFEne
 ZfO9+dGANWiIyPpm+rACzSxXiwK9/pt595RLrcqnLZ8HgsUWSqgyb86Av
 ovHLyee3fAbwPmdvWa1oXrUeqmf2c6eABqG95d29snkO0rGOU2KYGwlrr
 wal3cIaoEh0k5dl8BM0BbdwYW7FwsWY1AxgnlBOlBInK26CIzT/Cmi/nz
 A5YreiknGrYLzWcRWFGT/a/t+Qk20ANTIhqdkKlXvBP5fVpSylIv2CcDI
 WgZK0LV7I/l7SGensmOBiGTuw7jutXW02eU5I/aiwDHyfypCgkrO4rwRg Q==;
X-CSE-ConnectionGUID: pCFqc7SKTdCjG1Vv8alipQ==
X-CSE-MsgGUID: AjXIn7OVQqu/Qd/sFEk0Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="38834175"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="38834175"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 22:15:35 -0700
X-CSE-ConnectionGUID: dE8SmTo7SnC9TEtPzqf1mQ==
X-CSE-MsgGUID: ASwEn3jVSha27o76IXSxaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="150550421"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 22:15:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 22:15:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 22:15:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.89)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 22:15:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHv2o+0fctCMCyVPBa/ShBAHgF7/xC3wT/r/Ch01up5amAyIUHoNLuR5hG4TM2SW53SCBdCuYKMU5mpwIoZeGaJRap6OjOJKevRacKNP0mC25KzThnh1D9IwOzd9dwiJzM2ALg1+7YfjDmvnSTukUQLtyt6RZ0yZ6s01UDs4LABb/kCyrHCLqWdjjRFXzzTbO6N8fSQq9l0WHCWSDCnp9lbPNjWDG8hyC261g+CS6WLuYp0Q6VUIfSsp1lAqWNL3ILLMlAmY9a3jgZE8dLYlb+BHbWubdKOPHqdtED5UCzJ6b32wznpjhqr34SnROc8/oztkfhu7eHpi/Ra8sOCkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+du8TU6JftN2RB5P3QwkHYAYJNb2DBEtFUO+ak4TAtA=;
 b=adnZaA7YBP86JvR6peHC/32nR5JP8XFb9JkyObFVxLlsv0IxRyYpMOSn2VoVVMFkgmk0QfgNoxquAqGkISusyFGXG54mXhP12lcDgbDM7p6Aolg6VvphpsqEwNJvYqyHsFfeqyph6ueHbh/qpWru5M0IMxaDUPn4z/SJi6a+4mWJpdIf5vkyaC/zzSQ/R3Y6ZPQ/BGVUQbqVZtEi6qroOAx48YE4v3m1BWiwxW2w8HL4Nca21BJczveE78lFZZaIji8zc+epoFUM0ipUCldvPhetN4vBL2eQBCuMHasjQqqQBai+tVAne4unhLekSUvLjpcT7A81gkn6Z2Rdi/NKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 05:15:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 05:15:25 +0000
Date: Thu, 5 Jun 2025 00:15:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/lrc: Use a temporary buffer for WA BB
Message-ID: <l6j2x36qlznpzqrvepqqt3ykzljyeh4yb5o5eu4cwaj2bwiz3x@ggozln3ba3hv>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
 <20250604-wa-bb-fix-v1-1-0dfc5dafcef0@intel.com>
 <20250605000249.GH6239@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250605000249.GH6239@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bd46f4-6bb9-4738-c103-08dda3effa52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c8J/fYPhAwX0/Xz5b3d43ttQEu8c7bkMUNYWMzi3GbBHm+CRG3AEXh+2MGTz?=
 =?us-ascii?Q?WZpKP8f14kIqZJ8Wl7n+ZYiSYHNs/uqKQYtQHTD9YalMTGGSg2ucsj+K0gDi?=
 =?us-ascii?Q?z8K+8g6ukJlBmLgPWn786l8sEOOrBRALPRTV3tBnxyMe6Z6yBJQcAd4oc7XW?=
 =?us-ascii?Q?oGYAtFFM+U6+11bknaYFbAr5wkbvIxNVgyxdHGNPawW8+I7CLqjuHobEw2If?=
 =?us-ascii?Q?wrw6rGDTtHqMTpEqWvTkHDp3QckR8b064WTJHLTQ54uwzsurYBhAge6ibtQo?=
 =?us-ascii?Q?ZLpDNbL7CpWMxaZ1+HadI2bELoNwtjk513MOPre+oKIicS4ARlmj2qKIOKMF?=
 =?us-ascii?Q?EaUAo4MN5MG1WGdXvIyJm7US4oJR3OUdNYNbnyC18XkLXQ9bX0r3DcPgUoSm?=
 =?us-ascii?Q?BPHYd2bHZ5nm5gEglsMdzpDLOxaoai2rE9YQvJusLeRZnEfZZ9qeF9pmfZDc?=
 =?us-ascii?Q?uNCnr4TXJslxXAjVKYx3v47XXIcBLSt9gpu4I+4cJJuYq9+FDQaPH+s6o6J7?=
 =?us-ascii?Q?INSNkXZWw28O8Q+aLRoqx8zVG1u18NSCLEu3hKKodFC6LJKYaliJTmqo+Uqy?=
 =?us-ascii?Q?z3hQJc0cbVFy/9b67AV8l0NFe5CMTSgzqoeyr+3jUAquCqn9pEYRLOodOrin?=
 =?us-ascii?Q?4cnSDuz+k8D4CrLltZ2sm2u/CtLB69gjVU/l9Sjk/uxBnhHF+KrbRmDCcZBB?=
 =?us-ascii?Q?Axtyl28xGOIITJMhBoJ9H6H+Jp+pCBnaLfJ2+eBVQckgHIUdkMZgHsqEp2tU?=
 =?us-ascii?Q?5qWTv6PI1dOeJnOiVfRckQDuLQJgbkaAH8sbGo7ID2GjWybKoxnkWU5VPMmW?=
 =?us-ascii?Q?uSJ4TS6LSO4S+sP54sty+Kx1R/THHJDrnag5PxCG3NjPJ0cdGgrLvcjqCDQl?=
 =?us-ascii?Q?jPLvnEsMa1BaEowhhwAfjgAWrNciVyxynxmuj49zGrwmKuRHPlvjTL3wNxf/?=
 =?us-ascii?Q?cTmN1z+sE+iKMEeF26dVtlPeWVddYqjZGMWajjUFs5UbieUVOQx/NhPrhxUM?=
 =?us-ascii?Q?sMtWHlxuvDVFrmpYUdvcKt4TLwfls9fWhotFLjOvk9FuEwZhmKjQYwV+0FXs?=
 =?us-ascii?Q?JaMEwJzspolNKzlvyxO3dHtsCqU/H65cPB4E+CEPJUMG546vvVb73gEvpYwT?=
 =?us-ascii?Q?RvmSUwRVoZtrJ2mzGmgx86nOYvqj+dLXVZIOMpGDRo47gIeiUBukntO3WJSS?=
 =?us-ascii?Q?riVlhzxnJxj2DpwD8vO3Oc+egDxpqNFN4WcycdI8hd3D/SptMjfwmMAK9obI?=
 =?us-ascii?Q?sVrwJvqS8jcxYlm4rWWI0NLTHsHdnBPQ8t+Xjp6fpRXg//ynU7M6ibzpahUv?=
 =?us-ascii?Q?QPiEnJfpEcN4fc8YjX4EI+xxxHFXhSTD3NGaPXBeWplsqEAG40A+e9Bi4Vkx?=
 =?us-ascii?Q?kSCPmeUqlhaI1DDxjNvmMEtFdFpGm1rLV/2sLAAYV+h1fCFzEcJVqomXTsVW?=
 =?us-ascii?Q?mDG4Z6omKro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lt5DORAachr0F0HntMHXmBUA6NzPQ4evOOud0Wp+leszA9iwkm8+zK8WMSwc?=
 =?us-ascii?Q?aSELtfr8Fwxa3QWNt0H+DhBP+cKqIdikIIv7yMsRDrGhWt5Ymkiq1eoeOX1K?=
 =?us-ascii?Q?W4YtIbiKfleZhnRb9RcIhQDDD9leo+Tu/oRRrxh1KJyJ04UUm76ZV9HUbh8M?=
 =?us-ascii?Q?1apr01HPMY8WMzHVbgax7tt3v1miy+E6wsl9RfqMtiZ4Q6uPhA198HhSwe/H?=
 =?us-ascii?Q?z3eQ6uN1Gg0oWB0riy/gkOJINEWd7i1/ZHXgMPcBNbuMGgfUt4KegwKAyUVY?=
 =?us-ascii?Q?5FH4+BymRKFxyqCzzYqnuhje/teWkLIWS++c8MyF7sUa6BVLj9FTaHT7V8Gg?=
 =?us-ascii?Q?nN64GVOhwvCZbcHPy2T7vwc5IEThL62yyiK0e+sU4gRRBFpBk037HQ0sna0f?=
 =?us-ascii?Q?4HZ5kzTo5LXLSfayhkdUfo2q6BSxUOCxHI/xr7YDdrhrzalN8NJ9Y9jX68mB?=
 =?us-ascii?Q?xma1wKPbNJEq2/VEMby6cIUlBX/NVEQMEbWG5AwyJQ5jz7iin2GY5ib0KtOV?=
 =?us-ascii?Q?MaaeJ4AfzLl7t0wpdecs2TOQRNVhoXhAuh61ttRjhUtLnZGqQV/TIOe2T+7c?=
 =?us-ascii?Q?DpvtYxE4yaATZPUnMuLtAonnl7PHwyJO4qzOKTDSSfoqnVV3e3Zyoh7vPi//?=
 =?us-ascii?Q?MPLyHHCBM+wS8H/ryBnU9N1j5ziToaaPJ/ExXDHzzOV25Girc1PzXedzh/Op?=
 =?us-ascii?Q?RXexJzCU5nEm0hI7qAz1Yml9LMIm7VyEEU13A3IXbGEFTGHzK1KE4iUctj5r?=
 =?us-ascii?Q?CDHI5OoaaL6q1q1Oy48GroxYPFueOhO+3c65N0TVX5t2xu8iyGGX8FhUs0ti?=
 =?us-ascii?Q?7Db4DZ/AWzkMuWwZRPWWxr9J+0dAVn0nrEhKfTWWeNmpuR1wXMmJYrtL/hdn?=
 =?us-ascii?Q?1ezS05XgbOUCLi26YriqjPx0SB3+XIT9yUkesXjxpr7PSxJ/KufQ6VGsP9Cg?=
 =?us-ascii?Q?yqoz8nRpTLqSUOTMBrvEY0eZcuIhtyF9LfiiIq8KT64beylupmbYgamLyYKy?=
 =?us-ascii?Q?R26IvFLQwf82ZHGvcpzu3eztKSTeJQYFCCyGIiQdhKHCP9shic3i9blVcEI4?=
 =?us-ascii?Q?2ZtlkCczXhSi5niXY0baRWSxPhp5iOKkExpW1gg1UiGEgN1nbibaACxed2XY?=
 =?us-ascii?Q?g3vB+FkUiH0pYuzQzAtANbUo3UIaY6uN/YuWuJXCcW2rL7aaOykZ5efJvkBW?=
 =?us-ascii?Q?+UQj9+5Od5pJKZCRfi/sSDrfq4EFbMN6QI55YB1ViAjYIL6Z73ewGMh1kMRz?=
 =?us-ascii?Q?k7rkxH/d4keLQtF38SOJ5cGXUsRkPyeTn62zNJmLkbUpze2iVWaElt4jtN32?=
 =?us-ascii?Q?YexWMAlQsVdVg7fiE/uyjrcPk3xSxiWGV88RW7EkpPbbC2qekhQfDz3Uqq7T?=
 =?us-ascii?Q?O9TDm/2sCVBb6emmaMSV3ethXocpAB8P5r8jqu3fHxwRbsl4HFeJ3d8WPhLC?=
 =?us-ascii?Q?jV2ygLi5gHtuZZTkobfpduS9PNTUBIop1dOCgEadl+ENndabwHrcMBr+QElk?=
 =?us-ascii?Q?GX2tTzmsJLkY3g7UpLHp9MBwvDb6HUt3erbcXi+hlL44yQQU9nszNAQj+kpq?=
 =?us-ascii?Q?VY8vx9jw93hqpJTzBJW2K864MXwuyS8GZP0VzdzaydvfDk8lzmDDpsZNWhe6?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bd46f4-6bb9-4738-c103-08dda3effa52
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:15:25.0958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uu2+47x129vimaW4pUAepY8iCmnZMNBT2aqVhFJ/bOKrrKvDBJ+HcQPPCqQuJibLq5UYKMTiB/Hj8GNXYFrvl8mv2/2+69pNN8v0lp6rQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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

On Wed, Jun 04, 2025 at 05:02:49PM -0700, Matt Roper wrote:
>On Wed, Jun 04, 2025 at 08:03:05AM -0700, Lucas De Marchi wrote:
>> In case the BO is in iomem, we can't simply take the vaddr and write to
>> it. Instead, prepare a separate buffer that is later copied into io
>> memory. Right now it's just a few words that could be using
>> xe_map_write32(), but the intention is to grow the WA BB for other
>> uses.
>>
>> Fixes: 82b98cadb01f ("drm/xe: Add WA BB to capture active context utilization")
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 63d74e27f54cf..bf7c3981897de 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -941,11 +941,18 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>>   * store it in the PPHSWP.
>>   */
>>  #define CONTEXT_ACTIVE 1ULL
>> -static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>> +static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>  {
>> -	u32 *cmd;
>> +	u32 *cmd, *buf = NULL;
>>
>> -	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>> +	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
>> +		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
>
>I was originally worried about not zero'ing this buffer with kzalloc,
>but since we only copy the specific words that we write here into the
>real LRC, the garbage in the rest of the space shouldn't matter.
>
>size here is always 4k today; is it okay to be using kmalloc for a bunch
>of 4k allocations or should we be using kmem_cache or alloc_page for
>these?  I'm not sure what the allocation recommendations are these days
>for page-sized allocations.
>
>I'm also wondering if there's any way to avoid doing this independently
>for every context by using CURRENT_LRCA with either WPARID or MI_MATH to
>eliminate the ggtt offsets (i.e., the only parts of the batch that
>differ from one context to the next).  If the actual contents of the
>workaround batchbuffers are the same for every single context, then the
>allocation here is only needed once, and even the LRC's actual
>workaround batchbuffer could be pointer at a single global page rather
>than a per-context allocation inside the LRC.  That might be beyond the
>scope of this series though...

not sure about eliminating the ggtt offsets. What I thought about was to
eventually move the allocation much earlier as you suggest and re-use it
across multiples contexts. However I'd see this as an optimization for
future... right now there are 2 major goals:

1) Fix the bug of potentially using iomem as if it was system memory
2) Prepare the ground for additional WAs (see patches series from
Tvrtko)
3) Prepare the ground for the additional commands from configfs (see the
other patch series linked, which is buggy, but I have it fixed locally).
4) Re-use similar infra to also expose the indirect ptr for the same
things via configfs

Then later I think we can move this to a single buffer that is shared
accross contexts. We will need one per engine class.

Ack?

thanks
Lucas De Marchi

>
>
>Matt
>
>> +		if (!buf)
>> +			return -ENOMEM;
>> +		cmd = buf;
>> +	} else {
>> +		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>> +	}
>>
>>  	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>>  	*cmd++ = ENGINE_ID(0).addr;
>> @@ -966,9 +973,16 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>
>>  	*cmd++ = MI_BATCH_BUFFER_END;
>>
>> +	if (buf) {
>> +		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
>> +				 buf, (cmd - buf) * sizeof(*cmd));
>> +		kfree(buf);
>> +	}
>> +
>>  	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>>  			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>>
>> +	return 0;
>>  }
>>
>>  #define PVC_CTX_ASID		(0x2e + 1)
>> @@ -1125,7 +1139,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	map = __xe_lrc_start_seqno_map(lrc);
>>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>
>> -	xe_lrc_setup_utilization(lrc);
>> +	err = xe_lrc_setup_utilization(lrc);
>> +	if (err)
>> +		goto err_lrc_finish;
>>
>>  	return 0;
>>
>>
>> --
>> 2.49.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
