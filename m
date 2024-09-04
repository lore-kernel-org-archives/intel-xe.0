Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78878CD4857
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 17:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3888510E812;
	Wed,  4 Sep 2024 17:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3qXc1QV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874FA10E812
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 17:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725469678; x=1757005678;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aPuzhRdBZQzvvxvDz4es3alKz88LEnpJZb2pLixqHo4=;
 b=S3qXc1QVXX58b/TQTfoqvSDxF7dc7pN4ctEI0gjwnSBNCwKJ1gggpFR7
 TujH4uYoQPynacI+obH5vCD0V50JLvtwVgHMv5gfIgr3mswCwZUbwrWUb
 aUeGSYxmKg/SToPBuIWIy4VAUgZZR3AdkeRhT2X+5dx5BuNMbEAQs4xu/
 Z3S9BAvuEOS+mAvCYJWrT+7kN4hMXKn/1TrQJfXdcAEbCTexCXj4uIBQ7
 9yZ/MKBQKb4lLa1aWs4h5C4No4yDZxt3N7w8JQjiv8xI+NeyLDKmH6TCM
 QF0I+Blm6n+imMaXvLB+DWWrZrAO4MgR/59tTaZ+uHtHvgRoYeIR23gI9 A==;
X-CSE-ConnectionGUID: n5/t2dLXTJi/c4mfuSEPAw==
X-CSE-MsgGUID: uOkJeRviSWiE2QnPnfQzUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34750472"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="34750472"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:07:38 -0700
X-CSE-ConnectionGUID: szvUPi8zTHCB+HTKGP0vVA==
X-CSE-MsgGUID: Seqv2qP9RtSpiDvdySy9pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="70231178"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 10:07:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:07:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 10:07:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 10:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxdh+r1GopwYsFjL7xD+1AFPD8ytBG5RMUFt5mFFZmbRwdefH/habxgeMA67cH9C+jgJPe6CH18wi3JAlFFMgeUwvMQ9gkMzvqCIH4UINK1VakozTV6VNprhlgOEnDQW8MojRtjOWUH/h5c7QxM77TrCUlmmS1ba8M6cH9fL2tGBgBcboI0IK6Q++doioxMVEoINfjgt7D/GCVvNs0jZ/2YV18Xzf87QgiiY1CaQZ9TH5nWLxHyhgOVyjbnJO0kCB1Vxoe+n4pENwMJW3FnoIzUCjQskAb31Qzz1yf4QyYb2fb3hO83/cNRWKtVstIkzXGT8leJWZq0E3NXe5OClHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4EACEBNayt4JOmDTUZ/A965HctkXOuf+DkmcclXeY0=;
 b=Yk+IORJBvPSwS7+BWx9Ikyb20iPDcvCr1xesJq8g6wdJ9HFH4dxx4pW372iWlP3cNOJ/qmsTzS+yRvnd0LglxV7jdejs6ifWgxa2w1tFQkffRqJkiQK3isscGcAjMx6YzQXkAXm6hW1bVXUfUjeCZ3FIgFMsjZ9+fbTFcZio31nDQNgAYyvtEnqw0mZD3bS+ejtV1rLQOVib17gfZsM5Q57FkxmeiDb1IxakXvn4XE/iMDs0n6ajEPiDmHgEOGvSmEBQu9hFFn9IAMCTiOTU00b+V3h0x+G6Bti9/aYW3bLiJKgTcL5/tmYOTX+G8Ix53pVZTu0BuoaUxDuPTfg9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 4 Sep
 2024 17:07:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 17:07:35 +0000
Message-ID: <b78cd823-befc-477a-b1f2-6022619257ec@intel.com>
Date: Wed, 4 Sep 2024 22:37:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Update runtime detection of has_flat_ccs
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
 <20240904162238.2831202-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240904162238.2831202-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::25) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: ec786e9e-0c45-4114-6c46-08dccd04121d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qi9ucVhmWVhlZkROcy8zaUFBTHBFbStuWEpXKytGV0FESmc3MXdoSFZDby9M?=
 =?utf-8?B?TlIzMTZaakZJaVYxdk9EQmg3TGc1c0R6MVVydExIckRYa20zYmVvRjkwK2FX?=
 =?utf-8?B?dk00NitTTHA5YWFOSk1mY1dvZC82ZTRZVFpPVzV1T2QreHMvUTZBVE9UWnln?=
 =?utf-8?B?SStGQUR5bzhCR3hZazQ1Y2Z5VVlra1gxejZNU2xobmdTVzM5Q0UrM0k0L3ZC?=
 =?utf-8?B?YVFZeWw2d2haNS9GcmZkQlArWDc5UWRYRUdvNEszdGxxbVVnUFQ0M2R2SENO?=
 =?utf-8?B?Ymd2UWNUOG8rNjdWVjhzbXltVTVLWCtSQ2RqWEZEQmtBK2l1dU90TUZQQk9P?=
 =?utf-8?B?T3l6VExuVzg1R2c0Zk05Z1NoNGZjVWhZYzVZdEk0azM5VGpmMVVoaVdUZERo?=
 =?utf-8?B?NzBic05ZUjRQSnlGUEplNkEzVlZDRlcrRjk4VjBJYjNjcjhWRHNuUHVCMVNh?=
 =?utf-8?B?RUhmWE1SVzlDcXhKV3B5U1VEQUNUZVFmTkNWL1JCTFViNHREVVlmTWZtVmp0?=
 =?utf-8?B?am1lZDBEN00yRnRpVXBTZFhGN0tOOWhmdGoyaDBwM1ZIc3NYSllSUXk0QnZV?=
 =?utf-8?B?WU1jVEV0NjBNeHBvM2lTdFQzbWFpMjhvaHRVcElOc1QwWU5ERGoxSjlsS3Fp?=
 =?utf-8?B?WEJmODZjeTVPcldqbCttOVBQS0lqWEFEUWFFQjhqLzJMVEZvK094QzhqSFcr?=
 =?utf-8?B?NWZNVnRySHAvRlNtYVhoM2xEbk5iL2t6ai9KWTVIdHBPMmlYUVFoNGwvb2Y5?=
 =?utf-8?B?YkZWWWVtaFUveDV5eFA2dC9vL0VNdFg2R1ZzYzY0dVNEOTNINVk4akdzbWlw?=
 =?utf-8?B?S1FheUUreEFWbzdIUythS1FGTm00ZWlyQW1ROWFYVVI5a2ExMjdGZFBnVWtW?=
 =?utf-8?B?Q29LMEdBSzl0RFY3QnJlUERIQVpxMEM2eUsxVm5xU0lrYU9INVVXWWtZM2pq?=
 =?utf-8?B?YklOZVhqYnF5N01SbGVLV0pEbndqaThXSUg2dFo1Ui9wK21QRjRKRC9ZbGQz?=
 =?utf-8?B?T3pOQm1GNFNrcVFZbWVsRkVHbStaSG5hMERaZEQ3VkZDZ1MwTUpvZXBON0xw?=
 =?utf-8?B?dzhiNGNzOEdURU5FRyt1UDFrUVRhbVdnajV6TkxuT0pacDAzU3dYWTlSZ0t5?=
 =?utf-8?B?WHVTY0tKVm4vNVBLNVMxUkZUdWdkUHJxSW5id0FCTnBvcmhjVC9tRldvV3Fw?=
 =?utf-8?B?ajNIKy9BOWM5YjBVbEdabzZyZ3hjTjNSM0s3MnJXU3piMEVvTFNEd3ZUc0Y4?=
 =?utf-8?B?MndaaVhBNmRYL2VsbktnSElnNVZXWEJhcmFXaldjZSt3aTNkRlhOd21uQnFj?=
 =?utf-8?B?SUVnd0djYUtROEE3Nzcyb3FHMWdSWmNpS2g0bHRxc2dPalk1VHpqalczUko2?=
 =?utf-8?B?R2VUdmZodXBDZ3dIT1J0R2NDejlpUlFXZHFFK1BYL0VMTzJJQVp2ZnZTNjFZ?=
 =?utf-8?B?UjErNWtVdlJwb0k1UEVsa2ZCSWhKcWgyOWZ4SmZtek14bE1ZNEU0bUNsTStm?=
 =?utf-8?B?L1dpU09RZzV1dzVqTFFkcXFpeDRLOFR6SXBtN3BQekMxcEZITTZQRGhydjZP?=
 =?utf-8?B?aU9mM0NkdVZTRm5KM2RTeGUyOFR2YkhaN3QvSFFoUW5hR3hDUVVJOXZMa1lq?=
 =?utf-8?B?aGE2TDVGcWY5NkRFbXV2RkRjaUdWbkRZSGhRMXkzUDN0SzhkMFZxekVxREJE?=
 =?utf-8?B?WGFYc1VXRktjSU1acTVCU0lweStkT0thRFpKdnp3dnlYdlBESXVZUG9jS1pO?=
 =?utf-8?B?U2EwMmF2c2hZN1Yyb0ZLNy85WTFXRnF6VjBSOCsxZ3lac3NrdFNDc1oyckcx?=
 =?utf-8?B?ME9MQ0VUUHB4MU1GQmxFZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUM5Rk8rbzI5ejdrTmthVzA3MWZYbTRwczNqMi9KSGRCbHdPQ0RTMTlITHls?=
 =?utf-8?B?dVJBU2o2OU55cUtDU0tUSHU2QVNud1o0dFdhUUtscEdTcmpIbVNucng1aDR6?=
 =?utf-8?B?cTFLb2E2VGdTWnNleVVTSzVOeTFrMmxJM2hvcklHUDY3ajhZRmRLbiszNDZF?=
 =?utf-8?B?WUxPUWkzeElDN3J6STEvZ3J1anU3Y1dRNkIyNmRuYlBHYi84UDVPVHRhZSt0?=
 =?utf-8?B?Y3N2QWRJWDBUZ1FibFJuSzdaTElDZUM3NUV0dHUvOTkrQ1BtWHpsUlZXOEdq?=
 =?utf-8?B?NGMwWUgvQnBtRmM3WllpWHQvNG1ncVhpV05nZnNFa3BmU2czWFU0bUs3dWsr?=
 =?utf-8?B?MG95RlRLRkVWMGdkM0ZJREFoZkxGUHJoQkZoM3ZjbzNQMy9PY04zczJxbGJL?=
 =?utf-8?B?Q1QrVk5mNjFSMlJmT1BHSzFXMCt1VUpsN3lGemdBeFRUZTVaTG53S1ZmVFgy?=
 =?utf-8?B?V2Vnc3Z1Y05ZLzhUOVl3WjRNcVpoQVZ3UUg1UVduVlBnRDFSRXV5S1FwU2tB?=
 =?utf-8?B?VDFkRkF6RnNFRnlxNDZ6TVovaXJ6V1NGMlFsaHg0R2xJUW95WDFOUEZNaGF0?=
 =?utf-8?B?dStEc2laK2JHZml1T3R2NXptZUxLVWNrUk5FdHlNVXh1SlQ5UEZFSXY0MlJW?=
 =?utf-8?B?RkEwWm1wWVErZWNYNjVyazJsZnlFL3p2WkN3Q09qZnBNbFUyZmppa3lYS1Yx?=
 =?utf-8?B?SEc3UnVEYjdXWWloMmo2cHhTVzJ5Q2RmNm4xY1JKVHdCWjdjdFovUmVWdHk3?=
 =?utf-8?B?TXdrclh1d2hnTDdEOVF1cFo3aFdabDNLbzVwTHFVakk0a2c0VnpkbVhwQjRQ?=
 =?utf-8?B?QkdsSlJ6SW56RE13aTBUcm5rbC82OUpCMi9naGZpOUlPRStGV1VnNU1ZZTAz?=
 =?utf-8?B?MmpwSmZvU3NFQjljTEdWbnhtWEgxem5IQ2pHcmJIc1hxVi9KUndXY0tKWE5L?=
 =?utf-8?B?aEdrL2doUWJ5YU1jVHFhQ3JmU3VraEhjQUVlWTNOeGNBYjhKcm1WTWt6dUph?=
 =?utf-8?B?YmMxYjNLMCtCVlMzUEh5bE5jMDdIRnRuZk5Ya1YrdFpUL01vZHFpTU1ta3dr?=
 =?utf-8?B?Y2ZTa3kxVTF4Y2hJT0VGbUJ1d1dCeFFQYUxaU0wwK2lpUHh3NHVWNjZBRSsy?=
 =?utf-8?B?dVhrZlFHWUtKRjdqSjBvUStRUzF0VERraXV6dVJ3WGVDMldLeE9uNkp0N2hH?=
 =?utf-8?B?cjEzM21KVW1qTVlKY2NIMm9ka21hMWJKRDBiVTdxWUExd3FWcmNxaFZrdDBj?=
 =?utf-8?B?VXZ0Ym9JclZ6a1g4eGxVaXJNdVI1Ulh0TVBQbDRIL1RVbElCQ2xVTmV1TkxX?=
 =?utf-8?B?V1lzTXhkRXRhRk9ZWHBzQmF0Rk1XTVR6bXVCYTVaNmRFcEo3NmNESGJoOEE4?=
 =?utf-8?B?QW5EU0J1c1p3WC9Bd05CbWpqQmFDbG9PZ1MxR214WnRyWFhkZEJOdUV4eUlK?=
 =?utf-8?B?V3JrYmhqQTJSbTArM1g5VlJWZkhuYVljSlJKSWUwQTVqZkNpRXRGbUh4akZT?=
 =?utf-8?B?Y213UklHaCtUY3hzODNQRGd2ZHVYdDRMSFV2NloyUDhwVy8xSndIeXJuaDZk?=
 =?utf-8?B?SE1WZDVFRS8wMWNvUmhsMVdKaTBkZ2t2T1FtOFR5K3ljc29zSXdybjlGZlR1?=
 =?utf-8?B?YlJ5NEVSWGVoVFhqS2tkZEE2Z1JOcnJNZnd3VjFzNVRpSVlOZkxpYjJKR0dQ?=
 =?utf-8?B?K3htNHNhYkhrZTl3ZFFFdVFYbmJ4aGZMQitmS1grUjZQemc3ZjNYL3RzdVBH?=
 =?utf-8?B?UHFLZWtJVElOZGcwZXozRWNCZldPQVZDaFoyakh6VE93dkxlN3c1ZWhUa0ta?=
 =?utf-8?B?aDFaT0ROYVVJTThpRmtZUHRDK0hld2VVQlk1SUVMZDhhaEFjTng1b1orVldI?=
 =?utf-8?B?Y2pHNlJ1TThHMGRlYkUrdDZyejRxRDRpMHR2ZmRaTGVFY1hLQXhTa0FxNzVM?=
 =?utf-8?B?UWRJdkxlUE03dzVFczdObnhRb3I5S2pEUUxIK3V4YnFkNm14RnM3WlRENExj?=
 =?utf-8?B?d3JQWFduNXlGSHdjRHljTGhTeXNLb25CVUhCRGJTVnAvVjhWRGJmN2cxNHZx?=
 =?utf-8?B?cTJoWHNpY1p1OGd4eWVlUytPVU9WNjRZVFpIbW9BM214dnh1eHVjclV6UWx0?=
 =?utf-8?B?QTJ3TTZjNEptMlNkai93R0FmUGNpM3lhcjd0b0VXd3ZPVkdPeVBmWTdUbG82?=
 =?utf-8?Q?eg2ZiX8/c93zT8wl5qSkDW8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec786e9e-0c45-4114-6c46-08dccd04121d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 17:07:35.0010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63wtybZtdbpXP+XsHg6Jl0AjaHJ/gQzZ7uE3DawNZPMC21ptDlGB5lbj+mDgok6J5pccgGmYeZnL1HETDi3e2Geh+BZ4B30Rj0oSB2PB52k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
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



On 04-09-2024 21:52, Lucas De Marchi wrote:
> It's confusing to have a *set* function that actually probes the
> hardware rather than receiving a parameter. Rename it to *probe* along
> with prefix removal and comment in the relevant places that the
> has_flat_ccs flag may be overridden in runtime.
> 
> While at it, fix the mixed declaration of struct xe_gt.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 8 +++++---
>   drivers/gpu/drm/xe/xe_pci.c    | 3 +++
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1a0d7fdd094b..449b85035d3a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -588,15 +588,17 @@ int xe_device_probe_early(struct xe_device *xe)
>   	return 0;
>   }
>   
> -static int xe_device_set_has_flat_ccs(struct  xe_device *xe)
> +static int probe_has_flat_ccs(struct xe_device *xe)
>   {
> +	struct xe_gt *gt;
>   	u32 reg;
>   	int err;
>   
> +	/* Always enabled/disabled, no runtime check to do */
>   	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
>   		return 0;
>   
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	gt = xe_root_mmio_gt(xe);
>   
>   	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (err)
> @@ -688,7 +690,7 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> -	err = xe_device_set_has_flat_ccs(xe);
> +	err = probe_has_flat_ccs(xe);
>   	if (err)
>   		goto err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8642c079bc65..94856ed6686a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -677,7 +677,10 @@ static int xe_info_init(struct xe_device *xe,
>   	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
>   	if (xe->info.platform != XE_PVC)
>   		xe->info.has_device_atomics_on_smem = 1;
> +
> +	/* Runtime detection may change this later */
>   	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
> +
>   	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>   	xe->info.has_usm = graphics_desc->has_usm;
>   
