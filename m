Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BBBC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 11:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C2F10E292;
	Wed, 22 Jul 2026 11:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axBhuBEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C3310E292;
 Wed, 22 Jul 2026 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784721051; x=1816257051;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gFfE3liqz/mBZxNZE3guFEfP4tgyZEdqcEOxM9Tza/I=;
 b=axBhuBEZyr25ss72QxLhztVg+GVsexKB5kR+wvssKjJ5ISPvL1nYaw8q
 gaHWnD+Fax6KHlT4pvFADMoW1iXY+RUfaP5bJOaQq++8LLTHc41oNaped
 RqhVFZRUCFvIJ5be17cezhg2X8+n1+QfYZQohrMKnQGzYuU/oakT1jUSw
 +dEf4llqpF8WDrQ5RpzmVMqx/8FYRiiFPQdO19D125JXPvsVeuNvC1cvM
 1sqkvRaDNzskwYa/Z2pDpoHpnNQxi6CTAxn9zaX1LOSLD0lXFyxgxjTDm
 sX28tW/YQ86WsAqPFWG7IK6Lt2VdOPVB5vVCBS9K8RwIYPFm3j5ixxxNp w==;
X-CSE-ConnectionGUID: 4bMUMX0VS8KmVmfpRv0dEQ==
X-CSE-MsgGUID: KJ6FxZTzSJOXLdX13XPZaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108143650"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="108143650"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 04:50:51 -0700
X-CSE-ConnectionGUID: AnApG4IKTqG0I6888vIf+g==
X-CSE-MsgGUID: pZLCNqJuR8+RLROOEiBXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="257535097"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 04:50:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 04:50:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 04:50:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 04:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWUSemm0tFPw+ndU5KarubLx/bognhI3kut+zDbHYtAppBDnhmm58f6utVZe3XU1wdxJ0oZ7vfPgrNdz8H+P719OEKgj9vtMy3e6CbUyBOaL8WN0kgNTLLuIi7uVgwuDkxqCVDcgUqWJQgDgF6yiz/VvQ6vPH1Elq4v/fZkeHKSnH+65CJpS0khnlstA0IPUdSBlVG1Zkwz1ZfCKEuuBmHc+d3mKpwhBFxPEgndlqX1Ah8Kal7rWzp7V/FZyvtvVFfkda71WrggSRQS2xsxmKwJPhNlbS/T/cgSzlDuNrjPleS3us6rTzaWlqw9n+RK7uYGRVw7XMZ4npHUF1P59nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H0OYFmjX9nj+uYhvZuGSYGfwqkOXDLCB+wN+4p1g3I=;
 b=CoC6hy518NbgT1vR8xD0nmrvc8Oj4JalGJc5Pr7fj4BwyajJU3UPfXhqeXpnuKWnRBlUsaiRe/j6bLAZyRY8f+PWw9R1GxRxHJ2tKaE3GGfDhPosU5aUK5IDGm7jWRl6FQQZkOvaLnMQgl8U5rwdanTRzQq3QOXz72goKCA5m936QwDuY2ABbVRKvGFSydtm94OAExj/kNcRVSn/cvbiqdU34JBAWF1Uq47NjGmaFm6c4oDq/4VekRtr+9yXJ33J3dz8X28ov+SNdYviAxZynT7/PQnFk6uXy5U5ZUPPIIsLs1em+MaD+Ctdtw+FQpSYBAHQxIVGweLoDbdQXi24uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SN7PR11MB6702.namprd11.prod.outlook.com (2603:10b6:806:269::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:50:42 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 11:50:42 +0000
Message-ID: <8bc39ec0-facb-4129-9bba-f45a10091987@intel.com>
Date: Wed, 22 Jul 2026 17:20:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/dp: set VSC_SDP MSA delegation only for
 capable sinks
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
 <20260709113951.3557968-3-chaitanya.kumar.borah@intel.com>
 <PH7PR11MB6053F45F0786D4A5261247C7E7C62@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <PH7PR11MB6053F45F0786D4A5261247C7E7C62@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::13) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SN7PR11MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: 899fedc1-9938-4052-42e6-08dee7e77544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|4143699003|5023799004|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Vc3CzN1xeikU8GjBhPj7tLD9AZQQpOSw6muO7zkJC9ctmVoozCHFn03EtwL6YH7RCl+Z9VDUX28Y7/Dc4CnbGxfFezGQ++HYW3PHvCCuGLQ7jDJ8+iySWob4+rg0H80F3XaZ+OlT9ZFns/Nj6FVBi+1/wK5lgjxt7YMIlh8VQcvF4Sl1N1u+wtPzPUJDy7leEkvAXL0kxIPY/RZNewil+B8R1eDvsXMZQwkrZFvbk5bB6tefzApsk57pDuFVR/TCJIraY8biS6vJDlxFqD/6kuupgWN2zpA+M8jyCJSPFVI/znZimlVvMEZgmtOcgLqkiQed9tiuHP8JEY3rThOAYWHLAHvUxhdKvJUbUbp5f6nSh0seSFpWWq1RzI/wi9dxS758KAg1UCLHW8eM+X+W5ma5Pe9nCh8V5VGhGq0rExd9cZEHxskS+nKK7BYHBcAb44xxSpAR37gPqw1PZ0K5Ru1Ax0J1faVs5TxdDOK00eduhZIm1XFed7FVUFoh+Wo11ifof3VIjgwklqf/4aWqlpAk5qmcyOgSWsrxQs7DA4mVagLDy2wis/xwDWXgEE8D+JsackJOa3H6fYTjmYwDed/0sXaI+Z8JfQ8JPhSLTArZTP+NXpa7ieqmj9GJ50u/faUY/JhFul1q5y0plohLNcGXvEQlE4YnHoryPJibYIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(4143699003)(5023799004)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MURuK3loaEQvcVhBVHR3M1pEblVsZVRpTHk3WWNBNkZ1UEJOTUFLZ1ErZzk2?=
 =?utf-8?B?dWQ1NEJkTVllMlY0UUF1WWNqNS9oSWhyUEJ3UkJPYW5lWGorYmM4eStoT0dH?=
 =?utf-8?B?d29NemFubTVhZkd5WEplemVHcmsyeFFlWjU4RUgwSzFlVUdzTnF6VHFaT1dJ?=
 =?utf-8?B?UnhNd1JzNFloTE1CMDVUeFdWSDFGd09VdEJRQ0c3a1dpb1JTQ0U4ZWgwdTRz?=
 =?utf-8?B?S1VKYU1lVVBCdDBuUjZIVldUT0d1ZWt5R2NyaTc0OHhvZ2VQY1pOdFFFbWxh?=
 =?utf-8?B?UTNlbFJvUmViU1lQSURsVGkreS9UdHNFUXpHOGQ5c2EyK285aW53RXF6WXhl?=
 =?utf-8?B?SzM1ZmtHcFRMbUdwRVc2K2d2QjlNTXJXQmsySkh6VFhkWlVpYURTWTJyWmVx?=
 =?utf-8?B?Sk5CNVQ4dmF4RDBPTFhPMUFFc1dtMEJBdnFkMWdSL21CSmVDaGVQaG1zczBa?=
 =?utf-8?B?L2MzTC9hMFJ3NFYreENHKzNkN0ZhOHFkVWFyZTZzVHc3SEVWcWMrblVYWHJa?=
 =?utf-8?B?ODdPOUR5NlhwSU1QQ0lJQWRNV3dqTGpPbHJnMjhHeHZ4VXkydVRWdUUvb3hK?=
 =?utf-8?B?UG5xTXd6ZkhGMXRpZVdsVE9Wd2c3ald6dVJ1VmNycDdJV2tJaEJ3cFBQOUJC?=
 =?utf-8?B?c1BRc3VZa2tjNk5OUU9sUzkzWkJ1QTNpb3RIbHBVVEk3M1haZWVHUWJuTnli?=
 =?utf-8?B?N0JYU0h0N1VyUDNsb1I5c2JEazN3ZE1QNTBSbDNKNjYxQ2tDSnJYRys3ZW0r?=
 =?utf-8?B?c1JpSGVvYlhkcU54UERqS2IxSkNjV25pVFNVajNDa0JuQUdiVFRYSjZLOStE?=
 =?utf-8?B?eDh4cEQwelN0L08xZG9VTEMxNUcwS2xiY3R2SS9QOXB6V2hVRUVjR004ZlIv?=
 =?utf-8?B?Y2YzdkVsUVVRNGo5WjQwNkhVQ1JHWk9nNnhlVFN5b3hXYW1kL01GYzAxRXgz?=
 =?utf-8?B?MXZUY0dCdFNJNVZCNTVmZis2TkpyeGJxWnpSdnoxWm1UZU5wT3VJd3BwOFN3?=
 =?utf-8?B?VThyVU5XeW9tMFR0ekxpc1FhMVBiVlU3elh6MzA4MEpsYjJtYndjdnFYYlZY?=
 =?utf-8?B?RStxNVdzTFRUZVVBMlh0cDZ2K05oaEd5SHRpc2NMczVaVGxPa3BsbFl1K0Z6?=
 =?utf-8?B?dlJxU3NBa2V2cHo1NDBVTFhKa3BoQnZueWNBU1VIVHBuRFVsbkQ1WDFPWEZN?=
 =?utf-8?B?V3U4QndQT0NiZ0VoUnJJUGlJUXp0a21ocitTRmM5WW5KMHJUNUdzeUxyWXhz?=
 =?utf-8?B?RS9ZRVdEM3Y5cTdlc0FYM05HTFBZYUliTXEzeXlXUCs1eFZUZEcrbDh3UCs0?=
 =?utf-8?B?THk2SU1HRHFtOCtWSUZLQldHMjV2cVVzMHZyOGI2TVJKbW9MNkdWSnJtZkNi?=
 =?utf-8?B?TUN0Uy9DUE5mc1dla2VOc09NbnhGZ2RURlQyaUhZN29YV201RFZ1UHhZa3I3?=
 =?utf-8?B?ZGJ0azQvb05HdDdlMlowZHdVY1Uyb1lPdGo5YzNzLzJFSnBEU1VTVHlJMCtw?=
 =?utf-8?B?VDFqY3NZTjhKUUd1OVVCdGIrNW9uNjVDVGJFL05rUU9LN0xvRFR2N1hielk1?=
 =?utf-8?B?Sk1RYzZUNlV3RGJENDBSZ1NUSm5HZnVHZnR3MGh0MGtNRkNDLzhXdVRlUzZ2?=
 =?utf-8?B?bVdPL25nQ0RVK04rRXJPU0hzbGovZnkwejJEMnl4b1d4T280QkdEMWw3M1kv?=
 =?utf-8?B?aGNCYVcxcEczUVpzcnpnajEyWG1oZ1ZZNm4yZHZnNlNEZ3J3OVExYnlVTlVx?=
 =?utf-8?B?d0wvNlEvaTlxNkQyQlFXYStHU08yQWdUWjhPWnNxdkF4bWEyN2d2M2pMMEx4?=
 =?utf-8?B?RTk1UmlReDMwc3R0cDZBVnFmWDZpL3kyZE5oOVNPVlNoZzFhRkxzSGpLeEtx?=
 =?utf-8?B?UCtiL3o1WlErZFhkdm5wUGlFUzREVXJLVXVJK1p3ZEEyWTNQSmlDRkc1NU16?=
 =?utf-8?B?dm1aYVVwNnlSb2hzeTI1T0hXY0FlNjhVelJzQkhNY2IvbkNNRitNYU16RXA1?=
 =?utf-8?B?ZlR6VkFDQUVMenZMczV2UjkxMzMxQXJVWnljWkR1Snk1bDdnQ2Vaclpqaytq?=
 =?utf-8?B?d2ROR2t3b2huSEhvVEY3cVhwd0xibGNkWXM4MmJ6Z0ZESzBlT2ErOU13YWF5?=
 =?utf-8?B?THYyVlJqYnY1QjF2REVCNlg3M3RaZkYrZlhSN3hxb0g5bHVEalY2OHBlc3Jp?=
 =?utf-8?B?NVJPd1Y2UFdEelNUbmcwSDltampsc0NlYlp6NEFCZm4yT0FONHpvRnNYUlVk?=
 =?utf-8?B?UkRFdUFyNVIvQmN1c3hQMlloaVB4YlpKV0lTS1ZURW1GWldyUm8waHpvSDJW?=
 =?utf-8?B?a043Mnh6OE1lN1hCempYRlp5ODNDUXNBU0YxMWo1WStuZkVZazBvYW9sTmtp?=
 =?utf-8?Q?mszHrErZNCZeDMYM=3D?=
X-Exchange-RoutingPolicyChecked: WENnuIGQM/Juy1/Bbm3WGCza15OgswF9g2oTFGROmmC0yKUUKn777fXzLgyPb9FQ3O8v1E67KPFJuA8qthFWXkpo8aV7cwG7daBYm3AlQzCr+DcxRrsXh684vGJhPmscIgbRdWafHrbQfzMG6w3MGy4nBFDhM16XNtUTC5yLaTUk8KfChWSrpMdywJfSJ5+aUMy18K/VmPZ5tndqiredigL9nO/no6CS7NdLQS3fwtCov+EDp8vd270R99VZNZYJmHvo9lVT3NUubJMpXI03TBw6w4z8kVTTcivdh5O20ThznqXE0E2qJHyW0+bjXLmBs0SzWNsp3PnSOPWwNCTxEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 899fedc1-9938-4052-42e6-08dee7e77544
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:50:42.8028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rx0cje+Q3nOf3Ez4W++TrC3q9nW0iaVRZxLk2qnZJIT5ihOYtuj3nmDAEtufbYeWuTCmghyVXsPPqETMpeLVC4hmIWD28L6B6NY+H59kvsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6702
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



On 7/17/2026 9:58 AM, Samala, Pranay wrote:
> Hi Chaitanya,
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Chaitanya Kumar Borah
>> Sent: Thursday, July 9, 2026 5:10 PM
>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Subject: [PATCH 2/2] drm/i915/dp: set VSC_SDP MSA delegation only for
>> capable sinks
>>
>> Per DP 1.4a section 2.2.4.3, the MSA MISC1 VSC_SDP bit signals that the sink
>> should defer colorimetry to the VSC SDP. It should only be set when the sink
>> advertises DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED and a VSC SDP
>> with pixel encoding/colorimetry payload will actually be sent.
>>
>> Fold the colorimetry_support check into intel_dp_needs_vsc_colorimetry()
>> so both intel_ddi_set_dp_msa() and intel_dp_compute_vsc_sdp() share a
>> single consistent gate.
>>
>> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Changes LGTM,
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>

pushed to drm-intel-next. Thank you for the review.

> 
>> ---
>>   drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
>> drivers/gpu/drm/i915/display/intel_dp.c  | 14 ++++++++++----
>>   2 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
>> b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index c764472bd69a..13010375e21b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -469,6 +469,8 @@ void intel_ddi_set_dp_msa(const struct
>> intel_crtc_state *crtc_state,
>>   	 * of Color Encoding Format and Content Color Gamut] while sending
>>   	 * YCBCR 420, HDR BT.2020 signals we should program MSA MISC1
>> fields
>>   	 * which indicate VSC SDP for the Pixel Encoding/Colorimetry Format.
>> +	 * Only set the delegation bit when the content needs it and
>> +	 * the sink advertises support.
>>   	 */
>>   	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state))
>>   		temp |= DP_MSA_MISC_COLOR_VSC_SDP;
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 93282694c29b..53688c5bef74 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -3163,8 +3163,7 @@ static void intel_dp_compute_vsc_sdp(struct
>> intel_dp *intel_dp,  {
>>   	struct drm_dp_vsc_sdp *vsc;
>>
>> -	if ((!intel_dp->colorimetry_support ||
>> -	     !intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) &&
>> +	if (!intel_dp_needs_vsc_colorimetry(crtc_state, conn_state) &&
>>   	    !crtc_state->has_psr)
>>   		return;
>>
>> @@ -3173,7 +3172,6 @@ static void intel_dp_compute_vsc_sdp(struct
>> intel_dp *intel_dp,
>>   	crtc_state->infoframes.enable |=
>> intel_hdmi_infoframe_enable(DP_SDP_VSC);
>>   	vsc->sdp_type = DP_SDP_VSC;
>>
>> -	/* Needs colorimetry */
>>   	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) {
>>   		intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
>>   						 vsc);
>> @@ -5103,11 +5101,19 @@ bool
>>   intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state *crtc_state,
>>   			       const struct drm_connector_state *conn_state)  {
>> +	struct intel_dp *intel_dp =
>> +		enc_to_intel_dp(to_intel_encoder(conn_state-
>>> best_encoder));
>> +
>>   	/*
>>   	 * As per DP 1.4a spec section 2.2.4.3 [MSA Field for Indication
>>   	 * of Color Encoding Format and Content Color Gamut], in order to
>> -	 * sending YCBCR 420 or HDR BT.2020 signals we should use DP VSC
>> SDP.
>> +	 * send YCBCR 420 or HDR BT.2020 signals we should use DP VSC SDP.
>> +	 * Only signal this when the sink advertises VSC SDP colorimetry
>> +	 * support.
>>   	 */
>> +	if (!intel_dp->colorimetry_support)
>> +		return false;
>> +
>>   	if (crtc_state->output_format ==
>> INTEL_OUTPUT_FORMAT_YCBCR420)
>>   		return true;
>>
>> --
>> 2.25.1
> 

