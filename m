Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F125C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 06:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379AC10E46E;
	Wed,  2 Sep 2026 06:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5AehIhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE14A10E46E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788330701; x=1819866701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=EyxPIxL4PEjvcjCItXNv9k9fN+Vc8l7jTGtiCc6ZdTU=;
 b=d5AehIhZG08bEotT4tPcLW9ofWvcUFp8qTPXKkULFoP1bR+BUm68kdPk
 37wutAx7ufWIAYsCm/v+2LYGJ+RZ6GkeGhG32itkWpc4+PIf7b6H32G8/
 TZKnzeBT/vx9/CT1FoRtRrRxFWcb6xsSAyZ0vmr3tWqu2v+xGjp3zjCEA
 tZ9BnWNBaINXG+IrwUhVriWf03kunlFSCR67HH0GktrHKUH6uM8+7kkZR
 YxRTDc5JlHkg9NRosRvBFiI2cEGh4OezdxgZkqTEd3zWvoEu4Ru49f+Fu
 imbCvBcflJo+UHTpY/pxvqaXGwQ9HrqWUs8DhXMsAj8KrHpLLtBe17snC w==;
X-CSE-ConnectionGUID: QbCDuaitRG+75AeTFoyg4Q==
X-CSE-MsgGUID: CB7sV9aTQLWnu4Kmt9ZPaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100131520"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
 d="scan'208,217";a="100131520"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 23:31:40 -0700
X-CSE-ConnectionGUID: aFvxNUP6Rqq8U16/hWAy5Q==
X-CSE-MsgGUID: dkmO6NGtRcqB6B1eEvg3UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
 d="scan'208,217";a="269337702"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 23:31:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:31:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 23:31:39 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:31:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npWG2+LdPtcA3SBe6Qk1mjkABRBhZ3zgW+WPrgQUghHWoImc19MJANuSsisbitT8/JvEIuwCuQgfA98Li7nipF7s4b5E17Fz6aYuNYo4I19GiNKEcQSTzNic6Uj/ZqDa9mncuKXk/tewPRl8JFZgCiCEMON+7nG+sWuVMUazW4eiTHwHh3rjaVW8/RodjpNE5QmrJbqNRqcNR3yMykeImseFNsDj/lFW0mayAm19eahhn5FYQJhtQ6TDYLIG9ia1TbRuMUXtkjGcQcavIfHQ/vWgn5opfv68qgpSR9qTuS1oL5JgRVtFhNGWKdWVspCjbKnCPd4hKj/TLGuSMLRscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izqssHYdOatR+ZGyIatO1AY2QGfe5nrkcuxiXqEMOVQ=;
 b=w+VUg8OSiNOSRVeyRhxPsxlnKcE3aqW8P5KzymTRgIL1aAt2o6HWeORHztXtHbvKXZsC9LwBQuMEt+Hjjo+AwFHYN+SBQhVo3BVxaUsr5CFn1KWj8xJClt9ld91bID12S7/AwxewK5qQBgPv+VrEvbNbeOHMAv2ah+1p8DdkrM42OEJmowfkU7DrjtNQB+9sTVNDJPM1q+3c4jjUmFfHfv7qZ1Fb0K7/J3pbIGUmN6BWWK+HFKq81uNDLhg1WpSIvn5iyfsBN15LwGo0/DQIJ4Vr6mM/73urk9PkWfwysSumGUWc1CNVMYvU3J+USy8i8yPSykEV/WCxpdZ2hAHGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:31:03 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:31:03 +0000
Content-Type: multipart/alternative;
 boundary="------------if3MC01eUyHM9gCt1BCNyua1"
Message-ID: <17780d34-b06b-4db7-888e-e3734530ae31@intel.com>
Date: Wed, 2 Sep 2026 12:00:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <tejas.upadhyay@intel.com>,
 <himal.prasad.ghimiray@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-9-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260825063615.3697317-9-riana.tauro@intel.com>
X-ClientProxiedBy: MA5P287CA0224.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf0fb51-e4b2-4bd8-7a5e-08df08bbc2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|13003099007|8096899003|56012099006|6133799003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: mKLqaOknaUV0v/23gtoHqgPw64qUCu2rQ1CW16+LLzT5P2dAAdlLu0hk/rv/jgkPj7TQFwq6U92THBp+b1agYvXBB9a5L2uCWCz6fTRDKt6L0NBRP/2OoSYz+b2vLFo/uLn2APYEOi7MkQLaKS3xRms5LB6rqNyZt2TM1+vbGve8shcN4cTHBXWbDjkSfAp74fkKvvYzZQiWAcnwAVaLdv1Qp6fe8k6exMTm1vtaerboYCL4aYH6+H/c3ryENTWq95Tos4ED40a36OzZGmD6fxMwg9/C7Ftfkkm3XzP8B/3veMxqDC2A2rLl+8aKrQXGWYqm9fr9bJXHM/zeFtGSH4t16eQRL3qMHc86UxcoMMlV4N4GEF0cesbhL+nzzb0naa5pwdsd/YmX2orEPwqZvZNuU084R6p7Mv3rSpp9GZcHZtSYkPtK4jJVH64bfNFyiY6fdxk7BDClspkcAQ1vsRvbp3R9vkSR17m6qpUYKvTU3yOidCfp0bI91g1Dn9KQ+9ZF82Tn3ouZEVPDMfz318YMa2nqFwi2zOuc+1pV/yc/ZkxvRR6FX96iGputJYouxNg/SYCX8JjyQ06cBMen66LNDrh85mgow8RYRreABNyOGOlDwYYbMwW1Je+CjFr5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(13003099007)(8096899003)(56012099006)(6133799003)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXIxL3R5SVJhaUR5bnpCOU9JVjBqY2dJVmlZLzhWVitsMXVGRmcrdFBDc3ZK?=
 =?utf-8?B?YmZPSDZSZzhBTlJaSFB0MEVzMFo3amhsNDArU3ZXemdlOUZWNFVaUDl5UGZt?=
 =?utf-8?B?TWZMTE1JQ3l2SDFkRGQvaEpkVnE2WWRIK3hWTDB5amEyNnNBK2JkcnVJOWpY?=
 =?utf-8?B?OTVjTnljY0d3YTJUOXQxZ3pjeFZwb1VDUzRzb0dpUURWYmYxSjVRNWMrZDFN?=
 =?utf-8?B?VHQwc1pOSm5nbUpROTRQQzlENG9zUjd5Q2lvVENvUzdsSll2cENVd2J1R2ZB?=
 =?utf-8?B?eWQxbEZEM3FmbjRoRlJaRXhnSmRkTUJhWWl5bGY5NFd5QTAwTVl0eWpvZkVX?=
 =?utf-8?B?aW1nQjY2SllRc1JqdXdRU2FCK3lJcTVEV0kwbFJHUUp4aUZLcjZVbnVyVUVt?=
 =?utf-8?B?UTI0NE1odVlXRjUwYXVxVVgvSW12Ymt3WGN1WVRmZmlSYmk0QkxxVDRudzJS?=
 =?utf-8?B?UE9KUHA3Z3U3NU9QZ2NNeWJ6WEdoOVg2c0xOU0hQT094V1ZVUzg4bXZCTS9l?=
 =?utf-8?B?Z2hPRks3cnRLMnhBWGFJY053bEE2eDUvbHBtV092eVpabm0vazNZaFM2cHls?=
 =?utf-8?B?M1Y4RFlIR2hoNy9aWTJxc1Q3Sk01aGpNRkxmcVlkY3pDK1NzZU9DeGRDUHBO?=
 =?utf-8?B?cG9ZamcrS2NNM3lPcE9kWWtrakFlcXl5WW4wMkE5emZtT2J0dnhyK25hMDVF?=
 =?utf-8?B?YmhvTGw5QWhlbEVmRXNMc3Y4bDFnM1k4WDQxV3poeG5QVHV0NTRlUmt4Ujhl?=
 =?utf-8?B?ZTFNcFhNNWdJY3JXOWFWNmZ3MGNPQU9tMU5tL3hnVzg4cVZsdnZLMWsybnZO?=
 =?utf-8?B?QWNzZDJlem9OcWlETlZQeTZTbkFyRURLdml3d1F5ZURlMVczQXdCNThtMDRF?=
 =?utf-8?B?eEFqZS9ncUszcUJCc1BoQ2J2NHhRNHRCZFUrMXU5SDZodXpaZGVIcGE2Nm5r?=
 =?utf-8?B?N3hOc3piV29Na1BReHRWNm9PeTFhS05CN09SY0VRbzNqRTFWZkYycVVnWUkz?=
 =?utf-8?B?T014VnBNa29ZbTFKQ0N1SU9mUTFXMHJsaGNCMmZ6ZHVrWVVKazRvaTFYOVhK?=
 =?utf-8?B?akIvODVibCtxSjJ0bVpXbVlsTUhMd0E3Yk51SVZRcHF2RzZxbVhLMnhSYk5J?=
 =?utf-8?B?TVFLeVhja3B1WmhGWlNnVTB6aFRvcnJVWFdJUEFIOE9iMFl6eVZKTVBvWHpK?=
 =?utf-8?B?RnFQUlVTSDRKQzU2S3NobVZkYTZuQTkva1dQRXROYytRMXBjbVFiZHZFYnBF?=
 =?utf-8?B?UjAwNVlPalptRWFlc2lZbFNWd0lnNmx4Vzg1QzNWdDl2SnBiRGdUQnU4Z21Q?=
 =?utf-8?B?NUIxUVNSVVY5NVNqWCsyMkJRZGFZUU9OSm9md242bUd3WGJYZis3KzVVUjF6?=
 =?utf-8?B?eGhMVGd3bjh1dk5ydUhMZThHb1BoZklxTitjcWdVTi84OUFzQndScEYxUEFN?=
 =?utf-8?B?MzhaeWVQRnVHWUVueDgvTkhtK09HSjRYNFFnRVVoeE81OGoxSHhnOTNVMFpi?=
 =?utf-8?B?c3BxLzQ4dVgvemliZUdLTmt5bkxJTnJKUCs0WnowOVN1S3ZXRThsV1FPN09u?=
 =?utf-8?B?VHNEak5VQ0VjM0VQVHBiZGUzMEVxS1pxMnpYeHQzdklqUmtDZFVndmN3TU5Q?=
 =?utf-8?B?UGxVM25UMXpSYktpeHQvTUxaYTJTZlN2K0JsY2hiQmFJN0lSK3M3T2tQSllG?=
 =?utf-8?B?NkR0VFRrYTFGTTJHWWZhY3JSZUZqbWFJWkZmQlhsclgzaGF3SGorMGVhWVFG?=
 =?utf-8?B?NlZIajBWYkQ3ZHd6NDdab2Z6Ynh1NXBLL3EwMjZ3RURsM3BxY2E1U3hZTmQv?=
 =?utf-8?B?Vkt5U3MrdDhrMlpLVTVWVUc5TGpEMktyL1pycGsyWjYxbHozaUxwUU9SNTFv?=
 =?utf-8?B?Z0szM2NoV3Z2UlVCMVF4a1J1OEU1NTl4cUhQOXY1NHBTK1BMcUpkWGV5WXhV?=
 =?utf-8?B?cThZU0VnZUNTdTdPSWhvN1ZHSEV4bTdJZXY3NVBNdFZtdHlsbzB3cGRxS3hx?=
 =?utf-8?B?V0dWSE9OWTVCcXMyK3NSOVY5SmtOUGl5UFJGK2NwYnNOYU1TdFh1S0F1eTRs?=
 =?utf-8?B?Z1AwK0JRK29BR0pQdU5xT1h3bVRsekduWTlYeHRpOGlmTS9JVWtpZG9wcUpQ?=
 =?utf-8?B?SHhXcU85RjIvRUNuek92akdYbmlrV1NXTHgxT2haYURCWGJ6TW9BbUlDQitY?=
 =?utf-8?B?K3pJSnZFeFFMNG05YklobkFTWDFjSWZQeEY3L056NTQ2YXZDRTlheW1uOGxX?=
 =?utf-8?B?ZC94MWRmWThwSHpHUjZWenl5eTc0QS85TFNlSnNqcjlXSi9CbW8xcFpremFH?=
 =?utf-8?B?UUtoQXMzR2lLNERzSzlmNkUxQ2hPWU50cmRoMVZFZjFRRmRJTVRxOFowRnlw?=
 =?utf-8?Q?dI3pUwwQ8uprOIDM=3D?=
X-Exchange-RoutingPolicyChecked: pr2cGchR7BzV3n1fz81rxWYzHjZfLEETSeb7S6b/QORu3ge5mz15mXPU0OCMA8h1ujh1VP6vwpFVhz1xwWnL6Eq5m6uc7OmlQHmPAE/noEoikZRneGHCCfhovXZWsUHs18+/RZFD3q35w1kGhbc4bOCPw/BmRhkofBfF9b7cOlQHszvmwBld2GLCGdwvOXbPPeIRF9a+Jol3uTlQjrgsWOC8DwoevK3kkFsfx+MKISokZWNuxYnRe5A7zLfP49EPLetl/Siz12gxBAXNOAjk6q8c8wZrjIPaZStHpDERUYcUlESkgF83bCYlYbI9VwVu0xd25ge6Zz6Nb5bkoaM4DA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf0fb51-e4b2-4bd8-7a5e-08df08bbc2f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 06:31:03.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+NkN0j0516rnyUa2flu552Hl4zroImfy4MU4ukBAbdvX2UyZNIkApmNX2VxP3AoLVBPWIXqCyFe4Ea4WSYRcKeAPRYcTRTy+SmDSq4VJmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
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

--------------if3MC01eUyHM9gCt1BCNyua1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 25-08-2026 12:06 pm, Riana Tauro wrote:
> This will be integrated with the related address-fault handling flow
> once this patch is merged.
> https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/
> Sending for initial comments.
>
> Add basic support for sending page offline/decline requests to system
> controller and use it for device memory ECC error handling.
> Pages that belong to critical BOs cannot be handled by offlining and
> require a SBR (Secondary Bus Reset).
> Pages that are configured for log-only handling are not marked as bad by
> firmware.
>
> For all other valid page addresses, the first occurrence of error
> indicates a poison error and the page is offlined only by software.
> Firmware avoids permanently marking the page as bad. The second occurrence
> of an error indicates a Double-bit ECC error and the firmware
> permanently marks the page as bad.
>
> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 121 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>   3 files changed, 153 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f77531..c643c7137a42 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include "xe_bo.h"
>   #include "xe_debugfs.h"
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> @@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
>   	return xe_ras_components[component];
>   }
>   
> +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
> +				 enum xe_ras_page_action action)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_page_offline_request request = {0};
> +	struct xe_ras_page_offline_response response = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	if (action >= XE_RAS_PAGE_ACTION_MAX) {
> +		xe_log_err(xe, DEVICE_MEMORY, -EINVAL, "Invalid page offline action %d\n", action);
> +		return -EINVAL;
> +	}
> +
> +	request.page_address = page_address;
> +	request.action = action;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
> +				  &request, sizeof(request), &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_log_err_fatal(xe, SYSCTRL, ret, "failed to send page offline command\n");
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_log_err(xe, SYSCTRL, -EINVAL,
> +			   "unexpected page offline response length %zu (expected %zu)\n",
> +			   rlen, sizeof(response));
> +		return -EINVAL;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
> +			   response.status);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
> +{
> +	enum xe_ras_page_action action;
> +	int ret = 0;
> +
> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
> +		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
> +			   page_address);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * TODO: Call function to handle address fault
> +	 * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
> +	 */
> +
> +	/*
> +	 * Handle return code from address fault handling function:
> +	 *  0: Page soft offlined, decline to firmware
> +	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
> +	 * -EXIST: Address is soft offlined but yet to be offlined by firmware for second occurrence
nit: -EEXIST?
> +	 */
> +
> +	switch (ret) {
> +	case 0:
> +		action = XE_RAS_PAGE_ACTION_DECLINE;
> +		xe_log_err(xe, DEVICE_MEMORY, 0,

I know, it's switch case using ret, please make use of errno as ret from 
xe_ttm_vram_handle_addr_fault ().

and make it consistency across all below xe_log_err.

> +			   "Poison detected at physical address 0x%llx, page software offlined\n",
> +			   page_address);
> +		break;
> +	/* User policy set to decline page offlining */
> +	case -EOPNOTSUPP:
> +		action = XE_RAS_PAGE_ACTION_DECLINE;
> +		break;
> +	case -EIO:
> +		xe_log_err(xe, DEVICE_MEMORY, -EIO,
> +			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
> +		return ret;
> +	case -EEXIST:
> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
> +		xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
> +			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
> +			   page_address);
> +		break;
> +	default:
> +		xe_log_err_fatal(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
> +				 page_address);
> +		return 0;
hmm, In default case, we need to use return ret; right?
> +	}
> +
> +	if (send_cmd) {
> +		ret = send_page_offline_cmd(xe, page_address, action);
> +		if (ret)
> +			xe_log_err_fatal(xe, SYSCTRL, ret,
> +					 "Failed to offline page for physical address 0x%llx\n",
> +					 page_address);
> +		return ret;
'return ret' should be inside {}
> +	}
> +
> +	return 0;
> +}
> +
>   static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>   {
>   	u8 severity = counter->common.severity;
> @@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>   {
>   	struct xe_ras_memory_error *info = (void *)arr->details;
> +	int ret;
>   
>   	/*
>   	 * For memory errors, the recovery action depends on the error category
>   	 *
> -	 * TODO: Double-bit ECC errors: Page offlining
> +	 * Double-bit ECC errors: Page offlining
>   	 * Poison and data parity errors: Log only
>   	 * For any other memory errors, request a reset as recovery mechanism
>   	 */
> @@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   		xe_info(xe, "[RAS]: Data parity error detected\n");
>   		break;
>   	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
> -			info->sw_address);
> -		/* TODO: Add page offlining for Double-bit ECC error */
> -		fallthrough;
> +		ret = handle_page_offline(xe, info->sw_address, true);

In case of soft page offline, we need not required reset right? however 
when send_page_offline_cmd

return err that case, reset is required. is that correct behavior?

Thanks,

-/Mallesh

> +		if (ret)
> +			return XE_RAS_RECOVERY_ACTION_RESET;
> +		break;
>   	default:
>   		return XE_RAS_RECOVERY_ACTION_RESET;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 99b2466e2062..2fac968879b6 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -17,6 +17,19 @@
>   #define XE_RAS_MEMORY_POISON			BIT(2)
>   #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>   
> +/**
> + * enum xe_ras_page_action - Page offline actions for page offline request
> + *
> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
> + * @XE_RAS_PAGE_ACTION_MAX: Max value
> + */
> +enum xe_ras_page_action {
> +	XE_RAS_PAGE_ACTION_OFFLINE,
> +	XE_RAS_PAGE_ACTION_DECLINE,
> +	XE_RAS_PAGE_ACTION_MAX
> +};
> +
>   /**
>    * enum xe_ras_recovery_action - RAS recovery actions
>    *
> @@ -245,6 +258,28 @@ struct xe_ras_memory_error {
>   	u32 reserved2[10];
>   } __packed;
>   
> +/**
> + * struct xe_ras_page_offline_request - Request for page offline command
> + */
> +struct xe_ras_page_offline_request {
> +	/** @page_address: Page address (4KB aligned) */
> +	u64 page_address;
> +	/** @action: Action to be performed, see &enum xe_ras_page_action */
> +	u32 action;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_response - Response from page offline command
> + */
> +struct xe_ras_page_offline_response {
> +	/** @status: Status of the page offline request */
> +	u32 status;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
>   /**
>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>    */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index d0341538ad05..3363f48da2b7 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -26,6 +26,7 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>    */
> @@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
--------------if3MC01eUyHM9gCt1BCNyua1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-08-2026 12:06 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260825063615.3697317-9-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">This will be integrated with the related address-fault handling flow
once this patch is merged.
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/">https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/</a>
Sending for initial comments.

Add basic support for sending page offline/decline requests to system
controller and use it for device memory ECC error handling.
Pages that belong to critical BOs cannot be handled by offlining and
require a SBR (Secondary Bus Reset).
Pages that are configured for log-only handling are not marked as bad by
firmware.

For all other valid page addresses, the first occurrence of error
indicates a poison error and the page is offlined only by software.
Firmware avoids permanently marking the page as bad. The second occurrence
of an error indicates a Double-bit ECC error and the firmware
permanently marks the page as bad.

Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ras.c                   | 121 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 3 files changed, 153 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d25d25f77531..c643c7137a42 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,6 +3,7 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include &quot;xe_bo.h&quot;
 #include &quot;xe_debugfs.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_drm_ras.h&quot;
@@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
+				 enum xe_ras_page_action action)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_page_offline_request request = {0};
+	struct xe_ras_page_offline_response response = {0};
+	size_t rlen;
+	int ret;
+
+	if (!xe-&gt;info.has_sysctrl)
+		return 0;
+
+	if (action &gt;= XE_RAS_PAGE_ACTION_MAX) {
+		xe_log_err(xe, DEVICE_MEMORY, -EINVAL, &quot;Invalid page offline action %d\n&quot;, action);
+		return -EINVAL;
+	}
+
+	request.page_address = page_address;
+	request.action = action;
+
+	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
+				  &amp;request, sizeof(request), &amp;response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;command, &amp;rlen);
+	if (ret) {
+		xe_log_err_fatal(xe, SYSCTRL, ret, &quot;failed to send page offline command\n&quot;);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_log_err(xe, SYSCTRL, -EINVAL,
+			   &quot;unexpected page offline response length %zu (expected %zu)\n&quot;,
+			   rlen, sizeof(response));
+		return -EINVAL;
+	}
+
+	ret = ras_status_to_errno(response.status);
+	if (ret) {
+		xe_log_err(xe, SYSCTRL, ret, &quot;page offline command failed with status %u\n&quot;,
+			   response.status);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
+{
+	enum xe_ras_page_action action;
+	int ret = 0;
+
+	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
+		xe_log_err(xe, SYSCTRL, -EINVAL, &quot;Unaligned physical page address: 0x%llx\n&quot;,
+			   page_address);
+		return -EINVAL;
+	}
+
+	/*
+	 * TODO: Call function to handle address fault
+	 * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
+	 */
+
+	/*
+	 * Handle return code from address fault handling function:
+	 *  0: Page soft offlined, decline to firmware
+	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
+	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
+	 * -EXIST: Address is soft offlined but yet to be offlined by firmware for second occurrence</pre>
    </blockquote>
    nit: -EEXIST?
    <blockquote type="cite" cite="mid:20260825063615.3697317-9-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	 */
+
+	switch (ret) {
+	case 0:
+		action = XE_RAS_PAGE_ACTION_DECLINE;
+		xe_log_err(xe, DEVICE_MEMORY, 0,</pre>
    </blockquote>
    <p>I know, it's switch case using ret, please make use of errno as
      ret from&nbsp;<span style="white-space: pre-wrap">xe_ttm_vram_handle_addr_fault</span>&nbsp;().</p>
    <p>and make it consistency across all below xe_log_err.</p>
    <blockquote type="cite" cite="mid:20260825063615.3697317-9-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			   &quot;Poison detected at physical address 0x%llx, page software offlined\n&quot;,
+			   page_address);
+		break;
+	/* User policy set to decline page offlining */
+	case -EOPNOTSUPP:
+		action = XE_RAS_PAGE_ACTION_DECLINE;
+		break;
+	case -EIO:
+		xe_log_err(xe, DEVICE_MEMORY, -EIO,
+			   &quot;Physical page address belongs to critical BO: 0x%llx\n&quot;, page_address);
+		return ret;
+	case -EEXIST:
+		action = XE_RAS_PAGE_ACTION_OFFLINE;
+		xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
+			   &quot;Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n&quot;,
+			   page_address);
+		break;
+	default:
+		xe_log_err_fatal(xe, DEVICE_MEMORY, ret, &quot;Failed to handle address fault 0x%llx\n&quot;,
+				 page_address);
+		return 0;</pre>
    </blockquote>
    hmm, In default case, we need to use return ret; right?
    <blockquote type="cite" cite="mid:20260825063615.3697317-9-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
+
+	if (send_cmd) {
+		ret = send_page_offline_cmd(xe, page_address, action);
+		if (ret)
+			xe_log_err_fatal(xe, SYSCTRL, ret,
+					 &quot;Failed to offline page for physical address 0x%llx\n&quot;,
+					 page_address);
+		return ret;</pre>
    </blockquote>
    'return ret' should be inside {}&nbsp;
    <blockquote type="cite" cite="mid:20260825063615.3697317-9-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
+
+	return 0;
+}
+
 static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
 {
 	u8 severity = counter-&gt;common.severity;
@@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_memory_error *info = (void *)arr-&gt;details;
+	int ret;
 
 	/*
 	 * For memory errors, the recovery action depends on the error category
 	 *
-	 * TODO: Double-bit ECC errors: Page offlining
+	 * Double-bit ECC errors: Page offlining
 	 * Poison and data parity errors: Log only
 	 * For any other memory errors, request a reset as recovery mechanism
 	 */
@@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 		xe_info(xe, &quot;[RAS]: Data parity error detected\n&quot;);
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
-		xe_info(xe, &quot;[RAS]: Double-bit ECC error detected at sw address 0x%llx\n&quot;,
-			info-&gt;sw_address);
-		/* TODO: Add page offlining for Double-bit ECC error */
-		fallthrough;
+		ret = handle_page_offline(xe, info-&gt;sw_address, true);</pre>
    </blockquote>
    <p>In case of soft page offline, we need not required reset right?
      however when <span style="white-space: pre-wrap">send_page_offline_cmd</span></p>
    <p>return err that case, reset is required. is that correct
      behavior?</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260825063615.3697317-9-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		if (ret)
+			return XE_RAS_RECOVERY_ACTION_RESET;
+		break;
 	default:
 		return XE_RAS_RECOVERY_ACTION_RESET;
 	}
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 99b2466e2062..2fac968879b6 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -17,6 +17,19 @@
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
+/**
+ * enum xe_ras_page_action - Page offline actions for page offline request
+ *
+ * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
+ * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
+ * @XE_RAS_PAGE_ACTION_MAX: Max value
+ */
+enum xe_ras_page_action {
+	XE_RAS_PAGE_ACTION_OFFLINE,
+	XE_RAS_PAGE_ACTION_DECLINE,
+	XE_RAS_PAGE_ACTION_MAX
+};
+
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
  *
@@ -245,6 +258,28 @@ struct xe_ras_memory_error {
 	u32 reserved2[10];
 } __packed;
 
+/**
+ * struct xe_ras_page_offline_request - Request for page offline command
+ */
+struct xe_ras_page_offline_request {
+	/** @page_address: Page address (4KB aligned) */
+	u64 page_address;
+	/** @action: Action to be performed, see &amp;enum xe_ras_page_action */
+	u32 action;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_page_offline_response - Response from page offline command
+ */
+struct xe_ras_page_offline_response {
+	/** @status: Status of the page offline request */
+	u32 status;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
 /**
  * struct xe_ras_get_health_request - Request structure for obtaining gpu health
  */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index d0341538ad05..3363f48da2b7 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -26,6 +26,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
  */
@@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
</pre>
    </blockquote>
  </body>
</html>

--------------if3MC01eUyHM9gCt1BCNyua1--
