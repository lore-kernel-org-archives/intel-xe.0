Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D0CC54E5D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 02:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AC910E768;
	Wed, 13 Mar 2024 02:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OfcsPCIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DC510E768
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 02:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710296714; x=1741832714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l1qxrjS1LzuNiE1PqdiBZrY0tn7Oj3B7HuTQ8KFPLkM=;
 b=OfcsPCIbTLlt6YPa0+TE7Texug39SZfKmZeqNUusja253LZOTj8Y8F5/
 I1nItbAIbAYBnNyPMSfFH3IPkS3zfZxafGcEFZdBgCgU0yiQVL8QlS51Q
 KFOLgnfI6Gjuo3egrCHQgfRlZ4e4OhdnVLwRWbpEgiGMEOdGX9lv6COcU
 HAQQshkEUfI4zhhUs32AA57DvLRbtZSmClniQw2b60WCFv5TFl13P59d5
 jbIUtw/Z4ttiC7xtQn8L+044BKN++2eLoXSP/MGh1FNc8V8q+R/0lUpbE
 5MTkRriic3C+bxEMJVsJG6bOGsOURBvMoLoFM7mnrJtZyDk5xxQYjBLOn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16440739"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16440739"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 19:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16316165"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 19:25:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 19:25:12 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 19:25:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 19:25:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 19:25:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXP24KRZJo6BUlmJPCqHplP3TNZdly2d4JrwDqsvnxwTPpDhmBo9j9FwnMGkO5VdbzuUVcibpeMciWCJ1avXg83tgXTSfCOs+dwHTjSLDlfBYICg9SvhJbo8e8AooI+4gRFyUttzQsnxgs6MlQuPZarTEGOIhXS9imCwWaoLN7c5XjyQnup1RnZvUgtErxKmuHEeRwcWHmrTb1MVWlDdzS0joxgDejAFWSeUtS5QOaF9Lo71YmF7479TXO0J8FXBcm6Sl1q7zXSK0qdBMkJJfoeJC6Xk2ZNdldhg5kZTGHNObve6OspZJEhhnV4TVhZEDc92UECHN8s6Vsyy/d8aNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeiYzY58hcub+YUV37OQMRViVC0SmfITdbNLFAD2CDQ=;
 b=PQX2ph/ku4qmFADf+oJr5L+3DecHzatKVw599TKXFWZDoDIqY3JtOEQwziCLPuvbvBV2c1QmYOrg9QvD3kRjJ4pnsIB4fAcBDrgCa5lwwMEhf7dHQ1FsT/RiN4dWuBzVHtus+GSmSrdmCpOk91PKWDJG1efCXzHc/+QpL4tz9k5W6B8xF+S4qBKau+Kkn4GtonOy1FK2BrxAbdq/ALdPJl/oZSAKkxT6kCxIFj/9iS2qsAcEpHZWgIxkiX3nb7cwioSX1TDrpx/Owez2VTyV06QJTy4JUQns1vCDbO4HF19P0wIbRdf7QVukvAQsQS+PJLBRzkXdAarbuJ51KtWvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Wed, 13 Mar
 2024 02:25:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 02:25:10 +0000
Date: Tue, 12 Mar 2024 21:25:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe_tracer: Align fence output format in ftrace log
Message-ID: <h5xbgwymchvwhuzmdfxcwwnz4cckkwwo4dsob5pgpeisy5lxlf@jy6zbnzxo2dm>
References: <20240313014915.1400077-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240313014915.1400077-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df08b12-fbc9-4d15-cf1f-08dc4304ceaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFaQP9M6jogNZfCjpvqmbpVKh3q/CljtlrxO8PqKgcIp7324uBBhrYV+Z93dXf0vyT28WSMyvp57HGWsqs/96xGliX5Yh8ee/HfLo8901eBNKDRwcyMzyND1TlM8/FHC9ZUoWhgtYIeN+hoH1KiO3LKbqA/+HxcQAgrKLuGFI1P0FxCfbYImVKDrt7MiehLoOOXvVpU9BcJ9JNSXu9CcG6zjbMrn567VvXhVgB7p9aDUM+6GUDPQH0mIsvV5mDzBREpcWwNX/25hQbX7gudJKkKLVgm2vMo0v+no2Oqly/l0Wtc9qDGs1Guxzc/dhekBmPdY/r2L5AUu+yh+7Cp1bHrWb62RKn6T5tQ35We7miUwGV4pha5KJYjASc9+I5MnIv+kty07rgspcg53amimhoJf9fWW8z01Z6pW8hZKps97BptedLThJDRedUGzdJHe6Dv+S3D1ET17VB8wXuXkpCr9m0DlAKOZK62WcE/N+7wdiIr5eURGNvv/eL6YP3GLsmm9BRTEBulmZB71Hnl47yEMf6lteZ6pUpPZ8ejrR2meRV4oEV+6IcZ3M8qMbXJf3o/7P2TO+itwdgThVw5VJb002FU0lrS/+lsT8f8RIMoP+JP3hB40OXWIAT8BMtn4a6YYNYJwYMyQRy6N68cdaHn91efEg6UdnkWXcCXMriA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DDG2vFCcHX/tiEX+V54oZ/B8taq9lyUGS71K3bz0UHiBAiz7626rpEnIdhIx?=
 =?us-ascii?Q?++K7CDW4TFdueMj4HQEQNYJKEg51hNqD/DWSXOjUu7fULsq7fWSihuu8Vbwi?=
 =?us-ascii?Q?jzbjbtuEhEpu5WcHIUtlM+md2Y/ulJTEpn+hyAAClyQ+qLioedsV6lnuyULo?=
 =?us-ascii?Q?6WKHQKiEC/BpNiRe89N6dim1sHxMVfsSHY89UlUA5s7DpYzXFIr9SOzIdBO0?=
 =?us-ascii?Q?ZiuvUsXYgchwnUDZEUMHkty9/gF9g1CEtghCjV43rokFeKfLcf8qgJHh+uRJ?=
 =?us-ascii?Q?UbFYBKmPng4gZpL65T14PjYJyWaqIp8YvYQo5FIG4y543HemdGnFCayeza/n?=
 =?us-ascii?Q?N0m3HICQMRyFUUlIRQvuXZhWqpPv28fWNlauRtXBM7qys5qMSOSg9AqufER6?=
 =?us-ascii?Q?H3VNUkMH+0pP5eLywqPE4nP81ljP3wySS+poSl1gyLFqAYfs0aYQ63l40p6V?=
 =?us-ascii?Q?6DNymDVijZhoMvu56yPc1zAHFjlL7dQRnOH9/9GOL/Gk3kcf09XFbh1gMxMM?=
 =?us-ascii?Q?TeHAe1cspMG+b4eEKdVX+NILmcVBVgrYQ4un63StVilVIXN1RexRgpYh8/oF?=
 =?us-ascii?Q?hSWN3dAJr73ziFXPueid5V9s1LXu+5152KEzzluy6FbPhROb6PoaEqqNxKZl?=
 =?us-ascii?Q?XMtStQbL+Vc/2sAYQHiM6rlITY0hGOGE1+FzCtLqJiEIj8xu/yG3OqylEiTU?=
 =?us-ascii?Q?JMhxesgHHWeA7Dy1z1WspLuEKyWe4SsVoTJ3AFhvtVF82JdAAlNibaKvsbdW?=
 =?us-ascii?Q?1M8GGoEUV4pSr+UY/5yNJCmb3B/vkX6vkhRSmobV8pw1c5x025eJrUi80I9d?=
 =?us-ascii?Q?BytyNZIgPtZDfQAKJ1EzHZN/4hS90GjPWeFLd6HV1Ogd2JC9U7T+QzOg+dx7?=
 =?us-ascii?Q?75ge8Xxp4C5ffjdRbdKerIMLV9/YnI+7XwN23dNzb35+sKS9VVAvkHSFB9fL?=
 =?us-ascii?Q?8NWz2BIfUtU2qwV7yt7WDfQLf+tidP75WdZFlWcAReYa5iZb8EkdLkca82yl?=
 =?us-ascii?Q?bZW/7GKu2uvtOHYHO8GO+0HT+DCxcTmqqmOQYW3rUMjH55n6C846AecUV9Te?=
 =?us-ascii?Q?gdLsxrXwHLwyF9YKxNiy78wRZ3/z3TdHQavvCPZYv6gOrFzpgY7/pw/Q1GnU?=
 =?us-ascii?Q?7vaAyZsrCtQfofjr8SNTUnVQsHiytd5o6xnS2+1mvqj2OZbaJYfW0EzpV205?=
 =?us-ascii?Q?ia3w+M0hWY1SRGyXh2WgblwfcghIQxmtYyuiLMaQ/xDkUGNOtK7ZPZsOwE1/?=
 =?us-ascii?Q?oBmo5m1G9X4Eg4Nh4UyjqZquSAceEQta/fRQJ4WwkuhkOsF4hWKhfQXSg3i6?=
 =?us-ascii?Q?8gt6beddIw0We0O2/4BC7uOMxba3hqNzQmBze+LGdi3lpyvcH+7C84m64vtu?=
 =?us-ascii?Q?qw+ojowCAStKnDlvaZhD/9677C+tWTIh3GWD/9JvfrvB8XvQZbJ5hkIhe4Fv?=
 =?us-ascii?Q?3yVwmO9cpGVVsg62UkjNFxvgJ+Xx9walRxTsmNSq4MFjyERemBmcQ3kJU0Wc?=
 =?us-ascii?Q?P6/UmWJ4KQ2Ng/zky+NBlZIh/n7EXhVKmV/2Cj4jFfJhS2RCIGchpTchoQMf?=
 =?us-ascii?Q?bDDTfJ5G3PMuLjoWzCY1XaEZ7CYRnts3f1gvKRY8SNnpJWyfJDPqFloYXQXg?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df08b12-fbc9-4d15-cf1f-08dc4304ceaf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 02:25:10.7133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OZVKVy63Txi/Rsn/7DQ4HT7sHE77aTp0tKAUQaUyuJ7IeQFzaQsMrqICa1InFQ5xacSJo4UVAKJTkSBfk1VLHCwySyNbtjLeVxwf9uYLcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
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

On Wed, Mar 13, 2024 at 01:49:15AM +0000, Shuicheng Lin wrote:
>The fence print in xe_gt_tlb_invalidation_fence and xe_hw_fence
>is with "%p", change fence print in xe_sched_job to "%p" also.
>Add the "0x" prefix as the "%p" is with hex format.
>
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>

that's why we never use "Last, First" form when dealing with
git-send-email. Your Cc line is bogus:

	CC: Shuicheng Lin <shuicheng.lin@intel.com>, De, Marchi,  Lucas <lucas.demarchi@intel.com>

Lucas De Marchi
