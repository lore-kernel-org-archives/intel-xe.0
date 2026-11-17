Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E9606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eV84UklM;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hj8PfaP8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8630810F2AE;
	Tue, 17 Nov 2026 18:55:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4B310F890
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794941718; x=1826477718;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7weJbASKvGE49wRCvMyUiFXhOzWUocaRMbHLDFqd09Y=;
 b=eV84UklMLpdnyVK/Dtd46aeaYSgpEzQYDCZZDRX2KjhYXFRcblNxRtp9
 o27WPnsAdAoGgLNtxvQuYvozBFLg3XK882F7F6UQYxCvv3jPfPb94yFQq
 oXzaUkeXopB2c065WJo7K0F20bzBqkiSrlK07QIJc2s0nsfhKwddhOIC9
 3BpqmJvhYlPmpaWJsD+bm1Vv7gV3PSuSGFsKxqAnAzDXJE9QMPN98XwwG
 juJc6kQDPO//ugtAkhmLl2rq/cZiC/LdoODYkqfUM436Anp+Y0yzHRqv+
 uQXO4yHZCokWeXvycsBHFlErSH9rNNt5Uj+4aawUdjotVRpu0hvSFcBGq w==;
X-CSE-ConnectionGUID: iTKS+U3dRZurI/2HCa8ehQ==
X-CSE-MsgGUID: F2e3XGE0RHm7yIH86YkYZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3833158"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3833158"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:55:17 -0800
X-CSE-ConnectionGUID: bGbfSvG0TsCw5SbJ+Zpbxw==
X-CSE-MsgGUID: yoooQtSDR+SDVM46z34Pmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9691143"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:55:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:55:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 10:55:05 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:55:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/cs6Mxe8sfbFlcSN9WwKmVMFmxGwsfjE/DZNM8YCuODFS6eu0NOY6kySEbeFnB8THgKWMgdYxDlKOuxliz4a69kfOp2JrCRPK2oeyV0fH+16uNU2PgAyorYH8ml4r+IeCJrH2mf5G8T1Lx8Z5D4Lr3Zx0IZBYTNaqVCnha/8ZX6kz8VHXQsPIOSKHQCl2U17A3gW1epllBipgi0d48ivCpw29VVwQDS37dpTVkf7UoPXW5h0YUfsJ7yWcHvERrq5NuNBGrhqUuABtrfPMCgXWFShd4xo7vkBtLDC79EM0WXEJYaR9YC2pWHLFELhFLzjpHsAFqArYrojiqerU9pFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkXoJJxUThVqlgdQl+XqrbppHXOjMuXETCWYttd8pYU=;
 b=Xj04rylpyx2B+uoqqWgtXNJEyuV1MP2jUwcSaDdmqOEqJIFwjWhtQy+pF5nqnT6A1hJBBB/6BwxdyGakGrxAKt1XAwsJMGcFDm2TStOZOn24fDr1wBLMG1vvkBh4UySVXwA8b+D9ODx2ZUqIA/tdLd3v5bs++gSJlFiuaVTTUfuz/NWcHye9Y4A6NOtD77HQSraXBKv7coJaggcRdGNTEZL8qIZUKSp8tkxOn1M0RuJcvgYC47b3oNRFAVM1UOAsbhq4ukO2daDYDa2xJZe7+A0YK+nexWR3zjTwIkc3hbpesN9zG2UrW2miPZS6XNbRHn6ebdlA4Xd8WIzKvJjePA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkXoJJxUThVqlgdQl+XqrbppHXOjMuXETCWYttd8pYU=;
 b=hj8PfaP8JDBV0mx7g46eiIZzDVoWcMDyRQ7k8MDUyoFR5mmer0A++CLrkwuQylPZMmyXe2pnEiEEc/j+NcGzaf27wm9TYtOJHFg66c5kWveEtXGgICzDSV6rI7BOJsd9XmV9Si1pJxTCXSbgCMpSoTMw0hsx+NEL3HURdvXs9F0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:55:02 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 18:55:02 +0000
Message-ID: <209887ef-5b22-42c3-b903-c699f9a89f63@intel.com>
Date: Tue, 17 Nov 2026 10:55:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/pxp: Enable PXP for NVL-P
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261117002529.1925156-3-daniele.ceraolospurio@intel.com>
 <20261117002529.1925156-4-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261117002529.1925156-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0203.namprd04.prod.outlook.com
 (2603:10b6:303:86::28) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9e8859-2532-4787-e9d6-08df44dc496d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: fhJTnxNGWSKngG0jYASEcQcdBdUjX33FpJtv78XRtccwp89cJYn2F71nNLenoTez8p8kGdn0VzcrG/RuPW94yTGTMaJk71nIt8zN1qBkbRVLQVevuInCX1Iz8Vkelesw+M+8QxaBbSJczKlXE90MBvz0kz60YubJjp0b7SSow++nvX1fvqRvOsBEvHDfNv32CEiloPY8uIOd9+P1tNE+J+0vY72IvHPHQh9g1Yo+otL/rkLI5Qz/47yt/6svzRngQArSOnPbBWuvottXsWXeFNliDBi0NmvmrIFaW5iUvOVo84N6OU0U0Lf9H7lD+XL0xNhhj1dlBeyDEy2v3ols2D6/xXHYFwoJnHSEMbJxcB7eZFI+vX/8MsZSrXff5blnFaLOgq4CQoVZrH40hUVAzgME/kJRrt8PCnOSjNeP0lK0ZQXQf0MjKZ8bsvkIyliWkiPxbtG0ZKk+nS8ic7ye1zeFKJEGpgmE9NcwLJ/rEoR+U3qm/oYvOlRdF2iv1U3WEycYeaESeUA/bgcaXdVlbF2KFU2ChZBvb5e/kFmLHYpvrz0TpAMHv+rVzyrafdRb3wi+V9FiFVo1M0JJObyxUOREMZBL7x0puBoXIkVkzkxqFeSgvpX/yGxarrsAo8PLCJlBIskfew75xN65V9Pe5HyJVcynyRoRDWdVHQ0prEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTNYRG5kUzBmckY2RkNhUk44bmwxUG9QcFE5dW1nVjZyQTV1VDR5UFpid1hz?=
 =?utf-8?B?TEswdTl4Mkg1V2x6NlhtZEhuWHAycWExdFJkMDkrSEhiaGNXRjg3SEVJMEtR?=
 =?utf-8?B?Tm9CdXZXdGxwejNQTGg3SlByOExhTmJkUnIvQ3RmNTR0S3l2dUsyb280NDdD?=
 =?utf-8?B?OUR2ZHU5bmxoSVlYNTR3TndwZHlpZiszaEtJTXE4b1RpUkIrZFJWd2FmRng2?=
 =?utf-8?B?V0RtQ1lmQ2tIU0oxYmNZQ01lalRNY1paTEM5VDNySXRqSmhmaWpLb0kwSXhn?=
 =?utf-8?B?RC9odUZUMmVlNUNlVXkxUDFwcFdKbEozSXlEdkx3YTY3RVRjbXRRK2pQMytj?=
 =?utf-8?B?dDVlWUpLMnFNSDNKYlQ2cnk2YThDcUpaZk9CRkdhdE9JSkZzQWEwN1pIVmtI?=
 =?utf-8?B?akNhSmdrT2JCNTEralRUYTJkWTZ5QVQwV1FsU0FaakpvZ0JxU3R4WFdJSVd3?=
 =?utf-8?B?WVVJSytUenpkWUR5KytWLzd4YWJGUlE4WFY0dEd1UUZSTkFyR3dtMWlYUTc5?=
 =?utf-8?B?Um12Q1ROOHhpOVRDanczVUIyUDh3VWtNNGE1Q3F5WG9wNTNSV0ZxQ1hyZmRO?=
 =?utf-8?B?ZDBlMExYa1ZYNC9Jd2FzN1pWOUtKWEhoMDQ5MDhBSUtmL0Q1REIwZGtwVkhX?=
 =?utf-8?B?ZnZtWWhLWnFmZ1VJRTh0N2JULy9HMzNIYlhLbmpaSjh4QnRsL0ZGY3VIeHZ2?=
 =?utf-8?B?eUE3ZEpBazFaUE9BUXNhMDg3VkJEK2NGQmd0YkhyZ2FBRjJsV1ozMHRKMEJJ?=
 =?utf-8?B?Z1ZPYTFmUmVNZFJpdzZpQ014VU1pQTBsSFdIeUlWejEvTTJKMWVUa3hvZTZY?=
 =?utf-8?B?bmtLYkFyTmwrWDZWcFJXUEpaY2RFdHZNMkFYRkU5NHpsOFRvT0ZUaVpvT0FE?=
 =?utf-8?B?SHVvYnFVSlBKSFBUZWtyaUh0VTNRaVhDVXB3VHZHUHJVY1N0dDVBTVd5SktW?=
 =?utf-8?B?THhBb1k1L2JFbkZIdmpFajFEOE5YUUwxWWxzaytSUUhxUzhCaWR1MGdLTlpE?=
 =?utf-8?B?aGdFK0NPa29kSkc3WGxGWnRLcC93aktPN3VuejNGN1plbm5hSDBTU1UxaU9X?=
 =?utf-8?B?UGxFQkxYemIwZFpXLzBhbFk0VzV4bVRVT1FzdDZSVnZZY1FORm5BS3AxMm1X?=
 =?utf-8?B?QTd3czhhU3NXcEllNnRzY3ZWQ3E1V1Y4U3gzOElYbS9PemFNZmlQZmkwb0FO?=
 =?utf-8?B?QkxRdWZZV1BYWkJST2JMRDBhWllTR2pTV0k0MFBxRjhMcGxNU0JTaFpNVnpk?=
 =?utf-8?B?d2dMbkJQMUwra1BoWG81SHZlSFRsVy90b0ZuZndFT2Q2R1E1NGhHcVcxaklx?=
 =?utf-8?B?ZmdCdXJsd05JL2dmd29KTk1jMXh0dVFCdTBYSzd0dzJRY25KbTU4SHVxNDF5?=
 =?utf-8?B?OGdNQWNhMXlGZVlLSGF1NjNzZjAxREdsWHo0VnVJL2pTdklxTlRMczVuVkZ2?=
 =?utf-8?B?azNZQ2FuOGw5MEtEU0V5R1RDUHJwc29uZDZmZHVvR1duS3lmYWRMbkJ5eXcv?=
 =?utf-8?B?bEZTOGNPNUpEeXFiRjR3WjE5c0c0N281V0h3Z1U5S09WeWlja1cwQ1NTRG5W?=
 =?utf-8?B?T1FJa1dnSllaWW83NldRZWFGS0RSOFl5L3UyTzhzb29FdTBzWnRJY3hYN245?=
 =?utf-8?B?N1VTU0MzN2ZXMjlYc0M4c2V0RFVoM2lySDJpdGJTMlNsSk5FMFhCcDg3cnhi?=
 =?utf-8?B?bXdtT0hqMk02TWNJaFoxM2RyTld0SExaSzI1YU9GU2djRFdFRm9vdUthRGxu?=
 =?utf-8?B?b3ZKSUEzdjV0L1AvY3FQY2F6QXhWN3dzamFSM1RHeGx0d1V5TjhMdEVhMThs?=
 =?utf-8?B?QVFMeFF4NGJrbTNyNUdZR3p5MDdpM0thS2NadS9EZElGV1V3NzRyTFBMblFt?=
 =?utf-8?B?amxDS0RaR2syVmxlQWN3TktaTDZIeXJaemVnblpsc1kzeXpzWHorYUZ5eXMv?=
 =?utf-8?B?TmpNNzd2cWtBQTJiK1dybEprdENLMmdlSDRpb3QyV0k5RWgyUEo0WklqMWFz?=
 =?utf-8?B?RjMzV3QyemcvbUQ4QWE4QUxMTGYyeU93clZ1REpUa1ZETjBUT3YwTTBqbXE1?=
 =?utf-8?B?cUttTHpCQi9XVnVXUHVJc3ExT0Q0N0xBN1Jta0R2blRZbFJnM1BxNGN5MFVy?=
 =?utf-8?B?RS9GSCtVOGt3ZVh0ZlhjT01LVHladmRjd3RVdGNWRlRmZmNaY0xwc1JWSDJu?=
 =?utf-8?B?VFRYYlFnYXpldVhYbHZ6WDNXWUhTVEFPOFBkaDUvT0FacFpTK3JyekJ2NWl4?=
 =?utf-8?B?a0ZSUTBjTXVlUUU2Um0zQkNxUHg4dCt5VmNtYjJQWThQWnY0b2IwZlFhb1RO?=
 =?utf-8?B?Mzc2eEc2VGRSZWpTRTNOTi9vd2hEdEtMRW4veUI3TWt1N25EanJLVHJ2aXJR?=
 =?utf-8?Q?ECc7s0L2U3yF/Wq8=3D?=
X-Exchange-RoutingPolicyChecked: fhEY0O1Yc9sqMxP/dnLG56xEI3/eimxcKycn7vwuQnuBzwpJ0AyopFEkhPO+N0Q0WKFe9Hr53UZirM4tyK4qOpDpFI+3U9s5fv97OJayAu2M5tN5HtD/5MW3HvwvsOBDSJcW3VSSuynQtvEoeCIeRfeqgG+ZRHwxkXQ6Pnb4nA5dj5btktOMmdYt7OblRlsz4CRlZt8rk009F5GJdEfuB/Y6SK8YVEO/7NWoaMK49ZKThsBZO5ze3zPN/fPwz2D2XJ1EaJSczWUss25OV5C5ZXY8+Gr2LZS+yApzMw5rd1EB937oAK+kAB4EgP57vRhUXa2PtnALEeQPkj5ALFd8Tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9e8859-2532-4787-e9d6-08df44dc496d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:55:02.6905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wa4/txQ17a+gHLx3yIEb7nW91Hxun3t8C19Oi+7de6vmzh480exhrRm0gPDw9hLO031e9P+mEOxMPNyn0xJgmnub86Ft8RY/qMoalq2+Mbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch looks good.
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 11/16/2026 4:25 PM, Daniele Ceraolo Spurio wrote:
> Now that GSC is in place, we can enable PXP for NVL-P. No changes
> required compared to previous platforms.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 619653c68f2c..44ca50964bed 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -506,6 +506,7 @@ static const struct xe_device_desc nvlp_desc = {
>  	.has_flat_ccs = 1,
>  	.has_page_reclaim_hw_assist = true,
>  	.has_pre_prod_wa = true,
> +	.has_pxp = true,
>  	.has_sriov = true,
>  	.max_gt_per_tile = 2,
>  	MULTI_LRC_MASK,

