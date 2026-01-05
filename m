Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233F2C79FB3
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 18:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7893610E277;
	Mon,  5 Jan 2026 18:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dud7VI8f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737B010E277
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 18:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767639271; x=1799175271;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=kgAqZYDH+4qOvwvmcU1HDRnnohpnZ4ugy4rsgiueKeo=;
 b=Dud7VI8fY/B5qN51wIZg0Pkv4Ozz0uIjhfQliv19JvbMn+Nw0VrsLxGM
 OPihVVFyE/lT48ZRqtvLSDtJT4hV7CC0+Isuz1BIQFHwpHncOh1N8peEY
 hu4pICiq9TrOpILinWGxnRVDUfPmJkvPFwv9YHaX3nGDAWp/2++XJ8tPp
 3wvRvGEOL9uA9F37ynL7aM6P/OVLdPXDwluwpv5jUjfHAB3qSLPsku8hU
 sAxN1o/n8/v2hp0KR7E5OtCUuGvWAjWbkYwgsQFZ75givJsvUru/oxGYy
 8Y0G88p3YToo6DfFii377RmCKnmSsSsvbXhUfNalABcqNeMQwG1LDn4bz w==;
X-CSE-ConnectionGUID: 4wDFlDnXTUOsb2R632+tTw==
X-CSE-MsgGUID: t/VLtcbPTAaBgr/fkMkBEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72854122"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="72854122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:54:30 -0800
X-CSE-ConnectionGUID: EIFIj2mkS6izbSupFvq7QQ==
X-CSE-MsgGUID: qHe4SniRTReydd137h+ofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207488633"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:54:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 10:54:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 10:54:30 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 10:54:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmyrkvtNlfvUyXQgRxr2CpzOvqKAKGap7SsZe4KwEcQBskwczzHFxEZYUma5GtSyNLiiro9lTUwMg2YVVsU7qWXf7a2bW0UbCCW9aNxSgmOmiipNOU3uaMndDt8S6GdiP9glpFIAHZ5ppp4YYfFVCei588/Kj1/WK2Rq/TsOvnkuYW3YyTEgYQfWk3aXJSp/iyQzTXIzo9zpgLfLFo6IvVVHTKhu40HkirUHRLvTVAXnfR2n8z4K7F8vnyklnQmeoICOU/o8n88EReHbmNpu6fkBUwZPhHDvNqOmbTy8UdiuJbvJmByVeUeQAAPJUCTpjT5P1jQ7fmyUkcmAiVHh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRyp0yuKkf0gJUE+HHItiumfpRQ603GWOg1laLtxUR8=;
 b=i4RixNTCEWYH2xRFiiCYoiiub6Z9zsGSOiQ74xX7yg1Db3w7MtSZESCQ7+SvRqmAcXd4/J3f7klC+KqKhMyhG9LIQgIg0YFj0/V5/S38VbDX5ykWNCU/uOF9cFVxD2mmbkV8MKjMEsDx8UUoeiVtrwfmMGM9WW7zQCEjF0ZeSPFYRLRPfd9WARW2a2rUeUUleFjyy2bp1X/uHxqRbX9VDwAYhRxJJDVFCJsQgXzq6tum0PJQWHibef+fWKm7TQ9SnVa8EbzNO5K+VyB1WUePRLQNr62ILT6Wrbjv1nlGGT7U33dJ5zGecLq7kBYpabkhtyAljhPrl4VnDjU2UcgGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:54:28 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%3]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 18:54:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
References: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH] drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Date: Mon, 5 Jan 2026 15:54:23 -0300
Message-ID: <176763926313.9480.16817172111730313247@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f75587b-79ee-4f78-1fd0-08de4c8bd9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXpQazdGUU04c0pIekZFbUYyYlJPMHpEVG5qZDk2R0gxNTc3aFFmRXdCQXlM?=
 =?utf-8?B?RlIwYmVoYW81bDVJZ281NTdZNldBNUZsSWNmMHQ1MnlVY1BZTVdFYTVHS0lr?=
 =?utf-8?B?bEVMVnFPNzd6NEpiN3YzZW9rTGdrc20rMmdVQVJMOHNkNWNaT1RsVnpjRzFh?=
 =?utf-8?B?MzZTcGxSOS9qRHdHbEZQdHhiOGtVQnhDK1djUUU0cGhqeE1uVjZCY1ZHT0ps?=
 =?utf-8?B?aVlwZWp0WmRJcVRPWnNqV09IUUhZaGFaeVQ2TGFGWjR6cEUvYXhadmsvc3A2?=
 =?utf-8?B?ZnRxOGxxWnB0WHlDWUVzelJKL3RtTGlCeFF2eXdGYnZUbjFqdFFzNlNUN1Uv?=
 =?utf-8?B?L3lQcUtIZWVaTXBYV2l0NklDRlgxYmJNVEN3QmFZdWJzV1hXbEE4ZUxhUmUy?=
 =?utf-8?B?ZEhreU1zYnc5UGwrclcwU1A0YUtWeHg1YjBENXNPT2NRbGdEN25tVG85enZq?=
 =?utf-8?B?MGtoQytIQi95VWVkYko1a21oTWFNS21SaWFEU0dJZnJXcVl0aXZvRVBJSWwx?=
 =?utf-8?B?bmMvK0U4QUN1K0FTRW9PNGlvYm9MVnVjRFF5Z2d2U2NuYXVKclNpQks2K1h3?=
 =?utf-8?B?Y2E1ZzFJQ1k3WTRlcE9sQTd0RzFGS3BNVVhESzdlcktNVHdmNmxENHdJWHhK?=
 =?utf-8?B?bGlPQjVtYWRJNStuUWR5UkU2ZTFPZ1BuYW9KRHI2L0hKays3d1ZpaThLSGhY?=
 =?utf-8?B?cmQ5akRobU9FRkltSEJwNnRIQjI3WG44VFp1UVpnczdVL0VMaWR3WlJTZFNF?=
 =?utf-8?B?MkhxV25KWm9TU1pKMkVoczFCL1lXdlcyT0M5dStuemZ5TGxmMUcxZFA2WDJV?=
 =?utf-8?B?YmF0aVRVTWlTZXAxcVhhZHRpLzE3UnhZZ29acUFBVDRseTllaGpqbStPSE44?=
 =?utf-8?B?UzF2YXVvYmFlN0VXWEV4bEpiV2p4cHBmQmNXUTB6dFlFdHNmN2MrR2NVUms3?=
 =?utf-8?B?MWZ1ZDliUk1oZDdhUm5qd01FMW05Nlg4cytoaThha3RScGFOWVp1RExnZERF?=
 =?utf-8?B?V1N2Q0lHUjZGclZSbEExS1dhZTF0TllocUYxSWJaSWgvYkZvZEMrc3hPQmF1?=
 =?utf-8?B?L0FVeWxDQkREZTlCVERFanV4dlozMUhWWXlRVVZpQkxnZHIxVXRyZ1d3TFMy?=
 =?utf-8?B?YXI3WWNWNGR4aFR3b05kaXU1OGJHUG5RQ2lHbkpuTDRiQTlCWmNYL2VDM3ov?=
 =?utf-8?B?Ymp5ejl3eVloOEJUQmwxeDVsWk5yeHladTBVNkl2ekhTYllFcHlBVXFhWnR2?=
 =?utf-8?B?bHgrT1RxQitHNEtWcjJKYkdIalJWNG1mbTBWeWJKeUVSei9JKzVmR3lhYk1G?=
 =?utf-8?B?ckRKb2p6Z1VXVEFzMG8xMlpxdkFTVitLc1QzOXhiMmtuZ2hTSmlubk55OWhx?=
 =?utf-8?B?azRyb2pDcVpiUW1SSTE3cUh4M1RUSGZvMURTR3h3OGpablNrcDdxcHVBa212?=
 =?utf-8?B?UGpYS2hQWjh4V1B3eEZrY0FhK2l2UGpMR1VQMEdkT3p5NU1rUWxIc2o2eEZu?=
 =?utf-8?B?Z2dTSllDZ1Z6UGttNnlhVGJWZmJXYVN1UnhPMzlWa0lNdUd0eUU0clE1STAz?=
 =?utf-8?B?T1R4Kzl3OHgwSzAxbmIxWUZOZWM5TmlEd2hENVBZbXdvZWord0NWd045bHJY?=
 =?utf-8?B?UVpRKzBOdzFGTklZM0p3VU9RUHNkTUNPTHB3VTZtSDlhOUszcXpSSGEvdUN2?=
 =?utf-8?B?UDV4a3dUMFdCdm90K20zYWR3NitoR1JRVjdnbldkSktzWlBNVXhSeG9jWGtT?=
 =?utf-8?B?aDZLcVh6Q0ZOdE1KWjhCVFZvVUZxVTNYeTVodUtXSy9hc29HTkx2ZVFJVGF1?=
 =?utf-8?B?RG9yY3JGTVFZVVhFTWZnYTZTZG9ycURvN2VMbXhMOG5SbGdQZzBEV0d0Y2VM?=
 =?utf-8?B?ekFacVFmTktFb3EwOHBiOTNpREJNdmdtMTRYaHQwajU4ZklGT3pLanF4TGhY?=
 =?utf-8?Q?hj3/S0K6Va2SQAO+0F20ekqA1BK9OR12?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2FMWTlheFErdWloaUZoSk9iWHl1Wk11cHN1V3ZaRUtOZHUwNml5MDhHZkZv?=
 =?utf-8?B?RC9acFRXalE5NkdGY2RpK0xDanFORUNweG1CTEQ2aWg0RnNNWDR5MDNFT3Nt?=
 =?utf-8?B?dUxwL2hyM0JFaExmRHNzbmxVVzM5alNKclJPbEJFVWNVMXFldlBUeVhOY1J6?=
 =?utf-8?B?elRFT0MxN1hUSUV4N3FXdERjbHFBejhnVmp2Q1dad2dmeUV2U3NyY0FFS3Iw?=
 =?utf-8?B?WnVnT1V5V2xMSDQ4UGwrZ2RrSkFJclVzaGVHMStmbkRmUjVTSDVMRkYrcGdm?=
 =?utf-8?B?YTI0MnNrK0V5bmwxdlRyZWZNSUtCSE9QeHRUUXUrY0tselFiQjZ1eUxLS2dm?=
 =?utf-8?B?bWNKZHd6aHZKVkN3eGNoVDEvUWtuUjBIMlNBa05TNFZONmE2YmxVSHJYdzRx?=
 =?utf-8?B?cmFGNjFVWXZ3b1FaRlVaTXc1cXdHTDFWQXVGbzdBOG4vTGFUKzBydlNnY3ZW?=
 =?utf-8?B?RTArTnA1cXN3QlpiZkRTb0hyZ0RlTEZIVnRxNXFEbi80Snl2amQzcmNzbnp4?=
 =?utf-8?B?b3RKaFl5R0JRMlZnRXVXN2tOaVNkVWVPam1xVzl0K2tLNGdDdG9USTBqSlZl?=
 =?utf-8?B?MGpvL0M0T1lpaVBHNDVVQWllZVNweHhaTEM5THQxaVdOanRrME1rOVJxdzFM?=
 =?utf-8?B?TjgxQ3hHeUM2L1RDY2hFbXF1dTNDUnRFQnBuWUYydXRxUCtPZnJQNVd2a0I3?=
 =?utf-8?B?akIwam1TVE0zekVidlp6TTQzdGcycE55emhXUTNsVnBiRUlyVnhjZ21RWk1F?=
 =?utf-8?B?YmluK2p1d2dJOUh6ZDRXbkxjZ24yaHhMUFVyZU9UWXB5VG1aZUhSZlBqMXlm?=
 =?utf-8?B?cTdIR1MxMkM2UVluWXIvellPdGY1eEtmazROR3kxOEcvMmNuaC9oZk9HMzBm?=
 =?utf-8?B?Z3BZamRvSXM1dXhEMCtxcTN2OENsaWN4dWNEL2VwQWhISWVPUGNLMDNpNXdU?=
 =?utf-8?B?VDJSL0pubWVIWDhpemtYWnRrMmsxMEkzZ3M2QmZ1dG0yM3c5SGhGa25sUkdV?=
 =?utf-8?B?Yis2MXlDUzE1WnRZM0p3Z2tESm1BVkJGcU5ITVhPWCtCd1B0ZmhzVGZubmRB?=
 =?utf-8?B?WERheEhuTDc1dEw4TnpORHFtRWdWcms3RmpNNTFSR01qYUMydkpydjMza0w2?=
 =?utf-8?B?ajNWeEN3V3ZpL2FRdGdzVHBLL3lDZitTVGlDMTlwa0g4ME1DTVdtTERxVEhZ?=
 =?utf-8?B?STltZXBDT0pITmJyNml3QmIzdW16TzF2aDQxNjAzWkhibEtnaWZnOHdMQTFW?=
 =?utf-8?B?WU5wQXp4UHB2MmJvSEFPZE1YSlQyenpIMTBjeXF4bzRpTDcyWXdqQ1Fyd3Y4?=
 =?utf-8?B?ZXZ6blU1bHAreFVvTENaNkdDdGZHWVpWK2ZxYnVsYkJtRXNVQVY3UXozZnFy?=
 =?utf-8?B?TnhiNUh1Wk9FN1FrdEFxZGRiYUw0QWd0ZkVMa3R0QlFTZnpldnE4cVh1WnNh?=
 =?utf-8?B?MGJhaVNUWXM1aGFIZmlMa2lXbzBsSk9QQ1VtVEhDUTdqSS9XUXJXUEtvYXFS?=
 =?utf-8?B?aThMMHZyVTdaMmI5aGxQU1lUWXE4UTR4blcwT0pwbG9uYUtvc1JiSnVDeWtr?=
 =?utf-8?B?QmdTYnZBNHBRK0wrbEhLOUVUSVgxWjhWRkZybkt4NjgyMVJCZGhhZ0ptb291?=
 =?utf-8?B?alFONlFlaytNUnQ1UVh0KzhFWnloRHB6T2w4NHByWk9PamUxaWtHOC9WbWlh?=
 =?utf-8?B?YUswUnFUSlF3TUVOa1M1TVF5ZWJ4eFlMZnFoelMrdEJaNVpib3dtYVp5MG95?=
 =?utf-8?B?eXljeUZJZFFJS3oxenExbVFQYlVkQ2xTUEtHR0Vtdlc3dzhKQWliZ2pNd2Jv?=
 =?utf-8?B?TDJLQ3FDY0hPNnpuRm1HU0VuZHRtZlhUWW1peEJmTFlqeTREZUFJU01JTi95?=
 =?utf-8?B?eVVzOGxVbUVsTHhPTkdnQ3JmOG81c1gxb0lkUUpNMERZeUtERnpuRTBBNmpJ?=
 =?utf-8?B?d0ZVZ0drRGJ6S2dORXNsb2l3NnNrL3lIa09SNlM0eG9VNXRXQUlCY25hOWlV?=
 =?utf-8?B?a2F4a1ZNWDBiUmM1SWlTTVQxa3FwRGdiOE44WEE3RkI5M1VMUTczVDI5ZmhB?=
 =?utf-8?B?NE5FTEkzVHNabU9vL1liVm84MUtLeWh4cEVlVWR2WDQyM3E3aDdxZ2ZiWVFE?=
 =?utf-8?B?OEVnaUQ2Y0RGcWNmS3VEa2NYM0c2MkRZNjZNZ1JqNGY1V3NldXc0a2J3elgw?=
 =?utf-8?B?bFlpUHY0ekY1NFRnQitNSmZvVlhEZThpSXBPS1hlbVBDWHJHdXhsWklsK1JS?=
 =?utf-8?B?WE5mc1NTTFdXVzNjdm1MUDA3VnZiQ0xpVGViNzFXbjBDcTRXS3E1NmZCazV5?=
 =?utf-8?B?STlSS0lKaE82UXlyWWhqY084cFdiWHc0QWg2dm5GdjFSdnBpRWMydz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f75587b-79ee-4f78-1fd0-08de4c8bd9f1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:54:27.6648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQqzWuuJePp4WGtOOZ9000945H+LyZTSB97+Dt9Zma3mCf0Ayj0ZzHqaurXIl+Iu/iwCFvlovn4Ynck7eu6NRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
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

Quoting Lionel Landwerlin (2026-01-05 12:02:22-03:00)
>Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
>("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access")
>
>A recommended tuning setting for both gen12 and Xe_HP platforms
>requires that we grant userspace r/w access to the
>COMMON_SLICE_CHICKEN3 register.
>
>Bspec: 73993, 73994, 31870, 68331
>Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe=
_reg_whitelist.c
>index 1391cb6ec9c62..4dcbc42574bf5 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr register_whitelist[=
] =3D {
>           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(R=
ENDER)),
>           XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN1, 0))
>         },
>+        { XE_RTP_NAME("allow_common_slice_chicken3"),
>+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UN=
DEFINED),

With XE_RTP_END_VERSION_UNDEFINED, this spans to any current and future
GT containig graphics version 12 or higher.  I believe we need to limit
this to 12.74.

--
Gustavo Sousa

>+                       ENGINE_CLASS(RENDER)),
>+          XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN3, 0))
>+        },
>         { XE_RTP_NAME("1806527549"),
>           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(R=
ENDER)),
>           XE_RTP_ACTIONS(WHITELIST(HIZ_CHICKEN, 0))
>--=20
>2.43.0
>
