Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D926AD3ABD6
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 01:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8B910E0A8;
	Sat,  6 Dec 2025 01:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IliRAIlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A379710E0A8
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 01:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764986039; x=1796522039;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KXTjC5SF0OeUA9mYkQcHEwLAfEGBdYpfMmydpQ0qh4k=;
 b=IliRAIlvIgQfLjgfHx2p0fWfd8xm9b0GT0ezn9IBe3mWF+bneskao8u+
 jsYudgx325WeKXKaq7Flqq5k+5dBcKgBmp9ivWIKgqxD2p+Lb/FyDo0tD
 h5Sd7Jw2mecIrIkvyry9AHzKI2Noib4Wurrm6PWpKWLroZZ2jiONESKkj
 I1tzoop4WaUnka4NbzIQKiaEUGoy9fezJVfghLs77oKzXP4Ajs1c5PmOK
 GvmIBVAy+ffAnNE8w2feNg0hRqs19syPY4n/HJ7MiYWLdAXJkkBU7XpQJ
 c6gIkFYebcuqlxsft9OCTSJY/LrcQnxtBBA9+3ty1GK2bQM5kZj2zpF5s w==;
X-CSE-ConnectionGUID: QlPzO08kTL+BLk0o5K5qzg==
X-CSE-MsgGUID: 97w/jFIiR7yEXfOWbKltdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84429138"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="84429138"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 17:53:59 -0800
X-CSE-ConnectionGUID: rlhUjBvFScSnOVR9DaYKzg==
X-CSE-MsgGUID: KiBt1fqlRdqWrXwu0ogkPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="195068519"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 17:53:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 17:53:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 17:53:58 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 17:53:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaMj8lrA+93Auk7ctp39ixZXindi4syEblv+WMP74YKmBuLqd8GnAQGIsOfNGjkfeYannJ9S2F+OXWJuPxEQYWwkqMtqaoNWymAa7gyVFGmD5VIn3jsnxXP3XE/yQark8SAdw3PV4ZwPkk642Qn+jujbuzzr1+lq0pcte3uULnvppavD2nATCniCf3fJ16hzZ5MOkp0/JOYgvPGqbpoLzsTjslNMzcpOJGSew7akOAC/ucA+HFIryxHHTiytXLdxWIUO4wDAtvcwWcLwDzrSq+ThJBYI+nlur5hI7ZzBc0pRxN0KcgtpSoGaheCHO/1ONruwzxwkaHeYGJ0/Hn+VEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZUHl/dUYEbf2TVGsdNxjU8v+Ro9sBoBUzJzwyeap2U=;
 b=kp725WQGwhzDuxSivv64jPFKrF2M6UzSeeaNJX292eYaFgR/AQPagLgW/vy/xcFqqznxTGSDI4u+toLgtr6gkFxa+u+gHcxZGjz1wJ1PsKzSVIA58SpD6/uju21PpFJpe2OIsGPdV2e8XV+3lm3zQ48YlRIaic19PJD6R9NXMX7wlKa6aADl+quXpw6mMHA0ABGpEMkpGPfmQJ3TIacZwv8eBEJL+ORn7PUBggrHaJ3cXwm+9vMeYVa9Gv9xU3Apzh0sWeY4QmHPc2phPx4uTSIs678hnQLOONjbdjVawYekcxEADNSOts4jUD+RtiJ+EplFy8zUs+Wu1Rmuj9AiDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Sat, 6 Dec
 2025 01:53:49 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Sat, 6 Dec 2025
 01:53:49 +0000
Message-ID: <ef39473a-b428-4009-83f6-d16fb33d9d5c@intel.com>
Date: Fri, 5 Dec 2025 17:53:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] drm/xe/sriov: Add debugfs to set EQ and PT for
 scheduler groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-22-daniele.ceraolospurio@intel.com>
 <454e2e50-6fb8-4577-bc0b-4519b6beaf01@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <454e2e50-6fb8-4577-bc0b-4519b6beaf01@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d209f55-bae3-4194-6a08-08de346a4ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1NOSk1mZWZVbU02Y01UcDBoMkZRVzBQbmxEc0gvalEwdWlBaTdRTXlQQUZG?=
 =?utf-8?B?aUFyYWhyeHVualhYV2JnREJvQ2hPeFZoUStlK1RFc3FUK1VOZzdyUkhIZWpE?=
 =?utf-8?B?TVkzVjZXV1E0dk94R3FMS2xRbDFpWENqWVpna1djU1g1d0U4ZXlzaERld2ZR?=
 =?utf-8?B?NUs1T3FERjgyRDh1WU8vUS9zdDBEejZsdU1YK1FqRWxQWnk5c0xNdGxFNzFa?=
 =?utf-8?B?cjRLdXpmZVVwZ21zVTZ0OFg5UmZIYlRlNnEzL3V4akpqekplYzBPeDM3cmN3?=
 =?utf-8?B?V1FPQkh5enM4amdxSDVndEJBLzNRTHNaRUdBZ2V3Tng5UmNzTE0yVGhiUGw5?=
 =?utf-8?B?eCtHZmpiK0t6SVlkNGpFYWsvK1hmOVFZamFSWTMrdTFDUjFldUl2Z0I2U2tt?=
 =?utf-8?B?dmc2T2p3MXBkWWhnb2xXRkZXR3lVYWhkVTlnR3ZBR0JrdUIvQ2FBTDhVck5T?=
 =?utf-8?B?Y29Hc1N6UHgxWjE3cjQvWmV4ZWZjTXp3V2tpUTZhcUd1VVJRL3FlTFplWGZE?=
 =?utf-8?B?OXpkRTF3cm1WeVJnL0hDN1dQdC93WE94Y1hvN09kY1Z5SWdWMW8zQmlObUZC?=
 =?utf-8?B?S2ZNYytXM0RrOWlFc2IyUEJacjlpdTZRVll2cDhscy85VkY3dkV0cUtHdmRx?=
 =?utf-8?B?REVkcW15VEpIZE4zc0E5L0Jpb05EZWxhZkRVelU5VjFpQ0w5TzdWOFV5cWdZ?=
 =?utf-8?B?NTlXcGtuSURHUFpHeGFCOXdYMTUzbEFaQUoyNFZaYW5xeWRkSUhjbHlabW45?=
 =?utf-8?B?ZEJuZW1yQ0dncVZrbVRXQlVzM29OQmtMc242UFErV2tpeDBkZkZ3YkhZKzBY?=
 =?utf-8?B?UTBaUGJhT04wek1GRUxvaGtWU015cnZHZnlMN3VXdHkzczNEemZsOWxiblNj?=
 =?utf-8?B?ekJNeFNjZm5CREtlY3RaZU05UDMvbjZKbTZFYU9OcDIrSnpuejdKRjJHMmIr?=
 =?utf-8?B?SnN6dGR5QnBwYStVRTREWXpEVjZwUkZOV0o3aTk3cnlMRmIrNWx4b2lheW0v?=
 =?utf-8?B?Z3VzZjhjMFo5MkFDN0RyelE2cTZob3l6ZUtpQ2JLNmVXNURreTI5a1loZDl3?=
 =?utf-8?B?Rkk0dmFPckRnekprZzExK0RIcXdXcTJNUklJdkgzditFNkkrSTZpWlNGSEx5?=
 =?utf-8?B?bGF5MkN0ZzA4cS9ueFJCcHdQQ3JIZHdKUlByU3E0ZUxRSjIzSDlvL0pacW5y?=
 =?utf-8?B?bGJ4bDd2REkzcityNnNPVVdEN0s0ZUFlaXNFaWRqLzZYaWdLZ2puTlR4aUcr?=
 =?utf-8?B?UXBIVlRKM0ZKcHVQRGFsTHN5ci9kQUh1cjhkVG1aa0MwS281UTVocjZUV3lU?=
 =?utf-8?B?Y0xnVTg5TUVrSWJCM25iZHhtRm1weWpmVmRmazhXSVUraU9pc2pEYzhPUEI4?=
 =?utf-8?B?N0p4ZEZiS0VvTFBjODhmWDNVbDFnS0VYd3JOWUtzWWlFejBtYnh2VFFkV1Jv?=
 =?utf-8?B?YmZTRndoLzVYa0lvSkt1MU1KTlRkYUVjNXFJWUtDdmFPdytiVWZQSlc2OTdo?=
 =?utf-8?B?MEd0cHh2VnBnK1ZZdWZ3WThmZDdtNEJUUUdHUTZoN2JlSWMzNjdsVGYzMnov?=
 =?utf-8?B?dVdrNFE0L2REL3V0djRLb0NsSlFYNDZMSUJ5RFhRSkxPVFBTWDlGRktGckFV?=
 =?utf-8?B?ZGd3ZFp5bG9VRFMxVU5kRjU2YWFaRGhUOUFVbGh0bzd2QWt2dGVsM0oyUVZM?=
 =?utf-8?B?WlFNeGM5akJkUDgzNVdRV3VESllneVhlcS9zVk5ROGxaVFJoUFZINXZjRy9x?=
 =?utf-8?B?TVpJZFoxZi9DY0tpYWI2blVMS3E3SzY5ckxZWE5Uc2ZlRWZLdjQyaDFVL2hi?=
 =?utf-8?B?RlhhUWVnMW1DdHRPN3EycDgwdFEvbjZXc2trMlRNMkZIK1NOZGRRYllPVVhR?=
 =?utf-8?B?aFlZTHNrRFZ2S1N1RmFEV0puS2FJQmx5SXRTMVZoemNGRkxVdVZRUzNSUEFK?=
 =?utf-8?Q?ObYNDsvOuHEv+6Da7Kb5U3eMjdBTASGA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QytPYWJ5cGNzQ1Q0RmdtNktaRnE5QmZDZ29JdCtaQUlkYUFIcjluOVM4bVRv?=
 =?utf-8?B?eXZHL0d3WkhKd1hrRXE3cGdlSjhBOEk3VTdtZS9hdUxWM0s2eVNQbFRUZmMz?=
 =?utf-8?B?bVMyQm9NV3VMaEpZUjg3YlRaRzh3cVF4WlhDVDdUNlZxOGM2cTl0QzVVOEJJ?=
 =?utf-8?B?cWh4Z2RjemFOVndoeklPWkJEWnBkajVhakkvcDBPbGs1R05LRXlrYStaZ1Jv?=
 =?utf-8?B?dkFCZ2c1ejh5NDhZS3BYdVRHUjM2UlgwRW9qOU5GclIvdnJZbVNRRHIxa1hM?=
 =?utf-8?B?VU1va3Q5d0ZhREltVSt5M0pRM3R4Y0dIZXc5SzY2Qlg0SFA2aGhSZzU2SFA3?=
 =?utf-8?B?MjRsaXRReGp3SVFCMVZwM1FzSUw2NzgwaGdyVnhzK01YRnFMMTIwOURiOUcw?=
 =?utf-8?B?L0RNcHdTWFVTSEpxTC9nUW90bEFyTmFNbzB0cm9mR2Zqc3VDNmFobVRhbWEy?=
 =?utf-8?B?ZEE3THMrNmwzdWdpUzE4dkp5Smx3ZlN3SVBlV2FHZVlzYjRiSWNpZnI1VFZq?=
 =?utf-8?B?WlJzdVZNa3NXMmlJZ0Y1MkpkMUwxWE5oMEdBMDA2czFpMUNWdkY1VFRkdzBD?=
 =?utf-8?B?TnRWSzQ3TUJzZEs5UFVicm9LOWJ3amZ4UGkvL3dud3RWc3BQZnJ0eVVEZWUv?=
 =?utf-8?B?N0IyeXRWVWhOUmlpeVhYaUpVeXlieXYvOU5jY0YvcUxBNDVxNExyOHp1YnIy?=
 =?utf-8?B?TVhPRHF5R2pldUR1YW5OMFJvcmpQWFR0UFlUYWJncEE3NTlGQ0RkenJSajV5?=
 =?utf-8?B?SzhCK1U3M0xxMEY1Qmk5c1l0dENkTG9sNWh5UDlEQkZyd3NVUVhBZTNGOGU4?=
 =?utf-8?B?dkVnTHozMGYvMXBjcGN1MHUvSVMxUlRyTHF1S3FmRU56WVlrdXE1aTVTTFpz?=
 =?utf-8?B?L21EbXN3OVhsY01GWUs3R0NyUDlpVzRKQmpsTHo2YWV3RlFZZFVWZXJSY3cy?=
 =?utf-8?B?aXIzZ1g1SGJ5dVVXZlhHZWxUSkE1cCsrMUJqN2dBWjdXN1lDaWJsWnhPbDhY?=
 =?utf-8?B?UjVqSXdWemJKOGpQYWR1eGxnVEpadUl3WnNUaEp3RUtDOElJVjc2UE9HNWhi?=
 =?utf-8?B?RnA0ejdBTnFZZkRvUUY1ZndUSzVDNVZxYTBSd0M3QkhEN2ZLam5LR3Y1dnF2?=
 =?utf-8?B?R1MwMWlBTG1HUU1CSEp5TUZ5TTJFalovTzJpMUFRdi9rMzJyWi9kT2NjaGlh?=
 =?utf-8?B?b2JIeHdIZXVOUUxsQXVaYU9yY055RHJOekw5UlhMSmQ4cmxXOWFvOFFFV1dU?=
 =?utf-8?B?NzR5WVlBdXQ2bnZmTWhibkd6aWJWbEt2dFdOdDRPbytCNlp3Y2tXakJ3dU9G?=
 =?utf-8?B?ZmRnVzd0MlFtSUNEdzZKRUJVaWc3Ym1LVC9HQ0xHclg2VGVOMFZ6WTBNZDUz?=
 =?utf-8?B?VDZOSDR2MTdWaTlOWmMwRHZFSjN0aVgwenBOUThUNCtOM1I1ckFDbGI4MVJK?=
 =?utf-8?B?SXdDSjlzYXkyeUtyWHpUZHdZRHlaZlIwRVhkcS9FdXU0ZGtraUl1ekdDWnJE?=
 =?utf-8?B?bWk2OWtjckhnZnhHYVVZdHA2Z0FMQkNlSDZwajVadEw1dktpYXFJVlFhc3pY?=
 =?utf-8?B?SmZsZTRIRzlSZmxIZW1LcTNxbWZlR3ZvV1VvdmRnNFUrZXIvSUFxMm4vMzJH?=
 =?utf-8?B?RW8vTDNHVENoOHhrSiswcGVhQXg0R1Y2NE1taGlPeGNETGtoNUtMWlMzSE1V?=
 =?utf-8?B?VzVpQzBJSlhIQyszVFNsVWIyZmNKczJYaCtVS25XRER4eEFxMkFReUdMamhD?=
 =?utf-8?B?OXNPbFNtNzNhcjM4Rkl5NEwrQkZLNFNTbVVCV3M5OThJYjVHTkw2dUtYekxv?=
 =?utf-8?B?eEpobHRDaHJaZTRwSTZvMWtxNEJpdUtzalZwb3dHZDVsQ0xtQng5QStMMEls?=
 =?utf-8?B?RXFIT2lnRjVwaHQrN1A0aFVYeVk2VllGdTh0bkd5REJoL0lvTTVUUzFKdSs0?=
 =?utf-8?B?YW5ZVXQ0eEludWpJVktKMVZWcFJPZTFCZzRPRDR1L214eUJTYXZUa0p6S2Fw?=
 =?utf-8?B?YU1QOHlLK2taSTE3a3JUZ3IzbFhEbSt0MHc4bXlKNEtmWHdGNmV2S2R2Z0ZU?=
 =?utf-8?B?Slk0VlY0VVJESVJGNnZDUENiVFVlbERXZWErV21xamI3UE9qbmRzdDdTR0Mz?=
 =?utf-8?B?ZVkrT1lOMm9BOGFmUVJNQSt5ZE42TUpIb2NKcUNFLzVlTDJQZ0FQVmhIK2RX?=
 =?utf-8?Q?xFwKgBgyHjQT+QHOKbwWFA4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d209f55-bae3-4194-6a08-08de346a4ce1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 01:53:49.5836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSzLp0wsUvMyg68o6dUaDz/hzSROr2aqSYJc5g3Buh1YFeJhje4ocqNRWMKTPWf5p8g8yLcbO1pvcNuOJkL+2H0sd1EWyUcZjZSQdL3RjA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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



On 12/2/2025 12:17 PM, Michal Wajdeczko wrote:
>
> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>> A top-level debugfs file is added that allows a user to provide a
>> comma-separated list of values to assign to each group. Per-group files
> it doesn't need to be comma-separated list, just array of integers

parse_int_array_user() requires a comma-separated list. IMO better to 
re-use that one that to re-implement our own logic.

>> are also added to allow individual tuning of a specific group.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 173 +++++++++++++++++++-
>>   1 file changed, 168 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 947e2b92d58a..052510736017 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -165,24 +165,169 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>    *              :   ├── gt0
>>    *                  :   ├── sched_groups_mode
>>    *                      ├── sched_groups
>> - *                      :   ├── group0
>> - *                          :   └── engines
>> + *                      :   ├── exec_quantums_ms
>> + *                          ├── preempt_timeouts_us
>> + *                          ├── group0
>> + *                          :   ├── engines
>> + *                              ├── exec_quantum_ms
>> + *                              └── preempt_timeout_us
> as already commented, per-group EQ/PT are overkill
>
> let just keep array-variants
>
>      *                      ├── sched_groups_exec_quantums_ms
>      *                      ├── sched_groups_preempt_timeouts_us
>
> and regular files for groups to show configured engines (if any)
>
>      *                      ├── sched_groups/
>      *                          ├── group0
>      *                          ├── group1

ok

>>    *                          :
>>    *                          └── groupN
>> - *          :                   └── engines
>> + *                              ├── engines
>> + *                              ├── exec_quantum_ms
>> + *          :                   └── preempt_timeout_us
>>    *          ├── vf1
>>    *          :   ├── tile0
>>    *              :   ├── gt0
>>    *                  :   ├── sched_groups
>> - *                      :   ├── group0
>> - *                          :   └── engines
>> + *                      :   ├── exec_quantums_ms
>> + *                          ├── preempt_timeouts_us
>> + *                          ├── group0
>> + *                          :   ├── engines
>> + *                              ├── exec_quantum_ms
>> + *                              └── preempt_timeout_us
>>    */
>>   
>>   struct sched_group_info {
>>   	struct xe_gt *gt;
>> +	unsigned int vfid;
>> +	u8 group_id;
>>   	u32 *masks;
>>   };
>>   
>> +static int sched_groups_config_show(struct seq_file *m, void *data,
>> +				    void (*get)(struct xe_gt *, unsigned int, u32 *, u32))
>> +{
>> +	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct sched_group_info *groups = m->private;
>> +	struct xe_gt *gt = groups[0].gt;
>> +	unsigned int vfid = groups[0].vfid;
>> +	bool first = true;
>> +	u8 g;
>> +
>> +	get(gt, vfid, values, ARRAY_SIZE(values));
>> +
>> +	for (g = 0; g < ARRAY_SIZE(values); g++) {
>> +		drm_printf(&p, "%s%u", first ? "" : ",", values[g]);
> maybe we should print values without commas ?
>
> 	20 20 30
>
> it's more likely to be accepted when we promote that to sysfs

I left the commas to match with what we expect for the input.

>
>> +
>> +		first = false;
>> +	}
>> +
>> +	drm_printf(&p, "\n");
>> +
>> +	return 0;
>> +}
>> +
>> +#define MAX_EGS_ARRAY_SIZE (GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT * sizeof(u32))
>> +static ssize_t sched_groups_config_write(struct file *file, const char __user *ubuf,
>> +					 size_t size, loff_t *pos,
>> +					 int (*set)(struct xe_gt *, unsigned int, u32 *, u32))
>> +{
>> +	struct sched_group_info *groups = file_inode(file)->i_private;
>> +	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
>> +	struct xe_gt *gt = groups[0].gt;
>> +	unsigned int vfid = groups[0].vfid;
>> +	int *input;
>> +	u32 count;
>> +	int ret;
>> +	int i;
>> +
>> +	if (*pos)
>> +		return -ESPIPE;
>> +
>> +	if (!size)
>> +		return -ENODATA;
>> +
>> +	ret = parse_int_array_user(ubuf, min(size, MAX_EGS_ARRAY_SIZE), &input);
>> +	if (ret)
>> +		return ret;
>> +
>> +	count = input[0];
> need to check against GUC_MAX_GROUPS

ok

Daniele

>
>> +	for (i = 0; i < count; i++) {
>> +		if (input[i + 1] < 0 || input[i + 1] > S32_MAX) {
>> +			ret = -EINVAL;
>> +			goto out;
>> +		}
>> +
>> +		values[i] = input[i + 1];
>> +	}
>> +
>> +	xe_pm_runtime_get(gt_to_xe(gt));
>> +	ret = set(gt, vfid, values, count);
>> +	xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +out:
>> +	kfree(input);
>> +	return (ret < 0) ? ret : size;
>> +}
>> +
>> +#define DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)		\
>> +static int sched_groups_##CONFIG##s_show(struct seq_file *m,			\
>> +						  void *data)			\
>> +{										\
>> +	return sched_groups_config_show(m, data,				\
>> +					xe_gt_sriov_pf_config_get_groups_##CONFIG##s); \
>> +}										\
>> +										\
>> +static int sched_groups_##CONFIG##s_open(struct inode *inode, struct file *file)\
>> +{										\
>> +	return single_open(file, sched_groups_##CONFIG##s_show,			\
>> +			   inode->i_private);					\
>> +}										\
>> +										\
>> +static ssize_t sched_groups_##CONFIG##s_write(struct file *file,		\
>> +					      const char __user *ubuf,		\
>> +					      size_t size, loff_t *pos)		\
>> +{										\
>> +	return sched_groups_config_write(file, ubuf, size, pos,			\
>> +					 xe_gt_sriov_pf_config_set_groups_##CONFIG##s); \
>> +}										\
>> +										\
>> +static const struct file_operations sched_groups_##CONFIG##s_fops = {		\
>> +	.owner = THIS_MODULE,							\
>> +	.open = sched_groups_##CONFIG##s_open,					\
>> +	.read = seq_read,							\
>> +	.llseek = seq_lseek,							\
>> +	.write = sched_groups_##CONFIG##s_write,				\
>> +	.release = single_release,						\
>> +};										\
>> +										\
>> +static int group_##CONFIG##_set(void *data, u64 val)				\
>> +{										\
>> +	struct sched_group_info *gi = data;					\
>> +	struct xe_device *xe = gt_to_xe(gi->gt);				\
>> +	int err;								\
>> +										\
>> +	if (val > (TYPE)~0ull)							\
>> +		return -EOVERFLOW;						\
>> +										\
>> +	xe_pm_runtime_get(xe);							\
>> +	err = xe_sriov_pf_wait_ready(xe) ?:					\
>> +	      xe_gt_sriov_pf_config_set_group_##CONFIG(gi->gt, gi->vfid,	\
>> +						       gi->group_id, val);	\
>> +	if (!err)								\
>> +		xe_sriov_pf_provision_set_custom_mode(xe);			\
>> +	xe_pm_runtime_put(xe);							\
>> +										\
>> +	return err;								\
>> +}										\
>> +										\
>> +static int group_##CONFIG##_get(void *data, u64 *val)				\
>> +{										\
>> +	struct sched_group_info *gi = data;					\
>> +										\
>> +	*val = xe_gt_sriov_pf_config_get_group_##CONFIG(gi->gt, gi->vfid,	\
>> +							gi->group_id);		\
>> +	return 0;								\
>> +}										\
>> +										\
>> +DEFINE_DEBUGFS_ATTRIBUTE(group_##CONFIG##_fops, group_##CONFIG##_get,		\
>> +			 group_##CONFIG##_set, FORMAT)
>> +
>> +DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
>> +DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
>> +
>>   static int sched_group_engines_info(struct seq_file *m, void *data)
>>   {
>>   	struct drm_printer p = drm_seq_file_printer(m);
>> @@ -261,6 +406,18 @@ static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
>>   		goto out_err;
>>   	parent->d_inode->i_private = infos;
>>   
>> +	/*
>> +	 * assign group 0 gt and VF id values early as they're used by the
>> +	 * exec_quantums debugfs to set quantums for all groups
>> +	 */
>> +	infos[0].gt = gt;
>> +	infos[0].vfid = vfid;
>> +
>> +	debugfs_create_file("exec_quantums_ms", 0644, parent, infos,
>> +			    &sched_groups_exec_quantums_fops);
>> +	debugfs_create_file("preempt_timeouts_us", 0644, parent, infos,
>> +			    &sched_groups_preempt_timeouts_fops);
>> +
>>   	for (g = 0; g < num_groups; g++) {
>>   		struct sched_group_info *info = &infos[g];
>>   		u32 base = g * GUC_MAX_ENGINE_CLASSES;
>> @@ -273,10 +430,16 @@ static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
>>   			goto out_err;
>>   
>>   		info->gt = gt;
>> +		info->vfid = vfid;
>> +		info->group_id = g;
>>   		info->masks = &policy->guc.sched_groups.modes[mode].masks[base];
>>   
>>   		dent->d_inode->i_private = info;
>>   		debugfs_create_file("engines", 0644, dent, info, &sched_group_engines_fops);
>> +		debugfs_create_file("exec_quantum_ms", 0644, dent, info,
>> +				    &group_exec_quantum_fops);
>> +		debugfs_create_file("preempt_timeout_us", 0644, dent, info,
>> +				    &group_preempt_timeout_fops);
>>   	}
>>   
>>   	return;

