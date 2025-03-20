Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEEAC28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 20:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859D910E6B2;
	Thu, 20 Mar 2025 20:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJV1vn+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F399010E2A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742501393; x=1774037393;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2bK3jNNB2rv3ySFgGfO4I3tE7cFUrgcTBN5RQVUt3S8=;
 b=CJV1vn+EWlG06HMFlUDHImaZdjXgQqxvq2XnSgiqqlfXVBrIC0fCv2rk
 AoPwYtb++x16HuH3mmZmIRcKEK9VZkB62St023P5s0v2gZJj0kzx2a+Id
 Y1lEkolyt+63cA8qWa0/v/Y2JPhNewMJLz4ctq05ofIv05Wj/dr22mJR0
 p24v5ksJxotbGzbNZuitfYApymSB2C9xbnLZ5TM8qtUqjWk3CVJBlXEVA
 WeLGsV1ig0j9XPA5d8dciEndtResSCJM/psflsoGTBEgHHwILVqsdsmv2
 zk2G6iPKZKOsYzv/qR9L4nSckdVgIuL/FZuieDsMJS0x/eCVP398WiWyX A==;
X-CSE-ConnectionGUID: tQYBy7p1T8m2zC2HPkrzeA==
X-CSE-MsgGUID: LprTBDHnTzqSx21kP4SxBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47633735"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="47633735"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 13:09:52 -0700
X-CSE-ConnectionGUID: kogoFLOdTL+y1NH0ejGpYQ==
X-CSE-MsgGUID: ct7LeyUCQReaE6A3KrofFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123374947"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 13:09:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 13:09:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 13:09:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 13:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgZJPtNqcFWZV9CVfSXhQFXpOiHrEYkEwDmswzQM4W8JUta20Q6Yz1ckKsh3aXcvc6RGBKSM89BCDBRed48c7M4z/2tVgvBewtyMXp5QAavOmcBS4bALaDdnvvShY5FeybuGGa1ap4YxOPfkLcaTUY4us5eesUIEO8k63uLSsyvZtLNOgiKY43pcd7oOLlKjoUsRM/X1p2e3CwU7Pf0FyEv8a6ZpAL37aZM96PXrl7HnkyiB8bOi0AHDrmiozX434FwtMhsEMpZEEJZ4YZv5YzAEhf3HzGA8cig2+DlmhprXoMTc92zi2T4IIl93HEm4UMzt0m63OFIwuD7cFz+loA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4WW/m0RJAZTG0iU+7ul7tNNxj/ymeNNADBuvDEG8A0=;
 b=xhO3UrBHOeaTJmbC2DOiNPnxIZF8OLg24CaRe1WMtU032ynmsyteJI9qefJtv0SGHUmGFU0idOs7qEmtSALKvc7VdcglnFKsvkZSiV4K/LLxrIOtpK8ql032NdR1Z+nJwjUHpJJyu2jCM2OlACb4wG8MgecxaNavJXRYzf/mg53TkrpIDvXwWLTJIIBMN2+vElKEhY0jKtW54eQVjn7v3K9NuyprYXBKfdsxvtbOJ08TcBbzG4rDoyFRgQyRE7FLlp2nB8g/IXvH7M6UEIs9i2+nx3rqXn0V+rPz2TXT5u7Qru695EIoAuUfSN20Q37t+DPCzgu6dUX58BXBHLzPgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 20:09:38 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 20:09:38 +0000
Message-ID: <cc30ee16-f0bd-45de-b709-de35b0a70ef7@intel.com>
Date: Thu, 20 Mar 2025 13:09:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/xe: Support different GuCs per GT
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0207.namprd04.prod.outlook.com
 (2603:10b6:303:86::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 831f3bc4-35ac-4d61-0545-08dd67eb247a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1VwV3czbkVLMnpHdFlhVkpRSVVGTUlJRS9ibHp6allDRHlBZlJLWTVlL2NE?=
 =?utf-8?B?Z05VT0crOVRLTkwrL090Skp0dVVvTkdOWjBvVDhnTVYvRXlma1drMUxGd3Ra?=
 =?utf-8?B?NDdCZHBxU0ErMXh6RkRaQjA2QUVSYmxnUVViRjljeXV4NXVTQlZ0YmVRa1F6?=
 =?utf-8?B?NHlxdWpta0JQYzYrSTNIc1BZU2FEdnJyRkM1Tko4RnBjUHRHbVBXSCtRNmpT?=
 =?utf-8?B?U2pXMFBkU1k2cElQay9mV1YyWnlBcUJCdy9kdXJMVHBlMHNPUkRnU2k5YjdY?=
 =?utf-8?B?YVhMSm5YTUVpUWhPdXJ2bFZsWHJIZXpYMndwL2FmQjMyb3hSNFA1UEllSms5?=
 =?utf-8?B?MHhOK3NOcHo4MmVUWkYyK2NCU2JoRkQxVVFRNTlCUXFaRkswTWNBY1M0WUx4?=
 =?utf-8?B?RExMTWduZms0a1dGMXJLL0srd1dZa3BpK2xrVVRGcjZYVDNmYUhXcUFjNkJM?=
 =?utf-8?B?UHVRNUJNS3BoZjJnRk8vcEFkWWFVWWlqU1Y1dTh2UXEyK3BvZnBpVFdwV0h6?=
 =?utf-8?B?S2NsVy9sSXZ0djFEMVE0b21lbFRXZE9VK1lNeGpJTjZJMms2ZTlLUWxNdEpF?=
 =?utf-8?B?WUNjNzFpRXoyRVVPQkhsM1VyQmpEdHphODNEY1RKWEdZUkRyQW1mMDlzc2tT?=
 =?utf-8?B?WmxURHJ4KzlYMkovb21oMmZwR2kyRHhkK3N2cHIyUlNWUWNHYkVUN2dza3lD?=
 =?utf-8?B?dTdoeVNud1JNUWxaU1lld1BjMi9CZ21ydVdMOVl0aTRHK1A5WXM1MElOS25v?=
 =?utf-8?B?bURqTlJpKzhKS2puRnBYK2FXRFR2c3ArQWg2SnhXUzZKb0NTYjlBRkk2a09V?=
 =?utf-8?B?c01NSTB2S3JpdVM5d3BYU1lhN3hRaXlaalBBaElaU0oxQXYxTHgvZGNXL05C?=
 =?utf-8?B?SS80L1ByQU1BNHNJZGJsS0w5c0FKVG1TZDhzR3RWR0NRcytPdTJLYmtUQTh5?=
 =?utf-8?B?cjhkUXc5U1pUYXE5M2dhTzNEUnhicEVnUkhHZ3FEZzhMQWJUZjR1dm5BQm05?=
 =?utf-8?B?cjJtbHlDN1EwUkxtUEFqK2xGYVVIc2UyWlpHSm5QckVIc05Jd3R6SWhCck1i?=
 =?utf-8?B?QmVGWEk4NGt6YUZLQ3llNkw1dnRVL09oMjh2WFo4WEtBY2xGeWxOSG9RaERT?=
 =?utf-8?B?a2NQNlJtc1Erc1BSVlhFeHZwQ3hpenRWMEFDSW9VK2wvTGEzVWxWVVhTTEJn?=
 =?utf-8?B?YzBmT0xFVGpsdjllNmx2S05uTCsrcElRcGhiWjVTOGdOZitJQWY4Zkx1dWZN?=
 =?utf-8?B?MDJGN2xIN2xBS0FTWTNTNytSaklzZlcxeldnaFp1RDRqaEVRaHB3aTlkNS9L?=
 =?utf-8?B?WDlldndyTmo3bXZZa081NzF3UkowN1NFM0toYTJnL1VROWF0RjRHZm9mZlNt?=
 =?utf-8?B?UVdOQVRxd3ozbzl0RzQ1b3JPdGpibHIvRUVGTkNmRUlDYmNkUUZyM2pEbFht?=
 =?utf-8?B?RjFOeDZKQ1ptSmlZSUlvQ1FDd3BEN0FXRkRWZmpsV1Fvb01uSDNDeVhZQnhX?=
 =?utf-8?B?WVhudXh6TmpYYUZkWnRacFpUY2gzc0hjUjJjRzRjbmUyOTYwWmU4VVd4aWg0?=
 =?utf-8?B?VlNxdnJSVVZub3BsWUpodnE5RFZlSHdjcm5YdnRiWUl1MGVTbHhJSzJvMlhu?=
 =?utf-8?B?NUttOTRGRVBQYUdQZFRRUWJ3OXJ3SURtRTNTRlh5ekVNSG5OcUd0U2YzNSs3?=
 =?utf-8?B?RW90UlBDb3FsUnV5dG1aVWhBQ1JOQm1paEhHSmtVUHk0dXdXenV5UlZwd0JB?=
 =?utf-8?B?MThmb05VbXZ2bHJnQnpNcWhObUxoNjRqRTF1Z0JKY2ExV1A0SjBkcEJYMjFI?=
 =?utf-8?B?dTVodk0yUGl4bUZYZGgxbTV3Z2R2cUM4bHkzRnNtMTF5Z29tT1dmUHhVUlA2?=
 =?utf-8?Q?7gp/Lt+NzVpNn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1JoTC93VGsxQXpQMVlsbWJwMm5oakI1Z0t1aDdLVGlTb253MVhkdEdVVUJR?=
 =?utf-8?B?dDIzY21VTGtOSzFjdjk2SnR2MGVHOWF0VW1rSkR5cHNBVEZsSTVMOEJtMlVL?=
 =?utf-8?B?L3NXNUhBK3JVazgya2R4T0RwZ0k3TjF2ckFnczVMM2JwVUY2ZGdGYzNFUWNY?=
 =?utf-8?B?czc4VGdlMUJQNk1MbkdFdTIzZk1INC9abVVheFVQeGI3SzFXenFsQlIvY05J?=
 =?utf-8?B?MnlLYWdXS2ZQWVQwNmxYcjV3b2JhRm9UY0srY2phMmtmaWk3bWxVVUdkeXRi?=
 =?utf-8?B?MUY4cjBlclI1WnZBSS9qNEhqVERHcmlHTmFuakNJSFFYM3RhMlE3MXBKaTlo?=
 =?utf-8?B?UDdOc1BuKzJOM1NlMGQ0Y3g4anpPbFppbVpTL3Bma05mNk1KSFJnSTArK2Ey?=
 =?utf-8?B?dGJSa1lIMk04UUVnZUMxNTZHYlFpckVtNUpLMEE5anlzKzFjTVpzR3RJT1JY?=
 =?utf-8?B?azlXaTRqTk1yeDdsOFdlY2dLMUwydjc0MVc0UndrUWVGS2pJbW01OEtKd1Zj?=
 =?utf-8?B?SzliTUdrVVJkdElWN0QwT04wRHNlK1NjTDh3SGs1U25Da3ltb1JUR3V1Z2JM?=
 =?utf-8?B?Ynd3YWJNcDJ3TEhqSW0yREpIeUVvTnI5QWVqaWZSaUIrRHNlYXRiYjlBT1d2?=
 =?utf-8?B?ay9BUE41em52VkpsbXRwcDk1Q2YrNEhoY3ArS1ZFVEFCVTM2SnAycWh1OTk2?=
 =?utf-8?B?dkRGTnF6MWxqUFJvV3c1cWd0ejY1OWdVVzJubzBVbEV6NmdqS1dNR1lzdG5S?=
 =?utf-8?B?VXNYdWhpUWV4SU55WWFjZlRRK0FIbmJuZ0ZHcEtycmtZOEkxaVFNQlg2OTI0?=
 =?utf-8?B?Y2FFUUp3Mkx6SzJ2TWR5VW1XTjJaSERhSjFXdVkwSWpVTnA3Q0lqWE5qSFNr?=
 =?utf-8?B?dnVjcjZWNjZ0dTF2cEM4eG0rV3E5OFMzeFkzSWVzSmxOdTRFNnpJaEd1UTNl?=
 =?utf-8?B?eFBMMzFlZ1J4dWd4RGZLL2EvWWFRckZPSVRzdFdzMDFyeFJuazlidmRrT2xV?=
 =?utf-8?B?dk44T3lFZHFtSXpCcEQ2b1RVa1JVM252MVpTVC9BbStyZTlLeTA1OWhOMFJs?=
 =?utf-8?B?ZDIyK2x4ZWtBVEQ5TWRIeC9hSlA5VHB0NGdOaU42cUt6dndiaDlvbHR1YXhP?=
 =?utf-8?B?UFhTQjQzVVRtMWVxN3NQZExwdlhOTUJRZHhrcUtDWHdZZ0xLbVNoSERlbXBG?=
 =?utf-8?B?Y2hXL3h5YnppeHQxUU1Gd0ZobnpXQTV1SEJJaklwZm5jT3duSWw4MkhGZ0pI?=
 =?utf-8?B?QnI3TTNYYWhGaXQ2Y2F3a0UrazF3YXFzSFZxbFgxdHhVOVhIMXFaKzA0aEVO?=
 =?utf-8?B?NVBzQzhQYjZmbit1SFZoTFRVdVoyVWlKU2JqOTNCVHkvWVNaNUJCTC9sOCta?=
 =?utf-8?B?MG1rOEM3MmpqMzNqSllRQmFJQkJKMy9JUUVsbldxVVROY08vV2Y1a2xoVVpJ?=
 =?utf-8?B?VFBlam1HamRvSk1MVURQamw0NmNrSEY2WlFQbUtMZnFmaHprZFg2SFhsWWhp?=
 =?utf-8?B?SER4MG5NRTU3aUszQ1REZzY0WCt6dXJybjIrblZONjh1dW5lbWRoWFRDOHow?=
 =?utf-8?B?VUs1bHpGVXI1Q2hBQkhoNFB5eFlMcnIrUGNoL2pnbm1qbi9TTXpBanNMZE9Q?=
 =?utf-8?B?c1llbkgwOUlGVEZRdmhURXJPK3huSmxOTURpZnJxNURxSGthWmxKV2M2eldC?=
 =?utf-8?B?V3RiM2wzT2VwdG5EWVQ1c1FGN0tmS2t6SCtiT08rZjBHUlBBM1VPcXcwSVFv?=
 =?utf-8?B?c010ZXg3WlRMem10TGpJV0pwRjlrYlZzU2s3c09sQzVobEFCSzhUVTIwRVpS?=
 =?utf-8?B?WXRyMGdxWkZ5L0ptQi9IQkh2UW1ybkNsVmMzNWZzQ1ZwbjJ1bVB2TjlmOWgz?=
 =?utf-8?B?OFp6bGplaGxzalFja3YrUEtVZkFEQnNtR08wSlVRU20yYnpDb0dzMnZrY2xH?=
 =?utf-8?B?UnlMMlhMQit2SVdZeUwxc1ZXdU5EWk9HSVg3VG9iWFFTOXd5ekNYYWNTN1R0?=
 =?utf-8?B?TEVob2g3RVNHMDM0bDJPcVhvdXlqY29HK3JPYTM2REVId01DT3lHYVd5L2ox?=
 =?utf-8?B?eTlhb3ZhOUxWbVA0TFBseGo1V1Vma29DdkF3R2dSYU93YlgyRWw1WDZhSk5a?=
 =?utf-8?B?aVRiTWVCUWcvSE42MnhJM3BFYkI4VFZJRDFUWDZIbW9UQVBGUkc5ZnFaMklF?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 831f3bc4-35ac-4d61-0545-08dd67eb247a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 20:09:38.5187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIxcbX93129WWOKdP17DVpAancP/ZNSdNvyvWR7xlrWFrMpvVPyx3mdv7nFfOcDXF+C3IbrP1FntV1iFhcdjyE13Jz7SU1oAt0IMH3FLWwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
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

On 3/7/2025 10:13 AM, Lucas De Marchi wrote:
> This is an alternative approach to what John sent at
> https://lore.kernel.org/intel-xe/20250303195215.1046192-1-John.C.Harrison@Intel.com/
>
> Main thing is not making the name of the firmware magic, depending on
> part of starting with "g" or "m". So here I add the gt type in a
> pahole-friendly way and use it in the tables.
>
> Tested on BMG with the following table, just for tests:
>
> 	fw_def(PANTHERLAKE,     GT_TYPE_ANY,    mmp_ver(xe,     guc,    ptl,    70, 38, 1))     \
> 	fw_def(BATTLEMAGE,      GT_TYPE_MEDIA,  mmp_ver(xe,     guc,    bmg,    70, 40, 2))     \
> 	fw_def(BATTLEMAGE,      GT_TYPE_ANY,    major_ver(xe,   guc,    bmg,    70, 29, 2))     \
Longer lines, but otherwise seems like a better way of doing it.

PS: Sorry for taking so long on the review, lots going on lately!

> 	...
>
> And with that I get (pasting just the relevant parts:
>
> 	xe 0000:03:00.0: [drm] Using GuC firmware from xe/bmg_guc_70.bin version 70.36.0
> 	xe 0000:03:00.0: [drm:xe_guc_ct_enable [xe]] GT0: GuC CT communication channel enabled
> 	xe 0000:03:00.0: [drm] Using GuC firmware from xe/bmg_guc_70.40.2.bin version 70.40.2
> 	xe 0000:03:00.0: [drm:xe_guc_ct_enable [xe]] GT1: GuC CT communication channel enabled
>
> Something that we could also discuss is getting rid of the macro
> indirections and just type the name of the file. Once upon a time we
> needed to use different dirs, but now this only matters per for the file
> name. The only repetition would be probably on the version. But I think
> it would make it clearer what files we expect to have without the macro
> indirections.
Not convinced about that plan. Having the filename auto-generated from 
specific fields ensures the format is correct. And duplicating the 
version number seems wasteful.

John.

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> Lucas De Marchi (2):
>        drm/xe/uc: Remove static from loop variable
>        drm/xe/uc: Add support for different firmware files on each GT
>
>   drivers/gpu/drm/xe/xe_uc_fw.c | 102 ++++++++++++++++++++++++------------------
>   1 file changed, 59 insertions(+), 43 deletions(-)
> ---
> base-commit: 2c4fba1d065427efba4aaed5f80f4664c9f4a729
> change-id: 20250307-xe-per-gt-fw-4938dff9b339
>
> Best regards,

