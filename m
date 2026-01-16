Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8190BC982D1
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 16:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B9D10E8F7;
	Fri, 16 Jan 2026 16:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQYm0b/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBB410E8F8
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768581814; x=1800117814;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AFn/TuNaB6xJ2aX/RgAKsfg5WjvXkL7Mbf9H08++unM=;
 b=JQYm0b/PNJ+yS6At3Xe42jkbU4nxp5KJUFOmJDWO+RgMUwkuRv2IWTlp
 4M+jLhhWSCqaQpE5FtL1R+nFFKl9fE/LE/taeQNPcGjKrHZaDY7sbxrNT
 nSxQI/TMWbV/zdGJ8wJdRFnyQ/lJjlx/l+9l/PfXa0eiLcxpC6+d2Er84
 jHDtTsqnTuZRrVwe015XAyLLtD26zMr6MSaxM1O8VkaINzEgsYaHlUCVi
 4eeuFLtrDGgAecPnyRS1heCaiPUJAtk4dsJU+HqCPJImj9GndLOYuB7Wj
 DGRHbgFeuZnW+iVPPJF4Nd7+OPPM2jUfLfwSsXA5sy3/sX+rMU9XLpyCO g==;
X-CSE-ConnectionGUID: 0yvg8SdzQiGu31BS5dOagQ==
X-CSE-MsgGUID: jboO6W7iRzyvEZofOb7uiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69810079"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="69810079"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 08:43:34 -0800
X-CSE-ConnectionGUID: 0Tkw/KTuSAu2Dr6kE1gt2Q==
X-CSE-MsgGUID: OCq5ek+XTvO3PN9YuKm/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="204504225"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 08:43:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:43:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 08:43:33 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:43:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3dGxhoX9OifyFOwLrpINQXwYbfkTsdix1J8agZOOgz30RDRWAxFcbC4JsZK6Tf/GUGIaVVCyIYhpUGaIAHHVTvbj2aNWvvthC6kYeYhi2Uis4xHrCDtQHJkyT3p18souHIjnaDrGVgu0T/aQ5/12McBz83ofgNZzocaJuOeE5Zz95lqaNlhpb4UG0IsfEkGaq0n6Db05ocmMwefvvx4KEmqnmbYakPoZrb6fdEu+dvVLg9fJ4ddJNJOmtgSwuoPbxgT8rvlIkiW08wicgVzHz0dgP9NuvtHcarBUR8VbV2nSnhFUSsC4jsHGiX6xl1nANx7rwxo+zlorYqsCYCcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlBLFu/Oq2l377TKhqprujmz15+ybYvLfZ3T9y+BSlo=;
 b=p7N6Vokc0m3nopQLI1Ccc8NtLSzVXUcNRCyYAopfpw9iGTPzLTGeeWFGb9AFcdY4SEiOCVphS49ps07ckWWVQueK82smtpEs+vbK3mmeed/FBzZC4Q2dfa+CuzU87nO7PMxZA1tjq2gIwzVnWa88CNx5rOq7vsmcmlMAj7sGWKTLtq/oPqmMTUnm/f1FgyIDKm13O4AL0baqfsok6Uyi0+qMFg79Bo64RB81hKI8hX2paO0yt9JXlC6K+5InQ1L9m+4QoFDJ7rKOQtPtYyKOnljSpcMnGnAv7/xJF9zi7MVBLd4efQS8mbLkfrIqzb07hYbakBaHE2GD/ZobkTkdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Fri, 16 Jan
 2026 16:43:29 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 16:43:29 +0000
Message-ID: <c0d127d4-4219-4d92-8398-e971a815822f@intel.com>
Date: Fri, 16 Jan 2026 08:43:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
To: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Carlos Santa <carlos.santa@intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWoPKWxu7zIqZPog@fdugast-desk>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aWoPKWxu7zIqZPog@fdugast-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:a03:100::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 430e1918-dc30-4e6b-615f-08de551e6069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXdtUk15amY2MzdmZ2Rxc2diR2I3N3kzMkdGL3VRMVQvM2g3SzJmbHFVZVNi?=
 =?utf-8?B?VFlTU0R5cDN0dm1HRC9RWHc0Y1NmbXN3bVYrWlltTFF1WHZxQ3crbHlXcEFm?=
 =?utf-8?B?dExKbFJFaFVsZ3pYY2VvOEh1Vm1hRGR6Tnp2bFhuUEdiME5EMEdnRTk0U3dp?=
 =?utf-8?B?ajRlTXArY2s0OTd2eE1mQ2kvc2xOcTRkaWFvSGhrT1Y4OFp6SFdpUmIrSHMv?=
 =?utf-8?B?ZDFod2R6TThWRXB2Y0FJQStSNldtRUJkbDhLZWFHV0hIV25IZ2JWQUNNeXRS?=
 =?utf-8?B?T25CM3pkUTQrK21OUkR3blpJWmNhUXNFdjVhQkY1bjJKNTBuVCtTa0xIRER0?=
 =?utf-8?B?ZUM5bCtRU0J5dDhmY21QRUQwRlRpd3g3Z2FSOFRMZFR1MzZ4V2RnaldkRGZs?=
 =?utf-8?B?WlJkaHdpMEw5L2lNVm1heDJFczZSTTVsWG82ZVZ5V2pJOXFCWVZVTXk3clR1?=
 =?utf-8?B?YlpTWjRCMTlUWDJHYUVsd08vTU10RHlsZFdobjJVNFN0c0x1Z0duVVpiYkpr?=
 =?utf-8?B?bCtFUVhNbWRJZ3NSM3MxK0pQdm9lY09MM2RBVHdOZVdrbHIrbVVucXZqUkdp?=
 =?utf-8?B?N3JoZkVOMk5hcVRiaWM5UUR3QkhBbitrTUM3dGxEa24zU0NzMFhKWW5aejQx?=
 =?utf-8?B?c0VEdFM4S3ltanZwY2dWMW9PT0J6dHpIT0llck11cGtzcmFzWW9jemRGMHFH?=
 =?utf-8?B?dXBIRGlOODBhVWxxREYrcHBsc0w5RlNXKzlYaDdQRE9VT3BKMkRId3RvSUNl?=
 =?utf-8?B?bk90MUZlWWR0S0ZsNytSUnkxVXpIRDZjRjYyNFF5bm1nc0Y5WWFFR2N2bkNo?=
 =?utf-8?B?MFU1YWtabUUrSE1WbWxZMU9WWW5WU3l0UjVYTERack5VR2t0Y3dvcmlMc2Q2?=
 =?utf-8?B?UE9aS1dySS90bmpKY0E3T25tQWQ2YjhSTk1yL1RYcFRpdElTSlVwbkIxMTB1?=
 =?utf-8?B?SDhLbXZzVjNSeno4UEZ3ZlZMY0ZiSmdSYnBhT1RNYThPNm9mZlQyeElSMTky?=
 =?utf-8?B?b0w2VFI0dXBad0dTQjZUVGtJMnBENHFDM1dTNmlySFEwbFJJY0VWWWw1TW1z?=
 =?utf-8?B?Q21Ra2l1SEtlWUwvWEJzWmF5SWkrNDI5ZWRZODVwQW11OElNUWJoTDlycWFt?=
 =?utf-8?B?Y1BWc2JkQnZkY3JsRmtMaGd1ZGVjZ2lVb0s3OEZuZ0pYUFVPZjVnb3E4R1d1?=
 =?utf-8?B?S2Y2S3p2OU9saDBkZm41aXR5Ynh0VVhQdXI2UGt0b0hVMTJuTGFRY2dLQ0FX?=
 =?utf-8?B?MU9Cb0JZcGtPdlRNWi9NYVBrRERvK25EbFk0WXNBUVRibE9NUEovM2ZZMnBC?=
 =?utf-8?B?ZGYzN1NBQ2NyQkdmZmFTbURVR1hzQThNZVBGT0Y4aVp2TjNXU2lVZ0JwSEFq?=
 =?utf-8?B?ME9TMHZJa3V4ekpBcGtET0oxcUZhWUl4MjFYMkpDam01MjJWdS9ocUU1UE4w?=
 =?utf-8?B?RTdGcElxazBON0dKQ1kzWUJWd1JXdlVSZGduejVxellMQzBHNVlsaFFlQjFT?=
 =?utf-8?B?N25XVmhXdXo5ZnV4SXZhSU5xRXQ4ZUFTclBoU01TUDRaQkQzaGRjS3ZBbGRW?=
 =?utf-8?B?eHMrNGVhbWVPc0xNb0Q4Nk0zV0FLVk43dUVpN3lBcnM5T0ZSZzBuVTA3dmRu?=
 =?utf-8?B?QlNBSUIveEVGbnduU2pTbW1kZ2VFaVFPSlczbGJhK1FVV3N0KzVBWG1KZUtI?=
 =?utf-8?B?bXJ1VHVXY2phc0k3MU9mZ0xJaDQxUW5Ka3d5QitKVDgyYkNsdkJCU01VRHpS?=
 =?utf-8?B?eWNmTnlUcTZwS1RQZHYvdU9idjE2VW15UldQWUw5eTV6UG9QWUJhMkRPaWtx?=
 =?utf-8?B?RFJJenZQdmdHMm5LTHZLTmpyeU4vNGJoYnpsUWh2emdRZW5INUFGYkJxTGlZ?=
 =?utf-8?B?SjRxbTdtUVdqbVZrRUh2TlJqNmdNQzk4eEI2am9HeG5mZENLTW9jYkRuVzFT?=
 =?utf-8?B?c1pxUXBpVG01WENOQmhKMERMeDRjaktOcCt5MEFuaUs5RTFTeUt6dTNXdFRa?=
 =?utf-8?B?MVIvK05Hd0pnZTVkYWJwMUVTWVI3NEV6RjhqVVRkd05BT1FQSDRxL0RnYTFX?=
 =?utf-8?B?b0daSTh2c2kwdWNrcGFlTXh3Nm1vcFdsY2lpTGlsRE55ZFJlRVhzY0lKQk9y?=
 =?utf-8?Q?eZMY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmVUVEZxM3k2dU5tUkVycWxGaU5MWmRLSXd4eU83S2x1MVpEZlBGMkNPWGtF?=
 =?utf-8?B?Z3BvRlhaR1dqemZVRjh0TUZ1bUVBU1V0c1JRT1VlRFJTYlF1VTduVXV3dm9O?=
 =?utf-8?B?emdyZGlHUjJ5RzlyZ3dIOTV6TXdZRlhhNlZEQVBOT1VydE83RGdkMk1meURR?=
 =?utf-8?B?cUJHUUlGczVhMG12STdidGtjSkVId0tCV2EyU2pRRDh0WnBvc1hWeE5KVGwv?=
 =?utf-8?B?NzdRYmw5dVBKblI0RCtYZHUwOHRGWlB6NXhjbzFkdGQvT2tWQm91eW9aTy9Q?=
 =?utf-8?B?dHI2Q1dLdUxSSWphaTZxUUhqVWJDVUw2RXZMbHJjaTZ3bE1POEVrbUpyTmNS?=
 =?utf-8?B?RnRybjluY2VNbE8wNkk5MHZoVy9kTUk1SHRtZWVVWmJXZCtkOVV0VFAyek03?=
 =?utf-8?B?dHUwWEE4OGMwVkVabncwMFRBV0hybFdrY1dHY0N0bUdxbmF1QkJLRzBaVVNt?=
 =?utf-8?B?NU56dHV5ay9oUjFwYWpkZXNFQWZERHRVRzdlQmltR2oxcmtUdnNyLzh4NnVK?=
 =?utf-8?B?ZWpveEZRc05ySExHTU5QSUNYZGsrajJHeVh0eUNLTTI4OExPSFJOWkJYbmp0?=
 =?utf-8?B?cFI2bU5jZnFKQlpTL2piY29MajJzZ0hPSUxMV0RUajhKT2ZKaG5GRUdHOWFT?=
 =?utf-8?B?MEMrVzcvYUJ4TjdwTkY3SHhyVEVYbWFCWHRJRE9WUGdKYklvWU0wSEZ5YUVo?=
 =?utf-8?B?MmpRS3ZTNFArWXNBNFp3QmNTaExWSmxQUkV5anZBSzJkN2RMZlNxVmJ5bXFm?=
 =?utf-8?B?WkRTcHFKTUNBTG1kTDd0N0oxSjFueC9nTjl4NEdtaGEvWDQ1UGN2OU9iM0lt?=
 =?utf-8?B?LzJtSUZIRW9MNEs3Z2JnT3ZKMlVmditZWmd0NFcyZUpBczRNR0JsTWpWcGJn?=
 =?utf-8?B?dW0vNXZlN1FOOGx5UkRKcnA3Y0EyZitDbEZ6VFpjekN0Q0pqRW5UQnVIRmhw?=
 =?utf-8?B?VS80WFN0Z2dzTzBucjQzZkdsZFpBaE5yKzRWUWoxUEl0R1R2WGFPZzFtaXNj?=
 =?utf-8?B?VkJ2RU56a1g3QTRoQm9TakM4Y3JuTGtzNnN0emoxS3dLTWE2RENZLytiMzQr?=
 =?utf-8?B?YnF1bGUvUlFzZDNsNGhHV3RPZTVDd0lvSzNpMlNnVVdBRDRMVnVpaDFISHVi?=
 =?utf-8?B?ZWxlNVh0Y2VnMFJiNFlnd0Y4VkxyM3V5V2NLS3dmYnFHNkZScGVGT1ZzeGtu?=
 =?utf-8?B?UVFlYTh5eWRzaSt3UHIveVdDcmpneUxPSHQrZVhaazJRZ0cxTUFkQzZ2a2xp?=
 =?utf-8?B?c0QxdHVBZnprd1JjME5nYWJaL3M0VHVGWnBpeUZheXRJaVA0ZUdKbDNLMUpi?=
 =?utf-8?B?NHFyaElFRG5DWEt3QmZMVHQ0dlZyK0d0L1VHeWEyVzY2eXNBMTNma1FON1FD?=
 =?utf-8?B?Y0l4ZWt1OElYZFdwNStGNXpKS3pkNDlHbzFJTWlpMzZ4VXRyanNucHU4L1ox?=
 =?utf-8?B?Rjh3bE1UNWgzTjg1ZmthSGFscVRrZTVyd3NzNkdUcXdOVGdHeXp0Um8wSjJt?=
 =?utf-8?B?SDdPZTNFWW5oMm1Mc0xBZGttbUVTaXB6eksrMzhLNWE0K0J3eFNwdVkyenVu?=
 =?utf-8?B?cGlPTkZWZzZVUXZ6MWdoK0oyMlNPUkU5NXR3aVVuS3lyd0ZTMEc5YzFhNzhQ?=
 =?utf-8?B?cjRudGVXOTY1OFhaV01TV3R1Zkk3MDVOeHk1dy9LZ2RxbnJaU29HY25TTWEr?=
 =?utf-8?B?cG9DbDRzR1M1a0tuK015VDk4dzJBaDNQZmUrazZZNlFpSnVDOC9ESDQyTEMw?=
 =?utf-8?B?Wm9Uc24xWDBSRk54REkvSkN1Z0pSU0Z3YVpYakV4aXFGMzNadDRxcGYzSWda?=
 =?utf-8?B?amUyUXVsN1ZETkJyWlk2Qlo0VG8wSjl2S3k0cFdiRkdqUzkxQ3dNSFJpS290?=
 =?utf-8?B?ZkxuT0hBNkJINU0zSmoxZ3FZVXJQTE8rRnZoS3dDWHZSTU1yMjJJRDBQQXdr?=
 =?utf-8?B?aWc0QWVudEVVamdBdkx6ZVc5blVCZlVyYVZrcDZZRVQrbldOemFmRG41NzY5?=
 =?utf-8?B?eXZpTHN1WVhyQkpOdDQreTRNMmpXWWppU2xwOG5JQjQ5ZnRsS3BxME1JbU5u?=
 =?utf-8?B?R3ArdGp6L1FpN1F0TTNGVUErUTJWZG1mRjF1TjFjTVVvNmd5M2h6TmpLSGIz?=
 =?utf-8?B?U1hrVk5rbzFQYUVheVdMVTlqVE50VE82V1FUemRZcTdyS1h6diszdHZCS2po?=
 =?utf-8?B?a2EyNDRUd0ppUFBiejRMK29MV0FSSGxydGl4QkcrdDNYOTN5QUI3dm0vQmdR?=
 =?utf-8?B?Q25mTjVmbFhMNFVPMkx2UnpXZXJHZnRtVVNtanRQb3VFWWJvUGQrQ1VmbWlu?=
 =?utf-8?B?dDhmcE9iOVlWQUQ5LzZqWkdTenBFRVdKS0E4d2k0azRVemd3TlVBRnU1d0Ft?=
 =?utf-8?Q?MgYzK0PeQ0il61Qk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 430e1918-dc30-4e6b-615f-08de551e6069
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:43:29.1436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgQKTvaMMiLrRXgiiFnRS5fNuNAu/mA6lJnLsSq6Py4adw3FF0ql0GhsHmTL7HFEGL2ZVOrAv2f01nowaQWoN6A9RerZitfMyc20hGc8M00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
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



On 1/16/2026 2:12 AM, Francois Dugast wrote:
> On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
>> On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
>>> If a batch buffer is complete, it makes little sense to preempt the
>>> fence signaling instructions in the ring, as the largest portion of the
>>> work (the batch buffer) is already done and fence signaling consists of
>>> only a few instructions. If these instructions are preempted, the GuC
>>> would need to perform a context switch just to signal the fence, which
>>> is costly and delays fence signaling. Avoid this scenario by disabling
>>> preemption immediately after the BB start instruction and re-enabling it
>>> after executing the fence signaling instructions.
>>>
>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Carlos Santa <carlos.santa@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> index a1fd99f2d539..cd645ee400b9 100644
>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>>>   
>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>   
>>> +	/* Don't preempt fence signaling */
>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>> +
>>>   	if (job->user_fence.used) {
>>>   		i = emit_flush_dw(dw, i);
>>>   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>> @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>>>   
>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>   
>>> +	/* Don't preempt fence signaling */
>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>> +
>>>   	if (job->user_fence.used) {
>>>   		i = emit_flush_dw(dw, i);
>>>   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>>> @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>>>   
>>>   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>>>   
>>> +	/* Don't preempt fence signaling */
>>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>>> +
>> IGT tests which calls compute-walker, then bbe are asynchronous (don't
>> wait for completion, pipe-control is necessary to wait on
>> compute-walker).
>>
>> May you try to put arb disable after emit_render_cache_flush?
> Thanks Zbigniew, xe_compute_preempt tests do pass with this change:
>
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index cd645ee400b9..d8cceab97fa8 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -405,11 +405,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   
>          i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>   
> +       i = emit_render_cache_flush(job, dw, i);
> +

The pipe control in emit_render_cache_flush is preemptable, so having 
that before the arb off switch invalidates what the patch is trying to 
do (i.e., no preemption points after the bb completes until we signal 
the fence).

Why does disabling arbitration cause this specific pipe control to hang?

Daniele

>          /* Don't preempt fence signaling */
>          dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>   
> -       i = emit_render_cache_flush(job, dw, i);
> -
>          if (job->user_fence.used)
>                  i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
>                                                  job->user_fence.value,
>
>
> Francois
>
>> --
>> Zbigniew
>>
>>>   	i = emit_render_cache_flush(job, dw, i);
>>>   
>>>   	if (job->user_fence.used)
>>> -- 
>>> 2.34.1
>>>

