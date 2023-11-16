Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9623C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 22:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B99810E70D;
	Thu, 16 Nov 2023 22:38:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908A610E70C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 22:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700174327; x=1731710327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MjVTmjqT3jZpZ5PyyPuCUtakpBtk4CUaQoegIEXbz4Q=;
 b=AKWOIeZqZFbXo8alz+yjOODuofJPonsOElp0S6fhZ/LqzvKbpAKzLakk
 u/LrhjDPivTb7DxWPeApml/mdVQN1cnWb0rKZpOKwiKgZknIFQ191vdrq
 Kgv412iQUIZ8AE31S9lfBtZS0YXwtfPA3qxnKfacFz7wnPk5mS7STyv64
 GEGbujTFfF6RQFgDEHXkoA+EkVponzvrO6fC8krwRp0NqkMZQZMfzAp25
 mzW2PN95cT+GpVSXRNs/v+R0g5f4awtMsL3w/2BOIGMPtDrt38qMjq2ZN
 nuBsljb8K9NX7cRqZtD4bCSjPH1I66HwyleP6O25aGjk7qem6KJIwC0yY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="4324162"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="4324162"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 14:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="938978282"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="938978282"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 14:38:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 14:38:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 14:38:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 14:38:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 14:38:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky3dZTjRCeeuW5JvPFpnIfECw7TAC9YB9635UdA7ol6U36tf9uhri3io1qw5zH7OXEjlZ+m/Kq/ZjnGrL19KYdLSSBr5zh/ZEnV0mV4bRjoraG9wopmZFBZAViZ5FHO+K0zSCYlWLrs7P8ajIBKFruz5YcgmqCyAENAOUlenKu9t+OF0skVaGYEuZGBLfK1i5MS5mAKSZyksO1WXF+qu/bViIxPDurnSWMzi5XGcidYcGbXl6b5M10Fr80hVVJNFwgzK4ADgifB40G+FGj6NTVbRht221hS90LvVSofsF9adEwl0KNe5oZUiL0XsjjyOgtif+DMhL9gyvSJFx5ykCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f4elYx2OKJB2q3XJ9HsrU8/Sj3kCOLb4NeXwiJqgvA=;
 b=c8JLIV//p9FIQB8ZqLhmIhGuswkOYZoeslfIp6IjCJ1tIh/pJv6QMOf1WywDJZjLPiPFF/+DhUURgW6rqQDcVaUn+LW4iLZ29bnfKyNeRija0y7I2Nm1/CL+DFMQiYRFQ/xm+4+8e2il01QItC1YAv9NeftqcwtmHBaFyeNNsAUYahukFkuF1oVRXrWULSNf9nQiw/WYSrk+HUS17kABPizWAH3GUUZUzvw23bzDCEP5fTwN6urzQhpBMiGjehr9sl338+mm3Gf5qFlLeBRtMYpZPUgpTIosoKXVAtl04Kif4tFvyo9t/YDA2EmbogklhwlJ2lS5udjkfsyldmyPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB5552.namprd11.prod.outlook.com (2603:10b6:5:399::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 22:38:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 22:38:25 +0000
Message-ID: <c696a48c-04e5-4d66-9847-42525ec9f1aa@intel.com>
Date: Thu, 16 Nov 2023 14:38:23 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
 <20231115004615.2424177-3-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231115004615.2424177-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:303:b8::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB5552:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d50958c-4b91-4e44-b191-08dbe6f4bea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rs6wg9/Vhmmev6Ji3bWgoMM7EGxQaC1lSbM/oc38IYX8MH/et6LEAh5GYD1Io89G9XMuDLUshCoDGFVpUrwtEpHoJacd4eYMAELP2qVCMg5dNHnMbrKw9rIZX5iE34A38q6wxodY1sDB1sYSWMzyLNK9I148XA1/BXxBEhkQbmSeqEJyDDaz3ikBAgBMp4LQJSLin8wF1NMAIN0ebRxC8AZU2Eg8iA5cEjnyrjzjejiffKVFriL6+KPWPtlhkP+rGUSyKOKrqqUDivhbopFFUDW/6ezzHfmxczQ+0wT6RYO5hvLUcjzAy4cWqfGcP0GtfYW8I3JIW0+DcFfs5IGqt7d+LD/Oyqp/ZTARYvq0M4PGpM/e5OOAsXN4bTv9uBstJ+UwREYjGbQ4rfzr8Lv7UUCBpgBGf8PSxY6L/aME3iyervReKGsC572iEMW+mR3KGgFaffEtDaTvLLq6UdRzDW+9fssVYHuISqre95I44NMOV3lE8NUqlwKrdhirWty50Eg4tBMMhcQs8eLTVdSlXU95gI7m8pderd9hw6gpa6PQnut4RjWtU4wOzDCOG6bep3qO4VRVaN4eceh64i4lvjjM06WN0F3Vp6hEONV4L3fD73Kj6tr8++Sz+goygLO4cI34rfh10at+TN4FTwNQtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66946007)(66476007)(41300700001)(316002)(66556008)(5660300002)(86362001)(31696002)(30864003)(2906002)(4326008)(8936002)(8676002)(82960400001)(83380400001)(38100700002)(31686004)(6486002)(478600001)(2616005)(36756003)(107886003)(6506007)(26005)(53546011)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWxFbzBzdjBPcVN6RXBrWXFyY2F6cXgyQlBvZ2JzSU9WRVNZVVMvN0Fra29t?=
 =?utf-8?B?d0FYclIvNjlkMUhVRXB5TUl3cnZieDR0L0RSOHNFSDIydm81N3UzTVcyNUJ3?=
 =?utf-8?B?bjg5RXpLSTFrT0oyVmc3cHpNTlFyWGlxTzdkd1Z1S2RscFlGQ05SK095ZjRs?=
 =?utf-8?B?MW04c3NUNjdpdTd0OUdoSW82ZkE3UGo3dlVXTk02bXA5d1BVbUFaWVBCb08w?=
 =?utf-8?B?YkdpSXh5bFkxTDNwMEhUZzJMdC95VENKTjFzSzJtMVlveFdIWXdNNXdnRmVy?=
 =?utf-8?B?QzdPYkZlTlFDRTdUZkpZN0dYNVJuMytvV1ZVRHRWRHh1Yk9oZjY5Tnc0VjM5?=
 =?utf-8?B?WUJWTVpBODNCY1VyOHdXQXBhOHpLY2RVUlFPM3ZDVmxKTDBzNEtmb2ZZdjQ0?=
 =?utf-8?B?djRWZ21xUmt0LzlWQml1VFBxUW8yciswdGRZVWhZOFVsdnh5VWU0YW5xVzZU?=
 =?utf-8?B?Mk9tcGdQamp0bmQyWDJTZENiT1N5TkpVTlc0eGp3MWN4dXU3b3M0dDF0U3J0?=
 =?utf-8?B?RVB0ZGt4Wk5PVDF4VlZTTkdKUjIyOG1OdHluM1QzdW0rVnY3NlNEbU5TUDlr?=
 =?utf-8?B?OFVTUDgvNm40d2RNQ3N1MDdGa1dDWGtWR0ZFWkJEaVdHNTU0aUMzMmxwRzNU?=
 =?utf-8?B?VnRXaERMYURXNW12MnVMaU5BZUYyMk4yeUUxY3QwdXhnZ2dOYU1iNkZsTGND?=
 =?utf-8?B?TFJRREtCVk1nMkRwMFNzcjJlM0RVMnlGeC9LcWFZU3ZTODhoOWFyM0NOTHdz?=
 =?utf-8?B?SGMySS8xSHhHOTJqNkJYZ3RsdDllaHhEY0FNSnNpUGtRTllwZHFoYlB6TDlW?=
 =?utf-8?B?VzB0NnQxcTRCaUVUcC9PdExIQXNxcGJkRnl0dDNrY0JwZUp4ckx1TTlNQmdP?=
 =?utf-8?B?b3N0bjZ3ZkZkeDc5eGQvU0NFOVVTSWF1MnFwOHZsWHZJZTdpMVZ6ZTlNR0l3?=
 =?utf-8?B?aTFQYTZJdldTR2R0bnFRNVZ6ZkVrRXY4bUVqd3I3dlA0K01EcFpwVTh0QjJt?=
 =?utf-8?B?MktEOFF4TzFmUCtoVm94VlRrbTZZbEM4QjVCTkN0cUJlaUc2bTRIYkM0YWpS?=
 =?utf-8?B?eldDUUE1L3Y4NDBGZmVyOW1pWmxBMUllUjI0SXRYSldFS0UxY1pxVkc2WnZC?=
 =?utf-8?B?YWNKVXJGQ0ZWTTAyMDFjUU9RdEZGaGZLamZXQ2hBNXpNNkZVVWhXQW85UWRv?=
 =?utf-8?B?QkZ0dG9MNlRyaDBTUzZuM1Q0dlpQUFQxV0dDMmljNklmbTJYNW1pLzQxMTY0?=
 =?utf-8?B?WlAzdXJRRFZ3TG5jUDQwdkM2Y0FtRjFZeGs5NlhsOVMwWE1xRVNYbzlOdzFQ?=
 =?utf-8?B?TW5UNVZwVmlKNFhCdmZ6MTFtQ3ZIb0VvdllyYkw3aHYzaTNmTEpHeU1YSlhQ?=
 =?utf-8?B?ZXdPOU0vYVZjaVVVVHVva0pQS0lraVA3ejdXS3JvMXV3U0hkZE0vWStUL083?=
 =?utf-8?B?ZXBJSlRkbGgzcEZHcnF4Y2ZvSTFRZU03V0hWOFlZNlJWV2hVYWcwM1hZZmNl?=
 =?utf-8?B?dzFFQXNQV2JXN2pLZjRBVWhHL05Uays4ZVFVb0dQWkM1M3lXd1VvQ1o5bWRS?=
 =?utf-8?B?U1hJMDBleDJQdnpFakNReE9jZHpDSGVWQUJsSThJdi9TV3c2c01YRU1uQVZu?=
 =?utf-8?B?c1V3bUtRRXlPZXdOd3FwNXpEWW1zVUFhWFgyeW1NZVNra3F1aEozelBtZE56?=
 =?utf-8?B?Q3laN0hXY003MVFWMXhEQUJabUxuV2VTS1BZemdob25HWW1CNUVZMFdvNUhK?=
 =?utf-8?B?YnVLSXI1SkNySlBJN252Wm9LeFRRWVgwNWg2TTkwbHVja0taNjBGbUhzSHF4?=
 =?utf-8?B?SS96bnBtMVJuV1Jxb0l2WjVaT1ArSmxzODNZTzBYZDNxMXRxckZXaWVoTHRH?=
 =?utf-8?B?em9GaGNmOGxnSUkyYkJjNGN4VjJmSFROTUdZdG1VanowZjZjWXl1U2c1QTZW?=
 =?utf-8?B?VCtsN05LbUVOcURWcTVsZ2lGcjdzMGxRNE5uS3JTb1lYL3NnMkYrbE9RS0pr?=
 =?utf-8?B?clkyZlBzWVR3Zk9hVUhla2d6dHhWVy9QZWJOL0ZuYnBYYWFZSndRSFhSTFpW?=
 =?utf-8?B?ZEdjWTQrRW43NWREdmZsN3FGdko2eHhDMkJhbmJVMmgyekdzaDc1OEJmRmVB?=
 =?utf-8?B?amxmbUhDdW9qMjR4Mk9QOWZmRTFZNnl5ZjB6U0dUQWpud1NUQ29BV0NsQUNH?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d50958c-4b91-4e44-b191-08dbe6f4bea8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 22:38:25.0091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrMkgYy6QuJcVGj9633U5kdwN0YGJRmtXqwsp618Zs6LzxSTCz0AOa90SfGeobZzZXccmaFQzyA+O1sPWSkKour1AiCHQuCkbG1wQ9nbg6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5552
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/11] drm/xe/uc: Rework uC version
 tracking
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

On 11/14/2023 16:46, Daniele Ceraolo Spurio wrote:
> The GSC firmware, support for which is coming soon for Xe, has both a
> release version (updated on every release) and a compatibility version
> (update only on interface changes). The GuC has something similar, with
> a global release version and a submission version (which is also known
> as the VF compatibility version). The main difference is that for the
> GuC we still want to check the driver requirement against the release
> version, while for the GSC we'll need to check against the compatibility
> version.
> Instead of special casing the GSC, this patch reworks the FW logic so
> that we store both versions at the uc_fw level for all binaries and we
> allow checking against either of the versions. Initially, we'll use it
> to support GSC, but the logic could be re-used to allow VFs to check
> against the GuC compatibility version.
> Note that the GSC version has 4 numbers (major, minor, hotfix, build),
> so support for that has been added as part of the rework and will be
> used in follow-up patches.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_types.h   |   9 --
>   drivers/gpu/drm/xe/xe_uc_fw.c       | 141 +++++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  35 +++++--
>   3 files changed, 110 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 0fdcc05dc16a..cd80802e8918 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -52,15 +52,6 @@ struct xe_guc {
>   			/** @seqno: suspend fences seqno */
>   			u32 seqno;
>   		} suspend;
> -		/** @version: submission version */
> -		struct {
> -			/** @major: major version of GuC submission */
> -			u32 major;
> -			/** @minor: minor version of GuC submission */
> -			u32 minor;
> -			/** @patch: patch version of GuC submission */
> -			u32 patch;
> -		} version;
>   #ifdef CONFIG_PROVE_LOCKING
>   #define NUM_SUBMIT_WQ	256
>   		/** @submit_wq_pool: submission ordered workqueues pool */
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 91d4a2272ee7..9205a3ecff78 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -204,9 +204,12 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   	for (i = 0; i < count && p <= entries[i].platform; i++) {
>   		if (p == entries[i].platform) {
>   			uc_fw->path = entries[i].path;
> -			uc_fw->major_ver_wanted = entries[i].major;
> -			uc_fw->minor_ver_wanted = entries[i].minor;
> +			uc_fw->versions.wanted.major = entries[i].major;
> +			uc_fw->versions.wanted.minor = entries[i].minor;
>   			uc_fw->full_ver_required = entries[i].full_ver_required;
> +
> +			/* compatibility version checking coming soon */
> +			uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
>   			break;
>   		}
>   	}
> @@ -273,32 +276,30 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>   static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   {
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -	struct xe_guc *guc = &gt->uc.guc;
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>   
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
> -	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
> +	xe_gt_assert(gt, release->major >= 70);
>   
> -	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
> +	if (release->major > 70 || release->minor >= 6) {
>   		/* v70.6.0 adds CSS header support */
> -		guc->submission_state.version.major =
> -			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -				  css->submission_version);
> -		guc->submission_state.version.minor =
> -			FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -				  css->submission_version);
> -		guc->submission_state.version.patch =
> -			FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> -				  css->submission_version);
> -	} else if (uc_fw->minor_ver_found >= 3) {
> +		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> +						 css->submission_version);
> +		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> +						 css->submission_version);
> +		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> +						 css->submission_version);
> +	} else if (release->minor >= 3) {
>   		/* v70.3.0 introduced v1.1.0 */
> -		guc->submission_state.version.major = 1;
> -		guc->submission_state.version.minor = 1;
> -		guc->submission_state.version.patch = 0;
> +		compatibility->major = 1;
> +		compatibility->minor = 1;
> +		compatibility->patch = 0;
>   	} else {
>   		/* v70.0.0 introduced v1.0.0 */
> -		guc->submission_state.version.major = 1;
> -		guc->submission_state.version.minor = 0;
> -		guc->submission_state.version.patch = 0;
> +		compatibility->major = 1;
> +		compatibility->minor = 0;
> +		compatibility->patch = 0;
>   	}
>   
>   	uc_fw->private_data_size = css->private_data_size;
> @@ -307,30 +308,31 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
> +	struct xe_uc_fw_version *found = &uc_fw->versions.found[uc_fw->versions.wanted_type];
>   
>   	/* Driver has no requirement on any version, any is good. */
> -	if (!uc_fw->major_ver_wanted)
> +	if (!wanted->major)
>   		return 0;
>   
>   	/*
>   	 * If full version is required, both major and minor should match.
>   	 * Otherwise, at least the major version.
>   	 */
> -	if (uc_fw->major_ver_wanted != uc_fw->major_ver_found ||
> -	    (uc_fw->full_ver_required &&
> -	     uc_fw->minor_ver_wanted != uc_fw->minor_ver_found)) {
> +	if (wanted->major != found->major ||
> +	    (uc_fw->full_ver_required && wanted->minor != found->minor)) {
>   		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
>   			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> -			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
> +			   found->major, found->minor,
> +			   wanted->major, wanted->minor);
>   		goto fail;
>   	}
>   
> -	if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
> +	if (wanted->minor > found->minor) {
>   		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended, but only (%u.%u) was found in %s\n",
>   			   xe_uc_fw_type_repr(uc_fw->type),
> -			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> -			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> +			   wanted->major, wanted->minor,
> +			   found->major, found->minor,
>   			   uc_fw->path);
>   		drm_info(&xe->drm, "Consider updating your linux-firmware pkg or downloading from %s\n",
>   			 XE_UC_FIRMWARE_URL);
> @@ -349,6 +351,7 @@ static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>   static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t fw_size)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>   	struct uc_css_header *css;
>   	size_t size;
>   
> @@ -390,12 +393,9 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	}
>   
>   	/* Get version numbers from the CSS header */
> -	uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -					   css->sw_version);
> -	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -					   css->sw_version);
> -	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> -					   css->sw_version);
> +	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
> +	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
> +	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
>   
>   	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>   		guc_read_css_info(uc_fw, css);
> @@ -431,6 +431,7 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>   	struct xe_device *xe = gt_to_xe(gt);
>   	const struct gsc_cpd_header_v2 *header = data;
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>   	const struct gsc_manifest_header *manifest;
>   	size_t min_size = sizeof(*header);
>   	u32 offset;
> @@ -468,9 +469,9 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
>   
>   	manifest = data + offset;
>   
> -	uc_fw->major_ver_found = manifest->fw_version.major;
> -	uc_fw->minor_ver_found = manifest->fw_version.minor;
> -	uc_fw->patch_ver_found = manifest->fw_version.hotfix;
> +	release->major = manifest->fw_version.major;
> +	release->minor = manifest->fw_version.minor;
> +	release->patch = manifest->fw_version.hotfix;
>   
>   	/* then optionally look for the css header */
>   	if (css_entry) {
> @@ -524,12 +525,25 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
>   	return 0;
>   }
>   
> +#define print_uc_fw_version(p_, version_, prefix_, ...) \
> +do { \
> +	struct xe_uc_fw_version *ver_ = (version_); \
> +	if (ver_->build) \
> +		drm_printf(p_, prefix_ " version %u.%u.%u.%u\n", ##__VA_ARGS__, \
> +			   ver_->major, ver_->minor, \
> +			   ver_->patch, ver_->build); \
> +	else \
> +		drm_printf(p_, prefix_ " version %u.%u.%u\n", ##__VA_ARGS__, \
> +			  ver_->major, ver_->minor, ver_->patch); \
> +} while (0)
> +
>   int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>   	struct xe_tile *tile = gt_to_tile(gt);
>   	struct device *dev = xe->drm.dev;
> +	struct drm_printer p = drm_info_printer(dev);
>   	const struct firmware *fw = NULL;
>   	struct xe_bo *obj;
>   	int err;
> @@ -567,9 +581,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   	if (err)
>   		goto fail;
>   
> -	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
> -		 xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
> +	print_uc_fw_version(&p,
> +			    &uc_fw->versions.found[XE_UC_FW_VER_RELEASE],
> +			    "Using %s firmware from %s",
> +			    xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>   
>   	err = uc_fw_check_version_requirements(uc_fw);
>   	if (err)
> @@ -686,26 +701,40 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>   	return err;
>   }
>   
> +static const char *version_type_repr(enum xe_uc_fw_version_types type)
> +{
> +	switch (type) {
> +	case XE_UC_FW_VER_RELEASE:
> +		return "release";
> +	case XE_UC_FW_VER_COMPATIBILITY:
> +		return "compatibility";
> +	default:
> +		return "Unknown version type";
> +	}
> +}
>   
>   void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
>   {
> +	int i;
> +
>   	drm_printf(p, "%s firmware: %s\n",
>   		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   xe_uc_fw_status_repr(uc_fw->status));
> -	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u.%u\n",
> -		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> -		   uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
> -	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
> -	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
> -
> -	if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
> -		struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -		struct xe_guc *guc = &gt->uc.guc;
> -
> -		drm_printf(p, "\tSubmit version: %u.%u.%u\n",
> -			   guc->submission_state.version.major,
> -			   guc->submission_state.version.minor,
> -			   guc->submission_state.version.patch);
> +
> +	print_uc_fw_version(p, &uc_fw->versions.wanted, "\twanted %s",
> +			    version_type_repr(uc_fw->versions.wanted_type));
> +
> +	for (i = 0; i < XE_UC_FW_VER_TYPE_COUNT; i++) {
> +		struct xe_uc_fw_version *ver = &uc_fw->versions.found[i];
> +
> +		if (ver->major)
> +			print_uc_fw_version(p, ver, "\tfound %s",
> +					    version_type_repr(i));
>   	}
> +
> +	if (uc_fw->ucode_size)
> +		drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
> +	if (uc_fw->rsa_size)
> +		drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 1650599303c8..e4774c560e67 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -59,6 +59,22 @@ enum xe_uc_fw_type {
>   };
>   #define XE_UC_FW_NUM_TYPES 2
>   
> +/**
> + * struct xe_uc_fw_version - Version for XE micro controller firmware
> + */
> +struct xe_uc_fw_version {
> +	u16 major;
> +	u16 minor;
> +	u16 patch;
> +	u16 build;
> +};
> +
> +enum xe_uc_fw_version_types {
> +	XE_UC_FW_VER_RELEASE,
> +	XE_UC_FW_VER_COMPATIBILITY,
> +	XE_UC_FW_VER_TYPE_COUNT
> +};
> +
>   /**
>    * struct xe_uc_fw - XE micro controller firmware
>    */
> @@ -98,16 +114,15 @@ struct xe_uc_fw {
>   	 * version required per platform.
>   	 */
>   
> -	/** @major_ver_wanted: major firmware version wanted by platform */
> -	u16 major_ver_wanted;
> -	/** @minor_ver_wanted: minor firmware version wanted by platform */
> -	u16 minor_ver_wanted;
> -	/** @major_ver_found: major version found in firmware blob */
> -	u16 major_ver_found;
> -	/** @minor_ver_found: major version found in firmware blob */
> -	u16 minor_ver_found;
> -	/** @patch_ver_found: patch version found in firmware blob */
> -	u16 patch_ver_found;
> +	/** @versions: FW versions wanted and found */
> +	struct {
> +		/** @wanted: firmware version wanted by platform */
> +		struct xe_uc_fw_version wanted;
> +		/** @wanted_type: type of firmware version wanted (release vs compatibility) */
> +		enum xe_uc_fw_version_types wanted_type;
> +		/** @found: fw versions found in firmware blob */
> +		struct xe_uc_fw_version found[XE_UC_FW_VER_TYPE_COUNT];
> +	} versions;
>   
>   	/** @rsa_size: RSA size */
>   	u32 rsa_size;

