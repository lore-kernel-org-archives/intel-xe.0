Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD95C02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 22:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C7E10E1AF;
	Mon, 13 Jan 2025 22:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8wKxlbn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8BD10E217
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 22:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736806337; x=1768342337;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FJkhe3OWCi9md5Lo+V8xqXhlKNTAoUzo2yAYhSeKr5M=;
 b=m8wKxlbn2/iKMp9NdUctFpAhEF8siu3Hyiy1ZmMb1QOaaHsLb8fL23xI
 vq1tnofK7fsMjXOKsg9ywtfJoOpladI6JyZovSb/s2VOCw8u2JnaEKA2e
 31b1ygGkRLLpxqhDP+SPioR1baAz2IrMfVUDZmBzC5G84UiYqpmJHxlyG
 Rm/GYQ1KPTnfSkSh3B74JcRTEBiIhaI8oLujgSvg7CxRHxT04RXlXzSfh
 6CkCf1p2ovR4GlYvoGwuQSIBMXwCXbPk8Zj0BGdVzW78OnEsexSIibN5o
 AKx4XtbrODH31s8s/2IHf5lD+A2GrlmdBnYaIFc+xEYxtbMlVVjPFqZV7 A==;
X-CSE-ConnectionGUID: MZCV8S5YRou67LPB1wv90Q==
X-CSE-MsgGUID: gYW4cbmxSJWItjXJe9P7ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47665656"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="47665656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 14:12:16 -0800
X-CSE-ConnectionGUID: /9wJG6anT1msqnYMb8NLew==
X-CSE-MsgGUID: yV/QwxG+Tta6t4owb+oCEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="135442772"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 14:12:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 14:12:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 14:12:15 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 14:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iugkeS9ptFCVom7CnKEdqSjRZcjLqejy5Mcii/J6A1rCA7xTKOWwgh3RzzXtA2jE+fsKYLNcJcDIhwWv9/kU4qLC2SbZs2sQhUha/dvzx0tra6tIUrzB6L/hMGkRVyaVAxa5tXT1yQZzeYzspY6OLWu/BmV+W1mKpykkj01b8+/Vjk9TnLl5+iBSVovKl9gwZ9S6SGi9TL7iP4RqXnPUOX0gjV1ojDmc1uE2NhE53Ie5Bm0argWN2THI2UZ+BgX2ly60XeUorQ48Y5jBdFD1mM7akPguCHsj6ZWeSooZWRs/S1RF8Hhj2jUZE6LlIQfROiOWEQ1VcvZBBmcuXd1j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fi5u37gQrmgaIKSZYPjuh7qs0XGFb9Xxxmq/5/i27Y=;
 b=xjePKRtAxeVosR0cshYeNn7lKOSxPzTF+dbTvJ4q5aDvHYag4OKVOrWYVCJgo0MVvuv+PQwwsgzqDRUgrAdj8xGj2WbQzyipY0uyyLuDpK9XBbjnfRDIvpgucPvk/JQ8bXZig6CYwNP1mFRyYmjZXuGGWyguBaIuMnD38bnEdxPoWEppqRTyibvkyVoEJy6C4chjYkd8WOisI4WJGboNB77fiToSv7g09/hBlIHR0wkQQnpgJ50TFceVTQKn4M7fx2sOBnWpn1lgyaFmDErOyldJprILPN/9glTgSkFLrOBRb0CEkTul3J6khQch5uDWvkhGwscPcusqvSNk9gN+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 22:11:46 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 22:11:46 +0000
Message-ID: <05a1ebe4-543c-4bab-9a6d-5f2c02337797@intel.com>
Date: Mon, 13 Jan 2025 14:11:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] drm/xe/pxp: Add PXP queue tracking and session
 start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
 <20250106211212.3418231-8-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250106211212.3418231-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:303:b7::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 76515f9b-3051-4e94-484e-08dd341f44ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3hsQkExdnc4dm1VTnlHU2R3c05jbUpYeFpkVWNIRjgvMDExc2lMVHJ1a3VS?=
 =?utf-8?B?SnF3ZVc1T2dXZzliL0QyWTFORWxST3hXSm5Cd29XRFVQV1paY3RyWTZKQnJG?=
 =?utf-8?B?NEJNaXIyTVAvK3JTZGJpQU1HdUY5d1dDb2lPOVdIVjdzeHE2b3N0dHdURkFm?=
 =?utf-8?B?NDNPaUx1aTFMOGFudWxDclBPMFJBaHYzKzZEN3VRbE5hOUFyQUplRUlhMzVE?=
 =?utf-8?B?QnlhQVZUVGNXdEpmRTVLMWlGU1JvSjAwWEl5Rmh4SU9DQ3pUSEZTS3k5alhw?=
 =?utf-8?B?YUJjWmhXYzhBQWlMbnNYYjFoZnBNY1RHVXozYW1vNmlibXBjRkNMUFd2L2I2?=
 =?utf-8?B?T2VaRUdxcEFFcjRmTHFlN3lEaGpLTDlnaC9aaUtzUERyYmdBUVlFU3hCbFNw?=
 =?utf-8?B?enRsWGFOeCtFZ1RTN1IyOXFiem9SOGY2ZkM0cWkxNW5Xc3YzZTBob2lSenFE?=
 =?utf-8?B?UzdDU2xEYnNDcVNGU3VrVU4zc0M4S2c3VkpkenBVYlpRZDRTeWpqdjVxblhO?=
 =?utf-8?B?TC9PWU1la0pGQ2dJQ0JCNE5LbTByL1M1TDgxMU9yUzd2ZUg0S3JEbCt5ZmpY?=
 =?utf-8?B?WVc1RmhvLzNDRnZqS0poYUNsMDI4L0F1aXN5UFk0VzZaNVlQSUpFOWh4ejVq?=
 =?utf-8?B?WnNvaG1iOU9KN1hBNG05QytFbFlUTmlzWnBveTJkeVg1YU13NDFPQnU0U0xH?=
 =?utf-8?B?VW04NTBBVDNlc3ZhczRLaHVmYVFyV21UTE5pN2xFYkMxUUdBM05aOGVpYXFZ?=
 =?utf-8?B?ODlUcnZ0ZzhhUXNaMGtGckhiQnN0U0pSOFhnNmtQV1l0c2huTmFTVjZwMzB4?=
 =?utf-8?B?Z0orWWlzZ2J0b1ZNZnJ5aERyR0QxQ3NJdDA0d09vZUI0bEMzQlJ2aCtkN3JJ?=
 =?utf-8?B?eTBKR3p4TW9iajhwMk9weWlZMUlMZlZEYkdCcllBQzBjSFlXZ296cmJ6U2hM?=
 =?utf-8?B?ckNEZWN0NkFQbkVEQVZNOTk0SkV4VHVhRFlWMlptWHBCTXAvU0pLTE9TelBr?=
 =?utf-8?B?RjZ1Mk9haWpib21jNEJqR2FydUhvenVkWjlVZjVZZHlLYTlpbENzckcrUUlv?=
 =?utf-8?B?VkdRNGg3bGNFUGdSRXVxcm1yNVZxWHdocjJxMkdYV0NzazBveXdma2lWaU1k?=
 =?utf-8?B?NkFzcm1aWmhZaEpJQ0FPdTB1cHZidGlrSGxyTzI1RGY1YnlnclJHNkNXcjMz?=
 =?utf-8?B?ZEtod1B0ZnlEdDhTNUQrSzMwT3VJSU5xNWM3UEJtL2NoZ0FwaTdxU2xzcENy?=
 =?utf-8?B?MkxSclJTRVZNazk0cGtwWmFvVmZreXU5bTl0WGIwci8rWUNINmNHNmpvQjdN?=
 =?utf-8?B?cjNXbEtCRlZIY215Q3lJZnlPS2lER3Jmdk1pZ3I1TUJ0YjdxdjViejNPekJV?=
 =?utf-8?B?NGlPR2N3NDJKaEZ1NkpEOUxHT0dVMk9sdEdJUE1Dc1NySi8xcEttWWNzYXR3?=
 =?utf-8?B?OVdYRXJnR1dqNWpTWFNMemNWQldaSGpnRm45Mk5LSzVUbWEvK05aOWV3Tkxk?=
 =?utf-8?B?Y0ltTVEzbzI0aEJkZytPV0VZSExrSGhBaXpwMTNUSkd0dk8wM2x3S0YxZjl5?=
 =?utf-8?B?SEhnd0JBWDBONGJld2tYTDBOTUp2QW9SMlRCRDdOQy8zQVQ3THRVTlF1MWND?=
 =?utf-8?B?cXIreEpQUXAxV3pNbk1McE1FekJEOGQ1Mmcvdmd1R212a3JzSGpHUEw1Nnpm?=
 =?utf-8?B?T0FJdkdsZVlPT2FPTWMvR2pkQXdLVW9iNng4Vy9LTGJZYlZvTlhkcXBEWFJ6?=
 =?utf-8?B?azZMZXpDNkN2T1h4bzFQbGhNSEY3TldJMjJwNG95SHhqeWZzTDFBOWpyZDdl?=
 =?utf-8?B?czBZWkpKTXNnTDdPT2VMb0dLN2JpVkZVV20ySGZSVFJibUtMRHBBTENqd2dI?=
 =?utf-8?Q?8sp9SoOh0dxKs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXZENGc3UmVSWW9ZbitXUks1ZStPVFpIQjVQWUJnei9QU3BtRjZVcWMwZFhW?=
 =?utf-8?B?VE1UVGNNKzhpU2laeG1PZUZicFJ5TTUzckNWWHhBejlYemM3NDlqOG5MS0Jy?=
 =?utf-8?B?VWRqZ2VBQnR1RGg3aDM2by9jK1NIb2JtSzYxaytYdnVTcjhhSERmaVFoZlNw?=
 =?utf-8?B?Sm1HTmZpR3JSdmVaOGJvTk11RmRzeGVwWGd2U3RLbHJvU2JDMUloU01ZSEt4?=
 =?utf-8?B?ZDFjTTZ1N0lwUERYWUJ3Nm4reitkeklUWW8yalc4em1FVk42MDlJby9QMFMy?=
 =?utf-8?B?Q1dWWW1JRUI1bmwvbXVsUGRsdXM1Ni9iUTB0Ni9OQkw4K0pFNkdEV01CVDhW?=
 =?utf-8?B?KzFVaFB3UWtQNGtKZDl3SlZ2MjlCS2c2UU1jWmdWekVDcHMwZXBFY3YzWmg4?=
 =?utf-8?B?c0dHM296VFUvdWJJSzRPODYvRXVDUSs4cEp1Y282azQyNUcveDl1eFhxMVFN?=
 =?utf-8?B?dDN2R1ovY0JrdDlWK1cvTDR6YzVyMmxlUU9VZE5UaXVyUnBiMG8xczZWSjE2?=
 =?utf-8?B?R1MxdjRRaHVjTjE4YkJsOHlTRXFITHlqcEQxMkJ1Q2M2aHVXMXVTZ1JxUjM0?=
 =?utf-8?B?MmtRdk0yZ2liblJyT2k3ZmVNSWtRWkIvNG44SzJqdVhTalVyRlk5VmNXM2Er?=
 =?utf-8?B?Ynd4VkgxeUdrV1FBMHAzOUprdENMWjZ5S1lVVzNFd1pRdVFWVDVFbFNzS2JI?=
 =?utf-8?B?UnF5SXFPQm4rTklRTGpRMUE3cGZCeldURkNVV2VScXJaYk51eklSSC9peFR2?=
 =?utf-8?B?UVRUMG5KMGF6TTI3V1JtS0JlVlcxbnZvYTlxdW00TW1RSEZjem51eWVvRVFY?=
 =?utf-8?B?eVdBaldtNHA5SFprUmRUL0N0ZFlYUFNGRmY1ZElTZWpaaTZESWxmRUpQclB0?=
 =?utf-8?B?Vnl5Smd5eEV5RnpweG8wZ3E1Ums1RUxRUUJXSHFTSDBuMGxIZFU4cDBDMklz?=
 =?utf-8?B?R3A2S2dkVmpSZmhtNDlvVENyS2phZDdubU90QW5EZnZvQzFsakVnQ2l4UUlT?=
 =?utf-8?B?MGREM0NwWVFkQ01IQW5MTkt4cUd6WGRWVTFCUlpBZUp1UGFWTHdmWGthZFZk?=
 =?utf-8?B?TGJhQXZIN1FhaGpuWEtMTFJZTDFyV3FCQlQzM3phRnBiRGw4UTgzV1NhcXVr?=
 =?utf-8?B?aEx3bEtCanAwUXg1U0tPV2NwdHNrVll0Sk1kaUlCajJPdGNkaVFFTU5GV016?=
 =?utf-8?B?dlhWdEFCSlRwbFdoMzdubVVlbnN1ZzZkQUNuK255a1dKa3dlS283SDRNQm1U?=
 =?utf-8?B?Rzg1dTUzUXNYa0JGK1RmWnA4anp3Z0lPNk1XMUpmdnd0Z0ROZGZrV3pvTTM1?=
 =?utf-8?B?ZzFLUnFCZzBtR0pTK2V2bTlORXk2NXRGdjNadkZtbDBUUTNBVGErNmRVSjE1?=
 =?utf-8?B?cEo5emY1dnFrVlgrYWJRWjNKTk5ucHloVGlCaXduekNIeGZTbmt2dDJYRk5V?=
 =?utf-8?B?ak5wN0NwL05xMVFjVm1yREJObTBza0Y1OTZJOURpN0M0clRQNlB5UGVKaWNK?=
 =?utf-8?B?V0EvZVBNazFyQWxJYitHMTVVcW9rZkxab3pQTkRzS3Q3Ty9ieTJpR01jVXZl?=
 =?utf-8?B?cTNnL0dEb2dybjlVYU01OXpIQ3pWWEZwdUE1c29KdGFUbTM4RytITXV6ZTBJ?=
 =?utf-8?B?Rm5ydE9KbGhGZjJyVTU4T1ZaMkxrblpzMFdTMGlqL2tMYVdTcUtqbk5UZWRn?=
 =?utf-8?B?bzB0VlEyUUlHTEgzZkZHVEc3Nm14VGpZRThJN1FKdUo1TFpmNTBUWmR0NTMr?=
 =?utf-8?B?TlJMVXFZc3I5WlBuZVdPbUZCSnVnRUIvOElMd1B0V3RmNHh2bWk0QmFHTFlq?=
 =?utf-8?B?ejVmbm8rRmZJbU5ydDlDTUZmSTBBQVh6TlYwS1YwbFErY2xGOTl0R3hHaTVN?=
 =?utf-8?B?ZEcyZEFhdFFUL1UzM29NMVRtb2tXd0lrQlZ5T2dtSkJZMldhRFBJbHRGNytn?=
 =?utf-8?B?M3dWaHY5ZzJnNFFndlNKVWkzTDB1YmY3aThTaVpQUnFONzNJWGpHN3VYWk4w?=
 =?utf-8?B?a01KTjRmaHY3N3RtM0FOZWdkRE5xMHJlUng4VHhrbDFROFhJUWxCY1pUbHYz?=
 =?utf-8?B?Y2IzZ01DWWdsUG90TE9ocDlka2RqcXZ3ejlzRmpWemplNnZzeWRjWDJueVRH?=
 =?utf-8?B?eHpGM1EyUVZlaWM2anUyNTMzM1JseGw2TWlrREhNWnBjWWJ1eTd6OWpyMGFp?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76515f9b-3051-4e94-484e-08dd341f44ce
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 22:11:46.3331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QK94E5gd0WtCz2GhAZULHbpo4huC/jQjpYEb0NB7ak8NIklD3RH7wUSDLExHZFm6J/KpOdBTEzGt49TPKzXKOq8aNy1BsXI8GRg+PR8dQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
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

On 1/6/2025 13:12, Daniele Ceraolo Spurio wrote:
> We expect every queue that uses PXP to be marked as doing so, to allow
> the driver to correctly manage the encryption status. The API for doing
> this from userspace is coming in the next patch, while this patch
> implement the management side of things. When a PXP queue is created,
> the driver will do the following:
>
> - Start the default PXP session if it is not already running;
> - assign an rpm ref to the queue to keep for its lifetime (this is
>    required because PXP HWDRM sessions are killed by the HW suspend flow).
>
> Since PXP start and termination can race each other, this patch also
> introduces locking and a state machine to keep track of the pending
> operations. Note that since we'll need to take the lock from the
> suspend/resume paths as well, we can't do submissions while holding it,
> which means we need a slightly more complicated state machine to keep
> track of intermediate steps.
>
> v4: new patch in the series, split from the following interface patch to
> keep review manageable. Lock and status rework to not do submissions
> under lock.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
>   drivers/gpu/drm/xe/xe_pxp.c              | 383 ++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h              |   5 +
>   drivers/gpu/drm/xe/xe_pxp_types.h        |  30 ++
>   5 files changed, 419 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 252bfa11cae9..2ec4e2eb6f2a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -78,6 +78,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>   	INIT_LIST_HEAD(&q->lr.link);
>   	INIT_LIST_HEAD(&q->multi_gt_link);
>   	INIT_LIST_HEAD(&q->hw_engine_group_link);
> +	INIT_LIST_HEAD(&q->pxp.link);
>   
>   	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>   	q->sched_props.preempt_timeout_us =
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5af5419cec7a..6d85a069947f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -130,6 +130,12 @@ struct xe_exec_queue {
>   		struct list_head link;
>   	} lr;
>   
> +	/** @pxp: PXP info tracking */
> +	struct {
> +		/** @pxp.link: link into the list of PXP exec queues */
> +		struct list_head link;
> +	} pxp;
> +
>   	/** @ops: submission backend exec queue operations */
>   	const struct xe_exec_queue_ops *ops;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 1452a4763ac2..d0471a360d69 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -8,9 +8,13 @@
>   #include <drm/drm_managed.h>
>   
>   #include "xe_device_types.h"
> +#include "xe_exec_queue.h"
>   #include "xe_force_wake.h"
> +#include "xe_guc_submit.h"
> +#include "xe_gsc_proxy.h"
>   #include "xe_gt.h"
>   #include "xe_gt_types.h"
> +#include "xe_huc.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_submit.h"
> @@ -29,6 +33,15 @@
>   
>   #define ARB_SESSION DRM_XE_PXP_HWDRM_DEFAULT_SESSION /* shorter define */
>   
> +/*
> + * A submission to GSC can take up to 250ms to complete, so using a 300ms
use would be better than using

> + * timeout for activation where only one of those is involved. Termination
> + * additionally requires a submission to VCS and an interaction with KCR, so
> + * bumping the timeout to 500ms for that.
likewise bump

> + */
> +#define PXP_ACTIVATION_TIMEOUT_MS 300
> +#define PXP_TERMINATION_TIMEOUT_MS 500
> +
>   bool xe_pxp_is_supported(const struct xe_device *xe)
>   {
>   	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
> @@ -39,6 +52,40 @@ static bool pxp_is_enabled(const struct xe_pxp *pxp)
>   	return pxp;
>   }
>   
> +static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +	unsigned int fw_ref;
> +	bool ready;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +
> +	/*
> +	 * If force_wake fails we could falsely report the prerequisites as not
> +	 * done even if they are; the consequence of this would be that the
> +	 * callers won't go ahead with using PXP, but if force_wake doesn't work
> +	 * the GT is very likely in a bad state so not really a problem to abort
> +	 * PXP. Therefore, we can just log the force_wake error and not escalate
> +	 * it.
> +	 */
> +	XE_WARN_ON(!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL));
> +
> +	/* PXP requires both HuC authentication via GSC and GSC proxy initialized */
> +	ready = xe_huc_is_authenticated(&gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
> +		xe_gsc_proxy_init_done(&gt->uc.gsc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return ready;
> +}
> +
> +static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
> +{
> +	struct xe_gt *gt = pxp->gt;
> +
> +	return xe_mmio_read32(&gt->mmio, KCR_SIP) & BIT(id);
> +}
> +
>   static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   {
>   	struct xe_gt *gt = pxp->gt;
> @@ -48,14 +95,15 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
>   			      250, NULL, false);
>   }
>   
> -static void pxp_terminate(struct xe_pxp *pxp)
> +static void pxp_invalidate_queues(struct xe_pxp *pxp);
> +
> +static int pxp_terminate_hw(struct xe_pxp *pxp)
>   {
> -	int ret = 0;
> -	struct xe_device *xe = pxp->xe;
>   	struct xe_gt *gt = pxp->gt;
>   	unsigned int fw_ref;
> +	int ret = 0;
>   
> -	drm_dbg(&xe->drm, "Terminating PXP\n");
> +	drm_dbg(&pxp->xe->drm, "Terminating PXP\n");
>   
>   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
> @@ -80,14 +128,83 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   
>   out:
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return ret;
> +}
>   
> -	if (ret)
> +static void mark_termination_in_progress(struct xe_pxp *pxp)
> +{
> +	lockdep_assert_held(&pxp->mutex);
> +
> +	reinit_completion(&pxp->termination);
> +	pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
> +}
> +
> +static void pxp_terminate(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +	struct xe_device *xe = pxp->xe;
> +
> +	if (!wait_for_completion_timeout(&pxp->activation,
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> +		drm_err(&xe->drm, "failed to wait for PXP start before termination\n");
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	pxp_invalidate_queues(pxp);
> +
> +	/*
> +	 * If we have a termination already in progress, we need to wait for
> +	 * it to complete before queueing another one. Once the first
> +	 * termination is completed we'll set the state back to
> +	 * NEEDS_TERMINATION and leave it to the pxp start code to issue it.
> +	 */
> +	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS) {
> +		pxp->status = XE_PXP_NEEDS_ADDITIONAL_TERMINATION;
> +		mutex_unlock(&pxp->mutex);
> +		return;
> +	}
> +
> +	mark_termination_in_progress(pxp);
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	ret = pxp_terminate_hw(pxp);
> +	if (ret) {
>   		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
> +		mutex_lock(&pxp->mutex);
> +		pxp->status = XE_PXP_ERROR;
> +		complete_all(&pxp->termination);
> +		mutex_unlock(&pxp->mutex);
> +	}
>   }
>   
>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>   {
> -	/* TODO mark the session as ready to start */
> +	/*
> +	 * We expect PXP to be in one of 2 states when we get here:
> +	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
> +	 * requested and it is now completing, so we're ready to start.
> +	 * - XE_PXP_NEEDS_ADDITIONAL_TERMINATION: a second termination was
> +	 * requested while the first one was still being processed.
> +	 */
> +	mutex_lock(&pxp->mutex);
> +
> +	switch(pxp->status) {
> +	case XE_PXP_TERMINATION_IN_PROGRESS:
> +		pxp->status = XE_PXP_READY_TO_START;
> +		break;
> +	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +		break;
> +	default:
> +		drm_err(&pxp->xe->drm,
> +			"PXP termination complete while status was %u\n",
> +			pxp->status);
> +	}
> +
> +	complete_all(&pxp->termination);
> +
> +	mutex_unlock(&pxp->mutex);
>   }
>   
>   static void pxp_irq_work(struct work_struct *work)
> @@ -229,10 +346,24 @@ int xe_pxp_init(struct xe_device *xe)
>   	if (!pxp)
>   		return -ENOMEM;
>   
> +	INIT_LIST_HEAD(&pxp->queues.list);
> +	spin_lock_init(&pxp->queues.lock);
>   	INIT_WORK(&pxp->irq.work, pxp_irq_work);
>   	pxp->xe = xe;
>   	pxp->gt = gt;
>   
> +	/*
> +	 * we'll use the completions to check if there is an action pending,
> +	 * so we start them as completed and we reinit it when an action is
> +	 * triggered.
> +	 */
> +	init_completion(&pxp->activation);
> +	init_completion(&pxp->termination);
> +	complete_all(&pxp->termination);
> +	complete_all(&pxp->activation);
> +
> +	mutex_init(&pxp->mutex);
> +
>   	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
>   	if (!pxp->irq.wq) {
>   		err = -ENOMEM;
> @@ -259,3 +390,243 @@ int xe_pxp_init(struct xe_device *xe)
>   	drmm_kfree(&xe->drm, pxp);
>   	return err;
>   }
> +
> +static int __pxp_start_arb_session(struct xe_pxp *pxp)
> +{
> +	int ret;
> +	unsigned int fw_ref;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT))
> +		return -EIO;
> +
> +	if (pxp_session_is_in_play(pxp, ARB_SESSION)) {
> +		ret = -EEXIST;
> +		goto out_force_wake;
> +	}
> +
> +	ret = xe_pxp_submit_session_init(&pxp->gsc_res, ARB_SESSION);
> +	if (ret) {
> +		drm_err(&pxp->xe->drm, "Failed to init PXP arb session\n");
Didn't see an answer on the question from the previous rev - why not 
print the value of ret? Same for the second error print below.

> +		goto out_force_wake;
> +	}
> +
> +	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
> +	if (ret) {
> +		drm_err(&pxp->xe->drm, "PXP ARB session failed to go in play\n");
> +		goto out_force_wake;
> +	}
> +
> +	drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
> +
> +out_force_wake:
> +	xe_force_wake_put(gt_to_fw(pxp->gt), fw_ref);
> +	return ret;
> +}
> +
> +static void __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	spin_lock_irq(&pxp->queues.lock);
> +	list_add_tail(&q->pxp.link, &pxp->queues.list);
> +	spin_unlock_irq(&pxp->queues.lock);
> +}
> +
> +/**
> + * xe_pxp_exec_queue_add - add a queue to the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to add to the list
> + *
> + * If PXP is enabled and the prerequisites are done, start the PXP ARB
> + * session (if not already running) and add the queue to the PXP list. Note
> + * that the queue must have previously been marked as using PXP with
> + * xe_pxp_exec_queue_set_type.
> + *
> + * Returns 0 if the PXP ARB session is running and the queue is in the list,
> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> + * other errno value if something goes wrong during the session start.
> + */
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	int ret = 0;
> +
> +	if (!pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/*
> +	 * Runtime suspend kills PXP, so we need to turn it off while we have
> +	 * active queues that use PXP
Technically, this is not turning anything off. It would be more accurate 
to say 'hold a reference to prevent suspend happening'.

> +	 */
> +	xe_pm_runtime_get(pxp->xe);
> +
> +	if (!pxp_prerequisites_done(pxp)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +wait_for_idle:
> +	/*
> +	 * if there is an action in progress, wait for it. We need to wait
> +	 * outside the lock because the completion is done from within the lock.
> +	 * Note that the two action should never be pending at the same time.
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS))) {
> +		ret = -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	if (!wait_for_completion_timeout(&pxp->activation,
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS))) {
> +		ret = -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	/* If PXP is not already active, turn it on */
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +		ret = -EIO;
> +		break;
> +	case XE_PXP_ACTIVE:
> +		__exec_queue_add(pxp, q);
> +		mutex_unlock(&pxp->mutex);
> +		goto out;
> +	case XE_PXP_READY_TO_START:
> +		pxp->status = XE_PXP_START_IN_PROGRESS;
> +		reinit_completion(&pxp->activation);
> +		break;
> +	case XE_PXP_START_IN_PROGRESS:
> +		/* If a start is in progress then the completion must not be done */
> +		XE_WARN_ON(completion_done(&pxp->activation));
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_idle;
> +	case XE_PXP_NEEDS_TERMINATION:
> +		mark_termination_in_progress(pxp);
> +		break;
> +	case XE_PXP_TERMINATION_IN_PROGRESS:
> +	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
> +		/* If a termination is in progress then the completion must not be done */
> +		XE_WARN_ON(completion_done(&pxp->termination));
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_idle;
> +	default:
> +		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u\n", pxp->status);
> +		ret = -EIO;
> +		break;
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	if (ret)
> +		goto out;
> +
> +	if (!completion_done(&pxp->termination)) {
> +		ret = pxp_terminate_hw(pxp);
> +		if (ret) {
> +			drm_err(&pxp->xe->drm, "PXP termiantion failed before start\n");
termiantion -> termination

John.

> +			mutex_lock(&pxp->mutex);
> +			pxp->status = XE_PXP_ERROR;
> +			mutex_unlock(&pxp->mutex);
> +
> +			goto out;
> +		}
> +
> +		goto wait_for_idle;
> +	}
> +
> +	/* All the cases except for start should have exited earlier */
> +	XE_WARN_ON(completion_done(&pxp->activation));
> +	ret = __pxp_start_arb_session(pxp);
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	complete_all(&pxp->activation);
> +
> +	/*
> +	 * Any other process should wait until the state goes away from
> +	 * XE_PXP_START_IN_PROGRESS, so if the state is not that something went
> +	 * wrong. Mark the status as needing termination and try again.
> +	 */
> +	if (pxp->status != XE_PXP_START_IN_PROGRESS) {
> +		drm_err(&pxp->xe->drm, "unexpected state after PXP start: %u\n", pxp->status);
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +		mutex_unlock(&pxp->mutex);
> +		goto wait_for_idle;
> +	}
> +
> +	/* If everything went ok, update the status and add the queue to the list */
> +	if (!ret) {
> +		pxp->status = XE_PXP_ACTIVE;
> +		__exec_queue_add(pxp, q);
> +	} else {
> +		pxp->status = XE_PXP_ERROR;
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +out:
> +	/*
> +	 * in the successful case the PM ref is released from
> +	 * xe_pxp_exec_queue_remove
> +	 */
> +	if (ret)
> +		xe_pm_runtime_put(pxp->xe);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_remove - remove a queue from the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to remove from the list
> + *
> + * If PXP is enabled and the exec_queue is in the list, the queue will be
> + * removed from the list and its PM reference will be released. It is safe to
> + * call this function multiple times for the same queue.
> + */
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	bool need_pm_put = false;
> +
> +	if (!pxp_is_enabled(pxp))
> +		return;
> +
> +	spin_lock_irq(&pxp->queues.lock);
> +
> +	if (!list_empty(&q->pxp.link)) {
> +		list_del_init(&q->pxp.link);
> +		need_pm_put = true;
> +	}
> +
> +	spin_unlock_irq(&pxp->queues.lock);
> +
> +	if (need_pm_put)
> +		xe_pm_runtime_put(pxp->xe);
> +}
> +
> +static void pxp_invalidate_queues(struct xe_pxp *pxp)
> +{
> +	struct xe_exec_queue *tmp, *q;
> +
> +	spin_lock_irq(&pxp->queues.lock);
> +
> +	/*
> +	 * Removing a queue from the PXP list requires a put of the RPM ref that
> +	 * the queue holds to keep the PXP session alive, which can't be done
> +	 * under spinlock. Since it is safe to kill a queue multiple times, we
> +	 * can leave the invalid queue in the list for now and postpone the
> +	 * removal and associated RPM put to when the queue is destroyed.
> +	 */
> +	list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
> +		q = xe_exec_queue_get_unless_zero(tmp);
> +
> +		if (!q)
> +			continue;
> +
> +		xe_exec_queue_kill(q);
> +		xe_exec_queue_put(q);
> +	}
> +
> +	spin_unlock_irq(&pxp->queues.lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 39435c644dcd..f482567c27b5 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -9,6 +9,8 @@
>   #include <linux/types.h>
>   
>   struct xe_device;
> +struct xe_exec_queue;
> +struct xe_pxp;
>   
>   #define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xF /* TODO: move to uapi */
>   
> @@ -17,4 +19,7 @@ bool xe_pxp_is_supported(const struct xe_device *xe);
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
> +void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
> +
>   #endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 311d08111b5f..bd741720f67d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -6,7 +6,10 @@
>   #ifndef __XE_PXP_TYPES_H__
>   #define __XE_PXP_TYPES_H__
>   
> +#include <linux/completion.h>
>   #include <linux/iosys-map.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   
> @@ -16,6 +19,16 @@ struct xe_device;
>   struct xe_gt;
>   struct xe_vm;
>   
> +enum xe_pxp_status {
> +	XE_PXP_ERROR = -1,
> +	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
> +	XE_PXP_NEEDS_ADDITIONAL_TERMINATION,
> +	XE_PXP_TERMINATION_IN_PROGRESS,
> +	XE_PXP_READY_TO_START,
> +	XE_PXP_START_IN_PROGRESS,
> +	XE_PXP_ACTIVE,
> +};
> +
>   /**
>    * struct xe_pxp_gsc_client_resources - resources for GSC submission by a PXP
>    * client. The GSC FW supports multiple GSC client active at the same time.
> @@ -82,6 +95,23 @@ struct xe_pxp {
>   #define PXP_TERMINATION_REQUEST  BIT(0)
>   #define PXP_TERMINATION_COMPLETE BIT(1)
>   	} irq;
> +
> +	/** @mutex: protects the pxp status and the queue list */
> +	struct mutex mutex;
> +	/** @status: the current pxp status */
> +	enum xe_pxp_status status;
> +	/** @activation: completion struct that tracks pxp start */
> +	struct completion activation;
> +	/** @termination: completion struct that tracks terminations */
> +	struct completion termination;
> +
> +	/** @queues: management of exec_queues that use PXP */
> +	struct {
> +		/** @queues.lock: spinlock protecting the queue management */
> +		spinlock_t lock;
> +		/** @queues.list: list of exec_queues that use PXP */
> +		struct list_head list;
> +	} queues;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */

