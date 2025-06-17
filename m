Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2588C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 17:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655D010E072;
	Tue, 17 Jun 2025 17:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYoILIR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224F210E072
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750181777; x=1781717777;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=omfTf4EonEOzWkxkllCa5ar9o9mdUp5HZVLdtQ8xM9U=;
 b=CYoILIR1hFF6mdNdWIKiLGnd0+TZvsoZwT1RMPGXsDENGDJKM5saWXxC
 XIBQ0qc9H4Nh1pZjZOFqfjO3Z+kUC3+bAu59V1KeZXCbD+CimrtX6I84b
 yFMCU5qwNRPdBl+uGm2vRwj6HHQkyeWUrMJqXkJa4EvsR1y7NoE1sbX65
 eytFq+fghjnJBOD9pvfdUSV5GsYhG7hYwzNO5Rer117lJfRwdiF/v14m4
 L1l2agpliQ9JEnKww5HIgmNZ4J88LJOx0EA+dNAkEmgldIM7Fqf0jXi/r
 wDDFZ9isHb2Spmgzw9QYEUqD90eTTTmkdi/H7+MMoUqSA0EUjQDCjoscI Q==;
X-CSE-ConnectionGUID: rnx4uO9kQvuranUpT+3q6A==
X-CSE-MsgGUID: VeNr2TOoSSy94dcuwUovWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="77777079"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="77777079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:36:16 -0700
X-CSE-ConnectionGUID: PO8GdYdmSzO2Ax/3B7syGQ==
X-CSE-MsgGUID: 9zjn5PhzRlCzM+xOaYkd+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="153799575"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 10:36:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:36:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 10:36:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 10:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui0oJoEfu9PXtYZyig5n9D0lqly28te6MQT9FliMQpsarXf/kaNnikzTgP5aobgs6/pp1ENs590L/flI/VFCsEjdYx2IqAJeHePfKxKpXLO77ZR81K2Z89b56J0EMBnp/6vfMmLtoLmpwItqpHH0t/NrqcQflFQ6mDYlPHrES92JLRKVQlU/605cUIzKCR6SvGrOtJnSSh9tgLXSfOqMV47bj0wvdSP5HtBx85JLJpfv0uamnY90ZxZCAOW+D0FnMopK5km7Z7Q6RIpoX3ZjcIWECLfFzL0IAXrlqW8kuqrljdpMJY5LydxFRg87K986f+2Y55epDd7d4TSSQMttsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVYZeYV0wvRntwWShtGE93RPa/EHu4GhUA/avkuw6Q8=;
 b=FYvdAbfHSJS8P3No8/BCJ1g1kKd3leY4GecayT6MzBa7d4FaUZE35WIbmHpEnvy11lS80cLBTodZ8wVOPLfTz7fpukTdv99cVU5hT8LCMTPG95nqdRvfYzy2zfZfclPvwuXAMzXx/7twHu3Cj5evy/1SUGL+rAx+HTYy5tyWElYJqetoe7KyuKNDN+Bck+OVBXONuKCKyZUxi/0ejouvqkAvwz9WRJ5fSpJwllKXzYJvpUka1dv2S95EMMQPeFxgWc5RsRrahmQ2PAjmDQbwGQ2bLi8j0FPQgzC+VisQMFNgt11lqWB5KlCJ1NVSOKwGyOD9yLgF192Ix0TJJ/nKSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7682.namprd11.prod.outlook.com
 (2603:10b6:8:dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 17:36:13 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Tue, 17 Jun 2025
 17:36:13 +0000
Message-ID: <f2b047bc-2092-4f49-8c2b-588cbe55e456@intel.com>
Date: Tue, 17 Jun 2025 23:06:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Opportunistically skip TLB invalidaion on
 unbind
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
 <20250616063024.2059829-3-matthew.brost@intel.com>
 <6c3ce96c-7817-482d-835d-3925b9b52111@intel.com>
 <aE/I4T51X7GYc7ZE@lstrano-desk.jf.intel.com>
 <a7284910-025f-4938-8cd7-02451a0f16f9@intel.com>
Content-Language: en-US
In-Reply-To: <a7284910-025f-4938-8cd7-02451a0f16f9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 3372ab8f-9fb2-40f1-c0b1-08ddadc57451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXdiUkxrZExGTW9xdVV0enZsRm9neU56L1gvVjFWT0tzZEwvUG5kVEphZ2F0?=
 =?utf-8?B?V0QzRHREeVM4N3pLMncyTVcrTHJXdCtIUitCNGpLVy9PVWNwbmpuRzh6Yi8x?=
 =?utf-8?B?d1BaWWFxR2dMVmQ1WlRqcG5qU014Rk43Z2ptN25HZW1wcjdEcDJVQmF4UE9J?=
 =?utf-8?B?NmE0bkh4RUJ0WTlZQ3N5eFhmdHFhY1JWbjZYMUxMWGlZc1NIdUJoaXc5cS9H?=
 =?utf-8?B?WnZ1bzBHS0xlaXROUkVQRy9FcWpDRGIvWFF5TjgzanZpR2hhUkRxOUhwLzFr?=
 =?utf-8?B?cVR6d1hra0xuR0p1ekxGKy9OZUE2aVcreSswU3JPVGlQcWRjaWx1Zy9nTEtC?=
 =?utf-8?B?WU9nMXB2RDBIbTdBLzBxL1ptZldacng0cTkrMnpRTyttSTFJMXhaaVJveWtm?=
 =?utf-8?B?NmF6USt1VHhkMUswclR0MHAzQ29ZVzdHOHR1blYxWVVXcGdjTHdUa083NjZj?=
 =?utf-8?B?OXI0UHJuZ0xZeWZiN2ZjaWZlaXo2ZzcxNnltK3VNSDhsUzZ1MEY1VFk1UEJt?=
 =?utf-8?B?c0xrOU9rdlc5b2JDMlVqZlhleUw1UXZPWTZocDl3cVBpczBoYWhwelJBSWVW?=
 =?utf-8?B?eVQ5TTd2VzM2b1AxUVEvK1JYT29raHB3VjNmdzFRdkxlOHlxSi9JdDNycTA5?=
 =?utf-8?B?U2Y5bUVFUzcwdzhXRlhJMURKbUttT2xwSklrMUk5bEFBSFU5YmdsT3NhNGNy?=
 =?utf-8?B?T3Z6TWIvMW94ZUk2T3RRbGUwQUxzZDlxRDZxd3FnckFUdnRPS0lMYmQzTlVZ?=
 =?utf-8?B?ZFdOVXdtb3lBYXc5WWIwTmlSZ250MDlCNVlvTDdFRHZPKzVuTWVXUGxIcnps?=
 =?utf-8?B?TEpuUDRBczcyNERaTTRqMWdFV3grekxsa2FUQjcyVUFDQS95dHRsakhrZFlC?=
 =?utf-8?B?M3k1MEpNZEV3T0wxOWE1SkZaVk14UjJkdG8zcU4yOTJFbVkxMklIOHpxS1VC?=
 =?utf-8?B?RjA5dGtlUGtmKzBWVTlRZXVYWkZQV3BzT0NmQnlZdXUvRGt6R1NyVVNBMzJS?=
 =?utf-8?B?VFpGRVUwbTNJd0d3SWprS0w3MUxNRkJ3dzlrWHVWZnFQc25RTERqdGVoUTdW?=
 =?utf-8?B?b0JRaFBkN29TYnc0L3VlUmVDZDhVYzdmelNKNXNPVGs5NnpIdkNZRTU3M1hF?=
 =?utf-8?B?cmtMaWNBK0RxNmtoWGswVjJmZm1Tem1vNEpZTmMzeFJtT0FTcnY2cWNoYUFR?=
 =?utf-8?B?NmpteW52elJvbEJ5cWhMTUEwRXpLc0p0QmxkeUVRUHhvanp5Q05PaVF1R3g5?=
 =?utf-8?B?a2lDRnpQcCtOOGJjYitXYnpxUU9JWE9nQy9oSVErazZwS29WYThIM1cvcElM?=
 =?utf-8?B?NWkxWnpXVXdxWmJlYUZOZEQ0OCtuMEo2WE5XVEttTzhwYXpFM3dnZUo0MldF?=
 =?utf-8?B?VTcvYjlWRjFWNkhQSlNWRUVieWR1K1hlemZacmpzNlRMUFlZZWhEcVRyb0Nx?=
 =?utf-8?B?bU54VHF4ZUtoQTJDV28vdTNHQ3BMNCtlNWNVZ1UwK1JuVUVER2tNQkZxd3gx?=
 =?utf-8?B?bUtXYzBhQUdJdE4vd2MxUHRtVVdSdVJOZUlNbDNBeTJteHBScHZPc2g3WkJ5?=
 =?utf-8?B?UHFzQmFjZk54SkhKNzJ4QjBnYXZmMXJRN3prTjlBang1ZFh6TDd3eW90Rkxs?=
 =?utf-8?B?YkpKam16STVsSTNkaVdOZFZMZ21RRVN5VTdNSG5NQnpTZDFsb0R6bDcyUzVE?=
 =?utf-8?B?L2prREZkSC94OGRMYkJ0ZHpjRnVuaEswVCtJM3YvNnN3K0NmaGtxYk9Na1h0?=
 =?utf-8?B?QlE4VXh0c0Uyek1oaG1nbDZiMGc4N0c5Y3M5UGd4ZytpamlSVm5GUU93U293?=
 =?utf-8?B?eFdtS3dTMnVHK3JyQ0Q0N3FOdEJtaXpRelJGZVpweDNFMkdhUVhLVkN3SVg1?=
 =?utf-8?B?bno5N0lsMXdNN1hlL2liNU1RMkZTTkt6WkErNnhjQW5ZOC96UzhnenY1c0Iw?=
 =?utf-8?Q?rOey2FWsmvc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEVUZHpiZVJPN24zMlcyMzk4UkR0dFNNb3lkWnY2SWZHQkxkdjVKeXVXWFVh?=
 =?utf-8?B?ZzFheVYrcGw4Nk5mV0hleTBId09lTUg5SmljTUhLek1YNjFmako2WitybHhG?=
 =?utf-8?B?R09QZGNtQng2a2lkS1BOYW5YY0xhL3Q0TTBGWUM3NVkycy94d1lRcUVPUG9s?=
 =?utf-8?B?UE1Rc0pqUzlpK2ZQaGxoZ3J0YlF0STY0QUFuMjE5Yng0Uno4NlR4eElyOXVa?=
 =?utf-8?B?L3NmVDJ1VkRTWHFtSEhQcXZoeUFTK04zYVlISVZqMUphMU5KU25sMnNxdlZF?=
 =?utf-8?B?bU1mWG9vN2JPb1lSQ1R1T1hTbWNBRDhIdmZCaGYrN3dBZE5LRXgxWTE2M1VU?=
 =?utf-8?B?QmkvSlJ6ZmFwYk83cXFGM0xrbFJQVTZ2K0lGNnFXWTFNK0dDODE3cEh4aTVy?=
 =?utf-8?B?b2hWQ0VkTDNKYktKSkZKQm5oZnh2RUlON0RNdXhXdkFLWHRkSzZBZ1BldjNj?=
 =?utf-8?B?b0x2dnp1Q1I1blNPTm9TM1hMMC9iRmVVTEc1a1FrejJ3M2RsSFN0MmRYeVBp?=
 =?utf-8?B?aENOdDBSazFSY0NUK2FGSzZ6MzRRenNRbkh6T1hGUHFLNE5oYUJ0bkZaTWw2?=
 =?utf-8?B?ZTVSbEU5cmozMTlVbXVmQk5yNjcvalFzVVBVa3YyUEs0Zk80OTFFQm9CYVc0?=
 =?utf-8?B?QU9HdWI3ZmdkU0pXbURyZno5cXNEWGVhSURtVTBiQkgxMlBVQXFhNmE0RzNl?=
 =?utf-8?B?K05NYUtnZ0FMUFh2WFdPZ0lYQzRxKzZKQlhFeWR1QzB6RXBSNTdZT3Y0eU5S?=
 =?utf-8?B?ZWNMc3JRL0dXNUtYTlJ6VUxVUTg3YW9FMUtOaVBNSXNwTFQwTDI1MmlKcERq?=
 =?utf-8?B?dWgreUIwbXM1ZTFXRlQxVGdRMTNvOURmUG9iamk2Y1hQbkdHZTZhd1ZTVkJW?=
 =?utf-8?B?M091d3hIVG9ydDRtaXBCeklzMng1VHNvV3IzVk9pRHNEV21lcG9lVUhxQUlN?=
 =?utf-8?B?alhLZnNDK0l1THF6S3p5eWNTampVb2hTTnhLVkZPYk1HcG14MzdObkxxMjRw?=
 =?utf-8?B?cjFLVEdzYTViSC9aalhiV3NOSk1vUDcwSFNibmZoZzdUNG9DMm9jeHJ6QWlu?=
 =?utf-8?B?eEZleTJVNTRBdDNHT2o1bjYveVUxVmx3cDB0dFhoMW84L3FOOWRRYjRvS3gv?=
 =?utf-8?B?QWtMOWdSdDVaUGZzYmlFNXQ5QWZPaC83L3pVZ0ttZWtBSHRHNUtxYlhTUFZW?=
 =?utf-8?B?NUhQT2FCY0kwVkg4V2tnbzhsU0pYUmNrZ2RUYjNpVXR5NmdNdVB4akM0OTBV?=
 =?utf-8?B?UHRKSmNGRjE5RmZyQ0hZVEZuNk9SMW96cm1FNGNkc2NtaUJrZkZPdTFkMGQy?=
 =?utf-8?B?NGdQT2UrWVFVSU9jd3MvUHJybVBaQlVHbEdnL1RqTmovK09wOXYrUWhNaW5v?=
 =?utf-8?B?T04vdmNBdHZhaGdPeDFwQm5xcm10V1BIclh5blU1OTRmQ3BKc2J0YWhzc2pk?=
 =?utf-8?B?dHBydnFmcTZ5bklzV2NGNmIwcHhrVnZFc3hJZnNxb2YzcTFKSnVRV0RXdkl5?=
 =?utf-8?B?V25pajArYTV1OWlrS1VEUEgrZU5KSGZHOHhBelJNRXpoQWFpaUs4UUZHbjNn?=
 =?utf-8?B?bHZIdHpZTStpVHBMVEdvK0NuZ0tIWkRCWndrRXVBWFBCbjJucC9xR0hpTkx3?=
 =?utf-8?B?V3Nqc2g4bmdESXpocnJvVC94Z25ZNllDRmduVDNjeUxyQ1NNbm9NdDcyRVg1?=
 =?utf-8?B?U0E5UlBCdlB4YWFXRDRGT3AwM0JEWk5IUGovdWtGbDhJZ2RNWFRyOUxDNVFs?=
 =?utf-8?B?SWpvT0dvbndmeDlHVzVkMnFXNDFmUEtFUHlQODZyRitGeEVHZ3NGeXFYS25q?=
 =?utf-8?B?M1YvMDFRL3M2eDh6NHNMQlowb1FxQ2RKWGtCQjl6amdvM0lQYjZlWS9SdXlq?=
 =?utf-8?B?a2J1WUJqTW9wL2M0OTZ5UURNUWt4RXhUUVZBWUhBQTZlSXVtSTRZWHI4VTkz?=
 =?utf-8?B?R240Rmtacit1M0w4ZE5JeGk0SkVVTWIrYWN0SGh4WVVoSC8yQm81TUVNYmx2?=
 =?utf-8?B?b2VadHEzSWpuYmZOMFI2blQ2Y25Db2QzZlJ0eHowREZURXRKT0swbzVwZTVB?=
 =?utf-8?B?V3pLejh6SUZ4WmRGaXpzOVRFbTg2SEJhL0hvd0hlRXIwZ256WHNad3M5TzNt?=
 =?utf-8?B?Ym1GL3RsN0RFd3lsK0xQTjV1RzJva0ZhYkI1T3VERjBlOUpmNjhYUVJWSmlp?=
 =?utf-8?Q?3+jZhtQjTKoL5ZAiJsB+uOA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3372ab8f-9fb2-40f1-c0b1-08ddadc57451
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:36:13.2414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6Hnw0O+wHU+AZLIU5Rley0hPF9ZPLCBdUyqru/12D+nV7UNFWjAqDEpPxl+UyJiowfKd68JrvyTZK/IMx6R4cu0fbqlKae63dxCOBAlJIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
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



On 16-06-2025 13:03, Ghimiray, Himal Prasad wrote:
> 
> 
> On 16-06-2025 13:03, Matthew Brost wrote:
>> On Mon, Jun 16, 2025 at 12:44:38PM +0530, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 16-06-2025 12:00, Matthew Brost wrote:
>>>> If a range or VMA is invalidated and scratch page is disabled, there
>>>> is no reason to issue a TLB invalidation on unbind, skip TLB
>>>> innvalidation is this condition is true. This is an opportunistic check
>>>> as it is done without the notifier lock, thus it possible for the range
>>>> to be invalidated after this check is performed.
>>>>
>>>> This should improve performance of the SVM garbage collector, for
>>>> example, xe_exec_system_allocator --r many-stride-new-prefetch, went
>>>> ~20s to ~9.5s on a BMG.
>>>>
>>>> v2:
>>>>    - Use helper for valid check (Thomas)
>>>> v3:
>>>>    - Avoid skipping TLB invalidation if PTEs are removed at a higher
>>>>      level than the range
>>>>    - Never skip TLB invalidations for VMA
>>>>    - Drop Himal's RB
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pt.c | 31 ++++++++++++++++++++++++++++++-
>>>>    1 file changed, 30 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index 9c30111e8786..b6df8995e8c1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -1995,6 +1995,32 @@ static int unbind_op_prepare(struct xe_tile 
>>>> *tile,
>>>>        return 0;
>>>>    }
>>>> +static bool
>>>> +xe_pt_op_check_range_skip_invalidation(struct 
>>>> xe_vm_pgtable_update_op *pt_op,
>>>> +                       struct xe_svm_range *range)
>>>> +{
>>>> +    struct xe_vm_pgtable_update *update = pt_op->entries;
>>>> +
>>>> +    XE_WARN_ON(!pt_op->num_entries);
>>>> +
>>>> +    /*
>>>> +     * We can't skip the invalidation if we are removing PTEs that 
>>>> span more
>>>> +     * than the range, do some checks to ensure we are removing 
>>>> PTEs that
>>>> +     * are invalid.
>>>> +     */
>>>> +
>>>> +    if (pt_op->num_entries > 1)
>>>> +        return false;
>>>> +
>>>> +    if (update->pt->level == 0)
>>>> +        return true;
>>>> +
>>>> +    if (update->pt->level == 1)
>>>> +        return xe_svm_range_size(range) >= SZ_2M;
>>>
>>>> = or == ? Dont think ranges can be greater than 2 MiB.
>>>
>>
>> This is future-proofing. For example, if we add a SZ_8M entry because
>> profiling an application shows it helps, this code won't break. I also
>> assume we will never fault in 1G ranges, so there's no need for a
>> level-2 or 1G check.
> 
> Makes sense. Looks good to me see no issue here.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
>>
>> Matt
>>
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>>    static int unbind_range_prepare(struct xe_vm *vm,
>>>>                    struct xe_tile *tile,
>>>>                    struct xe_vm_pgtable_update_ops *pt_update_ops,
>>>> @@ -2023,7 +2049,10 @@ static int unbind_range_prepare(struct xe_vm 
>>>> *vm,
>>>>                         range->base.itree.last + 1);
>>>>        ++pt_update_ops->current_op;
>>>>        pt_update_ops->needs_svm_lock = true;
>>>> -    pt_update_ops->needs_invalidation = true;
>>>> +    pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
>>>> +        xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
>>>> +                        range->tile_invalidated) ||
>>>> +        !xe_pt_op_check_range_skip_invalidation(pt_op, range);
>>>>        xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
>>>>                        pt_op->num_entries);
>>>
>>>
> 

