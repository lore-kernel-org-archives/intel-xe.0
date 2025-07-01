Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4F2C8302F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 05:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1322F10E036;
	Tue,  1 Jul 2025 05:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgLqGmSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C352510E036
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 05:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751346390; x=1782882390;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9vfyP4PllO+u63g4hqlWlwIC+vEEBMdYHxpXh4Slw6o=;
 b=YgLqGmSHIkHbpE1DnhDdablU2NwuYFcS1n1c64QiFTX507rr0bNGn3M1
 NvHJ1D5sSeYY57uyyLC+wZTW6TqSwf9QCoDcDXVaaW+0ndV4QyhfudUiR
 HFsUAjI75bOTeRMHHqO2HpOEH8kmYk+Sbq1rvyGOcvPg5zRkDWKtxUiGl
 /biqcJ13Boru86qGSuZWkhZ2FjmOPySTi9dLNmnNmR9LLfXqUMLNja/Nh
 g/rU0z9pN+F5XFgZ7ei3w8MgEQ18QPyt1j1ac2WHI3Pu4rEx1xTXZQtNQ
 zgjHRlpzfE9qE8Wvm2RuFdti5Sc9Iofa5f6LF/F/koURDKiPzDgC/kl9e w==;
X-CSE-ConnectionGUID: uModeYTHQAS12jqtuYUkoA==
X-CSE-MsgGUID: uOt4xel2QhWfNJ0vsIvP4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57396873"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57396873"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 22:06:00 -0700
X-CSE-ConnectionGUID: xyoLO2kcRU+S3zjt4n4GnA==
X-CSE-MsgGUID: muy9bZeLScauGfIjxwLRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153050690"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 22:06:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 22:05:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 22:05:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 22:05:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXv8L2maCTT5OakvIxiK9RKm1Y0k0LhzLvcniAcZ3pqHwMm+bnHlv7x/h3hxLZHtmhOW0HwZlcJ/kHeEA8zA3ocB1ZleJcYnAdhXKAcNI09YknwRTBqvtMOOgI27pxMPRgfEM0Ls8jLUBnsi+P9cUy/h3bmClj18voQRDyjofdL3b6OLJqbX8tpHXNJZmXTYR7AGgKnBrJLwD8L023/ahrc9Jh3JYMVQFqPmmr6LlNwge8HXOZ7uIJisT3zuXxpENMb5PG/YEEGY0SGtHeO/wO6lq/nvF1dZjPpZXzq3opixiugLE7orHmoV4bK5hdYFeXzg02OtAflJJu5kBnUSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx6KSRcdj0C+L9BCdqY5MGMnFVyEv6HSrNZhm05miSA=;
 b=n7GjVSKxAr1Klu6r4xHcAt3bt6DX5U2PiWyjC+I8v9nSaZ9ziQtLEq2uoU4jt/KloztuPdjNItf4eX2i+wqmjXL+WjQThtuxwhHwlg/1y6/QSzvwwU/Ba58rir/M0zEZPE6JhLYx2BB4CmyWT2LlNguC6Z8s/H1fLVXQ3CtIn+A6i5sOkDITKh6zO53Ac8sUCCKqmtg3HmmQNtrgoSW4GBiiC+oL4a/5y4447m5dLrTcNpDTMWSMGYPjepKK3bt8aI69P7EDBuxjKKy3wClkKDaMBymy8d6eTw5bd0T6p3L/S7s8JHpLZtXqRMd0vxUaGoOdfg5iO9WjTpYGEW+8cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Tue, 1 Jul
 2025 05:05:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:05:56 +0000
Message-ID: <2648dfda-07d6-4ba2-a6e1-649d06ae5325@intel.com>
Date: Tue, 1 Jul 2025 10:35:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/xe: Track maximum GTs per tile on a
 per-platform basis
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <20250630173438.2342706-10-matthew.d.roper@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250630173438.2342706-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9b0fe1-1705-4650-364d-08ddb85cf637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTIyMmxEeHd3eWhLQ3BjcUtJcE1LKzc1ZlZpU0lTRkI5Q0QraXpOYVZMRXFI?=
 =?utf-8?B?eTFlYjNjYmxCTFR1UkhZdXVZdUxUbU9KbjJOeGhMdlRMdDVld0pFWERCYmtn?=
 =?utf-8?B?SVFDZ3p1OFRqZHVxZC9UV3lVWjg0Y1hFeldjTFFUbjdPNWRicDVMWFBtblMx?=
 =?utf-8?B?UkxVNWdpN2tpeERiRW0rVFB0UmlvWFFjTmRKaXpKRXFSdDBZNFhtN1h0eEY0?=
 =?utf-8?B?SVpoK2JVazdsNXY1dTdGL0x5aHowUXdwQ1V4M3M0SVhSdEZCcHcxZUFwY3NO?=
 =?utf-8?B?VnpWUmk4a2dyU2VpZGx4VVphT0VxZVNueXkwWHoxUCt6WndwN0ZtT3YxeEtt?=
 =?utf-8?B?ZEF0dkZXY2c5MlFQM0xxODF4cGFDKy9LWmhsOC9pd2x3L1ZqYUFrUnViNys0?=
 =?utf-8?B?YWFGSWFFQy8xZ3QrcEJJTElTUTd0ZCtuNmdNdm9BT1dxY0RJaWFlbGxmbHNW?=
 =?utf-8?B?aS9aRkNiSjdSU3Bvb3ZuSkdqZ2xINkJid0dWQk1zbEhMWDRCajJvckd5b0Fh?=
 =?utf-8?B?TDFSSkQxcXRtQzRoZW9MMEpoZDNqVnMwbkc3ai96UEc5RU12S0hOK3BEY1N5?=
 =?utf-8?B?MVZRVGY0Rkh1ZnJEaEUrOExaNTZSTm43L3lWRzFPMlY1cE9RVjd5NnE4Ull5?=
 =?utf-8?B?N3VNYnJucFhOeU9qbHBlaXhuNnlhV2RXVUFnWTF6cldnbzI1d2NZUUU1Sy9V?=
 =?utf-8?B?QmtCMHY3cTMvc2VocEF2bllwOTlwM2RQNjA3NzdlK0RqcWxzaFlqTUFsem5a?=
 =?utf-8?B?aTRZWXR3dWxPOFlDYVdnMjNMbXNicGJ4S2wvUktrM0NTeDViU3BWenRyOHJa?=
 =?utf-8?B?TjlTSWpoYWhSWDk4RnF3Y0pPWXRGQ3lBV0VhQ3NhNnprc3FObFQ0Wk85cVRR?=
 =?utf-8?B?MzkrU3FSWURoQmhDYTlSc0xpT0dDWVJlVEZQMkJkOGs1aUd4VVZtVVQyWHVH?=
 =?utf-8?B?bDRWVWFXa0ZGdzJzU3NSaEgzMUcwdmxMRnEyREZoV1JKWm9Ma2Fxazd5WDRX?=
 =?utf-8?B?ZGlZUWVmQ1RLb2oxWWlzaFNteGVXR0VrQnJobXhRNzhmd3Eya3dmS2VOaEhx?=
 =?utf-8?B?dEQrNFpFMFdMemhrUlM5MzAyekZCaFhTNERxc3dKSGZFVzdZUXJqcDBmVkl3?=
 =?utf-8?B?Mm1CbmNPM0VUOUMwTjc5WFp1a0xGRytSUkxSNUxZVzd5cjlMcUhsYTVCWWdB?=
 =?utf-8?B?SXV6a0JBbVZYNzlSeXFwbEc2RUl5Q25IMnZ3WkhscFRPa2huUnVmNm92VWw3?=
 =?utf-8?B?U2FmdUNCSjR1bHRRVTdVSjZCdVpyZ1NTUnhzNmZjcFF5d3JiQWZvUDY5aWJ1?=
 =?utf-8?B?cE0xVzRBZm9MTktvUkpkZUg2TEN6bThVa3A2U2pwWXdzNXhVRUFxOVgvSmdL?=
 =?utf-8?B?QS9DTlZYNW1NNGtJZWxVUThKaTVlZFg1UDN2VWpaYU9tSnVnNW8zU0Z5ekh0?=
 =?utf-8?B?YVRja2UwN096THZXdUkzc0lZSDZsRDNjYkNPQ1AzRFpkWmwxQjlBRGtVQXJh?=
 =?utf-8?B?WXU0VHFpazMrMEI5dm02N2UwMWExaTdWZVpuOTBnenFJQ21ScU8rcmYrUFpH?=
 =?utf-8?B?OUNTUk04L29VYjMyZGcycFhrVFJ1ZG9jZ2JObjZ3YVBUVDQrSTh4WXU3YjRw?=
 =?utf-8?B?RnBiWENoNWlQcWd1UWFUMmN4MUlMNEFSTHBtVjkyK0Y0Z0xXdGN3T05GYmoy?=
 =?utf-8?B?dVZjSEZXSlhoTzBqN1cwdVM4UHdXaDl5Vzh6eC9iUVdGQ0FzNDRMeFR5ZTlu?=
 =?utf-8?B?dFVwVzhlQkJseTVYVWtqOUNDeVRLZnN6WlQ3SWw4RmtCSkc0cm0vV3M0Ulo4?=
 =?utf-8?Q?m7Z0FSiKdmqJbIMDq5cyNxEHwXG88i0VW3nMA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWplcDBxbU9wb3hBNnZXNFNiSU15bHJoWThJWGx2OVZOMWNnbzhkTFJXVDF1?=
 =?utf-8?B?UExURGdKQlBUdFNPcGpkTHVremtTbUlHcG1wak1nTEdOSzRtMnpzR0dGK0FK?=
 =?utf-8?B?Nnhzc3lzVzduSG5xUE5NNTlzNWpLNHFGWWdkTjA1RDI3OXhyb0tqTjZkQVN0?=
 =?utf-8?B?Z1pzZCtIQ0FoZnBBKzFRRWFxRUJpRWs1ZmcvMW1sdnJXZDROZ21VTUxRMUFF?=
 =?utf-8?B?ZTV1N1JlRGdCUHJNendoQTQ3LzhNMEthdXdDdlY3UGZVL1lPMGJnY2k2U0V4?=
 =?utf-8?B?azVncnVTSnZaRGZOWW5ZWnZCWThIMHNudHN2Nkc0NlloSWVTa25yNkU0Vm1u?=
 =?utf-8?B?aCtOMXU2OVVmQ2JtMDltRW5LeTZjY3B4WUpmSUV0VGxMRTVGV05tNFZEc0pI?=
 =?utf-8?B?d002VWFFaWZNVmxNbkplUUQ1N0pVSFRzSk1qeXRuOTMzVnk0OGw1b1JxL1o1?=
 =?utf-8?B?eFlKY1A1WCtkc3ZqeXE2R3c2Z1Q1ODhDbFhlZW1RSjJ5L3owdW5pZldKVE1Q?=
 =?utf-8?B?eGF4bEs1cmo2YlZIZkhGOEpKRDVBZUpQSldjNnJRczF2aHJEbWV5RWdVcDg5?=
 =?utf-8?B?MGVNS2gzRUQwclhzM3hyYi9ZTE9IbWZiMUNXNVFOeXp0eFVyeGhtSXdQWUJo?=
 =?utf-8?B?eWMwM2ZsNUxuRDZPN0VDRzN1aDRocmxScUltQkdQbFlMMEhTMUppRXhzWW54?=
 =?utf-8?B?YnV2U2Ewc21BVEk2Q1R2WTljN1QyeHo1dzRnR2pxMStnR0V3aEJVUlFpQ3VW?=
 =?utf-8?B?aXpicVNhSVFSQ2kzM1ZXWmRyM3ZVcExXandubk12aDJpMEtDMS9Wb0ZjQ3BO?=
 =?utf-8?B?dmJscG9aWjhsZkNSb3FtOGd2d3p1VFEybjBVR2RoZDFuQmE3Um9xN2Njcmhp?=
 =?utf-8?B?M0RFZW5NVEpzV0pzZlBsaStwazc0V3NxSHZQcm5lSjZDV1k4ZW13NndHQWNE?=
 =?utf-8?B?eW1zRG80SkJ3ZXZ0RXhJUHUwM0tQbXRVR3dDL3dnbTZiSGp5LzFSU0lhYWlh?=
 =?utf-8?B?VEpETVZGL29uTUd6dHBCWVFIY1N1dkRpV1hCb2dzSnRSQmFJMXRzVXVmVWF5?=
 =?utf-8?B?eWNwVVZjTTVBc0Q0c2pzeTlERHFJUW9JeUpJSktMNUVBcURLNllwNWU1Y1Fr?=
 =?utf-8?B?aXY4V0tKTEZMZ0d1NkRHWURWdlQvelBMOFJWS0pKd2k1WnRyNURnNFpCK015?=
 =?utf-8?B?aEF0dStSbWp0TzdJeFFwazJHTFR4U0J5bGFFdUNiYzYwV0FwNHZzd2p0L3E2?=
 =?utf-8?B?ejFFcXowYWlRbytLUi9BZlpoL0xXeVdSNncwMGdSUTRQbEpsMmZvaiszUVR2?=
 =?utf-8?B?dElENEx3Z1ZiTXNGSDZPd1E3Qnd5YVJDc1RoejRUT2FqRmhBZE14MWZUck1O?=
 =?utf-8?B?NjlIRHR4ZmlNL1FqVmUwNkltQWtkZmhVaGI5cVUvd0dyY0FFMEZuZ3M3Z3FO?=
 =?utf-8?B?RlJ2dEFtY20zLzBZYXBYcTFoWDVTK3gyRHN3RlhQVm9lYjkxZVZ0T3BtRGsw?=
 =?utf-8?B?MW5yRmQrS1doWVpMbmJ2NzJsY3JWRFBqOHN5UHcrWVROSSsyanltZnZnaktP?=
 =?utf-8?B?bWlaSVVxeGN5WC82ZnFUZWRCUzRjWW16RjZ2aXJvV2RWZDR0TVlKT3FieCt1?=
 =?utf-8?B?UGJBS3hoY2c1RUFDcFpvNVA1NmVTWTFGRkVmUFk2ZHZEQ3luRWp4YjVMcUlK?=
 =?utf-8?B?TmlrVUJHdjV4aUQxWEtEVVUxZktOQzhPVCthK0liS0RCdktRbndlWGRPalJa?=
 =?utf-8?B?Vm5kc24waFQvRjdyZk9GSEVxZUR5K0RsR1V3VE5uTDM5OXVtUkRsaUx3Smpk?=
 =?utf-8?B?VFo1clliZzNkaGVQRTA5dTRoVnVrWjRIZGNDbTZVekRtWEtPbm81dTY5Wks0?=
 =?utf-8?B?bWZGVDZJcWN1STZGVjdLemZqUW01OWY4YXdOWHBGV0FIYWxmT2kwSm5FVFh4?=
 =?utf-8?B?SGVSQXFObFZWMWN5OEU2WXFSSUV3V0s4SXB0enF2dFhXTG9LS1pESHAxMHdL?=
 =?utf-8?B?eFUxL25Zc3ZrWEZvbXZqNEFUSEJNQ0RkWWFvNTFCN1FXZlJ3V0cxOCtNTjZD?=
 =?utf-8?B?bU9XQWl5K1Y1YWdTMUZhYlVpMjhOcmd5ODQ0ZjdMTHVzWkQ5dVNBdk45SFFU?=
 =?utf-8?B?L3pabjJWVDhTS3NFUEdsdmVDVGFGZHRmWHpObldLaXVYNXRQcUFpeTNnSXVz?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9b0fe1-1705-4650-364d-08ddb85cf637
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:05:56.5243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SR+upbiLosY/+Xma7XLBnopaealuG1fdqtZTEyxQcsgOXiDn85yQ//fOl8B0l9dys3c3b/88uTfVQS0glOR1oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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

Hi Matt

On 6/30/2025 11:04 PM, Matt Roper wrote:
> Today all of our platforms fall into one of three cases:
>   * Single tile platforms with a single (primary) GT
>   * Single tile platforms with two GTs (primary + media)
>   * Two-tile platforms with a single GT (primary) in each
> 
> Our numbering of GTs has been a bit inconsistent between platforms
> (e.g., GT1 is the media GT on some platforms, but the second tile's
> primary GT on others).  In the future we'll likely have platforms that
> are both multi-tile and multi-GT, which will make the situation more
> confusing.  We could also wind up with more than just two types of GTs
> at some point in the future.
> 
> Going forward we should standardize the way we assign uapi GT IDs to
> internal GT structures.  Let's declare that for userspace GT ID n,
> 
>    GT[n]'s tile             = n / (max gt per tile)
>    GT[n]'s slot within tile = n % (max gt per tile)
> 
> We don't want the GT numbering to change for any of our current
> platforms since the current IDs are part of our ABI contract with
> userspace so this means we should track the 'max gt per tile' value on a
> per-platform basis rather than just using a single value across the
> driver.  Encode this into device descriptors in xe_pci.c and use the
> per-platform number for various checks in the code.  Constant
> XE_MAX_GT_PER_TILE will remain just as the maximum across all platforms
> for easy of sizing array allocations.
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.h       | 41 +++++++++++++---------------
>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_pci.c          | 18 ++++++++++++
>   drivers/gpu/drm/xe/xe_pmu.c          |  4 ++-
>   drivers/gpu/drm/xe/xe_query.c        |  2 +-
>   5 files changed, 43 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index e4da797a984b..4e719d398c88 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -60,35 +60,32 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
>   	return &xe->tiles[0];
>   }
>   
> +/*
> + * Highest GT/tile count for any platform.  Used only for memory allocation
> + * sizing.  Any logic looping over GTs or mapping userspace GT IDs into GT
> + * structures should use the per-platform xe->info.max_gt_per_tile instead.
> + */
>   #define XE_MAX_GT_PER_TILE 2
>   
> -static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
> -{
> -	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id >= XE_MAX_GT_PER_TILE))
> -		gt_id = 0;
> -
> -	return gt_id ? tile->media_gt : tile->primary_gt;
> -}
> -
>   static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>   {
> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct xe_tile *tile;
>   	struct xe_gt *gt;
>   
> -	/*
> -	 * FIXME: This only works for now because multi-tile and standalone
> -	 * media are mutually exclusive on the platforms we have today.
> -	 *
> -	 * id => GT mapping may change once we settle on how we want to handle
> -	 * our UAPI.
> -	 */
> -	if (MEDIA_VER(xe) >= 13) {
> -		gt = xe_tile_get_gt(root_tile, gt_id);
> -	} else {
> -		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
> -			gt_id = 0;
> +	if (gt_id >= xe->info.tile_count * xe->info.max_gt_per_tile)
> +		return NULL;
>   
> -		gt = xe->tiles[gt_id].primary_gt;
> +	tile = &xe->tiles[gt_id / xe->info.max_gt_per_tile];
> +	switch (gt_id % xe->info.max_gt_per_tile) {
> +	default:
> +		xe_assert(xe, false);
> +		fallthrough;
> +	case 0:
> +		gt = tile->primary_gt;
> +		break;
> +	case 1:
> +		gt = tile->media_gt;
> +		break;
>   	}
>   
>   	if (!gt)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7e4f6d846af6..78c4acafd268 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -294,6 +294,8 @@ struct xe_device {
>   		u8 vram_flags;
>   		/** @info.tile_count: Number of tiles */
>   		u8 tile_count;
> +		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
> +		u8 max_gt_per_tile;
>   		/** @info.gt_count: Total number of GTs for entire device */
>   		u8 gt_count;
>   		/** @info.vm_max_level: Max VM level */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 824461c31288..316031854c26 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -57,6 +57,7 @@ struct xe_device_desc {
>   
>   	u8 dma_mask_size;
>   	u8 max_remote_tiles:2;
> +	u8 max_gt_per_tile:2;
>   
>   	u8 require_force_probe:1;
>   	u8 is_dgfx:1;
> @@ -208,6 +209,7 @@ static const struct xe_device_desc tgl_desc = {
>   	.dma_mask_size = 39,
>   	.has_display = true,
>   	.has_llc = true,
> +	.max_gt_per_tile = 1,
>   	.require_force_probe = true,
>   };
>   
> @@ -218,6 +220,7 @@ static const struct xe_device_desc rkl_desc = {
>   	.dma_mask_size = 39,
>   	.has_display = true,
>   	.has_llc = true,
> +	.max_gt_per_tile = 1,
>   	.require_force_probe = true,
>   };
>   
> @@ -231,6 +234,7 @@ static const struct xe_device_desc adl_s_desc = {
>   	.has_display = true,
>   	.has_llc = true,
>   	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +	.max_gt_per_tile = 1,
>   	.require_force_probe = true,
>   	.subplatforms = (const struct xe_subplatform_desc[]) {
>   		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> @@ -248,6 +252,7 @@ static const struct xe_device_desc adl_p_desc = {
>   	.has_display = true,
>   	.has_llc = true,
>   	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +	.max_gt_per_tile = 1,
>   	.require_force_probe = true,
>   	.subplatforms = (const struct xe_subplatform_desc[]) {
>   		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> @@ -263,6 +268,7 @@ static const struct xe_device_desc adl_n_desc = {
>   	.has_display = true,
>   	.has_llc = true,
>   	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +	.max_gt_per_tile = 1,
>   	.require_force_probe = true,
>   };
>   
> @@ -278,6 +284,7 @@ static const struct xe_device_desc dg1_desc = {
>   	.has_display = true,
>   	.has_gsc_nvm = 1,
>   	.has_heci_gscfi = 1,
> +	.max_gt_per_tile = 1,
>   	.require_force_probe = true,
>   };
>   
> @@ -301,6 +308,7 @@ static const struct xe_device_desc ats_m_desc = {
>   	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
>   	.pre_gmdid_media_ip = &media_ip_xehpm,
>   	.dma_mask_size = 46,
> +	.max_gt_per_tile = 1,
>   	.require_force_probe = true,
>   
>   	DG2_FEATURES,
> @@ -312,6 +320,7 @@ static const struct xe_device_desc dg2_desc = {
>   	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
>   	.pre_gmdid_media_ip = &media_ip_xehpm,
>   	.dma_mask_size = 46,
> +	.max_gt_per_tile = 1,
>   	.require_force_probe = true,
>   
>   	DG2_FEATURES,
> @@ -328,6 +337,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>   	.has_display = false,
>   	.has_gsc_nvm = 1,
>   	.has_heci_gscfi = 1,
> +	.max_gt_per_tile = 1,
>   	.max_remote_tiles = 1,
>   	.require_force_probe = true,
>   	.has_mbx_power_limits = false,
> @@ -340,6 +350,7 @@ static const struct xe_device_desc mtl_desc = {
>   	.dma_mask_size = 46,
>   	.has_display = true,
>   	.has_pxp = true,
> +	.max_gt_per_tile = 2,
>   };
>   
>   static const struct xe_device_desc lnl_desc = {
> @@ -347,6 +358,7 @@ static const struct xe_device_desc lnl_desc = {
>   	.dma_mask_size = 46,
>   	.has_display = true,
>   	.has_pxp = true,
> +	.max_gt_per_tile = 2,
>   	.needs_scratch = true,
>   };
>   
> @@ -359,6 +371,7 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_mbx_power_limits = true,
>   	.has_gsc_nvm = 1,
>   	.has_heci_cscfi = 1,
> +	.max_gt_per_tile = 2,
>   	.needs_scratch = true,
>   };
>   
> @@ -367,6 +380,7 @@ static const struct xe_device_desc ptl_desc = {
>   	.dma_mask_size = 46,
>   	.has_display = true,
>   	.has_sriov = true,
> +	.max_gt_per_tile = 2,
>   	.require_force_probe = true,
>   	.needs_scratch = true,
>   };
> @@ -616,6 +630,10 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>   				 xe_modparam.probe_display &&
>   				 desc->has_display;
> +
> +	xe_assert(xe, desc->max_gt_per_tile > 0);
> +	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
> +	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
>   	xe->info.tile_count = 1 + desc->max_remote_tiles;
>   
>   	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 69df0e3520a5..94a8e1db71e4 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -160,7 +160,9 @@ static bool event_gt_forcewake(struct perf_event *event)
>   static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>   			    unsigned int id)
>   {
> -	if (gt >= XE_MAX_GT_PER_TILE)
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +
> +	if (gt >= xe->info.max_gt_per_tile)
>   		return false;

This will not work.  For pmu events, gt will be across multiple tiles.

Here for example, if a tile has 2 gts and there are 2 tiles. Then a 
valid gt id is 3. But max_gt_per_tile is 2. So it will return a false

Can we have

if (gt_id >= xe->info.tile_count * xe->info.max_gt_per_tile) or a 
xe_device_get_gt check similar to 
https://patchwork.freedesktop.org/series/150943/

Thanks
Riana>
>   	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e8e1743dcb1e..e615b0916217 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -141,7 +141,7 @@ query_engine_cycles(struct xe_device *xe,
>   		return -EINVAL;
>   
>   	eci = &resp.eci;
> -	if (eci->gt_id >= XE_MAX_GT_PER_TILE)
> +	if (eci->gt_id >= xe->info.max_gt_per_tile)
>   		return -EINVAL;
>   
>   	gt = xe_device_get_gt(xe, eci->gt_id);


