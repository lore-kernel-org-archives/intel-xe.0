Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D849DC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929A810EC8B;
	Tue, 30 Jun 2026 13:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IU1RAzDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CC510EC8B
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826435; x=1814362435;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y8ymKeiWD6blIcLqzh1IWJA2JnXeZhKSXGfmd5uSfXY=;
 b=IU1RAzDvmLPi6Ekupihru75sUrLc41AmSasbcxi2OUqJ9zsUr8FhYQPs
 IjgGaFwz4nhotuvzGniHPaZjWsJ7CfiXDWEILXYGUmdwo8hrTemwxDNy4
 Pmq+m4BziqoAjbRYuJJbD9leAPOEhmq4DwPbleyjxmBI3+kr47XkEFjAO
 KU8mupTv2qjNZSiqp53Z93UczrXiDflscHiMB4yHmsmDjUete/P174w4U
 DzymmmblekBOoHn5+sHZU+Yi3LgQOFp+Kizl/g49ivvU/V9BGbFLjeX3h
 jlm5y850aE3m6lpe4OAyqwmxvQpoifQf4QmTffa7vPF7bgEs203URVJFz A==;
X-CSE-ConnectionGUID: +F+Cx5UmR1KTSR1Ngz6ztQ==
X-CSE-MsgGUID: FyCD5DSoT2y+f8Mv+CKXLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83734102"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83734102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:33:54 -0700
X-CSE-ConnectionGUID: otK7jCjMTyWmU2XTLKvo7g==
X-CSE-MsgGUID: 5Ark/5HLQqSJT9cb2AUEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="247804555"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:33:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 06:33:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 06:33:53 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 06:33:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHAmS9Kc3+l25vgRlmhKwZjjHBdTaleAlQu0Q0jZjve3+WX6YIGtcU7nwsf4ezRvH8OCCBxcYmUe2J3VwbDeFUo+iFn9GOq2mLx9gPKRFqa/DlID2yYJA8D7tSwOrUGCJuqrnvy01hqgk2rLxSRIODLlkdUsWnW/Efizl5sRsjHwk6uczlb9VCIuLw7/hlreMp/RorjrX7lXmLMmFWF6wGwVvk6WMfQ4n6qlr/DDo5Q+bRJZv7FTxhAbh8/SvYpjOh3L0gEpXLAgq61UguC8zHq2r5iMEhyS2gCWcv1T1VUPBt9pM4yVys0w4McvlCmKfuyKjz3c3FLz0AQfdjPHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSAOulRqbHILFfWar6vLWt7YkMUD8UFTmkogEYSCN2E=;
 b=nDnpXQzjGHfOpjRHco0e9cn63/PBdsAeRiNX5GWB/cfjEKTCEkXY0QFsgBIvfqhsupG4b1h5KDfPwabJojr2BQhOWc/gzRQ0Aqg1GnbSrlVg50wlscktPLB+AbZjdkUN2OyisWCRe7jqtATcW53xrRNvJ+EcN9nnAUbz3YfzC10cwMWOYboIqVal/INbUzvohA1UCXrNo9UZKCOIpmFrvU3SYkO7Wb7w6kWrbVzd8ARVt6j4FuPp00A93L5Pfnuto+BhKrNLHolwGtNF866TLyGqHYl3wo0uWh5iZawQOLa/H3mKDRHjZYGP7nmKChMbesLgvTdBR/2ZWVO3Dyt2bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV3PR11MB8673.namprd11.prod.outlook.com (2603:10b6:408:21c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Tue, 30 Jun
 2026 13:33:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:33:51 +0000
Message-ID: <5123006c-e8be-44b8-8c3d-7a6a964729f2@intel.com>
Date: Tue, 30 Jun 2026 15:33:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/i2c: Drop manual VF check
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <heikki.krogerus@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20260630091800.403926-1-raag.jadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260630091800.403926-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF0000089E.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::65b) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV3PR11MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: 326fcaf4-b6d3-4f02-3cd2-08ded6ac38cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: NRlCGDcHc3xMszwWaU33r5xbSlDMNLfybi3H3gQUTZG2Evhc8yStplrc4mz1aTs5pZDs6L22SWpefQhk4jmtzdMDSb7TyCZlUSX1YEukcH1MlvO3AAucxuVp7wx2svvN+dy59PNbrNz5EZo0VOEbnow1Mq760JTzCYFU7uLOsIQxA2/KyXIJyPIhDzbtwY6YqCidDXK4LiiKzb6enOPCKcHzeicceQa1AONnhWLIHW9Z+yKGcQw3EDFNo7jgm4DNrBZ5Z8zS7EwPGXmhzeEn8jxy1T3ecvEqQtEgoaQmZoj9phK7L6VX0o+7vl9ZQ2xyQ7NHvwN6UaMwXla7cmd3fQIxnNNJkUWx3ctjf2Hhkh/XQ54ka7j0lZO1DcB0ynFUgT9Fnm5I+3GtGRTOP2e6c2/fNB5/0UgBe8+tqwV7Z67MM+8EIYjEokoeZyFL96CKKpfiggldsNGGs6xPJ5ekpp/tV0Vy9G0ptkOt/OeKd3MSFQR8yrrIO/tCKrShkNkkd24QQY7GAMwFoPfq0OXuNxJc+c79Z9C0otjIzkiCfpIQtw4noDPoe7NtMaMdFJq+JwR/MWFLmksBYVRa9/zNlj7DAmalzk6ZX7rrer03jUoXJb6gUcVic0kqDVSOMXkN0Ceu0+XX3bdvMS176p+3lH0CI09vFu7XugkqC4GwsPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3VEWXAxSHp3Y1l0Unp2dDRBbWY2MkhJR1N6QlBqeVJvV2RpYkFieHVpY0I0?=
 =?utf-8?B?Qm80U2pmSVFPMUd4VXdpTTViUndZUzAzZk00bU96YjVkTHpVcU9kaGpDMDFG?=
 =?utf-8?B?MmtONzdwQ2FSaHgrZUZFdjBES0JMSlZqZkRsd29BeXJhK1VRSjkrOU9mbmZB?=
 =?utf-8?B?Q1R1U3hlTGY1c3ZMNjJuWHdoZ3h2Q3RuN1pNdkdwWVRVTUtVM1c0K3VxSksy?=
 =?utf-8?B?QWUzcVhRMTVoM1J2amFpTjBGQ01qR21vY1FBUC9ZQ1pxc0ZWVkhFN2pTUkV5?=
 =?utf-8?B?U0FZWEg2djI4WDMralV6RXlDTGRCTElVN1BKWXo2U3pHbWJvNkVtdDFGeGNV?=
 =?utf-8?B?RXFENGEvS2xLR0xLYkhRN3k4Smw1czZOZ2lkdzhZa3FxckNsazBwZ2FocjdM?=
 =?utf-8?B?Z0pVYlo4aHQ2QjIrMk5ZUk1PNUJJdGdneDlvbEE1Y0p2K29hMXRBcXlxQ3Np?=
 =?utf-8?B?UGVQSkJJa1FNYXpxK0hmL1B1SDFGZ2lkNHhrU0pLQU0rQTVlVmpyQjEvMUNk?=
 =?utf-8?B?K2s0b3dUSVF6czRXNVhSVEwxaWdzVDQ3TzhYODQxU0w1bDhBbi9yaWFKVzhS?=
 =?utf-8?B?a3gxblo1SkFXNmJXNEQ2T2kxbDJyR0JMbUxXNzJORytLOWFBbHE4aFNWbjR5?=
 =?utf-8?B?WUxwRkJtSGFtQjV1cDZEOUJrWGRnNlc4NXBIWmhUa2NNeFZremw0ZERNeWxm?=
 =?utf-8?B?S3pDTnhiaERMMUg2aUx4UnAzb3Z1QllOQytQSWxTUnQvbGhTQ0w4L1R3SmtT?=
 =?utf-8?B?RGlDQUgxQU9Rb2hNYktGNnJSQ09XcU56TnFqRzNpRDE3ejVpVUJkanlWaGc1?=
 =?utf-8?B?eFkvVDVIdHM3SjAzLzRvQ3JhOXp5ZXdSV21tTHJrU1d4YUhWWm0xMjlZeWs0?=
 =?utf-8?B?d0RoNE1UeU5zRmlQYThCTUgyTlFjR0x4TDNnMGQycm5QWjJpd0VIR29SdTJW?=
 =?utf-8?B?NnhJYWhnaE9UTHl1V3NkVUNybm1wZ2lkNGVmcUJrMHhEQll5c1NjL1lFZFZP?=
 =?utf-8?B?d3ZlRG9meEUzUUhRQjJTTUlIQXFjcHRDNTZDbWRxWW5ER05MbmZOUU45OEJ2?=
 =?utf-8?B?U2JQVDV4Q2hVaTQyOFA2ci9ZR2ZrWWxjN0pSQmp0NHVZRGx5dVpWU1R4WXVy?=
 =?utf-8?B?Y3B1c0s2emFuYU9xeWE5T3JSSDZGVFRHaGlXOFllcnlhQkt3bFVtOWRaZER4?=
 =?utf-8?B?SG40REZCcGg2a0IyT1F6K1VUR2lzMDduYkNVcDhhT1B6OGszN1AzTVEwMytY?=
 =?utf-8?B?UlM0eFJhVkZBN2xUYmxPbDB6MVp2MGNRNnNkcHpPWE1Fc05zcklZUGpHWlZa?=
 =?utf-8?B?RTVlajlDTFpNb0NDanA4UmlHZS9oS0gveHVFSWF2aVB2K3ZRRXR3M0dhaWh3?=
 =?utf-8?B?SklzVWpxZXFWb1pXdXcvVXRYbTBKZnRleDNHTFlPT1RaYm04S0o1TGlJMXBn?=
 =?utf-8?B?OEEzcmVxTkJTS1EvZmdlTmdsdWk0UXV2WThHQmJRN3I5M2g5LzJSdDVCd1hm?=
 =?utf-8?B?emppOE5rNVpPak42MnBuTmcrME0vN2M2YXJsYVNjcU5YU3FPRE9Hb2QxcThw?=
 =?utf-8?B?YXJXdnlJQjNoQ3N3UHR2V1Y3T09OMjhkb21udjdoemh2RUpBQnlnRFZYeEdt?=
 =?utf-8?B?Y2dCdStGbTFUZUZnREpnZnkwWmtERjNoSnVsNzFGYXBRZFJ2SFJUcStQb1Qy?=
 =?utf-8?B?cy93ZDkxWVFyWVZoalNkQUZiamJLbmIzWG4vSisvbWJLMHdySWFzY1d4a2hC?=
 =?utf-8?B?QjZLYlp5TXErM1NSMG5CQkNySTBWM1FNemU2NVR4Si92TkFUS0pockFUZE0y?=
 =?utf-8?B?RnFRM2gzMHAxSEdOTHNRRmt3Q3VTa1cxaFJ0NlF1akY3cTF5VHQ4V0xmN3FT?=
 =?utf-8?B?NWt6NVlvNkUwRzk2b2R4MldLbXdWNWNNbzZDNGpqVUFBam0yNGNGeHlUOGZK?=
 =?utf-8?B?cldYVWh1SUJPQWVKV0U0Ync5bDV5bEJnZjZHcUtFN2pLQS9MOGFjalBNSlho?=
 =?utf-8?B?MG9pQmNwUVNiMWVCZU93ZlRVZ1pCVlRYaXBLMzFoUm8vL0ZGRHg1TTNhaHpq?=
 =?utf-8?B?SHBsR2RUSUdtVnlCSDhLNE9JK2grZW53YnozalEvTWo2aXVjSE9BZVBNNGsx?=
 =?utf-8?B?UjNjdmdEUkt0Wk84V3hnZHprdWJLeUp1aER0TkxaOC9aT0k5dkFtM1dVQnhC?=
 =?utf-8?B?NC91aC9QclRJSE1zOXpyMFJFTVUzNkU5RHhvZjdqbkozcVh2aEFtTXlheFZT?=
 =?utf-8?B?dDZVdUxHdFdpSkVZRzR3M0JtTyt6Q29tWWZkU0pCdmpzOW5lRjMvd0FpUlkr?=
 =?utf-8?B?NWVFMExJY3hqUGFhTk4rRFBWTGNKOE83WStBbUtPOTc1cUF2VEJtdU1SYUwz?=
 =?utf-8?Q?T/u33Fp/GgN3o9uQ=3D?=
X-Exchange-RoutingPolicyChecked: motRphn/vaxOv39kdnOJglPhPg/QL8i5+robeSlkoE5Oyza5bEoxCsRf4qjP2eu8v63zFPr6qbQiNvQ32y/lh/uZ/fjr2jp+IVhKIJdGyaWrmQ/0M1j3ut1xN/hes8kwmMeLAOHgkKdW/hABMHt95gRc7B1fXuWIdjX5owpOunWhZ5mAsQVNpwCcS67yl0hCkj55/Ymt7g/DRGOzCNCKVydf6NPq+HBMqgUtA/amWNcduzO96ZPPNhlcWHmy8qjX++GTot1309SERyYj0GETrVCc1ksK6746U0oidip/ed07WYtsGeip0jnDL/vNKaUvtX8tdzr6CUHdVyMbctvJmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 326fcaf4-b6d3-4f02-3cd2-08ded6ac38cb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:33:51.0322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwJKPZI68gT/agCbqDAuwB2gNPljehCUeEA2FBogaIc2kEg+V/jxIJQQfZ50xcFLXZhYvLQKqCbOd06PSxYNWcNuI7McVcXByU8UMvhRFgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8673
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



On 6/30/2026 11:18 AM, Raag Jadav wrote:
> Clear has_i2c flag inside vf_update_device_info() instead of manually
> checking for VF instance.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 +
>  drivers/gpu/drm/xe/xe_i2c.c    | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e8b6afb29ab6..cfd4983be411 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -745,6 +745,7 @@ static void vf_update_device_info(struct xe_device *xe)
>  	xe->info.probe_display = 0;
>  	xe->info.has_heci_cscfi = 0;
>  	xe->info.has_heci_gscfi = 0;
> +	xe->info.has_i2c = 0;
>  	xe->info.has_late_bind = 0;
>  	xe->info.skip_guc_pc = 1;
>  	xe->info.skip_pcode = 1;
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 706783863d07..bd956776b10b 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -334,9 +334,6 @@ int xe_i2c_probe(struct xe_device *xe)
>  	if (!xe->info.has_i2c)
>  		return 0;
>  
> -	if (IS_SRIOV_VF(xe))
> -		return 0;
> -
>  	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
>  	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
>  		return 0;

