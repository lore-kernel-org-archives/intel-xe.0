Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BBFC54F54
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 09:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC54910F1E5;
	Fri, 31 Jul 2026 09:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KeHzXmwj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CAF10F1E5;
 Fri, 31 Jul 2026 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785491027; x=1817027027;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pBpFANiR8Pg1M4waulC5/KNt2gjz3VW7SokuPXHHpO0=;
 b=KeHzXmwjEi2Ok9z2fxdgNCY91oAdNsDSPiECNcfeIPDgrJpNtRQ8iPqA
 TqQjKXN/mrqF4TB6+nGb+2+I/0lXZAaoXupV1xdw1HzMLJEU8/0/NykWs
 VnwMM0iDG3fTx4hAWcILw0vPoSQSZFRpMnee6G80zCQYuCf6TPwGlcASb
 4mM/u4vsjhWZtjntTX3zLVKb0mLWU+8YM3S6VA2kxL6bJ+voFTO2ZKjPy
 jE3aU735DH/01svnCkJCMvMS+thbFIpCA1wuDsKh3TJl5KytF8fDuMqS+
 Eu9SRPy1SWNYIlTa7zPW6UFMcoCzQIpnUwkolnSk5D4MAhMG2Q5eJ1YjT Q==;
X-CSE-ConnectionGUID: NZyBvmQNRP+6OcUX2AXGyA==
X-CSE-MsgGUID: x3lBu+1SRf2ZDQGwVLiV6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="108908523"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="108908523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 02:43:47 -0700
X-CSE-ConnectionGUID: V5Zec11wQK2BjEMt/ANvGQ==
X-CSE-MsgGUID: gv6Slxr+RUejB1R8NX4jdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="256234056"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 02:43:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 02:43:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 02:43:46 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 02:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TL1gervXPxuPQwlG/T+AOMtl6fKLGzJvJFWEgMlzTEgJhxUN2sSS/yHs6ei0WxRnMx0WzhVhUV9dmY1JfQ16zQDjYhrFmiTb95yAF8cX2l3s59ZBTc8a0ZwEtpLPsTF1szXIMlYES+8fFtFT4dt5UqV2ZfwDhd6Bb/v1QkCpSfZ45ZpruX4V8HJzOl1xXYvtwkGh93OGYw05wulVHEHl4AX9K827buB42JixXeboXa31ysVpPsbt/l5qypfxMhilDrawpE4MMFGfCC/AQJ2z+djCGFoPbX4JcNMM3a43DEqJHGOrP0GJq4IsChH0bz6nsR888Z8ttT6xgHFlvyx8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5VG7Hz9b//Wyb48zCVHe32Djnh3ssoDV7mCVOcLR6U=;
 b=RdSE7xYFCCdZWdhx3s7XlxcingoNiuV+FDkKNzUdXdD6ikeSEZ0uSllGQgfF96LWP3wjCwaq4jvfAfiP9dtM2TGXSjQwVfbzpLhsttskxlhGWHK5HY+5duomASpbqqLQ7milhLa/+gPJZYE+mkFUpM2l7kpn6cE5o/p1tXzVPCfAnu2e3Vwlbg0UG0XarBGTTOcWnJ/zSpnL8OqxZn5hABeeDdDT1taes5hD8UzEbw9UObXDtoTW2Q6uMspCtYyHyoBrsUww3G29Kh/WmsEf0+aREYLnBY85EK5Ev/Dy+8PpvKina6r/iDIH3Oy2qzgs2qFkHewqs/R1SRg7m/9DVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 09:43:44 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:43:43 +0000
Message-ID: <5837b7e2-ff91-44e2-b232-032df8ae1f39@intel.com>
Date: Fri, 31 Jul 2026 15:13:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/10] drm/i915/vrr: Latch CMRR ratio via atomic commit
 on debugfs write
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260730105919.3913412-8-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260730105919.3913412-8-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 94069bc0-9daf-4c80-56a0-08deeee83562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|3023799007|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cxCqxrmG3Tgi8IxG1j6Lq1aL5ZeTYukMgjji5fhwGIFc5/YkXm1nXdzrik27HMMntu8OOFLsAiPsWxnZ8ZqHHHPA8rgq/ZD/T7P12qWwY0SqE8O4ooPmbkwNTNecNRvSEqXvXRH17ZVBE4dYukPYuKgAOtCrvlTf5VNgGcjaVXZU19k2qQaPg28juPSP7LWitsIwbBCC4PvXX/AaxjJYFUZuJFsypvd3cQS6xROLeS/HLkAFas26Ze6uSljP4WgM+pBXSOWDlXys10ANhiZ4Nm6j0ncdZs9Z15fR1ar1aa5ahYiRshizN/2FJyk3zQej14U9lCegCyDwYpkClHOwwVxSu5iMPonUYCBwsykhWeenCA5Xy+6aCvo1mO3AxlI6c858W+JGQCikLtjZBjooka+jQvRInBIortUfR/cMP4MBR5dkGtkd3qGDWiTGp/JuwZ7OtJG07GIemQkIiSiZO2b3tYFXQwAKECZlvw9mj8yi1VrjlmE6V0S33IUttCkfSZlEn4jULWMXTupu9C/5LXcbR+BZ46Ck+O4vWdVAMeTz6i99aK5xxqacV2QHcPjcGJw81/+tsGLRvLu5TFt7ihEfZ5cBZECnzYXisy2EAyawbb4n600JRXoaqYXOrYF9mTkfJ9/Ravpgzv5Ki9lNbG90coQUmKmsrADjWydUPsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzlzcTFRYXljNnVhQUZXYko0NTJVb3hNNWU1dEpKZmFiK1hYd2VKRWFGd05X?=
 =?utf-8?B?eGl1YkF5MnRGZHlpWFRkZ1Y0cURYdXdDcGUxRXdib0U4N0ZQcnlzcmRLS1VN?=
 =?utf-8?B?MWZnc29td25xblBDODA1b2VHODNFYnNjMDl0ekYvVjVJRER5ZkEzZFNYdG9J?=
 =?utf-8?B?QnRXeEl6aWs4SVhFSlBLcjlLRVdTcVRKQVNpR0JOMmtCQ1l6YzNMemZ3ZVM2?=
 =?utf-8?B?R09xTyt4cnVkSGdnVHQzZG5kcUxMTHZFTld0SnlkQjVVcSsvbjlIMHpQcDBo?=
 =?utf-8?B?cW5rZzlzeTc4YTZtdFdHSitnK2t4U2x2V3pmd2lzekk5WE85QkVkakhwdnZw?=
 =?utf-8?B?MW5sYjROVGhIQzNJWU5teGRlMzVtSE1tNEpjbm9wcmRUN2FrVUVFcHRBalJT?=
 =?utf-8?B?RzVMZm0rNnhWS2IzR3RFUmxVaVpxTjhGekZTRDVDMCs1RnVhbEh0Qitvd05J?=
 =?utf-8?B?bS9iL0ZqZ2MzRVllUDNvTjlwUmdURTAyR2pqSFE4U1BoWlNXQTBXNmJGWk9B?=
 =?utf-8?B?cTB6anA5b1ZnYlhUS1RKRXN0SU05aVlIRjJ5YVN2d0hIYWxOSElFYzdITFJr?=
 =?utf-8?B?NmNFWkF3ZHd3NVYxVTl3TGRMVDhJZGxHb1Z2UytlUThLbW5Mb2JZL1hyL2VO?=
 =?utf-8?B?ZXVaVUZMY2pOdEZtbkdLdVZ4S3hVVWErc25odEhuVk15Z3lVdi9rcVF1SFl3?=
 =?utf-8?B?dmRJa2QrSVE4OUhtajUrS3cxK0FiVS80ejN6a2t4WnM3RmtXRHBhYWEvTEpI?=
 =?utf-8?B?SHRmMUNjeVhwL25OMmFwSlNIakJWWGk0SjA5NWhFV2lKWVFOSlVyWVVTWFMz?=
 =?utf-8?B?NWFnalM5b1RHQUxqTm5hcjY3Q202d2p6em5SaTRCNk12T3dNK0wySnk0RnBj?=
 =?utf-8?B?OGI1djN6ZUxmbU5wcE1nRUo5aTQ0TTJ1R29pUFVSTjFHUklrV2JHOVJJem9a?=
 =?utf-8?B?anVKdDlJZjN6TC8va2l5N0hqSWExU21ZejdPQWthYUh6WVMrMlFPZEpnZXVV?=
 =?utf-8?B?cHg1UVZzNUJuRTRqZGlYSEg1MGYrUlp6MStQaVVMZUhydFVGQ0pCRzJVeGtm?=
 =?utf-8?B?aVB3UThneWV4RDhDVXJJN0xxS1lyQko5VmlHYjJZdzZUV2xUTEJsWjMrcW10?=
 =?utf-8?B?NzBubS8zNnhPUStzMkRHYU5BOS9kOUgwdVd4aDcyelNRdEVxTVlKbXhHOXZk?=
 =?utf-8?B?ejBwRDUzVTZiK3VwTmY0d04xODg4Y2lpK1plb2pxeTRFSTRuRE8wSWFJK1JR?=
 =?utf-8?B?bFl5NmdINDI0Zi9XVkJNeGQ0YVFHemhya2Rta3ZlUnFzb25rSnhUV05vOC81?=
 =?utf-8?B?SjEvZjFQaFd4QTFxbVVZQ0hHYVlGazBoYlo5VjZLUDFYZlMzSkZkQVl3MkFJ?=
 =?utf-8?B?UFllbmtqcW5XVWxYSGcvRi9iOFdCbm1ZS1dEOWtKaUJaTVExNE5MaG5hRnhr?=
 =?utf-8?B?YVJBY2ozMzk0d01uRzd2SXR1QWZxNkdIT1kybGpKbGFtcjRON3hPTzhKK0JF?=
 =?utf-8?B?djlmU3k0dzVwdElvMHZDdE0wN21laXJQalQzWmJWczU5RDE4YXBsd0xYZFZU?=
 =?utf-8?B?VHZUWVVrbnZhUjJONjMrVEpXUDFlajhubU1KTjVCVkVsazZGTzJDRGpPSTNw?=
 =?utf-8?B?TWVnYkhoQVJrVlM2cVQwVG43bnhQN05FNXd3UVVaL3VkMjF4UUM0ZkppUGtT?=
 =?utf-8?B?dnpNbGwyQlVCa3YrbVowd0dBdWFMSkFaWGRUSmYwMTR4M0FDckVuMzJXSEM3?=
 =?utf-8?B?ZjBZemMwTjVqNDdtYTg2ZDBBdmhncFhvU0kyMFpNWDZ4Z0FrcHdhdFRiamI5?=
 =?utf-8?B?dFJSTExpN0htU2Z6L2svWGFPWS9HK295NzBEN0lSbHRRVHZPMVN4N00zaUFF?=
 =?utf-8?B?cmJrbHhScTB2dGJ5RUNuci9MTnBmVWZKak1JUFhucDV6N1lsdkxUL2I0Ynl1?=
 =?utf-8?B?QVNlNGhxY2YyZmQwcjV4bFNwTE52UlFaSW40T0o4NUVSYlhVVlZ2eUNFR1la?=
 =?utf-8?B?MGNVYVdTRm9Gc1lqU09qZU85Z1d4RkVrMlpGSU5Ic1E5MVhNd0cxTXJEVDV2?=
 =?utf-8?B?UGF6ZXlDbnFTZHEwcHc3cW5MRXk3bXNKcTAxSjFrZXk2WkxleVZpc1ZtamtV?=
 =?utf-8?B?OUJiRXE2Uk1nUHNsenVrRGMycWpoRmVQRkJSb0p3WFZQWWhtUTV3NTVPdEcy?=
 =?utf-8?B?eFRvOTNNa2RmYUxHcGFyVTlZaG9hWTVjcVErQlBsOWx1dEF1SlpWRDhsVHN5?=
 =?utf-8?B?Q2loemtVR3BOUUFReGY1L1RMMDB6NGdFREdoUWw5bUJrczlFMW1YQ2twS2hk?=
 =?utf-8?B?WHQ4WUVvUU1WRmRTYXBrOXBlbkI4ZlNocGhEdkRkdUkvdHo4eVN0TlN0Tm1l?=
 =?utf-8?Q?iaiaTVpMV6t9OXSA=3D?=
X-Exchange-RoutingPolicyChecked: JQHGSoBAlHrbA8rwVuard7vtLpLfIVe67vIcIqwaIlbe6IyGlofgIrI3JaZWysiH9yeA9U8gPBMxgF8oF+zCLWw18cvDaST1AON7BG2hEBRAE2YGMsyAESo4qGgN/LTiHqK4DgD6PKFfqW/5nYXysPcGV1dh4UisgsQoIZPy3J7JKc0WrftAoAE/o8GodntHFI1vsYFAa+HdmxJMrDhpFDCMiNOorjNCg9ybcvvG0EZWXb6hG4I0u8FXLZbDV2fjo3hiHrgQMl8Wpqf2fnsknD9yKNj1kHe6hnErrexlo34U92+Spe3i1UldPYKyhnp3ygJnncKTo/XxqsBRHz+fPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94069bc0-9daf-4c80-56a0-08deeee83562
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 09:43:43.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEbwnH+RlSaoryWxulkuQoauPbnJIdQ9PkNgd1TO9lWIi7+XdmUp6A7sguf+bMUHGnKEw9/atxRWVz/zEUEm85UYNtzIGcuAFj6gqGvIUSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
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



On 7/30/2026 4:29 PM, Mitul Golani wrote:
> Writing the per-CRTC "intel_vrr_target_refresh_rate" debugfs file only
> updates crtc->force_cmrr, a side channel that is not tracked by the
> atomic state. The requested ratio therefore does not reach the hardware
> until some unrelated commit recomputes the pipe config.
> 
> Kick an internal atomic commit for the CRTC from the debugfs write and
> mark the CRTC mode as changed so the pipe config is recomputed.
> 
> Note that this commit may or may not be downgraded to a fastset,
> depending on whether the computed vblank value (with LRR disabled)
> changes, so it is not characterised as a fastset.
> 
> If the commit fails, restore the previous numerator/denominator so that
> force_cmrr does not hold on to bad values, which would otherwise make
> all subsequent commits fail.
> 
> --v2:
> - Commit message and code comment update (Chaitanya)
> - Commit header update
> - Restore to old known debugfs values when commit fails
> (Chaitanya)
> 

LGTM,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 77 ++++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index f406f34b816e..3463533b1ea1 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -8,10 +8,12 @@
>   #include <linux/seq_file.h>
>   #include <linux/string.h>
>   
> +#include <drm/drm_atomic.h>
>   #include <drm/drm_print.h>
>   #include <drm/intel/step.h>
>   
>   #include "intel_alpm.h"
> +#include "intel_atomic.h"
>   #include "intel_cmtg.h"
>   #include "intel_crtc.h"
>   #include "intel_de.h"
> @@ -1304,12 +1306,67 @@ static int intel_vrr_debugfs_target_rr_open(struct inode *inode, struct file *fi
>   	return single_open(file, intel_vrr_debugfs_target_rr_show, inode->i_private);
>   }
>   
> +/*
> + * Force an internal commit on @crtc so that a CMRR ratio programmed
> + * via debugfs gets recomputed and latched into hardware.
> + *
> + * CMRR only alters the (average) vtotal. Depending on whether the
> + * computed vblank value (with LRR disabled) changes, this commit may or
> + * may not be downgraded to a fastset.
> + */
> +static int intel_vrr_cmrr_commit_force(struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(crtc);
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_commit *state;
> +	struct intel_crtc_state *crtc_state;
> +	int ret = 0;
> +
> +	state = drm_atomic_commit_alloc(display->drm);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
> +
> +	state->acquire_ctx = &ctx;
> +	to_intel_atomic_state(state)->internal = true;
> +
> +retry:
> +	crtc_state = intel_atomic_get_crtc_state(state, crtc);
> +	if (IS_ERR(crtc_state)) {
> +		ret = PTR_ERR(crtc_state);
> +		goto out;
> +	}
> +
> +	if (!crtc_state->hw.active)
> +		goto out;
> +
> +	/* Mark mode as changed to trigger a pipe recompute + update() */
> +	crtc_state->uapi.mode_changed = true;
> +
> +	ret = drm_atomic_commit(state);
> +out:
> +	if (ret == -EDEADLK) {
> +		drm_atomic_commit_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry;
> +	}
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +	drm_atomic_commit_put(state);
> +
> +	return ret;
> +}
> +
>   static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char __user *ubuf,
>   						 size_t len, loff_t *offp)
>   {
>   	struct seq_file *m = file->private_data;
>   	struct intel_crtc *crtc = m->private;
>   	u32 numerator, denominator;
> +	u32 old_numerator, old_denominator;
>   	char kbuf[32];
>   	int ret;
>   
> @@ -1329,9 +1386,29 @@ static ssize_t intel_vrr_debugfs_target_rr_write(struct file *file, const char _
>   	    crtc->force_cmrr.denominator == denominator)
>   		return len;
>   
> +	old_numerator = crtc->force_cmrr.numerator;
> +	old_denominator = crtc->force_cmrr.denominator;
> +
>   	crtc->force_cmrr.numerator = numerator;
>   	crtc->force_cmrr.denominator = denominator;
>   
> +	/*
> +	 * The debugfs value is a side channel that is not tracked by the atomic
> +	 * state, so kick an internal commit to recompute and latch the
> +	 * new CMRR parameters.
> +	 */
> +	ret = intel_vrr_cmrr_commit_force(crtc);
> +	if (ret) {
> +		/*
> +		 * Restore the last known good ratio so that force_cmrr does not
> +		 * hold on to bad values, which would make all subsequent commits
> +		 * fail.
> +		 */
> +		crtc->force_cmrr.numerator = old_numerator;
> +		crtc->force_cmrr.denominator = old_denominator;
> +		return ret;
> +	}
> +
>   	return len;
>   }
>   

