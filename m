Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB96CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 06:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E966110E594;
	Mon,  5 Oct 2026 06:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3vAdLWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09E610E594
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 06:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791183523; x=1822719523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yy5lKXYzBNUzLXPQp+y2rGbHwmUDbCRmqXPtFVYrocM=;
 b=n3vAdLWPMpzAxakvyNA4pqZ1RbozttzSboLMJpVC6ns+CFF/0HpbBo6o
 ura3y47ZjcvNapyt5mD/W+G3NuMXAPODsTik2yeo+XzKWZnprsq9wg3Ho
 KHeg5quAxhi+IZZ/BtDhlYQ01V9wgjfRnObpm2NWltolfOZ9tyaGiXyEC
 +22uFuyDPkhG9cr3GwxovwUGbaWHO40KKHrdEQ9Pua4KHYAOSVn13tVj+
 QMI9gOrOUPJaX6KcexsNNNzjhCehstqAFfeN6oa2HEUSwy5DU/5FGwZuL
 SOVxRVf3VXGhDr9cC9KMWsfLfS/rKS+DTx+QM6ZY2y80cOUJPQc+qDPkb w==;
X-CSE-ConnectionGUID: jx5iRgO8QBemNi7kGpS6SA==
X-CSE-MsgGUID: tZy8PCYmTACIBwL0/BssEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="101169916"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="101169916"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:58:42 -0700
X-CSE-ConnectionGUID: j5JzO2mcTB2WDcQd7xNu0Q==
X-CSE-MsgGUID: V7fAxekAQCWJ0SHgsysgjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="743035"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:58:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:58:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:58:41 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLMhc1yZNRFGvifDQ7Z5jiwpCzHzOCS3XHxzLGwglPzsiOjkVR+rZ4lqhOOY/UVnSLRvF4gGG1V8QXCqzM8slXDqUjEFZ27OkJv6WzrKt9XaEBIfPFTcjBnHvbwh9bawjex6fHTz2BxIYPMOoUm4jkiuzNHQLhit92I0bjbWEJGDi279pMRHcRrtGgtMyeIc+XuPPVaR7C8tCqKt1+MrVtLeQ7sxYo1Pk4HwFJqsBWvdiYz9M1RNirlMmToMzpJxSowIImNkr/mLZ27SFIy3EzTmEhmPNLh4CDdkCr8Lv5ezjBB6wvC3zUDHDx7jVGO02kcNLeKnO4AmArULTrPVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2Yc43JgfpNcGcH/4n4jLIUlENww08+vWRCwUcvORbc=;
 b=tb1FyxKehhSbn6WKY7eus3n4W9BIVi5kDW1qpzn6MWhfzsWyxtAOa2G56vtedMLY5s/DZu4AVth5kuuKK4no0ci4RnE1tf+YBCNGKYXr7oONXnBh5w1jQcSzExFO55gKcafrzeAL433DqZkeZBZnbhW93E3eVz4RXT04By1AV7jKgPlhIggj1Xf4Wbed+aFJ2mh7WqkFD5yt5tDcHJ6tU1ecH4fMy3s4adbSTPSZlK9YBadrELZmNZUj3s6aSiOpLDGdoR8rtWssh3QEab6YjOHu8dgcQd0ZxobrNMN7V7516uiBmpl+mxRauoRcG3CBs/6vQ8gYYOyCNjVHlbcVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB7770.namprd11.prod.outlook.com
 (2603:10b6:610:129::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 06:58:39 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 06:58:38 +0000
Message-ID: <22c921f8-8cd2-4abe-b13b-253f781f085b@intel.com>
Date: Mon, 5 Oct 2026 12:28:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: Re-validate external pin under resv lock
 before VRAM purge
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
 <20261001094518.1493651-8-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261001094518.1493651-8-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ee292b-0c6b-47db-b7cf-08df22ae14d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DzkACUcjsy4bm3eDayrHtfZhBT8fFimy3EcmOHBjQupPbQ1QhwvYchz1LOsVqKSQrba0+MFiwVC/cB8ZgWZerw6FlpqN8quXxQgWYR8Ebt2eBfLW68+p0duKW1Z+Z8vI601ePAk7O8f55z9XbUDUBaUufY4edC3DmgeVtf5q/dgT4l59G2yYVjXbRzxc1IRNFwEwMH5c1vVD22S72qsSadK5tZtd8o6GW5MoIuOY9Ww7YPRn7/LERJeluKowSXBmJfg0YkYeQICrh7KPOaEoKkL4tHP2Oh76UbKcvwYaiU00LyvzfNkDShfXalT7GTSV2pddcg/JqDT9RawxAjnqY6Bitaxe3EGkrUejPAaad/mYgm6zl2M/fUrF8wCUq2913QHUvc4QdeYfsrofNlI1JVx2gmy8wRG7G/3DsS2qkHhRt2k+WHrbzuwRCfhZL2sxidik/rrdf6/qXiTpNw9h4L3KNz3Dn00ch3s0E/7dgInY3xf0rQck3deSnKTIxvGwGbnjASDxu/TCYvDVCn58g7JFlAFfgHw88x6wisjATeaMWvIRvGk0UVKCSm5rxg8DE4D8BK9G1bqbaTec/6nK9ST2G4uMiDmhvOIwUfwO+M5XknwymJnkHCBkT8Z4AVV99rn/+XiGGmhCv5Lqc0f9UhvCJ6IT6OPHvf47jsqdG/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE93NHlZYTlacWJpaUw5M0lva00rWXA4a2xaU3RNVC9RL1NVQ1phRTJjblgy?=
 =?utf-8?B?YytaNng0VFNaS1hSZEFXc1lneWFJcm1Scjh6VkhwVUYzMlowVnRFQXdsSW9o?=
 =?utf-8?B?UkMzV1NVVFAvMVhTVTFOQWJKMm1rbHRjY3dKWlZTLzJUL3RUOFlxemhJMzNE?=
 =?utf-8?B?cVdOZjdTVy9vbmpYbGhLekx5emFBNVlNbHB2aFFZdy9NbU9JN0JqeHFzTUQr?=
 =?utf-8?B?UDZncGRiM3RSME9tc3ByTjVoNFl2VkJnUTJEaWRuTUl0ZlNBbkZYREhkYWVJ?=
 =?utf-8?B?WGxYeEV4eENEeGhjWGMvSis5Syt5U2lJZzVCdjJPem5iU0Q4clB3RjNrdlRY?=
 =?utf-8?B?VXJlZ1E0b0VGNFZCMzRrQXVUTEUxdWh0bHpFRlR1VS84ZkE5elphZ0tGa2Ev?=
 =?utf-8?B?SVRJQ0IrWXY0MjVYNXZMaldLYTI4U01semQzTjM5RWJ2bXFUT3BTVVp3ZW1n?=
 =?utf-8?B?SzE3ZXBwREcwNlhtQ3FEVEszbnhVWXNITDJ0M1ZBeHVzZWRWMnlNS0dhSDhT?=
 =?utf-8?B?Qy85Q3Boc3NFMXhjUEN4amhWZ1JSR0lMV0Mycm5lV1JKc0JWT0NsU1dvN2V2?=
 =?utf-8?B?Tzg5Sy9KSnJGWUNvNWRmS25ZS0JneHBaaFVyU0tQb3lDRlNhckVWSXBoMDNq?=
 =?utf-8?B?QUJwYlRteUlpejRRWU0vd2czQ0RiZy9LZ29DTGo1TTVkMDJYbk45UEdHeG0w?=
 =?utf-8?B?UnRyTzVicDdMVFpMaDFUUnI0T0NDSWFlWTRJUmFwcm9aVGhoTTNaT1pFaHRo?=
 =?utf-8?B?U2NXVExLMTkvVmp0ZWpDYkx4eWxYamJVN1lHRnlEK0hGNU52WTBncE02YkJP?=
 =?utf-8?B?N1N3M3o1bmlOeDRUaVhaTndYaW5xbWI0RG93SFVoR280TnN5aUZtcjhoc1g3?=
 =?utf-8?B?SFkvTVhZOTg4OE5sQTIvdXA0UVZDMGdaSkp3RExCT2VrYnJUbjFxNXZITlhW?=
 =?utf-8?B?bzNRSkFkSWk5RE9ERldabGt6RCtQKzNKQXc3ZndaVFJyS3NIdXVwakNVTGRt?=
 =?utf-8?B?SGg0bWRVNnROQVp0TVc1ZzhxQTlWeG84UEZoczEyNWVqeXpCUnRnNzNKcWVP?=
 =?utf-8?B?MDVKajRiSko2Wm5SazcrS1hpS0xNN0x3KzZSNkl6SExmdDNOczFVWVZXSDV5?=
 =?utf-8?B?alZWWXM5emdWcXg1OHJ0OHpZKzhxWS9kcThGZFMrWTN6YTlMc0kwczdxeUxa?=
 =?utf-8?B?VVJKdmdlVFN3Y0hPTDhleUtFeElvVTd0cUJEbDF1eHQvaFF5VkJaY2RyU1Z0?=
 =?utf-8?B?cWJlb1c5NE9HK1FjOTRmYXltZmFRdXlkbFBUeEFaNlJyS0k4UldxM3A1dStB?=
 =?utf-8?B?Rmtkb1BmS0JHZzB1MzcrdU4wMVhXRmkvUkNjQ1FUc0ZtZEFNdDk1NFBhNkZq?=
 =?utf-8?B?OTNmQmN1ejlTKzZKOWRmNy9DY3ZpYmJkMU5qRVFyZjBreW1XT0VyZGsyRDc0?=
 =?utf-8?B?THJjajM5TGNKbHZLM1hvNEhIQml3U1ZYRlFmMHhzUVhhSldjSU1oaDBaRTVG?=
 =?utf-8?B?VEUzY3h4bGV1bVBEeUVLNVJVR3FLQ2hxaTdDaDlxdEtvRzhUSXpjbGxDUUc2?=
 =?utf-8?B?Vlg1dUlraEcwUGJBQ0o2Z3Z6KzNlTk9HTThsL2J5RWozcDVua2RDeWVvVno4?=
 =?utf-8?B?TjJXK0FCbHVBdEpFeGNJekliVi95SmZYV24vcHFMSENpalZ1SjFsQVRrSTIz?=
 =?utf-8?B?cnRmS0d5K0ZkMENGcmRUbEw5eDNiaWkrejZpUGhCQlJiWWtrYjhkMHdSQmM3?=
 =?utf-8?B?KzZCYzhQZm96OGF2dHVjSzNGUng0M1RYQlEvbzZCS2Y5THVYY1pWZ3N1TVhT?=
 =?utf-8?B?THVRQ0lKMi9KWlVldUR4YzdQUE12NXBIZ29yQjUxbFd4WnBzaDlMNzc3S0ZC?=
 =?utf-8?B?eS8rMnFJVk40R1o0UUVvR3NlS1JBVlgyQkJYWDNObHVxL0RUblNaeGF0RS8v?=
 =?utf-8?B?Tk85VTEzUlRjQmowa2ZRTnJJZllkTkQzZUk5RGxmeEV5NkY5MGhQOG51Y2JI?=
 =?utf-8?B?anh0UjhRT1l1bHkvRzEvUEEwNVhSNU1CZDJPckIrUTE0Wi9xSmhBWUtiV3ND?=
 =?utf-8?B?OFpMcjhCQzJFQURmc090a1FweXpHemoyYVZkclR2QWZ0bk9xQXNwU2hSOVd5?=
 =?utf-8?B?L3h2S3doTjBkZHZDSzJYT05EYUZrL3V0dHJJc3FwbTFpV1A4MEJ3LzNIMWVj?=
 =?utf-8?B?dnhHejJUOEtUemxzeDl0cC8vanBMN0tsYVFnV01oT0ZkSkJDNktWWFBmM2xn?=
 =?utf-8?B?SEdBVjlxdGZhMVVoUkh3VFpJd2c2Q2pRR3lrMGJXNTdOQmVpU09JYVJtaVhE?=
 =?utf-8?B?dmYxREZYODd4QVdnMDdxRXdwWVFieWF3TmpWVW8yTThKQ3poWkZxUU9JSzZI?=
 =?utf-8?Q?Cz9MH6i1UHR3APOY=3D?=
X-Exchange-RoutingPolicyChecked: B9SQVNc4Y8ekkpE2BLwUHHFYSAmEV1UqdqyoW2DRhDJJeo0R0SdA0rvyk3QBn7TFa8z39FsSZBJzKu7+fXL/IW3ZmSgVqDw8W0MX1ys6T8ec3zHkDv4N8LVh7UpKEJUTBwwVucfVKpyhED1+qEC2SG5RL7jBGeS6K8adhvP7xC2cbC348qmBQSVrkypqVo+CN5cpGsPRHK5KoxiZo0PF4JujYiXwhmcxf8t6PbXvCj+66/o2ofB+A8I4JL7j97mxckBV6jXfSK0NZC93IffaQX19gNBApxHfLVjwSLAyGvhTWedQzEgQ4XY9UsEcAFJkT46nhHqZvFBvSKFHKlRkUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ee292b-0c6b-47db-b7cf-08df22ae14d7
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 06:58:38.4448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEXJuNoS/+BH/Ce3idrXWumz9jijn49wKUISsx07kkRP6yUE0u2G0uaM5ZexPyiJKfz5wErcuJ52P4RdaIQpAfBFXn+DurQfBGmuWOfa+88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7770
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



On 01-10-2026 15:15, Tejas Upadhyay wrote:
> xe_ttm_vram_reserve_page_at_addr() checks xe_bo_is_user() &&
> xe_bo_is_pinned() while holding only mgr->lock, not the BO's
> reservation lock, since it must run before the owning BO is
> even known to be purgeable. A user BO can become pinned
> after that check passes but before xe_ttm_vram_purge_page()
> runs.
> 
> xe_ttm_vram_purge_page() takes the reservation lock but only
> rechecks xe_bo_is_pinned(), not xe_bo_is_user(). If the race
> is hit, it calls xe_bo_unpin() (the kernel-BO unpin path,
> not xe_bo_unpin_external())on an externally pinned BO and
> then purges its backing store while userspace/hardware still
> expects it to be resident.
> 
> Recheck xe_bo_is_user() && xe_bo_is_pinned() under the
> reservation lock and reject the purge, requesting SBR with
> -EIO the same way the caller's own critical-BO check
> already does.
> 
> Fixes: 7737f819e9f1 ("drm/xe/vram: Add VRAM page offline fault handler")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 4c5837cdb996..ed79e4c6ba1a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -687,6 +687,19 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
>   		goto out;
>   	}
>   
> +	/*
> +	 * The caller's user+pinned check was lockless (mgr->lock only), so an
> +	 * external pin can race in before we get here. Re-validate now that
> +	 * we hold the reservation lock and reject the purge instead of
> +	 * unpinning a BO userspace still expects to be resident. Request SBR
> +	 * the same way the caller's own critical-BO check does.
> +	 */
> +	if (xe_bo_is_user(bo) && xe_bo_is_pinned(bo)) {
> +		xe_bo_unlock(bo);
> +		ret = -EIO;
> +		goto out;
> +	}
> +
>   	xe_bo_set_purgeable_


Patch looks correct.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


state(bo, XE_MADV_PURGEABLE_DONTNEED);
>   	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
>   	if (xe_bo_is_pinned(bo))
> @@ -851,6 +864,13 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   		 */
>   		ret = xe_ttm_vram_purge_page(xe, pbo);
>   		xe_bo_put(pbo);
> +		if (ret == -EIO) {
> +			/* Raced into an external pin after the lockless check above */
> +			drm_err(&xe->drm,
> +				"%s: addr: 0x%llx became externally pinned, requesting SBR\n",
> +				__func__, addr);
> +			return ret;
> +		}
>   		if (ret)
>   			drm_warn(&xe->drm, "Purge failed at addr:0x%llx, ret:%d\n", addr, ret);
>   	}

