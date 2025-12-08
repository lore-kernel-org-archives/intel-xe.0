Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D55D3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 17:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FFE89919;
	Mon,  8 Dec 2025 17:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBkP6SAM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD40F89919
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765215376; x=1796751376;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1s7Aj3anxFBEdIOGeDplBcannXWEsVQvLe8Cypjc8rM=;
 b=hBkP6SAMQBN9FuMTfzKnol5b/hKJaPIK/ler0BYSSjZv2zYhJznZm8xU
 KQyk0tlTlZAjKr/2pm/7ze0IryrN+tfywDg1a6T4vWnUPikPiN9BSdEKB
 5U1I0wFL2tyezG7Y8HAB+3pUOGUabhfCF671mgIdWYNDmFJENwAW4kIx4
 DlVzMF6cGb7qIuf5/rAdKJZ60oq3ciKnV5gChUjEvyMoIrsUe179t6og+
 B8H5TGMMmL2ezXtAkiZcVXT7H+0A5slUWq5XGQiqEvxypQN76Oc7Y63HH
 7+IYn+0YxhD2mO70/uO6JGOr977PxRcK/rPVR27Bm+PcdTPhSOmsEXklM w==;
X-CSE-ConnectionGUID: MaUsBU/jS4yR4qFlEjL1ig==
X-CSE-MsgGUID: D8Es7q2oSvCjnlDmsMgUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67209669"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67209669"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 09:36:15 -0800
X-CSE-ConnectionGUID: x1HQZxslRTWvnQFp+zrvCQ==
X-CSE-MsgGUID: oO8Qs8F5RcOlN2BsqXJeSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="200469517"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 09:36:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:36:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 09:36:14 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:36:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO88U1B+0l7SCFjLOtc5i8181a451Jk5jaActWlKuIV/2Wj+hqeOK+6o0af5Y4FfNaYojSwEO3c4iavBFwBw1W1Yvw1zVrkLf25UnJMEtOaoMrTyC1qOVnOdD+BOb7SdlH1oDANksbptybdIZy96m1RgoB+53teBwyoAJcS4NN0eJqCn9AZVasLcT34U+Q4E6GxorT5HrVxTcl944QkrDyPb7ZbCrK5p172dzJXukSEteacqG6LEjxs215j0W6GT2tRMEpm/6tWM3IA/TPV3G99sp79M2WNPfglL4sKofk4YdCao9pN+EERo31xB49TWLW6WZ4yNouqJaMlCXcQRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBqTSqr2KEi54ASyFuSRLlgYTdKsd7LZzP9Igs0gfDI=;
 b=AzCE+0BbyXgiJRh/wxxzC4Sows3R5uegCLQg7Z1xCEN5QMrKp59x5SwtjO/IRT5xEpKnMjjSz/CSpomtlc46ani94DbFaOJFrQCJ3EZ8jnL5ri96omBRluI6YMFk8in7tBtJcCA//VqD7wFBKekhR0Xi1puosDHtTJ8n8ks1Ttsy/cNSlbosUbxNE9IPD+WbZJ2oD/kPn2MK948tOwqhynYWuk22tf9e1LG3e8xOWBZuU5znk99bNBTh2pg1fgIgdwCSGYCTv/eKNkmrXoXv+qO+O0Lb2qEcQrJmLgKmHxtA7NEvVTX3Fz5G6/eMgxPe2laRQaVfzIlOIBPN78UGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5158.namprd11.prod.outlook.com (2603:10b6:510:3b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:36:12 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Mon, 8 Dec 2025
 17:36:12 +0000
Message-ID: <2d4e2479-5971-49ae-98f8-85b7b473e71f@intel.com>
Date: Mon, 8 Dec 2025 09:36:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] drm/xe/sriov: Initialize scheduler groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-15-daniele.ceraolospurio@intel.com>
 <f520d00e-2f9d-4337-a0bc-0bec3aa96d5d@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <f520d00e-2f9d-4337-a0bc-0bec3aa96d5d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5158:EE_
X-MS-Office365-Filtering-Correlation-Id: 93620184-534e-4ae7-5b4f-08de368047a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlByMzZaZTVZL3I0VXo4Y0pXODNPa21yd2N5eUs0VFFsTDREMGhBUmpHUUNy?=
 =?utf-8?B?d1plaTk5MHppZWU1Mk9meTlIZzZ5YktXU2tOeTRKb1o0dXpiOE9odHNBaWdU?=
 =?utf-8?B?bG5rb09vTEMzTXFaTjVUbmt3OFh6a0FzSUF2MnBRVlRYbzkrR2JlQllmUGRp?=
 =?utf-8?B?ekdGdklPRy9VK3lqdjJYTlBHVTZrSDBsa3VxNm5Nd3cyU3ZKTGcyUEdGUjMv?=
 =?utf-8?B?S2tyUTZVRXNIQ2k4RjE5SlFxV291dUNWd2pFYVQvWTlFOFVpQTJxTDQwT2hV?=
 =?utf-8?B?NktIaU1odmNDZmFrRXo5azFCbS9FS1dtYXpKR09iL202MUp0RWFVM2JsN1RX?=
 =?utf-8?B?dmI3SVZRbnRzeXQwaTBZd0pTMFNpUXZaTmhRZFNzZDZ2bE5qWnRBdklzVVcw?=
 =?utf-8?B?cUdSUStXZUs2TW1wUzFzRXFsZnhRWEpUMnpyMDRLSWUwMjFIdzZsdmthWlBU?=
 =?utf-8?B?MDN1eFZsQVEwa29nODlzZVFVZ25mWnJyenJ0M0pOdFRPaWprRVZZby95U214?=
 =?utf-8?B?N1k3OWJBSnh2M0tOc1RwVmttVmswMHB3T2hIL1pLc1IyYmt0eGlmN2FJZ2Vx?=
 =?utf-8?B?MjdKYldiQXJBei94bWF6QWt2dWpFbVZVN2dFUWpITVZIQjFPMFZ3M3FpRG1Q?=
 =?utf-8?B?Y2hNSVhKZ0k4Q1M2WnFuNENTM2lOY2c0WXZZVnQwaUkxNkJhYXRtQVNjbFpM?=
 =?utf-8?B?WGdmQ0Y2L3BpM0thRi9HcGpSajN4c0N5cGNiQmNRNFl1ZnNmQjB5alYxM1Nj?=
 =?utf-8?B?R05KeVp3Szlhczd2a1dsbVE4K1RxWHY4UTkwYzNyS0tyMTYyaVBUd3FselRX?=
 =?utf-8?B?NktYOGpyOXIyOVBiMGpaMXZlN04yWTB5eHdWeC9BM0E0cjA1c3NLb0RjNmJD?=
 =?utf-8?B?MUY3TXZwMzdXdkI3Q0p4eGtITHR4bGRXR0hLaVJPZ1NHVnFvd2R3ZFBDZzlk?=
 =?utf-8?B?ejRGU2M4VE5jdldnais3eFNrVzVMVlZoM2g3Mjkzc0NWR2ZFUmN3UkxmVk9T?=
 =?utf-8?B?ekZQekVDOXEyc0ZUblAyMnZJR01KSTZIZjlHYkhwUjdKZ3RZdzNmQXhVdXFz?=
 =?utf-8?B?NmhLcTJYRmtWdnlnemxRbzhkTDZ6THZvMkZ0cjhKbmVJd1oyTU5iWTRKbmI3?=
 =?utf-8?B?VFJKQ3dyeURjOGU2cFVJcVRYdmZHMW1KakZUYzRrMnhSTG1IaGxCby9XbVl1?=
 =?utf-8?B?UHpOYlM2OGZEZEFiU3dKaTIzcW9FcHE2TmRmTVZ2OVRid3R6Z1FRdDJVQjZM?=
 =?utf-8?B?NXNXS2VZa2gzM05YbFlvNkFQS1IvT2w0UEpoYTQ2K3hBbGxoeHBucFVTTDBM?=
 =?utf-8?B?MkkrdDVmMUhjNXoxbzRBWHpzQmdxWjdUOWtPZDA3cmIvMUdMS0ZkRmVEdmNI?=
 =?utf-8?B?NlRsUkJ6YTlvVWErK0Z5K1BybkhuREJSZXQvSlVnSTVBampBNGxYd3poSmVL?=
 =?utf-8?B?V01uTE9XNmhETWRWQTRDWjV5a0d4RDZ1V0hNellaTG0rbTVHQno1YW5hT1hm?=
 =?utf-8?B?dWtIcXlDdjdJVWlWMUdpOWszN2lINitHNWJOSmtlNE4zdit5b1BmZjNWaDFU?=
 =?utf-8?B?M3ZpQWZ4QzVkVFA3RTBhL2JrdXJSUWREaXVTbFFramFtNTBuQ0l0amlNajZa?=
 =?utf-8?B?eEtaVFZVdGNjQVF4MWs1Vlh6UXhjQXd4UnZmeXdNbGt2Tjg1d1crSXYyb0dE?=
 =?utf-8?B?K09GYTQ1RGFOdmQ1Q2R3NlpJUWliZzFhd3J4RlpNNlVHM3pWeWNpbWZlY1kz?=
 =?utf-8?B?TnY1emZqZTg2VkNUMXlkOHU4N2ZIMHhKdVVqbnBSTHdwamNqQWI4Y0hqZ3hn?=
 =?utf-8?B?N0lVYjVZL2szZWR4V2pQeXBISFFZbDc1cVJnTTAwY012M3pnTUk2TE9MMmxp?=
 =?utf-8?B?cHZ0SmNEMW04VnhKQVlGWXhMQnRUNzd6cVlXOHRrVS9nZnBJbzR1UFVIbmJz?=
 =?utf-8?Q?W05/O1kOxN8cu8qj8p7wpdc5w3jUiwWp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUZPVWVGN0NlUDFDenNjTUpIcy9WN21IcnBCeTVGOW1MTGFpL211aUFzK3FC?=
 =?utf-8?B?U3YveGkvYmpLdkdicjlkNG1OV2NyZzJJYkJaRDlvNkg5VksxRWVUZFAyS0xx?=
 =?utf-8?B?cVF4Qlh5OTBsY3RvS1lpOU55SStwZk9uWVUwNkxLcGxvYVNka0kwWm5WNjVF?=
 =?utf-8?B?WnBJcEJIZlRBdHFwUFJaK21JSDhoejRFd25QQU5BT0tOeEp6VnRGc3VEeEk0?=
 =?utf-8?B?NHduVzhQazU5ZGp4WFhZcGZ6RkQ3Ui96WFlZeVQvR2FETXBUVHNEZS91aEFk?=
 =?utf-8?B?Vk10TG9jazFrM1RpQWxOeTY4cmhlUnFINDBZeDA1UWlXSElITEhiVHQ2bURE?=
 =?utf-8?B?NXpBUWxQZGVhd3N6d3hpOVdRYUlFcXlHRVo5UkZRVTlWcHYrMUovRmJXWXVw?=
 =?utf-8?B?V2R6WCtjR1RVZG0yZEVVekhscERkWitZRmprZ1pPVmxKYXUxekZIMWo5Y0NU?=
 =?utf-8?B?am8ySEJqNXlZdS9IMU83c05lSGc4NTVLREhMeVpnRWV2L090dTY4YlJaeHJv?=
 =?utf-8?B?MnJhRWt3akNnMDZPUmRsKzhQMVUzN1owdU0yNzZnMEV1TjlocENTZ3FqUnFn?=
 =?utf-8?B?UG96eEtMK09NVDlyOStXWDI0TUg0MXdHL21NcTY5SUsrcXFlTllmeXJZRXZK?=
 =?utf-8?B?cHk0ejQ0NHBxYmxZVVA5SU1QQXJIclBBTCsxUnM0SWFVdi9qT3BxUVRhK3Ra?=
 =?utf-8?B?QmF4VDkxY3JwMVpHazkrbWQxVElWZ1pDaTcvakd3bXA1SzdtZlBQWkFYV1U4?=
 =?utf-8?B?bFk3eVhYa1BJemZGUTkvNHNLRExvMXJmVnVKSGpRWjhpcVRMTm9OcmJobi8y?=
 =?utf-8?B?WVl2WSs1L3ZxZWxDdTVFVTAwaVpWVjByVFcrbUFkZFVLQXJwcGFIVHhpOXRS?=
 =?utf-8?B?UnJ5UmtlL0NDdFljN1E5RUtLK05reVo0V3RqQzZiQjBKSW5kRDdsMlZPL1p3?=
 =?utf-8?B?b2grKzA5TXlqUzNxT21QTFdUYUNQSS92azZsTjRtb1d1WTUvWGZoakpVb0Ur?=
 =?utf-8?B?TGFtQ3pPejlmN211RmZlYWFMYkxWRHdtY25vQzF3VDNwK0Z1RTJRNGRqQUJp?=
 =?utf-8?B?YkhxWWdtYnRKOVd4YjNEWlZneXkvTklHb0tnTXZxTXdSdFhJaThpQWUwOHZx?=
 =?utf-8?B?MVFxTmMvWjZsejBPQzdUNzBBdGk4Y3p3WWtWT2k4dVEwR2Q4VjQrRFBuckZC?=
 =?utf-8?B?ckE5cHdLNS8yWHJTMDhlT25QZzN0OTBtakFFbTNCRGFlcGEyRTREUjQxenk3?=
 =?utf-8?B?WHV4WVpLV0R2bnFNc2FtZGw1YnpYM3U0M3c0dkE5Wk9Ja1NrRkZDU2ZCRW5k?=
 =?utf-8?B?K01lRjlLOUw4alNwY1hqOXBCUmVWbWNVb2tWUU1FZTNWRHY2RXVFWTRUMlNC?=
 =?utf-8?B?cnVDbHV6cjZ3T04xVmRCMklmMEFRUVFOMHFFSVFCZFpOYWFBM1lGNkJ4bXl3?=
 =?utf-8?B?TlRsNlVJMS94T1BqekE5Q2ZCNFRySzU0dXcrcFZ2MU96U2V1REpoY2VxY1l6?=
 =?utf-8?B?TlFXU1BwSWp0NHZCQ2dQcVY3dUw2dk5mR2xXYnYwUTdBWjdRL01QOE1Fd3VU?=
 =?utf-8?B?SFYrRXBkTU9kRVZJOFpybVltcFdsbExNTXZtSld4TlljN1NIOGJxWXJ0azky?=
 =?utf-8?B?T0F6RjBVYytFV0RjaUlxOUxVSHFGdnFOUzRQd2dCSTBBS2Jsb2VRaEIyQk41?=
 =?utf-8?B?UXF6TlFEV2xXcjBkUXpmWEF5M3hlRmtQeFR2ZzlvUEpPaXV1eCt3K2NWTWpT?=
 =?utf-8?B?d2x2U2ZmeVFjWHE3VHd5N1d1K1JmNWhuaGN2SUN4QTczazVBakVYKzNTMERm?=
 =?utf-8?B?cGdYMDNkZllZWk56VmVlNmlTSldFdWVSVHRUYlZIUC9ndUhnbTM3eks0YXVU?=
 =?utf-8?B?NEVETmN3Qkk1LzdzdVp6ZXhQbFBzNkVuUkpRNzh5RTBlSFVTRjFLVWVmRGpm?=
 =?utf-8?B?RWt5V1o4NEpES29qeTI0Y0ErblUwaVkxK29TUy9jd0ZkanRTS3ZoS015TXJk?=
 =?utf-8?B?NUZmbzJBb0lhZnpUMGpNZU1hRkhNTGVlWkVqY1RVN3FBaWkyYVVMUDhlRzBu?=
 =?utf-8?B?MzlNaGtkS0NMMmtYVE81azAvQlFXdlZJeHYvSkdvMVljbjJLa0hpeVlhd2lO?=
 =?utf-8?B?aHpZc2VZV0krNlpwTlE2NGpzaUhUMmZrRHZaZXpGZktiMW5SSmNTdUowTFJ6?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93620184-534e-4ae7-5b4f-08de368047a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 17:36:12.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMEwe6Pgxol1MoQrSXVgMEMLupaUlwSo6x/uUIsglZgj+hzjr3B+Zwkzt2jerscEhTkoc1YSnjhBvqZ/PdNTjmYmWbevXmLg1NU1GhEfCOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5158
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



On 12/7/2025 1:57 PM, Michal Wajdeczko wrote:
>
> On 12/7/2025 12:03 AM, Daniele Ceraolo Spurio wrote:
>> Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
>> feature that allows the driver to define groups of engines that are
>> independently scheduled across VFs, which allows different VFs to be
>> active on the HW at the same time on different groups. The feature is
>> available for BMG and newer HW starting on GuC 70.53.0, but some
>> required fixes have been added to GuC 70.55.1.
>>
>> This is intended for specific scenarios where the admin knows that the
>> VFs are not going to fully utilize the HW and therefore assigning all of
>> it to a single VF would lead to part of it being permanently idle.
>> We do not allow the admin to decide how to divide the engines across
>> groups, but we instead support specific configurations that are designed
>> for specific use-cases. During PF initialization we detect which
>> configurations are possible on a given GT and create the relevant
>> groups. Since the GuC expect a mask for each class for each group, that
>> is what we save when we init the configs.
>>
>> Right now we only have one use-case on the media GT. If the VFs are
>> running a frame render + encoding at a not-too-high resolution (e.g.
>> 1080@30fps) the render can produce frames faster than the video engine
>> can encode them, which means that the maximum number of parallel VFs is
>> limited by the VCS bandwidth. Since our products can have multiple VCS
>> engines, allowing multiple VFs to be active on the different VCS engines
>> at the same time allows us to run more parallel VFs on the same HW.
>> Given that engines in the same media slice share some resources (e.g.
>> SFC), we assign each media slice to a different scheduling group. We
>> refer to this configuration as "media_slices", given that each slice
>> gets its own group.
>>
>> Note that while the GuC interface supports a maximum of 8 groups, the
>> actual number of groups that can be enabled can be lower than that and
>> can be different on different devices. For now, all devices support up
>> to 2 groups.
>>
>> v2: Use asserts for coding errors, code cleanups, better docs (Michal),
>>      limit groups to 2, limit to BMG and newer, bump required GuC to
>>      70.55.1.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.h                    |   6 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   3 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 142 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
>>   .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  29 ++++
>>   5 files changed, 181 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 2eeeeeb6b912..0a34e862406e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -29,6 +29,12 @@
>>   #define CCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, CCS)
>>   #define GSCCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, GSCCS)
>>   
>> +/*
>> + * Each media slice has 1x VECS, so the max number of VECS instances gives us
>> + * the max number of slices that a GT can have.
>> + */
>> +#define MAX_MEDIA_SLICES hweight32(XE_HW_ENGINE_VECS_MASK)
> isn't xe_hw_engine_types.h file a better fit for this macro?

I thought having it with the _INSTANCES macros was better, because this 
is extrapolated data the same way the instances lists are. Also slices 
are not an engine-level concept, as they include stuff outside the 
engine as well (e.g. SFC).

>
>> +
>>   #define GT_VER(gt) ({ \
>>   	typeof(gt) gt_ = (gt); \
>>   	struct xe_device *xe = gt_to_xe(gt_); \
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index 0714c758b9c1..0d97a823e702 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_gt_sriov_pf_control.h"
>>   #include "xe_gt_sriov_pf_helpers.h"
>>   #include "xe_gt_sriov_pf_migration.h"
>> +#include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_pf_service.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_guc_submit.h"
>> @@ -123,6 +124,8 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>>   	if (err)
>>   		return err;
>>   
>> +	xe_gt_sriov_pf_policy_init(gt);
>> +
>>   	err = xe_gt_sriov_pf_migration_init(gt);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 4445f660e6d1..158d68aff4b7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2023-2024 Intel Corporation
>>    */
>>   
>> +#include <drm/drm_managed.h>
>> +
>>   #include "abi/guc_actions_sriov_abi.h"
>>   
>>   #include "xe_bo.h"
>> @@ -10,6 +12,7 @@
>>   #include "xe_gt_sriov_pf_helpers.h"
>>   #include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_printk.h"
>> +#include "xe_guc.h"
>>   #include "xe_guc_buf.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_klv_helpers.h"
>> @@ -351,6 +354,133 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
>>   	return value;
>>   }
>>   
>> +static void pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
>> +{
>> +	u8 slice_to_group[MAX_MEDIA_SLICES];
>> +	u32 vecs_mask = VECS_INSTANCES(gt);
>> +	u32 gsc_mask = GSCCS_INSTANCES(gt);
>> +	u32 vcs_mask = VCS_INSTANCES(gt);
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +	int groups = 0;
>> +	u32 *values;
>> +	int slice;
>> +
>> +	xe_gt_assert(gt, xe_gt_is_media_type(gt));
>> +
>> +	/* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
>> +	for (slice = 0; slice < MAX_MEDIA_SLICES; slice++) {
>> +		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
>> +			slice_to_group[slice] = groups++;
>> +
>> +		vcs_mask >>= 2;
>> +		vecs_mask >>= 1;
>> +		gsc_mask >>= 1;
>> +	}
>> +
>> +	xe_gt_assert(gt, !vcs_mask);
>> +	xe_gt_assert(gt, !vecs_mask);
>> +	xe_gt_assert(gt, !gsc_mask);
>> +
>> +	/* We need at least 2 slices to split them up */
>> +	if (groups < 2)
>> +		return;
>> +
>> +	if (groups > gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups) {
> should we care about this limitation here in this function?
>
> we will allocate groups here as required, only GuC might not correctly handle that
> but that's mainly a GuC's problem and we may just report that during sending provisioning to GuC

I want to avoid exposing the mode entirely if there are too many groups, 
not give the admin the impression we support it and then fail when the 
they try to turn it on.

>
>> +		xe_gt_sriov_notice(gt, "media_slice mode has too many groups: %u vs %u\n",
>> +				   groups,
>> +				   gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups);
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * The GuC expects an array with GUC_MAX_ENGINE_CLASSES entries for
>> +	 * each group.
>> +	 */
>> +	values = drmm_kzalloc(&gt_to_xe(gt)->drm,
> drmm_kcalloc ?

ok

>
>> +			      GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
>> +			      GFP_KERNEL);
>> +	if (!values)
>> +		return;
>> +
>> +	for_each_hw_engine(hwe, gt, id) {
>> +		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +		u8 entry;
>> +
>> +		switch (hwe->class) {
>> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
>> +			slice = hwe->instance / 2;
>> +			break;
>> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +			slice = hwe->instance;
>> +			break;
>> +		case XE_ENGINE_CLASS_OTHER:
>> +			slice = 0;
>> +			break;
>> +		default:
>> +			xe_gt_assert_msg(gt, false,
>> +					 "unknown media gt class %u (%s) during EGS setup\n",
>> +					 hwe->class, hwe->name);
>> +			drmm_kfree(&gt_to_xe(gt)->drm, values);
> hmm, do we really need to abort here?
> maybe assert and then still assign this unk engine to slice 0 (like fallback to class_other)

ok

>
>> +			return;
>> +		}
>> +
>> +		entry = slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES + guc_class;
>> +		values[entry] |= BIT(hwe->logical_instance);
>> +	}
>> +
>> +	*masks = values;
>> +	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;
> IMO we should store number of groups only
>
> we know that each group is just set of GUC_MAX_ENGINE_CLASSES instances

It's the same for me, I can flip it

>
> maybe even we should have below struct defined somewhere:
>
> 	struct guc_sched_group {
> 		u32 engines[GUC_MAX_ENGINE_CLASSES];
> 	} __packed;

I'll see if it makes things clearer.

>
>> +}
>> +
>> +static void pf_init_sched_groups(struct xe_gt *gt)
>> +{
>> +	int m;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +
>> +	/*
>> +	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
>> +	 * been merged in v70.55.1, so we require the latter. The feature is
>> +	 * also only enabled on BMG and newer FW.
>> +	 */
>> +	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 55, 1) ||
>> +	    gt_to_xe(gt)->info.platform < XE_BATTLEMAGE)
>> +		return;
>> +
>> +	/*
>> +	 * The GuC interface supports up to 8 groups. However, the GuC only
>> +	 * fully allocates resources for a subset of groups, based on the number
>> +	 * of engines and expected usage. The plan is for this to become
>> +	 * queryable via H2G, but for now GuC FW for all devices supports a
>> +	 * maximum of 2 groups so we can just hardcode that.
>> +	 */
>> +	gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups = 2;
> maybe this limitation should be introduced in next patch 3/11 where you are
> actually trying to provision sched_groups within GuC?

ok

>
>> +
>> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>> +		u32 *masks = NULL;
>> +		u32 num_masks = 0;
> maybe initialize them as pointers instead:
>
> 		u32 *num_masks = &gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks;
> 		u32 **masks = &gt->sriov.pf.policy.guc.sched_groups.modes[m].masks;
>
>> +
>> +		switch (m) {
>> +		case XE_SRIOV_SCHED_GROUPS_NONE:
> I'm still not convinced that we need to waste an array index for the NONE mode
>
> can't we just loop over known modes (for now its MEDIA slices only)
> and if NONE is selected just implicitly assume .num_masks is zero?
>
> then array will hold only potentially valid group definitions

As mentioned in the previous rev, having the NONE as part of the array 
makes things simpler in the interfaces, because we don't have to special 
case it, I can just map the "disabled" case directly to 
XE_SRIOV_SCHED_GROUPS_NONE and it all just works.
Also, I thought we agreed to go with this approach for now and rework it 
later if necessary?

>
>> +			break;
>> +		case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>> +			/* this mode only has groups on the media GT */
>> +			if (xe_gt_is_media_type(gt))
>> +				pf_sched_group_media_slices(gt, &masks, &num_masks);
>> +			break;
>> +		default:
>> +			xe_gt_assert_msg(gt, false, "unknown sched group mode %u\n", m);
>> +			return;
>> +		}
>> +
>> +		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>> +
>> +		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
>> +		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
>> +	}
>> +}
>> +
>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>   {
>>   	pf_sanitize_sched_if_idle(gt);
>> @@ -401,6 +531,18 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>>   	return err ? -ENXIO : 0;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_pf_policy_init - Initializes the SW state of the PF policies.
>      * xe_gt_sriov_pf_policy_init() - Initializes ...
>
>> + * @gt: the &xe_gt
>> + *
>> + * This function can only be called on PF. This function does not touch the HW,
>> + * but must be called after the engines have been initialized.
>> + */
>> +void xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
>> +{
>> +	pf_init_sched_groups(gt);
>> +}
>> +
>>   static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
>>   {
>>   	drm_printf(p, "%s:\t%s\n",
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index 2a5dc33dc6d7..52312d24d527 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>   
>> +void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
>>   int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> index 4de532af135e..1d4cdc87e069 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> @@ -8,16 +8,45 @@
>>   
>>   #include <linux/types.h>
>>   
>> +/**
>> + * enum xe_sriov_sched_group_modes - list of possible scheduler group modes
>> + * @XE_SRIOV_SCHED_GROUPS_NONE - no separate groups (i.e., all engines in group 0)
>> + * @XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES - separate groups for each media slice
>> + * @XE_SRIOV_SCHED_GROUPS_MODES_COUNT - number of valid modes
>> + */
>> +enum xe_sriov_sched_group_modes {
>> +	XE_SRIOV_SCHED_GROUPS_NONE = 0,
>> +	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES,
> hmm, I was assuming that enum NONE is just an alias for 0,
> and that individual supported modes are defined as BITs,
>
> 	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES = BIT(0),

That only makes sense if you don't want NONE to be a valid recorded 
group, because otherwise it just makes looping through the modes more 
complicated.

>
>> +	XE_SRIOV_SCHED_GROUPS_MODES_COUNT
>> +};
>> +
>> +/**
>> + * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
>> + * @max_num_of_groups: number of groups supported by the GuC for the platform
> nit: just @max_groups ?
>
>> + * @modes: array of masks and their number for each mode
> 	@modes: array of defined scheduling group modes
>
>> + * @modes.masks: array of masks for a given mode
> hmm, 'mask' alone is not the best name here, maybe:
>
> 	@modes.groups: array of engine instance groups in given mode,
> 			or NULL if mode is not supported.
> 			each group consists of set of
> 			GUC_MAX_ENGINE_CLASSES of engine instances mask
>
>> + * @modes.num_masks: number of masks in the array
> 	@modes.num_groups: number of groups in given mode,
> 			or zero if mode is not supported
>
>> + */
>> +struct xe_gt_sriov_scheduler_groups {
>> +	u8 max_num_of_groups;
>> +	struct {
>> +		u32 *masks;
>> +		u32 num_masks;
> 		struct guc_sched_group *groups;
> 		u32 num_groups;

ok to those style changes.

Daniele

>
>> +	} modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
>> +};
>> +
>>   /**
>>    * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
>>    * @sched_if_idle: controls strict scheduling policy.
>>    * @reset_engine: controls engines reset on VF switch policy.
>>    * @sample_period: adverse events sampling period (in milliseconds).
>> + * @sched_groups: available scheduling group configurations.
>>    */
>>   struct xe_gt_sriov_guc_policies {
>>   	bool sched_if_idle;
>>   	bool reset_engine;
>>   	u32 sample_period;
>> +	struct xe_gt_sriov_scheduler_groups sched_groups;
>>   };
>>   
>>   /**

