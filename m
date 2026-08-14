Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EC6C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE8310E07A;
	Fri, 14 Aug 2026 14:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b88X2V0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAB010E07A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786716690; x=1818252690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lG7pZ2FxkQnVCym6B7HBAqjoiJ6myMQ84Jhutte45r4=;
 b=b88X2V0crqxtFVBT/PCXh2DP2DK4Ak0AWv8B68E7EuHoWaslEicdpSTU
 lFM4qje6AgB6cCovtRMwED+8JwJn54NOH6v+qyQZImD3kwB04tFdUG76O
 ePO1py72F+bTJZgN6tQeULFc2yq0czQqc6tfXl/I32DS9XqJ8dGQ/h3Gf
 xBCadu0BmZu95g6+7KfRfSkDbzJltGiAlHuvS8qf6ebXVxGXfWuzWgoeb
 1Wt16jmL66bT9c4PLw2hP2HJzdh13Dq6FNEdfZ3Idjhz2Md15mwZYANkT
 3qXxA2/LtGuWyKMUyJFDTo2GdtWKEbIvXaOzVCctml0WG6O9xdWzzlvTe g==;
X-CSE-ConnectionGUID: f8uHc3uETdC6ZRPTOOOTzA==
X-CSE-MsgGUID: pTrXzdjIReebP/Az+cEk1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87424620"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87424620"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:11:29 -0700
X-CSE-ConnectionGUID: 2h2BZ4uPSda/8ogEPSe4CA==
X-CSE-MsgGUID: 0DTptIJQRH+hqgFjPR0HPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="302475986"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:11:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 07:11:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 07:11:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 07:11:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQ/o7fXK+XtE/a+2e60MS3z63apRll+Gtkh2pWSW8nb3TLs5CF5RYuKoY4N+poJ89znTsixZVRFHIwLHetRMvbP735NwWquszV8GSDLueHnIe9mn1f0xaxXCX+fEApd73mzLVIRylfxzJidUb3vMualBLLIHcMYz4xqCTdVVgjL9VJZ/wS6T+qRzNRSn/aFDGXn5u7JOFcJxpt3iDi0/h/XI5Slytr1KBoF2jI5rt6jceTDiHi5nbepNKmBZlI2Q554gfQtwhYkIC0kURTXwInZP1vB0QGJr48amfc6gQkg9ipGbeQ570qQjqOsXblz4Kz+7F0Y0Vltqi1Gjb8f9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nv67rLJvfMAIhhSuVxS6zS/BMryAZHekx3pIS2FaHE=;
 b=o3ISeBZch9ER0s+m5kR5XhdkEO6oRTDlssRl23Po2HepDYlG09cemWRCGCigS3ns/sRUS+2loq8X6KoWoz2WrHvoZgCJD3pbdA7qxPQ1uBMXobB2Fl2IzMtqQCT7S8c2eistk3Wy5PzBoI8YVxRFuYlQm7XyNaNcZC0sw1rvdgIFf7zmLaGdVdSHs43LtDYds9i2/711q+SHXuF1qBLY43IirnbgS8tDBme53cZAF7NtFX8ZqX6g0AHuKhXCVYvDSrnvANg0XPlL1klMI8lNkR5T5vU2PtRqoPr/LUZav8IXY/kWvcBwMMQlxBouL2oN2DGf1GoFvWqa9c7Er0zuBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 14:11:24 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 14:11:24 +0000
Message-ID: <aa1b2a24-8982-43d0-9852-04f5b4ad9b98@intel.com>
Date: Fri, 14 Aug 2026 16:11:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/32] drm/xe/tests: Add Kunit tests for xe_log
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-17-michal.wajdeczko@intel.com>
 <802481a5-d5da-4ae5-abdc-2c90a7951f56@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <802481a5-d5da-4ae5-abdc-2c90a7951f56@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: e9098f18-8b5a-4f1a-0dd2-08defa0dec90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: JudUV5R58bug2wudU3zU7B7m334aINf6HTi9wJrxTnVUERU3L6RVQ7GptGaEdWjDbbQ7moXcOTB0q1QjPWnVAzNM1muRU4mg0gNT46um8Oh52VPhVnRpdQQnLzC08GCyxBEK1ecH0tztWZTR8uvHYyodu/LHDwHdIf7b1wTYi/SwcKq4FFkWJ5FBwDKFpiOVZiUXnqN2KUrHnwkbowj1s7Lw2C2fi/EM5l5ckRUjwIfghEXdeHopKghjDM1fvCH0+CyNjheKh3nxSoWytB1JcROVxl4eRTrJ9AxKl5M4+UcwDcz+a6ZKio4luG4AdyK1ClSOxSF6kesoeNeyLRNk3FOWk1e2Kc0VB251PhHm0a+D4tlU6kGNYqO1gZaLaz9FAYqH6PHHoWzdZzIO/3dzTgqcjIdqr0gON5AZtCoDKBnCDLTN6Y9spHdmDB/+Y43tO1zf8fv+KXvWapM+xa5ElZdusOnf9dvXuTupTnMcqIBbg7R1hMSgMwEC3ShVY5h8nunOtY5ntccDjt+ikAdnWLgNheM7kiJafsTj1ZSryJO99WjGiA0f01/aBf7qI5BXjuqna8Uxbz232H4yQfstHbsA0Qv+aA0m4nGomzBLUFlIgP2bgmmpz0fUT97mA4T+Ro7uiJipL0zDxjUBsV3xVdYMbzX+rR6cq3sh3yTsl90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmcvQmF3Tkh1Zlc5WGhNeGFkejh1N1RwM3hkM081TmVkNWZjSkNnY3VsTTN6?=
 =?utf-8?B?cEUrY3ZCU2QvbUdxUXprVXRVVDllRXlORHQ2dHRFVjBVT3piSStFckptT3I0?=
 =?utf-8?B?ajJxN3VKQWZGMlUvZmFIanVlRDgxUm1mUEZLclBzSk51aGRXeFlXR3ltS0dK?=
 =?utf-8?B?M1dkSkZqdGZtMWovZk5KNTA3V0hZOElpd2o5b0V6dTJPcy96dnNsOVF0WnRE?=
 =?utf-8?B?RWNTQzR3Ykg0T0krdlk0a3dMS3JYeWNocld3S2V2U2RKRzlrM3BtQ0FQRncy?=
 =?utf-8?B?UmhldlREVlFYbXZjQkppSGhJcTdPbVRPdURKb1FvbUJPNHpUcUhDWE9BNGl2?=
 =?utf-8?B?S283bm5ueFJmdVNMU2ZEQmhmZ2ZaQTRETHZHaVdSVEZQVk54WXcrcnQ0L2o1?=
 =?utf-8?B?OWsrc1Zzc2hLdEVtMFEwZkxReVZld3gwVkNjSFU0eCtiR3oySWR6SVpYT2hn?=
 =?utf-8?B?ZDl0cmVzbmRDYWtZZzdGSGkzRU8zMkdXMDIxS0lhRDZWOTVhYkRtSThDamFz?=
 =?utf-8?B?TlRza0VaVWloUytSWUFiSENqRmI2TDQ5RjVkbEd1T2ZvVy9nQ0tyM3pia3Qy?=
 =?utf-8?B?aUg0dExmZnBFVGVNOWNBN2dmOEV6L1NBd2dURnJYVDMvc2FmeXNIamNUem1H?=
 =?utf-8?B?WjFjOTVtWXVGZEhlQ0dwT1pCR1pKNnZqTE96UjhWSHR4bkJCVm5QQ3ppRysr?=
 =?utf-8?B?cVBOMkdtYkRVYzgreFJNOWdrNFpwOUYrVzZ4YVBDbnVNYTR1bHVaM1NCQU82?=
 =?utf-8?B?a1FCbmk4RWdBYzluYTFPMnRyQVZvY2xYZTk5RG5nYzJsWitoY3h5RGI0NCtP?=
 =?utf-8?B?cW9qN0oyb0hZdWZ4SGV0bitOcVFlYk1XUlZ1V0RCQ1ZXQjNWK0dDQlhtTmhY?=
 =?utf-8?B?OUNPL2hINVQ1cWdKdmFwc3JJQllCNzA2c3E5aFU0QWVXOWRjd3dKRHVhb0x4?=
 =?utf-8?B?UG5YcnBySmhEMVQvZEszR2p0WFVXSSt3MHM5L3hWK29WcGlEQVhGZmpReWdv?=
 =?utf-8?B?RnVkL1dWakh5SmpPci9xK3RaQnFtb3hZYzgzSVR6RUJ0Q0ZnMkhjM1NNLzRj?=
 =?utf-8?B?SnJBbjdub080Z3FyMW5kOU56Q25kMm12MkJTSVFqU3p5MVc1ZkJtdG5BKzFx?=
 =?utf-8?B?VnBDamhETFZub0RTWWZCaTRQMGpsY0ZPNG5KZ200YlhHS3Q3QXJxY0tQcmFh?=
 =?utf-8?B?a25GSHpHamNrK2oyRHprMmM2cnpGanNKT0NNR013NUZKaVFuTmhvUGhoemVZ?=
 =?utf-8?B?cGZDcW5nczk4ejFKanZDa1dTQzhBMzFSWW44ZkFmOEhDWlRCSE5TWHZxblhB?=
 =?utf-8?B?ZGZrQ1QzZWFTY0FpOCtOUkkrajRDbWJkN2tnSmh6OHY2bUNXekxCWU03Wk1E?=
 =?utf-8?B?cGZ5VjQ5U0UxSU85L3cxejN6dXNRSUdKeTJQSWtlV1lzcTZvYjNISnF6TW8w?=
 =?utf-8?B?RHltWXFPUEhxaE1nT0ZDY29FOUNWT3JobFpCaUNCa2NtSkFhciszbUZTV2hY?=
 =?utf-8?B?QVBnejZOVGJMdStoaFV1cDczeXU4bEVtaDJYWXhSZ3U4bHJRQmExc0lRdTEz?=
 =?utf-8?B?ZC9QRXp3d1BHUlc4TWdQSnNKdlBvWk5VOGFPdE1YUU9JNDJlV2RUa1N1Mzh2?=
 =?utf-8?B?NmoybXYvNjJFQ2NLdTZicVVBaHZ1ajJoRHN4R2JNK0ZFaVJLdGZEU1FyeHRM?=
 =?utf-8?B?N0ZGWUl4ZFlTSWZCcHZHSXQzRWcrUFJvc1psUVJWL2FyY0x1VFB2VjVhNGUw?=
 =?utf-8?B?bXdRT1ZjdkdwVTJrNnNlL1dodlNUTmtES2YwSFNocU9PeW1ZQjlyTnBpSW1O?=
 =?utf-8?B?ZUpIY0k2ZGIxdUVabi9Dc21ZUFZsb292amQxVFNsWUVYZXhiTk44RWdZMU5Q?=
 =?utf-8?B?MVEyTnlYWi9YbE9uMEFFeHR0K1ZlampzUjEyMVRXK1JCYzZvWEtSS1R2S2xB?=
 =?utf-8?B?aXJQMm4yenZjakVucGRxRnVCaWM2d29kT3JvdjJqY2pOK0E2ZGtCRlhneTFH?=
 =?utf-8?B?VG5ld2s3RUt6WFNLNVlUVUtTc1VNaVE0QmVwM2dvNStmV1Q3TUo0UWNwUDkz?=
 =?utf-8?B?cXlPYU5rQlV1NXBwUzEvV2U5QjBiWE1yK0RTQVFMZy9TaGNKS2Q3a0gyWEtl?=
 =?utf-8?B?YldNR29jV1poeVBKZGE4bmZQTkk1SGYrMVBpaDNUbEV0ajVJUDU2Zkk2MVdt?=
 =?utf-8?B?ekZyZHVLNzN2dE1IOG8vVFIybWVIRFg5SHdJZG1lU2l4d3M2bGs0L0lsZkxB?=
 =?utf-8?B?Q211MDhOcjdaTlFPNWs5aitaWXJhZEUrK0M2bG5peGpkbmRSRnNhZzVDY0Rq?=
 =?utf-8?B?Zzl1Tm44Um1YODdYTnd1Rlg3Um1hdUZnYXFIaHArc2Vndkd0ZDlGK3RBSDB1?=
 =?utf-8?Q?QUQQtVdmjcul5yQQ=3D?=
X-Exchange-RoutingPolicyChecked: XP7QBbgvofhe/0bIkgaOO+uEuD/2zG+xm8NzkmLQQooY37rB+RBqM2cgXl9plhqdUwcXmACuUWT6H0OTd67GjeQodHsidvSEh1Ji6i9yaweAso8OB2Bg3w0hjiI8ww3L3tR1+n5/9YwKRonnLlaurohddygbNeYg+fdFRadg3owtaDggoqWJkenmmGMmrQv2dnlsgDEvEa13QRr6EJdc8eq1MKzIr9fUngyoPLxWC5K1rhvPTUHe2FC0RobJYZJCJUiTyPdEvOy19BBElxZ9/ar1lA+FeUa2ktBM3nitVteWfAY5a8vjYAWOTdVm0ihNSaynxG/tT/Hx26O3pYtpiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9098f18-8b5a-4f1a-0dd2-08defa0dec90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:11:24.5002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAPy2faY67vKOX684md76IKv27gKMpl398y7KiTSF3+DCPD3glw9Yd89xS6sHuAOlvzfZxtpGfxj86gezU8TL1yL5QNheAot2An4hQFlXVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8697
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



On 8/14/2026 3:36 PM, Nilawar, Badal wrote:
> 
> On 13-08-2026 00:44, Michal Wajdeczko wrote:
>> All dmesg log lines generated by the xe_log() functions or helper
>> macros are expected to have a stable format. Add tests to verify
>> that generated output is not accidentally changed. Add demo pseudo
>> tests to show how to use all variants of the xe_log() helpers.

..

>> +static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
>> +			   enum xe_sigid sigid, u32 component, u32 location,
>> +			   const void *data, size_t len, struct va_format *vaf)
>> +{
>> +	char msg[64];
>> +	int n;
>> +
>> +	pr_info("\n");
>> +	pr_info("CPER SEV=%u SIGID=%u\n", cper_sev, sigid);
>> +	pr_info("CPER DEVICE=%s\n", dev_name(&pdev->dev));
>> +	if (location)
>> +		pr_info("CPER LOCATION=%#x \t# %s.%u\n",
>> +			location, location_type(location),
>> +			FIELD_GET(XE_LOG_LOCATION_ID_MASK, location));
>> +	if (component)
>> +		pr_info("CPER COMPONENT=%#x \t# %s\n",
>> +			component, component_name(component));
>> +	if (IS_ERR(data))
>> +		pr_info("CPER ERR=%ld \t\t# %pe\n", PTR_ERR(data), data);
>> +	else if (len)
>> +		print_hex_dump(KERN_INFO, "CPER BIN=", DUMP_PREFIX_OFFSET,
>> +			       16, 1, data, len, false);
>> +
>> +	n = vscnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
>> +	print_hex_dump(KERN_INFO, "CPER MSG=", DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
>> +	pr_info("CPER END\n");
>> +}
> As I understood this is to validate parameters passed. 

yes, this demo is more to prove that the right params are passed
to the log_emit_cper() which today is just a placeholder

> Otherwise, the optional CPER dump would simply contain the raw CPER buffer, for example:
> 
> |[ 12.413289] xe 0000:03:00.0: [drm] <cper dump> 43 50 45 52 00 01 ff ff ff ff 02 00 00 00 00 00 ...|

whatever you do after creating full CPER is up to you
likely we will need another STUB_REDIRECT to check raw
CPER records, but that's another discussion

> 
> Thanks,
> Badal
>> +
