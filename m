Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31804C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 15:27:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CFD10E098;
	Tue,  9 May 2023 15:27:55 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377D710E098
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683646073; x=1715182073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qQELCCT1abtiqKFgW1t53GPZRghF7H88b79bIDSu8ao=;
 b=CWc5AvcLWWPJBjXMY9OVrpNma8Ts5LjDcRwOvNsg0aaVMHNf7wkDrdAg
 p3WgWedZge7fIlHJK/Amt7g3gnxIxilpFIrm9CwGb9MrqrZGD8tumuw0Y
 O8S9Odzc3NTjWU7CNruwHmcbwCRjCQGDE4KlpRdU0Lz51k47EpC/Osd7L
 sVqkgjyKkYt8ji74Up2wje+TEu23LkhdfSZDH3ZKnJY5FjM6a5hNrDCpE
 YEEFY7AIgkd4IIjLlc/dqOsgF5KExAntzYmov7m5JE/7saD4apANWbb1i
 LpewwyppV/7HQBGovCyXcYcmp+TZUYnaSOS2nuookx0p+mvwX4E3rGVrl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413233976"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="413233976"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 08:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="729564446"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="729564446"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 09 May 2023 08:27:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 08:27:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 08:27:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 08:27:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 08:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fnt7UjW3U9sPVdlmE5j40+0VEyH6pVvhVsZm3srTcKTQSEdvRx+UDq1IpUxJIFoKt8sPUVoU/M9LcaW55orDdbC4PiVLfTtMFFWiW1pMrL5YEW6rWFn5UD+rZZdgJgSRCxwhGMgQqy3I+ZXYObrvk3v8NzotjRm5MVPCVMov4VFTWMRBN7bJT/VrscLS1fsj+TTJsJ81C6bfAawRJqE5/OE19UWSCDpQO5fYzUMBH7I5cX2Yta3oR6gIkqtyRY94FPeZYGHgjDyH2lGUvSSbcVH8olhHb2VHusZOF5fGp1Y5sFK2Q9sGbDtWin/+r786hm06YNcYUWHB131MlUQ+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9HjDfzJS3knv3mUk+jVz8oRctWySfr2x8CcQdF2HUc=;
 b=f5tIpURv8aWCEfDyfnaWyK/VstVMAnaQPhXCo9RDCSK9wPcxF92XyXrY5+M23qtRD3sPkq2aWPkkr277mlpTUnGq/xqFoQBSJxahU3FMSAKfwHjgQmS+Gfnz6CgX5eO733elIsb4AkHATtbL7nwjdILsxhgXyVRUWIpDrmDZ4rFBSNTjUP6Y+y0sCYnUDLQcTz1gd4jzNvWzapZ28YKnoNwH3sjZLCTq/muigXJXBmbasUoRnZC2g4FooabNJflyxZiEkLntYwo4Ey5futUZmSDgBnKNzvAzv/nt5Re6uRtQnezaCFNE6Z3D+DrNPRj3PUAciwF2OdubuAG8KE3Q1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7841.namprd11.prod.outlook.com (2603:10b6:610:121::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 15:27:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 15:27:48 +0000
Date: Tue, 9 May 2023 11:27:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFpmcAvaDivFp8ME@intel.com>
References: <20230508225322.2692066-1-lucas.demarchi@intel.com>
 <20230508225322.2692066-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230508225322.2692066-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b633f72-6f01-4fae-1af8-08db50a1f21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZclK5CJ+PL1C1SjyIctL3K+EYJlv5lBhx84fsxxvzCL6RELTXx6OATgykQ/qphVURaJDPFmqpi3mI6AFTGlt9B5e8trTkfv3HAG5KfQuNo3TwnjdrtRYh5VI6Tq94QrlalZ+6PR0x32ieEEqrOU8VHpVz/9eLJMTYGfEDIJXfyuQ9v7B1dQkkiJtg1pCS1H2uzQEYkTRZXXuXof8kafoisg+9paSfSDxfya7z/a284KeURjhTT8nvjmyx4eBO5agGftxgXlOfQUySrZPKMpLZccI5sadm4HTM20JDFcshm/2E3n8+dBCM1dRvReBGVbjW569NSEGMJEy3IKt63zX29qoqGtREXFd7kynZV7iVbakhtD7cWou3MbBdfcBOCvaSpa4ioFDOuEZvuCPt3QHivzQA1ezs/I0FrST/GC9gcsMUXOuQObnsiN+djKYczkcubFgJWMbUkI9oLhHcT1WFXVb1W3l7rouQ7dih97PlickGmgW1gfAHYeESTaYyVcKfaIksOHEWGWt4eaQ8Osz8SUyvoPMMbinR1PxMEriVJzNoRMfsFy/9Dq2ErULDbdT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(186003)(2616005)(83380400001)(2906002)(30864003)(36756003)(38100700002)(86362001)(82960400001)(6486002)(6862004)(8676002)(8936002)(316002)(6666004)(41300700001)(5660300002)(478600001)(66946007)(66556008)(66476007)(6636002)(4326008)(37006003)(6506007)(6512007)(26005)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vQw3dIcGim/2BA+jrSuZsDm+ofSq+KMC7EFB+KveWr0JzgadG2/Ka8eUZf4z?=
 =?us-ascii?Q?wle7pNtvEdmuVOskzpDlPjkwCvQm08VSj2udVICstmYM1k7UY2l2PfZ2lxc+?=
 =?us-ascii?Q?eUIQtbFUx3Day0ekQPFZRk1eAiynuUreyiv79UP/Y9pM9FNAqOg311N+ovIH?=
 =?us-ascii?Q?aUqA5rL5CUBRpPftYNpjBV/bOvTklYBKuS9aYxHKy6wXzHStc6GvvzjeUK0X?=
 =?us-ascii?Q?IRt7+ZYEmWRGGQYK3zKN9orn7sDXj3T7Lt/pm6wdrN+avATqq5fsgWC/vvme?=
 =?us-ascii?Q?80aA5MaeSVxOt77wFgekiN3RUB51hVHWc+r26x9oLD+I3G+b/IJ6aM9ArCia?=
 =?us-ascii?Q?47YAgjEPq53FemSzp+rkZn3gERwv6Kf2U99kN4Di0MRWaPOaFdTemfVcFADM?=
 =?us-ascii?Q?5CMeOqtrazLnHAMcHJGiQ1u53mpdkcRpC6/BBrDfoPD40YzzHrWQYdGF7h9+?=
 =?us-ascii?Q?QbmLStJ+IuFrQWD5nmxM6CtOuggTXa0/ppyI1Y+sCJXRIoJa7JlE9oeuFXB+?=
 =?us-ascii?Q?hJLvD2DVAvq3yvibmSeRIrQbDL9A26MJKqvzu/cg4//r0t2CKFlBgS1DEh0f?=
 =?us-ascii?Q?9u6lzPrnZBZr9bDbITbZJQoeHElHatJk5wI9iHPe7ZYS/pi98jF0C5m7iDy7?=
 =?us-ascii?Q?O6bhF4vvxSf/8OLsk0EkOSNc66TC8Ix9UEZbnVLekpd2/mY0gMmvjOx36d/A?=
 =?us-ascii?Q?P6tLtJWXZp0oTPQpfNUXM0OQfg9WrqGSNeXAZrRtAzfw+3RoMq82pyvQ6eVF?=
 =?us-ascii?Q?RzxTEW5xxLH3GWg+YFqpA2FE+PPnyASYuzvzenJ/JYactbLZqAWFKAJB8n0s?=
 =?us-ascii?Q?3lKc/E5ZNxwGwo8UiCF1j6PqIMxMLY1wztAYrKJ42vv1CGLju+HCRPzg3VRz?=
 =?us-ascii?Q?ylkxz8lRAzeKg1rX1kPt2hix/B8H9m0XKP1ZOPzWTCvzWZ5Snx0Dp/7d4dDH?=
 =?us-ascii?Q?A5P5NOaCBcxdcIIz71zle0+bSQ4IZdmak4F++noocPYY74tAcRCOpf0o/ZB0?=
 =?us-ascii?Q?vBRfuvjRmnbC/ZuBOe24FIvtxuYBu/d+685AhIO3Bs6obYGRxXg5ibjNWqz4?=
 =?us-ascii?Q?/G0rDTm4HgmPcmhWmKjI1MazOksTfxX/6w7wXFtQTgU0Qlhp3+G0hiauzTQ6?=
 =?us-ascii?Q?xFnE9zJtaXmZr1zHTHTroVERAi7iJbqQhrG8R7jVi1Ly6MhHhd66MAPlsDCb?=
 =?us-ascii?Q?PQc0jkc1R1MDZCimRZsrGPVFDRSBSZtqxwT/RTeiE/0iX7Ag+aiMEKBuGLq2?=
 =?us-ascii?Q?q4YpeYoS9LdbjvLylQ/3djYvRJbkappdpDeXShzaLe8q0eRrjyZ7L65ZZj7a?=
 =?us-ascii?Q?5ZYmV4CJPhuXCjE/jKUe7IBq32tNNCSgYMFwF/HYmK38DyQgGJJcY9P/iumM?=
 =?us-ascii?Q?9/0B17gDXA4VpRF+wcHjilob2djfu2DD79TlAmXUetW2g/4Jn2VMCydQlRW7?=
 =?us-ascii?Q?99Vn8Y891ELTjc6ShHnmzU6maKkHkSuj80DaI1IbBmGWLgGA1rKTTahmbZq+?=
 =?us-ascii?Q?tXmT7w6FNj1YvVzHzY7zFFhbFUfGTIosv4zw88LjXmamkjXuPUEJXh9uk8ck?=
 =?us-ascii?Q?p1QU+5iq9OKZF1cyACh3glu7hl5v77emzf5s04iKcNVNtpQE1zzjzaORw7FN?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b633f72-6f01-4fae-1af8-08db50a1f21c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 15:27:48.7968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bOYOmj2Y0Dgp2VH27H/uSliIlGOP+5xQYurbL9wzECzg9v9eOub0PI4eEVpFXh38tpkty42A/sO1Lc29DMueA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7841
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] drm/xe: Rename reg field to addr
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

On Mon, May 08, 2023 at 03:53:21PM -0700, Lucas De Marchi wrote:
> Rename the address field to "addr" rather than "reg" so it's easier to
> understand what it is.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

also feel free to convert this to

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h  |  6 ++---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
>  drivers/gpu/drm/xe/xe_force_wake.c     |  2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c         |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c            |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c        |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c      |  8 +++----
>  drivers/gpu/drm/xe/xe_irq.c            |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c           |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.h           | 32 +++++++++++++-------------
>  drivers/gpu/drm/xe/xe_mocs.c           |  6 ++---
>  drivers/gpu/drm/xe/xe_pci.c            |  4 ++--
>  drivers/gpu/drm/xe/xe_reg_sr.c         |  6 ++---
>  drivers/gpu/drm/xe/xe_ring_ops.c       |  2 +-
>  drivers/gpu/drm/xe/xe_rtp.c            |  2 +-
>  drivers/gpu/drm/xe/xe_wopcm.c          |  4 ++--
>  16 files changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index da781bc7bdc7..4554362ff4d9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -18,8 +18,8 @@
>  struct xe_reg {
>  	union {
>  		struct {
> -			/** @reg: address */
> -			u32 reg:22;
> +			/** @addr: address */
> +			u32 addr:22;
>  			/**
>  			 * @masked: register is "masked", with upper 16bits used
>  			 * to identify the bits that are updated on the lower
> @@ -71,7 +71,7 @@ struct xe_reg_mcr {
>   * object of the right type. However when initializing static const storage,
>   * where a compound statement is not allowed, this can be used instead.
>   */
> -#define XE_REG_INITIALIZER(r_, ...)    { .reg = r_, __VA_ARGS__ }
> +#define XE_REG_INITIALIZER(r_, ...)    { .addr = r_, __VA_ARGS__ }
>  
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index ad2fe8a39a78..4b2aac5ccf28 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -244,7 +244,7 @@ static void xe_rtp_process_tests(struct kunit *test)
>  	xe_rtp_process(param->entries, reg_sr, &xe->gt[0], NULL);
>  
>  	xa_for_each(&reg_sr->xa, idx, sre) {
> -		if (idx == param->expected_reg.reg)
> +		if (idx == param->expected_reg.addr)
>  			sr_entry = sre;
>  
>  		count++;
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 363b81c3d746..f0f0592fc598 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -129,7 +129,7 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>  		for_each_if((domain__ = ((fw__)->domains + \
>  					 (ffs(tmp__) - 1))) && \
> -					 domain__->reg_ctl.reg)
> +					 domain__->reg_ctl.addr)
>  
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index c6b9e9869fee..3db550c85e32 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -398,7 +398,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  	 */
>  	drm_WARN(&gt_to_xe(gt)->drm, true,
>  		 "Did not find MCR register %#x in any MCR steering table\n",
> -		 reg.reg);
> +		 reg.addr);
>  	*group = 0;
>  	*instance = 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e8a126ad400f..eb4af4c71124 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -713,7 +713,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		response_buf[0] = header;
>  
>  		for (i = 1; i < VF_SW_FLAG_COUNT; i++) {
> -			reply_reg.reg += i * sizeof(u32);
> +			reply_reg.addr += i * sizeof(u32);
>  			response_buf[i] = xe_mmio_read32(gt, reply_reg);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 683f2df09c49..6d550d746909 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -426,7 +426,7 @@ static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
>  				      unsigned int n_entry)
>  {
>  	struct guc_mmio_reg entry = {
> -		.offset = reg.reg,
> +		.offset = reg.addr,
>  		.flags = reg.masked ? GUC_REGSET_MASKED : 0,
>  	};
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 5e275aff8974..696b9d949163 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -236,20 +236,20 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
>  static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
>  				   u32 val)
>  {
> -	XE_BUG_ON(reg.reg & hwe->mmio_base);
> +	XE_BUG_ON(reg.addr & hwe->mmio_base);
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
>  
> -	reg.reg += hwe->mmio_base;
> +	reg.addr += hwe->mmio_base;
>  
>  	xe_mmio_write32(hwe->gt, reg, val);
>  }
>  
>  static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>  {
> -	XE_BUG_ON(reg.reg & hwe->mmio_base);
> +	XE_BUG_ON(reg.addr & hwe->mmio_base);
>  	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
>  
> -	reg.reg += hwe->mmio_base;
> +	reg.addr += hwe->mmio_base;
>  
>  	return xe_mmio_read32(hwe->gt, reg);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7aa245792927..5bf359c81cc5 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -36,7 +36,7 @@ static void assert_iir_is_zero(struct xe_gt *gt, struct xe_reg reg)
>  
>  	drm_WARN(&gt_to_xe(gt)->drm, 1,
>  		 "Interrupt register 0x%x is not zero: 0x%08x\n",
> -		 reg.reg, val);
> +		 reg.addr, val);
>  	xe_mmio_write32(gt, reg, 0xffffffff);
>  	xe_mmio_read32(gt, reg);
>  	xe_mmio_write32(gt, reg, 0xffffffff);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0e91004fa06d..c7fbb1cc1f64 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -421,7 +421,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  		unsigned int i;
>  
>  		for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
> -			if (mmio_read_whitelist[i].reg == args->addr) {
> +			if (mmio_read_whitelist[i].addr == args->addr) {
>  				allowed = true;
>  				break;
>  			}
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 821701f8ada6..01732ff7e4c6 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -20,27 +20,27 @@ int xe_mmio_init(struct xe_device *xe);
>  
>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	return readb(gt->mmio.regs + reg.reg);
> +	return readb(gt->mmio.regs + reg.addr);
>  }
>  
>  static inline void xe_mmio_write32(struct xe_gt *gt,
>  				   struct xe_reg reg, u32 val)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	writel(val, gt->mmio.regs + reg.reg);
> +	writel(val, gt->mmio.regs + reg.addr);
>  }
>  
>  static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	return readl(gt->mmio.regs + reg.reg);
> +	return readl(gt->mmio.regs + reg.addr);
>  }
>  
>  static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> @@ -58,18 +58,18 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>  static inline void xe_mmio_write64(struct xe_gt *gt,
>  				   struct xe_reg reg, u64 val)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	writeq(val, gt->mmio.regs + reg.reg);
> +	writeq(val, gt->mmio.regs + reg.addr);
>  }
>  
>  static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>  {
> -	if (reg.reg < gt->mmio.adj_limit)
> -		reg.reg += gt->mmio.adj_offset;
> +	if (reg.addr < gt->mmio.adj_limit)
> +		reg.addr += gt->mmio.adj_offset;
>  
> -	return readq(gt->mmio.regs + reg.reg);
> +	return readq(gt->mmio.regs + reg.addr);
>  }
>  
>  static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> @@ -127,7 +127,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>  static inline bool xe_mmio_in_range(const struct xe_mmio_range *range,
>  				    struct xe_reg reg)
>  {
> -	return range && reg.reg >= range->start && reg.reg <= range->end;
> +	return range && reg.addr >= range->start && reg.addr <= range->end;
>  }
>  
>  int xe_mmio_probe_vram(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 1175dec5d90b..5698df87aba7 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -478,7 +478,7 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	     i < info->n_entries ? (mocs = get_entry_control(info, i)), 1 : 0;
>  	     i++) {
>  		struct xe_reg reg = XE_REG(addr + i * 4);
> -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.reg, mocs);
> +		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, reg.addr, mocs);
>  		xe_mmio_write32(gt, reg, mocs);
>  	}
>  }
> @@ -513,7 +513,7 @@ static void init_l3cc_table(struct xe_gt *gt,
>  	     (l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
>  				  get_entry_l3cc(info, 2 * i + 1))), 1 : 0;
>  	     i++) {
> -		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).reg,
> +		mocs_dbg(&gt->xe->drm, "%d 0x%x 0x%x\n", i, LNCFCMOCS(i).addr,
>  			 l3cc);
>  		xe_mmio_write32(gt, LNCFCMOCS(i), l3cc);
>  	}
> @@ -540,7 +540,7 @@ void xe_mocs_init(struct xe_gt *gt)
>  	mocs_dbg(&gt->xe->drm, "flag:0x%x\n", flags);
>  
>  	if (flags & HAS_GLOBAL_MOCS)
> -		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).reg);
> +		__init_mocs_table(gt, &table, GLOBAL_MOCS(0).addr);
>  
>  	/*
>  	 * Initialize the L3CC table as part of mocs initalization to make
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 855cf8557056..a6858fc7fe8d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -442,7 +442,7 @@ static void handle_gmdid(struct xe_device *xe,
>  {
>  	u32 ver;
>  
> -	ver = peek_gmdid(xe, GMD_ID.reg);
> +	ver = peek_gmdid(xe, GMD_ID.addr);
>  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>  		if (ver == graphics_ip_map[i].ver) {
>  			xe->info.graphics_verx100 = ver;
> @@ -457,7 +457,7 @@ static void handle_gmdid(struct xe_device *xe,
>  			ver / 100, ver % 100);
>  	}
>  
> -	ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
> +	ver = peek_gmdid(xe, GMD_ID.addr + 0x380000);
>  	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
>  		if (ver == media_ip_map[i].ver) {
>  			xe->info.media_verx100 = ver;
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 51a40a9e532d..0312823101ad 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -93,7 +93,7 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>  		  const struct xe_reg_sr_entry *e)
>  {
> -	unsigned long idx = e->reg.reg;
> +	unsigned long idx = e->reg.addr;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
>  	int ret;
>  
> @@ -174,7 +174,7 @@ static void apply_one_mmio(struct xe_gt *gt, struct xe_reg_sr_entry *entry)
>  	 */
>  	val |= entry->set_bits;
>  
> -	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.reg, val);
> +	drm_dbg(&xe->drm, "REG[0x%x] = 0x%08x", reg.addr, val);
>  
>  	if (entry->reg.mcr)
>  		xe_gt_mcr_multicast_write(gt, reg_mcr, val);
> @@ -239,7 +239,7 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  
>  	/* And clear the rest just in case of garbage */
>  	for (; slot < RING_MAX_NONPRIV_SLOTS; slot++) {
> -		u32 addr = RING_NOPID(mmio_base).reg;
> +		u32 addr = RING_NOPID(mmio_base).addr;
>  
>  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 733ed8a30c2e..74c1b5dfbaee 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -48,7 +48,7 @@ static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
>  			      u32 *dw, int i)
>  {
>  	dw[i++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
> -	dw[i++] = reg.reg + gt->mmio.adj_offset;
> +	dw[i++] = reg.addr + gt->mmio.adj_offset;
>  	dw[i++] = AUX_INV;
>  	dw[i++] = MI_NOOP;
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index f2a0e8eb4936..0c6a23e14a71 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -101,7 +101,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  		.read_mask = action->read_mask,
>  	};
>  
> -	sr_entry.reg.reg += mmio_base;
> +	sr_entry.reg.addr += mmio_base;
>  	xe_reg_sr_add(sr, &sr_entry);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 11eea970c207..35fde8965bca 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -170,10 +170,10 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
>  err_out:
>  	drm_notice(&xe->drm, "Failed to init uC WOPCM registers!\n");
>  	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "DMA_GUC_WOPCM_OFFSET",
> -		   DMA_GUC_WOPCM_OFFSET.reg,
> +		   DMA_GUC_WOPCM_OFFSET.addr,
>  		   xe_mmio_read32(gt, DMA_GUC_WOPCM_OFFSET));
>  	drm_notice(&xe->drm, "%s(%#x)=%#x\n", "GUC_WOPCM_SIZE",
> -		   GUC_WOPCM_SIZE.reg,
> +		   GUC_WOPCM_SIZE.addr,
>  		   xe_mmio_read32(gt, GUC_WOPCM_SIZE));
>  
>  	return err;
> -- 
> 2.40.1
> 
