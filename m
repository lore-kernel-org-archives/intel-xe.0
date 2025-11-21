Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA3BCFC50F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 22:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFF410E912;
	Fri, 21 Nov 2025 22:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOHjaQl+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B4510E912
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763765847; x=1795301847;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IAG+opbuLCukRy5dII+IzRxMGdeVD4PlSrJ/dgQWgHA=;
 b=OOHjaQl+MJvKpKmhGxhBIvTHhcI7Qc3dUeVO8BY1u3K9G1GtX4K1DeWZ
 YSKsB7OZVMBtrR5Awth3tH0cCodLzy502NBo2rVYA7STg1Ko0jXFz1hS2
 b7uJGoh6vGDES/A76O8r2ELanoqU4HgiMqDvNhiySKxNljmBVB9w5HwyY
 QLM8S9zw/Ao2uTIycz1TqtQv+giZNlcmMVvTksRNrLjOoqGVZctbayEB7
 bJnhH3Ey8vXwkOjOzWpJvuNVqwvp3lJ0ouB58EPzyMmvopFpbI7tkldNz
 VUsJDIlFDS4kTB1QKKqCseLBr/a2DLA0U1vg7pJjSlMAUTofLM4pZldD3 Q==;
X-CSE-ConnectionGUID: ENpIQDGmQdOHWD8J2cQmPA==
X-CSE-MsgGUID: pfsgea+vS/2zRdWDr2Sgsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65802779"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65802779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:57:26 -0800
X-CSE-ConnectionGUID: WG6PNpTMRkqo/meKGPUluw==
X-CSE-MsgGUID: b3wciCrrSG2YddQG6OievQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192585808"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:57:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:57:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 14:57:25 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:57:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl51EWCA1XYZXpSms2uBBaiv/O7b6XtKN5u+sGdbv6lb+8jFaGHOkO31ZbOXGPjoilfYerM2q7k/fFD3bebtbUleY4rzJLt6imjTQx47srtvuzw1v8L0Ff3wJCGvg3ILC+9onTj3n6fHiVXIuuY2pXcisFUA2yENXmcDRXm8GoVFNF6qqYbZ8Yu7t9eXT0mD0Xzf0nM0J2R63wp4uGOunmw9n7RdSRVG4gY7o3of/5K09ZuWCGgt8zjd5toZLsGjaOOzGrW5Rco7SCoauuPZVQxzpRMCqCCapNuQ8mhFfJNIKZXKY6jY+hg5ptnZXgnEi89xi3SIBql2wykPX3jULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjFNjUTYmf1rWFCQsCKnJViHid9pX/zIokj3D0KkLt4=;
 b=OE+J2NsV+rmvbgoX1JtwMgtEQCa//Fo2N2CbxL+8+kFZYhocf0X40p6WlnPakx44p0zsYhPEw/vyMCxi3f4323yYrConVSul83+HelnMQCQNtOhDFFmfHykbt+h5072+5rRkxXussgb9VNyGJIjkSb9SfPXU+TRSnWHM5L0JPv8/ra8T7ponUWlVMi+9+v7zZrJ+O8PFy7KIr1UG6/eBKRjwtRKdQsgcFAtiSumJ2VOP28D51CsACaxQLvU2dygVfizAANQ7hCXqEYoOCTsLDkaXYxk+VkDEWuzxYZE0TVJ+TbPh9UlTDEp+ekOVTMA5Riadb6F6NQwNp0Wg1o7K3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 22:57:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 22:57:22 +0000
Date: Fri, 21 Nov 2025 14:57:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 04/18] drm/xe/multi_queue: Add multi queue priority
 property
Message-ID: <aSDuT1MegAFXRyQl@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-24-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121035147.766072-24-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW3PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:303:2a::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aebbd79-4fb7-4938-c6e1-08de29515478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXRodkdIRVVwOHF3Y25zOEZpaVpYcE51Tkg4bTV3QUl4T1c4OCs3ZTcvUFhZ?=
 =?utf-8?B?dmFIN1ZRbUlTRVcySjhsTHdYUndadGkrbzFVWGJ4SXdrdVBha2RadkVSMWJJ?=
 =?utf-8?B?NzRCTUpPanBLSFpXS2lERGgvS1NUMjh5NSt4NDdaQ2hVNHh1QlFTZzFIeER0?=
 =?utf-8?B?QzVuYlJ1eWhSWjJmcDh3V3BpNXQ4S1d3K3RLa2xJdHNXV2NaSWN3cjFQTmRT?=
 =?utf-8?B?M0t4T2ZDS2lHUVNZYkpEMFBkdzk5a2dkeTJLcXhMUm5xY28ycTRaWEprdE0y?=
 =?utf-8?B?REErdnNIMjRLK1RFNXBVVG0wdU5mV3c5YTlDWXd0bXVoUjB2TjJpWENPWHZh?=
 =?utf-8?B?TEpzMEViNnVJQitqMDJUTTVLYWVKUFdiTlZQYmkyRFYveEVmbG5NZkJzbFhu?=
 =?utf-8?B?dDJrUWtVcWxSaUgzcTdKOU9TZytZZlAwdXM0MVRWTDlrQlpzdHRocCtBajhW?=
 =?utf-8?B?S2FHb3Yrd0E2RzFRMWdQVEEzRzBGbkNWRkhlY3N1OTZpdDhHRis2QUVaTUxU?=
 =?utf-8?B?dkU1MDhVQUlEWHM5RGRaZVRQZW0xUEEva3Zjbm84V3hWMlBySnVWYWcyQTZM?=
 =?utf-8?B?cHcyUUZrcEYveGJJTkZWY1BnaUdlRndtRDZQdjI2RTVlOWdQM21yM1VFMEZy?=
 =?utf-8?B?VzJKQWJMMFp3ZnlaVWRYNFJneFN2bnhmMWRoalJhK2dHak5pZFMxN2NnRURl?=
 =?utf-8?B?Mi9lNjY3ODR1cTJjeEV2NjJpaWFpWTA0aXd4WTFXbkd2SGYrUmhsckZJcGxD?=
 =?utf-8?B?QTFheURPTUhjSUxLSE5Kcmt3Qnl3NDRUVTluZjYyN3lremlKYkJkM04wbS9m?=
 =?utf-8?B?bzBMcnpCSm5kUlFZcVkwbU1QWkV1MjdmUlhJR1pva1ZKVFVDSzl0aitXL25X?=
 =?utf-8?B?WE5CRm1MVW9iRlFkeGdzMlo1cGJxZWF2cDJVZDhuazhCcjljbWJDYWRRSXNX?=
 =?utf-8?B?U01YdlgwWjJSQnFlanJQRzlNc3NHL0ltUGJuS2xqREJHTTRacFdYYnJIbGRL?=
 =?utf-8?B?dW1qcGcyZGorcUhuSjdVNGwrRDV4ZlJUaEpKYTVCRExqRGxzbVQ1QUdCNEJI?=
 =?utf-8?B?UzhPdXRDK29mamdjQ2laVjFxRzIzbU1LTUVNS3RxdUhxUmdvVXJ4dURKdmtm?=
 =?utf-8?B?alJvTDdYcTB2bnNHV25xSzdoTGlhWmFHVCsxT1Fqd000a2pHNFc3VFRHNnUw?=
 =?utf-8?B?L2lWbWVkWGdIVFJRSzN4RHFwcmwxNkxBdUZsQU5rbmdsTWZqYVlLVlF3Rnhy?=
 =?utf-8?B?emdvMTNJUmRLSFZuS29qZlgrOWNJVytoWFY2emhoTWFQY2ZHZzVncDhIZllr?=
 =?utf-8?B?WndhQlJ4QzhwL3VGN1BySlp2bFBsNnZZblFORVd2L3RpNWZ2Y3FGNFduejZB?=
 =?utf-8?B?cVR5MzlFNEdUc0drdUc5RmFFdWpGYjBaSm5HY2o3alVCU2F2dmx4WnZ2R1Zt?=
 =?utf-8?B?emZ3TTBWTlVjY3o2clZFakVOTVlRaHNzWThOL0M0SytCSEVlTDc3VzlqUTZt?=
 =?utf-8?B?TE04NG9JckRFRWQyUGZ3ZzFYa0kwZ3R5c1VLMDYvQkQ4cW5EWGRlY1FBUzI3?=
 =?utf-8?B?b2Vkd3FrdEhwS3JTYmdUVGV3dlNnNWdtMEZSMnVNQWg5TFdPNmpOWUdqMGU4?=
 =?utf-8?B?K3E1OElza0tYaXB4T2M0L2VHUGRNUE4zM3A4UCtSd3IxWXo3bFNpOVduaEJh?=
 =?utf-8?B?NE4xdmpVdXJvbXhuaDg5KzRtN0pxanp6d1dnemFyNFRyZUJ1dlAweWNqWkxM?=
 =?utf-8?B?ZStUSnd3MGVYeXFGZnlKMU5XeGNjaEFtRk5hekx5M3IzdmNBdy9aekVJRi8r?=
 =?utf-8?B?cldLTEhuY29xTFZiRnE5RTRWelJPb0ZQNWkrTlJiSW9pTEZuUURNb0tjOEE5?=
 =?utf-8?B?cUxWQkthNlYzeTZBTVJXVGV2UWZhYXYxTnlXWUlLTXdlMEJXSWU4dFRiaEYv?=
 =?utf-8?Q?l6OrqKlyThlI3WB48t6LTYEKCN06YAgq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snh3UVY5aEtsbXpBKzcxOUY3S2MrVkhNMmZVSnlwcHpoWkRJUy8vZExpNmg1?=
 =?utf-8?B?aWdUTVFaMEI3eFRDeTBtZ3EySzU3WkJ2YUNpOXdxV1RQdURGdXNuZGN3Q0pS?=
 =?utf-8?B?cndZL3Evc1E4WUt1YVAyczQrSFhPYzg5Wi9xQ3hQYmxxTlVscVdubTl0TC9I?=
 =?utf-8?B?T3JRZG1IdzJsd0RCbFdzeDhTQ0lCdDl3Y1d1aC9uM0NqRmNDQldGZnFLVFpG?=
 =?utf-8?B?bUdKaHdHWEpadWFOTy9Pb2F2RTViTS91cjZnckM2RXd4VWRKTkwwUWU1aDJx?=
 =?utf-8?B?TlU1cHA0OHVGRjVrdzZUZmRlRGF3Ukh2VE1SU0hTN3EySDRKQW9Ta3dpY3Nw?=
 =?utf-8?B?Q0FnTEw0WWlwYldTejB3MXJySGhRaDdzTEIvclVoeDgrZFZvY2thV3BZZGVa?=
 =?utf-8?B?TWhpbSs0ZmhmaGttQTFBc2VMejNEcU1EWUk3aDAwMjNqb054a3Q2RUpiNzY4?=
 =?utf-8?B?bEVROEx3YkJndDhob0hZdWlCd2dFaC9OaDhVYXVjMTBPWHBoVXdFc2dJQnk1?=
 =?utf-8?B?WGdoekc3Vm1taWZqdEQ2SjQ5bWxKajNMQVNvMkRoWE5MRWtzdmxkK3pHa2Y2?=
 =?utf-8?B?VW1PYmlCVTVTd2kycVBSRU1kK2hXeFoyOEIwTkUrNlZDUjVGVzVkYVl6dm11?=
 =?utf-8?B?bkZ0OUJrYnlWenRoSDNwUlVXc0dTQXBxOG5hMDFQUHN3OUI3MGdxK1M2YmVN?=
 =?utf-8?B?Y2k2aWhPQWhZMzJBNFM2V2I1V2dWK25KbGU2NEw2djZ1TjFGcnB3aS81Mkc0?=
 =?utf-8?B?MjhlNHpyT2R4MTdQcitLWkRMOEF4d29tRGlydnJaU29BejZxbEdPd3V2UVJC?=
 =?utf-8?B?TWFmUkRjblBDcGx4T2tZVm5wek5lbmxSdmtGdkFqejM1ZTVMNkdaRCsxdzRT?=
 =?utf-8?B?ZUZaR1BiYXV2aGZVNHBHSHlZS3BYUjNwZ01BY0svSUQ3TUV5U2M5dTFLcGRE?=
 =?utf-8?B?RSt1encwY1FBc3lCb0tySVRMa09mWEwxdWVDa1EzUHQ5RXY3TTVUOVl0TFBW?=
 =?utf-8?B?aFFFaGRvK3dySkRjbzdvSHhrM0FFOEQ5R1BSOUswRTN1NndvclB5ZEQyaUhr?=
 =?utf-8?B?b3JmTVlSVG1MYS9QWTNlRkUrclJoQmZ4amJPM1VLYUlFY3pIcFppaWlueW5X?=
 =?utf-8?B?NXNiOUMzTzN0UWdpQStyMjVZL21QQkhzUFYvZ0lCbzBYSFY0R2ExZkgwUmxj?=
 =?utf-8?B?c1J3Mzh6T25yMzkzbmtLZGwvcVpRTzdmVGI2d0VhNjVZVVphQjJMZ1I3QjZo?=
 =?utf-8?B?SmFscDhIMjlyc2NGNFp5Z08wVmF3bHBYcFpRNHNNV2c0ZTV1NVVKSisyRTV5?=
 =?utf-8?B?dVE3V3ZKM3ZBT2xsNTZIaEdlRVNJL0kzWk5sbVhwc09WKzBrS1J6ODV6eDM4?=
 =?utf-8?B?K3F1YjV3LzlKNHVsa2VvK1E2cmRoSzdra0RnSzBEdVRCMlU1SWlZQWJmUU9J?=
 =?utf-8?B?WHBKYlY3YnY0ZSt5dE1ham0vcTFpWlFHQmd4eVVRaEZ3RjRPQnJpUmtBcmVQ?=
 =?utf-8?B?cSt4TGh6Q3JMQ3NyZkhXa2huOUxxTU5GayttSDU0eW5wc094a242YUVJZEVi?=
 =?utf-8?B?TG0zcVhxa0FCWFBycGh4bHgvb2c0YkFDV2lraXBNZzl0dWlmUm9uTUduS0lG?=
 =?utf-8?B?NEZpVitDSFlxNHVNRDFTUHNQb3RkMDBYMURHS0luTVR1ejJSQVdUUzZ1Y0Fj?=
 =?utf-8?B?WG9XZ1VaU1JJNysvRzRrUTlra2xRZGdjY2hnQVRjT3lVRWZJSnV6OWlaQ0Rn?=
 =?utf-8?B?b25xT0t5TzY5eXM0dUdPRGhySHRwejVKK2ZXZnNaaGxJbkx3UGg4cGlEaFMv?=
 =?utf-8?B?V3hBVkgraFJjeHliMzAxQTZMNzdpYW9BdTdMbW1Ya21YbHVvbmsrelRuVUJW?=
 =?utf-8?B?MVVRVGI3ZHR5NzBtRXhqTUtFSnowT2pmOTRTSGFiUUZ0TTRlOFg0aVNpMEZ6?=
 =?utf-8?B?WCs4WkovRVYzNm93TStjWlc4RXF1c2hUU01LUk9oaDNoZCt2Z1JsOEVidHQ0?=
 =?utf-8?B?WVRXK1BSME5iL0YxOC9Eb2JlVnM4REZONTFmSEw5dkYyWUFsaE5Wc0dKWDFx?=
 =?utf-8?B?QzN5L2xsQzlDejYydGY2RG9idHBNQ25ISFF1N2FKUTlCaHBKUFQ3NVBJTHpv?=
 =?utf-8?B?STdWRkNkbEQ4SG9HQ1RxUU1ZVGxlYnptdFhBTGJQcWkvaTcvYk1xMGE5ZUEv?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aebbd79-4fb7-4938-c6e1-08de29515478
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 22:57:22.0842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t46+CSgZ9iuU9n66Ofpl74I6qwJR0pyupaRspXukEpPGIP58Ugv8MFLtQ2My+SNmTLLbIbV95oJSFw7kGWMkrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
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

On Thu, Nov 20, 2025 at 07:51:38PM -0800, Niranjana Vishwanathapura wrote:
> Add support for queues of a multi queue group to set
> their priority within the queue group by adding property
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY.
> This is the only other property supported by secondary
> queues of a multi queue group, other than
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE.
> 
> v2: Add kernel doc for enum xe_multi_queue_priority,
>     Add assert for priority values, fix includes and
>     declarations (Matt Brost)
> v3: update uapi kernel-doc (Matt Brost)
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 17 +++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 16 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
>  drivers/gpu/drm/xe/xe_lrc.c              | 29 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h              |  3 +++
>  include/uapi/drm/xe_drm.h                |  4 ++++
>  6 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 330b5103222c..6debcae8ce11 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -179,6 +179,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	INIT_LIST_HEAD(&q->multi_gt_link);
>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  	INIT_LIST_HEAD(&q->pxp.link);
> +	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
> @@ -740,6 +741,17 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>  	return xe_exec_queue_group_validate(xe, q, value);
>  }
>  
> +static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_exec_queue *q,
> +					       u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
> +		return -EINVAL;
> +
> +	q->multi_queue.priority = value;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -749,6 +761,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
> +							exec_queue_set_multi_queue_priority,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -770,7 +784,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index b9da51ab7eaf..445ae4979c0c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -32,6 +32,20 @@ enum xe_exec_queue_priority {
>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>  };
>  
> +/**
> + * enum xe_multi_queue_priority - Multi Queue priority values
> + *
> + * The priority values of the queues within the multi queue group.
> + */
> +enum xe_multi_queue_priority {
> +	/** @XE_MULTI_QUEUE_PRIORITY_LOW: Priority low */
> +	XE_MULTI_QUEUE_PRIORITY_LOW = 0,
> +	/** @XE_MULTI_QUEUE_PRIORITY_NORMAL: Priority normal */
> +	XE_MULTI_QUEUE_PRIORITY_NORMAL,
> +	/** @XE_MULTI_QUEUE_PRIORITY_HIGH: Priority high */
> +	XE_MULTI_QUEUE_PRIORITY_HIGH,
> +};
> +
>  /**
>   * struct xe_exec_queue_group - Execution multi queue group
>   *
> @@ -131,6 +145,8 @@ struct xe_exec_queue {
>  	struct {
>  		/** @multi_queue.group: Queue group information */
>  		struct xe_exec_queue_group *group;
> +		/** @multi_queue.priority: Queue priority within the multi-queue group */
> +		enum xe_multi_queue_priority priority;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>  		u8 pos;
>  		/** @multi_queue.valid: Queue belongs to a multi queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c68739fd7592..8a75d0ed7ee9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -638,6 +638,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  		return;
>  	}
>  
> +	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
>  	xe_guc_exec_queue_group_cgp_update(xe, q);
>  
>  	WRITE_ONCE(group->sync_pending, true);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index b5083c99dd50..56836a5546d8 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -44,6 +44,11 @@
>  #define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>  
> +#define LRC_PRIORITY				GENMASK_ULL(10, 9)
> +#define LRC_PRIORITY_LOW			0
> +#define LRC_PRIORITY_NORMAL			1
> +#define LRC_PRIORITY_HIGH			2
> +
>  /*
>   * Layout of the LRC and associated data allocated as
>   * lrc->bo:
> @@ -1386,6 +1391,30 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  	return 0;
>  }
>  
> +static u8 xe_multi_queue_prio_to_lrc(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
> +{
> +	struct xe_device *xe = gt_to_xe(lrc->gt);
> +
> +	xe_assert(xe, (priority >= XE_MULTI_QUEUE_PRIORITY_LOW &&
> +		       priority <= XE_MULTI_QUEUE_PRIORITY_HIGH));
> +
> +	/* xe_multi_queue_priority is directly mapped to LRC priority values */
> +	return priority;
> +}
> +
> +/**
> + * xe_lrc_set_multi_queue_priority() - Set multi queue priority in LRC
> + * @lrc: Logical Ring Context
> + * @priority: Multi queue priority of the exec queue
> + *
> + * Convert @priority to LRC multi queue priority and update the @lrc descriptor
> + */
> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
> +{
> +	lrc->desc &= ~LRC_PRIORITY;
> +	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
> +}
> +
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
>  		       u32 init_flags)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 2fb628da5c43..569ca380676e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>  struct xe_bb;
>  struct xe_device;
>  struct xe_exec_queue;
> +enum xe_multi_queue_priority;
>  enum xe_engine_class;
>  struct xe_gt;
>  struct xe_hw_engine;
> @@ -133,6 +134,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
>  
>  u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
>  
> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority);
> +
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 4de21e0a4fcf..240eeea99cb0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1260,6 +1260,9 @@ struct drm_xe_vm_bind {
>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
>   *    All the other non-relevant bits of extension's 'value' field while adding the
>   *    primary or the secondary queues of the group must be set to 0.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> + *    priority within the multi-queue group. Current valid priority values are 0–2
> + *    (default is 1), with higher values indicating higher priority.
>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1302,6 +1305,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
