Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF404ECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 11:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9772E10E78F;
	Tue, 10 Sep 2024 11:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NO/Kn2ny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283EE10E78F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725966346; x=1757502346;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h8VtXWL0STcv8Q+nRiTg+mkaHHYMty4oUqfItUGmFjk=;
 b=NO/Kn2nynj5GbdYv2mgaQjVhgAMwKmDIkR/xOr0DFSt/tTV3sUXmQBpu
 d2SZ4j4SnjBRWGlZ78jKaEzMv90p5ND60mdaydGt+FRl2QG/443v5L9pW
 vnH5m/PitGJBuKbyXZZFXyAKikqfRzZ2tJl8AITXXbbOkdOdzvp5atxFo
 m8E795CYpdzHlF+I7bcjaooEpt+AXcb0kAxNaPoPZl3OqJSoEj3qXDAFK
 Q5pj/CcEP2WCiGNk/1fKNawDbwp9H4VlOavXcafuusMACs1QLchDHa5WA
 w/CSME52Dv0MEgHwq+HhT0c/doAySOuqBPetvoNLnPA8ku959YJAqMT/C g==;
X-CSE-ConnectionGUID: WptHbTPRSqCMq9mD1P9ovQ==
X-CSE-MsgGUID: e1mMrGKiTZGBkApWbFme7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35276544"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35276544"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 04:05:46 -0700
X-CSE-ConnectionGUID: pehJsT7TRDed2b+6bv0NgQ==
X-CSE-MsgGUID: fSHaRj3iTnqEmEFX72vLLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71969622"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 04:05:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 04:05:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 04:05:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 04:05:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 04:05:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L02D0+3Kul3ZnrQY7SUfyR7lhRMoQftpeIpL+TyYl7XQ58cEg+uS5zTMxW0ZSvx1F1gIGZOdEOvRuNm5che/GiaUUswNvHtnPLPC39YYtsh3lfgrHjZbVoNniDBAszHsNmEbDPBo2/R8T/d+emQ4108/clXXVit0H+ME4Mi/OLoXKJgNUk83S9pSX1f0UNfUJDgn4QAjB4ZihHAk1QUj4WpH8N3qisela/dCzKfqo5AyUr6MBMQndWTYjt3iGv0i9+sgxUWKehqaMWOuIe4ESVNwMfFW9PZe1iIDPWiEo4ruRgQiQ63bpbMhpu5E92NamH4Gd9CrWV8af6hnEeASyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qlyucBFq3k+ikuYBrAiPel5EBMXtVTou6S5y+DOdcY=;
 b=MC0XQz9xD0vo687MzhzwrCIS03wwA1YvAE6ryyGIsGdJuiYc4yGrbIr2lTEbs+LrwtAGGSX0xZ9VSoz29TyUwUJkXKQ2BA5rpyFPwtLoHZPMH4Mn64IRsw0sIUl+6gg5E2iPufS4+tdzwEej6MpkhyROxenO+0wo3kCm3O0dQk70fkypN5ZUYBmdPgXqxB+SEpIYbu0+KMhqT4715JsqIX1/niISD2cIznyYlOpHRGqcJpbYYNiRq9KPOaDJY0312oC0OtxmDS1igPTrk+EXmvnxZhcaJsi5S/BojnurZDClFKCgeZQvtOknZ4EJb+x3ERdKdaQsfMAc+h+8ur5pXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 11:05:42 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 11:05:42 +0000
Message-ID: <304daba0-7060-49b7-bd78-bd8019343e39@intel.com>
Date: Tue, 10 Sep 2024 16:35:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/xe_gt_idle: add debugfs entry for
 powergating info
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>, <badal.nilawar@intel.com>
References: <20240906071126.28078-1-riana.tauro@intel.com>
 <20240906071126.28078-3-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240906071126.28078-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::22) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: 899c3f32-af01-486f-1b42-08dcd188830d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXdzTll4SzRmMEpneE1tb29VdG1KNVBHTWdVUnhnQkNxU0RNVUhIRTBybndr?=
 =?utf-8?B?MXIwRkYyMUFJTU51cmRicUhNbXRsWWVJVEwxaFN4TXgyM1VOQjBPWDVFMzN0?=
 =?utf-8?B?TjNqUXlGZ08yM0Q3aEp4SjkyQVBxbDhYRHd1ZkVGb3U5T2pyemJvcVdNV29p?=
 =?utf-8?B?RjNsVmdhdHRUdytFdWVFZUR6a2krRGJGOHF4clhteURUSGZZTUJJckZUbXpm?=
 =?utf-8?B?cHFGUHgvTzQwRkVCb0FGZjdFVjJhRnlOWVY3NDJCMVRnTUUrQ21kN2tZbG5C?=
 =?utf-8?B?Z2YrTFNINUFZeWpqZEt2N3RxeWc4REREZTBiUDQrc29XazZXU0VDUzRPb3lQ?=
 =?utf-8?B?VS9tNy9ienFvOW0wUUVLcGNMVy9HdzF0WEYyTEk4bis0alZLeVNQcTNwcUpO?=
 =?utf-8?B?NmtEMEdTSi9aK1FCbStWNnJXamRUQkdYVkhNQnNqTUZtLzExV0I4bnhFSVRv?=
 =?utf-8?B?VHErb1FaNkd3YnFhclRESjViS3lHSG5EN3FsTHB2SzVya2toMS9iNEp0TVdB?=
 =?utf-8?B?WG5WNnA5N1ExMzcyZTdZcDJzSklkb2tHb2tiUHNJQXc2aFh6QmFGLzBvOHlG?=
 =?utf-8?B?UkFHQmEra21ZZzZESjA3dGZhYVNmSmtGS0ZjWUNEcEV0QXVENDFURzVpR2Mv?=
 =?utf-8?B?U3FSUFRCNkRuWFlWSFpYbE42MFR0L1czN0xjaTg1NVNUb3M1QWg0WjllQ3Fh?=
 =?utf-8?B?NlRqSUczbEdzS1kvQ3hraG5qSkxiOW9FMVRnTGZQWW9nSW5SNVlWaVJSdzJD?=
 =?utf-8?B?U1lzZVowUHZHQ0EvMWFnY3ZpOG9BOXBDYjA1dFBXTWd4SnRMbTNKNkhrdk04?=
 =?utf-8?B?ZnpNYXp1TGhTaGFOQVYrYVgxMTk3T3NiU0JkU2hva1F5Tm9XMGNJeGcyUy9h?=
 =?utf-8?B?c2R6a2xDWTYrSW8xdjVFR0RlM0IwTnV5SDZKZkFpL2JBRVZ0UHBQMUJLdEFT?=
 =?utf-8?B?eUdPM3h2ZkdmbzNlV1h3K0Ryb2hvWnQwSTRVdlRhOXFSQXAwOURENkJLR3NP?=
 =?utf-8?B?bnFDSFpzM01lWXBKMmtzVzYwVkVrajRoWW50UzF0VE15bUdaTlZDeHhyUmlu?=
 =?utf-8?B?ak9SN2RnMXU2dHVSTEdoVkZoMSs3bHpjanJhV1lIQy9MbWs0eXBUTk5XbnBC?=
 =?utf-8?B?V2IvaVZhdWtZVjUvYlV4T3pueEhDWDczNC9qKzJ3VnR6Nlo2YnIrRmV5bXN1?=
 =?utf-8?B?anAzaHphdjQvOFFHSHFEaklBZGlHY0tybnNTVEJYN0ZuaHZ3U2pEeGttMWhq?=
 =?utf-8?B?ZVpISDRLdUdkWW1sTk1iUG5HVFNZREJWTVZPd0pTa1RRdVoyaXJPbXc4NzhK?=
 =?utf-8?B?UXhZTGhsQlFuL1BvUXBqRVQvTGl4OW1aUjA0bmJVQ3NZMzNBaGo3dUJiUkRC?=
 =?utf-8?B?YzF0M2plbXQyOVNsL00ySmJGU2dNVWJkdFZPa1FsMUI4R1FWeGNUeWhKbUNP?=
 =?utf-8?B?ZlhGaXZXYTRFK2Q1ZUVhNzVwNlo0am4xY0Q4MFlMMko1S21MTCtMVlc1SW9k?=
 =?utf-8?B?Y2Y2LzlMWVhvUHQrWGNuRzViZ1lyZEs1TFc4R2o2S1R3WkgrUzQwcldSUUc1?=
 =?utf-8?B?eUNIM3d1RWljRjF3VWt0NERVMmZRaTgvbnRMbTE5TG0vcmMzY1RnWEVxQzFk?=
 =?utf-8?B?YUl6a2RzWlJ1RW5hZTg5QzlROVJVbUl2dTJtenhWNSt1WXErcWQwTSt2QS95?=
 =?utf-8?B?UG1rWkN6aktjK1d0ZEkveDM2a21GU2hGMVhMbVBidHl4UlgrTUh5NGU1a2F3?=
 =?utf-8?B?OFJlN1FEVFBmc0xNL1kvWFFObGcrK0pNbURqQ3RUUzBxR01yMURqSXFyVVZn?=
 =?utf-8?B?UEhUMkJCeEZNUFlvR3Erdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VytNUDdNSzZvOGFHR1ZMZVcyeitScDRCS0NTVzZaREpNQXhqNUtBTzJOOFVG?=
 =?utf-8?B?T01VV3pZclNialpzdEdhMCttbFVXV3JtMEZUQ2dHNGI0S3phclhzNVVtNmVV?=
 =?utf-8?B?amlIbU9TYXJpbGhDZDE0eVlXVVkrV21ZL0ZKYUg5NmNyUFFWWUg0LzM0aVky?=
 =?utf-8?B?bUx0dTNQSUdld3N5U0hxSlV2MmFRdjZ2VlN4NHBEeTBLVlJIeHprZTJRWU9j?=
 =?utf-8?B?QkJIVDEzME1YbzUrRXNRVmp6K1IxVGRHRTBacXU1amppODdRSGQySDNPY002?=
 =?utf-8?B?ejR4NFBEZ1I5bnpkRlBXcjJ4enhwYmFmTFFESVdXNXphMG9kaC9BcGtqY3FL?=
 =?utf-8?B?aVhwdFpkOEFjU2o2UDhWZUtPVjllMENsQzlKZnZtWFlld0RQei9vclZOeERn?=
 =?utf-8?B?Qk9CdWlrVWJUVzhYRjhseUN2djRWbDJicW1zVWZOQnlRWFBHL0tOLzFnb1hy?=
 =?utf-8?B?aUZWQ00xM2lHUUMwNk01UjhxS08yS25tdzh2SFV2RnUxMjE3QW1Zd1hFOFFF?=
 =?utf-8?B?NDNkWFgwdGNCazQ1eGIrei9UVzY5NCtYaFJwSVQrY2FpT1dMWFhMNmpMOFZV?=
 =?utf-8?B?NnVVQTVKNzF2VTNMcUFLOWhSb0hTdzlBTGlQRWI2WnZRVEhVdU1OcjZBTDd3?=
 =?utf-8?B?cUQvRnhGdDZ3MUkva3ZCcTVPMXFjRTgxYkhvU0kvTFRjQkE0Nmh5bVErNDE5?=
 =?utf-8?B?d2Nqam94MFhvUllxaTJBQ2VHV3F5WC9CTHNnT0R2YXNUOVFsTnN0d24ydUUv?=
 =?utf-8?B?bWlBbi82cUpsVVJwTVV6TEZjRDcwU1lMczUxNU1DeHZ1ZU9xSWN1bDRqeVdP?=
 =?utf-8?B?eVpXMHRGSlZMT3B5Y1hIT2V1STNnUzlJSFl5KytFcmFmeUZrL2Y5WUtXVWY3?=
 =?utf-8?B?akhZT25ZdlpRTUEySVFwMk5MSTlIeTlaTSswVzFWY1I4dTZaWEh5RWVjWTN3?=
 =?utf-8?B?cE9KYVZIbFV1OEpRaGhwNXJtNjVXVWtoZlZnVS92SVFXV0w1a3Nicmx2bGZq?=
 =?utf-8?B?bGx0MkhvK2lFcS9QTE1vY3hSUFViOSsvRWQxV0V3WnF6cUNSSjRFSTRnaFFT?=
 =?utf-8?B?UVQ5cHYrYkFiK2hFWmxtUHJFTHhGRlg1OGRUL0Y1RDVsTGYrQnc5b0NWeWI0?=
 =?utf-8?B?OGRWY1kzL3U0VHNzamlLTFExc0xOb0RIUXYzUkJ5dzRsRGVmVWVwT3pWUDJR?=
 =?utf-8?B?YlRwR3lzR3pJd2Z0ZnlBZVEwZ211VFlUT0dKbnowVTFMU1ZnUEJmRzZRLzR3?=
 =?utf-8?B?SzlWdWN5VmhpTU55b2NrWjNDR1FuUE0xcEFtdllBL1hsWlV3Rm9uMlVYUENl?=
 =?utf-8?B?U3JCdDE3UE5ySHdIWndRUFNManJyN1NrV2dOdXlMUXMyZkJkS2JvbXFZY2VC?=
 =?utf-8?B?R3ZZd3hMQTNlaXROWlJ5V2x6WmpWQXdKZ2hDREVaQytsakd0OFlrWE5xMGdv?=
 =?utf-8?B?Zmk1dHp6VklCeHNoSUJxeEZMSE1lcDRxTncwV3FMMndCY1JxdllnWWxXeXRR?=
 =?utf-8?B?Q2pIbytWNEJoY2NDa2gweGJldWNSbDZocWtMVHR4UklqQ1JxY1pUZTUxM0xv?=
 =?utf-8?B?TURiZVZHUVNBRUNnVEtLK1oyb1FITDJOMCs5UXBoL24rU0N4Q0pCcFVHMGFo?=
 =?utf-8?B?NWVIYkJKTFpBaVZZUmNML2EyWUZHOWMxQTkzanBsZ2ZRVGp2VXphSHhYMWN0?=
 =?utf-8?B?QityRUZxTmNxU2pwaEpWTUdSSDRlZVczcFpwWExlaW00TStLNjVKZ3M4Ykox?=
 =?utf-8?B?ei9zdDRWZ05pSDBDTjVHcytYRzJ1U1pOU1RTZDhpbHNhRjlpUnVVRGx6Z2ZO?=
 =?utf-8?B?K040UmZ3NVlXNllUTjdRdU84aCtsOS95ZTkyVkV3Vk5iL1hQNi9rYkY3WnNM?=
 =?utf-8?B?b0RnbzVEaU1EZ29TQmswdlNkc0ZxSm54Vmw2SCszVEM4ZWcxdElLV0ZEL29h?=
 =?utf-8?B?VEJwMmR2OFc3Zzl2bldsMjluWSt4cytwQlh2NmRaeXRLTkdUalh1Ni90ZDJF?=
 =?utf-8?B?MUh6RDlPWlk5SGdlVis2MnhjSlhoTUV6KzJHMER6ZW01TSs3elRzNlJ2ZGJz?=
 =?utf-8?B?ZEdOY2pjb3JYR0dYaFhmZHd6M1lPQ0lWeEdzZzlNVkdMQVk2K08vY3VFR0RS?=
 =?utf-8?B?SVhpR1dzU3Z4QzdNZlpTRjBkbGdaMDQ5cC9BZ1hPY2l4T2wvajhENTR5Q01m?=
 =?utf-8?Q?tI2rkBaBn7g10OuSJRYVUlE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 899c3f32-af01-486f-1b42-08dcd188830d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 11:05:42.7438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXTTOTVGymeYmm0Yp5lOadE5hRyLjJ67ILQp6BQAzcDPsPM5ZFjN3gU9gLCADp21xkYBK2TwdVRxRfj1M82tJp2+c2Xw1XYHfhmx7daYmDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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



On 06-09-2024 12:41, Riana Tauro wrote:
> Coarse Powergating is a power saving technique where Render and Media
> can be power-gated independently irrespective of the rest of the GT.
> 
> For debug purposes, it is useful to expose the powergating information.
> 
> v2: move to debugfs
>      add details to commit message
>      add per-slice status for media
>      define reg bits in descending order (Matt Roper)
> 
> v3: fix return statement
>      fix kernel-doc
>      use loop for media slices
>      use helper function for status (Michal)
> 
> v4: add pg prefix
>      do not wake GT if in C6 (Badal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 ++++
>   drivers/gpu/drm/xe/xe_gt_idle.c      | 91 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>   4 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d1a4a9f4e11..cbead3f75fad 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -341,6 +341,14 @@
>   #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>   
>   #define FORCEWAKE_RENDER			XE_REG(0xa278)
> +
> +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
> +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
> +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
> +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
> +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> +
>   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>   #define FORCEWAKE_GSC				XE_REG(0xa618)
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 8f95d3a5949b..cbc43973ff7e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -15,6 +15,7 @@
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_gt_mcr.h"
> +#include "xe_gt_idle.h"

Seems miss to address. Out of order inclusion.


>   #include "xe_gt_sriov_pf_debugfs.h"
>   #include "xe_gt_sriov_vf_debugfs.h"
>   #include "xe_gt_stats.h"
> @@ -109,6 +110,17 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>   	return 0;
>   }
>   
> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	int ret;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	ret = xe_gt_idle_pg_print(gt, p);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return ret;
> +}
> +
>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -288,6 +300,7 @@ static const struct drm_info_list debugfs_list[] = {
>   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>   	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> +	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>   	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>   	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>   	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 3924f9f3d0a5..85a35ed153a3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>   	return gt_to_xe(gt);
>   }
>   
> +static inline const char *str_up_down(bool v)
> +{
> +	return v ? "up" : "down";
> +}
> +
>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>   {
>   	switch (state) {
> @@ -155,6 +160,92 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
> +/**
> + * xe_gt_idle_pg_print - Xe powergating info
> + * @gt: GT object
> + * @p: drm_printer.
> + *
> + * This function prints the powergating information
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	enum xe_gt_idle_state state;
> +	u32 pg_enabled, pg_status = 0;
> +	u32 vcs_mask, vecs_mask;
> +	int err, n;
> +	/*
> +	 * Media Slices
> +	 *
> +	 * Slice 0: VCS0, VCS1, VECS0
> +	 * Slice 1: VCS2, VCS3, VECS1
> +	 * Slice 2: VCS4, VCS5, VECS2
> +	 * Slice 3: VCS6, VCS7, VECS3
> +	 */
> +	static const struct {
> +		u64 engines;
> +		u32 status_bit;
> +	} media_slices[] = {
> +		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
> +		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
> +		   BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
> +		   BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
> +
> +		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
> +		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
> +	};
> +
> +	if (xe->info.platform == XE_PVC) {
> +		drm_printf(p, "Power Gating not supported\n");
> +		return 0;
> +	}
> +
> +	state = gtidle->idle_status(gtidle_to_pc(gtidle));
> +	pg_enabled = gtidle->powergate_enable;
> +
> +	/* Do not wake the GT to read powergating status */
> +	if (state != GT_IDLE_C6) {
> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (err)
> +			return err;
> +
> +		pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
> +		pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
> +
> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	}
> +
> +	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> +		drm_printf(p, "Render Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
> +
> +		drm_printf(p, "Render Power Gate Status: %s\n",
> +			   str_up_down(pg_status & RENDER_AWAKE_STATUS));
> +	}
> +
> +	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> +	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +
> +	/* Print media CPG status only if media is present */
> +	if (vcs_mask || vecs_mask) {
> +		drm_printf(p, "Media Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
> +
> +		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
> +			if (gt->info.engine_mask & media_slices[n].engines)
> +				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> +					   str_up_down(pg_status & media_slices[n].status_bit));
> +	}
> +	return 0;
> +}
> +
>   static ssize_t name_show(struct device *dev,
>   			 struct device_attribute *attr, char *buff)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 554447b5d46d..4455a6501cb0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -8,6 +8,7 @@
>   
>   #include "xe_gt_idle_types.h"
>   
> +struct drm_printer;
>   struct xe_gt;
>   
>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
> +int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>   
>   #endif /* _XE_GT_IDLE_H_ */
