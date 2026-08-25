Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A563C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 15:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB8010E1EA;
	Tue, 25 Aug 2026 15:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9Mxq4fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3415210E1EA
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 15:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787671374; x=1819207374;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SjgbVLhTR86QgcZ/Rs5cJ6nlXbLGIqEtO9olBjccK1A=;
 b=D9Mxq4fxyERyvbz4xBYV/xCtitymtfvgGKkTKJznNUneyxrLwdaiLdXW
 qPYVEMRo89P6tWJfa6UIaWA9dzMayROgwH8Z5PZOyymb1MCs7ICxH2Z5v
 uU2zB/d+klNracGtzN+CyvxJ8tZSXh7X15TG6HF5eSUqJ8jTQ2Rh8lkvb
 x+BiNWR0QbuhqIpymhbVk4srwjmDKAnesSFEa0WTMtV+sntXdnsxmXdib
 ZgJT9W735iNffFxjMRnIADcRCcJHKNYoN6ecXS2Wdafigb6rueFsYLMRI
 qcS5UGC3WPlI8RFaB1jd7Z+q/q1V6nzTwPb15yxxdNIZIUFvh1HCZ4GID g==;
X-CSE-ConnectionGUID: 7SO6iI+4TZGYjnTrKmLwRQ==
X-CSE-MsgGUID: 2WmbMQ69TPOPytE2mpXcnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98732146"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="98732146"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 08:22:54 -0700
X-CSE-ConnectionGUID: jfq4C7tKQxCnFafvqQudVw==
X-CSE-MsgGUID: 2CbUeqA3QJ+xQDvCX7h2Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="264699030"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 08:22:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 08:22:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 08:22:53 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 08:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5rcO1sEOA1IL/dDcsOvHyvAn0b3VhR4iqyo9zcasmkgryyPrjq8xtxqfumvkjlOXS7SmEJbHTZ60VQIB93gyNR3pvjdfSUVmMJQlcYOmBSgYUWYAhGbilWeRzXUuKOVB/9onyulIt4g0sLHj1zlRaF/gtUagR5HT6dB9uszz5EomjzZHSY1I+8EnRnIIvvCmmyqmcjAFTtIg47sLeyNnbFlqkrkH9MMrEVw8AygR7mQ6zoQSuD3PvkuShx+iN8PPRj/CQ0OCXO40x8OjyJPWFqRRtC5u01UhmkhM6hpX5m/tAOvwvzaxU4nN0IM1JN0ow48nKXQdNH0mfIeLbcQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM3w+3K3WXsquE+UcryjNo7SX9TveHVbTRH1E61PDl4=;
 b=yuIX1rtiIXTxO1v6HAOh1mxmWQh9pqr9BgfRnO4mc1K3AmLv9y4c31lYoCTvpE0rUFD53O3o84tBiQOsi0LY0qvtmhRQUfPyhO6ahWblSn9Li63ZMuU5c3oRY/kAxrPMi6GUErKQnxSvNAPWo0z5e5UzYPoZ6a3eInlxML1CqCoocPJaNgNHb5VJ/NlgfCyHBrkJ8c/iFkEZLiT4TSqKZV8LtjbR07uKaDu/djzEUaYhzDJB9iNmpSvJrHW5b/PvG50NIVzm+y9CBuJC5rtWIyKaNaCYReA/EDpjJ4B4YUlqKtbJURydmDfpCGIw+YEanaAe89iPM6n+SpH9t6q9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 15:22:50 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 15:22:47 +0000
Message-ID: <e33be199-ce0b-4acf-9377-066595661058@intel.com>
Date: Tue, 25 Aug 2026 08:22:44 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5B1/2=5D_drm/xe/guc=3A_Test_GuC_v70=2E74=2E0_for_BMG=2C?=
 =?UTF-8?Q?_LNL=2C_PTL=2C_NVL-S/U/H_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260814210758.2779837-3-julia.filipchuk@intel.com>
 <178726439302.72177.15508685005673768834@61270ab9df2a>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <178726439302.72177.15508685005673768834@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DM4PR11MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f77ed2f-8f0f-40f4-772f-08df02bcb799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: skEofRF1N9ZtYw2veOkaQrfnwQGJJHYUlCLiPh19yCngwAsyGkc36OpL4Y30RQDUQ2rFpkqkOLBIqpqv22NmJ16UlilMfPrV1PmSbz2MRAkC1LIEAtSqsQNDIVxuzCXpH2sqPLmSbaKOfdsr4sqv7Dm4UjtZhAfVGNBa/heHKjKChs8tc+HgQOQ9U/roG+xbONCc44nKiee3BOoTqUarr8ArlGWvIVW2uFOZSxnf6XyV+0bSlA+Qajo+lgP4jC8u6J4Q+2CKOIKOURS98eYhZBzvhZGSyE+vFo7EG3Y0ODesRTWGoFqH1iDxdRlkDWMqLTQN4vKU8LW73aha8XBUmTkhY8QYpRZka7N7HTvk7/HWGFtrwmG7WHsBaUfwQofsqEPY3/B/TLYmIw6P+l+EaO3eExMDfmifp71Z26Yu7YtSdwUWhPn7RtbkqehfgsrT0Fy/oUFPCf0MQVu3MwV4LVNw5n4RrR4+Wzq6q/0APSgC1LunZfhjz1V1Ak1ZmFDonpbW7vHFw8odDYk8/l+bURsV9h6d2yI771jtmsTbn6EU1NSuJq3iAhdZDsujPpQun1QjC/0c3I+tKI+og+n7uID8UdFT/eFIVzeYdEAE3Hy/ZChwVs4y4wl7TlW/zwTY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0liNW1uWFhZV3dCMU9tU0FERlVrbmVkT1o4dDgvckwxV3pjNGtwbitxSHQ4?=
 =?utf-8?B?cXQvTVJiMDJHZWJGblVRTGpDdnMrb0ZaamxodWZYS0pFd2Z3dWY5UTdtLzNp?=
 =?utf-8?B?cG9vK2pMMytTUVNpTG5iMHB1RXJ0MUlTTFBIMDZLc0EvSHI2SVRkWEc0VCtL?=
 =?utf-8?B?TlhVNU5JdlE2eVl4T29IT3BDeWtvZDZVeGZvWE5qdmNvcHF1akE0TnlvcWM3?=
 =?utf-8?B?K0xyMFVHeEQyNm5mWUxyNk5nZmk1emNHR1FqZ0ZRWDUycGFyWTV6L20yNXFY?=
 =?utf-8?B?TGl6OGIyV3hYK2s5T3ZaNW9FYTNKdjY1Y3VxNVA2bHZqejBjTnorOS9qdThk?=
 =?utf-8?B?Nysyb3UvdWtlOHczbW5rb3p5cjlmbHFwUDhVL1poRVhpV1JNYXFrSmpFemY0?=
 =?utf-8?B?aGY2R0dJSXJFSFhxUWFjMVNzVzRRcDlDSHlWelJJczJOY0JHL0luTDEwbjg5?=
 =?utf-8?B?eHAxN0g4NWJYMXkzKzlINy9YSTVySUZ1NFpWUDNUWkErTzlhb2J1Zk1lVkJ3?=
 =?utf-8?B?NkdEOTI5WHZVbmh6anBDclFLNGNPdTVCK0tmOEYzY2Q5N3F2TW5XdWxwbW9t?=
 =?utf-8?B?NFBpZW5nNzlmc09PSWpHMFZEakJOY2I4TDBWcVRrWHd3RHRLTVdGNnlHTWpX?=
 =?utf-8?B?bVEyVWM2UFNhMUYyb0NFM2M1Yk9JUFNyVThPRjRodVhNdC9RL2IwaDlENTlj?=
 =?utf-8?B?ZnBBNWdnNCtNMUdQZnRFSVVOaE02azhUbXp6U3VMUDNwbWJuaEhtd1QzQzVq?=
 =?utf-8?B?U21Cam5seHRUSXZMQmRZRjhyNkpUaUprMUg1VHcwbkEzUWRCOFFOcjdQL2xR?=
 =?utf-8?B?TnJrMzh6am1TTkJjaVVSaXF0V05abjQ5emRiSnJsVDNzME9maHpCRXgwejVZ?=
 =?utf-8?B?ZzE3UU1HN05MNVhSYTBEakNlaWtJQStOcFdtN2xDTkJPZ05yRlR1VnpzV0JN?=
 =?utf-8?B?RlZBRWN3VjRCSHY4cjZmUDFxTHFENE9MWlJwcnZaeVBpajhjNGV3RE8yVThs?=
 =?utf-8?B?NzFNbE96UDdwMndxVWJBS01PQStXbVVMZUJYSFl4QUNWRm4xK3R5TEh1c0pD?=
 =?utf-8?B?aHJrazhpVTZXa3IrRXVnM214a3RFV2x2NkdBaXYvUGZ2N1VmZzEyOHQ3bVVs?=
 =?utf-8?B?QXBlNTBPYVhnUEp6NWc3OTBRUDdzVWJVbUZ1T0pUSHVCUDNCZ3J5Qy9QRUZL?=
 =?utf-8?B?N3RDM2RYTU1CZ0w5WHZSK0dOaGFZMkpDRDJMTXBHSkFmY1NOMDEyS0QyZFpp?=
 =?utf-8?B?SEhIb2R2NDhtdFJ5M0N6YXZnQWFxQ1A4aENaV0tGcng2aGIvMm1KY3c4WkdS?=
 =?utf-8?B?WkJHanUreWF6NFVvcm1lMEZNWFpLWUE2a21ZcmNuVlNQWCszT2VJcnpKcDRK?=
 =?utf-8?B?SllwQUIyYS9mNTUyOXdWS25lLzZYKzd0bXFWaWRrT1BlcWQwZTdveTcrMHJQ?=
 =?utf-8?B?QmJKcUlibW1pSUE4c3ZWdm9jL0twSFpPcG9pUXprTTdZTEE5Y3huRTdWS2JZ?=
 =?utf-8?B?YWNRRCtNMHF2OW1uSklYeDZqdXFFQ3BueWQ0VnJJbGFWYmVaY1doZTE2RWZV?=
 =?utf-8?B?UzZjVVV1Z1BVMmIraVczVW9iVE5ZelAvQUdycDBMc3BZR0NvM1lLK0lDN2hD?=
 =?utf-8?B?dmxKTkUzSnBob0VHa2RCZVlpK1R4Nk5mTFBLb3lBZHBwcHN4UTNRdEZrR3Bi?=
 =?utf-8?B?SlVpMlV0Q1ZqQXRnbjJyUHE4MXZUN1FHQ0krbDNzcHBrT1M4a2JkMEkxYWNx?=
 =?utf-8?B?citZUGpjYUZQSmZXNWlaTGNaSFpiVWx6cHFwQlJBS0p1dGFyOUkzbTFEUlMx?=
 =?utf-8?B?R001eElCWGxYdit3TXJuUFNtdjY4OHFwM2ZmYzQraWZ4dkp4YmhMS0NSUW15?=
 =?utf-8?B?cTlVbTNWbmRTalZPc0p0S1Z5YlVMZlJlRHFnOHBJbXFkK0tYbWMxeGpXL1B5?=
 =?utf-8?B?VFR5SzZIb2JxUUZ1SkFmNUVhQmZvd0xzYk1lR0NOUlpBT1ZIWUVBZzlvUjlG?=
 =?utf-8?B?RDc5Q1d4ZlpueFNqa1p2eEZ4THBhZUpMSitWUVcyc1U1emtiMllIMGZGNmFU?=
 =?utf-8?B?eHh6VUxWN3pYdmdRMWlpTE0wcTJoRWgzak1hTGt2MVVNVHF2ZnFQNzRpVVJj?=
 =?utf-8?B?YmRhZXdUbVZsVXFGeThVWWpCYUF4VDZnVGVielp6MTVmZC9OL1JhM2hEQlVk?=
 =?utf-8?B?clFNNk9ERmtNY002THN2WmZhMVdpb2ZBR3ZRbGxNTVdzOHVoR3ZoQTF3eHM1?=
 =?utf-8?B?UGxKMkxwckVJVHlBSHNSelMzbGxNQWxMYUFnbWJ2TGpWaWxOMjNiYTJVNjI5?=
 =?utf-8?B?ejBkQUpFTlFmUWZRSVU4WlYxUDVkemFvL2FVNm5pZVVMeTJqaGVDczRkSVNO?=
 =?utf-8?Q?UPyCbeIUl61sssNA=3D?=
X-Exchange-RoutingPolicyChecked: 5OIczD+CeVuXYnMXYZXIPhdgrGmgB2n6CZcrGE8arzIyMW9eW6sk9HVfmvpfwWfLBdm2sfeBGPaM1NO3Q212EyLCsrZ+vEyACnfr6KYFiojXjGMlKMs5g9ve2ICpeDkI0dSgehEWT7RA4DpMMZVVdYaKnzMQYMqbO4FwJpEH+0AuIM0mTRPFBK+v1LTE4+9kh3PR4zL3ktDmx72JKD74STQfJYwiXHY4m4OWmDI3HdknEqiHTqt1buLpuH4WfuzGd3JdNvpPLVhINzVAlI+c4Mywld4qD6tv2inN4mdFWRPlrSzvoOhuqZVPjSXZ3B1927JBOWOKqERwi5hJufOGMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f77ed2f-8f0f-40f4-772f-08df02bcb799
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:22:47.0613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSqurQSURSGPwyGtcD8ca+3ZiYaTvzqbIjnBnii3X5dmZ4Is216EE2svontAoba/ItJEFDG8RtgNiGy2cRXDaH6qEdVcCKkcEj4fwccMjSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
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



On 8/20/2026 3:19 PM, Patchwork wrote:
>   * igt@xe_waitfence@engine:
>     - bat-ptl-2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5626-2343402d0a2ef55b16b8701e1a345d0b798b2629/bat-ptl-2/igt@xe_waitfence@engine.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v3/bat-ptl-2/igt@xe_waitfence@engine.html
Failure matches existing issue and is unrelated to patch set.
