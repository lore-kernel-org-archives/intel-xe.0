Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898B4CAC589
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 08:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4735410E657;
	Tue,  9 Sep 2025 08:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPiz49ee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B359410E657
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757406250; x=1788942250;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=o7CsvTD5JttIlzkF9C3BGZsDEdiz0yXL8M6ZqzRk8to=;
 b=NPiz49eeCmPPb4RabCQaNbRxw6MCdFaoNZEGF14lnayYA1hZujarosc5
 Ib1rWeR+y4NaMrR8IksAJQlh2RT/WuofhP2Sq4I9Aa4HYv2BxhTHNpP6I
 gEnHxJpQ40EUUhHE6vCsglI5rG1U1qxVesDmOmPH2nN+u/9+QF5jKMCAV
 WJrqZI5TC/m8F9fEhzjAPiUp30jXef1WB8zSDAVW79wa3gIeHzO29EZtn
 hJ0CuRZtL+nOBjkO/8fqrQpEbJzBlzzwa+IR7R5nnv36Dvw+8Ba9d/1q1
 Pw/TTM9aSfQAv/VrsRO1CnmtkkAfW8eOlWrhyMab6LDak79Nw53KWa5bu g==;
X-CSE-ConnectionGUID: vaQot/9GQ3a3BYNJ97gxCw==
X-CSE-MsgGUID: lem02+TCQEeiirXolzaegA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59754720"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59754720"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:24:09 -0700
X-CSE-ConnectionGUID: uCWwXcCeRB67dpFy3tI1JQ==
X-CSE-MsgGUID: xnVFokS4Qqy5ossApPnTuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="177318707"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:24:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:24:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 01:24:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.40)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTGaQUxi7PV/4oK2s0KbUu0pXXE73UhispdhHiMO1WOF/3V8reZUPlMr0AlYLPoIsx449/XevgDl1seHxLJHLFW1Zn4U+l1T8oLFYkQa4eK+MOO+0YHOZes2FWqqO4m3++cYOo9lBH+H1CawqHebCmwouh74GLC5fX+ngHnWkXVusZSAgD8t0eywiKfnGzbGMFVr4j6oJSsf/4RumCo3kabV35DyoWYzNzK/eQUsLU6H5BIGG2RTfbH7B0aXB+4OSLmlMrShDKLJ1lDcfDS0EyrCAI111m7gL/ePlzAFaDH+i2DF7Fo6o/z/fgFP443ZWlUjWM2h0tUM0OeoECObqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7m+Do8hGqJ57VGqF1P8HZLrjjyTpU3O4vgKn5cfWM8=;
 b=sLFnKERMncDPruiDgnmuulqliq0oOCLYWYzA2Vt6GjaxYkJePZ312Zj8TPbwcQyeGY5qerak7QrJ3CbWo9m4F4mfLC1VUqJFF/X0sLzjScCnbS8JlMQxSj3EV4Vm9OjWHZ8SQN1X50SOuWVPVraqJqel53LhpPlBYoucrtrnYlM5QlMQ5cNhn8uElihUP8tWFN2MBqmmgsIkg0n/ma6D0Jn6a3HObQgRul1rc07cxeJVE0FyB1jXnZ/RqDepeb7r6CfWdCv3eKidEdx3AIiW2xIxS/bHA09QnZqrMKoqxo4qUPAbgB0aeTGGYuU5jjwt3BWY5rkl6OOyP/ol6P5Crw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:24:04 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:24:04 +0000
Message-ID: <7ce5cf51-f075-4b8d-820a-b5fe4d45f6c6@intel.com>
Date: Tue, 9 Sep 2025 13:53:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/xe/vf: Move VF CCS debugfs attribute
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
 <20250908123025.747-8-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250908123025.747-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH8PR11MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 96536c50-3e4d-4d03-ba00-08ddef7a3cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2k0Qy9yMWtLOEJ6Rk9mdzd4NGE0UFpLaHZJb0EyWlRWOUIrbEl5RXFQOTc5?=
 =?utf-8?B?R0R1TjcyTnpSdklGZzg4T1ovaUVCVlFBeTNxOVREWWhnT2tVV0N1RVRNWFBk?=
 =?utf-8?B?N2NCbTdvR1lCa2kySVloWmFiMXAyVng0ZmY1ZnI4VnZyaVZsUG1tcGJYVFNq?=
 =?utf-8?B?cUNtT0ZZT3ZYYW14V3FzZ0ZFK2VNKzBaeHgyckFUVzdEdi96bGFLcCs2UzRN?=
 =?utf-8?B?OHl5N1dPWmR1b1EwdDZEQ1ZPQUYyclR4cVVWb0ZRT09KbFIwS1ZFTzZheGNX?=
 =?utf-8?B?TzdpVTRNZ0VIT00yV1B4UWgwWVpQcjIzSDdRdGJteDlRb2FiaGxnWktBSE5w?=
 =?utf-8?B?VTRtUDY2RFpucTlUaHJ1OFBGaU11cTZualY3UDFoMkFPOUZ6YitFNGFHQytN?=
 =?utf-8?B?eDJvUTM2TUJ4UjljTmR6dHU4WCtCVW1KbnNuUytXMlFpSmNqSjA4dXRZMjBj?=
 =?utf-8?B?RStJaVVROXRXYndWL2NjK2VvaHp4c3RDalFEdEdIakZUb3QxTUNYL3MydkVl?=
 =?utf-8?B?VzhsQlQzSWZDeFhvRzVJbG9VSmgwTlRVcitBNGVyT3EzekwxcFlhamFSTHJp?=
 =?utf-8?B?UGlwdWJlTExWL25GeGF5Y2k5Y3dzUUZ1K0paR3BSRlFYdjMxY29lTFVpNzds?=
 =?utf-8?B?a3E3VEZoMDVmUDErdFRFanhNNk1NL1pEZFN5bVBrYW13Z2s5MWFGbjVPbXha?=
 =?utf-8?B?dzFncThqUkpyc1QyTkVsd2l6QnhpRVFZcVgyWUc2NUtvQ3JTQnAxQllQNk01?=
 =?utf-8?B?b3dMYS9SbExQM0tHaURmVEUyNUVkQUt4Q3Nvclk1MHptcjhkd25ML0ZDQXB6?=
 =?utf-8?B?elpTaHVVYkc1TFdzQU84cXRWc1ZIc1YrMnl3RlBFN05VaHppRmczemlHWWpp?=
 =?utf-8?B?K0h6a1pPdjhrbUFWaUlFWVVYaTVQME03WTNhc3RvNVJZR2RsYW85Y1dIT0xT?=
 =?utf-8?B?UWxTOU12cHVTZVJ3d2xXd05sWk8wVy84UFo4NE90Y0t4V1VjcHMrRTVjQy9j?=
 =?utf-8?B?ZjdHNmdrcS9rdE8wVEt1ZFo3SWlpaUlad0xwa25CanhUM3pobUdKZ2Z4a3p3?=
 =?utf-8?B?U2cwU0N6UWFDTXpXZHBvYnFJaFArUEdSUUphdVVZRjNNODU0SW9oNDhKUTFr?=
 =?utf-8?B?SmtlRVFSNU43WkZ2RlBnTlpGUlc1TTkvRnV2UXh1VEtWZVRIaDh4aDJpUVJo?=
 =?utf-8?B?U1JOak5JMFBiUTY0Z3paMzBHcXF0bkJTd08rbUYzV09SSlA1TS9QcEw5OGNh?=
 =?utf-8?B?ZlNzMnE4Tmx4SzZCMGEzS2ZsM2kyZ1dDYnNKb3lHTjE3djZtQW9yRnFlOGxF?=
 =?utf-8?B?Rk15NXZ5Zm8vZ0xNNThNbUtGdmZEVU0xa2ZPTElWR2Ric3lRVnd2b21VUjd6?=
 =?utf-8?B?KzhiMk44ajdRSXdxbzI2Tnd2RytsbjdvQWE5UDE5MVQ2TlRyaGVqVFR6ODVP?=
 =?utf-8?B?STdwOEpreGdTOWdZbDZsRWRFazd2dVppVXJkK2I1aHZNVDJ2U1djOVBTUVkz?=
 =?utf-8?B?cmpMekJCbG1qR1I2TTZZc2IwNHRUQWdFd1daQStPb3U1bHp2SWR1WlF4T0ZD?=
 =?utf-8?B?R0dDSU9VSktEYjIrcVNmUTBTMzhGSWxqZkpHcVVIZjBnQzhBY05IV3pGZzhY?=
 =?utf-8?B?cWIyanhQWDBtbGw2WitGYStRa0VKWDZBckZYdGg4eHRZVkRFUFdoNE8wQkFt?=
 =?utf-8?B?K3ZaS01kUUdqTEVNa1UxRmM0QlF6UTRBMnBRQVBMR0xjMWdjTExZNWsvaHNu?=
 =?utf-8?B?Zkw4aTIyZjVsQVBoT0V5OUpRai90NmxHUTNaajlWNVZWVnNxNXJXcEEvam9S?=
 =?utf-8?B?QUVRTEFzM1BmZmpoQzV1MGI2WGtqRTRQVjFRRVFBK2laakdMelFvSXRQQ2x5?=
 =?utf-8?B?em9rTDF4YzYzQXBtT0xNeVczU2FLUlBhVld4dWlYNGNTT2lBMFUydUdBemhE?=
 =?utf-8?Q?6h6atw5Asso=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUtJWGZOdTM4Z0ZxenZXT2QvVU5ibnpsa05IZEtoOW1LYXBJN1FGK2hMUnJM?=
 =?utf-8?B?MCtZYTBYejQ1b1FVaXhLemJtTUpmWFJIQ2FpclM4eElRTEMxWCtXeHZSNE53?=
 =?utf-8?B?ZHFrcytyNGp0VW9SZTVwZ2RFZVh3T0U2WVAyZlJDK1hpQzBFUEMyZms0VVhX?=
 =?utf-8?B?ZU93Y1l0THZzdmV4WVZMTVVFYkhqVXVtTkN3Z0xWQ0JJdTI1RHM4cUo4OWRD?=
 =?utf-8?B?aFB6di8wUXlEbDhhVVNxbmg2KzFsTTBudVZmd2J1UEdBZGxEdjAvanowVHVw?=
 =?utf-8?B?M2w4dUJKWUNLOGg2bUZPcmN2RDFqR3MwMHh6QkErN2s0RFhnaXpjbzIxTzda?=
 =?utf-8?B?Y2Rtb1BsUDVVZ3FxVEI1a1ZKTXl1U3BhOFZXb05ucXBaV1Q2RzhXK3dSVTZm?=
 =?utf-8?B?RnZuZURCT0tNbGl1YmMraGFlNkZsTy9lYXFBNWszaHR0VERyS05MTWFEZWl1?=
 =?utf-8?B?ZWV5QWxpODJHeGNDemZGcW5jTFp2NDZ6U3p6TGFuSTdkTG8zck5hUlBCaFVD?=
 =?utf-8?B?OS9pTW1POWQxN3JrZ3JGWFBGVk1mVUdPRk1ZK3FYY05BNjBlLzVsVzNlUmhT?=
 =?utf-8?B?Z1h3eURRV1M2dm1MSlc4S3UycmUyV0Z6UG5wZWoyWENiSTk3NlJTcjZFQnln?=
 =?utf-8?B?ZGJScWlua3BOaS9PWGd2L2Z2UllNTHFHeWsrUGhtNG52b056QlkveXNYWCtD?=
 =?utf-8?B?bkZlQld2S3laNTV2T1F4VmlTSXlMWXJKYzRmM1VVUTYrNWpxeDJLN3ducSt4?=
 =?utf-8?B?VXM1SU5JUHZ6UDVvdlNqZDA3Rk5NNWpZZ0RSR0ZqNlFTRURVRWwvQkMzdHFU?=
 =?utf-8?B?OXVqd1ExY0NvcWZ6SVZkS0t4b2djRCt2aElBU3FvbmVXbWVNNXFPUGhwaURa?=
 =?utf-8?B?Sld5TVZVMFBXdW5kcU44dzJITEtnalF5SHM3SkV3NlkySTZ0OGJEN3cxQ2N1?=
 =?utf-8?B?VXFKT20zWHZ1cWhKRzZ4bkpvYmNwSVNUZVBWeFJoeko2dytIYUxqOFFON3Fw?=
 =?utf-8?B?eEVGZEVLYlEzSUI3MlpBUXVyY24wbzRzZzMvdittQUtsT29RVVU4dGh6RURm?=
 =?utf-8?B?UVg4TEV4WGI5MHFUQVBiS0NQWmJReEhCNCtOZittdU80alF6OFc2ZE40L2p0?=
 =?utf-8?B?ZXdnWUQ1Z1BPcldKVWxxUFVNcjBxdVVZNjlLVzFlcW1JT1ZrenNpdStCT3RE?=
 =?utf-8?B?ajJZSHlyeThpN1Y1d0orWGxNbmNUb3k0SWJzSzErS3djM3NZK3cweXRhOXMr?=
 =?utf-8?B?d0ZmNExtRjFra2lZcEM0bzJCL0wvM2FjdnRNeWN4VS9CQU5BdUYvSk5xVWwy?=
 =?utf-8?B?dWhsZDBGTUpvaXpTdTl5dlRGK1Q5TDVGRHdSdXRsTXZzMFU1OEJGWXYwcW1p?=
 =?utf-8?B?MDM4RjBXMkFFOHR5T1BDUGpxbWhubm4xdGJsMmFHRTFFeFdGU3prQzU3MmZR?=
 =?utf-8?B?bGFqVXRzZXBkYUJNOWpHSTQ4ZllOcG14b2FFYTQ2RXdDclJxUFRnMkw1RHM5?=
 =?utf-8?B?RlVLSVhvWDVkQ2JkSzY4S2ZPeHJXQW1hN2Z6bHlhenBsSzZUZy90dnpQRmZp?=
 =?utf-8?B?aU9TVWN3ZXVrb1BOb1o3bjJnNVpVOGRYSEFiN2xKZFhlUEprcEtPOVpIWWFh?=
 =?utf-8?B?UVhreXZZNWpDZWtjZ2w4bXR6ck1ycFNFYmtlTTJCUWxMbUVEYU5GZHYwd2VL?=
 =?utf-8?B?QUIyRENaSVJ0K2dLR0NrVVA3Vm9rckpUQUUwYTBic0tSUG9BRWJIOFVndFVl?=
 =?utf-8?B?YjJaNkFhL2NRNXBQNjlhdnU1NE84NmRTYlF1Ym1XUnVjQjU0WHMzVUZqWjVR?=
 =?utf-8?B?V1k5aWhnWDZhbGg1dWNPZUdFKzhGeWFDbVA2K2lqcUwvaCttVWhYSENtYVhI?=
 =?utf-8?B?dzRQOFY1RGhqUmkxWUFPQmJJRVh3akN2UXZZK25uWXpjTVI5R2h1a09kWVJV?=
 =?utf-8?B?Nmk4L0lRb1ZmeVM3ZkxpZ0NsVG9sSHlERkZwMXhDb0hoTXdIcEdrU1JZVVo0?=
 =?utf-8?B?elRKQkx3UUNWWWt0R1VFVm5sMkE5SjRnank2S1phREN3RnZvdXhaQU5yRVE4?=
 =?utf-8?B?WlArVTY5SWdkU21XWU1kTTRidG51VEcwdGxhTmdCeW5jZlk2Ty8xM29BSFVH?=
 =?utf-8?B?amljUktkVTdIa2JUd2Q5Y1AzV3JYUVhmV3BiYmhnUnZvc1ltR2pGMjg3cXJ1?=
 =?utf-8?Q?76WS0VwB5aQjxs0x+Yyjcbs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96536c50-3e4d-4d03-ba00-08ddef7a3cc5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:24:04.5441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0bZWkwtEf9D2mCU+/uxxUaIbwJjblLcFS1noTzVNy5izlyZUkE2f40CvJUeuF18PwNBYKDs0VRY7MSGpiRb6ypl8zhncE7p6GYnLKWysdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
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



On 08-09-2025 18:00, Michal Wajdeczko wrote:
> The VF CCS handling is per-device so its debugfs file should not
> be exposed on per-GT basis. Move it up to the device level.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      |  3 +++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 39 ----------------------------
>   drivers/gpu/drm/xe/xe_sriov_vf.c     | 28 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sriov_vf.h     |  2 ++
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 32 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
>   6 files changed, 67 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 4b71570529a6..544d7d8460d9 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -24,6 +24,7 @@
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_pf.h"
> +#include "xe_sriov_vf.h"
>   #include "xe_step.h"
>   #include "xe_tile_debugfs.h"
>   #include "xe_wa.h"
> @@ -395,4 +396,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> +	else if (IS_SRIOV_VF(xe))
> +		xe_sriov_vf_debugfs_register(xe, root);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index a9d960de0e5e..f253e2df4907 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -124,33 +124,6 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>   	return ret;
>   }
>   
> -static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_sa_manager *bb_pool;
> -	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -
> -	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> -		return 0;
> -
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -
> -	for_each_ccs_rw_ctx(ctx_id) {
> -		bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> -		if (!bb_pool)
> -			break;
> -
> -		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> -		drm_printf(p, "-------------------------\n");
> -		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
> -		drm_puts(p, "\n");
> -	}
> -
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
> -	return 0;
> -}
> -
>   static int topology(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -318,13 +291,6 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>   	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>   };
>   
> -/*
> - * only for GT debugfs files which are valid on VF. Not valid on PF.
> - */
> -static const struct drm_info_list vf_only_debugfs_list[] = {
> -	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> -};
> -
>   /* everything else should be added here */
>   static const struct drm_info_list pf_only_debugfs_list[] = {
>   	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> @@ -465,11 +431,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>   		drm_debugfs_create_files(pf_only_debugfs_list,
>   					 ARRAY_SIZE(pf_only_debugfs_list),
>   					 root, minor);
> -	else
> -		drm_debugfs_create_files(vf_only_debugfs_list,
> -					 ARRAY_SIZE(vf_only_debugfs_list),
> -					 root, minor);
> -
>   
>   	xe_uc_debugfs_register(&gt->uc, root);
>   
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index cb062328551a..cdd9f8e78b2a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2023-2024 Intel Corporation
>    */
>   
> +#include <drm/drm_debugfs.h>
>   #include <drm/drm_managed.h>
>   
>   #include "xe_assert.h"
> @@ -445,3 +446,30 @@ int xe_sriov_vf_init_late(struct xe_device *xe)
>   
>   	return err;
>   }
> +
> +static int sa_info_vf_ccs(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node = m->private;
> +	struct xe_device *xe = to_xe_device(node->minor->dev);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_sriov_vf_ccs_print(xe, &p);
> +	return 0;
> +}
> +
> +static const struct drm_info_list debugfs_list[] = {
> +	{ .name = "sa_info_vf_ccs", .show = sa_info_vf_ccs },
> +};
> +
> +/**
> + * xe_sriov_vf_debugfs_register - Register VF debugfs attributes.
> + * @xe: the &xe_device
> + * @root: the root &dentry
> + *
> + * Prepare debugfs attributes exposed by the VF.
> + */
> +void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root)
> +{
> +	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list),
> +				 root, xe->drm.primary);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 3bf3364799ad..9e752105ec2a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -8,11 +8,13 @@
>   
>   #include <linux/types.h>
>   
> +struct dentry;
>   struct xe_device;
>   
>   void xe_sriov_vf_init_early(struct xe_device *xe);
>   int xe_sriov_vf_init_late(struct xe_device *xe);
>   void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>   bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> +void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index c5c60f05073d..8dec616c37c9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -13,6 +13,7 @@
>   #include "xe_guc_submit.h"
>   #include "xe_lrc.h"
>   #include "xe_migrate.h"
> +#include "xe_pm.h"
>   #include "xe_sa.h"
>   #include "xe_sriov_printk.h"
>   #include "xe_sriov_vf.h"
> @@ -376,3 +377,34 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>   	}
>   	return 0;
>   }
> +
> +/**
> + * xe_sriov_vf_ccs_print - Print VF CCS details.
> + * @xe: the &xe_device
> + * @p: the &drm_printer
> + *
> + * This function is for VF use only.
> + */
> +void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
> +{
> +	struct xe_sa_manager *bb_pool;
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> +		if (!bb_pool)
> +			break;
> +
> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> +		drm_printf(p, "-------------------------\n");
> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
> +		drm_puts(p, "\n");
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index f0e1189b417a..0745c0ff0228 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -10,6 +10,7 @@
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf_ccs_types.h"
>   
> +struct drm_printer;
>   struct xe_device;
>   struct xe_bo;
>   
> @@ -17,6 +18,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe);
>   int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>   int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>   int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
> +void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
>   
>   static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
>   {
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
