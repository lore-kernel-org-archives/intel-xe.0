Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5DBD10F39
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 13:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667010E5F9;
	Wed, 26 Nov 2025 13:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZWuybjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B42910E5F3;
 Wed, 26 Nov 2025 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764162924; x=1795698924;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RCWhFMYc3mC3ORkv0Drk5zedBlX3pEC+vHuD9lZErkw=;
 b=SZWuybjNnExs7n0lI1AjuS0wfvzXRBemxwOWo2kKCntbwX85teN3GMk/
 k8tX53nKUMOCBHvkSjE2s//jpSDJeuIU5DUL/nVGWV1RTQubTJierLrXz
 wuzWBTNyb5EK2U/Nt6HS0I2bFDCqLM47sswPb5juYHs/9l0ctmsNt9+JS
 J8r9ERSuywW58kBy7uEmT1CD0paAZrz8ugxX3qkH6Fj2Sz5H2grHDyNLP
 52dY3xlZ2k0j3B96kwJUwlTdASp9WhtwM2NjhYXIbA+S3PNLHlQ00BF3c
 7/cv+lvuB0qBqY3KlBe0JPQotQSMYK/dIws14yXKGYTixGO9/tuciacrx A==;
X-CSE-ConnectionGUID: OG9g/bAZSb+bQJAfxTCECA==
X-CSE-MsgGUID: QgSWckSYQ4ubfIIgty//mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66275579"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66275579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 05:15:23 -0800
X-CSE-ConnectionGUID: 99IvvnFeQHG1BhB4QG+PuQ==
X-CSE-MsgGUID: AN32NPV+TCefvY30o5vTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="230193816"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 05:15:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 05:15:21 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 05:15:21 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 05:15:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl5D4YRCySP1cXcTQiwlkzr8Ovt8UGt8RZlwTIK67EoIFA8GCqvBxx8T9KDdf2Yb1E25TsZQ2/Mb7UX4MWmMEgVK5p80oNL9OnTUHMBr1CmYsGJqLi5JtjYHD9/8pv/jG+0bdYBUNqSpqp+Qfcs/oIlDX9A74P5MjLsn3hBXBD346NcM9R1DpZBCt3TL1nN/vByskqDJonE1llJv4rFjpqWEIYnFL+UPFce7gG/Ioj9ImJdhJHUrPZFpPjwBs65mMJ0UNeL7nrQxftThh9r7Qjopt4WHnka4BJ7u+3A2m9sd14f3Kr7w3gAuuMhKWcBiQKslVOa7KW+3p+5YsU/Lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRsM/afaA4wcCugCLoE7jAR0aMJ1dfczxCjd+6Q6Im4=;
 b=T7SBXV9HtxmzqEVWk6EW0GDpD1ghY95bDGr5Lfc0bNfZGhymTT5knyTUwiMTIlNgqkFsk10n7YLpULGHHUqOKYJKsXWueut5cpuaGocUXoPyz9HU2ndJwJ8SGE4jLEsDgZDSzityTnY4PHL42KsQsZKx+vuTNUtIanVB/ImipzElncFAr86ZAOab+ZS/zHgYZJ/GTs7a5EaoMOmQQ6vXz//GYKwxcqqyyjI/fTKJdqCNRcssi2VMqL0dbiakoVoasSrT0rP4i3kV0xZSFK2ifng2/cg1GaxDUWlYADDIHCeY0CE42UT2NxcFu96v60982fK6HL8phcyMhBECEDiIDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS4PPF267298081.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 13:15:19 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 13:15:19 +0000
Message-ID: <0fbdc7a2-67b1-40bd-9dbb-f8b1e44f03c0@intel.com>
Date: Wed, 26 Nov 2025 14:15:14 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe=5Ffi?=
 =?UTF-8?Q?le=3A_change_pid_type_from_pid=5Ft_to_pid_pointer?=
To: <intel-xe@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20251125-change_pid_t_to_ppid-v1-1-6ddd817a953e@intel.com>
 <176410753955.27455.15676483871278941260@a3b018990fe9>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176410753955.27455.15676483871278941260@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0264.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::31) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS4PPF267298081:EE_
X-MS-Office365-Filtering-Correlation-Id: 3112735a-061f-4e5b-da79-08de2cedd8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGdDSUg3OFh3YXZ4bEQ0WGtWS1IxdGxUbC83SEdySC9hRjJJVUM2V3RFbGxl?=
 =?utf-8?B?K0RYRFpTa01wWm5WYjlmV2lLdmxPc3U4SWo1L0thQ2Njam9VVkdlM0tYVkJF?=
 =?utf-8?B?WFNGWVB0ZHFrMEVkVmhKSVFtSmRYcmF2U1A5eW9XV3dKWU1hZk5zRTB6M3dw?=
 =?utf-8?B?WGZJTVBCeTFHNnZteGlORmRpTGlrc3FNNklmTFh1K2dmMXdxZDZCY2V5OG1H?=
 =?utf-8?B?c3AvblZYSWJDaFhLRS8vT25xMk1RUk5xejc5UWlPa3FqWGFWRXcxaDA0UmVH?=
 =?utf-8?B?RVNsZnRIUkxRKzRWdk9sSFAyaDJ4WXZTUXFlZnUvemRseFFtT0xpWFdXMFRO?=
 =?utf-8?B?VFpEWWpjMG1YQkhSWDkyREljbk5pNzdLZTk1dnJyZWNzS0hNZ0Y4bno3QTdM?=
 =?utf-8?B?RnY4Ly9SM3ZQUTU2bElJYm1TYmwrbDlIZCtWKzJiT0p6bDIrVmFtRytmb3or?=
 =?utf-8?B?MnJQNjgwV2J3Zkw0a1RiTERyZWRaSm1reWNEVG9NbCtGK3psNnVZeWRUMit2?=
 =?utf-8?B?OU1BcC85S1lZcnhLcFNsOWg4T0g0eEhZNmhycFFwL3Roa3Nha1o2ZGZldUUw?=
 =?utf-8?B?ZU4vZHk3eGhNRnFvcC8zd2c0enhNZ3pXTEhwRFBNV0dpZ0tnR084a0IvNHBU?=
 =?utf-8?B?c0ZzQUhENnc5QnBCNERxR3RWTUhQdEdSb1NxMG8rNGp3VlhEcWpuV0xlTlQ1?=
 =?utf-8?B?ZVQrbVE0aEhYSlFvQmxUN2pWWUFlcTV6U0NSZTk0dm5qOGozNm4vRWZUOHpq?=
 =?utf-8?B?RkQ2bXFBMGZKTXBZSDRlRnlWVWE5dkEwdGRXbkdwTFREOEhwam5QQmh1R3FU?=
 =?utf-8?B?aVBkM3V2OG9XblhVc3U4c1pJNW1NS0xOMnNVUGVNcVFKUkpLVUMvNVdLbDRu?=
 =?utf-8?B?RzdSd2dnNElLdDMrSzJUakx2WS9uZndZc1RrZG11UlVEdE1TMGF3RzBPbThM?=
 =?utf-8?B?ZVBYSXEzd0ludVBsWDYvMUFsNEJWQWVjdFVpbzFaUjFHZndBM2lNT214RTAx?=
 =?utf-8?B?a3dmcWx3UGdubkU2ZU0zMlh2RnVGU2ROWXYvakFOMHFxNWJrSG5QM20rVjNX?=
 =?utf-8?B?UVVLTjhxWVdQYmdiTUdLWm1VbTk0QXlXSnlhcjlxS0gzdFN1MytRSTFmZTBR?=
 =?utf-8?B?YXJZamE3NUluTVBMRlNmMDhQblJlZUpJcXBEUy9PbkpvbXpGRVhBc3FpNEtH?=
 =?utf-8?B?OHJZa25RVTRwR3JVVXJFT3MxZUNCSk1DR2kvTEppRzFPR3gzNWJWMU9nRWE2?=
 =?utf-8?B?dTd0dlBsUlJkdjRGWTVJOXl0VENTbkhLcWc3TG1JS1pRbUpSMlRhM2NjOTFV?=
 =?utf-8?B?dnNoNk9NcjJ1bDRRbjVWZVd1TXBBWFFBNUNEUllQK3VEU3dtTVM5Ymx2VTNa?=
 =?utf-8?B?UEdWVWd6V0hNM0pnZFFzcFRsUnBLZWU2Zjl6Q3lIeFE0eEZ3NjlwdUlmTGVw?=
 =?utf-8?B?b2dvcGZZTkZlQlBhNDVKUGdxZ3N5WkNlK1hnVVpnb0dJNzBPRFpCcW1NRU1I?=
 =?utf-8?B?Q2wrTGlCb2txQWorTys3N09UdVdoSTEyY3RidkYvRVhlazlvb2w0eWozalFL?=
 =?utf-8?B?SkVSeXRHOUc2V3F1VkNCMTRXSjNMODc5emZhUmI2TytWRkhjcDNzOUFselEz?=
 =?utf-8?B?eFRDREZnYWZyU2VjYXRobHlPKzBxQ3pkdVBYUWJ5d2JhYjBrd1liYU8rR005?=
 =?utf-8?B?MzRBQUdVSC9YSWdESTliQWZxQVhGeFBIMmF3aUFrWGhRMW5RK21zclc0TW9a?=
 =?utf-8?B?YXg2d2ovMnNnVDRhbkkzRGFjeHdSRldJK1lQRUZoRzVkdWd0V1NxT1JyQ1gv?=
 =?utf-8?B?eExiNXJHWWUrWmV4THplaitpMzNibnQzSk1KektNMjJPSEQvQUo4bnh6Uzh2?=
 =?utf-8?B?ZWpLK2FQdEZIVkk0TWppaXJ1RHhnWWJicTY0SnptODdxYlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGtFQ3ErQmM5d0EwUTFQQkFNeE5OREJGZDFZeXh2blVnbVJpL0Y4MVVOOE03?=
 =?utf-8?B?RDlPVmRtdllJdEg0TVhmeWl1OVhKZVdOQmgyYkJ1TnFITVB6N0FKbHNCcndt?=
 =?utf-8?B?LzhjU2NRK2hEbEtVWnhSbTNiUDlrQndBWjdtMm55ckMyNVIvSmwzYW9BbW9P?=
 =?utf-8?B?bE56SW0rbzYvN2Yrd2Jqem50L0dJVWdWSzE0Z2FRMUwzbDV6dDQ4cDZvYldx?=
 =?utf-8?B?SzhML2Q0bXFsSXZxTm9DM0tZUXQvYnNzVWxBTEZqSnlyaUcybWpiNUFIRUZh?=
 =?utf-8?B?MlQ0ZlZzdWlIWU9tdFY0QXMwcFpKWEFycHdxK096aE9HUzJhWnZpanRxTnIy?=
 =?utf-8?B?N2NJQ3B2MGhnMGtFYmJlamFzSWtDazRENnhxVGUvSDMzeTd5SFozUU11UE9Q?=
 =?utf-8?B?dFdZa1IzRUROSS9IY0NqNzUyMzdMdUNoR2FaKzYrOXplWXA4WmZtU0JmMEMw?=
 =?utf-8?B?bjV2OEI2QUszaEJhNWVUb3N2Szdpc00ydzB2eHd4WmJ4NXJnU2NBdS9YemxP?=
 =?utf-8?B?cXI5bDlwL0R4OWUxQjA5RTR1S0JGb2prejN1WUlWWDM4Mm9ZQjl2TUxZbXRV?=
 =?utf-8?B?M2h2N09aRzFGYThXaW1sSHlTWGE5MzN2SW9RSjJBV0VDTEZ0RmM4T0xZQU42?=
 =?utf-8?B?N0Q5U0padVM5VWh2anlaVDQyQ2VUblgxbEhvSkdLTFFiZ24zV04yR2MydFpI?=
 =?utf-8?B?bDF1RnUwclppaW1VZnRWZ2ErZlZyS1NmNjFMR2hNeWtPQmtOV0cxSVFYd2hP?=
 =?utf-8?B?VjYxZm9nMmJqRytkRFRMS0o0dmlXdlZJaVB3eURZSUNBMFlGazQ0b09TZTJ0?=
 =?utf-8?B?Q2h1RDU2V2xCZThSSWozcGFaRzlzUWxCR0NKL3dFcjZEZ1JrOXR0ejh6dFE1?=
 =?utf-8?B?NVZkRm1sd2hnTFN0dUEwVytxeThmVXVCWWxwblNhN0E1blNXYUtqaGdiekNI?=
 =?utf-8?B?QUpRTHlEZFhzU1NOWFdpc2V3U0J6VmNRWTcxR05RZklrenRueDd0YmFxY2l1?=
 =?utf-8?B?MmRIcnhzZUlwQTFxUm4wdG0vMXZaamN3U2g5V2FuOU9mTkczUENyUG1mc25N?=
 =?utf-8?B?TStVTGhFdExDWkdWT0tpU1N4MVFIRVhMbHR4T3BRdHpKK3QzWE9KNjBWTkpX?=
 =?utf-8?B?VTMyUXF3czlxdHo3dlozZmhEelpqNnRmaHZaL2RveUxDbUE4d2cxWk9mVHBI?=
 =?utf-8?B?TlBncWJibFlMUXVuYzJCSk1tb3JjSzd2cXVRaWdCcU1oeVVMWTBoYkxuV2pi?=
 =?utf-8?B?VnRRNUtyanoySnRFOFpGM1d5cTVReVl2NXFVcUU0UnF0bHpMREFIUklvbmlM?=
 =?utf-8?B?NnpEQ1dCUUc1Z3JZNFY4eGY2cDcrUWs2MjFyVWRiS2M5N1I3M0NTVS9pM3Rj?=
 =?utf-8?B?MkJUQVVmNHllTTN2MmpHWXUxNlVWWGJSOHNYa282K212eWlvNTBRSHRtanhz?=
 =?utf-8?B?RDd5bGV0RDlmeWtCMU9nT2FWZDk5SjBLTDlvcEY4OW9nbVVyL2RvMGpBZ0dk?=
 =?utf-8?B?NFBDZGF1VjhFQUk0UDVVdWVtT1FWZEpXQm1KVnUvMHExeTJ5V0NXMnVaRlk3?=
 =?utf-8?B?d3NLb1ZjYXVPU3EzOW5xcXVJSmJlenR1TmNUaUFPcVdZbktXWjc5cFpDd09s?=
 =?utf-8?B?NGdWbzd2NmM0eW8yOGRwNWp3MkRoOGtSc21uOStzcTBMMnZFWVJIMzgwSUda?=
 =?utf-8?B?VmdXNkU2MlkzVjZrT1huSmZTSlFEUldla29rV0MreHJCdmkyQXhRSWxVR3J4?=
 =?utf-8?B?VERGeXhlTXcyeXBsMlJYcUtob0ttSmZnS2dGL3o1WXo5QmRvcnc2U1dKWEhr?=
 =?utf-8?B?SlBOaDFxeDJHOVlMVHpldzNrZkdKV3VRYXF0N1doSkd3eXlOOHR1UjNlVjlC?=
 =?utf-8?B?TENIamNaTldoMzh0SUcwYktnQlFmdDRXNFdMTEd0cUJnMVlvR2gySzJNWmJO?=
 =?utf-8?B?ZmlCUFRySkZXTStsYzJQRWU2MnRocEdPZnljdTljdzhnYkVFMkVXRmIzVUFp?=
 =?utf-8?B?aUFzU04xYzFzL3JDYm11V1lBODJNZUd5blJiMDJRaXBmZm5lOG1ac0pmZk9B?=
 =?utf-8?B?RmpueXhnTWkrd28wR1F0QjY3dWVDMXZMT0JzSVI5ejJEbE5sUXJCODBiWkR5?=
 =?utf-8?Q?oRXzFNCxBGxl/KcHIuercMLtT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3112735a-061f-4e5b-da79-08de2cedd8b1
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:15:19.0963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38jhH6EwkziQCe6DzyXHkt6zDxnaQssOcxasqJO9us7liFZtKQy4bPN5I8gqPKiSWcqnJsBHSlYcsE7kAx8quA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF267298081
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

W dniu 25.11.2025 o 22:52, Patchwork pisze:
> *Patch Details*
> *Series:*	drm/xe/xe_file: change pid type from pid_t to pid pointer
> *URL:*	https://patchwork.freedesktop.org/series/158028/ <https:// 
> patchwork.freedesktop.org/series/158028/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362_FULL -> xe-
>   pw-158028v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-158028v1_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-158028v1_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-158028v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_hdr@bpc-switch-dpms.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-bmg-1/
>         igt@kms_hdr@bpc-switch-dpms.html>
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-1/igt@kms_hdr@bpc-switch-
>         dpms@pipe-a-dp-2.html>
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-adlp-3/
>         igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html>
> 

Unrelated to the patch.

Regards
Andrzej

> 
>     Known issues
> 
> Here are the changes found in xe-pw-158028v1_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@kms_addfb_basic@addfb25-
>         y-tiled-small-legacy.html> (Intel XE#2233 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2233>)
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_big_fb@x-
>         tiled-32bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_big_fb@y-
>         tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@kms_big_fb@yf-
>         tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@kms_big_fb@yf-
>         tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-
>         max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@kms_bw@linear-
>         tiling-1-displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_ccs@bad-
>         rotation-90-4-tiled-dg2-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_ccs@bad-
>         rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@kms_ccs@bad-
>         rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +9 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-
>         dp-4.html> (Intel XE#3862 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3862>)
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@kms_ccs@missing-
>         ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@kms_ccs@missing-
>         ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +1 other test skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@kms_cdclk@mode-
>         transition-all-outputs.html> (Intel XE#4418 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>   *
> 
>     igt@kms_chamelium_audio@dp-audio-edid:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_chamelium_audio@dp-
>         audio-edid.html> (Intel XE#373 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@kms_chamelium_edid@hdmi-
>         edid-change-during-suspend.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_content_protection@content-type-change.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-8/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>)
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-
>         ioctl.html> (Intel XE#1508 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1508>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-4/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-bmg-6/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>)
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-7/
>         igt@kms_dp_aux_dev.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_dp_aux_dev.html> (Intel XE#3009 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3009>)
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_flip@2x-absolute-
>         wf_vblank-interruptible.html> (Intel XE#310 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-
>         panning-interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-4/
>         igt@kms_flip@2x-flip-vs-panning-vs-hang.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-panning-vs-hang.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +4
>         other tests skip
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-lnl-4/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-158028v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@a-edp1.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@kms_flip@flip-vs-
>         suspend-interruptible.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +1 other test
>         abort
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-adlp-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543> / Intel
>         XE#4921 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4921>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-adlp-3/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-
>         y.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-158028v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-
>         tiling@pipe-c-hdmi-a-1-x-to-y.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-adlp-3/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-
>         x.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-158028v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-
>         tiling@pipe-d-hdmi-a-1-y-to-x.html> (Intel XE#1874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-
>         render.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/6312>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (Intel XE#1151
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html> (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4
>         other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +2 other tests skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925> /
>         Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/346>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_joiner@invalid-
>         modeset-force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-3/
>         igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html>
>         (Intel XE#6675 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6675>) +1 other test abort
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@kms_psr2_sf@fbc-
>         pr-overlay-plane-move-continuous-exceed-fully-sf.html> (Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#1489 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1489>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-exceed-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-page-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@kms_psr@fbc-psr2-
>         primary-page-flip.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850>) +1 other test skip
>   *
> 
>     igt@kms_psr@pr-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@kms_psr@pr-
>         suspend.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1
>         other test skip
>   *
> 
>     igt@kms_psr@psr-primary-page-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@kms_psr@psr-primary-
>         page-flip.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/
>         igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_sharpness_filter@filter-toggle:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_sharpness_filter@filter-toggle.html> (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-dg2-466/
>         igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-
>         a-6.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-158028v1/shard-dg2-464/igt@kms_vblank@ts-continuation-
>         dpms-suspend@pipe-a-hdmi-a-6.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@kms_vrr@flip-suspend@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-lnl-8/
>         igt@kms_vrr@flip-suspend@pipe-a-edp-1.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-lnl-5/
>         igt@kms_vrr@flip-suspend@pipe-a-edp-1.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +2
>         other tests abort
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2849>)
>   *
> 
>     igt@xe_ccs@ctrl-surf-copy:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@xe_ccs@ctrl-surf-
>         copy.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/455> / Intel XE#488 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/488> / Intel XE#5607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many-vram:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@xe_compute_preempt@compute-preempt-many-vram.html> (Intel
>         XE#6360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360>)
>   *
> 
>     igt@xe_eudebug@basic-read-event:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@xe_eudebug@basic-
>         read-event.html> (Intel XE#4837 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4837>) +2 other tests skip
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@xe_evict@evict-large-
>         multi-vm-cm.html> (Intel XE#261 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/261>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-race-prefetch:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-race-prefetch.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288> / Intel XE#5561
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561>) +1
>         other test skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +4 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@xe_exec_mix_modes@exec-
>         simple-batch-store-dma-fence.html> (Intel XE#2360 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel
>         XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/
>         igt@xe_exec_system_allocator@process-many-large-mmap-file-
>         mlock.html> (Intel XE#4915 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4915>) +18 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-mmap-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@xe_exec_system_allocator@threads-many-mmap-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +2 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-stride-mmap-shared:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@xe_exec_system_allocator@threads-many-stride-mmap-
>         shared.html> (Intel XE#4915 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4915>) +66 other tests skip
>   *
> 
>     igt@xe_module_load@force-load:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@xe_module_load@force-load.html> (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_oa@polling-small-buf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@xe_oa@polling-
>         small-buf.html> (Intel XE#3573 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3573>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-prefetch:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-adlp-3/
>         igt@xe_pm@s2idle-vm-bind-prefetch.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-adlp-4/
>         igt@xe_pm@s2idle-vm-bind-prefetch.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#6675 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-90@engine-
>     drm_xe_engine_class_video_decode0:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-lnl-7/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_video_decode0.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-lnl-8/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_video_decode0.html> (Intel XE#6251 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6251>)
>   *
> 
>     igt@xe_pmu@engine-activity-suspend:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-adlp-3/
>         igt@xe_pmu@engine-activity-suspend.html> -> ABORT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-adlp-1/
>         igt@xe_pmu@engine-activity-suspend.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) +3
>         other tests abort
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-
>         exec-post-termination-irq.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-query:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@xe_query@multigpu-query-
>         invalid-query.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-oa-units:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-2/igt@xe_query@multigpu-
>         query-oa-units.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/
>         igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_sriov_vram@vf-access-after-resize-down:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-dg2-463/igt@xe_sriov_vram@vf-
>         access-after-resize-down.html> (Intel XE#6318 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6318>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-158028v1/shard-bmg-1/igt@kms_cursor_legacy@2x-long-
>         flip-vs-cursor-atomic.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-panning.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-
>         bmg-1/igt@kms_flip@2x-flip-vs-panning.html>
>   *
> 
>     igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-
>         adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-158028v1/shard-adlp-3/igt@kms_flip@basic-flip-vs-
>         dpms@c-hdmi-a1.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-lnl-4/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-158028v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@b-edp1.html>
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-
>         adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-
>         to-y.html> (Intel XE#4543 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4543>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-adlp-4/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html>
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-adlp-3/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-
>         y.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-adlp-4/igt@kms_flip_tiling@flip-
>         change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>   *
> 
>     igt@testdisplay:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-7/
>         igt@testdisplay.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/igt@testdisplay.html>
>   *
> 
>     igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
> 
>       o shard-bmg: WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         (Intel XE#5786 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5786>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-158028v1/shard-bmg-1/igt@xe_exec_system_allocator@many-
>         stride-malloc-prefetch.html>
>   *
> 
>     igt@xe_exec_system_allocator@once-large-malloc-race-nomemset:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@xe_exec_system_allocator@once-large-malloc-race-
>         nomemset.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-158028v1/shard-bmg-1/igt@xe_exec_system_allocator@once-
>         large-malloc-race-nomemset.html> +4 other tests pass
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-adlp-2/
>         igt@xe_pm@s2idle-vm-bind-unbind-all.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/
>         shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html> +2 other
>         tests pass
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-8/
>         igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-
>         bmg-2/igt@xe_pm@s3-vm-bind-unbind-all.html>
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-
>         dg2-432/igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#6675
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/
>         shard-dg2-463/igt@xe_pm@s4-vm-bind-userptr.html>
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-lnl-7/
>         igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_copy0.html> (Intel XE#6251 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-
>         lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-
>         drm_xe_engine_class_copy0.html>
>   *
> 
>     igt@xe_pmu@gt-frequency:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-dg2-432/
>         igt@xe_pmu@gt-frequency.html> (Intel XE#4819 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4819>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-
>         dg2-463/igt@xe_pmu@gt-frequency.html> +1 other test pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-adlp-6/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-
>         a-1.html> (Intel XE#6675 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6675>) -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-adlp-9/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-
>         a-1.html> (Intel XE#4543 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4543>)
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-
>         adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-
>         hdmi-a-1.html> (Intel XE#4543 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4543>) -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-adlp-9/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-
>         a-1.html> (Intel XE#6675 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6675>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-
>         flip.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-158028v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-
>         stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/
>         shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-
>         ccs.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2887>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-8/
>         igt@kms_content_protection@lic-type-0.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/
>         shard-bmg-2/igt@kms_content_protection@lic-type-0.html> (Intel
>         XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-1/
>         igt@kms_cursor_legacy@flip-vs-cursor-legacy.html> (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/
>         shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#5299 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5299>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-158028v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2312>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-158028v1/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-158028v1/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-
>         plane-move-continuous-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-dg2-463/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/362>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-158028v1/shard-dg2-436/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#1500 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-
>     new-huge-nomemset:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-
>         mmap-new-huge-nomemset.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-bmg-1/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-
>         mmap-new-huge-nomemset.html> (Intel XE#4943 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-adlp-2/
>         igt@xe_pm@s2idle-basic.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>) -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-
>         adlp-8/igt@xe_pm@s2idle-basic.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#6675 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
>   *
> 
>     igt@xe_pm@s3-d3hot-basic-exec:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362/shard-bmg-2/
>         igt@xe_pm@s3-d3hot-basic-exec.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-158028v1/shard-bmg-1/igt@xe_pm@s3-
>         d3hot-basic-exec.html> (Intel XE#6675 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6675>)
> 
> 
>     Build changes
> 
>   * Linux: xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362 -> xe-
>     pw-158028v1
> 
> IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362: 
> 0a21e96e0b6840d2a4e0b45a957679eeddeb4362
> xe-pw-158028v1: 158028v1
> 

