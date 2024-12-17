Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEDAE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 18:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4542C10E663;
	Tue, 17 Dec 2024 18:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xhcmlw3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FBE10E663
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734461507; x=1765997507;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3vXjIrw1rZhce/gH/US5fMYRS5dGRHcdMr/9NxSKMbU=;
 b=Xhcmlw3wCkaod6G3MtHzzbVxFu2eAVaGy8Yi9fePc/7Nn51DfsjqeujC
 2GXQ9EfkWQfYxA6Oj1asqNCWghMAlEbp9cB5kFBwP1IgzjZ/OX61bbHVX
 UYensCvR2kbSA1GR28/b0mu7OLkXhuGIyT+sj/GWOCYJfwCNJXwFSghLp
 p4cWBB31INUsY8j2/3gnxj/s3+xzw6kySkY9abkncA4k/IpXt/X5hWBym
 9nqutvua0OSM55K2xXlJb85lDmlvVp1BumgFMBc143AkwBOLLJmTutgbw
 72Kp4spf0GLLV4EfKco7VPYoJXTPlMMX6OnH0ONKQP9J7OtwHV94kOq4D A==;
X-CSE-ConnectionGUID: afKEKaOcSc6xuURYOPN+Fg==
X-CSE-MsgGUID: a0rEBgKySuOm13ncrl3x6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="57381904"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="57381904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:51:47 -0800
X-CSE-ConnectionGUID: LMg2dgaYQp6oRMfODSs3aw==
X-CSE-MsgGUID: wZ8YM/lXRVC1rTl2nZxwMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101753640"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 10:51:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 10:51:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 10:51:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 10:51:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUyWdqVGM3lI3JQODRiR+MbF3Cu496qXLRBPZnJNpIwCaj2K7fVLD32blE9KErR90eXCVLLaw8+jM3U7utMniB7rXS/OxRiIVNyZ5XJuan19WbAS+bZ2s+PVSTr/DaR5H8z/lm4TpEkyuk4N+BBBrc6/GSiecVqoM1ziR6Rw4Wtt6o+nflb5zEs5TOFW6A0BL3ktDk13+iMG2hBt2jMqwsETvDNx14TfjiLWtvW9NMPvX9izRatMKDhGJYXydf/UD5nTEQvNCRBsI6aJiW3OnK/QfaxyHlYuHTTcPfkKlBaPNCF7YaBmnL3qe0O56JJxiBFmSIIfi/Y/u2k2TcNxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLEO7TUkcZ97O0ngO+EcsRjWCqie8CZ6nivS46kPjDs=;
 b=wY5RI7EWVtcSaLvbFpDbIA6JkVmxnS2hoz0LZwCBevVChNZGlBoIAm/HUOtARbP/61x76ylBlvintDhLn8DvXYLLVtwyw5fFKmIdD+jmD4wPVT8TViXhmVC3jQSj/bjKYJGOy3+bihsF3azam62skL3TPX/L8F+JvKxx3kjTjB6gdvNg9ZMymx4gzs5aFXi0chy1rRNwnxJzusV53iJ9VXS/M5CWPEgzmxDqH9mkd9aQf1/vOvHG2JCyOLjmKIEXx4O6stNRg/TrSrTDgqGLwE4g9KdlDMuOeMQGakaXOrnxmljAWkEasT0hNMKX2g2FxtDfmCjaFU3jAcTYwxBx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 18:51:43 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 18:51:43 +0000
Date: Tue, 17 Dec 2024 10:51:41 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH 0/2] Fixes for MI_REPORT_PERF_COUNT
Message-ID: <Z2HIPT4fZPnpsD58@orsosgc001>
References: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
 <86588b9eec3e3b59a30fcd3aae1481dca21a651b.camel@intel.com>
 <fd6204d5194f31a7fd4592849a1ba5e8cf02d26a.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd6204d5194f31a7fd4592849a1ba5e8cf02d26a.camel@intel.com>
X-ClientProxiedBy: MW2PR16CA0053.namprd16.prod.outlook.com
 (2603:10b6:907:1::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 4875280b-8854-4129-5f27-08dd1ecbd97d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3RnTEhJVWRvMHBINzRIQVBiejFydi8zWllyNlVCMkoyTDFwT3hlaXV1MG1F?=
 =?utf-8?B?OUxzZFpEdDZydkJyZ3JCNzZyWUNJWlVnQ3ZTcUdrd1A1ZW5zTWJpdWlsVENL?=
 =?utf-8?B?NUk4Rlh1WjJ1ajRUWTRyeVI3eDNVYWE4YW5GOC81M1BwSXdQejdYdlEyYk9V?=
 =?utf-8?B?N1o5T3d1cFpNc2hIOEpHUk5ITGV3UWlJV2JaVDBSL2JHV05VSU5ZNlprK0pq?=
 =?utf-8?B?MW5lRHk1NzUwZGRGa0E4ZEdBMDk3QzcwM2F5QmUveVlZblNtY3NjSGJGLy9v?=
 =?utf-8?B?Znd3bFBZQ0ttdlFFdm9JQ3JhMWJnVFpVUUIzb1pTRFBlcW9oK1hDakpJdnd3?=
 =?utf-8?B?Z1p0VFVtRkU0eWZaN05TNUdDWUl2RTRKdy9sZTRzN1JmUFJTZms4KzljMDkx?=
 =?utf-8?B?S0NONXpsMWswZlROUCs1TFRCTitDcWhRdGVHY3FLK2lYWmVDVkxWL3l1a1B0?=
 =?utf-8?B?bzR2S2FHVU1rVDJwRThJY1hrVlB1bnp3T0VDV3o3NjJhV3FmWDJ5OUVGbTQ3?=
 =?utf-8?B?YTM1WjJ3WGh0bFhZaE11NkhhaWNHbGFvQldDejJ2OTRDMkVsOVJxMGhzNjJu?=
 =?utf-8?B?aTVXZVRTTytndmtXVEJ2QnBrWElCY3RCVkx1MzNnTXNJY3pZYWh6bVFhUTF5?=
 =?utf-8?B?Q1Z6NU43RUdFamI0ZllVUU5CQ0xTUHlQd2JFQTFxMmhweERHQ1paTExOT0hr?=
 =?utf-8?B?VFFUaG41VE55SXQ1bjZUSzREWXhma2NqME9ndXZIWHlnbWpZWnh2RkNFUWVT?=
 =?utf-8?B?eGRRbGRrc2gxR2kwbHpPWHlFZEtvUXpma2NWY3Q4L1NNbVUrL0lqTElTcDJP?=
 =?utf-8?B?U2QvbHJaQ3NCRjlDUkl3bXBrNE5kVFFOWFFJYmFmWnQ5eW5GQ21jYzAyMERv?=
 =?utf-8?B?bkJKU2V4YTZBRy9yWVF6d3BpMWpTYlh4R2RobSttSW5OUzBORDZmbmViV1dR?=
 =?utf-8?B?K2xHYU1jMTJnUU5hWDgwUU5Oa01iRHA2VUVjSGNLY2VsVGJsU3FwVHRDMkxl?=
 =?utf-8?B?VjhTeCtWSGJDL0k5TktOaDNjTmZVK1R0S05MWkRZbDAxeFlrK2xoNkVBT1E2?=
 =?utf-8?B?Um1NWlZHY3p3bTEyNytxb2htdmxEbDFVcUVWYTdWU3VHRGJHTUMvQkt4K3Jm?=
 =?utf-8?B?RnB1SDhvODd0M0c2dVhNMGk3d2RPbXB0UFUweElmdTVuSHdvZXVPeTl6S3pP?=
 =?utf-8?B?QlJaVmpuT2MvMDlZWWhwVGt1NjM2QVVTR1RCWGdWTnlqSHo0cEo0RkRCUWlr?=
 =?utf-8?B?S3hMWVhFelp4MUZSLzFQa1RBRHFoZnlVUHhXUUpHY2VHdVA3VGo5NHE5YjN3?=
 =?utf-8?B?eUJTOVFIMjhQK21kbUdrWU5iV0JpbEEyL1ZZZllsUmtmSnkwOHo1S3VtR3Va?=
 =?utf-8?B?VlB4M2xEZEVWZmJ2NXNvRjNmTDM4UkVrUFhCYk5WMDhjUFVSM1EzRmhpbktD?=
 =?utf-8?B?aWhiYU1UQWZleFlxUzNvRzlRcE0vRFptYVFERDZNWE0rS1BSK0FQWnZRNkRM?=
 =?utf-8?B?MmkxYmhuKzFWbmQwVFJOT0tJUTVkcXRTbFp6MVN3ZlpPeGNVWW9yejdobk5l?=
 =?utf-8?B?V1ZrWTVnUVozNGxjVkpJYUJGWlpMRmJTZ0hDdlJxeGM3bmRYdkFNR0NvLzFj?=
 =?utf-8?B?eTA0bW91M054NU9JU2x4Z1Q5cWE3RnJrSkowVWpiV2RzOHk0WTcvTm8rTmxT?=
 =?utf-8?B?YjJzWEFyQnBPVkt0bk9HTUNTVHNtd0NRb0F4NzhoWWNQTkRTVW5TRFp1a1Uw?=
 =?utf-8?B?QjRERkhNTWxOemJhcXBwRWkrTHVaQ2lSRnRaZlZsdGxQcHVJcGRKanJXdEZX?=
 =?utf-8?B?QXE3YlowdlpTWWhCbThtQWFsbEh0OWY5d0lQZkN5ODU1Z0pjdzc3VEFxaURo?=
 =?utf-8?Q?rvVm0Hq+2pQRA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hQMnhWeGZjSkF0eWtzYkpPOEVMblRjOXdDT0xMZ3ZPRGpENVROdncxN2pa?=
 =?utf-8?B?YjFCWVNaWkZNQTQvUFJzaSt1aVY3ZDJUZm8xM3JsQnEvV203YTFYemdxNjAv?=
 =?utf-8?B?c3ExdkxXMFp2ZXRDVzdPRXF2TURQV3V5VURLS09kZjNqcHRObnVMZE9JbFls?=
 =?utf-8?B?Y3dtdkpDTGJyK0N2aitzNklXU3N2c3BId1RxRXZHbFR1TGtnakNlbE9ucUp5?=
 =?utf-8?B?UjFPSUJidWVCUWE0NGIxN3lDSUxOQUZ5Ym5IcDlackVET1ZBQWpsZThJR0hK?=
 =?utf-8?B?aTlzTEFXMmpLQlVmUnJOK1B4anltQlF5ZUZrMzdUeWFIQjcrdUlhemZPaGh0?=
 =?utf-8?B?VU95eTY0ckpJWjRKWis0MWVJUzByZlArTUVyZVBid21XRlh2TU44WGVBWWNL?=
 =?utf-8?B?NHNrVStLWFVVMlRhSE52ZytEVWRLUVYybGlrQ2g4RS9PWXJGMTdrTUVaVmJv?=
 =?utf-8?B?YkFrZFMrS3RTeHc2SHNNa3R1MHFQaC8ra2gyUVB0bUN6MzR2aEpXVXZRMlV2?=
 =?utf-8?B?Y2UySHRiV1NhVE5SR0ZVMmRWa3hnbGgvdFVKZUl4eGVPVFo4NythOXNFYjlB?=
 =?utf-8?B?VnNBQ3kxdkI2MzlUTlBnWURKdWxydzU3RE9Fekw0cWlGSUsxbW1QM1B5REdl?=
 =?utf-8?B?aFhXSFNYMGJnb05EQi9pK1g3M0RMV0Jub2I3NlZ1WXc5a2NiYUlOSWtITHZV?=
 =?utf-8?B?WURLZ1FpY1BNSjFEZWx5a0RsYUFzeXlheXFEQWlmeTFBUU5sRTEyTFlkcy9R?=
 =?utf-8?B?dlF1eUNwN01CTkcrbGhPbGNLMEQ0eHNDTndEN2ZZNjA0Y04ydG40VjJoS1Z5?=
 =?utf-8?B?VjNsRmhhQTIvNlFrUXNsRlA0N2J2c1NsWS9CbUdoWEYyOEdzeERqOUYzZWNp?=
 =?utf-8?B?MDU3bVU3L0o0dEFydEJTdFRVbGJ6YzlxVmkxRFJUUGZCMlB6WGdDbTI3NStY?=
 =?utf-8?B?K0thTUZZeEliUFY3WGdya2ttUGE5Q0Q0VlJaSWZGRWRrZWlpWE1sbFlFaFdk?=
 =?utf-8?B?RUJZblk4bFhqaGtoeG92WTVicG9yRi9VeU9KZ3ZVRjVCWFQ5MUxQRTVNYXc4?=
 =?utf-8?B?QWJ5YXU4TG9qT1B2WWMxV3dRVmZEM0NScEJPaklCUzBBREp2azdvbTJhdjJH?=
 =?utf-8?B?dWlPM0I5Nm9wQ0k3WUt4QjVpOHdtaHFRRHJLcmMvTWhPdWp6SzRhVy9jVDV0?=
 =?utf-8?B?cWZFSHUrSE9CL2l3Ym1pYk9CampjLzBYTzhxdmhYdEVMTCswZzhZK09aeXVD?=
 =?utf-8?B?Ym9Sc0NIRjlXR1BGT1R1b0Z4akpWUmticzJ0NjNqSmx6Q2lzYkl1UlQwYmVD?=
 =?utf-8?B?TGJBTEhuT3d5UndPTWQ2RlRXa3FjbFdaL01QK2VjK1Qza1pHeWVQS1BjZXVu?=
 =?utf-8?B?dWw4NTlUSkMyNm9JZHk5S2R1SlNTN3RHSm96anZrUmVPa2dpazBGclg2a2M0?=
 =?utf-8?B?SS9keFoxWFpmYnNabWQ2L00xU0IyeThzWkpKbHNYQnVVaUI4dW9vZGZSWm5q?=
 =?utf-8?B?Mm9pSkhOdkZaQU9jZnhlNmJiN2ZYSXJTQnpadEh3cHBKejJVSVgvY3NNNWNZ?=
 =?utf-8?B?dGs0SzRjZGhYeDNuUEVaM0l0KzRueTB3UUpDREp0ZG8vNExpbVN4UVpqOFV1?=
 =?utf-8?B?RDhLeTRwc2hJalhpN3huREV0NXR2NDhlZmV0ZkNOVEFHL1hmNGdmSjd4TWl1?=
 =?utf-8?B?eDY5VnVBQy8rVG5QZ1R0VWJ6dXlCSVBhSU1QWjJaS3JoTW9vOUl6ZnYzaXgy?=
 =?utf-8?B?SU5vZ2RtUkhNdWVpZld5R0dLOE9lMDVkeHVsZU5oRzhGekczb2hjUDFsTDQv?=
 =?utf-8?B?ZVdsV0p0Y0ZMY2dHcFJJR2tvb282RGRYdmdkdklxelVWMzkwYnY0d3ZkbVhU?=
 =?utf-8?B?WlY1VlAwODNqblRhM25pOEJZUy9ZTmhUUFJNcDdxS0lmQzBDU0N4MnNYMkFk?=
 =?utf-8?B?OGErbm41NEY1V292NlMyNzBPa0dLWEhZTGFiRk1MSHlEY0ttR2llUW9oMGZU?=
 =?utf-8?B?MThsVmFmTndJWHA4RHp3TklMT1lQaXROZDNaT09FNVdPcmJocVlUOFVzUkFG?=
 =?utf-8?B?bEtJN3lMYUErWThOSGxqRHpWcUxpMDkzV2N4akkwTWhUWU9IMTFhcFJpSkVO?=
 =?utf-8?B?d01pWmo3VDVwZ2llVlcwYS9pZUlzTDhsRDBFNnNVM01XemRnd2VRZlJ2NkRU?=
 =?utf-8?Q?LeOZgtWTEz2oLL21MtE/sS8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4875280b-8854-4129-5f27-08dd1ecbd97d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 18:51:43.4544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAagBz07CPojo3vDizg5cYdwvd1ArM+0TrfjTkgXQHI5+McG+34rUN2P4uuVvsFUquDGUVf9qpyBNkLyEniIVhcLVWFp4ns13tWbABaM7Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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

On Tue, Dec 17, 2024 at 09:13:12AM -0800, Souza, Jose wrote:
>On Tue, 2024-12-17 at 17:05 +0000, Souza, Jose wrote:
>> On Mon, 2024-12-16 at 16:58 -0800, Umesh Nerlige Ramappa wrote:
>> > OA programming sequence for query mode or MI_REPORT_PERF_COUNT requires
>> > modifying some HW registers in the same hw context as the user exec
>> > queue. User passes the exec_queue to the OA interface and OA
>> > implementation submits an MI_LOAD_REGISTER_IMM to this queue to modify
>> > the registers.
>> >
>> > The OA implementation submits a batch mapped in GGTT to the user exec
>> > queue and hence, some plumbing is added into relevant code to enable
>> > that (as per suggestions from Matthew Brost).
>> >
>> > v2: review rework
>>
>> This series fixes GPU hang happening when close OA stream.
>>
>> Tested-by: José Roberto de Souza <jose.souza@intel.com>
>
>Ah can you add a Fixes tag to 8135f1c09dd2eecee7cb637f7ec9a29e57300eb8 ?
>Would be nice to get this patch backported to older kernel releases.

Sure, will do. Thanks for testing it out.

Umesh
>
>>
>> >
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >
>> > Umesh Nerlige Ramappa (2):
>> >   xe: Allow a GGTT mapped batch to be submitted to user exec queue
>> >   xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
>> >
>> >  drivers/gpu/drm/xe/xe_oa.c              | 71 ++++++++++++++++++-------
>> >  drivers/gpu/drm/xe/xe_ring_ops.c        |  5 +-
>> >  drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
>> >  3 files changed, 57 insertions(+), 21 deletions(-)
>> >
>>
>
