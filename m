Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFC4C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 18:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4518F10E593;
	Mon, 24 Apr 2023 18:00:18 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5E310E5AE
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682359216; x=1713895216;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fvqm3BkSbWX5ZZ7j7tTVCTAr/X+pXK5FiPOTsI9iPy8=;
 b=kLgjw1YwOcYUdUKgKhHo5DtziOJFYMKWHfu97g+zkCZQ6lF9Q4QJM/fd
 HWSkgKzZbA/I82Fz1Jp/OFHWaOSkAWVhkNSja6u02S8WcpqTBUi+XuaCg
 QAOlCHptfmuY/KjuXCAzAn2zJnYPMuIkbHCmhrUwW/nXInW83DEEU+ZNj
 N7sFpMuHQm2GvKU7ZaD2jFatGV2Mnm2e7Qt1QWhglEoRCCcu7nDyHZYiH
 NfYpeHLzG3aXu3o6NAKQqObpkOfahkR16kBKUdMyuLmCZT8iAwn2t6CE7
 0GXiOKa5oV8iNJwd39GGSrKJ+cpmVdHPjwREWKwxhYhLeSEKGLl0VxOQl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326128133"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="326128133"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 11:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022809999"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022809999"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2023 11:00:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 11:00:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 11:00:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 11:00:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 11:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTuyZ6mzJ0sRW7QHuqd1ver2PHfoMETKsvpr4GslvtnQ7rCmkrE2X+u/CL1tt5vza7m6YNy1xzjTXks2fVWHAcsizuyFSe96icz/nM16jnkb6b0OCf+fhyqgtrwiLyDFDS5PfWvjCmVgvRI/WC+z2YB7c4LbI3rNvpEhHv/Z6WtXgzxD4q7QbCdvyjBJjwoqGWMd3dtr3vavf/WIw06lJaNWuakgItKoKwKyDGHZA8isOHcuV68aNuywNr8nTGyAfIxWQId3SbX6OWpl67AeFIm755eEmPYx5b9vI622KL7uRIcBOOlBAUa9DlHtAI2ZYGCLVAtbnes/DDosLR3ktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSDWi9cm/nbTKfLP+aKrahwr0++cGViHgBIvOALZQ5M=;
 b=ncOGmn1WZrQ6VUGZ/AZ4i+Y6SpkuApd6fFekWUsGyj3k2RW1zPvBUsRYd3Zele3YYiDuNV6hY9FdzPTbWUsdZ+Y1mcolSNeWZbvp02yvDmrSt1SPr5YJ2OVyh5vqhNqKO9+Paet7lQk5cb1pwcryTpwBs0RqMBhQK1hsQL8xK1tOVlPx1oB2rz1LI/ZCmzQZ3TCFdxQu0JaG7vcsLibzoInQXsRefSOoVgnQAYjl/wiU3KtA9WDGyLu4OWa0vM+oUkOdWFHn8kDl4h4I0GlQtW0aW5F2MLcSJO1kulg//Pp1S2eHKO+z5W8fPb20fjY1GqwyY8rOjNzKAro/k7yeFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 18:00:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 18:00:12 +0000
Date: Mon, 24 Apr 2023 11:00:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <k4jurq5uaqf5qj4vcucj2665vtjcoinu7pkdhzgdle2von4pnb@26a3qblvfbut>
References: <20230418230247.3802438-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230418230247.3802438-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5242:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e000e4-ce35-4b33-992d-08db44edbfac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o9uCF7A+fcenwUIwByiRKKliA/pwPobUL+XINgiJDpBQ5IIuL7rB/M1ErkeLsmcez/vFnDKPBeJmGXarw6Z8+9KG1koMhX9R7ReAqRkEYxD/zhILyFdSuFf+ERNZW6iunlPXrgeBA5FOvTFLnI/eH/WteupYQCD972vSN3xGVb4ukpiv5f7AMLto+Dqv3LDarq99+JiRdzQHHsU0IOCl8wa0OU8ckAfn5SSdhiaoU45HSKTGZO44Sr4ILs64Zcp8Bjd3tkv2rIn81CrTPOESP1mjWkfb7deTq/QfqGHwyidj2F3ZOLjdAcdMsU83CJcKK5mcJIU7BaBFQYqlM4K8PdmfhAIK1Fsi51hmUm2zZ1sDA5vsP8RBvA/z+Gz0zy/ZSwALBKtop48xvJkpSidWKMT34TtNIG/CMnq6NKfcSWoqxzh8iY168TV/iEM/ly1QaiYN3Ilv06a+ZdNIsub81WJ2zJDKwirE1rSuDNsoD9AbdyuKysCKEOgFpLofWHesLY6AOjLnsktICoMS+1qnfdmQd2Ar4SU8xNaJIkDwABJS2n9FCLiCHvE+/wQY4a80
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(478600001)(82960400001)(316002)(4326008)(66946007)(66476007)(66556008)(6636002)(41300700001)(6862004)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(33716001)(86362001)(26005)(6506007)(6512007)(9686003)(6486002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gdxx1P0hvDPfNdZp52Jvbw+7hL+/ThtIYhTSzftBiOPL8rslqvhUZ5oUrgXG?=
 =?us-ascii?Q?FNtXBnsuJ6vUdXBzgQZKRhgYEDMcjjkgqyhHMdDRs3AM7byWoxnLvb9nitV7?=
 =?us-ascii?Q?R/AXkULKV6hpKMCqI1oxNxg+o2zOjsB81DIjnBVdwZuD9CDMBaL7GFV17Qms?=
 =?us-ascii?Q?MBanK05hFWH1yV22kpO8PME1Fcd0J0irygcb8UxUxGGntkd0vxVdLRoM9njL?=
 =?us-ascii?Q?JxQRdhhqMFGFgIXNKwn8XHqC59tqtUzA+qE+0G904H64Zt8T8YhOZksGMbLD?=
 =?us-ascii?Q?RUJ+mHLgKMKozU5jEtNOPdpBAov1HDMnrkF9s3cgvbEaycyMSqy61AKR6Fcf?=
 =?us-ascii?Q?H+sd2ngPQA71aGYoPMXDjB55xoHb13KuRuzgYdDHNZqtCiFiUpD5Sp2cMMdp?=
 =?us-ascii?Q?s6jwOGMHnHfoCIGXf6F+ad+35fDytPShteVxdxEKHa6xy3z5G+djhtsOKLe6?=
 =?us-ascii?Q?a8dd9A5QB4OpxqZbbTmCmbcE5cu2DBGFtHjO3GnuEjhrA6Trmy8gpjVvM6D2?=
 =?us-ascii?Q?DcLulSk0GPSZxPBsmFZ5W7FkHb1CXDqI2gkvX27xD+6ixA8snQvSEcQk6cwO?=
 =?us-ascii?Q?FrlxByjDpw3AanI4R5r3tpKK24XqDgBCmPnuIvZKhf5wy5FDPTMx9q7hOEhZ?=
 =?us-ascii?Q?G1pxPBn34AEkIKLqrvrujx4iAypLlkXZyOSoN5ORehn8LAHR+OTZcEfZSjNf?=
 =?us-ascii?Q?OoSeBmFIRflH440+ELEOLT/EYnPOufXVV0D6x2iFakd0KwQNfmFQAI7SVsRg?=
 =?us-ascii?Q?PX7YNaB/S2V8mfVPkMepIHZk4cK5mYGA+Vgxz1MhEkeKkpaTYqIFdqTQih51?=
 =?us-ascii?Q?e+ZLM95Mv/qyqH9+/YHTxk+/9vkyr8pau+qFEat9FXg8+Xs78Uc1pkEOt1Hb?=
 =?us-ascii?Q?e18006rbWzdmvY8bYkz0TAq/WlIZlI+6oXTaAZdWfhCqrKfEigD03eHNAl+j?=
 =?us-ascii?Q?12S/bErxqy9ZelAAhL6P3VDcYojb1d/+RSWWx/3u8+WVKeBkPXBonjAIkmU6?=
 =?us-ascii?Q?HkhS+l32ADthamh6uMphPMCSL3mofYID+u8fuNzZ1mtPjnTForI4YSIjDeeZ?=
 =?us-ascii?Q?xdQjJreVmcx4RZ8gAcI7qhWs5bFrSj0rL1qAmiayHJkmW4DAI3exCwZIkIsW?=
 =?us-ascii?Q?P/EsIH+PRRaAKTFuEp/PnR4Kkf/R3hia3zzuLRvir5MM/hf3voNP5L2xIb88?=
 =?us-ascii?Q?++ERbMSpz/m6xCpZMunNX7Enu98RhDCEMfeuQoeTbS19S+NTZCtf6fed72Ys?=
 =?us-ascii?Q?MsLCcFfRVwScB/xFk3tCyZHIXccsI+VJ/ujKZba7Tswd6G77jib1wNG+BVI1?=
 =?us-ascii?Q?Q0fSCU4c1z1P1G5fQTNjzL1a3b2bqKfo+IKc/MVr1yMm1V394HCwUNXTKI2V?=
 =?us-ascii?Q?IfUi6H9FMYx0vJClNXWY0v285Owr1tfvgBclcC3uu72xInB5ayfBRVcKjq8a?=
 =?us-ascii?Q?5IG2Q5KduHQrFI2Pzp3ZehFN3hM6/acTuxpUGlK/si8RR/ifAbNnyfI9w+MQ?=
 =?us-ascii?Q?fIO8GXkrkoRMQG+16ml+qvq+I7Ho2QIfF+mDMLZrdAqnr3QAI7OSEiMLktsn?=
 =?us-ascii?Q?UuYJcOx9TJMjy3lfTgIm5+SgKxWwRfzvFSc2YVzo13lFiOSgwEmzbDIV9bvm?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e000e4-ce35-4b33-992d-08db44edbfac
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 18:00:11.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nxmweN3RVln8Zju12UYHSMDXJTeSBSHIUeyteZYs2RNA3tKj1Nii5clagWolTWrIYGfBHozrNpStoLz8Mth/DJPIY0Yy+fdP7t600KQans=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Drop GFX_FLSH_CNTL_GEN6 write during
 GGTT invalidation
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

On Tue, Apr 18, 2023 at 04:02:47PM -0700, Matt Roper wrote:
>The write of GFX_FLSH_CNTL_GEN6 was inherited from the i915 codebase
>where it was used to force a flush of the write-combine buffer in cases
>where the GSM/GGTT were mapped as WC.  Since Xe never uses WC mappings
>of the GGTT, this register write is unnecessary.  Furthermore, this
>register was removed on Xe_HP-based platforms, so this write winds up
>clobbering an unrelated register.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

should also drop the register define from the header as this is the only
user. With that,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
>
>This write has also become unnecessary/unwanted in i915 for newer
>platforms (gen9bc and earlier do use WC mappings and need this write,
>but gen9lp and beyond do not).  Fei is working on that and should have
>an i915 patch posted soon.
>
> drivers/gpu/drm/xe/xe_ggtt.c | 5 -----
> 1 file changed, 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 0ae373b604f6..531c685cf2a1 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -196,11 +196,6 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
> {
> 	/* TODO: vfunc for GuC vs. non-GuC */
>
>-	/* TODO: i915 makes comments about this being uncached and
>-	 * therefore flushing WC buffers.  Is that really true here?
>-	 */
>-	xe_mmio_write32(gt, GFX_FLSH_CNTL_GEN6.reg, GFX_FLSH_CNTL_EN);
>-
> 	if (gt->uc.guc.submission_state.enabled) {
> 		int seqno;
>
>-- 
>2.39.2
>
