Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2A2C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15CE10E604;
	Mon, 31 Aug 2026 06:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPdInd3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEF310E604
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788156735; x=1819692735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2IMUm82uLzqYCuItIhc0jQdyUoLFibN8+IbScuKmO6E=;
 b=IPdInd3Ps6TVUEQyL1KMWLz7Wme+E9Is6s8Z8rflqKEGB3Co99EAwfOH
 7d50KiZZMfa9LAkXLoVWyv+C8tw1j+6t6b3Nq2xMab5Pniwp/Tn3VdA5Z
 tbo0n9Gqi5WJnAThCinApwYAnP6SMGLX350j9Ayo5P1giM3lNNMpw/Y+c
 eQoPq20myNB9faEUZBrIbfpJuLphFbr5Ac8xw8Y8vmR6BEd0xHQvs6RS/
 NVNmwYWIKQ9jf8xq9jQ+91HqJVM+wWTVHtoNCzJikwn6gcCWBj8aUguhZ
 7jY3WxdWL6n2sQ9RziJPqIgJIdK4JEFVDdDmgJ5EEsNAzgEtTTnA2JBKi A==;
X-CSE-ConnectionGUID: NZl/52JuQJy5kZS+L6REuQ==
X-CSE-MsgGUID: P22t0v+1SemNVbhUIQIykw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99153437"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99153437"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:12:14 -0700
X-CSE-ConnectionGUID: 5pE2AmG/QgaG+p9Xd76cXA==
X-CSE-MsgGUID: s6AGiG2MQuCN5kpxT7C+ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272219804"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:12:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:12:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 23:12:13 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MW3+ltnN21oe6QM1rl2mUNyEDzu+trCpiko8MnYCiNVY1AFx/gqxvS/3X//U54sB5DM48uSAy1n63aOeLc7k5dmmu1hvxzGaPB0BmdaHptqCltSJYUXqgTk/XspPkBUTGD9mHD8/0YgaAhPQg1B/3f2HJUHwez0CPX60PuvhoQVtkRbl2mn0V0nP7ruwM9z1gv5qoZVaDyTnsZGqimEHOEpZLQHexvuXjbI6AizLVvCEMIK7Y0InBh/FKMEv1HEeAsZF0v8sz/04IdCt/zD0sHBm0m0K1bwvHfOiqwu257xkd9llOj24oiSV8V6RYJFmQC8lcDFZ8seZeivlW4QtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKhTrrJa3OGs3RClS9/zmDgFwQ/jsegWC/lwl4AZ3lM=;
 b=LPGvNT88Z0ogzbM6/BvUUswIjnQ1MI3q5q2T4/d8v7Jt47n23AdvZQuXy/iVRi5m0v7QLa+MVfqVtdCtqOjLalbKD57FGQqHkV9HiftRQCed3kp86PU98xJCh381vnNjKqZlyPiaIFjynP9nD7ehsZklmzHG6qjQFdluWuH/3fYiGijBTXHgb3o4o6zjiJM2FwwId4bCFEC2ITo5LWQzBmizyDL4yBZz5Tpb5HNXdyp00ODTIIdSUZDv9lVu6Ah6GbGzcLziOG4Rfx9EStR5li6tNZI76KmMCrJ0nVo3RnCFYJJIdp2KPbggcJmGi81/3QSwIEFZGhy00aISqUXo/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DSWPR11MB9690.namprd11.prod.outlook.com (2603:10b6:8:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:12:11 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:12:10 +0000
Message-ID: <4ae58bd2-98ab-4ce0-88c9-735192ca299a@intel.com>
Date: Mon, 31 Aug 2026 11:41:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/xe/guc: Report reset-request failure using
 SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <badal.nilawar@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <mallesh.koujalagi@intel.com>,
 <matthew.brost@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
 <20260828095803.2130312-2-arvind.yadav@intel.com>
 <8eeac07f-deea-4d77-a9dd-7fb5706af15e@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <8eeac07f-deea-4d77-a9dd-7fb5706af15e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DSWPR11MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 48196f8c-b538-47b0-dca3-08df0726c95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: LAXexZoxJaFCxc4ygq+B8yIjnc6iR7//AL+2LTsFQCqRx9hVdXmaBlIVRAx7b9uJBVKHwYsW0jSMoUDR8zNJydlJTAV9wjql55DZpAaH01ET/p9G+BtV6lkgu7Ksrbr7kFJxPuWWJRz8FyyyTTcg2DvZDCRvQ/zI6hAMXNYdZV4h660NzGdVAsJhiHK5r8/PGM890kEssuYzh2MwciKFvPf66WXgdQbOGYpkunB6jP8mnLiVU//06eDVn84MxXRnBAW5JLdm6DbqSz2yNO4FQgUimTJMGJPp2BmRDf814/Guo9OIYS3KGa5WCUoqEEq6Qmzwd6mgD5zPkvch7yP3NY1jolyTQ9UFLD+JqJkfUtYZaMewxlCWMhiTauLDU96mLULeofPXlVUDFeSWh5wOBWlV1OzhAEGRSrTANKy8aIRD828VmrDbEmBFrJJ8E8p+wIdMXISje3m0j4GltXeEVmlq2//xxATnCL/fl96S+3ovRiUkko3K8ryfwBPPBGEuMc5T8Y0uFMvBKeDaj6cUs36avaePeYQMlbHcyTBG8uQpt2b7RVXkZmDz+/lpc1S7Id119ZofwAwlMuypZqbA0ePRS4CRuFax/xv1x2p6IKp5Q5TEhz3dcT1MeWrenWkm6cWoICUEVhrelnxzC162CHByrtYHCQ4bkh0lstxlXoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3dsdTRFaUtTUUd1VjgvZFFnWEI0OFVuODRlcm1ydmVCandwN1prZlBocXBL?=
 =?utf-8?B?R1ExeVRwWjF1SzRLczM2Zkx2VHp1U2xiTm1NTUxQUkw4cERYTkpNbnAvdUNu?=
 =?utf-8?B?OEFtcGZlZUFVNmx2ZHRLN1JQaStKaTdpeTZWY3ZJdWNSUDBwb2p3TjRPU3Jq?=
 =?utf-8?B?SFV3d3hZSjNqaWFjNVc5K3E4V3B6NTUvTFRSdXFuTkFkbmtqOTZwd2dpb1gr?=
 =?utf-8?B?enloUml4TFhFK0FxNDRyaHAxMDVua29kTkpiTk1peG9hQTJ3UGFlWlIvS29W?=
 =?utf-8?B?NHhLVW5hSU5PbHVqdUdOVkZNTWV1dUw4TzQ3SGFrWjMyaTk4MFBNaHhPblpM?=
 =?utf-8?B?cjBOTXB2aTBzRHVEKzJrNGRSaXlBTk9zZ2EwSzM2L2JZVW5id0pjWlo5T1Ar?=
 =?utf-8?B?ejdBVEU2QXBod3dFRjB6T01SVUd6UnhPLzRpZXhORzV6R3Z0Y01LQW1keGNM?=
 =?utf-8?B?bmMzcVYzVUVnM2lCR0ZFWk9HK3FNVWNzU2ZXQjFQZ2gvZTVCWDd2bnRybGUv?=
 =?utf-8?B?NHFjOFhBdExoMmJsWCtEejMvZ0tHVkxvWFN4NEVzYnFOK3NQcU80d0hiVnZ4?=
 =?utf-8?B?UHI1MFNMQnNCTUtDclZmUzBYVXBPSVJ3MExwc2NDNHJURnVuRmVhZUVWbkJC?=
 =?utf-8?B?QVFoMFpIdXk3cWpIRmM4Yk51RHVaSXZxYmNjWmVDSm9QS0ZNdElBbTl6c3hN?=
 =?utf-8?B?QUdZV2F2QjVIakpneG5nTjR4YTIxZlYrNG01TFZqazhNTE1hL2VvQkFSQ3Q4?=
 =?utf-8?B?QlZITDV0UUtDbzVzY3VITGYvb3lQN1VDV29LenJMY3d0czQ1TitJeUtwZGxU?=
 =?utf-8?B?SlJjRWNySDhiMVdYTEdBSVJGand4WkRYRk9wQk4reW5BY2tyNEtid1kwM2lx?=
 =?utf-8?B?Q1BMTm9XL282aUJjelo3WFdCUGN4eVU2NnZsM1JMSmlxZ2ZMK3h1Tm53MDk2?=
 =?utf-8?B?NjJnVytwOEtHNkdLNkFBcnhsdmNpdTdBSWlFNklLU2Q2Y1FBODZRMnhNbWZP?=
 =?utf-8?B?Z1EvQSttMGI1YTFMNk1nbmU5UTFPU283cVpPRldkRHU2ZGpqbThuUFFuUlhC?=
 =?utf-8?B?VGUzSmhGWitTLy8yQUNoTG5YYWM5SitaNUg2RE96Y0R0VVpWdUtreFJwUUVK?=
 =?utf-8?B?alYzVk04dXJXZnA1MitkU3lCWUpzVk5RYW1FdE9aSnc2NjJDbWU1bGVhNW1M?=
 =?utf-8?B?cElWTXlWVURJR0lKcjZzZ0FMUWNHUHg3MmpSYmREWEtnYkE4NW1ISnFhYzcz?=
 =?utf-8?B?OG5HUUl2Qk5kMlcvakQvcEF2MlNMT2p3VmRXWUZIUUlpTzVqL290VXZIcGZV?=
 =?utf-8?B?NDhyQ0lNdlk2NStEVWFIUFVKRjYyOEJUWGkvTkY4ZG1mb01TWGV1bEdoUXo0?=
 =?utf-8?B?ZUJvVjBzYXlwRVdFSzY0WGRhblhvSDlEUUdPenh3WU5XanoyYVlmQU51b25W?=
 =?utf-8?B?eVRSRVk3dWVhVitnSndpbGgyZXF4R3pHQ2VEelR1d3p0VkZzbStIU09JcW9z?=
 =?utf-8?B?OFQ3TmpqSUVPRGZnREprZ3dEL203eENmeE1sZjVaUHV3eTc4cE1peVpqZWU5?=
 =?utf-8?B?eC94bnMvc1hZNzNCRWhlRnJNbThmNCtlWXJoNW9yQVlyZ2ZuK0czODNaZ0Ey?=
 =?utf-8?B?N2Q4RE9RanptOGhRVkpZQzZZSnpyMlQxQVRsQ2N2NzVTK0FybHBMMzZGNG5S?=
 =?utf-8?B?SmIraG5IU09FcUsvN3gwQUhUTkM1am0rREdEdHd0V1hRMldkbXQ1ak85bllx?=
 =?utf-8?B?enl3SUd1emZxM1pJODZQeUhFL2dDc3NyVXExMlN4TXB6NFdnTWkyaWxndnc5?=
 =?utf-8?B?bU1GZFVqSktWWjhGL0NVelY0ZTEzeG9WZHdNWXNqeHpVTWtsWlBzYXNXOVZj?=
 =?utf-8?B?SmhMVDViSEJ5L3FHZ2s5S3R2aUk3b1hhNzJBL2YzbjUzN1QybEpPOHhOd09N?=
 =?utf-8?B?bFQ1MFFNdmhoWWY3d2JVbDIxZkFwZ1M1aTQwekdUejU0VHNxOWpLMHJ5VmhJ?=
 =?utf-8?B?MTNqYnpHc0VtaUoxQ2tleWJ1M1lFTjhENTE4YWhUcmNNRE5RQ3NNT1lPRUUw?=
 =?utf-8?B?eTgwUFRJNEkrY3k3REcxNC9YRGNFMEMwRVBYMjZ0dTYwMGNZVWNXVTdGUkJ6?=
 =?utf-8?B?YmhYaTBxS1ZxSXlvSGcweDN4ektETGJJVXlBM2FEN1hKaHVLK2VtNFBHNVhX?=
 =?utf-8?B?S1VQamtXSDNjb0JLM1RyT1ZXdkdqSlZoWFN1TGgrT3FXb2VpYXVhZGtkblRN?=
 =?utf-8?B?SEptOFdRMHZhRmtKQ1ZLKzBraU1vL2NKdU5DQnRCTFJkMGxjdGhiRkQ1MTJG?=
 =?utf-8?B?Wjh3SlVoQUdNRjVCREJ1MENURWo4WGhpdWIweHM1U0VQdGQ0M240UT09?=
X-Exchange-RoutingPolicyChecked: fXJER//nFmi4ck6X4WFRBJDP1Wznf6ExFMbugzAwuGfk7j/OdpzhW9hmXD11zR/Kh6zkBbYeQJJH0xuenA0QOKrurUmQOV/4JorFMvgLx/FJio5p3o2TzhrratUtS8juPPSF7Ey+CpVCca9QvCH4u4pbQqtcGnS8PMs9+8dIupTV5AcgWn0FfP/E6wENPOsdDkBQfLbfQng9qxFvQkxaC6t0u5E5j7//FAOZLjzkSaavWPWCw4Cix/YKtXbZA/gdzrPNrySUhCKudV088qrdMXIGtstrmnKABh9lmXliyu4JpxQUkShUU1v5Tanvff+h2g9G1ioz2g/2pxoJGhn8Ig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48196f8c-b538-47b0-dca3-08df0726c95e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:12:09.5595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCBVHNVrb5lzNzWujkftFASVxoKunBlshtRRBCHBCyrLpHBmPWeUARLumiZnMLCaa4UC6UffN/vWdfPq/3vUCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9690
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


On 28-08-2026 15:58, Michal Wajdeczko wrote:
>
> On 8/28/2026 11:58 AM, Arvind Yadav wrote:
>> Route the GuC engine reset-request failure through the structured SIGID
>> logging helper.
>>
>> Use the GT component for the engine reset-request failure, which maps to
>> XE_SIGID_GT_TDR, and pass -EIO as the errno value.
>>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>> v4:
>> - Clarified that the GT component maps to XE_SIGID_GT_TDR and -EIO is
>>    only the errno value. (Sashiko)
>>
>> v3:
>> - Split the GuC reset-request failure conversion into a separate patch.
>>    (Michal)
>> - Dropped GuC job-timeout warning conversions to avoid changing warn-level
>>    logs into error-level SIGID reports. (Michal)
>> - Kept only the existing error path that maps naturally to GT_TDR. (Michal)
>>
>> v2:
>>   - Rebased on the latest structured SIGID logging series.
>>   - Switched from the old xe_ras_log_() helpers to the new xe_log_()
>>     helpers.
>>   - Dropped paths already covered by the base SIGID series.
>>
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 99d8c807ff05..c1d469624215 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -34,6 +34,7 @@
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_submit_types.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_log.h"
>>   #include "xe_lrc.h"
>>   #include "xe_macros.h"
>>   #include "xe_map.h"
>> @@ -3494,8 +3495,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>>   	reason = msg[2];
>>   
>>   	/* Unexpected failure of a hardware feature, log an actual error */
>> -	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
> nit: can we drop "request" word from the message?
> it was not our request that we can refer


Noted,

>
>> -		  guc_class, instance, reason);
>> +	xe_log_err(gt, GT, -EIO,
> I'm still not sure that we should use GT component here
> better to define GUCSUBMIT with GT_TDR as its SIGID
>
> note that while SIGID documentation says we should avoid adding
> new SIGIDs without good reason, we are free to add new components,
> which are separate concept to SIGID, and initial component list
> included in the SIGID introduction series was only "initial" to
> show basic SIGID usages - there might be several components that
> use the same SIGID - see GUC/HUC as most obvious examples


I will add a GUCSUBMIT component mapped to XE_SIGID_GT_TDR and use that 
instead of the generic GT component.

>
>> +		   "GuC engine reset request failed on %d:%d because 0x%08X\n",
>> +		   guc_class, instance, reason);
> with GUCSUBMIT component above message could look like:
>
>   ... SIGID=106 (-EIO) Tile0: GT0: GUCSUBMIT: engine reset ...
>
> vs
>
>   ... SIGID=106 (-EIO) Tile0: GT0: GT: GuC engine reset ...

I will also drop "request" from the message and make it " engine reset 
failed on %d:%d because 0x%08X"


Thanks,
Arvind

>
>>   
>>   	xe_gt_reset_async(gt);
>>   
