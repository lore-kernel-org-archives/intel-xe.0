Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A979C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 23:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D8210E012;
	Wed, 12 Jun 2024 23:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lL+FLTho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EBD10E012
 for <Intel-Xe@lists.freedesktop.org>; Wed, 12 Jun 2024 23:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718235428; x=1749771428;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DdYYlZm1PS80GB9il/bEAs1j5L+KBgBXOJLkK436h34=;
 b=lL+FLTho8ZbiE7SulmEzAUQ4cl3ObG0UuIvRgxczE0yXVZ2ugHWk8hZh
 r4f9wM2FEuL4BlZZNicgjBg/jONhWSlic0ViVRwFdAH30FVpsjrovfNMu
 l57gyNTVDy8nzCM+pjjyby9BXOcR3z8YRGI8yPj4oVfDewkh8rbdeYF1d
 6tXqkdgPvUFt9/eQj3WAl+ukCLhk4z4KIyQ27jJGhWZPeVxbqngK64z27
 cOZKIrJ710FeiJl5He9Vzo0WFTl/CiESa6OmOin8IRILlRoP+03zBZ036
 1QuleNN4o7eJgkY5FlGsRw2Znen/U93U8/6gc2KAYfRsn/TWIGAtmVl7C Q==;
X-CSE-ConnectionGUID: ZSs06b6aRQ2/Pz0bxSCp8Q==
X-CSE-MsgGUID: vqAGWq48Sx299N5ZBMQT+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32514181"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="32514181"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 16:36:59 -0700
X-CSE-ConnectionGUID: 0iupJYThQki1LnCTnb/Y2Q==
X-CSE-MsgGUID: 7zEXksHnQq2/Dznb0yZjtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="71148729"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 16:37:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 16:36:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 16:36:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 16:36:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcOSdF837WeLtcTqsNXtqr33iqAO+Jat1/7hczuI/iTqrrLVABI4Mwb/6bp/idKhxwgxhA3PfFM/oaeSJ8xfe8j7dV/Ex13Yf0K4xM6KRWUaVN81b4KK0ZDGPA6DysxgOCm4FCeRf7ly8Yy9qt5KlxAWiYFlYuoC8jQuhDGlNaWhhaZMVvGLAE6bLKBdUGKZRyUy7Inh6lU/R8bE/nnr3pyuvs8wT0bzn5f8mPUPOd6ipYD5c6P5FrcjV6jSSRUSPvE/tt/nfUag+/kLxVRs7eJaMWi4AAbPo54n6j0eP3rh/IhXHUKFsq4CMAIDdqucawkrripOVBl9B2F26KJgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4PH/SsNpOtkxCMnYEIzqyzVshNhHq5I50TZE34foQ8=;
 b=O+nQJ/oBsz7r3TQkuOSIHkXydIopOOJ1Go2YupIlftrfqI2ZpHFQMyTp7X1rsy2B2+Hyviy+YUi1S9OuFL9CuTV8mT83nXl7b5Qfe7LzY578HcZ4MaRojyx2fvI77xrJ0CPEWmrnBtEvPBOVMu4vU9QB6iItnIsDD8N5ktoASumXEREkIZuFIP691W2l+/T/wOT7GO1C6VdWwN7AaFdCyOUyAa3S3FUKVifcK05w4XtiRHKCNgLOpmj69lCIJAsaJMNf/kUQ2RZe6/uYsCrzx2L2AiAANO3cdGrMxNDDvxFzV6ZSn68CQvZlyUo2w7W1vhRhMGSUgLsGLd8rXvDcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CYXPR11MB8712.namprd11.prod.outlook.com (2603:10b6:930:df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 23:36:51 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 23:36:51 +0000
Message-ID: <f25d48a9-e040-4324-ae36-a64f16cd2248@intel.com>
Date: Wed, 12 Jun 2024 16:36:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] drm/xe/guc: Copy GuC log prior to dumping
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240611012028.2305024-1-John.C.Harrison@Intel.com>
 <20240611012028.2305024-3-John.C.Harrison@Intel.com>
 <8241acfc-b0f1-4995-bc78-942f1151aadb@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <8241acfc-b0f1-4995-bc78-942f1151aadb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0128.namprd04.prod.outlook.com
 (2603:10b6:303:84::13) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CYXPR11MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: e203f563-501d-4ef0-a6a4-08dc8b3888da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUp2N1lUekpSYzdBS1VTMmdUdFJBcXdray9mOEVlYmgvTExuOWNhaXMxRUQw?=
 =?utf-8?B?eUpaRmEydHpOd1l6bDczUHdmVTRuWXpQdUZRMVplWm5SbHlqR3VacDQ1YzRW?=
 =?utf-8?B?S1ZrZ20zNDFFamtKMzFXOHlGMUN2R00vbnFHSGwxNVNMemNUVDZmaU5kc1cy?=
 =?utf-8?B?b2JQWm9DUGl4emE0WlFIWDhYclZ2ZEFUdmZVMWp6NkJsaXJzcVgxVldoU3pj?=
 =?utf-8?B?OVFNQjVvZ3RHMUk0MldBeFdENG5uMktGMEhaTXdnNm9MZFEvRy9wdjVYNzB2?=
 =?utf-8?B?ZXhNUkVxTjdrL3F5RDEwZzAzbDZEdkJzT3JYTGFTTXBPdHBtd2pabHBvUHRt?=
 =?utf-8?B?Z0p4aFZsRXNIUzdVVzI1YndFeVQ1Sy9wMzU5ZTdrMHY5ZXFRWjN1bnc4dDZ1?=
 =?utf-8?B?dUwvcU1DLzBmVWw1bmNJUGlMMkdmaDlpa1g4T0NyZmRldFpSUnkrTkU2MHRI?=
 =?utf-8?B?Ly90RE8zWXF4WEJ6UWZLWk9lbVZncGVDRTNmdDVPSzZRR3pPT0M3YjZFZkJj?=
 =?utf-8?B?SHVVRU5VQndIV25RT1VOTjlwZFlRVDE5S1JSd09xQVV0K2xXTkdtZmdNb0tn?=
 =?utf-8?B?ZTJWQ0FDaTRZUFJjbHRtT1VYbEVNU1ArZ3cxRXRrSGlMU0FJOFpvRDVtdElS?=
 =?utf-8?B?U0JQa0tZbCtxYVdFeW9DNlprVHhkdjlZYmtVelRESmZVMThyNyt2T292VThE?=
 =?utf-8?B?aGJxaHZpTFVjL05Pc0pHbTNFWkpOWmtUVEtKL2ZjNHgzVWtvUkVNZFBXR1VI?=
 =?utf-8?B?NjYyMUZvM1VSN1VEcmd1Rnlhc0hsRjhxOFZ1RzUrdThsdG9vbW9aRGZycnky?=
 =?utf-8?B?OUpDRE5VKzFNMEdZaHdmY0tkUGdMNUJONnZLRHdmbklyRHQvTnJ6Sk1VUDl3?=
 =?utf-8?B?c3RMLzR5L01uemxna1M0eHVnM1BtcGdsNWVWQmpiRDByeFVGTnhDSmhXODV2?=
 =?utf-8?B?YUZnWFpGYVBwNlpSN0QzeHo2MnlWRmpCNjNxUzRhRURpdHlaOXhJbDlCdmNm?=
 =?utf-8?B?Tll3Wk1Xai83QUFGSlRrZEkzUnpNKytFTGgvdytiRGdLeTQ5QXduZWk1MjNo?=
 =?utf-8?B?eHFxR3ZOTzNnSVZUUk9rclB4UkF3SnpqUDVhRHVFUi9xZXlMWjJaRXREQlJF?=
 =?utf-8?B?UlgxaUxqTVFlTnBIK1ZKRElQanFKZHpKQzJpK3p5cURqdWRCZjdoTC92U0tJ?=
 =?utf-8?B?Y3poNVVSU0JKVlNCN212ZC9pbTJKQVdiK2o5RVdGSHlwVFZpZER4R0k2RXdy?=
 =?utf-8?B?eUdUWnNhNjRYajQxMExjZWxKOUpyMFdMK0d6aGl1d2duQXNYMzlyd0ViTFpW?=
 =?utf-8?B?RCtmeFVxemdxbWI0alk5RndpbGJpY2pPL1orQVJDN3BDNzd0OWtIQjlmUXJN?=
 =?utf-8?B?K1N2dFlWSXozdjJNMlhpWHhyeG1CMFdPcFYva1BLbEwvTmJJVHQvcGZMN0R5?=
 =?utf-8?B?ODJVMStnWmVsOW9TN1M5S2RqZFBjNjFFOEJwczV2YXArOHByaVpvZ0NEQXR0?=
 =?utf-8?B?MmZxNGdNVlpiQTAxSzgwSHRkeGNtcFdGclRQaVpKYUw5R21rRVNkNmhoc0gv?=
 =?utf-8?B?QmtxOUZBK05ydVZqYlVEZG1yc1VLMWQ0M2thVFplL21uRVlHbkdsbE10UjlM?=
 =?utf-8?B?YjZ3akhYSlNob0xpQ1ZoZ2ZSVlFJU0lyRy9PcDk5aytuMkNFSHJjeHVNTWNR?=
 =?utf-8?B?MUkyNE01eHN2TFFUYUdvL1JRazgxUzBYbmxHcU52QjJXR1dDbC9JSkN3YkRj?=
 =?utf-8?Q?pddIl/ilqN0E39J5CSL6fv7OA2nFodg+OKcyQda?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFlML0k0SmZ4YzlwMjM4aEhHdzI5K2MvT1JlR3llYjVzb2VsRmc2VlNOZmt0?=
 =?utf-8?B?Y0tnS1BCSFhGdUcyTWx1M2JWMVBJNDE0cEozcThlS2VMOUY2em5xN2R5R2ZV?=
 =?utf-8?B?Z212VWZzNm1Ub29yUXJkV1RscE51eGF3YThWc0tVWkZ2S21UZ2tGTFcxR0RI?=
 =?utf-8?B?RUNTbTJmWkVTVkt0ZCt0TmRnall3VFZQK3NIQWR5QWl1YXdKUWtGM3A1SkFn?=
 =?utf-8?B?VFZJTk1TMVdTZHBXbnhzSVZHdzNiWUk5WGExRm54dUlHQ0hrc09sYm54NG1x?=
 =?utf-8?B?WTN1OWdyV3Z5N1pXM1NPM0JwVjhub0tIZXdFZVE5enI2K3VhLzExVUE2a01S?=
 =?utf-8?B?V2VDVTlQRllsNFEyT0FNQW8zYzc1V1pkYk5JeGJ4WUl5ZE5mOU5SQ3QzcE40?=
 =?utf-8?B?NkUvemlvM05yaDBuV1VHWTBSYm5YcE83bmFna2JPb2V6anR5dlZyTWdLOHVI?=
 =?utf-8?B?akVKeWZHNitpT0JwWERJbzFhaEM5NXViaDhaYkV0LzNtUHp2SDl2Vncxd0V5?=
 =?utf-8?B?eCt4LzloM3RDcHB1MUFaUG1tMzZzNlVGekZUb3pYZEcwSXRsRldyYjkvWUYy?=
 =?utf-8?B?azF5R2VTNlprS0gzem9QMXRsN2V2NlVoclh0OXlUMm1NSjFiWXUrczRmWHFr?=
 =?utf-8?B?MzZTV2NablFQZUtwQ3A3YmtVdUU3L0NwQ3ZKQm1neUtkOUhqZEUxWFViWGY1?=
 =?utf-8?B?SnVUelNsZkRzVWpUdHFUOUM0a0wrei9EeEZNVCswQzMrWEYrd1RDdDJ6SVpq?=
 =?utf-8?B?Y0hoOUx5K1RuSVFKeXg5WTdBWGtNbkZEWHJkOHhKQzVJM0dFWkdRRTRPNk1W?=
 =?utf-8?B?TTJadEExK01FQ25hdzBNNnVNQmRNMG5JeUtlSEdWMlNXb3RjczVhMm1ZbFJx?=
 =?utf-8?B?QmQrRnhSL2xYVWlNWXpBQnEzVG8wVTFGYVdWdU5ndUhwOHJ2dkQ5WkpNN3Bi?=
 =?utf-8?B?bVZFbWpyOWFwUWZ6Z0VEa3oyd1hhZDZWUmRnM0UxZkovNDhZUS9QRG5TcTJ3?=
 =?utf-8?B?WWlzSUFjS28zY3FPTFpZd2EwUkhObnlTTG50WlFQV0dWbXp2OHJKa3l2bUxN?=
 =?utf-8?B?OWluNVdsZVFLbVBiZm1XeHphWnpheHA5dEE5ZS9HWkgxV21IdkUwK0l5djB6?=
 =?utf-8?B?VWlLWEN6Qk5oekVEbWdyWW45UWFueHY5NS9kem9sdU1GcGdWK05RbndPVENq?=
 =?utf-8?B?RHNHcVNCUTluOVA2ZjhjS3k3WWJ1cXQzaEh4Y21NWnZDSnlZcU8yMytCWFUr?=
 =?utf-8?B?ZDQ5UWYwN3NNeElLTkZENWF6eUowdms4RWlzeE9aRGhhZ2NVRW1LKzNNSUtj?=
 =?utf-8?B?T3NYbTZMeWs5MCtBd21pTUU5TkZKVGUySEorc2RVZWY0djEyTlNSQnpVSjQ3?=
 =?utf-8?B?UjdyNVREdDVlajQ2NE43eVVIZW9pRWtJVmgzK0g4ZWduZ2QrdEkzeFlpS2xE?=
 =?utf-8?B?VFE4R2xzRXdTRWVyaTdiY0g1eVdZVmJiZGR5NFNqRlBSZGZvRTRiVWpvWFpZ?=
 =?utf-8?B?MVJEdzE1cWZJRWVtUitSNy9XdWk1eUJmb1pUV21pZDR0MVM3WUIyUHkrRFAv?=
 =?utf-8?B?aFFhSGkwUWF1SWdJRHZsbHJLR20yMEdCV0ZiNWVGWWQva0l2NGhjZVBNRytD?=
 =?utf-8?B?Sm12YXJWdG1nOU9TNjhVWDFnMHg4RDBSTkw3OTAwVWFmZnFDeVdqdjROWnE2?=
 =?utf-8?B?SGM1NVZ5ejJIT0R2bmdwNG0yZUdWTHltMFlnZDMvaUhKZG9xdGh4NnN4OUxJ?=
 =?utf-8?B?KzJtZC9UcTkycFZNd2dzL3NCRFJpSW9FZnZiLzZkbGF4dFhJRzlQcTZkNXJp?=
 =?utf-8?B?VmJPNzFDc0wwTDdpQVl3RTZyS2NSQks0cXBtcXJ5SnNaV3d0TzJoaGZVUURq?=
 =?utf-8?B?SnAxa0VUamFZWWZLZWRRRFE5SGV5Ym9hS2xVU0xnTGZYVnBpbDVNdkVwYUpq?=
 =?utf-8?B?T01tQWJIc1dNclVjem9RMTNuVzhXa1dBZGdka1R6NmhRenVGeDVXbHVxYUE4?=
 =?utf-8?B?Y0R0U1BYWllpUk44aTdJTUpxVzVLeS9xWDhSc08yQ2VoTG5BaGJCSkQ0bmFP?=
 =?utf-8?B?NWtCa2FQSDFMVExNdCs0aWRYSG8vd20yS0daRW1sM0FFMnZLdmVqMjJnd0NR?=
 =?utf-8?B?YmU0VTYvT2dEckRGdEpmblR5d1pNQ0JYVWV5UU9ibzVGVEIzeFIwVUdEVGM5?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e203f563-501d-4ef0-a6a4-08dc8b3888da
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 23:36:51.2007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLm119aTocO7JcNpshS5KjSoZ8ooSkNe6N8R8mFj0Ho7y0LqaULxVPZg/HtLaTSXS+Qk9+oxUvalREjzNhaQsXLYFa2KhB4gGdHnEuJDAf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8712
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

On 6/11/2024 15:30, Michal Wajdeczko wrote:
> On 11.06.2024 03:20, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Refactor the hexdump code into a separate function ready to be used
> maybe this separate function shall be promoted to drm_print_blob() ?
Maybe. That can happen as a follow up if people see a need for it from 
outside of the Xe driver. But see below about this being only a stop gap 
solution.


>
>> for dumps of other objects. Also change to dumping a host memory copy
>> rather than the live GPU buffer object. Doing so helps prevent
>> inconsistencies due to the log being updated as it is being dumped. It
>> also paves the way for decoupling the save from the print to allow
>> inclusion in error reports such as the devcoredump.
>>
>> Switch to use the dedicated kernel hexdump helper rather than printf.
>> The helper makes it easier to print out much wider lines which can
>> dramatically reduce the total line count of the dump (useful when
>> dumping to dmesg).
> as you are changing the format of the output, did you consider switching
> over to base64 ?
I don't see it as being worth the effort. The current changes are the 
low hanging fruit. Switching to base64 encoding seems like a lot more 
effort. There is not just the encoding effort in the KMD but also the 
decoding effort in user land to consider. And the ultimate aim is to 
move to compression. That's the only thing that really makes it feasible 
to dump BLOBs via dmesg. Moving to compression is definitely worth the 
effort in both the KMD and the user sides. But that ideally involves 
also moving to use devcoredump as the unified collection and dumping 
mechanism. That way only one set of tools need updating to support new 
formats. But devcoredump support is also not trivial for various reasons 
beyond simply adding the GuC log buffer to the dump.

>
>> Another issue with dumping such a large buffer is that it can be slow,
>> especially if dumping to dmesg over a serial port. So add a yield to
>> prevent the 'task has been stuck for 120s' kernel hang check feature
>> from firing.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c |   2 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c     | 119 ++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_guc_log.h     |   2 +-
>>   3 files changed, 106 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index d3822cbea273..68f1f728c22c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -41,7 +41,7 @@ static int guc_log(struct seq_file *m, void *data)
>>   	struct drm_printer p = drm_seq_file_printer(m);
>>   
>>   	xe_pm_runtime_get(xe);
>> -	xe_guc_log_print(&guc->log, &p);
>> +	xe_guc_log_print(&guc->log, &p, false);
>>   	xe_pm_runtime_put(xe);
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a37ee3419428..a35309926271 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>>   #include "xe_map.h"
>>   #include "xe_module.h"
>>   
>> @@ -49,32 +50,120 @@ static size_t guc_log_size(void)
>>   		CAPTURE_BUFFER_SIZE;
>>   }
>>   
>> -void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>> +#define BYTES_PER_WORD		sizeof(u32)
> by WORD isn't we usually mean u16 ? u32 is DWORD
It is in Windows land. I'm not aware of the Linux kernel using DWORD as 
a type. And strictly speaking, isn't 'word' meant to be the native size 
of the architecture, i.e. 'int'?

>
>> +#define WORDS_PER_DUMP		8
>> +#define DUMPS_PER_LINE		4
>> +#define LINES_PER_READ		4
>> +#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
>> +
>> +static void xe_hexdump_blob(struct xe_device *xe, const void *blob, size_t size,
>> +			    struct drm_printer *p, bool atomic)
>> +{
>> +	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
> and magic "9" is from ...
That is the length of the ASCII string - 8 hex digits and one space. 
With a +1 for the null terminator. I suppose it could be wrapped up as 
ASCII_LENGTH_PER_WORD.

>
>> +	const u32 *blob32 = (const u32 *)blob;
>> +	int i, j, k;
>> +
>> +	if (size % (WORDS_PER_READ * BYTES_PER_WORD)) {
>> +		u32 remain = size % (WORDS_PER_READ * BYTES_PER_WORD);
>> +
>> +		drm_err(&xe->drm, "Invalid size for hexdump: 0x%lX vs 0x%lX (%d * %ld) -> 0x%X\n",
>> +			size, WORDS_PER_READ * BYTES_PER_WORD,
>> +			WORDS_PER_READ, BYTES_PER_WORD, remain);
> hmm, all this seems to be due to bad coding by the caller
> maybe just
>
> 	if (WARN_ON(size % (WORDS_PER_READ * BYTES_PER_WORD)))
> 		return;
>
> as this should never happen
It could just be a WARN and bail. But given that this is all about 
getting debug output for hard to debug situations, it seems prudent to 
get what we can out than to just abort and get nothing.

>
>> +
>> +		size -= remain;
>> +		if (!size)
>> +			return;
>> +	}
>> +
>> +	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>> +		const u32 *src = ((const u32 *)blob32) + i;
> no need to cast, blob32 is already const u32*
Hmm. I think the intention was to get rid of blob32 and just cast blob 
here given that this is the only use of blob32.

>
>> +
>> +		for (j = 0; j < WORDS_PER_READ; ) {
>> +			u32 done = 0;
>> +
>> +			for (k = 0; k < DUMPS_PER_LINE; k++) {
>> +				line_buff[done++] = ' ';
>> +				done += hex_dump_to_buffer(src + j,
>> +							   sizeof(*src) * (WORDS_PER_READ - j),
>> +							   WORDS_PER_DUMP * BYTES_PER_WORD,
>> +							   BYTES_PER_WORD,
>> +							   line_buff + done,
>> +							   sizeof(line_buff) - done,
>> +							   false);
>> +				j += WORDS_PER_DUMP;
>> +			}
>> +
>> +			drm_printf(p, "%s\n", line_buff);
>> +
>> +			/*
>> +			 * If spewing large amounts of data via a serial console,
>> +			 * this can be a very slow process. So be friendly and try
>> +			 * not to cause 'softlockup on CPU' problems.
>> +			 */
>> +			if (!atomic)
>> +				cond_resched();
>> +		}
>> +	}
>> +}
>> +
>> +#define GUC_LOG_CHUNK_SIZE	SZ_2M
>> +
> missing kernel-doc
Yup.

>
>> +void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic)
>>   {
>>   	struct xe_device *xe = log_to_xe(log);
>> -	size_t size;
>> -	int i, j;
>> +	size_t size, remain;
>> +	void **copy;
>> +	int num_chunks, i;
>>   
>>   	xe_assert(xe, log->bo);
>>   
>> +	/*
>> +	 * NB: kmalloc has a hard limit well below the maximum GuC log buffer size.
>> +	 * Also, can't use vmalloc as might be called from atomic context. So need
>> +	 * to break the buffer up into smaller chunks that can be allocated.
>> +	 */
>>   	size = log->bo->size;
>> +	num_chunks = (size + GUC_LOG_CHUNK_SIZE - 1) / GUC_LOG_CHUNK_SIZE;
> DIV_ROUND_UP ?
Yup.

>
>>   
>> -#define DW_PER_READ		128
>> -	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>> -	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>> -		u32 read[DW_PER_READ];
>> +	copy = kcalloc(num_chunks, sizeof(*copy), atomic ? GFP_ATOMIC : GFP_KERNEL);
>> +	if (!copy) {
>> +		drm_printf(p, "Failed to allocate array x%d", num_chunks);
> I'm not sure that caller wants this message in it's printer output
It's better than having no output at all. Which is what you get otherwise.

>
>> +		return;
>> +	}
>>   
>> -		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>> -				   DW_PER_READ * sizeof(u32));
>> -#define DW_PER_PRINT		4
>> -		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>> -			u32 *print = read + j * DW_PER_PRINT;
>> +	remain = size;
>> +	for (i = 0; i < num_chunks; i++) {
>> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> it's usually bad idea to overlap variable names
Yeah, but the outer size becomes snapshot->size in the next patch. I 
could rename the outer one total_size.

>
>>   
>> -			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>> -				   *(print + 0), *(print + 1),
>> -				   *(print + 2), *(print + 3));
>> +		copy[i] = kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
>> +		if (!copy[i]) {
>> +			drm_printf(p, "Failed to allocate %ld at chunk %d of %d",
>> +				   size, i, num_chunks);
> ditto
Ditto to what? Printing an error message in the output file? As above, 
it is better than having an empty file with no explanation as to why.

>
>> +			goto out;
>>   		}
>> +		remain -= size;
>>   	}
>> +
>> +	remain = size;
>> +	for (i = 0; i < num_chunks; i++) {
>> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> ditto
>
>> +
>> +		xe_map_memcpy_from(xe, copy[i], &log->bo->vmap, i * GUC_LOG_CHUNK_SIZE, size);
>> +		remain -= size;
>> +	}
>> +
>> +	remain = size;
>> +	for (i = 0; i < num_chunks; i++) {
>> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> ditto
As above, the outer size is only a temporary thing until the next patch. 
Whereas these stick around forever.

John.

>
>> +
>> +		xe_hexdump_blob(xe, copy[i], size, p, atomic);
>> +		remain -= size;
>> +	}
>> +
>> +out:
>> +	for (i = 0; i < num_chunks; i++)
>> +		kfree(copy[i]);
>> +	kfree(copy);
>>   }
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 2d25ab28b4b3..5149b492c3b8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -37,7 +37,7 @@ struct drm_printer;
>>   #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log);
>> -void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>> +void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p, bool atomic);
>>   
>>   static inline u32
>>   xe_guc_log_get_level(struct xe_guc_log *log)

