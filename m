Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D693C2BD05
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 10:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F2C10E267;
	Mon, 24 Jun 2024 10:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFB5s03S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12CF10E267
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 10:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719226270; x=1750762270;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ob1BWNK9Vlw8whk9YGSAUVM7BrKk8xheL2Bfr8jLTEw=;
 b=nFB5s03SIiSlNb2mKqY9OBxkfei7MlS3eSe1HGBd4cpIxHGjApJuaxCT
 sGvaznFClaq5nTgfSnjmeGEXX870F0nzU8+WXUkGWvJK6NRwGWySIjNxP
 2zQTdf5aO9X2oudP8cJ0g7HODq6dZEUWls81iE5+VqqkcT1CXYuBLCPmw
 g+/VzdeQnK2WZsX1zSAHUa2or3plJKY9yr0hOMPaLEX6L4x+1Zas+G0PM
 /JoYhJM0eUdy/++VHEkPO+nnZ0/uNJ+UYHkpyRykyOzsot6HJaB8iNAu6
 +n82nhFjGbLXpobH9vGlZRb/hvANCswiMEmFa+jlOxrJpCC5VIBY2t11b Q==;
X-CSE-ConnectionGUID: gW+JwmfRStmbKUSte2ZVtA==
X-CSE-MsgGUID: fGm2ZaA0QVWzTMdg7LfgPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="33650361"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="33650361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 03:51:09 -0700
X-CSE-ConnectionGUID: ANLRWdskTWaTjeI09vvhyg==
X-CSE-MsgGUID: nkXVbjrORuWLbHVPvxrCfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="47722936"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 03:51:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 03:51:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 03:51:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 03:51:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwcIRke0+V+RM0JAWYgMC97WRuzTnI1Kh/VURnZtG2iAtvCdw2vnZJxf0MAH1LK2mTa+W5j986HnR0Djr5Io4n6u99ubVDm7b+oXY+Rj/zVg80XX5QhCbH3ENmy7tY9/yopAXV4YX5sByvNJeUP/R8eeaMPnhavPtDwlff0qtrKvZSL3WoL5JmxHxLuw0G555nfUn9LS3FeNwf1zmlpvg2o3gkbYa6yTOK0rpujQ4BNKfitvy4HG4OMemRmqXMteHGjOd/cKt3O3HeQ/c00dmecaMzRShKP6OsKPnZYs+BLxlC4CLz92wDjiEss+onF5mv1CYEH42RXyVJFkw/pK/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUgtBgatVZDgxA6YQn3TFMDyt9FDDeMeoCus5uPanIg=;
 b=CTP4i+6a9286sMrhvjV2Xh9lqmB8ypkhw/swj7LEVSFafQFZ8InVDDup4Ug/GrkD8PqS/hOCkxYUZxcCTMbftQKOM+RslKMb+PTXl9Odsq9sTguGXdiDnh8miynrlHZz+/eWQ9p1jzBuUyU77vq0/JzjlR41GBndRXAMwG2CYwrI6SnfQsqavCQtI69ZHnXNIXcWDwmCwKr6+c7A2AVdYJslBe19pAKYrV8shFDi6YOfqlrWVBRk63bj5co6gcBV/3BamdMnPFbzbrGfhS/chBLb35EbilwtFuESgrkGnrDSY7qf/+5KgWgsLaXbudYQe5WurXmFUefoRXZzDd79jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 10:51:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 10:51:06 +0000
Message-ID: <df390e98-8688-497f-a955-a88a5c885f91@intel.com>
Date: Mon, 24 Jun 2024 16:20:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: remove GuC reload in D3Hot path
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240624072754.2231533-1-riana.tauro@intel.com>
 <25eccae7-3bfe-40c7-b400-738ab77c47ca@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <25eccae7-3bfe-40c7-b400-738ab77c47ca@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 717a5163-02ee-4d87-17d3-08dc943b8c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0Rwd083VVpWWmgzK1ZwZXRXcjk0Zk5sNGdwejRsWWxUVmZFaHlXcVpsTXJG?=
 =?utf-8?B?L28vOUY0K3lvYklseTUwNVNHWkl0U3lrVjRvK0tyNWhUYlhUY3J0aWFvQXpK?=
 =?utf-8?B?a2RZZDZYVGd4RTJZRkxWbTJWRlAyeTJyNHhmVXJyeU1nVnZOalNrdlpLMVQr?=
 =?utf-8?B?VWo2UGdqaFRuN3VHSkhYYm9FZkdJYy84THMrRzNKQU9UTit4UDhuclNsVlR4?=
 =?utf-8?B?MndmYjlHcjY0c3pYbW5LazNrLzhTRzVPaFpoUnoycTJyUmZQUzgyQjJYUHd2?=
 =?utf-8?B?ZGZEZEdRZzdPQ2xyOXNTd28vNk5kUldrcURPUDRTSzlBRDNqcGxYNTY1QUNh?=
 =?utf-8?B?SjFobndyb0QvSmZRaGdpaXJaS21YbUxzUTViWGUyM1hJeGxBRXlkS0Z0ZDdu?=
 =?utf-8?B?dUVNd0IxM29yMDQxQXNSWEhRTm9WTXlDQTVSQ05ZbmI3RE5qdkpyb3d5VWJJ?=
 =?utf-8?B?RVBVVDJMdTlvcm10Y1VaSC9FMUl1cHpWeWhPajhiODJUZjlvVnFNMTFLK3p5?=
 =?utf-8?B?M3NUNHgrMy9aSkN2ZCt2KzJiMXljYWFjaGFuNDh4S0dzYmRFcjRvcjNKckc4?=
 =?utf-8?B?QzZNZHJHN0dGRW9JczFJTHRoQVFZZWVNc0IySkJqMExHOVJUOHNBVWhhZ0Vt?=
 =?utf-8?B?d1hzLzZrYWVoYmVWVlViRCtQUzVGYXl0VXZSRk0rdEIyNGZwUHhuNGdRcm5N?=
 =?utf-8?B?cGFINmJ2bEZPUzNzbDBxTkM1di9jcURzbzBWVXRlWTVyQXVyTm9PVzlvS2tP?=
 =?utf-8?B?eWQ1NDVLamtrR2ltdktBUkRlSWk2cEIrQmJ5SzNwb0xrYURDR1FMYm1VYnlH?=
 =?utf-8?B?RDdlU3RGaVQwcUkwWlNRZW01UHR6NG1tM1NWSGo5OGpMWTYzTUdDV2xqaHhk?=
 =?utf-8?B?ZzdnVkpYeVg2QVNXdkEzYk1WdEZCT1pySUhtVDdCemtpSTQrOHF2bFZiZVQ1?=
 =?utf-8?B?V2VjTG5ScGtUNmVFeXk1TGVQUGJrV0N4TG1tdE5DNUdpdmpJRVRTSjdVUW5Z?=
 =?utf-8?B?blJuWHhIcEFnc0dSTXZYN1dYY0poVGhqb3ErUEpvRC9STUNoa0tBNitmdzV1?=
 =?utf-8?B?TGU5a0NIelJlV2ZLeVYxMjBUdG1PaXFmeDJsVVdJNExsTUovaWhzS3FlZmN4?=
 =?utf-8?B?ckh6Znh6S2VqODh0MkkvOTFkU0hKWmd4cGpLL3ZCdm01VEtIckw3ZXBEdllv?=
 =?utf-8?B?Z1gxbVRZUytWRHlON0JiVlNyUjhuVVVtaHVzZVQ5ZnczNGhFYVpnazRiRzNi?=
 =?utf-8?B?NmxqanRSZFhwK2ZlcjFWS2ljOERFcTM4cCs3a1ZpMDBGSE1KM0tzMlVLTWxh?=
 =?utf-8?B?Z0I4dFA4eHNraDhSRVpNTWpUZjVjQnlyejhEOUhsbnlQQkljTnlQdFZYZG5o?=
 =?utf-8?B?ei9kUnV2a2t2MWxNdUNNRVk4Q0k5SXhaNzljdUF6dVBOdkhJellISE03N2po?=
 =?utf-8?B?TWpxNzcxdVdFWnJzTm1iY2JWMHdTb3RLU3VvYjF1bXcydHFxMldyeGszQnJD?=
 =?utf-8?B?TWVDSVY3U3JvNmlsSE9Id3lLWDlqQXdTYzBIS2hQL1Y4bkRSbFdlQmRrbzNZ?=
 =?utf-8?B?bkdxODNWV25xTmpqdW1jMTZxWHpVRVk0NThtR1JDaU1tcXNHdmVSOUlWRnNC?=
 =?utf-8?B?bTdtNG9OSXhoZURvb0dhZEk1N0lSVmNQUEZ0WHZwYkxnRTZnTjZ6TVFRbnlu?=
 =?utf-8?Q?/dDMLTkXpoftxH8kwvA8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmFSTDRCUnI4Mk13blBVUm1LQVhQYjY1aGNXVi9VMjg0U21tTHQ0SVpLcHJY?=
 =?utf-8?B?ZnZqVFcwdzZvR2Q1aHpQRXNmRVhBRHUreWpnVmg4bVE1NFgzSmM0WFBaY1NO?=
 =?utf-8?B?RmwzcThiSEdkVTBSSjBFM2xwYzl4YjdyYldKbjBsWGp2bzRhWTdtS3J5WEFG?=
 =?utf-8?B?aUFxVUhIcHgyeWlBbWp4YnlUVG83N3hPdyt4TlVaVnZVK1BRYWRBM3haU2cv?=
 =?utf-8?B?S0hrbE1YWTdhM3d0QUcwNDA1MXFRbXFBeWpuQnBJeDgydVdxQ0NTMXlZOTRC?=
 =?utf-8?B?dGxGUWMwRGcrcFJDMzhpdDVVZTluZEdiRnN0bkJoUG1laTA0VEpXZm9TTVVq?=
 =?utf-8?B?UmhHd1JhYzNZSkVRQnhBcHJkZThkUktjTGs1YzBaN3dCeXZRaCtBSkdCVHBs?=
 =?utf-8?B?TmxuaWFDalJPZTlGV3AvVW9tekZoKy9iNTNCTUFmbmE4eVJGdXFESDJrL3Na?=
 =?utf-8?B?cWoxbE95L0RtNHNBR050KzNWKzNWZmI0RjBkRzV4bFlkRlBROWs5eGdkNUNh?=
 =?utf-8?B?R1BEa0hYKzZFWGlTNzFVTlBsZEJWRUZybWF6STQ5ckJyZEZoSXFtTDdjcnVO?=
 =?utf-8?B?U2I2Snl4QVlMUi9IYXkvSTl5TkxwQTVUNUpVM1FsQm41TGNkWm55RGdaTHhQ?=
 =?utf-8?B?R0d6N0ZPV0ZVUUtuemFETWpqL1VyY2ZYRzcwMGxDMGMraFRTSXlEZkljeDhK?=
 =?utf-8?B?ZkM5UDBzK0ZUTWhlQkFOOXJqZVViMzZvTnZFdTVKbjg0Snc0dHZhZmd2NU81?=
 =?utf-8?B?K1BHb3loYmhaK0hwYVowWkxVbnpUWkhIVEI2SGJPYnEwZ2RodURvd2RtSjRi?=
 =?utf-8?B?cFlTQkdrYWsrSFZRQ2lSYk9zZXJPN1A5Z09IYjNiQVJDWHhOS0JuKzJWSWhG?=
 =?utf-8?B?R1JwUmpoNm1HMzkya042RGVaUytyWThIb0I4a0lCTlh0a0w5RWJNY05kZHQ3?=
 =?utf-8?B?eTBpRlYwQ1BoVHltZXEvbXUwQytMSllFb3d5eHpGeG1ZdE8zUmlFTUdzMUN4?=
 =?utf-8?B?T25SYTRDQ2JhQXFFaE9TSmRFQXVHWktnL3RKVXdCTTdQS3VwSURCY2xIRndo?=
 =?utf-8?B?bkMvTW5FMFh2bUVmWmVvdVRTRytpTGhDcTVQc1U5VmNEVHpqQmdObnFGTlp4?=
 =?utf-8?B?T1ViZlpud0Iza2dvc1lwdHBWVzhOdGtCUGZFdjR6UDBrdkgzVGhmVTc2WVBK?=
 =?utf-8?B?TEtIdGJ5RFBZd1RlNFdyeGVJYWoreStnTkFHdlBwb0g5ajIyWmQyNmZhWVdQ?=
 =?utf-8?B?Tk5SNW5OOE9YMXJDSnVHZzVGVnBhcDBJUEd0My9KK0pIWGh5UXpidFFjaFM4?=
 =?utf-8?B?MjJYSWNwSVNld29WKzR1anExWDlwQnRvYmx5VmgySkJqL1VqdW9Wb2ZYaTJB?=
 =?utf-8?B?OHJQdFZnbmhhUXhENXBtbnlFSGVhaXlmQ0ZOcGJjaGhXZmdLKzRQTVIrcWty?=
 =?utf-8?B?WVVyakNiSVJobXlkVFNIZzFHMlV6OVd0Z2poSlVJRUI3RWRvM3c5NDVKUmxF?=
 =?utf-8?B?MThZdENLaDR1cWNzYXJGZGlSQUFvNmZzUTB3enI3UmpRZ2tVOEpNbXo5MWQx?=
 =?utf-8?B?MXAvWWdOdnBRTjErNVB2RUlheWJFTVFGVEtDNzlSSTNBMGlxVTRtUmI2b1VF?=
 =?utf-8?B?dXN3K1NMU1F3cEZsMTVGK09lMldnUkZiVkdUNENmTUVkMW00NFU3dEpOMFVR?=
 =?utf-8?B?WXQ3QlpxcXVyaGw0cUtORjgyQ1JtbWNUSmJTMWNObHpPUzRtUFY4Vm5OMWVU?=
 =?utf-8?B?K3RDSGtISkdmSGM3cm5ITmxSeEU1L1JFeXVFdVdWNEFWRmNHRElOQUFKRk43?=
 =?utf-8?B?bmdqRGxOelNrVjZaVW1mTk9qMytFeE80MlZmVzJnOFlWL3FGMTlnV2lwWnZI?=
 =?utf-8?B?b2IwOU53cFIyYzJuTXkxeGI4THcwaE9pblRkeUxCY0RhSG1RRERYT0s2amhP?=
 =?utf-8?B?MjFqbjU1TlA5ZGQvQmJxdHRNaUY3MWlqc2M0R2hTb09rNVdudkN5d1dJN1pR?=
 =?utf-8?B?TzRFUmpSbWxlSkl0WWNQdWJrYXlPRVJZdys2Qlgxb2dhelRDZ1hLQ3ZaaWp0?=
 =?utf-8?B?RVNGTkZZYlFYK3ZmTE5pSHhVeUdGRnRRRWhBLytSa0k3ZzdZeER6RDNZeFFV?=
 =?utf-8?Q?k8xXS9glN3fWdtbcJ6p+tF6cQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 717a5163-02ee-4d87-17d3-08dc943b8c5f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 10:51:06.2382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0PjZuvafiIYFRu4OYXK7/gxqPemiHkZCh0czlZRPoNQJb1XggxSY4KwLj+Xg1YtacLzk+O8AEz4qtXuQK7eHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
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

Hi Michal

On 6/24/2024 1:40 PM, Michal Wajdeczko wrote:
> Hi Riana,
> 
> 
> On 24.06.2024 09:27, Riana Tauro wrote:
>> Currently GuC is reloaded for both runtime suspend
>> and system suspend. For D3hot <-> D0 transitions
>> no power is lost on suspend and GuC reload is not
>> necessary.
> 
> quite aggressive line wrap at ~50, try wrap a ~72
> (only commit titles should be around ~50)

will wrap it at 72
> 
>>
>> remove GuC reload from D3Hot path and only enable/disable
>> CTB communications
> 
> "Remove .... communication."
will fix this
> 
>>
>> v2: rebase
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c     | 19 ++++++++++---
>>   drivers/gpu/drm/xe/xe_gt.h     |  4 +--
>>   drivers/gpu/drm/xe/xe_guc.c    | 52 +++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 35 ++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_guc_ct.h |  3 +-
>>   drivers/gpu/drm/xe/xe_pm.c     |  8 +++---
>>   drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>>   9 files changed, 136 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 759634cff1d8..5b48e4db9776 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -776,8 +776,9 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>   }
>>   
>> -int xe_gt_suspend(struct xe_gt *gt)
>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
> 
> as you are changing function signature, please add full kernel-doc for
> this public function
will add the kernel-doc
> 
>>   {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   	int err;
>>   
>>   	xe_gt_dbg(gt, "suspending\n");
>> @@ -787,7 +788,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> -	err = xe_uc_suspend(&gt->uc);
>> +	if (runtime && !xe->d3cold.allowed)
> 
> nit: maybe instead of just looking at some internal flag, it would be
> better to define helpers:
> 
> static inline bool xe_device_d3cold_allowed(xe) { .. }
> static inline bool xe_device_d3hot_allowed(xe) { .. }
This should be a different patch as multiple places currently
use this internal flag. Will send it out as a different patch.
> 
>> +		err = xe_uc_runtime_suspend(&gt->uc);
>> +	else
>> +		err = xe_uc_suspend(&gt->uc);
>> +
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> @@ -825,8 +830,9 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>   	return ret;
>>   }
>>   
>> -int xe_gt_resume(struct xe_gt *gt)
>> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
> 
> add kernel-doc
> 
>>   {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   	int err;
>>   
>>   	xe_gt_dbg(gt, "resuming\n");
>> @@ -834,7 +840,12 @@ int xe_gt_resume(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> -	err = do_gt_restart(gt);
>> +	/* Do not reload GuC at runtime resume from D3Hot to D0 */
> 
> maybe better to explain "why" than "what":
> 
> /* GuC is still alive at D3hot, no need to reload it */
Sure will add this
> 
>> +	if (runtime && !xe->d3cold.allowed)
>> +		xe_uc_runtime_resume(&gt->uc);
>> +	else
>> +		err = do_gt_restart(gt);
>> +
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 1123fdfc4ebc..4c942e4716ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -52,8 +52,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>   void xe_gt_record_user_engines(struct xe_gt *gt);
>>   
>>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>> -int xe_gt_suspend(struct xe_gt *gt);
>> -int xe_gt_resume(struct xe_gt *gt);
>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
>> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>>   int xe_gt_sanitize_freq(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 172b65a50e31..1ea1d00f93f3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -870,7 +870,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>>   		guc_enable_irq(guc);
>>   	}
>>   
>> -	err = xe_guc_ct_enable(&guc->ct);
>> +	err = xe_guc_ct_register(&guc->ct);
>>   	if (err)
>>   		return err;
>>   
>> @@ -1101,6 +1101,56 @@ void xe_guc_sanitize(struct xe_guc *guc)
>>   	guc->submission_state.enabled = false;
>>   }
>>   
>> +/**
>> + * xe_guc_runtime_suspend - GuC runtime suspend
>> + * @guc: GuC object
>> + *
>> + * This function waits for any outstanding CTB
>> + * and disables CTB communication before entering
>> + * D3Hot
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_runtime_suspend(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_ct *ct = &guc->ct;
>> +
>> +	/*
>> +	 * Wait for any outstanding CTB before tearing down communication
>> +	 * with GuC.
>> +	 */
>> +	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
>> +		return -ETIMEDOUT;
>> +
>> +	/* Disable CTB */
>> +	xe_guc_ct_disable(&guc->ct);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_guc_runtime_resume - GuC runtime resume
>> + * @guc: GuC object
>> + *
>> + * This function enables CTB communication
>> + * and interrupts.
>> + */
>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>> +{
>> +	/*
>> +	 * Power is not lost when resuming from D3Hot,
>> +	 * hence it is not necessary to reload GuC
>> +	 * everytime. Only enable interrupts and
>> +	 * CTB communication during resume
>> +	 */
>> +	guc_enable_irq(guc);
> 
> this will break VFs
> 
> can't you just use xe_guc_enable_communication() as it was ?

The intial series which was sent a while back had used 
enable_communication.Based on the review comment from Daniele it was 
changed to just setting enable/disable flag of CT

https://patchwork.freedesktop.org/patch/553801/?series=122772&rev=1

"Note that if we're not killing the GuC there isn't really a need to
unregister and re-register the CTBs, we could just set ct->enabled =
false on suspend and flip it back to ct->enabled = true on resume.

Daniele"

++Daniele

> it did the same steps what you are trying in this function
> 
>> +
>> +	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
>> +		      ARAT_EXPIRED_INTRMSK, 0);
> 
> if power not lost we likely don't need this (as this is a default value
> and we already set it once as part of __xe_guc_upload()
This was removed in recent changes. Sorry missed this. Will remove it
> 
>> +
>> +	xe_guc_ct_enable(&guc->ct);
>> +}
>> +
>>   int xe_guc_reset_prepare(struct xe_guc *guc)
>>   {
>>   	return xe_guc_submit_reset_prepare(guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index af59c9545753..a01999bb4a8e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>   int xe_guc_enable_communication(struct xe_guc *guc);
>>   int xe_guc_suspend(struct xe_guc *guc);
>> +int xe_guc_runtime_suspend(struct xe_guc *guc);
>> +void xe_guc_runtime_resume(struct xe_guc *guc);
>>   void xe_guc_notify(struct xe_guc *guc);
>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>   int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index b4137fe195a4..400680c429fd 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -360,7 +360,16 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>>   		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>>   }
>>   
>> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
>> +/**
>> + * xe_guc_ct_register - register GuC CTB
>> + * @ct: GuC CT object
>> + *
>> + * register GuC CTB's and enable GuC CT
>> + * communication channel.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_guc_ct_register(struct xe_guc_ct *ct)
> 
> hmm, can we have common naming convention across all driver components?
> 
> for the initialization there was pattern like:
> 
> 	- init_early
> 	- init
> 	- enable
> 	- disable
> 	- fini
> 
> and the "_register" suffix was mostly used by functions that registers
> the sysfs/debugfs attributes
> 
> now CTB is splitting 'enable' step into 'register' and 'enable' where
> the latter can't be used alone and be even more misleading

For the above comment, needed a way to split the registering of CTB and 
safe mode that is required during initialization which will not be 
needed on resume from D3hot.

ctb_init is already used.  I can use a bool variable runtime_suspend to 
differentiate between init and d3Hot if this split is not okay.
> 
> + Rodrigo
> 
>>   {
>>   	struct xe_device *xe = ct_to_xe(ct);
>>   	struct xe_gt *gt = ct_to_gt(ct);
>> @@ -383,11 +392,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>   	if (err)
>>   		goto err_out;
>>   
>> -	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>> -
>> -	smp_mb();
>> -	wake_up_all(&ct->wq);
>> -	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
>> +	xe_guc_ct_enable(ct);
>>   
>>   	if (ct_needs_safe_mode(ct))
>>   		ct_enter_safe_mode(ct);
>> @@ -396,10 +401,26 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>   
>>   err_out:
>>   	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>> -
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_guc_ct_enable - Set GuC CT to enabled state
>> + * @ct: GuC CT object
>> + *
>> + * Set GuC CT to enabled state
>> + */
>> +void xe_guc_ct_enable(struct xe_guc_ct *ct)
>> +{
>> +	struct xe_gt *gt = ct_to_gt(ct);
>> +
>> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>> +
>> +	smp_mb();
>> +	wake_up_all(&ct->wq);
>> +	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
> 
> this seems wrong, as CTB was enabled and fully functional once you
> called guc_ct_control_toggle(true), decoupling reporting of what have
> already happened in the previous steps is IMO just misleading

all the guc_ct_send_* & g2h_read functions check this state. So 
shouldn't the log be after the state has changed to enable.
> 
> + Matt
> 
>> +}
>> +
>>   static void stop_g2h_handler(struct xe_guc_ct *ct)
>>   {
>>   	cancel_work_sync(&ct->g2h_worker);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 105bb8e99a8d..f786b3ec2b68 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -11,7 +11,8 @@
>>   struct drm_printer;
>>   
>>   int xe_guc_ct_init(struct xe_guc_ct *ct);
>> -int xe_guc_ct_enable(struct xe_guc_ct *ct);
>> +int xe_guc_ct_register(struct xe_guc_ct *ct);
>> +void xe_guc_ct_enable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_disable(struct xe_guc_ct *ct);
>>   void xe_guc_ct_stop(struct xe_guc_ct *ct);
>>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index de3b5df65e48..070d28d193c7 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -99,7 +99,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>   	xe_display_pm_suspend(xe, false);
>>   
>>   	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_suspend(gt, false);
>>   		if (err) {
>>   			xe_display_pm_resume(xe, false);
>>   			goto err;
>> @@ -154,7 +154,7 @@ int xe_pm_resume(struct xe_device *xe)
>>   	xe_display_pm_resume(xe, false);
>>   
>>   	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_resume(gt, false);
>>   
>>   	err = xe_bo_restore_user(xe);
>>   	if (err)
>> @@ -370,7 +370,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	}
>>   
>>   	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_suspend(gt, true);
>>   		if (err)
>>   			goto out;
>>   	}
>> @@ -423,7 +423,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	xe_irq_resume(xe);
>>   
>>   	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_resume(gt, true);
>>   
>>   	if (xe->d3cold.allowed) {
>>   		xe_display_pm_resume(xe, true);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 0f240534fb72..997ab4e82931 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
>>   	return xe_guc_suspend(&uc->guc);
>>   }
>>   
>> +/**
>> + * xe_uc_runtime_suspend - uC runtime suspend
>> + * @uc: uC object
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_uc_runtime_suspend(struct xe_uc *uc)
>> +{
>> +	/* GuC submission not enabled, nothing to do */
> 
> nit: this comment doesn't bring too much new info and likely can be
> dropped without losing any clarity of the code

sure will drop it

Thanks
Riana
> 
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return 0;
>> +
>> +	return xe_guc_runtime_suspend(&uc->guc);
>> +}
>> +
>> +/**
>> + * xe_uc_runtime_resume - uC runtime resume
>> + * @uc: uC object
>> + *
>> + * Called while resuming from D3Hot
>> + */
>> +void xe_uc_runtime_resume(struct xe_uc *uc)
>> +{
>> +	/* GuC submission not enabled, nothing to do */
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return;
>> +
>> +	xe_guc_runtime_resume(&uc->guc);
>> +}
>> +
>>   /**
>>    * xe_uc_remove() - Clean up the UC structures before driver removal
>>    * @uc: the UC object
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 11856f24e6f9..dd483ea43b9b 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>>   int xe_uc_fini_hw(struct xe_uc *uc);
>>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>> +int xe_uc_runtime_suspend(struct xe_uc *uc);
>> +void xe_uc_runtime_resume(struct xe_uc *uc);
>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>>   void xe_uc_stop(struct xe_uc *uc);
>>   int xe_uc_start(struct xe_uc *uc);
