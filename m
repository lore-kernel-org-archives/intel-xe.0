Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BA1C27C77
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 15:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B1410E0B1;
	Tue, 11 Jun 2024 15:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSvxMiXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DBD10E0B1
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718119111; x=1749655111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=na0jfnG5HYjQQc6tQw46MyJlLHLHNidNrnCV6SC/23g=;
 b=MSvxMiXH5qs0+rqzJbUndtt9jRbfhj/+nWgmHudIvCS66q0z9TjV0llF
 3YcbBh8sowoClpemH4izt9qYeo2KDDA5FkkPtX3McqOR8hhq7j24RbiB6
 HlaKe98J1i+V6fCWql/mWKL3y9vMKT6pizjiheHIA3BQLMWFa9qBy/qaa
 skXi+a7ePuOTE6mXGxCQzOQZWpeu9If+5cZ+z7Wjnm2BrmTOf/smUOUCp
 T/YxHbHwrUTwrqYG5y3xApSHRRLla79YgwWyVJY868GI6dwiuiA4bxJHU
 znGbMW4m2Kbj7Tsi3TG2b3rZFFr6J/hgQHudvr9m2Eaoo1liMB+sJk3sj g==;
X-CSE-ConnectionGUID: PtsNo6ZOQxqVtHqHujP+TQ==
X-CSE-MsgGUID: F9/biC71RpqZnNyO8hrZxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26238560"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="26238560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:18:30 -0700
X-CSE-ConnectionGUID: HKaclgiuQjmFaCnHJphUOw==
X-CSE-MsgGUID: s7LGWiQCSPakgt/Z7wjogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44596983"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 08:18:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 08:18:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 08:18:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 08:18:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOfAgeB+lI76cYED359bS+Ly8b99p7IfDs41uTyphH9V4GAs/6M38i13UCagTcQN0rTMajebbV8Ki02gsauIqD4R+cNpolJHSXr+cax72QEQJagx9j4m6JPU7KGJ+iVVzHyL876bnyWprPwuy6wrlegb0NMAu2Mq9NWHUzseTMOsJ1ES0azHiFJF9CM4xQt038X/CQv8EsslCRuqQr0JvhuD71+T2Jr9lQjr3w8XyOoQH7S+i3UKoZAiqeyCEVt0gujT5uXLTr0b86QsEyqrkD0nZi+cWVSBiIvXoL41Bb/5TWRoUbXeCs7OVDLcamg1mbdcBDPAlUFl8/LIjyRjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U9GGUkUGLf8VBcE41rwCouYI3KGAjcY3eGzRAjf6pA=;
 b=Jl7RTTknN94cAm0eEfNhPXtaCUf/T4ZNat/5aoLFYZXK0v90I+r1mDodD+ZH0HNqu7VpYcNC1d/TBqpPPAyVJpsYFFhU8nzG4nbOpqOsdKwm3vnygvlhYhrW8njMAWLr+ZlmE/vP3vHk5VDAEO+FOAAPf7DRWHMkeygToiQ2GxwLpi1dxgLOz1WLBCujxn4fJz0qAtBSjEuVRkH8QHYa6fiiVIkrpMgDS8Hw01Zz58i2nPnux+2cGWMnWG4eb8OhnI4BE5cLOV9lw9TVpr0Z/3WmiZ8PuV2IulseNn0yMurMO6v5Ntpyixs26tlMJKRA+q8j+r2qY5YynhRKSlsofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 15:18:24 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 15:18:24 +0000
Date: Tue, 11 Jun 2024 10:18:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH V2] drm/xe/xe2lpm: Fixup Wa_14020756599
Message-ID: <i7xcj24chingzt5doonvwlqn57xcsjfifkr67tix2mdw2iprqy@3faj7qtmbvw7>
References: <20240607122528.1048610-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240607122528.1048610-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:303:6b::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 68031a03-2359-4dd8-c68c-08dc8a29bccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pZQbRcqj0uTLv4SEc8C1mAyRqtfy50PfbY1gzayrCIYkBhvLzeyUDCcfoye4?=
 =?us-ascii?Q?ApdYFig1mqD836WIFTjoVQ5hWAdnlza8kzUZYB8TekttNHVaAUwQpofbLD8+?=
 =?us-ascii?Q?60JmRt/ZFMw438QzYh3CECvgPxJV5QIVqizQvDMJaduNbPHE5EHvwAQI2qq5?=
 =?us-ascii?Q?V1k055IIunqlpHPTXTcTvx80pgXnDZ+PtnPEk7JxTxh7JG9ipXNc0v9/5wGR?=
 =?us-ascii?Q?SIcmE+tGXwxyE8o3VhaE1vSuDiplyWKeh98VRfdhfAXkYxb0Yo2XiYRKW5ZB?=
 =?us-ascii?Q?SUTA8zpkR6oz3Y3e7XYAsoznX++CIYQk/mZcX29/py8tmTP/8qHIS/lFwbSL?=
 =?us-ascii?Q?vk20va829GPh5YM6R1Ufcym/zahrO6DZZM55EdO5MffZiGSy8rMxMclBxJgA?=
 =?us-ascii?Q?IZxUHEzQRiou2FvQUpT+iqNmSZvgspiHmnwd7P8M9NhTm+jxyUY3E+uzeUxV?=
 =?us-ascii?Q?m2Qsh2oNzeQIMVRBVKpM9qPtNDdITL3HX2vMxuyqGULUKai5gWsHor8CmYjK?=
 =?us-ascii?Q?TXKmRq1Ip0QuprDnjQ3MMIamdVui5Lo1c5lgz0/GZlZUwzLGhWyCWZxc1sKA?=
 =?us-ascii?Q?HOQLnLswMz34isfjWcahTUwt0iUp995gAyzKj145vB6vBlsHp2llROlEefDx?=
 =?us-ascii?Q?0J/gjRK7cRJx8+U+fj9UOalS4AlP/wxh6LWkbRtuYUzfcguek4UZsBt9uxhM?=
 =?us-ascii?Q?xUixy97yM1ENJ6hi/gCgvksdXFckDEh1gI1ytsWZw4xjAxdP3P94CjeXIHgp?=
 =?us-ascii?Q?unROha6ttpos1X0+VamVq2wIIau+xgtYglXcWiHgaK2H5GE2B0nZqfHrhofm?=
 =?us-ascii?Q?MEYNT393FnwD6l1ko1NpoGg5xH/HF0DkvVxREsdHkHY8mKjF9/DUpDGCCm18?=
 =?us-ascii?Q?KRjgfrkANO4DqhHRlWFVDsCviodKNHbeFNPojpOmj46tQtCX1cXhLpYWsb8q?=
 =?us-ascii?Q?4B7m/3Sgqo30KvMAZ++8uXtpZyjsunBin6k136ZHEUuCh953EI4/KEdNHkfS?=
 =?us-ascii?Q?uqGHL03eqA/PPx0NNNqx8s8MSsA8PZK8vCcjG9KvsFQYK3kwbXJDcWID1pnz?=
 =?us-ascii?Q?SqncIBZ/48LbvG9R+T3QGQn7w6sgrScK5/ee2LrlugGO6KqhEjdWTLbq49YD?=
 =?us-ascii?Q?UXQyn0d+iFl/49Wl5g7J+qCHP7tB1u5arKxAmBPZeKec1C3G/oZi3MkcYyN7?=
 =?us-ascii?Q?ChVTSEzI0XfhWY6PckjtCWEKmJtV8Zd319B+/F3OPgtqBEY5evzb4jetueva?=
 =?us-ascii?Q?0OcjiAq164RJa4agRD99?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B5plHxSG50xWFCT9xwCm955BPFcqjUBt/xDpDzkMZshSRMhXjLbL8C469jL9?=
 =?us-ascii?Q?JcNBf+I6VMaypS/R78c57YIcaIcSkplATpFr7MTED2dqCz/pCU0+APF90Q2t?=
 =?us-ascii?Q?eqhyYCoC4YpiyQwLMZ7O3BRuHJoIoa3KFH55ij8/d9GVVJ5xiDxQ+/W+6S6F?=
 =?us-ascii?Q?92eSEBmvh7D/fQatRrPfW0ZHbpR3xgsVMaSjJi++eMswQMGd1mvHcki1Woa6?=
 =?us-ascii?Q?zllUn1gcqxeDXJwfYER+pu7OeYPrCmSBCw8WH/a3eVEp8nE09SjCFBa2B1yG?=
 =?us-ascii?Q?F9d2D4E/sdaAl0tIqGFL0GSw4A5JQYM4lafv1Y3vYuJCzQlzSR49jkxqOx0o?=
 =?us-ascii?Q?Iq3NRJ7Ohedzy/6UNi0egNu/JAMJIZEBvZO3dP61yYiI0IdeS/CQZQ8GhkpA?=
 =?us-ascii?Q?7ID8d7Vc5aW1hugFblI8RmXadCZpDxLbFl/ORtj4nq+5S1giAuFARx11s0Jf?=
 =?us-ascii?Q?53qvXF9afajNi0vZpUa/5M1/JUeQlv0D+vBUm25ObpSJOktlPEgbbnCBSX9Q?=
 =?us-ascii?Q?ZM1Yj9DKm2ytoONcwQ0aYpDDljZzGji90Efrt7m4fjkBZNDn1MdJ2xUEu38j?=
 =?us-ascii?Q?ewwLRu+/hKPzdiBpJT0BwrqN01kgOHinvDb8p3dO9bUmKISq6/5q+EKY/guH?=
 =?us-ascii?Q?/nN4imDiYHp8LgE6TGBJoUwoAzk6Fmz0zk/5mL4wqFaV9Y+fk/+fN2CNV8io?=
 =?us-ascii?Q?Qknm5F4hCVypaCtea3r5XzrPCPnCkLfsVxGjUjcdAdcYjMKhMb0wVlmSnvV8?=
 =?us-ascii?Q?fKEMdkDjk3BmImJ6Rr9Fkh8sE7hvRzc/9Gi6lfg8qIX2aaRYETeC2Am3M1q0?=
 =?us-ascii?Q?9VsxqAxFrjBTyhCYpx/aLzB0sNoBKOKKbhg8M/sKN339rRTs2mmjI11h1y5Y?=
 =?us-ascii?Q?43mjMQkKQFzN8fEENbk7+yupDNuDZ2YdkfyCBoe7Rn0sv9ax9nzo7QDg7rrs?=
 =?us-ascii?Q?kQd9z0M3GCpInx96w1csLwxGRC1Y1PgLFJOE7qoyAwAccGHVryxv5sxSiJhE?=
 =?us-ascii?Q?PTJ0mEuME6KtJv2FCSrmp3SDrgzlpa9o8eQN/9Ut5IDGqkw1919pbfRgyTE6?=
 =?us-ascii?Q?7kihOTLthyXe6/497+CQVXHTL8N70eSIXt9nSga9nqvBIAhPWwDDjrnzzGxC?=
 =?us-ascii?Q?vGm4lkVpdwyfzOv7pAa10iwC4LP8Ixw4eIEV5GDvqP5LdoEc9Naow7k/JgPm?=
 =?us-ascii?Q?egTttIcogL3TN6yDdpN7BUd8fg2jYXMQvBI6T2sFuYZVEfIQx+CRVRp3afSk?=
 =?us-ascii?Q?6dpj2DQXDpVRKZhxqXERAWBd+ocUtUQsiT5JxZXr4Y6+wLhZe8WIlhE7BzgO?=
 =?us-ascii?Q?zQ0EJA5NZywzoIJr1DBBaBrY0pk+OCOfWa2iuGKjJCxaAyKbGgELU7hAk/Gg?=
 =?us-ascii?Q?6XRQlEVGrWwokSHlqi/oGskNtFFUFkO7fxUZtsOWR+Z82hQjvi9M2ybK9WBK?=
 =?us-ascii?Q?EiCaZCUwUXjwUFQKQDfHuQZY0Gehc6vFLEeztFDPYVt3Z0xoaklIFIgkuT5X?=
 =?us-ascii?Q?cSUBACZJxvnOeB5f/96iZ+4XgYDiILdC0hHPRmq2DwNT7zRn8uBZTLiqw2Pt?=
 =?us-ascii?Q?bToVyB6UN3r8Rua14okcklNJEPsqYDfcRsYvUWI9ntf5Yc6+2t4EUqaGIufs?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68031a03-2359-4dd8-c68c-08dc8a29bccb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 15:18:24.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p03vtQuj1Kc+lCJZ2l7aw1R4ILyW/ZPyyB5g/FqKx0JRDfHLrerHZGUxPvmt9LM9cESwwWz6QOTLwEbq0GYSNO44KH3C3BRZh65SZODQ7K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

On Fri, Jun 07, 2024 at 05:55:28PM GMT, Tejas Upadhyay wrote:
>This WA needs to be applied to graphics GT when the media version
>is 2000. Currently, media version 2000 is always paired with
>graphics version 2004 which will result in writing same register
>with same bits twice. We can't add optional rule in rtp
>framework and also writing same register with same bits gives
>warning.
>
>Currently, media version 2000 is always paired with graphics version
>2004, so just checking the latter is sufficient.
>
>V2(Lucas):
>  - Add more detail in commit message
>  - Improve code comment to follow guideline
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2016
>Fixes: 131328aa5699 ("drm/xe/xe2lpm: Add permanent Wa_14020756599")
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I will push this soon.

thanks
Lucas De Marchi
