Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D8C64EC4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 15:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117C010F03A;
	Fri, 17 Feb 2023 15:09:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A564410F03A
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676646596; x=1708182596;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MWRu0DeC2OtLhWDGkOt/liVnVCVMsAxWvMJohU3sZ4M=;
 b=a7fviuI+IBSctLqQaClf+CdZmqNHLs2cE0PiyfuqP/DbbkbhCY4s5NVz
 2PEImsaIoB7yKYpclATR4Dxgz23vPfSZiBLI5V5gwkFki3t8bLhbk5pxc
 DZbHPydmuQdk7JfTkPKrmx53SYS8iVMtqVeL5XgtCAIldf0RlT0F+13qo
 HHo+qhyYNCpLjmwL7utmxugA9GCWiQil4HdndtJy4ZSFGCqO+IizsXazn
 8khhrCgfWV/x9mgtksOAX1Q2EmzWzcWNMoCkhQr+UE9IlZEJ0OGb/0rBR
 9vj93pQd40umZ+7Vaajat/VICwkWAjgoFxvzr+d+OfiA7y1MiCCcYaqPO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="334201377"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="334201377"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 07:09:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="916100990"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="916100990"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2023 07:09:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 07:09:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 07:09:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 07:09:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFF3QPVhf3KZ47NiX356nzGYV5mixEfdHleseC59odxSC8gbPtH3G2iQ/0oWzqolkY+MB60s/4KzOlfFpbMTY+08ZbotrmX1JUFyyw13Sx2GYuE95gV5UDYMGVEWXB0ynrVdd/Q4j8IM/jS0H94XJAbv60mbVVKEbvhXyV/uhq6WsuuJwfoQcbyGMmtDPBOr/KPu+TwKoKSHSHzxEEZ0nPN7N0lFY/ADPLC0alWXrJNVaRXUPn0t9xA6t8gs8BncRBPnfcBCO4lcukTfWmfyFGbsh3dsU00GK3QwAX2zcOdPc73yA4R435nmr8JytE70ZK/a7utww89KyHzgr2X0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVQC99BstmrbD2HXOtAAzAZ2RbeG15bOKoeDrWMSvM4=;
 b=Ls5mhH1TVTfWHBT4PwP+adZbOLvwcBjB1iJDSEUWm69bzCHe33CB7UwZvSHyJSdfZLMvntG6wecMGKWH+fCNgLSGuC/pI/SWXWy4ZKg+MvWFUM91qMWBVK3JuB5yKDQD5vbpSyUhV60oiiivpE4Be9SWNVd5l+I8ZzGZJaIBEVNbTI6GuiTN6oV5w/MiAu7CbP2cBEoKWu69gUVOy3m7LaEK2dTEt2EVhbWlFU0wmoDhHH5RIRSRJc8Sk2pLXTq5KbArBCcXqPR5odA2TGicvO2EpXI9VL7CjyuXxLnFZJrk0N10qJS2LlcjeZw4lzu/IPxDD0nABXjcSHuFQC2/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Fri, 17 Feb
 2023 15:09:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 15:09:52 +0000
Date: Fri, 17 Feb 2023 07:09:49 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230217150949.i6dl7kynbbsheq74@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-3-lucas.demarchi@intel.com>
 <87y1owy0zw.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1owy0zw.fsf@intel.com>
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 631e3139-91d5-40e3-514f-08db10f90531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FM9xmgXAlTXFuQgm0ZHlgIMWu71exTanCcGD67fGkSSbBLhn/sGdoVjByEAhIV0OT02aM9y7BivaPQQfAKW/mHBqK5TxzbrsSHG2sBPEEpEo5QGLhk2JFN9h76NYrT4yRFOUJlgCXf2u3Okz4DPfcnvTCTyGBSW2RdDX1E754KEc4hNAcXXIMddT2suNzHhTLjyMBmKlBd7d0uZCq9Rf6s9v4+ZxqLCFUXzGny7U/IjPxjlikc0phc2IcGtDWfdqTBHtpSeT3uP7PPI32bXVhmHclNAoQAG1TMJnEakUtKA6aMQaU2Dn2bYUjz4HheBVTeBGzM7jks5n+Rx2UzFueBbwuogmnTLsvwQoD0BjZgAbJ41V9ahbDhfTlSFIqk0lGvzwcsIsMapm4gDJM9zuYUIhVfrD6lYSOIlx5sLNlZFxslCG5FGN1Qu7dv/kMO2ml3ngUJhf3gJT6VWKftymkmzclE6RsUZhdz3kr8AO198fYJcSme0D2VohVYXQdHRiSP8XvqBxwyWAJjmXOO++MHVLIpYlA+DT7oH6vvw3tZPF85FUtpwZTkXDMxZygIfl+pKvtOOy7mqYD+Jv6Y5TS5fuhDaxix8uEdE1w6u/q+IBMVGvpUk3497TeaqbP+I/6S0oLBTHsy13oK/EMBtZgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(5660300002)(38100700002)(9686003)(8936002)(1076003)(82960400001)(41300700001)(186003)(26005)(6512007)(6506007)(6666004)(66476007)(66946007)(83380400001)(6486002)(6916009)(66556008)(8676002)(478600001)(86362001)(2906002)(4326008)(54906003)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Im291GSzrMvLH1FbzhiFY00r0rEl1yPM61RQrDVBNXSJA3StzgAA+29gdP?=
 =?iso-8859-1?Q?IA+gRMc6g/qJPETZKHP84W0z6gIGzFErseAjyKqzWE063uqzkHPLyFNyOO?=
 =?iso-8859-1?Q?xhM/LLOCh2HQyq6CnY9kKFInQuGn/ulzxDaJJu3gtAk5hFoYcXnHHnexg5?=
 =?iso-8859-1?Q?Pnkfz0Eh2b4SYSBzardzfHxXt28l5TDcCT5YsrZuWA9Hn4gPLqGDmZ1c1+?=
 =?iso-8859-1?Q?YQrz7fP0qgNr06i2Frz+yJHqnt8pZP/UOyi43A1Dcdp213jBe524InGkAz?=
 =?iso-8859-1?Q?47vD8jMtx4ZhXrIo0fd+8pmXTJBoRi/rzMVdqa1jTkHS/+5wJZxWt1Fnj5?=
 =?iso-8859-1?Q?YeKRCX/zcywZDck5lHC6MBrFDCpPTo5J3dxgIua18uJLXj+1GH/JIA2HgM?=
 =?iso-8859-1?Q?cm5luGx2QlRXQ7S+XUzFxjPSA29l6tETIZtaheBo+uR1G1xIuWXMrxcCQo?=
 =?iso-8859-1?Q?Oq/YTpTWGZBH3Fl/CC0OHxrkehLzeJTS0yO4JsXLgTNWLneP01snGt113O?=
 =?iso-8859-1?Q?Zr5yw/JHdv2KSo3oTxX4b3K6dr9o8gbpQZrwFrxRmiPBPpFZB3xbJAwsMA?=
 =?iso-8859-1?Q?w02beASnFV19K8d3kP6lAdUnIb/wkPE/DNhU6QvXg5TPAoUyXZTcIRog3w?=
 =?iso-8859-1?Q?xzBddIyCrKGVo+rZ+1+pOO+k8gVbgsBzdSvcoUZjHXfUWIAY35hNNoaFGp?=
 =?iso-8859-1?Q?J+y+oiRd5T6KoHBkHt4UsLQIreLOhR3Dz91DQfF2pPGTCZNvwAB2h6BItJ?=
 =?iso-8859-1?Q?FHyGesx/7Qet3zLTPqvRDgyKedmNf50S2k3NULypffVdcMKicOU4P+DCJ9?=
 =?iso-8859-1?Q?tGcqglgDzxepnrL+c3sufJ4t+gBz8uKucpAwj0KJXQSYnzgti/49yHBS26?=
 =?iso-8859-1?Q?okekYrMHwOKuMhIbk8R0IfxhZvb0uAh5QWXBmaPH3veeudcmyNQO3n/8iR?=
 =?iso-8859-1?Q?j1h0T3Xd6/whcY7Ff3jOidF28/j8eeeExl3kaPbZBBQ0yUeW+zP1vdXXlP?=
 =?iso-8859-1?Q?z9T9AgEZwv+PWGTQI6nmt309p4TKQtKXHT0DpZTreb6jZJY/ElALZ68bzK?=
 =?iso-8859-1?Q?ULtMBkcBl6yDOABswDoqxPTCDxyNtLpYcr6evvNNsK5sA7zLPnbKjVqvyn?=
 =?iso-8859-1?Q?wjd0KokpnwzMAwx0OLEFyPlswkjOMBN6Rvxfx2LQK2pMy7i1NJsFCD8Jcv?=
 =?iso-8859-1?Q?AneSqML01+BRE1tsoGbEffjU4tjKtfZYCrBBqCE4tpbTHK2j1a6ne4Dnok?=
 =?iso-8859-1?Q?aBjSAY+VBzNyjustVj0Aq4eyQXEKBjyBEczodKI5YOjd9LJqQDb9lYedKQ?=
 =?iso-8859-1?Q?S8Q4vhN3tVLBomw5jfzZmFt6Qdh9aaAzGxj8PfKZDo8V9MqUncEVxNJpur?=
 =?iso-8859-1?Q?RxVLGyX3DnuCZybXEg4c6nK2GWPDiaIlBNypF1+4cr8L4M96IVepFVcMZG?=
 =?iso-8859-1?Q?1T668Vs9k0JuDMHQbwcp0488Q3KEdvGRBBgc8PmBfmAooTHPV3GBMnOvrq?=
 =?iso-8859-1?Q?Q2BfF79U/MJiugPYzF79zgLHXEy56121fruQ+XyqHebq8jqqgxQd8bdZPM?=
 =?iso-8859-1?Q?mnRVTTmH2AGh+SreUI3QTYyahzvmXoJmToHS7qUjurb0kebIppVUhicj6b?=
 =?iso-8859-1?Q?TrXwzMNcmj1/AmLwp/bhHK1p8JjPoSRfh0anxBbHhQiTBJfyVEXIew1Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 631e3139-91d5-40e3-514f-08db10f90531
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 15:09:52.4794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6CXVxwK3/JdNwhvVvpT5p3UYm/V4Q6iYBL0YC5M2fzYKH6U+mHQmyJDQs/YMJ15b5CJL8Qbh3tUX69wuhOYHAqiCivrtjiUPqfjoA2/ICY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/11] drm/xe: Sort includes
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 01:39:31PM +0200, Jani Nikula wrote:
>On Thu, 16 Feb 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Sort includes and split them in blocks:
>>
>> 1) .h corresponding to the .c. Example: xe_bb.c should have a "#include
>>    "xe_bb.h" first.
>
>Personally, I've never liked this, because the local headers could have
>stuff that impacts global headers. And if there are conflicts, you kind
>of want to have your local one look like the culprit (although modern
>compilers are pretty good at showing both sites).
>
>Note that to keep headers self-contained, this is not enough for headers
>not associated with a .c, which is why we have the HDRTEST rule in i915.

Although I like the hdrtest and wouldn't replace it, I think having a
convention like this is good - it also solves most of the issues
wrt selfcontained headers while not requiring any special setup on dev
side: if every .c/.h follow the same structure, it's easier to maintain
the consistency.

>
>> 2) #include <linux/...>
>> 3) #include <drm/...>
>> 4) local includes
>> 5) i915 includes
>>
>> This is accomplished by running
>> `clang-format --style=file -i --sort-includes drivers/gpu/drm/xe/*.c`
>> and ignoring all the changes after the includes. There are also some
>> manual tweaks to split the blocks.
>
>Do you have the style file somewhere?

.clang-format. It's in the kernel source tree, added in
commit d4ef8d3ff005 ("clang-format: add configuration file")



>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bb.c                  |  4 ++--
>>  drivers/gpu/drm/xe/xe_bo.c                  |  2 --
>>  drivers/gpu/drm/xe/xe_bo_evict.c            |  2 +-
>>  drivers/gpu/drm/xe/xe_debugfs.c             |  2 +-
>>  drivers/gpu/drm/xe/xe_device.c              |  9 ++++-----
>>  drivers/gpu/drm/xe/xe_display.c             | 12 ++++++------
>>  drivers/gpu/drm/xe/xe_dma_buf.c             |  8 +++-----
>>  drivers/gpu/drm/xe/xe_engine.c              |  4 ++--
>>  drivers/gpu/drm/xe/xe_exec.c                |  2 +-
>>  drivers/gpu/drm/xe/xe_execlist.c            |  9 ++++-----
>>  drivers/gpu/drm/xe/xe_force_wake.c          |  4 ++--
>>  drivers/gpu/drm/xe/xe_ggtt.c                |  7 +++----
>>  drivers/gpu/drm/xe/xe_gt.c                  |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_clock.c            |  8 ++++----
>>  drivers/gpu/drm/xe/xe_gt_debugfs.c          |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_mcr.c              |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_pagefault.c        |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_sysfs.c            |  4 +++-
>>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_topology.c         |  2 +-
>>  drivers/gpu/drm/xe/xe_guc.c                 | 13 +++++++------
>>  drivers/gpu/drm/xe/xe_guc_ads.c             |  5 +++--
>>  drivers/gpu/drm/xe/xe_guc_ct.c              |  4 ++--
>>  drivers/gpu/drm/xe/xe_guc_debugfs.c         |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_hwconfig.c        |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_log.c             |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_pc.c              | 12 +++++++-----
>>  drivers/gpu/drm/xe/xe_guc_submit.c          |  6 +++---
>>  drivers/gpu/drm/xe/xe_huc.c                 |  2 +-
>>  drivers/gpu/drm/xe/xe_huc_debugfs.c         |  2 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c           |  3 +--
>>  drivers/gpu/drm/xe/xe_hw_fence.c            |  1 -
>>  drivers/gpu/drm/xe/xe_irq.c                 |  5 +++--
>>  drivers/gpu/drm/xe/xe_lrc.c                 |  7 +++----
>>  drivers/gpu/drm/xe/xe_migrate.c             | 11 ++++++-----
>>  drivers/gpu/drm/xe/xe_mmio.c                |  3 +--
>>  drivers/gpu/drm/xe/xe_mocs.c                |  4 ++--
>>  drivers/gpu/drm/xe/xe_module.c              |  1 +
>>  drivers/gpu/drm/xe/xe_pci.c                 |  5 ++---
>>  drivers/gpu/drm/xe/xe_pcode.c               | 10 ++++------
>>  drivers/gpu/drm/xe/xe_pm.c                  |  4 ++--
>>  drivers/gpu/drm/xe/xe_preempt_fence.c       |  2 +-
>>  drivers/gpu/drm/xe/xe_pt.c                  |  4 ++--
>>  drivers/gpu/drm/xe/xe_query.c               | 11 ++++++-----
>>  drivers/gpu/drm/xe/xe_reg_sr.c              |  5 ++---
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c       |  7 +++----
>>  drivers/gpu/drm/xe/xe_ring_ops.c            |  4 ++--
>>  drivers/gpu/drm/xe/xe_rtp.c                 |  1 -
>>  drivers/gpu/drm/xe/xe_sa.c                  |  3 ++-
>>  drivers/gpu/drm/xe/xe_sched_job.c           |  1 -
>>  drivers/gpu/drm/xe/xe_sync.c                |  5 +++--
>>  drivers/gpu/drm/xe/xe_ttm_gtt_mgr.c         |  2 +-
>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |  2 +-
>>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c        |  2 +-
>>  drivers/gpu/drm/xe/xe_tuning.c              |  2 +-
>>  drivers/gpu/drm/xe/xe_uc.c                  |  4 ++--
>>  drivers/gpu/drm/xe/xe_vm.c                  |  2 +-
>>  drivers/gpu/drm/xe/xe_vm_madvise.c          |  8 +++++---
>>  drivers/gpu/drm/xe/xe_wopcm.c               |  2 +-
>>  59 files changed, 128 insertions(+), 132 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>> index 8b9209571fd0..a25079d4e710 100644
>> --- a/drivers/gpu/drm/xe/xe_bb.c
>> +++ b/drivers/gpu/drm/xe/xe_bb.c
>> @@ -2,12 +2,12 @@
>>  /*
>>   * Copyright © 2022 Intel Corporation
>>   */
>> -
>
>Nitpick, throughout the series, I would leave a blank line after the
>SPDX and copyright boilerplate, regardless of whether it's an #include
>or header guard #ifdef that follows. They're not comments about what
>follows, which is what it feels like when they're directly attached to
>something that follows without a blank line.

ok

>
>>  #include "xe_bb.h"
>> -#include "xe_sa.h"
>> +
>>  #include "xe_device.h"
>>  #include "xe_engine_types.h"
>>  #include "xe_hw_fence.h"
>> +#include "xe_sa.h"
>>  #include "xe_sched_job.h"
>>  #include "xe_vm_types.h"
>>
>
>...
>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 7886c8b85397..a27e6c1a6aff 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -3,13 +3,13 @@
>>   * Copyright © 2022 Intel Corporation
>>   */
>>
>> +#include "xe_uc.h"
>>  #include "xe_device.h"
>> -#include "xe_huc.h"
>>  #include "xe_gt.h"
>>  #include "xe_guc.h"
>>  #include "xe_guc_pc.h"
>>  #include "xe_guc_submit.h"
>> -#include "xe_uc.h"
>> +#include "xe_huc.h"
>>  #include "xe_uc_fw.h"
>>  #include "xe_wopcm.h"
>
>Here, having the .h corresponding to the .c just looks like it's not
>properly sorted.

just because I failed to split the block as Matt Auld noticed

thanks

Lucas De Marchi

>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
