Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6D606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dxxbPJWn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3897810E28D;
	Sat, 28 Nov 2026 05:23:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFE210E155
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795843419; x=1827379419;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NLR0I9wuncdcN7Tr956q+RNdqdKDov6SImQZZLg19hg=;
 b=dxxbPJWnG/3/e4H7QAh0UWGe2JqgPV3EFg42od2bAazALKRzRfbIRoIb
 0XFrfJ9QrI5AhfD7Epewdm2LMen4zP2/bOLnsJ5qEqMNk7QV4/CQtOtr2
 B7RMJ/gQpiF0x2GCjb9c4uI3OU4fmYeQMaojVQY92gMAsQgFeUFNUuEME
 9uCSCr7LViWGFWCIYrjmvzsS/eLI0sJTMD6NRay7TCViYd0DFWktie55S
 0JxlqEmq//HuysqBnyxV3hAf9tT/wYnGEdgOpbFAzFEV2KM4foEnc5RAm
 wFATw+WS1/DRo6GaQVUrpH55gBC7J4f5QeKF/dV7lURUSdfN2SB4RrbWB A==;
X-CSE-ConnectionGUID: W8lzlFIJSTG+mRdU9pLgsg==
X-CSE-MsgGUID: dweEv1ESS4eLp8VvQd3sqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4732242"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4732242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:23:39 -0800
X-CSE-ConnectionGUID: 3ZF8eFVWRiOwsraQOU/uGA==
X-CSE-MsgGUID: Q0Ew4e3CQ8+P3FVUZSytDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12646994"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:23:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 21:23:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 21:23:37 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 21:23:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6hFaap43LzJLqlBK4WeMFCwEzMUEW4lDrvquzm8CPHBk3VXhzydREIx+o61OHXZCxNARzDyHMlx/RHAfCsaeki8JQSklHvbr74sgAQZVlbrcWHr+v3rusI1nkBJDpdujY3TfZckd0s0bI/C+gcKndEa/O0rVN0lJoPbJhdG98dcq3auW/QMThqkgmvawBx1/AxTkpZg3XWmYQaijgV5i35KgEnhw6Bp+KME660mwPRTKDOE8Mi4brKRF92EE2glvyKp+NxmPbe1VaeWPxqCPBRhD/pcQObIdA6+GWJ/9EGPSmqwONTx2rtY3i82gWgYtcgO3tD2NJpj0ZvXbtCXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEX1gI2lFSMgdk02/ChHIUx5pqaoA+ZTXhsO8OsW5gE=;
 b=mv2Uu7llEQtyHxiKl+pAevKy8WanL7UKLVVWhxi9zCcqORdyCbutIFFpfgeMrrCdKNlriGbiFH+dvVrnoiv0adiRR7kq36dHPouumD1u5GuvED5L1qh8VMdM0pD1CDBdP9t/VEajIaJt2T44fAdLn7WchX5yuKkkFXzbD9KkmEShH1hd4+YKsj9oQqtvcEWD5DpgOlR4e6Worp1wOcqcfLBXeNTlCVc/ei3A4HLMjaY2Z7YBmaCQyZdy706yue02F2SNfqlQeRLKFOmaJ4ptTkFXrbhAE27qqmREgm7bplz5c+ahg3+NN3N7uq+B/9aKKQx47QI5xOwdbHWXxlgeyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by DSVPR11MB9767.namprd11.prod.outlook.com (2603:10b6:8:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Sat, 28 Nov
 2026 05:23:30 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 05:23:30 +0000
Date: Fri, 27 Nov 2026 21:23:28 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/multi_queue: Expose CGP address to debug
 tools via PPHWSP
Message-ID: <awplUF7kouShDzev@nvishwa1-desk>
References: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
 <20261127130818.1382215-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261127130818.1382215-3-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|DSVPR11MB9767:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4e5be0-f5aa-4bfc-461f-08df4d0fbd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261026121527099003|261021121427099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: mB/CTOeK8jyGqa4mBgpTYeJ2SjytxCKyGwQMqfk/tqr8x+YQmnoPMagw7Is+GlqEMAHCxsAluUzHZ9wDQ5VQixL2k8ma7dc0mJaRUoSYgflAU2BXfcNU25kvbTLaoJHrXHQj2+KtwTc1X/qjBWbV08X1T02js1logRl6fzeaie9AQwZ93xWG5S0t+pmYIwyva30Spf5WuaW2c+3CTukaZdVeSS23Lrpz7Iqomo5TZFZI1QH4+FeefSkLzkXpdxj8lZusERcD2FzFLDhwI/OewtcAtVpJsMSCKAII/Up/I1RFPM+qH7FeGXZowxP2nwnSXRfM9LySn9uIS8MCJSFlnjQW5ck7i1G2Yt5kmVJ60L8+o8VfGORckYaMAJPMIaW5kz9GpzLgot2tOau8VjNCQNyA95dv2Q4ap68+LWGjuq6RZiv1kU/h2E1wxJBbXOzAxvMe728ZL7OAKrG5640E22byy8HzaIFMonI7E/rzeH/toLWxsIwC/zveFBJLjnY8mJXzj4ydlHinEQdI9a2euWE5qlduWAXURs0jJSFHFemoGjN3lwFzkmkd0pIz9EHophcMUnyIGVW9o1NvzRJyMQ4ZYYJrSPsnAwqMxWvIo1BLq7HZjHBfYXyhJ2Mr86Nq+u6EPXItDke0s/RvRDdHnrCFwtE72Wpsl6i2hBc31vU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?akfzcTb6QvKO1e5WCR1oxnC0EwMgfUJsewMUwLLZHSGozzQ7xZCzmTPzEhfT?=
 =?us-ascii?Q?719P97IyeQblBu8K25dVQfFYd43SmxQg4uQGEX8T7lZVo4QxJDbd9aa5F19S?=
 =?us-ascii?Q?QZzUwM7oBTNrmyJqzGILyLqoaKF+cMF/T87s8w0ocBcihldwdOnywyaMu0Tj?=
 =?us-ascii?Q?LjFzVCAj848sMGDtjjaD3pyrEqo6vDVQOVTQOQgkPtSL2PjQEqDkFUtL+2Uq?=
 =?us-ascii?Q?Us4ocLbktYL8rnpd6WP0j2U51SHJM+c3MaVrNb7OqdmCXNpfw2jtz0Qa9r9G?=
 =?us-ascii?Q?BQdpCmg53r5+jPOj7oIRvU8Bq2r9qiD3evm9NzPv8ah2K5EGqqzNvcLWFMvS?=
 =?us-ascii?Q?5W2riBGdfRvED+tGzIac6ZqWUG0fAf+X6NKstoIKYIPG/PegLGBO6tBiQgLB?=
 =?us-ascii?Q?KehldNXG/aociMWZb/DN2OACul5pPQ/gFH6ePYm5Pqwzz4HoQ6sxnPF63SXo?=
 =?us-ascii?Q?uSv92UtzEuT30553PT7rmgc4CdqV16p7FYZOLvrjD76+8f4Adxt/BaHte7aj?=
 =?us-ascii?Q?wXubqIj+tgx7OhgptB+R1hHcz6SbO/W/RqYRGXwB3GWTDqcZJsCuJKjsW8jC?=
 =?us-ascii?Q?8NUaaRTiEJEjQWXaw5A0iwmWacRNTgb2Vffnt1PDStAum9KN+nqI6lRNP06D?=
 =?us-ascii?Q?ooHUsXFxL8PAV0E0gNOajaScRFDokDLFRnyA2TDvwfuvRbQZz8E8dYsNho1h?=
 =?us-ascii?Q?mIJERciu8pn519v52GcphCPoRw+977byRFXzSi3sLwRD1ziOarTmlcKDiVC6?=
 =?us-ascii?Q?2Z38hJYUOrdZ/D/VpLDPmcu3oFuO+greEtoidCWYkujuoGxLX6UAG3Var/ae?=
 =?us-ascii?Q?LeHQrMYeGXDM9IHaOSFLCVEpZZC7uM3QGDxcJKmL3b5v/6buoF/m6rDDFF1q?=
 =?us-ascii?Q?FV5ISOsz4KAoNE9bnA/2Qav3mrHZntxKjmKDMWBkyHu56tP+XBqdv3SvoS7O?=
 =?us-ascii?Q?95wrwfwRjGCZ1X7zXEsROmHO+GtUk08V9T4Ftl9HdJiIizXARYwnhV2mVva5?=
 =?us-ascii?Q?RnZOFiKZg5+iXXSlY+HwyIeT6D14va2Z0JjUlgkgw0MlmvAA3farGTKJA51s?=
 =?us-ascii?Q?RSoS2jcvfvuJryrthRjh88WITqja+DeI9QSj90wquiU1K6CgVNFMkRRog5uP?=
 =?us-ascii?Q?BDVH0KjhXv+I6SbeCEwcz1L3pJNIiRE4dMf817ykFJoBfRefX8QFiinL8cKH?=
 =?us-ascii?Q?N1KrI0ydQ+vtwE/51MBmfbuS+Zhk0Ho663xIEqPDBlRBV5eajqK4A5fcEHpA?=
 =?us-ascii?Q?SvjiNimna/Cf2XvJAaR3mNQLQ38KNmg0oG/9i3IR5Kw6fiuE20r1G4iZPDJL?=
 =?us-ascii?Q?KdvNLXcxMwZ0glQpV8ATFD/EXIbuR8wn5z7/gYG6OYhp2h7lx7pcCbwbNuyS?=
 =?us-ascii?Q?xjJMufmKVsU5g7OgHSkAMNHlp8vXP3xPJrfIaqArz7zhFkKASXWv31/8gNQd?=
 =?us-ascii?Q?R+qoUK1BpieEzw7QsbkRwGeMH0fMpqHg2KxfvLKIkJwc5ev6cWKmGkf7GlRj?=
 =?us-ascii?Q?c/AGxW8040iYgkNBryjDNV8P8dx/hNJ9Vt/goG1po+7hjCrPEBvd2qyw0mL2?=
 =?us-ascii?Q?Pwqx7LlcjjSgPHoOvDolCrc9wJ/8BQfWJm4O3ajm90YUM2212Jt11slRJpw6?=
 =?us-ascii?Q?WZ4KEA8fOZp9jjfZzzCE7k6iK/lzuPu6DMRULEjTCCxJtofwcQGpOhs6sAM2?=
 =?us-ascii?Q?mUw+razx2oR6I4E3ecSeq2v1mLDXYXP5brL4pXgYbt5nI8ld+4DY0no6n/aY?=
 =?us-ascii?Q?z+Ua9PrZIxy8Uvy2dEr/pUsyBOh7F/WmO+y8q+9IVdJJeytRXNe4?=
X-Exchange-RoutingPolicyChecked: ih6t/LkyQLKUFaCpNfyZGJMzhM6ow60e6EBB/YRbnCIU1wwOQi9VLDmYca3OOMp5HcCAUPkes8U31b/3rPi1PmTTtDTD5HBHVAOtX6+LcQh2r4wkmfE5Sc5CoGi//DgjO4Xh+UCTVVk/SKKtH2NHkcXELAAFbLrNXyZbtvEJFEOLTZJUOEhG6EK4kgPHV8fvakXT/pCO3Ds4PKqobQ9HlKGQcKINWnowBDFxhjtIm9QYSla3fIkGiPpLklogveZhgemotRS4BAwWcwsg/Hxx9pOa7fp90kJYwPRPpYzI1op6Ux5xrI/Fbgw3pXfr78+g56T+fzW9UjUUDDykEyTkCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4e5be0-f5aa-4bfc-461f-08df4d0fbd5f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 05:23:30.7611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pB8n6bdmkDDSBvIqRvOBdF6JMqLn6Z6M3Ach+/NTBVOe2HjKBew/dnP4MPKKFsrxyUkQtBQY5YCjosQvfpNQn8yPqvdvEJ0VuAp8rxbhVQroVBRuXjf349HyFdSSIyvd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9767
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 06:38:18PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>The Context Group Page (CGP) has the queues of a multi queue group and
>their LRCAs. Store its address in the PPHWSP of the group's primary
>queue, so debug tools can find it.
>
>The address is written before the group is registered with GuC and
>rewritten after a VF migration GGTT rebase.
>
>v2:
>- Use decimal PPHWSP offset, u32 address with xe_map_write32() and assert
>  a single LRC in the rebase path (Niranjana)
>- Move the DOC note after the CGP GuC interface description (Niranjana)
>
>Assisted-by: LLM
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++++
> drivers/gpu/drm/xe/xe_guc_submit.c |  3 +++
> drivers/gpu/drm/xe/xe_lrc.c        | 21 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h        |  1 +
> 4 files changed, 32 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index ddd9e38aa80b..b1a8ef66ea47 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -1926,6 +1926,13 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>
> 		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> 		xe_lrc_update_hwctx_regs_with_address(lrc);
>+		if (xe_exec_queue_is_multi_queue_primary(q)) {
>+			struct xe_bo *cgp_bo = q->multi_queue.group->cgp_bo;
>+
>+			/* Multi queue group primary always has a single LRC */
>+			xe_assert(gt_to_xe(q->gt), !i);
>+			xe_lrc_set_cgp_gfxaddress(lrc, xe_bo_ggtt_addr(cgp_bo));
>+		}
> 		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> 		xe_lrc_put(lrc);
> 		if (err)
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index f84848e00eaf..3b8c0e84d632 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -778,6 +778,8 @@ struct guc_ctxt_registration_info {
>  * The primary queue (Q0) represents the multi queue group context in GuC and
>  * submission on any queue of the group must be through Q0 GuC interface only.
>  *
>+ * The CGP address is also stored in the PPHWSP of Q0, for use by debug tools.
>+ *
>  * As it is not required to register secondary queues with GuC, the secondary queue
>  * context ids in the CGP are populated with Q0 context id.
>  */
>@@ -1051,6 +1053,7 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>
> 		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
> 		info.cgp_hi = 0;
>+		xe_lrc_set_cgp_gfxaddress(lrc, info.cgp_lo);
> 	}
>
> 	if (xe_exec_queue_is_parallel(q)) {
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 54d50b1b28eb..329e0ac571c2 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -705,6 +705,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>
> #define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
> #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
>+#define LRC_CGP_GFXADDRESS_PPHWSP_OFFSET 1472
> #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> #define LRC_ULLS_PPHWSP_OFFSET 2048	/* Mutually exclusive with parallel */
>
>@@ -764,6 +765,11 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
> }
>
>+static inline u32 __xe_lrc_cgp_gfxaddress_offset(struct xe_lrc *lrc)
>+{
>+	return xe_lrc_pphwsp_offset(lrc) + LRC_CGP_GFXADDRESS_PPHWSP_OFFSET;
>+}
>+
> static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
> {
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>@@ -843,6 +849,7 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
> DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> DECL_MAP_ADDR_HELPERS(ulls, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(cgp_gfxaddress, lrc->bo)
> DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
> DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
>@@ -949,6 +956,20 @@ u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
> 	return __xe_lrc_pphwsp_ggtt_addr(lrc);
> }
>
>+/**
>+ * xe_lrc_set_cgp_gfxaddress() - Store the CGP GGTT address in PPHWSP
>+ * @lrc: LRC of the multi queue group primary
>+ * @cgp_ggtt_addr: GGTT address of the Context Group Page
>+ */
>+void xe_lrc_set_cgp_gfxaddress(struct xe_lrc *lrc, u32 cgp_ggtt_addr)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map = __xe_lrc_cgp_gfxaddress_map(lrc);
>+
>+	xe_assert(xe, IS_ALIGNED(cgp_ggtt_addr, SZ_4K));
>+	xe_map_write32(xe, &map, cgp_ggtt_addr);
>+}
>+
> u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc)
> {
> 	if (!xe_lrc_has_indirect_ring_state(lrc))
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 840f303db97e..6338ca244b4c 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -124,6 +124,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
>
> u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
> u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>+void xe_lrc_set_cgp_gfxaddress(struct xe_lrc *lrc, u32 cgp_ggtt_addr);
> u32 *xe_lrc_regs(struct xe_lrc *lrc);
> void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
> void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
>-- 
>2.46.0
>
