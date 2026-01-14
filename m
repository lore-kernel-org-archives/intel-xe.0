Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01643D31A02
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 03:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9097610E002;
	Wed, 14 Jan 2026 03:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2g6t4Pw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F09B10E002
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 03:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768362053; x=1799898053;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=R5cjlj5FEhfcYmkkOiyzo5M1CbfJM0AigzcYZ93tUwE=;
 b=m2g6t4Pwu/G0Tfy2u5meIzunK0yE8NEweFQtKMJY1XYG7J5EMN4c+cFT
 powxeo/2l6GGNO54ChKpUP9/uMi04UzE/MkFldLPtDr0fUfVZUu1oTLW1
 tSoYrVOkMyK8LRzHkPSyyjYIZa1Cw/9GBftJbQW/KuzwqUVrn1pVC/vM6
 +e9jO1wP0DtPuLH+bQJz1b7Ta+DsJDKQYaFyz4gafEab2gj6JiPvOrxpC
 K7hSnIXucbRQmhPCgdwedRB14hXSwfWNoeQlL8uqoQw0mb2LCjQc5pznR
 atUsRzmKP7kTc1z9EWzuYbQuiIDAITwcfpFkVpWPa5oVoSK9vBkPaW1KC g==;
X-CSE-ConnectionGUID: 2bZvWOPCSz+VpEAduXPXGA==
X-CSE-MsgGUID: Pr2Dl5cDQTyMvBgGbBdcYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73513165"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="73513165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:40:53 -0800
X-CSE-ConnectionGUID: 0R5S5vBPR1+whGzSiYNVpQ==
X-CSE-MsgGUID: Gi0p8Pa9SYeuDfSH7N9pUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="203699203"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 19:40:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 19:40:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 19:40:52 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 19:40:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKkdcD1TQiztdc+t1xsNcOA9j854Yv9vXrynumMA1uJwSsWZxs5z78E2VaVsx3O6XijrU7WFZNjHBd1/l0OUkxmol14SMoM9+rreFVCpjwCNZksx7jMsUbhox5hgoGjM2t2SAS8vl//dNfD5fgHOFou5cmyTEwRlV00DIMGo1elpLHDtL87dSlNMFtQRzPF4A/qmZFQfjcToAPqgP+i2NzIiqyluIInXjsEgLhUJaQptx6xg/V9QsaqXinrcqVEDrCVzvi2vdif9QOFmEl8RUlYEANZUbarb57FffeS4OLJ7JlZbSMSwCcj+ahLh1WWBH8FKbiSvXY1rQ0nYKozQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6m75bBIlghyr9O7U2/jLICJ7OXomwPlpGKMVH3u3B1Q=;
 b=K51bxBSNtLwCPiVfTRcjWNIZPHCctfCtcOa2GPCaA6nV/Z4UMjuBTqjrPZ3ylIIxomGbLr3lXEsjx+sEXQ1dRkGrKRPmEs7DleMLO9dMmjrmsXFLjrs70yTLHrUwUZyLCzHt1RCw2h+4kz2mpiVDH10A6gdpZaKIwrJ72oa6YBnc5sk0c/1nc+mksRyc7h58WWnxiGTmIxmF1TFcFo4W6jijwRD6/5YhyYUuQivrRLi+meNmjxnwRu/1KNqhCI/SCzYBGhGV/lcBic8Y0AqA1I8j0EOHjrSMhGBng/YFLvTq8wfJVUYdMcVXgr5uoSo7Oo7iL0PtTZXuVoFltp7EHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 03:40:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 03:40:44 +0000
Date: Tue, 13 Jan 2026 19:40:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Akshata Jahagirdar
 <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add feature to force ring-based TLB
 invalidations
Message-ID: <aWcQOi7D0j4t2BDS@lstrano-desk.jf.intel.com>
References: <20260114000421.331082-1-stuart.summers@intel.com>
 <20260114000421.331082-2-stuart.summers@intel.com>
 <aWcM/ODpvs403f0z@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWcM/ODpvs403f0z@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 98034a5c-5481-440d-b8cb-08de531eb2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGcxdXdObVhlZG9ENDdxc0JLRmF0ZmJJSTJxTktYVFc1Yzk0a3hOWFR2Qld4?=
 =?utf-8?B?MGJ2VC9aYjRpNXE5SkxuYk5XRSttKzliVWVicVpmc013UTltTHlZRlR4bHpM?=
 =?utf-8?B?WUR6MFJ3cjJ6enNSaFYrTVVkYnNsUHRZd0pGR2ZUT0hYSVdDbFVaSlVxS3dR?=
 =?utf-8?B?aGtLY0NIWVNtWFNoNXpzelZyc3FDNmJrZ3BKZHJhdDJlOE5YTFgxczZwWXZS?=
 =?utf-8?B?bmZrbHNRNGsvMEhzUHNlYkVpMWNnTHdyWDRUV3AwUzlvZEI5N0lZcmRJdWF6?=
 =?utf-8?B?QXFvNEZhVXFCaDJ4TkdnTjE0WHpEQlhDcC92Sk5GVldVcDJIWlZ2YVFPNlVs?=
 =?utf-8?B?TE9Hd2IxdTBBY3UxZ002TWozc0gzanZmNU0xSHQ1MVI0Wk1lSmJoT09QUjJr?=
 =?utf-8?B?ZCttQVhwNWExejQrTHZzaVpMcEZPSXdtTEhxbWtDNndmYVZFNDB3WjFSVmRM?=
 =?utf-8?B?eXFYQk11QjFqT1VkeHRWTkc3dWFrVkU4c3creHZiM2Z2UlRxSkJXSFJkc2hm?=
 =?utf-8?B?YkRSTExUbUkrbDd2RkZHd2ovc04rditLM1hJOEtRVjB1aXM3RXFKT0JKNXJa?=
 =?utf-8?B?UUpKd2lmWVJQbWlVR0dXamtQOThKdnJDWUxPMDNEbEU3SXBINFQ0OUk3K2t2?=
 =?utf-8?B?SnErMUhnMy9zbTZ0WkdhMmhSN25jdUhZdGh5RFZYejdoZndmV21vNHBuOWJz?=
 =?utf-8?B?QlNSbktTSHJncHVHVTVHNEdsWC9TdXNhUlp4WG0zcW5adElzVVdpM2tsNkdP?=
 =?utf-8?B?Z0QrMTNrd3hzRHhwZVl4Z253c1RWdjZxdzBHa2pBemw3V2pXajdKT1M5b0c2?=
 =?utf-8?B?SWttV3RuWXd2Uit6ckVZUit0TTF2T1E0K0I4SUhhU0VUNHQvZXYycmRNelh5?=
 =?utf-8?B?VWVockp0TnhPZU9EUVorK0FFdi9zYTdpajVvZzZrZkRNMU9iZmowYjBFc09I?=
 =?utf-8?B?cXd4eHdFSllCSDFabXhyQUROSUxGTEdIdWVCZE1raGJUcWl2S3FMblptUC8z?=
 =?utf-8?B?YlJVZDEzOXZOR2pLeHQ1Nzl1NlZBbnRQWWJ3ajZCMkFRVVhWWVkxUGxIWlZ4?=
 =?utf-8?B?TzBRYk0xanpMbTdIOTkrY1NBT0lDVGZva1p6S1Rza1FRMnZPUysrTWZoaG9v?=
 =?utf-8?B?UUhWaXFiMTFQZDY1RS9PY0lDa2FndFV1am0rZFpQSkFmK2VqT0ZZNEM1aXFw?=
 =?utf-8?B?RHNhVWxKR0FNM2dvOXRaOGJsNzRrRFpGUjFwODVEVWZ6aUFlSVZPTkcralV2?=
 =?utf-8?B?L2xUbHZlbTBzTUF2TnlnYzVUVExoSFlubEFKMCtYWU01Umo0Nk5OYjRzTmVr?=
 =?utf-8?B?VWdNWk52UjFveFVxazEzR29aY2dRc1JJRTRndkFaMVBsbWIxRHI3N3BaZEpQ?=
 =?utf-8?B?dTMwOUNlYTQ4SVNGeG04Tm9zY3hMeENqcFZBQ0JhL3V4eUN5YS9qNStaL2hq?=
 =?utf-8?B?WmdldVg1UXlGbGtUcDdDd0RJaE1YRzAyV1l5dDlTSGc0a0RzOFFIVEMydWdQ?=
 =?utf-8?B?ajcxYXNZWWh4c0JPdnZWS0pZa1ZWT0xYRW90MDgvdWgzY3VpbE82VHhOWjhl?=
 =?utf-8?B?UkJNeDJONHYrcVAvaklKVEdGbkZ5WDZIRnNjdnQzdmFZb2Q3WWRZNy9ZWjNB?=
 =?utf-8?B?TlNSdXdldHRxVzJLaXl0M3luRS84NUpuSm4vd1dhdWN6RDNBd20ySVQ0OWlM?=
 =?utf-8?B?aXVSaDlnM1hVeUU4OTZNdm81MmZNYnN0emh3VlZtb0thS21EK1BqYXdBZ25h?=
 =?utf-8?B?dElYd25FQjJGdXVxdXViNFpRZk4vQy94L3ZWN3p0RExkbkkxSVJnUGtSbmQw?=
 =?utf-8?B?OXFoYmw2Ky9ISGYvd1VSZ1JNdkFKTzluWEJYZEN0V0dBeXV5SnczZXJKclAz?=
 =?utf-8?B?NDU0V0lZcmhnQ1paSVREWFpVVGJBaFBnTml4SzB2MmZCOXUwdjFsK2FPL2lH?=
 =?utf-8?Q?Kb89wGOYEgV+t3v8uKlRIhF5nerwTjOm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVpoVjhtS1pVVFVzSUNhV3RyNy8vazhpRlNBVVRyYVN3WEFERHpvL3VQc0kv?=
 =?utf-8?B?MVpCVEI0ZDNmUVdXRVcrNEJ6YzVqNjRjODdFdnpnNldqaTF6UG5lMW05bUFM?=
 =?utf-8?B?dzFLTzJlWUZqT01sZkRFaVhFcFF0VVFxREErMlFuNXZRQWRqMy9jVWN6QURW?=
 =?utf-8?B?UnV0MkM1NEs3bGx6dFJpQ295eHFzMGs4MjFDaFNJSGRxUXhTUHpFNW8rTnUx?=
 =?utf-8?B?UC8wclN0bm9wSEZYZlVsZE5ENDNaamhPNzM3V1QwRW9YOW0zYmI0Z1QvZzhY?=
 =?utf-8?B?blIzN3Q3WHBOVW5HT0JYQXFDRFRwcFlFY3BnTVhuRVk3T090NHBydkxWcjB0?=
 =?utf-8?B?M2wvZk1heWcvcXdQV2UwU29UVTVkRFRVVEc1aHdxV1FQalJPU3dyMDVzWDdO?=
 =?utf-8?B?ZmhYNy9FZkVqemh1L2xhNW5UaXVBSnNzdGhmaDZIaHM2dlVwQTF0WElWTzJj?=
 =?utf-8?B?dXpQU0VVbG5STHdnRXlHQ1B6ell1TjNBUzFvQXFRK3RaU0xwc0g0aStVekcx?=
 =?utf-8?B?dU82K0ZmOVI4cW52MVhvTkRvQzczS0d4OW9vTitRbEZuNWE1eUFTb2tvQXU3?=
 =?utf-8?B?eXB3TThRVlhnTWE2a2FVOUpkZmFhR29Zd3h5YmVPaEJwUUpjWkRxaUt4b3Bv?=
 =?utf-8?B?Q2EyRzc0SE90Zjcyc1VXSENEOENrZDlTOEVBc1dEZG8rV1NUTzFwYm5Gb0Qz?=
 =?utf-8?B?c2V1SkZkdVF4S2tJMkM2MDM4VG9qSEhrMy9wWlYyck8wbFBzTWRiNHpLcjVM?=
 =?utf-8?B?ZXJsbVNSSDh5VTh0aHo1SVJDQ2JkZlBwZDBpVEJ1cVdjcWYydk83clM2eXhi?=
 =?utf-8?B?OFdjajNJaFJiMG1Ra2gya0MwWEdtOGlLN0RhS1FPSzc3eUlOMnVpUytUTlhF?=
 =?utf-8?B?V0VTcVRZcFE5akVWck5kazQrUkZ6RXJrZVMyME1UT2NRVFJBS0c4Y0NUdXNK?=
 =?utf-8?B?Zm5LaGJXdm84SE5RZ0paRTY0R3Q0QTU2bmpPcktIU0lFWVNacnI5OGgyTXFo?=
 =?utf-8?B?d05vYnFvWGJRRjBxUTdGYlRWM1NYemxxMW94Y3IwdXZiTUgxaUkrcXlxSTZu?=
 =?utf-8?B?K1lsMFU0MEJEdVJnb3FPT2dxdEh6MGVSaHZRTGpqV0JLc1dFVDFhaDE1YWRR?=
 =?utf-8?B?OGJCWGh0by9IdUpSNFJ5Z1BqZHlGeVVreUYzbm9IejY5K0N5dVhRZTh0OWFx?=
 =?utf-8?B?VlZRdXpNZW5aK0dVaWxIOUhqNFdkQkYyYk5LdnVvaGpSRG9YaTI0ZXRpZzNT?=
 =?utf-8?B?VjJkRzhUNkFJM25meGovV280SjMyNlMvZnptaXhYblgxeHRwTkgxSUtaTC8w?=
 =?utf-8?B?dlJMZ3ZlYWZyQ1R1aEhsSzNwbFpjOXRyRkYza2pJRlJ0WTNRWTJ2K21NSXVt?=
 =?utf-8?B?MlhQQkNJUVRCejhaK1NuSDFKZEE2UG51N29ycTJpNERLQlhqQ05wcFY2Qis4?=
 =?utf-8?B?SHJzZmlzaSsrM0xUOEhBTEhicnFMRS8xUlZGYUZpMzBHVUdJcGFsMTlQUktj?=
 =?utf-8?B?c3ZxUVdDSHlzcVFRRFkyOHRRZDhveW9lajhPTFFzR20wVTNMTVh1UmljNkxT?=
 =?utf-8?B?a3pzMy9uNENSYktGdmp0UGU5ekcwYjkycEFWZENkQUhtZWZpbWJlUnAzNXdS?=
 =?utf-8?B?clVETXZWNHREam1ldEZOMDBSWnpSU3AvaDRKdmFIZFN2YnFjK3NmMEo5SVE3?=
 =?utf-8?B?VDI1TkZYUFRnK2U1VHhBeEh3NTcyMTdYNllPeGYvcEZsaGdzRzlQWVRobU1u?=
 =?utf-8?B?UmdNR3Z2VDRVL29TVnB0QzFDNHEvekxscjJrc1hIWGU1cElRYkdCTi9MWlp3?=
 =?utf-8?B?YWphM0J4a1QxRFRIZ1dQcVpoQjVsemlrSFRWSjJYMGlrTUJQd3o1c1VrRERu?=
 =?utf-8?B?RVR0ZDlYSVJzaXNWZmppNjdFWWpiTGhITDRhc3BmSnhtemh5RElNVXZ5Z0Ri?=
 =?utf-8?B?K3pFSzlPUXhvejNhSWZJendmb1NJbzNJUVExai9UYjhCbXlBTklsNExic3FJ?=
 =?utf-8?B?VG92ZmZYamlDS0Z5cmd1a3RLZ1ZYbmNPYmxKL2pVTDRkL0o4WlBwVlZZYW1Q?=
 =?utf-8?B?WlF0VzZJMVpZMjd3ZjhMT1JiY2tkL2k5T25mYTVyTUp1NkhCcUNwbERSWFRK?=
 =?utf-8?B?SlFaVGVNWmZ3OWxsQW02dHZvSk5saUw2bnRVRWNoMlZIcTdWUUMzanQzUldF?=
 =?utf-8?B?K28yMWlZZTg1U2tuNGJsVEp5TzdXOHQxWG9qbTNmN3VLK0djZlBOaU4vOTh3?=
 =?utf-8?B?emZhUnE2UjdZM3ZrOGdKR1dFMEp6bCtHdGxKWEc2OXg2Mmd1MlFNNWJuY3Y5?=
 =?utf-8?B?M0xkcURvUlY5Z2RNOEJrWTd0WHcvSG5oNFZGYmMrY3NBWDM3OUpCZEIvNnpQ?=
 =?utf-8?Q?Ktmwzcwvq1T737U0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98034a5c-5481-440d-b8cb-08de531eb2a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 03:40:44.5478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqVfzO6JP51oPSppZwLKQUmq/8KvZPjSAjVIOjlfbTuzaGyvpK4XS2emfd5VXEZn6KT1619y5AdlgJS5tW6sRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
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

On Tue, Jan 13, 2026 at 07:26:52PM -0800, Matthew Brost wrote:
> On Wed, Jan 14, 2026 at 12:04:20AM +0000, Stuart Summers wrote:
> > Current hardware does an implicit TLB invalidation on
> > context switch. This is required for various use cases like
> > preempt fences where a context switch will happen without
> > any explicit TLB invalidation from the KMD.
> > 
> > Add a hook to make this explicit as part of the ring
> > prior to batch execution to allow for more explicit testing
> > and sequencing of user batch execution.
> > 
> 
> I don't this patch is needed rather this an existing bug in xe_pt.c...
> 
> 1974                 if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> 1975                      xe_vm_in_lr_mode(vm)))
> 1976                         pt_update_ops->needs_invalidation = true;
> 1977                 else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> 1978                         /* We bump also if batch_invalidate_tlb is true */
> 1979                         vm->tlb_flush_seqno++;
> 
> I believe we also need this at the end:
> 
> else if (pt_op->rebind)
> 	pt_update_ops->needs_invalidation = true;
> 

Ugh, actually this isn't right either this will issue a TLB invalidation
on page fault fix or VF resume which isnt right either.

I think it is the right behavior for VM bind IOCTLs, but now that I
think about it we'd get a UNMAP op there which would set
needs_invalidation - only on page fault fix or VF resume or exec IOCTL
page fixup we only issue a MAP op - the latter correctly increments
tlb_flush_seqno. The prior cases we assume no invalidation is needed but
a invalidation at start of batch wouldn't help in all cases there
either.

> My question is: does this patch internally change failure rates? If so,
> I believe implicit TLB invalidation is hiding a bug in the current
> IGT suite/KMD/hardware that just hasn’t been caught yet.
> 

So let's start here.

> Matt
> 
> > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> >  drivers/gpu/drm/xe/xe_pci.c          | 1 +
> >  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
> >  drivers/gpu/drm/xe/xe_sched_job.c    | 7 +++++--
> >  drivers/gpu/drm/xe/xe_vm.c           | 3 +++
> >  5 files changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index f689766adcb1..fa193e0b906d 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -355,6 +355,8 @@ struct xe_device {
> >  		u8 has_pxp:1;
> >  		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
> >  		u8 has_range_tlb_inval:1;
> > +		/** @info.has_ring_tlb_inval: Performs TLB invalidations on context switch */
> > +		u8 has_ring_tlb_inval:1;
> >  		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
> >  		u8 has_soc_remapper_sysctrl:1;
> >  		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 5c705124270e..a2ce9da2e3cb 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -893,6 +893,7 @@ static int xe_info_init(struct xe_device *xe,
> >  		xe->info.has_device_atomics_on_smem = 1;
> >  
> >  	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
> > +	xe->info.has_ring_tlb_inval = graphics_desc->has_ring_tlb_inval;
> >  	xe->info.has_usm = graphics_desc->has_usm;
> >  	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 20acc5349ee6..783ebda6eae1 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -72,6 +72,7 @@ struct xe_graphics_desc {
> >  	u8 has_atomic_enable_pte_bit:1;
> >  	u8 has_indirect_ring_state:1;
> >  	u8 has_range_tlb_inval:1;
> > +	u8 has_ring_tlb_inval:1;
> >  	u8 has_usm:1;
> >  	u8 has_64bit_timestamp:1;
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index 39aec7f6d86d..c3b3d9c56dbb 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -246,6 +246,7 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
> >  void xe_sched_job_arm(struct xe_sched_job *job)
> >  {
> >  	struct xe_exec_queue *q = job->q;
> > +	struct xe_device *xe = gt_to_xe(q->gt);
> >  	struct dma_fence *fence, *prev;
> >  	struct xe_vm *vm = q->vm;
> >  	u64 seqno = 0;
> > @@ -259,9 +260,11 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >  			xe_vm_assert_held(q->vm);
> >  	}
> >  
> > -	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
> > +	if (vm && !xe_sched_job_is_migration(q) &&
> > +	    (xe->info.has_ring_tlb_inval || !xe_vm_in_lr_mode(vm)) &&
> >  	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
> > -		xe_vm_assert_held(vm);
> > +		if (!xe->info.has_ring_tlb_inval)
> > +			xe_vm_assert_held(vm);
> >  		q->tlb_flush_seqno = vm->tlb_flush_seqno;
> >  		job->ring_ops_flush_tlb = true;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 694f592a0f01..8e0ba2eba21e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1619,6 +1619,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
> >  			vm->batch_invalidate_tlb = false;
> >  		}
> >  
> > +		if (xe->info.has_ring_tlb_inval)
> > +			vm->batch_invalidate_tlb = true;

This definitely isn’t right or desired.

Matt

> > +
> >  		/* Fill pt_root after allocating scratch tables */
> >  		for_each_tile(tile, xe, id) {
> >  			if (!vm->pt_root[id])
> > -- 
> > 2.34.1
> > 
