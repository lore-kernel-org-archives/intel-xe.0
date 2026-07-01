Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DF5C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 05:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EDA10E2EC;
	Wed,  1 Jul 2026 05:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cW1QV9HZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783C210E2EC
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 05:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782882606; x=1814418606;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=0X/f1OlzydjSdJdK7B97emsDkT4DqSKnHi/xKEYuUWw=;
 b=cW1QV9HZeab2SoGVWY7I0BKctSyAqYEoci+doPi8ovbwQ4NDDMpO2oLj
 oVTrAIOj3KvpWrUWrTvqvhh183Dq/jKqWFtZY/GFoHx7lxTGLlHJZTJF+
 7DXdBLOU4Nmg5/pqlIMubcMMVz9Rtgb4fV8x4lB7b0k5dfgRsZh2pdccc
 3Vm6fyYC6+KxUjru9j4lvSdaTdxc4Nm8n//qe2GpZ+3/Rl1uEAZVL234Y
 qVPcvdfgdB1TDzPHTGedOR6s4+vjd3y7+fWpyBSGTUVYwWQwguhc6+Otg
 KaQGgpLewiJOTgN6pwl9Y3oXHQHv3FGkKaOugySAoRRKZOvsuRL9WoPZN w==;
X-CSE-ConnectionGUID: uEV9NRJTSlSdVBpqzBUmhQ==
X-CSE-MsgGUID: 8bzoPYTYTDyM1s/Hcbpgdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83739838"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208,217";a="83739838"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:10:05 -0700
X-CSE-ConnectionGUID: x+lonnhSTruCqq8ugX+81A==
X-CSE-MsgGUID: 6qw1KZjlRD+XHVk+V2Pnvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
 d="scan'208,217";a="282522788"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 22:10:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 22:10:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 22:10:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 22:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrFo7rDihjop6G4+X8b9t3lnN+ZVLPpXJOUELBrlk8lMPSZYjcdgUXnbd97EjUaQHOb3GKwzMc9loE8QB+9FzkEGx5orrOkFBK3i5/O5+cp7Nmb7oDQxMOzvf+QkAMcJuBuRerTWjZn5FcNV+6DzmVLcA+YWBkTAe2ypNcPmrfE7ytL1t1rs+/9N0IwRcQDP6R0jpgwU1/NaG7h8nlNjN5EccHrx8nGs+gXW271O+lTuPZESWkcSoYHu7GvHcDyBooTpvXNOZsYpPyVx9AjUKdiXeF5TL6uSaVg1zsM5z4fhtQIo0wMVbDjNTwZGpiuMuDR1p4NE55nMYMpKA85O3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ewzn481SMPcRO4pVMWCftr/U/ySUZ1Gs4uR1uoVac4g=;
 b=gj34/9V+dV7klB5efzhzAcPZ8h2iFDKWO+VgJZL42O11C/6ZlNVm3tXBdkgp6O5m6RQyLQgQzGn2SI+ykMtHxgRvrFbkwGjIv7OZJ/MJ3CER0hK54X5eDzBf9xWJlRgpVfQpI9QqpsrfFzDrlhPybeO06dqZqYHzkMRuWrzzaVFyY0g4NKvYZ9k29h3S3xLvXOCqd1OI+ALwSZgOvthTYwlnKz/kyTMQJZB53Wc9aW746Z1nI4Cy7oJnU8/minJEj7AQLpUFLGKbNk5RFSzFqIzWwDIDiN8mw1gI1p45p1U6516mC1aJ198pkNBok+Yz7Q1Qlm00AFgRSnDyDCibJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 05:09:58 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0139.018; Wed, 1 Jul 2026
 05:09:58 +0000
Content-Type: multipart/alternative;
 boundary="------------3fygvSGqvqrXKT7tcbXJZhvU"
Message-ID: <e992ac29-a810-4310-9f4c-b5e8d1f671ed@intel.com>
Date: Wed, 1 Jul 2026 10:39:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/debugfs: Add debugfs for pcode information
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <michael.j.ruhl@intel.com>,
 <matthew.d.roper@intel.com>, <soham.purkait@intel.com>
References: <20260619114018.667995-1-karthik.poosa@intel.com>
 <20260619114018.667995-3-karthik.poosa@intel.com>
 <54016352-a8de-442b-835c-260bf38a944d@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <54016352-a8de-442b-835c-260bf38a944d@intel.com>
X-ClientProxiedBy: MA5P287CA0309.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DS4PPF0BAC23327:EE_
X-MS-Office365-Filtering-Correlation-Id: 3991321a-26f8-428b-16bb-08ded72eff4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|5023799004|56012099006|11063799006|4143699003|8096899003|6133799003;
X-Microsoft-Antispam-Message-Info: N04dyukMkCIITTnOfUVrOubIjNKuI7Ce+2w9qxaLbY/+60blfGAZs/BhEHy9pc0h0380gV/nbcNoWzok+hXQTn85TnQYkndOtSsHRLJLgp8CwvuWvsqtFrl4nj7cVUzEKUwX69tdpp93sKA4t2WKeldmkba0fiTO3DKx970A/bL1Xf6kdW4oGkNTvN1/8/OI+ON5IgZ1nF87i40zRzf4T4i6kRm181jlU3DUpIslrTOCKDA1sYX6QP968H6/EjDl6LzrukUtdt1KCFGs0HXCa0TLK5u8sg6xB6jqv0TzUE9yzuP1piGSBYdcJnpLQtcAEIdY17bYJa+9B2S4F4FpG9kC3p7PP7pnpUAEpcAdQvBCVFWZL9GjnmnlaneLsu90Pfmb79w+aFfQZg8l1h9vrfco9yVdZdy4WzOBkKyVm+OPtj+619sZ+l2KVzIXEYgtlBZ+vJg8sJPbBdtWUwiAyL6AJRum6buSFg/tV4Zsr1p6Hfrx0OvR6BKLsCGFqgKIZB8lzY1D0x7fef68N9cBVdqNknTRW0S0F0NOHBVE1RS8WfvAqBNEskLakl7lTvE+9XL/Mc5I40WJ59F8PeDmXsHl/jFqCwlwCFlS8H5AZB4c5iSEBcIlrT2WO9iHeNeXOZrLHw6edozVBZKLAE3b94nta3y950qP0JYa2DUUmdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(5023799004)(56012099006)(11063799006)(4143699003)(8096899003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGJxYk9sajQ4UmdzNGcvQlNCY2RMUVZrd2JuN3VONjdtN2hzQ1hkT2ZMdlNy?=
 =?utf-8?B?c1lTOW03RXYzRFRjYTNWSk10eWRQWXZsOWpDanp2emQxN2tWVlFZdS9uKzlN?=
 =?utf-8?B?TDJoTkJvVDhDdlo2bStVcVN3YWNCWjlrbGFuY0tGdmlaS3hoazk5bWJTSEx2?=
 =?utf-8?B?Z04wL2RtU0JLaWRHNENTRCt0eThXSW8xbEcxckhsTVhBMmt2WWsvTlR0aGFJ?=
 =?utf-8?B?YnV6eXlzTUFIRXIycEdWcHd3SjRrbHdscU0rZlpDMmkxenR2MWJnZG93aHUz?=
 =?utf-8?B?WWxqLy9tblh5eW9PODI1WEZaL3c5Nk04cnBvK29IZ05ld1VTdXdiTHQ3cmZk?=
 =?utf-8?B?eVp5NHI1aFFFTENETTdiNlc1Qmtua0FkYUUyYk9ZQWJEV2VEdWl6Q0I0U0k3?=
 =?utf-8?B?QWRyQWpibGJQWWdGL2lNZTF2Vjg5OHdFZ1RZUDBLaWJMajNlL0puRnFDdHM4?=
 =?utf-8?B?RTNpaGVNSlRqK3BNaFlHejVFQy9TYVJLU3VXaDhEV1Y1YXVXNnUxbnBEZzVw?=
 =?utf-8?B?aFc2U1VOeFpaTE16QU54TkpIYnlNZFdtc0hjenRNdFAzakc3WmtycTR2OWkz?=
 =?utf-8?B?MUVyTXV0ajlmR1kveWtWYXMxQzh5RXRld3NVWitZNXBrYjNTaVZzRnUyNEYx?=
 =?utf-8?B?VGdwclE5Ly9MYStaa0VpYzF4azFhdDB6R3NJdi8xakpxTkFUN3A4TVJaTWpI?=
 =?utf-8?B?VXRSYXFkNFZneDhtbnBidjJwTktRL0dtQjk4Ty9ad0h4TVpUUmYwUVhWNnhX?=
 =?utf-8?B?UnY0cDBkZ3AxMGs5SUFmRzNtMnpEQXhJRWIzRTZmSERCOXpGdzNwTXEzTGFp?=
 =?utf-8?B?dStlOXE1ejRZdTA0QUQxa1AySTBkS0lGVTVQalRBWGpSNjBJSFdIVFIvYmd3?=
 =?utf-8?B?ZWtBVkUyWDJ3UEg0NzVIb2R6aE43SU0rSWFleUFlREJFd0s2L3VBTTRlSVkr?=
 =?utf-8?B?RjJwVmR1em5vMWNIc3JYdDM5VkExUm9VU0VsRDh5Z1FYNEJYOHFNU1hSeHlj?=
 =?utf-8?B?MnFVMC8zSnpsYndwZjRtaXBORmFCVUtQV2hTeXNJV2hGUWk1VTBvZzBBSzBP?=
 =?utf-8?B?VzRLdXEyeVd4NWIvSmE3T2tML25XU0ZrSnVBYm53dnJWK1htUDlyMjIxdzRa?=
 =?utf-8?B?T3Y4VVJYRXdwV1RuUTFOa3Y5SktyNk1RUFVpRDFjVXFTNTkyQ3ZrVEJtMitl?=
 =?utf-8?B?N0ZtTzZFTjludnZGbVlKdHlvMGpRNWxOaUdkMFZRdXc5VjR2WDNlTGxaYkJk?=
 =?utf-8?B?eFhPcFVZOXVvNWdvaXVrSzZ3RmVUby81N3JHb2ZUWFFjalNCSkJicHhvSlRj?=
 =?utf-8?B?SDhyZ3Bqdk50OGpVTEtHTE85YnQ2cHNNR1Y5OFlzVGFOenRWK25XdGw5UzBF?=
 =?utf-8?B?QTRXT1FWTk1XSXpsSTRVcGswRTk0Sk44OWIzQ1VwS01FQ3ljZ2NTWk1Ldmgr?=
 =?utf-8?B?dG5WdG0zaUF6MHpVclJvMy9ZZTVXUDRiQUQ2M1hYQ3hnWU8xYm1yUExXbFlt?=
 =?utf-8?B?bmlNR1J2Y2ZiaW84ZmdPdW01dE94L2FjQ3Y4Nko1WVpqK1F3N3Nnam9UNG1H?=
 =?utf-8?B?MC9SUUQwTGNiWFFXc0xXRE5LenNibmFpYWVaMHM4Nzcremd3dkthSU1qdWp1?=
 =?utf-8?B?UzI3cWVUOWRtd3hRZFJzbXBOdGhrd3BEZWcrN2hVZy9WUGp1ODNxWWVLcTFU?=
 =?utf-8?B?SG85cG9kaTQxZ2JtWFpFdnlPcDR3ZjBxMXJaSDFtM1lMazJ0d3hrUWJYUnoy?=
 =?utf-8?B?NlZOWDIraDlULzEzV2w0cFhOYmh3ZXNmVjM2QStUc3B1YnZsOWpvYUs4cnRM?=
 =?utf-8?B?WHdoY1VpNFlGeVJRZXZBTjF2NmJ0bnBlMXFOQWhrUVBSaW9kTVhmY1JHWHht?=
 =?utf-8?B?UUl0SURud2hlVmF6blRHWjlyUFpGaEpFRUd1RU9kTHVEQkJNUEZnbW9EZjFV?=
 =?utf-8?B?eVdRQ0U2RW5HMmMvNWx1MmNPMjdHWjlzTXBBNHM1RC9VNlZjbmt1ZldHanNy?=
 =?utf-8?B?VVpKSzcyYUl3TzU5NzdoaFN3OHFvNDRHaUs3dFpONXZPVi9FMEhwUnNvam1z?=
 =?utf-8?B?K1c1cTBxOENnZ29jOWJuUEgvMXhaODVKaVVTOGN4Nlk3alpDbms1UFhlcFlD?=
 =?utf-8?B?Uk93dnlGZWt1RG1EK1VxNGNxTGp1OFF4TXA3MXlGMHFOZG9IMkZYQVZsQ3BZ?=
 =?utf-8?B?K2doSVh1VUhXbUVvRDJnSXdHSVVtQktGNlc4S05IQ2pqRDd6Ym5zVm4ralJh?=
 =?utf-8?B?RERhVGtsTmN0NDUzSlBmZWszTW1kR3FuTUxqV0pXU1h2amZyZGdnQU45NFVi?=
 =?utf-8?B?SlVtaEN3QlJwd1RwWkhaYzJWY2tHR3pIcnQ3SUNHRkI3Z28rSW53dz09?=
X-Exchange-RoutingPolicyChecked: rzUB25s8G36TvgyQHwUCTNXOad5MPZzQAHuJ5uPxnUhYNBcwlpFmNEB+DlcPF3nqxpzyAQwsRt3ITIKS/nW4VsZKVBfFS+qi8Y+zTQAmPJV1vGHI9ObR4ObFi3arvyW8i9WpJoxApZjw4z20ziwFVy8VkytZ6CJl7jFVwUb5elvjNpKDWa+mvDSE8ZLVRbNXZhKlgWCU/gJkQVtobRXpmWqRLjZ1clmNYgrvafUdl2JTs2uegU/5ZB0YZLcO978bKDk8sRBbKQWITasuc7c5WPHu9Ov8BVJV/UCv1FWW0nUrJvTtPQ4hWdmWaZNTs/YxMNC9x7HvjRn2k11nfqINbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3991321a-26f8-428b-16bb-08ded72eff4e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 05:09:58.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5M7cRZjN44f1IoueMJOUpBB8zZTD4tEiqCX2aoBke2uOhpZQCf0t8efcDCfabrSlKkTzQVZHC13Kl+d5MqjsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0BAC23327
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

--------------3fygvSGqvqrXKT7tcbXJZhvU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 19-06-2026 19:29, Michal Wajdeczko wrote:
>
> On 6/19/2026 1:40 PM, Karthik Poosa wrote:
>> Introduce a pcode_info debugfs entry to report pcode details.
>> This initial implementation exposes the pcode version.
>> This can aid debugging when the pcode version is needed.
>>
>> v2:
>>   - Enable the debugfs only for supported platforms. (Micheal Ruhl)
>>
>> v3:
>>   - Move the platform check out of this patch, as it is not relevant here.
>>     This patch solely enables debugfs; debugfs creation will be determined
>>     based on the return value of get_pcode_version. (Karthik)
>>
>> v4:
>>   - Skip creating debugfs entries for SR-IOV VFs, as this is not
>>     supported. (Matt)
>>   - Reintroduce the platform check during debugfs creation to prevent
>>     creating debugfs on unsupported platforms.
> nit: we can keep log under ---
okay
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c | 34 +++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 22b471303984..cafe3deb04d5 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -31,6 +31,7 @@
>>   #include "xe_tile_debugfs.h"
>>   #include "xe_vsec.h"
>>   #include "xe_wa.h"
>> +#include "xe_pcode.h"
> keep includes in alphabetical order
ok
>
>>   
>>   #ifdef CONFIG_DRM_XE_DEBUG
>>   #include "xe_bo_evict.h"
>> @@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>   
>> +static int pcode_info(struct seq_file *m, void *data)
>> +{
>> +	struct xe_device *xe = node_to_xe(m->private);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct pcode_version version;
>> +	int ret = 0;
>> +
>> +	ret = get_pcode_version(xe, &version);
>> +	if (ret) {
>> +		drm_warn(&xe->drm, "couldn't read pcode version ret %d\n", ret);
> do we need this? and get_pcode_version() already prints an error on failure
>
> and we already return this error code to the user
We can remove this.
>
>> +		return ret;
>> +	}
>> +	drm_printf(&p, "pcode version: %d.%d.%d\n", version.major,
>> +		   version.minor, version.engg);
> use %u
ok
>> +	return 0;
>> +}
>> +
>>   static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>>   {
>>   	struct xe_device *xe;
>> @@ -221,6 +239,10 @@ static const struct drm_info_list debugfs_list[] = {
>>   	{ .name = "workarounds", .show = workaround_info, },
>>   };
>>   
>> +static const struct drm_info_list pcode_info_debugfs[] = {
>> +	{ .name = "pcode_info", .show = pcode_info, },
>> +};
>> +
>>   static const struct drm_info_list debugfs_residencies[] = {
>>   	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
>>   	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
>> @@ -567,6 +589,18 @@ void xe_debugfs_register(struct xe_device *xe)
>>   					  &inject_csc_hw_error);
>>   	}
>>   
>> +	/*
>> +	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
>> +	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
>> +	 * PUNIT_VERSION_OFFSET.
>> +	 * Attempting this access on other platforms must be verified before enabling support.
>> +	 */
>> +	if (!IS_SRIOV_VF(xe) &&
>> +	    (xe->info.platform == XE_CRESCENTISLAND || xe->info.platform == XE_BATTLEMAGE))
> maybe move this comment/condition to some helper function
>
> 	bool has_pcode_version(xe)
This is currently only used in debugfs and we don't expect other users,
so adding a helper seems unnecessary. We can refactor if reuse comes up.
>
>> +		drm_debugfs_create_files(pcode_info_debugfs,
>> +					 ARRAY_SIZE(pcode_info_debugfs),
>> +					 root, minor);
>> +
>>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>>   			    &forcewake_all_fops);
>>   
--------------3fygvSGqvqrXKT7tcbXJZhvU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19-06-2026 19:29, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:54016352-a8de-442b-835c-260bf38a944d@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 6/19/2026 1:40 PM, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce a pcode_info debugfs entry to report pcode details.
This initial implementation exposes the pcode version.
This can aid debugging when the pcode version is needed.

v2:
 - Enable the debugfs only for supported platforms. (Micheal Ruhl)

v3:
 - Move the platform check out of this patch, as it is not relevant here.
   This patch solely enables debugfs; debugfs creation will be determined
   based on the return value of get_pcode_version. (Karthik)

v4:
 - Skip creating debugfs entries for SR-IOV VFs, as this is not
   supported. (Matt)
 - Reintroduce the platform check during debugfs creation to prevent
   creating debugfs on unsupported platforms.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
nit: we can keep log under ---</pre>
    </blockquote>
    okay
    <blockquote type="cite" cite="mid:54016352-a8de-442b-835c-260bf38a944d@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..cafe3deb04d5 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -31,6 +31,7 @@
 #include &quot;xe_tile_debugfs.h&quot;
 #include &quot;xe_vsec.h&quot;
 #include &quot;xe_wa.h&quot;
+#include &quot;xe_pcode.h&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
keep includes in alphabetical order</pre>
    </blockquote>
    ok
    <blockquote type="cite" cite="mid:54016352-a8de-442b-835c-260bf38a944d@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include &quot;xe_bo_evict.h&quot;
@@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int pcode_info(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m-&gt;private);
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct pcode_version version;
+	int ret = 0;
+
+	ret = get_pcode_version(xe, &amp;version);
+	if (ret) {
+		drm_warn(&amp;xe-&gt;drm, &quot;couldn't read pcode version ret %d\n&quot;, ret);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
do we need this? and get_pcode_version() already prints an error on failure

and we already return this error code to the user</pre>
    </blockquote>
    We can remove this.
    <blockquote type="cite" cite="mid:54016352-a8de-442b-835c-260bf38a944d@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		return ret;
+	}
+	drm_printf(&amp;p, &quot;pcode version: %d.%d.%d\n&quot;, version.major,
+		   version.minor, version.engg);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
use %u
</pre>
    </blockquote>
    ok
    <blockquote type="cite" cite="mid:54016352-a8de-442b-835c-260bf38a944d@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	return 0;
+}
+
 static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
@@ -221,6 +239,10 @@ static const struct drm_info_list debugfs_list[] = {
 	{ .name = &quot;workarounds&quot;, .show = workaround_info, },
 };
 
+static const struct drm_info_list pcode_info_debugfs[] = {
+	{ .name = &quot;pcode_info&quot;, .show = pcode_info, },
+};
+
 static const struct drm_info_list debugfs_residencies[] = {
 	{ .name = &quot;dgfx_pkg_residencies&quot;, .show = dgfx_pkg_residencies_show, },
 	{ .name = &quot;dgfx_pcie_link_residencies&quot;, .show = dgfx_pcie_link_residencies_show, },
@@ -567,6 +589,18 @@ void xe_debugfs_register(struct xe_device *xe)
 					  &amp;inject_csc_hw_error);
 	}
 
+	/*
+	 * Pcode version read from PMT is currently only supported on CRI and BMG platforms in PF
+	 * mode, as both platforms support the necessary telemetry read mechanism and have a fixed
+	 * PUNIT_VERSION_OFFSET.
+	 * Attempting this access on other platforms must be verified before enabling support.
+	 */
+	if (!IS_SRIOV_VF(xe) &amp;&amp;
+	    (xe-&gt;info.platform == XE_CRESCENTISLAND || xe-&gt;info.platform == XE_BATTLEMAGE))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
maybe move this comment/condition to some helper function

	bool has_pcode_version(xe)</pre>
    </blockquote>
    <span>
      <div class="scriptor-paragraph"><span>This is currently only used
          in debugfs and we don't expect other users,</span></div>
      <div class="scriptor-paragraph"><span>so adding a helper seems
          unnecessary. We can refactor if reuse comes up.</span></div>
    </span>
    <blockquote type="cite" cite="mid:54016352-a8de-442b-835c-260bf38a944d@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		drm_debugfs_create_files(pcode_info_debugfs,
+					 ARRAY_SIZE(pcode_info_debugfs),
+					 root, minor);
+
 	debugfs_create_file(&quot;forcewake_all&quot;, 0400, root, xe,
 			    &amp;forcewake_all_fops);
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------3fygvSGqvqrXKT7tcbXJZhvU--
