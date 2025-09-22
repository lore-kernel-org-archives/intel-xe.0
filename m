Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B916CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 14:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7310E3E1;
	Mon, 22 Sep 2025 14:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrC5wn8O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3A010E3E1
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758551972; x=1790087972;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9KVKCGQ4rbvWhmGzNqfADlEduT0TbFilVEHsI9mgiYs=;
 b=VrC5wn8OIV+1vKiBAHXjnZ0gbRgpDslQDJQSFpl1SgN5zaSBaTIvQenu
 zd1sS2zBhxBCZDacxtQsLiXXwcqlmblqcd8uWQbuvgVfhDHToFRhlicyc
 B6NfiH+VoubtpLQRjR7YzjHB1dlRHz1OAQY7U+J4vcQRHrU+DOQUZRz7T
 Q10NR78FoT4PEGdBvlt5ycjNX5DRZzKBXKlb0XyK0iOyWx2vPaS/y0s3B
 I0LH7T2uK9VnrxST2au95i2E8QYRLYZ4IqAeKWmKLRAZ5L9QPwmtfBDWw
 7dFHUSP4jMM3n5+vEN1m5kdvFk9tjR9LadAbJmk0rVfN5UiOmuMGTN1RY w==;
X-CSE-ConnectionGUID: EnZCLx24Rb+AKkdoNV7RNA==
X-CSE-MsgGUID: c4BnREvdRUmKgO87jEVmyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60702196"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="60702196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 07:39:32 -0700
X-CSE-ConnectionGUID: +Nwgw1jHSWaP01b4x0Iyxw==
X-CSE-MsgGUID: +cKfWvC7Rgidm2RETTZ9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176319317"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 07:39:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 07:39:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 07:39:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 07:39:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htTs5t4lzGeRrr9U61rnGX5893NZNASyqgMZ4qfirmKpFcFGE7PytPSQEWCdDFIUMsyZZspyqlo93c1bpf+Mji/L4dd466oEgD7APcI0V+0xWC4zUhAqCdjbH+V1rA0Nubk7JbFSQalvSaIKDdDc9h5uyDgNUIHW1asuwrt1CMGdwtseekdz2IZ/6yywhUUc2wABiopTL2zKhZ1K6kWOxwQnucEIciCliacrim1ZrfpTIYmjzO/IlODT7GU9wnscfZFbPUHXaSw9kfPPZpDCVFTLHxx+TVcj77BRYtWs87Zh8fcPLyanfQDCQ/OSwL+RRUDNUui/qSV6vnBbt9ndCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SczMCzscJq+wuZEMNEZLAxbLabMjQeTwM8iQFX8vWIs=;
 b=iPcjno6ZvrDQzfJtARkTGowI8bqu4LnkyxesXuEowform3euF2vDyv//t03GjzbRzYznsJl8ojTR8dIQmIWSoV9+FD5O5CXFOh5srGKnlVALyqD/pMIDIX3lypp5H9gM8A/B1Am5MrefIo9MlShJHs/lSlYp6eo1OWdNa6WSAzEtcL7W03S7xjeYr9fqgO9IjYE1YJ7wVyhfbe3L/kBfCP38WmHdaH+XEdF6G37/51VW+sHspbGpijpD4qHVUv3Atq0k0BwBkPjf/hsCYqd8t/R+hvC0K3s8YBBDSmWUgnDdCPdKh+RXm/+0LvBtNHV0hYIzRuXRn3vB1QeF4YN4rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH0PR11MB8144.namprd11.prod.outlook.com (2603:10b6:610:18d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 14:39:28 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9137.016; Mon, 22 Sep 2025
 14:39:28 +0000
Message-ID: <2cb7594c-7280-4bc4-88dc-d8966f6fec09@intel.com>
Date: Mon, 22 Sep 2025 07:39:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/huc: Adjust HuC check on primary GT
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250918211319.603324-4-matthew.d.roper@intel.com>
 <20250918211319.603324-5-matthew.d.roper@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250918211319.603324-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH0PR11MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 716021a2-da3e-4ccd-e3b7-08ddf9e5d53a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ams4MVJqL2NaWFhxQWdKZjBIYlRGdm9Ja0VqeUtDUUx0T2NQVTNySm9odjlP?=
 =?utf-8?B?cERIdkMremZmUkg3OHF3SzlSdmxVaVhQYi9SYzdXbHdXT1RST3ZDUjFIbmJh?=
 =?utf-8?B?bFdCSTBRbEdydHJXQmNxUGtJc1hWeGdINXdqSnA5eTE4blFpVlUrQTJPc3h2?=
 =?utf-8?B?eGFWVi9LOE9kajcxay9maEFtaHp2V0NaZUNtSHA1QWR0M2pvWGcrWU1Jc0o3?=
 =?utf-8?B?d3ZrNUROUFh6cWViNm5YWldIcng5NXhpcjJoZFNIV05ORmF0OGk0dURxWWJ1?=
 =?utf-8?B?WEsyNy95TTdmdjIybG5qa09MN05pWTZOczREc1Jxb1pwS2srZCt2VWRxRHc1?=
 =?utf-8?B?Nnp6eEFUYXk3MVoyK2NiTUZnV0xDMXplMlRFQURzSTl4cFIyNFBJT05tRlNJ?=
 =?utf-8?B?SlpDY3lza2k5Mi9ORHVORlNybVYzcVVvYjlMelNQQ0IrWHA2WGdSTWMwd2dO?=
 =?utf-8?B?aG9TV094VEpsS251RDhYdzNaYVFrRWZlbEE1VGx5MUZyT20rVnNlSVBlNkZv?=
 =?utf-8?B?NWpVRGtqVFpIM0hsT2JZSmVZRi8rOGVxemw4QWdEK0EwdVhFUXpCNU50b1lP?=
 =?utf-8?B?N24wMEo3UWRvaXAzdHI1NkgvTXV5Vjk5Mk1wdnQ3SzRPS3hHNEM4eWREdDEx?=
 =?utf-8?B?NzE1cExxZ0doUlBJNGVBWVMrWUJaK3p0TkhkRXNuZ2JnTjMzRjhOSlF1NVR0?=
 =?utf-8?B?OS9CbUQvdkkxSExhV1hLaFBhd25ITVBRNytiSExKSmxjaUlRcVhFZDh0NmZK?=
 =?utf-8?B?L0hsWHRyWEdMUWxSSks2b1BiNWk0cmtFUll4U1V3a1hOTUIreUNxandzclU1?=
 =?utf-8?B?aEY4Y2l4U3FIUkVOVTlLYmlScFJUVHZIcGFLQ1o4a1JIN1g3OCtpRDlSUHZz?=
 =?utf-8?B?RUtsZ2dac2lMb1Y0ejYzU0tjekt5WkxDZEZoczVkdGs5eW51SE5sWldydDhR?=
 =?utf-8?B?TGpqTUhwTzgyaS9EN2Izc3VHd0NHKzI1VzkxdDE0WWpSaW96QVVxVXg3SHV3?=
 =?utf-8?B?bFdKZ3grTXlydHZDVVlKbHh0OWs3dlg3d1Zwa2ZWaFlIN1JOVTJuMmt0U3JB?=
 =?utf-8?B?NXQwU09SSENveG9KOVUrV3VJN0ZKMEtZRHRqQ1pyMkMwOXBYdE9qYVJlbW84?=
 =?utf-8?B?ai9RR3VhV2dGVXRMcWFIbXhrZ3VEVDBzQWUyeHJxSGxGd0tzZkRxa09LbzNU?=
 =?utf-8?B?bW1LcTdEdElxR0cwcytLUFNDVmxXRjZucWlxRC9wdGNiS2hBVzZ1NHNCUytH?=
 =?utf-8?B?eTlDL3NUUW5VVk5SWEZSdGZZL2ZRb01ZMjdFdEVSY3JXanN0WDJWNlM4QzVZ?=
 =?utf-8?B?aUR1eEdZMHFtRzBSdWI4TFc1NUp1RTluWUh2WERDV0UvWlJPY3NMQ3c1VENm?=
 =?utf-8?B?SzJGUUtJdWFDYThnTnU0dkpKb3dBc21GZEdRa1FURlJhNk9pdGRIRFFIdTFy?=
 =?utf-8?B?S3BILzJzZWlqdG5mb01rSU1nTXF6L2lmaXlGcXpLN1RnYXVUeTVVZmFMeUlF?=
 =?utf-8?B?aVlJODZIekxsamR4a25lYzZBYmpPZE9sTFpJakorOENXeFk3bW9mcHRCWlRE?=
 =?utf-8?B?YjFZaWRTZXYxM3RYNFdzdE5KL1k0N01oOXk2cGljckNtQVFKTnoyK1V4VW1v?=
 =?utf-8?B?VGpxazdFN2ExeTZYSTZzNmFrTzYzWXJXQ3FRdytjZWJzUUhKOVBLNlc2Mzlr?=
 =?utf-8?B?SjJvU2dQanBYQWJ1ZWxmYlNQV2NldTAwOGcyMnNiU2pBTlRiK2ZJaFNxYWNZ?=
 =?utf-8?B?eXNSNHl6V2FRazczeXE4bGh5Q3pWaHBteEhFY1lpZzdRaEhhbEM0WGh4aDJm?=
 =?utf-8?B?VkgrWGJvTzNUbi9SakwvUTNGMzFyaE9CUzY4T2dMWGhwMXBuaEx1TS9XQkJw?=
 =?utf-8?B?cEIwQW5LZDFvanl0Y0RCTXRyQ244Y21OU2pndUpXc2I3ZEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHFqSEx0N0ppcTRPTXhsczB6RTFBWXBmMUU2K0ZHSmZEbzdsY1JDZEFJRVJt?=
 =?utf-8?B?QzdPaHA0TlY1NmRXYVlxWXcvSkFaVEdpZi9PYVhEQjY3d3psYkVrMDVIaGhp?=
 =?utf-8?B?RWVsemd1TWl6U001TFhCQ3pIanlFNWdVcER3WmhZK0FodWlyU1ZRejZETmFI?=
 =?utf-8?B?U3FLRWo3MUU0aGszUHBIb1gycm9mbHdDTVovVHN2UHE5WDhDTnFObmtmUGpH?=
 =?utf-8?B?dUlUUHhOOHdqc1RMcEV5VnJqUEIvdlZSVXVYQUdqMHNUdXVZYVkvRHl4TjF6?=
 =?utf-8?B?RTJ6MXZRQ0V2VEpOU3oreTZkYXlhem1NTkJwY2RubVdZWTYwdHlQQytHYmZM?=
 =?utf-8?B?Zlp5VVJKeHRMK09yVjFtOGxxVVRrOXhKN1Y2Y0wzaXlKU01Ody9uK1Y5d291?=
 =?utf-8?B?RTJjdEY4TWQrTEdmVU1Hd3BJR1kzUkNISTVjMjgrZzUwdFlMV29EZUxrQllz?=
 =?utf-8?B?VHdwZi9vTFEvNUhHZkNCd3cvaFJsa2tkWXBxRGN4ZmUzQnlPeXlvcmlpUWg3?=
 =?utf-8?B?YzRmY3JQM29jRUhURVNkU2ovd2ZOeVFtT0hSVENGMG54ek5HREM3M0pWMU9a?=
 =?utf-8?B?VUdiUlVSTXRjWFpPaXRIRmI3RHVEb21PVlR1YW5xTkVncE5EaWZqOVBJUFd1?=
 =?utf-8?B?bFBuQmFLVTVGWHNwbDNMWTJwN1hLK3c0eHloY2VjVW9GR1c1ZkRZRUwwQWlM?=
 =?utf-8?B?VlVQR3RKcUtaRytxNVBvdmJRQ2hyRmRYYmNEUFdDblN3Vnl3cnZlQ2tHRzR5?=
 =?utf-8?B?MThLZDg5ZEd6VDRNVFl1bEtZeThWY0xQank3NVJhZ3NvSThRME1MOUpVQ1dX?=
 =?utf-8?B?dmlGcFpsV05mWU9mQUNFbnBQWk5vODkzb1dRWmtDeWJCbjhlWkJwNHc5bDVa?=
 =?utf-8?B?aktIWHpyM1JxZ3dleDk3WUlpQjJkbUNzcVZHTkMrQ0l6Y3FpVDZTcHBPSlll?=
 =?utf-8?B?WS8vUko2Q1kyRktrYkpacTA1OEpwa0ZTOUU2S2lZYmZMa0IzSGFJNzBsZzh2?=
 =?utf-8?B?M0VTRGRJZCs5MkErNmtBRXIxRW1qOFhLbnpsekY0UEJ2NzBUUU16Z1NXMkJE?=
 =?utf-8?B?UzdBQVVJOU9SWFcxS0hWOVcrVTlZT0xmVGFXNVI2Z2hjVWNHR3AvTlY4K1E1?=
 =?utf-8?B?Uk8rK2F2bGFiTFRrWk5SYXA4S0ZjYkpjSXJTcmoxN21raVNXYXFtNVJhcVpx?=
 =?utf-8?B?eGFpNGhlWFgvWU96QUZWeVh2WlRjVEdFTGUrVmZNLzBZZEtZaS9BNS9kK0xl?=
 =?utf-8?B?TmhZWVk1MFlWb295N1NOdXJURTdqSW5iWHVjb2FEeGRzY0tsVndVa2pFTU5C?=
 =?utf-8?B?UkMzRGw0SWc0RWJ3TUs0bTVQc2dqMys5Vk5LNUpsY0ZXSGNUbEVaQ1JRQ044?=
 =?utf-8?B?RnJSbHdxVVAxYjFwYzBNTnRxNHA4MFdLK0MyT3pNa0IxaXQ1Nlh4R2VnNU1s?=
 =?utf-8?B?NGl2V3hRYS9kSnZaNG1NcXpiUS8rZVVJQUV4V0svSDVxWmdqVm56aU01Umcw?=
 =?utf-8?B?eXRGQVRmWklVaDNoYUdyUTZpdCswdVRuS1dpTGpxUk5yVm93VTlhVkJ1cDhy?=
 =?utf-8?B?a0V4OEp5UVZKTU1rOFk1cTUvWkcxSnNOUG9XVDl5cDF0U211NmNJTHRqeXRj?=
 =?utf-8?B?YWlIZmpKWmFDWVhtMHVKN1FsV3J6OEZUN0JzdWpiOXFGY243blJtT1pRN1Q5?=
 =?utf-8?B?TXQ5M3lpc2N2d01qbW5yM3ZSNmVwdnZZamVZNHVtZGNJVU1HTlZuc2NITUZj?=
 =?utf-8?B?ZmZGaHpRYnlJT0xzd1V0M3htOHludDViaFhpcCtYZEpTalFtTEt3dm0wRUdQ?=
 =?utf-8?B?dDZkSDAwbVN6M3h5MS9vNzBnZmxocFN0Wkg1UmlDaVpWdUEyS3lFOFN2UWtJ?=
 =?utf-8?B?RVdUMnFzekFJc1lLbnprZ2wyaUNLZTVFTWw1Y3JFUmhwWU1hdFpXN0FzeGNL?=
 =?utf-8?B?dVRRdC9CRHV2aktvVThJUktRKzFXNFRzZkkzcTdYb292eTNvQngrRi9SakJE?=
 =?utf-8?B?blZyM3Q2cmZMZUJsRTVWc0pMU1EyOXE2aDdidmo5cXVoTmhyTXQzcEljQTVi?=
 =?utf-8?B?L0xrZDB1TitnVnVaNXF5UGpLMjJJUEVIOU1nSzlSM2dGMnlzQm4vbkxZYWVP?=
 =?utf-8?B?Q0dPRGhQWmZBVHYySVZtQWVKYmg2b1U5V1FNYzB1NEFrQ1ZxNjBGc1BGaHFW?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 716021a2-da3e-4ccd-e3b7-08ddf9e5d53a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:39:28.1822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io3fVK6HyBhRoswirLO4AA1NG69Y/3Zl4j0hq3Kye6M7nECS4841UR6gHRaBsUrrPsqb580+b0jNVuPaY+peRZsVnaz9paJfyZJi9mBKYGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8144
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



On 9/18/2025 2:13 PM, Matt Roper wrote:
> The HuC initialization code determines whether a platform can have a HuC
> on the primary GT by checking whether tile->media_gt is NULL; old Xe1
> platforms that combined render+media into a single GT will always have a
> NULL media_gt pointer.  However once we allow media to be disabled via
> configfs, there will also be cases where tile->media_gt is NULL on more
> modern platforms, causing this condition to behave incorrectly.
>
> To handle cases where media gets disabled via configfs (or theoretical
> cases where media is truly fused off in hardware), change the condition
> to consider the graphics version of the primary GT; only the old Xe1
> platforms with graphics versions 12.55 or earlier should try to
> initialize a HuC on the primary GT.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_huc.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 7e43b2dd6a32..0a70c8924582 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -66,14 +66,18 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>   int xe_huc_init(struct xe_huc *huc)
>   {
>   	struct xe_gt *gt = huc_to_gt(huc);
> -	struct xe_tile *tile = gt_to_tile(gt);
>   	struct xe_device *xe = gt_to_xe(gt);
>   	int ret;
>   
>   	huc->fw.type = XE_UC_FW_TYPE_HUC;
>   
> -	/* On platforms with a media GT the HuC is only available there */
> -	if (tile->media_gt && (gt != tile->media_gt)) {
> +	/*
> +	 * The HuC is only available on the media GT on most platforms.  The
> +	 * exception to that rule are the old Xe1 platforms where there was
> +	 * no separate GT for media IP, so the HuC was part of the primary
> +	 * GT.  Such platforms have graphics versions 12.55 and earlier.
> +	 */
> +	if (!xe_gt_is_media_type(gt) && GRAPHICS_VERx100(xe) > 1255) {

Since we can now match a FW definition to a specific GT in the FW table, 
we could change the HuC FW defs for MTL+ from GT_TYPE_ANY to 
GT_TYPE_MEDIA and just remove this check here entirely. Just a thought, 
not a blocker.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
>   		return 0;
>   	}

