Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CE1E6F08C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 21:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A482310EA00;
	Fri,  1 Nov 2024 21:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkyHciIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05F510EA00
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 21:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730495841; x=1762031841;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x4SS8rkEAyfvviZdwyYRYOi58iDX/ia/hnqzppCr84E=;
 b=TkyHciIYipJR0Pdt4mXyb4QZvQ/4TZp7QkesvZAr5UzFZ0qWzCTzJmDT
 /Wq66zj/B0L2cSCGiJHHuowy2ZiwTS9JjTQ+KasGwWf6fUEbUK3vJ2FCp
 MnK6hS23NWUJIX8rmvin5wFspm2EVSygQieEq+/15cg7L3nDYEK400ov+
 iLj3kf7V94OKVFTsR07KPZ2vcXJL7Gh7VW0rkfMqjC+6aqpMihpYMGviE
 yGR/GUf9l+PxQ8lXY396KtG7xxV8mDvoKp9rf9nP3p03pt64bk8C8X1VL
 /pBVhNdG4/xxCSlqc7s4hxqWJfSGd9T1icpvTuhmWjbShFH9DZqC5GN9F w==;
X-CSE-ConnectionGUID: eu6GQ0BxS3GOIaQ1TwdQXg==
X-CSE-MsgGUID: YojunlIwSzuCsu3CNHvJuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="47764098"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="47764098"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 14:17:20 -0700
X-CSE-ConnectionGUID: CEwyXWTJQEGnXETlYUlXnA==
X-CSE-MsgGUID: 1igPlOzEQfOTbRlJczDFkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="83207263"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 14:17:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 14:17:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 14:17:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 14:17:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEQKs1tm6tZCDiEJrX529kLJNI1/Iqkdp4aFDhvbvwnspJ0vkhW87YMvtNBhByrM2O2GZZTZBc3HONSIdkXfOpRxBm+AIQNJRITyJsgjgvdHyaYe6EPlpp7cIJM4id49wZ/Mb+hbDAaUpwhYwYtGkwg3NdNySA4IRe097zEzUU1l1tHOxYAa/vq1p43wFaoFIxDSoCkgROjbJtU9MDMfKVdbQEqXwWoMUBON/ae0RdZgOUl4wFtavsyVaK00PMVmDs0t6G/2MG9wnQrRnVozNqvfbGpzqH/7HisKU9yMQPyS0imq6q1UPgrQiIYgipDKZfkzWBKZWiDkbgz9G8NeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFTCCP4NF+t8t1CEccUuoaKe1e2HBSsVROb2aU4E0dY=;
 b=Cv/kDZMZrTzMN1dnybvVyE8F6WRKn95L0dYGRnXX868FZKc8nawd4RhFHUDOMBeMPtyDYqdQyrh5RJmjXCEtO4Oj9vRAcyGvKfMsfoT8SS3JE9SnUlkhOKlvqOi7HvG6EdXVukyfuyevtVab2L1mAlx4GroQTWl7Gj3xgYZIv1BEYOJQqF11WqhxPQHoxAFEvYx1rO8vRSF5d4vi53M1J7UZ8Wt+BhuMrxi75Ba04FxyFemE2o9NGVofnNCyPbpNbgpSRroPYsIvM3tdZP7IuC3yfkra4d0Qjk08u0bzlW+a3PSTtaqtO+HzAsFzi0nSJdG7ahLwloSM9S3AIOi+0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 21:17:14 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 21:17:14 +0000
Message-ID: <f491b7bf-78ef-426c-b07a-53ca0ba23bbe@intel.com>
Date: Fri, 1 Nov 2024 14:17:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Improve devcoredump documentation
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?=
 <jose.souza@intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-2-lucas.demarchi@intel.com>
 <ZyRrisQfc_59rrK-@black.fi.intel.com>
 <4kw2zzb76m42zbisvsy2fu52q2litchy6dfl4hyrmvze5u5dvk@hjs2pdynjemd>
 <ZyTutrXXD73sofRo@black.fi.intel.com>
 <49fb16e0-8cf9-4d2c-b783-1ad851bf9dd0@intel.com>
 <dpxgkdqk4xlqfezu2xdig63di2nbsim3einoyf4uqytygfxttx@n32pwkzfpg2y>
 <2lm6buuc56u6awcerm4qjjphrhkdha5a4askhjnqsusj727xhu@d3l7xdlecqbt>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2lm6buuc56u6awcerm4qjjphrhkdha5a4askhjnqsusj727xhu@d3l7xdlecqbt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0070.namprd04.prod.outlook.com
 (2603:10b6:303:6b::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: b7debeb4-e93b-4363-ffa1-08dcfaba8eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dCtpSS9YYytWaktKbUFLUUxUcGxOSkcvTGxYWWFNMkRNQ0JzaXFSNkZxS2NK?=
 =?utf-8?B?NmZoTmxoNjVpYVhTc3VNbVNiSnEvME53azQ0bmZodHEvaGhRVGJ4SVFmNWEv?=
 =?utf-8?B?Y1ZYUkxUNVNlc3poVlYrbmtlRUFFWW1PZ0l3dzVaY09sY0dKdzBvWDVCTGp2?=
 =?utf-8?B?ZWZyL2JPVkZvVVI1eWZRY0JvVkNxQUUwQ0t5d3JDaWNRejhTOU5kaFF1cFRT?=
 =?utf-8?B?cExpd3Bkek5NaGlhUmZMaFB4NnhFSTJScVcrckdnN2laQWRPdFJqWHNtckRi?=
 =?utf-8?B?bnE0bXZTaXRFNlgrWEhMbkZjZks4eWRjRmRLc016T0RMS0RUVzFqSGs4dGF4?=
 =?utf-8?B?Zyt4RGZQVHJZRHo0SURTdHc1T3RKaUhTbU56dUlubDVYd0pLV1BJa3lKUzE4?=
 =?utf-8?B?YlFGaXhNVFlBanZ3SjREaDhQTk1JdjIyQ2lCS215a2ZPdWlHSHY5cm1TUVFS?=
 =?utf-8?B?Uk5vbGcwWXFIS2NBaHJpOFBsSEFPSDRzb08wWXFrWDFRTVRHeFAraXpTaFR6?=
 =?utf-8?B?YlBYSlNrR1oxZlh4RlRMd3BDMlR5UzlLdEpCdVoxUGNyNUhaYVk4SEhFZ2Zs?=
 =?utf-8?B?bGhMb0pncUhoZDlJYjd4TFBrQWZLcDlJN1lTRE5nUmcvRUdDcDRqQWVZQXQw?=
 =?utf-8?B?dzRxTmFrTU1NWGFmMFBlYmE3WnBKaFc5NW5HK2todTA0dTJRa3BwTUpxT014?=
 =?utf-8?B?YTRFcFdVcEtWZ3pIOGxWRnl0blh6TWExK0NCM01IK0xXNHJTL0d0ek5kSDUy?=
 =?utf-8?B?RzEwOC83d24vU1YrZVlRYk1xbjNDUVhsMjZ4UnRrZk54Rmw1TFQzUXA1NjZW?=
 =?utf-8?B?SXljVlVPQ1djQ0p2V0V4cUhtZDRHRTVxd2pIMUN1dFlheUduWGRSbVlzekhB?=
 =?utf-8?B?bGVRLzJNZUZURm95dzRVZFA4Z09nM0I1eGczNCszMUpmVGJIZEFPN2NPSzAv?=
 =?utf-8?B?UERKVFRwNEFUNUczN0NPaElsbGRNK0tYSzN0ODZmYVpwY29NVCsyRzB4TGtM?=
 =?utf-8?B?dFkvM3k5eGJicXM1dkZpdVk4YlpDYWZEbGl6Qm15RGE3SklieGhKckZ4YlRR?=
 =?utf-8?B?R2ZCWjdDWUlRLzBxdU8xdVZKVnNPOUJad2FJb1QySDVPOFdaYU14MnVXcGdV?=
 =?utf-8?B?bWZwdzFTeHJDRW9VUUpNdnVDNGg4bVQ1WkRNM1RKbHpzUVdQSkZtcEZHUE1q?=
 =?utf-8?B?K0hBODFRaXhLcllkWnI0VU1wT3c4bVgybHAzTzJyazNGbzhSM1NhM2xiU0Fh?=
 =?utf-8?B?UnY3L0ZxaFVlYzQxZFFBT24xNktHa1BrdU1QaW9PYWhIVXZLWi9hcjBMR3JY?=
 =?utf-8?B?Q0UzQlNGRzhXUGFmcHJGdkxJTE5sK1JQYkUzd091dGRjdC9pejMvbmJHU2Fk?=
 =?utf-8?B?eGVwVHZZa3FkTFM4d2YyQnFVeGNweDhtTTlVcWpMLzNCTHRyY2pybDgxYlM3?=
 =?utf-8?B?a1htVXQ1SGZRbnJVNjdlYVc3NFJuU2Era0pPQmd1ZGVnTnBHTVNKNGcvY3d1?=
 =?utf-8?B?YlMwQmFIdFVIakZhK09pVjdsMTVGWWkyaTZWekxvK1VXOUVaUHRLb0xTenh6?=
 =?utf-8?B?bENZSHVpWnp5Y1lDZ0FVekRqQm5SOTFxTkJCU0JWS09HSSs0T3ViOWRKL0l2?=
 =?utf-8?B?dTZGd056UlZLcFlUMHQyTGlOZnlSK0s2d2RCZndxRXY5Ykh6Q0lZazJqSWcz?=
 =?utf-8?B?UytsMTlTVERHVXNKK3FZcjdIcmNHbG9RUnRSWEthZHc1eGZ2RWh1dXFGTUlv?=
 =?utf-8?Q?H42goX96Ry0faHYBRaFjjUMoJrQ4yn86CyGgU4v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVdBeFVHS1FndDYwYnF3SHVQalR1R3FoNFlUVS9DQ3NzdE9OTXNZdTNnYVBY?=
 =?utf-8?B?ZDY4ZmR4djRNaWRXbkRubU5FdGYzbmFJZDMvbms1MS9BT2hzeTArQXlXTGwy?=
 =?utf-8?B?ZmhFUzFEeEpjUzdCWlE1anpBTEthV0UyQWREQU5adjJhQ0JOWVR1anpJcU9S?=
 =?utf-8?B?MWVUU3JEK2dZRHd1LzRGQkhYYXBScVBtUkVYTVdBMTNCTldtZ3pvWE5RaGl2?=
 =?utf-8?B?WVcyQlVzdXhGa25oWWZESVp3elRPSEI2QUU5K2dDVWNkc2J3Q0gvV3JQRjho?=
 =?utf-8?B?VElNUGQ2anpjMUtYSGVHbHV3OTNXRDhERmlVZjN4cCsySndYSFZ5c2NxMFJR?=
 =?utf-8?B?M3FxVEdQYUhqR3haOGhTTGtJM0R6Wk1ybHJtbmhsWHR0ZXpZcGpJQWFxcVJm?=
 =?utf-8?B?M1NBRExrbVg3SUs5UHY0ZU10dUVDWmVWaXBCNEVMVjZESld3VzdNejI1RHlF?=
 =?utf-8?B?dU1Eakl5L2VMUXZBTk9RQ1o3dkZyTWRFY1ZaNmd4ZktncFpXQ0h5SVN5ZDc1?=
 =?utf-8?B?VkJWZGRtdEhXMlNhQzFwTTJTVVljM0VhRDBjeDRjdlprS3JzRDVrMzU0UjhX?=
 =?utf-8?B?MUNWcGFkQVJSNDJMQ1ZoVWt0eXVZOVBIZ2t5WmVybS9SdEpXaUZIMFNDeGZv?=
 =?utf-8?B?dEFSa0xnZHdQbkowSGt6MWxyV0F6YkJGemI3Mlp6WTlId0FwVjlhU1l4RlF0?=
 =?utf-8?B?Si9QeU9jOXJDZ1JiRjNJZkV4Y0hFbS9FRGd1SzRLNXc3ZWsxVnFncjNNV1cr?=
 =?utf-8?B?Z29abHYyNzBIZ1RPYnBtQVlpVGdIVm9aRXl3YlBSeWFSei8yZzhiTkFpcXdq?=
 =?utf-8?B?Y3pUVUxHNi9hd1Bkc01GZXdxTGVJQVZ0QTl6bU9XVVFVbmtTZ2VJYURiWFp0?=
 =?utf-8?B?V0N6alE0RnN4Zmtrb2tWM1RyYVRxL3RETFYyNXQrSzJhVDVOQ2xkSXdCREwv?=
 =?utf-8?B?b0g3MUJNNWtGaVJxaWpLZ2FXc0RHT3k1ajIwYmQwZGQ3YXJKOUdRRzZncE5u?=
 =?utf-8?B?T2lKbGt3YWw3UzNDSnFPbHk2MWJxYm5yWVpVR1YvSjJrVmtNb1ZFNGlYOUEv?=
 =?utf-8?B?OHJCaGNvUVliMlU1bGlqTHVQRjY3V0NEQW02QTluTGhEZUF1MFRzSmlhOXNN?=
 =?utf-8?B?NmhJeTVwVVZNbHp3ZUtpMlRNL2dyclc5Y2xQcWVNa2hZYU9GWXJTR0dRZDZk?=
 =?utf-8?B?YWpGc0JyMEpMUXl5OTc0THlnMm9BcjEyRWJXcFlQT2FESW5NVyt4MWNuRWR4?=
 =?utf-8?B?NjQ4ZENQcTBwRzZtUEtSRjFiWXpjNW5yb0V6NGsxRUkvb3pFT0c5MlpCS1kr?=
 =?utf-8?B?MFE0eXdiYzRzUWZrNnNqNWRMOGc0MTE0VjJJUW9IWlB0WDJEenUvZFVqOFdP?=
 =?utf-8?B?aVBmWC9RT1QxclhsUnBUaDNNRjdpek1CUkV6NHBLU0w0ajV6c3hXVmFtMnpw?=
 =?utf-8?B?Y01ybGpIKzdJem1MYThNVmszVVRXQUY3OXpCcUhncnF5MCswd0MwZzZQeFZK?=
 =?utf-8?B?R0JEdEM2OEN4eTRlbkxFUENNQmxWQUxFWDVMOWVuNkVSZVVNb2pwZU9HYVVU?=
 =?utf-8?B?dXRMZ1FPWFBNVHR0aFF6S3dUUEJkclY0RG9JaE8rT0tvdnh4Tmc0TitTeEM4?=
 =?utf-8?B?ZENJVWlXMkl6L3Q2QTc2RExpdHNZZFRBdVBoYmVBTzc0c21xcU0vajRzVTND?=
 =?utf-8?B?R0gzU0kwRFNuYlo4eWpEc2lFdWwzNnJBR3NLMi9XNzB1VUh3WXpIcW5DVHlv?=
 =?utf-8?B?TzVKVkNmeDl3WUpzaUJYMDB4MWlGSWpNNlE3M1dLUjRURExsVk1xL3J1STNT?=
 =?utf-8?B?K1MzZThsS2lsQjEvZk5ZOVVkVkxwQitCWjNUTGpadmU2V1JwU2g3c2tkb2RL?=
 =?utf-8?B?N3JiVkhZaWxXbjh3T0pmcnY3UW01WnhPSVhNeDFXeEVmSHJyS1VHUjlWcjFQ?=
 =?utf-8?B?TzNja1hyWnp1Z1o1WDQzcGJCd2Nsdk9yZW0xKytiOWpIQTQydHNROVF1eWVP?=
 =?utf-8?B?RENLbW9udUZZdnVJZ2ZIblhjWkF0bTkrWk1NU1J0Y0N2THliaGF5aDQ5R1dz?=
 =?utf-8?B?bkk1STV3T0NRaEVmbm42ZHVpSXlBTlp2SkM5Uk5rdkFwZm91VDBwMWZTWHBh?=
 =?utf-8?B?TU03WEUySGVSaVZDaVN0T2FXa1NkT2VEWFVqMThoclNOdzZIcFRMMTRvVVJL?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7debeb4-e93b-4363-ffa1-08dcfaba8eac
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 21:17:14.6232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMWS8Pwo1Lu7zMp+64/36X3GdE5JxpT9QnjGElDI+pZOcMcGFGk4me7sH9546NUwfEQKCecDYcSJedAgg3y3tswq34UlIE5TlMxww+Qtx5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
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

On 11/1/2024 12:29, Lucas De Marchi wrote:
> On Fri, Nov 01, 2024 at 02:19:22PM -0500, Lucas De Marchi wrote:
>> On Fri, Nov 01, 2024 at 11:39:59AM -0700, John Harrison wrote:
>>> On 11/1/2024 08:07, Raag Jadav wrote:
>>>> On Fri, Nov 01, 2024 at 07:44:37AM -0500, Lucas De Marchi wrote:
>>>>> On Fri, Nov 01, 2024 at 07:47:54AM +0200, Raag Jadav wrote:
>>>>>> On Thu, Oct 31, 2024 at 11:29:15AM -0700, Lucas De Marchi wrote:
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>> - * Snapshot at hang:
>>>>>>> - * The 'data' file is printed with a drm_printer pointer at 
>>>>>>> devcoredump read
>>>>>>> - * time. For this reason, we need to take snapshots from when 
>>>>>>> the hang has
>>>>>>> - * happened, and not only when the user is reading the file. 
>>>>>>> Otherwise the
>>>>>>> - * information is outdated since the resets might have happened 
>>>>>>> in between.
>>>>>>> + * The following characteristics are observed by xe when 
>>>>>>> creating a device
>>>>>>> + * coredump:
>>>>>>>  *
>>>>>>> - * 'First' failure snapshot:
>>>>>>> - * In general, the first hang is the most critical one since 
>>>>>>> the following hangs
>>>>>>> - * can be a consequence of the initial hang. For this reason we 
>>>>>>> only take the
>>>>>>> - * snapshot of the 'first' failure and ignore subsequent calls 
>>>>>>> of this function,
>>>>>>> - * at least while the coredump device is alive. Dev_coredump 
>>>>>>> has a delayed work
>>>>>>> - * queue that will eventually delete the device and free all 
>>>>>>> the dump
>>>>>>> - * information.
>>>>>>> + * **Snapshot at hang**:
>>>>>>> + *   The 'data' file contains a snapshot of the HW state at the 
>>>>>>> time the hang
>>>>>>> + *   happened. Due to the driver recovering from 
>>>>>>> resets/crashes, it may not
>>>>>>> + *   correspond to the state of when the file is read by 
>>>>>>> userspace.
>>>>>> Does that mean the devcoredump will be present even after a 
>>>>>> successful recovery?
>>>>> yes.... if it's not succesful then it's moved to the wedged state. 
>>>>> Easy
>>>>> way to test is running this:
>>>>>
>>>>>     xe_exec_threads --r threads-hang-basic
>>>>>
>>>>> You should see something like this in your dmesg:
>>>>>
>>>>>     [IGT] xe_exec_threads: starting subtest threads-hang-basic
>>>>>     xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=rcs, 
>>>>> logical_mask: 0x1, guc_id=34
>>>>>     xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, 
>>>>> logical_mask: 0x1, guc_id=32
>>>>>     xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, 
>>>>> logical_mask: 0x1, guc_id=18
>>>>>     xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, 
>>>>> lrc_seqno=4294967169, guc_id=34, flags=0x0 in xe_exec_threads [2636]
>>>>>     xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vecs, 
>>>>> logical_mask: 0x1, guc_id=17
>>>>>     xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, 
>>>>> lrc_seqno=4294967169, guc_id=18, flags=0x0 in xe_exec_threads [2636]
>>>>>     xe 0000:00:02.0: [drm] Xe device coredump has been created
>>>>> -->    xe 0000:00:02.0: [drm] Check your 
>>>>> /sys/class/drm/card0/device/devcoredump/data
>>>>>     xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, 
>>>>> lrc_seqno=4294967169, guc_id=17, flags=0x0 in xe_exec_threads [2636]
>>>>>     xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, 
>>>>> lrc_seqno=4294967169, guc_id=32, flags=0x0 in xe_exec_threads [2636]
>>>>>     xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=ccs, 
>>>>> logical_mask: 0x1, guc_id=27
>>>>>     xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, 
>>>>> lrc_seqno=4294967169, guc_id=27, flags=0x0 in xe_exec_threads [2636]
>>>>>     [IGT] xe_exec_threads: finished subtest threads-hang-basic, 
>>>>> SUCCESS
>>>>>
>>>>>
>>>>> If you run it again, it won't overwrite the previous dump, until user
>>>>> cleans the previous dump or the timeout on the kernel side fires to
>>>>> release it.
>>>> Yes, which I think we're covering at later point in "First failure 
>>>> only".
>>>> So maybe establishing the mechanism itself before explaining 
>>>> reset/recovery
>>>> would be a bit neater...
>>>>
>>>>> From a distro-integration pov, I think it should have a udev rule 
>>>>> that
>>>>> fires when a devcoredump is created so the dump is copied to 
>>>>> persistent
>>>>> storage. Just like it happens with cpu coredump (see 
>>>>> systemd-coredump)
>>>>>
>>>>>> Perhaps moving the 'release' part to above paragraph will add 
>>>>>> required context.
>>>>> not sure I follow. Are you suggesting to swap the order of "First
>>>>> failure only" and "Snapshot at hang" ?
>>>> ... in whichever way you think is best.
>>> Note that 'snapshot at hang' and 'first failure only' are totally 
>>> separate concepts. And neither explains the release mechanism. 
>>> Reversing the order of the descriptions would be incorrect, IMHO.
>>>
>>> The point of 'snapshot at hang' is to say that the universe 
>>> continues existing after the snapshot is taken. It is not just that 
>>> the driver recovers but that it keeps processing new work. In an 
>>> active system, it is extremely unlikely the system state (hardware 
>>> or software) would match what is in the snapshot by the time the 
>>> user is able to read the snapshot out. That has nothing to do with 
>>> when or if the snapshot is released, nor with how many snapshots are 
>>> taken.
>>>
>>> The point of 'first failure only' is that only one snapshot is taken 
>>> at a time. If there are multiple back to back hangs then only the 
>>> first will generate a snapshot. Further snapshots will only be 
>>> created for new hangs after the existing snapshot has been 
>>> 'released'. And I'm not seeing mention of how to release the 
>>> snapshot? It would be good to add a quick comment about that.
>>
>> does this look better for y'all?
>
> trying to paste again, with whitespaces and typo fixed:
>
> /**
>  * DOC: Xe device coredump
>  *
>  * Xe uses dev_coredump infrastructure for exposing the crash errors in a
>  * standardized way. Once a crash occurs, devcoredump exposes a temporary
>  * node under ``/sys/class/devcoredump/devcd<m>/``. The same node is also
>  * accessible in ``/sys/class/drm/card<n>/device/devcoredump/``. The
>  * ``failing_device`` symlink points to the device that crashed and 
> created the
>  * coredump.
>  *
>  * The following characteristics are observed by xe when creating a 
> device
>  * coredump:
>  *
>  * **Snapshot at hang**:
>  *   The 'data' file contains a snapshot of the HW state at the time 
> the hang
It is not just hardware state. We have a lot of software only state in 
there as well. Maybe "graphics system state"? Or "hardware and driver 
state"?

>  * happened. Due to the driver recovering from resets/crashes, it may not
>  *   correspond to the state of when the file is read by userspace.
"state of" -> "state of the system"? Or just "the state when"?

John.

>  *
>  * **Coredump release**:
>  *   After a coredump is generated, it stays in kernel memory until 
> released by
>  *   userpace by writing anything to it, or after an internal timer 
> expires. The
>  *   exact timeout may vary and should not be relied upon. Example to 
> release
>  *   a coredump:
>  *
>  *   .. code-block:: shell
>  *
>  *      $ > /sys/class/drm/card0/device/devcoredump/data
>  *
>  * **First failure only**:
>  *   In general, the first hang is the most critical one since the 
> following
>  *   hangs can be a consequence of the initial hang. For this reason a 
> snapshot
>  *   is taken only for the first failure. Until the devcoredump is 
> released by
>  *   userspace or kernel, all subsequent hangs do not override the 
> snapshot nor
>  *   create new ones. Devcoredump has a delayed work queue that will 
> eventually
>  *   delete the file node and free all the dump information.
>  */
>
> Lucas De Marchi

