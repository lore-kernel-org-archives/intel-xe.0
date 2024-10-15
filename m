Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32883D1D895
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 18:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17AC10E5D6;
	Tue, 15 Oct 2024 18:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDH7c5jp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D9310E5D6
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729016071; x=1760552071;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l3UVFpKvrjRLh53pZBX0LFscArtU4C/9qYYgejQ3SzY=;
 b=fDH7c5jperawZpuPpBzyoLwKL44ehGlz1r1HWF8Vd0O6Ob3+Ql+Ab8dQ
 mtKjuVprtVNIge3MJB3fwF3fXT/tNYvnXUSo25HCsChsUu+ecLFYe2uiF
 nJvLNj40vAswbG1xCzpoyiOqAK5ps5NfgQ7YtBQUfPg7nksB8UFgs1Hkq
 GGf6lyrliX2tkJSHlrQliQ57nOIK1KqSliszC8wtVqGTEZtWfl7zqT99X
 AnfRM/QW3pJ+uNAvHcMvgqTndK4JvzABqaaOp4yknUdLdYTagBZxwAQE3
 pGLiPg7cDE82F/mTz6VgPjn6wb8Vw4jP60hokgzA1DfpLCEYhTQJjl8cG w==;
X-CSE-ConnectionGUID: ylwEEUMUQiCS8sKbUHCloA==
X-CSE-MsgGUID: ofUTx/OWQHCuXeQY1mdWCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39821128"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="39821128"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 11:10:09 -0700
X-CSE-ConnectionGUID: 63vqfAIVSmCtEigx5tD6Ow==
X-CSE-MsgGUID: gsmOwSv8Qq6OC+Ju33OJtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78160032"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 11:10:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:10:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:10:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 11:10:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 11:10:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MK4PgKpBFr1R+U5XoyuQ9xVAtz2lCMmJm/D/AVY+ooTJalY1uA/qIAKyvkWiC5aMIwR8Lm6FqIk9Vo5VCnTVyCFrze1lMAGxo1j6dX2ZCIDSpXtB9s326sjehPPpx9/+hqXyHfHSdDkKj6OwYEvtyboxLWAahCnRFpB92vAfQGe0EyE6Lfkh/AHW3Mp5uKcOIeRiJoMCF3XZMbjB+0KQz0jei0RoXIvdkdPLrqkgACLUo0qiNaYt3a47MI/dmHSWOMbvYeLJvAvFsP4vFrrHhROniP86KziN+Zq5FpOgw5jvKbaUHphmGB5Y2u9o0v1ZwRxXSwDV9nvg+raWaZomzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oxDkEK3W7CYMcCAImFOqfp6hN1s/VcQ1kRakRr0UXQ=;
 b=eJ+zx4HLa+438LnuejVI0s8EUXjw6eXZFPUc3HlrCl+ssoZVv618hdCZUfe3vIf0iSMrcLdZXDdBrOu5L86uK7zDM+VNJsozycQ1M/Rm8mXn5e7vLC1nfURHDDlibZYn5ppxiisLequnay/GLI2uxK5bBv90VMHjTwBqh63FKkNyp0zCs0siUQj/ws/4obsixydmbt2etp9iqQQp2vWUY+d50refAqdmP8UDYtypWnVLc4MKSdu/D3bpuTRhIWVBE/g+ofNSp2oyrBURrs8o9dtTTzEu6WjOqdkJw/8FezcVlpiyJ/XgrPFVX90t038/l4ferX0h7Q+MgfGqyXKwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 18:10:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 18:10:04 +0000
Message-ID: <1a5d18d4-d471-4b48-ad8b-a6887c04d811@intel.com>
Date: Tue, 15 Oct 2024 23:39:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/26] drm/xe/xe_gt_debugfs: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-16-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-16-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: d9eba959-94f1-441d-7062-08dced449804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzR1UXFNcVFhQTFWWGFwYm4weXIrUW9Eb3U1a2M1Y1p0Y3dvUHBJdmZpMlRt?=
 =?utf-8?B?UTBtQUV0WU9HUmRoTHZKbUNqT3V5SVBYQzArMkJEZmtYcDdLSUNDd3VzdXlG?=
 =?utf-8?B?ODRlR2VmVXJ2U0Znc0RCMVg3WWV1dnJPd2ltMHlDNGMzZlVFMllzTUN4MVAr?=
 =?utf-8?B?V3VRYUJybFRiMHRXVUVOalpUOUxtNllEK2NQLzdTNkxlWTcvS3hDRFZ2NkJM?=
 =?utf-8?B?NmpnNGdrQjdqcFNWY0xGZk1ucmFtRzdBTnRaQzBHQ29qeW16WjFJVENwR3JU?=
 =?utf-8?B?RXoxVy85Q2g0NHZTemR0blJjR1R1UFFMODY0NlRDTmpJaEJzMUJqdTYrbTVV?=
 =?utf-8?B?dEVVSi9rZDN6eTVzWDdndUZ6V2FENmtwdWUwdm50T092Ny9SRUoyWHd2N01a?=
 =?utf-8?B?S1YveWJXSHFqcUt0cU5WWmhvb2xyQUsvVnhPaVNTaHBrdERCcUFSd3VEaGxk?=
 =?utf-8?B?R01oWFN4Ym9WaVZnbXdkSjlQVlR4V3htOFh4Ky8reEwva2ppSUtIcG5DQ05l?=
 =?utf-8?B?VmhQMnFwMUZSTHpkWTEzYloydlhlbzJ5dHdLdjNESUg2Qyt6RWJqVE44czUz?=
 =?utf-8?B?NTVtWk54S1JMcTRUQllwV2xqSVh0NkgrdlZSV1BMNWZnNkNENGtYSjAzU3o2?=
 =?utf-8?B?Qk14QzIyRkV4VXc3U0R2bUpKdjFiNFRyYWg1MHIrNlNwckx5UVE4S0RYMW9w?=
 =?utf-8?B?ZjVnd2tPRWhocjZoL1VRSE1IRDlpSmJUdWlMWVF3Rjhvamh5MExTdVp5c292?=
 =?utf-8?B?U05pa20zU2RTazdzM1dPUGlmaG5hb0IwcDFIWUR0clpqMk1EM2c0dEk0Yzlm?=
 =?utf-8?B?eWtqNjN4ZnB4ZVhjenZkQ0JYZ1djbjhOSW93WVJyS0xvaFg0ZDhsVC93UGlp?=
 =?utf-8?B?cVp5RmozRmNscUpNMUw0NmFITkZCTERmVVZnbzVtMlpWY0x1dXp1b09JWWN2?=
 =?utf-8?B?dlRzT214QzQzSmpOV3hoYXY0bXl4dGU4Q2lzaU5uaEpNSGJ6NGQrb2R2eGhn?=
 =?utf-8?B?SFRkSm9uYWExaUV0enRwWE1QQnVESnY1QUJ4a1V4QVQvZ3kyeGdXcW9YRGgz?=
 =?utf-8?B?YWdxV3lvdGRlanFZMzRiM3pkVEpqODYwWFU1QldDMVRoYWNiSlBZQk5wYUwx?=
 =?utf-8?B?WnFMRVcrK2VqMERBbmd5THVmUzFEZW40VTNQVWpPeHlDOVdwdVhFcEQvU1d6?=
 =?utf-8?B?YWt4aVh1U0VoUHdpK0VzWW0vdmVYME1kbVd1dnF0MVFyVFhaWCtEVUQzWHUv?=
 =?utf-8?B?ZHRaWitOVVltb2MvV1NLYWhmeW80clNiR3NiWTdvYzZNWjY1azNGQW9wWVVV?=
 =?utf-8?B?dkVNQldFdW1LVHVWa1hoV1RheUVUeWd2RzBTRTlyT2NlalBFSWNxRHFocHdj?=
 =?utf-8?B?S043eDk5R09EKzYrQVhEWGhiaUU1ZlVMR2VWTjdOSFROd3hYYmd4aEhZcFc1?=
 =?utf-8?B?Tk50Q3NKaGFNS1ZJaXo3U0dFdzc3QnJIODRhL0hyOVhNWDJaZ2NqRDdMdjlO?=
 =?utf-8?B?eVNGVG55dFVrS3hCZFMxT1A1RDY4L3VySyt2c2F0YXBDWEUxeUhyNHN2b3Ri?=
 =?utf-8?B?bzdvREZpN0pNdU5nUGFCMEU4UUI3OGdLOWlOM1ZQWC9xL2dBMmh6a1ZkNmkz?=
 =?utf-8?B?MFpLUW56bFVLVU1JZDEweVhMb3dJUU5xSWVoR1h1Qk5vMC84UDNSRjV2TUkx?=
 =?utf-8?B?UmhEbk1vTnRxOEduaFExTWRTUDlhNnQrRnlrZDI4WmdpRnVGeWRRbFBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVUzWGxpalBMcTZYdS8zTkYvY04yZ2puSHZabCtrazBPRzJDTnZ3eUpiUmpR?=
 =?utf-8?B?UjArZlkzWGRUN1RBN2J0QlU2U1JiN2c0d0wxUE1kbFNQRStQVnlYN3RnM2ZG?=
 =?utf-8?B?Zm4xZnVRZE1LNWtMbnVXdE91RFVmUTZwUXpLY2dTWTlML1V6YktvZ2ZaOERu?=
 =?utf-8?B?RE54Y2RNaStYRVN6NklVQVZNSWl3K05UOVFtZkZoZ04vRUprVFNaSGlLU0Qr?=
 =?utf-8?B?WnozOC9mQWxxaWMyakhwNHRpbmxnNTRLWlYxb2NvZlpiSXl1QnRocVNTVWFo?=
 =?utf-8?B?SWI0ZHZBTmxrUjJIQWxkbmNSUHh5OEZHNXYvSHh2ZEI2N1R3ejRyOU83R2E2?=
 =?utf-8?B?cXZ2V0VHQlBoQVlWMm1HeWxMYlRCYXpsZEpiRFZwTHQyc24zMHprOEVOTEtp?=
 =?utf-8?B?cyt6aWVlNnF3cTJXZVNnUkV3WE5lekJyVDgyMm04dTBvT3ErME9yMnZkREhZ?=
 =?utf-8?B?S2tFbnZ2anp2TFhUM1V2eVRaYzE5aW1mQmF2dHRqU2ZiY1R0MnZla0V5MjRM?=
 =?utf-8?B?UG9QWlphU05aOHBXUm5zMktZYUJ4TFkzSWxIdDNYcTllM0pVNERZSTRZRjFq?=
 =?utf-8?B?eDRyKzZOUFVMQlRIVmtHRGtCY0dhTUpXVkVKNEpBRDJvSjNDaEhOa1gyVTB1?=
 =?utf-8?B?cEJnVk5xS0pGeUJMai8rc0ljdmsvZHVYRHFRaTVWNjF6QzdmNGZtc2tFRzda?=
 =?utf-8?B?YTlaUm1PRENvTGRPYlg5clkwWnJJQWhNMms3czUxdFZwQTlDbjhwek05OFlz?=
 =?utf-8?B?bWRvZVpFb1l3andjc3JOejBBSUFQYldtS1U1WTJPZzJLd29hSnJLK2xDZ0JL?=
 =?utf-8?B?cGtyN1IxVFYrWUZaZUNGVFpYVytNV0pGNUwyR2NmTUZ0TFRpd3U4bmEwVW1S?=
 =?utf-8?B?a0dSeWJlZmJXWE5uci91eDgxL3k1RFNvOVNMOGhIdmU4VVVuN0JSMFcrcGRr?=
 =?utf-8?B?OXdiSUJYZU9sWUVxb3V1Y2JscFQ5azNIQUtsSCtxVkptbzZJeURFUW9KQ01F?=
 =?utf-8?B?eGVaTmV2ZStydnpGcWljNGJTVXJxZDFXdVU0dHlpTWN6VUxSb054cVQ0Yy9C?=
 =?utf-8?B?VW9KTnBvaFNFb0ljOXcvT0tLNVpIS3NzT3JFQUtjUzE4VG11cG1ma2RGRzZH?=
 =?utf-8?B?RDFHRldpWmdNV3AyWittYktwY1B2Q2ZoeFlaQ05nUGlOVU92empRNDhzbnk0?=
 =?utf-8?B?Y00rME1IYXZqL2Y3cnhFZ1pOTVc2SUpzb0ZEcEprbW9PSTU4N24vVFRZVlZF?=
 =?utf-8?B?eS9nazhub05USHVjVEkrMTlaUTBRZnZndmNsTWdmYmpUVGRxL3F6Skc2VWNh?=
 =?utf-8?B?V3BNZWp5ZWdKSmE2RUJvTWZXTkNlSTNFS0JCUExxelhHUnNNSW1qMWN0TjQy?=
 =?utf-8?B?MTBWZEY1cDBPS2hwcXRKcU9NMktzcDhyUit5UnllSW5QVVlvSGluNG0zS0Nx?=
 =?utf-8?B?QUc3SDB1LzdhZGlUS3ZEdGh5MEVoTzRzcXN6bGVubFdYQUl1c2lTWGswNGlR?=
 =?utf-8?B?K0RoUVM1b0kxbnN5d2Y1ZWV4NUlIYjg0dUlTMUJJdWFKWHdiWGEvMkl6Q25z?=
 =?utf-8?B?TVRydXV2ZmdrbW5QMmtkUEdQbHhnUWE2Q3RyQlU4azVFVTlDYXFQTHZmVzdK?=
 =?utf-8?B?blp3M2pyY3BsRGRrbC9RMnE0N1RGWlpKT3FoViszNFR1MFJCSkJjaWFwcGlQ?=
 =?utf-8?B?Y25yVjNaMUNTSzZCdTdtbnIyb2RCWUJmWE02NGJ2ZmoyZ1Bla2dJcUE2Umpx?=
 =?utf-8?B?NFNialdWcnRLNTZ5ZzcwQjdGTDAxSWR0cjdLZWdQTzVmTEZZT2NsQ1AzUk5W?=
 =?utf-8?B?QzdOWlBycHdmOTl4bUZaWmpGbnI2Vmp1Y0U5N0ZJalV4RFVVcDdsWkpTTGtR?=
 =?utf-8?B?MUtDZEM0S2lKRFFqaHd4Q05HcjRiMkdhcW5mWnpKSTNMcy9qNWp4WGRNeEpQ?=
 =?utf-8?B?Q0p5alA0MmFjRElIKzYxdkJiclhtWEREZTVhU1ZTY05wVktBVi9wYVVCUWN5?=
 =?utf-8?B?K0xhWmdOT0NHNlI5UllYVDBhd0hsN2syZ1dHbGoxdDZzd3Y4QVhIU3ArS1k5?=
 =?utf-8?B?SHUwbys5VUVUdlFKQmwyNTdQZGJXaXd3ZXVEYXArcUNIaENrY1FLYS9OQm5I?=
 =?utf-8?B?Mm5UNjVKVGdNN0taRVFnRGFNR1VOYjVWV01GQVVGbkZsQkxRbEdBemdlZTdF?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eba959-94f1-441d-7062-08dced449804
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 18:10:04.6965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xagc7MBpt3qOJ6OsTDWRUZ3N7jZ1hvs1Yt6FRszE11bsdwN5qofhJybuXHTd9BZ349QIXOHOoHlNEyAiv4baUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> With xe_force_wake_get() now returning the refcount-incremented
> domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does
> not necessarily indicate success. Use xe_force_wake_ref_has_domain()
> determine the status of the call.
> 
> Modify the return handling of xe_force_wake_get() accordingly and
> pass the return value to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v5
> - return unsigned int for xe_force_wake_get()
> 
> v6
> - use helper xe_force_wake_ref_has_domain()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index cbc43973ff7e..3e8c351a0eab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -90,22 +90,21 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
> -	int err;
> +	unsigned int fw_ref;
>   
>   	xe_pm_runtime_get(xe);
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>   		xe_pm_runtime_put(xe);
> -		return err;
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);

Move xe_force_wake_put above xe_pm_runtime_put.

With this comment resolved this is
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

> +		return -ETIMEDOUT;
>   	}
>   
>   	for_each_hw_engine(hwe, gt, id)
>   		xe_hw_engine_print(hwe, p);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(xe);
> -	if (err)
> -		return err;
>   
>   	return 0;
>   }

