Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBB4CD13DF
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 16:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E4810E778;
	Wed, 12 Nov 2025 16:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nW8yacg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975B010E778
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762963892; x=1794499892;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=5kgb4MyI5qtJxKGPsfC12oZWo0B+RDUqVSeJrd89d3w=;
 b=nW8yacg6OG6js7zDWvh6BMRLWgRflJ7BR35BWyWhOcDxmmdzlZ0eiG/q
 e0csw1L+y3EYQ4ks8wLV3gLDdS2NzQw5O7ydpWsBYNyLjSs71Sy6YyRCY
 F/S2+z/7sn61i/r9r8GAlWx23ysdQ11C0iEA/bKCaHhNKhUx42KG1cDS/
 vnxFeE4NW6lIodmurZ0KgsJGy+eT/uN+6pILQ+S6jtJZRSOv13iA5DIzn
 1p+gNv+KgQefDDVL7VU+QShHIcLsHiKKUIHCKeUM4RjlnvNOZ0EFDYl+b
 cYyU/moWKTBp7aDwGU5sZeg+Ui1Ow4O7e3tX+OXxD8WPOYkD0JQhcOp2x Q==;
X-CSE-ConnectionGUID: f+gQkNAPQmG0BBhlSuA+FA==
X-CSE-MsgGUID: emMJqYMMQhy/tkyPAyvBAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87672042"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="87672042"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 08:11:31 -0800
X-CSE-ConnectionGUID: 2AJowbh4RJ6YnLdnc6kmgg==
X-CSE-MsgGUID: P6RNWwkBQOi6feqQU+DO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188896854"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 08:11:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 08:11:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 08:11:30 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 08:11:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsuPrZ8Ha/kcweJL8Ia84TOTDc34qFAYRWdv6CZVSVlInme63ZuJ5sbVpHRhSnWelZPkAg5FE68p1v8m2z+guwzqnarNfIaZ553AHHZOODLVtpOaSmrYijTcYaVblh1yfvDssmtt+Nf2X2lDH2YLGSC9UtE9WiwXsVXUmiFGT8ge45mcVpwS93SgmBgBpNpLpMvl7sHvMyaoo2doB8TVfNp6EJ+Gka+zMX61oXTb6YI5yp1D7QXtRRWXkuFVsW/Qbbgyu5QcOm8jT9mciY+pr14YzO/49cKwISw6jkUK6uxEz1BT9lvMTFrVhDRAxbZoVqy+NLvwRS+N6n2aARE3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqGaBg08G5agmnnWkk3KCy3iwctQ3OB8apWIfAAycLE=;
 b=PI5cm3NUrb4sqUGUUScZUSBFuRoWZnikXsyE+KWUNgldjfaDQkH2dqYgtX+3lMoWod5YbXWR1s/dG/8NU3sIi4QwrbtFrnQ6VX2mk1zI1JkJ4BreaS/zIuc3XhBV8Efa6ko/5uQC7k+4EDwylbipx4W+/jKswl5NXa2tHhyH49D30kp3gBBnlQLFiSw+LaDCahCFRWLIyaF4eufW0I9fOkrtRAXwbc0jTmlcH/YOixSKycgwCbIefmU74kLDbFpnzQsPKVrd3x7JONZByQYAggzJkvm2YkrcrL5Orl6xAfIBBJdTAV2Gvzhhnmg3wMUchAHG4L5OryW00rkm75wlJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by IA1PR11MB7728.namprd11.prod.outlook.com (2603:10b6:208:3f0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 16:11:23 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:11:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-35-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-35-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 03/30] drm/xe/oa: Store forcewake reference in stream
 structure
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 12 Nov 2025 13:11:12 -0300
Message-ID: <176296387269.3698.16678156020305233314@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|IA1PR11MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c50c057-715d-4bb2-4b46-08de22061ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlNEbUd0MUJlazhvbVFDQ2FZbEdDOVZwUk5INU5nempxQjlYVGlZUkxJdGlk?=
 =?utf-8?B?NGJNVm9yams2aG55VXB0bGdMZC9Bc2tYVHZMSUlNdnVSQWl6OGdzclBXRkVX?=
 =?utf-8?B?YjU4RVoxQjArL2JjMU5xbWFQay93WEFTRFRWQkNRTVN4RnFvLzRmUUYweUE4?=
 =?utf-8?B?ZGlaZ1NubXZyZnBvZmFPTkMrQ3BBdjhKeGNEek9nbll6cVFXeTlzRk8ybDBC?=
 =?utf-8?B?bTRpc01JeEZ2ZHRoYUVwZHYwakx1c21iVjBvdWJmMllVRzQrMGxJZHpraXFo?=
 =?utf-8?B?TDBXWjJheVJweW9TKzFOSGlRN2ZmVWlpaVZvZjZMaHozaTNmbFpNVkJWb1hH?=
 =?utf-8?B?bmx3YUZEeVZoYUpwdE5KVHQ3NUZRWmJqWUI1aU1PU0FqaFVOcEZSbG9GbzZF?=
 =?utf-8?B?RklqdEFYVjZZVTZWMGtMYlhEaVdWQWhDOVdkS2Z5bkdKMXpMUXBtYjd0Z01O?=
 =?utf-8?B?ZUYvaHZNeUZ0TGFDbVM0RWFLMUZML3h4MjFQdWZqVjVVLzQxUHVvNllpc3M3?=
 =?utf-8?B?MHFYWWVFbkpvZWx3ZHNyVHZjaXN1bER2dUN4SHJORHliNlBQMkp0SWg0endD?=
 =?utf-8?B?VVFoaXRRV2c5anNveVhBNWNQUUJTUTd6RG1wV05hMnY2YUlUY0VYa082VzNr?=
 =?utf-8?B?akt3aHlZRFZPTE14aERZck5NNkpWQ2lsVGRKckowNGRHMTBsY2c0eXY2TUdP?=
 =?utf-8?B?dFB6NnRuS3oyZHJ6WWowd0xCSHhrR3lSQytaL2hQQm9pQ2N0Z2w4cWFHMzJC?=
 =?utf-8?B?SndJL1lvWko2anhEYk4rY01WZUUwNG9uR3ZkVmNKaUpnQUdxNVJyc2pmK0Fz?=
 =?utf-8?B?eVdGRmZNYiswNDBCcEFCaDlnenhlemxhQ3AyTG9Qc1luTStwNVlGWjRoNDdn?=
 =?utf-8?B?TGt3WHVSNUxzR3p6V1R2OWwxeC82aFFWWVRNbUxwVVRTdnVtSWJHd3JRaEhj?=
 =?utf-8?B?R0VwV0hZVWZUd1dhbkFwRldnZEgySlVXT2RiZGhiZVo0dk5xcTFyUGhPbXJV?=
 =?utf-8?B?d1VOOFN0dVowN3ozdVQwbHBsNUczQm1GbE9zL2FDcXpmTS8wOWUzNnUxV2Nr?=
 =?utf-8?B?STRNWkN2djBLa3hHUUJlZHBhNVNIRWtDVGtwaGJsQXZiVWxmMU0wdXdHbkps?=
 =?utf-8?B?MVlqWU5HT3BQK3FoUnNXeTJ1UlR6ekpvZ2ZIR0pEUE9acTNCZFBONTZwVkZX?=
 =?utf-8?B?R3NMNGExNXVVZTBXaU5QZjFQcnNNZlFEc2RlK1dKWjUydkgzSlFYSE03Vkpj?=
 =?utf-8?B?cFpMYVpPTTI3ajZBdm1zWVQxZTZtTGNrU29KUS81eW0zOEg1NEtyd3lheDNl?=
 =?utf-8?B?bnhFK0MxaGhydGoyL3JRd1AySUh0aGsrMWZuLzIwSUJ4R3RGQ0RSSHVpTFdL?=
 =?utf-8?B?V0JoYWFsbGJ1K0tSRlFqT3RzWVV5aGhJOTJDNUg1YVE0S1VoRXA5NGhLS2xU?=
 =?utf-8?B?eVZUc2VrVzlSL2N0eVc5L3luOTE1TWVEbkJUMFA5VDhjMFFHWXcvQUFhaEZV?=
 =?utf-8?B?b0VPaVlHaGlXbUNVYWVTbEFvUEY2QXpPRWxpWEJmbXdva29hK2Y3WVkzVGNj?=
 =?utf-8?B?bEV4RkZ3enF0ekppQzRKUWMvREhja3RXT0xVdlYrc2ZuOVdMdWkyMU44UHNO?=
 =?utf-8?B?cjBibzlLemJSUDZTUkdWWndNaVo2Z3hIbnBuaTZScnduMjVybnlMUlNvVlJi?=
 =?utf-8?B?bFBYQTIyQnVQSGpMeXFaQUlwU2dQRVAxclZqYXRGMzFFZVJ6UkdsMUJIamxT?=
 =?utf-8?B?TkU4NzA1bUdxdnJiQlh0WWdTZW95UFJ1OVg5L214SE93bE13YWxQR1FhU3Iz?=
 =?utf-8?B?MGVRcWRSd0dNTmlLVXZwRjRNbmMzdk9oRjdtZ09RSWIvdVRud1FuUnhJT05y?=
 =?utf-8?B?NkNzUm1MSEZJdlU2TzhWT08wWEZSY3REU2pSNnBQZ0NPWHhjeVhsczZZajVv?=
 =?utf-8?Q?xg9wm2b4ESPI330xD0lTvKJT55RMxFNj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpvR1BIVEpkME92a1pacVJPQnlpZnVXZWZMMXRUcEg4YmttMXRLbisyd0Jo?=
 =?utf-8?B?NysvMUE3dVFYTDQ1b2xVSWpyN1RUa1AwYU9RR2dLTWI0Q0MwN3ROZGR2Mk5i?=
 =?utf-8?B?N29xYmpyT1pTbll5eFRRKzNKaUtJT3dOUjFPMU1mdE9jWTdxOWhDeWk2NURB?=
 =?utf-8?B?ZXlBZGEyTllFNmtQZU1XakVaeDE2SEVGd0g1Sy9KMXZidlJNU0hFenNUUWJN?=
 =?utf-8?B?cUxqcnJ1TExVU2c2TVdKWG5xekpOYTZzYVpqUjc2REVlMVRHLzJiVEVwMDAx?=
 =?utf-8?B?QmlHTWxDUm90ckRaMGZ3SDFEdWt2MnZ2ZE52cm4vOXFWcG5UOXFPMU9sTThp?=
 =?utf-8?B?Vm9DT1Z1Y0Z2V1oxeWw2V2R0TGxSZ04ramVld2h1Qm4xRm51S011eUJ4VGhZ?=
 =?utf-8?B?ZTdBM2lROFhDeGVkZ29nd1BQaWFJMEpUU3FFZmdPaDBNK2R3cEZXZ2hzWFZX?=
 =?utf-8?B?VkN0WDk2dUR3b2lTemxkL3hsaWtQeGNYSVVQVEc1SFJiODc1NWdDWDdBZXhC?=
 =?utf-8?B?djNsTkpTNC96Q1BVMVZxbUIzaThKNHNlMmtZcmlxNjBhaEJlK0FpTkV4Nkl1?=
 =?utf-8?B?ak9PNTV6MWJ6a2FpVGdvcldLaEpwK1JRa2JoNHFYRnFnQTUrZDZQa3dKYktt?=
 =?utf-8?B?UU1XcW1qWDFoZEJ3NGhmeU16cDZ1eFd0bEJqQW9wdlJOM2MreEo2NU1oSU9w?=
 =?utf-8?B?Z3ZYMW50T2pVTXRscFFJVmxiZDV2eTFZaGNHaWI0a1QveGpWUHgzNFJpcVMx?=
 =?utf-8?B?b3pGcFI3ckcxMEdzVk1mK1RqMmxNSUFKdEhRL0V6bzhGSnJUdjBGNWlkU0J0?=
 =?utf-8?B?VjhvZWtHdWhZT251NjdmalVDWStjNWwvZmpCWTdWRVRnYnVjMk03ME9nQ1dC?=
 =?utf-8?B?TkczWmtSZFNjYXRUS01wbWYySllieXV2c1ZCOUc5cWh4OGhmWHVkc3hPRll5?=
 =?utf-8?B?RnFFZUR4cUlocHRuSzBldGNFYVZXZGtQaXRQL3JuRFQySHZIVzIzODlMMjlp?=
 =?utf-8?B?Rk5WQXl2akpIRlIwelVsNEJsakY1Y1ZJaXNLbHBRZU5obk5QTDJTM0FPeG1B?=
 =?utf-8?B?VGV6V3RSRU1LZlMvRkVpU2hUYTBxSE9MRW9JcmF5b3NiWFF3Z05GWmtNMU51?=
 =?utf-8?B?RGNhNkJoOWZCb2sreU9VNzFlWG9qL212ZzRlNEsxRkpNbFE1RS9RdnRSbTgx?=
 =?utf-8?B?MnQ3ZUtqTFprVmlJVGNYY0hmaHRyVlJhRk45bi8raXY3eEZwNDM0L09tNjhp?=
 =?utf-8?B?c2hjZE9rUmsvTUI4a2Q3cHdzSHRWbHdNbm5GemQ3TjFmSktDWU5OclAvc3J4?=
 =?utf-8?B?Zi9RRkVnSGFVMFZJS0NLemdLQVBDZnJLYXZNQi9JY2NpVTVWUDFqQWlsZkdv?=
 =?utf-8?B?N0ZJYW1ja0xyWGtWRkRSQWI5c0tjYzBiNVpCbnpmOEJ2cVE2RjRRaytrWkMw?=
 =?utf-8?B?azJjWDAreHlyOFVTYmd0K3puV096c0d1MXpvSHZWSFZBRTcvZm96L1p6MWVl?=
 =?utf-8?B?SzB4QldYbkpmMGNBeDdIQVpKYmZiYlUweWxXWE52Zkx4UkZsZHNDaVkvV1Zz?=
 =?utf-8?B?Z3NFRGhOQmNJM211Ukhmdm9CTXZkenM1c0Y5dmVkMG0vbDVNSmRWaTZtTnZu?=
 =?utf-8?B?d0RYUVkybUd1RUZWMi8zSk9jOVpMTVlXZHQ4VFJVUmZkYzNicFJ4VGdGeEcx?=
 =?utf-8?B?YjljSFhnQk82Wmp6ZlF5WGRUOFE1amF2OEREZkNQOEt3Y3g4UHlTU09aNGFy?=
 =?utf-8?B?eGl2UXNSTWRtcnk1MGx0dncwblkzbFYxdzNkRXpLQ0l1SGx4b3h6UmUyb1BS?=
 =?utf-8?B?UG9BVlU2bm1vME5sL3JBMktIcDJ0V3hYR2RkcThPZ2RPV3RmcS9pUXk2NVRa?=
 =?utf-8?B?S0NCM3JlRVFVVlFNRnkrdmVMSGZ0WEg0TWlCbHRnazNNT2ZzdStBTkUxWjdZ?=
 =?utf-8?B?WDFtZ1Z0K1BwQUVVbmx3UlU0THkvdm5aZ1RnN0l3V1FxNkwwanJjc2M0VFB3?=
 =?utf-8?B?NUd5aDMzUWFudWFidUdTS2V3dkErNkFDSWlVdWhtalJxU21NT2VoTUZ6ck9u?=
 =?utf-8?B?MTNVZ0pMYVhUTGpNcGdnY05NUWRDVlV0MjBPVWZmQnhDbS9sd1lDekFzZXRk?=
 =?utf-8?B?clVhVVBrcHFkdmR0eHFCUXdpblVpTzB6UGRZZkF6dllZOUNBVDdNeE1DQVRq?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c50c057-715d-4bb2-4b46-08de22061ed4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:11:22.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExVBAi9snZG5nuNb+GKT/HYpeJYd+PwnwvnrfaN8cePT/Jv8IRVAWZ7Jxamj5AqwQ+sqtcup+M4629wF6MxPMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7728
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

Quoting Matt Roper (2025-11-10 20:20:21-03:00)
>Calls to xe_force_wake_put() should generally pass the exact reference
>returned by xe_force_wake_get().  Since OA grabs and releases forcewake
>in different functions, xe_oa_stream_destroy() is currently calling put
>with a hardcoded ALL mask.  Although this works for now, it's somewhat
>fragile in case OA moves to more precise power domain management in the
>future.
>
>Stash the original reference obtained during stream initialization
>inside the stream structure so that we can use it directly when the
>stream is destroyed.
>
>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c       | 9 ++++-----
> drivers/gpu/drm/xe/xe_oa_types.h | 3 +++
> 2 files changed, 7 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 7a13a7bd99a6..87a2bf53d661 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -870,7 +870,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *=
stream)
>=20
>         xe_oa_free_oa_buffer(stream);
>=20
>-        xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>         xe_pm_runtime_put(stream->oa->xe);
>=20
>         /* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable =
rc6 */
>@@ -1717,7 +1717,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *st=
ream,
>                              struct xe_oa_open_param *param)
> {
>         struct xe_gt *gt =3D param->hwe->gt;
>-        unsigned int fw_ref;
>         int ret;
>=20
>         stream->exec_q =3D param->exec_q;
>@@ -1772,8 +1771,8 @@ static int xe_oa_stream_init(struct xe_oa_stream *st=
ream,
>=20
>         /* Take runtime pm ref and forcewake to disable RC6 */
>         xe_pm_runtime_get(stream->oa->xe);
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>+        stream->fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_A=
LL);
>+        if (!xe_force_wake_ref_has_domain(stream->fw_ref, XE_FORCEWAKE_AL=
L)) {
>                 ret =3D -ETIMEDOUT;
>                 goto err_fw_put;
>         }
>@@ -1818,7 +1817,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *st=
ream,
> err_free_oa_buf:
>         xe_oa_free_oa_buffer(stream);
> err_fw_put:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>+        xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>         xe_pm_runtime_put(stream->oa->xe);
>         if (stream->override_gucrc)
>                 xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.=
pc));
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_t=
ypes.h
>index daf701b5d48b..cf080f412189 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -264,5 +264,8 @@ struct xe_oa_stream {
>=20
>         /** @syncs: syncs to wait on and to signal */
>         struct xe_sync_entry *syncs;
>+
>+        /** @fw_ref: Forcewake reference */
>+        unsigned int fw_ref;
> };
> #endif
>--=20
>2.51.1
>
