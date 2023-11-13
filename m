Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA49C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 13:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B90510E376;
	Mon, 13 Nov 2023 13:47:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E469B10E376
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 13:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699883229; x=1731419229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jgRI4K1ngQH/s3mYnWKUqxqH1AIPn0NtJ3VjCeCfeVk=;
 b=Tr0NazaozIJqGGSCHcbEsu7dtNZAzsJ/Wo/vMyXRH+5LiyzXsK5ut5OI
 yKdBoPSLAw9Xyxqg8EEJak6Qmf0nQg1ivUDyE1MUzI6z6E7uFX5Hw5ODm
 /DRBD0jPaBuTB1bhvGVrawSy8tI5SPY5tFdjMN247F7cNxYc46LQU8AIR
 MuLgTlWb5ZHOvlU02Mui+x0Xh/ruTcJ7hBu7UXB+xeoNSB0bTJfKYkjzY
 o//a8RLYityuVCRZJTDWUmO5y5yrDKe1/b7iuOI7m57cTaXOIrytqoUR3
 /zlpPOP5Qzsbbb89baHt0ShRgamQvD3gstZPyAndCo7I0vXXB2J+VphsY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="11984086"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="11984086"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 05:47:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="12462656"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 05:47:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 05:47:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 05:47:07 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 05:47:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGkoFSnivJdqjbdpg7EgKLs6n0C+xdXgg9Y1vicvoQKRBxzBkpHuwPGea1JDQXUWypxvGiFFipnFpK79UeuV4rCxMDAjVbu+XuTz2Jik10/xlGWvdkali+LPY5cSWqKzkdfARNCJWVXEyhcq+1Vutld7JE3MH5qBCwbBDvZKL86O2ZQJm39gnFl1vr8C+onubivs3Dvm7i0h8R4cXrm+jJFd1JomDNVWdiC2si+KnspRACLxA20Ec9C0Gr34MHEZ9HwPazlesCwIw326u+B6vO5BEyVa2ZhLnB7MD2RU0k4raD16ojP5wn12S0/j4a+/pcfeLNhGephI3UMCvn1v2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/hJKXu4vdpEiDLyA5pHY5Sn55Bjtxk9GUCwlQ1aHbA=;
 b=cjobyQfUMeUlpVSWvdEhh4qqKRoCFy7XFx8zpuqG1W/25OgkxQZkG5NMG3HfBc2mxUvJYnyyzGYHf1C49vmtd+kEoJ0Q/CTx+3vZgmLS8iGJgeQZan77/ZCDhIEjP8RDsLXmXn9qSV/LrkjU5W74PozGMS95EYQSSzWiz2tpwy5HkCpQ+17gNIVU3R/4tbVLrsnfQbshTYlII6UySj+6FvzxhLheJJdunHnB+bGOsNqGAazAnI+cG6M+a6xw1MVmlni4donswPpSUKUFYufmeLj4cnlZIC5yPPbQaZxaY+vuHmrDRTXqjdt7iQcSUbqM8uvwpPqV/jkSVIF5zDr6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 13:47:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 13:47:05 +0000
Date: Mon, 13 Nov 2023 07:47:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <iqnwce72yngqs4uequb7s67q7aoesyxa2xcgxo6ungprj64b5u@ha5cyqpgq6oa>
References: <20231109175132.3084142-1-lucas.demarchi@intel.com>
 <20231109175132.3084142-3-lucas.demarchi@intel.com>
 <87v8a6ufyn.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87v8a6ufyn.fsf@intel.com>
X-ClientProxiedBy: BYAPR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:40::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: f7107726-7c4f-4ebc-c187-08dbe44f05f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ncYEX/phv0RSlys+L1mLNhe6yED9FljSmy3F3T2lL1BN/C86ttBqlnUxvmB+acw7k/uQRb9+8QXeEj+yGNvzalb2//4XxjyCAYuqdmNLvuaeRjgUqmmtEETDNfIBnV4o+bTuWGXU9+BoKrSTY5z7U9IhdK8bJpvOOn75GakLXP9hsWE2ukDkCfJ6QGXV1QCqwEpbAwmHfwvzOtMlREmu8ZLNZAf8XsFrQURRJI/z9qzs/tEqvaKGWCn6rptNLlKb27Hp22f1giFnSXNhWjxLRzYVyV8iecBGyl93QzgEXHcX5TXOfoXR9DCK27nyiSbYSOWhYZzllQg7uYltUpXmsNZA8/NBNsiR+4cOYhE5OWUVojmL2QkXx3LjO0S+iQ8ITsP0FJ7swmXlIuQVX8iGj/t0VSw3xE/1+CBPVvDuX1oQIQELL/evPlJdZ6httvoG7aAy6VLzCRq7hffR8LU16ogJ+v3GobDQb1ScAtlPv7ByTChQLbyQd6kGbJf+Wl8g2W98o6p2h8Q0fzF2D+F5DsBNP6RUzG/FEircrFQ0qjOv7qFqP6HB0cmVzzmYQnc7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(26005)(6506007)(33716001)(9686003)(6512007)(83380400001)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(6486002)(478600001)(316002)(6916009)(66476007)(66556008)(66946007)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ir4ZbAayx7dQW9S5tBKGhBHRVgwRkHhPAeKDpq6Chzyz8QHb6L4O74Akfdp?=
 =?us-ascii?Q?qORda7CK0+p965nN1jIDeM3iWKbe4ligHUWhVKkrATeBHn1TC2FiqlZNOvUU?=
 =?us-ascii?Q?5QnE6CT+lOj7w3gv/UIw0gLz61tUcmwT8z47h1aH++SQ6JDHtejuFKf4zHjt?=
 =?us-ascii?Q?2jgwaEaElcBEhyEGHriYdpeOIamHgf8QAD6SnPN2CO4faTaAyEnavE0poMTN?=
 =?us-ascii?Q?7NAtmraIKHyojz8UsMQjJ6i7vobXGBWSXcAFbnN4flO6HTqEL/cs0DlFszJn?=
 =?us-ascii?Q?ITC45u3CHaxB9xOoo5ydj3BlIDR8BZcGYVGU2G8xYxDMO/ReesEWxp68tYYY?=
 =?us-ascii?Q?472gXeq6vsuR7KGbl47Bk9XGCn75/QlHoWMxspbpPDXjal1MWtib4/BCvtkK?=
 =?us-ascii?Q?QwWzfe+uLLdL4nBJGaelJ0NvhJUBQFsV3v2unUDcieFy3i6bZZgrrb1DCiLo?=
 =?us-ascii?Q?EjBLus6gH7IMznxOpDKZe0qxfw44KBdfFFKQ4a/6NdhzgIgdiStOHyD9Gvxc?=
 =?us-ascii?Q?Du7A5jliL6UhklAH4SqN4CcpqQYvS1g/7rQSCagYeckMwd4xakK8LAQH0fNC?=
 =?us-ascii?Q?8HiSz6qUagQxsASBjHCXOecraEJIjsewN2DG6nG29zNRrgoTmezcujVy6sIS?=
 =?us-ascii?Q?AK8GP87PgmyzJN/a5gJ2Gw9g4gCLAOSYjcgYAMVF/f8L7uHlDvIVpIhUyR3r?=
 =?us-ascii?Q?tkyVmMAl3m4G5/x8YT5G5g2wU96f9SEIZa4zhL5k8NYnxBbww7HwGctbmIHP?=
 =?us-ascii?Q?B+vmxYO6RyNYmk226GJrQlrt2OkRJkheKFhohXBhQq61aJXWLPjOAfBqKhzG?=
 =?us-ascii?Q?Ql3oihIjVdz6SmzqN27mI8lygR/R9nvaaSYxEjJm6pzZJ8UK18dCcOTQGFdM?=
 =?us-ascii?Q?b+QpzbEJ/1a6P8amwuYYdNt/x8nzzAqfpl95v0Eq/ixSw2EROdBjlCdMCn82?=
 =?us-ascii?Q?zJU8i3ZK6CxFoiQMx9G/XxBvHxEX5DAsgIr9X6gO0lXn6tOJEyirAX7PxfxG?=
 =?us-ascii?Q?7ExbCeFnklqDr6yBlYe43KXA6/DUIGmSG03bhloXHZtehvQtYwnNdx8lhVkc?=
 =?us-ascii?Q?gmVKfOjwltrA2CtgoAgCV50ogmsZBQLNTSffPUwr0WG8jJqeNbmQ5BNd14nm?=
 =?us-ascii?Q?djWeKiwmYOf7kgukl1VlcjON9B3GCqPjB2a80yXwHtaKi3+Rl9SxUBItzsW3?=
 =?us-ascii?Q?BZ48blKqirrpc+kwDe4MjpMzWPMXd2BsaOcOC6WZ4LXWHL/mg4QqW5e7IjCT?=
 =?us-ascii?Q?XABZVxJgPzfghXSf4Nno9W8FIl/E0qoJ2NYHjo8c9JPbe1Da/YbA+xniwHM7?=
 =?us-ascii?Q?9wwMDr5sOiCSgxVilB0s7uQCuz3Rxa84lZBu2q8O3cnaz6TRlw0S8pTRZn68?=
 =?us-ascii?Q?pTp/7B+Ydyx8boeUksK+tG/vqofNSV1HYuHMmtO5xT1v3I/OhO6pErTE/JEI?=
 =?us-ascii?Q?F8NZuPWwTzQcquCSy5+zOlm3EsnWfE0YuYbogHtd7dH430PEPbAkhEncFx/S?=
 =?us-ascii?Q?bz0XTwJEgU5U+GhZyLaqEZkGHoQgk172EB7/enPrH3o7pDwl0cI0ZMb0ViwS?=
 =?us-ascii?Q?jBI44Im7wLUWctfcO7BbW9FBqVQaflKLAJAdjafFiA4F3iyxvtVAi71JVuxX?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7107726-7c4f-4ebc-c187-08dbe44f05f9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:47:05.8634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UrrOQHdm6Bm5jQJ0zDjry0JfZBH0oFqtQBZPfwF+NKd8BW8NjSQbrpZ0itSiA2NI3RlLf1EJ4eKuhcBfKT22ZXbOJw1SUj5JyEZaJPharU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fix build with KUNIT=m
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 12:04:32PM +0200, Jani Nikula wrote:
>On Thu, 09 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Due to the current integration between "live" xe kunit tests and kunit,
>> it's not possible to have a build with the following combination:
>>
>> 	CONFIG_DRM_XE=y
>> 	CONFIG_KUNIT=m
>>
>> ... even if kconfig doesn't block it. The reason for the failure is that
>> some compilation units are pulled in xe.ko:
>>
>> 	drivers/gpu/drm/xe/xe_bo.c:#include "tests/xe_bo.c"
>> 	drivers/gpu/drm/xe/xe_dma_buf.c:#include "tests/xe_dma_buf.c"
>> 	drivers/gpu/drm/xe/xe_migrate.c:#include "tests/xe_migrate.c"
>> 	drivers/gpu/drm/xe/xe_pci.c:#include "tests/xe_pci.c"
>>
>> Those files shouldn't use symbols from kunit, which should be reserved
>> to the tests/*_test.c files. Detangling this dependency doesn't seem
>> very straightforward, so fix the immediate issue instructing kconfig to
>> block the problematic configuration.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 2fa2d6dacb96..5b3da06e7ba3 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -1,7 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config DRM_XE
>>  	tristate "Intel Xe Graphics"
>> -	depends on DRM && PCI && MMU
>> +	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
>
>What do plain m and y mean here?

m == this config set to m
y == this config set to y

Lucas De Marchi

>
>BR,
>Jani.
>
>>  	select INTERVAL_TREE
>>  	# we need shmfs for the swappable backing store, and in particular
>>  	# the shmem_readpage() which depends upon tmpfs
>
>-- 
>Jani Nikula, Intel
