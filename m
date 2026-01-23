Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B627D778AF
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 21:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF0210EBDE;
	Fri, 23 Jan 2026 21:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9u7tlLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951E210EBDD
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 21:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769202351; x=1800738351;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/XWYLEdw1PkfNQ8c2S32lIZrrVbJRTjt3oe19EXObZM=;
 b=e9u7tlLsNsomTCADdDyC3eNDZ3OzfIRUpMWT25XKaKw6GIhaWzDKfA1p
 UAZ7WAvVJuJ2mAVbTZGxAceX/7HjcyY2A2ru4pktorZZyfL0TJe5s7M/D
 PuTrHULgxi4FXPpohZgbr1BBK1tqF1O6h6+3FYp7NK2MpP08a+5t6kkW4
 Ta96ZaJMxBBIIDUNYNirsachaXXZFN8ATxSI2cQOmgJHJuZ5EyLamX4pP
 YY67JJE5F2JLj5tnV4cMn0SA1QbwR67M3Z4JR99u0vOQmQypxt2iW0Sxk
 exJfL73wYwmM05DUnsYA9GdG0YaZqu0JQ3zqgcc7xTz0Nyl0seOsjcTRX g==;
X-CSE-ConnectionGUID: dGbowt4CRDGAxO0tT8vODA==
X-CSE-MsgGUID: FUh+eloPRvKesV6txZMz/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="87876594"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="87876594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:05:50 -0800
X-CSE-ConnectionGUID: t0RbZHhYRTC5EJwygxeEdQ==
X-CSE-MsgGUID: yMVcuKvuRweJ3ebHMruOyQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 13:05:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 13:05:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 13:05:49 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 13:05:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl+Ao1rdvAuH1jA8BwTDyBs9oDTUPyXFSqN6kYfiLxgcypda8TwGQ/7VKIM85oK6GpFr3F2Ee/eUvwssmEVUpr9ekeLi+un0otuB3jjxDrXZvmxKcO9IUsO0nZsHpWDenjpWbAkAGItTbMoD0Si+ISbhaJsPDAm26LsM9Qzy+I1HLt2Z5HmBen21aNU1IRZ60EDbl58gWrjXjxf0BFB3HACEPEPv9zt2DSIIwgMG2fUn5oH0G6BcMxzimusThL/5miPpcNy49leFrkMZD1ym1FV5mvO5KSveO1UFAdlIoxbbR0EvY4PF+MjHohMjuNGnTw//DCrvTt+wONNI9RWFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhsjKNmRTMsfNPMZYMpLa0ItzjZ6mPM7oviiS+8IpT8=;
 b=X284hEGfVQ4zBbDS5kQ6mkA5OAb8u4g+a/VA4aUZKlLY9AP3VqFyTY1IMGVwdcRWBm5mzlhwYFGf+jNJ0ZzpX2UCEByAXDmDunrPBSsdCKAqTLeMm6Xu6q8qZyHYj02DYVpBz5bUBGv8bwUWrii36j5BbX2Z4XC0ZLBNR+CL9IISyvJ4IVcBB81I80n5GydNnkPrLnfKwjRJ9QAxQoHi9maSTjuBGD1Y/fjgIwF2ZGnPh9Pnb/BD6e2mjkm31WJ2QJRqdAtbdhwUOY0kRRfKTQIFyTw4FhfiIEZYdJGG6xwrFLecUPiccrcoP4PCUWeFBVdhL0xm3V8hwMikrkL7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB7429.namprd11.prod.outlook.com (2603:10b6:510:270::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 21:05:46 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 21:05:46 +0000
Message-ID: <93e5739e-245c-42d0-ba30-c3eda5ca5510@intel.com>
Date: Fri, 23 Jan 2026 13:05:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/gsc: Add devm cleanup action to
 xe_gsc_proxy_start
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260123175920.230494-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260123175920.230494-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 432f0868-a73f-428f-fe3a-08de5ac32da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SE9jRHNxelJ2WVlBbUY4UjAxRzF2Vk1CcnVXL2lLTmJRdEFnL3oyWmVVMm5n?=
 =?utf-8?B?aHVhY1B2cmVVMlNyaG4ySVp2cjFDYU5Yc0JSRDhNUTZRZXV2MnZXb1RkY1gr?=
 =?utf-8?B?VzBvaDlJaVZnWkV4cjFoazJwU2hhTFkxNWRRYi9KcjQ0OFpNVS9JUzdLK2Jh?=
 =?utf-8?B?MGxJNTdVZ0N1SThxak1JVzJraFZHVCtNYm13emNiTUhSMjZOS3A5dGpnRFli?=
 =?utf-8?B?eVQrZVVtTm0xUkFDWldXNUgvU3RWcDMzL3Q2Vis5dDIwNHczSlF5d2pDbkpD?=
 =?utf-8?B?YWNjcm4wRWlWUWhwM1ZEVXk3bGZUdXFEdGV1YmdSQUY0Z2UxdHQ1K2IwUFBD?=
 =?utf-8?B?SDllQmlVSGZSSUFrVmJUYmI1cjRTLzZ6OC9OQWFMbzBMaXdwK3lOYW05Rkww?=
 =?utf-8?B?MSttaHUrdFgya0RSaHJnWmdPVFIwQnc4VUlRaG9GRGU4SXBFa3JBeFA3Q3BL?=
 =?utf-8?B?eXJFaXRRa3ZQZVlnSWZKMGVJNG9QZCtZNU53WE1uZlZQWDVWN0tPTUNpYWU4?=
 =?utf-8?B?ViszT2poT2FWN01sRkNiY0l1WXhlOW8rekZURDU2MDBVT1F4MjMwdjA0TVV6?=
 =?utf-8?B?SnJQQ0d1YUxTSFVHSmJmeHgxS1M4TWU1d2xTZGVTTjB6cDAzdUQydlJsRXZF?=
 =?utf-8?B?MjFqSjFBSmJYSGU4eVZJbTJxSjQ4cUptL3NjV1llMmNTUzUzU2dxSEgyNmZS?=
 =?utf-8?B?WHpRaHEwWHZlYVRmdUtTWXRjZWdlKy9KK3hNaElWTEN6YXd1SnJ1NkdiSTd2?=
 =?utf-8?B?OUhObUZ5MEFRUE16eVZMRGNTUkZtQUdSTU9pQTV6T3JDODVYZWVmb1lQYzMr?=
 =?utf-8?B?enZhMGxzUC95SzZWaFQ2NHVMQkxtc3MwK1FzV1ZTa3hCTlpDV0s4RjJqdUdp?=
 =?utf-8?B?RVZMYnFpK3ZtaXl2dmVrZXZqQXJaZk5YOVV5UVR2eGM1Qm1vMnRLcU1BblRp?=
 =?utf-8?B?S1orSzNSUTVHTjVFZWI0K1VrelV0UkJhTDQ4ZE42aFduQWRFVnhTZzBUaGtx?=
 =?utf-8?B?WiswQ2VBSGx1cmQ3OUhMQXh2a0l6TG5IRVFoUk85L0M2d3grOTc1UDNWdTFs?=
 =?utf-8?B?dER3ekk2YUxCTzdzbU1Qck5NK1VaTFV5cC90c2dsU2hmT0VCWVBhdE5pU3VN?=
 =?utf-8?B?b3VMdnVMWUpRdEJFdzNxVlpCR3l2a0FSWW1TOU9IUmZLcFA5YVI0VVZHQW5I?=
 =?utf-8?B?U0owaG53R090Q1VWbHdWL0dibWo0T2NRQWxKRWFPN0N2RVhUUFlwdDhZeGh3?=
 =?utf-8?B?QXROR2w4OTg2NDN4bEd4aUV4c09KNWlHelBQR2wwRTFJNlZoTU8wM3gxanp5?=
 =?utf-8?B?ZVFRL2tSL21IeGVaNVU1Z0N1RERwOG9hRVpKMWN1ZlBCZSt4S1NtaXRwdEo5?=
 =?utf-8?B?bzZnWDJSUXZpZlUxUnpXa1JrbUZhZmdBRUM2SWUzSnY3NEg2Nmo4SDRoYkZz?=
 =?utf-8?B?ZVBaYjRYclkxVkJtN1hMM0ZOclE4TkVMZU9PK2IvV0dKUTc3ZUQ0VzVxc0RR?=
 =?utf-8?B?MUhzeXlVVWlvamFrOTgvd2xHbk1jamcwQkN5N0pIOVhBUnhtZ3BHTkNabzZF?=
 =?utf-8?B?MGptNDE5UzRDbUdEQzJKb0I4VGgwYitQWmgwdjJlc2ZqL3ZMUzlRME9qSkxj?=
 =?utf-8?B?V01JUnJZZWdkT1dCdDR1YnowdHV1alh1ZlplTHdEYkVndnhNdDdWVks1SkZx?=
 =?utf-8?B?NHE4dUhKRHZrNHU2RXBITTJNVE9kVFJwM1RBNStPa3pCWlhVNUxXeXFkNTZ4?=
 =?utf-8?B?SGdZZVZNVnNVQ0Q4bSs3bEttQXVQaEVzYVpsOXY3UHVNMXFjUGRqUm9VeTln?=
 =?utf-8?B?d1k1bFJmQnN5eFg4Y2k0RjBSdFNhemxFb2RuUExNVmdsTEM0TERNcXNKSWNS?=
 =?utf-8?B?VERTWk40SWgrZVhreWlHeGF1c3BuaC9Hc0pDa3FRRkZob05RK3c3a1QvWEY2?=
 =?utf-8?B?SlN3c0pqZ1RCVktXclZSWkdmRktETENINGZRSFhkWmllay9hdWFzek9UR0Ew?=
 =?utf-8?B?QlpTQW1BdGtvZWd2ZVMrVEYrKy9JWVhORGV3M0wxY2JsQzBadGNXSXdDR24z?=
 =?utf-8?B?WlV2OWovd29KYU5mL3VJR1lxM2NDZ1FpTE5MTzJiWkhrREwyb2NBRVd3dVRM?=
 =?utf-8?Q?CsOs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ZZdEYrWlBqdGwxZWJrZ3BFNkhPT1ErTGI1M3RvWXZjTDJLTFRlTThOWnZP?=
 =?utf-8?B?b1h0dXYvOGwyeHR5WlRLK0JpQjk5VzhFVXBnNGY3Ynp6cHpvNEJRTSt3R2lO?=
 =?utf-8?B?aW5wRHJiWENvc2VjejUraHF2R3RLUjE2ZmhJdTRnNmp4QzlodFJUbk4vSy9V?=
 =?utf-8?B?WkdzTzQwRXdFMVZGNVE3TjNmOG5wVzZHV2YwVENveXUzUU5sWVRiMnpDNElZ?=
 =?utf-8?B?YkRwMnQyaXpRaitUeXkzbDJyd00vRnZIOE1zajlmTFBUZjhXQnVSS1AxbCtF?=
 =?utf-8?B?ejJmenV3SlRkejNjNmF5YmdxUDQrbDAxU3p1SXEzYTlKcTVsazgxNU5LMjY0?=
 =?utf-8?B?cDJBMUJqV2dZaWt0VVVsU2dlQ0xEVWN3eDFtRElKRVhHYi9Td3JZV2hhMEFH?=
 =?utf-8?B?Y04wbFJWRG1iVys0cncyR0ZZVjFZTmtSdzFrQ25XMFRnTUZFZVUvZVdHbGFt?=
 =?utf-8?B?SGdpQU5qNGdTVEJJVEdySXNZTkIxS0tkNGJrTkZsUk9TUTdvQWl5bGtmYmxn?=
 =?utf-8?B?QTQ4TXFLMHFadzZPNWJEVmtLSVRCRlg1eHdGZ05kWGtSd2s5bnNlaEF1cXl3?=
 =?utf-8?B?RVVnMmJWbjNzNXJCbnB1dTI1TWtjeDBxZGQ4cm1uVnJheW1odVZxanpuOVRW?=
 =?utf-8?B?dGVoNktOcWFMM0g2TlVKd2NBMWNVaS8yWDZmNk5BbzlGN1ljRGlBM2F0YklG?=
 =?utf-8?B?OWNjY0Jmc0JVMGhzanFqcnJCVVBLVDYxaUZkSlNnOWFtV1NlRWJTbCs1dXl0?=
 =?utf-8?B?bjQrWWpXMGtPR2k0MDRDZVI1eTB1WEhmOSt5RmNDSGFQMFFFKy9tYko0VHpF?=
 =?utf-8?B?MC85dHZ3R0Jra3pSaWpzVWg4Zmozc205L0RnNnFjTUZrblQwZlpHdElEZ1pq?=
 =?utf-8?B?S3QzWXN3UmNrQWpySm1jY0tHYk8zTEljN2pCRTRYZi9lQTlZOEM0Ny9PbWV1?=
 =?utf-8?B?Q2hJZ3c3SWtyL2lUNERXVUtxUWdhMk9MRFE0eGFKRW9vK3BhUDd6enZpdXhr?=
 =?utf-8?B?UExuVXR1YmN3QzEzb3pqVHMreENwZEtIRHcvcGJMbERBQTVibzZtMDQvVmdK?=
 =?utf-8?B?VFNGNWVhc1prZDdkWVVpdFV2bFJpaUU3NU5HVlZ2eDBGT2l6SFVtYmZnNXRJ?=
 =?utf-8?B?OTFQbW9CRVNsWW9tVzBiQmJaZUxQcGR4UHNNZTNVTHo1ekw0WUVtcGZMY1ps?=
 =?utf-8?B?TG5ybUh2TUhFTlZ0cjdvelRPTFBmaHRWRjcvbjFHbkVDdWxmeEp0WGJXR2xr?=
 =?utf-8?B?aEZLNlZmTjhzUWRKSTZOb0ViQk55bmF2V0F2Z3RFSGkzQkZPWVFURDYxUTNU?=
 =?utf-8?B?Q0U0VWxqSzRReTVKMzdITHJvdDIzYTlEZGlmNWxhM1BUZDFBdWl6Zk9VVk5t?=
 =?utf-8?B?TTRsc0s4L3Vxb2p0NjlLa25UN290ZHRkR0lLRDF4cTlmUjh5YTQ5dnJxUHVO?=
 =?utf-8?B?S2tITzlVTy9EWmdyb2tkWFhzOUpKNFlKRisvZFdVYVpidHhSQW5CR2dKTFRK?=
 =?utf-8?B?WUpHZUljejEyV0VEbERobWd4Y1pzNURmNS8xYXhTOE1tb090M0dhc09ZOWNi?=
 =?utf-8?B?ZHJHTzIvZ0gwWGpTRytXT3NZemRtL1lmQmE3MWlwdWF2c25nRE5jWDg2aXla?=
 =?utf-8?B?TTg4YXNVRWlSM0VVZ1NMeXF3UUdaQ3RpVENRU0d0ZjBBNGZNZEZ0U0pkQXha?=
 =?utf-8?B?MFN2Mk9XMWdXVXNlamtUVEtHN3B6QmU3NjB1YmJ1NTgxTzRZNVMwNEJjZnB5?=
 =?utf-8?B?NHplbEhYUWZRREwvbXc4c2JaVk5DOEpHSFlGVEpkeisxdXV3RGRWZ0IrK0N1?=
 =?utf-8?B?SmpDZ21ZWFZSVGZETDVzYnVqb2g2ZG91ZWpvNTg2WUdzVXVGTlRtZk5BeGd5?=
 =?utf-8?B?RGVYRE9UVDVYcjNSR0N2cFhkSGdqcHdmYld1ZVQ1NXVkcTZIQ1lkUlJPM1JI?=
 =?utf-8?B?N0FIK1JDckZhc0Z3RFd5Y3g3eGdGNkF5MEhVd1BoRVlZS2lVUUZ3dTVkcnFh?=
 =?utf-8?B?d05BMnl5Zjc4czRXcHNXZ2VicUplVGdpcGM4c1RmaUJnbjJ3aGdxdnI4eEZL?=
 =?utf-8?B?dmRkUjZTK3VSU2NzSGNHY1BHSUlGL0dxTUlsQnpDN2VEcTlqQ2VlTFZHY0dL?=
 =?utf-8?B?VVBOZFF4L1F2SnlOM0xCK0VNb2NEZDhlWkd5TEZ2b1FtNEw5WVkveVRwWmRi?=
 =?utf-8?B?VnIyOHBHYnhjK3RkbnpBTm96eFVSbFFuWkhzeUVBWGhCOWNSZ1pXczlFTnhk?=
 =?utf-8?B?d1BCK3FiN0ZvQWhENTgyKzUyU3YwVm4xajRRRU9uelM3TkVJMEhBaTNUWFk3?=
 =?utf-8?B?NDZwd1VwQ2lmeHVscWVRMG54eENkaFEyTm9uK21FVzdUa3pucDA2aFh6MGcv?=
 =?utf-8?Q?cUTrJmCKlRZe62jw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 432f0868-a73f-428f-fe3a-08de5ac32da3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 21:05:46.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2UPVP9iMrumjIZj9Qd8ohIr2i+eG4cgydbSLCbxpV/OhR/xWiNkL5FPc6dhJGVL7ntu7PqahJXMnVbU3HfB84UORGrquKeyh2RwoXC500E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7429
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



On 1/23/2026 9:59 AM, Zhanjun Dong wrote:
> Split xe_gsc_proxy_remove into two parts: xe_gsc_proxy_stop for cleanup
> operations and xe_gsc_proxy_remove for component removal only.
> Add devm managed cleanup action at the end of xe_gsc_proxy_start to
> ensure proper cleanup when the device is removed.

This is a bugfix, so it needs a better explanation of the bug it is 
fixing. Something like:
"xe_gsc_proxy_remove undoes what is done in both xe_gsc_proxy_init and 
xe_gsc_proxy_start; however, if we fail between those 2 calls, it is 
possible that the HW forcewake access hasn't been initialized yet and so 
we hit errors when the cleanup code tries to write GSC register. To 
avoid that, split the cleanup in 2 functions so that the HW cleanup is 
only called if the HW setup was completed successfully."

Also needs a fixes tag.

>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 42438b21f235..0b76b29bf2d5 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -435,15 +435,12 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>   	return 0;
>   }
>   
> -static void xe_gsc_proxy_remove(void *arg)
> +static void xe_gsc_proxy_stop(void *arg)

I think it might be worth moving xe_gsc_proxy_stop to be right above 
xe_gsc_proxy_start, to keep the opposite functions close.

>   {
>   	struct xe_gsc *gsc = arg;
>   	struct xe_gt *gt = gsc_to_gt(gsc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   
> -	if (!gsc->proxy.component_added)
> -		return;
> -
>   	/* disable HECI2 IRQs */
>   	scoped_guard(xe_pm_runtime, xe) {
>   		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
> @@ -455,6 +452,16 @@ static void xe_gsc_proxy_remove(void *arg)
>   	}
>   
>   	xe_gsc_wait_for_worker_completion(gsc);
> +}
> +
> +static void xe_gsc_proxy_remove(void *arg)

xe_gsc_proxy_remove is now purely SW management, so we can use drmm 
instead of devm when we register the cleanup.

> +{
> +	struct xe_gsc *gsc = arg;
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!gsc->proxy.component_added)
> +		return;
>   
>   	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
>   	gsc->proxy.component_added = false;
> @@ -510,6 +517,8 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>    */
>   int xe_gsc_proxy_start(struct xe_gsc *gsc)
>   {
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
>   	int err;
>   
>   	/* enable the proxy interrupt in the GSC shim layer */
> @@ -528,5 +537,5 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
>   		return -EIO;
>   	}
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_stop, gsc);

You're not doing any cleanup if xe_gsc_proxy_request_handler() or 
xe_gsc_proxy_init_done() fails and you bail early from this function. 
Need to change that so that interrupts are disabled in case of error exit.

Daniele

>   }

