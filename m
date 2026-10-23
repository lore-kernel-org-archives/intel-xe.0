Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0624606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S+b+UpAB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733AB10E701;
	Fri, 23 Oct 2026 23:04:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06ED10E701
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792796675; x=1824332675;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rbr/OO5bMJGlzn0bOdQj1NvWAS8gn0rGDmy+vyVHKB4=;
 b=S+b+UpABxsIOBygag1EzavGS6hyEoZeKxTfiyoyoE67e4pYXw2KJvm5n
 SCW/iKx0D83cathvBWolx8bGe8jAsB8RjL9ooItwdF9h7/QVig5JKHRzL
 TM5+NYOv4Fl7UwVtqHm2OL/PZChNaQoOk0GbyPAF+Z1CUrbM0UEGWbPkh
 MhmuNmMjpfmk05pycl4BZrAQBEBFwHkBIRUBudgQaqiUT2GnZGUouI7Pg
 T56g7ZwxR2VN8LD5YhDanKdB2ib1tQthRXcSIbI12ZF25b4y9Nt13jNn9
 QMGkz9sJKCbESoKKzELdtlheUF3mKytpF+K/yA44ZibmCLOiibUnm043a A==;
X-CSE-ConnectionGUID: 6uPnAiXERNyQUb4ZbNYLUw==
X-CSE-MsgGUID: tV+G7hwgTTuO7cfsvXZjAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1449263"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1449263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 16:04:35 -0700
X-CSE-ConnectionGUID: nuXEUF+jQveOsawwiWqo3A==
X-CSE-MsgGUID: r4zEowYjRJKNyd8rBC23LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3683705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 16:04:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:04:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 16:04:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:04:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiKqK4zBNpVuJVaBzuTVYLUVGlBvWQW3N/8SZi7h1dXqyv2Dt3awMKjxG9VD5iaKoKWIWngAfMBWMj5Zk9AN+eMTqoL3KU2bMu5HD6xWluKUgRPNjRzl/NbiJbfkVKVcfU+0ncc/tWI57fOQyyPQXE/zxicXQy7f+tPqHCIrRCzZfqy68dBfA0pSvoc4ieK/HxD3AxBouHR5GuEIQtKDsMiZJBKpMBHzscfeC/82GItxzARQ9U4xHpKp8+SRpsjlskUOJlgSQiR6RJyZG3vLPZc1/akZXvAS8fWQkpj1Fqgf3R6tmNGVMjHegne4svlXvm8DSjHYk1qeOvIi3rOi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRr//Z19h3QQOd280wurAzuTLGB6pcQaUSKBNG5nd8I=;
 b=S4dXKff0JPCbQeL5RPtEKW/eZfYnHV1ohsGxHDqM976xaJKl5EqiR5FuBmebbHasBei2Fmu5XIEiNy7ptjPhLCu1Ne3J7n0n0mZ/i2mS3wKBXcSemZjmj/ST+sy4KOxSzP97rvxmsmCJuLK/WB9z0PIMT+6b+qtnROF0YXXIjeJGiTKxzLNdgk2DJD7JFfl1wz3jZW40tClfrwBSeR9ngn5GRVPW9JlBo7pRV1VitZPOQORuQDh4U9zrQT7tgcAMr3si4DgtRr+cvYNJTbagmxMm/X/7hN2mWT71jc8eXzufau1Jpp2LBiFH6wNXzKZdFVh6oN9f4JRR6zWptw2GUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 23 Oct
 2026 23:04:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 23:04:31 +0000
Date: Fri, 23 Oct 2026 16:04:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>, <pravalika.gurram@intel.com>
Subject: Re: [PATCH v4 04/12] drm/xe/cper: Construct CPER record for hardware
 errors
Message-ID: <20261023230429.GB6078@mdroper-desk1>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-18-badal.nilawar@intel.com>
 <as9Zvxl3-Lx4H6En@black.igk.intel.com>
 <332beff5-53b6-4043-8b60-7c73ca780eff@intel.com>
 <03767785-851a-4b84-8271-388d33d7669c@intel.com>
 <atrHUMcymdVC9T-l@black.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atrHUMcymdVC9T-l@black.igk.intel.com>
X-ClientProxiedBy: BY3PR10CA0007.namprd10.prod.outlook.com
 (2603:10b6:a03:255::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 971ab8b7-28bd-474c-aa1d-08df3159ff20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|18002099003|261022113327099003|22082099003|261022105027099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: tftjIpnAij4GSzcI4xv7MnfwWPRGPDWHD1lHBghg7+himC55GeHPGLLhWBBXi816nk96nqo1iCD+Sq6ZYe95HmiW4ZXj0bNgm6voU+sCZlwQW0KzWYRFp1pFn6yZeupIG4akuhw7jhJVwW9SPf74X+MsCvcQC+oUYcTSl4sPIjCLJ1I9PCwirKRuvj37b7OUJ2QVy+pcPA1nnFFeVyKDUmJYg3HSca6FkpVqEh2R0oJvqFHKxEVMbRwTMnTNHH6SHb3fwCjk8VToFqCI4ITrb6Pvbij2rZzn8E/QHjXR6MU5buQHHLe457nR0ZhmrLoUOZQiXLyhawltoyyd55XXVXU2+o2KYB+Mn0yHB+DCY9bb1tuU06zbtkBDRBk4rB3jnqAc1SSuapdYNdPc2k9B67qubVeL7CNFuNfUfhEZBOejKcbg2H02uq7Y2AfvSCbY6eCROYkiY7WdokvqHzFGr0Qsyw+NjQwm1kJqmSrejzvmNtPjUNmOzzoc7Sdvr0bYuP+vjiZ83SGvU7XUs/PTRSXXSd/lw/IchWGaZNqJui7huqgcvz/Eikah9anqh8OSH2VvlYgfo0bxwCn5t0U8BTkXWEutn89lLQVJz/f70WWoh+sgGL3A8WLJNvvCShJb0mWQSLjIV/0Jng+hqHY8WlONkGdolHp+o9H2cl7mz3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(18002099003)(261022113327099003)(22082099003)(261022105027099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUF6eUg4T0RGZXc5aGErb1Y4d1NkQ1ZjMjZ4SmJSOExPYmlEWVhlczUyM1B2?=
 =?utf-8?B?amM3RUx1dWRmaE1iUzVoNEswMUJ6cTltNHA4T0xYYlZLbnp4L3ZrV0luYmpF?=
 =?utf-8?B?WjJpMnZlanVWeVNzZ3UzZ1lGaDVjb1RreDBKdjBRQlpjQ2poQWJjNTZyTXh5?=
 =?utf-8?B?Y1AyeGpKZWh5dFRXLzFDT3diU0xjNGFCTzlkWU44NnJFSTMycjZSTXVXNThh?=
 =?utf-8?B?eWFvNVcwelZDVUZiU2cwbEEwREswOEViVzdRWmtvTGhUR1RpUS9wcXl1azRM?=
 =?utf-8?B?Um1SRFVVbFUwNFlvcWlCdTVWOVo5c3dUaHBGTDRrcWswa3B0K1N0bzg0TXM5?=
 =?utf-8?B?aVN6UU04TGtwSEhkTGtJMks2S3hMUTdQZGZBdUVwZTF1cksxd0NOUkZtSko4?=
 =?utf-8?B?YW9zUGpndGhQS1pHajErRlNuSm43T295dGdzYzlVSTBObnV4SFl1elhvM2dn?=
 =?utf-8?B?QVFmNXNPb1lhNUJyUURCbytjS1ZaaEZ0YWJpSGg0T3djcDVKdlB1UFVKTUt5?=
 =?utf-8?B?R3dDN3hlcXB1MFNTbkcwczBiRkxsbkl4SUNpNXFndHl5TTRYOXA4SUQ5OVln?=
 =?utf-8?B?M0lLZGpyTkpmaVNPOTlJdFNXSVNTcG90c2xOWGU3ZzlFcmNtS0RFek9mSS9J?=
 =?utf-8?B?QVRkaEV1d2hsYndUOERSejhNQ3I0Nmp2aXRKc2x4aG1TM1ZVaURBRlc0ekdB?=
 =?utf-8?B?RCtyNkJGNWVTQXpQZ2VlWnBJSGVaRWZ5SDc3bDAwOU9Kcysvd0RPUzZwazFU?=
 =?utf-8?B?eVJWU0RnQ0J5cFgrcmppVEU3c1FkR1NwNjY3dURLVjI5QkdBZTZQK2FYQ09N?=
 =?utf-8?B?SWljbGlzczVLaWIyWWJrdW9BZnV6VUxrV2VNNkhQRHZ1cTZxZ0I1bDJyYmFK?=
 =?utf-8?B?RVlpS1ZjbzY5Vk5oRFhHL1NxKzJ2RERoUExPT3VwUElBTjMrdHFraEUwMVJj?=
 =?utf-8?B?T2hJTCtaQm85R3FEQVhwaU1jTTBVUFliQ0k4U29VcFZLbTR1NmdwdDgzVlp0?=
 =?utf-8?B?WTdiOXM1VEpONnoyZGlvR3BsaWRXdFdZTWFoSVNmQTBRenBjZnVLNU9Ld0JO?=
 =?utf-8?B?c1Z5TEJQc2ZCV3A4MHZkTnFSYVZVZ3JOUjVOUWFvbVF6TWQ5ZEJRWTlONzBT?=
 =?utf-8?B?OTFNOEtxZFlxbWNDYW4yVzNNSk4vWncrdjJPbHc0alA4a015S0tMTWdjRFVi?=
 =?utf-8?B?MHN2b1RLWkNQS29Za0d2M0wxOXBiUVpONVNOMXhSZXBkcStpdGJJVlllbUZ3?=
 =?utf-8?B?YzJ4U0VPU01QbjFVV1BBYjllbTl1bUhMSGthdUQwMUx4Y1dudVVxWld2N2Rs?=
 =?utf-8?B?c2F6QUNGNU9JT0wrZWl5VzBSSTlhVjNOWjZLOEhtVHZjT0dpTnp5ZTh2Wmw3?=
 =?utf-8?B?VDVKOE0vU2lQR1ZORUpYTnJENkpNY25ETE02NWhHUFJEYU5EN2gzM3NLK0Vn?=
 =?utf-8?B?WjdPR2VuMEVLQ0Rlbys3SjNuVHpCSTZwMFpkNUI1K3R3dm9LZko5UEpseDFW?=
 =?utf-8?B?UXN3MXhGSDdKeXdubDFXZkZSWXRCclBBdjA4T0xWOWZHeUk1a29zcHRFNEJO?=
 =?utf-8?B?R3BkTFpjNmtIZmF1d0IwQi8veU5VLzBrQ1hoKy91UFZOYkx6U0N6L2dVYVMy?=
 =?utf-8?B?Y2ZKSCtWYTh5RjNxTnpUZUVlbENLRFhCMDlWbEVrcE82eHBBcW1PNXc1TndS?=
 =?utf-8?B?K2hMQXBGMkthcnQ1WiszdEdBZmJiL245SUZCME9LeDBPNnA3eWI2U09McXFp?=
 =?utf-8?B?WXpuRElVUzgzejlYNk9GeG9WY3Zuc0dyNkVRMUFPT0hqM3BleGMvWW5lendt?=
 =?utf-8?B?bzdCYmxYK3plYzViZkppeG5JU1lFd0FEcEd3clhCNGRmajZROEJiemNSR3Jv?=
 =?utf-8?B?L01XcEZyOUc5TGJkekFoOHJZd21EYXNyR1FIemxzbVZlRTBhOWk3RHErbm1N?=
 =?utf-8?B?Q1U1S1c5d0FqeGFRN29HQWRydUJsQnFKalhxb2VNUkpqeWk4KzQrS2VkeDMr?=
 =?utf-8?B?OWdOYVNGRi8rRm1NalBtTm53RzBKTzZ6NmZJdWFNdys4ekJOMDMrMjhRTUM0?=
 =?utf-8?B?b2d3UlUxbEMvV2Rid3JreUF4c3diQXZ1RGNJVWRFUUFaK0s1WVdWdkJONlVH?=
 =?utf-8?B?ejVuU2ZMNGFMRkxhSHBDZWtCTU1CQ1BNOU4wejEvL3BQSUdEcEZESWlBbHRm?=
 =?utf-8?B?VWtqK240RUhUL3YyWTFNemRLdFVPZFJGOFJRQk9kQ1QvekR4RXB1SWtsOUhE?=
 =?utf-8?B?Mk0zMHpOc1pmUkxTcHIwcHZWSjM0ZHF2QTUrTEMza0pUZHJuZkV0OEpmaG12?=
 =?utf-8?B?NG4xaWhqWW14MElBcTlPZlBwcWVtL3ZlandkelNNcXpiQ09zcDQrR3plODhT?=
 =?utf-8?Q?5xPIbaiT5wg4E1L8=3D?=
X-Exchange-RoutingPolicyChecked: u52o7jeAndYEYJRl2sXuqhNdfjS8J0TJ+KVw30SJz7xnaWOlXNzncndwM4qZx/ItheNJ5PNouRCiqm9odEvtZJYBUuaGTV3APmP5aH0vLXCLcWe/iUGZCKtiShCpmDdMXIef4imiIwWsQCF179CH/FAG/BMYqy3k7S5L/Z5lpwioaCpDr+SC8yK17LxRT9lExDLmQ1vRsRw54sl0DbreI/XeJZCKY9R3OCAV7zmznwq9BrgWyt5gvLZRfXol/sX1R/YehcTspUG08Z9+OoPv58BT0H2cwU0F16KdgIXDKPJ40jXT8q1kGilpQbg62a5Hwsrud6GjIFJu2nrNCL1fmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 971ab8b7-28bd-474c-aa1d-08df3159ff20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 23:04:31.4186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2hR+8cYD51e3LIqtx2eyApkgOGcobz4FVKDMYuGKF78Uj1rZSURZN+7UiepeyN+UZj9JOIZqg6Eo/G4qvT08/9se4ejJSG4kflhQUu3tKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 04:32:48AM +0200, Raag Jadav wrote:
> On Thu, Oct 22, 2026 at 10:24:45PM +0530, Nilawar, Badal wrote:
> > 
> > On 22-10-2026 19:10, Nilawar, Badal wrote:
> > > 
> > > 
> > > On 14-10-2026 16:00, Raag Jadav wrote:
> > > > > +static const struct xe_platform_id_entry xe_platform_ids[] = {
> > > > > +	/* 0x674C  platform/8086:674c */
> > > > > +	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
> > > > > +			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
> > > > > +	/* 0x674D  platform/8086:674d */
> > > > > +	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
> > > > > +			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
> > > > > +	/* 0x674E  platform/8086:674e */
> > > > > +	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
> > > > > +			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
> > > > > +	/* 0x674F  platform/8086:674f */
> > > > > +	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
> > > > > +			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
> > > > > +	/* 0x6750  platform/8086:6750 */
> > > > > +	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
> > > > > +			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
> > > > > +	/* 0x6751  platform/8086:6751 */
> > > > > +	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
> > > > > +			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
> > > > > +};
> > > > This is unrelated to cper and shouldn't be here. I'll rely on Matt's
> > > > input on how to deal with these.
> > > 
> > > Agreed, I don't think this is the ideal place either. For now, I'll keep
> > > it here and, based on Matt's input, consider moving it to xe_pci.c,
> > > which maintains the PCI ID list for the platforms supported by Xe.
> > > 
> > One reason I placed the table here is that these aren’t general-purpose
> > platform GUIDs; they’re UUIDv5 values generated specifically for CPER’s
> > platform_id field, using platform/8086:<device-id> as the name.
> > 
> > Since CPER is their only consumer, keeping the mapping with the CPER code
> > seems reasonable to me.  I’m happy to follow Matt’s input if there’s a
> > preferred place for this kind of mapping.
> 
> My only concern is that we usually don't have device ids lying around in
> random components, but that I think is upto the maintainers.

Yeah, I'm not familiar with these structures.  If they're CPER-specific,
then keeping them in the CPER file seems natural to me.  But it's also
true that it could be easy for these to get out of sync with our general
PCI ID list if PCI IDs are added/removed.

If a new PCI ID shows up, how do we know what the values should be here?
Are they documented in the bspec somewhere?  How do these values wind up
getting used?  Are there uapi / ABI implications of these values?

Aside from everything else, should we also add some kind of kunit test
that makes sure we each PCI ID has an entry in this table and vice-versa
to make sure we don't forget to update this table when platform PCI IDs
are added/removed?


Matt

> 
> Raag

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
