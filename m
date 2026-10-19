Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9B606A31D
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C6qJYgG2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1160C10E6A2;
	Mon, 19 Oct 2026 21:47:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDA610E69F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 21:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792446463; x=1823982463;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ffh3DYYlPOuls9hZjGsKvvgip8GkDN7t3zLas7OVJsk=;
 b=C6qJYgG2TiaTyaA3foxaUTwO+tSkFngrM+VrhToC420eAMgU2qN8+g+i
 Wl64PnNrq8qjxmw051YZoxfrm7wZ4J7U3ADEsVqbzCF0eRfwXGC36tpmx
 o2v42W8eAIRln+drEdLN7P5zYVJXGDESRcw5fmXEzy99tJxRMdhwtuq4q
 WZNjgpfoe0y8uyGh66n3rJ9xywKrLJtQKcQaoIPKQP5bQUjeJ3WYBS3CQ
 zkx/Z14wYiFg5Jd01RSq2uueiQDKYRDptCqS0mD8pHW6I4vVOnp23z6mw
 p0dTAIgyoljELrJCasxw25sV5aJvssRZpwxt1Lj6i7Ege+z0ohjMear6H A==;
X-CSE-ConnectionGUID: cRjfM4XGQuy41X2p7qesPA==
X-CSE-MsgGUID: kP7OKwVcTEms7A2h2q04oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1179062"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1179062"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 14:47:43 -0700
X-CSE-ConnectionGUID: tEeUmi2hQ8SbOvgJyDAi6g==
X-CSE-MsgGUID: P46NL8BNRS+99rN7m4y9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2620958"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 14:47:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 14:47:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 14:47:42 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 14:47:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jexaTprv9zQl81o+DlkjQAJo5moA99wKeAFVTN9wIULzB7zLAqu8qWrMW5wv7UpqsclLx2PZyo+oTfUYCtMozs7T9VSWr2U7WG4SsAKUlPYcKN+ceKGkjAgzfB1k0ycP1XFBEEIpVvdTilikZCgdl1ER7mhPG+VsMXN7zaMm951VH+KbNIYsrmEPPxW2zDVMMxlUIypSYzu7ExJcUQgIQuvtBSNfuWxFFuZB4f+uMBToSAB3e8ENhYKmVt/l7hKwXi/uecg+OLMMKDy+zLHG63RvjHHwiYepV9ae577THxg3iIksrnzT8yn3azvAEXY7F5tgYmyUQ+acTWBtoPzjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL3g7rFmHfYY5a1vtcr8QKAD0u8lnyh8QcjRxzLV7Qw=;
 b=MxgAYT2zy2DEf9a+lJevq+y4wQb8h0+QLoaRfqRzdjdEPtBgQs2dzJJQFGKulqek8nzhWuB0dHBCvyGj7EKIIco9VjiEcSxuIwZ1hagedWj8krPLSBXhxWLjT5wSqqIZPel4TDFoBRBM8FL560Dsft5L3Fp+Vs4/En0j76UBRjWxKrZYH1pCwG1j+VTZFvQwTuz+TG7ATrylL1SzBisT6UUJW0gvB57WYp0DbBasapd0ipo7ZemZwSwBQiqehxsCWyxMcnNBMUshkRDbAf9sW8PorKpkGBuQpzvOnMsSvw/D286JXsRcVv7JSsfT1n35kOowEpXDfGH/SImuUjNi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS6PR11MB647574.namprd11.prod.outlook.com (2603:10b6:8:410::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 21:47:37 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 21:47:37 +0000
Date: Mon, 19 Oct 2026 14:47:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v5 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
Message-ID: <ataP97suOB+ZOfwf@gsse-cloud1.jf.intel.com>
References: <20261019095655.3501-1-thomas.hellstrom@linux.intel.com>
 <20261019095655.3501-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019095655.3501-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0289.namprd04.prod.outlook.com
 (2603:10b6:303:89::24) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS6PR11MB647574:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a672e93-7fe3-4d29-4f38-08df2e2a9723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|10067099003|56012099006|5023799004|261009223327099003|261009223027099003|261009220027099003|261009221227099003|261009221727099003|22082099003|18002099003|6133799003|10063799003;
X-Microsoft-Antispam-Message-Info: QxSdm/Sh7cSwsB90lbn4IO15I2wF2IbquisvLvVeoQ5OHemuOamWZyJcUp6xJ3NcxhJZOk87ICxPIZgFgCRUxSQKcJbNlAUhBZCwx2KkeGlyvp7XEvsgFMOK2mW3dR2PKeyzr087elYgdiNYaqSn9iMGA54i7IZ0xj1/PTWIRhBpH2wmVj3Cgbia5Sn6cGqSHppDPlgSBOVdZo442sn7CS5F4mquZgfhKque+r6TYm5/dE455CHyKpGoCmmRXiOkm+TV4hPsRpv8WSJegv5U206O57tgH3igE/5f6wHoihBnHXc95AWErwCT6C9jKAP2rXnjYWzDyGH6BYYvFVcwZNhNP+uH0IsbhQ9jqKKYWsdRlAP9eCdJ0zGYRti5o5085lzUrpzE6Y4B+vhJSVckTsK8dgR6bzpvzwbRts8hhsIFrPF0cuKOasb33oHNNw4HimhHJa0t1uXpKcEeR6BPTMqAiuQofVHmS2q81ue/XfjMquyZO4N4tikIJt25Ps673jI3AWwAUut5FE2NM+1Ia9aQnssewk/PveciJtte47eaG/q+2bfegTLexICQgPfs9p3zOwa+H84u6VzOhLVaunxG0rp34sH2xwUVZjVzJSkTVLfZrjnmTXO0ghtNmticg83njZnPXTEi/qFcneE9jzo3tzr9MClb6VTL+3LxNKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(5023799004)(261009223327099003)(261009223027099003)(261009220027099003)(261009221227099003)(261009221727099003)(22082099003)(18002099003)(6133799003)(10063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZMryGiPtKY3MHDRcqWubdmzdXY+LFnN0tOF098khh+bQblsNGL5iTskj4U?=
 =?iso-8859-1?Q?ebpstgsZK6wQsEhcOkRil1I1IyDfq1silfa4HRpcKqAP+bCWlyFUK8NhoG?=
 =?iso-8859-1?Q?pHVIIVorwuDtQySUSwbPOwRxgZ7+0A9jm54DBVRgz4uzxVmU+h83bvCHFo?=
 =?iso-8859-1?Q?ux/NqHg6HHRO41/VigvuLF63b+VFPvwd4V1sRwXUAJUBuRwA62bUMTJjEP?=
 =?iso-8859-1?Q?QmaAmDNZn0xiyZUmFVRcf4khESNO9LJpaNUAOzVmNy+r1naI/sVkjK8srQ?=
 =?iso-8859-1?Q?pC3nmYnJeFoQI1iQxxqlCjEo5FdlrNqAipnA8am5YWjN0TP4rvc+VRT7XA?=
 =?iso-8859-1?Q?3k+KT0xZ2W/P2Ng0zURbcCK6k55cSjX71TCZGLyxkiB1cmNcuRSL84lKUP?=
 =?iso-8859-1?Q?v8gG2RRbIeZaN2UpHG7TpSUxKEc8RXVBImQTB+5dyFSwFRBuY/kAmdNQok?=
 =?iso-8859-1?Q?TSIJP/XoV3ukUa44JPAD//yqgj09TGKUqPI6puQEQbR2/wvGuUa6UIij4O?=
 =?iso-8859-1?Q?pGylFR78gO1IHE+HD06YZRPbRJHAabpke7x89qjFS1QdOIKRzEBHyQUBqy?=
 =?iso-8859-1?Q?LB0v8E2rrlCAX0bECf+yWv3rH8+koGl62eYZDFS3jkYFb0eS3iUOdb2gcK?=
 =?iso-8859-1?Q?YG4R22WDOmoMMy1t5IzoSem+QaVo536XYkYYWdtVNtlm7jMnpUrQkOHvR4?=
 =?iso-8859-1?Q?D0OUgDcw3OBN2sc2yrKtJvn4lNvtijZb/zd/V1NykEd32LL2lTJ1uyS8yP?=
 =?iso-8859-1?Q?FbO+WFDhsSKrK7L53JAWj+oenJgOOfW/J9II22p5ErAvwo/7yHu2QZdbth?=
 =?iso-8859-1?Q?sCrdgebwYqJX7U8BrYt4G6F3bZAnWJ9m+5dlZMIvy4ach6K5B9inuADZqg?=
 =?iso-8859-1?Q?7dDjFBL1O1K9ZnYw2yrbHgt23WxayRyBufnPZwozcN9mWr2QN76ZqJXicz?=
 =?iso-8859-1?Q?cRwJfc2FP0UI3VegYmPCKshy/+CCLCRJLBibCgma8VnJynIErpGAn+8zrz?=
 =?iso-8859-1?Q?60uZYsClpfPeQbo9pDsmM7zgtDcYh3HduPDwG4MeJ97EzX2f92IR9/iG2L?=
 =?iso-8859-1?Q?qnRB+yAgYFUZRo0jmP+AcWKPpMV8ljF10w/xM0ZDfdN7Z9XESeZ0+jC5G1?=
 =?iso-8859-1?Q?wQJVo1lNUgbuqVH7PYtr7UlmsaAZObrdhWiroD4IxVJMyYdIzfIy1eP8Rx?=
 =?iso-8859-1?Q?aj7nK2oh71Ir+o7cIpDTJMw3ZdBrsI1Uk8xI+9nFRD3BRlC0WNSGO08Hmb?=
 =?iso-8859-1?Q?L/qW2mchIhyIhMrrQ+Q+TUXlZxn1xUCjiNx2f8u3PuxExJ6jWSgBlCS3+A?=
 =?iso-8859-1?Q?TC4B1kiTeA3EDy1Go1Ew3i6OLQ+sUA1YfnvFWHOtfLTDY0JrueE4ifhgvT?=
 =?iso-8859-1?Q?82k5af199FCEsGQJvPj3JTIVcQWpXohgw195WHLVoY914RNA1sbgztJ2aC?=
 =?iso-8859-1?Q?VxMG9sjTdI9NAiKywy9sqR8UQs+y/vRFETjQiDBV3/BlF8zxZvaOM3XgfA?=
 =?iso-8859-1?Q?X6bN+WlG2DV0MYS5JRHyRaZTEbyHUSXACCI2Mv1BHYKseV2wa8WJ04RRCL?=
 =?iso-8859-1?Q?gW45W+nHo/76fdPsIifLsu15y/VtH0FXpjmCZg9NRhka2c+Rybv0ULzS/I?=
 =?iso-8859-1?Q?TUOTPOADqe8hZriQddv/VmW5EeNu953+lGHuf+gMxIrK5KuAsOaWUF8No0?=
 =?iso-8859-1?Q?H2ajy9M+SM9OElUUerGDdTwB+3PgM9KNda76gPe6S+Bx7/jGPRDNG4gyVV?=
 =?iso-8859-1?Q?uJHz5SFe99/Zx0k+n9CspdJbbKJE90a3Qc3oV7XTpWocsAV9lMPgPjB7uI?=
 =?iso-8859-1?Q?eEzdvUos3g=3D=3D?=
X-Exchange-RoutingPolicyChecked: UNVWkExnSvXfYIUG8jM2j4xmMXIVDNpcMuVCQwkv/m54Z+ncuAEgVQpPsrqt4C3rmJrF3LuOgOoxNI3uJkXgPj/BU73XLRFcXwFp7HB5/pb+SGJVfGasxrLM2lbWjWyvdMjfbPtlD57Oy7GnRCh+lAnhjp4QgP7xmGMi1ahBZ3E7RQsWLjk/ZvXWCTiBQq1JbHMFO4qYVyS+Ik9CiBWdMWihcrxWTADRlAOVUjGD011q8e8ycrzenREMCyyBmw0By9qeEDpX0g32iNMe+gIuLbbUgf6aeriXyWTHUJ1I+B4Q6AKyTPU7gFLVLZbhjOClO96RSJ7rXxRabgYmIZHXDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a672e93-7fe3-4d29-4f38-08df2e2a9723
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 21:47:37.0973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FR4eZP20HIinFa9fcRz7PoognKKD+AlubLC3iu6Bp43437NFZvA5wuUV68Si8E1Ye2VBCXZqqs+vISUYCcE/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB647574
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:56:54AM +0200, Thomas Hellström wrote:
> Purgeable objects are reclaimed by simply discarding their pages, with
> no writeback required. They are therefore much cheaper to shrink than
> regular shrinkable (non-purgeable) objects, whose reclaim may need to
> wait for the GPU or write dirty compressed contents back to a backup
> store, and whose contents need to be read back on next use.
> 
> Split the single xe_shrinker into two independent struct shrinker
> instances registered against the shrinker core, sharing the same
> underlying accounting (shrinkable_pages, purgeable_pages,
> populated_tts) and locking:
> 
>  - A purgeable shrinker, whose count_objects() reports only
>    purgeable_pages, and whose scan_objects() only purges objects.
> 
>  - A non-purgeable (shrinkable) shrinker, whose count_objects()
>    reports the shrinkable page count (capped by backup availability)
>    and whose scan_objects() shrinks non-purgeable objects, and also
>    purges any purgeable objects it encounters, waking the device via
>    runtime PM as needed.
> 
> Express the cost difference to the shrinker core through the seeks
> value: the purgeable shrinker keeps DEFAULT_SEEKS, while the
> non-purgeable shrinker uses a higher value, 8 by default. The core
> scales each shrinker's scan target inversely with seeks, so purgeable
> objects receive proportionally more reclaim pressure than non-purgeable
> ones, without one shrinker's behaviour depending on the other's state.
> 
> To allow tuning, the default non-purgeable seeks value is set by
> CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS, and can be changed at
> runtime through the per-device shrinker_non_purgeable_seeks sysfs
> attribute. Valid values are 1 to 64. Zero is rejected, since the
> shrinker core treats it specially.
> 
> The standalone purge walk relies on the LRU walk skipping
> non-purgeable objects, for which xe_bo_shrink() returns -EBUSY,
> rather than aborting.
> 
> v3:
> - Patch introduced. (Matt Brost)
> 
> v4:
> - The purge walk aborting at the first non-purgeable object is now
>   fixed by a separate, preceding patch. (Sashiko)
> 
> v5:
> - Make the non-purgeable seeks value tunable through Kconfig and
>   sysfs. (Matt Brost)
> 
> Assisted-by: LLM
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig.profile   |  12 +++
>  drivers/gpu/drm/xe/xe_device_sysfs.c |  50 +++++++++
>  drivers/gpu/drm/xe/xe_shrinker.c     | 147 +++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_shrinker.h     |   4 +
>  4 files changed, 172 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> index e07517d120e0..23045ed2aa94 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -74,3 +74,15 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>  	  to apply to applicable user. For elevated user, all above MIN
>  	  and MAX values will apply when this configuration is enable to
>  	  apply limitation. By default limitation is applied.
> +config DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS
> +	int "Default seeks value of the non-purgeable bo shrinker"
> +	default 8
> +	range 1 64
> +	help
> +	  Default for the per-device shrinker_non_purgeable_seeks sysfs
> +	  attribute. This is the cost, as reported to the core shrinker, of
> +	  recreating non-purgeable buffer objects relative to purgeable
> +	  ones, which use DEFAULT_SEEKS (2). Higher values reduce memory
> +	  reclaim pressure on non-purgeable buffer objects, which need
> +	  GPU idling and writeback to be reclaimed, in favour of purgeable
> +	  ones and other kernel caches.
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 18783a286a83..ff5d25dd867c 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -15,6 +15,7 @@
>  #include "xe_pcode_api.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
> +#include "xe_shrinker.h"
>  
>  /**
>   * DOC: Xe device sysfs
> @@ -31,6 +32,12 @@
>   *
>   * lb_voltage_regulator_version - Voltage regulator version provisioned by late
>   * binding. Exposed only if supported by the device.
> + *
> + * shrinker_non_purgeable_seeks - Report/change the cost, relative to
> + * purgeable buffer objects, of recreating non-purgeable buffer objects
> + * reclaimed by the shrinker. Higher values reduce reclaim pressure on
> + * non-purgeable buffer objects. Valid values are 1 to 64. Defaults to
> + * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS.
>   */
>  
>  static ssize_t
> @@ -294,11 +301,54 @@ static const struct attribute_group device_uid_attr_group = {
>  	.attrs = device_uid_attrs,
>  };
>  
> +static ssize_t
> +shrinker_non_purgeable_seeks_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +
> +	return sysfs_emit(buf, "%d\n",
> +			  xe_shrinker_non_purgeable_seeks(xe->mem.shrinker));
> +}
> +
> +static ssize_t
> +shrinker_non_purgeable_seeks_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	unsigned int seeks;
> +	int ret;
> +
> +	ret = kstrtouint(buf, 0, &seeks);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_shrinker_set_non_purgeable_seeks(xe->mem.shrinker, seeks);
> +
> +	return ret ?: count;
> +}
> +
> +static DEVICE_ATTR_RW(shrinker_non_purgeable_seeks);
> +
> +static struct attribute *shrinker_attrs[] = {
> +	&dev_attr_shrinker_non_purgeable_seeks.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group shrinker_attr_group = {
> +	.attrs = shrinker_attrs,
> +};
> +
>  int xe_device_sysfs_init(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
>  	int ret;
>  
> +	ret = devm_device_add_group(dev, &shrinker_attr_group);
> +	if (ret)
> +		return ret;
> +
>  	if (xe->d3cold.capable) {
>  		ret = devm_device_add_group(dev, &vram_attr_group);
>  		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
> index 378022c37a57..39aa0fad8c24 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.c
> +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> @@ -14,6 +14,19 @@
>  #include "xe_pm.h"
>  #include "xe_shrinker.h"
>  
> +/*
> + * Reclaiming non-purgeable objects requires GPU idling and writeback to a
> + * backup store, and restoring them requires reading the contents back.
> + * Tell the shrinker core they're costlier to recreate than purgeable
> + * objects, which use DEFAULT_SEEKS, so that purgeable objects are
> + * preferentially reclaimed. The default is
> + * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS, overridable through sysfs.
> + * Zero is disallowed, since the shrinker core treats it specially and
> + * reads the value unlocked.
> + */
> +#define XE_SHRINKER_NON_PURGEABLE_SEEKS_MIN 1
> +#define XE_SHRINKER_NON_PURGEABLE_SEEKS_MAX 64
> +
>  /**
>   * struct xe_shrinker - per-device shrinker
>   * @xe: Back pointer to the device.
> @@ -21,7 +34,8 @@
>   * @shrinkable_pages: Number of pages that are currently shrinkable.
>   * @purgeable_pages: Number of pages that are currently purgeable.
>   * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
> - * @shrink: Pointer to the mm shrinker.
> + * @shrink: Pointer to the mm shrinker handling non-purgeable (shrinkable) objects.
> + * @purge_shrink: Pointer to the mm shrinker handling purgeable objects.
>   * @pm_worker: Worker to wake up the device if required.
>   */
>  struct xe_shrinker {
> @@ -31,6 +45,7 @@ struct xe_shrinker {
>  	long purgeable_pages;
>  	long populated_tts;
>  	struct shrinker *shrink;
> +	struct shrinker *purge_shrink;
>  	struct work_struct pm_worker;
>  };
>  
> @@ -179,6 +194,19 @@ static int xe_shrinker_walk(struct xe_shrinker *shrinker,
>  	return ret;
>  }
>  
> +static unsigned long
> +xe_shrinker_count_purgeable(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> +	unsigned long num_pages;
> +
> +	read_lock(&shrinker->lock);
> +	num_pages = shrinker->purgeable_pages;
> +	read_unlock(&shrinker->lock);
> +
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
>  static unsigned long
>  xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  {
> @@ -194,7 +222,6 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  	else
>  		num_pages = 0;
>  
> -	num_pages += shrinker->purgeable_pages;
>  	read_unlock(&shrinker->lock);
>  
>  	return num_pages ? num_pages : SHRINK_EMPTY;
> @@ -207,8 +234,7 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>   * If bo shrinking needs an rpm reference and we don't have it (yet),
>   * that bo will be skipped anyway.
>   */
> -static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
> -				       unsigned long nr_to_scan, bool can_backup)
> +static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker)
>  {
>  	struct xe_device *xe = shrinker->xe;
>  
> @@ -216,63 +242,52 @@ static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
>  	    !ttm_backup_bytes_avail())
>  		return false;
>  
> -	if (!force) {
> -		read_lock(&shrinker->lock);
> -		force = (nr_to_scan > shrinker->purgeable_pages && can_backup);
> -		read_unlock(&shrinker->lock);
> -		if (!force)
> -			return false;
> -	}
> -
>  	return __xe_shrinker_runtime_pm_get(shrinker);
>  }
>  
> -static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +static unsigned long xe_shrinker_scan_purgeable(struct shrinker *shrink,
> +						struct shrink_control *sc)
>  {
>  	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
>  	};
> -	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
> +	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0, freed = 0;
>  	struct xe_bo_shrink_flags shrink_flags = {
>  		.purge = true,
> -		/* Don't request writeback without __GFP_IO. */
> -		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
>  	};
> -	bool runtime_pm;
> -	bool purgeable;
> -	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> -
> -	nr_to_scan = sc->nr_to_scan;
> -
> -	read_lock(&shrinker->lock);
> -	purgeable = !!shrinker->purgeable_pages;
> -	read_unlock(&shrinker->lock);
> -
> -	/* Might need runtime PM. Try to wake early if it looks like it. */
> -	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
>  
> -	if (purgeable && nr_scanned < nr_to_scan)
> -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> -				 nr_to_scan, &nr_scanned, &freed);
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
>  
>  	sc->nr_scanned = nr_scanned;
> -	if (nr_scanned >= nr_to_scan || !can_backup)
> -		goto out;
>  
> -	/* If we didn't wake before, try to do it now if needed. */
> -	if (!runtime_pm)
> -		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
> +	return nr_scanned ? freed : SHRINK_STOP;
> +}
>  
> -	shrink_flags.purge = false;
> +static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
> +{
> +	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
> +	};
> +	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0, freed = 0;
> +	struct xe_bo_shrink_flags shrink_flags = {
> +		.purge = false,
> +		/* Don't request writeback without __GFP_IO. */
> +		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
> +	};
> +	bool runtime_pm;
> +
> +	/* Might need runtime PM to access backed-up or CCS-compressed data. */
> +	runtime_pm = xe_shrinker_runtime_pm_get(shrinker);
>  
> -	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> -			 nr_to_scan, &nr_scanned, &freed);
> +	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
>  
>  	sc->nr_scanned = nr_scanned;
> -out:
>  	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
> +
>  	return nr_scanned ? freed : SHRINK_STOP;
>  }
>  
> @@ -294,10 +309,45 @@ static void xe_shrinker_fini(struct drm_device *drm, void *arg)
>  	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
>  	xe_assert(shrinker->xe, !shrinker->populated_tts);
>  	shrinker_free(shrinker->shrink);
> +	shrinker_free(shrinker->purge_shrink);
>  	flush_work(&shrinker->pm_worker);
>  	kfree(shrinker);
>  }
>  
> +/**
> + * xe_shrinker_non_purgeable_seeks() - Get the non-purgeable shrinker seeks
> + * @shrinker: Pointer to the struct xe_shrinker.
> + *
> + * Return: The seeks value of the non-purgeable shrinker.
> + */
> +int xe_shrinker_non_purgeable_seeks(struct xe_shrinker *shrinker)
> +{
> +	return READ_ONCE(shrinker->shrink->seeks);
> +}
> +
> +/**
> + * xe_shrinker_set_non_purgeable_seeks() - Set the non-purgeable shrinker seeks
> + * @shrinker: Pointer to the struct xe_shrinker.
> + * @seeks: The new seeks value.
> + *
> + * Set the cost of recreating non-purgeable objects relative to purgeable
> + * objects, which use DEFAULT_SEEKS. Higher values reduce reclaim pressure
> + * on non-purgeable objects.
> + *
> + * Return: %0 on success, -EINVAL if @seeks is out of range.
> + */
> +int xe_shrinker_set_non_purgeable_seeks(struct xe_shrinker *shrinker,
> +					unsigned int seeks)
> +{
> +	if (seeks < XE_SHRINKER_NON_PURGEABLE_SEEKS_MIN ||
> +	    seeks > XE_SHRINKER_NON_PURGEABLE_SEEKS_MAX)
> +		return -EINVAL;
> +
> +	WRITE_ONCE(shrinker->shrink->seeks, seeks);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_shrinker_create() - Create an xe per-device shrinker
>   * @xe: Pointer to the xe device.
> @@ -311,8 +361,15 @@ int xe_shrinker_create(struct xe_device *xe)
>  	if (!shrinker)
>  		return -ENOMEM;
>  
> -	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem:%s", xe->drm.unique);
> +	shrinker->purge_shrink = shrinker_alloc(0, "drm-xe_gem-purgeable:%s", xe->drm.unique);
> +	if (!shrinker->purge_shrink) {
> +		kfree(shrinker);
> +		return -ENOMEM;
> +	}
> +
> +	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem-shrinkable:%s", xe->drm.unique);
>  	if (!shrinker->shrink) {
> +		shrinker_free(shrinker->purge_shrink);
>  		kfree(shrinker);
>  		return -ENOMEM;
>  	}
> @@ -320,10 +377,18 @@ int xe_shrinker_create(struct xe_device *xe)
>  	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
>  	shrinker->xe = xe;
>  	rwlock_init(&shrinker->lock);
> +
> +	shrinker->purge_shrink->count_objects = xe_shrinker_count_purgeable;
> +	shrinker->purge_shrink->scan_objects = xe_shrinker_scan_purgeable;
> +	shrinker->purge_shrink->private_data = shrinker;
> +	shrinker_register(shrinker->purge_shrink);
> +
>  	shrinker->shrink->count_objects = xe_shrinker_count;
>  	shrinker->shrink->scan_objects = xe_shrinker_scan;
>  	shrinker->shrink->private_data = shrinker;
> +	shrinker->shrink->seeks = CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS;
>  	shrinker_register(shrinker->shrink);
> +
>  	xe->mem.shrinker = shrinker;
>  
>  	return drmm_add_action_or_reset(&xe->drm, xe_shrinker_fini, shrinker);
> diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
> index 9c63e22b3b73..4b3c73689619 100644
> --- a/drivers/gpu/drm/xe/xe_shrinker.h
> +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> @@ -14,4 +14,8 @@ void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long p
>  
>  int xe_shrinker_create(struct xe_device *xe);
>  
> +int xe_shrinker_non_purgeable_seeks(struct xe_shrinker *shrinker);
> +int xe_shrinker_set_non_purgeable_seeks(struct xe_shrinker *shrinker,
> +					unsigned int seeks);
> +
>  #endif
> -- 
> 2.56.0
> 
