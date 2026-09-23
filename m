Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3537C98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F7C10E734;
	Wed, 23 Sep 2026 18:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHo3yOJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD8E10E734
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790188664; x=1821724664;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Msi8ipeg/OdccCQQhVkLjZdmkS2aphxVTgdCYjoWFE=;
 b=RHo3yOJvknyqGY1ySHfGfyNUpK3uB87F7wcuDTeVaNJdXnPPiVyzERAo
 3n+cUpomivih4PftTsQQxN5rvwHljU7WvU+/SFvKmYDikRVFQkrxQyS21
 Y9IvWCJzmmmnUfkQe8vrg9SyPHQdPaeNJPF3B2FwWXJDXKJZllAFE+5jP
 hmtlZxAizn+cAK44qpVgCjBubW6uM62aTbc5RdCPzx08Ugnuw+oYnpWOr
 x+zdNY/5ql0bSoOzcs8fsNuvbfjhuDtyOvjGV5GQCNE6ji0V2CAjFBlSh
 wv5rM/jBTquUHFD4ryPsJo3G7En0NgdwLD2F1BJmxTP4uz5t8U/z9gWeH w==;
X-CSE-ConnectionGUID: ljUW2YvmRzWAp533G5VSHw==
X-CSE-MsgGUID: bQVptUReToKLuNzjZ4mrvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116441657"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="116441657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 11:37:40 -0700
X-CSE-ConnectionGUID: kA7+hsfFTxyAvoHkpDZYYQ==
X-CSE-MsgGUID: /zHSrlsWSlWXLHm4+xvMFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="299997581"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 11:37:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 11:37:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 11:37:39 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 11:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOvhrC2QUoeHV+NjYzA0q34bny6CpNe/KnWN1faIvCVs/K4jSiIbEdGNUQoqs0ug6yFWM+9HkmlULU1BLAfLqkV7Y66TUTaC+QOVEb5ryFgsqQ/Lea9rK0BCMEHT1wfbQjSfgaWcwHXBaYpH7+vDeKL4JLIYLoFf8fxhlDQCobsE2k/iXfydHBi4yhjjN1sujbcBGF5GVvjsEc7E6tUDirJF/M1E1F0Ksm7Mz7+TcuZRBV3XxFOpKsoE8hZ9ULTDd6WRsEV6549isPK4nDwmRcHc7cn82d7k5Ajpm8SwOfJvPR5MItN9JZuKK4SDyLrx0xmKL545/v4ew8RlvcaQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps7fW3jUDchxkriVPd4q1yBpLerCPjwKVcvpgDKVioE=;
 b=bMpO/7rBbvZKEO9tSQmxwqGyyVfNgIAI3NoRYBc2LN7JmOzY3dngRAFZ2o/XWMrjM16zyZFa3Scz1Z5IZAjzoEMryNKnHLuOj0YdBsDN2DTnjIEGorFVFSgSpLa/wjQ5rIwrDNqfnJMokUdze9wFYypitcFlRMXGspQdCaxYy9nG5xuYmSP4DhTMEpb3gVOYOGWMPFgcjRyFxMTpoaKv/TI0B/WxHEZk5U/03Ksdnr4/5xAXMXj7kXC0Gxywa4sfXGMdDqaS3QbmQnOTBBt5BO8VgowX5t8ms17bfuZ/aa04ULsxgd7OZ8kihKnN/WmHFF0kiPw27+cVs7CO/RPyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:37:37 +0000
Received: from BL1PR11MB5254.namprd11.prod.outlook.com
 ([fe80::9b2a:1f7b:b728:d0af]) by BL1PR11MB5254.namprd11.prod.outlook.com
 ([fe80::9b2a:1f7b:b728:d0af%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:37:36 +0000
Message-ID: <c534201a-a7f3-45a5-ad07-8152cb682e7d@intel.com>
Date: Thu, 24 Sep 2026 00:07:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/xe/hwmon: Disable memory controller and PCIe
 temperatures on CRI
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-6-karthik.poosa@intel.com>
 <aq0Qd86expZdQ39C@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aq0Qd86expZdQ39C@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::8) To BL1PR11MB5254.namprd11.prod.outlook.com
 (2603:10b6:208:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5254:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: e19e4622-c91f-4180-3695-08df19a1bc85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jKDMZdzlS1+DZc/45vRGDOvyC9aZ74AZEul7fCcGnAIvnN56jGEZPeAdbLRTViUlHwjet1zCft0JUPc642XH/WdP1HORsZFcQy5NZyLc8pqqKcQ7Zk54JRcynUC45bbDr5wONKwn7SXDxQpM+mINRTYLjVaR/vG7WoIPA1jd19a+uxJ1zZc99EXbZRPeDE20XJSCW7KSB7sQPw+d06N5zNPM44E0eLqsQVkZv4MXEPCKLtrpcmOsoGoZhhYPXw5Ersi2Ti7YUANmEztvZvOHTDae5sfx/qAu9KF4t0H/O0FJifaFpR1Oa06Izp9MUgXYTxc6fVoHj2O5x+BFv9M/922XuMGnJ5HNCE+K28edMj43uJn/yBbahNh5TSI1CpIRA9S+6FniU1dwVua6AYWYssAcgWlB6POmm/tc4rOeb6E4mcuckYEVhFrvBz4xXfRNVYf+6zZzcqoL0wGbhYFl0u/hTq306hbsJ2fyDGsrhsUl2GbBEI944MFKqMs8Hje4fZcOG94WXy5B+h0ndb2NDnKB2Om+dWbgQZ1PtewqnlCjfGZEWksjFOWdV5MdgkORgFioOePe5gdaoogdhvY4IH6B2ZQYEr2ebDCy1rZ21A+VRB5FxRTSvXRvrQzAwcN8Z7+5LKO1cLTTZfMFQ4dlS5cWjdLaOp0rslu9Lb/Zo0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUdhQTRQdDV2Y05MV3JUeXQ2NDVjQjdQNlZEVm9SMnBnMHd4TU5HQ29kQjZ6?=
 =?utf-8?B?S282R3g3UlNHdG56VDRvQklGWVJZaGpEZmRNUlk0b1U4TmJKZHFRaisvT3Y3?=
 =?utf-8?B?QlZ1R0xIWDRJSHNpQjdQK0Y1eFB3b2ZMcmh3Ym5yTjZway9laHNUTVJYTVhJ?=
 =?utf-8?B?enNTV0llbU9ZQ2VTS0NOTzB5VkVCam40N3hWNFhQYWVWN3VhTjRFNnhQclZ1?=
 =?utf-8?B?citiRUM4Zmh6UEVYdDlJd1NIZUxyZE1RZ1FWUllLczdNRHo2WnZjUzlaT3I3?=
 =?utf-8?B?Y01aSm9jSFVsb1d2Q010YTJTcytYOFVZK0t3THNzd2ZGNHVjcjN0SWV1WWJw?=
 =?utf-8?B?WkpSc1JMR3lxdnppVHpmWW5oWFhBeGl5N0Q2b2NwUzFhYTBzT0o1c2VVS0VU?=
 =?utf-8?B?QlYza3FDY2V6blJyNFNIRy9CR1ZsN2l4VEVxVzh2ZmF6b2FDenpqZExmR3lj?=
 =?utf-8?B?OWxrcE53SWVhSHV5RVRvdXpnNmlCL3VTSGV1SHNBdU85aE9DZEIyLy9tKzZi?=
 =?utf-8?B?WlJWWHczVTFFVnNyQzBKcndNR01lbFVpb1VWU0EybVpudThPMzYySExXVy82?=
 =?utf-8?B?Uys4amFKRTFzd2d6WmZvNVBIWkU5TzN2azdpR3JNa1JWMG1YcmVOaDhwTytR?=
 =?utf-8?B?SGtySkgwc3g3bzFjbVNGQ1ljUlZ0eUhJVUhDMy9ENDlXeUx3QzZxekM0TENq?=
 =?utf-8?B?cDE0TU9POSt6MjB3dTRxa21RSkh3VkJiOENiK0lra3dTUDdWOEExQllTejdx?=
 =?utf-8?B?cGpyRzIrOHNpdWs4eFFpeGV0RDlYbWgrRG5WM2l0cHhjWk8vZytpMTNqdHEw?=
 =?utf-8?B?RnpzSzNkakx2OWZMVGU1bFBwSlgvV3JpNkxaYTl3YUg0QzhjVGRyZEJxamY4?=
 =?utf-8?B?L1p4UDVHSGpKb2RDeExoUmFKK3o1VVBOY2VvNUhDUGJNQy9hb0hDdHlmdFFx?=
 =?utf-8?B?TUFYbFNTd2x2VXgyZHkwQWEwMXFsTnVHbWlGK1cyREhHdmc4MWwrYVBvZjFS?=
 =?utf-8?B?TS9xTFJGS1BKL1dhNTA5WGhJajRyY25tbVlyME9GcmszMWxYc0dSQmR1ZFVH?=
 =?utf-8?B?cndFTkFsaWFweHhZeUZzWW51dHd4VUFDSFJaQkVoR0lyQmIxQlgxdzV3a0Q1?=
 =?utf-8?B?dlRFdklpdjc1a0FZaVlOR2dJTTA2alY0QUhyVnExMzNTc0N6amNBRTI3S1BN?=
 =?utf-8?B?cWhrVWU4RU05bEJaNkVRVlRQTXA5azVsMThsR05OSHExYjRGb2U5aTZpVkJz?=
 =?utf-8?B?bGhVM09DdEFvYXJjMS9KK0hjQTkwQW9SK21WK0lRdjVmUmtkN21UQ3A0MDBW?=
 =?utf-8?B?L3BWRGo5eGQ1QmJBbUkxYmluQmFSMGlpbHZNNS8xZHZiS2NYSWw5RG5RcytC?=
 =?utf-8?B?YkdUTGxDemFCYTdTUlFRWVFNajR1SnBjckd0Y1FxSmVUTXkwR01tYmhkNEUy?=
 =?utf-8?B?WHFGTGxhM0w2UWtocUVBOUFEN2ZxWmZuTjQ0WFlUbFRGcnl2V1Q5ekpLcUd1?=
 =?utf-8?B?cDVoKzZJcVU2M3EvcTBvUmlFK1JwQWllOW0vR0lsUlM2SUhkSTZ6VFczZ3Bu?=
 =?utf-8?B?QnNQMkxBRDFUWWIzY1Z3Ym05Tjh1cWRCUG91MmRzS3dubzFRK2lSbmFnaFdO?=
 =?utf-8?B?QkJ1RGNQQXZtSTdHZllaL1FpeU5XZ1prU0VUUlN5dU5ocWRGelEwZC9xLzVQ?=
 =?utf-8?B?cVorSnpQSVlMUWxpNStjYld4Rm5TeGVPQ2M2RFhEeHdpUW5iVy90Ry9FNXVM?=
 =?utf-8?B?eXRQMDlSRTRReGJ0cDNFRWdCMVpic2R0cFVERGlhMmZRbG5UeXJpREZWYVk1?=
 =?utf-8?B?azJIeTNodDFDaUFzb1g0U08zbEtNUEowSndibGhzUlczYXlScGt4Q0ZSN3BJ?=
 =?utf-8?B?NjI0N2xTcmMxTm9rVllLT2cxNC9nU2NHMTRnMEpzdDRrd3RvRk9kTWwrN0cz?=
 =?utf-8?B?dWtmNGRUSnU2YjdqQjliWkRaOUtHMmdTK21zQ0p6ZVkwc3BGM2NOMisyNFRk?=
 =?utf-8?B?K2t2QW9JUFBPWVFpN3JaaTFaeTJTSFpZUy9CTXkvOHdvZHhaTEZCMGhsckQv?=
 =?utf-8?B?bXdZYitlQmJsemtsV0F2WUpqeThxc2lqS3ZsMHBndCtUTG5ZbkNUT1h6YlVq?=
 =?utf-8?B?dVA0dmpZNHh4RCtkcU91WEI3NlhhcFBEc3B4aXBnOXVmb2hWYWFicExHaTVS?=
 =?utf-8?B?THU0d25OSVducngybm9RbmplZ01HSmZCNUcyZGZpVU1zMmVHbGZNd21oaTN3?=
 =?utf-8?B?dXZ1alBtcHdHVnp5OWlOUXNsdWNoU1MzWk9QTlRmSHo0TlZtajF3YU9aUk1O?=
 =?utf-8?B?ODVtaTcxZUVmYjZwdjhtUURsR3FSUmJoMC9kQ2RWaXZ2MVhVNmd1dz09?=
X-Exchange-RoutingPolicyChecked: q9Rsq/PJIrQL5b2SRV8N1BUCTlPlf2tSBQT1MeGW1crNPbL4ikvnVbahl4tT7n58/q8oNih/VGoMojk0B7cEyc+p+kbUo53vqi+E7voEMJ0fOP51WV/AZ+QNRlypzsYpWGQS/DM84ik3hcmzhSGYxzz6KGGwrVUxVkhqYASb0+WNcPUQqZfEI+S5b8+791sU0lT5JvLx3jc2E1GRQWWNPad8j3bK/vPWRstDx5LbFqzwG0A9dnPK9ieZeaaGf6kq+WTkh01gZed7KFATnVQPnMttUEaseQUfhsESU6gJJFePho7BQHRJmJj/O4B3CQ1htfDUvNjKQZ93rUlLSNHs/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: e19e4622-c91f-4180-3695-08df19a1bc85
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:37:36.7467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyK9OJT99Hyz628MakAfsoNvbNPKPrRSrBGLA37u291sluwfkwwZy4oY4uoiU2olbJkJMuOHVLeo86+jKILSow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
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


On 18-09-2026 15:50, Rodrigo Vivi wrote:
> On Thu, Sep 10, 2026 at 11:57:56PM +0530, Karthik Poosa wrote:
>> Temporarily disable memory controller and PCIe temperature reporting on
>> CRI platforms.
>>   
>> The definitions and interpretation of these temperature sources are not
>> yet sufficiently clear, which may result in inaccurate reporting.
>> Disable them until the hardware interface and corresponding definitions
>> are fully validated.
> I'm wondering if perhaps some has_ flag should be more appropriate,
> but we would also need to think a way that we don't explode that...
>
> so, for now let's move with this
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

We can omit this.We have got offsets of memory controller and pcie 
sensors mailbox offsets on CRI from HW team.
I shall raise patch for it.

>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index e4a210916df2..669bbfe18cea 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -1094,8 +1094,14 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>>   
>>   		return true;
>>   	case CHANNEL_MCTRL:
>> +		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>> +			return false;
>> +
>>   		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
>>   	case CHANNEL_PCIE:
>> +		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>> +			return false;
>> +
>>   		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
>>   	default:
>>   		return false;
>> -- 
>> 2.25.1
>>
