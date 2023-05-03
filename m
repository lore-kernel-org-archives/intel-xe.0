Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB048C77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 15:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B735110E309;
	Wed,  3 May 2023 15:37:45 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F67010E309
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683128263; x=1714664263;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ckZ6lb75XYhpg7pDbxWIpmEbkyhds3AQfCvPUtKUgmg=;
 b=YrA9MTCi2HAvM+F26tpoOuTJ6VvcBqhWQ23yd6EChD6xVMuf0En6Ei16
 j2WYGAjEwJsRa07ei4AxOMbvLAeb2UgfV7T+5xftNNaC/E8R/EG4wZFDu
 pnnC50Gm0Ountav1KmKvLlrL9ameFp3nkO27ZzEC8ab1hjHOGKJXDfqhP
 tGX41TPHxX9U4ww7pRnYogE2YJeozKTFkRIx2QHNyTz8PkcqqOIF7Acy8
 zJ4vEM5HiQmUh4UWSqQJiGvdSLrrsZLJHvz+xBo1B8ktHYLmK2JLM0N0y
 3N/+zyondaC+l9HCZpLKqyTn6y08D4zKbyjL85KoSvoOCHFWXRUigYP5r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348726881"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="348726881"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 08:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="808317100"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="808317100"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 03 May 2023 08:37:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 08:37:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 08:37:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 08:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSD3xxAh/7ZQ8/GJqddmr657yW04vp0L1Hg3Gt+X4qqK7DKJqV/InJ9Dd4v0aoCSyL0jzxAjIvCNW/x7V9aTXZIfNA8rrMJA7UF74R9C2+xW1YQFyvjr/JLN16xbUNWs26ILrX+5jTursPyq/hKZkzdqerRgEfUpRKUGMuKuK9q+oY3nFLrVNDFDHZoBb5w/zgmDWom/RbYCp1cD9LL63tY9Urt+LWNKARW3lqjZZXWqYVkcBpeyw3AM88uYOHZcHf0RDjoyoPQRfSwzO4VsuFBKLlczWcDte7QKjMb6h1iI2dOz2zkENhFk2PeNEEqAkjmGabEg8i5YG4n4y7X6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfdkJQhWhzaGudEbgRkf0le0b1RiRiG1A0hjka3OTL8=;
 b=h1tzys9F/uVvOXYmfxL7Ok4EWwko6YD03S/BSNYBCddqV5gH1VuPCUOFPGXwGY57C0tFjvhDrSpuAFJ046wlFPutLft0bCIxkH1utBO/hUD7sSjiFvpaiZaGWpEVg1vR5jo9Ue1MEZrf3Y4/AY55pLKTt4EQCvjo6uaqGEURrfKzB7WEHpsDLATTatTUw+lF5x4jjUpRg3XvjMUmMINATv3aTyqyvCJJJvuQmxz7ZYuT4OoHH+PDEZpSJKae4vZU6XuYn1xbzIzzrwgAFFycxsuQdwFiwKbytnhWzBTJGsbmeh8AALmeIgIodHooMEmzzUYua8I1coFsYsH0sJTuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6858.namprd11.prod.outlook.com (2603:10b6:510:1ee::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 15:37:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:37:40 +0000
Date: Wed, 3 May 2023 08:37:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <qyclzeeuyumyrl4u26jebs7vld7eggzc5xczswnz7cmh3kluy6@4amskkvxyzn3>
X-Patchwork-Hint: comment
References: <20230503131005.1602412-1-jani.nikula@intel.com>
 <20230503131005.1602412-3-jani.nikula@intel.com>
 <u2lemgl5ytin2qlyjwtp2pfm4r2oqctluojilspof5brhd5l5l@yxr7bfwn2kvr>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <u2lemgl5ytin2qlyjwtp2pfm4r2oqctluojilspof5brhd5l5l@yxr7bfwn2kvr>
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 17fa54a0-dc6f-4c09-4807-08db4bec5472
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSkREWg1uVH1PtWeXoOqGOPQPVql3BPcm+nwxWej2EBYpGUVPGiU6TOue8z56IJdNZVMBHv5EGWXO9USsbOMuNoZj1HesnuePOJ/c/FKBWzvPpYqR5JMBsJBzRTYtgkwAoCndNX2jNTYU8Y/JP4fODmpRkpMPPBStKoLO9wWgEahWho2w9jvvzdyOlzWhexN5+UAbh29XIaVOfBFS3RWAlahvDFW3qH34xWLf6eKE93HewU/zQN/UYYuDBu4toNlPF6IcXxCLgfPGJiLjwFagpOXud4AexP6tXXwQ8atyEgZI14628gtjPmiRHdLehqZPH44WA2U90ymj8OolDUd17rcYNGvEeD7KaZbK7o1dK6YikxLRfEr/ZOClZvS6AswjWAnWAAw1Rw3+ZjWGWTdkBs1VxLPv0X8sVjK/1lyON7yavhBzJSpJjnG8Hhu4U055MvHysP8tW4Wpj4fBK1VKqOCKhc9c7AB+2pc+atNVx5hX0kxsQ8/pclf7YMoslB7JAXJGNidXQBcdCH9WoUzBI98qPiqmo3EpXIQal5qW34CVyD5q6y9TUPvpVvMoW2j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(6862004)(8676002)(8936002)(6486002)(6636002)(86362001)(6666004)(4326008)(316002)(41300700001)(33716001)(66476007)(66556008)(66946007)(82960400001)(5660300002)(38100700002)(478600001)(6512007)(2906002)(6506007)(83380400001)(186003)(26005)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Qu5tSgcELfeyqyA3FW2+eT3Fe9WS2pSPpS2o6pOcmpktO3Eu+MFkZDzf/Z?=
 =?iso-8859-1?Q?wYdsykkTD0GUCzt8SlMl5OV7A8r6m3jAJBg/vsu27WQulcAxhCBSoW3Zau?=
 =?iso-8859-1?Q?tz6WSxf8DPyOedeRKUpE9Vufu59Z6W1j8oAqssRCJZB5l/rUA9MATuxXOv?=
 =?iso-8859-1?Q?63MDV+sSvdYFBPZ+Gyr53JKJidLv5ti7M+9aifaIe2qPpJW0u9hYU8Fhez?=
 =?iso-8859-1?Q?iQirnTpB139ZsM3kM0i3BVqp2HOLv+f0rjQGoeTlWyudylN1KoJsVUa0um?=
 =?iso-8859-1?Q?AYDZlD5hmdB3UatJ4XqmKweoTOUvTIX8yzWOCyeE5Tnaz2U687P/5mAXcs?=
 =?iso-8859-1?Q?ymCclRfJvuJw5erD6OemUGqzg/62xEDBdkOM1Gkmg0PBLSFJqwhj/7J2ff?=
 =?iso-8859-1?Q?skz1jtF7cajK/GuUxuYqMgquMzXMfHridEZvo1OVJxeUMeNr0C19fIZ2tt?=
 =?iso-8859-1?Q?3T25YUq8yenQ9fK5vuEHugQB1HiENnb1DA9m2/QbuSzECwJgb+4uZIZsGA?=
 =?iso-8859-1?Q?LX0ObMA1BuOfU7ygtyeoZanzpr0PPydrzSA2qR9eAo24vTipo2rEM4gSbg?=
 =?iso-8859-1?Q?vkdOqyzY5Q/JKjR3dm3ajqIoPHbmrCkhXHeFtmVnT6VzTxYkN0baXFmLkJ?=
 =?iso-8859-1?Q?qEKgN9WcrwEJq49YH9S/MuSuCM3QuzbZFyc3KUWgG38m2DPo70YBN/6B99?=
 =?iso-8859-1?Q?hvLU8vsvnXGdy09iiUjkBhOdHbIfKxcLLZqvpLRQEcOZ4r2EyKDyVU1Ijj?=
 =?iso-8859-1?Q?JMbEzbtoRw/L4VGxunxgqWTyWMXKalKdZ2VRw3+zpKGi0HMoxGlUZcXsxX?=
 =?iso-8859-1?Q?L12/GTo4JDFUbRuckxphI/gl3ibDC3fB8hsIni8ZWa2/tv5AklzgfmmsXJ?=
 =?iso-8859-1?Q?gYMIWlGriWVSPWYA+MNgjRvPM9aqtjOjYr8zcPGFXDS8sykA4CM4pXVCY1?=
 =?iso-8859-1?Q?+k4hY1FkkuAGTJT1Ntx6+/rADiZAPOAcgNsKewFASUss/kHC4ock/FgK7Q?=
 =?iso-8859-1?Q?ih7qDq0omoku4jGVHWOi3iEFbZet8M1VZRBc66G0qjPBSyL4Zki0fCMad1?=
 =?iso-8859-1?Q?sxexyuBlf5YlW/VUiLuuqqtGzNAiLKqcXCWCgm1B4fjF8B4e9F9IS9oEcq?=
 =?iso-8859-1?Q?UGJxUz5oI2sNmCfwi1wkIudtX2EDlVb3Ak8VvW5sfaIDie+zFJWmsAXRQY?=
 =?iso-8859-1?Q?DZyop5bZHHlkO+x9cbDtU/1jmIPN/pjXy5Xt1lD8aEg+5J+sAWsOdyrEAV?=
 =?iso-8859-1?Q?g+8duTXqMxTH56wbn+0Es+aL31kDCgywKx5/OP6/FHqOdpJ+8KokFml3zp?=
 =?iso-8859-1?Q?ye21NjdOvnUUKgKGsEFppWtP/AkpFeS2VdAhnlure/QyH4gEI39Wyui9Hl?=
 =?iso-8859-1?Q?wYk7w6ovZQoHT/3J0EMXpk1bhL8njPgOsTU3bub/j6/E7AXD0NmJxOyG35?=
 =?iso-8859-1?Q?R32liCiwbgQ6CwQUBq4MUMooGgpd4nsBBUl52zS50h/1aylcZrHZ/VXuPM?=
 =?iso-8859-1?Q?EFsg6Tr/x8AKxkORALuen1/ExaBGeDXD775USDSI5EVFASJ3EoScnFqE2F?=
 =?iso-8859-1?Q?vf4wILcH4j4j2MhilINw68tBC713Zr/FrdjxkMT8qgqqTtJS1PLtw5tjWh?=
 =?iso-8859-1?Q?0uXDBafuHDeX//bpRSVGaEiaT2bwZU+ptKgeu6Fs0NwX/wwFMLN2QIQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fa54a0-dc6f-4c09-4807-08db4bec5472
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:37:40.5564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAi7nqY5OSoYlcGZDK2kzW4ltT+kXTmLLOh1C3Wmn5fSvvywGDcoEtGUBBPR68o3dVbqmUVUPKkym1jMf81nb5CKlpIrH1tL4xa/7gAgUEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6858
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/18] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 08:21:17AM -0700, Lucas De Marchi wrote:
>On Wed, May 03, 2023 at 04:09:49PM +0300, Jani Nikula wrote:
>>Add compat intel_uncore.h glue layer to direct all uncore calls to xe
>>mmio.
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>>.../drm/xe/compat-i915-headers/intel_uncore.h | 99 +++++++++++++++++++
>>1 file changed, 99 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>
>>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>new file mode 100644
>>index 000000000000..960e2327d217
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>>@@ -0,0 +1,99 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#ifndef __INTEL_UNCORE_H__
>>+#define __INTEL_UNCORE_H__
>>+
>>+#include "xe_device.h"
>>+#include "xe_device_types.h"
>>+#include "xe_mmio.h"
>>+
>>+static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
>>+{
>>+	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>>+
>>+	return to_gt(xe);
>>+}
>>+
>>+static inline u32 intel_uncore_read(struct fake_uncore *uncore, i915_reg_t reg)
>>+{
>>+	return xe_mmio_read32(__fake_uncore_to_gt(uncore), reg.reg);
>
>
>humn... I think we will have to wait the move of display up in the
>branch.  xe_mmio_read32 doesn't receive a u32 anymore. If we do a
>autosquash now we will have to fix the implicit-conflict/build-breakage
>in the patches in the middle.

oh well... I actually missed the update in xe-drm-next. display is
already moved up. Sorry for the noise.

Lucas De Marchi
