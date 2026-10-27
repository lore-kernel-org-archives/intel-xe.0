Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB8606A321
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IQ/8+FzU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405810E31C;
	Tue, 27 Oct 2026 07:47:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C769210E31C
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793087271; x=1824623271;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Roe59qRkMs8OEeM6T7Qxp0iCeUxNrHiBpQ4LtVt4Jw=;
 b=IQ/8+FzUKn5ShOQQgvS99Xovrt3+tVBAS7Dg5SWfeWzbSebe/IQLc+q3
 soxmWXb3FqfZYSh8vfdTXPxH3Gahk3oo5hKKRz3PLSUJPhhgbhkz1IGOi
 B8YSfuouvckoVCtDSH6w57NYyPCh/yyGbVE5PVH7oEMA9cb9jPrXdJx2T
 UrcvPByJaCoGYGjcbTQb0RHBs9tKELiq6XtZR9CSbL1GHYESGlpj+GTLs
 plBvtGTuGyV2dApIy69X5C1erUXKq/JhKkPCeLvctPFxRKbaL5zy5/ZkI
 khuMibZmdH0MQGRWPLM6KO2b0PoGdgVE+RL5XNvWMRB0xIc/Vfy6hm7vw Q==;
X-CSE-ConnectionGUID: OHd9uoX6QyyS57g3b+yYxg==
X-CSE-MsgGUID: R7CqtYtlSI6F+E58jcudtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1682673"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1682673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 00:47:36 -0700
X-CSE-ConnectionGUID: xKCp1jXaTX+uS2kOg+UKyw==
X-CSE-MsgGUID: KFTfIADUQYeCilUg+9ekQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4352832"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 00:47:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:47:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 00:47:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:47:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIDipH3kWXHhsE9ekgtqGiis5Zr6Cs1IecEAna8I7n/8bosFGqEvGrX4lRtjqTlSfRT3+UsY7IN+UjNYuMB388BL5pQm99Ft1Sjtr2P/vDitze46eMWecSEbcUKY/4jt1AbziLz3NnsaK5RAidnvr0tChG/sB45h754aCwdOSCXFjxVpCmiy2cu92SAJDMIFzBNs59Vdy+ebWlx/Wt/O7l3nvDhjTjBv5xjZ5M/EUZuHcyfVsmjftbjrEfrwRVyPzuW4Xs57Ia4eSsZPqK1qU53//4tHbXYVM1TXOcy7LkRMPv0OPAcl4u/hEnI5d9sXOSG35eAhTK1Ms9orG6Yb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skpTiOsz0YBdmEBsZ2LxOLUdYmMLiWnd7dQq6sefRec=;
 b=W/TdRPe53miULURhAEUuS4kj80aIPBk0fA5euhtOTMKgDpve9RGZM/0myjU6SmbHHr/sSqfGGgeE+E9HIpR1pWg+PCCFYhxaHBujxfE1X2ccgfeJ7Im/cLU1/rjd2LuAKoNX1hfMQINgPWSRtA6l9Wq0LGYckRPs0umxHh6Hvp5OsCd8WDKJP3FdGHIjEDF3YdW+OHaKlTJgB58wcov9HwZSGxpPFeb1+NySskEEQF68mlSlpxhpHByD/SPTq/kdk9Ssko42nk1khDvoQvSgz/WtRIYE7nvJGMteTn9fP0NbgXGokcOqB+rsYxAbmwBRqPcZYowYJjETnpCrHHdG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:47:27 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:47:26 +0000
Message-ID: <eba20077-a02f-43df-ab93-fcd54c231719@intel.com>
Date: Tue, 27 Oct 2026 13:17:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe/cper: Add CPER support for software errors
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
 <20261021162508.265700-11-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261021162508.265700-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::17) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe1449b-cd89-41f7-518b-08df33fe8b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|261026121527099003|4143699003|11063799006|56012099006|261021135927099003|261022113327099003|261022115727099003|261021133027099003|261009223027099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261021130227099003|10067099003|22082099003|261026135527099003|18002099003|6133799003|3023799007|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: V12BbDzIiRWqRrcRJGBr/udMExMRWffVe8I0BzMBbSpvRf+MVP47YEXkcFI5mjLVRRD6J6XbYOkkXlr76fWvQgrcsrhPXyxbO7bTeizyz4GQNbURAcGtfUY2R0w1twaJj5f2FqjYA3Cdvws9uDsqFQiyB4Gi6ODo1G1OXkMPe3N5tuSHkFineafV8sRRVlVapc3GBoyEqzMf0Qyoq0mFbY/9gKk2+j4k78zzHSSmaCJnLKDSIdTwDC/Jl5bECfOYC7z4HtnfFRA2xhtCaEeVTUjgLBIp8LwbzCdUWOQRvIu8vT0uGWtklQAE3xC3xm9he99f4vTLH0fRTxCCmyTZx17082YM1Sf3VhvJNpr8xaV+PCKWXH5bqI/Q096C7Fn9V709eTCKX+VQc4Cvi3iA7z0Rcf+yPtnd0vB4RU+nUKu1pON0e5im3+6hWWeu6GOB5pIFAgHKG8hA6PvNQ78YC+BAms4OE9FEWM9c1Lms0ufiElEE9zKHs01lIFob9MZbvdSoDDSCtgqIArJIkjnX+OJNfvhrBVPjjOFcHAF3nuwH7GUw8usWBm0uoUlWcupP6F6LZSV8yC4czKO2DnYjHKWUDY9tQIe0Jt/5/RUpCJu+jW4zvRRohdhqB2u1S1haqyZhZylrtnn5ePV5OtmqaPM84Dyzmj3eMukMgZlG+d4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(261026121527099003)(4143699003)(11063799006)(56012099006)(261021135927099003)(261022113327099003)(261022115727099003)(261021133027099003)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261021130227099003)(10067099003)(22082099003)(261026135527099003)(18002099003)(6133799003)(3023799007)(261026140227099003)(261026130827099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVZFSDNxNzlZbXBSWUovaVhQeWRITTZ4ZktLTjVMR2N6dmRuQWp3dWxCa1RQ?=
 =?utf-8?B?aG54bHRhZUZDWERTN1ZLTS9GNC9FQmovL29YSVdZcFBJamRFcWluM2svRGcx?=
 =?utf-8?B?T1JPL2RhUXJZYnVSbEgxYzZMYkJzaEhkNGRBVmo5SmJkdTFGUGpNVGVvNGFl?=
 =?utf-8?B?TzdoVXdpeHJTS2s3TGJPQm1tN0FMaVBWZU04VkJqMWtDZ25Dem9GUC83THFp?=
 =?utf-8?B?c3c1bXU5K3A3VGdMSW1rL2FUeU5IemhXdXhQSkN3QUpVNzNnanFvSXFyZ240?=
 =?utf-8?B?NWw4cmtlMWJMUXAvSkNYbWhZNVJPdUFwOVhFdTV1UHFqb3loZUloNTNIV0R0?=
 =?utf-8?B?MlNweUR0YUhOb21ibVQ2WVJHeHkxeTBsL0ZrZW1EanF0UnMwRFVBTGZWNzBr?=
 =?utf-8?B?SUVCTHlxZCtQZFJVQmtxYzBOQk9oT1dQVFhsbWxMUUtaZGtEWDJHMGRJYmhZ?=
 =?utf-8?B?cld2dlJjT1gyaDV6M1JRUk5CSy8zUjJMRy9MVWI3RncyMDJVVjdPaC9VRk9z?=
 =?utf-8?B?dXloMEQwNkNKdHlMaEEzd1k5Y1lqaGFoK0VEbDBkRTR1ejdJdGJuVUk0cjhm?=
 =?utf-8?B?YUNVcitqbTlqS2tFQW9KS0l6S3BWQ0FyRllxQW9KUm9LM0tscEZNZDJJTzBD?=
 =?utf-8?B?am5RTk9ndmR0TE12R1N0aDdSQVNCZ1gzb1pvY0trTFMzYlVzWlJ0RVM3ZnRC?=
 =?utf-8?B?dG85aWJ1d1hSd3FRdERPYTBKdTY1Ni9FbllPaklQczFsZm92R1FmQVBRVmFt?=
 =?utf-8?B?ZFpmdzFvYytkTlpZWmgxUE5nSEhuVDYyRjBsZVFNblpTMitKQTVMWklrb202?=
 =?utf-8?B?VmxRRjB6Ti9VWWtCY0FJV0lQcDZNZm80NUlZSUU5WXczMTNFcERnekpXcFdO?=
 =?utf-8?B?S2N3TmJrLzhyajdRcFI2U1pUV0svcGNBdjh6Y1FXQnR0bzFyeGN4ZkJZaVJM?=
 =?utf-8?B?S3hrMlJoekVVMC9lMWdtWDJhKzI2QTNOOURxNnBKNTJrb1MvYVhLNnkvMzR3?=
 =?utf-8?B?LzRVaFlsWnJrMWRaaklCUVQzdktEaVB5MG9DenN2UVJuUnFTMHAzWThvcEdl?=
 =?utf-8?B?THpFcVNaTyt5dEVlcXRBQkMySHlxNE5CWWF6TTJMYTlwQTVYZzFGS3UvZFVi?=
 =?utf-8?B?ejlkNDBqeS9lT09vSS9PS2JmZVQxTU9vWmt1RUc2RWxyUHI5R1NiV29GTTRk?=
 =?utf-8?B?ZWhmVlNtVk4vYlFYOXN5Rms4WW5BL3RrYlZsaW5uVDMvWWI4Ym1MZmdLbnNr?=
 =?utf-8?B?N1YvUThYTjRUbFNCQldaY2ZGMm8wWnh0NXBqUmluaEdJY2tyOHhaQXo4a0I3?=
 =?utf-8?B?SzhEZzkxQ3krSFhPNlVydDl6cUlIemlZZUh4WmNWb0tkb0ZSaFZIZ3BoVlo3?=
 =?utf-8?B?YzF0cEU5YW9FNm9MWWdzK3lWM29WV2VQUTVQSmdvUzEwSFh2Um53eWFtUEhJ?=
 =?utf-8?B?MmRMNGZqdDA4MkxsWVhTQ3R2OE5uZkI3UkxWdEFSdEoxUDNPN0hGS0huQnVa?=
 =?utf-8?B?YlVnSCttQWRCcnp2NGpWUEd2Lzd4bTJnYmljdjd6V0tLV3dNYXpka2srcjZZ?=
 =?utf-8?B?Vi9zU2JadWY0cDdTczdrMU9lTzRaTTQzL0pzdXY4L2s5Z1hCN1Q4UXhMamZT?=
 =?utf-8?B?eDc4N3ZlVzA2Vkl2bWdLM1pLRkhMOXpjZmN4Q1hSaVg3bWRSc1dvZFp6TDRl?=
 =?utf-8?B?K1dpelRBMU9kc3BXSzhDajJqVW9kZTRVYkk0UzVmeVhGMXgzSWdaT2pKOExO?=
 =?utf-8?B?MjRETWhHdHh1K1FtbVVTakQ0anJqVmE2bitCekN6OUZVVjN6Zy9JNVZUcGlG?=
 =?utf-8?B?Z3dNWWx2a2szYzduQkZ1WE5mRGc2c1YybXN5ZDNrdkFBc29paHJNNWVrUXFC?=
 =?utf-8?B?NDNScC9Ldm5YdVNNengwQ2RTQ005c0xNS3VFMFF3Z3NKcHVHMS9XSUdsd1h2?=
 =?utf-8?B?ZGVIWVJOZGNWOG9Ic0NVcEVtc2xJUHJFQmx0SWVxR0loZlpBZFozZi80blNx?=
 =?utf-8?B?NG04QlU5b0FwaFZERDd0NFFabmJLWmN5NnJ3VUs3RlFvbGlJeW1ReE9Ta2V4?=
 =?utf-8?B?cld1YzNFS3VpMjJQTW4zK2IvWnNrc2dHZjYwOStMUmZwU0lPbjlUV1RPUHZ3?=
 =?utf-8?B?KzhhS0ZzQXlsWnh5YjBBYlgzWktqdGpBU3N3MDkzUUpxYlhxa2ZJdm14Ym1x?=
 =?utf-8?B?QWpmb2VqdWh0S2pEeEovK1RHc0F4Qy96RUtUR25qdkdxSC95N0cwRW1PUmFN?=
 =?utf-8?B?UUtYWVRDY0JhVU9uZXhLSUI2Y3NoNCtGbHV0azh3cktkdDgwem1FT2Q0SzRk?=
 =?utf-8?B?NWU1STcvbFlnMjJudnY0eWdsRGgyZ3FhSkJkQVI4ek1vR2IyTHUxdz09?=
X-Exchange-RoutingPolicyChecked: WibB5TuT+lkr/bwzO/MgHxNzFaQcceeTEa+jypQG9IZycOr7a6xWBsggfW+j0DDync1Wk1BDDsiyKEDus/XF3r4/4FyX27fCPn3OXrmm2oOE0Brs2RHDx/5865p8pMkdv7Y53ENchNy1MermjHvdApnjpDL+8D3QZ1PY6UQwoRFjJoGO0Pyl7IjS+5fnK2tldyakUUlqdt1V8ttNXvvhnQx2XW5N8XN012DbOk22vFU9Q9PUP+sKkwFcenYlFRIrlEnH04xKB7PQc8KhmqbEBuXjjWSzZDIznIT9xFOL2/kf3cziR+/nzTa9e7Tjd+GzEKlG0jotRHhw/Jir91VWfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe1449b-cd89-41f7-518b-08df33fe8b68
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:47:26.8241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjcEVY2ojFRu/Fh3IrUJVDvkPUggTD7W2kcA9lXFiPXgV04L/yOeCu+vH4DnhaOwO6nzpyGpmAJgTSHYOIAbnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 21-10-2026 21:55, Mallesh Koujalagi wrote:
> Add CPER record generation for software SIGIDs through
> xe_cper_emit_sw_err().
>
> Store driver-specific information, such as severity,
> component, location, and error cause, in the CPER error
> class. Also attach the formatted log message to the CPER
> record so that useful debugging information is preserved.
>
> This allows driver-detected errors to be reported through
> CPER, similar to hardware error reporting.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_cper.c | 90 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 89 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 1dab6ea93fea..cb4be6f3de7f 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -14,6 +14,8 @@
>   #include <linux/time.h>
>   #include <linux/timekeeping.h>
>   
> +#include "abi/xe_log_abi.h"
> +
>   #include "xe_cper.h"
>   #include "xe_cper_types.h"
>   #include "xe_device.h"
> @@ -27,6 +29,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>   	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
>   }
>   
> +static bool is_sw_sigid(enum xe_sigid sigid)
> +{
> +	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
> +}
> +
>   static const struct xe_platform_id_entry xe_platform_ids[] = {
>   	/* 0x674C  platform/8086:674c */
>   	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
> @@ -453,6 +460,84 @@ static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigi
>   	xe_cper_emit_counter(xe, cper_sev, sigid, error_class, &resp);
>   }
>   
> +#define XE_CPER_SW_MSG_MAX	256
> +
> +static size_t sw_format_msg(struct va_format *vaf, char *buf, size_t size)
> +{
> +	int len = snprintf(buf, size, "%pV", vaf);
> +
> +	return min_t(size_t, len + 1, size);
> +}
> +
> +static void fill_cper_driver_error_class(struct xe_cper_driver_error_class *dst, int cper_sev,
> +					 u32 component, u32 location, const void *data)
> +{
> +	dst->error_type = cper_sev;
> +	dst->error_component = component;
> +	dst->tile = location;
> +
> +	if (IS_ERR(data))
> +		dst->cause = -PTR_ERR(data);
> +}
> +
> +static struct xe_cper_sec_intel_error_info *
> +build_sw_einfo(const union xe_cper_error_class_u *uec, struct va_format *vaf,
> +	       u64 timestamp, u32 *einfo_size)
> +{
> +	struct xe_cper_sec_intel_error_info *einfo;
> +	struct xe_intel_priv_event_entry *entry;
> +	char msg[XE_CPER_SW_MSG_MAX];
> +	size_t msg_len;
> +	u32 queue_len;
> +
> +	msg_len = sw_format_msg(vaf, msg, sizeof(msg));
> +
> +	queue_len = offsetof(struct xe_intel_priv_event_entry, metadata) + msg_len;
> +
> +	einfo = kzalloc_flex(*einfo, event_queue, queue_len);
> +	if (!einfo)
> +		return NULL;
> +
> +	einfo->error_count        = 1;
> +	einfo->event_queue_length = queue_len;
> +	einfo->event_queue_count  = 1;
> +	einfo->error_class = uec->ras;
> +
> +	entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
> +	entry->entry_length = msg_len;
> +	entry->timestamp    = timestamp;
> +	memcpy(entry->metadata, msg, msg_len);
> +
> +	*einfo_size = struct_size(einfo, event_queue, queue_len);
> +	return einfo;
> +}
> +
> +static void xe_cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +				u32 component, u32 location, const void *data,
> +				struct va_format *vaf)
> +{
> +	struct xe_cper_sec_intel_error_info *einfo;
> +	struct xe_cper_sec_intel_err_hdr ihdr = {};
> +	u64 timestamp = ktime_get_boottime_ns();
> +	union xe_cper_error_class_u uec = {};

With change suggested in patch 2 this will become

struct xe_cper_driver_error_class driver = { };

> +	u32 einfo_size = 0;
> +
> +	might_sleep();
> +
> +	fill_cper_driver_error_class(&uec.driver, cper_sev, component, location, data);
how about init_driver_counter(driver, ...);
> +
> +	einfo = build_sw_einfo(&uec, vaf, timestamp, &einfo_size);

  einfo = build_sw_einfo(&driver, vaf, timestamp, &einfo_size); and 
inside function

einfo->driver = *driver

> +	if (!einfo)
> +		return;
> +
> +	ihdr.error_class = uec.ras;

ihdr.driver =  driver

Thanks,
Badal

> +	xe_cper_init_intel_err_hdr(xe, timestamp, sigid, 1, &ihdr);
> +	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr,
> +			    einfo, einfo_size);
> +
> +	kfree(einfo);
> +}
> +
>   /**
>    * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>    * @xe: The &xe_device
> @@ -479,7 +564,10 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>   		return;
>   	}
>   
> -	/* TODO software CPER */
> +	if (is_sw_sigid(sigid)) {
> +		xe_cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
> +		return;
> +	}
>   }
>   
>   static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
