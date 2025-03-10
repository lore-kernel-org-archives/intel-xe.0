Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE2CC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 05:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785FE10E0DB;
	Mon, 10 Mar 2025 05:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JccQeC1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA00210E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 05:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741584087; x=1773120087;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=beWIV85FWkoM3h+rCqe6MFZSc39Y0PZluZRwao7Lws4=;
 b=JccQeC1xV8+d8HitBbZhIJ5exKNyih1Vuhwub0GInyVd9Y61XbkzgYwL
 m7LS5eWP3daKh0InmUN2HuyfS0D47BG6m+HKCl4LTdR7UDVTD8w2CEXDy
 mcThlyCib2gnFLW+5NCwGNWjQQ42XhIlcrSwXyd3i4998SYJcmB9Mypof
 /6vPMsqRwB6BbntlRCKvY02U8zcS1y0xL0R1owwN9MAJ8nLsj+gWyDxn5
 rlv6TB1GvnBJ+YaR1yvrOuM4IpHSMTbclRjCd1Zq70PB77zEPXbTOO3rI
 GcCFmYjxh4Y3uDA2nhu8dqyE5IdpG8cJZn1tki4GhwuvVaaWC9egWG9Ui w==;
X-CSE-ConnectionGUID: aEcpE7VFTpG01X0ihAmDXQ==
X-CSE-MsgGUID: qZYPFsy2SQ+rz4r+uoDgcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42676121"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="42676121"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:21:27 -0700
X-CSE-ConnectionGUID: nU3RFTOdQ+u84rVSU2E8CQ==
X-CSE-MsgGUID: OdFeuaCrSJu8ZleOp63LsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="119732574"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Mar 2025 22:21:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Mar 2025 22:21:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 22:21:26 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 22:21:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOwHLQHrZw+YIrn9c9uNUahJMmhpyFylEHOWCUbdmUFm1JWnt5iiv45zQ8oJNbcd1oZ9JH+MYCtFnL0zZGJv071zfGXkrUFClbhM+LUqLbHPODQfCUkD1u/bN88UrUTMItwnSu3tDLBdxVVF+3T8tFsOk/a3gFk4SHMdyKGz2P0WwMULv3tU0LjOpj5CdFiJ8x8pBsRh+/le72tbw8yXv8hV+fcrH0BUb5/AxW5ujtpVqk8X+MbyOdQh2v10N+j78WL2gcZ4hvyiGdw+DbHESReXGVE1+epe4/n2UjPqNiFq0idTOkSO7uxhG4CEb6vAaUJ3CZOkEFpBSxE13/HWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmqPO6PEVer6yZXFtH6WCAZ+8ULLmtBSu6xLBb1KXP0=;
 b=nbCG+6wjhnBiAOnsPxRqtSrJyyPDkFIo1YbhJI7tpj2cZgXt+W/FSUcnnZ01l+3c6KieiTgvTA8IyRBJ9jvdjG1ewIDpm5LAf9PtPtQqI+EFExA5Kp4R0bjJVbDQCjPcjuYZf63fU8wqPY6FIFRq722nYp56Px4VHuwR6XzY1QLpH8sSSBrzgFBfFChKnaLHBMRFYlvVbKVH+e+fhYTad5uMEnUuEls1xo9iUkgsL44V5W4GclWoncYlvxQi2uVINXbqVw+WTXLUPU/wZfoYa6PzM3tK2fB4UHJkDmjMukJrDjqpsVZfi6EOmxYXNGc1N4JtRfgIqdYg1HPBPmCJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 05:20:50 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 05:20:50 +0000
Message-ID: <ace70e78-09c0-47e4-b52e-74d4e3f26fd7@intel.com>
Date: Mon, 10 Mar 2025 10:50:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL to LRC dumps
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250307190754.678376-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250307190754.678376-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::18) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SJ2PR11MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 3895ad49-1f03-45b7-7657-08dd5f9351f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVpCZ0pDNzdPdVlRdjNUUHE5M1V3QU1ydnN3MXFYd3JQQWdWaUcxVUxPaU10?=
 =?utf-8?B?dTBVc1BQYkxSMDV3UFNzUkZCU1hNYTF6SDVDOWpHTzgyNy9wVWR4Q2RsRVBi?=
 =?utf-8?B?ZC9Oa0Z3QjFWYmIyNVp2KzR4eUdYejlPWWFFNThOaUgrek1qaGcxQ1RmZGJE?=
 =?utf-8?B?c1NFc0lJc2FUWjIrMEhvM0JBb0pGNXV2aXdIWDVpTmVWYUc5NWFCVHE0TlpY?=
 =?utf-8?B?V2NOd0NuWm12WmMvZm5CcWVTZFlWejRQM3J5N1p2T1c3dTRuOThrVTFkR29U?=
 =?utf-8?B?Q1VjNE9BN1BVdGFuajkvSnVjbEhJQWtmTzBqWmRJNkFXUllZZVE5NFBlMEZj?=
 =?utf-8?B?ZTF2YlZEMG94MkV2ZThadUw1M1ZoQkwyOXl3aHdCTkY2a3dFMUtXRWk4K0FU?=
 =?utf-8?B?MHArNWtSNDAxTUVaNUVVN1hRVCtkZVBuWTlvVmc0cFpQODZXRUdlZG1ZbTVW?=
 =?utf-8?B?a25lYnQvWlRTcnlwY2ZqbHdmM1M3a25sZmtrcXJrR2pEZFVnU3lBN0xKdXBP?=
 =?utf-8?B?dEJ0dXJDNjB2ZjdjTmhUejZZQlYxUDJ6NDFDOTNRN3FUZkdZNTB5aFl5U251?=
 =?utf-8?B?aExqbjlvVW9Cb0s4S043MmlQU3VtQmFXazZDM240ZjZteWdPdFBOaExQd3B6?=
 =?utf-8?B?Y2xrRGh0dVRVbHRoTmZWbmxWZTRtTmhIR040YlgydVpYTWhHOEFOUjNkL24y?=
 =?utf-8?B?UTR1clVsSXB3KzdoU3pBM2tjRXRpSXpZdzZ4TXJ5Qis5Sk9obVhLQkllbzhY?=
 =?utf-8?B?bnF1Q3NQa0pJbzhpMm8xeDd4TFlhTW1uME1TcWh5Z3BxU1BKZnVWZFNWcVRl?=
 =?utf-8?B?cUNSbW0xVUltcytaRCs2L0NBZmlId1FtdktHUzNHU3pQeWRHZnJxS2I4YkxP?=
 =?utf-8?B?SkM4NjFNZDVla0Z6eVpvZWhwUEVrWFpyQWN3Rnlpb2w3TVI4ck1XQkp2eHhT?=
 =?utf-8?B?bHBUYlQrWG5CVldxTUZpZ2t6Tm9uR0l0NlE0WjNicjdjRFRxbjFIQkgwdEdO?=
 =?utf-8?B?cHZudkZHZ3pDaXdOa0JYbnkvVTJtdFBmdlpBUFhSRDRvdWJXSDFvaGl0bnRz?=
 =?utf-8?B?V1M0bTgvV2Q1MHNVMmZjSDV4VFllSmt4emlRTFNjN29WbCtyT1Z6UnZIOVlR?=
 =?utf-8?B?ZFJKZ1ZGaEJ6L2J1bnhVcWt4a0s5eHNjSjF4N1g2Y0R1WTFVamU3NFhsVW14?=
 =?utf-8?B?WEozcFkxM2N5MVZCNzRNcnJhNjFham83WmJSTk8wN3k1aWw2Q00vd1BlMU9v?=
 =?utf-8?B?bjR3VUFMNGVjN2ZmRVdhdy81clRrQnhwY3U2bUVkcmxLcW02YUlaS2xxMEtI?=
 =?utf-8?B?TW9SUmowQnBrWnB0c1lOUk9nQ0VNZ0xjSUJNcklKaFNXUldIaDZTaDFNUThY?=
 =?utf-8?B?eWJXNmhPYjhySHNlTVBreEVGc01HTElCVUdrNSt0LysyM3Q3ZlhWMkswRGpo?=
 =?utf-8?B?OGxiSm42c1Jha2pjOHlvN2ZCcVdhN1J2ZlNvZ2NlRXd4VFhhY0YzMENndTZB?=
 =?utf-8?B?TzlBYTUrOU9qSVZTZjI0aytCaVVVNmNMZ09pN2QrcVdBUEV4cFZJdHAwQjRm?=
 =?utf-8?B?eFd1OFl4TGMydVdQbG1RWVNQeVZxRnZ1SC9CMTF5SHh2azZWNjlaenAvZ2xy?=
 =?utf-8?B?STdaMGNGWm1jWkRFekJrTjNNOG96L2RROUtFUDh2amt5Vi9jTU15elhLeERv?=
 =?utf-8?B?UzRVaiswTnVxYkxKRFFMWjlOQ2Y2L0FRVFNpSlZuU1FzbWxFbDBJcUdIdXZI?=
 =?utf-8?B?end2VWM2SnBDa2UvSnpKamtPRnFNOVlqb1RaM3ovY1NEdFd5S0ZGSUh5S1li?=
 =?utf-8?B?NVhMQkkvWmt5M3ZCNkFEeXZ4SUZEVU9aTzZlV2pSamRwdUJ2RFRXUWdmcVNw?=
 =?utf-8?Q?ixwEn3Ad/9d1k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0NhNlBnbGRncXJjK0RLZXVkNXFiQzlLZm9VU1VTa1N6WHdSd0pjekpPSzJJ?=
 =?utf-8?B?T1F5ekJ4ckE3Uk5UMXFteHpTb2RPaDFESWZDK1orL0tFbU9CM0FxVW9wK1Vu?=
 =?utf-8?B?cFdlKzdSL3podUtrNWhGLzBFR09MbXBhZGVPSGhwM1JocmVoVlhTeHFqaWp4?=
 =?utf-8?B?b3VrczZQVll4ODdyMDc2Zmw1YnFiSWMrOFJKQzFtVUU4M3VHZ2srcURBMk1T?=
 =?utf-8?B?ODZkUWd2MjhGVEVqM2dVZnJ0ditEcFNQRHBwcTNMSzNBQmpBYkFsUFBqSlhV?=
 =?utf-8?B?ZnRhcTdXbVZST0tFeXhDb0lOb3doQ2VIaStaSTFYY3lGWXJYOWQ0d0JoNldv?=
 =?utf-8?B?bGE4YkhnWTRWUllSelUxY3NoWW1LMk5vU3N6dWNCYjNONmFNZEV0NnRYR21l?=
 =?utf-8?B?R1lHRnI0VUdxbldwRG44ZkVqbnhyaDQ5MXBDeDlVdnp5dWcxL0x0RkZrTGNH?=
 =?utf-8?B?UGNSQno1NU9sNkNubTc1SkFSbEJUdFF4QVVnVjhmZTlodEViQVpNL3hHQkdP?=
 =?utf-8?B?MUZuNkNJbldVdFdyRGE0VE1lZ0lDdlNlWUhCcXYxbU1jUklnekxGRmpJajNx?=
 =?utf-8?B?TXlhZmkzTDdReVlUdkNkMDF0RmsvYlpOY1NDR3RFdEsvdjlsNkttYWdqWGJv?=
 =?utf-8?B?WDRWSDBQNitiUUJodTRpMG5TZlBNL3JhN1lqZ09VZVJhUkMwUnIvTlArWHJq?=
 =?utf-8?B?UTA0ajZGNnkyV2lKR0lvRFJLSjN5ME1aQnhnUmwwQ0QrM2N6QS92MURtY3Bz?=
 =?utf-8?B?ZEV1anRyNFVxVlFZeVErZFRXckZ2MC9ja3hUWFdMN1psUGNyUVh6MnlzNTNy?=
 =?utf-8?B?M05zcHNnTE5hZmd2RzRxZHZVZlRhUkJWbVl5a1VvRjYvSXd2bXNpdS9VSkwy?=
 =?utf-8?B?QlFzYjdseGZZSWRUNjVyaVpjWmVWa3lSTGY3UTJUb2J4aHlhV2NiSXZNZThm?=
 =?utf-8?B?T1cyeU8xSC9HcUJrRzQyOFlwc1Bjck1TUmNhRGFyMXF0SVd0ZXdoQTNNM3Rp?=
 =?utf-8?B?dHNoU00vdEFIMG4vbUpraHJXc0d3WnV2d0ZSUGJ1aWNHcW1heGN6d0ZwTmUv?=
 =?utf-8?B?emdpbURaNk9OSW5TaDllazdoSnIzV1JpckdOR0RPVXEzMFEyK0pjSVR4eE1k?=
 =?utf-8?B?Y2dxcm9yRXhSV1dVMGMzWFpTY1FMNWdqRGlSTUlHenhWbHRZQkZyZDl2aENi?=
 =?utf-8?B?UGFsbllTVjRFeUVzeG41SlFjV2trZ0NNOFpLMWRLVjVsNTVwYmh1TFovMjh2?=
 =?utf-8?B?RjNydllJeWJVd0JJdHJQVzFpanRYaVhTVldiWWQzeEZKZGRSMDV5dm0reFB2?=
 =?utf-8?B?R2lQNCtoc0dNRjdiaHJkRlhkdlZqVjV5eW5YTzNSdXBQYWRnd1UxTmlmRytC?=
 =?utf-8?B?NmlkdkExRFVmUUNDMEt0VU1zUTBoUHNBK0ZCMVFEUjhxT3pBMkNmZkw3K2dY?=
 =?utf-8?B?M2JTYmVXNGlXUTRFcUdBUDk1Y0lSa1J1RTNSd1llaHFCa0pMVDlkeTVTWTV5?=
 =?utf-8?B?bm1TQ0tpZEwxM0xJdTFVb3BOQ3RUSDN6VnhYODIvZ1VHcndwYUJYUy93bGsy?=
 =?utf-8?B?Z3pOczRGcEJhL1RTYVZ0RGJNREdjSk1DYTQrckE4bzAwc3ZXdmtxL3I5cTRw?=
 =?utf-8?B?RGhWV1FUMGFzNnNRUXZxa0FzZWY4NXkxTVBCVXJXZ3V1dzAvdFNKbWdySEcw?=
 =?utf-8?B?TEpDQzU5ZGljVHJyRUFJZ0pjb1JyTUMrbkI4TEU0WDFiUTBmK0p4R29nRmxM?=
 =?utf-8?B?WEVFS1JQZ1pCLzl2cGpZUW9UTlFzOWtUWTBKOWwrWk5RMi9JTThXRUU4T3Vo?=
 =?utf-8?B?Qm9TNWtEVUFsQk9XeW9Jak56bTFtSXR6YUdrVjdIZHYwUE1NekwwTm1KMXZK?=
 =?utf-8?B?cGNJQ09aNWJkbW80S1pwaks3ME4vZ3ZzdGRoTU5sdnVsMjhmVSttNmFJL3Ez?=
 =?utf-8?B?WWEvSEtndGN6UkRuRkJJQkdwRDFFbkNnVDBYZHp1Q3c5VE0vdFREQ001Qko1?=
 =?utf-8?B?SlF2Vit5SmpwdmlSVG1xbVFVQzhvcG5VTTRqS1RHaitCdEhUMmFkMDl5ZzM1?=
 =?utf-8?B?YVJjY09hNm5JRU04MTNuWk13amtuV2xwWUhTb05kaEJ6L3BydU1YanNrRnJm?=
 =?utf-8?B?Y1YvWHZmYkNQKzBDd3ZrRG8yZ1pCWUxWVG5XenV2aEhpNFVOZ3JQd0tydXk4?=
 =?utf-8?Q?3yf6yulsRVRo07Zaa3uFy+c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3895ad49-1f03-45b7-7657-08dd5f9351f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 05:20:49.9803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZP3ceJSlYK1sQHac2MS+/+PmikYxkzjL36HCgVdsYPKqg2V0wddslnAMEnw5WrqO2C4I2KLYTFqE4mG/WfmlcQKsDm6dmHerBjZ/k2plN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
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

On 08-03-2025 00:37, Matt Roper wrote:
> Xe3 adds a new 3DSTATE_COARSE_PIXEL state instruction as part of the
> render engine LRC.  Ensure we can recognize and report this properly in
> the LRC dumps.
> 
> Bspec: 65182, 73415
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Just a nit, it should be 'in LRC dumps' in the subject probably, other 
than that

LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>


> ---
>   drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h | 1 +
>   drivers/gpu/drm/xe/xe_lrc.c                           | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> index 31d28a67ef6a..457881af8af9 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h
> @@ -137,6 +137,7 @@
>   #define CMD_3DSTATE_CLIP_MESH			GFXPIPE_3D_CMD(0x0, 0x81)
>   #define CMD_3DSTATE_SBE_MESH			GFXPIPE_3D_CMD(0x0, 0x82)
>   #define CMD_3DSTATE_CPSIZE_CONTROL_BUFFER	GFXPIPE_3D_CMD(0x0, 0x83)
> +#define CMD_3DSTATE_COARSE_PIXEL		GFXPIPE_3D_CMD(0x0, 0x89)
>   
>   #define CMD_3DSTATE_DRAWING_RECTANGLE		GFXPIPE_3D_CMD(0x1, 0x0)
>   #define CMD_3DSTATE_CHROMA_KEY			GFXPIPE_3D_CMD(0x1, 0x4)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index df3ceddede07..81def1792664 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1445,6 +1445,7 @@ static int dump_gfxpipe_command(struct drm_printer *p,
>   	MATCH3D(3DSTATE_CLIP_MESH);
>   	MATCH3D(3DSTATE_SBE_MESH);
>   	MATCH3D(3DSTATE_CPSIZE_CONTROL_BUFFER);
> +	MATCH3D(3DSTATE_COARSE_PIXEL);
>   
>   	MATCH3D(3DSTATE_DRAWING_RECTANGLE);
>   	MATCH3D(3DSTATE_CHROMA_KEY);
