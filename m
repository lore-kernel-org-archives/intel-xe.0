Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802B5C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 17:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA4710E33F;
	Mon, 30 Oct 2023 17:09:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C4510E33F
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698685797; x=1730221797;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=czPUrPtFbrHlROhbMElx8wfWXurRURMVKCO5+haTpsc=;
 b=glkfN+t/lvbfYmoywsWxNLwO/RQK4CiGmZMAhzHhkKzkmrPiAHujV5Xw
 44IxqGO6GEc8y4Y9Fceb04vZWQ5Gn0BTICbD3XF+rctOrVzET4m3s6t/W
 PIfNlCmaA3Ll/ZnAsoVy1zFZs+Tf89q42jGRcn7B4HaOYRFIjOFZyjaXb
 8SbIabB6RnhLGBVl5sj3NVRTSqQPqSTn3k2yQwXl1K66i+6kfqCsR+g/Y
 pMS1+zamc5s8joloqP8/6QssZ8jeQzBj+Ho72vN7uSnQRi6iLgqHuVCbk
 ol6/GXwNGnJ/KJch93E7/5a1+Vu7AjzNhTvTMi9g6vgbyI8aulLYECc30 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474361684"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="474361684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 10:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="904051852"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="904051852"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 10:09:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 10:09:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 10:09:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 10:09:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 10:09:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dt0DSsj5fnfq7Txk5KPBL9VfuIr+x0+LFnIc8xAkCk7Rq7shPxj23GyyDHsaMvT/CF35r8bfBfbg34/9m7dXqCQq06tCcHuMuB8ZH1FpHz35V6Hp7H4pBgGcZGkMESV0F0NEI23ERIv4IxgF1LkYGNi416fhDHSSeas93dDgS41BNkukUNxsbwNzLNCZT7yAIPkescBfNuPzwEktvoMQPkPphPihu+49e/Rit7/baORSwd+Nj/598LCtwdrn/gHwt3C8MVBQZv6lbkCmW6Yn+LYrDMSzK7QfwYLVWpBFUUeXKsV6AIQsKKvdKgW1HfHy4CLIdmhKh9tZcGOugqOlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuG3BLwzfH5jtzkQcRXbSrtr429FKHoRl1CCNw7t3Ek=;
 b=jXyDf1n2iDut6S8d/v7nBb8isLFkNL0zeUlbOmjnI+EytUylMBX94mxwNNDcY/rJj0iZ1XgmE8mFo2ty7mMLMLKeNuj4zFw8W/7R7JW58Vl5dzIlHiowLkiWCufIX06nwj8e4lPaCRwejh+BMxjVFXfA2BbG4W8G/jkAdwRVt04Z4gWOVsB+rqKZpygaIJxr3iE86fmXx9jUpsDyJHJfsCnPbZB0C4l+6w6edFO1MJvXzxi4FIklE0ZYDH4LLwViP/zH9TyUKIVenGsr7CnKeIfyaWZuRjQTmurmO8lBdtUwOwRXHWclaO/efNS1I8X8XaKcL7uJn0UFTR6VT8StHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 17:09:40 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 17:09:40 +0000
Date: Mon, 30 Oct 2023 10:09:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZT/jSWWLMP0U8jB5@unerlige-ril>
References: <20231028033910.2479157-1-ashutosh.dixit@intel.com>
 <20231028033910.2479157-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231028033910.2479157-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:303:b6::7) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b7eafb-00a5-403a-61cd-08dbd96b00a5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W9nT3Whj6OswWN9SPpmunbrl0rkg+wPL8rL+XoON/qaFj90mjujUUcs8TOUvRuxhLs8J0+TT8d8rmVmCUu6OWOhpIlaxPt8R2VM6j6i6nkiTrwrPVbkgiW5abXWTZl6WAj/EQkCS0jjIMj1vxOoLyErclrMYAKmCD6IuEogZU2R1TVou/TfTTCCjBPSSYQxdNzWqZLfW7OB7mSuruZhq0l8GSpdnm6OFtkkseuOpW6/aqUKNL07il5CC1w66p+9abW8c7usxtP8uF9Hx5SOKl4RnUmDYUN30o+IH3+m+TZXoGMpPpbVv5Ng9E9gBzZASiSTOxwPA0kLgcHnKu570LEbEV5RxCUO8kvXmnLfWRUSJ3nE8heNuJIsoqj0tal4UV4CmPajq6WEvxShbJ9dqjxEr4rsAgIAHDXZdLxgspJDp5Wsv3b9YRC+lRIh2gVTXwECe6DzbtbopMzER7ArLWUn/T32ljz8+lMxQzsr7iQ0TC987WMyxyrRrxQL+6tTcNN1OpkG6MSEx/tXxtfqrpnsmc6c9fz/nljOC+4FPbo/UpENXAykKIJLUgQjkwmaI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(33716001)(38100700002)(2906002)(41300700001)(5660300002)(4326008)(6862004)(8936002)(8676002)(86362001)(316002)(66476007)(6636002)(54906003)(66946007)(66556008)(82960400001)(83380400001)(6506007)(9686003)(6512007)(26005)(478600001)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUR3alVLZUxUdU9ZK2xXYjcremZtUDV6cHg3aW5ESmVqV3ozc3UreXY5RmtG?=
 =?utf-8?B?bjR4bHE3SGljNkY5eFl6ZkNBNXFSVmw4eGNWUUFJTHZvcy9PUUZndDM2eHdk?=
 =?utf-8?B?enpWYU5jKzFycFpvcTcvVXVjUnlVMldQSnhEZ0xrbGJyQTFSdkRqSkVFZGVv?=
 =?utf-8?B?OHZnRzVlaFZGMmhKRGt4bjlFMHZ1K0NkcnQ2VVJkZDFLMVdpZDQyTk9RR3BB?=
 =?utf-8?B?VThKRGRCM0pDU3JwWXNpaGJKSVNqbzVoYTV3bGlIYStpc0twelFhVnZ5YkVk?=
 =?utf-8?B?K216ZWNCSmNrWWUyUlBTOHRrdUZUdzFDZHRaUTdGQ0pTSWVsdjhLcHR2WjNh?=
 =?utf-8?B?NDl2VFFha2o5WSsza3hWQW9NVFppdjhZd2lhK3dkUkhFNGEyMVJnVXBOZGdj?=
 =?utf-8?B?SG9ENnRSNnhNSElKSTR5SURiVlk4b2kxMzlqODRnZytDTUVXblZNYytsY0pi?=
 =?utf-8?B?MzBVNW5hS09EeWdsdGw3aTg4QlBWS3MySWp3WkhaaXVJc0VrWm43TTR6M2h2?=
 =?utf-8?B?M25FS2lYdHJWOGRGVUgvaGEyKzdFUEJ5LzBzTGhURGRqbWZleXgyWnRUVVk3?=
 =?utf-8?B?SFdsVk5DOTBlL2xKRkVJQWhXVElhdXE5Tlg4c3VXWDlNaS9DT1VYdTN0Q29M?=
 =?utf-8?B?NUYwcit3eEMrN0RwZ3F1WnFxY1drNG9KckVqWGtwckhjUUpURTNZZFk1aWla?=
 =?utf-8?B?NFEyZVNMRlhmcG5kd1duTUk1TGNqc3lpWEo2UTNiVTA5VXUydWhxTXUxWmh0?=
 =?utf-8?B?UDZVMXJHRjVGeFBEOG1YOUNQMXNFZUs5OUQzSjFuNEpURTdSNStpN05EYnZI?=
 =?utf-8?B?Q1ZnSnFYTFFmVXg1MzBBZUYvZ1QyMjRHY3B2R0x5SGdKdE5hNlIyS2RlUUtq?=
 =?utf-8?B?YmFreEVwYzNiOUZ1dW9XYU9JSGpiVXJGRmpTL1NNd1phMnUvTEJ0N1MvRDd1?=
 =?utf-8?B?a0lIZ3R5RnhsaG9LaGxPZEVLdytYNXl4c3lzTmZ0L3Znd2dHYlVVajNSR3BD?=
 =?utf-8?B?djNHaENhNUpqZEVIcmRHWW5KWDhENFdNSnZkWlNtN1NZcE9oeFNEWm5KYk5M?=
 =?utf-8?B?QUJXOXZZNWR1ekR3ckpLM0luUzQ0alZwODRIQjIwUmVBQjQ4R1BBd3ZEWU1q?=
 =?utf-8?B?dGFjejljdmpFdHVwQ0U4OUJpenJIczl4VGJsR0NYMXlQKzJpYmhWUVVjQ2Y5?=
 =?utf-8?B?TUY5Znc4Y3k0ZTVrYmdQR3poZDEzUTd0TUFwVkhLMm5GN1FTQ2Y1YnF2bUxa?=
 =?utf-8?B?U3hjYXliYzMraWdLUkNnRElTVGRlaThpelN2MFVCcjlrMm5TVVh0dU04by85?=
 =?utf-8?B?SlZXcmZJTWlCSnk1Z3RWUHdPVWI0enpwQnRWcGt4ditxSW9IUXBaVHBYejlv?=
 =?utf-8?B?MGZRQ0kxZkdNcHozNTMzbHl4U1ZieXZueFJSdUx5c21XUDVsdnhOcFpxdDQx?=
 =?utf-8?B?a1NMNCtIV3VNeVFtMEpVenp4ckZCcFgwTmkxS3V1b2h5VDFyT2Z4Q2dLNmFD?=
 =?utf-8?B?NU5RL25uVTNER0Z0TGRQRlpKSnFxQUt6dzJGeWF1cHBVc1B4VUcxTTN4dGMz?=
 =?utf-8?B?YnkzMlllSHZNcXRxRnFlNWhJNTdnTFd4Qk1hSFUyditoVE40cTJHTmh3a2xq?=
 =?utf-8?B?QVdQYWRwYUFoSzBOdEJVb2FxRjhyUEJqR21JUTk4aVBhc3NVSGZteFRiTE9y?=
 =?utf-8?B?M2ZhQTM2QURCM3I5bDBJYzJXbjI4WWlJTVIyYmgxQldPTlJlc0Flb0twZTlT?=
 =?utf-8?B?YmlrTk1ObkNUVU9vQ3IwUEVIYVI5QzloVEsxRnhIeFNSaS8rbVpDb1l4YlZI?=
 =?utf-8?B?cWx0WUZJMnJhQlF4ZkxSa2JtKzU0SFRCeGkySzdmZFhSRmRoSUg2WWs5Z1d5?=
 =?utf-8?B?ZXdXekNpQjdieGQ4YWh2R2NWa2RPd0tnaEpYTXUwVG0vazVPZUtROEluRXFj?=
 =?utf-8?B?VUs1NnNOQVhyNWdHYXRiUVVYZGhQYUN3SW42b2pYMjNoRDg5L0oxM09RSEJo?=
 =?utf-8?B?aHlPWGxXMjg3blo2N2kyT0ZyUkwrZmdWQS9zZmZ4MzlCVUIyU0t5czNCWlp6?=
 =?utf-8?B?Q1Z1eDk1MDFUZ3BLSGhqdjBHSmI0WWNnZUNxbktBekt0c3lQK3ZidTdPbi9T?=
 =?utf-8?B?R0FOQ21RdnZlL1RuYjZDQ1p4ZTVsR0t3WVVFbkZTZmdKZFZMb2I4U0lkQnFU?=
 =?utf-8?Q?/z/bVnoXdInA5InJ3DUlh3k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b7eafb-00a5-403a-61cd-08dbd96b00a5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 17:09:40.0604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+WgRDHFnHop5P/ue6HJbZeKmJsax9lRwkfOQIDWSw8tlyEXFl4Jty3BlD4IxExql4cRjVoMZauxfbUKa/paK8qo9TPo6FCzBT29tCgzBew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe/uapi: "Perf" layer to support
 multiple perf counter stream types
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
Cc: Harish Chegondi <harish.chegondi@intel.com>, intel-xe@lists.freedesktop.org,
 gzadicario@habana.ai, ogabbay@habana.ai
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 08:39:10PM -0700, Ashutosh Dixit wrote:
>In Xe, the plan is to support multiple types of perf counter streams (OA is
>only one type of these streams). Rather than introduce NxM ioctls for
>these (N perf streams with M ioctl's per perf stream), we decide to
>multiplex these (N different stream types and the M ops for each of these
>stream types) through a single PERF ioctl. This multiplexing is the purpose
>of the PERF layer.
>
>In addition to PERF DRM ioctl's, another set of ioctl's on the PERF fd are
>defined. These are expected to be common to different PERF stream types and
>therefore defined at the PERF layer itself.
>
>v2: Add param_size to 'struct drm_xe_perf_param' (Umesh)
>v3: Rename 'enum drm_xe_perf_ops' to
>    'enum drm_xe_perf_ioctls' (Guy Zadicario)
>    Add DRM_ prefix to ioctl names to indicate uapi names
>v4: Add 'enum drm_xe_perf_op' previously missed out (Guy Zadicario)
>v5: Squash the ops and PERF layer patches into a single patch (Umesh)
>    Remove param_size from struct 'drm_xe_perf_param' (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm from OA perspective

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/Makefile    |  1 +
> drivers/gpu/drm/xe/xe_device.c |  2 ++
> drivers/gpu/drm/xe/xe_perf.c   | 21 ++++++++++++
> drivers/gpu/drm/xe/xe_perf.h   | 16 +++++++++
> include/uapi/drm/xe_drm.h      | 59 ++++++++++++++++++++++++++++++++++
> 5 files changed, 99 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_perf.c
> create mode 100644 drivers/gpu/drm/xe/xe_perf.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index cee57681732d5..87c57f6c927e9 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -89,6 +89,7 @@ xe-y += xe_bb.o \
> 	xe_pat.o \
> 	xe_pci.o \
> 	xe_pcode.o \
>+	xe_perf.o \
> 	xe_pm.o \
> 	xe_preempt_fence.o \
> 	xe_pt.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 8341acf66e5f9..4b5a0c504eda1 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -28,6 +28,7 @@
> #include "xe_module.h"
> #include "xe_pat.h"
> #include "xe_pcode.h"
>+#include "xe_perf.h"
> #include "xe_pm.h"
> #include "xe_query.h"
> #include "xe_tile.h"
>@@ -127,6 +128,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
> 			  DRM_RENDER_ALLOW),
> 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>+	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
> };
>
> static const struct file_operations xe_driver_fops = {
>diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>new file mode 100644
>index 0000000000000..a130076b59aa2
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_perf.c
>@@ -0,0 +1,21 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <linux/errno.h>
>+
>+#include "xe_perf.h"
>+
>+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>+{
>+	struct drm_xe_perf_param *arg = data;
>+
>+	if (arg->extensions)
>+		return -EINVAL;
>+
>+	switch (arg->perf_type) {
>+	default:
>+		return -EINVAL;
>+	}
>+}
>diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
>new file mode 100644
>index 0000000000000..254cc7cf49fef
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_perf.h
>@@ -0,0 +1,16 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_PERF_H_
>+#define _XE_PERF_H_
>+
>+#include <drm/xe_drm.h>
>+
>+struct drm_device;
>+struct drm_file;
>+
>+int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>+
>+#endif
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 24bf8f0f52e82..3eb4b20159824 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -110,6 +110,7 @@ struct xe_user_extension {
> #define DRM_XE_WAIT_USER_FENCE		0x0a
> #define DRM_XE_VM_MADVISE		0x0b
> #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
>+#define DRM_XE_PERF			0x0d
>
> /* Must be kept compact -- no holes */
> #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>@@ -125,6 +126,7 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
>
> /** struct drm_xe_engine_class_instance - instance of an engine class */
> struct drm_xe_engine_class_instance {
>@@ -1074,6 +1076,63 @@ struct drm_xe_vm_madvise {
> #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
>
>+/**
>+ * enum drm_xe_perf_type - Perf stream types
>+ */
>+enum drm_xe_perf_type {
>+	DRM_XE_PERF_TYPE_MAX,
>+};
>+
>+/**
>+ * enum drm_xe_perf_op - Perf stream ops
>+ */
>+enum drm_xe_perf_op {
>+	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
>+	DRM_XE_PERF_OP_STREAM_OPEN,
>+
>+	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
>+	DRM_XE_PERF_OP_ADD_CONFIG,
>+
>+	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
>+	DRM_XE_PERF_OP_REMOVE_CONFIG,
>+};
>+
>+/**
>+ * struct drm_xe_perf_param - Perf layer param
>+ *
>+ * The perf layer enables multiplexing perf counter streams of multiple
>+ * types. The actual params for a particular stream operation are supplied
>+ * via the @param pointer (use __copy_from_user to get these params).
>+ */
>+struct drm_xe_perf_param {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
>+	__u64 perf_type;
>+	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
>+	__u64 perf_op;
>+	/** @param: Pointer to actual stream params */
>+	__u64 param;
>+};
>+
>+/**
>+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
>+ */
>+enum drm_xe_perf_ioctls {
>+	/**
>+	 * @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream that
>+	 * was e.g. either opened in a disabled state or was disabled via
>+	 * DRM_XE_PERF_IOCTL_DISABLE
>+	 */
>+	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>+
>+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>+	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>+
>+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>+	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>+};
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
