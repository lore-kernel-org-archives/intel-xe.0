Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51000D7879F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 18:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DD810F071;
	Fri, 19 Dec 2025 18:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWaLOjdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE5C10F071
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766170508; x=1797706508;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hwEJZK4iMpIhQxmMqZx8QOv7XDX9i50iF/kWg9oXLv4=;
 b=IWaLOjdQM1ChWcXslfsTUmljRT/lprEhbdCak9ulWMLHeXHwk8IYv38D
 k/ltl5yGWjboGVPY6Qp1bfa7YCbEqG5ZZlAXXwiDIOZ2/YEsGgHJcQu8K
 i+AcbNUSuAk7ikThxvEuPHD+MR6VZygtWxXPgrqw0OTiXm4IvJhBL3iWY
 evGdALRvX2AaljuqCpbOqVOO+FDJnefiKdX/OZN/XONOK9w73JHSP/aed
 3vCL95bknCISfFdxgSz0EDE2IXMZmw97Vy8cJ7prx0Y/0ojNcdHuP4p+H
 SMtFaNED6zEHG6pXCwliyG8mRusUp7OBYF/PMfcAr3CkLNanGDvl5k1H4 Q==;
X-CSE-ConnectionGUID: ASpjHGd+TT67k8iJbj2xfw==
X-CSE-MsgGUID: hI+DbuSsQAGhW/GCtFKnjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68067706"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="68067706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:55:08 -0800
X-CSE-ConnectionGUID: yp2TolUnRzauFQaewMD1OA==
X-CSE-MsgGUID: 8AH6/FjMRWKTf6R/JPRnFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198514707"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:55:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 10:55:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 10:55:06 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 10:55:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEU9XZ65B7psvX/7IG+C01kPrE3sT08qe9NBPBass5wS/VeEeOtKCd9E4ZRquBiHzM6dXkWz6lTFjkeVqCSZrNVPh+ozxphsHSVQbDIA47fq/5Me0cg1BkZ5y1HLID+jeSaxQmxryIRsKEwhdKu6NqKDsW7LsGghOEJhpE4KdNC5Si9B8Iy1k2hDMGpj9FcSh9U+MIa2cfCX+WsuNYZoVpluegqPU6AY4rNmPd/LNiJ96VkYCUgryqY0kISftCaGRnznfxW8Ajm18opz4JDiVELD6m86+eKAC6QIUh9t2jLCYHKNdvn4dMNCO2qLtWm1Co0TnGcnh9MfcKttvfr6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fHHCZm1HLnCQptiEvnPuJJzaGnWqJbqTIKqICQZN8s=;
 b=emT9Wx5GX1JHDPotC0jIV1r/H30FaHMNsQvjing1pR6Vh5Qhv4mEIyiQh9M/p2E1mCO9T4AYENs3YB/lMClrIcgHfSy3gLnUqPLkkj7OkwWPiFMCR17us4IdLT0wHxCpfpJCSAMbl8CwAZZH7mPFh5riGoumPIG+E1cAHMrW9FHa3HBG/n90jm4fbzqz7eaBzsQTQFM6WOwMzOraU6CuZSKgNCQu4nC7a7alDRShWfwHaAOi+YMJGaX9HOytwtYwGgnnqCib9jD+yiP78lArw/6Q182XT3x3D3pcGIulLbrlSy0RrAyaFR+2/FE62sD+GfM6IIMCfFUULXlqm52TeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 18:55:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 18:55:03 +0000
Date: Fri, 19 Dec 2025 13:54:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC v1] drm/xe/migrate: Configure migration queue as low latency
Message-ID: <aUWfg8eIL_yh572u@intel.com>
References: <20251219104903.291774-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219104903.291774-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: a77ca57d-2480-41b1-1a49-08de3f301e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFo3ajlONjdRaW9uT3VxUHhSWjA1aW5vYnJQN1JqQ3g1bC9QbGJjWG9TTUJs?=
 =?utf-8?B?MGhPWnJVeVJiRlpKeWFiR05sVHppK3VEaEorQmIwUzdYTzU3TjZMSFh5emZt?=
 =?utf-8?B?WXRkYUpkczAwNnNGUExQeHNkSUtHbHpMVmFyOVdjby9HdFA3bERsb2o4ZHhB?=
 =?utf-8?B?WUhYaDFpVStRbFVYVWRHNEdQaDc0VHRFYVVCWkR0bWMyRE9MRHFUY043bUtI?=
 =?utf-8?B?eVJ1ZUYrejIvcDFGVmsvM1IrdUVDQXBmbXBHUGpMZFRxc1U0RWI0K0R6UHlp?=
 =?utf-8?B?UW5Sa1FRWWhWNlVGTys3cHRhckFLaVY5Q1Q3T3hoZWRjYmhwVEpqWFJRNnJo?=
 =?utf-8?B?MkNENVFRRGl4cEpMTzZVMWg0cSt0ZGZ3UlhEbzVWWkgrNlVHZEE3b2FLaitR?=
 =?utf-8?B?bnYzcnMycFIwekh0RVl2QTUxdDFNQTdETDBUMzNWNG1ac1pzQ3N1cDdmYzMz?=
 =?utf-8?B?RW90cHA0Mm1xTW91YW0rTG4xSVRJSitMdHRIQlltNkJQdXVWaHBhakJ5b1NB?=
 =?utf-8?B?Y25LWlhsdlZkeWp4TFZBOVJXRXVsMFF2emNMMTgrWldxYkVGejNqZHhTV1Ru?=
 =?utf-8?B?c2N3ejYrblYrVGhNM250UkZnTVhocHVNSlFDeFBkNHFQN01GVDI0alZ2Rkdu?=
 =?utf-8?B?MlJqYnhzN1JkSVc0TnNmSDg4T0EzcldYeSs1bGhKYUJKeFVpVEhYM1RPWmtU?=
 =?utf-8?B?R2tXdVJXcEc4MUMvYk44Q095eHlPWWhSUDBtOVE1QWFaVFVGSzB6YW1BV0Fv?=
 =?utf-8?B?MFh3QU1ZNmMrVnpNTS9ab0Y1dGs1SUYxZUkwRUdVMDZTVllPOGFuK28rdk9h?=
 =?utf-8?B?OTJ5Q0d0SEhaTFg2WjllaUJNRVRYbUttL240Mktsajl3S1FpWTFaKzNLUmZa?=
 =?utf-8?B?U3hIdE5SL3NVNDhXenl3SXMrMlRhVGlRMzRpVUpsb1ZnUmV3cmV1YXoxZzlz?=
 =?utf-8?B?RkRESm9kU1U0ZHcrbDZMVXQ4aEsxT09TaFl4amcwMjJXb2I2MVlTdGpHZE1V?=
 =?utf-8?B?L1JncWUrWE8zOTk3RitVVTIxMWozY0l2bE1xMzhsWXFENlhWN1F3d3NxaHdr?=
 =?utf-8?B?eSt4VThPR04wR1FndWtrKytvczZaOTJ4TUhRV1RZaUZWc1ppSUt0R0lUY2xV?=
 =?utf-8?B?SDFQT1VSc1R3azBYNWdCcDdwTjBLc3JueFcyZEx0V25oUlFvdmY2bVUzaGFZ?=
 =?utf-8?B?MXBaWGgzdlBITGpLRGMwVmEvaHVuOVhoSlcyQnNVbjNnYU1tTldpR2l0OW9t?=
 =?utf-8?B?L0Eza1pyblJTcVUzMnR0TmlxOGc5ZEZXa282ZVJWbURlVG1GREtHVit6ZEpl?=
 =?utf-8?B?dThCSVZraysyeW1kaVNaZ3JaR2c5SVdjcDNUUU9Kb09VSjJhSnNaOXk1dzV2?=
 =?utf-8?B?c05pYWg2Lzdkc3hHMm1DRFBLMFo3ZkdxbjVMemNzbW9tbWxmd2ZhRkhjRHF5?=
 =?utf-8?B?d1VqOVpZQnUyZWg0M0QwZThaby9NOFBJKzZSVW95VUJLZnNOMVlCY1JOMDEx?=
 =?utf-8?B?RThBdTJXNTBpN2ozWVYvUXdjWUtPOCtZRXNIcjU3RlBaRHBTYUNkM0hNTkdR?=
 =?utf-8?B?M2UvV1dKYUVHcXU1SVNxaGc0SmNvZTBEUzJnN2l0R1JRVVZHWHI0UVJwUVVQ?=
 =?utf-8?B?elJyaVkyeW5xNEx5S1ZCYnVpaDZtL2t1ZWJXK3RRMjJ0S1VGS0lYQmdaaEh1?=
 =?utf-8?B?WVQ1UW9EMk1NNUJBS1Z2MGpSUm0vSVV0NHo3bm1EZVREaTRZVDNNbnB4SzFt?=
 =?utf-8?B?bWNWSFFnYng5TjNyb0NmTFlzQ3J1cFk3cnZUcGR4UEtLQ2lJcVdZNFh6L0NZ?=
 =?utf-8?B?eTMzNVd2dGdWTlVSTCtsWStNM3FxSXdtcmdiY0RsdmdSSXJ2R211NmRtRElP?=
 =?utf-8?B?d0xaaU5MTTJTZ3BFNnA1RWhOcllCSWNWRnJ4MlJTdjZoWk5mMUVGcGtZdkNn?=
 =?utf-8?Q?I84P143T9124q2U5dBU5wDqVVALWeZ+e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGExZExJM2NVYXBRQVhQQkgvMWZBZE5WZCsrbXN1WjEycEpJalJkaTZMNGVW?=
 =?utf-8?B?OTBsRm14elRNV1M2eDNGeWNoaWwxZVFobm9LeXBtMmgvS3hSRkRmSFVSK1ZY?=
 =?utf-8?B?ZEVVZWFCelNndUlVOUs0Z21qWWdSZ1ZQMzMvZWVWZGZORVZjNXV5RmRQeTVT?=
 =?utf-8?B?OHp1UlZ5cXpIWDVGcm1OTkphOWl4bWR0YWFIcmNKTVIwWVk2YUN1d3BsdVhq?=
 =?utf-8?B?MG4wbkJLR3MzeUg5bUlJZUZEbklPc2ptYVZHcndqS0ZZa29pWWNFMXIyQ1lP?=
 =?utf-8?B?MllqbnhaTG5HUDZ0MEZGMlNyb0Y1bjhCMFh2ODhOejFzYmlxY1ZUWldYKzBh?=
 =?utf-8?B?Zy9zRnlkdll6cmMwWVIxb2pjSkJxeVNZakJFZkVBcnBWV3RZVGJYVS9UWWU5?=
 =?utf-8?B?Ui9KbGVwUmVwQXlYVEs0TmVBMmhDT1JkUlMwTm10M2NxSU1lanZ4QmM1ajhH?=
 =?utf-8?B?a2VqOEtXWk0vTmJwSE9yYU5XZ29rai9vOUkwVm5LVkx2eW1Fc2RGc1hmeHRN?=
 =?utf-8?B?WnovK2hxTnVrT1JCdE95dlV4TFY0MWN4bGpFMi9yMzUwSlB3a1JqZS95Y3hk?=
 =?utf-8?B?NmRCSXJVbCtPbXVLM2dnTnlkTmxQTGd0YlVsb1lxVlk2WThBWFNMbmkxZW5K?=
 =?utf-8?B?a2hPYlFRZzFJeS9JQVNaQktDcUJZb1FjUVhwaW1ZZUkyQWFFTjRLRi9aNitB?=
 =?utf-8?B?aS8yM25IQjQxT3FtcVhMUWZ6S0NMZGRVSU1WemU4Q0VaU1hZZkhEYXhwUGk0?=
 =?utf-8?B?eUJuUkV1alBabVZubjdPdDNoZTkwTGxLVmtmSW1ZbmhGazRwSVB1clJYWEo5?=
 =?utf-8?B?TUxjWVZBK2xiRTBoSmRUQ3ZyblZweCtvN2FNeTV5REpEVEg0SmZhSC8zc1Vr?=
 =?utf-8?B?WXlveisvaHhxOFhyRkp3Y2RQZ24zTzNyVEJTNEJ1eVl5NlJ4R2xnZUhxbkZn?=
 =?utf-8?B?Vy9PZGFFMEZxdUNvRE5KTU9ON1hvZFVvTGRMcy85UUhUbXY4QUdKMkUxY0do?=
 =?utf-8?B?dzVKbmZjODhGdlBGNFp2T3ZZQmNVZ2h4bFUyOXo3bHRIMFp4ekpBTzlmeTN6?=
 =?utf-8?B?ZVlMQmxpWElPdS9oRlgxTzJBNzU2V09KUHdPU050azltMjIvczJ3Z0FDcFRl?=
 =?utf-8?B?dHRSdEloU016a1lGeUZZUjl6aEZJNUFSL25kbVdRYkt5K0FCTWtIRnBlZTZU?=
 =?utf-8?B?SGhMak9VOURxQXZzTmd1VDhuVnB4VEdoOGtZa2cyaVRUMEV3MWd5TkVOS2ZI?=
 =?utf-8?B?RW9PVXZ3VDR4ODNTNENZa1lpMDdJSHhvemxMS3VGRVFIRUJYVDVibSt1MjRR?=
 =?utf-8?B?VkR5VUxPQTl1MHcxR2F1OWxiWmN4dGlCM1dLQWRPVjYzenFtaElNL3JrYnFi?=
 =?utf-8?B?L1pWcjBySHM2RndKQ3BvenZaWjUyTURRRmcrZGFEYnp1Z21OOERJQVA1Z3B1?=
 =?utf-8?B?VEFzc0xoWFVpZm95K3VEYm5wdjVZQ04yMDhNRWsyVUl1WHZZTDJpdm50Ty81?=
 =?utf-8?B?UjF4U2M1MWIvQTN3TGwzQitUdndFazMvTGFmNnE0UlpCQmt1VmhUSHdSV2V5?=
 =?utf-8?B?cHJmMkdmL1FtZFZzL0p0elE5Y2hTNko2VnRjdVpPMXFZWVJ4RUVTK2FPVlBF?=
 =?utf-8?B?bU03MS90M1RaYUR2cWg5QW84WjJFL2lTcHk4NlpDVk80Nld2bjBTZ3B6ayt0?=
 =?utf-8?B?Qkw0QmczSzZ4bURTTmRFOFFZSWFMVkxNTHh4T2x6VW1oMnRsVnk1YlpiUE9z?=
 =?utf-8?B?Y2x6aVowR3RRUnRCT3NWWEpDZm5WOTJaR1JwYmFxQk1NTW9sUXNLaWtCczR6?=
 =?utf-8?B?U2ZiaWNXaUhvbE4rUXhQeG0vVEV6ZkR3cmhvNCsyMVAxOUx6czZvK3VNc0xu?=
 =?utf-8?B?VFlEU3U4a2ZycXpSMEhLQ01oeDlpcW95ZENzVXk2cHJHRExZRWtxbGgvZHJJ?=
 =?utf-8?B?WXd2MjRJTjlaQ0MveWhDL0NjeWNnd0dUSHpmNTdGSmFjT2M0YitRMldRdWhx?=
 =?utf-8?B?QkFuUXNmN3IrNm5OTGZ5YWZDSEg5RUpTbUxOQlVZOU0zOEZ1UnFZR2dFemR3?=
 =?utf-8?B?SHg2d3FKK2EyL0lHeEJsbm82aDBvaEpveDVrNHZVVDZLSjhnNmpOVzdZRml0?=
 =?utf-8?B?UzUrYitISWp0R29QV1FDV01QdGltVjVjNHhpK2h4MWI4RVpNamN3UTlXbVFk?=
 =?utf-8?B?d0l0ZEM3ZVNHMzI0ZGdHNFh1cEltOTBOZWo2dWxRUjhCTnd5QytjWWdHRWp0?=
 =?utf-8?B?czNmQVQ1WmxtTzg3WE50ZDVRclJ6aFF6aGk3M0w5cXVqblFNNVQvV0ZNNmVx?=
 =?utf-8?B?UWV5eCtGbFRjeUdaeHZWOW4rV0dreER5OGtDSFlBTXBGbDZLcXN0Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a77ca57d-2480-41b1-1a49-08de3f301e6e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 18:55:03.6662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xq4aySM4vf1tsrqj3Khx/h/h3grrsL1bGDqBNuqDRxezIchVhrThw6ApqBTqA66yLJCMyfaqjxHdKvEhDu09xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
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

On Fri, Dec 19, 2025 at 11:49:03AM +0100, Francois Dugast wrote:
> Commit 5488bec96bcc ("drm/xe/uapi: Use hint for guc to set GT frequency")
> introduced low latency hint for use by user space when creating an exec
> queue. This instructs SLPC to ramp the GT frequency aggressively.
> 
> SVM relies on an internal exec queue to migrate memory upon page faults.
> This change creates this exec queue with the low latency hint to speed up
> migration.
> 
> This should not impact systems where GT frequency is set over sysfs, or
> with long running workloads which give enough time for the frequency to
> ramp up. An example of memory access pattern that shows an improvement of
> SVM performance is running hundreds of times IGT eu-fault-2m-once-device
> in xe_exec_system_allocator. The copy duration provided by GT stats in
> svm_2M_device_copy_us shows per GPU page fault:
>     ~ 165 μs without low latency hint
>     ~ 130 μs with low latency hint

\o/

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f3b66b55acfb..878b13f27be4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -471,7 +471,8 @@ int xe_migrate_init(struct xe_migrate *m)
>  					    EXEC_QUEUE_FLAG_KERNEL |
>  					    EXEC_QUEUE_FLAG_PERMANENT |
>  					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
> -					    EXEC_QUEUE_FLAG_MIGRATE, 0);
> +					    EXEC_QUEUE_FLAG_MIGRATE |
> +					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
>  	} else {
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>  						  XE_ENGINE_CLASS_COPY,
> -- 
> 2.43.0
> 
