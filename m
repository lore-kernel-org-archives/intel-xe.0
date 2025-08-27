Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1ADCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 16:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7410E15F;
	Wed, 27 Aug 2025 16:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqIkRaXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A4F10E15F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756312862; x=1787848862;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zlav5e8/iQlmqsTjSIDdL6VYGafdwRZuFa/te6GcIZc=;
 b=UqIkRaXL8zApQ4DDoFDyCe4gpfyrB+gV06Kovtfl3rLICgVkWWzSXwPo
 Z22fa6bhSSDugjKHSNjFaBhedOsdHEBCKAw3bTdtfGU5SHugRL/lxPDek
 QxiOc3c9dXvvkRvNReB8N26LlU03jwVa+6RoF1j/3uTgkMCvmlzHS7xex
 AW/iJrLNL8gSwCX5nfMGUly90azZOAjSZYRM1yXO7zttVlZ7ptZ2sjKGX
 oU716kRNWqAPGYJecVaKhsOCh/F2+Y1cYLZAoT2RfwwqQI4Pq1vgzP3P2
 R5Zm+UgS45wM31TOntgEYd0B83ITsa8dxAocL8Pb4D1v5CbrfXA1/huFO g==;
X-CSE-ConnectionGUID: UxfPg72PRFyEDFz6cLEgkw==
X-CSE-MsgGUID: zebPETadS/ed3vCuxHZ81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="76169037"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="76169037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:41:02 -0700
X-CSE-ConnectionGUID: hH9LW/EMS1SFQ5hL4lKhbA==
X-CSE-MsgGUID: 62xb755GT+yGRLSbJV8yEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="207046436"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:41:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:41:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 09:41:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMTeqID0FCkjhtGPeqRtz7qiBvekpOc+UyzoecKHNMJN7OAs+uLZFUx1jvP/MhRsPHQpXYJSKylN59qJrajw3iWXSsmX8BVU2KF8yv2SWR3EwY9ao1u1YSKSz6J4dEwNu7E+TusYYnb8J60dsiab4CAgBp7y5PXnb1Pa8TMDzxnc4KVsxOHXObKCld88qLFJq1T2u06wm/e1//FfAgbYhhhbCyNXQWNJk4y2uAQKTWCw4OwJohUfcmerMt9lJCka+eb/S335RyZaCFerieU0BEhIIBADhJDjfgwgNDszAVOb0cOHS//KGoApkYbdwQn4nOaQdXYU3yg/ENZhtSPsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJxVZyMelvgAz48r39u9zRwaIEh4I8bspUFPPYSNZ9U=;
 b=L5mq0MXmHrRA25r0/L5YG36daMW4pTI2lSRGKtbLfFBDgpF3FG9pD4ejDnRdvKJcNyfEQ47WYxHN146LcQkg4MMYG1JIqaDQ5VwSm0AsICvwa2A+1RBJj+cY68Um9tXbnWUCRifEZ+YLw8GjiUHc1PvHS5SUq5WcrAYW3RXVKmkNYVPJOZBntf1Psfh6sQXTMChJs/O4xeoahiJqOlD0Gtqa8ZX+g/MySbVPzG83Sn33gA8fzlw1Uv/w0sSWitBjBtnIzlEK+sR9j7g+NTaCoAMYVPpe7WR9U/V01MDtwpBHX6OCz8MUEY8X3SQbhiIKWhQCNtnoOQZP30YsDYssjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.23; Wed, 27 Aug
 2025 16:40:57 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 16:40:57 +0000
Date: Wed, 27 Aug 2025 09:40:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Message-ID: <aK81FpQ+Todf0IWG@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-2-matthew.brost@intel.com>
 <aK8kauwpALcoSxwr@fdugast-desk>
 <aK8sbZxVd+MlS1ZX@lstrano-desk.jf.intel.com>
 <aK8xjbyAZDxVR37H@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK8xjbyAZDxVR37H@fdugast-desk>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA0PR11MB4703:EE_
X-MS-Office365-Filtering-Correlation-Id: 56198f35-404d-43b7-a754-08dde5887f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nkw3OFlaK21hcFJ2OHJjQTNFc0ZuZFZ4RDE4RnFnVXptWXo2cmNQck5SbFB3?=
 =?utf-8?B?N2ZxempNR1JaSlZuUzJDckh4NHo2TVg2YUNlSElRRzNPdlhFWnZaOHNJcm0z?=
 =?utf-8?B?RzhCYndWcGhLa2wza01hd3h1ZTlzdnAzM2xzY0wyUnhtLzFEdVQ2LzhuS1B4?=
 =?utf-8?B?UjdwR01paTlaOHUvcXI0Vi9BZTBZM0hTYklMdEhWT09sQTUrSG1HV2FzR0Vo?=
 =?utf-8?B?RUlkRXlJby90RXBtNVE3Z1o3aDVvQnpiYURqU0FSZ2ZtVVhremd6VlZuc3E5?=
 =?utf-8?B?TmpvUHU3OEt6VFI0NHBEZTlyTDJJanhkOVpVR0ZGL1RhaG5IT2M0aHk0M2ZF?=
 =?utf-8?B?OC9pczg1eldxcnFKNDYvZDZ4RmduU2N4eUJSUGUzTzBHT0ViajNDeGxLQ3U3?=
 =?utf-8?B?dGtaYzRHaDlTaEpPUEZJUjFKWm9KUzBOMFhlQ015MmlWRkYwSWxxSVFENGxh?=
 =?utf-8?B?U1djeDNTeDZiRG1xbTN1RW5YeStEaXhCVmpUVzVtNFJDV2pycHBiangyVGRv?=
 =?utf-8?B?N3hTQThPWmxRam4xZ3dXdTJuMDJjRXh0M2hCanh4cEFFN1pEVldTQWU2VXNZ?=
 =?utf-8?B?ZmRLcUY2Wi95NW5LMFZvbFZ4cnludTE3bXo0OE9kWXIxYzNjVHBFQTF2bkh5?=
 =?utf-8?B?OWNOUzdWSVNQa2ZoeXBvT2ZlejlFUzIxdVJXUkRLU1hGMm1BNFdhTXVabmFi?=
 =?utf-8?B?d2F5a3hnM3RBeUdqdGlBMHBhYXlidlJ1WDgzQkY2d1p2bmFvb3o4Y3h4NGpi?=
 =?utf-8?B?MkM2bzJITmx1cTFFN1diQ3BUODl6OTV1dDlGa0dJNmpVMGJ2NjcvdzdZQWZw?=
 =?utf-8?B?ekkxK2pQcWd5MEFDcko0blFUcmg1SjVWdEJraWhkdUJhYnlmcnBCclIxTER5?=
 =?utf-8?B?aURVZHFXcjRobHkxZGo0UkpQL1ZobFBXTjR5Q3hYR1FwZW03YkdqeGh5alhP?=
 =?utf-8?B?OEVMWWR4QjVXSHNTT1hVb0hWUWJKZXFIbnBPVHgzZWVCcHpBNDU0cnF3R1h6?=
 =?utf-8?B?MndtRndYR1RZaXNmMWRUWEtzS1JlV1BobGFVN1A0b2dtYWZKZkRmSEh4NFNi?=
 =?utf-8?B?RXFIKzJyZHVIMmRzeU1ZNTlZZnhmclc2ZEJHb3p6MkczQ1JsV3BpOXdzeUEy?=
 =?utf-8?B?Y0tOR1lvOEplZ1gzejFnRnNBQWJCWE9mcEE2WXVNU0ZuSmZBVGRDL1Z3emN4?=
 =?utf-8?B?SUlML0tndWRYWG9MZ0NnWEZWUityaUVtdTJLV0djNlRQcDlLVHkvczM3ZDRS?=
 =?utf-8?B?bVBCVmtXb1grU3BQN3ZXd3lKRzZsQVp6eVlUQVpRQk5GQjNEUmJObVlyL2d5?=
 =?utf-8?B?Q0JJaGtva0RtdjMvZ2FURC9WWFRTbSs3RUhyK3hpNzNQVGZmUGRIcU5GL2J5?=
 =?utf-8?B?a1N3NVBrNk5ReW1NOE4rN3FhUE5pdnFIOGxUOVd1b1BDSEpRazVENzdabHBY?=
 =?utf-8?B?cGY3em1za1RUWHppZDhlcnRvN3pxTExCTzRRNjkvKzFqTXBRREhCSURjdjU0?=
 =?utf-8?B?dlNhNTFwNXUwUFYwd1dGdDUvTTk1Q054TTg2cDlKeVVEbnJ5UU9kQW1HbmNN?=
 =?utf-8?B?RFlmOVpPcWN0aVNiSmU5czlnRnQwaVBuR1hVZFE5NmMvSytKY3YxRFhSRUVn?=
 =?utf-8?B?SFlKZERmMTNwUXRmTkdkT0dUeHppbDNnUTk5bnZiQ1VXUzNxWnJRWHh6SGJN?=
 =?utf-8?B?akN0cFF2WFNZaU9TSTV2OXNVKzQ0ODQ4cElCcE4va1grdzd4RWxYWXpueE8z?=
 =?utf-8?B?aVNGWnhWekpoRk5GOENCaENlSUtGWFN0U0lXWVJkRHp4NkU3aENoUzYzYWts?=
 =?utf-8?B?TUFHM1dLa0ROOTIwc2RMcmJETFpXNnBsK3Q1bTRyYUNaVFI4MG8wZDNCcDVD?=
 =?utf-8?B?U2dhb2hoWitpRzFQb2o4dGcwMW03cHluTzVNb2FEUVpmRXBQTnJUWExPY0Rp?=
 =?utf-8?Q?whNz1S10C6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWg5VklsN044eVRxWVluSHVPUmt2b1RTVkhlNnNQQkw0T0Raa3ZEdW50eTYy?=
 =?utf-8?B?ZGZ0eVZISTVCa2dwL1J4ZmxuQXZFR1VqYitmQ3RlcHNCQ0svVXdqR3l4cDd3?=
 =?utf-8?B?eHBTWjJSeEF6L2dZREpvTEZUcytoTXRsMERCbHN4bjczYmUvU1VFYUk1bWY4?=
 =?utf-8?B?b1NZSS8zOERSa0FsOEpadWx4SEJtd1FHRVVxMlZSUnBicEw2bEdhaWE1blpy?=
 =?utf-8?B?QUtYbkNDVXE1dVFKS2EvVnhDRTdzU21hUytJT2tBcVMwM3JVRVdYc2xrSmh0?=
 =?utf-8?B?NmxlUmVzSzlHeGNFd3FIc0VsRmN1algzYlpPYzF6UXMxYkZLSzRIajlJU05o?=
 =?utf-8?B?OENvSGVSejdMUmxjRXpENFpXTHJaNDVocnVBSlczWGlONmdNbUtPeERET1Rz?=
 =?utf-8?B?K1c4UzVXWEx0blpqamNJb1RwZEdlS21BcHJKYzBsZS82MW5wY3RTZzJYUUFP?=
 =?utf-8?B?RDdJM1lJRzBQWlB5dzNHQXREWjl1WWtVWXRqTWNRcTdaYUJvQWNrc3R1eXdS?=
 =?utf-8?B?SElSdXRTbUJ2VjZTd0xHUFhMZ2kvK3dsOXJpS0R5aUtFN2tKcllwSGxldzdT?=
 =?utf-8?B?Z1JQMUpHOURjSUVHWDVEcTROK1pBVXAvVkNoNXgxS1FVd0R1SHcwejFoZE1J?=
 =?utf-8?B?eW93ZGVpcEFIZUFITFZjRCtmQWpIVTRkanBUUFdsbDBzdERtQnI2T1RMSVVi?=
 =?utf-8?B?K0tldmdCSXlRZDRMcGZ4MmI3RkZlOE50V3hIMGJmNEluVjd6amlxUUx6UERT?=
 =?utf-8?B?VHQ4K3pWeUhIQTNPcUV0eEtvMkROZ3BjdFZTRkdOaTg0SzVOVm15YVNtQnlW?=
 =?utf-8?B?WjF5VTkwUjl5RzJEYWQxd3VIcUF2VWkrd0EvODdrTjI5NnhGOSt1VmoyRDVn?=
 =?utf-8?B?KzJodDM1YjJXYTdXd0ErSDlFWTEzbU8zNUoyd1h2Nmp2R29NT1YvRksvSDZV?=
 =?utf-8?B?WXoyUzQ4UmViZmpoOVdHSTZqVk5jYzdjNFd4TUZsL2xOa2dIb2xYWU5FZ3ZW?=
 =?utf-8?B?aXpjMDJxcmE0ZGRCbXBmdDg4UHFacm1XNTJjLzB2SDJYRGtJYTJUQS9RQnVX?=
 =?utf-8?B?SFdsSUVtS0FhK0w2YUJFYUpaNjNQU0xQd3ZjY3RrYUsvOWFpVElSdTlpYm41?=
 =?utf-8?B?WUNRVWNubXk1aGpqNlJzS3JuSCtHcnRzMGU0SW81YnhVVFd0dnoxMkdRQjAr?=
 =?utf-8?B?YmNJSjg4eUJ2bnhlV2RXSysxMGJDNTR3N3FHNXRZSFVSL3JHR2pJb0c1b3RE?=
 =?utf-8?B?cjUzdy9kclllMFJxczArRnRWYXNhaVB5eEkwMElWaXpWSDV3bkZnTFpJQVAx?=
 =?utf-8?B?cytYcjc0OTREYlpxdGhsOTBIVGR2ZFJmT0dMSXovUUNybVFvQ24wWEFBZmV2?=
 =?utf-8?B?SVdnY1pjMHFnZ3J0UFhkYUJUZkUrNW1yQmxKZEdNWVpYa0RWMXk5WjVDbjRD?=
 =?utf-8?B?dGlUVWtKT1VLTjdYWUJZd1EwZmZQVHl6Nlp0Unk5Q2RPK21FNzdTWkdJY0RF?=
 =?utf-8?B?SWVLTFhScmp2VXBtREswMEw3T0NwU2h2SXlHY1JDMWJ0Z1VlSmYxYWdJaTV1?=
 =?utf-8?B?S2FHemV0T2hPZlBEUXNndWpMd3lxdlg4WlF2MFpTUjFpczI1MlJlbTRHeU00?=
 =?utf-8?B?TER3TmtBK1d5cllKOUpXRTRZakpZSitKWFJYV0IxNWxFMUJTMnBEdkNlM1NP?=
 =?utf-8?B?M3FmQVhna3NvdVVyOEcrd2RZZEVXZE9US1hLalRTVVlLZS9zMmVjWGdFSmZN?=
 =?utf-8?B?K1NIZ3dyaldZVzBxcU5uMmdDVlp1RGREVVBKOTh0Tjk4aCtCNTA5V0hBd3RW?=
 =?utf-8?B?aEhuNVpVMEtHbk9OanNOS0NuN3VBRGI2M0QwNlA2TUZGRmRybVNxUXpXcG1Y?=
 =?utf-8?B?aytVRG1MOVhWRkFCejlmd01EU3VqenhyVi8va25jYWMyckpDb0hvVHR2b3lq?=
 =?utf-8?B?ZXZzaWd0VDl6ejM2dVRRejJNS3B2VzA0V1FlUXlFZklTbVJ1SXJXZjNoWTJl?=
 =?utf-8?B?MS9qZ2ZrK0ZJMTd0U1ZhK0J2cUF4TXRPaUNZdWdFQmNDc0tGUkcwbE9oUno1?=
 =?utf-8?B?aXVzbVVMME51M2VaS2VJMWdWcjhhRGEvWThzNTJybTAwdUZ1YnhnWkhzejFz?=
 =?utf-8?B?ejZOYWdwckIzTFMzOVYzL3dKODNKVG9Bam10R0V0SFJRd1NGMlowM0JDVGFG?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56198f35-404d-43b7-a754-08dde5887f7a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:40:57.5573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgMGTtu/xVIyWQhZNydmzwrLmSi8Bu2BTO6cGMV6OtA+O7pDTEDLgWkQArLLxpYpGSnDhbAIv0uOmzsxNeCg/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
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

On Wed, Aug 27, 2025 at 06:25:49PM +0200, Francois Dugast wrote:
> On Wed, Aug 27, 2025 at 09:03:57AM -0700, Matthew Brost wrote:
> > On Wed, Aug 27, 2025 at 05:29:46PM +0200, Francois Dugast wrote:
> > > On Tue, Aug 05, 2025 at 11:22:32PM -0700, Matthew Brost wrote:
> > > > Stub out the new page fault layer and add kernel documentation. This is
> > > > intended as a replacement for the GT page fault layer, enabling multiple
> > > > producers to hook into a shared page fault consumer interface.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile             |   1 +
> > > >  drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
> > > >  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
> > > >  drivers/gpu/drm/xe/xe_pagefault_types.h | 125 ++++++++++++++++++++++++
> > > >  4 files changed, 208 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index 8e0c3412a757..6fbebafe79c9 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
> > > >  	xe_nvm.o \
> > > >  	xe_oa.o \
> > > >  	xe_observation.o \
> > > > +	xe_pagefault.o \
> > > >  	xe_pat.o \
> > > >  	xe_pci.o \
> > > >  	xe_pcode.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > new file mode 100644
> > > > index 000000000000..3ce0e8d74b9d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > > @@ -0,0 +1,63 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "xe_pagefault.h"
> > > > +#include "xe_pagefault_types.h"
> > > > +
> > > > +/**
> > > > + * DOC: Xe page faults
> > > > + *
> > > > + * Xe page faults are handled in two layers. The producer layer interacts with
> > > > + * hardware or firmware to receive and parse faults into struct xe_pagefault,
> > > > + * then forwards them to the consumer. The consumer layer services the faults
> > > > + * (e.g., memory migration, page table updates) and acknowledges the result back
> > > > + * to the producer, which then forwards the results to the hardware or firmware.
> > > > + * The consumer uses a page fault queue sized to absorb all potential faults and
> > > > + * a multi-threaded worker to process them. Multiple producers are supported,
> > > > + * with a single shared consumer.
> > > 
> > > I am not through with the series yet but xe_pagefault seems to be the
> > > consumer code only, while the producer code will be located elsewhere
> > > such as in xe_guc*. If so, might be good to write it here or in the
> > > functions below.
> > > 
> > 
> > I didn't want to mention the GuC specifically as it is intended to be
> > generic. The GuC is a firmware, which is called out as potenial
> > producers.
> 
> Sure, sorry for the confusion, I did not mean to name the producer here
> but rather to add something like: "This file contains the consumer code."
> to link the doc and the functions below.
> 

Ah, yes. Will add.

Matt

> > 
> > > > + */
> > > > +
> > > > +/**
> > > > + * xe_pagefault_init() - Page fault init
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * Initialize Xe page fault state. Must be done after reading fuses.
> > > > + *
> > > > + * Return: 0 on Success, errno on failure
> > > > + */
> > > > +int xe_pagefault_init(struct xe_device *xe)
> > > > +{
> > > > +	/* TODO - implement */
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_pagefault_reset() - Page fault reset for a GT
> > > > + * @xe: xe device instance
> > > > + * @gt: GT being reset
> > > > + *
> > > > + * Reset the Xe page fault state for a GT; that is, squash any pending faults on
> > > > + * the GT.
> > > > + */
> > > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> > > > +{
> > > > +	/* TODO - implement */
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_pagefault_handler() - Page fault handler
> > > > + * @xe: xe device instance
> > > > + * @pf: Page fault
> > > > + *
> > > > + * Sink the page fault to a queue (i.e., a memory buffer) and queue a worker to
> > > > + * service it. Safe to be called from IRQ or process context. Reclaim safe.
> > > > + *
> > > > + * Return: 0 on success, errno on failure
> > > > + */
> > > > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> > > > +{
> > > > +	/* TODO - implement */
> > > > +	return 0;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> > > > new file mode 100644
> > > > index 000000000000..bd0cdf9ed37f
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> > > > @@ -0,0 +1,19 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_PAGEFAULT_H_
> > > > +#define _XE_PAGEFAULT_H_
> > > > +
> > > > +struct xe_device;
> > > > +struct xe_gt;
> > > > +struct xe_pagefault;
> > > > +
> > > > +int xe_pagefault_init(struct xe_device *xe);
> > > > +
> > > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> > > > +
> > > > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > new file mode 100644
> > > > index 000000000000..fcff84f93dd8
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > > @@ -0,0 +1,125 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_PAGEFAULT_TYPES_H_
> > > > +#define _XE_PAGEFAULT_TYPES_H_
> > > > +
> > > > +#include <linux/workqueue.h>
> > > > +
> > > > +struct xe_pagefault;
> > > > +struct xe_gt;
> > > > +
> > > > +/** enum xe_pagefault_access_type - Xe page fault access type */
> > > > +enum xe_pagefault_access_type {
> > > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> > > > +	XE_PAGEFAULT_ACCESS_TYPE_READ	= 0,
> > > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> > > > +	XE_PAGEFAULT_ACCESS_TYPE_WRITE	= 1,
> > > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
> > > > +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC	= 2,
> > > > +};
> > > > +
> > > > +/** enum xe_pagefault_type - Xe page fault type */
> > > > +enum xe_pagefault_type {
> > > > +	/** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> > > > +	XE_PAGEFAULT_TYPE_NOT_PRESENT		= 0,
> > > > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
> > > > +	XE_PAGEFAULT_WRITE_ACCESS_VIOLATION	= 1,
> > > > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic access violation */
> > > > +	XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION	= 2,
> > > > +};
> > > > +
> > > > +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > > > +struct xe_pagefault_ops {
> > > > +	/**
> > > > +	 * @ack_fault: Ack fault
> > > > +	 * @pf: Page fault
> > > > +	 * @err: Error state of fault
> > > > +	 *
> > > > +	 * Page fault producer receives acknowledgment from the consumer and
> > > > +	 * sends the result to the HW/FW interface.
> > > > +	 */
> > > > +	void (*ack_fault)(struct xe_pagefault *pf, int err);
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct xe_pagefault - Xe page fault
> > > > + *
> > > > + * Generic page fault structure for communication between producer and consumer.
> > > > + * Carefully sized to be 64 bytes.
> > > > + */
> > > > +struct xe_pagefault {
> > > > +	/**
> > > > +	 * @gt: GT of fault
> > > > +	 *
> > > > +	 * XXX: We may want to decouple the GT from individual faults, as it's
> > > > +	 * unclear whether future platforms will always have a GT for all page
> > > > +	 * fault producers. Internally, the GT is used for stats, identifying
> > > > +	 * the appropriate VRAM region, and locating the migration queue.
> > > > +	 * Leaving this as-is for now, but we can revisit later to see if we
> > > > +	 * can convert it to use the Xe device pointer instead.
> > > > +	 */
> > > > +	struct xe_gt *gt;
> > > > +	/**
> > > > +	 * @consumer: State for the software handling the fault. Populated by
> > > > +	 * the producer and may be modified by the consumer to communicate
> > > > +	 * information back to the producer upon fault acknowledgment.
> > > > +	 */
> > > > +	struct {
> > > > +		/** @consumer.page_addr: address of page fault */
> > > > +		u64 page_addr;
> > > > +		/** @consumer.asid: address space ID */
> > > > +		u32 asid;
> > > > +		/** @consumer.access_type: access type */
> > > > +		u8 access_type;
> > > 
> > > For type safety we shoud use enum xe_pagefault_access_type instead of u8.
> > > 
> > > > +		/** @consumer.fault_type: fault type */
> > > > +		u8 fault_type;
> > > 
> > > Same here with enum xe_pagefault_type instead of u8.
> > > 
> > 
> > This structure is carefully sized to 64 bytes. Unsure if using enums
> > here will throw off that sizing. I'll check on this, but I suspect it
> > will, if it does I think u8 is the correct choice.
> > 
> > > > +#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> > > > +		/** @consumer.fault_level: fault level */
> > > > +		u8 fault_level;
> > > > +		/** @consumer.engine_class: engine class */
> > > > +		u8 engine_class;
> > > > +		/** consumer.reserved: reserved bits for future expansion */
> > > > +		u64 reserved;
> > > > +	} consumer;
> > > > +	/**
> > > > +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> > > > +	 * by the producer and should not be modified—or even inspected—by the
> > > > +	 * consumer, except for calling operations.
> > > > +	 */
> > > > +	struct {
> > > > +		/** @producer.private: private pointer */
> > > > +		void *private;
> > > > +		/** @producer.ops: operations */
> > > > +		const struct xe_pagefault_ops *ops;
> > > > +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW	4
> > > > +		/**
> > > > +		 * producer.msg: page fault message, used by producer in fault
> > > 
> > > s/producer.msg/@producer.msg/
> > > 
> > 
> > +1
> > 
> > > > +		 * acknowledgement to formulate response to HW/FW interface.
> > > 
> > > s/acknowledgement/acknowledgment/
> > > 
> > 
> > +1
> > 
> > > > +		 */
> > > > +		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> > > 
> > > It is clear from patch #6 why it is more convenient to have this in
> > > struct xe_pagefault rather than local to the producer but this seems
> > > to go a bit against the elegant abstraction provided by this new page
> > > fault layers. producer.private could store a struct with {guc,msg}
> > > but that is probably overengineering so up to you.
> > > 
> > 
> > You can't malloc (with GFP_KERNEL) the producer path, at least for the
> > GuC as we are either in softIRQ context or under the CT lock which is
> > the path of reclaim. The only option is have these fields populated in
> > the stack xe_pagefault structure in the producer which then is copied
> > into a preallocated page fault queue, sized to sink all possible faults
> > on the device, on the consumer size. I can add kernel doc explaining
> > this.
> 
> Thanks for the explanation, would be helpful as kernel doc indeed.
> 
> Francois
> 
> > 
> > Matt
> > 
> > > Francois
> > > 
> > > > +	} producer;
> > > > +};
> > > > +
> > > > +/** struct xe_pagefault_queue: Xe pagefault queue (consumer) */
> > > > +struct xe_pagefault_queue {
> > > > +	/**
> > > > +	 * @data: Data in queue containing struct xe_pagefault, protected by
> > > > +	 * @lock
> > > > +	 */
> > > > +	void *data;
> > > > +	/** @size: Size of queue in bytes */
> > > > +	u32 size;
> > > > +	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
> > > > +	u32 head;
> > > > +	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
> > > > +	u32 tail;
> > > > +	/** @lock: protects page fault queue */
> > > > +	spinlock_t lock;
> > > > +	/** @worker: to process page faults */
> > > > +	struct work_struct worker;
> > > > +};
> > > > +
> > > > +#endif
> > > > -- 
> > > > 2.34.1
> > > > 
