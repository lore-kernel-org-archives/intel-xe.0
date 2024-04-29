Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1504C25B5C
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDC510E3A6;
	Mon, 29 Apr 2024 20:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ce7AryAP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3EE10E3A6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714421683; x=1745957683;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6i0vuwnDQMStcQ5/MwLyTSDnOLfDbUelpYsSn9YU5Ao=;
 b=ce7AryAP81aWoCt7Q5eWMJSC2b3rSuOh34+jZBW70fzyx1iun99syHu/
 B/KME4mCYL0aTChaDaZLRK7mOda+vGkOAaG3XdBqqWPwxaFORpMM/VapX
 GLCQSiupywF+iBrJG+FshbvLTIpY/BmiYuQBD0SDqIx8l4WHxMXv8cEd0
 5/4IcMckJ1eHsxmtqMT+ni4+A5JmgzIfMV7ekCWV5WD/k4X9R9Etce24N
 EBm3bDi6fNDEPNJZvjFNH/x51p4bWZpCYcmKqANhM0E+120uh13PqVqN8
 CGQeltJjn/4PQFheHHfkBFEe6E0rO0znLWwMx8m7RRb4dgaFXPfLpKGzN A==;
X-CSE-ConnectionGUID: ASDNhnioRLCPSNc8CW9bjg==
X-CSE-MsgGUID: OjyRXCZsSp+mF/ksxsILjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="35493053"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="35493053"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:14:42 -0700
X-CSE-ConnectionGUID: PCbf8VB1S7mwQ3oTqX+XUw==
X-CSE-MsgGUID: Rz+I7fdWSQSAqqEsmzVkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="31043433"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:14:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:14:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:14:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:14:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLUpBYS2ZKYs4J1dhfZ3j+s2ALMmN/wZitWByfMlxjKcgoXKCFAM/8SQyTTLUE1yMsfRYKGVomRmR7P9pEur6IU6+oACmRCqUR2G+E7nkkSLaowqZOxOrV2eaHtSt61W1CbiblLHFzah6/Bwy9C91s0/28BWECKxVd0GOT+3b8lp1k2zg2HmQpu/NurlgwcVkp6LY8acZdkfQ31o1/9SMTELzc5KlPQGYArfqFWgeopvhRRtJBvL1yjgqVIU9lq61wSXr5adY3cc+zfrMM5YGb8ZyDoxK8BXAFY7MRWXUgKhyC8OyaD+bA97par+Cl4Ypk2kEUtMLi0EafcprxCgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0yab1xgODonX9l4lPIIUqS/3SgJU0d7SkzPF5wwaLQ=;
 b=MonTFF5+kl0cYIrNBVmKAYvtMyGwiFYirL7jlVhjioivHsHIrcVHmkGQCccpBEm5OCrDCMs2k0nFeksdnu1ddEG9VYmLVZmQM3sFNUCzrGm81TchWm8JhMQGMhFuMl2+pHgQzVcVDakU6rzSwBGvvhazfS/6E7WPhB3lmo/vLVcVl6EvY3+YU+FoDj+FzIzu5C/w1uYH+WTRW+ulrTKTcBiYFmZoDNkPd0vrW6Dk/gIlvpXNUWMaf347Z5ejF64sLIEb2RFe8ViUSfBOLoCURDEXNpyqoAR/ylaj5UHWMDjsQt8iNLj7AK2hRQiKLIIyLZmkb/YjHrcGZHXZ+Y7HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 20:14:38 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6%2]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:14:38 +0000
Message-ID: <41eb1fab-d9a5-45be-9c95-05a34fc7685e@intel.com>
Date: Mon, 29 Apr 2024 13:14:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/xe: Refactor default device atomic settings
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240425222346.13026-1-nirmoy.das@intel.com>
 <20240425222346.13026-6-nirmoy.das@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240425222346.13026-6-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c08e32d-36d7-478f-1d2b-08dc6888fee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTk3Z1oyMkF6R2Z5cWtJUUcvekh4ZW9tbDg1QkVFaG5tdjZuaVZJbVB6U0la?=
 =?utf-8?B?VVQzYmZFOWwvTjVuNDM1UEVIeGdUZzJjd01SNFBvdCthcEVnRCtkc0xsS3Zt?=
 =?utf-8?B?M3MydXpvNjVLMkhnN2l2ZDQrOWN2TDU1R0VkM2ZrRGZRb3E4Z3BhRFQvQUZ5?=
 =?utf-8?B?ZEdmMGMrekJTMENWUEpYSEgvbDFXSzFYVlo5NElrSW1HM1pUWVlqZUlwY1I2?=
 =?utf-8?B?bGQ2YkJZeDRRellVYWFDeHRBZDlpR0lJeVFSVHVMdkhvKytSbkFwclJNcUdq?=
 =?utf-8?B?d0xGVVVyeTBpelEvbk5ZMTlPNmw2MDVCOFNRYXdJSnp2WndEekx6ZUtZN2pM?=
 =?utf-8?B?NlpjMWQ1cnFpNVErWDJDaVIxamJkTHREVXAzV0ViSTlNQ2x2Zi9qckc0R042?=
 =?utf-8?B?WmMxZDB6TnhETk4yUGZZV2lhcEJELy9MTVppUHp5ZjZ3bnVQWVlQbVoxSHhM?=
 =?utf-8?B?NVVCNWVRZjVKdDFpbWpUZ1ZUZGc5d3VheGZuVzZPbTVLY1FsdG1PVlhDMmV4?=
 =?utf-8?B?blVxOWFaK09lSzB6YmRuSkJ1YWZLZDZCQUNKSU1RaGVYK0kyc3U5Z3JHRVpE?=
 =?utf-8?B?M2M1WTZUTFlPdW9IbXkremhOMklUcXZOZitHMmFyaWlKU2RBSnI5alhGT2Zj?=
 =?utf-8?B?eGZ0TkIySmdVazJ4dndoT3ZBVjhsdkdwU3IxU0dSdU0yOThJZWpDZE8xQ3dC?=
 =?utf-8?B?UVNRb2t2aW1CQjJ0cUZIVlQrR1RhelVGc0ZIU1Z3cC9iSEF1bkJ1N29KNWpS?=
 =?utf-8?B?YnRzUkV5aGRkMnl5cm9QNWhwQTgrTVdybWM5RkRkcWRKc2s2cWhrblpTR3Ew?=
 =?utf-8?B?Ri85NjcwbkJrMk5MeHJmMFdSMXBxUEM1OVpKQWdpTmxHQURSWkxtc0lTVTRo?=
 =?utf-8?B?TDRNaGp2eU8xd2daVnBUT0FJOHVMdXlBb3Y2eHh6QTNBcm04eDRVRjBrOEw2?=
 =?utf-8?B?TWdhd1BHS1JaYWFmR1FNM2N3bEdTaGpFMG5sR2I4bndPNE9yTDZUaHFHQ3Jz?=
 =?utf-8?B?OENpQU0yL0FLWVZYek1FOHB1ZkREL3BMNWswREVxWFphcmFCcWZ0UnFqOEUx?=
 =?utf-8?B?N3k0K1BycnEvTzFuQWI4YzNveHFsWnV3SUFVTWYzbVRjUVA3WDQ0OUlOUzhp?=
 =?utf-8?B?R05oRFVabzFqb2RqL1ZtclpTMzhyeWhKeThqZlZRU0d6VW5CRDg3ZndQYmxt?=
 =?utf-8?B?TC9rb2E2ZnVyY2EwdDdyZzRPK0dWWXg4RTk3TDBBeGluYWp2bTRLNm9TRFhz?=
 =?utf-8?B?Nk1ydXhqTnpZbG81SmpCOW11R2pGWm5hWSs1VSswSWNWRkI0cGk3Z2VLN1o5?=
 =?utf-8?B?VXIvMjVjcmcvYUZrc2JsQkNPSG90bG55eDV0aitudWJBbnhTZmIvcDFyR3FV?=
 =?utf-8?B?U1RsYUI0ZDNNWk1tNlVkYnNucXlmNDgrUkJwMm9PZktJdU1ERXVkNkpHdzBm?=
 =?utf-8?B?djBpY0I1N1Azencvei9LNThhQXJoLzA0RUE0VXFLMU1lNjdwWk9CNTMrbXNy?=
 =?utf-8?B?L3hQRENUV3pZVGZBNkxWb25WY3hlc1c3VE9zSXFlL3AySEFXQTJFOGJVTDEv?=
 =?utf-8?B?RUoweThXejBrMldweUNaQ0c0bUhKR1AxU1kwWUh4TXI4dWd4Mks1TnFJZGhv?=
 =?utf-8?B?bDNXK3NyZWtESGRtSmVJcnJMMUdOY3BtUkxmY0dWSlU5L3dEbm5NN3lianVl?=
 =?utf-8?B?RVVsUWRJdlI5QmdFNXI5dmRjL0tpdVkzR21LeG1GdkxGVDlZbkRjL0RnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDh4b05FMnJYcFk2T2JnQnFMbkV4UVFlemk0aXMvbGo1UTA1emxnci9Ib1M1?=
 =?utf-8?B?WTRnbXpBa3VSWlZXcEd3VGJtSSs4c3E0bGdPemhiRnZQUkNlaE1tMUxnbGFL?=
 =?utf-8?B?cUZsZzh2OVB0NGlRZzRWaittK1dUOWdzNUU0NGpuR1ZPbnVyOHFVZ3NqZW9D?=
 =?utf-8?B?aDFTWmJLZmtIcy9waVZvUkNtYUMvaFhHVG1WNUJBVlJJa3F1cksxZ1lWOG1l?=
 =?utf-8?B?N1hkelZ5MEFVWVRBVm1GZ2VQalhQMUdlMmxYTHRtcENBdldabFoxTG5xR1BD?=
 =?utf-8?B?ZWZqZGFmekF3NEpqb211cDB3ay96b0pQRENPZDhLNTFhLzFCdDZyTnl6Qmpn?=
 =?utf-8?B?Z3hJVmJuNTdBVGxhcUcvM0QrbWQ2ZER1eFQwb3A4dnYzd0VnT1FZV3pUcVRa?=
 =?utf-8?B?aG41eFBjYUpETHZYcWtTdUVpaG4wWWlzWi9ZUkI0U1l5bnFiZ214U3hqa2Vt?=
 =?utf-8?B?dStqTWpoTmpZUGpVSE0xUXppVExUdkd1WFhCZFRTekNIUkZEdE9VUWlLd2ZQ?=
 =?utf-8?B?MEtvSllYQkU1TUhxZVVsRjJaa21WVzBtWDByZGFKNTNvcmVBRFY3UHo2SitR?=
 =?utf-8?B?cGlSaXY3OFZYQ0RIU0JkdllIMW5TeEoyUVZmYXdIQUdJWGtteGhrYVF6ZlJy?=
 =?utf-8?B?QjJ2WWN2TmFaRzllVG9DQUV3ajl0OGJBTzlOTnBIVHFnTFBxaDNTSkIySEh0?=
 =?utf-8?B?Z3JLRXJMQUh6RXRDcnlENDBlVTRDRmhhUkJLSm1zWUZoOWM5N3Z2WG1IZmdk?=
 =?utf-8?B?QW80VjRmU1U3VG10WUVueWU3MnM1dFlGa2NDWTd5WVpOdDZ4VjdJK1dqMTAz?=
 =?utf-8?B?bnpnM0hORW43ZHdoazV4OTNpK005MWJTNjIyQ25CQkFqVkdXcmJ2amZWQ21X?=
 =?utf-8?B?UHBKeDk4TWRubEJqYk1nZnowYWpRMll0UGExS0loeVZiKzFQWlNuRG5qRHJn?=
 =?utf-8?B?Qy9kYmgxOUZyV1VjdTR5UnduZXNrQXNJQTRtL3oxU2pUMFFGNUxSS3RnSk8v?=
 =?utf-8?B?ZklUUVlERktTVWJ4WHcrdTRBTEpPZTNEOXFXK1ZYUHRRVjBDdHUyZjF5enBs?=
 =?utf-8?B?L2NhVU5RellrRm1FT0lRSW5TcGYxVzZLakt2VlZPMWUyVytQbFQvNlV3cUwx?=
 =?utf-8?B?ODJiYm1YU0tGZGlhRHdhNzdqWU9UMWlFRHN3aXpwZU1YV1l4YllmVk1jckI3?=
 =?utf-8?B?emQ4b2l1VXZSellrNWpOZ3BYV1NBR3dSOVFzLzlkejFvZ2RweG81TVVRQWJv?=
 =?utf-8?B?bFMvRTV0QU9zNTZQTmlDSllnU3NkdHJmSCs1NTExWUFsd0czQm5ZS0ExakU4?=
 =?utf-8?B?WjNTUUlaTTd1c3lkbGNFaE5hbG5PQ0d3dzhqZCt4TW9JbnJvUVNsY25zRkxB?=
 =?utf-8?B?OXZkWWppZWtHYzZodjErNExOazhna2RBdVppOFVqMklWakdiRERYejFLbjRB?=
 =?utf-8?B?R1lxeEp0SE9IazhQMWJFM3Fvd1AvazZWVnZCQ1ExOUYvUUpjUVJSZWx5U0Z1?=
 =?utf-8?B?MHB2OEdQQXg4aHF1ZEtpYXpKb0RDaElUMlhLUDN2WEpIZysxTlk4V01jSW5l?=
 =?utf-8?B?REFUelZrYVZ4dGwwZnAybkxnTkhzZE4wVXJudVBrM1hPSE54dVFRRDZsSXNP?=
 =?utf-8?B?QmhmODRMTFdyd3VVRlQ1SnBXYVpRNWdIRzQvR05kTTl5MlpUeDhiNng2OWNN?=
 =?utf-8?B?UitibENpS1ZpMkpTZnFaMDZVYWZKMEhrV2lBWkJDSkk1eEQxZVBGdVg3ZmVn?=
 =?utf-8?B?OHc2TXArblhOWTBqMUY5YzF1TWIxRWZ6OEZFTE5QWFVoaU1XNGpJN2swcFNw?=
 =?utf-8?B?RFVjaFlJS0ViZG02cStUZjFOSEZ3RSswS1FYMnhWNzJMUE1zWDVXUzQxL0FQ?=
 =?utf-8?B?Qi9pbVVaRWt0ZXlLK0FLYXFDVE1GRUpxRnovWjUzbEFtcEphV1VEci81d1M4?=
 =?utf-8?B?eHYzdjBXVWdjSnBURGxrSXk0akJnQ1l4SkdoKzNMcXA4dFFLYUc3eXBwWjJt?=
 =?utf-8?B?NThQaTl2YXM2WDR5TnRvT3FaYXh3VkdUdFdkbTVkOGV6YWs5N2JBZXdEa215?=
 =?utf-8?B?cUZMWkhDaVhkYnNqSVorcXJPVGZJSjFRS3QyR2x3R1BUd3I1VFBpZU5XRllJ?=
 =?utf-8?Q?5iOcxnUaG4Ys87mGYtzW2w6PD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c08e32d-36d7-478f-1d2b-08dc6888fee1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:14:38.2007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phpNIFJYc5DqVxPGv3XY7nTO+zkN0pcMbAeUu0DguFGiUz3VxXuQp3uNCNGznR87d6Zu8/dUG5YfHa2BMJ3RSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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



On 4/25/2024 3:23 PM, Nirmoy Das wrote:
> The default behavior of device atomics depends on the
> VM type and buffer allocation types. Device atomics are
> expected to function with all types of allocations for
> traditional applications/APIs. Additionally, in compute/SVM
> API scenarios with fault mode or LR mode VMs, device atomics
> must work with single-region allocations. 

I think additional patch may be needed..... for the Compute mode
handling.
I'm not sure correct thing will happened for 'shared' (multi-placement) 
allocations.
HW will raise an atomic access page fault.
Our page fault handler only checks this was atomic fault and proceeds to
migrate the BO to VRAM. I think PTE_AE bit won't be set with your
changes, so seems are in infinite loop of atomic access faults on same 
address.

I think we need to fail the page fault in this case, so HW raise CAT 
error here? As atomic access not supposed to be allowed for above case
until future uAPI is added?

And need IGT test for this.

-Brian


> In all other cases
> device atomics should be disabled by default.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 24 ++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_vm.c |  3 ++-
>   2 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5b7930f46cf3..a8e9e8592c43 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -597,7 +597,6 @@ static int
>   xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>   {
> -	struct xe_device *xe = tile_to_xe(tile);
>   	struct xe_bo *bo = xe_vma_bo(vma);
>   	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>   		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> @@ -619,9 +618,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>   	int ret;
>   
> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> -	    (is_devmem || !IS_DGFX(xe)))
> -		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> +	/**
> +	 * Default atomic expectations for different allocation scenarios are as follows:
> +	 *
> +	 * 1. Traditional API: When the VM is not in fault mode or LR mode:
> +	 *    - Device atomics are expected to function with all allocations.
> +	 *
> +	 * 2. Compute/SVM API: When the VM is either in fault mode or LR mode:
> +	 *    - Device atomics are the default behavior when the bo is placed in a single region.
> +	 *    - In all other cases device atomics will be disabled with AE=0 until an application
> +	 *      request differently using a ioctl like madvise.
> +	 */
> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> +		if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
> +		    xe_vm_in_lr_mode(xe_vma_vm(vma))) {
> +			if (bo && xe_bo_has_single_placement(bo))
> +				xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> +		} else {
> +			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
> +		}
> +	}
>   
>   	if (is_devmem) {
>   		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e41345c1627d..ac08b6fd537e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -805,7 +805,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	for_each_tile(tile, vm->xe, id)
>   		vma->tile_mask |= 0x1 << id;
>   
> -	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
> +	if (vm->xe->info.has_atomic_enable_pte_bit &&
> +	    vm->xe->info.has_device_atomics_on_smem)
>   		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>   
>   	vma->pat_index = pat_index;
