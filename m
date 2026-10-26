Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7D606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Am5mc/v+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C0210EFF0;
	Mon, 26 Oct 2026 16:26:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC44F10EFF0
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793031957; x=1824567957;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ihZ3dsp1ixkeRGGHvUIphpXT6YhSdljOYWihfT2rzRY=;
 b=Am5mc/v+jb3ax/OeSkxI4dSCOZrcmwUo+SDMzLLWx6mXaHOhRXdAsbO0
 xRa75GXoH6QONTM/lFUQeqvXRF3A12nrmqHtqD2zcquyYjpo86B6BIldd
 YHs4FQ3QFREdlUpiY8KjqPs0R5XX8u4I/2+EoIdcexqaPhqcGbnl1NUnB
 u38vCFeoEZPu2KabZuIMVFCDqP7x1hqagwHGCG+HUTkMRumG/4IY1LnOU
 SFTXyU5kxpgAYiyhvPHmxRHly4vVz4y9MePlFY/cu+JgAF9A8j/66kgyE
 RoMXk7QSr3bWAxfAFR7ATdkkLemTSH2zqHGmz6fude+Fet7vpieB+IH4p g==;
X-CSE-ConnectionGUID: 39UzC/zbSyu0utFuB3LhCA==
X-CSE-MsgGUID: uyAt38hxSV+jIq/5LmdEkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1814303"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1814303"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:25:57 -0700
X-CSE-ConnectionGUID: SgDYzlKWTXGS/1O/zok6+Q==
X-CSE-MsgGUID: bqQX6gDtSSqMHRo1W3PSNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4256625"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:25:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 09:25:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 09:25:56 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 09:25:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1Iib6FqkxI5589M7o3GL32cqRflU5bmFH8HYhBfhFqGOSfsR0GdXYJwL5Om//yOsT8JLoLk5gtwZahvwHL7cYfKnoLYYXOPYRwhh0SwQxGN0wDqb3QcIknW72YBwhM3acnjZTatS0NgMiGVZg+nM5z99RypE+UYpmipH4f/GilJswgQ4eupkfdsNE57vISFcmEy0qrU0VGuRMWspDPeujeHLVjI94dxDUjh9JyRqJjWXiEq149s19R4+JGjbADWF8elNSi2r8RjN39f+oxqxmPd1MDjxy9YPopexchrnHeE3lQFateeil4hrw+AzcZ9aPsd2UO0/rtfZ/xx4e/Blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0w+bxs39/JshKbBFonRBtVsqE0iGaBefnCLMINu+Cw=;
 b=JebYEjrD773BVJtO31kLkPyAFx2hnGsT7TiVKEHH/5T/ClInMKpWRHJK1EQH/wt/PD+t9h0wuvZf+p2X3k3K2LCjFabVIBZ+ZwgTgtB1fiN11m69tDhDl8IYsZetoZy7Tba6GGIN0MrehhSER+mDdEMfXyh+/nIxri6aGD7CwvhBy/VKqOqg9ei7AKr6ll7cH2Z007kS2u2Gip7SjbHFz4p4FlCh0VO0Jd58e08Y1L1AsJFleSlWEjYorXHVZYVx8ZK4mUqxBk1Cm+s1Im275Z60v0DnIRhZLLylhUTKLh3q2dRpULQo8J7HxXi3wqYQQUX+fM+Vjq6KbId5ibbueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 16:25:52 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Mon, 26 Oct 2026
 16:25:51 +0000
Message-ID: <ceafaf33-c6bb-4333-8a6f-bc50ed4397af@intel.com>
Date: Mon, 26 Oct 2026 21:55:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [PATCH v3 1/3] drm/xe: Toggle the D3Cold enable flag at
 runtime resume
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20261023111832.218750-6-vinay.belgaumkar@intel.com>
 <6d32a45c-4090-442b-9162-63d285963350@intel.com>
Content-Language: en-US
CC: Matthew Auld <matthew.auld@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <6d32a45c-4090-442b-9162-63d285963350@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0281.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::11) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|DS0PR11MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d4ecf8c-ede1-4415-f817-08df337dcc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261022075727099003|261022105027099003|261021121427099003|10067099003|56012099006|18002099003|22082099003|4143699003|261026140227099003|11063799006;
X-Microsoft-Antispam-Message-Info: Cxx8mORpN6jMcJpBRLb/s0hmKzhawebxSa+Y437TJLmk5UghlVo53+VrTOre7AjruJ60+lC+8Sll6CD5k+AKrzW/cwcQsUIhOZEfUz5ejFC+XNnpP1+RwH17U3tZaUzC21p0Cs0zd/hJxvUuYSMLvkx0FcznBvKqasMHbgmYp7f6MQyBWDoNTQEd6CiQGGO3DbU2robM+rH3wUrMGWerr4yz7DtmktPjGgsEuLQ9hkY8seNMevvNxGmaCOpQR2U334mFwMNWDARNa5QZp5YqSt5zG3X0IyXxf6miS8g34B9i9n/s8LrOglORXWz9lzSZWY49PuoBikMdyR4TbS9m9ev1KUCsHK98RIKvkMTsbt5wFQS2EHjEMoq4n5JUjxO19k+y4ccENJG+JZtjiGGy8htOAHhwbcLYVb7Iao9epwfMB8B/DqyEQwsmLtwscD6ha/zlERnNpZzzjQrs9vnGzcFA3DmgDLGbKS+cgfrOcUhjatboRyRYbQdfK3Dt8Qsq1sVnSzDHYoM+4ZGk+smooLdFyASPEBAfwkrtWZRGeCI6+PJtH/I0blT7+U4RGhHYDCOUy12loKYBVq44t1xlsATTXt0iX2x2XOI0jNp8H21qcWA9f/oFih5hanOVaKLkhAuGtxgZLyltugUvAP3p/w+02El3e1TEIK68Bs8qFKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(261026140227099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzZKYy90Rk8yWnhGb1VFY3l5MG9hZFI1bEJJOC9rNjlHcS9FVUd6SXJkOVdM?=
 =?utf-8?B?MXhNa25vVVlySVd3Zk1aM0xNd3B6M05adEh0SVczeUI3VGVOSC93M3B6ZGht?=
 =?utf-8?B?Vk5MYytyWG41d01sQisvd3lBKytnb09rcnlFQmtRa3JqMjRCbHpicDVFdEVY?=
 =?utf-8?B?NTdreFliWCt5VzRJVVAxOWhDWkNlT2Z3SXY0cnBoUWtMNFVaZDZWckF3NTVG?=
 =?utf-8?B?OVIyTXRKcll4MjV5NUVxSGlXNTlkSUdXeFZlcktSV1RpRTk0dW9GVFh6STdK?=
 =?utf-8?B?RVNLamtpZThWcUxRanp4K3pwSUVYeDdxZkcyUTZuVEpkR0g0enBxMlVxM0FQ?=
 =?utf-8?B?VHZUd0RzaEt4OG9OaEdyZkttSUFZMlI2a2E1cjBsdGcxUHY2M2dXQmxMZGt1?=
 =?utf-8?B?U3NIandNbWpiK05uMTc2VHcybXBmRFd1SlZYY1l0UzZxU1BxMVZSLzBYelQ5?=
 =?utf-8?B?blB6SVRrd2RqK0o1cDByTHN6SUgveGp1ZDRkVk00Vnk4eDJ6ZmkwL1YzYlor?=
 =?utf-8?B?NzFwL3Mrc1gzTjBLaVJIUDN5bUt0ZkN3M21wZEswbU14UnJSOWkxUFl2cXdC?=
 =?utf-8?B?eVljeTJ2VG04bVJVMVVYeHpvYjIvYUV6NUIzcmpYcW9nYWxoTEUyS1BQNm8v?=
 =?utf-8?B?eXNSY25iSUoxbWpDTUpzblFwOE9ici9Md0I2RWRKa1ErY1JKd0xqMnlBN2Vh?=
 =?utf-8?B?VjcxUXBTa1kvR2k5M1R4cGZwUndVRlJLV09IVVowU2FOdE1RUUh2a1czSENB?=
 =?utf-8?B?TEpiTGY5YzByOTNORjRMeEpzaGtJVkF2Y3E4SzZYKy9SRi95MFpiVlRDVXlH?=
 =?utf-8?B?aXRsT2luNmF2cVBZRkQ4bkN3NXR5T1g3OTJEbVNXUnRvUmczVmJhaEtmdWd0?=
 =?utf-8?B?RGxkTDN1N2NLVWxIOTJDRmZSaENhTWRtTjVOdWRlZy9yVVB6TW5IdDZRNU9S?=
 =?utf-8?B?RjFRbEdoVlR2dzFLdEREQTYwa01waWdQUDhJVmJYWHdmT2pwM1JkbUNBNW5u?=
 =?utf-8?B?L2FXczdxWnNaUkJPaFhKNk5tTzJsYktabTNiVWg5WkZJNDVKcngrOTFyUzVX?=
 =?utf-8?B?aFpJWFVFWVFoSEd0a2VWV3VpbjhUa2cvOTJZVXhWdmJyYUlXYTRvZTczaEhU?=
 =?utf-8?B?MndkNVNObFFYNWkwMzZXeGJTTkh2Nm9HRUF5TW53SGpsUkVPbHNweUhWYm1i?=
 =?utf-8?B?MzFVSHZxa1l3Wno0QW82SWNYaFpEZThwL3R5SUg1YjVYaDJPam9SbGpNc2ZQ?=
 =?utf-8?B?SzgxelJwekw4UmxQY2RnSytoQThaYzVkNGZGWHcrVURlSzVvbXloNG54RDNy?=
 =?utf-8?B?aTVEZGNQWE5kNEFiNXFsaWE5V3M1UTJlSVdOcXNqSTU3eEcxZ1ZvL0lmRld5?=
 =?utf-8?B?cGF3aWVCMG44TzEvMngvalNmQ1NGTk5mSFdSVE5NeGxLT1VoQUwyRzMwdGhN?=
 =?utf-8?B?dVIxSkxMK1BJNTNyN0VoT0pWQ2l4bnAzTzI3WisvZzVYY3hLS09WQ1BacFhk?=
 =?utf-8?B?bGZoOUhmbzh6R0dWT2NQSDZpNnl1ZSs3L1A0aXZFV2szcEV6VmQ1OVBXMml1?=
 =?utf-8?B?aUxReUthYlorNjQwR3hoYXFaMFhYbnhMNXZuelBjem8yQkdBcndRdEZ3UEFN?=
 =?utf-8?B?bEVSNzR4cDFUdDZrM2x4R24rU1NUdHVLdi9Zc2dqRDFocTZrTy9SSzBsNmRV?=
 =?utf-8?B?VnlpMU1xT2hxMTVTdDZMZ3AyMDRKMHVLYk5ZQ3hzQzF6V3M2YWM0Z1JDSnBP?=
 =?utf-8?B?Vjd4VmtaRFlOUWdzeTRuS2k5aE13V0ZIczhwcWdQVEtvbEhPdm5ZT2p0c3N2?=
 =?utf-8?B?TllvWEJ1NjBzSTJJWHFxZjhvcVAwanZYaUV4blpBdHlDRnp0WkZNZm13YVFy?=
 =?utf-8?B?Mll5K09KMHBNampycDF2MlpjbXB5by9LSVhjVHA3Zk84dnpOWEphYm5ZeHZQ?=
 =?utf-8?B?NUZHR2E4RE9YYWRuVkNZakhYZGc3NTZHLzlndXhZd0JhQWdUazhCMEU3eUlY?=
 =?utf-8?B?VmZwVzM3ZnpXaFRnVlFOaHVyNlA3OWVNcWowM2xuTll1VDNPK1lsSjVZbmxt?=
 =?utf-8?B?QlB0cDhRMjV6OHd4bmlidFBESlpmbmNJQjFGRGtZaE0zMjV3OHhHT2x6ZW1i?=
 =?utf-8?B?cTNIMUk5ZEpWQlVCUzcrcFhRWXRmcDhXenBORGJPOHpEY1YrYzlLUEdHcmV1?=
 =?utf-8?B?Y01CelZOanlsTmhwVi9hSVo1Q0RwcGZES25nUWpuNXFXNWhSTGRraUVlNW0z?=
 =?utf-8?B?M1Mzd3RwTmpwaVp2QzFIM09SSVpRQysybUlZQzA1azAwUElodzh3bmI0dUVY?=
 =?utf-8?B?ZzZ1c2lhUDd2ZFlCZlFqZUlwSUl4K2h1VXNFaGdvL2tiYUVCYlpPZz09?=
X-Exchange-RoutingPolicyChecked: V6mL0XxADVhyeJvP0DXrvizE9AXkKDcPsNyRh264foO2Tp3QUlctls58RJycJ0cKhcxrgXf+uBAOO4wRr/yrTOzlgexNsbO53h7J9bwDsfVZFmMNvoyi+pfHeoOoIFNpv5zFCQm2+1+l78pvIJyjmf2i4PeWxIriUFMhicpefuOSLAxpcp1bH2k1MdC+y2ItevHyBwfwI0KYPd4xRAk5TVHNtpduJSwnESNnkHMaLtpqed4R/9yccEr5SFrEGkS+L2ZvszuMaoUPLHHlUhxxhaI62yND6HIP2LN7QUxET+sVQYAYPaHXqUxGWw9x9++2U6e7Ik1nFeVU7yl0Zwz1Rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4ecf8c-ede1-4415-f817-08df337dcc4b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:25:50.5590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8jXBwaHsLB85HQCWDD49cldwlq+x4HwaDkC4AULkCL32bL3DDTHyiX61DpS7DoQoR8HtAuwaScM3/PJq2dQrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
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

>
> We enable this flag during runtime suspend, need to set it back to
> false early during resume to maintain consistency in pci driver's
> internal state. d3cold_toggle() updates the root port's ability
> to go into d3cold via the dev->no_d3cold flag. With this patch, we
> are ensuring this internal state remains consistent with that of
> the endpoint.
>
> v2: Clarify the commit message (Matt Auld)
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Fixes tag is missing

Fixes: f026520367be ("drm/xe: Only set PCI d3cold_allowed when we are 
really allowing.")

Patch looks fine.
Acked-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> drivers/gpu/drm/xe/xe_pci.c | 3 +++
> 1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 0c13eb901aa7..d13599d79ae9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1456,6 +1456,9 @@ static int xe_pci_runtime_resume(struct device *dev)
> struct xe_device *xe = pdev_to_xe_device(pdev);
> int err;
> + if (xe->d3cold.allowed)
> + d3cold_toggle(pdev, D3COLD_DISABLE);
> +
> err = pci_set_power_state(pdev, PCI_D0);
> if (err)
> return err;
> -- 
> 2.53.0
>
