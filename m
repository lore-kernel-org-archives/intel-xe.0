Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A57EF33A76
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 14:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C774E10E2A9;
	Thu,  5 Mar 2026 14:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNieDQAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5DA10E217
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772721597; x=1804257597;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ebc0z8Dy0ou7AqMDtPoZiq8P3sukvdC3KR933HOpDPc=;
 b=cNieDQAcifXKOre9Vy5eVDcNtFhkyiKzaVf1jDudSvy83+PF1SmsWbZX
 sVCjDIFQnnzXixuLSgfcUCgXZi/dexOKkaDXiXbYWNng8IVgQLYjsLN/+
 SLPujjxDyxNK74J95JvN2oI0EBlEDMQWhCxlHGSoNlkTVwvWu5aJUgIca
 S3yDpV1xcjgnt7X4ZuYixYuaOHhJVSag3X/Tz4MLu+IT9i5j8cUTKfwQt
 aaPbBDf4U6EFVUrlrNw8asSacrsovFTCFIbRlLHwQbhHLjNnJLgYspChG
 htPQkstvJ0dbYxye7033f4ZH2VXB8rfzLlneBsqs23UtDsP31sulPSlsR A==;
X-CSE-ConnectionGUID: TEN/gxUbSam5BaiA/Us08A==
X-CSE-MsgGUID: YgW9icbCQpG5GbU8LFKxtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84522060"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="84522060"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:39:57 -0800
X-CSE-ConnectionGUID: qOCX8nt/QBuIBADPPN1lFw==
X-CSE-MsgGUID: HdS88z3fTea5Zv/Yx0+P/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="245156310"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:39:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 06:39:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 06:39:56 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 06:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZKQSvVQB7SNpj26jV1Alv0NwpztyT7j1Rp92QQt6dAvTnFwTgqcRT/NFrf816T17vLl2PnyQoR6VQunr9ZSbfXo/5JhuuglKrvAnGgyQRIIKtay9SxReB+Ig3XXJd7OAooAKWYQHA2X/Gb+3j05g52edBqfe4LAPqF81e5Uj/aYlmJXh7FRZQp9p8lM+WR0bzEwkISYdcha4BLvs49XaYZEz19oqrLJiyavPDbLN4dVMYnVQYy2MAAPCakm4yP9QGdwaC9AKb1uO2PvF5y0/h5fkBEGr8vzvyNGHWKe57iFEX+ktRGv+dH4SBkXvGgYK0uoddIdEuOQwYjOz0p1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBRO6++APmZKjVMx1bjI1ZCnmNKz3mN0AlXmDPAqd/4=;
 b=ZUo6QopZqtQmH7Z30vDcZLlVdF/5fQuZarKNeChhmXk2Qsw+mLDJfgoI6UY7MEHKrUQjXYMdAoBfLtpMctucczRFGFTOnMhDm/2dd1PbEEvX4DoJJEdKezxjgY5Ka0WCE2AxyT0Geo0ta/UBqaKxDABT96D1M8KA2JQ39jWfaw1ucH4/mjFy1SrkP8nCqZ8YCOnNQXlTr4ZyXzGEiY+f897P4CnI/9FpAwdsBvJk/93nP4Cz91cgdVEAf/v3VDqprk48MsgAm1fjcOkE34du1H23yj9Tlg06qINrzJhIkXrA1M0HW74YKhrpJrt8n8PVJNvtZDDU1bFf/2UZ87Q/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 14:39:52 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 14:39:52 +0000
Date: Thu, 5 Mar 2026 15:39:48 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 02/25] drm/xe: Add
 xe_migrate_update_pgtables_cpu_execute helper
Message-ID: <aamVtARMX_z-SGeT@fdugast-desk>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260228013501.106680-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: f6fa7818-f1d8-4440-8acb-08de7ac50fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: BnXYVst2ULD9ikpLlVUaS/56ClDX0Q0y8pwA91nw+Dir8mdQyNHSfd8i/OdC5xFsBCjr83bd3uzCySFn7RNIQDLosVOJhe/kRJxcxulXU4I5WmGNtEvYXP2uqxAHGg7UOn6SdsHDe9J5b+RXl3UfQ+7KHtru6vXXgNjOxpRt3KaiL3NygoIsjenXhxT1vw3G0dD+9aqiqOMslBtTn4yIIdmZDdwimb7GvCdxb9B4y/c2E0yxaxGkhXEt7rx/zTx0HKN1BGYyru6mKOJitYMpCmS8EpSXqTHh/iPIfBhU9XQ2TWV+nP+OUKXud/C+D0z089FEwfKMfqwNwzkhktwJiapiMhZjFdDoZJNZsT71u6NkzyQf5hdpSbeyV7zLIWeCUQAWWDaXvzq/SfqMLeWz8//7T0ZVAXTM+LM7L09Q9kXI6rf21MMSSQiMnTBniX1BvU3TcDCT9vT9Mn1p/41WYOoTciQJa/xjSKQ+TEvS1XQaLH4jgPUlqZrqSXPfNuCBkIP/UwS4o/lcyeEQB6zcSqwyUURP5c0R7GAFSspG8X+b8ETE28biexJ4YFpYwFL2wYm6FSnqEJUzG2GWvGD97bPkAGQDMKTMc1iEP4IuSOX3mKf7qj4vhN0Rt+eFZ/j1Y5G+XQKeiKGmNBc0x8uFU5p7V7EGdwk40Jq3HFosE2ULzgmXYzgrIUHMPp/z4W+CRAR+6/RBMvxhUbLSst8qrzqcQ5KDC+53vCx3LnfBal0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0RYQ3FRYUtJV0lZNVdaa1o1Zis0YWVwOFJMeHNSUXd6Ynd4Q3BOME51Z3A5?=
 =?utf-8?B?TG5Td3FqMlBYN2c0SWFkSUNJbW56ZGcyMWo2VDRQRVJ1ODRKd1dSTWRDN09w?=
 =?utf-8?B?VXVyT0JBMm1HSjhlaHNLZGtwWFFPRlNRZ1R6VGNRRVRzbHRMY0laamJSSWlH?=
 =?utf-8?B?c0dnRC8rWVRHNDNydzMvOE9HZ2VzS2JiejdSNW9VN0QzUEZhZTFLTEE2MVNS?=
 =?utf-8?B?NjhtSFZxU0k5WE14MlVnNnFVNWdaS2prSWxKWjNZNld4emo3SFFyRTh2MCtW?=
 =?utf-8?B?MkFvYnRFVnZYc3A5OHo3eW9nSWxXclJmWkN1eDRoT0RKcTZ0RG1oTitvZlo3?=
 =?utf-8?B?a0R4UjJUVEJnUDFwalQ5U1d5VWN6cnNsaFQzRzdUcERkcUtZWXdxMmc3UjNh?=
 =?utf-8?B?T1dyTUxIVHRpWDRjRHhMWkM2cWhkTlN6emI3anZWb05ycnRsd3dzVUsvNXNu?=
 =?utf-8?B?aTlOTktuYm1ISmpwUjJLbmFQNkJZVWdwR0VHcGdqMmNWaG42enhuMVJyV2JU?=
 =?utf-8?B?SXFuRzdYMHA2cHgvYXlEWnZQVFhzenJHcWV4bURRYU1HK2xna0lZZmxLK05I?=
 =?utf-8?B?NWFPNmE4aFhFYTBEYzRXdVlJY2tMZ3pRTDVpQ1NjMUYzYVQwNEVLeC9KZzVT?=
 =?utf-8?B?c0cvWnRWQTh1Mm41ZkZtdTJjdHRtR1haSEhJbUxOcnZTKzk5NFAxVlNUNkQr?=
 =?utf-8?B?SG1NNElSRktWZVBIdDh3SmcyY1FDMUloeVpNY1FIc3gzRmhCWjl1SGVZcHln?=
 =?utf-8?B?RVZzZzNuMTVobXZvUEk5d1ZYYldLaUlaWFZ0VjVpSi9FakM5c0UzUWwyM1Yy?=
 =?utf-8?B?YnE3aU5mcEtiMWNLMEtFOUhPdkFyMGhFNW05V0hQeUpWUytUQkRmeGNyemlE?=
 =?utf-8?B?dTFwQkpUbDMzMWoxTUZ5Z3dDUUdzdlJ2M2J1N1pSWEhZZHdVMi82dUxUM0Zq?=
 =?utf-8?B?bUgwMmRnNHY3Vjd3eUpOTUhvakp4djQ4cmF1TUtOQ2ZTTG9SZzg0Y0FONnhN?=
 =?utf-8?B?NjNoeTVMbDJSYVJmVXJEcE1TdkNTQ2U2bE8zRWptS280d1FoVk5kVUNmWGp3?=
 =?utf-8?B?K3pUclNBYWhxbHY1TFpweDhvcVhjbFpZajBmUmRPaFNOc2Nha2tkMStyTWtq?=
 =?utf-8?B?TDIwQUtTVTV1V2hLVlVZdzBVbW5NTktLWU5kMDVYMFk5Wk5tNU1SenVkYndF?=
 =?utf-8?B?UTRveG1ib0E0dUpOamdsY0RIcURxeGFsOWo4K2tmZE9LdStIK0VXVTJzSzJL?=
 =?utf-8?B?bkgxNW13WlBLYXMrbXRhYk9RdlFIbzQ5TnpydnVvbjF6aWsxdkRXN0JEenNO?=
 =?utf-8?B?TDdoM0JtalNxSlkzTlZxTEhOTW5YUENuVWk3a2t4WXdpQWdFa0NHUUdDdCt4?=
 =?utf-8?B?eWJsS245YnBkRFJoUU9ZYjVoTEZWRjlZV1lieUp2NklYQzZGc3B6S2dTZUJx?=
 =?utf-8?B?TElDQThYZ2hsd3dsQWFwQ2FxUVZpOXdiWW1qcll6Q0dya2dxYzBNdElBMWkz?=
 =?utf-8?B?MWU5Qk1GcE1oalpSNzBFc1VqLy82TGxBdER2MEtESSt1MkJpTjcwa2R5RjQy?=
 =?utf-8?B?d0dNTUxDeHFxUWI0L2lpZmNvazBTSkxmRkFVTlUrRmtrZjdLSi84c1oySkU5?=
 =?utf-8?B?VXJVSm01ek41aG04U3k2cnFqakVuNExrSkk0S28zVytHSCtONEdoejlZMGNY?=
 =?utf-8?B?Q3NJS3A0NmNaWnZ3Vk5jWjJvUXFyYlhqQkpCRU9qekx4TjQvUTNBcXJDVWo3?=
 =?utf-8?B?N2VMamtlQkxFb0JMU2JhUE5ZQUJ2NzZSd3o2amJPdDJ0UjJhNkFWZHllNlRq?=
 =?utf-8?B?OVRQVVJvQmxBNDY0Z1FhT09jWWRlVExWeEZabXhlU2ozTGFyQTUrRy95c1N0?=
 =?utf-8?B?YURMaDZtWUZRa0hLeGJHOXBlVDVOSGJkL0V3TjNaWkxWc1lKNnEyUHBoWDZh?=
 =?utf-8?B?ZG9Qb1Eza04ycWRFUGc2VDhDRjBURXBYR2tIR1JhbDByV0VkeXdZaC9FV252?=
 =?utf-8?B?dmhwTmhnT05oeWg3TDhCenpmRFQ1UjI0U253RjB5TFJSVnlEVkw3cGtBTjQw?=
 =?utf-8?B?UzlOYzRzODQ1ZjhDUW5OQXR1NUpkc0grbmIzUDNWWWhHbUhLZnVsZDc2WEN0?=
 =?utf-8?B?MForM25Wd0M0a3BIWGRTbkt6aVVtdzNTa0NBYXNYbUtUNEp5T0hGNFZ6TGRo?=
 =?utf-8?B?WjV4REtLTEh5bmFKQ1dpNVNYZ2RxYjN6dmdISE9TS05ZbG93VnRWY1FCck80?=
 =?utf-8?B?MUxsUG5udlJGOFZkK2EzZXZ0SktYa1VSMDhrWmdsNjdJK2FrKzNtbjhEYnZX?=
 =?utf-8?B?cXdXRm8rU2cxTlNrNnBwSjNseFNMcTNXZkZPRzRKU1hvV3paZUw2anFjejNv?=
 =?utf-8?Q?bwi0krlBhvVSFuNY=3D?=
X-Exchange-RoutingPolicyChecked: cZWqsIjzaG5qDYx/vPqru8s2hTyaM2XyAapVeDULdePsdKeU7vCioSsZ0wHwpyDsm7ro82VQakwakH973CL3EjDjY6YbhUwkEAHmZSvAf4HHd6oAcBSJK8LfFrtVPyANXfxFEhalNRS8RLeMVaYuRTdSB3Whe09GzVTs6Jbo5gxP7zjOQhFhsd+gorf05lE279s/hhW2VsCNLbO12kDqMpQ43dIm+fj71J64ELbUF2ECXNnh3/72SedQdEmm9LRJawxh8fX0Fh7tWMesmtEXwojE+GWruu/9PjUvhveEMlrZx1TLhyBz5GuICjoJZ7urjsR4do4+BIybjV2Szt1dgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fa7818-f1d8-4440-8acb-08de7ac50fa7
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:39:52.4529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6hJ3cZ7sg0WTAoBZK3lULwIUUVuKBOWJSRogWHBLD+CTwAbLJ10Se/rZVursBl8uhEo7EWzKK8UYwOapwhGvv7O+TJSDxXSvnt7KIu4P8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
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

On Fri, Feb 27, 2026 at 05:34:38PM -0800, Matthew Brost wrote:
> Add the xe_migrate_update_pgtables_cpu_execute helper, which performs
> the CPU-side page-table update. This will support implementing CPU
> binds, as the submission backend can call this helper once a bind job’s
> dependencies are resolved. While here, add assertions to provide basic
> sanity checks on tht function arguments.

s/tht/the/

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 58 ++++++++++++++++++++-------------
>  1 file changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f7e3a044bd78..69e6e3135ec6 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1715,6 +1715,38 @@ struct migrate_test_params {
>  	container_of(_priv, struct migrate_test_params, base)
>  #endif
>  
> +static void
> +xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
> +				       const struct xe_migrate_pt_update_ops *ops,
> +				       struct xe_vm_pgtable_update_op *pt_op,
> +				       int num_ops)
> +{
> +	u32 j, i;
> +
> +	for (j = 0; j < num_ops; ++j, ++pt_op) {
> +		for (i = 0; i < pt_op->num_entries; i++) {
> +			const struct xe_vm_pgtable_update *update =
> +				&pt_op->entries[i];
> +
> +			xe_tile_assert(tile, update);
> +			xe_tile_assert(tile, update->pt_bo);
> +			xe_tile_assert(tile, !iosys_map_is_null(&update->pt_bo->vmap));
> +
> +			if (pt_op->bind)
> +				ops->populate(tile, &update->pt_bo->vmap,
> +					      NULL, update->ofs, update->qwords,
> +					      update);
> +			else
> +				ops->clear(vm, tile, &update->pt_bo->vmap,
> +					   NULL, update->ofs, update->qwords,
> +					   update);
> +		}
> +	}
> +
> +	trace_xe_vm_cpu_bind(vm);
> +	xe_device_wmb(vm->xe);
> +}
> +
>  static struct dma_fence *
>  xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>  			       struct xe_migrate_pt_update *pt_update)
> @@ -1727,7 +1759,6 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>  	struct xe_vm_pgtable_update_ops *pt_update_ops =
>  		&pt_update->vops->pt_update_ops[pt_update->tile_id];
>  	int err;
> -	u32 i, j;
>  
>  	if (XE_TEST_ONLY(test && test->force_gpu))
>  		return ERR_PTR(-ETIME);
> @@ -1739,28 +1770,9 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>  			return ERR_PTR(err);
>  	}
>  
> -	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> -		const struct xe_vm_pgtable_update_op *pt_op =
> -			&pt_update_ops->ops[i];
> -
> -		for (j = 0; j < pt_op->num_entries; j++) {
> -			const struct xe_vm_pgtable_update *update =
> -				&pt_op->entries[j];
> -
> -			if (pt_op->bind)
> -				ops->populate(m->tile,
> -					      &update->pt_bo->vmap, NULL,
> -					      update->ofs, update->qwords,
> -					      update);
> -			else
> -				ops->clear(vm, m->tile,
> -					   &update->pt_bo->vmap, NULL,
> -					   update->ofs, update->qwords, update);
> -		}
> -	}
> -
> -	trace_xe_vm_cpu_bind(vm);
> -	xe_device_wmb(vm->xe);
> +	xe_migrate_update_pgtables_cpu_execute(vm, m->tile, ops,
> +					       pt_update_ops->ops,
> +					       pt_update_ops->num_ops);
>  
>  	return dma_fence_get_stub();
>  }
> -- 
> 2.34.1
> 
