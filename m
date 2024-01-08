Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64862C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 13:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F9410E272;
	Mon,  8 Jan 2024 13:48:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE2610E241
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704721708; x=1736257708;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J4C7QEnjAEAJHT3BWeG2KxH3ofglEzHoMaGuyfcFjkk=;
 b=PZmbhN1tRV2q1s2lK6G3rmsrKvf4VNct5Fn2tkkdWWhe68cgsNM6Fr8B
 QLCJJvtuzOfLW2FeYxEFg4aydSDO4a93VcKRY2mmY8pCDsNsHWXX97dJi
 yiw7WfO2oDa0uowSdqSTt3P+LBVOa+R4AeB6VdS2E81Re6zNmA93py0MB
 N1VoxUWR4P69+OvxY2+UINNA9ww7yxVVczl3oMsOGZmCr2C5XYV3q4tsX
 HDZCwoHLMQZK2Gd3R3wl4q3JKvmroOXdNjgo8tqFC+xMo8YMgLWQBHkcp
 77qG93kysepJU500tsY68AcYBzh3CxmCRYChAeiIsey3R0Bnq7p5zu6n6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="396766302"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; d="scan'208";a="396766302"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 05:48:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900380049"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; d="scan'208";a="900380049"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 05:48:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 05:48:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 05:48:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 05:48:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7ugKhOGMtSyaGiakDow4TgegDh3hpMo5xvr1H3+oig6rKsQsFKwh7BqCiRD3XmWIS6IZ2lr8nqOflA5zjQFhDulrJdRhRlXi4VvV0XcDCBdJqBmwrT9ytojmVSlr67c+Vk6LiYoxxu9l7ahoqQ1j1oJvZCPGu8OHJbBI1oHgEd90wrmmDyJrPQsjGrprFi0znH/6Br90fdpx4ob7Lsb+jfpDrG1QGKdI4sdaLnQlzV7DT/GbhW4ju+lL1DJ68jVKhIiOHamlA/vjl2Od80lYFEVTs8lFlHJfM+Q+jjhvQK24RM1GW2jU0wEL3PazMTtJ6yF4iyWroBYMizrheIXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPVx00S+0DHF5+CJjbeOPUwXQtaU6GnLzXVoQcyVw3g=;
 b=j7XkXrOlGudqlCOxUyIockDcWQwtilA25aps+1c7NZ57E31S1h1DGOhPRNqTrXXMLDc3QpbGeE04YJfAohoNR/u0cwtPsd0gAbFpRxWzOD2YtcikPEtIZbwIs5U5ngDl4Z0ZoiW4XQeG6a8rQNdD74eCylYnYZGDSaloTpixv60Xciir6O6JCZ8oV+fiHHgRTsn0bMHdf+LBLXgF86aoxTUfYMZ2aT1t57UmFwJElykV8gxQgetzvAOggPBIQYZzqw6DtBG2CBOGu/wgKDhZ/zNdil+euw2NE5YLfa8e5RgcW33ICNqpD2eABbfN/K5V3qnLnSlSGxRGFL9s45CBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7125.namprd11.prod.outlook.com (2603:10b6:303:219::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 13:48:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 13:48:25 +0000
Date: Mon, 8 Jan 2024 07:48:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: Re: [v8] drm/xe: Add vram frequency sysfs attributes
Message-ID: <4z4eujmhi3jjeoltbw6zd6s5w37h2bdkjftbrryoogzp3kzfls@vgccbpvu3sli>
References: <20240105124503.1821966-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240105124503.1821966-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 1454c94b-15dc-49ef-0d9e-08dc10507c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GLpl13VtnvtKkphOs7IVUbx6SeFEhdSVNusioYbXDhd/voNLORQV8KQouW04ELJOjdAgp1gtsjFCe/kYVWs7+zREsofwur4nrBl4uyr23v0CYnBj/MPQtH0Z86kL0F3mI7T7q8aGv13+dqx2PAT66WU8YdrhXxlRZQx1CZHhgBrGIWsg+HCahMu0QMMKP/n+AyoeJDiDxo74lWMdsc9IS7KTY9BffW++JROQbGcp9liVXoOR1b/0jg5wEnHQwZZphXx+81tiXnpG9BJe9BHcXuxmxX9S1/YGsHNnFP5vAAAHn2sDMUDb7NRk+m+zQtxNwFlCT3EyndJHpO/oeofqx4XJhlGpNBfjYnU89/O07KvR882POT1qJRVnTdZxykk6pZykkvvHFhElSfnpq5Bnu9y3lP09vysD7+NK1zsRHAt/fpkwSQFG6Lfs6zdrULHV8jeEt4ka6n9tfz3BVuG5DBZot5mPV3XjamuXyf//iNlH2Rf4N+wkgREWjKGYEPg0zcGYm69sUShPQvD13GJ+TUshTpmk6UdApDlJN7bc+s1PeFZY0EMPlkeAyraPXP+F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(136003)(376002)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82960400001)(6666004)(478600001)(38100700002)(6512007)(9686003)(6506007)(26005)(8936002)(8676002)(316002)(6862004)(5660300002)(2906002)(86362001)(4326008)(66556008)(6636002)(66476007)(66946007)(41300700001)(33716001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LPov8YDz/MH3Bas2Xayvo72E3sTuaf9LxJcat9diVif4GVvwNKe9qGJpjU?=
 =?iso-8859-1?Q?UbpM3DKeXpZLULdqBgtxSjpLVsqmaITyMFDywMxyM9RAE9MOG9hOBGB2nK?=
 =?iso-8859-1?Q?YkHSvWRX3Q7EXY4hBq83+wB0xqjQKNYpLsc5uMtFX4cq/Km2siVT26DoU0?=
 =?iso-8859-1?Q?4mCJ2mpxjkz+RKZKfC2C5u+JYCIYcgTFJJKMtt2LECMv2XMjhVAN9A+QOw?=
 =?iso-8859-1?Q?PUgIuUjjUCnSy8sBI3PdrNIB4ZyMD1xZSjYkP9PfKsn7jh3DqF5GqSr4cy?=
 =?iso-8859-1?Q?5OpKjaegldc2NRO5HNXlto7aeIqDQbqWpTvkYhZPYDHsIbFhBRd9EGyRVA?=
 =?iso-8859-1?Q?VvHCbc11YHdi7LtVSxpdV2ExD5a0pDHv9ZTvavuIGMP+a9LxCvf9lGc+eM?=
 =?iso-8859-1?Q?NaM6104T3KxMpdqd3pneolc9LA1kbxBDP0xI3lrLL/j6S1nLWvs9Mbp8Vn?=
 =?iso-8859-1?Q?BSUM8WfH7b1OpgeaHA+bB1iqVc65R7NCc52bu4pSsg51YJ32C6NuyEIRXm?=
 =?iso-8859-1?Q?aWVt4aecFj4Mrbri7EeVCzuBaGdPp+KSExVmryhl+bmt5e8Ur/0RAfWhLa?=
 =?iso-8859-1?Q?GL8xhLU0j0uKWDwOEs0kPJLfsdkjFDoS/e9ZHdTcNJUlkycKSaMSPiDvGh?=
 =?iso-8859-1?Q?EttVryLCgdS6MOOP4nu+QT9wSlJLiuHbU3g4TbioIfOIqYgpkUlsV7VJ83?=
 =?iso-8859-1?Q?mTnl6P2bPdQ6FFTVipiJS2yINU0oM7p8l6P3IsbinO0GHPIGLPRVz4G7TM?=
 =?iso-8859-1?Q?0f1yS8YfyIaKo0oYIJGbMeFQ6I/m6JfQBuMVjch/QOT0CwufNpLX7mvt7D?=
 =?iso-8859-1?Q?irWcuEQK1htdfN73MN1fzPr9VTQ/VgcdRo/nIAb6u2ocohwXmyveUOnOTx?=
 =?iso-8859-1?Q?tSvQd3JH4051vc4ev+ER8GxXifJqKCpV2C8jO9veFtHtvFHZUfQz8vhZf6?=
 =?iso-8859-1?Q?PoKuRelmhbd/b6eGlcjEIODzvUY64bsXNcfZrAAic4lPOn9t6JOZTRE8J/?=
 =?iso-8859-1?Q?TJVXqGHvUhiSFfTru0ogiSZ9HZmc9W/UfMAjlFGFUmeD632fofnHcGAK34?=
 =?iso-8859-1?Q?NdSSKYgbu7mU0422zwSZyNntZELJJ33sOvgGS2Pp+MF6bajZ7geGWcFX4u?=
 =?iso-8859-1?Q?eOVS80kzSTwL12ML3PhnEVl4qOepIekAWIAucDRvSalwocRmUJjPKTAHoX?=
 =?iso-8859-1?Q?OYMCBhvsDEHKE8uujj6b2Rv25KDI7cMLgTH7wJkt2c0AzCxdCIUb8/vU7X?=
 =?iso-8859-1?Q?NGm6sTv/SYoOC0c7ptlJZJsAlFKL5g9UVT+hW26YM+2aEg1zZUdSf21vFH?=
 =?iso-8859-1?Q?vlvbUbEL6sT1SMR5y507Cdw/XvVLhf4dIHcHPhHQB+sdATj/9A0KddAufz?=
 =?iso-8859-1?Q?qHszwk34tzY+/voLovHMX1fs32yL8HE6YxC4xKplqPZFjCG6dyH3b/eQWJ?=
 =?iso-8859-1?Q?1NhlBsQ95Omsa/3ZWfKj7jQM0q3zcImo3Au0fFzN+BnvswN2shm+U9IAXG?=
 =?iso-8859-1?Q?zdB5qgI3bn1k2fHYwnn06yxnTWymiXsfHDN/0qJOSPxyABE6HlAjXWbaaw?=
 =?iso-8859-1?Q?BobKsz4AeRryFESXkEH5KZEbM0r1MNZ/HqudM1lxAJaUB07x3jeIKWdrvJ?=
 =?iso-8859-1?Q?8dqCQggsLFgME7jh1qIX/1krqNJgaSHuDMMl7U5mWeC6kSErhBkJoxSA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1454c94b-15dc-49ef-0d9e-08dc10507c5d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 13:48:25.2282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lWc/phqgohYC1j3hUXPwBp2jM3D6myxhDBy8/KOk2Qfo89lHXucvIKIYJ/YuH1oup/6/la/4keo71t6WLV6BccMHEJ3sOpzVYt7D2489WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7125
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 05, 2024 at 06:15:03PM +0530, Sujaritha Sundaresan wrote:
>Add vram frequency sysfs attributes under the below hierarchy;
>
>/device/tile#/memory/freq0
>			|-max_freq
>			|-min_freq
>
>v2: Drop "vram" from attribute names (Rodrigo)
>
>v3: Add documentation for new sysfs (Riana)
>    Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>
>v4: Create sysfs under tile#/freq0 after removal of
>    physical_memsize attrbute
>
>v5: Revert back to creating sysfs under tile#/memory/freq0
>    Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>
>v6: Rename attributes to max/min_freq (Anshuman)
>    Fix review comments (Rodrigo)
>
>v7: Make documentation more verbose
>    Move sysfs to separate file (Anshuman)
>
>v8: Fix platform specific conditions and add kernel docwq (Anshuman)
>    Fix typos and remove redundant headers (Riana)
>
>Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>---
> drivers/gpu/drm/xe/Makefile        |   1 +
> drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
> drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
> drivers/gpu/drm/xe/xe_vram_freq.c  | 129 +++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_vram_freq.h  |  13 +++
> 5 files changed, 153 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c
> create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index df8601d6a59f..17884e422cec 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -139,6 +139,7 @@ xe-y += xe_bb.o \
> 	xe_uc_debugfs.o \
> 	xe_uc_fw.o \
> 	xe_vm.o \
>+	xe_vram_freq.o \
> 	xe_wait_user_fence.o \
> 	xe_wa.o \
> 	xe_wopcm.o
>diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>index 5935cfe30204..f153ce96f69a 100644
>--- a/drivers/gpu/drm/xe/xe_pcode_api.h
>+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>@@ -42,6 +42,13 @@
> #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
> #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>
>+#define   PCODE_FREQUENCY_CONFIG		0x6e
>+/* Frequency Config Sub Commands (param1) */
>+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
>+/* Domain IDs (param2) */
>+#define     PCODE_MBOX_DOMAIN_HBM		0x2
>+
> struct pcode_err_decode {
> 	int errno;
> 	const char *str;
>diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>index 0f8d3e7fce46..ed60d12f5cf0 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>@@ -9,6 +9,7 @@
>
> #include "xe_tile.h"
> #include "xe_tile_sysfs.h"
>+#include "xe_vram_freq.h"
>
> static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
> {
>@@ -50,6 +51,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>
> 	tile->sysfs = &kt->base;
>
>+	xe_vram_freq_init(tile);
>+

this breaks the current abstraction we have in xe. xe_tile_sysfs_init()
should not initialize random components and only care about **sysfs**.
Currently xe_vram_freq_init() is only about sysfs, so it should follow
what gtidle did, with the sysfs name in it.

If this is going to be extend later to be something more than sysfs
only, then instead of renaming this should be moved elsewhere.

Lucas De Marchi



> 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> 	if (err)
> 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
>new file mode 100644
>index 000000000000..ea8b4511767c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>@@ -0,0 +1,129 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+#include <linux/sysfs.h>
>+#include <drm/drm_managed.h>
>+
>+#include "xe_gt_types.h"
>+#include "xe_pcode.h"
>+#include "xe_pcode_api.h"
>+#include "xe_tile.h"
>+#include "xe_tile_sysfs.h"
>+#include "xe_vram_freq.h"
>+
>+/**
>+ * DOC: Xe VRAM freq
>+ *
>+ * Provides sysfs entries for vram frequency in tile
>+ *
>+ * device/tile#/memory/freq0/max_freq - This is maximum frequency. This value is read-only as it
>+ *					is the fixed fuse point P0. It is not the system
>+ *					configuration.
>+ * device/tile#/memory/freq0/min_freq - This is minimum frequency. This value is read-only as it
>+ *					is the fixed fuse point PN. It is not the system
>+ *					configuration.
>+ */
>+
>+static struct xe_tile *dev_to_tile(struct device *dev)
>+{
>+	return kobj_to_tile(dev->kobj.parent);
>+}
>+
>+static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
>+			     char *buf)
>+{
>+	struct xe_tile *tile = dev_to_tile(dev);
>+	struct xe_gt *gt = tile->primary_gt;
>+	u32 val, mbox;
>+	int err;
>+
>+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
>+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>+
>+	err = xe_pcode_read(gt, mbox, &val, NULL);
>+	if (err)
>+		return err;
>+
>+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
>+	val *= 50;
>+
>+	return sysfs_emit(buf, "%u\n", val);
>+}
>+static DEVICE_ATTR_RO(max_freq);
>+
>+static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
>+			     char *buf)
>+{
>+	struct xe_tile *tile = dev_to_tile(dev);
>+	struct xe_gt *gt = tile->primary_gt;
>+	u32 val, mbox;
>+	int err;
>+
>+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
>+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
>+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
>+
>+	err = xe_pcode_read(gt, mbox, &val, NULL);
>+	if (err)
>+		return err;
>+
>+	/* data_out - Fused Pn for domain ID in units of 50 MHz */
>+	val *= 50;
>+
>+	return sysfs_emit(buf, "%u\n", val);
>+}
>+static DEVICE_ATTR_RO(min_freq);
>+
>+static struct attribute *freq_attrs[] = {
>+	&dev_attr_max_freq.attr,
>+	&dev_attr_min_freq.attr,
>+	NULL
>+};
>+
>+static const struct attribute_group freq_group_attrs = {
>+	.name = "freq0",
>+	.attrs = freq_attrs,
>+};
>+
>+static void vram_freq_fini(struct drm_device *drm, void *arg)
>+{
>+	struct kobject *kobj = arg;
>+
>+	sysfs_remove_group(kobj, &freq_group_attrs);
>+	kobject_put(kobj);
>+}
>+
>+/*
>+ * xe_vram_freq_init - Initialize vram frequency component
>+ * @tile: Xe Tile object
>+ *
>+ * It needs to be initialized after the main tile component is ready
>+ */
>+
>+void xe_vram_freq_init(struct xe_tile *tile)
>+{
>+	struct xe_device *xe = tile_to_xe(tile);
>+	struct kobject *kobj;
>+	int err;
>+
>+	if (xe->info.platform != XE_PVC)
>+		return;
>+
>+	kobj = kobject_create_and_add("memory", tile->sysfs);
>+	if (!kobj)
>+		drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
>+
>+	err = sysfs_create_group(kobj, &freq_group_attrs);
>+	if (err) {
>+		kobject_put(kobj);
>+		drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
>+		return;
>+	}
>+
>+	err = drmm_add_action_or_reset(&xe->drm, vram_freq_fini, kobj);
>+	if (err)
>+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>+			 __func__, err);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h b/drivers/gpu/drm/xe/xe_vram_freq.h
>new file mode 100644
>index 000000000000..ae3ed6ce68f8
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_vram_freq.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_VRAM_FREQ_H_
>+#define _XE_VRAM_FREQ_H_
>+
>+struct xe_tile;
>+
>+void xe_vram_freq_init(struct xe_tile *tile);
>+
>+#endif /* _XE_VRAM_FREQ_H_ */
>-- 
>2.25.1
>
