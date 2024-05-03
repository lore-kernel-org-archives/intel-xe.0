Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0F2C4345F
	for <intel-xe@archiver.kernel.org>; Fri,  3 May 2024 19:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCA610E641;
	Fri,  3 May 2024 19:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETemi2O4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342DD10E641
 for <intel-xe@lists.freedesktop.org>; Fri,  3 May 2024 19:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714763600; x=1746299600;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=j4f27T5exFr+56Ry3oGcM6Qp4gnhxBVai5pmnjzswaE=;
 b=ETemi2O45jMwzL9I2lrD2Es3svCCX6eWrHxEWqreLMsAlp46787gA+nF
 ePz3R+d72uAo4UNZIZqnzKNMRTtkrxwLLlkngwXgspBh3U3UCpooinnyL
 dR951fCVMSfT8tCP6dI+aKv3lcTfPJoEu+YZvDyVkOIE3pRnBsGCyoEDT
 70hx7liP/o8atmnl6SiTHbXoDXQWAKNbjkz2nYaJgB73dzWD0YkgF6BSG
 tw+CCv+J65hWPIbAKWsM4MSoi1Dhjo4C1C7YofoZ50ce5oHc1yBGkqDbm
 ONIrKziSbaojrqZu3RyTyL+6FeLEpNdR9WEchGL2MdgsSdCCSJu9lYGh4 A==;
X-CSE-ConnectionGUID: Vi8kp/TJQxORZJhTNCVYvQ==
X-CSE-MsgGUID: JZm5Qt7TSDOOGTajSWlGXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10708774"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10708774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 12:13:20 -0700
X-CSE-ConnectionGUID: Hz5kNAkuSWmGofPt0tfS9g==
X-CSE-MsgGUID: Sg5pv2KETTmku7oSY/5xjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27943461"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 12:13:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 12:13:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 12:13:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 12:13:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyMxwXLDA1ebfCxYdSHsRY1M1hoImjFlTtAghDE5Wu3G6bpePSDgKkBEX2lJss9wqMSvpy35CfLqn4spFsf9q1F3RP8T0B06iipz0NGbg1x67ukYAJJ7BsFQRw19jsMdlDs+OW75EyCvbU6Tw88ejMFIPuHf1XaFQ6hz2fZnsV2DhHUfWa1+VpinkKXayYA2gcL2txB3+jZKrWTbMmz8ZJEaKrThXx392cnosPbSC726ctfuW/ZQRWMARzkW4KnG2Udkd7Zi+ibvGaxsTCq9MIe7eS5QqcmEm3mpDbSHCbdxVdfxrvN2fCXcxuCtlQashy1WYcRpJnWx/TakK1S8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXWSbm5u2FlWPlDslwWfvgc/ZmVmcMhn8UjpmHXJEVc=;
 b=OT3t0D4Jwt+5HeXxRW9jbPliJhL4wuAfZObFcx25Q6dPS1P4GiIJrm5aJcrCcv0lZxAKqRoz7MqRkm0wIDQyUD/vsrfGxRsiOwQ7y/wSe/CL3gYA7hAA/oZJI0gRDvhJWiC62q8FhOZwlmazn/kRvLPS20RVv0D8OqG6xAjaRiqJldebBYCYD/+mztkpJcmS0mPjnp4y07EwG4tLv6RP0ZC+hrRf888qcYXa2HjissHey8tVrqAxFmAj4I6UnR8yvFVvhtbOYtSil/P42OFzNDAANqzXSGzBlrGYREZRuGCQTTVflCh1SI09UYopV+ZKVdVNdxuwy41LIZF9B0P2hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 19:13:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 19:13:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <matthew.brost@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 0/7] Unlock deeper package-C states (PC-10) and D3Cold
Date: Fri, 3 May 2024 15:13:02 -0400
Message-ID: <20240503191309.7022-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: beef34f6-ffac-414f-6a47-08dc6ba515a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHlvUVFURThpMUJGOUFjMzlISHI3bXl5M0xqVHdGUzhXeWgrK0FUWXNqV0Zu?=
 =?utf-8?B?OTVPWk9qa2hyK01zclZQaXQwTzZFb2Nmd0lsK0N2ekttSnJFZ3BLdEtwVFdW?=
 =?utf-8?B?bFFjZE42K2VvUXAyS05lTnFqaXV6d010U2JMQUMrQ0RpM1ZnamFWcldMMyt3?=
 =?utf-8?B?SGxGeEsvUE9NUktvbWJPUDZGREhteFNuclJxdllobE9KdXVGNGhZVnB4aHYw?=
 =?utf-8?B?b1hZMUpWU3hHWnQ0QUhTb2kzR0xFbEplaUVtczJmN0hjcjkxTVpYQjhiQkZU?=
 =?utf-8?B?YmxjcXJIVEdVVzBrUmZjZHMxNDRMdnV1aTNKQmI2dTI3Z3h1VFFRUXBCUS8r?=
 =?utf-8?B?aXh6bGFOdG1nbmVCZTdrV3VvYi8zTUtlQ05DRkZQUitVVlNhQXR3cVdLZWtu?=
 =?utf-8?B?QmZRRXgrbzFXL3kwUDdnTFc4V2VYMzQ4clkyYmhXU0JYcEhVVzRvWTZjS0sz?=
 =?utf-8?B?MFN5aWpGZFpvSGl0Q2MwdytHR2J0RTVybUNFMWtnOS9LQXhoOW1kbTZrSGRt?=
 =?utf-8?B?WWJUYnp1cVUySXltV1NVelQ0TE95NkFaRmpVRE9KNnNMOWdYMnZaOHd5WWov?=
 =?utf-8?B?TW00Lys1bjlqQmxkRlA3WXBtTUNIYjBvbTNIeEcxdGIvTFU3bzNkL1k4MUYw?=
 =?utf-8?B?bDB0Yzg5ekpleEdvVTB4RjRmc25ORXJkRmlXMWV5aVFsbUhtMWo2SldRNkpr?=
 =?utf-8?B?VVpiVjJPem4vNko4WkVCZkxZM3NtY1U3WG9XbStEdmtyL1RNUmlpcitlbEZZ?=
 =?utf-8?B?SnR2R21IRDJDVE5CK0laaEtEZlJaQjQ5SzE1OHpQRklPSmEwZ2JTKys2TE8v?=
 =?utf-8?B?Tmw1N1dOejJKRUV2WGxLVENLL2R0dzh2Rmd2L0RtcVVOY2xmWTluMzFYVE02?=
 =?utf-8?B?bmtUSzJ5VmI2YTVHYk1STmNDaGJPSkFVb3dydUlnelBCMFpTYi9rKzVHUlAr?=
 =?utf-8?B?anFpWlRjd3dwS20wSEdRTkFpNkpsRlRYb0UrNW5MZ3h6bGVvcDJ3QUpCQ3U4?=
 =?utf-8?B?ZUhCYTFaRFV4WUxVSGhUeEFYbTQvRjlDWWRxUmFnZ3U4OUZVZ3Z5QmhjdDZH?=
 =?utf-8?B?WHdxVVpSR0VQWklWaEE3dmFZOXMxUVpRNEEySWJQajZxcHJIWi82T2tHcnk5?=
 =?utf-8?B?TXFONmZpZkR5dmxYbmpDWS9oQ2swRlBRUlJHTXB2YTNpcTgvRnZHWnZWRWhk?=
 =?utf-8?B?RSsva1ZoL1ZQV0JDWFVPbW1zTTlTVEU2aS9KY2hnb3Y5QzR0a1E4TzNoUzNC?=
 =?utf-8?B?eUZzSmw1NkJlWllaQnRmVm9SY0lFQXpURkQvdXAxZnlFaXNYVks5SzN6MHUz?=
 =?utf-8?B?Z1UvTFZqQllDb3lHNUpZa1lBcUdCY0RTSHRkd0p0QkJxQ2hPS0c5cUhoMmp1?=
 =?utf-8?B?V3FJL09yMkpLZEMwSmhLUmxNUGp6ZVpRb29RVmlpTml3akordUNLOXp5WXE0?=
 =?utf-8?B?RUM3Q0x1R21jM2lnWjEvdjNCcDBobTlIRTMwV1ZzaTFBL2MxT2tNaTB2K2Yr?=
 =?utf-8?B?a1R3aFcrYklBSkpHd3FVVkZ0SDNLQmVDU2syWUttSFFYY3JGeEtUOEJTSE44?=
 =?utf-8?B?bk9FUk93emMxZ3pEY0NySDBYRm1mN3l3OVRyZ3pBdmNISzV1UEpjV2lCSWsr?=
 =?utf-8?B?Z3dTZEFGV3pPRkRsUnRWUDFwcjc1UzNkWkhjL0VIU1RYMFJCODZ0ZFFOWTFN?=
 =?utf-8?B?dXcxZWtSdzhqME5MNmhqSTRROTdzV3BTaUswMDFmbDhnbnM0aFhiYXBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3YzdVRYdUFQL0RHU3doVkdUTW1BMFJ6d21IVjg4TUthQkd6dG9KamhYeGxu?=
 =?utf-8?B?V0s0RVR3SmZKRmd3L1lvdURUQkF5aXc4c0lXYklNM0FQUmxab0RJeGRFdE51?=
 =?utf-8?B?ZnpSeml4Z2sxSllDYXRVMStlSU1tWCtQMXdQMVM4MUdmY2Y5R21sVW5MMnlu?=
 =?utf-8?B?YTdCa3hNbnM5amhHSS9nZndHOFA0MWpKa0NOejR3ZVRyb216UkZSaC9TMUp2?=
 =?utf-8?B?SDNvSFhOZHhaK29xNFhNOHNVd0Y5TndNTHlkNk9RSkliL2QvVGduSXpkK0Uy?=
 =?utf-8?B?Q0J6RTROb0RLaFpBUVM4NkUwUjdwS0laUVpkanA2L2YzVGszRVFucEJRY2Nk?=
 =?utf-8?B?bmFsYUp2bTNla3pScmpnSERVT29QTDRJd05uTzF6ZlZtanNCenlNc1JaNXZW?=
 =?utf-8?B?RkpRUkR5WTBVRHRxaWh5dFhaV0FWdnZlVWRyRHUrMHA1dy9UQkdNMWhvS3Jq?=
 =?utf-8?B?cXQ3QkVNUkN5T3l0eTVGUzNuZTV4YVYvVUVlYm9CV0xFMWFnMzJ4d1dtTGR0?=
 =?utf-8?B?UzV4UGxtVUJUNVZnWCtCaS93V3VMdjhpY2Y5ajVSQzgyREpBdkxKajd1SjhG?=
 =?utf-8?B?SnhxcStibGVKVzRROUZDa1dTSGN2QTduZXViY0xUWkI0WFpYWEdocnhRYmRp?=
 =?utf-8?B?WktwTUZhL0Z3SEcrY28wOC8vb3RuU0doeWkyS1Vyc0c3VEFYcjBFOW13Tnl4?=
 =?utf-8?B?cTlKc3doOTJtWXZyc2hSK3BNMWVoZG52MHRIUFNNc1h3Q0t3YVo3OUNaOU52?=
 =?utf-8?B?SjBNUzZXY1lUM3RIODBkVitUL1hicDNhZUlnaS9wNm1UVEtXZUxiWGRseWRT?=
 =?utf-8?B?dkw5V08wS2ljQ3lsOGpQZ0E0MmpiZ1F1SHA2WllGc0tEOW41d2UzN203cVJ3?=
 =?utf-8?B?OWFjd2dHVTJiSGxXaUhTVEQwTmNTY20zY1V2c0hWMy9SbWkrQys1TEQwVnpY?=
 =?utf-8?B?UUNWNDRUMHNya1JjOC9Qd0NVQW5kSlVjamNUei9pU2JWU1ZFV2ZWWkJneEc3?=
 =?utf-8?B?VE5nT0JEYmZyTnBsUHgraklWV1VnZk1XU3QyVmJvMXA1YVZhdVdBMG54MHpJ?=
 =?utf-8?B?aUZtaEpJSlc4THJlaG5GTFJqZmdEL2dGMEpNMGlzK0cwN1pjN0s4S3BPUUlZ?=
 =?utf-8?B?S0VOUGdHSTRvZWpVbXY0WDNQS2JjYjg4NzZWeXdhcGZILzMrNDlWcUg1b1hw?=
 =?utf-8?B?WGpadFZDVzdyNmpQd01YbWhTMWcwNWFsaGEvNlZKc3dxdnhPSlhDTm8wcklv?=
 =?utf-8?B?bEt5R2RWNXd0MVUrUy9YZ3o3V2p4VUkvUFlKemdMT1NmMGZmMXd1UmkwdEEv?=
 =?utf-8?B?d1NyakFTTG0yd3BpaTZLaEE5RFVTNVU1aWlNM2pPQVU5Mmo1UzNtR296MTd3?=
 =?utf-8?B?MGQ4QTB6U29HTkp6dmNKTHlXKzNjdXJIaVQrNGZxRFFYanE3SFpjNklzK0xp?=
 =?utf-8?B?bG9XZ1dObTVPUGJER1JCTHFkWVptTDJjTnJQUjJlaHdaNGpIL2NnQmR1Q3dC?=
 =?utf-8?B?ckRTaHdIM0ZWRTh0bHBLa2lmZ3YrYy9xYUxHemZPRDRmenZ2RzRTRXp1bGw4?=
 =?utf-8?B?MWhVZ1RQMFl1UWtFQXhhL3c4SkVINGpRaUNtR2RiaTQrZkFVaEUvVk9sYXJG?=
 =?utf-8?B?ZzV1bXFMTTIrYkpNNllzQmZLWmc5SkdzTERIRW50SGhHOXRtVkJxbU96cUlD?=
 =?utf-8?B?S3BvZm8wbDZVT0lab20vcjJxYlNGTzB0MGZxU1kwMnVjMS96a1pKUmNNRGho?=
 =?utf-8?B?WXlJQmQzU3ZZUTJGdzJJWUN1TU1ZUnlYMnVjZUFzMitZR0F4OENCZTBGa0Rp?=
 =?utf-8?B?QmVmcE5GZnFDR1BNSWY3dWh5cWRjNzEwWXlhUzl6UUQ4cTZTMjR1SEpQZ1Jq?=
 =?utf-8?B?bStsV01DV3ZDa2pqVllOV2txWThkMlQzVTV1N1JQMmcrdDFzWUM5M1krNVFp?=
 =?utf-8?B?bmpDU0Y0MHBhNURBMXZIaTFRZWRFaHdFWlFOKzMybkgydkovS1M5Y2N2dFJz?=
 =?utf-8?B?UDRFR0J5TkRQYW5TUFBqcEZ0c3piNUZnZnNMR3VKcWtGa2cxU2o2Wis4M2o2?=
 =?utf-8?B?THJCcVorSnJJRkVNK052R041ZTMyNUk1Q1BZOWFZQUE1ZzdQY0pmY2RXVmtS?=
 =?utf-8?Q?kNF+6ngYPKVSQw7erL+v6t0rM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beef34f6-ffac-414f-6a47-08dc6ba515a6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 19:13:15.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcykQ6TXTTeesezdx93x0V3KgYbic60/eh/DeLsThSx5qOKcWuHZ832ONf4X94Xa+It/Zx2gZQSKK9UcaPR15g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

For integrated graphics, this series mean the unlock of
deeper package-C states. With this, on MTL I'm glad to
see PC-10 even with display enabled (with eDP PSR).

On my DG2 I'm gladly getting the big saves of D3Cold when
display is off/idle. And everything working niftly on
the desktop environment.

But in order to achieve that, we need to relax the runtime
PM protection around VMs and exec_queue, as explained on
each individual patch touching them.

Please let me know your thoughts, specially around those
relaxation cases.

Thanks,
Rodrigo.

Rodrigo Vivi (7):
  drm/xe: Fix xe_pm_runtime_get_if_active return
  drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
  drm/xe: Relax runtime pm protection during execution
  drm/xe: Relax runtime pm protection around VM
  drm/xe: Prepare display for D3Cold
  drm/xe: Stop checking for power_lost on D3Cold
  drm/xe: Enable D3Cold on 'low' VRAM utilization

 drivers/gpu/drm/xe/display/xe_display.c | 10 ++++---
 drivers/gpu/drm/xe/display/xe_display.h |  8 ++---
 drivers/gpu/drm/xe/xe_bo.c              | 17 ++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h    |  3 --
 drivers/gpu/drm/xe/xe_exec_queue.c      | 14 ---------
 drivers/gpu/drm/xe/xe_guc.c             | 27 -----------------
 drivers/gpu/drm/xe/xe_guc.h             |  1 -
 drivers/gpu/drm/xe/xe_guc_submit.c      |  3 ++
 drivers/gpu/drm/xe/xe_pm.c              | 40 +++++++++++++------------
 drivers/gpu/drm/xe/xe_pm.h              |  9 ++----
 drivers/gpu/drm/xe/xe_sched_job.c       | 10 ++-----
 drivers/gpu/drm/xe/xe_vm.c              |  6 ++--
 12 files changed, 58 insertions(+), 90 deletions(-)

-- 
2.44.0

