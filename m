Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F7C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 05:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3921610E052;
	Fri,  3 Nov 2023 05:09:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B377110E052
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 05:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698988176; x=1730524176;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yoTEX2VuUBjGlJPmHyP8nbEJt+cdPW2DN1aXuDhvtfM=;
 b=iGVx6scEqB40KxPs7CibT2u2z4sLYmjA4Rjdz29rcHKue1zlYXJQktD+
 fQsVdQYZ1J8OOXtvoPU3CsmM6YJNUT0yAc5qbv4fPvKdFuLq/y5yQxnFZ
 KXirnBoIlF78FYGE3ohiEp6tKwu83nmVN0stIoir0uT/lNfTWDd0WDMek
 UouJGuHU3Nvg5985nya2h64fHHQkvAik6iptzAxcVinTaWV6Gms5xeb1K
 RFL0bg11e7x7w9zNFn1zdLx9FKAJE6nkpMCpOuToDFeD5mgw/j+T1Ohku
 YpBX/503VSD5cu8Oi8uIKLSZIALIEx3ej9PhhP5WK74HCsDXdKCyY6NqO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1812866"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1812866"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 22:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2670681"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 22:09:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 22:09:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 22:09:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 22:09:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmeYqY9wsxQuwQM/T+hG8VXvJhmqC339LFiUC6Ja4mhfDSL8Lxg5YcG7cvNCdpMXHI+INftTpjpWZIdsWOVDOYdJIPP/4KqUJPSC4AAHBGc2eYD3ymHdbY40oCFy7pq47Rwwm68IXO32fR0d7Bxxw7SAV0KRHa61JDXDg0YVHcZivb/t0Xw6QGtV+gd7MSsYx7VqiPHvKdyowRlKkWfnljiXLwyT2m/TndIkKaZ4/+bHrAgt7drFV6nBjOL/aXjKUTBGvLwNDChIAdmKNGNfT6Z3PYTqZjqxHMmNuE9UEipx4i5PpFaMPbtbp+gBtu1bBI39ljmg5MjxoruMQMEibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6NszJ8KSIJCB7ECFiS+31H0VM3Dus4jqiMk1rqnSRI=;
 b=B0AGAp4fpubFCHDFdAlrrr9sF5OgGhJKMGGmFmf8PRWCQ4UmOsOHC0e7fZLIyVGKB0Nwp90g9je8HjRMzMbT3Jjgf9JNByxUA0Lj1WVhKpa5WyEvi1/tNiKHFG4IlDspsY7S1aJSc5lA6TTjNtNilcJDuPI4qPPdXb6uuTTt4HURSNQ9YqWIR5oYvhEhu76e0pEDMk6Dozd1EBFUBiELi9cnFBvItnMZeX0w4BS73BPl7lAd6fvGbw/xmRHrStW5UL8c/0L1jhIS1K1TSJwmP7FpbcWDAdCCAXgT7AbDNK/otGOQY1w7yoLH675Rt8V6Z1yRCMd8bJIZVlr3GXyuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 05:09:32 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 05:09:32 +0000
Date: Thu, 2 Nov 2023 22:09:22 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Message-ID: <ZUSAgnXJfrs7K/Xa@nvishwa1-DESK>
References: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
 <1984105530cb00a1e782aea061e21f645bac5ee7.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1984105530cb00a1e782aea061e21f645bac5ee7.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: cb71d680-ea2b-48fe-e168-08dbdc2b107a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AipeddmTt/o1Y+f5H9mTy6z+chvPUkp43VQfQSy35RUsCAnVTvpG9L7V2zyVxyVU/osD8x8fsEEy0aPk6dCIi/lgrifKbbq+Jz2+Fhuw5irK4VnWGewMC9LxOJ6rFeOfzL56ZJpdUXbLma2cV7LPDNtt5LuF/8JnXKB7uuaN2aswtEDaOuIQr1chQk9ILjaLd/PS6nz8aW6LFG86cpOnOCvVLX61xUWpE2646qxrV2l+eJD7h4XXBwJ8kZ03B7N0EbNsMl/oTe2JuejPnokNHNCHQuCzj+D17uyZY02aVCnelDdskcHuoM3oIF9A3FDFB4qLHtyAvQE8zmX8hYBVi57KhH6zqwbc/OJsc68GOnFgBa8GtFdD1Di7/9wSMhqJIAjTNT+c1Qs1W5d7qV3GoUaLC6xsGxw8ylGuTmuqpwrSNrGJCDh2zoWg+KZjMktQtKNo2x4Rk0A6/0IeTXhBtquDp+YKrnJYyfChLnHaSee3cBUE3LZIkhFJHZ/yhZKMGkovP5akt9X2g7N153RRgUA8z5FY0y+pFRaWvuklDLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(136003)(396003)(346002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(83380400001)(38100700002)(8936002)(5660300002)(86362001)(6486002)(82960400001)(966005)(41300700001)(2906002)(44832011)(8676002)(6862004)(6512007)(6666004)(9686003)(6506007)(66556008)(66946007)(316002)(6636002)(4326008)(478600001)(66476007)(26005)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CkSp3eQh50rsphb3kdCty7nYOY2cxIs4kBZtdGU8hyFLaH8bwCfiRBD8a8?=
 =?iso-8859-1?Q?zr34H7MllINUjDHP4mMUBS/6ZA6TSrk+miZqGUKjEqoWM+q3HF3wrZ3LtH?=
 =?iso-8859-1?Q?aoA4qa+k7MmaTzuBJqU8a05AJojzX770zTvYM2LNQuvU6VwBzmVfFI7Lhn?=
 =?iso-8859-1?Q?8HRNTo3X8inNyuRcSJKSE6LBmVfjqpB+6nCc70Xs3vLVck+SfagBW1R508?=
 =?iso-8859-1?Q?AZgXIHXcR+eQWAUZS/ImV89/3CDs9MKAVEShlvR73+Cq2R18bmCvCJyYsN?=
 =?iso-8859-1?Q?kvtvQbMo908BjjzvqOYpGQRPAqcxibTwT1+cER1y0u6959M5v7rrrm4Ju6?=
 =?iso-8859-1?Q?SZbV1epfCLdctf9z2K1bqaDLc8QBDTSQihv/UN/pFeAG6hOb2jR05cfCqO?=
 =?iso-8859-1?Q?yizSHlqR5De9N23l93j8vavjOdYsjxDAdE//gIKZ6Hij7RIxYEg9I7U4ri?=
 =?iso-8859-1?Q?ppASAY94urTCVPyjDQh6p7zg4mXioAyZGwQRslbtkj6TAGO5qmEBCzlihx?=
 =?iso-8859-1?Q?duKgyK3VRwlTnyxsNVsdO70OXtLzG5p53s9c0Ci7hKdqA85l6YTLY8QsWJ?=
 =?iso-8859-1?Q?N3D2kOrM5yyNMXqkdQ2fjiSGbFDjG8fiFff6tQgP/Atg+tWSqghu+y/MRs?=
 =?iso-8859-1?Q?jfNuA3nzHfMGUfcHI3B5Fu917rs6NeUIaR12oEs7FZ/1T3jcdgBskXJzC3?=
 =?iso-8859-1?Q?nqdT1lpF5f7RYWTaOGGIhlcjgxyQ3a5and0Lkz0vd6ZDaUyRgoDPsUxJT9?=
 =?iso-8859-1?Q?s4dD5T7byHCU6RXva6/LHXI82PZKawo/rmWJ1+TliGLY3eVn3p19X/WyEQ?=
 =?iso-8859-1?Q?V9cW1HsUGtgs4tmSv5SuebkMk4j4Cx2cB0nbsZfOxqNvmnKp+v0FktZt2c?=
 =?iso-8859-1?Q?B5srQc+TslEvkbBl9Mv/MhbHCiVCu9ERr6SyONk/BrsHnYnbIdXjnvTJPT?=
 =?iso-8859-1?Q?6O1H8LllhJmIujM+2fQlybQrnF4qD9kG/wUjvKbZ+TSHNDDNTk7ze0tsFN?=
 =?iso-8859-1?Q?4HmCh4eZFsA3hqrFlpjrjYY3fBEF7Fy0JJ3/TCbIAj1kGvlDXYXJeAL0hm?=
 =?iso-8859-1?Q?3NPzitvNjlWDhhiv0iJJ13CNCkfiaVPf6m1u/gAXj/25ua05ESAw/zzHyr?=
 =?iso-8859-1?Q?b5sW0QxvWYgmpPvykLA8GGG5UEhtWWaHQ9aqv02FUinTGB3oPeP5rWSkmW?=
 =?iso-8859-1?Q?owNVG1oSg4XyDzMN0BknrBr8ZlefF0tYVJxGSGtqeNal7xdgZcfooTWOjo?=
 =?iso-8859-1?Q?Zf/a/4StaupCdnY55t1Lr4xbuPb0VnV8jwdoW6FFgnCR1iJWRGIY+HZPQC?=
 =?iso-8859-1?Q?bNzDqD+DHjffDf0VnZN3nDMWcu5n3WQlJlm2Kz5e6jMlxFG6GFixi2WpZL?=
 =?iso-8859-1?Q?qlLGZj1QxDKD5GvlGl85ha7ztw3BLfVczJvP0mLlDz8JTujtkbjiOrjk1E?=
 =?iso-8859-1?Q?4oUvYu1dye0GzfHq1LfoL8iMrXXr4qjIWRYB0jG7u1UfulMKROQknkM1Fw?=
 =?iso-8859-1?Q?mJgyPVsJ4pAq++oRaSzjOE6fAZuzRu/g8ZoBe3UiKodn8hqyMozIaDJrVC?=
 =?iso-8859-1?Q?RQ0+l9KcWITsDp48Wo2jYuHKUB+ZV5klb3Yo9Qiq3Bv+Mva7RPcIyVDTAF?=
 =?iso-8859-1?Q?bHFm2h7qqtJG1MNYsYsasOi+56qH58Vd/P2NFSQ13CJfbGLzQqRtfbY/Es?=
 =?iso-8859-1?Q?WhN6Nh25vU0dUzqZT7k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb71d680-ea2b-48fe-e168-08dbdc2b107a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 05:09:32.2460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHQi/7Jfku0sNITuuZcn8jRMWF5XvqiLiKm9Lk5DDN7Q+TiJJ1I6iMXoL1XV/lGvCF87+ggoR4q2aLDzAILjqMVpWoefB/GIC/7giq6c5Fzn+n2vKu8Md7vlF+ZaLFpS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 0/2] drm/xe/pvc: Enable fixed CCS mode
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 11:41:34AM -0700, Summers, Stuart wrote:
>On Wed, 2023-11-01 at 16:57 -0700, Niranjana Vishwanathapura wrote:
>> Allow static assignment of compute slices to a user selected
>> number of compute engines. Add a per-tile 'ccs_mode' sysfs
>> interface for user selection. By default assign all compute
>> resources to the first available compute engine. User must
>> ensure the tile is idle while changing the ccs mode as this
>> causes a tile reset. User must also ensure that there are no
>
>How will the user know that the device is idle when the KMD/GuC are
>responsible for submission management between processes? This is the
>reason we went through the context creation interface in i915 rather
>than having a user-specific interface like sysfs or ioctl.
>

I think UMD handling it is the simpler approach without complicating
things in KMD. As writing to sysfs needs admin access, and admin
will have some control over whats running. The patch #2 handles this
case by returning -EBUSY if user tries to change ccs_mode if any
exec_queue is open (as they are are associated with engines).
There is also a suggestion to only allow ccs_mode change only
when there are no drm clients, may be that is an overkill, but
I guess more simpler the better as ccs_mode is not exected to change
that often.

Niranjana

>Thanks,
>Stuart
>
>> open exec queues while changing the ccs mode. Also, error will
>> be returned for exec queue creation with disabled ccs engines.
>>
>> Support this mode for PVC which can be extended to other
>> platforms in future.
>>
>> IGT: https://patchwork.freedesktop.org/series/125873/
>>
>> v2: Fixed issue with HW config, ensure no exec queue is created
>>     with disabled CCS engines.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>>
>> Niranjana Vishwanathapura (2):
>>   drm/xe: Enable Fixed CCS mode setting
>>   drm/xe: Prevent exec_queues creation on diabled CCS engines
>>
>>  drivers/gpu/drm/xe/Makefile          |  1 +
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 +++++
>>  drivers/gpu/drm/xe/xe_device.c       |  1 +
>>  drivers/gpu/drm/xe/xe_device_types.h |  9 ++++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 45 +++++++++++++++-
>>  drivers/gpu/drm/xe/xe_gt.c           | 27 ++++++++--
>>  drivers/gpu/drm/xe/xe_gt.h           |  2 +
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 79
>> ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 ++++++++
>>  drivers/gpu/drm/xe/xe_gt_types.h     | 16 ++++++
>>  drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
>>  drivers/gpu/drm/xe/xe_hw_engine.c    | 14 +++++
>>  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 62 ++++++++++++++++++++++
>>  13 files changed, 288 insertions(+), 7 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>
>
