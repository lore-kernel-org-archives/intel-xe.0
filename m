Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F97CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 20:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AFD10EADC;
	Thu,  4 Sep 2025 20:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcb1lotG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A296F10EADC
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 20:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757018748; x=1788554748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FmIXrSbAXUai2zDytG5zHs01IMzfGf6J7+gv6/j7J5M=;
 b=gcb1lotGDaTD1q7Mn++JmVY4/0wH23RSQ0s5Tnp9yU2VhgWrU4uq1Mhl
 An3Uj+FbL039RT6/R/m6QyXs/PUJ9h81FKreJAmvD/7RM+Zi3ttOQOawn
 OGgs+dr1cCfUp70WT8tXyaJuTxHJkftiy7K8Du6yZoI+rZUzcaUDjxshs
 72qty6guPcFeEp+sfN7rjNZmqpQUOmL/+b3UYlkMrzrCPESOKyqw6kiv7
 bsyolIFxYzmlStIAaAZIlm0EIYH7IzkOZ6aQLbLnjH5283EM+DHcGYSmG
 GHN2SqKU73rHZd1sp3QSEqhUMZepvNGmgwbmrmJqfPTcssITewVNYern8 Q==;
X-CSE-ConnectionGUID: P7blj8ecQPqrXkG5bU5+Uw==
X-CSE-MsgGUID: YqTxSbH7Rq2ysgx5BLKxyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="58407738"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="58407738"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:45:48 -0700
X-CSE-ConnectionGUID: 1QNl8pUkTq2QLQLRXCWAMw==
X-CSE-MsgGUID: LE/LBrW7QpS+4W4NYonK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="172433053"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:45:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:45:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 13:45:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:45:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWrMlw0h/OUqxAEH/2V77qcfZkyfh4dGDFLfY3FlJDcwGA+Rlnor+KdIVh5PXIXS8tIONJ9MzFtpRuP2BS5PFmMlmvuGEZkULsLjNZuDJ1S9HWgmw/TDCaGrnsYZJLdtFccp6TmlRRkM55QyziyqoNeHHjm6+YDD+Itk4Zo06p47JfpIU0ogWjJgqvGpwc6HrnymVdDUw/Z1zNo7qYc4GPgyT5Fb2Gzz+pIXqTkC4poPrWYuRpLyTIb8IWQU9kU5UN26CorSD7IYEMRUnENi9bCV92GF+TY9/Ge18rQ3Bv0hmgPYibuITR4NikxRRIkzPgBVyts9ZqoQsP9d1BzCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOpj1oedmmrV5CePNTNzfx3E54AtrxEm65yqAGKgfCg=;
 b=bihSnJo3iwxF/T+40JOP8vw5oTkadSKG/JgFvr3HhUT55kgYyhdZ53uEgmdxvFLpXklhkkpMENdj4A/W8/0jJrKBhAtS6ma5BcqO9P56++b3ib8TIV1q+uvkBF7VV05UTbOHUj2zHP2MRDqfpEpcXvyOHXG/jt7U8rSuMPo5YwSB/xNnx8ppVXtYLMZ2U9/3xxKQi0enReUmUkJZS24DwyjMEREAk0xXIOgHBYCQ6PbjviwlzAQLlVNn3mqOdMUJrMy4JigbGKvlYDfCWNL23DuoHENFdU9+Emwni9vtTl4WKAeM6eKhkc5dTi5G5c9Bq21wHjrmFcHaiBJHCK9Vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by DS0PR11MB8668.namprd11.prod.outlook.com (2603:10b6:8:1b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 20:45:42 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 20:45:40 +0000
Message-ID: <fe1b455b-9917-4dec-8a16-94daa922263f@intel.com>
Date: Thu, 4 Sep 2025 13:45:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Fix error handling if PXP fails to start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250818234639.2965656-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250818234639.2965656-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0256.namprd04.prod.outlook.com
 (2603:10b6:303:88::21) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|DS0PR11MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: ac360a3f-4a67-440e-42e7-08ddebf40233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXlKOGtYL3BCWk5LQ0IvUWRndUhnbXNCVHFVNE5CSGtSRXVBb2R2ajVudkxE?=
 =?utf-8?B?S3F1WkZBcTk3QzIwaHFIMmIraFUwd01KUlRHL2pzVy9NNi9rZm9YVmZKb2cz?=
 =?utf-8?B?WDBtZDlNUWNuMG5SQmQ2eStUN0tmclZoSmFnWjRaemFrZU1HVnZSM2JvUXZp?=
 =?utf-8?B?WGZtQWg2aG1GZFZ5cHVqZTlKSGJSTUwvYWN4MGhMOC9HNnh6ZXZ6dUM2RXhV?=
 =?utf-8?B?b3ZBRGFBTEllNENGN3FBRXRlNjI2di9sMUxEdWtHT1RvNVJmNnpDWTl2V0NU?=
 =?utf-8?B?SXJYUmVRSTZQK3EwK01BMmIvR1VuMkc4TitzSVIwaUdLSFJVZkxtbnlVRFdr?=
 =?utf-8?B?V2cydzVFY3Q1RktxaitQUUVYRjIvMTV5ek1FUDc4ZWFmRzJ0Z2h4TlZGM0RV?=
 =?utf-8?B?MGl6OWNkbkhzMzZESG1iWERFMi9uaHIrK2ZNbkhtamMzRTFnZTYxbVJValNN?=
 =?utf-8?B?OEIzRGhnQ1FlNFZzYXA1Wkt1NUdUWDBaZVF3K0ZuN1ljbWlQdW9DRU5wVkxT?=
 =?utf-8?B?YUJyNUNvYWxJN0lJMGlDY2FGaVhlcU82OTFidnpsMjJ5TFRWQlJQSE9IdjBG?=
 =?utf-8?B?QUdVb1RsTTRITzYyYXRSeUdoMGdGcDRMTkJCQVhUMGRmaitrbXcxb2c0S3hZ?=
 =?utf-8?B?Y3duWWxGb1MvSHh5bmlGSDJ0a0VROC9pQU9BSytsQzhSWlVpcXNTNTIvc24v?=
 =?utf-8?B?S2VhaHMxYXpPcERpSFE2RVJJemhieWJKamltWSt2QUh6bnZSeWlaL3dFTENk?=
 =?utf-8?B?Y3VsZ0NRVGJhczBnaVJBTlZJOGVaTXNuQ2pyZzh5MDBkeFltb29WejRaZGp2?=
 =?utf-8?B?Vjl4bzZ5NjF1L3ArNFNVbE9xSDVYVzF1MWd2UEJiY1RsazcrYll3MjZKTGdJ?=
 =?utf-8?B?VHF0Y1RjNFV2NHQ3STU0OUtsYWRNS0ZvMXJQcHVrWURiRksvZGdrYVZGU2xh?=
 =?utf-8?B?Q051SWhmR0lEejlUZThrQVJ0T1lHZXROc1JPRnhPaE1Wc3ErWk9jLzkwVDJs?=
 =?utf-8?B?QTNLUE8rNTZFUGtpSjd5VHBiZ1R3YmNKNlduWHEzNG9HajJtbTI4RnJHaEZI?=
 =?utf-8?B?TkpYdlkvT1d0NEZXa0JMSCtnN01ISW42ZzVTZnV5ZmtUVVBQR3VJMXBnWjJ5?=
 =?utf-8?B?UGZySWwxci9VUHp4MFlPWDlMbjV3aTJtWVU1NytDWnBKYVZEMEs5VXY0MDAy?=
 =?utf-8?B?L1Mrb1ZXOWRYbWM4bk8xOFMwNE1Fanh1T2kybzdGZ3gybUtiOGJZMUlTS1VY?=
 =?utf-8?B?NmdOTUxOU0UxTzR3eFNFTXJta2kvVGJrYlpsaGg4NVVycDRBQ3ZZdDhnNG5B?=
 =?utf-8?B?U2w1bWsvOHFva2c0L0NSWDB5c0Nxek9nTnFKTjZhK1I2dzJhTGoxYmpZSnN4?=
 =?utf-8?B?NStDRTVadW56dklVbUs5Y2Q3RnNYUkFVelFvYXZuQ0FsZkZaUXcvV1psOEcr?=
 =?utf-8?B?Nm9aaFUzaWg1ckN6WXVwUkdZQ2FSZzhldnF0YjJoLzNDUmFmd2tqdnRLaWl1?=
 =?utf-8?B?ZENUZEFHSlJ3T1ZKZ1dNTitpRHAzdngwMGhmNHdIMWJXTjQ3ODNWOEtXcFFZ?=
 =?utf-8?B?Snh0NXBiUzk2SHkydlhHd0xoM2xYaENxVG56aS9taVE2NkZURTBBRGhseXRu?=
 =?utf-8?B?bnRWYlZHWHYycTltaGwwbzVQU21mM1hjRG9FTXlQOVdPRFlCRG5aRWRLeXR5?=
 =?utf-8?B?UFIyWkR0alNtMFJ5Vy8wN1VUOGt1M0NRbkVPYlB3aVZXSWhLTGgrVkxuV1g5?=
 =?utf-8?B?U1FQMnI4V0s0VHpRWVdRUlpyQTkxMzdQZG5LdFF0QXhVaXo5aTZ0bEZiV3N3?=
 =?utf-8?B?Rmd2bE9OUGZsNlR3UWRmbWJOaUpVNmxlNjhoZHNpdHJDSzYxcFpwcE1YdkdM?=
 =?utf-8?B?WXphYUtKUmlyNkJxK1Flb3pVYmlzMlUvM2NiWUZGVFRURUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRwRE5HTStVa2NxcUpIWk5zZ3dYWFVJY2ZhZ0RzQnIrVTFYNnVwOEowQ1Bw?=
 =?utf-8?B?UmNSMFpmUHRITG5QM1JXcnFHK3VsTU8yRWZPbDI2WHhoWkVDdGo1MWZMZ25n?=
 =?utf-8?B?dExFWC9xRWE3M04rT21FdzFtM09URXpOa0U2d0hCTWNHQ29SNUc0Rm0wNUVt?=
 =?utf-8?B?NW1GRnZLbGlnWEZLOStlKzRsZzl6Uk9UM29CSHlubzBFSTNHSFRGeGpFNld3?=
 =?utf-8?B?Q3RKc0dxRXdBNzdCajJLUUo5VVQ3bGpheHkvNjYzQjJLMXEzcEhuL3NzYXlm?=
 =?utf-8?B?c08yUis3RDRoNTB0UlhkRnhNU2xyMmw0cG1rc05BU2tUUkpNR013MnBaOS9N?=
 =?utf-8?B?c25rZ0tuSDFlRERudFR6bWVRQ0NOVVoyVWdJclhFWWkrQlBBWGtVdThEL0Fk?=
 =?utf-8?B?YUoyRngvN3A3allqZkVRTFNGTzZiNEQ5c28yaDhoZUh5bm5GNDM3SnlYWWFH?=
 =?utf-8?B?aUxoNlQ4U3pjVCsvQ0IybWdXREdWQ1hpMWIzNlNrNzdsY3Y0OVVNMU5ucnZt?=
 =?utf-8?B?NWJTT0d3K0NUc3NRb1VwR1lPZU05MWpiNlNmd2FqbFRCN2N3RmNhUEpQb2Nt?=
 =?utf-8?B?V0Nkb0JsaXVhUGtwbzUwK3dPS2crbDFQMnpCOHZqZmoyVnVNNVRXYTZhdkIv?=
 =?utf-8?B?S3MwbjlDOTlpWG5rcVdDVVFVMGl4K2xJVUFYY0FZMldYcTk1RktnS3oxM1Ew?=
 =?utf-8?B?TTB2WTlUM2haM1l4NlZmL0paWXplQ1JwbW5SWDhEdnVTckg0RC9vQ1E3eTkw?=
 =?utf-8?B?ekZxTUlHRDArV0JJSUx6NHlBS2xNWEMrK29kS2ZDOGJNR0pvOGMzcDhVWktr?=
 =?utf-8?B?ZFZZdUo0SlpONWZ6L2s0MThsOW5hK0F1dDlnYThIMm1KOVJyRVQxK3IyNW1i?=
 =?utf-8?B?SU93MTlWMUVlVklUYUZFQWxxWk1zdjY1WFBlWUNOWWxYNUZNL0c2elI4bEha?=
 =?utf-8?B?aExjTEZDaUttdnhhVHREb3pIUWRiUjZGemkza1BWeHJING1FYjlBRXdZdVRw?=
 =?utf-8?B?L0FBdWRIaXNsK0NBZ1hLZnQ2T2lyekRqWnJpb0pxTDdOdWw4TGlNK2cwNzkv?=
 =?utf-8?B?MXhRMUF4bkdwSnBoOTFqRWNjUmRzZFlQdlFJSzZzbzZaWEpmTDFma3NHVU4v?=
 =?utf-8?B?aVk2SFUxbTVnQ3FscDBGTlNzbHRRT0JCdnNuUkNPbGRRMVB0QWg3OWJRbTlU?=
 =?utf-8?B?bkNXTjVBdUJZck8vbksxc3lxTkN2VGhROUZ2azdRMjRhYWdwWk14L1NvYlhV?=
 =?utf-8?B?RTRnNi9kVllad1BBRnBHMnRhRXJxdVptR09jd1ZCOUIxY1pORjdPcENjWXo0?=
 =?utf-8?B?c0t4WGxXOGM3UjBVS21sNGJjSUR3V2txTjJMN05FVjFQbXY1Q0crU3pQRTJo?=
 =?utf-8?B?bXpKdEx5elVsQVFzL3Iwd3JJdDYzOTJFNEI2VVo1QWRvUmEwdVZaUTJQQThX?=
 =?utf-8?B?dlFQVGhydVZYVkxtVUo1S2VaWXIzNVREUEJDZTNsQzdYSEhzV2YwVXlYMG5O?=
 =?utf-8?B?aU1VS0tDUmpoKzJvem5BME94WTdNaEVjTUpadHA5eVlvbzhKTmx2dWFrbnFo?=
 =?utf-8?B?clExYk5VMzJKRUQ4Y3Arb3ROZmZrU2ZyUllVQ3FyUEYwWUFrRU04OHhMQW8z?=
 =?utf-8?B?emRpc0p4TktwQ245OGF0eGU5WG1qeTFkVksyYW8rRnZXTnJ1ZXF4UG16OS9X?=
 =?utf-8?B?cEY5a2JveFhkWXBPeEhCeWxCWkUrM0E3VGUreWllN2JPYkFjVFZ0OGtadnNw?=
 =?utf-8?B?SnJRY1JLYjlhcDErQUhRd3FUT2tiMlRCcy9vb3N3WEttZjY1WHJUc09PczFG?=
 =?utf-8?B?VmZ6eFRtYXdSWkhXd2FxV0xXVlpDWnh5RUI2RWpJazRyRjY1QXNUK0pxK0pV?=
 =?utf-8?B?SWJrRm5Eam44RUQ2d0hFK3kwTmYwdGJGbXhNZTAxR205N04xbWxpNHh4NDdl?=
 =?utf-8?B?TllEZm1DU2hvYUdiSjRaZlBhRU5zNElIUVRCOHZlL3pKcGhzNGd5SUVORWNR?=
 =?utf-8?B?Qk9BcWVPbWMyT3M0ZVBFR3gyT24xVTFGOUlKWW5GanVmejU4VWMwaXVESmRO?=
 =?utf-8?B?cUdBcEdPeGFSdVo1WnJJcFJLV3F5SDZqSmVFTWF1RFFOdkI3RnRDUDRPeGc1?=
 =?utf-8?B?NHdzNTFtSmtmV3FMa3NKN2Vtak4xb2JDdXVFdnpNWXR3eGhYNy9Ic2diNWp3?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac360a3f-4a67-440e-42e7-08ddebf40233
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:45:39.9310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9QupBrltWvwyDJ3XMOyYzaKTEFVlJXjj1zmQg1GHgMaJGt+4U73a2lyR3i5XjVnxtgldGXhEkCttqPvE/1bAEJOQutHHLenYz+JiT55kVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8668
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

On 8/18/2025 4:46 PM, Daniele Ceraolo Spurio wrote:
> Since the PXP start comes after __xe_exec_queue_init() has completed,
> we need to cleanup what was done in that function in case of a PXP
> start error.
> __xe_exec_queue_init calls the submission backend init() function,
> so we need to introduce an opposite for that. Unfortunately, while
> we already have a fini() function pointer, it is does perform other
it is does?

> operations in addition to cleaning up what was done by the init().
> Therefore, for clarity, the existing fini() has been renamed to
> destroy(), while a new fini() has been added to only clean up what was
> done by the init(), with the latter being called by the former (via
> xe_exec_queue_fini).
It would be much easier to follow the changes if the rename was split 
into a prep patch and then the behaviour change patch was just the 
behaviour change.

John.

>
> Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c           | 24 ++++++---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h     |  8 ++-
>   drivers/gpu/drm/xe/xe_execlist.c             | 25 ++++++----
>   drivers/gpu/drm/xe/xe_execlist_types.h       |  2 +-
>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  4 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c           | 52 ++++++++++++--------
>   6 files changed, 74 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2d10a53f701d..bce507c49517 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -199,6 +199,18 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   	return err;
>   }
>   
> +static void __xe_exec_queue_fini(struct xe_exec_queue *q)
> +{
> +	int i;
> +
> +	q->ops->fini(q);
> +
> +	for (i = 0; i < q->width; ++i)
> +		xe_lrc_put(q->lrc[i]);
> +
> +	return;
> +}
> +
>   struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>   					   u32 logical_mask, u16 width,
>   					   struct xe_hw_engine *hwe, u32 flags,
> @@ -229,11 +241,13 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	if (xe_exec_queue_uses_pxp(q)) {
>   		err = xe_pxp_exec_queue_add(xe->pxp, q);
>   		if (err)
> -			goto err_post_alloc;
> +			goto err_post_init;
>   	}
>   
>   	return q;
>   
> +err_post_init:
> +	__xe_exec_queue_fini(q);
>   err_post_alloc:
>   	__xe_exec_queue_free(q);
>   	return ERR_PTR(err);
> @@ -331,13 +345,11 @@ void xe_exec_queue_destroy(struct kref *ref)
>   			xe_exec_queue_put(eq);
>   	}
>   
> -	q->ops->fini(q);
> +	q->ops->destroy(q);
>   }
>   
>   void xe_exec_queue_fini(struct xe_exec_queue *q)
>   {
> -	int i;
> -
>   	/*
>   	 * Before releasing our ref to lrc and xef, accumulate our run ticks
>   	 * and wakeup any waiters.
> @@ -346,9 +358,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>   	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>   		wake_up_var(&q->xef->exec_queue.pending_removal);
>   
> -	for (i = 0; i < q->width; ++i)
> -		xe_lrc_put(q->lrc[i]);
> -
> +	__xe_exec_queue_fini(q);
>   	__xe_exec_queue_free(q);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ba443a497b38..27b76cf9da89 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -181,8 +181,14 @@ struct xe_exec_queue_ops {
>   	int (*init)(struct xe_exec_queue *q);
>   	/** @kill: Kill inflight submissions for backend */
>   	void (*kill)(struct xe_exec_queue *q);
> -	/** @fini: Fini exec queue for submission backend */
> +	/** @fini: Undoes the init() for submission backend */
>   	void (*fini)(struct xe_exec_queue *q);
> +	/**
> +	 * @destroy: Destroy exec queue for submission backend. The backend
> +	 * function must call xe_exec_queue_fini() (which will in turn call the
> +	 * fini() backend function) to ensure the queue is properly cleaned up.
> +	 */
> +	void (*destroy)(struct xe_exec_queue *q);
>   	/** @set_priority: Set priority for exec queue */
>   	int (*set_priority)(struct xe_exec_queue *q,
>   			    enum xe_exec_queue_priority priority);
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 788f56b066b6..f83d421ac9d3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -385,10 +385,20 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   	return err;
>   }
>   
> -static void execlist_exec_queue_fini_async(struct work_struct *w)
> +static void execlist_exec_queue_fini(struct xe_exec_queue *q)
> +{
> +	struct xe_execlist_exec_queue *exl = q->execlist;
> +
> +	drm_sched_entity_fini(&exl->entity);
> +	drm_sched_fini(&exl->sched);
> +
> +	kfree(exl);
> +}
> +
> +static void execlist_exec_queue_destroy_async(struct work_struct *w)
>   {
>   	struct xe_execlist_exec_queue *ee =
> -		container_of(w, struct xe_execlist_exec_queue, fini_async);
> +		container_of(w, struct xe_execlist_exec_queue, destroy_async);
>   	struct xe_exec_queue *q = ee->q;
>   	struct xe_execlist_exec_queue *exl = q->execlist;
>   	struct xe_device *xe = gt_to_xe(q->gt);
> @@ -401,10 +411,6 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
>   		list_del(&exl->active_link);
>   	spin_unlock_irqrestore(&exl->port->lock, flags);
>   
> -	drm_sched_entity_fini(&exl->entity);
> -	drm_sched_fini(&exl->sched);
> -	kfree(exl);
> -
>   	xe_exec_queue_fini(q);
>   }
>   
> @@ -413,10 +419,10 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
>   	/* NIY */
>   }
>   
> -static void execlist_exec_queue_fini(struct xe_exec_queue *q)
> +static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
>   {
> -	INIT_WORK(&q->execlist->fini_async, execlist_exec_queue_fini_async);
> -	queue_work(system_unbound_wq, &q->execlist->fini_async);
> +	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
> +	queue_work(system_unbound_wq, &q->execlist->destroy_async);
>   }
>   
>   static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
> @@ -467,6 +473,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>   	.init = execlist_exec_queue_init,
>   	.kill = execlist_exec_queue_kill,
>   	.fini = execlist_exec_queue_fini,
> +	.destroy = execlist_exec_queue_destroy,
>   	.set_priority = execlist_exec_queue_set_priority,
>   	.set_timeslice = execlist_exec_queue_set_timeslice,
>   	.set_preempt_timeout = execlist_exec_queue_set_preempt_timeout,
> diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
> index 415140936f11..92c4ba52db0c 100644
> --- a/drivers/gpu/drm/xe/xe_execlist_types.h
> +++ b/drivers/gpu/drm/xe/xe_execlist_types.h
> @@ -42,7 +42,7 @@ struct xe_execlist_exec_queue {
>   
>   	bool has_run;
>   
> -	struct work_struct fini_async;
> +	struct work_struct destroy_async;
>   
>   	enum xe_exec_queue_priority active_priority;
>   	struct list_head active_link;
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index a3f421e2adc0..c30c0e3ccbbb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -35,8 +35,8 @@ struct xe_guc_exec_queue {
>   	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>   	/** @lr_tdr: long running TDR worker */
>   	struct work_struct lr_tdr;
> -	/** @fini_async: do final fini async from this worker */
> -	struct work_struct fini_async;
> +	/** @destroy_async: do final destroy async from this worker */
> +	struct work_struct destroy_async;
>   	/** @resume_time: time of last resume */
>   	u64 resume_time;
>   	/** @state: GuC specific state for this xe_exec_queue */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 860c07da598a..75208ea4d408 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1418,48 +1418,57 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	return DRM_GPU_SCHED_STAT_NO_HANG;
>   }
>   
> -static void __guc_exec_queue_fini_async(struct work_struct *w)
> +static void guc_exec_queue_fini(struct xe_exec_queue *q)
> +{
> +	struct xe_guc_exec_queue *ge = q->guc;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +
> +	release_guc_id(guc, q);
> +	xe_sched_entity_fini(&ge->entity);
> +	xe_sched_fini(&ge->sched);
> +
> +	/*
> +	 * RCU free due sched being exported via DRM scheduler fences
> +	 * (timeline name).
> +	 */
> +	kfree_rcu(ge, rcu);
> +}
> +
> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>   {
>   	struct xe_guc_exec_queue *ge =
> -		container_of(w, struct xe_guc_exec_queue, fini_async);
> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
>   	struct xe_exec_queue *q = ge->q;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   
>   	xe_pm_runtime_get(guc_to_xe(guc));
>   	trace_xe_exec_queue_destroy(q);
>   
> -	release_guc_id(guc, q);
>   	if (xe_exec_queue_is_lr(q))
>   		cancel_work_sync(&ge->lr_tdr);
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> -	xe_sched_entity_fini(&ge->entity);
> -	xe_sched_fini(&ge->sched);
>   
> -	/*
> -	 * RCU free due sched being exported via DRM scheduler fences
> -	 * (timeline name).
> -	 */
> -	kfree_rcu(ge, rcu);
>   	xe_exec_queue_fini(q);
> +
>   	xe_pm_runtime_put(guc_to_xe(guc));
>   }
>   
> -static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
>   
> -	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
> +	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>   
>   	/* We must block on kernel engines so slabs are empty on driver unload */
>   	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -		__guc_exec_queue_fini_async(&q->guc->fini_async);
> +		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
>   	else
> -		queue_work(xe->destroy_wq, &q->guc->fini_async);
> +		queue_work(xe->destroy_wq, &q->guc->destroy_async);
>   }
>   
> -static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
>   {
>   	/*
>   	 * Might be done from within the GPU scheduler, need to do async as we
> @@ -1468,7 +1477,7 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
>   	 * this we and don't really care when everything is fini'd, just that it
>   	 * is.
>   	 */
> -	guc_exec_queue_fini_async(q);
> +	guc_exec_queue_destroy_async(q);
>   }
>   
>   static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> @@ -1482,7 +1491,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>   	if (exec_queue_registered(q))
>   		disable_scheduling_deregister(guc, q);
>   	else
> -		__guc_exec_queue_fini(guc, q);
> +		__guc_exec_queue_destroy(guc, q);
>   }
>   
>   static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
> @@ -1715,14 +1724,14 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>   #define STATIC_MSG_CLEANUP	0
>   #define STATIC_MSG_SUSPEND	1
>   #define STATIC_MSG_RESUME	2
> -static void guc_exec_queue_fini(struct xe_exec_queue *q)
> +static void guc_exec_queue_destroy(struct xe_exec_queue *q)
>   {
>   	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>   
>   	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
>   		guc_exec_queue_add_msg(q, msg, CLEANUP);
>   	else
> -		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
> +		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
>   }
>   
>   static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
> @@ -1852,6 +1861,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>   	.init = guc_exec_queue_init,
>   	.kill = guc_exec_queue_kill,
>   	.fini = guc_exec_queue_fini,
> +	.destroy = guc_exec_queue_destroy,
>   	.set_priority = guc_exec_queue_set_priority,
>   	.set_timeslice = guc_exec_queue_set_timeslice,
>   	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> @@ -1873,7 +1883,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>   			xe_exec_queue_put(q);
>   		else if (exec_queue_destroyed(q))
> -			__guc_exec_queue_fini(guc, q);
> +			__guc_exec_queue_destroy(guc, q);
>   	}
>   	if (q->guc->suspend_pending) {
>   		set_exec_queue_suspended(q);
> @@ -2202,7 +2212,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>   	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>   		xe_exec_queue_put(q);
>   	else
> -		__guc_exec_queue_fini(guc, q);
> +		__guc_exec_queue_destroy(guc, q);
>   }
>   
>   int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)

