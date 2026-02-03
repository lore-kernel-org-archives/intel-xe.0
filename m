Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E0AE73165
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 01:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2153D10E4A7;
	Tue,  3 Feb 2026 01:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7bq4Aa8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC7D10E4A7
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 01:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770082665; x=1801618665;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YIGE/3E9uHb3FJvM+tTf2lmy8hZWdPUvCwsUYQ7pJpo=;
 b=K7bq4Aa89QqRt1fsSvGZ6QxBwWlC6SgxVaFtZY7VMk/I91oNmaU7ldsG
 iZaUtwqNDXkPUAVHj/uLMtMqtGp/8sVrsT0Kjc/rsAfCysaxILWmn15l7
 fdnH13nfMtmCMWwVFf6DcQMuwOAJrEs9j9NN3Rxkz7c4ERoYvQcEQ/Yt+
 1x4kG8wztG4qY3i2/IPPVm3923RFycveuMsThqLFJhzIkkG9st3bSl7Jo
 DO8KvTXrbjfaQP/BiDs5gHRdYCF0TN+QxurvMyZwi1hwUMdRSR99EI39j
 m/xH+KZBYi/JnJhZjdLDNoXIyWlaq0JjS5dDNkqgpPTdCrD9TxK3j4Yw1 A==;
X-CSE-ConnectionGUID: Ro//D2U9Rq2xcKDPjMkSyg==
X-CSE-MsgGUID: sEkDQhXyREqxt4A9dkQhiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70971648"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="70971648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:37:44 -0800
X-CSE-ConnectionGUID: 2006L68CRuqUkxcxA6Uf1Q==
X-CSE-MsgGUID: w2Jbh6ocR8Sk4bVCPx/50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="214466677"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:37:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 17:37:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 17:37:42 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 17:37:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTNPUPu7P2rdCZiqHC2rH2qr6HchuNtNlmJgmoMrox7GGz86MJHFV3260MWApZSdJFQz1IaL+4eBeCJnmtFn5l9JUYRdzqkC4jwqy/JEcAavx3DdmTkjjovAwDru15yBmomYgOP32f/pxH97GN8R8H5Cbpj8cb+RooFbuPTA5TxHFHz996YyBdkBfp7eJTHWvElIq5XVHvK278ySV+fnLt6eFscQjcVsuS71RZEk5w9ZoizqNkEBUKrQRCtH3L70Hml0c/4Ww5CvPBCX3BOhZfc3zaz6nNFj8OrspQSbKGeXZLOfO7RfmskdaROOn90l8IMMOr8UinZJC8Q5C9yaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dRRMC/YqoSR2kvlKJvInkEUI5Ikhp8AqKYd+1pkP3w=;
 b=yuCxggXdfFWF0zmhXJkLWtyiQt4uaV2OexkrQt1Dg9rFOLjnXPHtJsgN64dTle3c0pPEMh8okE0WevwXbl+bMOXB4ANdOLH08KDHveji13lvXEok2ktXHWTcN9qyKIksoNR4Og1pUF3FG1Us6hkUzEMm1K615YDadJyGvJk3pMhK1CLvNoLQl6MeWIve6iuN0MsDvtBatlnl+5hALOXEKfBgacuBgRznaW/iAt7ylHvJDwhLq8uPjx9jXYE6nUtFSX/FdYXjsZtshZbnBr6u0hLS/GjZtWUvgZSiqR2EdWIQh+AgIKSvx665bMWPLd7y95UjuNfafMn5Z7R9FJZ4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM6PR11MB4627.namprd11.prod.outlook.com (2603:10b6:5:2a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Tue, 3 Feb
 2026 01:37:40 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 01:37:40 +0000
Message-ID: <6aefe580-a66f-425f-a61d-fe7113b5213a@intel.com>
Date: Mon, 2 Feb 2026 17:37:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Enable Wa_14025515070
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
 <20260130210120.2682085-6-julia.filipchuk@intel.com>
 <019f9fc5-5695-4b65-b39c-8de2ee278f9e@intel.com>
Content-Language: en-US
In-Reply-To: <019f9fc5-5695-4b65-b39c-8de2ee278f9e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:40::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM6PR11MB4627:EE_
X-MS-Office365-Filtering-Correlation-Id: d2415049-409d-4db4-7dc8-08de62c4d124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUplYXZKNjVKeDMrd0J3b1VLeVFSWi9pc25Kd2JPTzN6Q2QrYnk4SW11MnhV?=
 =?utf-8?B?MXBJVDhvT1YzZGhlT2NjUXYzQ0tJcCtKVlhmNWxtSlFOVElya2xac1RGd1Zx?=
 =?utf-8?B?L0tHT3QwZ3RyWGhVRXZvL1VXR0FMcWVKZHp1SlpMVDk3V084a0l6KzUycnNI?=
 =?utf-8?B?ZENwdllaeHZEUlB3U1lqVlNNamg5T3d5UFZPeGdZWFFSNUZiMWIyT1VXRGYx?=
 =?utf-8?B?OVc0anNsTGhWVlQ2emo2ZWlBOWRaVHVkNVBXS0RjRlgxWGJ4U1Y3ZGNPTWg2?=
 =?utf-8?B?NjRuNnN1Z0dDeE44c2RreG5sM1JUS3VKa2ZUTVVkK25RenUrNmlpKzltU2Rx?=
 =?utf-8?B?YVNyWW1JRUQrNnNOelRXc0N5L2VvaE1FMlFHQmhIV08vWnl6Nm8yakRLcGsv?=
 =?utf-8?B?WXFpajg0Tjh4bks5TzRGdjljT2d0b1ByR1NxS3huS2VSSk5meGlmLzhDdG1D?=
 =?utf-8?B?QlhXNjRwTGtSRml4dVJLWUYyY3A5ak96R0lyNTBuNVZrbStsbEFIOTJBZVVn?=
 =?utf-8?B?UHlUZjcyUlhSSEh2U0s1SnAwZis1VXNwelprVEd5TTV4RTdkK1A0R05HTHhT?=
 =?utf-8?B?YjlaWTgvb3NPVGwrVVJLVVArWnpCNXNmaGgyQlV0RHFqZmZobXR4SVIwazFy?=
 =?utf-8?B?MDg4ZmV4NUgzZFJ5UklhRjN2RFJ5aFMxQ3hzeFZSa3dEOC9iSkFoUnhWaU5V?=
 =?utf-8?B?UEQzcm9XcmdIa0p1OHJ0SU5tR01aTVFJUSszcEUySW9mTVAvVlVMaGhpZW1Z?=
 =?utf-8?B?Snptck8wdm96ZjZUeHhXejUvVHNWR0VwOFM0ZkJNdWtJTGY2MjNySmlGTDhp?=
 =?utf-8?B?VFFpeUNPeVZFODA1TEpVUHpvNVE5dnhDQUk3NnJSRXN1T0R1OVZiclhTeFJB?=
 =?utf-8?B?N0l1c3gvVlFwcUQzSnhpRFg0THowRGNuZ2RZc3RDTjdnYlJXbUxNbUxEZ000?=
 =?utf-8?B?RTRWNlF6ajloSlZ5SmZqR2ROZkhlc0dpbUlianVLYWdOM1JhRmZ3bUFMK05o?=
 =?utf-8?B?YXVCZm5tOHZNRExOWlRielpvQkhoSGJWSGk0bzBYZ2JLTFpRUGtWM2ZPSU4x?=
 =?utf-8?B?YlBsc1pHRGx2ZmVvc1MyU2xYRmUyOGNkVjQwYjR4cGQ2SDc1US8wamxha0cy?=
 =?utf-8?B?S0xsSXZ1S2dYbEFaTVJ3NVd1MlEzcjV2amhGaUdOYVRPbThVWDMyS3RWbTgv?=
 =?utf-8?B?R1gvck1hSG5ieENnRk9Hb3pDcklPSXF6bHVvWnlGMERSZUlXL3JLbVBFMHIw?=
 =?utf-8?B?U1h5R0I1cUN4cjZYczA3S3R3YzF3YVNVeE1rQ0wvd29oYVhEZGNueDNYQnZG?=
 =?utf-8?B?TWxVTDFtQ1g1TnNwdTBrcDEyc1VDc0lKSFN1U2lWZm5tbm9PaDZEOU4vV0xC?=
 =?utf-8?B?ZGtlZUwzNndXNVhkQ0xXYlZzT0lBb2NOa1NOR2tHUnNwWDlTS3lIQ3RNYmpR?=
 =?utf-8?B?ZDFGZVBvd3IvbEtaVXRXNVlReTJtZ2R6Ky9pcU9ISU81dE1CMDI2dEV5VWlO?=
 =?utf-8?B?bVgvVFlhaEEvOFYzalg5MW9rUHBVTFN5VkxETjVuclgrZUtiR2N2Zk12ekg4?=
 =?utf-8?B?ejNQNzUrblI0NjA3MWQyRStTbC9FUmE2L3Qwa2xLTEMwajFnZEx4WkRGN3ZI?=
 =?utf-8?B?V1Fmbnc1TWxBTGFWMDNQOFN2U2hIU2VpVmh6cE5mZVBmZU9xdHl3NHJpRlV5?=
 =?utf-8?B?K2ZqMy9TMHhhVWY4ay9nOGJ6UkhNeERGVC9BMWI1dnYydjQzVGhKRHZnWlpk?=
 =?utf-8?B?dHFoZFIwWmxJSHBoRFpFbm9iOXFHYVlscHVOaGNHc3YvaTh5S2NlYmZqNE5o?=
 =?utf-8?B?RjA2c3hHMnVkZVZVNEp1cEZRL0s2d0VwUFFiSkw4c0FwQjFHVGV2dGtoeDg3?=
 =?utf-8?B?akFvR0F0QW5OSjVaUTNpZmFTN3V0cWhheEVlVk0rZlBmUVBGZ3lPVGFtby9Q?=
 =?utf-8?B?dW9EKzFtYm02T21RWnA2Sk1IRkUxMEhYUnBkWEdiR280ZHNXZ0NLYlArNTdY?=
 =?utf-8?B?aTdWaHdNNkdjbFVYMHcwb2RSeWVxckdpUDVBNUZmVVJaZjF2TWVIYzQ3YXI5?=
 =?utf-8?B?d09uN0txN09PL04wMm5JOEFCZHBHUmlKVEJoL2l1bE9Qekl4dFJzaEd2UTYy?=
 =?utf-8?Q?9glc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1c1a01BdUVUY3RKeXRzTWVySTRYTGJlMjA4OHh5RWV4L3JxTlB5VytDWlpZ?=
 =?utf-8?B?dVF6ZXlYeFhud0JOTms5RXRYanhBNElHOFcrS0t6VE5LZnBYRmxFd1N6SVJI?=
 =?utf-8?B?S2tDNjlOV3VTcEJPRk9Fank3S0I1TjdGLzZ4MjIycWtLeHo1ck93eHBKQU5I?=
 =?utf-8?B?ZDg4RkVwM0VhSGRJV0ZDaDZZOEhxeDhWcmQwQlY1S3JjTUhUeTVkYm9SK3dO?=
 =?utf-8?B?T2RKak1Ua01tSk5oaW9uaU5aUTVIcWxSYWRqSGFLQmFGczNNQ0kxVDAxK3BI?=
 =?utf-8?B?MkJZaSttbDVoK1JQS1IxZE0rOWhsM3NoejVBaWdvZGptWC9WdjFQWTBSRjZM?=
 =?utf-8?B?elIzQ3JrM1pid1BkdHN1bW5QTmlXam9jdnpYMTJ2Ri9NTzFvYWVOQXVvMlFI?=
 =?utf-8?B?Q09lQk14MmZzek5teW1tZnJ2eDRkV1lzTWQ1dVN5SGU3ZFdzWVJYOUhEanl4?=
 =?utf-8?B?K3F1N1ZMa0dieGhZL2w4TjNkRW5xWHdhS2JmNFBTNEt2UFN5OGxmODExenJ1?=
 =?utf-8?B?Wk5sSkZCdkRpa2t2R2dDN2xJbDd4a1lHVWNGa25DYVJ3aEVUa3JOc05rbG16?=
 =?utf-8?B?M05ITXRseHo0T1lRV05VcWU1NkJ3UExYaGU1aVdld2w0NUlGYXFhWkhYOVdU?=
 =?utf-8?B?d1JCakp5ZC9ReXRBVTlpdjRCWUxuWXcyakNtQnYyVGtGM1JoSWczWno5NVl3?=
 =?utf-8?B?RnliZFUrZWJBZnQvcFRtQmNpS2Z5bTdzWEwxazBzN0svUnBSWEpQRkV2WVNM?=
 =?utf-8?B?OWJRN1FpUDBUbVhwWW9YQzVxZkxqYUkrZnBuKy96WnErVU94YWYvTGZmbTh5?=
 =?utf-8?B?NkpNZW4rVWxCWktsdTZ2aTR3ZmR2RUgyNnA5dlNwSUxRbSt3RmdrTmJEZ1l1?=
 =?utf-8?B?VXVLaHNSQ3VyelpaOUVZM0NHS2NCTGhvVS82dEJZMUc1WGxDWFZ3Zlh6SlVQ?=
 =?utf-8?B?SVJKeEdQNEk4Q2NlTDdkR1JtcEdCR3VqNnRGaWVsUGZENjBqK3c1Y0srVm9y?=
 =?utf-8?B?bjY3dTNuanF1V3d5V0JRc2ZkZU1yK3ZGR2R1MVJZRyttMC96SkNhMXNrMFNS?=
 =?utf-8?B?NFhwZnJ0emFuK3NIei8vTmRWK1BMSWM4RWEwVDZCTDdpYytSVGozOWhSTy9I?=
 =?utf-8?B?Z0xBeCtzZnBXREQ5bzd4V04yMHk1LzkxZ1VFSXE5cFRJM0tSMkFxRTBnZVZO?=
 =?utf-8?B?SE5LYng5eXZMSURMY3lxcjc5Ny9pQ2JXWlBpTmphTGptWENacThtOW5aM3V3?=
 =?utf-8?B?UmQwZUp2YThzMHJTRENSSGY1QVkvbHlBQjUzek53S3c1WVVLSko0dEpaL1cv?=
 =?utf-8?B?U1lNSktZVkJoWUd0UkdrSlF4STRFVHU5KytiOFhQaGVqcVpXTzdHVVBNNDJy?=
 =?utf-8?B?ZFZxL3RLWGxKTU5DTUJsMzdKVHREYjlkQ3NsVWNBLzVYNS9JUXBOUG0xb3Vt?=
 =?utf-8?B?cHdzbzRWU3drVHZySGdMVExHem16SGdWSCtWNWkvb29SMWFEeTZCa3NSUzVU?=
 =?utf-8?B?VjJIeTNGNlEvRjdsVk9uTnQ2d2dxWnRGWndMOTdRZEQ5em0zeTVUL3lsaFZR?=
 =?utf-8?B?MnNIdmZndEJ5UHJicHp1NWZoVkFZUjJJZ1Azb0VXcGtiT00xTWNmQVZNcHVa?=
 =?utf-8?B?RXE0WkdSeXZlQmtuKzJybEVWNjg5UXdHWlhKVjhYdGhmbE8rQkRvSDhyUjkv?=
 =?utf-8?B?Y2QxN3lDRi9PZXV5cERQZnpnSHByTDN3cEFsOUh0QUFFajVtK3o0YUxuR1Jv?=
 =?utf-8?B?UldHdUZXSXNudHJvVVc3WEtiNDZYQ1ZSNU1KejEyTkhuR2w2azNZRUlaanJL?=
 =?utf-8?B?UEhwY1V4RmZNQlI5aUU2TUN2U3B0bUxPNUZNVUNSMm5mVkpGTVZXQXQzL2NG?=
 =?utf-8?B?T3RMV09kblhqdFFNb1BKNlA5M2Z2RW1mUVhrSzhPMlc0aDk1REY0TU9QWVRw?=
 =?utf-8?B?US9Mc1FhcnV3S3Nad05wY2FuUE9rQTdGMDZYZUVqVXdhbURJbE9keHlXSm1B?=
 =?utf-8?B?QzRQYk5rOFpvWlBpYnhrSWIrc2pML1dETVFOVEh4Q3Fac0J5cjVrNjk5Nmp3?=
 =?utf-8?B?VVBBTFVCcjhTOFNzblZ2UDNsek84OVVweittRmtTejRVbDYrbyt2ditiSlpR?=
 =?utf-8?B?S1dBL0h5UEFHOG1DWDQ4S3V3Z1dNcHNpODBlOWg0M3dibDlYc0JYd04vcjhz?=
 =?utf-8?B?UzFSNmFFR3RaMUNuZENCaDdJclZGZ2tSQ1Y2TmRMMG1PMXRlTVZBZW5IVkpY?=
 =?utf-8?B?RUtvc2xPZ1ZtYVhmTDRlWlZEbTlpK3dXWGorVzAwSWZINjlndlZkaW0xYm92?=
 =?utf-8?B?SUJmdFFicjlOTjIrbUU2YUkxVGJSSWhBenhtaCtSSGxPcThIQ0UrU0FXL0dD?=
 =?utf-8?Q?7NbAmCouEaDlhF+8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2415049-409d-4db4-7dc8-08de62c4d124
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:37:39.8890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpDYCz5X+IgXeoiU5FABQtSCBD1UVd7nR63vN3TUkfsyYr8BqihPctQx2lXR5PBMym8bSpr3yZfKKAsAEHXyhs5hs2lbnsWo/NsGM/VLBgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4627
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



On 2/2/2026 5:02 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 1/30/2026 12:50 PM, Julia Filipchuk wrote:
>> Corrects a failure on context switch. On registration of context with
>> indirect ring state will correct state of targeted and idle command
>> streamers.
>>
>> If Wa is unavailable, notify and disable indirect_ring_state.
>>
>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  5 +++++
>>   3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index e33bd622ab44..69e6d9f9650c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
>> GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO = 0x900a,
>> GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH                    = 0x900b,
>> GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG = 0x900c,
>> + 
>> GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION 
>> = 0x900e,
>
> Maybe we could try to make this define a bit shorter? something like:
> GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG
>
>>   };
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index f4cbc030f4c8..1c563a01c12c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -360,6 +360,16 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>       if (XE_GT_WA(gt, 14020001231))
>>           guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>> GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
>> +    if (XE_GT_WA(gt, 14025515070)) {
>> +        if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
>> +            guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>> + 
>> GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION);
>> +        else {
>> +            /* Disable indirect_ring_state when workaround not 
>> available. */
>> +            gt->info.has_indirect_ring_state = 0;
>> +            xe_gt_notice(gt, "indirect ring state requires 
>> workaround present in GuC firmware v70.53.+\n");
>
> With v70.53.+ I can't understand if you mean "70.53 or newer" or 
> "70.53.*" (although both mean the same thing). Maybe just v70.53+ 
> would be clearer?
> Also, shortening some of the words should make this fit within the 100 
> char limit, e.g. "indirect ring state requires a WA present in GuC 
> v70.53+"
>
>> +        }
>> +    }
>>         size = guc_ads_waklv_size(ads) - remain;
>>       if (!size)
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 5cd7fa6d2a5c..1da3a8f96f98 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -69,6 +69,11 @@
>>           MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
>>   16023683509    MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>>           MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), 
>> FUNC(xe_rtp_match_psmi_enabled)
>> +14025515070    GRAPHICS_VERSION(2004)
>> +        MEDIA_VERSION_RANGE(1301, 3000)
>
> We usually avoid using big ranges that cover multiple gens, because a 
> new derivative might be added for an older gen that doesn't require 
> the WA.

To clarify, this isn't a blocker, since we do have exceptions. As long 
as you've confirmed we don't expect this to change for derivatives we're 
good.

Daniele

>
>> +        MEDIA_VERSION(3002)
>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>> +        GRAPHICS_VERSION(3003)
>
> According to the WA database this also applies to Graphics 3004, 3005 
> and 3511 and Media 3500 and 3503
>
> Daniele
>
>>     15015404425_disable PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>   16026007364    MEDIA_VERSION(3000)
>

