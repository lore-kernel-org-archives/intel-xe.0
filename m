Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111F3E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 20:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B856810E092;
	Thu, 19 Dec 2024 20:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlkFSyL6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E862A10E092
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 20:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734638710; x=1766174710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rjf+7fvwMumYAhMlYr16cswMzjviUfzS+JIzK34mbz8=;
 b=GlkFSyL6Kl7/G1VTuwSzFQt1ALDIEVOebMyZu7skMBuE+/RTsJijaZJf
 1kTIfTtKhvYURdrKIZ9eDgpC+Kgz628rP8V7W2Lg45wgHrP3x7+1MkdSN
 wDrPTqVMOkj1IzCA0z4NImb2TtHhKsz7cvehOx2nlEHgDZ/NYeygNTAFt
 m7HmzKapW+IIpm8b/4Q5LGHzKYrzvGOhRhK4h7te8hZRycvZiCMqAs4ek
 tme4SM35et+fe2S4jqqZmrSQD8NqK97gMt6grok1mAql4yrnYNoRR6+LK
 UZUWWEqTfChZzVjffo5nFdDsk1aZg4T8yBni+tssCBvO+jZ3NjJR1yIjQ w==;
X-CSE-ConnectionGUID: AxWUKhGKTLun1PasQHlMuw==
X-CSE-MsgGUID: ta/sdDdxR4yvK8HAs0GtGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35320753"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35320753"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:05:09 -0800
X-CSE-ConnectionGUID: uaRLbmmfTKuEhwlKHOw6RQ==
X-CSE-MsgGUID: DyWycPf6QYqBJG21rdg5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98198821"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 12:05:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 12:04:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 12:04:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 12:04:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2LWApGcd8Bl9tL1ODGd/npYnQiZbhCz+Xc9RZtYCsEWfRy4VdoD35Oz4pBlte51ncqId3Py5msrFFl2GghePfPzF5x8//f+lM4CqjI2iBnT+CwEwxEKRGoyTabPL/MJABy8DTTmSCz1lAAs9/1GAnqjXyKQ9o4ev/6mTnh8wmodpiy9TvZCR9sZ0xGB/XLwi9d/vhYfr6nQaA4d4U59sZAgBGKeE4JxH+jqfxcq4Yi7CoEI6mBg2O8tV7OW9ARboT8rJ7NNiInh7RdBxQ13jWF2WPdJDCjkBHl/C6xD4p2E4g0Eqss5K7O8cYPAsE6jARypJXYJbf4csNX3x+q5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSQV1Ng/czqQlzno6YIhsuXPlXr0PTCPt+oGtKAfCg0=;
 b=CwpiHyzAUukAHLdQRgy2UZlUMFF6f1kWDDLuia+3+qTrebvaou6WiC29pKUwjqiVpNJ70uljlG3bTl7ky5uUNozX6a6wmV4cK+aoXgQE9LHbqWvcHfVG2XvOHX95CAseFc00+a6r6CQEkQD8EisUk8X/zatCVFyOgnlN+y8RLpUyKVD6EwxFB6HkKeF0ECxgRBLf+ETpsMWUYh/cyNVP89vNN1n5BtGM/zOeonJ9ssgrpVvdAEIeaRZ/c2rmRYhnR9J8owk9PEKOIO6Th9zkbXJEsiFkVNVt8MUgKLQqVepfz4t9heIyqoCNl2pAtm0nrPr1RqXQUXSpmXSKkbT2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Thu, 19 Dec
 2024 20:04:49 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 20:04:49 +0000
Date: Thu, 19 Dec 2024 12:04:40 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <matias.a.cabral@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <shubham.kumar@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.olson@intel.com>
Subject: Re: [PATCH v6 6/7] drm/xe/uapi: Add a device query to get EU stall
 sampling information
Message-ID: <Z2R8WM1XolkUGYkl@intel.com>
References: <cover.1734427624.git.harish.chegondi@intel.com>
 <6e104a81ccf931e55a577ce816e5821aab57bec4.1734427624.git.harish.chegondi@intel.com>
 <855xni2huy.wl-ashutosh.dixit@intel.com>
 <Z2NZouMGW3OwAMXl@intel.com>
 <85seqj1vgf.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85seqj1vgf.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH0PR11MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: c339d570-b36e-41db-ba9e-08dd206864b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFk2c0RERUhNUlBxOXlLVjVtVXNsM2Zyb2lTVHF2V1RySmZERjB3YXVtUGpQ?=
 =?utf-8?B?R0M1anpkN3pZUmJBSzkwQkhucVV0bDRGWmx6YnFnQ1V4WnA5SjZuZDEwWjA1?=
 =?utf-8?B?ZjVzV2poKzJ5a0draDJ4a0xNeXgwSUVnTE0zRlg5TzhDNzNGUkRZbmxYa3hL?=
 =?utf-8?B?bGdGMXVzek1lYlVWekU0NDA1SWJMY1M2R3JmS0ZPdWZ0TEZqbWd6MzhaR21T?=
 =?utf-8?B?QUM5c1hmUnY0cU9qUlNvVklEa01yU1F1eDhwSXVZdWxTN1ZpSDl0clNoSEY0?=
 =?utf-8?B?ZVVFYTllVFhqZ3NVOTJjcm02RloyYmhiTlA1amVqVk5mQ3p6YjVxdE1wbDQ5?=
 =?utf-8?B?SHpXL0J2em1HTE9Ed09SeEUwUkxITGxMU0Q5WWZoRVZ3LzVtWS8yNEVHa3NI?=
 =?utf-8?B?WUNGdlRDSHhjYnl2NVRaVWJ5N2dRMm5DclNsditJQ3c2L0hTTUNmbWVqc1B3?=
 =?utf-8?B?ZWRmQmhFSnZ5ZnluaStaeWhQb3ZWay9XaU53b2QvVnRBZDNjMm5EbkhwdWhR?=
 =?utf-8?B?dWNOdDFudHljMFhySVNlOEV5K20zcjdRS0hQTnQycUtIdE1HbjFPTFJrN2Rl?=
 =?utf-8?B?MTBRYVZkODdreW42dmhrb3RyV3JWTmJmVkRhdTRuVDMzU0FVR2wyV1FYWmQ2?=
 =?utf-8?B?QldPU0tFUFNHa1o3ZFcxK0VXdlZsMVNESE4xM2RoQjVoOXZFcTBoTGNpWTU4?=
 =?utf-8?B?N1R2TGVKYURtV3hDN0V0RFVUWGttT0kybEFNVnZNcEhXb3lhRkY1R29uNlRY?=
 =?utf-8?B?OWRRT2YrSDAwRGZmOXRJT3UvbjNJWjhseFdld201eFdKRG9GeUdTS1lHRDF0?=
 =?utf-8?B?RTlndDY5dWdqMjA5U1MydjFoYjRkL216a1JkNnpPdm5ZcllEWkRiZGsrVHpr?=
 =?utf-8?B?dkpQSGJ0bU93cGxOdi8zc1o5aFdJNjFhMTRjZnR1YjdkaDJZaHBzVUZTV0o5?=
 =?utf-8?B?djVWWVBZYmVhaXNWZWJGMzZSVXBBVlFTU1hzdzJlc1U2ZmowalIvUkJiMGxW?=
 =?utf-8?B?UDMwNXE0d25uTTJqdWNZV0JQZmlMVHh2WncvVVlWYjBiMmJJYTRzeFJ4SVFl?=
 =?utf-8?B?RkVCS2RPZG1EMnhOR0VwM3JwUkVTalRvTFV0Vmlud3NVR0JkRFRNQUgvUU5I?=
 =?utf-8?B?UVQwa3dRV3loZkd6WktpN0pJOExmOTVvUzJEdUs2cEhNVFc5TThLOGlaZGxt?=
 =?utf-8?B?ck45Sys2T1RnSG9mS09pMTVhK3R3a0lCNWZrQm41d2srUU1HWmczRmNmdmhv?=
 =?utf-8?B?UTQ1SmVhRG9wd0h4STBvb1AyaDVuVy9LTzArSzRXT1c4dGpPWENxUzRROXhO?=
 =?utf-8?B?WElhSll1UWV3RUVaeTRtTzA3OTZWRnJ4bW13OER6Q3AwN0ljME1EZ1JSUGFr?=
 =?utf-8?B?ME15MHJlOTFOK2l2aVd0aktZWUZWRWdyV1NrVjRWcGUweVB0Q2ROVFRQYVJ5?=
 =?utf-8?B?VTFhSC9yd0g1VGVjTVErNE5MVFREdHZ4ZS9oZlZsbjN2anBERTF4MzYrSW1V?=
 =?utf-8?B?Rm9qeEtVSndFSVFHQ0hiTVpYYlIvMTh3RGZFc1hZaWp2SzhnWW9iVGptTHlw?=
 =?utf-8?B?T3VqU0pDL05aZTVQS250YkVVclY2ZHcwUFZ3NnRka2VpRXlEc21ZTVc1VzVt?=
 =?utf-8?B?NkcyVnFqdWV1V0tMV1RVcTVGdHhEM2dHVEFRa0tERndHOHVaUjBWSWkySDlx?=
 =?utf-8?B?ays0RVVTSmJFVnA3emN1SVV2YWk4eVQzemRlQWpuRFhMNUpGdi9odkZETzQv?=
 =?utf-8?B?MnJLSmtQdVBJcWtMYVllakRyU2JaK0c4Si9UV04xdnJlMjdmRlVPSmdKL0ND?=
 =?utf-8?B?VU5sMDU2ZXI0RHlnbk9oZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGVkandzZ1JsaFVZZG5sbmRRdFpreEpuMnQxZzJ3QlQrdkR1bm1NdS9xNy94?=
 =?utf-8?B?TE9KNGI0RDVta1VQeFNWbzZqcWVyUWk1UCtLZVRnQVZOdmttazRhOTk1OFVX?=
 =?utf-8?B?aEtjMlMwYUtSWmhHMU1sSnd6MnA2UG5XQ3F5UlRzWmt2eEFkUG9MRjZiNDQ4?=
 =?utf-8?B?ejVCYy9uanI0UXdNakJidmxSbjdTa0tHb21mYUtqcFNYYjR5RGdCZW10YnE5?=
 =?utf-8?B?bjBldytKSHR0YVh3dHZxY053aHNlTEI5MSthM3BNUXpiaUtFR0JHaFlFVHcz?=
 =?utf-8?B?d1pRZUFSRy80ZEM2SThDWEthZkVRZ2NDakpuQksvS09iR1hURXdDWXl0RjJG?=
 =?utf-8?B?R2g0M28wL08vU1l3SW9hVDgwRGN2cWdOakhWcnZjZ2M2Snl3Y3VITkpuaGZq?=
 =?utf-8?B?MXV1M09ISC9wSG0wRjRxekdpSVU0akRxeFVwVDdwQUNpczBMOUI3a2MrdGh0?=
 =?utf-8?B?bVJxeXppUXNlRE5Weks0czlxSW16ZWJCRmdHZHNRY3dmV2lKS2NJalRiZEs1?=
 =?utf-8?B?TGtmWHh5MWdodEJnY2hNQmFTaUFEREIyY3VTR0Yxa0Mzc1pSSUkrNVZ1MURM?=
 =?utf-8?B?ZVExZ2UvWU52eHQ3UTUxZk9ldGt2Mjd3L25CdHZjVnJHUE5hcGhwbUhJTlhv?=
 =?utf-8?B?TXEzU1RKenY2NGYwczREcWtrSzBUWFBLeG9CdjMzWGt6dHNuTTAzYXV2MVB5?=
 =?utf-8?B?TEhocnA2bUIrT005U043TVhzczdOaWJXODRHWHR4WHdIWnh2RXJjRzZtS29N?=
 =?utf-8?B?aitJWjg0Zk5MQW9wTXNOSFNrVFYyWENtZHlINVU4eFdYV2tsdXF0bklxSFZU?=
 =?utf-8?B?RGpOUW1yUk5DT1FGamNlemFiZko2YXFZZGRwZ2xBZGVmb0dNSXRBVG9reW4r?=
 =?utf-8?B?MHhnMTcrTmN2SnJwQ1BQaTZmdDM3RGxKQ0VpVnF4cVkxNjNHL2xadmFtQTBz?=
 =?utf-8?B?MlVZRXphVTFLQnZsRnRnRllZdDFtWU02Lzllb0pmeVpYUStuelNtNk1lVGdw?=
 =?utf-8?B?MEwrQTIvbDVVS3ZmNWhhSXhmR1NrZFpRN3I4cThjNlJ5YzFPQWFvQVBGc2Q5?=
 =?utf-8?B?OEpCNjBEY2FJMjhDNjBTUGpDSnhaYTZoNUdJbFZhVzRmV1dxWFNROEN0K1NG?=
 =?utf-8?B?SkxjL2dqVlRjWGdKOWd0QWZBcmpWZXRrMlR0NGV3UHpYRzVzbzQ3YkphemF0?=
 =?utf-8?B?OVdUMDRMQ0hhRURzRmpRK0J3RDFZMnBPa1RPdlVzZ1N2QXlWcjRwb2ZZcVF0?=
 =?utf-8?B?anFpTXdQbGhMQ0w0UXZTbERVTUlhOWhZZ3hXaVVnM0xGcUR5aTBYN2RaSHRn?=
 =?utf-8?B?SjdkL0M3cFY2M0lrRGp6RlB4aU83VW4xV3JEdWFwK0FjdEYwQlNBQTZQUU9s?=
 =?utf-8?B?U2M1NzRhSWtYZWkxcFQyWVR2dnR5TFhKRDkreG9kV3BtMmlNWCtSazRsdCtX?=
 =?utf-8?B?eUMvckFPMEQyTktMMExwMGczUStob2I4cFFvOXo4Y3VHbVBsL082UktkL1kx?=
 =?utf-8?B?VUgrb3J4YWZUM3lDSkExTzNFaEoxcHdHa0dzWFljZm1CNTZFWXFaSWNxQW9S?=
 =?utf-8?B?WHUxNEVvM1FMNUtwRFh1OGhEZXhURzVTbHVYSVNQcVNrUjRLS0JwTXZtdGlH?=
 =?utf-8?B?ZVlHd2trTWFuNXhLbTA3RlZ1aEl2Ky9VMTBPNmZjcHRCZTF4blNPUk9zcWkw?=
 =?utf-8?B?QjIwczc5TC9zRENuZERlbGt2aG5aOWRaUGs0TVZLdDQ2QTRoL0VaK01uSWxt?=
 =?utf-8?B?b1BEUGk3VVdTVzZHWVkrM1M0VVg2RVFBalpqall5U2kwWmI4RGZoWVJmNXVO?=
 =?utf-8?B?OWEwcjBiLzRzbFM1dVBBNDlVWTIyeS8zVGxmaWg0MG1DRjVVWmR3UWFYeGdh?=
 =?utf-8?B?WkNTNmhNRmhyRkV4MnlUTERyeDFKRGlWSGlHUkVRWERQMTdMMCt5TmluTVhp?=
 =?utf-8?B?RWRjQU5nV0ZXVXdSN1FvQnpLYnI5SCszMTZ3Yk44Ylh2UTRjenhwb2c1QjRJ?=
 =?utf-8?B?SU5UUE53MmdFSG9VRkdZdmJ6SXY0SU5uUXZRRlVRVVV5M0ErL21OSElrdFJi?=
 =?utf-8?B?YXRBUTQxQ1lXUmlRWUV3QllWVzFUR1Bsbkp3SzZpZVcvMm91L1hOVTBvMEJN?=
 =?utf-8?B?S3I0T1Z1MGlCejh5MnFYZG5OUGNNTEdNVjZWNmdvbU9zWmhIYlNvV2hHd25S?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c339d570-b36e-41db-ba9e-08dd206864b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 20:04:49.6941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YaJKLzRLcs/vkReJIeUczzzB4/SA5jdLflPCSx2ywUv6zR5kZANSDKPRYSzhoABs1nF1+ppVkS5ZpYU5OLlB/a0JeQ5HP1Ii+fuWzFSy30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5192
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

On Thu, Dec 19, 2024 at 08:36:16AM -0800, Dixit, Ashutosh wrote:
> On Wed, 18 Dec 2024 15:24:18 -0800, Harish Chegondi wrote:
> >
> > On Tue, Dec 17, 2024 at 12:07:49PM -0800, Dixit, Ashutosh wrote:
> > > On Tue, 17 Dec 2024 01:46:56 -0800, Harish Chegondi wrote:
> > > >
> > >
> > Hi Ashutosh,
> >
> > > Hi Harish,
> > >
> > > Only reviewing the uapi, not the implementation.
> > >
> > > > User space can get the EU stall data record size, EU stall capabilities,
> > > > EU stall sampling rates, and per XeCore buffer size with query IOCTL
> > > > DRM_IOCTL_XE_DEVICE_QUERY with .query set to DRM_XE_DEVICE_QUERY_EU_STALL.
> > > > A struct drm_xe_query_eu_stall will be returned to the user space along
> > > > with an array of supported sampling rates sorted in the fastest sampling
> > > > rate first order. sampling_rates in struct drm_xe_query_eu_stall will
> > > > point to the array of sampling rates.
> > > >
> > > > Any capabilities in EU stall sampling as of this patch are considered
> > > > as base capabilities. Any new capabilities added later will need
> > > > a new capabilities flag.
> > >
> > > s/a new capabilities flag/new capability bits/. Or, better to say something
> > > like "New capability bits will be added for any new functionality added
> > > later".
> > >
> > > See OA capability bits in the latest drm-tip.
> > Will check and change.
> > >
> > > >
> > > > v6: Include EU stall sampling rates information and
> > > >     per XeCore buffer size in the query information.
> > >
> > > /snip/
> > >
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 4ee3b04a1bb5..40c2d274473e 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -700,6 +700,7 @@ struct drm_xe_device_query {
> > > >  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> > > >  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
> > > >  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> > > > +#define DRM_XE_DEVICE_QUERY_EU_STALL		9
> > > >	/** @query: The type of data to query */
> > > >	__u32 query;
> > > >
> > > > @@ -1770,6 +1771,40 @@ enum drm_xe_eu_stall_property_id {
> > > >	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> > > >  };
> > > >
> > > > +/**
> > > > + * struct drm_xe_query_eu_stall - Information about EU stall sampling.
> > > > + *
> > > > + * If a query is made with a struct @drm_xe_device_query where .query
> > > > + * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> > > > + * struct @drm_xe_query_eu_stall in .data.
> > > > + */
> > > > +struct drm_xe_query_eu_stall {
> > > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > > +	__u64 extensions;
> > > > +
> > > > +	/** @capabilities: EU stall capabilities bit-mask */
> > > > +	__u64 capabilities;
> > > > +#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
> > > > +
> > > > +	/** @record_size: size of each EU stall data record */
> > > > +	__u64 record_size;
> > > > +
> > > > +	/** @per_xecore_buf_size: Per XeCore buffer size */
> > > > +	__u64 per_xecore_buf_size;
> > >
> > > This new member has appeared. What is its purpose and how will userspace
> > > use it? Basically how is it relevant?
> > This is the per XeCore buffer size which will be used to create the per
> > GT EU stall data buffer. In the earlier patch, user space configured the
> > per Xecore size with one of the valid values - 128K, 256K or 512K. But
> > it was removed from the uAPI and instead the driver uses the biggest
> > size - 512K and creates the EU stall data buffer with size:
> > 512K x number of XeCores. User space requested the per XeCore buffer
> > sized be exposed through the query IOCTL. In the future, I need to add
> > support for this buffer size to be able to change it via the debugfs
> 
> In my view, Xe is only a temporary branding name whereas our uapi is
> eternal :) Kidding, but you get the idea. So I would call this by a more
> general name such as per_core_buf_size if it indeed needs to exposed (so I
> prefer removing Xe from the name).
From an earlier review feedback, I changed all DSS (Dual Sub Slice) to
xecore as xecore is the new term for DSS or sub slice as we used to call
it. So, there are "xecore" strings in several parts of the code in
xe_eu_stall.c. So, I am not sure if I should change xecore to just core
in just this variable as it may lead to confusion about core vs xecore.
> 
> Because I don't see what userspace will do with this. I don't even know if
> we can expose it if we cannot demonstrate that UMD's are consuming it. Also
> we can reintroduce the removed property in case it is useful (which also
> seems questionable).
L0 folks have asked for the buffer size to be exposed. Only then I added
this field to the uAPI.
I have plan to allow the user to change the per subslice buffer size
through debugfs entry in the future. Although the driver uses the
biggest buffer size, in debugging and pre-silicon environments, it helps
to have smaller buffer sizes. So, in the future I will add support for
the user to change the buffer size.
> 
> Anyway, for now I would keep the field but just the name to
> per_core_buf_size. But let's see if anyone else has an opinion on this.
> 
> 
> > >
> > > > +
> > > > +	/** @num_sampling_rates: Number of sampling rates supported */
> > > > +	__u64 num_sampling_rates;
> > > > +
> > > > +	/**
> > > > +	 * @sampling_rates: Pointer to an array of sampling rates
> > > > +	 * sorted in the fastest sampling rate first order.
> > >
> > > sorted from fastest to slowest.
> > >
> > > > +	 */
> > > > +	__u64 *sampling_rates;
> > >
> > > This should be written as a flexible array as follows:
> > I used a pointer instead of a flexible array as I didn't want any field
> > after reserved fields. But since flexible array fields don't have any
> > storage space allocated unlike pointer, I will go ahead and change it to
> > a flexible array and move it to the end of the struct in the next patch
> > series.
> > >
> > >	__u64 sampling_rates[];
> > >
> > > So sampling rate array is just present at the end of the struct, there
> > > should be no separate pointer here in the struct.
> > >
> > >	https://en.wikipedia.org/wiki/Flexible_array_member
> > >
> > > Also we need to document what units the sampling rates are in. So something
> > > like "Sampling rates are specified in number of cycles of the reference
> > > clock".
> > >
> > > So we have decided not to use nanoseconds (so sampling period rather than
> > > sampling rate)? Any particular reason for that? Though I am ok either way.
> >
> > I decided to use GPU cycles instead of nanoseconds as using GPU cycles
> > will be more future proof to the uAPI. I also received feedback that
> > there are other interfaces in the driver that use GPU cycles instead of
> > nanoseconds, and therefore to be consistent, using GPU cycles may
> > better.
> > >
> > > > +
> > > > +	/** @reserved: Reserved */
> > > > +	__u64 reserved[5];
> > >
> > > Because flexible arrays must be the last field in a structure, this
> > > reserved field should be moved before num_sampling_rates field.
> > Will move to the end of the structure in the next patch series.
> > >
> > > > +};
> > > > +
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif
> > > > --
> > > > 2.47.0
> > > >
> > >
> > > Ashutosh
> > Thanks for the review.
> > Harish.
> >
