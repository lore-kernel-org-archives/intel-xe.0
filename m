Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A387DC27C6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 02:01:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5083110E94A;
	Thu, 13 Jun 2024 02:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOBslwVU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FB510E94A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 02:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718244060; x=1749780060;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0csi70X8WhxZ6mDU0heBqjNysEy0F+SeDOTCILlmfcA=;
 b=eOBslwVUEn+ETbjzcBzOpWCIhMBvKYRsQIFoDxwkKx0AKt3cmANX45jd
 +SA3imdmgWoXVrzRLLOsCSRkqH7wy0FkNBs2FslYuz21k9MpuvT/KL81W
 CkV5ivvsh+2rH/uhUPKxGjHz2Hw8qdLNZ7WODTONAr7YwyVUG68yvY0es
 pexeNAzZVxv+w92ajTqux9N45SW03gCLSuQ1VMfAtH8szUytOlSK4lymH
 pD2BPtecUjSFZmCsxH3Kyyeafk0qdn2RcMhu/JSl8bz5jXVh7Vwl29yhq
 UBqHPb9A38FzG31I4VFgFG9v2ZPqKIX6+X2wGY1cfmMNnGPZLU8RFUT/r A==;
X-CSE-ConnectionGUID: KqcrxUM4QUyHNy3s5x3sIQ==
X-CSE-MsgGUID: rNK/S8WUTcC/d0+JkAn8iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18862839"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18862839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 19:00:54 -0700
X-CSE-ConnectionGUID: l/HNk3nHS1eVEtduwYxhzA==
X-CSE-MsgGUID: TPfgRAOZQWGnAY0GwaYx8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39859785"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 19:00:54 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 19:00:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 19:00:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 19:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf0U/o7ykAyVym5TkGELF2LSb+sDRHPetxGb7TOEVf9B+vjwdGS9vC1ifRY/m9zahLjesFrn8m5A+H6nRh6s0TV0MCsCZGY6srRFEYnpLJdcv+kPo3zDafLLeH7djiOZCkEUrJvz/VezDYkPs7DW7/ZB5Hy13fpDQObER2hq4fAD+KTYroJmGQkBUNJ3Ijzzv4XykmCI2zzyqeU5ReiTdd5ULww2iNczoZk0vyCS4l1VzaUZ2DL69A+UqqA9ZZ4d5R9awgxnJM8A1TAdY8H5syt511etwgvuAKsFUZFyRVrSpK1B3tWKNnZyibSab/U+Yzg89FGMmlQ2cegiTulF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX2YN9+sqVv3stvBhoARvr4Hm8s0U/tG+RRpk+VKBwA=;
 b=NSISLlCQYXz0xhJq3yuH13pcxku0GIT6kJIpQUYQ+S5JXtqdFAIgILkGnRbjpikvH2pYkdbhPWHSg820JwraCIZc0BfcGJBm4fAYDY7V72000IYyKXzfeI+GQwjvi/B20JcDCgzH8wD7ZPVmTQvnD8dMhA7s2Yther2R3/4ARAdTJYabtuUlGp2v6s8Ym7+LJL2ytG/E+HGlTtlmrun+ZmoyJ3ccSUW7HICK03ngQ371SdlHHFGaddDi0Tfq397L8/OdQzuYpyrCY4vkJUn39Xk+1s2yJ8JBFAUOSfaFXVAhv0qjkzArfp/v4hodGrMvLt0SFWFJrZUikMiVVn/F6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 02:00:51 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 02:00:51 +0000
Message-ID: <fa2494da-79b0-43c9-b9c8-06bcb7075c9c@intel.com>
Date: Wed, 12 Jun 2024 19:00:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] drm/xe: Assert runnable state in
 handle_sched_done
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-8-matthew.brost@intel.com>
 <70b451a2-b23d-47ce-8d20-501046744959@intel.com>
 <Zmog3JDBVPcX71Ru@DUT025-TGLU.fm.intel.com>
 <72968729-ac99-4e63-bd2c-ebf1d6d3df25@intel.com>
 <ZmpPvPMnHhUL5ttV@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZmpPvPMnHhUL5ttV@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 20980772-bc70-4dd7-135e-08dc8b4ca694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|366010|1800799018;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXl0S3RxR3lCRVpPcmhuakRxbjJMYXY5eEQ3MjlocGdmUXFjdlJlSUNKMlhM?=
 =?utf-8?B?bUJhNGhRWmRtVkVhcUVJRFBQNGtKZTA5MHM5MitTY09aWlp3ei9pVFR3NjBs?=
 =?utf-8?B?N0tOU0R4V2hWNUZZNDloQVJDUVdpQXFOdGYzc1paN0tFa3doZkdYSjJNV3Rv?=
 =?utf-8?B?K1JDZjl4SklkTm9ZZjE0bElnSFlmZlhFZlU4VVRYdzNEWmhtOUxyYXBVejVh?=
 =?utf-8?B?M0ZQVDJyb0NBVFI4dURyN1l0UUhJdWFmMVYwcThLcGVUNFNtOWdMS1c2S2Yx?=
 =?utf-8?B?cW0vQm1CeDNveHg0RlUxQjlSRnZhWm5vdFZWemN1UmR2dGZaVXJQZmllNEk1?=
 =?utf-8?B?WUtVMG5yNVBEdzFtU0UxS1VVdndEOTl1a0poSkxIWnNvRGpSS0lrVUtvc29a?=
 =?utf-8?B?S0dyMDZXSHk4NVJXOUV1OWhxcHZrSmJoMmJmODNxdHZBdGFGbnFnYW1tMnF6?=
 =?utf-8?B?U0dDZkdPRlh4cVpwK2trdVQ4YmpoK2NWY0ZFSHV0eEpRY3BXVlVYcWVzRmVn?=
 =?utf-8?B?OTR6NStBSklDVmh1REE0OHpwMG9waWt1Rjk1aFdac0s1V1loUzhHR1dKaUFL?=
 =?utf-8?B?WHFZN2FUWlY4V2xPYU1Ua0dqVW5MOXVzYW1hMjQrRDVJcW1DbU9td29RU3Iv?=
 =?utf-8?B?QlVkSFAydWNLNHVEZnZxRG5jT1BITTJEa0xzN3YwbXRTUlIvSDA1SUw4anNL?=
 =?utf-8?B?bVVnRWJsSERUcnpESVdOQ0FSaWNwdHdHbVRzRXNXMUowdGR3aEJuY24rZWZN?=
 =?utf-8?B?WjJkL1dublQrWGozRDFuVi9KQUdrUHpRRzFFR0xSWDk3YUlGcTZiYzFSV3M5?=
 =?utf-8?B?STZEeUlrM2ZOR0t1cm1FVVFQVFRJR0NaOUlSYXdiR05HLzNERVpwaDR4WnhZ?=
 =?utf-8?B?UFlXLzVQRmN0YTEwNUd6VTFZa24xUGE5a1BKY21pMDhEajc1cW0rS1piT1E3?=
 =?utf-8?B?ZzdlaEJQWUcrdnhLazhhdGRmU0E1NFk1SmNXeDdsUlZPUDZtTVU5NmRWYjlr?=
 =?utf-8?B?ZW4xVE55MUxZZStSNW9Xby9LMFJVOFpmVUUxcHVyTzFJR0tTYkxVSkZQYlJ3?=
 =?utf-8?B?TlBYM281NmJqVG14by9zTnZVUC9vakhML3hBdEwxYmJhTlR5eittUGpTblQz?=
 =?utf-8?B?VTBRSWlrbjJ2WTRaYlZTRkhTYlBWUXpTZGlud0Z3WkIwV2hnVmRwZ3FENGJB?=
 =?utf-8?B?T08rZ0trT05Zc3BFOHowN1pEaFBqU2s3SG8wdGZiOEJZOWdmMGd5V3V2SlJB?=
 =?utf-8?B?ZS9oSzlvaTAwbkd4MzV5WEVnL3M5VkM2OVpOVDJ4bE52ZU9ldU5kNk1NanZ5?=
 =?utf-8?B?WWpiczhVVVo1NWZRY2tuNUMyT0R1dmJNQkxBNTJLWGdiTGNKQ1lSTUx3cnlM?=
 =?utf-8?B?OXNIU25EY3F3VjExTm1NcnFsRDB3RzRIZ25jNVQrSWpTaHdxR0RZcjEzekZt?=
 =?utf-8?B?S1hvRWU5ck0zS1ZvaG0rQXdOQk0zNWl2WjA0d1VtVkdydGlZTXhtaWFWR2ll?=
 =?utf-8?B?VjI5R1FFbldmM05FWERKZjNzbUY0WDEvZHY3ck02TjlLaW9rSVJvTnZ3M0sr?=
 =?utf-8?B?MkRaL21UN2JBV0NnYW5RYlhSQVZ4a2grSXVZTldnM2FDNW5oT0pRbmZHMFpW?=
 =?utf-8?B?Q2diTXlUVVBsWDFuSTJLcVdnZkpWK0VhMEZBU0RMZlRlSng2a1R3UzRjbm4r?=
 =?utf-8?B?ZzFFdU9YYXZLNHltc2xLd01IK0lZSEhhZTlRemlJUEdWTk9sVXgvNi96elpC?=
 =?utf-8?Q?3FfE+hivuM7/KzhrTliDVLHe/lomqfJohQ7FiTJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(366010)(1800799018); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dytBRDJiV0oyN0lqYjhHQ0dwMHlZNXcxU1UwV1M0R3JFajdQSkJzSXpoeTZJ?=
 =?utf-8?B?YkVpNlVGdVhRVk1xRmt2V1lyL2g1SDF4bHFUQUtTOHVGTC9oczduajVGWUhj?=
 =?utf-8?B?dzBYK0lPa3NHNkZEWVhkY1lGSFNoc0ovZm96SVlJMC9RbGoxUGU0ZG8wTmNM?=
 =?utf-8?B?RW9CVXNiVytwQ0REM2U1WXJvUEZ2YkJSTUJUdy9scXlPSWg2cE13b2gyVVRM?=
 =?utf-8?B?WCtyRmhIQnlLb1RieVN3V1J6S1k0ZTNHVkcra0YvT214SjRtN3JZb3I1T3A2?=
 =?utf-8?B?bE83TnhlU2xmTkRjWE93ckEreWxSaHVDandJeE1zUFRnUW1Jd1R2amVEelpy?=
 =?utf-8?B?SXpjN1dtbitpZHNmU3pKZWlmRDJQZzF4UHY5ZGNtUWQwYWliUC92ZWlud1Bv?=
 =?utf-8?B?ZDh5VFFZZGxHNTFoSHlwYVVoOE9Tc2N1VmlFSzh3clpycnZ5MysrZXNLUUZa?=
 =?utf-8?B?TjdiQU9mK1FNbXJJV1dQU3RHTGNrY1FBVHdjdmtmeWxVUmlJSTZybVpVZS9m?=
 =?utf-8?B?QXFmZE5ocG5wOWNhT0NCMWFLRi9JVmk2ZFZpYzlWc0k3YitJSmpKTUoxeWhy?=
 =?utf-8?B?UCs1aEZKN3BZMUFWdndPeWF3NXFUMGprdTM4UUJMdm1rM0JYd3h4dlNDWTN2?=
 =?utf-8?B?bmdTK1NKWms4T1d2MC9qbVVFMitmNVBkWVk2ekY4V1Q5NkJVdlFkc2pLVnlp?=
 =?utf-8?B?Vi9UUkF1MitVMWJkUXErcEpVRWRDV0xpRGtIS3NlaE5UNWt2ZkJmbWhFQmJt?=
 =?utf-8?B?NjVlaU53ZzdtS1Bhd1pBNXFrNlNvdlZNbzhzUG9UMWtKcGFGbURlU0dHeUhZ?=
 =?utf-8?B?Tit4dnA2S2NreTRTQmN3SHhJSVRGS2dtbmdwbm02T2h3ZmRTbERPMENBRUFD?=
 =?utf-8?B?ZVdmOFVRVFNES3dHSWwyTHZab1NXMVB2MkdyaFI0TW1zMVZ6WDRpU3dwUHZW?=
 =?utf-8?B?ZXhDWVRJaTZnMUpTTFNYb1VZUUh3SE4rM1htSTYrK3hhdm5nc0tQYmVsc1lI?=
 =?utf-8?B?cjBuR24xRjRkOXE4eDlpOGU1UW5XOHBHdEx2UXlHU01aeUZVMUVYYks2b21L?=
 =?utf-8?B?RmhEOVZ0NTVSZU13cjV6bUp0Z0J1a3JIL0g0QXVGVktMMGhBMEpYS0tVMnJT?=
 =?utf-8?B?czNRcXlub2t5NEhES3h1SktURmpQNG5lYjJ4ZlkvcFo2RTRWOHQ5cEk3NWxQ?=
 =?utf-8?B?OTNrVnlMT0t1ZklXTjFVOWpPZ0NSOEJMT1IxaTVNTnFzTzNHdk1nNE9vZkFN?=
 =?utf-8?B?VUZ3NUNMWmlTOEZCZDZkNWRXNjYvYWpsWHoyRkpNKzZmSGZ0eHdZeFRvdzlv?=
 =?utf-8?B?Qk5KbThrWnkrcEtJeURvRkVoZ3lOcDdmSTVDRnFKZTRTUmlEN2MvRmkxcXk3?=
 =?utf-8?B?bitXY0diYUl5Wkt3emNkTEt3VUpYTE9Da3hYcUlDQWVId2E1S0tDWUZkdGlG?=
 =?utf-8?B?RVVqTEk0Y1E4Slh2RCtLOXh2bU84UFpXdllyc3VQUityK05OdS9ISVVybWRp?=
 =?utf-8?B?WVFUeXBLRFl4bXZ3aytlSXFCc0RMbVAxdFFIZUg0NHRiQVBRa2RoeFlZK2Vw?=
 =?utf-8?B?dDFyOFhZRzhLUmpiTmpzcFBDUGxia28xbW9zcWFUcHAxTEI1d0E3VVJnVGFh?=
 =?utf-8?B?TGZGTFAwQ0owZW5VS2N1L016dUYwQTZhVWpMaklVSWs2czYzK2JJNTlpb0dX?=
 =?utf-8?B?bnZQaW5pQmZFOFFqdG1iSGUvTUpqTVFRVnNjUkE5S2M5ZkdMT2N3ZTUyL3NG?=
 =?utf-8?B?S2dnWVkxeHUrajBNWmtIeHNBcVBVM2VCN0ZieEFONWJDNTNacVJCNmdFemtC?=
 =?utf-8?B?QlhVa21ObllOeG5uZk1JQ2QxRnVCbEpKRUNqbTYzenVaNjRnMzNNWmVnaU84?=
 =?utf-8?B?VnhiRVpPc0d3K2F1UmZZNzhZVERpQ0I2UStXVXZVZVRFSkxwdjNWSDRHUWdy?=
 =?utf-8?B?Ni9UQmFrOUdjWWVDYStzanAvb3RBMUt3aGVvbFEwdXVXb2RuT3R2a1ErRnNW?=
 =?utf-8?B?RU1qNlFET1FXTzBLTU1nYW1nU05UU1dTRmk1TFpncVQxb3hiTWEvTEwraTBl?=
 =?utf-8?B?b1dZSW5sTE1pNEpoY1k1VEtTdnFTOGh4QU16MnVJa0wvZ0NjaFB4L0JFM3BG?=
 =?utf-8?B?aXU1bEg3eFo4ZkxOUkNyejNqdE53YnROMTFOdjVJc2JNSEhOb2hhQVZ4OTNM?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20980772-bc70-4dd7-135e-08dc8b4ca694
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 02:00:50.9940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBqW9hGC1CIqpsarg8A/XOXN8Gm0Ba7phjUWa0nKe14x+J6nKg4sRbhvt658H8N09WpRsAKwcDD6IdcfVGFCth+EmehtR7UafSQneCxq0Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6733
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

On 6/12/2024 18:47, Matthew Brost wrote:
> On Wed, Jun 12, 2024 at 05:54:30PM -0700, John Harrison wrote:
>> On 6/12/2024 15:27, Matthew Brost wrote:
>>> On Wed, Jun 12, 2024 at 02:25:40PM -0700, John Harrison wrote:
>>>> On 6/11/2024 07:40, Matthew Brost wrote:
>>>>> Ensure G2H and KMD GuC machine match.
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
>>>>>     1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index afd22a8d815d..ab0dc93d7740 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -1592,16 +1592,21 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>>>>>     	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>>>>>     }
>>>>> -static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
>>>>> +static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>>>> +			      u32 runnable_state)
>>>>>     {
>>>>>     	trace_xe_exec_queue_scheduling_done(q);
>>>>>     	if (exec_queue_pending_enable(q)) {
>>>>> +		xe_gt_assert(guc_to_gt(guc), runnable_state == 1);
>>>>> +
>>>>>     		q->guc->resume_time = ktime_get();
>>>>>     		clear_exec_queue_pending_enable(q);
>>>>>     		smp_wmb();
>>>>>     		wake_up_all(&guc->ct.wq);
>>>>>     	} else {
>>>>> +		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>>>>> +
>>>> Isn't this the wrong way around?
>>>>
>>> These asserts are per my testing and CI.
>>>
>>>> You made an earlier comment that sounded like it is legal for an enable to
>>>> be queued while a disable is still pending? If so, then you would get in
>>> Other way around, a disable can be sent when an enable is still in
>>> flight in the case of a preempt fence.
>>>
>>> Enables cannot be issued when a pending disable is in flight.
>>>
>>> So I believe this patch is correct.
>> It might work but it does not feel correct.
>>
>> On receipt of a disable notification, the code first checks to see if there
>> is a pending enable. That just seems backwards. It is more logical to
>> process the message according to the message type actually received rather
>> than according to the message type that is expected.
>>
>> If there is ever a valid reason for sending back to back
>> disable-then-enable, then this will break. Whereas, coding it according to
>> the notification type rather than the internal state would allow that
>> sequence to work just fine.
>>
> Can I do this in a follow up? Like immediately after merging this? I
> suggest this as this series has green CI, RBs, will help stablize the
> stack for VK (issue #799), ack'd by Paulo, and fixes a known gap in our
> job timeout mechanism.
>
> Matt
Sure. Like you say, the current version will work as the driver stands.

John.

>
>> As I mentioned earlier, this code is basically broken in i915 and can't be
>> fixed without a significant re-write of the upper layers. It would be
>> greatly preferable to do it properly in Xe.
>>
>> John.
>>
>>
>>> Matt
>>>
>>>> here for the disable notification but with both enable_pending and
>>>> disable_pending flags set. That would hit the assert. Whereas, if the if
>>>> checks the runnable_state parameter and the assert then checks for pending,
>>>> you will not hit the assert and the code will do the correct thing.
>>>>
>>>> John.
>>>>
>>>>>     		clear_exec_queue_pending_disable(q);
>>>>>     		if (q->guc->suspend_pending) {
>>>>>     			suspend_fence_signal(q);
>>>>> @@ -1640,7 +1645,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>>>     		return -EPROTO;
>>>>>     	}
>>>>> -	handle_sched_done(guc, q);
>>>>> +	handle_sched_done(guc, q, runnable_state);
>>>>>     	return 0;
>>>>>     }

