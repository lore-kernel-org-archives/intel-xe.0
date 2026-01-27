Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55B9D2FEF9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 23:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEC510E15B;
	Tue, 27 Jan 2026 23:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPjZnDSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE34F10E15B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 23:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769555947; x=1801091947;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i/4u79fedAo93AHB0T9fSC3fo3n9tOUD+1qevdurBpY=;
 b=cPjZnDSWclprVUkpdmc8G6MKLbKOjqWa1dB+A9e52e7NBZrnfom/9tF3
 b2FR0bKK8ff4c8XzRPeQZsgoSJ/UqXZT8pD18odUxIS2CbUMm/nAVUXIU
 zjV2//BJ813DSPcIsvCN6ejcwkmoSuSAebXCTSRj9PxfUjy2Q70eXBtcN
 pHMFpABe896LtCxlD+vbg8KPP5SQgKvCWR3FoQxc1SyaovYmQaLajsiB+
 Hwb8yy56QYcxo5nR6TdrQwUZLVTTFFgS1vpJYxbt9J9XUXEq87BSFf2hW
 PvVl0ep3Vg1hopw9FHAgJ0b/Jes63XU2efXBYnShh9CYkT1XTZD3UseP2 A==;
X-CSE-ConnectionGUID: lWFmOBeSRTWRmbP/PlJxkg==
X-CSE-MsgGUID: 8lZeL8tnRkCFcURIm4NYbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70736962"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70736962"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:19:06 -0800
X-CSE-ConnectionGUID: NQeAhb+eQWKVpxLtHq96kA==
X-CSE-MsgGUID: wt8UeEoFQcy27oiqWpBXUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207719386"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:19:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:19:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 15:19:05 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:19:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETJ0OMOyZOxjZUruqKS1oB9R1V+RlmtiQkYgb581T04p8zf1K/v4fvp7F6MVbJ08IuMJsOPU1b7m4CcTU8jTimeFxZE9AWBxmJ7y2wCIXMG5SRBy9PR0eYdeoQu644Dxf5u7bPf1sGZbDxZ5gOAN+Cs3dD2Tghrae6zUsfBEhMUY44jUzrWVT/SaJAG2O2AUH4WY/tgfMLaNJhxikNAXu5PT39By8p05yjyDAsY+7OBiJ0wY/jnnbAm+rX0CQ6LUw+ipX+YxUrQNn6sx9+Ft4CgYCbnggCuMqP2c99kYWi1iUUz4jS55HpuigbzXsb+1ZWpcc4UXmCAzA3H2seW/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVuqK3Nphwb7A+M2WK6flnVPT29RsO2LW/CxtTojNDw=;
 b=lXjEC56YBsim3XbocW4zI5m2nICjIcKQhTUkFRV9+JHZsS5VYWD+1FRR9sV63camu4xuwhS0Uy0tXpaAexty+4N2vyd9QAj1cHk5zIdGqM3MRUPA6v17pzZYZ+s47FYN4CF+nYLgmabFOcFhK65uE58UycrhMa2UZDbpuMhJXv9uN2ivpM5J7wTrm9rTMxX43EVvhpxpBNoPYt4ibBIHzzLpiHsWl5FxBUBBXjJL3hsUanDYorAnO/sMMHPwJDZglzTgrtgmFRo6i1Ht1WmcOILMu1ZIChhoXJBIuQmWKKhr1htbPy3NdqSKvcAlf0C2ROZM6dK/NLGg55FgMYsCWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4682.namprd11.prod.outlook.com (2603:10b6:303:2e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 23:19:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 23:19:02 +0000
Message-ID: <9c5435fc-9e75-40e9-b155-bcc60c8f82b0@intel.com>
Date: Wed, 28 Jan 2026 00:18:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
References: <20260123235027.379891-1-vinay.belgaumkar@intel.com>
 <20260123235027.379891-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260123235027.379891-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad065da-eae4-4f3d-eefc-08de5dfa753e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlEvbHVIL3d3U3EvR1BwbkQxdkgzc3NyV2VMaEVwVWV2akFWU2VtbVZxQVho?=
 =?utf-8?B?YXJ1YXRXWG1BelhkWTdZUjJsdHR0ZG1NUWMydkdGVkZUSHNkRjZBdldpMWpT?=
 =?utf-8?B?QlhFSkg5dUdXdG9ZcENTbGRvalRIdTY3TWNLM2lBVGRpTlVGbGlIOHczUzl1?=
 =?utf-8?B?RlpUS2Y3a0VBTlhJU0NyYkIyV1ZjcE9rRUd0YzdycEtFREo1eTMrN3BRV2R3?=
 =?utf-8?B?a1U0MURiUEpHMjk3Q3gyOE10b1JWeE4rM0xhT3Nod0YrdEFrL08zTzRhWDly?=
 =?utf-8?B?bWJEMDVMcHB0SmtaSXB0Z2dxOWppdXFHUFhnYTR6ZThSWlZadWVYR3pFeUFC?=
 =?utf-8?B?QzBEVUwraUc2RHV2d09KdXFNeHJFajc1a0NncFduMXZkSk1CaitmeEd2TXhP?=
 =?utf-8?B?ZUVjVUxPS21kYkkwYVh1dTZIN1ZiS3pMMWNRQ0VPYS82cUhXR3VHR1RhZjBN?=
 =?utf-8?B?S2J0OW90anNuWWt1RFROSHY4QkVTelJYa2xHeERORlkyNlRsTmJ4MDdPd3l2?=
 =?utf-8?B?U2JVRUI2cmY2eENrdnJ5cWdIWVNYa0pNS25HbzA0Rlp4VldoeVMvcDd3aTlH?=
 =?utf-8?B?RlAwVUVuV2pVc0Y2dzNES29ubVdUVW4vc2NqZGFQY0h0Vi9KcWNMNC9nT1FY?=
 =?utf-8?B?RExqSUVYdVdFajR0Z2lxYTVaR0NSODdQS0YybDRUU0UrcUJvU3VEV2ZtM2hW?=
 =?utf-8?B?dUVaR2VGRGZNNkx5SUhlWlN2WnVranMyMHlycWorTGZJMHBjbE1Ra1ZqUG9G?=
 =?utf-8?B?bEY2MzdldU5OM3drWE05ZmRFR0RaUXZVQVltSVkwNFhsa0o2TUJkMlY3UjBG?=
 =?utf-8?B?bEJsVklFYlp2b01lR1JuTTNaS2VSSTJCUHJvNElDV2xFYXVBMVhaMTBRRzl4?=
 =?utf-8?B?WmJPcHhNQnp0eGxqTHFEbFJrb1EvMENOUHZhNklyUXFhcGxISjNESno3THYr?=
 =?utf-8?B?d0gvK1g3Y0xxYWd2d1NMZ25MMHdncGhQdW1XOEx6TGpBeDdPcnpZT2t4Tzhp?=
 =?utf-8?B?VGNwMjhhb3drMmtobXNDQUZqT3ZDaEUweHdDNHQ0Nk5iTXNyWS9FeU54eExZ?=
 =?utf-8?B?QllIOVlOcnVHVnk0UXdmZktRT04xcFVGT0JNbzRUVmxIL3VxaytGVjdHSjg3?=
 =?utf-8?B?NEFZUTN4Y3p0cTF2SFdveEJLV2JCdUZIRXl6TlhOdlhlQjNSdzNtdnl2OGFP?=
 =?utf-8?B?bFQwbmc2cVdaWEtxQ1hmYmRNb1hVb01oV3BBS2JhT09sajlwSnQvUFg5dGNt?=
 =?utf-8?B?WDhXYUN5S3R2VUZnT001UWRyNHp1ZVRBVFlCNzErUFdOVzZLS092ZmI1bGs4?=
 =?utf-8?B?YXpKMHppekhQQkx1a2hnd3hKcGFZSjczRU9Bc0tkcWZ3NG9aVHdwVms0L1JW?=
 =?utf-8?B?TWwrSE1qTHQ1YmhCak1pcFpVZS9sZ1c0M2JOdlg2Z2VyU3B6TUhranhJOUht?=
 =?utf-8?B?MTExcWdZRVR0VDdKMDBpYXhLdk1wVnZMYmVJTWZLK0tIWjBMNVNpZ1VlQ3hK?=
 =?utf-8?B?ZnRMWUJpZ1VIcGQ4VUliV0hqY3VXU3dKMjJoZlFSQWZmOXJVZjZqWjFWWk04?=
 =?utf-8?B?Q0k1NUVoTVRxRXpkT2NhL05QUFRzdFRidS8rVzRRQ2VEL1hRZGsveXQyK1VW?=
 =?utf-8?B?SlFpZUxKMUlYYWVkby9rd2hDNWNkVHczTGowTkpRcktPZVRUQlRTMVJrS1Jn?=
 =?utf-8?B?K25ZK1RPd3VhWGcySUZSclYrTFAwMWJKVFcrYlhBN09YSWVnSTJIREY1dmZP?=
 =?utf-8?B?NTFnT3cxWFFnbjI4MWVOVThPSE45amZEanJ1Q0dqdlVjaWdJV3U0WmY0WDdN?=
 =?utf-8?B?eC9LZkplNElBSGpnTHhjL25KSldyQng3S2tDNWRXTEZPTjNVM1FyQ1BhMUFz?=
 =?utf-8?B?bmVqb2xPclM2ZUhIUURJcUhvL0lucVZwZzdGdURhbW1PQ1dhbGs0Nmt5OXN1?=
 =?utf-8?B?Y0Rqak5vZC82Vmw1aTN2bFBVZkRuOXFxZnl3a2pKKzFhcHg5VitiSVh3VDJ6?=
 =?utf-8?B?cWpjc3NhWGN6V1U3UHpEM2w4RHRZNHlQaW96bHRtckMwcXFRK2NLNjVSZTVo?=
 =?utf-8?B?NGs3VzFEZ1BhRUpyVkwzTVdydFNrbDhjQ2g1bUpnNUhtM2d3TndVVkVxbHN5?=
 =?utf-8?Q?lSDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEpHWDVQMXdpVGZ1dzJXNGp2dFVUOU8rNVh4NWh6RHQ5YTFRbGxqdFJQcWlY?=
 =?utf-8?B?U0NPZmJWVXZBVTM1MTg5dDdicnIySWk2cDdVWU16MERxeit0QWJGY2J4NE5v?=
 =?utf-8?B?MlA1VUk2SENYQy8xODlPTzloRldkckNjSUY0ZUNZenJFV2tkaURGWURROWNN?=
 =?utf-8?B?Ti9CVTNUWHh3MjJOK2hNaEYwcnFBb1BtbkEyeEtiZXhzMkZYenVjMDB5WnV6?=
 =?utf-8?B?dEhBSkVuamVrNFFPME5qdkFOcnBFVldzdjh6ZHVNWm5qWTFVQkErMmMwcHVE?=
 =?utf-8?B?b0JHSVJjcWEza3hiOTQyMGlWQWxjSDZCMThaOVFmYTIyVkw5TG8wOEJFUk9V?=
 =?utf-8?B?aEVXN2VLYlJodkhCYWE2V3pTVFpRVEpSQ2hVTnFJRlBRSDVLMzhuMTgxRFRY?=
 =?utf-8?B?c21VMnpoOUhRZ3IwTUwzODFQWGFKSkxKR2NGc0pMbEZwS2lpNjRVZmhpQjRF?=
 =?utf-8?B?YUlGOXpZQ0dXbW9XRmVWemphZmNiUDk4T0RIZUcvV1dJR1hjZjNNS01EbHhw?=
 =?utf-8?B?cVBmMEFsYzdaOHlzSVpwaDdwcm10cGJUeG5tUjcwc0JxaUI5VEliSEpwbVhk?=
 =?utf-8?B?c0swV1cyem1PL0pJblZPTlpENlNYQm9yZlVyTU9XbEE2MEp4RGkxUm90eDI1?=
 =?utf-8?B?ZmxjY3JKS0lyOXA3bVhhc0ZmYUhyL1dNMG9DSVhPSHMxOWoyR2huaUZMbURL?=
 =?utf-8?B?S1lPRk9WNzZMQXFoNWloWTZJMGt5Rkx5VUt3S1AyWC9jNE9uclNaTS9kbXQ3?=
 =?utf-8?B?SnY4M2FkeW9sVHdwL25QMHA4bGU4bU1jV0JVTmtCQU9BMWZJbEUxOGp3U0Jz?=
 =?utf-8?B?VndXdnFaSVpkTmM1NW9hOGdiSE9iRnBnT2d5TXBJR2tWaFZ6UDhWeGNHN2Uz?=
 =?utf-8?B?VGtQYld2S3A2TFFSbFJCd2didkg2WXZZajYwaG1oYzdPT0Ivc05OUGpSK2di?=
 =?utf-8?B?UkhNS012ZUh4VUhrVVVQODBYWW90a1lLUUU5UUFTNTJWbmtUVHZrKzZKdUVV?=
 =?utf-8?B?UEJHeUxveFBtN1FabjRmcGdWamhBZGd5UUlJbDRwZGQwSFJ4b0NlM0ZyTmFx?=
 =?utf-8?B?QUVVdTdhL2ZjcHlOR3VqQXp1ejk4THZsV1lUN1d0NEFKVVMyeWF0Y1lYWEx1?=
 =?utf-8?B?OWlHbTYyT1ZMZWxpSTIrUDV6M0oyK1U5cmZBUnFHaHRmOVVHYm1qcTVxNGgx?=
 =?utf-8?B?djd5ZkpHU0wzZXhlS0F3ancyMzl4NGhSUTBLdWRoanV4Z1c1L2wzUHAxMWdD?=
 =?utf-8?B?UVhyWERNMTJkekE2RU9Hd29USnd3UEp2WWpSSndJdnZ3L3lZakR1NzhCYTJM?=
 =?utf-8?B?VGt1RW10K3ZwR1dROFVKN1JMNzJLSGRrdWR2QVJ4ODdtTHh1SlhVZXNUeFZD?=
 =?utf-8?B?NEwzUkVZMHZqOHJrY1ZLdWxkRjZEWm5YMCtobU1NTi9qajNpeU43cVBvWTg3?=
 =?utf-8?B?UHJaSEsvVVFZMW5uTVhIR05WUEs2UVl6aEtzam11ZmdTRC9TdGl2alVGM0xN?=
 =?utf-8?B?QWtrSis0T0c1NzVqT2NvOVh3b3lvM0FwZ1BkZFk2L0hhNWVFeWFkZDErdlA1?=
 =?utf-8?B?UnovaGFaNTBhUmNYY2J3RnIvWXFydS9TUTBjcW9FbVJMYzZpS0JBeGNibFZX?=
 =?utf-8?B?Yk5oUWN1L3IxRDgvRzZKTmpPakhFUDhUaHgyVEdWRVVXNFJqZStIL1l2RzNV?=
 =?utf-8?B?WTdxZEZXbGsxK2xka1BIT2wyeTdocis3TlBDRDZ0WmZMNEJObHArZHYxdUFo?=
 =?utf-8?B?S2ZSTzh3blVkQXhMUXBheTRnalZUSHJoLzJKWWZWM2s2WW1SVUpKWTljSDRr?=
 =?utf-8?B?K3FodFZKVmRETzlLeW4rZC9leTFXZnUxNVlwZlpzZmEwQmUzdmdjdEcwR2Nn?=
 =?utf-8?B?YWNldG92UzdsY1NKWVR4M0FkeDl3Qm9pTmY1d1dZcmZ4SDNYMHBsMzM2Vmhs?=
 =?utf-8?B?V0dieTRadlBTQW5lSkRsRkZ2TG9OYWQzeUJnd21LOVVxalFsem1qRFVEVEt4?=
 =?utf-8?B?Y1dVeS9qckxSdmx0TDdoWURMQkp6QnFqb2pwa0d5Wk1ZcTlxSWE4WVpyamhB?=
 =?utf-8?B?aGY5am0yY0w4QTRHQUsvV2tGU0J6RFRubHlKMWxxVCtMTkFCN3U3OUttOWhr?=
 =?utf-8?B?WVV4VUdhSW5NZUJiUUdVbmcxbEZKRFRwbFFGYkFhMHdzbHYxZFVsQ25TbXB1?=
 =?utf-8?B?UzJnd0h3bWt4TWhSQ3I3bGNCK2wzK0hmM1pKbFltQTlDTjNuY3FxVEIxbFds?=
 =?utf-8?B?UlNsbXIwMStvRnJ6RzBSSEowZjJwYmhpRkVZN3VzODFJMW83VG9SSE5VeTBV?=
 =?utf-8?B?bWxVSTloR3MyL3MvNmExSGFDN2V5T04wY0g4amFzZ05CSGdNUjVCcW9LM25O?=
 =?utf-8?Q?zodld7rDCZ13H6JQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad065da-eae4-4f3d-eefc-08de5dfa753e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:19:02.4878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMshoa0hIrlauMhMH/wag8PhLLs/aw440QzgMH+Lgq8z2UaCGqI5NZWPxGkuR4g7haQWrvhXp0T1ZvofRrWitLvAPcwRhSlaDXS331ygvAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4682
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

 

On 1/24/2026 12:50 AM, Vinay Belgaumkar wrote:
> Move enable/disable GuC RC logic into the new file. This will
> allow us to independently enable/disable GuC RC and not rely
> on SLPC related functions. GuC already provides separate H2G
> interfaces to setup GuC RC and SLPC.
> 
> v2: Comments (Michal W), remove duplicate c6_enable calls from
> xe_guc_pc.
> 
> v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
> (Michal W)
> 
> v4: More comments (Michal W)
> 
> v5: Remove rc_init and use enable/disable (Riana)
> 
> v6: Link to kernel docs (Riana)

nit: you may keep change-log under ---

> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  Documentation/gpu/xe/xe_firmware.rst |   3 +
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_gt.c           |   1 -
>  drivers/gpu/drm/xe/xe_guc.c          |   2 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       |  70 +++-------------
>  drivers/gpu/drm/xe/xe_guc_pc.h       |   1 -
>  drivers/gpu/drm/xe/xe_guc_rc.c       | 114 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_rc.h       |  14 ++++
>  drivers/gpu/drm/xe/xe_uc.c           |  10 +--
>  drivers/gpu/drm/xe/xe_uc.h           |   1 -
>  10 files changed, 152 insertions(+), 65 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h
> 
> diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
> index 5d23e9f27391..9c15a300bc62 100644
> --- a/Documentation/gpu/xe/xe_firmware.rst
> +++ b/Documentation/gpu/xe/xe_firmware.rst
> @@ -31,6 +31,9 @@ GuC Power Conservation (PC)
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
>     :doc: GuC Power Conservation (PC)
>  
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_rc.c
> +   :doc: GuC Render C-states (GuC RC)
> +
>  PCIe Gen5 Limitations
>  =====================
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b39cbb756232..2062602c1bf3 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>  	xe_guc_log.o \
>  	xe_guc_pagefault.o \
>  	xe_guc_pc.o \
> +	xe_guc_rc.o \
>  	xe_guc_submit.o \
>  	xe_guc_tlb_inval.o \
>  	xe_heci_gsc.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9d090d0f2438..c8a1d44bbf3a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -852,7 +852,6 @@ static void gt_reset_worker(struct work_struct *w)
>  	if (IS_SRIOV_PF(gt_to_xe(gt)))
>  		xe_gt_sriov_pf_stop_prepare(gt);
>  
> -	xe_uc_gucrc_disable(&gt->uc);
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_pagefault_reset(gt_to_xe(gt), gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..f66b0c987b09 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>  #include "xe_guc_klv_helpers.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
>  #include "xe_memirq.h"
> @@ -1609,6 +1610,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>  	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>  		int err;
>  
> +		xe_guc_rc_disable(guc);
>  		err = xe_guc_pc_stop(&guc->pc);
>  		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
>  			   ERR_PTR(err));
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 54702a0fd05b..cf02c53ca3c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -92,6 +92,17 @@
>   * Render-C states is also a GuC PC feature that is now enabled in Xe for
>   * all platforms.
>   *
> + * Implementation details:
> + * -----------------------
> + * The implementation for GuC Power Management features is split as follows:
> + *
> + * xe_guc_rc:  Logic for handling GuC RC
> + * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
> + * xe_guc_pc:  Logic for all other SLPC related features
> + *
> + * There is some cross interaction between these where host C6 will need to be
> + * enabled when we plan to skip GuC RC. Also, the GuC RC mode is currently
> + * overridden through 0x3003 which is an SLPC H2G call.
>   */
>  
>  static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
> @@ -253,22 +264,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  	return ret;
>  }
>  
> -static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
> -{
> -	struct xe_guc_ct *ct = pc_to_ct(pc);
> -	u32 action[] = {
> -		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> -		mode,
> -	};
> -	int ret;
> -
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> -	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
> -		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
> -			  mode, ERR_PTR(ret));
> -	return ret;
> -}
> -
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -/**
> - * xe_guc_pc_gucrc_disable - Disable GuC RC
> - * @pc: Xe_GuC_PC instance
> - *
> - * Disables GuC RC by taking control of RC6 back from GuC.
> - *
> - * Return: 0 on success, negative error code on error.
> - */
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
> -{
> -	struct xe_device *xe = pc_to_xe(pc);
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret = 0;
> -
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
> -	if (ret)
> -		return ret;
> -
> -	return xe_gt_idle_disable_c6(gt);
> -}
> -
>  /**
>   * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>   * @pc: Xe_GuC_PC instance
> @@ -1217,9 +1188,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		return -ETIMEDOUT;
>  
>  	if (xe->info.skip_guc_pc) {
> -		if (xe->info.platform != XE_PVC)
> -			xe_gt_idle_enable_c6(gt);
> -
>  		/* Request max possible since dynamic freq mgmt is not enabled */
>  		pc_set_cur_freq(pc, UINT_MAX);
>  		return 0;
> @@ -1257,15 +1225,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
>  
> -	if (xe->info.platform == XE_PVC) {
> -		xe_guc_pc_gucrc_disable(pc);
> -		return 0;
> -	}
> -
> -	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> -	if (ret)
> -		return ret;
> -
>  	/* Enable SLPC Optimized Strategy for compute */
>  	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> @@ -1285,10 +1244,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  
> -	if (xe->info.skip_guc_pc) {
> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +	if (xe->info.skip_guc_pc)
>  		return 0;
> -	}
>  
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
> @@ -1309,8 +1266,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	if (xe_device_wedged(xe))
>  		return;
>  
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> -	xe_guc_pc_gucrc_disable(pc);
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0e31396f103c..1b95873b262e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -15,7 +15,6 @@ struct drm_printer;
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>  int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> new file mode 100644
> index 000000000000..fc57e5290635
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/device/devres.h>

nit: quite unusual to include devres.h directly

> +#include <drm/drm_print.h>
> +
> +#include "abi/guc_actions_slpc_abi.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_rc.h"
> +#include "xe_pm.h"
> +
> +/**
> + * DOC: GuC RC (Render C-states)
> + *
> + * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
> + * GuC RC can be enabled independently of the frequency component in SLPC,
> + * which is also controlled by GuC.
> + *
> + * This file will contain all H2G related logic for handling Render C-states.
> + * There are some calls to xe_gt_idle, where we enable host C6 when GuC RC is
> + * skipped. GuC RC is mostly independent of xe_guc_pc with the exception of
> + * functions that override the mode for which we have to rely on the SLPC H2G
> + * calls.
> + */
> +
> +static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
> +{
> +	u32 action[] = {
> +		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
> +		control,
> +	};
> +	int ret;
> +
> +	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> +	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
> +		xe_gt_err(guc_to_gt(guc),
> +			  "GuC RC setup %s(%u) failed (%pe)\n",
> +			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
> +			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
> +			   "UNKNOWN", control, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_rc_disable() - Disable GuC RC
> + * @guc: Xe GuC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + */
> +void xe_guc_rc_disable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	if (!xe->info.skip_guc_pc && xe->info.platform != XE_PVC)
> +		if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
> +			return;
> +
> +	XE_WARN_ON(xe_gt_idle_disable_c6(guc_to_gt(guc)));

use xe_gt_WARN_ON()

> +}
> +
> +static void xe_guc_rc_fini_hw(void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	xe_guc_rc_disable(guc);
> +}
> +
> +/**
> + * xe_guc_rc_enable() - Enable GuC RC feature if applicable
> + * @guc: Xe GuC instance
> + *
> + * Enables GuC RC feature.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_rc_enable(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	xe_gt_assert(gt, xe_device_uc_enabled(xe));
> +
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
> +		return -ETIMEDOUT;
> +
> +	if (xe->info.platform == XE_PVC) {
> +		xe_guc_rc_disable(guc);
> +		return 0;
> +	}
> +
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_enable_c6(gt);
> +		return 0;
> +	}
> +
> +	devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);

you should check for error here ...

but since this function can be called many times, is this something you really want?

maybe there should be xe_guc_rc_init() function which would register this fini() action just once?

otherwise you should remove that action during explicit disable() call

> +
> +	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> new file mode 100644
> index 000000000000..c980b0fce472
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_RC_H_
> +#define _XE_GUC_RC_H_
> +
> +struct xe_guc;
> +
> +void xe_guc_rc_disable(struct xe_guc *guc);
> +int xe_guc_rc_enable(struct xe_guc *guc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 3f63c2a7e86d..d9aa845a308d 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_guc_engine_activity.h"
>  #include "xe_huc.h"
>  #include "xe_sriov.h"
> @@ -214,6 +215,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
>  	if (ret)
>  		goto err_out;
>  
> +	ret = xe_guc_rc_enable(&uc->guc);
> +	if (ret)
> +		goto err_out;
> +
>  	xe_guc_engine_activity_enable_stats(&uc->guc);
>  
>  	/* We don't fail the driver load if HuC fails to auth */
> @@ -242,11 +247,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  	return xe_guc_reset_prepare(&uc->guc);
>  }
>  
> -void xe_uc_gucrc_disable(struct xe_uc *uc)
> -{
> -	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> -}
> -
>  void xe_uc_stop_prepare(struct xe_uc *uc)
>  {
>  	xe_gsc_stop_prepare(&uc->gsc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 5398da1a8097..255a54a8f876 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
>  int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_load_hw(struct xe_uc *uc);
> -void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_runtime_resume(struct xe_uc *uc);
>  void xe_uc_runtime_suspend(struct xe_uc *uc);

