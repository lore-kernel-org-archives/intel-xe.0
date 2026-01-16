Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3233EC982C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 21:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21FB10E00E;
	Fri, 16 Jan 2026 21:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLk3vEfb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832DD10E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 21:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768599042; x=1800135042;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PI+4daS851/iw0KQ8+rJRjztaMaAkTosP39+WFCQ76U=;
 b=NLk3vEfbk1VAONQczeeMVsWOhmu3Q82K7oy5fCohJYB20yxuIvhzv7YV
 NgRm8c1Ffkl2kOUyQxb1fw1uHXWeBTPQD9i0LXqoeBNO1Nmz4DKE4ucZ6
 +9KmWV/ZdwBdMDFyuxjcBRD2xCNknw3R79nc7imtThIyz0DiYba0WgSrw
 ZgOhaLDkUMlr6bXYyw1Js63pS2/hTiJYULxosgZh20XELYTSDpx7k5CCB
 MMMjgL9rDP+/d9JlNjdzEGEMjjsqiyLV3IrmHYuGnZ3XO582pwE2eF/AN
 F612F0FKRI/DALXpHGCs2pdG3Gs2Nv0Q40YNMpBQ88Ex+0cKKtqf9Wh2S A==;
X-CSE-ConnectionGUID: sCEIb7lISUOYPY5vDtnNKA==
X-CSE-MsgGUID: H9+T3dSzQjO2oM9B23Zkvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69967331"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69967331"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:30:41 -0800
X-CSE-ConnectionGUID: pTKs7NhyTYOLA7xQqcDuCg==
X-CSE-MsgGUID: nowqkJssT0+DpfhtN+c5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204571971"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:30:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:30:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 13:30:40 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:30:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbWlpkHz9WfyVnOddbH3G+3w1X3oO9d1BfC/0b772dQEqOGTpWVFYsyjsqUdoJP1mhEgMcjfE4Az51FL+veQLmroDWQJO1hvF11a7AWDttYUDvJxOg0tEAhSjHMeo3y1g8+PATWv/Ss4mk0ND06hvv+B/bxjwm9QoolMVA4m9Z9nX4d7kFu0yFOIHn46GFnYjIZVTtyG8jZP6/i6tEi5kIwk/XB4OL6DpXGR2vkLGjz6r0kyhkiVGbAbopp/aXyELe0mmNqW7tUo88g4xc2CScXGVGu8SRmBp8AM0XztQWKy4o9td/HYN7qEUigLQjczUreOl4pxKYmuUL4tvAV6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/xwb6yHWveWKhGlF2CzgGYvc+J1gR/hM++T5Brvxzw=;
 b=YM2zIJAepG5ETCzG2k4Ukxf9o/7ZAlMBIOYbivxbdmt/CwFa3L61ENbmZsSUyriTuJj8+xwKycLHGOLxySsxPrv6be00gGO5U9GDEOEwHyEDhJIqvhwfBO4wl7Ovs+h5eizhss9bpuBfgzDUrhm++0rmo2NMqv3AXJH7BOXY1S4YxumumpJC6Ebhpu08tw9tXkd829c061rIT9n1ATzc3bJloxfwtzxtaP/zah2lywms710ruz12ndDzZEJOzgCF0KbVaMQ78RedHsKumBOxTJgAmQXAP/xqAESwegaP2bC6xgR8JhwKuy5Tvkpe5r/efU0CRUeYHc+T0cUC6jvZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 21:30:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 21:30:38 +0000
Date: Fri, 16 Jan 2026 13:30:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v1 2/4] drm/xe/sysctrl: Add system controller interrupt
 handler
Message-ID: <aWqt+lutUAsYyFsi@lstrano-desk.jf.intel.com>
References: <20260116093432.914040-1-raag.jadav@intel.com>
 <20260116093432.914040-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116093432.914040-3-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 17700b78-5b2c-48c5-58d2-08de55467e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enFnSDhNd3pHbGF6eExRVGZ5NFpTRWRsZEhNeHVEREYrd2x6RzVGYjB0Mlh5?=
 =?utf-8?B?ZDQwQ2wwTFdwejBaTERvSk84Y3VSTzVtT2RnazNnWkIzSWYxSHVTYndSWjdo?=
 =?utf-8?B?M0orR0c1OG4yYVBWYXBDcHdNQTJFNFlleU1tc0tOcUdpdWtaL3VNbGdaL1h2?=
 =?utf-8?B?NVZoV0o3Y2w5bDArTTExOFVzK1d6dUVKaUVvMGxEMlhYc3dSb21Ja3l4NGFC?=
 =?utf-8?B?OThwdFQ1SVBhbm9uTU5WY1JPRWl0UHpJNzQ0V0NhOExpNEpDU002emtSVk0y?=
 =?utf-8?B?VVZDVnJ1cDFkNFNkRDdWeWN5Z2QyNlROQ241QkpOMSs3RlNjd2R6bFV2SWkv?=
 =?utf-8?B?QmN0VWE3TGpPb1BlS00xODZ3ZjRFQmIzek4zdE9PMHFGa1RMbjRNYmM3dHhV?=
 =?utf-8?B?MHdFNkw1OVI4anI3RVdnaE55aG5sYTUzRGRnampiTU44eWdkVGR1VTBrd0Qz?=
 =?utf-8?B?SFRSRE1rSXF0bVVHazA5SU1vNk0xR2NoU1dESnBpaVZMS3MxWVp5US9zMjZT?=
 =?utf-8?B?aUkvRUhrUjdsVlBSODUvNDZhSFRrUkt4V2tKOUhlNG9PR0t0OENuV2RpQlk3?=
 =?utf-8?B?ZXlEZ2ZBWW1abW1nMmg4aTIvRTVXam9IUXRhRFpJeStIT3YvNzVLLy9ZemJV?=
 =?utf-8?B?dzdSaFY2NWhsdUFHVUs3ZGVrdTBwcGk0bE1TNy9YamhzZk1kZnpyUTRpVG9J?=
 =?utf-8?B?NDQyb2JuWDFBMXdNb0ExUGRYeE9ISUQ0VXdJL2ZCMWRhRDVUYWJ3MWJzaTl3?=
 =?utf-8?B?NGs2UkNiYjkzTjNOdjdoU3hrcnM5UkIvUEVzaHJ2Y2xObG9ZM3J2R3VrV0pI?=
 =?utf-8?B?OE5RT3JDS21tYVJOdTNaand2QnpDK0JsZ2tlcHp1elhHYmJ4YS9Pc3JuVFpX?=
 =?utf-8?B?M0hrN0M5d0FyQ2ZLU213M0xDZk53MlR0Zjh1UkIxM3dEVExYSUxxM1lhSDJq?=
 =?utf-8?B?OGFSS1Y4UWU1bUxHanVyaXlIVTlDWCt4L1JiQ3QreTRKdm80QnVLT1RGcDhy?=
 =?utf-8?B?MUtidzFVL3lqUXNKOUVsQW5haUlvZXRVZFl0Z2JLaHhOOTNYMEU2NUNWZUg1?=
 =?utf-8?B?QVNZZ0hUMW13dnAwZTVJTGJQNkhZZ3ZrSUtoSVJ0bFpUblJJeUZlV3hXUHI3?=
 =?utf-8?B?WWZ2SWdFQlRFbFNRd0t6Rjl2NXRwMkhUaVNLeitaZmtqenlSd0tJaG5id2FV?=
 =?utf-8?B?eHhyK2E1YTFpbmVpS3JjR0k2V1VEU0dvRzY2d25UcUkrQUV4dHVaRXlJck9a?=
 =?utf-8?B?cldGMkRXM3dlSmR4SktNdGtDeFNEcmlkS3V1bWp3QXl2VXJ6ZkFwUFd3c3RV?=
 =?utf-8?B?SVg3Nk1uUHFEVStRR0R5QlpqRmVVTlpTc0hITlhkOXlKK0NSbGdJUVlsYmtq?=
 =?utf-8?B?Y3dQSVF1R1gzaDc1bVFjWDQ1MHIxRjMwRHp3dmFGYkRrRURMR0dTR1VlSlFi?=
 =?utf-8?B?K1ZSK1NPelFuNnlMVFdGLzBFcGRMQ0xCSFhDQVJVL1MwVFErNEtGZTE2UTFU?=
 =?utf-8?B?Zjkvb2tUMTAyK1dOZ25ZcTVJNXdYMy9CN0UxZE5sMXREdEZFKzZmTE14akIx?=
 =?utf-8?B?NXFNWEgxam9nSHhYcGdMUER3ektVRytzYkhDSjE0dG14cHFFTUdmeS83R3N1?=
 =?utf-8?B?NmE3LzlLWmlCU1lQQ3JTeHg5M0NsdTBTdFdKK2ZpQnRldFZuZU5GUkZMUjAw?=
 =?utf-8?B?RmVzUEdZQUFrb2NrdHBhUGpRd3orU1RKYTM4dlQ4RmU5RndNaXJNVnEyYUUz?=
 =?utf-8?B?VGZRekZyZnJVSEcrVkFaWitsaFYwak1YYUpXL2k3V1JSV3FNeHNPNE1VQ2l0?=
 =?utf-8?B?N0Nnd0lrL0NGb2U1eERyc282K1ZhZ3NVdm4vd2ZyZUxUdFo5dEhHQ0pLU3Yv?=
 =?utf-8?B?SVlEaHArWHp6SW04c3BhQzNuOXhtUTJUQ3M3WmRjejV2NlFoTnk2RlFnUE1X?=
 =?utf-8?B?Yks2dVVhNzIvb2N3aUtVRjNZQ1R4eVE4bVlvRmFBa1VRSWo1RjlyeVhyTVVB?=
 =?utf-8?B?NXFDOVREVXVIR3htUE1XT2FSMlZMTjZhMnNlZWVyQWxWYUtUNzc3ZEZ6L3ZH?=
 =?utf-8?B?QjY2Y2lCbE0yMVNMUkVlcS8wWVBPam5YRFp1ZWdseXVFZmhSeVo4UXVZcDZv?=
 =?utf-8?Q?1h2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVM4MmJYVFY0eW0rQmI0NFlvTzB5aGRRUnZNMUFmNkV1VnhoeXAwVnZneWUw?=
 =?utf-8?B?Q210aTFzMExTTUZzYjJlbDRVTUhXVDk5ZkVIWlNscEVEWUs3KzExNDZlU1hi?=
 =?utf-8?B?OFVtOXZKMlNjNEpRUERaT29hUWxzRTFpa2YxdTM2bklWSUxWNEpSekVoZ3lT?=
 =?utf-8?B?QUxmZURjMFBmdXIvd25nZzEzRnNWdGVJVUJGRDBGM0VUaktSdDgvWmhRWEVp?=
 =?utf-8?B?U1Fzc29vWnZ3bk1XdGRFT0EvdnNTRFc3dFNJNTlBTHhLSFBxTWZZY1JydGpO?=
 =?utf-8?B?aHRxbzlPUVJod3BGaENKcTQvQjROU0N4cDBmdUJtZXJjc0g1NDA5NnAxZnVa?=
 =?utf-8?B?K2hKZUNYbXMvU2FtT25VQnRMQ0hSaWdoc1NCNkVNSzVWeUUzQVpFOWFHV3g2?=
 =?utf-8?B?OUYycVY5WU1nYk4vUk5aeTFBTFpEUHVyWTJibjJkOVJZTjRqTmNMV21ITERo?=
 =?utf-8?B?cjJtYmlOOTNFN1RjM1RhbXB0Q0xjS1dPSGZzMjZFYXpRVCttWUZuVG9IbjdM?=
 =?utf-8?B?a2hjSXF1c3UzOUE0WU13QkVoQ0tneVVBbFpvZWZEWU1vVy9XZWphZmJxZGI5?=
 =?utf-8?B?U2RBZm0rUW4ySVVYUHpVS2tUbVdBSFFlMmM5eE5EODk2U1BOOXdLbWh4OTF5?=
 =?utf-8?B?TzlqbmdHcjBXTkMxS2p0WFFuaDVuenJDSk5EVDRkRnZpaXNsV1JVUjdMT0gy?=
 =?utf-8?B?cVY5YkROOHpadkxwc3dsSnhEcC9zVkcxcy9iVzZmdVlLQmFoOUxvVlhRMHA0?=
 =?utf-8?B?V1ZNamNma3h1U1N1YndPeThwaldQaDdHQy9kQTBpa1E4Wi82QnM5MzdOTUlQ?=
 =?utf-8?B?UzJxTmg2OGdRSm8weDJhRU0yT0lDRFduTXBtbmF3K2RqYmJwekh1SkEreDRU?=
 =?utf-8?B?MlhlY1Z0VTFOUnl5WlFJZFNsVjM5WTRxWUlGN0lEQ2Z0eDlmTE9GbjVOTnJa?=
 =?utf-8?B?U3BuQ0IrL2JzYWNFbzg4d3dxazJxclFBcHdZVzQxa0tFamxqWWxzd3RMQjR5?=
 =?utf-8?B?SDFLOUNDcTNIbE9Icm5sMDIyZ254NThIdTJmSGpuZHVQN3RwQXpEc1lDRVFn?=
 =?utf-8?B?SElDNmhLVUx0UU95Nm96UW1CTjFucWV4SXUzWDRhUUVZbXFSTlAxWG1sOHAx?=
 =?utf-8?B?TFVEcW1NbVdnT29Ec0QxdjNsZkN1blM3a1RiL0htQWxFK3NxYTdSVzJTaTlS?=
 =?utf-8?B?TGJoS21BRVp5SkoxL2t3RkZWaTNCR1hsRXNDYmJhQ1EvaWNRMVdsN1pPSUtt?=
 =?utf-8?B?RkhPL2pwankvbHY3aHNFU0EwR3h5OVhTK2IrT29FYkVOS29EdzdFWDI1NUl4?=
 =?utf-8?B?M3g5MHptZzIxNnJKZVpVWXJ0ZDh3L0wvOThRMTVCdVhjTFVsV1lmcW1FcHB6?=
 =?utf-8?B?UWQwRmNiejZQRUFseS9TS1RzQm96QlpqNXhwT3RPNUk1bW9yeDZXY0x4bkpr?=
 =?utf-8?B?Zkp0VTNKTzlsS0FROUdVdWlRNU9PR2ZqMVdxcjBndmRCb1RobmVjcmRxQ0FQ?=
 =?utf-8?B?QWQ2K2Z6ZXlUWHYzbnFDYmtTS1BTdkM3UEpuOWZPc1h5V1NGcjdSNjZSU21H?=
 =?utf-8?B?M2VsWS8vRi9mK3c5a0JBYTl5WmJzRzAxa3k4c0Fja3hYd0ZuRTAvU1ZicWxU?=
 =?utf-8?B?N1VkRjFnOFkzeStPOUlpckxyNjRtcGIySzZ0QU4vK0U2aEhLNjVxLy90RFRw?=
 =?utf-8?B?d2N5d2craWVTcGpkS3VYRVNnY0d3NHNxVjlEaWxnbzFUa2RaOENsTW5YQWxC?=
 =?utf-8?B?R3UzazRKaVNoUUovdEU3RDV2NUJyNzFXM0JCYzdkMkU3clRIcjY1NXJja1E2?=
 =?utf-8?B?cGpjR0k1SUJCSGlzekowYWlVc0YxU3JyZUJPaGxVMmo2MGNwVW9Rbi9uMVp2?=
 =?utf-8?B?YklnSm9rYnp4WkY5OFFzRjlUanExRERmak5qbVZYUHJjaEpTTlZia0RzcHV4?=
 =?utf-8?B?Ni96bXEvNElHY3NQZ2ZRSVFsZkZOTjRxem9tVjhpTVRBTFFPQW53cTg1dDU2?=
 =?utf-8?B?ZHo2V1gyb2FoRWNrdG8rRUcwcE5zL1cyRVh5TW01R0Q4V2pJczB3b1E1cnlB?=
 =?utf-8?B?QTVFZG9TSXkxZzA1Yks4akV3cndidFg0Y0tGUnF6K0Y1UjdtaWZKOHYxQzVw?=
 =?utf-8?B?V1hZSXNkbkh2Ym5Ud1pZZTBjbGZJRGIyTTZvWXpiSWZHai8vY3FsUmtGaTRV?=
 =?utf-8?B?YmgzVVFyb0xiOC93SjZlY21SSU02OFZrWERyb2hpQUx2a1h3b25DTVd2Ulhj?=
 =?utf-8?B?b25RRkRtN3ZOcEpzWjBPQ2pCS2MyRVg0eW53NStqVXNBR0k3YWl2NGkwZ0kv?=
 =?utf-8?B?MTJZdlBwRG5TcUlrL0FyM2JZME45S0NUc3dYcEFSRVlpRGR5UXdPREdLWVB5?=
 =?utf-8?Q?6ErU+a5Tsap5HnB0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17700b78-5b2c-48c5-58d2-08de55467e13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:30:38.5915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4+mf5ZXgg3tFIoFLYjqnzxYLtwb+awFcacPT0i7pqduj0xIp59x0tATkmFfJhgETmXMaaKCax2jQcMnmjg6zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
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

On Fri, Jan 16, 2026 at 03:03:31PM +0530, Raag Jadav wrote:
> Add system controller interrupt handler which is denoted by 11th bit in
> GFX master interrupt register. While at it, add ordered workqueue for
> scheduling system controller work.
> 
> Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>  drivers/gpu/drm/xe/xe_sysctrl.c       | 39 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl.h       |  3 +++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
>  5 files changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 9d74f454d3ff..1d6b976c4de0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -22,6 +22,7 @@
>  #define   DISPLAY_IRQ				REG_BIT(16)
>  #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
>  #define   I2C_IRQ				REG_BIT(12)
> +#define   SYSCTRL_IRQ				REG_BIT(11)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7560a45f7f64..9e49e2241da4 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -24,6 +24,7 @@
>  #include "xe_mmio.h"
>  #include "xe_pxp.h"
>  #include "xe_sriov.h"
> +#include "xe_sysctrl.h"
>  #include "xe_tile.h"
>  
>  /*
> @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  				xe_heci_csc_irq_handler(xe, master_ctl);
>  			xe_display_irq_handler(xe, master_ctl);
>  			xe_i2c_irq_handler(xe, master_ctl);
> +			xe_sysctrl_irq_handler(xe, master_ctl);
>  			xe_mert_irq_handler(xe, master_ctl);
>  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 8daab7703247..1d78916dd6ad 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -7,6 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/mutex.h>
>  
> +#include "regs/xe_irq_regs.h"
>  #include "regs/xe_sysctrl_regs.h"
>  #include "xe_device.h"
>  #include "xe_printk.h"
> @@ -27,9 +28,17 @@
>   * with the System Controller through the mailbox.
>   */
>  
> +static void xe_sysctrl_work(struct work_struct *work)
> +{
> +}
> +
>  static void xe_sysctrl_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	cancel_work_sync(&sc->work);
> +	destroy_workqueue(sc->wq);
>  
>  	xe->soc_remapper.set_sysctrl_region(xe, 0);
>  }
> @@ -56,6 +65,14 @@ int xe_sysctrl_init(struct xe_device *xe)
>  
>  	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>  
> +	INIT_WORK(&sc->work, xe_sysctrl_work);
> +
> +	sc->wq = alloc_ordered_workqueue("sysctrl-ordered-wq", 0);

We do have drmm_alloc_ordered_workqueue, so you don’t need to manually
clean up the WQ. We don’t use it as widely as we should in Xe, as it was
added after we merged, but we should use that helper going forward.

I do have a question—does this require a dedicated WQ though? i.e.,
would a system WQ work here? We allocate a lot of WQs in Xe, but
typically that’s done when we really care about ordering. For example,
we may have multiple work_items scheduled on a WQ but want only one of
them executing at any given time, so we schedule them on a single
dedicated WQ. Here you only have one work_item, so I believe you can
probably just use one of the system WQs.

Matt 

> +	if (!sc->wq) {
> +		ret = -ENOMEM;
> +		goto err_sysctrl_fini;
> +	}
> +
>  	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
>  	if (ret)
>  		return ret;
> @@ -67,4 +84,26 @@ int xe_sysctrl_init(struct xe_device *xe)
>  	xe_sysctrl_mailbox_init(sc);
>  
>  	return 0;
> +
> +err_sysctrl_fini:
> +	xe_sysctrl_fini(xe);
> +	return ret;
> +}
> +
> +/**
> + * xe_sysctrl_irq_handler: Handler for System Controller interrupts
> + * @xe: xe device instance
> + * @master_ctl: interrupt register
> + *
> + * Handle interrupts generated by System Controller.
> + */
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	if (master_ctl & SYSCTRL_IRQ)
> +		queue_work(sc->wq, &sc->work);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index ee7826fe4c98..5919310b9db9 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -6,8 +6,11 @@
>  #ifndef _XE_SYSCTRL_H_
>  #define _XE_SYSCTRL_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_device;
>  
>  int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>  
>  #endif /* _XE_SYSCTRL_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 88a34967688b..14fc80dfee6e 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> +#include <linux/workqueue_types.h>
>  
>  /**
>   * struct xe_sysctrl - System Controller driver context
> @@ -18,6 +19,12 @@ struct xe_sysctrl {
>  
>  	/** @phase_bit: MKHI message boundary phase toggle bit */
>  	u32 phase_bit;
> +
> +	/** @wq: Queue for sysctrl work */
> +	struct workqueue_struct *wq;
> +
> +	/** @work: Worker for pending events */
> +	struct work_struct work;
>  };
>  
>  #endif /* _XE_SYSCTRL_TYPES_H_ */
> -- 
> 2.43.0
> 
