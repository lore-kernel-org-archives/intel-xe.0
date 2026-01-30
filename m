Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A377D49C92
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 11:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902810E9B1;
	Fri, 30 Jan 2026 11:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ipo46/f8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AEE10E99D;
 Fri, 30 Jan 2026 11:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769771435; x=1801307435;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9PE3oJKdsFoyDrSMFmwWP5tXceVDcEtdl8lvomR2I5E=;
 b=Ipo46/f8JzQpzs8/ryJfMg9qja2PvBTiMj2vnYq+CU99KqFFSGpgPsUP
 a2CxIa/u8cxNGWZG4F05ymA3GkH6XjZWqFMMiNDZrbxHURjOec1nVw9vq
 kWEdp+8C0t+05G/bQ4f5M5F3f+bzeQoTbNrMz+CokXGMOhz2ecY8/YGQ/
 95kTzlWP8fcftE00lIi1tMPHANuwmKXchGAIfbQOc9Tj0h/sNaNl2WXPX
 ExLQ+HUVYIQlYqhg+4U+pRp0oMEVay9sys6FfQmQc2tBYhaj4oYIaYTyP
 KMKYRpMSfjqmGTQYhVZgcS3S9abI4nc1JJjanSiLSJ6y0/4P3edkKeYgc Q==;
X-CSE-ConnectionGUID: v7g/CrE6QaaVls7VPE4DLA==
X-CSE-MsgGUID: WTTsgfx7T46M4jTVdTFmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71076308"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71076308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:10:34 -0800
X-CSE-ConnectionGUID: znla4jRzQUyQCjH5L0Ue8Q==
X-CSE-MsgGUID: pK5926XeQ8KUUncZacV5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208429025"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:10:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 03:10:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 03:10:33 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 03:10:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QypO7iDgN31VisB83RUpF7UmOzXzUMTqQKK7Vkrc5yn5GRoDiSv8XZd7tL+9+VeDxg49dnR16QECPnsK3IFhntSvAvNT6kMHaAPy+jx4te0ASJMPlL8NfoRAKQssTfDl/BsFbQeb/hnoBIT7IK0cL0XahqBWXF/BptNsoN/WPzmY7zKVl3PSBLO52do1Ppw9qT0ddxFbQWGtwCpg9LQgK2zgunip+bHA8uVOhVnY3zfq/QbBzrK3sc8n4NzPsH5tghZwTpJWl4JIsrOHRJ3l9gnhDn/Ss2mz2ojY8j5IX0OtkhJC7HU5HF/gHXsJjysezb9cyMj3gtKxltCz415Nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x1qKjOIYzRKljw3ZC5n1tEr6OJ51Ft46wzWMklC9Hs=;
 b=Kkz+ucGYjUN+DeknrdF4f8Td/2BXR4haNXQFILQbJBtCm4prLelpmioB5+W48ZlVRACfs8OUwVjnhQk/rsk5pnjAme5NFH9jULyS8nNwhLf0DGfwaFene3sCvuxLRZ3a4J5GqjS8G4os+BLDX+kCsSBXu+hytavcpwlazKnPhTnextTkbbUFKs9XobYyINgbfMQul4cTcbVUyAJDDG1poG2fJvitx33JZJCgN2b51MA5IhRkWf+y6LUgm/U7VcUEV3mMsUJja2wOMo8L19Oh9qRVCuDHkWKPNPoFIcCLz/f+sK8NhXPPRvVWb4EGnQlhJZHjr4zonqjy8sR1uatKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 11:10:31 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 11:10:30 +0000
Message-ID: <e9ec9e2b-d933-4b79-8c35-bfccdf621e4d@intel.com>
Date: Fri, 30 Jan 2026 16:40:23 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Account_for_?=
 =?UTF-8?Q?DSC_bubble_overhead_for_horizontal_slices_=28rev6=29?=
To: <intel-xe@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
 <176976454883.208851.3741366167069729410@a3b018990fe9>
Content-Language: en-US
CC: Imre Deak <imre.deak@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <176976454883.208851.3741366167069729410@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB4980:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c809f96-a5ce-49d2-af0b-08de5ff02dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlQ4UGtqd1RmbXBzWkFpdEZ2aUtNZkpRNFNFd2J2TDdKejltZkQ3MjN6Tytv?=
 =?utf-8?B?R2padkwvMm5aM3kvTnloUHV6VjhqS3BmNDByK3ppNXZuQXhBUnNjaE16ZW1O?=
 =?utf-8?B?WTlkbkZDVW1xbUl6MndIK0RnRkxCaUMveS9oQStZQ0JjRS9ZTUFVNm1aMDlD?=
 =?utf-8?B?TmE1UmNzdmI3WlJzUGNKdFVkWSt3TEFPOTNkTVBsZjA2U25JYU5ReFBmTWY2?=
 =?utf-8?B?VU9qRW0xUmZMOUIyTXBtN3A5eXBuOFI2YU1Ta1VYZmlXL0pKemxWRUl6VHhC?=
 =?utf-8?B?dHRGTWx5QmZTYzRUd0d5V1JibGtzMFF2NDlHNFN2bFNKanNmVVFDSUtuQmMx?=
 =?utf-8?B?ODBVL0Q5ZnpzekdSYlZYb0JjcXpadGp5NUJtQVZwcE8rZ25JbG1RbGxhMHpW?=
 =?utf-8?B?TU9SdnVsWFZOK3ZmVjdiRjM4YXUxeFg3YVd6SVVzVk9OWFkybS8rcWIxUXNC?=
 =?utf-8?B?Qm1lNUZlY1NLMERGZUVpaUhuZmNPQTNRemlyeHZxSTZ2RGhtdTNsVDZKbHlo?=
 =?utf-8?B?WlA0QWp0NndzMDE2NnVHRVVkdDRaRUh2K25FOVFwTnBrNVBLL2RFWUxwODNm?=
 =?utf-8?B?NEpSYjRzeUFTMUIxa1QxYXY5MHJoakVLL1FHcHBBa2hVYUdJcXNHNC9OeHQx?=
 =?utf-8?B?RTh1MkNlbCtoUk5yR0NHeUswMFVPZG1LL1UrUG9tT1htYmhJdUxyQnB0MTh1?=
 =?utf-8?B?RnhPUFNjNzFzWmdOdzRFQWNlZTF5K3M5cmZlZ3pTMGVLbXR6akJVMFdvRmZO?=
 =?utf-8?B?WmdCRlhvRXZ1bUtlZUN4K3c5NU9oRkg4Y1U4Rmt1MkdXYjJIRkZEMDhiZ3Uy?=
 =?utf-8?B?QzlWY2JBMGpsR3JQWk9aUXowa1k3V3U2Wi9zdFREeHlwd0pMUlVCaGJtWnZ6?=
 =?utf-8?B?czd1cFNteEcyaVpPMUJ5WllmdExldldwbG1QZnRKMEdZUXlUazV3Uk5ieVNy?=
 =?utf-8?B?amZ4UytPYnZOT1dDeDcvUVZWZWYzQmVnVHdHRndBcGVkODRBVWhkb0lpRHRD?=
 =?utf-8?B?VE5UQWxZMWpFYVloc0QvTXFVdWE1ckw5SE9VeXFLYWgwbWRubndqR3c1RXFp?=
 =?utf-8?B?TW9HcDdBQWRFbCtpaU4vUTNvRThPeXQycWx5dHl1UkN6bHlnUDFJSzdoVVF0?=
 =?utf-8?B?SGIvLzdSVmRsaHhYdWM3UW9qVWpySTlvcm5yb2UvblI0czI5K3VPOXBsYlR5?=
 =?utf-8?B?ZFVENlc5Ym03Q1N5bkdEd2crVnJka3lTNU1HSkRBUWRYTjRhb3RSMDVMaG8v?=
 =?utf-8?B?bHdFQ3QyY0N4NkhKaHo1TWxEazhYQUhxUWVDUXo3S0tVUW04Y1Y2a04yazE4?=
 =?utf-8?B?TDl3Qkc1cEUvRnBpS2d1VktNYUVvdkh5VTBWMTZ2ZkM0L2xGYi9mNDR2VXdm?=
 =?utf-8?B?dDJTaFVYS2FxeFIzNkIvZlVBbTFKTEVEL0dxQXFxa2x6MlE0V0lJeFF0QXhU?=
 =?utf-8?B?Q1dZTm9GSE0rSTFrSWdESVp2NDVsVE5VdHUrY0ZnTTNGMlgvOEVoNUNHNEYz?=
 =?utf-8?B?dVdEKzlrZUV6ZmphNmxLRVlCTDZUNnBWVkl0MmJWMmc0WC9qakpta0dLZjcr?=
 =?utf-8?B?MlIxU3NkbW5SSVQybnZ5UFZIYklldkxPY0lvVGxDK1NNVDhRb05aTkQwYy9r?=
 =?utf-8?B?YlpiY0ZyNEgvL1djMmpMRU9DL3dZSXYrTXU3VmlrYzZ4S0dvNW4yM0lqc3h2?=
 =?utf-8?B?YVkzTys5SHRqSjBFS3JVbFR4Y2ZMckJ6Tm42Ky91Wmx3TEZYRVdIMEZINzB0?=
 =?utf-8?B?ZjhJNjRQZ0NXOVIzcnNLd1lDN0kzQVk2ZyszWGNteVV0S2hidzl1b3NxTFN0?=
 =?utf-8?B?dUxLOElub3Y1MUJRcTI3YnArbEhLenYwc0JnMGpLaU9IUGgzMUlVSlBYMGNY?=
 =?utf-8?B?ZmQvQThpcnhuQVlKRHltK0dGV0ZHbkc5aVBZNWowTGpodkMydmx3QU5USm1H?=
 =?utf-8?B?QVR4Ly9SdEMxYXZtMHA0bDlyUUpqNnJXNkNGamR2WG5jL2wvbDNwN2ZkSG9J?=
 =?utf-8?B?UEhja2ZPdmkwcTg0M25pYVc4akUzQzVSczdzWWhNdDIrT1U5SFM4a1hhdWp1?=
 =?utf-8?Q?Y3dEX1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHBTWkRWcmlCV2lmRytxWXUrM1RuNm1VR2kwTnZ1UzEvNHJJTHlWME5rSjhj?=
 =?utf-8?B?WmFmazBMNGphdTJ2cERaVUxoMmVnQ2N6Z2h1ZFo4VGlHVExLQTRMeDBYSXFr?=
 =?utf-8?B?Z0xPVW1zUC9DZ0lidnpUai9OVlBCRG1sMHFYRWx2TGJaZis1QlNoeWw2L1Jq?=
 =?utf-8?B?QURwbEhWRkNPdmEzT0xLSzJ4aVQ5SXQ3c1BjR0M2YUg3TmN1anNsUWtNZWN1?=
 =?utf-8?B?VzFCSis4WkVONElLN1FyQ0Z3NHBhMVUyYnp5ZUQ0bWNQNUlsYkZFblVlcUF4?=
 =?utf-8?B?a1Y3U3B6OU84aHlaaUhXWGxBa3lFemNlTHF3UjJEY0kvVHZRSnA3SHpzVGJW?=
 =?utf-8?B?Y3NBQ0x0OTFzNmZzK3E5SzZEQkk0Y21CTE13ZTNETytyLzZFUWpVeElSclYx?=
 =?utf-8?B?SE1IcnBYL2RWSTZmTjY4d0I1UUJEdEhOWHNIYXhBOFd1alNneUpiZVAweThj?=
 =?utf-8?B?UFdmZDdTaHY5S0JoK2IxdzBNVmJuYnE0Smx3MHJwMjYxTmZRT2xYS1JEcTlj?=
 =?utf-8?B?eXl0ZndwUGJtUE04WFhoREViVjNLWGtnQVc0VExLejFJdks5RnRORUhlMjQx?=
 =?utf-8?B?S0QxaEplV3p3QWkvNEQ1RSt5dlhVMGFOd2RXa2RmcXRjTEdBM0pCWWhIWVUz?=
 =?utf-8?B?UW1TMThKTFVHVVA0c0lWeXczRjJ1Y1pJQWVyTVZZSzRraWV3T2JZL3pEbkFF?=
 =?utf-8?B?T2RwaHhFd09hTTdNYk1WU1dzMFczcjNabGs3VWljd2RPQk04MHhzZ016UGdJ?=
 =?utf-8?B?RXFJQ1VpZmdIbVRFaTRRVmlZOFMzQmhVSEVxL1Q2ak1DYVgzbWlvTkhWZ0VI?=
 =?utf-8?B?WWM3N1VzbXpxZm43RGEyamZQaFFpZWdUMEp4VFRZeU0xNEJMbW8rYml3Y0E1?=
 =?utf-8?B?S3NtKysrdHcvSjQrTk9Za2E0dlZoNzRTNE1jMXhpMnJrZmo3ZzhWYnFrdTBP?=
 =?utf-8?B?TjQ1OFZQWUNWeWMrWVdtQVltdGtISlZlK0hjL1laTVBQeTRjbXhRU012dzZv?=
 =?utf-8?B?YmtoTS9BbHBvajR4RHhhNmR4YUJYK3BtOWFrbjdPN2NGa2RhZHRydGJGTE81?=
 =?utf-8?B?eVlsM3VBczN2MFN4aElMb2tFd0ZqYkJSanFwaFJGRlNMWDdCdzZ6UUVocGVE?=
 =?utf-8?B?MDdJNHpNZHpxbkF1WEdLYjRYRnJjUWd0ODN5OWZXVlZ1RDdyT3JyQlBhUWZp?=
 =?utf-8?B?S2xxUTRZSC8wVEdMRXdwTTNnVDBKVVJXbW56eUZnWWZCUTRrblZka1BzaE9P?=
 =?utf-8?B?S0R2ODZicVJpVUVjNXJWWWZkOVpXaTFraEdnM1luUHhHMUFOclhhM0NqZHUv?=
 =?utf-8?B?bW0yd0VNVFhFaWh0QVFTNjNEM24xeHowanlyZktCbEw1bWNqUW9hRzdIYUZy?=
 =?utf-8?B?OTdsZmJJOGRHaGQxdS8vNjRtK0h2b2RDU1N4VmUzRTlZTlBXcmJ5ckZPVXdr?=
 =?utf-8?B?L3Vka2ljbHc4VDZCVHJhelJaRE5YK2d3WHlxR2MyMk4xT1dmaUk3TjNxUThO?=
 =?utf-8?B?RytxM0pwL2lYcnROUEJFSlZDR3RYWVVHVmV1bm13QkVOZUtJZ2IwaG16eEEx?=
 =?utf-8?B?Qlh1Uy9SNENBMDN0Uytxd2dtYWpVVHRMTzRaMWFUZHFEZC91Q1BRZVdremdn?=
 =?utf-8?B?VldMVVUzTFZzRVlPZWw5QVlHVkNqWGRhOTJWKzlLcFp1NEZ6U21wV1VYbGFk?=
 =?utf-8?B?cUdScXM0UjI3ZUsySVFUL1d5L1lHRW1iNi9odndsN1lQRGg5aDVOOC9TQVY4?=
 =?utf-8?B?RVB3TE1QZTBiZDlvWjJEV1JybU1VSlEzNVV1S0M0ZGt0elhwWHRWY1I3Y1ZX?=
 =?utf-8?B?U0w2MWd3RWZSczZFN011LzBtRFRNcGpPOU9pRnU4a1FwTjM4cTZhazNwWmpx?=
 =?utf-8?B?N0UrT3hkc3hGWDM1R1ZHckcrQUJ2dGxlWWo3ZWxtRnVtZnh2amhaTkNxUDkz?=
 =?utf-8?B?dU5xZXB5Y3ZrUDNFdVRWZWtwWHg3cnZSaWJsZlJES3JiM2l6UGlYRjF0L2lm?=
 =?utf-8?B?TzNSc3hSNlBPSFJYaWRndzZXR0xBYjRKQkZtakdNazAvaFk4UDBLOFNNd0po?=
 =?utf-8?B?U0oraldRRUlQTm8zdi84ZFFyNmgwbGgzQm5ueW96Y3piVnRuZlpmbUp4Skc0?=
 =?utf-8?B?dEo1OWl5Mnp2RE04S3MwQXZuMzBFM1JXTmxzMy9aOCs0ME10WDFtZWxXL2R3?=
 =?utf-8?B?UFhoQjFrSEtuVUxmZEQ4RFNuUkk4UXZ5K01KUzE4OXBBWjZjNGd6OGR2VFFN?=
 =?utf-8?B?RTdYRjJSeS9TcTQ5MjZIMi94eGh5dE1yTjBZSDRFcmJQKzJrZUtiV0w1Q0ww?=
 =?utf-8?B?SFR3Q29NRDNxOHZ1dU8vWmpsbVRjWGYvbGpLMm1TUmZZZXdXemlOMUFuRlBY?=
 =?utf-8?Q?U3ToS6S6qNki+zp8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c809f96-a5ce-49d2-af0b-08de5ff02dd1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:10:30.2739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzPNYYknpm0eqzv944uqhN1uXetEfuyHYAL5+3WqcSzGZxhkoKmJiwTTxaJwYALP9lBti6jYu1k+uQnb8I20YWMCj7GfKAoZfGtefBOMY+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
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


On 1/30/2026 2:45 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Account for DSC bubble overhead for horizontal slices (rev6)
> *URL:* 	https://patchwork.freedesktop.org/series/152803/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/index.html
>
>
>   CI Bug Log - changes from
>   xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65_BAT ->
>   xe-pw-152803v6_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-152803v6_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-152803v6_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (10 -> 12)
>
> Additional (2): bat-adlp-vm bat-ptl-vm
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-152803v6_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_waitfence@engine:
>       o bat-ptl-2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65/bat-ptl-2/igt@xe_waitfence@engine.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-ptl-2/igt@xe_waitfence@engine.html>
>
Hi @I915-ci-infra@lists.freedesktop.org

The BAT issue reported is not related to the series.

Regards,

Ankit


Regards,

Ankit


>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-152803v6_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@xe_evict@evict-beng-small-cm:
>
>       o bat-ptl-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html>
>         (Intel XE#5764
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764>)
>         +10 other tests skip
>  *
>
>     igt@xe_evict@evict-small-external-cm:
>
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +9
>         other tests skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-simple:
>
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
>
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o bat-ptl-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#5775
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775>)
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229> /
>         Intel XE#5488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488>)
>  *
>
>     igt@xe_mmap@vram:
>
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-adlp-vm/igt@xe_mmap@vram.html>
>         (Intel XE#1008
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008> /
>         Intel XE#5591
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591>)
>       o bat-ptl-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-ptl-vm/igt@xe_mmap@vram.html>
>         (Intel XE#5776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776>)
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o bat-ptl-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#5777
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777>)
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o bat-ptl-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#5771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771>)
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o bat-ptl-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#5780
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780>)
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>
>
>         Possible fixes
>
>   * igt@xe_waitfence@reltime:
>       o bat-dg2-oem2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65/bat-dg2-oem2/igt@xe_waitfence@reltime.html>
>         (Intel XE#6520
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152803v6/bat-dg2-oem2/igt@xe_waitfence@reltime.html>
>
>
>     Build changes
>
>   * IGT: IGT_8725 -> IGT_8726
>   * Linux: xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65 ->
>     xe-pw-152803v6
>
> IGT_8725: 8725
> IGT_8726: 8726
> xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65: 
> 69c1143407ca17d556eb4e5ead7eb43b60a3fe65
> xe-pw-152803v6: 152803v6
>
