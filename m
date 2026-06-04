Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C33CD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 06:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750901126E1;
	Thu,  4 Jun 2026 06:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVnA4Fzm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC8A1126E0
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 06:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780555609; x=1812091609;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bV+7KEZnDt2vR2l8Qcht+MVsPjNV0Dyvp4d0QcfqqWg=;
 b=RVnA4FzmC7ZjhL6jVHbUnbT2t0s7x35s7KXKuFsrLhOOhI2SfPWDiDkp
 XijLWmXRAYuUDvzjPmzG5ymXOmkH0wY4i2sTuQ2O8ild0DNtlvCJIPwR3
 JbUM+9lOACm0m58ZOrzq+9VZL5nqju3kfUon+c+fwX3FbC1kyRqQK43R+
 lCwCAf4ek5ix961nqF2Cxru5Qb+7+Ee4BQAtTfQ1kBX6Ie0njkFbqiH00
 NYwTXx85lBSdu2z0mc3RzoF2Ce8gbln4YtduLb1V4VkWHL8wtQe/hSyyQ
 AMFOAv2TRhCLJ4jxiil2BiW34ow+KcpIjBPSPwFfqDuMJMvzUvHbSNEZz A==;
X-CSE-ConnectionGUID: tWjExuaDQUOlwJKXrx/f3Q==
X-CSE-MsgGUID: cRt1caPARkKwXk31RwGdxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80517329"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="80517329"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 23:46:49 -0700
X-CSE-ConnectionGUID: hIIrAM9ET+2EgnhVuD/T3g==
X-CSE-MsgGUID: SrsyaVQxTtmgJKGidZqtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="274697616"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 23:46:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:46:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 23:46:48 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSedSdZ/PK045zHRzma85LQBXVCn6+V06H3ZrfnCH55rA226ArBX9XjKi9OEtMxU26jQfOr/XShrynieT6Wz20BuqcLgQlVuQmVrAq66xYrAKfxsFu6/wZOOPYa0I/ZtLoytQvIeJH98hgzs6Rw7ZzwUnSBtrS18u41zDvJbHEfh7cQn8UF8/4UCo4J7GZZw3dPpT8ldv+Q5vH32kqncK2P4qPByTIeMJ3nTAB9fJ7A0IFZ1jo0VDe7IyWThm5UyP5WujJocLK9sOcP7uBpRRAC1fE41hmCyyQ0QPjJXUuJ4Zxy7qdfNXr7PqN/nLBnEzf4PEYcjjkKLFktCfzrrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4q5yOpKAPmi9tUwz+zHmMTvChiDgNSVbWFRwFH4rkVM=;
 b=JnvjO9o4Pn5NyXfqs5IjOESmfUB8vWrVWfbhhi4rtaV76qscrp1ioIVdoOECoLpRgzG9++ici1cpE/WPWAAt1rRByUOm7xqcmthToDkhmQ0CygLT6uZutlaZiE9ZdokvRzYfrqtjXAL4rezWv8aiVu7+bAcVtdN2idZgnXF/OdpQsndOCqb8zNA5Vn2q6XrvTXsayJMLBKP8QUEWLhQQvbFccY7skGbZ1w+kDgxn6xilEEsPEjly4NA5WNTfl+jfsJ7teR1XNDk6li7BL0BrrWEEpi4Z6qk+/LF5ccBq35mA1DpLEbnrvs+ho1UmKVzXa44o3hvxi3+2qZN3lg8zsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 06:46:46 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:46:46 +0000
Message-ID: <8dfe4463-476d-4606-850c-c9c34bbf4408@intel.com>
Date: Thu, 4 Jun 2026 12:16:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20260603150059.157355-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260603150059.157355-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0137.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::13) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|MN0PR11MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c8d7b4-eb36-4085-2a79-08dec2050bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nQN1+XVWTVgeRQ6FPHqHzD9u7xmw3vbhbzPn2aHbA17UsDG/fnAsYLUI1gUkWUeaJchRPxdssgZ4IvTvHPFPJtKVbyLFFs7ml4QCFJzrkSrCiAjWbqW+iohLuGv9iWpQ2AvHpiQpgQzos8eWQeOuoNTCTkxaUAqsLMfIgX0HszLuG9Legfx9eyKOLimOz2n+D1I+BztxeiO4HoDdiznj9BtsKzphrYxeZ0qzNPz+kTzMZkvyvsD3zt4RCovZhKi/5mgrqkIYtiz+NwObbnvcFkAntNKnCxoGx9HcjVAlzT17ZUj5uzY2RaQGa5nTD5ElWfXCzi253AqXJzjosxLHWgigUcpHsRv4RdUA34WDWE9rTVgQKDfeZP+V3MF+YE1d2ZLLymdWn+0mnYeO+5PEInIY4LvbZqk5e30WnDB4tN9C+s5ihV9S9Ddj/rxhxrHRbwMobInmKRRz28D1LPq/GTujkSDQvpX2Iexd+CKkdFhKqFc9D+vq+d7dNj3RahhN+g56ZVA1CqX/XMUBLk3HI3pUNzjwEuBn1xB2m7A1Q2k1l7I8JU3S8dPbk1zTKISLSz+fRtKKG9DJknp2SNDPyuGYHSiZiSmXuHRHKBdZwHvGgmEtddEse89HgUzp3FcXYo8m1q4J44sjBFEv/BMHfVkJ4Ej4X+Ir6k/9TFaFwmBqI8CHM22yi3XXI3kPBjWx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzBPM0dwenFSdnBPNzNrTU9BS1hBNUpkL1hYMTJoU2dHUGg2ODBMUkJxcCtJ?=
 =?utf-8?B?RnVnNE9kVzArREF3K05LZktGYy9wdXQ4dHhBUmM1TWE2SXdFQUZEZ1kwRXk3?=
 =?utf-8?B?TTFPeVJ6YVhPbEcyK29iUWNqR2U4MEpNRTNscDJMNzd0eExjcExyblRLWEw2?=
 =?utf-8?B?Zm9TTVNxOTRCckJQRWJIcWlrYjE5QTNmU1pMb1ZZblU2US9NeU5mcExNS2hC?=
 =?utf-8?B?ZW1Cd29hamVFM2VSYjBXTVRSRHJiVlg1cU9Fdm5MdUtVSlVaMGo5aHJSRDdB?=
 =?utf-8?B?S0ZCMjM1RXpvZkgzSzljeC9abzNDejNVMFg2UmF0SXhpeHlHV2hwdC9meDAx?=
 =?utf-8?B?YzZPbEN3aTU3dVJDMVBranBNb2J3Vmhrc0JteUY4dlBCUlVQczh2djJWTzlU?=
 =?utf-8?B?b0pyZW9QaFlRd29wOG1NSUNvTEJHa0pjVGlhdnJFNDY2dm1LRWZ6QUdhb3p3?=
 =?utf-8?B?SWJtVzBQN0FrTWdUcld2aVZWa0p3Y0RoN2Y1K1JLTWsyaS93ZnNJRWdyWUpZ?=
 =?utf-8?B?MEEvU1NvTVFrdm5zZDZMcGp6WmtVOGF1SkExU1dtSnVDeFI4RHFhTmtHZVpu?=
 =?utf-8?B?bTJoR0t5TlBwQTVOTFlxdFN2c1dYeHMxTmRGRmdrWXhTaFR3RzdUL3ZMeXky?=
 =?utf-8?B?WlFaSHhmZUFmazhEQ1VlOHFkN0lvczl5T0VsUW9MZzVPdDB2aUZXOHdhMkR2?=
 =?utf-8?B?dHUyV3NsZThnTWpreXY3S1d1LzZEWnhZT0ZBNGROYXN3TEVERVJQS3E4TmFR?=
 =?utf-8?B?cXJFdjBiMXd5eXhZdWtnZnhUNEhhMEVGamVKNy9jaHd6aXVOTzM3ci9TVmw3?=
 =?utf-8?B?RHJkbjRkdzZid2pyT1ovZ1IwYi85alkxbWRJOHZldTliRFJlaVM0ZWFQVWJy?=
 =?utf-8?B?am5lS3VlaHoxdEhaMjFkS3FNRmFVMUI2MmlVL0Mya2ZVT2FNeDF6czFGbDlM?=
 =?utf-8?B?UHJNWElaSk1kQjQ3K1lsNWlJNmRIM2tObWh2TVgxbVVCQjhTNVJsc3gvY01V?=
 =?utf-8?B?eEhQamxGYzJNbzBtVkI2RkFnOTkvaGtjT1o2V203MU1aejUwRWNSbmNMM2hr?=
 =?utf-8?B?ZGNpWU9vYzhod21aZEYvNjIvcU9oUjEzOUZySC9LSzlFSzFPMHZHbzlxZm10?=
 =?utf-8?B?OXNlU2Z1UDJMZTZ6QTFuZnJ0dUplNXNzb01lcmJNdVdJWXMyUW9BZUpBWUFn?=
 =?utf-8?B?Wk5rbDBTWWhZUFVBWWVLRldJeGYya0ZmZ2g5YktLQ3JVWmFSY0tmR0h5a0kx?=
 =?utf-8?B?cEtzTUp5NlhvcUJnSXFHMEtRTTVGSmtTM0N3RSt1dEZvaHp4MUgwK3k2dkxr?=
 =?utf-8?B?enJiQXVYYXI2QVJpSGc0RmIrUTZHR3FEWHBKWG11cGhNVTVONjQwN1ZYTm1i?=
 =?utf-8?B?NUI2RE9WdnpKVElJU04rRk1leTVjMWJZTVBPL1k4NGFNY1crc1JGWEVPc2Ri?=
 =?utf-8?B?MTU3czJxcFNWQ2VIWmU1Ni9oRm04K0JKeTFROXhFeDBqZEV5d3Z6ZVB0dTl1?=
 =?utf-8?B?YnlLbEJYK2wzVVVsQkNCdWpyLzBQS2xRczJXblhXU0tVYzZycStiTWJTWTlP?=
 =?utf-8?B?bUhXaUREbHVaUGh2V0tjbmxrclZaNlhrb21zYWlQUmdSd3g5UlJiLzhQYXdy?=
 =?utf-8?B?aURuUW5ZRTlFV3o3SFlyRkx4MmRnY1ByMmdlZzJwZEZnYXFVNzZzdENSL2JN?=
 =?utf-8?B?YXFMQXlRdmdUMGk0Q21yN3crOTc0MEo3ZTlqZ0lmSUg4bEtFa2w3RlU2QlVY?=
 =?utf-8?B?TTd0Q3lvelgyblBzV3cvcWMrVFErVHhwUnkrWWU3YWZHak9XTUVYOE40R2VE?=
 =?utf-8?B?U284Z25IQmJITUp6UFVCcmp6VHpibVhITXlQWS85V0F6NFNnRmZnbTVOMDV4?=
 =?utf-8?B?MXAycmhjeWFXZUNKNUsyamltU2V5Um5rWkpkRisrNmc5U3lwUUtaVStxbC9h?=
 =?utf-8?B?S1RBWTl5dFN4NG56L2lTQ3MrS2s5Z3BQSjAyeVRaYzB4L2ozMWRwczltd0hS?=
 =?utf-8?B?bCs2S2d5dWNUcldsVGNHWi9qdFdLNEhvME5qdUxEdXFYSEFXeGRwaGhsMXB3?=
 =?utf-8?B?d1A2YWZUZDZjUGdOUTFIdDdIYkJ2c2l1NCt1TlpRZ0UxOEhnenNqNWhXNUll?=
 =?utf-8?B?RGZPRFp6SjB4M2FQK1VCS0kyU3RnUWM3RmJkakpJUnFpM2hFKzkzenhnUjJO?=
 =?utf-8?B?SlVaUy91MWJwZHBNRjA3bmt5cjlHb1lnQUYrK0p3UHZvQ3BhOTdNZWc3UjVM?=
 =?utf-8?B?ZWtpRGFyS25nU2xFeXlsNTdrUXJmRHd0NE52bkNRMWRKQ0N3NHZtSFAxa1NU?=
 =?utf-8?B?d0s4N1RTbDZmVVFFWm9LcXZ2S21YTGwzTjJxQ1FrRTJMWWdFcUVTOTNwQ1JO?=
 =?utf-8?Q?Cad6s07cnAZ4/GSw=3D?=
X-Exchange-RoutingPolicyChecked: sXhEuWlVWirerQvFQvD7sFPW/6u9uGgtefTCV+TAvgV5Dp3iCl10Mk6GVCyp1y6GmcnjWY4QyWrbQiUgti11HPGV/aVUhFZdyNbQk61uE7eDeh224+BFzfr+HEnedvI2x69TPikg+ziXHBH0+umkG0PNHd6/L5FYWW2MarIpKPyNyneeFE/xjYQpo90dKA2wVpytxgEqGnIAi+RKXh23llrYZO8Pje+t/G0EEAg/w7y6ke5xsstoMQvxOsYmWREzoX2YtR61zglTfcUgdAnA2DDuhiNLlISV2pPV0ewifJdTv7Vq5Uevu27PHe/Q6yM/mdIEKKBeUIn+GDDtVFDzag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c8d7b4-eb36-4085-2a79-08dec2050bcb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 06:46:46.6260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEGSnMN17VFlM1xROagpUAi5f742w6NF2dkf+ap4kS2V40+VzWyPgKpNvB0vLUFTP3nHUzu1POLPoPwo8ApyXMWfAZswuvvx2bI2jKt+nJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6034
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


On 03-06-2026 20:31, Rodrigo Vivi wrote:
> Jobs that GuC never scheduled were silently errored out instead of
> triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> should wedge the device rather than silently fail, and userspace VM bind
> queues should stay permanently banned rather than being reset and retried.
>
> The queue is banned early in the timeout handler to signal the G2H
> scheduling-done handler so it wakes the disable-scheduling waiter; without
> it the waiter sleeps the full 5s timeout. For kernel queues the ban is
> cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> after the GT reset — a banned queue would block resubmission and cause an
> infinite TDR loop.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Tested-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
LGTM
Tested with Reproducer IGT and xe_evict - No IGT stuck recovery works 
correctly and subsequent migration tests pass.
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 31 +++++++++++++++++++++---------
>   1 file changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ab501513d806..bbccba367626 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -158,6 +158,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>   }
>   
> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> +{
> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +}
> +
>   static bool exec_queue_suspended(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> @@ -1376,7 +1381,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   			   q->guc->id);
>   
> -		return xe_sched_invalidate_job(job, 2);
> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> +		return true;
>   	}
>   
>   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> @@ -1622,19 +1628,26 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   			       q->guc->id, q->flags);
>   
>   	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> +	 * Kernel jobs should never fail permanently. Attempt GT reset and
> +	 * resubmit; if karma is exhausted the hardware is unrecoverable so
> +	 * wedge the device.
> +	 *
> +	 * Userspace VM bind queues are banned permanently on timeout
> +.	 * No reset is attempted, the ban already
> +	 * signals the G2H handler, and the queue stays banned so the job
> +	 * errors out cleanly.
>   	 */
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> +	if (!wedged && q->flags & EXEC_QUEUE_FLAG_KERNEL) {
>   		if (!xe_sched_invalidate_job(job, 2)) {
> +			clear_exec_queue_banned(q);
>   			xe_gt_reset_async(q->gt);
>   			goto rearm;
>   		}
> +		xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> +		xe_device_declare_wedged(gt_to_xe(q->gt));
> +	} else if (!wedged && q->flags & EXEC_QUEUE_FLAG_VM &&
> +		   !exec_queue_killed(q)) {
> +		xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>   	}
>   
>   	/* Mark all outstanding jobs as bad, thus completing them */
