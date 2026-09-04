Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B05C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 22:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AC910E199;
	Fri,  4 Sep 2026 22:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMyKtoRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305BC10E199
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788561331; x=1820097331;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VFT3rwZ0FwzRgmTkQdw9FDmp3DdGnnvve35WeJ4S6xY=;
 b=UMyKtoRLIZXLvHdPZIsoyLyNfyRahK5NHA5f0GaRTxeN9jr9ywKTcLD1
 +APpKQXmkWqzAFiQqRwFbdz2B8uUshnl4xhfJF285OeCjFTfg194kNjee
 FAGzcjP0LzPWVt7zwmk4pX8C9sb7ustn1sYuy/lC3o+JPmRUnA6/huF5G
 fMIYekjffmY4nO+MSwyrdX2RFJfI1LS0ZUBSauJL5xJMqffQ5L7QBcHwm
 rZwzPduaNBMCKBMaMCirfh3H3qQsBKX/G7m/Gy302tNpFGOsFjmiNlS5K
 +8Xy3C4apKdlKyjUeDcirQkoxSd0waFzp+9+y3EYH6LabjkPE4ykOFLBI w==;
X-CSE-ConnectionGUID: iZv4IoqTRE6pgSULK8tnvw==
X-CSE-MsgGUID: xQvEHNcUSA2UquY1jRwiZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99400710"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="99400710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 15:35:30 -0700
X-CSE-ConnectionGUID: UqiDe/nATSGL8UouTCsQHA==
X-CSE-MsgGUID: 0LL95n20R2+r3qIAD7gPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273942790"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 15:35:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 15:35:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 15:35:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 15:35:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbJ9MLDD46PshRDdGBGeOtdGdpaouTI7o0rSiAtPXhya72bbnNOj1n3KnXZtf+TAXSA6MZuqh+L/MAufDg6g8IaR7Y2Ir2tIasMzoyVRxto3jvF/wt43EPVbvULNOkstMrGRBhip+2mx0GqTNbSnOHZHTamnk5ctoyFsnUSZ1cMqxHR6/NFcrFkF+bzmJ2JJ+4TonLIUIr/wuNCAMPauJUgDm4TqyFIbvNvpiiewqeQJs8hCYJZPA9ANnblT2g8qFes193wTGy8NKyGTkewT63XRWUEIDXNrno+mLeMgmV6V4v+OdoJYZ3kZmSm4bvr4DyUN69ptgLDn8+j/fm5hCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrDiOz+AOpXT6JnAaakFOelyw8OIVc/WADAGxDJM4UM=;
 b=Hc7OU8+9zfGfE4vaOVi79hc6HWsjolJZzfzqHVRBX52z0Z5aQ67yoXOULgOHcvBCVo+/gA/1YKY+EfcJ3YIEtpgJMJAjizvKlxqSWpwkdIzh/3jXeTPczuUt2OZn7K7d4d+iOEk7l3BLAckFS1EoveWq6ZYDVy45DkBI3Aoe3Cnm+OY1FfxIjrEND0h4y8UCgZiS8BxhztNhV7CpwF3X2zglOcfn4dd8HGahZFBeDveBAbKHP+JkxLcJDsxvEXSvyYM8oo66EB9kNULiVfaD7L5FxbQfwhVDzS9UxdQi0muvUklLAwCJlcjJE74eGWLX950pjetZVFdagj+e6aHjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8475.namprd11.prod.outlook.com (2603:10b6:806:3a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 22:35:27 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 22:35:27 +0000
Date: Fri, 4 Sep 2026 15:35:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Jia Yao <jia.yao@intel.com>, <intel-xe@lists.freedesktop.org>, "Shuicheng
 Lin" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/guc: skip TDR timeout check when ctx_timestamp is
 0 or 1
Message-ID: <aptHq+dYSBbtRQqW@soc-5CG1426VCC.clients.intel.com>
References: <20260904180943.3455267-1-jia.yao@intel.com>
 <apsLfbXfIYuJgKUl@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <apsLfbXfIYuJgKUl@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: e9618344-8f35-4cfc-bfab-08df0ad4d10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|56012099006|10067099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: nlNPO7t5ec7HE1m2nzQ8Es1913P09moH4+4VsP7jiGop0erCp81yYl1rV4z8J7i08U+u5AbKnqqKKQxWxsh5EQusNXW5MLBuvuqoKi75QmJcglrhvT3V/nEkAfiGmROTcUobjbHKEN6lOVSSqyyDAL6aw08DTqMcx4XJE1p+ZM/VVTmEbi6dldPJayuFKoJuoCHq0HwDQw4u7xdjHPaIzgL5vojN6ogqCx1hb3+nCUpgovUCq5HsEZoSubhfl15eXqBmialToNB+GdaWZ0u43XPFBaMC2nKoZNmeS6TqS7syRSI8d8S2HVpS8JoBTmkaPejvMqWp0LkSRWNv3NZ6KkK3T4jf7mE9h1iiHrn6tHNkkY+LHccLeVQ/MYfs4humgwHQGyCZeRHj7phrwMD8O1/vbIJDVZtYpBcCrHmjcTuREfd9Ufuyhi/reWOgSHj17WwyNo1XZlBm4m1wWvYUoApapjmDOM7YkPGCezhxCHGUIUjGLZP+HKlbp/ztLlQiZ2MjhL1dlUprAzM5Ix9xaNDX4uI24Badx/Kc4/UyqmDOfIeRO0Is8TxlaQrG6cq+NSPjGkSrBBtHwNOTx2N9aZNlqLalqb9sP/DZQ7ET/rlr/HBq42F5fymTSvieL/lrpTd6Buj7c1oX27BT4/sAJ6ToZKA6iD5fujV4T18+1Ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUNmKzBMZ3dXN1JOaTRuWTBncHpGS1hqdnFzaHBWaE1VNmoxUk9lanRTK2JU?=
 =?utf-8?B?NHdrL013dGZYWWdoVXBaRGk1UHJJRGdBRGd2c1U1YnlkWFBEN1R1QWo0OWVI?=
 =?utf-8?B?WHlsMFhLVjJnZkxaVHBPZ3BEZHBvVU5rRGtEK05LVklXRmNna3ZCeStLTDk1?=
 =?utf-8?B?d2JaMS9lamtJcXVzTExLdGVhajd3Nm9ST1hMdHVHaFovc1dKaHFOQi9mckRm?=
 =?utf-8?B?SWM4QUNkRlhyY2FIbEV6WlRYYVBIU2IxUzdPdFc2aDR5a3k4UTd5ZlNNUTlI?=
 =?utf-8?B?dnJaVEd5S3Q1Z3lXWDZVVG1ieml6Z3VMWklqRGkvV3hWYW43UTBiVGhmeGQ3?=
 =?utf-8?B?ZDl6VzRBbGFhczE0OEp2bGRkU041NmhCYkNCRTl5RS94YUNwZGEwbnYxS2pJ?=
 =?utf-8?B?NGdYWHlXZnJ6SVAyT1g1MVQrY0IzYkhPWUU3MHVsWnUwU253K09vall0SmtF?=
 =?utf-8?B?akQ0UlkyVGI5bEY0b0Nya2lYWVRpQlNqVExwMEpEeXdYb2ZpaE9GOGU1bUtx?=
 =?utf-8?B?TFNseGlBVXhPSVQ0WG1kQkpGalhTVWhzTXNZblJMNDJteU9jK0ZtYjNIY01M?=
 =?utf-8?B?YTlsS0t1TG9DV09pQ2NZb3Q2b1plbFVrV3BlM3p5RzRDT0duVkU4cW9MNmNs?=
 =?utf-8?B?VEtwRS9KcEI0Z1hEWXgwcFB4cjM1NlhLYkhDNkdUeENlMnk3d1VpaUR5dkda?=
 =?utf-8?B?VlgvYkxsMUZDdlc3TjZUNDNaUGh3d21ZeFFLMXI0eW84R3FDWUhTQ0hOeWxF?=
 =?utf-8?B?eXpBc3YvVWRyQ1RIN3g0Tzc0cUVRVlEzVFlwUjE2M3E3VnlaamlLQlAydlIv?=
 =?utf-8?B?SktBWnpIU3QvamMzcysrZEY0WVpMVFlsSndRMXFMTWZneXM5Ly9kTnJlUVlt?=
 =?utf-8?B?ejUwdzRGSG5BNy9SRUQ0MDkrQzdicHYyWFBrQ1lzdUdIRGovY2Q2ZUh2TDB0?=
 =?utf-8?B?bC96MzB4NU9mcSt3ZEdTQUxLdENRdGpyOTBocTJtSTIwa2xHY0lQVUJqa1Mx?=
 =?utf-8?B?enlTeG9pNW83U1c1Q0hSRHVva1N1bEVSYTBaczZEVzAxWXA3bzU5VEdTVTMx?=
 =?utf-8?B?Mi9HWjI5YkRTVXlMSENTYVZOOE5iOG0zNFZUNWZmcEdSaWtnc1hmQ2VDb01s?=
 =?utf-8?B?NlNzVmtWZ1lqU09naCthUjNEb2kwb3huRVB2NVJ5YVFMaVFhNVhHM3Rha3Nk?=
 =?utf-8?B?VWloVFVUM1o4ZE5idVVndzNEd0YwMFN6b3BhTmpyTUtPTGFOSTRKaEJlOVV1?=
 =?utf-8?B?RzVHY3pCV1ZWVlVDNEJMWE9FY0hwQi9kYjNYcko2eUhWMTBOMFlld0VMZWMy?=
 =?utf-8?B?RXlDd2k3QVZUb2l2Nm5HbDNVYm5wYjZYNTJLaTlHd01OazBsdUZKT3BzRjNF?=
 =?utf-8?B?dFIzVEVNUDBwcmRTbjdvbkRCRS95UXNEOXZ1R0djQnpYaG5VVXBUdk5IM1VZ?=
 =?utf-8?B?V2NqS2d5L2V1ZlF5OUw5emdEelBXV2xYajQyRzdqY2J1cEVUMFNyNWpsOGw5?=
 =?utf-8?B?ZU10dVpDaGJQQitwUVRjYzRtNXBhSHBaMVM1MlNxMncySG1jUmxFK0xDd1Ni?=
 =?utf-8?B?RU9ZQWN3aTdBelFhL3F2c1N4cWdza0gySngzdndaUEx5bnZiVnE4enR6YWlN?=
 =?utf-8?B?WklKdlZqZ050MUtLYnEySWRNYmNaVTRveW9WMWk3VlROa05GYnFlcXlxeEZG?=
 =?utf-8?B?RzVWZEFCTVV5eVVlTkFrb01iNmpGTnIvTk5pUVpDT0ZlSHRiOEhzQ1A0Qi91?=
 =?utf-8?B?MTFweHQ2U1JwbWtCZFJzazRCdnZqUk54c3JBaWJ2SmZJWjhieWI3WVpkbExk?=
 =?utf-8?B?Nk1uQzh0eTA0N2Q3UUdreGNhTWdYS002clVkclJpb0UzZFBnRXB0VTNSc1g2?=
 =?utf-8?B?bmU5TVZvU1Y1ajZtNTQwUVdYYXdhUEF3S3h0aHZuT0hiS25RVk5IblNyR3Ey?=
 =?utf-8?B?WjdRTHR1eWFnSmFLMVp1blZZZmpyZWpmWnoxNTVCWm5TUm9rcDhNZmtkMnEw?=
 =?utf-8?B?QWxxekRmNU9VQ3l1eVp2azF0bzA1cVlmSXpOVEhGUzhCeDQxM29YdUhUQUo4?=
 =?utf-8?B?TlBRTDJaQ1Uzb3hiU1k4VUozV1MzQXByR1lpanJHNE5xWUFQdjdvWThVYVFq?=
 =?utf-8?B?bGJmeDI1RUtGZE5abjhibWJMU2Z3VzJpWkhHRldXempiSDBSZS9TbXZFNHR2?=
 =?utf-8?B?a3ZFK0ZTN0NweEU1R1htVTVEckUvS2Z4TWlhOWpUWFNraWU4Ymp6Q25tWWJK?=
 =?utf-8?B?M2ROUlNtN0ZzUnd6b2o5bTk5ZzJzWi80bnVhTVphenIwZVJyVHdjZXRLRU00?=
 =?utf-8?B?anVDYm56QmRzdlJmV01EVC9XMThHNXRiRjYrRmI1S1BIdWwxaUNmK09Ta05N?=
 =?utf-8?Q?3wR5MPpAntWlCAnEDEM6H5PAtZaI2jdJivMmT?=
X-Exchange-RoutingPolicyChecked: rR7mrbQn+XEA5mya23QaMLNCmCFEGNjvsIeL9tdvku8+T0i5z+jVLrhi2NsMPLF53z/j31FtF1ABt3TtTra1pFhFEp0Wc70sQbw1+QQ6u0eB1dQ0Ej3TByoGkQsqBFP9DtObWdnGO8C63kalUkX+/H7UoT53vVD3m8cdIyAUqk+pYRRsax3rDjDxYF778a/2oYgGVXWZNz8e73AJ43Jb69MHjc1X9y/TBtjiXtg5GVHZC4trermvRBbicpGHrHKv+SvSwoaklev3jspNMA/fX3MR7Tkh/+tnG7tzIfV3JvYyKmoZAqcK2NpLzZ+7ivrPTomGRmnM1mtNN/+hh8zKfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9618344-8f35-4cfc-bfab-08df0ad4d10f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 22:35:26.9445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJf0FbbZFlbb2gbzWKRozMYv6CGc2iuNIP1n4JPekJ9MG67jEMWcopLPgzEk2c4nrI5BNLVKlIpH2VvmwRZ/gUMj+9cA9MlEERCL5FLJd6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8475
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

On Fri, Sep 04, 2026 at 11:18:37AM -0700, Matthew Brost wrote:
>On Fri, Sep 04, 2026 at 06:09:43PM +0000, Jia Yao wrote:
>
>+Umesh
>
>> A ctx_timestamp of 0 or 1 indicates an invalid timestamp:
>> - 1 (CONTEXT_ACTIVE) is the cookie written by the WA BB immediately
>>   after a full context restore, before the spinner has run.
>> - 0 can occur when lrc->ctx_timestamp shadow is uninitialized or was
>>   last updated while the context was being restored.
>>
>> In both cases the timestamp is not yet valid, so reset the sampling
>> baseline and wait for the next check_timeout() call.
>>
>> Signed-off-by: Jia Yao <jia.yao@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_submit.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 0a6e2b81b5a5..caf02d265533 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1429,6 +1429,20 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>>  		return xe_sched_invalidate_job(job, 0);
>>  	}
>>
>> +	/*
>> +	 * A ctx_timestamp of 0 or 1 indicates an invalid timestamp:
>> +	 * - 1 (CONTEXT_ACTIVE) is the cookie written by the WA BB immediately
>> +	 *   after a full context restore, before the spinner has run.
>> +	 * - 0 can occur when lrc->ctx_timestamp shadow is uninitialized or was
>> +	 *   last updated while the context was being restored.
>> +	 * In both cases the timestamp is not yet valid, so reset the sampling
>> +	 * baseline and wait for the next check_timeout() call.
>> +	 */
>
>This isn't right. `ctx_timestamp` is the 32-bit value returned by
>`xe_lrc_timestamp()`, so 0 and 1 are valid values when the timestamp
>wraps. If you were checking the full 64-bit value, then this might make
>sense, although I'm not convinced of that either.
>
>My understanding is that `xe_lrc_timestamp()` only inspects these
>special states and takes additional action when 0 or 1 are detected. As
>a result, those special values should never be propagated to the caller.
>In other words, this is not a raw timestamp read, so we shouldn't need
>to handle those cases here.
>
>Umesh to confirm my understanding is correct.

Agree, we should not add this code here.

For an LRC, ctx_timestamp of 0 means the context was never scheduled 
into HW. We cannot treat that as invalid.

We should never see a 1 returned from xe_lrc_timestamp(). 1 is used 
internally to fetch the right timestamp to indicate how long the context 
ran. If we see a 1 here, it's a bug. For a brief period of time, such a 
bug existed in this tree, but it was fixed in below commit:

drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe

Thanks,
Umesh

>
>Matt
>
>> +	if (ctx_timestamp <= 1) {
>> +		job->sample_timestamp = U64_MAX;
>> +		return false;
>> +	}
>> +
>>  	job->sample_timestamp = ctx_timestamp;
>>  	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>>
>> --
>> 2.43.0
>>
