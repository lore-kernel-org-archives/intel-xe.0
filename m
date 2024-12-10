Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B89E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 23:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2C610EA0C;
	Tue, 10 Dec 2024 23:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4xk4cEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA02A10EA01
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 23:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733874542; x=1765410542;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s+fRZi626LLyn0d9mb8JXWhuzPxwLryn8U5zf7+O3Mw=;
 b=g4xk4cEO7lMZcdreYUKqRMqwUfX+KteN3pGmgI0xpcvcEdbctfIbasWy
 OoRQW598phrZGx8pzKUBgT3VH7IT2NnprxDn0+3iyw4kvTHRDp083w6oV
 3kUkngkY665uO6UiOPXin9R2oWsv4MeNhD9kGO2bPKvTlGiNjv+c0o/ul
 DAIH6lxfEmWz79Jbg2qbD/IZOZgMyYSr+ozJMYcE1DAYSqK2DJkybh1aw
 LcgSDOvTHvJ5l5Wdk8syregvkk8HxozEV+G2RAPhReKf+IWjiNjfqI1QG
 YD3Faz2Bv8L4sMeXL2okNpnRnjL1O0PBlHX7wf35rzw43SpDSy9yGbTtF g==;
X-CSE-ConnectionGUID: pwIXxitCQW2IveNp54iBXw==
X-CSE-MsgGUID: Uah27qeLQher7ZIuVuRwyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38169275"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="38169275"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 15:49:01 -0800
X-CSE-ConnectionGUID: 1uCO734bRPOGh6xuaSbkGQ==
X-CSE-MsgGUID: TlQQtobHSqmNSjUqlJjFnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100630296"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 15:49:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 15:49:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 15:49:00 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 15:49:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhMLMpW9n7iDDz6W2oK7O4LKC9tL67PCdeMHqyibVjD4AUh4JFpmDJ9cucZjiBNRiWgHAj89siqkaKUgggegEBVUr113qI4ZIcxabQfJuhgF0/oMlPOD9977tYjIXlWfIBj4bCRkaANhdchBymg0zsNxs9WF/EdfUoy+il5rdOdnN+243IHOWJ5Ybj2HvSisCBpQRHoolLS4Yh9AHB/tVTDugJHvmmwgbPdnlHseWvOsMA4g8PBVFCFwiA+vY8VG1FvFyVgpGT/tHsfcfG62bYmpOpgNWdF1BcyYxHS8/l3HlvNv+j8HoZo+7GO+1qu9554xUABPEPA936YSadQ6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1bzixngMtBZWmiOSZBN4FDMBQNyFlobqH/Yt0iOwno=;
 b=q4IuHTPGNIrFKI9PoMR4doGa2WNh+DqZumN+hdkfEmbZn9wE/kI05DPvUnB7HQ3LpOPgAIRubu3XfDHU2LnOQTKkutRZhO7CPlc4U7sxVIrJa6xqTRaccCD1G5HwdvKIvOhavD1KNAEU2y8KQRrc1wGJdK2wCBxnpXTjw2nyaIrZhDN5wC9qG8JY/KEWmfHrcTBaLA6ksdMMiPJXRMlVFIuYBnUaZaVXgUX87qWshax2OChw3kyLj/5HJ6+jNKhQIre3DgPuhPT/mG0uq1U7cMGBF+XFFdHhAQ7mE3W5UYt22JCX3+sT5v4evdOaXWwWTyOXRQSxqwSfQBZh/efHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 23:48:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8251.008; Tue, 10 Dec 2024
 23:48:30 +0000
Date: Tue, 10 Dec 2024 15:48:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe: add function to convert xe hw engine
 class to user class
Message-ID: <Z1jTTEkbCJYNJy1L@orsosgc001>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241121063904.3033754-5-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:302:1::25) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 8259c4e9-d53c-4895-cf00-08dd19752696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWpxdjUxdmZLUVY1Y1lZV0xEb0Iyd2IzNmJsc0RHTWNRYTBZOS80NW5uaDZi?=
 =?utf-8?B?b0tqMXNjSDhaS2lvcC9PYlZhRmpUR2d4SHJtNS9RZGtLZzBZRXdJRkNMSHov?=
 =?utf-8?B?YUVVNXI5aFREdVAxOEV5TVJyQXFoaVRWNEVsQSswWFd0Yldxa3lFVUhTSVcy?=
 =?utf-8?B?VnUvdHIvOWExOTRxM29QeEU2ZEhpMVpJTlRLaFo1UUY4OGk0ZG5Fcnh2WEhn?=
 =?utf-8?B?b00vam9XWFd4MzZIWUp0bk90Zmg0dzMzeGpEM0NIYnBUeUdhcFc1UmZTUEFT?=
 =?utf-8?B?SklwNCt4M2Z4WEJMcjRPZVdIaHEvMnEvRy94NmJueXRGV25VTk9HUHdHWnpF?=
 =?utf-8?B?dExKVktOODZOTnAwdVlzQ25YZWs1UENpcjVKTkpqMUUybDQ1anNrUS9TKzJL?=
 =?utf-8?B?aGRzQkM1N29NUjlIcUpTdjV2VzdHcDBCTk9ORjFHMkMvTU01OVZuMWhjcUdC?=
 =?utf-8?B?U1o1cHQxc2ZsSVpNTUNSZUIrNWthM2hLTUI1OTBaU204VEQ2SXJxYzZaSWNr?=
 =?utf-8?B?R2VDcFVVTUhoNGU3WlN6bVFCSE8zN0plMUpER2Z3bzRsMXdBRFFuZU40SUxD?=
 =?utf-8?B?MkdPZzY4YnBCWUZlb3B3ZlpueWdzcUdFVFBVREVjbkZPM3BpRXozbmFXU2dP?=
 =?utf-8?B?ZFZmdjV6cnJwYmRDTzJxR0R3ZTMwa3hxYXdtRnlBZVRqVXFVUnVJcklIVmVx?=
 =?utf-8?B?Z2d0SUU0M1BtV2gyOXlYQ0FWdmtoYy9IQkFpeG5BRW1Da29kZGMxWUsvcVpQ?=
 =?utf-8?B?UTFHWjNTeFJuQWROYytCYzM2di9VVE9JSHVkNk4ydmNIVmZWbHR5b0FDY1VI?=
 =?utf-8?B?NTk0c2VzZHpXcDRQS2c1V1FDVitCTEZKRzBKQ0wrL0pyQUUreTVBcUgwaDFz?=
 =?utf-8?B?cU1KeU9lRHRlblI2N2ZTaXdobVJ3Wk1WYnNKQTRoSGFRL2NMNWprejJ1cDJY?=
 =?utf-8?B?TU96RnI5VmgrYmJKWHFuQVJwa3crM1d4QzAxb3VIUHlxaDVTa0tsNXc0NGdI?=
 =?utf-8?B?SmRTNnY4QUtPa05rTmFhQ00vNWxjeUY5U1RqR3pXN2xDVzlIWTF4T3JNK2NG?=
 =?utf-8?B?SWtWU1owNUV2OGJJMFdKMkIyTlV0ZlRHbndxZE9YbU0zdGdFaHM0dEYxNzM5?=
 =?utf-8?B?aVdmVzNWRkhFdTlUMGZRSjJqSmgxK1lSMWFIYk1DaW5USnNpT0pSb2N3Wjli?=
 =?utf-8?B?MUFIU1VSaUFKMkZIWWZqNnduOUlHY01TdWc4WnR1UTl1MGtVL2ttQmNDbS80?=
 =?utf-8?B?c2lYZXNWZW0wYkdZb0RZOURYNW9RSFB3Mnc1dlh4bUR4YVg2b0pWWThLRWhN?=
 =?utf-8?B?bDVwWTF5MGR1YWlMK2w5Z3BTWGl4d2lDU3lqaFkwTWF2Y094Y3dHcngzektO?=
 =?utf-8?B?MUhxRnNYYmZLQVRKcHpFTm5OR2NqaGtXRG5PclgvL2VkMXhQcUswa21GczJB?=
 =?utf-8?B?SHUxM2NSMFhqbld5MUwvd0lJc3krS2FDRWxLZ2U3OW5vNnZXSXZIL2hwM2Y2?=
 =?utf-8?B?TklOMGlLR0NGdGJ2a3BSL00raEp0cktYWUVFcmtuUC9udlNlcnRkSitKRU5y?=
 =?utf-8?B?bVFtSC84NmY1d0hEN2RVcG1hOVhjVTA1b3c3Rjd5WTl4Uk9JMkdvTWVKZyto?=
 =?utf-8?B?RmxzaUZNMEdxWVRIcHlHS3J2eVIxcDNnZUZiSCtQNHpCaVI1MTM5a3dIb3N5?=
 =?utf-8?B?QlFaOFJXeE1mMGg0WmlTMEVqU01PbW9ON2dDMmQyeXhsczgyTlpWMjRHTWQy?=
 =?utf-8?B?emQrR2VidDh1cC9FN0JwNkNaVDE5T0VFbVZzZkJpUjVQejNBWllYSjFEc0dJ?=
 =?utf-8?B?ZmdHRW5hQnI4MVBTOUJHUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUQ2Q3puTC9lRkJlUDVCQkduc0ltalo3NGkrOHFDSk9CSCtkTGhKbzRFTU5s?=
 =?utf-8?B?aVZFWmlWYlNjZm5sY0NpNHBxbktxRm8xSkZTZzR6Z3djSnhWbUVZYm9PY3F2?=
 =?utf-8?B?eHduRkI4TlJMZTkxaUs4cVRxZ01QRlJiUTA0d2VTK01Kb3N6THd2ZFVWUDIy?=
 =?utf-8?B?MWh3bnBQa0lzZjlhOFVsbEhobnhKdUY2bDBqdEJUbkRoaUVUNWJzOWZCcEZx?=
 =?utf-8?B?eGtNS2twek9sVnJxeG0wNC8vajRwV05hZkxHcElaVjNUNm0zNkdqUjk1NWRB?=
 =?utf-8?B?NUt6cWpBaHJBdXpVR3ZZVTR2WFdTcDlNN09zalZkRUlCYm45Ly9sMmxBN1Ru?=
 =?utf-8?B?ZWltODJOcUJTaWo2OHFoTURBdlNIZ29OUStZelFGOTR4YVoySVlmRkZleFRL?=
 =?utf-8?B?VG5lc1pwa052YjVxcU52TE9JWFdQOWdqOVVjSExQclVpc0x1Vm55aHJpMVFp?=
 =?utf-8?B?WFJWb1dKRDR6UjhhZ1NxZmRETFI1VC9JU1JrTnByYnhjNkxBQ2lySUxQQ0VS?=
 =?utf-8?B?d1pld25neE04TTQxclpsekZPYVpGbGVGeTFMcm9UZy8wNi9QalZJWHdaRkZU?=
 =?utf-8?B?NklHbVl5QktvYjh3b2JTQk9RWm5RU2pFZ0RqbmJLZFE3c0o4NTlrK05UY3Uw?=
 =?utf-8?B?U3FjbytCaWdaSm9mZllwVmJodTc0bHc5VTE4bkswemZCNjcrWStZUFlyZFMx?=
 =?utf-8?B?NktKS1llSm9uOGRnTWRrVGxWZzUyS1d4L2F2YlZRdmQzWVl4Rm1iV2NZdHRN?=
 =?utf-8?B?RnhZaVQxMTl4YnJRSHduMnRmSFQzRDlTQ3U5QmJ5aG4xQy9TQjhHWXEzVnFB?=
 =?utf-8?B?dHF1MzlTdngyTkdac3crQ09scmcvRDU3L1NVdFpjM29LTkR6OEpCSG8rT25T?=
 =?utf-8?B?QXAvVEcyYVFueHhhdzNMak1HdGpmS1BmeUgvNFcwWlpGK2NxcFIyRnQxTWt2?=
 =?utf-8?B?dkFSaFB2NHI5RjVpVWlBeUNqQ2c4aEF1TEFudWp5cjBTRkZ0OGM2TGFyMUdE?=
 =?utf-8?B?akVWMGpQVDNhSEtkVVJCbDdtbnlTblJuWS9ndmg5aU00M3ZmNTNIb3V2b0h5?=
 =?utf-8?B?Yi9nQStpWUlWakFWMFBVYWh1Znl0Tm1NU094aG1tTVo4aTZqMktYYnNVR2Iv?=
 =?utf-8?B?MldaUEtudUg5YmoweTRpeVB0c2NpbEpDR2pMNElISG16Q1I4N1RvVkF6Rkgv?=
 =?utf-8?B?a1VKZ2dSVk10UnpZbzFjV0RQcWJsUFNySzkzRDBpcEZlRlRhTmJlS09qZVcw?=
 =?utf-8?B?cU9PMlVUMEgvWnc0QkQxcWVUZ09tRUtTUDF6NlYrYThlUG1XRkp5SGZoODVP?=
 =?utf-8?B?UEsxZGViSysvUHZNNGNxbDJvZHlKenNuZHk1eDFqS3RxN3pVdWpmN1hZQ3hX?=
 =?utf-8?B?K3lNYWFkcHNCZGsxOW52dXBaVXNJNUF3MVR2Q1FsazRDWSt5QVNsVHVOUTR1?=
 =?utf-8?B?cWpxL1Q3eW96RVpBUGJsaVhWNjVrQ2Q2UHEvc2JTdFNwaXFFVVA3K0ZmRFFR?=
 =?utf-8?B?NERtaVl0djFpcDVDUzhESWdVVFVvMUt2eitESlFzajhiNzBUeTE0V24yWC81?=
 =?utf-8?B?L0tuNE5zN3V1NmwzU2RKbFdpQVl1MTc0MU9hdlpzRUtyTFRTTkJJOEkvMlkx?=
 =?utf-8?B?RkpRZGkvdFZYaE40ZGs1OU11MkVVYVRIL3R0RFVGb3FzMlFXQWo3UHZoTUwy?=
 =?utf-8?B?dG1wZDNzUS9rV3BtcFJnQXc2a2ZQYitkejZlT01ha2VGbmhEc0N1N3JMWnZQ?=
 =?utf-8?B?NW01d1doN0pGT004RmZQc21OYTlIdVowUTN4MkxGalpyWUNPVmhKekgwcWVs?=
 =?utf-8?B?dFZlUjZXeTJuOGdrdXYxZFlWTHZPZVFaai9hRzB2aDJEbEh5M2RScG15dDMy?=
 =?utf-8?B?eDZpblRRVTVpQ2EvTTMyZldiOEE2OElwR0IzR2xwd2JlNW9aTDNRdmM4bGlH?=
 =?utf-8?B?dHdFaDkzd2M3UGozK3RZUDd2WVByVWlxcEMyNjNHMTZEbUs5VVErNmI0czFk?=
 =?utf-8?B?MStPbFh6TnY5bWFSdUV0bERUTEEzVlQ5YytXOTFSZzJmS0N5UllzUXNuZzJq?=
 =?utf-8?B?Q05lWFE3MXJySCtQVUE0Zkg2Y0h3alozcWVsbVVZUXN5Uk5XL3NRNW5qUG5m?=
 =?utf-8?B?dlh5Y0F5Y2ZsZUd4aG52U2VFT2duWUJxT3pzUndTWHN4SExXUXJmZGFKOUIw?=
 =?utf-8?Q?5/rZsxAklRasNPW0RhN+URU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8259c4e9-d53c-4895-cf00-08dd19752696
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 23:48:30.8018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RahhKpqxg8v2yYc9j2F/3mrCRQ5AzAsZUUCHNImkPtkPxAs9F0AB12qXe8M4OLJ/bcflfL0YeVXuWON8VwFnYWRgw/JANM7kKcUWMd9uyLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
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

On Thu, Nov 21, 2024 at 12:09:00PM +0530, Riana Tauro wrote:
>Avoid duplication of code in PMU by moving hw engine to user class
>to a separate function. Refactor existing code to use
>this new function.
>
>v2: replace with array (Umesh)
>    fix commit message (Rodrigo)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 21 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
> drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
> 3 files changed, 24 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index c4b0dc3be39c..c41b4038dbb3 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -979,6 +979,27 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
> 	return NULL;
> }
>
>+/**
>+ * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
>+ * @engine_class: hw engine class
>+ *
>+ * Returns: user engine class on success, -1 on error

1) Depends on what you want to return on error since you return u16. If 
the WARN_ON fires below, you may just want to return a default like:
DRM_XE_ENGINE_CLASS_RENDER or 0 and change the comment above 
accordingly.

2) Returning -1 means use an int return type and make sure all callers 
check for the return and act accordingly.

I would recommend 1.

>+ */
>+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)

since now this is a xe_hw_engine api, pass the hwe to this function 
instead of the engine_class.

>+{
>+	const u16 xe_to_user_engine_class[] = {
>+		[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>+		[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>+		[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>+		[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>+		[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>+	};
>+
>+	WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class));

Revisiting this, it should not index into the array if the engine_class 
is invalid.

	if(WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class)))
		return <something>;

Thanks,
Umesh


>+
>+	return xe_to_user_engine_class[engine_class];
>+}
>+
> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
> {
> 	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index 6b5f9fa2a594..06b39cb1a434 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>
> const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
> enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>
> void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 3eda616f1502..a260c43f13f4 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -27,14 +27,6 @@
> #include "xe_ttm_vram_mgr.h"
> #include "xe_wa.h"
>
>-static const u16 xe_to_user_engine_class[] = {
>-	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>-	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>-	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>-	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>-	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>-};
>-
> static const enum xe_engine_class user_to_xe_engine_class[] = {
> 	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> 	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>@@ -207,7 +199,7 @@ static int query_engines(struct xe_device *xe,
> 				continue;
>
> 			engines->engines[i].instance.engine_class =
>-				xe_to_user_engine_class[hwe->class];
>+				xe_hw_engine_to_user_class(hwe->class);
> 			engines->engines[i].instance.engine_instance =
> 				hwe->logical_instance;
> 			engines->engines[i].instance.gt_id = gt->info.id;
>@@ -678,7 +670,7 @@ static int query_oa_units(struct xe_device *xe,
> 				if (!xe_hw_engine_is_reserved(hwe) &&
> 				    xe_oa_unit_id(hwe) == u->oa_unit_id) {
> 					du->eci[j].engine_class =
>-						xe_to_user_engine_class[hwe->class];
>+						xe_hw_engine_to_user_class(hwe->class);
> 					du->eci[j].engine_instance = hwe->logical_instance;
> 					du->eci[j].gt_id = gt->info.id;
> 					j++;
>-- 
>2.40.0
>
