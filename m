Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC83C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 16:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C5889C49;
	Tue, 17 Jun 2025 16:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G61YubAf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B928F89C49
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750177968; x=1781713968;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HmyXazGZQ5hVXtiHWavRMmCpsRE3gH9vPR/HrU01P8I=;
 b=G61YubAfwqWtgKmAiPv/iNYyJvxCdU4H/M032iRiLBNK6xbt5VS8Mxzx
 Iwj5xezHvRMpcjR63hSRe5/9G5MohCmvSgOjhXhuUSX3mXBRMxTpd89R5
 HmV/romOz0UT7nny4FYq0lHj9woPGSz0Bw6Jl+ncsyccJL+c7UG4lRkr+
 vtpoEBY5wdqs60E9bEAo3o7+fm/q/wZQAXrYrYoIpaw02n+RuZwZZwomK
 D6/iOYmzgb1MAK+YZZLDFszh92uSiAV0gJTqhYztDiY9mMN+0iPEfdYQD
 YUz+YE/7rHBwSiJ4+P8MRe/Fd7mgdiAen1/R52hM9Q83PoEMtSjehGXmt Q==;
X-CSE-ConnectionGUID: u3F9UEgHSrmLRZxkzQlKQA==
X-CSE-MsgGUID: aBGqYJS0QPKpowwrlv1sWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51475608"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="51475608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:32:47 -0700
X-CSE-ConnectionGUID: hOcJgLhaSsu2n48CaMuz/A==
X-CSE-MsgGUID: lohKQ8k/RcqWfzFZfBqLQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="153776635"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 09:32:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 09:32:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 09:32:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 09:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/MN7nlwtGI3o7wK9y1qdToba7q4I01hH9tcfyV3Lux00s63lr8vAKmw9tAJuYZRkUAF+8WAKnfpl+JqeKlQ6fGyodBkcQVDsSBkHBFviTR7K5OOzm1bwG60p+8uCQNrblaBv7Na01+YT4wveps/Js5SIFvBbSW3lRpAjTNqfzKY2xRR8LxEUUmMi0Mw6OLT/LYDwStlXjvM9WUIE37KepBfP6aNFNpmv44zi9d8uh9WzEPe780+Wi4s1KzCopBeHHc6nG7tEq+VRtHENBkdZ9J9SP4rtsObP4J7SJTLErf4DA5tCmRMpAP5qkaX4BqZxABPGmNw6NTm8oLLdKB//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmyXazGZQ5hVXtiHWavRMmCpsRE3gH9vPR/HrU01P8I=;
 b=hQbidBW9Bcxgb8kbqusysA/GUduHilchVfOSpwp5csq4c66xaglWyvP7YArxFM+zLcIDxZxpqk+tPxuka03pl0VVgQLzgwUJ1R8cqjF1bMKUQWA/uTLHaiuwpUCgXgpPDp22MGZpoXbLb9C1FLUjJVIFSA5MFs7H+M+INLVuF+2Euf3xEsveMFRfqeF2Ck96kAfQ15WrbrmaQoyj9IPk6BUoVGpnG7BtBjDcRqi1D4BA+Zjq0nruD/e677102C/gLPALA2Pp2dWt95nzcOJQibNeZYOSPk5hBF0f5XJAQD66Z+4gZKONSMg1uZinRUpedlCTiIv9O2fLbDVtPynXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5)
 by DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 16:32:13 +0000
Received: from CH3PR11MB7818.namprd11.prod.outlook.com
 ([fe80::380e:84fd:fda7:53bb]) by CH3PR11MB7818.namprd11.prod.outlook.com
 ([fe80::380e:84fd:fda7:53bb%7]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 16:32:13 +0000
Message-ID: <55a263e1-2625-4ea0-be1d-ee4e263adecd@intel.com>
Date: Tue, 17 Jun 2025 09:32:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL,
 DG2
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
References: <20250614015511.691610-1-julia.filipchuk@intel.com>
 <20250614015511.691610-5-julia.filipchuk@intel.com>
 <wgbww4noujwbpxydqqgjcbks22abbql23sigqg4v6c7t75hrhu@m6uhe22uuqdz>
 <3ca022eb-cd41-43c5-9062-d1ef6070ab00@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <3ca022eb-cd41-43c5-9062-d1ef6070ab00@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::20) To CH3PR11MB7818.namprd11.prod.outlook.com
 (2603:10b6:610:129::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7818:EE_|DS4PPF2A0C3F85C:EE_
X-MS-Office365-Filtering-Correlation-Id: 67247d18-89eb-4921-632c-08ddadbc83a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG1EaElVTXJIeDJYSHJUR1hhLzBKYnhRa0xiOVpDUld4Smc5TXFNakViUDRR?=
 =?utf-8?B?RGl6MHd5Y0E4RHZoVWJDeUR3bkJSR2NrSHJuUG96UDdkRzI3Rk5FY3NleERM?=
 =?utf-8?B?eHAxbjJOMkZyZXo1YVdnSy9jOXpXQTJEMDNXYWhNK01LOElPUkFsZVJ4ZGdp?=
 =?utf-8?B?d21qOHF4dVZlVXhQYjVweXJ6ZUJkeEMwZWpJQmd3eW9vNlE0Slh5QUQ1bVlV?=
 =?utf-8?B?Q1NtOUpSdjkyUFNLWTM5TzV1eE9CNzc5U2pFanRlY3lFMGRzU1dpczFwMm45?=
 =?utf-8?B?VkdXWnVlOGd0TnFCT3M4THI2R2VTang0SDlLaTFKU04wQmJkN2tGaDVXenVo?=
 =?utf-8?B?ZDU2b21OZ0ovMzcvYzQ3alZwNHk2OUpabHExU01XbnNNN1hhVXpBNForL3g4?=
 =?utf-8?B?bElqL3pmWHlOVFFkTjRuZjNlU2J1cktJdTUwTG11QWVrVUxUbHNsdkVteVJL?=
 =?utf-8?B?cUNpZG9tZFBVeHhyK3paYWFqOTNNWXQ3VjlRcTIwSWdZRkRMVVZQWVY3TWxi?=
 =?utf-8?B?UFo0OVZVa2xJYllCYzJZUWZrMWlCcVVtVTVHOGVxOEsyUHVuU3NGSjdaU0t4?=
 =?utf-8?B?WTMwYkt4NnlMMXpzQVIwWkVPSVVvcHc3YU5UcERFZWd0OElwTWVKeVFST3l0?=
 =?utf-8?B?UytuYzVSS1pJem1XMTVac3JQOVJiTmNzQWxBbHF4QkFUekNIekkvemdCVEN5?=
 =?utf-8?B?OXB5YWZSenZZZHVEMCtML1ZDa01qZlZYTFBzSjJrY1FNZVpOblQ2SmQwK2cy?=
 =?utf-8?B?ejBzTlZjNktQakVsVzY5QzNzVDY4eTQvSHYwcUxnY0tjRERkVXYvbFZ4VUNm?=
 =?utf-8?B?SllhbHFqUFRvZFNnY0xpTlFneTcrUXRGdk1maWRoMUJIeXBrZnpNNmF2YlM0?=
 =?utf-8?B?MmkwVXZSb014VitIdFhMQXpuam9EeFNmZ1Q2aFBZQ3BnbTZzRWkxM0tOUTkw?=
 =?utf-8?B?eHlkR3hGcW5zVUYxeHcxd1NNaVMzT0x3SHdlTE00K3ZHckhJTzcwYTNqNGkz?=
 =?utf-8?B?TWZwUmRkV1pob2t6S2IzYzJFUkpuZmhVbld4MDVVNWIyd0dPT3p5RDdUWlds?=
 =?utf-8?B?cDM4ZDFoMm9JOVVuOEpiNzNKOFF4d2RQdURkRkVwNm1Tb3htUHcySkt0YjVs?=
 =?utf-8?B?TXBwdEpyQjIweHVnNVVaalJBdFNmQXE1Y1RhZXhMTkhOL2o3RThvOUZIbS94?=
 =?utf-8?B?Y0REMWhQTUVsMnZGa05kVThzc2t5VTg4a01iK283dThjczBHK0hQNEUrZi9S?=
 =?utf-8?B?T08zbGZIaEErMnhpd09sYmt1R2FmSGF2VnNOY3ZrTVhWeUlIUjdlUUdaUVhh?=
 =?utf-8?B?ZDdES090cGFJRC9pc3BQcVhqcm9yV0NFTk5YWUgwbDlIaDJzSmNYNS9ZSDgz?=
 =?utf-8?B?U0pMcC9YYnNNOUk1ajVWQ0I3OXVxQnNveTN0ZHBxRmFhem9rem1kcnEzZEMy?=
 =?utf-8?B?RnBCaksrdzRxYUM3SUpKVmRLOVFrRlFXSUJRMmNqK21LSlE2OEpmekJXLzZh?=
 =?utf-8?B?b09VdkQ2RmQ2dUF6QXZueFRkOXhUVUtsM2NXaGFnZm56Nm9kTDZEakxWS0o0?=
 =?utf-8?B?OGtnYm5qeGtweHAxV1JXVUdTZVhjOUtlNXZWSEVxeXJQRHdGVU4yUnVTUkhs?=
 =?utf-8?B?VTJ3cVp4azhsV2NzdmxPcmE2b0M2M2xoY0dtYWgrWWNiL0dpekdaZVNGRjlH?=
 =?utf-8?B?ZWxjOHlyeXlXMGQ2Z09BekUvOHJMS3R2dGgvSS9tK2lZcjZiKzhKVUFtc1dp?=
 =?utf-8?B?WlU5VUQyMjlocnJNbUNCSFF4cnROK1FqZUdwVUlxVHdMQzkwdWI2OVd0Q0Qw?=
 =?utf-8?B?V1hHSWpLcE5RaXNqeE1VZkNVaWFSL0RQaXAvdk01K0t0d0c5QWNTQW14bUlr?=
 =?utf-8?B?TFJPZSt2aGRrSHdBN0FCczkvSzJXM083ZkhvUVhYRmh6RzR4N2MySWw1M25Q?=
 =?utf-8?Q?qOhB1rMx1VA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7818.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDl6bXN2c2YwVXRFMlljbzQ1YUNCZGplSkp3UUNHODFGa3Nod3ZDc2xvbFdT?=
 =?utf-8?B?Vjd6SzJneXFyTERVcVYzZkpoUUprd1ZBUlB4aGd2cGhweVpmbG9uZGRaNUt6?=
 =?utf-8?B?MnFFckhlRjVxWDJaVW9pQy9iVDZEeE9LcGcxZTAzYTZ2MXBZUjJVaVVLT3Bk?=
 =?utf-8?B?TkIxcG1RVllIbzhLREp1cVJjYzBmblZINWJsZmlZdm83aFhGazJkYnNSOGFB?=
 =?utf-8?B?SFkvZjl2akNvUjkxd3RURWlnakZOcjZIQTRQYjM0YWVXT2NXblQzNE1wU2du?=
 =?utf-8?B?Vi9rYkQ2cmZ5RTF4TFc4YWlnb3ZldDNpOG5RSURBRy9BOWZnZS9JUFgxQlRp?=
 =?utf-8?B?QW10ZDB4VDQ2WWJRQU45Rjd5RVZRZ0RrV0FGWjgxL3hrMnNTTjNPYlRDZzI2?=
 =?utf-8?B?cVlOV1AySWlvaVM3Z0tTOXVLaldsUnJCeWQ1RTF3NXpJWW51YzZqQUlGbFpY?=
 =?utf-8?B?SUZVQTVnUXFiYnN1RnpzTzEwRUdVRmVDdU9kUXNBcndwNUE3YXRHWWMrR0cv?=
 =?utf-8?B?TFJzVnJma1Z3bCsxbEpJcDk4WG9JZkNEUWtNeFBILzNnbksySXBrMVFITXN6?=
 =?utf-8?B?OU8zRzlYVWdaVFhaUVU2UitxU3l0SkZFY2dkNkd1SnZnMzZCelhGdnVjbXJs?=
 =?utf-8?B?dUNIUXJ0eVVzS0R3Rmhsa3BKTDFKM1d0L3VtcXN4cWovN1plRHBXVCtCeVVj?=
 =?utf-8?B?aG9lS1NjRnZhcUQ4OUtxbVhMZExoSDFzVVZrbS83UkhXcFpqelVQQVFMK04r?=
 =?utf-8?B?bjVGVjFab2tTM3oyM3AxNlFGaWNFaEtjeDB2c2wzZ1BSbEx4aFQybDNTTVJl?=
 =?utf-8?B?MDFQb2RuNFBCcUs1K2N0QVh4TjN2WXNuSDlTalF6ZDZRUGcwUDBnWDVVd1pn?=
 =?utf-8?B?dno1eStEOU14Q1FZQ1VYcncrb0IvVmdYWWdRamlud1V1ZWJrUzZoQ3RqVFgv?=
 =?utf-8?B?ZzFtbXNqVWZLUFg2MGJORGtnTWhZRFNUSVpyYUxMWWN2VXZYMndubkVoZVlj?=
 =?utf-8?B?bUpjcVgySkdNWXVSakZKY1ZLWDBKbm9vZGdzYThmNWE1Z0ZCemFuYWErTHAx?=
 =?utf-8?B?TGQwOTBqeHp1MHduZ0RSLzhnbVpvZm5hcVp5eEpVWXNFSkRLRFdUU2Vjb0sv?=
 =?utf-8?B?MGZaczJPZWIrc01na2l4QThCZURUK0RaUVJ5OW1hQUNoMjJ4ZkFnNUVKOU9p?=
 =?utf-8?B?TkRtSFZzR3ArVjVNRnQ1KzVBbE1DNEJLd29NajlLMC9CTDdtRXRtWEt2Qm5H?=
 =?utf-8?B?Vkdhd2MvTUxobTFPWUgrME5MN3Z6OHVOSUk4VEM2WUZQN3lHMVM2YzIrY0t6?=
 =?utf-8?B?Sk9CaVkwK2VteHIxOVM3MUtGMVpFZU9wWFRWb29jSUZkSEtpaU5ldUY4TC9r?=
 =?utf-8?B?bHhxMzZ2a3ZKRUtHN3hXZXhuckhuQ3RKQXc4bWltMlRGS1o0STIxMXBCejRz?=
 =?utf-8?B?ZmR0MTEyRUpWYjIyOVM1TVNCc3F6RHFWckZyZEdWOTNYTEZjOERxaFExL1ZB?=
 =?utf-8?B?WmRDcW5uRFcrSSs5cnczOTR6eUc1TkVUTWsxcTdtaS9BT1BNZE8xZnU4YWND?=
 =?utf-8?B?eTZVWVNhYWFhbk0vWXdqZkZDcVU3TjVTdit3b1N3ZWMrdE5JR3gwVHVvM0hZ?=
 =?utf-8?B?Rm9ydGJRRDRaNUtDemYwYm5HWjdhdWE0VmNiRzlsL0o3UkluOHRqSTh0OTVR?=
 =?utf-8?B?WExlVnBOTGlRS2RrOWRTczM0R0RIVHBQNjZoL0wzMlNzM2FhN2U2Z2xKbkVj?=
 =?utf-8?B?czJ3ZGgwZE1jcHU5Rk9IL1pGQVVITjBjVjhnampDa25TVTNjWTdTWTA3eVFM?=
 =?utf-8?B?TDRDT3hrT3AyNG13cTJXN0FPcFhBdzlxV0lZK080eUh6Rk56ZUhEc2N4UnVp?=
 =?utf-8?B?L0NWOGNuTWU1VkVpUXdYdFdEWXBmVStGSXA4RmszR3JMUWdWWkJkL3NWVDhX?=
 =?utf-8?B?bWxIMnBXcTJXZVV3d0hMN0gyMXRlbWRkeVBsMUp4Y1ZSeVJKYjBXWDdpbW9U?=
 =?utf-8?B?clI1RlZrdG9abFZpQkZlWHppQXlWUFJTSkw4S2ZkQ1hXMWVRREtUTzVJMndF?=
 =?utf-8?B?MWNYRXhwVEx6NjZvcXFWNmtLZWhoK1JXbCt3TFY1SjJRRDRRR3g0STQvYVgr?=
 =?utf-8?B?TnVtL3FTQUFEdHI2Nnk3SElFV2FTVGNDbmhvTzJhZ0hBNzZydHVuWDVYVHcy?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67247d18-89eb-4921-632c-08ddadbc83a3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 16:32:13.3246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtXS1DYjShpt/IJyoEY8HVHYURiRldVJlgR2IoTpNtKCQ4EmCi982ONz1BM5JayHx3xaziFSbzZANZCAKChWFx6NTNIq5YMaDGpztFd9GsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
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


Lucas,

We decided to not merge this. Waiting on the next GuC version.

Julia
