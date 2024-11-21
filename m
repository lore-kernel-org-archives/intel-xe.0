Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409B8D7879D
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 17:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7F410E9F4;
	Thu, 21 Nov 2024 17:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN3ulYTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA3510E9F4
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732209679; x=1763745679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=athocrjs/9rp18NjCtehcyFWTfbeIRqAjjrIOH4a4ds=;
 b=eN3ulYTpda0v8X4nDcqHHzz3mxKrNcSCx1UYEyZomAzZ8+xbftBwro5a
 MjQYJ9CYMCgl9EXeDxlFbnIsS7AfBe92HDuknhHk1Nz0aq8ydlfemfFP5
 SgxueOi7oJXGmv/A2BptinEAeOwl0w21W4CtHlmChm4mS722u+DHfw6P0
 pqGfPaA/W49q6Dt6QL3XFaVAphvNzCrpOOBb9D5J36jNtDAMFAWWyszjt
 dX7H4bVyLq2JEM4Pn/c5KhfyDZloJ5N7hUBZS4uNgXFyKX72DZmhJ0j3d
 w2U3CglhrN+42Y5YBTu+eYWtcY82Rmz1lGIfBLAD69+HF7WpN6KYYOdEP Q==;
X-CSE-ConnectionGUID: X+BwK449QG6znm7SdOGj2w==
X-CSE-MsgGUID: omvEPjEqQSW9016xzIRf/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32194059"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32194059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:21:19 -0800
X-CSE-ConnectionGUID: lOkBh3iOT1OriWgcXeQA6w==
X-CSE-MsgGUID: 0wMiyMtCTOiiKPGxdcx8Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90479830"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 09:21:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 09:21:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 09:21:18 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 09:21:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuNZSR6eFXbqphkPixg+pu9ntZfOD39uRxuNS4usTvvQTTffwqIroNhFZXuL45kjvIcJe+UyUF7wGLeBUhnbLDS5Qo1SyGHpSW4QJeMRzo7irSvm7h/p2Ry5viqR4lIsapm197sADULP3YfkoR7VRlY/DbHHZnVMIVZInj5lJQhqDgdpXxz66pNXsyNMZmXr6IlGSCG1mUB4/cxhLOlNe6ZhjiY53g6mC83DgBkH85PEnAxEhUoLx70t2ucUUaRmBrkSQ3nLtVd22VlsUqcC6RwfgkFZSejgzNPrB77t5DBhQP81xhpjUkzFpoDxWvQqbcOhD4KLwMjbonP2zqjfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl0oCA5wjflwtwaeGJC3FyZFhcBnljJYdk+6VCzrJWU=;
 b=Z0R3j+WjcrEXWrecd8R5899OG7pg74CV4PtWqm+4Gk8JvUma+AwWYMXGcAcZSKPaYqgDg+1Widm8xGI8NvBPtUj5ltk+1wL02P8HYnJ1524wH6q2Xs+pfBi2Oex9Pif9jEp8W3KXzi0qi4g1EqRyk+8oPb50KFdDbct++MV0eQXCRlXr4PwxFpA0mdItThPwM0bcBkrhgkAulOoA9E4tNJcqE8Pa0wWy55VnL9VL39nL8Z09dXcXcTfpsvPYFuvjARvXV0XkAczew6slAA/Q2NZk+UGQxVt6PSvoQsbn5GH/L1EZvsvv2JJkdEbs7xWqtify7MeqxsSByMSMvbTLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by IA1PR11MB7918.namprd11.prod.outlook.com (2603:10b6:208:3ff::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Thu, 21 Nov
 2024 17:21:15 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524%5]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 17:21:15 +0000
Message-ID: <cb789d6f-dcf0-4077-bc36-e630df0d9913@intel.com>
Date: Thu, 21 Nov 2024 09:21:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-10-daniele.ceraolospurio@intel.com>
 <87iksg29kt.fsf@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <87iksg29kt.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|IA1PR11MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: e85af7db-7cd1-4905-b25c-08dd0a50e73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUxHcE9tcE9xeFJrVktvRG1DOTJkUU9mMkhoQ3dCci9LSTB2SnVPa1R5ZzBt?=
 =?utf-8?B?R2NDOUpQaEVueGd4MkZWN1AzWE83VFArek53MWdua3VhWUpMdWc3N1JnN1lU?=
 =?utf-8?B?OFFNbG9WTFRaOCtsQStQNDlMYVJNQ0xxT3EyakJLMDA2V3kzSk5Qc3piT05D?=
 =?utf-8?B?RTR4UUVzR3pqd0hIcE5kTXRTQm93WlNhemJlR3M4cnc1Z0lidHZQeTRoOWE3?=
 =?utf-8?B?Z2UwQXVZbkUwSTNJdkpNc1lhbEIvd1ZTcXhxcm50V29VZUdVVVpDMDdoYnVp?=
 =?utf-8?B?RFUreUZOSmFDWGt6em9mUDRhNng2cUh0S0xjcU1QZXdEaHQ4dG1sWERKUEd3?=
 =?utf-8?B?R2ZWUnVMNnRZaGc5Q2pwY2lRNEhmVEZDUVRrejNkNWxOMVFTTmY4T211a1ll?=
 =?utf-8?B?V0NlNllTMitQQTYxb2ZNS2JZbGljVGNNc2l6WHVteGpHdE41QkJlWFhrczBv?=
 =?utf-8?B?bmRnOFFjNGZham9UMTFXMkJpUUZpSFR5dzUydmJTYktBZnNadDhVdUROYnNT?=
 =?utf-8?B?TkIxSm04RW1xRE9jK0NQRTFqT1VDUTFRSzJkM0NWamxaQndzQ2xXKzhlaTRG?=
 =?utf-8?B?SFRNdXBxeFNqeTZnUnk5QTFJaStjZmtUdHh4RUYyLzExTElFZzl6TXI4OGxm?=
 =?utf-8?B?NDAxUllpa01lMjU0S0lPQ0l2ZzMxbEtmZzJSc2g3cEU3MUNCemd3SmRhVHpl?=
 =?utf-8?B?eXplMDV4cDJraXVyWnRRdDY1SHc2bVdZVERSdkJleTNHOTRPTXZONGhLUGZC?=
 =?utf-8?B?YzVaeitLeFZoTnNSMnVEUGZpd3RWTnpVY29yL2lNVWs1VzdKcVNOVXdicXk3?=
 =?utf-8?B?M3V2RHJKYlU1MFRrMktVUjNsa0FsV2F4ZUJjYkpzY3ZBbjVRUU1uWW1ZZWRL?=
 =?utf-8?B?TWx1TWcvcXV6RlpveEFPZzlyTE1qRHJjamFTd3M3bVo1SHAxOE9ZVmxKaXVv?=
 =?utf-8?B?Q3p6TUU4RnMxNVZxaGxRT2FrdnVhTmh0Q2x4TzdaZGN4dmY2aVN0YWZGbnE2?=
 =?utf-8?B?bVRaclBCTmJURjFiYkhMV2o0UWlzc2FRQ2ZGUTdFakRmaTBSQzVReHBLTUZ1?=
 =?utf-8?B?ZkZCTEQvemhtdThBcEtwajJTNkt6QWlTK044VEQza0VqTElXTzhTTHdQSWxj?=
 =?utf-8?B?M0l5dUFwdjExZXhDM05SbDhsREdXSm9CK3VrQ0RhN3c5S0tieVFyYzRveDM2?=
 =?utf-8?B?SG9TY2lvbHkrVFFGN3ZJUVE2YXJ5SUtHN2x0c2ZwT0lJaHRteC8wbzdGODJP?=
 =?utf-8?B?RnZxTWx3UjRDVng0WUZKSWhDWHRWeU9GdlMraWswSUhYaUZ1aHVrTk45dXQr?=
 =?utf-8?B?R0FUWXlsWUJGbDNNeDFOSUhPMEZQRXhNdnZJRjFEbXQ2cytON2k5Uldrd21U?=
 =?utf-8?B?L1lnNmVzYktRcEI4NXZxTGxzS2t3eGxzWUFyOVNOdHJuRGFGUFlwcVprT0FU?=
 =?utf-8?B?SjVteTVqQmp5YzNIRCt0RmpCRnBveHFVOG5UZDc5ME5UcWtCNm5yVkxYai9o?=
 =?utf-8?B?dk5TTGpIZGlibTVzbGpPdUFFZ2U3bktIb3VRWnZMWTJlM3UzVW1LdjJZTk9y?=
 =?utf-8?B?eHY1eDVORFhjR29zcmhWcXpsaU1MaWwrNXNtQ3BNRUNNRVBaakRxUWxBVEtr?=
 =?utf-8?B?VGVpWGpjeWd1UDB5bkNZYVNCRHdFRW84cC84b2hIL0UyRXdyeStrOWVGK1dG?=
 =?utf-8?B?N1p1eXZ2NTl6UG1sVTYxbUNFWGVMNWpwTWJzVVRKWEhEcURzazY3NTZSa3Vv?=
 =?utf-8?Q?s1SvzsSq4oEDb0i7V6/2uxQxWzwE0JfBMBuWMe3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3oyU0ZLdkxVN2tpUVJDZ2Vldm1wd3pXcE9Fa0RybUFaZWE1ZitLMDZnejVC?=
 =?utf-8?B?VkUxZ0lseVpRNUVvbkYyVC9tdXQrOFU5Si94YkFiMEtqdHNSOVlVSVEyd1Js?=
 =?utf-8?B?YWNsMHY5MW9TdTF5QnM2Vjk0ZDJIdlhvTWRCTE42bGhGVGpaY01tdmFUbFVk?=
 =?utf-8?B?V2VVdVJuZnoxR3BXRklPUW9tN3dPUTBtNWludDY3SFl6V2NSYnRXK0xReVQ2?=
 =?utf-8?B?Uzl6VmIwN3dKUHdWTGdRNFNjZUswRjFUV3BRQ2x2R3V3YURlUEJmQ0w1WEtx?=
 =?utf-8?B?T3l5Vmd6KzVBcU0zR01HVWkwd0oyMlI4bmJJRncwbS80NldBb2JBKy9qRHo4?=
 =?utf-8?B?b1RxQjFDR080QmZQcEdLWlN6OTBROERGYzM1V3BrMkNuV3dGZW52UE1nUDJz?=
 =?utf-8?B?YytVRFRFU25aV3AzeE9qWmY2WHlqRlUydFpjalhsV3VVYmI0ZkR0U2pmMmhh?=
 =?utf-8?B?NWNRTVc1b0NyMXN0enhpRXN2cllJcTdiK3Q3Q3BZaDd2VnkwL3dpMzNqWnox?=
 =?utf-8?B?bEFoQ3FYRlV2M0JqNlR2QkdSOEFpT0hBdTNlMG53ODVORHl2Q2d3NWZzRUpY?=
 =?utf-8?B?cnVaZG5EK1RZK2hhdFNMVHlDYzlBWUtMMllBcGN6aG5DeWlRQmZYZ0FNMDRx?=
 =?utf-8?B?UEdGVCtWR1FyWFVPUm9jYmwrM1VNSGdGU2xlS1RrS2ZHNjdwblp2R2kvT0tV?=
 =?utf-8?B?RGN4S3BwelRJM2VuNkRSdjhUR0k2S1lPbm9oUERjM1U5VXEvOG5rSlpLUFZM?=
 =?utf-8?B?WkxhSGYxNEx3K2pKa1hqRGs1cVdGeUFNOU1Kc1B3SG1aS1Q0V054SEFkRWpa?=
 =?utf-8?B?YlJYdFNhRzJsN01qenNmUVJ2NUhCUnc4OFpvYVlUYm5Zd09acnh2a2lxb25F?=
 =?utf-8?B?cjRpMkZtWjYyY2FqU1V6c2xaRlRDekpaOVpkMlZhV0NCaVI4NzB1VlJ3WVpz?=
 =?utf-8?B?RU1Yb2xRTE9yUTBlaDZoTFJUTy9GTzZ0cWNLQ2pSeEd3Y1F4NlVJdm5veEda?=
 =?utf-8?B?UnhVQXJxUnVNTHRsbXFJMUZzdENYc04wQjJ5d0RVVktZYzNjOFNNUU5xSXZ1?=
 =?utf-8?B?VFRuTTc5VUorY3dmc080Z25maWFmeFc2Q1FsczBoUXRQTzI2VzduMkZGWS9J?=
 =?utf-8?B?V1RUU2pJYkFkYmVEdXpzNXJOWXhhMzFxTUxqWWI0b0FUTnFEMGNaSnJTYUtD?=
 =?utf-8?B?aUUyL3VRMDhYc0RtbGpDSktIQ25UbVh6dW5DbnVqUjlnMXJtdmJrZnMxZUZl?=
 =?utf-8?B?ZzNOeHV4N2psZjdDT2hBTlZ3Q3VVTmRHTjlaSlpZYm9ZSGVkVkJUSW9PV3oy?=
 =?utf-8?B?aHdzRmhuWlozUUZ6ZGoycUdjcWxheFNQdEd3NTdwK3FFY2pkYllTbjBEQkN6?=
 =?utf-8?B?WVJ2UW1BNTdTUXhCTlpWZlJMc3lxUUVxUUFXUVhJbUpqVmxMeUw5ZlNCYmRU?=
 =?utf-8?B?WGVMUG5sWFNmVnJ3M2lNbHJXWXJhVXZrb25MT3FYRnhYQjludUs0ZGp1a0JK?=
 =?utf-8?B?L1BybEFJNk9SckQ0TlBoQmZvQUhBS1JVKy84WW5qSnhuQlZoSThMUWlvbXZr?=
 =?utf-8?B?R1EzQkFrVFVMNVRLa2J2dG02cEZ3V2VzR1pkU2lPcjA4bklDUkxNZ2pGUGFJ?=
 =?utf-8?B?MVJsdmVycC8vdmRuVkhQVVNheFgvdldYN0hhMlRHKzdMeithdjdZYnZ1bDBj?=
 =?utf-8?B?R3haaElTVDQrSkdIV2RqZHlDUnZpVDk4QWlPbWM2SXVlWkQrRVg1bjI0RXBK?=
 =?utf-8?B?QVQ0Z1NmK0hFT3VyeDFtajhMSnFoN1JEWm9mWDREdGZkbzRIcXcwRkNJQ01i?=
 =?utf-8?B?VnZWbXEyVzVXNGFjSHRVQmRLWjM2allIcTFNbXIzcm0wUkcyYklkT2t5UWZq?=
 =?utf-8?B?cUpkMGcwSGpwRHhjNmNwcW1pT0VsMXNBRTZGU0RHUFhzTzROYXdXMHFsaTNR?=
 =?utf-8?B?QTdheHpZWTNSditXV2RPTXZCclg3cjJ0TVJPSCtsMzhTeDQ5ZmhSRzZRNGo1?=
 =?utf-8?B?M3k2THJXZHNKbVBoandCM0VEaE5JTXh2ZXRPL1ZRWmJIUDZvNXpkMFpRV2lV?=
 =?utf-8?B?Z0J2TzZtMnlEZzBMMmF5UVJvMGkzQVFncS9YUmY3bG8xR0RBWVIrQlU4WjRh?=
 =?utf-8?B?SlNZTkNkSHN4cFVCWnVCOU5PVHY1b0RrV29NUDFtNjVBUWlTYjljSUFSMXps?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e85af7db-7cd1-4905-b25c-08dd0a50e73f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:21:15.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cv5xMpqDfOJ0lNkQihO3XUJHV8gYBa9Q6AhJ8MQbzxJ/hISuQ9vOXLvIQ9dkwBZKdZsHEQHXkpONNXZOBwIwrg/eKqLWQxfnpsFifa33thw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7918
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




On 11/21/2024 1:57 AM, Jani Nikula wrote:
> On Wed, 20 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>> index 419e8e926f00..533bc82255b6 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>> @@ -9,6 +9,9 @@
>>   #include <linux/errno.h>
>>   #include <linux/types.h>
>>   
>> +#include "xe_bo.h"
>> +#include "xe_pxp.h"
>> +
> Can't have this. This will include xe_bo.h and xe_pxp.h from i915
> display.
>
> Basically you can't use gem_to_xe_bo() in static inlines in headers that
> get included to i915 display. It all needs to stay opaque.

Why would this be included to i915 display? This is the copy of the 
header used for building the display code with Xe, i915 should use it's 
own copy (i915/pxp/intel_pxp.h). Several other headers in the 
compat-i915-headers subfolder include Xe headers. Or is the problem 
specifically with the BO part of it? Because I can move the code to 
xe_pxp.c, but I'd still have to include at least xe_pxp.h.

Daniele

>
> BR,
> Jani.
>
>>   struct drm_gem_object;
>>   struct xe_pxp;
>>   
>> @@ -16,7 +19,15 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>>   				      struct drm_gem_object *obj,
>>   				      bool assign)
>>   {
>> -	return -ENODEV;
>> +	/*
>> +	 * The assign variable is used in i915 to assign the key to the BO at
>> +	 * first submission time. In Xe the key is instead assigned at BO
>> +	 * creation time, so the assign variable must always be false.
>> +	 */
>> +	if (assign)
>> +		return -EINVAL;
>> +
>> +	return xe_pxp_key_check(pxp, gem_to_xe_bo(obj));
>>   }
>>   
>>   #endif

