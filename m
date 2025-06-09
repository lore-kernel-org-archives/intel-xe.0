Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187C5C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 21:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B5010E1A6;
	Mon,  9 Jun 2025 21:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTobUwcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7958310E1A6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 21:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749504459; x=1781040459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MZn4pRHuUVYCYyCF8HMtnIHzWm040IwrbMJF8XwtaJA=;
 b=HTobUwcWIt+6AG8vQ6rCvAss6c6O0yq1hF6aXLRK3kNU1iaIaWkmyLyq
 p6S6KFW5RWoohwuO+TagPOTWVlluNGnH/cnaiRCAqOSR26Qbhl8NxnJpf
 mfuI9CC8x5J5dIrAM2JL9qg41TI699vjh5cNXOlFX3Mo+iM/SZ0PqxrMV
 9DkcrIWIJu6gke+tLfu2KakHSxks30B2FP5pnjHQ0ycQOcqB6R9/b+sKi
 FknvZptwkU6gs0QsS/8Iiex0t6GIJ+uZmADNvhCrlZ+jKnAV8WEZh3E+L
 nXHIoGEMGPUwL6hs+C/FARVW1xs3A2p3sTtB16uhki326rqqQPZh6e9sM g==;
X-CSE-ConnectionGUID: 9Z6bmTZDTK2oVNQldZ2x1A==
X-CSE-MsgGUID: Mde4UTnRR3GRD0eteHiqqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55401236"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="55401236"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:27:39 -0700
X-CSE-ConnectionGUID: kEBkzJxFTfK27yfsNyR3Wg==
X-CSE-MsgGUID: vZLZWrbeQ62sWppYzlIIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="177538276"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:27:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:27:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 14:27:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oqvhp0vOjZwOx2Ys8tu7XG+SDAmSWB/SP71+JWns0ELE1hwPbcFSBf0UtYzLLeESXAh1bkUclkUYdG/jNuTZieoiZq107haZ0Hjrpw3vJmae9Sz0DXeULT0RRm9j/H0eVsV/ioTblKJ10Ifim2ikeUixOR2iPOhDYnkctIyvK1bolvVcDy8Zp96Yc2brMRCaPwaS2qVqQDrXLIBnxi3x0b3VID/wCT9usfrJtP8X0uUYkCuVN9ZBzyI2PC1OPx3bjnkdaXcLdGtWcvAiWxN9sYg6T7YLdad0149aKHtJS+m7aFbrXPqqhFhzrQN3QFvY6Qk2xomLMU8xiyH/nQMGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ui7exuWaJv1kkIPNB1JEbsx+RQPxsvNhEjOFir9A6HI=;
 b=BXWqvCeIoYhl1tzgWCgERYfaz7KHK9HvsxS7adIgZyCR1K7PiEOzLnUOeZwxzFatmEwQDGysjz6pT6ve8Pbre22s2aBXEjxgFNNFGgqEHTzEZ/gVA/o1ugapgWyoLDy9iId+Ww+f5IBMy29fxhg4gl98/GxP99dCEe7Hi7mdn0MvlLOB3Y7nLab6NNk3UBrZ9uf7zLexaMZpSrIDw3jy6AdX/UraU1y1uu/gWoZmZGYt3ZMr3WSEG4JgFUDvl3cjo2RWidCYmifa3y9hlrcyNOtKXjuzvBt5fj+hfDi7ibiCxdu/7LUcLnVqq/p5XjZGAvOGmWo6K4e6QKZZwibKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 21:27:34 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 21:27:34 +0000
Date: Mon, 9 Jun 2025 14:27:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Drop unnecessary include from xe_tile.h
Message-ID: <20250609212731.GO5080@mdroper-desk1.amr.corp.intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
 <20250603202826.681-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603202826.681-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:180::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7e2f50-48aa-41d4-a4f4-08dda79c72f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UNT1GCF++W1ZmsBcX0ZWrtXvSsEAoXKbQFBb8gj26CUq2cCyWMWT18ehnkpD?=
 =?us-ascii?Q?Vw3M9+eSmMoUDA9Dy+f15loQEFU8Ev+5e0+C9tdYr8O1mZVehNArGU6Gftq0?=
 =?us-ascii?Q?I7PEGKRoG6pkIc4m97o1Lt14MVP9IGKBXihzBgc0EHV2kkT54iJdMVO27vzU?=
 =?us-ascii?Q?vnZY90g/JMkQPh6IMLdg46CZV+qkKTBrntgHJJYNuYfcHKe9X3bfQHM020T8?=
 =?us-ascii?Q?XQR4uelMmKWpRe3sX3jxiwPOcah4iUiTWC85vsczvzgjmSVhjxUZ7y5RX60Q?=
 =?us-ascii?Q?gauswXajLicFuxkEL9FImo1ZJKc4ftmSg58m+gt+PT8abIRuVhjcw5N2UNH0?=
 =?us-ascii?Q?KGyqRolnTAdteYNLU0Gg69L7JHBpPAAOU060lJUwhsvziZdM2Z9M0Nief5XA?=
 =?us-ascii?Q?ovyrFRkAgcq0KkXDER01ki0OPIeYOFzhxas1t6IpTrGrkRQfiTDdTnJpHdLp?=
 =?us-ascii?Q?1TDAKZTBHcYh7YaSnLJ287sik7JNN70tGaulvI452/0qZno5xO/OyLwueMoW?=
 =?us-ascii?Q?6v7fxxuH9itMfOExdtEj7lbqd6H3nrGn67VqMyiD3dXcYCrA3mNqrWrrrUF8?=
 =?us-ascii?Q?CG6i0ZSSa4pgCDcyLT7xq6yIy5X+onkgI4Jw1W0i/ACLaadZuFuVc2imvuOT?=
 =?us-ascii?Q?XOV/+YH72Y84iOSoUKpPRaI9ZcNH0AZP0dzJVz8dF7PoBpbdBFWzMtJHZ4+C?=
 =?us-ascii?Q?I5k1/QHuvSiHfsBIO8WlnuMBPWrGn6s63d/7TR1bjM7DQ36FRoosV+QUX2un?=
 =?us-ascii?Q?dKKFyv2IjypcHOfnconuVwv1earH5vaqW6XaQ09woQb0c5Rl7UjloiNb7mGt?=
 =?us-ascii?Q?6/4fkguyl+mKH8GqN4Fj4ZvfSsJurEoQsknRnR4+eDGN9TmI8QVWm9AmzIgD?=
 =?us-ascii?Q?1XjqKAxHJqsfJXu7w6EwGtuwSV3gGD2vpHOM0pKVRoifLSIFZoIpk3mD0+Y9?=
 =?us-ascii?Q?j0PY6M9LZaCAggTaJcIrDO1OFtLv2ct0rHmqeCguX2pM7dcHVCTIjtj/P2Pf?=
 =?us-ascii?Q?/1A9SQeJiGQfDJ4RudoUwVrkrDAC3bB06AXIlUfixtDztzaOgi9H2U2nl+HI?=
 =?us-ascii?Q?X1y2xI6709MynkzRwDMCgbJC+KfaA7nncFsOcGO9qf9NsKnOUMoEN3nQQTic?=
 =?us-ascii?Q?utYCrl9BrLuztbT7giVLYIVfr0u2wjeyckP42OSsuzFmVMSOdrluqa5qeiBo?=
 =?us-ascii?Q?O9yRJbd/EX41phQLq221154yap+Q+9BMS/eQSvZqli7beMLJeygJsIh5Sn70?=
 =?us-ascii?Q?aMF0LSUUwb6nx81cESEIQsra8C0h/9WXpKwQ9RrlKN9LMJgDBZ9VF5h6Je9F?=
 =?us-ascii?Q?f1o8Z+T9VLLTMw8yn7DSvUrLKhDhpiEcg+LOrELHu7tC0hIXK0i34dmy8Yr0?=
 =?us-ascii?Q?cfPAul2jtzt9Y2tboS5NDtVqNOSLIJUUroooD1OYfPjOWKv06SXRtIfDcy0J?=
 =?us-ascii?Q?3lGVmrkEH8Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?te3GKRlox6yJJX9MYlkiNaXiFgHzJIRgepsdcbKSB5X5svFAHhjDDLmOmqXI?=
 =?us-ascii?Q?eOQlGjCQQO368DqJ4JqG2xYx1LEePH90sLBZz3gWMHbuc/98ywmxAPF66e2+?=
 =?us-ascii?Q?iq2ITy7dyqF/HZyt9cTmWfPjzGr8N3Nel1g9DkOYt0uWVJDrofIT7Uq1kuso?=
 =?us-ascii?Q?Idq+Yhvgx8GSiiF81RrPD71j3Wd730Y8ZaiJylcq8Exy0u6bMpLorBLBmiV2?=
 =?us-ascii?Q?OC52qeaykspc6TaVxPy0Mrsn8BDml2d7/nqxHJHC3YltmKLtsh3kgewilmPY?=
 =?us-ascii?Q?vVhWr0hRYd+hxnP4QdRVr5JjmWjK3Vy2DwwwE6bcbmLSX5VzK8rsoWTr7oFQ?=
 =?us-ascii?Q?Kyow6AGsetht8K7aYwg8KfB0VRWjWG0d0pjC7jJbyJmIzUtk9F7+fuqo2tdq?=
 =?us-ascii?Q?sThcY+3Vpnk5IjYhIQZLS+/Wt+eRYWWB80IFbduf7QNgvMXcei+9xbCV4+yQ?=
 =?us-ascii?Q?vv57htJ1OLOeFokJLZ55cTT6KO8/IpDOFogXeEGmf6SOYF4fIZTqMB1pvzFC?=
 =?us-ascii?Q?PhluSu+WwCGx4weIb0fMwVWD/G4BrjKSVALP40YGJvPbGKoUY7cFMv3lRgDJ?=
 =?us-ascii?Q?3BBvvy7vtbq3Hr2tTDCQDLSH6Pjw5QlSV1gi/C0+bDLRZ+HrxHLEdHnLSMu5?=
 =?us-ascii?Q?QUtcLsvV8kXoXlTlehmSbdXHLyxBsqK+TgIYPZtodMvEoEzqt2ZZdXs9mg3S?=
 =?us-ascii?Q?b+31sn74gTDiP8CV0njo6UbQZNUloDbEEh2C7+4111D/scz1O4meMm8kwOty?=
 =?us-ascii?Q?v35D0uq58R6Xf2WFuO663nt0iBZ/d+Eq/592enpULsNLBy1eJbhNgir42F5l?=
 =?us-ascii?Q?JlmELvL3odkBNL3/I8m2nP+Lh7HHWnJvQzijmkVS/L4bOWFNIPm7jI1NWSpu?=
 =?us-ascii?Q?cXbFy6SeJ8hd9NluPw+zgVGua67zOSZGtNgNZ8eRiacNciKsl0bCtZDsJYOh?=
 =?us-ascii?Q?6NpSDVoNTQJiC0qHSdHEQ2+tjJboGVcuaine9cO+CittB0rupd/z4MYEZjMo?=
 =?us-ascii?Q?ri/T7k4PRNvOWzigflr8vD3GOr9bCPcflv7iMbod+eCS3mCqPhnBlf1vDZ0E?=
 =?us-ascii?Q?fkkvNQ6O+41n3pqe5kQPRwmQH1yYiR9f+6lNAAUZKIF3ZYkkRqVlLL7eFT7O?=
 =?us-ascii?Q?hwJk1/h111q+ILjC3EwGDjzD5mU6hETtPyy2CS2MMDR4E47FmwikJ2+eyxsa?=
 =?us-ascii?Q?uN0pj1KVh3kj0EbFTo8WveWPcRtwfSOBZF0SsCJbnp6e7kaIiIdtoOZYEKxz?=
 =?us-ascii?Q?sVNPNVFkNbjO3hS6YofGftMJ4EeQM/TMucEf9BHnTFFBG6p/DKXN18ad5hV4?=
 =?us-ascii?Q?Ij3GJPWzQCOB+r7TnxK9naADA42LV2KghCXgYw6+G3gPy5l7kav/Nyzn2qZJ?=
 =?us-ascii?Q?Ot6CpVcQeuT+rSuZ5sRuUAZRC63rfFkbviFMUMN0wcAX5d+gQbEq6x53w93P?=
 =?us-ascii?Q?u+AkHAZrWMgnEEYOO+b5N007qip84ADnXYdfkujhbIUFNzg1C1SsBWB7ygTg?=
 =?us-ascii?Q?qCIgOVd0t/tDt3MDoDwZUSixmzJHyYNZgCFqahgdSRPEztCm6oynMlujZeZr?=
 =?us-ascii?Q?052x6yA/wEIbNDEOzjhLKQpsVxhttvJHX0GyYISdNJf1KovfmdaFaWBysdqK?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7e2f50-48aa-41d4-a4f4-08dda79c72f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 21:27:34.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnZ4rHtLSN4TTgZIGpkrou61i3FXOiRBoq9tG5XsnQT7OmVQxNqz0yG/xpsBMkJh2tYORRyPKrvOtaJt8Rau6MzLhkhLBWOCdJjI/1NOnl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
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

On Tue, Jun 03, 2025 at 10:28:26PM +0200, Michal Wajdeczko wrote:
> We don't need to include xe_device_types.h there.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

I'm mostly relying on the compiler/CI to verify that we don't have any
other cases (aside from the one you fixed in xe_tile_sysfs.c) where the
code needed device_types and was relying on the implicit include from
xe_tile.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
>  drivers/gpu/drm/xe/xe_tile.h       | 3 ++-
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index eb939316d55b..5ade71bda89a 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -6,8 +6,9 @@
>  #ifndef _XE_TILE_H_
>  #define _XE_TILE_H_
>  
> -#include "xe_device_types.h"
> +#include <linux/types.h>
>  
> +struct xe_device;
>  struct xe_tile;
>  
>  int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index b804234a6551..6dcac829839d 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -7,8 +7,8 @@
>  #include <linux/sysfs.h>
>  #include <drm/drm_managed.h>
>  
> +#include "xe_device_types.h"
>  #include "xe_pm.h"
> -#include "xe_tile.h"
>  #include "xe_tile_sysfs.h"
>  #include "xe_vram_freq.h"
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
