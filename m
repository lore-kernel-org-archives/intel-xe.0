Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FC5E7544B
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 10:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CBA10E9DA;
	Wed, 24 Dec 2025 10:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHgdl70X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6682210E1BD
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 10:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766571594; x=1798107594;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pJe30t+eLnWWJ9zpFGcR6byJ3s2VadUabhMbRsvkq7k=;
 b=YHgdl70Xay1j3FxftMXUgIwZxvIz/2bJyVa5js7ZBkD3cjPMWrR7BmKG
 QQN07BLILa/AUNH0y+yyGWi20Ny9tFsabnH/4XCK/Stz0YWKbcZwnjcxb
 USKACR8Ls1A2BdTvbpAIqV+Ke2lj94vJ1LPSc5H2Y8dyPzbdj6iR6FuTc
 duAgczO/c9hShIjkvawbgWyTf372voTu5bC/dFCL9c878QUkqG2Ad9xDP
 Fjy+0RRV7XvXHb/gHIL3r3Oc2rwsNP1ydQx0S8mzSqjkk7CmIlA7K9rYZ
 mKSdoiGzM4ojYciF3SX+W3oaMpu/01LwyTT3muPTfnpFOJCmdgqtUedLi A==;
X-CSE-ConnectionGUID: 8hmJW6UfRbW1CB6YLwTqfw==
X-CSE-MsgGUID: 31uvYozMT56IK+++eyjIYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72273361"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="72273361"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 02:19:54 -0800
X-CSE-ConnectionGUID: vyLnq902Qx6dyL8v/QhSNQ==
X-CSE-MsgGUID: vP+uFxIFRm2Ub39TpfLmBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="200025613"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 02:19:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 02:19:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 02:19:53 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 02:19:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMhB4oI72I0Co62FNUEp2WxjvuSjut0M236fc/dT/Fq8ZdWP1F+hwhhEfeI64IiRnWsi0OzGAz4K5wI10D8ZZYuqudW4elD5cvojeUuAM82gkR9X35ht9JYZVjAz6lo13NU2h30jS8yqiQDI0MllUInxP7Tue5gMLeid+b6EUqOm1836mvDUp36VOSX1gO4JAh2oOTLU5kWG7/m+XPY40cUL7uwNZtmDLruHoCtEqFWGEUsiruiV17nD6WbUa+btMiStZ43JJWpnGZYkZXesQuk7VrOb77GNxzIEjyhwNM+y0wU4W9NMfQt0EAwlA+iJqAoKEcs5nkdfXA5AdqixIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awwbIu3CJVBehtWQH1Obkdj0eVhwLeZf8OSRWOBK3Lc=;
 b=Nm5unVBIHxJ+nCmlmxCt0Sqm+u7eNw4Z77AEfiCv7LSxo+vP27cTMBQUFtXeisE1AjdLfAHDCvIsP/T39XPJE0dwJ64gLdP0deZmxGIvs/XGwacncQo73Y8dL2F8B/uV2U0zcmsUrD9dCMy/PfTouwM6yWfAoE4SP55QCY9l4K9LzZusUIPSSODECeuveF1HYLvtb0Pik5VQoFsQr7eYlESFd7Xy7VvEfCWodSPdPYxsd1T6J+x4UadPAIjA5zZHVk7yiaeXV/IAyjiw2KLZWBeCm8obmOqXkTvFBfT4O/VjpKjbkimYZhO/Z3h7PutTAbWdVPY3FVplGHj0fS3TuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 10:19:46 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 10:19:40 +0000
Message-ID: <d821aaaa-8397-49e9-82f8-6db73158d015@intel.com>
Date: Wed, 24 Dec 2025 15:49:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe/hwmon: Expose GPU pcie temperature
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>, <riana.tauro@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-4-karthik.poosa@intel.com>
 <aUULkuevhVvQy6A3@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aUULkuevhVvQy6A3@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5372bc04-9e51-4c52-58e3-08de42d5f2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG5keXBTcmxtYUNZMWc4L2RNWUtHTFNpcnRZNjBhdEhRV3FpRE1tL1ZGTk5j?=
 =?utf-8?B?MDdqUXkrS0xwbkt5VGdwU2x5V1lmWVNycy9BeHB6NEFWbjBmQm9pY0lMa0Jj?=
 =?utf-8?B?QlNTQWMxam5JcmhJQjNPM1ZSUzZEbXZqTFhnL202dUdoU3NmR3VZRVV3cmx1?=
 =?utf-8?B?aldIa2JXMFRwMkNCYVZmMVJlZERmR0FuK2Z3akM1MzFiUUZpSUtINFp5OGhw?=
 =?utf-8?B?VEZGVEF3bTY2bHdVQnZTVjhnNk1vZWVDYTdJWkZ4bzZ1Y2kwY3FMU1BrVVlQ?=
 =?utf-8?B?N1M4RWZmLzhVelM5Ymh3WnpJK09vVGxRenRTRTNLdFRtZDdKL0ZyTHZlSkZk?=
 =?utf-8?B?cTN1dmJaL2l4anNaZTd4MUFNN3Mza3FCUmVYMnpHZDNhNkEzeXBRRzhUd0VP?=
 =?utf-8?B?bzVtS2ZxclQwbWpaN0VtS3FFUUFFeU5CQ3RBVXNQZ2tpNlVPZFBwdjgzU3Jw?=
 =?utf-8?B?ZFphMnYyV0lxSGw2eXhnazE0OXd3QkZnRkVPdGNiM3ZEQ3YzT3VNVVhZZ0Vk?=
 =?utf-8?B?eU1MMXhocEtlQlV1eWVQVks4MWhrYzllQmtac3huRGFMY3Z4YWNzNjhLNUdo?=
 =?utf-8?B?bXQvRDBoOEVXNTFMMTE0cm9Td3pmVnpST1VFdVBOSXVEWEUyajAzTEtVc0kr?=
 =?utf-8?B?b0JSM0JZblF4OC9PeUpsM0JqeG5vVWdQOS8vM1FsK3JHcW1pV291cUZpNEti?=
 =?utf-8?B?a3BBQ21pVkE0M2hLYzY4RGYyT1g0N1BzbjJSVWJSY215UmNISUZXT3ZOMjEx?=
 =?utf-8?B?VUJ1R1lKbkc5SWdqdUtvTWQ3MGZZeDRGNXFtdDZkTURhSjRxZExxWnhLSW9x?=
 =?utf-8?B?Z3dJUEU0aXJFc1h5NE5zQ1lGYnFDejR3allKZmhlaHBqTUdiQmorbThCRHI5?=
 =?utf-8?B?OFFUZkE1a21MT2Q0Z2VOaWJ4VENyQ0ZSUk9PZFB1SUtINVdMR09OUUFpbjNW?=
 =?utf-8?B?Z2lEblZiVm1TcDNCSzdnMVE0T2dpbTh2ei92UEczTXd0S3YwUGFiRDNWWU5P?=
 =?utf-8?B?bWVDUGJPVi95dFRMUlpWN0h2V1diOUlOZEp1QytsZ1FMTndmdFQ5ZlF2MmJr?=
 =?utf-8?B?eU9OOXJUaVZ0VThKdHZSWTJ3VjMzS2dIRjVvWHA1S2JUcmZocXh4a0FrUCtV?=
 =?utf-8?B?MVlIbndzTGJNZXZFZGdHdU82SjdWNDJSL0Y4T29Mak9qR3FNTm9GaUNBTjZN?=
 =?utf-8?B?aTRRRXVwdVdxYjV3OTF1SkUwaXZ3dTdWTFRZM0dOazZ1cDllNXQ4WWIxeHBM?=
 =?utf-8?B?Z0ExNnBBZnJGemVTRWZmV0JpcHh0dXdFUlRkbTZZeVF3amtiL0kvbmRiZTFh?=
 =?utf-8?B?dXE3TjdmNCtkaHlaZk1JTVR5UFlhMTV3YXVGWmhBUTFnN05NM2o3ejJEcEpt?=
 =?utf-8?B?SVFnMFNKVUFjOHRRRlBScTQwc1h5ZlVtNm5BQmxISUF3QTZITzBTSnVmeXA2?=
 =?utf-8?B?WTEyL1FKYWU5ZmpQRkJudUVSTXJJR2cxbStRTHZzRFdRUFZkWnhCdVphMGs1?=
 =?utf-8?B?VUdZaDVBZElDTlJJQmtkNnQ2NWVSWmk3Y21DZVhMQXJVS2FqaEFQZ0dIQTh6?=
 =?utf-8?B?OWFvd29lcjJzellOUUdGL2l3UENQZ1M1bXJYZlFlbkhVcCtjaEpDaG1rbXdp?=
 =?utf-8?B?Z3ZHS2ZIVlRIbE5sZ05rL2J1WHhGVURnclU3LzlaQVJ5eEFmKzV5ZGtpcHJ3?=
 =?utf-8?B?L1hodGlHdEJOL1dSSUV4NlQxWThKRWVuWEptM3lzclJMZ0lndTIzRS9XWjRF?=
 =?utf-8?B?VDJ5RjJVQ2RxSUs0NHpVT0R2bjhwWEw4MkdERXA0QlhnWmpUendwV2xCcjhq?=
 =?utf-8?B?ZFVQWWhWU1dlWUg5UUNWRWE3VTVBcTlISFhsWlJoWnVFbUN1OEkycHluZlU2?=
 =?utf-8?B?ZHRZS3hDV1o3V0xVUjFqMk9MSjdrUkFXR29PQU9tejJ4MlVNQk8zM2NqZlNE?=
 =?utf-8?Q?BEa2lpBF9JXEc5hsdBAa/DQ5M3CeKWY7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1JxQzBtRmtjclZKY045cVZFVTNqRFBVNExpOWJKNkFnWjR5bUp2L0lFaU55?=
 =?utf-8?B?cW1HNTNXZngrQ1dTcGRPbUtGcUhscjJBeFJiNHUrVXNwL1JFekszTUlUemhF?=
 =?utf-8?B?aUM5MHRJZ3Fqb3pTbUQvZitKQlVFUlRwREZHY21QWmc1N082Yzd6aXAzTEFj?=
 =?utf-8?B?S2Z0akFNcCtxT1F5RmRBQ1R1MDl5SDFXZUlZNTVhbHFPaGRIdzdVdUowNzlT?=
 =?utf-8?B?TjRjZHBpMTZ4bnc5ZWFOQ254ZXh4SDcyeWQxejNCRWRxMmpIcVRhQmRnalV2?=
 =?utf-8?B?MFdzVEU2TDRWZldySWs0RE9EVXNqQkZNTXhnR3NheUg4TUZUU0V5b1RZRGR1?=
 =?utf-8?B?ZmkvYW9zZzBHajU4bGozM3k4VVQrcml0eFBiMDF1TTVHRGNRK3ZZTWJkTS9n?=
 =?utf-8?B?S2twYi9nTkFyUHBjQmx2c1F5UnhTVDBhMWdIM0lGMklDZ2tqbG5vdlRaNFJC?=
 =?utf-8?B?TndjQ0prcmJPaGt1N3k0MTI3NC9reVpiM1BzSGxycjIrQnBOQUJiVytOcjBs?=
 =?utf-8?B?a3JjSVluZUNJb1dMS3MyWGlaelF6ZXd3cTRTbkhGNm5Bb1FvOHVUNVhBZ3ky?=
 =?utf-8?B?b05GR2xoVHNkWHQ0VWRCVWltMVB4aGh0aTVpVitleExwYlZUSE9RQWRQQjhK?=
 =?utf-8?B?QXFIUHk0UTBQUDcvelZpQjJvMk5OTEhTTU5IRGJINWlaMGMrd1NlUTlJSlpu?=
 =?utf-8?B?eEt0ZDYreDhNTFhQeGQrVGNLN0k0VFJqVTN3Z1g4K291UnR6Q09OWkc1dkZU?=
 =?utf-8?B?MWRvdWVQY21CcTVHOWJ1dXMwckdsa0RUT3Nqdk5JbFYxazNVc2xaQnNvOFFK?=
 =?utf-8?B?REZHeGhlYkMxODNQVFZrbUZjR0lIRFF6ZVNJT0cxVFlWNERXeWtjYUx2OTN0?=
 =?utf-8?B?eXMybHE4NTRtQS9nSW5TSDNTaUVJRE1UbkswQjB5YWZRRkdUSHhUNEY5V1Y1?=
 =?utf-8?B?Q0FuT3FsTlE5dlJMUm5mTU5pTXpVaXFPZ3VLUkkxV21JamgzZVhhU3VFRm8r?=
 =?utf-8?B?TXdQMDNHc2R4Z2dSWjNRNVJOZjlJZ2NtVFAxMUdIK3I3TkZUYWVhdmpBOTRt?=
 =?utf-8?B?NjNWNEdvUHRsWGNUemdETU90UlVVWEtXWFRYRFI1cndmRGh6MVc2UUh1U3B1?=
 =?utf-8?B?Z09rOXpFbXEyT2tEZGkvSEc0TXh4b3crbmlhQWYyZWgybzdDdEFpWFlTTGhz?=
 =?utf-8?B?OGtJeVcwWlZVcUpyczNtaUp1UVBXclhOdkIxWHh0K3QwSGZmczNxdmNXNHVN?=
 =?utf-8?B?dmh4RXdidlE1RnY0OEdlUU80aFBPSHVGdGxjOWlYWHE2NldBZHRhUHVtT0dD?=
 =?utf-8?B?ejR3SWxEVFFDL2lkcm5uUTExaFQrSjZxdjQzTzlHc29XYlRIUjRUOUxCM3k1?=
 =?utf-8?B?d00wZFFsZEFiaDlaSVJiVWxzdHdLUWYyb3p1RXBDN2crT2laR1R1cUJrSzdN?=
 =?utf-8?B?d0MwQytKYjhodVdoNkpNODRGVDhIRHlmZm9yV2VHbzRiWWtrTHhYL2doUXhE?=
 =?utf-8?B?QW1rSDQ5SWsvQ1d2L2RMcXp5Tkgzc3ZRU2Jhemw0aDdzQ1FvMEs3UmJrYkdX?=
 =?utf-8?B?R1l6bUdTTE1pSm54ejRsWFgvQ3l4MVByYWEvbEVsMGVSdUZOY2JsMTRoMTM0?=
 =?utf-8?B?clBKN0t6cTlMYkZ2QWFFenVoT3VYTXZ3ekRSZHAxNmdJdUc0R1crcEYyUnAr?=
 =?utf-8?B?YWZoQ1MyQWJpZEpva2ZmUVczVVFyb3lnOEJWcURaRS82M2hqamhaNHRLS3ZB?=
 =?utf-8?B?T3NpL3A3K3NkRTRRVkR5NWgvdUJMVCs3ZUtRWmo0RHI3bXJrcTNJNHdtT056?=
 =?utf-8?B?emErWFFsZVRBdkFLZFpUWVZacERSMXFGcW1SU245OUh2a1hOSFEwVUpERHU2?=
 =?utf-8?B?RTRhR0g2UUh0ejQwdExiU0ZwMHJoeVNvVkg1YXB6UzZteXQzcW9paUU5R0Z5?=
 =?utf-8?B?MXI1alZTeGkxdHRzS0VURHFjbEU2UjVYYXpDbkx5cTF1NENPVkVsQ2hyd1Vl?=
 =?utf-8?B?ZS81OGNwN3pNR2RVZmMwa0xyUEZOam1WaHZZN25qSUo3N3FDYjNGSitxY1M4?=
 =?utf-8?B?dWF1bWhrRGZZeDRmdGwxWldFYS91Skx1d2JDcXJEOGZXcTRCNUFLdmtab0pQ?=
 =?utf-8?B?QjJHUDBpaHRJb1lMcXR6THZoQ3JLYSt4ZGlDb21YSUxkQVdkNVVhWGszZGk5?=
 =?utf-8?B?cmZPc09EOEo3Vk54ZlRCaloyakh3VlZwVUs2c0NqRjdnRnBWWWw0QnlKRmNT?=
 =?utf-8?B?ZXZzZEpLS0ptaDNjb0gzNHlHTE1mdm9IdUxMM3lOMXAzV296dEx1ZW1jZmRq?=
 =?utf-8?B?bTdPSTZHNTlsNzFwR3ltOEE1K0FFYlBqT2dsN2VCY1M4OEtJZzRuZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5372bc04-9e51-4c52-58e3-08de42d5f2c5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 10:19:40.4827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mltkTsZ1UxUD+g5EiWLyurnIUXjU1HSRSKaZvyISWT7w/CauILby1lWos1NzPzhUANBFF3Ygw0v345kzqRUCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
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


On 19-12-2025 13:53, Raag Jadav wrote:
> On Tue, Dec 16, 2025 at 05:10:29PM +0530, Karthik Poosa wrote:
>> Expose GPU PCIe average temperature and its limits via hwmon
> Use consistent upper/lower cases in subject.
ok
>
>> sysfs temp5_xxx.
>> Update Xe hwmon sysfs documentation for this.
>>
>> v2: Update kernel version in Xe hwmon documentation. (Raag)
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 24 +++++++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 36 +++++++++++++++++++
>>   2 files changed, 60 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 81f9b5d58850..51a35fcfb393 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -260,3 +260,27 @@ Contact:	intel-xe@lists.freedesktop.org
>>   Description:	RO. Memory controller critical temperature in millidegree Celsius.
>>   
>>   		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_input
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. GPU PCIe temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_emergency
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. GPU PCIe shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp5_crit
>> +Date:		December 2025
>> +KernelVersion:	6.19
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. GPU PCIe critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
> Same as patch 1. These attributes defer from ABI definition so not my call.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 6d31ad74cd0e..b8519c734b4e 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -44,6 +44,7 @@ enum xe_hwmon_channel {
>>   	CHANNEL_PKG,
>>   	CHANNEL_VRAM,
>>   	CHANNEL_MCTRL,
>> +	CHANNEL_PCIE,
>>   	CHANNEL_MAX,
>>   };
>>   
>> @@ -713,6 +714,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
>>   			   HWMON_T_MAX,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT,
>>   			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>> @@ -787,6 +789,28 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   	return 0;
>>   }
>>   
>> +static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	int ret = 0;
>> +	u32 data = 0;
>> +
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, 2),
>> +			    &data, NULL);
>> +	drm_dbg(&hwmon->xe->drm, "thermal data for pcie ret %d, val 0x%x\n", ret, data);
> Same comments as last patch (and also in all other places where applicable).
we can remove this.
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
>> +		data >>= 8;
> I'm a bit lost here. How is data format different per subplatform?
> Shouldn't this be a pcode bug?

Format is same, only offset of sensor is different for G21 is different 
as it has less sensors.

>
>> +	*val = (data & TEMP_MASK_MAILBOX) * MILLIDEGREE_PER_DEGREE;
>> +
>> +	if (data & 0x80)
>> +		*val = *val * -1;
>> +
>> +	return 0;
>> +}
>> +
>>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>>   {
>> @@ -895,6 +919,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>>   		case CHANNEL_MCTRL:
>>   			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>> +		case CHANNEL_PCIE:
>> +			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
> Same comments as last patch.
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -907,6 +933,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
>>   		case CHANNEL_MCTRL:
>>   			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>> +		case CHANNEL_PCIE:
>> +			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
> Ditto.
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -928,6 +956,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   					       channel)) ? 0444 : 0;
>>   		case CHANNEL_MCTRL:
>>   			return (!get_mc_temp(hwmon, &val)) ? 0444 : 0;
>> +		case CHANNEL_PCIE:
>> +			return (!get_pcie_temp(hwmon, &val)) ? 0444 : 0;
> Ditto.
>
> Raag
>
>>   		default:
>>   			return 0;
>>   		}
>> @@ -954,6 +984,8 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   			break;
>>   		case CHANNEL_MCTRL:
>>   			return get_mc_temp(hwmon, val);
>> +		case CHANNEL_PCIE:
>> +			return get_pcie_temp(hwmon, val);
>>   		default:
>>   			*val = 0;
>>   			return -EOPNOTSUPP;
>> @@ -962,6 +994,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   	case hwmon_temp_emergency:
>>   		switch (channel) {
>>   		case CHANNEL_PKG:
>> +		case CHANNEL_PCIE:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		case CHANNEL_VRAM:
>> @@ -976,6 +1009,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   	case hwmon_temp_crit:
>>   		switch (channel) {
>>   		case CHANNEL_PKG:
>> +		case CHANNEL_PCIE:
>>   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>>   			break;
>>   		case CHANNEL_VRAM:
>> @@ -1360,6 +1394,8 @@ static int xe_hwmon_read_label(struct device *dev,
>>   			*str = "vram";
>>   		else if (channel == CHANNEL_MCTRL)
>>   			*str = "mctrl_avg";
>> +		else if (channel == CHANNEL_PCIE)
>> +			*str = "pcie";
>>   		return 0;
>>   	case hwmon_power:
>>   	case hwmon_energy:
>> -- 
>> 2.25.1
>>
