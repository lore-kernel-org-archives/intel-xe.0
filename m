Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC5606A319
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DflRWsY/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B17B10E1A8;
	Mon, 19 Oct 2026 18:55:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990D310EA97
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 18:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792436106; x=1823972106;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QqOVxe4quvQwE+HZgf81ipvnam7qR/CUfDMbeJYkROs=;
 b=DflRWsY/Zld3QOlhopFrO2u/3tRgVPzel7o8DeOCIw/EZYCF3YPrNHru
 A/r5fzor4w9rG9ow13tWC+DpuOUYIzCXunAA0mHX2C9jDx6iaIYOrc2Jz
 U79ULlp7i/WesFGgbhxXTA/akZiKTsLB/w9rrA+hTiemUPiUdXe9xC1fj
 R4sagMLJYn1lZsBYdLYQ5nlhMdLBcc0OvT1Q9fdQVm81Bwiv7M8xnY0tt
 KAVv6TVmumWXVBC7OHWmv/8mLtVsrDEjr24kl51O+jRTxuybT5aLup5sN
 SJYqASsPuJkZDODpij0aQI5mnmGH2fxGMYr17OLeCB3kC9yFccqdX/lBc w==;
X-CSE-ConnectionGUID: APIIhPMpSqKNdUIag14PGg==
X-CSE-MsgGUID: K5rdmrD9TxOHpvWV8x46jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1157689"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1157689"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 11:53:39 -0700
X-CSE-ConnectionGUID: MfDQRtYkQS61uNPu2LSTYw==
X-CSE-MsgGUID: fNLf3nmvSrOdKMUda5CUMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4371413"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 11:53:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 11:53:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 11:53:38 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 11:53:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4Mbj/6Gh6EWfuNoYeMQLZ1JRV3zJzQh8V7LBjydh7RhLvUySGpkJN8lfxznta2QGbTnFv50AZ47m2awC2EvZCxH+6ajrVzxNh301q+fcHt1/VTklr1e4sTrFbpGIaJWWkpEp3s2RkhXH2dGSUwVhLhDR6Tp7MuQoVa6AQtaX82L+S1LEZBCvRYAJkaqyG0WXP29rd6URO7nUAXEclcmr/0Jva45qHou9Hov0itRPw5Z0ai1a/RoIKE98atkYMBXNbKRME2l4RuK42KOIoTJW6f2QHuMeN5OLbHdVip1p5oLQteJNHV+XW+KVr9syXGZMDQzHkKXQaLx/XgRkjjCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geMM+CcVICm1Y0l6x0k1wjH5WzV3+PpfXIYsRXuE+1g=;
 b=rKw7oZ6Zc/5xdwjg5V7NGv8DmTbwGwYQsw0I4z1M1Om8eUC7z1ZOe+enqI1brq17NnhL1tqAZcie2Y+7la/c8GJJypV0ob3y05W7Otp1CzNiZYp15LCqLuQl4oPqJnqGBNIBLFhKqrFoCkoZ04nt5Gx1igV0Fh3P+Mo3K1h2FqFmkcq+knWT7OCuXXzT85Jco8POngW8jFuWcx1U3xyMUUNP0ZP6MgOJqe/Dhp+dAtcLH+Xeum6hxcgb9FXu94aRPUVHjjvEgXOs5c20AzZ0hyQ7lkfmyqClmy0/XUGzq63sG3Y7uVnuDoRM0Z9EiQcVATsOIb9/p60flE0b45inIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by CH0PR11MB8144.namprd11.prod.outlook.com (2603:10b6:610:18d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:53:25 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:53:25 +0000
Date: Mon, 19 Oct 2026 11:53:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Extend Wa_16030224309 to graphics version 35.11
Message-ID: <atZnI6lGw4pOyh1M@nvishwa1-desk>
References: <20261019184911.891262-1-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261019184911.891262-1-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: BYAPR21CA0022.namprd21.prod.outlook.com
 (2603:10b6:a03:114::32) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|CH0PR11MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ccc3357-6604-4d6c-27d3-08df2e124150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|260925022911599003|260925021311599003|261009223027099003|260925021911599003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8Cg1R7fu+JaGgzYpgTZcbr62p5SZ//8zXNqVCVIKwm1eeM5+P5bClks3+Yj7zXyk/P4PZf16nKjMYE2QJ4buWwjbJjJNJuaDygpyuIrwvxp9bAmOQmgaZaxWXd+ghxVNZmdsAhMEOvRUtuMua4ANIpwNFVxG9am2nyemYSVDQhksSiRU0IKyW/miqO2CgmYU/7SsCdauQNJvyg16BY7Tcn+wagUcNb6ElIXPN2Sn3Zsmw48Ikn6sHtXxES84eSkducSBG7V7H4MuyEoapHH7VR1h2cVlJUFo8bdV2hUf9YOjjyywRJ1hhAOGQ60pYFLD/X09tbXj5xSMOUe/dM7zIbpkuy50aekaNQeqbuehEiw5VZPFRdRMU5sOJxsDjlawwoquW27tzi9Bu4HRa3U8NygBcGrgCLog9sRZjt5yBdwZo55Kh/mH3oXxSMI9w/Y761RnpOK0Y7zxXM6gqdeAoMkV2QRaneoZmj+cX4od7ygv17oPmdnLqhn9DBhj5UEbGDj6v+y6IRFFs6N8BvL2Hk+poirPrFrSdhdseBPaLMULyS6AZe91YN8FJ7B9p0W3+l/F930vJG/JHCAgAcYcy1gpA+qpIa14OR+RrkgGmtStIYV630gJwyHsEaPISKcyTWA4EHBrsZiAfPZRxsll9zl752uStZpLUbFUnrgqdqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(260925022911599003)(260925021311599003)(261009223027099003)(260925021911599003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0XXryMTWVsguq2P4E6v+HvbFqRQt0SeENmqVdAIZuDNWHaw8VdQGujliAnvE?=
 =?us-ascii?Q?lTYpFsastg8TBGyhbq+A4Ne/FATCDrO41QaUPnihUHnNOYE4gg6agoed+HsQ?=
 =?us-ascii?Q?icIJchp26HG3berfKNA3pD/Vn2CN2uHffz726AhM7o3BhINhHHVZWtLTy15y?=
 =?us-ascii?Q?iOnLT+HSnVFkufZvloy+kKAa1DluIX3H4XLjvVUMTFiUU5xkZZFezLi5wLhw?=
 =?us-ascii?Q?Gdn5J+FMOVFNYQkqTT0irw53S2JeXkQfj7SmbdOfLOxyBGewVsbW4Fe/J4QX?=
 =?us-ascii?Q?vjoDCbnFpE9RzidQ5TybTR9Rp7zS7BNDThL/eceMA2zg70x2yn6YS3cQEzLA?=
 =?us-ascii?Q?5FcXCIR2rTRi1aLjsUVQcldsieLTzzvtqTU+dQfAc8nh0oDfw+RyZHRQ8C/W?=
 =?us-ascii?Q?RSlcRP7LiczNuStydmuKXdBc1C+0FjuhT9hFYD5QRHlaX1Idq7/we3L3rvly?=
 =?us-ascii?Q?T5EWlyUX3WLoeRJSsy0+7zM6R7+KozyzueJKbZ9luYd2RkPRHKKndu8ZeOsd?=
 =?us-ascii?Q?//bLPi53P5A3H3dKroP26tqOw9zDJ8g78FCtPH0K8BZWURqZgpDxX8/6bmD7?=
 =?us-ascii?Q?UnFbZu6Nby+fVAsT+VWsUx/GnWZnm6QaDZa8srKjjB0qrmJpOBuOHWEr37wg?=
 =?us-ascii?Q?p6e24AcSz75ovOL6JYU4tGvtxHfMw35JF5EYWOTBeMI/MIDT6GAjUMhbvE3b?=
 =?us-ascii?Q?tNdAjmzKMxnvi0TW5ambVV/Panj/FVXgh7mqve4/dXhM7XbBdUaNivS15uWz?=
 =?us-ascii?Q?aL6G6UrK4Me6058LyheigvbX0doYdBiY3M97R2nhhXGbLbqhvqjSr3uN5FuV?=
 =?us-ascii?Q?yKTyExpheFYoSuZH1i2sHjP36IfyiTZYOVlsnuiqugcIkR+I0Ce5p94VaXjL?=
 =?us-ascii?Q?tPBbZvzAuvqP0PFSxQ3DM0Q+xp8GYQ+jcq5uCJbI/zUQxcV0dC6x00jpAZ5r?=
 =?us-ascii?Q?EFYZPXAJfIBGtbUFQsPzbMK+EuPQEDMdXNeumMo1lbbPk2Vqn4NsOzRAaGKv?=
 =?us-ascii?Q?bEmzCcj2QdH7PLU9BiJtsQQdufr+sx6/e8JG2Uj7b5nKjd5/qyNZFNkijCOd?=
 =?us-ascii?Q?jYZbedw5tWd8Tybp6zke34GF62ryJHXqAvqh9d7k+ewUUBjwQlN2deyMTP51?=
 =?us-ascii?Q?LNU6G0Koj/n6aSvBRqaqr9iEq2dHqvMh7yoVmzJP1OzCGGW4UTRQpKG8sFWV?=
 =?us-ascii?Q?Wm2Nf5Fd9x/eb0RQmiOOZ/YTPonsTlfQbJjHWSYyelxWRASTJT/GtNRr1eeQ?=
 =?us-ascii?Q?WcU9AjHnwiyDFGqK9142CHbp7mEnY2WdC7iG0RVIPY6dkQZQjYM9kL4Ql1aR?=
 =?us-ascii?Q?PDZOx8K8ostBClHD9GmaZPKYUOyX3je5gZF6uU4rIACNHqgoKYrB6M9Q8xfO?=
 =?us-ascii?Q?j/mR1I/AdM2vTM4txzx/1Ndh4pyT3hFIFbYNWvjS1LHIA+feu0ciyjsGY2Ta?=
 =?us-ascii?Q?uQeNksG/Fr0xaIcuaZBQyE778TnoL3CkVziNzMeNA7NFyPT7TfXN+BidCH3a?=
 =?us-ascii?Q?X5//CqCXeR41c8HG6zIgTvACSIjDcOjh2SFjVNDoBO2mZdaJk4aWEotVhE7o?=
 =?us-ascii?Q?s9e/0rmqODGd5iaefzppmTn+0ysnY0RLaHhN4nKupAqYsEAMEXsbisZZYxSp?=
 =?us-ascii?Q?B/1hssiQuOnJ4yMB1FqEA2S/4SVPgXFoAXTsIWqfforK/hDnMAZ1H0aHbt7j?=
 =?us-ascii?Q?qgSzSx8YolQ0D3DNEtcp6kkDGC/2JBp2sAQtonTnG8M/wYPL6mdqytxq0fNK?=
 =?us-ascii?Q?ao/ZDthzjmUcu71bdnTmc493+eM/6eFKigiMBRaF8iesvTV9y/XW?=
X-Exchange-RoutingPolicyChecked: dpC/1tAcJ9Y/gbDWZCvUOsN3cyzRFZ9As9e/Tgkxcx07+tX6SntlTFRuEY3JSSNl7dPldQdKAtouGLES9ZCkyEDRv6syq02GO4e1H5NCbuWBMyonWyjsqNQzrNyDDqiXWrVxiBBblDpSoYgnLNywse7wZob/P7Vp1cRt3rag0VXt7cOh3EhokoHIZhScl2frl36e5oJrlscMU3Rfr9ZxA60TdSrJaDHEp2VE2nzzBwXHgxhAZHUiIKQg3o/1txEUSxflJ7ZJ9snyPegxAFyfNEzJgOiq2fmfn0fBDHIH98jShLlsqrBZQx+sxWMoh58JVkNvNLfO3p8A/lZY5FZv3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccc3357-6604-4d6c-27d3-08df2e124150
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:53:25.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssbQdjVdJOKzgU6N63ZwYJyorwmEkOns6URoIjJWNsArI6neijBqM/Eql7aOWapDNro7JnsnOn7eqE9Rnsy6b6ufF9zosr29etaf9OUWXaalJ266wCxooY+w25unQwdX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8144
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 12:19:11AM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Opt in to the GuC workaround that ignores context completion status
>with preemption or preemption-to-idle in the CSB when the multi-queue
>feature is enabled, on Graphics Version 35.11 as well.
>This WA is supported starting from GuC 70.73.
>
>Assisted-by: GitHub_Copilot:claude-sonnet-5
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index f35181fc4e49..63d695f40214 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -75,4 +75,4 @@
> 14027054324	GRAPHICS_VERSION(3511)
> 14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
> 		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
>-16030224309	GRAPHICS_VERSION(3510)
>+16030224309	GRAPHICS_VERSION_RANGE(3510, 3511)

LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>-- 
>2.46.0
>
