Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1655C6FD19
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 23:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD0E10E06C;
	Fri, 10 Mar 2023 23:55:55 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFE510EA2F
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678492553; x=1710028553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PRJ0CYMBNaiwDsY1DOQ1FB713+XkcyHCQVkkQt+YNw0=;
 b=KJh6h+5YZCw5zYIW9XIH9phRYmBbAWdh/aurJ+3UGv6OQCfs/6vQGMs8
 kzAMwqi9+k1AL2m8Fp7do3scf+MHS1m5lq9oBhC+FyFprWPHMGOlMH8o2
 3zX7MaO2/qQyrE+gd9RZC0IdI/y1DPOQQ0v6hHGqgcr7IX3EkpzxmZK2A
 TqWSMmFGYx7lKDelzN+70os6quZrmZW6Ld1bxvuM+OD/JaBnb5+9mSU5E
 Fi2OhgMR71TExNNpCSU30x5arI1UALuT1ANOY2ArazbGsekiWAO81vo5L
 t9oKNCYRmIs9q4EGxd4V9IqyU/YUfjre0GZQp/UBId3il1mtRyqLuq9H8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325210378"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="325210378"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 15:55:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788224209"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="788224209"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2023 15:55:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:55:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:55:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 15:55:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 15:55:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAu3uqv9PK1oYWZfF77yfQpFDZdI7zqf+x5cfGkIPhLbUFX3UnPBVDH+eHzsyjxSfsopi0b9LgCkz0kWdTuEAXHwi7rXAt0aoig3OvqkqfGOFn8JhtwTwgYHF0o4nsBSpE7Bdd+KFaagecjZyoXuoPT7WBKI6HP7Cf8lUWbMcCofFRJONODYxUFWVEjQHgZRS8wHTLT3y5RdGG5+zTWAFGyVEyM4QU7Oe52H1RHnepXEMwWOQh0nYcbhCfJ8ilW87YtKVQri2QD9Dnn3M+49RCr1L8RqW7hZ+eJj86Yz2rEIuZulDfHrwRMlBdnwiBoa4B8xO1uAPKpeP8SXyLKPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RXsaXcPz5Nj8VtRO2SGiO4NcZ5Oy4t+MNbLasOZBIU=;
 b=ciMwIf3owBhaWEPuwTt0tnBAvM25MFexs7JKgKtbVLJT2qlQwGBIJPmoU4aC4WXizZlYhSbe67Zmye8BO6epWAOr0d4xi0ziuCa8HyCWEFpe5ALEjO6bjSboQa3+Hv953n7xbEr0B+lElxw94kT3CrfoO75ASXw5uXw9qhtLFwigEMMAU2B5GD8xPSl7/GG1w1gRQLYFU5/IaIlUffuoFrBWfp/mKaAqCTNMe0+h0pEQGlq3XOzzQQMDr2nHT0HIChNWd+bL5n1Neg07u5pTtubKBqUbyclrCP/B+6n/x/rgCHah0gqUu48gMR/6485YD6qeAsb1zU7VtgUrDl2j/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 23:55:48 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 23:55:48 +0000
Date: Fri, 10 Mar 2023 15:55:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230310235544.GV1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e3f8d1-fc59-47fe-47bf-08db21c2f837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oH1vy3FfJ6Kvb826kWldykA+q10BBfKBm3fWxfPdgKpTp+dXJakbGjmoHEJ8Vki4PiKwiiSWltmz4ch7MKAyL+q7KII9P+pdp68KbzycWj3H1Ydsn/s/OfMP/l8tWI28c5rfcmpRdizx1dm6ymxVv1rZj+TnmDIz8w1NcwSrs9AP7EexEEZ/quXY9o2Z/JLXJ7BcG4VCSyYi1O1BhiyobarfkUwB8yU4CjaamyHwNGogCCBLpUvIa0g5aH0PqXkCsWcIdSAuvyzv7+Ne55Hm1smH1wi7XaaX9Jr9LAdNt7jv5a2Hv5wt3pDgWQcnwzlgWjTLkrDqDZ7+Sl/nXhuci1BWpbREDb1xeD06BURSCnoIrCAadOLDyoJkPC62O3umaXafOUewX6iT6eNYF3t3BZZ3HVEr6jZgGj+5f150g+Y3uByzbuhXf/M9mIvmTLy8xw27rVXXnVYRtuhiPBGhrS6SRha57OrgTeCx6xcUwTyIc1f4MCd7VK0gl668s8Ju0I6rzmCEq00QxjveXZxv0oHGPcRCLJ8SYW15wDbc2mBkZ/Gn6UNXVBtUOhuS7/v5rP3wIE0C6UjsAXqcrDxI9OwebualJkZ/2lsCB4GYAApezQADJMxyqzFSq1RLlbSLK/rjblxHNjeKznZfuey+XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199018)(6862004)(8936002)(5660300002)(26005)(1076003)(6506007)(6666004)(38100700002)(66946007)(82960400001)(83380400001)(186003)(6512007)(41300700001)(316002)(6636002)(8676002)(4326008)(66556008)(66476007)(33656002)(86362001)(478600001)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W6EMMfq/9mu2fm7zM1PPQl5BLBAmIb1g7sVPX/eHTE1gbPr5H9AhoyGHffAh?=
 =?us-ascii?Q?YluwDuJQiMT1b7oWvxVAgUK/TWDT1nC6KKszIfbsQN+GVjeqaXbsGwPi5FuZ?=
 =?us-ascii?Q?CTpJ5pk+OuAFlA8Dh4VLqEOmFFV3fSi6WoeL3xuFbRLWo39Xc5MTvbJU6peD?=
 =?us-ascii?Q?xg/Y22MIYR6v9MV8RtKacAvAkrpFm31k/92YGNSxuL6UpGtN4OhUUgtGGwyD?=
 =?us-ascii?Q?LlIVyWJZO/fij4KQoYBh7sdq6CdCjm5vFztoOcAalmbkAlH9U/b8mcuIJlcv?=
 =?us-ascii?Q?c1CvvatuK0oSAktBFpPkCnV4agclCEMBWBlWwyNzILdyIcvdpGZIRtm/H70W?=
 =?us-ascii?Q?pYPngVG1wX2BniI7yDXhhaENMfuq3Ta21rpZX+ALQ7d9eHhbTlWkgeadRw7T?=
 =?us-ascii?Q?hoafuQEOkeByszSGhLzzs6z1qWzKSVTAL3hijx0pv6ZW2Pn4otnxyMO5VQDf?=
 =?us-ascii?Q?E8C3b0mJig87VcsbY6gS7046uHzHs+HyQnNROtmz8XfS9s1v4GWD4zyzFSjl?=
 =?us-ascii?Q?i0J49YBJisLwY9hIislW7mSXoU0mHl74cykgdI2gSwKJjla93o1d4lgcpQlj?=
 =?us-ascii?Q?jn5Fg7xneoHHKISg0NYdVReKTueqZtJ9dwM5yEmE9Lza2jhl/UxAhrffVMHp?=
 =?us-ascii?Q?dDNy9lR2Kzz13ejui7TJ3eNjJJdGAyi9ucxuHJsNL/1FRzdihlcOzcd1fR09?=
 =?us-ascii?Q?xiXw11H6IXgOIJY53K/hspbKVCI4SwgnrcScnqmPrnh1w7DJmDHBT8XqOBwb?=
 =?us-ascii?Q?CFwy+VAIlhLQ12Lz/XTNwFFa90D0Qr2p4QzCLHjumJ1+xQzGKus2CoWF4NHu?=
 =?us-ascii?Q?UTQMqXsMvVd3cXkBK6fGupOGpdRplK/BvD5T6jtTdoyFxJwHWZ8kd+6F4koF?=
 =?us-ascii?Q?Pu0/lRGbhxqCFOGGjdZy8IIUQO/cOSnofVIEeaTFpsNFXiQh78pqz45twqai?=
 =?us-ascii?Q?8YipSwFCMPlUXBRNx/CpfFFoCEZ0b6n72+AKUH0+aHtpOtkc1PrJJxkQweAG?=
 =?us-ascii?Q?T0Vo+yvskoXKoD4VXku4z/m2wsvMRRYKQhWSZ+HQZsgfaCnmoGSCzBU5NcMD?=
 =?us-ascii?Q?jLY9m9q6u6/25SdfGHOIN8S26Xc/TmU8HWny8PtKJUO//8VrhQoTabckZ8a3?=
 =?us-ascii?Q?+Lyt7k0eITlArzIpxa2QPf7SSwr2EMkxQtcn8nAfV/WDkiFOnWM7h2xTpjBh?=
 =?us-ascii?Q?HAlUF9KcbGAb+XN3uc938aZiK0xg87LGk8mZ3+48RMzBt8EEKB3dxAFCuWKD?=
 =?us-ascii?Q?xAPMJeVKYXDm4OcKH/ZnJX8mj1mpTx2fqX0KTeUlza1G4Hxg9PxD/dtYXrXj?=
 =?us-ascii?Q?rHPg0fsudrLSKDLjgkNeeMVhKKGoSsyeTiXqTcooJg33XJ6aKDRwJLbkmx8t?=
 =?us-ascii?Q?jupZLxBaMsMQC/EpDDoBMP9NAKcTzonAWoGxLIs/cNbMdDSlMAH/en+GYK0n?=
 =?us-ascii?Q?eWoG0JSo9TRgRSSB2gUAtdLQxZAQ3gBGID9BaS/Fipy5VO9rcWV3mAJJ+h6B?=
 =?us-ascii?Q?AnolOksXDrP86gXjNKlK5PLYH+a2wbB3V655qzrw6L6RYSpcPLWcBkmtl7Bu?=
 =?us-ascii?Q?ZGdzjXaei1wBxa6/re2zZQ1Jp0sNMoBtciDtc4MxHk0VJaKjIHV4ocqSNW6T?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e3f8d1-fc59-47fe-47bf-08db21c2f837
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 23:55:47.6207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6WZNm4D9pxbK9Qw9Ds/aBVyvu+5W7U1qo+jEtzrkSAUWk5xJIqw/E3QogloTS4QaJH1kfOfI2/RaUIgqAq6bqbWGdkA67zH3TeIu7D4NBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/12] drm/xe: Print whitelist while
 applying
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

On Fri, Mar 10, 2023 at 02:15:40PM -0800, Lucas De Marchi wrote:
> Besides printing the various register save-restore, it's also useful to
> know the register being allowed/denied access to unprivilige batch

s/to/from/


> buffers. Print them during device probe.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c        |  4 +++
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 41 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_reg_whitelist.h |  7 +++++
>  3 files changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index c6f92fe9aad1..f6ed9e6e5697 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> +#include "xe_reg_whitelist.h"
>  #include "xe_rtp_types.h"
>  
>  #define XE_REG_SR_GROW_STEP_DEFAULT	16
> @@ -194,6 +195,7 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_reg_sr_entry *entry;
> +	struct drm_printer p;
>  	unsigned long reg;
>  	unsigned int slot = 0;
>  	int err;
> @@ -207,7 +209,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  	if (err)
>  		goto err_force_wake;
>  
> +	p = drm_debug_printer(KBUILD_MODNAME);
>  	xa_for_each(&sr->xa, reg, entry) {
> +		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot).reg,
>  				reg | entry->set_bits);
>  		slot++;
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 2dd10e62718f..6c8577e8dba6 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -67,3 +67,44 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>  {
>  	xe_rtp_process(register_whitelist, &hwe->reg_whitelist, hwe->gt, hwe);
>  }
> +
> +/**
> + * xe_reg_whitelist_print_entry - print one whitelist entry
> + * @p: DRM printer
> + * @indent: indent level
> + * @reg: register allowed/denied
> + * @entry: save-restore entry
> + *
> + * Print details about the entry added to allow/deny access
> + */
> +void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> +				  u32 reg, struct xe_reg_sr_entry *entry)
> +{
> +	u32 val = entry->set_bits;
> +	const char *access_str = "(invalid)";
> +	unsigned range_bit = 2;
> +	u32 range_start, range_end;
> +	bool deny;
> +
> +	deny = val & RING_FORCE_TO_NONPRIV_DENY;
> +
> +	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
> +	case RING_FORCE_TO_NONPRIV_RANGE_4: range_bit = 4; break;
> +	case RING_FORCE_TO_NONPRIV_RANGE_16: range_bit = 6; break;
> +	case RING_FORCE_TO_NONPRIV_RANGE_64: range_bit = 8; break;
> +	}
> +
> +	range_start = reg & REG_GENMASK(25, range_bit);
> +	range_end = range_start | REG_GENMASK(range_bit, 0);
> +
> +	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
> +	case RING_FORCE_TO_NONPRIV_ACCESS_RW: access_str = "rw"; break;
> +	case RING_FORCE_TO_NONPRIV_ACCESS_RD: access_str = "read"; break;
> +	case RING_FORCE_TO_NONPRIV_ACCESS_WR: access_str = "write"; break;
> +	}
> +
> +	drm_printf_indent(p, indent, "REG[0x%x-0x%x]: %s %s access\n",
> +			  range_start, range_end,
> +			  deny ? "deny" : "allow",
> +			  access_str);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
> index 6e861b1bdb01..c76d81c528da 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
> @@ -6,8 +6,15 @@
>  #ifndef _XE_REG_WHITELIST_
>  #define _XE_REG_WHITELIST_
>  
> +#include <linux/types.h>
> +
> +struct drm_printer;
>  struct xe_hw_engine;
> +struct xe_reg_sr_entry;
>  
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  
> +void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
> +				  u32 reg, struct xe_reg_sr_entry *entry);
> +
>  #endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
