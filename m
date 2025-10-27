Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978CCCCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 16:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC6310E51C;
	Mon, 27 Oct 2025 16:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlJCK/Qz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F0310E51C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761583374; x=1793119374;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lCftwN/E1UUz16f/zKxEUy6Ku39sA4ndC+e9ouIRDFM=;
 b=hlJCK/QzmFw3uRJ0Y1bsZNSxQUWozXPwmoxiE1bRbREtDyupVEaTRysT
 It89nsuiBQIcStybk1umwOJaWPxS4AFPFo23jyN8FgTBdRU3Kglk43Q1h
 XE9henWUqbgpYYzmPXIzrqpPrEI104fEgBoMrgQt2QXCgUAej7m3064BK
 Wr1D+dvb6S7Ivm17JwaLHdxs7bfBvF42U3YRKJafCZhQt6MgI2eM4p/a/
 Nlx1Zo6kODnydAx/u8Yo6/q+vceML6stt5F3OXcjFBsjYnYgreHVMC9jD
 jw1y0+P3OS4VPAVpbfUq7p1QA358YB+/Y1II70CUFcQjxQSHhjfooHg1f g==;
X-CSE-ConnectionGUID: DhlGpB3PRFyvBH2ThD3Kgg==
X-CSE-MsgGUID: rE4dyIAoRjCvJhfz9PBO2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89139975"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="89139975"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:42:53 -0700
X-CSE-ConnectionGUID: C73sOKVoQx+CuiYxMBnsIA==
X-CSE-MsgGUID: r1SmYJwvQEunx/J3JudfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="208702772"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:42:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:42:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:42:52 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:42:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xf+qLSSRiOYbigEZvtlBYFNSfthmBTDNh+xlQjWSrcs+imCE4eRrLiEMUsoYr7k+jBoHH38eeyDA8jGTxwQ0gXJZ/QkxH7NZF0pyh2wQiZ11aFcAGOhW2ETTgtvGtWsgdQJA2Ry56q7ioc6MShu94xrDnZZRscT505pqDi9KzWypikx+igWVBhSZA+YxtDZbL+VZbfOOYHEsJ0CoVwuj9Ly2i5TljGIdEFzuVbVKR5vSGWPOX8Rc/+aeKUMDczciWmC9zx6JJmor5SgGuOTwXDd5u/Lq7uO9fSEOw/taSgsPYbfSMXX9flwbXCYCkJaaPhFTsmgMD8g164l7mLqyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZmhLcBLMLaGkXnbFXWJA95+MrxydLlEdGxZgdVM/eo=;
 b=T1fzXxvtDm06kbClx6NRJTZcCk5xWkrUnnmqjqiY13T5Ioi/kKcbtuubF6GY0bXDtz06XCZKuICDg1J5RilcoxyK60R8D0S+tIRYm6iiW9B/TVNkczP1omf0U/z8Mqyzic9czcbgtYFerQ7F6kBRwQaMbJtz/vF1MgQk6JkMzAD3LIXDdLmSeHgnHVr3/MQREfvnrmJIaSWmjjR3dzs/v9nswH1ZVxWb+D5ZGslN3WnEZNJvGYifFNV/UAbMSBJF49ydR4fYRZDw7HOcW8DIPxvt6zQ9jXXYBuAXwu60+a+zYpBv9o8VqtxuVsjSCXxwPpGUMII0E6SN6ikyPGOhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8810.namprd11.prod.outlook.com (2603:10b6:806:468::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:42:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:42:50 +0000
Date: Mon, 27 Oct 2025 11:42:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Access VF's register using dedicated MMIO view
Message-ID: <ktefz5degktsl5cvc5crezzfegghcnorw6otkz36czgusu6wmr@mfixbcawwik5>
References: <20251024205826.4652-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024205826.4652-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0101.namprd05.prod.outlook.com
 (2603:10b6:a03:334::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e083d4-867f-4313-4791-08de1577ddb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDZqazZSOXZ0S250Z1laaDl2OXkzVWxlVjhBaXZMRlA4VzhlWkV5Yy9sdnA2?=
 =?utf-8?B?b2MvMXFncnRMNEd4L3ZPL3lRSFk3aWJoMnlTYjdEZ2RnZmVvNHArS0tocllM?=
 =?utf-8?B?UGZxRVRZWnFaMXZTVDc1NzRQWEo3L1I1ZVM5YkxmZUFRWlRuWWRlVW8xWmdE?=
 =?utf-8?B?WnJVWHBld0E0emYvNmVOK20xL3BRWXNaMWdzOXp0S29rZTYyY0J3OUtzbW5w?=
 =?utf-8?B?UjloWnYzYmpUMUJqbk5jdTF2UGNvZmV1ZGZwVjh0c1JHVWk0REFwWis0cUY1?=
 =?utf-8?B?alhiZ2Jadjc5YmFaYzhqalJITGlaNlhDbkRickNvbnJMeWYrUk00cVg2R0t2?=
 =?utf-8?B?bnA3Q2VRMmtnQnhDb09sUzg1WEdzRHowc1NxYXBVWlY2ZVBzMWZyYUU0UXBH?=
 =?utf-8?B?VEZGcUlWSnlhbFU1cGMweXE0SjJpMkdSUG15MmdFb0FoNDg2UUY5S2twWE11?=
 =?utf-8?B?VEFaWkRQb1FRalg5a3BmQWJqYW9qdGRCTFdrRVZWM2dGWlFPNlZKTFd5YnRK?=
 =?utf-8?B?eXkwdkNna3pieTloWEduVGM2R0ZOa1NCeHZiWG14d2w4YWJVUFFWSkdmNklG?=
 =?utf-8?B?aWY4alNxODNKbjUxcUlZM1VIc0FwQ051UkNVRzg4VmFMRmZYNFNDK1FQNGdr?=
 =?utf-8?B?ZmtQai9PVi96elNRUVRabVpsc2hOV2owT3M0YTNVdHpSTVZoNHdiSnVFL2JQ?=
 =?utf-8?B?dnEvakpiTEJxQ1RHdXROVzdHNU9Gb3d0MlgvcldaY2Z5WFRua203UURlRmY1?=
 =?utf-8?B?WUtlYlhZclVWcU1tT0hnOVlVRjhHN2dSOHY3YVR2cWhoYzBLQUJpVVdrSExh?=
 =?utf-8?B?eVRqL1pyRDBJSHY0QW5pYU9xUjZtU3dlN1ZBU3hGVjFHVmNuV0xCeUVJT3pU?=
 =?utf-8?B?S3E4VVhCK0lYSXFyN1NkLzNqb0lBTTdCZHc3V1NhNS95dGNoTkVFL3RrbEor?=
 =?utf-8?B?UVlVTjFVZGovUGFwUGNqdVpYNXV6UUF0dGlrTEdRTGc0NEgrNzFTTzFrWlVo?=
 =?utf-8?B?b3V0SVQrNFZjSWtPb01lakpGeExtbm5vZ21yMnFHbEhHSkx2bGU5b2lZNFFt?=
 =?utf-8?B?Z2ZYTW9vYlBnaUxzRUZSOHovbWlrOS8xUEx2bDBXeUtCWG4yUS9aK01hRGNu?=
 =?utf-8?B?cXV2cXNweWM3eUE3S0orVXRaQ0tZVEZYTW9iZmNaM3hTWkUxMmNhUTI0cU5V?=
 =?utf-8?B?WWtka3lzVk1VbE5xY3ZodCt0SmlnUnVMNUtwZmxOWHk0S25hNFp1NVJVRU5y?=
 =?utf-8?B?VDh4eEJJZjd0QittbXJvVVBWT0QxaHVXR0ZxZDVmeHF1SENUWS9hdW9ZSnI1?=
 =?utf-8?B?WGpJVDVJeE5JZ0dFcjlDQ2hGa1BZL3RJTWxuNkNVelRNRWJVMGlSQTN6Snh0?=
 =?utf-8?B?YlEyOGh2QVRzdFdXZWFyQklLS2Iwd215UG1uZHl3RWlyOUZNZjdPMFZ1UDZX?=
 =?utf-8?B?bEJxM2hHRmdZWEVHK290VjVCeDhOL3hCNEhFMVJuZGc0bUZ3ZVU0Vkc2bHFt?=
 =?utf-8?B?ME1ldDNISDlPdEVDWFZIcXhrckZzSHZzdDQvQnFNSEM2UXN5cmxJalZYNUY4?=
 =?utf-8?B?K0wwWUZQU2V1bHV1RUxWeXZlUHNXb3BYTzNjd1RVOVJTNnNNTU1CWjFyWnQv?=
 =?utf-8?B?bmZmeEo4VlJodnRkbUlNQStjdkMwVFhmenl3TWM5MHJFWkF2VWdYYmdnMDRQ?=
 =?utf-8?B?Z09GWFRJYzd3N29XbG5DK3RhZ1AvaXV6bXJXSWNPdEpwZ3BXYlZPd3Q3V3Fq?=
 =?utf-8?B?YnV5SHhOK1NlbVExRDZqNndjY1dDTE1ZRmxyQTdjdDdXT3dYZzFPamJrMjFL?=
 =?utf-8?B?MGliVndPZWFHNnZid0RpWCtkSDdVWXJ4dmhaaUc2SndrREVac0wwMEE4UGxF?=
 =?utf-8?B?dVlpeDFhQnBCNlpDU3IyMlBCSXhiSkt2bk1KWXFTZy85dGRkOFFKSWVtdzNv?=
 =?utf-8?Q?Ue3esxNjYvtVuP6dN1Yf7EVmvaqIueRM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm9ybnRCeTVHRXNCMHlQRHk3WkE5TlR5bzI5RVViY2JOTWtjeVNSMjZDd3do?=
 =?utf-8?B?MG1kaEcwbUxjQ2RsdzI3ZTFHczFFU296YVdIMUxOMkprNVBGbnkwdDhPcGZa?=
 =?utf-8?B?YlJzUTI0UTAzL0UyWWlKSE03enNBZnREeTdDMkZocUQyeU4zWnIwUWVJNVds?=
 =?utf-8?B?UlV0L0hySzJNaDYySXBtbm5yUVU2WUtGMHJlSWtRd3BhQ3pTN3NEcHBWbU1q?=
 =?utf-8?B?NU9HZEhheTBKeVZkWUZVUmFtUlAyUjBNTUpOMFk5enlISjJKdDFpMVZ0MjFx?=
 =?utf-8?B?TnZLMGhZWTFTNTFtYVRwTDg2dnNyVWt5WHFIQzVOUjhTTGhkS1RsM09NRU1K?=
 =?utf-8?B?cWRqWHgzTkV5Nmd5cHJNTHl6U250MzhRNWNDLzB5QmNEdVUwRkZreGVpcEFr?=
 =?utf-8?B?Zk5hK2dSYkVMb0ZMcVh3dUpmMHR0VDBiRlNsNjNuMzJuUFlUcktCRTBBemhI?=
 =?utf-8?B?Vyt1MDhqSFBIbzJTdm1Gam1zWE43ditLYnowV005Y2o0UGkzdEdMdGtiTmtw?=
 =?utf-8?B?WVEzYmxZYjdpNG1XamE1QnhYRzR1ZUxUOCtWMDY3QTdPQ1pQTGhsWEV3ZDZN?=
 =?utf-8?B?WTRUNnRoMzJqTzRSQWRJdGg3cUUrcG04aTZEN3lJak1hcHVsbDBkTmhiaWta?=
 =?utf-8?B?RW54aUVFTFVxRUhHQVdsNG84eVM3Wko1Z3N4aEpCclkrWlM2Y0hKN1ZqazlB?=
 =?utf-8?B?YldVa3RrSm9pQTRmOUhIUkdOVUxaUS95OVppa1Zwc0g4eEEvRkpyRVYvNVky?=
 =?utf-8?B?TDNMSmVMMWtnK1ZtQzE5a1lFc25BMkNpck5xT3lKYzRYcUw4R21idEhsN2JG?=
 =?utf-8?B?SkRycXdCU2szYXRMdVQzMTBscGpuN1BYU3h2R3Y4N09iTGY1M0FjaWtDekl3?=
 =?utf-8?B?Ym0zUkZDOFBoWTBwNnphRmk5S3llcjdudXF2OWJQZHhUYzJ5OTFVb0pGbnJl?=
 =?utf-8?B?eFJIUXlha0hKcitpcTlaWG1ZdzgyT1BJNWRkNmRvdVRGUnk5VW11dnU4WHJn?=
 =?utf-8?B?cXh2eW1xeW1pTDJYTU9oSDlYSUdDakpxb2huM2cxb0UwVHRDTXovQ01qT0tw?=
 =?utf-8?B?c3ZFQ0N6WjdvV3BaRGp4K091dEFJY3dhT0dYTTZMWVM5ZFV5NHZTZ2FCeStm?=
 =?utf-8?B?TEtyVFlNcFRIL2xpdW9WdnJxajhWNG1YRFNmUVZhWFM4Tll3V3JDWDhOdkhQ?=
 =?utf-8?B?TG9uUXphbWQ3aDQwSlV0cU9iaTZ5TitXUDdsaTQyQS9aNzlGQVJqL2tSVzBy?=
 =?utf-8?B?NHNZQzc4aEFzemUvcUYzMHpibjlqOW5VV1d3NEMzMGI1ZDFLL3NIKzVvbWp5?=
 =?utf-8?B?R0d6WDRRK3R5NmFzcTlYd0RmT3g0d1g0bDc5VkdvYkt6M0t3dTdvYVVaWHpW?=
 =?utf-8?B?cW5OZGowbEFnOXBTNWZTWnF2Rm9mV2dSZ3VBQmduMHpPbkIzY1JjQ052REh4?=
 =?utf-8?B?dDNxdjVlTDhLU09pYkhTNWZXUmNFRHFqUytybFFReHFDM1RxTlRDSXZTcU1p?=
 =?utf-8?B?UnRJR3RHR05RM21BNXNFUTMreHFmWFl0djk2d2Z0OTZKSWQyenJYY2x5RTZz?=
 =?utf-8?B?VXo5ZHZHM1pidkVvazBqNVlkYzdlWXg3d3pTdWV1TXhxZEZrMHk5WklNWE5z?=
 =?utf-8?B?OFVIUCtsbzdIQ1hjY0M1QVdQNHJQa0d1eWJ2Skp6SjZIK0RmVTFQN1VCVUw1?=
 =?utf-8?B?emFpdWhFcEhVTExsSFQrS042L0lpR1BVNktzZWZBWXpZRmRpKzUvTmlJTzF6?=
 =?utf-8?B?S0k4amI5QnU1eEpYbXNReFBJZXMxNEhKZ3grZFoyN3JxcmdWUm40UDl2dFNT?=
 =?utf-8?B?RXMxcnJXTnJ5WHljeGYza2VrQ1FRcTNielVnM2pDNmJCUDZiNEpaWFRVWUQ2?=
 =?utf-8?B?dHdRcjNFSUhxNjVQUVRQZnhPUUpkMGJtaFBaT1NSdktBZmltWEZuQUc0UTg2?=
 =?utf-8?B?ZmNJdkhHMzlPa29oQmQwb2QycXJTb2hFSzgrVEtDSmZlRExNQ2xjTlEzVkxl?=
 =?utf-8?B?SWszRFZxY016c2RSb3BwcWx2WUw3cGNTNDJPaHpFQ3hPeUZlMDlWMjRMWWtR?=
 =?utf-8?B?NDlEZGhQSDlzZGpVWnNIQTUvSElEYzNCYmJ1bzdoYkgwV3JpODhTNTRVV0N2?=
 =?utf-8?B?NnRSd0lnRjlLem5sdGJoS0xKQ1ZEUS8rT1FSRG1NMjZEOCtEK2dhWXNuUEpr?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e083d4-867f-4313-4791-08de1577ddb3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:42:50.0347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajuJCQt+o6lmQ8GUTQA8nJBMJijtJY3BRSAombfJ/bGcGYao7QVu5I4oCkt13O5UYtPTaXj9OT8zUGZEdGZQ4pEY3JDTH9llP6j6wwyBXrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8810
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

On Fri, Oct 24, 2025 at 10:58:25PM +0200, Michal Wajdeczko wrote:
>Instead of creating ad-hoc new register definitions with altered
>register addresses to mimic the VF's access to these registers,
>prepare new MMIO instance per required VF, with shifted internal
>location of the register map.  This will allow to use unmodified
>register definitions in all calls to xe_mmio() functions.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
>Cc: Michał Winiarski <michal.winiarski@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 36 +++++++----------------------
> drivers/gpu/drm/xe/xe_mmio.c        | 29 +++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_mmio.h        |  4 ++++
> 3 files changed, 41 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>index c4dda87b47cc..0714c758b9c1 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>@@ -158,39 +158,19 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
> 	xe_gt_sriov_pf_service_update(gt);
> }
>
>-static u32 pf_get_vf_regs_stride(struct xe_device *xe)
>-{
>-	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
>-}
>-
>-static struct xe_reg xe_reg_vf_to_pf(struct xe_reg vf_reg, unsigned int vfid, u32 stride)
>-{
>-	struct xe_reg pf_reg = vf_reg;
>-
>-	pf_reg.vf = 0;
>-	pf_reg.addr += stride * vfid;
>-
>-	return pf_reg;
>-}
>-
> static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
> {
>-	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
>-	struct xe_reg scratch;
>-	int n, count;
>+	struct xe_mmio mmio;
>+	int n;
>+
>+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);


Wouldn't it make more sense to keep the VF-specific bits in this file
rather than propagate that knowledge outside? Something like this:

	xe_mmio_init_view(&mmio, &gt->mmio,
			  vf_regs_stride(xe) * vfid);

and then xe_mmio_init_view() receives an offset rather than the vfid.

Lucas De Marchi

>
> 	if (xe_gt_is_media_type(gt)) {
>-		count = MED_VF_SW_FLAG_COUNT;
>-		for (n = 0; n < count; n++) {
>-			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
>-			xe_mmio_write32(&gt->mmio, scratch, 0);
>-		}
>+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
>+			xe_mmio_write32(&mmio, MED_VF_SW_FLAG(n), 0);
> 	} else {
>-		count = VF_SW_FLAG_COUNT;
>-		for (n = 0; n < count; n++) {
>-			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
>-			xe_mmio_write32(&gt->mmio, scratch, 0);
>-		}
>+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
>+			xe_mmio_write32(&mmio, VF_SW_FLAG(n), 0);
> 	}
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index ef6f3ea573a2..350dca1f0925 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -379,3 +379,32 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
> {
> 	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
> }
>+
>+#ifdef CONFIG_PCI_IOV
>+static size_t vf_regs_stride(struct xe_device *xe)
>+{
>+	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
>+}
>+
>+/**
>+ * xe_mmio_init_vf_view() - Initialize an MMIO instance for accesses like the VF
>+ * @mmio: the target &xe_mmio to initialize as VF's view
>+ * @base: the source &xe_mmio to initialize from
>+ * @vfid: the VF identifier
>+ */
>+void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid)
>+{
>+	struct xe_tile *tile = base->tile;
>+	struct xe_device *xe = tile->xe;
>+	size_t offset = vf_regs_stride(xe) * vfid;
>+
>+	xe_assert(xe, IS_SRIOV_PF(xe));
>+	xe_assert(xe, vfid);
>+	xe_assert(xe, !base->sriov_vf_gt);
>+	xe_assert(xe, base->regs_size > offset);
>+
>+	*mmio = *base;
>+	mmio->regs += offset;
>+	mmio->regs_size -= offset;
>+}
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index c151ba569003..15362789ab99 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -42,4 +42,8 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
> 	return &xe->tiles[0].mmio;
> }
>
>+#ifdef CONFIG_PCI_IOV
>+void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid);
>+#endif
>+
> #endif
>-- 
>2.47.1
>
