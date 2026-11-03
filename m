Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEC7606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gbyxCLCY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D5810E7A6;
	Tue,  3 Nov 2026 08:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763C910E7A6
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793693966; x=1825229966;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iCJk08apVg7cilnZi1u56+ZXX7P/AUrcH0AT4bF3TB0=;
 b=gbyxCLCY9pQVvJbaYO1SpSfeICkBdqX4Un5F6aZaMEEY1TUWmNkG2OX2
 sgbz7TI1Uj8frTvcTePn9/tWREBU5N/+OH3hauEcvg8usKXlW2aUyksGs
 9ih5r/8BGTBHSrV/2kGRhF5GxH/+EHUyOOPwWkqSwfcUvpmTORUmRdKpr
 cGxkupEF6LaDuOF8ih6cBkd8bFT7BTFx6ocp2FlKbcwts3K47Qur/8i1v
 TsPT+Blp2fwNU9W3YLgf9qGZsPk+e87YcwaxPLsjET1gINWIxav//n4Bl
 1IlXwlQcceGxvYTWVogCiGq+FIrS6yEVsGaDTnw4KzUiHdBioBpA4jskM A==;
X-CSE-ConnectionGUID: 0BZncAlnQL2w3VTB3AdU7g==
X-CSE-MsgGUID: bqdamBsqTAeZrht79xxRaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2423015"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2423015"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 00:19:25 -0800
X-CSE-ConnectionGUID: NlwLPiVHTIOVBHqZRI6dZA==
X-CSE-MsgGUID: Lcmf59hsQ+KwUFxBXq2VCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6246488"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 00:19:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 00:19:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 00:19:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 00:19:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzHCJ4NIiYcELfS+P9/Td4JYosuzHdspbgV1uc9J8YvKgMjcj/sb/v1zsX8iWX8qd5kZQ0NNnDCOJN7Y4yKB8L5ka/3JLQx/yWS7g+tH+6cor+zvE9iXscVQrvXEEUajTWuEmWiPjDjcIRQGSqEJGaFPJL3J72FAEi9QGTXFovaTxo6TzKo31rCgRz4pbK1AkSUUGBy70OwZhZHbhNxUEng25Xs2hLRUMc58rFbjFblxHsWTeBPI9MrmazxverMlPGSlFXCXKW3AwfBeyhabLw4ztxjviA1JuO3kLDUpCCLhu6PXD+YLGdB9GFiPuTvnYStoEPYdrpTZnMr3s9+NMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAPk1JtHTBLwUqOJUY8jWLGdq7gY8w6bYW31PfvlJ3U=;
 b=PMXaabvDjW39OBB3+ajoY2Bv/P9gUiTCtzvVYQRzztoIjoIEtxGACAhExxa6AkJ6GqPmCbMlY3p8yf6xIPBTdt4+ULhynY61pwONuONth4bjmpJ3Yd6PSjcvnMV+8nHEDR7RH0xfWNwIPMGwhbQgU3LCs7SZ96XHqad7UjcVumN0GhFq5MBZULj2OSFrBve/JjS471rREIk5DNeckUK6wPdnabti4iFXChqUFDZsxh/MvofL/UR7g1m+Hgro3n5qgt+0wGUFt4e0o7a4vGVVsJzbnuvfvgrT5+7lkgRHHbtEXFlvsZL0hx91baq/sfAALLUI0nMVCJ2fHucgv0b1FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 08:19:22 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 08:19:22 +0000
Message-ID: <93b09b3e-77a2-489d-bb6b-e0ddd8628f62@intel.com>
Date: Tue, 3 Nov 2026 13:49:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/xe/xe_ras: Add a flag for uncorrectable
 internal error
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <tejas.upadhyay@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-14-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261103060929.1586783-14-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::8) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1a69d4-2cb1-45e2-944d-08df39832a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261009221227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: /iCABRhrNrjC8ansi5Qeub+MdPzBaQTDdmb8ojrPE70W8Hr0a0W9xoMWlxjxYMTbXEgRRSDZG2ZuSHQYS3W+eblzcl1D3Q12m8eDO8S2vzi/U7wmonPr17ndYe3ynsJK1xzmrYgXydRAaiSB3RfH05r8bAahhgBv5wdXFAdZqvIpCnbnizMpmjYLnxhcOnlmcjF3nd9gdwXSyUncz1q2Xz6dktgAIdMNaGZ4cKLuCZHaCfrzEQJCKSoyTH25k9c3zA9yVDOyCixscdOWKD4EsCzjOwJfwk1p+/i+IJySGfsAtBEpGdHhgjCr5t3wGIXxm7T7GCXnEMWyVSNzBf7N5MNqvKdRP00cD4lmSR8JqxokqAz6iMdkhc84WwxQL47M7aG5qrI+X+ZjM45LdJRMVCHyX5syaAe5EpVNa6LLTmOIXH12alq6qs1Qkh2+G0gw8uxNkgd9f/uu2w3nITEFrpoFKWzqHui1QJpML8rteoryJtwfBN8VbgKl5T9WB7tVrdSYMI5jlnEgzxV67wAvy6FLzwEeKk4FgGMfcNkfzcYljPT70Z2hiuoQEzNSA98nGCnQx/SQQglhbP6H9vq9VP9MgIAkUQab6di7Q3437gI6+Xwpz0uftAz1DBL2k+c0N1NrGeHMEOBKQXq4P8C8Do0eY8+ErtDuQwk/BlsTQ4M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261009221227099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXRIUnZ5ZEFnWEZxZWE3QlZpMjRkQUJac2VYK0o3TzMzQjJIVnVjMDhJY1o2?=
 =?utf-8?B?VEhDN01sR0dtVFI0eU1HOWttb2RucWtTWUZLdUtrbFhwSmJiOXpIeG5IZGdX?=
 =?utf-8?B?NVQvUTZORzExa04zbFF1SUxmbUhPUHAvZFJ1R2JxekY1VkZHUFYvTVQyYlFC?=
 =?utf-8?B?MDF6TFA1d2RjY0h6TEhSS1c1bTFzR0VGQ2VVdTJLKy8yMXg5ZUwrY1pWRHFm?=
 =?utf-8?B?eUNLNDRmNVFUcTdNUjhYK2k2SXNvblJpZjFicVBPQTNIVVp5TGNOdmlBb25R?=
 =?utf-8?B?Z3IrUGlhTHZEMEpkN0U1d25KYkdvSC9DdGhGN2l3bU1sME43RHc0Wk5Fd3Y0?=
 =?utf-8?B?c0FCNmhaK01lV1F3SW4zcjRoaVdES3E4dTFXTE9lWElhbVBVZU1hU25qeVc5?=
 =?utf-8?B?RkdqRHVoMnE3VnpMV2pSZlYwUG53d0k4WFV4NkFqaFp0UVIrNFFYL2hhZkRz?=
 =?utf-8?B?M0NXV3JBTzAyQXV1blFkSEk5c2p0dUdtMXRmMkszRGh2cjE4K0lHZGI4Z2Y4?=
 =?utf-8?B?VmJwaVU3RGhKNTlkQ1lGZ2c4WUtXdlJ5VDhpbWJ4YmFreUdnSXR4ZElHY2tC?=
 =?utf-8?B?eEl4Y1M3RjNlV29MTHFMdnBJQ0xqZy9MT3V3b25vbGtQWjVOa2ZOeUQ3RGFk?=
 =?utf-8?B?NUVNSVNvcjBzRXVXaW9PWTBDckR3d1NyKzFOSnBVc2tZaG1NaWhubmxBRTI4?=
 =?utf-8?B?NVRsQXI4UnlRR0RjSWNNWTlSSHBma01TcEJwN1ZESWJ5bHRaUTRaWDl0K2dX?=
 =?utf-8?B?MGlVNGFsQ2RtNkRhRHFYbkZFUzMyNEs3c25TV1NYcXZRa280TE4yNlRoNG9v?=
 =?utf-8?B?aGFhK24zY0ZXOC8yMGo5Tkh0dVIzVy9EbEErUEpZSnZHbExEVll1Rjlhd3Z4?=
 =?utf-8?B?eHA5bFpneXdMUFdPcHhNallpalVsRjVsY2kzanNSWEZ5ak53UTdzZWM5MXFa?=
 =?utf-8?B?NzFFZEFFK2ZmMzBpRU5FQUZ0VHgzVkRaZXRNZ3UrMXVza2xTMHpCWTY5TE5Z?=
 =?utf-8?B?ZVpXd0lYTUY2SGtrTEZKdm9LNW5CRllJTmM3Y2NZUnNMaVN1QWdMUE9ZYVBn?=
 =?utf-8?B?TXpBR0lZTU1iUUxtdXAwYzlQZjY3MzZxYzhMOUV0UVJjYy9VVmFiTFN6Wlho?=
 =?utf-8?B?cUlZenJMN1RzbGF4dXhxcVZCS2lSUTJuMWlYU1JoMHdCUHpteUZrWmgyOE5t?=
 =?utf-8?B?cTU3eHhaSXZNM1lJU016cVB2dU9HcC9xbFRDMGw0M21qaUsyL1VlWnBqUUVM?=
 =?utf-8?B?dHFLSTRqTmFDNDMxOFlEUjBQeXVEYm1iL1RrdHU1NkZYeVJIbW5rc3VUTDV6?=
 =?utf-8?B?aFErRmY1NVUwK0Z4YjROOUhGeUR0ZGFlVlR6WmNVWnZVdkZLcUo4N0JWOVlB?=
 =?utf-8?B?K0w2aXFsdG5pNHZXZEtjcjk5ZC9yTzFmaEQ5TllsalFVaVJOWnlwaTYzR0ZU?=
 =?utf-8?B?RHpoSUVMSzQvNzB4ZzJSTnpOejFHVVBiZXllaTVxTTd5dTJLR2MwdUtSN0hT?=
 =?utf-8?B?OXVBWldicWI0WlJnUXVPSVlkQUsvWDgxVGxxaVgxU0dUakUvWm5HUFZKS0M3?=
 =?utf-8?B?WWQ0YksvRnpxajlKaEN1TGVjelBwMjRUNDhhaThkb0t3VU43QTdtREFleStY?=
 =?utf-8?B?dTZ6OFNQb1UxNWlORUpYdTFDUDAwOHR4cno3bDNzNTZkLzFFRkhRUmZ5Rmwy?=
 =?utf-8?B?b3RBa0ZxbVp2Q050bTVNU00ydVpWQWo3NEJNY3piMFBlcnA0Ynh2dkRMck0w?=
 =?utf-8?B?ZVpBbFpRMTJVdk1zWlM3SlBLblNvMDFQZ3RqL3VhaXBWbVZmQ2hkS1Y5ZVNE?=
 =?utf-8?B?bG1vSk5RelhxNVFSTFVieEpkbjNyY3c0dDhFMm4rMzcrVlpUNG9sTmZsSkpa?=
 =?utf-8?B?aUdJNktsOUVEcTljRjVXeStVUzhZMUNSOWlORGpXRzlmVVoxR3h3YkxYRUpq?=
 =?utf-8?B?VjZKWVFPbXQvZnFyVy9sY3pNZjJ3eCs0UUpkRHB0bHVjc3gyQTdvOWVzRCtI?=
 =?utf-8?B?ZzdIRE1hQTJQc1pZNnV5UE5FVzVaT3U1aHQ5UXJycnVNZVROSFZDRG1xaGRY?=
 =?utf-8?B?QW1Eb29hVHJpbVYwYzE5WkRSWmpOMVNlb0RQNGg0Mm1DNW8vUlFzUm01U3Rw?=
 =?utf-8?B?S215SElSbnVEelhIcmxzT0Z6aWwvbjdEL1hLaGl4SG92U0Y2Q3J3WTAvNXBu?=
 =?utf-8?B?dTZCcURuMlowSE8vYWIvWmNHVlFlTnZaQWxHKzAxQ2hnOVJ1ZWdoUlJWNmpm?=
 =?utf-8?B?aUJFeCs0ZDUyQkNFbWQ4S1dvRHhieW1NUUNYeUJkcnRmdmhYSzBEckFoRm1s?=
 =?utf-8?B?aVdRM284cXJ4dFR0SzJpMDcxaEdjZ0RhVHdoUE4xTGx2TmdNbkxiNmYvb0pp?=
 =?utf-8?Q?QbTCaA13VluRkvkE=3D?=
X-Exchange-RoutingPolicyChecked: dYfogs4/IzPnjZ42nUbOd+vzrhJFBrBRV/lMkHznv/1ITZCmOqtaX3M87kireFQAX8OH2uaulQrwp7DjSIK69of0O4204RlnjXq6MY7pIbL7jQmN9+q4zbVzz7//QErW0pFqzVXBXOFeq9LTOTVwLxpeHOgOeAtBbivgBhGE55lI1BVnwkywqcmaMP3dwIrgRvKRs/hqN7p6u0/Y05PPVNplR7lCCMWcM2X60vFjICVIzynEq53Wf2nfmLWxu8/7h+TcoQKka8OhZgdBPk41mKrGdtSAgh2Vnf6wfq+vrrJqGNbr9ULRJSiqFuUzuNQl2vUKR15IhbRTyKL4wqF+Vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1a69d4-2cb1-45e2-944d-08df39832a1f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 08:19:22.3575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAVHG5HO399HpzHXkVCE559vc2UcSmCVueSsnsC7XRzTdQP0bYVLaBlZBw+K+9vFPp/bOMU3O9ui2M85e3cZ48CgJhECkOjn1cwF1N3+h/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 03-11-2026 11:39 am, Riana Tauro wrote:
> Introduce a flag with get/set accessors to record when an
> uncorrectable internal error was reported via AER.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: add PCI_POSSIBLE_ERROR
>      fix kernel-doc
>      rename aer_path to internal error
> ---
>   drivers/gpu/drm/xe/xe_pci_error.c | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h       |  2 ++
>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>   4 files changed, 50 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 9bf0da3a3d15..4ade392b47be 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -54,6 +54,29 @@ static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action
>   	}
>   }
>   
> +static bool is_aer_internal_error(struct pci_dev *pdev)
> +{
> +	struct pci_dev *usp;
> +	u16 aer_cap;
> +	u32 status;
> +
> +	usp = xe_pci_get_usp_dev(pdev);
> +	if (!usp)
> +		return false;
> +
> +	aer_cap = pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
> +	if (!aer_cap) {
> +		dev_warn_once(&usp->dev, "AER capability unavailable\n");
> +		return false;
> +	}
> +
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &status);
> +	if (PCI_POSSIBLE_ERROR(status))
> +		return false;
> +
> +	return status & PCI_ERR_UNC_INTN;
> +}
> +
>   static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> @@ -67,6 +90,9 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>   		return PCI_ERS_RESULT_DISCONNECT;
>   
> +	if (is_aer_internal_error(pdev))
> +		xe_ras_set_aer_internal_error(xe);
> +
>   	switch (state) {
>   	case pci_channel_io_normal:
>   		return PCI_ERS_RESULT_CAN_RECOVER;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 3aea4969af13..58a0b5fa676d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1253,6 +1253,26 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
>   	return xe->ras.state.max_pages;
>   }
>   
> +/**
> + * xe_ras_is_aer_internal_error() - Check if an uncorrectable internal error was reported via AER
> + * @xe: xe device instance
> + *
> + * Return: true if an uncorrectable internal error was reported via AER, false otherwise.
> + */
> +bool xe_ras_is_aer_internal_error(struct xe_device *xe)
> +{
> +	return xe->ras.state.aer_internal_error;
> +}
> +
> +/**
> + * xe_ras_set_aer_internal_error() - Set if an uncorrectable internal error is reported via AER
> + * @xe: xe device instance
> + */
> +void xe_ras_set_aer_internal_error(struct xe_device *xe)
> +{
> +	xe->ras.state.aer_internal_error = true;
> +}
> +
>   /**
>    * xe_ras_init - Initialize Xe RAS
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index c44fa172011f..f7b587ac84e3 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -25,5 +25,7 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>   u32 xe_ras_get_max_pages(struct xe_device *xe);
>   int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
>   				struct xe_ras_get_counter_response *response);
> +bool xe_ras_is_aer_internal_error(struct xe_device *xe);
> +void xe_ras_set_aer_internal_error(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index a86f9d2b8c92..0ff5803d495b 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -414,6 +414,8 @@ struct xe_ras_set_health_response {
>    * struct xe_ras_state - RAS device and firmware state
>    */
>   struct xe_ras_state {
> +	/** @aer_internal_error: true if an uncorrectable internal error was reported via AER */
> +	bool aer_internal_error;
>   	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
>   	bool disable_vram_page_offline;
>   	/** @max_pages: Total number of pages that can be stored by firmware */
