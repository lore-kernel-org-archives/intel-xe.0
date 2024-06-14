Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C03CC27C77
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 06:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1113410EC33;
	Fri, 14 Jun 2024 06:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1DWtH+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4282510EC33
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 06:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718346084; x=1749882084;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6AoPKqud/Nfcqe5S6KrzBDt5J6tFsJJ+HYe8VOE1T/Q=;
 b=D1DWtH+97SdSEgxc87YjQqCNwmatrs3V47fVO+Q6yBa0TvJSvCdzi2qZ
 zX7B/GrUxb/bBRsrOLJ4eo03vjs9FmcYA4Gbaa0MlrBcOAtu+aHBzd00x
 olT+q2r8iqE48jthz1t3IkZ2od/NQgeJIgq+7kjvPquM2dcGUwWfn1Shk
 qClhaJgde/Pppl62LlMRDQ0VFNIzgcdW95Zx/CeVJI2TvDjYuXrlNCCXX
 QyqQUYCE+x5ZtztFsiITK0M8kI3DYEWaVVHDmgZKVdpqMKVqW8jCi0zkk
 Y/BLMMSLKAyDVFpS9iZLG7ZtvtYUMo/GFPoTB8Ea4WqwmMNrrFgEo5e2C Q==;
X-CSE-ConnectionGUID: lyv5r5vRSlGgnB5uZergaw==
X-CSE-MsgGUID: 056ZuQRiSMmvoD4Z1PoThQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15366441"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="15366441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 23:21:23 -0700
X-CSE-ConnectionGUID: KCqcIQ8GSeOOAV8n6FUncQ==
X-CSE-MsgGUID: LnUM5CvITDWvrxcpeUEz9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="44779054"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 23:21:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 23:21:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 23:21:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 23:21:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 23:21:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRBRkZeBD6V9H1fCqF5V5oA8KSLaDuTzPGRbb7MubY3vc1mCY1e2oiBkckmIhuszq5rdijDRQOVkROHBbqHQz/pJsBnB4cnsS7FECtfKbNMgF3RTf2qiCVD5oUFSw77RjNnRSWQXnD/WYPvdtZriiOyJzikmALCX+AkBKXaRMfTsDa1AUMn7XL+f+IETRVnv6vcnnLgoRM1uvNmOCs/8Qbftls6ZKZ1UPLKI4m87wXwwkHiIOnlRrTj3A6hStHQMiJYjxBsi3nfGfc+5C4U9IcURf+9cfcI2HgRHnpiY8kxgk1CWCbATG0tVy0/xf+EZN2KZB8ZD6kpSBakq231ScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JX4l85CxF/601AM+g5wTSvqSZJyqx7KJcF24Y6TibSM=;
 b=m/LWoi8XXBNfkv//xIcAJOLIrmEyee2TC1VSp0sumvXNNEXoy+q9vPKUWvnsq3HQOKaOPNk5OtBLtMW8gMAZgTc92yEYZjTVfG0hE/lgrJDOtLI7bF0BPCVnV0/ZTrxM8NiL04OXDlkaayFrzQvf6LcHSal+hNXUd/VZ1AN4intda0YorTSAMpHrNtDzY+hHMy/qFU5jggJgfP6O3VYuGGEAY6+Hpdy+iqUA+iS0VOILQvsNYdv4QX/Rg3IoUq+Jqf/7MLBd+VkRe0noND+FABKGM5fC6HxDoS2lqBTYAf9/lafCOv+RkWhPIvK5+ga32Q4sG/48i+b2qhI2p6j5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Fri, 14 Jun
 2024 06:21:14 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Fri, 14 Jun 2024
 06:21:14 +0000
Date: Fri, 14 Jun 2024 06:20:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Explicitly cast to u64 to avoid overflow
Message-ID: <ZmvhN2911IV+9EYW@DUT025-TGLU.fm.intel.com>
References: <20240614051556.255455-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614051556.255455-1-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b23b820-2591-4296-2e58-08dc8c3a3172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFRxaXlyMzBzcEVvNHlBemdkcFkzcEJhWVR2U1hncnFQNUs0RitxNmoxdzRa?=
 =?utf-8?B?K0tpbHJEUUtUa3oxOEl4UzAwaTN2OUdacGp0Zk9iRWtNTHh0RU5nbjhiNjRQ?=
 =?utf-8?B?RWpreFhhZTN4R2QyNmQrZGJrK2dDQ0JNRmNhTHdwSkNhSHhrVGVlQjEzaS9q?=
 =?utf-8?B?T3AxUW1WWVAycC93czVVK0JtUGFmMUo2blk1eTFKd1h4WEJCbzNBZm1jdllR?=
 =?utf-8?B?b2o4Vkw4S3lOeEl0dFMwVlJRVnA4dE8zZjd3czlESE1ncTA0SWpjZndNYmpa?=
 =?utf-8?B?ZXl1SmNickJSdzZ5TjBiUnhLazhTODZUVEdSZmZGcmVISXA2cTBiTXZ2ckx5?=
 =?utf-8?B?a3BOWUliMUhmOXJqeHJoWlJreXhuV3ZQTTUyWlliVHlwdnlqTXNYV3RqZWxE?=
 =?utf-8?B?WVpzcDhGbmVLQ1JxTGxGRXlyK29hNGhZbi9qb0JaM2xYZkxhVk11RnQ4VTAx?=
 =?utf-8?B?SGs3cFcrcUpxQlFVc3pudnBSTitSTlRMVmxoejlPWHZaSUhtVTlKbVAyS0FZ?=
 =?utf-8?B?MEVTRW8rYVZZVUEyT0NaVTBrMy9VaDBiclJRV0NxMEtUUFk4VktiNFk1VjlV?=
 =?utf-8?B?L1NyZmQvRzhEeEQwTmRhc25sRXhKL0VZdi84a0VWckF2M09aNktadzIxeUJQ?=
 =?utf-8?B?VEdPdGtFWXZDOVZYSWdOeDk3YUFndVBUL0grNFIzRHJuRU9waHh3c1Nodmx3?=
 =?utf-8?B?SGd6Sk52UEVueGRPYWx3d3FDY1BoZk9RR0hVcjgyZmJNQk5jY3BBaHpZbHBT?=
 =?utf-8?B?MDEyWWFXSHJTTjhWUTRreFZKQUJjZmF2S0Rod0ppL1h3ekVNZWo2c2pCWW9Y?=
 =?utf-8?B?bjJabnRxd29IMDhNeVdvY0pTc00rMEdBZzhMd1BMRmRvSmp4QTgrenBhT3ZP?=
 =?utf-8?B?YzQ2TjVnSDRhVGdTcWxaYmYvUVdBS2ZrdmVWZHpQT1BZUGFoZ29ZenJLaDc5?=
 =?utf-8?B?TW1FdkliczhUYzdrN1prZEh2NDNEcnRiUk5mZmpveEJocFBMcE1YN0JRWlZt?=
 =?utf-8?B?SXFwWklVU0Nianc2eFY2WktsMDBVMnovTnZYY0h4OUUzaDhIZy9RMnhVTnNK?=
 =?utf-8?B?VHRpTkhReGhIRy94VVo5Tkt4WGlXRmFmVXl1cXd1QmNrSEpQMCttMDdNMjBU?=
 =?utf-8?B?UVgzbld0Vi8vckRlOXhvOWRxQlowbXRwb0kzVGdFWS9tUEpNQmFLUVdtQzda?=
 =?utf-8?B?b0N0Z0ZtV0FDTERDYkl2UnJaYU9JK1ZtZ3JoT21QK3NHMUxJc21TUFV6eFNO?=
 =?utf-8?B?SWxvN1R4bkFyY3BMSEtsbUFaMHg5L0xnRW85OFJSb01TTHpQYVgvYlZIU05k?=
 =?utf-8?B?Q1FycXF3bU9HYWFnN2w2L2dTYk13VEpnamJBd3hZeVVsbmNoMUhvdjhyVjgr?=
 =?utf-8?B?UmF2UEFtSTBMZE5pT2lyZWIzUTV0WDN2WGhZb281NFI4RUZ6eUdJS2JJcUVW?=
 =?utf-8?B?MjFvZEErSTUrZjh4QmxxZ2pXWlEyaUMwdGd6Q3d0VWJ1S3lROXJlMXp3Y1dy?=
 =?utf-8?B?RUgwWGsyYUxoUGc2a3doWE5KdEtvK0RBcXRnTnlDeXBLSVd6ZjJIMFI1R0kr?=
 =?utf-8?B?MlJYc3FKcXQ2MGJOUjA2QzZxNm5DbkZCUWFMU3paNkR2WDNQRmlDTFlZNnZn?=
 =?utf-8?B?RkZFOGQ5M0RHY05tWld6djk0YUV0b3BFeFN6cDdITDlJUVkrUnVSMWdMQ29I?=
 =?utf-8?B?NklnUzBoY3hrYjJjaWVxMlRDTGw1R1BpVjU0N2dkTjhBaGdWVWpNS0FEMzdE?=
 =?utf-8?Q?qmclmyWkB8hB55932XnF4yJzAAoZpLqzhZqHMuP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3kzNFJqM1hvRGhmY2R3MUIrbzJQMDlMT081YkE1MTFZZXI4VW53SzhGZVhJ?=
 =?utf-8?B?azBPUC9lalI5Zko4aVdNLzA2QmVWUzJtZFZDWTcxY2loc2lYNmo2V3VUekV1?=
 =?utf-8?B?ZkVpN1hZNmgyTGhvK2lOdldQbEdGTEs3bnRlYWp4dlJtS2x3cEJDOVdJa2hQ?=
 =?utf-8?B?WW9mdkdPS3E5R1ZGWXFwMEUraElLNk9pcCtMRnRJQmNjbmRPYVg3NGcrSU5n?=
 =?utf-8?B?cjdNSm0xWENIV3ZURkJIMkEwK2FlQ3FxSlN6dk00RWxZYlEzazlSQnRjTDlN?=
 =?utf-8?B?anJUUzhaVkQvQ251cjVSWEFTbUhRMWJmOW1FNDZ6cXhuMVpWdmxJOFZSS05x?=
 =?utf-8?B?amdCdXlhWUJYRmlpVHMrMUR2b21YNXlDSjJwaXdZRTN4Nm9rcmZzRG1OcGFo?=
 =?utf-8?B?VTgzczFvNEFRYmw4ZlJKd1pxdEtiRmUxbjdoa1JQajNncS9NWnowc3ZFNGIr?=
 =?utf-8?B?ak1SNGNoUk1NSEV3NzdDL2NSejFZTEpybm9PQWlTMXNYc0YxY0dmaDYzejJu?=
 =?utf-8?B?VFdEM2EyWldOVkxjRnhzTmxxOEljc3lrSE9NTTN4VXYzRUZkVmlpR1JJajBV?=
 =?utf-8?B?UXdLWDVmUnpSYUxzY0tZUlVrMXN4K2RHYnBycjUvT01Hb3JCakZKQ1dQSkJ1?=
 =?utf-8?B?WUMvVitiK2RpOEJ4RHlHUlUyYUNmbjl3QXdQODVpYmNqZVdvOEFtVXMwbU5O?=
 =?utf-8?B?ME9SUjNvSUIyUDIwM00vVFB6TnRiOGoxVVE2YlkrYzNLUUxIakdjbnF3NUFz?=
 =?utf-8?B?NUE3TkFRVmxtTWQ4RW5qeWEwMFRhVDhoVUdvNWlQdUJvNS9ra2FhV2NkOEtZ?=
 =?utf-8?B?OTdzblE2dTRxVkUxaG1VVkh3SWk1aDFFRjFZdVE5UGY1R1pxUnU1RTcxRnN0?=
 =?utf-8?B?V20vcEc2YXRYQUwrUXJBRzhWVG90N29PNnhCL2FXQUNDV242ekxQVTZGY25q?=
 =?utf-8?B?bXFZWlJja3A4MnZyVTU2cE5BNFl6MStHeURQSmdtc084Q0drN1lScEl6SU1Z?=
 =?utf-8?B?ZGNOd2NucCtFdXhZVzg1dGdEd3YwdjQrczA5M200eDUwTEc5dXNCTkl6Uk1t?=
 =?utf-8?B?L1hVczZ2YTBRaWJzelB1cmlIRlNBbml6cG91elcydFpxQVVmVWdjcU1Rbjl1?=
 =?utf-8?B?UStnRW5ub2t6MUE4ejdnaXV1UkFWaVRnSGdnUnd0Z2diT3FkNHBqNE9VYkNV?=
 =?utf-8?B?dFNwSURIR2NsUXBrM3Z0dXFkS0J1cTVDMitwR0gxYjNnSkU5UDdBMkFNRmlP?=
 =?utf-8?B?V0txZlQ4cGlkTWF2L0dYcHVqalhkYnM2elFtM3dmcVB3MENrdHFDZ1VEUThC?=
 =?utf-8?B?VTZMeXdDOXdNcjVmZXU3R3VOL05LVzdNVDUveVZNaGpBRXBkNjZPUWRmTjQ0?=
 =?utf-8?B?TFJFN3BNSWg4eDczaFBHSmhWZndSTXFpb1grV2RKOFFiblBtNHRMcXRoSkpH?=
 =?utf-8?B?K0JqMkhqR3p0ejY4YTlpeEJJWHJUclhTaTE3SDB3UXU2SlArL2RPcFBSRUNq?=
 =?utf-8?B?d0J0L3Z6V3o3cHpnUnVrRGlLZnZzZTlzK3VEdGVac0dYSkhnbHpYZXd4S3Za?=
 =?utf-8?B?RHJzTjc5R2FFQzE0UWJJTEZ3YWNFQkd4WWpHU2NkRHJaak5mWC9CWTZYOU15?=
 =?utf-8?B?REJHQ1huMWNzY0pIRnNJZ2FPbUF6QnZ5bGRCeXFSeHdGVW5SbHhUcCtqUHYv?=
 =?utf-8?B?WFhwWjZkRlRGd1Z5SFFCRHhEMTFlY0ZndUs2WGdrYktqa1ZSWElDYU52UG92?=
 =?utf-8?B?YXh0NjJwTWxVMTR1ekprbTNGM29TaFdzVjBZOStQNCt5cEtPTndiWnF4Y21F?=
 =?utf-8?B?L0Q1eEhrTTZBSmZtS25mV2l2Z0lnZTAxci9YTDdwVDVjeFJUeHJiMXViY1lX?=
 =?utf-8?B?VThKMGNLNE5xaDc0M2hCSDIyTDFPaFpxcmR3YWxSSkJwR3pqY0trSWs1MVJm?=
 =?utf-8?B?TzhtcWI2Z0VsYzVtU1NhTDZ1dGlRYlRDU1VPM3lqTkpjejNkMk1NRUNYNFIr?=
 =?utf-8?B?dDRhVTNURWpUUGIwWHNoeldJZnZtZ2I4SHJzUVQwL25mejBQMWN1UEFpMU5k?=
 =?utf-8?B?TWV6V1NEVFFaL2x1VG81TS85Mlk2TURySE5PUEh6eHF1VVUrTHA0NTZtSXVw?=
 =?utf-8?B?MVN4aldrY0RGc2ovUlByaVQxcHp2U3pJQWtoTDdNdUIyZWtxbVV2UUJVZFQ3?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b23b820-2591-4296-2e58-08dc8c3a3172
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 06:21:14.6164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnXC4mzqTGriYqgW/scOq2qjnX9K64GvyJj2DBGBI2+bX2fzxOMqJqt2eaJMWry43gunQ7YbfPkvDrLdjFLnzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
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

On Fri, Jun 14, 2024 at 07:15:56AM +0200, Zbigniew Kempczyński wrote:
> Without casting whole expression will be calculated on u32 what
> means adding U32_MAX effectively decreases the result by one due to
> overflow. Fix this and use explicit cast to u64.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 74552391dc5a..347773f003f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -967,7 +967,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
>  
>  	if (ctx_timestamp < ctx_job_timestamp)
> -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> +		diff = (u64) ctx_timestamp + U32_MAX - ctx_job_timestamp;

I think the existing logic is correct, it dealing with the wrap of a u32
counter. There be a better way to code this though but this patch
doesn't look correct to me.

Matt

>  	else
>  		diff = ctx_timestamp - ctx_job_timestamp;
>  
> -- 
> 2.34.1
> 
