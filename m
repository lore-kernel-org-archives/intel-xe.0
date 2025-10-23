Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A5FCCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 18:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DBF10E08C;
	Thu, 23 Oct 2025 18:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYTuMiIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FF210E08C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761244016; x=1792780016;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hsR/32ZfIM35XEXZbrtw5D19ewfg1lpRC155l4tagOE=;
 b=lYTuMiIkhZWMG4OeXdPbYLr3XngM/ymgXZbOABf8+0mAK7LfzW0amAvF
 nDw+1YsuleIeZ6nd5PZeKHr2loBG5ZaiP/1Du1kdfmN/Son1abHTCrxB/
 EcmxTehX4iOsoWcYq8TmFUx9kR7vXEwB/6Ae8kIectKV7d5QLL4oW36Fl
 XKV+SnFVryLyTFQSG05wC3nz6XovwwUSmjSmjZh7EkYNErVBPKjS/ixoh
 bw80MTneHz6YfD1YONk/Q6szfdPMNBtpw27b5cFBjE5lSEpv8PGL/A2Pc
 WdHvkk/oMBImwT1/oLqofq6H2h1PeM4xG07wnozYkM9Z4EevkLdjzWgih w==;
X-CSE-ConnectionGUID: YmGgyB/mRrSnIM8dOfNC/w==
X-CSE-MsgGUID: 3Uy6iIOLQhmj07Iw+uEarA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63461364"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="63461364"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:26:55 -0700
X-CSE-ConnectionGUID: aThFYN8YRtGwdAWZN6B41w==
X-CSE-MsgGUID: Im6ccQ1DSy6h7LC3//1Agw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="189355681"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 11:26:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:26:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 11:26:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 11:26:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAIBAKf86pX/Fgd8b0o5P+iVTA0SyvbmZR3pc0FcqhcTUWCNnWhlvMajC+NdHYAKSoyiRktAUTqvexYn3KE4FXU7QBhYe1XPmIElxK9ctgyk+rh0mAYk3legD7q2JntssjEg3odAWVGY7DtWSWi+sIVzx3IBufdK7qCaVAGW1HK7Mmtvz8o40E9NmeHCzd9k+mylSyXRsnLlZ0fAaMUHATcWUgZZoO4c+ik3y3svLFAaXnmtBnbGuCAFLA8afh4/eGLPIelqtzXx1IzOy+L7FhDtoFoLeI3j6wdFbjBGkbeFTZdxgnlMudWQhy/H6qiYuTTVZOTgO7HiBYLruDjFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPN1pB15RDZT9rRpVeYoRBJnZATIkZuY+fBbI8YOiyM=;
 b=Z9eVmOnw4HkPG0W/EXb4dEcAQpZJT/ngHnHaJtS6kTp0FhzwhnulRcIoKVCW+swMB2AiyAS81pxNJs20OQoSlFuWEGbhTAnMdwjB8HHHJ1orxcHFAiJERx4hOBI6I4s7BoyH1ulC06/gFQ1iVH2YP2DwiBGo9LpLor/jT7yhtbqsLMoSvwrvwW46vuVl8fyjeDBfloOjRClAA1P83H+x8bvy2pJ9+djsnMSISGBJizJGpzzRAvoTc+1W/OWsoEdTDaitbnhO+xGy/aUTQ4YPAqepjoglUM0OPoaEcHJvQBMTri6+iAW8X+lG9KTBsDI4mSnWK15ST0ELB0YRlpURlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 18:26:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 18:26:50 +0000
Date: Thu, 23 Oct 2025 11:26:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dong, 
 Zhanjun" <zhanjun.dong@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 6/7] drm/xe: Clean up GuC software state after a wedge
Message-ID: <aPpzZ9Z7zNOEcWuw@lstrano-desk.jf.intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
 <20251020214529.354365-7-stuart.summers@intel.com>
 <aPlJihKuwV3A4cLP@lstrano-desk.jf.intel.com>
 <b0ddbf8914338d94bce2ba6c092f6c3fd0635c57.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0ddbf8914338d94bce2ba6c092f6c3fd0635c57.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:303:85::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a52366-ac65-488f-0751-08de1261bb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3lWMzFWUklLN2Era1Y4MFBVSHBKY1A0bjIwM0VlT0Q5cVFrQVAwbGRIVWRX?=
 =?utf-8?B?SjdoaFlYZHBIZ1RtRFgyY3JxSVJzOE5ZR3h2b2x2VXFVd3BTUysxYzE1ZXor?=
 =?utf-8?B?cXpoclpNSVF3RWRBVVRoV0FOSGR6M2pUL1pPVzJwNHVMd3JFZVJMSmJWZjls?=
 =?utf-8?B?WDlzd3p3OVlVTjh5TVdvWTlxT0J1UVI2WkZBSnU3L3BLZ0dpOUJ2aUZvaFQv?=
 =?utf-8?B?amNWOUxDdi9IcGFqZG1lY0ZkWDQ0WDZ5OGNtVVJicFNkOXR3azI1dVRzcnFE?=
 =?utf-8?B?Vm9zR1lNL3NsMEg3U0Y4Y0hSczBrVnpBNUtaa0ljNHNGSVpYb2pUWFdqTFRX?=
 =?utf-8?B?VlcxS3k0TGJzK1ZhRnFicFVqNERYZC9pN3JhczZPK3FxNFMvN3grd3I5WjQw?=
 =?utf-8?B?dUxSWEdFa1BHT2kzS3V0SU4vcy9xdzFZbFM2VVVkUy9KK2RlaVJpMG5aakQw?=
 =?utf-8?B?R0pyUWo3Z3FqNWp3UlFEVWtsR3d4QnpqVWoxTDY2WDNNbjlKVHpNZUdDQTZn?=
 =?utf-8?B?ZG5vVGZXQzNYRjIvSzZFNmdYemlFZ3IyckNhVHJPSkRsUmZMd0dxTUZhOUVn?=
 =?utf-8?B?bnB2V1pScGpMRW1IRk9xcER2dlRqQmNGdmlkdjlCcVc0UGhzOGlmRmdxNzhr?=
 =?utf-8?B?dEk3L3FlMTQvZk5pMlBQaGlWdFNhZTFyYTJCeHhOVDk5ZkJxbkRYdUxPWkhZ?=
 =?utf-8?B?eDNpMFRCbk5LZUJMSFdlNnI5Q25FbWJNUkNKZksvYjFqdjBTdXNMczFNMGVp?=
 =?utf-8?B?aWRjNDdRZllTOHVFU2hoUGdmYnpicVkrMjRaM3RxNlZUWElxeWxqM2Fzc0d3?=
 =?utf-8?B?bDd3VmJBM3Mya0htWjVGNXFEUXE1RW5tYWtlU0R6TGZmUVhyKy9NeGN1L2Nj?=
 =?utf-8?B?azgxU2NDdEJHOEpkMFdJUFpIeGRURFlRWDNFdGFmY0g1YlA3K1V5Mkx0eE1k?=
 =?utf-8?B?eldQTDNpdTBIbkxoWFRCbVVhNTlDQUg2SHdjZGNuQzFJQjB0cDJwdG1KbEE3?=
 =?utf-8?B?WEJzZXlNbDU2VlZCWmZrK2dieVVFU1FFZ1I1R28rTllwd3UvakFTV1NpUUpT?=
 =?utf-8?B?NGRUVkpmTnVQcUI3eTZwbzRvZGV1eDhPSTAxT2xvVGtBeE1HcER3R0czL0lQ?=
 =?utf-8?B?eGQ3V1BYQTdxSFg0Rm0wV2s5SlFMb2hkZFBPVlRaeWVLMTF1Q3gxR1dhQktz?=
 =?utf-8?B?ZzM1V2hxTlA2WkJJK0tUWHRWZXNEaFJrVzQxY0NTeGd6ZzBCWlBkdHVUTU9E?=
 =?utf-8?B?SnBEWWF5eWNTUWdSVFdVTFdPUDNUT0FHTWRYMkNtekxYUTBqamU4Znk4S0Zx?=
 =?utf-8?B?dVlpdjlpSUlnZVlIaGNmNm83V0NJYXpaRk9nVEV3OFlnRk9zaGRxbWEwS3BS?=
 =?utf-8?B?NEFPNFJvaE9mNkEwTXN5anFubkhnbHY4ejU1UHZDRjFwVmovcDc3VGtYbXZW?=
 =?utf-8?B?TlV2T1ZGTVJxc3p0ZFFRQURpd09yckp0ZXluSk10dkVaVXIySWZQdm5HSzJM?=
 =?utf-8?B?Rk1ibU12bUhhYjBRN3RSR1hnMkU3TFJQUUJBZVdKcG85dnVST3dDcDFPQk9U?=
 =?utf-8?B?b3FmNENncllpU1JTTWZDQmp2K1ZzOTJvbUtVWDMzcVJEb0x0YXNWWlpiMkk3?=
 =?utf-8?B?Y0xVOW1QeHJiNGh2U2pQMzBTNzBZWjBTMHN6YlRsMyt2OGZrRGtpMGhuVzFk?=
 =?utf-8?B?NXhURjlTUnd2eTc0NXRMSmJzUmY4YzVTbThPTjJGeUxzZE5OTGhRS1Y1cnlz?=
 =?utf-8?B?dG03Q3ZWVi9QQTBJTXNGa1ZXWk8zOUFoSUNDTDIrMlh6Z1dmL3J2djV0bmh3?=
 =?utf-8?B?RmVtL2FnSnpCWW1DdTU5NXFjZS9kSFZzcFFvWWloa1R2VWFtcXRWUXVBU1Vk?=
 =?utf-8?B?OWxqWUJqeEd6ZzhCc2dWUXJmT3JxNzQ3TU1CajBqUDR4T1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlJjeW1jM3VlN1BCVmdhbStoSnFqN1hjMXJVaUZYeUNkM3Vwd0RZVGdmYkF5?=
 =?utf-8?B?b1hmTWJwQWRtTWJEUCtmQzhPYSs2cHdTRGlyMGZoc01DUVRiNjRzSTZtRE8r?=
 =?utf-8?B?eHJ1bEFuSC90b0JuSGQyaEFROEFNUG0vWmtHSDFGMnhOTFZsRVI1eVUrZ21X?=
 =?utf-8?B?alMrcHdrdDJHeHBjYkNBby9ROEVRZ2N2czN3azJrblJVUHZhbk9tdzNUYVVZ?=
 =?utf-8?B?UjFpTGtoeVRzSU1iVUY2UFV6YzBNSEhUUEwxRDUyb0oxc1BPOCtVdE4vT005?=
 =?utf-8?B?M012cTBPSU1tQnd5Qjd3L1dab0tkRUFzTlBEMkFuSldqNVpPODVYM0Exc1JM?=
 =?utf-8?B?b1lmZUwveDRZVzhpM3hraUVvdU83T1BVY1l0dVhiSnl6OFFmZmJjdUdobS9z?=
 =?utf-8?B?UGRHTU0wTHdyTUZoRTFLd2ZURlh0VEJndFF3d29ua3F5Y2JJMFUvamtxUGJv?=
 =?utf-8?B?dFUzbmdXYlJQLzFNekFlbnM5ZjJnN3U0T0lSTjkwVkNBRU1ySmgrRTkyUmhS?=
 =?utf-8?B?YWtDbkJ5ZkhuZXpiaGJ5Uzk3R3hhVWRtS0lZSWJZMmltaDRCVk4xRGxydFYw?=
 =?utf-8?B?aHlkS1YzYitKSW9zMDVjMUJvVnh3dDhFMkFGbjNjaHp5MDlJcmYxMzRySTBJ?=
 =?utf-8?B?VStsRXlrOTc1b09SbjA3Z2ZuaTk2bHBGVzlsclRsL212VjNsQkU5dUcyWUdo?=
 =?utf-8?B?NzFYaFRFWnpjeFV3c0VRMEVpampSU2lHeHJZQ1RidWd5M2RKS1FvZmwzOVJt?=
 =?utf-8?B?eTIxajNGSkJMZ25qanZsaHgyT29iaWFkNUx1MlB5R1Z0OWNxaEpNSnVYdUJs?=
 =?utf-8?B?WTNkMGlmUEhETUp1VVJ3TWpnbUhzMmVOcVRydk1RRWpWYlJuSU01ckZZM1pH?=
 =?utf-8?B?OCtoZnBmS1hJbGhYUnZiN0V4OUhGblc1czFWK0Z1akJzM2dmQnhkdUZPK01U?=
 =?utf-8?B?V0FEYWVraC9vc3Y0cHlpMzROV3d2OVZ0NXV4NUY4cWpyM2pnUERuQ24rSFU5?=
 =?utf-8?B?Z2FrYlpEOWgxSTR0V2NRSFhxOWFIZUtjTiszQkVQYVJGT1UxV1JWQkFnQzBs?=
 =?utf-8?B?SllBaEJpV1JseURSbkVqL0pRaEdUVVprVW5tSGxmVUtGZTZVWHkydmdvcEFl?=
 =?utf-8?B?ZllldE1WZDF3N2xHcXNNelpMdkF4Nmg4YU9nRVR1ZVlsUzdzaHBzaUZ5bklh?=
 =?utf-8?B?UUFwTlVQZDlOLzNWQUdPWGVIRXJIVDhOV2duR0lESEp3K1RwVVdmZWtOVEx5?=
 =?utf-8?B?NnFoa2lBNlMxZlRwUU55VVdHR0d6V2xCZ3ZLenR3UlpwajFGQmdQdTJuQ1JJ?=
 =?utf-8?B?Zk1hZ3g1cWRFRmx3MmJjMi9PVGVxZ0gxVEFXbVQyeFNSNllGUXdyMS9zQXF5?=
 =?utf-8?B?ZjJxNUxoY3lwL3h4c29BZXRTWWduaStmR0FwRnlTY0dPWXhLcithZGRRNmtx?=
 =?utf-8?B?cURoRXhzL0Via1UwUUhCU0JwYWlQMGJQaFQ0YWc3ZUFjUG9sNHB3R25ycjF6?=
 =?utf-8?B?dExlQ05xK3U3WkorWHIxZ2dSQnBRdGgybWVwYkhzc3QvbEYzMkRFa0Rxb2hJ?=
 =?utf-8?B?QVFqeDB2MWduaTYydU9RTTBZODJBVTJpWTRSTUt2a3M5bklDeGUycFpFTGxO?=
 =?utf-8?B?Y2F2TWl3UmQ5MVpUN2JtSWcweUdmUk1nNnAzbDNxSm5NQUtoL2tvVmxHREFj?=
 =?utf-8?B?Vzg0d0pTQkR6SnhReTBzUE1DdW9JWVowNGgwazB0Nmpya0JhL0JuU1N4cS9s?=
 =?utf-8?B?TVBsU0tORjlDZW9jdWFIOVNPTFpKdmYySnM5LytJTFhGOWdKUHJsMklTVitB?=
 =?utf-8?B?aUhsV3NwNnlDVnBSbWZ1a0Fwa3BpdElzQ2pId3FBOWI5T01jbTlVL3V3cDdt?=
 =?utf-8?B?UDdMcXZqdkhMNHo3MGhFMHh2S0E5UGJBR3g3bDkwbWhYWG1HY0Q1VEcwUzRG?=
 =?utf-8?B?ZUhLSTFXcDAwQXV2N3huTXlVQmpkdjc2bzlTa2h6cmtHeEZiS3RKMEJkdnNT?=
 =?utf-8?B?Znl4bXdYVVRvbTNUM3NsZWJTQXE0NWY4eTFseUJIMzF0aExTS3Vrdkp1Z1VP?=
 =?utf-8?B?d2NNY3JNeDhxRVdjbUFycW4xZFVDU05DRnBWOEN6RmdGT3YvK0hucmRITUw3?=
 =?utf-8?B?dm0vWUhkK3RkWWtYRmE3ZFhWcU5JZGpTNVVwWkxXV0EwNnVscWJKa2hJM2dm?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a52366-ac65-488f-0751-08de1261bb58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 18:26:49.9425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jn+Eu6cHsWdjnVj2mfS8eZpTOeoJxTC/s6LF6tNn5LU0e4LxzyEg0/gJKpv4OLpZ4ymAb3XDX04uh1j/LqxZRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
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

On Thu, Oct 23, 2025 at 11:43:34AM -0600, Summers, Stuart wrote:
> On Wed, 2025-10-22 at 14:15 -0700, Matthew Brost wrote:
> > On Mon, Oct 20, 2025 at 09:45:28PM +0000, Stuart Summers wrote:
> > > When the driver is wedged during a hardware failure, there
> > > is a chance the queue kill coming from those events can
> > > race with either the scheduler teardown or the queue
> > > deregistration with GuC. Basically the following two
> > > scenarios can occur (from event trace):
> > > 
> > > Scheduler start missing:
> > >   xe_exec_queue_create
> > 
> > The queues should be initialized in a started state unless a GT reset
> > or
> > VF migration is in progress. In both cases, upon successful
> > completion,
> > all queues will be restarted.
> > 
> > I did spot a bug in GT resets — if those fail, we don’t properly
> > restart
> > the queues. That should be fixed.
> > 
> > Also, I think xe_guc_declare_wedged is incorrect now that I’m looking
> > at
> > it.
> > 
> > It probably should be:
> > 
> > void xe_guc_declare_wedged(struct xe_guc *guc)
> > {
> >         xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
> > 
> >         xe_guc_ct_stop(&guc->ct);
> >         xe_guc_submit_wedge(guc);
> >         xe_guc_sanitize(guc);
> > }
> 
> It's a good point, but to be clear, I'm not doing a GT reset here.
> Actually in the case I'm testing, there is an explicit PCIe FLR and
> then I'm explicitly wedging after and making sure the unbind completes
> error-free. Not something I'm necessarily planning on driving into the
> tree here, but doing this for some internal testing.
> 
> But yeah I'll give this a try with a GT reset in the mix to make sure
> that cleans up the way you're suggesting. And thanks for that wedge
> revision, I'll give that a try too.
> 
> > 
> > >   xe_exec_queue_kill
> > >   xe_guc_exec_queue_kill
> > >   xe_exec_queue_destroy
> > > 
> > > GuC CT response missing:
> > >   xe_exec_queue_create
> > >   xe_exec_queue_register
> > >   xe_exec_queue_scheduling_enable
> > >   xe_exec_queue_scheduling_done
> > >   xe_exec_queue_kill
> > >   xe_guc_exec_queue_kill
> > >   xe_exec_queue_close
> > >   xe_exec_queue_destroy
> > >   xe_exec_queue_cleanup_entity
> > >   xe_exec_queue_scheduling_disable
> > 
> > The ref count should be zero here — xe_exec_queue_scheduling_disable
> 
> I did confirm that it is (at least per the get_unless_zero() call
> below).
> 
> > is
> > called after this series [1]. I think we need to get this series in
> 
> Let me pull in that series. I'm still going through it on my side...
> thanks for the link!
> 
> > before making changes to the GuC submission state machine.
> > Technically,
> > all we need are the last three patches from that series, as they
> > simplify some things. I believe an upcoming Xe3 feature would also
> > benefit from getting these patches in too.
> > 
> > So that means in xe_guc_submit_wedge() the below if statement is
> > going
> > to fail.
> > 
> > 1006         mutex_lock(&guc->submission_state.lock);
> > 1007         xa_for_each(&guc->submission_state.exec_queue_lookup,
> > index, q)
> > 1008                 if (xe_exec_queue_get_unless_zero(q))
> > 1009                         set_exec_queue_wedged(q);
> > 1010         mutex_unlock(&guc->submission_state.lock);
> > 
> > I think we need...
> > 
> > else if (exec_queue_register(q)) 
> >         __guc_exec_queue_destroy(guc, q);
> 
> Right.. I remember you mentioning that also in a prior rev... let me
> confirm here. When I was testing, this wasn't working in all cases, but
> I'll double check and get back.
> 
> Also this was the point of the pending_disable here. We do explicitly
> set that in this flow whereas registered has a bunch of entry points
> and I was trying to isolate to the case of GuC dying mid-CT send. It
> seems to me if we have registered but not pending_disable, we have a
> bug in the sequence somewhere rather than an outside error injection
> (like GuC dying).
>

Part of my changes will tie the deregistration process directly to the
refcount — i.e., we deregister the process when the refcount reaches
zero. Previously, it was possible to deregister during TDRs, but that’s
no longer the case.

So, if we reach this point and the exec queue is present in the lookup
array with a refcount of zero, then either:

- The G2H for deregistration was lost as part of wedging, or
- The final worker for destruction is queued or currently running.

The exec_queue_registered flag will tell us whether the G2H was
processed, as we clear this bit upon receiving the G2H.

> > 
> > We also need to cleanup suspend fences too as those could be lost
> > under
> > the right race condition.
> > 
> > So prior to existing if statement, we also need:
> > 
> > if (q->guc->suspend_pending)
> >         suspend_fence_signal(q);
> 
> Ok
> 
> > 
> > [1] https://patchwork.freedesktop.org/series/155315/
> > 
> > > 
> > > The above traces depend also on inclusion of [1].
> > > 
> > > In the first scenario, the queue is created, but killed
> > > prior to completing the message cleanup. In the second,
> > > we go through a full registration before killing. The
> > > CT communication happens in that last call to
> > > xe_exec_queue_scheduling_disable.
> > > 
> > > We expect to then get a call to xe_guc_exec_queue_destroy
> > > in both cases if the aforementioned scheduler/GuC CT communication
> > > had happened, which we are missing here, hence missing any
> > > LRC/BO cleanup in the exec queues in question.
> > > 
> > > Since this sequence seems specific to the wedge case
> > > as described above, add a targeted scheduler start
> > > and guc deregistration handler to the wedged_fini()
> > > routine.
> > > 
> > > Without this change, if we inject wedges in the above scenarios
> > > we can expect the following when the DRM memory tracking is
> > > enabled (see CONFIG_DRM_DEBUG_MM):
> > > [  129.600285] [drm:drm_mm_takedown] *ERROR* node [00647000 +
> > > 00008000]: inserted at
> > >                 drm_mm_insert_node_in_range+0x2ec/0x4b0
> > >                 __xe_ggtt_insert_bo_at+0x10f/0x360 [xe]
> > >                 __xe_bo_create_locked+0x184/0x520 [xe]
> > >                 xe_bo_create_pin_map_at_aligned+0x3b/0x180 [xe]
> > >                 xe_bo_create_pin_map+0x13/0x20 [xe]
> > >                 xe_lrc_create+0x139/0x18e0 [xe]
> > >                 xe_exec_queue_create+0x22f/0x3e0 [xe]
> > >                 xe_exec_queue_create_ioctl+0x4e9/0xbf0 [xe]
> > >                 drm_ioctl_kernel+0x9f/0xf0
> > >                 drm_ioctl+0x20f/0x440
> > >                 xe_drm_ioctl+0x121/0x150 [xe]
> > >                 __x64_sys_ioctl+0x8c/0xe0
> > >                 do_syscall_64+0x4c/0x1d0
> > >                 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > [  129.601966] [drm:drm_mm_takedown] *ERROR* node [0064f000 +
> > > 00008000]: inserted at
> > >                 drm_mm_insert_node_in_range+0x2ec/0x4b0
> > >                 __xe_ggtt_insert_bo_at+0x10f/0x360 [xe]
> > >                 __xe_bo_create_locked+0x184/0x520 [xe]
> > >                 xe_bo_create_pin_map_at_aligned+0x3b/0x180 [xe]
> > >                 xe_bo_create_pin_map+0x13/0x20 [xe]
> > >                 xe_lrc_create+0x139/0x18e0 [xe]
> > >                 xe_exec_queue_create+0x22f/0x3e0 [xe]
> > >                 xe_exec_queue_create_bind+0x7f/0xd0 [xe]
> > >                 xe_vm_create+0x4aa/0x8b0 [xe]
> > >                 xe_vm_create_ioctl+0x17b/0x420 [xe]
> > >                 drm_ioctl_kernel+0x9f/0xf0
> > >                 drm_ioctl+0x20f/0x440
> > >                 xe_drm_ioctl+0x121/0x150 [xe]
> > >                 __x64_sys_ioctl+0x8c/0xe0
> > >                 do_syscall_64+0x4c/0x1d0
> > >                 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > 
> > > [1]
> > > https://patchwork.freedesktop.org/patch/680852/?series=155352&rev=4
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 5ec1e4a83d68..a11ae4e70809 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -287,6 +287,8 @@ static void guc_submit_fini(struct drm_device
> > > *drm, void *arg)
> > >         xa_destroy(&guc->submission_state.exec_queue_lookup);
> > >  }
> > >  
> > > +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct
> > > xe_exec_queue *q);
> > > +
> > >  static void guc_submit_wedged_fini(void *arg)
> > >  {
> > >         struct xe_guc *guc = arg;
> > > @@ -299,6 +301,16 @@ static void guc_submit_wedged_fini(void *arg)
> > >                         mutex_unlock(&guc->submission_state.lock);
> > >                         xe_exec_queue_put(q);
> > >                         mutex_lock(&guc->submission_state.lock);
> > 
> > With everything above I don't think this new code below is needed.
> > 
> > But to make sure we know what we are doing, how about this from [2]
> > before the xe_exec_queue_put.
> > 
> > xe_gt_assert(..., !drm_sched_is_stopped(sched));
> 
> Yeah I agree this seems like a good idea. It also follows what we're
> doing in the other state changes.
> 
> > 
> > Wanna try out these suggestions? It is always possible I made a
> > mistake
> > here.
> 
> Really appreciate the feedback Matt. Yeah I'll take a look and get back
> if it still doesn't work here.
> 

Yea, the state machine is little hard to wrap your head around. Happy to
help.

Matt

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > [2]
> > https://patchwork.freedesktop.org/patch/681606/?series=155315&rev=3
> > 
> > > +               } else {
> > > +                       /*
> > > +                        * Make sure queues which were killed as
> > > part of a
> > > +                        * wedge are cleaned up properly. Clean up
> > > any
> > > +                        * dangling scheduler tasks and pending
> > > exec queue
> > > +                        * deregistration.
> > > +                        */
> > > +                       xe_sched_submission_start(&q->guc->sched);
> > > +                       if (exec_queue_pending_disable(q))
> > > +                               __guc_exec_queue_destroy(guc, q);
> > >                 }
> > >         }
> > >         mutex_unlock(&guc->submission_state.lock);
> > > -- 
> > > 2.34.1
> > > 
> 
