Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B24AC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 18:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C509810E7A7;
	Wed, 10 Jan 2024 18:03:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22C710E7BF
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704909785; x=1736445785;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GT9pz6hL8rWj9fCYBBmwdjqAPSYj3eJCSo38/mrMSsI=;
 b=Qe0mg+T56cQ942magAlLUP6QX9quma3zZcojhDUAfRBGqvlQO7tdAG2/
 TttKOcWlBdD9ynVN6KVF2hsenD145BPqTmcmimuJ0ZN6vUss15w3MmY8n
 ji0LaKVueMxjQ6Dcg5D6JJyYLU0N/oDDou6fhtRTnDGTB3ewchkDu1dAe
 SZR0KAF9eZsXzGXk6SaCpe8FgnqyytiU8nvMMMJhSiY6xrVkZX4V/4F/f
 k2Z8+zFATK5RzcdgKc2vv+ZBmYkNIoHYnSlB6tectoMLtFN5aZUtmdktx
 +4WuG6fqKudKbJ3zmNWC47zZLY7WdoghO0gf82XtiTtfi9MNEgvtX99G6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="20092187"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="20092187"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 10:03:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="901225043"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="901225043"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 10:03:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 10:03:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 10:03:02 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 10:03:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gtk25HdW8nnuiIjoTghjxXgLYxJLpF8GISJbagOg51CSB8r82J5YBMaFu3/7HTrLIxe9iXHNm4MxH729LMwb9+8Tt2vasUr/mKaFsgMi3C5YRA40tT4cxlW9RbmdJTCqvQUbT+yN5Mfu0+b3azxVzfjHgk3+OR19Rko1fjNH6G1btHZarl5VGo/br4ZAcQLgTEo7CMNYl+vah6a1EJwatBJbfbdz9GuJUOEUuEFZa+w21Np+QTcb8/0Al2+4q1VYHwFwIOjl6Af9AgjC0+6TI/8YJe9yrxQAkjzU40dc8T9ongGj0/Xd9sLy5roffbjHagB9tvZizbZMeZPjxhwNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx1ncWOJ8aqCaOg363S0QNQn2qLrJhMFSMitvQRwMJo=;
 b=mrgTCpLYW4RSwzsUDPOr6t95MuUJSozqFcaOVrtYql0O3V7N7R1bFMN0YL3kbe7epmFwfBBIw8yhVnRTnWhLSt0AtpX56aKKIfJXMEUuVCkaWS8ItUEgv4kKu2NVOri7NmAvkktz10EIYv6rnA5fex64VDvNFnMigSCWcc0E6euxt5N8ZZ96wjF4VQ2jv8BmHNw9L+MZazlOdpZHahQGndVRL1QyKdfV3tlMpgehJ+S7OQAnMoRHu8DZVzbHLHPMqhpNf6RssfaVEe8fQO5/v3XJhcfV+3yNs4nAW5INjy7td5KbCiUVRuY7Ot+siupAYK6Doqk5Of1lIhuS5EjAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 18:02:58 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 18:02:55 +0000
Date: Wed, 10 Jan 2024 10:02:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/xe2_lpg: Introduce performance guide changes
Message-ID: <20240110180252.GK1327160@mdroper-desk1.amr.corp.intel.com>
References: <20240110061531.780038-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240110061531.780038-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ba86ab-8236-4c3a-7c7b-08dc12065ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: itdVMeYK0qqNzjzkpUF5hcmojMnPk9ScGrXmE4AsJ1lxQA4IflfiMgu1Fp5meVIoYr+w3ne69xBeTqtd+sc/MoODEKk5X3I8MdzQhR/4GikddM6LxVHzEvUJWwH9QzV1quFhoiKSu4glfBH3HA/gP7fMFJLo8BWknvsRObZokZ0E3bPlBXCpMJNwAupNu001nfgTqJ47NUYdapcAtJLw6sRwLNfjCe9ecgJ7Fbmo2GIdI2WHgO1DvscXyRH8pd97oCPZ3n4XxEASA69cQR9zjXBjqrSwztI/JXgFlEGZxTUGd3IRWRZSZMGfwm3i11r9yTpDb1oRkx7W+qCjiUoa67bc9j1wRI2vog0WZK8n2Gv+qnNoT2C3tMepkhNGz8QQzsRqtrfpViUj/N5dOXkT19mxpa1uTaUzkakViJr2i5C8QtZh2enUpovUQ8wgRycJed4eYuyTLM0hjWP5HaRJy/i/JflDypQiQ9r8FuvRUMgxjB+j5wKzMK/7zFID6MpxtsO+xQvvOdKMJubSIG8687eCjTpYpj5VUWdnK6DTNvbZoeAjNminPxKRLQaDYbpz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(41300700001)(66946007)(33656002)(82960400001)(86362001)(1076003)(38100700002)(26005)(6512007)(6506007)(6486002)(6666004)(2906002)(66556008)(316002)(6636002)(66476007)(478600001)(8676002)(8936002)(4326008)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GABz3piZA0nufyMFLlqNVF6Bu8Wwj/Pay4BUtKbckvDHM0urMAt+Nr/uWhyf?=
 =?us-ascii?Q?xVHbICYQr4uq1BbotezYicx2y/U4sCxu6G/jB2roH6JmsFR5oZbh391+hv4S?=
 =?us-ascii?Q?atTN6TFbqMQTdm9p3shcBEMFB/zuV5028IgLgymeEphIlxAFFOqzBTwARAgF?=
 =?us-ascii?Q?fe43xh6UKrRiHyKFfQ9WVuEelfNCIIwazD4XCzlXz6i9QvHGPBLDigZgr2pe?=
 =?us-ascii?Q?OPzvBVyRDCOYqt3d4V77FHTP4U8qVuzl8P/QWcT6T0kRwhdOg9B5LkmPuDtq?=
 =?us-ascii?Q?DjIwVmlrMb5E7cRbGg6fPQvZvTLe6IgAm3e+5/ML5zjCpBXXPS+UqK4A7gQu?=
 =?us-ascii?Q?loH12J1YfwPqgLLC2qkPuEn7lt61Wpc6oaYdyrD5pOrMa6V7/IWDM2ndbhp+?=
 =?us-ascii?Q?pZh8pkpCPHHVh5XGQkhNyTjFI3tLBNC01hBvQY33AgEEAqTGVKUkdGqMlTIz?=
 =?us-ascii?Q?JLKUhIECw0LHf4Zp5G7iXA4yNTT/u3Ti4M8QOogO7Mp5uwzJvr2s16Ncutyl?=
 =?us-ascii?Q?0S16oEyHtTmUaDLf1FRVYpePWkSTAtxZ0YxqdpttiDFl38tM0ot+oEoJuVus?=
 =?us-ascii?Q?3dkqGgD80dsJTAPyNf9v/EnXlWXPdittNNqjFQz2mlwU6xmUWqBtZf0McR0O?=
 =?us-ascii?Q?dUBarcvJvNRPVZNJa0e7+xw6zB8x8nbXFQOTbDZR0qOAw3BpkGP5GpXi2UHd?=
 =?us-ascii?Q?24FNFZHogZQCygXaFStHXV9q0hXfQxw7qG7DTd19d8g07246YbOd09Otki2r?=
 =?us-ascii?Q?+rc8IkkhPfOEH+pc83yaW+FPScTnQKqJxG1U+JXybrw5Vcke8OM84S9fradv?=
 =?us-ascii?Q?XzvMLVSrkmVVk5v+AIZEGiylUofVc/HQdG4jXez/+yputW9s7heGjVd0Oz2Y?=
 =?us-ascii?Q?myxIMEAp4zYqAmCrGdTAYI71H5njmf8y2gcnXa52QX5Rm/w3toebCLA8uhC0?=
 =?us-ascii?Q?jRRtR+zlIW0JJafalhI8xqivURFzxQL+a0VbCA1Y1hZxYD3zk9Aqb/1C60Xe?=
 =?us-ascii?Q?9bCqVad/RxTJOlUiNNzJ7DxCtv4jmz1v/ViS+bszymCChKLZazJxpwOeFtFo?=
 =?us-ascii?Q?EOong021tPgQmX9Ul8tzP+jauWVlA7NJkun8D7Ms6h8NWp58I24AqCa1VkcO?=
 =?us-ascii?Q?nN5Lgcjyv2E3STkNgZHHYqp1FIb6+k6YZfI6wUvvc2FebaHqH8Rvl4wl99IR?=
 =?us-ascii?Q?SoegXqHADcHJBLEvWPUXAYrzejkxzEaaUlbQf6t4JE+cjGnBJbnISNr0jLbr?=
 =?us-ascii?Q?WDifQZnthbrdt9LoNy9wSPHb7M/lBlV5fSBDU7xm8czO5KKdwOLML2ciWtwm?=
 =?us-ascii?Q?w2tT8/aLJscwuodPKaGxAWwHnTy221jz7Jo0FzWRRWMNHqye2dtHfqLQeGmv?=
 =?us-ascii?Q?+ISmJsajWYNVZdZsB0nLHfnfprcgzKy3h2pGrlUzk1Hrr1ZaEZAwAeTO1bLG?=
 =?us-ascii?Q?clPbdCEij4JY/n1ZiA1oluB+3pFTUAHhlXlEk5nOaYxcysrZq9+uCnU83eLF?=
 =?us-ascii?Q?3M2wbIToSTUNqBuNOIjOFzrgWxXnJ9BGdknixLbVJCi6vGsH73Crw8GQ7Pwn?=
 =?us-ascii?Q?pPHUkU91JO19CL9PizLdbxZroXiOWED+KED5Xf4/3mwuxVvSesOYg8zd/1A5?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ba86ab-8236-4c3a-7c7b-08dc12065ef1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 18:02:55.3084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKG2wKD6goA0QChWj7u1sqU4wOwjJkXaxHPI5uhbHm9qXsakEVOQ59Hd6ijvCKFjFEcCUgdpQuLIIqjAE2iUT/lTICyOxrodSk/7xD1KGJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
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

On Wed, Jan 10, 2024 at 11:45:30AM +0530, Shekhar Chauhan wrote:
> Add various performance guide changes to Xe2LPG.
> 
> BSpec: 72161
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 15 ++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4017319c6300..77dd11be9816 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -144,6 +144,10 @@
>  
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>  
> +#define CCCHKNREG1				XE_REG_MCR(0x8828)
> +#define   COMPOVFDIS				REG_BIT(25)

I don't see this bit defined in this register on page 59251.  There's
just a generic placeholder field from 31:24 for extra chicken bits.

> +#define   ENCOMPPERFFIX				REG_BIT(18)
> +
>  /* Fuse readout registers for GT */
>  #define XEHP_FUSE4				XE_REG(0x9114)
>  #define   CFEG_WMTP_DISABLE			REG_BIT(20)
> @@ -289,12 +293,17 @@
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> +#define L3SQCREG3				XE_REG_MCR(0xb108)
> +#define   COMPPWOVERFETCHEN			REG_BIT(28)
> +
>  #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>  
>  #define XEHP_L3SCQREG7				XE_REG_MCR(0xb188)
>  #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
>  
> +#define L3SCRUB_LBCF_GFX			XE_REG_MCR(0xb18c)
> +
>  #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
>  
>  #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 53ccd338fd8c..c0bc86f131a7 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -37,7 +37,20 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
> -
> +	{ XE_RTP_NAME("Tuning: L3 Scrubber Parameters"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SCRUB_LBCF_GFX, 0x1006))

It's a bit unclear whether this setting applies to Xe2 or not.  It was a
setting added to that bspec page for PVC, but the way they tagged the
row has made it unclear which other platform(s) it should also apply
to; we may want to check on that offline before trying to adjust this
setting.

Also, even though the bspec people are sometimes lazy and just slap a
raw hex value on the tuning page, it's better if we still define the
specific bits we're changing.  That way we can confirm on future
platforms that the bits still have the same meaning and still apply (and
we won't accidentally clobber any unrelated bits if there are changes
elsewhere in the register between platforms.

> +	},
> +	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(CCCHKNREG1,
> +			     COMPOVFDIS |
> +			     ENCOMPPERFFIX)),

As noted above, I don't see any mention of COMPOVFDIS / bit 25 on the
tuning page.  However there are actually two different rows for this
same register in the table which just differ based on the value of bit
18, and in theory we're supposed to select between them based on
characteristics of the platform SKU.  We don't have a good way to
directly determine those characteristics directly in code, but LNL SKUs
should correspond to the rightmost column on bspec 71051, which in turn
implies that we want the first setting (the "disable" row).


> +	},
> +	{ XE_RTP_NAME("Tuning: Compressible Partial Write Overfetch Optimization"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
> +	},

This is another one where the bspec tagging isn't really handled right.
Reading through the backstory, it sounds like it's probably correct to
apply this to Xe2, although I've requested confirmation on the
associated record.  We can go forward with this one, but keep an eye on
the ticket in case we get a response that says otherwise.


Matt

>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
