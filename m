Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216B4CCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 14:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76F210E06B;
	Tue, 21 Oct 2025 14:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbU3HNxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351F810E06B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761057190; x=1792593190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MpFXxdUmG6NXOSo+Fyp4aPZHEQEw6leFDXUOW3Up2uk=;
 b=bbU3HNxBZdPInRqf9eFtyItLq12omMOx7N9sCNjS54YAZwb/85k3Nooy
 bHrbYbNoYLT6flVes0XjsJS2TBnKdI7D7//JLm44P54W+NrkXbvlFpJ6/
 9z7SY+KsemAqupSb+Rzin7BPMdi0TzEmfY+/KhLC+Zf2LFw1pbYPC84CC
 lbSccR3jRx5ZIxneXH1XEaDZrrkmTHP+OaOOqim4rfrH34f3mY4yDXsH+
 LOf6gYZqPymae4hl8VGBc2ZZzFxiJsKlesU/4oU64S0fqOqRtJPs4jB+5
 v+3K2JeV0+F59URVcTLmVRtn5MIKKnj8+lb5VJUn4WYF2w/Hl22iD+HB7 A==;
X-CSE-ConnectionGUID: JmDQ64yURTOHuiN9igzEYQ==
X-CSE-MsgGUID: XXLvkwTDSTGGycLBLIwDfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62214739"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="62214739"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:33:10 -0700
X-CSE-ConnectionGUID: Ahaq5bseReCFlyvwn4NBGA==
X-CSE-MsgGUID: mytYadhvShqdjE4e49SynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188892470"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:33:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 07:33:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 07:33:09 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 07:33:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWJE08e7rsz571eE/eaYvVCq5DM/NP2vlBLvYreVhUtMaSVplfDbAQ/+Og5H3tNNq16QSmO+RIbuuiBOI3WO7UpHcmTzxPl95sErTgvAf4o8mh2rCJl7hAPeq+fmaAGWt0rkHO4FbDBLaIX5/CuNXMZeeWwcsBnGlhLQYazOxbQ3Fs/24/+0UUx9CXXXfATdKkHIxsAQuRYpd0mEp2+vIGOB/pcrImXm3QEzOI6BIBlcjp/0rQoDiDR7pGYt6hE6NxFI2XsTdnPY4S8EUHMhFNJ29Aophmo6zZ1twMsgtWvZVocRbWDm4QngObt4pjWtVi1NvyyxASLsCJUlsQmTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Or21TfsqyarDe6FuIh1SDmtQi500Rrqa2dQvwjwc1B8=;
 b=JcZucodw9xwP3MgvCKbD/HIVsQ5uMpWFX4Fw86aj1ZiNPeYLlC1v0MmxHn2/SgSxW1JGm7Phf7xpr0HuAkrO1E+bObZwfX7wpKH7LdaBvKbz9lqgBNaxvmYJEbrKnSumXpeHbluNYd3nHeyLa6+cnccmvXfvUN4TIVj1jvpLc6UJGJk71K9M0U2aETsx8OSJDGuwHQ5Xezd4/l3ajpX/EsHY2g9zmf7AxI/KrxKnMPi5qMbU7AUyxoXY3XRk7k/tuxg6BaJloS8j8liBb0uOXddFH+YfsTw75tNVTNCSNFV1Wsdm77hdh3FMftUivu6nnUjew5PtEczBQf02iMrNgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 14:33:05 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 14:33:04 +0000
Message-ID: <be926abd-1db8-4bac-829e-673cefe89fd1@intel.com>
Date: Tue, 21 Oct 2025 16:32:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe/vf: Revert logic of vf.migration.enabled
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251021123943.1436375-1-tomasz.lis@intel.com>
 <20251021123943.1436375-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021123943.1436375-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf57d1f-156c-4d60-b235-08de10aebe6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUhBYjE1T2swM2N0NTJKV3U4U3c1czR1K2REUFNlNzlITnRta2NpSDhlMWFE?=
 =?utf-8?B?VE5nemx2T2NQMHM3YytKTVk1cWR3YjZ6aVdMNzhBN2FsbzB0Z2VjMjI5Zzd3?=
 =?utf-8?B?TlZUaURDTnZtMTY2ck1MNUwvS254SDZrcnVMd0YzaEJnMzU3dnNKU3F5aWhv?=
 =?utf-8?B?OWt2T1RnczRLL0JsQUNvTURpUWJway9WVXlFbjdYQmlmQkdjazZ5MzNaZGNi?=
 =?utf-8?B?bFBNYnd6QkZvVVB4ODUxK013aXhRSWkybE9wN3Z0M2RKWVh1bzQ5RFJLWkdG?=
 =?utf-8?B?T3N0RkorY29EcGtZRXBsYzNjVVBBZXBSNUM4NUp6blJBRmFlNnVycGVGRnkw?=
 =?utf-8?B?dWhseWIvbVBMNFhKM1dUNitBcUE4MVBqc2pOUVVpUytaQW9LRE51bkhXcmdT?=
 =?utf-8?B?YUhTSzBYalpjelNudU53bVVXM1JPaDNtdW5wZG5mVFlJRzBmR1pCVGY3L2VW?=
 =?utf-8?B?aE9FcXRHWkFMa0tQclFObE1VRVdWc1A1aHg3d2puOCtFbjVqQ053cHh1U0Z1?=
 =?utf-8?B?blZLaElycWVRSndrWHl4b2ZvQUNyZUtkNm8xU3d2Q3VMMEhPT1VLZnNCeWNm?=
 =?utf-8?B?R0JBMS84Z05TdGZvWUYrNEVjNWdRWDV6OUg3VHNkcE5FbUhLbkJyMWtwQkJS?=
 =?utf-8?B?TDVlVVkzR3RwbWV4SHczUmQzSE9NUVB1Z0pFNUJsa0pmaHU3R2ZZaWs3VllJ?=
 =?utf-8?B?TUFUdkhDTS8xWTJPczJZNkVmUFdMV3Y3TFhGcm5ERmhOdEZVclhUaUZqakpC?=
 =?utf-8?B?UjZUTjVTRGNPY3dIdDdxQXNqU1Q5KzB2Rk5pTzgvVkhTNllucm9EK3VqK0RQ?=
 =?utf-8?B?Mmcvd0U2b0h6S0YxYTF0YnRCcDNrL3NLVWRaa0s4U2NROVZiN3YwMGV6SFA5?=
 =?utf-8?B?UVVtUXlpS3VtOHVVNW1GZC8xR2Y5ZGsrS29GMGk0MjlhNzhTalVrNklGS2E2?=
 =?utf-8?B?MnUwVTBpTDRITzlBWkd4Njc0aGs1TTVkUUpNcllpaFRqK2NTR2ZQRTh2V0RK?=
 =?utf-8?B?WC9uS3p4bUdOZ1JoR0hDbWUzSitnTHVCOGRSblVvVjV5K1pIYWdxUUltUTFJ?=
 =?utf-8?B?TTREVzRlT2QyTlp4TVIybGluUit6emxmZStxaU5GUWx3dzZldk1NWmxCeFgr?=
 =?utf-8?B?N2Z2dll6QUlydFd1OTdKSTZ6THRNVGdOdDFmNGxLdU9KMmw2VG9kRHozUyth?=
 =?utf-8?B?NkZFVzhBemFIQW5XZ2h4RkJDK0NBZWZ5eVRCNjFCQ01TaVNsNGc0YXJIRm9v?=
 =?utf-8?B?dGpaaFQ3QUtTdnVYckxHeXQvNzQ5M3lrbDBOd0J4WEZrYnBCRVA4NHdueTB0?=
 =?utf-8?B?U09uTXFUNXlpZGZ3Y3VDTjJrc3djVWZaT2t4MmdwK1lmZkdOZ0NlZm1tOHhw?=
 =?utf-8?B?TzZoNktFaEtQWEZ3Q3pJQU92dW1tNmxsSVlESFE1UU0ya2NCVklrS3RGV3Vh?=
 =?utf-8?B?UkFRNmt1b3BqQkJOQjFuOUZNOXI3UGZQNGQ2Q3RNLy9TdTZ3QVZpalcxcHRV?=
 =?utf-8?B?M3ZHcDFhMFNJVGM1bnBSTk8wSmw0b0l0NkNaVlB3RDVIc0dna21pN0NHaFdX?=
 =?utf-8?B?cHFyaWVFWG8yWlM4R1gxS2src2dBdUFnakdkQnpIMjMzM09HYWNLRXBrUjBV?=
 =?utf-8?B?VHhoYkFWWFNhczJraW9nVVo5M3BLajNkMFZZOEdJM2pvV2hFNkVCQjA5MHc5?=
 =?utf-8?B?cktjUFpkeW5jQzUvMW9lRFBMdDhVNyt3Vlk2MnV0bWFITEplcVdvZzEwUDB1?=
 =?utf-8?B?OXNxQzZSb0pHOTU2MTI5b0VITkc3RXhNSWlUd3dkbkVYT1RrV0F5OTN1TXlE?=
 =?utf-8?B?eW96dkNnQjk2eGxZRlFZS2t4ME9YOGZrSHIvbkpmRTNFN1hYT0ZKdW51bVNP?=
 =?utf-8?B?MEM2T015citMekZIaG1GWWVBVmdWVkpVYXNPN3I5NzY2eEZVNHBXdWFyMWZ6?=
 =?utf-8?Q?V2w7uY14mnTYNKCbLDcTjHyu/EdrjR92?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTN4OHRqdnh4Q1hyaGtiOGd2QXNsMm85TnFRazg4TTBVWUFDdlV3bVIwRjRO?=
 =?utf-8?B?UmxPR1ljblJWOWVnekFXTCtjRHNxVmtpTTRZTkVxYXRYdkp2Sys3eVRSOFNh?=
 =?utf-8?B?d3BIa1FUOFJHeEFWYW92T2VtT0FjVElPVEYyUTZ6bVV6andha05tRFFSVUFk?=
 =?utf-8?B?d2Jyd0ZEQlFCTG8xSWNDdFd2V3dtV0J2U1dCVUllUDBxaWNXdnBsb0RPdGd1?=
 =?utf-8?B?eVdNRjlaZk4rc054NDJYeHdaclU5NzVzVUVaZHBDNmtQYXh1S0ROYkd6bzZN?=
 =?utf-8?B?MXdhVVBvclZuOFVWTndXZzdQbkFpczYxejNxU0JDRm8yYkQwbVpHQVRTUHRW?=
 =?utf-8?B?NENoS2ZYVXoxMHRIQ1VuczVpbzFTTGNUYzlobFkwRjBUSlZjUi92QmtnNUpu?=
 =?utf-8?B?R0p4ZkVnV1JFQXhEcVlKeFRkbGhVcHl2U2ozaUNWTDEzOFRUYm5sbzZuWTdQ?=
 =?utf-8?B?WkQ0Z1JDNENoNWozZkRLZERQSlRQcitvcm1uNm5ZYmI2MHAyejRTU3BLbkxF?=
 =?utf-8?B?QjVGU1dlaUhmK3lheWJ0TktSa29MNG5TZTJzMTV6WUx6bnpoajgrajQyWW9w?=
 =?utf-8?B?Z1FOb2plQitjQUhiakZFb21OTWtzN2hYa04ra3VaWk53QmVDSys4MEpRRnVz?=
 =?utf-8?B?enR1dFdMQ2dTdzg4TDJabGlVWVJFQXR5VmRmVEgrbXB3aVc2Um1rMzlYcXJv?=
 =?utf-8?B?aWJFMVpHY0oxS2RGa0Rub3U5bFArSFVtaTF4UHV0cU9OUmVwWkJrRE1nN3h1?=
 =?utf-8?B?a1Z2TXNDMDlhbkVlaHFPbUhvOCtWaWtQRGp2b2hlSWlwZmR4YkdoZUE0Yk5l?=
 =?utf-8?B?YzI4QWNTT0crL2g1eHFzZDJNL1FXVmJmZGMzT2hMUkJGbHZRZ1d0b01FVUJ5?=
 =?utf-8?B?ODAwZGl5VWUxbWxxVlBKMjlzU2dybWlEeElkMkxyU0xxb1R1NFFMWXl3Qk9j?=
 =?utf-8?B?UU4wYXA2VDM0M0JZNFJ6cmRuUUk5Ymd4NS90RlNodzNpYzQvVFMvNzZOT0lx?=
 =?utf-8?B?Nm5vUkFSSkFYTkh2NmZhdDdPWEpBNDdSSm1tYW8raUUyR2JnZEFHQ1VTVGhQ?=
 =?utf-8?B?LzVmWmhOc1phYUtNbDZVdGFGZXlsYk9kZDlJWnBhOFFLZDA2NkJjb2h2aXVo?=
 =?utf-8?B?M1JzRXMydUlMaDh0ZE1aRXJlM2E1NENtZERzNVlGOFdqbDlmTWFaNE9KbEll?=
 =?utf-8?B?UHZOaEpqTEw1SXRKdkM1RWZWRlBwZTdMZEpVaWMxOE4wYzNWS1pLSHpXZlB0?=
 =?utf-8?B?ZEJyd21PYzJjZjVleDVOZThYb0lQcVF4R3hmTFlSODlhcUp3WnJxQmtZSTJu?=
 =?utf-8?B?WUtZTmxvdktycm9IaTJjaVBPcUI2L2NEK3p1elRWQlY3Q1EwWWZReXlaZEdw?=
 =?utf-8?B?TCsxaWpLbzdIbS9xVWVySmlGWW1rZ0pWSVUzVUN6QWxTSWZFYUwrZmM1ZFNv?=
 =?utf-8?B?am5jQjRTZFNycENrRUVLU2Q3RTlPQ0FFVTYydW1kRGR2bU5NUW1YQVkzcmpi?=
 =?utf-8?B?ZWg5TDcvVUxCUHd4ZVpjbS9WdG5iY0Z2TldtbTRaRzBtT3U0ZUFwVzRZUnhl?=
 =?utf-8?B?bG90SFFCZUJtT0JEa0xpN3lUeGJEbTl0SlRkOGI3TEsxaW1TTXBRZjQ1U0pN?=
 =?utf-8?B?L004U3BNYUlxZDk1a0ZsYUswWTRKYzVMdk5Eb1hiT3dZdXNwcWhOQm5BYkds?=
 =?utf-8?B?eWcrNHZEOGlIeUJJTnNucmxJTDFCbzZsM0RKL2RrT2FPK2Q3SXJlV0JaYXZP?=
 =?utf-8?B?aFNvQVN5bXNqWEpTNENaazQ4ZFJjUFlyRkh3d0hpVEJJMEs0dDdSWXR3U1Rh?=
 =?utf-8?B?d3ZPL0ZQczR3RExjbjI4ZFZDM0N4Ty93TFRKeDJtcEQ5TnVmZ0cyZElCOTdO?=
 =?utf-8?B?VXRBbzNMNWRoUy9VQ2xpbnIxWVpUWEtFNURodXhkNytFNmJNMG1ZaEtrMlV2?=
 =?utf-8?B?M1E0VEs4NVVMRHpBUXIxKzJwWFRMU2tCV1lGOEc4RG5xekw5ZjRSSWZQUGVn?=
 =?utf-8?B?eVNCeDNsSWYyVWVFcDRqcFFQSHQ3Z1NySEN3QUJxcU9FTFZZODFOZFlwT0RT?=
 =?utf-8?B?T0FUOHRWRm9JNW5UTmxHdHBWbGNVL0JtZCtwMC9LZGdDUU1JVld3c1N0cHdp?=
 =?utf-8?B?eDNVT2ZCTEluYzV6SUVDN1ZDUG1CZ0xOUUUxOVYwemVhWHpDaks2bHNEV2FK?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf57d1f-156c-4d60-b235-08de10aebe6f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 14:33:04.4165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/4qspeu0vfmJXJInsAzw5CCnO4JLDw67KGEPh09zxd6qtyVWa3/COQnmoeuq9se4+MGIbJEaa9x1nQ7DJNS0knsB3a5V7Gzu21ZhOc3gbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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



On 10/21/2025 2:39 PM, Tomasz Lis wrote:
> Convert `enabled` property into `disabled`.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c       | 6 +++---
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 911d5720917b..5ad39e315cb5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -130,7 +130,7 @@
>  bool xe_sriov_vf_migration_supported(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> -	return xe->sriov.vf.migration.enabled;
> +	return !xe->sriov.vf.migration.disabled;
>  }
>  
>  static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
> @@ -146,7 +146,7 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
>  	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
>  	va_end(va_args);
>  
> -	xe->sriov.vf.migration.enabled = false;
> +	xe->sriov.vf.migration.disabled = true;
>  }
>  
>  static void vf_migration_init_early(struct xe_device *xe)
> @@ -173,7 +173,7 @@ static void vf_migration_init_early(struct xe_device *xe)
>  						    guc_version.major, guc_version.minor);
>  	}
>  
> -	xe->sriov.vf.migration.enabled = true;
> +	xe->sriov.vf.migration.disabled = false;

this should be just removed (it's false by default)
>  	xe_sriov_dbg(xe, "migration support enabled\n");

and we already agreed that we will just log the "disabled" case
so this line should go away too

>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 6a0fd0f5463e..d5f72d667817 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -34,10 +34,10 @@ struct xe_device_vf {
>  	/** @migration: VF Migration state data */
>  	struct {
>  		/**
> -		 * @migration.enabled: flag indicating if migration support
> -		 * was enabled or not due to missing prerequisites
> +		 * @migration.disabled: flag indicating if migration support
> +		 * was turned off due to missing prerequisites
>  		 */
> -		bool enabled;
> +		bool disabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */

