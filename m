Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A182C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 10:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7710E0E7;
	Fri,  2 Feb 2024 10:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAUZMM8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BA710E0E7
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 10:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706869499; x=1738405499;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=yU0Os9lajEvr+xfMdJCRYsbL2zsaGxBv5jkMuK+YAKI=;
 b=TAUZMM8V1y952+rmzGlP+fcsbzqDPOEEXJN3xew44y8LnDHIr0zD6ZZY
 kHrZmEB361Rke/zHqrJnGEQbcvAakkfuBqgz7H3OL3siAGyl9Avli1ov/
 R4XWL7aOD4EfOObdfjg0kWoxRGMK1qEdsX5a7xakzWcZR7YUCY62uLVz/
 OgDbx6frfMuNTpmJvZmM8Xfp8Y/b5q3FI6z8JpJORRiRkGt2435xDeGgp
 jNzLeE8b9AOlgJPS1Ud4mOxDqyIJjQVORzSjQHo/b3PrYRzxv2iYlfxl1
 QJ/jzF+70R5bXfulcp+gxtyZ4tdyYwEajn7mOQpA0rQDuH3pWU975LG8w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="25582845"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208,217";a="25582845"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 02:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208,217";a="4665068"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 02:24:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 02:24:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 02:24:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 02:24:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 02:24:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAo8Ncs3Yle/xvPjVyt2mZ2UTAsIviUzOZ86kNRbQV9Ul0heETsravUzrMRorw53669TV1pzufByPO8oE3MQvr/2ivoF3RSXyc99LTNIgKzZ5JcmyCarTjHxlj4kueUQI2AbxhfifH7EWxbZHFRhqQZwVhzWxs1CSpRkUmkso2oyyefW8Ev1RjgYZxo/uEcZbMJMp2ZCU4P1cIYJPalBFHH56BpDnnVzZPrQ2aXxIOYqkt4QYh7ERCR53O9vJ4A6v9yjPlwlARdcb+wyY+1rHfqLW0MqjGBldTdQTXelJZVz6VmbWJj5GZUUlOnVDXa1XTHC7MIJzzBw+UpAFn9aCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxcW7EwSJwJU29EjzWiuudnAg9CRCkTrztOHbTPtSXQ=;
 b=hJQdbi42S3d/UyUoOuS1/PY0JhTJv1gPgCvbVwnunUJBy6Ml+5tyLYOG/uzezdexYnlB0gIx+5HmXrzwhDJC8NQEApJSpJFYakz4WBdH+9IuJNGl97CbMFjkvXc6yZfOpjrT2VhX0z65k90CsW3IbXKDeU/PE8b4xqq5DJmGtDZAteT26GStctNyVidPcKlWN5WebNPLJ1fhdMLNOGZzDhePXySoxBif1HaHj2oIFURYGjh80B/n7mvUImTeM56ieWscomRKkjUkIiUCCO/DBCnB8HorNbqH/2c8cAkQfdO+IgKspTRNFFM7Xi5SqTG+ZGzYdWvk84fytLJDz4t1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Fri, 2 Feb
 2024 10:24:49 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::f3c8:b435:76a3:b957%5]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 10:24:49 +0000
Content-Type: multipart/alternative;
 boundary="------------cb5iekLoJZxaEJCpA7IFMk6L"
Message-ID: <d9807e09-1e63-422e-8234-f0ba7a4c8b60@intel.com>
Date: Fri, 2 Feb 2024 15:54:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [V13] drm/xe: Introduce and update counter for low level driver
 errors
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20240130084135.2065579-1-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240130084135.2065579-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BM1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::32) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ0PR11MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3d8b0e-4ef7-4cda-8c82-08dc23d92f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: db98woG6Wln8Ig+lvL9m9wBATABwkIOiD4ZKbUo28GyO7gWOYOsKuThoNLtID78dF02Sdr8iwEfhRQkLdMe8lHqjbFlX5RPOnQOlCssvq/SvEDF80qWOieZP+b015HbE0CoK0KjmpmYLfj51L2MiRT2dsp6ArsYfuOKL1hKg+V/FRRmqUTD0zhd7SOGnFFH6fms+oJ74yUbWT1zQgC0phG9TUg3Z/DdhoGCG2zL52McHxUNQOzlpzt3wSczxuDJBqqR6AuCYu5VvO3gj5I5gCJ8Jw04fAZkwVxJmPsSzVxXOAfvTO4dkwh/2Ojl0FKllxgXcbTkohyX2PJU0pYU/XOoIkTfzbXkUx82jchEf/YXTvmj4jnippnIqpDDwxRpKJna3KaEp7BrTJ9MDggAUZigQwo5jQq7n9VvWjlRQy/rpT+FersqrkUsH5rngmBRY4opAejsDqZn0/e5RWGmUjmtTOg/smU6TcTrEz7WlDPDzgPtY9BkLJL6Wu+Ngs+NoBWKhVNnJRa7CPpUcu0lf8ygAS15UiGmR7G4rOEjdIm1ta4ddAYtasMWLTKNArG4sYcNdJEjL7o6FUc8q2gwwOgnHocv1eetVlBx0+CpEbNhncqtGld4M4dmhRAUlJW4RINuA5IQG1a+pagHiOocysg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(36756003)(2906002)(30864003)(8676002)(31696002)(8936002)(86362001)(15650500001)(66946007)(66476007)(66556008)(5660300002)(38100700002)(6916009)(6512007)(82960400001)(6506007)(316002)(478600001)(53546011)(6486002)(33964004)(6666004)(83380400001)(41300700001)(26005)(31686004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnRvQ3IvV2dIcmMzVDFIcXoxRytFTFo3NjZnWE50TmRpNzBiZVlUMkZlR1py?=
 =?utf-8?B?a2VBQnFUeUJlVXJNQno4OHUyaW9HREsrbndGT3VWbkljdE1EVUdVU2ZDOTUw?=
 =?utf-8?B?dnRyVjhtc3lHNlJsenQvZXJ5TWQvdENOc256ZzFMNzRKcGczbFh6R09wUEZw?=
 =?utf-8?B?K3VDM29sdXlFbkNDOGgrNkV3dGs4Z0JDQWZ4R2hnMHN5MmVTejErVHd6VGVD?=
 =?utf-8?B?UU8xWFV5NDIwb1gwb3VzMHRPUGlWYlpFYzV0TWtPV2QzQ3o4elNvSmdOaFFh?=
 =?utf-8?B?UU51d29WQmtuUFZENy9wLzZ1UUdtMHhZbWJKMHJNWUFYYWxYeG0wMXBKbDNX?=
 =?utf-8?B?TkpzQzRna3lJREx1TDNYTnlBcGRpQmtnanFNVXhKaU1ma1JKRDAva1VyYkZw?=
 =?utf-8?B?WEJTaWI5aEhpVFBVZ3NwcjRHZDM0QVl6Zkk3M0N1SWNKM3gzWGRraDk4UFJ3?=
 =?utf-8?B?OWZTK0NnYURmcGZPNVB5NHVXSGx5cUp2QWd0cndpcmdaNFlaY2lMdEZiSGpJ?=
 =?utf-8?B?aElVd0RGZWUrSWt1VXJlVldqeGRjOTRkTUpmSlY1Y3FXTVNucC9Ycy9hRDdC?=
 =?utf-8?B?emRNRjd1TEpqZGtqbWFYMUU0Rnh3cXRFMU5aMVQyWnYvcDdpakd6Vm13dEhy?=
 =?utf-8?B?Mmk3a3Q2Ykd3Ymt6d1JxU1B3TnBLamlhM2J3L2VpV1lIajRxVlhQMmhoNGNp?=
 =?utf-8?B?ZTVmdU1LVi84NUJLb1pKOWtSMjhCdm9zQ3p1SG04NzR4a0cxSmZxZUVkSUtZ?=
 =?utf-8?B?TjRKdXVJTVZBYy90SVpnZVJUYzI1UXZKQ1NxTXNHOFRmWlpjRVU2WDZ4blpa?=
 =?utf-8?B?TTYrcXhBeWpScUQzVGkwWCtoQ0pqYjJYdngxVVV0V2JsblVjVHEzQ3Z5UWk4?=
 =?utf-8?B?KzZXOFRHM2dEeUxYVnhBZzU1ZVZLTU9vOWxjaUptWjZIdURMR1FzUGdLeWE4?=
 =?utf-8?B?RXdZdnoxMVNEbGQycnk5eGRqNFhqOC92MEFPMWw2VHhqTHpEcDg4d2VZMWhl?=
 =?utf-8?B?ZkFyWHBzemRrSzVGRm9jVGtzMndqZXVBbE05aVlmQnJzY1NIYmYveWJmbkI1?=
 =?utf-8?B?YUt4RTVtV0lVMFFndjVCVFZ3M1h4ZmpDMEJHOFNud1Q3bEdPRzlLeVpiSzg0?=
 =?utf-8?B?UUh2dURjdkFWVnEwQXBKRUI2UURyZFpIRS8vMUR0ZzJwVnBWS3IwN0cyRU5s?=
 =?utf-8?B?RWhsTCsydlFFUTdzd1ZpWGhpTnBjRUFLMWlLNk1RU0N1Ti9BZGYvaWlrbENK?=
 =?utf-8?B?dXhLN1crbDg2bjh0dUtUalBGU1BDaTNyU0w1MElHWGhTemhMb2tFZnBmcTQv?=
 =?utf-8?B?WjcrVjdlV1daMmMyb1VsOGhIR2hLWlM1Ylp5T3pQN2JzdnU2WHRFdHo1UmR0?=
 =?utf-8?B?eVdEZUdJbEJFSXJmRVk1VW01Y0RxNUlwQmdhVGg3OThsTmdPN0lDQ1BEYU8v?=
 =?utf-8?B?d3ZjckhjcHg3Qkt4bmtsTVZKZDduVHhkTlJHUUFvOU5nZVNRRkcwZHBPeUhp?=
 =?utf-8?B?QzdCQ04wOTZiVklsUU9vckphdDNhR2UyWnQ4NGVXcHdDWXlGZ3ZSYjVFWXd4?=
 =?utf-8?B?Q0RHRmNxU1ZXWFZ5eVF6TVBxdjc0ekY1bU5uUytORi9FVlJVUGRScXZvK1RT?=
 =?utf-8?B?b0xVVys3M2dBK1VKM3hENFczcjJxRlAySy9yMFhIaCtkUHdLQWV6UEkzTVNW?=
 =?utf-8?B?TmhpUDhCanF0T0JoU0JCY3kzWXhCL2tkREhhVlp2TFFuaU5WSUtRem84MkVN?=
 =?utf-8?B?RzUreG5Ub2xkZHdCczlWcElDMVhMUTJVNktNa1o5L1VhN3hCSXZ3S3lFME9U?=
 =?utf-8?B?czZrdFhZN3oySHoxTG9kUTdsbGR0VllXUUg3WUtyRU9BOEF5NXAzY2hNWk9r?=
 =?utf-8?B?S3plbTVwYTJUNk1PU1JRbHpkNTBqeHlqRDl0UkwzYm54MFFyOW9nKzdNTVlC?=
 =?utf-8?B?TlV6UWVzNmRIQUZVamZzbDBqU3E5SWNUUXdNMEdTTFVuU1dzRmx5MkR6SUl6?=
 =?utf-8?B?NWtrdDU2NUQvODJ4ZHVyK2ovTHZ3Sjk2VUs1VDIwZDd2KzU2WDdkYlBHbkw4?=
 =?utf-8?B?MVI5YVBxMG9VNDFtaTVwanhBWVVHRGRtUlBtcEFCYzBUbHVFWkQwNFVBZEJm?=
 =?utf-8?B?c1d6eVc4SWJObnhUNWh5aE5mM1dSc2hYNkZITjhwbnU4WGhYb1NkQ1A4aUJ0?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3d8b0e-4ef7-4cda-8c82-08dc23d92f5b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 10:24:49.2155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwJn5vce8Xs607k+nccUbSBJ1I2HJQB/uRHS0k2F3qy4SkxOe5ESBEmWg/YXSizMtCFzPbnakohMFxumNoK53vl882UgfRRRyimB5QXF/bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6670
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

--------------cb5iekLoJZxaEJCpA7IFMk6L
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 30-01-2024 14:11, Tejas Upadhyay wrote:
> Introduce low level driver error counter and incrementing on
> each occurrence. Focus is on errors that are not functionally
> affecting the system and might otherwise go unnoticed and cause
> power/performance regressions, so checking for the error
> counters should help.
>
> Importantly the intention is not to go adding new error checks,
> but to make sure the existing important error conditions are
> propagated in terms of counter under respective categories like
> below :
> - GT
>    - GUC COMMUNICATION
>    - ENGINE OTHER
>    - GT OTHER
>
> - Tile
>    - GTT
>    - INTERRUPT
>
> Currently this is just a counting of errors, later these
> counters will be reported through netlink interface when it is
> implemented and ready.
>
> V13(Matt):
>    - Fix more places to not report error when CT stat is cancelled
> V12:
>    - Rebase and respin on top of Matt's GuC CT stats change
>    - Do not report error when CT stat is cancelled
> V11:
>    - Unify tlb invalidation timeout errs - Michal
>    - Improve kernel doc comments - Michal
>    - Improve logging output message - Michal
> V10:
>    - Report and count errors from common place i.e caller - Michal
>    - Fixed some minor nits - Michal
> V9:
>    - Make one patch for API and counter update - Michal
>    - Remove counter from places where driver load will fail - Michal
>    - Remove extra \n from logging
>    - Improve commit message - Aravind/Michal
> V8:
>    - Correct missed ret value handling
> V7:
>    - removed double couting of err - Michal
> V6:
>    - move drm_err to gt and tile specific err API - Aravind
>    - Use GTT naming instead of GGTT - Aravind/Niranjana
> V5:
>    - Dump err_type in string format
> V4:
>    - dump err_type in drm_err log - Himal
> V2:
>    - Use modified APIs
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h        | 15 +++++++
>   drivers/gpu/drm/xe/xe_gt.c                  | 41 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++--
>   drivers/gpu/drm/xe/xe_gt_types.h            | 17 ++++++++
>   drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++-
>   drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
>   drivers/gpu/drm/xe/xe_reg_sr.c              | 26 +++++++------
>   drivers/gpu/drm/xe/xe_tile.c                | 40 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_tile.h                |  3 ++
>   11 files changed, 199 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index eb2b806a1d23..71d7bf97ee6e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -63,6 +63,18 @@ struct xe_pat_ops;
>   		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
>   		 struct xe_tile * : (tile__)->xe)
>   
> +/**
> + * enum xe_tile_drv_err_type - Types of tile level errors
> + * @XE_TILE_DRV_ERR_GTT: Error type for all PPGTT and GTT errors
> + * @XE_TILE_DRV_ERR_INTR: Interrupt errors
> + */
> +enum xe_tile_drv_err_type {
> +	XE_TILE_DRV_ERR_GTT,
> +	XE_TILE_DRV_ERR_INTR,
> +	/* private: number of defined error types, keep this last */
> +	__XE_TILE_DRV_ERR_MAX
> +};
> +
>   /**
>    * struct xe_mem_region - memory region structure
>    * This is used to describe a memory region in xe
> @@ -204,6 +216,9 @@ struct xe_tile {
>   
>   	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>   	struct kobject *sysfs;
> +
> +	/** @drv_err_cnt: driver error counter for this tile */
> +	u32 drv_err_cnt[__XE_TILE_DRV_ERR_MAX];
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 675a2927a19e..164fc9ac3079 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -55,6 +55,47 @@
>   #include "xe_wa.h"
>   #include "xe_wopcm.h"
>   
> +static const char *const xe_gt_drv_err_to_str[] = {
> +	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
> +};
> +
> +/**
> + * xe_gt_report_driver_error - Count driver error for GT
> + * @gt: GT to count error for
> + * @err: enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
> + *
> + * Increment the driver error counter in respective error
> + * category for this GT.
> + *
> + * Return: void.
> + */
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
> +		     __XE_GT_DRV_ERR_MAX);
> +
> +	xe_gt_assert(gt, err >= 0);
> +	xe_gt_assert(gt, err < __XE_GT_DRV_ERR_MAX);
> +	WRITE_ONCE(gt->drv_err_cnt[err],
> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	xe_gt_err(gt, "[%s] %pV\n", xe_gt_drv_err_to_str[err], &vaf);
> +	va_end(args);
> +}
> +
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>   {
>   	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index c1675bd44cf6..c2d1536f180f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -70,4 +70,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>   		hwe->instance == gt->usm.reserved_bcs_instance;
>   }
>   
> +void xe_gt_report_driver_error(struct xe_gt *gt,
> +			       const enum xe_gt_drv_err_type err,
> +			       const char *fmt, ...);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index e3a4131ebb58..f9dc6b109ac2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -11,6 +11,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
> +#include "xe_tile.h"
>   #include "xe_trace.h"
>   
>   #define TLB_TIMEOUT	(HZ / 4)
> @@ -31,8 +32,10 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   			break;
>   
>   		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> -		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
> -			  fence->seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +					    "GT%u: TLB invalidation time'd out, seqno=%d recv=%d",
> +					    gt->info.id, fence->seqno,
> +					    gt->tlb_invalidation.seqno_recv);
>   
>   		list_del(&fence->link);
>   		fence->base.error = -ETIME;
> @@ -326,8 +329,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>   	if (!ret) {
>   		struct drm_printer p = xe_gt_err_printer(gt);
>   
> -		xe_gt_err(gt, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
> -			  seqno, gt->tlb_invalidation.seqno_recv);
> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> +					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
> +					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>   		xe_guc_ct_print(&guc->ct, &p, true);
>   		return -ETIME;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 70c615dd1498..a2fcc2828b1b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,6 +24,20 @@ enum xe_gt_type {
>   	XE_GT_TYPE_MEDIA,
>   };
>   
> +/**
> + * enum xe_gt_drv_err_type - Types of GT level errors
> + * @XE_GT_DRV_ERR_GUC_COMM: Driver guc communication errors
> + * @XE_GT_DRV_ERR_ENGINE: Engine execution errors
> + * @XE_GT_DRV_ERR_OTHERS: Other errors like error during save/restore registers
> + */
> +enum xe_gt_drv_err_type {
> +	XE_GT_DRV_ERR_GUC_COMM,
> +	XE_GT_DRV_ERR_ENGINE,
> +	XE_GT_DRV_ERR_OTHERS,
> +	/* private: number of defined error types, keep this last */
> +	__XE_GT_DRV_ERR_MAX
> +};
> +
>   #define XE_MAX_DSS_FUSE_REGS	3
>   #define XE_MAX_EU_FUSE_REGS	1
>   
> @@ -362,6 +376,9 @@ struct xe_gt {
>   		/** @wa_active.oob: bitmap with active OOB workaroudns */
>   		unsigned long *oob;
>   	} wa_active;
> +
> +	/** @drv_err_cnt: driver error counter for this GT */
> +	u32 drv_err_cnt[__XE_GT_DRV_ERR_MAX];
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index fcb8a9efac70..f969662882e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -670,8 +670,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>   	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>   }
>   
> -int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> -			  u32 len, u32 *response_buf)
> +static int __xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> +				   u32 len, u32 *response_buf)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -790,6 +790,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>   	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
>   }
>   
> +int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> +			  u32 len, u32 *response_buf)
> +{
> +	int ret = __xe_guc_mmio_send_recv(guc, request, len, response_buf);
> +
> +	if (ret < 0)
> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
> +					  "MMIO send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>   int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
>   {
>   	return xe_guc_mmio_send_recv(guc, request, len, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f3d356383ced..e6dd24f6e997 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -624,9 +624,9 @@ static void kick_reset(struct xe_guc_ct *ct)
>   
>   static int dequeue_one_g2h(struct xe_guc_ct *ct);
>   
> -static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			      u32 g2h_len, u32 num_g2h,
> -			      struct g2h_fence *g2h_fence)
> +static int _guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			       u32 g2h_len, u32 num_g2h,
> +			       struct g2h_fence *g2h_fence)
>   {
>   	struct drm_device *drm = &ct_to_xe(ct)->drm;
>   	struct drm_printer p = drm_info_printer(drm->dev);
> @@ -698,6 +698,20 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	return -EDEADLK;
>   }
>   
> +static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			      u32 g2h_len, u32 num_g2h,
> +			      struct g2h_fence *g2h_fence)
> +{
> +	int ret = _guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> +
> +	if (ret < 0 && ret != -ECANCELED)
> +		xe_gt_report_driver_error(ct_to_gt(ct),
> +					  XE_GT_DRV_ERR_GUC_COMM,
> +					  "CTB send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>   static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		       u32 g2h_len, u32 num_g2h, struct g2h_fence *g2h_fence)
>   {
> @@ -768,8 +782,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>   	return true;
>   }
>   
> -static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			    u32 *response_buffer, bool no_fail)
> +static int __guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			      u32 *response_buffer, bool no_fail)
>   {
>   	struct xe_device *xe = ct_to_xe(ct);
>   	struct g2h_fence g2h_fence;
> @@ -833,6 +847,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	return ret > 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
>   }
>   
> +static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +			    u32 *response_buffer, bool no_fail)
> +{
> +	int ret = __guc_ct_send_recv(ct, action, len, response_buffer, no_fail);
> +
> +	if (ret < 0 && ret != -ECANCELED)
> +		xe_gt_report_driver_error(ct_to_gt(ct),
> +					  XE_GT_DRV_ERR_GUC_COMM,
> +					  "CTB send failed (%pe)",
> +					  ERR_PTR(ret));
> +	return ret;
> +}
> +
>   /**
>    * xe_guc_ct_send_recv - Send and receive HXG to the GuC
>    * @ct: the &xe_guc_ct
> @@ -1282,6 +1309,12 @@ static void g2h_worker_func(struct work_struct *w)
>   		ret = dequeue_one_g2h(ct);
>   		mutex_unlock(&ct->lock);
>   
> +		if (ret < 0 && ret != -ECANCELED)
> +			xe_gt_report_driver_error(ct_to_gt(ct),
> +						  XE_GT_DRV_ERR_GUC_COMM,
> +						  "CTB receive failed (%pe)",
> +						  ERR_PTR(ret));
> +
>   		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>   			struct drm_device *drm = &ct_to_xe(ct)->drm;
>   			struct drm_printer p = drm_info_printer(drm->dev);
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 2fd8cc26fc9f..1100e9321775 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -21,6 +21,7 @@
>   #include "xe_memirq.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
> +#include "xe_tile.h"
>   
>   /*
>    * Interrupt registers for a unit are always consecutive and ordered
> @@ -226,8 +227,9 @@ gt_engine_identity(struct xe_device *xe,
>   		 !time_after32(local_clock() >> 10, timeout_ts));
>   
>   	if (unlikely(!(ident & INTR_DATA_VALID))) {
> -		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> -			bank, bit, ident);
> +		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR,
> +					    "INTR_IDENTITY_REG%u:%u 0x%08x not valid!",
> +					    bank, bit, ident);
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 87adefb56024..217d37fa3deb 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>   	return 0;
>   
>   fail:
> -	xe_gt_err(gt,
> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> +				  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d",
> +				  idx, e->clr_bits, e->set_bits,
> +				  str_yes_no(e->reg.masked),
> +				  str_yes_no(e->reg.mcr),
> +				  ret);
>   	reg_sr_inc_error(sr);
>   
>   	return ret;
> @@ -207,7 +207,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>   	return;
>   
>   err_force_wake:
> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> +				  "Failed to apply %s save-restore MMIOs, err=%d",
> +				  sr->name, err);
>   }
>   
>   void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> @@ -234,9 +236,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   	p = drm_debug_printer(KBUILD_MODNAME);
>   	xa_for_each(&sr->xa, reg, entry) {
>   		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE,
> +						  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more",
> +						  hwe->name, RING_MAX_NONPRIV_SLOTS);
>   			break;
>   		}
>   
> @@ -259,7 +261,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>   	return;
>   
>   err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> +				  "Failed to whitelist %s registers, err=%d",
> +				  sr->name, err);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 044c20881de7..cf81e77a7eb4 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -72,6 +72,46 @@
>    *  - MOCS and PAT programming
>    */
>   
> +static const char *const xe_tile_drv_err_to_str[] = {
> +	[XE_TILE_DRV_ERR_GTT] = "GTT",
> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
> +};
> +
> +/**
> + * xe_tile_report_driver_error - Count driver error for tile
> + * @tile: tile to count error for
> + * @err: Enum error type
> + * @fmt: debug message format to print error
> + * @...: variable args to print error
> + *
> + * Increment the driver error counter in respective error
> + * category for this tile.
> + *
> + * Return: void.
> + */
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
> +		     __XE_TILE_DRV_ERR_MAX);
> +
> +	xe_tile_assert(tile, err >= 0);
> +	xe_tile_assert(tile, err < __XE_TILE_DRV_ERR_MAX);
> +	WRITE_ONCE(tile->drv_err_cnt[err],
> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	drm_err(&tile->xe->drm, "TILE%u [%s] %pV\n",
> +		tile->id, xe_tile_drv_err_to_str[err], &vaf);
> +	va_end(args);
> +}
> +
>   /**
>    * xe_tile_alloc - Perform per-tile memory allocation
>    * @tile: Tile to perform allocations for
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index 1c9e42ade6b0..446a76c43189 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -14,5 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
>   int xe_tile_init_noalloc(struct xe_tile *tile);
>   
>   void xe_tile_migrate_wait(struct xe_tile *tile);
> +void xe_tile_report_driver_error(struct xe_tile *tile,
> +				 const enum xe_tile_drv_err_type err,
> +				 const char *fmt, ...);

LGTM.

Acked-by:Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   #endif
--------------cb5iekLoJZxaEJCpA7IFMk6L
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-01-2024 14:11, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240130084135.2065579-1-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">Introduce low level driver error counter and incrementing on
each occurrence. Focus is on errors that are not functionally
affecting the system and might otherwise go unnoticed and cause
power/performance regressions, so checking for the error
counters should help.

Importantly the intention is not to go adding new error checks,
but to make sure the existing important error conditions are
propagated in terms of counter under respective categories like
below :
- GT
  - GUC COMMUNICATION
  - ENGINE OTHER
  - GT OTHER

- Tile
  - GTT
  - INTERRUPT

Currently this is just a counting of errors, later these
counters will be reported through netlink interface when it is
implemented and ready.

V13(Matt):
  - Fix more places to not report error when CT stat is cancelled
V12:
  - Rebase and respin on top of Matt's GuC CT stats change
  - Do not report error when CT stat is cancelled
V11:
  - Unify tlb invalidation timeout errs - Michal
  - Improve kernel doc comments - Michal
  - Improve logging output message - Michal
V10:
  - Report and count errors from common place i.e caller - Michal
  - Fixed some minor nits - Michal
V9:
  - Make one patch for API and counter update - Michal
  - Remove counter from places where driver load will fail - Michal
  - Remove extra \n from logging
  - Improve commit message - Aravind/Michal
V8:
  - Correct missed ret value handling
V7:
  - removed double couting of err - Michal
V6:
  - move drm_err to gt and tile specific err API - Aravind
  - Use GTT naming instead of GGTT - Aravind/Niranjana
V5:
  - Dump err_type in string format
V4:
  - dump err_type in drm_err log - Himal
V2:
  - Use modified APIs

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device_types.h        | 15 +++++++
 drivers/gpu/drm/xe/xe_gt.c                  | 41 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++--
 drivers/gpu/drm/xe/xe_gt_types.h            | 17 ++++++++
 drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++-
 drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 26 +++++++------
 drivers/gpu/drm/xe/xe_tile.c                | 40 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  3 ++
 11 files changed, 199 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eb2b806a1d23..71d7bf97ee6e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -63,6 +63,18 @@ struct xe_pat_ops;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)-&gt;xe),	\
 		 struct xe_tile * : (tile__)-&gt;xe)
 
+/**
+ * enum xe_tile_drv_err_type - Types of tile level errors
+ * @XE_TILE_DRV_ERR_GTT: Error type for all PPGTT and GTT errors
+ * @XE_TILE_DRV_ERR_INTR: Interrupt errors
+ */
+enum xe_tile_drv_err_type {
+	XE_TILE_DRV_ERR_GTT,
+	XE_TILE_DRV_ERR_INTR,
+	/* private: number of defined error types, keep this last */
+	__XE_TILE_DRV_ERR_MAX
+};
+
 /**
  * struct xe_mem_region - memory region structure
  * This is used to describe a memory region in xe
@@ -204,6 +216,9 @@ struct xe_tile {
 
 	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
 	struct kobject *sysfs;
+
+	/** @drv_err_cnt: driver error counter for this tile */
+	u32 drv_err_cnt[__XE_TILE_DRV_ERR_MAX];
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 675a2927a19e..164fc9ac3079 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -55,6 +55,47 @@
 #include &quot;xe_wa.h&quot;
 #include &quot;xe_wopcm.h&quot;
 
+static const char *const xe_gt_drv_err_to_str[] = {
+	[XE_GT_DRV_ERR_GUC_COMM] = &quot;GUC COMMUNICATION&quot;,
+	[XE_GT_DRV_ERR_ENGINE] = &quot;ENGINE OTHER&quot;,
+	[XE_GT_DRV_ERR_OTHERS] = &quot;GT OTHER&quot;
+};
+
+/**
+ * xe_gt_report_driver_error - Count driver error for GT
+ * @gt: GT to count error for
+ * @err: enum error type
+ * @fmt: debug message format to print error
+ * @...: variable args to print error
+ *
+ * Increment the driver error counter in respective error
+ * category for this GT.
+ *
+ * Return: void.
+ */
+void xe_gt_report_driver_error(struct xe_gt *gt,
+			       const enum xe_gt_drv_err_type err,
+			       const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
+		     __XE_GT_DRV_ERR_MAX);
+
+	xe_gt_assert(gt, err &gt;= 0);
+	xe_gt_assert(gt, err &lt; __XE_GT_DRV_ERR_MAX);
+	WRITE_ONCE(gt-&gt;drv_err_cnt[err],
+		   READ_ONCE(gt-&gt;drv_err_cnt[err]) + 1);
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &amp;args;
+
+	xe_gt_err(gt, &quot;[%s] %pV\n&quot;, xe_gt_drv_err_to_str[err], &amp;vaf);
+	va_end(args);
+}
+
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
 	struct xe_gt *gt;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index c1675bd44cf6..c2d1536f180f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -70,4 +70,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe-&gt;instance == gt-&gt;usm.reserved_bcs_instance;
 }
 
+void xe_gt_report_driver_error(struct xe_gt *gt,
+			       const enum xe_gt_drv_err_type err,
+			       const char *fmt, ...);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e3a4131ebb58..f9dc6b109ac2 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -11,6 +11,7 @@
 #include &quot;xe_gt_printk.h&quot;
 #include &quot;xe_guc.h&quot;
 #include &quot;xe_guc_ct.h&quot;
+#include &quot;xe_tile.h&quot;
 #include &quot;xe_trace.h&quot;
 
 #define TLB_TIMEOUT	(HZ / 4)
@@ -31,8 +32,10 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
-		xe_gt_err(gt, &quot;TLB invalidation fence timeout, seqno=%d recv=%d&quot;,
-			  fence-&gt;seqno, gt-&gt;tlb_invalidation.seqno_recv);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
+					    &quot;GT%u: TLB invalidation time'd out, seqno=%d recv=%d&quot;,
+					    gt-&gt;info.id, fence-&gt;seqno,
+					    gt-&gt;tlb_invalidation.seqno_recv);
 
 		list_del(&amp;fence-&gt;link);
 		fence-&gt;base.error = -ETIME;
@@ -326,8 +329,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	if (!ret) {
 		struct drm_printer p = xe_gt_err_printer(gt);
 
-		xe_gt_err(gt, &quot;TLB invalidation time'd out, seqno=%d, recv=%d\n&quot;,
-			  seqno, gt-&gt;tlb_invalidation.seqno_recv);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
+					    &quot;GT%u: TLB invalidation time'd out, seqno=%d, recv=%d&quot;,
+					    gt-&gt;info.id, seqno, gt-&gt;tlb_invalidation.seqno_recv);
 		xe_guc_ct_print(&amp;guc-&gt;ct, &amp;p, true);
 		return -ETIME;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 70c615dd1498..a2fcc2828b1b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,6 +24,20 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
+/**
+ * enum xe_gt_drv_err_type - Types of GT level errors
+ * @XE_GT_DRV_ERR_GUC_COMM: Driver guc communication errors
+ * @XE_GT_DRV_ERR_ENGINE: Engine execution errors
+ * @XE_GT_DRV_ERR_OTHERS: Other errors like error during save/restore registers
+ */
+enum xe_gt_drv_err_type {
+	XE_GT_DRV_ERR_GUC_COMM,
+	XE_GT_DRV_ERR_ENGINE,
+	XE_GT_DRV_ERR_OTHERS,
+	/* private: number of defined error types, keep this last */
+	__XE_GT_DRV_ERR_MAX
+};
+
 #define XE_MAX_DSS_FUSE_REGS	3
 #define XE_MAX_EU_FUSE_REGS	1
 
@@ -362,6 +376,9 @@ struct xe_gt {
 		/** @wa_active.oob: bitmap with active OOB workaroudns */
 		unsigned long *oob;
 	} wa_active;
+
+	/** @drv_err_cnt: driver error counter for this GT */
+	u32 drv_err_cnt[__XE_GT_DRV_ERR_MAX];
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index fcb8a9efac70..f969662882e4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -670,8 +670,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
 	return xe_guc_ct_send_block(&amp;guc-&gt;ct, action, ARRAY_SIZE(action));
 }
 
-int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
-			  u32 len, u32 *response_buf)
+static int __xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
+				   u32 len, u32 *response_buf)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -790,6 +790,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
 }
 
+int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
+			  u32 len, u32 *response_buf)
+{
+	int ret = __xe_guc_mmio_send_recv(guc, request, len, response_buf);
+
+	if (ret &lt; 0)
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  &quot;MMIO send failed (%pe)&quot;,
+					  ERR_PTR(ret));
+	return ret;
+}
+
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
 {
 	return xe_guc_mmio_send_recv(guc, request, len, NULL);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index f3d356383ced..e6dd24f6e997 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -624,9 +624,9 @@ static void kick_reset(struct xe_guc_ct *ct)
 
 static int dequeue_one_g2h(struct xe_guc_ct *ct);
 
-static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			      u32 g2h_len, u32 num_g2h,
-			      struct g2h_fence *g2h_fence)
+static int _guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			       u32 g2h_len, u32 num_g2h,
+			       struct g2h_fence *g2h_fence)
 {
 	struct drm_device *drm = &amp;ct_to_xe(ct)-&gt;drm;
 	struct drm_printer p = drm_info_printer(drm-&gt;dev);
@@ -698,6 +698,20 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return -EDEADLK;
 }
 
+static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			      u32 g2h_len, u32 num_g2h,
+			      struct g2h_fence *g2h_fence)
+{
+	int ret = _guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
+
+	if (ret &lt; 0 &amp;&amp; ret != -ECANCELED)
+		xe_gt_report_driver_error(ct_to_gt(ct),
+					  XE_GT_DRV_ERR_GUC_COMM,
+					  &quot;CTB send failed (%pe)&quot;,
+					  ERR_PTR(ret));
+	return ret;
+}
+
 static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		       u32 g2h_len, u32 num_g2h, struct g2h_fence *g2h_fence)
 {
@@ -768,8 +782,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 	return true;
 }
 
-static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			    u32 *response_buffer, bool no_fail)
+static int __guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			      u32 *response_buffer, bool no_fail)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct g2h_fence g2h_fence;
@@ -833,6 +847,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret &gt; 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
 }
 
+static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
+			    u32 *response_buffer, bool no_fail)
+{
+	int ret = __guc_ct_send_recv(ct, action, len, response_buffer, no_fail);
+
+	if (ret &lt; 0 &amp;&amp; ret != -ECANCELED)
+		xe_gt_report_driver_error(ct_to_gt(ct),
+					  XE_GT_DRV_ERR_GUC_COMM,
+					  &quot;CTB send failed (%pe)&quot;,
+					  ERR_PTR(ret));
+	return ret;
+}
+
 /**
  * xe_guc_ct_send_recv - Send and receive HXG to the GuC
  * @ct: the &amp;xe_guc_ct
@@ -1282,6 +1309,12 @@ static void g2h_worker_func(struct work_struct *w)
 		ret = dequeue_one_g2h(ct);
 		mutex_unlock(&amp;ct-&gt;lock);
 
+		if (ret &lt; 0 &amp;&amp; ret != -ECANCELED)
+			xe_gt_report_driver_error(ct_to_gt(ct),
+						  XE_GT_DRV_ERR_GUC_COMM,
+						  &quot;CTB receive failed (%pe)&quot;,
+						  ERR_PTR(ret));
+
 		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
 			struct drm_device *drm = &amp;ct_to_xe(ct)-&gt;drm;
 			struct drm_printer p = drm_info_printer(drm-&gt;dev);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2fd8cc26fc9f..1100e9321775 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -21,6 +21,7 @@
 #include &quot;xe_memirq.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_sriov.h&quot;
+#include &quot;xe_tile.h&quot;
 
 /*
  * Interrupt registers for a unit are always consecutive and ordered
@@ -226,8 +227,9 @@ gt_engine_identity(struct xe_device *xe,
 		 !time_after32(local_clock() &gt;&gt; 10, timeout_ts));
 
 	if (unlikely(!(ident &amp; INTR_DATA_VALID))) {
-		drm_err(&amp;xe-&gt;drm, &quot;INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n&quot;,
-			bank, bit, ident);
+		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR,
+					    &quot;INTR_IDENTITY_REG%u:%u 0x%08x not valid!&quot;,
+					    bank, bit, ident);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 87adefb56024..217d37fa3deb 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	return 0;
 
 fail:
-	xe_gt_err(gt,
-		  &quot;discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n&quot;,
-		  idx, e-&gt;clr_bits, e-&gt;set_bits,
-		  str_yes_no(e-&gt;reg.masked),
-		  str_yes_no(e-&gt;reg.mcr),
-		  ret);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
+				  &quot;discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d&quot;,
+				  idx, e-&gt;clr_bits, e-&gt;set_bits,
+				  str_yes_no(e-&gt;reg.masked),
+				  str_yes_no(e-&gt;reg.mcr),
+				  ret);
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -207,7 +207,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	return;
 
 err_force_wake:
-	xe_gt_err(gt, &quot;Failed to apply, err=%d\n&quot;, err);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
+				  &quot;Failed to apply %s save-restore MMIOs, err=%d&quot;,
+				  sr-&gt;name, err);
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -234,9 +236,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	p = drm_debug_printer(KBUILD_MODNAME);
 	xa_for_each(&amp;sr-&gt;xa, reg, entry) {
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
-			xe_gt_err(gt,
-				  &quot;hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n&quot;,
-				  hwe-&gt;name, RING_MAX_NONPRIV_SLOTS);
+			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE,
+						  &quot;hwe %s: maximum register whitelist slots (%d) reached, refusing to add more&quot;,
+						  hwe-&gt;name, RING_MAX_NONPRIV_SLOTS);
 			break;
 		}
 
@@ -259,7 +261,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	return;
 
 err_force_wake:
-	drm_err(&amp;xe-&gt;drm, &quot;Failed to apply, err=%d\n&quot;, err);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
+				  &quot;Failed to whitelist %s registers, err=%d&quot;,
+				  sr-&gt;name, err);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 044c20881de7..cf81e77a7eb4 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -72,6 +72,46 @@
  *  - MOCS and PAT programming
  */
 
+static const char *const xe_tile_drv_err_to_str[] = {
+	[XE_TILE_DRV_ERR_GTT] = &quot;GTT&quot;,
+	[XE_TILE_DRV_ERR_INTR] = &quot;INTERRUPT&quot;
+};
+
+/**
+ * xe_tile_report_driver_error - Count driver error for tile
+ * @tile: tile to count error for
+ * @err: Enum error type
+ * @fmt: debug message format to print error
+ * @...: variable args to print error
+ *
+ * Increment the driver error counter in respective error
+ * category for this tile.
+ *
+ * Return: void.
+ */
+void xe_tile_report_driver_error(struct xe_tile *tile,
+				 const enum xe_tile_drv_err_type err,
+				 const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
+		     __XE_TILE_DRV_ERR_MAX);
+
+	xe_tile_assert(tile, err &gt;= 0);
+	xe_tile_assert(tile, err &lt; __XE_TILE_DRV_ERR_MAX);
+	WRITE_ONCE(tile-&gt;drv_err_cnt[err],
+		   READ_ONCE(tile-&gt;drv_err_cnt[err]) + 1);
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &amp;args;
+
+	drm_err(&amp;tile-&gt;xe-&gt;drm, &quot;TILE%u [%s] %pV\n&quot;,
+		tile-&gt;id, xe_tile_drv_err_to_str[err], &amp;vaf);
+	va_end(args);
+}
+
 /**
  * xe_tile_alloc - Perform per-tile memory allocation
  * @tile: Tile to perform allocations for
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 1c9e42ade6b0..446a76c43189 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,5 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
+void xe_tile_report_driver_error(struct xe_tile *tile,
+				 const enum xe_tile_drv_err_type err,
+				 const char *fmt, ...);</pre>
    </blockquote>
    <p>LGTM.</p>
    <p>Acked-by:<span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;
mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-ansi-language:
EN-US;mso-fareast-language:EN-US;mso-bidi-language:AR-SA"> Himal Prasad
        Ghimiray &lt;<a href="mailto:himal.prasad.ghimiray@intel.com" class="moz-txt-link-freetext">himal.prasad.ghimiray@intel.com</a>&gt;</span></p>
    <blockquote type="cite" cite="mid:20240130084135.2065579-1-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------cb5iekLoJZxaEJCpA7IFMk6L--
