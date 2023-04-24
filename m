Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE7AC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 15:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2210E1D3;
	Mon, 24 Apr 2023 15:32:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0759410E1D3
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682350330; x=1713886330;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9OYxs50aXq9si1nGaf9eMo71cTXxtd2oSt9sW6ltmDA=;
 b=b66DnHWKFBFo1LCp8MuT03MUbn7R/PaG1M1l9qqCjtHbcJjfvPiI5k21
 T7uLiIaKJpT9DnJHcZAW5ZosJ6+f6YcmAUqzop8swYgmydxeFMVm4gVdQ
 VwoYOikxBq55/B/LrRXi/c5hpy7n4vQAStRRVqV0kUZqNcEvZ5YKanp83
 D+NhuFx3HPaSlQ+JE/7XSmPqCJnZJ4TKDYh2F6W7hjnjy4PGFSnhckOHJ
 r5jmPkNFhoE4Z1uorz7chIFH5lKli3zERG6kopnCNCmuStiZzyEqi2hkV
 Q7w41HMRhDq37wDLrXRHSOsZJ16+FdOfWhS5OogmIhuSJHuEh+/EOWaVM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="432757736"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="432757736"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 08:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="723628342"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="723628342"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 24 Apr 2023 08:32:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 08:32:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 08:32:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 08:32:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKbyVo/r6ST7xAl30UP2JmYK8UmoXdR50bzcY18zs0dfaiIyyRfsSykQt8DwFaTmhv4/hLKNCfzxuHL/w2U1l4VkAwdtq03u1DxIpVFYZuir+5HUvOhl9ZeZCyqn9KeaBPSZg1VOsf/JBNEjqs2sOVp/SHQjE/QlL8VtFtnLDCM5pT82VCkIlKYno25qicfgBhrLqEvRLQ2LKfL6sV6zI1jXGsB/vCO3ronDZ8pawU+3wzl4WtLqQK8eo2CPa1zaUppG/mTT/pO1HNzJIBG7E24kFeQHZbKKs6pYJj9oUGLVXWT2/CfojiXoIT8aUvSnbgyiB6vWP5r48nuQHoZkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6PG8C7PUpvIpO0Mb8j8XNUBXq1s2biHjQ5ANN5z/VQ=;
 b=VerDGWJrJdkQG+DRovhPumOmRIOIF9hBWeu5pzj0b22TA24seq0Fn+baCO5eC/F6hIEIatqc3NrmwamEKRjdiTvot8Yw7n/ephzw8D97sNNJHan4IkuPW5mzEEiyy/qhcX//Y82k/yY6NqA/R0CEqkmJWPY2tgRmZMAqwDhTaGpVBfN0ud/APyVvNZyNyYGGmrTPp4zNtVCP+xcZunikLA54L0rpobf+XP7U88wHxM1W/+bWy6MHU/qr2GWpriBSwu0Hxq3tyBhUd3AGWuUbHyqLxf9IAnXu6aheYPG7lUmdl7MpYfLygcFfjOZBU6hPjyS2rgaI9EFpjA2xmVkDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5540.namprd11.prod.outlook.com (2603:10b6:610:d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:32:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:32:05 +0000
Date: Mon, 24 Apr 2023 08:32:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <f2vg2dabapru46pufo7nok2ggszceagdofaapwswz4z7o2qaas@zt664xn4m2xg>
References: <20230424130517.860627-1-maarten.lankhorst@linux.intel.com>
 <ohg7ccxtl77yk3mje7udbul3paiyx6b7shti674cn7gecscmnb@y2th74maa3on>
 <6a97791e-7844-753c-0fcf-b16c71975e26@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a97791e-7844-753c-0fcf-b16c71975e26@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ff7588-81c4-467d-3f86-08db44d90f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4yBGXc6CBzHel3aOpt2u5ol9AD0I2HN/9Q22cni6fZT5Ln0QroGlWIRMw1VYNTY4sHTk2SgeKtevEz0ixVPFQ4+x6xdQ7S8dvu+1KJ5mBk+uIq18WyR5+wlscZAEQbk/z3VoIUA6CT1M7Cgb8owEFo/b2VGDptfcRIejMlDkDH4KSCPCIjYYU2KPgo9saOpdzRr6jZv13V1o9mZJs/PhHxdSsVvNFGWOR6DkCQA/JCtbrhtPTCUvbaw4vqWdrdkG0VA2TH0E0jcAn738wxvGjeX7/P46AnZ+D/z1WEfAPyO24sjc7/tCrEqmQkGVDMmogRFS8kGWg9pG0tPhlKbUaIyZzh50g0z3hihRH2kYmo0RvEAwCTFyBBSnx9jmw4ZsEIRTC+S6MF+FZZdKYITMe6eqjvc9sDbpbFGOPeO4pzI1nXh+A1gAiBUK383o/LYNVD7xEPBcqzs/UcOZQmc7s1I0Sn7wb67PGXDjtxWDlAW70uE8qtNWHdTOXOPuhR9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(6486002)(966005)(9686003)(6512007)(6506007)(26005)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(6916009)(4326008)(478600001)(5660300002)(82960400001)(38100700002)(33716001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3YZsqrhHw9QrG054c3R+8B4ITL2Xi2bFuhvNuR2e80wpdazGq58l6ijAyM?=
 =?iso-8859-1?Q?0d29GsX/BzW8vdEptq8oAWYqdB6JUBNmuJEGemveLaM4Rs8AIlwjc19ivC?=
 =?iso-8859-1?Q?BBqmYXlGsUmKDUzhIN4ngAEyFFzAK9Dz6xu45Rc3zE9H22v6d0l/rcS62U?=
 =?iso-8859-1?Q?pbtX5zmllmLajO6Gjq0ZC4oObCRefsLedFMybkO1C5F+T9cYxZAzDrnxer?=
 =?iso-8859-1?Q?QA0rlPLb743I2OEoPEy90bFUfOmlIRS43V1BsRq3XUXPtVQjh8DL0zqp+M?=
 =?iso-8859-1?Q?61NmpWDhJlM5i+CvqPidsT1LEwJBfX+7mOP6Lp0MYMoiVFPHXVoRUSFu04?=
 =?iso-8859-1?Q?EGqffl9TggGlOe2Xy4yyq9RygL68WECDPQhHSCW2nSCqcniLY4C0DDXTuM?=
 =?iso-8859-1?Q?wuwEYBBdExYvm2vbPYgzMNKzexZQkzTxK2Jf6h5P5+q7hopHpFC/ssuxl9?=
 =?iso-8859-1?Q?deiA94Rul20nT5/4cZLIT2hn8KvKAZyvctc038+EM7OnmO186HEzeKGyve?=
 =?iso-8859-1?Q?ez0dYX6PLtnwA57tuuHnCQgpHVM6HyRz6NF9/bFc5gMQCEs5AOdUpgGih7?=
 =?iso-8859-1?Q?ZRG2PS95cO348MZiMz8ylOLvnDVcomvICjj4I7z2DUB4arg0Od0wRrM8f7?=
 =?iso-8859-1?Q?Tonnwjdsa9K957WuihtTUR7hWm+NV/ZzyGHxc64rY7L37OXOqHGvCp7myP?=
 =?iso-8859-1?Q?XQVmKGajbKsMVejn+dX2qTkDZAYQcBuiV2EbMpp9jA7M3CQhZ8Wl4PJxR/?=
 =?iso-8859-1?Q?NGV0iG1A4sSGjvIEXBDLdHz69WdA2xrQ3xQ2HXe0bEMjK8Q8U/mC7rK3dh?=
 =?iso-8859-1?Q?5ikUpOY2EgbOpdNSI7t9C5DX2zSjSkktKwn4WLvpWWjMvvsR95Ky1bL+d5?=
 =?iso-8859-1?Q?Tx4QwTyQ4ocfmE07AR18eP9DbwfIN2SHmRC0uyazgzs+VcUF8rvzWrMNH+?=
 =?iso-8859-1?Q?KxXoxWgxJrWTN1AnfGwLTIoHdW0stnvgSnC+Q8Onp76PdwMQERyZqceqWf?=
 =?iso-8859-1?Q?jI0HpV5YTtmZUM6vzqVOSJ56Wxk3sCdh8miFsmGeM6c2wCOfuTIGkF8sxB?=
 =?iso-8859-1?Q?AZROWZdVSL/oeSDlOdgqrZxDYm4MfQ4HdvKj0wPbBFhGwZQzZgwIk75iVY?=
 =?iso-8859-1?Q?S/KADk5iYSSN6GT21ykXuyHOSZUp9Fu7UlC16H/Iq+70s9R+meXk3DzjOS?=
 =?iso-8859-1?Q?m37/y936DW186clmMwDolE+orRQ0/vAnSBuglvbgwF+wxl+KTAF2F4kxNR?=
 =?iso-8859-1?Q?zardtn1At0zG2pBVu0vE5jw1dcvSQ6gXyOOn3Uc/59sadHj6vgGJ2l1Yyl?=
 =?iso-8859-1?Q?LxLxtPWS/lwtR99PSDOJ0SeGCFIXXgKC2CdkN0i6mDSoBmY8D6CayeIxdy?=
 =?iso-8859-1?Q?eZYgWS4IfaSDte4J8AxfOjGVRApB9sGK979yMoKdljwA0Kt4rOw5mOpwm4?=
 =?iso-8859-1?Q?m3xxDrgEFOJFWt3gQD0ukYA8rJSmSbT3vFzuOkj8TlZ+I2FaFmnUNsVBLG?=
 =?iso-8859-1?Q?EygEbYVFYPlME+q9ZwHW00SNivYmbgiuNKcOfl3PS4r+HnY/34ht1wSCfQ?=
 =?iso-8859-1?Q?/BgdzU01aV2ErBtydrMZ2AfbUUpSWodRetW/47lZV+obpMEDNC6HmGy243?=
 =?iso-8859-1?Q?EHu6fsoopsy4Sp8dUo6kS/aEemo6P/9AcPujDxfGdOZl9OhLNHfWyrUw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ff7588-81c4-467d-3f86-08db44d90f20
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:32:05.7657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGsmRdFlbjlz3ggt8gAN61khnN64mRGso7fwVrKqbV11Sktt/U2JbvmVuPKKK4Qog4jYqNX6yBSO7mL2Ua3sf3WpdTyIy6aB+Wi9R2U33bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5540
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fixup small bug in xe_de.h
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

On Mon, Apr 24, 2023 at 04:09:11PM +0200, Maarten Lankhorst wrote:
>
>On 2023-04-24 15:57, Lucas De Marchi wrote:
>>On Mon, Apr 24, 2023 at 03:05:17PM +0200, Maarten Lankhorst wrote:
>>>In display it's not called from irq context, so use xe_mmio_wait32 with
>>>atomic = false. This fixes a splat and the need for i915_utils.
>>>
>>>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/245
>>
>>
>>this needs to be:
>>git commit --fixup=0838430682d761d0c62836455c5a792bd2836615 so it gets
>>squashed in next rebase in "fixup! drm/xe/display: Implement display 
>>support"
>Yeah that's fine, I was planning to change the commit message when 
>committing anyway.
>>>---
>>>drivers/gpu/drm/xe/display/xe_de.h | 5 +++--
>>>scripts/package/buildtar           | 2 +-
>>>2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/display/xe_de.h 
>>>b/drivers/gpu/drm/xe/display/xe_de.h
>>>index 000379f8702e..0c76b0d24d96 100644
>>>--- a/drivers/gpu/drm/xe/display/xe_de.h
>>>+++ b/drivers/gpu/drm/xe/display/xe_de.h
>>>@@ -70,8 +70,9 @@ __intel_de_wait_for_register(struct 
>>>drm_i915_private *i915, i915_reg_t reg,
>>>                 unsigned int fast_timeout_us,
>>>                 unsigned int slow_timeout_ms, u32 *out_value)
>>>{
>>>-    return wait_for_atomic(((*out_value = 
>>>xe_mmio_read32(to_gt(i915), reg.reg)) & mask) == value,
>>>-            slow_timeout_ms);
>>>+    return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
>>>+                  fast_timeout_us + 1000 * slow_timeout_ms,
>>>+                  out_value, false);
>>>}
>>>
>>>static inline int
>>>diff --git a/scripts/package/buildtar b/scripts/package/buildtar
>>>index 65b4ea502962..fee5b9d3b171 100755
>>>--- a/scripts/package/buildtar
>>>+++ b/scripts/package/buildtar
>>>@@ -51,7 +51,7 @@ fi
>>>#
>>>cp -v -- "${objtree}/System.map" 
>>>"${tmpdir}/boot/System.map-${KERNELRELEASE}"
>>>cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
>>>-cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>>>+#cp -v -- "${objtree}/vmlinux" 
>>>"${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>>
>>
>>leftover from debugging?
>
>Oops, yes. :)
>
>Can I get your r-b if I commit as a fixup?

ok... in i915 we have:

intel_de_wait_for_register()
   intel_wait_for_register()
     __intel_wait_for_register_fw()
     __wait_for()

with the __wait_for() only happening when slow_timeout != 0 (and
slow_timeout also passed to __intel_wait_for_register_fw()).

So this is always a might_sleep condition.

For direct users of __intel_de_wait_for_register(), it's harder to
verify as it depends on the value passed by the caller. Currently I see
2 callers:

	drivers/gpu/drm/i915/display/intel_dp_aux.c|47 col 8| ret = __intel_de_wait_for_register(i915, ch_ctl,
	drivers/gpu/drm/i915/display/intel_hdcp.c|350 col 8| ret = __intel_de_wait_for_register(dev_priv, HDCP_KEY_STATUS,

It seems they are only using the __intel* variant to be able to get the
out_value and not because of the different handling for the timeout.
since the are both passing a !0 slow_timeout.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
