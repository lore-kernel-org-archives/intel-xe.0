Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DE6C624D6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EA710F22C;
	Wed,  2 Sep 2026 14:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uoa2oPJE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A29610E4B5
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788359642; x=1819895642;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TVoZDpWmj1ZBlVmxtPWEGqhA4m59o0CtPFGOB2ik5j0=;
 b=Uoa2oPJEiVazu5VWmNILmtwwzWGClWERlbpLak5068xPKQs5fR+fEtYe
 J5D0i0ldMz6cvdNNgcF/zBewqAogxCcnHSEGBV/qleF8Dxxr+W33j4CbS
 hVtKM2dKrjTVAEbQ6Z9o2g94eJ9awA4Q2GS55HruQL7QIlAkZBaiXotAN
 H9HSJ0CDmv3rJyqrkdW1OCqWSbixlK2aZZihPypp5qx7XvW+Xq/sL2KPk
 egX2YoVg0HqdMpypvodg6W4blJUVGpWby/HpdkADnPedJL1883kyzMoLb
 +9+pLhrKwKVCC2uIf2ngbDUbnh+/Mc2KMdMO25eomGFDcjU+jHU83KNKF Q==;
X-CSE-ConnectionGUID: BSvDnbg1SH+Z+eMafZiuQw==
X-CSE-MsgGUID: 2Rq+AyO+Rqir97/mVOZz5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88843485"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88843485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:34:01 -0700
X-CSE-ConnectionGUID: v6JLxitFQb65FBD0ztv86Q==
X-CSE-MsgGUID: Wfb2tskJQ9uo6BhwvHA6rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="294281688"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:34:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 07:34:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 07:34:00 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 07:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brbkxYgrBjv9BMVGBDvIMYn3aauX+Z14FCKPtrcAXgG9Hy1gCa4Ca3/i03AbqrdUAT7/3J+3oHNsMk2+VTFWAmxHiT3Q5z8InoZf41zsv22FiKTN4XUENFnigBmTip7KU3AwFdLpEHcj6AyJ2T20S2Vuy0DWycqmzkPQ86Lxkp9gTmbX/x2N0e5iCow/CzHsCWtY5EI6z4lsJDVSEYqRnZjBXcfxbuPDGamX1j9NdSyt0x+xlhYxvNmNPqoQC/Op2/1Y+gJhlurVJUO3uteI5xJbqLQg7xdQznjEt5UqbMBOwmYtbGTXQ6TGrftC/PR3UogbXGbeFdoGZaWORxyXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpAlQ1Fs2SIqZRWUNTuIhqNiq2Mvm2LdsC6gZFRbZNA=;
 b=R2301j17MPJE/5VAWEcQ8RPY3ZHagBEx9bKtV7TCk6X+NqeZkVbObrhPZfy8uomn2zenacvxX8jbcAKMG5uZohp6U4cJvk26ARLNXdRMFldMLecBIR4lT44WLNtCEN1DwP3NePU/PSLVj13E3bUF6ubXqMHweYb5Nk4ZohubegnhBkKPz2ujqK63atR5LspBH19hCB4R3wU+2Juo28hNi1zj28E8D6OZwQXRPcdSWQbBaaP33TOnxxldCqRi5znbQV1tZSXns4lAGJIF2qX477DGGR2kRwnpR/cJ7NuFJ/rKyA+T5GyI5CjKD2z7U2uU3BB681YDSqGIrMwUJcS3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by LV2PR11MB379463.namprd11.prod.outlook.com (2603:10b6:408:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:33:58 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:33:58 +0000
Message-ID: <00e3acce-3f21-4aad-a5d8-749e26bf7b2d@intel.com>
Date: Wed, 2 Sep 2026 16:33:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/xe/guc: Report major GuC failures using SIGID
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
 <20260901211204.131972-11-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901211204.131972-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0199.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::20) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|LV2PR11MB379463:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b5dcdc-2e08-493d-7126-08df08ff393e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 9lmVk0AMt/itFL4Svm2ye9WVfdBvx2lBkJdpag50h0YKKpps/aJGnxJplCuhpSmxJYy6t0i6lyCmiI5tKgaL0Xc/fkBU3GQuAMAUSMG+dLDgC3vqI+7gHsOzQYCpLPinkzuW+KNflO1FnVPDmdNgFcK160yGwz6buGesY5FmkGzTK8c2tOteVH9Ab8BXBu22KXHzunJlzC/4W0FnhSs6IjjtQmUhe4LLy3nNcocd5ORoKxIsBZlPeX0s1w6QWGBKRIUtxCk9cORO+vhO9f8isDEmbSmwi9P4fFW1Uy9kdMxhJwd7gTM+uFZLi2yd+SAR33yTO7mIQ2cuNeWHFQCyatHCjLa+0l8h75YTltEQg8fncBd4BBThXSq60RQfPMCc8SxgYry2Z5jjnGQ7NuonnVOJuNK4TKpyumiDM26e4CNvlHdNygydxzd+9hDDUh71ilGdX3Wq2iMQwIZkpTtxUXzvHTNQJk/luuyOJBQSWBigj0ArzpV1mRhS56jwT8ojk+rVKsqrV45yLeqh/QjUA3YMoPypeSPDBAXumQvmmVi/hRiNS9ej4OfyJnEDXa+9zStkEf9C5rHICWx+AtvN9tOaEPzy6rn0iazsvqvEBd9v/1HXSwAce1VVqkk2dR6FZGr86nMy7+sbXQ+DkX97MB4QnB5F/CncxuPZVoiPIQA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjFhbXZ1SzRuaWhHNTNBRFJXZ0Y1ejZHZEJsTFQwNnBXMS8zK3RwRmNKdE4z?=
 =?utf-8?B?TWNFVlBtcGZwVUJUMVYvR3lSVHBubUJaVkdqZ0NRdW5TamFEMlRmWjNHdE5s?=
 =?utf-8?B?MTR4VE8rbThEbDVJQ3VTTUJtbE9CU2ZYSGUwZ25xQitXb3VBYm5zdXptZzlS?=
 =?utf-8?B?dG5mZllPKytaN1ZLL1J1eGxCNjUzSGZMaGNaRUI4U2xtUkFkUzNWcmhOUk9L?=
 =?utf-8?B?QXE2NTE2cXFLNWdNWXRzc1JzVG4zWjdOQThhZy9ZdzlJUERpN0ljQ3lyWk4v?=
 =?utf-8?B?NVVzbUFTMFI0V3FGRkFGRmxoNHlxNzJBT2RSVnozbnlMeUEzNDBHT01qaXcw?=
 =?utf-8?B?K0cramJSZmp0YnBYYktJSUNVMitjSDJvOFowOGloWVd4RlI5TzZ6Qml4MVRV?=
 =?utf-8?B?YkorNlVJTnlWeEhVZzFxTFpqWUZ4SUpNYjhIUUV0ZXVwRDJmTnByOE1ydVJ6?=
 =?utf-8?B?TVpjRXY2dFJ0djZTT1lUN3ZSL0FaQUtGVnpPanpIK3BnUnRXOHI3Qnc3Q2pG?=
 =?utf-8?B?bHpwemdpdkNxMUtYczRnbzZUeC9XU0JOWjk4QVBtaGt5Z0ZBdFlxZnNtazIx?=
 =?utf-8?B?K0tQSm83VkRGZzVqMVJuViszS0wvQ0xMZEdsRXF4VWhHekJCNVBsZEVrdTMz?=
 =?utf-8?B?cXBsVVhPZ283WDgrYTJxR215bmh3TFNBZ2RObWE4ZHYrSWFvT2R5KytDVGU2?=
 =?utf-8?B?V3B4VWxuU2wyUTY3SWI1M25TU3pSRm5qbUdnZXY0NnNkekJ1N0ZsaTRZYkVD?=
 =?utf-8?B?U0llUkZ4SG5pNHR2TytEN3AyMndGTkZPd2ZPR3NtcDE5UDFxUzE1TU8zZTl2?=
 =?utf-8?B?UVZhWkEzZS9qZUhobVI3TEQ3TVl2MHVTeEJKUloxVTNnOWtweHo2QlZ2MkVL?=
 =?utf-8?B?N0tiZGlnOElraW5WeUt3MlFpSVloTjVlVCtsaEpNZmVZM1NkTFVsR1FMczlR?=
 =?utf-8?B?Y2NJNHI2aE91bmdneWZaTGtKaE5TUUEybm9QOEo0M2xYN1EvckdyR1laNCt4?=
 =?utf-8?B?a28yaWFlazZjWm5lQUp6WGJDZkpzVGlQL3ZobTlsTWR1SkJXQXFuVjZnejFP?=
 =?utf-8?B?aFU2T2h5QzFGSU1QbkwxdVNSS3RKMlBPMTM1WkFHN1ljZGtjR3R5cDRBdWNw?=
 =?utf-8?B?aVNxamJuWk9Id0ZrYUhYZEZxeURMaUF0emlJNGxyREUvRUMwR3dLMnMxajlk?=
 =?utf-8?B?bEtobTAyQStaRW1lZTh5L1RPancyeTV5b0pTUWo1S2I5TWl4S2pMNjU5NjBv?=
 =?utf-8?B?b2NnRi9yY1V0Ynl1UWYxVXZRZndGeExMNURLODRlVGJIQ3RuTU96eW54d3Fy?=
 =?utf-8?B?ejA3R1J1LzdvTWcvV3ZRcmtUVS9mYlNoWjFvejFOWTRoRitKTTU3Nlk2SWpn?=
 =?utf-8?B?TnZGMXhtTUduZWNzU2dNSzV4elY4SEk1cDkzRFQxUWVhcW0zbEI2bXdUZXZw?=
 =?utf-8?B?S2VpRjZ5SktSOHN3bUNnRDd5dWlwblVyS2VqWnhGZkx2TzE5M1BKb1JLU2l2?=
 =?utf-8?B?TUpZaVVpN1VsY1VjQ0doTjZqRDBhcmluNnptUXMyZERqQzRSa1RrYjF0cm91?=
 =?utf-8?B?RUJRQlg0ZVdBUEo0eTVjS2FxVVlNbzB4OFBvM0J5KzFDY3g4Skd5MWM5SDZL?=
 =?utf-8?B?bXNiTXR4bGk2MzFxMkxVblFKRU9Fc3grT0FDUG51ZE9iajcvM216bFVVd2x3?=
 =?utf-8?B?b3lwak9xUm1kdGVtTUpVbzhSVWhRZ1BNQk1iYnRQMW5Wak8xNTFldmhFL21C?=
 =?utf-8?B?UlpkR29mSzdXQ1ZLSk11QUtwclIrb1AzV2MzOTM1NFJaUDFsdWpOc2Q4c2Ro?=
 =?utf-8?B?by9TNGJqaDg0SmhwTEh1Y3BIY0I5azVLWmRLYU81WjFPdDVoUm8yNnRIUmdu?=
 =?utf-8?B?Rk42M0loQ0dHWFMrVFV5dGpBOGplQXVGRW1QVkhTaFk4RGxzY1ZrT0NGS2RF?=
 =?utf-8?B?ZmR4WTBGdlNLMDBrT0dUcENkb1NTTWRRdVh2YzU3dzU5UEp6R3cxeEhKOVVB?=
 =?utf-8?B?eUVSZVFwZWdFZEdWMEFHMmRwR2RhbzYvU1IrY2gyaVRHT0UwMXM3TkVXSnNp?=
 =?utf-8?B?RHBYcW5VRXVkM3d4VnR1NlVIeDU0K1EybzBodjFHcWNoUkxqOGloQUE5V2R6?=
 =?utf-8?B?Q1Z2dWx0c09zZHo1MGtubTBDLzIzMGRteHE0RXc1anB4cUUvTlFZa0hMYXp0?=
 =?utf-8?B?YUY3SG1Wb1poL3I2UnJuU0JtWFlKZkdxNzhNdEVxRjExNVZHak1MUnNIbmMz?=
 =?utf-8?B?cmZHeHR3RWNkK0VydXNlZnk2UGljSjNnSGJNNU1tRG5GNEMzSWw4cU5mN3Vi?=
 =?utf-8?B?TXVQS25VWFJtUGhISVFBS3BpS2pObkNrQlFpRGVJRTBqeW5CclZjaDdxRGRB?=
 =?utf-8?Q?hR71Q6QgwENT1eMc=3D?=
X-Exchange-RoutingPolicyChecked: NpmBYMTB0JcEm6gJtdWRyM12j3gG1OQfH/1nKVWWwOwIL9beJzCkm6CS4WYRR0srLLutRXC1XWbx94jG31jlvNV7yP5ohBTtk1c9iy9rs4fHvcG5ss1fboXnHMpZ6WP5Ae70Voq3eC+an7Raui6HEeLQJbx/U2I7/yCcOY95Cg3khsSvop9Zt1O1i73L2/HMlpT90UGR8xY8C45KSPCG0qI2lwPyQiuMKFzD6XbLQtk053xa6s3YqT9f5Kwli6yFx0hw/JraiSmpXvq6MBOvWGv+RiqHIMshPjKL3+AimzYxWoTTzM7TpETxDcO4Dda44c1Ub4AedcGmhbAuEwKKtw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b5dcdc-2e08-493d-7126-08df08ff393e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:33:58.2900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5UV5ke3ztDJwq3yjrokW73iykaptiGmQ17mIlBx6VB+5KbrwP0tZIOcAEo2/sh/FHT0gql2j7K6vZ3gB+HpgknclgkG4mmcrEZFClwSgvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB379463
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



On 9/1/2026 11:12 PM, Umesh Nerlige Ramappa wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Convert errors during critical GuC flows (init, load, reset, suspend)
> to use the xe_log_err() helper.
> While at it, simplify the error log for the GuC load failure to use the
> cached frequency values instead of fetching them again.
> 
> v2: split guc_load_done changes to their own patch, use available ret
> value for reset errors (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 5285d4cecbc8..d0ddaaf35274 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -777,7 +777,7 @@ int xe_guc_init_noalloc(struct xe_guc *guc)
>  	return 0;
>  
>  out:
> -	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
> +	xe_log_err(gt, GUC, ret, "GuC init failed\n");

note that there will be already "GUC: " prefix in the message,
so maybe just:

	"Initialization error\n"

>  	return ret;
>  }
>  
> @@ -845,7 +845,7 @@ int xe_guc_init(struct xe_guc *guc)
>  	return 0;
>  
>  out:
> -	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
> +	xe_log_err(gt, GUC, ret, "GuC init failed\n");

ditto

>  	return ret;
>  }
>  
> @@ -998,15 +998,16 @@ int xe_guc_reset(struct xe_guc *guc)
>  
>  	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>  	if (ret) {
> -		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
> +		xe_log_err(gt, GUC, ret, "GuC reset timed out, GDRST=%#x\n", gdrst);

note that there will be already "GUC: " prefix in the message,
so maybe just:

	"Reset timeout, GDRST=%#x\n"

>  		goto err_out;
>  	}
>  
>  	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
>  	if (!(guc_status & GS_MIA_IN_RESET)) {
> -		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
> -			  guc_status);
>  		ret = -EIO;
> +		xe_log_err(gt, GUC, ret,
> +			   "GuC status: %#x, MIA core expected to be in reset\n",
> +			   guc_status);

note that there will be already "GUC: " prefix in the message,
so maybe just:

	"MIA core not in reset, GUC_STATUS=%#x\n"

>  		goto err_out;
>  	}
>  
> @@ -1224,9 +1225,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>  
>  	if (ret || load_result) {
> -		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
> -			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> -			  xe_guc_pc_get_cur_freq_fw(guc_pc));
> +		xe_log_err(gt, GUC, ret ?: load_result,
> +			   "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",

as "status" is a register dump, maybe use the same naming as before:

	"Load failed, GUC_STATUS=%#x

> +			   status, delta_ms, act_freq, cur_freq);
>  		print_load_status_err(gt, status);

do we want to use xe_log_info() here ^^^ to get a better view?
then maybe above xe_log() could be split and keep only GUC_STATUS
and move rest (freq) to other logs?

>  
>  		return ret ?: load_result;
> @@ -1463,7 +1464,7 @@ int xe_guc_suspend(struct xe_guc *guc)
>  
>  	ret = xe_guc_softreset(guc);
>  	if (ret) {
> -		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
> +		xe_log_err(gt, GUC, ret, "GuC suspend failed\n");

note that there will be already "GUC: " prefix in the message,
so maybe just:

	"Suspend aborted\n"

>  		return ret;
>  	}
>  

