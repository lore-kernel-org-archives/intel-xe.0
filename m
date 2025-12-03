Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6328D12694
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 11:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734DD10E786;
	Wed,  3 Dec 2025 11:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUVtbgOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345DB10E78B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764761053; x=1796297053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wpkHHy0FYQ5X9puA2R6aqkfl+vcE3kVy5hFwk/oAKKo=;
 b=cUVtbgOKev1E515RLPIA0pAG8oi9UGKk8i6TePlnPsZITeEX83RnSS8w
 abdNtVmI/Kpf9M9vgt6NOuiSxi8HSt4DwbXL0JtHvzes3BzLM3nrTPmL8
 wiKmYvG8nWud08ViuRRkfnGGPAPZO+8Zv3Ub31YgC3k09jqptbQicUVwS
 7MBWUF+M6rLGrNd5M6Mu6DwE9532ziZuPPNOnFagv9UKdM5Ik5w8Y8219
 kQYg1un0zCxBtTPRyhvdzivC0umMmLg4MpgG6X9FTPVOsHowDxLf/dHgN
 qmgFOtWj3k6L8kiPtKd6ojkyrlM1FuPb/JZjnjt+D7oJAHtl8sekOY2Tn Q==;
X-CSE-ConnectionGUID: pX/iefhnTy+sOl4WKNkLvA==
X-CSE-MsgGUID: ACEfl3DJSk27DlbXf4vy3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66786334"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66786334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 03:24:13 -0800
X-CSE-ConnectionGUID: Uvw7YB67QWirrdH7jKS18Q==
X-CSE-MsgGUID: BoU8lbc5SWGCxeXwRxQCrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="194555495"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 03:24:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 03:24:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 03:24:12 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 03:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVxWRngjsCii1lvHyHqNXdz81KdSrJQ+vp2goiStVsUyVuQIdpCTAuL1m/XD3N5jR7rrffCcHcBl0YD0K4yIPnUnv/ro+rb2H0QRBvaz9xLCiHankUFxol1pyT23nu0YZOMjw+VYKFgdbO+gbECHGlePTx3mmuRLhok+14a00ZceiaP1ADg/Yp1N6lx1MHV3hsc+kC9RjD2O6VzW+N2X9RdLE9OzQoYB/dTY9npu36x+fcvLKYh/D1uk6UAJKjv96bFN5FKhdbdC+VBbMJhoCFHfd7adzSn+zLCCz/Gp78J5eZMuYguspjN7LePJbt3lXgXksZyAPT7Z+pQE0mVlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSAXohS0Yr0FTVlTKytz7nQugHKRc/lEEsp7SO1S4ZQ=;
 b=lJlQG4KBIn3+KH46HmlcDeJjA7L8rZMSd5OjSsCl+701AW4uA4QYZa0N0yHiZ+Mt3kU2Wq1EIBMTuMVSXk35SRG3ZxhuHpfrlq6ArMwXQtfk2G8i8wUtHoBYLdFMY60IqzxQ9R0jpzFEkaYDOrGpEE/t4hDptcGtJ90hgvhbIxmrpL/JiLOx8UL7V250DRe8IbZeB0ZhgPoToOf11rm3Iwoqy/YfzK3tHo+cmO7jt3BmbHf5vNBXAEVToziduQBfGH/4hHWnWydlpBd/ZgxX8vzEmUtFS6+h0NEqeG5+RunyuK9Pyr3kVw6zANKr1egDrgJd1i5SSEWqduq2FpzvRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 11:24:09 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 11:24:08 +0000
Message-ID: <a641d9e3-5154-4a8b-ba80-5f6b49038dca@intel.com>
Date: Wed, 3 Dec 2025 16:54:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 7/9] drm/xe/vm: Prevent binding of purged buffer objects
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-8-arvind.yadav@intel.com>
 <aS82icGw/SCOP+3j@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS82icGw/SCOP+3j@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|DM4PR11MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a1c852-8568-4e77-eaf8-08de325e7972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUNLemdrZmNLRm5GZ0w4azFMNm05Q24vNVpzVVFCUUw4SktBQjA1NzJmV3g4?=
 =?utf-8?B?bUJ3OXgrWkhrUFg0ZjM3ODZqQkd6b2hueHN1dUIycFBZSURodTdrbGVwMVlE?=
 =?utf-8?B?azZWRGR5djV3blN4Z1ZVT3BQa0V5aHZDdEJPTmw5U3Z0d0t4WkpQSGlNYWht?=
 =?utf-8?B?Ri9obVU0dTFMZ3R0eU9Cd2tGaDAzZ213ejN5VEQwUmxEeFljeUdRQTZIbXgv?=
 =?utf-8?B?ZFRCRWJhUU5OV3ZqTkJmVHBTUko1SVdhMGFjeXJ3Y2RYVmp4TDdvYnY5Z0lr?=
 =?utf-8?B?VS9qUUsrWTIzdnEvcjdmS3VxcG10Q285RnBmNlFiL1l4UzBFbUNXd0RxTUdV?=
 =?utf-8?B?a1JzN1ZlUEM5NnNNeVpSMmdSRGoraDZMSmN1OUpoMnJUT01neWxINC93dWZi?=
 =?utf-8?B?eXJ2Zm9mZ05HeEs4M1ZKdzlFanVya2MyalZUTjA4RVM4N0tYTW85YWRMTTJs?=
 =?utf-8?B?dkJOeGFRUCtEalROYTBhQlozMEN2Yk9URUNRazZ3dXE2Tmd1QzJZV2Uzekdl?=
 =?utf-8?B?dTYvWU1ZZStkcHVFUUJ3dDd5N1hoeDM1N2lWS3JLbUZ2blF4SjJIRk5jaTAv?=
 =?utf-8?B?SGdGK3IyYkZMckVUL0oveU5DMWQ4b1NrbUhEUTREQk8rYjM3dGlxSUpFTzYx?=
 =?utf-8?B?dzJDaDcyOXB3N0NtdFBMckwyTEhQZzlNeU40cm1CeFRUUUpvME1JazdCMFpp?=
 =?utf-8?B?cXVKNHJyN2g5QTNIbTZSZkIyVmxBU1FzZ0wxL2paSnB1TnNkY1ZacjY0T0RZ?=
 =?utf-8?B?WTZLb2dqekM1NTNuekpQYkxXRU1YbEhCVklJUmFSbHVrc2F5VCtreDZyanJK?=
 =?utf-8?B?OGNkQXJVVW4xLzkrNjE3Rms4QjBXbGUrRmJLK2k2ZlVzdk1WY2lwbFZva0xm?=
 =?utf-8?B?Yzd0cXAwNVVLTVRJTCtLSE9VaUVFOWRFVEVWcW1PcnVEdU51c2hFQXRHQWk3?=
 =?utf-8?B?NEF5QWJvbGhlakZjbEJMMkRDS0NPbjFaSGdtRExhYjNURzNvUUlIYjV0aS9q?=
 =?utf-8?B?VExCcmd2WGYyVGNKby84ODZYU05OSlJlN1BjREF0SUpiOURMN1g5ZkVTcU1P?=
 =?utf-8?B?MDl3MzdobDFkWHplS20zUU1DYUprYkRScElTSyt6N3o3ZE83MVJaTkk3UTR6?=
 =?utf-8?B?dlExZjBjZDVMMnhLR1FNTU5iSW1KTVBldzNRVGJOV2ZselBpRmY5eWZ3cVNw?=
 =?utf-8?B?N2J0NzNES05QV0ZBb1I1ZWd2Y0RPTkdtK2R5cjJCbG1RSVdhME94U2lYcnI3?=
 =?utf-8?B?V0gzM0NnVTNiMW1NMzZ6bW5EU01yOGpvaVRtTnhoOTMxSVM3QkxIS3YvcXNX?=
 =?utf-8?B?VHo2c1F5NlFTMlRMKytseVcxODVGZi9XcDlqVHZUWmdhL3hDUllnV3Yrdkhk?=
 =?utf-8?B?T1l2VExPd0FUUjRNR2pPaHgzcndPdlIwMHBBSitya2VrcEs3YnJ4Nm5YTDAw?=
 =?utf-8?B?YkJCQ2tyRDBJdmRIZ3daM0lPUHJkVVpZMjd1R0x1MS9UUmRLZVJhMnByRFRZ?=
 =?utf-8?B?dWYxMWlPZWpUWE5wQWUvOS81cEdVYXg4TTZlV3h6SlloVXBQdEpWdmcyakpS?=
 =?utf-8?B?ZHBtUXRHSWRNZDF2YzE3N2xleXRScFlxM1VkRzlXQWF1RVJuSWNtS1Q4cUlz?=
 =?utf-8?B?cnJRcE1iMHY5bUpKVW9YaXczTzJjaEE0cjhwQTgvZlFUN1lMU0d5SXFhZWQv?=
 =?utf-8?B?bEYvNlVRZjlBUjUzVmdJUTZvbHd0QWV0dTBhWDRzV01vWDVTQzVtL0RTUURt?=
 =?utf-8?B?TS9KMkJKNUxENTdwUzJraEN5VDBqT0VwOVpIZ3RYSXlnWGFQWElCYThvaHRr?=
 =?utf-8?B?VEJseW1HMm5YcmlpYzZQMnNqNVJEVDFLeWVPV0hWYUk3ZVI3YzVvUEw4V0VN?=
 =?utf-8?B?ekV2UkV1d0txWnI1bjhtWmlXYkNWQkdtYVNFYTlDNWgyMjEyR29Lck42N1M2?=
 =?utf-8?Q?V4nngaZR0no9WoOQRwgtNsndtnwC7tja?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a085eEtJa2R6RTBpYzFFMXhyWVMzYnY5OUxPdG9qUktOUHNXSnVsd1ZIWnVi?=
 =?utf-8?B?QUtUME1sZEdaK205dklxWlZYYUxjMk9iQnBkZWlWaVYwY0JVUGY5MXlzYU5w?=
 =?utf-8?B?ZDZqbTdXem5USHFHYkp1VGdsRmFIV0RFWm1uZS9vQVo5aUkzWllaOWkxYi9j?=
 =?utf-8?B?bzhPRzFWQmh4TjZVWDE1YUU5K2l4WGxGWmF0bGRkeGsybTV5ZEFjNGNhdUpo?=
 =?utf-8?B?MzFVYzZRWWhTemhyakY2aVJVM0gyVDBmaXJ2ejM0cG1TSTErYnd1ZVhiMHNT?=
 =?utf-8?B?NkxRY1ByYkM3NTZnc25Dc1k1NktCdi93UHdpQnBjbkZqdEo1L3lHMmkzZG4y?=
 =?utf-8?B?RkdzL0Q3UXB1U1JkbzJkWHpMWjAzMlZuTjgrekwxVVpBcXdQTWNOZGFlajJM?=
 =?utf-8?B?S3FoZkUyajNObXJOeGM3eldwb0twT3RoSmFyWlhJaVBKRzArRjNRYjcxdzRJ?=
 =?utf-8?B?Q0V6bmtJK1FQZXZ3TWdKNndGK3N3ZkIySG8xSGdxNUtVUGNyZ3o1Q2dta0xQ?=
 =?utf-8?B?ZElQc1FRbmdFMkRJRWdSQmdlUXhLNUVKdFBuWUE1MlVGa0tLREZIa2VmS2xP?=
 =?utf-8?B?NlJBS0Q4RmN3VllhNzV2d0o0N25ZWXZKM2JVQjlHZE1Uci9jeTBHRU04VTZT?=
 =?utf-8?B?Uk5RVTI5bHFVNitYWHA4ajNBQ3lKWWJWSFJ4cFRvdUhiK0RtdlAwOU11WGYy?=
 =?utf-8?B?aC9VTnVNMDhGVkxFRHJacEtvb1V4dE9PNFM5cUlVc2tBOHJxaGFvMXhwTjBC?=
 =?utf-8?B?U2hXMWJwQm9xbVZ4OGVtVmNGLy9QMjNuazNyZlB3UjdNVGxncit5WGllTFI3?=
 =?utf-8?B?WC8wazcxa1lsWVQ5ZzUzUTZvNVIyWVRUU2NDWmtLMkU0Z1ozRzFRRjFBVEJ1?=
 =?utf-8?B?eXh3NXBOYVRrZDBQZFVoYlJDWC8vTHZaRUNucWl6VXE3ajhIWHIxMW5YQkxu?=
 =?utf-8?B?SkxRMnlnUEZaY2VRWXBmZW1Tbm5Hem41Q04wT1BUQjR4Vis2Q0h3Z0J4QlQr?=
 =?utf-8?B?K3AyRVhsdlUzQm9kWW1IM05kcXYrSnRMb21Kd0hPU0ppR25SNWMyUmc2WWNY?=
 =?utf-8?B?MUdzR0NOWHVwY2RnY1JyVkpTMGZkeElJSFE5aG9WanpVbE4vSzNwN1ErcDhx?=
 =?utf-8?B?SEpteFhKMlVoSDk1Q1lqbEE5V2h3cENKK2oyRk1JN2tnVWNWenY1dDZpeElr?=
 =?utf-8?B?MjkyYVVZSkY4VURoYUlZQzhRZDFzREh1NHNJTmFJOTRiUUJ2Tm94b0ZhV1lH?=
 =?utf-8?B?dG9Ib2V5SVRTdWZWZWZXbGpzSXg3SjR1bmpMYVVLK05uSzl4azBRMHFkWFd2?=
 =?utf-8?B?WGd0MlJUcVlKajB4aVdTaCt2MXNkY08vckplY0tYVU5ub1d5N3BTc3RianEz?=
 =?utf-8?B?Qk1VRHJmbENSSGJLaHJqWlVndUg3Q01DSm5YV2Z5bXkvTHczWW5RZjJXL2R5?=
 =?utf-8?B?ZG96dU5uSUl4WCs1S21HaS9iL0tzRXZvbWk2RmZkcEJnZWkzaVZFZ0lYdDZn?=
 =?utf-8?B?Qy82empHclRod09MMXhETXBHazd2aU92ZTUvZGxUMzVzaVJZZ2pUdGZDTytE?=
 =?utf-8?B?SjArNmFmMC84SVY1UitLV2JjdHpqOU5LMXJYNzZwZFJwbzMxYlpuQzRRY0h4?=
 =?utf-8?B?Q3ZJMGorV29oMThtQ2pmMGwwUWRwY08wUmhhTUN4Vm9WWU5PZFhvdUtKelVT?=
 =?utf-8?B?bjNpUENtZTg3UGdxOW1oVU96WFI5RWEzdmpjS1JCVXZVWUtmQnpQWEdGUkJl?=
 =?utf-8?B?dHFiMnZXcnRPWmo4WUxLNk1iRmFPeGw2SVp0dEZ3NkRtem8xdmY5WHJXajZj?=
 =?utf-8?B?RUdXb2loanFSTU52S0krak5oNVRxb3hkN01rQXBrbGlRSCtYMFE1Yk9KaXdK?=
 =?utf-8?B?QzMwV3BSNXozVS9xWlNEQk5jdlVFS0JVRmRkcDJQR3pleW1ocFRma0RrVlln?=
 =?utf-8?B?VXl4SGE2ZEtYaVAwN3NhMUY1eldJVjFPVVVhajlKWlpIUytnWGxSUkZKQ2JO?=
 =?utf-8?B?cmE1aGlBLzVwNm9uU2hQbEU3QUUwNHlCWTVtQ0VRejF6Zlh0WVlwL1lqMDBU?=
 =?utf-8?B?bnVhSlpuMVRWd3FzOEN5aUZoS0ZjQWJFOG81c2dvd3E0U3RFMHNHcGlYZ240?=
 =?utf-8?Q?QUC/zU/hOr+K1QVQoLRTqjczI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a1c852-8568-4e77-eaf8-08de325e7972
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 11:24:08.8459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRehGWV4oX6RScZHqo+Nw2fm8+3kkXBojKeL/S+idoMKghwzcPEf6ZH0TIby40ISMhHhYwLWV2cmmLpi4VDKNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8179
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


On 03-12-2025 00:27, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:20:17AM +0530, Arvind Yadav wrote:
>> Add validation in xe_vm_bind_ioctl_validate_bo() to reject MAP and
>> PREFETCH operations on purged buffer objects with -EINVAL.
>>
>> Problem:
>> When a BO is purged (XE_MADV_PURGEABLE_PURGED state), its backing pages
>> have been freed by the kernel. Without this check, VM_BIND operations
>> would proceed:
>>
>>   1. DRM_XE_VM_BIND_OP_MAP: Attempts to create GPU mappings to freed memory
>>      - xe_vma_ops_alloc() creates VMA pointing to invalid BO
>>      - Page tables populated with stale/invalid addresses
>>      - GPU access leads to undefined behavior or hangs
>>
>>   2. DRM_XE_VM_BIND_OP_PREFETCH: Attempts to migrate non-existent pages
>>      - Triggers BO validation in TTM
>>      - ttm_bo_validate() fails or crashes (no backing store)
>>      - Wasted work for permanently invalid BO
>>
>> With this check:
>>    - MAP/PREFETCH immediately fail with -EINVAL at ioctl boundary
>>    - Clear error message at syscall (better UX than deferred GPU hang)
>>    - Prevents creation of invalid GPU page table entries
>>
>> v2:
>>    - Clarify that purged BOs are permanently invalid (i915 semantics)
>>    - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d03e69524369..cc946bff9607 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3482,6 +3482,13 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>>   		return -EINVAL;
>>   	}
>>   
>> +	/* Purged BOs are permanently invalid; reject new MAP/PREFETCH. */
>> +	if (XE_IOCTL_DBG(xe,
>> +			 xe_bo_is_purged(bo) &&
>> +			 (op == DRM_XE_VM_BIND_OP_MAP ||
>> +			  op == DRM_XE_VM_BIND_OP_PREFETCH)))
>> +		return -EINVAL;
> I'd move this check to later in the bind pipeline once we have BO's
> dma-resv lock to make this race free. I think vma_lock_and_validate is
> likely the correct function after drm_exec_lock_obj but before
> xe_bo_validate. Or you could just make xe_bo_validate fail if the object
> is purged.


Noted. I will move this check under vm_lock_and_validate.
Moving the purge check to xe_bo_validate() would break GPU page fault 
recovery for
purged BO-backed VMAs (preventing scratch PTE rebinds).


~Arvind


>
> Matt
>
>> +
>>   	/*
>>   	 * Some platforms require 64k VM_BIND alignment,
>>   	 * specifically those with XE_VRAM_FLAGS_NEED64K.
>> -- 
>> 2.43.0
>>
