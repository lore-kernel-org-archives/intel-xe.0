Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17C0CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 20:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777E710EADA;
	Thu,  4 Sep 2025 20:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgAc0KLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19B510EADA
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 20:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757019109; x=1788555109;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AVR4QRoY/sfDlhmjLae8UkurLL1QZby0yf6gGtjSJcs=;
 b=RgAc0KLeduWzdLkAb5t6RBqjeiCt+V+5M/Jj4RaM5L0BMVHNxFd5o4eE
 rK8QbxUpSvanrF93zZWQy8XbZc7Y92bIn2ceCXm3VP/QtlcG071Pi5Pbu
 jB4AEiUzC27Q9+Q9wuc263/R2KZsF5Tr3jvOyPD13Skwj6xidDQRrpFeo
 +t/17Kdp5IghNoUgqozKEaSCUX7Uo3ZF6by5Rg6A95zF1V+yYwAMe4LaZ
 ti9xyDIx9+ffmFeMVSMZKP7mvVZxMAXAIAz13FX6SoSN6UwZ7cVedrjMb
 QanNbC6JVY41vkAVsTQddNG0mFOcdFvDMucBPj6Cj5RbNXEXTphu1khrm A==;
X-CSE-ConnectionGUID: QZCR9rAxQuaneHksn2YaKA==
X-CSE-MsgGUID: C19uwqDlQgaw8Cna7/i68Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70469940"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="70469940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:51:48 -0700
X-CSE-ConnectionGUID: lq7UFNyhShOJv2YZfKwzGg==
X-CSE-MsgGUID: kbAsh7q3SRCD6S9m74NO8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="177217256"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:51:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:51:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 13:51:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXHfBDr8eCDtqrHVnRRRh5w8ZXbwHd8S0uiW+jPC0LptJhFz2cNmFgAcdHg062sZynUSxKPQ7rx1zpTiP17h8EvCBjQCdgoVafhpfOkVyPISUPZl7PnXIKikwj7211RviulCnK2iPpWSN6ziWHxGkj3rLuhV112GdKuJMQOHFiIYlT0FjhisNcrZhwl+pENJp0B63BgibWyokPnyH6ngc2K1wVoaIdEcimMr6DNzvj6A8ocZhyvHsS/kzPzDOwyI52NaFP0XLdMQZ6a5oQ5ho4WIZDZmhXMi9KN06enOl+HEl4Ot6PTB2fVpRADmTjvG9FpOYK6Dy2qLbNu3Xp9WCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGQgHis+3sJ7rFqch2cGDKy1KHfgrriBp3R0fq/6vHQ=;
 b=UvGmywTV0wGHnnYFY7aoCJIbG0hwbb0n77qv/TJXYABSWtq/a88ZMjp2HOyvbmRWK+lUSvIe47tiGzLfCJwJ/2JDfE0JgQMBeVTzk42NzWUbKQous/AEoqBjS9ugv0GpOylR6mtSo3NOaWnyQE1AIOpNWHsnOR9O889Ib/MFX075/55MMcrrsU2TVfL1cCMwvvSrOnNWG/UcsELr/HRRq0UXvGRKI8ZNOJ6fl1amSPwbo8cdIrTQeVB5x9LjjSU4PyeSaUeEOz5PhzPVc8vit/iYsJueL1S+jomEZ+jHIsJBqB55e+XNAeT0UWqkJmplhz9AHdPmsyUvYR/JJpIERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by IA4PR11MB9300.namprd11.prod.outlook.com
 (2603:10b6:208:56e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Thu, 4 Sep
 2025 20:51:44 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 20:51:44 +0000
Date: Thu, 4 Sep 2025 13:51:39 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: <John.C.Harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Return an error code if the GuC load fails
Message-ID: <aLn727E1Y0Jf_XRT@msatwood-mobl>
References: <20250904195505.3844671-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250904195505.3844671-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW2PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:302:1::26) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|IA4PR11MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: e312785c-66a6-4e00-55ef-08ddebf4dafc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3M0TkdLVHgrTG1ZSGhFSzgvSUJZOUh3OVd0TjA4QnZYekFoTy85cFg3ZVl4?=
 =?utf-8?B?OHArbmhjZUdRdUpoRVNsUEZSaDlnb3M3dzlFZnlXQlZFVW1VbGVJVXYxV1VF?=
 =?utf-8?B?RTV2eFV2VThzZjJrZ1BWYldHMjNuaTdDOUFxZUh6RW04M3VRNmh5ejdkY2xM?=
 =?utf-8?B?dERqQU5DMWk3amxEYUNrVmxwM1VUemRSV3RLemdSb3drZ2hJSjRwdmUxZHpP?=
 =?utf-8?B?L0xiMGlnQzFGLzQwOGxWaGMrR0VHcVVWK2hKOUpmTEQvbldKVzVVaEhub2w1?=
 =?utf-8?B?WVZkWHM0aHA0bzNYTVREaG9YSXpDa0htYisyWVdneGZHWEx6R0tUdGNMYVJs?=
 =?utf-8?B?dE90Y1NkTkRjVWpzakFQYzFZeFg3NjRmaXI4aGRsSGlKbUNDMEFXM3hONFoz?=
 =?utf-8?B?VWhCUUpNWUdIaXBjeUcvWUhtaHlxY3B4QXVrNFBlR0pEZnlvcUloQkdKbHEw?=
 =?utf-8?B?MnlYVGRXTCswVjA3N2IrMEdKTjNGNWsvME5nRVBVK3hneStKSm8wTkMrSkgx?=
 =?utf-8?B?cTJxRW1wLzVnZjBTbVNacnFXNGVVN0VlMWN6eTFVakdid0tuV1B3TVdXdEZF?=
 =?utf-8?B?VVpqUGEwU24wL2ZmNmlIUkF0UERFRFpDelVCQ0drd25iWDZmRzBXMWhXdXdW?=
 =?utf-8?B?Mko3SXJ2TER3L3hjQ09lbXJYNHVkWGRpMjg4RnNpbXpUbURWdXkrL1NqTlRu?=
 =?utf-8?B?NlltWmV0YjhqZzk2ZldRRkMxTnZsVVkramNOc2E4YkZRUEI1ZUpDMGlmQWVU?=
 =?utf-8?B?OG15T0VUbDFreWowTUoyTkdmQkdSalIyMnlkVHljZGRIWWx4ZVZFeGQ0OExO?=
 =?utf-8?B?NTF0dkZieFJzbkJvVlY3TFZGT2JMcm54aVd4eFdvcmNCM0ROTHcwM0FUU3JT?=
 =?utf-8?B?YzlDMUZrMVFpSGtCT2FqUGVIUU1KaUd2c3hEeC9FVkhMZE9pNExCYXNNcHky?=
 =?utf-8?B?d2R4c3pxYWhuM24xYVNpbDVteDdsM2FxbFdlaTBWWjFsRmhPM1hnc3gxc29E?=
 =?utf-8?B?d1lQaXlYRWxnL09tNWZZNnRLbGxFaGY0NkRQa0NPOFhSWUNWZk8rcVhlSTlR?=
 =?utf-8?B?KzJMTzVFRGViemF0OXhNSjJHZkgvN0VjVktjM2xRbEtld0RyWlBHK1pZc2NN?=
 =?utf-8?B?cFIzMHJ5N2l6bzE1R24vblF5akRrbE4zYTlhUmZsaW1rMXRpcEREZDJ2eUls?=
 =?utf-8?B?TDRzUm44QTVTOTEvcDBwRkdaS1JlblJFS0doS1ZSMGQzRXNtakR4MnBVbmdn?=
 =?utf-8?B?alEzT3d5ZjFIUndVUEtMR1FsWTZscmhqU2x3OGRaWktZNWdOZnAwZ1F4WEpn?=
 =?utf-8?B?RWRtWFltUmhQbUhZVHhwakdRak1yR1dPYU9qYklxbkttbjFUWlF1WDg3NTVF?=
 =?utf-8?B?dFlDY0lNc0NWOGkrVWc1WEE4aVNlN2tibjFHSGM5dGVMSGVac3QwUmIybWhn?=
 =?utf-8?B?UTdEd3VYbUZ6YWpwWWdrKzV5azk2OVJtNUtObENSV1d4RmRNK2RRL3hheHgy?=
 =?utf-8?B?RERhNnZ3NDZESm1BMlVpU3N5T2FDRVVYZnVrOGJWSlBYMlkwbDh2ZW9UVnNt?=
 =?utf-8?B?RFZJOHgzeVVuYXFOeWI0cm9wZVRNRVdydSsyWEI4NU4zb1NaaHo1V05kWDZa?=
 =?utf-8?B?eDJIVTg5ekZpVXB1NnIra1pMU2NLNXRYdzZRRHFIbStCZzA2eVQ3SGxOYVpX?=
 =?utf-8?B?TzVGdHlrQWpYb1IvWFB4ZEpxSnI3ZlFNMURhNHh2Wm9pbXA2eDlEbU5rcXAr?=
 =?utf-8?B?WVh5TDhNVVhZSVpVWkQzWXJOSndKOHdhWmtaRDY4bnpmZitZL0pCQW1mdllh?=
 =?utf-8?B?Z0NrWHAyTEEwN1ZLRWoyQzdSSVUvZzFGNHRHdXRjWDJ1MjhTWE9yMWdvNEph?=
 =?utf-8?B?MWlUZXJiOHliZ0xQZWppamFvRzRkZFJjdklTaG5Mbmk2SmRZY01jMTRGUC9M?=
 =?utf-8?Q?ZkFFmG6x4Ek=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRWdFZzRzJteXJGK0FGc0ZYZit3SzFxUlJTd2kwOTVpanN0TnF1dDhPcU1o?=
 =?utf-8?B?ZEwvZXNESEhUZDQzSUl0OXpkVG1xUnlTZDd2c2hSYTJQZE1RbE15TUJuRU1q?=
 =?utf-8?B?QkQyclVCd3J5dml5OXdSM2FkVUJFOXRCS2N0T1crdG1HMFU0c0pGSjgwd1NV?=
 =?utf-8?B?SW5SSzdGUENWczZ5R3RQR2JwNmszVjB4MTkyb3pJVjV1MzNZcmYzajdmWVVx?=
 =?utf-8?B?ZHJGb1p3U0M2WHQ3TmZQT1dQcTFXSCtDZm8rcW51MlFYUmpOOFZ0cTRBczBN?=
 =?utf-8?B?eUxJbTFEUGZMVWdwU2xVOTFqeXNtdHR6b1BZNWNIN2VHUlowSXJyRTV5UTFu?=
 =?utf-8?B?VzZjeVRhVnJaaWFKVm8zcGxEWDFCNVUrb09ZUXMrU0NxR05aWkpwcFJTU3Fs?=
 =?utf-8?B?Tmp2Ym82eFFYalhNTUJTVFF4ZnQvRHV6eGd2YXdxLzVZWC9pUXZDQTR4UVd2?=
 =?utf-8?B?YnNRV1MzcEtWVkVucjN2QjlZTlg2VzRRWStOZzZXTi9qSmVYTUNOTktvUWlx?=
 =?utf-8?B?MjlKeG9uSHZGcFRnTS9pemNTSGdqNXdETGE0MmQyK0pmWFdRa3JhamV1T2Nt?=
 =?utf-8?B?Qkp5YmtkYW1uMUlYTUNCc25nUmdxS1orZ1laVVVvSXhGZTViRytYQmljN0pR?=
 =?utf-8?B?N2plS3NScUZ2NWZEeUI0aUVqeWxBMlFCUXAvSGoxUjJRUWVpeFZmQzQ4dlp1?=
 =?utf-8?B?ZnhFdkQrbnltTGxkWkZqa0FIQXkwaE9jb2s1UytHaS9DWk83Ums1WXczUC91?=
 =?utf-8?B?RFJZM3JneGlLMGRFdUY0Z3pjeEZWMDRPdFpmZHJtV2tXc3VFRGhnSFhGWUJx?=
 =?utf-8?B?dkUwNDYwVnV4bFpuV0lkalg5a1c1c3QrSHRkaG5sVEtCTVJ4ZHo3aXFScmY0?=
 =?utf-8?B?OXZhcWlNS1c4MXFJU3N0SXl6MFRXK0J6VGgxK0FKbjVHOVZsZzJTcldZRkdr?=
 =?utf-8?B?WC9jbmhmT0JwcCtRZjdrVGw2RDNHNzI5RWIxbHBrQ04zN2hZMUprWDE2M2d3?=
 =?utf-8?B?RS9mYTJuQVdpQTVDUURvbVFKOVRWTXVhT2FBNTl5N3Q1OTd4eGFKQWFvRUo0?=
 =?utf-8?B?RmdNTnFXL1N6QlExU0N0Nkxxa21xQ3Q3OXlRNFJ2aG93K09YSjdtTGptMXI1?=
 =?utf-8?B?c0l1Z244TlRyN24rOFJYTWsyMlhBMDFMeG5lZ0dSYWcremVzc1hDK0l0ZTZQ?=
 =?utf-8?B?ZWpvS0czdVpUY3ZKb2tnZU5oNWl2U3pOUCtRWUZPZ25jaXA1VnhMdjVTQ0lB?=
 =?utf-8?B?WnFud0x4NjgyZGsrcHdselNzQUhsd0EwTDZsdElRMDJKeW1pWkVQVU5yOUpK?=
 =?utf-8?B?aUpvMHFpVjBBWE9mY0xYRjRKMldJc0tIdlArWTIrVXpKMzMrOUsrb3p1RHVT?=
 =?utf-8?B?RVhWNmZOL25uZnRYQ1pqOXJva2VNZVpONTQxcVlNb2RPaUU2VGNwL0RwdGFX?=
 =?utf-8?B?VUFtSjlOb1VDRVZMUGMxQmkxYTJlT1gzRnBQeWdzd0lEZ2V4cnJnMWd5YUo1?=
 =?utf-8?B?NUJkU25PckdrR3JIT3VzWEY3RTJsWDB4bkVUVHNjSkw1RlFJb3ZzLy9CMWFO?=
 =?utf-8?B?dU01elNaYUhGTmYvWE15a0hsSWZMRDh5YnIxdUFEcUdsTzgzejlrZXZhblBG?=
 =?utf-8?B?Y084Ym4yVFo5b25EWGg5b25URFJaZjJqaG4xRFpVY3hPMWlSQi9sZ1lRcjBZ?=
 =?utf-8?B?ai9NK3dUNmh1VWRzaS9YcWVxSEFqQ045R3dXYW5qYTlkVUJjYWI2SW5EOGxH?=
 =?utf-8?B?Qyt1enFWM2JGa3V3YW5MSTYrZTB6TVJqWVhnOWNwT2VWbUNUeWVwcWhzZERw?=
 =?utf-8?B?ZWhOcnkvMklLSnU1SE5aM3ljQTJJemZJSGJ4WWVzN1NYZjdJa01iM3NUbEth?=
 =?utf-8?B?SXhrVTF6VTZRTGJjR1Vud3pXZ2dKTkZXSnZkYjZZQWx6T0IvM1E2ZE4zR3hy?=
 =?utf-8?B?S2pJZ05ieU9qQ2QyZ1k0KzF4bHRmVFdha2ZWaWt5Q2hoMjhON0VUdWhxU1lI?=
 =?utf-8?B?WittbDk4YytrNXR2RmRSQ283MjRIRk9EQzF0U00xOUk5U3F0T2tHTnQyb0dy?=
 =?utf-8?B?N01FRlhGeUc2RlV0dlNLM0hOdENTZkxRTllxRXpPQWtkdG9SLzF1dDZacHJv?=
 =?utf-8?B?enlsTVR3UHlYem5LQ2pBa3FXSjZKL3hZUTl6U2taM0k4WmY1RlRNeGs4Sm1D?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e312785c-66a6-4e00-55ef-08ddebf4dafc
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:51:43.9546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjAD8NAvMbloExOYrPSE8UaYhA/B6L0HaE1mtgvkNwtkWOdGDMxXA2ouAE3AD9ZZXTivlCDhTh/PyLrpQ7pf1V0+90cpVIIjZ7T7+MbrRiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9300
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

On Thu, Sep 04, 2025 at 12:55:04PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Due to multiple explosion issues in the early days of the Xe driver,
> the GuC load was hacked to never return a failure. That prevented
> kernel panics and such initially, but now all it achieves is creating
> more confusing errors when the driver tries to submit commands to a
> GuC it already knows is not there. So fix that up.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b3a6408a5760..ed9d9e960ebd 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1066,7 +1066,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>  #endif
>  #define GUC_LOAD_TIME_WARN_MS      200
>  
> -static void guc_wait_ucode(struct xe_guc *guc)
> +static int guc_wait_ucode(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_mmio *mmio = &gt->mmio;
> @@ -1174,6 +1174,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		}
>  
>  		xe_device_declare_wedged(gt_to_xe(gt));
> +		return -EPROTO;
>  	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
>  		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
>  			   delta_ms, status, count);
> @@ -1185,6 +1186,8 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
>  			  before_freq, status, count);
>  	}
> +
> +	return 0;
>  }
>  
>  static int __xe_guc_upload(struct xe_guc *guc)
> @@ -1217,14 +1220,16 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  		goto out;
>  
>  	/* Wait for authentication */
> -	guc_wait_ucode(guc);
> +	ret = guc_wait_ucode(guc);
> +	if (ret)
> +		goto out;
>  
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>  	return 0;
>  
>  out:
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;
>  }
>  
>  static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> -- 
> 2.49.0
> 
