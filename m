Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA6C02180
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 00:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C1410E2A9;
	Tue, 14 Jan 2025 00:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQk0Guxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02FE10E2A9
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 00:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736816272; x=1768352272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AqDry4R6sCrTVwN9gKgCktjJJkFRkqS9VED9di961oU=;
 b=RQk0GuxjgDHN3RnjoPKkkTgbl29qk1bvfZYpH+ku7irGgZNVazLmm5yv
 13obseHZnOgumJlCdzY4CSDcsOX9+1BTJLP9uQk+a8w4Jy/pVRE5UdIPo
 bargScY74Hh959fyL3ZiLPEAxVEFRKPZRf88vF24ubbKfJcOO0ciAJzLL
 ixV61zpcoIhmOMpSkBE/qQ6Bck5Oens3QaJajPtOtO7R1SiVeAWWHvy+K
 qqr/bQgW2ZVx789cyUe2e6G819Sm43df6baWefUl3K1mII2uky6kLffen
 bxiTDOI0FtA0U/Sy8IVSpJInHrDxfNwVh+7TaspLJTx90yyk6etj1o+lz A==;
X-CSE-ConnectionGUID: 5m/ZVTjtTRCINgqZy1kmZg==
X-CSE-MsgGUID: h5sARRZ5Q7KrhonHTrzV2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37214516"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37214516"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 16:57:47 -0800
X-CSE-ConnectionGUID: wDa3mfi7TS+YBK7bhoUlMA==
X-CSE-MsgGUID: hBGZ7yz7SXWu4kOpIMY+3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="109634007"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 16:57:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 16:57:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 16:57:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 16:57:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAwhfgI7Yh4E5auuIycjZcRW0vT0zJSwBq4PwdnpTyWmCh1qJY7+5gfVPXa0BNJSF3MAKjpQjN0ZfR6KLEF/Kzff6jGQgLyhE5qZWWlA1VEwpuy++KA6THJXjw1ZTt3T7j8iCLnI6YXJm4i1Z6jSP0QksNID+KxL/Ae/ur3F8XnKAm+83CcDAGsHXOmJTTQvzgjbkEWwaPhBOjAHEeafdedieeJy3Jflh8r1J7zNlJQT9fklci/xGW+kbfRkJWbFut+S+M1bjolLYyhDuc2Fzf7v6jqg7Fs/wXzNCL1DLFg49Aes1s7Y797souMQATh/JJnEfOHojsfCyHcDW4DEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdbQy7HpGMrCdYH2jg2aJTU55TKGgmh2EHYz7/XGAy0=;
 b=MViFyDp8Fo+GJxGRCMfL5n44+pc40Mvxngh0f4b2prdeZjiquciSqQi7hVWRIbhL/Nele0JKwy6sku5sgMZzB5NxM0J+C9L08sHlRX8SOH2HZD4tcAIWEnd4XtjUH7hj/jv9otRxe7eC6cveySiu8VsDD3X5Ayp8Kr1EQ+wrNlObPL7YI0ydmlskeqiwyRQhjVksheCHgSOxQK98rqia5hZsTJNfoqt8z+GzAIqlfO7MQ4YjF6eKgm7qR+jwmu53JBHtENhS5HYxaCRtOK/82UtiloxSTxLFpGR627OW7XgakhQKjJM6UeV+HlOxci5P4Y1Pwybd242rrtXH2xzZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 00:57:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 00:57:34 +0000
Date: Mon, 13 Jan 2025 16:57:27 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <ashutosh.dixit@intel.com>, <john.c.harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 09/10] drm/xe/pmu: Add PMU support for
 per-engine-class activity
Message-ID: <Z4W2dwCeiPG78BRy@orsosgc001>
References: <20250106075600.852080-1-riana.tauro@intel.com>
 <20250106075600.852080-10-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250106075600.852080-10-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0188.namprd04.prod.outlook.com
 (2603:10b6:303:86::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN0PR11MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 9563cc02-4409-4adc-60c6-08dd34366e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGlBS3M0aHRSOCtEWlZFdTYrY0pjb2dRdlQzYjdsTmlGalVHL2VROWFHK2F2?=
 =?utf-8?B?WkpXYndmVFRyVWxVREFiNUI4Q3RDKzI4K1JCNXZZdzRlZFptRWxYZW1tMUtl?=
 =?utf-8?B?UmFxbCtUNGlvRjFacDhvZExPVWZGM2dieENLT2NhdG00TVBzZ0JIanVaM2Vx?=
 =?utf-8?B?K05KR2hTVWNwSXc3ekFtY1hDZ0lCM3pURk5uQVM5OStBOTZrK1I5czJwWWgx?=
 =?utf-8?B?QkcxbTVWd3FtN3B0NmMvNGNxR1F4anR3Y2lETjRrMHcvZkk1RHJ0dVRHdkhR?=
 =?utf-8?B?MStCTkxUMGptSVJnTHJXRnp1L0g5bjBmdksvRzBySkIxOGVJTUR2bkVKb3M0?=
 =?utf-8?B?VDJMeXF0UzBDS21sczRRMjhxaFF4Y2pyb3BYcDdKemwwMVVWUUlzeW1QTDZE?=
 =?utf-8?B?VDZmc01kZG9aOFN1bFI4QjdNNzJ4K2ZPY3I4MUN5TjlQR0U3UEhHVnpBRnhU?=
 =?utf-8?B?UXFDdHl4QU1ja3U5Z1pOV2t4Z1Zqc044VkV1S2UrQ1hTMXMvdWNMNGJqTm5G?=
 =?utf-8?B?Q3NlUXNPTUxqTHNHajhCU1E0Q1RobE9pSlRoYnRVRE1HZk9qVXc3UkxwTEVw?=
 =?utf-8?B?K1FVUUszRktQK2N6QlZ4MkFsWVVTRUFReEF1RVcvb2xGRU5vYkdaUjY0Qy90?=
 =?utf-8?B?Y2FmSHFSS0g5dm03VXp3anI5Nk83L0Y3N0FQNUFsUnVUbmdCZ3pSak41d0NC?=
 =?utf-8?B?NU03R1k2OVF0RFRDUHpQRFZtbnM0cnp4VCs5dCtlNENQNUwvc0NhdEt5S3JV?=
 =?utf-8?B?eXNsRXl1Y0JGVkxHU0prTUhhbUNCUGp5MnVSY1NHTU8wZFRuOUVqMFNybkt4?=
 =?utf-8?B?a3NPeTdJbTdWOWRxdGQ4M1Fudlpxd052cElaU0krRzg2L3pIZDhybUtmZ25Y?=
 =?utf-8?B?dkhDRFZsOVdJWFNwYUhETHRRVStTUUM2NXJ5OTNoVjhjbWtrczIzUmVDNW5X?=
 =?utf-8?B?NkVtTWJGcmdBdnRpem52TW9ENzJtWk5RKzc2dFo4OVROYk5GSzBRVGxESjFj?=
 =?utf-8?B?bDRsU2ZNYXFUUUN6R3pMQ3IxVmJUQlU1bjRzNkJHYVZvNGlMTUc1eHNmNTJQ?=
 =?utf-8?B?aWFVbHhaQVFMMmw4ZkhWa09FMlJVUnNBY3UrMXFVNGczL3BJQlBLeUdZVGxx?=
 =?utf-8?B?VmJabFhaV1JRcHhLN2E0WlhVSnl1RFVueldDMEdzcjdsdUNVYzJZcDZQcXQz?=
 =?utf-8?B?SmJhOGFNdk5wSS9JRmU2d2xvUmVQcnJRME9jNCtwR00zOUVOOWJqcXNXS0VW?=
 =?utf-8?B?UWd1SytzNEZ3YjZwL0lUeXFYR25HbmdaaklNMEhMZW1oa0YvUzVvaEsyZ2Mw?=
 =?utf-8?B?eHRoU0ZCK3RGSjZNQVdiVWRXR01tZjU5YjM3YVpKZ3UxNlRTbVZHOXV1R0hU?=
 =?utf-8?B?YkVDV21NdVYwcXlMN08zSFhZZzJXeWRQZDg3OHlGa3lDTnVzREk1YnpLYlRJ?=
 =?utf-8?B?Ry96VDBrdG8rNHRObVlmN1pabjQrVExNQnRkNzkwNFJRSHFjSWlSazlzZU83?=
 =?utf-8?B?MjV0Qnh0Vkh0d1ZBUDJIaGpoM212S0cyeDRqNE9QYk92MzhJZmdWME5SbnUx?=
 =?utf-8?B?Y3JnLzM1WVo4Rlc3WExaU2FWN3Myd04zcU1yWTBQNEFTRFFqOGl0V3M4dm9m?=
 =?utf-8?B?TzNQM0pMYVAvem1KWTAxS1ovSWE1Sk9rODFtNXJEdnBKaG1qRXdOMkNTMHly?=
 =?utf-8?B?d3RYTjE2WXY4ajVFc1VTaTJCQ01xNEFjRUZ5TkZ4U3hSUDB6L0pvaitLUXN3?=
 =?utf-8?B?V3M1QjgxSlJXTnUxblUvS1FSeFEvdEt4RVF2aE56ZUZXWDBBYnZzalF0L1VT?=
 =?utf-8?B?Y0N1UXFYc2VGTWNJMndDNVVVQm9EWWRIc0Qya2luMVI0UUJyMUN5eklybDZQ?=
 =?utf-8?Q?ZZvdiZiEAsOEA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckFwcXVwNllHL3N3TEovbWhQSytaTG51TndVcEdsR0pzcDVwcDFaWktDZWlR?=
 =?utf-8?B?My9HdGphVURaMUROQW5mbGFpdG8ram5ESVh5V1ZFQzRRRjdLYjFoZU10cnZU?=
 =?utf-8?B?cGpDZWNHSU9UWk84NTBKNVMrZWZzTVZGenFxb2dweGk3TUZtT1Fvc05rNWFX?=
 =?utf-8?B?a1haSkZ6MnpyQWlvdzREU3hsTW1aYWJlQ0JQR2tMWWpKbjBzQXFCZk9lMEhY?=
 =?utf-8?B?alhHTHdKTmhFNEJqTi82YlBiVzBkT1IzaDBsaVkyOEkrWXY4YU5zcFNQSWlX?=
 =?utf-8?B?Y0tnamZQclNFNlNjcDFkOS9JMHJ0Z2lpRWNVNkRBT0VXci9wUGJZSFhpRDkx?=
 =?utf-8?B?QUxyVXZCUjhwTTk0bmlDMTh4RHNJZEpnVGVjNjVLSVpvTU1Xc2gyZUZUREdn?=
 =?utf-8?B?RVJqay9UeE5WcDRDQllkeXRpNExydnBCZGNwYzZ5a1ZYNy9qWkQrYmMyWjR1?=
 =?utf-8?B?VUlLb2UwenR1bTB3QUNFWXVKUnNWemZ4Z2xWemw0RUhRbnQ3bG00TC9TYzJJ?=
 =?utf-8?B?SHF2S1kxM3IyMytFS0NKZVV1RUwzK3lWeXQ3aHNVTGRWdFYrY2NPL0k3VUF3?=
 =?utf-8?B?SjlhRFdBdHg4Zy80MURpZmtXeVlMV1NEQVI1SkQxZjF5WE4weWpPZndaeVky?=
 =?utf-8?B?MytqVEdFN3dESkFMVXFSenlpejBoaTlDWXVXNFFpKzJiZStCcitwc3R1THBX?=
 =?utf-8?B?cHQyZ1hYNGdUalRxT3NmVWo4V2tLKzJzL3YrZ1JXeHp3ejB2d2FXckVNaFVk?=
 =?utf-8?B?S1pxM2JEU3Qvb0dsMStNdXNYNHdXV3IxcnZYaHV4eWZBTkhYejZpNDdvNExy?=
 =?utf-8?B?dndjSUJUcVhaSjhaYndya2lncGFpdGpvVFJuYllDcXFZdTdsNjF2aVNJeHFn?=
 =?utf-8?B?OWdIRVl4cEZFaEloeUYrSEViR2tGdE5KUCtJUWtENkh0MTRqcHg4QVpZWWhY?=
 =?utf-8?B?WXhCa0ltaDVlUjBlR1NERm92SmdscS94NHRoOTk4QVdEVGRwRzRrU3ViU3VF?=
 =?utf-8?B?RXJLemRpM0RLdFhHODh3Z1UyT3JUSWRpZHFVSnpyMTllMXcxWWhZcjZYc2JL?=
 =?utf-8?B?WlAwOWtkUWt6WTVtZ2tHdDZRNmtFODI1TUNSL0VsbFdsdUV4c1FBTHk3R3Rr?=
 =?utf-8?B?Ym5OVnJTbk1aa0dLc2F2N3FJNnYyVURJdEM1VUJjZmNza3pBblhBUkhUNEN5?=
 =?utf-8?B?ajRRVWUvclNXSTR0S2NEc0VUYSs0WnNGVWdwWFFyeDNBM2FmSlQ5OFFnbngw?=
 =?utf-8?B?YnZyZkdSNVZjbmRheno4MGlUaHRESlNuTVBsSUNmM0k2WHhYTEFlTFpBeG1M?=
 =?utf-8?B?MlpNS0c4Z1NIeUc0YWd3dzFDWW14dll6bmRlYmdFNVlnS2pRU1hIa2xBUzFS?=
 =?utf-8?B?d2tVeXBCbEx5UjNxQXJXazFsM011MmZXR1dkOWIxMXZBTVZtbkMya3ZIM20w?=
 =?utf-8?B?cnZxY0pVVTgyWjk4TGxyZkMrOEFzTGl5bzIvUk5SU3cyMHVGSThZTWYzSUtN?=
 =?utf-8?B?alZyc0s3am9GSW5rNjVOYUNwL1ZNQmw4VWg1RkRRZWcrNkMyd2tuRHJlWVhw?=
 =?utf-8?B?NXIrZHMxMldZMHVDZG43MDZLQ2tHcThLL3MvbzJqazZzSU8xYllyaEVwWm9t?=
 =?utf-8?B?ckpWblk2OEdRdG5HNVY1bWNkTlcwbTFueDFBbklFVldmejQraUZrZDVITmRu?=
 =?utf-8?B?SWY1bGo1MlZ3YytGc0pNaURSS2JZTUpWTFh5RlV6R3dQcnRQUmVVTnNFdlNH?=
 =?utf-8?B?YXVKY1VDem5ZQ3pnclkzVlZ2SlBZUkFNV0lVdjVqa3dST1Z3M2RJZUlQTFcx?=
 =?utf-8?B?RVAxc1ByNUxRSFRPbnpnWHZGVGpHUGlKVFdteFJlOGgxeE5KUWhqbnphYURn?=
 =?utf-8?B?MHVaVDNaNSs2ZmRmTzFySnB0UnltU3prc2Z1SmUvcktGV0loOFpteFdoMnpN?=
 =?utf-8?B?bUhrRWNyczBxdWljUjNSSmlDVndpRGx3U0ErZGY2VlhXYStxNVpFMzVrSC9S?=
 =?utf-8?B?bUx5Q09UdllvYkswcXBHVFZnbSs5RnloLzhsb04ySWNaa0RwZ0czSHdQNXBq?=
 =?utf-8?B?ckpidGw2K1FFMzhZKzNMSGhCT2lyelE2YnR6RldwSVNrdkJWTTRoTlhYYTc3?=
 =?utf-8?B?cGJMNGwvbm5wdEN0V01zeGk3WXA1Ui91bGorMmk1b1MzOXo3WXAzdDhOc3Rp?=
 =?utf-8?Q?6NVBwRk7fGvHM6GUCLulZ4I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9563cc02-4409-4adc-60c6-08dd34366e93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 00:57:34.6702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxNa95xvy7vCfKqimQTKMLNd+wet7y4e/KNkH+Q1MaWM79hy4/rkJmpY8YmBzbk410+9uMttRE2k05V0YAwg7kZ5dHFu+XDpEFTCrGrkTGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
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

On Mon, Jan 06, 2025 at 01:25:58PM +0530, Riana Tauro wrote:
>PMU provides two counters (engine-active-ticks, total-ticks)
>to calculate engine acitivity. When querying engine busyness,
>user must group these 2 counters using the perf_event
>group mechanism to ensure both counters are sampled together.
>
>To list the events
>
>	./perf list
>	  xe_0000_03_00.0/engine-active-ticks/		[Kernel PMU event]
>	  xe_0000_03_00.0/total-ticks/			[Kernel PMU event]
>
>The formats to be used with the above are
>
>	engine_class	- config:12-19
>	engine_instance	- config:20-27
>	gt_id		- config:60-63
>
>The events can then be read using perf tool
>
>./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt_id=0,
>			       engine_class=0,engine_instance=0/,
>	       xe_0000_03_00.0/total-ticks,gt_id=0,
>			       engine_class=0,engine_instance=0/ -I 1000
>
>Engine activity can then be calculated as below
>engine activity % = (engine active ticks/total ticks) * 100
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c       |   5 ++
> drivers/gpu/drm/xe/xe_pmu.c       | 139 +++++++++++++++++++++++++-----
> drivers/gpu/drm/xe/xe_pmu_types.h |   7 ++
> drivers/gpu/drm/xe/xe_uc.c        |   3 +
> 4 files changed, 131 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 408365dfe4ee..f229745b78b9 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -26,6 +26,7 @@
> #include "xe_guc_capture.h"
> #include "xe_guc_ct.h"
> #include "xe_guc_db_mgr.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_guc_log.h"
> #include "xe_guc_pc.h"
>@@ -743,6 +744,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> 	if (ret)
> 		return ret;
>
>+	ret = xe_guc_engine_activity_init(guc);
>+	if (ret)
>+		return ret;
>+
> 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index bae8eb38fddd..5bd312b6b8f6 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -12,7 +12,9 @@
> #include "xe_force_wake.h"
> #include "xe_gt_clock.h"
> #include "xe_gt_idle.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_guc_pc.h"
>+#include "xe_hw_engine.h"
> #include "xe_mmio.h"
> #include "xe_macros.h"
> #include "xe_module.h"
>@@ -90,6 +92,17 @@ static unsigned int xe_pmu_target_cpu = -1;
>  *    1950
>  *    1950
>  *    1950
>+ *
>+ * Engine Activity: PMU provides two counters (engine-active-ticks, total-ticks) to calculate
>+ * engine activity. While querying the engine activity the user should group these two counters
>+ * using the perf_event group mechanism to ensure both counters are sampled together.
>+ *
>+ * To read a engine specific event for a GT of class 1 and instance 0
>+ *
>+ * perf stat -e xe_0000_03_00.0/engine-active-ticks,gt_id=0,engine_class=1,engine_instance=0/,
>+ *		xe_0000_03_00.0/total-ticks,gt_id=0,engine_class=1,engine_instance=0/ -I 1000
>+ *
>+ * engine active % = (engine active ticks/total ticks) * 100
>  */
>
> static struct xe_pmu *event_to_pmu(struct perf_event *event)
>@@ -107,6 +120,33 @@ static u64 config_counter(const u64 config)
> 	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> }
>
>+static u64 engine_event_sample(const u64 config)
>+{
>+	return config_counter(config) & 0xfff;
>+}
>+
>+static u8 engine_event_class(const u64 config)
>+{
>+	return (config_counter(config) >> XE_PMU_CLASS_SHIFT) & 0xff;
>+}
>+
>+static u8 engine_event_instance(const u64 config)
>+{
>+	return (config_counter(config) >> XE_PMU_INSTANCE_SHIFT) & 0xff;
>+}
>+
>+static bool is_engine_event(struct xe_device *xe, const u64 config)
>+{
>+	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;

you should just use the config_gt_id() helper above and other places 
where this pattern occurs.

>+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);

when I pass gt_id=1 in the perf stat command i get a hang/reboot. gt is 
null above for gt_id = 1, on systems without media GT and single tile.

>+	u64 sample = engine_event_sample(config);
>+
>+	if (!xe_guc_engine_activity_supported(&gt->uc.guc))
>+		return false;
>+
>+	return ((sample == XE_PMU_ENGINE_ACTIVITY_TICKS) || (sample == XE_PMU_TOTAL_TICKS));
>+}
>+
> static unsigned int pm_bit(const u64 config)
> {
> 	unsigned int val;
>@@ -192,6 +232,23 @@ config_status(struct xe_device *xe, u64 config)
> 	return 0;
> }
>
>+static int engine_event_init(struct xe_device *xe, u64 config)
>+{
>+	const unsigned int gt_id = config_gt_id(config);
>+	struct drm_xe_engine_class_instance eci;
>+	struct xe_hw_engine *hwe;
>+
>+	eci.engine_class = engine_event_class(config);
>+	eci.engine_instance = engine_event_instance(config);
>+	eci.gt_id = gt_id;
>+
>+	hwe = xe_hw_engine_lookup(xe, eci);
>+	if (!hwe || xe_hw_engine_is_reserved(hwe))
>+		return -ENOENT;
>+
>+	return 0;
>+}
>+
> static int xe_pmu_event_init(struct perf_event *event)
> {
> 	struct xe_device *xe =
>@@ -221,7 +278,12 @@ static int xe_pmu_event_init(struct perf_event *event)
> 		return -EINVAL;
>
> 	event_config = event->attr.config;

maybe check for gt_id here, by either calling xe_device_get_gt() OR 
using some logic similar to xe_device_get_gt() to validate the gt_id.

this is just a quick run of the code, I will send out more comments in 
another response.

Thanks,
Umesh

>-	ret = config_status(xe, event_config);
>+
>+	if (is_engine_event(xe, event_config))
>+		ret = engine_event_init(xe, event_config);
>+	else
>+		ret = config_status(xe, event_config);
>+
> 	if (ret)
> 		return ret;
>
>@@ -300,24 +362,49 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
> 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> 	u64 val = 0;
>
>-	switch (config_counter(config)) {
>-	case XE_PMU_C6_RESIDENCY:
>-		val = get_c6(gt);
>-		break;
>-	case XE_PMU_ACTUAL_FREQUENCY:
>-		val =
>-		   div_u64(read_sample(pmu, gt_id,
>-				       __XE_SAMPLE_FREQ_ACT),
>-			   USEC_PER_SEC /* to MHz */);
>-		break;
>-	case XE_PMU_REQUESTED_FREQUENCY:
>-		val =
>-		   div_u64(read_sample(pmu, gt_id,
>-				       __XE_SAMPLE_FREQ_REQ),
>-			   USEC_PER_SEC /* to MHz */);
>-		break;
>-	default:
>-		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>+	if (is_engine_event(xe, config)) {
>+		struct drm_xe_engine_class_instance eci;
>+		struct xe_hw_engine *hwe;
>+		u64 sample = engine_event_sample(config);
>+
>+		eci.engine_class = engine_event_class(config);
>+		eci.engine_instance = engine_event_instance(config);
>+		eci.gt_id = gt_id;
>+
>+		hwe = xe_hw_engine_lookup(xe, eci);
>+		if (!hwe)
>+			drm_WARN_ON_ONCE(&xe->drm, "unknown engine\n");
>+
>+		if (xe_pm_runtime_suspended(xe))
>+			return 0;
>+
>+		if (sample == XE_PMU_ENGINE_ACTIVITY_TICKS)
>+			val = xe_guc_engine_activity_active_ticks(hwe);
>+		else if (sample == XE_PMU_TOTAL_TICKS)
>+			val = xe_guc_engine_activity_total_ticks(hwe);
>+		else
>+			drm_warn(&xe->drm, "unknown pmu engine event\n");
>+
>+	} else {
>+		switch (config_counter(config)) {
>+		case XE_PMU_C6_RESIDENCY:
>+			val = get_c6(gt);
>+			break;
>+		case XE_PMU_ACTUAL_FREQUENCY:
>+			val =
>+			   div_u64(read_sample(pmu, gt_id,
>+					       __XE_SAMPLE_FREQ_ACT),
>+				   USEC_PER_SEC /* to MHz */);
>+			break;
>+		case XE_PMU_REQUESTED_FREQUENCY:
>+			val =
>+			   div_u64(read_sample(pmu, gt_id,
>+					       __XE_SAMPLE_FREQ_REQ),
>+				   USEC_PER_SEC /* to MHz */);
>+			break;
>+		default:
>+			drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>+		}
> 	}
>
> 	return val;
>@@ -614,11 +701,15 @@ struct xe_str_attribute {
> 	const char *str;
> };
>
>-PMU_FORMAT_ATTR(event,          "config:0-11");
>-PMU_FORMAT_ATTR(gt_id,          "config:60-63");
>+PMU_FORMAT_ATTR(event,           "config:0-11");
>+PMU_FORMAT_ATTR(engine_instance, "config:12-19");
>+PMU_FORMAT_ATTR(engine_class,	 "config:20-27");
>+PMU_FORMAT_ATTR(gt_id,           "config:60-63");
>
> static struct attribute *xe_pmu_format_attrs[] = {
> 	&format_attr_event.attr,
>+	&format_attr_engine_class.attr,
>+	&format_attr_engine_instance.attr,
> 	&format_attr_gt_id.attr,
> 	NULL,
> };
>@@ -703,6 +794,8 @@ create_event_attributes(struct xe_pmu *pmu)
> 		__event(0, "c6-residency", "ms"),
> 		__event(1, "actual-frequency", "M"),
> 		__event(2, "requested-frequency", "M"),
>+		__event(XE_PMU_ENGINE_ACTIVITY_TICKS, "engine-active-ticks", NULL),
>+		__event(XE_PMU_TOTAL_TICKS, "total-ticks", NULL),
> 	};
>
> 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>@@ -715,7 +808,7 @@ create_event_attributes(struct xe_pmu *pmu)
> 	for (i = 0; i < ARRAY_SIZE(events); i++) {
> 		u64 config = __XE_PMU_EVENT(events[i].counter);
>
>-		if (!config_status(xe, config))
>+		if (!config_status(xe, config) || is_engine_event(xe, config))
> 			count++;
> 	}
>
>@@ -741,7 +834,7 @@ create_event_attributes(struct xe_pmu *pmu)
> 		u64 config = __XE_PMU_EVENT(events[i].counter);
> 		char *str;
>
>-		if (config_status(xe, config))
>+		if (config_status(xe, config) && !is_engine_event(xe, config))
> 			continue;
>
> 		str = kasprintf(GFP_KERNEL, "%s",
>diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>index 0109bb11937b..bb27d0950b72 100644
>--- a/drivers/gpu/drm/xe/xe_pmu_types.h
>+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>@@ -19,6 +19,11 @@ enum {
>
> #define XE_PMU_MAX_GT 2
>
>+/* First 8 bits of config are reserved for other counters */
>+#define XE_PMU_INSTANCE_SHIFT                  (12)
>+#define XE_PMU_INSTANCE_BITS                   (8)
>+#define XE_PMU_CLASS_SHIFT \
>+	(XE_PMU_INSTANCE_SHIFT + XE_PMU_INSTANCE_BITS)
> /*
>  * Top bits of every counter are GT id.
>  */
>@@ -32,6 +37,8 @@ enum {
> #define XE_PMU_C6_RESIDENCY                    __XE_PMU_EVENT(0)
> #define XE_PMU_ACTUAL_FREQUENCY			__XE_PMU_EVENT(1)
> #define XE_PMU_REQUESTED_FREQUENCY		__XE_PMU_EVENT(2)
>+#define XE_PMU_ENGINE_ACTIVITY_TICKS		__XE_PMU_EVENT(3)
>+#define XE_PMU_TOTAL_TICKS			__XE_PMU_EVENT(4)
> #define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_EVENT(gt, 0)
> #define __XE_PMU_ACTUAL_FREQUENCY(gt)		___XE_PMU_EVENT(gt, 1)
> #define __XE_PMU_REQUESTED_FREQUENCY(gt)	___XE_PMU_EVENT(gt, 2)
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0d073a9987c2..d129bdeaed57 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -13,6 +13,7 @@
> #include "xe_gt_printk.h"
> #include "xe_gt_sriov_vf.h"
> #include "xe_guc.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_guc_pc.h"
> #include "xe_huc.h"
> #include "xe_sriov.h"
>@@ -210,6 +211,8 @@ int xe_uc_init_hw(struct xe_uc *uc)
> 	if (ret)
> 		return ret;
>
>+	xe_guc_engine_activity_enable_stats(&uc->guc);
>+
> 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
> 	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
> 	xe_gt_assert(uc_to_gt(uc), !ret);
>-- 
>2.47.1
>
