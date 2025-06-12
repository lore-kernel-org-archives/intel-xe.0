Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A894C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 09:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609F310E7BA;
	Thu, 12 Jun 2025 09:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQOQIKLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF45810E1ED
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 09:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749718996; x=1781254996;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EUVzzLeIgbJ8js0r3TOXFXRGpxoUkGdb4gL2D6P9bBQ=;
 b=hQOQIKLnBP1OGrdZ7AuJFD6+p0m0Bf4N2MNbgQEwg/FhF9IZUsZvglb2
 hRYDNI4xTgpFo6vzcLPBeHc3aDqNcFStILAKHtfYYE9PU/hbpgi+I/YoT
 sJ1iZMqd4GLJUaqcYNfpBDThg9sF2/D/aObInrT9QP/BQ/CXZO9B6FQp0
 brw0WKy8Ev40jSK1SjLZTjEdI8xoN2AMcFRkgzE9DMynlzI42vCN7G7V4
 BbooDCr4qF1IXcJgtu3+dRtRErbctKqiXf3g6UZ7VsA/H81n4rspuRe0H
 pd95tw9/meaISrckOpX11/uVYL8SVGSiarTxWfYDCDFHuDOEtKECtjT+B g==;
X-CSE-ConnectionGUID: V2jn0hNhQ7+kDONujC6TwQ==
X-CSE-MsgGUID: IXPGagZnQLCH36Bqx5BNkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69325812"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69325812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:03:15 -0700
X-CSE-ConnectionGUID: sO0wx9zGTAalOvqWf2SBdA==
X-CSE-MsgGUID: cpe1rDr1Rb+RxA+2H8eRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147814029"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:03:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 02:03:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 02:03:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 02:03:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biaYIQ8TZ0IZwHcjdQJk24Jj4qC6zxnPcW9EXJNH8oAp6Ld24YYdOVctAx8IPsR0YS65NPGcbY+225/7pfRdid4iQMSpwq+I1m1/T4+S2uyyOctrb0W+tPh0u8yh19RRp5BmEPWXZwDEF482I6Qwc4AWso+dQDF1QRM4Zj5NFh7+54ittC2mb5433ryyQykkGhPTyjgN2Jey2O0Pyy0gkkKaTMcJ3QhmnjPyVeRIBEDW1bykNYexz1MpRrYKbF8UcjRJVZ+fDqUwrwaKNTSw0S4TmW1mGQdpyV6cv6M93Ud9TUKb96bKUvhqM6WOFmnFuJw7PdftpM3iya32m86mNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWoyvVxwz0HhE2rdO6MKed3myRqTAYRWoodrml2CBwc=;
 b=se2aLofgu0dQKsmGMiGkuTKc2+w7xuQtxGYWVc2+Iv2+N4ImjTuGEBLFKejJZnwk5ldpbdoKh9BgIeqTixNbI21LJy3XSb9+fqXT3S41ccZaMbFWZM6bz0viKpBW2S67XH6l4QHLBmkpcRUMVy4CvJv4CJYek4Mmt7bYIw1QoL+Z3hmoVs26WBDZ47G6V8dN2wIa9y0xslXwAE8o8wK9HReHlCcvCybS39VjnYTjZGZMG0OcQBijTQCwNr0EIEB323HN18D3c7WgCOnUdQYS2Spyiv2D8NJeLXfl8iPwEnfH2JehNmiVrm7ojKaSb5UCkxCiB2Gd4i+9jLDJNnZUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB6393.namprd11.prod.outlook.com
 (2603:10b6:208:3ae::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 09:02:39 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:02:39 +0000
Message-ID: <07538dc5-2385-4261-985c-a55e31605500@intel.com>
Date: Thu, 12 Jun 2025 14:32:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/19] drm/xe: Allow CPU address mirror VMA unbind with
 gpu bindings for madvise
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-12-himal.prasad.ghimiray@intel.com>
 <aDjliFo0mP7h544f@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDjliFo0mP7h544f@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 333713cc-f564-4125-f40e-08dda98fe223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUFvWWNtcGNJTkJvdmZHSGQ1Q0I2Y3llMHVXMXZvM0Qydi9xUkpIb2NNSVUx?=
 =?utf-8?B?WU9SOWozUmpRcjhJaHJCZnNHZ3JmZFhkaWRNWnZ4L2g2S3JrMEdrdkx6dU1N?=
 =?utf-8?B?UzMvNVd4Wk50cThBU0ZxQWdDV1cwTjNpVnNsK0liWVJzRVhqVUlwSEEyVjBG?=
 =?utf-8?B?T0MvNHJ6S0xsRDJZNm9OSm5aNUhNVnlIVHdzMko4VkFNblNzcUVtYXhBSmlN?=
 =?utf-8?B?RFFPc0lSMk5CdzJlU0pFU0MrMy9mVjdTREgyblFIdTU0U29YNkc2aCtHUXJ4?=
 =?utf-8?B?dHVNK1BsaHZMVVNSSSs5UW9kMVk3elhIMklHOTN1dWUwWkZGNXYxcVA5YUFt?=
 =?utf-8?B?OUxLQzlZdDN3M1JPRUNNZFpLcHNDVzE4R3NmcHFVUm03dVlWUU9NZDVZOXFG?=
 =?utf-8?B?YmFIajVBa3JONjFPMzlOUGRPRlN6OTlraDhQbTRMNXc4bkV5a3VaUWd6RGlM?=
 =?utf-8?B?czVsbEFwdUVNNlpRRXVMUlVNYk5ZZmVaSEhheTN2dFI3RlVkTWc4QjhFOGc3?=
 =?utf-8?B?OXlVNW5ZTlhuS3o1YUt3cjd5ZXdjQlFwRkhlbGhjTndVQkU4Y2dWMGxnMEZZ?=
 =?utf-8?B?QzlSM2FkdGtpbXdwMnJwckloTGNWbG44YUJqNTMwVUlrR3BXbTBwNGxKYXlY?=
 =?utf-8?B?MmJaUUxKeHEzL1VjUjNTRWtoNTd6bHJWaW9sV3l3S3p1WHhJZlRNNk9zNm1a?=
 =?utf-8?B?OS9pQyt4cm82NnZOQUhYODFxbFZjSjRQTjBiRGROcExaUTg5WGl3RjJPK3dw?=
 =?utf-8?B?VVdJY21STjQ0TVRVZnpOVlBKV0p3UkZUaktscVRxNm56WW5HZnRjcUczTkNS?=
 =?utf-8?B?TlNiRkMxSVRnckVIalEwbStrZm91VjlyMXBBdHRiZFNCcWpEVFJibTE0UFk4?=
 =?utf-8?B?alJNMkIwNWgvbVVhWEE0NTdPWmdlNXhva1JYaVlsblo3ZytISm4yZXBzMmJP?=
 =?utf-8?B?bWpueTlHZWhQd25UVWZ2TE5RUHFxb0ZCWlF5Rmk5c1JUOVMvbTlFL0g0MGJt?=
 =?utf-8?B?bDFNYTBwcnhlTDdqR25PZjR5TDY0b1g2KzZrR2hieElkMmcwVnJ2NVFKWkkr?=
 =?utf-8?B?Q3ZKTG5hb2MzZ2lSa2V3SS9YVUJHZzJ1VWdmZWtNY3NtMjFURDdEQStZUHhu?=
 =?utf-8?B?Yk1qenRKOVp1UUNReVVNRmljM3lnbUFzQTBKd0RKcUYvV3ErdFQ2ZUZvLzJm?=
 =?utf-8?B?aFZPbzlROVlTV3lrYVQrME5jWWY5RHB0Z1E4K0ZXZldkV2RqY1ZOQ3RHMEdZ?=
 =?utf-8?B?OUd2SWFXaHI3d0I0QWt4T3plc1BhRFA2UkxEaGsyRXlKN09IMk5Lano0MFZB?=
 =?utf-8?B?eGZ6NUlwZTlCSmJiSGdyMTVUMUUwWW5TRVdNK0ZUL0ZiTnNFaW5KMlVQQ0xi?=
 =?utf-8?B?ZmR6N0szN1k3Y3dSQWRxRmNGcjd2K3VLQkdvS29OcnoyWmt1eXBTenBISGdB?=
 =?utf-8?B?dkJXSUY1ajVGZFk3V3dlMGxFSEdKREs4djg1NE1hYUVoY0lqYWwydWpUaC9r?=
 =?utf-8?B?SmhsZ3ZjRW5BK1BnQjRXakd3K2EwWlpFcElCcjJQRGYxeGt1eGpvY1FYY3RF?=
 =?utf-8?B?WGE3ODl2ZWlNOXlQa21nSzU1aUNyRHc3OHhmWjRyTjUzYWZlMjZpSmc5SXgv?=
 =?utf-8?B?QnNyMk9RWUdOK05VYm1YZ0Q5a1lVVU1FOTNVTnE5SnhpZHRGQ3RyWVo2YnYw?=
 =?utf-8?B?b09aaWlqK2RvMVp5RjU5ZjJkNWFHUkZjNjFTZzJGMTVJd1FwSnV1dGRCdmNX?=
 =?utf-8?B?MGNxbU5Iei8rNnJvWFJUWHE0a0VSUVFLN1RHRTlwcVFEZ3RJSVY5dnJGdmN6?=
 =?utf-8?B?UjJHdkxRRnpQaTMzMlBjcDJaOUs0a1o2UUtLRy9maUJIWFB6M05CQ0ZkU3ZM?=
 =?utf-8?B?TzNRN09uTWpoQWZGaHEzVlVIY1RxdFUwRVhEeGZtRSsyUjZoeEtUMUdBN0Fj?=
 =?utf-8?Q?dW1GXD/vEQs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJxdTJCcktBNlYxMDh4RzlxRGgwRVJBODZmT1ppdll5Tzc3V1Y1SjByNEZv?=
 =?utf-8?B?NkVsRE83bEgzejNIaDc3RS9jZlVYbTJGbURiT2FKZTFXREtsWTNpMWJRVGdV?=
 =?utf-8?B?YXVPL1RUb0xyaGJXSUlOT0hzVm1XSlkwc2E4RHpRRENvRTQzc0ZHZWJCWFJw?=
 =?utf-8?B?TU4xNGN6dUxkZzhmaVNyczBEeXJPa0oyd20zUWdkaXdYOEZldkdNcGljQ1Iy?=
 =?utf-8?B?dEU5VXZVVnV4R2t1L0ViWDNsRUxTbi9wd25sZkZlYkhqVzVTdXF0Q0NJK1dR?=
 =?utf-8?B?dmZ5Zy9MOUltQVRxd1dJcXBZQnMrbDRDZW16aG1MTkpJbUpzVmpiV3VCRnBh?=
 =?utf-8?B?QkhLSU5aUnNYaTgzUzgrLzlxZ29qUW11RFZqMG9sSUpLdFRhZ2lxelc3WlZv?=
 =?utf-8?B?MnRSQmNTekVnRjRURG9Md2N3YklhdUhRV1MrR2dOME4xVXhrU2pMY1JnUWd1?=
 =?utf-8?B?TWM1T2lRdDRnZ24vWVVqQXo0SlRwcldjaXp3dWliWUVMb3FxaHFjenM4UlRR?=
 =?utf-8?B?T0F0dS9vSXhPaFN6U1VjV2hLNzlwNStBajIxa3dwOWRDSnZJcmdMZGNGM3RC?=
 =?utf-8?B?MGtoM0ZIVVg1VGYvOENRUldLVC94WnNnV3p1dVJGVS9NakNHWmVVYXhjRnEw?=
 =?utf-8?B?RzFEaFJ2N2JRR3hxYzArSUkxV2tjREVsakg5UjJJUEl1R09zYzVwRmFJUHZC?=
 =?utf-8?B?YWxieE0vRnViWUlSUktXdlo5TFczd3FaYjh5T09PK0V4TTlxVWVOODk4bWtB?=
 =?utf-8?B?TGFZTXRNTnRvcUE1cHp5MjdLeGRSSUxDRW42TE5JK29MUEFCUXBuYlpVNlhi?=
 =?utf-8?B?ZWZ2Z0NHUmtWWVhIcFM3aWJES2V4ZEdFenFIQ21SVENPNUM2VFVRTDcrelp6?=
 =?utf-8?B?Wk8zazdQZVMwb2UzRUx5c29OQmc5TmJDSTNhcUxFbTFNNUVjazFmUGtyTHhu?=
 =?utf-8?B?REtHUnlPNWVDYytvZUxhY2dFNmFwVjVTY0g1NWg4MHV5WUVib0wxZjU1RWx0?=
 =?utf-8?B?RjZrem5XNE1qcHBFY01RdEdHOHYvYlM5dTA3aDR0ZXRNdjVOcXlDZzR1azl5?=
 =?utf-8?B?SU5WUXdBaUhFOWJzd0hJWjhWRWFHY1h2VTZ0VUVWQURmdStvU3YxSldwZUMz?=
 =?utf-8?B?NnBzNTQ1UThuL3l1MXNiVGxCRUlJS2pCbzZaZ1FaRm5jb3RpV3RFcFVlOW5t?=
 =?utf-8?B?dG5Mb1pXSEdzWmM1d2NTL3BqWks2V2RnNG9McmNlWHdTUGZCWnRoVnU4cjFs?=
 =?utf-8?B?eFVvaUxGNWJqWmhsaUpxODA2eDdFaUI3ZzR6aytzNmthK0kvSzR6dUQ0c2Iv?=
 =?utf-8?B?d3BUV2tCSnFlSlAwMFFIUC94cUMzWHBwOUJIQmxDZUJ5WDI1RW1qRFlWdnd2?=
 =?utf-8?B?ZGQra2toNGY4UTBlN1hsN3dIcGM3T2wxR2l1dE91aFhVZjltNzlueW02V3Yv?=
 =?utf-8?B?bTFTVVAyTk9XN0ExWlJ1VjVvb1Q3SnZEYkhLYzNzWHVWNDVuaTFDRkNWV3Ra?=
 =?utf-8?B?T3ZpbjRqUGcyUTZmYjIwSHZSZDc2K2hTUUxWZzd0dlZJVWhtVEJZYTZuaVRE?=
 =?utf-8?B?bS94Y3dvWktTRVZWa3FxQkkzd0dKTDdZb0JUekVtenI3T0dheEtIRjNzUkdm?=
 =?utf-8?B?UzhvbDNnanNkNFNqTU5xWUJEYTdIWWV6ZU55b3FEMSt5UU1vM05KRVRNUzFo?=
 =?utf-8?B?akkxQ3ZuL2FMcm41aXA2U1B3RURVU2FGbVFpNElWNlFzdVpJNEEzSG9yRU9K?=
 =?utf-8?B?VXg4WWlCLzFKb29JSkdkbWZwZkwwRjR5eUxMdnJLMUhzc2dRSGovdlBZY0FW?=
 =?utf-8?B?K2xPRHpzaG1LZlBnUFZQOGlVbHpRay9Ya1A3eEVaSHZSa3YwZUYyaWM5R3pK?=
 =?utf-8?B?bkFxTVFkUW94MUF5eVRUZStadEFhUUFoQTJFNkdRMW12NVRnaFc1TnY3eVRV?=
 =?utf-8?B?WlBvRlo4QXVVK3RFM04xY0hnMU9peEgxVnlmUm5sRW4yeTkvdndWTFl2eWV6?=
 =?utf-8?B?aHd6SHFWbUFQK3k1MDdURDVvdHZlWms5N3hlWHhXY0toS1IwUWk2SlgwQ25V?=
 =?utf-8?B?b242ajFxT1VBM0lEMTVTNEVSbjRwT3pPMk1NTmpQMHFzZnd3Um42TS9ZeXJI?=
 =?utf-8?B?MS9rbDJjZUpTVUhJTmgrQVRkbTE5RUdUcnB1ejNxeDhoclVWeEExdVhsSXE5?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333713cc-f564-4125-f40e-08dda98fe223
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:02:39.7206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /G4+FmVtUzNQv00CfrZL21QPdSE3IBZecjLOd/B74ZQLSvOFsf7J7cXWwaAR3SQXyXw2FYo1iB5PQpFL0y9h+lKJGlZ1mZ2STMibjuYQOFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
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



On 30-05-2025 04:24, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:55PM +0530, Himal Prasad Ghimiray wrote:
>> In the case of the MADVISE ioctl, if the start or end addresses fall
>> within a VMA and existing SVM ranges are present, remove the existing
>> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
>> unmapping of old one.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
>>   drivers/gpu/drm/xe/xe_vm.c  | 18 +++++++++++++++++-
>>   3 files changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index a4d53c24fcbc..5691bb9dbf26 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -942,6 +942,31 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>>   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>>   }
>>   
>> +/**
>> + * xe_svm_range_clean_if_addr_within - Clean SVM mappings and ranges
>> + * @start: start addr
>> + * @end: end addr
>> + *
>> + * This function cleans up svm ranges if start or end address are inside them.
>> + */
>> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	struct drm_gpusvm_notifier *notifier, *next;
>> +
> 
> lockdep_assert(vm lock in write mode);
> 
>> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
>> +		struct drm_gpusvm_range *range, *__next;
>> +
>> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
>> +			if (start > drm_gpusvm_range_start(range) ||
>> +			    end < drm_gpusvm_range_end(range)) {
>> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
>> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
> 
> Why evict here? I don't think that is required.

on susequent fault the vram allocation for smaller ranges fails for 
first time with EFAULT in drm_gpusvm_migrate_to_devmem and with retry 
its succeds. But prefetch for drm_gpusvm_migrate_to_devmem  bails out 
saying retry from userspace. Hence evict ensures the prefetch post this 
also works.


> 
>> +				__xe_svm_garbage_collector(vm, to_xe_range(range));
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   /**
>>    * xe_svm_bo_evict() - SVM evict BO to system memory
>>    * @bo: BO to evict
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index af8f285b6caa..b36f70ab3d03 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -92,6 +92,9 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>>   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>>   
>>   u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>> +
>> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end);
>> +
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -312,6 +315,11 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>>   	return 0;
>>   }
>>   
>> +static inline
>> +void xe_svm_range_clean_if_addr_within(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +}
> 
> Maybe...
> 
> s/xe_svm_range_clean_if_addr_within/s/xe_svm_unmap_address_range


Makes sense. Will change>
> Or if you can think of something better but don't really like
> xe_svm_range_clean_if_addr_within.
> 
>> +
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index c220bf904ee0..8208409485f6 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2359,6 +2359,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>   			op->map.pat_index = pat_index;
>>   			op->map.invalidate_on_bind =
>>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +			struct xe_vma *old =
>> +				gpuva_to_vma(op->base.remap.unmap->va);
>> +			u64 start = xe_vma_start(old), end = xe_vma_end(old);
>> +
>> +			if (op->base.remap.prev)
>> +				start = op->base.remap.prev->va.addr +
>> +					op->base.remap.prev->va.range;
>> +			if (op->base.remap.next)
>> +				end = op->base.remap.next->va.addr;
>> +
>> +			if (xe_vma_is_cpu_addr_mirror(old) &&
>> +			    xe_svm_has_mapping(vm, start, end)) {
>> +				drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +				return ERR_PTR(-EBUSY);
>> +			}
> 
> How about dropping this.
> 
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>   			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   			struct xe_svm_range *svm_range;
>> @@ -2662,7 +2678,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   
>>   			if (xe_vma_is_cpu_addr_mirror(old) &&
>>   			    xe_svm_has_mapping(vm, start, end))
>> -				return -EBUSY;
>> +				xe_svm_range_clean_if_addr_within(vm, start, end);
>>
> 
> And here add a flag to xe_vma_ops which says we are in madvise.
> 
> e.g. XE_VMA_OPS_FLAG_MADVISE
> 
> Then...
> 
> if (xe_vma_is_cpu_addr_mirror(old) &&
>      xe_svm_has_mapping(vm, start, end)) {
> 	if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
> 		xe_svm_range_clean_if_addr_within(vm, start, end);
> 	else
> 		return -EBUSY;
> }
> 
> Matt
>    
>>   			op->remap.start = xe_vma_start(old);
>>   			op->remap.range = xe_vma_size(old);
>> -- 
>> 2.34.1
>>

