Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD70CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 22:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5835010E4D2;
	Mon,  3 Nov 2025 22:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fq5Fx34V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F53510E4D2
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762210712; x=1793746712;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N4ItQf+2vqdqYdLgoGeThxuhkO5qiScSs653m/B9hCU=;
 b=Fq5Fx34V7kK9MHssLl7l7xd+r/O2unwETFFBg0xbcI+kreykik1Z6fej
 YrPBTz31poda238Yji/Cf4Y1FD0Tw+ztfx73/1zayRohnQ5x26yTzBTUd
 m5e/XRTexcMGLqSXXQnj+jSEWN5ah/K+6BhPAblhu9aefCTa4uFsyZvNG
 g8s2jPuRUOmJ5i1I/6dqQDu10nkzh/8P9omDl+BSXXKwanhM8GAVJymAf
 26YUVABWu4VDLaa+5zcX3EAF7fvzxyCpZ/XG2+OVsQn2nguV6oSlNTaI+
 wFHK/n9DwRvOa8oMI3INs9guJZkkErpqrx7rhqgb3Nms9aT+qLadDy5q7 g==;
X-CSE-ConnectionGUID: 2IT66FTvTsSucp9+rnviJg==
X-CSE-MsgGUID: 6jOrdLurSCOVXD1ldiwH5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63994880"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="63994880"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:58:31 -0800
X-CSE-ConnectionGUID: /U3+/duHSuWTbAkGi+vUkg==
X-CSE-MsgGUID: thzDJ75BR5CzmjbWF0PPQQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:58:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:58:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 14:58:30 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:58:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzWhpcfn/0edHN8rglS1wZPxHTn1C9znRFHDvINdNVM3KNNy2BeV28tXgUi+r+oquGrw8z8CIV14MFOmo2CAgGKXMXlEWmV58UXCLJ7UnNhOOa0fFdgbuvZGd0GLUBcWSNcxnC9n+W0hAH2+vW7imHMg73YR4h3SzueN8b5pxql5lmRcFS3OaVV7t1WDTVmOnfEKKMdUB5UgMqmf6ScozVDVDPyn7w77gaT/Bj6UKHez+/CqCVslbznUdc1GEnZoZDljEJ7JksVA/Y5IL90xcPip1Vz+bCsaOTBoVal376VD9F/NXEy0sH5+anYp/Ybhqd0eYePA3sxUbT3VSIiavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8tErD+ZhNvAru5JcqJTMO64qQdfD67hyyAjwP0LSyM=;
 b=tzgIXXz1OLAnLOgWt8Wo7aiGJ87gfZwC+f3dux1iWx8EDeZGGi0qYK+u5Y74aGVPXmBxxnIJOnQjt0V5p3xxRfc9jbzUqMsvU5eNrcUfRsZIivsHxx4SA3oGnRHeegMfHuB8Od6rMjhUmIITLFDiGkMKdcLpOTAMRKLuMshoyHUCtbBkXRVCVO9tcpZa78sMFDs+MLS153GeKVcQRQHTf8TOQnPB+zLajY69XuEDswMRyN0dM0KMIOsL8y3Tzxy1llf3HwC2CgUMwkWHb/jkCJK2SgGcm5j2sSM/h9ol2cRPXC8FsGdgcGHU7dtFFXwGEQ2FY5MybbTXcKXlUiLCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SN7PR11MB7092.namprd11.prod.outlook.com (2603:10b6:806:29b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 3 Nov
 2025 22:58:28 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 22:58:27 +0000
Date: Mon, 3 Nov 2025 14:58:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/16] drm/xe/multi_queue: Add user interface for multi
 queue support
Message-ID: <aQkzkPLxukAwNzbi@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
 <aQUOjCwmhFKsR1tD@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQUOjCwmhFKsR1tD@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::22) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SN7PR11MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc6a6e3-6c97-4a3d-206f-08de1b2c7fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U09nRlYwZnFXaHNCelhyZS8rakM1eWRNTGtCaVVYV1BWUnBnaVZYQ2IzTStx?=
 =?utf-8?B?ZUUyaythWlUwTkdiKzJGd3U2YncvMW5oK0tiaUFLQXdkSjRaMzNFSFhubDRH?=
 =?utf-8?B?YTA5VGpyWXdRNHV6ekNJNkx6NmI0Z3pPVC9KOEhHZGFSRDg1cHFKckZHaUNH?=
 =?utf-8?B?Rm1helhodytYdm9ja3k3enJKbmxjZjRla0k0dkx6RGQrZkxlbXJDcmpJVlpY?=
 =?utf-8?B?bnB4OGorT0ZDdFF0Y1lBTEllMmZ3K2hjM05QN3d4Q05URC91R0xWVllKQmdi?=
 =?utf-8?B?aHM3aXFpVWFWVXBWOGZFUGF3cjlVa0N4Z1lrb2JUdXBXUnRLNUp2cUhWSGNP?=
 =?utf-8?B?SFh0K1padElhWVYySU0wTXl6aG85Yy9nc3JNdHYzUWVkZUg5NDRYSDdPNGlz?=
 =?utf-8?B?Ymt4UVpOeGl2eG5qL0dmODgwSEVJRHc3OVpiVDkweDJZK1JrM241cXFqZzlL?=
 =?utf-8?B?VzBIRGxGWDB3ZVlCNEtaNjZKWCsvV2JnelIrcDdsLy9JMTMxODBQcFdGeFVS?=
 =?utf-8?B?ZSt6cW9XeVdXdmFwS3p4bTJCKzRDNnpRMzlHOWhjRzFCYkJvZ0docmhjMkNG?=
 =?utf-8?B?Y0N2dnpJL2h1bHdJRExuQ3FqdjNUcVB0QVQyRVUxS3pRZDFkcUtHdkFBR2wy?=
 =?utf-8?B?UkY2ZW5hWlBVcXZkcnh0M3lxOWdBakduTG0velpxUUgwbVhaOFJyRS9XQnMz?=
 =?utf-8?B?MVBtTGJSTlJaMTd2alJ3bVJqUEttejNvcllqcjlmMUZuZ2cralNBVGVSaktx?=
 =?utf-8?B?eUVWakdMNTM5NUdZMXhoR3JCS0l2bUVnWU01TjVEZlovUjFVeWdvOXFjVTl1?=
 =?utf-8?B?eVQ4KytEYm05YllmVmpWVkFObHNNOHBYTUs3WTRZUVhIM2lXRnJ0MDkzeVdD?=
 =?utf-8?B?Vy9SMkhlN1RZbFdvU3Z3eHdMb1ErOGFUZW9VMkM5WkdONnZkamJMckFwWFZw?=
 =?utf-8?B?STRJSTBaUlNXczZLTXJBS2xVaWhDM05hOExSQTcyY2hHWDNYcG93MUk5K1F1?=
 =?utf-8?B?aDJTTmZQUlhEUlk4MFljKzNJamFoMmtSTGlYR0N3MGRoZHFOVlQ4cGx2RHAy?=
 =?utf-8?B?V0ErYW1KY2pneFZMUkhYSEZaZHJoYjhXZ1pRK090M1UyOU1OQ1hVb1BSdTFR?=
 =?utf-8?B?OGJhUUJ4VkgrTDcwMHBPZEY3bVRkS05iUmRjN3BzQnVlZTVTdDBrYWRmWlN0?=
 =?utf-8?B?a3dBWCtxektDZXdkOUtVRG5wWTZETUJYVVdWbWVXMVZzSDBna0hhYU5XcEMy?=
 =?utf-8?B?bWd3R3JEL0xlMHprb0ZSc3hmNkhhcG9FUmNWM2FFZjg0K2c5cW9xdXRsd3di?=
 =?utf-8?B?OVJweTVGR1AvY1FSbnN5ZHIvRElpRUozYW5VQnNHUHBPZUVtNURxL3hxaHcy?=
 =?utf-8?B?YWRYWFE3Mm02TnFQdUVDUFBIMFgxRFNVNlNhMVgxQlArNlMyZUNuazNicGpi?=
 =?utf-8?B?WGdWL2hnRjJQZUcxaTZ1b0wvR01FTllIVEI0NkViVU1adU43R2xzWnFGa0JI?=
 =?utf-8?B?eFViTFJFWitmbHhaMjNvb3VZUVBTZkVTcHpkL0poaHJPdUt5bnJldkwxT3FF?=
 =?utf-8?B?cmNkTE1JN01ZdWNGTmZ2M2V2SXpSWE43dFFFNytXWE5QVXJFUU1Yb1l4MDha?=
 =?utf-8?B?cjN5dGZiQ3BjZnRWdld4d3hBQlhLZzVTM05ZdUNwcW13dmNyQzBIRGJyUlZJ?=
 =?utf-8?B?b3RJVlZsOUo3SEYvWDZDUDhQTlpTcEtBMWQ5TkJCUU9nZSsranNsM21CZjI0?=
 =?utf-8?B?T1R6ZHhjaUZyRHV3WjY2c2srQ1MwMGJYMVhyVUVwSkRRNFNheFpUeXBaWmRu?=
 =?utf-8?B?QWxaajdOcktEVit0d2NabUN5V0NOTEdMbU0zMHRBSkpGeVprNVFMQkNMWmh1?=
 =?utf-8?B?bTdwclBHbG9xT1FTeDVYS3hWWU9pWnpTc1pvRTVCVXJLKzhWOEE3VGw0Nktl?=
 =?utf-8?Q?d/xqdbApW9NCSW7LVvfqClBhmTy02fV3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGwxajRrOTFHZHBReWZoa0tPUUhEYjgwM1J0bC8rVVBvYXZyTXh4TXZYMTNl?=
 =?utf-8?B?MzhaeTEwa2xRN2IrVGtGZVc2UnVKUzdUaTVkQ3h5Z1BtaGZGZUJXdmZFUndS?=
 =?utf-8?B?K21oYjdLZkcrc3NPOUJ2cEpVM0FqSUs4ZEhBTVU0WVg5Z2Y0c3R5SEsycEdJ?=
 =?utf-8?B?WXc0bTJnT3FPVlUrSmJNdDRDZmJLYVhPQ1BBN1RjTFZBMXpiUzVndDVQYlAz?=
 =?utf-8?B?R0xWNzh1NVp5bzh6dkVjZkdEeGN5R1ZBVXdiY0E2dXIwS3FUVjVlZ2M0L0lM?=
 =?utf-8?B?VGZIZnVaZGZQbjE4V3E4MEFhNGljSHNZalowV2RJRDNQbjBVd3k0alhMZE5Q?=
 =?utf-8?B?RDdHM2hMUXdXNG9OZjc5OFovUWdUYnJTdW5OZkFJdEFNd2VYK1hrQVdnRVVq?=
 =?utf-8?B?WDY3NHhNbTJldE1yY1dDU0RlWFZpMEpCTFRrTFBlY1RHMnBTcklPbjB0bnNS?=
 =?utf-8?B?SU0yOEViUTJ4TnNWUDlGOWRMZWhIUXNZa1N0aStWUnN2bHpxU3BsM2doMzcr?=
 =?utf-8?B?eFFYeFNzajZQSzVvalp0eVc0MnFuZU9GTERyT2xRSFJDTUNyZngrd3J3K1VH?=
 =?utf-8?B?VnBlRHB2UFgrSDV2aFdOZjBYMi9QZS9VQ3Jwc2dYWE1WbDR1OVd6R3h5Q1ZD?=
 =?utf-8?B?RnJmU1R5M1FFV1BLVWpGUm5QVU5hNVM3Y3h2SndmSmphaTV4akE4WkhpNDJ5?=
 =?utf-8?B?SnF2cjZUZDJqaS9wUkZKYVh1eko5aVF2Sk5PYVlaT29Ia0hCUGhkdVBxMG0v?=
 =?utf-8?B?bG0xUlZ5ZlZieFBJL3BtaXkrVWt3V3pORzRrYVFISlJ2SzB2cDk3TlQzL0Rl?=
 =?utf-8?B?M3pnYjN4UEVzblNsREZ4VFc1YlgrZHdhSG5pRXB5UHUyUUhzRGZ4QnFlai8y?=
 =?utf-8?B?MitPTFlpaGd3MTEzdGl5RGhzOU01d0loQll0Zkl4WEJobkFNZExmNUY2di9V?=
 =?utf-8?B?TE9GOElxVlFUU1B6bFVLTURGODd2SjE4ekxPVy9GQzB6T29nSzFySG8yRXRa?=
 =?utf-8?B?VHZJb00vNy9ROXRHU0hjK2dDdkU2OWJqakcxOVhQdTJrNUZDNU9jUW1nSkZY?=
 =?utf-8?B?am43SFJ6Sk8yZDFNK2VoN0JsVUZWbmRoS0c1MzM5aGpZUzlQdWVibndBQTJu?=
 =?utf-8?B?MnBlTE8rdjlIL05ZcDQvYi8rQm50bmhNV0w5RDVOS1FFYU9JQTFYTDlud3Bm?=
 =?utf-8?B?Uk1NNUhKemhIZzRMNHZQWndlN3ZoYUc4b0h4K1NoR2VuZ05ZNm1IbVpiMU1t?=
 =?utf-8?B?K1AzdkpBZTZUYXJ5NHZGWGIzdzJBQWdzVDd3Y2Z2MjNES1VmQWdBSDFWcis2?=
 =?utf-8?B?d0NvTGxRdU0rTGFsQVdlcGorTzZpekErMG05YnFuVHk5WnVQNUNVV3crTmt1?=
 =?utf-8?B?bmVVNWFialdGOVZBay81cytaMzVBVEtieGt4Y25pSTh4NENZQ1I0Y3dQUWdY?=
 =?utf-8?B?Q2hqZnoxcksvelAvRTFkdEdDOXVaYWNpbVNqbzQxSmZWcjJoOVVGZHY3bk11?=
 =?utf-8?B?T1NaMzNrRFR5R1FVQmpsQUdWSkx4VXplS2l6YUxSUEhIK3QwV3dlQ1RjTThT?=
 =?utf-8?B?a0pRV0sxUW9wb1l3REJOdkdkQ3EvaFNKWnV3NXllWS9kL25sWjU5RWg0bStL?=
 =?utf-8?B?NEdZMGhucFlKRytxdSs5ZmVrZGFobk9rWTZaS3p6bHNONE9hZURiaGdMV2pC?=
 =?utf-8?B?dXpTdm4yUjhLaUl1ZW91VGgwUUhKQkdTVVZaTjBYK3htQUdMenR1aCs4V0Qx?=
 =?utf-8?B?ZUJzOXM1ZXVtYktxRHV4RmdDYXpoVmtQTkJBMy9BMjNNbGpwNDY5WmhaWUt5?=
 =?utf-8?B?STZlTUVmM3o2NHpuZk1EbTE5Nkp5QmNvaW4rSVQrQXc3cUdhUlowT1lvZFhw?=
 =?utf-8?B?Sko0ZnUvRDdkQXVQZGtBN0RKbG81K213YkFxVTJ5ekFkaSs1WUgvVTh3WVZG?=
 =?utf-8?B?dkpMK2o0NmhRaUdxbXRBWitia2Nmdzhvck9vdWdTR09uTkdLU0VndCtzNHgz?=
 =?utf-8?B?aHMrNkYxV010MHl1VmVvaGdwSUdNTUk0YzhFOW5VeFE1N2lzdTdiYzhjUTRK?=
 =?utf-8?B?VVE3QjJ6S0pEb3llQVVVTkovb1pCTjdaRFVGNlBlNzQvcG5IazhCTWNiZ0pI?=
 =?utf-8?B?OEZvUGZZK2F6WDhPUlgzYWpiUFpKdVpudmROUHhQQUJLTm9jVGFIalN3bnVr?=
 =?utf-8?Q?fRIcII9uR9NZFyq9XqpCUBY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc6a6e3-6c97-4a3d-206f-08de1b2c7fc5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:58:27.8063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALqa4z6CbqwxUcJaBaQ/wt+R+2ftWCpe/JJvkqSj32xYHfVq3On0K3ghlr8k6xVjjn9DZCLzPf+hxilfC3+SWXbudTd/+qB75GHx5MvnulsKWb0aCU41KiJshlgvBJic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7092
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

On Fri, Oct 31, 2025 at 12:31:24PM -0700, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:22AM -0700, Niranjana Vishwanathapura wrote:
>> Multi Queue is a new mode of execution supported by the compute and
>> blitter copy command streamers (CCS and BCS, respectively). It is an
>> enhancement of the existing hardware architecture and leverages the
>> same submission model. It enables support for efficient, parallel
>> execution of multiple queues within a single context. All the queues
>> of a group must use the same address space (VM).
>>
>> The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
>> property supports creating a multi queue group and adding queues to
>> a queue group. All queues of a multi queue group share the same
>> context.
>>
>> A exec queue create ioctl call with above property specified with value
>> DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
>> queue being created as the primary queue (aka q0) of the group. To add
>> secondary queues to the group, they need to be created with the above
>> property with id of the primary queue as the value. The properties of
>> the primary queue (like priority, timeslice) applies to the whole group.
>> So, these properties can't be set for secondary queues of a group.
>>
>> Once destroyed, the secondary queues of a multi queue group can't be
>> replaced. However, they can be dynamically added to the group up to a
>> total of 64 queues per group. Once the primary queue is destroyed,
>> secondary queues can't be added to the queue group.
>>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 191 ++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  30 ++++
>>  include/uapi/drm/xe_drm.h                |   8 +
>>  4 files changed, 274 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 1b57d7c2cc94..86404a7c9fe4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -12,6 +12,7 @@
>>  #include <drm/drm_file.h>
>>  #include <uapi/drm/xe_drm.h>
>>
>> +#include "xe_bo.h"
>>  #include "xe_dep_scheduler.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> @@ -62,6 +63,32 @@ enum xe_exec_queue_sched_prop {
>>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>>  				      u64 extensions, int ext_number);
>>
>> +static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_lrc *lrc;
>> +	unsigned long idx;
>> +
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));
>> +		return;
>> +	}
>> +
>> +	if (!group)
>> +		return;
>> +
>> +	/* Primary queue cleanup */
>> +	mutex_lock(&group->lock);
>
>I don't think you need the group->lock here. Xarrays have their own
>internal locking.
>
>We do use mutexes around xarrays in Xe, but that's to protect the object
>reference—not the xarray itself.
>
>For example, we follow this pattern:
>
>lock();
>obj = xa_find();
>if (obj)
>	xe_obj_get(obj);
>unlock();
>
>Similarly, we apply a lock on the removal side. This prevents the object
>from being removed and a reference being dropped in parallel with a
>lookup (i.e., it avoids a use-after-free).
>
>We don’t always use this pattern correctly—some of that is legacy code
>we haven’t cleaned up yet—but we should.
>
>In your case, you're not protecting any object references (i.e., there's
>no lookup function involved), as far as I can tell. So there's no need
>for a lock here.
>

Ok, will remove.

Niranjana

>Matt
>
>> +	xa_for_each(&group->xa, idx, lrc)
>> +		xe_lrc_put(lrc);
>> +	mutex_unlock(&group->lock);
>> +
>> +	xa_destroy(&group->xa);
>> +	mutex_destroy(&group->lock);
>> +	xe_bo_unpin_map_no_vm(group->cgp_bo);
>> +	kfree(group);
>> +}
>> +
>>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>  {
>>  	int i;
>> @@ -72,6 +99,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>
>>  	if (xe_exec_queue_uses_pxp(q))
>>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>> +
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		xe_exec_queue_group_cleanup(q);
>> +
>>  	if (q->vm)
>>  		xe_vm_put(q->vm);
>>
>> @@ -549,6 +580,148 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>>  }
>>
>> +static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(q->gt);
>> +	struct xe_exec_queue_group *group;
>> +	struct xe_bo *bo;
>> +
>> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
>> +	if (!group)
>> +		return -ENOMEM;
>> +
>> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
>> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +				       XE_BO_FLAG_GGTT, false);
>> +	if (IS_ERR(bo)) {
>> +		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
>> +			PTR_ERR(bo));
>> +		kfree(group);
>> +		return PTR_ERR(bo);
>> +	}
>> +
>> +	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>> +
>> +	group->primary = q;
>> +	group->cgp_bo = bo;
>> +	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>> +	mutex_init(&group->lock);
>> +	mutex_init(&group->list_lock);
>> +	q->multi_queue.group = group;
>> +
>> +	return 0;
>> +}
>> +
>> +static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
>> +{
>> +	return q->gt->info.multi_queue_enable_mask & BIT(q->class);
>> +}
>> +
>> +static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
>> +					u32 primary_id)
>> +{
>> +	struct xe_exec_queue_group *group;
>> +	struct xe_exec_queue *primary;
>> +	int ret;
>> +
>> +	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
>> +	if (XE_IOCTL_DBG(xe, !primary))
>> +		return -ENOENT;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
>> +	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
>> +	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
>> +		ret = -EINVAL;
>> +		goto put_primary;
>> +	}
>> +
>> +	group = primary->multi_queue.group;
>> +	q->multi_queue.valid = true;
>> +	q->multi_queue.group = group;
>> +
>> +	return 0;
>> +put_primary:
>> +	xe_exec_queue_put(primary);
>> +	return ret;
>> +}
>> +
>> +#define XE_MAX_GROUP_SIZE	64
>> +static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	u32 pos;
>> +	int err;
>> +
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		return 0;
>> +
>> +	mutex_lock(&group->lock);
>> +	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
>> +		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);
>> +	if (XE_IOCTL_DBG(xe, err)) {
>> +		xe_lrc_put(q->lrc[0]);
>> +		mutex_unlock(&group->lock);
>> +
>> +		/* It is invalid if queue group limit is exceeded */
>> +		if (err == -EBUSY)
>> +			err = -EINVAL;
>> +
>> +		return err;
>> +	}
>> +
>> +	q->multi_queue.pos = pos;
>> +	mutex_unlock(&group->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_lrc *lrc;
>> +
>> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
>> +		return;
>> +
>> +	mutex_lock(&group->lock);
>> +	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>> +	if (lrc)
>> +		xe_lrc_put(lrc);
>> +	mutex_unlock(&group->lock);
>> +}
>> +
>> +static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>> +				      u64 value)
>> +{
>> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
>> +		return -ENODEV;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
>> +		return -EINVAL;
>> +
>> +	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>> +			return -EINVAL;
>> +
>> +		q->multi_queue.valid = true;
>> +		q->multi_queue.is_primary = true;
>> +		q->multi_queue.pos = 0;
>> +		return 0;
>> +	}
>> +
>> +	/* While adding secondary queues, the upper 32 bits must be 0 */
>> +	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
>> +		return -EINVAL;
>> +
>> +	return xe_exec_queue_group_validate(xe, q, value);
>> +}
>> +
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>  					     struct xe_exec_queue *q,
>>  					     u64 value);
>> @@ -557,6 +730,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>>  };
>>
>>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>> @@ -577,7 +751,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>>  		return -EINVAL;
>>
>>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>> @@ -626,6 +801,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
>>  						  ++ext_number);
>>
>> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
>> +		err = xe_exec_queue_group_init(xe, q);
>> +		if (XE_IOCTL_DBG(xe, err))
>> +			return err;
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> @@ -780,12 +961,16 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>  		if (IS_ERR(q))
>>  			return PTR_ERR(q);
>>
>> +		err = xe_exec_queue_group_add(xe, q);
>> +		if (XE_IOCTL_DBG(xe, err))
>> +			goto put_exec_queue;
>> +
>>  		if (xe_vm_in_preempt_fence_mode(vm)) {
>>  			q->lr.context = dma_fence_context_alloc(1);
>>
>>  			err = xe_vm_add_compute_exec_queue(vm, q);
>>  			if (XE_IOCTL_DBG(xe, err))
>> -				goto put_exec_queue;
>> +				goto delete_queue_group;
>>  		}
>>
>>  		if (q->vm && q->hwe->hw_engine_group) {
>> @@ -808,6 +993,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>
>>  kill_exec_queue:
>>  	xe_exec_queue_kill(q);
>> +delete_queue_group:
>> +	xe_exec_queue_group_delete(q);
>>  put_exec_queue:
>>  	xe_exec_queue_put(q);
>>  	return err;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index a4dfbe858bda..8cd6487018fa 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -62,6 +62,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>>  	return q->pxp.type;
>>  }
>>
>> +/**
>> + * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if the exec_queue is part of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
>> +{
>> +	return q->multi_queue.valid;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
>> + * of a multi queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if @q is primary queue of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
>> +{
>> +	return q->multi_queue.is_primary;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
>> + * of a multi queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if @q is secondary queue of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
>> +{
>> +	return xe_exec_queue_is_multi_queue(q) && !q->multi_queue.is_primary;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
>> + * @q: The exec_queue
>> + *
>> + * If @q belongs to a multi queue group, then the primary queue of the group will
>> + * be returned. Otherwise, @q will be returned.
>> + */
>> +static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
>> +{
>> +	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>> +}
>> +
>>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>
>>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index c8807268ec6c..3856776df5c4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -31,6 +31,24 @@ enum xe_exec_queue_priority {
>>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>>  };
>>
>> +/**
>> + * struct xe_exec_queue_group - Execution multi queue group
>> + *
>> + * Contains multi queue group information.
>> + */
>> +struct xe_exec_queue_group {
>> +	/** @primary: Primary queue of this group */
>> +	struct xe_exec_queue *primary;
>> +	/** @lock: Queue group update lock */
>> +	struct mutex lock;
>> +	/** @cgp_bo: BO for the Context Group Page */
>> +	struct xe_bo *cgp_bo;
>> +	/** @xa: xarray to store LRCs */
>> +	struct xarray xa;
>> +	/** @list_lock: Secondary queue list lock */
>> +	struct mutex list_lock;
>> +};
>> +
>>  /**
>>   * struct xe_exec_queue - Execution queue
>>   *
>> @@ -110,6 +128,18 @@ struct xe_exec_queue {
>>  		struct xe_guc_exec_queue *guc;
>>  	};
>>
>> +	/** @multi_queue: Multi queue information */
>> +	struct {
>> +		/** @multi_queue.group: Queue group information */
>> +		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.pos: Position of queue within the multi-queue group */
>> +		u8 pos;
>> +		/** @multi_queue.valid: Queue belongs to a multi queue group */
>> +		u8 valid:1;
>> +		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>> +		u8 is_primary:1;
>> +	} multi_queue;
>> +
>>  	/** @sched_props: scheduling properties */
>>  	struct {
>>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 47853659a705..d903b3a55ec1 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1252,6 +1252,12 @@ struct drm_xe_vm_bind {
>>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>>   *    runtime PM will be blocked while queues of this type are alive.
>>   *    All PXP queues will be killed if a PXP invalidation event occurs.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
>> + *    or add secondary queues to a multi-queue group.
>> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
>> + *    then a new multi-queue group is created with this queue as the primary queue
>> + *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>> + *    queue id is specified in the 'value' field.
>>   *
>>   * The example below shows how to use @drm_xe_exec_queue_create to create
>>   * a simple exec_queue (no parallel submission) of class
>> @@ -1292,6 +1298,8 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>> +#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>>
>> --
>> 2.43.0
>>
