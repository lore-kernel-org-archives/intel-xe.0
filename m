Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48DEC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 05:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECDB10E13B;
	Thu,  8 Feb 2024 05:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEzJqLAN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C88C10E13B
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 Feb 2024 05:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707371640; x=1738907640;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rjufsy6T7oH3ls755Q7XSumHRwc4B/G3nr+VJvrneoM=;
 b=SEzJqLANtcz9hXGeJ0gkv+xfT6VUSJ8VYzyysuKYe0a7CFkb7k3HHYEx
 Hw3aHlr56ehrY8xDappn89qVmWCbD8wNLrk+hLCtyKCsRkO5lojODW2aJ
 nrDxmw26Q07sTEcEOGfPSaA3frRtphMqNK9ZkkD+G+2pg+IioC7R2pZ2I
 308R/abwL/EkFS5bTJ/q1hFOav4kaWhLhbD3GY1/Lq3ksLJr59PNXPPRu
 FM179ts9Rs69cEG1Ed9BPnLMZOWwTciKcU9agw1PZjiFAsvRtiQDVsWYM
 QXJoclVWWgGXzwAVgP4udLb0LqIgsWy2Z0BeJ6JmKuEGOIYYIkh2ZjhKh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4933116"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="4933116"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 21:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6329567"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 21:53:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 21:53:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 21:53:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 21:53:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXmKvfLAEMc9EmSaCxXhhjINt3u7hl6aUODR8aHdq4o+1PW18cJHWRVUFQ6YPnh2S+067nNrSz+5/q4TMHzPnh6BTVBkqoHwyRtDO838WXxouoh5zJ2RKmhSgWu++PGicId1p4MEj4yvxTAb27RnYBYzaKIuVKYBDBZeers0jnulQEKD8I5kO7+/hHXIU8t0i+k15unuSncRIRehZ/se9MRRySXb2b125BKKACeL/S5kQFcpZcSMB5UH3zuBzT1dEH7PQCNivVnyWnabFyMPS/RRaGd7JMutgzaiPGKN/nujb/mpVQV/fxeUxu/oHIcRkcIpZkd6j+bh8QPE5ha7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMT3mgwYxJAnXp1wbQU1Dl3Sgi8ISCkspO+VgTkpu/M=;
 b=FFO6Opo/3Vii8dQ5+JdgddLK4KhJd9TlaMypawaX46FAPJ0woUlIEdgXpzUenRTU1b9yc1hfp7TzA8mFzKXmtsHW1j5tiBA8fwO1+nrO50XGHZ49MpTxnCsTQgdD2iJrDHujaie16/t0gHbNWh6ciKxO5l7FuOosnJUzxyq5PR/6akG472xmT8CXHSfDB74wrDPMr6JRtdOPrQ1tRwGEgjaxwcOci1Ug0AZ3uJM95m3izfOHAOvVzpHnpQP+bty7dVk9XncJvrAztV+SPWEGefyIDaXZKzfBjmUl6xIKj/QdVMEeeJhAo0y+CPeJpgwS0aSwa2T1HdjDM/oL9MrPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 05:53:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 05:53:55 +0000
Date: Wed, 7 Feb 2024 23:53:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: Re: [PATCH 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Message-ID: <3km3ide74fjkxkbmpfwf3hxqhjom5vkqhbabgraqr4qamdwhdv@6k7s7w5nugme>
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
 <20240206201153.2773996-2-John.C.Harrison@Intel.com>
 <4tyazvyh5rc42ethjxv7lotzdkzs7gbthzen2j7uyxfo32f6lf@ialkyb6nybvn>
 <374fb67f-e199-4bd3-9fa9-4fcf2eda94cc@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <374fb67f-e199-4bd3-9fa9-4fcf2eda94cc@intel.com>
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM8PR11MB5640:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ad39b2-02d1-48fa-eda9-08dc286a55ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +cnAoerygYJQyEDNx+TXGL7wcFFrx+H+r4DRSg4Eo9TZEHcrtqPbGSit25OzwZs+J2kDX2K7K/XHkxZcfZqnrlURilseOKZGV3bZmvSqIYOAKOSgIeezrr+DDxinxK4mnBBWE1EQi5jpyEuGskAezilj4d9r7/NpuMSJetl8iEFwQcAxEse9pjEBf/J5LV5T0bmTHDbbVTrrygqBHHPj0aNC6sXPl7u6xD5aoOUtJ4cvaYRYDwvXq7xFIx2+x7bsHvwX1YOtORuTM948uJrNOa5pLAphlhldnSHecz7MCr1q2P9Im8H6Gwgit+Jxc+HxiygTQxTuWh3QHQmCfONhT8Oc9kwKMOAvm16bhqAKRL3u8dyxP6YqwPsW2mkyWIcMHKiwdSSYA3o+Pg9kpzhz5Kz9QgkugSuv3WT6CEDconQIXLaAA/L4jy20CBrnhTHiJ+Qy1atOxTt4Azbj7NlMI1cZsRaTQ0JUbQCW9OO5MVn4OnrhTzomUU53kMq8J96IuaCslc1SDCOiGxFR9jzBEMIUMKFFfATA9JhJpKC7Bvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(86362001)(41300700001)(66946007)(8936002)(82960400001)(316002)(6862004)(8676002)(6636002)(66476007)(66556008)(38100700002)(83380400001)(33716001)(26005)(6512007)(5660300002)(9686003)(4326008)(2906002)(6506007)(478600001)(966005)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BRfF1FY3NaskfXO+D4sYW87xo8LrRjwiCoGNfWTmzyWDnD/9MvjytJsuvB?=
 =?iso-8859-1?Q?DjEUkvFz9EgiVNQ2v4x5mlGvHOHx6B8GwpV5fyEZita6AAe/5aL74oaXhS?=
 =?iso-8859-1?Q?jqhudgKoZ3AQz0dw+fn76dn4Xv4IBRp0jxoLbthq7Q+ycvc+Lr1VQhz/3i?=
 =?iso-8859-1?Q?KOZ8ZPgjKvJfYp1Hn87qjWRZQQaPitydM8SUjfJ0D/Od/hZ/UuszJBbUoi?=
 =?iso-8859-1?Q?qs7+SE4u3kKoYenx0Ook6X1Qgru1VpGyZkmZD8Kxcfoo0FrxAG1hKTWSo2?=
 =?iso-8859-1?Q?iRAK5f4qs2GRnImSCq9fP49M3AqLGJM3YXoZDVIGsmIoqW+gZj1pLntU5Q?=
 =?iso-8859-1?Q?35mZOrhqEN7oTIh3nk0MEtzy5ThGmrQCAHML3KZU/qiseG/NUcQXM7cfS6?=
 =?iso-8859-1?Q?Q75K9FtVbuHIU6C8HdOsRo8wgKjsIr/l8gP1Mode+cMJ8YTBMhyvdBpqWj?=
 =?iso-8859-1?Q?rSg8PRpYOBxeqYFea3h4NrgBVeL3mK8lOmWCSEarHClp6T34INswnKFkjO?=
 =?iso-8859-1?Q?Z8nCc19RkUGtFBHLjhbasi7t8841ADIIrtxDLey7SmdNHrmdCo1QBfSqn+?=
 =?iso-8859-1?Q?jVQWpH8m7gEN3QNliuKSC4ThXDbwoRiPATKV2U6Z9+eBoSrKvKmimyjhii?=
 =?iso-8859-1?Q?vx1XcO8EaKcqq5xcC+JBxMKCuFqwDoVpFFsmQAc3RaBdQt/24JmLAixssi?=
 =?iso-8859-1?Q?7Nrb+s+7RmijXW1miinnV84zpiXq8zq5SDbHSF2IQabur9spkVgERdjV0W?=
 =?iso-8859-1?Q?ulFmKUjybvxEEA5ZBmJdRCcNTvJrwIdSASkZ9K/jj13l+K89WBAsdZ58c7?=
 =?iso-8859-1?Q?+FojlWELdIZmfTFYaTZA5K9ppg/RZClADIcH5T8k6TfBpS918n/ECZIX9D?=
 =?iso-8859-1?Q?381gdaLwOXU6S2y8Wbtk7rywQrQyYbltUUWkbzJY5/WSObn/FxVjIm5xbh?=
 =?iso-8859-1?Q?yrkIt9ayRkn6PjBueSz4KHs9rZPKD6OBjB8PwY0GSp8MFRvSssbkfoZPRo?=
 =?iso-8859-1?Q?XpTp4skYYtLx1BeALyhPy3CA6K8AS7rEQCjv4o3yiqdwGZ079vhSZfJTlT?=
 =?iso-8859-1?Q?2hhr6XN7Jc0oKdlVPKqE8l/0LtWmE7cR0Y81FbLPEfz0dPjkjp2a/u8RwA?=
 =?iso-8859-1?Q?UHHbBgyYN4O4YC8bKuUBxXIZABvJLrxNzSSi2ishCdPbM7PuKNh9Y2PqpI?=
 =?iso-8859-1?Q?UOQuUcfwDYsWyLxldALHa1//RgvqU59nPflOhgPwrhkumDCpHQwMsSluL8?=
 =?iso-8859-1?Q?mQiKz6F6gb0GEKEGkoLIKruh7uv5Uk3tWQRJVSktBU6AtFx+JqZPnwlTwB?=
 =?iso-8859-1?Q?7rq+B2FKLLIFJpkNt721mSHrsKtrSfXqByzFgtRFibNkjf3EONqyeGxATh?=
 =?iso-8859-1?Q?RuatbnhWi9ybEEFxYVd6asn9oUs2QpGBn/8Bhm0XyNzqHnNdecX62WPd4A?=
 =?iso-8859-1?Q?gFs0hcqruxmgvvzBNmHSU4+Ehso2xIf3TuC81v/COF8cyGTWTXUA3GR1pJ?=
 =?iso-8859-1?Q?DjVQX4r6Bv+b/oyz5QSjtBcKms6uxeNiUKN3BrQjny46ILU09c5Qpe7puW?=
 =?iso-8859-1?Q?DiHgIDmmFm2A0tK1dphFmEZowl2+9p7rYSPzbKQQrMUtqlmN0dL7I6Prx4?=
 =?iso-8859-1?Q?C5gigCTVGRDAg4h5D2x04MJ3lXilP90iPSE4cUfCD6V/5P7RqMT95yrg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ad39b2-02d1-48fa-eda9-08dc286a55ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 05:53:55.0484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYq4xs8jVX4QzdSI0uOfipHzS1whw9MD/6o8exocseaW6nfUZAH8luRr7yknei0HsACyA0PUNfY506a8OfDbxzxJFIMLn1eMew7sqb58RiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5640
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

On Tue, Feb 06, 2024 at 05:26:28PM -0800, John Harrison wrote:
>On 2/6/2024 13:26, Lucas De Marchi wrote:
>>On Tue, Feb 06, 2024 at 12:11:50PM -0800, John.C.Harrison@Intel.com 
>>wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>Other driver code beyond the sysfs interface wants to know about
>>>throttling. So move the query function out of sysfs.
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_gt_freq.c           | 18 +++++++++++--
>>>drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
>>>drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
>>>3 files changed, 30 insertions(+), 23 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>>>b/drivers/gpu/drm/xe/xe_gt_freq.c
>>>index e5b0f4ecdbe8..4cf7772c387f 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_freq.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>>>@@ -3,15 +3,17 @@
>>> * Copyright © 2023 Intel Corporation
>>> */
>>>
>>>-#include "xe_gt_freq.h"
>>>-
>>
>>foo.c should always include foo.h as the first thing.
>My understanding is that local header files must be includable in any 
>order and therefore should always be kept sorted alphabetically. Also 

the origin of "just sort the headers alphabetically" also has another
requirement: the compilation unit using that header includes it first.
Otherwise you are not guaranteeing the headers are self-contained and
can be included in any order.... you are just guaranteeing they can be
include in alphabetical order. Or better, in the specific sequence
available by compilation units including it.

i915 end up including the hdrtest some time ago to overcome the problem
of not adhering to a convention like that. xe is in fact using that
check (it's the only other module in the kernel), so it is redundant.
The hdrtest is nice because some people don't follow the
rules/conventions (probably because they are not aware of such), but
it's also nice not needing it and maintain consistency.

We are not very consistent, but the majority of xe still uses that:
$ git grep -l 'include "xe_.*h"' drivers/gpu/drm/xe/xe_*.c | \
	while read f; do \
		h=$(basename $f); h=${h/.c/}\\.h; \
		git grep -n "#include.*$h" $f; \
	done | wc -l
88

Considering the SPDX at the beginning has the same number of lines,
which is true in 99% of the code:

$ git grep -l 'include "xe_.*h"' drivers/gpu/drm/xe/xe_*.c | \
	while read f; do \
		h=$(basename $f); \
		h=${h/.c/}\\.h; \
		git grep -n "#include.*$h" $f; \
	done | grep :6 | wc -l
63


I had to double check online where that came from originally (since I
only memorized the reason for it) and I think it's from Google style
guide and that spread over time through lints like cpplint,
clang-format, etc. See here a more extensive explanation:
https://google.github.io/styleguide/cppguide.html#Names_and_Order_of_Includes

My main problem with this when I saw was because it was moved, in the
middle of a unrelated changes.

>that system includes always come first and local includes after 
>otherwise you risk doing bad things to the system headers if you have 
>something dodgy in your local include.
>
>>
>>>#include <linux/kobject.h>
>>>#include <linux/sysfs.h>
>>>
>>>#include <drm/drm_managed.h>
>>>#include <drm/drm_print.h>
>>>
>>>+#include "regs/xe_gt_regs.h"
>>>#include "xe_device_types.h"
>>>+#include "xe_mmio.h"
>>>+#include "xe_gt.h"
>>>+#include "xe_gt_freq.h"
>>>#include "xe_gt_sysfs.h"
>>>#include "xe_gt_throttle_sysfs.h"
>>>#include "xe_guc_pc.h"
>>>@@ -220,3 +222,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
>>>
>>>    xe_gt_throttle_sysfs_init(gt);
>>>}
>>>+
>>>+u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
>>
>>
>>any function available to other compilation units should keep the prefix
>>
>>xe_gt_freq.c ->  xe_gt_freq_XXXXXXXX()
>>
>>>+{
>>>+    u32 reg;
>>
>>this gives the impression you are getting the register offset, not its
>>value.
>Not my code, I just moved it from the sysfs file to the generic file. 

fair enough

>I was assuming that the code itself was already reviewed and perfect 

great joke on perfect code ;)

>and should not be modified.
>
>>
>>
>>>+
>>>+    if (xe_gt_is_media_type(gt))
>>>+        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>>>+    else
>>>+        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>>>+
>>>+    return reg;
>>
>>does it make sense to share the function to read a register, but then
>>only return the raw value? What if the register change in the next
>>platform or what you are reading changes?
>
>For the sake of a debug print, I didn't feel like it is worth 
>exporting accessor functions for every single field within the 
>register. The fields are pretty meaningless to an end user and are 
>only of use when the user logs a bug report and someone here is trying 
>to work out what happened. At which point, the developer can look up 
>the register meaning in the specs for the appropriate platform.

It seems a very raw interface to other compilation units that won't
survive many platforms down the road. However I don't have a better
suggestion now, so.... ok

Lucas De Marchi

>
>John.
>
>
>>
>>Lucas De Marchi
>>
>>>+}
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h 
>>>b/drivers/gpu/drm/xe/xe_gt_freq.h
>>>index f3fe3c90491a..89be518b4967 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_freq.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>>>@@ -6,8 +6,12 @@
>>>#ifndef _XE_GT_FREQ_H_
>>>#define _XE_GT_FREQ_H_
>>>
>>>+#include <linux/types.h>
>>>+
>>>struct xe_gt;
>>>
>>>void xe_gt_freq_init(struct xe_gt *gt);
>>>
>>>+u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
>>>+
>>>#endif
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c 
>>>b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>index 63d640591a52..89d9f89962ad 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>>@@ -8,6 +8,7 @@
>>>#include <regs/xe_gt_regs.h>
>>>#include "xe_device.h"
>>>#include "xe_gt.h"
>>>+#include "xe_gt_freq.h"
>>>#include "xe_gt_sysfs.h"
>>>#include "xe_gt_throttle_sysfs.h"
>>>#include "xe_mmio.h"
>>>@@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
>>>    return kobj_to_gt(dev->kobj.parent);
>>>}
>>>
>>>-static u32 read_perf_limit_reasons(struct xe_gt *gt)
>>>-{
>>>-    u32 reg;
>>>-
>>>-    if (xe_gt_is_media_type(gt))
>>>-        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>>>-    else
>>>-        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>>>-
>>>-    return reg;
>>>-}
>>>-
>>>static u32 read_status(struct xe_gt *gt)
>>>{
>>>-    u32 status = read_perf_limit_reasons(gt) & 
>>>GT0_PERF_LIMIT_REASONS_MASK;
>>>+    u32 status = xe_read_perf_limit_reasons(gt) & 
>>>GT0_PERF_LIMIT_REASONS_MASK;
>>>
>>>    return status;
>>>}
>>>
>>>static u32 read_reason_pl1(struct xe_gt *gt)
>>>{
>>>-    u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>>+    u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>>>
>>>    return pl1;
>>>}
>>>
>>>static u32 read_reason_pl2(struct xe_gt *gt)
>>>{
>>>-    u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>>+    u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>>>
>>>    return pl2;
>>>}
>>>
>>>static u32 read_reason_pl4(struct xe_gt *gt)
>>>{
>>>-    u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>>+    u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>>>
>>>    return pl4;
>>>}
>>>
>>>static u32 read_reason_thermal(struct xe_gt *gt)
>>>{
>>>-    u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>>+    u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>>>
>>>    return thermal;
>>>}
>>>
>>>static u32 read_reason_prochot(struct xe_gt *gt)
>>>{
>>>-    u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>>+    u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
>>>
>>>    return prochot;
>>>}
>>>
>>>static u32 read_reason_ratl(struct xe_gt *gt)
>>>{
>>>-    u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>>>+    u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
>>>
>>>    return ratl;
>>>}
>>>
>>>static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>>>{
>>>-    u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>>>+    u32 thermalert = xe_read_perf_limit_reasons(gt) & 
>>>VR_THERMALERT_MASK;
>>>
>>>    return thermalert;
>>>}
>>>
>>>static u32 read_reason_vr_tdc(struct xe_gt *gt)
>>>{
>>>-    u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>>+    u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
>>>
>>>    return tdc;
>>>}
>>>-- 
>>>2.43.0
>>>
>
