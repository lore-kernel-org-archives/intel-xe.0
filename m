Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DF9C27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 14:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1B6113662;
	Thu, 30 May 2024 14:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9J4l8bb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6380C113662
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717078891; x=1748614891;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5AJz228loxQC4n2b0nU7cqoVY1tIilzgqjnvZSrja2E=;
 b=X9J4l8bbo9gA6ao0A1DcipPIbOr+r21iBnwac+DQMfiqvV8CjY5pp0W8
 F11cG6rVquPZb1k2ozjL+KFsenpdddLWQkIBVL4lK1WMcUxGx6Uwc0NWd
 BAWY32hbfQQdsvPNB/5PZ2DFpk6vHnGGNU0W3lnMj95pfSi/JX7Epq7jH
 kIpFR1K1kEs6gISUUHwEcb57XZCvJw5uMc8TTDdxcur9uVHJnvm0fTKAg
 pT+Zppd8fwogs1IZ3TtP9jxAoi9995OOOm3LFEG2poJCwx/YpzmDz4/zc
 yvtfQC2ctljWaHDcs3Pnph9RcfxBXgBUEAn0KE+/OeV+YPZlqU4Iy1QXw Q==;
X-CSE-ConnectionGUID: bZPL0kaBQE+0ITEPey/3Eg==
X-CSE-MsgGUID: rgpG6RirQTS8taL2RPeMIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24180002"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24180002"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 07:21:31 -0700
X-CSE-ConnectionGUID: AdEF+rVLQxezG607NmfIIw==
X-CSE-MsgGUID: gN+fBAtfRsOLLuESkLBGyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36315163"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 07:21:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 07:21:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 07:21:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 07:21:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 07:21:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ww3IE8gRkli7UttjJMCMMNDU7D8sUC6fZbaVOqAY2/nX8Qz7Ue3qtQUBGEWLJPDpvFb00g6mfuDCCI4gMPi2+dmlh6sObW/MvOB1qvooWQkrfHJ4NGmT05VFZm/6NEp0jMS2m++bD0EtfZZSnOJmB5b0QRTKGN2uksC0NldEz041S2lz2+4uo0+DNHPcO9PBUw+nqmlphu4vsPRxLQ05+DA+87CBhPVagDVEAjfuPvqnG7pcyVAmrgesY6jziKYI2bzID5iLTGMtJ0n962ggK474Vqt6lVskoJYLQRCxXDSEBsvn9QCfjLwU2/up1Gpm+0f3bLdwiEdci0eTO2WYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EwpCkMvn8JWhsWpwiYTbgs3axvqt43U4sUtH3br5VI=;
 b=WeNTMRQXynGMMEOWx2HK+iX//JKU537ZUovH4u8zEKS+/R/IJG5ZcMqNRXBatWo7aYCfRdBPmmjSMPHvnQY/qtZXtZe6tT3MvSzePNCR2LI69/DB2DNHGB571YjqribdFjLbosZx/5ePZY+QgS3S3FsFRupEYJ3lQ71Cd3OBnbgW7648K4w8mJ07SgYftvhzGTAuZzloz4RcvTiJZ2AeDdDYCWZPHpCFS3UYViL1qJUh+jfAEiivkSJTdVDlQX2cYBYxiYsQPf6hI7hqkxVoSBVrEuc/2fbh5fFypVtowf6LeUiVA1mIuFhJL9JndIJ3YGcT9hHu6eQecS+vz+eDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 14:21:26 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7611.016; Thu, 30 May 2024
 14:21:26 +0000
Message-ID: <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
Date: Thu, 30 May 2024 19:51:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3cd646-e653-45d9-f708-08dc80b3ca16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTFONlZWemMvR0YvWi9JQnN5amlZYXZDd2FLUEU4QjFzL0ZYRmpvUE5ROERr?=
 =?utf-8?B?RDgyWTliWGRKYUVzdVdLckdxWmlCdUR5WVdTN05GTlVsZTlkUEx6Nzhjai9h?=
 =?utf-8?B?cG9pajRXWmp2ZXUxMDVuSlY5Q25DR25IekpLa2xFNUd4MVljeUZFYXQvc2hM?=
 =?utf-8?B?Tm5NZHdoMHJzakxJbStGVU04aFRzaFNpZmpFV0JDa3dLL2JJcmNpcE5hcmRz?=
 =?utf-8?B?UUVYSGVrcmRlcVpRSE0vV0xqVTc3UUlYbjNVSVdKMVpZRm9QZit0eTd4ZFEv?=
 =?utf-8?B?dFpzWEJtWHcyTVI2NVRqUjBEQW1iY0JrQ2dCMjhTaHh1Zk80bmlOVVZXd3lR?=
 =?utf-8?B?ZndQdmNuOGtHVWUzSmFaR0FIazh6WVUwM1h3K284NmFETGFPK2ZxSVVYMXc3?=
 =?utf-8?B?aTF6anNZVG00SGtyaVlVRSt4NFRJa1FBUEpIZ2FqWENkb0VaTDRONFZsc1l2?=
 =?utf-8?B?WlJKTG1MUVhhR2F0UmJ1bkNwb1Q5RlBocGFUb0RGeG13YzEvb0Fha0Z2a25U?=
 =?utf-8?B?RjNQcFYrVFlmVEFPNU1oOGE1eTd1aXpQS1lqZ2xaam93TmRrNzduaG90VnRs?=
 =?utf-8?B?dnNDQmJHeFdONWF6NWZzcTFXaEhOMWMya3NIWjNYVnJobHkyNDdJNDhWSWRL?=
 =?utf-8?B?NWNpTkVZOVcyOHBRZkNqT29hVnNoTVc0bVZleCtvRDY5YWZuMCtrOEhpT2JZ?=
 =?utf-8?B?MlQxQW1iM0NJYWxERS9QbUY1aW1xU2lZMjlQOXR0aGRxdU9kekt5SU1ubVk5?=
 =?utf-8?B?emdNS21ITzJDNTRGbGtZQWt5bWcyK0JQMUUrdXN3am5vTzdzb3RhdFhEWnd3?=
 =?utf-8?B?TlI0UFhkbjZpdjZaQ0FBUzJyWUNhZU0xbFE5NWxkMmdTYU84VldEWStibDhx?=
 =?utf-8?B?cGFnOHNNV0pGMGh5Qjdieml4NU1HMXlJRDdWeXcwZ2t1VzRmRTVYODBROVVG?=
 =?utf-8?B?NHlwd3VrdkQvTE9sS1dzeC9hbUZTMXEwenJlbG1zYmhxTVdRVmNsVk4xNVdF?=
 =?utf-8?B?amVQbUZrT1ZpbGw2Ri9QWi8yMFQ1d2kzODJxc3puYjg2WHpSMjRFZ1AvRytQ?=
 =?utf-8?B?TGo0QnVLVUhXOTU5aTR5NW1hQ3VuVEd6aktCb1orQ1RiRzFlWmZQYUp1TlNV?=
 =?utf-8?B?Sk5yUzU2UDRabkxGK3IvaW50bzlBU2MyeGVWYk12Mjgxamx5aGtlWkN1bSt3?=
 =?utf-8?B?dUVaaUtEeXZkZktNTVBCaGZHRmFlYzZzZ0lzcGVZSUlTeDFxdVZ2RW1tRWYz?=
 =?utf-8?B?QlR0aUFjejdUdWJvTjhiMm5TeXhxcHVwZ2VTOU0yM1pqVUMwUUx5OEdHOS91?=
 =?utf-8?B?OU9wMlVWME9UcWtnZG5FRGU1TEQ1SHJUek5DNVBmNlJaOVp0SDdFQTBXZHlk?=
 =?utf-8?B?MlphYXhCN1psZ3RNY3FlSEkrWE1qQW1lcWZFYkF6UUJhVjVsR01HTVFqYy8y?=
 =?utf-8?B?OEdSbWNjQlVQVEtvMlNPd2haWEIydFdXOHlqL0pETER2dkVjZi9VYTFENk9F?=
 =?utf-8?B?MjhJQW5PNlNERmZTeElHd2NZREpUdUExWlB3SjJsWFRycTJkTjVEdFdjUG5Y?=
 =?utf-8?B?SUJ6ZXk4NGNsN3dBRDRENkMyRmZKRy9VMjRMN0dMY2JRSE5zakVoMkJHM3Zm?=
 =?utf-8?B?U3RhOUhPUFJGTzJ2a1M0UVNZOW5xbkxEMnhvRmU4Y1o3cmhVMDVER2JKaUl5?=
 =?utf-8?B?bG05NFlINCtycXh4QlBwYVk5bEk3UDAzb3dtbHFFdkF5STA1SDQxWlVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1FraFpWVmJPZmFoR0hEZUorUU9UenBENmhvZGh5L2NPWWZiS0tjemVyMW05?=
 =?utf-8?B?SVI0SGlpM3lmUXRPQjhmTDBJc2RFcW5YVHcyV25Ed2srTFVqejBVUjVSVGxa?=
 =?utf-8?B?d1NnL05YaWZnQlFXaXdFWEg5alVtNXJ1SUpEVTFrRWZiNUxtLzFOSkNYWkNE?=
 =?utf-8?B?TlFBeUJ4L01wWkY2cGxUK3R2a0toUTV6TlQyYW9QU2tpZWdNeHBGN1Y5Wmp6?=
 =?utf-8?B?VHdBOTJ2cEgvWHZRMVJsV2Y5UmxlbmZxVmRabC9uS3JxdDl5aGxVR2JuSEdS?=
 =?utf-8?B?UUc5VUVidmh0WmNwVEs4NVRUaWpxZnRlR1c2WjhuYWJLZFNieUhQWW53ZDB4?=
 =?utf-8?B?Ni9xbVZjMlhmVDZPUDlOZnVseTl3Mk5HaWo4Y2dPRnBYTjVzT2JwWWdvY2RL?=
 =?utf-8?B?bnQ4b3pJRzlCcEtnUnlOQlZxWllYZjc0VHptOE5BSXR2aktZTUtwNHNLdnU2?=
 =?utf-8?B?cnVSYStTb2RYUkd5RHA4M2YvaWFkdWZjNEJ6MmdiWU4zS3RwVG5CeGZVMmNV?=
 =?utf-8?B?ckZ5Ty9ZOERKMGIxMnBPQXgxQnJnN0pWdTNRZGJQdjhoMXZzbXJGOEJKZ0pL?=
 =?utf-8?B?ZGRoZnBLZ1VRcE1EQWlYalY5VTRsKzRPelprUE1DUmZVcEh1bExYOS9tUDU4?=
 =?utf-8?B?cHpLMTZnZE1jeHdLajJsU0tNNVhNZEdlMUJRNVNjcjdoeHFkSXlIRk5DTGNL?=
 =?utf-8?B?cEZieEVJQlprc2FkbWRJSU5JZlpqd2VySGNtU0pyZnBzNGg5aEJiT003dGZ2?=
 =?utf-8?B?NklIb3hKV1h6SllUODFqTGt2T0NvUXZXSlFxWEFMQ1ZYZEFQdU50ZUl1Nkd5?=
 =?utf-8?B?Y1BEaHk4ZDc4Ylo3Sng3V0xmQjQ0Nmg5RkdsMXlTbVUxSlJxZDRubG01SGx3?=
 =?utf-8?B?b2N4WXQyWjRsUk5tcXpPSThJV0lYeUtVUHFqKzVzdjNlcWF4QXBrWWJZL3du?=
 =?utf-8?B?V2dORFdqeGZnSkN1UFpGQVNuRzBYa1R4TTFHUXFiRU9RdUpKeE9sT1BSbFFr?=
 =?utf-8?B?cGxzNnM2YnRvNDAwdlV6RSszQzVocDAxZ2g4eDBGdVpZSXJvbjgwdUFJQ0lP?=
 =?utf-8?B?MEtCMUJ0RXQzMU14K0dlRkp3MzRDTGVTeTAycTR3S255RnlUbVN3TWVIdnk3?=
 =?utf-8?B?Tk9SV3RiQUJKa2pEd1NrMXBIS2JvTWNJUkhiM0ZUVGlXd3BHMWNYckNDMGtU?=
 =?utf-8?B?RExIVXZLMEkrdnNwM3BkODFYYVJ5OFU5Rzh3dmk2Q1RlZDI0NUJWcFhNR3Ju?=
 =?utf-8?B?Ny9NdWpWems3aGhpMytqR0l3emNVOGpTOU5qR2ZTL1F2MFJTVWJ0Q2dYcnNO?=
 =?utf-8?B?Q2xlM1B0RUhtRllXb2ZjbS9NYkNEelVPZlJKVHZJM0UvQWFra3UzcHRJT25q?=
 =?utf-8?B?SzRqT2xSQWFEZHlab1J0MFZVMEU3NnN5ZGhSUXZUNG1TL0w3TDhoN25aRSsx?=
 =?utf-8?B?MTl4TFZrdEowL2NRSWtwSDNqcjFaV1pZc3V5SS9WNUJoaUhTb3FGQklHSVlQ?=
 =?utf-8?B?bThVQllCbDlYdGdsOWthL3RqMHBUczBOTERvRThCOWw5RWk4b1d1LzVBYjQw?=
 =?utf-8?B?bXo0b0FPeEc1QXhRd0F0d0xrbExoY1BDbGZUZjI5QjBsa295UzFKREhZd0lL?=
 =?utf-8?B?OXZLS0NPd1hzUCs2TEd1OGZEblhrUm5ZYUF6VzNDQ0FNa3dzaSttNkJnZUpo?=
 =?utf-8?B?Y3FqNHUyVXRsTzJ6WGJYWFRtUU1LbnJ0KzdFMEE0YXRVdkJDUVdBMGNVU2o0?=
 =?utf-8?B?U1p1disyS243MC9vTFVNNVpGL0MxL0RzZnBRY1FWOWJkcEs3UEY0M2g5MGhK?=
 =?utf-8?B?Qk1tYXRYaHBtMWRrbzRHMnJHNVk1YXlFWUt1U2g2bW12SkVhbk5zUnU5a0Jv?=
 =?utf-8?B?OXppcEsvT0dKTkxXcE8wTVV6NzF0VUJ4VllWSFF0b3pzak02OHQzTGF2cEdo?=
 =?utf-8?B?amxZWGxoTnYrTGowMksyak5Ka2hsekVoWnc4QnlIRTBYZjROS0VLdXU5Z2R3?=
 =?utf-8?B?RkVkWEEzczFDdXE4dFE2K0YvRFIzazVPbGhMaG9ncUI1ZkY0dGVSZkhaNmJa?=
 =?utf-8?B?Q3hDZW9wUHhQUjloV2FaODlyd1lKMFFEbXJhRlp3K0kyU3g0S2p0MnFDMnp6?=
 =?utf-8?Q?Nza1G3IdN9FjEqPz6Knt1Xu+i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3cd646-e653-45d9-f708-08dc80b3ca16
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 14:21:26.1378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3Bpg2cVbp88ZtuS0oH2knbT1VGBgNubgsPpO3EcRqxBDWRzAYSnfXoLnx0i4fUDGUp0evPvy1l7Q/45qJGPIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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



On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
> Make sure that the assertion condition covers the wakefulness of all
> domains for XE_FORCEWAKE_ALL.
> 
> Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of XE_WARN_ON macro")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 83cb157da7cc..9008928b187f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -32,7 +32,7 @@ static inline void
>   xe_force_wake_assert_held(struct xe_force_wake *fw,
>   			  enum xe_force_wake_domains domain)
>   {
> -	xe_gt_assert(fw->gt, fw->awake_domains & domain);
> +	xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
This will always assert for when domain FORCEWAKE_ALL (0xFF).
Not all the platforms support all the domains.
e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use case 
only bits for GT and RENDER will be set.

Regards,
Badal
>   }
>   
>   #endif
