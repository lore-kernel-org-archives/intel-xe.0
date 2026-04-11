Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24030F3ED54
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 14:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9915810E240;
	Sat, 11 Apr 2026 14:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABRtvi53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914DB10E240
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775917444; x=1807453444;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q3Ov+xYSR9XvkVlo/qkdc/FMG+RKidjnc+njTvLaQ2E=;
 b=ABRtvi53DQ3kK1ahgjLMmmNn057wFpM3iu1Q+lixvPCwVISFM/roZrH7
 3RW2nrzhl/sbtvUUiZsSKK/hGM3rx4pb70JE0mFaRHcdyac9MvYrwO5lb
 F5RApVYyHLAWQ044RcjDKNuq43RjVsFhFT7Utzxi8U8KWUYst2o47F1Bf
 GAdib1RncRrztholn7k6CdVfNvJSKGjyrpPXptFwwm1l11r+JnhrPA5BU
 sAajxwy+EOKWAss1mmK/jTZr54BJ7UDbY0Z6q1YHsYfg3HGf9Mun1Gox4
 sdx9zFupaujLtm7XDQiiqKyUFNX0G98gUvAZIZOHey5hGUj+V0XhMhjuY A==;
X-CSE-ConnectionGUID: 3uUGrmb5R6eKI5K0pGnCcQ==
X-CSE-MsgGUID: PPhsqDmtTsyXMqtmmy08kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80502705"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="80502705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 07:24:04 -0700
X-CSE-ConnectionGUID: WSSTMuPCRyCX3AFq+w/S4Q==
X-CSE-MsgGUID: lOca9NirQHy0xqIKagQh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="224624457"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 07:24:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 11 Apr 2026 07:24:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 11 Apr 2026 07:24:03 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 11 Apr 2026 07:24:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ugn4+dhP9wVN3ovCI7iUE0kaDOlGRZhdd7pPjw00HJEiXQHyYkAO2zlHM0/nfkSKWDCOrA8iTaD52JrVpA1OHY/RcY6RlYv1A/sIDCYj0XcrTYbFEGSff8uh9Cmsa04dSIZls6ng/yO3U3SLyLTNmXONMIPwSq2EuwU3EbjArDwwoNhgMs+YCUYP9gm1aI0VSq2S5YmD3EgLxVXy7MNDzHvzHtTgNqK9w+rj1x79D/q/q3yY5i9HRYSEW0FaBgdnRSIFc/amnSrif0nt5W9FFiz1ZvDeAiEbvGBGbTw/AR+s3gWFvo+8rD3a8k8QrGyjd+vWNn9Akw6wnBYy9WhtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyQDMJwxnQSuzi3qnCVvwbPSUDRLku4GM0B4o7qsI6M=;
 b=kct3uJ2f7siDBOK7pLsjHTdETeiBVF7Yh61/nuz5FQ/Tv//yRv40QFnaG1y8+boNR+rPhcpDi+vP25oQiSidY42mWBn4YfA8F9ptRLbbNiPA2hR0Lo9GCctRnjD0Mejf6Sw2BC5V+OkPg1SEzUnlN5ozfv7xS+oqO287KarQys9pi0PdDmFVjDXO/bNZZoI8LdnLX9OI4ZHsjdUvxCte9IEqcGIPDmdN039rCe7z9RrZLnfhEo3TzRQPjpIhP0fvkJ7tLEos3X+gg6FOkO8QRybxEbeMMdIzWYzNDp5VKGERTv4iL6pm8oq/3nPzQwegZv1pbuNq4kOVM8v25DezJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6851.namprd11.prod.outlook.com (2603:10b6:806:2a3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sat, 11 Apr
 2026 14:23:59 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.044; Sat, 11 Apr 2026
 14:23:59 +0000
Message-ID: <597d20c1-95de-4966-9415-09f68085dcc4@intel.com>
Date: Sat, 11 Apr 2026 16:23:55 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Add_support_for_NO=5FRESPONSE=5FBUSY_in_CTB_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260410110457.573-1-michal.wajdeczko@intel.com>
 <177586164256.452684.18066211966560374429@a3b018990fe9>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177586164256.452684.18066211966560374429@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF00000151.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::869) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 9395a4f0-e3cf-451e-bcb4-08de97d5f8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: e25Q/5Axsqd0JcWzClS7c6BcUlKNFn8iDlDg8WMpmT//56yl3MXmnyENQazt32rThqTEHoAvZxqq93RxD9AFzUETu3dh0yvgfja1vWNGECIIq/m0IIq4GTnywijUXcDVYiwteAhAD1XLGdrsevixDAhLdApvDooy7GoeqrDfkEbkQUcsadTwSyRlYfJ/+K8imD/5JQxZRYgGWmTbFt5GqCgq1gZXYaBB8ekPojo5ZETRGNgo3YA0OloNi3Zs6W0MCJLeR2M48G869M3AIahw3jqLNFAlZj/89uY7/vHHBjYhM6GbEsOo0pGArBZ1dbvJ/01ZMZj7NUNFPfMtkIGTOVL/xwbM8rgi81tJpQbxEgFFQk+LMw+IzyFcGkrnzi52Tijmc5DaR/gMarOI69kKmP//h0CQsp12qON3yimLCdj8rsrFQZXOq1Xy5luTJUMkUPGRRWtAsQsC/EnkCQePT2NnDTma8COvpI/zGhPS3vlwfz7zdh8p8gEFIo01+6QTGai2XOQXMBTAWrUPe8OSa6epjI/lw3VttZW/BZqpegrEgfnx+An35j2hHy1DSdhTXa0Qcn3X7riJWbYISPMzUFLod8JOtZheXWtZO+fa2KP7xMcXwzhLTSkLMmbQ0A6jgvQFk/qq1FH4nOggA7/X0fZfxr7RSGrzmrImLYcyWiAp/kYYRc5088/d0wepJxmm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGdBK2d2eENsT0lZYkJ2RXN3OFBWMExweXlVRmZrU0J2bzVBdFRKZ2Vnd0VN?=
 =?utf-8?B?M0tsQXRFVm1hdGM4aGRUQ1JkTUp4OG9HL3c2bmw1cmZSVUp0cEFkNUx0NWRG?=
 =?utf-8?B?M1NlMTZScWdtc3U3Uys5cDhPN1hFWE42UGMveUIzb09rMm9maXVDY2xJVVoy?=
 =?utf-8?B?SEFjTlVjcG5vTmpuWURxbHRZbk5ydEUzc0g2d3dpeUJrWjBXWXJUbEJkMUZL?=
 =?utf-8?B?bGFxc1JkVzFBOHBtb0gxR2FXQmZwa0t3UjV0VEdXTXNLUmhhZzJ1QlVXSURh?=
 =?utf-8?B?WXo1K3RVYXBTZE10MmYwWjMrSVhWYmFTcVpYd0ZqNE5qQWwrYklQTDQ2b1ND?=
 =?utf-8?B?WTBzV0RqT3FjckFBaXFRa1RJMlY5d0lrQUgwWm1OY2dSUm9YZ2FSNElqUW9R?=
 =?utf-8?B?Uk95VlNVZE40eGhjVnNiSSs1QmgrdUg0ZmdPWU9QWmdhOFdhdENMZHpsVk9N?=
 =?utf-8?B?c2pvYldMQi9od3I0V3hwQWZsYi94eForWmR0bWRPTU9xVUFwWHg5K0JsVTNk?=
 =?utf-8?B?dlVTdXBCb2NlRWNvRVUvdTljUDVtakZ0eXNiWTdOS2hBNWR3YW1HNlgyZzNW?=
 =?utf-8?B?VS9HdzRLSTNreWdRRjVVQnFUZFBPNlJvdmdyUFVLdk85c3lDTVlvVm1WRmFm?=
 =?utf-8?B?dDhuOXA3SGlKbjcxSUlaZlBvWXZoTEZWQWtjVE9mSWVKSE1QT3RRbE5JY3Qv?=
 =?utf-8?B?RDhoVHgvWU1qL2ZpeVZTVE9yZTdRYWpraWhFQ1QyUDR3QlBqSGhJaTc2ZGZM?=
 =?utf-8?B?eWw4SDZlMFN5ZTRISmpVZTFQTjZxcUJGNDBoekhma0ZXK2V0ejR6Z2hCTGwr?=
 =?utf-8?B?ZG1BcWd3N3ZJTWFtSXV5eW9IaFdvZWRnWTFscFdYV0hTbFBlODUvTE0zRE9H?=
 =?utf-8?B?K0pMMEl2UHlUL0tGNWJhcFozOGhsMERpT3l1cTFYUklxWlFWYWxaVnNUU1VI?=
 =?utf-8?B?QitYcy9qZ2hJMlRNa09wc09pOEY2bmpNTWdBZisxdEhoeXhJVE9WMFVyc1pw?=
 =?utf-8?B?MnFiMHFNdVBwU0xKSW95TWZKLzRVRU1WTWM2ZE1Lc0VSZUJJbzQ0VXlQOVpI?=
 =?utf-8?B?dEd3VWVRTEtLNTBxNk4xM3pHclNid1Vvc2dDeWNhOE9qcGxMQUdMaXFOckdG?=
 =?utf-8?B?Nm9rWFUva2E0RUlaWnlucWxDQmpVdU81UCs2ZlBrN09Rb2hjV1dEWTkxZjY0?=
 =?utf-8?B?bnl1N0k5MEEybGtiRVZSWFpVOVhoQm9mOEY3aGJFK0F0MTMvQnNJcis4YTZV?=
 =?utf-8?B?MkdwV1U2MGVGcU00TTlJZTRjRzlMUzhWMmhRWmNhQmRySnhTMGxTT0E5bUpI?=
 =?utf-8?B?TzRVaytRYkNJYUgrWllSOFJMN2pwMzhDaDR5YjJxU0lqd3lvSUdNWWptclZw?=
 =?utf-8?B?cmNEWVZrUjdnZ0hnOHpDeUVIMElNUGxJcnlNWUxhRGQvMGdPNWNNUWpTWUk2?=
 =?utf-8?B?MWhxK1BOMmFpeEE2VGpWVkpFVUlSdEZoZjY3OFdCUTRPS2ZhMm9SVWw0cFVQ?=
 =?utf-8?B?VmFpakVwNkdNWWpFRkdNMzVQYVYvQ1ExQTNDVVgzVFpPK2ZxNTN4NklnV0R0?=
 =?utf-8?B?R3dnOUpacG9JNCttclVFeDJmc2dSczE0U1dRMU9nMndiWmNSUnoyblpTR3Z2?=
 =?utf-8?B?aDJpWFJwVFVablE4TkRkczR1dGEyNmNXZXdGUE9CTS93MDZoRnQrcEk1OGtN?=
 =?utf-8?B?dmU0eEcvU3dTWEhEWCtWYWN3dEVhSkZXM1laTExPWkl3TXl2OEV2MGtTdUk5?=
 =?utf-8?B?dTV1ditHSkNXWVgvYlRXZXZlQWFBdXZTa2J4MzRzZE8zSVF5OXZZTjJNai90?=
 =?utf-8?B?bjJLa3VLc21RTHhYd2tKN0RXWFFPeExKb2thZnd5WlRaRjg4djVWaFNPcDBC?=
 =?utf-8?B?SGhzaE8wNFBjamJYM1ZtRXg2L2Q1OHZHSEsvdWxoWnM1aFgrY1JqZjFtSWtr?=
 =?utf-8?B?TjJZalpFbmJNYVB6UHRpcktsZTVqWnFoSCsvek9Xdk5wVEczUTJJRnZDaUtr?=
 =?utf-8?B?OWJuK0JYUm1EbFlVa0h0KzVvZ3NsS1pZeHpWWnJ5Y2xNYVptSnBqYjlzd0ZC?=
 =?utf-8?B?V1JEUUZnV0lsem5lbUROcjZmc2NDa0VIVVNhd2U5aDd1ZnZoQWwzSjlWZnlF?=
 =?utf-8?B?Mnhab3pqdjFrTnpEdXphN1Z5WWNldExkT1puR2c2US9NaG9OcjVXdzNaYzQ1?=
 =?utf-8?B?TnJxTWtLSlFvWGRvTEZCNFBOMEF4OWNneXdrb3JZYzhMSU92dVNISURMR1Fj?=
 =?utf-8?B?N2l2M2c3NUp4Wmk0VmhFU3VQdWQ5dmVoZ2ZGVG9SZTJaRnhtck9aSWJMNVpm?=
 =?utf-8?B?OUt3dHJYcHJkMHNRR21GNFM3WFlsQUtGMXJxL3hYRWtVL2hKbFNnWXdyZDBx?=
 =?utf-8?Q?7/tA0pJEquEZYACE=3D?=
X-Exchange-RoutingPolicyChecked: BfHWdliyku9cka/Rjf/Xq3+mW4zAUg4+lG8flj10TndFWVmFJxLme/AR108DTjgyT5r6ZGfMMBpr3BXLsYRzHIeYG3Wi3OEivLQfRYdzM/jupvpemTFAO/WisGW2pxIvaJkChOF+ZP0Qp3XRQ3CWJVY+IhGeLfhSFQABfgrP2hfCfe93FD5+jthnovzBymjhv/cDnsJJejCxXi/2gsY44j5Oqsvm9Zaa3HhRvmGwweZOErJxHci5IwoY11Pg1w6HgOE1p8sDbPLtWkBrEWGlA9kcoCNjUiyD+Q9ysLHaLu2GOcNzmYtaQ3p3DUd3FFWlESjppqxcVvyzQnQGohz0nQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9395a4f0-e3cf-451e-bcb4-08de97d5f8b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 14:23:59.1536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgJw1uaqWJBU14IcZ3HpTZE++qUoBdOpZ9wAN52Sy5wXeI5/rh32gQ96Yxi4WExAf8+VzPJBAynyXSfIbzqMQqM5spcSQr+JKzPStdBl/Qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6851
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



On 4/11/2026 12:54 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Add support for NO_RESPONSE_BUSY in CTB (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/164357/ <https://patchwork.freedesktop.org/series/164357/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164357v3/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164357v3/index.html>
> 
> 
>   CI Bug Log - changes from xe-4883-56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db_FULL -> xe-pw-164357v3_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-164357v3_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-164357v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-164357v3_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_exec_system_allocator@eu-fault-4k-once-device-host:
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4883-56a9321dbb8dd1a1d5e85fc86bd30c4a0d5147db/shard-bmg-1/igt@xe_exec_system_allocator@eu-fault-4k-once-device-host.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164357v3/shard-bmg-7/igt@xe_exec_system_allocator@eu-fault-4k-once-device-host.html>

unrelated and looks like #7592

Starting subtest: eu-fault-4k-once-device-host
(xe_exec_system_allocator:10270) intel_compute-CRITICAL: Test assertion failure function bo_check_square, file ../lib/intel_compute.c:148:
(xe_exec_system_allocator:10270) intel_compute-CRITICAL: Failed assertion: output[i] == expected_output
(xe_exec_system_allocator:10270) intel_compute-CRITICAL: error: -nan != -nan
Subtest eu-fault-4k-once-device-host failed.



