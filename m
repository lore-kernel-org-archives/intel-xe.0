Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2157EB26F1
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 17:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F66610E5E3;
	Tue, 10 Feb 2026 17:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+ZQXUgh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C38B10E5E3
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770743906; x=1802279906;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iO3ha8HlVFEKkMgTe10fR9rVTqN26J6YfrU+fHV3P/Y=;
 b=I+ZQXUghnQP2k6aFB4ZErmOdpaEG5SYuhoUmyTkumCzV46GAZJYlfQOD
 oTKCDdQVT5xuRQdllGbOlpsgOunp/nqzDQQZQUEaAp9y5JtdfjZXGTOQR
 uFv6xZmXIDgL4UCR4UEFedU+4aVx0Qu5nTXS3Q0vyoErh/nLz+uYV4wOL
 Nh8yamH+PDFsQX2PSCkLrRhZo1BZf4FQdk7J38yxGqg/gdVYrdfDiBA8w
 23flQ3Yf8sY45RfaidNmcNpLTFFLVGPW4+cTCfl3W2O5Z+I3h23Sy8KVe
 IHCWR7J1oS5XoJj468uKa/zWNEjkPUAt68X0O+BoSDK7MRqwyX2wCZmwT Q==;
X-CSE-ConnectionGUID: cssuUz36R4aDynQLn3/1Ag==
X-CSE-MsgGUID: 70qMglMPTsSdA0szs3JF1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75504902"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75504902"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:18:26 -0800
X-CSE-ConnectionGUID: pnBhfCzsT4KpgelfWrc3jA==
X-CSE-MsgGUID: aePIRcc0TBeucFWcyqy8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211806629"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 09:18:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 09:18:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 09:18:25 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 09:18:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tzp1MXdHr+PLqZ4hUq8CjASftUzqfzrzhe0m3cDjmC23VrTwvrDpKLMNQPdJGkHMJn7a71iGvJ2k2aHoYpetJoaJ2p9ikB40kiUAheFnyaXbh4THjXclmDflpDTxSZNBan1tvM3IcfeRLRCuS2NPcghu5wL3DNqSX947N9KdPn9m+DmbK6dB5bq993JdMEL4nz6NwDWq5J6DsfRuSZeEBb/cL+v68n0uWw9gQ6faAWrIMNAGFA95rTgaS2NooacSUUwN4eJHT4j51q1lNWqEb05SKWhsBh5Ykfg4OqugfMK3O24EkVHVkBq+Yg2s7rJYv/gnbK2Q+LWYf1bvpaxeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI0YEpI6/gZsWEdH2M8uy7NCxSCzp5QgW+0rdw6HEjw=;
 b=IICMVaFo/BrB6w88a3nmGvAYMN8GDTH/yVbYOUzntEYRj6xImrfKEm7EgBvWZOUVDfePZR1RoZo+R6VYdDBU2SJKmXeUKoU8ATPiQNPjcDIMQkIbGVPu+N0+QAH6Zd+vzh5mQ/1VjbuHSO27fyTd68dVrcJpKjTH4R1nuhfiYilCrWBiEls5cl6jHe5t8OzGDSaiEHaUiyNL/zaXc85iUKUeJ7NjBhHi1XfsR6omfCu5N7FRdABXimLbuS7BPgkv9KQk//6TbsZkcjQmLI352ugDi4WOJQFDUjZBL+LCyyqmjKT8p2IeXEEJxR+JZnJcWjQPb8sBMvwZRY+TtLpenQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 17:18:17 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 17:18:17 +0000
Message-ID: <43de4a96-2aaa-4dc3-8c8d-0bce63385536@intel.com>
Date: Tue, 10 Feb 2026 22:48:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Decouple devcoredump from accessing core driver structures
To: <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>
References: <20260210072942.1864182-1-shekhar.chauhan@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260210072942.1864182-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 586eacc4-7435-4313-2d6d-08de68c86141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGNIT0h3MU1HK29rcDFTTDVUSUJYUFBwS2JaMVdxTE94ZjdhM1hMQlBCbzl2?=
 =?utf-8?B?Mm9SVEF1ZFZSNi8xRUF6Ykg4WUU0THBER1ZTbzZndDMrWlBvVHBtdXF4ZjN5?=
 =?utf-8?B?NnN4TWRRTG5xYkJnS2RBblpmdVNEbVdrTHhxQVpCbFo2NVlKTlhLanlmY0tx?=
 =?utf-8?B?NlhtWXcyUkxpc2E5L2pQUHQ1RlAxZkoxclRicEo0QVJPNHRBSUhSTFF3cGRE?=
 =?utf-8?B?NWtoazRNbUs0cEVCRTh6ZjluSHd2SENsRVEyZlJMc3AvakVSZE15T0s1QklX?=
 =?utf-8?B?dG1NbUkvMTZGcnAwQ3ZsU3IxSFhQbE9ZOURpNTJtMFk4cVBWNFBtTEdKS0VE?=
 =?utf-8?B?VE1QUWhucFFDMGo5RFdnYUpuV3FSTmtpZWNsUlVjSUkybE9uYTNaOHRVQjVG?=
 =?utf-8?B?VUw4TFZiVjk0MHhaY05YekZBQjZCOVVQMGJJTGpEWDc2VVA2NUxLU1k4Qyt0?=
 =?utf-8?B?SVVaRWJ0eXN3RkhEOFdkYUpOakFKWjBhRjRYV0lyd2cvSUthMjNNWFNCakU3?=
 =?utf-8?B?R3l5RURidlgvVm1WZVdlclBPU0FoSXBsVXdhSU80SjdpMHZOc1RiM21ISEU3?=
 =?utf-8?B?Z0tuMXhGL0RJV0ZEc3ZDdlRsQ29UcmdSbzArSStQWDJnWkg3Tkc2bi90bVFT?=
 =?utf-8?B?TmY4YXVWK1pvV0FpQ1ZNeGJMdkJuY0txcWtkaVRBRTRIdDlGN2JNK0tDQ0Q4?=
 =?utf-8?B?M1RaRUZZN0NBMldxOWpCM3Brd2NZMThhUldvZ0FGZXcwN21FZnlEWDUzSGxv?=
 =?utf-8?B?MDR0VFd0SUMzcldpN1ZieVpXRkdUNy9SNmFNYks2YTR6MkJtVEpIM2tQaTN3?=
 =?utf-8?B?c0tFcktGT1R5WEtoUFk0L3EyQTZPWmZXdzFjdFA1L1NlakF4SGRjUUQ3cGhr?=
 =?utf-8?B?RnFkMmJhRFE1OWZXb1ExU2VmWmIzTHVWRHRHNnVITGg2M0dZdFROU29UazJp?=
 =?utf-8?B?MTlNNWcxTlRObGFNWXBrWmtrNEQvaU9iOVFSdEhLZFhMcDQwVjhUT3hGQXN3?=
 =?utf-8?B?VSs3MjI3ZUJ3UGRKK3BLZm1jUG40M0h5cUhZbnJvSXdYUjI1ZjlUQVVad2hZ?=
 =?utf-8?B?TERMSTRzR3hMN1J1RkxzWEhWSE5YUDhkRzJ5TjlSU3paV3ZGcDlBZFRib0Z5?=
 =?utf-8?B?ZDEwaXZhUjFiN1pMQ3JDZmZQTENPQWRES0swTVFWQkZxTkovV0RSdDhlSmZ2?=
 =?utf-8?B?TklsVEZkZnN5SFdPUkk0USs0Z2VudUZiNWdZY0Q2STVRNmxSQlR2ZzVhYStL?=
 =?utf-8?B?NGN3OWpHalNHMG1abmpwcjVCSmx4aVpaeHFTRzhTZ1ZjMUxYckZWa2dEU0ZO?=
 =?utf-8?B?S0hLMEpmaCtTZ2oyNnVpWjhVSTNuazZxSlhiV0dxYmllVHpFaTc5ZXZ0enJP?=
 =?utf-8?B?VzNnNUNmSDR4bW10aXFwOWtZREtkaXlmWUlxTTRaRHg2WFFMQ0hoMWhQUWR3?=
 =?utf-8?B?UW5QU2pUTVcyWUVBYjhmMy9CV0FLK3E1NnphNXp1Qmx2L1J5OWthd0x5R1lS?=
 =?utf-8?B?V1R4bHBBeFFLSWtlUFF0eVIyT0hEbWdqYkdOOG5ibDJ5Z2ZPVVdyMzdBcjNX?=
 =?utf-8?B?eFNydzVqRVVRM2dvMmREQTIrTlNFNFZXUzN2Vll2dVVBdWovM0ZQRStsVW9C?=
 =?utf-8?B?M2p6a0ZGcGdUZ0dyc1FZYzM0NVlZNDE0bEs2RG80RmZNOVNQeXpoZGpNcjNB?=
 =?utf-8?B?bTQ4NlZONjh5eEgvUGF5R243dEVHVlUrNDg5K0t0UklFT0JZU0xIQkRLMnJX?=
 =?utf-8?B?ekVTbnF6OHBmeXRFNjZJWlZTTjlaS05PVjRETmp0QkNBTFV2bmN2ZWphWHdq?=
 =?utf-8?B?WUJ0dmJqVzZFWmxTSGtFU3E3cHZpRzdFKzFZUVhhOHQ4L1FHa1pkV3lNT2ZH?=
 =?utf-8?B?RS96NGdsVEF4TERrdkNwMStWUFZZbjg3Nm1sWWtZL2RxOVpzbUNoanV6MlNo?=
 =?utf-8?B?OG83clMxWnNLSXNvT0xGTUVTa0hUcksrVmtUWlhkM3oxcWx4a1ZqM1YzaUZl?=
 =?utf-8?B?T1lwSlY1UDg2ZUd1a3daMGV6Y0V1RUlmT0o4MHFSRDVnMlBXS2F3ZjR3RUcy?=
 =?utf-8?B?REtDQkQ3Y3RzZHpQT2c2SzlTWDhDTU1sbTlJZ2pPbC9HdnBQVmlCZGJjdTBJ?=
 =?utf-8?Q?r94Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGtabHNOWVVBMGdFWGlZSmlIdkk3YlVnOW5JWENLbnpnZ08ycTF3ZzEvb2Yx?=
 =?utf-8?B?Vi8vak5vTWlMOUdRaTN3ZmZ1NEZrVDRBbHNta1RxTUVIRW9ZS04zb0tqYkNy?=
 =?utf-8?B?NUFwTSt3Z1lLRUFqMGIxdlYrQzY0SzBNUHBUWmQwZzF4bXRDS3R5bjUxR1BB?=
 =?utf-8?B?bkgwdExKaENwU2d1cUZ2TS9SYlE2czdDNmJIblVHdnBaU0Y2QlkrcVZ2TFZy?=
 =?utf-8?B?ZE9hZjBaOGowZXJrQlBpWmRuQ2RPb0c1bzBJKzF6eTRqd1luL1I3V0owczJS?=
 =?utf-8?B?alJtV0I5YlFZcDNxVTVrSk1aNGJKcC9IY1hZVkxTb09BeGxrYVd2MlowT1NQ?=
 =?utf-8?B?MXFlbEhQQ2QyRDNBcmd4cmxjOXpOcFBUVFJMYjdnTm5wUEd2ck9FWTJtT2ZK?=
 =?utf-8?B?NUxqM1VadWdPWUs2cHVkSTh5dTVlakxnMm5uWnRuVmhuV0RxakZiZmdGUjNR?=
 =?utf-8?B?eGhIc0hzaVVGZlRnM2FFNkxtdXVUL0VKQitUTnBId3psRkZBVFU5ZE50bDQr?=
 =?utf-8?B?WmlOaHdWeVNnMCszRWttWVI2VDRuNDZiU2JCTGJqODhNbjJMbEd0cy9Yc0l5?=
 =?utf-8?B?dHlpeHg3ci9JeWFyV0YvQW5aQjhMcjdJYXJVbXdER29iRSt5MFZIdXg5dSt0?=
 =?utf-8?B?c2xJbjJGSkFlOFl2dFFqVko5K01TMUlFTlJ2TG9qWkhoMU9HdVJ6akdoYUxK?=
 =?utf-8?B?TEFlcXB2aFMrSk5kMmhnNGpydk5hKzAvMVA0WmllbmZxM0ZNSDFmSTdBeEhB?=
 =?utf-8?B?bDBvT0Q4aVZWbE4zMStXRS9heDlPVVczSXpUNEZJV2NRdW44V1VWUmorY005?=
 =?utf-8?B?VzUvK3FQNkZFRE4yVXBRamk2NVRtci9vZWdIMHpUb3BmZUQyNFkrTGFNY2tJ?=
 =?utf-8?B?U01Bei9qeWJwZ1l3WUhjRVNqS3l3UkxGa0RPTWs2YzVyZ3JnV0gxMTh2TG03?=
 =?utf-8?B?RzRYdEhDYTN1NiswTVhCNGhRVWQ4SVA4TUo5T1k3c1FqMXFGaVM1aFJhZWtK?=
 =?utf-8?B?WGhQWkwzRWtkWUVtVGhncG0wang0WVM5QzZWeW1QTzBwUGRGanNQS09ORVMv?=
 =?utf-8?B?NHUwUVFGQVBWaHF3ZTRqREJnTmxqVjI0YXczUnZaVGFRR3UwNWZFeno0NjNu?=
 =?utf-8?B?cm5WQmhoNG13dWgzSloydlFTSHU2V3c1bmJLeTNKRkhsTWRsUkdBQk9Qamox?=
 =?utf-8?B?NzQ1TXF0cW5raTdoUGFrdm0vK2QxRm5hUUpDWTNWNnY5ZFpFbVBCTVpFSUVF?=
 =?utf-8?B?U2FtOEdhQzNZZ0VzMEVzTjlMV3BNKzVESXhlMjE0aVB3V0kyQ25NL3RsRjAr?=
 =?utf-8?B?Tk5oc0taNWRzTmFJSkRXdjRiZmEzS0NDUVFyRTk2b1RWUDBRbk81a0ZEMnBM?=
 =?utf-8?B?cnY5VFRvQ3M0b3pHeWwzYnRzUjNkYUw0NlN3UVhlUFhDRk9MRVRlM2M2bU1L?=
 =?utf-8?B?UlZJamp1L2wrOXFMdGkrcGJYWnRIbEw0WjNJTHZ5NTZ2SFZIcDM0M2tTTmxi?=
 =?utf-8?B?QmRDSjVZNWw4YXBtMmdJcHkvZGdibVNvcU9JdjhYU2dIZ0hGYzBOeUhudzdW?=
 =?utf-8?B?TmpwbGYrQlhnVXNNTktQZGtTYXBHUFJZWnF0R3VCYXErNjZod29VZFdLNFFD?=
 =?utf-8?B?azcxSjM5ZUtJQlJ4OEp3Z09qdWtYa2ZYWWp6WUdLdC9uWS9FNVdiWjRBdGY4?=
 =?utf-8?B?QXAzRUltRjVIWjc0NzB5ek5JNUJtOFZJS01QUFBKVEQwMDR4amN6VTJuakpz?=
 =?utf-8?B?ZWtzTEp6UE9WVWtFbERmcm45bXRuZDN5aEV6ak8wWG5Sd3VNcTNrYlFLL0Vi?=
 =?utf-8?B?TDBlZVZGb21PdVBJSld3K0ovVXV6cjc3Z3pVOC9mSktZWW5pZ2JYSUdnNDdH?=
 =?utf-8?B?K2xuc0tjV0tqdHFaUmw3aHlWQWJVM3lLZk5DVmtEVHBaSHhQQm5RMW5oaFpo?=
 =?utf-8?B?L0QyaTU1UFR4bngyekZFOVVZNnB5T1FIb1crSTZUUlBHZG1VUjFhSGJLaWlU?=
 =?utf-8?B?dnpjZGpDdXlhOHpKR252V2dWZUpkbzFkN3JydW5DNTNNcXFpT3gyK2h2RkV2?=
 =?utf-8?B?TTFBV0xobFl2RWhOWFhJU3ZzbGxPQXBZTmpqaFlUWi9WQTlReDZwejlodkEz?=
 =?utf-8?B?M1Y1cDl4VHl4NHBiQjR6c0RKZUNhTytRMkhqTXNwbllEejJJVjUxVFRhcllD?=
 =?utf-8?B?SS9kaWNBb1FSd0EvUitYQjRZeUZSUERXcXlZQ0pGYlpJZlJoU21hSjFZZVNl?=
 =?utf-8?B?WlRvTzdFeWVOckh1VUNBangzQS9FVjVXb25xTTdnb3daOHZqN1VWQW5oK3JI?=
 =?utf-8?B?UDQrMFI4QW41Y0pXK3diMU5OMlk1RDNHbGNjWExpVmh0OFd4RFZpSFlzbW5n?=
 =?utf-8?Q?qTlPyH+x24Z0P9B8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 586eacc4-7435-4313-2d6d-08de68c86141
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:18:16.9211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVZl6Dezg2d/VbocRqp7THh1II1PqvikbAYj6OpI35++VegQCd65FBRcMbMWHYiBKSjh7fVpTZD4JuxkIgXK0epYZ20LpicjHX+kKe8Bix8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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

The patch should have a 'drm/xe' prefix, missed it somehow. Will add it 
in the next revision other feedback for the patch is provided!

-shekhar

On 2/10/2026 12:59, Shekhar Chauhan wrote:
> During devcoredump, print should not access any live gt pointers.
> Decouple the snapshot_print from accessing gt pointer by storing the
> captured data in a separate list and then print data from that list.
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_capture.c     | 25 +++++++------------------
>   drivers/gpu/drm/xe/xe_hw_engine.c       | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_engine_types.h |  7 +++++++
>   3 files changed, 34 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 2f5816c78fba..0555fb07c499 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1695,8 +1695,7 @@ static void
>   snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
>   			     u32 type, const struct __guc_mmio_reg_descr_group *list)
>   {
> -	struct xe_gt *gt = snapshot->hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_device *xe = snapshot->xe;
>   	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>   	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>   	struct gcap_reg_list_info *reginfo = NULL;
> @@ -1806,7 +1805,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   	};
>   	int type;
>   	const struct __guc_mmio_reg_descr_group *list;
> -	enum guc_capture_list_class_type capture_class;
>   
>   	struct xe_gt *gt;
>   	struct xe_device *xe;
> @@ -1826,8 +1824,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   
>   	xe_gt_assert(gt, snapshot->hwe);
>   
> -	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
> -
>   	drm_printf(p, "%s (physical), logical instance=%d\n",
>   		   snapshot->name ? snapshot->name : "",
>   		   snapshot->logical_instance);
> @@ -1841,23 +1837,16 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   		   str_yes_no(snapshot->kernel_reserved));
>   
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> -		/*
> -		 * FIXME: During devcoredump print we should avoid accessing the
> -		 * driver pointers for gt or engine. Printing should be done only
> -		 * using the snapshot captured. Here we are accessing the gt
> -		 * pointer. It should be fixed.
> -		 */
> -		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
> -							capture_class, false);
> +
> +		list = snapshot->list[type];
> +
>   		snapshot_print_by_list_order(snapshot, p, type, list);
>   	}
>   
> -	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> -		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
> -							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -							capture_class, true);
> +	if (snapshot->render_compute_list) {
> +
>   		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -					     list);
> +					     snapshot->render_compute_list);
>   	}
>   
>   	drm_puts(p, "\n");
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4d3ee5226e3a..a246b4f860e6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -923,6 +923,8 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
>   	struct __guc_capture_parsed_output *node;
> +	enum guc_capture_list_class_type capture_class;
> +	int type;
>   
>   	if (!xe_hw_engine_is_valid(hwe))
>   		return NULL;
> @@ -941,6 +943,24 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   	snapshot->mmio_base = hwe->mmio_base;
>   	snapshot->kernel_reserved = xe_hw_engine_is_reserved(hwe);
>   
> +	snapshot->xe = gt_to_xe(hwe->gt);
> +
> +	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
> +
> +	/* Capture the register list */
> +	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> +		snapshot->list[type] = xe_guc_capture_get_reg_desc_list(hwe->gt,
> +				GUC_CAPTURE_LIST_INDEX_PF, type, capture_class, false);
> +	}
> +
> +	/* Capture the register list from RENDER / COMPUTE */
> +	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +		snapshot->render_compute_list = xe_guc_capture_get_reg_desc_list(hwe->gt,
> +				GUC_CAPTURE_LIST_INDEX_PF, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> +				capture_class, true);
> +	}
> +
> +
>   	/* no more VF accessible data below this point */
>   	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
>   		return snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index e4191a7a2c31..87ad1e68fb47 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -6,6 +6,7 @@
>   #ifndef _XE_HW_ENGINE_TYPES_H_
>   #define _XE_HW_ENGINE_TYPES_H_
>   
> +#include "abi/guc_capture_abi.h"
>   #include "xe_force_wake_types.h"
>   #include "xe_lrc_types.h"
>   #include "xe_reg_sr_types.h"
> @@ -167,6 +168,12 @@ struct xe_hw_engine_snapshot {
>   	char *name;
>   	/** @hwe: hw engine */
>   	struct xe_hw_engine *hwe;
> +	/** @xe: device pointer */
> +	struct xe_device *xe;
> +	/** @list: register list */
> +	const struct __guc_mmio_reg_descr_group *list[GUC_STATE_CAPTURE_TYPE_MAX];
> +	/** @render_compute_list: render/compute list */
> +	const struct __guc_mmio_reg_descr_group *render_compute_list;
>   	/** @logical_instance: logical instance of this hw engine */
>   	u16 logical_instance;
>   	/** @forcewake: Force Wake information snapshot */
