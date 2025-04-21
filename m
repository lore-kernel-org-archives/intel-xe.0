Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122BAC369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 04:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB38F10E20F;
	Mon, 21 Apr 2025 04:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRqEXLdm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6189810E20F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 04:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745209872; x=1776745872;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ij1Y1OcInFdQN08r82glt3lr9Uq+tgXoLGMtVMLSL4E=;
 b=DRqEXLdmrcCRqsJY72Wv+gFuBpD4K2qU+CkCTSTnFnxvqON9NcRXt3MN
 YauFI6AU5Nr3Nhf7tIPKSPMK+2ZaFqSgY9zHQQ5br25CDuntIxnOn355k
 kWMUNihYG9jhhSHl2KkX2DyO6LZJWEC6en/2+1ZEMy8SVDrOoNAQe9rBb
 FkcazxHy+2ZRphpdCAinoKgq7asz+IYNZgiP4j2ibL/j7bUoCaLDqG+Jt
 P0PLyeEpIB6Po8m3SvKyPK2cMX/d1weOpgEb6Ep49x1LwT0XlqgJfXqcs
 EGEurEsIc+z53VFY1gPJgEvmfUle4Z5pWwj/fg/bTm8/gikFFcGp6v/F+ A==;
X-CSE-ConnectionGUID: dF9V5BfSSd+Q/8yOivqGOw==
X-CSE-MsgGUID: J1gJR8L0S020AVDr9JDJog==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50566507"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="50566507"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:31:05 -0700
X-CSE-ConnectionGUID: kTF+JmCnSqyss9VNjL/A4g==
X-CSE-MsgGUID: bNckoAnOQVCjaoDs0XRSXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="162658625"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:31:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 21:31:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 21:31:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 21:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYW1VemilJBm/EwwTkOYlIswDvx8SV/GKKzz72z9D8AmBy6DfWRslSYw3I7PCxYMPKIJegX1ujuYLYDXZ9i/OKl9WdQPE7Iph2O1dv3bGnNfpmltktEkSfsNWOO4m793jmeAAyrFmBnXPcam1aLPQEFtLeC++p//T1+8W0BuqXVUz5mX72Fc1aMKRXe69ku5BJ0g/ieTNbkAlsAVP1L7hD004+NDsjZYpt1jjxWlDFOtPyEFupXAUA+m6VEDmsdGhr9Sz0Jpupw4/r8kjP1nG8w1MJO30UhlkR/iTAZF+gaI+DIhTpPyJPeygDcwzqyGL+AeWHnl6DvuNNTplnHK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLqyBw5h+YHMv2PzcTdAgURoL9fLr4IVSPYrp9WzCXg=;
 b=EPJQ3whB9ioLUuF9/UvyYQf5ayZZAD7wwhHBfLQ8VfT31yeTQlUeecS4vjeNXw5+bz/kK5toW57UAEcBxBEc9XPoxms3XwE8WcxvPPu64xjMg1V2dqI5forRL50iHmMbQnhY4jSeizdJgRtop635CXpCN4LyD0Y2sF2KgbWF7AADHqHlsZ5RhYgEjljhTfqHTRqQ9NZjOHaw5FS9uYzWlWXcSzYPCQVOy9dc+89v0L+XcDjPoAy09As3kTja4btCf/+x7yYJZmJbkkkhnPp5Sa/XgZHhJR+h0kiiEgJXfkzSaB7iCkQmMW3fzmZF0rwE3YSTYCwkgJSXj3Dz4DDsOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 04:31:00 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 04:31:00 +0000
Message-ID: <f0530cbf-3dcc-4860-9c0c-ef1d544a5ed5@intel.com>
Date: Mon, 21 Apr 2025 10:00:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/32] drm/xe/svm: Refactor usage of drm_gpusvm*
 function in xe_svm
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-11-himal.prasad.ghimiray@intel.com>
 <aABuJfAvTnFHbFGs@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aABuJfAvTnFHbFGs@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: c9eeb2b9-bf3e-4a1f-df71-08dd808d5124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjFwc29LN3Q1RDFwK1dzVFc4NFNKNUkreWlVQzRTT0NRYkk4bXFJUVNIQ0pE?=
 =?utf-8?B?ZDRtcFhsM0J5MysxaHhpYjBrTlJ6bDEwSng1dUFETGE0Q0hOaFd0YlpuZ2c5?=
 =?utf-8?B?TXgvNlVZcDFFajkvY3lmNmQ5WGVBYXRzc1g5dlpMdzY3c1QyNjN3SkdBZzdN?=
 =?utf-8?B?MjI0VUFOakZpSHpIZGR6bUhyZzNNOUZIOG50c3RsZ3VTb0orSllaeDBQSjhW?=
 =?utf-8?B?M0d2UmxxakpoRG40TEJvTU5ybkZwckRnK3B6UnRGTTI5S083RGw5S3h0T0ho?=
 =?utf-8?B?NGRVUVBWakE5dmovSFpPbFVCRzVaQXJZZ2s2dGppbXlWRXlIenpDbE16TjhQ?=
 =?utf-8?B?aXkybENXVXdaeFRiQlFBcG1UdFEwUkM1TTlTVUs2N2tBNTE2WnkzZUF3TnNQ?=
 =?utf-8?B?Z2UvalJOZzNvditYLzdQck5rTHZaOFV5QXlNcmkxWkZ6RWdBbVpmeXg2bDE2?=
 =?utf-8?B?WTV3MTdFSXVMOVJXVWYxL0oxY054b0hjcUFYZEFFdUNXcG0zVTFJOWlmeVli?=
 =?utf-8?B?U2dOUEZaSWZMd21mS1pJa3BkRjIzREErK3NyQi8vb1lXcTBzbkJhQzBJSXZM?=
 =?utf-8?B?ckhyRW1FSk11L0s5bDFjbG81Q0RrcXlZTVNaSWdNTmpub04rUWNmNkI1dnFU?=
 =?utf-8?B?ZTgwOVIrcnRDdHVCeWhYQmVMa1NTWXF6cU5yY3d4QU1iSWs1Z0dHTjNTU1l0?=
 =?utf-8?B?dE1XY1ROV0YweFBESlF0ZVBYaEd4T3RKZm5NL0dmZ25PeXE0VVZtbko1enRy?=
 =?utf-8?B?aEoxM0NKSHVoeHI5YnlzRjJ1THI3WnZ5cVZnRUxOZk1wTnJsR1F0ZEJLZTlT?=
 =?utf-8?B?RkZLaXAzbVFZcTdwY0ZyR041M1F0cHlHRTM1R0JkOFpJM3c3a091c0MwV2pm?=
 =?utf-8?B?UFFwSzkxY1RGWm5UUkRQa1p3TjlJaXM5MExEc1BsZ1NrdlFZSGViZzYycGhS?=
 =?utf-8?B?K29lN25KQnBsZDZXVThhdjRZVDBiYU5ibzkwMmxJaVZtWm5lUzlnUCtYRmIv?=
 =?utf-8?B?UnY3VXpyQmU0ZElmc1NzZVJKcjA3YW9CcktMcHVFQnE2bXVpcW9JZTZ1WkR6?=
 =?utf-8?B?ajBJaGRqOUdtb1Z1Tk1QYzBhN2VoMGEydnNPSkF1Rm1objA0SEEyNGxiS2tL?=
 =?utf-8?B?MjZUMmx5QitDTU5mb09TRnFEei9RVWQ4a1ZrSVNHeUMvN0JoWVNKVmxhTHI0?=
 =?utf-8?B?YlFDejI2Z2NTSnRIU2pyKzl2YmJxRUtOb2VGYVFQajZEUjcrdEJMZ21temVF?=
 =?utf-8?B?NjRCSmJkTHphRlZvK2pPMVo5OTlnUkJYTUVIb0VxaUhCT0RkWWVYV3lmQ2pJ?=
 =?utf-8?B?Wm1LSjJzcE9NTHd1NzIrUk1kRjdHWlluaEw2WnJMcStTZ1N6RzRxSmphUXpN?=
 =?utf-8?B?MGhkWUVreHR3TDBUM1cvaDU3Z2Rla1pQWnlYNUhLM2hGcndLMmJHODBMVVpk?=
 =?utf-8?B?ZnVtOXJOMWltUnFxeHN0ZzZjN0JLMERScDVMc1BvcnVpTzQ1N2tqbTUyT2lz?=
 =?utf-8?B?TTdFNjJSUTBpQUFFVHFGUHhXMFdoWU9Gc3ZVZTZQNXRqeWZseWxrb2xxdS90?=
 =?utf-8?B?S0JiUkhEVXJyME5RMWF1UGk5R1FPSU56blJCaEp4NHVIelFPZHk3WXgvZGF1?=
 =?utf-8?B?aTc5MEJUdndxdzZOdEJIQzUvTzcvZ2tSZ2FiZzhOTC83U3NmMXpFQXljRllY?=
 =?utf-8?B?VEpNWlhqc1Z0YjBzSFNSaGNKckhEUk53ZmdMUmJ5amtraDd2NjFrcDVEaGpa?=
 =?utf-8?B?SjRRc0JYNnNodkhRaXNMa1NwL09IdXk2bnlOa0pwbjJwaGxvOFFDWVAxak8r?=
 =?utf-8?B?WkdVaVdDTVNKN0VnWHdvZXRWRzkxSWpFN2pyb1ZkOUlXSjUzSFZ3L2pzMFUw?=
 =?utf-8?B?a2E5dDNGS0h4aU1OQWpUM3VJZGJzWkp4eFg5S1FjTDBMbmJDS1NoOTRObjlP?=
 =?utf-8?Q?ooOMzvbnA7Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RncreVRRNGFPVm5LVGdNMk44RjJLbVVxR2E5WlRDWmVZZEc0WDhlVUlwaFdJ?=
 =?utf-8?B?N0ZDUDF0WUFZeXJ1TTVnenM1dFJwL0w3QkpOWk9ScXg0ZjM1RGl2L0tyclhV?=
 =?utf-8?B?SU9jTDJlRVNXR2lBRlZTZmtJcnAzRklDbTU3RmtqdlJ4OWVzUUJ0a0ZPbEJD?=
 =?utf-8?B?TUsxejBrL3dHUmhjcTlsWG02akhoWGxrSEtWQ2dtVEYzU2VJNlVWRDBNTWhn?=
 =?utf-8?B?TGZhZVBUT0JYVmxjZU5Dbk5JNy9TNEtRTFZkVXJNUzdTbm0zRC9abitLU3l4?=
 =?utf-8?B?cnF6OHdsTnJaNWQzTG9yK0loNk5KQXI1ZlBjc2JCcG5MMmtyWjFtRFFRWlRM?=
 =?utf-8?B?Wms0eG9hMm9FQjhBT01HRHVkdWZBSWFodVpMT0dxSkZHSCtaRmxQSWRncTFn?=
 =?utf-8?B?R1Qza1hNRktNVnN3dGM5TTFEUlFPUnNRcHRGeEsvYVk0dFk2MythN3lGVDA3?=
 =?utf-8?B?Y0JqeDBMamJKamRQUTRYOG5PSTlvUEw4OC9od3huRVQ4Y2Rkb1Fidk94T0Vo?=
 =?utf-8?B?Nkt0UkhyTTFmTE5FQnJzTDhBQXg2dVN0T3UzbzJocjFJa25Rd25IYkZnRkRT?=
 =?utf-8?B?NlhjYVFsOEJNeXhDR1doNlRVc1FPSDUySkVHWHJBdzFBQ2N6aVNUR3YyUFpv?=
 =?utf-8?B?WjhlSXozNlhqS204Z1dLVnJrME9hVDBhMHMzUElYY1A4VEJyaW9GWlZuQnlP?=
 =?utf-8?B?Y1lQRW1TdzJKMmVVTisxVVBhRE9YbWk1NHZSSkpzR3Jvb1puT3huZTVUandk?=
 =?utf-8?B?UUw2c0JPa3RSN0pqQi85V0hEVlV3MnBzTVZNVGt0Y1JVRyttcUFaQjhWUTMw?=
 =?utf-8?B?ZW52R29McWs3OUJUL29nNDJkVUxmMG5ZL3RqejY1T21mNlNpZE9ES21RS0pa?=
 =?utf-8?B?NGllY3pOelZ1ZVVUYy9kV2VDeU9hdGRKek43QzAvcDMvRmNJQUMxRGVJa05C?=
 =?utf-8?B?RFlERkFObitaaTR2RThVZkh6TWpJeUk1d1h0a0FadXFNUW91NFh4Yk5hWWQ2?=
 =?utf-8?B?VDFPWFNOYUg3Vm1SdGtpT1JMNmU0Y29qWkFPeVNuZ3NwS1NJNHdPTzRYTllt?=
 =?utf-8?B?UmNuWk9ETmpvTWNnaWc3d3VOU2R5YzNpVlhkV1YwV3pUaVY1bTF1ZndVMDdu?=
 =?utf-8?B?Q1A0WjVscUNyRHdIdlFhM1hiVDRxQndtV2pFWGlpaURoSHRkTkdoSVdxaUNY?=
 =?utf-8?B?M3JwZ0g5MTVDUnFCN1pJdVQ1ejlwS3VidWJpbnUxbUtKeWVnTVlpOVJiTTBl?=
 =?utf-8?B?cGhod3pMdHgwdTFpMTVrZnNqTHNxYUhERGNOZ1RsalVRWG5DQ1d1cEJaNFp1?=
 =?utf-8?B?bGFIQzJSYk0vSXpZTWlKeEVWdkNOWUJGTDZwQU1IT3h1aHd3ek1XdGhOQVBE?=
 =?utf-8?B?Z1JQK1RhMXZBOEw4R0d6ZVN2ZVdHNzh3TTlaZ2VINjhTWGFzQ01ZSDZDS1JG?=
 =?utf-8?B?MEtDdmtXS3NEQlRRQzRiZ0FheFBDRkFPOGtkRWI2YWRCbUtSakJJdDAvYkpF?=
 =?utf-8?B?R0pQNUQxaTRmbGlPQk9BdVIvT2lHR05FUGNMNG84MlNTaStrR2p0TXdxOEp0?=
 =?utf-8?B?M0lyKzJsYmRrdmgybjJTcEtiNHd4MDJUbmcxbXJ5Y1p2MElreGplZ1BRT1hm?=
 =?utf-8?B?V1A2WkdxOTUrTm5SR1hVN2h5dHJYUytEbmhKUmZGbWhLNVhMTDEyN29XOEpR?=
 =?utf-8?B?bXFvL0tGdmRpU1g4SXBDVmxXZC9PU01sbjIzcTB0akFiR2FVajBHdjZMdlZM?=
 =?utf-8?B?blVVVHpsSlJsZ1Q0WldLOU11eXhmRlJvSmc2RHhLNVdITC9YMTBlNUxXK0ZX?=
 =?utf-8?B?UUU1dDV5bEwrMlNBZ3FlcEtFbElnMjZqZ0NpaDRpYW9USDFHL0Z3UGh5V3Mz?=
 =?utf-8?B?NWdVK3B0cjVVeWhEK0ptNGduRlRVaTB3Zjc4WmhqdW4zemszdXc3Q0VpQzd4?=
 =?utf-8?B?c0FwQ1NVR2d4R0ZrVlBMb2lsYXNNUjVUS0tQYk1EOTR2V1o3TUd1OWV1NklC?=
 =?utf-8?B?am45bXB1eXFJWG00amRhTWxKVnJBTlhlVFptZDdaeEYrZnNySHFEYXI3ZE9l?=
 =?utf-8?B?b000MUJXb0dVeHFrWjRHOEJHbEttU1JWRlRFVHdKRVYzYXRpVG9UR0Q3WUM1?=
 =?utf-8?B?RFU5eWdIV0o4WlpkUjAycGVYcnRqRkQzTEFBTVlrSG9VaTlwSWFtZHlMSTF3?=
 =?utf-8?Q?gzKHQI5qBffj1lxK8wCbsfY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eeb2b9-bf3e-4a1f-df71-08dd808d5124
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 04:31:00.0184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TUZxTy/yg49oYSrx3CClUCuVlx5MsJXO3jgNdGSRw06DqlM1cKWcBZJeG12MWulLxhQHFNCaDPiRQ4AqBo/PLtrMX7Sh5oERgLvPuFGXuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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



On 17-04-2025 08:27, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:46:57PM +0530, Himal Prasad Ghimiray wrote:
>> Define xe_svm_range_find_or_insert function wrapping
>> drm_gpusvm_range_find_or_insert for reusing in prefetch.
>>
>> Define xe_svm_range_get_pages function wrapping
>> drm_gpusvm_range_get_pages for reusing in prefetch.
>>
>> -v2 pass pagefault defined  drm_gpu_svm context as parameter
>> in xe_svm_range_find_or_insert(Matthew Brost)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 67 ++++++++++++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_svm.h | 20 +++++++++++
>>   2 files changed, 75 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 6648b4da0bca..8cd35553a927 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -735,7 +735,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>>   	};
>>   	struct xe_svm_range *range;
>> -	struct drm_gpusvm_range *r;
>>   	struct drm_exec exec;
>>   	struct dma_fence *fence;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> @@ -753,13 +752,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	if (err)
>>   		return err;
>>   
>> -	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
>> -					    xe_vma_start(vma), xe_vma_end(vma),
>> -					    &ctx);
>> -	if (IS_ERR(r))
>> -		return PTR_ERR(r);
>> +	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>> +
>> +	if (IS_ERR(range))
>> +		return PTR_ERR(range);
>>   
>> -	range = to_xe_range(r);
>>   	if (xe_svm_range_is_valid(range, tile))
>>   		return 0;
>>   
>> @@ -781,13 +778,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	}
>>   
>>   	range_debug(range, "GET PAGES");
>> -	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>> +	err = xe_svm_range_get_pages(vm, range, &ctx);
>>   	/* Corner where CPU mappings have changed */
>>   	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
>> -		if (err == -EOPNOTSUPP) {
>> -			range_debug(range, "PAGE FAULT - EVICT PAGES");
>> -			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>> -		}
>>   		drm_dbg(&vm->xe->drm,
>>   			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>>   			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> @@ -866,6 +859,56 @@ int xe_svm_bo_evict(struct xe_bo *bo)
>>   	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
>>   }
>>   
>> +/**
>> + * xe_svm_range_find_or_insert- Find or insert GPU SVM range
>> + * @vm: xe_vm pointer
>> + * @addr: address for which range needs to be found/inserted
>> + * @vma:  Pointer to struct xe_vma which mirrors CPU
>> + * @ctx: GPU SVM context
>> + *
>> + * This function finds or inserts a newly allocated a SVM range based on the
>> + * address.
>> + *
>> + * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
>> + */
>> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>> +						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
>> +{
>> +	struct drm_gpusvm_range *r;
>> +
>> +	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
>> +					    xe_vma_start(vma), xe_vma_end(vma), ctx);
>> +	if (IS_ERR(r))
>> +		return ERR_PTR(PTR_ERR(r));
>> +
>> +	return to_xe_range(r);
>> +}
>> +
>> +/**
>> + * xe_svm_range_get_pages() - Get pages for a SVM range
>> + * @vm: Pointer to the struct xe_vm
>> + * @range: Pointer to the xe SVM range structure
>> + * @ctx: GPU SVM context
>> + *
>> + * This function gets pages for a SVM range and ensures they are mapped for
>> + * DMA access. In case of failure with -EOPNOTSUPP, it evicts the range.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>> +			   struct drm_gpusvm_ctx *ctx)
>> +{
>> +	int err = 0;
>> +
>> +	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
>> +	if (err == -EOPNOTSUPP) {
>> +		range_debug(range, "PAGE FAULT - EVICT PAGES");
>> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>>   
>>   static struct drm_pagemap_device_addr
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 1ec90d9bc749..9c4c3aeacc6c 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -89,6 +89,12 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>>   }
>>   #endif
>>   
>> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>> +						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);
> 
> One nit, check on the alignment here, checkpatch should complain if this
> is off, hard to tell if this wrong from the patch.

Checkpatch confirms alignment is ok here.

> 
> But patch LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks for the review.

> 
>> +
>> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>> +			   struct drm_gpusvm_ctx *ctx);
>> +
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -241,6 +247,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>>   	return -EOPNOTSUPP;
>>   }
>>   
>> +static inline
>> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>> +						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
>> +{
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static inline
>> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>> +			   struct drm_gpusvm_ctx *ctx)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>>   static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
>>   {
>>   	return NULL;
>> -- 
>> 2.34.1
>>

