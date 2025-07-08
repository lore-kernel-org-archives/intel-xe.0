Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710CDC83F0F
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 10:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF6810E17B;
	Tue,  8 Jul 2025 10:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pmd+vIjC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9823C10E17B
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 10:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751971902; x=1783507902;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0YGImeRT35cS3Sq33AeCInzABQ7to8y5dZsi/8Y/Wjc=;
 b=Pmd+vIjC7LNLM+n4Qnon5lysMOmkM5hOT9KaWtIU9duJ8rTwSpg6fIbh
 mh3iyaG5KcQWgK/PlNDVDgM9dZq8Tyst7nltHEJdcmDwWTRSA0UzuvGk8
 uvHskQmok8YU1COpTu5NNen5dhL9qm5FtJaW3Sioj6xIXeGsR7+xMRsph
 93nZLUQamlUjQtmi22A4W3VVswgXwfP0ehLC7+x4raj0vBE49+fuzPCXS
 hlsSy6HxBc18p2uZJybIiar+Vi9Akll3XeSGGY9Wr0kWYpgEQkZbukbyc
 olfEylgYVBLC9Hg29874WMv/RVLfhwZhaptsoPbjBlMI+8MaCCmn9DcyP A==;
X-CSE-ConnectionGUID: BjEm9Q9vTCCpuBHlOUjIWg==
X-CSE-MsgGUID: J1m/NZ7DTNWEvspuTnB1bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56817394"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="56817394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 03:51:42 -0700
X-CSE-ConnectionGUID: pbkYs35hQtiIV9JS/CEwJg==
X-CSE-MsgGUID: KHbVxf5bQHW0HwY+QYT3IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="159731443"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 03:51:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 03:51:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 03:51:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 03:51:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyS4h4w6kJDxRsyF9Us2PnD2K1GgALsSAiyNuY8T8kWm2OZOac+oB8qf46+1+WEf5FzijZC9QfoWo72SgOx10kbhnqzcWnHy4jBVtB5zgGRnwagpiNz9dHyzft1qx/jgmkYh26XDItAowWHwyXdFtZGkDSyOstuiBNeVvA324QAvw8nxZWErJBR7yuMutlr16eKXkJasfYARb02OnoxBS/8/vHmr3P8e7VuX6tWfWk/DUgZoNBcbZm1uKJjM+pSoazkKd7XkVQ7HhtDIQl2HSZxr0u2Fuit51BWMvTMVSyU2e1X6L0sGnT0I1xKb2vLBIMSVrj6zJ510THpRwaDLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyMcz44U7IQEwo46vllqgqwn/H/QQlRrcMu/E36SxOA=;
 b=WfURBvsnWANBPVeMSyuRar8kI5N6ycKEFfqiPtA9xKEONnsxnEVgWRgJcWDBXBpPdnPlmFgTPQ7lf7i9KAWRuIja8NOGsS877DYFK5DIfh8/iOyMq5VP6TnFXTHfkfw3uxDWgO3OwrZdT1tjtFAuGcitt79H9YXhLk1yzv8i8unAXp5wcFUJoi22ErPd/RbCXe3UamGH5oct8BYrgEOKY+OuC8Snjt2tK2yr4gvDJJgR+IUO2ZvX88p9RPqAhv3ZWy7WjLULxJc8rA53jYTm7d5oV5B79iYT/GlvoOGkm/oZhmvItMEM40lVi66Vuwh0fM+CHR+2GEWIS9p9vjgmDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by SN7PR11MB7995.namprd11.prod.outlook.com (2603:10b6:806:2e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 10:51:39 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 10:51:39 +0000
Message-ID: <d615d77c-8ed6-413c-a48b-deeb5647b2c5@intel.com>
Date: Tue, 8 Jul 2025 13:51:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk, Konstantin"
 <konstantin.sinyuk@intel.com>, "Avizrat, Yaron" <yaron.avizrat@intel.com>,
 "Haimovski, Moti" <moti.haimovski@intel.com>, "Freiman, Didi"
 <didi.freiman@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
References: <20250624155221.208338-1-ilia.levi@intel.com>
 <SJ1PR11MB620416C3A3736C7F9DCD070F8140A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <SJ1PR11MB620416C3A3736C7F9DCD070F8140A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::6)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|SN7PR11MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b6e5bac-71ed-4450-f257-08ddbe0d6ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1ArMlo3OGNxY2EwMXZVUzdxTmlnR0Jqb3p4UFB1RWVtc2VDaHdVa1NwTStJ?=
 =?utf-8?B?K0FqT3pXT08xUnIrUmcyZEtXazVxSjRoSVBBOHVUeGowbmE0aGhuRDRUNlBG?=
 =?utf-8?B?bGQ2NEs2NE1DeVRHUVJMRngvc09qWW1iSWVwakdKSDNZU0JTa1RHMWtQOThJ?=
 =?utf-8?B?ZzFPMFBwbUlmTXJ6ejNuai92ZTZKUDhKdHNwRXZiQnAxQ3g4cU1WeDFZNWQz?=
 =?utf-8?B?ckZHOHRRemFhY3NDaS95dVFyaHVQNmllODYrV1cvcXNIaHVSTG5BcXNGSVBV?=
 =?utf-8?B?bmtXVERhVlRNSEIvUW4xVGcvL3FBbytCUlMxV1VQbDl1aTkyQk51cERubG5D?=
 =?utf-8?B?SC9MZVZ4SW11SGR3YVpaSUM1RVlwVWh4cHZobmdQUEJJZ29tYWtOOGVUUDdv?=
 =?utf-8?B?MjVIWGltVkJYRjFRNTFWeXZDdG1nV25ETlhlTXFJeHFHQ2hyanl3YXlEZ1B6?=
 =?utf-8?B?SEppZjZ2RCtPS1J2OTNCempYbFVvKzZnNytUKzBjMyt1TFpkNzZZU1p6ZlQz?=
 =?utf-8?B?bVhrSm1tSkgxeWM5VE5rbWcvNGNVZU55TGFVT3B2UzZOTmFuRkhNYUMyYm9I?=
 =?utf-8?B?bzlmTDJxN1pGWklUVmdZSEduRGJuaCtVcDRrVURKTENhNWUrT0xjVHlqcHlp?=
 =?utf-8?B?b2VlM1RXUEFuUTdJUXdOY0xza1MvcjRYQ2R1L1Q0QjF3dUt6cmYrdVR5RlF4?=
 =?utf-8?B?RUl4L2R1ZDY2TjhXT3VsZUM2NzhMTUdiV25iSXhUeDlOY3FIL3JGQ1JJemZC?=
 =?utf-8?B?Z3VHbDVqTVdiOVh5UFFKa05FN2dScTB0SEZIditMdjNoVmVqM3dWUnV1d3Uw?=
 =?utf-8?B?djdsUVV6N1hDbkhkeUVHQkdwUzV2Z0FEaE5iVE9aOVR3bUdLNkVpL1JUcCtM?=
 =?utf-8?B?TTVSMzVoTEtLdGFtSVd2N1Z5UUtsWklYaVE0d1ZLRHVWWUZVL2Y5ak9ONS9G?=
 =?utf-8?B?eUFuYWVseCtuQ2JRUVYxMzZoV2JzSWxHckVpeDRieUV4c1BxZ1pXYk5MUWZy?=
 =?utf-8?B?bDlhRlViN1N2d1k3OExkempib2JXa21PaGIwT1JJakN2MXF1S0x2d3BNS0Fj?=
 =?utf-8?B?Y3NWeTNLWnZmR29ZM1dydVYwbDBGcXlON0I5ZGptSDk4R0xUQW4rdW5tcWtv?=
 =?utf-8?B?WHlraWI0QXIydFZNeFcxWHRZWGtwMmdTeWthN0VhbTNidDNqNE1hZ3hxeldU?=
 =?utf-8?B?cW1FaGc4MXEvRDE3eWkrTDNhVG9MQVdBSURHNmZvR0M5S05CSkE1d2o3T0NF?=
 =?utf-8?B?UzJVZ3BIb2tCRUNVL050NHd3aytNZUhKdHV0YjkxOVZ6am55VWJiOHhNSCtq?=
 =?utf-8?B?QTdyMm5KMXUrVW5Rc2d2b0NzRWxJRU0rZ2c3N1VacFlaWEJ5OWxVVC9aVzlv?=
 =?utf-8?B?QzQ1MiszMmlvajRLOVluM1JUTytHWWV5bDJneVpNSFUzTVdzOUNRaUdrQ1do?=
 =?utf-8?B?YTRBVWlSZC9RVGhKeFZVVks5c1Zjb216RlRFVzN2Uk9waDh2ZUhzL0hMQm1h?=
 =?utf-8?B?cGRZTHN0RXpUdWluVnA2dnUzSExlclJ4SjJELzhvWjg3MEk3dno1a3kvVFZ0?=
 =?utf-8?B?VGMwNXFUQUNSSzBWWHNYakJzbkNKT0picG81MGxCWEc0WFp0bk9tQXJJYmJO?=
 =?utf-8?B?TmxXbGppNUdPSDVFUW1QbVpRUEdtYzA2ZnR5RG9qQm9XblRzUWttMUI3MkI4?=
 =?utf-8?B?MTVUSUFzakJjZ2tZWWthSVB0ZVVPTUxTYUN1dWJSdEloZm5Na0ZZR05yK0hm?=
 =?utf-8?B?L0FlRVd4QXU1bkd3OW1BNktWSDNCajhya2wxWFNaR3FCc0VuSFRiNlhlTHE4?=
 =?utf-8?Q?5JwPSjkPPh/mat430vPFo7YaSKZfjfWwCarjU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzlMR2xkZkVFVE91VG1mL3lFeFhNQmsxanB5L08zeFRudGx5bDIxWWN4SWtl?=
 =?utf-8?B?UXQ0aVdyK0ozZXc0WlpLZWxXWDR4NEdzY0xaQWExeWFXU1V4dFNxeUdCcWxL?=
 =?utf-8?B?K2ZqMnA1cTN1M0w3Y1JsZEdxTzE4bWxvQ0Y4SGdhUEduMCtKVm1IRkZaV3Ir?=
 =?utf-8?B?aExTaWh0NkU2d0wybEgrL1BIaHlVenNZY2xUZldUUjNHZjNTcUdGd2lsZHY4?=
 =?utf-8?B?SW9mVEpUbWZvMVBLdVdWV21RVzRLSVZmaW5HU2N3WlZnK0lHRCt6UUpZdHZH?=
 =?utf-8?B?NExoOG1sVkZnVlkrckEyUDdkcXIzdG5HdDM3c3pzUkY5OXo2YlNEWVFxY015?=
 =?utf-8?B?eGFBU2d5bHcxMDJzVmYvUlU2MGRFOHpoWEJ1RHZyemU1bEVXc2NNOHUvQW9h?=
 =?utf-8?B?bVdpV1c5UnhrNzJVQ2wrVTROTWlDTnA1YWlLSEJnWGhpR0puRGdmMzFocTZX?=
 =?utf-8?B?eFpFUzAySzh3T2p4UFlUSk0rZUhXcy9OTkErNVMvU2JDMkdqVnlzMldybUhp?=
 =?utf-8?B?UVJjbVBrRHB1alV4WFNhdGtQdXRBOFV0ajJyL0UrOVd6elFVUVErcDdleDVI?=
 =?utf-8?B?TkhuNXBoWHhkNW9xRElVYnRPeSsydWp1eVdKR05kQzdZUE5nSFp4TXVNc0ZH?=
 =?utf-8?B?Zm9zSU9iWCtBWUtKYUFxYjFVY3hMUW1EQTR0YzlaQmdhdzAzWnRDZW53NUl2?=
 =?utf-8?B?eWxjeWhkR3o2aUFWMWltWC8yQlhsMHdRL1dRYlByY29wSmZwcTlGWHBxRFVM?=
 =?utf-8?B?YW9MQ1V4SVhqRWZZc0dNMWt4V3Q0UU5ZNmJRc2JaaGw3QlRhZXp1MVh5MG5q?=
 =?utf-8?B?VkRmcW9PU242NGFJYUZjYVRxQVBDK0tsZjFkY0NiNFhiWVpEeXd1aDlRT2VI?=
 =?utf-8?B?OVdzb2MvTXFyd2hYRUZHbjI1R0JBR0kwVUZEWlRVWVNjQnJyR2RObndqMGZF?=
 =?utf-8?B?UGlkRU44U25qWjlBZVgvNk94eUdjcmx2QzJvTzc1Mzdsb3B6OVBEUTlxdXZz?=
 =?utf-8?B?TENyd2NBQ3VmaGJJRXBGT0ljbjRzN2dHb0JmQ0h2L1JSWTR3WlFxVSs5dnFB?=
 =?utf-8?B?OFZtczhBR3AyMUsvY2N4SlVwY2RGMkRidVp5QnFiNG0zdDl2OFVXQi9FRG1r?=
 =?utf-8?B?WCtVREY2Vy9EeE1qWnl0UzlqTkpsU2l6NUpiNmR5STNkUTE1bUtqQ2RaNElH?=
 =?utf-8?B?T3l1VllUVTcxUi9IRWM0N1I4M3UxQ2F4Mno2alpCcjVpNTlFM0pWNVFrU0Yz?=
 =?utf-8?B?azMrZXVseFE5Rk1pbFRjdEtTSHNQVkZ0M2lzRHRLMkR4R01Cem8xWVV1TEk3?=
 =?utf-8?B?Y1FvK2xNeFVQaW1EMEdBckJoSk9UMEEvT21nSmRJamx3THpYYjQyMWw1Mk0z?=
 =?utf-8?B?eDVEbWE3ajU2QUU0Z2xEbmYzYkFpNVhrS0N2RXdUQmZTdUpNTFJ5dU5zTFkv?=
 =?utf-8?B?b2VNRzBpelVCNHVZR0ZpWTc1cThqbEM5NWpZRmhUTVpCV21kNnZvcm5aaWlu?=
 =?utf-8?B?YlJURytmditydDJLdHRwMTZTVmZuZ1JnbTR1ZGJOdUNZSjdFY2R4YUNmYmlU?=
 =?utf-8?B?N0xxWTA1VDBCNDFsZlQrTWVZYndGSXZDZFBEWE1DbW9aYlpCTXl1d3E1NURx?=
 =?utf-8?B?RDJJUld5VzJITFJJV3VpdG9icUZTQktZMElWZENISFM0c0lTNHJkNkFQWFhR?=
 =?utf-8?B?czltUURuODF4UDQrUUYxUWF1VGxmNzZCMkF2ZWxIMUJuTkQrWDQremJRcG56?=
 =?utf-8?B?SElyOGl3MEUzblh4U3ZSeE9IMUgwWTR3V2hRUGQrbEVYdlJqZEI3TXhGZTB4?=
 =?utf-8?B?Q3JqMDVDMlRBazlBOTdvTk80SEdvSEhJUFY3cTB1dVkvTUNQQ3F3a3dWay9L?=
 =?utf-8?B?RHozY3hEeFNDY21PMm84T0xUNUZNc1BDL005MFR4emVUSmFKL01nUHk4dFUx?=
 =?utf-8?B?Z08wQk90TXVzYlptN3FoVnc0S1Vndmp2UjVJMEdjTzFlQlVBbTh4dTUrR1J3?=
 =?utf-8?B?OXRqSEZCb0R2QmdmMWFBVzBHaURKSDd3bVpVWW1rRmlXOFhhZVFaSkZtUlln?=
 =?utf-8?B?SW1xcHlRZHgrK1N4cy8rS250YkUxY21PWU5RN1pQWjRFTG50bFlhUVVpYU1i?=
 =?utf-8?Q?vmT8uPKS6BGCBsxlrAbh+8cjI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6e5bac-71ed-4450-f257-08ddbe0d6ac3
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 10:51:39.4174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMylO3XaYEHd5RhYJ6SWwJeeaHFJYDl+JSCEN8m16rj0vZlramBLhWeeHP55uIpPYiYu0cuwOeLN41erxDKkxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7995
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

On 02/07/2025 16:25, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Levi, Ilia <ilia.levi@intel.com>
>> Sent: 24 June 2025 21:22
>> To: intel-xe@lists.freedesktop.org
>> Cc: Levi, Ilia <ilia.levi@intel.com>; Elbaz, Koby <koby.elbaz@intel.com>; Sinyuk,
>> Konstantin <konstantin.sinyuk@intel.com>; Avizrat, Yaron
>> <yaron.avizrat@intel.com>; Haimovski, Moti <moti.haimovski@intel.com>;
>> Freiman, Didi <didi.freiman@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
>> Roper, Matthew D <matthew.d.roper@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
>>
>> Allow the driver to expose hardware register spaces to userspace through
>> GEM objects with fake mmap offsets. This can be useful for userspace-
>> firmware communication, debugging, etc.
>>
>> v2: Minor doc fix (CI)
>> v3: Enforce MAP_SHARED (Tejas)
>>     Add fault handler with dummy page (Tejas, Matt Auld)
>>     Store physical address instead of xe_mmio in the GEM object (MattB)
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h |  14 ++
>>  drivers/gpu/drm/xe/xe_mmio.c         | 210
>> +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>>  3 files changed, 228 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6aca4b1a2824..22a567c5f0de 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>>  #include <drm/drm_pagemap.h>
>>  #include <drm/ttm/ttm_device.h>
>>
>> @@ -162,6 +163,19 @@ struct xe_mmio {
>>  	u32 adj_offset;
>>  };
>>
>> +/**
>> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
>> + *
>> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
>> + */
>> +struct xe_mmio_gem {
>> +	/** @base: GEM object base */
>> +	struct drm_gem_object base;
>> +
>> +	/** @phys_addr: The physical address of the exposed MMIO region */
>> +	phys_addr_t phys_addr;
>> +};
>> +
>>  /**
>>   * struct xe_tile - hardware tile structure
>>   *
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7357458bc0d2..3298ab0f1fb4 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/minmax.h>
>>  #include <linux/pci.h>
>>
>> +#include <drm/drm_drv.h>
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_print.h>
>>
>> @@ -408,3 +409,212 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio,
>> struct xe_reg reg, u32 mask, u32 va  {
>>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val,
>> atomic, false);  }
>> +
>> +/**
>> + * DOC: Exposing MMIO regions to userspace
>> + *
>> + * In certain cases, the driver may allow userspace to mmap a portion of the
>> hardware registers.
>> + *
>> + * This can be done as follows:
>> + * 1. Define an xe_mmio instance that represents this portion.
>> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able
>> fake offset.
>> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to
>> retrieve the fake offset.
>> + * 4. Provide the fake offset to userspace.
>> + * 5. Userspace can call mmap with the fake offset. The length provided to
>> mmap
>> + *    must match the size of the xe_mmio instance.
>> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to
>> release the GEM object.
>> + *
>> + * Limitations: The exposed xe_mmio must be page-aligned with regards to its
>> BAR offset and size.
>> + *
>> + * WARNING: Exposing MMIO regions to userspace can have security and
>> stability implications.
>> + * Make sure not to expose any sensitive registers.
>> + */
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *); static int
>> +xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>> +
>> +static const struct vm_operations_struct vm_ops = {
>> +	.open = drm_gem_vm_open,
>> +	.close = drm_gem_vm_close,
>> +	.fault = xe_mmio_gem_vm_fault,
>> +};
>> +
>> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>> +	.free = xe_mmio_gem_free,
>> +	.mmap = xe_mmio_gem_mmap,
>> +	.vm_ops = &vm_ops,
>> +};
>> +
>> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object
>> +*obj) {
>> +	return container_of(obj, struct xe_mmio_gem, base); }
>> +
>> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio) {
>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> +
>> +	/*
>> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the
>> trick below.
>> +	 * In the future we may want to store the physical address in struct
>> xe_mmio.
>> +	 */
>> +	return pci_resource_start(to_pci_dev(xe->drm.dev),
>> GTTMMADR_BAR) +
>> +		(uintptr_t)(mmio->regs - xe->mmio.regs); }
> Can you please elaborate which physical addresses mapped here!

Could you clarify your comment?  xe_mmio_gem_create receives an xe_mmio struct to map.
In order to perform the map, we need to extract from xe_mmio the physical address of the start
of its region and the size of the region. xe_mmio_phys_addr calculates this physical address, 
currently by leveraging the fact that xe->mmio.regs points to the start of the BAR. - Ilia
>
>> +
>> +/**
>> + * xe_mmio_gem_create - Expose an MMIO region to userspace
>> + * @mmio: xe_mmio instance
>> + * @file: DRM file descriptor
>> + *
>> + * This function creates a GEM object with an mmap-able fake offset
>> +that wraps
>> + * the provided xe_mmio instance.
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +struct xe_mmio_gem *
>> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file) {
>> +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> +	size_t size = mmio->regs_size;
>> +	struct xe_mmio_gem *obj;
>> +	struct drm_gem_object *base;
>> +	phys_addr_t phys_addr = xe_mmio_phys_addr(mmio);
>> +	int err;
>> +
>> +	if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +	if (!obj)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	base = &obj->base;
>> +	base->funcs = &xe_mmio_gem_funcs;
>> +	obj->phys_addr = phys_addr;
>> +
>> +	drm_gem_private_object_init(&xe->drm, base, size);
>> +
>> +	err = drm_gem_create_mmap_offset(base);
>> +	if (err)
>> +		goto free_gem;
>> +
>> +	err = drm_vma_node_allow(&base->vma_node, file);
>> +	if (err)
>> +		goto free_gem;
>> +
>> +	return obj;
>> +
>> +free_gem:
>> +	xe_mmio_gem_free(base);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static void xe_mmio_gem_free(struct drm_gem_object *base) {
>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +
> We can release fake offset here!
>
> Tejas


drm_gem_object_release does that, see:
https://elixir.bootlin.com/linux/v6.15.5/source/drivers/gpu/drm/drm_gem.c#L983

- Ilia

>> +	drm_gem_object_release(base);
>> +	kfree(obj);
>> +}
>> +
>> +/**
>> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
>> + * @gem: the GEM object to destroy
>> + *
>> + * This function releases resources associated with the GEM object
>> +created by
>> + * xe_mmio_gem_create().
>> + *
>> + * See: "Exposing MMIO regions to userspace"
>> + */
>> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem) {
>> +	xe_mmio_gem_free(&gem->base);
>> +}
>> +
>> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct
>> +vm_area_struct *vma) {
>> +	if (vma->vm_end - vma->vm_start != base->size)
>> +		return -EINVAL;
>> +
>> +	if ((vma->vm_flags & VM_SHARED) == 0)
>> +		return -EINVAL;
>> +
>> +	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>> +	vma->vm_pgoff = 0;
>> +	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma-
>>> vm_flags));
>> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND |
>> VM_DONTDUMP |
>> +		     VM_DONTCOPY | VM_NORESERVE);
>> +
>> +	/* Defer actual mapping to the fault handler. */
>> +	return 0;
>> +}
>> +
>> +static void xe_mmio_gem_release_dummy_page(struct drm_device *dev,
>> void
>> +*res) {
>> +	__free_page((struct page *)res);
>> +}
>> +
>> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct
>> vm_area_struct
>> +*vma) {
>> +	struct drm_gem_object *base = vma->vm_private_data;
>> +	struct drm_device *dev = base->dev;
>> +	vm_fault_t ret = VM_FAULT_NOPAGE;
>> +	struct page *page;
>> +	unsigned long pfn;
>> +	unsigned long i;
>> +
>> +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>> +	if (!page)
>> +		return VM_FAULT_OOM;
>> +
>> +	if (drmm_add_action_or_reset(dev,
>> xe_mmio_gem_release_dummy_page, page))
>> +		return VM_FAULT_OOM;
>> +
>> +	pfn = page_to_pfn(page);
>> +
>> +	/* Map the entire VMA to the same dummy page */
>> +	for (i = 0; i < base->size; i += PAGE_SIZE) {
>> +		unsigned long addr = vma->vm_start + i;
>> +
>> +		ret = vmf_insert_pfn(vma, addr, pfn);
>> +		if (ret & VM_FAULT_ERROR)
>> +			break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf) {
>> +	struct vm_area_struct *vma = vmf->vma;
>> +	struct drm_gem_object *base = vma->vm_private_data;
>> +	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>> +	struct drm_device *dev = base->dev;
>> +	vm_fault_t ret = VM_FAULT_NOPAGE;
>> +	unsigned long i;
>> +	int idx;
>> +
>> +	if (!drm_dev_enter(dev, &idx)) {
>> +		/*
>> +		 * Provide a dummy page to avoid SIGBUS for events such as
>> hot-unplug.
>> +		 * This gives the userspace the option to recover instead of
>> crashing.
>> +		 * It is assumed the userspace will receive the notification via
>> some
>> +		 * other channel (e.g. drm uevent).
>> +		 */
>> +		return xe_mmio_gem_vm_fault_dummy_page(vma);
>> +	}
>> +
>> +	for (i = 0; i < base->size; i += PAGE_SIZE) {
>> +		unsigned long addr = vma->vm_start + i;
>> +		unsigned long phys_addr = obj->phys_addr + i;
>> +
>> +		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>> +		if (ret & VM_FAULT_ERROR)
>> +			break;
>> +	}
>> +
>> +	drm_dev_exit(idx);
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..2990bbcef24d 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -8,6 +8,7 @@
>>
>>  #include "xe_gt_types.h"
>>
>> +struct drm_file;
>>  struct xe_device;
>>  struct xe_reg;
>>
>> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct
>> xe_device *xe)
>>  	return &xe->tiles[0].mmio;
>>  }
>>
>> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct
>> +drm_file *file); void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>> +
>>  #endif
>> --
>> 2.43.0


