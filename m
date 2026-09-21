Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47008C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 14:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1210E85C;
	Mon, 21 Sep 2026 14:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzfNjaDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257F610E49F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790001417; x=1821537417;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ww/vpPUjNLOsH3PtHbBKHKc9uDeiJPUbPaQtQaKwJrg=;
 b=GzfNjaDD85YzahrBQtpiOWl8LIh+u/N3D+vD9ywT7sHdYWvGaj5onq6y
 +/YccX3fq7YKFLBcguGNmkrxmuzKSsQgjA/7D70UDsfYQl9NwQRadWbsR
 empQlXl2pXrdmvUkXD5K1+knWrOukOfM6LdKgjL48TFVzV4F1bIOfWt5Z
 BXpPo7iSLcNvMMfrRl2rHaQ04AUMXncKv0LFdEq4pgNSTSSuLI/xOZa95
 eNoaIWE+acYQg+Y9g7bDPjt/nc5z6p8W5xUK0vcFn5r8NrvIQMts4wSrD
 kmfDIX5RpPVNQ1GPjZRfUM6ajExUxVpwNoAtw7Zad9FZv34gL8EEo+4Oi g==;
X-CSE-ConnectionGUID: FDiH16wiThOzYrXwjK/M0g==
X-CSE-MsgGUID: xI8Y8tW3SUuPHJKbDVQ3Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89651988"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89651988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:36:57 -0700
X-CSE-ConnectionGUID: fwD1ERBNQqSCLq5jxQGuwA==
X-CSE-MsgGUID: f7yNNlNHQWiYs2BJ5e8J4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271858082"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 07:36:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:36:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 07:36:56 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 07:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTTCIPFv326yD+3YD7SO8YrLZ+Ln6xuSpj83vv4Bmak7mTDGS1yIV7YLBhRF1RzE1w60G2cN6ovO1Vp7sDjm1RO64sxxdnCYwWEi801ylmXiUndQ+m6Ahzp5CW99XCivTayBhs8cLKlkC+g0nA7ufMycj8Jy82lGZasgtDVEhfhOKv0n7Fl0SvghCDMx/oJNwVuV/jJ5c7D9aC9lHnOcQkDrxZUQqDmp3glD5H0V6AF6h0cuOd9kpkRMfdsJOiAsKAdWFKHFr18bj8MkTwvXR0T+4njlen6RPLs1iLriaLvN3PY5bTUHXU6OHc4YgYcUUECjkhOABZMEBStJ/GWq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwqluFcxDPa9W3DlubJikUv0V26wRVlhi0a+vkBVpJM=;
 b=HJkA3i2RW8H8hX3orKJUGi08WdRrqdMRukhuhD/qjlK8+XseLjTm3CB8AuPvXDj5anaXvWjg6Z2ms+0FnXYU+Wrb2WsaV3iiYtLs6Mhvzu9bAgKPtzkL9Dhg4Z4hL3pZjFJWkim83A3GlgJe/sUbOOOhJgO3zkhUDETh2Fr7lrDsPRNKRgDohZc42OdZs5UI0KTg5f+T/kaKpnjbGu4KcfSKCyWNDDC77uKz3OgvYatgSTJsrVE0hT/MWq5xnXspLrlf/woGFbObbv1KeQVaNKHVKAMC52p7Xqx+tG3EWnK3FkQ8a5/QlsFp3qLSzQFVC9KJtHM6m4TERhNftmXLtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:36:53 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0428.009; Mon, 21 Sep 2026
 14:36:53 +0000
Message-ID: <a4ccbd29-56bb-4a5e-b4d1-83137298d6ac@intel.com>
Date: Mon, 21 Sep 2026 16:36:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/10] drm/xe/vf: Add bounds checking for queried GGTT
 base and size
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260921092101.1243989-12-satyanarayana.k.v.p@intel.com>
 <20260921092101.1243989-19-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260921092101.1243989-19-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:802:2::48) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|MN0PR11MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: c28f706d-b548-4d5f-d9fa-08df17edc75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|3023799007|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: y1eO8C7hmPmcI1fTZhP1zOCHYkd7IDVvIe6xnXw1LKCS+7jtFn3vfgwIpwIsf/G+8gh1jfNkqdNCxPwjwi7zlLOHr0S3VY7k1vZJCX/TtpYS4XZvRWX8ZdlG9m95ypsGc8J2DAxzk+zCElBapQWIZxRMpkg5TLAxty6/gek5m3BabuSiwatA93FJ/UYaFVX+tqefhTJUdy/Vi1cz7gB7XLQmhGb94RoNmb7CFPB8oTCuPhRiugTQ5TvQR8COQne4TvGdEU8VbagGRoO56xbbJyWj2roBxviCeNAKbr8xxMJ7zRvw6bevl0e2x8IwVRUREd9nfdPWoXnx67Sp1ub+lAi3gNJOgpFPo09fxQRmOBt59y7yFHKOk3bXgH3R5nggUkeI7FWLwFPt2EvosIydCErl9pCCdahEFUXc+2SxTvnUBaGiMWs3caDbFERu6hRF4FJ5UIH6kdH7FGTxtCiPKwmnTiF+5UkoHnes5AWDJ7We1WXYXurAclfzmGSmNRwTB4Mx2aEJhx2zgeQWv7oEoWYA0rDm/O719Tej1vUyYq0gny1OOECV8J+0if/SaVmAOl/8pn0CzfRl2auXzIxX9lUxjLp1ON1GoelqbyapnTFUe9thZCTLsx8lT+gHyY41
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlYrUG9majR0WVkyUFIrY2h1anZ4L1k1QVpHTzhheFZwU1EzRXc0TzlxRUo0?=
 =?utf-8?B?N2R4VERkNTE5UEh5TnIwRkxkWllBWGdacW9GN01kU2tBem1aZG14SC8xdWxU?=
 =?utf-8?B?YVlCeGozV0tKNUJIVXBIS0xWZ2U3eWgyMHJ2QnNoTXVLcTlMall6blVQQWdw?=
 =?utf-8?B?Z2hLTHJTWFpFNVBBUHM4TGRCT0FORExBZ1g2Y1VLUXZ4ZFhHOHFYOTh2SVB4?=
 =?utf-8?B?cCtjU1cxSHozZ3JnMnFSNUw0ZUdRQUFVR2RTeUpGRi9aU2FYQWlwaGp4UGJ2?=
 =?utf-8?B?aG9DRkdjWk9IdXRPRlNvM09JaTVuL3FweG5iT08wM2lsRVhLYkdXeksxTk5R?=
 =?utf-8?B?bloxM0p0S0lmUzNPYWREV2E1TTZMY1NmdVQxTUIrekJZVDlLaW40R0J0dkU0?=
 =?utf-8?B?d0xpVnlPbXFWK2IwTlkyQjJ0V2p3T0ZPWnhnWk9WZURqT0NKNjQybFhabHJz?=
 =?utf-8?B?QjNiOFdRU3RHL2E5WWJVMmlsU3ZqbDRiWE8xdVM5QmlQTUNhUmZIVy9xTlRx?=
 =?utf-8?B?bDdBTmppTXJrbTBiaHhnQ2daaHFuc0dlNGV2T2h2bURCckp5VjhOcVR3RCsy?=
 =?utf-8?B?NXpUekNXWmJzWk9OaVgyUFRzODJnWm50S0VXQzFTUzREbUhLVEJ6K1htaTA5?=
 =?utf-8?B?UVhacVBzU2Z1ek5Ic0dCdGZmWGdTS05uR01WeUl4aE51aUs0ZTF4anRvWldj?=
 =?utf-8?B?VUozMmhMQ2pyUnB1c3I5U1c0N0hzQ2tmK2RXRUtldWhBblREWmg4QzBZdHVT?=
 =?utf-8?B?N3dubldPTVFzcnRLYVhYM0hneUxzVzM2UitFajJqakNXZlh2SHpUNjBsVCt0?=
 =?utf-8?B?UEpobWdwY1BiV0pKNi91T1Jib1NMZzdoZ0RIWS8wSjQxZndaeEhWSit1ZWYz?=
 =?utf-8?B?bWJNMDU2czNiUStCdUhvZ1BBRkRUTEx0M2M2VmlTL21rQklDUzlhNzVKdzVm?=
 =?utf-8?B?aVZKbEVXUy8wOVlvWmUvOUwySGdXTGpkbkdSc1BqMjlLUXVoVi90TWZCRVh3?=
 =?utf-8?B?bkYxS2F0bFptc0NlTFkvcWVBVUE0UjRNM01xckpXaTAzeGdjczU2aHM0Sklt?=
 =?utf-8?B?blZkRTBZaEduOUwzL1cvWit6alp1d0llaFppaUhqTWljMTgzQ3lkZERpaktp?=
 =?utf-8?B?bldmb3RxNERkRGxKVGNEeGF0SEg5eC85ZmZKZEs3eWFTZVpYUHFQOFgzYm8x?=
 =?utf-8?B?Y3pSazU0YXlJcXVuTVZ2a0RoTkVjWHZibW11M2FUck0zbkR6V3BLODFUK3pp?=
 =?utf-8?B?VmdUTTRtRWhvWnd2UHFrQUt4dmVuM2tSeUF2a2xZNitJbUpldWhBTXpnNGtF?=
 =?utf-8?B?U05pKzBqS0ZwMW5NaFlhMzBleFFkaUltYUlVS3JNekZ1UUludFBkSWdGZVZh?=
 =?utf-8?B?V05jZENid3piS215OUtIMmFFT2tjMzdJVi9MNk9hck9UcW1pM2NlMkRFVHpy?=
 =?utf-8?B?eDhXZFRDY3EyWEJkVEczQ3c4S2V4TFJmeEIycnoySHRvS1IyKzdUWVJOQU1S?=
 =?utf-8?B?blVjck40OGZ3WXhnS0lmVHd4Nnh3OFQ5THd3VXc1L1Z1Mncwbnl6dW85WWNI?=
 =?utf-8?B?Q0JFT05NOE5mZjdFSHlWbTcrV0hPU0RZQy9RQStnYmdZc0hhT2tMVFZOb3NL?=
 =?utf-8?B?ZC9jUlpJY3hIY1hEK1ZxUEtQSXFrRnZVUldKVktEZGx2R21BTHNwR1luOXRL?=
 =?utf-8?B?MTRWckYrbXh5Q0RmYXRrelAwOGkzK3RsR2dPamJZSFJRbW5panJRTTJwZTBZ?=
 =?utf-8?B?WTk4YW1IajhQdjBjaGgweFhkVFpqYTJyTEdTTTFBd0JMVFZ3Q0FDNDg4OFdV?=
 =?utf-8?B?Mm84M3VPMk4rdXdvdTM0Y1V3Rk1Nc01LSUE2VWJvVWEzTWJJUXE3ZE9iRzdq?=
 =?utf-8?B?Ym9lNGxtNFZTNmVoQkdpV04yL0JUTUhWSExtbTVJbzNuek9jQmtvU0pYdWYw?=
 =?utf-8?B?NVFURnRjVi9lRnBNZVdvcGI4L2ZPK29KY3Ard3grbWh0cDlzTmlKaWUrSFZL?=
 =?utf-8?B?azlMRnVkbHl3SitTWDNFTEJTUVpLK1EvaVd3VTVRZTQxTjBZSnJacm5JL1B3?=
 =?utf-8?B?Wm5XSUhkUnpoYUhoZVhMbWVUU2lWaUFkQ1d4UTFlVEw1VkkwQXlrRWpaRGhE?=
 =?utf-8?B?WGVtSDdXQmVRd2F5QmhlMk95VjJmWmViODAxR1EzdjVBdm1Vc2J6YmY3SVZk?=
 =?utf-8?B?bldlTWNXZ3hZZE50ZXBjTGt1bFlMUW14Y0RFRll5QUJCcER2b0o3ZjdjT1p3?=
 =?utf-8?B?Vm4wRU5KSHcxUlprODZObVc3bkI1VW9vd1JGUHY0b3orNmk4NGQxTmxJbEh0?=
 =?utf-8?B?Tlo1SE1Yb2xUdEFoRmJDa2tTT1U3NnB0eXhDdWNkZjFrMDBtSHlaMndWa0NR?=
 =?utf-8?Q?8E1DuXFRb64ZtKac=3D?=
X-Exchange-RoutingPolicyChecked: dEp3zuBvZmIgntMxFT0DqrAW0IoC7HjxYMZ6HoqR62xrsxWwhNF+fhX3jSrltVR/QpsQPnwBYCx7C2lczJBbCm9ciF61A8wBUWY1KWEqMAUjg3sBZu1Lz8kPoIroNSG7It58OJ69rCfUa+nzCthYKrqUWRYuqJB7coAbip01EFWIYdSyORMmy7rUdJ4q03ywMuF89lmTl5B1gBEAnMjDX+927yvIquNX9ytcPtBsha1Wm0yz7IVW+xydXMKkfJxUo6F4VZcL0jT1BqMLcmao8+nEvp/A6xLFQL1LveBAihEi2A+ZrCZz/lH5Ijr8xF+G99nECKClOvROmZUhN8Qopw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c28f706d-b548-4d5f-d9fa-08df17edc75e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:36:53.1250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmh773nBgENjLyu54bqAQVNWupqAxMMwwlAfPE8E/koxD/q7OjNCAP22Wzt3XIn6+oDOLAs8i5y0N6I7XSwqtjcNpBgaZ5pLFEsYSBtrSns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
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



On 9/21/2026 11:21 AM, Satyanarayana K V P wrote:
> Add explicit bounds checks for GGTT base and size which can detect
> and reject invalid configuration data from a misconfigured or
> malfunctioning PF, preventing protocol violations and protecting VF
> initialization.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V9 -> V10:
> - Updated vf_get_ggtt_alignment() function (Sashiko).
> 
> V8 -> V9:
> - Align GGTT base and size to XE_PAGE_SIZE (Sashiko).
> 
> V7 -> V8:
> - Align GGTT base and size to PAGE_SIZE (Michal W).
> 
> V6 -> V7:
> - Added new helper to get ggtt alignment.
> - Rearranged the base and sizes checks (Sashiko, Michal W).
> 
> V5 -> V6:
> - Updated error codes for unaligned GGTT base and size (Michal W).
> - Fixed review comments (Michal W).
> 
> V4 -> V5:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 45 ++++++++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 715dfb04a1f3..1d79bde2ad73 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -15,6 +15,7 @@
>  #include "abi/guc_klvs_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_gtt_defs.h"
>  #include "regs/xe_guc_regs.h"
>  
>  #include "xe_assert.h"
> @@ -486,26 +487,62 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
>  
> +static u64 vf_get_ggtt_alignment(struct xe_gt *gt)
> +{
> +	return xe_sriov_ggtt_alignment(gt_to_xe(gt));
> +}
> +
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
> +	u64 alignment = vf_get_ggtt_alignment(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	u64 start, size, ggtt_size;
> +	u64 start, size, ggtt_size, end;
> +	u64 start_query, size_query;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start_query);

do we really need/want to rename existing vars?

>  	if (unlikely(err))
>  		return err;

shouldn't we immediately check here for 4K misalignment?
it is a clear VF provisioning violation, see [1]:

	if (!IS_ALIGNED(start, XE_PAGE_SIZE))
		return -EINVAL; // or -EUCLEAN or -EDOM or -ERANGE

[1] https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L280

>  
> -	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
> +	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size_query);
>  	if (unlikely(err))
>  		return err;

ditto

>  
> -	if (!size)
> +	if (!size_query)
>  		return -ENODATA;
>  
> +	start = ALIGN(start_query, alignment);

not needed, as it looks any 64K alignment is handled on the per-object basis
by the xe_ggtt layer

> +	if (check_add_overflow(start_query, size_query, &end)) {
> +		xe_gt_sriov_err(gt, "GGTT range overflow: base %#llx, size %#llx\n",
> +				start_query, size_query);

we are not so verbose for other error cases,
maybe demote to dbg/dbg_verbose or drop completely?

> +		return -ERANGE;
> +	}
> +
> +	end = ALIGN_DOWN(end, alignment);

not needed, see above

> +	if (end <= start) {

impossible now, as at this point:
 both start & size should be already 4K aligned
 end = start + size
 and size can't be 0

> +		xe_gt_sriov_err(gt, "GGTT range too small: base %#llx, size %#llx\n",
> +				start_query, size_query);
> +		return -ERANGE;
> +	}
> +
> +	size = end - start;
> +
> +	if (start != start_query)
> +		xe_gt_sriov_notice(gt, "Unaligned GGTT base %#llx aligned to %#llx\n",
> +				   start_query, start);
> +	if (size != size_query)
> +		xe_gt_sriov_notice(gt, "Unaligned GGTT size %#llx aligned to %#llx\n",
> +				   size_query, size);

will not be needed after adding above checks for 4K alignment right after query

> +
> +	if (start < xe_wopcm_size(gt_to_xe(gt)) || end > GUC_GGTT_TOP) {

nit: we can check "start < wopcm" right after query
nit: we can check "end > GUC_TOP" right after query

> +		xe_gt_sriov_err(gt, "Out of bounds GGTT configuration: base %#llx, size %#llx\n",
> +				start, size);
> +		return -ERANGE;
> +	}
> +
>  	xe_tile_sriov_vf_ggtt_base_store(tile, start);
>  	ggtt_size = xe_tile_sriov_vf_ggtt(tile);
>  	if (!ggtt_size) {

