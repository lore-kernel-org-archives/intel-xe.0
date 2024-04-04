Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331CCD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 20:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B241010E60A;
	Thu,  4 Apr 2024 20:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzJ1y9B9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D6A10E3AA
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 20:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712261021; x=1743797021;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=f2fmSZ7WPgRdctrDheYLcB0tYjT54q7F76JOz83Px/Y=;
 b=GzJ1y9B99j5WdWWkDaTcL69+fKJAdfauM5yPPq16P5wotHTvbDBSkoQw
 8H2Vl3wFnbxPLAXwa69XKUuearjNSD9/CA7Yc0CQsttxHIo3bO8wVDC7h
 QN6n+BscUkI3N1JGRAZpt0sQe0dZ8z46JwLPZ8400qd81eiobhtE5ZYAf
 rToL9iaa9RwPgc5yF/v0nbb44JPL+iA+xcUJiwuIU0gvBCW/3+lnephXY
 KKYfKjgUwI4HuwCdpvFCleBaF9H6CYd1WPooXRmBd2NECNzQ12WpoPkAu
 togniF+eeg3SrpSnTVtNyOtcgbK9C98TpGbGH4iHUZDQE1J6NgzrsJNE5 Q==;
X-CSE-ConnectionGUID: L6UL7HyiQ76HYjr8nxQYuw==
X-CSE-MsgGUID: geoTfHD8Qfe2FvPws+gt2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7701949"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7701949"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:03:40 -0700
X-CSE-ConnectionGUID: WkQs53JuStWI88/1C6Fm5w==
X-CSE-MsgGUID: iPr0WYPCR2+ON7Yn+R0Kbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18803339"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 13:03:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 13:03:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 13:03:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 13:03:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 13:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp6BJ+eyHNIzsN/p2wTOzEu5iEGA9m6ZaFmSLHG7ZMLOo6A+/fHfN4awA9SE7EvmcTxCu3y/sX3CYVbGanDDxQ/AnoU/XSxPgD0TvIaywmToTjdfklrpgPF1FfKAIaR3aEdfje92zocQWCWlOdZY+g8VEgSZuuN3OE5QVJ2FZsFg3oM8R7pSz5FgORP4ys/LPO15+RjkE9UW9slr3vNlsHY4FSxTrQlvEAIIZ1u/IrYlPLj6LQsfqnigIbevyABJgUeTCtoex8fGYfR3lCOjHbtX2Vsref2XRogyIBV+/eO2RZDcuisO+0mHZ/GZIPvgrVYBv4IkpGiGtrB0qtW7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqKx6TpadYvpdBCMmxQIVxmGKJ4W8+O30+6HAkiBzLE=;
 b=kYu8uL4HMZdd/yDYGjYsOoe6TuJpxzENkLHfJ2R0Tv+wxavInBR4K/mT0Ks0nD8fHy4jqfhS7E3rHtK6h0vLN4gQjiR/AlgA7CQin+wHgmhzZ9NQJlHqPqKQ+KnO97AIaL2DaEkGejkWzn3OsXSBd/3ZCMLgAvZhLPHqj+HGjuy2X/uxIqB2fP9tXkWzQdmCt6+SrZ25YKQroX7S0WM4Fm2kkABtA74JmGZlkePXdZgORDQgZNHnFnAGfas/dos5GxqXfCwyJtODM1QI3rnk8DFbmaLpdqFh+7UAXzqE8lxMrkPaUktf76Vw0l5sBRDOK4znt5mZe9+QQyGjGJ0Nmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7963.namprd11.prod.outlook.com (2603:10b6:510:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 20:03:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 20:03:36 +0000
Date: Thu, 4 Apr 2024 15:03:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Port over the slow GuC loading
 support from i915
Message-ID: <3zgavkspngk4exetckvv63delpiwtibyxndlfig63zm53ccojh@s7mm7jcp3q6x>
X-Patchwork-Hint: comment
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
 <20240228011002.2454419-3-John.C.Harrison@Intel.com>
 <wj5shvj6oc5zdk6katkqanztp5jmbfyt6i34r44irtaph2gzf4@f6z5qdkfeg27>
 <090d6d4b-1918-4355-9f42-7e696f89987a@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <090d6d4b-1918-4355-9f42-7e696f89987a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7963:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0O0aLisK8vx36n2ZPfvnfHZVGxCmRD0/NXHgWWgT2bUoOHohToBIlAxUSv7qMEchcMQqfcwcRoIqU3M2idHSiyFb11K6tZ5rK1aREUUMcQSf7JWmfgLFPfld8O4unp2ulAl8GpTXN9ht/XtNFjZL0F4eq7qrZ3sJ3IaKRKyOv1QZ4NVFOUHcRR+Hgdkca8WLb+RQrqbi9YA4hZlGUqgUO9SxtMYaWabRTBYEnjfu4QnuVtUc2209yjLDzAqtWMjh/QPakHxAbaOBzwsoc7BXfxR6mDynSjLQGMSa57d8nzvRKWT/7/BmhlGvceZBGwniHyDk6FwjAMWw6XpEzjiVwIyIOHnGNqXQwPzWTQ1/hJSjZC+nxy2ydrP7AyWiVeDXSeXOEighvK8/eIrEuEengWT+M3t6CBrssBvzLS0WNRxMb5gm+kSuavpfiqMp+7VupQUUccX11r00wFUKl6AoQsa6YEBJLf91uji+BdfXzjQJEX6s0SA4jf4HnKJc/2R2WVamWulhF3R+K1j518CU7sxxGMwDeJJW5rQNN7mO48O7bXjhN6K7/5w+sU+gQMEBdzq0pwSqAJGo0W+PDaNRiBc3AWLXx3NMWQIQ04kiu4naiuX6D908fXP81nt+noiunKNpRM98QOqR+i4f4B1RFOM/1GhRtbGGaS4BeEBKLBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8vZ70kHHt0LA4CYJWhCF3Q6BN7F+tzpCYTWcRKAUjzP3YCxYqV/09iMQTe?=
 =?iso-8859-1?Q?M8B86A1hJxYdILVgW6yMEAV1JntSgTdOII193vGhYJY9vs3/NFYhT1o/y3?=
 =?iso-8859-1?Q?ThyfvpXraCB+yul0TZLE3ftAIf59PH+LfQzsR6kXegsSUkR1mGC2+x/lm8?=
 =?iso-8859-1?Q?S3QIr73XEbsINf3wjnA+mOcQ8tdtYvyd0H/qTIwotvURINQP7IHlA2e+NL?=
 =?iso-8859-1?Q?bo2SHB05H73L1hou7mwYNfKvpN5hFryvebuhrtHcOk7dFyHkwIbkj7XAZC?=
 =?iso-8859-1?Q?aOuYVwDjLlW6F73ZtgXpPAM5ttJVZnIDFlL4OaEDaMYl+5uLfRNYNElxe8?=
 =?iso-8859-1?Q?5AdqIsAxI1CSyDzEtwhSyBaaBt5QZeXgFtBjxWKltli/gFwo75LJ6vbpBG?=
 =?iso-8859-1?Q?5YqvvXj/mo2BLcYSXmAz+9y9gaAJ74ubW7jU+NNjpEPf3klHj4CWjgHrRY?=
 =?iso-8859-1?Q?NvzZH3zuo3Pe1MmTduVSO9XjnxAvxZVRV2tyUGNxlkZ/iAXgIkITY1oul9?=
 =?iso-8859-1?Q?2xseJc5aOdlhe66o0pUr98Mu9Es1iWEReKXMNy0u+uNHMXwdAd9xdf69S9?=
 =?iso-8859-1?Q?Cxfy9RCDmu/ENp4Yu7zYF07vu1mexmYJYqvG+F6UBaC7DdoQPxZ62YWne9?=
 =?iso-8859-1?Q?d192lxrGBxdQxtPOV5ZtmiYZ/UUum/ueRX/ECrNPsZh0uawwlsEnA7g/b0?=
 =?iso-8859-1?Q?5YLMdl3qjNMe2pIcbVaTUX8m8DQ77V9/9qo7nX6PiZtvgRKbKwI6eBnAEL?=
 =?iso-8859-1?Q?bP0bWf7eqde9Iow5ygVEwk88eSRcEjsi4FtmsDYO6zva39fkRlsDHI27to?=
 =?iso-8859-1?Q?u9a4KeuEpcQtvgdByTfFDQ4ggNYj8QfhmqBVWxX0M8wFKDIFhR2aNku8fv?=
 =?iso-8859-1?Q?UZUvzTRW+KYtst3LHnNPL7sJg/NH/ABjQ7tF9O7HUrIND3i5eObGGdzMBc?=
 =?iso-8859-1?Q?dJoFfPQDEeqJG68ZL2sSeGBR748jVEtuvNHZM+1YAqzky3GXfjsg3LrTwa?=
 =?iso-8859-1?Q?f92VRm2TnfC+/4huk09mhJmM0BhU836rlVUTXgkQ0xJcAbLAvtcj7Pqx5N?=
 =?iso-8859-1?Q?TVRMHIY68MS7gMzg6hxH/jWNwspVXYwwDjJmKxw1Uk78Yrsvj51LtY9IIn?=
 =?iso-8859-1?Q?sic8F7rl+l80jK2AlYASuM5H+BDwHawmhH6utLbuNes6v4iTjZST5uu8Yt?=
 =?iso-8859-1?Q?H14B5B9pkF+UZoegOQL3xrfhXEFcIchXnIPTlG8aWM2ad7N2Urhy+dkeYi?=
 =?iso-8859-1?Q?5REEA773Hgj32Uy6xx0NftgXZh38UsV1afxuTNDxVIbz2Tsg/jpaVQ/tgo?=
 =?iso-8859-1?Q?mNfFlk1vytoK1hWNVXMrC8QtFDusoGqlS2S8beYQHQzaeGEcw3fgqwWBuy?=
 =?iso-8859-1?Q?PRuK3qR+RyPL0Xch+d897WkW09yDoh/UEIA6YFabXV6ZyC7p6XrsYQ9xIb?=
 =?iso-8859-1?Q?EQlD0CjetrnYOu9YCxZxEtD0igtTue9cpLuf/PGjgzVHDyPZWvTDHcH8DY?=
 =?iso-8859-1?Q?2P3XW2Tp4vSgwupmU/rmkwc8oE4pQvQ3Ro2s3/H84cm3TTUltQiiEcBxE8?=
 =?iso-8859-1?Q?RVxeFKdZAjVeIUe7Rna4uqJFovk3dM1L5vxlLjkZIXuMjtSeNyXbtyli7D?=
 =?iso-8859-1?Q?kuzsiCDDAvnaYAlYvqbtfXtsW6XCnrpT7paAJqOTI6X3xg1VP9xzH7cQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e03283-d02b-4978-8a76-08dc54e24fda
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 20:03:36.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvq5uusjoyRxVk7KwxIBHNlfuvprxpehCrYHAF9k+8lpjrrY3+Oh2Yept+7hziiWckDgkUTuRZuEc28fGXgpUGxHqzvbYh6r8GuDiyv+k+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7963
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

On Thu, Apr 04, 2024 at 12:52:45PM -0700, John Harrison wrote:
>On 4/4/2024 12:19, Lucas De Marchi wrote:
>>On Tue, Feb 27, 2024 at 05:09:56PM -0800, John.C.Harrison@Intel.com 
>>wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>GuC loading can take longer than it is supposed to for various
>>>reasons. So add in the code to cope with that and to report it when it
>>>happens. There are also many different reasons why GuC loading can
>>>fail, so add in the code for checking for those and for reporting
>>>issues in a meaningful manner rather than just hitting a timeout and
>>>saying 'fail: status = %x'.
>>>
>>>Also, remove the 'FIXME' comment about an i915 bug that has never been
>>>applicable to Xe!
>>>
>>>v2: Actually report the requested and granted frequencies rather than
>>>showing granted twice (review feedback from Badal).
>>>v3: Locally code all the timeout and end condition handling because a
>>>helper function is not allowed (review feedback from Lucas/Rodrigo).
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 ++-
>>>drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>drivers/gpu/drm/xe/xe_guc.c             | 226 +++++++++++++++++++-----
>>>drivers/gpu/drm/xe/xe_mmio.c            |  61 +++++++
>>>drivers/gpu/drm/xe/xe_mmio.h            |   2 +
>>>5 files changed, 274 insertions(+), 43 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>>b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>index ec83551bf9c0..d0b5fed6876f 100644
>>>--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>@@ -7,8 +7,12 @@
>>>#define _ABI_GUC_ERRORS_ABI_H
>>>
>>>enum xe_guc_response_status {
>>>-    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>-    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>+    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>>>+    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>>>+    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>>>+    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>>>+    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>>>+    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>>>};
>>>
>>>enum xe_guc_load_status {
>>>@@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>    XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>>    XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>>    XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>>    XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>>    XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>>    XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>>>@@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>    XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>>>};
>>>
>>>+enum xe_bootrom_load_status {
>>>+    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>>>+    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>>>+    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>>>+    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>>>+    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>>>+    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>>>+    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>>>+    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>>>+    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>>>+    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>>>+    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>>>+    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>>>+};
>>>+
>>>#endif
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>index 4e7f809d2b00..2e54c9e6a4fe 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>@@ -40,6 +40,8 @@
>>>#define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>#define   GS_MIA_IN_RESET            REG_BIT(0)
>>>
>>>+#define GUC_HEADER_INFO                XE_REG(0xc014)
>>>+
>>>#define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>#define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>#define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>index 0d2a2dd13f11..771971110600 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>@@ -17,6 +17,7 @@
>>>#include "xe_device.h"
>>>#include "xe_force_wake.h"
>>>#include "xe_gt.h"
>>>+#include "xe_gt_throttle.h"
>>>#include "xe_guc_ads.h"
>>>#include "xe_guc_ct.h"
>>>#include "xe_guc_hwconfig.h"
>>>@@ -461,58 +462,201 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>    return 0;
>>>}
>>>
>>>-static int guc_wait_ucode(struct xe_guc *guc)
>>>+/*
>>>+ * Check a previously read GuC status register (GUC_STATUS) looking for
>>>+ * known terminal states (either completion or failure) of either the
>>>+ * microkernel status field or the boot ROM status field. Returns 
>>>+1 for
>>>+ * successful completion, -1 for failure and 0 for any 
>>>intermediate state.
>>>+ */
>>>+static int guc_load_done(u32 status)
>>>{
>>>-    struct xe_device *xe = guc_to_xe(guc);
>>>-    u32 status;
>>>-    int ret;
>>>+    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>>>+    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>>>+
>>>+    switch (uk_val) {
>>>+    case XE_GUC_LOAD_STATUS_READY:
>>>+        return 1;
>>>+
>>>+    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>>+    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>>+    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>>+    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>>+    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>>+    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>+    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>>+    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>>+    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>+        return -1;
>>>+    }
>>>+
>>>+    switch (br_val) {
>>>+    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>+    case XE_BOOTROM_STATUS_RSA_FAILED:
>>>+    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>>+    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>>+    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>>+    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>>+    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>>+    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>>+    case XE_BOOTROM_STATUS_EXCEPTION:
>>>+    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>+        return -1;
>>>+    }
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>+static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>>>+{
>>>+    u32 freq;
>>>+    int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>>>+
>>>+    return ret ? ret : freq;
>>>+}
>>>+
>>>+/*
>>>+ * Wait for the GuC to start up.
>>>+ *
>>>+ * Measurements indicate this should take no more than 20ms 
>>>(assuming the GT
>>>+ * clock is at maximum frequency). However, thermal throttling 
>>>and other issues
>>>+ * can prevent the clock hitting max and thus making the load 
>>>take significantly
>>>+ * longer. Indeed, if the GT is clamped to minimum frequency then 
>>>the load times
>>>+ * can be in the seconds range. As, there is a limit on how long 
>>>an individual
>>
>>                    ^ that comma seems misplaced
>>
>>>+ * usleep_range() can wait for, the wait is wrapped in a loop. 
>>>The loop count
>>>+ * is increased for debug builds so that problems can be detected 
>>>and analysed.
>>>+ * For release builds, the timeout is kept short so that user's 
>>>don't wait
>>>+ * forever to find out there is a problem. In either case, if the 
>>>load took longer
>>>+ * than is reasonable even with some 'sensible' throttling, then 
>>>flag a warning
>>>+ * because something is not right.
>>>+ *
>>>+ * Note that the only reason an end user should hit the timeout 
>>>is in case of
>>>+ * extreme thermal throttling. And a system that is that hot 
>>>during boot is
>>>+ * probably dead anyway!
>>>+ */
>>>+#if defined(CONFIG_DRM_XE_DEBUG)
>>>+#define GUC_LOAD_RETRY_LIMIT    20
>>>+#else
>>>+#define GUC_LOAD_RETRY_LIMIT    3
>>>+#endif
>>
>>just sent a comment on this reasoning in the previous version.
>>Continuing from here.
>>
>>>+#define GUC_LOAD_TIME_WARN      200
>>
>>let's also add the unit, _MSEC
>>
>>Also, comment above says 20, but here we warn on 200. Is that 10x
>>difference a typo or intended?
>It's a safety margin to allow for situations such as a system that 
>just rebooted due to thermal shutdown and is still running hot and 
>therefore slow. I'll update the comment above to explain.
>
>>
>>>
>>>+static int guc_wait_ucode(struct xe_guc *guc)
>>>+{
>>>+    struct xe_gt *gt = guc_to_gt(guc);
>>>+    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>>>+    ktime_t before, after, delta;
>>>+    int load_done;
>>>+    u32 status = 0;
>>>+    int ret, count;
>>>+    u64 delta_ms;
>>>+    u32 before_freq;
>>>+
>>>+    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>>+    before = ktime_get();
>>>    /*
>>>-     * Wait for the GuC to start up.
>>>-     * NB: Docs recommend not using the interrupt for completion.
>>>-     * Measurements indicate this should take no more than 20ms
>>>-     * (assuming the GT clock is at maximum frequency). So, a
>>>-     * timeout here indicates that the GuC has failed and is unusable.
>>>-     * (Higher levels of the driver may decide to reset the GuC and
>>>-     * attempt the ucode load again if this happens.)
>>>-     *
>>>-     * FIXME: There is a known (but exceedingly unlikely) race 
>>>condition
>>>-     * where the asynchronous frequency management code could reduce
>>>-     * the GT clock while a GuC reload is in progress (during a full
>>>-     * GT reset). A fix is in progress but there are complex locking
>>>-     * issues to be resolved. In the meantime bump the timeout to
>>>-     * 200ms. Even at slowest clock, this should be sufficient. And
>>>-     * in the working case, a larger timeout makes no difference.
>>>+     * Note, can't use any kind of timing information from the 
>>>call to xe_mmio_wait.
>>>+     * It could return a thousand intermediate stages at random 
>>>times. Instead, must
>>>+     * manually track the total time taken and locally implement 
>>>the timeout.
>>
>>that's something we may improve in future with a variant with a better
>>variant of this function to be used on loops.
>
>Or maybe a variant which allows a custom comparison function to be 
>passed in and keeps all the time tracking internal...

yep, that would be ok I think. Do you want to give this a shot?

Lucas De Marchi

>
>>
>>>     */
>>>-    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>>>-                 FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>>>-                 200000, &status, false);
>>>+    do {
>>>+        u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
>>>
>>>-    if (ret) {
>>>-        struct drm_device *drm = &xe->drm;
>>>-
>>>-        drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>>>-        drm_info(drm, "GuC load failed: status: Reset = %d, 
>>>BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 
>>>0x%02X\n",
>>>-             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>>>-             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>>>-             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>>>-             REG_FIELD_GET(GS_MIA_MASK, status),
>>>-             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>>>-
>>>-        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>>>-            drm_info(drm, "GuC firmware signature verification 
>>>failed\n");
>>>+        /*
>>>+         * Wait for any change (intermediate or terminal) in the 
>>>status register.
>>>+         * Note, the return value is a don't care. The only 
>>>failure code is timeout
>>>+         * but the timeouts need to be accumulated over all the 
>>>intermediate partial
>>>+         * timeouts rather than allowing a huge timeout each 
>>>time. So basically, need
>>>+         * to treat a timeout no different to a value change.
>>>+         */
>>>+        xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | 
>>>GS_BOOTROM_MASK,
>>>+                   last_status, 1000 * 1000, &status, false);
>>
>>if I understood correctly the meaning of this function, it would better
>>be called xe_mmio_wait32_mask() or xe_mmio_wait32_field()?
>>
>>i.e. you provide the mask (GS_UKERNEL_MASK | GS_BOOTROM_MASK)
>>and the previous register value and you wait for a change
>>in that field of the register. Is that the correct meaning of the
>>function?
>The test is 'read != given'. That sounds like a not to me. A _mask or 
>_field suffix (to me) would imply just that the regular wait semantics 
>are applied with a mask or to a specific field (which is already the 
>case, isn't it?). I.e. wait until '(read & mask) == given' or even 
>'(read & mask) == (given << shift)' for a field version. This is the 
>negative version of that test. It must wait until the value has 
>changed, i.e. is not equal to the given target.
>
>>
>>ugh... this bool value to show atomic or otherwise shouldn't be there
>>(but it's pre-existent issue).
>Feel free to fix the baseline xe_mmio_wait32 function. I'm just 
>copying that and trying to stay as close as possible but just 
>inverting the comparison logic.
>
>John.
>
>>
>>Lucas De Marchi
>
