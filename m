Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6973AC83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 09:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D73D10E1BF;
	Thu, 10 Jul 2025 09:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyIwRW5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0811110E1BF
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752141164; x=1783677164;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=G95ufdJexyFQrel7MnrrZpMHSO72BwudUBNasvXDYUk=;
 b=kyIwRW5FlvnWq8XkQsDN0KHUDz1BzHXwoTNJd0pFE9vYL6EPAPfRq0Q0
 W6WN7MqE/F9CAFnWFGZ6ZmBcOk8cUfN/IOspxmiEc2SsUqkmYlpCmAJLG
 pKVvpemn7msnitfml0ZuzPPlodtdyhAM+5pGv9z1XyjHAyD5W3NWY9167
 iAEvkpV4i7n1WAuRkKSD+myAS/iTS66ezra1euNbcGfMK/zeeMko8gIDZ
 WVBLatuL+iJ809aVJQ4+sc/xYUzvn3B6fTilSuB04DtWEbDEk3WhsBEnw
 yHqmpJVdkyVg4pYNmjz60ZVbGGJrMSVpfZth6B7+b/v/sjzQ6vhJdviDS Q==;
X-CSE-ConnectionGUID: Fpkg1FdeQH2Azp2/8VL2aA==
X-CSE-MsgGUID: dVPWUogaT2Wj78O9tQOKpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54510127"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208,217";a="54510127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:52:43 -0700
X-CSE-ConnectionGUID: llKZpUatQT67msAXQzNMAA==
X-CSE-MsgGUID: Ot7FTkEESHqgOA24hx0krQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
 d="scan'208,217";a="187000495"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:52:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 02:52:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 02:52:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 02:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw3KVk75qnfJHOKd1wEGmywcu7HOUe2orJkNxFaoxY/HpDtJDsBTNjSXoQsXKFXjpl4uoqytxkzJvA2sjKG9AEVhMVcxGzquLb2yR4KwfvkG9ppBHsQPEZwvrRuN4WGt+1pC+nalOd2QuSLt4pipy8yDr91+wj+ryMUnGyJ6INyV4fB3U/QNzuNtgICTEyP/Z9uyUWRFXSVReBX0N21Rwv1lU6nxwKdy/7O9Bk5Q5FrxMBCVsN0O0MAiycQ6lovGBKOKZ5x9HfQ7nXPpCGefIUE7dd7rIljjOC0ch9pEMlA8XGKd+ZQKTjJ1/CFRsvTsT3kKdn7CqikYbVz2PUzOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwD3oDu2vf9UyikxgVjz8sDXNM2l7uNR0U9SPNqKYF0=;
 b=q9R1oYusDkuUg9vLG+3OHrn2AzkuCHPRa1GUpAhKs9As13nCFKmlWE7D3aqqoGLzFo0CkfeJ8Yy98poo7HyyOvsvFtzSXMlkYooz0av7AnCxzadRsNsOFdfDUzoQ0xM5ovQIw6LUYvSZ4caIj2l+FFbeY9jBzD1xQp44w/wQyeb/Zffr/ZHkDvamifQxs4Kk7Tm/aOORESWT+orCM9OHuYoL0QeOCz4kbiBULokbRuQKnbHrugOMovJSc7IajS+/aLuzkROc1Z4uTiQi6Mz8nr7UyuyRz9VMHsokq8rEC+DxuBTYHUSWWisgflH6rmd+KjYwn6p0/LKhveGcKPSFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MW4PR11MB7103.namprd11.prod.outlook.com (2603:10b6:303:225::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 09:52:36 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 09:52:36 +0000
Content-Type: multipart/alternative;
 boundary="------------upZEwfD2G6GNQGT9yxi5VN9o"
Message-ID: <7d706505-5924-4c3c-ae9e-df1bc7c68d2c@intel.com>
Date: Thu, 10 Jul 2025 15:22:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/bmg: Don't use WA 16023588340 and 22019338487
 on VF
To: <intel-xe@lists.freedesktop.org>
References: <20250710092630.370341-1-jakub1.kolakowski@intel.com>
 <20250710092630.370341-2-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250710092630.370341-2-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|MW4PR11MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 560b687d-3030-4ca5-8ee6-08ddbf977fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3dHMjVSd0NsdHRpeEN5YTl2RUtTVEFLWTlMd1o5MkM2Q3JweWpqZW1ydS9V?=
 =?utf-8?B?NWtKelF6N3Y3RFJycThhT29WcUhSU2pIaXEzSm4rTnVGZnVEVlVadTI0UHZa?=
 =?utf-8?B?OGJNWldNRDZ0RjBpc0JtRFQ5a0VxajZpV3R0OG50OFMxY0lBcGhOQlk2M1c3?=
 =?utf-8?B?V3lOdVVra3RkdkJTZS8vZ1NGVkZaeEtpeWExMUpySjBOTEhXVzkreHVRMmUr?=
 =?utf-8?B?MkhNOFVmT1UwSmJsSjZ5Zllwb1F4RXAxNlFMdVFHUlVJUUh4NStzWFhFblFo?=
 =?utf-8?B?a1ZvSEcwUmt6YmNFb2pTWFp2SUdvVWZJNThSV3Izd25ITUZrSjk2a0liY2hE?=
 =?utf-8?B?WXRtZ0dLMk9IVEl1ZFVzSGJoZmIvemRrVE5FeVVWQUo2cWlKSXRObjNGNGdN?=
 =?utf-8?B?WTEzYmNPM1lBQkVHYUw1SXlvd2JvOGxsYS9ISlZteWZRZjFqbnlWUkc0N3Ux?=
 =?utf-8?B?dVM0dGlPN1J1blU2SENhSmthcDU1OWR1RFJKaDNyUldyRnhoU2ZJQnk3a1Jr?=
 =?utf-8?B?Tmdpd1RmbDB1OVdaOFZ5NnZUeDJvNk9xUEk0Tm5KTUVNOGg5NkttbjFNeHlF?=
 =?utf-8?B?RDI0Y2hvc2ZCb0NYK204RDZ4ZFRDQjNUZEhQM1JHdkVZZlJkbW1OM1p4ZEJu?=
 =?utf-8?B?Qkxkcys1ZUMxWWE4V3d0UGFFdGFRT3VoalZEQm92NWtBaWcxbTdGMDJhMW9S?=
 =?utf-8?B?N3VqVDQyekI1ZXp5Qk5DUzVpalA5Qzh4ZE0zcng0b2RXbE0xYjJXQWNyb0ZJ?=
 =?utf-8?B?RTBiOVU3Wmw0NWVUQlRpTDBFeGxITkxtb2JSK2VHbm40ZDNnOUo5MTUvL1VD?=
 =?utf-8?B?bkhLMVlodlFxTlNLMyt0L2tGS2IrS2JnUmZLVHRncHV4U2xrTU1XL054aG92?=
 =?utf-8?B?NENwMSs3YTcveTJmSFRYZk1PK1dqdzdERGpLNmNKSWZETmxIZ1F1dG1wZ0hw?=
 =?utf-8?B?aHhHWG1HdmZFcU5HUDVLQ0EvZTNmR1AzRGlhVms3emFXelh5N2xxVFQ0bnJX?=
 =?utf-8?B?aXhkR1pFZjlzMFVHSlBidmpGQjVnYndmSWpNeDN2OGw4OXp6VE9qUmJQWlV2?=
 =?utf-8?B?NUxnRlJlOTdadGxIeXhqbXlWV3dHS1RJdm4wTWdlbzJkRWVKNG11NmtxaEt5?=
 =?utf-8?B?RjFreitUWGJoSERaVGhoQXBrellMM0toMG5qOTRINE9PeEI3bFBIQ1M5T2Rz?=
 =?utf-8?B?ODFjeHMwOVNOUjlxMkNrYktHb3hmYTVZUFJyb3cvemNqSmQzL1ZLU1RCd0ky?=
 =?utf-8?B?YnBrNW9iNmlaZ1RtSHZGNGRVc2M3b0RkeG5vZ3NLMDAwK0RrZjBvTUd3bGx4?=
 =?utf-8?B?M3ZIT2xSTlE5SkY5RmVUTGoxYjVXNE5rNk9XbWlwUFJucHFzM0QwQjlCdG9U?=
 =?utf-8?B?MUtXNVh6cjNSenVTSU1udm5FeFVkMFNaUGxuc3lOQkFIWnRubFdsbXZxU1FY?=
 =?utf-8?B?cEYxaU0rY1RyUjIxb1g1a2dSN280TmF3YXR3emJyWi9VUzRkVTNDQ3FiUWds?=
 =?utf-8?B?TjBnKys4SU5aTnBRTmVTS0tqMHZQKzJMajh4azVaYVZYbEhMNldydFNVUUR6?=
 =?utf-8?B?NzhnaktsZ1JkeWIvL3o5YksySUVEUUR3cmFMUEtUZWxCcHh5eEVPRW5aQzYz?=
 =?utf-8?B?VGgwWVdnTXFhdFlrY3hBbE9TVGNoaVpxaUZUblVHTDhYNDlyMS9La2xETkFE?=
 =?utf-8?B?QzhhbDU0TzdwL0JVY3NDK1Fic0plbFJTWjFiR2lQaURzTUhyZEJ4dTlXemxM?=
 =?utf-8?B?WGhxeUVwUVNqRll1RjJSTlF5OS9GZzdSNmRyMkpRaFBtQVM0di9Bb2NTM3lI?=
 =?utf-8?B?cGdZNHIrYjN3MHFMVmNFc0czSzI3WlZqMWl6RUpUVDNrT0thYWI0MmtlQ3dm?=
 =?utf-8?B?QWN0YVhFRzF1Y3p0Y3B6NFg5UzNZckh6VEVuSlRVV1orSUNZRnMyT1U3Q0Zq?=
 =?utf-8?Q?8APvzN0vII8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z084MXJueExhRGM5WUgxZkgwYWhKMm9rVlBiZ0VVQmJjbGxPZHhtbzRxalFS?=
 =?utf-8?B?RGZVRFBSbHJmV0QxU2V1d1VGMVhXZ2FkUlBWeVBnalBFb0VLVWJmOUM1eitI?=
 =?utf-8?B?L1ZoeXdUMTRYN2JGR2dTS1RHcVJyajFXcFl6N0N1YmJObTNuWkMvOGUrMUpi?=
 =?utf-8?B?L1MvZmFNUHJ1Z3JjSEVDU3A4c2Zkcy9DMDJ4MjBHQ1RubDFRdGNOdTAxWWpZ?=
 =?utf-8?B?QzhzSktXT0k1c0k1UGJha3V1a3hZSzF0ODNkWXc2RTg3WFZUUGFFVjhoTEdD?=
 =?utf-8?B?SVAwY1pJc2dHMmZoTzlWQ0tSRW5nZTUwRU9DWndJcXdhV3pMTGp4T0JLUnMx?=
 =?utf-8?B?ZWNSWTRWelJrckx1T0Y4MjZGZUc1ZVgyTnRxK2diemVJSmYzdE5Nak1Ea0Mx?=
 =?utf-8?B?ZkpSc2htSlVBejJrN2M5SE11eEFtMGpQaDJ3eFQxVTJHK1BnbFVFVFdhNmZx?=
 =?utf-8?B?MVdkbXRDYmgvdGhJdjlNdDZYOWZXY0NTUXkzTlRxaTRHeGkwa1JoODdJRGIw?=
 =?utf-8?B?Z0xlU3lTeHJMMzUyUGFjMzlCMzRTNGhzMk5KZmk5b2NYcktoejlRMXRHZWdk?=
 =?utf-8?B?VWR1bDZ5THlzdWwzTGtKVUR2d2Y5dWxldE1oNTRjcndJYURlcXA3U05OVkhX?=
 =?utf-8?B?ZFRLckZDL3prV3pmS05KZElqak1QRzI5bFFoTVk3aXZuSUR2VG8vWWNMcVFH?=
 =?utf-8?B?NzhCbjBKMFlyNkVCQXJ3ZTRNSDR5dDVCVncwNXdjODlLOUNnQXJCb3F4U2NL?=
 =?utf-8?B?R1dnbG1VUVgvU3ROWHhhMDRoclZpNFBsUFRxQTMyM1l1VHhZNjVPMjhTSEdJ?=
 =?utf-8?B?UFlsVi9lNlJCZ2thaUhOOW5UVldqZGdJNU5LZnhpWGliUjB3dERPdHpFSWJQ?=
 =?utf-8?B?V0tQUlRWNVdKd1ZhWnk2c1ZnbGQyTmszeGl3UkxwY0pWTUZ0UzlxTkRmbWJB?=
 =?utf-8?B?dU11VTY4VVNFV05wVUdEZDNRMW9ndHdLQUszWEZySXhDWCsvYldFZXQ3bmxR?=
 =?utf-8?B?QnpDc3RzNUpMaERrQzIzajZNTlhWNGRlSzdHMzRrc1J4d2o1UEh1QlFBMmY1?=
 =?utf-8?B?aHN6SHZDc2h5VEVaekk5ak5paUtVMndZd0xyalNOeHFEckZMQnFxVlJudU11?=
 =?utf-8?B?T25FWmRnN2FoMHZNL1VjN3NreThkSkkrQ2tjdE9SZGIrZ2YzTkc4QmZtMEJX?=
 =?utf-8?B?LzBEeWpOWm54U3dYYzNpRU1vSFpZVDhvaERUY3ppSjFpTWJoWEFYUWt2ZkVo?=
 =?utf-8?B?Q0lJY3VzSksvWkhLd3V3U3ViQVhQTHFlcmc3OHdCSVVuYjE1SGh0TFI1Ti9o?=
 =?utf-8?B?ejBoRmVLbDU5Z3UvMGVueFp2TW9lMlc3OXBFeTZmR0lMWXB0WkN6ZGpoWDRD?=
 =?utf-8?B?MHBKZDg5UmZOMkhKZFFna2VXdkRFYVVsV2g5clBLOGdRanYxOHVBOFdhWXN0?=
 =?utf-8?B?RmtyKzB1RVE0MkNSUTMrb3FJVnlpbVJYMmFTNkpvZitZN2dKaElYbkZZZlAz?=
 =?utf-8?B?bWxUbEplMys3K1FiQ0E2Y2lVUUQrdGFtbFkyM1UxUW81UnN0dWZLMnFGRWo4?=
 =?utf-8?B?djkvSUFvMnkvZVJLcCtQVmxmSUF0d2xZbHJkc2FWLzBxb2c5aXlkUDNjOUV3?=
 =?utf-8?B?Rzc4SGdWVlUwb1pENmRsNnp1NHVDV0VhT2lBT1FpVEZ2OHlJV1piNGhCeHlj?=
 =?utf-8?B?bE5xV0NkT3FxcXRyTGVKNTRTN0RvV3JxWFc1ZGw2SXFxQmtHSDllbXZCcnFE?=
 =?utf-8?B?OE1FcXZ2VFNCNzQyU2d1enAxUzFzaVhKTmZYMk01TkNpaEtNN21mTDRuSVJD?=
 =?utf-8?B?NjZpU253RUpuNlZSTnNZNklNQXgxMjZrR3BpSWhHanM4QVp2c2pQM3lKdVZ2?=
 =?utf-8?B?T2lsMzcyQXJuMldsa0xPdUFnYzBhWkpCUXlUMHFlZGpBanArV2ZtRHhFZVFn?=
 =?utf-8?B?TkdCOU1TZDBsK0Y0dFdVYUo2VmQ0TUQ3ZmQrak9IWkpKbnIxN1I0RXBRMW5G?=
 =?utf-8?B?OWRmWTM5SW5kRFJoTGlnWHpvUjlNcnZxYTRJbUlXZVNZUENGbHlxaFJDeG1S?=
 =?utf-8?B?cTBXZjBONWV4WVR5RXpyVU9yT0FkeHYxSzhmeXhPVXRwbllUdnVUS1VSSnoz?=
 =?utf-8?B?Yy83K2RiZXg0K0dCYitseDdIRzkyYVJUS3RoelJDSk1sN1ZVTUttTklpYmRy?=
 =?utf-8?Q?zr25xidIcxlEONGj+tDuDrU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 560b687d-3030-4ca5-8ee6-08ddbf977fae
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 09:52:36.2487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjQlcLYN2Pt8nZdo1GpLfRYSFY4/BOsbRoFoH3zIuT/UMRZP2xhKJgtrF+wxE3OE2jgNzY5NAbK/TBlHaFyeLnvjxJ2PN+vqdrUFS8WLLhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
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

--------------upZEwfD2G6GNQGT9yxi5VN9o
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-07-2025 14:56, Jakub Kolakowski wrote:
> From: Michal Wajdeczko<michal.wajdeczko@intel.com>
>
> These workarounds are not applicable for use by the VFs.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 96cc33da0fb5..e7ed5d583d68 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -40,10 +40,10 @@
>   		GRAPHICS_VERSION_RANGE(3000, 3001)
>   		GRAPHICS_VERSION(3003)
>   22019338487	MEDIA_VERSION(2000)
> -		GRAPHICS_VERSION(2001)
> +		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
>   22019338487_display	PLATFORM(LUNARLAKE)
> -16023588340	GRAPHICS_VERSION(2001)
> +16023588340	GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
>   14019789679	GRAPHICS_VERSION(1255)
>   		GRAPHICS_VERSION_RANGE(1270, 2004)
>   no_media_l3	MEDIA_VERSION(3000)

LGTM.

Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------upZEwfD2G6GNQGT9yxi5VN9o
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-07-2025 14:56, Jakub Kolakowski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250710092630.370341-2-jakub1.kolakowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>

These workarounds are not applicable for use by the VFs.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 96cc33da0fb5..e7ed5d583d68 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -40,10 +40,10 @@
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 		GRAPHICS_VERSION(3003)
 22019338487	MEDIA_VERSION(2000)
-		GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
 22019338487_display	PLATFORM(LUNARLAKE)
-16023588340	GRAPHICS_VERSION(2001)
+16023588340	GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
 no_media_l3	MEDIA_VERSION(3000)</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="color:black">Acked-by: Satyanarayana K V P &lt;</span><a href="mailto:satyanarayana.k.v.p@intel.com" class="moz-txt-link-freetext">satyanarayana.k.v.p@intel.com</a><span style="color:black">&gt;</span></p>
    <blockquote type="cite" cite="mid:20250710092630.370341-2-jakub1.kolakowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------upZEwfD2G6GNQGT9yxi5VN9o--
