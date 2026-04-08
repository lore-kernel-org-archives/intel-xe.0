Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8F61073CBA
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 13:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA2E10E66F;
	Wed,  8 Apr 2026 13:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zxo1QnRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B363710E67C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775656457; x=1807192457;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d9qgyh903NYTRi3/ia4ZuMt4H8DSmiNqPS6pYpr4HD0=;
 b=Zxo1QnRjhtgpEFKUPM0eqerpqglhdCwSdF9PbLhM+IQNJ0dWSZsZ3JC3
 ReGx/az/tkoSKkTeXueNmCTOy47tnPm65lZGUNqTuRUEq0h2Y5/y/b3Jp
 yP7YLrSdputk3J++3fbXT7xEjETPrr/4QQUKqtmDnPlO9kIYG5WASa+es
 Ku+mRJbMNI9QUR7dQSYR73c7q6tjWqJlHHYKQ+MNUJXVK1XgjJVHF5y0F
 LWnjqv915PGCKhbXuLm5kvPvytppQvQ2mx0qzyy22U49hvdiwRN63EFm8
 zWEaEZL86icDUnkGEzuhRVaq1sHjQrPM3KXDiqyE240EsOD2f0RXXThfK A==;
X-CSE-ConnectionGUID: 6nCMQ61WSAeZSCO9vlyq8w==
X-CSE-MsgGUID: KOzN4a4/TX+raxppk3vQfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80235064"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="80235064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:54:17 -0700
X-CSE-ConnectionGUID: oQ8PXbG6QGKU4Rh3tSxc1w==
X-CSE-MsgGUID: H7qNVmyuQ9SC85GJAONaSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="233349624"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:54:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 06:54:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 8 Apr 2026 06:54:15 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 8 Apr 2026 06:54:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9/C8XvSGfn4vxBNIrLL+H/t4Ka19duqpar7YLL3LMPVsRZQO4wojdxK4Owir+uv7waaTq2ccHXtCn23PeM86QqvguCPDyvShgG8VtMoyeND5FoyTgRm+1RUzjMVkcjJIZIIdg+BLEgYWvDXbM/W+ziUBBl8uHX6DlIQlt9AgUKvzTYsfpDm8yGw2npdxg6Zq871JWYJSn/RjfJtANl7z51sdqFIPcK0cn2aoFIfvHjwPJIeeNFk+s0aEovyzZCtTBonjfkVbSbCix565NdnSB8y/eXhC6liMgpGaH0Zd+9ND5JPJs+dBO/dQGxb3QrFWZ7HrdB6521lgbuFsxZygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V2AR2jA2DgX4ZbDix3oiQM2AU5/tRsI7CIInCf6rwg=;
 b=IXwh1u7QxR4PSIqnTVYG91t6NCDd5HA2DV0HS+kbLESyFkodPNFQFnxMpjshzpnR3aDtZVDsJBpgLKYgFHr0ZUHHqv4TrrpdLKlb/i5ndtbG0CiDHilgyY7xxOmB9SMIIXm5lVpM3eCja2iNRL9T+UKu1+T/OF7hegnwc9OSFxnJ851o5Grsa/mrXgK8nBGzSTFB0hT2Yt/AvkUuJsd1VanpbdzHz6HSLgzwNU5EOPPWow0HxtJElBeav1tIIVo9dJyP8eiQrtn2UJMr4Uvsy5dOAXdE9JsQSKoLwmBkDoOvrZLloPuUjkQ1LseUHTNNZpzlgHJsS0eKjE/CKOpAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB4933.namprd11.prod.outlook.com (2603:10b6:510:33::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 13:54:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 13:54:12 +0000
Message-ID: <4d27ebeb-c27e-4253-8799-f939754d047b@intel.com>
Date: Wed, 8 Apr 2026 15:54:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260403204433.5765-1-michal.wajdeczko@intel.com>
 <6b5850d5-879f-4ea0-ad29-63ef0d8474d1@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <6b5850d5-879f-4ea0-ad29-63ef0d8474d1@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF00000131.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8b0) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB4933:EE_
X-MS-Office365-Filtering-Correlation-Id: a78f810f-1e08-41ca-fd3e-08de957650a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: qpgX+BAhvIx4mMf2FM4fVurb6RJtt6HtgXVd3w0WvXNc6YSFKfDBncvZV61sI4SlngjdlrVDUYAOtE3fw86ecW4GtDY1ss7SeGZ7fibICysVf0F2CX09tRzsEi8A6WVTU/rYw7SxHpjzD3UhbKbZpfWHyE510g5DGVHkpz4MTBUhb31rRXDSiwvkgrIErVWNTIsSb21Iwj0wNM06+UpYdHy93hGhzhv99h665pCj7be0Lpq9Khg9e7UrvRRqUaFmq19/MOrPN65vkOufkpT0ZWQnejmbNndJn+DsFOCyFTrerG4ZJFKll7EhTlTllMogcug+2NhLnpxBO5UzA1WxH7Riw7oSukqwKeKLfdFc87LSdpquDeodjvdGy1KY2Ly0+VSiYPgSKMPtUQrR98NDn6SI6DiMXL8krUQjUW99Dpi9aZgI5jfgihTir/9mfb+z+fBSRBr4VzJnxInNkKdGk+XIk0SPE2Y1EuRfKHucV8MlhAMVPNUBuMGIGGD9faGCcvu9R0Sc80DyhUUqkaX88FunBv0lcW8MsisbTqPEHfO9HaEDePL1KcdcJUXKA8KKujaYRZhizlbLTJgkZvEeVJjgo38SB4Fws+a5j5+3pVcdbS+j7wLvqkkRf5dTaBdbmJljHGOzBO0VS7x+Er4Z+TrpWHmM9sArOCude9KymzG27CgCIUhoPOPqRzswDaon
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0FSNEtOSEZIV0pSSXVQZE9YWWEyN2VkTWV3TjAxeU9EazhhUlIyWnRqWmMx?=
 =?utf-8?B?L3JlSU5KVFM3VlBwNnRqdml2d1MvZ2hmQjNLSnlGMnJRZlNLWWc2OHhrM3lW?=
 =?utf-8?B?YUExV3RubkY5VDg4d3AvQVhDd0ZHdEtBRk1GazM1bFFMaklyRlUySUZ6d2tP?=
 =?utf-8?B?YzlhbnFXcU9oTkRJOTRmbjFIT0tVYzMvYVhCN3dSTHB3ektYK2xXUFJ2YTJp?=
 =?utf-8?B?S1EydzFZc0VjMXNyd0JrTW1Jbi9GN1dsVjBYbmlxdmFuSWgzT2RuUUVkWjJV?=
 =?utf-8?B?RTlJVG1jdnpGOERpdzhKR2drRit6TElKdStZaGNXVFBIWlVsYnVQNTNmU291?=
 =?utf-8?B?dkVpMVJ0TndzL29HYWtFK2xRbXNhVU9HTE5GT0IvV1NSek4zRlVHVi9ZZFpQ?=
 =?utf-8?B?WFF6ZWpVcHNqd2kxMmY4ckFZSmtYUyt5c2hzKzR2dTBQeUhZRWFpS0dFQTRH?=
 =?utf-8?B?KzVvNjJrZ1V6WSs3ZG83ZzdKbU9nRDgvNmZiZ3J3YTJQRkh1VUZuSEJpdTBW?=
 =?utf-8?B?b0NNUXhxK0xEUUR0OXluWENEbVpidEFtSW1vS3lIMFkwNHFBbEZicVNYZnBq?=
 =?utf-8?B?Nm8ydm9odUV1bCtEdkdYYTVPQW5RR3A2MnNiekNLdDFFb3JuZlE0UUZOdGQ5?=
 =?utf-8?B?K0hUTWI4aHJvcmNKWGVKQXN6UkdoYUppS3RNTFlqZFRDTW9sSXhUdXNqSlJJ?=
 =?utf-8?B?YkM2alFneTBiM1lCSE1CYTd0WGsvRDVHcncrWGt6TlFHWXFuUmdGZ3hGUXZ2?=
 =?utf-8?B?eUZ3bDUxOFp0S1dKNzY0b040cUh6WWplMkozWURtaHpNYlNTL2QxR1BocTRy?=
 =?utf-8?B?RFJBL1RNR2Q5Zmt5b0NQcG5GR24rSlRsSzNaWHBtM2s0L0thdkg3OFBaMkVh?=
 =?utf-8?B?ZTZzTkVoRlpnWXRtVzlmN3JOUEtPWnBBcXNYTm8ydSt4b0ZubFMzZGZLUCs3?=
 =?utf-8?B?OHhVaHZUbEtzL2YzMUdPRlVpZnp3UFlRcnRpNHJIcG1TTUh0TzlPcHRta3hh?=
 =?utf-8?B?TjZWWjdQd09zZXFkZFJwcW9Qbk9xKzlQbmpMcXFubVpjRGtaQmloOW1PcXQv?=
 =?utf-8?B?bWhVcHdiRlk1VytoeVZxcTBpbk1NSFVNV0kvMS9tTHByZWY4N0xMbklHakFs?=
 =?utf-8?B?SEhUT0FBQ1ZoWjB3dWRXeEZoTVZCYzNwTUJqVEN6MWZVQkN5TWZBczVFNWRs?=
 =?utf-8?B?akZxM1RXdk4wVFZrWXZzaDZYd2VnSVo2cWx1S1d6K09aZkN2eTVOZ1k4cTYx?=
 =?utf-8?B?VjF1VkMzUGFzT2pYNDFHdzNRZjRxNXNKbDlqdlYrTUVXVVhRTnU4TTJVSkxE?=
 =?utf-8?B?S01xbUREUXZSakRBNGd5eWtqcUtWb2ptZ3hwYU9WQXFDN2FPSTQzQm9lcVMx?=
 =?utf-8?B?Z3REQWNwMmJzMmRRbnRqNlQ2WDI1ei80aGxoNjc5NkJha1FSZjdmc2Y3UFc4?=
 =?utf-8?B?VU1wcnlSdmN4NEZRdTh4ZVhuR2Z2bVpFQ1BkWm40R1FNVFJxbHk4bm0rT3RQ?=
 =?utf-8?B?djlDb2hEcFNQNkJpVE0wdC9wV1ErU2dhUjl5bngrdmVlSXlYSE5hWVArb0l6?=
 =?utf-8?B?NEhKdDlCeXN1YnZpRWhrUE9aNm1DRHRVM1gwb3VXWlIrbkxDSjBFNGt0RWxl?=
 =?utf-8?B?WUJ1U3RrNnlvT1l2MVpaMWpFVzZTeGIyTUJMbHYzdWpMM00wQjJ2SGFZNnVR?=
 =?utf-8?B?aFFnS1R0c202NWdlZ1VIaDFya2tlbGN2ZldiTWlMWTl1SS9LQk1kVm9qRTNQ?=
 =?utf-8?B?OGVEenoyVzVqZkVFRStxdm50VVZ1TWMxUitPUENud3JZbmFpR1g3L3Q5S0Zi?=
 =?utf-8?B?dHRtRkVpbUZZM004OHpkU2x1SjNIUjBOcUJOZThwb0xNWVBqd3VqZ2RzZmpB?=
 =?utf-8?B?bWZrc2ZhOVhqQkZuelFOQjhaL2lxeW93VG9wQW1qazM1U1BRT0ZxUWp1Q2NM?=
 =?utf-8?B?Y2lKTlB0cGxxMU1ZUngwZDk3UGJ4SCs0V3hxeExyQ21EaXpVRnpya3lQRlF5?=
 =?utf-8?B?WVNlSGR6NmhEbnlhMmZhRnFXTmlCN3JOVkFITENRbnR5M1BkTERlYmpWbHRN?=
 =?utf-8?B?eDRYWk55ekl6eEdaT1lUM2ZLWGN4NHVMbDNtMnJqNk5UNWwzbU82eXNlcjlq?=
 =?utf-8?B?NDZFUm4xcWZ3L2xZenQzRmZoZStycWZBS0ZIZkNDc0ZHQWhiTmEvQk1WRjNP?=
 =?utf-8?B?NFNEWDVBOFY4YzFhQTZpcmVLRUptbHdHRzRIeFdVcEtrRzRvL0lUYTZwazdG?=
 =?utf-8?B?WkRqV2NOdTB5eThLaURxOVIzbGltUWZ1YUhXS0I5Q2MxdzJsRjBtRDFRaU04?=
 =?utf-8?B?R2J2aEdKblRJdzhQa3BYQy85ZkpCZ1BtcFhBdmd5UnhiM3h4Z083UUZrYkY1?=
 =?utf-8?Q?7E6WXPe3WnWILidg=3D?=
X-Exchange-RoutingPolicyChecked: DDOo6BCbgqBEh12eo4jzPe8FDU0YhOFwZliWWVy83wlK3Fwx1pQ0qOnxVI6uz+QCln7uXloHIpM7YjQimW5qGsDw0KczbaqIXyTNQjlmuep1WzGusbrtuiq1x8IcYB1bPxJLWc8JTQMcVVY3xL+6tcVgPtJC7Bsto4OTWQ0zWdTq1P3JXqLXmzcmvpVViZLAMaovBs4uSXP3YaznQ6enlu6jHcTz/9Mo2KTFZ95wCnr4KAb+WAY6dxys7T1tL9tq4AepViRht4MjQrfI9Gram0mZQqO7dKG54Nx2J8E6CiaZGbGvpKV5ieLGymFAEXzBMuMdzSnTXXmeWCa8TRjUgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a78f810f-1e08-41ca-fd3e-08de957650a9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 13:54:12.7522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7pPPrgMcvqMve+xK6toHxSyurLx613TZI5Hrwn9E8mm579ChODPwcJ1E/SI5jc+xA9cEZR9FfisN/9BBXK6HAAr0HO9+EF1gtN+BaMMXnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4933
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



On 4/8/2026 12:18 AM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 4/3/2026 1:44 PM, Michal Wajdeczko wrote:
>> We only have support for G2H NO_RESPONSE_BUSY messages over MMIO,
>> but it turned out that GuC also uses that type of messages in CTB.
>>
>> The following error was recently observed on BMG after adding VGT
>> policy updates to the GT restart sequence:
>>
>>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: G2H channel broken on read, type=3, reset required
>>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: CT dequeue failed: -95
>>   ...
>>   [] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: Timed out wait for G2H, fence 21965, action 5502, done no
>>   [] xe 0000:03:00.0: [drm] PF: Tile0: GT1: Failed to push 1 policy KLV (-ETIME)
>>   [] xe 0000:03:00.0: [drm] Tile0: GT1: { key 0x8004 : no value } # engine_group_config
>>
>> where type=3 was this unrecognized NO_RESPONSE_BUSY message.
>>
>> Note that GuC might send the real RESPONSE message right after
>> the BUSY message, so we must be prepared to update our g2h_fence
>> data twice before sender actually wakes up and clears the flags.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Link: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164119v2/shard-bmg-9/igt@xe_exec_reset@gt-reset.html
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 29 +++++++++++++++++++++++++++--
>>   1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index a11cff7a20be..19305acb98e4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -186,6 +186,7 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
>>   struct g2h_fence {
>>       u32 *response_buffer;
>>       u32 seqno;
>> +    /* fields below this point are setup based on the response */
>>       u32 response_data;
>>       u16 response_len;
>>       u16 error;
>> @@ -193,6 +194,7 @@ struct g2h_fence {
>>       u16 reason;
>>       bool cancel;
>>       bool retry;
>> +    bool wait;
>>       bool fail;
>>       bool done;
>>   };
>> @@ -204,6 +206,11 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>       g2h_fence->seqno = ~0x0;
>>   }
>>   +static void g2h_fence_void(struct g2h_fence *g2h_fence)
> 
> I'm not convinced that g2h_fence_void is the correct function name here. Maybe g2h_fence_clear_response or something like that?

hmm, the 'g2h_fence' name itself is IMO also little questionable ;)

note that everything in this struct is 'response' related, so that
'response' in clear_response() may also sound redundant or at least
mislead about impact of the clear

being non-native, below 'void' meanings were working for me:

	"(verb) to remove the legal force from an agreement or contract
	"(verb) discharge or drain away (water, gases, etc.)

but if clear_response() is more welcomed, I can respin the patch

other candidates to consider:

	g2h_fence_reinit()
	g2h_fence_reset()
	g2h_fence_prepare()
	g2h_fence_empty()

> 
>> +{
>> +    memset_after(g2h_fence, 0, seqno);
>> +}
>> +
>>   static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
>>   {
>>       g2h_fence->cancel = true;
>> @@ -1331,6 +1338,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>       /* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
>>        * and g2h_fence_cancel.
>>        */
>> +wait_again:
>>       ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
>>       if (!ret) {
>>           LNL_FLUSH_WORK(&ct->g2h_worker);
>> @@ -1356,6 +1364,12 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>           return -ETIME;
>>       }
>>   +    if (g2h_fence.wait) {
>> +        xe_gt_dbg(gt, "H2G action %#x busy...\n", action[0]);
>> +        g2h_fence_void(&g2h_fence);
>> +        mutex_unlock(&ct->lock);
>> +        goto wait_again;
>> +    }
>>       if (g2h_fence.retry) {
>>           xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
>>                 action[0], g2h_fence.reason);
>> @@ -1508,7 +1522,12 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>           return -EPROTO;
>>       }
>>   -    g2h_fence = xa_erase(&ct->fence_lookup, fence);
>> +    /* don't erase as we still expect a final response with the same fence */
>> +    if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY)
>> +        g2h_fence = xa_load(&ct->fence_lookup, fence);
>> +    else
>> +        g2h_fence = xa_erase(&ct->fence_lookup, fence);
>> +
>>       if (unlikely(!g2h_fence)) {
> 
> if we hit this error with a NO_RESPONSE_BUSY we'll release the memory with the fence still in the xa, which seems wrong.

but NULL here would mean that the fence wasn't in the xa already

it had to be either removed during earlier processing of some other
non-BUSY G2H message with the same fence or it was removed by the
caller due to a timeout or ... the incoming fence is completely unexpected

and IMO we are not quite good in handling this last case and after
xe_gt_warn() we might release space that was never reserved by us

but that's not related to this patch

> 
>>           /* Don't tear down channel, as send could've timed out */
>>           /* CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN); */
>> @@ -1518,6 +1537,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>       }
>>         xe_gt_assert(gt, fence == g2h_fence->seqno);
>> +    g2h_fence_void(g2h_fence);
> 
> Is this here because we might be parsing the G2H with the actual response before the waiter has had time to process the initial BUSY response? It might be worth adding a comment to explain that.

yes, and it's already mentioned in the commit message:

" Note that GuC might send the real RESPONSE message right after
" the BUSY message, so we must be prepared to update our g2h_fence
" data twice before sender actually wakes up and clears the flags.


> 
> Daniele
> 
>>         if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>>           g2h_fence->fail = true;
>> @@ -1526,6 +1546,9 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>       } else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>>           g2h_fence->retry = true;
>>           g2h_fence->reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, hxg[0]);
>> +    } else if (type == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>> +        g2h_fence->wait = true;
>> +        g2h_fence->reason = FIELD_GET(GUC_HXG_BUSY_MSG_0_COUNTER, hxg[0]);
>>       } else if (g2h_fence->response_buffer) {
>>           g2h_fence->response_len = hxg_len;
>>           memcpy(g2h_fence->response_buffer, hxg, hxg_len * sizeof(u32));
>> @@ -1533,7 +1556,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>           g2h_fence->response_data = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, hxg[0]);
>>       }
>>   -    g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>> +    if (!g2h_fence->wait)
>> +        g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>>         /* WRITE_ONCE pairs with READ_ONCEs in guc_ct_send_recv. */
>>       WRITE_ONCE(g2h_fence->done, true);
>> @@ -1570,6 +1594,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>       case GUC_HXG_TYPE_RESPONSE_SUCCESS:
>>       case GUC_HXG_TYPE_RESPONSE_FAILURE:
>>       case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
>> +    case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
>>           ret = parse_g2h_response(ct, msg, len);
>>           break;
>>       default:
> 

