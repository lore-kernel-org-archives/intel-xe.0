Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D78C3601A
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 08:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BB610E08A;
	Tue,  1 Apr 2025 08:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FAYge71t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74A910E08A
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743495285; x=1775031285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hy0rjomp5SXierMt/gSeXuAXVyAbZqP3nJ4saHnrTWE=;
 b=FAYge71tubK+mToZvMgSh6UXVaoxAtc5yTM3B2jdIRX2jPUroukEOCZ5
 2G04SdlxFXGhlqunPfNdF9Fh7+GCfkKj5/zCUAm/xHQTsJ1M+zOOKtwic
 h95vF002DL4o+qAInu1fSybPsTFS8UsewTm+y0dQ7s9KrLt3N2bnYgYhq
 OIZV8sqjSJYs3UW0mLNCjAR08mCBk4b3W46GSfGaCqkxMLKCfy+Z1Xoy4
 rbsbnbn4Zc3mYQzxviovtSWJ07ojMY8VUFD95UYUD5i6FnNHRkvDDNwc9
 JbL5wpBcBCJZZW8GCRLITr5+DLqWjUhmkAeWAfsHQuLGeitXN7/7+0uK8 w==;
X-CSE-ConnectionGUID: gi9NJ43kQCO49tDZ8jb67g==
X-CSE-MsgGUID: TukMRW4/Q56vz2jaeL9/0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55803392"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="55803392"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:14:45 -0700
X-CSE-ConnectionGUID: x8zSyjSYSuehv3RAozQpWg==
X-CSE-MsgGUID: H1126M2MTY6WWI+mzUD7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126553615"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 01:14:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 01:14:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 01:14:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 01:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S700bTnirjy3RSl0eahYm1DdXzorw+qXmW1zmUPb2e2D8cPVaxMJMgKr1+DvrbtqYBOjJznuTxJs2mbw1rFVZ204A5Hen/1zDG7d/7VHflxL8wB7EfOqAOK6yHRIgJQ5WQpcEBENU5dG+Pzxzy7y5Ozc7v0IaVehnKIWBNatI006hqhdBeK5jVzXiK+B1+dUVDAuOuy/W5ai4qm0NjYvCVgFzejE4g6Ps/unvOSGNTR09ne4dbEI6tLV57QrwhKuO1F21aK1lxOOaQNYsaF4dCvj06y/LwI7KEMkYrUNtmAJRBhv9pAzhO3VGm16GUCR+MPPQ7tCSigASG/6rmiujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHlesO6l4uiNjq4VqclK7Q9gCHPX70Kna5MlDDGQ3Uw=;
 b=My8pv8Be0/bWtWWXlo8Q1foeVH7bcbFDK+/DPJSlMYUqBqiASKNScYQmKODr+QFvQ2m2xcj9TzibAWP2rccj0ZUDbKyZDazOd/lFjQmF1wfpAoQJpFLrlIUvfVrsNq/RCsyOe7ITSSzz6yX/8HeKuYiSUMV3+/DFgQV89ltURqYShp6cQbXFprbwMpr2nL/urk2w/35/Usinl6K45PabIJTNacb0/SlbY6WBFbgEFBP8hetroJox1n9daEdPQA9+RjvKShfKws42zRpRLwOwKR2lPuezrLh91FR8WM9OCspqMGS4sp84DE4wF2hHLF+MoCosHEjQCSk3SyI1BR3isg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.47; Tue, 1 Apr 2025 08:13:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 08:13:55 +0000
Message-ID: <cf07493a-1b46-47ff-a074-2c37003bf5e2@intel.com>
Date: Tue, 1 Apr 2025 13:43:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add configfs to enable survivability mode
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20250327064204.459968-1-riana.tauro@intel.com>
 <20250327064204.459968-2-riana.tauro@intel.com>
 <52rohjfpmrdvdqs2kzyc7xkts2qnus34n2mexk2fkf5dr5o5eg@be4in62elg3r>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <52rohjfpmrdvdqs2kzyc7xkts2qnus34n2mexk2fkf5dr5o5eg@be4in62elg3r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 8128ba9c-0424-4ec5-a05b-08dd70f52524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjVTd2I3OEVQSTdYWW1NdlptOUFFQ284Z3RLU3BNNTBRTXQ3YjhyVDh6WEhr?=
 =?utf-8?B?dy9qVWZIRTFKZDhOWU8yL2xER2QvbHNZL3N6RXFJNkNUd250UVVpZzY1bHM3?=
 =?utf-8?B?Y2dQamZhY1IzeU45T2NBNzlwdjlrakFVdUJrMEZ1eWYvL2t4NnVvNEZCWlZH?=
 =?utf-8?B?RDNrYWlxMm1xeHZrZEpXcEVXQ0k3NktBYnJta3BrbXRXTkVURk9ucWo5S2dm?=
 =?utf-8?B?UmUzUzdpamNzcjB6K1VPRHpyYkg2SFBhSmpWV2F5UXBSbWpkZGlSa2JCMHl4?=
 =?utf-8?B?TVJqT2pHdFhlVzMvVmN0UEF6Qm9VcXBBUllVbXZ3NWU3RUZod3JxVllNT3U3?=
 =?utf-8?B?K2VkQ3crODg1OTMydW9GdUl6cUNTTE1LZFNTQ25PYUhWSUROZ3E0d00yNTdo?=
 =?utf-8?B?R0xJdTEyZEhhZ29XYzYrWlpBT3JtMVJBSUdmbnViVmxNLysrcmhLaEFBVy9o?=
 =?utf-8?B?bXYrbUhjdDRtRUxMUHBIWjRYVG1CMnNLVDBQY3NXS2toS2xBYzQrYkhhTllY?=
 =?utf-8?B?RkN5QVQ5VUlXS3hTSUNBeE03cFM3emRrVGRHVXBBV3R3VXlnT3NmTDFISVk2?=
 =?utf-8?B?L1FqTGRXaUV4anE0aFRBWjdIUnRQN3V4MGhKWURpazN0K1hRdjVHRGJTdnY0?=
 =?utf-8?B?b1FFN043bGJ3Mjg4ZFN3cVh3WDNCR3pZMFVoRkt0eUpIYjFaSUpiSWJ6cjRT?=
 =?utf-8?B?Y2tvWFp5ZysxaG5sdUgzQ3JEY2xpZWZaMERBaGpIaEwzZGo4RG5JWmVsU2gz?=
 =?utf-8?B?OGp1RzlCRlFIOVhNUVo0YXBFMld6a2loNnVzcjBMSE9yRHh2dmh1Z1B2cTQr?=
 =?utf-8?B?RlhiOUJVYXF1YjUwb0hZQUwxeXBPNFYzZ2lBcjBhdlViSDYwT3UvcWcwL1B5?=
 =?utf-8?B?Mi9TYXJSNUp5MWVTNStmemc3bUhuTU5YSW5UdGZFYjVHWEhPTWZZcDZxcmRU?=
 =?utf-8?B?eXhqRFZKMVhIVU1ZaXdDWWIzT2FCV080QmdXa09hVHZMTERnK2lKc09SOEJF?=
 =?utf-8?B?SVRTZ2ZiRlUra3RYL2xlY0N0a3BkUlQveUFQdkpiK0U1aDBYWlZtWHpnNERE?=
 =?utf-8?B?SDBlS0MzM0JQOUEycCtJa0dnR2dlRzdCOVBPZlpKRlBRamdmL2FRbUdxZXZZ?=
 =?utf-8?B?OUJEYkVSdGxJNUFMWmZsaTlMd2RsSWQyY0NPQVVPbFhWMHViUklIZHRsOXVZ?=
 =?utf-8?B?YkEyZ2tSUk0weW4yMlUwMVhuQ2szQnFUQk91d3Q0Mloxd1ZZeGNvMWN0UCtt?=
 =?utf-8?B?UVpwWDA3cjYvdlZ6Skl2bGcvY1kvc0xrRzVaNm9DY0dqL0xCRU5IaFVFbGVY?=
 =?utf-8?B?REdsMEl2UlI4VU9Va3ZrN1BoNGlRRXRaMVlubWhURjMzRUJ1U3hnUkc0MVdU?=
 =?utf-8?B?SFNQLzlZMnZvT3I3ZkNFMDFWNVhQU3FseTVRcEhjblFvWnArMFE5TTd5TDEv?=
 =?utf-8?B?VXRWaTRvUXBRZUZBb0l5SmtIUUtZQklscTUvS2ZiZnRlZHcvczN2SjJpOWpU?=
 =?utf-8?B?VlAxMVhXNHd2UE1sTC9CSHZsVHFTeHZiVnhNNkhxYjQyMmlVZHhiR2hZbHBq?=
 =?utf-8?B?ZU9nTi9wSDAzK0srU0IxdkNXVkJJUndyRzI5d1JBQlZLKzNYZk8vUTFTbzZh?=
 =?utf-8?B?aTB4UDl0Nld4VW13WXdYT3FrQmRTbnRqUTFkVytQQldpUmpaejc1RkUwb01K?=
 =?utf-8?B?MndEQ2oxRTFCZ09Ud2tZMTZFUjc4ZmU1V2hxY1JiWmJ2MU1veU5DMFhSSmcz?=
 =?utf-8?B?dlY3YXBDRmdWL3QxVXNQR0kvcDFJT2hWSWVjblljRm9iZTdlaTdYcWoyYkRP?=
 =?utf-8?B?SVk3YTZ1SUdsQ2tncDVWTFRMSXJpdy90bUF1NnEvazQ2ZFlGSXVYelZSaDl2?=
 =?utf-8?B?NFVpZmRjRU9MVG1DYTdrSlBiNm5ML1F4RXRLRHRQeHdSQ1RQYlQreFY3dGRY?=
 =?utf-8?Q?UdDq+53y7+k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVdMVDVSSDVwdkUwV2piZ0d3RVlqaVlNOE5PNkxid1YzeDZDbHBUTlVtbDVw?=
 =?utf-8?B?QU9Bd0hTRU5PMHY0MnFoN2U3QmN4TEdEUTgzVXhaVi9YbUpBTE4vM25KdTI0?=
 =?utf-8?B?Q1V4THgxMXZIVmZSWVYrVnNjVXF1WVhYUjdERFBPU0lZVzVpZ001emhGcUlL?=
 =?utf-8?B?Q0k1OWNFVmY1REJxRWhpcDJEM25qUExCQVdUbDRnUVpiNzBOL04yMTE4S0Rl?=
 =?utf-8?B?eGhGaEllekgycThpa1YyVXZNWHpncCtuaUtwY3oyQWFvalBwWmhVRFA3dUtU?=
 =?utf-8?B?UEN3WHBCZkJkWkJmZzBjbUZocGZtTWV3S2FkMWFSRzl5OUJwOEhldU12c0xF?=
 =?utf-8?B?TEV0MngrZmIzeWZOUlpFalpBMkRKMENLK1pHZkVUdGh5WVF6Nk1CdkFRVk9N?=
 =?utf-8?B?MFNEdjBMS3hKNENSK3R2eDI3TlBOMzRiVDl6MGliUTB3NHllai8ya3c1RVJY?=
 =?utf-8?B?MVBFNHdtOHpCc0MrQ2VhWC8zZkNzSGl3dGhha3c4TjdyNUpOVjd0dDBHM1pq?=
 =?utf-8?B?dDd0ODd0TU44SDc2akZ1SGhIeDMzOVcyTkFqcjF6QlpyWDdMSzJDZHhoRmIz?=
 =?utf-8?B?cGZlaUNCR3poQUNXM3BkSmMvMXJOOGM4OEFBcjZMYUpiVlhyd3pqb3Q1aDhM?=
 =?utf-8?B?RWtUT1pHb0lJVldKRitLUUVTanpqSjljLzFlazZ2dHBDQ0JPL2o3aU5Idmhl?=
 =?utf-8?B?R2NqQ1NtWTI5dHRKcUp5dkgyR0cwR3F4VG5aR1BIc2hKVVBzU3FKY1ZzVVNB?=
 =?utf-8?B?TWRMSSsxdTZmREFoNDY4MlIvcUxjOExJMjBYVjRKMWIzd2pLeXlQSCtjNEV5?=
 =?utf-8?B?Z2hRV1N3a3B2SVlBNUdoc25UUldJcTJ3aWxJa0V4TVF1YmtkeGFEb1ZFMTZx?=
 =?utf-8?B?MHpiTFFKZXZldW9yK2RLQ0hmVDI1RUFWZDlWTVp3STJyaVpjbXYxVXJrelBX?=
 =?utf-8?B?N2Vka0VuZXJnZGZ2ZWdoRWh0REpHMC82ZHNrYk8wNGl3bTY4dG9iUzVnQVNF?=
 =?utf-8?B?N29YbFo5U2NzV2lmQVRjOHd3eXg1TFZPRmN2SGY0ODJZdGtwYTUzcVdwMktJ?=
 =?utf-8?B?SmxPbG9WZEZxbUVjKy9FTDludmJYSG5PN3JTeXhsSHFoa01GS0pMdkE5QzRZ?=
 =?utf-8?B?NUI2N04vTmVDaUU1UjVPMFErSzZ3bEs1Z3NSTVdkQy9WTy9jWXRKaEtuR3hB?=
 =?utf-8?B?WDUvSTk2R1BaSEF5eDBFdk43VFZlaVhzUmtaa0ZzRjlUc3VkTFFUY3MwS0Z6?=
 =?utf-8?B?Vko0eHF4dy93NWRZZTQ0Mnc4OXJsT1Q1MXRiTWltN0pLbDNSQmJYOHIzN21s?=
 =?utf-8?B?QmNwWGtPb1dZOTQwb1lXbzRSZWlveWtvUUVSM0RzV2ZIMGw0d0FucFVBUUov?=
 =?utf-8?B?YkNVc1oxV0RIZ1hseURyTDBaYU9sOXpUL0VGZE9lK01JUW1PbkhQZjNkQmpN?=
 =?utf-8?B?NWZwdzIxVWdDY1dxbHpzSlB4SVBDQkhRMnJXbVJ6ajVrZDdCSTI1VjhlMVpP?=
 =?utf-8?B?bEtyNmcyMU1qK2tVc1FmdkhhZlAxajBUdW1TNzJpNEdkMWVKZVEwKzROajNP?=
 =?utf-8?B?SkxzTUJuOFdUUTdCOVQ1YnB3TnlaVytWeS9lRzVkekprSFRkN0FLZ0lDdU02?=
 =?utf-8?B?OEI4UHVOM244Rkl3WkVTS1RNRUJtWmpSS1ZseUgxTk5MUW1VWElDdnBlaXdl?=
 =?utf-8?B?ZXRaR1hMVjZub3hjLzdFeVFSRStJUHZHSWNUam5TS2FDbDBRb1AwMGlhaXN0?=
 =?utf-8?B?Mm0wWTB1R0ZicU9jQWtrSFQ3dXFPTThNajcvcnpLRk9HWHBxRXJJUktmQnh3?=
 =?utf-8?B?akRzUWkxc0w5VDlwWXY3VngvS0R5VE9PNTBtVzlzS1J4ZUZqd0tLdlJiZFJY?=
 =?utf-8?B?d0RKdlBicVQ0TGRIVUlyR2NjV3R0UmNHbzhVcmRsYU91YWhWY0M3Q3c2Vnho?=
 =?utf-8?B?RUhDWmgxb0dzYWtuc09CYm9paHlVWDF1RlFaSUJFQnc4Yk1RRFVoTjQ5Uzlv?=
 =?utf-8?B?Q2hoMnd6aE1LdE5IQ3RmbnZNN1lRc0srd0VYZHFMNkZTRTUvd3ZXaUpRc0pE?=
 =?utf-8?B?dnhJSlBEQW5nd3RQTWZ1MWY0dlRmenQ4MmQ1ZVZmeDJlcFNEa3YzMWhINUlO?=
 =?utf-8?Q?xh25XT4WeXj2e7ldWWXQVs0b2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8128ba9c-0424-4ec5-a05b-08dd70f52524
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 08:13:55.2582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FA1Gk4zUI+KEQ6QraxSSjUmF9zPMz/cp1FTtO3osLz9auT0wI+8A/C9R8fBIZp0CVVD/FuvYsFi1vwvjIUmLdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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

Hi Lucas

Thank you for the review comments
On 4/1/2025 6:33 AM, Lucas De Marchi wrote:
> On Thu, Mar 27, 2025 at 12:12:01PM +0530, Riana Tauro wrote:
>> Registers a configfs subsystem called 'xe' to userspace. The user can
>> use this to modify exposed attributes for a device.
>>
>> Attribute exposed:
>>
>> /config/xe/<device>/survivability_mode : Enables survivability mode
>>
>> The attributes can be modified by creating the device directory under the
>> configfs directory
>>
>> mount -t configfs none /config
>> mkdir /config/xe/0000:03:00.0
>>
>> echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>> echo 1 > /config/xe/0000:03:00.0/survivability_mode
>> echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile      |   1 +
>> drivers/gpu/drm/xe/xe_configfs.c | 174 +++++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_configfs.h |  11 ++
>> drivers/gpu/drm/xe/xe_module.c   |   5 +
>> 4 files changed, 191 insertions(+)
>> create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>> create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index cd464fe26eb8..190176c2e10d 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/ 
>> %_wa_oob.h: $(obj)/xe_gen_wa_oob \
>> xe-y += xe_bb.o \
>>     xe_bo.o \
>>     xe_bo_evict.o \
>> +    xe_configfs.o \
>>     xe_devcoredump.o \
>>     xe_device.o \
>>     xe_device_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/ 
>> xe_configfs.c
>> new file mode 100644
>> index 000000000000..59e1bc4c5f76
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -0,0 +1,174 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/configfs.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +
>> +#include "xe_configfs.h"
>> +#include "xe_module.h"
>> +
>> +/**
>> + * DOC: XE Configfs Support
>> + *
>> + * Overview
>> + * =========
>> + *
>> + * Configfs is a filesystem-based manager of kernel objects. XE KMD 
>> registers a
>> + * configfs subsystem called 'xe' that allows user to configure 
>> various attributes
>> + * See Documentation/filesystems/configfs.rst for more information 
>> about how configfs works.
>> + *
>> + * Create devices
>> + * ===============
>> + *
>> + * To use configfs exposed by Xe, mount the configfs directory and 
>> create the device directory
>> + *
>> + * $ mount -t configfs none /config
> 
> nit: once upon a time I think the "standard" was to have a /config. Same
> thing as for debugfs. Nowadays I think pretty much every distro settled
> on /sys/kernel/{debug,config} for debugfs and configfs. Mine even gets
> mounted automatically:
> 
Oh okay. All docs had this so added the same.Yeah i saw the 
/sys/kernel/config being mounted. Ok will change this to generic

> # grep Where /usr/lib/systemd/system/sys-kernel-config.mount
> Where=/sys/kernel/config
> 
>> + * $ mkdir /config/xe/0000:03:00.0
>> + *
>> + * Configure Attributes
>> + * ====================
>> + *
>> + * /config/xe/<device>/survivability mode : Enables survivability 
>> mode if supported by device
> 
>     * <configfs>/xe/<device>/survivability_mode: Enable survivability 
> mode if supported by device
> 
> 
>> + *
>> + * Unbind            : echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/ 
>> unbind
> 
> please, no unbind. The unbind part is part of "the previous time the
> driver was attached/bound to the device".
> 
>> + * Enable survivability mode    : echo 1 > /config/xe/0000:03:00.0/ 
>> survivability_mode
>> + * Bind                : echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/ 
>> bind
> 
> are these extra spaces to try to align anything?

aligns in the code. will generate kernel-doc and check>
>> + *
>> + * The device enters survivability mode if supported
>> + *
> 
> trailing line.
will remove this>
>> + */
>> +
>> +struct xe_config_device {
>> +    struct config_group group;
>> +
>> +    /** @survivability_mode: enables survivability mode when set */
> 
> I don't think we should kernel-doc this. But if we are, then it should
> be proper kernel-doc, including the doc about the struct and not leaving
> members undocumented.
will remove this>
>> +    bool survivability_mode;
>> +
>> +    /** @lock: protects attributes */
>> +    struct mutex lock;
>> +};
>> +
>> +static struct xe_config_device *to_xe_config_device(struct 
>> config_item *item)
>> +{
>> +    return container_of(to_config_group(item), struct 
>> xe_config_device, group);
>> +}
>> +
>> +static ssize_t survivability_mode_show(struct config_item *item, char 
>> *page)
>> +{
>> +    struct xe_config_device *dev = to_xe_config_device(item);
>> +
>> +    return sprintf(page, "%d\n", dev->survivability_mode);
>> +}
>> +
>> +static ssize_t survivability_mode_store(struct config_item *item, 
>> const char *page, size_t len)
>> +{
>> +    struct xe_config_device *dev = to_xe_config_device(item);
>> +    bool survivability_mode;
>> +    int ret;
>> +
>> +    ret = kstrtobool(page, &survivability_mode);
>> +    if (ret)
>> +        return ret;
>> +
>> +    mutex_lock(&dev->lock);
>> +    dev->survivability_mode = survivability_mode;
>> +    mutex_unlock(&dev->lock);
>> +
>> +    return len;
>> +}
>> +
>> +CONFIGFS_ATTR(, survivability_mode);
>> +
>> +static struct configfs_attribute *xe_config_device_attrs[] = {
>> +    &attr_survivability_mode,
>> +    NULL,
>> +};
>> +
>> +static void xe_config_device_release(struct config_item *item)
>> +{
>> +    struct xe_config_device *dev = to_xe_config_device(item);
>> +
>> +    mutex_destroy(&dev->lock);
>> +    kfree(dev);
>> +}
>> +
>> +static struct configfs_item_operations xe_config_device_ops = {
>> +    .release    = xe_config_device_release,
>> +};
>> +
>> +static const struct config_item_type xe_config_device_type = {
>> +    .ct_item_ops    = &xe_config_device_ops,
>> +    .ct_attrs    = xe_config_device_attrs,
>> +    .ct_owner    = THIS_MODULE,
>> +};
>> +
>> +static struct config_group *xe_config_make_device_group(struct 
>> config_group *group,
>> +                            const char *name)
>> +{
>> +    unsigned int domain, bus, slot, function;
>> +    struct xe_config_device *dev;
>> +    struct pci_dev *pdev;
>> +    int ret;
>> +
>> +    ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, 
>> &function);
>> +    if (ret != 4)
>> +        return ERR_PTR(-EINVAL);
>> +
>> +    pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 
>> function));
>> +    if (!pdev)
>> +        return ERR_PTR(-EINVAL);
>> +
>> +    dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>> +    if (!dev)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    config_group_init_type_name(&dev->group, name, 
>> &xe_config_device_type);
>> +
>> +    mutex_init(&dev->lock);
>> +
>> +    return &dev->group;
>> +}
>> +
>> +static struct configfs_group_operations xe_config_device_group_ops = {
>> +    .make_group    = xe_config_make_device_group,
>> +};
>> +
>> +static const struct config_item_type xe_configfs_type = {
>> +    .ct_group_ops    = &xe_config_device_group_ops,
>> +    .ct_owner    = THIS_MODULE,
> 
> Rodrigo,            ^
> 
> this is what makes the config side take a ref on the module, as it
> should.
> 
>> +};
>> +
>> +static struct configfs_subsystem xe_configfs = {
>> +    .su_group = {
>> +        .cg_item = {
>> +            .ci_namebuf = "xe",
>> +            .ci_type = &xe_configfs_type,
>> +        },
>> +    },
>> +};
>> +
>> +int __init xe_configfs_init(void)
>> +{
>> +    struct config_group *root = &xe_configfs.su_group;
>> +    int ret = 0;
> 
> pointless init as it's overwritten below.
> 
>> +
>> +    config_group_init(root);
>> +    mutex_init(&xe_configfs.su_mutex);
>> +    ret = configfs_register_subsystem(&xe_configfs);
>> +    if (ret) {
>> +        pr_err("Error %d while registering %s subsystem\n",
>> +               ret, root->cg_item.ci_namebuf);
> 
> return ret;
> 
>> +    }
>> +
>> +    return ret;
> 
> return 0;
> 
> 
> A bunch of nits above, but looking pretty good.

Will fix the above review comments.

Thank you
Riana>
> thanks
> Lucas De Marchi
> 
>> +}
>> +
>> +void __exit xe_configfs_exit(void)
>> +{
>> +    configfs_unregister_subsystem(&xe_configfs);
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/ 
>> xe_configfs.h
>> new file mode 100644
>> index 000000000000..2c30be9a2c7e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#ifndef _XE_CONFIGFS_H_
>> +#define _XE_CONFIGFS_H_
>> +
>> +int xe_configfs_init(void);
>> +void xe_configfs_exit(void);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/ 
>> xe_module.c
>> index 475acdba2b55..15b3cf22193c 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -11,6 +11,7 @@
>> #include <drm/drm_module.h>
>>
>> #include "xe_drv.h"
>> +#include "xe_configfs.h"
>> #include "xe_hw_fence.h"
>> #include "xe_pci.h"
>> #include "xe_pm.h"
>> @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>>     {
>>         .init = xe_check_nomodeset,
>>     },
>> +    {
>> +        .init = xe_configfs_init,
>> +        .exit = xe_configfs_exit,
>> +    },
>>     {
>>         .init = xe_hw_fence_module_init,
>>         .exit = xe_hw_fence_module_exit,
>> -- 
>> 2.47.1
>>

