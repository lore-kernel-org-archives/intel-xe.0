Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1509CC7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 13:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12E210E17B;
	Mon, 24 Apr 2023 13:57:47 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2895710E17B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 13:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682344665; x=1713880665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dTpVRgi1oDTHIFOxQrU5H5X6QYuGgWd/djdbKq3wveQ=;
 b=bqI+uJHfHQNmj+2Q1ZakF5urAD8fLyNPAbYilUTufoNQVkMu33dvn/Yx
 c8RR9TeheHKur1jyjZLtu/UAZcJ32oHy8gbhr/1L52/xkXuYWTpGF90Rs
 Mrbj8I2jo6IyMbtqFv1xrbO8Kt/hOIuZCJseKRfDeh4SKSgz2pKeNsjGo
 Rd5HmkyfoCQMWeST3gGoL6WCzevKMGqOjeDUMJrfYGGohGPkIgGsgNpW/
 NuERqmZZBFEFoRovDDBT58fqkdEPTbszI4dHBVtaQepTSqiUOsJ97VPme
 cF6iigz+M+6SroL/TCoyPblCw2XI0BLtTjkSZebOtmG7eOzz3CXmJSMB4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409391850"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="409391850"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 06:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="817280970"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="817280970"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 24 Apr 2023 06:57:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 06:57:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 06:57:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 06:57:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSOn1nUF09KdfnbAZLMQg7RO1S48rR9aJUPIiapGfKz2LWuMyYdv1o01eUNUhlOW9+ZNeNRKPRZr8lAR95fgRBIV6YfH1hf0uirFYDTPO8C+vIlgCBqU15b+X25WG6h6WvS/VE/5nXM31NJR/Iucdi6O0eVE/dby6/YsqIccGIqKeeq+0XAjAdxyNL+4cEQemnkIDwmKU5/vddZuIgZWmEE+KxkK2Vrx8p6KNtSQh7E8o7KDHEG9kh+09ipGNwJnstmltZFmHjmzgS64NA4teeMUaG2Pb2qqZgUtFFO+fHQoAUcbceT3ngKsm8j+ZqAhVOfgAEhS8WFgjJPKMXHvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7/tZttotCEcZMvgarQmaB8apaAcVdDi1QUjmWd8s9g=;
 b=iQ35PwoPmdb3ieAkyHg9LzuYCPYZUUEupMJjKxyX9k+JvbOXRbW2MATPR3u5C4ro1jGhfzwXcFo9KdZTdH9tcQOgzENccf6PDTyAaG4P8PrMT8budC1O1TXTUkfHSgfX9UEhb0Djsy/bhfmeUahVRKiQ7s3QKBNdzHEvbX0Xp9PGZRd2wcnaGkYDPuuqf3Ki6j3VaKMI9n7HTEDMYtGLeT7GUaBFoJ+PSJ3xzhj7HALXO4n/VNMI/aTGlyWbfUqbivH33M/rLQWhCI+mZaiqDlKLamTtbn8IBKYWQE4TnI6nG7m8dIgo5Ojc/LDbBgqdvnmt+N4LjPcHKrocdqREOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 13:57:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 13:57:22 +0000
Date: Mon, 24 Apr 2023 06:57:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ohg7ccxtl77yk3mje7udbul3paiyx6b7shti674cn7gecscmnb@y2th74maa3on>
References: <20230424130517.860627-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230424130517.860627-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO6PR11MB5586:EE_
X-MS-Office365-Filtering-Correlation-Id: b7706146-96a8-458b-c62c-08db44cbd3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cy3/257qPTeRdFMSV1FNU/ha2hzcmzHb6syleoVx58Fu0bedSvwNf4lgStvZXGDBIpXKKubReaP2vKLcHjO3fyHoG2yi8Mr45+82crGUHw84gIRkMxO+G9bMVCCaKLZLdubUKSGIvEKNLkbM+CO9tA6kdvc4JlfryRY6XwnD3egE6OtwOATdUA+Hu83iL20Yr+ehNXJryE/XAcxW/0EVmljf52xLBExLHnwvTTrYZS9Fe4ZXPHm7nVMgR2V/gE0+z4E47klFK4lthUCWVZc8pCHFtl4bBRVB+Bl5ir0hJxh21pR2csk1JdiWkk6xYKWxKrwuj3Lplqrsh51uMtci9oZh80nWdiaz4ctR136lUbAmmn7r/sp19XokpKf/4MebWe9ZoRqLAEE/Xl0xjPAdVSNi0l4ydxDjubvuNygJJfyFHS7R+AIgcvBQNlkLF2B9e3SO5nF0FUjYAE/T2y5kXgr2BEgyl5afUJ0IrxzLJ5zSPRH218y+zhrcWBtawMQhXSFmrVIfxb8y48ik4zdc9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(966005)(9686003)(6506007)(26005)(6512007)(83380400001)(33716001)(186003)(82960400001)(38100700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(5660300002)(6486002)(41300700001)(2906002)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zw7/B5flKjKU1T3nRKaA7Jt9GSZssRysIuaKQ5ZplxKtJ8cmc/LG84m9A/5+?=
 =?us-ascii?Q?sOyWFIKMQCN3m0bx49j6AmyMMtDhDcbSxfLO60pCzLeLn0CmoOHvxUHIJDWg?=
 =?us-ascii?Q?mbXZzqwcvAzx7qxnlrbrsh+RUPfUR5igvs1H4PDWq1U//83n2+8uMUSIOVX2?=
 =?us-ascii?Q?pihH/iNPVEJPcf/gIVgOBUqVEqcocorQ7pJvnvxr5/MHlzHhVAIyWmEnx2g/?=
 =?us-ascii?Q?QDLA2nZEE7+3up9htFxa6AC3EwTdpp8+eNxkT3xPLmwhyghNB4u3epKrW/ze?=
 =?us-ascii?Q?5B0fRmlt+x0hI+8dt1C4jFDZ+Y4avM+5CAd0g2gE/RuiJ8VmO9lsm9pkG9jU?=
 =?us-ascii?Q?weXmmDBGxsE7DXLiTIhKCnRtrBYmL5M//SLcKfoccHGjhqvergSIrJZ5y0JY?=
 =?us-ascii?Q?bJLKuwmzt22SaKlW222GfKfO9nB2hHXCr95h1WQcLhM7NsE8WQhsGexwYnSZ?=
 =?us-ascii?Q?Vq3snVV9c/S3R1+vEL5xiZ8Qg/yzwkYPVpz71rFilA7x+bZl+sT6Uj8dJF4T?=
 =?us-ascii?Q?7G26sSFzQnsO2gP3JAC+Cs0t6pWwAw+F7hOF4JH4aZbhB2B/makpQA3ZnOAp?=
 =?us-ascii?Q?K98MV6lBZ1JA5kKUymAj30iE1NYRgspnHSXvJkrQQeXSpxW9jsbTYnKjgmz6?=
 =?us-ascii?Q?bK2cL4WX3ozVBb9kJ1vqbIb3/FJzQl6RSHUQsZmyzqPcB3QxWiSnH6MOvdsK?=
 =?us-ascii?Q?KgU9/QY1LF/ckF4+rsHC96heB8qkUBGbecKwrCzmMqVITtx16OHmJApjRKPh?=
 =?us-ascii?Q?z1QVAu6/7PkVMT49oageSo4NVei3rb7Sd8aIlJVZjg/JFBumJIpz4qIMsmT5?=
 =?us-ascii?Q?+Ws0Mge+shtu4pFqTUdJ6FP9QKEP4ynZYeI3JyCdfx4Fv2kbRycVjdh7Vd8J?=
 =?us-ascii?Q?kdfjZI/f2mdDFzQiKEAJi5ppM0cUkPWjDwDHjKF/NKcvsSteZT3pB9bykZAE?=
 =?us-ascii?Q?VpE0pEuIK3fSGZY2SeWeou00kjHWV3ZpU6JT584H8UQ/urBJXv2LF9vH0VOU?=
 =?us-ascii?Q?41K/IkwKPkTlq0Vd6DqJg75IsocjiPZYe49m6z2YPNWN9hjf5YBiFLPpmfiK?=
 =?us-ascii?Q?kO8KEp0jz9v45KOzCrk2i3m+epkWapiX5jttjBzrAaXIT/vjIblZvvatJafR?=
 =?us-ascii?Q?9QmDbXh+4VZoVz0DADsr+c740Pb3N48hpf5O3Ay9oZPa1xWK3vL5l+12duzx?=
 =?us-ascii?Q?zx+SFN09RP+WcknQ1MzBbrj8QNlSgqI1o75FNygS3CqhJ4DGI0eCjYaUAHdj?=
 =?us-ascii?Q?rFp2tv0X2T+wxE0jUES2JmSe8roxypmXTH/Q0mLmAg0o4PlvpJIzFDPIfW31?=
 =?us-ascii?Q?tPHmuDosufjH5jOc4Zpnz7e5r8kV2EgnEio+ZTlhwZubUnVs7dCZaRcIv6uF?=
 =?us-ascii?Q?WbEjC0xunZP6h6A/8dalkrnG/ZoI5F25aAX6OJGHUq4XRrl8G2MDub1I6Cu+?=
 =?us-ascii?Q?2uTvSNCtJbPFrIOJXePf//7hXeaYC3SHxyrlvuxQn7Kzhp7ubG+Nn6aYjbnd?=
 =?us-ascii?Q?yuD0Xa5lNpA7LdTmjPSYEkI3FODnKx52lSrH/LoPUeFkNFDHLRiXx5Am9dxm?=
 =?us-ascii?Q?xFeG6hY3HlzLgDOQNpXVWl8yFelgVwX9DxIitp/hsU29nc+mIljNGXXvUDgp?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7706146-96a8-458b-c62c-08db44cbd3af
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 13:57:22.6406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIr4FIpG5pMQ5j8Z6gg7r5sKvF0Eh/oMAKZCt/7A+c7FAG9+HRrn2mjc5Vwz/aminkG4vm4SVbDlEaR7SXgIVXch0TJbgvNfGH2twF/XeZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5586
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fixup small bug in xe_de.h
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

On Mon, Apr 24, 2023 at 03:05:17PM +0200, Maarten Lankhorst wrote:
>In display it's not called from irq context, so use xe_mmio_wait32 with
>atomic = false. This fixes a splat and the need for i915_utils.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/245


this needs to be:
git commit --fixup=0838430682d761d0c62836455c5a792bd2836615 so it gets
squashed in next rebase in "fixup! drm/xe/display: Implement display support"

>---
> drivers/gpu/drm/xe/display/xe_de.h | 5 +++--
> scripts/package/buildtar           | 2 +-
> 2 files changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
>index 000379f8702e..0c76b0d24d96 100644
>--- a/drivers/gpu/drm/xe/display/xe_de.h
>+++ b/drivers/gpu/drm/xe/display/xe_de.h
>@@ -70,8 +70,9 @@ __intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
> 			     unsigned int fast_timeout_us,
> 			     unsigned int slow_timeout_ms, u32 *out_value)
> {
>-	return wait_for_atomic(((*out_value = xe_mmio_read32(to_gt(i915), reg.reg)) & mask) == value,
>-			slow_timeout_ms);
>+	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
>+			      fast_timeout_us + 1000 * slow_timeout_ms,
>+			      out_value, false);
> }
>
> static inline int
>diff --git a/scripts/package/buildtar b/scripts/package/buildtar
>index 65b4ea502962..fee5b9d3b171 100755
>--- a/scripts/package/buildtar
>+++ b/scripts/package/buildtar
>@@ -51,7 +51,7 @@ fi
> #
> cp -v -- "${objtree}/System.map" "${tmpdir}/boot/System.map-${KERNELRELEASE}"
> cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
>-cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>+#cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"


leftover from debugging?

Lucas De Marchi

>
>
> #
>-- 
>2.34.1
>
