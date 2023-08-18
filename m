Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B547DC71149
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 14:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519210E52D;
	Fri, 18 Aug 2023 14:07:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41FA10E52D
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 14:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692367627; x=1723903627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eOsXAqUYIpjX+3EhTiLN5PjC5UdmsHpJVmBppjZCS6o=;
 b=AYpvcIQLe1YQRJjB8IwLfbY36aPtoQIc+S4c/DYDmgvKFttrVezpEeUC
 ckxUVpzr68LW0TxpNyM2VHacYdwCZOdnxIIoSGBwOi6ViTn5kIczp4IN/
 bAVE9tOtXjwiJzfDfNrzfmltqOUWsYRqLBZEoYcp1G/Tz61HMoblF/uDo
 NEixqaAdWqzbtwAfQxgI4Cp9jW/Zu9sWBhckKgpNqMaISTZdEN/xoQh6S
 wdeBUH5kiSJK2qpWQ6LovLLWqM/OVMI3R7envJTKrkO9Nd2VnBE2A1hYT
 s3raGfVXUhO3Rpd4lsCoGzv6BRnV/YC2SnA4sLTDBjKWcnsYNd63MHSHZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="352695234"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="352695234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 07:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="878694354"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2023 07:04:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 07:04:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 07:04:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 07:04:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 07:04:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzQ1iIOIcz1bAJKBorOLprmFF5hQSZZeiVfFlxtHdG9Okdc5dxYdO1OuLnEmlkWGneXOLIt8Fn0d+YmLYeZOXU7JBSoBfqvzr6qNlH6i4za/bPlYNro3pDzcDStmusDR2uVkbYKksbGIOjOU7uMxSIqA6c+yZFAZg3Pf0F4NZ4zgsNDSxRVLun4jwYZbzcN3KHgPoR1X/QEnRgWAKSOn2Nhfmtg2w1Zk3S3c/ZPdYenUDO+38XZ4CMOJsjhsrfls4kQ5WzPR4Dza2z6Q2e50RhwzUeDepP/y0/ZChNWkKcICLWYa7yj6Idm8Y7xPbAHUgoHuGyGD9FSmWlalx2sBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igRz1sMwBgqU/jrC63K7wAz071WGWWSqnZhVII0xcqA=;
 b=lC7UidlplBCR6FK9IUM3929kx8GLsNZ6xjE7mEv0AP6kDMfzxD5Xk22yPy0b9MxhucLwrHwW2wm2OGQbZrn3sSm3/AqhKgZMyURxnEdOnhM4H4uZ6pCMnlB3fSTZ+NAvQ20X01IiC5867MjUo6BrusS9ycHsVTdG4PtoBdrxWoKQgbAWJDQOWecdEar+iLfQBDyam2tU/LHhL3BbpofXSTRV9ZbYIQVK5OFUyrBtBUul2AiZpREb8m+Biu2rvgSBPJ6SlhFYfhaJW2OD1ZINVjujptdjgYadUYX0unHPkcCspK5wH6Eod4kVacZklCDIwmtr0Fx7mHKE8/+v6xZK4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7835.namprd11.prod.outlook.com (2603:10b6:8:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 14:04:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 14:04:48 +0000
Date: Fri, 18 Aug 2023 14:03:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZN96QbtifizPTNV9@DUT025-TGLU.fm.intel.com>
References: <20230818135810.2093337-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230818135810.2093337-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: e497f38f-3509-4c8f-785c-08db9ff41565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LBVAtToHBzv4pY6poTM4srsDsu+5dsr9wHQipRywOSBHkwSse3nV1uR3fkMOK2xz/lZCnxoMaLsNX3YiRa0Eqi+IUrTEEB0eIS78E9xWoyrRnFybEB0n6wx+vnwx+GAAcX2KGvzfgStV3A3dktx+/lHrTw8y4qNXCTktGdo765qQfCiaz707KFwasTk9Ciotwp4h3XHkT9UlghG+ZnmrvQV0HMK8oTAq86fKyx4Az3uubapoR65IpfC+n3tlgGbU73gnoEYliv9NotChNdYViJnuB3jlYSB5BAiWxMg/3qYoT3VOZ8sdA8xCejmnKWjB0pfu4PE/dsNycdeOR9mfZFombV/XjLgtSrnWzh00bwPxD1nK36gbuV6143mGTwGGpdNlpPxXEaObJpWQ8EPXbcYH6mRNb3te4wIQ61dtqcjA7x3mVqVEMqUwv/sbDaof/yNiRrBZv67A35/pituv6qXqwEz3lSNGquOkz2cQCCs/hjhxUUY9UGjA36/Lhi+7TIwWqnDmnSAnIe/Acs9NcVUTnv6OgJ8f3AB3EhDv45NMC5cdvEC0f2pLIWLOe5SC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199024)(1800799009)(186009)(82960400001)(86362001)(38100700002)(5660300002)(44832011)(66556008)(66476007)(6666004)(6636002)(6486002)(316002)(6506007)(66946007)(26005)(6512007)(41300700001)(4326008)(8936002)(6862004)(8676002)(478600001)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V+eYCxJiOdS6uSu6delL8tjv5w0FQfSAVO+JyjKf5pgdsP+YVAHA8G4Yh8dU?=
 =?us-ascii?Q?Z1yyorKNNgUf4A/FDuUL4KTEWP/8A3rAyMbHxFXsGuiz6q3SiyYjqZWunTGp?=
 =?us-ascii?Q?ztOmxHEdWYkVon2WFl9SUDC3wyuyA5QUJLubMQ+uv1r6rkgvq9Vkqe1DNVdS?=
 =?us-ascii?Q?e3GEtQHN7qpf13p8QiDxVyuzDQoOevckiI7IuGq00cq2dIofBldY9Bgt9ltt?=
 =?us-ascii?Q?VRBsjTzHt0PXiIllfWj2J3WOzbim4/3x4pP/ZFlQQxjrmMJzkqxkD3/WhQVg?=
 =?us-ascii?Q?vxT1FKexpCCEPCcylTPUZJTeMfsG78H2Q5ioGQuFlH6mMpYno7Z0Uel59Sxi?=
 =?us-ascii?Q?r2/9ewXf2QN2jk7hOv2yMekZHNszTpxQuP6dPY+SNjwfiuIR0R8l4XXj4ask?=
 =?us-ascii?Q?kxQaRG+kinlWHI7E4bmaR10TVQcsm1rflvZqtI56EexsayQFLnU8fSt7VckN?=
 =?us-ascii?Q?XrJOv5RG8kUqKwyShaCnqlrWuuCP+8PGZJ8HoW+algJFii9xJnHvAa/ri8zl?=
 =?us-ascii?Q?iWh6bL+Mbl5TySHOBpzVUt6CNoxUzvgyFhlz7PH6z0l7liHECeJcNFsQjuX+?=
 =?us-ascii?Q?/lmJnu7EFVuLZ5VFwhDRphJ/6ynuScUU3i0ov7cns35ZrBz2fPeghkmsga06?=
 =?us-ascii?Q?I44eJZBoWkgcFE9C2oC2Z9tdBeCU8T3nDdaT2SNGKql31bxCUo1DKssaqp7o?=
 =?us-ascii?Q?xYA3TCuzX26s5TmOHPVY2/DCemrRw07sGaXDmgKkoe6SZnHsFxHchWzvYf4s?=
 =?us-ascii?Q?Ax4VY776OGiGLViKL1mUaq2Dj/g9fheHmaVoD2l6+CjHgS0DDVViTJRbwa+J?=
 =?us-ascii?Q?bjtnyPQjvnvEBcDj49wxQY/Jdq2jUYHsucxS8HAsfKyyr5J3idI5+UP426ur?=
 =?us-ascii?Q?mC5Oq3mMdTFW/g5kAc2wX8vT9joDD9qgakMRaPQpCBEL0HivcIJUpj5vmkY5?=
 =?us-ascii?Q?UxSyzi3Fz2sDvHiRsrkkXN3WoT6FW5GYzYtDYPZZj3kcQ5uS71gHNLxc6IEx?=
 =?us-ascii?Q?ur0oce5Btb0Lo2XKshMPYrsywraaQYTdjzNQt4ew9N0p0TmhC/q9J8ltZMtK?=
 =?us-ascii?Q?yNKSHfCC0m1JYEPZ8ESmDr3xlwIuLxFtNShUW3XHJROKHMoKXPBsXXU7sGVL?=
 =?us-ascii?Q?lp5k6BWchyz42ART/MCpVJczTgZEJ4IEMmqKN7V03wDQomw1do5AFArwiCMd?=
 =?us-ascii?Q?qx7zUcLJYs/8Cv/QBUNJs8kDg9yy5GJ9mYir6h7zRvrJEP33O9coXSN28Yn4?=
 =?us-ascii?Q?0He8y+Rkp15hxYrtX82lAn5pZJgjR/R+C2vDy0jBGAss8JQ3dvWljt5OtnBs?=
 =?us-ascii?Q?zQFXK8CeQGSNA1FcF4cSGlZCUoWT+zR0kh40DTfEIDDa6UJy8+qOCWLLg8HX?=
 =?us-ascii?Q?ix9+8+d4bS14n9UqqEL6+3NG+kOmuaEGm8d/xNfsLSlRoW3zl5hRDvcGauTs?=
 =?us-ascii?Q?61ZjDPcjSbtdTQCYAIl5pPue1+c61XkDygeHSqw5+HVXIIHuor8eBcaSfLf/?=
 =?us-ascii?Q?nwQkpbD73r+QmpqXAdS+ogD98MfLK6yJB2dbqEKtl9wpORzhTt6EOwsmtBoF?=
 =?us-ascii?Q?TpVUpUIiZM7zZTgogwRPZpveyM0r1B2xm3WGwQRYVbmwbJint++RPj7uAL7F?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e497f38f-3509-4c8f-785c-08db9ff41565
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 14:04:48.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpuYwCxGNwD8NfRCy79IfC/MQetlPwyPYe7y4IYK6rsFIH615Il3NCTRZvva256JuV1zW0B7vOaVEAQBbD4lew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7835
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: madvise_funcs should use value not
 property
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

On Fri, Aug 18, 2023 at 07:28:10PM +0530, Tejas Upadhyay wrote:

You need a comment in the commit message.

> Fixes: c160a11ccbef ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>

Delete this newline.

> Cc: Matthew Brost <matthew.brost@intel.com>

With a fixed commit message:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index b4e661576d08..c9bc59be5094 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -294,7 +294,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	idx = array_index_nospec(args->property, ARRAY_SIZE(madvise_funcs));
> -	err = madvise_funcs[idx](xe, vm, vmas, num_vmas, args->property);
> +	err = madvise_funcs[idx](xe, vm, vmas, num_vmas, args->value);
>  
>  unlock_vm:
>  	up_read(&vm->lock);
> -- 
> 2.25.1
> 
