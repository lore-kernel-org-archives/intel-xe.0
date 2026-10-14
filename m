Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9DACC6B2A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 22:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3597810EB4A;
	Wed, 14 Oct 2026 22:36:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC3A10EB4A
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 22:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792017394; x=1823553394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fDtamkKivcKBecDiLGlasvFF5n4YCPJvzPdZTNW2rUw=;
 b=DydSAiR7cGA8VZQ1Z7JAGWFy57wu22K+e4cV5TW6/ejieSlkCAa0NdyI
 PTyuBT2O0hqcKDQvWctYJ9WqFpdOaPcHgS8xCDtsYN6bLrsfBtjMpK5Dw
 OosjNfA98Qgad+/7gCbPJ5Vv0S2kVCFNuooj3kdeyusQKmksgAu93a2M1
 80Zpt+we57VDumX/fOg7C2s65VfQYIfepVn2ounpAbfsEXIvulNvJeAyE
 5Phm1+bVqwM4Fhjd8PxY/FNr6jPVnK4r5Jq5BcCAhTDLGc+yFfKRvjVNo
 xhGr3l6WtPuOFljqLLwLUuJuxY0e0TJcoBv6b1lfyzFbZdpOq/jivqVTM A==;
X-CSE-ConnectionGUID: R223xyRySWG7iZ5ByfhHZA==
X-CSE-MsgGUID: EP5zNz+QSHigizeO8GySOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="659158"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="659158"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 15:36:33 -0700
X-CSE-ConnectionGUID: s8uGPEB8SFmISxtZGhX9tw==
X-CSE-MsgGUID: bmQVHI7BQqml6Z+BvSdOSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1453376"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 15:36:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 15:36:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 15:36:33 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 15:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDIqIerJXt/rleEmhFXE/nQRu2FmJgXSh1VwcXgRzgmpCAuA09igyzgfjKT6L8cUvlwWH5mW0hS5xVB9IA50OlygNMj3kljAYzTPOUG+N4Qs9rnHQX51ooWFAWsIJbfGuhIMBnwbYoIheUw1CuSNg3YHE1tG37v+3XMIRHlV6aAl8hgQt4y5VkkTTArMafWKb+HsWN1PMKtzzEelR5W7n69UAkXqPA9vf5Vlb4hmKkf1y6oxBg3RSyslwfqHHawCs7CxayG+RaFln8TV2GXylc//GyZgrZKPBbhXOEwfGi6+B1HMgCPqwYbhJ0JTKl+rx4VAdJBv1Wd7YetWJtENQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qOD8h1x6bGbTm1pPYjCF8pMIJ3DkU/1PXYSdecxE7Y=;
 b=HMwkJEg+Zqsjq8kbI8OaJQVQPPOa/sTFWvsqybHJZPYTFz5y2MO/hOG5+0xs+z2C+V3OhCCHSi+BpWdNE7LbF+mo+x14E4Q3eMMOvORsIEADsPmRv13nGR1Sa955x1S6Me8emGmlrAvKIlBWCmmwSLEAknWyzsJuQf2QdWoc1KlfgE8njEOcE218w6Om/JOm2PrYUTfsYoC8hwQXjo9sp7NNkEy0aPzSyMlbxOgxpe947fdKSSdrXXotbvs4dQbt/dyAkvWNuZrgioZa1JttVcZSFdRiN3cIODSTyh5h/nTCjW09nZSiTk4an52i93kx603S33rqg1b2qgOeHzQ0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DS4PPFE99BD3AEE.namprd11.prod.outlook.com (2603:10b6:f:fc02::5d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 22:36:30 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 22:36:30 +0000
Message-ID: <c7831b00-ef44-4975-b33a-d8b2636de0bd@intel.com>
Date: Wed, 14 Oct 2026 15:36:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] drm/xe/guc: Cleanup error codes and handling for
 CT errors
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20261012232907.83649-9-umesh.nerlige.ramappa@intel.com>
 <20261012232907.83649-13-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261012232907.83649-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:a03:331::28) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DS4PPFE99BD3AEE:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e9bafd-003a-4b6e-4e8d-08df2a4397a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|18002099003|22082099003|10067099003|3023799007|5023799004|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8cSL2KtlXtHaMhDBiityToeo090c71sq1KdqXQCaabpRBB/N6dK5RU56EOUATp10yBCUuRckh9OaLwDdSgiNzh4n7NE6qHkNyUvjksqqqKXIMRDI+GItNI08WLsZEJPUi9vRtI8/zkaeYoE5MovQ2tsh3ch6Mt5OxbtaRgkUaaHZTa4xxsrLeqhHsiico7060RLPvB/cw35ivkAbzYcnQls37EaeyHC2P8CQfvKP4K6h+cY310PVu+kFq7GmbLVocO/DH0UyhSGCP74MGYvi6OiC1jJwyU7iVtf3SVPwnpXypQyunzaJV3/ln/F8nEZRkRuCSVyp+CXf9HMjVmARdPG2mJ+Y2G4eNt3EvwM36oIvqGTCoetYOvrs/1ZIIQ3B+P0rpvt4e+cBYDiGn9sVIDAfYVB/yopY1xUYmZ6PxBD+zbL5czh9P3ssKCr1YeJP+qBeACM4s0ArKmt7sZ4+uE015Xz3vN/HEEj+fwI6W/uuWOneH0sMP8grqoFwKqsB/PXVTRYrlmXf22kdUYZagGozH5AWGh2QtdRk4SqEvLchoSvurz9khraWPxDeU+nZQjaT4lJed1E+4xzJvDkRYesgmO0rSO59x29vKf4kFP78zsOrR+882fUpdjOApIKhGlkf7ig+9K3keXBktcwHfGvQu8wc4nm1ZRD4UOmHRGI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(5023799004)(11063799006)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW9tQ2prZGNLUERQQXhra0xCa3JWM1NQUjBkSytVczhySFQwVCsxbXdpZkpU?=
 =?utf-8?B?YVVsY1g0anFma0RVRWZ3RHh2SjRNdkdYVFJXdmdPaUIrajZFZ3orcEdrNGVy?=
 =?utf-8?B?cHlLb3JlNzlqQlpodFhWdFc2MCs4bUNTTjRwUUtrTGp6R1RLVmxLUGoxNzBl?=
 =?utf-8?B?UnRQd0w5WDBzSk8wU3BIbytWcEkvd3ZUeG5nQ3pxMG84b0lSMEVmYWVsK0pi?=
 =?utf-8?B?QVdZNjV2WG1nOXMxcDVPeC93UTZUMVFMNUpwZ2ZsS2t3aFFiYlp3Mm5aQ2ds?=
 =?utf-8?B?ZTAvVkY5TnIzMGVZbGs3R2padjRvQTZUK0dVRDZXcEc5VVMxajZrWDNYc1M0?=
 =?utf-8?B?eTZaOFVFVkNVcHpEalhiK1UwYlJJc3M3NVdydHZKRDZKUG1DODVnUHBzUlB5?=
 =?utf-8?B?ZERDZnRMTXlGUzNWVmJ6a3E2dEs5VFZpMDlOTGhydHc0UVpxeFdEbmpJWm1W?=
 =?utf-8?B?MlVvT1BsYmFmMlhkMVJKRHd5bUg4ODgvRDZCOXB0cHo3cFpVQXBqc0ZwWEpi?=
 =?utf-8?B?UGJqNko5ZW9CazRtSWUrMXdCbmNFeW9WdXNLMXBVSEhDK1JaNVhpdDJXMXQ0?=
 =?utf-8?B?bVh3Q0dZaDRmanBqdUtIb1NBV2R4UHN0b2dyUDV5dFV3dGJMbWNWQVlWRFNk?=
 =?utf-8?B?RjZ5Zk1DVkdvVythWXB4UE9VeWNkOENLV2E5bXBhdmQwNEczOUdxLy9iL1U3?=
 =?utf-8?B?TExzQnJXdWwwbWFzYTNOejdVdlFvSTc2Z25YVjlsVkQxUE92d2pFeEJuekpi?=
 =?utf-8?B?UlpqRkxVZWFGZ1Brc09ybnBWNDFCUWZjdjhNTllVQ0hqNDVTOEZXNHdkSFFt?=
 =?utf-8?B?Q3c2SG03WThnR1gwM1o5eFZ4UWxjREpCdk1TaWk3SncvM01HM2lUZGpXUlNt?=
 =?utf-8?B?QUxtMVBqc2VJbTI3VFc1djJmSUVuSkR5RlBPTm5mWlcvcEM2UHhaWTlBbVYv?=
 =?utf-8?B?ckpBMXl4UUJTL2RaMjc5QVJrc2V4cC9CQWhLcDZMbXFUTnI5bCthOHJhVWFR?=
 =?utf-8?B?RFVaTzBSWWtXSkhVVFdTd0NLWnlLa1crK2pkTlh1YXRNekdtUS9YblgxZ1Fk?=
 =?utf-8?B?VFU3bE5LMnBNNDdCSlR0R1JpaFppV2gvUUJwRVF4UDErTHA0cVp4OU5Ibkth?=
 =?utf-8?B?bVoxVmVCK2RFZWdLSHZEVHlVRndlanVjMTZEU01RWGluZEl2R1NJYlEvY09q?=
 =?utf-8?B?MElockVrRldmSTNER1NiQkFZQUFtWElUYWlDSGU4M29XSGZXSVhkTU1wR04x?=
 =?utf-8?B?Q3RXa1kwVGJ2cnV5ZDI3VWUwY3V6M0hjWU1Xd05veEtKSTlPYjZ5Wmd0ZS9U?=
 =?utf-8?B?MmFSZjBUUFBWRzFQRndGQzRaTlBhUmZZek9xM0tmUzF1NGNSU3VxTVppU0ZU?=
 =?utf-8?B?Mm8xRjhUL3IxZmNYa2JZVWZOYkRqVDRmd0x4N0FKZnppNmZxUGc5VEl6aEhI?=
 =?utf-8?B?UXEvZ24wL0MxTWpCUFM2dDlZUWNrZFloWW84dmMyOUdlZjl0L2JRY2tpRmV5?=
 =?utf-8?B?cVV1SmtQZnFkNW95b08yRGl0MFQvWllkZzQwSnJYSmU5c1JGZnZibldUeVdB?=
 =?utf-8?B?RmFZbitMUTU0Zk0wb0lvQnRIYm9Uc2N0a0JxNUczYlg2aVM4YnhJOVRLWStw?=
 =?utf-8?B?U2VtMXp4VWZhVVBrSldDVHVYbm5IWlhYR2RPNFNocmhTUVljZitUWFkxSTg3?=
 =?utf-8?B?TVp4QytjdHZJbUVXTDF0SjFMRVNzMFNuT25xc2d2RXdJMTh5aTU1c2l3MVl0?=
 =?utf-8?B?MVN0Qk9zb1RCQ3RQcFVUYlYxNTYwZFlyOXBCVXJMRjFYaEI3czM4QnI0Wnhh?=
 =?utf-8?B?TE5vUnhzMHh5WGFRWERPWWdBSEZkdnVVdzNhSnpzV1piMUVrOENMS2VSdTNV?=
 =?utf-8?B?Q2lDWG5RWERsaWlkWGVOMlZsRFhxa3hXYjdEeUdYM1orWmJobzc5a011K2pq?=
 =?utf-8?B?a0RrelFOdk5idUNBdGNMMENLaktJV1BsWE9NcXRRdEM2Q2txZkhqd1duMmov?=
 =?utf-8?B?SndQOHl5YTBpRGNlUHVHV2gvSkx4UFpzOG92Q2htNWlZR3B2dHY5QWgvbyth?=
 =?utf-8?B?UEV6U1gxZzVBU1dOZmR0TWQ2TWJvUERwUk8zaFpWNDlYV0JETDBmci9wWEJJ?=
 =?utf-8?B?RGQzUis5U1BSK0sxWXFEejQ3QkpHZWRvdSszWkd3R1dFN2hiNDg5WFltSkRu?=
 =?utf-8?B?aWxDc0VJUE5sN2tLNVpHVW45ZmxNczh2VmVFSDBkK1dTeVZFcDQxc0VPbUV2?=
 =?utf-8?B?WUlDRHlvUmJSWE8xQURoak82UzVDQWliQ2ZyS2RlSlIrVS9XQ253Wmp2L0Rt?=
 =?utf-8?B?WmZLWnFRWjZyTVN3TythNDdQeEtZK0ZBVWNaMmNXTk82cjQvc25tSlFZQ0VY?=
 =?utf-8?Q?rcqAr9uaQ8MzXDGY=3D?=
X-Exchange-RoutingPolicyChecked: vUSY9BYhUCACgrc2MEkKdVKI+CRNvfo4jH8clMxuJdBQ31sv98tD9XC2FQcHAQSqZRFEqRwXGy1Dpani4MbC/sK8CZ2Wtz3PY8ouEpR4/xavhxIuVl2LGf2MnskJhBvpH41u1/MdtI5uOmKzbxlHsY9OUM+L1aXmzRZAgw9bW1BZ0mZCBne27xq+TkurIgSYy1ekwoQv39PMdVL3EYGNhZtchRCW1rlTk2g1jTopg3fOPE6aWpyU0eBKccmPscMXB9ssoUxWsAQIZtOeyStf0VAfAaALSqRTqRZvf8W5wd6tt9BOpX/5DMdF5Y7jTm6NCJ2c0sb79j0iKkpcyiOCKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e9bafd-003a-4b6e-4e8d-08df2a4397a0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 22:36:30.6766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkwPEk6jTeqdBw1FxtorlbFZYZBkIJ1NtTdHH4eC1aAKiIkiChK9g6FFFFnwQ4xE2blazlsD7zNtjaHncL0ITD+rchTMW4aO18X0SeVVCJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE99BD3AEE
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



On 10/12/2026 4:29 PM, Umesh Nerlige Ramappa wrote:
> Instead of always returning -EPROTO for most errors, use different error
> codes based on the error type. -EPROTO is retained for the cases that
> are genuine protocol violations by the GuC.  The remaining cases now
> report what actually went wrong.
>
> A CTB that has been flagged broken reports -ECONNABORTED rather than
> -EPERM. These errors are not contained within the driver: they reach
> userspace verbatim through the gt freq sysfs knobs (min_freq_store() ->
> xe_guc_pc_set_min_freq() -> xe_guc_ct_send()) and through the VFIO
> SR-IOV migration callbacks (xe_sriov_vfio_suspend_device() ->
> xe_sriov_pf_control_pause_vf() -> xe_guc_ct_send_block()). -EPERM reads
> as a privilege failure, so a user who hits a broken CT is told
> "Operation not permitted" and retries as root to no effect. Worse,
> xe_sriov_vfio.c already returns -EPERM for its own "not a PF" check,
> so the two are indistinguishable to migration tooling.
> -ECONNABORTED ("Software caused connection abort") says what actually
> happened: the driver aborted the channel after detecting corruption.
>
> Note that -ECONNABORTED must stay distinct from -EPIPE. -EPIPE means
> corruption was detected now and transitions the CTB to broken, which
> g2h_err_is_fatal() classifies as fatal; -ECONNABORTED means the CTB was
> already broken and is benign. Merging them would make receive_g2h()
> re-declare the CT dead and re-kick a reset on every dequeue iteration.
>
> receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
> two error codes that dequeue_one_g2h() could return on a fatal error.
> Invert the check to simplify reset handling.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Assisted-by: Claude:claude-opus-5
> ---
> v2: (Daniele)
> - Drop the xe_log_error paragraph
> - return EPIPE directly
> - use h2g and g2h variables
> - Add EPIPE comment back to xe_guc_ct_send
> - s/ct_id/ct_error_id/ and s/ct_dead_capture/process_ct_dead/

nit: the previous rev of this patch had a changelog up to v6 which is 
now gone.

> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 209 +++++++++++++++++++++++++--------
>   1 file changed, 163 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a00b5e761e96..3e23a4396b39 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -37,6 +37,93 @@
>   #include "xe_sriov_vf.h"
>   #include "xe_trace_guc.h"
>   
> +/**
> + * DOC: GuC CT Error Codes
> + *
> + * Send path - xe_guc_ct_send(), xe_guc_ct_send_locked(), h2g_write()
> + * ------------------------------------------------------------------
> + *
> + * Channel-state rejections - the message was never queued, nothing is corrupt:
> + *
> + * ``-ENOTRECOVERABLE``: the device is wedged. No CT traffic can make progress
> + *   until the device is recovered.
> + * ``-ECONNABORTED``: the H2G CTB was flagged broken by an earlier corruption
> + *   check, so the driver aborted the channel. It stays unusable until the CT is
> + *   restarted, which clears the flag.
> + * ``-ENODEV``: the CT channel is disabled. Don't retry until it is enabled.
> + * ``-ECANCELED``: the CT channel is stopped or a GT recovery is pending, so the
> + *   message was dropped. Often benign; retry after the reset/recovery completes.
> + *
> + * Internal flow control - never seen by callers, handled by the send helpers:
> + *
> + * ``-EBUSY``: not enough H2G room or G2H credits. Triggers a flush, a wait and
> + *   a retry.
> + * ``-EAGAIN``: the message would wrap the H2G ring, so the tail was NOP-filled
> + *   and reset to 0. The write is reissued immediately.
> + *
> + * Hard failures:
> + *
> + * ``-EPIPE``: H2G descriptor corruption found before writing - non-zero status,
> + *   or head/tail out of range. Marks the CTB broken.
> + * ``-EDEADLK``: H2G credits never recovered after waiting ~1s. An async GT reset
> + *   is requested before this is returned.
> + * ``-EPROTO``: the MMIO CT enable/disable handshake got an unexpected reply.
> + * ``-ENOMEM``: internal allocation failure (fence lookup under GFP_ATOMIC, or the
> + *   G2H workqueue at init). The blocking path retries the allocation with
> + *   GFP_KERNEL.
> + *
> + * Blocking send only (xe_guc_ct_send_recv()) - the H2G went out, the reply is the
> + * problem:
> + *
> + * ``-ETIME``: no G2H response within 1s, even after flushing the G2H worker.
> + * ``-EIO``: the GuC replied RESPONSE_FAILURE; error and hint codes are logged.
> + * ``-ELOOP``: the GuC kept replying NO_RESPONSE_RETRY until the request hit
> + *   GUC_SEND_RETRY_LIMIT. (NO_RESPONSE_BUSY is not an error - the waiter re-arms.)
> + * ``-ECANCELED``: the pending fence was canceled while waiting, because the CT
> + *   was stopped underneath the waiter. Retry after the reset completes.
> + * ``-ENOTRECOVERABLE``: same as above, but the device got wedged in the
> + *   meantime, so there is nothing to retry.
> + *
> + * Receive path - g2h_read(), parse_g2h_msg(), dequeue_one_g2h()
> + * -------------------------------------------------------------
> + *
> + * Channel-state rejections - the same four codes as the send path, checked against
> + * the G2H CTB. g2h_err_is_fatal() treats exactly these as benign; anything else
> + * declares the CT dead and kicks a reset:
> + *
> + * ``-ENOTRECOVERABLE``: device wedged.
> + * ``-ENODEV``: CT disabled.
> + * ``-ECANCELED``: CT stopped.
> + * ``-ECONNABORTED``: G2H CTB already flagged broken.
> + *
> + * Hard failures:
> + *
> + * ``-EPIPE``: G2H descriptor corruption - non-zero status, head/tail out of
> + *   range, or a declared message length larger than the data actually available.
> + * ``-EPROTO``: HXG protocol violation. Either the G2H origin field is not the
> + *   GuC, or a FAST_REQUEST H2G came back rejected. FAST_REQUEST fences aren't
> + *   tracked, so there is no caller to report to and the failure is escalated to a
> + *   reset instead.
> + * ``-EOPNOTSUPP``: G2H carried an HXG type this driver does not handle.
> + *
> + * Reported but not returned
> + * -------------------------
> + *
> + * These never reach a caller: they are detected in a void path or in a G2H
> + * handler whose return value is swallowed. They are reported and the CT is
> + * declared dead, which is the only escalation available:
> + *
> + * ``-EHOSTDOWN``: the GuC sent a crash dump or an exception notification, i.e.
> + *   the firmware itself died. A reset is kicked to reload it.
> + * ``-ETOOMANYREFS``: G2H credit accounting went wrong - a release would push
> + *   the free space past the usable size of the CTB, or there was no outstanding
> + *   G2H to release. Indicates a driver-side bookkeeping bug, not a GuC one.
> + * Any error from a G2H action handler: the handler for a given G2H failed while
> + *   processing it. The code is whatever the handler returned and is reported
> + *   along with the action and the raw message, from both the worker
> + *   (process_g2h_msg()) and the IRQ fast path (g2h_fast_path()).
> + */
> +
>   static void receive_g2h(struct xe_guc_ct *ct);
>   static void g2h_worker_func(struct work_struct *w);
>   static void safe_mode_worker_func(struct work_struct *w);
> @@ -931,6 +1018,22 @@ static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
>   		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
>   }
>   
> +static int ct_corrupted(struct xe_guc_ct *ct, struct guc_ctb *ctb,
> +			u32 reason_code, const char *msg, ...)
> +{
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	va_start(va_args, msg);
> +	vaf.fmt = msg;
> +	vaf.va  = &va_args;
> +	xe_gt_err(ct_to_gt(ct), "GUC: CT: %pV", &vaf);
> +	va_end(va_args);
> +
> +	process_ct_dead(ct, ctb, reason_code);
> +	return -EPIPE;
> +}
> +
>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>   
>   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -955,23 +1058,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		u32 desc_status;
>   
>   		desc_status = desc_read(xe, h2g, status);
> -		if (desc_status) {
> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> -			goto corrupted;
> -		}
> +		if (desc_status)
> +			return ct_corrupted(ct,  h2g, ct_error_id(H2G_WRITE),

not sure if it's just my editor by I see 2 spaces before "h2g". Other 
calls to ct_corrupted (including the g2h ones) seem to have the same issue.

Everything else looks ok so with the spacing fixed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +					    "write: non-zero status: %u\n", desc_status);
>   
>   		if (tail > h2g->info.size) {
>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
> -				  tail, h2g->info.size);
> -			goto corrupted;
> +			return ct_corrupted(ct,  h2g, ct_error_id(H2G_WRITE),
> +					    "write: tail out of range: %u vs %u\n",
> +					    tail, h2g->info.size);
>   		}
>   
>   		if (desc_head >= h2g->info.size) {
>   			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
> -				  desc_head, h2g->info.size);
> -			goto corrupted;
> +			return ct_corrupted(ct,  h2g, ct_error_id(H2G_WRITE),
> +					    "write: invalid head offset %u >= %u)\n",
> +					    desc_head, h2g->info.size);
>   		}
>   	}
>   
> @@ -1036,10 +1138,6 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   				     desc_read(xe, h2g, head), h2g->info.tail);
>   
>   	return 0;
> -
> -corrupted:
> -	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
> -	return -EPIPE;
>   }
>   
>   static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> @@ -1063,7 +1161,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	}
>   
>   	if (unlikely(ct->ctbs.h2g.info.broken)) {
> -		ret = -EPIPE;
> +		ret = -ECONNABORTED;
>   		goto out;
>   	}
>   
> @@ -1215,7 +1313,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	return ret;
>   
>   broken:
> -	xe_gt_err(gt, "No forward process on H2G, reset required\n");
> +	xe_gt_err(gt, "No forward progress on H2G\n");
>   	CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>   
>   	return -EDEADLK;
> @@ -1250,6 +1348,9 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>    *   request cannot make progress until the device is recovered.
>    * * -EPIPE: the H2G CTB is marked broken. The channel stays unusable until the
>    *   CT is restarted, which clears the broken flag.
> + * * -ECONNABORTED: the H2G CTB is marked broken, so the driver aborted the
> + *   channel. It stays unusable until the CT is restarted, which clears the
> + *   broken flag.
>    * * -ENODEV: the CT channel is disabled, messages not expected in this state.
>    *   Don't retry until it is enabled again.
>    * * -ECANCELED: the CT channel is stopped or a GT recovery is pending; the
> @@ -1373,7 +1474,8 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>    */
>   static bool retry_failure(struct xe_guc_ct *ct, int ret)
>   {
> -	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ENODEV))
> +	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ECONNABORTED ||
> +	      ret == -ENODEV))
>   		return false;
>   
>   #define ct_alive(ct)	\
> @@ -1678,8 +1780,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   
>   	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>   	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
> -		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
> -			  origin);
> +		xe_gt_err(gt, "Invalid G2H origin=%u\n", origin);
>   		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>   
>   		return -EPROTO;
> @@ -1697,8 +1798,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   		ret = parse_g2h_response(ct, msg, len);
>   		break;
>   	default:
> -		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
> -			  type);
> +		xe_gt_err(gt, "Unexpected G2H message type=%u\n", type);
>   		CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>   
>   		ret = -EOPNOTSUPP;
> @@ -1819,6 +1919,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>   	lockdep_assert_held(&ct->fast_lock);
>   
> +	/* Keep in sync with g2h_err_is_fatal() */
>   	if (xe_device_wedged(xe))
>   		return -ENOTRECOVERABLE;
>   
> @@ -1829,7 +1930,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   		return -ECANCELED;
>   
>   	if (g2h->info.broken)
> -		return -EPIPE;
> +		return -ECONNABORTED;
>   
>   	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>   
> @@ -1845,10 +1946,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   			desc_status &= ~GUC_CTB_STATUS_DISABLED;
>   		}
>   
> -		if (desc_status) {
> -			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
> -			goto corrupted;
> -		}
> +		if (desc_status)
> +			return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
> +					    "read: non-zero status: %u\n", desc_status);
>   	}
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> @@ -1869,24 +1969,24 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   		 *
>   		if (g2h->info.head != desc_head) {
>   			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_MISMATCH);
> -			xe_gt_err(gt, "CT read: head was modified %u != %u\n",
> -				  desc_head, g2h->info.head);
> -			goto corrupted;
> +			return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
> +					    "read: head was modified %u != %u\n",
> +					    desc_head, g2h->info.head);
>   		}
>   		 */
>   
>   		if (g2h->info.head > g2h->info.size) {
>   			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
> -				  g2h->info.head, g2h->info.size);
> -			goto corrupted;
> +			return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
> +					    "read: head out of range: %u vs %u\n",
> +					    g2h->info.head, g2h->info.size);
>   		}
>   
>   		if (desc_tail >= g2h->info.size) {
>   			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
> -			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
> -				  desc_tail, g2h->info.size);
> -			goto corrupted;
> +			return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
> +					    "read: invalid tail offset %u >= %u)\n",
> +					    desc_tail, g2h->info.size);
>   		}
>   	}
>   
> @@ -1903,11 +2003,10 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	xe_map_memcpy_from(xe, msg, &g2h->cmds, sizeof(u32) * g2h->info.head,
>   			   sizeof(u32));
>   	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
> -	if (len > avail) {
> -		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> -			  avail, len);
> -		goto corrupted;
> -	}
> +	if (len > avail)
> +		return ct_corrupted(ct,  g2h, ct_error_id(G2H_READ),
> +				    "G2H channel broken on read, avail=%d, len=%d\n",
> +				    avail, len);
>   
>   	head = (g2h->info.head + 1) % g2h->info.size;
>   	avail = len - 1;
> @@ -1953,10 +2052,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   			     action, len, g2h->info.head, tail);
>   
>   	return len;
> -
> -corrupted:
> -	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
> -	return -EPROTO;
>   }
>   
>   static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
> @@ -2048,6 +2143,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>   	return 1;
>   }
>   
> +/*
> + * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
> + * is simply not available right now, which is expected and handled gracefully,
> + * or the channel state or the message itself is inconsistent, in which case the
> + * only way forward is to declare the CT dead and reset the GuC. Since the
> + * former is a short and well known list, check against that and treat anything
> + * else as fatal, so that new error codes don't silently escape the escalation.
> + */
> +static bool g2h_err_is_fatal(int err)
> +{
> +	switch (err) {
> +	case -ENOTRECOVERABLE:	/* device wedged */
> +	case -ENODEV:		/* CT disabled */
> +	case -ECANCELED:	/* CT stopped */
> +	case -ECONNABORTED:	/* CT already declared broken */
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
>   static void receive_g2h(struct xe_guc_ct *ct)
>   {
>   	bool ongoing;
> @@ -2085,8 +2201,9 @@ static void receive_g2h(struct xe_guc_ct *ct)
>   		ret = dequeue_one_g2h(ct);
>   		mutex_unlock(&ct->lock);
>   
> -		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
> +		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed, forcing GT reset(%pe)\n",
> +				  ERR_PTR(ret));
>   			CT_DEAD(ct, NULL, G2H_RECV);
>   			kick_reset(ct);
>   		}

