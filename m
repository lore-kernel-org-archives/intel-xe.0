Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3899EC76196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 03:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F69110E1D1;
	Fri,  7 Apr 2023 03:30:50 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E4810E1D1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 03:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680838248; x=1712374248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sdYT/M8V7TFenavV4noePSwHpTZb/X9ZVWqyD/PRcAM=;
 b=hW99V8qexs5f6bvBGmhmdBQEsfQIQi625y1VKNVaS9MU3Nn48zfHsXO1
 GZGItB8u/QmNsq1447FwodfqvtN8y8Z6w1mePlLi3WWbg3NjPLhQ2fzah
 MTdcawCrqJuMdyRERyb2L/FE0v2JNvSQb9GPs/8e7lY0Q/8j4RP+/Tx+J
 eSUAbXQRF6lPXl1trkJvHsu/Ff0wQ9xcnzMW8RVoI+D43nEDn6R527iBc
 ZSFiaBSD/KN5UFVxRyxQJ9UtgYJjh5hzOwK+UhDL6tcBoFHXO4blJnRl5
 pR58k3PMM3BDarRjk1UjRLqLvJkkZjTB+/bNJITlyMIM37eezMkSJTbII Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345565404"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="345565404"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 20:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="933458723"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="933458723"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2023 20:30:47 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 20:30:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 20:30:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 20:30:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug/4wzpNM8S3qUS29PkSXznGPY514ToUbcOnR1yFfCJnuZJ99ICBYdxxHCQbSsDT/9bcDW57k1ZgtU1VQX4ifbvWHW9pYdHDKIA6nuKjJk4rGmr4kcndh4i2868tmCGmw/WiEKFit+u3EbXX7sDFuvvV+Q6Z51oyjSUkc40JGQgdYauhJHpmdhe9rY8sJ6Wn/Bosh7fYkRqg+X4KUWbKPTBxkJZH3CkJqUiMZ+qF78d5ixP+1m4Qw8xCojjBI8gBMPkxkOJf8/wc1z8onLGkVZM0/XTr6AoYQLHyRkYW8vO3l38oqMEumE4fun+z/YfWhe09TeF27Gv9uJTJlDuNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6Ym7EgF0uyZarPA0oVBDjrHVnVzVZ6Bmb+A+h+ucNM=;
 b=cwRdrSVbzHeXVMTiEKIvmn+hky+NPAMjDbgyHy1Xj7qZWOJdgLNf/1IshRSaXpL9hjnaVTMQJe3E2lMYO3lOlup5ub+x21KKlp6Fq2NPL6OrFUBthjuhW4ZBhIWgMqvF+M6C6HBd3HDRmoYyEtzBEJmktwcPn4URHDi8Xkt2masE1PiuMgFoIOSVGJKvXgYrbQOQ7rizP+PJcZmeitLtJPqNG71tr5Jfc0qSPa5OkEaD7kyf3T+wVwb/2p7JKZE8KZ2B32/Iv+DhP4y1tz1TRDzKbye+MvV4yV7hCQyyvl45THGuRwZ8buWZAjA86PkL65uYl3kPsSHk+S6uWwyb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB4805.namprd11.prod.outlook.com (2603:10b6:510:32::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 03:30:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 03:30:44 +0000
Date: Thu, 6 Apr 2023 20:30:37 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZC+OXZ27yf0RsU3A@nvishwa1-DESK>
References: <20230406204841.18774-1-niranjana.vishwanathapura@intel.com>
 <20230406212801.hwbvrycttj6eqgmb@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230406212801.hwbvrycttj6eqgmb@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB4805:EE_
X-MS-Office365-Filtering-Correlation-Id: fda886e4-cf2a-44d5-9d7c-08db37187878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xSKl3q8KoqhF5wmpnMEz9Mt5TJGwIetLnpcd21e001Vo9n7zXQbFW86vD8gfazoKx5qtltsQaqAuFD90zf4pl2NkrnbGdCh8FK+q5au5QwOmEbYvfv1QQ7OeYyHwlq7M+lKPYoOJXM0m76el/w3jpVMuaDYE5sd5iz1p3SjTdwla8HWVl5typ2QUmTHVg5kfDsQm8GNQ+2rqc+vcuNbhGfdB3/hWO004Y35VS6WCetymTE9ZD3I5P5lNIxv60A9l33lJxIMBqq7xL0QwOflzwfYmohJhX/kmGHXd/tRbIgDQGkUVt1QIuCdg1LXNy+rsp1q0Q2orQLnEKKQ6ZEsZR1x0LTZ2J3vmbQ3pxVlKWR/2H74h9wBREC69W5HxTzcSXIKjtNqYrELIgY0OivK9KgGgX5ZHaxMgS/CDVIV/ykjuu2sUR8AJ5kwRaT2TA0hdBo6d2rNzQzsvO1yQc1kTR8DHs2RaLKfth35+ZlVaoAF+oL9f1Se0Wh1aEmXsDHAJWOZnmd3Uu8HwAILmEm0ByJ+r6rtuQ5272TUm/WffVE1i+03LIXvF7Z/7hpXwvbdn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(86362001)(2906002)(33716001)(83380400001)(6486002)(6506007)(26005)(6666004)(9686003)(6512007)(66476007)(8676002)(66556008)(66946007)(4326008)(186003)(478600001)(6636002)(38100700002)(41300700001)(82960400001)(316002)(5660300002)(44832011)(8936002)(6862004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pyEixynDtfddti13zCqz+WyTIGgIODDPcI5SIqQkpycMXA8ftrNmWIntnH3j?=
 =?us-ascii?Q?GR/Rg1o4bErHu44wMnq2C//13hdk1dkRjRjWDewCsVOEQHQNiXvwwVd31T0D?=
 =?us-ascii?Q?ss+tyCmQbkCjIXOtFhWZ3u7tcBrRzKeuXKAaE7FdScCRbh4DVuyKd+/ZDMLh?=
 =?us-ascii?Q?BsaL7aKtkrPbM+s0lUhK2br+9LaResh1dgSMKVVFbAdh1HHt8156TV9CnyXk?=
 =?us-ascii?Q?0SbU77MJjmZzfmJED4zsYe/Qdl9Cp6UhzZS4HCtXOjiJc68WrQBrB+3aJnV2?=
 =?us-ascii?Q?UolSErNkkhj7qYjpnuCZsvc6FR4rQRDthqUnck/LagfV2wNa9abiSE+eU0Qx?=
 =?us-ascii?Q?ToklMZAMhH66yMT6scNb+0HizLn+n3VPcDX8FGC/IDShyRPRODR9OrUidO5M?=
 =?us-ascii?Q?9L1ju0DX64nPIpxSlSFqfU4L8Pj/cQzkSJaSsnx9lbACQHAgwO9p/2wkShle?=
 =?us-ascii?Q?icYpOJLng5DkMQJvq/w7vJ3/6PTaqsGdygwsXj6VMPp9+vn6c8W+AIl9/rqZ?=
 =?us-ascii?Q?irWt5LwsUKQyDPt4WEypxSgYJONlA+ZkSuHkz+TFNKyOABu0Xx47yf/xjpsn?=
 =?us-ascii?Q?WkgovkS/erkEgEL7yH5VNGILNw4/x4dbCWJKaVJohTg/VoZXL6MPeNfpoRhN?=
 =?us-ascii?Q?yK8re8fy1sv8iIRLtmd1VAaKZzPaVC0P/lmL6jSPkTx2CzaLywNUUdxrAgwh?=
 =?us-ascii?Q?9DZPxEDpK2L0T3ddq3aiKWpPIktKZxDE6p0YVGGIWiUh/yi1Uunq5poSKXpQ?=
 =?us-ascii?Q?gJTh1PsxM/w7++5OEWO5rtEDL7dhJnfoo2Sl0UiCAU0RQwh6sKcwtaFoEM7G?=
 =?us-ascii?Q?30eH6inowQxt7cxrfmG1nv9o5XlGC1NXOyFi6B3uBv1oT2e6C15pvPxKvYxf?=
 =?us-ascii?Q?oDL5dhoRBmKHWU8Yeg9kzNUa/6WLIoVWlBWt6a4WJr4oCCPFyOiyeTtNaBO5?=
 =?us-ascii?Q?l14DwMGmXDNRlLeo2DK5ZTvgqyjGI+2EMNjQraHB6l4pwWJXg0zu+n6Yxheg?=
 =?us-ascii?Q?6jOIMcvzUUut96fchLOEeX552EgQonT4IzJwD4Ruos1JchfB806+pBCXlltZ?=
 =?us-ascii?Q?s8b8bFJEgqk3n8j4Vdcz0L3l4IgqyeuWlTnvX99v0+RKdwse8R/0c0tzG6lc?=
 =?us-ascii?Q?hz08xaJ2AS0GqmQfYQ3XMaebt+b4bqLCj5S7a76qrn2XdwynoI87fyT8IYiL?=
 =?us-ascii?Q?yO/zajRZgEPoaZnMLv2Xys0GMtR8AM9q3gPPrNDhajA8MTXiIsSFYjK3g5NR?=
 =?us-ascii?Q?GJJvXfGNG1QgsS1BJUd83lt5FyDc7EujSqyAFFLNO5fdB7DHRaoCrYCjpVWh?=
 =?us-ascii?Q?AS8tLkfSnI5RflAIfTFAMUv1pQpNeXZf+1xvqjVXhEByNl/7+BuXW9Tkqn2i?=
 =?us-ascii?Q?BFFPYxMFz8vjywK9fWEid1herQ8ejqjNjxTs6npvatxa85p4zqRUZRAjw83P?=
 =?us-ascii?Q?4p1jR242xoz3XSSfrDiL4/HFyDyEidr655xl7JGXkWwr8W/i83ZalCi1VIDH?=
 =?us-ascii?Q?MDPDVN7m8RjCrMFE5iUCS2D5PXmI8nC4VuN4wAS79uU9UZdVoaQATD2uSjKC?=
 =?us-ascii?Q?JM2TslfMdzWES1sq3NLVBAVHhDhP/fhyC66Xw4NYhW2Gc6m/7X9VZ0g+ktst?=
 =?us-ascii?Q?YJwhVzA53AIdH/3znzsQx+Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fda886e4-cf2a-44d5-9d7c-08db37187878
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 03:30:44.6488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uU5HyJqLzToRxkz1SN5xlrhP+NSRhe74pa8edB3L9uZFrJga4OCojkNyvsjvMUj2D9LLdxckIwN1coGGAVw/PFTvS4uyPA23yJBaZqHwjuGBwex+/gJN02LKl2n/1MCo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] drm/xe: Revert coalescing of GGTT
 invalidations
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

On Thu, Apr 06, 2023 at 02:28:01PM -0700, Lucas De Marchi wrote:
>On Thu, Apr 06, 2023 at 01:48:39PM -0700, Niranjana Vishwanathapura wrote:
>>Causing a bunch of hangs driver load and in user space.
>>https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/232
>>
>>Benefit is rather small too, so revert it to stablize the stack.
>
>For both patches:
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>I'm actually expecting these to be "squashed" in the original patch,
>i.e. that we will have a rebase removing them from the branch. If that
>is not the case, then you need a much better explanation in the commit
>itself rather than on the cover letter.
>

Thanks, done and applied.
Niranjana

>Lucas De Marchi
>
>>
>>Reverts below changes
>>drm/xe: Pad GGTT mapping with an extra page pointing to scratch
>>drm/xe: Coalesce GGTT invalidations
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>>Niranjana Vishwanathapura (2):
>> Revert "drm/xe: Pad GGTT mapping with an extra page pointing to
>>   scratch"
>> Revert "drm/xe: Coalesce GGTT invalidations"
>>
>>drivers/gpu/drm/xe/xe_bo.c         |  1 -
>>drivers/gpu/drm/xe/xe_bo.h         |  1 +
>>drivers/gpu/drm/xe/xe_bo_types.h   |  4 +---
>>drivers/gpu/drm/xe/xe_ggtt.c       | 35 +++++++-----------------------
>>drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
>>5 files changed, 10 insertions(+), 33 deletions(-)
>>
>>-- 
>>2.21.0.rc0.32.g243a4c7e27
>>
