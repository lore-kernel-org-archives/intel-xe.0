Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41F1C369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 14:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DC310E6D1;
	Tue,  8 Apr 2025 14:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRVpU30U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4CD10E6D1
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744123902; x=1775659902;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bJ0XFznEZuL9pGAzjc2g6+HSzca+XFN2mKx8x3rN3x4=;
 b=TRVpU30UQ8TZZDdh/9AfqqSmjuTuqkST+ZPvTxgLQWWm02w7kTb6IdvC
 NHS7OdeF/EJOrHK+6NY50Qe8O6aUi9JwMqZDQuIE2k7IH0yN2vA82amxt
 wnLaRfjcP2Fs2aTwCiWcrT2PYDKk8bOYBYmRCV8eCmjYguIpltt9eXv7X
 8X/pXpZaNxFJwawCkXS5+IbctDwRuSgX9P+tHcS7BGUX32efSa+3lXXp8
 Pvoc0IXUA6q2+uGYLTZxb4LH4+KoWyJL6ZtMkfgSBCOeYuuckjX4apH7n
 aqymmCjqqdwSthLh+/Q+UrRp1M9PL7jVvfJS/eKBRXPMzR9jYUzbKMB4X g==;
X-CSE-ConnectionGUID: B39q5dzgR8+OpITBh70kkg==
X-CSE-MsgGUID: vVNXOXCVQdSsloFVonC7vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56931741"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56931741"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 07:51:37 -0700
X-CSE-ConnectionGUID: /yrbe0l2TrOxRiT5tpY79g==
X-CSE-MsgGUID: FvUG60/yRL6ksobx8xypMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="129247498"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 07:51:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 07:51:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 07:51:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 07:51:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reCUBPZP/qFOh2FkKYYeJ6MeW9Hkymj8tbBMLY+0DjG1KCPg5cmj+3W0sqixJAMxB184wfTALWyIujulS/Vb4IBDBpyZlknipI0t6DuSdPrleeS05PgXPRVcX7+T/rZGS04GDZyqGGP/STSQ8qAusa6Z1mlhFw64uPo/JVxpUE1+t9gta9nwILRKz/OXfCxfTJ/k59MmKTGD3VIoqq8mBU4mgPi2VqUThm/mNqqhg54lbo/4RepDDzB1Re5pu4PsrrF/Bm2zunqgcFpIWeKibAA9UvcqmbjfdPS0fcJ835oCvQOPztRGw7B/d4p0SY3ohTw2fR2e7bT19/qKosDO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fn+isyJPJqsDwFici1ZPZiSf2+DySzicgL9X0Cv7MPA=;
 b=xvFAza/ppFUp94PtY7ohc8rz7+efU0otMIIjHsRdzCSy2/+N2rCRNpjJAGZjju1wq/EVGPQVHr0MrmFxrya3GO1wJ6I7Wap7ewVD9ANJNuDcHYSGz6bQt1NKbKdr4F1fvAsiYuo535/G9+CuxZIe88LE9zW7xJqsLhx57p80U4Pt5hj1YDcPk8rrf+64XOJQjUw7jekKGEOZX5oU5zKtpHh57HB5dTtTkYOLX69Vn4t5zDk95Fid6rk4gvqp9EGWL2awiQMinKr4FVnC9IzszgmGLLHV1y+HXXslyxm5YqywK73hk1c0eZGqNzljHn8Fj45AH4j7D1FiU4Jc2Qfz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 14:51:29 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:51:29 +0000
Message-ID: <1f1c8b7b-b42f-41b7-9b4b-117d46f31eaa@intel.com>
Date: Tue, 8 Apr 2025 10:51:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Only add GuC crash dump if available
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
 <20250327234028.249314-3-zhanjun.dong@intel.com>
 <e95240b8-78f5-43d7-a114-cae1270ea9b5@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <e95240b8-78f5-43d7-a114-cae1270ea9b5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:303:b5::13) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b63dae8-f4a3-4be2-5bf0-08dd76acd861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDBGeTBNZGpGTnJjaWNlMWdJV3h3bHVXOE41dTRvRVVBK0g3YmZ0OGZKOVdi?=
 =?utf-8?B?OXZsZjdsU0tueEI4ZURIZ3F1YzlSS0c3R3E4MDZIdzRERmRiWGdUS0p6R1JL?=
 =?utf-8?B?OWZFZGhmTitkUzFGR0ZNTlBoMERMNWRTYXAzT0Z4R3pYL3FBTXhRU0dyUzBu?=
 =?utf-8?B?UllVVWVmN2JGbTN5NXh6TWlZVitlTDBRWnJOQndtYWpWcXRHdUhwMlN1VHJ2?=
 =?utf-8?B?OG1VYVEwdWhSUTV2TXMxbitvd2pnaWtrL0p5cWQ5aUVra1ZERHc5Z3pXTHhw?=
 =?utf-8?B?QmhuRGVsbHdyVVJFY1N0eG1TYmVVRHYyOHBvTWlxT2lpYklja21zMDV4NTZW?=
 =?utf-8?B?QStFQ2dUcXBROGlYcnRNWUZHbjR3d2xaTXExVTJzU05OdkxIemtqdldXRWdS?=
 =?utf-8?B?WjMxNlp5NmI4ZEgzUzF0cjc2WlBBQk5zTHBZUGNVUDY3ZUVVOVM3SlAwUXpr?=
 =?utf-8?B?OFhJZFRTL2tpcWxZSmhOMndCSUJuTHp4cU42aW9XOXhBMzd6NWl3cVhOWXFZ?=
 =?utf-8?B?TUVBRm9HRHQweUlXRTVabkxTYXRsTkZlVml0YkxFZzdmVVFUK2ljR3hSOWor?=
 =?utf-8?B?akhlb29yWmdVZUJLL3FBK2lxTXlBb2JZNVBRSU5Vc3pWS1lUekJlMmM5NVl2?=
 =?utf-8?B?SHhKWmdtU2k4c3BlMUl6UzVmbDlRcjM4ekJYZU1sdzNiOGhPRmxUMVJDUjRX?=
 =?utf-8?B?WHJTbHdyaGZyeEQ3RzIxUlcxVzYvVmxnb3JVbWhHbXRpa3NYWW1TMnFjUXJt?=
 =?utf-8?B?aFltek9KcVd1YW9PZFhWdmF4ZlR0QXR5aVVkUHNzVU45R2FvZnhXSG53Nzh3?=
 =?utf-8?B?cWdIa0NiV2xTeVoxZHhNcjRZTFJEdEc4eFM4YVU3RWJhV1U5SlhQSXhjNDZ3?=
 =?utf-8?B?a2VPaUVxek1wK3liK2l0elErU0NRNXNpY0l4UDU3bkpWRUxzM1h6ZkVlTXRC?=
 =?utf-8?B?bUZhL3FlZzBEaDFHZENXTE5NaWNWaTRlaVp4U0JNb2tRM25Ka2RVWGVSSzU5?=
 =?utf-8?B?QUNIbEphSTkyQ2N2U1RVQk1FWnU2dFc2cUNPYWpNVEtGMGgxWVlPN2FBR004?=
 =?utf-8?B?V3RLd2pVdVpHMTI4bm5XaTY1cXJUd1VXSUJmbFNhTHpsQ2VmM2RENVA0cjRQ?=
 =?utf-8?B?b21SUDgvUFlGd1E5MEdjcFR6NldrOFQ1QkZYZ01jb3l2Q3UrbnRVWktRUlp3?=
 =?utf-8?B?YThLU044cDhKdStFQ3NsZ2tzOENFcUIySzR2WXhwUE1iMitVZzJsR1NORHpx?=
 =?utf-8?B?QU4vVHZ0UTFCaTgrTmlSZkg5dUxsS2FPeWZ1OWdKbXZzUzA5ZWsxV3hqaWMy?=
 =?utf-8?B?d2IzeDZ3WEMyS2Yvd1N2MGNYa1k5dytqc3lZSGkrSHRRUHVvb2g0VGRUdkVB?=
 =?utf-8?B?Nkh0SGJGRkVQWGMxUjN0bmVXVmZROFVzbG5mVnVROERHeHZtaXREdXdRNGFQ?=
 =?utf-8?B?a2RLZzI2d2hhR3F4UThlVEVlYy9Uc3F4TzcvQWo1cGxxejVXTENYNk52Tytt?=
 =?utf-8?B?d2E3L1diWlVLSTZYWFl4a29TcXZxMmFzdmtZVGw0WVBjVTdlUy9xcVJCbk15?=
 =?utf-8?B?SUQ5cDBTRFBFVkVMVG9tMmJEVWdob3NvN0c0SHB2UVQ3Rnd6eU16T212QUwz?=
 =?utf-8?B?cEhrQnNabHVhd0VPMkZVK3NsY3dsSWg0WjMrTkthZmdtSXpvMnJubG4zcHp5?=
 =?utf-8?B?VmRSS25HeG9MRUR5QXRoYng5OENSSXAvNGZvYWYrZmNsOUdEK09MTUVyTDJa?=
 =?utf-8?B?am9yL0RGb1lBMUFHT2Z1bHFTaUlqOVZwQnpzMXpaazFwdm9jbzNsNktpS3pt?=
 =?utf-8?B?S3BCaHZ3bXRIVVM0dTdXTU1ucUJkVURmdVFsckhpcy90dVZaaTFrR2d6OVdl?=
 =?utf-8?Q?/iMIHyumPgrEy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEdOZm9QQWpKbWdoY3dEZWxEYzBGaVFMN2hER0FNWGlobHd6TWYzVEFXUkgy?=
 =?utf-8?B?OFlPK1FpL3p5WHRqQ3VqQjJrNU93MUZGcHcwQ2dOdDlIRnJPNkdyVGVKSjhE?=
 =?utf-8?B?aVoxRjR0VHJ0M3M2T0gxRlZBZUd3emVockVZUHNWbjQrZ2FjbmU3cDRUVlBQ?=
 =?utf-8?B?TFdrWjMwUWRZVmw3K0dQRmZLZFV1SFVZWGh0ZlNlc0lXeVVUdXRPT2NqVEVQ?=
 =?utf-8?B?WUpleEE3S3JtTnR1aVVkTlpyY09udWZLQXhSZXRpUnUzZ3ZmeGxTc0F6QXVv?=
 =?utf-8?B?eWFLQ2xZQmh5V3pESWYrd0U0aWF5VUZ0ZkpuS214akFDc3NKeUhUM1N0SGps?=
 =?utf-8?B?V3lrWGJhSkxSeUE5SDBvaUUrdGZmT1VNMVFOaTVqamViV1pkd3pnMURoUzEr?=
 =?utf-8?B?MDJvcHBXTmV4d2NyOGk0QVFYSndtSGhoZ3pKUy9HMWFlTnV3TnVyVHgveEhp?=
 =?utf-8?B?SCtPNnRUTVM5Q0dscDltZFh0Sk5HQjdmdVFkeDlJS0pSK2NLRWJrbnJZS2ZD?=
 =?utf-8?B?bXVWRmt2S1dKekx4WDMxd05aMEZITDArNWh2NVNJUVNleDIrRFM5U0lGVGxB?=
 =?utf-8?B?bDI3aGk0Qk9kSGd2QzJTbVBBZEpRMHZNVS9HVmNSdWRVOHVaa1ZEbTZGSXFY?=
 =?utf-8?B?T0JmQzlmVk4rTjRlZ2IyUDQwcytWcGpDNDJLWHFUTTduM3dvdW9DS1RkN2hl?=
 =?utf-8?B?Q1hwSWRJSEh3SHF0aHJMeGUyd0hQc0Y2SWg5RkIvNXBKWTFrVG5pYllyYWQ5?=
 =?utf-8?B?N0pXQXY4MzJpd3hVL3lDZmhkQkpHQXpESnEreHR3SGU3d0NCWG9TVklCTkpL?=
 =?utf-8?B?ekNhYXFwRW5PcUw1Q0wra1hQQnh0c1VGUVNGd3RHTnZHeFVxU2hGQWJ6S1lU?=
 =?utf-8?B?aS9yUzloRUNxZy9DMFBiNDB3amZONHBKSC9aWG8vaXZXbkZoZVY3VGFVNnNO?=
 =?utf-8?B?dFBLZTRLZHZWdkNLK2VsV0JaNGQvekE0ZktERWtjTkhtTG1GeUhFN0RKVFQ1?=
 =?utf-8?B?MlRUK1pkYzB2ZzFSTm9XeGt5QmtWRXJvZHlPOHpnRVRUSkVGY2FIeklWUlFl?=
 =?utf-8?B?UEVFWXBscVQ3amdkWDVoR0QxOGdHc3l3ZkozS052TitIY2tEMGVwcWFMeE1I?=
 =?utf-8?B?T1kzbStLU2lYcXNNdW8ySFBNZmZjbzdmZXdmMUE0bmEvdldpbGVpM1VzRWdn?=
 =?utf-8?B?TjlhWFVBQW1ybEE3Ukl2aWl3alZLc0pzc2lSL01YY1ZDNE5zL1l3RzhEMFFl?=
 =?utf-8?B?Y0d6Sk5PTU54RXNXckdKV2o2WkRQMkowenFjR2Z1TDhxMmdtNXo2K2dGZjB4?=
 =?utf-8?B?TTREbkJ6NStPK1N3M0VvdDF6cDZRS1NQTEozc3BxNVpaSEo4eGZxVGEyL2Nm?=
 =?utf-8?B?L2tNUitWaDhQb2tydks5YzFiQTYyQS9qSzl2d1BYNG10WHJXcGdIeDlYM3Jr?=
 =?utf-8?B?VStjOXcvRHhqaVI4MDNUMTV4WGNnNkd2bTc3VEU0cTdCZTVVcCtLL2xaQWg4?=
 =?utf-8?B?akNnS1UxbUZteHdoOWEwS21mWGdRU3NuUGtsTXROckllWk10c0lsVzhxUkUw?=
 =?utf-8?B?OGc2SFpiK1lnbndVeVA3NUxzMmNoSWFQcXduMU1kWm9KMEVOZHdkeVJXeWF5?=
 =?utf-8?B?RUQ0MXNIbUJVR1ozemJ2dTlhTjB2RjZXTUJibnhXcUV3QitJQThDaDdhM0xO?=
 =?utf-8?B?QjUvRG5rNDFVRmgwbThxWXJQVlJiYjVVMDk3bjdLRTl5Tm42VWNSMTdZSnZR?=
 =?utf-8?B?SVdUVG5pRGFacFYyVWNxMURQWWN4RjhjQUV6S2llUmhTS1FrZnF2Tm9nT1VN?=
 =?utf-8?B?d3ZJdGFvMGEyQ0dKaFVyN1JjNVNCckZlZWtrekNMYWYzbDM2VTJvN3RNN3Fu?=
 =?utf-8?B?T2M2OGlFam5IS1hXNmQyV0VDRW5kY1lnMEFPemEwalljSzc5MjJ6ZzFxUkNK?=
 =?utf-8?B?OHF3S3JZMFF6aXhqNTJ5QS96bXZKaUVJWHdEcllUeEdZUzkwQi9oaWEvVVQ5?=
 =?utf-8?B?YlNyQmxNdUorYjZzLzhMYUg1OXVCQ04vNXdxais2R2RqaFJZYmd0bVg1QzJ1?=
 =?utf-8?B?VS9QUW1IOFNlMFVWTXljNjZOMU10cUhRZkRDd0RDNzZoUVAydlVIMUdPdlF6?=
 =?utf-8?Q?KqmNQBsEe7jjCLJUXcVSq9UoF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b63dae8-f4a3-4be2-5bf0-08dd76acd861
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:51:29.6104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3KJJKTpwPslBh8Jzk8xaxc5jRZ/Lh20MPutiQCL2tZ4WYFcQUwqCX8elRiZNGJJgRfX2g5M0Z/ly/bbA7gQdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
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

Thanks for review, please see my comments inline below.

Regards,
Zhanjun Dong

On 2025-04-03 5:46 p.m., John Harrison wrote:
> On 3/27/2025 4:40 PM, Zhanjun Dong wrote:
>> Add flag of GuC crash dump received. LFD only include crash dump
>> section when crash dump is available.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c        | 13 +++++++-----
>>   drivers/gpu/drm/xe/xe_guc_log.c       | 30 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log_types.h |  2 ++
>>   3 files changed, 40 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/ 
>> xe_guc_ct.c
>> index 72ad576fc18e..44c11ec662e5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1127,12 +1127,15 @@ static int guc_crash_process_msg(struct 
>> xe_guc_ct *ct, u32 action)
>>   {
>>       struct xe_gt *gt = ct_to_gt(ct);
>> -    if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
>> +    if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED) {
>>           xe_gt_err(gt, "GuC Crash dump notification\n");
>> -    else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
>> -        xe_gt_err(gt, "GuC Exception notification\n");
>> -    else
>> -        xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", 
>> action);
>> +        ct_to_guc(ct)->log.crash_dumped = true;
> This will also need to be cleared in the GuC reset path. There is no 
> guarantee that the log will be saved via the LFD system before a reset 
> wipes it out. And then a subsequent save will see a stale crash dump.
Good point, meanwhile, I wonder if this "crash_dumped" could be removed.
If there is no crash, then crash dump is always all zero, as I already 
has code to check this all zero, then this "crash_dumped" could be 
removed.>
>> +    } else {
>> +        if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
> You can use "} else if( ..." to avoid the unnecessary extra level of 
> indentation.
Sure, will do

> 
>> +            xe_gt_err(gt, "GuC Exception notification\n");
>> +        else
>> +            xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", 
>> action);
>> +    }
>>       CT_DEAD(ct, NULL, CRASH);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>> xe_guc_log.c
>> index 5659d60e41ab..29684393a62d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -536,6 +536,36 @@ static uint xe_guc_log_save_to_lfd_buf(char *buf, 
>> int size, u32 *guc_log_bin,
>>           return len;
>>       index += len;
>> +    /* For Crash dump, rd/wr ptr has no effect, only add if 
>> crash_dumped is true */
>> +    if (log->crash_dumped) {
>> +        struct guc_log_buffer_entry_list *entry;
>> +
>> +        entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
>> +        if (entry->buf_size) {
>> +            int i;
>> +            u32 *buf32 = (u32 *)&bin[entry->offset];
>> +
>> +            /* Check if crash dump section are all zero */
>> +            for (i = 0; i < entry->buf_size / 4; i++)
>> +                if (buf32[i])
>> +                    break;
>> +
>> +            /* Buffer has non-zero data */
>> +            if (i < entry->buf_size / 4) {
>> +                len = xe_guc_log_add_typed_payload(&buf[index], size 
>> - index,
>> +                                   GUC_LFD_TYPE_FW_CRASH_DUMP,
>> +                                   entry->buf_size,
>> +                                   &bin[entry->offset]);
>> +                if (len < 0)
>> +                    return len;
>> +                index += len;
>> +
>> +                /* Clear flag */
>> +                log->crash_dumped = false;
>> +            }
>> +        }
>> +    }
>> +
>>       return index;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/ 
>> xe/xe_guc_log_types.h
>> index b3d5c72ac752..d351f639727b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
>> @@ -46,6 +46,8 @@ struct xe_guc_log {
>>       u32 level;
>>       /** @bo: XE BO for GuC log */
>>       struct xe_bo *bo;
>> +    /** @crash_dumped: Indicate if crash dumped */
>> +    bool crash_dumped;
>>       /** @stats: logging related stats */
>>       struct {
>>           u32 sampled_overflow;
> 

