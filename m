Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A2FC5CFEB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 11:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D297610EE9A;
	Wed, 12 Aug 2026 11:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhRjdljw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BA810EE9A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786533321; x=1818069321;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vaeVMn5EVRClfqRF8LBS07pSUX+qHXMjNDhEwL/aRcM=;
 b=MhRjdljwkgt5BGFI6blSG+RMF0GUAjMAhzgk6mZifW+vYvzqnXRYrU9H
 7uK3FJNCDfGCXY3O8QRfLcRioiJHcY2JfILcAYsWcum2INZfNYzrIZoOH
 RSM3Eb+iVr2SxqhRjyVCZI73mpkQ8OFZnAs70c/dWTPTtVfRPR3g8c3uw
 V+WhDNscko88aRiLymZ6d9+ywTDA+/ZBa7+rM+dFlU7fqxNMC7y2SdGU1
 rFyMK2K7RJL45Ndt1TVMNuaHfu9lnt4x0B9slOpDA4bPz06nAKo8tg219
 L9ZxXoS7+1ulm+FediduzKXwIlT9JJL3HvxwndroasVeS7du5fz0Uw6I/ Q==;
X-CSE-ConnectionGUID: GJcwC2z+TwG1bIXDTkLHvQ==
X-CSE-MsgGUID: QWSMpc+SQtmM7cssFqmjFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87010013"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87010013"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:15:20 -0700
X-CSE-ConnectionGUID: EdcCYEy0TFabfsRlFZVEgQ==
X-CSE-MsgGUID: OGNW7NsZSiiGYO92ojhcIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="259783559"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:15:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 04:15:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 04:15:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 04:15:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFWunMp3QDIAJxx7m4ZjrdzKIOSXxAWnx9WmzTvRzJZiW1BG54bFLgMOhzH2wH2hBfwvoh/TXLqiLICs8cqGaTyOW9n/WnoYrKj96ia437UUAxyTH7u0AmkIapUpsn7J34CtH9mKYSf/FvCUllZyHuo4SRdVK4VA7jbZ9WaB3NJi8OhcN9G6GvNUPyDRsDqI9LRLQ+e6IJcGmGTrTKXuTsSo3A857upbh1tX/US11fLkVjONSpc3YWZYsN6PdeJ3e3FVJNnAfWNO+okD1cUwcEwqCNHDviGgihy2x6QkMyP8VlLpmYXFYUIMz7hpLWDI53x8/u14ZCtiI5vFfJIcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVGSAHMpVyN58lddzQI1PKkZexn6TV2ksdDZKPyPyhA=;
 b=cXfkHCQdLCH3ItsX+jPUgOwZHKL40l9U++hlFiKU1zO5BaugPDuwuAHoXy5jFHKcZwmeZrzJYJiVg2TOGGE6v3vkAdPvORdPHeO60h8srXB8ZQZNOKrZVcUaQ+7b+F5dQu+i45WQCZ1w7z8T5MSAhnsnhXEbozCtMSHpQRMbZgqeY+121ts+6D++gzjY7Y8DQgCl3DHhIy/Mtk0w7S9clwjzjIdpkUq42B6UdmSv+t6HiXN6dc6S+0BaCrWGl1jUCziyEY7X8tgYBhjxvZtx/7bYhjL+UMZ4sFA+OkGRshAakPn3fIH8ddgNSnxri4fudaF4zalKIy9wN6SGE3+cuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 11:15:14 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 11:15:13 +0000
Message-ID: <a7830adb-e8b6-4c42-97f0-a848adcdc0f2@intel.com>
Date: Wed, 12 Aug 2026 16:45:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] drm/xe/tests: Add Kunit tests for xe_log
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-15-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-15-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DM6PR11MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: 23864a4e-508b-4db1-9f18-08def862faed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QZacWvELvwvj6lgs0k/6bClqfSCRh3WQSameedkOZeOVeA+Dgi5fDwY5TXcoNoJ3NmsTetGOMPScRvW8AUZaD6Zp/uPPJgyHa4u+38CzY0NUMohZqn/kSua3bnMGQuIq1SNpdLtwhLUJUjzMdz4Fro7Hrcrg+1j95bv/Ikyxa6Kb3blhH5CMcN2N+806DxtBZRfrjT95tlx4dLECV7EPLBWLHKw6DMd7Pr66RUclZnqPA0+Pi17SoTT4wvPVhxs5Tr67fUe31Lhv+6NQRpGfYf4IIVoft1MCsNnA47to/rAOAhlML4Z3Znn5u9b61Cf4vSXBBMyk1R31e4D3ae7dP0gIejJwNZyvxtHbmKnJK5edf1o/VJ7FY+8AGF8GEeQL4PUvhBtFeb6bk5NWoTtusl94zKIMZ1yjv0GPyjia9DfFpvsp9XQzFRbl22LJ6AjSG255KD1S0ikd4MeAl7WMpfLFDJUIviCpChEGTXi2OA7WmaSaipxZv8hBwrGrs+1+kTPwZGojtST6WERa3uOQ9yEfGx1GYCoonFGJhy0nd/yIuOBW8QL2TiDsoIR/sBzqVQSp1WY9UCmtdQjjwZXYnxrHFlJcpt9I1WTgPe3D949N9daOcTRt8MVClaWHGc8GupzYnl2Nl58CdmiRw8VdbGMhmwpbJ+cu7w0POmE4ynU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE4vcUJ3cHh3ZGdpSTRjOFNNUitlc1QwQVlqZXc5eTdLZXA0cUY0QVFha3pH?=
 =?utf-8?B?Ym4xbEVXL0Z2QmpwYk4vUUNKOVArNk1qNEJZeGVmaTgwZ0hHbVBWT0lZSnMy?=
 =?utf-8?B?YU9lYmFNbWUwOXVoVW0yYW9oeEMraENpM3UrMlFEUjVtMUsrZktzT0VkSk5t?=
 =?utf-8?B?bFdsNlU0WTAyRmxjclhQMXVWbEdkNm5uZ0hVSTVWMHFSUFd0VCtLNzVubHFB?=
 =?utf-8?B?bEJudVZDTG9FTnBNV2pqZisxZC9BVGRCenl0VlF1aFRwZmI1ZUg1dW1CckN1?=
 =?utf-8?B?Qm5UZ3hROTRJcnk1QUVvOFptSG91bE1ta3hCdmVJSk5abWlrMzVXRU83Unhp?=
 =?utf-8?B?eFhxRUpjNzAwQzB2TldFREZwUUFoMkFncDNwOEVvZUlNamFSV2dnUk5YNUZq?=
 =?utf-8?B?eCtud3dpcWlndko4RGxBYlE0MnRORGR6c25ZVFZqUGdXTEpyOERvUjVhWEJD?=
 =?utf-8?B?VGZUZjdwNmdPR3pxdWNEajljL21BSlkyL1VQaDc2RmsvbVhOMkhWM01LT1lX?=
 =?utf-8?B?aWcreklUTnpDQjFFM3krZDRmbEx2QkV4cFRNRE0wQTZ1Ymh5NjRJcllMYVhI?=
 =?utf-8?B?TkdIY204YlA0Wm1BN2lTUmxGYWtZTVFWNU9iaE1EWTd6eGhDVk5QQ2Q5VEJ2?=
 =?utf-8?B?bWdoajB4bDBoV0RZVjkvOEtVeVBIeHJocHpsN3JickxMcklwVEJRcUsrUGZF?=
 =?utf-8?B?M1k1aEtGa2FPeDRScGx3L2FPWEhqVzJJVW0vdUNvUDZaeEJrZjVaa0NIWU91?=
 =?utf-8?B?eTRmWkNNU2xnamdHdDhlQk9Eb2FkcGZ5NUEvdUZ1akVuaERRK2pUeDJMUGZu?=
 =?utf-8?B?dlNxSGlyNlkvQkR0WmExMlJqTC9qcXc2ZU5MWXRxalJoZXI3eE04eDR4UzJl?=
 =?utf-8?B?Zm1ybUpTTXNFVTc2Sjh2c2ZLd2VIR2lRZStoNk1pRjFLYng1QVlRTDZDUitS?=
 =?utf-8?B?SXFiR0trdmRINHVVdkMrdVNOZG5BM0hMUVZveG5wdm1WdjFIWjlyQ0N6bDFX?=
 =?utf-8?B?UGduQnEyeElKN1lhYWh4bFJSaTliTWlEc0pvMURBelFsZzlFRlpLRHo0TGlV?=
 =?utf-8?B?Yk83YnNZYTNUQ0VrQWhLMVI0V0hDWDVjUERycEdXclNQZ2hQNWNZdTluUXgx?=
 =?utf-8?B?U2tqMHJrSUh2QnJaaXhKUXNRVEl6aEhNTW9mMm5BVXIyYlhucThYQS9MV0dN?=
 =?utf-8?B?UGIwNzZHSFRxaHlCNDR4OXh4UEtQbENMeHZJTWFoaEtHajBzSVoyVC9xRzhl?=
 =?utf-8?B?VGx5ZjFpUFVEdmUxcFI0Z0IrK2ZOaVBPenRPbGh0NWpzelRXRGZ5b0JhQnhW?=
 =?utf-8?B?MXRjL2tGNE9PNXMvYnZQaEFNL2JYK1p5cFlXeXdLaUxVZ1Jib3BVYkx5Yzly?=
 =?utf-8?B?cjVVTHBBeVdJUEJlVTJUOFpycVNFQTlUQjEwTWZIaVY3cTVGZ20wcjdjb2JX?=
 =?utf-8?B?dXMydkVWSVBtK1B4RXl3Q3dMZExtN25Bb3RjY1lEYWltUklTVG13Si83bUs3?=
 =?utf-8?B?TWhZQUZUdGRLdityeVR4cXVPTDV6R2VocTNSVStQQmVFd0U3eDhQL25tYkFC?=
 =?utf-8?B?by9VM1IyU3BrWXR6OXByVE1iNXZiT2tRR3oyY1huTURqZjZ5WFAxZlhNWDIy?=
 =?utf-8?B?YUxQTXFuOGRobXpSOHpBMnNEQUtlZ0h4dmZpTDRwbFQ0ci9lUWh5dWpJc0dI?=
 =?utf-8?B?a3p4blJXWG02ZnNTVlllRHhtMUY4anV0dmlKSm8wTjdtSGdvdDMrQXBJTUx0?=
 =?utf-8?B?U0Urblc4TzZwenpua2ZCejRXclpONjFDKytMdnVXOHY1V0NkQzJZRnZydDJJ?=
 =?utf-8?B?T2RuWGg4eVAvVWRGWmxhWk5RRXljSklOWEFTekhKankvdS9tT1VsUkVLbkF3?=
 =?utf-8?B?K0xEWHFKR1ZRVXNUOUpMNnlJUUg4dlIxd1gvVnpFQ3pQRnd0bzdObnd0ZTNG?=
 =?utf-8?B?dEN3TU5IM2xQZlB2L3FmSHMwanJUVXpkTnZZS2RITkdTSHdyMUJOemJVSU1D?=
 =?utf-8?B?VzB2Y3hFWkVQdGl0b051WkZGSkZFSEJ6ZUtpT3JPWkxLWHFhT2hmZjJ0WjJr?=
 =?utf-8?B?K0lpSWR2dnNKMDRrV0VqQ0x0MGk0cndCNndua0pvdUYwYjljeU1XSXB3bU9o?=
 =?utf-8?B?aE5KcEg0M3MxYUhUQ3JJV2gydzJ1Z2lUcEYrV1hacXp3SG9yNWtGUTVjakVB?=
 =?utf-8?B?MU1lSUY0bzlqZXNQSTNZN2JsWTlkT3ptSUtPcVlhS1lDcmZ6WUFWVTlNWUVu?=
 =?utf-8?B?b3hCSE5obXByRVoxNjlUc21YSWVPQkVqcEovaTN0aWxSakEyQXBZOEwxNWhT?=
 =?utf-8?B?Q25YWGp2V1Y3SnNUSVVHVmFTd29MdXNxR1BkVFR5SXZkTVJUZndnMk9LblBk?=
 =?utf-8?Q?3WfuYZx7JASshs4s=3D?=
X-Exchange-RoutingPolicyChecked: LPyYbX4PCSzMmDeAb+WQNYvly04e5IwyiC8dainKY3FBsysqYdBslqSWAXuPXv5URwL75siMzkyD1PTrfkKwVVqfsIvQQvNhuQ4PqAA2Dxwex1kXJfg/xbpe2pQ60+df3BggB5uenuGGwILIwfL+Wnja2LWzhN9JDumx8gUSxfzjMcKOFGf3+2SUcdUt7pYnPFkFAWN4zMMZybodxNMRw6gef+vm/deD3p4yCWqI+PiNfkoxtBlX2HsVrCPsXOo+2Iq9Ir7GP7OqfwuGV7G8eJlacr3RxuI//96jFs3DZfo1d1/rMtxAQIOWLW6Qlcp0eRmT/WQafrZaEkCAYJ60GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23864a4e-508b-4db1-9f18-08def862faed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 11:15:13.5812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORDeqV0DxUm1/xntaTFI/6y0Zdo/32JkJ0Bu81fYniouwKhyaAFBIM7Pfw0zdlNMqsMJ6pThpQdd7+XNmsvUw9nAHeNLzCDXTXM30MoLTxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> All dmesg log lines generated by the xe_log() functions or helper
> macros are expected to have a stable format. Add tests to verify
> that generated output is not accidentally changed. Add demo pseudo
> tests to show how to use all variants of the xe_log() helpers.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: less demos/more tests (Michal)
> v3: expect tile.id is already set (Michal)
>      add invalid params test (Michal)
> ---
>   drivers/gpu/drm/xe/tests/xe_log_kunit.c | 545 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.c             |  11 +
>   2 files changed, 556 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/tests/xe_log_kunit.c
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_log_kunit.c b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> new file mode 100644
> index 000000000000..27f3c322cc26
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_log_kunit.c
> @@ -0,0 +1,545 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/static_stub.h>
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include "tests/xe_kunit_helpers.h"
> +#include "tests/xe_pci_test.h"
> +#include "xe_device.h"
> +#include "xe_log.h"
> +
> +static void nop_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +}
> +
> +static void nop_emit_cper(struct pci_dev *pdev, int cper_sev,
> +			  enum xe_sigid sigid, u32 component, u32 location,
> +			  const void *data, size_t len, struct va_format *vaf)
> +{
> +}
> +
> +static const char *component_name(u32 component)
> +{
> +	switch (component) {
> +#define make_component_tag_case(_CLASS, _ID, _TAG, _SIG, _NAME) \
> +	case XE_LOG_COMPONENT_##_TAG: return _NAME;
> +	DEFINE_XE_LOG_COMPONENTS(make_component_tag_case)
> +#undef make_component_tag_case
> +	}
> +	return component ? "???" : "";
> +}
> +
> +static const char *location_type(u32 location)
> +{
> +	u32 type = FIELD_GET(XE_LOG_LOCATION_TYPE_MASK, location);
> +
> +	return type == XE_LOG_LOCATION_TYPE_DEVICE ? "DEVICE" :
> +	       type == XE_LOG_LOCATION_TYPE_TILE ? "TILE" :
> +	       type == XE_LOG_LOCATION_TYPE_GT ? "GT" :
> +	       location ? "?" : "";
> +}
> +
> +static void fake_emit_cper(struct pci_dev *pdev, int cper_sev,
> +			   enum xe_sigid sigid, u32 component, u32 location,
> +			   const void *data, size_t len, struct va_format *vaf)
> +{
> +	char msg[64];
> +	int n, err;
> +
> +	pr_info("\n");
> +	pr_info("CPER SEV=%u SIGID=%u\n", cper_sev, sigid);
> +	pr_info("CPER DEVICE=%s\n", dev_name(&pdev->dev));
> +	if (location)
> +		pr_info("CPER LOCATION=%#x \t# %s.%u\n",
> +			location, location_type(location),
> +			FIELD_GET(XE_LOG_LOCATION_ID_MASK, location));
> +	if (component)
> +		pr_info("CPER COMPONENT=%#x \t# %s\n",
> +			component, component_name(component));
> +	if (IS_ERR(data)) {

Please move 'err' variable within the block.

after changing that

LGTM,

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +		err = PTR_ERR(data);
> +		pr_info("CPER ERR=%d \t\t# %pe\n", err, data);
> +	} else if (len) {
> +		print_hex_dump(KERN_INFO, "CPER BIN=", DUMP_PREFIX_OFFSET,
> +			       16, 1, data, len, false);
> +	}
> +
> +	n = vscnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
> +	print_hex_dump(KERN_INFO, "CPER MSG=", DUMP_PREFIX_OFFSET, 16, 1, msg, n, true);
> +	pr_info("CPER END\n");
> +}
> +
> +static const u8 blob[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
> +static const u8 dead[] = { 0xde, 0xad, 0xbe, 0xef };
> +
> +static struct xe_tile *to_tile_safe(struct xe_device *xe)
> +{
> +	return xe ? &xe->tiles[1] : NULL;
> +}
> +
> +static struct xe_gt *to_gt_safe(struct xe_device *xe)
> +{
> +	return xe ? to_tile_safe(xe)->primary_gt : NULL;
> +}
> +
> +static struct pci_dev *to_pdev_safe(struct xe_device *xe)
> +{
> +	return xe ? xe_any_to_pdev(xe) : NULL;
> +}
> +
> +static void demo(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = xe_any_to_pdev(xe);
> +	struct xe_tile *tile = to_tile_safe(xe);
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	/* SW errno */
> +	xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
> +		    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +		    ERR_PTR(-ENODEV), 0, "testing %s signature\n", "software");
> +
> +	xe_log_err(tile, PROBE, -ENODEV, "testing %s signature\n", "software");
> +	xe_log_err_corrected(gt, PROBE, -ENODEV, "testing %s signature\n", "software");
> +	xe_log_info(gt, PROBE, "testing %s signature\n", "software");
> +
> +	/* HW data */
> +	xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PCIE,
> +		    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +		    blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> +	xe_log_emit_recoverable(pdev, XE_SIGID_FABRIC,
> +				XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> +	xe_log_from_corrected(tile, XE_SIGID_DEVICE_MEMORY, XE_LOG_COMPONENT_NONE,
> +			      blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> +	xe_log_from_info(gt, XE_SIGID_CORE_COMPUTE, XE_LOG_COMPONENT_NONE,
> +			 blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> +}
> +
> +static void demo_dmesg(struct kunit *test)
> +{
> +	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
> +	demo(test->priv);
> +}
> +
> +static void demo_cper(struct kunit *test)
> +{
> +	kunit_activate_static_stub(test, log_emit_cper, fake_emit_cper);
> +	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
> +	demo(test->priv);
> +}
> +
> +static const char *test_fatal(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_fatal(pdev, XE_SIGID_PROBE,
> +				  XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				  NULL, 0, "testing %d\n", 123);
> +	return "SIGID=101 FATAL testing 123\n";
> +}
> +
> +static const char *test_fatal_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_from_fatal(tile, XE_SIGID_PROBE, XE_LOG_COMPONENT_NONE,
> +				  ERR_PTR(-ENODEV), 0, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: testing 123\n";
> +}
> +
> +static const char *test_fatal_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_from_fatal(gt, XE_SIGID_PROBE, XE_LOG_COMPONENT_NONE,
> +				  ERR_PTR(-ENODEV), 0, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: GT1: testing 123\n";
> +}
> +
> +static const char *test_fatal_comp(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_err_fatal(pdev, PROBE, -ENODEV, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) PROBE: testing 123\n";
> +}
> +
> +static const char *test_fatal_comp_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_err_fatal(tile, PROBE, -ENODEV, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: PROBE: testing 123\n";
> +}
> +
> +static const char *test_fatal_comp_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_err_fatal(gt, PROBE, -ENODEV, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: GT1: PROBE: testing 123\n";
> +}
> +
> +static const char *test_fatal_all(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
> +			    XE_LOG_COMPONENT_PROBE, MAKE_XE_LOG_LOCATION(GT, gt->info.id),
> +			    ERR_PTR(-ENODEV), 0, "testing %d\n", 123);
> +	return "SIGID=101 FATAL (-ENODEV) Tile1: GT1: PROBE: testing 123\n";
> +}
> +
> +static const char *test_recoverable(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_recoverable(pdev, XE_SIGID_RUNTIME_FW,
> +					XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +					ERR_PTR(-EIO), 0, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) testing 123\n";
> +}
> +
> +static const char *test_recoverable_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_from_recoverable(tile, XE_SIGID_RUNTIME_FW, XE_LOG_COMPONENT_NONE,
> +					ERR_PTR(-EIO), 0, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: testing 123\n";
> +}
> +
> +static const char *test_recoverable_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_from_recoverable(gt, XE_SIGID_RUNTIME_FW, XE_LOG_COMPONENT_NONE,
> +					ERR_PTR(-EIO), 0, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: GT1: testing 123\n";
> +}
> +
> +static const char *test_recoverable_comp(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_err(pdev, GUC, -EIO, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) GUC: testing 123\n";
> +}
> +
> +static const char *test_recoverable_comp_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_err(tile, GUC, -EIO, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: GUC: testing 123\n";
> +}
> +
> +static const char *test_recoverable_comp_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_err(gt, GUC, -EIO, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: GT1: GUC: testing 123\n";
> +}
> +
> +static const char *test_recoverable_all(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit(pdev, CPER_SEV_RECOVERABLE, XE_SIGID_RUNTIME_FW,
> +			    XE_LOG_COMPONENT_GUC, MAKE_XE_LOG_LOCATION(GT, gt->info.id),
> +			    ERR_PTR(-EIO), 0, "testing %d\n", 123);
> +	return "SIGID=104 (-EIO) Tile1: GT1: GUC: testing 123\n";
> +}
> +
> +static const char *test_info(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit(pdev, CPER_SEV_INFORMATIONAL, XE_SIGID_DEVICE_FW,
> +			    XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +			    NULL, 0, "testing %d\n", 123);
> +	return "SIGID=105 testing 123\n";
> +}
> +
> +static const char *test_info_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_from_info(tile, XE_SIGID_DEVICE_FW, XE_LOG_COMPONENT_NONE,
> +				 NULL, 0, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: testing 123\n";
> +}
> +
> +static const char *test_info_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_from_info(gt, XE_SIGID_DEVICE_FW, XE_LOG_COMPONENT_NONE,
> +				 NULL, 0, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: GT1: testing 123\n";
> +}
> +
> +static const char *test_info_comp(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_info(pdev, PCODE, "testing %d\n", 123);
> +	return "SIGID=105 PCODE: testing 123\n";
> +}
> +
> +static const char *test_info_comp_tile(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = to_tile_safe(xe);
> +
> +	if (tile)
> +		xe_log_info(tile, PCODE, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: PCODE: testing 123\n";
> +}
> +
> +static const char *test_info_comp_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (gt)
> +		xe_log_info(gt, PCODE, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: GT1: PCODE: testing 123\n";
> +}
> +
> +static const char *test_info_all(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +	struct xe_gt *gt = to_gt_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit(pdev, CPER_SEV_INFORMATIONAL, XE_SIGID_DEVICE_FW,
> +			    XE_LOG_COMPONENT_PCODE, MAKE_XE_LOG_LOCATION(GT, gt->info.id),
> +			    NULL, 0, "testing %d\n", 123);
> +	return "SIGID=105 Tile1: GT1: PCODE: testing 123\n";
> +}
> +
> +static const char *test_hw_fatal(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_fatal(pdev, XE_SIGID_PCIE,
> +				  XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				  dead, sizeof(dead), "testing %d\n", 123);
> +	return "SIGID=201 FATAL (deadbeef) " HW_ERR "testing 123\n";
> +}
> +
> +static const char *test_hw_recoverable(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_recoverable(pdev, XE_SIGID_DEVICE_MEMORY,
> +					XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +					dead, sizeof(dead), "testing %d\n", 123);
> +	return "SIGID=202 (deadbeef) " HW_ERR "testing 123\n";
> +}
> +
> +static const char *test_hw_corrected(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_corrected(pdev, XE_SIGID_DEVICE_MEMORY,
> +				      XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				      dead, sizeof(dead), "testing %d\n", 123);
> +	return "SIGID=202 CORRECTED (deadbeef) " HW_ERR "testing 123\n";
> +}
> +
> +static const char *test_hw_informational(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pdev_safe(xe);
> +
> +	if (pdev)
> +		xe_log_emit_info(pdev, XE_SIGID_DEVICE_MEMORY,
> +				 XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +				 dead, sizeof(dead), "testing %d\n", 123);
> +	return "SIGID=202 (deadbeef) testing 123\n";
> +}
> +
> +static const struct log_test_param {
> +	const char *(*func)(struct xe_device *xe);
> +} log_test_params[] = {
> +	{ .func = test_fatal },
> +	{ .func = test_fatal_tile },
> +	{ .func = test_fatal_gt },
> +	{ .func = test_fatal_comp },
> +	{ .func = test_fatal_comp_tile },
> +	{ .func = test_fatal_comp_gt },
> +	{ .func = test_fatal_all },
> +	{ .func = test_recoverable },
> +	{ .func = test_recoverable_tile },
> +	{ .func = test_recoverable_gt },
> +	{ .func = test_recoverable_comp },
> +	{ .func = test_recoverable_comp_tile },
> +	{ .func = test_recoverable_comp_gt },
> +	{ .func = test_recoverable_all },
> +	{ .func = test_info },
> +	{ .func = test_info_tile },
> +	{ .func = test_info_gt },
> +	{ .func = test_info_comp },
> +	{ .func = test_info_comp_tile },
> +	{ .func = test_info_comp_gt },
> +	{ .func = test_info_all },
> +	{ .func = test_hw_fatal },
> +	{ .func = test_hw_recoverable },
> +	{ .func = test_hw_corrected },
> +	{ .func = test_hw_informational },
> +};
> +
> +static void log_param_get_desc(const struct log_test_param *p, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%ps", p->func);
> +}
> +
> +KUNIT_ARRAY_PARAM(log, log_test_params, log_param_get_desc);
> +
> +static void check_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	struct kunit *test = kunit_get_current_test();
> +	const struct log_test_param *param = test->param_value;
> +	const char *exp = param->func(NULL);
> +	char msg[64];
> +	int n;
> +
> +	n = vsnprintf(msg, sizeof(msg), vaf->fmt, *vaf->va);
> +	KUNIT_EXPECT_LT(test, n, sizeof(msg));
> +	KUNIT_EXPECT_STREQ(test, msg, exp);
> +}
> +
> +static void test_dmesg(struct kunit *test)
> +{
> +	const struct log_test_param *param = test->param_value;
> +
> +	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
> +	kunit_activate_static_stub(test, log_dmesg_vprintk, check_dmesg_vprintk);
> +
> +	param->func(test->priv);
> +}
> +
> +#define INVALID_TILEID	(XE_MAX_TILES_PER_DEVICE + 1)
> +#define INVALID_GTID	(XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE + 1)
> +
> +#define PREP_TEST_LOCATION(type, id) \
> +	(FIELD_PREP_CONST(XE_LOG_LOCATION_TYPE_MASK, (type)) | \
> +	 FIELD_PREP_CONST(XE_LOG_LOCATION_ID_MASK, (id)))
> +#define PREP_TEST_COMPONENT(class, type) \
> +	(FIELD_PREP_CONST(XE_LOG_COMPONENT_CLASS_MASK, (class)) | \
> +	 FIELD_PREP_CONST(XE_LOG_COMPONENT_TYPE_MASK, (type)))
> +
> +static const struct {
> +	u32 comp;
> +	u32 loc;
> +	const char *name;
> +} invalid_params[] = {
> +	{	.name = "no-component no-location no-warn" },
> +	{	.loc = PREP_TEST_LOCATION(0, 1),
> +		.name = "reserved location" },
> +	{	.loc = PREP_TEST_LOCATION(255, 0),
> +		.name = "unknown location" },
> +	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_DEVICE, 1),
> +		.name = "nonzero-device-id location" },
> +	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_TILE, INVALID_TILEID),
> +		.name = "invalid-tile-id location" },
> +	{	.loc = PREP_TEST_LOCATION(XE_LOG_LOCATION_TYPE_GT, INVALID_GTID),
> +		.name = "invalid-gt-id location" },
> +	{	.comp = PREP_TEST_COMPONENT(255, 0),
> +		.name = "unknown component class" },
> +	{	.comp = PREP_TEST_COMPONENT(XE_LOG_COMPONENT_CLASS_SYSTEM, 255),
> +		.name = "unknown system component" },
> +	{	.comp = PREP_TEST_COMPONENT(XE_LOG_COMPONENT_CLASS_HARDWARE, 255),
> +		.name = "unknown hardware component" },
> +	{	.comp = PREP_TEST_COMPONENT(255, 1),
> +		.loc = PREP_TEST_LOCATION(255, 1),
> +		.name = "unknown component and location" },
> +};
> +
> +KUNIT_ARRAY_PARAM_DESC(invalid_param, invalid_params, name);
> +
> +static void test_invalid(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	typeof(invalid_params[0]) *param = test->param_value;
> +
> +	struct pci_dev *pdev = xe_any_to_pdev(xe);
> +
> +	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> +		kunit_skip(test, "requires CONFIG_DRM_XE_DEBUG\n");
> +
> +	kunit_activate_static_stub(test, log_emit_cper, nop_emit_cper);
> +	kunit_activate_static_stub(test, log_dmesg_vprintk, nop_dmesg_vprintk);
> +
> +	kunit_warning_suppress(test) {
> +		xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_PROBE,
> +			param->comp, param->loc,
> +			NULL, 0, "testing %s\n", param->name);
> +		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, !!param->comp + !!param->loc);
> +	}
> +}
> +
> +static int xe_log_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.platform = XE_PVC, /* with max_remote_tiles != 0 */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 2001,
> +		.media_verx100 = 2001,
> +	};
> +	struct xe_device *xe;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +	xe = test->priv;
> +
> +	KUNIT_ASSERT_NOT_NULL(test, to_tile_safe(xe));
> +	KUNIT_ASSERT_NOT_NULL(test, to_gt_safe(xe));
> +	KUNIT_EXPECT_EQ(test, 1, xe_any_id(to_tile_safe(xe)));
> +	KUNIT_EXPECT_EQ(test, 1, xe_any_id(to_gt_safe(xe)));
> +
> +	return 0;
> +}
> +
> +static struct kunit_case xe_log_test_cases[] = {
> +	KUNIT_CASE(demo_cper),
> +	KUNIT_CASE(demo_dmesg),
> +	KUNIT_CASE_PARAM(test_dmesg, log_gen_params),
> +	KUNIT_CASE_PARAM(test_invalid, invalid_param_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite xe_log_suite = {
> +	.name = "xe_log",
> +	.test_cases = xe_log_test_cases,
> +	.init = xe_log_test_init,
> +};
> +
> +kunit_test_suites(&xe_log_suite);
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index ff6a61f1ac7c..b462e75d4ad0 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -3,6 +3,9 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include <kunit/static_stub.h>
> +#include <kunit/visibility.h>
> +
>   #include "abi/xe_log_abi.h"
>   
>   #include "xe_device.h"
> @@ -13,6 +16,8 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
>   			  u32 component, u32 location, const void *data, size_t len,
>   			  struct va_format *vaf)
>   {
> +	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
> +				   component, location, data, len, vaf);
>   	/* TODO */
>   }
>   
> @@ -129,6 +134,8 @@ static const char *log_sev_prefix(int cper_sev)
>   
>   static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
>   {
> +	KUNIT_STATIC_STUB_REDIRECT(log_dmesg_vprintk, pdev, cper_sev, vaf);
> +
>   	if (cper_sev == CPER_SEV_INFORMATIONAL)
>   		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
>   	else
> @@ -219,3 +226,7 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>   
>   	va_end(args);
>   }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_log_kunit.c"
> +#endif
