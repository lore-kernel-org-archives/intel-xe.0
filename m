Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C013C369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 17:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50F410E379;
	Thu, 10 Apr 2025 17:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+d24Hcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8C310E379
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744307259; x=1775843259;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2zC1nb2I5BaqDzUaExvCJIet1bPtlvvok5uGMV5sU9U=;
 b=D+d24HcbNye6DvDmiUYmHYGIdws3YSy/omm4Rfzfp/9ecluCe1oxoDH8
 h6phpgjzw5GZ06DrzKsubkrEWJDG0fE7fYpP2WCj7tDm6opiaSX6yC1hI
 UIulS/Nb5hek+Dxv+eKh0I7yXxJE+gQ5tYs6dCTEnUFQ9Ndwb/NNKennR
 h3WyckrfQAzbnjR7EcgNGLUoWUPPasNBonzKOqM9QixYxEeyfPjuvY+Km
 d2RXy6qwzRgNoNa0XoTsKlxO+7mWD23cBq/O+JYbKPZZy3IyIh6WGpG3r
 d/+T2U8OJOBNAGQjVbawTPS8xbtaEQJuf8fppI7j23V9hVGNIN7JdEle1 g==;
X-CSE-ConnectionGUID: zJoa+njZQcaveTjzUMfp6g==
X-CSE-MsgGUID: w8E2lBC4SaCMk3GfegdQ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45936190"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45936190"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:47:34 -0700
X-CSE-ConnectionGUID: sGiLXs9SQG+rCyi5jCP+1A==
X-CSE-MsgGUID: /9gVblmWTEmmLPoUdrTOUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129812635"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:47:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 10:47:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 10:47:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 10:47:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OONJktQ2w8wyLgQS/Nvnqe1LAGxu4DVkUqa1DQkGg4jeV8PQNvzjFYWIPpi3jrwCG05l2vGvayml/an5e73RsTNkcZ9jbkUk4gWU5T4tXn+nnkbl4YxbU80jAOa3I6/DJ4kN9wGGZsyqkdJGJmaDOuJLDSgLbDbYy6ROX5L2IhFu0FqVYDzS7zZi685mNqwtkUULkckXh0UgZuZdyQVuWoFjpsv4dNvW+J0PCxyjxX5THrbLsawFBumn0faytn+4OcZyqyDQdzVpykJafg328BXavLvozzwXHyMtPNJNc2maX+/im5PTpxPe2eskBxvXcB5wd/9MC/YbZHVeF825RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kh89YEDk0AUP0VekAyW8bvCk7ELQZ/jYKSgWWFN9s1g=;
 b=sXGM+jWQsgnzZn+o7xcapYr+2qQEbWYSyhkTizxTDsJkuy+ezqSWJ1yBZm1qadj0NLja1Z3LcMALKwzGlG78+MyFh+TGPFVpxnHAhlVoeiy5J4yriqp7a5EYvRTcMGyifro2N2Q6zEbtrQRHMUw6Ny9vgS5V7PxwucVtWPdmnLzjlLaVkUXI+d/q2Fb5ahE9WoI06X6WjSGgMX6YsKH3E98iAzk269MPF5e1Nhl47wn9thVZ46i15KNtKjtpnW+v0CRqtzys1tVXwd3KmD9tR/9TlDmESrWXm6+g4Zs82V5irL4+zARiTxSBMl1F3zdvhNXzw4EOwDPY2jcMvJRwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 17:47:28 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 17:47:28 +0000
Message-ID: <f6aca466-2aae-4a67-a116-38fb93d0a274@intel.com>
Date: Thu, 10 Apr 2025 10:47:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe: Add devcoredump chunking
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250410040622.238389-1-matthew.brost@intel.com>
 <20250410040622.238389-2-matthew.brost@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250410040622.238389-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:303:b8::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW5PR11MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e5347b-64ca-4d55-6f1a-08dd7857c28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2tnQTdaL3g1Q1AvamZWdFhGZW5CYzNjUEJncFRZMFBwN3ZtQmQybnd4dmh4?=
 =?utf-8?B?c2tvQmtKQ0IwZUFoS2ZuaGI2eTVRVm0wcU9JN214TTAvcnIvYTkrYVZIeDFz?=
 =?utf-8?B?aWlTdjBtNjJTeVVvTkdWdDg1MDh5Q20yU3ZJMmZYUi8yR1NyZFlNa0s0Sm9B?=
 =?utf-8?B?dm9NMEJrSUllY0FIUE8wT2pIYW1jMHZ5NFBZRVB3L2hpOCtCR2Q2eFpKQ3BW?=
 =?utf-8?B?ZTlYMXhxVUllRmZhM25pMHpYSVVKQWZuSzMyMGZ3ODJTNXBXYkJ2Z1Z3Y0JX?=
 =?utf-8?B?Z0hJN2VlcjNOUms5TUlZNS9EajZXYTEwTlNMUTM2S0IzSWNKNGxoRzhnenh4?=
 =?utf-8?B?cFBteDU2M0FUVldTMjFxZmlFeThtdnIwTFNhUXJOWXErWmphRkRFOGJ3Wk9l?=
 =?utf-8?B?RUk5K1Qwcy9uNU9VQU56Zks0cGs2bGQzbVorNStlK1hwak1ybFNaMzVxcGVF?=
 =?utf-8?B?YXBETVRxekJyQVZKZDkzRi91K1IyS3BZc3ZVdFNKM3NKRWZLYW80YzhyYmox?=
 =?utf-8?B?S0t3QWpxdVRSNmtzNlFzaDhYR2VzczRQQUFteWlaTDRsSDFtY3h3c2Y4dkNy?=
 =?utf-8?B?bGJhUE1UZjJlV1dJTUp5U2tWWDV3RjI5am9pd0trSkdyMHdDQVZsR09EbXpE?=
 =?utf-8?B?bExTU001ZXA2Z0JMR3JSQzlWSUV0bE1vWlRPTEVZTUJmdG9QOWF3alJYZms2?=
 =?utf-8?B?TmJuL3pOa3hpV1NITzNlOUpwa00rcTA4eWs5MzBrcmpHRklDYTVYaUN2OXNX?=
 =?utf-8?B?NTRSVU43RGxOelZQTi9aRTE3NXRzZkVRc0k2WEZyWEQwcTFKVkpkTUhYZlNu?=
 =?utf-8?B?cWF6ZmtYTGtnU1libEZ0MFppTGNnZmZsOTBSY2QzdVJMc3VxMjBuQ3NoK2Mz?=
 =?utf-8?B?ZGJEaVBPNXlPTjludzhqZ25qcm5qS09Pc0pCMDh0dUJDYnZ5L0xRMUNSdzc0?=
 =?utf-8?B?YjhhRG9QblpSVkk2NXFZMkgyN0JnaXUvZ1B2YzBBTk9YeU9YMDBvYmRKUXpR?=
 =?utf-8?B?eTAxWml1SGhtY2YwdzhwUWJOSWo0Q2VURnZVMFJQaGpEc0tTMmttV01OZWEv?=
 =?utf-8?B?T0tHOHQwM1ZJZ2djejNwNmtFQkxadjdUbHFPclk4M21HN1BlNk9LNkdpYzZk?=
 =?utf-8?B?eENSeDkybDRvWW5JSjg0eWhodHkyNUVzRXNEVlpKR3hVZXFid0NqYi82eStF?=
 =?utf-8?B?REozakxZM0JkOTlkWDZxSnJpdWR0WUZ2Zm1LNlBaYUtlclNaOEkwcjkra3A0?=
 =?utf-8?B?U1lmR0hWaituVVR1Ti9VK0ZmeEQ3UG83SURFamNyL3krdTZCcXZzQ2ZEblA1?=
 =?utf-8?B?TnhvaG9jTkNpbFl1MVFYbTk1SVM5RXgxaW1pVjJMQ0NZdEZwbGRRUVZpVTZs?=
 =?utf-8?B?MkVsd25xd2V2K0JBUzZwcUlHc2NYcS9OaXZoazIxTTFYeEZEdFJaazltcXAv?=
 =?utf-8?B?aFVSUTJWa0JrTEJ6b0puSFVQZFhhd3JMVS95cnF0RmZ2dzRhQVl6RlVnQTMz?=
 =?utf-8?B?UnVCZWZmeWNyYUdzR3dDeFBBbXY1S21ndVRzMnNKZ0srUEFtSjZKMDArbnBZ?=
 =?utf-8?B?WTZ2dzRYazFxWmFiYmIyRzA4YzBNVnVONzFnaGUrZEJ4Y0lvRi9uVmVod3F6?=
 =?utf-8?B?NGNEVW5iMmFUak5jTjRvV0hiN2tMdDNWSU5wTGptVnZNVndOalcrR2dRRURO?=
 =?utf-8?B?QW1HNURVam5yTmdIZFBkNC9NdTltcDFwSHZNdjRWWDhzOFRLRU5ueGFObnNK?=
 =?utf-8?B?MmsyWm9zUGRLOXN1S0lmaUptWG80aEpCUmtEK2lvVzBQVUx1c0RXSEh1OFNJ?=
 =?utf-8?B?UHFLZ21HLzlMbnBSQnQzVkJRZldRenBRQjlRTXl6M0RmZDQ2WjNJVW1teDRT?=
 =?utf-8?B?OWkySHd4QWl0L2pPSHYzOHcrWENWYlZRV3UxTkYzZkQ4cnZhMWY5UTF1Tko4?=
 =?utf-8?Q?4fbW+baqHdA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnVCMkhSazJDMTJmTk90QXVHVFNicFYxcFdMNWhQY3p5R3F1NEZFUGpDSlZX?=
 =?utf-8?B?dm9JeTVvRmVtdVFTQVhHN1gxcFRRS1FrY0RIbGtsaUJWaDZaVlVYMURiYkZ1?=
 =?utf-8?B?aXRyRTdpQnpIdnlBMFd2bzFmN2ordHJrNnpaTE1qeTdCcldUYUxEaHdITktM?=
 =?utf-8?B?bzh3ajVtTFNKUEFDVmt4KzhyYWV1SkdvUTJteko4YS93WHp1bTBUOFdVOWcx?=
 =?utf-8?B?WkdkaHY0cTA3MUY3SlB0TE53Y0tucm5BUlVIeUducjM3V2pTQUgrcVVxRkk5?=
 =?utf-8?B?RkgwNURZQlFhT2xPbVJKZ3pURWNVMkpxUGY1TC9oa3laa3N0N3MwTjJnQk51?=
 =?utf-8?B?M04rL3BuckJFS2RxbFM0MEc1QlJsRm1yMGlMQ3E3WTI2MTN5VXRTM0dIOWxM?=
 =?utf-8?B?Y3JpYURzRmFqcnFCTU9hWXNBTERSNFdENTZtc25lZTFmbC8rRUVteUltcFk5?=
 =?utf-8?B?Mi9FMU9qN0pVTzdRamxWU3BhZmxuS2xaTHY4SngwcGVleW5GaXlrbERqY2dw?=
 =?utf-8?B?MkpUM2R5bnJYWlgram1MWldOZFVFNWkrTGMzempzVmU0RTdONGNFcFYwMTVX?=
 =?utf-8?B?dEFNd0pZb1RtdE9LYk9uMUdSTnBWZngwL2N0b2xHdFdMZUFMcHh4YmFtVnFY?=
 =?utf-8?B?SmF4MzhlOVpCMEIxazVPcUM2NXJ6KzdHME1jV3pFcVBBSEJXYUNoV2MyWEVk?=
 =?utf-8?B?ZUxrVGR3aWdhY2o1dXpLUGtublBSaVdYS05wdE5nK3VlZ3dncnBvdTRHNGRj?=
 =?utf-8?B?UTd1YnhGejNMdjdURk1Ma0lvQzdxMER6dzZZaTkwQXM2Z21TdWQ0NzdSYzIw?=
 =?utf-8?B?ZlJ6VkFzU1RFWjc3eGhhU2ROcHpnYjcwd1BvVkJDWUI0bDM3b1FTU09DTkZ5?=
 =?utf-8?B?WXBKZ0tEWWNZd3Q4WHJ3SWtMaktGNUhSNEZTMlA5VUsrK3g5YWhGY0llSDhY?=
 =?utf-8?B?S20xZEIrUFhvUCtqdnFHN1E4SFBFbmRYUm1QNVNHbWh3VnNQYzVTZ0Y4YXMv?=
 =?utf-8?B?MU9lUm9YRlpMZ2JoVC9LWG5FcjFZdkdnWkxhYi9JdTFTNjVvUUlUQ1NENmQ0?=
 =?utf-8?B?VW1UdGhJalhpR1JFQlNkelgvcjlCUHpYNTdvSlRWa2w0OVBZbERUczhSWlNw?=
 =?utf-8?B?NVljekg0UzBIcFoyRytCcVhNNU5rbnJVR09wbjViZWdIWDNyVE4yUmVTZmlv?=
 =?utf-8?B?WExhbnRwVGpNRG9SaFBTd3JrazdZcnNDeDlLWUl3ajBZQTRKRjR0aEM1Q3Bz?=
 =?utf-8?B?T01DQnJRQTNDb2x4TFNpenBpZG5idXk4anFtL0lZOFJ1a29OTXFRR0xpSXFW?=
 =?utf-8?B?Zk0wSUVNUXluNDhQMXpGd3lDL2w1NCtvcjR0Z3pHTkdGZmowb0ZxcU1Ba0Zl?=
 =?utf-8?B?R0hWbEF4OWJKVUhmN1ZXUTFseGdVTHdZeTFzSDR5L21ZTmd6OEMxaWpqMFh6?=
 =?utf-8?B?QVBaamM2Vlp0UnlSdTFoV2dMR2lvYmxXVk5XVDhLaU43cnc5SWhRYjdEUnY2?=
 =?utf-8?B?dlRKK3ZXNlozekdiNVNDT3JOTkU3dmxYd0ptZWNJdjloUmVCVjRCa0VmOGI4?=
 =?utf-8?B?VkNEVFBJYkwwRUg3NHdJcUZHdm13VTJQR2Ezd3FRT29tTlpicGVzeW9ObEJN?=
 =?utf-8?B?Tm1XQk9SeHhkL0FTbVFKK2Ftaks5RTg5Sk1sWUlxOG9FSkVodjEzbWpMWmtP?=
 =?utf-8?B?QkFObmlYc3FpcTdrSGVKS3EzeVN3T2ZPclFIelNySFlvcURyQ0hVYzlnbjgy?=
 =?utf-8?B?aDhhRVdlYk1pUGlvekNVaDVuNkMrRGpKVDA2bTdXMmFvdmtLZ3pBRHQrTDAy?=
 =?utf-8?B?QkpWY25JUy9odUJNSjhVQ1BFVFQ1Qk1lTXdSckV0TDYyNFNTTHI0S3VCc0Ji?=
 =?utf-8?B?QldTeENZYmNCNlQvR29PWjVWLzJQNktobFA1WWpFTktaV29xczN0VFh3Y1Jq?=
 =?utf-8?B?SHdnd2hNaldtcFFMRWJiaHc2UUdlSTRzbWhDeWhDYjF4dmJUWmtwbk9tT2pG?=
 =?utf-8?B?VWdhem9VRm4rTCt6ZTI1aVdlaFA2bXJMWnluVlV1VnZzbnVMTjNNS0NndmVJ?=
 =?utf-8?B?Wjd3VWJUbnNLa2ViWVQySVdqeGJ5WG8vZWxCc0N2Q0c3WWZpYlc0Z1VDbVBZ?=
 =?utf-8?B?bGp2RithRlZhMitSbWNCR3M5TUxGelhuMTdkd015QTBld0loejczbjdDbHZI?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e5347b-64ca-4d55-6f1a-08dd7857c28c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 17:47:27.9845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB9USa/kW11Fq5B0MDHgm4rzsLZfbEM2KHd1AniY954BS8RP1JTAyA9N7P854mHsdqAACAUh56FYZtW9HExzCZKKesWQIkyB79rWMsD3ejY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
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

On 4/9/2025 9:06 PM, Matthew Brost wrote:
> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> callback as needed.
>
> Some memory allocations are changed to GFP_ATOMIC as they done in
> xe_devcoredump_read which holds lock in the path of reclaim. The
> allocations are small, so in practice should never fail.
>
> v2:
>   - Update commit message wrt gfp atomic (John H)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>   3 files changed, 50 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 81b9d9bb3f57..a9e618abf8ac 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>   	return &q->gt->uc.guc;
>   }
>   
> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> +				     ssize_t start,
>   				     struct xe_devcoredump *coredump)
>   {
>   	struct xe_device *xe;
> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>   	ss = &coredump->snapshot;
>   
>   	iter.data = buffer;
> -	iter.start = 0;
> +	iter.start = start;
>   	iter.remain = count;
>   
>   	p = drm_coredump_printer(&iter);
> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>   	ss->vm = NULL;
>   }
>   
> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> +
>   static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   				   size_t count, void *data, size_t datalen)
>   {
> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   	/* Ensure delayed work is captured before continuing */
>   	flush_work(&ss->work);
>   
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> +
>   	mutex_lock(&coredump->lock);
>   
>   	if (!ss->read.buffer) {
> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   		return 0;
>   	}
>   
> +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> +	    offset < ss->read.chunk_position) {
> +		ss->read.chunk_position =
> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      ss->read.chunk_position, coredump);
> +	}
> +
>   	byte_copied = count < ss->read.size - offset ? count :
>   		ss->read.size - offset;
> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> +	memcpy(buffer, ss->read.buffer +
> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
>   
>   	mutex_unlock(&coredump->lock);
>   
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> +
>   	return byte_copied;
>   }
>   
> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>   	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>   	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>   
> -	xe_pm_runtime_put(xe);
> +	ss->read.chunk_position = 0;
>   
>   	/* Calculate devcoredump size */
> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> -
> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> -	if (!ss->read.buffer)
> -		return;
> +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> +
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> +					   GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      0, coredump);
> +	} else {
> +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> +				      coredump);
> +		xe_devcoredump_snapshot_free(ss);
> +	}
>   
> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> -	xe_devcoredump_snapshot_free(ss);
> +put_pm:
> +	xe_pm_runtime_put(xe);
>   }
>   
>   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>   	if (offset & 3)
>   		drm_printf(p, "Offset not word aligned: %zu", offset);
>   
> -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
>   	if (!line_buff) {
>   		drm_printf(p, "Failed to allocate line buffer\n");
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..a174385a6d83 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>   	struct {
>   		/** @read.size: size of devcoredump in human readable format */
>   		ssize_t size;
> +		/** @read.chunk_position: position of devcoredump chunk */
> +		ssize_t chunk_position;
>   		/** @read.buffer: buffer of devcoredump in human readable format */
>   		char *buffer;
>   	} read;
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index af2c817d552c..21403a250834 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
>   	if (num_dw == 0)
>   		return -EINVAL;
>   
> -	hwconfig = kzalloc(size, GFP_KERNEL);
> +	hwconfig = kzalloc(size, GFP_ATOMIC);
Did you work out what was going on here? It seems like this really 
should not be happening.

John.

>   	if (!hwconfig)
>   		return -ENOMEM;
>   

