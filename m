Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F32D0C608
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 13:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8A510E1B9;
	Fri, 25 Oct 2024 13:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhO1EYCd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8535F10E1B9
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729862428; x=1761398428;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SIxF5xMftpSQmLX9TVFJuUUgfwFOS6cuKoVcE7dqZgE=;
 b=dhO1EYCds8CKMkepsol8gSw9G/XtbC3VszY1XBh7I27ycPei+vDHnaCb
 EOABC3GlqDRI87Y3lpdlRkTDCQ6w5c2m6zJXyMGRQD7vBcs/9KuHf+Wga
 xWVTM+/ffF7gLtoJLEG7K5WqJN+cAVt6rKBU3QfKXZqV48evh+Mps7znD
 98YNzSsDohYGfHBN7t8JU+LdT/6RvgEawkB/KmTaSsphDJ5WH/mtsyp+j
 tYZCzYgYvZhpbs5Ug++8U2z2Iu7wXyEwwgYiuBI8q5LH29jiNvb0hWpXW
 5gQtSVz4FvzKfROaINkxyqm/KIFXEWZKLbcByXabsAE9ALqEcRgVGAfQA g==;
X-CSE-ConnectionGUID: 6aQRjsOcTd6E+BtO1WAzQA==
X-CSE-MsgGUID: U//1JL12TBukbgBbz0X46A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40084116"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40084116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 06:20:27 -0700
X-CSE-ConnectionGUID: xDTuGbFRSDiDJpIR3r76IA==
X-CSE-MsgGUID: I32NP9MkRLmtw+CdnZd0qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="85490723"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 06:20:26 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 06:20:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 06:20:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 06:20:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V86wspFGl/hgXalf1Zllb+TJNBTX7iIoGjAkjse7tArpDhrSaADYiogW9XuIAD9Uk9jcYw8ZSVdHN87JjLpaSFhOiHeITBs+pswqydNHj/86TPr0e6WfeN6CpEw0eJsazlFZ3vg0oxtA8qNluF0nOOipYddraE8VJg3iiDofQaddsnlq1Po+GMH9Qb9u148IsVMqPiEUDekQQDwvcwYE1RqJAcfA+QF0TlQNDtlebRbt+g6SSmM2ejMl2kK45hzR5IgoTUt0TlpRPkoFVIxH26uyXpeC2rbRdJgtSfRKnR+gzid13I63ib1Cl6K/Ket04pZHUYBXn+OV9dbtSJzz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GIZN8/FB8MD8489UDmu3ynAdHqw2aGxrXfjTBDXO14=;
 b=VENBbMZ81CtWtlBPNSTjwWR+QUVZv2pZnovIKT2YVAgxcRF1Ol4Z1q0f5TaV1f61qaPf3pG4c0ha5utsAqbPd7Yoro4Kge7XOMUNvwGVlu5DlJ/AEsoloNxUN+6sS9c739d+h6RPZPCrxMJ37NofxYWg+hzvKbqofOR83bcouU+7e7Qcsy9Eyq/9BV85fWnU2Um8iqqiUXP/eVdhc4DuTewTKHB07Tr1JMpi+8UldycuQVNZM3VyHoQ9Vm6r1r9AB1xx0s4/zNTx3NS24SYJ8Qilm7OhceBnj6yl72cdAIYBTCLaoPK/MAkYaJ9AHNUyDykXyomT6m8iB+FQZjQVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by CH3PR11MB7762.namprd11.prod.outlook.com (2603:10b6:610:151::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 13:20:23 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 13:20:23 +0000
Message-ID: <447c0757-e987-4714-a720-16191be2416c@intel.com>
Date: Fri, 25 Oct 2024 15:20:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
To: Matthew Brost <matthew.brost@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
 <ZxVI8IpkcgAq7PRx@DUT025-TGLU.fm.intel.com>
 <e50c5fdd-2872-4d92-a60f-d1db53fd1b79@intel.com>
 <ZxbW+3+hZtcSuWn8@DUT025-TGLU.fm.intel.com>
 <3afce3a1-5ae1-4c87-9bb1-838be1c8d951@intel.com>
 <Zxpwg6GyMAg35L4+@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Zxpwg6GyMAg35L4+@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::14) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|CH3PR11MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3a53e0-0e7c-478a-bc3c-08dcf4f7c7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vkd4MlhCNC8zaExPOUZpSmVCVEplRlk2QlpOM252QzFtYmZmU1dpWG9qRjZm?=
 =?utf-8?B?SW5aZFArVmZ2Rjl1U0hDa0lEdXYzQXYyVkVKQXltdzZ5UVJpejlvQmk3WTYx?=
 =?utf-8?B?VUxUaEFVS3BvSjZyWXI3cnNNK1lCNWtrYk00SU9KV2lsNUUzQjYrUjV5L29H?=
 =?utf-8?B?WEV5WFErL3VIbEY2cC9JNmtvUXhBVHNJT2Y0cmRZWTRjaWRZMUo2VURxbkQ3?=
 =?utf-8?B?L1VIRGhvWEhtQ2p5UU5vdklFaDBCY3BQa1k4aWZidUlwWGk5cjg2V3lvTUQw?=
 =?utf-8?B?RXJQSDF4Sy8vcEoxU0lsMXZ4YjVHMWpIanB5TnY1UkFKRmMxMC9qYk9oWjFQ?=
 =?utf-8?B?bjhUVUNxdTZrTEFMaHcyVTNuVjFWSktLQnRNVnQvdk1CTHRYMWwxelNZSkdm?=
 =?utf-8?B?cEpKRS9KLy85cU9uTVJRNUM4WDVFNGszSHhtY1ZFMEJDMGU1MmlCMTFvMUlO?=
 =?utf-8?B?bVYxM2h5OUFIVGZTR3hoNnppbGNpYzNTOGg0WlgxZWpjM1FxQTZZWStxUEo0?=
 =?utf-8?B?dDhiWGVwR1JHdVBmcE5iNSt4NXYvQ3ErbGpwbyszSFpxVnFacFpSUDFHTkhE?=
 =?utf-8?B?MzArbzREeVF1TisvWVVLb2cybFdOZ2R5emhaTEgvblkyL3dHRWJkbTFQY0Rp?=
 =?utf-8?B?RTdGMGdnNVliNnZ3azhrMytLK2VwYm1xb1NEWTl2eHZHTEErNTlYUzFEamxJ?=
 =?utf-8?B?Vm5BdnZsaHE5ZkJjeHIxRmRqS1lLRlE5OUc2M0V2V3JhSm1GcHRvOXVWcVM5?=
 =?utf-8?B?UVhYcU5ETlFVVmxGSU9FTjhkVzdvU0QxSGVnNk5mak5GNTQ0L1VjQ0pVNGUr?=
 =?utf-8?B?V0wzRXp4b0dka3pvTnhodnZOMzRuYzF0eUMwcnlHU3ZDc3ZsNDJCSjNPSGRy?=
 =?utf-8?B?RTgrWTc2RUhPVDBESnBOb0RBR3dUdDVOeC9SVDl4UEU5bHBOSFRuaGdkOS9Z?=
 =?utf-8?B?Qmx5dDVLYXlZR2JQWU5NZ3I1VERkazBBUjBESDlhTm9SZEUydXpGRWVUKzRW?=
 =?utf-8?B?bU1qWm1Bd0ZtbVRjZm02bExvSHdpbndtWVhWaUF4b3dxSjV2Q0dTd2dpV01B?=
 =?utf-8?B?d0oyc21wdFRXZWhtVmpGblBKaVV0ZFFVOGlMeEo1TDdqNDZKaHlCVWlaMGFF?=
 =?utf-8?B?a05hQTh0YUJUeHR5aGJPbWdsWExHZ1AxU3ZtNy93OUhEcmdMcUUvcHB6Mzkv?=
 =?utf-8?B?ZnNOcFpXd012TUZZRDRRVDYzTGlGdE4xMjhad21rTFcySVpKVWdXUHZtbmNn?=
 =?utf-8?B?VVFYTFBNald5WjlPNldieitiUEJyRlFEcWEyc0h1OGVRR2llaUJCYjgyQS9z?=
 =?utf-8?B?QzRGdzBJdlZ3QnZZRWw4UElDU2lObnk4NWFTRGdUaithZFZGSGd6dDdwZTZm?=
 =?utf-8?B?dEhiZlRNY3ZWejQvZXMvTElwMk9NeThVc2ZWOG8rb25tcGF4VkJlaW5XRWt2?=
 =?utf-8?B?K2h2K3VQN2JGaXNGOElaL24yeVZLOWw0SVd6RmdDWFh3cU96amgxOWhxc3B1?=
 =?utf-8?B?eFphQk5nL0NVck5JTitiZXVsMjJ6cmplQWJycHhCQ0FlZzRucU90cmJxOHBU?=
 =?utf-8?B?b2twUjIwSUZvS2FiZzRPY0hZZzcyRndwdUpaM3FoTm9tU3ZJUGsyMW9ieDJT?=
 =?utf-8?B?dHZnNEJ5ZVIxWFNORUJIcWczNFZjZ0Y1Sk0vS0lhNXREYlUwR2Q2Skx5MXlr?=
 =?utf-8?B?WC92b0NWaUdxaFdCN2o0K0owZUozRktENnFIWHB1Z1hhSTNUU1lsU1dRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGtuOTk1blFYUUxoWHR6VHhoWnRQRWo1Q2Y5My85MFh2RjRSNENrazNtNlRI?=
 =?utf-8?B?bWxVd2Z5UGNReHNRVGsrYjVFei9wQXhPWVhsQ28xUHoyWXpnYVhDSGJDdDhU?=
 =?utf-8?B?ZHRzbWJKYXZlWm9wdFlzUkM3Tk4yNVo1bm9WdXB3OUNoZklacWljczRrazZz?=
 =?utf-8?B?YlRRR0RrMXVNZGF4U3JnY2ovNWR1cEk4U3VjSS9xckVYV0RPeHFpbklDMnNn?=
 =?utf-8?B?RmZ1VUlsNFg1REdKNzRkKzNJMzRPaWxJN25RcndMTWNLdHhKQVdncm1Ka3g4?=
 =?utf-8?B?MG92SHJ3OTNSR2NPNndTNnlBNVF1ZVNqTHFzVFBINU9QY3pvcGo0R0lYbDI1?=
 =?utf-8?B?TTlvZ250N29CYUU1WUJ5a1JaaHBQbWk0Tk1sejc2bWZzRlNNZzFCbnNpRnAz?=
 =?utf-8?B?ZWdZdWxyQVFFb0hlTk5xTnE2NlRjc01VUVhSV0tMYzVVcDdvbzk4TVgvWFEv?=
 =?utf-8?B?MmRmK1FUWnk2MTc1bVNvWkhGU3M5a1o1SGZ5Zks2YVNHYTh4K0VYZkhsc0RK?=
 =?utf-8?B?d291L2pldnlNbDU5MzhMM28vSDIzMC9Wa1h6UDFrci9WQnppRUpVRmlZNHRJ?=
 =?utf-8?B?Y3I2blZNWmRPcFNOU0NTK3pDT0dLVXY2RG9IckZSak94bHBlTmFMMGt3ak83?=
 =?utf-8?B?SURHdkwwMGZHbmtnWXEzazM0YkpvaHlqaFBHa3Q4VlVyVWxjUXJOekpld0RW?=
 =?utf-8?B?M2hjOFVJOC9sbGZYdWl4ZlhtdG9iRmZWU3BmT0txUWZlTTZXNDdtUlN2d2hS?=
 =?utf-8?B?U3RkZG02akVKZG1yZUJMWWVLN1IvcTdaNWVoQndpUlhrNlV1M1ZYL2JTU0t4?=
 =?utf-8?B?UzhwZlRJSzRjRSs0T3M5Z0NYdFBhWHVHNTdpQ0UybjNvV2s3engwQWg1MGNN?=
 =?utf-8?B?eEVqZzZaUWFCd01PU2ZIRWNYdzhCdDRzbkdBcHlacXZSR1RERXIxN0JjQkU1?=
 =?utf-8?B?OXZ3L0J4anM0UEg2L0o1YThLeWJTelBHbFB6NFVWM1pieTYxNWh2alVtVjI4?=
 =?utf-8?B?aWgra09abDV2OHBiQ29tY2U3Nm5YS04xM1lBNVNCZVRTZE5TSDRkbldORXRE?=
 =?utf-8?B?Q0hnYjVNdFczVG0zQXRzdHZFLzRnMFFMVzJRU3JCWmFvcWxSMG9ucDFtMTJT?=
 =?utf-8?B?cnFIZkRMTU1QSGRnN1o1UFlBUzNjaitsdjNzcUZyNE5VZ3l0RVVXNnJnQ0Ns?=
 =?utf-8?B?Zk8vOTJDOWcrU0R6ZG1iU0trVjNBb2FJZDdWc3RybDNQd296UURMRnoxb1lR?=
 =?utf-8?B?WmRSVGtBWWFjbk1NNTdNNXI3dkJNbk03dHpQM01mYTZPQ0dUclpEdmFxSXgw?=
 =?utf-8?B?NVJ2Q1J2ZmtGLzRGa2lZYmt0djJ3Q0hsQjNMWlp6djRtSko3ZzNkSVNtZEtN?=
 =?utf-8?B?QmpzcVpDOWZoNzY2SmVOSHk5aURna1hXQ3YrVXVhMWZacTg4QnFwWGNuaUZi?=
 =?utf-8?B?OGpuNTJ2LzRBVHJDRVN2K0grOGVWOUo5cm5WaHZIbmJCckc0UzZWa3UrcUdr?=
 =?utf-8?B?V0UwcXQvZURScWFVMGptWXFoeFRTanB3T0Q4eXIxV29xc2FyeEc5TDdNSjhz?=
 =?utf-8?B?MWVqQUpqa0pmZWVIdW1Oc0p6Uk1OVFpqOHdGL0NvT3Axc3hLYWRTTnFUS3Nt?=
 =?utf-8?B?UHdOUWRCY3lKc3BRUDVUQW9kTVhZRk1LeStXVkthejZOdUpvSmdBdm9wM1Y2?=
 =?utf-8?B?S0piZWxMN0M5c1p0Tko3aHNKa013L3Jwcldmc1dRSVJ1cFBqMk1pc0JOajFr?=
 =?utf-8?B?anJ1MDREN3BPYmdZS2UxQ0RBMWV4eDR4K1MvQ3l1UWlkOXlvWnZtbHZGWjRy?=
 =?utf-8?B?eGFpL3lOano2NTl3M3pqZXdkN3BvVG1sSCtQQm1zclZaZ0NVU0dlcit6eUNi?=
 =?utf-8?B?K0hVZEJKcHBVaTFPTStzMndGT1ZNUy85aVNBQWM4QXk4K2dlNmVlY2t0c2Qz?=
 =?utf-8?B?N2NSUUhTMVc4NCtDOEp3Q2pOM2Y0ZHFnWld4Q0pUY3BCV0h3MmdjMitOK21o?=
 =?utf-8?B?NThoOVd2RkdiVDJvSDJzWXV0VlJlN2s1OHZ6RjR1bXduQ29MSE5XVDljK1BW?=
 =?utf-8?B?T3JsZDNEbC8rRDNCL05ZMDEzYWNIYysxL2lYYzByYUxSWkREcUdTSmxiRUYy?=
 =?utf-8?B?eXNuNGxOOTUzRUJpNmpjVDl0K0J2OEt0U0laemlrYm5YQXE4MklNcW4venkr?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3a53e0-0e7c-478a-bc3c-08dcf4f7c7de
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 13:20:23.0055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qnQwnnFN4+YNH+7OvtVmU9sy54s7XleW5W3JVGXIqzFTWxG+SxnH6dN01YngWUy8IzKpbfinzx3ZoXa4Tf/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7762
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


W dniu 24.10.2024 o 18:06, Matthew Brost pisze:
> On Wed, Oct 23, 2024 at 01:32:53PM +0200, Hajda, Andrzej wrote:
>> W dniu 22.10.2024 o 00:34, Matthew Brost pisze:
>>> On Mon, Oct 21, 2024 at 11:54:30AM +0200, Hajda, Andrzej wrote:
>>>> W dniu 20.10.2024 o 20:16, Matthew Brost pisze:
>>>>> On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
>>>>>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>>>
>>>>>> Debugger needs to read/write program's vmas including
>>>>>> userptr_vma. Since hmm_range_fault is used to pin userptr
>>>>>> vmas, it is possible to map those vmas from debugger
>>>>>> context.
>>>>>>
>>>>>> v2: pin pages vs notifier, move to vm.c (Matthew)
>>>>>>
>>>>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>>> Signed- off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>>>>> Signed- off-by: Mika Kuoppala
>>>>>> <mika.kuoppala@linux.intel.com> Reviewed- by: Jonathan
>>>>>> Cavitt <jonathan.cavitt@intel.com> --- drivers/
>>>>>> gpu/drm/xe/xe_eudebug.c |  2 +- drivers/gpu/drm/xe/ xe_vm.c
>>>>>> | 47 +++++++++++++++++++++++++++++++++ drivers/
>>>>>> gpu/drm/xe/xe_vm.h      |  3 +++ 3 files changed, 51
>>>>>> insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/
>>>>>> drm/ xe/xe_eudebug.c index edad6d533d0b..b09d7414cfe3 100644
>>>>>> --- a/ drivers/gpu/drm/xe/xe_eudebug.c +++
>>>>>> b/drivers/gpu/drm/ xe/ xe_eudebug.c @@ -3023,7 +3023,7 @@
>>>>>> static int xe_eudebug_vma_access(struct xe_vma *vma, u64
>>>>>> offset, return ret; } -	return -EINVAL; +	return
>>>>>> xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes,
>>>>>> write); } static int xe_eudebug_vm_access(struct xe_vm *vm,
>>>>>> u64 offset, diff --git a/drivers/gpu/drm/xe/xe_vm.c b/
>>>>>> drivers/ gpu/drm/xe/xe_vm.c index a836dfc5a86f..5f891e76993b
>>>>>> 100644 --- a/drivers/gpu/drm/xe/xe_vm.c +++ b/drivers/gpu/drm/
>>>>>> xe/xe_vm.c @@ -3421,3 +3421,50 @@ void
>>>>>> xe_vm_snapshot_free(struct xe_vm_snapshot *snap) }
>>>>>> kvfree(snap); } + +int xe_uvma_access(struct xe_userptr_vma
>>>>>> *uvma, u64 offset, + void *buf, u64 len, bool write) +{
>>>>> Maybe dump question but are we overthinking this here?
>>>>>
>>>>> Can we just use kthread_use_mm, copy_to_user, copy_from_user?
>>>>>
>>>>> If not then my previous comments still apply here.
>>>> This function is called from debugger process context and
>>>> kthread_use_mm is allowed only from kthread. Spawning kthread
>>>> just for this is an option but looks odd and suboptimal, could be
>>>> kind of last resort, or not?
>>>>
>>>> Another options: 1. Keep reference to remote task in xe_userptr and
>>>> use access_process_vm(up->task, ...).
>>>>
>>> I think remote refs are generally a bad idea but admittedly don't fully
>>> understand what this would look like.
>>>
>>>> 2. Pass xe_eudebug.target_task reference down from eudebug framework
>>>> to this helper and use access_process_vm. Current call chain is:
>>>> __xe_eudebug_vm_access - has access to xe_eudebug.target_task
>>>> ->__vm_read_write --->xe_eudebug_vm_access ---->xe_eudebug_vm_access
>>>> ----->xe_eudebug_vma_access ------
>>>>> xe_vm_userptr_access So to achieve this multiple changes are
>>>> required, but maybe it is valid path to go? One potential issue with
>>>> 1 and 2 is that multiple UMD tests were failing when
>>>> access_process_vm/access_remote_vm were used, they were not
>>>> investigated as this approach was dropped due to different reasons.
>>>>
>>>> 3. Continue approach from this patch, but with corrected page
>>>> iterator of up->sg sg list[1]. This was nacked by you(?) [2] but
>>>> I have problem understanding why? I see lot of code in kernel
>>>> mapping sg pages: linux$ git grep ' kmap.*sg' | wc -l
>>> I looked here every example I found has mapping and accessing 1
>>> page at time not mapping 1 page and accessing many.
>>>
>>>> 61 Is it incorrect? Or our case is different?
>>>>
>>> A sglist segments are dma-addresses (virtual address), thus every
>>> 4k in the segment can be a different physical page.
>> sglist is also list of pages and their lengths (in case of consecutive
>> pages, they are glued together), i.e. exactly what we need. And this is
>> done in xe_build_sg: it calls sg_alloc_table_from_pages_segment which
>> is documented as follows:
>> ...
>> * Allocate and initialize an sg table from a list of pages. Contiguous
>> * ranges of the pages are squashed into a single scatterlist node up to the
>> * maximum size specified in @max_segment. A user may provide an offset at a
>> * start and a size of valid data in a buffer specified by the page array.
>> ...
>> So sglist contains the same information as hmm_range->hmm_pfns[i] and little
>> more.
>>
>> So my concern is if mapping operation can destroy this info, but looking at
>> the code this does not seems to be the case. For example iommu_dma_map_sg
>> docs explicitly says about "preserve the original offsets and sizes for the
>> caller".
>>
>>
>>> i.e., look at this snippet:
>>>
>>> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start; + +
>>> cur_len = min(cur.size, cur.remaining); +		if (write) + memcpy(ptr, buf,
>>> cur_len); +		else +			memcpy(buf, ptr, cur_len); + kunmap_local(ptr);
>>>
>>> If 'cur.start' > 4k, then you are potentially pointing to an incorrect
>>> page and corrupting memory.
>> With added possibility to iterate over sgl pages in xe_res_cursor[1] it does
>> not seems to be true.
>> Why? cur.start is limited by length of the segment (cur.sgl->length), if it
>> happens to be more than 4k, it means sg_page(cur.sgl) points to consecutive
>> pages and cur.start is correct.
>>
> I suppose if the cursor is changed to walk the pages not the dma
> address, yea i guess this would work. Still my much prefered way would
> just call hmm_range_fault or optionally save off the pages in
> xe_vma_userptr_pin_pages given at some point we will ditch SG tables for
> userptr in favor of drm gpusvm which will be page based.

Both alternatives seems for me suboptimal, as their result is what we 
have already in sg table, for a price of extra call (hmm_range_fault) 
and extra allocations (both). Most important they will complicate the 
code without clear benefit.

I will try to implement version with hmm_range_fault but I am still 
confused why we need to complicate things.


Regards

Andrzej


>
> Matt
>
>>> Likewise if 'cur_len' > 4k, then you are potentially pointing to an
>>> incorrect page and corrupting memory.
>> Again, in case of consecutive pages it should be in range.
>>
>> Anyway if there is an issue with consecutive pages, which I am not aware of,
>> we can always build sg list with segments pointing to 4K pages by
>> modyfing xe_build_sg to call sg_alloc_table_from_pages_segment with 4K max
>> segment size.
>>
>> [1]: https://lore.kernel.org/intel-xe/20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/
>>
>> Regards
>> Andrzej
>>
>>> This loop would have to be changed to something like below which kmaps
>>> and accesses 1 page at a time...  for (xe_res_first_sg(up-
>>>> sg, offset, len, &cur); cur.remaining; xe_res_next(&cur, cur_len))
>>> { int segment_len; int remain;
>>>
>>> cur_len = min(cur.size, cur.remaining); remain = cur_len;
>>>
>>> for (i = 0; i < cur_len; i += segment_len) { phys_addr_t phys =
>>> iommu_iova_to_phys(sg_dma_address(cur.sgl) + i + cur.start); struct page
>>> *page = phys_to_page(phys); void *ptr = kmap_local_page(page); int
>>> ptr_offset = offset & ~PAGE_MASK;
>>>
>>> segment_len = min(remain, PAGE_SIZE - ptr_offset);
>>>
>>> if (write) memcpy(ptr + ptr_offset, buf + i, segment_len); else
>>> memcpy(buf + i, ptr + ptr_offset, segment_len); kunmap_local(ptr);
>>>
>>> offset += segment_len; remain -= segment_len; }  buf += cur_len; }
>>>
>>>> 4. As you suggested in [3](?), modify xe_hmm_userptr_populate_range
>>>> to keep hmm_range.hmm_pfns(or sth similar) in xe_userptr and use it
>>>> later (instead of up->sg) to iterate over pages.
>>>>
>>> Or just call hmm_range_fault directly here and operate on returned pages
>>> directly.
>>>
>>> BTW eventually all the userptr stuff is going to change and be
>>> based on GPU SVM [4]. Calling hmm_range_fault directly will always
>>> work though and likely the safest option.
>>>
>>> Matt
>>>
>>> [4] https://patchwork.freedesktop.org/patch/619809/? series=137870&rev=2
>>>
>>>> [1]: https://lore.kernel.org/intel-xe/20241011-
>>>> xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/ [2]:
>>>> https://lore.kernel.org/intel-xe/Zw32fauoUmB6Iojk@DUT025-
>>>> TGLU.fm.intel.com/ [3]: https://patchwork.freedesktop.org/
>>>> patch/617481/?series=136572&rev=2#comment_1126527
>>>>
>>>> Regards Andrzej
>>>>
>>>>> Matt
>>>>>
>>>>>> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma); +	struct
>>>>>> xe_userptr *up = &uvma->userptr; +	struct xe_res_cursor cur
>>>>>> = {}; +	int cur_len, ret = 0; + +	while (true) { +
>>>>>> down_read(&vm-
>>>>>>> userptr.notifier_lock); +		if (!
>>>>>> xe_vma_userptr_check_repin(uvma)) +			break; + +
>>>>>> spin_lock(&vm-
>>>>>>> userptr.invalidated_lock); + list_del_init(&uvma-
>>>>>>> userptr.invalidate_link); + spin_unlock(&vm-
>>>>>>> userptr.invalidated_lock); + +		up_read(&vm-
>>>>>>> userptr.notifier_lock); +		ret =
>>>>>> xe_vma_userptr_pin_pages(uvma); +		if (ret) +			return ret;
>>>>>> +	} + +	if (!up->sg) { +		ret = -EINVAL; +		goto
>>>>>> out_unlock_notifier; +	} + +	for (xe_res_first_sg(up->sg,
>>>>>> offset, len, &cur); cur.remaining; +	     xe_res_next(&cur,
>>>>>> cur_len)) { +		void *ptr = kmap_local_page(sg_page(cur.sgl))
>>>>>> + cur.start; + +		cur_len = min(cur.size, cur.remaining); +
>>>>>> if (write) +			memcpy(ptr, buf, cur_len); +		else +
>>>>>> memcpy(buf, ptr, cur_len); +		kunmap_local(ptr); +		buf +=
>>>>>> cur_len; +	} + ret = len; + +out_unlock_notifier: +
>>>>>> up_read(&vm-
>>>>>>> userptr.notifier_lock); +	return ret; +} diff --git a/
>>>>>>> drivers/
>>>>>> gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h index
>>>>>> c864dba35e1d..99b9a9b011de 100644 --- a/drivers/gpu/drm/xe/
>>>>>> xe_vm.h +++ b/drivers/gpu/drm/xe/xe_vm.h @@ -281,3 +281,6 @@
>>>>>> struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm
>>>>>> *vm); void xe_vm_snapshot_capture_delayed(struct
>>>>>> xe_vm_snapshot *snap); void xe_vm_snapshot_print(struct
>>>>>> xe_vm_snapshot *snap, struct drm_printer *p); void
>>>>>> xe_vm_snapshot_free(struct xe_vm_snapshot *snap); + +int
>>>>>> xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset, +
>>>>>> void *buf, u64 len, bool write); -- 2.34.1
>>>>>>
