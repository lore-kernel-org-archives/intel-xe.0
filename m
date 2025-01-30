Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C49C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 20:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA5310E9D0;
	Thu, 30 Jan 2025 20:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nn2dlTIj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66710E9D8
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 20:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738269504; x=1769805504;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J6pLcvkO+KJGTMKWCngPk4Mhlagec7jLdZoeiu1qoqE=;
 b=nn2dlTIj0uGgNir+rPDOFwzs9TIMx5Q4mzeGGwljRitJwnHPkRHhxKVS
 5X6R/E09xmRDCYGj7AqkuNJtyATuUOMmWBbIKlKvdSx4tfed9qDsU2hG4
 hr+0FcSdLDr8eA39Hk5M2tckfTicBG0vCEsSnD0ygTHatJV7IG2/gYll/
 /h19or/tpSLaFOhc5LUCwciy9TD2FrGm5/TQZuhQILmqTrWgR+GMJjeWS
 3/pffsqETDQPvNqoDrsJO4qiyV+YrA9kCgIJbqPx523k9Gr/OVz6p3+Bk
 SsckKwKH0NrtSzw6UoXIH7cb09eHa+ITAlmPbJXep6OiOyUGdw0vC5CnY w==;
X-CSE-ConnectionGUID: HuP7Zyt6R/i5h82g8t5mHA==
X-CSE-MsgGUID: EaprxgvHS76IBTpa8awtRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42757512"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42757512"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 12:38:24 -0800
X-CSE-ConnectionGUID: TLzi3HShQaClnmhH7ZMwTA==
X-CSE-MsgGUID: BiYaWMycSSemOD2tkOUt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113458605"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 12:38:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 12:38:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 12:38:23 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 12:38:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuhVG++8w/hI4zm40Vma0VUV0StgH+jYv42W1DzvJ/tRmRdl/bBp6Gbloh7iHc6Czvbe/1bDscBqN7krTsNrXBubcvJZFGdfG7N/58xEtDbNXx408sGN/WyxMDF0dsiwSzEOopcOHTCaKRLFWJaYd1HHXROxSY+eUYI9gSD+8wSwF4yZ6bzlTsf7Syo5MLUASYH7cb/EBCqSQEw2hz8rLVG3RPpjI0s44nuKJQqIS2MdGHZtsiAwznojwx8MiAcsb/8E4yw9jInl/u1EBTvfKq09UkP62l+sYBxKKUOCR4PoF79HKTDJflwU6FtbGzWXRTorHRmhflVGBr4B9p9UcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0lJzYIPEtww6gt2+YbTtq5kO1M7UxA9UlAxi47ZjHc=;
 b=Kp+0rwd4B7fK5A5+cGn1GjDpP3R7HdDgb1dujf7Lz6MErnh6LS+fEZYpNuD/7pmzzv3B8nMmEkz79/97N32Bmo5pFbUQIsUUBKhuahuvoL356ZrkWZK0GZ3kJ+IMfor96nRk7dwaQAIZQJAuT54BuALt72R0GcokpavxmeZczxnc2/VuuNlxq9DQjnWV7dvjOT0MLPpxC8nyuRRC5RAoim7O7wl3pdj8szy+gLoQ7xLxIv758ATPLjIpXTIBS0AZhBsGjzpfs9nA/dBWRfXDaSDRS6/8eqm5zbZn44p0rAg18y5rF5k1Kq7mh5oOIHF2m+SH+Zkp1OH+66G1tvFD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB8812.namprd11.prod.outlook.com (2603:10b6:806:469::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 20:38:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 20:38:08 +0000
Date: Thu, 30 Jan 2025 14:38:02 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <nbior2eopjwr34vcdtyl26gso3uqnwzozqal3lmg5mgq3w4e6e@q3ewr3hlzwr5>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5rHtFUIbLNRfBfk@orsosgc001>
X-ClientProxiedBy: MW2PR2101CA0021.namprd21.prod.outlook.com
 (2603:10b6:302:1::34) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 6301223b-6a83-4af1-a044-08dd416e011a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DzZ8gmD9HfIKQeNJY61vFptNftzEWLjdOCZLt3CKRGrgLed+Z5QAggvobq?=
 =?iso-8859-1?Q?W+z7OL3Nm+GLvaEfe/xgzKW07sUb568fFc041AIvsGNb6izTUPepzYNsAw?=
 =?iso-8859-1?Q?6HfOhDOjOeuEBmjakpLawKfvZB8L+NNskgNfraRj+Ws78ZR16AiaAit8xc?=
 =?iso-8859-1?Q?Dg3wnIhDb0FKl/+dsma2th9lmeeFbqvwkWD5tTTquzOr89pbT+avos2IrU?=
 =?iso-8859-1?Q?UkMBG2EB+z8j2cU6zKLh2XBCCpiMNidZ5L0l8s942bj/T18RaXT5Q606jq?=
 =?iso-8859-1?Q?SWS3ZogoIqT1erlvOQKm/dsJOImOuOjjm9al+hkM9+TfjMwMaTFk9C0uK6?=
 =?iso-8859-1?Q?4y5I65e7djuBvTdPd4WjO+k217UU4frO47lh7500huOr58qSQd5Vfvqkzq?=
 =?iso-8859-1?Q?AgZgVX+fOq6N8ns7eE7GL8nJm7c1hT9yS5DM2kLbFklIJypzBWCOvJMFv0?=
 =?iso-8859-1?Q?dD94GTwFBuPsTSjZ2EIPnV+mxCKgXgxFchE+9A9QZWlFb1kcz4hSoXeuIm?=
 =?iso-8859-1?Q?orsFJzX/u+vJcWajLfFX142RI2JtT0M2YEvebuB+MGe6m+M88X6+G7Kz7S?=
 =?iso-8859-1?Q?vBo6qCODFjkREX0F1OlIVyj6Jl3kgQKnqWqMH0UZGhCPwT0v3NmzfJh1f8?=
 =?iso-8859-1?Q?XhmW6yoS3oCGzUXu1bnRSUlzeyuwt72KDzpphO7N9CbxX8yNjdJgrK/y/k?=
 =?iso-8859-1?Q?XjEu7eMabcCNsccDkYQHhZFO9x9+UDfuXtRRmNsBh8qihlhoQvyjlcrNk9?=
 =?iso-8859-1?Q?9LwHGuU+kmkcfz/FF3U2FfHfV8JGw3l+12NJPYfsOHO47Qcm15i4kZ/wBf?=
 =?iso-8859-1?Q?bDvQ6FEQUID4P1z7jF8tv/dKoz+RmxbfGEdPKmRJUgZ0L06Sb4hf0u8h6g?=
 =?iso-8859-1?Q?W70gSH2czDAsLZzXqr8QeX1uRUlXFSzwDS8ejZkpHtfqIG5GZkEx2n3eVF?=
 =?iso-8859-1?Q?TyeOI/4EnY84EMF7Kjo+/byjOJoZccTRIMZrBav7Es1vqIpVNh0ZtJo3Z1?=
 =?iso-8859-1?Q?rr2+Xgmd+/etmN4oIXuV0GWAERQP2p9pDSZn6o+t7AvDp+9NJ1IPTptfir?=
 =?iso-8859-1?Q?dfSBkNLaPgl4utEz2mxodbaM0o29KQUESVAnkK4K8mZNA0hoFtzc+MBfnS?=
 =?iso-8859-1?Q?oONH3ryS8+9kscJtmGNqrsa7sJBaQff7KA6W1kNFznZ9CpiAjzZ9j8V4Bt?=
 =?iso-8859-1?Q?hoJ/wkLptEArACq7+uxNPXmKnf8m/XXQgaItGhXgyLzh4sKndLQQtSvXUm?=
 =?iso-8859-1?Q?e8zRaJsyLfWfktOHqbPyzT0n8oDgjBfKDOERTzy4k38yNWJcCTsaoNPeRa?=
 =?iso-8859-1?Q?KpjD/ff9c4IJLHM6LtuhkCvRMQTu07yAriXQjuKsXja6IuVueTzeNLHVt9?=
 =?iso-8859-1?Q?kfKg1kf0jUi9wuUPtBw/KklwYwOXC2duj5kk0sf87MtLofDu3gqwf+PHNn?=
 =?iso-8859-1?Q?ImdJEkyaRWhX/l0S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/csYH+lEgJkVDMbiUGTa2v37iFl36zGtEMvkL40zuqbwirgJZzNAzEVLRb?=
 =?iso-8859-1?Q?b65nPFYBCJiElVbHPpA87PXo8grwVYV6muib9WtW/ROYm8t2pLIqMPWdId?=
 =?iso-8859-1?Q?N5u/9ZqhvvEudONUHRY8xoh+F9nVHT0gTBUofMTFmO3xm2GN2ZyrxAdI97?=
 =?iso-8859-1?Q?35tcPADaImHLP78w5yvpLTRy8wf0Fk8TNAovmaD1SfSXaGk1+oCJx1Y78v?=
 =?iso-8859-1?Q?3Dv/aSIS0gBBDRCfyVmw8x2Ag2YeuO/RX7QPN3vreUcsvpG/nFJWmndrhp?=
 =?iso-8859-1?Q?z+dApLeODi4Lvn9ZLVJP1GUlQ0UfWlEFWHDJT+HmpvzCcqThjIOO4k9lbG?=
 =?iso-8859-1?Q?8JicMx6TIsaVFfGUwajuhQc8xbo0zHKMFr9AXwKgq40E/1b3WBC8UTHq0J?=
 =?iso-8859-1?Q?UrtK9WBFI3TI+CQ77BzY0ahQAy82grcT3s01bEz7zr3N1JLLw9SPQczW+v?=
 =?iso-8859-1?Q?ZXU6yziDbs0Cc6MUEB+dxKrcMOvKC8IVADvHA6aMNXljZRHVjfpIllbMgl?=
 =?iso-8859-1?Q?uYo0oWN/bLnHx2yrhftCjk4jgWQ7NbdwxYc5nOgisigYWSVd6cosRCcfEt?=
 =?iso-8859-1?Q?KI6v5gvrB9qPvuh+v4t9e9BJAD0yahOaDd9Cnm5fFUZmfUWSJZuZoaMMiA?=
 =?iso-8859-1?Q?YCVjGNNom6x0v6DxDo+1JF6MWAkQvPnpplzNOkCG8b6vXmGe6rHwcvNiKD?=
 =?iso-8859-1?Q?3dLBtGzxbmXNh5jDv7dtH7gwkrriFdBm/33hNoG2mc6b990PQCxlL4fdDF?=
 =?iso-8859-1?Q?4xidiK8ktA5qkSEUmpN74bNxmdGPrFRmjkWIjvuA1hnW3DPhuOK6eJSY9X?=
 =?iso-8859-1?Q?Mls1uWF8rZGoXwPNMyCM5lqkH/3WED3Hnif4awykPhnuy1zNVgtclm/Kl0?=
 =?iso-8859-1?Q?upkVpTicXZC0vjOBpsSX2Od6cvw8uZD7HZKBw4VEWDyxqhh/UBTLwQsbmc?=
 =?iso-8859-1?Q?xqdYqifwLdiPCE27DnV8QzPw634tgBKKidJVCOt1c5ULFPrspzUq5mm6nU?=
 =?iso-8859-1?Q?f0nfU2edP7T9nVwTGGACeTtJCQi9WmLtLkG1ec2BNV5mYxFt7+ogNZ5HBY?=
 =?iso-8859-1?Q?HtsZJHsphA15qPQI3lJ+QFmRdsnGUUVOgbM9wH81ISWwDh3M1rr5VncdCe?=
 =?iso-8859-1?Q?jgjqnTG1vBIDLjwkCSVHSmAk8RRPwLPjsZQJlAF+7OZxmeplNrRE9/vaTS?=
 =?iso-8859-1?Q?Lq5/2Eu8Ary0Kgo0b3WhuIBxPHoz4PMmLp3Je3P7StdD15Q0mzXHWkX/37?=
 =?iso-8859-1?Q?aLE564WpvuIuyxngnG5NPESvp93eD6AirEj0qBzs2Qr4SVElaQdbj74aqp?=
 =?iso-8859-1?Q?QHicUiyoaF/0V1s2/81lsNUprNIlgUI3pj9lUReLXgWMy32aZXi8d1VdUM?=
 =?iso-8859-1?Q?8tnKhhMR2oG1YtmExZUtOyBjhfIL3vTP8kc+Yw4+d7GSySdRxDN779KBAI?=
 =?iso-8859-1?Q?OQx9auv9FNtwneEkqawvqAuF1rxoQxqg/Pc/5+1p+SxqTOxxbEOrGv0Y2z?=
 =?iso-8859-1?Q?cAU4O5hRE3MWjFsPCWdgk/qKuXnas44AywdN6Zovw2rFgs2uwOpuBqg6/6?=
 =?iso-8859-1?Q?QdVKBO8BqtEYjxrAzISU7e6KIwwmLOQs565Ap4y3n0tkXGRZUNeYIm3TTp?=
 =?iso-8859-1?Q?Z74T3WYOtGoJoU9AdNOBBJ2yHokAmV8I6T1nNDjE7PZDPe9uSrI0xPlg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6301223b-6a83-4af1-a044-08dd416e011a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 20:38:07.9146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImIWKtZLKJ+IMFY+iLZAKBx/cNRV7HQjR//Y7Vvd58MmX601uaaD+MgHlasPf6iyOaeYTRc+gQ0UZX0zm4Spz4V3jzW6+r85cdDbCZyXN8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8812
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

On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
>On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
>>GuC provides support to read engine counters to calculate the
>>engine activity. KMD exposes two counters via the PMU interface to
>>calculate engine activity
>>
>>Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
>>Engine Total Ticks (engine-total-ticks) - total ticks of engine
>>
>>Engine activity percentage can be calculated as below
>>Engine activity % = (engine active ticks/engine total ticks) * 100.
>>
>>v2: fix cosmetic review comments
>>   add forcewake for gpm_ts (Umesh)
>>
>>v3: fix CI hooks error
>>   change function parameters and unpin bo on error
>>   of allocate_activity_buffers
>>   fix kernel-doc (Umesh)
>>   use engine activity (Umesh, Lucas)
>>   rename xe_engine_activity to xe_guc_engine_*
>>   fix commit message to use per-engine class(Lucas)
>>
>>v4: remove forcewake as engine is already running
>>   when reading gpm timestamp
>
>+ Rodrigo
>
>Sorry, I think I mentioned offline that the runtime pm get is 
>sufficient for reading this register, but it's not. It does need a 
>forcewake of the GT domain.  At the same time, we cannot use the 
>xe_force_wake_get because of the lockdep issue you mentioned and also 
>I assume that xe_force_wake_get may sleep and the event may be read 
>from irq context.
>
>I would check if we can add a helper xe_force_wake_get_if_active() and 
>just use that to bump up the wakeref.

See my previous series for gt-c6. I tried that, but it doesn't work.
It's not that you can't wait for it to wake, you can't even take the
lock to see if you need to wake it up.

Alternative that I mentioned earlier (didn't check what's being done
here) is to separate the hw read from the perf read. Use a timer like is
done for rapl and let the perf read only have a raw_spinlock around
reading the value in memory that the timer saved. It'd also good to do
some more investigation about what other pmu drivers are doing.

Lucas De Marchi

>
>@Rodrigo, @Vinay Any thoughts on this ^ ?
>
>Thanks,
>Umesh
>
>>
>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>drivers/gpu/drm/xe/Makefile                   |   1 +
>>drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>>drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
>>drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
>>.../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
>>drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>>drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>>8 files changed, 451 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index 328aff36831b..7e93461c60bd 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>>	xe_device_sysfs.o \
>>	xe_dma_buf.o \
>>	xe_drm_client.o \
>>+	xe_guc_engine_activity.o \
>>	xe_exec.o \
>>	xe_execlist.o \
>>	xe_exec_queue.o \
>>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>index fee385532fb0..ec516e838ee8 100644
>>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>@@ -140,6 +140,7 @@ enum xe_guc_action {
>>	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>+	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>index 096859072396..124cc398798e 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>@@ -358,6 +358,8 @@
>>#define   RENDER_AWAKE_STATUS			REG_BIT(1)
>>#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>>
>>+#define MISC_STATUS_0				XE_REG(0xa500)
>>+
>>#define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>>#define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>>#define FORCEWAKE_GSC				XE_REG(0xa618)
>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>new file mode 100644
>>index 000000000000..088209b9c228
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>@@ -0,0 +1,317 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2025 Intel Corporation
>>+ */
>>+#include "xe_guc_engine_activity.h"
>>+
>>+#include "abi/guc_actions_abi.h"
>>+#include "regs/xe_gt_regs.h"
>>+
>>+#include "xe_bo.h"
>>+#include "xe_force_wake.h"
>>+#include "xe_gt_printk.h"
>>+#include "xe_guc.h"
>>+#include "xe_guc_ct.h"
>>+#include "xe_hw_engine.h"
>>+#include "xe_map.h"
>>+#include "xe_mmio.h"
>>+
>>+#define TOTAL_QUANTA 0x8000
>>+
>>+static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>+{
>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>+	size_t offset = 0;
>>+
>>+	offset = offsetof(struct guc_engine_activity_data,
>>+			  engine_activity[guc_class][hwe->logical_instance]);
>>+
>>+	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>>+}
>>+
>>+static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>>+{
>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>+
>>+	return buffer->metadata_bo->vmap;
>>+}
>>+
>>+static int allocate_engine_activity_group(struct xe_guc *guc)
>>+{
>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>+	u32 num_activity_group = 1;
>>+
>>+	engine_activity->eag = kmalloc_array(num_activity_group,
>>+					     sizeof(struct engine_activity_group),
>>+					     GFP_KERNEL);
>>+
>>+	if (!engine_activity->eag)
>>+		return -ENOMEM;
>>+
>>+	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
>>+	engine_activity->num_activity_group = num_activity_group;
>>+
>>+	return 0;
>>+}
>>+
>>+static int allocate_engine_activity_buffers(struct xe_guc *guc,
>>+					    struct engine_activity_buffer *buffer)
>>+{
>>+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>>+	u32 size = sizeof(struct guc_engine_activity_data);
>>+	struct xe_gt *gt = guc_to_gt(guc);
>>+	struct xe_tile *tile = gt_to_tile(gt);
>>+	struct xe_bo *bo, *metadata_bo;
>>+
>>+	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>>+						   XE_BO_FLAG_SYSTEM |
>>+						   XE_BO_FLAG_GGTT |
>>+						   XE_BO_FLAG_GGTT_INVALIDATE);
>>+	if (IS_ERR(metadata_bo))
>>+		return PTR_ERR(metadata_bo);
>>+
>>+	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>>+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>+					  XE_BO_FLAG_GGTT |
>>+					  XE_BO_FLAG_GGTT_INVALIDATE);
>>+
>>+	if (IS_ERR(bo)) {
>>+		xe_bo_unpin_map_no_vm(metadata_bo);
>>+		return PTR_ERR(bo);
>>+	}
>>+
>>+	buffer->metadata_bo = metadata_bo;
>>+	buffer->activity_bo = bo;
>>+	return 0;
>>+}
>>+
>>+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>>+{
>>+	struct xe_guc *guc = &hwe->gt->uc.guc;
>>+	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>+
>>+	return &eag->engine[guc_class][hwe->logical_instance];
>>+}
>>+
>>+static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>>+{
>>+	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>>+}
>>+
>>+#define read_engine_activity_record(xe_, map_, field_) \
>>+	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>>+
>>+#define read_metadata_record(xe_, map_, field_) \
>>+	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>>+
>>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>+{
>>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>+	struct guc_engine_activity *cached_activity = &ea->activity;
>>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>+	struct iosys_map activity_map, metadata_map;
>>+	struct xe_device *xe =  guc_to_xe(guc);
>>+	struct xe_gt *gt = guc_to_gt(guc);
>>+	u32 last_update_tick, global_change_num;
>>+	u64 active_ticks, gpm_ts;
>>+	u16 change_num;
>>+
>>+	activity_map = engine_activity_map(guc, hwe);
>>+	metadata_map = engine_metadata_map(guc);
>>+	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>>+
>>+	/* GuC has not initialized activity data yet, return 0 */
>>+	if (!global_change_num)
>>+		goto update;
>>+
>>+	if (global_change_num == cached_metadata->global_change_num)
>>+		goto update;
>>+	else
>>+		cached_metadata->global_change_num = global_change_num;
>>+
>>+	change_num = read_engine_activity_record(xe, &activity_map, change_num);
>>+
>>+	if (!change_num || change_num == cached_activity->change_num)
>>+		goto update;
>>+
>>+	/* read engine activity values */
>>+	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
>>+	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
>>+
>>+	/* activity calculations */
>>+	ea->running = !!last_update_tick;
>>+	ea->total += active_ticks - cached_activity->active_ticks;
>>+	ea->active = 0;
>>+
>>+	/* cache the counter */
>>+	cached_activity->change_num = change_num;
>>+	cached_activity->last_update_tick = last_update_tick;
>>+	cached_activity->active_ticks = active_ticks;
>>+
>>+update:
>>+	if (ea->running) {
>>+		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>>+			 engine_activity->gpm_timestamp_shift;
>>+		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>>+	}
>>+
>>+	return ea->total + ea->active;
>>+}
>>+
>>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>+{
>>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>+	struct guc_engine_activity *cached_activity = &ea->activity;
>>+	struct iosys_map activity_map, metadata_map;
>>+	struct xe_device *xe = guc_to_xe(guc);
>>+	ktime_t now, cpu_delta;
>>+	u64 numerator;
>>+	u16 quanta_ratio;
>>+
>>+	activity_map = engine_activity_map(guc, hwe);
>>+	metadata_map = engine_metadata_map(guc);
>>+
>>+	if (!cached_metadata->guc_tsc_frequency_hz)
>>+		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>>+									     guc_tsc_frequency_hz);
>>+
>>+	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
>>+	cached_activity->quanta_ratio = quanta_ratio;
>>+
>>+	/* Total ticks calculations */
>>+	now = ktime_get();
>>+	cpu_delta = now - ea->last_cpu_ts;
>>+	ea->last_cpu_ts = now;
>>+	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>>+	ea->quanta_ns += numerator / TOTAL_QUANTA;
>>+	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>>+	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>>+
>>+	return ea->quanta;
>>+}
>>+
>>+static int enable_engine_activity_stats(struct xe_guc *guc)
>>+{
>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>+	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>>+	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>>+	int len = 0;
>>+	u32 action[5];
>>+
>>+	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>>+	action[len++] = metadata_ggtt_addr;
>>+	action[len++] = 0;
>>+	action[len++] = ggtt_addr;
>>+	action[len++] = 0;
>>+
>>+	/* Blocking here to ensure the buffers are ready before reading them */
>>+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>+}
>>+
>>+static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>>+{
>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>+	struct engine_activity_group *eag = &engine_activity->eag[0];
>>+	int i, j;
>>+
>>+	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>>+		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>>+			eag->engine[i][j].last_cpu_ts = ktime_get();
>>+}
>>+
>>+static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>+{
>>+	u32 reg;
>>+
>>+	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>>+
>>+	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>+}
>>+
>>+/**
>>+ * xe_guc_engine_activity_active_ticks - Get engine active ticks
>>+ * @hwe: The hw_engine object
>>+ *
>>+ * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>>+ */
>>+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>>+{
>>+	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>+
>>+	return get_engine_active_ticks(guc, hwe);
>>+}
>>+
>>+/**
>>+ * xe_guc_engine_activity_total_ticks - Get engine total ticks
>>+ * @hwe: The hw_engine object
>>+ *
>>+ * Return: accumulated quanta of ticks allocated for the engine
>>+ */
>>+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>>+{
>>+	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>+
>>+	return get_engine_total_ticks(guc, hwe);
>>+}
>>+
>>+/**
>>+ * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>+ * @guc: The GuC object
>>+ *
>>+ * Enable engine activity stats and set initial timestamps
>>+ */
>>+void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>+{
>>+	int ret;
>>+
>>+	ret = enable_engine_activity_stats(guc);
>>+	if (ret)
>>+		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>>+	else
>>+		engine_activity_set_cpu_ts(guc);
>>+}
>>+
>>+static void engine_activity_fini(void *arg)
>>+{
>>+	struct xe_guc_engine_activity *engine_activity = arg;
>>+
>>+	kfree(engine_activity->eag);
>>+}
>>+
>>+/**
>>+ * xe_guc_engine_activity_init - Initialize the engine activity data
>>+ * @guc: The GuC object
>>+ *
>>+ * Return: 0 on success, negative error code otherwise.
>>+ */
>>+int xe_guc_engine_activity_init(struct xe_guc *guc)
>>+{
>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>+	struct xe_gt *gt = guc_to_gt(guc);
>>+	int ret;
>>+
>>+	ret = allocate_engine_activity_group(guc);
>>+	if (ret) {
>>+		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>>+		return ret;
>>+	}
>>+
>>+	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>>+	if (ret) {
>>+		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>>+		kfree(engine_activity->eag);
>>+		return ret;
>>+	}
>>+
>>+	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>>+
>>+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
>>+					engine_activity);
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>new file mode 100644
>>index 000000000000..c00f3da5513d
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>@@ -0,0 +1,18 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2025 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>>+#define _XE_GUC_ENGINE_ACTIVITY_H_
>>+
>>+#include <linux/types.h>
>>+
>>+struct xe_hw_engine;
>>+struct xe_guc;
>>+
>>+int xe_guc_engine_activity_init(struct xe_guc *guc);
>>+void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>>+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>>+#endif
>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>new file mode 100644
>>index 000000000000..a2ab327d3eec
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>@@ -0,0 +1,89 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2025 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>>+#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>>+
>>+#include <linux/types.h>
>>+
>>+#include "xe_guc_fwif.h"
>>+/**
>>+ * struct engine_activity - Engine specific activity data
>>+ *
>>+ * Contains engine specific activity data and snapshot of the
>>+ * structures from GuC
>>+ */
>>+struct engine_activity {
>>+	/** @active: current activity */
>>+	u64 active;
>>+
>>+	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>>+	u64 last_cpu_ts;
>>+
>>+	/** @quanta: total quanta used on HW */
>>+	u64 quanta;
>>+
>>+	/** @quanta_ns: total quanta_ns used on HW */
>>+	u64 quanta_ns;
>>+
>>+	/**
>>+	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>>+	 * per the quanta_ratio. This remainder is used in subsequent
>>+	 * quanta calculations.
>>+	 */
>>+	u64 quanta_remainder_ns;
>>+
>>+	/** @total: total engine activity */
>>+	u64 total;
>>+
>>+	/** @running: true if engine is running some work */
>>+	bool running;
>>+
>>+	/** @metadata: snapshot of engine activity metadata */
>>+	struct guc_engine_activity_metadata metadata;
>>+
>>+	/** @activity: snapshot of engine activity counter */
>>+	struct guc_engine_activity activity;
>>+};
>>+
>>+/**
>>+ * struct engine_activity_group - Activity data for all engines
>>+ */
>>+struct engine_activity_group {
>>+	/** @engine: engine specific activity data */
>>+	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>+};
>>+
>>+/**
>>+ * struct engine_activity_buffer - engine activity buffers
>>+ *
>>+ * This contains the buffers allocated for metadata and activity data
>>+ */
>>+struct engine_activity_buffer {
>>+	/** @activity_bo: object allocated to hold activity data */
>>+	struct xe_bo *activity_bo;
>>+
>>+	/** @metadata_bo: object allocated to hold activity metadata */
>>+	struct xe_bo *metadata_bo;
>>+};
>>+
>>+/**
>>+ * struct xe_guc_engine_activity - Data used by engine activity implementation
>>+ */
>>+struct xe_guc_engine_activity {
>>+	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>>+	u32 gpm_timestamp_shift;
>>+
>>+	/** @num_activity_group: number of activity groups */
>>+	u32 num_activity_group;
>>+
>>+	/** @eag: holds the device level engine activity data */
>>+	struct engine_activity_group *eag;
>>+
>>+	/** @device_buffer: buffer object for global engine activity */
>>+	struct engine_activity_buffer device_buffer;
>>+};
>>+#endif
>>+
>>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>index 057153f89b30..6f57578b07cb 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>@@ -208,6 +208,25 @@ struct guc_engine_usage {
>>	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>} __packed;
>>
>>+/* Engine Activity stats */
>>+struct guc_engine_activity {
>>+	u16 change_num;
>>+	u16 quanta_ratio;
>>+	u32 last_update_tick;
>>+	u64 active_ticks;
>>+} __packed;
>>+
>>+struct guc_engine_activity_data {
>>+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>+} __packed;
>>+
>>+struct guc_engine_activity_metadata {
>>+	u32 guc_tsc_frequency_hz;
>>+	u32 lag_latency_usec;
>>+	u32 global_change_num;
>>+	u32 reserved;
>>+} __packed;
>>+
>>/* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>enum xe_guc_recv_message {
>>	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>>diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>>index 573aa6308380..63bac64429a5 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_types.h
>>+++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>@@ -13,6 +13,7 @@
>>#include "xe_guc_ads_types.h"
>>#include "xe_guc_buf_types.h"
>>#include "xe_guc_ct_types.h"
>>+#include "xe_guc_engine_activity_types.h"
>>#include "xe_guc_fwif.h"
>>#include "xe_guc_log_types.h"
>>#include "xe_guc_pc_types.h"
>>@@ -103,6 +104,9 @@ struct xe_guc {
>>	/** @relay: GuC Relay Communication used in SR-IOV */
>>	struct xe_guc_relay relay;
>>
>>+	/** @engine_activity: Device specific engine activity */
>>+	struct xe_guc_engine_activity engine_activity;
>>+
>>	/**
>>	 * @notify_reg: Register which is written to notify GuC of H2G messages
>>	 */
>>-- 
>>2.47.1
>>
