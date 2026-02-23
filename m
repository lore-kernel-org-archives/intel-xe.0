Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C00BEC1113
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 17:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0973010E416;
	Mon, 23 Feb 2026 17:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtZuiMnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5397410E40A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771868436; x=1803404436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WNebt9LRg7RMHotcAct+JfagRu9Mv/B2TmbG2tHt7sg=;
 b=TtZuiMnn1rSXfP1GrAu9hdJaq8YHQC9OJK+o2l7JOAtTJ78PIFbLxY2v
 Jbr7spJtEo2jHZ/ry/7yAqeoWfJH2Zkn5GuFM3YnJUh8lT8T1XWgL06kG
 JOS07FFx3HvPM1oYPtRLVXxmUixIImjRTcOA2KExfz3D0EDMNBvvLBbG6
 uiQ/apcjwc7aaguI37O7Q/hfMG7L0oWuzkJd8THqnSfIpZL18Cya6bKw4
 EeZTkS5qJM2sJaQyv1s0lEaR2tA1mF9Tkd7mtmLLSfLJidlVwgdZA1wlK
 EmXClxXhU8K1FJFEsbv2KO5IVzWED8QsE41WXWlEVaUOjC8UgfAz7mTvZ w==;
X-CSE-ConnectionGUID: HYFBzWABSmmpoQcn5ltV2g==
X-CSE-MsgGUID: C3QgWZbpRymjhnDzUILvkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72971381"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72971381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:40:36 -0800
X-CSE-ConnectionGUID: X3uLqqTxQEq8z+zAqQF0jw==
X-CSE-MsgGUID: ot8c8LmrS/OscX44VfVQ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="213545342"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:40:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:40:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 09:40:35 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 09:40:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLD2iddbwmJKw1WhsZsL4Z9wAKB8ARQMlHCFnV0wA0vfsTLB3GYUXnk74+uWqNUxsusOf/u4OugO4hO/wEMirgmGTTwyQqS3rx0ZDlXVG+AYR626m5GDdIOpt4t1DKz90bm1sUF4hJB+Al6CwE/KOwVmIsU7cbqcFym8vfO2Aqg2T3nfDeTQz58K+ITn1EJNKfmWw9j5AlrVkVeL3x7p76MaTb3T4ZQ9yZ1t5hoeHfB+Xaf4OzbwEygsdd4ElHAZRW447mCSZ50/9u/OF3sYcrMw+HCI5bCBZ9KcjNNGelLGjRTkmNEKFPtw8/OY4xijPZD3wgHiJdgZZ5GU6HMnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=768r2afBMFDLDm54okvtxM2z26z85bqBljrAKnFpW94=;
 b=MRDJogGNPHlk4QuKfeNffG0AfElsNgA/QZNl5ihjXCUZ3kOutLAw2XPNszkPD/sZ1/xAyz9jgToQ57Eb4hoQqcKBmKcuXyJCOl5dYybhs3yK7Lhw+rpy84BHpwhdR5TUS+KbZ2Iprz7ar3rLyvUNl7U4nIqArHuBafL7E9f+MWC/pgNSJPsdWuEx2tsuMcXIQRJf/1Y2lA7NIDfZ41xYNoG9D4glm8u2yOTatXkT/yj5JVumQAxaAWUE1Xe459gz0kqq1EY1YSOt48l+OMq1D27zM3W19LWfp4xl+Q0guLibyuGPLsGtQwWv7nnqn4Z3q9dBxItc3jq2LPG6pnkSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 17:40:33 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 17:40:33 +0000
Message-ID: <02b09764-52db-4b81-aa31-37e588953a0e@intel.com>
Date: Mon, 23 Feb 2026 09:40:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add debugfs facility to catch RTP mistakes
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
References: <20260213000929.732113-6-matthew.d.roper@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20260213000929.732113-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:303:dd::24) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|CO1PR11MB4818:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c30db1-4df1-489b-d73b-08de7302a4e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEJLZ2hrSFlXUUtUTThqa1JreEM0M29yTWl5U2RSQ2E2WEh5R25yQVpjelY4?=
 =?utf-8?B?VWdmcWFCb1lNOW0xWHFWODFDQmhka2FhQ21nT1BacGhiT0VKd2NxcE1MdjBL?=
 =?utf-8?B?ZlgrSk85aEc0S3VtVjREc3dXS1gwUUY1NHRQZFVnazg3aXdrNkYwN3B6eEND?=
 =?utf-8?B?NWpUMkdOcUNyNXY3WDBKWWtaWjI5UkxsWnJEWFpmanM0cXhMbDJrQk42L3RW?=
 =?utf-8?B?MythVnFsRkgvUWpNekZIQWQ0SDlBaG9TSzc4Rk1FRTA1QWxsNWpEZTFXSFRk?=
 =?utf-8?B?dW5wdHB3aEU4WGRjZXhlL0YxT0cyUXJMZ3lQSERvaUM3d0tKMC9oQVZuNExE?=
 =?utf-8?B?Z0xPSk5ETm81Yi9WaGtyOWZYY3hidmIzVURHZVpDOU94ZGRCc2YzVnM2TGZB?=
 =?utf-8?B?c1lzOWY5UEJ6SlZxQkpqZlZSZ2YwelpxTEs2MTRrWkY4MGpmNExBOTZJZW1L?=
 =?utf-8?B?NGY1RFBGQ0szaEZCeUNsYWhBUTRqMjNrWUpDdDg2c0ZQTFNPS0I3RGtXMURT?=
 =?utf-8?B?L1U1d3pYKzVrdVBZa21nbSt1dVdCbnN0NXR3aXkxeWd4QUJWaTdFdy9XVFov?=
 =?utf-8?B?QTBUeFlTZzJYV0RaVDVEeCs1MlRZN2Zrd3R4ZnpTaGdjek0rcGZyb1c0d1Vz?=
 =?utf-8?B?RnJ0bEhkeTkwU2lSQmxjL1pVVUZna1hsc21NYXR6bFJESlJ2SEkyQ2VGYXJn?=
 =?utf-8?B?blJQRGg4cDYxTk82dnMvMmp2MFdtazFlam44MFRZd1ZrVlFFeHZyd0tyMjRN?=
 =?utf-8?B?K0lqMjFJbm5zRERzYlJ3ZW5kWmxuNldlYmp6S3FsY3g2ZlBCTHlqcWxBMU4z?=
 =?utf-8?B?aEJwTXRNTWIySnFnd3FWNmFpNGljL0luaWIzQy9tUmpSTy95N3ZCOUhKU0l4?=
 =?utf-8?B?SUd2OC9NTGhrMVpVV1BXOFp1OWprUXAxeXBETDdmMzNBVTNaLzdlSVpsQmtV?=
 =?utf-8?B?NWUxVXBPVnhheU1xQ2JjR09Sc2ZQYWlCSER2ckVwQkVnbnJrUFloekV6c1R6?=
 =?utf-8?B?QndIRklNT2ppaGtsdklGODIxdHczWlN5cVRDMjV0NDd5c3BDUkFkWldITERS?=
 =?utf-8?B?RnJOZnVFbkQ3QVF3RUlQOG91cmsvdWlIMytMVEs1UDNXNGVjaHAxVTdpa3Z0?=
 =?utf-8?B?bC90NWdGVHdOSjZ0Kzh6eTIvR2o3YVlUVUNIdmc0RENIWUVYbkpWYXRGaVdn?=
 =?utf-8?B?WWpUTTdaRVA5TU1XR0gwa2RKMGJWQVlxNnhoWC93UzYxWk5iRjdnMjRDM1dl?=
 =?utf-8?B?ZzIyTkcwTFR6c1U5WHlzUmJkM0pMci9aemlNZ21nOTRKMWVObTIzd1NLVzNr?=
 =?utf-8?B?aXRlY3haSXo0d2o0aG8vZ0ZrUXpzZmNRNlkvUS84RGFjWTUwenp4N21hbHRj?=
 =?utf-8?B?amxIcmR3eWFsQnVqeDkvSTc0eUFSZTFESjhmd1o5aUJMbVVWMFpCUnIwNGNo?=
 =?utf-8?B?Y2FlWkFkcHJzRTZwNlQzWWtaaCtmcC9pWjBQY04vVnMrOU9vWDF0QzRVWXRy?=
 =?utf-8?B?NzVSTnR1RlZTRlFIalZFMDRIeFgwZ05YQUVqUS9Ob3djd0lMS00rZExTOGJY?=
 =?utf-8?B?Q2dvZHhWbnpYSy9OSDFCN2l1dDQ1U0FnMGtkMi9mRExQRmVzc3UzT1ZjWjd6?=
 =?utf-8?B?Zkx2Z0VFRXI3blkzODlNYjNqVWdTdFl6WU5QVldOUTF1c3M0cSsvays5dGtW?=
 =?utf-8?B?UXFDRG5iTWhqaDdlS3hrc0NEZGlwanFwZVhPanpOaFZNa0FPM3dRbVlCZGY1?=
 =?utf-8?B?MkdyL0xaREorMjNYN2tmcVp0R3ZmVjFaSUVhbWoxOGJhQlhwZjlZVmptSE9S?=
 =?utf-8?B?V2VNbW5LT3d3SzV1OFdrR2tpSm9sNzhQTWt1S1Rkekh0RGs5RTFLN0hpRE41?=
 =?utf-8?B?UFRUaU9YbXFaRWtCeG02ZS9STnl0VFFPUjdWdDVCRHNnRXBGWjAvdWJnREVX?=
 =?utf-8?B?TlpUMVBENVk4dVpSWHpmWkJjU0cyTWZEblJwK1AwMEY0TlpQNVJTTzBCNE0z?=
 =?utf-8?B?VlBYVEdxMnd4ZCtGZkZjVTA3bC9LRmwydnZqZDFUdWt3bWZxeXRadVUxUk1w?=
 =?utf-8?B?OU9VNlYyUGQyanFKQnZEKy9QK1ErWkZBYmo0eDBCMjRSWGZVTUJwcG5DdWtR?=
 =?utf-8?Q?P2Tk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEducXBzOFhncm9Ha2U1K2VJbzhaU0FpcEpOVHZwV0UwTlhHNWFqUlFCQ0xL?=
 =?utf-8?B?cS9BZy9MTDFOYjg4VWZSaTZzczZNUFJLcDBXVytBQ0xMZEdHMk5JaWQwUFZG?=
 =?utf-8?B?SUVscURXcDRuelRNUHNMQ3h6eEFiVy9DS0ZvcTZkK0M0bWV6MTV4M0xQSjNm?=
 =?utf-8?B?bmVNZXdLdzNQL1RwTFhoaGlzRER5NlJGejhpQW5VNzBmekxuZEIvdzVwU0hR?=
 =?utf-8?B?M1htRXhVVHl3ZEg4S0srL2UrenVRTTRCeGlOTUpiUTgxaHI2MUIrSjdNL0xL?=
 =?utf-8?B?dlhwV1dJMUNlT1AxL2dpenNkOHl6N2RXWmdRZGEyNWtsS3J6Y0RNaXlrbVBi?=
 =?utf-8?B?YVhPREVtVlAvVm41QVZCSmJqL1dicjg5MlJTcjJ0dFBCSGI0NTZVNVdlTkhP?=
 =?utf-8?B?TkVvTmIrNUNFSnNScWFjejJGNWNZOWVGbjJ4ZVFkaEF6QStmZy9oMU8xY2VD?=
 =?utf-8?B?bFZOSmY0NVR1M3NIRnlqSEYyM0ZMWTk5RnZhUGJIcGdLWUJwWnVDSk54NXM0?=
 =?utf-8?B?eEp1UC9ScEhNRksybXlNWHZSTUFnNFhUbi9XeDAzNVVvZk1mM0ZHWkZBVk1y?=
 =?utf-8?B?UlQrbG1VcVVRQno3ajlhVTVHTnRZYUVDR1h5M0hWWnpuMnVlRENCQWJFTmda?=
 =?utf-8?B?c1VMOFdGM1RLMHVIczlBdDAzSGxEYmRQanhybjlpTktPNVBBVWZ5NnoxYXJN?=
 =?utf-8?B?RVp0a2ZGUUVWUlRvRDhXd0kxY0dVUzlGbVdOdFBMa25oSmJ3UjdpeFpuOVUy?=
 =?utf-8?B?ZXpNK2dTakZ0a1lBUFF5YXNzNi92aUJ4YnBneEpqdWEvZUROajE3dGVZVHpx?=
 =?utf-8?B?OGlnZEY3TGhSaGNHTmFDNjZYZWF4bkt0NllicG5mNzhseit5N2dFMDhFYnhh?=
 =?utf-8?B?R1VjK3I5dlRNSGtWQ3IvWnRtOWNuM20wVTI1Y3VaUGVDaXNlWDQxdUdOZmd1?=
 =?utf-8?B?MmhNVTl0TUJXQjlJM3FqZEtSdFNISXBPcC9Sai9rd0ZFMGhnek1wM2FSZ0Iz?=
 =?utf-8?B?a25FQUlGeDlSb2Mva2pnVmlQRlAxbnhQcERNeUh1ZHNpMXdZMTZXaEFQc3dM?=
 =?utf-8?B?K2FjRS9wNHJZNDNIZEdkdUxnSHE2b2NZcThVZDZ3V2QrSWtRVWZleUhjc0dt?=
 =?utf-8?B?R1VuQ0NUc3RIVStKTGl5NVFEQVE2S09UYktQa2VtQUp4TTZzU20xcXdvUUYw?=
 =?utf-8?B?SG1IU1BNUlh3ZkxwYzVjWVhaVkkxUzN5cjc2ZDU0M0k3NXVYL3hjUFl4YXUz?=
 =?utf-8?B?TWF4UkZSdFV6TVFOWSszdUFQdkNOczFEdWhtR2hseGhNMHY1czZBeVFsTFZj?=
 =?utf-8?B?K21PR3lDV0pPVzVXYmtwL0I4dkgwem5mcys4ZDJBU25FUks5TmlpeFZFZ3Z6?=
 =?utf-8?B?Sy9TZ2FEUWk5aEFobldtVXlEWFZCMXY4SGtxRGg0SlJIbVlmV2xvcG1tcjZR?=
 =?utf-8?B?TDhGektKb2UyVGpTaUF5V0xaTW1BY0R0cVhRdUJsWUROYXdwc0NaNWZnUW11?=
 =?utf-8?B?a01ZOHJiNjQwODVPeUtIWnd4bG5GclJvc21yWVpRSm5sWkZDN0JYbHVuVzZP?=
 =?utf-8?B?bWh1aGxHK0UrRkRhaVRWSDNlQnJTdVNOY2NHRFVqbkM2bWhKRXREK091WGQr?=
 =?utf-8?B?YTZrUjZnd0VVY01zYndqY0xCZjhoV3BFeTdVL1htZyt4WFo5SE9IM1N2R0pD?=
 =?utf-8?B?OVlwRnRaRytRd1BjWUEvc245ZlBaeWI5d2NBakJpSHpnN2VkNWc5YVpTY1NZ?=
 =?utf-8?B?U29BdGFtendLVmdJZWNkczBzQ2J6QzlONzcvZVhuZEJiN0UvMEQ5em43U0tu?=
 =?utf-8?B?KzRDSnJQWjVsZW9MM2x0Ym8vbEM5U2xaWWN6UFNXOWdBZ3M5K3pNeXFrN1Uz?=
 =?utf-8?B?YS9lZTNmTVVUN1BrN2xIZTVHeHZrS1FUTXZ4RGhtV3daeDlYNjl6YTZFZlpG?=
 =?utf-8?B?clJBRzJqd2hmdjN6OXh4L0J6M0Z6dG9oUjR6WFRzU0dMNisvcnlodTlXTjQ0?=
 =?utf-8?B?UFBDcGtDUHhZMkpiK3ZTUGNWalhybnRwZmU5SVJjQXFhMitxZGJIRTdPNjU3?=
 =?utf-8?B?ZGZrdmVDUmpnYXJGb0pCSTJqdUF2ZEo0aTJIcElzN3ZCRGZQR2t4NE5BOFhW?=
 =?utf-8?B?cnVRTGNaamR4REpSN3pwdGtGWm5rWW9mWlpoRmN2alNrZnNhTFhDNFE1c080?=
 =?utf-8?B?RjlOVTR4cnhLUUxiSXg4T2MranozWFVTa0k3TE9ESnNuQlg5RWVXK3QxSHVt?=
 =?utf-8?B?NjlKKzFiUGxxTE9OM2hrNVF2ZzNkNFhKa2RJVDR3R0drYVNLOVp3ODhuajlv?=
 =?utf-8?B?RFdrSGE3MTQxYW5teXVwNThkQjAxamZGTTZ4eWtxR0hiZlVnLzh3SnRERnMw?=
 =?utf-8?Q?amc5K36wWOtmEeW8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c30db1-4df1-489b-d73b-08de7302a4e1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 17:40:32.9753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnERNT7VFba64RyeqlstBaSqRzOlkq3a/X7A60WJgO9e1YFIGzr+2A+w6mzlO12oo+yi0lWK17N2c9uqrPQseLsdpKornZis7LaPDiw76Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
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


On 2/12/2026 4:09 PM, Matt Roper wrote:
> Unlike i915, Xe doesn't currently do any readback verification of
> workaround/tuning settings that it tries to program.  If an entry gets
> placed on the wrong table, or applied to the wrong platform/IP, the
> programming may be silently ineffective without anyone noticing.
>
> i915's solution of doing verification at application time was
> problematic because raising warnings during probe would be treated by CI
> as a fatal problem and would prevent CI from even attempting any other
> testing until the issue was dealt with.  Let's avoid that with Xe and
> instead perform the verification on-demand when a debugfs entry is read.
> This makes it very easy to do verification at various times during
> manual debugging.  It should also be simply to wrap a dedicated IGT test
> around the debugfs entry such that any unexpected failures are reported
> against that one test rather than bringing down the entire CI system.
>
> Note that verification of LRC programming is a bit more complicated than
> verification of GT/engine programming since we can't just blindly read
> the register values from the CPU and expect the RTP values to be in
> effect.  Applying LRC progamming ensures that every GPU context created
> should have the updated values in the LRC, and those values will get
> loaded into the register when the hardware context switches to it.
> However when no context is running on the hardware, the register values
> may revert to their hardware defaults which do not have the programming
> applied.  Instead, we should verify LRC programming by parsing the
> engine's 'default LRC' image and making sure the desired programming
> appears somewhere in one of the MI_LOAD_REGISTER_IMM state emission
> commands.
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
> v2:
>   - Avoid processing RTP -> SR for gt/hwe lists in VF to ensure the
>     debugfs entry is safe to use in an SR-IOV VF.  (Ashutosh)
>   - Add verification of LRC adjustments by searching engine type's
>     default LRC.
>
> v3:
>   - Add missing checks to avoid SR-IOV VF processing of RTP -> SR in
>     hw_engine_setup_default_state() and
>     xe_reg_whitelist_process_engine().
>
> Matt Roper (4):
>    drm/xe/reg_sr: Don't process gt/hwe lists in VF
>    drm/xe/reg_sr: Add debugfs to verify status of reg_sr programming
>    drm/xe: Add facility to lookup the value of a register in a default
>      LRC
>    drm/xe/reg_sr: Allow register_save_restore_check debugfs to verify LRC
>      values

I reviewed the series and I have no further comments.

Reviewed-by: Daniel Charles <daniel.charles@intel.com>


>
>   drivers/gpu/drm/xe/xe_gt_debugfs.c    | 26 ++++++++
>   drivers/gpu/drm/xe/xe_hw_engine.c     |  3 +
>   drivers/gpu/drm/xe/xe_lrc.c           | 96 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_lrc.h           |  4 ++
>   drivers/gpu/drm/xe/xe_reg_sr.c        | 71 +++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_reg_sr.h        |  7 ++
>   drivers/gpu/drm/xe/xe_reg_whitelist.c |  3 +
>   drivers/gpu/drm/xe/xe_tuning.c        |  7 ++
>   drivers/gpu/drm/xe/xe_wa.c            |  6 ++
>   9 files changed, 221 insertions(+), 2 deletions(-)
>
