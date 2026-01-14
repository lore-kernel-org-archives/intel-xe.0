Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B921D38FE4
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 16:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07E310E273;
	Wed, 14 Jan 2026 16:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nzyj8bg0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A6910E273
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768407364; x=1799943364;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v8YM1NlUuCocyrxhKW2UgsWf6cg1aVJoiVFa496s0rk=;
 b=Nzyj8bg00sUHgEd3A+FKEUaKUwg4mR9fk+LKv3OQXR6EueVwutlqc5JW
 wod6lMXpoFLEEu76WcanBxYA9kpNUSV9JQQYTT/KaizJmyDgAOI2AOj9v
 3VpMf1VtmqxjWXug6OgOgiSWil+t99VOX7y2ogwDmiQHzE+NkCwgy0N0U
 h31tbjTPHtvZ0LxItBdy/YtNFKC3EuobIASmQKqIN+WmD2JYXIywXrmrL
 c6KqbqOwX3lG7VwHE6xKqE/PSTwLQuOPegED3rtp/jCDZMz08JNLGj26N
 uS8bhw2vTsYvJ4234QtoGwBZESQEGDPjUiEjhFZ9IUs9xFhorJ+zjPSGE A==;
X-CSE-ConnectionGUID: W2p646QDQoWqsmR10yrjWg==
X-CSE-MsgGUID: 3jRjA0eQSjGUBvzAGE/GjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69445387"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69445387"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:16:04 -0800
X-CSE-ConnectionGUID: F8aUitE0Sl6XxUrXH+iozQ==
X-CSE-MsgGUID: 2mSMFz3IRg2JP0bwl7uQzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209766632"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:16:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:16:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 08:16:03 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:16:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjFsQTDiJFDwUuPC/Zg61F825J3BMcDT2uRQWHpigJ2YQlPw/LhDTP0/iLxRdAq0IFClfxmcg9IqGDavUg3UWZobXReFdzwyvENcSOkipCCZG6PPoJgKBUrL4DFs9oW8uJBohQWB1mG5lRmGEoDi3hy9OzyZjJBWvS1UEJuaTtrvkn5QJC+koTrP0Ohgg663ANWowHjbrDn8OuW+Poqf9VX3H4o4S+eAVMqcdX9bbx4MGMXL/MSGliOwWlTUyp4Y98YvdSK2at+vgrbCHogU/OLJOhi8Z2UQaFuy6QCj4SAkU3Mar+ICVDsPYtib1ci1ujo9wlJBv3fh3mhYbG2yxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rg0yrrhEGHjZJO6QHCfjQCtd9BoPwxTH8RiEtTLIZk=;
 b=cMMZbVJlKjkFbGlRtnxxzTurLTpJp92aTK8dm8K2alrut/IIcF8it/c724ohDV2fJuWpI34VddU+7RkZKYs77TbNvJuoOU/ktoUkye6J4d8MRf4EYtWyZ4QseivRsEaTJ++Enr64oh0G/BnrWZqeWTR5oyjZs9kWNCg7DhdGndTTZ7owjOxfFTxfKEc9F7MnUID9VRzWhlRmwt08km5JtTEHYBsPUdibsKfbXbM8HKQcOCTtGwHeHyFsPPUEuWIRg7KxNJnBY3v/zHqEzYWzp3n+KLwdopl7HuiBtSQO3Yi65EJF//qGcYPWuXhWRR+ZPeb/7+lmbAlWaxkhCPiVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ5PPF20F246184.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::819) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 16:16:01 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 16:16:01 +0000
Date: Wed, 14 Jan 2026 17:15:57 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe: Rewrite GGTT VF initialisation
Message-ID: <20260114161557.4xormlap6mu457wg@intel.com>
References: <20260113121807.1303124-1-dev@lankhorst.se>
 <20260113121807.1303124-3-dev@lankhorst.se>
 <988183a2-318a-4a11-ab06-40173b23acba@intel.com>
 <93f45e1e-0893-48ed-8d41-caf3a7114603@lankhorst.se>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93f45e1e-0893-48ed-8d41-caf3a7114603@lankhorst.se>
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ5PPF20F246184:EE_
X-MS-Office365-Filtering-Correlation-Id: 43eddb1e-6a1c-4613-d80f-08de53883578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0JXNTVDOWNZQjdYMHVDWUpkZHloUVFBcWFENEVTWGJXcFpkNmc2ZWtPa0xz?=
 =?utf-8?B?b0pHbVZFZURoQlo3amFiYVNhSlN2b1JZNVowdThTVFhZZG1SZGwvd0FDRlFp?=
 =?utf-8?B?a0Rpa2tQcDgxUWlxN3ZRZU5TdHBrQU9DM3NXYWdKNEgvMXBGK2Y3VW1FcG0y?=
 =?utf-8?B?NmlRelg5M210RmdWOXRvUThmYlFqeC8vakZLSWVwdnJUY0I0SXJhY1o1WVZ2?=
 =?utf-8?B?NllJbnF5ZFdDSThXVURkZmVZUVQvdzlObnoyaUZuOERZdWlFZFR0R3F4d3lm?=
 =?utf-8?B?SkgzanRZbG1lOW0yMVlXc1JCZWJVZG5WT3ZwVXhQeXlaaEJYKy9OcmZuOUxj?=
 =?utf-8?B?YVgwZTJadUFIQk8relpuRXNscGFwYnlEWDZLSzgrRks1ZXBMT1lWaW4rSUxU?=
 =?utf-8?B?SFM4LzJ4RkZOOW94RzBuL3JEY1RPMUJZUDE3MUpOMzYzU3l2SGtqTStSbHAy?=
 =?utf-8?B?Yk55ZHhpTWRDcFBBYVd2N2thUmNmNUlvS2ozSDFaNU55UDA1Tnhadnkzc1VF?=
 =?utf-8?B?dG9kRkFlUHBiQ05WU1pkZlQyMmtBb3B1YmxJdHN4M0RLdTlremZqK0E2eWhx?=
 =?utf-8?B?WTNqQ3I0UDgvdDVSeFFkU1AzN1V6ZGFTMkFuNDdZTXMvelNVcWZidXpHMUNF?=
 =?utf-8?B?T0hra3kxR2FhaEhEcEZFYnpxWHA0OGpnSUEwbDBPNXlXbGU4UzloNFFFdnl6?=
 =?utf-8?B?dlRtaHZKNXNzQzByRHg1MlBFaWlrajdIWFBNNHNKRHhKaTVoaU4rZ2hxRU11?=
 =?utf-8?B?UXFRTWJXRjlJTmloTEhmQmVod2lNTkoxN0dQVTRVMWtGOXpLNE9RSjduZ0RX?=
 =?utf-8?B?SytaTGRoaktkRlpTdy9uNEVQaXptQXAya21qcWhXZHpLQ2dvS3JRZ0ZrTjBo?=
 =?utf-8?B?d3RWa3J6TlFLK0dWWFZ1LzAvZ2VLeHM1cjRtaUhTUWJNZm5MKzNoVjJKUkZ6?=
 =?utf-8?B?cnV6N1RmaHhFbmRWdDZrdm93VldUTzNUOUxDVG9PQzd1U1hTYSs4S20rR050?=
 =?utf-8?B?VW94WHc2MVBkWmxuV0pHajNFRTJGSXJ0WGFveVNwSWdmVkpPbDZYVm1sY2FK?=
 =?utf-8?B?VHhuL3l2UXNoSTVBd3RtTzhUMVZGSWVnd3BKK2pDd2NWVElaR0pYQnE4ejQ0?=
 =?utf-8?B?SWJJcW9FZlZyOGlpQjlRY1dZeG5RSjk3SWlUT2RSNmg2NFV5SFFPdUFpZFF2?=
 =?utf-8?B?czVGTytqRmVKK3JVaWF5M1BOY2pzdUdyZk9WRmM3NWlieHkxcnRzSWVBWVVr?=
 =?utf-8?B?S0FXMmdhYUpqV2RvK0s4MS9jV0ZDazVKK1VoOFhzTWdEZlE0MFFDRU1CeXBn?=
 =?utf-8?B?cmlDSTBSUHdSNjk0QUVhZW4wV2F4anl2R3Q0SW82eEtUZVpBQUJtWTRrOUMw?=
 =?utf-8?B?eVB4Mnp3bnB6Z0xWRzkyaHljRXVXQ3lSb05EZmtiTVpMRllFL0JIbTRSRmkv?=
 =?utf-8?B?TXZNMENKYWR5YllWR3JqSGlRMFYxTXU2cTdKZzRaRWdGb1FWcFVORWVRVG40?=
 =?utf-8?B?c2RGL2tiUEp0MStYbnN2UHVSSnZSclM2VHVhT3l2aXlzaXpZcTkraDhaS3Nn?=
 =?utf-8?B?RWdSVWxuOFI3YzdHWTRFTUFEemptMUFKanZFd1dzWUFySUcwK0tnVFBuOFlv?=
 =?utf-8?B?dHl6bXFtOUJnR0czc1RidWROSE1ZQ3RLaldCRnFVWkcrVTFhdnlJSXNTb21i?=
 =?utf-8?B?NkNFTlVFZnpjanpGU1lCRmF6TlVDTnV4bWU2eVJEM2FxOHhVZGtoOU1sRU5C?=
 =?utf-8?B?aEVTRExBbjZ4VTFoUk5wakhteDZ5OExkYTU0MVo5djN3MWtEY0VEVTltamNO?=
 =?utf-8?B?MGVTVFJsZElmM2ptZzZZR2xLZk1RM2NZK3AxWkNVbWdjekdFcnArbmJ1VUtE?=
 =?utf-8?B?TTJRQVJFM2YwK08zenBGMklTZWRMMmJrckRJbVlxU1J1aFFIb1VaK0NsUkVF?=
 =?utf-8?B?Z2xYZ2daY0VGL2pFK2Jjck5vQTlJMFFWRkhET1JxdUxYT2QxZWRyQmtZWlEx?=
 =?utf-8?B?M1hqdTlybTZmNHRLSEpvNmVsSzIzQW95NGp5aGw5cGltVFFGT0gvckdWREVN?=
 =?utf-8?B?NCtJcTlDVTc2S2F6ZVR0T2RJdVN6bER2RWdWYlNVeUw2a3RYbzR5WGtGdW1E?=
 =?utf-8?Q?WToI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3ZXT2ZwM0hZdG01UTdla3ZCZ3h1aG5BWVZvMExMZW9GTUJpNmRqOGpMellO?=
 =?utf-8?B?VEdibmtWdDhWVG5sdmRFVXQ4d0FmVW9VQmxUS2F4V1V1eXlISnpHQzBodGJJ?=
 =?utf-8?B?Mm95QW81TW1MY2RVeUw2em1tTkpNVTJnc2pBK29NQmFzZm02d1ByNitJakRP?=
 =?utf-8?B?QU1wbVZrSkt5b2ZyQ0RrZzBpUG5adHBsWTd2QzFJemlvS2UwcUxCSUtWMysy?=
 =?utf-8?B?YkpxY3F2WUxRQVliTlErQ3I4WGkvM0Y4SXBpVjg4d3dnZlZ6VU81K29tM2xw?=
 =?utf-8?B?NENSN1M5MkF1djdkR3NxelM0Vi9vdVJjRXlWZFo2RlppRnJ3ZjJrUnN3V0lY?=
 =?utf-8?B?RSt5L2Q0djNrdEpubkFkOTYxM0RnVGJ5bERZK21SbUxrTlYyaXBnN1RWSzNX?=
 =?utf-8?B?UXpuNVdVNk1NVEtLcFhwd0lKallkVU1BVXh0ZlZkVFoxNWVuaGphUldUWUs2?=
 =?utf-8?B?VmpxTkN0cktjVW8yWExIWGE3WmVuOE9xQ0MzQVlZbHZsQmVNeThjVHF3N1RP?=
 =?utf-8?B?Y0xZckp5S1k2N28rTEdHWGt5RUliZE9xM3E4K0p1MCt4NW5EazhxdlVjZ3Fh?=
 =?utf-8?B?NWdtRHRGTDYrVUZXOHVCVkNNZS8veDk4WkR6Z09vdTRSNXlIWHcwczdDaksy?=
 =?utf-8?B?d3hJU2dVdE1oMGIyYmZjWE9tMXRmOGhQL2ViUGV2MFk2NUt3cHgrV2wweTVt?=
 =?utf-8?B?em1Ia2FCOXdZY1FaUzJUdWZLbDdIYTRzZ1AyNXhvQnQxT2htY0xQN3BWSzB6?=
 =?utf-8?B?U0E3SE5jTkZHOThDL2xkbkVxSVdJb1daY1U5NWg2aklIVmJGUk9JeUhFczY1?=
 =?utf-8?B?SGlidUVaRDROUHNDMmNMYXM2azc0SXVwMUxNQlN4N0RpYTAySzRKem5IU2Z4?=
 =?utf-8?B?MWVOMFdiVzdTRVMrakRoeC9hMVpBUkVxZytlejdna0xQdEpkc21SNzZxNHFr?=
 =?utf-8?B?Y3RmQmZBV3BuTEgwangyVmJsYkptZEJpUHFVSmthSFF1bFNQQmoxeFlwcDFF?=
 =?utf-8?B?ZGVLazZDV3BjMnhlenM5YzVUcEc1YndsajNKdWN0TWhndXZCbFpVZVZwamRC?=
 =?utf-8?B?YWZZVzAxZWt0UjNQUXA1bTNjNm9Ddys4YnhWQXFwVWJHd2QyQ2JVaThXc1NQ?=
 =?utf-8?B?bHREendWVzBLZHN0OWhodGVtUWxvY2JTZFFtNERsRlo5TWhDK0wzbmR5QUc2?=
 =?utf-8?B?OXQzRXJOYithTkU3emZaQUdNa3FCVEZIdUVqQ0V6UlVKRHRWUjRtYkIxd2wy?=
 =?utf-8?B?WldyWVZLVFlqZExMcm1UUmdGVEl4cFlyMmRRWjVWU0owL0htQVJ4RHNqOW9p?=
 =?utf-8?B?bzF2b1d3WEhiS3piWlVWTjRrS2pPQjBaWVRKRWhReGtwaGNpTHZJQ3JndU9n?=
 =?utf-8?B?aDFNL2JXOHlndExYK29Sd0JGVk9OZkRsa3Z0ZFc1SHFEbzlvVlM2blk2TEpk?=
 =?utf-8?B?SkcvajRlWG5ZeWVXSStMRzZmaGlYNjdacWtMYkV2NHRYS0RXbjBKSDFKcWk4?=
 =?utf-8?B?anlvT1FjVnR5aWxMcUFaZEY4cTRhQU1RRkpmUi9UNGFvNENSUVBYYmE2aEUr?=
 =?utf-8?B?dVpEY0Y0WDYveWhwcHZ0UlB6WXJBcXZUTGJrcjU3SlUxTzNDSnBZRTVDUXRz?=
 =?utf-8?B?VnJJTTlOM0JYVlFxS3JIcGp2UFdRT2pvMXd6clBGd0N1cnVaVzNvRFVqNW5G?=
 =?utf-8?B?ZFBZemthTitKY2hZbXQxYU9wdUMySlJtSDh0U0RYdGNzdS9YODNMUW8vQnRy?=
 =?utf-8?B?U0VtNDREWS9SL3BJNzY4ZGUrR1N0Y1ErdHZOWVB0anBPKzFWUW1nTVFyVHQv?=
 =?utf-8?B?K3MxL1BzdW40Vi9zOXlqOW02eXlrNXdiZ1Z2UyszWDJXNE5ZQklFK3NWNlkz?=
 =?utf-8?B?dnc1V2xDNytJV1QxZ2hmYlJ2VDNIV1hka2xlcnk0b1dGY3E1dFFMUzMxKzhq?=
 =?utf-8?B?UUNLYzZlTFhQbWJ0WnF2bDREQUVqYXNVSE9EaTZFaFpPcFIyeFI5YVRXYjdt?=
 =?utf-8?B?cVFYZVIwd1RSaURrbGcweFJyLzVtWjIxY2VNdGRxcGhIbUVuS2RWYWpmSmNG?=
 =?utf-8?B?MkVpVXg2SGVDWFdEVDU2RHc4K0NBOGFTUTRaYjNkM1ZRL3VPekRORnBjMGFx?=
 =?utf-8?B?YysxUHUvdnRYUHN0T1liZHd5NExvQmg5MUFnNW9mT2NlL3pwYyt1Wlhlb0FL?=
 =?utf-8?B?bzFjaUFxaDN6WmtCWWZTakJwdU1xdzhydHoxeGxRMDN6TDU1NnpTSnIzUWxH?=
 =?utf-8?B?OXgxZG81TFAva0ZiV0ovYVJsaVJzc0Rpempna3IwcENZUXVsejh1ZEErb3FV?=
 =?utf-8?B?TlFRV3BZM0NWTml4dFRoSExwTzArd1lHTGx0OXB2WVRaYyt5Ymh3L0ZBd0ZS?=
 =?utf-8?Q?D00ecX7CBjZXNrqE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43eddb1e-6a1c-4613-d80f-08de53883578
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:16:01.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGOHN3SLnUK0xQkR7wnL0AyDB9GMq+9AGDOYCckzzE7j4ZZbPB5Sr0jdPXQKqkXbpDzjuChRu48jYDHt7TmwDt14fgsMag2z67b+khVg1P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF20F246184
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

Maarten Lankhorst <dev@lankhorst.se> wrote on śro [2026-sty-14 10:55:02 +0100]:
> Hey,
> 
> Den 2026-01-13 kl. 23:53, skrev Michal Wajdeczko:
> > 
> > 
> > On 1/13/2026 1:18 PM, Maarten Lankhorst wrote:

<snip>

> >> -}
> >> -
> >> -/**
> >> - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> >> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
> > 
> > nit: add () after function name
> Seems to be about 50/50 whether () is used? Both ways are used extensively in xe, often within the same file.
> > 


Based on https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
we should use ()

Thanks
Piotr

</snip>
-- 
