Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0541EFF8855
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 18:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB7C10E0C6;
	Tue,  5 May 2026 18:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCmwBYoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B977710E0C6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778006133; x=1809542133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZgHqUdWT/DjhgYyi7PPUMTnjtTWxTjNxGXR3nuP7zbM=;
 b=NCmwBYoTmFTW4abOzmhfwkhitaYak/QAcKu4pr8l+W6vEayENOd0nP8N
 6kqpTb4pgiJqrllbWPphdUKuiP1/K1vuYTp9Q8Tq0q8E8AOyh4RMXlEyx
 +vQv2aeyWbTCuYw3fOU01733H9EdQKdN/Tj/stjdkLMrSRDJLUgbQaKQN
 KOKmeiEEf3sHInDcPKrDa75kejCMCYu5M7xEIibqNm798fS0guAMxuEXu
 af+jlqUp59XlzdKYdIkIky7X3vLcmFa6hyVMHEbrL3+mwonpKmlA91dDc
 f6ks+XkaZCF8pNFzzzP2bVbjakgjg4n/e5E+9Gra3VjTKSZoLYMwsp7IC w==;
X-CSE-ConnectionGUID: XeMgYlQCQVWkWNwRfdALVQ==
X-CSE-MsgGUID: 5ntgP/K9RIuUJvROVHp1fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90263096"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="90263096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:35:32 -0700
X-CSE-ConnectionGUID: v4ej4p4jSJGbMfgWdX0Z1Q==
X-CSE-MsgGUID: 8SoZZRfjSa6A2wnDRXn8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="240193553"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 11:35:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:35:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 11:35:31 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 11:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdMH9OhGTbIvGWsoUR8C9ILWunprvgl0HENK1JFLumfBlSmQYcYeKLBaMxTQueGuwsI3SpWuj/eQpwUHyP+QVJKqpZSff/filD6a1GUjO5HoPhWjmt+Ih0c1cVkhaLlgrooqrrdYqsF4i5pdcg3T5MphxePC8ub1el8D0PpzyvX7XoUrGwbTTqC51eOKvkGUAB0eKvNOFlF3YknrFb4MTK/WpIGwNyS/lZgukvapvTI4VQAWTHcmXDHAZZuhXLyYQUeVl8gkMoEb9F3+U2V+vz+CQzqOOjZADv9dk3Oqocx8YX7ch7PqPq0Ku9G8J3hy8NSK6kWE3Z/Pm/i1uP1UNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7ASxvAR7hwgUin2sqOOE7I1pU0a2pwXftz5Z/wVxkk=;
 b=VgvI17uX2Ht2doWuAHfRl3HtxFgvDEBIg+bszxZsucu5UG/kkEwxb6YU2lT/dxc1WUfEB6bxcVh9cRO+6MldKwl2p3gSclGUadMKoqXKx2owlkmDkAckbx4A7/G+4ORqr0pMURnBOHMtcFzp7fNKHFaT6P5K+VB1QZdVJ3fQOORMTc8LdlrV9JYqtPimCw6sL84jOOeFyWpipmXLD4dxpl0tLLO2kWUwPNwJsDMgQyy51qilQU1Dfmz1UkVGxu0cjREmcNf8+qqRfCq/MIqJDVxPWj4pFhmZsCivkz4/2juhv2T0VHQT1IXBD4WVxghjkjeAIQlIx8wTMXaGApAnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 18:35:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:35:28 +0000
Date: Tue, 5 May 2026 11:35:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 3/9] drm/xe/multi_queue: Store primary LRC and
 position info in LRC
Message-ID: <afo4axPANAfvgzW7@soc-5CG1426VCC.clients.intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-14-umesh.nerlige.ramappa@intel.com>
 <afloAo3OMhrZxVMK@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <afloAo3OMhrZxVMK@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: f2662b72-97ae-4974-a736-08deaad51499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: NRSmDdu1rZMuviOKa4l0NDbp+MOp1LQIqM3Xgx/V6q9v8XXBsfvaT2Ay5L5BVeGjAXTSAmanWYOZcGZgnUJ8JaoUfykg1WtBGU2GT+9EB9haaVolsDYMeULw+KdwvmUkMOrSYflNC97Zk51UFhfFOphS4voEpMzVohdK+Wkf+xanimUl7Gxx5iFBQ09mPTR45IEJMRhRS5CCHd3+qQVfxtDy49OvCpSSLKmIhnews4q2MDUQIRkvl8w1r91fPPjAAOiPxxr8lB9L7gQYbQBq5nJrFqSsq9mtTnDMm8eRNP1TZhABcNm7joBFyKeoQmoqZ5ag+ncFKF4MVsgjvoTwGyTCMluL3yuzSkG/6Rc+QFUf/RlpTqVIdL7tioxIb4RnzlM5WMR+4e93/4oxuT2zRUzEs28sAaa374GHbg1HOUeZpYalLAPZCY29q1eXComDTYm1p/nulCUtCzD82fqsCo8fUb3irN9dSoNCrNIpDE2knTL4oexdzxHGb8xdfBmc/sOoyaIqguQSgIdg9qoyR9PjrJnzGvbgxoBChCVN7nli9HRTXLKd85OEW1QaFPLJe+uiQDwKjWt1fBhi8Ts+tPqUXROrxeLtvIlaoxRQli7fVlnO1Ad34g2YrKMpH959bHZEGoY58+tGcSfHZaLGlTvtbKWt//xw/ihjzb2Q1cs7poG3ZtUGgwXb+6UWg2SQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWRsd1QyL1VDYmppdHRuNEhBQ2Y0VVg5d2owN1ZQWmxMczZDWlNRYUJTeWVJ?=
 =?utf-8?B?aklITGRDRFZ5V1NqTkl5eTRNSFpKM3M3ZitZRjBFakxpUHRSWjNEanRMMWdJ?=
 =?utf-8?B?U01JbGliZHc5K3NBdUVYalpKMEFOZWs4VUREMVhZSWFxRFNKeTNCR2loS2RB?=
 =?utf-8?B?azdKbkhUTmdQQ2lpbEgxNitBQm5jZEpFMVg4VVplUEdQM2pRbjRScmtCOHJN?=
 =?utf-8?B?bzlXTVdveitLeTNTYUZEa3pzN1dVU1hMd0gzL2trNG9rSUNYM1F2NHpiNDdt?=
 =?utf-8?B?cFQrdVp0Qko1TVpqSndWNktmQ1dwT3pSK2J6NUtYVk5jTEFLM01nRFVjam1l?=
 =?utf-8?B?SnFlZkE1OU5tSW1pMEtNN3ArNmxyOWk4cUZMOXpPVGFZV1lkSW02VllUblFS?=
 =?utf-8?B?cWdUTFhCak5JdERFblNDdGRLTUNJQUdVK0txaDFrMFhvSzQva3BYQjhiZDlW?=
 =?utf-8?B?TEdBNHhvQXFGcHFVN2xRNWFpUWlOdFZ3WjAySHM1T0JTekZLQnpLUUNrSEUv?=
 =?utf-8?B?Zy9BUVRPRW45djd6WEpWUThybzYwUFBMVnhXck1rYVpNekdXRzlwS1cwZFhR?=
 =?utf-8?B?b0cyZUo1QVhFVmNBRHcza2tyL3RJeUxJaEVWcTRFNTVSaS9NbndYdld2WDBw?=
 =?utf-8?B?bmhRbnZ6Ukd2cVp5LzJjeFp1VURjSktlaUIvdktrRXVaQjhyMXBMUXJoMXdn?=
 =?utf-8?B?aHdSc2loRWJaV1cwbGhtRjUxbHI5NC8zOHdiVkFXUGhHRm9kcklpZjZLbHZC?=
 =?utf-8?B?cFU0d2JOZlY4YWhIZEVPSFNDcW5yZkY5ajMzdVpJZndJbU1FL21lc0htbGIr?=
 =?utf-8?B?bE9YTUVRMTdWMXlWOElObG9EOHNQd0dTeHlCODlsaUZCTWsyam5KYllLbE5M?=
 =?utf-8?B?VHM5YTA4MFpaQnRLME9FQXovTXFoYWJXdk9wMGY2bk5KbXVZeXF3eUtvei91?=
 =?utf-8?B?aW5uRlByVHRlU2FZT25xZXA4OFVnMGF2TlAyREV1dk9ybTRZbURkcEZxTjVY?=
 =?utf-8?B?N2JTczFKK3RMMWZybTBxZDJOYmhCTVFaV3VMYjE3M3ZXK0xDbDdKZWI1bVZZ?=
 =?utf-8?B?clhPMFFrMlN0TER5S2d3MFJsUmdJL0lLK1JsdXIwQWlpVU12elF2Wmd0dDF2?=
 =?utf-8?B?eVU1WFRmbkxIK0MzekJ2R1VISGZHLzVrdXdpeW9IQVJtem5PZmhzeEpFL3NT?=
 =?utf-8?B?OFE2OFQ5U0xLeGdIanZaaHpldXBkanFRUDd5dmx1bjVsV2liVllzS3JBb2RD?=
 =?utf-8?B?MXc1UjZ2ODFjeGpZSHBHK0hjeHd0MUZ3RkZHQkxqUENHRWd2NC9DemIyMWlY?=
 =?utf-8?B?VmpUcVdZR0pGUHBJQm5YS01lc0s0WG54YmxHYmNlalI2aEV0TWlMRnpXclg4?=
 =?utf-8?B?UXlyY3pvaWJ6emo1MUJCMzBRWVZ1NTBsQjM4Ui9uUi9aUmM4b2dhc1ZMZWtm?=
 =?utf-8?B?Rnl6bjRnUWhiT1FKZU1hR2d0eXlQWUd0cTdMQmVDcU5SQzdEc3NyRzcrSE03?=
 =?utf-8?B?dXNpcU5NMWZQS1lsUU9GL2Y2ZmR1Ky9hckYyZ1l6QkVKb0xSR0xEOCtjMklP?=
 =?utf-8?B?Y0V3UjF2dlB6VUpRM240MTM0dC9yMFJpMzhkd29vV204T1pIZEt3RCtjUTM5?=
 =?utf-8?B?MFdKMHJZRkhVdkd1anNtYmkrbkRIWkRQS2V2czZ1Nm1HZ3RVbmFwekVTTTIx?=
 =?utf-8?B?MEE2cXJWcm56QlZDYVFERGFYZW12YUtZb1lkVUxZMG12MWFoMUVQci9VYTRL?=
 =?utf-8?B?VWl4SC9kSEhqc1ltai9SNlR2dVBtVytad3NxUGdXNjNBeVdCa1k3SE51R0dj?=
 =?utf-8?B?TC9wQ0dGVGcwV1VYaHpVMDBwdmZWRGVwWm8zVm1GWVMxTWFYZng0ZkJ5SFd4?=
 =?utf-8?B?TzQ5TkJhR3liYlE2aGhUeE1aZGpBY091YWdxRjlqQkpRS1RCa25VNHdvMTky?=
 =?utf-8?B?OGRsOE52RlNBZHhCRDlyWlJVV0QyK2tXY1RrUXhobzkwY1dIK0tZWDc4ZVFR?=
 =?utf-8?B?ZW92Y3dpMnk4OGliMVhCSVIwT0JnMGE2Sjl3SjZMVERvU0d1TVlISDRFdDgv?=
 =?utf-8?B?WXBseG9KNzFNeE9sT2hVeWlpWFN0dlVEa2lMNTBnRDRFN3llZFF0R2Q0Vi9M?=
 =?utf-8?B?MVh1WFpCMFhQU0dsZzZoaTdSME1mMFlwZC96WWRDM1BFR0R4WWpZRFloRmVu?=
 =?utf-8?B?R3E1NjBSL01vNDNocVJPdmdZbUlla2RpMHowRTEza2s2d2dqc1VWOCtDbFRD?=
 =?utf-8?B?MlpaTmw1SWxEZWY4NEZ6SmRuZ0c1YzM3ZHMzV2lIOTRvMjN2UldZTWR3NTA1?=
 =?utf-8?B?aGQ5U2ZXaUtNVU1DRWZYVnRjeDMzVGxTWGxtM0NhQ0VkRG16WVhXckhIRElR?=
 =?utf-8?Q?L+wd3QcDtyL8mVi1op3LFjypU2DX1ugPwu33+?=
X-Exchange-RoutingPolicyChecked: YRE7CzM1P7evvXT6D5MkcvVWZ61Nc88iU+az81KDr1ZEVAkwxXjGWEvwzFvGilv0IaUx+2wJVlNsE4hdDSPFjVpNgEtB+xtAWC+4aMW2UN281Y+Ax1vPzLRe0Q5DzimQZDKZ1DFxwly9rfRAepCnA10I/JSo9gLvMa30NmiJDBfB6kNd0gJ/4ZOQXVYktK8rAe+gHwkJgxIhFArOroSZkqxkrmgX+uBgFftuuywx5s4Wbd++nF2Ft/WP96JVLkQQNbqRdgONtkGqrKQyoKAttVILgNuHX6Njua40sfHVWnHgJ+54I3ZdLqMUFc9y8njbQdjQWN/M/hAZxNM2E+4uyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f2662b72-97ae-4974-a736-08deaad51499
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:35:28.5866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/HvEJd7xvkXq+8rnHoW/iJ5szU0KMwJgDLbc7PqXlyZbkUUfUPb7ES3ciiIO4XQODsOxkRT7+YquJLF8DtXHPzggircArBOeTqT+BmX6w0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
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

On Mon, May 04, 2026 at 08:46:10PM -0700, Niranjana Vishwanathapura wrote:
>On Fri, May 01, 2026 at 05:53:36PM -0700, Umesh Nerlige Ramappa wrote:
>>Given an LRC belonging to the secondary queue, in order to check if its
>>context group is active, we need to check the LRC of the primary queue.
>>In addition to that we want to compare the secondary queue position to
>>CSMQDEBUG register to check if the queue itself is active.
>>
>>To do so, store primary LRC and position information in the LRC as well
>>as take a reference to the primary LRC from each LRC in the queue group.
>>
>>A note on references involved:
>>
>>- In general the Queue takes a ref on its LRC.
>>- In addition, for multi-queue,
>>a. Primary Queue takes a ref for each Secondary LRC.
>>b. Each Secondary Queue takes a ref to the Primary Queue
>>
>>In the current patch, each LRC in the queue group is storing a pointer
>>to Primary LRC. There is a small window of time in the primary queue
>>free path where the primary LRC may be freed before the secondary LRC.
>>
>>__xe_exec_queue_fini(q); // frees|puts primary q LRCs
>>...
>>window where secondary Q LRC is pointing to invalid primary LRC
>>...
>>__xe_exec_queue_free(q); // frees|puts secondary q LRCs in multi-Q case
>>
>>In this window the reference in Secondary LRC is invalid. While there
>>may be nothing accessing the secondary LRCs reference, to be safe, this
>>patch is taking a reference to Primary LRC from the secondary LRC.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v2:
>>- Store primary LRC instead of primary queue (Niranjana)
>>- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
>>- Document/Revisit references (Matt/Umesh)
>>---
>>drivers/gpu/drm/xe/xe_exec_queue.c | 23 ++++++++++++++++++++---
>>drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
>>drivers/gpu/drm/xe/xe_lrc_types.h  |  8 ++++++++
>>3 files changed, 33 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index b287d0e0e60a..e34601d28520 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -129,8 +129,14 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>>		return;
>>
>>	/* Primary queue cleanup */
>>-	xa_for_each(&group->xa, idx, lrc)
>>+	xa_for_each(&group->xa, idx, lrc) {
>>+		/* drop secondary lrc ref to primary lrc */
>>+		xe_lrc_put(lrc->multi_queue.primary_lrc);
>>+		/* drop primary queue ref to secondary lrc */
>>		xe_lrc_put(lrc);
>>+	}
>>+	/* drop primary lrc ref to itself */
>>+	xe_lrc_put(q->lrc[0]);
>>
>>	xa_destroy(&group->xa);
>>	mutex_destroy(&group->list_lock);
>>@@ -275,8 +281,15 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
>>{
>>	xe_assert(gt_to_xe(q->gt), idx < q->width);
>>
>>-	scoped_guard(spinlock, &q->lrc_lookup_lock)
>>+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
>>		q->lrc[idx] = lrc;
>>+		if (xe_exec_queue_is_multi_queue(q)) {
>>+			struct xe_lrc *primary_lrc = q->multi_queue.group->primary->lrc[0];
>>+
>>+			lrc->multi_queue.pos = q->multi_queue.pos;
>
>I think q->multi_queue.pos is not yet set for secondary queues at this point.
>It is set later in the xe_exec_queue_group_add() call.

Hmm, I recall seeing that a while ago and that's why I leaned toward 
having a lrc->q (back reference to the queue that the LRC belongs to, 
but that's prohibited). Anyways, I will try to move this logic outsize 
to a late point then.

>
>>+			lrc->multi_queue.primary_lrc = xe_lrc_get(primary_lrc);
>
>I think we don't need to get/put the primary_lrc reference.
>Each queue holds a reference to its LRC. The secondary queues holds a reference
>to the primary queue. So, essentially, the secondary LRCs are holding a reference
>to primary lrc. So, I think, we don't need to hold reference again.

I would look at the queue and LRC as different objects in memory.

In taking a reference here, I am addressing only one specific corner 
case:

- Consider all secondary queues are freed
- Since primary queue holds a reference to all secondary LRCs, all 
   secondary LRCs are still in memory.
- When all references to primary queue are released, we end up in 
   xe_exec_queue_fini(primary_q).

In this function the LRC for primary_q is freed first, and then the 
secondary_q lrcs are freed, so there is a small window of time where the 
reference from secondary LRC to primary LRC is invalid. IMO, that small 
windows of time is enough for strange issues.

Umesh
>
>Niranjana
>
>>+		}
>>+	}
>>}
>>
>>/**
>>@@ -388,8 +401,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>
>>			xe_exec_queue_set_lrc(q, lrc, i);
>>
>>-			if (__lrc)
>>+			if (__lrc) {
>>+				if (xe_exec_queue_is_multi_queue(q))
>>+					xe_lrc_put(__lrc->multi_queue.primary_lrc);
>>+
>>				xe_lrc_put(__lrc);
>>+			}
>>			__lrc = lrc;
>>
>>		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>>index 97aef0327fc8..3d0bf4a7bfa0 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.h
>>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>>@@ -91,6 +91,11 @@ static inline size_t xe_lrc_ring_size(void)
>>	return SZ_16K;
>>}
>>
>>+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>>+{
>>+	return lrc->multi_queue.primary_lrc;
>>+}
>>+
>>size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
>>size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>>u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>>index 5a718f759ed6..0a5c13ec2ad7 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>>@@ -63,6 +63,14 @@ struct xe_lrc {
>>
>>	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
>>	u64 ctx_timestamp;
>>+
>>+	/** @multi_queue: Multi queue LRC related information */
>>+	struct {
>>+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>>+		struct xe_lrc *primary_lrc;
>>+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>>+		u8 pos;
>>+	} multi_queue;
>>};
>>
>>struct xe_lrc_snapshot;
>>-- 
>>2.43.0
>>
