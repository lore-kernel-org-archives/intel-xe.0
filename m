Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F249DC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 09:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597310E072;
	Tue, 23 Jul 2024 09:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTQUsZet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4310E072
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721726943; x=1753262943;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XHvU+xsPaaQwrNmcsyNhC8Vf85Yn+dIs0MECpPFSX6s=;
 b=QTQUsZetvIgrb5ZzCOoESHxfD5d7dC0z0ZQZR19rr7ik1dpNma6WjUtT
 qPkH6LR3FvZLGqbvfFzyymwiKyxpuaGN6wpYE7FqgGikSGRhTEoVxc+v0
 QA5uT1xqWn2iR5RlYy8kRYRrHshPshTRgG37xcJCSbhutM7nwoquEmBVf
 2oM0+jSG+DRvm2pzDRJn8s+spLuSePI3fqBZPlN2qFrRNZZowLmLwezBw
 GZt+RvIAGiBQoY2rIsQCEituCiDr8YewfNQSGBp0WLs+1+RPh9EGPpi/U
 j+T33MmS8p06HA2hHxyRDjP12UdtjASQUcbOoDvP3al3G5Yzjuz58X3cT Q==;
X-CSE-ConnectionGUID: nxbqUFtOT9GDbWxxeIKB1g==
X-CSE-MsgGUID: p1FJ0a3wQoyao3rhuB3v1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="36782121"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="36782121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:29:03 -0700
X-CSE-ConnectionGUID: eNkLNoJ7SHiiG7nDN7lBKQ==
X-CSE-MsgGUID: 0+e5HgoDRNO58gngFeF5RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="56475676"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 02:29:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 02:29:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 02:29:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 02:29:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRcyOoo1vTHc1hoUpMR5dBMW6EO0xMuDV0w4K6qFPtfanOAbYF7XFww6H+atpXCVjcsJA6matdrPNj1Wt323igv3YT+zV3q3OcYet2nvXS7ag0W33p65l/osEH2qsj+UWUUMRO3oMUK34kHWCr5/NLSqnQShhZa2CUKWEn0xYku3zvL+0SIbZd57LbHao8J2tGK9LQyHzOZRMGbEZZOf+gBK9HvW/sWAVZTP0cIuK7T2awzzveJ3aT57xFQYsLko6J1JB8l5wdnYx/45JBdNqshHcmX8BwirOMzCQrpeHOuK2rZNK1+CIs2YCBb+ekjapasxUP76FCG7KT+53DzzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hx5c692pDKxPnPg0LR/rJpT6Rclm7+sSIEJ6cPL49Dc=;
 b=ZgkcM68P6SeUzmrOzfXpKLko82ipDnTl2RplrWK/E/ZnaQB9Kp6PY+wll4QrLMTSEi2kvtsfpAS4OeeDOZ0EI0Y5y9x6Ya8jupaB0EKBX4z/ji5ZxhtZ8krS4e8pRZIdX8aNbh3OPWNI/WIxmEQB1EjXCWgd321h7MDgmA7f8sMYyTl2Q1K/EQKKsjy4qu7tDtrtaWZzunZU8frDjbm+bcJbK7SuTdWU33K40o5LznquwbfPGW61Z7eXzqQc1+QhK9PYyGahsmaOOwtDQUqSujxOy8eQUd0XBIMUzcJ6MprFhB39+DEYqZBkQRNyemenlJIrO17NnhAMjLwkTCnOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 09:28:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 09:28:58 +0000
Message-ID: <f815e741-3578-404d-8eb9-099bcb3f22b0@intel.com>
Date: Tue, 23 Jul 2024 14:58:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add assert for XE_WA() usage
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240722160815.4085605-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240722160815.4085605-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: a67dc482-85b8-4996-dd9d-08dcaaf9e138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amZoZi9MSXF4OXFUd1ZVSm5mbHAwQnEvMDRRR3ZKbHJ4VnJsRjFvdGRDcFI1?=
 =?utf-8?B?dHVlWS9CbHBod01aMVVkOGdXdjVZekM4UE5jeXZvUEZRUXZYamNnemorTzhr?=
 =?utf-8?B?WGlKM0FGL2xSQWhXRURHb0R4SWVOQ2ZrcmJBZGFYdzdid0R2TU1DOUFTa2Y3?=
 =?utf-8?B?NXRWaTlWbDUvczByc0RGZ0VCaGFpTkhXOUlPSmZlZW9pWHo3eDZrM3JDZjZ4?=
 =?utf-8?B?VWk3ZlFrd2xOTm8yMDU0OTZ6WXU4b3ljVkhPQWtZOWlQV2VtWVFZZ1JoZ201?=
 =?utf-8?B?S3RkajV0TG5iTytrR1QwU0tGc1JnZW5lZklSeWdOU2FMUkdRQVJ4TjhhK044?=
 =?utf-8?B?SWo3RDJlaXQwNGt4eTFqRTlDVmNEODJEb0xSeTFoVlJjK0hpeHFZVnRlRE9F?=
 =?utf-8?B?Tk1KRVIzakVuVUZTWUsvakw5SmM5V1JNRCtjcUI5VWRnVXJBVjlxaU5hZy9u?=
 =?utf-8?B?a2c0WG5NR242OUJnTkpJbWtBUVNQUmE5NTZhc1owL2JTNEp1cytCME9RYnpT?=
 =?utf-8?B?ZGh3VGdnS2h2MWRnK1h5cTgzTU9GYVEvNUk5blI3OERKZERHT2N1ZWNVcGhW?=
 =?utf-8?B?aFUvdXNESk52QVE3YlFUZm9LQktpSHRGWko3c2dVUGVFeGZZVGhhbmk4ZG1T?=
 =?utf-8?B?US9BSjZ0NXB1d2JZNUsvM285QndhWUVqdkZqckhlMXhpanYvRERiMS8rMGZs?=
 =?utf-8?B?R0hEcmcrMTdtelNqSlBrNTFYRUFVWkcrWW1YM0ViUHJFZWhBWWxHUzUzbTBN?=
 =?utf-8?B?MCtNWVpwdDJMSGNBQzhxSFN5TXJBd3hBL1F5enB0U3J6aVdhZGJQaDNqbWZv?=
 =?utf-8?B?dU5GSmhUOWt0WWgzTlg4Y0hvcUsrRlYzdE5pTlVWdnd3c0x6aG9vTFltd2R3?=
 =?utf-8?B?Vm9OMHZDZHl2RnVsMkhIKzdrWS9WYW9OejlLVTMvVElJQnNoOU9pOTZvdUxG?=
 =?utf-8?B?aWpKSDZrZ05objdZNS9yUU0vSTZ6b2ZIcHAySU9TeWh4UTN0bnJYVW9qUEdr?=
 =?utf-8?B?ZG1IMW1PWlZmTmlCNytMWnZSMUZjYVBONUtkL08veEZudythVHQ1RGFrWjJX?=
 =?utf-8?B?bmFEdzU2U2swbzErMW5tNFgwcUljaDZPdzREYi9TclJRdE9xZUpzWkR0c21H?=
 =?utf-8?B?SG9iWklTL0tYNmdYaUdSaTZCRFpUNHV2UE15MXd1eWdmVGsyOElTOThFZ3pm?=
 =?utf-8?B?aWlITWQ3NngxeEZ0eENab0picW9ONXM3Z0V2Ynk0YTM5Y3pqci81QmVoNmgr?=
 =?utf-8?B?QytTNVZlM0lFMmNHL0pPVUxOR1RtWjJ4QkVPaWg0b0N1cmdNZzBTYnVGQXRJ?=
 =?utf-8?B?ZjFJMHljY1l4YXRsc0huNEJYYUloVzFmTHcxblV0WFl6eFRkMll0aEYwMjhV?=
 =?utf-8?B?M2VNQjEySEhyWHVDZWZpeXRnSXg4YU1yRmRYRG16b3JucG1Pb1J3MEtRQ3Bo?=
 =?utf-8?B?SXNRZWZNNTNROG16NjI4S2hYdnM2MGRGVUQrZFhqbVZjcUsvbzNjWktxTTlx?=
 =?utf-8?B?dDN1MkcwT0Q0SzdXYTRqelhHbVpsWXpDMDNWcjBMME40ZGdLMGxCNEFOb2xR?=
 =?utf-8?B?TmtUL2w4RWV1d2VMYTVnMGRDcFYyaVRNUVhVbmU0U21JUEhDNnUwdHBjSC9U?=
 =?utf-8?B?SlEvakNIeW56Q0FHSHY4YjBhV0U5SGVScEFzczlpV3o5dW9hTjU3Yk0xTzNL?=
 =?utf-8?B?Q0xYeDJMZHQ4ZGtKSjVkd0FXMTQ0aW9YTm5OWWM0ODhEbXFyRTJVYStrMEU5?=
 =?utf-8?B?YmlkUGxUb0E0dHBKMFVNQ0Y0TjBwRkV6VzV3TVlSL3pVTDZNaFRPU3Rwb2Fw?=
 =?utf-8?B?ZFlVczZyb1dpRGJ0TmhMUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djRhd2NQZy9YMjU0empibUQ0TXA5Q1dETXFTeEZuZWJVa2NTVFBsSkMzNWQv?=
 =?utf-8?B?UFRDWm5DR2lXZnZYaDFhQVBQcVdpWW1UbmsrS3FIVS9SUXRZWmhndE8rTlU1?=
 =?utf-8?B?ZCtmeS9HTUNURTFrazhRdTFpSlMyYVJyUFRySjFFb3NKdFpsdmJPbkhTQmpy?=
 =?utf-8?B?VHFhRTJJbFZVM3Rub2ZWWm5TUTI2NlUvV3dodThpUTBxTEFjZFVoak1jQm43?=
 =?utf-8?B?ekVlZXFyL3MvVUdKVDcvQmZwVHdvTnRReUVXSVVVZmZLdWg1aGwrQVo0bjlh?=
 =?utf-8?B?Z1hISkFObTFFWW5xeFlsV3JFbHdLbGpSUllPVGpWTi9ad0k1d1dteEJxREd5?=
 =?utf-8?B?dllkdUU1NFhySVY4dnErS3NGaFZ6bmNRVnc0TUxibjBZNDhWNHE1a0JkNFoy?=
 =?utf-8?B?SWE5em43cWUzZHVmcmsrOU5idTN1Rktoby9QVWg5c2kybWpJWHdFbDIvZ2E1?=
 =?utf-8?B?dFZXNlZhNlZFblY2N3c0UlVuUmJnTlJJeWlGdWp2Tjh4OFJTMlZrV2NrY2Q5?=
 =?utf-8?B?RDc3ZTQvalBQWHZNMityQ29NN3g3bUZiUWhObllTMEtjWjdnU1RjWjJjQndV?=
 =?utf-8?B?ZFVCKzB5Z0twTWxzVjBicVpQOCt4WExKTkI0OTkwcHJ3RmJpVDVXUXJNS0to?=
 =?utf-8?B?QWw1SUg2dER2eVlFN0RvekdjRWRvTU01YUhDb0RVR3N5aGs0VXp6MTRiTTBX?=
 =?utf-8?B?dkxrMDU4SDZKZzZBWHNQakFFRk9TejlIcWdSaFNlZVVudmZhYVc2VldqUVBV?=
 =?utf-8?B?ZXVaMUp6RWJrL1UxU20vTWY5eUtiaE1xcGZFaUNmbGduYUNvMi9hVU5tcWFv?=
 =?utf-8?B?bEcxM2Nscm16bUk5VE5ZbWQ3c043clpzbU9zeFFwN2FtcFB5SzRpSSs1WHE2?=
 =?utf-8?B?cUVTekx3d2hGY0ZqbDF3MFdaNE8rSnoyZUJMd2xDQmV1ZHI4eTlwcG5vREx6?=
 =?utf-8?B?VU56UkpJSHFSc1AwZ3RpQmlvc0o2cjZLNTZkUzJxcXhtTkZsdktSUXVLT1VY?=
 =?utf-8?B?SXNwOWZSeEY5VWdtWEtpZ2dKM0xZT2N1alVMNHZRWmlZUllSS2E1L2VBTTEy?=
 =?utf-8?B?NGlJY0VsaWFpQ2NXMXVDQ3ZrR3FyNmx6SDV0UFk2eUtMRDNOcy9JeFErWXhP?=
 =?utf-8?B?UUNxSDBIVVpsVWhCajBHMjd0dnhYb0pHYThtV1NBT3RtSFFQdEMvUjIvT0k1?=
 =?utf-8?B?em1zS2JmUXRXYlcyUlFwUDlYRnNFbXh2RGpBNFlZeEN3dFpyc2JkNGlkODVX?=
 =?utf-8?B?ZFVscWhKZ3JaOGNxcDZXNzBuZFVTYnVCSjFKRjBuUlFJMXlBUTdLeEx1bjc3?=
 =?utf-8?B?NHpWQkpaaHJkelBRTUxrTVE2ZmV3K1laYlJsMjIveEpGb0dLQ1poVUhzUFVP?=
 =?utf-8?B?RWIyS0pDdXVlMFVjRzNKTmpkMTZTQW84S1hmVHJNQTZaNzRoNk5rNm14NXZz?=
 =?utf-8?B?VnpKaDJIdXc3Mm9lVkNDSnFadThBcG1MYXNCcVBDcVBoc0dMclZYU0F6cjM5?=
 =?utf-8?B?dUpka1RiRmJaRU1TelcwYmppQ2FzQjUrSlp0TndheWlnK0d6S3pwTHNjN3Bn?=
 =?utf-8?B?YU0rdUhwTDlyRTdCTFNJbU9tRlZZb1ZGSTlKd2RYK0pGREltVzdkRXY4aU9w?=
 =?utf-8?B?MTI0RmxBZktGTzFEYTA3d2ZsM0o1UjYzRXBSTHo1a3BCL1ZIak53Qi8zN05x?=
 =?utf-8?B?RThBL2NDRVN5a25pYWl2MkFVOHBHdVBxYk53WUQrYTFSaDQvL1BDNkE1Qjl5?=
 =?utf-8?B?NERzTWdPZlZNVHRvdkRYc3RwZ3o1K3hueVJ1SUx6NlZud1MzSFlXSHNnWHFv?=
 =?utf-8?B?VXZEMUZ6TlVBL3ZoelJmUlc5c2tIaTBFanJwSGx3dDI0Mk9VanB5VWNtZ1U3?=
 =?utf-8?B?dGpVSkFnUFlSbTJ4WXI3R3RQNUt3VmViZS9keDVkZXZJRFpqald1Unh0VUN1?=
 =?utf-8?B?NE53UmxWWDRHYTJ4NnpIZkhtcGZQREMyT3d6cnFpdlhQSjE4QTVlV1lrOW1w?=
 =?utf-8?B?RE81TzV2a25pR3YxZCtDN21ReHNubzBIaGlhUHFVNVJ2TW8ybzlIMVc1Nmxn?=
 =?utf-8?B?RFVnV2NKYVBwMFpuNFVSbWlUNGVHNG9nTE1Sa25ZWTU0aFJ2UW93YjhUOXg5?=
 =?utf-8?B?NWJ2OU9WWG91K1RVSmtJOVFpMFFHTEZjRGZJY0FHdDYxcTdodHRHVFJkekFH?=
 =?utf-8?Q?yRoS95iHzOtWcrTeDzRPoD8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a67dc482-85b8-4996-dd9d-08dcaaf9e138
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 09:28:58.4996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKRDg9RRI+w6n2ppdTgHIvgmVSYUb+MAMaHGgNvyzQ1kBiPmlct9W0Z1MoS+p4HIRcueH2VLJSnWvxmvIajKz9pz93KeloCV65F2khHR+QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
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



On 22-07-2024 21:36, Lucas De Marchi wrote:
> It's not always safe to call XE_WA() in the driver initialization. Add a
> xe_gt_assert() so this doesn't go unnoticed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> v2:
>    - Fix kernel-doc (Tejas)
>    - Remove needless initialization (Tejas)
> 
>   drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
>   drivers/gpu/drm/xe/xe_wa.c       | 1 +
>   drivers/gpu/drm/xe/xe_wa.h       | 7 ++++++-
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index ef68c4a92972..4dd01adf63c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -389,6 +389,12 @@ struct xe_gt {
>   		unsigned long *lrc;
>   		/** @wa_active.oob: bitmap with active OOB workaroudns */

Since you're here, please attend the existing typo in kernel-doc.
s/workaroudns/workarounds


>   		unsigned long *oob;
> +		/**
> +		 * @wa_active.oob_initialized: mark oob as initialized to help
> +		 * detecting misuse of XE_WA() - it can only be called on
> +		 * initialization after OOB WAs have being processed
> +		 */
> +		bool oob_initialized;
>   	} wa_active;
>   
>   	/** @user_engines: engines present in GT and available to userspace */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index fd009b2c68fa..564e32e44e3b 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -755,6 +755,7 @@ void xe_wa_process_oob(struct xe_gt *gt)
>   
>   	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
>   						  ARRAY_SIZE(oob_was));
> +	gt->wa_active.oob_initialized = true;
>   	xe_rtp_process(&ctx, oob_was);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index db9ddeaf69bf..52337405b5bc 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_WA_
>   #define _XE_WA_
>   
> +#include "xe_assert.h"
> +
>   struct drm_printer;
>   struct xe_gt;
>   struct xe_hw_engine;
> @@ -25,6 +27,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>    * @gt__: gt instance
>    * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>    */
> -#define XE_WA(gt__, id__) test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob)
> +#define XE_WA(gt__, id__) ({						\
> +	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
> +	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
> +})
>   
>   #endif
