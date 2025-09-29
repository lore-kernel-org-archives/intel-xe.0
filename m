Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23482CAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 21:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D625D10E4AF;
	Mon, 29 Sep 2025 21:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkeWawcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFEA10E4AF
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759181513; x=1790717513;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eofcAvyfde1XrUWKjrV0/YkO7V+NItpmSq3HuOKDCgw=;
 b=MkeWawcW1xrdKXplzzdjoBmr4L+XmlByPDxjXBai//sx93evKR97SJN6
 NZ5+6NgI+3sO38TE4VVdbwXNyVztCXF6HnJaR3a6JI2IDJtm1cJIcdb4k
 SySiZ3yWop6cy6sCe+KVyFeLvPWtKW8tbtrJTQHC8qseIGlf4vRDOiPo1
 7ZqlUIonGfm4dWHmFg0vwXgrHg0LqXqI0mbUd/EpPf4le+Nbpqr2Qg+n+
 kPQ4JLn0f103aAs8Y3JMD7JSkQJ7v6uidJem6QWNEIaBccxUHnMmY2fdA
 21B9XGA7CvYxFsaJdxyDvPFaAACuIa84L9DDOueMBN+qfjNXruZTy5TOr A==;
X-CSE-ConnectionGUID: y/DidKX/RtmzsC2Qv2+ROg==
X-CSE-MsgGUID: eP7qsuj7Tn6wexyH+jtR6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61387871"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61387871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:31:53 -0700
X-CSE-ConnectionGUID: 9R74J79PQ7SQeoA+3mokcg==
X-CSE-MsgGUID: LNo9CC8RQIK+JzYreXVo/g==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:31:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:31:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:31:51 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGsqdLsm5XEklFLIhm3c3aQuTaQosL886/EG3GN3XDyPyp2/Tz20ba0KOPXa+9T3KFkpHAGEf2cPsnf7IVkrwBndaLDjJ+DHgrHfpyOTsqc+FFMgfCW3kXsDlTMPC4bL5ZIZhsu8MH9qNzCLDIQGdaL4HcSdmk3R/O5+Y2RsMD9T8mr/vjN7kBO/gBqoIVIeFJGE5U9qTJ8Yucq+1co8fqnEIrRfAP3XzRRIhmQh3kPn7lh66tMr1xO2quHLaMX/AQA0M0tUd8KTXoqcPs8KU79WhjCeEohkCevQQK6m8bXMfGa1IVUZm/ZDIngE+d3Xfg39cIFxxbgqcAmmBlKMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5E/2JJUXl2WdHnCM+ET7jVArfuF/ReIvfJgwaD3Fhk=;
 b=kixTJwlQUUYd3aOzp7ooPmU0pafW4+ggeWPSTHgJvdo21sZZH5cs27xzJXVmFq1OCNOxWb7vL8eseuVCxeLRux8EuWic+S7CyW8j3zp/mLklaQQLyRfcWauOtjt73XBvXgL1IIhk4m8TPAWTHUDOwF5WAljXmxxyWqmL2kTG7sqjnwDzN0ndS57ls+4QX+3zrzGUHOKw5vkHMjxyVKQ9Z7wzLg1p6bZtHpEwTYdx+gHwQl6Iu6cBFnSY9FMvWk1QoDhWdlYlISlaj8CcZUiTf6Is77V6W9WHLZ2cEXwQ9zo54JU6ZeBVWIrTWYh6vhr1eFVFkoi9cfwvDapuhJzTKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 21:31:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:31:49 +0000
Message-ID: <a9ab3789-e7e7-4856-85f0-eca30b26dea6@intel.com>
Date: Mon, 29 Sep 2025 23:31:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/36] drm/xe/vf: Flush and stop CTs in VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-24-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-24-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: fd14d94d-3872-43a4-1ae8-08ddff9f9913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUpmRzVqb0k4VW5UWkRZV2h4TWlFRHpQU0NLYVZNNEw1MmJwbFFnK1R2NHda?=
 =?utf-8?B?NkhoVDg0cngyZDFDNEpPRm5YS1JPZ29tYVp3OHJaVWxqSEltNy9RSEZaYzlw?=
 =?utf-8?B?SXMrZ3Z3NWR5WlV0VXRVbUFFNXVBdUJRd3JIU0dxODBmWis2WFhteDZvYU1l?=
 =?utf-8?B?a1RlYUV3YmVKcC9Xb0w2ZnMxTWYwcVpIY0lKMXdiUDZFWWRZbVBxT3pSK1RF?=
 =?utf-8?B?clFmcVlwTjdVQ1FJcWtydEFON0xsWkNETXlnM2E2QkRsUVRURU1zMTNpWlpI?=
 =?utf-8?B?Z052amV3U0IrQjVjOTY5TUhzamcyOHA1TW5ocUJ4UFkxUkxyYVY4bHZadUhL?=
 =?utf-8?B?M09ob1FzVDBVVld5alF6NzZFTENEN3lDSnBkUjY2aWwvMGd3NXNSbzkzSnQ5?=
 =?utf-8?B?M0I2QjFYN3lEMEFWMTJKTnNSL0ZBVlVEQUJwZlpyVkYvU0JjL1NRcEl1NXJC?=
 =?utf-8?B?YXZpR1Q3ZTBXUnhhRVkzQUhxWW4zNnM3RGJhNnFnTjkvVnBvNXI0NFFoeVBR?=
 =?utf-8?B?ODExSEVsWVVJMEhYa2pPRWZhZFR2VVpvbG9CTjlydjZndUVENXRpdzV4alAx?=
 =?utf-8?B?ZlVPMzNMaVc4T0llU0s4NU9ORy9WQzI2djFPeG9uYjA2d0kya2puOVM5Z2tu?=
 =?utf-8?B?WVBjbEhxUGFQamZ3N0JRQ01RODNMdktidk9ibjBpYjN0dmxrdWg3WHkzZFZX?=
 =?utf-8?B?SjJneHk4ajh4U1hNczZQT3FhZlVEV2oxTXJINldEa0hTU204K1lIQmt3SUR1?=
 =?utf-8?B?eGxoV0wrZ0RRR1VoRjdFa0FBb0g0dUtqc2hLQ1l5OTN5Y1c1ck9VbGRpMnUy?=
 =?utf-8?B?eFFzK2xtOFA3VG0vdEQ2aDlpYXZWaGpTRXFmN1lLeVh6VVZTazNwd2xXR2JL?=
 =?utf-8?B?OExqd2lIVkNYaVFzSFZyWTc5eXNIUlVORy9RMU5JU1YzcGdhQlc2dlltTGI5?=
 =?utf-8?B?bVRSMjZmbDRyUWJjVEZRRWZhUXRoV3BGanlCS082eWd1eWJoaGhWWlZLY1ZS?=
 =?utf-8?B?V2lwa09JWFJhWFFNbjhoZzUzU04vTUdNR1BRM2EzZG01dlh3eWJpUjR4Qy80?=
 =?utf-8?B?czdDbmdkZ2EyUGRBdkZvdWFaTndzVUNNQ2ZBR3BlRHJxb3hJNFZjS3VvaU9q?=
 =?utf-8?B?RGg4dDZmRDV6eGpPZUVBTGV2L0JsMFZKTEVPMXE1Q2VJNkNlRzY5Z1dWMDNo?=
 =?utf-8?B?b1FhWW5HS3cyN09yODZYVWtpTDZSMnM4WFRrL2pITzUwSVVLNWh1TVZ0L2U0?=
 =?utf-8?B?VHIwTktmT0g2b283Yk9NVWtpY0ViQmRqUG8vYlpZVXRJZzFzZGhTNmh2MHJT?=
 =?utf-8?B?STNwYXltUTkrUC9TZkRaWVNlS0xhQlUwUWNSeUhUK0VVenp5WFkxZFh6bXp6?=
 =?utf-8?B?TnRNM01md0N3UEM1OXpiMFF6UzMzYnpwZ1RDcE04L1hjRXBERS9TWmhhQXFp?=
 =?utf-8?B?NVl6RzhuaWl5RWwzdkxndG1wZkRWSE83dytKWGRUdVRmWFFvTHR1ZWtHSTBU?=
 =?utf-8?B?M1VlVU44U0FTRDhJcGsyRklENGFVUFJoNUFsZ2hudjFnRllKUUdCRG1hc3NB?=
 =?utf-8?B?S2RheXlScTMreTU3emc4TkpqTG9lb0F5c0U3YlRqdkExZDZIMDA1dWdpMWdv?=
 =?utf-8?B?Q0s2b1M5WTQrN1ZxNzQvdy8wYm1zK1QyK1ozZlM4dnptTjBYejA2UFREcVlU?=
 =?utf-8?B?RUdHS0RaNlFlVUdLb1JienZTbXNnZTU5Y04vRG04ZC9JbXEya1RKZm1OQjdj?=
 =?utf-8?B?dUVCeC81ZnFXcXBuVnFZVWN6cnFiNnR2Y01GOUlubXBtQmN3WDA0cUV6a1lB?=
 =?utf-8?B?WndwcmVtMlNGMmJPVHlRWHVXL1MwQnYyTTQ5U3plY0p6Z3pJN0pTTzZMb0Rq?=
 =?utf-8?B?SDUzdjhsZWJmMUtMRWFJOFNWcUtObUZ2cHlMcW95QURnTkFET25XczQ2Nnky?=
 =?utf-8?Q?TqXkCZnSilyfdJFKlGA6W6QlPRvZuDG4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2NBSlE2QS9uN3ROTUgyVnBFUEljQzhFcUJKaldaRDF1T2ZKODZoU0UxaUs0?=
 =?utf-8?B?THQzZGZ1NWM0QXZrSGJ2enBrcEIzZFF2RmpzVFMxSW9seXptbHFnOHpUWWxl?=
 =?utf-8?B?Vmg3WTMyeWo0TnZpcUtJQkVPK0VRWWNPSnprd2x6YTFhNTlMbm10aDNiK2o5?=
 =?utf-8?B?N1JQcEZGbmFrMFJMWndxdFYzUWh0VjkvZ3hRaUg2NHJwOVo2YU5kTmlXbmZB?=
 =?utf-8?B?cnV5MThvR1NGOWZBZFR0dDdiSDkxYll3bzVkRXNpdUhGNCs0Mm9YTXJPeXp4?=
 =?utf-8?B?am5laE1HNEpCc2M5bEJSUWR3SW56ek1IUDgyT1dvYmVydUE1YWF2b3JOcFN1?=
 =?utf-8?B?dVlNZGxiZUxhUnpVWTF1NEVweXU3NnNCRk56WDh0bGE2UU9reElnMUVnNGdh?=
 =?utf-8?B?VFFadUNvem4vNm1MbU1JOEZUREdGbVVscC9qd1RHL1ZXY1F0VWltQzViaVl3?=
 =?utf-8?B?dEJ4aWZRWmNmdlpjOHcwUCtrMmlTOTVPT0toRURjdkxaa0NMbjFQajliSXFh?=
 =?utf-8?B?NXB2cXBMd21BU1ZITlhMNzJCd0FFNnl0MWVCWGozSE9VYUYzajVPWXU0SEpu?=
 =?utf-8?B?U2FjT3pRMFhWRUFyKzBHRkVZaGdyZmh3SnlOakFkdlNqbngxMkhXNi8zWk9S?=
 =?utf-8?B?UmpPODR6Zy81TitrUm4xNEt0M2YyNlhhaDl2dVVWMmN1VG1GVUFpOUhvREl1?=
 =?utf-8?B?cWJscDBDYWg5d0lDa2c4QzArbjFBck9Jc1h1RnVMdHdCWnMvQlRqQ25FcWNw?=
 =?utf-8?B?N3E1MXI0bXp1Q1RadEVoejJId2Z6dWUreTdCeTNHdWdYbVhzOGxDdFNLNGVT?=
 =?utf-8?B?eFBOSytXK1MvT2hPSGhVRnR3aEhxc1orbE9TRlh2UWVOeExVZkxZS2sxOGVE?=
 =?utf-8?B?c2UxbHRGSEE5ZVZjL28yMDMvUUV5bEN6VFRuV0NCME1OTnFhOEY0WXh6dzla?=
 =?utf-8?B?UnYvem9KeWVPRjRodE9HUXJWM3RLYWIwcngvcXBpRVAvVGVRZnhhQkpjK0JU?=
 =?utf-8?B?YUNCNlRuZzNUZ0R5emV0UTQvOXVEaUkzTjUrcy8vdmdsUW1XcnJJZFZHS0hn?=
 =?utf-8?B?eDdFM3R1aDQ4bnFiQm5oWjM0MEdsU0NGOXF1emZZbDE1M2VnWE1tVFUyalQv?=
 =?utf-8?B?S1cwRE81R0JzN21KeS9aTHMzMHhhc05jS0hYeGU0S0JMeW5kcTh3cVd3eDZv?=
 =?utf-8?B?Tlh3WVVGQUxHdXJua3dHTEd6QXBia2xESUxDNUdmanR2REhLSUd3QnVFaUZX?=
 =?utf-8?B?Wm81Q0hqZ3dtS3VicmZuUVE0dS8vQ2tMVXc3eE9ZSVJrRWdkR0d4VmhyTzNN?=
 =?utf-8?B?akdndVg5MzlubHZuUFhSNGpYSXJiK014aHdGeDZyOVUxbVRENldVcXJ5YU4w?=
 =?utf-8?B?d0I3OXNnVXg4NCtza2xyWDc3T3BWcW1UekoyN0k0Q2F6ZDV1TFl2dzZJWHhB?=
 =?utf-8?B?ZmdDTUR3OW80OWhHeFcxZ0RPMURvQTJXdnU4aWR4cUlYUmNBUUduaTU0MDJ6?=
 =?utf-8?B?YXZXSzFFejYzWTkxamJuNmdKUjV0dHRPYXMwTFAyQW0ySWYwbzB6SzRMZVlB?=
 =?utf-8?B?dlhJTHY3S0xKcmJQMS9WY2RTbmRsbkZrOEpVdkVFcC9PTkFiUW5wejQxMXRJ?=
 =?utf-8?B?UXJtOGpIUk9MZ2Zkbm51cE9zd1B2aHRpTEkrNVg3WFkyRlRHbkZrWlBLUDZG?=
 =?utf-8?B?eTVUdm15RjVwNlRSOCtCaVd5ZmlydndZaGpzS2hWY2tLSkk2NG1seTd2UXJr?=
 =?utf-8?B?Z3Zvd285cU4vMmQ1Y2tmRERUUDRoMFNjT2NENTBNWktodmh1Zy9LdEJSRThE?=
 =?utf-8?B?NmtnWkMrandyei95dXl4dWExSGsxYWxleGpwYnY4d3RkcWd3TEtpOWV5ZGpQ?=
 =?utf-8?B?Z0lKejNPbzJuaHAwMm85MTlzdjU4SHZSdzZVZHUyUUtBclJOdHVlRHVoalhV?=
 =?utf-8?B?QmNOQWt1eFZxNjdDWjFRb2tZSlVaMUdqbUVNSXROaHFyR0NjeCt4a09sTFQr?=
 =?utf-8?B?VGl1Y0d0Mm1uNjQ5MHo4bTNOY2U0Sk1jR2ZWUFd3M21zNVB1SzRUcmkxczl1?=
 =?utf-8?B?VjE0Mm5yQ2QzOGNDYmpJT0JoM2JEcm5EWkF4MFlBNG5YMGRRb1M5eTl2ZVNQ?=
 =?utf-8?B?YXNNdWhXdHJHZTMvSTZWS2tjbTZ0WUZDYUJ4YjFuSW1PV2tBUDg5aVNWNy9n?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd14d94d-3872-43a4-1ae8-08ddff9f9913
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:31:49.1793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN4c2K8GP3PA+MyHDE3WdLgAKkZq27JKZRyutAuLEXjEPKS9gRqHZDuue62QzQh4jgr/n1NORZZxfFB37kmwL8CcumGN5V35UgLjtvzMeIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
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



On 9/29/2025 4:55 AM, Matthew Brost wrote:
> Flushing CTs (i.e., progressing all pending G2H messages) gives VF
> post-migration recovery an accurate view of which H2G messages the GuC
> has processed, enabling the GuC submission state machine to correctly
> rebuild all state.
> 
> Also, stop all CT traffic, as the CT is not live during VF
> post-migration recovery.
> 
> v3:
>  - xe_guc_ct_flush_and_stop rename (Michal)
>  - Drop extra GuC CT WQ wake up (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>  3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index a564f296e4b9..37ef1c42bacb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_sriov_vf_types.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
> @@ -1185,6 +1186,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
>  	gt->sriov.vf.migration.recovery_queued = false;
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
> +	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
>  	xe_guc_submit_pause(&gt->uc.guc);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d84de8544532..fd6e731c0395 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -573,6 +573,16 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  	stop_g2h_handler(ct);
>  }
>  
> +/**
> + * xe_guc_ct_flush_and_stop - Flush and stop all processing of G2H / H2G
> + * @ct: the &xe_guc_ct
> + */
> +void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct)
> +{
> +	receive_g2h(ct);
> +	xe_guc_ct_stop(ct);
> +}
> +
>  /**
>   * xe_guc_ct_stop - Set GuC to stopped state
>   * @ct: the &xe_guc_ct
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index d6c81325a76c..0a88f4e447fa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,6 +17,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> +void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);

