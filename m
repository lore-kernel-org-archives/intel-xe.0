Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DCCCD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 18:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A801123B2;
	Fri, 29 May 2026 18:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEJll6UT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A30B1123B2
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780078812; x=1811614812;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D+PlgW151ZGSv3OPcLDNAQE8Vl0yaRFxMwxqkmUTaS8=;
 b=jEJll6UT1AOvXrASnGyU7cD5+L/sldRTBze+S4zeddO4JlTNcG0OXRyT
 dN4t1LNxrrTsvVMuq/bFHCZK5zZ+EpkUO8MqgUa++4KKTeUuY6CYmZNFz
 tXCrcB4sjWOk62/SYt6Zm+xmsI3hhrhWJqX4QYbOmTAaUGK3ay4xJCdKB
 B4kKkxePCLPItAta5Y8tFP1xh6Syf/dEG/T357B2ZW2lrqsk6W5f7x/LX
 05qRy2c60dAAGtSZd9b4drSaXqnKnpOKUwqk6f+lq6sYrhefk+5LeQc02
 kc13/oDZ5YXl6l7rROHIHArdLWSXgyKuqSog4/WlHadwHctDr3w89Lnvo g==;
X-CSE-ConnectionGUID: qTNvrM16T/+BrpFK0bRFBQ==
X-CSE-MsgGUID: ZHyBFse7RiiOojf8aWXLQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="98355112"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="98355112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:20:12 -0700
X-CSE-ConnectionGUID: Dazi+q0aQDmAyYUdas2VNA==
X-CSE-MsgGUID: 1etn54WWSISwjDFO60Pf8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="243012885"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 11:20:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:20:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 11:20:11 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 11:20:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uajLQIOidFOrPUUtJDDfeJMcq6fKSvyPhANg56pf3R7fBdXK1cQMvEihpZBu30LOWBL3SFNeO4Sk8DtBlVQuZbVEE6/hWdjqghIeYSfPmI5mK3bxgKoC+u2JJinJgWa8fQyitiRzSbFXJ9KipBo2fQt/UsV7tJk/hHbDJEKzX3XM6sSQJjtg/c5P8kpR5Eb2rxdLa/Cy7Qujm/IucQqn+bJL3IkJ5qbKQCfBG5K4GwC7anqult6t3bL8C3KypSKkXjng0Cob1WlIO2zW3lP2bTn0GfkPFG/r9rmP2o66Wt+tDOQDbpgN6gnLCZDZdKXWZ84lTJECU5eXTf5B+Gu+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcD/QDS7Y5K22WHBVuc5LSNDrjHTscfpdoCjZ4sAp1M=;
 b=rvySVYVuHbgq1Zs36rvah33EB1cvpodrGXOSTICa5FjwbU1sibAhVb8o//hkVfVmy+G4TJyTwVe1LtPIMHN8cBQOETzrgSDocvvfe/8I5hMvzNmYXUMofjuM3u93+FDFV5ArMuh6bc2zbsGKIxtJhgIG7S8x8x7k2VvUXx9z5UBJ1BpNO82Tiyt+076whqUlJDVNYvjcoW7mK0avIzpfsEuvSKsKv4sbcstEnkmEKRrQHnZqTYmTZqWNjIUQR10CUYVvzHuLAchIyoY2objAT0+CF2H0Wk6w1S4fyGxW04pF5Lbvwg0yfFnBibNWQMaZ3BnZXZnYtxooy+0w3UAysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by DS0PR11MB6517.namprd11.prod.outlook.com (2603:10b6:8:d3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Fri, 29 May 2026 18:20:08 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1edf:e4d3:91d0:fd2d]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1edf:e4d3:91d0:fd2d%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 18:20:08 +0000
Message-ID: <a72fcd52-3590-430e-a963-ab9ae00d68b2@intel.com>
Date: Fri, 29 May 2026 11:20:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] drm/xe/migrate: Introduce xe_migrate_reinit()
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, <lukas@wunner.de>,
 <badal.nilawar@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
 <20260516093131.27442-7-raag.jadav@intel.com>
 <434530c7-352b-4802-a3f8-50dc9d6486b1@intel.com>
 <ahlf9TGszMJUITJv@black.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ahlf9TGszMJUITJv@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|DS0PR11MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: 3514b982-1c2a-43e0-3d7d-08debdaee9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099006|6133799003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: P3i50VZ8YMkDfMZEP0b689S2k8suQnDIo3AnBFivBX/PjpD9zpuObD4RG7TBielqnwuL1qCgyEXe+wCsfYv4dxk74s9X+49r5CkeqRv/apjPC/OC8CGJ0uPbtrJCjJzKyklQ6rPyRRgT3zeOyNZM41A+5HdrqJX4TOtuoWPxWs/8wZlaCAGAdxV23PllZeJrwb3nl47Y4JLg9R8QECUxA1qHLXJNwxJWxJZL0qh0LQXRe5s7gTJs5Of/LtpDTRPOskC+5tfMF4cYzCiMn2O93PzAEGRz98iAwbDtIrRkD0/6EDC7GYMBJJSmG9Hx+GesPuRCj572OGB66yiacdpuNexPErAOXieFvxoRXMfgTmdzMtv/pVot4Ok83hH09C9SqaMmvfrJ/FtLqOmteox9D55y3Id/jMNHwfprLUjrP1gHgAmEeYVyU3gEmRz9QhiFsEwR19ccARDjVByjqlC9Tx8UsT1yymGKa0kwCMuOaUlBp+LBl08rZTtO7URB42nqUDhGg9smcxmc32hR7oyh1X+aYg0CSH4yph+XC+UKL8BFI2wwFnNUXuIzwa1B7Lwsh1SmJcq53FpL2aDlqggNV7ekme0s2qyr/6iRqiyyK43AfDEpc6mJqIT4rc3jUnFi4L6rCanm6JotkP8mPtlkApTRejPCma9jpUYlbKspD68OkijN432GKVY5uLYtjEhPHdgAaUc+23wf27Dxs5BQjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjR5MlFReExra3QvY0RaRmJHM0NHVzhSWXFEQTZNZkJOVERTd3NseGRSKzdK?=
 =?utf-8?B?c2xlZjM5Skd6VzA2VExHVFViVFFtVG5ORFFXeWp5LzI5Mzk1VWxub1VCS2lT?=
 =?utf-8?B?TDNqSHhQL1JaQmx0cG9nMEF3R3lSbmtBNjNwNHplUGxKdiswRG5UQjBaNHk4?=
 =?utf-8?B?YXJIdmtKM1VTNU5kY3k0N2c0S2ErdzAwbmlETzNSL0ZRK1YrMitsdFZiK2wz?=
 =?utf-8?B?cUVFeDJ6S3o4MHRBQnhxQUJhZTVzZFJ4dkE1S2N1Y2lzVzVqSVNIZXpBcVE1?=
 =?utf-8?B?Wk13UUZBQWN5cUpVNDhwZnpKN0R5OFpMWGd1YXlOb3ZFUGp5SUNKY21XWU1l?=
 =?utf-8?B?S1pXOHVZdldWaERpcUtjUXVxUUhuMGpQTzY0NGEya3ZEcHo2amN2SHVBSFVK?=
 =?utf-8?B?bWw2TFVCbVd2TFZkY0pzQmNQZGxzN1dCR3NMTXV1dW1Ea2d4dGFIQ3BjT2ZG?=
 =?utf-8?B?WjV3WFphcGs1NW1aeW1DZlFsUGNsSHpMdXVOUVdpbTZFamVuZ0JUKzlMRjJP?=
 =?utf-8?B?YkxtRm5iY0tCS1JLTnVnY0FVdTlKa0NDbnJ4UnIwcEJQU0hYK04rdnVWOWZP?=
 =?utf-8?B?R0hvblRjZnl4RXpQSlhrdmRsaURwd0htOWE4Wk5jR2ZXa0FrSFlRQlVXOE1h?=
 =?utf-8?B?VGg1QnVhRU93WHRrRm1XL05pU2F6QkNrdms3VzBFZ2pQdGh5VlNNTTduaEdU?=
 =?utf-8?B?S3plbFdzT2tiTU4ydFRZVHBsR0JDYkxUemtQRXhMamRYV2xCNWxJcFROYU9F?=
 =?utf-8?B?RjVwQXBqNGlVdzVhcjAvTG4zOVlhdEhpeEpNZS9lYnlJVnIrL05qa3BCY0lt?=
 =?utf-8?B?YWh0OHI1MUk3SzlLK3pOUUJxSkp6ZVRqYjdXN1pBQVVNdytVRHlSTmc1N1Nq?=
 =?utf-8?B?WTdzS2hUSThqSWhValRwVHl6Z1lWcFJxSVpoc2RnakoxcHBlNno4cEdhbmlr?=
 =?utf-8?B?QjdnZkplUzNxYVFETS9CR0NPdDV4N3pxUTZMUzgvSXBHRXE5czVWYThYd0ln?=
 =?utf-8?B?SXVFN25DTmt2eEh2eUN2SXl6SFl0dHNFbUtaZ0s0cE8yK1ZqVlhJUVZNNUJK?=
 =?utf-8?B?alVWNDFkbXNzd25FSURtRlRKMmRYQ1BtUWVKaTNiZDNkUzd6YW9lVHJsUVhl?=
 =?utf-8?B?ZitaZXM1YU5DMGd0M3RqOTdSY1FqSDltY1VocnFFSVE0bG5OTnJJUllBcG1k?=
 =?utf-8?B?cldaMXg4Wm5GVzZyanhTZm1vdElQYzkrRzAyOGlQdHRHNHJsbkt5S1JQRS9K?=
 =?utf-8?B?Wm4xcit2WHA5a0xGb3cxZmNvUTJyZjRpNDdhK2RsVVJBcnVpVXkwZ1VKemsv?=
 =?utf-8?B?TlZhZkpndm9ZQUMrNWoyVUhYR2lwU1VCY2lqV3BJZmpSRkN5TGdBM0hkdGNy?=
 =?utf-8?B?RmIybnFSMUFiekhITjdxR3ZWWVgxUDNJRkRZQU8zc0NVSXBaMUFZNU9jMDBa?=
 =?utf-8?B?RjNLcFpQcVV2QWpiOFpIMlN4V00yTlUvWEZXdG13OGQ1WkM3YzBlVkpuU3pG?=
 =?utf-8?B?TTVxRXVHaHZLQmJWbUh2N2xzMGQ2UWxuckxoTzQ2d0tGWDdOOWxXaXhlTkty?=
 =?utf-8?B?bGNqaStsZHk2eW4rYktLT3dSd1M3WGNSZGNLZ2lrYk81SWRITC82TEJmdUVV?=
 =?utf-8?B?OVlCOHZ5L2tYL3F6UFRKWldOOGd2YUJUa1J6eHYrQTVxS1NpZkIwTFJlTkQ4?=
 =?utf-8?B?REZVUHlpbzVzMVRaMHNSa01VZUxkREpNT2RmeEU2OHhLak9iVkYyNU0wbVZB?=
 =?utf-8?B?QWMzVnhuRCtoSUdxV05jSVlQR2pRNFFmdkdJcnlyY3B3MXBSaXJqZURzdnJM?=
 =?utf-8?B?ajNiRUZEYzZXekpsa2lmNUdEd3haTWtseit4aEZJQnVtblJyN1Z1NVVtakJJ?=
 =?utf-8?B?bStTZ240Y0hTbXlCMUdSRWY5RG9wUFo5YThIQnJFY3JDREdWRGNpaVZaRUE5?=
 =?utf-8?B?QzhRTnlrNWtlbHNyTVlMY1M1djdlMXdWNmtnOFR6dW1yUkYxZHJaYi9MemtT?=
 =?utf-8?B?ak4xNGJRSXF4Tm1CaGczei9pVngwMG43WFNOdW8rT05ZM2xLZnFzekNlQ2Zk?=
 =?utf-8?B?b0VMSXkrWlNna0NLOGdYVWFsM1FGUWZ3SzUwMTZHMElOYUlZTmZoMWRuRVhT?=
 =?utf-8?B?V2RJeGh1TUZCVDM0K3l2bjdJQ3NQN1JSMnVpYXZBRE1WcW1LakMvUm5MS20y?=
 =?utf-8?B?ZlJTbHZWZlZFbGZaRWZFZHhzbjcrbCtRY1d3TjV1RDR2Q0NVczlhRko0emxQ?=
 =?utf-8?B?bWlucytTOS9xcU8wREQrMjBtMUIvSWdLNGQ3MVdubHI2Q1RZWFlJd2xxb2tR?=
 =?utf-8?B?OUVUY2NhUnBPbG1Eb292NVNSOTFUcXRyM2VkYTRvT2gvQkxzVHA1UHE2SzN5?=
 =?utf-8?Q?r8jN6UEEWcyddXS8=3D?=
X-Exchange-RoutingPolicyChecked: smVE2/AmyIvgdyNNAHBQ8fKj6k6ma+BHNCTnFF6ifnbASf6X/NHP54ojpHYp8cMHwTkb+KHZpD/9sSfM+Q3N+n4SNAazPvIxWdWHOqqJghj/IYiNebfh8RaCg9hVzYK79JaXVjVK3i6rXCB3tBPqaCDD2gfQaS9SHT+eVteTfDFod8VFlCqGacFgcL062BU4jozLXPyZ2ZPV3eIsxUk915X2a6GNbubQndvS7Fyp8kB1CwnEop35WYR5fnNG+Y+21fjUyCBrSr7iUCHzeqKMrIK+vJ5WdWtGSvuaWv24kCNvP0Az1LYgQaQMEc4hhxWRqC68tSy0uBsKoHIMFTrD3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3514b982-1c2a-43e0-3d7d-08debdaee9f4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 18:20:08.2295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQGn4eNrMg1CUYsgtub2aFZcp5HTiE7Wczlmzo7BK2mwNyqo5CzgXYyBhQ1puprYhwp+GGgcfI+Gc2OOv/zU+DbdN/oa0hYvs4qA9RuYQx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
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



On 5/29/2026 2:44 AM, Raag Jadav wrote:
> On Wed, May 27, 2026 at 04:27:56PM -0700, Daniele Ceraolo Spurio wrote:
>> On 5/16/2026 2:31 AM, Raag Jadav wrote:
>>> In preparation of usecases which require re-initializing migrate context
>>> after PCIe FLR, introduce xe_migrate_reinit() helper. Migrate exec queue
>>> and pt_bo already exist in migrate structure but since their contents live
>>> on VRAM, they are lost on PCIe FLR and need re-initialization.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> ---
>>> v2: Re-initialize migrate context (Matthew Brost)
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt.c      | 10 ++++++++++
>>>    drivers/gpu/drm/xe/xe_migrate.c | 12 ++++++++++++
>>>    drivers/gpu/drm/xe/xe_migrate.h |  1 +
>>>    3 files changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index acc28389b0d8..a60e04c4d885 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -928,6 +928,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
>>>     */
>>>    int xe_gt_reinit(struct xe_gt *gt)
>>>    {
>>> +	int err;
>>> +
>>> +	if (xe_gt_is_main_type(gt)) {
>>> +		struct xe_tile *tile = gt_to_tile(gt);
>>> +
>>> +		err = xe_migrate_reinit(tile->migrate);
>>> +		if (err)
>>> +			return err;
>>> +	}
>>> +
>>>    	return xe_uc_reinit(&gt->uc);
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>> index 9428dd5e7760..9e1754028e1f 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -454,6 +454,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
>>>    	return err;
>>>    }
>>> +/**
>>> + * xe_migrate_reinit() - Re-initialize a migrate context
>>> + * @m: The migration context
>>> + *
>>> + * Returns: 0 on success, negative error code otherwise.
>>> + */
>>> +int xe_migrate_reinit(struct xe_migrate *m)
>>> +{
>>> +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
>>> +	return xe_exec_queue_reinit(m->q);
>> I'm not sold on calling xe_exec_queue_reinit from here. Wouldn't it be
>> easier to just destroy and re-create the migration queue, instead of adding
>> support for a new re-init flow that's only used during FLR?
> This flow is to be reused for multiple usecases where we need device
> level reinit.
>
> I remember trying destroy/re-create at some point but I saw TLB
> invalidation errors. I didn't know how to investigate those and gave
> up on that direction.
>
> IMO it's more performative to just restore existing stuff without
> dealing with memory (which'd also make it a bit prone to failures)
> in this path.

Makes sense.

>> IMO the re-init would be more valuable if we went with a gt-level function
>> where we loop through all queues and re-init all the kernel-owned ones. That
>> way if we add another queue that needs to be re-initialized it will
>> automatically be picked up by the loop, instead of having to hook up a new
>> callback in the FLR flow.
> I went through some of the data structures and found that the queues
> are maintained by individual components that use them. One way I
> could think of would be to have a centralized list of queues (like
> we have for kernel bos) that we can restore without worrying about
> which component owns it, but it looks like something that needs to be
> done as a prerequisite and perhaps requires significant refactoring.
>
> Thoughts?

The risk here is that a new queue is added for a new component and the 
developer doesn't know they need to go and reinit it after the FLR. This 
might also be difficult to catch in testing, unless we go and re-run the 
full CI after an FLR to make sure everything still works (which is 
straight up not possible with tests that re-load the driver).

Maintaining a list of kernel queues shouldn't be too bad (there are very 
few of them), but I understand it increases the scope of this series.

We have a list of queues that have an assigned guc_id in 
guc->submission_state.exec_queue_lookup, which you can navigate with 
xa_for_each(), so a potential solution here could be to have a 
"guc_submit_reinit" function to go and re-init all kernel queues in that 
list. I don't really like this option because it moves the logic from 
the generic exec_queue layer down into the guc submission back-end, but 
it could be a stop-gap to get something working and we could then go and 
move the loop to the generic layer as a follow-up.

To summarize, without creating a new list, I think we have 2 non-optimal 
options
1 - have each component handle their re-init (not future-proof)
2 - handle this in a guc-specific function (layering violation)

I honestly can't decide which option I (dis)like more, so I'm not going 
to block this one way or the other and leave the call to the scheduler 
experts.

Daniele

>
> Raag
>
>>> +}
>>> +
>>>    /**
>>>     * xe_migrate_init() - Initialize a migrate context
>>>     * @m: The migration context
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>>> index 965c45889c72..49d8c717b957 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>>> @@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
>>>    struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
>>>    int xe_migrate_init(struct xe_migrate *m);
>>> +int xe_migrate_reinit(struct xe_migrate *m);
>>>    struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>>>    				     unsigned long npages,

