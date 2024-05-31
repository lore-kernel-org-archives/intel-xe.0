Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C794CC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 15:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F3110E10C;
	Fri, 31 May 2024 15:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3+m33kP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A9910E10C
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717169268; x=1748705268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zX7NflBcni4MY3CLoR372SOG4TZ2KvMvhXKktNfAbVk=;
 b=C3+m33kPeLGr6U5Jx7+gpgX9A/2NpQIHbHT2qxr4DA99oRhdDwctRWtF
 6M3IvOdiSxRJtCKynvs+KWPhLBcWtMG6maJ54ExFyNqBA/S46B6Oyu8fQ
 IITT3eoDSC3qdpajEv3SvmnBYfKpxI8D+61mtu3wGQVv/GF9qx8mXIIL0
 X3Yej39DJb4qBXBlEPEc9Fz0yqdvyL+TVQ3WyOPhJ5GxqWAikL94qDbC3
 8Y/svqoiqaH00ypmnmILUkBqaDFbYvXjZ6jECD18MnBUJ6SsiPrl7JwZu
 r8IcywZ5TtYxYZdGZaLPL6sn1G7u9SZyNlEIVZ0ZloE3iyEr6mFXYP7RG g==;
X-CSE-ConnectionGUID: cVM+cCnjSDC638Ax31D9YA==
X-CSE-MsgGUID: X1skg6zGTdCk4Bu8LpfVjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24380551"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="24380551"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:27:48 -0700
X-CSE-ConnectionGUID: 2raMW/ULS8OYv4NL52iKtQ==
X-CSE-MsgGUID: /FfgdRcYTWqv6yh8idjDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36275163"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 08:27:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 08:27:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 08:27:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 08:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejpuQ3QeTWcF7+uHbUc10jN2SVmFSpP7FnAsHUPRX1imhYs8SftJbWCK2dtn6MlUqSIv6v/OLQ9ge1d1OtRag4b04fNph3S0rZ9aoBrfxa+8OrxGdGNdleE53lwavcnrl0MDy7jerCiViTsAKHxB5P5BleW9Ikx5bd1GdqCp8Jgb+hvQ0C9cQnACNiJaco12Z6qyr4ojTQjScYmq8StMZfzPjRPNHlI3Xv/gt78w2wJwc8sbdVo4AvVAKn3U5rKXv9QJAFhU/ZSGP10Xx/QoWwA61r8NmWuhtTA7pCCTUgY4YoJnWYf+bhX33SUqdPEMva+wBLgJrYK6oMlppkrDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MovwIu9rf4YKhn8PFjUKDNuu1gpWggtZqfJHc89Z9B0=;
 b=duMztJUEgLQsMCkR8/w0Qixv5GRdEkWpBfjPVHLn4SkUZ4e0i8kLEMUiTZKxuU+vzDVycIZIYEEEqAKCcZ2Fk5++0GbtqBC8HMZncuH5G4lGd9tCVWxl8He5b8LKkzpx8u8XFbNTHA6VnFfpN9iKmXg00IGUR9wv6ajDCunSlfIwlmN+dPmD6EQT8qogYV8c9P2xzVvsPuSFQ0m9yPYFqUscQl5An0NCkvB3pWJ0tkYSamNaunEmSqwVwv5/daYMaeM0vgOZxT1FACi0JeYnXR4b/Fa4GaT6G5InJU9cgKG1mpYjzuQknzF6xY2VSNP3xzGTEElAjYfCvUttwZyn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7819.namprd11.prod.outlook.com (2603:10b6:610:125::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 15:27:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 15:27:45 +0000
Date: Fri, 31 May 2024 11:27:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add member supported_domains to xe_force_wake
Message-ID: <ZlnsbdJz0-FIX6HS@intel.com>
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: c63b5652-69a6-4398-effc-08dc81863833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?60sk17ld71wcXwHPqYEj+oueC8NXz0qlxaQNTv767/bGlvqhK5Dioq5zFwdp?=
 =?us-ascii?Q?Ux60FH6Cgu+V24DXgR71XV3FXBRMzFH6K6BbYaYElSqhI/n55rivtw4ytBDl?=
 =?us-ascii?Q?Qr+DdTwUmG9qs2oJQFJ4dVpcIOAk2vmHq+SrwDe1f11P0u2I6kQu4UWohVYA?=
 =?us-ascii?Q?lhRrcedp8xffFpbB9+jL1TMIsXny60E1tG3N49n7HBI5oK3wyR8PnD3FbM4D?=
 =?us-ascii?Q?TUiu09xtMhITmr8hQMncynIkZR8az8QO23NlytYSLq4K6doOSLl+w/tOwk6X?=
 =?us-ascii?Q?qamDs8DhMtHBhKY+PNPlkM1JLvlFoyyG/1VKPJ/Wbmp6STxR/1FpFNHooeNK?=
 =?us-ascii?Q?ISIvzrykHKC60JmsKbek+GORk38A3gxVXSqW5P7YNNlsijtC4dAXEhNT7mqq?=
 =?us-ascii?Q?/PtjELF4XLiBtDj2Ts4pJW3b0uGrWQRmmMBjEIBgKVHvl6nHzRQHWyaufXQC?=
 =?us-ascii?Q?hCvJHDVcxLPv1PhC/jwRXAZgKXsjzzf4IOqP8G0bKbyfUOXDVPDIbs83vkmy?=
 =?us-ascii?Q?dmKsdkUAMDNIuqUA2UOsCRqUNsnp6Prb97fcgYYq++d0j6yaKhshdjFwS578?=
 =?us-ascii?Q?eIze8pUMVPsdy/xLTfGhLSY7Nd7ww4SvohitxhfxTplojoDXiBBQ0uSR6l+l?=
 =?us-ascii?Q?13OTUEoCifBSfVLW8dHQDFlPw636rdPXfq9eeQecgQ/9zEKHKilHZ36C5Ihv?=
 =?us-ascii?Q?W3JuM9KAamTPEJk7tmm2uRy51meqnnn1EnSw9Maeh2zdP8f6WNWjTXJGr7m0?=
 =?us-ascii?Q?kwgZaO0JiwaX9w7C4X2s1y8GENlFyhHu2qQWAQhE3XvzO+3dtY1iJz7RU3Vt?=
 =?us-ascii?Q?dlS4/2v4cgjs2IluI0ViGmeCxZYKE9AXhhQLiKMErrNJMLTcLB17Vo2sYGeI?=
 =?us-ascii?Q?rvhPLOIOsxApoWAh0KlNrUCCf8ZtdB0Q30LaS9FHfWEW9QdhI9Vp9VrPKFDM?=
 =?us-ascii?Q?8SrUQ0VlnR01aplEVY5c0Fr3ezdQxRaglJj8YFCztKZGvCCpqdrJ9J5ghEJ8?=
 =?us-ascii?Q?lgzii7cU+V37gbH0tomDml7dHVHPlnhI5D6F35qJJNlRlQtPVihRq27OpPD2?=
 =?us-ascii?Q?hwQDFZc3eV13h3VaTdBP0uyO0MX25EW3lumtdWcqPSjZyh/CD5ucRfEw7lP8?=
 =?us-ascii?Q?54nlZHOyQ9fbfDEJMtPfjimirDxCWucoiXnKrh1zZoMsHSlGTgvi8mmwaO5r?=
 =?us-ascii?Q?fyVe6tLApc0uDBTZ1tigL7AozcspE3tHBKYGYYECOM+VzoQk9gGJhxH+6Mz3?=
 =?us-ascii?Q?NEayuCywgCS+878ZwZh/Uzd1Sc1ifVi/K2TFPGvaQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xOfEABPz75lb+u0tBonaYLvTl2qOGReV85i5nMxFgxL7ocfFmXEIsKldO0fu?=
 =?us-ascii?Q?Wnxgs39A8Ej0BWERkXaUuYYLWoOoH+AQfYyV6vxj5ovnetXqW76Lr+BSZAUd?=
 =?us-ascii?Q?UdWQ7WDuO0rexaxqXTgO3AIvRrRFp5V8xFUCHY4eac4UWw7uCw4mp+64jcll?=
 =?us-ascii?Q?haXA/M5hhci0baXIzuwK9qreGrrFbo1BKY2ntZVGui7wYGcwIeoxWKIA+Vsf?=
 =?us-ascii?Q?Z4ccumEjgz/TmK3BaQnxeXCYP/i8ge2QCgf2Iv21l4xRIpqEhEX/cyHgdPUw?=
 =?us-ascii?Q?dGwZYkb4YnYCGLurcoD8nXSecYV9tIuFMofoRWRzCJ4PlSUMxpgTOXRo/gV4?=
 =?us-ascii?Q?hzgfHFySnQQKaBsksT7FCS2yJbOOcvS4zHsy0PGnLVG33Z1RNfAdYvoCnrU7?=
 =?us-ascii?Q?+E40RaaBCcCkW11ID0cayR4GFnifZfb7ty3a+XnWcHCQFBPa9XYXvG9HRJ7y?=
 =?us-ascii?Q?XQGAdZYs7/bMq+REwJgBgRhAxH/8Ika5wP/0oxEcewjrQdGAPQxZnH7u4PIn?=
 =?us-ascii?Q?oZjDd+xenve0AyfDlMLxSlbrAVqIbL/qoiAB9DWo+3o8ycpO1EkYal0LR/Wz?=
 =?us-ascii?Q?OLxsieS/wZ4oRoek/avA9euS/KcCXWrewBbnmnXbqn70cIMKfRVuMr9oS3Gt?=
 =?us-ascii?Q?3ODSo7EcO0GmGvb8ygkOD5zw422eudIg9j9UiqbJuYdHl8++CqVt45WEg8g5?=
 =?us-ascii?Q?UJqdP++xUqD5BQs57W5IvNCVD8lr6lU/mMHyuDBoD/uPgX+1mcuAxfH38c2p?=
 =?us-ascii?Q?Rop1DtDGvHoD496AJuCcX36Tv496Oty5GWXkDYrSxkAoQLjawzJ+8unZh7hR?=
 =?us-ascii?Q?lNGmGM9qr1Dl7CmLoPIeZ9witwQDbzk2pIsw1jYWO7L29R1aWXwZlZRW3SaR?=
 =?us-ascii?Q?IaJlzuPWBowZCG8EfMCxvAxdj0ZCYqWxi9UbnSx3ftuYtZjJFbAYsYQwDc+g?=
 =?us-ascii?Q?z+98pug8g767tP8oDztoMV8jl24BBJb/alPsDqfasECNrSxOViheXUq2H9Wu?=
 =?us-ascii?Q?aTiEZztc19iDhGvAhIj7OIyFBP1IPhWEfkRnzeYWswb+q99uTTw0AguZj45R?=
 =?us-ascii?Q?Itwt/4FALoNhmSX7EDPfoJA6jvXino4OoV+qCh8jCELhL41FarKPagh9wODZ?=
 =?us-ascii?Q?mm4KyPQeahFxUD/SIw5cFoSeVfRMg19zR7J9mtXLuWG32rx5xHx5n2cC+4H3?=
 =?us-ascii?Q?MMBf29kCZk0yVYw3zhLhYSC3TJEUVZopwkf0o/2kVJP70MouOz5F7ysyGdR3?=
 =?us-ascii?Q?SJfiHDahO9pZXUXxEtKVBUtE1tkFybAa53R59Vr1TXiODJPt/ZpilgW36DN6?=
 =?us-ascii?Q?qix4uLwhy8pi7S6YFs/bnBnti9e3qswklX+TAFNS8aBSDHSn7x3Fk50/KLbc?=
 =?us-ascii?Q?uFR5xDy8TNuQRWN0LZ1IK3smLPCcYOL6ahKbE+bEXStgbPS8ljSVEXMgsN62?=
 =?us-ascii?Q?yjwNVszGJYfe51JJBaHYhOGauI/Y8EFXwVOgw5TueEaazcgAV7pp+pL0vemb?=
 =?us-ascii?Q?Y4udq+0D1Bsr6n2HdN5CSx2HPd2HarLGzOrv9lKElzUvdgZuk3knjI1X0ced?=
 =?us-ascii?Q?CxEAjEyZUl92hcSVKdGQliY3DsoyWaqmArWm5u9R?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c63b5652-69a6-4398-effc-08dc81863833
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 15:27:44.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRxAxe8dwquEkiJZoaEsyXQHMnuSJg9gwQmkHI+jqcIXca+ck9BUdqq2C6Iq2S6ALAkZi7cP1mzJYwfj9oCNUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7819
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

On Fri, May 31, 2024 at 12:18:44PM +0530, Himal Prasad Ghimiray wrote:
> This field serves as a bitmask representing all supported forcewake
> domains on the GT.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c       | 48 ++++++++++++------------
>  drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +
>  2 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 9bbe8a5040da..a2947f0046d4 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -26,15 +26,25 @@ fw_to_xe(struct xe_force_wake *fw)
>  	return gt_to_xe(fw_to_gt(fw));
>  }
>  
> -static void domain_init(struct xe_force_wake_domain *domain,
> +static inline void mark_domain_supported(struct xe_force_wake *fw,
> +					 enum xe_force_wake_domain_id id)
> +{
> +	fw->supported_domains |= BIT(id);
> +}
> +
> +static void domain_init(struct xe_force_wake *fw,
>  			enum xe_force_wake_domain_id id,
>  			struct xe_reg reg, struct xe_reg ack, u32 val, u32 mask)
>  {
> +	struct xe_force_wake_domain *domain = &fw->domains[id];
> +
>  	domain->id = id;
>  	domain->reg_ctl = reg;
>  	domain->reg_ack = ack;
>  	domain->val = val;
>  	domain->mask = mask;
> +
> +	mark_domain_supported(fw, id);
>  }
>  
>  void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> @@ -48,17 +58,11 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>  
>  	if (xe->info.graphics_verx100 >= 1270) {
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> -			    XE_FW_DOMAIN_ID_GT,
> -			    FORCEWAKE_GT,
> -			    FORCEWAKE_ACK_GT_MTL,
> -			    BIT(0), BIT(16));
> +		domain_init(fw, XE_FW_DOMAIN_ID_GT, FORCEWAKE_GT,
> +			    FORCEWAKE_ACK_GT_MTL, BIT(0), BIT(16));
>  	} else {
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> -			    XE_FW_DOMAIN_ID_GT,
> -			    FORCEWAKE_GT,
> -			    FORCEWAKE_ACK_GT,
> -			    BIT(0), BIT(16));
> +		domain_init(fw, XE_FW_DOMAIN_ID_GT, FORCEWAKE_GT,
> +			    FORCEWAKE_ACK_GT, BIT(0), BIT(16));
>  	}
>  }
>  
> @@ -70,18 +74,14 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
>  
>  	if (!xe_gt_is_media_type(gt))
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
> -			    XE_FW_DOMAIN_ID_RENDER,
> -			    FORCEWAKE_RENDER,
> -			    FORCEWAKE_ACK_RENDER,
> -			    BIT(0), BIT(16));
> +		domain_init(fw, XE_FW_DOMAIN_ID_RENDER, FORCEWAKE_RENDER,
> +			    FORCEWAKE_ACK_RENDER, BIT(0), BIT(16));

Since you are here, could you please add some meaning to these undefined bits?

>  
>  	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  		if (!(gt->info.engine_mask & BIT(i)))
>  			continue;
>  
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
> -			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
> +		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>  			    FORCEWAKE_MEDIA_VDBOX(j),
>  			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
>  			    BIT(0), BIT(16));
> @@ -91,19 +91,17 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  		if (!(gt->info.engine_mask & BIT(i)))
>  			continue;
>  
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
> -			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
> +		domain_init(fw, XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>  			    FORCEWAKE_MEDIA_VEBOX(j),
>  			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
>  			    BIT(0), BIT(16));
> +
>  	}
>  
>  	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> -		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
> -			    XE_FW_DOMAIN_ID_GSC,
> -			    FORCEWAKE_GSC,
> -			    FORCEWAKE_ACK_GSC,
> -			    BIT(0), BIT(16));
> +		domain_init(fw, XE_FW_DOMAIN_ID_GSC, FORCEWAKE_GSC,
> +			    FORCEWAKE_ACK_GSC, BIT(0), BIT(16));
> +
>  }
>  
>  static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index ed0edc2cdf9f..4179fc51291e 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -79,6 +79,8 @@ struct xe_force_wake {
>  	spinlock_t lock;
>  	/** @awake_domains: mask of all domains awake */
>  	enum xe_force_wake_domains awake_domains;
> +	/** @supported_domains: mask of all supported domains */
> +	enum xe_force_wake_domains supported_domains;
>  	/** @domains: force wake domains */
>  	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>  };
> -- 
> 2.25.1
> 
