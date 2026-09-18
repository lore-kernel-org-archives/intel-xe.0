Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A682CC982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6078E10E080;
	Fri, 18 Sep 2026 03:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNmEve4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9803310E080;
 Fri, 18 Sep 2026 03:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789703706; x=1821239706;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Om5KDeF9aD3RCQ48zEyVmag0/5U29CTOi+xDPVrBIqY=;
 b=WNmEve4k/sbnNXHxyIPgdy8ONu209E6x+5TtjSb2UQzk0x+oSrw9J55o
 CU7CSdtDmpjrfkEnqTn6TRKszsgUQ/TVKQXSHoHk+yu9JSi/6pJguG1YL
 lYUvUXrnFSZW0sX+R9DuxLUMTBIRUPFnQpeiUDrqL9Uz4UOeGinhoy+wB
 ndNLTD7+F5Jd3rX2O9wG+vee/07+lmZlxgXxznNrbWYf4em3yEMrWGPpI
 77XvFCcEpxx+zwKAJ4K2lPT9TqsU08/VK1gt21xjKcJ6OW3Mn6J262Voi
 BnZyRiHcfhpHPiIJBxBW2QchBHLok1/eGOGOqZTOQppzMSRl5TxGIgxRa g==;
X-CSE-ConnectionGUID: xMY5lAJVQKK93bnNHq3dpw==
X-CSE-MsgGUID: 0/qSFwWZS8yS7cP3ms36vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="94015368"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="94015368"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:55:01 -0700
X-CSE-ConnectionGUID: p79/b9DXQcm2aD6nH1H8iw==
X-CSE-MsgGUID: xHwMzdOpRS6dw27VGOVjZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2398594"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:55:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:55:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:55:00 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:54:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMtTRpKPVMpCAuKW2UeHfrBCXwHpR7FkkibdJFsChNkJ0FWMfytdgKe9dx91bDkF1pwPoZdi53gYtj7PQk+s8DqYp1rLXXwmwtUnoQ2AmjR6FoTZ4IZjkWJmJ3u0L32tb7prGUbe0RQfAaSvPKRPdNRsjEnls92lOZpQO+9n2UIRxEZO2eQi+IGwdqUy8X1t/iQ1mEIWvFUlcp6bNPDG8tQvqnCajNdG1hi2E281Ca1OcsTyCGruTgLhfBX1zLhIPGG2J8hLXsAjGxJeAIobPn2Ixb+GMq1wSKHnEemoHrdaDjk2mWMHJOLBv79/G818tflWq6ZVCfwWs4w9Rg2afA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUpNMA/z7KSrJDG38dCH2goyePAeJFaxXjQuLOcm0y4=;
 b=jt4amQUl0AnK9iBNui+wbA81WTP0Y5WUvx8nRcDdF4nEaSa55Gk+F7wEB9tNV/80VOyW9lsH+uCL0lSTcSZ8U3e/B3XQWu1zqdaoQRzy8rJ2rjuc8jU+qjNC9USeJwf1Nsa3KeluUpFMnoJtTxk5LMPYQLGrM1sLxfCrJCSg91Jit5HZ7yjSJCP21/qFXwxn70yBwd85jTSvqx20D0dZT6g/hdM+1qTDNBzhiD99XXEpVQqayavFGG3tT4M9C1Y9Iq60Rz/ccvgP0+MnWWnQIEp2GHaS04RPZb2OG9giY+nZXv2AJmirssDIZraN3tZjta3x1Ss+yLeB4hQce2qG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by SA2PR11MB4841.namprd11.prod.outlook.com
 (2603:10b6:806:113::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 03:54:52 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:54:52 +0000
Message-ID: <2acee09f-a947-4018-99d8-8e5c97c6e4bf@intel.com>
Date: Fri, 18 Sep 2026 09:24:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/14] Add support for Common SDP Transmission Line
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <arun.r.murthy@intel.com>,
 <jani.nikula@linux.intel.com>, <suraj.kandpal@intel.com>
References: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260915164657.3429075-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0029.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::13) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|SA2PR11MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdf974b-4c3d-4602-977f-08df15389808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9Oqvg0a3/k4He9k/UqQPCgkppG5Lxgs9q2zR6OiPdSBKTRVyhuFlCJhu6BNuCOn1sK+t2Be7wh7S5NUYEkiTbieXeMNC3czXnAnsA1Iu5xGymg+2LU4Vs+verGIR/WbalqUoSPJRR3zXg28I2JNgZTMxaqwdZbRwxuNWJY8g0BwQVPAohutHIBEe5qVoGUueaLfoopDy7acnJVob7A7SzzTkyrNoPbiEvs/RelKUnUpfoH5A3YnuIMjmRqyiZCSbhJwE4p4mIgK3duZvLkePoU2bhsy/lnR6L1Q0zgGmFZsWcUE1jIll3n+Hk9qbXPn0CcHBeDzn+sALPpl6RX6txF8zA0KX+0tk5sjRJKAot75mgMdT4HPCymWiRd3+1pPCEMfN+BqgpqRjPvzROaQf4agdJkiwAD+t65NxO6eF1S/vsl/TmO1BxkkCSGwFdRljWVHxF/vmKZoK9sAgpvLm4vdosUDAnz+P3RjaTQwK8DSa/tshLrOxemmAV0UK0583oQGCp/gBiYbYNSsrMNrRznCj5Ymyk2LuYYcZtyTNGp1Qc3y1GTIVC0V9IlQjZkJyD6+ID5fQSkuD5axB86lHT4m9sXkiTyD++1XMsfKKh2FikDr/Hmz3pQXPwIfmJQ90UerhIef4cGgcXnbQMwKtlwBiGNvoUvwQp3VpBkqE4HM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHRnN3M1Y1lySGg0K3RDL09PMENlWnMvRTFNbEUvRUpKK2ZQSkNxRCtvaml1?=
 =?utf-8?B?SWNLTTErVXBSaE1wUEFXSk5HYm5PY0N3aFVLdjlMSWtKTllsV0hWYU9Ua2Zw?=
 =?utf-8?B?K3puYzFGTmR6VlhmdnEvTExpUkVvVytMeS9ndnVOc3hDd0VJWHY1MTU2dVdy?=
 =?utf-8?B?SzJyR2o5V0RZUGptMUFiUXVZekI2Y3RJL3hoamo3VE4xK1gxZ2ZaMGptZ29B?=
 =?utf-8?B?OSt2dW40R0JBam5MdW9mbWthSlJNdWIvL0ZZTFY4WmJsUVVZQmovbVAyckhY?=
 =?utf-8?B?MFVRMHFVR2hGY2c2MnRyZytnN3gzWDU0VWZaRVY5ZDkvenNJVDFDbXhUSXdQ?=
 =?utf-8?B?aGNmMERYTGREL2lJQ29YR1VlQXJjbnUyQ2EwTVJXRnpoRzdWaHFlSGxhTWIv?=
 =?utf-8?B?d2hnbG13SlB3R1ZueFlSZHdUM0wzQ1BKcjlHTVdsT2dSZGc2YzIveWJNaUNL?=
 =?utf-8?B?R0plbkZRK1Z5aVVyUVNsU3VrVlZmdngrbXpQV0dFTzRnWFBybEkrbVBOZDdX?=
 =?utf-8?B?eFViK3l2a3JUendmTFBjKzNpOFl5NU9pQUVpakViZ0lSTjVLODVYcjhRTEZR?=
 =?utf-8?B?TWowNkpBRElKOUxEeVVHdlRZVEVMbzloWExjaVF3T0l1TUxwUGdvK0xMTUlm?=
 =?utf-8?B?dmdVcDNDcFpVMVRtVElTeHNVSmFlSGd2K3MyWDFPZHN2WjE4MkYzRW9hNEpL?=
 =?utf-8?B?bjBWVHl4eEdNSk5YK2VaeGVpY2FSdlJ6Sy9hL0R6QmgvSmRJTFZnTG9DeWJB?=
 =?utf-8?B?b3JsdjZlME55NW5udE82OC90Mk4raC9aU1lzTU1DM05QTzZxSUlmVTBJRTBy?=
 =?utf-8?B?U1N5YzZ6NGRMZkU4aEtlWWVnSzVEUWhpczlIZFpzOVpoUVp4UWFmZzR2YWF3?=
 =?utf-8?B?QWJMT3JFWnRUdEdLell2OXlSSDV1WHZCNUxoekFSdUFHVFZmZkUyOVptV0tL?=
 =?utf-8?B?N1VmbEpVZVdubjNqQXB6OFJpK2Y1RWNTa1BaUFlWZUxvNFoxSTRlM0laNnJY?=
 =?utf-8?B?c3dRTEVUSE9FcjIxU2o1bGR2T1JjaEs1Mzk4OWJEeFIxN2tzL0ZRVzFlV0li?=
 =?utf-8?B?SmR1WEtibStKRU5Od3d0cCthNjNJMldqeExRMUZEK2lRSWxzallaVUkrakJ2?=
 =?utf-8?B?dWNuOTJKeSt0UCtiWlJXUkRuUHN3Tm5lZzNwZmxhWTQ1U1R3Ry9kOFJzUmtT?=
 =?utf-8?B?MFRRQVI4ODRBU2EraW1JU21TbzVXTWtGeEJaZDJlbXRwWDNIWjhHZWxOYzZ2?=
 =?utf-8?B?QkFRNk1ZdXB0Q2owUE95cTRuT21uRVdtQVBXZFp6SXNaRkZTYzErZnJzMlls?=
 =?utf-8?B?a0Yrdzg4a21IQnBuL2l0NE1hQXlvc2prdHdEdHMvSEUvL2d1U0tQa21ZWTh4?=
 =?utf-8?B?OXRtNzBjTGJUdyt5ak5hUW9ZQ2w4aVVIYW1BSlprSmRlQ0lsMW5DU084K3pV?=
 =?utf-8?B?QkRnWWg3QTBtZmkxbTQ0QloyUEcySlBOMjdkN1E2a2VOTzNlWTh5RG0vR055?=
 =?utf-8?B?ejJQTGhNZUJSbmhzSVFHN1l3RHBEa0doa2lHekZnK2V0R1V0TjNnMUZNVFls?=
 =?utf-8?B?WnJZNStqRjZsaXZ1ekx4RG9kMlVnQ1pyU2VocndndHV2NGpaN1BhbEs1K2c0?=
 =?utf-8?B?MWYxV1Rsb0NGdTJNS0dhM2hYU3Q4TVpYMlErMi94dmxheE5OZGVOM3NMQVU5?=
 =?utf-8?B?V2t2ajUwYVJvNkZKUjBWZk9PRVp1ZXMxSUV4Uy8zVDBoY1dxNGx0NnFkbDdE?=
 =?utf-8?B?MFlQQ2FxUldxTDFuNzJtbDc2YkE5NE9hRFA1QnRubkJ6VGdTUkFxSENvMEJB?=
 =?utf-8?B?aHpQT0hCTzFWWGF3d3hPRDFwYUNJNVBuQ1ZsbG0wRlZsQ0ZYWllmNFZGdDVi?=
 =?utf-8?B?YTVibHVWTXhrT0NrL1ZiM1E1SXREQjV6REFDSjduZEJOQmFTbDdDdFpMUGQx?=
 =?utf-8?B?cGdreW41Vm5NU0o5YjByQ3BvYzkyOTlxN0pRS1EzeTl5WEhjazcvTXpvZ2s3?=
 =?utf-8?B?dEYxZUhUN3hXdFRHRENXZmtsZnlhZmdtZk11d2RFQUZsQ285NFdNd3pmVjU3?=
 =?utf-8?B?RlMwbE9ObDdIUndrUzk4ZFBxNGYySDYwRWxWOUlHVFB4WVN0M2xkS1RxUWdQ?=
 =?utf-8?B?MDFjUWVPUHJvLzBHNHAzZkltRW9aTjJibXIzQzVSTmxZWDlFQ3ViL0t5YkpV?=
 =?utf-8?B?Zmg3bXpuRmhyNDFOOEZPbE81WlBHQiszTzkxZ0IvRHJqbURKaWVmd2NyZ05z?=
 =?utf-8?B?dkJEZWo0NXFROEtqWDJ4OThGOFk3RUZNdU5ucXd3TjBMTG5qd2xuOGJBMFpU?=
 =?utf-8?B?NDNLVlhLUW5DWkxKZ2NROGJwZDdVOHV5bHBXUUZVd1BBMVk2YTBUTDhKTWND?=
 =?utf-8?Q?50auwmHeApOGBYkc=3D?=
X-Exchange-RoutingPolicyChecked: 04iwbTX0QtRH6jodC8/ApfpJ7YEymHes4hi4Qeu2geUZjq5t7mN2zYeguBKTbkmV6nYSnxW+vbJxagZ9tGbZxoH9XAG0X7rzPSNw2jwJ49Kq7mrPlM7D+PXsgwZhf/P1UHS0R+GozBczPkwafyjUVpr5ThbCBuUGuRXbs88HnBzfGTrmrYdX6R8isJ8k/t7eRFEF0wSauaDgtQXboCnrs3/Ov9nZ/w7KecIerByvBk9sZkb8gcWLr/E0pw2+epD6fTs+J9pWlzqKi9fJp8GZh9Fefz7Qp8nYs1uaBLVSPU1NotV0fiyZ45siNHTPQ6TIdxr0Y7erkRu98TmkaFJ2RA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdf974b-4c3d-4602-977f-08df15389808
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 03:54:52.5709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRHmKu9bEDnBK2/EsQGXggXzPIimyxoxDJWaP+ZW7f1sYdyrwerxjQjgdh2vZArik26l26N0e30RKDn/hxlzBBZww5fcwYzZWqkwi4zn17k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
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


On 9/15/2026 10:16 PM, Ankit Nautiyal wrote:
> Xe3p_lpd introduces new register bits to program a common SDP
> Transmission line that will be used by the Hardware to position the
> SDPs. Along with this, another new register is also added to stagger
> the different SDPs.
>
> This series adds support for programming the Common SDP Transmission Line
> (CMN_SDP_TL) and its stagger control registers.
>
> Rev2:
>   - Add tracking for AS SDP Transmission line first. Instead of directly
>     programming it in the register, compute the state during
>     compute_config_late() and write the value from crtc_state.
>     Readout from the register through a vrr helper, since the register is
>     defined in context of VRR and will be used for both DP and HDMI VRR
>     packets.
>   - Add support to track other SDP transmission lines, instead of stagger
>     values.
>   - Compute the transmission lines in compute_config_late path and add
>     readout.
>   - Always write the Common SDP Transmission line and other stagger
>     values, whether the packets are sent or not.
>   - Dump SDP transmission lines in crtc_state.
>
> Rev3:
>   - Introduce new files for handling the Data Island Packets (DIPs)
>     programming in one place. (Ville)
>   - Extract the Transmission Line programming for
>     HDMI Extended Metadata Packet (EMP) and Adaptive Sync SDP (AS SDP)
>     i.e. EMP_AS_SDP_TL in the new file.
>   - Add programming for Common Base SDP Transmission lines and other
>     stagger offsets in the new file.
>   - Add a #TODO to extract other helpers that deal with Data Island Packets
>     and VIDEO_DIP registers.
>   - Place the HAS_* Macros related to DIP in the intel_dip.h file
>     instead of intel_display_devices.h (Jani)
>   - Make function names more descriptive and avoid overuse of multiple
>     acronyms. (Jani)
>
> Note:
>   - Though I have fixed the naming as suggested in most places, I
>     have retained HAS_EMP_AS_SDP_TL for the following reasons:
>     1) Lack of an apt name that avoids the acronym for
>        'Extended Metadata Packet Adaptive Sync Secondary Packet Transmission
>        Line'.
>     2) Keeping this name makes it easier to find and map with the exact name
>        for such a complex register name.
>
>     However, I am open to suggestions for a better name.
>
> Rev4:
>   - Drop the patch to check for DP encoder before writing EMP_AS_SDP_TL
>     register. Instead reset the register to 0 for non DP encoder case.
>
> Rev5:
>   - Rebase
>   - Address review comments from Suraj:
>   - Drop some redundant checks, and fix few commit messages.
>
> Rev6:
>   - Move the new struct in intel_display_types.h from intel_dip.h (Jani)
>   - Check for CMN_SDP_TL restriction and Warn if not followed. (Suraj)
>   - Use HAS_CMN_SDP_TL() instead of checking if cmn_sdp_tl is set or not.
>     (Sashiko)
>   - Make sure that the guardband is sufficient as per CMN_SDP_TL while
>     optiminzing the guardband.
>
> Rev7:
>   - Account for VSC SDP's own minimum guardband requirement in
>     intel_dp_sdp_min_guardband(), for completeness. (Sashiko)
>   - Wrap two long line macro definitions in intel_dip_regs.h.
>
> Ankit Nautiyal (13):
>    drm/i915/dip: Add new file to handle Data Island Packet hardware
>    drm/i915/vrr: Use the helper to write EMP_AS_SDP_TL register
>    drm/i915/intel_dip: Add check for DP encoder
>    drm/i915/dip: Add helper to get AS SDP Transmission Line
>    drm/i915/display: Add crtc state for DIP transmission lines
>    drm/i915/dip: Store and use AS SDP transmission line from crtc state
>    drm/i915/dip: Add HAS_COMMON_SDP_TL macro
>    drm/i915/dip: Store SDP transmission lines in crtc_state
>    drm/i915/dp: Introduce helpers to enable/disable CMN SDP Transmission
>      line
>    drm/i915/dip: Enable Common SDP Transmission line
>    drm/i915/dp: Account VSC SDP in min guardband
>    drm/i915/dp: Adjust SDP guardband requirement for CMN_SDP_TL
>    drm/i915/display: Dump DIP Transmission lines
>
> Arun R Murthy (1):
>    drm/i915/dip_regs: Add register definitions for common SDP
>      Transmission Line

Thanks for the review comments, and suggestions. Pushed to drm-intel-next.

intel_dip.c was introduced here but only covers the transmission-line 
handling. Two follow-ups remain:

- Extract the remaining low-level DIP buffer/infoframe code out of 
intel_hdmi.c into intel_dip.c.
- Introduce a DIP type enum so HDMI packet types and DP SDP types aren't 
mixed in the same namespace in hsw_infoframe_enable()

I'll try to get to that next.


Thanks & Regards,

Ankit

>
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../drm/i915/display/intel_crtc_state_dump.c  |   9 +
>   drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +
>   drivers/gpu/drm/i915/display/intel_dip.c      | 215 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_dip.h      |  53 +++++
>   drivers/gpu/drm/i915/display/intel_dip_regs.h |  38 ++++
>   drivers/gpu/drm/i915/display/intel_display.c  |   6 +
>   .../drm/i915/display/intel_display_types.h    |  16 ++
>   drivers/gpu/drm/i915/display/intel_dp.c       |  62 ++++-
>   drivers/gpu/drm/i915/display/intel_vrr.c      |  14 +-
>   drivers/gpu/drm/i915/display/intel_vrr_regs.h |   6 -
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   12 files changed, 407 insertions(+), 19 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_dip.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_dip.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_dip_regs.h
>
