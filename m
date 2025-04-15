Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81D7C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 23:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4DF10E162;
	Tue, 15 Apr 2025 23:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Naeokytu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A4910E162
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744758355; x=1776294355;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=y+ju4xZQ7vLlQCus9cT6234eje4mzulZ+nUqNp9REmA=;
 b=NaeokytuUarlEO7DLKNBvacRKqQuh6rCVkbVrDkZJaNCuTIvDUuMzPcD
 2VMLSOS0dlPZmULx525wBDD68Zcz2AmUnP0VoGs9h7PRacWpwL/h4rRHq
 ppUXdqvYbYxzuvoFRvYpekfLMpUfzyVgg3voe0iXT4EnzPO8k/fIcdhuI
 2snA/jO9zep/5fy/9zzhjKnHjmN+Sp+u26Y7NDLrcMDQNrfkbKYQctVSE
 5T0Db01G5VAxl2NTCkdpxdmQ2S2ZmouYpD07uK/Opbu8YAgcfXWgcgEMM
 n/H6AAzs9Z62BEjrH17LVk39rLbgb9kQ4dffk57D0NzSliJwwjT7Hh7Id Q==;
X-CSE-ConnectionGUID: 9mEObFniQ52S3J32l3b1og==
X-CSE-MsgGUID: CkjgtQRCR+SbiNrckwVygQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56952171"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="56952171"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 16:05:55 -0700
X-CSE-ConnectionGUID: WxVyUSaWR2W7U+bUqiJqoA==
X-CSE-MsgGUID: 20mg3TuQRmasRxS2Ny7LXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; d="scan'208";a="135056387"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 16:05:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 16:05:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 16:05:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 16:04:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzCGbY2Bxq2LeBK+4n9TSUzIYBunR1vjTHrm3FR5cH4iS9KKQoZHlnZXZN6v2IWHaTdHgaDw4JMObj7kO3v2CqJtyJrSSk1xeoKOo0BnX9H+YB7YTnKV2IYWreS+ifGlA0ThMxhureZwAG4K3unl93bXhnmSfVjywjQ7rcXIZT1EqkWT420LUmXj27EhsMVkZoSbfs+68EQyCFYjR8JALyoq/UOZAtnPcESUv/yDT/36xkz+meUp1dQr+LYjHDSPqSShpIWFSgIhimpr2OTB1apooUYqnIAA9/lKYAGc6k25qZL3DOzq2d97LFy62R+c5jqK0PCqtucxVDvvADKV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9720LbvWrVdZM/Ra6Wrz8RbBuUcTzTdQVGES1Ixdm4=;
 b=AnkF4aSVI0kSGuaSFG8Gk4SpEx6PxG4AsdIdksS5ZuGjk8t1vrTf54ra9mwCfnRKzmHhjXTnwdQPkUb0DkpEWSDF4f5qXASY/q9+eXQ2fCwkD5bJPYid2pforlZxRhlhtJp9IROwXCPidhAzmOasZf1EZlBHJzZFGLGv5FVGfQGQQ3zoAEP0uzSb879GmE81iQj7heRwWBJkzCV4MkKFpkBQhesZixJt/jWkDu3IFMd5qRt+ijzijE4FyQ8h3ReKQwkZ/rzwbHz3vBCNVfPHraGKEse6S/nkVj3JoUK5ekzeI/iBl4Y9Eo99JhUMWK5LCwFknCegny1vysCtzcVcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Tue, 15 Apr
 2025 23:04:50 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 23:04:50 +0000
Message-ID: <6264db83-0cec-484e-b8df-719b704fa9d3@intel.com>
Date: Tue, 15 Apr 2025 16:04:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pxp: do not queue unneeded terminations from
 debugfs
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250415224845.1283199-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250415224845.1283199-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: b2669cb8-0eb2-4003-589f-08dd7c71ecf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmVXSlNlNkMzNE1DaXdDcU1jbDhMVXBMcXh1bHBrRFVSMThNL1d3NUdYanEw?=
 =?utf-8?B?bGFHWFBsaVBES1U2UGVRd1V3eUcyQjVzdUtvckdFM3cvMVRnM0pJM1ltMkw4?=
 =?utf-8?B?Y0lZWGdmdFZGSjZaSUdYOVF3NGRBR0ZuRXN4NXFvVFlTblpNUTA1NzhCbXA4?=
 =?utf-8?B?UWZ3dlgzQUNrRmR5YmhkSjhGNHh2Q21FVjhWL051S0d4R1kzSXVPNXFpVHBx?=
 =?utf-8?B?d3EyWVRUMGIvOXc3Z3ZZTUtNelBxSURDalFXUExRc0tuRlFWTUk1WkFXZGtI?=
 =?utf-8?B?MkljZW8vT3V6K0d5TUhLcWRaTW5BdDBxYTlZWUJ6dGdoR1c0RGV5MEJlVEhS?=
 =?utf-8?B?cGw4Y0dvN1J0VEl6NmphOStiNG5iU0FodkgvVVJJMEgxUVArVFhzTFRnNnhC?=
 =?utf-8?B?T2MxM0hOcXpvWnljcFFuRFVxcTN5aU9tUGI3WDU5R2Z2K3lxbnFnQ0VqSzZz?=
 =?utf-8?B?RGlta2NydVQrVWZ2RExDNTE0U0ZjQTl4RUtMQTFzM2c3Y3J4UUN0enNLYkxU?=
 =?utf-8?B?VWViT0lERFVEN01KMGgyNXhLTE9nb0ViQ2dRbTVKbjNuek10U2tEcjRmYjRT?=
 =?utf-8?B?SXFIemtOcDdqZXRwZXJDMmdwbVFHallydm9GZ2hycXVTbTdkeW5Wb1VmN05C?=
 =?utf-8?B?TWZvYVAwYWlCQm4vVHdUbkxBUjlXRWkyZjlOTks1MmhRT3kzcjROaXlCTTVQ?=
 =?utf-8?B?aEFkL0pCV3dFYVk4ZnRXS3JpcTRQSFVGRW9QVWJKTHh6NHZheElOUDZkL3ZN?=
 =?utf-8?B?RFpuUXBOT1JzWURvYUZ0eEE1ajVteUpUc0NrcnN4bHZGd1dBa3drL0VnS1Q2?=
 =?utf-8?B?NEJQU2JlSDVrZktES1R4amtKc3plS0p4cStuTGR5NGEraFRvamppLzRHbjI1?=
 =?utf-8?B?OHYxRmgwTnFGZzFJL0tRbmI1N21OdmRRUnIxUzBDTlhzc0RndjM4V05CaHBj?=
 =?utf-8?B?YTY3c0Z2N3ViY2FFS0RXTnc5MDNFNnc5QUw4ZFZLUHJQRDlSbi9ubHFNNTJt?=
 =?utf-8?B?R1JxTHg1dEFPWkNIR2tuYStySGJFamdFVThraWtQRzlnaFJ3VEc2VThOaFp1?=
 =?utf-8?B?MVA1RjEvaFFMOEJma1dQQ1RQNHN0cXkxYTI5QWxrTHk0VVhDRDgwRnZpZnR0?=
 =?utf-8?B?Z0NNRTkxTGJNMDJBajZyQ0dXTklUWE00T3pvcEp1V1JaTHJTWlVOcUlpNWZx?=
 =?utf-8?B?VU5QR3ArU0RDcGVMc3pKWWgramRIRXRVdVI3ckZJdVYraFpVSU5CTDZaaXBO?=
 =?utf-8?B?T3VUa3lZSlZFOGFXKzFQaUtLZlhnUWxOek1WQk1xeU9vMWdOdVJCaU0rTElO?=
 =?utf-8?B?MnlodE1RQ01QQnRwUjQvdEQ4YnhGQmxBMXExTVhYU3hkczZzUERrSm5nMS95?=
 =?utf-8?B?bXNJQUlObnJSNlU0ZjB4bXpEd2FWMXIvZDBNSmZ1U08xY2orUnlWQTE3RjdV?=
 =?utf-8?B?VFgwMjdHOFZxZ2JDb2pVTW14RklOajNuTlNUR1VIeTJnV3NIdmprUUlHTzV1?=
 =?utf-8?B?UlNMUFdEMUhHaHpkbDMyeWgxVS8zQnRjNEV3QXhvNjBtVjlFSkg2TDVqTGxm?=
 =?utf-8?B?ZnNIZ1E1RjVEQjgvODRZbERUY0VoN29HVmhzSHZUc0F2YkZGZm1QSEZhRElw?=
 =?utf-8?B?N2k1U2RQYjJVZk94ajA2eGhISVBNV2Q1eDNtTldPakNlZ202bG1hV0tLOG5t?=
 =?utf-8?B?bEtWbFordEI5NjUzT280QW1wQzYxZE56WiswQU1RUkU4dmVFQnEvekp4VGtZ?=
 =?utf-8?B?ZE5uME4ybjV4WnpNU0ZBeXp2RnR5L05qT1ZEVmwwOFRvQkx0Z2Q4ZEdKRXda?=
 =?utf-8?B?Z21MUkxwS1cvd1RHNi95SkR0U0hUcFhPT0UwRElVZjBKNmhYMHpub3VSdDFV?=
 =?utf-8?Q?OpNHirOdIGwsW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzFKUVd1M2E1N2V5eU11UWlBNThpVkR1Z1BvZlZqanQrRFhTT05XbXhhU3F6?=
 =?utf-8?B?YnFLNksrSmhXZ1BDMDFaQVIzQnF2QVM2eFJUcFozVjlqSkxET1oxc3lPVFgr?=
 =?utf-8?B?d0U3YTEyQUxDQ2VHMTdlVHhUZ3QwV0liUU1LVUw1SmVhb0pHUWgyUE8xeFpQ?=
 =?utf-8?B?Y2VPTFJEalYxaVFNZTNKQlg3T1RNZDR5TENDRGFNMnhGelYrL3BqWlJCeXMr?=
 =?utf-8?B?NHhyOG1ycSs3UWlRVURSdDMvbnFILzVINmNWVG5sdVNBSi93bkd1RkFPckVG?=
 =?utf-8?B?QWNYUnhnRjJUYmtwbWJVN2syR2RHVUYwUWtIeG5WeUQzUzZVVmNFanFReUhj?=
 =?utf-8?B?NmFyNFA5bURSZVdJcmlDVUducGd4MCtiWmxLc1JGRkJWNHZhQ29pc2Q5UmpF?=
 =?utf-8?B?ejRQbmthejdIWHc5UkxmbWdsRDhoaHR0T0JUUUNtdFFJVTBjSE9GcHl6QStC?=
 =?utf-8?B?THRxdDlHZTB0TkY0VFk1bWhGNURCNjVTMTJXYSt0aWhBZisxc0xiQWJ2WSt5?=
 =?utf-8?B?N2RUT3VlbzJFVmx2eVlNSXZBK3BkV0gwd3hBbU4wODhPU2xZQlNuU09BV25J?=
 =?utf-8?B?bWFpWFErdmVMdmN6MDNKUVVVdHdBanpoMzFDRVFsMVVwcFJiUnFYb21VODJD?=
 =?utf-8?B?cjB3TjJLTHJpc1lKUEhkd21iR1ZYY3dBOGUzQmZOTXJZTzNmTHc0cjlQR242?=
 =?utf-8?B?eFcrMWtvOXltRVhFZjZNZ2o4bDZGU3ZUVjMrekJtMlhxNlFsOXlDaVFSN3dX?=
 =?utf-8?B?azZJTzFUQ2RqWWlERmtoaXBSMWZQZmsranZoL3M1Qm8vbFpld2V0UXNDY21p?=
 =?utf-8?B?eW9GaUhsT2JRd3VoOTBiQlMwVlZCZ0FxNTlwbTFoczNuWE5xRDVXN0duMXR3?=
 =?utf-8?B?eXBmaitDeWRmcFUwa1ZoRC9kbzR3bXpzMWljVHc1OWRnWWlrTmI2V1hYSVdB?=
 =?utf-8?B?VFZ3TVUxSkRvdEFlN203Rk5GWTdvNGdMcXByMy9qTnlkL0x6NGlkOEN4Y2Yw?=
 =?utf-8?B?dEFibU1QNFlzRnFjN2JJREdnRFlYMGpuS29RWVNuT0hUOC9aMXQ0Q3ZlM1Fh?=
 =?utf-8?B?QnpLOXhtanhhdnc5ZGh5THBLYmtCWSsxUU5hZUVwSlUwQThZZHllbWN6L25t?=
 =?utf-8?B?M3NEYjY5UkN5clltK05TOFFVZXQ3Qm9iZG56elFTMDhvTkRUUG40T2dXTDVm?=
 =?utf-8?B?WGdNTHBSRjZtMnJ2Qk5ZaUE4dllyb0kydXZMV25KV05Wak5tdGM1eVFtSjVT?=
 =?utf-8?B?ZkUzRWJyWFFFVzFHYWkzT0kxSlRseVpYb2JSOEw0eDRMZEd4QjRONERtQWl4?=
 =?utf-8?B?MnZGZzZmMHhCT2IrYkU3TlQyNHVjRUJrQlVOZFprT1UyeWsxK3lZUnJYNmN6?=
 =?utf-8?B?c1NRZGoraUY3czkxcjZ0dkdtY2hiSVVINXFSc3huZXVOQllhZjhzb1J0SWZn?=
 =?utf-8?B?SmhDMEltaHdNK1JUYXlRb0gwS2ROMFpGNUVJTTNHMU9LcDBRaG5pVDJPMjJ3?=
 =?utf-8?B?VHA3QTBDc1RGL0ZJVE9lZUtSTjBiYlFZbWZYRDJRZTZzTjRLSmVqa29TQlRZ?=
 =?utf-8?B?WVo5T0taaVZ4RnVZekgrWGxxaHZ5cTBxZ25Kb3FuUG9zSmNrYkI2bHZxVU8y?=
 =?utf-8?B?N2hCQ2FMSUovdWxEdEFUc21aQXZPcnI2UDA1UGpCVThISjZpTGZDM1dIVUxZ?=
 =?utf-8?B?cUtYSTBRTHNLWHNpRXdCZTF2Q0N1MjBDKzFOaHZrRHJ2SUg4cS81V3BIQUZZ?=
 =?utf-8?B?cittUmZ2NTVGaHZHREUzMzh0Tm5kSDVDVHZRcXJNbTVvMzg2aGlJV3RFRyty?=
 =?utf-8?B?RmUrZWNFelZPa1ovMXV5eGdvbXRzSkNGMWFhR1g4emlEMGlwekRxL2VWb2Qy?=
 =?utf-8?B?T096RFpmN0NaWmpQNC9oZUZYVG45M2ZuWjMyeVVxakY1TmtWbk5HbDdtd2gw?=
 =?utf-8?B?RURRMTVuSDU1WGpjUXJSeEdKUDdpdVRWQnVycnJOL0ViUzRhNC91Y1dGaHg1?=
 =?utf-8?B?ditRMjhhR1dSeU5uUS9BeG1GajR4bndwektES0dsYVZaTHAvZ3cxVWtiTThV?=
 =?utf-8?B?M3h3bVJheGgwdWF0YTFMQk1oWFhRU3BHZm1LZjF1SFNEaitHR2lwUEFuR2k5?=
 =?utf-8?B?Y3QrWSt5bS9GamQ2YkEwSlZTcTJKT3EwN0M1THFidW5xQVhLRmFIVGl0ZDdO?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2669cb8-0eb2-4003-589f-08dd7c71ecf4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 23:04:50.7777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vy45lURn8hKn8rSHalIskwigrrwhgxTVUjKla7A4Pbq8K4iKhud2ag+8XDCciUQAvxRHOfddj6AMUk+VyxUhoWUyDA1pYLaxpEgQeQHrnxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On 4/15/2025 3:48 PM, Daniele Ceraolo Spurio wrote:
> The PXP terminate debugfs currently unconditionally simulates a
> termination, no matter what the HW status is. This is unneeded if PXP is
> not in use and can cause errors if the HW init hasn't completed yet.
> To solve these issues, we can simply limit the terminations to the cases
> where PXP is fully initialized and in use.
>
> Fixes: 385a8015b214 ("drm/xe/pxp: Add PXP debugfs support")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4749
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pxp_debugfs.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> index ccfbacf08efc..eb4a084103e3 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> @@ -66,9 +66,18 @@ static int pxp_terminate(struct seq_file *m, void *data)
>   {
>   	struct xe_pxp *pxp = node_to_pxp(m->private);
>   	struct drm_printer p = drm_seq_file_printer(m);
> +	int pxp_status = xe_pxp_get_readiness_status(pxp);
>   
> -	if (!xe_pxp_is_enabled(pxp))
> -		return -ENODEV;
> +	if (pxp_status < 0)
> +		return pxp_status; /* disabled or error occurred */
> +	else if (!pxp_status)
> +		return -EBUSY; /* init still in progress */
> +
> +	/* no need for a termination if PXP is not active */
> +	if (pxp->status != XE_PXP_ACTIVE) {
Having both 'pxp_status' and 'pxp->status' being testing in back-to-back 
ifs seems unnecessarily confusing. Maybe rename 'pxp_status' to 'ready'?

John.

> +		drm_printf(&p, "PXP not active\n");
> +		return 0;
> +	}
>   
>   	/* simulate a termination interrupt */
>   	spin_lock_irq(&pxp->xe->irq.lock);

