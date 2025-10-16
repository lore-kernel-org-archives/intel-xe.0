Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18A2CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 13:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AFF10E9E7;
	Thu, 16 Oct 2025 13:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByyN90co";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E312D10E9E7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760623102; x=1792159102;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TLCQWaHUqE8uYL5b0TZsUaQKGRwY8VF5YuuylrZij9A=;
 b=ByyN90coZ/KEe44omllaM541239373WLBZvFhnOsUfvsy4vopL/9cGk0
 sIkqhOpFIHbgow6AgCWRTVg40dSKRNppThilLifje8IgJCd3g1gAuTz2r
 Sr4KdkCUkjOVK/XDdZ6HIZ8yDnebSLQGtNZsgEe9u3pOeaBkTgAVBv3jN
 4U5Gfbq+9a4odg3Hv+zonlSozRIJhIBmkRgOfINnV21ZFDZonndaJ41f3
 j4RR3mr9iFf1BNNwb0hm01hFkzdk/4RM+W3hsSHfJ5ixKxMUHGobhiyKx
 VC1wGvQIAYJXK9xwe+3BSvC6DWHaKQULCBmTQo3wQeD8o/wx8G2+TKEEs Q==;
X-CSE-ConnectionGUID: EbgksGMiRjCy39GwY10qvg==
X-CSE-MsgGUID: fYonU+HYQEWpITvm9rAQSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66646017"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66646017"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 06:58:22 -0700
X-CSE-ConnectionGUID: gFX0sEb2QDy+D4ZSVkHeLg==
X-CSE-MsgGUID: SO9EXGJ7S82FrV5nk7pGng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186473617"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 06:58:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 06:58:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 06:58:18 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 06:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukMIrtxLk+ssSMNRGMc1Qg1Gb4LYL9k8SSeA6Z+FUxMfqednLMCyn3jYa1f2r/Gdr2MeiXt3D9lRAwsbZx+nyw0hMhUN2uKOKv71+JdhYOzZaXEq/cR7BmYDwujZL/cOSVjrcUBhWhf0xO8ChAE9ILNG+OzDCSLvJGjR7JcrnYrlR555V09FAbPCQlYzAY6PVYTTCQprMxbNmjGUNmpse4MtMMv0my17vlRWpLYu7CsgTDB3pKwaz7aZ2BqthCeS4kQPpbV04mlFGTOYrOY6UL+R4jIzCXvoYPMMY80Y35XEDgU51C/eWHYtSh6kxscclZEuEblkOaevlh9yp+nwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTh6yy/PcsSOr7mCDlp9t+nam+sa9hxJY/NUSLKq36M=;
 b=GRWiCzymSs4J+XhA4aPwMEtwuXPvMIocbbYQEnJIWMfMS5X8qkja45soAahwkD3FVOcFcOFTv6agQUdu/vsWSAQbUWQjJpvBqOZ1h2UqRscp3GidkexDV31KmA6mbjSLVgkC98v3fcxJjUI3KFm2H2RrlFx0OW/R+AEEBHO9t9nvB1pPEcYvhZ8TL+vapeA3eVBhLesI2IeJbZDBL3Me/2OIyoebCXEM61K9TdbPQGNi0DTVoOvWbzPUkws++8c0XlcMynqlPMpw5XtjPwDGIOreyDLvgIlzpgpIas6BPKkgGAr6+TBAlIp8DiAq2bZb1azW3wwaIJSxPHgkiq9PYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 16 Oct
 2025 13:58:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 13:58:16 +0000
Message-ID: <0a140f0a-d3a4-45a5-bceb-556977a41e08@intel.com>
Date: Thu, 16 Oct 2025 15:58:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] drm/xe: Improve xe_gt_sriov_pf_config GGTT
 handling
To: Maarten Lankhorst <dev@lankhorst.se>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-20-dev@lankhorst.se>
 <aPAahQy4TpYsFV2S@lstrano-desk.jf.intel.com>
 <cc2f7495-4014-4402-b22a-0402ea1b195c@intel.com>
 <b339cd35-c7f1-4d8e-8bbb-ebf57b15cc98@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <b339cd35-c7f1-4d8e-8bbb-ebf57b15cc98@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL1PR11MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: 8406ae07-e2df-48c1-190e-08de0cbc0e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2tsYmJremt1dEIvdFFSMCtUcVFTU3lZVTFnb2ZIblJPVHNiM01pU0VTUDht?=
 =?utf-8?B?L0gzblZBTFd2R0ZkNjhFUVl3YnVySjNQRDVEMk9ZTzlCejBQa3ZaV3BYbDh4?=
 =?utf-8?B?SkJvc0VGNE1LTnJXQ3N5N0ExMi96bFpNZERYY2svZThtNGsvSUtaTm11WjRm?=
 =?utf-8?B?ZW9pQnUxcHJXdXQ5WHlmR0o0SVRYZDdycEcrZnp6SUZzSnRpOSt5bDg4S1VQ?=
 =?utf-8?B?RVBWdVdrLzYxYnJzdGZiNGJ6YU1xdHZUWnhTZG1xczhySFdId0J3MVVBS0gw?=
 =?utf-8?B?MHdDL01UK0FHOEc5aWgzV2lKNHJlZjZnUitYbGovKy9oUTE1TC93ZzY2RXQ5?=
 =?utf-8?B?UkhrK3ArY0tYV3VEc2t1Nm5BRFlrZFJ0WTM3OUJjMlBWR0JjdEw1M05sSjlT?=
 =?utf-8?B?VFE5QlEvUFRaQms2QzVlUzdTWG56MFFsTXBJcE9iNUFVeVVsV0lJVWdzOXRF?=
 =?utf-8?B?VlRqRVVXeEtuSytFVjJXU1g1UTF1UkxSaHZhYmZJeEZ4RXFIQThGZUFUU1U0?=
 =?utf-8?B?eTJMd1RldGRSYmt3YUtXNUtUbXVXMHRYblNGQWcrK0I5ancvS1l5VHlxbm1o?=
 =?utf-8?B?T3FJd2NzSExwcVJWWnhLL1UvT01ybnROQVhhNk5CVEN0MlZXbnJDUktJdzRt?=
 =?utf-8?B?Zlg2eW5OUWJTN0FBRzE2Unp0anRvVVlMVUxDdUZTMGJpUWNiYnRzYlZjWlVO?=
 =?utf-8?B?WnM3NVpqZ240WkV5QXBWZ1IraWZNcVMrdFpyZGxZWmZOck8vczI4Nm9zL2I4?=
 =?utf-8?B?dVVGeDdxMHBDSXVhWGhiaERrWmlhT0U1Sng0THlKamtiNU1hSnJZU0dGQmh4?=
 =?utf-8?B?RHFEOEk0d0JRWkgraWhYQlNxOEZzQ210bUx6N3VWcWhBSEJOOGtxSkNsNUNl?=
 =?utf-8?B?RVZ4RTAxaVM3bUcvZ2luRWVuYWg0VWk3MGx1MDJ3MS8rUTBpcUs3RHNNVXlC?=
 =?utf-8?B?d2d1TkRmQW9WVUZDVSs0aHMwYmZEK2szU3dGdTRqRWNacGNpT1pyZVZ1VEgv?=
 =?utf-8?B?Y1NPNThQcUlkcGs3bDUwNHo5OWJidk9GOWcrQ014dFJvWjFwd2Z0U3I2WERO?=
 =?utf-8?B?U3FHM0VQSFlRNlVkZzBDUkt2eGVuMVBXM01keWhpYkVZc0QwTTBuaUQxaDUr?=
 =?utf-8?B?RWpJdStodUJ4TzZPeFdDeUsxMFFPOTRKNXFjN0F5Q0o5ZFNNbTA3aUtVZk8z?=
 =?utf-8?B?bDJuUFgyZDhscVZTdDI2bjM3OGJpVG4zQTdVRGpzL1Q2QitQdHFHVHNPVzRV?=
 =?utf-8?B?YWszb0pDbmlVcUJ0cCtRVW42a1dyc2N3WnpkVlRCQzJYWXZWQkg2QWFvaHVF?=
 =?utf-8?B?V2Z1bFEvaVkzT3NiOGZmNGIyVmF2b1Q1N2dnaU84NE1qTDh3WkJkdTlnMG5o?=
 =?utf-8?B?TzQwenZQVzlmbXc5dDFmL0RHQktQSm1MdGFnVkFocE9FMExlOUZNZkhLb3FX?=
 =?utf-8?B?VTZVaWxCSFMyU2daTzVxbVAydlFYdFViSStwdW1GQmRBbXFCL0xETHJWekky?=
 =?utf-8?B?cEMzbVNtY0dIbUhLMWl3NGdQOGN4cHpXUDF0anNaak9hRStNa2IwS1Y3UHd1?=
 =?utf-8?B?NEpkbnFhYkVqQVBtZTNsYnpWTlRMTU9hdXZtVnUrT2lQcFVkcmdEdE5OWHR0?=
 =?utf-8?B?b2QwUFdEYzJ3WlNwSWIzc0dVM0hZa1h6RkRQNUl6VEUzMXVDb0F6bm1Xb0JR?=
 =?utf-8?B?b3MvM2tnQnRPWWMvQUcyZVhYMS84RkhQZkpFSW0zZC9ZOHJaMTF6bTFwdk1C?=
 =?utf-8?B?QmQ2NTRLSmFvbGFVZzgveGRTOHlLTnZ1MHg1L00rRWpVZUxwNEdRL3A4YUxE?=
 =?utf-8?B?U0d4SW5wbEk2OStVWTJ2Y0pGQzFteUdpM3hwbXcvWDhlRGszWDZObWNxSWJl?=
 =?utf-8?B?MEgyTFdiZnFrOHVWS0NMZU5WaXJ0MHZ6L0FRYjBTZEw5aXNlMmsyaDQ2OGNy?=
 =?utf-8?Q?kxzxEdQXkPSpDeDjZtxzLwHSySIDgfZ7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDNxMEIxdy9KSkhlUytCN1l6V2RERkFHSUg0dExyMzhhSURrVlZ2VjZ4QjlI?=
 =?utf-8?B?eVpIOEV1eW80ZTdheTY1STR4L2QydHdyckttVjA2N0x2L3BPN3IzWjZLZDFG?=
 =?utf-8?B?M0FPMW11ZXMwN0xrVmpuemQ2NktwL0tmWUdnRDFtSHlLNzMxNmsxckdEMFVN?=
 =?utf-8?B?Y1RrOXY1aTJBN1BxODhMY1BRdVh2UGFvd1g1SWRvcnNlcWRiS3lOTFczQzRp?=
 =?utf-8?B?b1g2SUdUSUtKaC9NQmNRT2s3bkdVaWh2RnEzSGduUlJuN2RNeFFNaHJBcy9w?=
 =?utf-8?B?ODlIOE42YzV0bUQ4QTdCUEZBV0piLzYxY1NxZTdzMzBFdTVMaHNCUnd3bk9z?=
 =?utf-8?B?Njd0aGFqUmU4a3Fyd1dlRjEvbDNJSFM1bE1jRkNsaTBNSFI1Ynp1TnQ2MlFq?=
 =?utf-8?B?NnN0MWx0enpOWHMwOUZCSGtVbmxib1A3UlNPY0c5dEUxZGI0S3p3VEtmeEsr?=
 =?utf-8?B?ZG00Qk0xRld5Z0pvR3A5ZzZHb21UanFFejFseG5JeDNMcDRFZUU0eEFScVFK?=
 =?utf-8?B?UThzeUIxeEcrMUxVVldBQ2NPcERLRk9ZTWhTVUpid1JFR2ovaW1saXpieUow?=
 =?utf-8?B?d2syUVkzNXEyMkt0RHdBYzQ5cTRzL0ZJU253bXZSaWhqb1dObkZEOTNPak1D?=
 =?utf-8?B?RGkrcnZwZFVRdUxxbkFJdWUyaktxUGVGK1hUVklwTUJPYXM1cHlkM2ZDcjBX?=
 =?utf-8?B?czlNRnFPM1gzMDdQM3A2SFlHdnhsZGhkL1NJRzZvVjEzY09jOFNEeDRlZ3NM?=
 =?utf-8?B?MGdEeTkva2JGcjh5V0g4U2YrTzNWVG9HTlVRSFh2Zkd5YWMvREVic1l4MGRQ?=
 =?utf-8?B?T2NPd1I3dHRWbGRBWURqR1pKY0swYnRsdjduYldxaEx6cWdJUDV5S21yMG9C?=
 =?utf-8?B?a3RuVE1SeFFKbndJdmdTV01LMDQwdS9NSkdSZjRhdm0wRTBKSUVocFZ2czlE?=
 =?utf-8?B?NzVQY0ZsbG9WSG50dStlWldNTlZjU3pJVlE4bUE3b3Y5a2lKQUovZzBRL0RT?=
 =?utf-8?B?cnJkMVVCOWowS3kvNlo2dWNMUVFtN3pRaG5icDZyS2R0VU5UQ3ExQnc3amd4?=
 =?utf-8?B?aWZiYXE3b0czbTZlZFpTNUFKZm1GdWtpbVBycEdPbE9hclEvSG9BbmpjdTU2?=
 =?utf-8?B?NzZhcVBydldQS0xhMy9RZ01qQ3VLS0JpZVJ0TVIxdGF6R1BnckFDZHV0NitN?=
 =?utf-8?B?aE5zYjUyc1NFN0IxY0J2OE5ZRW9yUVptOW5YNmd6b0hXTmtjcXpFamlFd1di?=
 =?utf-8?B?MStTMGNTajlUQ2xIeTQ4Z1NUY1NCK0RBVWZJL2hRVDBVTmhYTkNLUEdpaGRn?=
 =?utf-8?B?eU9PTkVGWnl4bi9sSDNvUXBKTEVjNXZwZHpGcU1LaytHMVgzc01hZWx6Tmp6?=
 =?utf-8?B?TkV6SU95bmE5RlVHU0hGa2kxTGdhNzJLbTg1eU9ZUVg2Ym56cnZJbzhoRHNH?=
 =?utf-8?B?M1dEd2xMODJaWHlEZW1kd2lacHZiNzd0ejA5Z3hYUjVDbWNCUmRxbmFocmM3?=
 =?utf-8?B?bnJDeUIyNmQrUnJqdVlvYytwWUd4c0ZIYXBvOEJsWGZPaUpZRnFscEZZeU1L?=
 =?utf-8?B?aWhLc0hGR0JkNVNnRmdBVVloWGVhMlhlTnd5cXhoMG82cTFMR0pMY2FNR1Fm?=
 =?utf-8?B?M253ekxpdlNBcnluTnU3dXVQR01Wd0VISVFYOEpOV0g4Z25nS3hLS2pSekVl?=
 =?utf-8?B?bU1ZYlQ3dUlmNVFwbk0rekd6UEgyRnI2cktzWm1GL0NjTEpuN3B1VWUvenVL?=
 =?utf-8?B?YUVCTm1SNjVnUno1V3Z2U0l5OEpPZFdUZUFwUlQwNlhxOEFwZUxidmk4aE56?=
 =?utf-8?B?Qmp1cXlnRUhUemxWSW42aUZ6VkxSVXNKOXFFYmNzVTJqMGowSStXL0Q4My8w?=
 =?utf-8?B?Y3NWQVpSS2xYdDlvOGE2dmhuQkVwVW9CR0d3ZXYvVVVXRi9GSHFoZjFLcGts?=
 =?utf-8?B?TGx5b2ExS2RNWFY4NnQ5eW43RHgycjVyL1RvbTVmVWFoMEJ5S004THBZOXZ4?=
 =?utf-8?B?Mk5qVis4K1pIWFdFYmtwVXhCYlFrTXZHSDB3Nm94Ty8wN3Rka25wVW1ld1Fq?=
 =?utf-8?B?b01ZREZLR0Z2ZkRBc2YwY3MzbHdZdm4zNElqWnl6bmp2N2ljQXdFeVZKbzFl?=
 =?utf-8?B?bUtIMmdRd0tncDQvVEJYaVFRRzBIdDJqY2IrZ2hXVjJ5eFZxTTl4dEFna1Ez?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8406ae07-e2df-48c1-190e-08de0cbc0e1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 13:58:16.6154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dR4vUpzkocJVuwi/8adw9Iuezj+ik2Tb4m5XGHl+dtosemQcQlohbxqJ3XnA7dY0IlqtexmrAJP50+tSci6A+HGVUWeRjOhtz//PBoXixls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
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



On 10/16/2025 3:46 PM, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2025-10-16 kl. 10:50, skrev Michal Wajdeczko:
>>
>>
>> On 10/16/2025 12:04 AM, Matthew Brost wrote:
>>> On Wed, Oct 15, 2025 at 09:47:15AM +0200, Maarten Lankhorst wrote:
>>>> Do not directly dereference xe_ggtt_node, and add
>>>> a member to store the GGTT size.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c       | 15 ++++++++-------
>>>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h |  8 ++++++--
>>>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>>> index 2289756761636..c0dfffd5c553b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>>>> @@ -264,7 +264,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>>>>  	if (!xe_ggtt_node_allocated(node))
>>>>  		return 0;
>>>>  
>>>> -	return encode_ggtt(cfg, node->base.start, node->base.size, details);
>>>> +	return encode_ggtt(cfg, xe_ggtt_node_addr(node), config->ggtt_size, details);
>>>>  }
>>>>  
>>>>  /* Return: number of configuration dwords written */
>>>> @@ -495,13 +495,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>>>>  
>>>>  	xe_ggtt_assign(node, vfid);
>>>>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
>>>> -				vfid, node->base.start, node->base.start + node->base.size - 1);
>>>> +				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
>>>>  
>>>> -	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
>>>> +	err = pf_distribute_config_ggtt(gt->tile, vfid, xe_ggtt_node_addr(node), size);
>>>>  	if (unlikely(err))
>>>>  		goto err;
>>>>  
>>>>  	config->ggtt_region = node;
>>>> +	config->ggtt_size = size;
>>>>  	return 0;
>>>>  err:
>>>>  	pf_release_ggtt(tile, node);
>>>> @@ -514,7 +515,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>>>>  	struct xe_ggtt_node *node = config->ggtt_region;
>>>>  
>>>>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>>>> -	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
>>>> +	return xe_ggtt_node_allocated(node) ? config->ggtt_size : 0;
>>>>  }
>>>>  
>>>>  /**
>>>> @@ -2516,11 +2517,11 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>>>>  		if (!xe_ggtt_node_allocated(config->ggtt_region))
>>>>  			continue;
>>>>  
>>>> -		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
>>>> +		string_get_size(config->ggtt_size, 1, STRING_UNITS_2,
>>>>  				buf, sizeof(buf));
>>>>  		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
>>>> -			   n, config->ggtt_region->base.start,
>>>> -			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
>>>> +			   n, xe_ggtt_node_addr(config->ggtt_region),
>>>> +			   xe_ggtt_node_addr(config->ggtt_region) + config->ggtt_size - 1,
>>>>  			   buf);
>>>>  	}
>>>>  
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>>>> index 686c7b3b6d7a5..9a8e66c8b539f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
>>>> @@ -17,10 +17,14 @@ struct xe_bo;
>>>>   * Used by the PF driver to maintain per-VF provisioning data.
>>>>   */
>>>>  struct xe_gt_sriov_config {
>>>> -	/** @ggtt_region: GGTT region assigned to the VF. */
>>>> -	struct xe_ggtt_node *ggtt_region;
>>>>  	/** @lmem_obj: LMEM allocation for use by the VF. */
>>>>  	struct xe_bo *lmem_obj;
>>>> +
>>>> +	/** @ggtt_region: GGTT region assigned to the VF. */
>>>> +	struct xe_ggtt_node *ggtt_region;
>>>> +	/** @ggtt_size: Size of GGTT region */
>>>> +	u64 ggtt_size;
>>>
>>> Nit: Couldn't we have a helper to dervive the size from the
>>> xe_ggtt_node to avoid storing the ggtt_size explicitly?
>>
>> +1 (as already commented)
>>
>>>
>>>> +
>>>
>>> Longterm we should likely move the PF GGTT config to a per-tile
>>> structure like we did for the VF GGTT config. IMO we can do that in
>>> follow up. Maybe ping Michal for his thoughts here.
>>
>> I have almost finished series with GGTT/LMEM changes, but switched to
>> higher priority task (provisioning over sysfs), hopefully will be able
>> to return to this topic soon
>>
>>>
>>> Anyways, this looks like a good cleanup for the existing code structure.
>>>
>>> With that:
>>> Reviewed-by: <Matthew.brost@intel.com> 
> 
> All other users of xe_ggtt_node are not using the size member, would it

because they don't interact with GGTT directly, and they can get the size
from the xe_bo itself

while in case of the PF, there is no BOs for those "allocations"
that's why PF directly uses xe_ggtt_node_insert() that doesn't take xe_bo*

> be too terrible to maintain it in a separate member for SRIOV PF
> provisioning, instead of exposing it too?

but why forcing the PF to cache something that the node already has (for free)

> 
> Seems to me that the size of the ggtt_node is a detail, that we just
> happened to expose and use in xe_sriov_pf_config. If necessary I can
> keep maintaining that API, but it feels cleaner not to here.

exposing oneline function shouldn't be a huge maintenance cost IMO

> 
> Kind regards,
> ~Maarten Lankhorst

