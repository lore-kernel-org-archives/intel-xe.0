Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E32F3C24F
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 13:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF66410E4B5;
	Mon,  9 Mar 2026 13:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ariehpdj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3D410E4B5
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773062763; x=1804598763;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=g3UlDELmQ/WLcZz+MloAw8IM35EMyusQd/bvjleQIZk=;
 b=ariehpdjnoN7Btfd7FK8t3DobCK+SDlL/7TB0raMl3Pt4DJU3elWGMIF
 hgo1pPJQqvoPpe9lbMVjZV4HJjtL5xCZ6XXdp1B9Bs8DzIVSVgUUl4pAr
 9/lv2Dz/+wgXhUid2zdZw6lphVNBWQsds4XvwTfrgjjDPq+CIbjzIT3aS
 vTjRFlMsZ6WsXPjr0Adwl2zuFB9TPECdFKJuNE72AWPHQZl3RG+wKpMmH
 wb8zNI6QKKiOu4ybfB3i4V42ShWryVt8a0pkA3HvNaChMThq8EIwiQeJw
 5qTp6NM0NEI3dLm77x5ou7K7sR2rFVLbdv3ZP9Sq7OH+xSjDkt+K7zwfj g==;
X-CSE-ConnectionGUID: FBT0wOMYRNyu8BYds43ZWw==
X-CSE-MsgGUID: j4D8G+OvSKGN4C1TuuytRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73985322"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73985322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 06:26:02 -0700
X-CSE-ConnectionGUID: N7Eqne3MS8u/VTGTfYgZFg==
X-CSE-MsgGUID: 9G6HkOCeTgOJvH/aVLLI5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="245715442"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 06:26:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 06:26:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 06:26:00 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 06:26:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElNEHAPPv37l6NTeCcLN1fIP6qaDuzufJ4BrMYLJvZkAevV27osKtjel9VDAwCmGmuBQAvkZz05dY4fjn2O72Ji0yHIyBca02q7HQhtfHG62OP+RG1Y6Q+zTT+vQ22m5YHBopYxW2rnn/idF0W7vu5QXx3hDoFmcg+vZWGk7nZgvaDJirvk1X+RdVjraJ/CXreRGcL3JiKG2YGN/IorZI6PRtN808vtNEV0Nr5GlSTslEA9Jlv7J4xhhfEziVhsNX/dlSh1nGdjJcIqWRZJEME1ZJr8NO9U0lgu2IgJ56R+T/AFLJUy9aaqOy2/iIkcO+hLkgd7d0gOBrPRMQ3kXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlwhkULP9YVZiP06a+GlWKcIV7lun7T77zc6z5lsYvM=;
 b=pvrHz4DKSp1wgK8w7G2/A+HdytItYELkJwOLu+R3fBi6DG+ynDz+ZWq/waQ/edvlEyhz9iZK2Vr82MqXuop8+4B5c7i33JF0lnwch/YQU9J/7n3j1t3XkQs1f1WYUrkzYE+jWnd3uZ/thJFckpWCGQ9Sn+wOdZ2KTVMOegskU0WjzOTtPT49NUUyI1Nbkvl/0hDhh0rPkwNOySNsXSDJ1vJkGMiRrytbqxsf1rueOdurjCSGaK7iejbMuEkexwVNM2BXgzrjTjoX7xpsH0+nV/JJZi6SlP9UWAtUOD9lPWofXem9XWuTQKdab92uyS5Tc+cZzvsaCKER16B6vyMVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Mon, 9 Mar
 2026 13:25:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 13:25:56 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] drm/xe/nvlp: Implement Wa_14026539277
In-Reply-To: <20260306190910.GZ52346@mdroper-desk1.amr.corp.intel.com>
References: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
 <20260306-extra-nvl-p-enabling-patches-v2-5-53dcfa6b44e4@intel.com>
 <20260306183953.GY52346@mdroper-desk1.amr.corp.intel.com>
 <87y0k4wzny.fsf@intel.com>
 <20260306190910.GZ52346@mdroper-desk1.amr.corp.intel.com>
Date: Mon, 9 Mar 2026 10:25:51 -0300
Message-ID: <87wlzl9lsw.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f024256-ce7a-4d25-e07b-08de7ddf650b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: zl3M2SCWswZwu7OPtyjKqEf6NeW/B35zp7Zm/oZfcqpHBSOGwzvNGilB6yrqPhc0wn3E+yDQATB6bkiUvzZa4yeAvQBOvl+cafGwArOyhfZxodqsqRdprRdnk8wjt4HlQr3K4g4amvfoideON5vWMK6Q6k8wyjFa8PD4HYIxIk0R3OTgi1jIx3vD1hwUGg3MYS4raLVHHjgsc9Wzc5Q5IhWOsJvfldRCc0l98ljLDONBZEhhdYAiW3IUvO5Q4O2yZwh2VtrxVlUsFBz3nVy27RM2wYnFXWRPIVMe0YnvnaFnC9bxkqi1hQVsQD+fGiXGl5Ts4GYCmoC0WWlX243y0fuAhPJgolv1R0f2lCISywUNkunNG516AA9MHIMESu6eu3Y+7OB/QWYIj2fzHYCEchGKy37L62Q72M3fKMMlU/U1K/IUeJsjmjyzgNpZ3zm/H7kGw9TLIs+mxNmbIRa1oo5/LJYlrX51fR+WhAUQIErgBe9auydw7AjgtUi9A9pFdnAGNUbsODQQUCqHha0xPh27J3H73qj94khuAl64x1Na3weGtvZJ7nWrWdVJbpyqm27KI7iIZEZrJJmxgXp5wrNR7oowPmcvQopdesnn58bFJjzLbCNEbpKx09bwWAujaXxaGOcYT+pp8U69cRsdaIV5VG8kbuzkJLyEhTeA10kmIXAwcSUunog2/ziJw6DQ1LaDXBWwll/R8Re+dXMzEww+l7g/+u/jTT/Hp984j1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4VRHlQ04y0AtsvkM4CJtf6RybP5J88o+r7HOQfv2Fj3LlaH1KMtLmcrREhkk?=
 =?us-ascii?Q?8oZec4kPBqdiQZ8li8v1j7hC2BBbumRzvym1PD+mKGQqswb2Q1gW7bQxEY4t?=
 =?us-ascii?Q?KcM+b3Ow7CDafkfwPhJk1tStOPflra2wgdlTPJd8fOn+JuCQ7A6aAl8BRWJb?=
 =?us-ascii?Q?Ik2gfiwB5uguAcmKLZb6pqgEgJZB0+aMaJhbN+FBjzP7ceQ6+BtxrPb6gLvF?=
 =?us-ascii?Q?nQEMg2l6a+yRtwkXtBqGC+IWV1CgVs1eVZRU07wfdkr0rtYfdjPc+p+g021N?=
 =?us-ascii?Q?3GguNZ82UYHoPoPu9sYg/rpTzno2clp/EbcafqSr1mYfPvxevcC9Huk+5XCd?=
 =?us-ascii?Q?8Hpi3BAcc58v1eD+1MnG6xwhgYk2abb08A+dHjQsKSeBj1Kf7LSeniUfIj+Q?=
 =?us-ascii?Q?vR1DVJWJX5YLi94YU0vlYcTydaWd9N2OepwXN+Ico5O43RkxPhPcGUAGZzVw?=
 =?us-ascii?Q?fw9oYp8UoA7iGBIiUKTLqHOImltiJpidKXNoGbwU7qsxIU+9NZVu5Z80qpxv?=
 =?us-ascii?Q?VbBbd/Grd3irXtlH0ogGJovvYww4zFWLz72xhWWf+PDOGCxIQP0WMFcVS3J+?=
 =?us-ascii?Q?fI6YsOVc0TutEymbrwmsPf+38C5RvRtQKXGjsTBUOv2ci8FAzqwfc29+IRqj?=
 =?us-ascii?Q?zH38ywSy6CCFKYRBeRdj3SEmiV9fFR2JXGGzZf2WJbuKgmLV2oyOhjyN1cz1?=
 =?us-ascii?Q?G3iv3VCWsEgo4zeL3DVJZAiBmRvYP2xjiLqxq3Bj4EcWe+cz36DiHxiehXQ9?=
 =?us-ascii?Q?b+v+Rv8bYoTJbIUCdBtl0OYiM+IDrPUW5cqOyD+/JnMACxccw8FEAy9aoQKU?=
 =?us-ascii?Q?LPyiATybuGNtaxI2ayFS/evpaKVIFRuY0JpzhfV1Lwspy1mC03Jq2BmwahQ/?=
 =?us-ascii?Q?j6BKrR7S5LkzUVbIroHqWT5ScopD9N3/wUx0pMtFiNJgRQmTjw2rGACcQ9rV?=
 =?us-ascii?Q?sDQEr2/ic853P8X/8fF9fx/FoAbRYUzSAqvhB4sIzYUBuHJcdbf67/3ZGoVK?=
 =?us-ascii?Q?MzrhCCjmfXgB5YcnQtLJCO6bs+2Wc5yti+FbmBlrN/U40O+IFpk5odhzgnbf?=
 =?us-ascii?Q?gEaIiK/TRWmCGj64A4z+GZg7KqREmQxv3bzy5KNvAj87ygpvClvS19b9xAsa?=
 =?us-ascii?Q?JlAsmTLAGjHI0XnLGGKsYHfxuzM8hG03zbhKb97DwB2SB1l4zxIj7RD/KzJw?=
 =?us-ascii?Q?iBiF/9IQanAej71Eea6LWtFWZ9BdDzLCkxCD33+XNATsYaNS3rJkiVA41tim?=
 =?us-ascii?Q?oJV/tATF+xsAdSfcGBUraUUbGAvhnKOr8gL9eB43XZd1E1g61wj7YeP9ItKW?=
 =?us-ascii?Q?unRm3V79EHSiYkqp4XLcp57H6Cd5P9l1NbWVB7myUCfagy7tZkW8zXEMBgm2?=
 =?us-ascii?Q?UJjrn943LpnY1jsMLZymx/9NnLaaTAjXz5Y09ckE8+cnxkqNRlmizR4LmuhV?=
 =?us-ascii?Q?TNVUIqICSgZNlMqVvmYwMbxk9xPf6zWjkbWRgujF3R0bAQv5aciYdaqyqMHS?=
 =?us-ascii?Q?bJuaqLhSVjNI0rbM6My+Bn+pjJGS5OgNlPyLOslFY2iBW1ETyS1Bu8TcHEGi?=
 =?us-ascii?Q?/bgUTk+gVwRsis0qH3ddEvPTyIipzJ2hEHGURwmpHTPeLZkLivSEQS7Np+Pu?=
 =?us-ascii?Q?MP5rPqxMSjDYeqhd0NIyuoDvbH3ODPRNyIFYz4Q+I4qYN9/2gi/EJOUYlV2g?=
 =?us-ascii?Q?FGfy1mD0CEEilIyBPO/iycDsFxp90n/mV5ah/5BPuK0YGm3YnHuDsL1QnXC2?=
 =?us-ascii?Q?svkTwU/cZA=3D=3D?=
X-Exchange-RoutingPolicyChecked: NH8LcPeTZCnq0xy08rtPk+Gy/P5mBWp4/DCLkbexV9YFt5LHSckiSv1fBcNdnC1Amcy3Sh8gtZkBWOnqz+0B8f4z48zH9hn62o8CE3LARiqYE+akcspfvow6I+pA88yZk9YayLiPxXHNe771wkatkbgPN7yQGei+ib3agcqOLXTtdtoTHM6zCh2Gr6QkE+JxyAeYmDcyTfoG4GE7FE20DQWLPMMu2mr3GF44ARkIFGf+gZj6guSxgnPuUV/y161d8nOEymmKeMSZ6JmT8i/Lh+VazeYhpU44fGaBdtIkE+wIRj9AG70/+zJS1yNHelmQCSol5uCyR7Kwu/KYjRM5ag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f024256-ce7a-4d25-e07b-08de7ddf650b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 13:25:56.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBbsSon+Sffr0Gmtat1OsEmbVq9boYuJC9bdgSm/e8Jk/tVipb+GJ4NHxEDlgUeMHRfb9mDO+AY18lwzwPHMHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Fri, Mar 06, 2026 at 04:01:05PM -0300, Gustavo Sousa wrote:
>> Matt Roper <matthew.d.roper@intel.com> writes:
>> 
>> > On Fri, Mar 06, 2026 at 02:28:25PM -0300, Gustavo Sousa wrote:
>> >> Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
>> >> The KMD implementation is just one component of the workaround, which
>> >> also depends on Pcode to implement its part in order to be complete.
>> >> 
>> >> v2:
>> >>   - Add FUNC(xe_rtp_match_not_sriov_vf) to skip applying the workaround
>> >>     to SRIOV VFs. (Matt)
>> >> 
>> >> Cc: Matt Roper <matthew.d.roper@intel.com>
>> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
>> >>  drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
>> >>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 ++
>> >>  3 files changed, 33 insertions(+)
>> >> 
>> >> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >> index 66ddad767ad4..a83cafbe03fd 100644
>> >> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >> @@ -452,6 +452,10 @@
>> >>  
>> >>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
>> >>  
>> >> +#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
>> >> +#define   CECTRL				REG_GENMASK(2, 1)
>> >> +#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
>> >> +
>> >>  #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
>> >>  
>> >>  #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
>> >> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> >> index b455af1e6072..3c8692f9b8cf 100644
>> >> --- a/drivers/gpu/drm/xe/xe_gt.c
>> >> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> >> @@ -450,6 +450,25 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>> >>  	return err;
>> >>  }
>> >>  
>> >> +static void xe_gt_wa_14026539277(struct xe_gt *gt)
>> >> +{
>> >> +	u32 val;
>> >> +
>> >> +	if (!XE_GT_WA(gt, 14026539277))
>> >> +		return;
>> >> +
>> >> +	/*
>> >> +	 * L2COMPUTESIDECTRL has a specific offset for media and the GSI offset
>> >> +	 * does not apply.
>> >> +	 */
>> >> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>> >> +
>> >> +	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
>> >> +	val &= ~CECTRL;
>> >> +	val |= CECTRL_CENODATA_ALWAYS;
>> >> +	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
>> >> +}
>> >> +
>> >>  int xe_gt_init_early(struct xe_gt *gt)
>> >>  {
>> >>  	int err;
>> >> @@ -575,6 +594,14 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>> >>  	 */
>> >>  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>> >>  
>> >> +	/*
>> >> +	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
>> >> +	 * as an entry in gt_was[]) because we would get the hardware already in
>> >> +	 * a bad state by the time it would be applied.  Hence, we implement it
>> >> +	 * as an OOB workaround and apply it early to prevent that.
>> >> +	 */
>> >> +	xe_gt_wa_14026539277(gt);
>> >> +
>> >>  	return 0;
>> >>  }
>> >>  
>> >> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> >> index 80b54b195f20..03a0bf0aeb6e 100644
>> >> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> >> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> >> @@ -58,3 +58,5 @@
>> >>  
>> >>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>> >>  		GRAPHICS_VERSION_RANGE(2004, 3005)
>> >> +
>> >> +14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510), FUNC(xe_rtp_match_not_sriov_vf)
>> >
>> > I don't think it's right that we have both platform matches and IP
>> > matches here; that's not something that should usually happen because
>> > the workaround is either tied to the platform (NVL) or tied to the IP
>> > (Xe3p_LPG).  For device workarounds, the handling in our graphics
>> > workaround database can be a bit confusing since what we're looking at
>> > is really just a proxy/placeholder ticket for something that was filed
>> > in a different database originally.  Due to how the databases work, they
>> > have to slap some IP release on the proxy ticket, but in this case we
>> > don't need to add a match for those to our driver rules; just the
>> > platform information is sufficient.
>> >
>> > That would also mean that this should probably be an XE_DEVICE_WA()
>> > rather than an XE_GT_WA() and the workaround function we're adding here
>> > should be renamed.
>> 
>> Hm... But are we meant to apply the programming to the media GT as well?
>> I thought the issue for this workaround was observed only on the primary
>> GT.
>> 
>
> Device workarounds operate on the xe_device rather than on any xe_gt.
> So if a device workaround asks you to do something with with GTs, you
> need to extract the relevant GTs from the device.  Novalake is
> single-tile, so in this case we'd do something like
>
>      struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
>
> to grab the primary GT if that's what we're supposed to be working
> with.

Or simply loop over GTs and only apply to primary GTs? I prefer this
because it abstracts away the assumption of a single tile/primary GT
(even though we know this applies only to NVL-P and is unlikely to be
needed in other platforms).

>
>> So, should we make this a device workaround and add then make sure that
>> we apply it only on the primary GT in the function that implements it?
>> 
>> We will probably need to rework device OOB workarounds in
>> order to make this change, because stepping information is not ready by
>> the time device OOB workarounds are matched (i.e. when
>> xe_wa_process_device_oob() is called before we read the stepping
>> information into the device info).
>
> I guess we should just move the device stepping determination earlier.
> Figuring out the platform stepping only requires information from the
> PCI config space so it should be possible to do before anything else in
> the driver (i.e., we don't even need the MMIO BARs mapped yet to be able
> to determine the platform stepping --- and in theory there could be
> device workarounds that need to be taken into account during the very
> earliest parts of driver initialization).

Yep, sounds good.

I'm also going to need to make sure that xe_wa_process_device_oob() is
called after xe_sriov_probe_early(), because of
FUNC(xe_rtp_match_not_sriov_vf).

I'm wondering if it would be a good idea to have OOB workarounds being
checked lazily because of these ordering issues.  Not sure though, since
it would require more storage if we want to continue caching the results
in the bitmask (it would need an extra bitmask to check if it was alreay
evaluated); and also it adds some level of unpredictability, since there
would not be specific point where we would know workarounds are all
checked.

Another option is making sure we raise warnings for anything that is not
yet "ready" to be checked by the time a workaround check is done.  It
appears xe_device_sriov_mode() already contains an assert that would
cover that (although we could also have one specific for
xe_rtp_match_not_sriov_vf, to be safe), but I don't think the other
match functions contain that yet.

I think I like this last one better.

--
Gustavo Sousa

>
>
> Matt
>
>> 
>> --
>> Gustavo Sousa
>> 
>> >
>> >
>> > Matt
>> >
>> >> 
>> >> -- 
>> >> 2.52.0
>> >> 
>> >
>> > -- 
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
