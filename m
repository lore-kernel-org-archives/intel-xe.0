Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516B5C0219B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 18:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0F210E5DD;
	Mon, 10 Feb 2025 18:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJG/nffP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB7A10E5DD
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739210757; x=1770746757;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AkbvHSlsSssPgEIwzbw5fipNmSlXT9ytyF1gIZOFUQA=;
 b=YJG/nffPp6YayjUMkYDrrnNNmrip11/oXezrFUiezXDuf7sN2pLxeoa8
 QvzDjJsFyxewh9CYzgVTI1rcvFngacOnkfRnkKtFBpXFY6Gpx8WY3uhB1
 kLKM1TQ3EPMbFpTd4GgNl5B1OMgAS0yjlv7NYNEcGW4jo2O6pN/RAQ2ZA
 FhSwzxDx3gDk8qTyYWxcRyE95+qYw6Dh/s0CXyptXhmKEUfaQIgt/646/
 qunAm/NLTTssfGyfgqBn1qIqE7yjPg8qrgXk0HYVNJmNMHwwNafXSqJDr
 RrXgPciodE7sGRllXjB9Ib60q63F1xIuEJ2+sgZECoOI2cevgClnirT2P Q==;
X-CSE-ConnectionGUID: 5b6fKTeOSM2sYFUAP8gZKg==
X-CSE-MsgGUID: 6aul8Tk4RT+vsV/VpI6wQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="62280307"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="62280307"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:05:57 -0800
X-CSE-ConnectionGUID: 7S3DKmu0Tw+pNqYt+xumVQ==
X-CSE-MsgGUID: GlCKxS8pQrCMfnYCvMoH+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117339688"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:05:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:05:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:05:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:05:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2ZYxuiIA0kn96GxhenHgeor3l8PkALVI8ZEa6OsMk7KHoAMi3ynr+LDNIYN5F6t6INO8PkqIDITHdsFXiGabwxBR2urz6jZFnyZr5Ep5bRYqngMbQY0CCRHS5yJZSkbPtdA/VNNDSG6F9cgINRm093yuR611tZb+rtvsYWaivq7OM5+it5DEAb8LGOtUWhKT/qGo2LUXDpM6oNGMmlFLd1u0Bh6Q7qqzsd+FhP129uFLPstymF2wWxwLLmjgRnpQJKZMqEtT086qh/vEXEskVajguRQ5Jt1CwGDT8iA2YUSzckpz/XlaQht5ANAFbFn1KunlhB0afkr4DC+LS4TMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xCrkrn68ZpY7uTAjRHxdCORwcmQzbsJ9QDPck1Xf8I=;
 b=te6YpMrK1wErDO4XrCyHsw9e1QmW2FSxpNtiMkUp4hwaM47xdNbBRQVZybMi8g0wdKQX+RifoT0xf0ie1+YFp5q3Sm69s77tSeOhvx2Gi/WzovTauuLEgrVkqAy3UOQSGN2kAsw2hCCxX/9Af6aMZr3F4bR2lF8o46In80OwgL9pQ2xHzS7RyRkiRuys9rf+7IS8KxqFZOTTt13IpCr0ViI1iaDCb0ID2A+IkDDgQyQ1ODW3v65RqSGAqr+udHB5jkhPNtNy8p70W1pfWusrYCTMCvTaddUgIP890OW8lp0IuGciX8LxaY0Mc0L0f5vTog6i68qMJdtoH8ZzrxyaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 18:05:50 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:05:50 +0000
Message-ID: <0834da51-8b61-4224-a6fb-8b2f550643e2@intel.com>
Date: Mon, 10 Feb 2025 23:35:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] drm/xe: Stop ignoring errors from
 xe_ttm_stolen_mgr_init()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-5-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250207221945.2878241-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: aaff7249-ed5d-46a4-084c-08dd49fd8d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGg1WGk3MnhlRXFibHFHamQrcDhwSk5SdlVlRk1jSUhCK1hjSCtQU0R2WWl5?=
 =?utf-8?B?WnNRQnhzZUcyc3BPSmxUcEZSQjVqbVk5cTNqNThySkZUYWFFbmNYSHdDZWlD?=
 =?utf-8?B?ZE14Q3c3cFFNSEkzNWJ0bm0wNXZYYXI5Qkp5eGxSbyt1eGRyR0FaRmFMZGdt?=
 =?utf-8?B?d3l0aVV2TGcwMTJhbk5kWWp6a1o3ZzlJaHZaVER5UUhtdTRhQ1hHQnh3TlQ0?=
 =?utf-8?B?LzEzMUVWbXI3VjZLSFpaWEQreHByVDZ3ci9xdjJOeEtickk3NVZYOUZqbk5a?=
 =?utf-8?B?bXR1VjkydWxRbVN1OWNuRlkyY2NsNys5UmNPZFhUL0xaYTI3NTd1WmhYN08v?=
 =?utf-8?B?SlJnQk43cmhvd1BIK3F1NEtFRjFFd3N5QVI3K0R3Vm0zc3paU1owekczRmtK?=
 =?utf-8?B?VDI5M3pFbktoTGs5VEE1MHl1YytxYWdUMjVVL2NWbmRLYTJUdGlGTTlpaXc3?=
 =?utf-8?B?bnNOcldMdnNDcEZOYmNqOVpQTkJaNG1lVG96L0h3SWRRbzl3ZzZ5NXVkZGcy?=
 =?utf-8?B?SHJZUFpUVUUxWndoenRUd0p6Mkp2U0E0aWZnSnJvK0JmMzRjMWg5VGFTVUg2?=
 =?utf-8?B?cmZIQ2hFaFpOM1FWTmt1T0Q3NkpQWEZPcThLa1RpRVA3RUJQZTVYMXRoL0V6?=
 =?utf-8?B?TU1jU1BkMDhCc0ZoVmlxRnRYMXpiSnluZEJ2QTV6UWxOVS9tU1NBM2txVUk2?=
 =?utf-8?B?aTdhNXlHYXRBdXFoQWJGMmpEL1NHQUVZR2I1TU92NEpHdGc2QkhsbUxBdXhX?=
 =?utf-8?B?TGlPR084WVpGUStqWVE1UlZCeXVWMHN0T1ZtNEY0MjRLb05yY3o1Y3RBR2pZ?=
 =?utf-8?B?K1RFRlJMaEdvWmZHTmhrNGZIcThBNElHaEVPNnQ0ZG9lMFNkME4xN2Zyc1RB?=
 =?utf-8?B?S1VkY2IwWGFLQTU0SjdNUjFUaGx3QWFQMVJ2QTRMcDU4UDE2cE9JNm5nQWFy?=
 =?utf-8?B?dGN4Y29kOGpvV3dENnlTTkxwRUhnUEdtWlA4ZUJtQlR6ZlJidDEyVS9pTTFT?=
 =?utf-8?B?Yko1bGJ0SVljNE05VTMyakovK09QOFdnYmxuQ3Baa3Y1V2hZU1gyZGlqT1pZ?=
 =?utf-8?B?d2FMRlByVzlZR2VjcTlZUmJtT2UrempSbytjbE9Bbmp5dzdIMEdjMkNJdlJm?=
 =?utf-8?B?U2NIUzZYK1NUeGU3allFL0YwMER0N1NUK1ZEMFVYeG5Yelo4OTU5c0RXTDl0?=
 =?utf-8?B?VnRjLzNtc2xLYzJRQmdHYzlhTzE2T3BnVGd5NWdqYnE1YlB4Q3p0bE1KUFFq?=
 =?utf-8?B?bG9ZTUhqQ0VramU4ekhBVWZOWjlza2dDR252TFArVDY0eW9KcWlYM0hZRVZP?=
 =?utf-8?B?RTdBNHR2WXcyQjdyOUlKb0pyeWs1WG1GWngrWUxrbVVpVUdHWmxBYnJmRWl2?=
 =?utf-8?B?enNrVzJDZnBONHMwRCtwdndZQTJsUVJTdTk0MmZhaktENUNDMkdCYkV1RTZV?=
 =?utf-8?B?V1ZVVm5oK2lxM09tdjVkREJQOFdMZGNPekhvWnJnbTMwaTFRRXdvN2hxaHYw?=
 =?utf-8?B?Qkk4ekUyb0oxM2FBS1BERlQ0b3I1QTByVmljSlhSbmJVdllOR0UvdjJmNnRZ?=
 =?utf-8?B?L3QyaHR2ODlJR05TRDhsamhjU2hrK0lsYlNMU1Fad1dOdUxGL1FzbmR3djcr?=
 =?utf-8?B?dExReTRBd2ZVUWdTOWdXYVpZUzNmVUp0bHhGN2swU2czclRwSFdUMHRERkd3?=
 =?utf-8?B?eFhZRnZLdFdwVldRdUNGb0JBc010UlR0YUxxbGkzZW92YkcyOXVaYXBleWIw?=
 =?utf-8?B?eDI1UG05MlNrdFlncHNLS1AzME9jZFppL3B1VURuODBEbzdNNTBoMFFSTDNk?=
 =?utf-8?B?dzhRRytiVnpRMUxhVWoxcUFiaWZzdzRxTGNabjlQblVDeG54YStsQzNQQ0NF?=
 =?utf-8?Q?R8zHOmEeWF7to?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC9pTXZDSzh5M0ZMbjFublBmNkx5MHdTVHlaSXZ0Zk9obnFDWHZsbjhUWFla?=
 =?utf-8?B?Z3RlbGM0Y205dDJIMkMybmlEQng2emVQSlB1N1BPVzRIUXNkMjNrRElzOUpO?=
 =?utf-8?B?TkVScVpBVUZSTHlVdW11UUtLdzEwWTdObEVkbXZHNEpWQUpDVkdhT2pRN3o4?=
 =?utf-8?B?eUpJa0hNQmVEdWVETVhBbGdvTzdwcmh0YzJhOFBIYUpQdTNham82VU1Gcndk?=
 =?utf-8?B?Q0tTVm5GZUdLUmN5RmtDcVhBTkFMcUwvREJ6Mk1SdmFVMG9sc0NQNlBDYmRr?=
 =?utf-8?B?RnlFRG5EeUpwV3JzZnVjNlhqUFZlR2ZCQmZrc1dnNTQrcU9nMlZseSt3Y1BV?=
 =?utf-8?B?TGF1dEljTmQvQXRvaERRUjBwRDFLYytIMEQvS2JvR1dIVGFpVDdMTkZqWkZl?=
 =?utf-8?B?eU5EdUlVUWt0RUt4a0ViNVoxVzY5RzJJT2F0cjcvSm9BZ21sNy9VWkdQSkZY?=
 =?utf-8?B?RjhjUFBLbzI5WExPMWcrV2pZN245dHJ0bmNGOTdjbDlzaFVQRjJ4cEFwY01T?=
 =?utf-8?B?b0NhNExjUll3OHlEeHByUStzb01WU3pzQjlxc09YWlVoY29FaEh5NU5JeEcr?=
 =?utf-8?B?bW9hK2h6NlJCVFRhZS9sbU5zZWk1VHlFQkkwQzdEZ2VqK1RjSW9FRkpvRzhW?=
 =?utf-8?B?LzRHTnRvRElNd2YyN3JOamFPOUpGSjlZc2V6Z2g0ZmYxcUJOd1Y2aStlRUFR?=
 =?utf-8?B?R2lwbElZZ0ZHWC96ZFhVMXc2cTdPVmp4bFJsdWtqWkRmbi9MaFRKakw5RkRX?=
 =?utf-8?B?MFVWUnJMTmI2VDJqMm01S2U4MlYvWFhFRE5NQk5mT0J5MFovS0RvZnFyNEJU?=
 =?utf-8?B?cFo3MHZYKzY3UVF3NERZMFkxbWZiVlEvVUJlays4UGxiU3MzZmEyc2lMTzVF?=
 =?utf-8?B?emE4dk1vaUxSRWlNYXJDUGFNOUh6TFVwcDFEb3Y0QTNCVzZuUUJFNC8xb0Np?=
 =?utf-8?B?K3hHUVhQa21SeVZhVDVQTVE3OHgyN0piZU9HUmtrTVg5c2I0MFNFWkZhYUt0?=
 =?utf-8?B?L1I4aXhqTHlZb0ZqQmp2V055eFc5bDgxU1JJM1o5RDVpU2Q5MVppa2VRT1NR?=
 =?utf-8?B?aUM3cXRGSVhvbmk4SDRMZWF0dW55YzlYZ284ckJYOTZGUmpkRE5JREtsVUds?=
 =?utf-8?B?ZXRPTEFjd3FDUzU5bDM1QU41MUY1d3dNclNXOW81bjJQcm5UMDdYS2xzbVRs?=
 =?utf-8?B?Y3RkdDJ0eVpPZW9WTWhjZDIvNWFOODNlK29rUnZvWkZkbXJJRTk4M2RvQURY?=
 =?utf-8?B?Z1lxUDZGWTIrUElZQmpnemlnaTdEUnVicVFLQk1UZ3IxRjhiRG4yQ3A2aTdx?=
 =?utf-8?B?YkVsTE95K05zeDh6Y1BvaC9ydU0wZFJ5czRVZFBRV1Z3RGF1ZE1VZXJCZ1Zq?=
 =?utf-8?B?Ukl6ejBJc0xjbzUvcE1lMU9wMjZBRVVLcW1vRDlmTENqVFAvOEZzbDlyRnpx?=
 =?utf-8?B?Y3NXa2RFcXc2eURpekpmcmovS1JZTm5kYjNjcGlLbi9oSnJXcFlzMG4rQ29w?=
 =?utf-8?B?Mmw1cHUxdUloSFVES1k4b0JZV2M3VGdjUDFuSGxvYmR2YVhTWkh4KytrOWFT?=
 =?utf-8?B?M3RTYjRQRTFwMXhxTjBFaTNtY0ZDaHRSZnpmZEx6SGxxYmV3b3U1aFNUYTlX?=
 =?utf-8?B?eFlFdnF2Sk5hR1RkVGJMZExUdWdsSnZpMkExbHN5RHVHOHhZUmJoTXdkNTAz?=
 =?utf-8?B?Y01mek1WZGxwWHE5RGtvVks2REZVWnpudjE2WGZkSEFFRXk4a0FXYjlJMTFV?=
 =?utf-8?B?eGFHQ0JaakJqVG00TU9NK01qN1lPeUpvc1ZFdzZDMUhVcGVqM1BiK3QwYy9U?=
 =?utf-8?B?cFdNOTB1aVRGTE5ibjFRL1lVSzRJTzlWTkF0cndSN3VuTnFuaFVGUmFSUVJn?=
 =?utf-8?B?WmVxajJZK05ONkhHVkt3clFXQVRjbWZKZWZnbzdZbTNDU0Rydlp2dnd4VUh0?=
 =?utf-8?B?QU4xZU9tM1Npc25VQk5OQzRmNVY0aVlMSkMxaFo5bXZhM1Badyt4ekxuZHVx?=
 =?utf-8?B?aXZWbnBzSmp4NGlQTjFweXZQcUZXK0lHdiswNHBFMVdKNkx0eFRuOC9xYkdJ?=
 =?utf-8?B?RkFSSnJZQ1l0SXpyRm1xL3ZKWVVRU0kvVnV3VVEyWlM0N21kcTlsaVl0Vi96?=
 =?utf-8?B?c0RDQkppM0tRWCtwRWN1WXROQWhOTW8vNlJqVUR4RFdUbnV1SHlWa1c0c1dR?=
 =?utf-8?Q?r5eeOYilZIGX20kT5IbmGMc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaff7249-ed5d-46a4-084c-08dd49fd8d58
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:05:50.6547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HNxKCHvUAjnOTNSzvI0nQRfHibLTLYnwxu16mRRzq7pxwhks/Xfcure1wOGG4/sLFrc9CK7mpX0B4u0ESygRRigkJyNkQiTeOjEjNu+44k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
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



On 08-02-2025 03:49, Lucas De Marchi wrote:
> Make sure to differentiate normal behavior, e.g. there's no stolen, from
> allocation errors or failure to initialize lower layers.
> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c         |  4 +++-
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 17 +++++++++--------
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  2 +-
>   3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ac3e344fe04ec..9c97f88bc0455 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -827,7 +827,9 @@ int xe_device_probe(struct xe_device *xe)
>   	}
>   
>   	/* Allocate and map stolen after potential VRAM resize */
> -	xe_ttm_stolen_mgr_init(xe);
> +	err = xe_ttm_stolen_mgr_init(xe);
> +	if (err)
> +		return err;
>   
>   	/*
>   	 * Now that GT is initialized (TTM in particular),
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 423856cc18d40..e1a1200fdf22d 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -201,17 +201,16 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   #endif
>   }
>   
> -void xe_ttm_stolen_mgr_init(struct xe_device *xe)
> +int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   {
> -	struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_ttm_stolen_mgr *mgr;
>   	u64 stolen_size, io_size;
>   	int err;
>   
> -	if (!mgr) {
> -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed\n");
> -		return;
> -	}
> +	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
> +	if (!mgr)
> +		return -ENOMEM;
>   
>   	if (IS_SRIOV_VF(xe))
>   		stolen_size = 0;
> @@ -224,7 +223,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   
>   	if (!stolen_size) {
>   		drm_dbg_kms(&xe->drm, "No stolen memory support\n");
> -		return;
> +		return 0;
>   	}
>   
>   	/*
> @@ -240,7 +239,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   				     io_size, PAGE_SIZE);
>   	if (err) {
>   		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
> -		return;
> +		return err;
>   	}
>   
>   	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
> @@ -248,6 +247,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>   
>   	if (io_size)
>   		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
> +
> +	return 0;
>   }
>   
>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> index 1777245ff8101..8e877d1e839bd 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> @@ -12,7 +12,7 @@ struct ttm_resource;
>   struct xe_bo;
>   struct xe_device;
>   
> -void xe_ttm_stolen_mgr_init(struct xe_device *xe);
> +int xe_ttm_stolen_mgr_init(struct xe_device *xe);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
>   bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);

