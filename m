Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533BBC8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 18:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8A10E1B8;
	Tue,  8 Jul 2025 18:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsgJWTbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB9910E1B8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 18:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751999500; x=1783535500;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XhruCGdEJrwppSXyqM8YO4FBLsnovCSPnbRU6Tshpe4=;
 b=QsgJWTbITHWQHe83xlWsBqLXlIIs+eeqMOXFZ0s/d2x8ARu4BnEZnugd
 adqw9DayaDNpPh/UXb6szihcFH8u8iXLk6mhSs/ApvJ6WBJcl4B/Hd8Zq
 d3Y7+6UMlI/czkvYPTr4kY3/osGw1cAyt04TE2aKUfyslc8liGeig3t+U
 M8cCmMdT2NCs1xI9WfHn/vCi9rShIzgIwceNvZ8YXU3+52+ALRTT0xpRM
 H2f/mQJ2FHZSjcvKdNVmYIXgGDNCQRMHNiohyvvcRURjN7XO74akbcOry
 VgNEGUGnQPUkdPD4YrDQrsl12t8wJoJE8mcHnbBMgL/37DwUAtyJnSzfV g==;
X-CSE-ConnectionGUID: Ezbl6aJUTcq2i09LzQziLQ==
X-CSE-MsgGUID: 0bo4gP3nQJW9GsVi5HjL5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65310242"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="65310242"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:31:40 -0700
X-CSE-ConnectionGUID: DkkeeGn+RuWh/M1eYzX87w==
X-CSE-MsgGUID: +9KpQy3FSSaNFh8bld2GUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="161220094"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:31:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:31:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 11:31:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.82) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:31:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITof4sjZ3mMiMHLKfTIgU2uLGlJk7DV6kKkArLYUcrsUEy/gQKZFGQqD1StaRRXZD6gqRQq9pzpcAEY+iuACEXxZWLAwVtnGI4VN5n4BrG5V8KNTeW058dzpRAlcO1+hvETU2yB1mXBf7qZJ9i/ZbGgMqCK7C86URlizmVqUwvR5MUAS82Ec59PK/472kqTnWiuQuFXXn1FDv9DyJ9pZxo3iywo7IiJNvHXyUwZ0VJNEmV8UVujEU9ebnQ8nwhT2Vrch1jubN7q8Y7VGp1iw4U4efIc0hxVlPtenetRynEggCgoug8jlgRlionwjIOv7wM/Y9eRUwbN8omte+v7PCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1B/kGonP+NR5vAiUk2G/nxASFne/c+ZBtcT+7LC6Yw=;
 b=NVw3DBjgoWAdKNaEXT8GBmmwLWCkvG/QhO2KRHtvHTgRymToln6+2yrU+FnF8pMbA7XENCc66/2Rv4N4liFC95oAFrqzKWJblt6ZSsdoPtGyHrumiIf/mXiYdKF9MW6MNKZYdJMkfaEdH5nBWcYvl+JWsGp2Pqie7Z0I4we4BUfL2ZiIQaT5yZonBwwXgEg0OD1whc2gg4LCgfMJzZH1CR9JaCGzdohvpnv3AVxx04owdq+zGlPwNOUC4kBq1/m1nO+zt8ZoGMmujErr/XCOKspH048l8GbcVEd46UBzT4vFaEnbcnvS5HfpPHPgIK6H+9J2m6neH2QKO6rNvYf11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8664.namprd11.prod.outlook.com (2603:10b6:930:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 8 Jul
 2025 18:30:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 18:30:53 +0000
Date: Tue, 8 Jul 2025 11:32:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Dont skip TLB invalidations on VF
Message-ID: <aG1kRI0/E1N9kOY8@lstrano-desk.jf.intel.com>
References: <20250708090156.741440-1-tejas.upadhyay@intel.com>
 <77280c68-fb75-434e-ac04-6d9e97513c90@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77280c68-fb75-434e-ac04-6d9e97513c90@intel.com>
X-ClientProxiedBy: MW4PR04CA0261.namprd04.prod.outlook.com
 (2603:10b6:303:88::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 616a9264-8b83-4e98-dd24-08ddbe4d9221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djNEdHRnRWlraDdqaWRoRmFKSW85ZmRlN1V6aStocWJ5N3VoTVRvdVFIK3Vr?=
 =?utf-8?B?MFpJVXBQMngxZnpNVVVrRVdTWGpYRUJyK2NsaTBKaUhab0lkT0lRRjFJN2VK?=
 =?utf-8?B?aU5Fd2Q2dElyaXM5SzU1elBPQ2dnalJXSTNjVm1PY3plOXNYdjZOTGM2SGtR?=
 =?utf-8?B?WnZjRUFDWW92dmFBRVM0SUhoMnR4cG9vZEozMGdhcGFuQVhTTUFLT2Z1QzZj?=
 =?utf-8?B?WWRkdHdlcUs5MHdnaGZTQTFLMmZrcmpkQ2NtVHJmRWVhcnRwZGhtdUtFUk1H?=
 =?utf-8?B?YzRhZTlOaklSYTZSZ2oxZVBFRzFhOU8xTy82cVNRMktzZDhzUHlLRUxUbHhs?=
 =?utf-8?B?eVJETmJ3S0lPUW5jSW9ZK3VmRXM5a0RhQUNPdkxJZlNDa0FqZy90dzlvQTg2?=
 =?utf-8?B?SlEwWExMVWQzbmZSRnMzTFFtRVVCbUgyaDhVZlNEOHAzNTB1YzUrNmlBbjZm?=
 =?utf-8?B?WnByS01xVG0zRHdGK2JHS3hBTzhUMnAyZHBqdkNxRTVod1hEa1hIRFg5VjFI?=
 =?utf-8?B?RFlEZ0lkeUZmbVhJcHdud2FrZ0pVQXBmQng0cVpIN0dIcEtaTHM5dlpXb2ps?=
 =?utf-8?B?ZkRialhGbWJTckF5MUs4UkV1UWloUjZEK0JaV1YzTmZjUUh1NWxoUTFkU3hU?=
 =?utf-8?B?QUxsUDVkRjMvVTR5M1o5bENuaUlRS0pMUFM5a2p5TDlXUXorSzRrQTM0UzB4?=
 =?utf-8?B?SU8veWh6RkFnamUrUUxkZkZMdW15Q1JJc0krd1hJbnIzM0NBNGV0WnJmUHBw?=
 =?utf-8?B?bmVsdWxwTyt3d0JyNVJFQStEOWRUc1pZOWVEZzN2Y2VCUmg2RnFHOW5lUEFK?=
 =?utf-8?B?M0p5UCs0ZFgzS3NpcS9vdmplSW9WbE5JVXUvdi83L1YrUzFBVVNHNUxCdEVD?=
 =?utf-8?B?akVtZ1dwVVA5aGNXaGp0UTB0clQ3QW01NTZwNnR0K2Ric1puVjluaFJBSmtO?=
 =?utf-8?B?b0JXUFZndXBZR1EwMlIrdkFwZndnTDlJRDVMRWZLSktXMWJoWkxBcm5mdUVw?=
 =?utf-8?B?cnZIZlpVNm1GRXhuUUVFbGNJOFZ5M1VTM2syejJmSnNGaE5WaVZLcEU0N1kx?=
 =?utf-8?B?T3hFOUZCZTRWMEE0RzRiRGJHS1lvd3FURGF2NmVwNTdaaUpLRytDcEIzdWFr?=
 =?utf-8?B?UHJ3cHlCd29pOEV2eG9DWjYzZEVEbWlxQnBLMkdFRWp6R0NGaW5hWm5QcFg3?=
 =?utf-8?B?MEh4T0hBYjErbGxoNWdHd1ZQMkpTVjl0Mk0rdDZQbGduZFEvSVMwRldTLzV6?=
 =?utf-8?B?aHhlcHpSUC9WMCtYMGNHRGFUbjJjMGoyYUNrYjRodlNYblhnSktGenEySFRy?=
 =?utf-8?B?Mkhha2lJRGQzMVYwQ3VCWlpZTngwRWRKQjNDczNjQTkxdlhxRTNIYVMwM0xo?=
 =?utf-8?B?aHYrOXA3OXNEVmpGU1V2SHIzelZLRTZWbjFsUDRuaGtWL1RQcjI0bzRPWmVV?=
 =?utf-8?B?RW40ZzJ3Myt2U09nMlVpaE1oeE5scS9BRTZicnhmeHAzSnNiMnpnK0RjdnNM?=
 =?utf-8?B?dkJGMzl0Lzkzc2M5MFppYzJNZ3k0bm5LU01hUUNndlhubmEwdVVYMG1pYkZL?=
 =?utf-8?B?RHFZK2FseGoxL2JIem40M0RDQkh6dkU0ejdIdUQwdURCcm5qcjlDN2d1ZVht?=
 =?utf-8?B?bWo0MXk0dk00RWlVK1lxVDUySS9scXJ4MHc3TG90bDdJcFhYaG02d0twU2Ix?=
 =?utf-8?B?d0tWWkJVUVcyQ2FNWXFwSEs5OEY2dkhqRE0xUzdIUG5VVTc3Q3JDdkIveXYr?=
 =?utf-8?B?akE3VU4vRlkvdzlNSDFWRkM0MnoyeDd0Zk1tMHBOK09FV0ZQVXVGU0tSMERi?=
 =?utf-8?B?MEs2QUMwOTArL1QzcU1kbnBvdDFubUIzRHc0OXhXcWx5RTFVSklMeEFySng5?=
 =?utf-8?B?aHo4ZzdmcXpma3NlOGwvQW8ralZ2b0diZWxFSE9DUHhiNGJSaTladHZYRkVk?=
 =?utf-8?Q?Jr1WjGfqd70=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmNUMGVOOS93Zi92V2hDYlFVQ0ZpQ0FBekFWeHJiODYzZU9ROVlMNFM2Tnhk?=
 =?utf-8?B?ZHdBSmpPVjhaZzEra1VQOGx6TmxxMHRZTXFEWFJqazEyUC8ybDd2ZjlXZVZa?=
 =?utf-8?B?ODhiYndkNjRxTmpaUzJGNWhZenNFZnI3WlFCb2diMFYwU1M2OXBOdkFHOU5L?=
 =?utf-8?B?Y2xOazNzR28yUk0xOFlTMGhUeTNwQUJkYWg3ZG1HRVlOamlGVW5DcEN2aDR4?=
 =?utf-8?B?dFZ6aVVpeWtySGtkbG41bDRsNXh3OGdQV1ptYThFRVgvSXFoUnJvcWk4MmJn?=
 =?utf-8?B?ZSsyc3p6QkFlL0FOWHR6OCt0b2tjZGxNZFo3cC90bHNIV2tKYitjbThYSEdF?=
 =?utf-8?B?OUlkRlRlSlV0SWp5MUVla2tLc2tvZGJ1SDVtV3JrUHM3b2RqRDUwN1hnZmZQ?=
 =?utf-8?B?YWgxNFpBbkJNNlFkSzhxbjhvaHpDa2VCeW43elJqOWVUMUJGbTN5NTdrZTBj?=
 =?utf-8?B?R1EzMUJaTEJlMGgwOWcyV0RwejBPTEV2V3BUcE9KWWM4Wi83MFU3R2svQTlr?=
 =?utf-8?B?ZlRJVG5YVGI3N3U0SGVzYU5ueEhWREVYUllTMXNIcnM4NkxQUHNIdi9TaHZn?=
 =?utf-8?B?eVJDcHhOa3d3SjlJelJTM2JjTkM4UTJieHhWYlRpelpYeEt4d3R1SytNV1Fq?=
 =?utf-8?B?YUhvN3h6WW51SkJMaHFnbCt6enpxUzVCTWo1Y1kxNXJOSUJNcnJBc3UvQm5u?=
 =?utf-8?B?cmxoZG8zSVRyS0JRNDMyVDlnaUFvR3VEcms1VUY4SFEwalNvWU5SRGdKbGZN?=
 =?utf-8?B?amVGWEVncE16MU8yMzc2cWtFdnZobWhVK2JpcU45SFFYM2R5b0Q3WHNvNjli?=
 =?utf-8?B?dm5VUVFueWNGVC91VnF3Z1pqU3AzZmpvcUFXTmg3Y1pJKzhybkgwVTJwbndj?=
 =?utf-8?B?VVhEbXpEcnRyYUNSM3l0R01OOGYwem1NQlc2bERiN0J0YnBWMDRWRjdDeXdQ?=
 =?utf-8?B?bEp0aGRtRkRZMjBhVHF6Sk9RUVJIVWptaEhxbDBya1h5VVlub2FkMFNhbXB2?=
 =?utf-8?B?MzU2TzJERHZPRFFNZ05jTllLczFZQ2xLQlVEeU5LRkFtWEtaNExJVWthTS9l?=
 =?utf-8?B?d3hvYU1wd0pWZUlaZU1Yck5IbGtMTklHczVFZWZYbFFzMFBJK3lqSXNzdUdj?=
 =?utf-8?B?b2o0SnFTTW5MYzBYZEZIU3kvS25OY3ZGYU9MWDFrTTQza042UXNJaVdMZGUv?=
 =?utf-8?B?dlYxcGlJUzdQR3hPaEE3YmhyeHlMSnpPS2Z6aThiSTVOR1UvUkhrK3QzQVI2?=
 =?utf-8?B?SERuNi9lOGtodEY2MnB5KzdVelZDQW1YVG5QTGNKQXdlMzRyL3o0RDlMUXNv?=
 =?utf-8?B?Z1RONHNMVmtCVzYzYWVQeUFWMy9pYlF3UCs5MXVoN3ZQUkdTNUV3YnZtWjhv?=
 =?utf-8?B?dm5sQ240OURxWU1vbUhvdlpzV2tXUzBDUkR4ajdZNDNlbmxKZmpQSkpvN1ht?=
 =?utf-8?B?bXBSUThEMUp6SUgreGhJNExiS0RMdStiQ0ZmUVpsUi9WU3FVeFA5eFZCOEQ5?=
 =?utf-8?B?dEtjWkZrTWNtRkMxVUQ0NEhQUk5RTzVDMlI1ZUJZQkJUS3p6SEV0RE5jNjZX?=
 =?utf-8?B?VHRsWDBpWktjUGVrOVh3eEJva2Nwd0J2Wkd2Q2U1cVlqMURrS1FqMW40SERy?=
 =?utf-8?B?QWFQaDRackJMcjVoV1BKUTJCT3dTUEw3OWE2dG9jL3AwN0FwM0o2cDBKV1J4?=
 =?utf-8?B?UGU0dHR6b1NYYlVRcWM2L0NRTm1CRjZzd2NzSXhLS0pBdFRXeVI1WkFlT01l?=
 =?utf-8?B?Vk9NTFhnanIyMUJaSURnbHJOenB4b1djNmVuMlVDSVpVVUNwS3NiVVdtdWdU?=
 =?utf-8?B?MWQ5QjdBYzBtZGFsaXM3OEwwODJ4VE1FeW5WM25YL0tRVDh3bU1WWkRWMFFm?=
 =?utf-8?B?cE1QTko3MWdNWnJSajBTbHZ1ck5vUnROTW93dXpJbU90QXY2c2RuUjIrT0Vi?=
 =?utf-8?B?YkJ6TElNeDdjdGE5SHM3S1NuK2xieDZwZ3pnM2p5NlVFbm5SWFUxbWJxWDNy?=
 =?utf-8?B?M1JVbjF5ODdFMGdmbjNlQnkrVFNLbEs2WE5wRVZiYVQvOWNpYmFONUFOY1M1?=
 =?utf-8?B?V1k3SnYreUtvNTZmTHVHeFJCK2lMT3Bnb3cwcVlWSit2U2VaN3p2VGxPYXZN?=
 =?utf-8?B?Nmx1SGZEYTVwMk9Bb2RYQlBsZzFLeUhOOThyOXJ0UnNBRjdzU0FXQkpQY1hw?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 616a9264-8b83-4e98-dd24-08ddbe4d9221
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:30:53.1445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btjUCt+WWa2mxk4bPWbsOBiAOcb1hE1YoJxpkyVBck/cGwEjwZ2uuh4lzEPa5e3KuyYpt8f8CuR+Sq3al1lvfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8664
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

On Tue, Jul 08, 2025 at 02:38:50PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 08.07.2025 11:01, Tejas Upadhyay wrote:
> > Skipping TLB invalidations on VF causing unrecoverable
> > faults. 
> 
> oops, my decision to drop it on VF was biased by this old comment:
> 
> 	/* XXX: Do we need this? Leaving for now. */

Also my opps, I was always confused how this worked on VFs and never
follow up on it.

> 
> > Probable reason for skipping TLB invalidations
> > on SRIOV could be lack of support for instruction
> > MI_FLUSH_DW_STORE_INDEX. 
> 
> true, this variant using GGTT is not supported on VFs
> 
> > Add back TLB flush with some
> > additional handling.
> > 
> > Helps in resolving,
> > [  704.913454] xe 0000:00:02.1: [drm:pf_queue_work_func [xe]]
> >                 ASID: 0
> >                 VFID: 0
> >                 PDATA: 0x0d92
> >                 Faulted Address: 0x0000000002fa0000
> >                 FaultType: 0
> >                 AccessType: 1
> >                 FaultLevel: 0
> >                 EngineClass: 3 bcs
> >                 EngineInstance: 8
> > [  704.913551] xe 0000:00:02.1: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -22
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Fixes: 97515d0b3ed92 ("drm/xe/vf: Don't emit access to Global HWSP if VF")
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ring_ops.c | 22 ++++++++++------------
> >  1 file changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index bc1689db4cd7..ee0fa208e2f8 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -110,13 +110,14 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
> >  	return i;
> >  }
> >  
> > -static int emit_flush_invalidate(u32 *dw, int i)
> > +static int emit_flush_invalidate(u32 addr, u32 val, u32 *dw, int i)
> 
> this helper is only used once and it looks almost exactly as another
> open coded sequence at the caller - emit_migration_job_gen12(), so maybe
> move this code there as-as?
> 
> >  {
> >  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > -		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
> > -	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
> > -	dw[i++] = 0;
> > +		  MI_FLUSH_IMM_DW;
> > +
> > +	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
> >  	dw[i++] = 0;
> > +	dw[i++] = val;
> >  
> >  	return i;
> >  }
> > @@ -398,22 +399,19 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
> >  				     struct xe_lrc *lrc, u32 seqno)
> >  {
> >  	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> > +	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
> 
> please keep definitions in rev-xmas-tree order
> 
> >  
> >  	i = emit_copy_timestamp(lrc, dw, i);
> >  
> > -	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> > -				seqno, dw, i);
> > +	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> >  
> >  	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
> >  
> >  	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
> >  
> > -	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
> > -		/* XXX: Do we need this? Leaving for now. */
> > -		dw[i++] = preparser_disable(true);
> > -		i = emit_flush_invalidate(dw, i);
> > -		dw[i++] = preparser_disable(false);
> > -	}
> > +	dw[i++] = preparser_disable(true);
> > +	i = emit_flush_invalidate(saddr, seqno, dw, i);
> 
> hmm, but seqno is already stored by the above emit_store_imm_ggtt(), so
> maybe to fulfill MI_INVALIDATE_TLB requirement instead of post-sync
> IMM(1) use post-sync TIMESTAMP(3)?
> 

I'm not following this suggestion, Michal. Storing the same value twice
is harmless, and the first store is needed without an invalidate. The
second store (the store itself isn’t needed, but the invalidate is)
needs to be placed between two BBs.

Nits aside, patch looks correct to me and inclined to RB.

Matt

> > +	dw[i++] = preparser_disable(false);
> >  
> >  	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
> >  
> 
