Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD867CA0FFD
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 05:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B28B10E36B;
	Mon,  1 Sep 2025 05:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvdxcTBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301F510E315
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 05:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756705288; x=1788241288;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OnvbPHEs5h6ld4TcMdVjAn01FWAZ7dOJn9/Zt6z/eMQ=;
 b=cvdxcTBw6ReRQ8pzP7VkkZVq6lha+f3q6eU7TaXUNxOhYZXhiVKS0nNL
 Me++BWsmwhyzjtxpWlcBez0CkHWj+IhbT2SkT/BDvYEScwAWk7xob5Kj3
 PmEbeSZlkZOfVcRG+u9RENycrdt3lRFRfnpF5cJFaxOFG1MY1OHIG67D/
 beqfnmphivt3L1hvnu8uLe7TR2J4zfUyh2jtCe3RHtehK0eAZPkI7CAYE
 qRX8+kYO5YPLudZRyggZHwnV3B+yO8PVwNoRdNkuz/gn6E+XRT8QUNBMy
 zkE09PUHqLb/I0uUIKCP2CfYblGZwzFr7xIOBuCVr0pepJcBGm97+eS6r w==;
X-CSE-ConnectionGUID: YwSW2JXeROedZOgu2+fgzg==
X-CSE-MsgGUID: tM4dlXXzQUa/amIFEAw4IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="57920510"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="57920510"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2025 22:41:28 -0700
X-CSE-ConnectionGUID: UnEM71IrTpu9641VAOLo2g==
X-CSE-MsgGUID: 9lj4819iQ7KtnH9/ApMveg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170179284"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2025 22:41:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 31 Aug 2025 22:41:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 31 Aug 2025 22:41:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 31 Aug 2025 22:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbKDs9yGvXY9BLcC/h8trRjQWk4xb6jMi6Rkn72x0jyHJ2AynjXDtHk2ioxYmVovGN6yOeoFp+OWj/d+r0woK/G9y/E26ykgsJYnuwUiwMNX3ii2xi0m61/SffUYSHwu//O/RAGMpGyHA79Ic9VeydmKjuNAFtVRMgUC3TbfmRihZgvXcBSJrfd+B08A1CMqgEWsaAPqtClexpVDMINq2ZIXLoJoSPEict9e1UPTnt68mtjrXFLU8kuYeO86hbghR1WvZtNFBNq3FUYSty/XmoGqTzPkbL1aTUof7VbK5XtmZdKEI/OZW7N+cUpUDmAOKKrL5hJiZSEDenmOHqJ1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kURENqaBrC5YqtVJ1aLGTLmXgbm3WGDQ5AmH7lDsqfk=;
 b=AVhZWDNgx3EeYfmJ3Xx3gsYEbWCfeoZ/F3dAOja7c0HwX7FmQBBtrcrLw9+uWl4LfPXoXq9wo+z+znIFTvlRkk6KsEi7z02HbgXmurl3xZJQjHGZAZVA/chde5eS5LSq+DHrhetmzbvEoJxGK8hiHUg5I+SIBIpETQtDII5d34zfuOP4V8AgxmSJdNyxFOh+3VF2dsDoTkKkU0z7RSHMCTRSkRjFmqFynFlHJnswXFxNkjPVyIEmkCAU2mWPxoVJrPHVytdEkp4xlRkx5grw7QztQoOORUJ8w5kYhd9kfrHVWP0m82xt7vTJb38s8PSwgEHmA5v19ND8xohHPZh0wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28) by DS7PR11MB7836.namprd11.prod.outlook.com
 (2603:10b6:8:e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 05:41:24 +0000
Received: from PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::8435:3b39:7eee:480]) by PH3PPF67C992ECC.namprd11.prod.outlook.com
 ([fe80::8435:3b39:7eee:480%7]) with mapi id 15.20.9052.021; Mon, 1 Sep 2025
 05:41:24 +0000
Message-ID: <faf36bcf-9761-494a-bdec-8fbe278e5889@intel.com>
Date: Mon, 1 Sep 2025 11:11:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <intel-xe@lists.freedesktop.org>
References: <aLAwP0xAjMpLLpFm@stanley.mountain>
 <8e37eb4d-eaba-4e28-bda3-52b9a76a6936@intel.com>
 <aLBnqXH8fWCuVC9A@stanley.mountain>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aLBnqXH8fWCuVC9A@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::9) To PH3PPF67C992ECC.namprd11.prod.outlook.com
 (2603:10b6:518:1::d28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF67C992ECC:EE_|DS7PR11MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 752cce72-4f88-4a58-f62d-08dde91a3007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGR2c1IwdW1FZG5lMXJ0b2hKVGhFRXo0ODJFSjRONlE4TllnMEQzaURLVHVr?=
 =?utf-8?B?VWtxNHhCeUlHQkJZc2VlQTRrdXRBQ3ZQUnlVdSsyQ1dqdzcralNhQitGZlhI?=
 =?utf-8?B?cXJpSEZyNFFLMXlxRVVnd3FmenZ5ZkFScEhxVS94RTJBcUJ0eWVyQ0VwNVAy?=
 =?utf-8?B?dWxjUnBWVURnWVlLaVNKUEFzSEt2RTByKzdBQlQ2NXdyN24zRmdaQzgzdjBY?=
 =?utf-8?B?TzB4cTA2eTd6eGV6YnJtY0dsWjUvOGV6Nit6a2ZNcVhLaUM1NVhpbVR0MHkv?=
 =?utf-8?B?Um5NQkVSYWtiZ1NpYVA3d3pjc0FBN1pwOTRaWFBIdzdGaG0yQ3YrMGlicDdT?=
 =?utf-8?B?T0ZFd2ZySFB0dVdxQk9OWWFEa3VvZWdSZXY0K2JLU1IxbDhoVVc0ODlyb3Nw?=
 =?utf-8?B?akw4T0Jnd0hNSTBaUEI1ZDQxSDNDcm5EWGt1dVRGM3BIaXd3L2dZQ2JVM3Vv?=
 =?utf-8?B?YWNzM25kT29ON1VKVEY4RThvRnJYcU5jNDAyeVZIaFNDbUN6Y092dkxENjU4?=
 =?utf-8?B?QXBsT1JSeThxYk4zTk5JaW1sTmxiOHRzZkk1eWx1RU1wVHlSS2JZRHB2UFhn?=
 =?utf-8?B?RmxzWmNPQlVmaGV1WlhMNUlscThKdnByN3RxVTMvVGlOdWtYSXR6b05oempz?=
 =?utf-8?B?ZnA5NEdPb2xUR1ZOMDhrenZPbDJnNExrMU5ReWZKU01jS0pBYmRHNmpndlZQ?=
 =?utf-8?B?V3Erd2Rnd0xFR3VaN3o5blhBdU9EM2xyWktrMEo2eFZPUTUxKzU1Z2VwTmtH?=
 =?utf-8?B?R0JlMk5JZWtaYXNxZ1BsSUtlNllvSXJucWp0cFlKUHRLaHlHSFZJRWNtVlVO?=
 =?utf-8?B?MzdXWkJUaThIcHJHMldWU09paUdLcHJTOXFpTWgzK25CNzlVWVh6aGpnMUxs?=
 =?utf-8?B?VVRiT2FrbWkwelBnUGlRWEVGMFM1VEhYWWZRUlZZN2pCT1prbUN3VFN4L0FS?=
 =?utf-8?B?b1ZxSHQ4TkZ1ZUowVFhZaHZwQW1XK0lya2RwL0dibEs0UnRtQnFOZ1l4Zit5?=
 =?utf-8?B?MkdnajN2bmFUZ01kNTZnaXl6eFdmT1hmUlNpM1JlcVlMdXJmN3ZhT3pWdmFy?=
 =?utf-8?B?OVlWRDVrdnpOdzNocmZnc3llZnNTRlQ2c3FnK0JpRVRaeTdaNEljeHlVM2Zz?=
 =?utf-8?B?UVcvRldHK2ZFdmZ1cVFHQlRmeSt2clNHTi8zQ3pkQ1U3M1UrMzQ2eU5xZStJ?=
 =?utf-8?B?L1FzWjZ6NlBFZWlmSEloaXlDenZZSHhwUXdGd0VYV0ZMOHc2VkNSeWlnMnBo?=
 =?utf-8?B?MEsrKzk5MGV4MGhXY1JYdW9paFdmMGxWWFFQaExGdzZQb25Sd0dLNWp2dy94?=
 =?utf-8?B?TXhJQjh5YjRrazZzTGNnNDZnQ3BtMUZGa3c1QzFNUUlIL0hrUEtEdHVZclB3?=
 =?utf-8?B?Nm1LQVlkcE5DR2gyOXgzYVltSEdOaFZKcXZOZlgyTmFBRzdpUnpNSUFTR1ov?=
 =?utf-8?B?VWZTQjFhWTAyZlFlVTdhakVBU0JsR0YrMG9PZW95ZEs5cGROc1Z2NFVDVEdr?=
 =?utf-8?B?NzNCVmNnYzM2Z09xdTVlbW9rU3NnUTlpTDVKamExTDJJd3QwWHF1QS9PbDVN?=
 =?utf-8?B?MHNNeHFlcnB2bVZEaU1LWW85bDAxWjkxcllZcXJZZ1IycTMyTllXUm9TL2ha?=
 =?utf-8?B?a2IrMUVFMGhkY3lhY0doWERTa3cxRlkrNmhYOXVQdGd3UThMRmI2ZUZhODlW?=
 =?utf-8?B?aWo5bTJkQWFNcmJmLy9NaGJTcUZWV2FYYVZQRlc2V3N1OHFSRUJEMERuVDhs?=
 =?utf-8?B?SndyN0U0RE5NZGhvUERGOFNuK2FIVlV5TG1Qc1JiNUZ2MnB3OTMvM01lTkZi?=
 =?utf-8?B?V2pqcDh0bEF5aXRSazFXWXBaSERxY1kxSktrSjZ6SE1WVHB4SStIaDA5bDhr?=
 =?utf-8?B?UWI5cFVETnJBb2dtcUY3OWxqcVNEUTA4MnRTbXdaUmRXOVVKcVQ3S0JRZXBr?=
 =?utf-8?Q?oSGOhwprgNI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF67C992ECC.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1RYcU5vVC9pVXVzcllYeStSeFVYbkFUcGtpQmdUbXRlMjJJZlN5RXQ3Wnpm?=
 =?utf-8?B?c0RqblhHUXYzQlg5Qnl0ODh3bEZxZFJ3RjFYM1NkbWR3Q3RGcmlnSm1iN1dw?=
 =?utf-8?B?eEMza2JzUmw3dTlnY0xiL0REODZjcVlNY1BkRUxOS2ltVjZGYlZTUURQUHlU?=
 =?utf-8?B?aFBDUmhiRkFCdUoxNWFUUFpFYW5EMUV2TURGdkg5d0pOQkVLbkpBZXBUWWFI?=
 =?utf-8?B?SW9zUVZ2Q1FNa2h5Kzl5S2NtTzY2cndrTDluL0w4ZlQvWEVOUDFlaEo4THgx?=
 =?utf-8?B?S2FUSXcwS1p1MzhxUWczQWFnUzRJSDBQaUsvUS93TmQ2dHJjV0VvaVFHT0Rh?=
 =?utf-8?B?QkJraUhTR2daWGRiL1RKVy9KczdMRFU0K2paNm0wWWNNOTNmeVZ5VnQrcmdw?=
 =?utf-8?B?ZmJnaWpYeDMxbXBucUZUU05QdlFsMC9nZWVKaTBSMWgwMWlzOHpoeTN6bk1X?=
 =?utf-8?B?bVI5NytnOHBZbXc2VXNMWW5iZmF1dCtMekZhMUhXWDExS2hrdVY5dGp2NlNu?=
 =?utf-8?B?TVh0dmJwVmhpT0ZNTzkwZFJ5TDIySGJHcmc1Y1FZbVVXeGo5OEo1MERZWTdz?=
 =?utf-8?B?aTNEYVdUeDJzMkRuY3h4c1BCV0NHYTVGL0xPcWhaWk1walc1amZoOHhnL0gx?=
 =?utf-8?B?RDRDdFFUeDZBdnNVY29YQmN2SlpXUXBTWk04OWxOMzZiTHlOMzQvZVl5Njdn?=
 =?utf-8?B?aERGZ2NoVTNZdEJ3Rk1iQjJyMldJTGlacXVmOGgzbUxhQ24xcm1LN2gyS3Ji?=
 =?utf-8?B?WkcyWHRuVFlodzZBOXVDSVk3SkJ2Q000dGJ1VkQ3cTgvdThCN1pwQUxDbGcw?=
 =?utf-8?B?WlJjenRVYTg4dmxrRllkamlzNTJLTitqL2x1QytOL3cwMzduSzF5QUFQR3RT?=
 =?utf-8?B?em92ZUo0NmQzb0VQTVBoVlltL1BnUzhSaVluVC9UVVFsZWNxUkhFSy85SVFt?=
 =?utf-8?B?bVg4UUU0YkRzNTlEOGh4eGdQS29rWVpPN0tmWkI3WE1XdGRIMVBIekcyRVZt?=
 =?utf-8?B?d0ltSXA4Z3hVaUlxVGx2cUoyekNSTHdoSG4yMjdhWG9uTnd5R0tyL3FuWmR6?=
 =?utf-8?B?Z1VBbTFPWHFPckV5clF3dmloWU4xSUtzSVlHUFVma2VRMlVIQ3MwZU84bzRE?=
 =?utf-8?B?bTR3SFdnQ2QrMEpnV1hjd2wrdm0wc2pqU3dZMTczdUtKeDFTL0MwRVJvenkw?=
 =?utf-8?B?YllOU3lBNUVIT1BDbEM2Q2hDSVVxMlo0cGRMYXVGNmRkdi95MGUvMXpIRnZO?=
 =?utf-8?B?VFBZTmFBanpUY2xPSTBvYXZuMU10a0FZNi9TbStRSkRHK2tVVjVDVGk4bjhn?=
 =?utf-8?B?VEVYVDNOcUVnM01MeldwNlNsdW82M1l4aUF1MDFzQkRwVm5SSC9kYjVSWTFK?=
 =?utf-8?B?RTlxeCtEZzNLTmMyNHBTd2FlZHE3KzE3d0lqd0hJVWp2WFAyV052WkJOWWRN?=
 =?utf-8?B?bXdFaTVPZ3E5dzlvVXVRVkZwbVU0ZGYvS2ZnTFg5MUx2anVPZTRyWWo3STd1?=
 =?utf-8?B?NmIzQjFQQ2xYeUlMbkp6RFA1cVIwZkxoZmJRMlduanpuYXRVeVBIMWxER3d1?=
 =?utf-8?B?TVB6SWNOVFluRVFVZXhYM0ZQV01xNkVPUW5RSHFQdWQwWXlKOUoyWTU0bmNZ?=
 =?utf-8?B?SGVxRlNVNUtHcEo0R2FUelJIUWhocUQxcHJCbmozMXh0OXFtbDh1ZHFYdFRJ?=
 =?utf-8?B?NHhIWUNjRlR1bTVDcXNlN2htRmJPZmZGZHMrSEM2ek5iQmJxU25TTVgyQjlP?=
 =?utf-8?B?cEZzRlFycndFNlE3N241endlRDJnWnNGSXByNlRiWi9QcDFvd0VaK2swNUx6?=
 =?utf-8?B?SjN1RDY3a3hPeWJTQWxMUXIzd0xmRWJBUkJEWU85Y0g1RldBVGJhMG80cEhx?=
 =?utf-8?B?QWVyVUV4OHhNMlFzY29oWVZoL3RWMEFPaCtQSEFzbFRIVTlseDBqcnJkVHRI?=
 =?utf-8?B?bFZPcjlHT2Vyb0pIVnBaSmRrUHVqbWRZUHlxeUF5djJCZlFNNDFYVitUM0tM?=
 =?utf-8?B?a2g1VFZwdTI2VXNZOXpVWnNTRzN4SDl1SWN0YXZEby9tTVZSZmJ4Q2lxeHk2?=
 =?utf-8?B?dEM4N1V5L1RFYWlKalVmanJ1OEFzMXFVaUVPRjBqTGk5NTBPUlh5UjlPQ3By?=
 =?utf-8?B?anVsUHgrRGNXRU1WV2ZRVnUzekRIQjZXL2lGZzRlZU9mMW9jZ2o2cmdJOER6?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 752cce72-4f88-4a58-f62d-08dde91a3007
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF67C992ECC.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 05:41:24.3910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IW9rYm2WKpHqU1MXNfWFesnE7krMQ2+hmoSbgia7sjPyUWKd+YeQHR/aix+M3+jPRYV1qbI0zX5DzjPbQOSPKDz7TnQaGIxHlXA4GN1z4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7836
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



On 28-08-2025 19:58, Dan Carpenter wrote:
> On Thu, Aug 28, 2025 at 04:18:11PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 28-08-2025 16:02, Dan Carpenter wrote:
>>> Hello Himal Prasad Ghimiray,
>>>
>>> Commit a2eb8aec3ebe ("drm/xe: Reset VMA attributes to default in SVM
>>> garbage collector") from Aug 21, 2025 (linux-next), leads to the
>>> following Smatch static checker warning:
>>>
>>> 	drivers/gpu/drm/xe/xe_vm.c:4442 xe_vm_alloc_vma()
>>> 	error: uninitialized symbol 'default_pat'.
>>>
>>> drivers/gpu/drm/xe/xe_vm.c
>>>       4396 static int xe_vm_alloc_vma(struct xe_vm *vm,
>>>       4397                            struct drm_gpuvm_map_req *map_req,
>>>       4398                            bool is_madvise)
>>>       4399 {
>>>       4400         struct xe_vma_ops vops;
>>>       4401         struct drm_gpuva_ops *ops = NULL;
>>>       4402         struct drm_gpuva_op *__op;
>>>       4403         bool is_cpu_addr_mirror = false;
>>>       4404         bool remap_op = false;
>>>       4405         struct xe_vma_mem_attr tmp_attr;
>>>       4406         u16 default_pat;
>>>       4407         int err;
>>>       4408
>>>       4409         lockdep_assert_held_write(&vm->lock);
>>>       4410
>>>       4411         if (is_madvise)
>>>       4412                 ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, map_req);
>>>       4413         else
>>>       4414                 ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
>>>       4415
>>>       4416         if (IS_ERR(ops))
>>>       4417                 return PTR_ERR(ops);
>>>       4418
>>>       4419         if (list_empty(&ops->list)) {
>>>       4420                 err = 0;
>>>       4421                 goto free_ops;
>>>       4422         }
>>>       4423
>>>       4424         drm_gpuva_for_each_op(__op, ops) {
>>>       4425                 struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>>       4426                 struct xe_vma *vma = NULL;
>>>       4427
>>>       4428                 if (!is_madvise) {
>>>       4429                         if (__op->op == DRM_GPUVA_OP_UNMAP) {
>                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>>>       4430                                 vma = gpuva_to_vma(op->base.unmap.va);
>>>       4431                                 XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
>>>       4432                                 default_pat = vma->attr.default_pat_index;
>>>       4433                         }
>>>       4434
>>>       4435                         if (__op->op == DRM_GPUVA_OP_REMAP) {
>                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>>>       4436                                 vma = gpuva_to_vma(op->base.remap.unmap->va);
>>>       4437                                 default_pat = vma->attr.default_pat_index;
>>>       4438                         }
>>>       4439
>>>       4440                         if (__op->op == DRM_GPUVA_OP_MAP) {
>>>       4441                                 op->map.is_cpu_addr_mirror = true;
>>> --> 4442                                 op->map.pat_index = default_pat;
>>>
>>> Maybe we *know* the __ops are always in a specifc order so
>>> REMAP and UNMAP come before MAP??
>>
>> True MAP is always follwed by REMAP.
> 
> s/followed by/preceeded by/...  

yes it should be preceeded by.
For this to avoid an uninitialized
> variable bug we first have to process the UNMAP or REMAP before we
> process the MAP.  The more I look at this the  more if feels like a
> bug, but okay...

Your analysis is right. REMAP or UNMAP will always happen first, which 
will set up the default_pat to be used by MAP. So the default_pat will 
always have sane value for MAP.

> 
> regards,
> dan carpenter
> 

