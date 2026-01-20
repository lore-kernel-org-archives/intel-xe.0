Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4250BCA5FB7
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 17:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD2110E1B2;
	Tue, 20 Jan 2026 17:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9MjmNOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677A10E1B2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 17:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929317; x=1800465317;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2TVjcisO46NgF8EpQaOHUDzWTidbzvQsL2DzBlBWecs=;
 b=l9MjmNODVrKU2sfOAvJoxIagWV4qXPXphpviQN2nAh6k4LEfvkUIeqKW
 VKYTRd3P+VpH33ouPGfwt0r4GwdRS9+WZ4UhhcRA2WdS65H30QMzVKVy7
 U+Mts/oU4FyqzsGo3KyQrfKPamxCBZB7Gi+VxTLRgqwuk0NP1gZt6tAWV
 UVu6lEPMmZAuFK8wUBx4Ca8GT5uFSWEZtHUUu+19OekNIKraEVrk5d1mE
 8k7NCYBfcxpPYpw7ftGHj1+Y89sdLklmvZm9qP5or9elQ0MwCntMT+W99
 SJmIQFU4OUKOkIqa0+LYJfnF6AEPuNkENzCOjsFZijE2F3pl2rls2ApZE g==;
X-CSE-ConnectionGUID: TJW2KK30RHSUM3TwlB7MGA==
X-CSE-MsgGUID: 1wZbZU91Tt69cVgYbK2SnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95620119"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="95620119"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:15:16 -0800
X-CSE-ConnectionGUID: elTOSgHRT8WDLz1Tiv084w==
X-CSE-MsgGUID: EziZxYSZRiiLSBUmbhaCSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205428570"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:15:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:15:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 09:15:15 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 09:15:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilIqZGSjtM2H+gs+Ed7GS0+GMFeCLp0Pj4Am+cEbY+033JX65Y6W58Y2GdAg1Z184GFBp/FmVbMLulEiep8H2IMon5md4KfpZITuk1k9uZkR+4S4nRbgGbqP87P4aDJlpDKcrrQ0FJsYSoapCu5CLACtO1TClUcEB1BuVWkkwEQxBQSojAIzhfkH0AXu5pDriNx5smWx5J1fKSORVsSH2Gb2+PuAmT1cltIv8ylKHBDZrma4zIuIuSsTgHk0+1uYoGBbmsIGDCQBdeC5kbsdZ9zXA4XPl+DcR4AyGrpW62SRzl+hmRGTewkp1W//Vzio45cLhhBmbXcTil4Hen9pig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79+Kg1HZzqIxUKTX6dtSVAR/W97q7E/NAIaMnIMvUcg=;
 b=yD2nXS8D0wq0R/Bd4XlXBfmxr3bsHVXhv/uVHzGpn0JfX/RMpPYJTwF/HQwXHscqLNd6ijw6wNS6b3EsS8J9oK2WNdsFTE5VA+Jwy1WVni2kj87q19kwAMgCCcZsDIWoZny6/tFCFxQ+KOi9bhb013Z0lQP/TLQ6GxDXQ/6Vs1BDmjItyrIxGPatukqvf8eZkDkzglYnGPxqGzhnYdTDxJOk3ZmgQdSrPAVVNQUjIKKwmVP+UNTbAl0OKsD/IAehamfTDem8LV0asqsA6+mzquUvDoXCLHdyvYWtGqJflC/CCX+2vnw7B9T2PwJtfa52o/TI3WQewESGkzfLGUv5ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6186.namprd11.prod.outlook.com (2603:10b6:930:26::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 17:15:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 17:15:10 +0000
Date: Tue, 20 Jan 2026 09:15:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 3/8] drm/xe/madvise: Implement purgeable buffer object
 support
Message-ID: <aW+4HJRLVPHn++6v@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-4-arvind.yadav@intel.com>
 <aW+0HUCM9UvfTL05@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW+0HUCM9UvfTL05@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:303:b9::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: bd18db05-c4b6-47aa-f871-08de584777bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGJteWQ5K21qL1d5WDEzT0lCWEFZU1ZYKzBOM0I1V1hnS1ZIMTZBSWpDcHVu?=
 =?utf-8?B?ZmNhRC90WE0wK3MrdDJ1QVo3aFhxS0lia216aUs4UktLZkNvRzNoRml1Mi9t?=
 =?utf-8?B?WFBwVUN3MnhCQTlOeDMwRWNGbm9ramFDWEJYdUdsT0lBdEtNRGh5Sm1sQ1hk?=
 =?utf-8?B?UzZaMU4yMXc1SjVSekFHQWdPVHU5TUxMbFhUaUVKYWMvd280ZDlweHdrdUpY?=
 =?utf-8?B?ZUpHRDNXNXQwbjBVbFMxYzF3VFdxblJaR3J2YnRZZDlaTmphSUVPaWhMUjJJ?=
 =?utf-8?B?Y2p1dTRWUkFTWitPeFpHUHpKVlYweUxCV0VjY0hBbll2Qjd0eTB3Q2Q1ZC9T?=
 =?utf-8?B?dmxKbWh6M3J3d01pbXJyZlRWQWZvVG51dTFXWTZ6NjdOWWFhNHhqNG5jR1BO?=
 =?utf-8?B?ZVRPdW9uR2MrYUFLU09SeDVITjc1UXJtTHVaL01QcDB2OGRkYlp4KyszVVg2?=
 =?utf-8?B?cWcxSnRPYlVKbGpZR3ZIZk0rMW5wNGE0bUdPM0N3L0kxZUZiNDhIVVFmbUFX?=
 =?utf-8?B?SEptM2RWQS9QU0l4WFp4eGppOTlCUVZMb3dUYkdxOG9nMnZKVWpsL05LYWNq?=
 =?utf-8?B?MlBXakNoMU1mUW9vM2twNjVuRXJLRFlUakp3SmR3S2hLN0NDWDJZUGRsSmwv?=
 =?utf-8?B?U29EY1BuM1FrN0hzSDhSZWVLY2pLMlpUMHo1cGVsNFl3M0F5b3BWaWNqZU0z?=
 =?utf-8?B?SEpRUG9JU2orMGw4S2ZrMktESzY3WEM1YjlGZytSSEtqbkVrbWIxdThrdnFE?=
 =?utf-8?B?ajc0Y2dMWEJ6cS9EMUgzQ3R4a3B0akNjb2FDNHhqbDBEUlJnaUROUmRiR0Rr?=
 =?utf-8?B?TTA4OENOcnExMTFIRFByaEIvMkZrQWxqVWpmOEFQb1pBOEtBQUVPY1N0SkZZ?=
 =?utf-8?B?WFJwaFltbCsydHk2WHltTy96YTZVMkdBeG00SHg1WDhQZTB6djYrL0xVQVRq?=
 =?utf-8?B?L1dnN3g3SEdFdUJVWkI5VTVOWlpCbitmbHVwcU5QS1cxL2x3WUgyWEttaVJW?=
 =?utf-8?B?K0lGWXZIWGFYaTdHa1Q4cFJwL2xuWnhkUU5uZ09KWTNRV1lXWGlhRkFZcE9O?=
 =?utf-8?B?VUQ5emx3eGpkOUdXK0pOUkxtMWRuRi9LeWdTOHlBQkZSY2NSbGtodGduNldx?=
 =?utf-8?B?WUJmdTRUVlk0andaaUZWeHlDTnZCUkJHT04rWXFsbmJ4dGN2cDVrTnRqc1dU?=
 =?utf-8?B?Z3BIc2FqUk9iTloyZjdvTUJkc0txd1MzSkpDdU13dk4veU9vajdtWlArK3Q1?=
 =?utf-8?B?WktGZWs4WVVyODRaY2h6Z2FEbnQvWTMwbHh5b0MxaXJjNjdTN2sxbmZSQlZx?=
 =?utf-8?B?NFk1WllVQ2xBOEZjZlQrdEtvem1XNlpkUktNN2FlVFQ0RzlMYVl4eHQ5ODZI?=
 =?utf-8?B?WVVxNVRYaURkTmxndmN0eW51MkN3L1lzYm1kdFBZVHNIa3EvTTkremZWYjBG?=
 =?utf-8?B?a0FVYXdHYktuUVBicVRZbkVWVWFqYktiaThrbmhHZmpZT1oxdVovQmdpRVJQ?=
 =?utf-8?B?YmJTcUI5OVh0N1NmRFphakYrcW9nRHllWTRVelBiQzNFcWt6S1JKaTB5WXRk?=
 =?utf-8?B?SDV0Z0JhS2M3RThzVC9SYUtnVzIwTGFjdHY4bXNZQVQ4STRmVUMwbHJkVTA3?=
 =?utf-8?B?M256SEdNdXVYZCt2cm55Vmlkblp0U1liUWJwUm5sb1doMmNFVStPUlZlNW5W?=
 =?utf-8?B?R1o2QS9mMU1rMG42V3BLZFZqRjQrRXdnZjdBRExQM2VOZEIwcWlYWDBuYXQx?=
 =?utf-8?B?UERmOHYxU09ERE91bmpyMUIxQ2dpOGMzNEg2RGVkdTloQ2gwY1J6T1lhMU1Q?=
 =?utf-8?B?cGNKd3gyMUpVRGNnWEhsZ01EaXlFT25JdW1vSUJJcUQ1SE1FbEMzVmxZWnVG?=
 =?utf-8?B?VXBNQWNObHFuTEIwSFJJS1liblZTejhrVmovcUhPdUxRVEJabDdPQUgxdms0?=
 =?utf-8?B?SDc0ak1wOE0rT2pLZHQ3VDc2bktGbVovWWc3UXdTbk0zZXh1Z09XQUNGeU5i?=
 =?utf-8?B?SXJ5S0U1bVRqZGdPdng5bk0xS1d4T0RjZm9sMFdueExhdmhPd0NjYjY2NkY3?=
 =?utf-8?B?UXdWUUNGRXM5YUc3ZkVtS3Vsemh2VUZyQS9Gb251WnpOVXZMd2Z6SVRvdHI3?=
 =?utf-8?Q?HF2Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anBJczE2aWdQZlEwZFk1SmRIandMWjU0eTh3M1Zsa0g2Wm5uMUlObFZGZTNZ?=
 =?utf-8?B?U0NjeWNJSVdBaEs5MnJ4ZWlFaFNlSHMrMVpTaDVvM2tuVjdmb0ljdWVlR0g2?=
 =?utf-8?B?UFc0VWpHODhabnM5UGNUYlliQ21pV3NLbUlRNmwxM1BpeGw0ZUcwSmR0VUpr?=
 =?utf-8?B?cXllMmlQT2EweTM4V3FjWHZCZjg1akNINWtiWFJidGlnNFpkcVlLUng5bjJJ?=
 =?utf-8?B?OFQyQnp6UXRZQnRHbEtsSmE4TmMvRWwrdlRTZ3BReWJIeDZLMU5CZmk4MUg4?=
 =?utf-8?B?MkFMSCt5QzI0ZmE1eSt6WWJBRHFSSEhldllXbVkrOTlHWjlGS2U1SHE1RS9Z?=
 =?utf-8?B?aExMbGhiT083WHFFZmpnenhrdEFCZXgrVjNUTWdsT2VQT0xtYlNmN09ZeFFQ?=
 =?utf-8?B?Zjl5Ny93NGZVaTY1Skcxei9BQXY5UTlRNEVjWC9DT2FnU3lDOEZNSHprZ3pl?=
 =?utf-8?B?KzU4Kzl1ODdMVGxxRExjR3NiaFVsbHZNSHNzdVd0NTdQWVRVemlTeDBtYkI5?=
 =?utf-8?B?eThqaWpUWG0xVDVKaHh5Wmd3QTBxTG5ZRDdrZkRtdmM2c0gwb2FTQzQ5S21u?=
 =?utf-8?B?RHpmVXF2RUlWY0U1K2hCNHpQWlFPeU56R1BDMlM4YXVXWE9oelBOL2JOY2FR?=
 =?utf-8?B?bC9DZU1XcEtxNDU4ZFBwZlZ0L0VmOFdDSDFUdUR5a1BwLy8vUVFGTDM0c0pz?=
 =?utf-8?B?ZkZocHo3WkhXN3lkZmVWSjhyTWsvekQ5Vkk5UlIyVEZkU2V5T1ZGdjYwUzNS?=
 =?utf-8?B?NUJ5Q1BxdGRxQzV3MlcxN3FGYnRxNC9kc2oybjgrTXplN2NML0JhVHd1OTdR?=
 =?utf-8?B?NW5ISmZVUkV0OXA2cUxEYVQzSnhubDB2SnFZL0dSWE12ckJZQWZTN2F5S21q?=
 =?utf-8?B?K2FxejhWM1NDU1hmam52M0dtYlZUdEEvWjA5YXhudThzbkhqbTZTS2xWRlQr?=
 =?utf-8?B?YndseFR2T3hBeTczT0dpN0ozMXlwQXhRN2dMdFYvNkN6bVBKSXNZWU5rUWdG?=
 =?utf-8?B?WjdIamg5S1I4Y3VhT2U2cXRRRzQ3NlA3YzFON2pGSlpCR2w0MVlvNXBtbGZP?=
 =?utf-8?B?dXU2TmV2SG4yL3Azd0d5UkZDS0pjd2NIbWVvWWFkMldTcnZrelQ3bHZHVGNj?=
 =?utf-8?B?N2lnME5LSVc2c003U3N5UVczZnBEV0NMK3JIZnN4NzJDaDA1WXN2ZDBCWHZh?=
 =?utf-8?B?TmQ3ZHBzK0ZlVFZPMm9lVlRPbUdKSTlFK3pzV3c4czZwREFRSlUzb0lieFZR?=
 =?utf-8?B?UXJJTHRtLzQwSkZwZzl6U09ja0hnV0pWQU1mY2VzbXBJT3ljYnN3WFhzeGhO?=
 =?utf-8?B?cnhHWHhJWWM4NXlkU09vbUVDT3JPV2c2VzMrT3RUbkNGV0FJSW8rU3pKcm1R?=
 =?utf-8?B?TktqSG5HNnQ5RFdUVWNOSyt4d1hBcWtENHRtSHc4b2xVQmVHcUdWUnJQMjFn?=
 =?utf-8?B?K3hOaHhGNUxra0dndFFyWHo4OWdMR2t0eVdaajdBTkNLVmQrQkFJQ05LYklS?=
 =?utf-8?B?b0pXenR6dnp0V3lUQjNSTG1qMlJBWUNNTUdlaW5PeTd5bVBuNXdaUi82OStz?=
 =?utf-8?B?ZExtZ3gyZ0Y0MkFDVGlKOFZTOVYxZm5naEtML1d0cVplMDRSOWI1UG9DTW5r?=
 =?utf-8?B?VDJGbzFySkxNeUJwb3pLUkNydlB5R3BrZHpSUk1XUGFxb2Y5emZISkM0aHVF?=
 =?utf-8?B?cDl2OVY0SGtmbWUyaS94WGk3ZUcwekMyTTNCN3FyTkwvUHNKMUhGM0lpYWpG?=
 =?utf-8?B?VHROcUt5ZjVTWnRkVnlTWmh0Zy8ybVJobEhkQ2piT1A0SkRZMlkwaGF1WStL?=
 =?utf-8?B?aGxCZ0NLK2pDdHg2SVQvYndlbFpMcTMzaFhCUFlpQ0YzVkkwdi9XV1BBSW4z?=
 =?utf-8?B?QlM4VVVrV0s1Z1Q0V3FvWW96VWNjbmxIcGZUb2R3bEpnbEs3YnN0UlFxRVZL?=
 =?utf-8?B?bGtHRkp6S3gxaXBNWEVTV1BGL1dqclR6RzZLK1ovd0dxSk1Hbjhyd3BobjR3?=
 =?utf-8?B?enYyUjZjRUxZd1VTeUVaUmFYeDFlTVdRQWJ5VTdTKzVWQkszVFZiVjdCT0RC?=
 =?utf-8?B?c1AyTWh4R214VE02N1pJTi9PU1c1ZGVnU3ltZUpzNFdMMjVGbmpsQnNzb0g4?=
 =?utf-8?B?NllZcGJoVUlvZGwvZ2txYXBMNXZqSE5kNklyK1Z5RXJNc0hTNUhYTForY2lp?=
 =?utf-8?B?SHFqTmpLNDBNanZYd2FzcmJBcWhXTXNMSTZURTJrM2tMeGNCTysyRDZPZnFz?=
 =?utf-8?B?cUZSdGJvTHFkTWNENzZ2VzZBeEZYbkJGcXFMRHVmMDNSaEZsK1R4R21wY3JV?=
 =?utf-8?B?VmJuZkU0TjJFL0FDZ3d3aE4ySmQyQWtlM3BiZXV5S3RKSU81SUhBTUJJMmtp?=
 =?utf-8?Q?swlrYvsLhDu6h9Do=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd18db05-c4b6-47aa-f871-08de584777bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:15:10.9015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAD3gzwkrogGaGF2t+jmdwB4DWoIG0zDUPc2YvQEh3TdXQoTOC0W1UBecmLCRsMTG+mOYySRExIQ8s6x+42c6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6186
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

On Tue, Jan 20, 2026 at 08:58:05AM -0800, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:49AM +0530, Arvind Yadav wrote:
> > This allows userspace applications to provide memory usage hints to
> > the kernel for better memory management under pressure:
> > 
> > Add the core implementation for purgeable buffer objects, enabling memory
> > reclamation of user-designated DONTNEED buffers during eviction.
> > 
> > This patch implements the purge operation and state machine transitions:
> > 
> > Purgeable States (from xe_madv_purgeable_state):
> >  - WILLNEED (0): BO should be retained, actively used
> >  - DONTNEED (1): BO eligible for purging, not currently needed
> >  - PURGED (2): BO backing store reclaimed, permanently invalid
> > 
> > Design Rationale:
> >   - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
> >   - i915 compatibility: retained field, "once purged always purged" semantics
> >   - Shared BO protection prevents multi-process memory corruption
> >   - Scratch PTE reuse avoids new infrastructure, safe for fault mode
> > 
> > v2:
> >   - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
> >   - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
> >   - Implement i915-compatible retained field logic (Thomas Hellström)
> >   - Skip BO validation for purged BOs in page fault handler (crash fix)
> >   - Add scratch VM check in page fault path (non-scratch VMs fail fault)
> >   - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
> >   - Add !is_purged check to resource cursor setup to prevent stale access
> > 
> > v3:
> >   - Rebase as xe_gt_pagefault.c is gone upstream and replaced
> >     with xe_pagefault.c (Matthew Brost)
> >   - Xe specific warn on (Matthew Brost)
> >   - Call helpers for madv_purgeable access(Matthew Brost)
> >   - Remove bo NULL check(Matthew Brost)
> >   - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
> >   - Move the xe_bo_is_purged check under the dma-resv lock( by Matt)
> >   - Drop is_purged from xe_pt_stage_bind_entry and just set is_null to true
> >     for purged BO rename s/is_null/is_null_or_purged (by Matt)
> >   - UAPI rule should not be changed.(Matthew Brost)
> >   - Make 'retained' a userptr (Matthew Brost)
> > 
> > v4:
> >   - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c         | 61 +++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_pagefault.c  | 12 ++++
> >  drivers/gpu/drm/xe/xe_pt.c         | 38 +++++++++++--
> >  drivers/gpu/drm/xe/xe_vm.c         | 11 +++-
> >  drivers/gpu/drm/xe/xe_vm_madvise.c | 88 ++++++++++++++++++++++++++++++
> >  5 files changed, 191 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 408c74216fdf..d0a6d340b255 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -836,6 +836,43 @@ static int xe_bo_move_notify(struct xe_bo *bo,
> >  	return 0;
> >  }
> >  
> > +/**
> > + * xe_ttm_bo_purge() - Purge buffer object backing store
> > + * @ttm_bo: The TTM buffer object to purge
> > + * @ctx: TTM operation context
> > + *
> > + * This function purges the backing store of a BO marked as DONTNEED and
> > + * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
> > + * this zaps the PTEs. The next GPU access will trigger a page fault and
> > + * perform NULL rebind (scratch pages or clear PTEs based on VM config).
> > + */
> > +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> > +{
> > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > +
> 
> xe_bo_assert_held(bo);
> 
> > +	if (ttm_bo->ttm) {
> > +		struct ttm_placement place = {};
> > +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> > +
> > +		drm_WARN_ON(&xe->drm, ret);
> 
> I think since 'xe' in available here, you should use xe_assert in place
> of drm_WARN_ON.
> 
> > +		if (!ret) {
> > +			if (xe_bo_madv_is_dontneed(bo)) {
> > +				bo->madv_purgeable = XE_MADV_PURGEABLE_PURGED;
> 
> Helper to set madv_purgeable state /w lockdep assert?
> 
> Also perhaps assert valid state transitions in the helper (e.g., you
> cannot tranistion out of XE_MADV_PURGEABLE_PURGED.
> 
> > +
> > +				/*
> > +				 * Trigger rebind to invalidate stale GPU mappings.
> > +				 * - Non-fault mode: Marks VMAs for rebind
> > +				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
> > +				 *   and NULL rebind with scratch/clear PTEs per VM config
> > +				 */
> > +				ret = xe_bo_trigger_rebind(xe, bo, ctx);
> > +				XE_WARN_ON(ret);
> 
> I think xe_bo_trigger_rebind is allowed to fail if ctx->no_wait_gpu is
> set. In both the faulting fast path and certain parts of the shrinker we
> set this. So I think any error returned from xe_bo_trigger_rebind needs
> to propagte up the call stack.
> 
> > +			}
> > +		}
> > +	}
> > +}
> > +
> >  static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  		      struct ttm_operation_ctx *ctx,
> >  		      struct ttm_resource *new_mem,
> > @@ -855,6 +892,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
> >  	int ret = 0;
> >  
> > +	/*
> > +	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
> > +	 * The move_notify callback will handle invalidation asynchronously.
> > +	 */
> > +	if (evict && xe_bo_madv_is_dontneed(bo)) {
> > +		xe_ttm_bo_purge(ttm_bo, ctx);
> 
> With above, we need to send errors from xe_ttm_bo_purge up the call
> stack.
> 
> > +		return 0;
> > +	}
> > +
> >  	/* Bo creation path, moving to system or TT. */
> >  	if ((!old_mem && ttm) && !handle_system_ccs) {
> >  		if (new_mem->mem_type == XE_PL_TT)
> > @@ -1604,18 +1650,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> >  	}
> >  }
> >  
> > -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> > -{
> > -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > -
> > -	if (ttm_bo->ttm) {
> > -		struct ttm_placement place = {};
> > -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> > -
> > -		drm_WARN_ON(&xe->drm, ret);
> > -	}
> > -}
> > -
> >  static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
> >  {
> >  	struct ttm_operation_ctx ctx = {
> > @@ -2196,6 +2230,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> >  #endif
> >  	INIT_LIST_HEAD(&bo->vram_userfault_link);
> >  
> > +	/* Initialize purge advisory state */
> > +	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> > +
> >  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> >  
> >  	if (resv) {
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 6bee53d6ffc3..e3ace179e9cf 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -59,6 +59,18 @@ static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
> >  	if (!bo)
> >  		return 0;
> >  
> > +	/*
> > +	 * Check if BO is purged (under dma-resv lock).
> > +	 * For purged BOs:
> > +	 * - Scratch VMs: Skip validation, rebind will use scratch PTEs
> > +	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
> > +	 */
> > +	if (unlikely(xe_bo_is_purged(bo))) {
> > +		if (!xe_vm_has_scratch(vm))
> > +			return -EACCES;
> > +		return 0;
> > +	}
> > +
> >  	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
> >  		xe_bo_validate(bo, vm, true, exec);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 6703a7049227..c8c66300e25b 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> >  	/* Is this a leaf entry ?*/
> >  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
> >  		struct xe_res_cursor *curs = xe_walk->curs;
> > -		bool is_null = xe_vma_is_null(xe_walk->vma);
> > -		bool is_vram = is_null ? false : xe_res_is_vram(curs);
> > +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
> > +		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
> > +					 (bo && xe_bo_is_purged(bo));
> > +		bool is_vram = is_null_or_purged ? false : xe_res_is_vram(curs);
> >  
> >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> >  
> >  		if (xe_walk->clear_pt) {
> >  			pte = 0;
> >  		} else {
> > -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > +			/*
> > +			 * For purged BOs, treat like null VMAs - pass address 0.
> > +			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
> > +			 */
> > +			pte = vm->pt_ops->pte_encode_vma(is_null_or_purged ? 0 :
> >  							 xe_res_dma(curs) +
> >  							 xe_walk->dma_offset,
> >  							 xe_walk->vma,
> >  							 pat_index, level);
> > -			if (!is_null)
> > +			if (!is_null_or_purged)
> >  				pte |= is_vram ? xe_walk->default_vram_pte :
> >  					xe_walk->default_system_pte;
> >  
> > @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> >  		if (unlikely(ret))
> >  			return ret;
> >  
> > -		if (!is_null && !xe_walk->clear_pt)
> > +		if (!is_null_or_purged && !xe_walk->clear_pt)
> >  			xe_res_next(curs, next - addr);
> >  		xe_walk->va_curs_start = next;
> >  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> > @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> >  	};
> >  	struct xe_pt *pt = vm->pt_root[tile->id];
> >  	int ret;
> > +	bool is_purged = false;
> > +
> > +	/*
> > +	 * Check if BO is purged:
> > +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
> > +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
> > +	 *
> > +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
> > +	 * zero instead of creating a PRESENT mapping to physical address 0.
> > +	 */
> > +	if (bo && xe_bo_is_purged(bo)) {
> > +		is_purged = true;
> > +
> > +		/*
> > +		 * For non-scratch VMs, a NULL rebind should use zero PTEs
> > +		 * (non-present), not a present PTE to phys 0.
> > +		 */
> > +		if (!xe_vm_has_scratch(vm))
> > +			xe_walk.clear_pt = true;
> > +	}
> >  
> >  	if (range) {
> >  		/* Move this entire thing to xe_svm.c? */
> > @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> >  	if (!range)
> >  		xe_bo_assert_held(bo);
> >  
> > -	if (!xe_vma_is_null(vma) && !range) {
> > +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
> >  		if (xe_vma_is_userptr(vma))
> >  			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
> >  					 xe_vma_size(vma), &curs);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 694f592a0f01..c3a5fe76ff96 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1359,6 +1359,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> >  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> >  			       u16 pat_index, u32 pt_level)
> >  {
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +
> >  	pte |= XE_PAGE_PRESENT;
> >  
> >  	if (likely(!xe_vma_read_only(vma)))
> > @@ -1367,7 +1370,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> >  	pte |= pte_encode_pat_index(pat_index, pt_level);
> >  	pte |= pte_encode_ps(pt_level);
> >  
> > -	if (unlikely(xe_vma_is_null(vma)))
> > +	/*
> > +	 * NULL PTEs redirect to scratch page (return zeros on read).
> > +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
> > +	 * Never set NULL flag without scratch page - causes undefined behavior.
> > +	 */
> > +	if (unlikely(xe_vma_is_null(vma) ||
> > +		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
> >  		pte |= XE_PTE_NULL;
> >  
> >  	return pte;
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index add9a6ca2390..dfeab9e24a09 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -179,6 +179,56 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> >  	}
> >  }
> >  
> > +/*:
> > + * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
> > + * Returns true if any BO was purged, false otherwise.
> > + * Caller must copy retained value to userspace after releasing locks.
> > + */
> > +static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
> > +				       struct xe_vma **vmas, int num_vmas,
> > +				       struct drm_xe_madvise *op)
> 
> Shouldn't this check be a vfunc in madvise_funcs?
> 
> Also I think you can hook into xe_madvise_details for the return value /
> final copy to user.
> 
> > +{
> > +	bool has_purged_bo = false;
> > +	int i;
> > +
> > +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> > +
> > +	for (i = 0; i < num_vmas; i++) {
> > +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
> > +
> > +		if (!bo)
> > +			continue;
> > +
> > +		/* BO must be locked before modifying madv state */
> > +		xe_bo_assert_held(bo);
> > +
> > +		/*
> > +		 * Once purged, always purged. Cannot transition back to WILLNEED.
> > +		 * This matches i915 semantics where purged BOs are permanently invalid.
> > +		 */
> > +		if (xe_bo_is_purged(bo)) {
> > +			has_purged_bo = true;
> > +			continue;
> > +		}
> > +
> > +		switch (op->purge_state_val.val) {
> > +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> > +			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> > +			break;
> > +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> > +			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
> 
> Use above suggested helper to set this state?
> 
> > +			break;
> > +		default:
> > +			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
> > +				 op->purge_state_val.val);
> > +			return false;
> > +		}
> > +	}
> > +
> > +	/* Return whether any BO was purged; caller will copy to user after unlocking */
> > +	return has_purged_bo;
> > +}
> > +
> >  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> >  			     struct xe_vma **vmas, int num_vmas,
> >  			     struct drm_xe_madvise *op,
> > @@ -306,6 +356,16 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
> >  			return false;
> >  		break;
> >  	}
> > +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> > +	{
> > +		u32 val = args->purge_state_val.val;
> > +
> > +		if (XE_IOCTL_DBG(xe, !(val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
> > +				       val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
> > +			return false;
> > +
> > +		break;
> > +	}
> >  	default:
> >  		if (XE_IOCTL_DBG(xe, 1))
> >  			return false;
> > @@ -465,6 +525,34 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
> >  					goto err_fini;
> >  			}
> >  		}
> > +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
> > +			bool has_purged_bo;
> > +
> > +			has_purged_bo = xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
> > +								   madvise_range.num_vmas, args);
> > +
> 
> Again use the existing vfuncs here.
> 
> > +			/* Release BO locks */
> > +			drm_exec_fini(&exec);
> > +			kfree(madvise_range.vmas);
> > +			up_write(&vm->lock);
> > +
> > +			/*
> > +			 * Set retained flag to indicate if backing store still exists.
> > +			 * Matches i915: retained = 1 if not purged, 0 if purged.
> > +			 * Must copy_to_user AFTER releasing ALL locks to avoid circular dependency.
> > +			 */
> > +			if (args->purge_state_val.retained) {
> > +				u32 retained = !has_purged_bo;
> > +
> > +				if (copy_to_user(u64_to_user_ptr(args->purge_state_val.retained),
> > +						 &retained, sizeof(retained)))
> 
> I don't think remained needs to be a u64 - maybe a u16? Will comment on
> uAPI too.
> 

Ignore this, I forgot purge_state_val.retained is a userptr so u64 is
correct. Let me follow on if we are allowed to change IOCTLs from IOW ->
IOWR. I am really unclear on the rules that part of the uAPI.

> > +					drm_warn(&vm->xe->drm, "Failed to copy retained value to user\n");
> 
> See above, use xe_madvise_details_fini for the final copy to user.
> 
> Matt
> 
> > +			}
> > +
> > +			/* Final cleanup for early return */
> > +			xe_vm_put(vm);
> > +			return 0;
> > +		}
> >  	}
> >  
> >  	if (madvise_range.has_svm_userptr_vmas) {
> > -- 
> > 2.43.0
> > 
