Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16A7C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 19:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CD710E011;
	Thu, 13 Jun 2024 19:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XX9BJ5Dj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643AA10E0F4
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 19:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718305368; x=1749841368;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EojavdYT5Id2BD6pr6IPiuq96QiZot2Rsl+RIEmzW9g=;
 b=XX9BJ5DjgQ1Dgp+QLapigk6pBh6fiFekIaoCC42lr2aXgRcvFnN5ZOcn
 eTbWS7JDCK3pOrJXxbYlcnax5gVQaywBOg0xKjg+f3RlrjW8iE9+8adBU
 d6nuWGdC5ayPPeqjfzXzBIXu6R0EiA8HZZqOOKDcEydrmAefu6zeNDtu6
 Jk3RevhVDyqmeToYmCyqTFKuRwbMDNRULj6h4xe2YGT2h9F5y5G4HuxP3
 zNQZKiN8xNitUYYbaQCdsl6UilEkne883QE+FNkonbJkaSYwUT5KUjcBW
 JPhE5LEOqz2pivoR2XOJG94UWWfpM5eoS6rAfpDQ2LeP4LgvZ9H64bHAj A==;
X-CSE-ConnectionGUID: /ctYu7p5R4GDd0BiJgCOYQ==
X-CSE-MsgGUID: SOvIyo/3S1CegTdaHAmicA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="32637405"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="32637405"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 12:02:31 -0700
X-CSE-ConnectionGUID: XQRCe61HQPCDmJYBsLGBZw==
X-CSE-MsgGUID: y8lHLwaGTISfX7JydUI26A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40957826"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 12:02:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 12:02:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 12:02:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 12:02:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 12:02:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnjaVj6URt4CfHv9eE/Qvsc3qtKAzlXtVsVgWk2FuTEQbptdzGw9qfgcDIx4gMJNjNRETvUxXNH393BQ8Lsfrk6/QtKwxNbS32FkmU3TwU9Y331xQdfqcpk9GKjRW6TedjXhSn7QUL1dYMo87Hkkr9p2sIhoQyGYe8yxSy5LCC7p0IVZVBEN9KILuB7fSjM8kBAqDGnUSW6DFLDxTMhPZ1E4DAm83na8bdC3RrxsawVC66bOywH9rgNCJz8LERX0N9+cS6RCgi60hOa2uBjMojArfcCFFHmPUNBLBNSq1yjL7BTZG+km6tjCauBbtpYISBc65fg22Z86KXkttdxmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EojavdYT5Id2BD6pr6IPiuq96QiZot2Rsl+RIEmzW9g=;
 b=ab8wjxJLzBQmHATok3Z/9hf199TXd70C+jqp4oXRpeJH1Jza5kaQas0ROjbCPorejvADtS7/fX/g4Ep/Ym1Syj74gqLkeQqSUmhrEqn1UJzikIiKpuIpRY9YEEm8KvtVTCzYLHXKM7KrLGCv1WMBuNQK6jZU9j+YgTbBqQvxHDGi/Offe0J8KpBNME5798lnWn6mfzTPOapYk+ZD1A5nXoE+2TSA7Qnas6TbLsyKVNUQ8Y9vip0Cn+Bw8uM+iTffcOrKZXAOTaCucaddwIdgFkAy4oNCfa3uaic0FR9xJWTHylmThu9inYPZhxu+TMrrcMNkJH+QvZi+Z2BJEpFtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Thu, 13 Jun 2024 19:02:28 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%3]) with mapi id 15.20.7677.021; Thu, 13 Jun 2024
 19:02:28 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v9 2/4] drm/xe/guc: Add XE_LP steered register lists
Thread-Topic: [PATCH v9 2/4] drm/xe/guc: Add XE_LP steered register lists
Thread-Index: AQHauG7EgiUyKlTRO0u52PpM6tIKurHGF5gA
Date: Thu, 13 Jun 2024 19:02:28 +0000
Message-ID: <0c692e7c7120ea2484ebb9c1056b6aba609c97b5.camel@intel.com>
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
 <20240607000719.1012422-3-zhanjun.dong@intel.com>
In-Reply-To: <20240607000719.1012422-3-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6552:EE_
x-ms-office365-filtering-correlation-id: 3169ed22-8721-41f3-da4c-08dc8bdb5ee0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230035|1800799019|366011|376009|38070700013;
x-microsoft-antispam-message-info: =?utf-8?B?TFhqZExQWmFMK1ZVQzZvV2o2TVVoaUxib1dBa0UwSVN6aXF0MkxSWHozSk5l?=
 =?utf-8?B?RmJSSURsamQ3R2IrTjhDcytEb2Vtd1NlZnphZlhKZ1NERURFZHpoTEZCalUy?=
 =?utf-8?B?NlptSVJhQ3hNTkZlS2VrSG04K21Eelc2RTBtSVRrSllsalZvQ3JyVDhaT01T?=
 =?utf-8?B?NGNaZTRDWHkzUzdvT3loYzBoalhJeWdjN1htWVZ0TW4zSC9Jc3RjZ0VWV2x3?=
 =?utf-8?B?MlpDN3lvc0NKV21LTE4vZjhGWCtlT2JzOHV5alZPdFJVWXk3Z1REV0l4aXlM?=
 =?utf-8?B?OFN0a0NCSGNtenJWSlFON05HaHJRWVpYNklkNjd3cm9uZnR1M3lHMkIzRkVt?=
 =?utf-8?B?UUVXUVZKN2hDRWNVNEdFRXpiVkdlZjRDaXFnS1ByUStNa2dlUzhjNUxkRG9W?=
 =?utf-8?B?d2haYUU1QmxpYzVUM0xyVDFrOS9uT3lYNXJRN2VUVHY1UjR1ZWo4M2tXQzNG?=
 =?utf-8?B?WnIwRms2TklSZWpTSGdocktNUldSUFY2VUJQejU3QWVyOFNCWkpSa2RtZnNz?=
 =?utf-8?B?RGl4RUdmc2dwWWVIR1RvNWlRREJTeStjc3A0OUtpQmY2YjNBa3Jza05ScTdx?=
 =?utf-8?B?R1RCMlUyY1AzVURVZThJL09tVEtjSVhCMmw5UzRuay9SdlNjU3JmTzA3QzZ0?=
 =?utf-8?B?dUExbG1LaCtLV3VRMDJyUnB3Z0lzWUdoM2EreDJNRjFPRlFCTXY0My9OSkpo?=
 =?utf-8?B?bFVId0lBL3Q1TEtRRUU5a0dvb0tNeHU4YW9Na1hIWTBQcmRxT1A3QTQyakxN?=
 =?utf-8?B?eEJXenA2T3ZKRGRkOExKQm1UTlFhZG9yejQ1Y3BmR3c2Q1YxbFdOYWFFKy9x?=
 =?utf-8?B?YXpza28wOU1KeHJIWUM0L3ZDTldoSWlPd0Q1UlR5c0prazEvTTdoSHl3ZlZX?=
 =?utf-8?B?dlRBdFhoTXBDYmQvMURnQjRITmk2cEpXQTM4Uy8wZzgweDEwd2pzRng1RDJx?=
 =?utf-8?B?Z0hFY1RIekwrRk9DaHgrdVk0R3pQV2JSRzNqeVBSN3FRRmpleWc4ZWhocjJu?=
 =?utf-8?B?cGJVYVNGaUZmYUlPOVlCK09NUlNTUVFBaUdrYnBEUHpCSkFQbGpJY0liNjlT?=
 =?utf-8?B?RDJCdlI5dWwrS1Y1MzNJNU10Sjh1L2FYaFlmY2FCdjU4SkZyTlYzRDFwK2pS?=
 =?utf-8?B?NisydHZWVThuRC8wODYxNzlrQTdRRWY0R2dObEw2eUhZTll2dWNVa0pOWUdX?=
 =?utf-8?B?WGs4MGtwQjNOOGI2TzdUNnRLU1hJYlFLWUNOTjhsZ2hWTUFBUWVlbzZ5V01o?=
 =?utf-8?B?VzJIbGRzeUpLdnV1czEyaE1GbW1oR1Z2cjQxVjRZdzlteDJuWUoyWUlDSStJ?=
 =?utf-8?B?bnFUU1AwaDI5Mjc0WEtQVmRVRnZFVlJMYWFrZm1tVUVMVDdzY21acllsaG1H?=
 =?utf-8?B?NjdzQm1halU5cG1WMkpQSW1TaVgzM1NZaTBmUGNzYU9rRUFTekVJMWYxUklz?=
 =?utf-8?B?NklQdWRYcDRQbFpwNFNXVk0yZDVqSFU2L3BxWjZqbS9BSE5iK2J0WGhTTWVl?=
 =?utf-8?B?ZDRYMUZjeFg0YVdFWnl5QXlFSVV3ekJvcGVENSs5U0xJNlk2dmpkbzA0Z1RT?=
 =?utf-8?B?TSt4ajl3Qi9yV2VIajc2d3psUVhwNWdxdlp3Tk1pTkx4T2tvWm1ZN3ZlWEN2?=
 =?utf-8?B?NmpYcnVrWlVveUFrNnlqdFpBT01RdzNKYlR3alg1VFp0MWxqY01RNkhYaHEx?=
 =?utf-8?B?Q045cHN2R2hROE5jYTdTVU5ld1Jza0xEd0ZUSFl0RGpxdVI4TVVLQjViWHN1?=
 =?utf-8?B?SmRzY3dwL2pNdE9xdGI0QU1obWZRNVBjTWc0STZSZlJFN1FmR3BQbXp0LzUw?=
 =?utf-8?Q?Rz9ViLqBYFdPlf9Vy6Emyv+Sh7E+CP1m5CSr4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009)(38070700013); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjBqN0xtQ0NvNGh5M1JDN29nQ25TTDliN3pkaFNqNi9RYnBMMUdIZmxJb2RX?=
 =?utf-8?B?WGVVV2JDU3V6YnJYYTBUQ05KempEZHdvRVlMbDNBU2grUHloZzhTTGNBVURF?=
 =?utf-8?B?dGMvdFB0TUlNb21ZQzFZcVlhQ1FLY1lZd0dWVyttb0ZYMXFkb2lHdkkyRmtp?=
 =?utf-8?B?T2lXWkUwWXQxeDVydlV6eEVEb0FNOTBzVzBXamJvYy9GZjkyeExVZlIrRGVo?=
 =?utf-8?B?L1E3TU9Mbk5vTDNBanJFZTZpNlF5ckl1S091RElHSXVUUFdVdWxobE9wY3RH?=
 =?utf-8?B?M3JsOEk2cXhUa0MyYzQwNXc0MnNaODJaclZHcTBEUHluOVJQNnQ2ZGIvN2Uy?=
 =?utf-8?B?MndSeVd0dkl4Y1cvd3hhZExnTDVBSWVKeFI3SnZyUEJjOEJwS1NpbTJ5Y01Y?=
 =?utf-8?B?LzBUdXBsbW1KWjk2d1gvcnNuUkxZOXlZREhTZmdYemVFYlJCUW9XN0ZYWXhO?=
 =?utf-8?B?SE03blpsTUs4YXptamlzem8vQndvUlBveXBGMTMyT3g2WHNiSzZCa0s0Ris0?=
 =?utf-8?B?dHp2RFAvNWtjUElZeFMyRytzU0x2Qm56YW40Z0hjN0R3SWlmMU91cnNXYXoy?=
 =?utf-8?B?NnZiSmp4WkZSc2ttSWVveUx0K3NZTm5CT2thK2p0dk1hbHh2SEoyeWFHK1VX?=
 =?utf-8?B?YmVGNXVDSjk5UHVtTlUrMUpMRk14SXNiWktNYjcvc2JibzV3OW1JZmlSbC9H?=
 =?utf-8?B?akZQTlQ1RDJOOVFmdVVjSVlIMVZXYVJibndXN0FKcTdDTVM1ZStwSHJHSEVz?=
 =?utf-8?B?bk0wWE95WllScVdqOG1HZ1FESVVmTDEwWUh0LzFXaWlxSHlFTk1kangwa3FI?=
 =?utf-8?B?MUpmSGcrZWUwUll1aGpqamxOYncxenVZRzBDRVNIbm9kME5lSytmWWVnaWRW?=
 =?utf-8?B?eTU5cDl6Q21UZExYb0laWWJWQWJMZ1pybUorT3REYzFDSktlLzFXVDNHNWwz?=
 =?utf-8?B?Njh3bWFONXZCUUlrMXVBLzRGSHdWOWRoWlRXTlA2SjkyVUwvTCtFYVB6RHRM?=
 =?utf-8?B?TEZTaTlRQUlGMkdzZ0sydmJSTzdJOCt1SFczbHMrL0hvNHRZZUZ5U0YzUDJN?=
 =?utf-8?B?OVoxeGtXNFNraEdCL2dzbXk2Q1p1TTN6WE9BR0w5RzE1dktkUXRqbHl6Vm00?=
 =?utf-8?B?YmlnMzZPL09jWWk4QWh1UWxvaXh1MERTOHdlU2dQNVk3UGlKcjRjbUlQQUl5?=
 =?utf-8?B?TDlodG5oQ2RTWkJjc0J6d3A4ei8zdCtmWFJLUnF5S1dCTE5qZlNXWmVTWGQ0?=
 =?utf-8?B?UlJxcy96ejJuU1pwQXN5eENTVjRFUVhZSEZCOHVsZlZSMnk1RkdEZzZjalhH?=
 =?utf-8?B?R2xXdXBKZ3ZpZGlpSmR2VkRJN2VzdS9MR1dvQkJTV1k5cFMvckVvcXg2cjBT?=
 =?utf-8?B?UTkvYkNETHFwbjR3cmZISCtoc3RmZU5Zb2xuMnlJY2ttaXY0RUJUNE9mMzh6?=
 =?utf-8?B?UFdnUVJUQ0ZTTkFPZ3hVYTh3YmovM21jMkQzRTFoZUdacTVyZnkzVVRCWWZU?=
 =?utf-8?B?UXlFQjBuRW1jZDZIblB4NU5yYzM2R2lOL1pjREpxZUdxMnhuQ21HT0pxUkk3?=
 =?utf-8?B?L2dKUkJlZ3NNZFZmK2FwdlF5RjIzTVMvaHczZHFlUytoQ3FISStpOWViUFZK?=
 =?utf-8?B?MHZGa2FKcHFtTmNRTG5ma2ZNUUZqYnpidCs4cUxoalRLU04wK3NiRDBqOWgr?=
 =?utf-8?B?MUppSUxISGE1eFMycHZDdWJRdWovUXBjRFNVZHI1S0UzS3NjaXRGeE5Obk5C?=
 =?utf-8?B?ellqelZLQTJQQjNmMkdxZUhvVC9OcnFhRnVJY2MrU2FlWFFVM3BKc3Y3UzFO?=
 =?utf-8?B?U281ZE1XNUxjelA5UG92MVVpNkQzZXBlb3IrUVJoK3FKU3RwcCtxSi9KOEdM?=
 =?utf-8?B?VDQxOXc4RHl6OTJCbDVLRjk1WmFDNU5qVmpoZnNITjJBdExCSll6a1R6dklv?=
 =?utf-8?B?TWY0a3N3V2I2RmMvRHFsVzBOcG42aWw3UWVkME5qTUgrUmRPUUZBbWFUaThN?=
 =?utf-8?B?eVA4UCtNTTdWMk9qYnZOYnp3VmJZbUNqQVdxczh6emJSWG54T2pFb1RFU1ZF?=
 =?utf-8?B?K2h1MlltbkpHay80Z3NLZFZMdUhvb0N3ZUhtSWhUU1hjQmhudGdaMkE5aVpk?=
 =?utf-8?B?ZURTWkVxdzB2SGY2bGpON004MWRiRHRPTG4zSCtWKytmZkxpOEIrcDhJdXRk?=
 =?utf-8?Q?zmsavLlrR2uL9RS0taDgfmo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAE1A7CC691C8545AE3671BF6BE8D3DF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3169ed22-8721-41f3-da4c-08dc8bdb5ee0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 19:02:28.5574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZY1QLAm/A1e4e3b2EtQTMYhGEH+h5K338YcUEyCDn1CyhWza/Tpyzp7COOW4us5BGmLMKKxCeU0HM0r5O/EfSdOdDxWnb95BnOe+q75cmyX8rREPvOfUNeF4gVhCssM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
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

SSB0aGluayB1IG1pc3NlZCB0aGUgUkIgZnJvbSByZXY4IGZvciB0aGlzIHBhdGNoIC0gaSBzZWUg
dGhlIG9ubHkNCmRpZmZlcmVuY2UgaW4gcmV2OSB3YXMgYSB0cml2aWFsIG5pdCB5b3UgZml4ZWQg
dGhhdCB3YXMgbm90IGJsb2NraW5nDQpyZXY4J3MgUkIuIFRoYXQgc2FpZCwgcmVwZWF0aW5nIFJC
Og0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0Bp
bnRlbC5jb20+DQoNCk9uIFRodSwgMjAyNC0wNi0wNiBhdCAxNzowNyAtMDcwMCwgWmhhbmp1biBE
b25nIHdyb3RlOg0KPiBBZGQgdGhlIGFiaWxpdHkgZm9yIHJ1bnRpbWUgYWxsb2NhdGlvbiBhbmQg
ZnJlZWluZyBvZg0KPiBzdGVlcmVkIHJlZ2lzdGVyIGxpc3QgZXh0ZW50aW9ucyB0aGF0IGRlcGVu
ZCBvbiB0aGUNCj4gZGV0ZWN0ZWQgSFcgY29uZmlnIGZ1c2VzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUuY8KgwqDCoMKgwqAgfCAxNTUgDQphbGFuOnNu
aXANCg==
