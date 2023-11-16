Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A7AC072A2
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 03:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC5910E246;
	Thu, 16 Nov 2023 03:32:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4C210E246
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700105549; x=1731641549;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OGPx7nHPKFHKlFT59ljTT5rRyd67S5XDQ/LlXvtKTXs=;
 b=d1eiAvUH5bei6iu3WMUXSlHhjk0Vi+hZuIF4tCvmsseuaIYVdaBuOkQA
 MGe4nRymKUi8rbmerziSs8BLerNJy8pNv3FpHlEq3r0vCopda3PBLI6h8
 WiXlGapdVwwXmgAx/li+pYfSxhFgJiGeza3nbKkwY30vNB+fUnsmV7w77
 TJTcgEsJdJSEWcFmpAk+Ci545s5i2Z83SjqEamNStNCzQHOriDmxoMlOL
 Hl4ydiZAPa1PRfdSQeXA25ik9xkbcwg+lxXHrsKPiyEqUgFxyJ7tBlS4k
 vJ61YIoLDHld9hnxjvhhNYgqPg+krZ9OMz2VAxrdA1VWVtk2crqJz3N4c Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12558704"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="12558704"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:32:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908987868"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="908987868"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 19:32:28 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 19:32:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 19:32:28 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 19:32:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3Erc3Gqmv7PuiGuqiz58SSJp9pjxJbuCHVzJaCM/a6hr/cjph53NrCEY4cwtySDpbTsWLitKDM4a9Et9lzzr0y5GXoZniEbf6fD1m0rJKsinkBU0BcIJk/XL2kBedWhKGU+ICru8huEKGn3831MR0dcLgZZf3G0wqFXDb4rXa1pxYt3AhRUOkaKZ5/MGXg+kKgkumGmFxTkueHICdHuw/j7Brae4PNDK/M88ASuQqpDM4Cb+2Kt9v2J3QP4uMQTEQAft2MMd6nKCzprqatSsEjWYFwvuhgFyxLgZiRPkYq2ZB+XsokXRKkvYbuKamTd2H3boAd8I4dKXD+LXdhbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+EtXRWWdydlxuVN/PsUTAOdyq8h+NA3gnGjuAv3p58=;
 b=VHBfgK7CvZQG/yGxL/xY8PThp2/lWXt15IT/KmP6XaxhVUmfdzUn7/Bk5e9lT4FUi/310ZlMgJ1PA8Q3cRMUezE6wSGtQn/aiCmQcaZAXdjKyR5C46jXgLIGvifB7vOmiQ/DlW4wlJOa6fBmyj0Ng5yl12y6U4XDR8uLbC+TbNclFGsIOYaO4TgSIiKQGAc2b2q4C7WF/+g27TkYfl7CeA/AOZaJPpSSHEZgo0p9z+y+xots2yfudEZzecpG3xQKq7aWh9QnYLCOgPjY1jnhDiB71PptoQrGqt5W7xtorCCLA8sqIMsDCHIuJ5uUvfGYaOxq9XJ7Zyb8Yz+l0C14Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 03:32:25 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.6954.028; Thu, 16 Nov 2023
 03:32:23 +0000
Date: Wed, 15 Nov 2023 19:32:19 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZVWNQ3/c1WUf4iAe@nvishwa1-DESK>
References: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
 <20231114004604.4439-2-niranjana.vishwanathapura@intel.com>
 <20231115005351.GE1327160@mdroper-desk1.amr.corp.intel.com>
 <ZVWMPdGzCDOeZFon@nvishwa1-DESK>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVWMPdGzCDOeZFon@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::25) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MN6PR11MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: cf052ce8-5823-4b8e-e6c0-08dbe654a502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NuUM3HU9eSND/9VOtQgu85UHibYT3mn+jRat7ti0+Tx5pXJe3eVVToY0o0WGC1E7Nf5xmR4Jf0x/wtuJ4NQW8lnNCnvkTT/ftsdLgPZC9jdZ4EubUSsnj+mnk8m4SH7BF5fvKQISA1zysaeqfSk9thiEG5XDgWIqzfIXlNyl1tkwcajSkPaGtKEgIi5FeZpIl0kcE21wAcjBsOG5pxA0co79ztGQLRlRIja/PjOmyfX8GEudaOd9OhfV3tBpQPKzlcArZ4twiCx1bOVNmIe9L0Iow0bfjgbHK3XUTDXV18lJs9brULpsLb9ols357SGRsSQZ0so2tKIQ+HBkTR6dQAKN3xCySBAX0ZkodqEg+p+vEe9CbOyGjk0/aI6+lr1D6VSVOxa5Zuw7hTW85pKB4r7JQr8enn9MfrnAwKCmhZCkSwABZ8t2s4y66AjUT+PM5kixJU+Hl/1wHbBF8GT+O7hu2xQMVVEsMcM4skLdIzGDe9s8kb1+VwJdCNQFByHaFHza5L7gTNHawvRJFxU4nW1owLSsZY/vGNqvtXY+ReP0pH9+mgjDnM5iIOL8LiaI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6666004)(6506007)(83380400001)(38100700002)(26005)(82960400001)(6512007)(9686003)(2906002)(5660300002)(6862004)(30864003)(8936002)(41300700001)(86362001)(8676002)(44832011)(66476007)(66556008)(4326008)(66946007)(6636002)(316002)(6486002)(478600001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MvDP1CNMZLN6W2QPEgvp2QfMAoc8Af9dC7BXZf4W0OPxp5XP/J/nCq0cNT?=
 =?iso-8859-1?Q?aGj1xB3e/maajDx1/5fR911gx1hwPLRwxLNSsXz3heOvvy6gLhCtdcOKCa?=
 =?iso-8859-1?Q?mrRPaGH5bAhtVFjqdLSiLt9oOSxjpBP4StrnhGaiffRpcyGw08ZVZszQfW?=
 =?iso-8859-1?Q?YbYv8B1+pwsfBIwd569yQidJD962tqiCpkY6Fu38Ap6otgZXChFhe8z97/?=
 =?iso-8859-1?Q?55yqjVn0VVqE4OOwD2P37poYb0XOxdjD5CuG6+Iv7slImd+83DoL7yS6aI?=
 =?iso-8859-1?Q?gs7r+dMUcm0/qTG18rMuhTqJSVLraBgPiLk5h9yakSjnLyuo9Ugq+zbOOV?=
 =?iso-8859-1?Q?PnahGwVI7Z0JztxzZ7Z+1mLbLUa5xl1bMTdfmpxCJLKmnudty1vMIetcCq?=
 =?iso-8859-1?Q?GSyU2dZU3bw8+3+TKZmYfXxB/1603NJxzm/e+PouOFWHx+ShVBbKnI0ggo?=
 =?iso-8859-1?Q?Fpuc8hd8RbeE7Qrvby9tJ4a6NTfzrj9SxlGBmiyYXmF0vVVZA0Ugde1JXL?=
 =?iso-8859-1?Q?J6OuFGSjFu/iY25itjl390VvG1GN+nLnwyTjBz1jskOBqMr+9OWnzJc591?=
 =?iso-8859-1?Q?AHNreSiZ0tZmeAp3mBmCPNlVN0xoQs1fS2EtdIeXySFWasOQGqCNs404sp?=
 =?iso-8859-1?Q?+luYugTLYYR7kXNT7G/LmFx7AlUsuElMF1BIzb5sAinzp2eX4ZiiJ2MPLd?=
 =?iso-8859-1?Q?h5PjFJ92/2rl8HSg3aW6pb62rsVBc1iNiepP8qdhCRzdCJQAG6Gu3tz4Vv?=
 =?iso-8859-1?Q?Stki7DYNtnwoquXKW6ZOSezMQwjOLIdxou2YIN+PeEefJ/iMMdL46g2ixy?=
 =?iso-8859-1?Q?nVjIy/S6g1NPXoCsSZfxhVYglJ8aWQRG7sYKqIXkzobRyuJoW67IaTwU6R?=
 =?iso-8859-1?Q?iYnWGHpqoTMsVODb/8Rh7Wdf1/Sft2jEE7frOropLMBW0ZwELFdh+K191r?=
 =?iso-8859-1?Q?mnm08Ul3Y0gn9MhuLxyRpCSJvDCdq1AIowhMWfGudql256I0IlipVhHXXc?=
 =?iso-8859-1?Q?tK8wFfEibrczdRIo4VX1ltNWO+N2RaRApwF6gFPtIWd87dK3sTv05SRL46?=
 =?iso-8859-1?Q?Wo+ffjpt9+dch7YXo64ezYVSLwJ+NKbCecA6ersGcufAaubr9tK2aPu4x5?=
 =?iso-8859-1?Q?JHiqTwxoo4pk6H95imDXy9wAbc2wI2mwc/NZt6s/F6zN7N/C95+mLC8Ox4?=
 =?iso-8859-1?Q?qD2lBWu9RS7dNR9LLDcoh1DUN0yRDJdLB/3M28ibKqh2UPueMxgjM6GNDn?=
 =?iso-8859-1?Q?jJnxxnqCpcLvcE1F3xJ21IiHO31Kc3itvMtZx2MtRHEbt3iE2RkFlOJL8G?=
 =?iso-8859-1?Q?iI9mGd8jGbvsPktRP2P4js72bXa1xp7xuimiMjocZZQwhidZZtYbQv5JZ8?=
 =?iso-8859-1?Q?KCxqtCfd33pxs5UPSLsbb/7NBq86rEjoA63hs0GJq6NhPshFUSrZbjlxNE?=
 =?iso-8859-1?Q?FlNsOs0i0R8ThNWO8Pj0ZFg8W2EYxKzS86n+AJUxo+wvVKW+jvhIxaIJj9?=
 =?iso-8859-1?Q?0v8JtyAN3RONaWhW4ukCJ0g/Tdibq2FkIhzIfiPAGI8nmhoHeBI0sAEb/P?=
 =?iso-8859-1?Q?6ZNoO1Iyb0Q0kdAVO67AiYaf/oa6hJnY19cP4notKSNIdCjZmdS+kBloRL?=
 =?iso-8859-1?Q?mdDB0Ypp28UxtPYgnfe/SsJgI4gcPZjaRBjt13sK9d6qSvE26gvA2gnTLz?=
 =?iso-8859-1?Q?gBnlfj2o88eWiZ2sTqo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf052ce8-5823-4b8e-e6c0-08dbe654a502
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 03:32:23.5474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtNoMxzra3/6iLEETPCR78PmPhLhwgZ6z05thL0BZj/LAFnz8VZSVYwMuednzy9YOaUNdnRpPPT+W+WGNRAduhkeA0QDFM2qExdAg144whqWeiidpqbJC/X/E31WLuLj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v3 1/2] drm/xe: Enable Fixed CCS mode setting
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

On Wed, Nov 15, 2023 at 07:27:57PM -0800, Niranjana Vishwanathapura wrote:
>On Tue, Nov 14, 2023 at 04:53:51PM -0800, Matt Roper wrote:
>>On Mon, Nov 13, 2023 at 04:46:03PM -0800, Niranjana Vishwanathapura wrote:
>>>Disable dynamic HW load balancing of compute resource assignment
>>>to engines and instead enabled fixed mode of mapping compute
>>>resources to engines.
>>
>>Since the code below is only doing this for PVC and not for other
>>platforms like DG2/ATS-M, we should clarify that in the commit message.
>>And also, this setting is mandatory on PVC due to Wa_16016805146 so we
>>probably want to state that as well so that nobody gets confused down
>>the road and thinks this was an optional / arbitrary decision.
>>
>
>Ok, will add
>
>>>
>>>By default enable only one CCS engine with all compute slices
>>>assigned to it. This seems to be the desired configuration for
>>>common workloads.
>>>
>>>Allow user to configure this CCS mode setting through a 'ccs_mode'
>>>sysfs entry.
>>
>>I'm wondering if we should break out the sysfs stuff to a separate
>>commit.  Do the UMDs already have their support ready that's necessary
>>for us to land this new uapi in the KMD?
>>
>
>Ok, will move it a separate patch here

And looks like compute UMD folks are OK with this change as by default
compute driver should work without any change (with default ccs_mode config).
The ccs_mode update through sysfs interface is an admin job when there
are drm clients anyhow.

Niranjana

>
>>>
>>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>---
>>> drivers/gpu/drm/xe/Makefile          |  1 +
>>> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++
>>> drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
>>> drivers/gpu/drm/xe/xe_gt.h           |  2 +
>>> drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 73 ++++++++++++++++++++++++++++
>>> drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 +++++++++
>>> drivers/gpu/drm/xe/xe_gt_sysfs.c     | 53 ++++++++++++++++++++
>>> drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++
>>> drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
>>> drivers/gpu/drm/xe/xe_hw_engine.c    | 20 ++++++++
>>> 10 files changed, 212 insertions(+)
>>> create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>> create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>>
>>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>index a1a8847e2ba3..dab5c9a8ad44 100644
>>>--- a/drivers/gpu/drm/xe/Makefile
>>>+++ b/drivers/gpu/drm/xe/Makefile
>>>@@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>>> 	xe_force_wake.o \
>>> 	xe_ggtt.o \
>>> 	xe_gt.o \
>>>+	xe_gt_ccs_mode.o \
>>> 	xe_gt_clock.o \
>>> 	xe_gt_debugfs.o \
>>> 	xe_gt_idle_sysfs.o \
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>index cc27fe8fc363..576b72000ae9 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>@@ -395,8 +395,22 @@
>>> #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>>>
>>> #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>>>+#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>>> #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>>>
>>>+/*
>>>+ * Total of 4 cslices, where each cslice is in the form:
>>>+ *   [0-3]     CCS ID
>>>+ *   [4-6]     RSVD
>>>+ *   [7]       Disabled
>>>+ */
>>>+#define CCS_MODE				XE_REG(0x14804)
>>>+#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>>>+#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>>>+#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>>>+#define   CCS_MODE_CSLICE(cslice, ccs) \
>>>+	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))
>>>+
>>> #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>>> #define   FORCEWAKE_KERNEL			BIT(0)
>>> #define   FORCEWAKE_USER			BIT(1)
>>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>index 6c885dde5d59..1f9b678fc530 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>>@@ -21,6 +21,7 @@
>>> #include "xe_execlist.h"
>>> #include "xe_force_wake.h"
>>> #include "xe_ggtt.h"
>>>+#include "xe_gt_ccs_mode.h"
>>> #include "xe_gt_clock.h"
>>> #include "xe_gt_idle_sysfs.h"
>>> #include "xe_gt_mcr.h"
>>>@@ -451,6 +452,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>> 	if (err)
>>> 		goto err_force_wake;
>>>
>>>+	/* Configure default CCS mode of 1 engine with all resources */
>>>+	if (xe_gt_ccs_mode_enabled(gt)) {
>>>+		gt->ccs.num_engines = 1;
>>>+		xe_gt_apply_ccs_mode(gt);
>>>+	}
>>>+
>>> 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>> 	XE_WARN_ON(err);
>>> 	xe_device_mem_access_put(gt_to_xe(gt));
>>>@@ -553,6 +560,9 @@ static int do_gt_restart(struct xe_gt *gt)
>>> 		xe_reg_sr_apply_whitelist(hwe);
>>> 	}
>>>
>>>+	/* Get CCS mode in sync between sw/hw */
>>>+	xe_gt_apply_ccs_mode(gt);
>>>+
>>> 	return 0;
>>> }
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>index caded203a8a0..1c2a1d35a2c1 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt.h
>>>@@ -17,6 +17,8 @@
>>> 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>>> 			  xe_hw_engine_is_valid((hwe__)))
>>>
>>>+#define CCS_MASK(gt) ((gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>>>+
>>> #ifdef CONFIG_FAULT_INJECTION
>>> extern struct fault_attr gt_reset_failure;
>>> static inline bool xe_fault_inject_gt_reset(void)
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>>new file mode 100644
>>>index 000000000000..fcbdc13df46e
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>>@@ -0,0 +1,73 @@
>>>+// SPDX-License-Identifier: MIT
>>>+/*
>>>+ * Copyright © 2023 Intel Corporation
>>>+ */
>>>+
>>>+#include "regs/xe_gt_regs.h"
>>>+#include "xe_assert.h"
>>>+#include "xe_gt.h"
>>>+#include "xe_gt_ccs_mode.h"
>>>+#include "xe_mmio.h"
>>>+
>>>+static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>>+{
>>>+	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>>>+	struct xe_device *xe = gt_to_xe(gt);
>>>+	struct xe_hw_engine *hwe;
>>>+	int num_slices = hweight32(CCS_MASK(gt));
>>>+	int width, cslice;
>>>+	enum xe_hw_engine_id id;
>>>+	u32 config = 0;
>>>+
>>>+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>>>+
>>>+	xe_assert(xe, num_engines && num_engines <= num_slices);
>>>+	xe_assert(xe, !(num_slices % num_engines));
>>>+
>>>+	/*
>>>+	 * Loop over all available slices and assign each a user engine.
>>>+	 *
>>>+	 * With 1 engine (ccs0):
>>>+	 *   slice 0, 1, 2, 3: ccs0
>>>+	 *
>>>+	 * With 2 engines (ccs0, ccs1):
>>>+	 *   slice 0, 2: ccs0
>>>+	 *   slice 1, 3: ccs1
>>>+	 *
>>>+	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
>>>+	 *   slice 0: ccs0
>>>+	 *   slice 1: ccs1
>>>+	 *   slice 2: ccs2
>>>+	 *   slice 3: ccs3
>>>+	 */
>>>+	for (width = num_slices / num_engines, cslice = 0; width--;) {
>>>+		for_each_hw_engine(hwe, gt, id) {
>>>+			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
>>>+				continue;
>>>+
>>>+			if (hwe->logical_instance >= num_engines)
>>>+				break;
>>>+
>>>+			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
>>>+
>>>+			/* If a slice is fused off, leave disabled */
>>>+			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>>>+				cslice++;
>>>+
>>>+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>>>+			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
>>>+			cslice++;
>>>+		}
>>>+	}
>>
>>Maybe it's just me, but the above seems somewhat hard to follow (even
>>though I think it's correct).  I think an alternate implementation could
>>be done with bitmap operations (untested):
>>
>>   unsigned long cslice_mask = CCS_MASK(gt);
>>   unsigned long logical_usable = GENMASK(num_engines - 1, 0);
>>   unsigned long physical_usable = 0;
>>
>>   xe_assert(num_engines && num_engines <= hweight32(cslice_mask));
>>
>>   bitmap_onto(&physical_usable, &logical_usable, &cslice_mask, 4);
>>   for_each_set_bit(cslice, &cslice_mask, 4) {
>>           int ccs = bitmap_bitremap(cslice, &cslice_mask, &physical_usable, 4)
>>
>>           mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>>           mode |= CCS_MODE_CSLICE(cslice, ccs);
>>   }
>>
>>I'm not sure whether that winds up being more or less readable in the
>>end.
>>
>
>Yah, it looks pretty neat once those bitmap functions are understood.
>But unfortunately, those bitmap functions are only defined under CONFIG_NUMA
>(not sure why). I don't want to bring that dependency here for now. May be
>we can ask maintainers to move it out of CONFIG_NUMA?
>
>>>+
>>>+	xe_mmio_write32(gt, CCS_MODE, mode);
>>>+
>>>+	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>>>+		   mode, config, num_engines, num_slices);
>>>+}
>>>+
>>>+void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>>>+{
>>>+	if (gt->ccs.num_engines)
>>>+		__xe_gt_apply_ccs_mode(gt, gt->ccs.num_engines);
>>>+}
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>>new file mode 100644
>>>index 000000000000..2f3352173e7b
>>>--- /dev/null
>>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>>@@ -0,0 +1,22 @@
>>>+/* SPDX-License-Identifier: MIT */
>>>+/*
>>>+ * Copyright © 2023 Intel Corporation
>>>+ */
>>>+
>>>+#ifndef _XE_GT_CCS_MODE_H_
>>>+#define _XE_GT_CCS_MODE_H_
>>>+
>>>+#include "xe_device_types.h"
>>>+#include "xe_gt.h"
>>>+#include "xe_gt_types.h"
>>>+#include "xe_platform_types.h"
>>>+
>>>+void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>>>+
>>>+static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>>>+{
>>>+	return GRAPHICS_VERx100(gt_to_xe(gt)) == 1260 && CCS_MASK(gt);
>>>+}
>>>+
>>>+#endif
>>>+
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>>index c69d2e8a0fe1..e53221c2894f 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>>+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>>>@@ -10,7 +10,11 @@
>>>
>>> #include <drm/drm_managed.h>
>>>
>>>+#include "regs/xe_gt_regs.h"
>>> #include "xe_gt.h"
>>>+#include "xe_gt_ccs_mode.h"
>>>+#include "xe_gt_printk.h"
>>>+#include "xe_mmio.h"
>>>
>>> static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>> {
>>>@@ -29,6 +33,50 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
>>> 	kobject_put(gt->sysfs);
>>> }
>>>
>>>+static ssize_t
>>>+ccs_mode_show(struct device *kdev,
>>>+	      struct device_attribute *attr, char *buf)
>>>+{
>>>+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>>>+
>>>+	return sysfs_emit(buf, "Enabled compute engines %d; Number of compute slices %d\n",
>>>+			  gt->ccs.num_engines, hweight32(CCS_MASK(gt)));
>>>+}
>>>+
>>>+static ssize_t
>>>+ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>>+	       const char *buff, size_t count)
>>>+{
>>>+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>>>+	u32 num_engines, num_slices;
>>>+	int ret;
>>>+
>>>+	ret = kstrtou32(buff, 0, &num_engines);
>>>+	if (ret)
>>>+		return ret;
>>>+
>>>+	/*
>>>+	 * Ensure number of engines specified is valid and there is an
>>>+	 * exact multiple of engines for slices.
>>>+	 */
>>>+	num_slices = hweight32(CCS_MASK(gt));
>>>+	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
>>>+		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
>>>+			  num_engines, num_slices);
>>>+		return -EINVAL;
>>>+	}
>>>+
>>>+	if (gt->ccs.num_engines != num_engines) {
>>>+		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>>>+		gt->ccs.num_engines = num_engines;
>>>+		xe_gt_reset_async(gt);
>>>+	}
>>>+
>>>+	return count;
>>>+}
>>>+
>>>+static DEVICE_ATTR_RW(ccs_mode);
>>>+
>>> void xe_gt_sysfs_init(struct xe_gt *gt)
>>> {
>>> 	struct xe_tile *tile = gt_to_tile(gt);
>>>@@ -52,6 +100,11 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>>
>>> 	gt->sysfs = &kg->base;
>>>
>>>+	if (GRAPHICS_VERx100(xe) == 1260 &&
>>>+	    sysfs_create_file(gt->sysfs, &dev_attr_ccs_mode.attr))
>>>+		drm_warn(&xe->drm,
>>>+			 "Sysfs creation for ccs_mode setting failed\n");
>>>+
>>> 	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>> 	if (err) {
>>> 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>>index d3f2793684e2..ab1740005600 100644
>>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>@@ -185,6 +185,20 @@ struct xe_gt {
>>> 		spinlock_t lock;
>>> 	} tlb_invalidation;
>>>
>>>+	/**
>>>+	 * @ccs: Fixed mapping between CCS engines and compute slices.
>>>+	 * Through the per-tile 'ccs_mode' sysfs interface, the user can specify a
>>>+	 * fixed number of compute hardware engines to which the available compute
>>>+	 * slices are to be allocated. By default all compute slices are allocated
>>>+	 * to the first available compute engine instance. This user configuration
>>>+	 * change triggers a tile reset and it is expected that user will ensure
>>>+	 * the tile is idle while doing so.
>>>+	 */
>>>+	struct {
>>>+		/** @num_engines: Number of CCS engines enabled */
>>>+		u32 num_engines;
>>>+	} ccs;
>>
>>Just because the term "ccs" at the GT is a bit overloaded, I wonder if
>>we should pick some name that makes it clear that this is referring to
>>CCS engines and not to CCS compression.  E.g., maybe make the structure
>>"ccs_engines" and the field "num_active" or something like that?
>>
>
>Ok, will change it to ccs_mode.
>
>Niranjana
>
>>
>>Matt
>>
>>>+
>>> 	/** @usm: unified shared memory state */
>>> 	struct {
>>> 		/**
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>index 88789826e781..b6be7a7ad76a 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>@@ -12,6 +12,7 @@
>>> #include "regs/xe_guc_regs.h"
>>> #include "xe_bo.h"
>>> #include "xe_gt.h"
>>>+#include "xe_gt_ccs_mode.h"
>>> #include "xe_guc.h"
>>> #include "xe_hw_engine.h"
>>> #include "xe_lrc.h"
>>>@@ -454,6 +455,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>> 		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
>>> 		{ .reg = RING_IMR(hwe->mmio_base),			},
>>> 		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
>>>+		{ .reg = CCS_MODE,
>>>+		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_ccs_mode_enabled(hwe->gt) },
>>> 	};
>>> 	u32 i;
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>index e831e63c5e48..4f41699f95ec 100644
>>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>@@ -16,6 +16,7 @@
>>> #include "xe_execlist.h"
>>> #include "xe_force_wake.h"
>>> #include "xe_gt.h"
>>>+#include "xe_gt_ccs_mode.h"
>>> #include "xe_gt_topology.h"
>>> #include "xe_hw_fence.h"
>>> #include "xe_irq.h"
>>>@@ -283,6 +284,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>>> 	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>>> }
>>>
>>>+static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>>>+						 const struct xe_hw_engine *hwe)
>>>+{
>>>+	return xe_gt_ccs_mode_enabled(gt) &&
>>>+	       xe_rtp_match_first_render_or_compute(gt, hwe);
>>>+}
>>>+
>>> void
>>> xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>> {
>>>@@ -307,6 +315,12 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>> 				 blit_cctl_val,
>>> 				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>> 		},
>>>+		/* Use Fixed slice CCS mode */
>>>+		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
>>>+		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
>>>+		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
>>>+					   RCU_MODE_FIXED_SLICE_CCS_MODE))
>>>+		},
>>> 		{}
>>> 	};
>>>
>>>@@ -841,6 +855,12 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>>> 	if (hwe->class == XE_ENGINE_CLASS_OTHER)
>>> 		return true;
>>>
>>>+	/* Check for engines disabled by ccs_mode setting */
>>>+	if (xe_gt_ccs_mode_enabled(gt) &&
>>>+	    hwe->class == XE_ENGINE_CLASS_COMPUTE &&
>>>+	    hwe->logical_instance >= gt->ccs.num_engines)
>>>+		return true;
>>>+
>>> 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>>> 		hwe->instance == gt->usm.reserved_bcs_instance;
>>> }
>>>--
>>>2.21.0.rc0.32.g243a4c7e27
>>>
>>
>>-- 
>>Matt Roper
>>Graphics Software Engineer
>>Linux GPU Platform Enablement
>>Intel Corporation
