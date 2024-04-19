Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F09CC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B9010E0C2;
	Fri, 19 Apr 2024 14:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxwMlWGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2852710E0C2
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536723; x=1745072723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kDtC6HPfd2GJms+cXL5yNRKiDYMQrb6Kh/27+dskVQE=;
 b=hxwMlWGixrKYJzyDAA5syu/hJbupAOMJvX/7120pFSW1yDUs3xKSfunX
 h14lAhJx77mMjf44uPc59Ke5xJAYdGLS79n2UME4wONx+ebu2Gh7GmxFT
 JasudMJoZfGCVfhLkluj8SP0kNGTan/5XEih5jnGrhmN1cmzjq6dqRfm6
 fEfBjmZ7/CSGQt+jdBsFtt+nT6q+ekfjIo5+k8T0Pnsvrwl+T8xEHf/qa
 RlOAdskqmTuZYPSnbqjmvCECJmfFVVx9F74apUgb27Eziae0q53nZtuK7
 8LUsqOYr7lV55/ScWuyQekRqJlGbO1544yKR7OOcWy1DbZVaaea45VXpp w==;
X-CSE-ConnectionGUID: AlgzCsL8Rr2uw/TRVfl2+Q==
X-CSE-MsgGUID: 4+vERaADR8iUEsV/x6FDVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9264143"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9264143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:25:23 -0700
X-CSE-ConnectionGUID: N/OQ5H37S6OlXdsupFbqdg==
X-CSE-MsgGUID: 7ExDL6iHTW6herWq+dwfAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="54266701"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 07:25:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:25:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:25:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 07:25:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 07:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBNwcQVyYW7kGLBreVZ6tcuVTt7uunyRrwCRxOdhIxBqsXqED4/qbfn3iJhSOqliaOcj6D9p71H1sEEiJoCLGp6NbjX6xo/eBwK4wRpvAq9b+CPUcf4oDasUx72PBrVyD6h6wKhe0y8MSdGpkhup6oxfosjsLt7EW02uX45OpCKz2m+5+bne9IkhKtcTbDFxypCgJ7RvaQCuXVkzRHCbnbUjhOS7bqUEkJ2vGF3FTGS7mlr4miFbWyXWWP9SsVUemj2sLsJQCvGfUenCU8gc+o3iXXdlF/MycDTV5SiEkmQ+BQhDd6uEgh/GNd4Ct+CiuzsCvvoP+C2NO4rEYacgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR6ZRmqbUA99x9+k5C3ZKiOeN/B9yy0TeawJLn2Twto=;
 b=eb23qH7Gtnr6Tphi75oOLM2RvYULWV1dk/fDy9cx5q5EWhzT00wjhmOai7RHzAuk/l19s+pnS/lPmjUdJMV3HqnHnYS3EbfAQZwYN+xUQTfSkgy1lNF4FGtjMfDcQE5Q8wwP8H2DlbHOO2o8uEUMXwFI1IpFfctzdBGI/yzzjyuo2xisqRJ01P+C9uBnkrLhfP5ebRa4Jg1+IEIXZYLu4dBfLEfhJfjQC9xYDH1JdF25ag5Y/0MpldoBSi5v3HCYu7sPf+c1YYKQ7+YbWm+6gb5VOTlnAylChrRV1In/WOnRR3+EHh0GNval2ndFLI8SS1WZbFN/uzyW1L43EDZkPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7384.namprd11.prod.outlook.com (2603:10b6:8:134::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.29; Fri, 19 Apr 2024 14:25:18 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824%3]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 14:25:18 +0000
Message-ID: <65bcccf4-475a-494a-b88b-40afd0aae639@intel.com>
Date: Fri, 19 Apr 2024 19:55:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Remove unwanted write permission for
 currN_label
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
References: <20240419125945.4085629-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240419125945.4085629-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f56ab4f-c6f0-49e3-8852-08dc607c898f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTVHc2xhTUMyUjlYR3hPTy9laVFNQ3MvUHBKQ0NtN25RajFPM1EwY2FwNHZ1?=
 =?utf-8?B?Q1dpTUNPZ2dVaFZXVFRnbTNRaHY4YkZsMzVUZHpkeUl1L1ZLUmdKZ3BPV1VW?=
 =?utf-8?B?enlNSnN6bHIzL0w2SS9jL2VoVlJoNHR3OW5aa3NOZ1NJRS9qZDFubklkR1JB?=
 =?utf-8?B?REp6azZFaW85RjNLSHFPMU8za1N4ZFRrcnBYZ0JKQTROK2MxTTRqNUFFL1M3?=
 =?utf-8?B?d2lGWUc0YUMyOHNvMkJyK1MrWmtqSHM5KzA5bDVyTXlUa1NhWld5a2V6MlFu?=
 =?utf-8?B?Qm9wQzJacWV0ZWo3V25hSnlQZWkwYXFMaloyNTh5M1RJL0xWTTdwYnh2UHI0?=
 =?utf-8?B?RENCZjJhMVBuSW9ZSTVLQTJpcjY3YTlRWVhINUVTdXZDMEZWWnJBSU5YY3F5?=
 =?utf-8?B?SUdROHRZQk9LejBXZXF2Y2VkMjZ0cXo4YUt3NG53dkd3eExuZzZsL1BkNXZU?=
 =?utf-8?B?d0E2a0hSM3hGQUY4UU9tb0FyNXJiQ2NyTy9QUGNUd3BIenB4eUtoS245czJo?=
 =?utf-8?B?cVVXNzluR1Fqei93VUtiNU04UlZuVnM1L0J1M21tU1lmamRvbnpUR1JOY2xH?=
 =?utf-8?B?eGxpNm4zSDk0L215T0xwQUNvQXZMdXNlUTlXTEtTWEcyODdKRm9FNXorSk5N?=
 =?utf-8?B?K2JITE9PeXRYKzBxTG42bis0TzBmN0puM2o5TzUrek9DMWhHY0VJYzZ3MW5F?=
 =?utf-8?B?aG9SNFhReVZLUnhTVXBUTWVhNWNPQTFNWjN0YVJ0OVZ2OWo1Qm1BTlhrTkp3?=
 =?utf-8?B?ckFtam84d1h1cjJNOE9MZkFvekE3S2Z6U3ZpRy9TcnZzSG01TloxeHRmSFFF?=
 =?utf-8?B?S0pnRVlZQnh1Wk5mTVdtNHN5aUp5Nm5mc0c2UkF1UHBIZVFSTFVYNGdKNVVZ?=
 =?utf-8?B?V3Y2Q20xM3VQOWcra0lVTXVhNlBHRzVtK2xBN3dsTGk4clo5bXNNYkFNelpp?=
 =?utf-8?B?N3FEeUJZWG1QRkJGcS9Qb0R3eWNCbENxc2FpT0doYkRJVHF3QVZkTnIzRUtB?=
 =?utf-8?B?NUlyQ1NKcWxGSnM0N2d2Q0FrWTZlVzN5a3gzeUErdjBrRDczd0pkUDkzZTNx?=
 =?utf-8?B?NUh1d0hhK1A1RUR3eC9IYWVFMUJCZm9YTit2Ym5CTENYd1BNQlowck5oTTg4?=
 =?utf-8?B?bkdTNHBoYnpqanRLb1dFZzFoS1Z2VlFDMFpNdC9NME1lc09WZE9vVFZlbFhX?=
 =?utf-8?B?cE5jLzRLTnF6TGtBei96NldtbEdKUUlTelZFMHY0V3JEcCtQYzRqWEh6YWND?=
 =?utf-8?B?UkR5WVBlejIvK2R2anhreUtlbENQcFZPTVpiZUl6WDFnZ2Zkd2pSdnhGL2dC?=
 =?utf-8?B?Rk5STGduT2xOWlAzdkVzN1JCRkQxYXFnd1VGS05paDdRVTF1ZEVNOERvbkt5?=
 =?utf-8?B?WTdVYXdqQ1V5Q2hDQkRDRlJrMW5YNjRpNnlpNUJRb28xeTNkTnBPSG02dUdh?=
 =?utf-8?B?Zkphcmg1TldlVGdXTmpDYXpqRlo4OFFHbFlSOFVzNkpBVUhOa1lRMGhIcTZP?=
 =?utf-8?B?T08vZ3g2S2sxdkZwMFZxT1M0RkZYcUZpMkNNWk12U3RFL2xTYzVOUkwzdTVz?=
 =?utf-8?B?eE9aWDQzbjRZZXpGamhOem8wcFBtY08yK0FtN2pXSEoyMlNGVkhxUG42ZEtM?=
 =?utf-8?B?amExL0VHZ3dJT24wNTBwV0NsRHVxRCtJS2RhK0ZlNmRZMWZ6SlpVVUdIRkkw?=
 =?utf-8?B?WlFSOE5ycWQyODVJV1FxM0oxWWtxU09NdjBTZEhSanlVTnR5OFB3UXlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE81azZ1bVNaOGI3RW9nRzl3QllQOU0vNFU0dkFHTlBwVkp0dk5oZjhtR001?=
 =?utf-8?B?VXFlU0J4ZjNzem9KYUdrQUlQbFpyY2xwby9OdDViYWllbmNCUmtRV3I1cGVk?=
 =?utf-8?B?WGkvaHc2cFFQVDUwbFNEaVJHdTBDNzB6bGVkdjFTNitZK0xkK3IwTmlITStj?=
 =?utf-8?B?OW1xMENvVmtJOFVYQmZzb1A3bGptamNOUHRLYStoZSt6Y0VhcUNvOVp2S1I1?=
 =?utf-8?B?TGNJYlpZaHFzSThFME5oejlvaktNTWdwRFY4NDloN0RPdi8zcDlaK2V0MVBa?=
 =?utf-8?B?cVZMQUk1SU52eWMwbVpob3Z4d1NYR0FKN3M0aU8zUXJVSThMazRvZTl4SVRO?=
 =?utf-8?B?MUo2cXNrQ1U3MHNWMnpldG5MdXRPUytCVDBibjFjUFk3L1ZEbk93ZHczaVhh?=
 =?utf-8?B?MStoQTU4NCs1VFdZWEtBMlBCUm9xKzJDYTd5dFFiWXBhYUdPWGJNaXcxU0hZ?=
 =?utf-8?B?U3NCSlBjU0ZualVweTJKOWRVUlRsZzRYaW11UktSZ3BCeFJUc1lzSmkzaHAx?=
 =?utf-8?B?Zjl6QUd5ZjlrM3kySXRjVmc5R3A5eEtCNDdOcGdheHRabmlGWC94amdWVkF1?=
 =?utf-8?B?b1g4Q3pzUGJLQ2xFdDdONU5sdStxQlpjdUhaMmF4ZHJvbk9zTFZ0S3B5R2Uy?=
 =?utf-8?B?dFpwNk9SbmFacXBhSm81WHNZcGRUT3NEQXlLQjFERXZjdFpWRWRvVDVTM0pq?=
 =?utf-8?B?YUtmcHEvRmVHSTRXZFhMWElZeTRVMEp5dHFXU21mWTAzR2pjSkV6TGVGWlEy?=
 =?utf-8?B?MjBLb2VPZWVNbzhxSGFOU3NaOTNvY1lvNkVpY1hjR25yL3pqVE9HVzE5ZGhQ?=
 =?utf-8?B?b1l5ajRWcHFLcnR6MGRQaloxdTBmdnBrYkRieFVySE9rWlhHM3B4dStScWQx?=
 =?utf-8?B?MzNVc2psVXFBbTR4ZkMzS1lnZXRMVktIRWIwRDQ3OWp5S2M5MnlPVnhSSnlY?=
 =?utf-8?B?Zk1NSkNzODdGaGhMRDFub2cydDhieEFMNmJIa2NvOEhPZlk0cGxFa3EwSWRD?=
 =?utf-8?B?bG15Y0tWeGR1Q3dMUHZHRlpEK1VOTVB2bUZGOE40YXVndlg3Z2wrR2Q1bGFK?=
 =?utf-8?B?aUtQRUN1OU9RZHBPTUprVTNPNENVSlRGSjlFVzZvcnV0ckJ6M1ViNW1vNU5o?=
 =?utf-8?B?ZTQ2bzFBbm81UDV0YkErT2dXem05d1V2UzNnVG5NSWZhTEpVbXR0M1hnNFFJ?=
 =?utf-8?B?NUYxdTcrNGxMY00rRDlZMmd4bTNZWm1lTm8rbW5CVk1BQkxTV3R2bGlFWW95?=
 =?utf-8?B?RGoxRld1SXBFN0JobkdDVVF6M0hueGlnTXZHUGV5WHh2cWtweFQ4YzVLNDV6?=
 =?utf-8?B?ZTZqelhJUkdCY1NBSWhueWp6dENxU0NRa3Rtc2Q0Yk8xL1liM2lIOEJpWVVk?=
 =?utf-8?B?ZUQ1Qng2YVU4VTREdE9CMGRPSHlIWVlQdUpNeVBjZDJIWW1jaVlQeUU2a3JM?=
 =?utf-8?B?dEdXWXJLbWczaExFQmNTZ0thOUp5cTlWclQrQ3cvckovcnBnNTZUTzRtRDRZ?=
 =?utf-8?B?YkFUcGQyVHNHckc1QkhkRytrOXI0Yk40SW1qenlZejJLZVA2VjZobE9XTFIw?=
 =?utf-8?B?U0FnSEtnUTMxVEJVMkoyMjRKU1JMVVRwL0tzOGI0Um9FZFpZdHlSU2hwd1Rx?=
 =?utf-8?B?WGF2dWdZWkdnQlpRdWtMN3FWc1VGWTRmNzA1NDkxeDFDOFRkUGRMKzlLN0E4?=
 =?utf-8?B?T3V3ck1DaGIydlZYa2d2NDNLYVI3ZlFqTHVmdk9vT0d0VXlCbWhUbEhVQzBF?=
 =?utf-8?B?VlRPUHVyQjlEVDdpZmlwT1JGY0lXTG1DalNGVVQzRGVia3VtYzFJVGpiZ1JF?=
 =?utf-8?B?TDhHUkgwV0NHcmdSSG5SYXZtRFV4WVNwK1lRQVZ5M052Snc1eitOY3M5UnND?=
 =?utf-8?B?TFJIeGJsL1NNY21nenBrRk9XNENHa3h2cGdRTnlBRm5ZT01zN0owNjNnYk5L?=
 =?utf-8?B?RlJrTEJHbWkzQmgxdnIzTDNhejc3UDFJdVZQeWxKQjZTSDRDYzIrSUg3ekM0?=
 =?utf-8?B?Q2U3OFE2YS9EbmwzU01YSEhvSVdBb3UwVFpTL1hWT0w0SVcrMk1OdWFlTVJC?=
 =?utf-8?B?QWhnVWhHWWlCTkZYV2lFRDFIK2w0YmVvdThKNGd2bXpYWWt4bFE2OWxjOHdz?=
 =?utf-8?Q?azuBGUrVAUztohNM8OySXxSnN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f56ab4f-c6f0-49e3-8852-08dc607c898f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 14:25:18.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZIEJKtlZjUmM6xwCTpKFt38dJ4C0WcLb//zBD34+C99b+YsOEq8z9LL3d8kUpYmC1TMwgFGivLtTvxStox0ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7384
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



On 4/19/2024 6:29 PM, Karthik Poosa wrote:
> Change umode of currN_label from 0644 to 0444 as write permission
> not needed for label.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 453e601ddd5e..dca275117232 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -550,12 +550,17 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	u32 uval;
>   
> +	/* hwmon sysfs attribute of current available only for package */
> +	if (channel != CHANNEL_PKG)
> +		return 0;
> +
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -	case hwmon_curr_label:
> -		if (channel == CHANNEL_PKG)
>   			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
>   				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	case hwmon_curr_label:
> +			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> +				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0444;
>   		break;
>   	default:
>   		return 0;
