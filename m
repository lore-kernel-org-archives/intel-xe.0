Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C6C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 08:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1252E10E866;
	Thu, 26 Jun 2025 08:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtXBQXnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F1210E866
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 08:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750926860; x=1782462860;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zMwkfIBa2Kz/2rkbAm0reio38hi5UwwdiX3hRSuC/o0=;
 b=DtXBQXnjC2LEsYF3PctvFyaolmB+m/86cb1fnt25k/K5HvFsDtfj+Eku
 zSOzbM+mXNkX1tyF7gbameQ4U06tMHHfaRdb10gDMsE5VOEGq+XbnUJ1b
 2+lR+qQMGW2SqyfS+5XNGxnWDWh7/49Hy7S5h7hrKxWb9q1CqlJa2BQfL
 iRLMJ3U3rvpEnBqworGw0dWw2dUDfchVh6mbe97wdyD2q6LK/ahC5MNXm
 vxEHICNalK571N1D5ibNdY7Pe2dKvwRzqHrow4on216f3qxKfFSEZmD2w
 uBhg2zRBuMFuCMr8z9/I3GzzakEBjMRIqQJCnFEpJ8IIaicogeZXn8DDU Q==;
X-CSE-ConnectionGUID: JQwkSzf4RpCZjpfvhJZ7kA==
X-CSE-MsgGUID: XdqLI+msTiS7QkGjdjrtWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52331206"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52331206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:34:20 -0700
X-CSE-ConnectionGUID: w2RqFZcnTtqxTB3PsKUNDw==
X-CSE-MsgGUID: Ztwbpqi8STya1c6RRW5QHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156724976"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:34:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:34:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 01:34:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOWB9zOfNa6vtFo7KoElUICLcBVWYZ2FEFm1nozy1w+Ag0Ltg+ZrbZ1Oe4gPtJ4tL/u/ACgdNjGz0vY8/GyK7k1MRsrkPjwfow/1ZbhgT085yRYhotQliOL5PB91accx1TZCbFt6L7PFCE0j0cDXjE9baKKQrz0S15qNuWrUFTEI4fzgmJbd6xB29QJTCGt4yjprsxaB1Jz/CO23F5BSX5SJYYVqlllp1fYpE7spr50czgjnobeZPxq5Tum4aUA5TYw1nbTiRbvZPDQ8UD7RYyaCl3+F+xX3vLoP0K+2ByKe8dUPIfXvKt95DGReg89/srYrYjBRzMAXgwKWyBlESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bh8l1XjWGr4VVwigGgVHYDPS7tIQar1QnmSu21pM9Bo=;
 b=C5yr+hflItrZZo4oRpDTxlyqYaLZTg9v/+NNa+qb9+koKvzh7BOcUcfqJP1t7VL85ie319sY+4svJOQ0C/TxJcRhOGoBdn5CP4WiXbMv2d28sjignHBekBOtYIjqjp5i0ff0dkEgey5I+hBMNyf7LAeqMcqOAjt1O/ICmc2Go2HUav75elr2oLRt3sTK3rwrNiygobFT3dysvd0/TQLRjmtENgaKDY89NIcSspZDYGhtWk1zARw/lsNsaGMwJH/MnkAJo9YzbkseTqeiT8fgjylIlimM9Cd+LIbCaTI24ryLnpTX+HDw9+VnbYmabltWsgrc0f9uqgm6rOvFwn6BEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH7PR11MB8551.namprd11.prod.outlook.com
 (2603:10b6:510:30d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 08:34:17 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Thu, 26 Jun 2025
 08:34:17 +0000
Message-ID: <ce602ff1-e06e-450e-8b4e-5ebf30d41c16@intel.com>
Date: Thu, 26 Jun 2025 14:04:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/20] drm/xe: Implement madvise ioctl for xe
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-10-himal.prasad.ghimiray@intel.com>
 <DM4PR11MB5456041A620E64B89F40BB9EEA7AA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DM4PR11MB5456041A620E64B89F40BB9EEA7AA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH7PR11MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e673689-f6dc-4a3d-10e9-08ddb48c3cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGwxNHlYMEpJU3lCbnh2S3pKK1hpdXhqMjdMQlRjeVpEYnNPTEdONUN0aWhT?=
 =?utf-8?B?cUtzTWhRMkZsL0JSZ2loTzd1L21mZVFzVDRzWTZOMzY2bHk4bUhYbWExelVX?=
 =?utf-8?B?RU45aDgrWk9CNVpMK2lPT2k5UkpqY3gxaVBDcjc2blRhSkJuVzA1MnRSNHZx?=
 =?utf-8?B?ZmRyRlJLWHhBZjJ2RHFVN09yTjNKZGpGSzB4eGM3YWJpVTRQeHZSU1U5QUNm?=
 =?utf-8?B?aFV3RFVIZ2sySEF1SDBRMXV4MTFmdVhXYzhrYVpZWUYyWnlhSktvaWdsN3Zk?=
 =?utf-8?B?OFVsQUVEU09JWDZQR3BJTG5DNkQ4Zmx1WFhoNVNMdDV2VW9PTUNzNW83aUhZ?=
 =?utf-8?B?K3ZMcTZXMlU2U3UyT2NNK0U1aTRvaFdGOG1oaXAvS3NnZXV1Uzkyd081bFA2?=
 =?utf-8?B?bVRWRXFNSVd2eVVRSHNrTUxYSkVNRGlBRXA3R2ExL0dhVnBkank4eFp4L2Rl?=
 =?utf-8?B?aHV4SlBHY0FtS0lZd2d5eDJRWkhuclZJOUNvSkthTEhNQ3hYbllUTkRQZWU5?=
 =?utf-8?B?QnU1V3R1MTRRSnNHTUtzWmk3ektQTmpPQnpuQnh2UHZyU3RheDEvcUlZMzhs?=
 =?utf-8?B?TTFEbHo2WTBSeXZua3J0ZDlVOEFwVzBneElyZGJSRDhzQTFvSGdEL3NoNy94?=
 =?utf-8?B?NmRkbSszZFBWZ0hGdTRJZnNFRXFocVNUcHFWcDdQeXFQeFhZSG5VSThrc0Yy?=
 =?utf-8?B?dk9WaU9BTGVjZGNWcjNTUHlacnFsNk1ZclhXdmNIQzd5QU9sVGVEd0ZTcmxr?=
 =?utf-8?B?UW1BL2VzZHhEendnWlIyZ0FNN3ArU2hMWkdqbldQN0Izd1Vwb3hzMEVNUjk0?=
 =?utf-8?B?ZlFhMkR1TEpHYUhHWk9yQ2l4bEcvQ2NCTDgxZlhKMWFGM3czZEFwdlN6TzE0?=
 =?utf-8?B?bVJrTHBQNHNmOHdrcEtLdkxEcFVjL0J6NlhvY1JjQkpkUTY1NXJhczh5KzF1?=
 =?utf-8?B?QWFWZ2pQeVFuWTlhaHVCK3crakMrS0dtMC9WVnVWdlBVdEZKVEtXVU1zY1dy?=
 =?utf-8?B?WnQ5Sko0eUNIeEcyOTVYNVR3TUVsYnZzaEtvQmxIMXRTcFpWVGxuN1FZNEZC?=
 =?utf-8?B?UFRrQmMvaUdNd0h3TU96UnphVGsvRk9qeW9KK3JTa295akk0elZuS3pib1N0?=
 =?utf-8?B?V056Mk42ZS80YWg3WGRVemc3bWZPV1BDWFU4QlBJS3lKUWZtUDA3ejVPUDZt?=
 =?utf-8?B?VjMrRVkyRzNDOUg4aTZLUkZFRHdsMXMweng1WmMvdk9mTUpXT0M3dlZRVG02?=
 =?utf-8?B?dFhkMEs5ZVJ3RlJFMlovVk0zTmQzMTdxRmNtSlZxT2czQU9OSG81WnVUekxr?=
 =?utf-8?B?TVJPNEFuRlZGWWgzVDNaMkhTdjRqQmxWNUIrVFo2WW9NWDlmRXFqdUhVSjE5?=
 =?utf-8?B?Nm1vYnB3OEZlK3FoM3d5VVFPRzBGWjg1VU9lYysxOWdiekl2LzJmRk5EeWd4?=
 =?utf-8?B?WXdac1VoTFMxYmZkL3NYRGdJYW94MW5iNnk1M0htSW8yQVJ6emc0eVZkSzlL?=
 =?utf-8?B?cElxNEpEUC9meFhSQWZQKzRKMDhWMUJLcUZhVTJxYmxONUhKM2ZTR1V1WmFl?=
 =?utf-8?B?SHdkTmNzQWE5VHU4N1pEdm1ETGEyYStLbU5BNzd3TGNnckttd2Z6TGlXenc2?=
 =?utf-8?B?UHBoaEdLQUhqbllUTXJpWTQ2UDNNa0VMdnlvZGFwK1VXaFl6d0l1aVFSNmJC?=
 =?utf-8?B?TDFrVlV0V1ZpUjEzR3NNTXlQNWlqcldVMW9WNzJ3WUdaZDd6c3I2cmp5S0VH?=
 =?utf-8?B?RHJvME92Uk9iV3ZHQTkyVFJUaTcvV1luLzVldUpGZWdCNnVTaE9OODY4YUhh?=
 =?utf-8?B?MWR6dnRYdUNYT2gvOXQxcFRtQ2RxVnJSNzJjY25SeDE3SnllV0wwVlFHVjRi?=
 =?utf-8?B?RUhqSEptaHIyWnBqNWdsN2FidlE2VTBMV1BDdVgxaUtzV0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlRNL3BvR1lwRm5rMElpU2VURkZQUFdSeE9DVmJ6S2UvSW5hNTh1WG0xQzUr?=
 =?utf-8?B?VCtyWVh1OXBic2R5TWZxaEE2dXdhdzJuVnM1RzBWZmVMS3dtR2svTWZIWjc3?=
 =?utf-8?B?YXlWdlFjYy9pOUhjMFFlNkFtSWpwOExTNE1ORnpVYnJHV0EvRGpSU2VqSGlT?=
 =?utf-8?B?WUs2bTZ4QTJ3Y1M2OUVvUHdrYmlTdXJsaWpHWGRneE51SVZhOEwwOTRIWXVE?=
 =?utf-8?B?czlVN1FvZWd5bzZNZlJudzg5TXhyNEpHOFJoOE91dmVubyswd3VZUUhEMEhw?=
 =?utf-8?B?KzBESWJVRGZaQk9OTlhtZTNwUmYrWEQxYXVrdXhzQVZMSHpxOWtLWk5PaG5i?=
 =?utf-8?B?QmwrNmU5UlJRSWF4YUZBbXI4ZGp4b3RaaEtLQmdjTGVQeStLejU1bWhaMm5W?=
 =?utf-8?B?K2tXMXVidVMxb2k2RkZJbm1MdGgrUnZiUzZGRlhvMUV3ekdFUUV6QTMxanZx?=
 =?utf-8?B?M3E2OVA2MmpGaFl4ckoyb1c5RC9RYzNXQ2tPbHpram5zVFVnWjdlTTJkRFZ4?=
 =?utf-8?B?dUJBRlhVcEM2SUFGRThlZ2hpcHZpTFBSSGIzYUlrT2ErT25mQ3dZNmJoT1cr?=
 =?utf-8?B?anhCTkQxUW9IY1dtdml1ZFJqS2tTZ3NqNGVJWkhuekVNbjNXbUNkNjM1ZFN2?=
 =?utf-8?B?ZXAzV3dxS0ZON1RJOWpucnFhZ2N1OVUyQTBhWG5vUnJYVFQvTnZZVGpVR0J4?=
 =?utf-8?B?Sm1wTzY0TVBwejRNckFHR21kQlMxSUp1dXg0WEdXUEFSSk5JVjlQNlNEYVRy?=
 =?utf-8?B?TFYvenVSUmhJdUVlQmRESGN0NHdLWE1COHAvMWY2blpKNXpCazB6NEdCYjNY?=
 =?utf-8?B?bkg4S3J1M28wNWpld3h2NVpZM1Exdnl0WGlVeWxKQ0ZtUERsR3QxL2JlK0x4?=
 =?utf-8?B?WFdOajBrbHlMeGkyb3RLUlhsUk84SnV2VzdiaGZNSTRKTXJTZzVJdWluMU1t?=
 =?utf-8?B?M0dBSktxTlduVDdLdlBVN1MralVIZzBEMzZWTE41UGx3QmNRMkRPWmJSMDRx?=
 =?utf-8?B?SWNZczNKRDdiVlU5N2pxeTZieDBTZnB6WVlkSmcwOHhZTzJwVC9QOXJ4dURz?=
 =?utf-8?B?K0pudHJuRFR4MWprSWJmME9hWFF4Z2JFNFNvNk42eVUzcWNNa3FuWjM5SzNK?=
 =?utf-8?B?YlROWk1WK2FVbkplYUYxMDg4cTFaNk5QdFJPU0lqdm1ZVlZoczRwbElIajZS?=
 =?utf-8?B?czhhU1pCekVRVzFNUmFGWm0vajVqVVVSUGF5WkQxc1RuZGQrM3NLK1hQd3FX?=
 =?utf-8?B?YTNSYlBLRHV6eGE0aSttMmoyMlpWQWtCSktRSHh2UDIvSmJpTnd0SkdQQmUr?=
 =?utf-8?B?ZGZqeGZJODlQTlZXV1M5a2h4YnRVVWdyWlFKOUhPcjBpUEpxR2Zma2VYcHM0?=
 =?utf-8?B?R29nTWZrU29SOWQrWTlxM0JXQUJyNnhFRVBBSElGM0l1K3NVK0daYUlSZVl2?=
 =?utf-8?B?bWN0ek9udHNubUlBNkNJaVJHL3Z4T0Q4YUIvWGFUVnRPTEVDc2pSdlMrRVMy?=
 =?utf-8?B?RW9OcjhWQ0t0SUo1dC9PSUNNZmg1dGFLOElWVWEycnhJYzE3NVpHYVVnNXNM?=
 =?utf-8?B?MnZjOVFyS3Zsb1I5QUdCb21tNkZXQWtpVnNqNVh6YUc3WXI1S0w5dFRtbUVh?=
 =?utf-8?B?ZjVHQTBiSFJMMVh4cDB3eFpRSXRPTThFaGNwa2Z5R09KM2VZSTR5RWRQcDRB?=
 =?utf-8?B?MHpkTFdodXNhb3dvd0pQb1BJa2RCbTZzdlFWTHVJRTZ1UjJ2SUxaQjlJOVZX?=
 =?utf-8?B?R2RJY0V5SFExZWY4NGJyRzBXOWNMOGhvY0ZVOUNnUmFMRHJmcTl4YlZrQU9L?=
 =?utf-8?B?U0NTNXQxY0dnN0JFN2pldG1mRFdabU9mV1AwL2grb0l4bWszRzdKRmExbDNo?=
 =?utf-8?B?NUxPTW1VeGxBaGdBakh0MXV5SHg4ejgvVlpWemIxWHdXSTNnZkNYNmh0OHR6?=
 =?utf-8?B?cXBKYWxTa29qZ2VMQisycFlHSWpkeDd1UVR4ZUIwQTdsT2p0ZEhGcm9oS04y?=
 =?utf-8?B?R0x1TmRNNDF6YUYxdjExaDhsVmFWUWpsUFlQc2NJV1ZpM2hLK2xFQ1lKRUdv?=
 =?utf-8?B?QS9BRDZZRWpsZ2FRWEo2dVI4bmhHSjlGNExHMUloVWV2Zm9vVnM2czF5MlZ0?=
 =?utf-8?B?azBXMTB0L1JwTzlpY1NMSTB1My9zbjhNdEdQc3dPb1kwZ2NMbnk3M0VWVVlX?=
 =?utf-8?Q?Aj+OqL9o2t5T+S6sEOQI1L8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e673689-f6dc-4a3d-10e9-08ddb48c3cfd
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 08:34:16.9400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9rwmtL43obG9N1CCcb0yeRHL2rBnL3Rr4X1HUmRYnxNRGdK+dey2zjKu3Nc7XgRO56kqfhsYfgmKlm4tgXYY8/j3pn2lJIy7Uvap7XT6UA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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



On 26-06-2025 11:34, Lin, Shuicheng wrote:
> On Fri, June 13, 2025 8:56 PM Himal Prasad Ghimiray wrote:
>> This driver-specific ioctl enables UMDs to control the memory attributes for GPU
>> VMAs within a specified input range. If the start or end addresses fall within an
>> existing VMA, the VMA is split accordingly. The attributes of the VMA are
>> modified as provided by the users. The old mappings of the VMAs are invalidated,
>> and TLB invalidation is performed if necessary.
>>
>> v2(Matthew brost)
>> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non fault
>> mode too
>> - fix tlb invalidation skip for same ranges in multiple op
>> - use helper for tlb invalidation
>> - use xe_svm_notifier_lock/unlock helper
>> - s/lockdep_assert_held/lockdep_assert_held_write
>> - Add kernel-doc
>>
>> v3(Matthew Brost)
>> - make vfunc fail safe
>> - Add sanitizing input args before vfunc
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>   drivers/gpu/drm/xe/xe_device.c     |   2 +
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 282
>> +++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_vm_madvise.h |  15
>> ++
>>   4 files changed, 300 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile index
>> f5f5775acdc0..d375b549c30f 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>   	xe_uc.o \
>>   	xe_uc_fw.o \
>>   	xe_vm.o \
>> +	xe_vm_madvise.o \
>>   	xe_vram.o \
>>   	xe_vram_freq.o \
>>   	xe_vsec.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 7d9a31868ea9..632d3ab12392 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -61,6 +61,7 @@
>>   #include "xe_ttm_stolen_mgr.h"
>>   #include "xe_ttm_sys_mgr.h"
>>   #include "xe_vm.h"
>> +#include "xe_vm_madvise.h"
>>   #include "xe_vram.h"
>>   #include "xe_vsec.h"
>>   #include "xe_wait_user_fence.h"
>> @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE,
>> xe_wait_user_fence_ioctl,
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl,
>> DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
>> DRM_RENDER_ALLOW),
>>   };
>>
>>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg) diff
>> --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> new file mode 100644
>> index 000000000000..ff560914ad7e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -0,0 +1,282 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_vm_madvise.h"
>> +
>> +#include <linux/nospec.h>
>> +#include <drm/ttm/ttm_tt.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "xe_bo.h"
>> +#include "xe_gt_tlb_invalidation.h"
>> +#include "xe_pt.h"
>> +#include "xe_svm.h"
>> +
>> +struct xe_vmas_in_madvise_range {
>> +	u64 addr;
>> +	u64 range;
>> +	struct xe_vma **vmas;
>> +	int num_vmas;
>> +	bool has_svm_vmas;
>> +	bool has_bo_vmas;
>> +	bool has_userptr_vmas;
>> +};
>> +
>> +static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range
>> +*madvise_range) {
>> +	u64 addr = madvise_range->addr;
>> +	u64 range = madvise_range->range;
>> +
>> +	struct xe_vma  **__vmas;
>> +	struct drm_gpuva *gpuva;
>> +	int max_vmas = 8;
>> +
>> +	lockdep_assert_held(&vm->lock);
>> +
>> +	madvise_range->num_vmas = 0;
>> +	madvise_range->vmas = kmalloc_array(max_vmas,
>> sizeof(*madvise_range->vmas), GFP_KERNEL);
>> +	if (!madvise_range->vmas)
>> +		return -ENOMEM;
>> +
>> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx,
>> end=0x%016llx",
>> +addr, addr + range);
>> +
>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr +
>> range) {
>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +		if (xe_vma_bo(vma))
>> +			madvise_range->has_bo_vmas = true;
>> +		else if (xe_vma_is_cpu_addr_mirror(vma))
>> +			madvise_range->has_svm_vmas = true;
>> +		else if (xe_vma_is_userptr(vma))
>> +			madvise_range->has_userptr_vmas = true;
>> +		else
>> +			XE_WARN_ON("UNEXPECTED VMA");
>> +
>> +		if (madvise_range->num_vmas == max_vmas) {
>> +			max_vmas <<= 1;
>> +			__vmas = krealloc(madvise_range->vmas,
>> +					  max_vmas * sizeof(*madvise_range-
>>> vmas),
>> +					  GFP_KERNEL);
>> +			if (!__vmas) {
>> +				kfree(madvise_range->vmas);
>> +				return -ENOMEM;
>> +			}
>> +			madvise_range->vmas = __vmas;
>> +		}
>> +
>> +		madvise_range->vmas[madvise_range->num_vmas] = vma;
>> +		(madvise_range->num_vmas)++;
>> +	}
>> +
>> +	if (!madvise_range->num_vmas)
>> +		kfree(madvise_range->vmas);
>> +
>> +	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n",
>> +madvise_range->num_vmas);
>> +
>> +	return 0;
>> +}
>> +
>> +static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm
>> *vm,
>> +				      struct xe_vma **vmas, int num_vmas,
>> +				      struct drm_xe_madvise *op)
>> +{
>> +	/* Implementation pending */
>> +}
>> +
>> +static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>> +			   struct xe_vma **vmas, int num_vmas,
>> +			   struct drm_xe_madvise *op)
>> +{
>> +	/* Implementation pending */
>> +}
>> +
>> +static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>> +			      struct xe_vma **vmas, int num_vmas,
>> +			      struct drm_xe_madvise *op)
>> +{
>> +	/* Implementation pending */
>> +}
>> +
>> +typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>> +			     struct xe_vma **vmas, int num_vmas,
>> +			     struct drm_xe_madvise *op);
>> +
>> +static const madvise_func madvise_funcs[] = {
>> +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] =
>> madvise_preferred_mem_loc,
>> +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
>> +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index, };
>> +
>> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start,
>> +u64 end, u8 *tile_mask) {
>> +	struct drm_gpuva *gpuva;
>> +	struct xe_tile *tile;
>> +	u8 id;
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	if (dma_resv_wait_timeout(xe_vm_resv(vm),
>> DMA_RESV_USAGE_BOOKKEEP,
>> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>> +		XE_WARN_ON(1);
>> +
>> +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
>> +
>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>> +			continue;
>> +
>> +		if (xe_vma_is_userptr(vma)) {
>> +
>> 	WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(v
>> ma)),
>> +
>> DMA_RESV_USAGE_BOOKKEEP));
>> +		}
>> +
>> +		for_each_tile(tile, vm->xe, id) {
>> +			if (xe_pt_zap_ptes(tile, vma)) {
>> +				*tile_mask |= BIT(id);
>> +				vma->tile_invalidated |= BIT(id);
>> +			}
>> +		}
>> +	}
>> +}
>> +
>> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start,
>> +u64 end) {
>> +	u8 tile_mask = 0;
>> +
>> +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
>> +	if (!tile_mask)
>> +		return 0;
>> +
>> +	xe_device_wmb(vm->xe);
>> +
>> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end,
>> +tile_mask); }
>> +
>> +static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const
>> +struct drm_xe_madvise *args) {
>> +	if (XE_IOCTL_DBG(xe, !args))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
>> +		return -EINVAL;
>> +
>> +	switch (args->type) {
>> +	case DRM_XE_VMA_ATTR_ATOMIC:
>> +		if (XE_IOCTL_DBG(xe, args->atomic.val >
>> DRM_XE_VMA_ATOMIC_CPU))
>> +			return -EINVAL;
>> +		break;
>> +	case DRM_XE_VMA_ATTR_PAT:
>> +		/*TODO: Add valid pat check */
>> +		break;
>> +	case DRM_XE_VMA_ATTR_PREFERRED_LOC:
>> +		if (XE_IOCTL_DBG(xe, args-
>>> preferred_mem_loc.migration_policy >
>> +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
>> +			return -EINVAL;
>> +		break;
>> +	default:
>> +		if (XE_IOCTL_DBG(xe, 1))
>> +			return -EINVAL;
>> +	}
>> +
>> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
>> + * @dev: DRM device pointer
>> + * @data: Pointer to ioctl data (drm_xe_madvise*)
>> + * @file: DRM file pointer
>> + *
>> + * Handles the MADVISE ioctl to provide memory advice for vma's within
>> + * input range.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct
>> +drm_file *file) {
>> +	struct xe_device *xe = to_xe_device(dev);
>> +	struct xe_file *xef = to_xe_file(file);
>> +	struct drm_xe_madvise *args = data;
>> +	struct xe_vm *vm;
>> +	struct xe_bo *bo;
>> +	struct drm_exec exec;
>> +	int err = 0;
>> +	int attr_type;
>> +
>> +	vm = xe_vm_lookup(xef, args->vm_id);
>> +	if (XE_IOCTL_DBG(xe, !vm))
>> +		return -EINVAL;
>> +
>> +	if (drm_xe_madvise_args_are_sane(vm->xe, args))
>> +		return -EINVAL;
> 
> The upper error return will miss the "xe_vm_put(vm)".
> BTW, the function name drm_xe_madvise_args_are_sane is somehow a little misleading. The name looks like a boolean function, while the return value is 0 for success and error code for failure.

Thanks for the review. Will address in next rev.

> 
> Shuicheng
> 
>> +
>> +	down_write(&vm->lock);
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
>> +		err = -ENOENT;
>> +		goto unlock_vm;
>> +	}
>> +
>> +	xe_vm_alloc_madvise_vma(vm, args->start, args->range);
>> +
>> +	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
>> +							 .range =  args-
>>> range, };
>> +	err = get_vmas(vm, &madvise_range);
>> +	if (err || !madvise_range.num_vmas)
>> +		goto unlock_vm;
>> +
>> +	if (madvise_range.has_bo_vmas) {
>> +		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>> +		drm_exec_until_all_locked(&exec) {
>> +			for (int i = 0; i < madvise_range.num_vmas; i++) {
>> +				bo = xe_vma_bo(madvise_range.vmas[i]);
>> +				if (!bo)
>> +					continue;
>> +				err = drm_exec_lock_obj(&exec, &bo-
>>> ttm.base);
>> +				drm_exec_retry_on_contention(&exec);
>> +				if (err)
>> +					goto err_fini;
>> +			}
>> +		}
>> +	}
>> +
>> +	if (madvise_range.has_userptr_vmas)
>> +		down_read(&vm->userptr.notifier_lock);
>> +
>> +	if (madvise_range.has_svm_vmas)
>> +		xe_svm_notifier_lock(vm);
>> +
>> +	attr_type = array_index_nospec(args->type,
>> ARRAY_SIZE(madvise_funcs));
>> +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas,
>> +madvise_range.num_vmas, args);
>> +
>> +	kfree(madvise_range.vmas);
>> +	madvise_range.vmas = NULL;
>> +
>> +	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start +
>> +args->range);
>> +
>> +	if (madvise_range.has_svm_vmas)
>> +		xe_svm_notifier_unlock(vm);
>> +
>> +	if (madvise_range.has_userptr_vmas)
>> +		up_read(&vm->userptr.notifier_lock);
>> +err_fini:
>> +	if (madvise_range.has_bo_vmas)
>> +		drm_exec_fini(&exec);
>> +unlock_vm:
>> +	up_write(&vm->lock);
>> +	xe_vm_put(vm);
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> new file mode 100644
>> index 000000000000..b0e1fc445f23
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_VM_MADVISE_H_
>> +#define _XE_VM_MADVISE_H_
>> +
>> +struct drm_device;
>> +struct drm_file;
>> +
>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>> +			struct drm_file *file);
>> +
>> +#endif
>> --
>> 2.34.1
> 

