Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3640C6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 15:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E2110E26B;
	Thu, 16 Mar 2023 15:30:23 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AE610E242;
 Thu, 16 Mar 2023 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678980619; x=1710516619;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UE8DV3iekzCzCd2E/DvFI5FjoRUf7xeHPLQNH7mkiSk=;
 b=N/hhYeYoYlTjmLD9J1Um65/v9EVmd+JXU85ppoH7/coKctTIZqUU3a87
 oz57g/4i4j83BB4x2vr797WnqMNchMlM35HkHs4c0+0mm5OWegHzEe3hm
 Ug7uEoRyqaDxkgfAGkQtVKTV3dOwvr2DSem3si3n4U5dnditVSxU4EW+r
 BvZrui4fU0qa4+sMWq7KvJVuWRHJriCQNVreWl1RoFfsNO5H3gMCXZtHO
 gVkyaI6pQzAJff9BoMCHfWa23cuFB3a6liv1/B8OJSWUfTnPmiREps6+i
 3U4s1721uN0i2pR56YJ5LUv9/OBxrv89GRD5Nfv9qFAXf8BzYHHXdApgv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="336716924"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="336716924"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="768998356"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="768998356"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2023 08:30:18 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 08:30:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 08:30:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 08:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk229Ha2a4+N7F8GzYgpjdBFlXz+nNFkf8dmznjRPq0o8eQ8wHqEaecqe04UZSkOZnPn55enpwFZ5x263Rq5EaIroe+gEAaaiJhSL4MjhaWb8ySBwMUjGqAlQmIN3KCLITeF4IzUrQ0bCUK7z14lHoKGQe3bvTgzsd2dTLs9gXqumJAoNLMcK3mru2uR5kH3LV4345GxlAShZwHpee5EW/QC240woGFEyocVQ2ECl7KFXCb9twjtHqtmrwYXUZ3FGHJB63dXQhM4tLvS8u14nfRxIlmrDLgrxk12C8pinNgTbnsir1VGGuotk7ixNluJrQNd+5/dlz14zLgeserSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XinM6F2TD9D8VE7OLhiyium/J6BgOwefYEb4Y6y+X3k=;
 b=IYv7MYoddQsKbRgy/YVLB1Y4YNHMAymgQIRwXSgVqJRJ/xhd1d4Q1N25qK1NzBKDjnBdgRK8svebmf+HXppcxGw10IFlXCbbxAs03hNMy1mRhFdzQysOgONHrZud2JJxNLwsfvyotCaoRB08ISZpOaA4Flm1QaWKT/toEM0aTF55v8pvwVTmuQ1EnGYpMLOH0Wg6ob1tH1VB3lGjHsW23fxRhNUsq3m7iYpSG1PPch0/NHtjA7W2yBvCtNeOBwcHq08h83i7mdj7etwOozR4Dq0lJsax4/YtA8Qi3D5pc0FzZmZcYCkvLzMC7C/8eO8ckIZiTmNO5bz8fuuEQ3A7aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.29; Thu, 16 Mar 2023 15:30:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.025; Thu, 16 Mar 2023
 15:30:14 +0000
Date: Thu, 16 Mar 2023 15:29:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZBM14me9pLBqchXH@DUT025-TGLU.fm.intel.com>
References: <20230316094723.63713-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316094723.63713-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 62259953-0de3-4971-1fdf-08db263356ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITuaNqKHz7GDEb38uPUmxq+bUGH42kxq8b6aH/LvDAi5vWVxNNg5nfVxe7wOJbJ6y13dqsJ/Jo6o8pgd8C6bcd4jDCB/xdnHrDTpb/3RMstOTkDTb/AhNdJF8r6Gpyxt5ALiIWZiUgNl3xXYUu4RRdzlUfv2R0k6XqmS3D24jSBhgP4/WIFVpOaHGzesultpO51byb9jltBajHPLeOrEAMacuAJMb9xW4MlOpuhq4bMCCmzXFhchGy2+6cqzyEku0ui8MCgYIY9yGb7pPPFV7x/7RhTCjvSxbIQinkq+eMmx1yQH+xNFaAvOKpT0L28x4FmqggvcgU29MbLTKFddKxg9yGjXS4ntAx2ctj9BwYDZa+fCg4b0AJA7CAhEinTAA+wOJqOV61gstaU3OkICfmxOzKUxaK3oV4J5kII0TGlInXSk2N8+UN5ZYN8m3JGWamzl/Q7qDf6OvyMU6OmiPvQX3+g2osH7AUUSsOrqD6tVoofuqtrifbE/9X6k64phjATQ2TQ5yHQnZArSIgfwViolp4+oWbonnRZZT1il1ocpUyru5NjOogUrj7Iv9m3sNUuHsMguixn2QmAs3IKRRhdHES0Q/fTJYm+3r8rmhHBMrU6QBIigZhPCHHJjPgLCoBMNI3ylUI8pT2ZER3+VOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199018)(316002)(8676002)(4326008)(6916009)(6666004)(66476007)(66556008)(66946007)(66574015)(6486002)(478600001)(83380400001)(186003)(44832011)(38100700002)(82960400001)(2906002)(5660300002)(8936002)(6512007)(26005)(41300700001)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9Sh+ehwXr35F6tFBqmOUHW0J0eIh9lr4qCh4urnq7FD+tzQue9ujXAnjhR?=
 =?iso-8859-1?Q?MzbXNUFPvbrN6imLeqr/OyqIbjH2+A0e1jkE2enbEptAXcAqcrR8QszUBq?=
 =?iso-8859-1?Q?nLr/86WNOSr7lSmFgP+rcuKqKuTQxbOY/9KA+8gj3dZaPnyCB6Z4ZOG7l9?=
 =?iso-8859-1?Q?hqUeXNIEYxHmoTZXmmR50LleUwyG5Sdn0c6gbB1dQK0nsHgOvctVJvX8A3?=
 =?iso-8859-1?Q?cn6Z5abSskqMSfrO4K6PsgBPqI9tjs+DMHg1Wt8iZIfe/ug9HdYGtmbOqf?=
 =?iso-8859-1?Q?WCOjnWwyJ6u9cVZ7Zk63K8vgfPtkVPG8Jf7pmbErXNSIkz2xemyt3HFYln?=
 =?iso-8859-1?Q?Hk6HnGeU1V7Dfsg2DRBSDth6h4FxsvvopbEwcsknQsBHxLRiwNym6KUnvT?=
 =?iso-8859-1?Q?3xbprUxTfwlcjqupkaJckqe6f72zW+m4n84EgKP7CcrI88zQEzGhSzHNGC?=
 =?iso-8859-1?Q?rwcE4RJLWnHhBc9L0nQNlXWBfwkmkfR4nqiQjtW1UDhRONBt7R6vEqyBwV?=
 =?iso-8859-1?Q?kfy+JELfAs6GFawBmrlVLuM4hqrERlo7BnzufLTmOvbEK4n3ltVL4+RDK5?=
 =?iso-8859-1?Q?LQwMjbAeuWyklWr6vH45E2/d0G391V1/vZ4tpkFahKnhNW27JpLBYkAGI4?=
 =?iso-8859-1?Q?Yb6GKUsGG5YvFihGPZzslpCfUZSjVWq6YVyJMjYaYGAv8tj5wPZBBQ3hno?=
 =?iso-8859-1?Q?yJNXrMc7QmiKjbwG0ML+8DRb+49hp/N0OFVC4yj+yrxbmMkNBmIb1kZTkb?=
 =?iso-8859-1?Q?VHVOZ8KgX8N4d5rnI3xOjt+6DYgvcf7bYU7bb69m1Ligliy0ofywBfuink?=
 =?iso-8859-1?Q?SPS7JjVA8tylAVr3TiUNkcxnkQFJ81wZEtwVnTyo5otlrpBYTY6kHnhoJ/?=
 =?iso-8859-1?Q?kn1v0AUtIhhlEUPdyutywGW/p95ahyzLPMMkHkv4VxmcRQ+6uTgJ2+YOge?=
 =?iso-8859-1?Q?K/sljPQVmsTac1YDcAz1F/p5337Vhjy2ij8NyKXIL2h1giKq0+aHCYFRJd?=
 =?iso-8859-1?Q?WCeec/sc3j/AmT7wqCG0TT2oz5wqUTkJYGOjUCWWDuJuc/9yKHUh7nQAzP?=
 =?iso-8859-1?Q?mhn9TG7yuSEmeknkNAklbcxkcja1sQVSPqAaQukUCsInH/sU7wX4ZCBb5J?=
 =?iso-8859-1?Q?nzwvnN5ZgndJBY3r7XuVJp947ILJeEBwhstkI4HUQi+O4lMYc+rCJh2E1e?=
 =?iso-8859-1?Q?tI6cYjsJRBYF32k0CQIKL1xtHpF8UwxreUK2U1UwJfl7/Ny4ZFawGZLQ/B?=
 =?iso-8859-1?Q?7+AxBQJJJNESGMAbXkSGb6mftOfO0LTC38R6zTw6dUysp+2/FWumEWN/Ku?=
 =?iso-8859-1?Q?hfBtlkNpBXnlPLZ2rprvp1cCCbwq7SA8z4QzvuEfzFSk26dRiwNEpNVIqc?=
 =?iso-8859-1?Q?ztu5A4TeUZbvL2c7+cIAFM4wySqz+pBpKffdff/uMcmu3J8A4tvOnJEimN?=
 =?iso-8859-1?Q?rcLWdN7Bt3qz4onFxpVUUVZcZqa2MK3Rdy7F2xRX8+ZHHaSG82zF7UMHzP?=
 =?iso-8859-1?Q?yN/O2fMshpa71xmVA8HTj+XzQ68yGzH3vdp2ITuw5lEcqkjqoZU2VPTtiq?=
 =?iso-8859-1?Q?h2Bx+QeYTaCq3UHN3BV7vIPX05+U6bfrXCL0D2t3eT+7mPbu0jaujenDIP?=
 =?iso-8859-1?Q?KAwnUAkc5pAqfRtdILoscZXskoILWEnmqCae775YrGlrswsCvzSDGqIg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62259953-0de3-4971-1fdf-08db263356ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 15:30:14.5470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1SsoEprPYPnq27Kxu1hIE8p5IRipBnxlS/a5PZ1R6GRtFSubC1vacGmf0uKSuPQMnsnoHAz/t0wVFlIZ8G58w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6043
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t v2] tests/xe/xe_noexec_ping_pong: Add a
 test to expose unnecessary rebinds
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 10:47:23AM +0100, Thomas Hellström wrote:
> This test creates compute vms, binds a couple of bos and an engine each,
> thus redying it for execution. However, VRAM memory is over-
> committed and while there is still nothing to execute, an eviction
> will trigger the VM's rebind worker to rebind the evicted bo, which
> will in turn trigger another eviction and so on.
> 
> Since we don't have eviction stats yet we need to watch "top" for
> the rebind kworkers using a lot of CPU while the test idles.
> 
> The correct driver behaviour should be not to rebind anything unless
> there is work queued on one of the VM's compute engines.
> 
> v2:
> - Use the ALIGN macro for aligning
> - Reduce the idle pause duration to 10s. (Matthew Brost)
> - Add an IGT_TEST_DESCRIPTION()
> - Explicity use gt0 for testing.
> - Skip if no VRAM available.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/meson.build              |   1 +
>  tests/xe/xe_noexec_ping_pong.c | 106 +++++++++++++++++++++++++++++++++
>  2 files changed, 107 insertions(+)
>  create mode 100644 tests/xe/xe_noexec_ping_pong.c
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 632e36e0..2e62ff23 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -256,6 +256,7 @@ xe_progs = [
>  	'xe_huc_copy',
>  	'xe_mmap',
>  	'xe_mmio',
> +	'xe_noexec_ping_pong',
>  	'xe_pm',
>  	'xe_prime_self_import',
>  	'xe_query',
> diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
> new file mode 100644
> index 00000000..dc14f8cf
> --- /dev/null
> +++ b/tests/xe/xe_noexec_ping_pong.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <unistd.h>
> +
> +#include "drmtest.h"
> +#include "igt.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#define NUM_VMS 10
> +#define NUM_BOS 1
> +#define SECONDS_TO_WAIT 10
> +
> +/**
> + * TEST: Expose compute VM's unnecessary rebinds
> + * Category: Software building block
> + * Sub-category: compute
> + * Test category: functionality test
> + */
> +
> +/*
> + * This test creates compute vms, binds a couple of bos and an engine each,
> + * thus redying it for execution. However, VRAM memory is over-
> + * committed and while there is still nothing to execute, an eviction
> + * will trigger the VM's rebind worker to rebind the evicted bo, which
> + * will in turn trigger another eviction and so on.
> + *
> + * Since we don't have eviction stats yet we need to watch "top" for
> + * the rebind kworkers using a lot of CPU while the test idles.
> + *
> + * The correct driver behaviour should be not to rebind anything unless
> + * there is worked queued on one of the VM's compute engines.
> + */
> +static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	size_t vram_size = xe_vram_size(fd, 0);
> +	size_t align = xe_get_default_alignment(fd);
> +	size_t bo_size = vram_size / NUM_VMS / NUM_BOS;
> +	uint32_t vm[NUM_VMS];
> +	uint32_t bo[NUM_VMS][NUM_BOS];
> +	uint32_t engines[NUM_VMS];
> +	unsigned int i, j;
> +
> +	igt_skip_on(!bo_size);
> +
> +	/* Align and make sure we overcommit vram with at least 10% */
> +	bo_size = ALIGN(bo_size + bo_size / 10, align);
> +
> +	/*
> +	 * This should not start ping-ponging memory between system and
> +	 * VRAM. For now look at top to determine. TODO: Look at eviction
> +	 * stats.
> +	 */
> +	for (i = 0; i < NUM_VMS; ++i) {
> +		struct drm_xe_ext_engine_set_property ext = {
> +			.base.next_extension = 0,
> +			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
> +			.property = XE_ENGINE_SET_PROPERTY_COMPUTE_MODE,
> +			.value = 1,
> +		};
> +
> +		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
> +		for (j = 0; j < NUM_BOS; ++j) {
> +			igt_debug("Creating bo size %lu for vm %u\n",
> +				  (unsigned long) bo_size,
> +				  (unsigned int) vm[i]);
> +
> +			bo[i][j] = xe_bo_create_flags(fd, vm[i], bo_size,
> +						      vram_memory(fd, 0));
> +			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
> +				   bo_size, NULL, 0);
> +		}
> +		engines[i] = xe_engine_create(fd, vm[i], eci,
> +					      to_user_pointer(&ext));
> +	}
> +
> +	igt_info("Now sleeping for %ds.\n", SECONDS_TO_WAIT);
> +	igt_info("Watch \"top\" for high-cpu kworkers!\n");
> +	sleep(SECONDS_TO_WAIT);
> +
> +	for (i = 0; i < NUM_VMS; ++i) {
> +		xe_engine_destroy(fd, engines[i]);
> +		for (j = 0; j < NUM_BOS; ++j)
> +			gem_close(fd, bo[i][j]);
> +		xe_vm_destroy(fd, vm[i]);
> +	}
> +}
> +
> +static int fd;
> +
> +IGT_TEST_DESCRIPTION("Expose compute VM's unnecessary rebinds");
> +igt_simple_main
> +{
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	xe_device_get(fd);
> +
> +	test_ping_pong(fd, xe_hw_engine(fd, 0));
> +
> +	xe_device_put(fd);
> +	close(fd);
> +}
> -- 
> 2.39.2
> 
